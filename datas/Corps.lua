--[[
兵种表,用于描述兵种的基础数据,每个兵种有如下数据
兵种名字name,字符串,用于指明具体是什么兵种,不要重复
翻译translate,字符串,用于显示,根据需要自行翻译成不同语言版本
兵种类型corpType,字符串,指明是空军(AirForce)陆军(LandForce)还是海军(NavyForce),当然可以自定义新的兵种类型
价格price,正整数,制造一个单位该兵种的花费,修理时候的花费也受此影响
视野vision,正整数,在雾中行动时候所能看到的范围
移动move,表结构,如下{
	移动力movement,正整数,表明正常情况下能移动多远
	移动类型moveType,字符串,作为移动损耗的计算依据之一
	燃料最大值gasMax,正整数,表明兵种可持有的最大燃料量,移动时候会损耗燃料,损耗完后无法移动
}
武器表weapons,表结构(非必须),存放若干武器(一般来说只需要主武器和副武器)
武器结构如下{
	武器名name,字符串,表示名字
	最大载弹量ammunitionMax,正整数,
}
capturable,布尔型,能否占领,只对据点有效
suppliable,布尔型,能否补给
hidable,布尔型,能否隐藏自身,敌人看不到被隐藏的单位,除非离得近
repairable,布尔型,能否修复单位
explodable,布尔型,能否自己爆炸
buildable,布尔型,能否建造临时据点
flarable,布尔型,能否发射闪光弹
]]

