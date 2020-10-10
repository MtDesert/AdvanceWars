--[[这是天气表,属性如下
name名字,用于判断
translate译文,用于显示
weatherType天气类型,用于归类天气
level等级,指明天气的强弱
note,说明,用于指明作用
fog雾,布尔型,指明是否开启雾效果
vision视野,负整数,指明对视野的影响,vision小于0时,会按照fog=true来处理
movement移动,负整数,指明对移动的影响
]]
Weathers={
	{name="Normal",translate="正常",note="多云"},
	--雨天,主要影响视野
	{name="LightRain",translate="小雨",weatherType="Rainy",level=0},
	{name="ModerateRain",translate="中雨",weatherType="Rainy",level=1,
		fog=true
	},
	{name="HeavyRain",translate="大雨",weatherType="Rainy",level=2,
		vision=-1
	},
	{name="RainStorm",translate="暴雨",weatherType="Rainy",level=3,isStorm=true,
		vision=-2,movement=-1
	},
	{name="HeavyRainStorm",translate="大暴雨",weatherType="Rainy",level=4,isStorm=true,
		vision=-3,movement=-1
	},
	{name="ExtraHeavyRainStorm",translate="特大暴雨",weatherType="Rainy",level=5,isStorm=true,
		vision=-4,movement=-1,attack=-10
	},
	--雪天,主要影响移动
	{name="LightSnow",translate="小雪",weatherType="Snowy",level=0,
	},
	{name="ModerateSnow",translate="中雪",weatherType="Snowy",level=1,
		movement=-1
	},
	{name="HeavySnow",translate="大雪",weatherType="Snowy",level=2,
		fog=true,movement=-1
	},
	{name="SnowStorm",translate="暴雪",weatherType="Snowy",level=3,isStorm=true,
		fog=true,movement=-2,attack=-10
	},
	{name="HeavySnowStorm",translate="大暴雪",weatherType="Snowy",level=4,isStorm=true,
		vision=-1,movement=-2,attack=-15
	},
	{name="ExtraHeavySnowStorm",translate="特大暴雪",weatherType="Snowy",level=5,isStorm=true,
		vision=-1,movement=-3,attack=-20
	},
	--沙暴,主要影响射程和威力
	{name="LightSand",translate="轻沙",weatherType="Sandy",level=0,
		attack=-10
	},
	{name="ModerateSand",translate="扬沙",weatherType="Sandy",level=1,
		fog=true,attack=-20
	},
	{name="HeavySand",translate="沙尘",weatherType="Sandy",level=2,
		fog=true,movement=-1,attack=-30,
	},
	{name="SandStorm",translate="沙暴",weatherType="Sandy",level=3,
		vision=-1,movement=-1,attack=-30,attackRangeMax=-1,
	},
	{name="HeavySandStorm",translate="强沙暴",weatherType="Sandy",level=4,
		vision=-1,movement=-2,attack=-30,attackRangeMax=-1,
	},
	{name="ExtraHeavySandStorm",translate="特强沙暴",weatherType="Sandy",level=5,
		vision=-2,movement=-2,attack=-30,attackRangeMax=-1
	},
}