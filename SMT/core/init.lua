
-- local T, C, L, G = unpack(select(2, ...))

local addon, ns = ...
ns[1] = {} -- T, functions, constants, variables
ns[2] = {} -- C, config
ns[3] = {} -- L, localization
ns[4] = {} -- G, globals (Optionnal)

--[[--------------
--     init     --
--------------]]--
local T, C, L, G = unpack(select(2, ...))

G.addon_name = "SMT"
G.addon_cname = "|cff87CEFASkyline|r Mythic+ Tools"
G.addon_c = "|cff87CEFA"

G.dragFrameList = {}
G.Dungeons = {}
G.Npc = {}

G.Font = GameFontHighlight:GetFont()

G.media = {
	blank = "Interface\\Buttons\\WHITE8x8",
	bar = "Interface\\AddOns\\SMT\\media\\statusbar",
	sounds = "Interface\\AddOns\\SMT\\media\\sounds\\",
	arrowUp = "Interface\\AddOns\\SMT\\media\\up",
	arrowDown = "Interface\\AddOns\\SMT\\media\\down",
	gradient = "Interface\\AddOns\\SMT\\media\\gradient",
}

G.Client = GetLocale()
G.Version = GetAddOnMetadata("SMT", "Version")
G.PlayerName = UnitName("player");
G.myClass = select(2, UnitClass("player"))

G.Ccolors = {}
if(IsAddOnLoaded'!ClassColors' and CUSTOM_CLASS_COLORS) then
	G.Ccolors = CUSTOM_CLASS_COLORS
else
	G.Ccolors = RAID_CLASS_COLORS
end

StaticPopupDialogs[G.addon_name.."Reset Confirm"] = {
	text = "",
	button1 = ACCEPT,
	button2 = CANCEL,
	hideOnEscape = 1, 
	whileDead = true,
	preferredIndex = 3,
}