local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local font = G.Font

----------------------------------------------------------
-----------------[[     Functions     ]]------------------
----------------------------------------------------------

local ReskinCheck = function(f)
	f:SetNormalTexture("")
	f:SetPushedTexture("")
	f:SetHighlightTexture(G.media.blank)
	
	local hl = f:GetHighlightTexture()
	hl:SetPoint("TOPLEFT", 5, -5)
	hl:SetPoint("BOTTOMRIGHT", -5, 5)
	hl:SetVertexColor(0, 1, 0, .2)

	local bd = CreateFrame("Frame", nil, f)
	bd:SetPoint("TOPLEFT", 4, -4)
	bd:SetPoint("BOTTOMRIGHT", -4, 4)
	bd:SetFrameLevel(f:GetFrameLevel()-1)
	T.createbdframe(bd)

	local tex = f:CreateTexture(nil, "BORDER")
	tex:SetTexture(G.media.gradient)
	tex:SetVertexColor(.5, .5, .5, .3)
	tex:SetPoint("TOPLEFT", 4, -4)
	tex:SetPoint("BOTTOMRIGHT", -4, 4)

	local ch = f:GetCheckedTexture()
	ch:SetDesaturated(true)
	ch:SetVertexColor(0, 1, 0)
end

local createcheckbutton = function(parent, x, y, name, t1, t2, value)
	local bu
	if t2 then
		bu = CreateFrame("CheckButton", addon_name..t1..t2..value.."Button", parent, "InterfaceOptionsCheckButtonTemplate")
	else
		bu = CreateFrame("CheckButton", addon_name..t1..value.."Button", parent, "InterfaceOptionsCheckButtonTemplate")	
	end
	ReskinCheck(bu)
	bu:SetPoint("TOPLEFT", x, y)
	bu:SetHitRectInsets(0, -50, 0, 0)
	
	_G[bu:GetName() .. "Text"]:SetText(name)
	
	bu:SetScript("OnDisable", function(self)
		local tex = select(7, bu:GetRegions())
		tex:SetVertexColor(.8, .8, .8, .5)
	end)
	
	bu:SetScript("OnEnable", function(self)
		local tex = select(7, bu:GetRegions())
		tex:SetVertexColor(.5, .5, .5, .3)
	end)
	
	if t2 then
		bu:SetScript("OnShow", function(self) self:SetChecked(SMT_CDB[t1][t2][value]) end)
		bu:SetScript("OnClick", function(self)
			if self:GetChecked() then
				SMT_CDB[t1][t2][value] = true
			else
				SMT_CDB[t1][t2][value] = false
			end
			if bu.apply then
				bu:apply()
			end
		end)		
	else
		bu:SetScript("OnShow", function(self) self:SetChecked(SMT_CDB[t1][value]) end)
		bu:SetScript("OnClick", function(self)
			if self:GetChecked() then
				SMT_CDB[t1][value] = true
			else
				SMT_CDB[t1][value] = false
			end
			if bu.apply then
				bu:apply()
			end
		end)	
	end
	
	return bu
end

local function TestSlider_OnValueChanged(self, value)
   if not self._onsetting then   -- is single threaded 
     self._onsetting = true
     self:SetValue(self:GetValue())
     value = self:GetValue()     -- cant use original 'value' parameter
     self._onsetting = false
   else return end               -- ignore recursion for actual event handler
 end
 
local ReskinSlider = function(f)
	f:SetBackdrop(nil)
	f.SetBackdrop = function() end

	local bd = CreateFrame("Frame", nil, f)
	bd:SetPoint("TOPLEFT", 14, -2)
	bd:SetPoint("BOTTOMRIGHT", -15, 3)
	bd:SetFrameLevel(f:GetFrameLevel()-1)
	T.createbdframe(bd)

	local slider = select(4, f:GetRegions())
	slider:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
	slider:SetBlendMode("ADD")
end

