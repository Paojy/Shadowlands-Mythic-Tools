local T, C, L, G = unpack(select(2, ...))

G.Dungeons[777] = {
	{ -- 测试1
		id = 34696,
		alerts = {
			AlertIcon = { -- 图标提示
				["1544_cast_no_164862"] = {}, -- 地图_类型(cast施法 com对我施法 aura光环 auras多人光环 log战斗记录 bmsg首领讯息)_是否高亮（no/hl）_法术ID
				["1544_cast_no_20473"] = {},
				["1544_com_no_19750"] = {}, 
			},
			PlateAlert = { -- 姓名板图标
				[774] = "PlateAuras",  -- 光环
				[69607] = "PlateSpells",  -- 技能	
				[1] = "PlatePower",  -- 能量
			},
			ChatMsg = {
				[8936] = "ChatMsgAuras",  -- 受到DEBUFF喊话
				["8936"] = "ChatMsgBossWhispers",  -- 被BOSS密语汉化
			},
		},
		cd = {
			[69607] = 5, -- 姓名板技能的CD
		},
	},
	{ -- 测试2
		id = 34689,
		alerts = {
			AlertIcon = {
				["1544_cast_hl_774"] = {},
				["1544_com_hl_8936"] = {},
			},
			HLOnRaid = { -- 团队图标高亮
				["1544_8936"] = "HL_Auras", -- 光环
				["1544_774_5"] = "HL_Cast",  -- 瞬发法术
				["1544_19750"] = "HL_Casting", -- 读条法术
			},
			PlateAlert = {
				[8936] = "PlateAuras", 
				[69608] = "PlateSpells", 
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
				["1544_aura_hl_774"] = {"HELPFUL", "player"}, 
				["1544_auras_hl_774"] = {"HELPFUL"}, 
				["1544_log_hl_48438"] = {"SPELL_CAST_START", nil, 3}, 
				["1544_bmsg_hl_48438"] = {"CHAT_MSG_SAY", "48438", 3}, 
			},
		},
	},	
	{ -- 测试4
		id = 112575,
		alerts = {
			PlateAlert = {
				[224098] = "PlateSpells", 
			},
		},
		cd = {
			[224098] = 5,
		},	
	},
}






