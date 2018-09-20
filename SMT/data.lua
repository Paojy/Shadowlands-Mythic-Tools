local T, C, L, G = unpack(select(2, ...))

G.Dungeons[1001] = { -- 自由镇
	{ -- 天空上尉库拉格
		id = 126832,
		img = 1778351,
		alerts = {
			AlertIcon = {
				["1754_com_no_256106"] = {}, -- 艾泽里特填装弹
				["1754_cast_no_255952"] = {}, -- 冲冲冲锋
				["1754_cast_no_256060"] = {}, -- 复苏之酒
			},
			HLOnRaid = {
				["1754_256106_c"] = "HL_Casting", -- 艾泽里特填装弹
			},
			PlateAlert = {
				[255952] = "PlateSpells", -- 冲冲冲锋
				[256060] = "PlateSpells", -- 复苏之酒
				[256106] = "PlateSpells", -- 艾泽里特填装弹
			},
		},
		cd = {
			[255952] = 10, -- 冲冲冲锋
			[256060] = 22, -- 复苏之酒
			[256106] = 11, -- 艾泽里特填装弹
		},
	},
	{ -- 鲨鱼饵
		id = 126841,
		alerts = {
			AlertIcon = {
				["1754_log_no_256005"] = {"SPELL_CAST_SUCCESS", nil, 3}, -- 污秽轰炸
				["1754_log_no_268717"] = {"SPELL_CAST_SUCCESS", nil, 3}, -- 俯冲轰炸		
			},
		},
	},
	{ -- 尤朵拉船长
		id = 126848,
		img = 1778346,
		alerts = {
			AlertIcon = {
				["1754_com_no_256979"] = {}, -- 重填装弹
				["1754_cast_no_258381"] = {}, -- 葡萄弹
			},
			HLOnRaid = {
				["1754_256979_c"] = "HL_Casting", -- 重填装弹
			},
			PlateAlert = {
				[256979] = "PlateSpells", -- 重填装弹
				[258381] = "PlateSpells", -- 葡萄弹
			},
		},
		cd = {
			[256979] = 1, -- 重填装弹
			[258381] = 30, -- 葡萄弹
		},
	},
	{ -- 拉乌尔船长
		id = 126847,
		alerts = {
			AlertIcon = {
				["1754_com_no_258338"] = {}, -- 眩晕酒桶
				["1754_com_no_256589"] = {}, -- 砸桶
				["1754_aura_no_258857"] = {"HARMFUL", "player"}, -- 眩晕酒桶
			},
			HLOnRaid = {
				["1754_258338_c"] = "HL_Casting", -- 眩晕酒桶
			},
			PlateAlert = {
				[258338] = "PlateSpells", -- 眩晕酒桶
				[256589] = "PlateSpells", -- 砸桶
			},
		},
		cd = {
			[258338] = 47, -- 眩晕酒桶
			[256589] = 23, -- 砸桶
		},
	},
	{ -- 乔里船长
		id = 126845,
		alerts = {
			AlertIcon = {
				["1754_cast_no_267522"] = {}, -- 刀刃疾突
				["1754_cast_no_267533"] = {}, -- 回旋剑刃
				["1754_aura_no_267523"] = {"HARMFUL", "player"}, -- 刀刃疾突
			},
			PlateAlert = {
				[267523] = "PlateSpells", -- 刀刃疾突
				[267522] = "PlateSpells", -- 刀刃疾突
				[267533] = "PlateSpells", -- 回旋剑刃
			},
		},
		cd = {
			[267523] = 1, -- 刀刃疾突
			[267522] = 23, -- 刀刃疾突
			[267533] = 23, -- 回旋剑刃
		},
	},
	{ -- 拉米·曼寇
		id = 133219,
		alerts = {
			AlertIcon = {
				["1754_log_no_265088"] = {"SPELL_CAST_START", nil, 3}, -- 信心自由镇啤酒 
				["1754_log_no_265168"] = {"SPELL_CAST_START", nil, 3}, -- 腐蚀的自由镇啤酒
				["1754_log_no_264608"] = {"SPELL_CAST_START", nil, 3}, -- 活力自由镇啤酒 	
			},
		},
	},
	{ -- 托萨克
		id = 126969,
		img = 1778350,
		alerts = {
			AlertIcon = {
				["1754_cast_no_256405"] = {}, -- 狂鲨飓风
				["1754_cast_no_256706"] = {}, -- 重新武装
				["1754_aura_no_256363"] = {"HARMFUL", "player"}, -- 裂伤拳
			},
			PlateAlert = {
				[256405] = "PlateSpells", -- 狂鲨飓风
			},
		},
		cd = {
			[256405] = 27, -- 狂鲨飓风
		},
	},
	{ -- 哈兰·斯威提
		id = 126983,
		img = 1778347,
		alerts = {
			AlertIcon = {
				["1754_cast_no_257402"] = {}, -- 注铅骰子：全体听令！
				["1754_cast_no_257458"] = {}, -- 注铅骰子：战舰
				["1754_cast_no_257278"] = {}, -- 疾风军刀
				["1754_cast_no_257316"] = {}, -- 来人，上！
				["1754_aura_no_257305"] = {"HARMFUL", "player"}, -- 火炮弹幕
			},
			PlateAlert = {
				[257278] = "PlateSpells", -- 疾风军刀
			},
		},
		cd = {
			[257278] = 16, -- 疾风军刀
		},
	},
	{ -- 铁潮掷弹兵
		id = 129758,
		alerts = {
			AlertIcon = {
				["1754_aura_no_257314"] = {"HARMFUL", "player"}, -- 黑火药炸弹	
			},
			HLOnRaid = {
				["1754_257314_c"] = "HL_Auras", -- 黑火药炸弹
			},			
		},
	},
	{ -- 歹徒诱捕者
		id = 130404,
		alerts = {
			AlertIcon = {
				["1754_aura_no_274389"] = {"HARMFUL", "player"}, -- 捕鼠陷阱
			},
			PlateAlert = {
				[274383] = "PlateSpells", -- 捕鼠陷阱
			},
		},
		cd = {
			[274383] = 20, --捕鼠陷阱
		},
	},
	{ -- 水鼠帮健步者
		id = 129550,
		alerts = {
			AlertIcon = {
				["1754_aura_no_257775"] = {"HARMFUL", "player"}, -- 瘟疫步
			},	
		},
	},
	{ -- 水鼠帮水兵
		id = 129526,
		alerts = {
			AlertIcon = {
				["1754_aura_no_274507"] = {"HARMFUL", "player"}, -- 湿滑肥皂
			},
			PlateAlert = {
				[274507] = "PlateSpells", -- 湿滑肥皂
			},
		},
		cd = {
			[274507] = 23, -- 湿滑肥皂
		},
	},
	{ -- 水鼠帮海盗
		id = 129527,
		alerts = {
			PlateAlert = {
				[257756] = "PlateSpells", -- “蕉”燥狂攻
			},
		},
		cd = {
			[257756] = 19, --  “蕉”燥狂攻
		},
	},
	{ -- 水鼠帮盐鳞战士
		id = 129600,
		alerts = {
			AlertIcon = {
				["1754_com_no_257784"] = {}, -- 冰霜冲击
				["1754_com_no_281420"] = {}, -- 水箭
			},
			HLOnRaid = {
				["1754_257784_c"] = "HL_Casting", -- 冰霜冲击
			},
			PlateAlert = {
				[257784] = "PlateSpells", -- 冰霜冲击
				[281420] = "PlateSpells", -- 水箭	
			},
		},
		cd = {
			[257784] = 24, -- 冰霜冲击
			[281420] = 1, -- 水箭	
		},
	},
	{ -- 湿乎乎的舱底鼠
		id = 130024,
		alerts = {
			AlertIcon = {
				["1754_aura_no_274555"] = {"HARMFUL", "player"}, -- 污染之咬
			},
			PlateAlert = {
				[257476] = "PlateAuras", -- 狂野怒火
			},
		},
	},
	{ -- 破浪格斗家
		id = 129559,
		alerts = {
			AlertIcon = {
				["1754_com_no_274400"] = {}, -- 决斗冲刺
			},
			HLOnRaid = {
				["1754_274400_c"] = "HL_Casting", -- 决斗冲刺
			},
			PlateAlert = {
				[274400] = "PlateSpells", -- 决斗冲刺
			},
		},
		cd = {
			[274400] = 13, -- 决斗冲刺
		},
	},
	{ -- 破浪飞刀手
		id = 129599,
		alerts = {
			AlertIcon = {
				["1754_com_no_272402"] = {}, -- 飞刃投掷
			},
			HLOnRaid = {
				["1754_272402_c"] = "HL_Casting", -- 飞刃投掷
			},
			PlateAlert = {
				[272402] = "PlateSpells", -- 飞刃投掷
			},
		},
		cd = {
			[272402] = 8, -- 飞刃投掷
		},
	},
	{ -- 路德维希·冯·托尔托伦
		id = 129699,
		alerts = {
			PlateAlert = {
				[257904] = "PlateSpells", -- 弹跳龟壳
			},
		},
		cd = {
			[257904] = 8, -- 弹跳龟壳
		},
	},
	{ -- 铁潮冒险家
		id = 130011,
		alerts = {
			PlateAlert = {
				[257870] = "PlateSpells", -- 利刃弹幕
			},
		},
		cd = {
			[257870] = 17, -- 利刃弹幕
		},
	},
	{ -- 铁潮军官
		id = 127106,
		alerts = {
			AlertIcon = {
				["1754_aura_no_257908"] = {"HARMFUL", "player"}, -- 浸油之刃
			},
		},
	},
	{ -- 铁潮唤雷者
		id = 126919,
		alerts = {
			AlertIcon = {
				["1754_com_no_259092"] = {}, -- 闪电箭
			},
			HLOnRaid = {
				["1754_259092_c"] = "HL_Casting", -- 闪电箭
			},
			PlateAlert = {
				[259092] = "PlateSpells", -- 闪电箭
				[257736] = "PlateSpells", -- 风啸雷鸣
			},
		},
		cd = {
			[259092] = 1, -- 闪电箭
			[257736] = 20, -- 风啸雷鸣
		},
	},
	{ -- 铁潮打击者
		id = 130400,
		alerts = {
			PlateAlert = {
				[258181] = "PlateSpells", -- 投掷巨石
				[258199] = "PlateSpells", -- 碎地	
			},
		},
		cd = {
			[258181] = 11, -- 投掷巨石
			[258199] = 8, -- 碎地	
		},
	},
	{ -- 铁潮执行者
		id = 129602,
		alerts = {
			AlertIcon = {
				["1754_com_no_274860"] = {}, -- 破碎投掷
			},
			HLOnRaid = {
				["1754_274860_c"] = "HL_Casting", -- 破碎投掷
			},
			PlateAlert = {
				[257426] = "PlateSpells", -- 反手猛击
				[274860] = "PlateSpells", -- 破碎投掷
			},
		},
		cd = {
			[257426] = 18, -- 反手猛击
			[274860] = 19, -- 破碎投掷
		},
	},
	{ -- 铁潮桨手	
		id = 127111,
		alerts = {
			PlateAlert = {
				[258777] = "PlateSpells", -- 海流喷射
			},
		},
		cd = {
			[258777] = 19, -- 海流喷射
		},
	},
	{ -- 铁潮海盗	
		id = 126928,
		alerts = {
			AlertIcon = {
				["1754_aura_no_257437"] = {"HARMFUL", "player"}, -- 毒性打击	
			},
		},
	},
	{ -- 铁潮猎犬	
		id = 128551,
		alerts = {
			AlertIcon = {
				["1754_com_no_257478"] = {}, -- 减速撕咬
				["1754_aura_no_257478"] = {"HARMFUL", "player"}, -- 减速撕咬
			},
			HLOnRaid = {
				["1754_257478_c"] = "HL_Casting", -- 减速撕咬
			},
			PlateAlert = {
				[257478] = "PlateSpells", -- 减速撕咬
			},
		},
		cd = {
			[257478] = 16, -- 减速撕咬
		},
	},
	{ -- 铁潮破坏者
		id = 130012,
		alerts = {		
			PlateAlert = {
				[257899] = "PlateAuras", -- 痛苦的激励
			},
		},
	},
	{ -- 铁潮锯骨者
		id = 129788,
		alerts = {
			AlertIcon = {
				["1754_aura_no_258323"] = {"HARMFUL", "player"}, -- 感染之伤
			},
			PlateAlert = {
				[257397] = "PlateAuras", -- 治疗药膏
			},
		},
	},
	{ -- 黑齿拳手	
		id = 129547,
		alerts = {
			PlateAlert = {
				[257732] = "PlateSpells", -- 震耳咆哮
			},
		},
		cd = {
			[257732] = 28, -- 震耳咆哮
		},
	},
	{ -- 黑齿暴徒	
		id = 129548,
		alerts = {
			AlertIcon = { 
				["1754_aura_no_257747"] = {"HARMFUL", "player"}, -- 撼地者
			},
		},
	},
	{ -- 黑齿格斗家
		id = 129529,
		alerts = {
			AlertIcon = {
				["1754_com_no_257739"] = {}, -- 盲目怒火
				["1754_aura_no_257739"] = {"HARMFUL", "player"}, -- 盲目怒火
			},
			HLOnRaid = {
				["1754_257739_c"] = "HL_Casting", -- 盲目怒火
			},
			PlateAlert = {
				[257739] = "PlateSpells", -- 盲目怒火
			},
		},
		cd = {
			[257739] = 32, --盲目怒火
		},
	},
}

