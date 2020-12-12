local T, C, L, G = unpack(select(2, ...))
	
local Character_default_Settings = {
	FramePoints = {},
	
	General = {
		disable_all = false,
	},
	
	AlertFrame = {
		enable = true,
		icon_size = 70,
		icon_space = 5,
		grow_dir = "BOTTOM",
		font_size = 40,
		ifont_size = 14,
		["1_aura_no_240559"] = true, -- 重伤
		["1_aura_no_240443"] = true, -- 崩裂
		["1_aura_no_209858"] = true, -- 死疽
		["1_aura_no_226512"] = true, -- 血池
	},
	
	TextFrame = {
		short = false,
		font_size = 30,
		Quaking = true, -- 震荡
		Explosive = true, -- 易爆
	},
	
	HL_Frame = {
		enable = true,
		position = "CENTER",
		iconSize = 30,
		iconAlpha = 80,
	},
	
	PlateAlerts = {
		enable = true,
		fsize = 7,
		size = 30,
		y = 30,
		Explosive_np = true, -- 易爆姓名板图标
		Bolster_np = true, -- 激励姓名板图标
		Sanguine_np = true, -- 血池姓名板图标
		Raging_np = true, -- 暴怒姓名板图标
		Ghuun_np = true, -- 戈霍恩共生体姓名板图标
	},
	
	CD_Icons = {
		enable = true,
		icon_size = 40,
		icon_space = 4,
		grow_dir = "RIGHT",
		hide_in_raid = true,
		x = 5,
		y = 0,
		alpha = 20,
	},
	
	typeToTrack = {
		INTERRUPT = true,
		HARDCC = true,
		SOFTCC = true,
		STHARDCC = true,
		STSOFTCC = true,
		DISPEL = true,
		DEFMDISPEL = true,
		EXTERNAL = true,
		HEALING = true,
		UTILITY = true,
		PERSONAL = true,
		IMMUNITY = true,
		DAMAGE = true,
		TANK = true,
	},
	
	spellToTrack = {
	
	},
	
	Icons = {

	},
	
	HL_Auras = {
	
	},
	
	HL_Cast = {
	
	},
	
	HL_Casting = {
	
	},
	
	PlateSpells = {

	},
	
	PlateAuras = {
		
	},
	
	PlatePower = {

	},
	
	ChatMsgAuras = {

	},
	
	ChatMsgBossWhispers = {

	},
}

local Account_default_Settings = {

}

function T.LoadVariables()
	if SMT_CDB == nil then
		SMT_CDB = {}
	end
	for a, b in pairs(Character_default_Settings) do
		if type(b) ~= "table" then
			if SMT_CDB[a] == nil then
				SMT_CDB[a] = b
			end
		else
			if SMT_CDB[a] == nil then
				SMT_CDB[a] = {}
			end
			for k, v in pairs(b) do
				if SMT_CDB[a][k] == nil then
					SMT_CDB[a][k] = v
				end
			end
		end
	end
end

function T.LoadAccountVariables()
	if SMT_DB == nil then
		SMT_DB = {}
	end
	for a, b in pairs(Account_default_Settings) do
		if type(b) ~= "table" then
			if SMT_DB[a] == nil then
				SMT_DB[a] = b
			end
		else
			if SMT_DB[a] == nil then
				SMT_DB[a] = {}
			end
			for k, v in pairs(b) do
				if SMT_DB[a][k] == nil then
					if v then
						SMT_DB[a][k] = v
					else
						print(a,k)
					end
				end
			end
		end
	end
end

local eventframe = CreateFrame("Frame")
eventframe:RegisterEvent("ADDON_LOADED")
eventframe:SetScript("OnEvent", function(self, event, ...)
	local addon = ...
	if addon ~= "SMT" then return end
	
	T.LoadVariables()
	T.LoadAccountVariables()
	
	for id, data in pairs(G.Dungeons) do
		local option_page = T.CreateOptions(EJ_GetInstanceInfo(id), G.gui, true)
		if data then
			for i = 1, #data do
				if data[i]["alerts"] then
					T.CreateMobOptions(option_page, data[i]["id"], data[i]["alerts"], data[i]["img"])
					if data[i]["alerts"]["PlateAlert"] and data[i]["alerts"]["PlateAlert"]["PlateSpells"] then
						local CreatureID = tostring(data[i]["id"])
						G.Npc[CreatureID] = {}
						for spell, cd in pairs(data[i]["alerts"]["PlateAlert"]["PlateSpells"]) do
							G.Npc[CreatureID][spell] = cd
						end
					end
				end
				
			end			
		end
	end
	
	local options = T.CreateOptions(L["制作"], G.gui)

	local info = T.createtext(options, "OVERLAY", 25, "OUTLINE", "CENTER")
	info:SetPoint("CENTER", options, "CENTER")
	info:SetText(L["制作文本"])

	model = CreateFrame("PlayerModel", nil, options)
	model:SetSize(200,200)
	model:SetPoint("BOTTOM", options, "CENTER", 0, 100)

	model:SetPosition(0, 0, 0)
	model:SetFacing(1)
	model:SetCreature(112144)

	model.text = T.createtext(model, "HIGHLIGHT", 20, "NONE", "CENTER")
	model.text:SetPoint("BOTTOM", model, "BOTTOM", 0, 25)
	model.text:SetTextColor(1, 1, 1)
	model.text:SetText(L["汪汪"])

	model.glow = model:CreateTexture(nil, "HIGHLIGHT")
	model.glow:SetSize(30, 30)
	model.glow:SetPoint("CENTER", model.text, "TOPRIGHT", -3, -5)
	model.glow:SetTexture("Interface\\Cooldown\\star4")
	model.glow:SetVertexColor(1, 1, 1, .7)
	model.glow:SetBlendMode("ADD")

	model:SetScript("OnEnter", function(self) self:SetFacing(0) end)
	model:SetScript("OnLeave", function(self) self:SetFacing(1) end)
		
	model:EnableMouse(true)
end)