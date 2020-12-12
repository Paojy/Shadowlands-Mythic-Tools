local T, C, L, G = unpack(select(2, ...))

local CurrentFrame = "NONE"
local selected

local function PlaceCurrentFrame()
	local f = _G[CurrentFrame]
	local points = SMT_CDB["FramePoints"][CurrentFrame]
	f:ClearAllPoints()
	f:SetPoint(points.a1, _G[points.parent], points.a2, points.x, points.y)
end

local function Reskinbox(box, name, value, ...)
	box:SetPoint(...)
	
	box.name = T.createtext(box, "OVERLAY", 12, "OUTLINE", "LEFT")
	box.name:SetPoint("BOTTOMLEFT", box, "TOPLEFT", 5, 8)
	box.name:SetText(G.addon_c..name.."|r")
	
	local bd = CreateFrame("Frame", nil, box)
	bd:SetPoint("TOPLEFT", -2, 0)
	bd:SetPoint("BOTTOMRIGHT")
	bd:SetFrameLevel(box:GetFrameLevel()-1)
	T.createborder(bd)

	box:SetFont(GameFontHighlight:GetFont(), 12, "OUTLINE")
	box:SetAutoFocus(false)
	box:SetTextInsets(3, 0, 0, 0)
	
	box:SetScript("OnShow", function(self)
		if CurrentFrame ~= "NONE" then
			self:SetText(SMT_CDB["FramePoints"][CurrentFrame][value])
		else
			self:SetText("")
		end
	end)
	
	box:SetScript("OnEscapePressed", function(self) 
		if CurrentFrame ~= "NONE" then
			self:SetText(SMT_CDB["FramePoints"][CurrentFrame][value])
		else
			self:SetText("")
		end
		self:ClearFocus()
	end)
	
	box:SetScript("OnEnterPressed", function(self)
		if CurrentFrame ~= "NONE" then
			SMT_CDB["FramePoints"][CurrentFrame][value] = self:GetText()
			PlaceCurrentFrame()
		else
			self:SetText("")
		end
		self:ClearFocus()
	end)
end

local Mover = CreateFrame("Frame", G.addon_name.."Mover", UIParent)
Mover:SetPoint("CENTER", 0, -300)
Mover:SetSize(540, 160)
Mover:SetFrameStrata("HIGH")
Mover:SetFrameLevel(30)
Mover:Hide()

Mover:RegisterForDrag("LeftButton")
Mover:SetScript("OnDragStart", function(self) self:StartMoving() end)
Mover:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
Mover:SetClampedToScreen(true)
Mover:SetMovable(true)
Mover:EnableMouse(true)

T.createborder(Mover)

Mover.curframe = T.createtext(Mover, "OVERLAY", 16, "OUTLINE", "LEFT")
Mover.curframe:SetPoint("TOP", Mover, "TOP", 0, -5)

local anchors = {"CENTER", "LEFT", "RIGHT", "TOP", "BOTTOM", "TOPLEFT", "TOPRIGHT", "BOTTOMLEFT", "BOTTOMRIGHT"}

-- a1
local Point1dropDown = CreateFrame("Frame", nil, Mover, "UIDropDownMenuTemplate")
Point1dropDown:SetPoint("TOPLEFT", Mover, "TOPLEFT", 0, -70)
T.ReskinDropDown(Point1dropDown)

Point1dropDown.name = T.createtext(Point1dropDown, "OVERLAY", 12, "OUTLINE", "LEFT")
Point1dropDown.name:SetPoint("BOTTOMLEFT", Point1dropDown, "TOPLEFT", 15, 5)
Point1dropDown.name:SetText(G.addon_c..L["锚点"].."1|r")

UIDropDownMenu_SetWidth(Point1dropDown, 100)
UIDropDownMenu_SetText(Point1dropDown, "")

UIDropDownMenu_Initialize(Point1dropDown, function(self, level, menuList)
	local info = UIDropDownMenu_CreateInfo()
	for i = 1, #anchors do
		info.text = anchors[i]
		info.checked = function()
			if CurrentFrame ~= "NONE" then
				return (SMT_CDB["FramePoints"][CurrentFrame]["a1"] == info.text)
			end
		end
		info.func = function(self)
			SMT_CDB["FramePoints"][CurrentFrame]["a1"] = anchors[i]
			PlaceCurrentFrame(true)
			UIDropDownMenu_SetSelectedName(Point1dropDown, anchors[i], true)
			UIDropDownMenu_SetText(Point1dropDown, anchors[i])
		end
		UIDropDownMenu_AddButton(info)
	end
end)

-- parent
local ParentBox = CreateFrame("EditBox", G.addon_name.."MoverParentBox", Mover)
ParentBox:SetSize(120, 20)
Reskinbox(ParentBox, L["锚点框体"], "parent", "LEFT", Point1dropDown, "RIGHT", -2, 2)

