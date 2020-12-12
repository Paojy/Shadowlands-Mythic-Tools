local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local font = G.Font

--[[------------------------
--     Group Inspect     --
------------------------]]--

party_cd = LibStub("AceAddon-3.0"):NewAddon("party_cd")

if not party_cd then return end

party_cd.Roster = {}
party_cd.Frames = {}
party_cd.WatchCD = {}

local spell_types = {
	"INTERRUPT",
	"HARDCC",
	"SOFTCC",
	"STHARDCC",
	"STSOFTCC",
	"DISPEL",
	"DEFMDISPEL",
	"EXTERNAL",
	"HEALING",
	"UTILITY",
	"PERSONAL",
	"IMMUNITY",
	"DAMAGE",
	"TANK",
}

local spell_types_2 = {
	["INTERRUPT"] = 1,
	["HARDCC"] = 1,
	["SOFTCC"] = 1,
	["STHARDCC"] = 1,
	["STSOFTCC"] = 1,
	["DISPEL"] = 1,
	["DEFMDISPEL"] = 1,
	["EXTERNAL"] = 2,
	["HEALING"] = 2,
	["UTILITY"] = 2,
	["PERSONAL"] = 2,
	["IMMUNITY"] = 2,
	["DAMAGE"] = 2,
	["TANK"] = 2,
}

if not party_cd.events then
	party_cd.events = LibStub("CallbackHandler-1.0"):New(party_cd)
end

-- Class/Spec ID List
local DK = {ID=6, name="DEATHKNIGHT", Blood=250, Frost=251, Unholy=252}
local DH = {ID=12, name="DEMONHUNTER", Havoc=577, Veng=581}
local Druid = {ID=11, name="DRUID", Balance=102, Feral=103, Guardian=104, Resto=105}
local Hunter = {ID=3, name="HUNTER", BM=253, MM=254, SV=255}
local Mage = {ID=8, name="MAGE", Arcane=62, Fire=63, Frost=64}
local Monk = {ID=10, name="MONK", BRM=268, WW=269, MW=270}
local Paladin = {ID=2, name="PALADIN", Holy=65, Prot=66, Ret=70}
local Priest = {ID=5, name="PRIEST", Disc=256, Holy=257, Shadow=258}
local Rogue = {ID=4, name="ROGUE", Sin=259, Outlaw=260, Sub=261}
local Shaman = {ID=7, name="SHAMAN", Ele=262, Enh=263, Resto=264}
local Warlock = {ID=9, name="WARLOCK", Affl=265, Demo=266, Destro=267}
local Warrior = {ID=1, name="WARRIOR", Arms=71, Fury=72, Prot=73}

local AllClasses = {
    [DK.name] = DK, [DH.name] = DH, [Druid.name] = Druid, [Hunter.name] = Hunter,
    [Mage.name] = Mage, [Monk.name] = Monk, [Paladin.name] = Paladin,
    [Priest.name] = Priest, [Rogue.name] = Rogue, [Shaman.name] = Shaman,
    [Warlock.name] = Warlock, [Warrior.name] = Warrior
}


--[[
	GetSpecializationInfoForClassID(classID, specNum)
	
	1战士 狂暴72 武器71 防御73
	2骑士 惩戒70 神圣65 防护66
	3猎人 射击254 野兽253 生存255
	4盗贼 刺杀259 战斗260 敏锐261
	5牧师 戒律256 暗影258 神圣257
	6死骑 鲜血250 冰霜251 邪恶252
	7萨满 元素262 增强263 恢复264
	8法师 奥术62 火焰63 冰霜64
	9术士 痛苦265 恶魔266 毁灭267
	10武僧 酒仙268 织雾270 踏风269
	11XD 平衡102 野性103 守护104 恢复105
	12DH 浩劫577 复仇581
]]--

local function UpdateCDBar(tag, name)
	for i = 1, #party_cd.Frames do
		local f = party_cd.Frames[i]
		if tag == "all" then
			f.point()
			f.update_unit()
			f.lineup()
			f.update_cd()
		elseif tag == "cd" then
			f.update_cd()
		end
	end
end

local function UpdateCD(name, spellID)
	for i = 1, #party_cd.Frames do
		local f = party_cd.Frames[i]
		if f.name and f.name == name then
			f.update_cd(spellID)
		end
	end
end

local function StaticMod(type, value)
    return { type = "Static", [type] = value }
end

local CDWatch = CreateFrame("Frame", nil, UIParent)
CDWatch:SetScript("OnEvent", function() end)
CDWatch:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

local function CastDeltaMod(watched_spellID, arg_spellID, arg_delta)
	CDWatch:HookScript("OnEvent", function(self, event, ...)
		if event == "COMBAT_LOG_EVENT_UNFILTERED" then
			local Time_stamp, Event_type, _, SourceGUID, SourceName, _, _, DestGUID, DestName, _, _, SpellID, SpellName = CombatLogGetCurrentEventInfo()			
			if Event_type == "SPELL_CAST_SUCCESS" and arg_spellID == SpellID then
				local player = string.split("-", SourceName)
				if party_cd['WatchCD']['CastDelta'] and party_cd['WatchCD']['CastDelta'][watched_spellID] and party_cd['WatchCD']['CastDelta'][watched_spellID][player] then
					if party_cd['Roster'][player][watched_spellID]["start"] then
						party_cd['Roster'][player][watched_spellID]["start"] = party_cd['Roster'][player][watched_spellID]["start"] + arg_delta
						UpdateCD(player, watched_spellID)
					end
				end
			end
		end
	end)
	return { type = "CastDelta" }
end

local function DispelMod(watched_spellID)
	CDWatch:HookScript("OnEvent", function(self, event, ...)
		if event == "COMBAT_LOG_EVENT_UNFILTERED" then
			local Time_stamp, Event_type, _, SourceGUID, SourceName, _, _, DestGUID, DestName, _, _, SpellID, SpellName = CombatLogGetCurrentEventInfo()
			if Event_type == "SPELL_DISPEL" and SpellID == watched_spellID then
				local player = string.split("-", SourceName)
				if party_cd['WatchCD']['Dispel'] and party_cd['WatchCD']['Dispel'][watched_spellID] and party_cd['WatchCD']['Dispel'][watched_spellID][player] then
					party_cd['Roster'][player][watched_spellID]["start"] = GetTime()
					UpdateCD(player, watched_spellID)
				end
			end
		end
	end)
	return { type = "Dispel" }
end

local function modCapTotem(watched_spellID)
	CDWatch:HookScript("OnEvent", function(self, event, ...)
		if event == "COMBAT_LOG_EVENT_UNFILTERED" then
			local Time_stamp, Event_type, _, SourceGUID, SourceName, _, _, DestGUID, DestName, _, _, SpellID, SpellName = CombatLogGetCurrentEventInfo()
			if Event_type == "SPELL_SUMMON" and SpellID == 192058 then
				local player = string.split("-", SourceName)
				if party_cd['Roster'][player] then
					party_cd['Roster'][player][192058]["totem"] = DestGUID
					party_cd['Roster'][player][192058]["hit"] = 0
				end
			elseif Event_type == "SPELL_AURA_APPLIED" and SpellID == 118905 then
				for name, info in pairs(party_cd['Roster']) do
					if info[192058] and info[192058]["totem"] == SourceGUID and party_cd['WatchCD']['CapTotem'] and party_cd['WatchCD']['CapTotem'][watched_spellID][name] then
						if info[192058]["hit"] < 4 then
							info[192058]["hit"] = info[192058]["hit"] + 1
							party_cd['Roster'][name][192058]["start"] = party_cd['Roster'][name][192058]["start"] - 5
							UpdateCD(name, 192058)
						end
					end
				end
			end
		end
	end)
	return { type = "CapTotem" }
end
 
local function modShockwave(watched_spellID)
	CDWatch:HookScript("OnEvent", function(self, event, ...)
		if event == "COMBAT_LOG_EVENT_UNFILTERED" then
			local Time_stamp, Event_type, _, SourceGUID, SourceName, _, _, DestGUID, DestName, _, _, SpellID, SpellName = CombatLogGetCurrentEventInfo()			
			if Event_type == "SPELL_CAST_SUCCESS" and SpellID == 46968 then
				local player = string.split("-", SourceName)
				if party_cd['Roster'][player] and party_cd['Roster'][player][46968] then
					party_cd['Roster'][player][46968]["hit"] = 0
				end
			elseif Event_type == "SPELL_AURA_APPLIED" and SpellID == 132168 then
				local player = string.split("-", SourceName)
				if party_cd['Roster'][player] and party_cd['Roster'][player][46968] and party_cd['WatchCD']['Shockwave'] and party_cd['WatchCD']['Shockwave'][watched_spellID][player] then
					party_cd['Roster'][player][46968]["hit"] = party_cd['Roster'][player][46968]["hit"] + 1
					if party_cd['Roster'][player][46968]["hit"] == 3 then
						party_cd['Roster'][player][46968]["start"] = party_cd['Roster'][player][46968]["start"] - 15
						UpdateCD(player, 46968)
					end
				end
			end
		end
	end)
	return { type = "Shockwave" }
end

