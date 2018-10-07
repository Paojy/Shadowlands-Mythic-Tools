local T, C, L, G = unpack(select(2, ...))

local addon_name = G.addon_name
local font = G.Font

G.Test = {}
G.Icons = {}
G.Texts = {}
G.HL_Holders = {}
G.Plate_IconHolders = {}
----------------------------------------------------------
-----------------[[    Frame Holder    ]]------------------
----------------------------------------------------------
local FrameHolder = CreateFrame("Frame", addon_name.."FrameHolder", UIParent)
G.FrameHolder = FrameHolder

local update_rate = 0.05
local glow_updaterate = 0.05
local glow_value = 0
G.glow_value = glow_value

FrameHolder:SetScript("OnUpdate", function(self, e)
	glow_updaterate = glow_updaterate - e
	if glow_updaterate <= 0 then
		glow_value = glow_value + 0.05
		if glow_value >= .5 then
			glow_value = -.5
		end
		glow_updaterate = 0.05
	end
end)

T.UpdateAll = function()
	if SMT_CDB["General"]["disable_all"] then
		FrameHolder:Hide()
	else
		FrameHolder:Show()
	end
	-- update
	T.EditAlertFrame("all")
	T.EditTextFrame("all")
	T.EditPlateIcons("enable")
	T.EditCDBar("show")
end

FrameHolder:RegisterEvent("PLAYER_ENTERING_WORLD")
FrameHolder:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		T.UpdateAll()
		FrameHolder:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end
end)

----------------------------------------------------------
-----------------[[    Alert Frame    ]]------------------
----------------------------------------------------------

local AlertFrame = CreateFrame("Frame", addon_name.."AlertFrame", FrameHolder)
AlertFrame:SetSize(70,70)

AlertFrame.movingname = L["图标提示"]
AlertFrame.point = { a1 = "BOTTOMRIGHT", parent = "UIParent", a2 = "CENTER", x = -220, y = -20 }
T.CreateDragFrame(AlertFrame)

T.EditAlertFrame = function(option)
	if option == "all" or option == "icon_size" then
		AlertFrame:SetSize(SMT_CDB["AlertFrame"]["icon_size"], SMT_CDB["AlertFrame"]["icon_size"])
	end
	for k, frame in pairs(G.Icons) do
		frame.update_onedit(option)
	end
end

AlertFrame.ActiveIcons = {}
AlertFrame.LineUpIcons = function()
	local lastframe
	local grow_dir = SMT_CDB["AlertFrame"]["grow_dir"]
	local space = SMT_CDB["AlertFrame"]["icon_space"]
	for v, frame in T.pairsByKeys(AlertFrame.ActiveIcons) do
		frame:ClearAllPoints()
		frame.text:ClearAllPoints()
		
		if grow_dir == "TOP" or grow_dir == "BOTTOM" then
			frame.text:SetPoint("LEFT", frame, "RIGHT", 10, 0)
			frame.text:SetJustifyH("LEFT")
		else
			frame.text:SetPoint("TOP", frame, "BOTTOM", 0, -5)
			frame.text:SetJustifyH("CENTER")
		end
		
		if not lastframe then
			frame:SetPoint(grow_dir, AlertFrame, grow_dir)
		elseif grow_dir == "BOTTOM" then
			frame:SetPoint(grow_dir, lastframe, "TOP", 0, space)
		elseif grow_dir == "TOP" then
			frame:SetPoint(grow_dir, lastframe, "BOTTOM", 0, -space)
		elseif grow_dir == "LEFT" then
			frame:SetPoint(grow_dir, lastframe, "RIGHT", space, 0)
		elseif grow_dir == "RIGHT" then
			frame:SetPoint(grow_dir, lastframe, "LEFT", -space, 0)	
		end
		lastframe = frame
	end
end

AlertFrame.QueueIcon = function(frame)
	frame:HookScript("OnShow", function()
		AlertFrame.ActiveIcons[frame.v] = frame
		AlertFrame.LineUpIcons()
	end)
	
	frame:HookScript("OnHide", function()
		AlertFrame.ActiveIcons[frame.v] = nil
		AlertFrame.LineUpIcons()
	end)
end

T.CreateAlertIcon = function(v, r, g, b)
	local frame = CreateFrame("Frame", nil, AlertFrame)
	frame:SetSize(70,70)
	frame:Hide()
	T.createborder(frame)
	
	frame.map_id, _, frame.hl, frame.spell_id = strsplit("_", v)
	frame.map_id = tonumber(frame.map_id)
	frame.spell_id = tonumber(frame.spell_id)
	
	frame.spell_name, _, frame.spell_icon, frame.cast_time = GetSpellInfo(frame.spell_id)
	frame.v = v
	frame.t = 0
	
	frame.glow = frame:CreateTexture(nil, "OVERLAY")
	frame.glow:SetPoint("TOPLEFT", -25, 25)
	frame.glow:SetPoint("BOTTOMRIGHT", 25, -25)
	frame.glow:SetAlpha(1)
	frame.glow:SetTexture([[Interface\SpellActivationOverlay\IconAlert]])
	frame.glow:SetTexCoord(0.00781250, 0.50781250, 0.27734375, 0.52734375)
	
	if frame.hl == "hl" then
		frame.glow:Show()
	else
		frame.glow:Hide()
	end
	
	frame.texture = frame:CreateTexture(nil, "ARTWORK")
	frame.texture:SetTexCoord( .1, .9, .1, .9)
	frame.texture:SetAllPoints()
	frame.texture:SetTexture(frame.spell_icon)
	
	frame.bottomtext = T.createtext(frame, "OVERLAY", 12, "OUTLINE", "CENTER")
	frame.bottomtext:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", -2, 10)
	frame.bottomtext:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 2, 10)
	frame.bottomtext:SetHeight(12)
	frame.bottomtext:SetTextColor(1, 1, 0)
	frame.bottomtext:SetText(frame.spell_name)
	
	frame.toptext = T.createtext(frame, "OVERLAY", 25, "OUTLINE", "CENTER")
	frame.toptext:SetPoint("TOPLEFT", frame, "TOPLEFT", -2, -10)
	frame.toptext:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 2, -10)
	frame.toptext:SetHeight(25)
	frame.toptext:SetTextColor(0, 1, 1)
	
	frame.text = T.createtext(frame, "OVERLAY", 40, "OUTLINE", "LEFT")
	frame.text:SetTextColor(r, g, b)
	
	return frame
end

T.CreateTestIcon = function(v, dur, r, g, b)

	local frame = T.CreateAlertIcon(v, r, g, b)

	frame.reset = function()
		frame:Hide()
		frame.exp = false
	end
	
	frame.update_onedit = function()
		frame.enable = SMT_CDB["AlertFrame"]["enable"]
		if frame.enable then
			frame:RegisterEvent("CHAT_MSG_ADDON")
		else
			frame:UnregisterEvent("CHAT_MSG_ADDON")
		end		
		
		frame:SetSize(SMT_CDB["AlertFrame"]["icon_size"], SMT_CDB["AlertFrame"]["icon_size"])
		frame.glow:SetPoint("TOPLEFT", -SMT_CDB["AlertFrame"]["icon_size"]/3, SMT_CDB["AlertFrame"]["icon_size"]/3)
		frame.glow:SetPoint("BOTTOMRIGHT", SMT_CDB["AlertFrame"]["icon_size"]/3, -SMT_CDB["AlertFrame"]["icon_size"]/3)					
		
		frame.text:SetFont(G.Font, SMT_CDB["AlertFrame"]["font_size"], "OUTLINE")
		frame.bottomtext:SetFont(G.Font, SMT_CDB["AlertFrame"]["ifont_size"], "OUTLINE")
		
		AlertFrame.LineUpIcons()
	end
	
	frame.update_onevent = function()
		if frame.enable then
			frame.exp = GetTime() + dur
			frame:Show()	
		else
			frame.reset()
		end
	end
	
	frame.update_onframe = function()
		if frame.enable and frame.exp then	
			local remain = frame.exp - GetTime()
			frame.text:SetText(T.FormatTime(remain))
			if remain <= 0 then
				frame.reset()
			end
		else
			frame.reset()
		end
	end
	
	frame.StartTest = function()
		frame.update_onevent()
	end
	
	frame:SetScript("OnUpdate", function(self, e)
		frame.t = frame.t + e
		if frame.t > update_rate then	
			frame.update_onframe()
			frame.t = 0
		end
	end)
	
	AlertFrame.QueueIcon(frame)	
	
	G.Icons[v] = frame
	G.Test[v] = frame
	
	return frame
end

T.CreateAura = function(option_page, v, aura_type, unit, arg_index)
	local frame = T.CreateAlertIcon(v, 1, .5, .2)
	
	frame.reset = function()
		frame:Hide()
		frame.count = false
		frame.dur = false
		frame.exp = false
	end
	
	frame.update_onedit = function(option)
		if option == "all" or option == "enable" then
		
			frame.enable = SMT_CDB["Icons"][v] and SMT_CDB["AlertFrame"]["enable"]
			if frame.enable then		
				frame:RegisterEvent("PLAYER_ENTERING_WORLD")			
			else
				frame:UnregisterEvent("PLAYER_ENTERING_WORLD")	
			end
			
			frame.update_onevent("INIT")
		end
		
		if option == "all" or option == "icon_size" then
			frame:SetSize(SMT_CDB["AlertFrame"]["icon_size"], SMT_CDB["AlertFrame"]["icon_size"])
			frame.glow:SetPoint("TOPLEFT", -SMT_CDB["AlertFrame"]["icon_size"]/3, SMT_CDB["AlertFrame"]["icon_size"]/3)
			frame.glow:SetPoint("BOTTOMRIGHT", SMT_CDB["AlertFrame"]["icon_size"]/3, -SMT_CDB["AlertFrame"]["icon_size"]/3)
		end
		
		if option == "all" or option == "font_size" then
			frame.text:SetFont(G.Font, SMT_CDB["AlertFrame"]["font_size"], "OUTLINE")
		end
		
		if option == "all" or option == "ifont_size" then
			frame.bottomtext:SetFont(G.Font, SMT_CDB["AlertFrame"]["ifont_size"], "OUTLINE")
		end
		
		if option == "all" or option == "grow_dir" or option == "icon_space" then
			AlertFrame.LineUpIcons()
		end
	end
	
	frame.Update = function()
		if frame.enable and AuraUtil.FindAuraByName(frame.spell_name, unit, aura_type) then 
			frame.dur, frame.exp = select(5, AuraUtil.FindAuraByName(frame.spell_name, unit, aura_type))
			frame:Show()
		else
			frame.reset()
		end
	end
	
	frame.map_check = function()
		local map = select(8, GetInstanceInfo())
		if frame.enable and map == frame.map_id then
			frame:RegisterEvent("UNIT_AURA")
		else
			frame:UnregisterEvent("UNIT_AURA")
			frame.reset()
		end
	end
	
	frame.update_onevent = function(event, ...)
		if event == "INIT" then
			frame.map_check()
			frame.Update()
		elseif event == "PLAYER_ENTERING_WORLD" then
			frame.map_check()
		elseif event == "UNIT_AURA" then
			local u = ...
			if u == unit then
				frame.Update()
			end
		end
	end
	
	frame.update_onframe = function()
		if frame.enable and frame.exp then
			local count, time = "",""
			
			if arg_index then
				frame.count = T.ShortValue(select(arg_index, AuraUtil.FindAuraByName(frame.spell_name, unit, aura_type)))
				if frame.count then
					count = "["..frame.count.."] "
				end
			else
				frame.count = select(3, AuraUtil.FindAuraByName(frame.spell_name, unit, aura_type))
				if frame.count and frame.count > 0 then
					count = "["..T.ShortValue(frame.count).."] "
				end						
			end
	
			if frame.dur ~= 0 then -- 有持续时间
				local remain = frame.exp - GetTime()
				time = T.FormatTime(remain)
				if remain <= 0 then
					frame.reset()
				end
			end
			
			frame.text:SetText(count..time)
		else
			frame.reset()
		end
	end

	frame:SetScript("OnEvent", function(self, event, ...)	
		frame.update_onevent(event, ...)	
	end)
	
	frame:SetScript("OnUpdate", function(self, e)
		frame.t = frame.t + e
		if frame.t > update_rate then	
			frame.update_onframe()
			frame.t = 0
		end
	end)
	
	AlertFrame.QueueIcon(frame)	
	
	G.Icons[v] = frame
	
	local options = T.Create_AlertIcon_Options(option_page, v)
	
	return frame, options