-- a2
local Point2dropDown = CreateFrame("Frame", nil, Mover, "UIDropDownMenuTemplate")
Point2dropDown:SetPoint("LEFT", ParentBox, "RIGHT", -4, -2)
T.ReskinDropDown(Point2dropDown)

Point2dropDown.name = T.createtext(Point2dropDown, "OVERLAY", 12, "OUTLINE", "LEFT")
Point2dropDown.name:SetPoint("BOTTOMLEFT", Point2dropDown, "TOPLEFT", 15, 5)
Point2dropDown.name:SetText(G.addon_c..L["锚点"].."2|r")

UIDropDownMenu_SetWidth(Point2dropDown, 100)
UIDropDownMenu_SetText(Point2dropDown, "")

UIDropDownMenu_Initialize(Point2dropDown, function(self, level, menuList)
	local info = UIDropDownMenu_CreateInfo()
	for i = 1, #anchors do
		info.text = anchors[i]
		info.checked = function()
			if CurrentFrame ~= "NONE" then
				return (SMT_CDB["FramePoints"][CurrentFrame]["a2"] == info.text)
			end
		end
		info.func = function(self)
			SMT_CDB["FramePoints"][CurrentFrame]["a2"] = anchors[i]
			PlaceCurrentFrame(true)
			UIDropDownMenu_SetSelectedName(Point2dropDown, anchors[i], true)
			UIDropDownMenu_SetText(Point2dropDown, anchors[i])
		end
		UIDropDownMenu_AddButton(info)
	end
end)

-- x
local XBox = CreateFrame("EditBox", G.addon_name.."MoverXBox", Mover)
XBox:SetSize(50, 20)
Reskinbox(XBox, "X", "x", "LEFT", Point2dropDown, "RIGHT", -2, 2)

-- y
local YBox = CreateFrame("EditBox", G.addon_name.."MoverYBox", Mover)
YBox:SetSize(50, 20)
Reskinbox(YBox, "Y", "y", "LEFT", XBox, "RIGHT", 15, 0)

local function DisplayCurrentFramePoint()
	local points = SMT_CDB["FramePoints"][CurrentFrame]
	UIDropDownMenu_SetText(Point1dropDown, points.a1)
	UIDropDownMenu_SetText(Point2dropDown, points.a2)
	ParentBox:SetText(points.parent)
	XBox:SetText(points.x)
	YBox:SetText(points.y)
end

local function EnableOptions()
	UIDropDownMenu_EnableDropDown(Point1dropDown)
	UIDropDownMenu_EnableDropDown(Point2dropDown)
	ParentBox:Enable()
	XBox:Enable()
	YBox:Enable()
end

local function DisableOptions()
	UIDropDownMenu_SetText(Point1dropDown, "")
	UIDropDownMenu_SetText(Point2dropDown, "")
	UIDropDownMenu_DisableDropDown(Point1dropDown)
	UIDropDownMenu_DisableDropDown(Point2dropDown)
	ParentBox:Disable()
	XBox:Disable()
	YBox:Disable()
end

-- reset
local ResetButton = T.createUIPanelButton(Mover, G.addon_name.."MoverResetButton", 250, 25, L["重置位置"])
ResetButton:SetPoint("BOTTOMLEFT", Mover, "BOTTOMLEFT", 20, 10)
ResetButton:SetScript("OnClick", function()
	if CurrentFrame ~= "NONE" then
		local frame = _G[CurrentFrame]
		
		SMT_CDB["FramePoints"][CurrentFrame].a1 = frame["point"].a1
		SMT_CDB["FramePoints"][CurrentFrame].parent = frame["point"].parent
		SMT_CDB["FramePoints"][CurrentFrame].a2 = frame["point"].a2
		SMT_CDB["FramePoints"][CurrentFrame].x = frame["point"].x
		SMT_CDB["FramePoints"][CurrentFrame].y = frame["point"].y
		
		PlaceCurrentFrame()
		DisplayCurrentFramePoint()
	end
end)