local function modGuardianSpirit(watched_spellID)
	CDWatch:HookScript("OnEvent", function(self, event, ...)
		if event == "COMBAT_LOG_EVENT_UNFILTERED" then
			local Time_stamp, Event_type, _, SourceGUID, SourceName, _, _, DestGUID, DestName, _, _, SpellID, SpellName = CombatLogGetCurrentEventInfo()
			if Event_type == "SPELL_HEAL" and SpellID == 48153 then
				local player = string.split("-", SourceName)
				if party_cd['Roster'][player] and party_cd['Roster'][player][47788] then
					party_cd['Roster'][player][47788]["healed"] = true
				end
			elseif Event_type == "SPELL_AURA_REMOVED" and SpellID == 47788 then
				local player = string.split("-", SourceName)
				if party_cd['Roster'][player] and party_cd['Roster'][player][47788] and party_cd['WatchCD']['GuardianSpirit'] and party_cd['WatchCD']['GuardianSpirit'][watched_spellID] and party_cd['WatchCD']['GuardianSpirit'][watched_spellID][player] then
					if not party_cd['Roster'][player][47788]["healed"] then
						party_cd['Roster'][player][47788]["start"] = GetTime()
						party_cd['Roster'][player][47788]["dur"] = 60
						UpdateCD(player, 47788)
					end
					party_cd['Roster'][player][47788]["healed"] = false
					party_cd['Roster'][player][47788]["dur"] = 180
				end
			end
		end
	end)
	return { type = "GuardianSpirit" }
end

local function EventRemainingMod(watched_spellID, type, arg_spellID, arg_cd, base_cd)
	CDWatch:HookScript("OnEvent", function(self, event, ...)
		if event == "COMBAT_LOG_EVENT_UNFILTERED" then
			local Time_stamp, Event_type, _, SourceGUID, SourceName, _, _, DestGUID, DestName, _, _, SpellID, SpellName = CombatLogGetCurrentEventInfo()
			if Event_type == type and SpellID == arg_spellID then
				local player = string.split("-", SourceName)
				if party_cd['Roster'][player] and party_cd['Roster'][player][watched_spellID] and party_cd['WatchCD']['EventRemaining'] and party_cd['WatchCD']['EventRemaining'][watched_spellID] and party_cd['WatchCD']['EventRemaining'][watched_spellID][player] then
					party_cd['Roster'][player][watched_spellID]["start"] = GetTime()
					party_cd['Roster'][player][watched_spellID]["dur"] = arg_cd
					UpdateCD(player, watched_spellID)
					party_cd['Roster'][player][watched_spellID]["dur"] = base_cd
				end
			end
		end
	end)
	return { type = "EventRemaining" }
end

local specIDToSpenderInfo = {
    [DK.Blood] = {[49998]= -4.5},
}

local function ResourceSpendingMods(watched_spellID, specID)
	CDWatch:HookScript("OnEvent", function(self, event, ...)
		if event == "COMBAT_LOG_EVENT_UNFILTERED" then
			local Time_stamp, Event_type, _, SourceGUID, SourceName, _, _, DestGUID, DestName, _, _, SpellID, SpellName = CombatLogGetCurrentEventInfo()
			local spenderInfo = specIDToSpenderInfo[specID]
			if Event_type == "SPELL_CAST_SUCCESS" and spenderInfo[SpellID] then				
				local player = string.split("-", SourceName)
				if party_cd['Roster'][player] and party_cd['Roster'][player][watched_spellID] and party_cd['WatchCD']['ResourceSpending'] and party_cd['WatchCD']['ResourceSpending'][watched_spellID] and party_cd['WatchCD']['ResourceSpending'][watched_spellID][player] then
					if party_cd['Roster'][player][watched_spellID]["start"] then
						party_cd['Roster'][player][watched_spellID]["start"] = party_cd['Roster'][player][watched_spellID]["start"] + spenderInfo[SpellID]
						UpdateCD(player, watched_spellID)
					end
				end
			end
		end
	end)
	return { type = "ResourceSpending" }
end

local typeToTrackedSpells = {}

typeToTrackedSpells["INTERRUPT"] = {
    {spellID=183752, class=DH, baseCD=15}, -- Consume Magic
    {spellID=47528, class=DK, baseCD=15}, -- Mind Freeze
    {spellID=91802, specs={DK.Unholy}, baseCD=30}, -- Shambling Rush
    {spellID=78675, specs={Druid.Balance}, baseCD=60}, -- Solar Beam
    {spellID=106839, specs={Druid.Feral,Druid.Guardian}, baseCD=15}, -- Skull Bash
    {spellID=147362, specs={Hunter.BM, Hunter.MM}, baseCD=24}, -- Counter Shot
    {spellID=187707, specs={Hunter.SV}, baseCD=15}, -- Muzzle
    {spellID=2139, class=Mage, baseCD=24}, -- Counter Spell
    {spellID=116705, specs={Monk.WW, Monk.BRM}, baseCD=15}, -- Spear Hand Strike
    {spellID=96231, specs={Paladin.Prot, Paladin.Ret}, baseCD=15}, -- Rebuke
    {spellID=15487, specs={Priest.Shadow}, baseCD=45, modTalents={[41]=StaticMod("sub", 15)}}, -- Silence
    {spellID=1766, class=Rogue, baseCD=15}, -- Kick
    {spellID=57994, class=Shaman, baseCD=12}, -- Wind Shear
    {spellID=19647, class=Warlock, baseCD=24}, -- Spell Lock
    {spellID=6552, class=Warrior, baseCD=15}, -- Pummel
}

typeToTrackedSpells["HARDCC"] = {
    {spellID=179057, specs={DH.Havoc}, baseCD=60, modTalents={[61]=StaticMod("mul", 0.666667)}}, -- Chaos Nova
    {spellID=119381, class=Monk, baseCD=60, modTalents={[41]=StaticMod("sub", 10)}}, -- Leg Sweep
    {spellID=192058, class=Shaman, baseCD=60, modTalents={[33]= modCapTotem(192058) }}, -- Capacitor Totem
    {spellID=30283, class=Warlock, baseCD=60, modTalents={[51]=StaticMod("sub", 15)}}, -- Shadowfury
    {spellID=46968, specs={Warrior.Prot}, baseCD=40, modTalents={[52]=modShockwave(46968)}}, -- Shockwave
    {spellID=20549, race="Tauren", baseCD=90}, -- War Stomp
    {spellID=255654, race="HighmountainTauren", baseCD=120}, -- Bull Rush
}

typeToTrackedSpells["SOFTCC"] = {
    {spellID=202138, specs={DH.Veng}, baseCD=90, reqTalents={53}}, -- Sigil of Chains
    {spellID=207684, specs={DH.Veng}, baseCD=90}, -- Sigil of Misery
    {spellID=202137, specs={DH.Veng}, baseCD=60, modTalents={[52]=StaticMod("mul", 0.8)}}, -- Sigil of Silence
    {spellID=108199, specs={DK.Blood}, baseCD=120, modTalents={[52]=StaticMod("sub", 30)}}, -- Gorefiend's Grasp
    {spellID=207167, specs={DK.Frost}, baseCD=60, reqTalents={33}}, -- Blinding Sleet
    {spellID=132469, class=Druid, baseCD=30, reqTalents={43}}, -- Typhoon
    {spellID=102359, class=Druid, baseCD=30, reqTalents={42}}, -- Mass Entanglement
    {spellID=99, specs={Druid.Guardian}, baseCD=30}, -- Incapacitating Roar
    {spellID=236748, specs={Druid.Guardian}, baseCD=30, reqTalents={22}}, -- Intimidating Roar
    {spellID=102793, specs={Druid.Resto}, baseCD=60}, -- Ursol's Vortex
    {spellID=109248, class=Hunter, baseCD=30, reqTalents={53}}, -- Binding Shot
    {spellID=116844, class=Monk, baseCD=45, reqTalents={43}}, -- Ring of Peace
    {spellID=8122, specs={Priest.Disc,Priest.Holy}, baseCD=60, modTalents={[41]=StaticMod("sub", 30)}}, -- Psychic Scream
    {spellID=8122, specs={Priest.Shadow}, baseCD=60}, -- Psychic Scream
    {spellID=204263, specs={Priest.Disc,Priest.Holy}, baseCD=45, reqTalents={43}}, -- Shining Force
    {spellID=51490, specs={Shaman.Ele}, baseCD=45}, -- Thunderstorm
}

