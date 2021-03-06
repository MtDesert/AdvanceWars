Corps={
	--步兵
	{name="Infantry",corpType='LandForce',price=1500,vision=2,
	move={movement=3,moveType="Foot",gasMax=99},
	weapons={
		{name="MachineGun"}},
	capturable=true--[[具有占领能力]]},
	--机械兵
	{name="Mech",corpType='LandForce',price=2500,vision=2,
	move={movement=2,moveType="Boot",gasMax=70},
	weapons={
		{name="RocketTube",ammunitionMax=3},
		{name="MachineGun"}},
	capturable=true--[[具有占领能力]]},
	--摩托车
	{name="Bike",corpType='LandForce',price=2500,vision=2,
	move={movement=3,moveType="TireB",gasMax=70},
	weapons={
		{name="MachineGun"}},
	capturable=true--[[具有占领能力]]},
	--工程车
	{name="Rig",corpType='LandForce',price=5000,vision=1,
	move={movement=6,moveType="Tread",gasMax=70},
	suppliable=true,--[[可补给所有部队]]},
	--照明炮
	{name="Flare",corpType='LandForce',price=5000,vision=2,
	move={movement=5,moveType="Tread",gasMax=60}
	},
	--侦察车
	{name="Recon",corpType='LandForce',price=4000,vision=5,
	move={movement=8,moveType="TireA",gasMax=80},
	weapons={
		{name="MachineGun"}},
	},
	--大炮
	{name="Artillery",corpType='LandForce',price=6000,vision=3,
	move={movement=5,moveType="Tread",gasMax=50},
	weapons={
		{name="Cannon",minRange=2,maxRange=3,ammunitionMax=6}}
	},
	--火箭车
	{name="Rockets",corpType='LandForce',price=15000,vision=3,
	move={movement=5,moveType="TireA",gasMax=50},
	weapons={
		{name="Rocket",minRange=3,maxRange=5,ammunitionMax=5}}
	},
	--导弹车
	{name="Missiles",corpType='LandForce',price=12000,vision=5,
	move={movement=5,moveType="TireA",gasMax=50},
	weapons={
		{name="Missile",minRange=3,maxRange=6,ammunitionMax=5}}
	},
	--坦克
	{name="Tank",corpType='LandForce',price=7000,vision=3,
	move={movement=6,moveType="Tread",gasMax=70},
	weapons={
		{name="Cannon",ammunitionMax=6},
		{name="MachineGun"}}
	},
	--中型坦克
	{name="MiddleTank",corpType='LandForce',price=12000,vision=2,
	move={movement=5,moveType="Tread",gasMax=50},
	weapons={
		{name="Cannon",ammunitionMax=5},
		{name="MachineGun"}}
	},
	--主战坦克(弩级)
	{name="WarTank",corpType='LandForce',price=16000,vision=2,
	move={movement=4,moveType="Tread",gasMax=50},
	weapons={
		{name="Cannon",ammunitionMax=5},
		{name="MachineGun"}}
	},
	--防空炮
	{name="AntiAir",corpType='LandForce',price=7000,vision=3,
	move={movement=6,moveType="Tread",gasMax=60},
	weapons={
		{name="Vulcan",ammunitionMax=9}}
	},
	{name="AntiTank",corpType='LandForce',price=11000,vision=2,
	move={movement=4,moveType="TireB",gasMax=50},
	weapons={
		{name="Cannon",ammunitionMax=5}}
	},
	--运输直升机
	{name="TransportCopter",corpType='AirForce',price=5000,vision=1,
	move={movement=6,moveType="Heli",gasMax=99},
	},
	--武装直升机
	{name="BattleCopter",corpType='AirForce',price=9000,vision=2,
	move={movement=6,moveType="Heli",gasMax=99},
	weapons={
		{name="Missile",ammunitionMax=6},
		{name="MachineGun"}}
	},
	--扫射飞机
	{name="Duster",corpType='AirForce',price=13000,vision=4,
	move={movement=8,moveType="Plane",gasMax=99},
	weapons={
		{name="MachineGun",ammunitionMax=9}
	},
	--战斗机
	{name="Fighter",corpType='AirForce',price=20000,vision=5,
	move={movement=9,moveType="Plane",gasMax=99},
	weapons={
		{name="Missile",ammunitionMax=6}}
	},
	--轰炸机
	{name="Bomber",corpType='AirForce',price=20000,vision=3,
	move={movement=7,moveType="Plane",gasMax=99},
	weapons={
		{name="Bomb",ammunitionMax=6}}
	},
	--战舰
	{name="BattleShip",corpType='NavyForce',price=25000,vision=3,
	move={movement=5,moveType="Ship",gasMax=99},
	weapons={
		{name="Cannon",minRange=3,maxRange=5,ammunitionMax=6}}
	},
	--巡洋舰(护卫舰)
	{name="Cruiser",corpType='NavyForce',price=16000,vision=5,
	move={movement=6,moveType="Ship",gasMax=99},
	weapons={
		{name="Missile",ammunitionMax=9},
		{name="AntiAirGun"}}
	},
	--潜艇
	{name="Submarine",corpType='NavyForce',price=20000,vision=5,
	move={movement=6,moveType="Ship",gasMax=70},
	weapons={
		{name="Torpedo",ammunitionMax=6}},
	hidable=true--[[可隐藏]]},
	--航母(携带4材料)
	{name="Carrier",corpType='NavyForce',price=28000,vision=5,
	move={movement=6,moveType="Ship",gasMax=99},
	weapons={
		{name="AntiAir",ammunitionMax=6}},
	},
	--登录艇
	{name="Lander",corpType='NavyForce',price=12000,vision=1,
	move={movement=6,moveType="Boat",gasMax=99},
	}
	--炮艇(导弹艇)
	{name="GunBoat",corpType='NavyForce',price=6000,vision=2,
	move={movement=7,moveType="Boat",gasMax=99},
	weapons={
		{name="Missile",ammunitionMax=1}},
	}
}
