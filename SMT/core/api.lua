local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local font = G.Font

T.msg = function(msg)
	print(G.addon_cname.." >"..msg)
end

local day, hour, minute = 86400, 3600, 60
T.FormatTime = function(s)
    if s >= day then
        return format("%dd", floor(s/day + 0.5))
    elseif s >= hour then
        return format("%dh", floor(s/hour + 0.5))
    elseif s >= minute then
        return format("%dm", floor(s/minute + 0.5))
	elseif s >= 2 then
		return format("%ds", s)
	else
		return format("%.1fs", s)
    end
end

T.ShortValue = function(val)
	if type(val) == "number" then
		if G.Client == "zhCN" or G.Client == "zhTW" then
			if (val >= 1e7) then
				return ("%.1fkw"):format(val / 1e7)
			elseif (val >= 1e4) then
				return ("%.1fw"):format(val / 1e4)
			else
				return ("%d"):format(val)
			end
		else
			if (val >= 1e6) then
				return ("%.1fm"):format(val / 1e6)
			elseif (val >= 1e3) then
				return ("%.1fk"):format(val / 1e3)
			else
				return ("%d"):format(val)
			end
		end
	else
		return val
	end
end

T.pairsByKeys = function(t)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
		i = i + 1
        if a[i] == nil then return nil
        else return a[i], t[a[i]]
        end
      end
    return iter
end

T.GetIconLink = function(spellID)
	if not GetSpellInfo(spellID) then
		print(spellID.."出错 请检查")
		return spellID.."出错"
	end
	local icon = select(3, GetSpellInfo(spellID))
	return "|T"..icon..":12:12:0:0:64:64:4:60:4:60|t"..GetSpellLink(spellID)
end

local RTIconsList = {
	"|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_1:0|t", -- 星星
	"|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_2:0|t", -- 大饼
	"|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_3:0|t", -- 菱形
	"|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_4:0|t", -- 三角
	"|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_5:0|t", -- 月亮
	"|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_6:0|t", -- 方块
	"|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_7:0|t", -- 叉叉
	"|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_8:0|t", -- 骷髅
}

T.ColorUnitName = function(unit, name)	
	local r, g, b = 1, 1, 1
	if UnitIsPlayer(unit) then
		local _, class = UnitClass(unit)
		r, g, b = G.Ccolors[class].r, G.Ccolors[class].g, G.Ccolors[class].b
	else
		local reaction = UnitReaction(unit, "player")
		if reaction then
			r, g, b = FACTION_BAR_COLORS[reaction].r, FACTION_BAR_COLORS[reaction].g, FACTION_BAR_COLORS[reaction].b 
		end
	end
	local rt = GetRaidTargetIndex(unit)
	
	if rt then
		return (RTIconsList[rt]..'\n|cff%02x%02x%02x%s|r'):format(r * 255, g * 255, b * 255, name)
	else
		return ('\n|cff%02x%02x%02x%s|r'):format(r * 255, g * 255, b * 255, name)
	end
end

T.ColorName = function(name)
	if UnitClass(name) then
		return ("|c%s%s|r"):format(G.Ccolors[select(2, UnitClass(name))]["colorStr"], name)
	else
		return name
	end
end

T.SendChatMsg = function(msg, channel, rp)
	SendChatMessage(msg, channel)
	if rp then
		for i = 1, rp do
			C_Timer.After(i, function() SendChatMessage(msg, channel) end)
		end
	end
end

T.createborder = function(f, r, g, b)
	if f.style then return end
	
	f.sd = CreateFrame("Frame", nil, f, "BackdropTemplate")
	local lvl = f:GetFrameLevel()
	f.sd:SetFrameLevel(lvl == 0 and 1 or lvl - 1)
	f.sd:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8x8",
		edgeFile = "Interface\\AddOns\\SMT\\media\\glow",
		edgeSize = 3,
			insets = { left = 3, right = 3, top = 3, bottom = 3,}
		})
	f.sd:SetPoint("TOPLEFT", f, -3, 3)
	f.sd:SetPoint("BOTTOMRIGHT", f, 3, -3)
	if not (r and g and b) then
		f.sd:SetBackdropColor(.05, .05, .05, .5)
		f.sd:SetBackdropBorderColor(0, 0, 0)
	else
		f.sd:SetBackdropColor(r, g, b, .5)
		f.sd:SetBackdropBorderColor(r, g, b)
	end
	f.style = true
