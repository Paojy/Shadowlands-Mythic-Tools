local T, C, L, G = unpack(select(2, ...))

G.Dungeons[740] = { -- 黑鸦堡垒1{ -- 融合之魂
		id = 98542,
		img = 1410986,
		alerts = {
			AlertIcon = {
				["1501_com_no_195254"] = {}, -- 漩涡之镰
				["1501_cast_no_194956"] = {}, -- 收割灵魂
				["1501_cast_no_196078"] = {}, -- 召唤灵魂
				["1501_cast_hl_196587"] = {}, -- 灵魂爆发
				["1501_aura_no_194966"] = {"HARMFUL", "player"}, -- 灵魂回响
			},
			
		},
	},
	{ -- 鸦堡小蜘蛛
		id = 98677,
		alerts = {
			AlertIcon = {
				["1501_aura_no_225909"] = {"HARMFUL", "player"}, -- 灵魂毒液
			},
		},
	},
	{ -- 失魂的勇士
		id = 98243,
		alerts = {
			PlateAlert = {
				[200261] = "PlateSpells", -- 碎骨打击
				[225998] = "PlateSpells", -- 命令怒吼
			},
		},
		cd = {
			[200261] = 22, -- 碎骨打击
			[225998] = 30, -- 命令怒吼
		},
	},
	{ -- 复活的斥候
		id = 98691,
		alerts = {
			AlertIcon = {
				["1501_cast_hl_200291"] = {}, -- 利刃之舞
			},
			PlateAlert = {
				[200291] = "PlateSpells", -- 利刃之舞
			},
		},
		cd = {
			[200291] = 20, -- 利刃之舞
		},
	},
	{ -- 复活的弓箭手
		id = 98275,
		alerts = {
			AlertIcon = {
				["1501_cast_no_200343"] = {}, -- 箭雨
				["1501_com_hl_193633"] = {}, -- 射击
			},
			HLOnRaid = {
				["1501_193633_c"] = "HL_Casting", -- 射击
			},
			PlateAlert = {
				[193633] = "PlateSpells", -- 射击
				[200343] = "PlateSpells", -- 箭雨
			},
		},
		cd = {
			[193633] = 1, -- 射击
			[200343] = 20,-- 箭雨
		},
	},
	{ -- 复活的奥术师
		id = 98280,
		alerts = {
			HLOnRaid = {
				["1501_200248_c"] = "HL_Casting", -- 奥术突袭
			},
			PlateAlert = {
				[200248] = "PlateSpells", -- 奥术突袭
				[200248] = "PlateAuras", -- 奥术突袭
			},
		},
		cd = {
			[200248] = 1,-- 奥术突袭
		},
	},
	{ -- 奥术仆从
		id = 101549,
		alerts = {
			PlateAlert = {
				[200256] = "PlateSpells", -- 相位爆炸
			},
		},
		cd = {
			[200256] = 1,-- 相位爆炸
		},
	},
	{ -- 复活的小伙伴
		id = 101839,
		alerts = {
			PlateAlert = {
				[225962] = "PlateSpells", -- 嗜血跳跃 
			},
		},
		cd = {
			[225962] = 5,-- 嗜血跳跃 
		},
	},
	{ -- 指挥官什达索尼
		id = 98706,
		cd = {
			[200261] = 22, -- 碎骨打击
			[225998] = 30, -- 命令怒吼
		},
	},
	{ -- 伊莉萨娜·拉文凯斯
		id = 98696,
		img = 1410961,
		alerts = {
			AlertIcon = {
				["1501_com_hl_197418"] = {}, -- 复仇之剪
				["1501_aura_no_197546"] = {"HARMFUL", "player"}, -- 野蛮战刃
				["1501_com_no_197546"] = {}, -- 野蛮战刃
				["1501_cast_hl_197478"] = {}, -- 黑暗冲锋
				["1501_com_no_197696"] = {}, -- 眼棱
			},
			HLOnRaid = {
				["1501_197546_c"] = "HL_Casting", -- 野蛮战刃
				["1501_197478_a"] = "HL_Auras", -- 黑暗冲锋
			},
		},
	},
	{ -- 复活的奥术师
		id = 100486,
		alerts = {
			PlateAlert = {
				[197797] = "PlateSpells", -- 奥术突袭
			},
		},
		cd = {
			[197797] = 1, -- 奥术突袭
		},
	},
	{ -- 失魂的先锋
		id = 100485,
		alerts = {
			AlertIcon = {
				["1501_com_no_197974"] = {}, -- 碎骨攻击
			},
			PlateAlert = {
				[197974] = "PlateSpells", -- 碎骨攻击
			},
		},
		cd = {
			[197974] = 22, -- 碎骨攻击
		},
	},
	{ -- 虫语清道夫
		id = 98792,
		alerts = {
			AlertIcon = {
				["1501_com_no_200913"] = {}, -- 消化不良
			},
			PlateAlert = {
				[200913] = "PlateSpells", -- 消化不良
			},
		},
		cd = {
			[200913] = 8, -- 消化不良
		},
	},
	{ -- 愤怒卫士剑圣
		id = 98810,
		alerts = {
			AlertIcon = {
				["1501_com_hl_201139"] = {}, -- 猛攻
			},
			PlateAlert = {
				[8599] = "PlateAuras", -- 激怒
				[201139] = "PlateSpells", -- 猛攻			
			},
		},
		cd = {
			[201139] = 20, -- 猛攻
		},
	},
	{ -- 魔怨支配者
		id = 102788,
		alerts = {
			AlertIcon = {
				["1501_com_hl_203163"] = {}, -- 可恶的蝙蝠
			},
			HLOnRaid = {
				["1501_203163_c"] = "HL_Casting", -- 可恶的蝙蝠
			},
			PlateAlert = {
				[227913] = "PlateAuras", -- 邪能狂乱			
			},
		},
	},
	{ -- 可恨的斯麦斯帕
		id = 98949,
		img = 1410982,
		alerts = {
			AlertIcon = {
				["1501_aura_no_198079"] = {"HARMFUL", "player"}, -- 怨恨凝视
				["1501_auras_no_198079"] = {"HARMFUL"}, -- 怨恨凝视
				["1501_aura_no_198446"] = {"HARMFUL", "player"}, -- 邪能呕吐
				["1501_auras_no_198446"] = {"HARMFUL"}, -- 邪能呕吐				
				["1501_cast_hl_198073"] = {}, -- 大地践踏
				["1501_com_hl_198245"] = {}, -- 野蛮强击
			},
			HLOnRaid = {
				["1501_198079_c"] = "HL_Casting", -- 怨恨凝视
			},
			PlateAlert = {
				["98949"] = "PlatePower", -- 能量
			},
		},
	},
	{ -- 复活的剑士
		id = 102094,
		alerts = {
			AlertIcon = {
				["1501_com_hl_214003"] = {}, -- 致命一击
			},
			PlateAlert = {
				[214003] = "PlateSpells", -- 致命一击
			},
		},
		cd = {
			[214003] = 15, -- 致命一击
		},
	},
	{ -- 复活的长枪兵
		id = 102095,
		alerts = {
			AlertIcon = {
				["1501_com_hl_214001"] = {}, -- 渡鸦的俯冲
			},
			PlateAlert = {
				[214001] = "PlateSpells", -- 渡鸦的俯冲
			},
		},
		cd = {
			[214001] = 10, -- 渡鸦的俯冲
		},
	},
	{ -- 库塔洛斯·拉文凯斯
		id = 98965,
		img = 1410967,
		alerts = {
			AlertIcon = {
				["1501_aura_no_198635"] = {"HARMFUL", "player"}, -- 无失之剪
				["1501_cast_hl_198641"] = {}, -- 剑刃旋风
			},
		},
	},
	{ -- 丹塔利纳克斯
		id = 98970,
		alerts = {
			AlertIcon = {
				["1501_cast_no_202019"] = {}, -- 暗影箭雨
				["1501_com_hl_201733"] = {}, -- 针刺虫群
				["1501_com_no_199143"] = {}, -- 催眠之云
				["1501_cast_no_199193"] = {}, -- 恐惧魔王的狡诈
			},
			HLOnRaid = {
				["1501_201733_c"] = "HL_Casting", -- 针刺虫群
			},
		},
	},
}

G.Dungeons[762] = { -- 黑心林地1
	{ -- 狂乱的夜爪豹
		id = 95772,
		alerts = {
			AlertIcon = {
				["1466_aura_hl_225484"] = {"HARMFUL", "player"}, -- 痛苦撕裂
			},
			HLOnRaid = {
				["1466_225484_a"] = "HL_Auras", -- 痛苦撕裂
			},
			PlateAlert = {
				[225484] = "PlateSpells", -- 痛苦撕裂
			},
		},
		cd = {
			[225484] = 14, -- 痛苦撕裂
		},
	},
	{ -- 精神错乱的尖啸夜枭
		id = 95769,
		alerts = {
			AlertIcon = {		
				["1466_aura_no_200630"] = {"HARMFUL", "player"}, -- 挫志尖叫
			},
			PlateAlert = {
				[200630] = "PlateSpells", -- 挫志尖叫
			},
		},
		cd = {
			[200630] = 15, -- 挫志尖叫
		},
	},
	{ -- 发狂的锋喙狮鹫
		id = 95766,
		alerts = {
			PlateAlert = {
				[200768] = "PlateSpells", -- 推进冲锋
			},
		},
		cd = {
			[200768] = 16, -- 渡鸦的俯冲
		},
	},
	{ -- 烂皮灰熊
		id = 95779,
		alerts = {
			AlertIcon = {
				["1466_cast_hl_200580"] = {}, -- 疯狂怒吼
			},
			PlateAlert = {
				[200580] = "PlateSpells", -- 疯狂怒吼
			},
		},
		cd = {
			[200580] = 26, -- 疯狂怒吼
		},
	},
	{ -- 恐魂施毒者
		id = 101679,
		alerts = {
			AlertIcon = {
				["1466_aura_hl_200684"] = {"HARMFUL", "player"}, -- 梦魇毒素
			},
			HLOnRaid = {
				["1466_200684_a"] = "HL_Auras", -- 梦魇毒素
			},
			PlateAlert = {
				[200684] = "PlateSpells", -- 梦魇毒素
			},
		},
		cd = {
			[200684] = 10, -- 梦魇毒素
		},
	},
	{ -- 恐魂毁灭者
		id = 95771,
		alerts = {
			AlertIcon = {
				["1466_cast_no_200658"] = {}, -- 星辰之雨
				["1466_aura_no_200642"] = {"HARMFUL", "player"}, -- 绝望
			},
			PlateAlert = {
				[200658] = "PlateSpells", -- 星辰之雨
			},
		},
		cd = {
			[200658] = 25, -- 星辰之雨
		},
	},
	{ -- 大德鲁伊格兰达里斯
		id = 96512,
		img = 1410936,
		alerts = {
			AlertIcon = {
				["1466_cast_no_212464"] = {}, -- 夜幕
				["1466_cast_hl_198376"] = {}, -- 原始狂暴
				["1466_aura_hl_196376"] = {"HARMFUL", "player"}, -- 痛苦撕扯
			},
			HLOnRaid = {
				["1466_196376_a"] = "HL_Auras", -- 痛苦撕扯
			},
		}, 
	},
	{ -- 腐心树妖
		id = 99358,
		alerts = {
			PlateAlert = {
				[198904] = "PlateSpells", -- 剧毒之矛
			},
		}, 
	},
	{ -- 梦魇住民
		id = 101991,
		alerts = {
			AlertIcon = {
				["1466_aura_hl_204243"] = {"HARMFUL", "player"}, -- 折磨之眼
			},
			HLOnRaid = {
				["1466_204243_a"] = "HL_Auras", -- 折磨之眼
			},
			PlateAlert = {
				[204243] = "PlateSpells", -- 折磨之眼
			},
		},
		cd = {
			[204243] = 16, -- 折磨之眼
		},
	},
	{ -- 橡树之心
		id = 103344,
		img = 1410973,
		alerts = {
			AlertIcon = {
				["1466_cast_hl_204666"] = {}, -- 碎裂之土
				["1466_cast_no_204667"] = {}, -- 梦魇之息
				["1466_cast_no_204574"] = {}, -- 纠缠之根
				["1466_cast_no_212786"] = {}, -- 拔根而起
				["1466_com_hl_204611"] = {}, -- 粉碎之握
				["1466_aura_hl_204611"] = {"HARMFUL", "player"}, -- 粉碎之握
			},
			HLOnRaid = {
				["1466_204667_a"] = "HL_Auras", -- 梦魇之息
				["1466_204611_a"] = "HL_Auras", -- 粉碎之握
			},
		}, 
	},
	{ -- 污血之怒
		id = 113398,
		alerts = {
			AlertIcon = {
				["1466_cast_no_201272"] = {}, -- 鲜血炸弹
			},			
			PlateAlert = {
				[201226] = "PlateSpells", -- 鲜血突袭
			}, 
		},
		cd = {
			[201226] = 22, -- 鲜血突袭
		},		
	},
	{ -- 污血之怒
		id = 100531,
		cd = {
			[201226] = 22, -- 鲜血突袭
		},	
	},
	{ -- 污血爆裂者
		id = 100532,
		alerts = {
			HLOnRaid = {
				["1466_201298_c"] = "HL_Casting", -- 鲜血箭	
			},
			PlateAlert = {
				[225562] = "PlateSpells", -- 鲜血变身
			}, 
		},
		cd = {
			[225562] = 1, -- 鲜血变身
		},		
	},
	{ -- 德萨隆
		id = 99200,
		img = 1410946,
		alerts = {
			AlertIcon = {
				["1466_cast_hl_199389"] = {}, -- 大地咆哮
				["1466_cast_hl_199345"] = {}, -- 下冲气流
				["1466_aura_no_199345"] = {"HELPFUL", "boss1"}, -- 下冲气流
				["1466_aura_hl_191326"] = {"HARMFUL", "player"}, -- 腐化之息
			},
		},  
	},
	{ -- 骇火小鬼
		id = 100527,
		alerts = {
			AlertIcon = {
				["1466_aura_hl_201399"] = {"HARMFUL", "player"}, -- 恐惧炼狱
				["1466_com_no_201399"] = {}, -- 恐惧炼狱
				["1466_com_no_201411"] = {}, -- 火焰箭
			},
			HLOnRaid = {
				["1466_201399_c"] = "HL_Casting", -- 恐惧炼狱
				["1466_201411_c"] = "HL_Casting", -- 火焰箭
			},
		},
	},
	{ -- 污心召唤师
		id = 99366,
		alerts = {
			AlertIcon = {
				["1466_com_no_201837"] = {}, -- 暗影箭			
				["1466_aura_hl_225568"] = {"HARMFUL", "player"}, -- 隔绝诅咒
			},
			HLOnRaid = {
				["1466_201837_c"] = "HL_Casting", -- 暗影箭

			},
			PlateAlert = {
				[201837] = "PlateSpells", -- 暗影箭
			},
		},
		cd = {
			[201837] = 1, -- 暗影箭
		},
	},
	{ -- 污心神射手
		id = 100539,
		alerts = {
			AlertIcon = {
				["1466_com_no_201858"] = {}, -- 射击			
				["1466_aura_no_201902"] = {"HARMFUL", "player"}, -- 灼热射击
			},
			HLOnRaid = {
				["1466_201858_c"] = "HL_Casting", -- 射击

			},
			PlateAlert = {
				[201858] = "PlateSpells", -- 射击
			},
		},
		cd = {
			[201858] = 1, -- 射击
		},
	},
	{ -- 痛苦的吸血蝠
		id = 100526,
		alerts = {
			AlertIcon = {	
				["1466_aura_no_201361"] = {"HARMFUL", "player"}, -- 魔魂撕咬
			},
		}, 
	},
	{ -- 萨维斯之影
		id = 99192,
		img = 1410979,
		alerts = {
			AlertIcon = {
				["1466_com_hl_200185"] = {}, -- 梦魇箭
				["1466_com_hl_200289"] = {}, -- 增长妄想
				["1466_auras_no_200289"] = {"HARMFUL"}, -- 增长妄想
				["1466_aura_hl_200238"] = {"HARMFUL", "player"}, -- 弱肉强食
				["1466_aura_no_200182"] = {"HARMFUL", "player"}, -- 溃烂割裂
				["1466_aura_no_221315"] = {"HELPFUL", "boss1"}, -- 天启强化
			},
			HLOnRaid = {
				["1466_200185_c"] = "HL_Casting", -- 梦魇箭
				["1466_200238_a"] = "HL_Auras", -- 弱肉强食
				["1466_200182_a"] = "HL_Auras", -- 溃烂割裂
				
			},
		}, 
	},
}