local createslider = function(parent, x, y, name, t1, t2, value, min, max, step)
	local slider
	if t2 then
		slider = CreateFrame("Slider", addon_name..t1..t2..value.."Slider", parent, "OptionsSliderTemplate")
	else
		slider = CreateFrame("Slider", addon_name..t1..value.."Slider", parent, "OptionsSliderTemplate")
	end
	slider:SetPoint("TOPLEFT", x, y)
	slider:SetWidth(120)
	ReskinSlider(slider)
	
	BlizzardOptionsPanel_Slider_Enable(slider)
	
	slider:SetMinMaxValues(min, max)
	_G[slider:GetName()..'Low']:SetText(min)
	_G[slider:GetName()..'Low']:ClearAllPoints()
	_G[slider:GetName()..'Low']:SetPoint("RIGHT", slider, "LEFT", -5, 0)
	_G[slider:GetName()..'High']:SetText(max)
	_G[slider:GetName()..'High']:ClearAllPoints()
	_G[slider:GetName()..'High']:SetPoint("LEFT", slider, "RIGHT", 5, 0)
	
	_G[slider:GetName()..'Text']:ClearAllPoints()
	_G[slider:GetName()..'Text']:SetPoint("BOTTOM", slider, "TOP", 0, 3)
	_G[slider:GetName()..'Text']:SetFontObject(GameFontHighlight)

	slider:SetValueStep(step)
	

	slider:SetScript("OnShow", function(self)
		if t2 then
			self:SetValue(SMT_CDB[t1][t2][value])
			_G[slider:GetName()..'Text']:SetText(name.." "..SMT_CDB[t1][t2][value])
		else
			self:SetValue(SMT_CDB[t1][value])
			_G[slider:GetName()..'Text']:SetText(name.." "..SMT_CDB[t1][value])
		end
	end)
	
	slider:SetScript("OnValueChanged", function(self, getvalue)
		if t2 then
			SMT_CDB[t1][t2][value] = getvalue
			TestSlider_OnValueChanged(self, getvalue)
			_G[slider:GetName()..'Text']:SetText(name.." "..SMT_CDB[t1][t2][value])
			if slider.apply then
				slider:apply()
			end
		else
			SMT_CDB[t1][value] = getvalue
			TestSlider_OnValueChanged(self, getvalue)
			_G[slider:GetName()..'Text']:SetText(name.." "..SMT_CDB[t1][value])
			if slider.apply then
				slider:apply()
			end
		end
	end)
	
	return slider	
end

local ReskinRadio = function(f)
	f:SetNormalTexture("")
	f:SetHighlightTexture("")
	f:SetCheckedTexture("Spells\\T_Star3")

	local ch = f:GetCheckedTexture()
	ch:SetPoint("TOPLEFT", -3, 3)
	ch:SetPoint("BOTTOMRIGHT", 3, -3)
	ch:SetBlendMode("ADD")
	ch:SetTexCoord( 0, 1, 0, 1)
	ch:SetVertexColor(0, 1, 0, .6)

	local bd = CreateFrame("Frame", nil, f)
	bd:SetPoint("TOPLEFT", 3, -3)
	bd:SetPoint("BOTTOMRIGHT", -3, 3)
	bd:SetFrameLevel(f:GetFrameLevel()-1)
	T.createbdframe(bd)
	f.bd = bd
	
	local tex = f:CreateTexture(nil, "BORDER")
	tex:SetTexture(G.media.gradient)
	tex:SetVertexColor(.5,.5,.5,.5)
	tex:SetPoint("TOPLEFT", 3, -3)
	tex:SetPoint("BOTTOMRIGHT", -3, 3)
	
	f:HookScript("OnEnter", function() f.bd:SetBackdropBorderColor(0, 1, 0) end)
	f:HookScript("OnLeave", function() f.bd:SetBackdropBorderColor(0, 0, 0) end)
end

local createradiobuttongroup = function(parent, x, y, name, t1, t2, value, group)
	local frame
	if t2 then
		frame = CreateFrame("Frame", addon_name..t1..t2..value.."RadioButtonGroup", parent)
	else
		frame = CreateFrame("Frame", addon_name..t1..value.."RadioButtonGroup", parent)
	end
	frame:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
	frame:SetSize(150, 30)
	
	frame.text = T.createtext(frame, "OVERLAY", 12, "NONE", "LEFT")
	frame.text:SetPoint("TOPLEFT", frame, "TOPLEFT")
	frame.text:SetText(name)
	
	for i = 1, #group do
	
		local k = group[i][1]
		local v = group[i][2]
		
		frame[k] = CreateFrame("CheckButton", addon_name..t1..value..k.."RadioButtonGroup", frame, "UIRadioButtonTemplate")
		ReskinRadio(frame[k])
		_G[frame[k]:GetName() .. "Text"]:SetText(v)
		
		if t2 then
			frame[k]:SetScript("OnShow", function(self)
				self:SetChecked(SMT_CDB[t1][t2][value] == k)
			end)
			
			frame[k]:SetScript("OnClick", function(self)
			
				if self:GetChecked() then
					
					SMT_CDB[t1][t2][value] = k
					if frame.apply then
						frame:apply()
					end
				else
					self:SetChecked(true)
				end
			end)
		else
			frame[k]:SetScript("OnShow", function(self)
				self:SetChecked(SMT_CDB[t1][value] == k)
			end)
			
			frame[k]:SetScript("OnClick", function(self)
				if self:GetChecked() then
					SMT_CDB[t1][value] = k
					if frame.apply then
						frame:apply()
					end
				else
					self:SetChecked(true)
				end
			end)
		end
	end
	
	for i = 1, #group do
	
		local k = group[i][1]
		
		frame[k]:HookScript("OnClick", function(self)
			if (t2 and SMT_CDB[t1][t2][value] == k) or (not t2 and SMT_CDB[t1][value] == k) then
				for index = 1, #group do
					local j = group[index][1]
					if j ~= k then
						frame[j]:SetChecked(false)
					end
				end
			end
		end)
	end
	
	local buttons = {frame:GetChildren()}
	for i = 1, #buttons do
		if i == 1 then
			buttons[i]:SetPoint("LEFT", frame.text, "RIGHT", 10, 0)
		else
			buttons[i]:SetPoint("LEFT", _G[buttons[i-1]:GetName() .. "Text"], "RIGHT", 5, 0)
		end
	end
	
	return frame