end

T.createbdframe = function(f)
	local bg
	
	if f:GetObjectType() == "Texture" then
		bg = CreateFrame("Frame", nil, f:GetParent(), "BackdropTemplate")
	else
		bg = CreateFrame("Frame", nil, f, "BackdropTemplate")
		local lvl = f:GetFrameLevel()
		bg:SetFrameLevel(lvl == 0 and 1 or lvl - 1)
	end
	
	bg:SetPoint("TOPLEFT", f, -3, 3)
	bg:SetPoint("BOTTOMRIGHT", f, 3, -3)
	
	bg:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8x8",
		edgeFile = "Interface\\AddOns\\SMT\\media\\glow",
		edgeSize = 3,
			insets = { left = 3, right = 3, top = 3, bottom = 3,}
		})
		
	bg:SetBackdropColor(.05, .05, .05, .5)
	bg:SetBackdropBorderColor(0, 0, 0)
	
	return bg
end

T.createtext = function(frame, layer, fontsize, flag, justifyh, shadow)
	local text = frame:CreateFontString(nil, layer)
	text:SetFont(font, fontsize, flag)
	text:SetJustifyH(justifyh)
	
	if shadow then
		text:SetShadowColor(0, 0, 0)
		text:SetShadowOffset(1, -1)
	end
	
	return text
end

T.createUIPanelButton = function(parent, name, width, height, text)
	local button = CreateFrame("Button", name, parent)
	button:SetSize(width, height)
	T.createborder(button)	
	
	button.text = T.createtext(button, "OVERLAY", 12, "OUTLINE", "CENTER")
	button.text:SetText(text)
	button.text:SetPoint("CENTER")

	button:SetScript("OnEnter", function()
		button.text:SetTextColor(1, 1, 0)
		button.sd:SetBackdropColor(1, 1, 0, 0.2)
		button.sd:SetBackdropBorderColor(1, 1, 0)
	end)
 	button:SetScript("OnLeave", function()
		button.text:SetTextColor(1, 1, 1)
		button.sd:SetBackdropColor(0, 0, 0, .3)
		button.sd:SetBackdropBorderColor(0, 0, 0)
	end)
	
	return button
end

local blizzTextures = {
	"Inset",
	"inset",
	"InsetFrame",
	"LeftInset",
	"RightInset",
	"NineSlice",
	"BG",
	"border",
	"Border",
	"Background",
	"BorderFrame",
	"bottomInset",
	"BottomInset",
	"bgLeft",
	"bgRight",
	"FilligreeOverlay",
	"PortraitOverlay",
	"ArtOverlayFrame",
	"Portrait",
	"portrait",
	"ScrollFrameBorder",
	"ScrollUpBorder",
	"ScrollDownBorder",
}

T.HiddenFrame = CreateFrame("Frame")
T.HiddenFrame:Hide()
	
T.HideObject = function(self)
	if self.UnregisterAllEvents then
		self:UnregisterAllEvents()
		self:SetParent(T.HiddenFrame)
	else
		self.Show = self.Hide
	end
	self:Hide()
end
	