G.Dungeons[716] = { -- 艾萨拉之眼1
	{ -- 积怨牧鱼者
		id = 100216,
		alerts = {
			AlertIcon = {	
				["1456_aura_no_197144"] = {"HARMFUL", "player"}, -- 钩网
				["1456_cast_hl_225089"] = {}, -- 闪电之刺
			},
			PlateAlert = {
				[225089] = "PlateSpells", -- 闪电之刺
			},
		},
		cd = {
			[225089] = 25, -- 闪电之刺
		},
	},
	{ -- 积怨战士
		id = 91781,
		alerts = {
			AlertIcon = {	
				["1456_aura_no_195094"] = {"HARMFUL", "player"}, -- 珊瑚猛击
			},
			PlateAlert = {
				[176048] = "PlateAuras", -- 激怒
			},
		},
	},	
	{ -- 积怨神谕者
		id = 95861,
		alerts = {
			PlateAlert = {
				[195046] = "PlateSpells", -- 复苏之水
			},
		},
		cd = {
			[195046] = 25, -- 复苏之水
		},		
	},	
	{ -- 积怨织雷者
		id = 91783,
		alerts = {
			AlertIcon = {	
				["1456_com_no_195109"] = {}, -- 电弧
			},
			HLOnRaid = {
				["1456_195109_c"] = "HL_Casting", -- 电弧
			},
			PlateAlert = {
				[195109] = "PlateSpells", -- 电弧
				[196870] = "PlateSpells", -- 风暴
			},
		},
		cd = {
			[195109] = 15, -- 电弧
			[196870] = 25, -- 风暴
		},	
	},	
	{ -- 游荡的硬壳龟
		id = 91785,
		alerts = {
			AlertIcon = {	
				["1456_aura_no_195105"] = {"HARMFUL", "player"}, -- 噬骨嘶咬
			},
			PlateAlert = {
				[195103] = "PlateAuras", -- 尖刺甲壳
			},
		},
	},	
	{ -- 砂泥蜗牛
		id = 91786,
		alerts = {
			PlateAlert = {
				[195473] = "PlateSpells", -- 粗糙的烂泥
			},
		},
		cd = {
			[195473] = 8, -- 粗糙的烂泥
		},
	},	
	{ -- 积怨碾压者
		id = 91782,
		alerts = {
			AlertIcon = {	
				["1456_com_no_195172"] = {}, -- 巨力猛击
				["1456_cast_hl_195129"] = {}, -- 雷霆践踏
			},
			PlateAlert = {
				[195129] = "PlateSpells", -- 雷霆践踏
			},
		},
		cd = {
			[195129] = 16, -- 雷霆践踏
		},		
	},	
	{ -- 督军帕杰什
		id = 91784,
		img = 1410992,
		alerts = {
			AlertIcon = {
				["1456_cast_no_196563"] = {}, -- 召唤援军
				["1456_cast_hl_191900"] = {}, -- 碎裂波动
				["1456_cast_hl_192094"] = {}, -- 穿刺之矛
				["1456_aura_hl_192131"] = {"HARMFUL", "player"}, -- 投掷长矛
				["1456_com_hl_192131"] = {}, -- 投掷长矛
				["1456_aura_no_197064"] = {"HELPFUL", "boss1"}, -- 激怒
			},
			HLOnRaid = {
				["1456_192131_c"] = "HL_Casting", -- 投掷长矛
			},
		},
	},	
	{ -- 积怨碎壳者
		id = 97264,
		alerts = {
			AlertIcon = {
				["1456_cast_hl_192135"] = {}, -- 低吼
			},
			PlateAlert = {
				[192135] = "PlateSpells", -- 低吼
			},
		},
		cd = {
			[192135] = 10, -- 低吼
		},
	},	
	{ -- 积怨踏浪者
		id = 97269,
		alerts = {
			AlertIcon = {
				["1456_cast_hl_197502"] = {}, -- 恢复
				["1456_cast_com_192138"] = {}, -- 闪电打击
			},
			HLOnRaid = {
				["1456_192138_c"] = "HL_Casting", -- 闪电打击
			},
			PlateAlert = {
				[197502] = "PlateSpells", -- 恢复
				[192138] = "PlateSpells", -- 闪电打击
			},
		},
		cd = {
			[197502] = 1, -- 恢复
			[192138] = 1, -- 闪电打击
		},
	},	
	{ -- 积怨奥术师
		id = 97171,
		alerts = {
			PlateAlert = {
				[196028] = "PlateSpells", -- 奥术弹射	
			},
		},
		cd = {
			[196028] = 1, -- 奥术弹射
		},
	},	
	{ -- 盐海小水滴
		id = 97172,
		alerts = {
			AlertIcon = {
				["1456_aura_no_193636"] = {"HARMFUL", "player"}, -- 水花飞溅
			},
		},
	},	
	{ -- 积怨夫人
		id = 91789,
		img = 1410966,
		alerts = {
			AlertIcon = {
				["1456_cast_no_193682"] = {}, -- 召唤风暴
				["1456_cast_hl_193597"] = {}, -- 静电新星
				["1456_cast_hl_193611"] = {}, -- 凝聚闪电	
				["1456_aura_no_193717"] = {"HARMFUL", "player"}, -- 女巫的诅咒
			},
		},
	},	
	{ -- 唤雷多头蛇
		id = 91792,
		alerts = {
			PlateAlert = {
				[196287] = "PlateSpells", -- 尾鞭	
				[196290] = "PlateSpells", -- 混乱风暴
				[196296] = "PlateSpells", -- 翻滚风暴
			},
		},
		cd = {
			[196287] = 25, -- 尾鞭	
			[196290] = 32, -- 混乱风暴
			[196296] = 24, -- 翻滚风暴
		},
	},	
	{ -- 苦水清道夫     
		id = 99630,
		alerts = {
			AlertIcon = {
				["1456_aura_no_196059"] = {"HARMFUL", "player"}, -- 海盐毒素
				["1456_aura_no_196058"] = {"HARMFUL", "player"}, -- 昏睡毒素
				["1456_aura_no_196060"] = {"HARMFUL", "player"}, -- 麻痹毒素
			},
		},
	},	
	{ -- 逐潮蟹        
		id = 91793,
		alerts = {
			AlertIcon = {
				["1456_aura_no_196111"] = {"HARMFUL", "player"}, -- 锯齿利爪
			},
		},
	},	
	{ -- 玛拉纳沙地行者
		id = 91790,
		alerts = {
			AlertIcon = {
				["1456_cast_hl_196127"] = {}, -- 喷洒沙砾
				["1456_aura_no_196144"] = {"HARMFUL", "player"}, -- 沙尘暴
			},
			PlateAlert = {
				[196127] = "PlateSpells", -- 喷洒沙砾	
			},
		},
		cd = {
			[196127] = 14, -- 喷洒沙砾
		},
	},	
	{ -- 玛拉纳硬壳战士
		id = 95947,
		alerts = {
			PlateAlert = {
				[196175] = "PlateSpells", -- 甲壳
			},
		},
		cd = {
			[196175] = 17, -- 甲壳
		},
	},	
	{ -- 瑟芬崔斯克     
		id = 91808,
		img = 1410978,
		alerts = {
			AlertIcon = {
				["1456_cast_no_192050"] = {}, -- 毒液喷吐				
				["1456_aura_no_191855"] = {"HARMFUL", "player"}, -- 剧毒创伤
				["1456_aura_no_191848"] = {"HELPFUL", "boss1"}, -- 狂暴
			},
		},
	},	
	{ -- 奥术多头蛇子嗣  
		id = 97260,
		alerts = {
			AlertIcon = {
				["1456_com_hl_192005"] = {}, -- 奥术冲击	
			},
			HLOnRaid = {
				["1456_192005_c"] = "HL_Casting", -- 奥术冲击
			},
		},
	},	
	{ -- 烈焰多头蛇子嗣  
		id = 97259,
		alerts = {
			AlertIcon = {
				["1456_cast_hl_192003"] = {}, -- 炽焰新星
			},
		},
	},	
	{ -- 盐鳞游荡者       
		id = 113111,
		alerts = {
			AlertIcon = {
				["1456_aura_no_196064"] = {"HARMFUL", "player"}, -- 撕裂之咬
			},
		},
	},
	{ -- 踏浪巨人        
		id = 95939,
		alerts = {
			AlertIcon = {
				["1456_cast_no_195832"] = {}, -- 强震
			},
			PlateAlert = {
				[195832] = "PlateSpells", -- 强震	
			},
		},
		cd = {
			[195832] = 20, -- 强震
		},
	},	
	{ -- 海巨人弄潮者     
		id = 91796,
		alerts = {
			AlertIcon = {
				["1456_cast_hl_195944"] = {}, -- 冲天怒火
			},
			PlateAlert = {
				[195944] = "PlateSpells", -- 冲天怒火	
			},
		},
		cd = {
			[195944] = 15, -- 冲天怒火
		},
	},	
	{ -- 深须国王         
		id = 91797,
		img = 1410964,
		alerts = {
			AlertIcon = {
				["1456_cast_no_193051"] = {}, -- 呼潮引浪
				["1456_cast_no_193093"] = {}, -- 大地猛击
				["1456_cast_hl_193152"] = {}, -- 地震
				["1456_aura_no_197550"] = {"HELPFUL", "boss1"}, -- 狂乱
				["1456_auras_no_193018"] = {"HARMFUL", 17}, -- 气体泡泡
			},
		},
	},	
	{ -- 祭祀者勒莎      
		id = 100248,
		alerts = {
			HLOnRaid = {
				["1456_196516_c"] = "HL_Casting", -- 闪电冲击
			},
			PlateAlert = {
				[196516] = "PlateSpells", -- 闪电冲击
			},
		},
		cd = {
			[196516] = 1, -- 闪电冲击
		},
	},
	{ -- 导魔者瓦里兹     
		id = 100249,
		cd = {
			[196516] = 1, -- 闪电冲击
		},
	},
	{ -- 束缚者阿什奥伊  
		id = 100250,
		alerts = {
			PlateAlert = {
				[196515] = "PlateSpells", -- 魔法禁锢
			},
		},
		cd = {
			[196515] = 18, -- 魔法禁锢
			[196516] = 1, -- 闪电冲击
		},
	},
	{ -- 秘术师萨维    
		id = 98173,
		cd = {
			[196870] = 20, -- 风暴
			[196516] = 1, -- 闪电冲击
		},
	},	
	{ -- 艾萨拉之怒     
		id = 96028,
		img = 1410993,
		alerts = {
			AlertIcon = {
				["1456_cast_no_192617"] = {}, -- 强力激流
				["1456_aura_no_192706"] = {"HARMFUL", "player"}, -- 奥术炸弹
				["1456_cast_hl_197365"] = {}, -- 压抑深渊
				["1456_aura_no_196665"] = {"HARMFUL", "player"}, -- 魔法共鸣
				["1456_aura_no_196666"] = {"HARMFUL", "player"}, -- 冰霜共鸣
				["1456_cast_no_192985"] = {}, -- 愤怒嚎叫
			},
			HLOnRaid = {
				["1456_197365_c"] = "HL_Casting", -- 压抑深渊
			},
		},
	},	
}

G.Dungeons[800] = { -- 群星庭院1
	{--魔刃豹
		id = 105699,
		alerts = {
			AlertIcon = {
				["1571_aura_hl_209516"] = {"HARMFUL", "player"}, -- 魔法之牙
			},
			PlateAlert = {
				[209516] = "PlateSpells", -- 魔法之牙
			},
		},
		cd = {
			[209516] = 9, -- 魔法之牙
		},
	},
	{--暮色卫队哨兵
		id = 104251,
		alerts = {
			AlertIcon = {
				["1571_aura_no_209036"] = {"HARMFUL", "player"}, -- 丢火把
			},
		},
	},
	{--暮色卫队卫兵
		id = 104246,
		alerts = {
			AlertIcon = {
				["1571_aura_no_215204"] = {"HARMFUL", "player"}, -- 遏止
			},
			PlateAlert = {
				[215204] = "PlateSpells", -- 遏止
			},
		},
		cd = {
			[215204] = 1, -- 遏止
		},
	},
	{--暮色卫队奥术师
		id = 104247,
		alerts = {
			PlateAlert = {
				[209410] = "PlateSpells", -- 夜幕之球
				[209404] = "PlateSpells", -- 封印魔法
			},
		},
		cd = {
			[209410] = 1, -- 夜幕之球
			[209404] = 1, -- 封印魔法
		},
	},
	{--构造体卫兵
		id = 104270,
		alerts = {
			PlateAlert = {
				[209495] = "PlateSpells", -- 充能之击
				[225100] = "PlateSpells", -- 充能站	
				[209413] = "PlateSpells", -- 镇压	
			},
		},
		cd = {
			[209495] = 25, -- 充能之击
			[225100] = 9, -- 充能站	
			[209413] = 20, -- 镇压	
		},
	},
	{--被束缚的能量
		id = 105705,
		alerts = {
			PlateAlert = {
				[212031] = "PlateSpells", -- 充能冲击
			},
		},
		cd = {
			[212031] = 1, -- 充能冲击
		},
	},
	{--巡逻队长加多
		id = 104215,
		img = 1410975,
		alerts = {
			AlertIcon = {
				["1571_cast_no_207815"] = {}, -- 庄严静夜合剂
				["1571_cast_no_207261"] = {}, -- 共鸣挥砍
				["1571_cast_no_207806"] = {}, -- 发送信号
				["1571_cast_no_219488"] = {}, -- 清道夫	
				["1571_cast_no_207278"] = {}, -- 奥术锁定
				["1571_aura_no_207278"] = {"HARMFUL", "player"}, -- 奥术锁定
			},
		},
	},
	{--警惕的暮色卫队卫兵
		id = 104918,
		cd = {
			[215204] = 1, -- 遏止
		},
	},
	{--炽燃小鬼
		id = 104295,
		alerts = {
			PlateAlert = {
				[224375] = "PlateSpells", -- 游移余烬
				[224374] = "PlateSpells", -- 火焰箭
			},
		},
		cd = {
			[224375] = 1, -- 游移余烬
			[224374] = 1, -- 火焰箭
		},
	},
	{--警觉的审判者
		id = 105715,
		alerts = {
			AlertIcon = {
				["1571_cast_hl_211299"] = {}, -- 灼热凝视
				["1571_cast_hl_212784"] = {}, -- 眼球风暴
			},
			PlateAlert = {
				[211299] = "PlateSpells", -- 灼热凝视
				[212784] = "PlateSpells", -- 眼球风暴
			},
		},
		cd = {
			[211299] = 20, -- 灼热凝视
			[212784] = 20, -- 眼球风暴
		},
	},
	{--暗影女妖
		id = 104300,
		alerts = {
			AlertIcon = {
				["1571_aura_no_211473"] = {"HARMFUL", "player"}, -- 暗影鞭笞
				["1571_aura_no_211470"] = {"HARMFUL", "player"}, -- 蛊惑
			},
			PlateAlert = {
				[211473] = "PlateSpells", -- 暗影鞭笞
				[211470] = "PlateSpells", -- 蛊惑
			},
		},
		cd = {
			[211473] = 1, -- 暗影鞭笞
			[211470] = 1, -- 蛊惑
		},
	},
	{--军团猎犬
		id = 104277,
		alerts = {
			PlateAlert = {
				[211477] = "PlateAuras", -- 凶暴
				[211384] = "PlateSpells", -- 邪焰飞跃
			},
		},
		cd = {
			[211384] = 8, -- 邪焰飞跃
		},
	},
	{--邪缚执行者
		id = 104278,
		alerts = {
			AlertIcon = {
				["1571_aura_no_211464"] = {"HARMFUL", "player"}, -- 邪能引爆
			},
			PlateAlert = {
				[211464] = "PlateSpells", -- 邪能引爆
			},
		},
		cd = {
			[211464] = 12, -- 邪能引爆
		},
	},
	{--伊玛库塔
		id = 104275,
		alerts = {
			PlateAlert = {
				[209378] = "PlateSpells", -- 剑刃旋风
			},
		},
		cd = {
			[209378] = 17, -- 剑刃旋风
		},
	},
	{--警惕的巴尔戈
		id = 104274,
		alerts = {
			AlertIcon = {
				["1571_aura_no_207980"] = {"HARMFUL", "player"}, -- 衰变光束
				["1571_com_hl_207980"] = {}, -- 衰变光束
			},
			HLOnRaid = {
				["1571_207980_c"] = "HL_Casting", -- 衰变光束
			},
			PlateAlert = {
				[207980] = "PlateSpells", -- 衰变光束
			},
		},
		cd = {
			[207980] = 13, --衰变光束
		},
	},
	{--塔丽克萨·火冠
		id = 104217,
		img = 1410985,
		alerts = {
			AlertIcon = {
				["1571_cast_hl_207881"] = {}, -- 地狱喷发
				["1571_aura_no_207906"] = {"HELPFUL", "boss1"}, -- 强烈燃烧
				["1571_aura_no_208165"] = {"HARMFUL", "player"}, -- 枯萎灵魂
				["1571_cast_hl_208165"] = {}, -- 枯萎灵魂
			},
		},
	},
	{--地狱火小鬼
		id = 112668,
		alerts = {
			PlateAlert = {
				[211401] = "PlateSpells", -- 游移余烬
				[211406] = "PlateSpells", -- 火焰箭	
			},
		},
		cd = {
			[211401] = 1, -- 游移余烬
			[211406] = 1, -- 火焰箭	
		},
	},
	{--邪恶的格伦斯
		id = 107435,
		alerts = {
			AlertIcon = {
				["1571_aura_no_214690"] = {"HARMFUL", "player"}, -- 残废术	
				["1571_aura_no_214688"] = {"HARMFUL", "player"}, -- 腐臭蜂群
			},
			PlateAlert = {
				[214692] = "PlateSpells", -- 暗影箭雨
			},
		},
		cd = {
			[214692] = 20, -- 暗影箭雨
		},
	},
	{--顾问麦兰杜斯
		id = 104218,
		img = 1410933,
		alerts = {
			AlertIcon = {
				["1571_cast_hl_209676"] = {}, -- 切割漩涡
				["1571_cast_no_209602"] = {}, -- 剑刃奔涌
				["1571_cast_no_209628"] = {}, -- 穿刺风暴
				["1571_aura_no_224333"] = {"HARMFUL", "player"}, -- 包围之风
			},
		},
	},
}

