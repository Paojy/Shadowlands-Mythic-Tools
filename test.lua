local T, C, L, G = unpack(select(2, ...))

-- 白 1, 1, 1
-- 红 1, 0, 0
-- 黄 1, 1, 0
-- 浅蓝 0, 1, 1
-- 浅绿 0, 1, 0
-- 浅紫色 1, 0, 1
-- 橙色 1, .5, 0
-- 深蓝 0, .5, .5
-- 深紫色 .5, 0, .5

G.Dungeons[777] = {
	{ -- 测试1
		id = 34696,
		alerts = {
			AlertIcon = {
				["1014_cast_no_164862"] = {}, -- check
				["1014_cast_no_8936"] = {},-- check
				["1014_com_no_164862"] = {}, -- check
			},
			PlateAlert = {
				[774] = "PlateAuras", -- check
				[69607] = "PlateSpells", -- check
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
				["1014_cast_hl_774"] = {},-- check
				["1014_com_hl_8936"] = {},-- check
			},
			HLOnRaid = {
				["1014_8936"] = "HL_Auras",
				["1014_774_5"] = "HL_Cast", -- check
				["1014_48438"] = "HL_Casting", -- check
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
				["1014_aura_hl_774"] = {"HELPFUL", "player"}, -- check
				["1014_auras_hl_774"] = {"HELPFUL"}, -- check
				["1014_log_hl_48438"] = {"SPELL_CAST_START", nil, 3}, -- check
				["1014_bmsg_hl_48438"] = {"CHAT_MSG_SAY", "48438", 3}, -- check
			},
		},
	},
}