end

T.CreateTitle = function(options, text, y, pos)
	if y then
		local title = T.createtext(options, "OVERLAY", 15, "OUTLINE", "CENTER")
		title:SetText(text)
		
		local line = options:CreateTexture(nil, "ARTWORK")
		
		title:SetPoint("TOPLEFT", options, "TOPLEFT", 20, y)
		line:SetSize(options:GetWidth()-50, 1)
		line:SetPoint("TOPLEFT", options, "TOPLEFT", 20, y-20)
		line:SetColorTexture(1, 1, 1, .5)
	end
end

local ReskinScroll = function(f)
	local frame = f:GetName()
    
	local bu = (f.ThumbTexture or f.thumbTexture) or _G[frame.."ThumbTexture"]
	bu:SetAlpha(0)
	bu:SetWidth(17)

	T.createbdframe(bu)
	
	local up, down = f:GetChildren()
	
	up:SetWidth(17)
	T.createbdframe(up)
	up:SetNormalTexture("")
	up:SetHighlightTexture("")
	up:SetPushedTexture("")
	up:SetDisabledTexture(G.media.blank)
	local dis1 = up:GetDisabledTexture()
	dis1:SetVertexColor(0, 0, 0, .4)
	dis1:SetDrawLayer("OVERLAY")
	
	local uptex = up:CreateTexture(nil, "ARTWORK")
	uptex:SetTexture(G.media.arrowUp)
	uptex:SetSize(8, 8)
	uptex:SetPoint("CENTER")
	uptex:SetVertexColor(1, 1, 1)
	up.bgTex = uptex
	
	up:HookScript("OnEnter", function(f) 
		if f:IsEnabled() then
			f.bgTex:SetVertexColor(1, 1, 0)
		end
	end)
	up:HookScript("OnLeave", function(f) 
		f.bgTex:SetVertexColor(1, 1, 1)
	end)
	
	down:SetWidth(17)
	T.createbdframe(down)
	down:SetNormalTexture("")
	down:SetHighlightTexture("")
	down:SetPushedTexture("")
	down:SetDisabledTexture(G.media.blank)
	local dis2 = down:GetDisabledTexture()
	dis2:SetVertexColor(0, 0, 0, .4)
	dis2:SetDrawLayer("OVERLAY")
	
	local downtex = down:CreateTexture(nil, "ARTWORK")
	downtex:SetTexture(G.media.arrowDown)
	downtex:SetSize(8, 8)
	downtex:SetPoint("CENTER")
	downtex:SetVertexColor(1, 1, 1)
	down.bgTex = downtex

	down:HookScript("OnEnter", function(f) 
		if f:IsEnabled() then
			f.bgTex:SetVertexColor(1, 1, 0)
		end
	end)
	down:HookScript("OnLeave", function(f) 
		f.bgTex:SetVertexColor(1, 1, 1)
	end)
	
end