G.Dungeons[1036] = { -- 风暴神殿
	{ -- 阿库希尔
		id = 134056,
		img = 2176712,
		alerts = {
			AlertIcon = {
				["1864_com_no_264560"] = {}, -- 窒息海潮
				["1864_cast_no_264101"] = {}, -- 踏浪冲锋
				["1864_cast_no_264477"] = {}, -- 深海之握
				["1864_cast_no_264903"] = {}, -- 喷发之水 
			},
			HLOnRaid = {
				["1864_264560_c"] = "HL_Casting", -- 窒息海潮
			},
			PlateAlert = {
				[264560] = "PlateSpells", -- 窒息海潮
				[264101] = "PlateSpells", -- 踏浪冲锋
			},
		},
		cd = {
			[264560] = 15, -- 窒息海潮
			[264101] = 15, -- 踏浪冲锋
		},
	},
	{ -- 铁舟修士				
		id = 134063,
		img = 2176754,
		alerts = {
			AlertIcon = {
				["1864_com_no_267899"] = {}, -- 妨害劈斩
				["1864_cast_no_267905"] = {}, -- 铁墙祝福
				["1864_aura_no_267899"] = {"HARMFUL", "player"}, -- 妨害劈斩
			},
			HLOnRaid = {
				["1864_267899_c"] = "HL_Casting", -- 妨害劈斩
			},
			PlateAlert = {
				[267899] = "PlateSpells", -- 妨害劈斩
				[267905] = "PlateAuras", -- 强化结界
				[267901] = "PlateAuras", -- 铁墙祝福
			},
		},
		cd = {
			[267899] = 18, -- 妨害劈斩
		},
	},
	{ -- 唤风者菲伊				
		id = 134058,
		alerts = {
			AlertIcon = {
				["1864_cast_no_267818"] = {}, -- 切割冲击
				["1864_cast_no_267891"] = {}, -- 迅捷结界
				["1864_aura_no_267818"] = {"HARMFUL", "player"}, -- 切割冲击
			},
			PlateAlert = {
				[267891] = "PlateAuras", -- 迅捷结界
				[267830] = "PlateAuras", -- 风暴祝福
			},
		},
	},
	{ -- 斯托颂勋爵				
		id = 134060,
		img = 2176737,
		alerts = {
			AlertIcon = {
				["1864_com_no_268347"] = {}, -- 虚空箭
				["1864_cast_no_269131"] = {}, -- 上古摧心者
				["1864_cast_no_269097"] = {}, -- 唤醒虚空
				["1864_aura_no_269131"] = {"HARMFUL", "player"}, -- 上古摧心者	
				["1864_aura_no_268896"] = {"HARMFUL", "player"}, -- 心灵撕裂	
			},
			HLOnRaid = {
				["1864_268347_c"] = "HL_Casting", -- 虚空箭
			},
			PlateAlert = {
				[269131] = "PlateSpells", -- 上古摧心者	
				[269097] = "PlateSpells", -- 唤醒虚空	
			},
		},
		cd = {
			[269131] = 1, -- 上古摧心者	
			[269097] = 1, -- 唤醒虚空	
		},
	},
	


	

	{ -- 低语者沃尔兹斯			
		id = 134069,
		img = 2176759,
		alerts = {
			AlertIcon = {
				["1864_com_no_267034"] = {}, -- 力量的低语
				["1864_cast_no_267299"] = {}, -- 召唤深渊		
				["1864_cast_no_269399"] = {}, -- 巨口之门	
				["1864_cast_no_267360"] = {}, -- 沉没之城的掌控
				["1864_aura_no_267037"] = {"HARMFUL", "player"}, -- 力量的低语
				["1864_aura_no_269419"] = {"HARMFUL", "player"}, -- 巨口之门
			},
			HLOnRaid = {
				["1864_267034_c"] = "HL_Casting", -- 力量的低语
			},
			PlateAlert = {
				[267034] = "PlateSpells", -- 力量的低语
				[269399] = "PlateSpells", -- 巨口之门
				[267299] = "PlateAuras", -- 召唤深渊
				[267360] = "PlateAuras", -- 沉没之城的掌控
			},
		},
		cd = {
			[267034] = 60, -- 力量的低语
			[269399] = 58, -- 巨口之门
		},
	},
	{ -- 元素卫士				
		id = 136249,
		alerts = {
			AlertIcon = {
				["1864_com_no_268233"] = {}, -- 电化震击
			},
			HLOnRaid = {
				["1864_268233_c"] = "HL_Casting", -- 电化震击
			},
			PlateAlert = {
				[268233] = "PlateSpells", -- 电化震击
				[268239] = "PlateSpells", -- 毁舰风暴
			},
		},
		cd = {
			[268233] = 17, -- 电化震击
			[268239] = 13, -- 毁舰风暴
		},
	},
	{ -- 刻符者食客				
		id = 134150,
		alerts = {
			AlertIcon = {
				["1864_com_no_268214"] = {}, -- 割肉
			},
			HLOnRaid = {
				["1864_268214_c"] = "HL_Casting", -- 割肉
			},
			PlateAlert = {
				[268214] = "PlateSpells", -- 割肉		
				[268211] = "PlateSpells", -- 小型强化结界
			},
		},
		cd = {
			[268214] = 10, -- 割肉		
			[268211] = 24, -- 小型强化结界
		},
	},
	{ -- 唤风者学徒				
		id = 139800,
		alerts = {
			PlateAlert = {
				[276282] = "PlateSpells", -- 切割旋风
				[274434] = "PlateSpells", -- 狂风切削
				[274437] = "PlateSpells", -- 风暴	
			},
		},
		cd = {
			[276282] = 15, -- 切割旋风
			[274434] = 20, -- 狂风切削
			[274437] = 15, -- 风暴	
		},
	},
	{ -- 小型水元素				
		id = 134828,
		alerts = {
			AlertIcon = {
				["1864_com_no_265001"] = {}, -- 海洋冲击
				["1864_com_no_264144"] = {}, -- 逆流	
				["1864_com_no_264166"] = {}, -- 逆流	
			},
			HLOnRaid = {
				["1864_265001_c"] = "HL_Casting", -- 海洋冲击
				["1864_264144_c"] = "HL_Casting", -- 逆流	
				["1864_264166_c"] = "HL_Casting", -- 逆流	
			},
		},
		cd = {
			[264477] = 1, -- 深海之握
			[264560] = 1, -- 窒息海潮
			[264101] = 1, -- 踏浪冲锋
		},
	},	
	{ -- 活体激流				
		id = 134144,
		alerts = {
			PlateAlert = {
				[268027] = "PlateSpells", -- 涨潮	
				[268028] = "PlateSpells", -- 粉碎之水
			},
		},
		cd = {
			[268027] = 1, -- 涨潮	
			[268028] = 1, -- 粉碎之水
		},
	},
	{ -- 海贤执行者				
		id = 134338,
		alerts = {
			PlateAlert = {
				[268273] = "PlateSpells", -- 深海猛砸
			},
		},
		cd = {
			[268273] = 8, -- 深海猛砸
		},
	},
	{ -- 海贤灵魂师				
		id = 136186,
		alerts = {
			PlateAlert = {
				[276265] = "PlateAuras", -- 身手矫健
				[268050] = "PlateSpells", -- 束缚之锚
				[268030] = "PlateSpells", -- 治疗湍流
			},
		},
		cd = {
			[268050] = 8, -- 束缚之锚
			[268030] = 1, -- 治疗湍流
		},
	},
	
	

	{ -- 深海祭师				
		id = 134417,
		alerts = {
			AlertIcon = {
				["1864_aura_no_276297"] = {"HARMFUL", "player"}, -- 虚空种子
			},
			PlateAlert = {
				[268309] = "PlateSpells", -- 无尽黑暗
				[276297] = "PlateSpells", -- 虚空种子
			},
		},
		cd = {
			[268309] = 5, -- 无尽黑暗
			[276297] = 20, -- 虚空种子
		},
	},
	{ -- 深渊居住者				
		id = 134423,
		alerts = {
			AlertIcon = {
				["1864_com_no_268315"] = {}, -- 鞭笞
			},
			HLOnRaid = {
				["1864_268315_c"] = "HL_Casting", -- 鞭笞
			},
			PlateAlert = {
				[274212] = "PlateSpells", -- 释放黑暗
				[268315] = "PlateSpells", -- 鞭笞	
			},
		},
		cd = {
			[274212] = 1, --  释放黑暗
			[268315] = 1, --  鞭笞	
		},
	},
	{ -- 深渊祭师				
		id = 134514,
		alerts = {
			PlateAlert = {
				[276767] = "PlateAuras", -- 吞噬虚空
				[268391] = "PlateSpells", -- 心智突袭
				[268375] = "PlateAuras", -- 探测思维
			},
		},
		cd = {
			[268391] = 20, -- 心智突袭 
		},
	},
	{ -- 深渊鳗鱼				
		id = 140038,
		alerts = {
			AlertIcon = {
				["1864_aura_no_274720"] = {"HARMFUL", "player"}, -- 深渊打击	
			},
		},
	},
	{ -- 溺水的深渊使者			
		id = 134418,
		alerts = {
			AlertIcon = {
				["1864_com_no_274703"] = {}, -- 虚空箭
				["1864_aura_no_268317"] = {"HARMFUL", "player"}, -- 撕裂大脑	
				["1864_aura_no_268322"] = {"HARMFUL", "player"}, -- 溺毙者之触	
			},
			HLOnRaid = {
				["1864_274703_c"] = "HL_Casting", -- 虚空箭
			},
		},
	},
	{ -- 神殿侍从			
		id = 134137,
		alerts = {
			AlertIcon = {
				["1864_com_no_267969"] = {}, -- 水之冲击
			},
			HLOnRaid = {
				["1864_267969_c"] = "HL_Casting", -- 水之冲击
			},
			PlateAlert = {
				[267973] = "PlateSpells", -- 冲刷
			},
		},
		cd = {
			[267973] = 20, -- 冲刷
		},
	},
	{ -- 神殿骑士			
		id = 134139,
		alerts = {
			PlateAlert = {
				[276268] = "PlateSpells", -- 沉重打击
				[267977] = "PlateAuras", -- 海潮涌动
				[267981] = "PlateAuras", -- 防护光环
			},
		},
		cd = {
			[276268] = 20, -- 沉重打击
		},
	},
	{ -- 被遗忘的居民			
		id = 136083,
		alerts = {
			PlateAlert = {
				[267459] = "PlateSpells", -- 吞噬精华
			},
		},
		cd = {
			[267459] = 10, --  吞噬精华
		},
	},
	{ -- 被遗忘的居民			
		id = 136297,
		cd = {
			[267459] = 10, --  吞噬精华
		},
	},
	{ -- 触须			
		id = 135987,
		alerts = {
			PlateAlert = {
				[267385] = "PlateSpells", -- 触须猛击
			},
		},
		cd = {
			[267385] = 1, --  触须猛击
		},
	},
	{ -- 铁舟学徒			
		id = 139799,
		alerts = {
			AlertIcon = {
				["1864_com_no_274633"] = {}, -- 碎甲重击
				["1864_aura_no_274633"] = {"HARMFUL", "player"}, -- 碎甲重击
			},
			HLOnRaid = {
				["1864_274633_c"] = "HL_Casting", -- 碎甲重击
			},
			PlateAlert = {
				[276292] = "PlateSpells", -- 旋转猛击
				[274633] = "PlateSpells", -- 碎甲重击
				[274631] = "PlateAuras", -- 次级铁墙祝福
				
			},
		},
		cd = {
			[276292] = 14, --  旋转猛击
			[274633] = 1, --  碎甲重击
		},
	},
	{ -- 风语者海蒂丝			
		id = 136214,
		alerts = {
			AlertIcon = {
				["1864_com_no_268177"] = {}, -- 爆风冲击 
			},
			HLOnRaid = {
				["1864_268177_c"] = "HL_Casting", -- 爆风冲击
			},
			PlateAlert = {
				[268187] = "PlateAuras", -- 阵风
				[268184] = "PlateAuras", -- 小型迅捷结界
				[268177] = "PlateSpells", -- 爆风冲击
			},
		},
		cd = {
			[268177] = 15, --  爆风冲击
		},
	},
}

