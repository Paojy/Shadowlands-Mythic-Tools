local T, C, L, G = unpack(select(2, ...))

G.Dungeons[777] = {
	{ -- 测试1
		id = 34696,
		alerts = {
			AlertIcon = {
				["1544_cast_no_164862"] = {}, -- check
				["1544_cast_no_20473"] = {},-- check
				["1544_com_no_19750"] = {}, -- check
			},
			PlateAlert = {
				[774] = "PlateAuras", -- check
				[69607] = "PlateSpells", -- check
				[1] = "PlatePower", -- check
			},
			ChatMsg = {
				[8936] = "ChatMsgAuras", -- check
				["8936"] = "ChatMsgBossWhispers", -- check
			},
		},
		cd = {
			[69607] = 1,
		},
	},
	{ -- 测试2
		id = 34689,
		alerts = {
			AlertIcon = {
				["1544_cast_hl_774"] = {},-- check
				["1544_com_hl_8936"] = {},-- check
			},
			HLOnRaid = {
				["1544_8936"] = "HL_Auras",
				["1544_774_5"] = "HL_Cast", -- check
				["1544_19750"] = "HL_Casting", -- check
			},
			PlateAlert = {
				[8936] = "PlateAuras", -- check
				[69608] = "PlateSpells", -- check
			},
		},
		cd = {
			[69608] = 5,
		},		
	},
	{ -- 测试3
		id = 96444,
		alerts = {
			AlertIcon = {
				["1544_aura_hl_774"] = {"HELPFUL", "player"}, -- check
				["1544_auras_hl_774"] = {"HELPFUL"}, -- check
				["1544_log_hl_48438"] = {"SPELL_CAST_START", nil, 3}, -- check
				["1544_bmsg_hl_48438"] = {"CHAT_MSG_SAY", "48438", 3}, -- check
			},
		},
	},
}