end

T.CreateAffixAura = function(option_page, v, affix_id, x, y)
	local frame = T.CreateAlertIcon(v, 1, .5, .2)
	
	frame.reset = function()
		frame:Hide()
		frame.count = false
		frame.dur = false
		frame.exp = false
	end
	
	frame.update_onedit = function(option)
		if option == "all" or option == "enable" then
		
			frame.enable = SMT_CDB["AlertFrame"][v] and SMT_CDB["AlertFrame"]["enable"]
			if frame.enable then		
				frame:RegisterEvent("CHALLENGE_MODE_COMPLETED")
				frame:RegisterEvent("CHALLENGE_MODE_RESET")
				frame:RegisterEvent("CHALLENGE_MODE_START")		
			else
				frame:UnregisterEvent("CHALLENGE_MODE_COMPLETED")
				frame:UnregisterEvent("CHALLENGE_MODE_RESET")
				frame:UnregisterEvent("CHALLENGE_MODE_START")	
			end
			
			frame.update_onevent("INIT")
		end
		
		if option == "all" or option == "icon_size" then
			frame:SetSize(SMT_CDB["AlertFrame"]["icon_size"], SMT_CDB["AlertFrame"]["icon_size"])
			frame.glow:SetPoint("TOPLEFT", -SMT_CDB["AlertFrame"]["icon_size"]/3, SMT_CDB["AlertFrame"]["icon_size"]/3)
			frame.glow:SetPoint("BOTTOMRIGHT", SMT_CDB["AlertFrame"]["icon_size"]/3, -SMT_CDB["AlertFrame"]["icon_size"]/3)
		end
		
		if option == "all" or option == "font_size" then
			frame.text:SetFont(G.Font, SMT_CDB["AlertFrame"]["font_size"], "OUTLINE")
		end
		
		if option == "all" or option == "ifont_size" then
			frame.bottomtext:SetFont(G.Font, SMT_CDB["AlertFrame"]["ifont_size"], "OUTLINE")
		end
		
		if option == "all" or option == "grow_dir" or option == "icon_space" then
			AlertFrame.LineUpIcons()
		end
	end
	
	frame.Update = function()
		if frame.enable and AuraUtil.FindAuraByName(frame.spell_name, unit, aura_type) then 
			frame.dur, frame.exp = select(5, AuraUtil.FindAuraByName(frame.spell_name, unit, aura_type))
			frame:Show()
		else
			frame.reset()
		end
	end
	
	frame.map_check = function()
		if C_ChallengeMode.IsChallengeModeActive() then
			frame:RegisterEvent("UNIT_AURA")
		else
			frame:UnregisterEvent("UNIT_AURA")
			frame.reset()
		end
	end
	
	frame.update_onevent = function(event, ...)
		if event == "INIT" then
			frame.map_check()
		elseif strfind(event, "CHALLENGE_MODE") then
			frame.map_check()
		elseif event == "UNIT_AURA" then
			local u = ...
			if u == unit then
				frame.Update()
			end
		end
	end
	
	frame.update_onframe = function()
		if frame.enable and frame.exp then
			local count, time = "",""
			
			if arg_index then
				frame.count = select(arg_index, AuraUtil.FindAuraByName(frame.spell_name, unit, aura_type))
				if frame.count then
					count = "["..frame.count.."] "
				end
			else
				frame.count = select(3, AuraUtil.FindAuraByName(frame.spell_name, unit, aura_type))
				if frame.count > 0 then
					count = "["..T.ShortValue(frame.count).."] "
				end						
			end
	
			if frame.dur ~= 0 then -- 有持续时间
				local remain = frame.exp - GetTime()
				time = T.FormatTime(remain)
				if remain <= 0 then
					frame.reset()
				end
			end
			
			frame.text:SetText(count..time)
		else
			frame.reset()
		end
	end

	frame:SetScript("OnEvent", function(self, event, ...)	
		frame.update_onevent(event, ...)	
	end)
	
	frame:SetScript("OnUpdate", function(self, e)
		frame.t = frame.t + e
		if frame.t > update_rate then	
			frame.update_onframe()
			frame.t = 0
		end
	end)
	
	AlertFrame.QueueIcon(frame)	
	
	T.CreateAffixAuraOptions(option_page, v, affix_id, x, y)
	
	G.Icons[v] = frame
end

T.CreateAffixAura(G.gui.Options, "1_aura_no_240559", 12, 40, 280) -- 重伤
T.CreateAffixAura(G.gui.Options, "1_aura_no_240443", 11, 240, 280) -- 崩裂
T.CreateAffixAura(G.gui.Options, "1_aura_no_209858", 4, 40, 310) -- 死疽
T.CreateAffixAura(G.gui.Options, "1_aura_no_226512", 8, 240, 310) -- 血池

T.CreateAuras = function(option_page, v, aura_type, arg_index)
	local frame = T.CreateAlertIcon(v, 1, 1, 1)
	frame.text:SetFont(G.Font, 20, "OUTLINE")
	frame.num = 0
	
	frame.reset = function()
		frame:Hide()
		frame.num = 0
		frame.str = ""
	end
	
	frame.update_onedit = function(option)
		if option == "all" or option == "enable" then
		
			frame.enable = SMT_CDB["Icons"][v] and SMT_CDB["AlertFrame"]["enable"]
			if frame.enable then		
				frame:RegisterEvent("PLAYER_ENTERING_WORLD")				
			else
				frame:UnregisterEvent("PLAYER_ENTERING_WORLD")	
			end
			
			frame.update_onevent("INIT")		
		end
		
		if option == "all" or option == "icon_size" then
			frame:SetSize(SMT_CDB["AlertFrame"]["icon_size"], SMT_CDB["AlertFrame"]["icon_size"])
			frame.glow:SetPoint("TOPLEFT", -SMT_CDB["AlertFrame"]["icon_size"]/3, SMT_CDB["AlertFrame"]["icon_size"]/3)
			frame.glow:SetPoint("BOTTOMRIGHT", SMT_CDB["AlertFrame"]["icon_size"]/3, -SMT_CDB["AlertFrame"]["icon_size"]/3)			
		end
		
		if option == "all" or option == "font_size" then
			frame.text:SetFont(G.Font, SMT_CDB["AlertFrame"]["font_size"]/2, "OUTLINE")
		end
		
		if option == "all" or option == "ifont_size" then
			frame.bottomtext:SetFont(G.Font, SMT_CDB["AlertFrame"]["ifont_size"], "OUTLINE")
		end
		
		if option == "all" or option == "grow_dir" or option == "icon_space" then
			AlertFrame.LineUpIcons()
		end
	end
	
	frame.map_check = function()
		local map = select(8, GetInstanceInfo())
		if frame.enable and map == frame.map_id then
			frame:RegisterEvent("UNIT_AURA")
		else
			frame:UnregisterEvent("UNIT_AURA")
			frame.reset()
		end
	end
	
	frame.players = {}
	frame.update_onevent = function(event, ...)
		if event == "INIT" then
			frame.map_check()
		elseif event == "PLAYER_ENTERING_WORLD" then
			frame.map_check()
		elseif event == "UNIT_AURA" then
			if frame.enable then
				local unitID = ...
				if unitID and UnitInParty(unitID) then	
					local player = UnitName(unitID)
					if AuraUtil.FindAuraByName(frame.spell_name, unitID, aura_type) then
						if not frame.players[player] then
							frame.players[player] = {}
							frame.players[player].dur, frame.players[player].exp = select(5, AuraUtil.FindAuraByName(frame.spell_name, unitID, aura_type))
							frame.num = frame.num + 1
						end					
					else
						if frame.players[player] then
							frame.players[player] = nil
							frame.num = frame.num - 1
						end
					end
				
					if frame.num > 0 then
						frame:Show()
					else
						frame.reset()
					end
				end
			else
				frame.reset()
			end
		end
	end
	
	frame.update_onframe = function()
		if frame.enable and frame.num > 0 then
			frame.str = ""
			
			for player, info in pairs(frame.players) do
			
				
				
				if frame.players[player] then
				
					local name = T.ColorName(player).." "	
					local count, time = "", ""
					
					if arg_index then
						frame.players[player].count = T.ShortValue(select(arg_index, AuraUtil.FindAuraByName(frame.spell_name, player, aura_type)))
						if frame.players[player].count then
							count = "["..frame.players[player].count.."] "
						end
					else
						frame.players[player].count = select(3, AuraUtil.FindAuraByName(frame.spell_name, player, aura_type))
						if frame.players[player].count > 0 then
							count = "["..T.ShortValue(frame.players[player].count).."] "
						end						
					end

					if frame.players[player].dur ~= 0 then -- 有持续时间
						local remain = frame.players[player].exp - GetTime()
						time = T.FormatTime(remain)
						if remain <= 0 then
							frame.players[player] = nil
							frame.num = frame.num - 1
						end
					end

					if frame.str == "" then
						frame.str = name..count..time
					else
						frame.str = frame.str.."\n"..name..count..time
					end
				end
			end
			
			frame.text:SetText(frame.str)
			
		else
			frame.reset()
		end
	end
	
	frame:SetScript("OnEvent", function(self, event, ...)
		frame.update_onevent(event, ...)
	end)
	
	frame:SetScript("OnUpdate", function(self, e)
		frame.t = frame.t + e
		if frame.t > update_rate then	
			frame.update_onframe()
			frame.t = 0
		end
	end)
	
	AlertFrame.QueueIcon(frame)	
	
	G.Icons[v] = frame
	
	local options = T.Create_AlertIcon_Options(option_page, v)
	
	return frame, options
end