G.Dungeons[1021] = { -- 维克雷斯庄园
	{ -- 女巫布里亚		
		id = 131825,
		img = 2176732,
		alerts = {
			AlertIcon = {
				["1862_com_no_260701"] = {}, -- 骨刺箭	
				["1862_com_no_260697"] = {}, -- 骨刺箭	
				["1862_com_no_260741"] = {}, -- 锯齿荨麻
				["1862_aura_no_260741"] = {"HARMFUL", "player"}, -- 锯齿荨麻
			},
			HLOnRaid = {
				["1862_260701_c"] = "HL_Casting", -- 骨刺箭	
				["1862_260697_c"] = "HL_Casting", -- 骨刺箭	
				["1862_260741_c"] = "HL_Casting", -- 锯齿荨麻
			},
			PlateAlert = {
				[260701] = "PlateSpells", -- 骨刺箭	
				[260697] = "PlateSpells", -- 骨刺箭	
				[260741] = "PlateSpells", -- 锯齿荨麻
				[261265] = "PlateAuras", -- 铁树皮盾
				[260805] = "PlateAuras", -- 聚焦之虹
				[268122] = "PlateAuras", -- 荆棘光环
				[1] = "PlatePower", -- 能量
			},
		},
		cd = {
			[260701] = 1, -- 骨刺箭	
			[260697] = 1, -- 骨刺箭	
			[260741] = 1, -- 锯齿荨麻
		},
	},
	{ -- 女巫索林娜		
		id = 131824,
		alerts = {
			AlertIcon = {
				["1862_com_no_260699"] = {}, -- 灵魂之箭
				["1862_com_no_260698"] = {}, -- 灵魂之箭
				["1862_cast_no_260907"] = {}, -- 灵魂操控
			},
			HLOnRaid = {
				["1862_260699_c"] = "HL_Casting", -- 灵魂之箭
				["1862_260698_c"] = "HL_Casting", -- 灵魂之箭
			},
			PlateAlert = {
				[260699] = "PlateSpells", -- 灵魂之箭
				[260698] = "PlateSpells", -- 灵魂之箭
				[260907] = "PlateSpells", -- 灵魂操控
				[268077] = "PlateAuras", -- 冷漠光环
				[261264] = "PlateAuras", -- 灵魂护甲
				[260923] = "PlateAuras", -- 灵魂操控
				[1] = "PlatePower", -- 能量
			},
		},
		cd = {
			[260699] = 1, -- 灵魂之箭
			[260698] = 1, -- 灵魂之箭
			[260907] = 1, -- 灵魂操控
		},
	},
	{ -- 女巫马拉迪		
		id = 131823,
		alerts = {
			AlertIcon = {
				["1862_com_no_260700"] = {}, -- 毁灭箭
				["1862_com_no_260696"] = {}, -- 毁灭箭
				["1862_cast_no_260703"] = {}, -- 不稳定的符文印记
				["1862_aura_no_260703"] = {"HARMFUL", "player"}, -- 不稳定的符文印记
			},
			HLOnRaid = {
				["1862_260700_c"] = "HL_Casting", -- 毁灭箭
				["1862_260696_c"] = "HL_Casting", -- 毁灭箭
			},
			PlateAlert = {
				[260700] = "PlateSpells", -- 毁灭箭
				[260696] = "PlateSpells", -- 毁灭箭 
				[260703] = "PlateSpells", --  不稳定的符文印记
				[268088] = "PlateAuras", -- 恐怖光环
				[261266] = "PlateAuras", -- 符文结界
				[1] = "PlatePower", -- 能量
			},
		},
		cd = {
			[260700] = 1, -- 毁灭箭
			[260696] = 1, -- 毁灭箭
			[260703] = 1, -- 不稳定的符文印记
		},
	},
	{ -- 魂缚巨像		
		id = 131667,
		img = 2176747,
		alerts = {
			AlertIcon = {
				["1862_com_no_260508"] = {}, -- 碾压
				["1862_cast_no_260551"] = {}, -- 灵魂荆棘 
			},
			HLOnRaid = {
				["1862_260508_c"] = "HL_Casting", -- 碾压
			},
			PlateAlert = {
				[260508] = "PlateSpells", -- 碾压
				[260551] = "PlateSpells", -- 灵魂荆棘
				[260512] = "PlateAuras", -- 灵魂收割
				[260541] = "PlateAuras", -- 燃火外衣			
			},
		},
		cd = {
			[260508] = 22, -- 碾压
			[260551] = 22, -- 灵魂荆棘
		},
	},
	{ -- 贪食的拉尔		
		id = 131863,
		img = 2176744,
		alerts = {
			AlertIcon = {
				["1862_cast_no_264931"] = {}, -- 召唤仆从
				["1862_cast_no_265002"] = {}, -- 吸收仆从
				["1862_cast_no_264923"] = {}, -- 暴捶	
				["1862_cast_no_264693"] = {}, -- 腐物喷发
			},		
		},
	},
	{ -- 胆汁软泥怪		
		id = 136541,
		alerts = {
			PlateAlert = {
				[268234] = "PlateSpells", -- 胆汁爆炸	

			},
		},
		cd = {
			[268234] = 22, -- 胆汁爆炸
		},
	},
	{ -- 维克雷斯夫人	
		id = 131545,
		img = 2176736,
		alerts = {
			AlertIcon = {
				["1862_com_no_268271"] = {}, -- 剧痛之弦
				["1862_cast_no_261446"] = {}, -- 活力转移
			},
			HLOnRaid = {
				["1862_268271_c"] = "HL_Casting", -- 剧痛之弦
			},
			PlateAlert = {
				[268271] = "PlateSpells", -- 剧痛之弦
				[261446] = "PlateSpells", -- 活力转移
				[268306] = "PlateAuras", -- 不谐乐段
				[271590] = "PlateAuras", -- 灵魂护甲
			},
		},
		cd = {
			[268271] = 1, -- 剧痛之弦
			[261446] = 1, -- 活力转移
		},
	},
	{ -- 维克雷斯勋爵	
		id = 131527,
		alerts = {
			AlertIcon = {
				["1862_com_no_261440"] = {}, -- 恶性病原体	
				["1862_com_no_261438"] = {}, -- 污秽攻击	
				["1862_cast_no_261439"] = {}, -- 恶性病原体
				["1862_aura_no_261440"] = {"HARMFUL", "player"}, -- 恶性病原体	
				["1862_aura_no_261438"] = {"HARMFUL", "player"}, -- 污秽攻击	
			},
			HLOnRaid = {
				["1862_261440_c"] = "HL_Casting", -- 恶性病原体	
				["1862_261438_c"] = "HL_Casting", -- 污秽攻击	
			},
			PlateAlert = {
				[261439] = "PlateSpells", -- 恶性病原体
				[261438] = "PlateSpells", -- 污秽攻击
				[261447] = "PlateAuras", -- 腐败活力
			},
		},
		cd = {
			[261439] = 16, -- 恶性病原体
			[261438] = 1, -- 污秽攻击
		},
	},




	{ -- 高莱克·图尔		
		id = 131864,
		img = 2176729,
		alerts = {
			AlertIcon = {
				["1862_cast_no_266181"] = {}, -- 恐惧精华		
				["1862_cast_no_266266"] = {}, -- 召唤亡触奴隶主	
				["1862_cast_no_266225"] = {}, -- 黑暗闪电		
			},
			PlateAlert = {
				[266181] = "PlateSpells", -- 恐惧精华		
				[266266] = "PlateSpells", -- 召唤亡触奴隶主	
				[266225] = "PlateSpells", -- 黑暗闪电		
			},
		},
		cd = {
			[266181] = 29, -- 恐惧精华		
			[266266] = 19, -- 召唤亡触奴隶主	
			[266225] = 1, -- 黑暗闪电		
		},
	},
	{ -- 亡触奴隶主		
		id = 135552,
		alerts = {
			AlertIcon = {
				["1862_com_no_268202"] = {}, -- 死亡棱镜
				["1862_aura_no_1"] = {"HARMFUL", "player"}, -- 死亡棱镜
			},
			HLOnRaid = {
				["1862_268202_c"] = "HL_Casting", -- 死亡棱镜
			},
			PlateAlert = {
				[268202] = "PlateSpells", -- 死亡棱镜
				[273657] = "PlateSpells", -- 黑暗之跃
			},
		},
		cd = {
			[268202] = 15, -- 死亡棱镜
			[273657] = 10, -- 黑暗之跃
		},
	},
	{ -- 主母布琳德尔	
		id = 135329,
		alerts = {
			PlateAlert = {
				[265759] = "PlateSpells", -- 分裂之刺	
				[265741] = "PlateSpells", -- 吸取灵魂精华
				[265760] = "PlateSpells", -- 荆棘弹幕	
			},
		},
		cd = {
			[265759] = 17, -- 分裂之刺	
			[265741] = 1, --  吸取灵魂精华
			[265760] = 15, -- 荆棘弹幕	
		},
	},
	{ -- 主母阿尔玛		
		id = 135365,
		alerts = {
			AlertIcon = {
				["1862_com_no_265880"] = {}, -- 恐惧印记
				["1862_com_no_265881"] = {}, -- 腐烂之触
				["1862_aura_no_265880"] = {"HARMFUL", "player"}, -- 恐惧印记
				["1862_aura_no_265882"] = {"HARMFUL", "player"}, -- 萦绕恐惧
				["1862_aura_no_265881"] = {"HARMFUL", "player"}, -- 腐烂之触
			},
			HLOnRaid = {
				["1862_265880_c"] = "HL_Casting", -- 恐惧印记
				["1862_265881_c"] = "HL_Casting", -- 腐烂之触
			},
			PlateAlert = {
				[265881] = "PlateSpells", -- 腐烂之触
				[265876] = "PlateSpells", -- 毁灭箭雨
			},
		},
		cd = {
			[265881] = 10, -- 腐烂之触
			[265876] = 30, -- 毁灭箭雨
		},
	},
	{ -- 女巫会占卜者	
		id = 131819,
		alerts = {
			AlertIcon = {
				["1862_aura_no_264378"] = {"HARMFUL", "player"}, -- 碎裂灵魂
			},
			PlateAlert = {
				[264387] = "PlateAuras", -- 消耗灵魂碎片
				[278567] = "PlateAuras", -- 灵魂雕像
				[264384] = "PlateSpells", -- 消耗碎片
				[278551] = "PlateSpells", -- 灵魂雕像
			},
		},
		cd = {
			[264384] = 1, -- 消耗碎片
			[260699] = 8, -- 灵魂之箭
			[278551] = 1, -- 灵魂雕像
		},
	},
	{ -- 女巫会塑棘者	
		id = 131666,
		alerts = {
			AlertIcon = {
				["1862_com_no_264050"] = {}, -- 被感染的荆棘
				["1862_aura_no_264050"] = {"HARMFUL", "player"}, -- 被感染的荆棘
			},
			HLOnRaid = {
				["1862_264050_c"] = "HL_Casting", -- 被感染的荆棘
			},
			PlateAlert = {
				[264038] = "PlateSpells", -- 拔根而起	
				[264050] = "PlateSpells", -- 被感染的荆棘
				[278474] = "PlateSpells", -- 雕像重筑	
			},
		},
		cd = {
			[264038] = 15, -- 拔根而起	
			[264050] = 10, -- 被感染的荆棘
			[278474] = 20, -- 雕像重筑	
		},
	},
	{ -- 宴会招待员		
		id = 131586,
		alerts = {
			HLOnRaid = {
				["1862_265391_c"] = "HL_Cast", -- 肉块风暴
			},
			PlateAlert = {
				[265407] = "PlateSpells", -- 用餐时间
				[265391] = "PlateSpells", -- 肉块风暴
			},
		},
		cd = {
			[265407] = 1, -- 用餐时间
			[265391] = 6, -- 肉块风暴
		},
	},
	{ -- 德鲁斯瓦村民	
		id = 135048,
		alerts = {
			AlertIcon = {
				["1862_com_no_265337"] = {}, -- 鼻拱
			},
			HLOnRaid = {
				["1862_265337_c"] = "HL_Casting", -- 鼻拱
			},
			PlateAlert = {
				[265337] = "PlateSpells", -- 鼻拱
			},
		},
		cd = {
			[265337] = 6, -- 鼻拱
		},
	},
	{ -- 恐翼渡鸦		
		id = 135049,
		alerts = {
			AlertIcon = {
				["1862_com_no_265347"] = {}, -- 啄击	
				["1862_com_no_265346"] = {}, -- 苍白注视 
			},
			HLOnRaid = {
				["1862_265347_c"] = "HL_Casting", -- 啄击	
				["1862_265346_c"] = "HL_Casting", -- 苍白注视
			},
			PlateAlert = {
				[265347] = "PlateSpells", -- 啄击	
				[265346] = "PlateSpells", -- 苍白注视
			},
		},
		cd = {
			[265347] = 8, -- 啄击	
			[265346] = 20, -- 苍白注视 
		},
	},
	{ -- 显眼的女巫		
		id = 131818,
		alerts = {
			AlertIcon = {
				["1862_com_no_264105"] = {}, -- 符文印记
				["1862_aura_no_264105"] = {"HARMFUL", "player"}, -- 符文印记
			},
			HLOnRaid = {
				["1862_264105_c"] = "HL_Casting", -- 符文印记
			},
			PlateAlert = {
				[264105] = "PlateSpells", -- 符文印记
				[264110] = "PlateSpells", -- 黑刃	
			},
		},
		cd = {
			[264105] = 8, -- 符文印记
			[264110] = 20, -- 黑刃	
		},
	},
	{ -- 染病斗牛犬		
		id = 135234,
		alerts = {
			PlateAlert = {
				[265642] = "PlateSpells", -- 疫病咀嚼
			},
		},
		cd = {
			[265642] = 8, -- 疫病咀嚼
		},
	},	
	{ -- 棘刺助祭		
		id = 135474,
		alerts = {
			AlertIcon = {
				["1862_com_no_266036"] = {}, -- 吸取精华
				["1862_com_no_266035"] = {}, -- 碎骨片	
				["1862_com_no_263891"] = {}, -- 缠绕荆棘
				["1862_aura_no_266035"] = {"HARMFUL", "player"}, -- 碎骨片	
				["1862_aura_no_263891"] = {"HARMFUL", "player"}, -- 缠绕荆棘
			},
			HLOnRaid = {
				["1862_266036_c"] = "HL_Casting", -- 吸取精华
				["1862_266035_c"] = "HL_Casting", -- 碎骨片	
				["1862_263891_c"] = "HL_Casting", -- 缠绕荆棘
			},
			PlateAlert = {
				[266036] = "PlateSpells", -- 吸取精华
				[278504] = "PlateSpells", -- 晋升仪式
				[266035] = "PlateSpells", -- 碎骨片	
				[263891] = "PlateSpells", -- 缠绕荆棘
				[263899] = "PlateSpells", -- 锯齿抓挠
			},
		},
		cd = {
			[266036] = 20, -- 吸取精华
			[278504] = 1, -- 晋升仪式
			[266035] = 10, -- 碎骨片	
			[263891] = 10, -- 缠绕荆棘
			[263899] = 5, -- 锯齿抓挠
		},
	},
	{ -- 灵魂精华		
		id = 135240,
		alerts = {
			AlertIcon = {
				["1862_com_no_267824"] = {}, -- 灵魂创伤
			},
			HLOnRaid = {
				["1862_267824_c"] = "HL_Casting", -- 灵魂创伤
			},
			PlateAlert = {
				[267824] = "PlateSpells", -- 灵魂创伤
			},
		},
		cd = {
			[267824] = 13, -- 灵魂创伤
		},
	},
	{ -- 疯狂的生存专家	
		id = 131850,
		alerts = {
			AlertIcon = {
				["1862_aura_no_264520"] = {"HARMFUL", "player"}, -- 切裂蛇斩
			},
			PlateAlert = {
				[278463] = "PlateSpells", -- 冰冻陷阱
				[264520] = "PlateSpells", -- 切裂蛇斩
				[264525] = "PlateSpells", -- 破片陷阱
			},
		},
		cd = {
			[278463] = 1, -- 冰冻陷阱
			[264520] = 1, -- 切裂蛇斩
			[264525] = 1, -- 破片陷阱
		},
	},
	{ -- 瘟疫蟾蜍		
		id = 135052,
		alerts = {
			AlertIcon = {
				["1862_com_no_265364"] = {}, -- 疫病之舌
			},
			HLOnRaid = {
				["1862_265364_c"] = "HL_Casting", -- 疫病之舌
			},
			PlateAlert = {
				[265352] = "PlateSpells", -- 蟾蜍疫病
			},
		},
		cd = {
			[265352] = 1, -- 蟾蜍疫病
		},
	},
	{ -- 着魔的队长		
		id = 131587,
		alerts = {
			AlertIcon = {
				["1862_com_no_265371"] = {}, -- 队长之击
			},
			HLOnRaid = {
				["1862_265371_c"] = "HL_Casting", -- 队长之击
			},
			PlateAlert = {
				[265371] = "PlateSpells", -- 队长之击
				[265368] = "PlateAuras", -- 灵魂防御
				[264027] = "PlateAuras", -- 结界蜡烛
			},
		},
		cd = {
			[265371] = 8, -- 队长之击
		},
	},
	{ -- 符文信徒		
		id = 131685,
		alerts = {
			AlertIcon = {
				["1862_com_no_264390"] = {}, -- 法术禁锢
				["1862_aura_no_264390"] = {"HARMFUL", "player"}, -- 法术禁锢
				["1862_aura_no_264396"] = {"HARMFUL", "player"}, -- 鬼灵护符
			},
			HLOnRaid = {
				["1862_264390_c"] = "HL_Casting", -- 法术禁锢
			},
			PlateAlert = {
				[264390] = "PlateSpells", -- 法术禁锢
				[264396] = "PlateSpells", -- 鬼灵护符
			},
		},
		cd = {
			[264390] = 12, -- 法术禁锢
			[264396] = 23, -- 鬼灵护符
		},
	},
	{ -- 维克雷斯狂欢者	
		id = 131847,
		alerts = {
			PlateAlert = {
				[265410] = "PlateSpells", -- 击打
			},
		},
		cd = {
			[265410] = 7, -- 击打
		},
	},
	
	
	

	{ -- 苍白吞噬者		
		id = 137830,
		alerts = {
			PlateAlert = {
				[271174] = "PlateSpells", -- 呕吐	
				[271175] = "PlateSpells", -- 掠食之跃
			},
		},
		cd = {
			[271174] = 15, -- 呕吐	
			[271175] = 25, -- 掠食之跃
		},
	},
	{ -- 荆棘卫士		
		id = 131858,
		alerts = {
			PlateAlert = {
				[264150] = "PlateSpells", -- 击碎	
				[264556] = "PlateSpells", -- 刺裂打击
				[257260] = "PlateAuras", -- 激怒	
			},
		},
		cd = {
			[264150] = 15, -- 击碎	
			[264556] = 25, -- 刺裂打击
		},
	},
	{ -- 被奴役的卫士	
		id = 131585,
		alerts = {
			AlertIcon = {
				["1862_com_no_265372"] = {}, -- 暗影顺劈

			},
			PlateAlert = {
				[265372] = "PlateSpells", -- 暗影顺劈

			},
		},
		cd = {
			[265372] = 8, -- 暗影顺劈
		},
	},
	{ -- 被感染的农夫	
		id = 134041,
		alerts = {
			PlateAlert = {
				[264655] = "PlateSpells", -- 枯萎之球
			},
		},
		cd = {
			[264655] = 8, -- 枯萎之球
		},
	},
	{ -- 锯齿猎犬		
		id = 131669,
		alerts = {
			PlateAlert = {
				[264140] = "PlateSpells", -- 荆棘之爪	
			},
		},
		cd = {
			[264140] = 8, -- 荆棘之爪
		},
	},
	{ -- 阴森恐魔		
		id = 139269,
		alerts = {
			AlertIcon = {
				["1862_com_no_273653"] = {}, --暗影爪击 
			},
			HLOnRaid = {
				["1862_273653_c"] = "HL_Casting", -- 暗影爪击
			},
			PlateAlert = {
				[273653] = "PlateSpells", -- 暗影爪击
			},
		},
		cd = {
			[273653] = 12, -- 暗影爪击
			[273657] = 10, -- 黑暗之跃
		},
	},
}