T.CreateOptions = function(text, parent, scroll)
	local options = CreateFrame("Frame", nil, parent)
	options:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, -15)
	options:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -10, 10)
	options:Hide()
	
	local tab = parent["tab"..parent.tabindex]
	tab.n = parent.tabindex
	tab:SetFrameLevel(parent:GetFrameLevel()+2)

	T.createborder(tab)

	tab.name = T.createtext(tab, "OVERLAY", 12, "OUTLINE", "LEFT")
	tab.name:SetText(text)
	tab.name:SetPoint("LEFT")
	
	tab:SetSize(130, 25)
	tab:SetPoint("TOPLEFT", parent, "TOPRIGHT", 5, -30*tab.n)
	
	if tab.n == 1 then
		tab.sd:SetBackdropBorderColor(1, 1, 0)
		options:Show()
	end
	
	tab:HookScript("OnMouseDown", function(self)
		options:Show()
		tab.sd:SetBackdropBorderColor(1, 1, 0)
	end)
	
	for i = 1, parent.tabnum do
		if i ~= tab.n then
			parent["tab"..i]:HookScript("OnMouseDown", function(self)
				options:Hide()
				tab.sd:SetBackdropBorderColor(0, 0, 0)
			end)
		end
	end
	
	parent.tabindex = parent.tabindex +1
	
	if scroll then
		options.sf = CreateFrame("ScrollFrame", G.addon_name..parent.tabindex.."ScrollFrame", options, "UIPanelScrollFrameTemplate")
		options.sf:SetPoint("TOPLEFT", options, "TOPLEFT", 10, -20)
		options.sf:SetPoint("BOTTOMRIGHT", options, "BOTTOMRIGHT", -35, 30)
		options.sf:SetFrameLevel(options:GetFrameLevel()+1)

		options.sfa = CreateFrame("Frame", G.addon_name..parent.tabindex.."ScrollAnchor", options.sf)
		options.sfa:SetPoint("TOPLEFT", options.sf, "TOPLEFT", 0, -3)
		options.sfa:SetWidth(options.sf:GetWidth()-20)
		options.sfa:SetHeight(options.sf:GetHeight())
		options.sfa:SetFrameLevel(options.sf:GetFrameLevel()+1)
		
		options.sf:SetScrollChild(options.sfa)
		options.sf.mobs = {}
		
		ReskinScroll(_G[G.addon_name..parent.tabindex.."ScrollFrameScrollBar"])
	end
	
	return options
end

T.Create_AlertIcon_Options = function(parent, v)
	local _, spell_type, _, spell_id = strsplit("_", v)
	local str
	
	if spell_type == "com" then
		str	= string.format(L["点我时显示图标提示"], T.GetIconLink(spell_id))
	elseif spell_type == "aura" then
		str	= string.format(L["显示图标提示光环"], T.GetIconLink(spell_id))
	elseif spell_type == "auras" then
		str	= string.format(L["显示图标提示多人光环"], T.GetIconLink(spell_id))
	elseif spell_type == "cast" then
		str	= string.format(L["显示图标提示施法"], T.GetIconLink(spell_id))
	else
		str	= string.format(L["显示图标提示"], T.GetIconLink(spell_id))
	end
	
	local bu = createcheckbutton(parent, 30, -parent.collapse - 5 - 30*parent.option_num, str, "Icons", false, v)
	bu.apply = function() G["Icons"][v].update_onedit("enable") end
	
	bu:SetScript("OnEnter", function(self) 
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT",  -20, 10)
		GameTooltip:SetSpellByID(spell_id)
		if bu.tip then
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine(G.addon_c..bu.tip.."|r")
		end
		GameTooltip:Show() 
	end)
	bu:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	parent.option_num = parent.option_num + 1
	bu:Hide()
	table.insert(parent.options, bu)
	
	return bu
end

T.Create_HLOnRaid_Options = function(parent, v, t)
	local _, spellID = string.split("_", v)
	spellID = tonumber(spellID)
	local str
	if t == "HL_Casting" then
		str = string.format(L["显示高亮图标施法"], T.GetIconLink(spellID))
	else
		str = string.format(L["显示高亮图标光环"], T.GetIconLink(spellID))
	end
	local bu = createcheckbutton(parent, 30, -parent.collapse - 5 - 30*parent.option_num, str, t, false, v)
	
	bu:SetScript("OnEnter", function(self) 
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT",  -20, 10)
		GameTooltip:SetSpellByID(spellID)
		if bu.tip then
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine(G.addon_c..bu.tip.."|r")
		end
		GameTooltip:Show() 
	end)
	bu:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	parent.option_num = parent.option_num + 1
	bu:Hide()
	table.insert(parent.options, bu)
end

