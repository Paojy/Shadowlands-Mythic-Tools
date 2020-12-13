local T, C, L, G = unpack(select(2, ...))

G.Dungeons[1187] = {
	{ -- 不屈的参赛者
		id = 170838, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_com_hl_330784"] = {}, -- 通灵箭
				["2293_aura_no_330784"] = {"HARMFUL", "player"}, -- 通灵箭
			},
			HLOnRaid = { -- 团队图标高亮
				["2293_330784"] = "HL_Casting", -- 通灵箭
			},
			PlateAlert = {
				PlateAuras = {
					[341902] = true, -- 不洁热情
				},
			},
		}
	}, 
	{ -- 战场祭师
		id = 174197, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_com_no_337178"] = {}, -- 恶毒打击
				["2293_aura_no_320679"] = {"HARMFUL", "player"}, -- 冲锋
			},
		}
	}, 
	{ -- 残暴者多基格
		id = 167538, 
		alerts = {
			PlateAlert = {
				PlateSpells = {
					[333241] = 16, -- 暴脾气
				},
				PlateAuras = {
					[333241] = true, -- 暴脾气
				},
			},
		}
	}, 
	{ -- 狂怒的血角
		id = 170850, 
		alerts = {
			PlateAlert = {
				PlateSpells = {
					[331316] = 13, -- 暴怒乱舞
					[342125] = 20, -- 野蛮跳跃
				},
				PlateAuras = {
					[331316] = true, -- 暴怒乱舞
				},
			},
		}
	},
	{ -- 粉碎者赫文
		id = 167532, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_com_hl_331288"] = {}, -- 巨人打击
				["2293_aura_no_331288"] = {"HARMFUL", "player"}, -- 巨人打击
			},
			HLOnRaid = { -- 团队图标高亮
				["2293_331288"] = "HL_Casting", -- 巨人打击
			},
			PlateAlert = {
				PlateSpells = {
					[332708] = 15, -- 大地猛击
					[342135] = 17, -- 打断怒吼
				},
			},
		}
	},
	{ -- 老练的里克
		id = 167534, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_com_hl_333845"] = {}, -- 失衡重击
				["2293_aura_no_333845"] = {"HARMFUL", "player"}, -- 失衡重击
			},
			HLOnRaid = { -- 团队图标高亮
				["2293_333845"] = "HL_Casting", -- 失衡重击
			},
			PlateAlert = {
				PlateSpells = {
					[317605] = 16, -- 旋风斩
				},
				PlateAuras = {
					[333839] = true, -- 迅捷打击
				},
			},
		}
	},
	{ -- 斩首者德茜雅
		id = 164451, 
		img = 3752153, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_aura_no_320069"] = {"HARMFUL", "player"}, -- 致死打击
				["2293_com_hl_320069"] = {}, -- 致死打击
				["2293_com_hl_320063"] = {}, -- 猛击
				["2293_aura_hl_326892"] = {"HARMFUL", "player"}, -- 锁定
			},
			HLOnRaid = { -- 团队图标高亮
				["2293_320069"] = "HL_Casting", -- 致死打击
				["2293_320063"] = "HL_Casting", -- 猛击
				["2293_326892"] = "HL_Auras", -- 锁定
			},
			PlateAlert = {
				PlateSpells = {
					[320069] = 22, -- 致死打击
				},
				PlateAuras = {
					[324085] = true,
				},
			},
		},
	}, 
	{ -- 疫毒者巴瑟兰
		id = 164463,
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_com_hl_320120"] = {}, -- 瘟疫箭
				["2293_aura_no_320248"] = {"HARMFUL", "player"}, -- 基因变异
				["2293_aura_no_320180"] = {"HARMFUL", "player"}, -- 剧毒孢子
			},
			HLOnRaid = { -- 团队图标高亮
				["2293_320120"] = "HL_Casting", -- 瘟疫箭
			},
		}
	},
	{ -- 受诅者赛泽尔
		id = 164461,
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_aura_no_333231"] = {"HARMFUL", "player"}, -- 灼热之陨
				["2293_com_hl_320300"] = {},  -- 死灵箭
			},
			HLOnRaid = { -- 团队图标高亮
				["2293_320300"] = "HL_Casting", -- 死灵箭
			},
			PlateAlert = {
				PlateAuras = {
					[320277] = true, --	幽魂转移
					[320293] = true, -- 融入死亡
				},
			},
			ChatMsg = {
				[333231] = "ChatMsgAuras", -- 灼热之陨
			},
		}
	},
	{ -- 卑劣的席拉
		id = 164464,
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_aura_no_333540"] = {"HARMFUL", "player"},
			},
		}
	},
	{ -- 凋零淤泥喷射者
		id = 174210,
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_aura_no_330700"] = {"HARMFUL", "player"}, -- 腐烂凋零
				["2293_aura_no_341949"] = {"HARMFUL", "player"}, -- 枯萎凋零
				["2293_com_hl_330703"] = {}, -- 腐烂污秽
			},
			HLOnRaid = { -- 团队图标高亮
				["2293_330703"] = "HL_Casting", -- 腐烂污秽
			},
		}
	},
	{ -- 染病恐魔
		id = 170690,
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_com_hl_330697"] = {}, -- 腐烂打击
			},
			HLOnRaid = { -- 团队图标高亮
				["2293_330697"] = "HL_Casting", -- 腐烂打击
			},
			PlateAlert = {
				PlateAuras = {
					[319290] = true, --	血肉之盾
				},
			},
		}
	},
	{ -- 腐臭的气囊怪
		id = 163086,
		alerts = {
			PlateAlert = {
				PlateSpells = {
					[330614] = 16, -- 邪恶爆发
				},
				PlateAuras = {
					[345245] = true, --	疾病之云
				},
			},
		}
	},
	{ -- 腥臭屠夫 
		id = 169927,
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_com_hl_332836"] = {}, -- 砍劈
				["2293_aura_no_332836"] = {"HARMFUL", "player"}, -- 砍劈
				["2293_com_hl_330586"] = {}, -- 吞噬血肉
			},
			HLOnRaid = { -- 团队图标高亮
				["2293_332836"] = "HL_Casting", -- 砍劈
				["2293_330586"] = "HL_Casting", -- 吞噬血肉
			},
		}
	},	
	{ -- 斩血
		id = 162317,
		img = 3752169, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_aura_no_321768"] = {"HARMFUL", "player"},
				["2293_aura_no_323406"] = {"HARMFUL", "player"},
				["2293_aura_no_323130"] = {"HARMFUL", "player"},
				["2293_com_hl_323515"] = {}, 
			},
			HLOnRaid = { -- 团队图标高亮
				["2293_323515"] = "HL_Casting",
			},
			PlateAlert = {
				PlateSpells = {
					[323515] = 15,
					[318406] = 20,
				},
			},
		}
	},
	{ -- 蹒跚的弩手
		id = 164510,
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_com_hl_319997"] = {}, -- 射击
				["2293_aura_no_330532"] = {"HARMFUL", "player"}, -- 锯齿箭
				["2293_com_hl_330532"] = {}, -- 锯齿箭
			},
			HLOnRaid = { -- 团队图标高亮
				["2293_319997"] = "HL_Casting", -- 射击
				["2293_330532"] = "HL_Casting", -- 锯齿箭
			},
		}
	},
	{ -- 无堕者哈夫
		id = 162329,
		img = 3752199, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_aura_no_332670"] = {"HARMFUL", "player"}, -- 辉煌之战
				["2293_aura_no_320165"] = {"HARMFUL", "player"}, -- 赞美洋溢
				["2293_aura_no_320167"] = {"HARMFUL", "player"}, -- 鲜血淋漓
				["2293_aura_no_320711"] = {"HARMFUL", "player"}, -- 怯懦
				["2293_cast_hl_339415"] = {}, -- 雷音贯耳
				["2293_cast_hl_320729"] = {}, -- 群体顺劈
				["2293_cast_hl_317231"] = {}, -- 碾压重击
				["2293_cast_hl_320644"] = {}, -- 残酷连击
				["2293_aura_no_331606"] = {"HARMFUL", "player"},
			},
			PlateAlert = {
				PlateSpells = {
					[320050] = 30, -- 玛卓克萨斯之力
				},
			},
		}
	},
	{ -- 桎梏之魂
		id = 169875,
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_aura_no_330810"] = {"HARMFUL", "player"}, -- 束缚灵魂
				["2293_com_hl_332550"] = {}, -- 灵魂之触
			},
			HLOnRaid = { -- 团队图标高亮
				["2293_332550"] = "HL_Casting", -- 灵魂之触
			},
		}
	},
	{ -- 传送门守卫
		id = 167998,
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_aura_no_330725"] = {"HARMFUL", "player"}, -- 暗影易伤
			},
			PlateAlert = {
				PlateAuras = {
					[330716] = true, -- 灵魂风暴
				},
			},
		}
	},
	{ -- 狂热的缚魂者
		id = 160495,
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_aura_no_333708"] = {"HARMFUL", "player"}, -- 灵魂腐蚀
				["2293_aura_no_330868"] = {"HARMFUL", "player"}, -- 通灵箭雨
			},
			PlateAlert = {
				PlateSpells = {
					[330868] = 20, -- 通灵箭雨
				},
			},
		}
	},
	{ -- 白骨魔导师
		id = 170882,
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_aura_no_342675"] = {"HARMFUL", "player"}, -- 骨矛
				["2293_com_hl_342675"] = {}, -- 骨矛
				["2293_com_hl_341771"] = {}, -- 墓穴尖刺
			},
			HLOnRaid = { -- 团队图标高亮
				["2293_342675"] = "HL_Casting", -- 骨矛
				["2293_341771"] = "HL_Casting", -- 墓穴尖刺
			},
			PlateAlert = {
				PlateAuras = {
					[333293] = true, -- 白骨之盾
				},
			},
		}
	},
	{ -- 卑劣的暗语者
		id = 169893,
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_aura_no_333299"] = {"HARMFUL", "player"}, -- 荒芜诅咒
				["2293_com_hl_330875"] = {}, -- 魂霜之灵
				["2293_com_hl_333294"] = {}, -- 死亡之风
			},
			HLOnRaid = { -- 团队图标高亮
				["2293_330875"] = "HL_Casting", -- 魂霜之灵
				["2293_333294"] = "HL_Casting", -- 死亡之风
			},
		}
	},
	{ -- 魂铸白骨编织者 
		id = 162763,
		alerts = {
			PlateAlert = {
				PlateAuras = {
					[331237] = true, -- 骨刺
					[162763] = true, -- 白骨风暴
				},
			},
		}
	},
	{ -- 库尔萨洛克
		id = 162309,
		img = 3753154, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_aura_hl_319567"] = {"HARMFUL", "player"},
				["2293_aura_no_319531"] = {"HARMFUL", "player"},				
				["2293_aura_no_319539"] = {"HARMFUL", "player"},		
				["2293_aura_hl_319521"] = {"HARMFUL", "player"},
				["2293_aura_no_319626"] = {"HARMFUL", "player"},
			},
		}		
	},
	{ -- 无尽女王莫德蕾莎
		id = 165946,
		img = 3752182, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2293_aura_no_324449"] = {"HARMFUL", "player"}, -- 死亡具象
				["2293_com_hl_324589"] = {}, -- 湮灭之箭
				["2293_com_hl_324079"] = {}, -- 收割之镰
				["2293_cast_hl_339573"] = {}, -- 屠戮回响
				["2293_cast_hl_323683"] = {}, -- 攫取裂隙
				["2293_cast_hl_323608"] = {}, -- 黑暗毁灭
			},
			HLOnRaid = { -- 团队图标高亮
				["2293_324589"] = "HL_Casting", -- 湮灭之箭
				["2293_324079"] = "HL_Casting", -- 收割之镰
			},
		}
	},
	{ -- 回响驭牛者
		id = 173549,
		alerts = {
			PlateAlert = {
				PlateSpells = {
					[339706] = 25, -- 幽灵冲锋
				},
			},
		}		
	},
}