typeToTrackedSpells["STHARDCC"] = {
    {spellID=211881, specs={DH.Havoc}, baseCD=30, reqTalents={63}}, -- Fel Eruption
    {spellID=221562, specs={DK.Blood}, baseCD=45}, -- Asphyxiate
    {spellID=108194, specs={DK.Unholy}, baseCD=45, reqTalents={33}}, -- Asphyxiate
    {spellID=108194, specs={DK.FrostDK}, baseCD=45, reqTalents={32}}, -- Asphyxiate
    {spellID=5211, class=Druid, baseCD=50, reqTalents={41}}, -- Mighty Bash
    {spellID=19577, specs={Hunter.BM,Hunter.Surv}, baseCD=60}, -- Intimidation
    {spellID=853, specs={Paladin.Holy}, baseCD=60, modTalents={[31]=CastDeltaMod(853, 275773, -10)}}, -- Hammer of Justice
    {spellID=853, specs={Paladin.Prot}, baseCD=60, modTalents={[31]=CastDeltaMod(853, 275779, -6)}}, -- Hammer of Justice
    {spellID=853, specs={Paladin.Ret}, baseCD=60}, -- Hammer of Justice
    {spellID=88625, specs={Priest.Holy}, baseCD=60, reqTalents={42}, mods=CastDeltaMod(88625, 585, -4), modTalents={[71]=CastDeltaMod(88625, 585, -1.333333)}}, -- Holy Word: Chastise
    {spellID=64044, specs={Priest.Shadow}, baseCD=45, reqTalents={43}}, -- Psychic Horror
    {spellID=6789, class=Warlock, baseCD=45, reqTalents={52}}, -- Mortal Coil
    {spellID=107570, specs={Warrior.Prot}, baseCD=30, reqTalents={53}}, -- Storm Bolt
    {spellID=107570, specs={Warrior.Arms,Warrior.Fury}, baseCD=30, reqTalents={23}}, -- Storm Bolt
}

typeToTrackedSpells["STSOFTCC"] = {
    {spellID=217832, class=DH, baseCD=45}, -- Imprison
    {spellID=2094, specs={Rogue.Sin,Rogue.Sub}, baseCD=120}, -- Blind
    {spellID=2094, specs={Rogue.Outlaw}, baseCD=120, modTalents={[52]=StaticMod("sub", 30)}}, -- Blind
    {spellID=115078, class=Monk, baseCD=45}, -- Paralysis
    {spellID=187650, class=Hunter, baseCD=30}, -- Freezing Trap
}

typeToTrackedSpells["DISPEL"] = {
    {spellID=202719, race="BloodElf", class=DH, baseCD=90}, -- Arcane Torrent
    {spellID=50613, race="BloodElf", class=DK, baseCD=90}, -- Arcane Torrent
    {spellID=80483, race="BloodElf", class=Hunter, baseCD=90}, -- Arcane Torrent
    {spellID=28730, race="BloodElf", class=Mage, baseCD=90}, -- Arcane Torrent
    {spellID=129597, race="BloodElf", class=Monk, baseCD=90}, -- Arcane Torrent
    {spellID=155145, race="BloodElf", class=Paladin, baseCD=90}, -- Arcane Torrent
    {spellID=232633, race="BloodElf", class=Priest, baseCD=90}, -- Arcane Torrent
    {spellID=25046, race="BloodElf", class=Rogue, baseCD=90}, -- Arcane Torrent
    {spellID=28730, race="BloodElf", class=Warlock, baseCD=90}, -- Arcane Torrent
    {spellID=69179, race="BloodElf", class=Warrior, baseCD=90}, -- Arcane Torrent
    {spellID=32375, class=Priest, baseCD=45}, -- Mass Dispel
}

typeToTrackedSpells["DEFMDISPEL"] = {
    {spellID=88423, specs={Druid.Resto}, baseCD=8, mods=DispelMod(88423)}, -- Nature's Cure
    {spellID=115450, specs={Monk.MW}, baseCD=8, mods=DispelMod(115450)}, -- Detox
    {spellID=4987, specs={Paladin.Holy}, baseCD=8, mods=DispelMod(4987)}, -- Cleanse
    {spellID=527, specs={Priest.Disc,Priest.Holy}, baseCD=8, mods=DispelMod(527)}, -- Purify
    {spellID=77130, specs={Shaman.Resto}, baseCD=8, mods=DispelMod(77130)}, -- Purify Spirit
}

typeToTrackedSpells["EXTERNAL"] = {
    {spellID=196718, specs={DH.Havoc}, baseCD=180}, -- Darkness
    {spellID=102342, specs={Druid.Resto}, baseCD=60, modTalents={[62]=StaticMod("sub", 15)}}, -- Ironbark
    {spellID=116849, specs={Monk.MW}, baseCD=120}, -- Life Cocoon
    {spellID=31821, specs={Paladin.Holy}, baseCD=180}, -- Aura Mastery
    {spellID=6940, specs={Paladin.Holy,Paladin.Prot}, baseCD=120}, -- Blessing of Sacrifice
    {spellID=1022, specs={Paladin.Holy,Paladin.Ret}, baseCD=300}, -- Blessing of Protection
    {spellID=1022, specs={Paladin.Prot}, baseCD=300, reqTalents={41,42}}, -- Blessing of Protection
    {spellID=204018, specs={Paladin.Prot}, baseCD=180, reqTalents={43}}, -- Blessing of Spellwarding
    {spellID=62618, specs={Priest.Disc}, baseCD=180, reqTalents={71,73}}, -- Power Word: Barrier
    {spellID=271466, specs={Priest.Disc}, baseCD=180, reqTalents={72}}, -- Luminous Barrier
    {spellID=33206, specs={Priest.Disc}, baseCD=180}, -- Pain Supression
    {spellID=47788, specs={Priest.Holy}, baseCD=180, modTalents={[32]=modGuardianSpirit(47788)}}, -- Guardian Spirit
    {spellID=98008, specs={Shaman.Resto}, baseCD=180}, -- Spirit Link Totem
    {spellID=97462, class=Warrior, baseCD=180}, -- Rallying Cry
}

typeToTrackedSpells["HEALING"] = {
    {spellID=740, specs={Druid.Resto}, baseCD=180, modTalents={[61]=StaticMod("sub", 60)}}, -- Tranquility
    {spellID=115310, specs={Monk.MW}, baseCD=180}, -- Revival
    {spellID=216331, specs={Paladin.Holy}, baseCD=120, reqTalents={62}}, -- Avenging Crusader
    {spellID=105809, specs={Paladin.Holy}, baseCD=90, reqTalents={53}}, -- Holy Avenger
    {spellID=633, specs={Paladin.Holy}, baseCD=600, modTalents={[21]=StaticMod("mul", 0.7)}}, -- Lay on Hands
    {spellID=633, specs={Paladin.Prot,Paladin.Ret}, baseCD=600, modTalents={[51]=StaticMod("mul", 0.7)}}, -- Lay on Hands
    {spellID=47536, specs={Priest.Disc}, baseCD=90}, -- Rapture
    {spellID=246287, specs={Priest.Disc}, baseCD=75, reqTalents={73}}, -- Evangelism
    {spellID=64843, specs={Priest.Holy}, baseCD=180}, -- Divine Hymn
    {spellID=200183, specs={Priest.Holy}, baseCD=120, reqTalents={72}}, -- Apotheosis
    {spellID=265202, specs={Priest.Holy}, baseCD=720, reqTalents={73}, mods={CastDeltaMod(265202, 34861,-30), CastDeltaMod(265202, 2050,-30)}}, -- Holy Word: Salvation
    {spellID=15286, specs={Priest.Shadow}, baseCD=120, modTalents={[22]=StaticMod("sub", 45)}}, -- Vampiric Embrace
    {spellID=108280, specs={Shaman.Resto}, baseCD=180}, -- Healing Tide Totem
    {spellID=198838, specs={Shaman.Resto}, baseCD=60, reqTalents={42}}, -- Earthen Wall Totem
    {spellID=207399, specs={Shaman.Resto}, baseCD=300, reqTalents={43}}, -- Ancestral Protection Totem
    {spellID=114052, specs={Shaman.Resto}, baseCD=180, reqTalents={73}}, -- Ascendance
}

typeToTrackedSpells["UTILITY"] = {
    {spellID=205636, specs={Druid.Balance}, baseCD=60, reqTalents={13}}, -- Force of Nature (Treants)
    {spellID=73325, class=Priest, baseCD=90}, -- Leap of Faith
    {spellID=114018, class=Rogue, baseCD=360}, -- Shroud of Concealment
    {spellID=29166, specs={Druid.Balance,Druid.Resto}, baseCD=180}, -- Innervate
    {spellID=64901, specs={Priest.Holy}, baseCD=300}, -- Symbol of Hope
}