T.Create_PlateAlert_Options = function(parent, v, t)
	
	local str
	
	if t == "PlateSpells" then
		str = string.format(L["显示姓名板图标施法"], T.GetIconLink(v))
	elseif t == "PlateAuras" then
		str = string.format(L["显示姓名板图标光环"], T.GetIconLink(v))
	else
		str = L["显示姓名板能量图标"]
	end
	
	local bu = createcheckbutton(parent, 30, -parent.collapse - 5 - 30*parent.option_num, str, t, false, v)
	
	if t == "PlateSpells" or t == "PlateAuras" then
		bu:SetScript("OnEnter", function(self) 
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT",  -20, 10)
			GameTooltip:SetSpellByID(v)
			if bu.tip then
				GameTooltip:AddLine(" ")
				GameTooltip:AddLine(G.addon_c..bu.tip.."|r")
			end
			GameTooltip:Show() 
		end)
		bu:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
		end)
	end
	
	parent.option_num = parent.option_num + 1
	bu:Hide()
	table.insert(parent.options, bu)
end

T.Create_ChatMsg_Options = function(parent, v, t)
	local str, bu
	if t == "ChatMsgAuras" then
		str = string.format(L["添加喊话"], T.GetIconLink(v))
		bu = createcheckbutton(parent, 30, -parent.collapse - 5 - 30*parent.option_num, str, "ChatMsgAuras", false, v)
	elseif t == "ChatMsgBossWhispers" then
		str = string.format(L["添加喊话"], T.GetIconLink(tonumber(v)))
		bu = createcheckbutton(parent, 30, -parent.collapse - 5 - 30*parent.option_num, str, "ChatMsgBossWhispers", false, v)
	end
	
	bu:SetScript("OnEnter", function(self) 
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT",  -20, 10)
		GameTooltip:SetSpellByID(v)
		if bu.tip then
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine(G.addon_c..bu.tip.."|r")
		end
		GameTooltip:Show() 
	end)
	bu:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	
	parent.option_num = parent.option_num + 1
	bu:Hide()
	table.insert(parent.options, bu)
end

T.CreateMobOptions = function(parent, id, options, image_id)
	local mf = CreateFrame("Frame", nil, parent.sfa)
	T.createborder(mf)
	mf.option_num = 0
	mf.options = {}
	
	if not parent.last_mob then
		mf:SetPoint("TOP", 0, -10)
	else
		mf:SetPoint("TOP", parent.last_mob, "BOTTOM", 0, -5)
	end
	
	parent.last_mob = mf
	
	if image_id then
		mf.collapse = 55
	else
		mf.collapse = 25
	end
	
	mf:SetSize(510,	mf.collapse)
	
	mf.title = T.createUIPanelButton(mf, nil, 510, mf.collapse, L.Npc[id])	
	mf.title:SetPoint("TOP")
	mf.title:SetScript("OnMouseDown", function()
		if mf.expand then
			for k, v in pairs(mf.options) do
				v:Hide()
			end
			mf:SetHeight(mf.collapse)
			mf.expand = false
		else		
			for k, v in pairs(mf.options) do
				v:Show()
			end
			mf:SetHeight(mf.collapse + 30*mf.option_num + 5)
			mf.expand = true
		end
	end)
		
	if image_id then
		mf.title.img = mf.title:CreateTexture(nil, "OVERLAY")
		mf.title.img:SetPoint("BOTTOMLEFT", 0, 0)
		mf.title.img:SetTexCoord( 0, 1, 0, .95)
		mf.title.img:SetSize(128, 64)
		mf.title.img:SetTexture(image_id)
	end
	
	for Alert_Type, Alerts in T.pairsByKeys(options) do
		if Alert_Type == "AlertIcon" then
			for v, args in T.pairsByKeys(Alerts) do
				if SMT_CDB["Icons"][v] == nil then
					SMT_CDB["Icons"][v] = true
				end
				local v_type = select(2, strsplit("_", v))
				if v_type == "aura" then
					T.CreateAura(mf, v, unpack(args))
				elseif v_type == "auras" then
					T.CreateAuras(mf, v, unpack(args))
				elseif v_type == "log" then
					T.CreateLog(mf, v, unpack(args))
				elseif v_type == "cast" then
					T.CreateCast(mf, v)
				elseif v_type == "com" then
					T.CreateCastingOnMe(mf, v)
				elseif v_type == "bmsg" then
					T.CreateBossMsg(mf, v, unpack(args))
				end
			end	
		elseif Alert_Type == "HLOnRaid" then
			for v, t in T.pairsByKeys(Alerts) do
				if SMT_CDB[t][v] == nil then
					SMT_CDB[t][v] = true
				end
				T.Create_HL_EventFrame(mf, v, t)
			end
		elseif Alert_Type == "PlateAlert" then
			for v, t in T.pairsByKeys(Alerts) do
				if t == "PlatePower" then
					if SMT_CDB[t][id] == nil then
						SMT_CDB[t][id] = true
					end
					T.Create_PlateAlert_Options(mf, id, t)
				else
					if SMT_CDB[t][v] == nil then
						SMT_CDB[t][v] = true
					end
					T.Create_PlateAlert_Options(mf, v, t)
				end
			end
		elseif Alert_Type == "ChatMsg" then
			for v, t in pairs(Alerts) do				
				if SMT_CDB[t][v] == nil then
					SMT_CDB[t][v] = true
				end
				T.Create_ChatMsg_Options(mf, v, t)
			end
		end
	end