G.Dungeons[1183] = {
	{ -- 酤团
		id = 164255, 
		img = 3752168, 
		alerts = {
			
		},
	}, 
	{ -- 伊库斯博士
		id = 164967,
		img = 3752162, 
		alerts = {
			
		}
	},
	{ -- 多米娜
		id = 164266,
		img = 3752163, 
		alerts = {
			
		}
	},
	{ -- 斯特拉达玛侯爵
		id = 164267,
		img = 3752180, 
		alerts = {
			
		}		
	},
}

G.Dungeons[1184] = {
	{ -- 仙木灵居民
		id = 164929,
		alerts = {
			AlertIcon = { -- 图标提示
				["2290_aura_no_322486"] = {"HARMFUL", "player"}, -- 过度生长
				["2290_aura_no_322487"] = {"HARMFUL", "player"}, -- 过度生长
			},		
			PlateAlert = {
				PlateSpells = {
					[321968] = 15, -- 迷乱花粉
				},				
			},
		}
	},
	{ -- 德鲁斯特恶爪者
		id = 165111,
		alerts = {
			AlertIcon = { -- 图标提示
				["2290_aura_no_323043"] = {"HARMFUL", "player"}, -- 放血 
			},		
		}
	},
	{ -- 德鲁斯特收割者
		id = 164921,
		alerts = {
			AlertIcon = { -- 图标提示
				["2290_com_hl_322767"] = {}, -- 灵魂之箭
			},
			HLOnRaid = { -- 团队图标高亮
				["2290_322767"] = "HL_Casting", -- 灵魂之箭
			},
			PlateAlert = {			
				PlateSpells = {
					[322938] = 20, -- 收割精魂
				},
				PlateAuras = {
					[322938] = true, -- 收割精魂 
				},				
			},
		}
	},
	{ -- 德鲁斯特斩魂者
		id = 172991,
		alerts = {
			AlertIcon = { -- 图标提示
				["2290_com_hl_322557"] = {}, -- 灵魂分裂
				["2290_aura_no_322557"] = {"HARMFUL", "player"}, -- 灵魂分裂 
			},
			HLOnRaid = { -- 团队图标高亮
				["2290_322557"] = "HL_Casting", -- 灵魂分裂 
			},
			PlateAlert = {		
				PlateAuras = {
					[322569] = true, -- 兹洛斯之手
				},		
			},			
		}
	},
	{ -- 德鲁斯特碎枝者
		id = 164926,
		alerts = {
			AlertIcon = { -- 图标提示
				["2290_aura_no_325027"] = {"HARMFUL", "player"}, -- 荆棘爆发
			},
			PlateAlert = {
				PlateSpells = {
					[324923] = 15, -- 荆棘爆发
				},
				PlateAuras = {
					[324909] = true, -- 愤怒鞭笞 
				},		
			},	
		}
	},
	{ -- 英格拉·马洛克
		id = 164567, 
		img = 3753152, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2290_aura_hl_328756"] = {"HARMFUL", "player"}, -- 憎恨之容
				["2290_com_hl_323057"] = {}, -- 灵魂之箭
			},
			HLOnRaid = { -- 团队图标高亮
				["2290_323057"] = "HL_Casting", -- 灵魂之箭
			},
		},
	},
	{ -- 宗主奥法兰
		id = 164804,
		alerts = {
			AlertIcon = { -- 图标提示
				["2290_aura_hl_323250"] = {"HARMFUL", "player"}, -- 心能泥浆
			},
			PlateAlert = {
				PlateSpells = {
					[323137] = 15, -- 迷乱花粉
				},
				PlateAuras = {
					[323177] = true, -- 森林之泪
					[331440] = true, -- 动摇的决心
					[321006] = true, -- 灵魂镣铐
					[323059] = true, -- 宗主之怒
				},
			},
		}
	},
	{ -- 纱雾塑形者
		id = 166275,
		alerts = {
			PlateAlert = {
				PlateSpells = {
					[324776] = 22, -- 木棘外壳
				},
				PlateAuras = {
					[324776] = true, -- 木棘外壳
				},
			},
		
		}
	},
	{ -- 纱雾守护者
		id = 166276,
		alerts = {
			PlateAlert = {
				PlateSpells = {
					[331743] = 20, -- 狂乱飞踢
				},
				PlateAuras = {
					[331743] = true, -- 狂乱飞踢
				},
			},	
		}
	},
	{ -- 纱雾照看者
		id = 166299,
		alerts = {
			PlateAlert = {
				PlateSpells = {
					[324914] = 20, -- 滋养森林
				},
				PlateAuras = {
					[324914] = true, -- 滋养森林
				},
			},
		}
	},
	{ -- 纱雾追猎者
		id = 166301,
		alerts = {
			AlertIcon = { -- 图标提示
				["2290_aura_no_325021"] = {"HARMFUL", "player"}, -- 纱雾撕裂
				["2290_com_hl_324987"] = {}, -- 纱雾噬咬
			},
			HLOnRaid = { -- 团队图标高亮
				["2290_324987"] = "HL_Casting", -- 纱雾噬咬
			},
		}
	},
	{ -- 纱雾防御者
		id = 163058,
		alerts = {
			AlertIcon = { -- 图标提示
				["2290_aura_hl_331721"] = {"HARMFUL", "player"}, -- 长矛乱舞
			},		
			PlateAlert = {
				PlateSpells = {
					[331718] = 14, -- 长矛乱舞
				},
				PlateAuras = {
					[331718] = true, -- 长矛乱舞
					[324737] = true, -- 激怒
				},
			},
		}
	},
	{ -- 纱雾防御者
		id = 171772,
		cds = {
			[331718] = 14, -- 长矛乱舞
		}
	},
	{ -- 纱雾钉刺蛾
		id = 166304,
		alerts = {
			AlertIcon = { -- 图标提示
				["2290_aura_no_325224"] = {"HARMFUL", "player"}, -- 心能注入
			},	
		}
	},
	{ -- 唤雾者
		id = 164501,
		img = 3752181, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2290_cast_no_336499"] = {}, -- 猜谜游戏
				["2290_cast_hl_321834"] = {}, -- 闪避球
				["2290_cast_hl_321828"] = {}, -- 肉饼蛋糕
				["2290_cast_no_341709"] = {}, -- 鬼抓人
				["2290_aura_hl_321891"] = {"HARMFUL", "player"}, -- 鬼抓人锁定
			},
		}
	},
	{ -- 锥喉掠夺者
		id = 167116,
		alerts = {
			AlertIcon = { -- 图标提示
				["2290_aura_no_326092"] = {"HARMFUL", "player"}, -- 衰弱毒药
			},		
		}
	},
	{ -- 锥喉酸咽者
		id = 167113,
		alerts = {
			AlertIcon = { -- 图标提示
				["2290_aura_no_325418"] = {"HARMFUL", "player"}, -- 不稳定的酸液
			},
		}
	},
	{ -- 锥喉饕餮者
		id = 172312,
		alerts = {
			PlateAlert = {
				PlateSpells = {
					[326021] = 15, -- 酸性水滴
				},
			},
		}
	},
	{ -- 锥喉鹿角巨虫
		id = 167111,
		alerts = {
			PlateAlert = {
				PlateAuras = {
					[340544] = true, -- 再生鼓舞
					[326046] = true, -- 模拟抗性
				},
			},
		}
	},
	{ -- 特雷德奥瓦
		id = 164517,
		img = 3752194, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2t290_cast_no_322550"] = {}, -- 加速孵化
				["2290_aura_hl_326309"] = {"HARMFUL", "player"}, -- 腐烂酸液
				["2290_cast_hl_322614"] = {}, -- 心灵连接
				["2290_aura_hl_322648"] = {"HARMFUL", "player"}, -- 心灵连接
				["2290_aura_hl_322563"] = {"HARMFUL", "player"}, -- 被标记的猎物
				["2290_cast_no_337255"] = {}, -- 寄生占据
				["2290_cast_no_337235"] = {}, -- 寄生平静
				["2290_cast_no_337249"] = {}, -- 寄生瘫痪
			},
			PlateAlert = {
				PlateAuras = {
					[322450] = true, -- 吞噬
					[322527] = true, -- 暴食护盾
				},
			},
		}
	},
}

