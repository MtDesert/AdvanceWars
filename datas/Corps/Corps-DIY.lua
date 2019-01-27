Corps=
{
	--步兵
	{name="Infantry",corpType='LandForce',price=1000,vision=2,
	move={movement=3,moveType="Foot",gasMax=99},
	armor={name="Body",defend=0},
	weapons={
		{name="MachineGun",attack=55,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true}},
	capturable=true--[[具有占领能力]]},
	--机械兵
	{name="Mech",corpType='LandForce',price=3000,vision=2,
	move={movement=2,moveType="Boot",gasMax=99},
	armor={name="Body",defend=5},
	weapons={
		{name="RocketTube",attack=70,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=3},
		{name="MachineGun",attack=65,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true}},
	capturable=true--[[具有占领能力]]},
	--摩托兵
	{name="MotorBike",corpType='LandForce',price=2500,vision=2,
	move={movement=5,moveType="Tire",gasMax=70},
	armor={name="Body",defend=15},
	weapons={
		{name="MachineGun",attack=65,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true}},
	capturable=true--[[具有占领能力]]},
	--运输卡车
	{name="TransportTruck",corpType='LandForce',price=5000,vision=2,
	move={movement=7,moveType="Tire",gasMax=70},
	armor={name="Vehicle",defend=25}
	},
	--补给卡车
	{name="SupplyTruck",corpType='LandForce',price=4000,vision=1,
	move={movement=7,moveType="Tire",gasMax=60},
	armor={name="Vehicle",defend=5},
	suppliable=true--[[可补给陆军海军直升机部队,并恢复步兵系的HP]]},
	--装甲车
	{name="APC",corpType='LandForce',price=5000,vision=1,
	move={movement=6,moveType="Tread",gasMax=70},
	armor={name="MiddleArmor",defend=0},
	suppliable=true,--[[可补给所有部队]]
	buildable=true,metarial=1--[[可建筑,带1单位材料,应该在工厂补给]]},
	--巡逻车
	{name="Recon",corpType='LandForce',price=4000,vision=5,
	move={movement=8,moveType="Tire",gasMax=80},
	armor={name="Vehicle",defend=15},
	weapons={
		{name="MachineGun",attack=70,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true}},
	},
	--照明车
	{name="Flare",corpType='LandForce',price=5500,vision=3,
	move={movement=5,moveType="Tread",gasMax=70},
	armor={name="Vehicle",defend=25},
	weapons={
		{name="MachineGun",attack=60,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true}},
	flarable=true,ammunitionMax=3--[[可照明]]},
	--大炮
	{name="Artillery",corpType='LandForce',price=6000,vision=1,
	move={movement=5,moveType="Tread",gasMax=50},
	armor={name="MiddleArmor",defend=0},
	weapons={
		{name="Cannon",attack=90,minRange=2,maxRange=3,ammunitionMax=9}}
	},
	--高射炮
	{name="AntiAirArtillery",corpType='LandForce',price=5500,vision=4,
	move={movement=4,moveType="Tread",gasMax=50},
	armor={name="AntiAir",defend=0},
	weapons={
		{name="AntiAirGun",attack=90,minRange=1,maxRange=3,counterAttack=true,ammunitionMax=9}}
	},
	--火箭车
	{name="Rockets",corpType='LandForce',price=15000,vision=1,
	move={movement=5,moveType="Tire",gasMax=50},
	armor={name="Vehicle",defend=5},
	weapons={
		{name="Rocket",attack=100,minRange=3,maxRange=5,ammunitionMax=6}}
	},
	--导弹车
	{name="Missiles",corpType='LandForce',price=12000,vision=5,
	move={movement=4,moveType="Tire",gasMax=50},
	armor={name="Vehicle",defend=5},
	weapons={
		{name="Ground-to-Air Missile",attack=120,minRange=3,maxRange=5,ammunitionMax=6}}
	},
	--管道炮
	{name="PipeRunner",corpType='LandForce',price=20000,vision=4,
	move={movement=9,moveType="PipeRun",gasMax=99},
	armor={name="MiddleArmor",defend=0},
	weapons={
		{name="Missile",attack=100,minRange=2,maxRange=5,ammunitionMax=9}}
	},
	--坦克
	{name="Tank",corpType='LandForce',price=7000,vision=3,
	move={movement=6,moveType="Tread",gasMax=70},
	armor={name="MiddleArmor",defend=15},
	weapons={
		{name="Tank",attack=70,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=9},
		{name="MachineGun",attack=75,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true}}
	},
	--水陆坦克
	{name="AmphibiousTank",corpType='LandForce',price=12000,vision=2,
	move={movement=5,moveType="Tread",gasMax=60},
	armor={name="MiddleArmor",defend=25},
	weapons={
		{name="Tank",attack=80,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=9},
		{name="MachineGun",attack=85,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true}}
	},
	--中型坦克
	{name="MiddleTank",corpType='LandForce',price=16000,vision=2,
	move={movement=5,moveType="Tread",gasMax=50},
	armor={name="MiddleArmor",defend=45},
	weapons={
		{name="Tank",attack=100,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=9},
		{name="MachineGun",attack=105,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true}}
	},
	--核能坦克
	{name="NeoTank",corpType='LandForce',price=22000,vision=1,
	move={movement=6,moveType="Tread",gasMax=99},
	armor={name="MiddleArmor",defend=55},
	weapons={
		{name="Tank",attack=120,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=9},
		{name="MachineGun",attack=125,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true}}
	},
	--巨型坦克
	{name="MegaTank",corpType='LandForce',price=28000,vision=1,
	move={movement=4,moveType="Tread",gasMax=50},
	armor={name="HeavyArmor",defend=50},
	weapons={
		{name="TankX",attack=105,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=3},
		{name="MachineGun",attack=135,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true}}
	},
	--防空炮
	{name="AntiAir",corpType='LandForce',price=8000,vision=2,
	move={movement=6,moveType="Tread",gasMax=60},
	armor={name="AntiAir",defend=5},
	weapons={
		{name="Vulcan",attack=80,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=9}}
	},
	--反坦克炮
	{name="AntiTank",corpType='LandForce',price=11000,vision=2,
	move={movement=4,moveType="Tire",gasMax=50},
	armor={name="LightArmor",defend=10},
	weapons={
		{name="Hesh",attack=100,minRange=1,maxRange=3,counterAttack=true,ammunitionMax=6}}
	},
	--运输直升机
	{name="TransportCopter",corpType='AirForce',price=5000,vision=2,
	move={movement=6,moveType="Heli",gasMax=99},
	armor={name="Copter",defend=-20}
	},
	--武装直升机
	{name="BattleCopter",corpType='AirForce',price=9000,vision=3,
	move={movement=6,moveType="Heli",gasMax=99},
	armor={name="Copter",defend=30},
	weapons={
		{name="Air-to-Ground Missile",attack=70,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=6},
		{name="MachineGun(Copter)",attack=120,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true}}
	},
	--反潜直升机
	{name="AntiSubCopter",corpType='AirForce',price=12000,vision=3,
	move={movement=5,moveType="Heli",gasMax=80},
	armor={name="Copter",defend=20},
	weapons={
		{name="AntiSub Missile",attack=60,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=6},
		{name="MachineGun(Copter)",attack=80,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true}}
	},
	--战斗机
	{name="Fighter",corpType='AirForce',price=20000,vision=2,
	move={movement=9,moveType="Plane",gasMax=99},
	armor={name="Plane",defend=40},
	weapons={
		{name="Air-to-Air Missile",attack=100,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=6}}
	},
	--轰炸机
	{name="Bomber",corpType='AirForce',price=22000,vision=2,
	move={movement=7,moveType="Plane",gasMax=99},
	armor={name="Plane",defend=0},
	weapons={
		{name="Bomb",attack=135,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=9}}
	},
	--战斗轰炸机
	{name="FighterBomber",corpType='AirForce',price=21000,vision=2,
	move={movement=8,moveType="Plane",gasMax=99},
	armor={name="Plane",defend=30},
	weapons={
		{name="Bomb",attack=108,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=6},
		{name="MachineGun(Plane)",attack=90,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true}}
	},
	--隐形飞机
	{name="Stealth",corpType='AirForce',price=24000,vision=4,
	move={movement=6,moveType="Plane",gasMax=70},
	armor={name="Plane",defend=25},
	weapons={
		{name="Missile",attack=90,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=6}},
	hidable=true--[[可隐形]]},
	--侦察机
	{name="Duster",corpType='AirForce',price=13000,vision=5,
	move={movement=8,moveType="Plane",gasMax=99},
	armor={name="Plane",defend=15},
	weapons={
		{name="MachineGun(Plane)",attack=85,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=9}}
	},
	--水上飞机
	{name="SeaPlane",corpType='AirForce',price=15000,vision=3,
	move={movement=7,moveType="Plane",gasMax=40},
	armor={name="Plane",defend=10},
	weapons={
		{name="AntiSub Missile",attack=70,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=3}}
	},
	--运输飞机
	{name="TransportPlane",corpType='AirForce',price=12000,vision=2,
	move={movement=7,moveType="Plane",gasMax=99},
	armor={name="Plane",defend=5}
	},
	--黑色炸弹
	{name="BlackBomb",corpType='AirForce',price=25000,vision=1,
	move={movement=9,moveType="Plane",gasMax=45},
	armor={name="Plane",defend=0},
	explodable=true--[[会爆炸]]},
	--战舰
	{name="BattleShip",corpType='NavyForce',price=28000,vision=2,
	move={movement=5,moveType="Ship",gasMax=99},
	armor={name="Ship",defend=20},
	weapons={
		{name="Cannon",attack=105,minRange=2,maxRange=6,ammunitionMax=9}}
	},
	--驱逐舰
	{name="Destroyer",corpType='NavyForce',price=25000,vision=2,
	move={movement=5,moveType="Ship",gasMax=99},
	armor={name="Ship",defend=10},
	weapons={
		{name="Cannon",attack=70,minRange=3,maxRange=5,attackAfterMove=true,ammunitionMax=9}}
	},
	--巡洋舰
	{name="Cruiser",corpType='NavyForce',price=18000,vision=3,
	move={movement=6,moveType="Ship",gasMax=99},
	armor={name="AntiSub Ship",defend=0},
	weapons={
		{name="AntiSub Missile",attack=90,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=6},
		{name="AntiAirGun",attack=70,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true}}
	},
	--护卫舰
	{name="Frigate",corpType='NavyForce',price=21000,vision=3,
	move={movement=6,moveType="Ship",gasMax=99},
	armor={name="Ship",defend=20},
	weapons={
		{name="Torpedo",attack=70,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=6},
		{name="Vulcan",attack=70,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true}}
	},
	--航空母舰
	{name="Carrier",corpType='NavyForce',price=30000,vision=4,
	move={movement=4,moveType="Ship",gasMax=99},
	armor={name="Ship",defend=0},
	weapons={
		{name="Ground-to-Air Missile",attack=70,minRange=3,maxRange=8,attackAfterMove=true,counterAttack=true,ammunitionMax=6}}
	},
	--潜艇
	{name="Submarine",corpType='NavyForce',price=20000,vision=5,
	move={movement=4,moveType="Ship",gasMax=99},
	armor={name="Sub",defend=0},
	weapons={
		{name="Torpedo",attack=100,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=6}},
	divable=true--[[可下潜]]},
	--炮艇
	{name="GunBoat",corpType='NavyForce',price=6000,vision=2,
	move={movement=7,moveType="Boat",gasMax=99},
	armor={name="Boat",defend=0},
	weapons={
		{name="Cannon",attack=70,minRange=1,maxRange=1,attackAfterMove=true,counterAttack=true,ammunitionMax=1}}
	},
	--登录艇
	{name="Lander",corpType='NavyForce',price=12000,vision=1,
	move={movement=6,moveType="Boat",gasMax=99},
	armor={name="Boat",defend=20}
	},
	--黑船
	{name="BlackBoat",corpType='NavyForce',price=7500,vision=1,
	move={movement=7,moveType="Boat",gasMax=70},
	armor={name="Boat",defend=10},
	repairable=true--[[可修理]]
	},

	--常用方法
	find = function(para)--通过para查找兵种表,para可以是序数,也可以是兵种的名字
		local tp = type(para)
		for key,val in ipairs(Corps) do
			if tp=='number' and key == para then return key,val end
			if tp=='string' and val.name == para then return key,val end
		end
	end,
	findNames_byCorpType=function(corpTypeName)--根据军种查询出所有兵种的名字
		local names={}
		for k,v in ipairs(Corps) do
			if v.corpType == corpTypeName then table.insert(names,v.name) end
		end
		return names
	end,
	isDirectAttack=function(corp)--判断corp是否直接攻击的兵种
		if corp.weapons then
			local wpn=corp.weapons[1]
			if wpn.minRange==1 and wpn.maxRange==1 then return true end
		end
	end,
	isIndirectAttack=function(corp)--判断corp是否间接攻击的兵种
		if corp.weapons then
			local wpn=corp.weapons[1]
			if wpn.maxRange>1 then return true end
		end
	end,
	isTransportOnly=function(corp)--判断corp是否是纯运输部队
	end,
	newUnit = function(corpName,troopName)--根据corpName和troopName来创建一个单位
		local corpIndex,corp=Corps.find(corpName)
		local troopIndex,troop=Troops.find(troopName)
		if corpIndex==nil or corp==nil or troopIndex==nil or troop==nil then return end
		--生成默认单位
		local unit = Unit:new()
		unit.corpType=corpIndex
		unit.color=troopIndex
		unit.healthPower=100
		unit.fuel=corp.move.gasMax
		--以主武器弹药数为准
		if corp.weapons ~=nil and corp.weapons[1].ammunitionMax ~= nil then
			unit.ammunition=corp.weapons[1].ammunitionMax
		else
			unit.ammunition=0
		end
		if corp.metarial then unit.ammunition = corp.metarial end--APC暂时用这个来保存材料数吧
		if corp.flarable then unit.ammunition = corp.ammunitionMax end--Flare暂时用这个来保存照明弹数吧
		unit.progressValue=0--占领值或者建造值
		return unit
	end,
	baseDamage=function(attackCorp,weaponIndex,defendCorp)--根据attackCorp及其weaponIndex来判断能否攻击defendCorp,返回基本损伤值,nil为无法攻击
		if not attackCorp.weapons then return end--首先得有武器
		local weapon=nil
		if weaponIndex then--选择特定武器
			weapon=attackCorp.weapons[weaponIndex]
		else--自动选择武器
			local n=table.maxn(attackCorp.weapons)
			for i=1,n do
				if Corps.baseDamage(attackCorp,i,defendCorp) then weapon=attackCorp.weapons[i] break end
			end
		end
		if not weapon then return end--没有可攻击的武器
		local w,a,forbear=Weapons.damageRatio(weapon.name,defendCorp.armor.name)
		if not w or not a then return end--无法攻击
		--公式:(武器攻击力 - 兵种防御力) * 武器护甲系数
		local def=defendCorp.armor.defend
		if forbear then def=0 end
		local damage=math.floor((weapon.attack-def) * w / a)
		if damage<0 then damage=0 end
		return damage
	end
}
