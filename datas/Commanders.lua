--[[
这是CO的数据表
name,名字,指明CO的称呼
note,描述,用来说明该CO的相关信息
coHit,指明该CO擅长的,感兴趣的,或高兴的事物
coMiss,指明该CO不擅长的,不感兴趣的,或令其头疼的事物
quote,口头禅,描述CO经常挂在嘴边
]]

Commanders={
	--Orange Star
	{name="Nell",
	note="Rachel的大姐,橙星最高指挥官,一个精于指挥,有超高时尚感的长官",
	hit="任性的学生",miss="假期",
	quote="你需要额外指导吗?",
	d2d="损伤波动0%～20%",
	power={
		{name="Lucky Star",translate="幸运星",energySlot=3,note="损伤波动0%~60%"},
		{name="Lady Luck",translate="幸运女神",energySlot=3,note="损伤波动0%~100%"},
	},
	author="Offical"},

	{name="Andy",
	note="一个扳手专家,这个机械怪才少年在上次大战中拯救了宏大陆,获得了名誉",
	hit="机械",miss="早起",
	quote="如果你要修理,那么我就是你要找的人!",
	d2d="没有真正弱点,海陆空的老手,随时随地作战",
	power={
		{name="Hyper Repair",translate="超级修复",energySlot=3,note="自军单位HP+20%"},
		{name="Hyper Upgrade",translate="超级更新",energySlot=3,note="自军单位HP+50%,攻击+10%,移动+1"},
	},
	author="Offical"},

	{name="Max",
	note="一个勇敢而又忠实的朋友,更不用说是个坚强的战士,Max憎恨任何形式的背叛行为,喜欢比较老式的、乱哄哄的拳赛",
	hit="负荷训练",miss="学习",
	quote="现在轮到我了",
	d2d="近程攻击单位(占领系除外)攻击+20%;远程攻击单位射程-1",
	power={
		{name="Max Force",translate="最大力量",energySlot=3,note="近程攻击单位(占领系除外)攻击+50%,移动+1"},
		{name="Max Blast",translate="最大爆发",energySlot=3,note="近程攻击单位(占领系除外)攻击+50%,移动+2"},
	},
	author="Offical"},

	{name="Sami",
	note="一个固执己见的橙星特种单位队长,喜欢留长发",
	hit="巧克力",miss="懦夫",
	quote="准备值班!",
	d2d="占领系兵种攻击+20%,占领速度+50%;非占领系近程攻击单位攻击-10%",
	power={
		{name="Double Time",translate="急行军",energySlot=3,note="占领系兵种攻击+50%,移动+1"},
		{name="Victory March",translate="胜利行军",energySlot=5,note="占领系兵种攻击+80%,移动+2,占领速度+1900%"},
	},
	author="Offical"},

	{name="Hachi",
	note="贩卖军用商品和战斗地图的店主，曾经是橙星总司令",
	hit="茶",miss="药",
	quote="来唱游击队歌吧",
	d2d="单位造价-10%",
	power={
		{name="Barter",translate="讨价还价",energySlot=3,note="单位造价-50%"},
		{name="Merchant Union",translate="商业联盟",energySlot=3,note="单位造价-50%;城市可生产陆军"},
	},
	author="Offical"},

	{name="Jake",
	note="一个年轻,且经历充沛的橙星CO,一流的坦克指挥官",
	hit="俱乐部",miss="舒缓的音乐",
	quote="气氛搞起来!音乐嗨起来!",
	d2d="处在Plain上的单位攻击+10%(无论海陆空)",
	power={
		{name="Beat Down",translate="打倒",energySlot=3,note="处在Plain上的单位攻击+20%(无论海陆空);陆军远程攻击单位射程+1"},
		{name="Block Rock",translate="滚石",energySlot=3,note="处在Plain上的单位攻击+40%(无论海陆空);陆军车辆系单位移动+2,陆军远程攻击单位射程+1"},
	},
	author="Offical"},

	{name="Rachel",
	note="一个年轻的橙星CO,她努力跟随着她大姐Nell的脚步,她给她的单位带来了新的气息",
	hit="努力工作",miss="借口",
	d2d="单位很努力工作，据点每回合HP恢复+10%",
	power={
		{name="Lucky Lass",translate="幸运少女",energySlot=3,note="损伤波动0%~40%"},
		{name="Covering Fire",translate="火力掩护",energySlot=3,note="自动向敌方扔3枚飞弹(以落点为中心,波及范围2);第一枚炸敌方步兵,占领优先;第二枚炸敌方价值最高的单位;第三枚炸敌方最密集的地方"},
	},
	author="Offical"},

--Blue Moon
	{name="Olaf",
	note="也许是个自大吹牛的人,但是他战术英勇让他赢得了同辈的尊敬和民众的钦佩",
	hit="暖靴子",miss="雨云",
	quote="我最喜欢打雪仗了,不论雪下得多大...",
	d2d="雪天时,攻击+20%,燃料损耗不受影响;下雨天燃料损耗加倍",
	power={
		{name="Bilzzard",translate="暴风雪",energySlot=3,note="下雪2天"},
		{name="Winter Fury",translate="寒冬之怒",energySlot=4,note="下雪2天,敌对单位HP-2"},
	},
	author="Offical"},

	{name="Grit",
	note="懒散的风格掩饰了他的可靠,举世无双的神射手,与Olaf搭档得不错",
	hit="猫",miss="耗子",
	quote="在闹啥呢?",
	d2d="远程攻击单位攻击+20%,射程+1;非占领系近程攻击单位攻击-20%",
	power={
		{name="Snipe Attack",translate="暴风雪",energySlot=3,note="远程攻击单位攻击+50%,射程+2"},
		{name="Winter Fury",translate="寒冬之怒",energySlot=3,note="远程攻击单位攻击+50%,射程+3"},
	},
	author="Offical"},

	{name="Colin",
	note="蓝月的富家少爷,Sasha的小弟弟,一个有天赋的指挥官,有时候没安全感",
	hit="Olaf和Grit",miss="黑洞军",
	d2d="单位造价-20%，攻击-10%",
	power={
		{name="Gold Rush",translate="冲钱",energySlot=2,note="当前资金+50%"},
		{name="Power of Money",translate="钱的力量",energySlot=4,note="当前资金每300使每个单位攻击+1%"},
	},
	author="Offical"},

	{name="Sasha",
	note="Colin的姐姐,普通的贵妇人,但在生气的时候非常大胆",
	hit="松露",miss="炸猪肉皮",
	d2d="所占领的据点收入+100G",
	power={
		{name="Market Crash",translate="市场冲击",energySlot=2,note="当前资金每500降低对手1%能量槽"},
		{name="War Bonds",translate="战争公债",energySlot=4,note="单位交战时,对方单位的价值损失的一半转换为自己的资金"},
	},
	author="Offical"},

--GreenEarth
	{name="Eagle",
	note="GreenEarth勇敢的飞行员英雄,为了他父亲遗留下的荣耀而加入了空军",
	hit="幸运护目镜",miss="游泳",
	d2d="空军攻击+20%,日耗油-2;海军攻击-10%",
	power={
		{name="Lightning Drive",translate="闪电驱动",energySlot=3,note="空军攻击-40%,陆军非占领系兵种攻击-50%,海军攻击-55%,非占领系兵种可再次行动"},
		{name="Lightning Strike",translate="闪电驱动",energySlot=6,note="非占领系兵种可再次行动"},
	},
	author="Offical"},

	{name="Drake",
	note="一个慷慨的,讨厌战斗的前海盗,这家伙也是个伟大的冲浪手",
	hit="海洋",miss="高处",
	d2d="海军攻击+20%;空军攻击-10%;不受雨天影响,增加雨天天气概率",
	power={
		{name="Tsunami",translate="海啸",energySlot=4,note="所有敌方单位HP-1,燃料减半"},
		{name="Typhoon",translate="台风",energySlot=3,note="所有敌方单位HP-2,燃料减半;天气转为雨天"},
	},
	author="Offcial"},

	{name="Jess",
	note="一个勇敢且又善于分析信息的坦克驾驶员,上次大战的英雄",
	hit="蒲公英",miss="不合格的CO",
	d2d="陆军非占领系攻击+10%;其它单位攻击-10%",
	power={
		{name="Turbo Charge",translate="涡轮增压",energySlot=3,note="陆军非占领系攻击+30%,移动+1,全单位补给"},
		{name="Overdrive",translate="超速",energySlot=3,note="陆军非占领系攻击+50%,移动+2,全单位补给"},
	},
	author="Offical"},

	{name="Javier",
	note="一个忠于骑士精神,并认为其高于一切的绿地CO,经常命令他的单位向前冲",
	hit="荣誉",miss="撤退",
	d2d="被间接攻击时防御+20%,且每占领一座指令塔防御+10%",
	power={
		{name="Tower Shield",translate="塔盾",energySlot=3,note="被间接攻击时防御+40%,指令塔效果2倍"},
		{name="Tower of Power",translate="力之塔",energySlot=3,note="被间接攻击时防御+60%,指令塔效果3倍"},
	},
	author="Offical"},

--YellowComet
	{name="Kanbei",
	note="黄彗的皇帝，一个有技术的CO，对自己的女儿很和蔼",
	hit="Sonja",miss="电脑",
	d2d="单位攻防造价+20%",
	power={
		{name="Morale Boost",translate="士气提升",energySlot=4,note="单位攻击+50%,防御+30%"},
		{name="Samurai Spirit",translate="武士精神",energySlot=3,note="部队攻防+40%,反击伤害加倍"},
	},
	author="Offical"},

	{name="Sonja",
	note="Kanbei冷静又镇定的女儿，喜欢在行动前计划，擅长信息战",
	hit="电脑",miss="Bugs",
	d2d="单位视野+1,降低对方地形防御1级,损伤波动-5%~10%,HP敌方不可见",
	power={
		{name="Enhanced Vision",translate="视力增强",energySlot=3,note="单位视野+2,降低对方地形防御2级,可看到掩体中的单位"},
		{name="Counter Break",translate="反击",energySlot=2,note="单位视野+2,降低对方地形防御3级,可看到掩体中的单位,优先反击"},
	},
	author="Offical"},

	{name="Sensei",
	note="一个前任伞兵,传说在那个时代已经当过CO",
	hit="懒惰的雨天",miss="忙碌的市场",
	d2d="步兵系攻击+10%,直升机系攻击+50%,无武器运输单位移动+1,海军攻击-10%",
	power={
		{name="Copter Command",translate="直升机命令",energySlot=2,note="直升机系攻击+70%,自军城市出现9HP的Infantry"},
		{name="Airborne Assault",translate="空降突击",energySlot=4,note="直升机系攻击+70%,自军城市出现9HP的Mech"},
	},
	author="Offical"},

	{name="Grimm",
	note="黄彗性格开朗的CO，不喜欢深究，号称'闪电之Grimm'",
	d2d="单位攻击+30%，防御-20%",
	hit="甜甜圈",miss="规划",
	power={
		{name="Knuckleduster",translate="指节金属套",energySlot=4,note="单位攻击+50%"},
		{name="Haymaker",translate="强力一击",energySlot=3,note="单位攻击+80%"},
	},
	author="Offical"},

--BlackHole
	{name="Flak",
	note="黑洞军的大力士,被Hawke私自提拔",
	hit="肉",miss="蔬菜",
	d2d="损伤波动-10%~25%",
	power={
		{name="Brute Force",translate="蛮力",energySlot=3,note="损伤波动-20%~50%"},
		{name="Barbaric Blow",translate="野吹",energySlot=3,note="损伤波动-40%~90%"},
	},
	author="Offical"},

	{name="Adder",
	note="一个自恋的CO,认为自己的技术是独一无二的,Hawke给他的评级为第2",
	hit="自己的脸",miss="脏东西",
	d2d="正常",
	power={
		{name="Sideslip",translate="侧滑",energySlot=2,note="单位移动+1"},
		{name="Sidewinder",translate="响尾蛇",energySlot=3,note="单位移动+2"},
	},
	author="Offcial"},

	{name="Lash",
	note="黑洞军的神童,小个子且脾气暴躁的杰出发明家",
	hit="随心所欲",miss="不能随心所欲",
	d2d="根据单位所处地形等级,每1级+5%攻击",
	power={
		{name="Terrain Tactics",translate="地形策略",energySlot=3,note="单位可移动地形的损耗恒为1,不受雨天影响"},
		{name="Prime Tactics",translate="主要策略",energySlot=3,note="单位所处地形防御效果加倍,单位可移动地形的损耗恒为1,不受雨天影响"},
	},
	author="Offcial"},

	{name="Hawke",
	note="黑洞的4CO之首,会无所畏惧地朝着目标前进",
	hit="黑咖啡",miss="不称职",
	d2d="单位攻击+10%",
	power={
		{name="Black Wave",translate="黑色波浪",energySlot=5,note="自军单位HP+10%,敌方单位HP-10%"},
		{name="Black Storm",translate="黑色风暴",energySlot=4,note="自军单位HP+20%,敌方单位HP-20%"},
	},
	author="Offcial"},

	{name="Sturm",
	note="黑洞军指挥官,来自另一个世界的入侵者",
	hit="侵略",	miss="和平",
	d2d="所有单位攻击+40%,单位可移动地形的损耗恒为1,不受雨天影响",
	power={
		{name="Meteor Strike",translate="陨石攻击",energySlot=5,note="砸下一颗陨石,砸造价最高的敌方单位区域,以砸的中心为主,距离2格以内的单位受到HP-80%的损伤"},
	},
	author="Offcial"},

	{name="Jugger",
	note="黑洞军中长得像机器人的CO,没人知道他的真正的身份,当他使用他的CO能力时会变得稍微聪明点",
	hit="能量",miss="静电",
	d2d="损伤波动-15%~30%",
	power={
		{name="Overclock",translate="超频时钟",energySlot=5,note="损伤波动-25%~50%"},
		{name="System Crash",translate="系统崩溃",energySlot=4,note="损伤波动-45%~95%"},
	},
	author="Offical"},

	{name="Koal",
	note="一个黑洞的CO,总是计划着他的下一个毁灭性的表演",
	hit="谚语，拉面",miss="火锅",
	d2d="在公路上的单位攻击+10%",
	power={
		{name="Forced March",translate="强行推进",energySlot=3,note="在公路上的单位攻击+20%，移动+1"},
		{name="System Crash",translate="悲伤足迹",energySlot=2,note="在公路上的单位攻击+40%，移动+2"},
	},
	author="Offical"},

	{name="Kindle",
	note="Jugger和Koal的上级指挥官,她有着迟钝且女王的个性",
	hit="时髦的东西",miss="过时的东西",
	d2d="在据点上的自军单位攻击+40%",
	power={
		{name="Urban Blight",translate="城市衰败",energySlot=3,note="在据点上的自军单位攻击+80%;在据点上的敌方单位HP-30%"},
		{name="High Society",translate="上流社会",energySlot=3,note="在据点上的自军单位攻击+120%;自己每一个据点使单位攻击+3%"},
	},
	author="Offical"},

	{name="VonBolt",
	note="黑洞军的新首领,迷一般的老人,活了很长时间,Omega战争的策划者",
	hit="长寿",miss="年轻人",
	d2d="单位攻防+10%",
	power={
		{name="Ex Machina",translate="救世主",energySlot=3,note="随机劈下一道闪电,以某点为中心,波及范围3,被击中的单位HP-3且下个回合自动待机"},
	},
	author="Offical"},
}