function T.CreateDragFrame(frame)
	local fname = frame:GetName()

	table.insert(G.dragFrameList, frame) --add frame object to the list
	
	frame:SetMovable(true)
	frame:SetClampedToScreen(true)
	
	frame.df = CreateFrame("Frame", fname.."DragFrame", UIParent)
	frame.df:SetAllPoints(frame)
	frame.df:SetFrameStrata("HIGH")
	frame.df:EnableMouse(true)
	frame.df:RegisterForDrag("LeftButton")
	frame.df:SetClampedToScreen(true)
	frame.df:SetScript("OnDragStart", function(self)
		frame:StartMoving()
		self.x, self.y = frame:GetCenter() -- 开始的位置
	end)
	frame.df:SetScript("OnDragStop", function(self) 
		frame:StopMovingOrSizing()
		local x, y = frame:GetCenter() -- 结束的位置
		local x1, y1 = ("%d"):format(x - self.x), ("%d"):format(y -self.y)
		SMT_CDB["FramePoints"][fname].x = SMT_CDB["FramePoints"][fname].x + x1
		SMT_CDB["FramePoints"][fname].y = SMT_CDB["FramePoints"][fname].y + y1
		PlaceCurrentFrame() -- 重新连接到锚点
		DisplayCurrentFramePoint()
	end)
	frame.df:Hide()
	
	--overlay texture
	frame.df.mask = T.createbdframe(frame.df)
	frame.df.mask.text = T.createtext(frame.df, "OVERLAY", 13, "OUTLINE", "LEFT")
	frame.df.mask.text:SetPoint("TOPLEFT")
	frame.df.mask.text:SetText(frame.movingname)
	
	frame.df:SetScript("OnMouseDown", function()
		CurrentFrame = fname
		Mover.curframe:SetText(L["选中的框体"].." "..G.addon_c..gsub(frame.movingname, "\n", "").."|r")
		DisplayCurrentFramePoint()
		if not selected then
			EnableOptions()
			selected = true
		end
		for i = 1, #G.dragFrameList do
			if G.dragFrameList[i]:GetName() == fname then
				G.dragFrameList[i].df.mask:SetBackdropBorderColor(0, 1, 1)
			else
				G.dragFrameList[i].df.mask:SetBackdropBorderColor(0, 0, 0)
			end
		end
	end)
end

T.UnlockAll = function()
	if not InCombatLockdown() then
		if CurrentFrame ~= "NONE" then
			Mover.curframe:SetText(L["选中的框体"].." "..G.addon_c..gsub(_G[CurrentFrame].movingname, "\n", "").."|r")
		else
			Mover.curframe:SetText(L["选中的框体"].." "..G.addon_c..CurrentFrame.."|r")
			DisableOptions()
		end
		for i = 1, #G.dragFrameList do
			G.dragFrameList[i].df:Show()
		end
		Mover:Show()
		G.gui:Hide()
	else
		Mover:RegisterEvent("PLAYER_REGEN_ENABLED")
		T.msg(L["进入战斗锁定"])
	end
end

T.LockAll = function()
	CurrentFrame = "NONE"
	DisableOptions()
	selected = false
	
	for i = 1, #G.dragFrameList do
		G.dragFrameList[i].df.mask:SetBackdropBorderColor(0, 0, 0)
		G.dragFrameList[i].df:Hide()
	end
	Mover:Hide()
end

T.PlaceAllFrames = function()		
	for i = 1, #G.dragFrameList do
		local frame = G.dragFrameList[i]
		local name = frame:GetName()
		
		if SMT_CDB["FramePoints"][name] == nil then
			SMT_CDB["FramePoints"][name] = frame.point
		else
			if SMT_CDB["FramePoints"][name]["a1"] == nil then
				SMT_CDB["FramePoints"][name]["a1"] = frame.point.a1
			end
			if SMT_CDB["FramePoints"][name]["a2"] == nil then
				SMT_CDB["FramePoints"][name]["a2"] = frame.point.a2
			end
			if SMT_CDB["FramePoints"][name]["parent"] == nil then
				SMT_CDB["FramePoints"][name]["parent"] = frame.point.parent
			end
			if SMT_CDB["FramePoints"][name]["x"] == nil then
				SMT_CDB["FramePoints"][name]["x"] = frame.point.x
			end
			if SMT_CDB["FramePoints"][name]["y"] == nil then
				SMT_CDB["FramePoints"][name]["y"] = frame.point.y
			end
		end
		
		local points = SMT_CDB["FramePoints"][name]
		G.dragFrameList[i]:ClearAllPoints()
		G.dragFrameList[i]:SetPoint(points.a1, _G[points.parent], points.a2, points.x, points.y)	
	end
end

T.ResetAll = function()
	for i = 1, #G.dragFrameList do
		local f = G.dragFrameList[i]
		SMT_CDB["FramePoints"][f:GetName()] = {}
		for k, v in pairs (f.point) do
			SMT_CDB["FramePoints"][f:GetName()][k] = v
		end
		CurrentFrame = f:GetName()
		PlaceCurrentFrame()
	end
	CurrentFrame = "NONE"
end

Mover:SetScript("OnEvent", function(self, event, arg1)
	if event == "PLAYER_REGEN_DISABLED" then
		if Mover:IsShown() then
			T.LockAll()
			T.msg(L["进入战斗锁定"])
		end
	elseif event == "PLAYER_REGEN_ENABLED" then
		T.UnlockAll()
		self:UnregisterEvent("PLAYER_REGEN_ENABLED")
	elseif event == "ADDON_LOADED" then
		if arg1 == G.addon_name then
			T.PlaceAllFrames()
			self:RegisterEvent("PLAYER_REGEN_DISABLED")
		end
	end
end)

Mover:RegisterEvent("ADDON_LOADED")

-- lock
local LockButton = T.createUIPanelButton(Mover, G.addon_name.."MoverLockButton", 250, 25, L["锁定框体"])
LockButton:SetPoint("LEFT", ResetButton, "RIGHT", 10, 0)
LockButton:SetScript("OnClick", function()
	T.LockAll()
end)