G.Dungeons[707] = { -- 守望者地窟1
	{ -- 暗影猎手
		id = 98926,
		alerts = {
			AlertIcon = {
				["1493_aura_no_194588"] = {"HARMFUL", "player"}, -- 致命打击
			},
		},
	},
	{ -- 灌魔之怒
		id = 99956,
		alerts = {
			AlertIcon = {
				["1493_cast_hl_196796"] = {}, -- 邪能凝视
				["1493_cast_hl_196799"] = {}, -- 释放怒火
			},
			PlateAlert = {
				[196796] = "PlateSpells", -- 邪能凝视
				[196799] = "PlateSpells", -- 释放怒火
			},
		},
		cd = {
			[196796] = 1, -- 邪能凝视
			[196799] = 1, -- 释放怒火
		},
	},
	{ -- 魔誓寄生者
		id = 96587,
		alerts = {
			PlateAlert = {
				[193069] = "PlateSpells", -- 梦魇
				[191595] = "PlateSpells", -- 腐蚀
			},
		},
		cd = {
			[193069] = 1, -- 梦魇
			[191595] = 1, -- 腐蚀
		},
	},
	{ -- 格雷凡纳·裂魂
		id = 98177,
		alerts = {
			AlertIcon = {
				["1493_aura_no_193607"] = {"HARMFUL", "player"}, -- 二连击
			},	
			PlateAlert = {
				[193607] = "PlateSpells", -- 二连击
				[193609] = "PlateAuras", -- 献祭光环
			},
		},
		cd = {
			[193607] = 12, -- 二连击
		},
	},
	{ -- 魔誓侍从
		id = 98954,
		alerts = {
			AlertIcon = {
				["1493_aura_no_191743"] = {"HARMFUL", "player"}, -- 震耳尖啸
			},
			PlateAlert = {
				[191743] = "PlateSpells", -- 震耳尖啸
			},
		},
		cd = {
			[191743] = 1, -- 震耳尖啸
		},
	},
	{ -- 邪舌喷火者
		id = 96480,
		alerts = {
			PlateAlert = {
				[191678] = "PlateSpells", -- 燃烧的沥青
			},
		},
		cd = {
			[191678] = 1, -- 燃烧的沥青
		},
	},
	{ -- 提拉宋·萨瑟利尔
		id = 95885,
		img = 1410988,
		alerts = {
			AlertIcon = {
				["1493_aura_hl_191853"] = {"HARMFUL", "player"}, -- 狂怒火焰
				["1493_aura_no_204153"] = {"HELPFUL", "boss1"}, -- 黑暗能量
				["1493_cast_hl_191823"] = {}, -- 狂怒冲击
				["1493_cast_hl_191941"] = {}, -- 黑暗打击
				["1493_cast_no_204151"] = {}, -- 黑暗打击
				["1493_cast_no_202913"] = {}, -- 邪能岩弹
				["1493_cast_hl_190830"] = {}, -- 仇恨			
			},
		},
	},
	{ -- 邪能之怒
		id = 107101,
		alerts = {
			AlertIcon = {
				["1493_com_no_212541"] = {}, -- 灼烧
				["1493_cast_hl_212547"] = {}, -- 邪能散发
			},
			HLOnRaid = {
				["1493_212541_c"] = "HL_Casting", -- 灼烧
			},
		},
	},
	{ -- 炽燃小鬼
		id = 98963,
		alerts = {
			HLOnRaid = {
				["1493_194675_c"] = "HL_Casting", -- 火焰冲击
			},
			PlateAlert = {
				[194682] = "PlateSpells", -- 内爆
			},
		},
		cd = {
			[194682] = 1, -- 内爆
		},
	},
	{ -- 邪母
		id = 98533,
		alerts = {
			PlateAlert = {
				[194064] = "PlateSpells", -- 母亲的爱
			},
		},
		cd = {
			[194064] = 22, -- 母亲的爱
		},
	},
	{ -- 审判官托蒙托鲁姆
		id = 96015,
		img = 1410962,
		alerts = {
			AlertIcon = {
				["1493_aura_no_206303"] = {"HARMFUL", "player"}, -- 侵蚀灵魂
				["1493_cast_no_206303"] = {}, -- 侵蚀灵魂
			},
		},
	},
	{ -- 巨型石魁麟
		id = 99675,
		alerts = {
			AlertIcon = {
				["1493_aura_no_210136"] = {"HARMFUL", "player"}, -- 石化
			},
		},
	},
	{ -- 魔古山藏秘者
		id = 99676,
		alerts = {
			AlertIcon = {
				["1493_aura_no_203685"] = {"HARMFUL", "player"}, -- 石化血肉
			},
		},
	},
	{ -- 影月技师
		id = 99645,
		alerts = {
			AlertIcon = {
				["1493_cast_no_196157"] = {}, -- 投掷炸弹
				["1493_cast_no_196156"] = {}, -- 投掷近程炸弹
			},
		},
	},
	{ -- 影月术士
		id = 99704,
		alerts = {
			AlertIcon = {
				["1493_com_no_196206"] = {}, -- 暗影箭
				["1493_cast_hl_196208"] = {}, -- 腐蚀之种
				["1493_aura_no_13338"] = {"HARMFUL", "player"}, -- 语言诅咒
			},
			HLOnRaid = {
				["1493_196206_c"] = "HL_Casting", -- 暗影箭
			},
		},
	},
	{ -- 无面虚空法师
		id = 99651,
		alerts = {
			AlertIcon = {
				["1493_cast_no_199919"] = {}, -- 暗影冲撞目标
			},
		},
	},
	{ -- 疯狂的夺心者
		id = 99657,
		alerts = {
			AlertIcon = {
				["1493_aura_no_196508"] = {"HARMFUL", "player"}, -- 精神鞭笞
			},
		},
	},
	{ -- 虚空暴君
		id = 99655,
		alerts = {
			PlateAlert = {
				[26043] = "PlateAuras", -- 战斗怒吼
				[212561] = "PlateAuras", -- 激怒	
			},
		},
	},
	{ -- 纠缠腐蚀
		id = 99678,
		alerts = {
			AlertIcon = {
				["1493_aura_no_206019"] = {"HARMFUL", "player"}, -- 腐蚀之触
			},
		},
	},
	{ -- 恶毒污染者
		id = 102584,
		alerts = {
			AlertIcon = {
				["1493_aura_no_202658"] = {"HARMFUL", "player"}, -- 抽取
			},
		},
	},
	{ -- 恐惧魔王孟达休斯
		id = 99649,
		alerts = {
			AlertIcon = {
				["1493_auras_hl_196249"] = {"HARMFUL"}, -- 流星
			},
			PlateAlert = {
				[202728] = "PlateSpells", -- 召唤残酷卫士
				[196242] = "PlateSpells", -- 雷霆一击
			},
		},
		cd = {
			[202728] = 1, -- 召唤残酷卫士
			[196242] = 1, -- 雷霆一击
		},
	},	
	{ -- 残酷卫士
		id = 99728,
		alerts = {
			AlertIcon = {
				["1493_aura_no_16856"] = {"HARMFUL", "player"}, -- 致死打击
			},
			PlateAlert = {
				[199172] = "PlateSpells", -- 冲锋
			},
		},
		cd = {
			[199172] = 1,
		},
	},	
	{ -- 阿什高姆
		id = 95886,
		img = 1410937,
		alerts = {
			AlertIcon = {
				["1493_aura_no_192517"] = {"HELPFUL", "boss1"}, -- 脆弱
				["1493_aura_hl_192519"] = {"HARMFUL", "player"}, -- 熔岩
				["1493_aura_hl_215478"] = {"HARMFUL", "player"}, -- 焚烧殆尽
				["1493_cast_no_192631"] = {}, -- 岩浆之环
				["1493_cast_no_192621"] = {}, -- 火岩
				["1493_cast_no_192522"] = {}, -- 裂隙
				["1493_cast_hl_193209"] = {}, -- 闷烧
			},
		},
	},
	{ -- 余烬
		id = 99233,
		alerts = {
			AlertIcon = {
				["1493_com_no_195332"] = {}, -- 烧灼
				["1493_cast_no_195187"] = {}, -- 自爆
			},
			HLOnRaid = {
				["1493_195332_c"] = "HL_Casting", -- 烧灼
			},
		},
	},
	{ -- 邪能烧灼者
		id = 102583,
		alerts = {
			AlertIcon = {
				["1493_com_no_202661"] = {}, -- 炼狱冲击
			},
			HLOnRaid = {
				["1493_202661_c"] = "HL_Casting", -- 炼狱冲击
			},
			PlateAlert = {
				[202661] = "PlateSpells", -- 炼狱冲击
				[202663] = "PlateSpells", -- 自爆
			},
		},
		cd = {
			[202661] = 1, -- 炼狱冲击
			[202663] = 1, -- 自爆
		},
	},
	{ -- 刃舞者伊莲娜
		id = 96657,
		alerts = {
			AlertIcon = {
				["1493_com_no_193164"] = {}, -- 末日预言者的礼物
				["1493_aura_no_193164"] = {"HARMFUL", "player"}, -- 末日预言者的礼物
				["1493_com_no_191524"] = {}, -- 穿刺
				["1493_cast_hl_191527"] = {}, -- 震耳怒吼
			},
			HLOnRaid = {
				["1493_193164_c"] = "HL_Casting", -- 末日预言者的礼物
			},
		},
	},
	{ -- 格雷泽
		id = 95887,
		img = 1410952,
		alerts = {
			AlertIcon = {
				["1493_aura_no_195034"] = {"HELPFUL", "boss1"}, -- 辐射强度
				["1493_cast_no_193443"] = {}, -- 充能
				["1493_cast_hl_194942"] = {}, -- 纠缠凝视
				["1493_cast_hl_194849"] = {}, -- 脉冲
			},
			HLOnRaid = {
				["1493_194942_c"] = "HL_Casting", -- 纠缠凝视
			},
		},
	},
	{ -- 奴役者格里霍恩	
		id = 102566,
		alerts = {
			AlertIcon = {
				["1493_aura_no_202615"] = {"HARMFUL", "player"}, -- 折磨
				["1493_aura_hl_202608"] = {"HARMFUL", "player"}, --痛苦的灵魂
			},
			HLOnRaid = {
				["1493_202608_a"] = "HL_Auras", -- 痛苦的灵魂
			},
			PlateAlert = {
				[202615] = "PlateSpells", -- 折磨			
			},
		},
		cd = {
			[202615] = 15, -- 折磨
		},
	},
	{ -- 倒钩小蜘蛛
		id = 97677,
		alerts = {
			AlertIcon = {
				["1493_aura_no_193951"] = {"HARMFUL", "player"}, -- 倒钩喷吐
			},
		},
	},
	{ -- 复仇之魂
		id = 100364,
		alerts = {
			AlertIcon = {
				["1493_com_no_189469"] = {}, -- 回转踢
				["1493_com_no_214989"] = {}, -- 扫堂腿
				["1493_com_no_214988"] = {}, -- 投掷
			},
			HLOnRaid = {
				["1493_189469_c"] = "HL_Casting", -- 回转踢
				["1493_214989_c"] = "HL_Casting", -- 扫堂腿
				["1493_214988_c"] = "HL_Casting", -- 投掷
			},
			PlateAlert = {
				[189469] = "PlateSpells", -- 回转踢
				[214989] = "PlateSpells", -- 扫堂腿
				[214988] = "PlateSpells", -- 投掷				
			},
		},
		cd = {
			[189469] = 1, -- 回转踢
			[214989] = 1, -- 扫堂腿
			[214988] = 1, -- 投掷
		},
	},
	{ -- 阿兰纳丝蛛后
		id = 97678,
		alerts = {
			AlertIcon = {
				["1493_aura_no_193997"] = {"HARMFUL", "player"}, -- 拉拽
				["1493_aura_no_193969"] = {"HARMFUL", "player"}, -- 锐刺
			},
			PlateAlert = {
				[193997] = "PlateSpells", -- 拉拽
			},
		},
		cd = {
			[193997] = 1, -- 拉拽
		},
	},
	{ -- 科达娜·邪歌
		id = 95888,
		img = 1410942,
		alerts = {
			AlertIcon = {
				["1493_aura_no_213395"] = {"HARMFUL", "player"}, -- 侵蚀之影
				["1493_cast_no_213583"] = {}, -- 侵蚀之影
				["1493_cast_no_213576"] = {}, -- 侵蚀之影
				["1493_com_no_197250"] = {}, -- 回转踢
				["1493_com_no_197251"] = {}, -- 扫堂腿
				["1493_cast_no_197422"] = {}, -- 末日恶灵
				["1493_cast_hl_197333"] = {}, -- 邪能战刃
			},
		},
	},
	{ -- 暗影化身	
		id = 104293,
		alerts = {
			AlertIcon = {
				["1493_com_no_206459"] = {}, -- 暗影突击
			},
			HLOnRaid = {
				["1493_206459_c"] = "HL_Casting", -- 暗影突击
			},
			PlateAlert = {
				[206459] = "PlateSpells", -- 暗影突击			
			},
		},
		cd = {
			[206459] = 1, -- 暗影突击
		},
	},
} 