Corps={
	{name="Infantry",translate="步兵",corpType='LandForce',price=1000,vision=2,
	move={movement=3,moveType="Foot",gasMax=99},
	weapons={
		{name=""},
		{name="MachineGun"}},
	capturable=true},

	{name="Mech",translate="机械兵",corpType='LandForce',price=3000,vision=2,
	move={movement=2,moveType="Boot",gasMax=70},
	weapons={
		{name="RocketTube",ammunitionMax=3},
		{name="MachineGun"}},
	capturable=true},

	{name="Bike",translate="摩托兵",corpType='LandForce',price=2500,vision=2,
	move={movement=3,moveType="TireB",gasMax=70},
	weapons={
		{name="MachineGun"}},
	capturable=true},

	{name="SupplyTruck",translate="补给卡车",corpType='LandForce',price=4000,vision=1,
	move={movement=7,moveType="Tire",gasMax=60},
	suppliable=true},

	{name="APC",translate="装甲车",corpType='LandForce',price=5000,vision=1,
	move={movement=6,moveType="Tread",gasMax=70},
	suppliable=true},

	{name="Recon",translate="侦察车",corpType='LandForce',price=4000,vision=5,
	move={movement=8,moveType="Tire",gasMax=80},
	weapons={
		{name="MachineGun"}},
	},

	{name="TransportTruck",translate="运输卡车",corpType='LandForce',price=5000,vision=2,
	move={movement=7,moveType="Tire",gasMax=70},
	weapons={
		{name="MachineGun"}},
	},

	{name="Flare",translate="照明车",corpType='LandForce',price=5500,vision=3,
	move={movement=5,moveType="Tread",gasMax=70},
	weapons={
		{name="MachineGun"}},
	flarable=true,ammunitionMax=3},

	{name="Artillery",translate="大炮",corpType='LandForce',price=6000,vision=1,
	move={movement=5,moveType="Tread",gasMax=50},
	weapons={
		{name="Cannon",minRange=2,maxRange=3,ammunitionMax=9}}
	},

	{name="AntiAirArtillery",translate="高射炮",corpType='LandForce',price=5500,vision=4,
	move={movement=4,moveType="Tread",gasMax=50},
	weapons={
		{name="AntiAirGun",minRange=1,maxRange=3,ammunitionMax=9}}
	},

	{name="Rockets",translate="火箭车",corpType='LandForce',price=15000,vision=1,
	move={movement=5,moveType="Tire",gasMax=50},
	weapons={
		{name="Rocket",minRange=3,maxRange=5,ammunitionMax=6}}
	},

	{name="Missiles",translate="导弹车",corpType='LandForce',price=12000,vision=5,
	move={movement=4,moveType="Tire",gasMax=50},
	weapons={
		{name="Missile",minRange=3,maxRange=5,ammunitionMax=6}}
	},

	{name="Tank",translate="坦克",corpType='LandForce',price=7000,vision=3,
	move={movement=6,moveType="Tread",gasMax=70},
	weapons={
		{name="Cannon",ammunitionMax=9},
		{name="MachineGun"}}
	},

	{name="AmphibiousTank",translate="水陆坦克",corpType='LandForce',price=12000,vision=2,
	move={movement=5,moveType="Tread",gasMax=60},
	weapons={
		{name="Tank",ammunitionMax=9},
		{name="MachineGun"}}
	},

	{name="MiddleTank",translate="中型坦克",corpType='LandForce',price=16000,vision=1,
	move={movement=5,moveType="Tread",gasMax=50},
	weapons={
		{name="Cannon",ammunitionMax=8},
		{name="MachineGun"}}
	},

	{name="NeoTank",translate="新型坦克",corpType='LandForce',price=22000,vision=1,
	move={movement=6,moveType="Tread",gasMax=99},
	weapons={
		{name="Cannon",ammunitionMax=9},
		{name="MachineGun"}}
	},

	{name="MegaTank",translate="弩级坦克",corpType='LandForce',price=28000,vision=1,
	move={movement=4,moveType="Tread",gasMax=50},
	weapons={
		{name="Cannon",ammunitionMax=3},
		{name="MachineGun"}}
	},

	{name="AntiAir",translate="防空炮",corpType='LandForce',price=8000,vision=2,
	move={movement=6,moveType="Tread",gasMax=60},
	weapons={
		{name="Vulcan",ammunitionMax=9}}
	},

	{name="AntiTank",translate="反坦克炮",corpType='LandForce',price=11000,vision=2,
	move={movement=4,moveType="Tire",gasMax=50},
	weapons={
		{name="Hesh",minRange=1,maxRange=3,ammunitionMax=6}}
	},

	{name="TransportCopter",translate="运输直升机",corpType='AirForce',price=5000,vision=2,
	move={movement=6,moveType="Heli",gasMax=99},
	},

	{name="BattleCopter",translate="武装直升机",corpType='AirForce',price=9000,vision=3,
	move={movement=6,moveType="Heli",gasMax=99},
	weapons={
		{name="Missile",ammunitionMax=6},
		{name="MachineGun"}}
	},

	{name="AntiSubCopter",translate="反潜直升机",corpType='AirForce',price=12000,vision=3,
	move={movement=5,moveType="Heli",gasMax=80},
	weapons={
		{name="AntiSub Missile",ammunitionMax=6},
		{name="MachineGun"}}
	},

	{name="TransportPlane",translate="运输飞机",corpType='AirForce',price=12000,vision=2,
	move={movement=7,moveType="Plane",gasMax=99},
	},

	{name="Duster",translate="侦察机",corpType='AirForce',price=13000,vision=4,
	move={movement=8,moveType="Plane",gasMax=99},
	weapons={
		{name="MachineGun",ammunitionMax=9}}
	},

	{name="SeaPlane",translate="水上飞机",corpType='AirForce',price=15000,vision=3,
	move={movement=7,moveType="Plane",gasMax=40},
	weapons={
		{name="AntiSub Missile",ammunitionMax=3}}
	},

	{name="Fighter",translate="战斗机",corpType='AirForce',price=20000,vision=2,
	move={movement=9,moveType="Plane",gasMax=99},
	weapons={
		{name="Missile",ammunitionMax=9}}
	},

	{name="Bomber",translate="轰炸机",corpType='AirForce',price=22000,vision=2,
	move={movement=7,moveType="Plane",gasMax=99},
	weapons={
		{name="Bomb",ammunitionMax=9}}
	},

	{name="Stealth",translate="隐形飞机",corpType='AirForce',price=24000,vision=4,
	move={movement=6,moveType="Plane",gasMax=60},
	weapons={
		{name="Missile",ammunitionMax=6}}
	},

	{name="BlackBomb",translate="黑弹",corpType='AirForce',price=25000,vision=1,
	move={movement=9,moveType="Plane",gasMax=45},
	explodable=true
	},

	{name="Lander",translate="登陆艇",corpType='NavyForce',price=12000,vision=1,
	move={movement=6,moveType="Boat",gasMax=99},
	},

	{name="BlackBoat",translate="黑船",corpType='NavyForce',price=7500,vision=1,
	move={movement=7,moveType="Boat",gasMax=60},
	repairable=true},

	{name="GunBoat",translate="炮艇",corpType='NavyForce',price=6000,vision=1,
	move={movement=7,moveType="Boat",gasMax=60},
	repairable=true},

	{name="BattleShip",translate="战舰",corpType='NavyForce',price=28000,vision=2,
	move={movement=5,moveType="Ship",gasMax=99},
	weapons={
		{name="Cannon",minRange=2,maxRange=6,ammunitionMax=9}}
	},

	{name="Destroyer",translate="驱逐舰",corpType='NavyForce',price=25000,vision=2,
	move={movement=5,moveType="Ship",gasMax=99},
	weapons={
		{name="Cannon",ammunitionMax=6}}
	},

	{name="Cruiser",translate="巡洋舰",corpType='NavyForce',price=18000,vision=3,
	move={movement=6,moveType="Ship",gasMax=99},
	weapons={
		{name="Missile",ammunitionMax=6},
		{name="AntiAirGun"}}
	},

	{name="Frigate",translate="护卫舰",corpType='NavyForce',price=21000,vision=3,
	move={movement=6,moveType="Ship",gasMax=99},
	weapons={
		{name="Torpedo",ammunitionMax=6},
		{name="Vulcan"}}
	},

	{name="Submarine",translate="潜艇",corpType='NavyForce',price=20000,vision=5,
	move={movement=5,moveType="Ship",gasMax=60},
	weapons={
		{name="Torpedo",ammunitionMax=6}},
	hidable=true},

	{name="Carrier",translate="航空母舰",corpType='NavyForce',price=30000,vision=4,
	move={movement=5,moveType="Ship",gasMax=99},
	weapons={
		{name="Missile",ammunitionMax=9}}
	},

	{name="PipeRunner",translate="管道炮",corpType='LandForce',price=20000,vision=4,
	move={movement=9,moveType="Pipe",gasMax=50},
	weapons={
		{name="Cannon",minRange=2,maxRange=5,ammunitionMax=9}},
	},
	{name="Oozium",translate="老泥",corpType='LandForce',price=20000,vision=4,
	move={movement=9,moveType="Pipe",gasMax=50},
	weapons={
		{name="Cannon",minRange=2,maxRange=5,ammunitionMax=9}},
	},
}