G.Dungeons[968] = { -- 阿塔达萨
	{ -- 女祭司阿伦扎
		id = 122967,
		img = 1778348,
		alerts = {
			AlertIcon = {
				["1763_com_no_255836"] = {}, -- 鲜血灌注
				["1763_com_no_255579"] = {}, -- 镀金之爪	
				["1763_com_no_255591"] = {}, -- 熔化的黄金
				["1763_aura_no_255558"] = {"HARMFUL", "player"}, -- 污血
				["1763_aura_no_255836"] = {"HARMFUL", "player"}, -- 鲜血灌注
				["1763_aura_no_255582"] = {"HARMFUL", "player"}, -- 熔化的黄金
				["1763_aura_no_258709"] = {"HARMFUL", "player"}, -- 腐化的黄金
			},
			PlateAlert = {
				[255577] = "PlateAuras", -- 鲜血灌注
				[255579] = "PlateAuras", -- 镀金之爪
			},
		},
	},	
	{ -- 沃卡尔
		id = 122965,
		img = 1778352,
		alerts = {
			AlertIcon = {
				["1763_com_no_259572"] = {}, -- 恶毒臭气
				["1763_com_no_250258"] = {}, -- 剧毒跳碾
				["1763_aura_no_250372"] = {"HARMFUL", "player"}, -- 挥之不去的恶心感
			},
			PlateAlert = {
				[250192] = "PlateAuras", -- 强效巫毒
				[250241] = "PlateAuras", -- 急速凋零
				[259572] = "PlateAuras", -- 恶毒臭气
			},
		},
	},
	{ -- 莱赞
		id = 122963,
		img = 1778349,
		alerts = {
			AlertIcon = {
				["1763_com_no_257407"] = {}, -- 追踪
				["1763_cast_no_255371"] = {}, -- 恐惧之面
				["1763_aura_no_257407"] = {"HARMFUL", "player"}, -- 追踪
				["1763_aura_no_255434"] = {"HARMFUL", "player"}, -- 锯齿
			},
			HLOnRaid = {
				["1763_257407_c"] = "HL_Casting", -- 追踪
				["1763_255421_c"] = "HL_Casting", -- 吞噬
			},
			PlateAlert = {
				[255421] = "PlateAuras", -- 吞噬
				[257407] = "PlateSpells", -- 追踪	
				[255371] = "PlateSpells", -- 恐惧之面
			},
		},
		cd = {
			[257407] = 1, -- 追踪	
			[255371] = 35, -- 恐惧之面
		},
	},
	{ -- 亚兹玛
		id = 122968,
		img = 1778353,
		alerts = {
			AlertIcon = {
				["1763_com_no_249919"] = {}, -- 刺穿
				["1763_cast_no_259187"] = {}, -- 碎魂
				["1763_aura_no_250036"] = {"HARMFUL", "player"}, -- 暗影残留物	
				["1763_aura_no_250096"] = {"HARMFUL", "player"}, -- 毁灭痛苦
			},
			HLOnRaid = {
				["1763_249919_c"] = "HL_Casting", -- 刺穿
			},
			PlateAlert = {
				[259187] = "PlateSpells", -- 碎魂	
				[250096] = "PlateSpells", -- 毁灭痛苦
				[249919] = "PlateSpells", -- 刺穿	
			},
		},
		cd = {
			[259187] = 41, -- 碎魂
			[250096] = 15, -- 毁灭痛苦
			[249919] = 1, -- 刺穿
		},
	},
	{ -- 剧毒细颚龙
		id = 128435,
		alerts = {
			PlateAlert = {
				[251188] = "PlateSpells", -- 腾跃猛击
			},
		},
		cd = {
			[251188] = 3, -- 腾跃猛击
		},
	},
	{ -- 复活的荣誉卫士
		id = 127757,
		alerts = {
			AlertIcon = {
				["1763_aura_no_255814"] = {"HARMFUL", "player"}, -- 撕裂重殴
			},
			PlateAlert = {
				[255814] = "PlateSpells", -- 撕裂重殴
				[256960] = "PlateAuras", -- 腐烂凋零
				
			},
		},
		cd = {
			[255814] = 11, -- 撕裂重殴
		},
	},
	{ -- 影刃追猎者
		id = 122970,
		alerts = {
			AlertIcon = {		
				["1763_aura_no_252687"] = {"HARMFUL", "player"}, -- 毒牙攻击
			},
			PlateAlert = {
				[252687] = "PlateSpells", -- 毒牙攻击
			},
		},
		cd = {
			[252687] = 16, -- 毒牙攻击
		},
	},
	{ -- 祖尔的持盾卫士
		id = 127879,
		alerts = {
			PlateAlert = {
				[273185] = "PlateSpells", -- 盾击
				[258653] = "PlateAuras", -- 魂能壁垒
			},
		},
		cd = {
			[273185] = 12, -- 盾击
		},
	},
	{ -- 赞枢利巫医
		id = 122969,
		alerts = {
			AlertIcon = {	
				["1763_aura_no_252781"] = {"HARMFUL", "player"}, -- 不稳定的妖术
				["1763_com_no_252923"] = {}, -- 剧毒冲击
			},
			HLOnRaid = {
				["1763_252923_c"] = "HL_Casting", -- 剧毒冲击
			},
			PlateAlert = {
				[252781] = "PlateSpells", -- 不稳定的妖术
				[252923] = "PlateSpells", -- 剧毒冲击

			},
		},
		cd = {
			[252781] = 30, -- 不稳定的妖术
			[252923] = 1, -- 剧毒冲击
		},
	},
	{ -- 达萨莱占卜师
		id = 122972,
		alerts = {
			AlertIcon = {
				["1763_com_no_253562"] = {}, -- 野火
			},
			HLOnRaid = {
				["1763_253562_c"] = "HL_Casting", -- 野火
			},
			PlateAlert = {
				[253583] = "PlateAuras", --火焰附魔
				[253562] = "PlateSpells", -- 野火
			},
		},
		cd = {
			[253562] = 1, -- 野火
		},
	},
	{ -- 达萨莱战神
		id = 122971,
		alerts = {
			PlateAlert = {
				[255824] = "PlateAuras", -- 狂信者之怒
				[253239] = "PlateSpells", -- 暴戾突袭
			},
		},
		cd = {
			[253239] = 1, -- 暴戾突袭
		},
	},
	{ -- 达萨莱荣誉卫士
		id = 127799,
		alerts = {
			PlateAlert = {
				[256138] = "PlateSpells", -- 狂热打击

			},
		},
		cd = {
			[256138] = 22, -- 狂热打击
		},
	},
	{ -- 鎏金女祭司
		id = 132126,
		alerts = {
			AlertIcon = {
				["1763_aura_no_260666"] = {"HARMFUL", "player"}, -- 鲜血灌注	
			},
			PlateAlert = {
				[260666] = "PlateSpells", -- 鲜血灌注	
			},
		},
		cd = {
			[260666] = 22, -- 鲜血灌注	
		},
	},
	{ -- 飨宴的啸天龙
		id = 128434,
		alerts = {
			PlateAlert = {
				[255041] = "PlateSpells", -- 惊骇尖啸
			},
		},
		cd = {
			[255041] = 20, -- 惊骇尖啸
		},
	},
	{ -- 达萨莱巨像
		id = 122984,
		alerts = {
			PlateAlert = {
				[254958] = "PlateAuras", -- 聚集灵魂
			},
		},
	},
	{ -- 达萨莱神官
		id = 122973,
		alerts = {
			PlateAlert = {
				[253544] = "PlateSpells", -- 邦桑迪的帷幕
				[253517] = "PlateSpells", -- 愈合真言
			},
		},
		cd = {
			[253544] = 15, -- 邦桑迪的帷幕
			[253517] = 1, -- 愈合真言
		},
	},
	{ -- 蒙祖米
		id = 129552,
		alerts = {
			PlateAlert = {
				[256882] = "PlateSpells", -- 狂野鞭笞
			},
		},
		cd = {
			[256882] = 1, -- 惊骇尖啸
		},
	},
	{ -- 特隆加
		id = 128455,
		alerts = {
			PlateAlert = {
				[265541] = "PlateSpells", -- 狂暴冲锋
			},
		},
		cd = {
			[265541] = 1, -- 狂暴冲锋
		},
	},
	{ -- 恐龙头领吉什奥
		id = 129553,
		alerts = {
			PlateAlert = {
				[256849] = "PlateSpells", -- 史前巨兽
			},
		},
		cd = {
			[256849] = 1, -- 史前巨兽
		},
	},
}

G.Dungeons[1022] = { -- 地渊孢林
	{ -- 长者莉娅克萨
		id = 131318,
		img = 2176724,
		alerts = {
			AlertIcon = {
				["1841_com_no_260879"] = {}, -- 噬血箭
				["1841_cast_no_260894"] = {}, -- 蔓延腐化
				["1841_cast_no_264757"] = {}, -- 喋血盛筵
				["1841_cast_no_264603"] = {}, -- 血之镜像
				["1841_aura_no_260685"] = {"HARMFUL", "player"}, -- 戈霍恩之蚀
			},
			HLOnRaid = {
				["1841_260879_c"] = "HL_Casting", -- 噬血箭
			},
			PlateAlert = {
				[260879] = "PlateSpells", -- 噬血箭	
				[260894] = "PlateSpells", -- 蔓延腐化
				[264757] = "PlateSpells", -- 喋血盛筵
				[264603] = "PlateSpells", -- 血之镜像
			},
		},
		cd = {
			[260879] = 1, -- 噬血箭	
			[260894] = 16, -- 蔓延腐化
			[264757] = 32, -- 喋血盛筵
			[264603] = 47, -- 血之镜像
		},
	},
	{ -- 鲜血雕像				
		id = 134701,
		cd = {
			[260879] = 1, -- 噬血箭	
			[260894] = 16, -- 蔓延腐化
			[264757] = 32, -- 喋血盛筵
		},
	},	
	{ -- 被感染的岩喉			
		id = 131817,
		img = 2176719,
		alerts = {
			AlertIcon = {
				["1841_cast_no_260793"] = {}, -- 消化不良
				["1841_cast_no_260292"] = {}, -- 冲锋	
				["1841_cast_no_260333"] = {}, -- 发脾气	
			},
			PlateAlert = {
				[260793] = "PlateSpells", -- 消化不良
				[260292] = "PlateSpells", -- 冲锋	
				[260333] = "PlateSpells", -- 发脾气	
				[1] = "PlatePower", -- 能量
			},
		},
		cd = {
			[260793] = 40, -- 消化不良
			[260292] = 35, -- 冲锋	
			[260333] = 1, -- 发脾气	
		},
	},
	{ -- 血虱					
		id = 132051,
		alerts = {
			AlertIcon = {
				["1841_aura_no_260455"] = {"HARMFUL", "player"}, -- 锯齿利牙
			},
		},
	},
	{ -- 孢子召唤师赞查			
		id = 131383,
		img = 2176748,
		alerts = {
			AlertIcon = {
				["1841_cast_no_259732"] = {}, -- 溃烂收割
				["1841_cast_no_277732"] = {}, -- 无边腐烂
				["1841_cast_no_259830"] = {}, -- 无边腐烂
				["1841_cast_no_272457"] = {}, -- 震荡波
				["1841_aura_no_259718"] = {"HARMFUL", "player"}, -- 颠覆	
				["1841_aura_no_273226"] = {"HARMFUL", "player"}, -- 腐烂孢子
			},
			PlateAlert = {
				[259732] = "PlateSpells", -- 溃烂收割
				[272457] = "PlateSpells", -- 震荡波
				[1] = "PlatePower", -- 能量
			},
		},
		cd = {
			[259732] = 1, -- 溃烂收割
			[272457] = 15, -- 震荡波
		},
	},
	{ -- 不羁畸变怪				
		id = 133007,
		img = 2176756,
		alerts = {
			AlertIcon = {
				["1841_cast_no_269843"] = {}, -- 邪恶污染				
				["1841_aura_no_269301"] = {"HARMFUL", "player"}, -- 腐败之血
			},
			HLOnRaid = {
				--["1841_1_c"] = "HL_Casting", -- 
			},
			PlateAlert = {
				[269843] = "PlateSpells", -- 邪恶污染
				[1] = "PlatePower", -- 能量				
			},
		},
		cd = {
			[269843] = 25, -- 邪恶污染
		},
	},
	{ -- 泰坦守护者赫兹雷尔			
		id = 134419,
		alerts = {
			AlertIcon = {
				["1841_cast_no_269310"] = {}, -- 净化之光	
			},
			PlateAlert = {
				[269406] = "PlateAuras", -- 净化腐化
			},
		},
	},
	{ -- 地渊孢林蜱虫			
		id = 131402,
		alerts = {
			AlertIcon = {
				["1841_aura_no_265533"] = {"HARMFUL", "player"}, -- 鲜血之喉	
			},			
		},
	},
	{ -- 堕落的亡语者			
		id = 134284,
		alerts = {
			PlateAlert = {
				[266209] = "PlateSpells", -- 邪恶狂暴
				[272183] = "PlateSpells", -- 亡者复生
			},	
		},
		cd = {
			[266209] = 17, -- 邪恶狂暴
			[272183] = 27, -- 亡者复生
		},
	},
	{ -- 复活的护卫				
		id = 138338,
		alerts = {
			PlateAlert = {
				[266201] = "PlateAuras", -- 白骨之盾
			},
		},
	},
	{ -- 怪诞恐魔				
		id = 138187,
		alerts = {
			PlateAlert = {
				[272180] = "PlateSpells", -- 湮灭之球
			},
		},
		cd = {
			[272180] = 6, -- 湮灭之球
		},
	},
	{ -- 恶臭蛆虫				
		id = 130909,
		alerts = {
			PlateAlert = {
				[265540] = "PlateSpells", -- 腐化胆汁	
			},
		},
		cd = {
			[265540] = 11, -- 腐化胆汁	
		},
	},
	{ -- 无面腐蚀者				
		id = 138281,
		alerts = {
			AlertIcon = {
				["1841_aura_no_272609"] = {"HARMFUL", "player"}, -- 疯狂凝视
			},
			PlateAlert = {
				[272592] = "PlateSpells", -- 深渊之末
				[272609] = "PlateSpells", -- 疯狂凝视
			},
		},
		cd = {
			[272592] = 1, -- 深渊之末
			[272609] = 1, -- 疯狂凝视
		},
	},
	{ -- 染病鞭笞者				
		id = 133870,
		alerts = {
			AlertIcon = {
				["1841_com_no_278961"] = {}, -- 衰落意志
				["1841_aura_no_278961"] = {"HARMFUL", "player"}, -- 衰落意志
			},
			HLOnRaid = {
				["1841_278961_c"] = "HL_Casting", -- 衰落意志
			},
			PlateAlert = {
				[278961] = "PlateSpells", -- 衰落意志
			},
		},
		cd = {
			[278961] = 14, -- 衰落意志
		},
	},
	{ -- 狂野的群居血虱			
		id = 133835,
		alerts = {
			AlertIcon = {
				["1841_aura_no_266107"] = {"HARMFUL", "player"}, -- 嗜血成性
			},
			PlateAlert = {
				[266106] = "PlateSpells", -- 音速尖啸	
			},
		},
		cd = {
			[266106] = 17, -- 音速尖啸
		},
	},
	{ -- 生命腐质				
		id = 133852,
		alerts = {
			AlertIcon = {
				["1841_aura_no_278789"] = {"HARMFUL", "player"}, -- 腐烂波
			},
		},
	},
	{ -- 血誓污染者
		id = 133912,
		alerts = {
			AlertIcon = {
				["1841_aura_no_265468"] = {"HARMFUL", "player"}, -- 枯萎诅咒
				["1841_aura_no_265511"] = {"HARMFUL", "player"}, -- 灵魂抽取
			},
			PlateAlert = {
				[265487] = "PlateSpells", -- 暗影箭雨
				[265523] = "PlateSpells", -- 召唤灵魂汲取图腾
			},
		},
		cd = {
			[265487] = 22, -- 暗影箭雨
			[265523] = 21, -- 召唤灵魂汲取图腾
		},
	},
	{ -- 狂热的猎头者
		id = 133663,
		alerts = {
			AlertIcon = {
				["1841_com_no_265376"] = {}, -- 带钩长矛
				["1841_aura_no_265377"] = {"HARMFUL", "player"}, -- 抓钩诱捕
			},
			HLOnRaid = {
				["1841_265376_c"] = "HL_Casting", -- 带钩长矛
			},
			PlateAlert = {
				[265376] = "PlateSpells", -- 带钩长矛
			},
		},
		cd = {
			[265376] = 12, -- 带钩长矛
		},
	},
	{ -- 虔诚鲜血祭司
		id = 131492,
		alerts = {
			AlertIcon = {
				["1841_com_no_265084"] = {}, -- 嗜血箭
			},
			HLOnRaid = {
				["1841_265084_c"] = "HL_Casting", -- 嗜血箭
			},
			PlateAlert = {
				[265084] = "PlateSpells", -- 嗜血箭
				[265089] = "PlateSpells", -- 黑暗复苏
				[265091] = "PlateAuras", -- 戈霍恩之赐
			},
		},
		cd = {
			[265084] = 1, -- 嗜血箭
			[265089] = 1, -- 黑暗复苏
		},
	},
	{ -- 鲜血主母选民	
		id = 131436,
		alerts = {
			PlateAlert = {
				[265019] = "PlateSpells", -- 狂野顺劈斩
				[265081] = "PlateSpells", -- 战吼
			},
		},
		cd = {
			[265019] = 13, -- 狂野顺劈斩
			[265081] = 1, -- 战吼
		},
	},
}

