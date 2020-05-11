--[[
这是CO的数据表
name,名字,指明CO的称呼
note,描述,用来说明该CO的相关信息
coHit,指明该CO擅长的,感兴趣的,或高兴的事物
coMiss,指明该CO不擅长的,不感兴趣的,或令其头疼的事物
quote,口头禅,描述CO经常挂在嘴边
powers,表,属性如下(除非特殊说明,否则数值默认为0)
	基础数据
	name,能力名
	translate,能力名的翻译
	note,能力描述

	过滤条件(类型一般为字符串或字符串表,默认为"")
	corpType兵种类型(默认为所有兵种全符合条件)
	terrainType地形类型(默认为所有处于terrainType的单位全符合条件)
	weatherType天气类型(默认为所有在weatherType下的单位全符合条件)

	持续效果
	capturableIncome据点收入
	capturableRepairHP据点修复量
	damageFix损伤修正的最大最小值(百分数),默认为{0,10}
	attack攻击修正百分数
	counterAttack反击修正百分数(累乘attack)
	defence防御百分比
	indirectDefence防御间接攻击百分数
	enemyTerrainDefendLVminus敌方地形防御等级减少
	movement移动力
	attackRangeMax最大射程
	enemyDamageTransformSelfFunds敌人损伤转化自身资金率(百分数)
	fuelConsumePerDay日消耗油量

	瞬发效果
	selfHPplus自身HP增加(百分数)
	selfUnitSupply自军单位补给
	selfFundsIncreasePercent自身资金增加(百分数)
	enemyHPminus敌人HP减少(百分数)
	enemyGasMinus敌人燃料减少(百分数)
	enemyEnergySlotMinus_MoneyPercent敌人能量槽根据自身资金减少(百分比,表明减少程度)
	Silo火箭打击效果,字符串,指明需要的算法
	weatherChange天气改变,字符串
	moveAgain再次行动,布尔值
]]