G.Dungeons[727] = { -- 噬魂之喉1
	{-- 海咒护魂者
		id = 97200,
		alerts = {
			AlertIcon = {
				["1492_aura_no_200208"] = {"HARMFUL", "player"}, -- 死水冲击
				["1492_com_no_195031"] = {}, -- 挑衅打击
			},
			PlateAlert = {
				[195036] = "PlateSpells", -- 挑衅打击
				[195031] = "PlateSpells", -- 挑衅打击
			},
		},
		cd = {
			[195036] = 1, -- 挑衅打击
			[195031] = 1, -- 挑衅打击
		},
	},
	{-- 被奴役的女武神
		id = 102104,
		alerts = {
			AlertIcon = {	
				["1492_aura_no_199061"] = {"HARMFUL", "player"}, -- 劈砍灵魂
				["1492_aura_no_198944"] = {"HARMFUL", "player"}, -- 穿甲	
			},		
			PlateAlert = {
				[199061] = "PlateSpells", -- 劈砍灵魂
				[198944] = "PlateSpells", -- 穿甲	
			},
		},
		cd = {
			[199061] = 1, -- 劈砍灵魂
			[198944] = 1, -- 穿甲	
		},
	},
	{-- 被诅咒的飞鹰
		id = 97163,
		alerts = {
			AlertIcon = {
				["1492_aura_no_199185"] = {"HARMFUL", "player"}, -- 野蛮撕咬
			},
		},
	},
	{-- 海咒奴隶
		id = 97043,
		alerts = {
			AlertIcon = {
				["1492_aura_no_194674"] = {"HARMFUL", "player"}, -- 带钩长矛
				["1492_com_no_194674"] = {}, -- 带钩长矛
			},
			HLOnRaid = {
				["1492_194674_c"] = "HL_Casting", -- 带钩长矛
			},
			PlateAlert = {
				[194674] = "PlateSpells", -- 带钩长矛
				[198752] = "PlateSpells", -- 破裂	
				[201567] = "PlateSpells", -- 漩涡污泥
			},
		},
		cd = {
			[194674] = 1, -- 带钩长矛
			[198752] = 1, -- 破裂	
			[201567] = 1, -- 漩涡污泥
		},
	},
	{-- 刻符者奴隶
		id = 102375,
		alerts = {
			AlertIcon = {
				["1492_com_no_202365"] = {}, -- 火焰冲击
			},
			HLOnRaid = {
				["1492_202365_c"] = "HL_Casting", -- 火焰冲击
			},
			PlateAlert = {
				[202365] = "PlateSpells", -- 火焰冲击
				[202408] = "PlateSpells", -- 照明弹
			},
		},
		cd = {
			[202365] = 20, -- 火焰冲击
			[202408] = 20, -- 照明弹	
		},
	},
	{-- 堕落君王伊米隆
		id = 96756,
		img = 1410995,
		alerts = {
			AlertIcon = {
				["1492_cast_hl_193211"] = {}, -- 黑暗鞭笞
				["1492_cast_hl_193364"] = {}, -- 亡者嚎叫
				["1492_cast_no_193977"] = {}, -- 北地冰风
				["1492_cast_hl_193460"] = {}, -- 灾祸	
				["1492_cast_no_193566"] = {}, -- 亡者复生
			},
		},
	},
	{-- 复活的战士
		id = 98246,
		alerts = {
			PlateAlert = {
				[98246] = "PlateAuras", -- 精力
			},
		},
	},
	{-- 海咒快刀手
		id = 98919,
		alerts = {
			PlateAlert = {
				[199250] = "PlateAuras", -- 狡诈打击
				[194615] = "PlateAuras", -- 深谙水性
			},
		},
	},
	{-- 海咒雾疗师
		id = 97365,
		alerts = {
			PlateAlert = {
				[199514] = "PlateSpells", -- 灵魂激流
				[194610] = "PlateSpells", -- 隐蔽之箭
			},
		},
		cd = {
			[199514] = 15, -- 灵魂激流
			[194610] = 1, -- 隐蔽之箭
		},
	},
	{-- 浸水的灵魂卫士
		id = 99188,
		alerts = {
			AlertIcon = {	
				["1492_aura_no_194640"] = {"HARMFUL", "player"}, -- 希望诅咒
				["1492_aura_hl_194657"] = {"HARMFUL", "player"}, -- 灵魂虹吸
				["1492_com_no_194442"] = {}, -- 六磅的火药桶
			},
			HLOnRaid = {
				["1492_194657_c"] = "HL_Casting", -- 灵魂虹吸
			},
			PlateAlert = {
				[194442] = "PlateSpells", -- 六磅的火药桶
				[194657] = "PlateSpells", -- 灵魂虹吸
			},
		},
		cd = {
			[194442] = 1, -- 六磅的火药桶
			[194657] = 1, -- 灵魂虹吸
		},
	},
	{-- 迷雾猎犬
		id = 97119,
		alerts = {
			PlateAlert = {
				[194506] = "PlateSpells", -- 隐蔽打击
			},
		},
		cd = {
			[194506] = 5, -- 隐蔽打击
		},
	},
	{-- 守夜水手	
		id = 97182,
		alerts = {
			AlertIcon = {
				["1492_cast_hl_192019"] = {}, -- 黑暗提灯
			},
			PlateAlert = {
				[192019] = "PlateSpells", -- 黑暗提灯
				[192019] = "PlateAuras", -- 黑暗提灯
			},
		},
		cd = {
			[192019] = 16, -- 黑暗提灯
		},
	},
	{-- 污泥行者	
		id = 97185,
		alerts = {
			AlertIcon = {
				["1492_aura_no_194102"] = {"HARMFUL", "player"}, -- 剧毒淤泥
			},
			PlateAlert = {
				[194099] = "PlateSpells", -- 怨毒吐息
			},
		},
		cd = {
			[194099] = 1, -- 怨毒吐息
		},
	},
	{-- 海拉加尔勇士
		id = 97097,
		alerts = {
			AlertIcon = {
				["1492_cast_hl_198405"] = {}, -- 刺骨尖叫
			},
			PlateAlert = {
				[198405] = "PlateSpells", -- 刺骨尖叫
				[194663] = "PlateAuras", -- 幽灵怒火
			},
		},
		cd = {
			[198405] = 1, -- 刺骨尖叫
		},
	},
	{-- 哈布隆
		id = 96754,
		img = 1410956,
		alerts = {
			AlertIcon = {
				["1492_cast_hl_194325"] = {}, -- 破碎	
				["1492_cast_hl_194216"] = {}, -- 空间之镰		
				["1492_cast_hl_194668"] = {}, -- 虚空撕裂		
				["1492_cast_no_194231"] = {}, -- 召唤被禁锢的仆从
			},
			HLOnRaid = {
				["1492_194325_c"] = "HL_Casting", -- 破碎
			},
		},
	},
	{-- 被禁锢的仆从
		id = 98693,
		alerts = {
			AlertIcon = {
				["1492_cast_hl_194266"] = {}, -- 虚空裂痕
			},
		},
	},
	{-- 海拉加尔召雾者	
		id = 99033,
		alerts = {
			PlateAlert = {
				[216197] = "PlateSpells", -- 涌动之水
				[199589] = "PlateSpells", -- 灵魂漩涡
				[192016] = "PlateAuras", -- 专注之罩
			},
		},
		cd = {
			[216197] = 30, -- 涌动之水
			[199589] = 26, -- 灵魂漩涡
			[194610] = 1, -- 隐蔽之箭
		},
	},
	{-- 斯卡加尔	
		id = 99307,
		alerts = {
			AlertIcon = {
				["1492_aura_no_195279"] = {"HARMFUL", "player"}, -- 缚灵
				["1492_cast_hl_196885"] = {}, -- 绝不留情
				["1492_cast_hl_195293"] = {}, -- 衰弱怒吼
			},
			PlateAlert = {
				[196885] = "PlateSpells", -- 绝不留情
				[195293] = "PlateSpells", -- 衰弱怒吼
			},
		},
		cd = {
			[196885] = 8, -- 绝不留情
			[195293] = 12, -- 衰弱怒吼
		},
	},
	{-- 骷髅巫师
		id = 114289,
		alerts = {
			HLOnRaid = {
				["1492_198407_c"] = "HL_Casting", -- 死灵箭
			},
		},
	},
	{-- 骷髅战士
		id = 114288,
		alerts = {			
			AlertIcon = {
				["1492_aura_no_198374"] = {"HARMFUL", "player"}, -- 断筋
			},
		},
	},
	{-- 海拉	
		id = 96759,
		img = 1410957,
		alerts = {
			AlertIcon = {
				["1492_aura_no_197262"] = {"HARMFUL", "player"}, -- 海洋污染
				["1492_cast_no_197262"] = {}, -- 海洋污染
				["1492_cast_hl_202088"] = {}, -- 死水弹幕
				["1492_cast_hl_227233"] = {}, -- 腐化咆哮
				["1492_cast_no_196947"] = {}, -- 下潜
				["1492_cast_hl_198495"] = {}, -- 洪流
				["1492_cast_no_198520"] = {}, -- 飞翼打击
			},
		},
	},
	{-- 尖锐触须
		id = 100188,
		alerts = {
			AlertIcon = {
				["1492_cast_hl_197117"] = {}, -- 尖锐触须
			},
		},
	},
	{-- 毁灭触须		
		id = 99801,
		alerts = {
			AlertIcon = {
				["1492_aura_no_185539"] = {"HARMFUL", "player"}, -- 迅捷割裂
				["1492_cast_hl_196534"] = {}, -- 重击
			},
		},
	},
}

G.Dungeons[900] = { -- 永夜大教堂1
	{ -- 恶魔卫士毁灭者
		id = 119952,
		alerts = {
			PlateAlert = {
				[241598] = "PlateSpells", -- 暗影墙
			},
		},
		cd = {
			[241598] = 1, -- 暗影墙
		},
	},
	{ -- 愤怒卫士入侵者
		id = 120550,
		alerts = {
			AlertIcon = {
				["1677_com_hl_236737"] = {}, -- 邪能打击
			},
			HLOnRaid = {
				["1677_236737_c"] = "HL_Casting", -- 邪能打击
			},
			PlateAlert = {
				[236737] = "PlateSpells", -- 邪能打击
			},
		},
		cd = {
			[236737] = 1, -- 邪能打击
		},
	},
	{ -- 鬼火慰魂者    
		id = 119923,
		alerts = {
			HLOnRaid = {
				["1677_237578_c"] = "HL_Casting", -- 邪能箭	
			},
			PlateAlert = {
				[238543] = "PlateSpells", -- 恶魔愈合
				[237578] = "PlateSpells", -- 邪能箭
			},
		},
		cd = {
			[238543] = 1, -- 恶魔愈合
			[237578] = 1, -- 邪能箭		
		},
	},
	{ -- 鬼火邪能使者  
		id = 118724,
		alerts = {
			AlertIcon = {
				["1677_aura_no_237583"] = {"HARMFUL", "player"}, -- 炽燃之速
			},
			PlateAlert = {
				[237599] = "PlateSpells", -- 毁灭横扫
			},
		},
		cd = {
			[237599] = 1, -- 毁灭横扫	
		},
	},
	{ -- 邪疫猎犬      
		id = 118700,
		alerts = {
			PlateAlert = {
				[238583] = "PlateSpells", -- 吞噬魔法
				[236740] = "PlateSpells", -- 暗影之牙
			},
		},
		cd = {
			[238583] = 1, -- 吞噬魔法
			[236740] = 13, -- 暗影之牙
		},
	},
	{ -- 杜尔扎克     
		id = 118704,
		alerts = {
			AlertIcon = {
				["1677_cast_hl_238653"] = {}, -- 暗影波
			},
			PlateAlert = {
				[238653] = "PlateSpells", -- 暗影波
			},
		},
		cd = {
			[238653] = 20, -- 暗影波
		},
	},
	{ -- 恶魔卫士毁灭者
		id = 120374,
		cd = {
			[241598] = 1, -- 暗影墙
		},
	},
	{ -- 愤怒卫士入侵者
		id = 118690,
		cd = {
			[236737] = 1, -- 邪能打击
		},
	},
	{ -- 恐翼蝠        
		id = 120556,
		cd = {
			[239558] = 1, -- 暗影横扫
		},
	},
	{ -- 恐翼蝠        
		id = 119930,
		cd = {
			[239558] = 1, -- 暗影横扫
		},
	},
	{ -- 恐怖猎手      
		id = 121553,
		alerts = {
			AlertIcon = {
				["1677_cast_hl_242724"] = {}, -- 恐怖嚎叫			
			},
			PlateAlert = {
				[242724] = "PlateSpells", -- 恐怖嚎叫
				[239558] = "PlateSpells", -- 暗影横扫
			},
		},
		cd = {
			[242724] = 20, -- 恐怖嚎叫
			[239558] = 1, -- 暗影横扫
		},
	},
	{ -- 鬼焰女妖      
		id = 118714,
		alerts = {
			AlertIcon = {
				["1677_aura_no_238991"] = {"HARMFUL", "player"}, -- 倒刺荆棘
				["1677_aura_no_237391"] = {"HARMFUL", "player"}, -- 诱惑香氛
			},
		},
	},
	{ -- 邪皮行者      
		id = 121569,
		alerts = {
			AlertIcon = {
				["1677_cast_hl_242760"] = {}, -- 实木冲击
			},
			PlateAlert = {
				[242760] = "PlateSpells", -- 实木冲击
				[242772] = "PlateSpells", -- 邪恶根须
			},
		},
		cd = {
			[242760] = 18, -- 实木冲击
			[242772] = 1, -- 邪恶根须
		},
	},
	{ -- 邪脉植物学家  
		id = 118703,
		alerts = {
			PlateAlert = {
				[237565] = "PlateSpells", -- 灼烧之雨
			},
		},
		cd = {
			[237578] = 1, -- 邪能箭
			[237565] = 1, -- 灼烧之雨	
		},
	},
	{ -- 绞藤鞭笞者    
		id = 119977,
		alerts = {
			AlertIcon = {
				["1677_com_hl_238688"] = {}, -- 窒息藤蔓
				["1677_aura_hl_238688"] = {"HARMFUL", "player"}, -- 窒息藤蔓
			},
		},
	},
	{ -- 狂暴的鞭笞者  
		id = 119978,
		alerts = {
			AlertIcon = {
				["1677_aura_hl_238674"] = {"HARMFUL", "player"}, -- 锁定
			},
			PlateAlert = {
				[238674] = "PlateSpells", -- 锁定
			},
		},
		cd = {
			[238674] = 1, -- 锁定
		},
	},
	{ -- 多汁的鞭笞者  
		id = 119144,
		alerts = {
			AlertIcon = {
				["1677_aura_no_240065"] = {"HARMFUL", "player"}, -- 多汁激素
			},
		},
	},
	{ -- 阿格洛诺克斯  
		id = 117193,
		img = 1579930,
		alerts = {
			AlertIcon = {
				["1677_aura_no_236524"] = {"HARMFUL", "player"}, -- 毒性孢子
				["1677_cast_no_236639"] = {}, -- 多汁的鞭笞者
				["1677_cast_no_236527"] = {}, -- 狂暴的鞭笞者				
				["1677_com_hl_235751"] = {}, -- 丛林猛击
			},
		},
	},
	{ -- 狂暴的鞭笞者  
		id = 119169,
		alerts = {
			PlateAlert = {
				[243613] = "PlateSpells", -- 锁定
			},
		},
		cd = {
			[243613] = 1, -- 锁定
		},
	},
	{ -- 虫语清道夫   
		id = 118719,
		alerts = {
			PlateAlert = {
				[242839] = "PlateSpells", -- 投掷冰霜宝典
				[242837] = "PlateSpells", -- 投掷奥术宝典
				[242841] = "PlateSpells", -- 投掷沉默宝典
			},
		},
		cd = {
			[242839] = 1, -- 投掷冰霜宝典
			[242837] = 1, -- 投掷奥术宝典
			[242841] = 1, -- 投掷沉默宝典
		},
	},
	{ -- 永默之书     
		id = 120727,
		alerts = {
			AlertIcon = {
				["1677_aura_no_239161"] = {"HARMFUL", "player"}, -- 永默之书
			},
		},
	},
	{ -- 永冬之书     
		id = 118718,
		alerts = {
			AlertIcon = {
				["1677_aura_no_239156"] = {"HARMFUL", "player"}, -- 永冬之书
			},
		},
	},
	{ -- 奥术畸体之书  
		id = 120646,
		alerts = {
			PlateAlert = {
				[243107] = "PlateSpells", -- 召唤畸体
			},
		},
		cd = {
			[243107] = 1, -- 召唤畸体
		},
	},
	{ -- 加泽拉克斯    
		id = 118723,
		alerts = {
			AlertIcon = {
				["1677_cast_hl_239232"] = {}, -- 眩目闪光
				["1677_cast_hl_239235"] = {}, -- 聚焦毁灭				
			},
			PlateAlert = {
				[239232] = "PlateSpells", -- 眩目闪光
				[239235] = "PlateSpells", -- 聚焦毁灭
				[239201] = "PlateSpells", -- 邪能眩光
				[239235] = "PlateAuras", -- 聚焦毁灭
			},
		},
		cd = {
			[239232] = 30, -- 眩目闪光
			[239235] = 30, -- 聚焦毁灭
			[239201] = 8, -- 邪能眩光
		},
	},
	{ -- 轻蔑的萨什比特
		id = 117194,
		img = 1579942,
		alerts = {
			AlertIcon = {
				["1677_cast_no_237276"] = {}, -- 粉碎之击
				["1677_com_hl_237726"] = {}, -- 轻蔑凝视
			},
		},
	},
	{ -- 活体小说书籍  
		id = 121384,
		alerts = {
			AlertIcon = {
				["1677_aura_no_238480"] = {"HARMFUL", "player"}, -- 镣铐书籍
			},
		},
	},
	{ -- 活体讽刺书籍  
		id = 121364,
		alerts = {
			AlertIcon = {
				["1677_cast_no_238678"] = {}, -- 压制讥讽
			},
		},
	},
	{ -- 活体传记书籍  
		id = 121329,
		alerts = {
			AlertIcon = {
				["1677_aura_no_238484"] = {"HARMFUL", "player"}, -- 假造的传记
			},
		},
	},
	{ -- 邪足执行者    
		id = 118712,
		alerts = {
			AlertIcon = {
				["1677_com_no_236975"] = {}, -- 锯齿顺劈
				["1677_aura_no_236975"] = {"HARMFUL", "player"}, -- 锯齿顺劈
			},
			PlateAlert = {
				[236975] = "PlateSpells", -- 锯齿顺劈
			},
		},
		cd = {
			[236975] = 1, -- 锯齿顺劈
		},
	},
	{ -- 邪足晶球法师  
		id = 118713,
		alerts = {
			AlertIcon = {
				["1677_cast_no_239320"] = {}, -- 邪焰之球
			},
			PlateAlert = {
				[239288] = "PlateSpells", -- 燃烧的绳索	
				[239320] = "PlateSpells", -- 邪焰之球		
			},
		},
		cd = {
			[239288] = 1, -- 燃烧的绳索	
			[239320] = 1, -- 邪焰之球	
			[237578] = 1, -- 邪能箭		
		},
	},
	{ -- 纳尔莎        
		id = 118705,
		alerts = {
			AlertIcon = {
				["1677_cast_hl_237394"] = {}, -- 消失
			},
			PlateAlert = {
				[239266] = "PlateSpells", -- 毒性风暴
				[237394] = "PlateSpells", -- 消失	
				[239052] = "PlateSpells", -- 蜘蛛呼唤
			},
		},
		cd = {
			[239266] = 1, -- 毒性风暴
			[237394] = 28, -- 消失	
			[239052] = 1, -- 蜘蛛呼唤
		},
	},
	{ -- 死疽小蜘蛛    
		id = 120016,
		alerts = {
			AlertIcon = {
				["1677_aura_no_236954"] = {"HARMFUL", "player"}, -- 邪恶利齿
			},
		},
	},
	{ -- 多玛塔克斯    
		id = 118804,
		img = 1579931,
		alerts = {
			AlertIcon = {
				["1677_aura_no_238410"] = {"HARMFUL", "player"}, -- 阿格拉玛之盾
				["1677_cast_no_236543"] = {}, -- 邪魂顺劈
				["1677_aura_no_243157"] = {"HELPFUL", "boss1"}, -- 狂乱
				["1677_cast_hl_234107"] = {}, -- 混沌能量
			},
		},
	},
	{ -- 小鬼          
		id = 118801,
		alerts = {
			PlateAlert = {
				[238489] = "PlateSpells", -- 邪能冲击
			},
		},
		cd = {
			[238489] = 1, -- 邪能冲击
		},
	},
	{ -- 鬼焰魔女     
		id = 118802,
		alerts = {
			PlateAlert = {
				[238315] = "PlateSpells", -- 暗影清扫
			},
		},
		cd = {
			[238315] = 1, -- 暗影清扫
		},
	},
	{ -- 孟菲斯托斯    
		id = 116944,
		img = 1579938,
		alerts = {
			AlertIcon = {
				["1677_aura_no_234817"] = {"HARMFUL", "player"}, -- 黑暗孤寂
				["1677_aura_no_233206"] = {"HELPFUL", "boss1"}, -- 暗影消退
				["1677_cast_no_233155"] = {}, -- 腐臭蜂群
				["1677_cast_no_233196"] = {}, -- 恶魔突起
				["1677_cast_no_234817"] = {}, -- 黑暗孤寂
				["1677_cast_no_233206"] = {}, -- 暗影消退
			},
		},
	},
	{ -- 恐翼蝠       
		id = 120405,
		cd = {
			[239558] = 1, -- 暗影横扫
		},
	},
	{ -- 恐翼蝠        
		id = 118642,
		alerts = {
			PlateAlert = {
				[239525] = "PlateSpells", -- 邪能炽燃
			},
		},
		cd = {
			[239525] = 1, -- 邪能炽燃
		},
	},
}