G.Dungeons[1188] = {
	{ -- 复生的祭师
		id = 168992,
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_com_hl_328707"] = {}, -- 铭文师
				["2291_com_hl_328740"] = {}, -- 黑暗莲花
			},
			HLOnRaid = { -- 团队图标高亮
				["2291_328707"] = "HL_Casting", -- 铭文师
				["2291_328740"] = "HL_Casting", -- 黑暗莲花
			},
			PlateAlert = {
				PlateSpells = {
					[328740] = 15, -- 黑暗莲花
				},
			},
		}
	},
	{ -- 复生的督军
		id = 169905,
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_aura_no_333641"] = {"HARMFUL", "player"}, -- 放血之击
			},
			PlateAlert = {
				PlateSpells = {
					[333641] = 13, -- 放血之击
				},
				PlateAuras = {
					[333227] = true, -- 不死之怒
				},
			},
		}
	},
	{ -- 复生的骷髅战士
		id = 168949,
		alerts = {
			PlateAlert = {
				PlateSpells = {
					[333729] = 13, -- 巨魔之护
				},
			},
		
		}
	},
	{ -- 亡语者
		id = 168942,
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_com_hl_334076"] = {}, -- 暗影之核
			},
			HLOnRaid = { -- 团队图标高亮
				["2291_334076"] = "HL_Casting", -- 暗影之核
			},
			PlateAlert = {
				PlateSpells = {
					[334051] = 17, -- 喷涌黑暗
				},
				PlateAuras = {
					[333875] = true, -- 死亡之拥
				},
			},
		}
	},
	{ -- 激怒之灵
		id = 168934,
		alerts = {		
			PlateAlert = {
				PlateAuras = {
					[333787] = true, -- 狂怒	
					[342869] = true, -- 狂怒面具
				},
			},
		}
	},
	{ -- 阿塔莱死亡行者
		id = 170480,
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_aura_no_332678"] = {"HARMFUL", "player"}, -- 龟裂创伤
			},
			PlateAlert = {
				PlateAuras = {
					[332671] = true, -- 剑刃风暴
				},
			},
		}
	},
	{ -- 阿塔莱灾厄妖术师
		id = 170572,
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_aura_no_332605"] = {"HARMFUL", "player"}, -- 妖术
			},
			PlateAlert = {
				PlateSpells = {
					[332608] = 15, -- 闪电倾泻
				},
			},
		}
	},
	{ -- 阿塔莱高阶祭司
		id = 170490,
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_aura_no_332707"] = {"HARMFUL", "player"}, -- 暗言术：痛
				["2291_com_hl_332705"] = {}, -- 惩击
			},
			HLOnRaid = { -- 团队图标高亮
				["2291_332705"] = "HL_Casting", -- 惩击
			},
			PlateAlert = {
				PlateSpells = {
					[332706] = 10, -- 治疗
				},
			},
		}
	},
	{ -- 骷髅迅猛龙
		id = 168986,
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_aura_no_333711"] = {"HARMFUL", "player"}, -- 衰弱之咬t
			},
		}
	},
	{ -- 哈卡
		id = 164558, 
		img = 3752170, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_aura_no_323064"] = {"HARMFUL", "player"}, -- 鲜血弹幕
				["2291_com_hl_323166"] = {}, -- 堕落之血
				["2291_com_hl_322736"] = {}, -- 尖锐脊刺
			},
			HLOnRaid = { -- 团队图标高亮
				["2291_323166"] = "HL_Casting", -- 堕落之血
				["2291_322736"] = "HL_Casting", -- 尖锐脊刺
			},
			PlateAlert = {
				PlateAuras = {
					[322773] = true, -- 鲜血屏障
					[323064] = true, -- 鲜血弹幕
				},
			},
		},
	},  
	{ -- 哈卡之子
		id = 165905, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_aura_hl_328987"] = {"HARMFUL", "player"}, -- 狂热
				["2291_aura_no_323569"] = {"HARMFUL", "player"}, -- 溅洒精魂
			},
			PlateAlert = {
				PlateAuras = {
					[323567] = true, -- 溅洒精魂
					[323544] = true, -- 鲜血新星
				},
			},
		},
	}, 
	{ -- 4.RF-4.RF
		id = 167964,
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_aura_no_331846"] = {"HARMFUL", "player"}, -- W-00F	
			},
			PlateAlert = {
				PlateSpells = {
					[331846] = 10, -- W-00F	
					[331548] = 8, -- 钢铁下颚
				},
			},
		}
	},
	{ -- 失灵的牙钻
		id = 167962,
		alerts = {
			PlateAlert = {
				PlateAuras = {
					[331927] = true, -- 失控
				},	
			},	
		}
	},
	{ -- 无头的终端机
		id = 167963,
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_com_hl_332196"] = {}, -- 释放能量
			},
			HLOnRaid = { -- 团队图标高亮
				["2291_332196"] = "HL_Casting", -- 释放能量
			},
			PlateAlert = {
				PlateAuras = {
					[332156] = true, -- 超频启动
					[332158] = true, -- 额外线程
				},	
			},
		
		}
	},
	{ -- 有知觉的油
		id = 167967,
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_com_hl_332234"] = {}, -- 挥发精油
			},
			HLOnRaid = { -- 团队图标高亮
				["2291_332234"] = "HL_Casting", -- 挥发精油
			},
		
		}
	},
	{ -- 润滑器
		id = 167965,
		alerts = {
			PlateAlert = {
				PlateSpells = {
					[331379] = 10, -- 润滑剂
					[332084] = 14, -- 自清洁循环
				},
			},
		}
	},
	{ -- 法力风暴老公
		id = 164556,
		img = 3752193, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_com_hl_320008"] = {}, -- 寒冰箭
				["2291_aura_no_320008"] = {"HARMFUL", "player"}, -- 寒冰箭
				["2291_cast_hl_326899"] = {}, -- 召唤能量水晶 -- TEST
				["2291_cast_hl_320141"] = {}, -- 末日魔王！
				["2291_cast_hl_320132"] = {}, -- 暗影之怒
			},
			HLOnRaid = { -- 团队图标高亮
				["2291_320008"] = "HL_Casting", -- 寒冰箭
			},
			PlateAlert = {
				PlateAuras = {
					[342905] = true, -- 冰冻之心
					[320785] = true, -- 势不可挡
				},
			},
		}
	},
	{ -- 法力风暴老婆
		id = 164555,
		alerts = { 
			AlertIcon = { -- 图标提示
				["2291_com_hl_320168"] = {}, -- 投掷电锯
				["2291_cast_no_332509"] = {}, -- 正在校准……
				["2291_cast_hl_321061"] = {}, -- 飞行火箭鸡弹幕
				["2291_aura_no_320147"] = {"HARMFUL", "player"}, -- 流血
				["2291_aura_no_320144"] = {"HARMFUL", "player"}, -- 电锯
				["2291_aura_no_323877"] = {"HARMFUL", "player"}, -- 反射手指型激光发射器究极版
				["2291_aura_no_324010"] = {"HARMFUL", "player"}, -- 发射	
				["2291_cast_hl_320823"] = {}, -- 实验型松鼠炸弹	
			},
			HLOnRaid = { -- 团队图标高亮
				["2291_320168"] = "HL_Casting", -- 投掷电锯
				["2291_320144"] = "HL_Casting", -- 电锯	
			},
		}
	},
	{ -- 仙野烁光蛾
		id = 164862,
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_aura_no_334493"] = {"HARMFUL", "player"}, -- 催眠光粉
			},	
		
		}
	},
	{ -- 大角符文牡鹿
		id = 164873,
		alerts = {
		PlateAlert = {
			PlateAuras = {
					[323123] = true, -- 心能星尘风暴
				},
			},
		}
	},
	{ -- 幼年符文牡鹿
		id = 171342,
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_aura_no_334530"] = {"HARMFUL", "player"}, -- 诱捕淤血
			},
		}
	},
	{ -- 领地刃喙鹤
		id = 171181,
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_aura_no_334535"] = {"HARMFUL", "player"}, -- 啄裂
			},	
		}
	},
	{ -- 艾柯莎
		id = 164450,
		img = 3753147, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_aura_hl_321948"] = {"HARMFUL", "player"}, -- 定向爆破计谋
				["2291_aura_no_342961"] = {"HARMFUL", "player"}, -- 定向爆破计谋
				["2291_aura_no_323687"] = {"HARMFUL", "player"}, -- 奥术闪电
				["2291_cast_hl_320230"] = {}, -- 爆破计谋
				["2291_cast_hl_324090"] = {}, -- 错位冲击波
			},	
		}
	},
	{ -- 穆厄扎拉
		id = 166608,
		img = 3752184, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2291_aura_no_325258"] = {"HARMFUL", "player"}, -- 死亡之主
				["2291_cast_hl_325258"] = {}, -- 死亡之主
				["2291_aura_no_325725"] = {"HARMFUL", "player"}, -- 寰宇操控
				["2291_cast_hl_325725"] = {}, -- 寰宇操控
				["2291_com_hl_27646"] = {}, -- 灵魂碎裂
				["2291_cast_hl_326171"] = {}, -- 粉碎现实
				["2291_cast_hl_334961"] = {}, -- 碾压
				["2291_cast_no_334970"] = {}, -- 凝结
				["2291_aura_no_327893"] = {"HARMFUL", "player"}, -- 邦桑迪的热情
			},
			HLOnRaid = { -- 团队图标高亮
				["2291_27646"] = "HL_Casting", -- 灵魂碎裂
			},
		}		
	},
}