typeToTrackedSpells["PERSONAL"] = {
    {spellID=198589, specs={DH.Havoc}, baseCD=60, mods=EventRemainingMod(198589, "SPELL_AURA_APPLIED", 212800, 60, 60)}, -- Blur
    {spellID=187827, specs={DH.Veng}, baseCD=180}, -- Metamorphosis
    {spellID=48707, specs={DK.Blood}, baseCD=60, modTalents={[42]=StaticMod("sub", 15)}}, -- Anti-Magic Shell
    {spellID=48707, specs={DK.Frost,DK.Unholy}, baseCD=60}, -- Anti-Magic Shell
    {spellID=48743, specs={DK.Frost,DK.Unholy}, baseCD=120, reqTalents={53}}, -- Death Pact
    {spellID=48792, class=DK, baseCD=180}, -- Icebound Fortitude	
	{spellID=55233, specs={DK.Blood}, baseCD=90, modTalents={ [72] = CastDeltaMod(55233, 49998, -4.5) }}, -- Vampiric Blood
    --{spellID=55233, specs={DK.Blood}, baseCD=90, modTalents={ [72] = ResourceSpendingMods(55233, DK.Blood) }}, -- Vampiric Blood
    {spellID=22812, specs={Druid.Balance,Druid.Guardian,Druid.Resto}, baseCD=60}, -- Barkskin
    {spellID=61336, specs={Druid.Feral,Druid.Guardian}, baseCD=180}, -- Survival Instincts
    {spellID=109304, class=Hunter, baseCD=120}, -- Exhilaration
    {spellID=235219, specs={Mage.Frost}, baseCD=300}, -- Cold Snap
    {spellID=122278, class=Monk, baseCD=120, reqTalents={53}}, -- Dampen Harm
    {spellID=122783, specs={Monk.MW, Monk.WW}, baseCD=90, reqTalents={52}}, -- Diffuse Magic
    {spellID=115203, specs={Monk.BRM}, baseCD=420}, -- Fortifying Brew
    {spellID=115176, specs={Monk.BRM}, baseCD=300}, -- Zen Meditation
    {spellID=243435, specs={Monk.MW}, baseCD=90}, -- Fortifying Brew
    {spellID=122470, specs={Monk.WW}, baseCD=90}, -- Touch of Karma
    {spellID=498, specs={Paladin.Holy}, baseCD=60}, -- Divine Protection
    {spellID=31850, specs={Paladin.Prot}, baseCD=120}, -- Ardent Defender
    {spellID=86659, specs={Paladin.Prot}, baseCD=300}, -- Guardian of the Ancient Kings
    {spellID=184662, specs={Paladin.Ret}, baseCD=120}, -- Shield of Vengeance
    {spellID=205191, specs={Paladin.Ret}, baseCD=60, reqTalents={53}}, -- Eye for an Eye
    {spellID=19236, specs={Priest.Disc, Priest.Holy}, baseCD=90}, -- Desperate Prayer
    {spellID=47585, specs={Priest.Shadow}, baseCD=120}, -- Dispersion
    {spellID=108271, class=Shaman, baseCD=90}, -- Astral Shift
    {spellID=104773, class=Warlock, baseCD=180}, -- Unending Resolve
    {spellID=118038, specs={Warrior.Arms}, baseCD=180}, -- Die by the Sword
    {spellID=184364, specs={Warrior.Fury}, baseCD=120}, -- Enraged Regeneration
    {spellID=12975, specs={Warrior.Prot}, baseCD=180, modTalents={[43]=StaticMod("sub", 60)}}, -- Last Stand
    {spellID=871, specs={Warrior.Prot}, baseCD=240}, -- Shield Wall
}

typeToTrackedSpells["IMMUNITY"] = {
    {spellID=196555, specs={DH.Havoc}, baseCD=120, reqTalents={43}}, -- Netherwalk
    {spellID=186265, class=Hunter, baseCD=180, modTalents={[51]=StaticMod("mul", 0.8)}}, -- Aspect of the Turtle
    {spellID=45438, specs={Mage.Arcane,Mage.Fire}, baseCD=240}, -- Ice Block
    {spellID=45438, specs={Mage.Frost}, baseCD=240, mods= EventRemainingMod(45438, "SPELL_CAST_SUCCESS", 235219, 0, 240)}, -- Ice Block
    {spellID=642, class=Paladin, baseCD=300}, -- Divine Shield
    {spellID=31224, class=Rogue, baseCD=120}, -- Cloak of Shadows
}

typeToTrackedSpells["DAMAGE"] = {
    {spellID=191427, specs={DH.Havoc}, baseCD=240}, -- Metamorphosis
    {spellID=258925, specs={DH.Havoc}, baseCD=60, reqTalents={33}}, -- Fel Barrage
    {spellID=206491, specs={DH.Havoc}, baseCD=120, reqTalents={73}}, -- Nemesis
    {spellID=279302, specs={DK.Frost}, baseCD=180, reqTalents={63}}, -- Frostwyrm's Fury
    {spellID=152279, specs={DK.Frost}, baseCD=120, reqTalents={73}}, -- Breath of Sindragosaa
    {spellID=42650, specs={DK.Unholy}, baseCD=480}, -- Army of the Dead
    {spellID=49206, specs={DK.Unholy}, baseCD=180, reqTalents={73}}, -- Summon Gargoyle
    {spellID=207289, specs={DK.Unholy}, baseCD=75, reqTalents={72}}, -- Unholy Frenzy
    {spellID=194223, specs={Druid.Balance}, baseCD=180, reqTalents={51,52}}, -- Celestial Alignment
    {spellID=102560, specs={Druid.Balance}, baseCD=180, reqTalents={53}}, -- Incarnation: Chosen of Elune
    {spellID=102543, specs={Druid.Feral}, baseCD=180, reqTalents={53}}, -- Incarnation: King of the Jungle
    {spellID=19574, specs={Hunter.BM}, baseCD=90}, -- Bestial Wrath
    {spellID=193530, specs={Hunter.BM}, baseCD=120}, -- Aspect of the Wild
    {spellID=201430, specs={Hunter.BM}, baseCD=180, reqTalents={63}}, -- Stampede
    {spellID=266779, specs={Hunter.SV}, baseCD=120}, -- Coordinated Assault
    {spellID=12042, specs={Mage.Arcane}, baseCD=90}, -- Arcane Power
    {spellID=190319, specs={Mage.Fire}, baseCD=120}, -- Combustion
    {spellID=12472, specs={Mage.Frost}, baseCD=180}, -- Icy Veins
    {spellID=55342, class=Mage, baseCD=120, reqTalents={32}}, -- Mirror Image
    {spellID=115080, specs={Monk.WW}, baseCD=120}, -- Touch of Death
    {spellID=123904, specs={Monk.WW}, baseCD=180, reqTalents={63}}, -- Xuen
    {spellID=137639, specs={Monk.WW}, baseCD=90, reqTalents={71, 72}}, -- Storm, Earth, and Fire
    {spellID=152173, specs={Monk.WW}, baseCD=90, reqTalents={73}}, -- Serenity
    {spellID=31884, specs={Paladin.Ret}, baseCD=120, reqTalents={71,73}}, -- Avenging Wrath
    {spellID=231895, specs={Paladin.Ret}, baseCD=120, reqTalents={72}}, -- Crusade
    {spellID=193223, specs={Priest.Shadow}, baseCD=240, reqTalents={73}}, -- Surrender to Madness
    {spellID=79140, specs={Rogue.Sin}, baseCD=120}, -- Vendetta
    {spellID=121471, specs={Rogue.Sub}, baseCD=180}, -- Shadow Blades
    {spellID=13750, specs={Rogue.Outlaw}, baseCD=180}, -- Adrenaline Rush
    {spellID=51690, specs={Rogue.Outlaw}, baseCD=120, reqTalents={73}}, -- Killing Spree
    {spellID=114050, specs={Shaman.Ele}, baseCD=180, reqTalents={73}}, -- Ascendance
    {spellID=114051, specs={Shaman.Enh}, baseCD=180, reqTalents={73}}, -- Ascendance
    {spellID=205180, specs={Warlock.Affl}, baseCD=180}, -- Summon Darkglare
    {spellID=113860, specs={Warlock.Affl}, baseCD=120, reqTalents={73}}, -- Dark Soul: Misery
    {spellID=265187, specs={Warlock.Demo}, baseCD=90}, -- Summon Demonic Tyrant
    {spellID=267217, specs={Warlock.Demo}, baseCD=180, reqTalents={73}}, -- Nether Portal
    {spellID=113858, specs={Warlock.Destro}, baseCD=120, reqTalents={73}}, -- Dark Soul: Instability
    {spellID=1122, specs={Warlock.Destro}, baseCD=180}, -- Summon Infernal
    {spellID=227847, specs={Warrior.Arms}, baseCD=90}, -- Bladestorm
    {spellID=107574, specs={Warrior.Arms}, baseCD=120, reqTalents={62}}, -- Avatar
    {spellID=1719, specs={Warrior.Fury}, baseCD=90}, -- Recklessness
    {spellID=46924, specs={Warrior.Fury}, baseCD=60, reqTalents={63}}, -- Bladestorm
}

typeToTrackedSpells["TANK"] = {
    {spellID=49028, specs={DK.Blood}, baseCD=120}, -- Dancing Rune Weapon
    {spellID=194679, specs={DK.Blood}, baseCD=25, reqTalents={43}}, -- Rune Tap
    {spellID=194844, specs={DK.Blood}, baseCD=60, reqTalents={73}}, -- Bonestorm
    {spellID=204021, specs={DH.Veng}, baseCD=60}, -- Fiery Brand
    {spellID=1160, specs={Warrior.Prot}, baseCD=45}, -- Demoralizing Shout
}

local GetSpellType = {}
for k, v in pairs(typeToTrackedSpells) do
	for i, c in pairs(v) do
		GetSpellType[c.spellID] = k
	end
end

