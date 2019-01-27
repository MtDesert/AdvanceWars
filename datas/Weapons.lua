--这是武器护甲系统的相关数据
--先列出武器,每种武器都会列出对应的护甲,以及伤害比例
Weapons=
{
	{name='MachineGun',--机枪
		{name='Body',w=1,a=1},
		{name='LightArmor',w=2,a=3},
		{name='Vehicle',w=1,a=2},
		{name='MiddleArmor',w=1,a=10},
		{name='HeavyArmor',w=1,a=16},
		{name='AntiAir',w=1,a=9},
		{name='Copter',w=1,a=3}
	},
	{name='RocketTube',--火箭筒
		{name='LightArmor',w=16,a=17},
		{name='Vehicle',w=17,a=14,forbear=true},
		{name='MiddleArmor',w=1,a=1},
		{name='HeavyArmor',w=1,a=2},
		{name='AntiAir',w=1,a=1}
		--{name='Copter',w=1,a=2,forbear=true}
	},
	{name='Cannon',--加农
		{name='Body',w=1,a=1},
		{name='LightArmor',w=8,a=9},
		{name='Vehicle',w=8,a=9,forbear=true},
		{name='MiddleArmor',w=1,a=1},
		{name='HeavyArmor',w=3,a=8},
		{name='AntiAir',w=15,a=17},
		{name='Ship',w=1,a=2},
		{name='AntiSub Ship',w=9,a=10},
		{name='Sub',w=1,a=2},
		{name='Boat',w=1,a=2},
	},
	{name='Rocket',--火箭
		{name='Body',w=1,a=1},
		{name='LightArmor',w=9,a=10},
		{name='Vehicle',w=9,a=10,forbear=true},
		{name='MiddleArmor',w=1,a=1},
		{name='HeavyArmor',w=1,a=2},
		{name='AntiAir',w=17,a=20}
	},
	{name='Tank',--坦克炮
		{name='LightArmor',w=1,a=2},
		{name='Vehicle',w=17,a=14,forbear=true},
		{name='MiddleArmor',w=1,a=1},
		{name='HeavyArmor',w=1,a=2},
		{name='AntiAir',w=1,a=1}
	},
	{name='TankX',--坦克炮X
		{name='LightArmor',w=2,a=3},
		{name='Vehicle',w=39,a=18,forbear=true},
		{name='MiddleArmor',w=2,a=1},
		{name='HeavyArmor',w=1,a=1},
		{name='AntiAir',w=2,a=1}
	},
	{name='Hesh',--破甲弹
		{name='Body',w=4,a=5},
		{name='LightArmor',w=7,a=10},
		{name='Vehicle',w=1,a=1,forbear=true},
		{name='MiddleArmor',w=6,a=5,},
		{name='HeavyArmor',w=2,a=5,forbear=true},
		{name='AntiAir',w=11,a=10,forbear=true},
		{name='Copter',w=1,a=2}
	},
	{name='Vulcan',--Vulcan防空枪
		{name='Body',w=21,a=16,forbear=true},
		{name='LightArmor',w=6,a=5},
		{name='Vehicle',w=1,a=1,forbear=true},
		{name='MiddleArmor',w=1,a=2},
		{name='HeavyArmor',w=1,a=15},
		{name='AntiAir',w=3,a=5},
		{name='Copter',w=3,a=2,forbear=true},
		{name='Plane',w=1,a=1}
	},
	{name='AntiAirGun',--防空炮
		{name='Copter',w=1,a=1,forbear=true},
		{name='Plane',w=8,a=9,forbear=true}
	},
	{name='Ground-to-Air Missile',--地对空导弹
		{name='Copter',w=1,a=1,forbear=true},
		{name='Plane',w=5,a=6,forbear=true}
	},
	{name='Air-to-Ground Missile',--空对地导弹
		{name='Vehicle',w=1,a=1,forbear=true},
		{name='MiddleArmor',w=1,a=1},
		{name='HeavyArmor',w=1,a=2},
		{name='AntiAir',w=5,a=13}
	},
	{name='MachineGun(Copter)',--机枪(直升机)
		{name='Body',w=5,a=8},
		{name='LightArmor',w=1,a=2},
		{name='Vehicle',w=1,a=3},
		{name='MiddleArmor',w=1,a=18},
		{name='HeavyArmor',w=1,a=36},
		{name='AntiAir',w=1,a=20},
		{name='Copter',w=2,a=3}
	},
	{name='AntiSub Missile',--反潜导弹
		{name='Ship',w=1,a=6},
		{name='AntiSub Ship',w=5,a=18},
		{name='Sub',w=1,a=1},
		{name='Boat',w=1,a=2},
	},
	{name='Air-to-Air Missile',--空对空导弹
		{name='Copter',w=1,a=1,forbear=true},
		{name='Plane',w=1,a=1}
	},
	{name='Bomb',--炸弹
		{name='Body',w=22,a=27},
		{name='LightArmor',w=20,a=27},
		{name='Vehicle',w=21,a=27,forbear=true},
		{name='MiddleArmor',w=1,a=1},
		{name='HeavyArmor',w=7,a=17},
		{name='AntiAir',w=8,a=13}
	},
	{name='MachineGun(Plane)',--机枪(飞机)
		{name='Body',w=1,a=1},
		{name='LightArmor',w=3,a=5},
		{name='Vehicle',w=1,a=3},
		{name='MiddleArmor',w=1,a=10},
		{name='HeavyArmor',w=1,a=16},
		{name='AntiAir',w=1,a=10},
		{name='Copter',w=1,a=1},
		{name='Plane',w=9,a=10}
	},
	{name='Missile',--导弹(全方位)
		{name='Body',w=1,a=1},
		{name='LightArmor',w=8,a=9},
		{name='Vehicle',w=8,a=9,forbear=true},
		{name='MiddleArmor',w=1,a=1},
		{name='HeavyArmor',w=1,a=2},
		{name='AntiAir',w=10,a=17},
		{name='Copter',w=1,a=1},
		{name='Plane',w=1,a=1}
	},
	{name='Torpedo',--鱼雷
		{name='Ship',w=3,a=4},
		{name='AntiSub Ship',w=1,a=4},
		{name='Sub',w=1,a=2},
		{name='Boat',w=1,a=1}
	},
	damageRatio=function(weaponName,armorName)--根据武器名字和护甲名字来查找损伤比例
		local weapon,armor=nil,nil
		for k,w in ipairs(Weapons) do
			if w.name == weaponName then weapon=w break end
		end
		if not weapon then return end
		for k,a in ipairs(weapon) do
			if a.name == armorName then armor=a break end
		end
		if armor then return armor.w,armor.a,armor.forbear end
	end
}