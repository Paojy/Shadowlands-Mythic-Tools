local T, C, L, G = unpack(select(2, ...))

G.Dungeons[1187] = {
	{ -- 不屈的参赛者
		id = 170838, 
		alerts = {
			AlertIcon = { -- 图标提示
				["1544_com_hl_330784"] = {}, -- 通灵箭
				["1544_aura_no_330784"] = {"HARMFUL", "player"}, -- 通灵箭
			},
			HLOnRaid = { -- 团队图标高亮
				["1544_330784"] = "HL_Casting", -- 通灵箭
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
				["1544_com_no_337178"] = {}, -- 恶毒打击
				["1544_aura_no_320679"] = {"HARMFUL", "player"}, -- 冲锋
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
				["1544_com_hl_331288"] = {}, -- 巨人打击
				["1544_aura_no_331288"] = {"HARMFUL", "player"}, -- 巨人打击
			},
			HLOnRaid = { -- 团队图标高亮
				["1544_331288"] = "HL_Casting", -- 巨人打击
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
				["1544_com_hl_333845"] = {}, -- 失衡重击
				["1544_aura_no_333845"] = {"HARMFUL", "player"}, -- 失衡重击
			},
			HLOnRaid = { -- 团队图标高亮
				["1544_333845"] = "HL_Casting", -- 失衡重击
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
				["1544_aura_no_320069"] = {"HARMFUL", "player"}, -- 致死打击
				["1544_com_hl_320069"] = {}, -- 致死打击
				["1544_com_hl_320063"] = {}, -- 猛击
				["1544_aura_hl_326892"] = {"HARMFUL", "player"}, -- 锁定
			},
			HLOnRaid = { -- 团队图标高亮
				["1544_320069"] = "HL_Casting", -- 致死打击
				["1544_320063"] = "HL_Casting", -- 猛击
				["1544_326892"] = "HL_Auras", -- 锁定
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
				["1544_com_hl_320120"] = {}, -- 瘟疫箭
				["1544_aura_no_320248"] = {"HARMFUL", "player"}, -- 基因变异
				["1544_aura_no_320180"] = {"HARMFUL", "player"}, -- 剧毒孢子
			},
			HLOnRaid = { -- 团队图标高亮
				["1544_320120"] = "HL_Casting", -- 瘟疫箭
			},
		}
	},
	{ -- 受诅者赛泽尔
		id = 164461,
		alerts = {
			AlertIcon = { -- 图标提示
				["1544_aura_no_333231"] = {"HARMFUL", "player"}, -- 灼热之陨
				["1544_com_hl_320300"] = {},  -- 死灵箭
			},
			HLOnRaid = { -- 团队图标高亮
				["1544_320300"] = "HL_Casting", -- 死灵箭
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
				["1544_aura_no_333540"] = {"HARMFUL", "player"},
			},
		}
	},
	{ -- 凋零淤泥喷射者
		id = 174210,
		alerts = {
			AlertIcon = { -- 图标提示
				["1544_aura_no_330700"] = {"HARMFUL", "player"}, -- 腐烂凋零
				["1544_aura_no_341949"] = {"HARMFUL", "player"}, -- 枯萎凋零
				["1544_com_hl_330703"] = {}, -- 腐烂污秽
			},
			HLOnRaid = { -- 团队图标高亮
				["1544_330703"] = "HL_Casting", -- 腐烂污秽
			},
		}
	},
	{ -- 染病恐魔
		id = 170690,
		alerts = {
			AlertIcon = { -- 图标提示
				["1544_com_hl_330697"] = {}, -- 腐烂打击
			},
			HLOnRaid = { -- 团队图标高亮
				["1544_330697"] = "HL_Casting", -- 腐烂打击
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
				["1544_com_hl_332836"] = {}, -- 砍劈
				["1544_aura_no_332836"] = {"HARMFUL", "player"}, -- 砍劈
				["1544_com_hl_330586"] = {}, -- 吞噬血肉
			},
			HLOnRaid = { -- 团队图标高亮
				["1544_332836"] = "HL_Casting", -- 砍劈
				["1544_330586"] = "HL_Casting", -- 吞噬血肉
			},
		}
	},	
	{ -- 斩血
		id = 162317,
		img = 3752169, 
		alerts = {
			AlertIcon = { -- 图标提示
				["1544_aura_no_321768"] = {"HARMFUL", "player"},
				["1544_aura_no_323406"] = {"HARMFUL", "player"},
				["1544_aura_no_323130"] = {"HARMFUL", "player"},
				["1544_com_hl_323515"] = {}, 
			},
			HLOnRaid = { -- 团队图标高亮
				["1544_323515"] = "HL_Casting",
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
				["1544_com_hl_319997"] = {}, -- 射击
				["1544_aura_no_330532"] = {"HARMFUL", "player"}, -- 锯齿箭
				["1544_com_hl_330532"] = {}, -- 锯齿箭
			},
			HLOnRaid = { -- 团队图标高亮
				["1544_319997"] = "HL_Casting", -- 射击
				["1544_330532"] = "HL_Casting", -- 锯齿箭
			},
		}
	},
	{ -- 无堕者哈夫
		id = 162329,
		img = 3752199, 
		alerts = {
			AlertIcon = { -- 图标提示
				["1544_aura_no_332670"] = {"HARMFUL", "player"}, -- 辉煌之战
				["1544_aura_no_320165"] = {"HARMFUL", "player"}, -- 赞美洋溢
				["1544_aura_no_320167"] = {"HARMFUL", "player"}, -- 鲜血淋漓
				["1544_aura_no_320711"] = {"HARMFUL", "player"}, -- 怯懦
				["1544_cast_hl_339415"] = {}, -- 雷音贯耳
				["1544_cast_hl_320729"] = {}, -- 群体顺劈
				["1544_cast_hl_317231"] = {}, -- 碾压重击
				["1544_cast_hl_320644"] = {}, -- 残酷连击
				["1544_aura_no_331606"] = {"HARMFUL", "player"},
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
				["1544_aura_no_330810"] = {"HARMFUL", "player"}, -- 束缚灵魂
				["1544_com_hl_332550"] = {}, -- 灵魂之触
			},
			HLOnRaid = { -- 团队图标高亮
				["1544_332550"] = "HL_Casting", -- 灵魂之触
			},
		}
	},
	{ -- 传送门守卫
		id = 167998,
		alerts = {
			AlertIcon = { -- 图标提示
				["1544_aura_no_330725"] = {"HARMFUL", "player"}, -- 暗影易伤
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
				["1544_aura_no_333708"] = {"HARMFUL", "player"}, -- 灵魂腐蚀
				["1544_aura_no_330868"] = {"HARMFUL", "player"}, -- 通灵箭雨
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
				["1544_aura_no_342675"] = {"HARMFUL", "player"}, -- 骨矛
				["1544_com_hl_342675"] = {}, -- 骨矛
				["1544_com_hl_341771"] = {}, -- 墓穴尖刺
			},
			HLOnRaid = { -- 团队图标高亮
				["1544_342675"] = "HL_Casting", -- 骨矛
				["1544_341771"] = "HL_Casting", -- 墓穴尖刺
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
				["1544_aura_no_333299"] = {"HARMFUL", "player"}, -- 荒芜诅咒
				["1544_com_hl_330875"] = {}, -- 魂霜之灵
				["1544_com_hl_333294"] = {}, -- 死亡之风
			},
			HLOnRaid = { -- 团队图标高亮
				["1544_330875"] = "HL_Casting", -- 魂霜之灵
				["1544_333294"] = "HL_Casting", -- 死亡之风
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
				["1544_aura_hl_319567"] = {"HARMFUL", "player"},
				["1544_aura_no_319531"] = {"HARMFUL", "player"},				
				["1544_aura_no_319539"] = {"HARMFUL", "player"},		
				["1544_aura_hl_319521"] = {"HARMFUL", "player"},
				["1544_aura_no_319626"] = {"HARMFUL", "player"},
			},
		}		
	},
	{ -- 无尽女王莫德蕾莎
		id = 165946,
		img = 3752182, 
		alerts = {
			AlertIcon = { -- 图标提示
				["1544_aura_no_324449"] = {"HARMFUL", "player"}, -- 死亡具象
				["1544_com_hl_324589"] = {}, -- 湮灭之箭
				["1544_com_hl_324079"] = {}, -- 收割之镰
				["1544_cast_hl_339573"] = {}, -- 屠戮回响
				["1544_cast_hl_323683"] = {}, -- 攫取裂隙
				["1544_cast_hl_323608"] = {}, -- 黑暗毁灭
			},
			HLOnRaid = { -- 团队图标高亮
				["1544_324589"] = "HL_Casting", -- 湮灭之箭
				["1544_324079"] = "HL_Casting", -- 收割之镰
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
	{ -- 酷团
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
	{ -- 英格拉
		id = 164567, 
		img = 3753152, 
		alerts = {
			
		},
	}, 
	{ -- 唤雾者
		id = 164501,
		img = 3752181, 
		alerts = {
			
		}
	},
	{ -- 特雷德奥瓦
		id = 164517,
		img = 3752194, 
		alerts = {
			
		}
	},
}

G.Dungeons[1188] = {
	{ -- 哈卡
		id = 164558, 
		img = 3752170, 
		alerts = {
			
		},
	}, 
	{ -- 法力风暴老公
		id = 164556,
		img = 3752193, 
		alerts = {
			
		}
	},
	{ -- 法力风暴老婆
		id = 164555,
		alerts = {
			
		}
	},
	{ -- 艾柯莎
		id = 164450,
		img = 3753147, 
		alerts = {
			
		}
	},
	{ -- 穆厄扎拉
		id = 166608,
		img = 3752184, 
		alerts = {
			
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
	{ -- 罪污巨像
		id = 165408, 
		img = 3752171, 
		alerts = {
			
		},
	}, 
	{ -- 艾谢郎
		id = 164185,
		img = 3752165, 
		alerts = {
			
		}
	},
	{ -- 高阶裁决官阿丽兹
		id = 165410,
		img = 3753150, 
		alerts = {
			
		}
	},
	{ -- 宫务大臣
		id = 164218,
		img = 3752179, 
		alerts = {
			
		}
	},
}

G.Dungeons[1189] = {
	{ -- 贪食的克里克西斯
		id = 162100, 
		img = 3753153, 
		alerts = {
			
		},
	}, 
	{ -- 执行者塔沃德
		id = 162103,
		img = 3753148, 
		alerts = {
			
		}
	},
	{ -- 大学监贝律莉娅
		id = 162102,
		img = 3753149, 
		alerts = {
			
		}
	},
	{ -- 卡尔将军
		id = 162099,
		img = 3752167, 
		alerts = {
			
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