end

T.CreateAffixAuraOptions = function(parent, v, affix_id, x, y)
	local affix = C_ChallengeMode.GetAffixInfo(affix_id)
	local text = string.format(L["显示图标提示"], affix)
	local bu = createcheckbutton(parent, x, -y, text, "AlertFrame", nil, v)
	bu.apply = function() G["Icons"][v].update_onedit("enable") end
	parent.AlertFrame_enable:HookScript("OnShow", function(self)
		if self:GetChecked() and self:IsEnabled() then
			bu:Enable()
		else
			bu:Disable()
		end
	end)
	parent.AlertFrame_enable:HookScript("OnClick", function(self)
		if self:GetChecked() and self:IsEnabled() then
			bu:Enable()
		else
			bu:Disable()
		end
	end)
end
----------------------------------------------------------
-----------------[[        GUI        ]]------------------
----------------------------------------------------------

local gui = CreateFrame("Frame", addon_name.."_GUI", UIParent)
gui:SetSize(600, 920)
gui:SetScale(1)
gui:SetPoint("CENTER", UIParent, "CENTER")
gui:SetFrameStrata("HIGH")
gui:SetFrameLevel(2)
gui:Hide()

gui:RegisterForDrag("LeftButton")
gui:SetScript("OnDragStart", function(self) self:StartMoving() end)
gui:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
gui:SetClampedToScreen(true)
gui:SetMovable(true)
gui:SetUserPlaced(true)
gui:EnableMouse(true)
T.createborder(gui)

gui.title = T.createtext(gui, "OVERLAY", 15, "OUTLINE", "CENTER")
gui.title:SetPoint("BOTTOM", gui, "TOP", 0, -5)
gui.title:SetText(G.addon_cname.." "..G.Version)

gui.close = CreateFrame("Button", nil, gui)
gui.close:SetPoint("BOTTOMRIGHT", -3, 3)
gui.close:SetSize(20, 20)
gui.close:SetNormalTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Up")
gui.close:SetHighlightTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Highlight")
gui.close:SetPushedTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Down")
gui.close:SetPushedTextOffset(3, 3)
gui.close:SetScript("OnClick", function() gui:Hide() end)

G.gui = gui
----------------------------------------------------------
--------------[[     General Settings     ]]--------------
----------------------------------------------------------
gui.tabindex = 1
gui.tabnum = 16
for i = 1, 16 do
	gui["tab"..i] = CreateFrame("Frame", addon_name.."GUI Tab"..i, gui)
	gui["tab"..i]:SetScript("OnMouseDown", function() end)
end

local options = T.CreateOptions(L["通用"], gui)
gui.Options = options

T.CreateTitle(options, L["通用"], -20)

local resetposbutton = T.createUIPanelButton(options, addon_name.."ResetPosButton", 100, 25, L["重置位置"])
resetposbutton:SetPoint("TOPLEFT", options, "TOPLEFT", 50, -50)
resetposbutton:SetScript("OnClick", function()
	StaticPopupDialogs[G.addon_name.."Reset Confirm"].text = L["重置位置确认"]
	StaticPopupDialogs[G.addon_name.."Reset Confirm"].OnAccept = function()
		T.ResetAll()
	end
	StaticPopup_Show(G.addon_name.."Reset Confirm")
end)

local unlockbutton = T.createUIPanelButton(options, G.addon_name.."UnlockAllFramesButton", 100, 25, L["解锁框体"])
unlockbutton:SetPoint("LEFT", resetposbutton, "RIGHT", 10, 0)
unlockbutton:SetScript("OnClick", function()
	T.UnlockAll()
end)

local resetbutton = T.createUIPanelButton(options, G.addon_name.."ResetButton", 100, 25, L["重置所有设置"])
resetbutton:SetPoint("LEFT", unlockbutton, "RIGHT", 10, 0)
resetbutton:SetScript("OnClick", function()
	StaticPopupDialogs[G.addon_name.."Reset Confirm"].text = L["重置所有设置确认"]
	StaticPopupDialogs[G.addon_name.."Reset Confirm"].OnAccept = function()
		SMT_CDB = nil
		SMT_DB = nil
		ReloadUI()
	end
	StaticPopup_Show(G.addon_name.."Reset Confirm")
end)