local function CreateIcon(f)
	local icon = CreateFrame("Frame", nil, f)
	icon:SetSize(SMT_CDB["CD_Icons"]["icon_size"], SMT_CDB["CD_Icons"]["icon_size"])
	T.createborder(icon)
	
	icon.spellID = 0
	
	icon.cd = CreateFrame("Cooldown", nil, icon, "CooldownFrameTemplate")
	icon.cd:SetAllPoints(icon)
	icon.cd:SetAlpha(.5)
	icon.cd:SetScript("OnShow", function()
		if not party_cd['Roster'][icon.player_name] or not party_cd['Roster'][icon.player_name][icon.spellID] then return end
		if party_cd['Roster'][icon.player_name][icon.spellID]["charge"] then
			icon:SetAlpha(1)
		else
			icon:SetAlpha(SMT_CDB["CD_Icons"]["alpha"]/100)
		end
	end)
	icon.cd:SetScript("OnHide", function()	
		if party_cd['Roster'][icon.player_name] and party_cd['Roster'][icon.player_name][icon.spellID] and party_cd['Roster'][icon.player_name][icon.spellID]["charge"] then
			if party_cd['Roster'][icon.player_name][icon.spellID]["charge"] == party_cd['Roster'][icon.player_name][icon.spellID]["max_charge"] then return end
			party_cd['Roster'][icon.player_name][icon.spellID]["charge"] = party_cd['Roster'][icon.player_name][icon.spellID]["charge"] + 1
			icon.count:SetText(party_cd['Roster'][icon.player_name][icon.spellID]["charge"])
			if party_cd['Roster'][icon.player_name][icon.spellID]["charge"] ~= party_cd['Roster'][icon.player_name][icon.spellID]["max_charge"] then
				icon.cd:SetCooldown(GetTime(), party_cd['Roster'][icon.player_name][icon.spellID]["dur"])
			end
		else
			icon:SetAlpha(1)
		end
	end)
	
	icon.tex = icon:CreateTexture(nil, "OVERLAY")
	icon.tex:SetAllPoints(icon)
	icon.tex:SetTexCoord( .1, .9, .1, .9)
	
	icon.count = T.createtext(icon, "OVERLAY", 16, "OUTLINE", "RIGHT")
	icon.count:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT", 0, 0)

	table.insert(f.icons, icon)
end

local function GetRemain(Cooldown)
	local startTime, duration = Cooldown:GetCooldownTimes()
	local remain
	if duration == 0 then
		remain = 0
	else
		remain = duration - (GetTime() - startTime)
	end
	return remain
end