G.Dungeons[1186] = {
	{ -- 金塔拉
		id = 162059, 
		img = 3752177, 
		alerts = {
			
		},
	}, 
	{ -- 雯图纳柯丝
		id = 162058,
		img = 3752198, 
		alerts = {
			
		}
	},
	{ -- 奥莱芙莉安
		id = 162060,
		img = 3752189, 
		alerts = {
			
		}
	},
	{ -- 疑虑圣杰德沃斯
		id = 162061,
		img = 3752160, 
		alerts = {
			
		}		
	},
}

G.Dungeons[1185] = {
	{ -- 劳苦的管理员
		id = 165415,
		alerts = {
			AlertIcon = { -- 图标提示
				["2287_com_no_338005"] = {}, -- 拍击
			},
			HLOnRaid = { -- 团队图标高亮
				["2287_338005"] = "HL_Casting", -- 拍击
			},	
		}
	},
	{ -- 哈尔吉亚斯的碎片
		id = 164557,
		alerts = {
			PlateAlert = {
				PlateSpells = {
					[326409] = 23, -- 痛击
					[326441] = 23, -- 罪孽震击
				},
				PlateAuras = {
					[326409] = true, -- 痛击
				},
			},
		}
	},
	{ -- 堕落的搜集者
		id = 165529,
		alerts = {
			AlertIcon = { -- 图标提示
				["2287_aura_no_325700"] = {"HARMFUL", "player"}, -- 收集罪恶
				["2287_aura_no_325701"] = {"HARMFUL", "player"}, -- 生命虹吸
			},
			PlateAlert = {
				PlateSpells = {
					[325700] = 10, -- 收集罪恶
					[325701] = 23, -- 生命虹吸
				},
			},
		}
	},
	{ -- 堕落的歼灭者
		id = 165414,
		alerts = {
			AlertIcon = { -- 图标提示
				["2287_aura_hl_325876"] = {"HARMFUL", "player"}, -- 湮灭诅咒
				["2287_com_no_338003"] = {}, -- 邪恶箭矢
			},
			HLOnRaid = { -- 团队图标高亮
				["2287_338003"] = "HL_Casting", -- 邪恶箭矢
			},
			PlateAlert = {
				PlateSpells = {
					[325876] = 16, -- 湮灭诅咒
				},
			},
		}
	},
	{ -- 堕落的驯犬者
		id = 164562,
		alerts = {
			AlertIcon = { -- 图标提示
				["2287_com_hl_325535"] = {}, -- 射击
				["2287_com_hl_325793"] = {}, -- 急速射击
			},
			HLOnRaid = { -- 团队图标高亮
				["2287_325535"] = "HL_Casting", -- 射击
				["2287_325793"] = "HL_Casting", -- 急速射击
			},
			PlateAlert = {
				PlateSpells = {
					[325793] = 20, -- 急速射击 
				},
				PlateAuras = {
					[325797] = true, -- 急速射击
					[326450] = true, -- 忠心的野兽
				},
			},
		}
	},
	{ -- 邪恶的加尔贡
		id = 164563,
		alerts = {
			AlertIcon = { -- 图标提示
				["2287_aura_no_344993"] = {"HARMFUL", "player"}, -- 锯齿横扫
			},
			PlateAlert = {
				PlateSpells = {
					[329324] = 10, -- 裂石啃咬
				},
			},
		}
	},
	{ -- 堕落的黑暗剑士
		id = 165515,
		alerts = {
			PlateAlert = {
				PlateSpells = {
					[325523] = 12, -- 致命推刺 
				},
			},	
		}
	},
	{ -- 堕落的黑暗剑士
		id = 167615,
		cds = {
			[325523] = 10, -- 致命推刺 
		},
	},
	{ -- 哈尔吉亚斯，罪污巨像
		id = 165408, 
		img = 3752171, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2287_cast_hl_322711"] = {}, -- 折射罪光
				["2287_cast_no_322936"] = {}, -- 粉碎砸击
				["2287_aura_no_323001"] = {"HARMFUL", "player"}, -- 玻璃裂片
				["2287_cast_no_322943"] = {}, -- 举起残骸
			},
		},
	},
	{ -- 艾谢朗
		id = 164185,
		img = 3752165, 
		alerts = {
			AlertIcon = { -- 图标提示	
				["2287_cast_hl_319733"] = {}, -- 唤石
				["2287_cast_hl_319941"] = {}, -- 碎石之跃
				["2287_aura_no_344874"] = {"HARMFUL", "player"}, -- 粉碎
				["2287_cast_no_328206"] = {}, -- 羁石诅咒
				["2287_aura_hl_319603"] = {"HARMFUL", "player"}, -- 羁石诅咒
				["2287_cast_hl_326389"] = {}, -- 鲜血洪流
				["2287_aura_hl_319703"] = {"HARMFUL", "player"}, -- 鲜血洪流
				["2287_aura_no_319611"] = {"HARMFUL", "player"}, -- 变成石头
			},
		}
	},
	{ -- 不死石精
		id = 164363,
		alerts = {
			PlateAlert = {
				PlateAuras = {
					[319724] = true, -- 石头形态
				},
			},
		}
	},
	{ -- 审判官西加尔
		id = 167876,
		alerts = {
			AlertIcon = { -- 图标提示
				["2287_aura_no_326891"] = {"HARMFUL", "player"}, -- 痛楚
				["2287_com_hl_326829"] = {}, -- 邪恶箭矢
			},
			HLOnRaid = { -- 团队图标高亮
				["2287_326829"] = "HL_Casting", -- 邪恶箭矢
			},
			PlateAlert = {
				PlateSpells = {
					[326794] = 31, -- 黑暗契约
					[326847] = 11, -- 驱散罪孽
				},
			},
		}
	},
	{ -- 嫉妒具象
		id = 167898,
		alerts = {
			AlertIcon = { -- 图标提示
				["2287_aura_hl_340446"] = {"HARMFUL", "player"}, -- 嫉妒之印
			},	
		}
	},
	{ -- 高阶裁决官阿丽兹
		id = 165410,
		img = 3753150, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2287_com_no_323538"] = {}, -- 能量箭
				["2287_cast_hl_323552"] = {}, -- 能量箭雨
				["2287_cast_hl_329340"] = {}, -- 心能喷泉
			},
			HLOnRaid = { -- 团队图标高亮
				["2287_323538"] = "HL_Casting", -- 能量箭
			},
		}
	},
	{ -- 阴森的教民
		id = 165913,
		alerts = {
			AlertIcon = { -- 图标提示		
				["2287_aura_hl_323650"] = {"HARMFUL", "player"}, -- 萦绕锁定		
			},
		
		}
	},
	{ -- 宫务大臣
		id = 164218,
		img = 3752179, 
		alerts = {
			AlertIcon = { -- 图标提示		
				["2287_cast_hl_329113"] = {}, -- 念力突袭	
				["2287_cast_no_323143"] = {}, -- 念力投掷
				["2287_cast_hl_323236"] = {}, -- 释放苦痛
				["2287_cast_hl_327885"] = {}, -- 痛苦爆发
				["2287_cast_hl_323437"] = {}, -- 傲慢罪印
				["2287_aura_no_323437"] = {"HARMFUL", "player"}, -- 傲慢罪印
				["2287_cast_hl_328791"] = {}, -- 哀伤仪式
				["2287_aura_no_335338"] = {"HARMFUL", "player"}, -- 哀伤仪式
			},
			PlateAlert = {
				PlateAuras = {
					[328791] = true, -- 哀伤仪式
				},
			},
		}
	},
}