G.Dungeons[1002] = { -- 托尔达戈
	{ -- 泥沙女王
		id = 127479,
		img = 2176753,
		alerts = {
			AlertIcon = {
				["1771_cast_no_257092"] = {}, -- 流沙陷阱
				["1771_cast_no_257608"] = {}, -- 颠覆之击
				["1771_aura_no_257119"] = {"HARMFUL", "player"}, -- 流沙陷阱
			},
			PlateAlert = {
				[259975] = "PlateAuras", -- 激怒
				[257495] = "PlateAuras", -- 沙尘暴
				[257092] = "PlateSpells", -- 流沙陷阱
				[257608] = "PlateSpells", -- 颠覆之击
			},
		},
		cd = {
			[257092] = 15, -- 流沙陷阱
			[257608] = 1, -- 颠覆之击
		},
	},
	{ -- 杰斯·豪里斯
		id = 127484,
		img = 2176733,
		alerts = {
			AlertIcon = {
				["1771_com_no_257777"] = {}, -- 断筋剃刀
				["1771_cast_no_257785"] = {}, -- 闪光飞刃
				["1771_cast_no_257793"] = {}, -- 烟雾弹
				["1771_aura_no_257777"] = {"HARMFUL", "player"}, -- 断筋剃刀
			},
			HLOnRaid = {
				["1771_257777_c"] = "HL_Casting", -- 断筋剃刀
			},
			PlateAlert = {
				[257785] = "PlateSpells", -- 闪光飞刃
				[257791] = "PlateSpells", -- 咆哮恐惧
				[257827] = "PlateSpells", -- 振奋呐喊
				[257956] = "PlateAuras", -- 备受鼓舞
			},
		},
		cd = {
			[257785] = 1, -- 闪光飞刃
			[257791] = 1, -- 咆哮恐惧
			[257827] = 1, -- 振奋呐喊
		},
	},
	{ -- 鲍比·豪里斯
		id = 130655,
		alerts = {
			AlertIcon = {			
				["1771_aura_no_260067"] = {"HARMFUL", "player"}, -- 恶毒槌击
			},
			PlateAlert = {
				[260066] = "PlateAuras", -- 剑刃扭转
			},
		},
		cd = {
			[257791] = 1, -- 咆哮恐惧
		},
	},
	{ -- 骑士队长瓦莱莉
		id = 127490,
		img = 2176735,
		alerts = {
			AlertIcon = {
				["1771_com_no_257028"] = {}, -- 点火器
				["1771_cast_no_256970"] = {}, -- 点火
				["1771_cast_no_256955"] = {}, -- 炉渣之焰
				["1771_aura_no_257028"] = {"HARMFUL", "player"}, -- 点火器
			},
			HLOnRaid = {
				["1771_257028_c"] = "HL_Casting", -- 点火器
			},
			PlateAlert = {
				[256955] = "PlateSpells", -- 炉渣之焰
				[257028] = "PlateSpells", -- 点火器
			},
		},
		cd = {
			[256955] = 20, -- 炉渣之焰
			[257028] = 18, -- 点火器
		},
	},
	{ -- 科古斯狱长
		id = 127503,
		img = 2176743,
		alerts = {
			AlertIcon = {
				["1771_com_no_256039"] = {}, -- 致命狙击
				["1771_cast_no_256200"] = {}, -- 竭心毒剂			
				["1771_cast_no_256198"] = {}, -- 艾泽里特子弹：爆炎弹
				["1771_cast_no_256199"] = {}, -- 艾泽里特子弹：爆破弹
				["1771_cast_no_256083"] = {}, -- 交叉点火			
				["1771_cast_no_256101"] = {}, -- 爆炸				
				["1771_cast_no_256039"] = {}, -- 致命狙击			
				["1771_aura_no_256200"] = {"HARMFUL", "player"}, -- 竭心毒剂
				["1771_aura_no_256201"] = {"HARMFUL", "player"}, -- 爆炎弹
				["1771_aura_no_256105"] = {"HARMFUL", "player"}, -- 爆炸
				["1754_log_no_263345"] = {"SPELL_CAST_START", nil, 3}, -- 巨力冲击
			},
			HLOnRaid = {
				["1771_256039_c"] = "HL_Casting", -- 致命狙击
			},
			PlateAlert = {
				[256101] = "PlateSpells", -- 爆炸
				[256039] = "PlateSpells", -- 致命狙击
			},
		},
		cd = {
			[256101] = 23, -- 爆炸
			[256039] = 23, -- 致命狙击
		},
	},
	{ -- 下水道钳嘴鳄
		id = 127482,
		alerts = {
			AlertIcon = {
				["1771_aura_no_258079"] = {"HARMFUL", "player"}, -- 巨口噬咬
			},
			PlateAlert = {
				[258079] = "PlateSpells", -- 巨口噬咬
			},
		},
		cd = {
			[258079] = 6, -- 巨口噬咬
		},
	},
	{ -- 水鼠帮掠夺者
		id = 127485,
		alerts = {
			PlateAlert = {
				[258133] = "PlateAuras", -- 黑影步	
			},
		},
	},
	{ -- 水鼠帮海语者
		id = 130026,
		alerts = {
			AlertIcon = {
				["1771_com_no_258150"] = {}, -- 盐爆
			},
			HLOnRaid = {
				["1771_258150_c"] = "HL_Casting", -- 盐爆
			},
			PlateAlert = {
				[258150] = "PlateSpells", -- 盐爆
				[258153] = "PlateAuras", -- 流水护甲
			},
		},
		cd = {
			[258150] = 1, -- 盐爆
		},
	},
	{ -- 淤泥螃蟹
		id = 127381,
		alerts = {
			AlertIcon = {
				["1771_aura_no_258058"] = {"HARMFUL", "player"}, -- 挤压
			},
			PlateAlert = {
				[258058] = "PlateSpells", -- 挤压
			},
		},
		cd = {
			[258058] = 1, -- 挤压
		},
	},
	{ -- 监狱守卫
		id = 131445,
		alerts = {
			AlertIcon = {
				["1771_aura_no_259711"] = {"HARMFUL", "player"}, -- 全面禁闭
			},
			PlateAlert = {
				[259711] = "PlateSpells", -- 全面禁闭
			},
		},
		cd = {
			[259711] = 15, -- 全面禁闭
		},
	},
	{ -- 破浪打击者
		id = 131112,
		alerts = {
			AlertIcon = {
				["1771_com_no_272620"] = {}, -- 投掷石块
			},
			HLOnRaid = {
				["1771_272620_c"] = "HL_Casting", -- 投掷石块
			},
			PlateAlert = {
				[272620] = "PlateSpells", -- 投掷石块
			},
		},
		cd = {
			[272620] = 1, -- 投掷石块
		},
	},
	{ -- 艾什凡军官
		id = 127486,
		alerts = {
			AlertIcon = {
				["1771_com_no_258313"] = {}, -- 手铐
				["1771_aura_no_258313"] = {"HARMFUL", "player"}, -- 手铐
			},
			HLOnRaid = {
				["1771_258313_c"] = "HL_Casting", -- 手铐
			},
			PlateAlert = {
				[258313] = "PlateSpells", -- 手铐
				[258317] = "PlateAuras", --防暴盾

			},
		},
		cd = {
			[258313] = 32, -- 手铐
		},
	},
	{ -- 艾什凡卫士
		id = 127497,
		cd = {
			[259711] = 15, -- 全面禁闭	
		},
	},
	{ -- 艾什凡水兵
		id = 130027,
		alerts = {
			AlertIcon = {
				["1771_com_no_185857"] = {}, -- 射击	
				["1771_aura_no_258864"] = {"HARMFUL", "player"}, -- 火力压制
			},
			HLOnRaid = {
				["1771_185857_c"] = "HL_Casting", -- 射击
			},
			PlateAlert = {
				[185857] = "PlateSpells", -- 射击
				[258864] = "PlateSpells", -- 火力压制
			},
		},
		cd = {
			[185857] = 1, -- 射击
			[258864] = 18, -- 火力压制
		},
	},
	{ -- 艾什凡火法师
		id = 127488,
		alerts = {
			AlertIcon = {
				["1771_com_no_258869"] = {}, -- 火球术	
			},
			HLOnRaid = {
				["1771_258869_c"] = "HL_Casting", -- 火球术	
			},
			PlateAlert = {
				[258869] = "PlateSpells", -- 火球术
				[258634] = "PlateSpells", --爆燃
			},
		},
		cd = {
			[258869] = 1, -- 火球术
			[258634] = 18, -- 爆燃
		},
	},
	{ -- 艾什凡炉火医师
		id = 130028,
		alerts = {
			PlateAlert = {
				[258938] = "PlateAuras", -- 心灵之火
				[258935] = "PlateSpells", -- 心灵之火 
				[258917] = "PlateSpells", -- 正义烈焰 
			},
		},
		cd = {
			[258935] = 1, -- 心灵之火
			[258917] = 1, -- 正义烈焰
		},
	},
	{ -- 艾什凡狱卒
		id = 135699,
		cd = {
			[258313] = 32, -- 手铐
		},
	},
	{ -- 艾什凡观察员
		id = 136665,
		cd = {
			[185857] = 1, -- 射击
			[258864] = 18, -- 火力压制
		},
	},
	{ -- 钉刺寄生虫
		id = 127480,
		alerts = {
			AlertIcon = {
				["1771_aura_no_258075"] = {"HARMFUL", "player"}, -- 瘙痒叮咬
			},		
		},
	},
	{ -- 铁潮暴徒
		id = 130025,
		alerts = {
			AlertIcon = {			
				["1771_aura_no_258128"] = {"HARMFUL", "player"}, -- 衰弱怒吼
			},
			PlateAlert = {
				[258128] = "PlateSpells", -- 衰弱怒吼
			},
		},
		cd = {
			[258128] = 12, -- 衰弱怒吼
		},
	},
	{ -- 黑齿纵火犯
		id = 135366,
		alerts = {
			AlertIcon = {			
				["1771_aura_no_265889"] = {"HARMFUL", "player"}, -- 火把攻击
			},
			PlateAlert = {
				[265889] = "PlateSpells", -- 火把攻击
			},
		},
		cd = {
			[265889] = 12, -- 火把攻击
		},
	},
}