G.Dungeons[721] = { -- 英灵殿1
	{ -- 瓦拉加尔勇士	
		id = 97087,
		alerts = {
			PlateAlert = {
				[199772] = "PlateSpells", -- 强力一击
			},
		},
		cd = {
			[199772] = 1, -- 强力一击	
		},
	},
	{ -- 瓦拉加尔唤雷者
		id = 95842,
		alerts = {
			AlertIcon = {
				["1477_aura_hl_215430"] = {"HARMFUL", "player"}, -- 雷霆打击
				["1477_com_hl_198595"] = {}, -- 雷霆飞弹	
			},
			HLOnRaid = {
				["1477_198595_c"] = "HL_Casting", -- 雷霆飞弹	
			},
			PlateAlert = {
				[198595] = "PlateSpells", -- 雷霆飞弹	
			},
		},
		cd = {
			[198595] = 1, -- 雷霆飞弹
		},
	},
	{ -- 风暴幼龙	
		id = 97788,
		alerts = {
			PlateAlert = {
				[198892] = "PlateSpells", -- 爆裂风暴
				[198888] = "PlateSpells", -- 闪电吐息
			},
		},
		cd = {
			[198892] = 10, -- 爆裂风暴
			[198888] = 16, -- 闪电吐息
		},
	},
	{ -- 海姆达尔	
		id = 94960,
		img = 1410958,
		alerts = {
			AlertIcon = {
				["1477_aura_no_193092"] = {"HARMFUL", "player"}, -- 放血扫击
				["1477_cast_no_193092"] = {}, -- 放血扫击
				["1477_com_no_193235"] = {}, --舞动之刃
				["1477_cast_hl_191284"] = {}, -- 勇气号角
				["1477_cast_no_188404"] = {}, -- 风暴吐息
			},
		},
	},
	{ -- 雷铸斥候	
		id = 96574,
		alerts = {
			AlertIcon = {
				["1477_com_hl_199805"] = {}, -- 连环爆裂
			},
			PlateAlert = {
				[215435] = "PlateAuras", -- 哨兵的守护	
				[198745] = "PlateAuras", -- 保护之光	
				[210875] = "PlateSpells", -- 充能脉冲
				[199805] = "PlateSpells", -- 连环爆裂
			},
		},
		cd = {
			[210875] = 20, -- 充能脉冲
			[199805] = 1, -- 连环爆裂
		},
	},
	{ -- 瓦拉加尔秘法师	
		id = 95834,
		alerts = {
			PlateAlert = {
				[215433] = "PlateSpells", -- 圣光普照
				[198934] = "PlateSpells", -- 治疗符文
			},
		},
		cd = {
			[215433] = 20, -- 圣光普照
			[198934] = 20, -- 治疗符文
		},
	},
	{ -- 瓦拉加尔刻符者	
		id = 96664,
		alerts = {
			AlertIcon = {
				["1477_com_hl_198962"] = {}, -- 破碎符文
				["1477_com_hl_198959"] = {}, -- 蚀刻	

			},
			HLOnRaid = {
				["1477_198962_c"] = "HL_Casting", -- 破碎符文
				["1477_198959_c"] = "HL_Casting", -- 蚀刻	
			},
			PlateAlert = {
				[198962] = "PlateSpells", -- 破碎符文
				[198959] = "PlateSpells", -- 蚀刻	
			},
		},
		cd = {
			[198962] = 1, -- 破碎符文
			[198959] = 1, -- 蚀刻	
		},
	},
	{ -- 瓦拉加尔神射手	
		id = 96640,
		alerts = {
			AlertIcon = {
				["1477_cast_hl_199210"] = {}, -- 穿透射击
			},
			PlateAlert = {
				[191401] = "PlateSpells", -- 急促射击
				[199210] = "PlateSpells", -- 穿透射击
			},
		},
		cd = {
			[191401] = 1, -- 急促射击
			[199210] = 1, -- 穿透射击
		},
	},
	{ -- 瓦拉加尔女武神	
		id = 95832,
		alerts = {
			AlertIcon = {
				["1477_aura_no_198944"] = {"HARMFUL", "player"}, -- 穿甲
			},
			PlateAlert = {
				[199050] = "PlateSpells", -- 致死劈砍
			},
		},
		cd = {
			[199050] = 1, -- 致死劈砍
		},
	},
	{ -- 瓦拉加尔净化者	
		id = 97197,
		alerts = {
			PlateAlert = {
				[192563] = "PlateSpells", -- 净化烈焰
			},
		},
		cd = {
			[192563] = 1, -- 净化烈焰
		},
	},
	{ -- 索斯坦	
		id = 97219,
		alerts = {
			PlateAlert = {
				[200901] = "PlateSpells", -- 风暴之眼	
				[200901] = "PlateAuras", -- 风暴之眼
			},
		},
		cd = {
			[200901] = 1, -- 风暴之眼
		},
	},
	{ -- 启迪者奥米尔	
		id = 97202,
		alerts = {
			PlateAlert = {
				[192158] = "PlateSpells", -- 圣洁庇护	
				[192158] = "PlateAuras", -- 圣洁庇护	
				[192288] = "PlateSpells", -- 灼热之光
			},
		},
		cd = {
			[192158] = 1, -- 圣洁庇护
			[192288] = 1, -- 灼热之光
		},
	},
	{ -- 赫娅	
		id = 95833,
		img = 1410959,
		alerts = {
			AlertIcon = {
				["1477_aura_no_192133"] = {"HARMFUL", "boss1"}, -- 秘法师加护：光
				["1477_aura_no_192132"] = {"HARMFUL", "boss1"}, -- 秘法师加护：雷
				["1477_aura_no_200901"] = {"HELPFUL", "boss1"}, -- 风暴之眼
				["1477_aura_no_192307"] = {"HELPFUL", "boss1"}, -- 圣洁庇护
				["1477_cast_no_192018"] = {}, -- 光明之盾
				["1477_com_hl_191976"] = {}, -- 弧光箭
				["1477_cast_hl_200901"] = {}, -- 风暴之眼
				["1477_aura_hl_192044"] = {"HARMFUL", "player"}, -- 驱逐之光
				["1477_cast_hl_192307"] = {}, -- 圣洁庇护
				
			},
			HLOnRaid = {
				["1477_191976_c"] = "HL_Casting", -- 弧光箭
			},
		},
	},
	{ -- 怒蹄公牛	
		id = 96611,	
		alerts = {
			PlateAlert = {
				[199090] = "PlateSpells", -- 低沉践踏	
				[199151] = "PlateSpells", -- 穿刺之角
			},
		},
		cd = {
			[199090] = 1, -- 低沉践踏
			[199151] = 1, -- 穿刺之角
		},
	},
	{ -- 瓦拉加尔捕兽者	
		id = 96934,
		alerts = {
			PlateAlert = {
				[199361] = "PlateSpells", -- 快速劈砍
				[199341] = "PlateSpells", -- 捕熊陷阱
			},
		},
		cd = {
			[199361] = 1, -- 快速劈砍
			[199341] = 1, -- 捕熊陷阱
		},
	},
	{ -- 黑爪座狼	
		id = 96608,
		alerts = {
			PlateAlert = {
				[199179] = "PlateSpells", -- 直取敌喉
			},
		},
		cd = {
			[199179] = 10, -- 直取敌喉
		},
	},
	{ -- 芬雷尔	
		id = 95674,
		img = 1410949,
		alerts = {
			AlertIcon = {
				["1477_aura_no_197558"] = {"HARMFUL", "player"}, -- 掠食飞扑
				["1477_aura_hl_196838"] = {"HARMFUL", "player"}, -- 血之气息
				["1477_cast_hl_197558"] = {}, -- 掠食飞扑
				["1477_cast_hl_196543"] = {}, -- 挫志嚎叫
				["1477_cast_hl_196838"] = {}, -- 血之气息
			},
		},
	},
	{ -- 布约恩国王	
		id = 97081,
		alerts = {
			AlertIcon = {
				["1477_aura_no_199652"] = {"HARMFUL", "player"}, -- 撕裂
				["1477_com_hl_199674"] = {}, -- 邪恶短匕

			},
			HLOnRaid = {
				["1477_199674_c"] = "HL_Casting", -- 邪恶短匕
			},
			PlateAlert = {
				[199674] = "PlateSpells", -- 邪恶短匕
				[199726] = "PlateSpells", -- 蛮横怒吼
				[200969] = "PlateSpells", -- 召唤先祖
			},
		},
		cd = {
			[199674] = 1, -- 邪恶短匕
			[199726] = 1, -- 蛮横怒吼
			[200969] = 1, -- 召唤先祖
		},
	},
	{ -- 托尔国王	
		id = 97084,
		cd = {
			[199674] = 1, -- 邪恶短匕
			[199726] = 1, -- 蛮横怒吼
			[200969] = 1, -- 召唤先祖
		},
	},
	{ -- 拉努夫国王	
		id = 97083,
		cd = {
			[199674] = 1, -- 邪恶短匕
			[199726] = 1, -- 蛮横怒吼
			[200969] = 1, -- 召唤先祖
		},
	},
	{ -- 赫尔多国王	
		id = 95843,
		cd = {
			[199674] = 1, -- 邪恶短匕
			[199726] = 1, -- 蛮横怒吼
			[200969] = 1, -- 召唤先祖
		},
	},
	{ -- 神王斯科瓦尔德	
		id = 95675,
		img = 1410953,
		alerts = {
			AlertIcon = {
				["1477_aura_no_193743"] = {"HARMFUL", "player"}, -- 阿格拉玛之盾
				["1477_aura_no_193686"] = {"HARMFUL", "player"}, -- 错乱伤痕
				["1477_aura_no_193702"] = {"HARMFUL", "player"}, -- 地狱火焰
				["1477_aura_no_193826"] = {"HELPFUL", "boss1"}, -- 诸神黄昏
				["1477_cast_hl_197961"] = {}, -- 诸神黄昏
				["1477_cast_hl_193659"] = {}, -- 邪炽冲刺
				["1477_com_hl_193659"] = {}, -- 邪炽冲刺
				["1477_com_no_193668"] = {}, -- 狂野之剑
			},
			HLOnRaid = {
				["1477_193659_c"] = "HL_Casting", -- 邪炽冲刺
			},
		},
	},
	{ -- 奥丁	
		id = 95676,
		img = 1410974,
		alerts = {
			AlertIcon = {
				["1477_cast_no_201215"] = {}, -- 召唤雷铸毁灭者
				["1477_cast_no_198077"] = {}, -- 击碎长枪
				["1477_cast_no_197961"] = {}, -- 符文烙印
				["1477_aura_hl_197961"] = {"HARMFUL", "player"}, -- 符文烙印
				["1477_aura_no_197996"] = {"HARMFUL", "player"}, -- 烙印
				["1477_cast_no_198263"] = {}, -- 明光风暴
			},
		},
	},
	{ -- 雷铸毁灭者	
		id = 102019,
		alerts = {
			AlertIcon = {
				["1477_cast_hl_198750"] = {}, -- 电涌		
			},
		},
	},
}