local testbutton = T.createUIPanelButton(options, G.addon_name.."TestButton", 100, 25, L["测试"])
testbutton:SetPoint("LEFT", resetbutton, "RIGHT", 10, 0)
testbutton:SetScript("OnClick", function()
	for k, frame in pairs(G.Test) do
		frame.StartTest()
	end
	gui:Hide()
end)

options.Golbal_disable_all = createcheckbutton(options, 50, -90, L["禁用插件"], "General", false, "disable_all")
options.Golbal_disable_all.apply = function() T.UpdateAll() end

T.CreateTitle(options, L["图标提示"], -130)

options.AlertFrame_enable = createcheckbutton(options, 40, -160, L["启用"], "AlertFrame", false, "enable")
options.AlertFrame_enable.apply = function() T.EditAlertFrame("enable") end

local growdirection_group = {
	{"RIGHT",  L["左"]},	
	{"LEFT",   L["右"]},
	{"BOTTOM", L["上"]},
	{"TOP",    L["下"]},	
}
options.AlertFrame_grow_dir = createradiobuttongroup(options, 150, -166, L["排列方向"], "AlertFrame", false, "grow_dir", growdirection_group)
options.AlertFrame_grow_dir.apply = function() T.EditAlertFrame("grow_dir") end

options.AlertFrame_icon_size = createslider(options, 60, -210, L["图标大小"], "AlertFrame", false, "icon_size", 30, 100, 1)
options.AlertFrame_icon_size.apply = function() T.EditAlertFrame("icon_size") end

options.AlertFrame_icon_space = createslider(options, 300, -210, L["图标间距"], "AlertFrame", false, "icon_space", 0, 20, 1)
options.AlertFrame_icon_space.apply = function() T.EditAlertFrame("icon_space") end

options.AlertFrame_font_size = createslider(options, 60, -250, L["大字体大小"], "AlertFrame", false, "font_size", 20, 60, 1)
options.AlertFrame_font_size.apply = function() T.EditAlertFrame("font_size") end

options.AlertFrame_ifont_size = createslider(options, 300, -250, L["小字体大小"], "AlertFrame", false, "ifont_size", 10, 20, 1)
options.AlertFrame_ifont_size.apply = function() T.EditAlertFrame("ifont_size") end

T.CreateTitle(options, L["团队高亮图标"], -340)

options.HL_Frame_enable = createcheckbutton(options, 40, -370, L["启用"], "HL_Frame", false, "enable")

options.HL_Frame_icon_size = createslider(options, 60, -410, L["图标大小"], "HL_Frame", false, "iconSize", 15, 40, 1)

options.HL_Frame_icon_alpha = createslider(options, 300, -410, L["图标透明度"], "HL_Frame", false, "iconAlpha", 10, 100, 1)

local anchors = {
	{"CENTER",		 L["中间"]}, 
	{"LEFT",		 L["左"]},
	{"RIGHT",		 L["右"]},
	{"TOP", 		 L["上"]},
	{"BOTTOM",		 L["下"]},
	{"TOPLEFT",		 L["左上"]},
	{"TOPRIGHT",	 L["右上"]},
	{"BOTTOMLEFT",	 L["左下"]},
	{"BOTTOMRIGHT",	 L["右下"]},
}

options.HL_Frame_position = createradiobuttongroup(options, 40, -450, L["锚点"], "HL_Frame", false, "position", anchors)
options.HL_Frame_position.apply = function() T.EditHL() end

T.CreateTitle(options, L["姓名板图标"], -480)

options.PlateAlerts_enable = createcheckbutton(options, 40, -510, L["启用"], "PlateAlerts", false, "enable")
options.PlateAlerts_enable.apply = function() T.EditPlateIcons("enable") end

options.PlateAlerts_size = createslider(options, 60, -550, L["图标大小"], "PlateAlerts", false, "size", 20, 50, 1)
options.PlateAlerts_size.apply = function() T.EditPlateIcons("icon_size") end

options.PlateAlerts_fsize = createslider(options, 220, -550, L["字体大小"], "PlateAlerts", false, "fsize", 6, 16, 1)
options.PlateAlerts_fsize.apply = function() T.EditPlateIcons("font_size") end

options.PlateAlerts_y = createslider(options, 380, -550, L["垂直距离"], "PlateAlerts", false, "y", -50, 50, 1)
options.PlateAlerts_y.apply = function() T.EditPlateIcons("y") end