G.Dungeons[1012] = { -- 暴富矿区
	{ -- 投币式群体打击者
		id = 129214,
		img = 2176718,
		alerts = {
			AlertIcon = {
				["1594_cast_no_262347"] = {}, -- 静电脉冲		
				["1594_cast_no_269493"] = {}, -- 足球炸弹发射器
				["1594_cast_no_257337"] = {}, -- 电击之爪		
				["1594_aura_no_270882"] = {"HARMFUL", "player"}, -- 炽燃的艾泽里特
			},
			PlateAlert = {
				[262347] = "PlateAuras", -- 静电脉冲		
				[269493] = "PlateAuras", -- 足球炸弹发射器
				[257337] = "PlateSpells", -- 电击之爪		 
				[271867] = "PlateAuras", -- 氪金致胜		
				[256493] = "PlateAuras", -- 炽燃的艾泽里特
			},
		},
		cd = {
			[257337] = 33, -- 电击之爪
		},
	},
	{ -- 艾泽洛克
		id = 129227,
		img = 2176714,
		alerts = {
			AlertIcon = {
				["1594_cast_no_257593"] = {}, -- 召唤地怒者	
				["1594_cast_no_271698"] = {}, -- 艾泽里特灌注
				["1594_cast_no_258622"] = {}, -- 回荡脉冲	
				["1594_cast_no_275907"] = {}, -- 地质冲击	
			},
			PlateAlert = {
				[257597] = "PlateAuras", -- 艾泽里特灌注
				[258622] = "PlateSpells", -- 回荡脉冲
				[275907] = "PlateSpells", -- 地质冲击
			},
		},
		cd = {
			[258622] = 34, -- 回荡脉冲
			[275907] = 22, -- 地质冲击
		},
	},
	{ -- 地怒者
		id = 129802,
		alerts = {
			AlertIcon = {
				["1594_com_no_257582"] = {}, -- 愤怒凝视
				["1594_aura_no_257544"] = {"HARMFUL", "player"}, -- 锯齿切割
			},
			HLOnRaid = {
				["1594_257582_c"] = "HL_Casting", -- 愤怒凝视
			},
			PlateAlert = {
				[258627] = "PlateSpells", -- 地震回荡
				[257582] = "PlateSpells", -- 愤怒凝视
			},
		},
		cd = {
			[258627] = 1, -- 地震回荡
			[257582] = 1, -- 愤怒凝视
		},
	},
	{ -- 瑞克莎·流火
		id = 129231,
		img = 2176745,
		alerts = {
			AlertIcon = {
				["1594_com_no_259856"] = {}, -- 化学灼烧	
				["1594_com_no_260669"] = {}, -- 推进器冲击
				["1594_aura_no_259533"] = {"HARMFUL", "player"}, -- 艾泽里特催化剂
				["1594_aura_no_259853"] = {"HARMFUL", "player"}, -- 化学灼烧
				["1594_aura_no_269831"] = {"HARMFUL", "player"}, -- 毒性淤泥
			},
			HLOnRaid = {
				["1594_259856_c"] = "HL_Casting", -- 化学灼烧	
				["1594_260669_c"] = "HL_Casting", -- 推进器冲击
			},
			PlateAlert = {
				[259856] = "PlateSpells", -- 化学灼烧	
				[260669] = "PlateSpells", -- 推进器冲击
			},
		},
		cd = {
			[259856] = 1, -- 化学灼烧	
			[260669] = 1, -- 推进器冲击
		},
	},
	{ -- 商业大亨拉兹敦克
		id = 129232,
		img = 2176740,
		alerts = {
			AlertIcon = {
				["1594_cast_no_260280"] = {}, -- 加特林机枪		
				["1594_cast_no_260811"] = {}, -- 自控导弹		
				["1594_cast_no_260202"] = {}, -- 钻地猛砸		
				["1594_cast_no_276212"] = {}, -- 召唤王牌轰炸机
			},
			PlateAlert = {
				[260280] = "PlateSpells", -- 加特林机枪		
				[260811] = "PlateSpells", -- 自控导弹		
				[260202] = "PlateSpells", -- 钻地猛砸		
				[276212] = "PlateSpells", -- 召唤王牌轰炸机
				[260190] = "PlateAuras", -- 配置：战斗
				[260189] = "PlateAuras", -- 配置：钻探
			},
		},
		cd = {
			[260280] = 20, -- 加特林机枪		
			[260811] = 22, -- 自控导弹		
			[260202] = 8, -- 钻地猛砸		
			[276212] = 45, -- 召唤王牌轰炸机
		},
	},
	{ -- 风险投资公司灼天者
		id = 133436,
		alerts = {
			AlertIcon = {
				["1594_com_no_260372"] = {}, -- 轰击炮
				["1594_aura_no_262515"] = {"HARMFUL", "player"}, -- 艾泽里特觅心者
			},
			HLOnRaid = {
				["1594_260372_c"] = "HL_Casting", -- 轰击炮
			},
			PlateAlert = {
				[281621] = "PlateSpells", -- 震荡榴弹
				[260372] = "PlateSpells", -- 轰击炮
			},
		},
		cd = {
			[281621] = 1, -- 震荡榴弹
			[260372] = 1, -- 轰击炮	
		},
	},
	{ -- 下班的劳工
		id = 130436,
		alerts = {
			AlertIcon = {
				["1594_com_no_258674"] = {}, -- 投掷扳手
			},
			HLOnRaid = {
				["1594_258674_c"] = "HL_Casting", -- 投掷扳手
			},
			PlateAlert = {
				[258674] = "PlateSpells", -- 投掷扳手
			},
		},
		cd = {
			[258674] = 1, -- 投掷扳手
		},
	},
	{ -- 专家技师	
		id = 133593,
		alerts = {
			PlateAlert = {
				[262554] = "PlateAuras", -- 修理
				[262540] = "PlateAuras", -- 超载
			},
		},
	},
	{ -- 值钱的螃蟹
		id = 137713,
		alerts = {
			AlertIcon = {
				["1594_aura_no_270866"] = {"HARMFUL", "player"}, -- 宝石钳爪
			},
		},
	},
	{ -- 军械专家	
		id = 137029,
		alerts = {
			AlertIcon = {
				["1594_com_no_269090"] = {}, -- 炮弹弹幕
			},
			HLOnRaid = {
				["1594_269090_c"] = "HL_Casting", -- 炮弹弹幕
			},
			PlateAlert = {
				[269090] = "PlateSpells", -- 炮弹弹幕
			},
		},
		cd = {
			[269090] = 1, -- 炮弹弹幕
		},
	},
	{ -- 吵闹的狂欢者
		id = 136005,
		alerts = {
			AlertIcon = {
				["1594_com_no_276304"] = {}, -- 一枚铜板
			},
			HLOnRaid = {
				["1594_276304_c"] = "HL_Casting", -- 一枚铜板
			},
			PlateAlert = {
				[276304] = "PlateSpells", -- 一枚铜板
			},
		},
		cd = {
			[276304] = 1, -- 一枚铜板
		},
	},
	{ -- 吸血球
		id = 133753,
		alerts = {
			PlateAlert = {
				[262940] = "PlateSpells", -- 吸血球
			},
		},
		cd = {
			[262940] = 1, -- 吸血球
		},
	},
	{ -- 奇异的实验品
		id = 133345,
		alerts = {
			PlateAlert = {
				[263066] = "PlateAuras", -- 异变血清
				[263103] = "PlateAuras", -- 焊枪
			},
		},
	},
	{ -- 巨石之怒
		id = 130635,
		alerts = {
			PlateAlert = {
				[263215] = "PlateAuras", -- 地壳屏障
				[268702] = "PlateSpells", -- 狂怒地震
			},
		},
		cd = {
			[268702] = 22, -- 狂怒地震
		},
	},
	{ -- 暴虐的工兵
		id = 130653,
		alerts = {
			PlateAlert = {
				[268712] = "PlateAuras", -- 一袋炸弹
				[269313] = "PlateSpells", -- 终极冲击
			},
		},
		cd = {
			[269313] = 1, -- 终极冲击
		},
	},
	{ -- 机械化维和者
		id = 130485,
		alerts = {
			PlateAlert = {
				[263628] = "PlateAuras", -- 充能之爪
				[262412] = "PlateAuras", -- 能量护盾
			},
		},
	},
	{ -- 机甲驾驶员
		id = 130488,
		alerts = {
			PlateAlert = {
				[267433] = "PlateSpells", -- 激活机甲
			},
		},
		cd = {
			[267433] = 1, -- 激活机甲
			[281621] = 10, -- 震荡榴弹
		},
	},
	{ -- 武器测试员
		id = 136934,
		alerts = {
			PlateAlert = {
				[268865] = "PlateSpells", -- 力场大炮
				[268846] = "PlateSpells", -- 回声之刃
			},
		},
		cd = {
			[268865] = 23, -- 力场大炮
			[268846] = 1, -- 回声之刃
		},
	},
	{ -- 测试对象	
		id = 133963,
		alerts = {
			PlateAlert = {
				[268810] = "PlateAuras", -- 不稳定突变		
				[268815] = "PlateAuras", -- 艾泽里特富集之血
			},
		},
	},
	{ -- 混乱的暴徒
		id = 130435,
		alerts = {
			AlertIcon = {		
				["1594_aura_no_263637"] = {"HARMFUL", "player"}, -- 晾衣绳
			},
			PlateAlert = {
				[262092] = "PlateAuras", -- 吸入气雾
			},
		},
	},
	{ -- 监工阿斯加里
		id = 134012,
		alerts = {
			PlateAlert = {
				[263275] = "PlateAuras", -- 掩护	
				[263583] = "PlateSpells", -- 横扫千军
			},
		},
		cd = {
			[263583] = 12, -- 横扫千军
		},
	},
	{ -- 矿井鼠
		id = 130437,
		alerts = {
			AlertIcon = {
				["1594_com_no_263209"] = {}, -- 投掷石块
			},
			HLOnRaid = {
				["1594_263209_c"] = "HL_Casting", -- 投掷石块
			},
			PlateAlert = {
				[263209] = "PlateSpells", -- 投掷石块
			},
		},
		cd = {
			[263209] = 1, -- 投掷石块
		},
	},
	{ -- 艾泽里特提取器
		id = 136643,
		alerts = {
			PlateAlert = {
				[268415] = "PlateSpells", -- 强力推进
			},
		},
		cd = {
			[268415] = 22, -- 强力推进
		},
	},
	{ -- 蛛形地雷
		id = 133482,
		alerts = {
			PlateAlert = {
				[262377] = "PlateSpells", -- 搜寻并摧毁	
			},
		},
		cd = {
			[262377] = 1, -- 搜寻并摧毁
		},
	},
	{ -- 足球炸弹流氓
		id = 138369,
		alerts = {
			PlateAlert = {
				[271784] = "PlateSpells", -- 抛硬币
			},
		},
		cd = {
			[271784] = 15, -- 抛硬币
		},
	},
	{ -- 雇来的刺客
		id = 134232,
		alerts = {
			AlertIcon = {
				["1594_aura_no_269298"] = {"HARMFUL", "player"}, -- 寡妇蛛毒素
			},
			PlateAlert = {
				[267354] = "PlateSpells", -- 飞镖弹幕
				[269302] = "PlateAuras", -- 淬毒之刃
			},
		},
		cd = {
			[267354] = 15, -- 飞镖弹幕
		},
	},
	{ -- 零食商贩	
		id = 136470,
		alerts = {
			AlertIcon = {
				["1594_com_no_280604"] = {}, -- 冰镇汽水
				["1594_aura_no_280605"] = {"HARMFUL", "player"}, -- 脑部冻结
			},
			HLOnRaid = {
				["1594_280604_c"] = "HL_Casting", -- 冰镇汽水
				["1594_280605_a"] = "HL_Auras", -- 脑部冻结
			},
			PlateAlert = {
				[268129] = "PlateAuras", -- 冰爽卡亚可乐
				[280604] = "PlateSpells", -- 冰镇汽水
			},
		},
		cd = {
			[280604] = 1, -- 冰镇汽水
		},
	},
	{ -- 页岩啃噬者
		id = 134005,
		alerts = {
			AlertIcon = {
				["1594_com_no_263262"] = {}, -- 页岩唾液
			},
			HLOnRaid = {
				["1594_263262_c"] = "HL_Casting", -- 页岩唾液
			},
			PlateAlert = {
				[263262] = "PlateSpells", -- 页岩唾液
			},
		},
		cd = {
			[263262] = 1, -- 页岩唾液
		},
	},
	{ -- 风险投资公司塑地者
		id = 130661,
		alerts = {
			AlertIcon = {
				["1594_com_no_263202"] = {}, -- 石枪
			},
			HLOnRaid = {
				["1594_263202_c"] = "HL_Casting", -- 石枪
			},
			PlateAlert = {
				[268709] = "PlateAuras", -- 大地之盾
				[263202] = "PlateSpells", -- 石枪
			},
		},
		cd = {
			[263202] = 1, -- 石枪
		},
	},
	{ -- 风险投资公司战争机器
		id = 133463,
		alerts = {
			PlateAlert = {
				[269429] = "PlateSpells", -- 充能射击

			},
		},
		cd = {
			[269429] = 1, -- 充能射击
		},
	},
	{ -- 风险投资公司炼金师
		id = 133432,
		alerts = {
			AlertIcon = {	
				["1594_aura_no_262270"] = {"HARMFUL", "player"}, -- 腐蚀性化合物	
				["1594_aura_no_268797"] = {"HARMFUL", "player"}, -- 转化：敌人变黏液
			},
			PlateAlert = {
				[262270] = "PlateSpells", -- 腐蚀性化合物
			},
		},
		cd = {
			[262270] = 1, -- 腐蚀性化合物
		},
	},
	{ -- 风险投资公司策划	
		id = 133430,
		alerts = {
			AlertIcon = {
				["1594_com_no_262794"] = {}, -- 能量鞭笞
			},
			HLOnRaid = {
				["1594_262794_c"] = "HL_Casting", -- 能量鞭笞
			},
			PlateAlert = {
				[262804] = "PlateSpells", -- 吸血球	
				[262794] = "PlateSpells", -- 能量鞭笞
			},
		},
		cd = {
			[262804] = 1, -- 吸血球	
			[262794] = 1, -- 能量鞭笞
		},
	},
}

G.Dungeons[1023] = { -- 围攻伯拉勒斯
	{ -- 拜恩比吉中士
		id = 128649,
		img = 2176746,
		alerts = {
			AlertIcon = {
				["1822_com_no_260954"] = {}, -- 铁之凝视
				["1822_cast_no_260924"] = {}, -- 钢铁风暴
				["1822_aura_no_260954"] = {"HARMFUL", "player"}, -- 铁之凝视	
				["1822_aura_no_261428"] = {"HARMFUL", "player"}, -- 刽子手的套索
			},
			HLOnRaid = {
				["1822_260954_c"] = "HL_Casting", -- 铁之凝视
			},
			PlateAlert = {
				[256867] = "PlateAuras", -- 重击者	
				[257650] = "PlateAuras", -- 沸腾之怒
				[260954] = "PlateSpells", -- 铁之凝视
			},
		},
		cd = {
			[260954] = 1, -- 铁之凝视
		},
	},
	{ -- 库尔提拉斯先锋	
		id = 132530,
		alerts = {
			PlateAlert = {
				[257292] = "PlateSpells", -- 沉重挥砍
			},
		},
		cd = {
			[257292] = 23, -- 沉重挥砍
		},
	},
	{ -- 库尔提拉斯先锋	
		id = 138019,
		cd = {
			[257292] = 23, -- 沉重挥砍
		},
	},
	{ -- 库尔提拉斯先锋	
		id = 132481,
		cd = {
			[257292] = 23, -- 沉重挥砍
		},
	},
	{ -- 库尔提拉斯神射手
		id = 141285,
		alerts = {
			AlertIcon = {
				["1822_com_no_257641"] = {}, -- 炽热弹头
			},
			HLOnRaid = {
				["1822_257641_c"] = "HL_Casting", -- 炽热弹头
			},
			PlateAlert = {
				[257641] = "PlateSpells", -- 炽热弹头
			},
		},
		cd = {
			[257641] = 1, -- 炽热弹头
		},
	},
	{ -- 库尔提拉斯神射手
		id = 132491,
		cd = {
			[257641] = 1, -- 炽热弹头
		},
	},
	{ -- 库尔提拉斯神射手
		id = 132532,
		cd = {
			[257641] = 1, -- 炽热弹头
		},
	},
	{ -- 恐怖船长洛克伍德
		id = 129208,
		img = 2176722,
		alerts = {
			AlertIcon = {
				["1822_com_no_280389"] = {}, -- 射击
				["1822_com_no_273470"] = {}, -- 一枪毙命
				["1822_cast_no_269029"] = {}, -- 清扫甲板			
				["1822_aura_no_273470"] = {"HARMFUL", "player"}, -- 一枪毙命
			},
			HLOnRaid = {
				["1822_280389_c"] = "HL_Casting", -- 射击
				["1822_273470_c"] = "HL_Casting", -- 一枪毙命
			},
			PlateAlert = {
				[280389] = "PlateSpells", -- 射击
				[273470] = "PlateSpells", -- 一枪毙命
				[269029] = "PlateSpells", -- 清扫甲板
				[272471] = "PlateAuras", -- 闪避
				[1] = "PlatePower" -- 能量
			},
		},
		cd = {
			[280389] = 1, -- 射击
			[273470] = 1, -- 一枪毙命
			[269029] = 1, -- 清扫甲板
		},
	},
	{ -- 艾什凡水手
		id = 136483,
		alerts = {
			PlateAlert = {
				[268230] = "PlateSpells", -- 腥红横扫

			},
		},
		cd = {
			[268230] = 8, -- 腥红横扫
		},
	},
	{ -- 艾什凡水手
		id = 138464,
		cd = {
			[268230] = 8, -- 腥红横扫
		},
	},
	{ -- 艾什凡炮手
		id = 136549,
		alerts = {
			PlateAlert = {
				[268260] = "PlateSpells", -- 舷侧攻击	
			},
		},
		cd = {
			[268260] = 1, -- 舷侧攻击
		},
	},
	{ -- 艾什凡炮手
		id = 138465,
		cd = {
			[268260] = 1, -- 舷侧攻击
		},
	},
	{ -- 哈达尔·黑渊
		id = 128651,
		img = 2176730,
		alerts = {
			AlertIcon = {
				["1822_cast_no_276068"] = {}, -- 海潮涌动
				["1822_cast_no_257882"] = {}, -- 激流破奔
				["1822_aura_no_257886"] = {"HARMFUL", "player"}, -- 盐水池
			},
			PlateAlert = {
				[257882] = "PlateSpells", -- 激流破奔
				[1] = "PlatePower" -- 能量
			},
		},
		cd = {
			[257882] = 30, -- 激流破奔
		},
	},
	{ -- 维克戈斯	
		id = 128652,
		img = 2176758,
		alerts = {
			AlertIcon = {
				["1822_cast_no_274991"] = {}, -- 腐败之水
				["1822_cast_no_269456"] = {}, -- 灭杀
				["1822_aura_no_275014"] = {"HARMFUL", "player"}, -- 腐败之水
			},
			PlateAlert = {
				[274991] = "PlateSpells", -- 腐败之水
			},
		},
		cd = {
			[274991] = 10, -- 腐败之水
		},
	},
	{ -- 库尔提拉斯戟兵
		id = 141283,
		alerts = {
			PlateAlert = {
				[256627] = "PlateSpells", -- 抽脸者
			},
		},
		cd = {
			[256627] = 16, -- 抽脸者
		},
	},
	{ -- 库尔提拉斯护潮者
		id = 141284,
		alerts = {
			AlertIcon = {
				["1822_com_no_257063"] = {}, -- 盐渍飞弹
			},
			HLOnRaid = {
				["1822_257063_c"] = "HL_Casting", -- 盐渍飞弹
			},
			PlateAlert = {
				[256957] = "PlateAuras", -- 防水甲壳
				[257063] = "PlateSpells", -- 盐渍飞弹
			},
		},
		cd = {
			[257063] = 1, -- 盐渍飞弹
		},
	},
	{ -- 库尔提拉斯步兵
		id = 141495,
		alerts = {
			AlertIcon = {	
				["1822_aura_no_273930"] = {"HARMFUL", "player"}, -- 妨害切割
			},
			PlateAlert = {
				[273930] = "PlateSpells", -- 妨害切割
			},
		},
		cd = {
			[273930] = 10, -- 妨害切割
		},
	},
	{ -- 库尔提拉斯步兵
		id = 141282,
		cd = {
			[273930] = 10, -- 妨害切割
		},
	},
	{ -- 库尔提拉斯步兵
		id = 141565,
		cd = {
			[273930] = 10, -- 妨害切割
		},
	},
	{ -- 恐怖火炮
		id = 136687,
		alerts = {
			PlateAlert = {
				[268443] = "PlateSpells", -- 恐惧箭雨
			},
		},
		cd = {
			[268443] = 12, -- 恐惧箭雨
		},
	},
	{ -- 攻城恐魔
		id = 140447,
		alerts = {
			PlateAlert = {
				[269266] = "PlateSpells", -- 猛击
			},
		},
		cd = {
			[269266] = 1, -- 猛击
		},
	},
	{ -- 水鼠帮劫掠者
		id = 135241,
		alerts = {
			AlertIcon = {
				["1822_com_no_272827"] = {}, -- 粘稠的口水
				["1822_aura_no_272827"] = {"HARMFUL", "player"}, -- 粘稠的口水
			},
			HLOnRaid = {
				["1822_272827_c"] = "HL_Casting", -- 粘稠的口水
			},
			PlateAlert = {
				[272827] = "PlateSpells", -- 粘稠的口水

			},
		},
		cd = {
			[272827] = 20, -- 粘稠的口水
		},
	},
	{ -- 水鼠帮唤风者
		id = 129367,
		alerts = {
			AlertIcon = {
				["1822_com_no_272571"] = {}, -- 窒息之水
				["1822_com_no_272581"] = {}, -- 水流喷射
			},
			HLOnRaid = {
				["1822_272571_c"] = "HL_Casting", -- 窒息之水
				["1822_272581_c"] = "HL_Casting", -- 水流喷射
			},
			PlateAlert = {
				[272571] = "PlateSpells", -- 窒息之水
				[272581] = "PlateSpells", -- 水流喷射
				[274569] = "PlateSpells", -- 活力之雾
			},
		},
		cd = {
			[272571] = 1, -- 窒息之水
			[272581] = 1, -- 水流喷射
			[274569] = 1, -- 活力之雾
		},
	},
	{ -- 水鼠帮杀手
		id = 137511,
		alerts = {
			AlertIcon = {
				["1822_com_no_272588"] = {}, -- 腐烂伤口	
				["1822_aura_no_272588"] = {"HARMFUL", "player"}, -- 腐烂伤口
			},
			HLOnRaid = {
				["1822_272588_c"] = "HL_Casting", -- 腐烂伤口
			},
			PlateAlert = {
				[272588] = "PlateSpells", -- 腐烂伤口
			},
		},
		cd = {
			[272588] = 15, -- 
		},
	},
	{ -- 水鼠帮歼灭者
		id = 135245,
		alerts = {
			AlertIcon = {
				["1822_aura_no_257169"] = {"HARMFUL", "player"}, -- 恐惧咆哮
			},
			PlateAlert = {
				[257169] = "PlateSpells", -- 恐惧咆哮
			},
		},
		cd = {
			[257169] = 1, -- 恐惧咆哮
		},
	},
	{ -- 水鼠帮海盗
		id = 129366,
		alerts = {
			AlertIcon = {	
				["1822_aura_no_274942"] = {"HARMFUL", "player"}, -- 香蕉狂怒
			},
			PlateAlert = {
				[272546] = "PlateSpells", -- 香蕉狂怒
				[274942] = "PlateAuras", -- 香蕉狂怒
			},
		},
		cd = {
			[272546] = 15, -- 香蕉狂怒
		},
	},
	{ -- 艾什凡入侵者
		id = 137516,
		alerts = {
			AlertIcon = {
				["1822_aura_no_275836"] = {"HARMFUL", "player"}, -- 钉刺之毒
			},
			PlateAlert = {
				[275835] = "PlateAuras", -- 钉刺之毒覆膜
			},
		},
	},
	{ -- 艾什凡指挥官
		id = 128969,
		alerts = {
			PlateAlert = {
				[272874] = "PlateSpells", -- 践踏	
				[275826] = "PlateAuras", -- 强化怒吼
			},
		},
		cd = {
			[272874] = 15, -- 践踏
		},
	},
	{ -- 艾什凡狙击手
		id = 141938,
		alerts = {
			AlertIcon = {
				["1822_com_no_272528"] = {}, -- 射击
				["1822_com_no_272542"] = {}, -- 锯刃
			},
			HLOnRaid = {
				["1822_272528_c"] = "HL_Casting", -- 射击
				["1822_272542_c"] = "HL_Casting", -- 锯刃
			},
			PlateAlert = {
				[272528] = "PlateSpells", -- 射击
				[272542] = "PlateSpells", -- 锯刃
			},
		},
		cd = {
			[272528] = 1, -- 射击
			[272542] = 15, -- 锯刃 
		},
	},
	{ -- 艾什凡狙击手
		id = 128967,
		cd = {
			[272528] = 1, -- 射击
			[272542] = 15, -- 锯刃 
		},
	},
	{ -- 艾什凡破坏者
		id = 137517,
		alerts = {
			PlateAlert = {
				[272888] = "PlateAuras", -- 狂野	
			},
		},

	},
	{ -- 艾什凡观察员
		id = 135263,
		alerts = {
			AlertIcon = {
				["1822_aura_no_272421"] = {"HARMFUL", "player"}, -- 瞄准火炮
			},
			PlateAlert = {
				[272422] = "PlateSpells", -- 瞄准火炮
			},
		},
		cd = {
			[272422] = 1, -- 瞄准火炮
		},
	},
	{ -- 艾什凡观察员
		id = 138255,
		cd = {
			[272422] = 1, -- 瞄准火炮
		},
	},
	{ -- 铁潮塑浪者
		id = 129370,
		alerts = {
			PlateAlert = {
				[257063] = "PlateSpells", -- 盐渍飞弹
			},
		},
		cd = {
			[257063] = 1, -- 盐渍飞弹
		},
	},
	{ -- 铁潮塑浪者
		id = 144071,
		cd = {
			[257063] = 1, -- 盐渍飞弹
		},
	},
	{ -- 铁潮掠夺者
		id = 135258,
		alerts = {
			AlertIcon = {
				["1822_aura_no_257168"] = {"HARMFUL", "player"}, -- 诅咒挥砍
			},
		},
	},
	{ -- 铁潮火枪手
		id = 137521,
		alerts = {
			PlateAlert = {
				[257641] = "PlateSpells", -- 炽热弹头	
			},
		},
		cd = {
			[257641] = 1, -- 炽热弹头
		},
	},
	{ -- 铁潮火枪手
		id = 138254,
		cd = {
			[257641] = 1, -- 炽热弹头
		},
	},
	{ -- 雕骨切割者
		id = 141566,
		alerts = {
			PlateAlert = {
				[256616] = "PlateSpells", -- 碎牙者
			},
		},
		cd = {
			[256616] = 1, -- 碎牙者
		},
	},
}