G.Dungeons[767] = { -- 奈萨里奥的巢穴1
	{ -- 喷油潜伏者
		id = 91001,
		alerts = {
			PlateAlert = {
				[183465] = "PlateSpells", -- 粘性胆汁
			},
		},
		cd = {
			[183465] = 1, -- 粘性胆汁
		},
	},
	{ -- 枯碎蜘蛛
		id = 97720,
		alerts = {
			AlertIcon = {
				["1458_aura_no_192800"] = {"HARMFUL", "player"}, -- 窒息之尘
			},
		},
	},
	{ -- 邪裂巨人
		id = 91000,
		alerts = {
			AlertIcon = {
				["1458_aura_no_226296"] = {"HARMFUL", "player"}, -- 穿刺碎片
			},
			PlateAlert = {
				[193505] = "PlateSpells", -- 碎地	
				[226296] = "PlateSpells", -- 穿刺碎片
			},
		},
		cd = {
			[193505] = 1, -- 碎地	
			[226296] = 1, -- 穿刺碎片
		},
	},
	{ -- 邪裂巨人
		id = 101438,
		alerts = {
			PlateAlert = {
				[226287] = "PlateSpells", -- 碾碎
			},
		},
		cd = {
			[226287] = 1, -- 碾碎
		},
	},
	{ -- 洛克莫拉
		id = 91003,
		img = 1410976,
		alerts = {
			AlertIcon = {
				["1458_aura_no_215898"] = {"HARMFUL", "player"}, -- 晶化大地
				["1458_cast_no_188169"] = {}, -- 剃刀碎片
				["1458_cast_no_188114"] = {}, -- 碎裂
			},
		},
	},	
	{ -- 石爪猎手
		id = 91332,
		cd = {
			[226347] = 1, -- 碎石	
		},
	},
	{ -- 巨石破坏者
		id = 90997,
		alerts = {
			AlertIcon = {
				["1458_cast_no_183088"] = {}, -- 山崩
			},
			PlateAlert = {
				[183088] = "PlateSpells", -- 山崩
			},
		},
		cd = {
			[183088] = 7, -- 山崩
		},
	},
	{ -- 巨石破坏者
		id = 92612,
		cd = {
			[183088] = 7, -- 山崩
		},
	},	
	{ -- 枯碎塑造者
		id = 90998,
		alerts = {
			AlertIcon = {
				["1458_com_no_186269"] = {}, -- 岩石箭
			},
			HLOnRaid = {
				["1458_186269_c"] = "HL_Casting", -- 岩石箭
			},
			PlateAlert = {
				[186269] = "PlateSpells", -- 岩石箭
				[202108] = "PlateSpells", -- 石化图腾
			},
		},
		cd = {
			[186269] = 1, -- 岩石箭
			[202108] = 1, -- 石化图腾
		},
	},		
	{ -- 燃烧晶簇
		id = 101437,
		alerts = {
			PlateAlert = {
				[202075] = "PlateSpells", -- 灼烧
			},
		},
		cd = {
			[202075] = 1, -- 灼烧
		},
	},
	{ -- 缚石剥皮者
		id = 91008,
		alerts = {
			PlateAlert = {
				[183633] = "PlateSpells", -- 锯齿圆盘
			},
		},
		cd = {
			[183633] = 1, -- 锯齿圆盘
		},
	},
	{ -- 乌拉罗格·塑山
		id = 91004,
		img = 1410990,
		alerts = {
			AlertIcon = {
				["1458_cast_no_193375"] = {}, -- 深渊的轰鸣
				["1458_cast_no_198428"] = {}, -- 山峦之击
				["1458_cast_no_198496"] = {}, -- 破甲
			},
		},
	},
	{ -- 喷油蛆虫
		id = 92538,
		alerts = {
			PlateAlert = {
				[193803] = "PlateSpells", -- 致命变形
			},
		},
		cd = {
			[193803] = 1, -- 致命变形
		},
	},	
	{ -- 石爪虫王
		id = 102404,
		alerts = {
			AlertIcon = {
				["1458_aura_no_202231"] = {"HARMFUL", "player"}, -- 吸血
			},
			PlateAlert = {
				[226347] = "PlateSpells", -- 碎石
				[183548] = "PlateSpells", -- 蛆虫呼唤
			},
		},
		cd = {
			[226347] = 1, -- 碎石
			[183548] = 1, -- 蛆虫呼唤
		},
	},
	{ -- 纳拉萨斯
		id = 91005,
		img = 1410971,
		alerts = {
			AlertIcon = {
				["1458_aura_no_205549"] = {"HARMFUL", "player"}, -- 腐坏之喉
				["1458_aura_no_210150"] = {"HARMFUL", "player"}, -- 毒性污秽
				["1458_aura_no_199176"] = {"HARMFUL", "player"}, -- 尖刺之舌
				["1458_cast_no_205549"] = {}, -- 腐坏之喉
				["1458_cast_no_210150"] = {}, -- 毒性污秽
				["1458_cast_no_199176"] = {}, -- 尖刺之舌
				["1458_cast_no_199775"] = {}, -- 狂乱
				["1458_cast_no_199246"] = {}, -- 暴食
			},
		},
	},
	{ -- 缚石捕兽者
		id = 102232,
		alerts = {
			AlertIcon = {
				["1458_com_no_193585"] = {}, -- 束缚
			},
			HLOnRaid = {
				["1458_193585_c"] = "HL_Casting", -- 束缚
			},
			PlateAlert = {
				[193585] = "PlateSpells", -- 束缚
			},
		},
		cd = {
			[183633] = 1, -- 锯齿圆盘
			[193585] = 1, -- 束缚
		},
		
	},	
	{ -- 巨人焦皮
		id = 102253,
		alerts = {
			AlertIcon = {
				["1458_aura_no_200154"] = {"HARMFUL", "player"}, -- 燃烧之恨
				["1458_com_no_200154"] = {}, -- 燃烧之恨
			},
			HLOnRaid = {
				["1458_200154_c"] = "HL_Casting", -- 燃烧之恨
			},
			PlateAlert = {
				[200154] = "PlateSpells", -- 燃烧之恨
			},
		},
		cd = {
			[200154] = 1, -- 燃烧之恨
		},
	},	
	{ -- 烬壳统御者
		id = 102287,
		alerts = {
			PlateAlert = {
				[201959] = "PlateSpells", -- 水晶之刺
			},
		},
		cd = {
			[201959] = 1, -- 水晶之刺
		},
	},
	{ -- 烬壳统御者
		id = 102295,
		alerts = {
			PlateAlert = {
				[226406] = "PlateSpells", -- 余烬横扫
				[201983] = "PlateSpells", -- 狂乱
				[201983] = "PlateAuras", -- 狂乱
			},
		},
		cd = {
			[226406] = 1, -- 余烬横扫
			[201983] = 1, -- 狂乱	
		},
	},
	{ -- 裂烬蝎虫
		id = 98406,
		alerts = {
			AlertIcon = {
				["1458_com_no_193941"] = {}, -- 穿刺碎片
			},
			HLOnRaid = {
				["1458_193941_c"] = "HL_Casting", -- 穿刺碎片
			},
			PlateAlert = {
				[193941] = "PlateSpells", -- 穿刺碎片
			},
		},
		cd = {
			[193941] = 1, -- 穿刺碎片
		},
	},		
	{ -- 达古尔
		id = 91007,
		img = 1410944,
		alerts = {
			AlertIcon = {
				["1458_cast_no_200700"] = {}, -- 山崩	
				["1458_cast_no_200637"] = {}, -- 岩浆雕刻
				["1458_cast_no_200551"] = {}, -- 水晶尖刺
				["1458_cast_no_200732"] = {}, -- 熔岩冲击
				["1458_cast_hl_200404"] = {}, -- 熔岩波
			},
		},
	},
	{ -- 熔火焦皮
		id = 101476,
		alerts = {
			PlateAlert = {
				[200672] = "PlateAuras", -- 水晶迸裂
			},
		},
		cd = {
			[200154] = 1, -- 燃烧之恨
		},
	},
}

G.Dungeons[726] = { -- 魔法回廊1
	{ -- 被遗忘的幽灵
		id = 113699,
		alerts = {
			AlertIcon = {
				["1516_aura_no_226269"] = {"HARMFUL", "player"}, -- 折磨
			},
			PlateAlert = {
				[226269] = "PlateSpells", -- 折磨
			},
		},
		cd = {
			[226269] = 1, -- 折磨
		},
	},
	{ -- 不稳定的融合怪
		id = 98425,
		alerts = {
			AlertIcon = {
				["1516_cast_hl_193938"] = {}, -- 软泥爆炸
			},
			PlateAlert = {
				[193938] = "PlateSpells", -- 软泥爆炸
			},
		},
		cd = {
			[193938] = 1, -- 软泥爆炸
		},
	},
	{ -- 酸蚀胆汁
		id = 98728,
		alerts = {
			AlertIcon = {
				["1516_aura_no_202156"] = {"HARMFUL", "player"}, -- 腐蚀
			},
		},
	},
	{ -- 天灾鼠
		id = 98732,
		alerts = {
			AlertIcon = {
				["1516_aura_no_203592"] = {"HARMFUL", "player"}, -- 黑色热疫
			},
		},
	},
	{ -- 枯法法力怨灵
		id = 105952,
		alerts = {
			AlertIcon = {
				["1516_aura_no_210688"] = {"HARMFUL", "player"}, -- 坍缩裂隙
				["1516_aura_no_226246"] = {"HARMFUL", "player"}, -- 枯萎虚空
				["1516_aura_hl_210684"] = {"HARMFUL", "player"}, -- 虹吸精华
				["1516_com_hl_210684"] = {}, -- 虹吸精华
			},
			HLOnRaid = {
				["1516_210684_c"] = "HL_Casting", -- 虹吸精华
			},
			PlateAlert = {
				[210684] = "PlateSpells", -- 虹吸精华
			},
		},
		cd = {
			[210684] = 1, -- 虹吸精华	
		},
	},
	{ -- 枯法魔
		id = 98733,
		alerts = {
			AlertIcon = {
				["1516_aura_no_210645"] = {"HARMFUL", "player"}, -- 奥术之灾
			},
			HLOnRaid = {
				["1516_210645_c"] = "HL_Casting", -- 奥术之灾
			},
			PlateAlert = {
				[210662] = "PlateAuras", -- 变流	
				[210645] = "PlateSpells", -- 奥术之灾

			},
		},
		cd = {
			[210645] = 1, -- 奥术之灾
		},
	},
	{ -- 迁跃之影
		id = 106059,
		alerts = {
			AlertIcon = {
				["1516_aura_no_211125"] = {"HARMFUL", "player"}, -- 平行空间
				["1516_cast_hl_211115"] = {}, -- 相位裂隙
			},
			PlateAlert = {
				[226206] = "PlateSpells", -- 奥术复原
				[211115] = "PlateSpells", -- 相位裂隙
			},
		},
		cd = {
			[226206] = 1, -- 奥术复原	
			[211115] = 8, -- 相位裂隙	
		},
	},
	{ -- 奥术畸体
		id = 98756,
		alerts = {
			PlateAlert = {
				[211217] = "PlateSpells", -- 奥术切割者	
			},
		},
		cd = {
			[211217] = 20, -- 奥术切割者	
			[226206] = 1, -- 奥术复原	
		},
	},
	{ -- 法力浮龙
		id = 102351,
		alerts = {
			PlateAlert = {
				[211476] = "PlateSpells", -- 虚空之刺
			},
		},
		cd = {
			[211476] = 1, -- 虚空之刺
		},
	},
	{ -- 伊凡尔
		id = 98203,
		img = 1410963,
		alerts = {
			AlertIcon = {
				["1516_aura_no_196396"] = {"HELPFUL", "boss1"}, -- 超载
				["1516_aura_no_196804"] = {"HARMFUL", "player"}, -- 虚空链接
				["1516_aura_no_196562"] = {"HARMFUL", "player"}, -- 动荡魔法
				["1516_cast_no_196562"] = {}, -- 动荡魔法
				["1516_cast_hl_196392"] = {}, -- 法力超载
				["1516_cast_hl_196804"] = {}, -- 虚空链接
			},
			PlateAlert = {
				[196357] = "PlateSpells", -- 奥术冲击
			},
		},
		cd = {
			[196357] = 1, -- 奥术冲击
		},
	},
	{ -- 夜之子复国者
		id = 105915,
		alerts = {
			AlertIcon = {
				["1516_cast_hl_211007"] = {}, -- 漩涡之眼
				["1516_aura_no_211007"] = {"HARMFUL", "player"}, -- 漩涡之眼
				["1516_aura_no_211037"] = {"HARMFUL", "player"}, -- 迅捷领域
			},
			PlateAlert = {
				[211079] = "PlateSpells", -- 奥术箭	
				[211007] = "PlateSpells", -- 漩涡之眼
			},
		},
		cd = {
			[211079] = 1, -- 奥术箭	
			[211007] = 1, -- 漩涡之眼
		},
	},
	{ -- 夜之子魔剑士
		id = 105921,
		alerts = {
			AlertIcon = {
				["1516_aura_no_211000"] = {"HARMFUL", "player"}, -- 虚空伤口
			},
		},
	},
	{ -- 科蒂拉克斯
		img = 1410943,
		id = 98205,
		alerts = {
			AlertIcon = {
				["1516_aura_no_220481"] = {"HARMFUL", "player"}, -- 动荡宝珠	
				["1516_aura_hl_196070"] = {"HARMFUL", "player"}, -- 镇压协议	
				["1516_aura_hl_195791"] = {"HARMFUL", "player"}, -- 隔离区		
				["1516_aura_no_195362"] = {"HARMFUL", "player"}, -- 暗夜井能量
				["1516_cast_no_196115"] = {}, -- 净化之力
				["1516_cast_no_220481"] = {}, -- 动荡宝珠
				["1516_cast_hl_196070"] = {}, -- 镇压协议
				["1516_cast_hl_195791"] = {}, -- 隔离区	
			},
		},
	},
	{ -- 邪恶的魔牙蛛
		id = 98759,
		alerts = {
			AlertIcon = {
				["1516_aura_hl_211543"] = {"HARMFUL", "player"}, -- 吞噬
			},
			HLOnRaid = {
				["1516_211543_c"] = "HL_Casting", -- 吞噬
			},
		},
	},
	{ -- 纳尔提拉
		id = 98207,
		img = 1410970,
		alerts = {
			AlertIcon = {
				["1516_aura_hl_200227"] = {"HARMFUL", "player"}, -- 缠绕之网	
				["1516_aura_no_200024"] = {"HARMFUL", "player"}, -- 虚空毒液	
				["1516_cast_hl_200227"] = {}, -- 缠绕之网
				["1516_cast_no_200024"] = {}, -- 虚空毒液
			},
		},
	},
	{ -- 艾瑞达混沌使者
		id = 105617,
		alerts = {
			AlertIcon = {
				["1516_cast_hl_211757"] = {}, -- 传送门：阿古斯	
				["1516_cast_hl_211632"] = {}, -- 军团烙印		
				["1516_cast_hl_226285"] = {}, -- 恶魔飞升		
				["1516_com_no_211571"] = {}, -- 混乱之箭
			},
			HLOnRaid = {
				["1516_211571_c"] = "HL_Casting", -- 混乱之箭
			},
			PlateAlert = {
				[226420] = "PlateSpells", -- 烈焰吐息		
				[211757] = "PlateSpells", -- 传送门：阿古斯	
				[211632] = "PlateSpells", -- 军团烙印		
				[226285] = "PlateSpells", -- 恶魔飞升		
				[211571] = "PlateSpells", -- 混乱之箭
				[211632] = "PlateAuras", -- 军团烙印		
				[226285] = "PlateAuras", -- 恶魔飞升
			},
		},
		cd = {
			[226420] = 1, -- 烈焰吐息		
			[211757] = 1, -- 传送门：阿古斯	
			[211632] = 1, -- 军团烙印		
			[226285] = 1, -- 恶魔飞升		
			[211571] = 1, -- 混乱之箭		
		},
	},
	{ -- 恐裔先知		
		id = 105651,
		alerts = {
			AlertIcon = {
				["1516_cast_hl_211771"] = {}, -- 末日预言
			},
			PlateAlert = {
				[211771] = "PlateSpells", --末日预言
				[211775] = "PlateAuras", -- 野兽之眼
			},
		},
		cd = {
			[211771] = 1, -- 末日预言
			[211775] = 1, -- 野兽之眼
		},
	},
	{ -- 比斯巨兽之眼	
		id = 106757,
		alerts = {
			AlertIcon = {
				["1014_log_hl_211777"] = {"SPELL_DAMAGE", "player", 3}, -- 旋光冲击
			},
		},
	},
	{ -- 愤怒卫士邪刃者
		id = 98770,
		alerts = {
			AlertIcon = {
				["1516_aura_hl_211744"] = {"HARMFUL", "player"}, -- 邪能打击
				["1516_com_hl_211744"] = {}, -- 邪能打击
			},
			HLOnRaid = {
				["1516_211744_c"] = "HL_Casting", -- 邪能打击
			},
			PlateAlert = {
				[211744] = "PlateSpells", --邪能打击
			},
		},
		cd = {
			[211744] = 1, -- 邪能打击
		},
	},
	{ -- 痛苦女祭司
		id = 105706,
		alerts = {
			PlateAlert = {
				[211917] = "PlateSpells", -- 邪能风暴
				[211875] = "PlateSpells", --  剑刃风暴
			},
		},
		cd = {
			[211917] = 1, -- 邪能风暴
			[211875] = 1, -- 剑刃风暴
		},
	},
	{ -- 恶魔卫士毁灭者
		id = 105682,
		alerts = {
			AlertIcon = {
				["1516_cast_hl_226423"] = {}, -- 大地猛击
			},
			PlateAlert = {
				[226423] = "PlateSpells", -- 大地猛击
			},
		},
		cd = {
			[226423] = 1, -- 大地猛击
		},
	},
	{ -- 萨卡尔将军		
		id = 98206,
		img = 1410951,
		alerts = {
			AlertIcon = {
				["1516_cast_no_212030"] = {}, -- 暗影鞭笞
				["1516_cast_hl_197810"] = {}, -- 邪恶重击
				["1516_cast_no_197776"] = {}, -- 邪能裂痕
			},
		},
	},
	{ -- 恐惧魔蝠		
		id = 100393,
		alerts = {
			PlateAlert = {
				[220533] = "PlateAuras", -- 嗜血成性
			},
		},
	},
	{ -- 顾问凡多斯		
		id = 98208,
		img = 1410934,
		alerts = {
			AlertIcon = {
				["1516_aura_hl_220871"] = {"HARMFUL", "player"}, -- 不稳定的魔法
				["1516_aura_hl_203139"] = {"HARMFUL", "player"}, -- 力场新星	
				["1516_cast_hl_220871"] = {}, -- 不稳定的魔法
				["1516_cast_hl_202974"] = {}, -- 力场炸弹
				["1516_cast_no_203881"] = {}, -- 召唤时光碎片
				["1516_cast_no_203882"] = {}, -- 时空放逐
			},
			PlateAlert = {
				[203176] = "PlateSpells", -- 加速冲击
				[203176] = "PlateAuras", -- 加速冲击
			},
		},
		cd = {
			[203176] = 1, -- 加速冲击
		},
	},
	{ -- 永恒怨灵		
		id = 103130,
		alerts = {
			AlertIcon = {
				["1516_aura_no_203957"] = {"HARMFUL", "player"}, -- 时空枷锁
			},
		},
	},
}