G.Dungeons[1189] = {
	{ -- 贪食的克里克西斯
		id = 162100, 
		img = 3753153, 
		alerts = {
			PlateAlert = {
				PlateAuras = {
					[319657] = true, -- 精华翻涌
					[319654] = true, -- 饥苦吸取
				},
				PlatePower = true,
			},
		},
	},
	{ -- 执行者塔沃德
		id = 162103,
		img = 3753148, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2284_cast_hl_328424"] = {}, -- 罪触心能		
				["2284_aura_hl_328494"] = {"HARMFUL", "player"}, -- 罪触心能
				["2284_com_hl_322554"] = {}, -- 严惩
				["2284_aura_no_322554"] = {"HARMFUL", "player"}, -- 严惩
			},
			HLOnRaid = { -- 团队图标高亮
				["2287_322554"] = "HL_Casting", -- 严惩
			},
		}
	},
	{ -- 瞬息具象
		id = 168882,
		alerts = {
			AlertIcon = { -- 图标提示	
				["2284_aura_hl_323573"] = {"HARMFUL", "player"}, -- 残渣
			},
			PlateAlert = {
				PlatePower = true,
			},
		}
	},
	{ -- 大学监贝律莉娅
		id = 162102,
		img = 3753149, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2284_cast_hl_325360"] = {}, -- 至高仪式
				["2284_aura_hl_328737"] = {"HELPFUL", "player"}, -- 光辉残片			
				["2284_aura_no_328593"] = {"HARMFUL", "player"}, -- 苦痛刑罚
				["2284_cast_no_326039"] = {}, -- 无尽的折磨
				["2284_aura_no_325881"] = {"HARMFUL", "player"}, -- 苦恨痛哭
				["2284_com_hl_325254"] = {}, -- 钢铁尖刺 
			},
			PlateAlert = {
				PlateAuras = {
					[326039] = true, -- 无尽的折磨
				},
			},
		}
	},
	{ -- 卡尔将军
		id = 162099,
		img = 3752167, 
		alerts = {
			AlertIcon = { -- 图标提示
				["2284_aura_no_326790"] = {"HARMFUL", "player"}, -- 辉光充能
				["2284_aura_hl_324092"] = {"HELPFUL", "player"}, -- 闪耀光辉
				["2284_cast_hl_322903"] = {}, -- 暗天飑风
				["2284_aura_hl_323845"] = {"HARMFUL", "player"}, -- 邪恶冲刺
				["2284_aura_no_331415"] = {"HARMFUL", "player"}, -- 邪恶创口
				["2284_cast_hl_323821"] = {}, -- 穿刺残影 
			},
			PlateAlert = {
				PlatePower = true,
			},
		}		
	},
}

G.Dungeons[1182] = {
	{ -- 凋骨
		id = 162691, 
		img = 3752157, 
		alerts = {
			
		},
	}, 
	{ -- 收割者
		id = 163157,
		img = 3753146, 
		alerts = {
			
		}
	},
	{ -- 外科医生缝肉
		id = 162689,
		img = 3753158, 
		alerts = {
			
		}
	},
	{ -- 缚霜者纳尔佐
		id = 162693,
		img = 3753155, 
		alerts = {
			
		}		
	},
}