G.Dungeons[1030] = { -- 塞塔里斯神庙
	{ -- 阿德里斯			
		id = 133379,
		img = 2176710,
		alerts = {
			AlertIcon = {
				["1877_cast_no_263234"] = {}, -- 弧光斩击
				["1877_cast_no_263573"] = {}, -- 飓风打击
				["1877_cast_no_263365"] = {}, -- 雷电轰鸣
				["1877_cast_no_263425"] = {}, -- 电弧冲刺
				["1877_cast_no_274342"] = {}, -- 电弧冲刺
			},
			PlateAlert = {
				[263246] = "PlateAuras", -- 闪电之盾
				[263234] = "PlateSpells", -- 弧光斩击 
				[263573] = "PlateSpells", -- 飓风打击 
				[263365] = "PlateSpells", -- 雷电轰鸣 
				[1] = "PlatePower", -- 能量
			},
		},
		cd = {
			[263234] = 1, -- 弧光斩击
			[263573] = 1, -- 飓风打击
			[263365] = 1, -- 雷电轰鸣
		},
	},
	{ -- 阿斯匹克斯			
		id = 133944,
		alerts = {
			AlertIcon = {
				["1877_com_no_263318"] = {}, -- 颤雷
				["1877_com_no_263371"] = {}, -- 导电
				["1877_com_no_263775"] = {}, -- 阵风	
				["1877_com_no_263776"] = {}, -- 狂风之力
				["1877_cast_no_263257"] = {}, -- 静电冲击
			},
			HLOnRaid = {
				["1877_263318_c"] = "HL_Casting", -- 颤雷
				["1877_263371_c"] = "HL_Casting", -- 导电
				["1877_263775_c"] = "HL_Casting", -- 阵风
			},
			PlateAlert = {
				[263318] = "PlateSpells", -- 颤雷	
				[263371] = "PlateSpells", -- 导电	
				[263257] = "PlateSpells", -- 静电冲击
				[263775] = "PlateSpells", -- 阵风	
				[263776] = "PlateSpells", -- 狂风之力
				[1] = "PlatePower", -- 能量
			},
		},
		cd = {
			[263318] = 1, -- 颤雷	
			[263371] = 1, -- 导电	
			[263257] = 1, -- 静电冲击
			[263775] = 1, -- 阵风	
			[263776] = 1, -- 狂风之力
		},
	},
	{ -- 米利克萨			
		id = 133384,
		img = 2176739,
		alerts = {
			AlertIcon = {
				["1877_com_no_263914"] = {}, -- 盲目之沙
				["1877_cast_no_263912"] = {}, -- 毒性吐息
				["1877_aura_no_263927"] = {"HARMFUL", "player"}, -- 剧毒之池
				["1877_aura_no_269970"] = {"HARMFUL", "player"}, -- 盲目之沙	
				["1877_aura_no_263958"] = {"HARMFUL", "player"}, -- 缠绕的蛇群
			},
		},
	},
	{ -- 喷毒盘蛇			
		id = 135562,
		alerts = {
			AlertIcon = {
				["1877_aura_no_267027"] = {"HARMFUL", "player"}, -- 细胞毒素
			},
		},
	},
	{ -- 沙鳞突击者			
		id = 134390,
		alerts = {
			AlertIcon = {
				["1877_aura_no_256333"] = {"HARMFUL", "player"}, -- 尘土云
			},
		},
	},
	{ -- 加瓦兹特			
		id = 133389,
		img = 2176727,
		alerts = {
			AlertIcon = {
				["1877_cast_no_266512"] = {}, -- 放电
				["1877_auras_no_266923"] = {"HARMFUL"}, -- 充电
			},
			PlateAlert = {
				[266512] = "PlateSpells", -- 放电
				[266511] = "PlateAuras", -- 电容
				[1] = "PlatePower", -- 能量
			},
		},
		cd = {
			[266512] = 1, -- 放电
		},
	},
	{ -- 塞塔里斯的化身		
		id = 133392,
		img = 2176713,
		alerts = {
			AlertIcon = {			
				["1877_aura_no_269686"] = {"HARMFUL", "player"}, -- 瘟疫
			},
			PlateAlert = {
				[274149] = "PlateAuras", -- 生命之力
			},
		},
	},
	{ -- 灾厄妖术师			
		id = 137204,
		alerts = {
			PlateAlert = {
				[273677] = "PlateAuras", -- 污染
			},
		},
	},
	{ -- 心脏守卫			
		id = 136391,
		alerts = {
			AlertIcon = {
				["1877_aura_no_268007"] = {"HARMFUL", "player"}, -- 心脏打击
			},
		},
	},
	{ -- 瘟疫博士			
		id = 139284,
		alerts = {
			AlertIcon = {
				["1877_com_no_268061"] = {}, -- 闪电链
				["1877_aura_no_268008"] = {"HARMFUL", "player"}, -- 毒蛇诱惑
			},
			HLOnRaid = {
				["1877_268061_c"] = "HL_Casting", -- 闪电链
			},
		},
	},
	{ -- 三叶虫宝宝			
		id = 134616,
		alerts = {
			PlateAlert = {
				[264587] = "PlateSpells", -- 头槌
			},
		},
		cd = {
			[264587] = 10, -- 头槌
		},
	},
	{ -- 充能的沙尘恶魔		
		id = 134990,
		alerts = {
			AlertIcon = {
				["1877_com_no_268703"] = {}, -- 闪电箭
			},
			HLOnRaid = {
				["1877_268703_c"] = "HL_Casting", -- 闪电箭
			},
			PlateAlert = {
				[268703] = "PlateSpells", -- 闪电箭
				[265968] = "PlateSpells", -- 治疗之涌
			},
		},
		cd = {
			[268703] = 1, -- 闪电箭
			[265968] = 1, -- 治疗之涌
		},
	},
	{ -- 卷沙神射手			
		id = 134600,
		alerts = {
			AlertIcon = {
				["1877_com_no_272670"] = {}, -- 射击
				["1877_aura_no_273563"] = {"HARMFUL", "player"}, -- 神经毒素

			},
			HLOnRaid = {
				["1877_272670_c"] = "HL_Casting", -- 射击
			},
			PlateAlert = {
				[264574] = "PlateSpells", -- 劲射
				[272670] = "PlateSpells", -- 射击
			},
		},
		cd = {
			[264574] = 8, -- 劲射
			[272670] = 1, -- 射击
		},
	},
	{ -- 厚鳞三叶虫骑手		
		id = 134629,
		alerts = {
			AlertIcon = {
				["1877_aura_no_272657"] = {"HARMFUL", "player"}, -- 毒性吐息
			},
			PlateAlert = {
				[272659] = "PlateSpells", -- 带电鳞片
				[255741] = "PlateSpells", -- 顺劈斩	
			},
		},
		cd = {
			[272659] = 20, -- 带电鳞片
			[255741] = 1, -- 顺劈斩	
		},
	},
	{ -- 厚麟三叶虫训者		
		id = 139422,
		cd = {
			[272659] = 20, -- 带电鳞片
			[255741] = 1, -- 顺劈斩	
		},
	},
	{ -- 无信护卵员			
		id = 134364,
		alerts = {
			AlertIcon = {
				["1877_com_no_272699"] = {}, -- 毒性喷吐	
				["1877_aura_no_272699"] = {"HARMFUL", "player"}, -- 毒性喷吐	
			},
			HLOnRaid = {
				["1877_272699_c"] = "HL_Casting", -- 毒性喷吐	
			},
			PlateAlert = {
				[267237] = "PlateAuras", -- 吸取		
				[272700] = "PlateSpells", -- 强效治疗药水 
				[272699] = "PlateSpells", -- 毒性喷吐	 
				[269896] = "PlateAuras", -- 胚胎精华	
			},
		},
		cd = {
			[272700] = 18, -- 强效治疗药水
			[272699] = 17, -- 毒性喷吐	
		},
	},
	{ -- 暴怒云气			
		id = 136076,
		alerts = {
			AlertIcon = {
				["1877_aura_no_265912"] = {"HARMFUL", "player"}, -- 积攒电荷
				["1877_aura_no_265911"] = {"HARMFUL", "player"}, -- 释放电荷
			},
			PlateAlert = {
				[265912] = "PlateSpells", -- 积攒电荷
				[265911] = "PlateSpells", -- 释放电荷
			},
		},
		cd = {
			[265912] = 1, -- 积攒电荷
			[265911] = 1, -- 释放电荷
		},
	},
	{ -- 极化尖塔			
		id = 139131,
		alerts = {
			AlertIcon = {
				["1877_aura_no_273272"] = {"HARMFUL", "player"}, -- 极化力场
			},
		},
	},
	{ -- 沙怒石拳战士		
		id = 134991,
		alerts = {
			PlateAlert = {
				[265966] = "PlateSpells", -- 震地
			},
		},
		cd = {
			[265966] = 1, -- 震地
		},
	},
	{ -- 灌注能量的唤雷者	
		id = 134599,
		alerts = {
			AlertIcon = {
				["1877_com_no_272820"] = {}, -- 震击
				["1877_aura_no_269129"] = {"HARMFUL", "player"}, -- 积攒电荷
			},
			HLOnRaid = {
				["1877_272820_c"] = "HL_Casting", -- 震击
			},
			PlateAlert = {
				[269116] = "PlateSpells", -- 吸取能量
				[272820] = "PlateSpells", -- 震击	
			},
		},
		cd = {
			[269116] = 1, -- 吸取能量
			[272820] = 1, -- 震击	
		},
	},
	{ -- 火花引导者			
		id = 139110,
		cd = {
			[272820] = 1, -- 震击	
		},
	},
	{ -- 灾厄妖术师			
		id = 136250,
		alerts = {
			AlertIcon = {
				["1877_com_no_274642"] = {}, -- 熔岩爆裂
				["1877_aura_no_268013"] = {"HARMFUL", "player"}, -- 烈焰震击
			},
			HLOnRaid = {
				["1877_274642_c"] = "HL_Casting", -- 熔岩爆裂
			},
			PlateAlert = {
				[274642] = "PlateSpells", -- 熔岩爆裂
			},
		},
		cd = {
			[274642] = 1, -- 熔岩爆裂
		},
	},
	{ -- 疯狂的孵化者		
		id = 139425,
		alerts = {
			AlertIcon = {
				["1877_aura_no_272698"] = {"HARMFUL", "player"}, -- 瓶中闪电
			},
			PlateAlert = {
				[273995] = "PlateSpells", -- 火油冲击
				[272698] = "PlateSpells", -- 瓶中闪电
			},
		},
		cd = {
			[272699] = 17, -- 毒性喷吐
			[273995] = 1, -- 火油冲击
			[272698] = 22, -- 瓶中闪电
		},
	},
	{ -- 蛋					
		id = 134517,
		alerts = {
			PlateAlert = {
				[264239] = "PlateAuras", -- 孵化
			},
		},
	},
	{ -- 隐秘之牙			
		id = 134602,
		alerts = {
			PlateAlert = {
				[258908] = "PlateAuras", -- 剑刃乱舞
			},
		},
	},
	{ -- 静电充能			
		id = 134691,
		alerts = {
			PlateAlert = {
				[264765] = "PlateSpells", -- 火花
			},
		},
		cd = {
			[264765] = 17, -- 火花
		},
	},
}