T.CreateLog = function(option_page, v, event_type, targetID, dur)
	local frame = T.CreateAlertIcon(v, 1, 1, 1)
	
	frame.dur = dur
	
	frame.reset = function()
		frame:Hide()
		frame.exp = false
		frame.target = false
	end
	
	frame.update_onedit = function(option)
		if option == "all" or option == "enable" then
		
			frame.enable = SMT_CDB["Icons"][v] and SMT_CDB["AlertFrame"]["enable"]
			if frame.enable then		
				frame:RegisterEvent("PLAYER_ENTERING_WORLD")				
			else
				frame:UnregisterEvent("PLAYER_ENTERING_WORLD")
			end			
			
			frame.update_onevent("INIT")
		end
		
		if option == "all" or option == "icon_size" then
			frame:SetSize(SMT_CDB["AlertFrame"]["icon_size"], SMT_CDB["AlertFrame"]["icon_size"])
			frame.glow:SetPoint("TOPLEFT", -SMT_CDB["AlertFrame"]["icon_size"]/3, SMT_CDB["AlertFrame"]["icon_size"]/3)
			frame.glow:SetPoint("BOTTOMRIGHT", SMT_CDB["AlertFrame"]["icon_size"]/3, -SMT_CDB["AlertFrame"]["icon_size"]/3)
		end
		
		if option == "all" or option == "font_size" then
			frame.text:SetFont(G.Font, SMT_CDB["AlertFrame"]["font_size"], "OUTLINE")
		end
		
		if option == "all" or option == "ifont_size" then
			frame.bottomtext:SetFont(G.Font, SMT_CDB["AlertFrame"]["ifont_size"], "OUTLINE")
		end
		
		if option == "all" or option == "grow_dir" or option == "icon_space" then
			AlertFrame.LineUpIcons()
		end
	end
	
	frame.map_check = function()
		local map = select(8, GetInstanceInfo())
		if frame.enable and map == frame.map_id then
			frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		else
			frame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
			frame.reset()
		end
	end
	
	frame.update_onevent = function(event, ...)
		if event == "INIT" then
			frame.map_check()
		elseif event == "PLAYER_ENTERING_WORLD" then
			frame.map_check()
		elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
			if frame.enable then
				local Time_stamp, Event_type, _, SourceGUID, SourceName, _, _, DestGUID, DestName, _, _, SpellID, SpellName = CombatLogGetCurrentEventInfo()
				if Event_type == event_type and SpellID == frame.spell_id then
					if not targetID then
						frame.exp = GetTime() + frame.dur
						frame:Show()	
					elseif UnitIsUnit(targetID, DestName) then -- 这里targetID只用于玩家
						frame.target = DestName
						frame.exp = GetTime() + frame.dur
						frame:Show()	
					end
				end
			else
				frame.reset()
			end
		end
	end
	
	frame.update_onframe = function()
		if frame.enable and frame.exp then		
			local remain = frame.exp - GetTime()
			frame.text:SetText(T.FormatTime(remain))

			if remain <= 0 then
				frame.reset()
			end
		else
			frame.reset()
		end
	end
	
	frame:SetScript("OnEvent", function(self, event, ...)
		frame.update_onevent(event, ...)
	end)
	
	frame:SetScript("OnUpdate", function(self, e)
		frame.t = frame.t + e
		if frame.t > update_rate then	
			frame.update_onframe()
			frame.t = 0
		end
	end)
	
	AlertFrame.QueueIcon(frame)	
	
	G.Icons[v] = frame
	
	local options = T.Create_AlertIcon_Options(option_page, v)
		
	return frame, options
end

T.StopLog = function(frame, event, ...)
	frame:HookScript("OnEvent", function(self, event, ...)
		local _, Event_type, _, _, _, _, _, DestGUID = ...
		if Event_type == event then
			if event == "UNIT_DIED" then
				local NPCID = ...
				local npc_id = select(6, strsplit("-", DestGUID))
				if npc_id == NPCID then
					frame.reset()
				end
			end
		end
	end)
end