G.Dungeons[860] = { -- 重返卡拉赞
	{ -- 弃灵
		id = 114626,
		alerts = {
			AlertIcon = {
				["1651_aura_hl_228252"] = {"HARMFUL", "player"}, -- 暗影撕裂
			},
			PlateAlert = {
				[228254] = "PlateSpells", -- 灵魂榨取
			},
		},
		cd = {
			[228254] = 1, -- 灵魂榨取
		},
	},
	{ -- 幽灵慈善家
		id = 114542,
		alerts = {
			PlateAlert = {
				[228014] = "PlateAuras", -- 一文不名
				[227999] = "PlateAuras", -- 天降金雨
				[228017] = "PlateAuras", -- 慈善捐赠
			},
		},
	},
	{ -- 鬼灵顾客	
		id = 114541,
		alerts = {
			PlateAlert = {
				[227981] = "PlateSpells", -- 上勾拳	
				[227983] = "PlateAuras", -- 狂热死忠
			},
		},
		cd = {
			[227981] = 1, -- 上勾拳
		},
	},
	{ -- 嘉琳黛尔
		id = 114251,
		img = 1536495,
		alerts = {
			AlertIcon = {
				["1651_cast_hl_227776"] = {}, -- 魔法威仪
			},	
			PlateAlert = {
				[227410] = "PlateSpells", -- 神奇辐光
				[227341] = "PlateSpells", -- 闪耀飞弹
			},
		},
		cd = {
			[227410] = 1, -- 神奇辐光
			[227341] = 1, -- 闪耀飞弹
		},
	},	
	{ -- 艾尔菲拉	
		id = 114284,
		alerts = {
			AlertIcon = {
				["1651_cast_hl_227447"] = {}, -- 反抗引力
				["1651_cast_no_227477"] = {}, -- 召唤助手
				["1651_com_no_227543"] = {}, -- 忧郁箭	
				["1651_aura_hl_227447"] = {"HARMFUL", "player"}, -- 反抗引力				
			},
			HLOnRaid = {
				["1651_227543_c"] = "HL_Casting", -- 忧郁箭			
			},
		},
	},
	{ -- 飞猴助手	
		id = 114324,
		alerts = {
			AlertIcon = {
				["1651_com_no_227461"] = {}, -- 投掷“物品”
			},
			HLOnRaid = {
				["1651_227461_c"] = "HL_Casting", -- 投掷“物品”		
			},
		},
	},
	{ -- 玛吉亚
		id = 114260,
		img = 1536494,
		alerts = {
			AlertIcon = {
				["1651_cast_no_227783"] = {}, -- 冲刷
			},
			PlateAlert = {
				[227777] = "PlateSpells", -- 雷霆仪式
			},
		},
		cd = {
			[227777] = 1, -- 雷霆仪式
		},
	},
	{ -- 海岸潮语者
		id = 114266,
		alerts = {
			PlateAlert = {
				[227420] = "PlateSpells", -- 水泡爆炸
			},
		},
		cd = {
			[227420] = 1, -- 水泡爆炸
		},
	},
	{ -- 托尼
		id = 114261,
		alerts = {
			AlertIcon = {
				["1651_aura_no_227480"] = {"HARMFUL", "player"}, -- 烈焰狂风
				["1651_aura_no_227568"] = {"HARMFUL", "player"}, -- 燃烧扫堂腿
			},
			PlateAlert = {
				[227568] = "PlateSpells", -- 燃烧扫堂腿
			},
		},
		cd = {
			[227568] = 1, -- 燃烧扫堂腿
		},
	},
	{ -- 黑帮恶棍
		id = 114256,
		alerts = {
			AlertIcon = {
				["1651_aura_no_227325"] = {"HARMFUL", "player"}, -- 剧毒匕首
			},
		},
	},
	{ -- 库格斯顿
		id = 114328,
		img = 1536493,
		alerts = {
			AlertIcon = {
				["1651_aura_no_227985"] = {"HARMFUL", "player"}, -- 削弱护甲
				["1651_cast_no_227987"] = {}, -- 用餐时间！
				["1651_cast_no_232153"] = {}, -- 附灵术		
			},
			PlateAlert = {
				[228729] = "PlateAuras", -- 显赫	
				[232156] = "PlateAuras", -- 鬼灵服务
			},
		},
	},
	{ -- 银餐叉
		id = 116574,
		alerts = {
			AlertIcon = {
				["1651_aura_no_232135"] = {"HARMFUL", "player"}, -- 血腥突刺
			},
		},
	},
	{ -- 巴布丽特
		id = 114330,
		alerts = {
			AlertIcon = {
				["1651_aura_hl_228221"] = {"HARMFUL", "player"}, -- 扬尘漫天
			},
			PlateAlert = {
				[228225] = "PlateAuras", -- 阴燃高温
			},
		},
	},
	{ -- 考德隆夫人
		id = 114522,
		alerts = {
			AlertIcon = {
				["1651_aura_no_228013"] = {"HARMFUL", "player"}, -- 浸透
				["1651_com_no_228011"] = {}, -- 汤汁泼洒
			},
			HLOnRaid = {
				["1651_228011_c"] = "HL_Casting", -- 汤汁泼洒
			},
			PlateAlert = {
				[228011] = "PlateSpells", -- 汤汁泼洒
			},
		},
		cd = {
			[228011] = 1, -- 汤汁泼洒
		},
	},
	{ -- 鲁米诺尔
		id = 114329,
		alerts = {
			AlertIcon = {
				["1651_aura_no_228193"] = {"HARMFUL", "player"}, -- 燃烧之焰
			},
			PlateAlert = {
				[228025] = "PlateSpells", -- 热浪	
				[228193] = "PlateSpells", -- 燃烧之焰
			},
		},
		cd = {
			[228025] = 1, -- 热浪	
			[228193] = 1, -- 燃烧之焰
		},
	},
	{ -- 幽灵临时演员
		id = 114526,
		alerts = {
			PlateAlert = {
				[227927] = "PlateAuras", -- 聚光灯	
				[227925] = "PlateSpells", -- 谢幕演出
				[227917] = "PlateSpells", -- 赛诗大会
			},
		},
		cd = {
			[227925] = 1, -- 谢幕演出
			[227917] = 1, -- 赛诗大会	
		},
	},
	{ -- 替补歌手
		id = 116549,
		alerts = {
			PlateAlert = {
				[232115] = "PlateSpells", -- 火焰之地传送门
			},
		},
		cd = {
			[232115] = 1, -- 火焰之地传送门
		},
	},
	{ -- 幻影员工
		id = 114584,
		alerts = {
			AlertIcon = {
				["1651_aura_no_228164"] = {"HARMFUL", "player"}, -- 裂地猛击
				["1651_com_no_228086"] = {}, -- 焰火
			},
			HLOnRaid = {
				["1651_228086_c"] = "HL_Casting", -- 焰火
			},
			PlateAlert = {
				[228086] = "PlateSpells", -- 焰火
			},
		},
		cd = {
			[228086] = 1, -- 焰火
		},
	},
	{ -- 鬼灵顾客
		id = 116550,
		cd = {
			[227981] = 1, -- 上勾拳
		},
	},
	{ -- 亡灵仆从
		id = 114634,
		alerts = {
			AlertIcon = {
				["1651_aura_no_228277"] = {"HARMFUL", "player"}, -- 仆役的镣铐
			},
		},
	},
	{ -- 骷髅招待员
		id = 114544,
		alerts = {
			AlertIcon = {
				["1651_aura_no_227965"] = {"HARMFUL", "player"}, -- 检票
			},
			PlateAlert = {
				[227966] = "PlateSpells", -- 眩目灯光
			},
		},
		cd = {
			[227966] = 1, -- 眩目灯光
		},
	},
	{ -- 骷髅服务员
		id = 114628,
		alerts = {
			AlertIcon = {
				["1651_aura_no_230297"] = {"HARMFUL", "player"}, -- 脆骨
			},
		},
	},
	{ -- 幻影访客	
		id = 114625,
		alerts = {
			AlertIcon = {
				["1651_aura_no_29928"] = {"HARMFUL", "player"}, -- 献祭	
				["1651_aura_no_29930"] = {"HARMFUL", "player"}, -- 痛苦诅咒
				["1651_aura_no_29583"] = {"HARMFUL", "player"}, -- 穿刺	
			},	
			PlateAlert = {
				[29513] = "PlateSpells", -- 地精龙枪
				[29579] = "PlateSpells", -- 投掷炸弹
				[29580] = "PlateSpells", -- 治疗术	
				[29492] = "PlateSpells", -- 灼热之痛
				[29928] = "PlateSpells", -- 献祭	
			},
		},
		cd = {
			[29513] = 1, -- 地精龙枪
			[29579] = 1, -- 投掷炸弹
			[29580] = 1, -- 治疗术	
			[29492] = 1, -- 灼热之痛
			[29928] = 1, -- 献祭	
		},
	},
	{ -- 幻影卫兵	
		id = 114636,
		alerts = {
			AlertIcon = {
				["1651_com_no_241774"] = {}, -- 盾牌重击	
			},
		},
	},
	{ -- 洗心革面的侍女
		id = 114783,
		alerts = {
			AlertIcon = {
				["1651_aura_no_241798"] = {"HARMFUL", "player"}, -- 死神之吻
				["1651_aura_no_228526"] = {"HARMFUL", "player"}, -- 调情
			},
			HLOnRaid = {
				["1651_241798_c"] = "HL_Casting", -- 死神之吻
			},
			PlateAlert = {
				[241798] = "PlateSpells", -- 死神之吻
				[228528] = "PlateSpells", -- 碎心打击	
				[228526] = "PlateSpells", -- 调情
			},
		},
		cd = {
			[241798] = 1, -- 死神之吻
			[228528] = 1, -- 碎心打击
			[228526] = 1, -- 调情
		},
	},
	{ -- 保守的女招待
		id = 114796,
		alerts = {
			AlertIcon = {
				["1651_aura_no_228576"] = {"HARMFUL", "player"}, -- 被诱惑
			},
		},
	},
	{ -- 贞善女士	
		id = 114792,
		alerts = {
			AlertIcon = {
				["1651_aura_no_228559"] = {"HARMFUL", "player"}, -- 魅惑香水
			},
			HLOnRaid = {
				["1651_241809_c"] = "HL_Casting", -- 暗影箭
			},
			PlateAlert = {
				[241809] = "PlateSpells", -- 暗影箭
				[228559] = "PlateSpells", -- 魅惑香水

			},
		},
		cd = {
			[241809] = 1, -- 暗影箭
			[228559] = 1, -- 魅惑香水
		},
	},
	{ -- 贞节圣女
		id = 113971,
		img = 1378997,
		alerts = {
			AlertIcon = {		
				["1651_com_no_227789"] = {}, -- 神圣之地
				["1651_aura_no_227789"] = {"HARMFUL", "player"}, -- 神圣之地
				["1651_com_no_227809"] = {}, -- 神圣之箭
				["1651_cast_no_227817"] = {}, -- 神圣壁垒
				["1651_aura_no_227817"] = {"HELPFUL", "boss1", 17}, -- 神圣壁垒
				["1651_cast_hl_227508"] = {}, -- 群体忏悔
				["1651_aura_no_227508"] = {"HARMFUL", "player"}, -- 群体忏悔
				["1651_cast_hl_227823"] = {}, -- 神圣愤怒
				["1651_aura_no_227823"] = {"HARMFUL", "player"}, -- 神圣愤怒
				["1651_cast_no_227800"] = {}, -- 神圣震击
				["1651_aura_no_227800"] = {"HARMFUL", "player"}, -- 神圣震击
			},
			HLOnRaid = {
				["1651_227809_c"] = "HL_Casting", -- 神圣之箭
			},
		},
	},
	{ -- 鬼灵短工	
		id = 114802,
		alerts = {
			PlateAlert = {
				[228637] = "PlateSpells", -- 猛击
			},
		},
		cd = {
			[228637] = 1, -- 猛击
		},
	},
	{ -- 鬼灵马夫	
		id = 114803,
		alerts = {
			AlertIcon = {
				["1651_aura_no_6016"] = {"HARMFUL", "player"}, -- 穿刺护甲
				["1651_aura_no_228610"] = {"HARMFUL", "player"}, -- 燃烧之烙
			},
			PlateAlert = {
				[228606] = "PlateSpells", -- 治疗之触	
				[233210] = "PlateAuras", -- 鞭笞狂暴
			},
		},
		cd = {
			[228606] = 1, -- 治疗之触
		},
	},
	{ -- 鬼灵战马	
		id = 114804,
		alerts = {
			PlateAlert = {
				[228603] = "PlateSpells", -- 冲锋	
				[241828] = "PlateSpells", -- 猛烈践踏
			},
		},
		cd = {
			[228603] = 1, -- 冲锋	
			[241828] = 1, -- 猛烈践踏
		},
	},
	{ -- 猎手阿图门	
		id = 114262,
		img = 1536490,
		alerts = {
			AlertIcon = {
				["1651_aura_no_227404"] = {"HARMFUL", "player"}, -- 无形
				["1651_cast_hl_227404"] = {}, -- 无形
				["1651_cast_hl_228852"] = {}, -- 共受苦难
				["1651_cast_no_227493"] = {}, -- 致死打击				
			},
		},
	},
	{ -- 午夜
		id = 114264,
		alerts = {
			AlertIcon = {
				["1651_cast_hl_227339"] = {}, -- 人立	
				["1651_cast_hl_227363"] = {}, -- 强力践踏
				["1651_cast_hl_227365"] = {}, -- 鬼灵冲锋			
			},
			PlateAlert = {
				[228895] = "PlateAuras", -- 激怒
			},
		},
	},
	{ -- 奥术守卫
		id = 114624,
		alerts = {
			AlertIcon = {
				["1651_aura_no_228333"] = {"HARMFUL", "player"}, -- 爆裂充能
			},
		},
	},
	{ -- 莫罗斯
		id = 114312,
		img = 1378999,
		alerts = {
			AlertIcon = {
				["1651_cast_no_227737"] = {}, -- 消失
				["1651_aura_no_227742"] = {"HARMFUL", "player"}, -- 锁喉
				["1651_com_no_227851"] = {}, -- 保管外套
				["1651_aura_no_227851"] = {"HARMFUL", "player"}, -- 保管外套
				["1651_cast_no_227872"] = {}, -- 幽灵净化
			},
			PlateAlert = {
				[227872] = "PlateAuras", -- 幽灵净化
				[233669] = "PlateAuras", -- 热情好客
				[227909] = "PlateAuras", -- 幽灵陷阱
			},
		},
	},
	{ -- 克里斯宾·费伦斯伯爵
		id = 114321,
		alerts = {
			AlertIcon = {
				["1651_cast_hl_227672"] = {}, -- 意志摧毁者
			},
			PlateAlert = {
				[227672] = "PlateSpells", -- 意志摧毁者
			},
		},
		cd = {
			[227672] = 10, -- 意志摧毁者
		},
	},
	{ -- 卡翠欧娜·沃宁迪女伯爵
		id = 114317,
		alerts = {
			AlertIcon = {
				["1651_com_no_227542"] = {}, -- 惩击
			},
			HLOnRaid = {
				["1651_227542_c"] = "HL_Casting", -- 惩击
			},
			PlateAlert = {
				[227578] = "PlateSpells", -- 治疗之泉	
				[227578] = "PlateAuras", -- 治疗之泉
			},
		},
		cd = {
			[227578] = 30, -- 治疗之泉
		},
	},
	{ -- 吉拉·拜瑞巴克女伯爵
		id = 114319,
		alerts = {
			PlateAlert = {
				[227616] = "PlateSpells", -- 强化武装
				[227616] = "PlateAuras", -- 强化武装
			},
		},
		cd = {
			[227616] = 20, -- 强化武装
		},
	},
	{ -- 拉弗·德鲁格尔男爵
		id = 114318,
		alerts = {
			AlertIcon = {
				["1651_cast_hl_227646"] = {}, -- 钢铁旋风
			},
			PlateAlert = {
				[227646] = "PlateSpells", -- 钢铁旋风
			},
		},
		cd = {
			[227646] = 9, -- 钢铁旋风
		},
	},
	{ -- 杜萝希·米尔斯迪普女伯爵
		id = 114316,
		alerts = {
			AlertIcon = {
				["1651_com_no_227575"] = {}, -- 奥术冲击
				["1651_com_hl_227545"] = {}, -- 抽取法力
			},
			HLOnRaid = {
				["1651_227575_c"] = "HL_Casting", -- 奥术冲击
			},
			PlateAlert = {
				[227545] = "PlateSpells", -- 抽取法力
			},
		},
		cd = {
			[227545] = 20, -- 抽取法力
		},
	},
	{ -- 罗宾·达尼斯伯爵
		id = 114320,
		alerts = {
			AlertIcon = {
				["1651_com_hl_227463"] = {}, -- 回旋利刃
			},
			PlateAlert = {
				[227463] = "PlateSpells", -- 回旋利刃
			},
		},
		cd = {
			[227463] = 16, -- 回旋利刃
		},
	},
	{ -- 尖啸女妖
		id = 114627,
		alerts = {
			AlertIcon = {
				["1651_aura_hl_228241"] = {"HARMFUL", "player"}, -- 诅咒之触
			},
			PlateAlert = {
				[228239] = "PlateSpells", -- 恐惧嚎叫
			},
		},
		cd = {
			[228239] = 1, -- 恐惧嚎叫
		},
	},
	{ -- 损坏的傀儡
		id = 114334,
		alerts = {
			PlateAlert = {
				[227529] = "PlateSpells", -- 不稳定的能量
			},
		},
		cd = {
			[227529] = 1, -- 不稳定的能量
		},
	},
	{ -- 抽象终结者
		id = 115765,
		alerts = {
			AlertIcon = {
				["1651_aura_no_230050"] = {"HARMFUL", "player"}, -- 力场之刃
				["1651_aura_no_230094"] = {"HARMFUL", "player"}, -- 废灵	
				["1651_aura_no_230087"] = {"HELPFUL", "player"}, -- 振作	
			},
		},
	},
	{ -- 魔力聚合体
		id = 114338,
		alerts = {
			PlateAlert = {	
				[227548] = "PlateAuras", -- 烧蚀护盾
				[228700] = "PlateSpells", -- 奥术弹幕
			}
		},
		cd = {
			[228700] = 6, -- 奥术弹幕
		},
	},
	{ -- 馆长
		id = 114247,
		img = 1379020,
		alerts = {
			AlertIcon = {
				["1651_cast_no_227267"] = {}, -- 召唤易爆能量
				["1651_cast_no_227254"] = {}, -- 唤醒		
				["1651_cast_hl_227279"] = {}, -- 能量释放
				["1651_aura_no_227279"] = {"HARMFUL", "player"}, -- 能量释放
				["1651_cast_no_227257"] = {}, -- 过载		
			},
		},
	},
	{ -- 麦迪文之影
		id = 114350,
		img = 1536496,
		alerts = {
			AlertIcon = {	
				["1651_cast_no_227615"] = {}, -- 炼狱箭
				["1651_aura_hl_227615"] = {"HARMFUL", "player"}, -- 炼狱箭
				["1651_cast_no_227628"] = {}, -- 穿刺飞弹
				["1651_cast_no_227592"] = {}, -- 霜寒	
				["1651_cast_hl_228269"] = {}, -- 烈焰花环
				["1651_aura_hl_228269"] = {"HARMFUL", "player"}, -- 烈焰花环			
				["1651_cast_hl_228334"] = {}, -- 守护者的影像
				["1651_cast_hl_227779"] = {}, -- 无尽寒冬
				["1651_aura_no_227779"] = {"HARMFUL", "player"}, -- 无尽寒冬
				["1651_aura_no_228524"] = {"HARMFUL", "player"}, -- 闪光术		
			},
			HLOnRaid = {
				["1651_227615_c"] = "HL_Casting", -- 炼狱箭
				["1651_228269_c"] = "HL_Auras", -- 烈焰花环
			},
		},
	},
	{ -- 守护者的影像
		id = 114675,
		alerts = {
			PlateAlert = {
				[228991] = "PlateSpells", -- 奥术箭
			},
		},
		cd = {
			[228991] = 1, -- 奥术箭
		},
	},
	{ -- 魔力吞噬者
		id = 114252,
		img = 1536492,
		alerts = {
			AlertIcon = {
				["1651_cast_no_227297"] = {}, -- 凝聚能量
				["1651_aura_no_227502"] = {"HARMFUL", "player"}, -- 不稳定的法力
				["1651_aura_no_227524"] = {"HARMFUL", "player"}, -- 能量虚空	
			},
		},
	},
	{ -- 魔力吞噬者
		id = 115831,
		alerts = {
			AlertIcon = {
				["1651_aura_no_230221"] = {"HARMFUL", "player"}, -- 被吸收的法力
			},
		},
	},
	{ -- 灌魔炎术士
		id = 115488,
		alerts = {
			PlateAlert = {
				[36247] = "PlateSpells", -- 邪能火球
			},
		},
		cd = {
			[36247] = 1, -- 邪能火球
		},
	},
	{ -- 艾瑞迪特屠杀者
		id = 115486,
		alerts = {
			PlateAlert = {
				[229608] = "PlateSpells", -- 强力挥砍
				[229611] = "PlateSpells", -- 重力碾压
			},
		},
		cd = {
			[229608] = 10, -- 强力挥砍
			[229611] = 20, -- 重力碾压
		},
	},
	{ -- 国王
		id = 115388,
		alerts = {
			PlateAlert = {
				[229429] = "PlateSpells", -- 皇家斩击
				[229495] = "PlateAuras", -- 易伤
			},
		},
		cd = {
			[229429] = 20, -- 皇家斩击
		},
	},
	{ -- 监视者维兹艾德姆
		id = 114790,
		img = 1536497,
		alerts = {
			AlertIcon = {
				["1651_aura_hl_229241"] = {"HARMFUL", "player"}, -- 获取目标
				["1651_aura_hl_229159"] = {"HARMFUL", "player"}, -- 混沌暗影
				["1651_cast_no_229610"] = {}, -- 恶魔之门
				["1651_cast_hl_229151"] = {}, -- 分裂波
				["1651_cast_no_229083"] = {}, -- 炽热冲击
				["1651_aura_no_229083"] = {"HARMFUL", "player"}, -- 炽热冲击
				["1651_cast_no_230084"] = {}, -- 稳定裂隙
			},
		},
	},
	{ -- 恶魔卫士斥候
		id = 115730,
		alerts = {
			AlertIcon = {
				["1651_aura_no_230002"] = {"HARMFUL", "player"}, -- 炽热断筋
			},
		},
	},
}