Commanders={
	--Orange Star
	{name="Nell",
	troop="OrangeStar",
	note="Rachel的大姐,橙星最高指挥官,一个精于指挥,有超高时尚感的长官",
	hit="任性的学生",miss="假期",
	quote="你需要额外指导吗?",
	d2d="损伤波动0%～20%",
	powers={
		{name="Lucky",translate="幸运",features={
			{damageFix={0,20}}
		}},
		{name="Lucky Star",translate="幸运星",energySlot=3,features={
			{damageFix={0,60}}
		}},
		{name="Lady Luck",translate="幸运女神",energySlot=3,features={
			{damageFix={0,100}}
		}},
	},
	author="Offical"},

	{name="Andy",
	troop="OrangeStar",
	note="一个扳手专家,这个机械怪才少年在上次大战中拯救了宏大陆,获得了名誉",
	hit="机械",miss="早起",
	quote="如果你要修理,那么我就是你要找的人!",
	d2d="没有真正弱点,海陆空的老手,随时随地作战",
	powers={
		{name="Normal",translate="普通"},
		{name="Hyper Repair",translate="超级修复",energySlot=3,features={
			{selfHPplus=20}
		}},
		{name="Hyper Upgrade",translate="超级更新",energySlot=3,features={
			{selfHPplus=50,attack=20,movement=1}
		}},
	},
	author="Offical"},

	{name="Max",
	troop="OrangeStar",
	note="一个勇敢而又忠实的朋友,更不用说是个坚强的战士,Max憎恨任何形式的背叛行为,喜欢比较老式的、乱哄哄的拳赛",
	hit="负荷训练",miss="学习",
	quote="现在轮到我了",
	d2d="近程攻击单位(占领系除外)攻击+20%;远程攻击单位射程-1",
	powers={
		{name="DirectAttack",translate="直接攻击",features={
			{corpType="DirectAttack_NotCapturable",attack=20},
			{corpType="IndirectAttack",attackRangeMax=-1,attack=-10,defence=-10}
		}},
		{name="Max Force",translate="最大力量",energySlot=3,features={
			{corpType="DirectAttack_NotCapturable",attack=50,movement=1},
			{corpType="IndirectAttack",attackRangeMax=-1,attack=-10}
		}},
		{name="Max Blast",translate="最大爆发",energySlot=3,features={
			{corpType="DirectAttack_NotCapturable",attack=80,movement=2},
			{corpType="IndirectAttack",attackRangeMax=-1}
		}}
	},
	author="Offical"},

	{name="Sami",
	troop="OrangeStar",
	note="一个固执己见的橙星特种单位队长,喜欢留长发",
	hit="巧克力",miss="懦夫",
	quote="准备值班!",
	d2d="占领系兵种攻击+20%,占领速度+50%;非占领系近程攻击单位攻击-10%",
	powers={
		{name="Capture",translate="占领",features={
			{corpType="Capturable",attack=20,captureSpeed=50},
			{corpType="DirectAttack_NotCapturable",attack=-10},
			{corpType="PowerlessCarrier",movement=1}
		}},
		{name="Double Time",translate="急行军",energySlot=3,features={
			{corpType="Capturable",attack=50,defence=5,movement=1,moveTerrainCost1=true,captureSpeed=50},
			{corpType="DirectAttack_NotCapturable",attack=-10},
			{corpType="PowerlessCarrier",movement=1}
		}},
		{name="Victory March",translate="胜利行军",energySlot=5,features={
			{corpType="Capturable",attack=80,defence=10,movement=2,moveTerrainCost1=true,captureSpeed=2000},
			{corpType="DirectAttack_NotCapturable",attack=-10},
			{corpType="PowerlessCarrier",movement=1}
		}},
	},
	author="Offical"},

	{name="Hachi",
	troop="OrangeStar",
	note="贩卖军用商品和战斗地图的店主，曾经是橙星总司令",
	hit="茶",miss="药",
	quote="来唱游击队歌吧",
	d2d="单位造价-10%",
	powers={
		{name="Trade",translate="交易",features={
			{price=-10}
		}},
		{name="Barter",translate="讨价还价",energySlot=3,features={
			{price=-50}
		}},
		{name="Merchant Union",translate="商业联盟",energySlot=3,features={
			{price=-50,CityBuild="LandForce"}
		}},
	},
	author="Offical"},

	{name="Jake",
	troop="OrangeStar",
	note="一个年轻,且经历充沛的橙星CO,一流的坦克指挥官",
	hit="俱乐部",miss="舒缓的音乐",
	quote="气氛搞起来!音乐嗨起来!",
	d2d="处在Plain上的单位攻击+10%(无论海陆空)",
	powers={
		{name="Plain",translate="平原",features={
			{terrainType="Plain",attack=10}
		}},
		{name="Beat Down",translate="打倒",energySlot=3,features={
			{terrainType="Plain",attack=20},
			{corpType="LandForce_IndirectAttack",attackRangeMax=1}
		}},
		{name="Block Rock",translate="滚石",energySlot=3,features={
			{terrainType="Plain",attack=40},
			{corpType="LandForce_IndirectAttack",attackRangeMax=1},
			{corpType="Vehicle",movement=2}
		}},
	},
	author="Offical"},

	{name="Rachel",
	troop="OrangeStar",
	note="一个年轻的橙星CO,她努力跟随着她大姐Nell的脚步,她给她的单位带来了新的气息",
	hit="努力工作",miss="借口",
	d2d="单位很努力工作，据点每回合HP恢复+10%",
	powers={
		{name="Hard",translate="努力",features={
			{capturableRepairHP=10}
		}},
		{name="Lucky Lass",translate="幸运少女",energySlot=3,features={
			{capturableRepairHP=10,damageFix={0,40}}
		}},
		{name="Covering Fire",translate="火力掩护",energySlot=3,features={
			{capturableRepairHP=10},
			{Silo="CapturableCorps"},
			{Silo="HighestPrice"},
			{Silo="MostIntensive"},
		}},
	},
	author="Offical"},

--Blue Moon
	{name="Olaf",
	troop="BlueMoon",
	note="也许是个自大吹牛的人,但是他战术英勇让他赢得了同辈的尊敬和民众的钦佩",
	hit="暖靴子",miss="雨云",
	quote="我最喜欢打雪仗了,不论雪下得多大...",
	d2d="雪天时,攻击+20%,燃料损耗不受影响;下雨天燃料损耗加倍",
	powers={
		{name="Snow",translate="雪",features={
			{weatherType="Snowy",attack=20},
			{weatherType="Rainy",fuelCostMultiply=2}
		}},
		{name="Bilzzard",translate="暴风雪",energySlot=3,features={
			{weatherType="Snowy",attack=20,weatherChange="Snowy"},
			{weatherType="Rainy",fuelCostMultiply=2}
		}},
		{name="Winter Fury",translate="寒冬之怒",energySlot=4,features={
			{weatherType="Snowy",attack=20,weatherChange="Blizzard",enemyHPminus=20},
			{weatherType="Rainy",fuelCostMultiply=2}
		}},
	},
	author="Offical"},

	{name="Grit",
	troop="BlueMoon",
	note="懒散的风格掩饰了他的可靠,举世无双的神射手,与Olaf搭档得不错",
	hit="猫",miss="耗子",
	quote="在闹啥呢?",
	d2d="远程攻击单位攻击+20%,射程+1;非占领系近程攻击单位攻击-20%",
	powers={
		{name="Snipe",translate="狙击",features={
			{corpType="IndirectAttack",attack=20,attackRangeMax=1},
			{corpType="DirectAttack_NotCapturable",attack=-20}
		}},
		{name="Snipe Attack",translate="狙击攻击",energySlot=3,features={
			{corpType="IndirectAttack",attack=50,attackRangeMax=2},
			{corpType="DirectAttack_NotCapturable",attack=-15}
		}},
		{name="Super Snipe",translate="超级狙击",energySlot=3,features={
			{corpType="IndirectAttack",attack=50,attackRangeMax=3},
			{corpType="DirectAttack_NotCapturable",attack=-10}
		}},
	},
	author="Offical"},

	{name="Colin",
	troop="BlueMoon",
	note="蓝月的富家少爷,Sasha的小弟弟,一个有天赋的指挥官,有时候没安全感",
	hit="Olaf和Grit",miss="黑洞军",
	d2d="单位造价-20%，攻击-10%",
	powers={
		{name="Cheap",translate="廉价",features={
			{price=-20,attack=-10}
		}},
		{name="Gold Rush",translate="冲钱",energySlot=2,features={
			{price=-20,attack=-10,fundsIncreasePercent=50}
		}},
		{name="Power of Money",translate="钱的力量",energySlot=4,features={
			{price=-20,attack=-10,moneyPerAttack=300}
		}},
	},
	author="Offical"},

	{name="Sasha",
	troop="BlueMoon",
	note="Colin的姐姐,普通的贵妇人,但在生气的时候非常大胆",
	hit="松露",miss="炸猪肉皮",
	d2d="所占领的据点收入+100G",
	powers={
		{name="Income",translate="收入",features={
			{capturableIncome=100}
		}},
		{name="Market Crash",translate="市场冲击",energySlot=2,features={
			{capturableIncome=100,enemyEnergySlotMinusPerMoney=150}
		}},
		{name="War Bonds",translate="战争公债",energySlot=4,features={
			{capturableIncome=100,enemyDamageTransformSelfFunds=50}
		}},
	},
	author="Offical"},

--GreenEarth
	{name="Eagle",
	troop="GreenEarth",
	note="GreenEarth勇敢的飞行员英雄,为了他父亲遗留下的荣耀而加入了空军",
	hit="幸运护目镜",miss="游泳",
	d2d="空军攻击+20%,日耗油-2;海军攻击-10%",
	powers={
		{name="AirForce",translate="空军",features={
			{corpType="AirForce",attack=20,fuelConsumePerDay=-2},
			{corpType="NavyForce",attack=-20}
		}},
		{name="Lightning Drive",translate="闪电驱动",energySlot=3,features={
			{corpType="AirForce",attack=30,defence=10,fuelConsumePerDay=-2},
			{corpType="NavyForce",attack=-15},
		}},
		{name="Lightning Strike",translate="闪电攻击",energySlot=6,features={
			{corpType="AirForce",attack=40,defence=20,fuelConsumePerDay=-2},
			{corpType="NavyForce",attack=-10},
			{corpType="NotCapturable",moveAgain=true},
		}},
	},
	author="Offical"},

	{name="Drake",
	troop="GreenEarth",
	note="一个慷慨的,讨厌战斗的前海盗,这家伙也是个伟大的冲浪手",
	hit="海洋",miss="高处",
	d2d="海军攻击+20%;空军攻击-10%;不受雨天影响,增加雨天天气概率",
	powers={
		{name="Navy",translate="海军",features={
			{corpType="NavyForce",attack=10,movement=1},
			{corpType="AirForce",attack=-30}
		}},
		{name="Tsunami",translate="海啸",energySlot=4,features={
			{corpType="NavyForce",attack=20,defence=15,movement=1},
			{corpType="AirForce",attack=-20},
			{enemyHPminus=10,enemyGasMinus=50}
		}},
		{name="Typhoon",translate="台风",energySlot=3,features={
			{corpType="NavyForce",attack=30,defence=30,movement=1},
			{corpType="AirForce",attack=-10},
			{enemyHPminus=20,enemyGasMinus=50,weatherChange="Rainy"}
		}},
	},
	author="Offcial"},

	{name="Jess",
	troop="GreenEarth",
	note="一个勇敢且又善于分析信息的坦克驾驶员,上次大战的英雄",
	hit="蒲公英",miss="不合格的CO",
	d2d="陆军非占领系攻击+10%;其它单位攻击-10%",
	powers={
		{name="LandForce",translate="陆军",features={
			{corpType="Vehicle",attack=20},
			{corpType="NotVehicle",attack=-10},
		}},
		{name="Turbo Charge",translate="涡轮增压",energySlot=3,features={
			{corpType="Vehicle",attack=30,movement=1},
			{selfUnitSupply=true}
		}},
		{name="Overdrive",translate="超速",energySlot=3,features={
			{corpType="Vehicle",attack=50,movement=2},
			{selfUnitSupply=true}
		}},
	},
	author="Offical"},

	{name="Javier",
	troop="GreenEarth",
	note="一个忠于骑士精神,并认为其高于一切的绿地CO,经常命令他的单位向前冲",
	hit="荣誉",miss="撤退",
	d2d="被间接攻击时防御+20%,且每占领一座指令塔防御+10%",
	powers={
		{name="Tower",translate="塔",features={
			{indirectDefence=20,defencePerTower=10}
		}},
		{name="Tower Shield",translate="塔盾",energySlot=3,features={
			{indirectDefence=40,attackPerTower=20,defencePerTower=20}
		}},
		{name="Tower of Power",translate="力之塔",energySlot=3,features={
			{indirectDefence=60,attackPerTower=30,defencePerTower=30}
		}},
	},
	author="Offical"},

--YellowComet
	{name="Kanbei",
	troop="YellowComet",
	note="黄彗的皇帝，一个有技术的CO，对自己的女儿很和蔼",
	hit="Sonja",miss="电脑",
	d2d="单位攻防造价+20%",
	powers={
		{name="ExpensiveStrong",translate="贵而强大",features={
			{price=20,attack=20,defence=20}
		}},
		{name="Morale Boost",translate="士气提升",energySlot=4,features={
			{price=20,attack=50,defence=30}
		}},
		{name="Samurai Spirit",translate="武士精神",energySlot=3,features={
			{price=20,attack=40,defence=40,counterAttack=100}
		}},
	},
	author="Offical"},

	{name="Sonja",
	troop="YellowComet",
	note="Kanbei冷静又镇定的女儿，喜欢在行动前计划，擅长信息战",
	hit="电脑",miss="Bugs",
	d2d="单位视野+1,降低对方地形防御1级,损伤波动-5%~10%,HP敌方不可见",
	powers={
		{name="vision",translate="视野",features={
			{vision=1,counterAttack=10,enemyTerrainDefendLVminus=1,damageFix={-10,10}}
		}},
		{name="Enhanced Vision",translate="视力增强",energySlot=3,features={
			{vision=2,counterAttack=30,enemyTerrainDefendLVminus=2,damageFix={-10,10},seeHiddenTerrain=true}
		}},
		{name="Counter Break",translate="反击",energySlot=2,features={
			{vision=3,counterAttack=50,enemyTerrainDefendLVminus=3,damageFix={-10,10},seeHiddenTerrain=true,priorityCountAttack=true}
		}},
	},
	author="Offical"},

	{name="Sensei",
	troop="YellowComet",
	note="一个前任伞兵,传说在那个时代已经当过CO",
	hit="懒惰的雨天",miss="忙碌的市场",
	d2d="步兵系攻击+10%,直升机系攻击+50%,无武器运输单位移动+1,海军攻击-10%",
	powers={
		{name="Copter",translate="直升机",features={
			{corpType="Capturable",attack=10},
			{corpType="Copter",attack=50},
			{corpType="PowerlessCarrier",movement=1},
			{corpType="Vehicle",attack=-10},
			{corpType="NavyForce",attack=-10},
		}},
		{name="Copter Command",translate="直升机命令",energySlot=2,features={
			{corpType="Capturable",attack=20},
			{corpType="Copter",attack=70},
			{corpType="PowerlessCarrier",movement=1},
			{corpType="Vehicle",attack=-5},
			{corpType="NavyForce",attack=-10},
			{executeFunction="SelfCity_Infanty_9HP"}
		}},
		{name="Airborne Assault",translate="空降突击",energySlot=4,features={
			{corpType="Capturable",attack=30},
			{corpType="Copter",attack=90},
			{corpType="PowerlessCarrier",movement=1},
			{corpType="NavyForce",attack=-10},
			{executeFunction="SelfCity_Mech_9HP"}
		}},
	},
	author="Offical"},

	{name="Grimm",
	troop="YellowComet",
	note="黄彗性格开朗的CO，不喜欢深究，号称'闪电之Grimm'",
	d2d="单位攻击+30%，防御-20%",
	hit="甜甜圈",miss="规划",
	powers={
		{name="HighAtkLowDef",translate="高攻低防",features={
			{attack=30,defence=-20}
		}},
		{name="Knuckleduster",translate="指节金属套",energySlot=4,features={
			{attack=50,defence=-20}
		}},
		{name="Haymaker",translate="强力一击",energySlot=3,features={
			{attack=30,defence=-20}
		}},
	},
	author="Offical"},

--BlackHole
	{name="Flak",
	troop="BlackHole",
	note="黑洞军的大力士,被Hawke私自提拔",
	hit="肉",miss="蔬菜",
	d2d="损伤波动-10%~25%",
	powers={
		{name="Violent",translate="暴力",features={
			{damageFix={-10,20}}
		}},
		{name="Brute Force",translate="蛮力",energySlot=3,features={
			{damageFix={-20,40}}
		}},
		{name="Barbaric Blow",translate="野吹",energySlot=3,features={
			{damageFix={-30,70}}
		}},
	},
	author="Offical"},

	{name="Adder",
	troop="BlackHole",
	note="一个自恋的CO,认为自己的技术是独一无二的,Hawke给他的评级为第2",
	hit="自己的脸",miss="脏东西",
	d2d="正常",
	powers={
		{name="Move",translate="移动"},
		{name="Sideslip",translate="侧滑",energySlot=2,features={
			{movement=1}
		}},
		{name="Sidewinder",translate="响尾蛇",energySlot=3,features={
			{movement=2}
		}},
	},
	author="Offcial"},

	{name="Lash",
	troop="BlackHole",
	note="黑洞军的神童,小个子且脾气暴躁的杰出发明家",
	hit="随心所欲",miss="不能随心所欲",
	d2d="根据单位所处地形等级,每1级+5%攻击",
	powers={
		{name="Terrain",translate="地形",features={
			{corpType="NotAirForce",attackPerTerrainDefendLV=10}
		}},
		{name="Terrain Tactics",translate="地形策略",energySlot=3,features={
			{corpType="NotAirForce",attackPerTerrainDefendLV=10,moveTerrainCost1=true}
		}},
		{name="Prime Tactics",translate="主要策略",energySlot=3,features={
			{corpType="NotAirForce",attackPerTerrainDefendLV=20,moveTerrainCost1=true}
		}},
	},
	author="Offcial"},

	{name="Hawke",
	troop="BlackHole",
	note="黑洞的4CO之首,会无所畏惧地朝着目标前进",
	hit="黑咖啡",miss="不称职",
	d2d="单位攻击+10%",
	powers={
		{name="Attack",translate="攻击",features={
			{attack=10}
		}},
		{name="Black Wave",translate="黑色波浪",energySlot=5,features={
			{attack=10},
			{execute="SelfUnit_HP",para=10},
			{execute="EnemyUnit_HP",para=-10}
		}},
		{name="Black Storm",translate="黑色风暴",energySlot=4,features={
			{attack=10},
			{execute="SelfUnit_HP",para=20},
			{execute="EnemyUnit_HP",para=-20}
		}},
	},
	author="Offcial"},

	{name="Sturm",
	troop="BlackHole",
	note="黑洞军指挥官,来自另一个世界的入侵者",
	hit="侵略",	miss="和平",
	d2d="所有单位攻击+40%,单位可移动地形的损耗恒为1,不受雨天影响",
	powers={
		{name="Invade",translate="侵略",features={
			{weatherType="NotSnowy",attack=40,moveTerrainCost1=true},
			{weatherType="Snowy",attack=-40,movement=-1},
		}},
		{name="Meteor Strike",translate="陨石攻击",energySlot=10,features={
			{weatherType="NotSnowy",attack=40,moveTerrainCost1=true},
			{weatherType="Snowy",attack=-40,movement=-1},
			{execute="MeteorAttack"}
		}},
	},
	author="Offcial"},

	{name="Jugger",
	troop="BlackHole",
	note="黑洞军中长得像机器人的CO,没人知道他的真正的身份,当他使用他的CO能力时会变得稍微聪明点",
	hit="能量",miss="静电",
	d2d="损伤波动-15%~30%",
	powers={
		{name="Computer",translate="计算机",features={
			{damageFix={-15,30}}
		}},
		{name="Overclock",translate="超频时钟",energySlot=5,features={
			{damageFix={-25,60}}
		}},
		{name="System Crash",translate="系统崩溃",energySlot=4,features={
			{damageFix={-45,90}}
		}},
	},
	author="Offical"},

	{name="Koal",
	troop="BlackHole",
	note="一个黑洞的CO,总是计划着他的下一个毁灭性的表演",
	hit="谚语，拉面",miss="火锅",
	d2d="在公路上的单位攻击+10%",
	powers={
		{name="Road",translate="道路",features={
			{terrainType="Road",attack=10},
		}},
		{name="Forced March",translate="强行推进",energySlot=3,features={
			{terrainType="Road",attack=20,movement=1},
		}},
		{name="System Crash",translate="悲伤足迹",energySlot=2,features={
			{terrainType="Road",attack=40,movement=2},
		}},
	},
	author="Offical"},

	{name="Kindle",
	troop="BlackHole",
	note="Jugger和Koal的上级指挥官,她有着迟钝且女王的个性",
	hit="时髦的东西",miss="过时的东西",
	d2d="在据点上的自军单位攻击+40%",
	powers={
		{name="Base",translate="据点",features={
			{terrainType="Base",attack=40}
		}},
		{name="Urban Blight",translate="城市衰败",energySlot=3,features={
			{terrainType="Base",attack=80},
			{execute="EnemyUnit_OnBase_HP",para=-30}
		}},
		{name="High Society",translate="上流社会",energySlot=3,features={
			{terrainType="Base",attack=120},
			{attackPerBase=3}
		}}
	},
	author="Offical"},

	{name="VonBolt",
	troop="BlackHole",
	note="黑洞军的新首领,迷一般的老人,活了很长时间,Omega战争的策划者",
	hit="长寿",miss="年轻人",
	d2d="单位攻防+10%",
	powers={
		{name="AtkDef",translate="攻防",features={
			{attack=10,defence=10}
		}},
		{name="Ex Machina",translate="救世主",energySlot=10,features={
			{attack=10,defence=10}
			
		}},
	},
	author="Offical"},

	{name="Will",
	troop="RubinelleWarWolf",
	note="Rubinelle军校学员,被Brenner救下后加入Brenner战狼部队",
	quote="永不放弃",
	hit="鼓舞他人",
	miss="杀人魔",
	d2d="陆军近战攻击+10%",
	commandRange=2,
	powers={
		{name="LandBattle",translate="陆战",features={
			{corpType="LandForce_DirectAttack",attack=10}
		}},
		{name="Cry",translate="呐喊",energySlot=6,features={
			{corpType="LandForce_DirectAttack",attack=20,movement=1}
		}},
		{name="Rally Cry",translate="集体呐喊",energySlot=6,features={
			{corpType="LandForce_DirectAttack",attack=30,movement=2}
		}},
	},
	author="Offical & New CO"},

	{name="Brenner",
	troop="RubinelleWarWolf",
	note="战狼部队的队长,他对人性的善良有着不可动摇的信念,并将帮助任何需要帮助的人",
	quote="幸存者需要我们的帮助",
	hit="乐于助人的人",
	miss="自私的人",
	d2d="所有部队防御+10%",
	commandRange=3,
	powers={
		{name="Defence",translate="防御",features={
			{defence=10}
		}},
		{name="Shield Armor",translate="盾甲",energySlot=6,features={
			{defence=20}
		}},
		{name="Reinforce",translate="增援",energySlot=6,features={
			{defence=30,execute="SelfUnitHP",para=30}
		}},
	},
	author="Offical & New CO"},

	{name="Lin",
	troop="RubinelleWarWolf",
	note="战狼部队中性格沉稳的副队长,极为尊敬Brenner队长,即使经常意见不合",
	quote="保持冷静的头脑",
	hit="战术指导",
	miss="杀人魔",
	d2d="陆军攻防+10%",
	commandRange=1,
	powers={
		{name="vision",translate="视野",features={
			{corpType="LandForce",attack=10,defence=10}
		}},
		{name="Telescope",translate="望远镜",energySlot=6,features={
			{corpType="LandForce",attack=20,defence=20,vision=1}
		}},
		{name="Scout",translate="侦察",energySlot=6,features={
			{corpType="LandForce",attack=30,defence=30,vision=2,seeHiddenTerrain=true}
		}},
	},
	author="Offical & New CO"},

	{name="Isabella",
	troop="RubinelleWarWolf",
	note="没有过去的记忆,被Will救下后加入了Brenner战狼部队",
	quote="我记不得任何事情了...",
	hit="Will",
	miss="Caulder",
	d2d="所有部队攻防+10%",
	commandRange=2,
	powers={
		{name="AtkDef",translate="攻防",features={
			{attack=10,defence=10}
		}},
		{name="Deep Interference",translate="深度干扰",energySlot=6,features={
			{attack=15,defence=15,movement=1},
			{corpType="IndirectAttack",attackRangeMax=1}
		}},
		{name="Deep Strike",translate="深度打击",energySlot=6,features={
			{attack=20,defence=20,movement=2},
			{corpType="IndirectAttack",attackRangeMax=2}
		}},
	},
	author="Offical & New CO"},

	{name="Tasha",
	troop="Lazurian",
	note="为了给自己死去的弟弟报仇,而加入了空军,绰号'复仇女神'",
	quote="我要报仇了!",
	hit="弟弟",
	miss="Rubinelle",
	d2d="空军攻防+10%",
	commandRange=1,
	powers={
		{name="AirForce",translate="空军",features={
			{corpType="AirForce",attack=10,defence=10}
		}},
		{name="Air Raid",translate="空袭",energySlot=6,features={
			{corpType="AirForce",attack=30,defence=20,movement=1}
		}},
		{name="Sonic Boom",translate="音爆",energySlot=6,features={
			{corpType="AirForce",attack=50,defence=30,movement=2}
		}},
	},
	author="Offical & New CO"},

	{name="Gage",
	troop="Lazurian",
	note="沉默寡言的Lazurian军人,但是军人素质很高,以作为军人为荣,不会去思考自己不该思考的事情",
	quote="这些不值得我去想",
	hit="执行军令",
	miss="感情用事的人",
	d2d="海军以及远程攻击单位攻防+10%",
	commandRange=2,
	powers={
		{name="Shoot",translate="射击",features={
			{corpType="NavyOrIndirectAttack",attack=10,defence=10},
		}},
		{name="Snipe",translate="狙击",energySlot=6,features={
			{corpType="NavyOrIndirectAttack",attack=20,defence=15},
			{corpType="IndirectAttack",attackRangeMax=1}
		}},
		{name="Long shot",translate="远射",energySlot=6,features={
			{corpType="NavyOrIndirectAttack",attack=30,defence=20},
			{corpType="IndirectAttack",attackRangeMax=2}
		}},
	},
	author="Offical & New CO"},

	{name="Forsythe",
	troop="Lazurian",
	note="Lazurian指挥官,退休后,以保卫祖国为己任重返部队",
	quote="我是个军人,不是杀手",
	hit="Brenner",
	miss="侵犯祖国的人",
	d2d="所有部队攻防+10%",
	commandRange=5,
	powers={
		{name="AtkDef",translate="攻防",features={
			{attack=10,defence=10},
		}},
		{name="Defend!",translate="防御!",energySlot=6,features={
			{attack=10,defence=20},
		}},
		{name="Attack!",translate="攻击!",energySlot=6,features={
			{attack=20,defence=10},
		}},
	},
	author="Offical & New CO"},

	{name="Waylon",
	troop="Rubinelle",
	note="Rubinelle军人,加入军队只为了找乐子",
	quote="现在是我的娱乐时间了!",
	hit="享乐主义",
	miss="帮助困难的人",
	d2d="空军攻防+10%",
	commandRange=2,
	powers={
		{name="AirForce",translate="空军",features={
			{corpType="AirForce",attack=10,defence=10},
		}},
		{name="Air Shield",translate="气盾",energySlot=6,features={
			{corpType="AirForce",attack=25,defence=30},
		}},
		{name="Wingman",translate="僚机",energySlot=6,features={
			{corpType="AirForce",attack=40,defence=70},
		}},
	},
	author="Offical & New CO"},

	{name="Greyfield",
	troop="Rubinelle",
	note="Rubinelle军痞,非常渴望力量和权利,一直想摧毁Lazurian军并统治世界",
	quote="我会看到你为此付出代价!",
	hit="统治世界",
	miss="Lazurian",
	d2d="海军,SeaPlane,直升机攻防+10%",
	commandRange=3,
	powers={
		{name="Navy",translate="空军",features={
			{corpType="NavyOrSeaPlaneOrCopter",attack=10,defence=10},
		}},
		{name="Arms Expansion",translate="扩军",energySlot=6,features={
			{corpType="NavyOrSeaPlaneOrCopter",attack=15,defence=25},
		}},
		{name="Supply Chain",translate="供应链",energySlot=6,features={
			{corpType="NavyOrSeaPlaneOrCopter",attack=20,defence=40},
			{execute="SupplyAllUnit"}
		}},
	},
	author="Offical & New CO"},

	{name="Davis",
	troop="Rubinelle",
	note="Rubinelle的士兵,害怕Greyfield而且胆小",
	quote="噢man...这很糟糕啊man...",
	hit="Will",
	miss="Caulder",
	d2d="Infantry,Tank,Lander攻防+10%",
	powers={
		{name="March",translate="行军",features={
			{corpType="InfantryTankLander",attack=10,defence=10},
		}},
		{name="Rapid March",translate="急行军",energySlot=6,features={
			{corpType="InfantryTankLander",attack=20,defence=20,movement=1},
		}},
		{name="Charge Forward",translate="向前冲",energySlot=6,features={
			{corpType="InfantryTankLander",attack=30,defence=30,movement=2},
		}},
	},
	author="Offical & New CO"},

	{name="Penny",
	troop="IDS",
	note="Caulder博士的小女儿，太多的实验永久地夺走了她感到伤心的能力",
	quote="嘻嘻,走喽熊先生!",
	hit="新玩具",
	miss="破坏玩具的人",
	d2d="部队不受天气影响",
	commandRange=3,
	powers={
		{name="Weather",translate="天气",features={
			{weatherEffect=false},
		}},
		{name="Weather Random",translate="随机天气",energySlot=6,features={
			{weatherEffect=false},
			{execute="RandomWeather"}
		}},
		{name="Storm front",translate="风暴来临",energySlot=6,features={
			{weatherEffect=false},
			{execute="RandomBadWeather"}
		}},
	},
	author="Offical & New CO"},

	{name="Tabitha",
	troop="IDS",
	note="隶属秘密连队IDS,是Caulder博士的女儿之一,她为人非常残忍,有很强的报复心",
	quote="愚蠢软弱的人们",
	hit="歼灭敌人",
	miss="手下留情",
	d2d="所有部队攻防+10%",
	powers={
		{name="Personal",translate="个人",features={
			{attack=10,defence=10}
		}},
		{name="Fire Power",translate="火力",energySlot=6,features={
			{attack=30,defence=20}
		}},
		{name="Fire Storm",translate="热浪",energySlot=6,features={
			{attack=50,defence=30},
			{execute="Silo"}
		}},
	},
	author="Offical & New CO"},

	{name="Caulder",
	troop="IDS",
	note="秘密军队IDS的创造者,他试图寻找一个新的世界以自由的实现他那个可怕的计划",
	quote="真是令人着迷",
	hit="研究",
	miss="停止研究",
	d2d="所有部队攻防+10%",
	commandRange=3,
	powers={
		{name="Science",translate="科学",features={
			{attack=10,defence=10}
		}},
		{name="Recover",translate="恢复",energySlot=6,features={
			{attack=30,defence=20},
			{execute="SelfUnitHP",para=50}
		}},
		{name="Heal",translate="治疗",energySlot=6,features={
			{attack=50,defence=30},
			{execute="SelfUnitHP",para=100}
		}},
	},
	author="Offical & New CO"},

	{name="Cyrus",
	troop="IDS",
	note="IDS成员之一,认为自己的父亲太不人性化而离开，之后为了摧毁父亲的计划而与Will联手",
	hit="Will",
	miss="Caulder",
	d2d="所有翼飞机系和摩托车移动+1,攻防+10%",
	commandRange=1,
	powers={
		{name="Helmet",translate="头盔",features={
			{corpType="PlaneOrBike",attack=10,defence=10,movement=1}
		}},
		{name="Quick Acting",translate="快速行动",energySlot=6,features={
			{corpType="PlaneOrBike",attack=20,defence=20,movement=2}
		}},
		{name="Take Risk",translate="冒险",energySlot=6,features={
			{corpType="PlaneOrBike",attack=30,defence=30,movement=3}
		}},
	},
	author="Offical & New CO"},

	{name="Beast",
	troop="Raider",
	note="曾经是军人,因为无法改掉嗜杀的本性而被逐出军队,陨石坠落后,开始组织匪军到处进行杀戮掠夺",
	hit="Will",
	miss="Caulder",
	d2d="所有部队攻击+20%,每次攻击需要-10的燃料,否则攻击-10%",
	commandRange=3,
	powers={
		{name="Bandit",translate="强盗",features={
			{attack=10,defence=-5}
		}},
		{name="Rob",translate="掠夺",energySlot=6,features={
			{attack=30,defence=-15},
			{execute="Rob"},
		}},
		{name="Massacre",translate="杀戮",energySlot=6,features={
			{attack=50,defence=-25}
		}},
	},
	author="Offical & New CO"},

	{name="BillyGates",
	troop="Neutral",
	note="有个土豪爹,有足够的战争基金,喜欢玩战争游戏",
	d2d="每日可额外获得10000资金",
	powers={
		{name="Rich",translate="富裕",features={
			{moneyAddPerDay=10000}
		}},
		{name="Local Tyrants",translate="土豪",energySlot=4,features={
			note="据点上的自军部队HP全恢复(消耗资金)"
		}},
		{name="Evil Gentry",translate="劣绅",energySlot=4,features={
			note="当前资金每200使攻击+1%,且不能生产任何部队,结束回合的时候资金变为0",
		}},
	},
	author="Shikamaru & New CO"},

	{name="Caroline",
	troop="Neutral",
	note="攻击的时候会产生不明原因的高强度输出.她的昵称是'幸运女孩'",
	d2d="幸运损伤0%~40%",
	powers={
		{name="Luck",translate="运气",features={
			{damageFix={0,40}}
		}},
		{name="Lucky Girl",translate="幸运女孩",energySlot=4,features={
			{damageFix={10,60}}
		}},
		{name="Luck Godness",translate="幸运女神",energySlot=4,features={
			{damageFix={20,80}}
		}},
	},
	author="Shikamaru & New CO"}
}