T.StripTextures = function(self, kill)
	local frameName = self.GetName and self:GetName()
	for _, texture in pairs(blizzTextures) do
		local blizzFrame = self[texture] or (frameName and _G[frameName..texture])
		if blizzFrame then
			T.StripTextures(blizzFrame, kill)
		end
	end

	if self.GetNumRegions then
		for i = 1, self:GetNumRegions() do
			local region = select(i, self:GetRegions())
			if region and region.IsObjectType and region:IsObjectType("Texture") then
				if kill and type(kill) == "boolean" then
					T.HideObject(region)
				elseif tonumber(kill) then
					if kill == 0 then
						region:SetAlpha(0)
					elseif i ~= kill then
						region:SetTexture("")
					end
				else
					region:SetTexture("")
				end
			end
		end
	end
end

local blizzRegions = {
	"Left",
	"Middle",
	"Right",
	"Mid",
	"LeftDisabled",
	"MiddleDisabled",
	"RightDisabled",
	"TopLeft",
	"TopRight",
	"BottomLeft",
	"BottomRight",
	"TopMiddle",
	"MiddleLeft",
	"MiddleRight",
	"BottomMiddle",
	"MiddleMiddle",
	"TabSpacer",
	"TabSpacer1",
	"TabSpacer2",
	"_RightSeparator",
	"_LeftSeparator",
	"Cover",
	"Border",
	"Background",
	"TopTex",
	"TopLeftTex",
	"TopRightTex",
	"LeftTex",
	"BottomTex",
	"BottomLeftTex",
	"BottomRightTex",
	"RightTex",
	"MiddleTex",
	"Center",
}

-- Handle button
local function Button_OnEnter(self)
	if not self:IsEnabled() then return end
	button.sd:SetBackdropColor(1, 1, 0, 0.2)
	button.sd:SetBackdropBorderColor(1, 1, 0)
end
local function Button_OnLeave(self)
	button.sd:SetBackdropColor(0, 0, 0, .3)
	button.sd:SetBackdropBorderColor(0, 0, 0)
end
	
T.Reskin = function(self, noHighlight, override)
	if self.SetNormalTexture and not override then self:SetNormalTexture("") end
	if self.SetHighlightTexture then self:SetHighlightTexture("") end
	if self.SetPushedTexture then self:SetPushedTexture("") end
	if self.SetDisabledTexture then self:SetDisabledTexture("") end

	local buttonName = self.GetName and self:GetName()
	for _, region in pairs(blizzRegions) do
		region = buttonName and _G[buttonName..region] or self[region]
		if region then
			region:SetAlpha(0)
		end
	end

	self.sd = T.createbdframe(self)
	self.sd:SetFrameLevel(self:GetFrameLevel())
	self.sd:SetAllPoints()

	if not noHighlight then
		self:HookScript("OnEnter", Button_OnEnter)
		self:HookScript("OnLeave", Button_OnLeave)
	end
end
	
T.ReskinArrow = function(self, direction)
	self:SetSize(16, 16)
	T.Reskin(self, true)

	self:SetDisabledTexture(G.media.blank)
	local dis = self:GetDisabledTexture()
	dis:SetVertexColor(0, 0, 0, .3)
	dis:SetDrawLayer("OVERLAY")
	dis:SetAllPoints()

	local tex = self:CreateTexture(nil, "ARTWORK")
	tex:SetSize(8, 8)
	tex:SetPoint("CENTER")	
	tex:SetTexture(G.media.arrowDown)
	tex:SetVertexColor(1, 1, 1)
	
	self:HookScript("OnEnter", function()
		if not self:IsEnabled() then return end
		tex:SetVertexColor(1, 1, 0)
	end)
	self:HookScript("OnLeave", function()
		tex:SetVertexColor(1, 1, 1)
	end)
end
	
T.ReskinDropDown = function(self)
	T.StripTextures(self)

	local frameName = self.GetName and self:GetName()
	local down = self.Button or frameName and (_G[frameName.."Button"] or _G[frameName.."_Button"])

	local bg = T.createbdframe(self)
	bg:SetPoint("TOPLEFT", 16, -4)
	bg:SetPoint("BOTTOMRIGHT", -18, 8)

	down:ClearAllPoints()
	down:SetPoint("RIGHT", bg, -2, 0)
	T.ReskinArrow(down, "down")
end