local CastingEvents = {
	["UNIT_SPELLCAST_START"] = true,
	["UNIT_SPELLCAST_SUCCEEDED"] = true,
	["UNIT_SPELLCAST_STOP"] = true,
	["UNIT_SPELLCAST_CHANNEL_START"] = true,
	["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
}

T.CreateCast = function(option_page, v)
	local frame = T.CreateAlertIcon(v, 1, 1, 1)
	
	frame.reset = function()
		frame:Hide()
		frame.exp = false
		frame.target = false
		frame.source = {}
		frame.count = 0
	end
	
	frame.reset()
	
	frame.update_onedit = function(option)
		if option == "all" or option == "enable" then	
			frame.enable = SMT_CDB["Icons"][v] and SMT_CDB["AlertFrame"]["enable"]
			if frame.enable then		
				frame:RegisterEvent("PLAYER_ENTERING_WORLD")				
			else
				frame:UnregisterEvent("PLAYER_ENTERING_WORLD")	
			end
			
			frame.update_onevent("INIT")
		end
		
		if option == "all" or option == "icon_size" then
			frame:SetSize(SMT_CDB["AlertFrame"]["icon_size"], SMT_CDB["AlertFrame"]["icon_size"])
			frame.glow:SetPoint("TOPLEFT", -SMT_CDB["AlertFrame"]["icon_size"]/3, SMT_CDB["AlertFrame"]["icon_size"]/3)
			frame.glow:SetPoint("BOTTOMRIGHT", SMT_CDB["AlertFrame"]["icon_size"]/3, -SMT_CDB["AlertFrame"]["icon_size"]/3)			
		end
		
		if option == "all" or option == "font_size" then
			frame.text:SetFont(G.Font, SMT_CDB["AlertFrame"]["font_size"], "OUTLINE")
		end
		
		if option == "all" or option == "ifont_size" then
			frame.bottomtext:SetFont(G.Font, SMT_CDB["AlertFrame"]["ifont_size"], "OUTLINE")
		end
		
		if option == "all" or option == "grow_dir" or option == "icon_space" then
			AlertFrame.LineUpIcons()
		end
	end
	
	frame.map_check = function()
		local map = select(8, GetInstanceInfo())
		if frame.enable and map == frame.map_id then
			for k, j in pairs(CastingEvents) do
				frame:RegisterEvent(k)
			end
		else
			for k, j in pairs(CastingEvents) do
				frame:UnregisterEvent(k)
			end
			frame.reset()
		end
	end
	
	frame.update_onevent = function(e, ...)
		if e == "INIT" or e == "PLAYER_ENTERING_WORLD" then
			frame.map_check()
		elseif frame.enable then	
			local Unit, _, SpellID = ...
			if SpellID == frame.spell_id then
				if e == "UNIT_SPELLCAST_CHANNEL_START" then -- 开始引导
					if not frame.source[UnitGUID(Unit)] then
						local endTimeMS = select(5, UnitChannelInfo(Unit))
						frame.exp = endTimeMS/1000
						frame.source[UnitGUID(Unit)] = true
						frame.count = frame.count + 1
						if frame.count > 1 then
							frame.toptext:SetText(frame.count)
						else
							frame.toptext:SetText("")
						end
						frame:Show()
					end
				elseif e == "UNIT_SPELLCAST_START" then -- 开始施法
					if not frame.source[UnitGUID(Unit)] then
						local endTimeMS = select(5, UnitCastingInfo(Unit))
						frame.exp = endTimeMS/1000
						frame.source[UnitGUID(Unit)] = true
						frame.count = frame.count + 1
						if frame.count > 1 then
							frame.toptext:SetText(frame.count)
						else
							frame.toptext:SetText("")
						end
						frame:Show()
					end
				elseif e == "UNIT_SPELLCAST_SUCCEEDED" then
					if not frame.source[UnitGUID(Unit)] then
						if not UnitChannelInfo(Unit) and frame.cast_time == 0 then -- 瞬发法术
							frame.exp = GetTime()+2
							frame.source[UnitGUID(Unit)] = true
							frame.count = frame.count + 1
							if frame.count > 1 then
								frame.toptext:SetText(frame.count)
							else
								frame.toptext:SetText("")
							end
							C_Timer.After(2, function()
								if UnitGUID(Unit) then
								frame.count = frame.count - 1
									frame.source[UnitGUID(Unit)] = nil
									if frame.count > 1 then
										frame.toptext:SetText(frame.count)
									elseif frame.count == 1 then
										frame.toptext:SetText("")
									else
										frame.reset()
									end
								else
									frame.reset()
								end
							end)
							frame:Show()
						end
					end
				elseif e == "UNIT_SPELLCAST_CHANNEL_STOP" or e == "UNIT_SPELLCAST_STOP" then
					if frame.source[UnitGUID(Unit)] then
						frame.source[UnitGUID(Unit)] = nil
						frame.count = frame.count - 1
						if frame.count > 1 then
							frame.toptext:SetText(frame.count)
						elseif frame.count == 1 then
							frame.toptext:SetText("")
						else
							frame.reset()
						end
					end
				end
			end
		else
			frame.reset()
		end
	end
	
	frame.update_onframe = function()
		if frame.enable and frame.exp then	
			local remain = frame.exp - GetTime()
			frame.text:SetText(T.FormatTime(remain))

			if remain <= 0 then
				frame.reset()
			end
		else
			frame.reset()
		end
	end
	
	frame:SetScript("OnEvent", function(self, e, ...)
		frame.update_onevent(e, ...)
	end)
	
	frame:SetScript("OnUpdate", function(self, e)
		frame.t = frame.t + e
		if frame.t > update_rate then	
			frame.update_onframe()
			frame.t = 0
		end
	end)
	
	AlertFrame.QueueIcon(frame)	
	
	G.Icons[v] = frame
	
	local options = T.Create_AlertIcon_Options(option_page, v)
	
	return frame, options
end

T.CreateCastingOnMe = function(option_page, v)

	local frame = T.CreateAlertIcon(v, 1, 1, 0)
	
	frame.reset = function()
		frame:Hide()
		frame.exp = false
		frame.source = {}
		frame.count = 0
	end
	
	frame.reset()
	
	frame.update_onedit = function(option)
		if option == "all" or option == "enable" then	
			frame.enable = SMT_CDB["Icons"][v] and SMT_CDB["AlertFrame"]["enable"]
			if frame.enable then		
				frame:RegisterEvent("PLAYER_ENTERING_WORLD")				
			else
				frame:UnregisterEvent("PLAYER_ENTERING_WORLD")	
			end
			
			frame.update_onevent("INIT")
		end
		
		if option == "all" or option == "icon_size" then
			frame:SetSize(SMT_CDB["AlertFrame"]["icon_size"], SMT_CDB["AlertFrame"]["icon_size"])
			frame.glow:SetPoint("TOPLEFT", -SMT_CDB["AlertFrame"]["icon_size"]/3, SMT_CDB["AlertFrame"]["icon_size"]/3)
			frame.glow:SetPoint("BOTTOMRIGHT", SMT_CDB["AlertFrame"]["icon_size"]/3, -SMT_CDB["AlertFrame"]["icon_size"]/3)			
		end
		
		if option == "all" or option == "font_size" then
			frame.text:SetFont(G.Font, SMT_CDB["AlertFrame"]["font_size"], "OUTLINE")
		end
		
		if option == "all" or option == "ifont_size" then
			frame.bottomtext:SetFont(G.Font, SMT_CDB["AlertFrame"]["ifont_size"], "OUTLINE")
		end
		
		if option == "all" or option == "grow_dir" or option == "icon_space" then
			AlertFrame.LineUpIcons()
		end
	end
	
	frame.map_check = function()
		local map = select(8, GetInstanceInfo())
		if frame.enable and map == frame.map_id then
			for k, j in pairs(CastingEvents) do
				frame:RegisterEvent(k)
			end
		else
			for k, j in pairs(CastingEvents) do
				frame:UnregisterEvent(k)
			end
			frame.reset()
		end
	end
	
	frame.update_onevent = function(e, ...)
		if e == "INIT" or e == "PLAYER_ENTERING_WORLD" then
			frame.map_check()
		elseif frame.enable then
			local Unit, _, SpellID = ...
			if SpellID == frame.spell_id then
				if e == "UNIT_SPELLCAST_CHANNEL_START" then -- 开始引导
					C_Timer.After(.1, function()
						if UnitIsUnit(Unit.."target", "player") and not frame.source[UnitGUID(Unit)] then
							local endTimeMS = select(5, UnitChannelInfo(Unit))
							if endTimeMS then
								frame.exp = endTimeMS/1000
								frame.source[UnitGUID(Unit)] = true
								frame.count = frame.count + 1
								if frame.count > 1 then
									frame.toptext:SetText(frame.count)
								else
									frame.toptext:SetText("")
								end
								frame:Show()
							end
						end
					end)
				elseif e == "UNIT_SPELLCAST_START" then -- 开始施法
					C_Timer.After(.1, function()
						if UnitIsUnit(Unit.."target", "player") and not frame.source[UnitGUID(Unit)] then
							local endTimeMS = select(5, UnitCastingInfo(Unit))
							if endTimeMS then
								frame.exp = endTimeMS/1000
								frame.source[UnitGUID(Unit)] = true
								frame.count = frame.count + 1
								if frame.count > 1 then
									frame.toptext:SetText(frame.count)
								else
									frame.toptext:SetText("")
								end
								frame:Show()
							end
						end
					end)
				elseif e == "UNIT_SPELLCAST_CHANNEL_STOP" or e == "UNIT_SPELLCAST_STOP" then
					if frame.source[UnitGUID(Unit)] then
						frame.source[UnitGUID(Unit)] = nil
						frame.count = frame.count - 1
						if frame.count > 1 then
							frame.toptext:SetText(frame.count)
						elseif frame.count == 1 then
							frame.toptext:SetText("")
						else
							frame.reset()
						end
					end
				end
			end
		else
			frame.reset()
		end
	end
	
	frame.update_onframe = function()
		if frame.enable and frame.exp then	
			local remain = frame.exp - GetTime()
			local time = (T.FormatTime(remain).." ") or ""	
			local grow_dir = SMT_CDB["AlertFrame"]["grow_dir"]
			
			frame.text:SetText(L["点你"].." "..time)
			
			if remain <= 0 then
				frame.reset()
			end
		else
			frame.reset()
		end
	end
	
	frame:SetScript("OnEvent", function(self, e, ...)
		frame.update_onevent(e, ...)
	end)
	
	frame:SetScript("OnUpdate", function(self, e)
		frame.t = frame.t + e
		if frame.t > update_rate then	
			frame.update_onframe()
			frame.t = 0
		end
	end)
	
	AlertFrame.QueueIcon(frame)	
	
	G.Icons[v] = frame
	
	local options = T.Create_AlertIcon_Options(option_page, v)
	
	return frame, options
end

T.CreateBossMsg = function(option_page, v, event, msg, dur)
	local frame = T.CreateAlertIcon(v, 1, 1, 1)
	
	frame.dur = dur
	
	frame.reset = function()
		frame:Hide()
		frame.exp = false
		frame.target = false
	end
	
	frame.update_onedit = function(option)
		if option == "all" or option == "enable" then	
			frame.enable = SMT_CDB["Icons"][v] and SMT_CDB["AlertFrame"]["enable"]
			if frame.enable then		
				frame:RegisterEvent("PLAYER_ENTERING_WORLD")				
			else
				frame:UnregisterEvent("PLAYER_ENTERING_WORLD")		
			end			
			
			frame.update_onevent("INIT")
		end
		
		if option == "all" or option == "icon_size" then
			frame:SetSize(SMT_CDB["AlertFrame"]["icon_size"], SMT_CDB["AlertFrame"]["icon_size"])
			frame.glow:SetPoint("TOPLEFT", -SMT_CDB["AlertFrame"]["icon_size"]/3, SMT_CDB["AlertFrame"]["icon_size"]/3)
			frame.glow:SetPoint("BOTTOMRIGHT", SMT_CDB["AlertFrame"]["icon_size"]/3, -SMT_CDB["AlertFrame"]["icon_size"]/3)					
		end
		
		if option == "all" or option == "font_size" then
			frame.text:SetFont(G.Font, SMT_CDB["AlertFrame"]["font_size"], "OUTLINE")
		end
		
		if option == "all" or option == "ifont_size" then
			frame.bottomtext:SetFont(G.Font, SMT_CDB["AlertFrame"]["ifont_size"], "OUTLINE")
		end
		
		if option == "all" or option == "grow_dir" or option == "icon_space" then
			AlertFrame.LineUpIcons()
		end
	end
	
	frame.map_check = function()
		local map = select(8, GetInstanceInfo())
		if frame.enable and map == frame.map_id then
			frame:RegisterEvent(event)
		else
			frame:UnregisterEvent(event)
			frame.reset()
		end
	end
	
	frame.update_onevent = function(e, ...)
		if e == "INIT" then
			frame.map_check()
		elseif e == "PLAYER_ENTERING_WORLD" then
			frame.map_check()
		elseif e == event then
			local Msg = ...
			if Msg and Msg:find(msg) then
				frame.exp = GetTime() + frame.dur
				frame:Show()
			end
		end
	end
	
	frame.update_onframe = function()
		if frame.enable and frame.exp then
			local remain = frame.exp - GetTime()	
			frame.text:SetText(T.FormatTime(remain))			
			
			if remain <= 0 then
				frame.reset()
			end
		else
			frame.reset()
		end
	end
	
	frame:SetScript("OnEvent", function(self, e, ...)
		frame.update_onevent(e, ...)
	end)
	
	frame:SetScript("OnUpdate", function(self, e)
		frame.t = frame.t + e
		if frame.t > update_rate then	
			frame.update_onframe()	
			frame.t = 0
		end
	end)
	
	AlertFrame.QueueIcon(frame)	
	
	G.Icons[v] = frame
	
	local options = T.Create_AlertIcon_Options(option_page, v)
	
	return frame, options
end

----------------------------------------------------------
--------------------[[    Text Alert    ]]----------------
----------------------------------------------------------

local TextFrame = CreateFrame("Frame", G.addon_name.."Text_Alert", G.FrameHolder)
TextFrame:SetSize(300,50)

TextFrame.movingname = L["文字提示"]
TextFrame.point = { a1 = "CENTER", parent = "UIParent", a2 = "CENTER", x = 0, y = 250 }
T.CreateDragFrame(TextFrame)

T.EditTextFrame = function(option)
	if option == "all" or option == "font_size" then
		TextFrame:SetSize(SMT_CDB["TextFrame"]["font_size"]*8, SMT_CDB["TextFrame"]["font_size"])
	end
	
	for k, frame in pairs(G.Texts) do
		frame.update_onedit(option)
	end	
end

TextFrame.ActiveTexts = {}
TextFrame.LineUpTexts = function()
	local lastframe
	for v, frame in T.pairsByKeys(TextFrame.ActiveTexts) do
		frame:ClearAllPoints()
		if not lastframe then
			frame:SetPoint("TOP", TextFrame, "TOP")
		else
			frame:SetPoint("TOP", lastframe, "BOTTOM", 0, -5)
		end
		lastframe = frame
	end
end

TextFrame.QueueText = function(frame)
	frame:HookScript("OnShow", function()
		TextFrame.ActiveTexts[frame.v] = frame
		TextFrame.LineUpTexts()
	end)
	
	frame:HookScript("OnHide", function()
		TextFrame.ActiveTexts[frame.v] = nil
		TextFrame.LineUpTexts()
	end)
end

T.CreateAlertText = function(r, g, b, v)
	local frame = CreateFrame("Frame", nil, TextFrame)
	frame:SetSize(300,50)
	frame:Hide()

	frame.v = v
	frame.t = 0
	
	frame.text = T.createtext(frame, "OVERLAY", 50, "OUTLINE", "LEFT")
	frame.text:SetPoint("CENTER", frame, "CENTER", 0, 0)
	frame.text:SetTextColor(r, g, b)	
	
	return frame
end

T.CreateBigText = function(v, r, g, b, events)

	local frame = T.CreateAlertText(r, g, b, v)
	
	frame.update_onedit = function(option)
		if option == "all" or option == "enable" then
			frame.enable = SMT_CDB["TextFrame"][v]
			if frame.enable then
				frame:RegisterEvent("PLAYER_ENTERING_WORLD")		
			else
				frame:UnregisterEvent("PLAYER_ENTERING_WORLD")
			end			
			
			frame.Update_onevent(frame, "INIT")
		end
		
		if option == "all" or option == "font_size" then	
			frame:SetSize(SMT_CDB["TextFrame"]["font_size"]*8, SMT_CDB["TextFrame"]["font_size"])
			frame.text:SetFont(G.Font, SMT_CDB["TextFrame"]["font_size"], "OUTLINE")
		end
		
		TextFrame.LineUpTexts()
	end
	
	frame.Update_onevent = function(self, event, ...)
		if event == "INIT" then
			local ins_size = select(5, GetInstanceInfo())
			if frame.enable and ins_size == 5 then
				for i, j in pairs(events) do
					frame:RegisterEvent(j)
				end
			else
				for i, j in pairs(events) do
					frame:UnregisterEvent(j)
				end
				frame:Hide()
			end
		elseif event == "PLAYER_ENTERING_WORLD" then
			local ins_size = select(5, GetInstanceInfo())
			if frame.enable and ins_size == 5 then
				for i, j in pairs(events) do
					frame:RegisterEvent(j)
				end
			else
				for i, j in pairs(events) do
					frame:UnregisterEvent(j)
				end
				frame:Hide()
			end
		else
			frame.update_onevent(self, event, ...)
		end
	end
	
	frame:SetScript("OnEvent", function(self, event, ...)
		frame.Update_onevent(self, event, ...)
	end)
	
	frame:SetScript("OnUpdate", function(self, e)
		frame.t = frame.t + e
		if frame.t > update_rate then
			frame.update_onframe(self)
			frame.t = 0
		end
	end)
	
	TextFrame.QueueText(frame)	
	
	G.Texts[v] = frame
	
	return frame
end

T.CreateTestText = function(v, dur, r, g, b, text)
	local frame = T.CreateAlertText(r, g, b, v)

	frame.reset = function()
		frame:Hide()
		frame.exp = false
	end
	
	frame.update_onedit = function()	
		frame:SetSize(SMT_CDB["AlertFrame"]["font_size"]*8, SMT_CDB["TextFrame"]["font_size"])
		frame.text:SetFont(G.Font, SMT_CDB["TextFrame"]["font_size"], "OUTLINE")
	
		if v == "Quaking" then
			local icon = "|T136025:12:12:0:0:64:64:4:60:4:60|t"
			if SMT_CDB["TextFrame"]["short"] then
				frame.text:SetText(L["打断施法"])
			else
				frame.text:SetText(icon.." "..L["打断施法"].." ".."1.2s".." "..icon)
			end
		elseif v == "Explosive" then
			local icon = "|T876914:12:12:0:0:64:64:4:60:4:60|t"
			if SMT_CDB["TextFrame"]["short"] then
				frame.text:SetText(icon.." 3")
			else
				frame.text:SetText(icon.." "..C_ChallengeMode.GetAffixInfo(13).." 3 "..icon)
			end
		end
			
		TextFrame.LineUpTexts()
	end
	
	frame.StartTest = function()
		if SMT_CDB["TextFrame"][v] then
			frame:Show()
			C_Timer.After(5, function() frame.reset() end)
		else
			frame.reset()
		end
	end

	TextFrame.QueueText(frame)	
	
	G.Texts["test"..v] = frame
	G.Test[v] = frame
	
	return frame
end

local events_quaking = {"UNIT_AURA"}
local text_quaking = T.CreateBigText("Quaking", 1, 1, 0, events_quaking)

text_quaking.reset = function()
	text_quaking:Hide()
	text_quaking.exp = false
end

text_quaking.update_onevent = function(self, event, unit)
    if event == "UNIT_AURA" and unit == "player" then
		if self.enable and AuraUtil.FindAuraByName(GetSpellInfo(240447), "player", "HARMFUL") then 
			self.count, _, self.dur, self.exp = select(3, AuraUtil.FindAuraByName(GetSpellInfo(240447), "player", "HARMFUL"))			
			self:Show()
		else
			self.reset()
		end
    end
end

text_quaking.update_onframe = function(self)
	if self.enable  and self.exp then
		local remain = self.exp - GetTime()
		
		local time_t = T.FormatTime(remain)
		local icon = "|T136025:12:12:0:0:64:64:4:60:4:60|t"
		
		local cast_end= select(5, UnitCastingInfo("player"))
		
		if cast_end then -- 正在施法
			if cast_end/1000 < self.exp then -- 当不用打断
				if SMT_CDB["TextFrame"]["short"] then
					self.text:SetText(L["安全施法"])
				else
					self.text:SetText(icon.." "..L["安全施法"].." "..time_t.." "..icon)
				end
			else
				if SMT_CDB["TextFrame"]["short"] then
					self.text:SetText(L["打断施法"])
				else
					self.text:SetText(icon.." "..L["打断施法"].." "..time_t.." "..icon)
				end
			end
		else -- 没有施法
			if remain > 2 then
				if SMT_CDB["TextFrame"]["short"] then
					self.text:SetText(L["可以读条"])
				else
					self.text:SetText(icon.." "..L["可以读条"].." "..time_t.." "..icon)
				end
			else -- 等2秒
				if SMT_CDB["TextFrame"]["short"] then
					self.text:SetText(L["不要读条"])
				else
					self.text:SetText(icon.." "..L["不要读条"].." "..time_t.." "..icon)
				end
			end
		end
							
		if remain <= 0 then
			self.reset()
		end
	else
		self.reset()
	end
end

local events_explosive = {"NAME_PLATE_UNIT_ADDED", "NAME_PLATE_UNIT_REMOVED"}
local text_explosive = T.CreateBigText("Explosive", 0, 1, 0, events_explosive)

local bombs = {}
text_explosive.update_onevent = function(self, event, ...)
	if event == "NAME_PLATE_UNIT_ADDED" or event == "NAME_PLATE_UNIT_REMOVED" then
		local unit = ...
		local guid = UnitGUID(unit)
		local name = GetUnitName(unit, false)
		local NPC_ID = select(6, strsplit("-", guid))
		local icon = "|T876914:12:12:0:0:64:64:4:60:4:60|t"

		if NPC_ID == "120651" then
			if event == "NAME_PLATE_UNIT_ADDED" and not bombs[guid] then
				bombs[guid] = 1
				--SendChatMessage("出炸弹了！","YELL")
				--PlaySoundFile("Sound/creature/SaboteurKiptilak/VO_GSS_SABOTEUR_SPECIAL_02B.ogg")
			elseif event == "NAME_PLATE_UNIT_REMOVED" and bombs[guid] then
				bombs[guid] = nil
			end
			
			local num = 0
			for k, v in pairs(bombs) do
				num = num + 1
			end
			if num > 0 then
				if SMT_CDB["TextFrame"]["short"] then
					self.text:SetText(icon.." "..num)
				else
					self.text:SetText(icon.." "..name.." "..num.." "..icon)
				end
				self:Show()
			else
				self:Hide()
			end		
		end
	end
end

text_explosive.update_onframe = function() end
----------------------------------------------------------
----------[[    Highlight Icon on Raid UF    ]]-----------
----------------------------------------------------------
local add_HL_holder = function(f)
	if f.hl_holder then return end
	
	f.hl_holder	= CreateFrame("Frame", nil, f)
	f.hl_holder:SetPoint(SMT_CDB["HL_Frame"]["position"], 0, 0)
	f.hl_holder:SetSize(10, 10)
	f.hl_holder:SetFrameStrata("HIGH")
	table.insert(G.HL_Holders, f.hl_holder)
	
	f.hl_holder.ActiveIcons = {}
	f.hl_holder.LineUpIcons = function()
		local lastframe
		for v, frame in T.pairsByKeys(f.hl_holder.ActiveIcons) do
			frame:ClearAllPoints()
			local anchor = SMT_CDB["HL_Frame"]["position"]
			if strfind(anchor, "LEFT") then
				if not lastframe then
					frame:SetPoint(anchor, f.hl_holder, anchor)
				else
					frame:SetPoint("LEFT", lastframe, "RIGHT", 3, 0)
				end
			elseif strfind(anchor, "RIGHT") then
				if not lastframe then
					frame:SetPoint(anchor, f.hl_holder, anchor)
				else
					frame:SetPoint("RIGHT", lastframe, "LEFT", -3, 0)
				end
			elseif not lastframe then
				local num = 0
				for k, j in pairs(f.hl_holder.ActiveIcons) do
					num = num + 1
				end
				local iconsize = SMT_CDB["HL_Frame"]["iconSize"]
				if anchor == "TOP" then
					frame:SetPoint("TOPLEFT", f.hl_holder, "TOP", -((iconsize+2)*num-2)/2,0)
				elseif anchor == "CENTER" then
					frame:SetPoint("LEFT", f.hl_holder, "CENTER", -((iconsize+2)*num-2)/2,0)
				elseif anchor == "BOTTOM" then
					frame:SetPoint("BOTTOMLEFT", f.hl_holder, "BOTTOM", -((iconsize+2)*num-2)/2,0)
				end			
			else
				frame:SetPoint("LEFT", lastframe, "RIGHT", 3, 0)
			end

			lastframe = frame
		end
	end

	f.hl_holder.QueueIcon = function(frame, tag)
		frame.v = tag
		
		frame.show = function()
			frame:Show()
			ActionButton_ShowOverlayGlow(frame)
		end
		
		frame.hide = function()
			ActionButton_HideOverlayGlow(frame)
			frame:Hide()
		end
		
		frame:HookScript("OnShow", function()
			f.hl_holder.ActiveIcons[frame.v] = frame
			f.hl_holder.LineUpIcons()
		end)
		
		frame:HookScript("OnHide", function()
			f.hl_holder.ActiveIcons[frame.v] = nil
			f.hl_holder.LineUpIcons()
		end)
		
	end	
end

local add_Icon = function(f, v, t, target, sourceGUID)
	add_HL_holder(f)
	local tag = v..sourceGUID or ""
	
	if f.hl_holder.ActiveIcons[tag] then return end
		
	local _, ID_str, DUR_str = strsplit("_" , v)
	local spellID = tonumber(ID_str)
	local spellName, _, spellIcon = GetSpellInfo(spellID)
	
    local frame = CreateFrame("Frame", nil, f.hl_holder)	
	frame:SetSize(SMT_CDB["HL_Frame"]["iconSize"], SMT_CDB["HL_Frame"]["iconSize"])
	frame:SetAlpha(SMT_CDB["HL_Frame"]["iconAlpha"]/100)
	frame:Hide()
	f.hl_holder.QueueIcon(frame, tag)
	
    local texture = frame:CreateTexture(nil,"HIGH")
    texture:SetTexture(spellIcon)
    texture:SetPoint("TOPLEFT", 2, -2)
	texture:SetPoint("BOTTOMRIGHT", -2, 2)
    texture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	
	
	if t == "HL_Auras" then
		local debuff_dur = select(5, AuraUtil.FindAuraByName(spellName, target, "HELPFUL"))
		if not debuff_dur then return end
		
		frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")			
		frame:SetScript("OnEvent", function(self, event, ...) 
			local _, Event_type, _, _, _, _, _, _, DestName, _, _, SpellID = CombatLogGetCurrentEventInfo()
			if Event_type == "SPELL_AURA_REMOVED" and SpellID == spellID and DestName then
				local Tar = string.split("-", DestName)
				if Tar == target then
					frame.hide()
				end
			end
		end)
		
		if debuff_dur > 0 then -- 有持续时间
			local cooldown = CreateFrame("COOLDOWN", nil, frame, "CooldownFrameTemplate")
			cooldown:SetCooldown(GetTime(), debuff_dur)
			cooldown:SetPoint("TOPLEFT", 4, -4)
			cooldown:SetPoint("BOTTOMRIGHT", -4, 4)
			cooldown:SetDrawEdge(false)
			cooldown:SetHideCountdownNumbers(true)	
			
			C_Timer.After(debuff_dur, function()
				if frame:IsShown() then
					frame.hide()
				end
			end)
			
		end
		
		frame.show()
		
	elseif t == "HL_Cast" then
	
		local dur = tonumber(DUR_str)
		
		local cooldown = CreateFrame("COOLDOWN", nil, frame, "CooldownFrameTemplate")
		cooldown:SetCooldown(GetTime(), dur)
		cooldown:SetPoint("TOPLEFT", 4, -4)
		cooldown:SetPoint("BOTTOMRIGHT", -4, 4)
		cooldown:SetDrawEdge(false)
		cooldown:SetHideCountdownNumbers(true)	
		
		C_Timer.After(dur, function()
			frame.hide()
		end)
		
		frame.show()
		
	elseif t == "HL_Casting" then
	
		local cast_time = select(4, GetSpellInfo(spellID))/1000
		
		local cooldown = CreateFrame("COOLDOWN", nil, frame, "CooldownFrameTemplate")
		cooldown:SetCooldown(GetTime(), cast_time)
		cooldown:SetPoint("TOPLEFT", 4, -4)
		cooldown:SetPoint("BOTTOMRIGHT", -4, 4)
		cooldown:SetDrawEdge(false)
		cooldown:SetHideCountdownNumbers(true)
		
		C_Timer.After(cast_time, function()
			if frame:IsShown() then
				frame.hide()
			end
		end)
		
		frame:RegisterEvent("UNIT_SPELLCAST_STOP")
		
		frame:SetScript("OnEvent", function(self, event, ...) 
			local Unit, _, SpellID = ...
			if SpellID == spellID and UnitGUID(Unit) == sourceGUID then
				ActionButton_HideOverlayGlow(frame)
				frame:Hide()
			end
		end)
		
		frame.show()
	end
end

T.EditHL = function()
	for _, holder in pairs(G.HL_Holders) do
		holder:ClearAllPoints()
		holder:SetPoint(SMT_CDB["HL_Frame"]["position"], 0, 0)
	end
end

T.HL_OnRaid = function(v, t, target, sourceGUID)

	if SMT_CDB["General"]["disable_all"] or not SMT_CDB["HL_Frame"]["enable"] or not SMT_CDB[t][v] then return end
	
    local hasGrid = IsAddOnLoaded("Grid")
    local hasGrid2 = IsAddOnLoaded("Grid2")
    local hasCompactRaid = IsAddOnLoaded("CompactRaid")
    local hasVuhDo = IsAddOnLoaded("VuhDo")
	local hasElvUIRaid = _G["ElvUF_Raid"] and _G["ElvUF_Raid"]:IsVisible()
	local hasElvUIParty = _G["ElvUF_Party"] and _G["ElvUF_Party"]:IsVisible()
    local hasAltzUIRaid = _G["Altz_HealerRaid"] and _G["Altz_HealerRaid"]:IsVisible()
	local hasAltzUIParty = _G["Altz_Party"] and _G["Altz_Party"]:IsVisible()
    local hasNDui = IsAddOnLoaded("NDui")
	
    if hasElvUIRaid or hasElvUIParty then
		if hasElvUIParty then
			for i=1, 8 do
				for j=1, 5 do
					local f = _G["ElvUF_PartyGroup"..i.."UnitButton"..j]
					if f and f.unit and UnitName(f.unit) == target then
						add_Icon(f, v, t, target, sourceGUID)
						return
					end
				end
			end
		elseif hasElvUIRaid then
			for i=1, 8 do
				for j=1, 5 do
					local f = _G["ElvUF_RaidGroup"..i.."UnitButton"..j]
					if f and f.unit and UnitName(f.unit) == target then
						add_Icon(f, v, t, target, sourceGUID)
						return
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
                    for _, f in ipairs(frames) do
                        if f.unit and UnitName(f.unit) == target then
                            add_Icon(f, v, t, target, sourceGUID)
                            return
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
                    for _, f in ipairs(frames) do
                        if f.unit and UnitName(f.unit) == target then
                            add_Icon(f, v, t, target, sourceGUID)
                            return
                        end
                    end
                end
            end
        end
    elseif hasVuhDo then
        for i = 1, 40 do
            local f = _G["Vd1H"..i]
            if f and f.raidid and UnitName(f.raidid) == target then
                add_Icon(f, v, t, target, sourceGUID)
                return
            end
        end
    elseif hasAltzUIRaid or hasAltzUIParty then
		
		if hasAltzUIParty then
			for j=1, 5 do
				local f = _G["Altz_PartyUnitButton"..i]
				if f and f.unit and UnitName(f.unit) == target then
					add_Icon(f, v, t, target, sourceGUID)
					return
				end
			end
		elseif hasAltzUIRaid then
			for i = 1, 40 do
				local f = _G["Altz_HealerRaidUnitButton"..i]
				if f and f.unit and UnitName(f.unit) == target then
					add_Icon(f, v, t, target, sourceGUID)
					return
				end
			end
		end
	elseif hasNDui then
		for i =1, 8 do 
            for j = 1, 5 do
                local f = _G["oUF_Raid"..i.."UnitButton"..j]
                if f and f.unit and UnitName(f.unit) == target then
                    add_Icon(f, v, t, target, sourceGUID)
                    return
                end
            end
        end
    elseif hasCompactRaid then
        for i =1, 8 do 
            for j = 1, 5 do
                local f = _G["CompactRaidGroupHeaderSubGroup"..i.."UnitButton"..j]
                if f and f.unit and UnitName(f.unit) == target then
                    add_Icon(f, v, t, target, sourceGUID)
                    return
                end
            end
        end
    else
        for i=1, 40 do
            local f = _G["CompactRaidFrame"..i]
            if f and f.unitExists and f.unit and UnitName(f.unit) == target then
                add_Icon(f, v, t, target, sourceGUID)
                return
            end
        end
        for i=1, 4 do
            for j=1, 5 do
                local f = _G["CompactRaidGroup"..i.."Member"..j]
                if f and f.unitExists and f.unit and UnitName(f.unit) == target then
                    add_Icon(f, v, t, target, sourceGUID)
                    return
                end
            end
        end
    end
	
end

T.Create_HL_EventFrame = function(parent, v, t)
	local frame = CreateFrame("Frame", addon_name.."HL_EventFrame"..v, FrameHolder)
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	frame.map_id, frame.spell_id = strsplit("_", v)
	frame.map_id = tonumber(frame.map_id)
	frame.spell_id = tonumber(frame.spell_id)
	
	if t == "HL_Auras" then
		frame:SetScript("OnEvent", function(self, e, ...)
			if e == "PLAYER_ENTERING_WORLD" then
				local map = select(8, GetInstanceInfo())
				if map == frame.map_id then
					frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
				else
					frame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
				end
			else
				local _, Event_type, _, sourceGUID, _, _, _, _, DestName, _, _, SpellID = CombatLogGetCurrentEventInfo()
				if SpellID == frame.spell_id and Event_type == "SPELL_AURA_APPLIED" and DestName then
					local target = string.split("-", DestName)
					T.HL_OnRaid(v, t, target, sourceGUID)
				end
			end
		end)
	elseif t == "HL_Cast" then
		frame:SetScript("OnEvent", function(self, e, ...)
			if e == "PLAYER_ENTERING_WORLD" then
				local map = select(8, GetInstanceInfo())
				if map == frame.map_id then
					frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
				else
					frame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
				end
			else
				local _, Event_type, _, sourceGUID, _, _, _, _, DestName, _, _, SpellID = CombatLogGetCurrentEventInfo()
				if SpellID == frame.spell_id and Event_type == "SPELL_CAST_SUCCESS" and DestName then
					local target = string.split("-", DestName)
					T.HL_OnRaid(v, t, target, sourceGUID)
				end
			end
		end)
	elseif t == "HL_Casting" then
		frame:SetScript("OnEvent", function(self, e, ...)
			if e == "PLAYER_ENTERING_WORLD" then
				local map = select(8, GetInstanceInfo())
				if map == frame.map_id then
					frame:RegisterEvent("UNIT_SPELLCAST_START")
					frame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START")
				else
					frame:UnregisterEvent("UNIT_SPELLCAST_START")
					frame:UnregisterEvent("UNIT_SPELLCAST_CHANNEL_START")
				end
			elseif e == "UNIT_SPELLCAST_START" or e == "UNIT_SPELLCAST_CHANNEL_START" then
				local Unit, _, SpellID = ...
				if SpellID == frame.spell_id then
					C_Timer.After(.1, function()
						local target = UnitName(Unit.."target")
						if target then
							local sourceGUID = UnitGUID(Unit)
							T.HL_OnRaid(v, t, target, sourceGUID)
						end
					end)			
				end
			end
		end)
	end
	
	T.Create_HLOnRaid_Options(parent, v, t)
	
	return frame
end
----------------------------------------------------------
---------------[[    Nameplate Icons    ]]----------------
----------------------------------------------------------
local function CreateIcon(parent, tag)
	local button = CreateFrame("Frame", nil, parent)
	button:SetSize(SMT_CDB["PlateAlerts"]["size"], SMT_CDB["PlateAlerts"]["size"])
	
	button.icon = button:CreateTexture(nil, "OVERLAY", nil, 3)
	button.icon:SetPoint("TOPLEFT",button,"TOPLEFT", 1, -1)
	button.icon:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",-1, 1)
	button.icon:SetTexCoord(.08, .92, 0.08, 0.92)
	
	button.overlay = button:CreateTexture(nil, "ARTWORK", nil, 7)
	button.overlay:SetTexture("Interface\\Buttons\\WHITE8x8")
	button.overlay:SetAllPoints(button)	
	
	button.bd = button:CreateTexture(nil, "ARTWORK", nil, 6)
	button.bd:SetTexture("Interface\\Buttons\\WHITE8x8")
	button.bd:SetVertexColor(0, 0, 0)
	button.bd:SetPoint("TOPLEFT",button,"TOPLEFT", -1, 1)
	button.bd:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT", 1, -1)
	
	if strfind(tag, "spells") then
		button.cd = CreateFrame("COOLDOWN", nil, button, "CooldownFrameTemplate")
		button.cd:SetPoint("TOPLEFT", 1, -1)
		button.cd:SetPoint("BOTTOMRIGHT", -1, 1)
		button.cd:SetDrawEdge(false)
		
		button.cast = CreateFrame("Frame", nil, button)
		button.cast:SetAllPoints()
		button.cast:Hide()
		
		button.cast.icon = button.cast:CreateTexture(nil, "OVERLAY", nil, 3)
		button.cast.icon:SetPoint("TOPLEFT",button.cast,"TOPLEFT", 1, -1)
		button.cast.icon:SetPoint("BOTTOMRIGHT",button.cast,"BOTTOMRIGHT",-1, 1)
		button.cast.icon:SetTexCoord(.08, .92, 0.08, 0.92)
		
		button.cast.overlay = button.cast:CreateTexture(nil, "ARTWORK", nil, 7)
		button.cast.overlay:SetTexture("Interface\\Buttons\\WHITE8x8")
		button.cast.overlay:SetAllPoints()	
		button.cast.overlay:SetVertexColor(1, 1, 0)
		
		button.cast.spell = T.createtext(button.cast, "OVERLAY", SMT_CDB["PlateAlerts"]["fsize"], "OUTLINE", "CENTER") -- 中间
		button.cast.spell:SetPoint("TOPLEFT", button.cast, "TOPLEFT", -5, 1)
		button.cast.spell:SetPoint("TOPRIGHT", button.cast, "TOPRIGHT", 5, 1)
		button.cast.spell:SetTextColor(1, 1, 0)
		button.cast.spell:SetHeight(SMT_CDB["PlateAlerts"]["fsize"])
		
		button.cast.target = T.createtext(button.cast, "OVERLAY", SMT_CDB["PlateAlerts"]["fsize"], "OUTLINE", "CENTER") -- 中间
		button.cast.target:SetPoint("BOTTOMLEFT", button.cast, "BOTTOMLEFT", -5, -1)
		button.cast.target:SetPoint("BOTTOMRIGHT", button.cast, "BOTTOMRIGHT", 5, -1)
		button.cast.target:SetHeight(SMT_CDB["PlateAlerts"]["fsize"]*2.5)
		
		button.cast.dur = T.createtext(button.cast, "OVERLAY", SMT_CDB["PlateAlerts"]["fsize"], "OUTLINE", "CENTER") -- 中间
		button.cast.dur:SetPoint("TOP", button.cast, "BOTTOM", 0, -2)
		
		button.cast.t = 0
		button.cast:SetScript("OnUpdate", function(self, e)
			self.t = self.t + e
			if self.t > .1 then	
				if self.exp then
					self.dur:SetText(T.FormatTime(self.exp-GetTime()))
				end
				self.t = 0
			end
		end)
	end
	
	if strfind(tag, "aura") then
		button.text = T.createtext(button, "OVERLAY", SMT_CDB["PlateAlerts"]["fsize"], "OUTLINE", "CENTER") -- 中间
		button.text:SetPoint("BOTTOM", button, "BOTTOM", 0, -2)
		button.text:SetTextColor(1, 1, 0)
	end
	
	if strfind(tag, "aura") or strfind(tag, "power") or strfind(tag, "bolster") then
		button.count = T.createtext(button, "OVERLAY", SMT_CDB["PlateAlerts"]["fsize"], "OUTLINE", "RIGHT") -- 右上
		button.count:SetPoint("TOPRIGHT", button, "TOPRIGHT", -1, 2)
		button.count:SetTextColor(.4, .95, 1)
	end
	
	if strfind(tag, "bomb") then
		button.icon:SetTexture(876914)
	elseif strfind(tag, "bolster") then
		button.icon:SetTexture(1041231)
	elseif strfind(tag, "sanguine") then
		button.icon:SetTexture(136124)
	elseif strfind(tag, "raging") then
		button.icon:SetTexture(132117)
	elseif strfind(tag, "ghuun") then
		button.icon:SetTexture(2032223)
	end
	
	button:Hide()
	parent.QueueIcon(button, tag)
	
	return button
end

local function UpdateSpellIcon(event, event_SpellID, button, unit, spellID, cd)
	local spell_name, _, icon = GetSpellInfo(spellID)
	button.icon:SetTexture(icon)
	button.cast.icon:SetTexture(icon)
	button.cast.spell:SetText(spell_name)
		
	if event == "UNIT_SPELLCAST_START" or event == "all" then
		local _, _, _, startTimeMS, endTimeMS, _, _, notInterruptible, casting_spellID = UnitCastingInfo(unit)
		if casting_spellID == spellID then			
			if notInterruptible then
				button.cast.overlay:SetVertexColor(1, 0, 0)
			else
				button.cast.overlay:SetVertexColor(0, 1, 1)
			end
			button.cast.exp = endTimeMS/1000
			C_Timer.After(.1, function()
				if UnitName(unit.."target") then
					button.cast.target:SetText(T.ColorUnitName(unit.."target", UnitName(unit.."target")))
				end
			end)			
			C_Timer.After((endTimeMS-startTimeMS)/1000, function()
				button.cast:Hide()
				button.cast.target:SetText("")
			end)
			button.cast:Show()
			if cd == 1 then button:Show() end
		end
	elseif event == "UNIT_SPELLCAST_CHANNEL_START" or event == "all" then
		local _, _, _, startTimeMS, endTimeMS, _, _, notInterruptible, casting_spellID = UnitChannelInfo(unit)
		if casting_spellID == spellID then
			if notInterruptible then
				button.cast.overlay:SetVertexColor(1, 0, 0)
			else
				button.cast.overlay:SetVertexColor(0, 1, 1)
			end
			button.cast.exp = endTimeMS/1000
			C_Timer.After(.1, function()
				if UnitName(unit.."target") then
					button.cast.target:SetText(T.ColorUnitName(unit.."target", UnitName(unit.."target")))
				end
			end)			
			C_Timer.After((endTimeMS-startTimeMS)/1000, function()
				button.cast:Hide()
				button.cast.target:SetText("")
			end)
			button.cast:Show()
			if cd == 1 then button:Show() end
		end
	elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
		if event_SpellID == spellID and cd > 1 then
			local realcd = cd - select(4, GetSpellInfo(spellID))*(100+GetHaste())/1e5
			button.cd:SetCooldown(GetTime(), realcd)
		end
	elseif not (UnitCastingInfo(unit) or UnitChannelInfo(unit)) then
		button.cast:Hide()
		if cd == 1 then button:Hide() end
	end
	
	if cd ~= 1 then
		button:Show()
	end
end

local function UpdateSpells(unitFrame, event, event_SpellID)
	if not unitFrame.unit or SMT_CDB["General"]["disable_all"] or not SMT_CDB["PlateAlerts"]["enable"] then return end
	local i = 1
	
	if G.Npc[unitFrame.npcID] then
		for spellID, cd in pairs(G.Npc[unitFrame.npcID]) do
			local unit = unitFrame.unit
			if i <= 5 then
				if not unitFrame.icons.Spell_Icons[i] then
					unitFrame.icons.Spell_Icons[i] = CreateIcon(unitFrame.icons, "spells"..i)
				end
				UpdateSpellIcon(event, event_SpellID, unitFrame.icons.Spell_Icons[i], unit, spellID, cd)
				i = i + 1
			end
		end
	end
	
	for index = i, #unitFrame.icons.Spell_Icons do unitFrame.icons.Spell_Icons[index]:Hide() end
end

local function UpdateAuraIcon(button, unit, index, filter)
	local name, icon, count, debuffType, duration, expirationTime, _, _, _, spellID = UnitAura(unit, index, filter)

	button.icon:SetTexture(icon)
	button.expirationTime = expirationTime
	button.duration = duration
	button.spellID = spellID
	
	local color = DebuffTypeColor[debuffType] or DebuffTypeColor.none
	button.overlay:SetVertexColor(color.r, color.g, color.b)

	if count and count > 1 then
		button.count:SetText(count)
	else
		button.count:SetText("")
	end
	
	button:SetScript("OnUpdate", function(self, elapsed)
		if not self.duration then return end
		
		self.elapsed = (self.elapsed or 0) + elapsed

		if self.elapsed < .2 then return end
		self.elapsed = 0

		local timeLeft = self.expirationTime - GetTime()
		if timeLeft <= 0 then
			self.text:SetText(nil)
		else
			self.text:SetText(T.FormatTime(timeLeft))
		end
	end)
	
	button:Show()
end

local function UpdateAuras(unitFrame)
	if not unitFrame.unit or SMT_CDB["General"]["disable_all"] or not SMT_CDB["PlateAlerts"]["enable"] then return end
	local unit = unitFrame.unit	
	local i = 1
	
	for index = 1, 20 do
		if i <= 5 then			
			local bname, _, _, _, bduration, _, bcaster, _, _, bspellid = UnitAura(unit, index, 'HELPFUL')
			if bname and SMT_CDB["PlateAuras"][bspellid] then
				if not unitFrame.icons.Aura_Icons[i] then
					unitFrame.icons.Aura_Icons[i] = CreateIcon(unitFrame.icons, "aura"..i)
				end
				UpdateAuraIcon(unitFrame.icons.Aura_Icons[i], unit, index, 'HELPFUL')
				i = i + 1
			end
		end
	end
	
	for index = 1, 20 do
		if i <= 5 then
			local dname, _, _, _, dduration, _, dcaster, _, _, dspellid = UnitAura(unit, index, 'HARMFUL')	
			if dname and SMT_CDB["PlateAuras"][dspellid] then
				if not unitFrame.icons.Aura_Icons[i] then
					unitFrame.icons.Aura_Icons[i] = CreateIcon(unitFrame.icons, "aura"..i)
				end
				UpdateAuraIcon(unitFrame.icons.Aura_Icons[i], unit, index, 'HARMFUL')
				i = i + 1
			end
		end
	end
	
	for index = i, #unitFrame.icons.Aura_Icons do unitFrame.icons.Aura_Icons[index]:Hide() end
end

local function UpdatePower(unitFrame)
	if not unitFrame.unit or SMT_CDB["General"]["disable_all"] or not SMT_CDB["PlateAlerts"]["enable"] or not SMT_CDB["PlatePower"][unitFrame.npcID] then
		if unitFrame.icons.powericon and unitFrame.icons.powericon:IsShown() then
			unitFrame.icons.powericon:Hide()
		end
		return
	end
	
	local unit = unitFrame.unit
	local pp = UnitPower(unit)
	
	if not unitFrame.icons.powericon then
		unitFrame.icons.powericon = CreateIcon(unitFrame.icons, "power")
	end
	
	if pp > 85 then
		unitFrame.icons.powericon.icon:SetTexture(531771)
	elseif pp > 45 then
		unitFrame.icons.powericon.icon:SetTexture(531773)
	else
		unitFrame.icons.powericon.icon:SetTexture(531776)
	end
	unitFrame.icons.powericon.count:SetText(pp)
	unitFrame.icons.powericon:Show()
end

local function UpdateBomb(unitFrame)
	if not unitFrame.unit or SMT_CDB["General"]["disable_all"] or not SMT_CDB["PlateAlerts"]["enable"] or not SMT_CDB["PlateAlerts"]["Explosive_np"] then
		if unitFrame.icons.bombicon and unitFrame.icons.bombicon:IsShown() then
			unitFrame.icons.bombicon:Hide()
		end
		return
	end
	
	if not C_ChallengeMode.GetActiveKeystoneInfo() or select(2, C_ChallengeMode.GetActiveKeystoneInfo())[2] ~= 13 then return end
	
	local NpcID = select(6, strsplit("-", UnitGUID(unitFrame.unit)))

	if NpcID == "120651" then
		if not unitFrame.icons.bombicon then
			unitFrame.icons.bombicon = CreateIcon(unitFrame.icons, "bomb")
		end
		unitFrame.icons.bombicon:Show()
	else
		if unitFrame.icons.bombicon and unitFrame.icons.bombicon:IsShown() then
			unitFrame.icons.bombicon:Hide()
		end
	end
end

local function UpdateBolster(unitFrame)
	if not unitFrame.unit or SMT_CDB["General"]["disable_all"] or not SMT_CDB["PlateAlerts"]["enable"] or not SMT_CDB["PlateAlerts"]["Bolster_np"] then return end

	if not C_ChallengeMode.GetActiveKeystoneInfo() or select(2, C_ChallengeMode.GetActiveKeystoneInfo())[1] ~= 7 then return end
	
	local unit = unitFrame.unit
	local stack = 0
	
	for index = 1, 20 do		
		local bspellid = select(11, UnitAura(unit, index, 'HELPFUL'))
		if bspellid == 209859 then
			stack = stack + 1			
		end
	end

	if stack > 0 then
		if not unitFrame.icons.bolstericon then
			unitFrame.icons.bolstericon = CreateIcon(unitFrame.icons, "bolster")
		end
		unitFrame.icons.bolstericon.count:SetText(format("%d%%", 1.2^stack*100))
		unitFrame.icons.bolstericon:Show()
	elseif unitFrame.icons.bolstericon and unitFrame.icons.bolstericon:IsShown() then
		unitFrame.icons.bolstericon:Hide()
	end
end

local function UpdateSanguine(unitFrame)
	if not unitFrame.unit or SMT_CDB["General"]["disable_all"] or not SMT_CDB["PlateAlerts"]["enable"] or not SMT_CDB["PlateAlerts"]["Sanguine_np"] then return end
	
	if not C_ChallengeMode.GetActiveKeystoneInfo() or select(2, C_ChallengeMode.GetActiveKeystoneInfo())[1] ~= 8 then return end
	
	local unit = unitFrame.unit
	
	if AuraUtil.FindAuraByName(GetSpellInfo(226510), unit, "HELPFUL") then
		if not unitFrame.icons.sanguineicon then
			unitFrame.icons.sanguineicon = CreateIcon(unitFrame.icons, "sanguine")
		end
		unitFrame.icons.sanguineicon:Show()
	elseif unitFrame.icons.sanguineicon and unitFrame.icons.sanguineicon:IsShown() then
		unitFrame.icons.sanguineicon:Hide()
	end
end

local function UpdateRaging(unitFrame)
	if not unitFrame.unit or SMT_CDB["General"]["disable_all"] or not SMT_CDB["PlateAlerts"]["enable"] or not SMT_CDB["PlateAlerts"]["Raging_np"] then return end
	
	if not C_ChallengeMode.GetActiveKeystoneInfo() or select(2, C_ChallengeMode.GetActiveKeystoneInfo())[2] ~= 6 then return end
	
	local unit = unitFrame.unit
	
	if AuraUtil.FindAuraByName(GetSpellInfo(228318), unit, "HELPFUL") then
		if not unitFrame.icons.ragingicon then
			unitFrame.icons.ragingicon = CreateIcon(unitFrame.icons, "raging")
		end
		unitFrame.icons.ragingicon:Show()
	elseif unitFrame.icons.ragingicon and unitFrame.icons.ragingicon:IsShown() then
		unitFrame.icons.ragingicon:Hide()
	end
end

local function UpdateGhuun(unitFrame)
	if not unitFrame.unit or SMT_CDB["General"]["disable_all"] or not SMT_CDB["PlateAlerts"]["enable"] or not SMT_CDB["PlateAlerts"]["Ghuun_np"] then return end
	
	if not C_ChallengeMode.GetActiveKeystoneInfo() or select(4, C_ChallengeMode.GetActiveKeystoneInfo())[2] ~= 16 then return end
	
	local unit = unitFrame.unit
	
	if AuraUtil.FindAuraByName(GetSpellInfo(277242), unit, "HELPFUL") then
		if not unitFrame.icons.ghuunicon then
			unitFrame.icons.ghuunicon = CreateIcon(unitFrame.icons, "ghuun")
		end
		unitFrame.icons.ghuunicon:Show()
	elseif unitFrame.icons.ghuunicon and unitFrame.icons.ghuunicon:IsShown() then
		unitFrame.icons.ghuunicon:Hide()
	end
end

local function NamePlate_OnEvent(self, event, arg1, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		UpdateAuras(self)
		UpdatePower(self)
		UpdateBomb(self)
		UpdateBolster(self)
		UpdateSanguine(self)
		UpdateRaging(self)
		UpdateSpells(self, "all")	
	elseif event == "UNIT_AURA" and arg1 == self.unit then
		UpdateAuras(self)
		UpdateBolster(self)
		UpdateSanguine(self)
		UpdateRaging(self)
	elseif event == "UNIT_POWER_FREQUENT" and arg1 == self.unit then
		UpdatePower(self)
	elseif CastingEvents[event] and arg1 == self.unit then		
		local event_SpellID = select(2, ...)
		UpdateSpells(self, event, event_SpellID)
	end
end

local function SetUnit(unitFrame, unit)
	unitFrame.unit = unit
	if unit then
		unitFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
		unitFrame:RegisterUnitEvent("UNIT_AURA", unitFrame.unit)
		unitFrame:RegisterUnitEvent("UNIT_POWER_FREQUENT", unitFrame.unit)
		unitFrame:RegisterUnitEvent("UNIT_SPELLCAST_START", unitFrame.unit)
		unitFrame:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", unitFrame.unit)
		unitFrame:RegisterUnitEvent("UNIT_SPELLCAST_STOP", unitFrame.unit)
		unitFrame:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_START", unitFrame.unit)
		unitFrame:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_STOP", unitFrame.unit)
		unitFrame:SetScript("OnEvent", NamePlate_OnEvent)
		unitFrame.npcID = select(6, strsplit("-", UnitGUID(unit)))
	else
		unitFrame:UnregisterAllEvents()
		unitFrame:SetScript("OnEvent", nil)
		unitFrame.npcID = nil
	end
end

function NamePlates_UpdateAllNamePlates()
	for i, namePlate in ipairs(C_NamePlate.GetNamePlates()) do
		local unitFrame = namePlate.suf
		UpdateAuras(unitFrame)
		UpdatePower(unitFrame)
		UpdateBomb(unitFrame)
		UpdateBolster(unitFrame)
		UpdateSanguine(unitFrame)
		UpdateRaging(unitFrame)
		UpdateSpells(unitFrame, "all")	
	end
end

local function OnNamePlateCreated(namePlate)
	namePlate.suf = CreateFrame("Button", "$parentUnitFrame", namePlate)
	namePlate.suf:SetAllPoints(namePlate)
	namePlate.suf:SetFrameLevel(namePlate:GetFrameLevel())
	
	namePlate.suf.icons = CreateFrame("Frame", nil, namePlate.suf)
	namePlate.suf.icons:SetPoint("BOTTOM", namePlate.suf, "TOP", 0, SMT_CDB["PlateAlerts"]["y"])
	namePlate.suf.icons:SetWidth(90)
	namePlate.suf.icons:SetHeight(30)
	namePlate.suf.icons:SetFrameLevel(namePlate:GetFrameLevel()+1)

	namePlate.suf.icons.Aura_Icons = {}
	namePlate.suf.icons.Spell_Icons = {}
	
	namePlate.suf.icons.ActiveIcons = {}
	namePlate.suf.icons.LineUpIcons = function()
		local lastframe
		for v, frame in T.pairsByKeys(namePlate.suf.icons.ActiveIcons) do
			frame:ClearAllPoints()
			if not lastframe then
				local num = 0
				for k, j in pairs(namePlate.suf.icons.ActiveIcons) do
					num = num + 1
				end
				frame:SetPoint("LEFT", namePlate.suf.icons, "CENTER", -((SMT_CDB["PlateAlerts"]["size"]+4)*num-4)/2,0)
			else
				frame:SetPoint("LEFT", lastframe, "RIGHT", 3, 0)
			end

			lastframe = frame
		end
	end
	
	namePlate.suf.icons.QueueIcon = function(frame, tag)
		frame.v = tag
		
		frame:HookScript("OnShow", function()
			namePlate.suf.icons.ActiveIcons[frame.v] = frame
			namePlate.suf.icons.LineUpIcons()
		end)
		
		frame:HookScript("OnHide", function()
			namePlate.suf.icons.ActiveIcons[frame.v] = nil
			namePlate.suf.icons.LineUpIcons()
		end)
	end
	
	table.insert(G.Plate_IconHolders, namePlate.suf.icons)
	
	namePlate.suf:EnableMouse(false)
end

local function OnNamePlateAdded(unit)
	local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
	local unitFrame = namePlate.suf
	SetUnit(unitFrame, unit)
	UpdateAuras(unitFrame)
	UpdatePower(unitFrame)
	UpdateBomb(unitFrame)
	UpdateBolster(unitFrame)
	UpdateSanguine(unitFrame)
	UpdateRaging(unitFrame)
	UpdateSpells(unitFrame, "all")
end

local function OnNamePlateRemoved(unit)
	local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
	SetUnit(namePlate.suf, nil)
end

local function NamePlates_OnEvent(self, event, ...) 
	if ( event == "VARIABLES_LOADED" ) then
		NamePlates_UpdateAllNamePlates()
	elseif ( event == "NAME_PLATE_CREATED" ) then
		local namePlate = ...
		OnNamePlateCreated(namePlate)
	elseif ( event == "NAME_PLATE_UNIT_ADDED" ) then 
		local unit = ...
		OnNamePlateAdded(unit)
	elseif ( event == "NAME_PLATE_UNIT_REMOVED" ) then 
		local unit = ...
		OnNamePlateRemoved(unit)
	end
end

local NamePlatesFrame = CreateFrame("Frame", G.addon_name.."NamePlatesFrame", UIParent) 
NamePlatesFrame:SetScript("OnEvent", NamePlates_OnEvent)
NamePlatesFrame:RegisterEvent("VARIABLES_LOADED")
NamePlatesFrame:RegisterEvent("NAME_PLATE_CREATED")
NamePlatesFrame:RegisterEvent("NAME_PLATE_UNIT_ADDED")
NamePlatesFrame:RegisterEvent("NAME_PLATE_UNIT_REMOVED")

T.EditPlateIcons = function(tag)
	if tag == "enable" or tag == "all" then
		if SMT_CDB["General"]["disable_all"] or not SMT_CDB["PlateAlerts"]["enable"] then
			for k, frame in pairs(G.Plate_IconHolders) do
				frame:SetAlpha(0)
			end
		else			
			for k, frame in pairs(G.Plate_IconHolders) do
				frame:SetAlpha(1)
			end
		end
	end
	
	if tag == "Explosive_np" or tag == "all" then
		for i, namePlate in ipairs(C_NamePlate.GetNamePlates()) do
			local unitFrame = namePlate.suf		
			UpdateBomb(unitFrame)
		end
	end
	
	if tag == "Bolster_np" or tag == "all" then
		for i, namePlate in ipairs(C_NamePlate.GetNamePlates()) do
			local unitFrame = namePlate.suf		
			UpdateBolster(unitFrame)
		end
	end
	
	if tag == "Sanguine_np" or tag == "all" then
		for i, namePlate in ipairs(C_NamePlate.GetNamePlates()) do
			local unitFrame = namePlate.suf		
			UpdateSanguine(unitFrame)
		end
	end
	
	if tag == "Raging_np" or tag == "all" then
		for i, namePlate in ipairs(C_NamePlate.GetNamePlates()) do
			local unitFrame = namePlate.suf		
			UpdateRaging(unitFrame)
		end
	end
	
	if tag == "icon_size" or tag == "all" then
		for k, frame in pairs(G.Plate_IconHolders) do
			for j, icon in pairs(frame.Aura_Icons) do
				icon:SetSize(SMT_CDB["PlateAlerts"]["size"], SMT_CDB["PlateAlerts"]["size"])
			end
			for j, icon in pairs(frame.Spell_Icons) do
				icon:SetSize(SMT_CDB["PlateAlerts"]["size"], SMT_CDB["PlateAlerts"]["size"])
			end
			if frame.powericon then
				frame.powericon:SetSize(SMT_CDB["PlateAlerts"]["size"], SMT_CDB["PlateAlerts"]["size"])
			end
			if frame.bombicon then
				frame.bombicon:SetSize(SMT_CDB["PlateAlerts"]["size"], SMT_CDB["PlateAlerts"]["size"])
			end
			if frame.bolstericon then
				frame.bolstericon:SetSize(SMT_CDB["PlateAlerts"]["size"], SMT_CDB["PlateAlerts"]["size"])
			end
			if frame.sanguineicon then
				frame.sanguineicon:SetSize(SMT_CDB["PlateAlerts"]["size"], SMT_CDB["PlateAlerts"]["size"])
			end
			if frame.ragingicon then
				frame.ragingicon:SetSize(SMT_CDB["PlateAlerts"]["size"], SMT_CDB["PlateAlerts"]["size"])
			end
			if frame.ghuunicon then
				frame.ghuunicon:SetSize(SMT_CDB["PlateAlerts"]["size"], SMT_CDB["PlateAlerts"]["size"])
			end
			frame.LineUpIcons()
		end
	end
	
	if tag == "font_size" or tag == "all" then
		for k, frame in pairs(G.Plate_IconHolders) do
			for j, icon in pairs(frame.Aura_Icons) do
				icon.text:SetFont(font, SMT_CDB["PlateAlerts"]["fsize"], "OUTLINE")
				icon.count:SetFont(font, SMT_CDB["PlateAlerts"]["fsize"], "OUTLINE")
			end
			for j, icon in pairs(frame.Spell_Icons) do
				icon.cast.target:SetFont(font, SMT_CDB["PlateAlerts"]["fsize"], "OUTLINE")
				icon.cast.target:SetHeight(SMT_CDB["PlateAlerts"]["fsize"]*2.5)
				icon.cast.spell:SetFont(font, SMT_CDB["PlateAlerts"]["fsize"], "OUTLINE")
				icon.cast.spell:SetHeight(SMT_CDB["PlateAlerts"]["fsize"])
				icon.cast.dur:SetFont(font, SMT_CDB["PlateAlerts"]["fsize"], "OUTLINE")
			end
			if frame.powericon then
				frame.powericon.count:SetFont(font, SMT_CDB["PlateAlerts"]["fsize"], "OUTLINE")
			end
			if frame.bolstericon then
				frame.bolstericon.count:SetFont(font, SMT_CDB["PlateAlerts"]["fsize"], "OUTLINE")
			end
		end
	end
	
	if tag == "y" or tag == "all" then
		for k, frame in pairs(G.Plate_IconHolders) do
			frame:SetPoint("BOTTOM", frame:GetParent(), "TOP", 0, SMT_CDB["PlateAlerts"]["y"])
		end
	end
end
----------------------------------------------------------
----------------[[    Chat Message    ]]------------------
----------------------------------------------------------
local ChatMsgEventFrame = CreateFrame("Frame", G.addon_name.."ChatMsgEventFrame", G.FrameHolder) 

ChatMsgEventFrame:SetScript("OnEvent", function(self, event, ...)
	if SMT_CDB["General"]["disable_all"] then return end
	
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local _, Event_type, _, _, _, _, _, _, DestName, _, _, SpellID = CombatLogGetCurrentEventInfo()
		if Event_type == "SPELL_AURA_APPLIED" and DestName == G.PlayerName then
			if SMT_CDB["ChatMsgAuras"][SpellID] then
				local spell_name = GetSpellInfo(SpellID)
				T.SendChatMsg(G.PlayerName.." "..spell_name, "SAY")
			end
		end
	elseif event == "RAID_BOSS_WHISPER" then
		local Msg = ...
		for spell, v in pairs(SMT_CDB["ChatMsgBossWhispers"]) do
			if Msg and strfind(Msg, spell) then		
				local spell_name = GetSpellInfo(tonumber(spell))
				T.SendChatMsg(G.PlayerName.." "..spell_name, "SAY")
				break
			end
		end
	end
end)

ChatMsgEventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
ChatMsgEventFrame:RegisterEvent("RAID_BOSS_WHISPER")
----------------------------------------------------------
-----------------[[    Test Frame    ]]-------------------
----------------------------------------------------------
T.CreateTestIcon("123_test_hl_200768", 5, 1, 1, 1)
T.CreateTestIcon("123_test_no_200630", 7, 1, 1, 0)
T.CreateTestIcon("123_test_no_200580", 8, 1, 0, 0)

T.CreateTestText("Quaking", 5, 1, 1, 0)
T.CreateTestText("Explosive", 5, 0, 1, 0)