local function CreateAffixNPOptions(v, affix_id, x, y)
	local affix = C_ChallengeMode.GetAffixInfo(affix_id)
	local bu = createcheckbutton(options, x, y, string.format(L["显示姓名板图标"], affix), "PlateAlerts", false, v)
	bu.apply = function() T.EditPlateIcons(v) end
	options.PlateAlerts_enable:HookScript("OnShow", function(self)
		if self:GetChecked() and self:IsEnabled() then
			bu:Enable()
		else
			bu:Disable()
		end
	end)
	options.PlateAlerts_enable:HookScript("OnClick", function(self)
		if self:GetChecked() and self:IsEnabled() then
			bu:Enable()
		else
			bu:Disable()
		end
	end)
	options[v] = bu
end

CreateAffixNPOptions("Explosive_np", 13, 40, -580)
CreateAffixNPOptions("Bolster_np", 7, 240, -580)
CreateAffixNPOptions("Sanguine_np", 8, 40, -610)
CreateAffixNPOptions("Raging_np", 6, 240, -610)

T.CreateTitle(options, L["文字提示"], -640)

options.TextFrame_font_size = createslider(options, 60, -690, L["字体大小"], "TextFrame", false, "font_size", 20, 80, 1)
options.TextFrame_font_size.apply = function() T.EditTextFrame("font_size") end

options.TextFrame_short = createcheckbutton(options, 240, -685, L["缩写"], "TextFrame", false, "short")
options.TextFrame_short.apply = function()
	G.Test["Quaking"].update_onedit()
	G.Test["Explosive"].update_onedit()
end

local function CreateAffixTextOptions(v, affix_id, x, y)
	local affix = C_ChallengeMode.GetAffixInfo(affix_id)
	local bu = createcheckbutton(options, x, y, string.format(L["显示文字提示"], affix), "TextFrame", false, v)
	bu.apply = function() G.Texts[v].update_onedit("enable") end
end

CreateAffixTextOptions("Quaking", 14, 40, -720)
CreateAffixTextOptions("Explosive", 13, 240, -720)

T.CreateTitle(options, L["小队减伤CD"], -750)

options.CD_Icons_enable = createcheckbutton(options, 40, -780, L["启用"], "CD_Icons", false, "enable")
options.CD_Icons_enable.apply = function() T.EditCDBar("show") end

options.CD_Icons_grow_dir = createradiobuttongroup(options, 150, -786, L["排列方向"], "CD_Icons", false, "grow_dir", growdirection_group)
options.CD_Icons_grow_dir.apply = function() T.EditCDBar("pos") end

options.CD_Icons_hideinraid = createcheckbutton(options, 380, -780, L["在团队中隐藏"], "CD_Icons", false, "hide_in_raid")
options.CD_Icons_hideinraid.apply = function() T.EditCDBar("show") end

options.CD_Icons_size = createslider(options, 60, -820, L["图标大小"], "CD_Icons", false, "icon_size", 20, 60, 1)
options.CD_Icons_size.apply = function() T.EditCDBar("size") end

options.CD_Icons_space = createslider(options, 220, -820, L["图标间距"], "CD_Icons", false, "icon_space", 0, 10, 1)
options.CD_Icons_space.apply = function() T.EditCDBar("pos") end

options.CD_Icons_num = createslider(options, 380, -820, L["图标数量"], "CD_Icons", false, "icon_num", 1, 6, 1)
options.CD_Icons_num.apply = function() T.EditCDBar("pos") end

options.CD_Icons_x = createslider(options, 60, -860, L["水平位置偏移"], "CD_Icons", false, "x", -20, 20, 1)
options.CD_Icons_x.apply = function() T.EditCDBar("pos") end

options.CD_Icons_y = createslider(options, 220, -860, L["垂直位置偏移"], "CD_Icons", false, "y", -20, 20, 1)
options.CD_Icons_y.apply = function() T.EditCDBar("pos") end

options.CD_Icons_alpha = createslider(options, 380, -860, L["冷却中图标透明度"], "CD_Icons", false, "alpha", 0, 100, 5)
options.CD_Icons_alpha.apply = function() T.EditCDBar("alpha") end

----------------------------------------------------------
--------------------[[     CMD     ]]---------------------
----------------------------------------------------------

SLASH_SMT1 = "/smt"
SLASH_SMT2 = "/skyline"
SlashCmdList["SMT"] = function(arg)
	if gui:IsShown() then
		gui:Hide()
	else
		gui:Show()
	end
end