G.Dungeons[1041] = { -- 诸王之眠
	{ -- 黄金风蛇			
		id = 135322,
		img = 2176751,
		alerts = {
			AlertIcon = {
				["1762_com_no_265773"] = {}, -- 吐金
				["1762_com_no_265910"] = {}, -- 甩尾
				["1762_cast_no_265923"] = {}, -- 卢彻的召唤
				["1762_cast_no_265781"] = {}, -- 蛇之风
				["1762_aura_no_265773"] = {"HARMFUL", "player"}, -- 吐金		
				["1762_aura_no_265914"] = {"HARMFUL", "player"}, -- 熔化的黄金
			},
			HLOnRaid = {
				["1762_265773_c"] = "HL_Casting", -- 吐金
				["1762_265910_c"] = "HL_Casting", -- 甩尾
			},
			PlateAlert = {
				[265923] = "PlateSpells", -- 卢彻的召唤	
				[265773] = "PlateSpells", -- 吐金
				[265781] = "PlateSpells", -- 蛇之风
			},
		},
		cd = {
			[265923] = 45, -- 卢彻的召唤	
			[265773] = 1, --  吐金
			[265781] = 1, --  蛇之风
		},
	},
	{ -- 殓尸者姆沁巴			
		id = 134993,
		img = 2176738,
		alerts = {
			AlertIcon = {
				["1762_com_no_267702"] = {}, -- 埋葬	
				["1762_com_no_267618"] = {}, -- 排干体液
				["1762_cast_no_267639"] = {}, -- 燃烧腐蚀
				["1762_aura_no_267702"] = {"HARMFUL", "player"}, -- 埋葬	
				["1762_aura_no_267618"] = {"HARMFUL", "player"}, -- 排干体液
				["1762_aura_no_267626"] = {"HARMFUL", "player"}, -- 干枯	
				["1762_aura_no_267874"] = {"HARMFUL", "player"}, -- 燃烧之地
			},
			HLOnRaid = {
				["1762_267702_c"] = "HL_Casting", -- 埋葬	
				["1762_267618_c"] = "HL_Casting", -- 排干体液
			},
			PlateAlert = {
				[267702] = "PlateSpells", -- 埋葬	
				[267618] = "PlateSpells", -- 排干体液
			},
		},
		cd = {
			[267702] = 1, -- 埋葬	
			[267618] = 1, -- 排干体液
		},
	},
	{ -- 葬礼构造体			
		id = 137969,
		alerts = {
			AlertIcon = {
				["1762_com_no_271555"] = {}, -- 埋葬
			},
			HLOnRaid = {
				["1762_271555_c"] = "HL_Casting", -- 埋葬
			},
			PlateAlert = {
				[271561] = "PlateSpells", -- 哀痛恸哭
				[271555] = "PlateSpells", -- 埋葬	
			},
		},
		cd = {
			[271561] = 1, -- 哀痛恸哭
			[271555] = 1, -- 埋葬	
		},
	},
	{ -- 征服者阿卡阿里
		id = 135470,
		img = 2176750,
		alerts = {
			AlertIcon = {
				["1762_com_no_266237"] = {}, -- 衰弱抽击
				["1762_cast_no_266951"] = {}, -- 翻滚
				["1762_aura_no_266238"] = {"HARMFUL", "player"}, -- 粉碎防御
			},
			HLOnRaid = {
				["1762_266237_c"] = "HL_Casting", -- 衰弱抽击
			},
			PlateAlert = {
				[266951] = "PlateSpells", -- 翻滚
			},
		},
		cd = {
			[266951] = 1, -- 翻滚
		},
	},
	{ -- 屠夫库拉				
		id = 135475,
		alerts = {
			AlertIcon = {
				["1762_com_no_266231"] = {}, -- 斩首之斧
				["1762_cast_no_266206"] = {}, -- 旋转利斧
				["1762_aura_no_266231"] = {"HARMFUL", "player"}, -- 斩首之斧
				["1762_aura_no_266191"] = {"HARMFUL", "player"}, -- 回旋飞斧
			},
			HLOnRaid = {
				["1762_266231_c"] = "HL_Casting", -- 斩首之斧
			},
			PlateAlert = {
				[266231] = "PlateSpells", -- 斩首之斧
				[266206] = "PlateSpells", -- 旋转利斧
			},
		},
		cd = {
			[266231] = 23, -- 斩首之斧
			[266206] = 1, -- 旋转利斧
		},
	},
	{ -- 智者扎纳扎尔				
		id = 135472,
		alerts = {
			AlertIcon = {
				["1762_com_no_267308"] = {}, -- 闪电箭
				["1762_cast_no_267273"] = {}, -- 毒性新星	
				["1762_cast_no_267060"] = {}, -- 元素的召唤
			},
			HLOnRaid = {
				["1762_267308_c"] = "HL_Casting", -- 闪电箭
			},
			PlateAlert = {
				[267273] = "PlateSpells", -- 毒性新星	
				[267060] = "PlateSpells", -- 元素的召唤
			},
		},
		cd = {
			[267273] = 22, -- 毒性新星	
			[267060] = 1, -- 元素的召唤
		},
	},
	{ -- 爆裂图腾			
		id = 135764,
		alerts = {
			PlateAlert = {
				[267077] = "PlateSpells", -- 爆炸
			},
		},
		cd = {
			[267077] = 1, -- 爆炸
		},
	},
	{ -- 地墙图腾			
		id = 135759,
		alerts = {
			PlateAlert = {
				[267256] = "PlateAuras", -- 大地之墙

			},
		},
	},
	{ -- 雷鸣图腾			
		id = 135761,
		alerts = {
			PlateAlert = {
				[267257] = "PlateSpells", -- 雷鸣冲坠
			},
		},
		cd = {
			[267257] = 1, -- 雷鸣冲坠

		},
	},
	{ -- 达萨大王			
		id = 136160,
		img = 2176720,
		alerts = {
			AlertIcon = {
				["1762_com_no_268403"] = {}, -- 强风劈砍
				["1762_cast_no_268586"] = {}, -- 剑刃连击
				["1762_cast_no_268932"] = {}, -- 震地之跃
				["1762_aura_no_268419"] = {"HARMFUL", "player"}, -- 强风劈砍
				["1762_aura_no_268769"] = {"HARMFUL", "player"}, -- 穿刺长矛
			},
			HLOnRaid = {
				["1762_268403_c"] = "HL_Casting", -- 强风劈砍
			},
			PlateAlert = {
				[268586] = "PlateSpells", -- 剑刃连击
				[268403] = "PlateSpells", -- 强风劈砍
				[268932] = "PlateSpells", -- 震地之跃
			},
		},
		cd = {
			[268586] = 1, -- 剑刃连击
			[268403] = 1, -- 强风劈砍
			[268932] = 1, -- 震地之跃
		},
	},
	{ -- 莱班				
		id = 136984,
		alerts = {
			HLOnRaid = {
				["1762_269231_3"] = "HL_Cast", -- 狩猎跃击	
			},
		},
	},
	{ -- 提扎拉				
		id = 136976,
		alerts = {
			AlertIcon = {
				["1762_cast_no_269369"] = {}, -- 致命咆哮				
				["1762_aura_no_269369"] = {"HARMFUL", "player"}, -- 致命咆哮
			},
			PlateAlert = {
				[269369] = "PlateSpells", -- 致命咆哮
				[269369] = "PlateAuras", -- 致命咆哮
			},
		},
		cd = {
			[269369] = 24, -- 致命咆哮
		},
	},
	{ -- 净化构造体				
		id = 134739,
		alerts = {
			AlertIcon = {
				["1762_aura_no_270289"] = {"HARMFUL", "player"}, -- 净化光线
				["1762_aura_no_270292"] = {"HARMFUL", "player"}, -- 净化烈焰
			},
			PlateAlert = {
				[270284] = "PlateSpells", -- 净化光线
				[270293] = "PlateSpells", -- 净化打击
			},
		},
		cd = {
			[270284] = 1, -- 净化光线
			[270293] = 1, -- 净化打击
		},
	},
	{ -- 守卫队长阿图				
		id = 137473,
		alerts = {
			AlertIcon = {	
				["1762_aura_no_270084"] = {"HARMFUL", "player"}, -- 飞斧弹幕
			},
			PlateAlert = {
				[270084] = "PlateSpells", -- 飞斧弹幕
			},
		},
		cd = {
			[270084] = 1, -- 飞斧弹幕
		},
	},
	{ -- 帕特拉女王			
		id = 137486,
		alerts = {
			HLOnRaid = {
				["1762_270505_c"] = "HL_Casting", -- 射击
			},
			PlateAlert = {
				[270505] = "PlateSpells", -- 射击	
				[270930] = "PlateSpells", -- 黑暗射击
			},
		},
		cd = {
			[270505] = 1, -- 射击	
			[270930] = 10, -- 黑暗射击 
		},
	},
	{ -- 幽魂巫医				
		id = 135239,
		alerts = {
			AlertIcon = {
				["1762_aura_no_270499"] = {"HARMFUL", "player"}, -- 冰霜震击
			},
		},
	},
	{ -- 幽魂蛮兵				
		id = 135231,
		alerts = {
			PlateAlert = {
				[270514] = "PlateSpells", -- 裂地
			},
		},
		cd = {
			[270514] = 14, -- 裂地
		},
	},
	{ -- 影裔勇士				
		id = 134158,
		alerts = {
			PlateAlert = {
				[269976] = "PlateAuras", -- 先祖狂怒
				[269928] = "PlateAuras", -- 警戒防卫
			},
		},
	},
	{ -- 影裔巫医				
		id = 134174,
		alerts = {
			AlertIcon = {
				["1762_com_no_269973"] = {}, -- 致命刺寒
				["1762_cast_no_269972"] = {}, -- 暗影箭雨
			},
			HLOnRaid = {
				["1762_269973_c"] = "HL_Casting", -- 致命刺寒
			},
			PlateAlert = {
				[269972] = "PlateSpells", -- 暗影箭雨
				[269973] = "PlateSpells", -- 致命刺寒
			},
		},
		cd = {
			[269972] = 1, -- 暗影箭雨
			[269973] = 1, -- 致命刺寒
		},
	},
	{ -- 影裔战士				
		id = 134157,
		alerts = {
			PlateAlert = {
				[269931] = "PlateSpells", -- 狂风鞭笞	
			},
		},
		cd = {
			[269931] = 1, -- 狂风鞭笞
		},
	},
	{ -- 总管姆巴拉			
		id = 134251,
		alerts = {
			PlateAlert = {
				[270901] = "PlateSpells", -- 引发再生
			},
		},
		cd = {
			[270901] = 1, -- 引发再生
		},
	},
	{ -- 拉胡艾大王			
		id = 134331,
		alerts = {
			PlateAlert = {
				[270889] = "PlateAuras", -- 引导闪电
			},
		},
	},
	{ -- 提玛吉大王			
		id = 137474,
		alerts = {
			AlertIcon = {
				["1762_aura_no_270927"] = {"HARMFUL", "player"}, -- 剑刃风暴
			},
			HLOnRaid = {
				["1762_270927_3"] = "HL_Cast", -- 剑刃风暴
			},
			PlateAlert = {
				[270927] = "PlateAuras", -- 剑刃风暴
			},
		},
	},
	{ -- 沃希女王				
		id = 137478,
		alerts = {
			AlertIcon = {
				["1762_com_no_270923"] = {}, -- 暗影箭
				["1762_com_no_270920"] = {}, -- 诱惑
				["1762_aura_no_270920"] = {"HARMFUL", "player"}, -- 诱惑
			},
			HLOnRaid = {
				["1762_270923_c"] = "HL_Casting", -- 暗影箭
				["1762_270920_c"] = "HL_Casting", -- 诱惑
			},
			PlateAlert = {
				[270923] = "PlateSpells", -- 暗影箭
				[270920] = "PlateSpells", -- 诱惑
			},
		},
		cd = {
			[270923] = 1, -- 暗影箭
			[270920] = 1, -- 诱惑
		},
	},
	{ -- 活化守卫				
		id = 133935,
		alerts = {
			AlertIcon = {
				["1762_aura_no_270003"] = {"HARMFUL", "player"}, -- 压制猛击
			},
			PlateAlert = {
				[270003] = "PlateSpells", -- 压制猛击
				[270016] = "PlateAuras", -- 释放抑制剂
			},
		},
		cd = {
			[270003] = 1, -- 压制猛击
		},
	},
	{ -- 祖尔之影				
		id = 138489,
		alerts = {
			AlertIcon = {
				["1762_com_no_272388"] = {}, -- 暗影弹幕
				["1762_aura_no_272388"] = {"HARMFUL", "player"}, -- 暗影弹幕
				["1762_aura_no_271640"] = {"HARMFUL", "player"}, -- 黑暗启示
			},
			HLOnRaid = {
				["1762_272388_c"] = "HL_Casting", -- 暗影弹幕
			},
			PlateAlert = {
				[272388] = "PlateSpells", -- 暗影弹幕
			},
		},
		cd = {
			[272388] = 1, -- 暗影弹幕
		},
	},
	{ -- 祖尔的爪牙			
		id = 133943,
		alerts = {
			AlertIcon = {
				["1762_aura_no_269936"] = {"HARMFUL", "player"}, -- 锁定
			},
			PlateAlert = {
				[269935] = "PlateAuras", -- 暗影束缚
			},
		},
	},
	{ -- 荣耀迅猛龙			
		id = 135192,
		alerts = {
			PlateAlert = {
				[270502] = "PlateAuras", -- 狩猎跃击
			},
		},
	},
	{ -- 血誓代理				
		id = 137485,
		alerts = {
			PlateAlert = {
				[270872] = "PlateSpells", -- 暗影旋风
			},
		},
		cd = {
			[270872] = 1, -- 暗影旋风
		},
	},
	{ -- 防腐液				
		id = 137989,
		alerts = {
			AlertIcon = {
				["1762_aura_no_271564"] = {"HARMFUL", "player"}, -- 防腐液
			},
		},
	},
	{ -- 阿库尔大王				
		id = 137484,
		alerts = {
			AlertIcon = {
				["1762_com_no_270865"] = {}, -- 隐秘刀刃 
				["1762_aura_no_270865"] = {"HARMFUL", "player"}, -- 隐秘刀刃
				["1762_aura_no_270868"] = {"HARMFUL", "player"}, -- 残留毒液
			},
			HLOnRaid = {
				["1762_270865_c"] = "HL_Casting", -- 隐秘刀刃
			},
			PlateAlert = {
				[270865] = "PlateSpells", -- 隐秘刀刃
			},
		},
		cd = {
			[270865] = 1, -- 隐秘刀刃
		},
	},
	{ -- 鬼灵妖术祭司				
		id = 135204,
		alerts = {
			AlertIcon = {
				["1762_com_no_270492"] = {}, -- 妖术	
				["1762_com_no_270493"] = {}, -- 幽灵弹
				["1762_aura_no_270492"] = {"HARMFUL", "player"}, -- 妖术
			},
			HLOnRaid = {
				["1762_270492_c"] = "HL_Casting", -- 妖术	
				["1762_270493_c"] = "HL_Casting", -- 幽灵弹
			},
			PlateAlert = {
				[270492] = "PlateSpells", -- 妖术	
				[270493] = "PlateSpells", -- 幽灵弹
			},
		},
		cd = {
			[270492] = 1, -- 妖术	
			[270493] = 1, -- 幽灵弹
		},
	},
}