local function CreateCDBar(unit)
	local f = CreateFrame("Frame", nil, UIParent)
	f:SetSize(SMT_CDB["CD_Icons"]["icon_size"]*2+SMT_CDB["CD_Icons"]["icon_space"], SMT_CDB["CD_Icons"]["icon_size"]*2+SMT_CDB["CD_Icons"]["icon_space"])
	f.icons = {}
	
	for i = 1, 20 do
		CreateIcon(f)
	end
	
	f.point = function()		
		if f.pointlock then return end
		
		f.pointlock = true
		C_Timer.After(.2, function()
		
			f:ClearAllPoints()
			local hasGrid = IsAddOnLoaded("Grid")
			local hasGrid2 = IsAddOnLoaded("Grid2")
			local hasCompactRaid = IsAddOnLoaded("CompactRaid")
			local hasVuhDo = IsAddOnLoaded("VuhDo")
			local hasElvUIRaid = _G["ElvUF_Raid"] and _G["ElvUF_Raid"]:IsVisible()
			local hasElvUIParty = _G["ElvUF_Party"] and _G["ElvUF_Party"]:IsVisible()
			 local hasAltzUIRaid = _G["Altz_HealerRaid"] and _G["Altz_HealerRaid"]:IsVisible()
			local hasAltzUIParty = _G["Altz_Party"] and _G["Altz_Party"]:IsVisible()
			local hasNDui = IsAddOnLoaded("NDui") and NDuiDB["UFs"]["RaidFrame"]
			
			if hasElvUIRaid or hasElvUIParty then
				if hasElvUIParty then
					for i=1, 8 do
						for j=1, 5 do
							local uf = _G["ElvUF_PartyGroup"..i.."UnitButton"..j]
							if uf and uf.unit and UnitIsUnit(uf.unit, unit) then
								if SMT_CDB["CD_Icons"]["grow_dir"] == "RIGHT" then
									f:SetPoint("RIGHT", uf, "LEFT", -SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
								elseif SMT_CDB["CD_Icons"]["grow_dir"] == "LEFT" then
									f:SetPoint("LEFT", uf, "RIGHT", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
								elseif SMT_CDB["CD_Icons"]["grow_dir"] == "BOTTOM" then
									f:SetPoint("BOTTOM", uf, "TOP", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
								elseif SMT_CDB["CD_Icons"]["grow_dir"] == "TOP" then
									f:SetPoint("TOP", uf, "BOTTOM", SMT_CDB["CD_Icons"]["x"], -SMT_CDB["CD_Icons"]["y"])
								end
								break
							end
						end
					end
				else
					for i=1, 8 do
						for j=1, 5 do
							local uf = _G["ElvUF_RaidGroup"..i.."UnitButton"..j]
							if uf and uf.unit and UnitIsUnit(uf.unit, unit) then
								if SMT_CDB["CD_Icons"]["grow_dir"] == "RIGHT" then
									f:SetPoint("RIGHT", uf, "LEFT", -SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
								elseif SMT_CDB["CD_Icons"]["grow_dir"] == "LEFT" then
									f:SetPoint("LEFT", uf, "RIGHT", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
								elseif SMT_CDB["CD_Icons"]["grow_dir"] == "BOTTOM" then
									f:SetPoint("BOTTOM", uf, "TOP", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
								elseif SMT_CDB["CD_Icons"]["grow_dir"] == "TOP" then
									f:SetPoint("TOP", uf, "BOTTOM", SMT_CDB["CD_Icons"]["x"], -SMT_CDB["CD_Icons"]["y"])
								end
								break
							end
						end
					end
				end
			elseif hasGrid then
				local layout = GridLayoutFrame
				
				if layout then
					local children = {layout:GetChildren()}
					for _, child in ipairs(children) do
						if child:IsVisible() then
							local frames = {child:GetChildren()}
							for _, uf in ipairs(frames) do
								if uf.unit and UnitIsUnit(uf.unit, unit) then
									if SMT_CDB["CD_Icons"]["grow_dir"] == "RIGHT" then
									f:SetPoint("RIGHT", uf, "LEFT", -SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
									elseif SMT_CDB["CD_Icons"]["grow_dir"] == "LEFT" then
										f:SetPoint("LEFT", uf, "RIGHT", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
									elseif SMT_CDB["CD_Icons"]["grow_dir"] == "BOTTOM" then
										f:SetPoint("BOTTOM", uf, "TOP", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
									elseif SMT_CDB["CD_Icons"]["grow_dir"] == "TOP" then
										f:SetPoint("TOP", uf, "BOTTOM", SMT_CDB["CD_Icons"]["x"], -SMT_CDB["CD_Icons"]["y"])
									end
									break
								end
							end
						end
					end
				end
			elseif hasGrid2 then
				local layout = Grid2LayoutFrame
				
				if layout then
					local children = {layout:GetChildren()}
					for _, child in ipairs(children) do
						if child:IsVisible() then
							local frames = {child:GetChildren()}
							for _, uf in ipairs(frames) do
								if uf.unit and UnitIsUnit(uf.unit, unit) then
									if SMT_CDB["CD_Icons"]["grow_dir"] == "RIGHT" then
									f:SetPoint("RIGHT", uf, "LEFT", -SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
									elseif SMT_CDB["CD_Icons"]["grow_dir"] == "LEFT" then
										f:SetPoint("LEFT", uf, "RIGHT", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
									elseif SMT_CDB["CD_Icons"]["grow_dir"] == "BOTTOM" then
										f:SetPoint("BOTTOM", uf, "TOP", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
									elseif SMT_CDB["CD_Icons"]["grow_dir"] == "TOP" then
										f:SetPoint("TOP", uf, "BOTTOM", SMT_CDB["CD_Icons"]["x"], -SMT_CDB["CD_Icons"]["y"])
									end
									break
								end
							end
						end
					end
				end
			elseif hasVuhDo then
				for i = 1, 40 do
					local uf = _G["Vd1H"..i]
					if uf and uf.raidid and UnitIsUnit(uf.raidid, unit) then
						if SMT_CDB["CD_Icons"]["grow_dir"] == "RIGHT" then
							f:SetPoint("RIGHT", uf, "LEFT", -SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
						elseif SMT_CDB["CD_Icons"]["grow_dir"] == "LEFT" then
							f:SetPoint("LEFT", uf, "RIGHT", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
						elseif SMT_CDB["CD_Icons"]["grow_dir"] == "BOTTOM" then
							f:SetPoint("BOTTOM", uf, "TOP", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
						elseif SMT_CDB["CD_Icons"]["grow_dir"] == "TOP" then
							f:SetPoint("TOP", uf, "BOTTOM", SMT_CDB["CD_Icons"]["x"], -SMT_CDB["CD_Icons"]["y"])
						end
						break
					end
				end
			elseif hasAltzUIRaid or hasAltzUIParty then
				if hasAltzUIParty then
					for i = 1, 5 do
						local uf = _G["Altz_PartyUnitButton"..i]
						if uf and uf.unit and UnitIsUnit(uf.unit, unit) then
							if SMT_CDB["CD_Icons"]["grow_dir"] == "RIGHT" then
								f:SetPoint("RIGHT", uf, "LEFT", -SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
							elseif SMT_CDB["CD_Icons"]["grow_dir"] == "LEFT" then
								f:SetPoint("LEFT", uf, "RIGHT", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
							elseif SMT_CDB["CD_Icons"]["grow_dir"] == "BOTTOM" then
								f:SetPoint("BOTTOM", uf, "TOP", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
							elseif SMT_CDB["CD_Icons"]["grow_dir"] == "TOP" then
								f:SetPoint("TOP", uf, "BOTTOM", SMT_CDB["CD_Icons"]["x"], -SMT_CDB["CD_Icons"]["y"])
							end
						end
					end
				else
					for i = 1, 40 do
						local uf = _G["Altz_HealerRaidUnitButton"..i]
						if uf and uf.unit and UnitIsUnit(uf.unit, unit) then
							if SMT_CDB["CD_Icons"]["grow_dir"] == "RIGHT" then
								f:SetPoint("RIGHT", uf, "LEFT", -SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
							elseif SMT_CDB["CD_Icons"]["grow_dir"] == "LEFT" then
								f:SetPoint("LEFT", uf, "RIGHT", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
							elseif SMT_CDB["CD_Icons"]["grow_dir"] == "BOTTOM" then
								f:SetPoint("BOTTOM", uf, "TOP", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
							elseif SMT_CDB["CD_Icons"]["grow_dir"] == "TOP" then
								f:SetPoint("TOP", uf, "BOTTOM", SMT_CDB["CD_Icons"]["x"], -SMT_CDB["CD_Icons"]["y"])
							end
							break
						end
					end
				end
			elseif hasNDui then
				for i =1, 8 do 
					for j = 1, 5 do
						local uf = _G["oUF_Raid"..i.."UnitButton"..j]
						if uf and uf.unit and UnitIsUnit(uf.unit, unit) then
							if SMT_CDB["CD_Icons"]["grow_dir"] == "RIGHT" then
								f:SetPoint("RIGHT", uf, "LEFT", -SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
							elseif SMT_CDB["CD_Icons"]["grow_dir"] == "LEFT" then
								f:SetPoint("LEFT", uf, "RIGHT", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
							elseif SMT_CDB["CD_Icons"]["grow_dir"] == "BOTTOM" then
								f:SetPoint("BOTTOM", uf, "TOP", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
							elseif SMT_CDB["CD_Icons"]["grow_dir"] == "TOP" then
								f:SetPoint("TOP", uf, "BOTTOM", SMT_CDB["CD_Icons"]["x"], -SMT_CDB["CD_Icons"]["y"])
							end
							break
						end
					end
				end
			elseif hasCompactRaid then
				for i =1, 8 do 
					for j = 1, 5 do
						local uf = _G["CompactRaidGroupHeaderSubGroup"..i.."UnitButton"..j]
						if uf and uf.unit and UnitIsUnit(uf.unit, unit) then
							if SMT_CDB["CD_Icons"]["grow_dir"] == "RIGHT" then
							f:SetPoint("RIGHT", uf, "LEFT", -SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
							elseif SMT_CDB["CD_Icons"]["grow_dir"] == "LEFT" then
								f:SetPoint("LEFT", uf, "RIGHT", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
							elseif SMT_CDB["CD_Icons"]["grow_dir"] == "BOTTOM" then
								f:SetPoint("BOTTOM", uf, "TOP", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
							elseif SMT_CDB["CD_Icons"]["grow_dir"] == "TOP" then
								f:SetPoint("TOP", uf, "BOTTOM", SMT_CDB["CD_Icons"]["x"], -SMT_CDB["CD_Icons"]["y"])
							end
							break
						end
					end
				end
			else
				for i=1, 40 do
					local uf = _G["CompactRaidFrame"..i]
					if uf and uf.unitExists and uf.unit and UnitIsUnit(uf.unit, unit) then
						if SMT_CDB["CD_Icons"]["grow_dir"] == "RIGHT" then
						f:SetPoint("RIGHT", uf, "LEFT", -SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
						elseif SMT_CDB["CD_Icons"]["grow_dir"] == "LEFT" then
							f:SetPoint("LEFT", uf, "RIGHT", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
						elseif SMT_CDB["CD_Icons"]["grow_dir"] == "BOTTOM" then
							f:SetPoint("BOTTOM", uf, "TOP", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
						elseif SMT_CDB["CD_Icons"]["grow_dir"] == "TOP" then
							f:SetPoint("TOP", uf, "BOTTOM", SMT_CDB["CD_Icons"]["x"], -SMT_CDB["CD_Icons"]["y"])
						end
						break
					end
				end
				for i=1, 5 do
					local uf = _G["CompactPartyFrameMember"..i]
					if uf and uf.unitExists and uf.unit and UnitIsUnit(uf.unit, unit) then
						if SMT_CDB["CD_Icons"]["grow_dir"] == "RIGHT" then
						f:SetPoint("RIGHT", uf, "LEFT", -SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
						elseif SMT_CDB["CD_Icons"]["grow_dir"] == "LEFT" then
							f:SetPoint("LEFT", uf, "RIGHT", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
						elseif SMT_CDB["CD_Icons"]["grow_dir"] == "BOTTOM" then
							f:SetPoint("BOTTOM", uf, "TOP", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
						elseif SMT_CDB["CD_Icons"]["grow_dir"] == "TOP" then
							f:SetPoint("TOP", uf, "BOTTOM", SMT_CDB["CD_Icons"]["x"], -SMT_CDB["CD_Icons"]["y"])
						end
						break
					end
				end
				for i=1, 4 do
					for j=1, 5 do
						local uf = _G["CompactRaidGroup"..i.."Member"..j]
						if uf and uf.unitExists and uf.unit and UnitIsUnit(uf.unit, unit) then
							if SMT_CDB["CD_Icons"]["grow_dir"] == "RIGHT" then
								f:SetPoint("RIGHT", uf, "LEFT", -SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
							elseif SMT_CDB["CD_Icons"]["grow_dir"] == "LEFT" then
								f:SetPoint("LEFT", uf, "RIGHT", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
							elseif SMT_CDB["CD_Icons"]["grow_dir"] == "BOTTOM" then
								f:SetPoint("BOTTOM", uf, "TOP", SMT_CDB["CD_Icons"]["x"], SMT_CDB["CD_Icons"]["y"])
							elseif SMT_CDB["CD_Icons"]["grow_dir"] == "TOP" then
								f:SetPoint("TOP", uf, "BOTTOM", SMT_CDB["CD_Icons"]["x"], -SMT_CDB["CD_Icons"]["y"])
							end
							break
						end
					end
				end
			end
		
			f.pointlock = nil
		
		end)
	end
	
	f.update_size = function()
		for i = 1,20 do
			f.icons[i]:SetSize(SMT_CDB["CD_Icons"]["icon_size"], SMT_CDB["CD_Icons"]["icon_size"])
		end
	end
	
	f.update_unit = function()	
		f.name = UnitName(unit)
		if f.name and party_cd['Roster'][f.name] then
			f.spell_num = 0
			for spellid, info in pairs(party_cd['Roster'][f.name]) do
				if spellid ~= "player_info" and SMT_CDB.typeToTrack[GetSpellType[spellid]] and SMT_CDB.spellToTrack[spellid] then
					f.spell_num = f.spell_num + 1
					if f.icons[f.spell_num]  then	
						f.icons[f.spell_num]["spellID"] = spellid
						f.icons[f.spell_num]["player_name"] = f.name
						f.icons[f.spell_num]["tex"]:SetTexture(select(3, GetSpellInfo(spellid)))
						if info["charge"] then
							f.icons[f.spell_num]["count"]:SetText(info["charge"])
						else
							f.icons[f.spell_num]["count"]:SetText("")
						end
						f.icons[f.spell_num]:Show()
					end
				end
			end
			for i = f.spell_num+1, 20 do
				f.icons[i]:Hide()
				f.icons[i]["spellID"] = 0
				f.icons[i]["tex"]:SetTexture(nil)
				f.icons[i]["cd"]:SetCooldown(0,0)	
			end
		else
			for i = 1, 20 do
				f.icons[i]:Hide()
				f.icons[i]["spellID"] = 0
				f.icons[i]["tex"]:SetTexture(nil)
				f.icons[i]["cd"]:SetCooldown(0,0)		
			end
		end
	end
	
	f.update_cd = function(spellid)
		if f.name then
			if spellid then		
				for i = 1, f.spell_num do
					if f.icons[i]["spellID"] == spellid and party_cd['Roster'][f.name][spellid] then
						local info = party_cd['Roster'][f.name][spellid]
						if info["start"] and info["start"] + info["dur"] > GetTime() then -- 未冷却
							if party_cd['Roster'][f.name][spellid]["charge"] then -- 有层数
								if party_cd['Roster'][f.name][spellid]["charge"] == party_cd['Roster'][f.name][spellid]["max_charge"] then
									f.icons[i]["cd"]:SetCooldown(info["start"], info["dur"])
								end
								party_cd['Roster'][f.name][spellid]["charge"] = party_cd['Roster'][f.name][spellid]["charge"] - 1
								f.icons[i]["count"]:SetText(party_cd['Roster'][f.name][spellid]["charge"])
								if party_cd['Roster'][f.name][spellid]["charge"] == 0 then
									f.icons[i]:SetAlpha(SMT_CDB["CD_Icons"]["alpha"]/100)
								end
							else -- 无层数
								f.icons[i]["cd"]:SetCooldown(info["start"], info["dur"])
								f.icons[i]["count"]:SetText("")
							end
						elseif f.icons[i]["cd"]:GetCooldownDuration() > 0 then
							f.icons[i]["cd"]:SetCooldown(0,0)
						end
						break
					end
				end
			elseif f.spell_num and f.spell_num > 0 and not InCombatLockdown() then		
				for i = 1, f.spell_num do
					local icon_spellid = f.icons[i]["spellID"]
					if icon_spellid ~= 0 and party_cd['Roster'][f.name][icon_spellid] then
						local info = party_cd['Roster'][f.name][icon_spellid]
						if info["start"] and info["start"] + info["dur"] > GetTime() then -- 未冷却
							f.icons[i]["cd"]:SetCooldown(info["start"], info["dur"])
						elseif f.icons[i]["cd"]:GetCooldownDuration() > 0 then
							f.icons[i]["cd"]:SetCooldown(0,0)
						end
					end
				end
			end
		end
	end
	
	f.lineup = function()
		if not IsInGroup() then return end
		
		if f.spell_num and f.spell_num > 0 then
			f.line_num_top = 1
			f.line_num_buttom = 1
			
			for i = 1, f.spell_num do
				f.icons[i]:ClearAllPoints()

				local line = spell_types_2[GetSpellType[f.icons[i].spellID]]
				
				if SMT_CDB["CD_Icons"]["grow_dir"] == "RIGHT" then
					if line == 1 then
						f.icons[i]:SetPoint("TOPRIGHT", f, "TOPRIGHT", -(f.line_num_top-1)*(SMT_CDB["CD_Icons"]["icon_size"]+SMT_CDB["CD_Icons"]["icon_space"]), 0)
						f.line_num_top = f.line_num_top + 1
					else
						f.icons[i]:SetPoint("TOPRIGHT", f, "TOPRIGHT", -(f.line_num_buttom-1)*(SMT_CDB["CD_Icons"]["icon_size"]+SMT_CDB["CD_Icons"]["icon_space"]), -SMT_CDB["CD_Icons"]["icon_size"]-SMT_CDB["CD_Icons"]["icon_space"])
						f.line_num_buttom = f.line_num_buttom + 1
					end
				elseif SMT_CDB["CD_Icons"]["grow_dir"] == "LEFT" then
					if line == 1 then
						f.icons[i]:SetPoint("TOPLEFT", f, "TOPLEFT", (f.line_num_top-1)*(SMT_CDB["CD_Icons"]["icon_size"]+SMT_CDB["CD_Icons"]["icon_space"]), 0)
						f.line_num_top = f.line_num_top + 1
					else
						f.icons[i]:SetPoint("TOPLEFT", f, "TOPLEFT", (f.line_num_buttom-1)*(SMT_CDB["CD_Icons"]["icon_size"]+SMT_CDB["CD_Icons"]["icon_space"]), -SMT_CDB["CD_Icons"]["icon_size"]-SMT_CDB["CD_Icons"]["icon_space"])
						f.line_num_buttom = f.line_num_buttom + 1
					end
				elseif SMT_CDB["CD_Icons"]["grow_dir"] == "TOP" then
					if line == 1 then
						f.icons[i]:SetPoint("BOTTOMLEFT", f, "TOPLEFT", 0, (f.line_num_top-1)*(SMT_CDB["CD_Icons"]["icon_size"]+SMT_CDB["CD_Icons"]["icon_space"]))
						f.line_num_top = f.line_num_top + 1
					else
						f.icons[i]:SetPoint("BOTTOMLEFT", f, "TOPLEFT", SMT_CDB["CD_Icons"]["icon_size"]-SMT_CDB["CD_Icons"]["icon_space"], (f.line_num_buttom-1)*(SMT_CDB["CD_Icons"]["icon_size"]+SMT_CDB["CD_Icons"]["icon_space"]))
						f.line_num_buttom = f.line_num_buttom + 1
					end
				elseif SMT_CDB["CD_Icons"]["grow_dir"] == "BOTTOM" then
					if line == 1 then
						f.icons[i]:SetPoint("TOPLEFT", f, "BOTTOMLEFT", 0, -(f.line_num_top-1)*(SMT_CDB["CD_Icons"]["icon_size"]+SMT_CDB["CD_Icons"]["icon_space"]))
						f.line_num_top = f.line_num_top + 1
					else
						f.icons[i]:SetPoint("TOPLEFT", f, "BOTTOMLEFT", SMT_CDB["CD_Icons"]["icon_size"]-SMT_CDB["CD_Icons"]["icon_space"], -(f.line_num_buttom-1)*(SMT_CDB["CD_Icons"]["icon_size"]+SMT_CDB["CD_Icons"]["icon_space"]))
						f.line_num_buttom = f.line_num_buttom + 1
					end
				end
			end
		end
		
	end
	
	table.insert(party_cd.Frames, f)
end

local function checkSpellRequirements(c, info)
	if c.class and c.class.name and c.class.name ~= info.class then
		return false
	end
	
	if c.race and c.race ~= info.race then
		return false
	end
	
	if c.specs then
		local spec_check
		for i, v in pairs(c.specs) do
			if v == info.spec then
				spec_check = true
				break
			end
		end
		if not spec_check then
			return false
		end
	end
	
	if c.reqTalents then
		local tal_check
		for i, v in pairs(c.reqTalents) do
			if info.talents[v] then
				tal_check = true
				break
			end
		end
		if not tal_check then
			return false
		end
	end
	
	return true
end

local function Member_computeCooldown(self, spellInfo, specInfo)
    if not specInfo then
        specInfo = self.specInfo
    end
    
    local cooldown = spellInfo.baseCD
    if spellInfo.modTalents then
        for talent,modifiers in pairs(spellInfo.modTalents) do
            if specInfo.talentsMap[talent] then
                for _,modifier in ipairs(modifiers) do
                    if modifier.type == "Static" then
                        if modifier.sub then
                            cooldown = cooldown - modifier.sub
                        elseif modifier.mul then
                            cooldown = cooldown * modifier.mul
                        end
                    end
                end
            end
        end
    end
    
    return cooldown
end

local function UpdatePlayerSpells(name)
	if not name or not party_cd['Roster'][name] then return end
	for Type, Table in pairs(typeToTrackedSpells) do
		if SMT_CDB.typeToTrack[Type] then
			for index, c in pairs(Table) do
				if SMT_CDB.spellToTrack[c.spellID] and checkSpellRequirements(c, party_cd['Roster'][name]["player_info"]) then		
					party_cd['Roster'][name][c.spellID] = 	party_cd['Roster'][name][c.spellID] or {}
					if c.specs then
						party_cd['Roster'][name][c.spellID]["spec"] = c.specs[1]
					end
					if c.modTalents then
						for tag, v in pairs(c.modTalents) do
							if party_cd['Roster'][name]["player_info"]["talents"][tag] then
								if v.type == "Static" then
									if v.sub then
										party_cd['Roster'][name][c.spellID]["dur"] = c.baseCD - v.sub
									elseif v.mul then
										party_cd['Roster'][name][c.spellID]["dur"] = c.baseCD * v.mul
									end										
								else
									party_cd['Roster'][name][c.spellID]["dur"] = c.baseCD
									if not party_cd['WatchCD'][v.type] then
										party_cd['WatchCD'][v.type] = {}
									end
									if not party_cd['WatchCD'][v.type][c.spellID] then
										party_cd['WatchCD'][v.type][c.spellID] = {}
									end
									party_cd['WatchCD'][v.type][c.spellID][name] = true
								end
								break
							else
								party_cd['Roster'][name][c.spellID]["dur"] = c.baseCD
								if v.type ~= "Static" and party_cd['WatchCD'][v.type] and party_cd['WatchCD'][v.type][c.spellID] then
									party_cd['WatchCD'][v.type][c.spellID][name] = nil
								end
							end
						end
					else
						party_cd['Roster'][name][c.spellID]["dur"] = c.baseCD
					end
					if c.mods then
						if not party_cd['WatchCD'][c.mods.type] then
							party_cd['WatchCD'][c.mods.type] = {}
						end
						if not party_cd['WatchCD'][c.mods.type][c.spellID] then
							party_cd['WatchCD'][c.mods.type][c.spellID] = {}
						end
						party_cd['WatchCD'][c.mods.type][c.spellID][name] = true
					end
				elseif party_cd['Roster'][name][c.spellID] then
					if not c.specs or c.specs and c.specs[1] == party_cd['Roster'][name][c.spellID]["spec"] then
						party_cd['Roster'][name][c.spellID] = nil
					end
				end
			end
		else
			for index, c in pairs(Table) do
				if party_cd['Roster'][name][c.spellID] then
					if not c.specs or c.specs and c.specs[1] == party_cd['Roster'][name][c.spellID]["spec"] then
						party_cd['Roster'][name][c.spellID] = nil
					end
				end
			end	
		end
	end
end

function party_cd:OnUpdate(unit, info)
	if not info.name or not info.class or not info.global_spec_id or not info.talents then return end

	if UnitInParty(info.name) then
		if not party_cd['Roster'][info.name] then
			party_cd['Roster'][info.name] = {}
		end
		if not party_cd['Roster'][info.name]["player_info"] then
			party_cd['Roster'][info.name]["player_info"] = {}
		end
		if not party_cd['Roster'][info.name]["player_info"]["class"] then
			party_cd['Roster'][info.name]["player_info"]["class"] = info.class
		end
		if not party_cd['Roster'][info.name]["player_info"]["race"] then
			party_cd['Roster'][info.name]["player_info"]["race"] = info.race
		end
		party_cd['Roster'][info.name]["player_info"]["spec"] = info.global_spec_id
		party_cd['Roster'][info.name]["player_info"]["talents"] = {}
		
		for ID, t in pairs(info.talents) do
			local tag = t.tier*10+t.column
			party_cd['Roster'][info.name]["player_info"]["talents"][tag] = true
		end
		
		UpdatePlayerSpells(info.name)
		UpdateCDBar("all")
	elseif party_cd['Roster'][info.name] then
		party_cd['Roster'][info.name] = nil
		UpdateCDBar("all")
	end
end


T.EditCDBar = function(tag)
	for i = 1, #party_cd.Frames do
		local f = party_cd.Frames[i]
		
		if tag == "show" then
			if not SMT_CDB["General"]["disable_all"] and SMT_CDB["CD_Icons"]["enable"] and not (IsInRaid() and SMT_CDB["CD_Icons"]["hide_in_raid"]) then
				f:Show()
			else
				f:Hide()
			end
		elseif tag == "size" then
			f.update_size()
			f.lineup()
		elseif tag == "pos" then
			f.point()
			f.lineup()
		elseif tag == "alpha" then
			for i = 1,20 do
				if f.icons[i].cd:GetCooldownDuration() > 0 then
					f.icons[i]:SetAlpha(SMT_CDB["CD_Icons"]["alpha"]/100)
				end
			end
		elseif tag == "spell" then
			UpdatePlayerSpells(UnitName("party1"))
			UpdatePlayerSpells(UnitName("party2"))
			UpdatePlayerSpells(UnitName("party3"))
			UpdatePlayerSpells(UnitName("party4"))
			UpdatePlayerSpells(UnitName("player"))
			UpdateCDBar("all")
		end
	end
end

function party_cd:OnRemove(guid)
	if (guid) then
	    local name = select(6, GetPlayerInfoByGUID(guid))
		if party_cd['Roster'][name] then
			party_cd['Roster'][name] = nil
			UpdateCDBar("all")
		end
	else
		party_cd['Roster'] = {}
		UpdateCDBar("all")
	end
end

local LGIST = LibStub:GetLibrary("LibGroupInSpecT-1.1")

function party_cd:OnInitialize()
	LGIST.RegisterCallback (party_cd, "GroupInSpecT_Update", function(event, ...)
		party_cd.OnUpdate(...)
	end)
	LGIST.RegisterCallback (party_cd, "GroupInSpecT_Remove", function(...)
		party_cd.OnRemove(...)
	end)
end

local Group_Update = CreateFrame("Frame")
Group_Update:RegisterEvent("PLAYER_ENTERING_WORLD")

local function ResetCD()
	for player, spells in pairs(party_cd['Roster']) do
		for spellid, info in pairs(party_cd['Roster'][player]) do
			if spellid ~= "player_info" then
				party_cd['Roster'][player][spellid]["start"] = 0
			end
		end
	end
end

local Arcane_Torrent = {
	[202719] = true,
	[50613] = true,
	[80483] = true,
	[28730] = true,
	[129597] = true,
	[155145] = true,
	[232633] = true,
	[25046] = true,
	[69179] = true,
}

local checkbuttons = {}

Group_Update:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
	
		CreateCDBar("party1")
		CreateCDBar("party2")
		CreateCDBar("party3")
		CreateCDBar("party4")
		CreateCDBar("player")
		--ResetCD()
		T.EditCDBar("show")
		UpdateCDBar("all")

		Group_Update:UnregisterEvent("PLAYER_ENTERING_WORLD")
		Group_Update:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
		Group_Update:RegisterEvent("ENCOUNTER_END")
		Group_Update:RegisterEvent("GROUP_ROSTER_UPDATE")
		
		for i, Type in pairs(spell_types) do
			if SMT_CDB.typeToTrack[Type] == nil then
				SMT_CDB.typeToTrack[Type] = true
			end
			
			local f = G.gui.CD_options.sfa
			
			f.line = f.line or 0
			f.num = f.num or 0
			
			if f.num ~= 0 then
				f.num = 0
				f.line = f.line + 2
			else
				f.line = f.line + 1
			end
			
			checkbuttons[Type] = T.createcheckbutton(f, 40, -170-30*f.line, L[Type], "typeToTrack", false, Type)
			
			checkbuttons[Type].apply = function() T.EditCDBar("spell") end
			
			f.line = f.line + 1

			for index, c in pairs(typeToTrackedSpells[Type]) do
				if SMT_CDB.spellToTrack[c.spellID] == nil then
					SMT_CDB.spellToTrack[c.spellID] = true
				end
				
				if not checkbuttons[Type][c.spellID] then
					if Arcane_Torrent[c.spellID] then
						if not checkbuttons[Type].Arcane_Torrent then
							checkbuttons[Type].Arcane_Torrent = T.createcheckbutton(f, 60+f.num*200, -170-30*f.line, T.GetIconLink(202719), "spellToTrack", false, 202719)
							
							checkbuttons[Type].Arcane_Torrent.apply = function()
								for spellID, v in pairs(Arcane_Torrent) do
									if checkbuttons[Type].Arcane_Torrent:GetChecked() then
										SMT_CDB.spellToTrack[spellID] = true
									else
										SMT_CDB.spellToTrack[spellID] = false
									end
								end	
								T.EditCDBar("spell")
							end
							
							checkbuttons[Type].Arcane_Torrent:SetScript("OnEnter", function(self) 
								GameTooltip:SetOwner(self, "ANCHOR_RIGHT",  -20, 10)
								GameTooltip:SetSpellByID(202719)
								GameTooltip:Show() 
							end)
							checkbuttons[Type].Arcane_Torrent:SetScript("OnLeave", function(self)
								GameTooltip:Hide()
							end)
							
							checkbuttons[Type]:HookScript("OnShow", function(self)
								if self:GetChecked() and self:IsEnabled() then
									checkbuttons[Type].Arcane_Torrent:Enable()
								else
									checkbuttons[Type].Arcane_Torrent:Disable()
								end
							end)
							
							checkbuttons[Type]:HookScript("OnClick", function(self)
								if self:GetChecked() and self:IsEnabled() then
									checkbuttons[Type].Arcane_Torrent:Enable()
								else
									checkbuttons[Type].Arcane_Torrent:Disable()
								end
							end)
							
							if f.num <= 1 then
								f.num = f.num + 1
							else
								f.num = 0
								f.line = f.line + 1
							end
						end
					else
						checkbuttons[Type][c.spellID] = T.createcheckbutton(f, 60+f.num*200, -170-30*f.line, T.GetIconLink(c.spellID), "spellToTrack", false, c.spellID)
						
						checkbuttons[Type][c.spellID].apply = function() T.EditCDBar("spell") end
						
						checkbuttons[Type][c.spellID]:SetScript("OnEnter", function(self) 
							GameTooltip:SetOwner(self, "ANCHOR_RIGHT",  -20, 10)
							GameTooltip:SetSpellByID(c.spellID)
							GameTooltip:Show() 
						end)
						checkbuttons[Type][c.spellID]:SetScript("OnLeave", function(self)
							GameTooltip:Hide()
						end)
						
						checkbuttons[Type]:HookScript("OnShow", function(self)
							if self:GetChecked() and self:IsEnabled() then
								checkbuttons[Type][c.spellID]:Enable()
							else
								checkbuttons[Type][c.spellID]:Disable()
							end
						end)
						
						checkbuttons[Type]:HookScript("OnClick", function(self)
							if self:GetChecked() and self:IsEnabled() then
								checkbuttons[Type][c.spellID]:Enable()
							else
								checkbuttons[Type][c.spellID]:Disable()
							end
						end)
	
						if f.num <= 1 then
							f.num = f.num + 1
						else
							f.num = 0
							f.line = f.line + 1
						end
					end
				end
			end
			
		end
		
	elseif event == "ENCOUNTER_END" then
	
		--ResetCD()
		--UpdateCDBar("cd")
		
	elseif event == "GROUP_ROSTER_UPDATE" then
		T.EditCDBar("show")
		
	elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
		local Unit, _, spellID = ...
		local name = UnitName(Unit)
		
		if not name or not spellID then return end
		if party_cd['Roster'][name] then
			if party_cd['Roster'][name][spellID] then
				if party_cd['WatchCD']['Dispel'] and party_cd['WatchCD']['Dispel'][spellID] then return end
				party_cd['Roster'][name][spellID]["start"] = GetTime()
				UpdateCD(name, spellID)
			end
		end
		
	end
end)