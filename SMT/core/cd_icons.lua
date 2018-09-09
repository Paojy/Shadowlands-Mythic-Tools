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

if not party_cd.events then
	party_cd.events = LibStub("CallbackHandler-1.0"):New(party_cd)
end

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

local DefensiveSpells = {
	["PALADIN"] = {
		["642_11"] = {spellID = 642, cd = 240, spec =70, talent = 22485}, -- 圣盾术 惩戒
		["642_12"] = {spellID = 642, cd = 300, spec =70, talent = 22483}, -- 圣盾术 惩戒
		["642_13"] = {spellID = 642, cd = 300, spec =70, talent = 22484}, -- 圣盾术 惩戒
		["642_21"] = {spellID = 642, cd = 210, spec =65, talent = 17575}, -- 圣盾术 神圣
		["642_22"] = {spellID = 642, cd = 300, spec =65, talent = 22176}, -- 圣盾术 神圣
		["642_23"] = {spellID = 642, cd = 300, spec =65, talent = 17577}, -- 圣盾术 神圣
		["642_31"] = {spellID = 642, cd = 300, spec =66, talent = "all"}, -- 圣盾术 防护
		["1022_1"] = {spellID = 1022, cd = 240, spec =70, talent = "all"}, -- 保护之手 惩戒
		["1022_2"] = {spellID = 1022, cd = 240, spec =65, talent = "all"}, -- 保护之手 神圣
		["1022_3"] = {spellID = 1022, cd = 300, spec =66, talent = "all"}, -- 保护之手 防护
		["31850"] = {spellID = 31850, cd = 80, spec =66, talent = "all"}, -- 炽热防御者
		["86659"] = {spellID = 86659, cd = 300, spec =66, talent = "all"}, -- 远古列王守卫
	},
	
	["MAGE"] = {
		["45438"] = {spellID = 45438, cd = 240, spec ="all", talent = "all"}, -- 寒冰屏障
		["235219"] = {spellID = 235219, cd = 300, spec =64, talent = "all"}, -- 急速冷却
	},
	
	["DEMONHUNTER"] = {
		["196555"] = {spellID = 196555, cd = 120, spec = 577, talent = 21865}, -- 虚空行走 浩劫
		["198589"] = {spellID = 198589, cd = 60, spec = 577, talent = "all"}, -- 疾影 浩劫
		["191427"] = {spellID = 191427, cd = 240, spec = 577, talent = "all"}, -- 恶魔变形 浩劫
		["187827"] = {spellID = 187827, cd = 180, spec = 581, talent = "all"}, -- 恶魔变形 复仇
	},
	
	["HUNTER"] = {
		["186265"] = {spellID = 186265, cd = 180, spec = "all", talent = "all"}, -- 灵龟守护
	},
	
	["ROGUE"] = {
		["31224"] = {spellID = 31224, cd = 90, spec = "all", talent = "all"}, -- 暗影斗篷
		["199754"] = {spellID = 199754, cd = 120, spec = 260, talent = "all"}, -- 还击 狂徒
		["5277_1"] = {spellID = 5277, cd = 120, spec = 259, talent = "all"}, -- 闪避 奇袭
		["5277_2"] = {spellID = 5277, cd = 120, spec = 261, talent = "all"}, -- 闪避 敏锐
	},
	
	["SHAMAN"] = {
		["108271"] = {spellID = 108271, cd = 90, spec = "all", talent = "all"}, -- 星界转移
	},
	
	["DRUID"] = {
		["22812_1"] = {spellID = 22812, cd = 60, spec = 102, talent = "all"}, -- 树皮术 鹌鹑
		["22812_2"] = {spellID = 22812, cd = 60, spec = 105, talent = "all"}, -- 树皮术 树
		["22812_3"] = {spellID = 22812, cd = 90, spec = 104, talent = "all"}, -- 树皮术 熊
		["61336_1"] = {spellID = 61336, cd = 120, spec = 103, charge = 2, talent = "all"}, -- 生存本能
		["61336_2"] = {spellID = 61336, cd = 240, spec = 104, charge = 2, talent = "all"}, -- 生存本能
		
	},
	
	["PRIEST"] = {
		["19236_1"] = {spellID = 19236, cd = 90, spec = 257, talent = "all"}, -- 绝望祷言 神圣
		["19236_2"] = {spellID = 19236, cd = 90, spec = 256, talent = "all"}, -- 绝望祷言 戒律
		["33206"] = {spellID = 33206, cd = 180, spec = 256, talent = "all"}, -- 痛苦压制
		["47585"] = {spellID = 47585, cd = 80, spec = 258, talent = "all"}, -- 消散
	},
	
	["MONK"] = {
		["115203"] = {spellID = 115203, cd = 420, spec = 268, talent = "all"}, -- 壮胆酒
		["122470"] = {spellID = 122470, cd = 90, spec = 269, talent = "all"}, -- 业报之触
		["122783"] = {spellID = 122783, cd = 90, spec = 269, talent = 20173}, -- 散魔功
	},
	
	["DEATHKNIGHT"] = {
		["48707"] = {spellID = 48707, cd = 60, spec = "all", talent = "all"}, -- 反魔法护罩
		["48792_1"] = {spellID = 48792, cd = 180, spec = 251, talent = "all"}, -- 冰封之韧
		["48792_2"] = {spellID = 48792, cd = 180, spec = 252, talent = "all"}, -- 冰封之韧
		["55233"] = {spellID = 55233, cd = 90, spec = 250, talent = "all"}, -- 吸血鬼之血
		["49028"] = {spellID = 49028, cd = 180, spec = 250, talent = "all"}, -- 符文刃舞
		
	},
	
	["WARRIOR"] = {
		["871"] = {spellID = 871, cd = 240, spec = 73, talent = "all"}, -- 盾墙
		["12975"] = {spellID = 12975, cd = 180, spec = 73, talent = "all"}, -- 破釜沉舟
		["118038"] = {spellID = 118038, cd = 180, spec = 71, talent = "all"}, -- 剑在人在
		["184364"] = {spellID = 184364, cd = 120, spec = 72, talent = "all"}, -- 狂怒回复	
	},
	
	["WARLOCK"] = {
		["104773_1"] = {spellID = 104773, cd = 60, spec = 267, talent = "all"}, -- 不灭决心
		["104773_2"] = {spellID = 104773, cd = 200, spec = 266, talent = "all"}, -- 不灭决心
		["104773_3"] = {spellID = 104773, cd = 240, spec = 265, talent = "all"}, -- 不灭决心
	}
	
}

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
			f.lineup()
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
	f:SetSize(SMT_CDB["CD_Icons"]["icon_size"], SMT_CDB["CD_Icons"]["icon_size"])
	f.icons = {}
	
	for i = 1, 6 do
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
			local hasElvUI = _G["ElvUF_Raid"] and _G["ElvUF_Raid"]:IsVisible()
			local hasAltzUI = _G["Altz_HealerRaid"] and _G["Altz_HealerRaid"]:IsVisible()
			local hasNDui = IsAddOnLoaded("NDui") and NDuiDB["UFs"]["RaidFrame"]
			
			if hasElvUI then
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
			elseif hasAltzUI then
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
	
	f.reset = function()
		for i = 1,6 do
			f.icons[i]:Hide()
			f.icons[i]["spellID"] = 0
			f.icons[i]["tex"]:SetTexture(nil)
			f.icons[i]["cd"]:SetCooldown(0,0)		
		end
	end
	
	f.update_size = function()
		for i = 1,6 do
			f.icons[i]:SetSize(SMT_CDB["CD_Icons"]["icon_size"], SMT_CDB["CD_Icons"]["icon_size"])
		end
	end
	
	f.update_unit = function()
		f.reset()
		
		f.name = UnitName(unit)

		if f.name then
			local spell_num = 0
			if party_cd['Roster'][f.name] then
				for spellid, info in pairs(party_cd['Roster'][f.name]) do
					if spellid ~= "spec" then
						spell_num = spell_num + 1
						f.icons[spell_num]["spellID"] = spellid
						f.icons[spell_num]["player_name"] = f.name
						f.icons[spell_num]["tex"]:SetTexture(select(3, GetSpellInfo(spellid)))
						if info["charge"] then
							f.icons[spell_num]["count"]:SetText(info["charge"])
						else
							f.icons[spell_num]["count"]:SetText("")
						end
						f.icons[spell_num]:Show()
					end
				end
			end
		end
		
	end
	
	f.update_cd = function(spellid)
		if f.name then
			if spellid then		
				for i = 1, 6 do
					if f.icons[i]["spellID"] == spellid and party_cd['Roster'][f.name][spellid] then
						local info = party_cd['Roster'][f.name][spellid]
						if info["start"] and info["start"] + info["dur"] > GetTime() then
							if party_cd['Roster'][f.name][spellid]["charge"] then
								if party_cd['Roster'][f.name][spellid]["charge"] == party_cd['Roster'][f.name][spellid]["max_charge"] then
									f.icons[i]["cd"]:SetCooldown(info["start"], info["dur"])
								end
								party_cd['Roster'][f.name][spellid]["charge"] = party_cd['Roster'][f.name][spellid]["charge"] - 1
								f.icons[i]["count"]:SetText(party_cd['Roster'][f.name][spellid]["charge"])
								if party_cd['Roster'][f.name][spellid]["charge"] == 0 then
									f.icons[i]:SetAlpha(SMT_CDB["CD_Icons"]["alpha"]/100)
								end
							else
								f.icons[i]["cd"]:SetCooldown(info["start"], info["dur"])
								f.icons[i]["count"]:SetText("")
							end
						else
							f.icons[i]["cd"]:SetCooldown(0,0)		
						end
						break
					end
					
				end
			else
				for i = 1, 6 do
					local icon_spellid = f.icons[i]["spellID"]
					if icon_spellid ~= 0 and party_cd['Roster'][f.name][icon_spellid] then
						local info = party_cd['Roster'][f.name][icon_spellid]
						if info["start"] and info["start"] + info["dur"] > GetTime() then
							f.icons[i]["cd"]:SetCooldown(info["start"], info["dur"])
						end
					end
				end
			end
		end
	end
	
	f.lineup = function()
		if not IsInGroup() then return end
		
		table.sort(f.icons, function(a,b)
			--if not a.cd or b.cd then return end
			if a.spellID ~= 0 and b.spellID ~= 0 then
				if GetRemain(a.cd) < GetRemain(b.cd) then
					return true
				elseif GetRemain(a.cd) == GetRemain(b.cd) and a.spellID < b.spellID then
					return true
				end
			elseif a.spellID ~= 0 and b.spellID == 0 then
				return true
			end
		end)

		for i = 1,6 do
			f.icons[i]:ClearAllPoints()
			
			if SMT_CDB["CD_Icons"]["grow_dir"] == "RIGHT" then
				f.icons[i]:SetPoint("RIGHT", f, "RIGHT", -(i-1)*(SMT_CDB["CD_Icons"]["icon_size"]+SMT_CDB["CD_Icons"]["icon_space"]), 0)
			elseif SMT_CDB["CD_Icons"]["grow_dir"] == "LEFT" then
				f.icons[i]:SetPoint("LEFT", f, "LEFT", (i-1)*(SMT_CDB["CD_Icons"]["icon_size"]+SMT_CDB["CD_Icons"]["icon_space"]), 0)
			elseif SMT_CDB["CD_Icons"]["grow_dir"] == "TOP" then
				f.icons[i]:SetPoint("TOP", f, "TOP", 0, (i-1)*(SMT_CDB["CD_Icons"]["icon_size"]+SMT_CDB["CD_Icons"]["icon_space"]))
			elseif SMT_CDB["CD_Icons"]["grow_dir"] == "BOTTOM" then
				f.icons[i]:SetPoint("BOTTOM", f, "BOTTOM", 0, -(i-1)*(SMT_CDB["CD_Icons"]["icon_size"]+SMT_CDB["CD_Icons"]["icon_space"]))
			end
		
			
			if f.icons[i].spellID ~= 0 and i<= SMT_CDB["CD_Icons"]["icon_num"] then
				f.icons[i]:Show()
			else
				f.icons[i]:Hide()
			end
		end
	end
	
	table.insert(party_cd.Frames, f)