G.Dungeons[945] = { -- 执政团之座1
	{ -- 虚空溢出物
		id = 122478,
		alerts = {
			AlertIcon = {
				["1753_aura_no_246900"] = {"HARMFUL", "player"}, -- 黑暗爆发
				["1753_aura_no_245748"] = {"HARMFUL", "player"}, -- 腐蚀之触
			},
			PlateAlert = {
				[246900] = "PlateSpells", -- 黑暗爆发
			},
		},
		cd = {
			[246900] = 1, -- 黑暗爆发
		},
	},
	{ -- 影卫征服者
		id = 124171,
		alerts = {
			AlertIcon = {
				["1753_aura_no_249081"] = {"HARMFUL", "player"}, -- 压制力场
				["1753_aura_no_246697"] = {"HARMFUL", "player"}, -- 消除烙印
			},
			PlateAlert = {
				[249081] = "PlateSpells", -- 压制力场
				[246697] = "PlateSpells", -- 消除烙印
			},
		},
		cd = {
			[249081] = 1, -- 压制力场
			[246697] = 1, -- 消除烙印
		},
	},
	{ -- 饥饿的破碎者
		id = 122322,
		alerts = {
			AlertIcon = {
				["1753_aura_no_245727"] = {"HARMFUL", "player"}, -- 吞噬精华
				["1753_aura_no_249080"] = {"HARMFUL", "player"}, -- 黑暗凋敝
			},
			PlateAlert = {
				[245727] = "PlateSpells", -- 吞噬精华
				[249080] = "PlateSpells", -- 黑暗凋敝
			},
		},
		cd = {
			[245727] = 1, -- 吞噬精华
			[249080] = 1, -- 黑暗凋敝
		},
	},
	{ -- 晋升者祖拉尔
		id = 122313,
		img = 1715226,
		alerts = {
			AlertIcon = {
				["1753_cast_no_246134"] = {}, -- 虚空之掌
				["1753_aura_no_244588"] = {"HARMFUL", "player"}, -- 虚空淤泥
				["1753_cast_hl_244579"] = {}, -- 残杀
				["1753_com_hl_244653"] = {}, -- 锁定
				["1753_aura_hl_244653"] = {"HARMFUL", "player"}, -- 锁定
				["1753_aura_no_247038"] = {"HELPFUL", "boss1"}, -- 癫狂暴走
				["1753_aura_hl_244621"] = {"HARMFUL", "boss1"}, -- 虚空裂缝
			},
		},
	},
	{ -- 黑暗畸体
		id = 122482,
		alerts = {
			PlateAlert = {
				[244618] = "PlateSpells", -- 释放虚空能量
			},
		},
		cd = {
			[244618] = 1, -- 释放虚空能量
		},
	},
	{ -- 影卫欺诈者
		id = 122401,
		alerts = {
			PlateAlert = {
				[245655] = "PlateAuras", -- 弧形虚空
				[246284] = "PlateAuras", -- 潜行
			},
		},
	},
	{ -- 裂隙守护者
		id = 122571,
		alerts = {
			AlertIcon = {
				["1753_com_no_248133"] = {}, -- 冥河冲击
				["1753_aura_no_248133"] = {"HARMFUL", "player"}, -- 冥河冲击
			},
			HLOnRaid = {
				["1753_248133_c"] = "HL_Casting", -- 冥河冲击
			},
			PlateAlert = {
				[248133] = "PlateSpells", -- 冥河冲击
				[248128] = "PlateSpells", -- 黑暗残余
			},
		},
		cd = {
			[248133] = 1, -- 冥河冲击
			[248128] = 1, -- 黑暗残余
		},
	},
	{ -- 破碎的虚空之子
		id = 125981,
		alerts = {
			PlateAlert = {
				[250193] = "PlateSpells", -- 破碎
			},
		},
		cd = {
			[250193] = 1, -- 破碎
		},
	},	
	{ -- 影卫勇士
		id = 122403,
		alerts = {
			AlertIcon = {
				["1753_aura_no_245722"] = {"HARMFUL", "player"}, -- 黑暗伤痕
			},
			PlateAlert = {
				[245706] = "PlateSpells", -- 毁灭打击
			},
		},
		cd = {
			[245706] = 1, -- 毁灭打击
		},
	},
	{ -- 暗影战争精锐
		id = 122421,
		alerts = {
			PlateAlert = {
				[248067] = "PlateSpells", -- 壮丽挥舞
				[248049] = "PlateSpells", -- 精华分裂
			},
		},
		cd = {
			[248067] = 7, -- 壮丽挥舞
			[248049] = 1, -- 精华分裂
		},
	},
	{ -- 影卫裂隙猎手
		id = 122413,
		alerts = {
			PlateAlert = {
				[248304] = "PlateSpells", -- 狂野召唤
			},
		},
		cd = {
			[248304] = 1, -- 狂野召唤
		},
	},
	{ -- 暗影追猎者
		id = 125080,
		alerts = {
			AlertIcon = {
				["1753_aura_no_245736"] = {"HARMFUL", "player"}, -- 虚空碎裂
			},
		},
	},
	{ -- 天鳍鳐
		id = 125079,
		alerts = {
			PlateAlert = {
				[248298] = "PlateSpells", -- 尖啸
			},
		},
		cd = {
			[248298] = 1, -- 尖啸
		},
	},
	{ -- 天鳍鳐
		id = 122410,
		cd = {
			[248298] = 1, -- 尖啸
		},
	},
	{ -- 迁跃兽
		id = 125081,
		alerts = {
			PlateAlert = {
				[248301] = "PlateSpells", -- 黑暗吐息
			},
		},
		cd = {
			[248301] = 1, -- 黑暗吐息
		},
	},
	{ -- 迁跃兽
		id = 122407,
		cd = {
			[248301] = 1, -- 黑暗吐息
		},
	},
	{ -- 萨普瑞什
		id = 122316,
		img = 1715220, 
		alerts = {
			AlertIcon = {
				["1753_cast_no_247175"] = {}, -- 虚空陷阱
				["1753_aura_no_247175"] = {"HARMFUL", "player"}, -- 虚空陷阱
				["1753_cast_hl_247245"] = {}, -- 幽影侧击
				["1753_aura_no_247245"] = {"HARMFUL", "player"}, -- 幽影侧击
				["1753_aura_no_247145"] = {"HELPFUL", "boss1"}, -- 猎人冲动	
			},
			HLOnRaid = {
				["1753_247245_c"] = "HL_Auras", -- 幽影侧击
			},
		},
	},
	{ -- 影翼鳐
		id = 125340,
		alerts = {
			PlateAlert = {
				[248831] = "PlateSpells", -- 恐惧尖啸
			},
		},
		cd = {
			[248831] = 16, -- 恐惧尖啸
		},
	},	
	{ -- 黯牙	
		id = 122319,
		alerts = {
			PlateAlert = {
				[245802] = "PlateSpells", -- 黑暗肆虐
			},
		},
		cd = {
			[245802] = 9, -- 黑暗肆虐
		},
	},	
	{ -- 影卫缚灵师
		id = 122404,
		alerts = {
			AlertIcon = {
				["1753_aura_no_249077"] = {"HARMFUL", "player"}, -- 腐蚀虚空
			},
			PlateAlert = {
				[245522] = "PlateSpells", -- 熵能迷雾
			},
		},
		cd = {
			[245522] = 1, -- 熵能迷雾
		},
	},
	{ -- 影卫召唤师
		id = 122405,
		alerts = {
			AlertIcon = {
				["1753_com_no_245601"] = {}, -- 幽影箭矢
			},
			HLOnRaid = {
				["1753_245601_c"] = "HL_Casting", -- 幽影箭矢
			},
			PlateAlert = {
				[245601] = "PlateSpells", -- 幽影箭矢
				[249078] = "PlateSpells", -- 虚空散射
				[245592] = "PlateSpells", -- 虚空裂缝
			},
		},
		cd = {
			[245601] = 1, -- 幽影箭矢
			[249078] = 1, -- 虚空散射
			[245592] = 1, -- 虚空裂缝
		},
	},
	{ -- 大织影者	
		id = 122423,
		alerts = {
			AlertIcon = {
				["1753_aura_no_248239"] = {"HARMFUL", "player"}, -- 黑暗拼接
			},
			PlateAlert = {
				[248232] = "PlateSpells", -- 精华分裂
				[248239] = "PlateSpells", -- 黑暗拼接
				[248227] = "PlateSpells", -- 黑暗物质
			},
		},
		cd = {
			[248232] = 1, -- 精华分裂
			[248239] = 1, -- 黑暗拼接
			[248227] = 1, -- 黑暗物质
		},
	},
	{ -- 剥灵者
		id = 124947,
		alerts = {
			AlertIcon = {
				["1753_aura_no_248184"] = {"HARMFUL", "player"}, -- 黑暗鞭笞
			},
			PlateAlert = {
				[248184] = "PlateSpells", -- 黑暗鞭笞
			},
		},
		cd = {
			[248184] = 1, -- 黑暗鞭笞
		},
	},
	{ -- 不稳定的黑暗物质
		id = 124964,
		alerts = {
			PlateAlert = {
				[248228] = "PlateSpells", -- 坍缩
			},
		},
		cd = {
			[248228] = 1, -- 坍缩
		},
	},
	{ -- 虚空裂缝
		id = 124106,
		alerts = {
			PlateAlert = {
				[246641] = "PlateSpells", -- 黑暗碎片
			},
		},
		cd = {
			[246641] = 1, -- 黑暗碎片
		},
	},	
	{ -- 总督奈扎尔
		id = 122056,
		img = 1715224, 
		alerts = {
			AlertIcon = {
				["1753_com_no_244750"] = {}, -- 黑暗冲击
				["1753_cast_no_246324"] = {}, -- 混沌原力	
				["1753_cast_hl_244751"] = {}, -- 黑暗咆哮
				["1753_aura_no_244906"] = {"HARMFUL", "player"}, -- 崩塌虚空
				["1753_cast_hl_248736"] = {}, -- 永恒暮光	
			},
		},
	},
	{ -- 影卫慰灵师
		id = 125615,
		alerts = {
			PlateAlert = {
				[248804] = "PlateAuras", -- 黑暗壁垒
			},
		},
	},	
	{ -- 暗影触须	
		id = 122827,
		alerts = {
			AlertIcon = {
				["1753_aura_hl_244916"] = {"HARMFUL", "player"}, -- 虚空鞭笞
				["1753_com_no_244916"] = {}, -- 虚空鞭笞
			},
			HLOnRaid = {
				["1753_244916_c"] = "HL_Casting", -- 虚空鞭笞
			},
			PlateAlert = {
				[244916] = "PlateSpells", -- 虚空鞭笞
			},
		},
		cd = {
			[244916] = 1, -- 虚空鞭笞
		},
	},
	{ -- 鞭笞虚空幼体
		id = 125857,
		alerts = {
			PlateAlert = {
				[254727] = "PlateSpells", -- 黑暗之鞭
			},
		},
		cd = {
			[254727] = 1, -- 黑暗之鞭
		},
	},
	{ -- 裂隙守护者
		id = 125860,
		cd = {
			[248133] = 1, -- 冥河冲击
			[248128] = 1, -- 黑暗残余
		},
	},
	{ -- 鲁拉
		id = 124729,
		img = 1715214, 
		alerts = {
			AlertIcon = {
				["1753_cast_no_247795"] = {}, -- 召唤虚空
				["1753_aura_no_245289"] = {"HARMFUL", "player"}, -- 虚空冲击
				["1753_cast_hl_247930"] = {}, -- 暗影和弦
				["1753_cast_no_249009"] = {}, -- 群体突袭		
				["1753_aura_no_247915"] = {"HELPFUL", "boss1"}, -- 黑暗滋生
				["1753_aura_no_254020"] = {"HELPFUL", "boss1"}, -- 黑暗笼罩
				["1753_aura_hl_247816"] = {"HELPFUL", "boss1"}, -- 反冲
			},
		},
	},
	{ -- 大型裂隙守护者
		id = 124745,
		alerts = {
			AlertIcon = {
				["1753_aura_no_245242"] = {"HARMFUL", "player"}, -- 痛苦残渣
			},
			PlateAlert = {
				[245164] = "PlateSpells", -- 绝望碎片
			},
		},
		cd = {
			[245164] = 1, -- 绝望碎片
		},
	},
}