end

local function UpdateCDBar(tag)
	for i = 1, #party_cd.Frames do
		local f = party_cd.Frames[i]		
		if tag == "all" or tag == "unit" then
			f.update_unit()
			f.point()
		end
		
		if tag == "all" or tag == "cd" then
			f.update_cd()
			f.lineup()
		end
	end
end

local function UpdateCD(name, spellID)
	for i = 1, #party_cd.Frames do
		local f = party_cd.Frames[i]
		if f.name and f.name == name then
			f.update_cd(spellID)
			f.lineup()
		end
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
			for i = 1,6 do
				if f.icons[i].cd:GetCooldownDuration() > 0 then
					f.icons[i]:SetAlpha(SMT_CDB["CD_Icons"]["alpha"]/100)
				end
			end
		end
	end
end

function party_cd:OnUpdate(unit, info)
	if not info.name or not info.class or not info.global_spec_id or not info.talents then return end
	
	if DefensiveSpells[info.class] then	
		if UnitInParty(info.name) then
			if not party_cd['Roster'][info.name] or party_cd['Roster'][info.name]["spec"] ~= info.global_spec_id then
				party_cd['Roster'][info.name] = {}
				party_cd['Roster'][info.name]["spec"] = info.global_spec_id
			
				for tag, spell_info in pairs (DefensiveSpells[info.class]) do
					if (spell_info.spec == "all" or spell_info.spec == info.global_spec_id) and (spell_info.talent == "all" or info.talents[spell_info.talent]) then
						party_cd['Roster'][info.name][spell_info.spellID] = {}
						party_cd['Roster'][info.name][spell_info.spellID]["dur"] = spell_info.cd
						party_cd['Roster'][info.name][spell_info.spellID]["tag"] = tag
						party_cd['Roster'][info.name][spell_info.spellID]["max_charge"] = spell_info.charge
						party_cd['Roster'][info.name][spell_info.spellID]["charge"] = spell_info.charge
					end
				end
			end
			UpdateCDBar("all")
		elseif party_cd['Roster'][info.name] then
		
			party_cd['Roster'][info.name] = nil
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
			if spellid ~= "spec" then
				party_cd['Roster'][player][spellid]["start"] = 0
			end
		end
	end
end

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
		
	elseif event == "ENCOUNTER_END" then
	
		--ResetCD()
		UpdateCDBar("cd")
		
	elseif event == "GROUP_ROSTER_UPDATE" then
		T.EditCDBar("show")
		UpdateCDBar("all")
		
	elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
		local Unit, _, spellID = ...
		local name = UnitName(Unit)
		
		if not name or not spellID then return end
		if party_cd['Roster'][name] then
			if party_cd['Roster'][name][spellID] then
				party_cd['Roster'][name][spellID]["start"] = GetTime()
				UpdateCD(name, spellID)
			end
			if spellID == 235219 then -- 急速冷却
				party_cd['Roster'][name][45438]["start"] = 0 -- 寒冰屏障
				UpdateCD(name, 45438)
			elseif spellID == 191427 then -- 恶魔变形
				local info = LGIST:GetCachedInfo (sourceGUID)
				if info.talents[22767] then -- 恶魔重生
					party_cd['Roster'][name][198589]["start"] = 0 -- 疾影
					UpdateCD(name, 198589)
				end
			end
		end
		
	end
end)