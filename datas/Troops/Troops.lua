Troops=
{
	{name="OrangeStar",
	colors={0xFF700000,0xFFA02000,0xFFD04000,0xFFFF6000}},
	{name="BlueMoon",
	colors={0xFF2030FF,0xFF4060FF,0xFF6090FF,0xFF80C0FF}},
	{name="GreenEarth",
	colors={0xFF004000,0xFF008000,0xFF00C000,0xFF00FF00}},
	{name="YellowComet",
	colors={0xFF404000,0xFF808000,0xFFC0C000,0xFFFFFF00}},
	{name="BlackHole",
	colors={0xFF101010,0xFF202020,0xFF303030,0xFF404040}},
	{name="RedFire",
	colors={0xFF2E0A12,0xFF5C1424,0xFF8A1E36,0xFFB82848}},
	{name="GreySky",
	colors={0xFF303030,0xFF606060,0xFF909090,0xFFC0C0C0}},
	{name="BrownDesert",
	colors={0xFF26140C,0xFF4C2818,0xFF723C24,0xFF985030}},
	{name="AmberBlaze",
	colors={0xFF40280E,0xFF80501C,0xFFC0782A,0xFFFFA038}},
	{name="JadeSun",
	colors={0xFF282E26,0xFF505C4C,0xFF788A72,0xFFA0B898}},
	{name="CobaltIce",
	colors={0xFF90A4EC,0xFF4464DC,0xFF2840B8,0xFF0C2070}},
	{name="PinkCosmos",
	colors={0xFF401933,0xFF803266,0xFFC04B99,0xFFFF64CC}},
	{name="TealGalaxy",
	colors={0xFF0F3330,0xFF1E6660,0xFF2D9990,0xFF3CCCC0}},
	{name="PurpleLightning",
	colors={0xFF400040,0xFF800080,0xFFC000C0,0xFFFF00FF}},
	{name="Raider",
	colors={0xFF1A1A1A,0xFF343434,0xFF4E4E4E,0xFF686868}},
	{name="Rubinelle",
	colors={0xFF2E250C,0xFF5C5018,0xFF8A7524,0xFFB8A030}},
	{name="Rubinelle--12thBattalion",
	colors={0xFF400000,0xFF800000,0xFFC00000,0xFFFF0000}},
	{name="Lazurian",
	colors={0xFF000080,0xFF404080,0xFF4040FF,0xFF8080FF}},
	{name="IDS",
	colors={0xFF2E2E2E,0xFF5C5C5C,0xFF7A7A7A,0xFF989898}},
	{name="Neutral",--中立部队
	colors={0xFF404040,0xFF808080,0xFFC0C0C0,0xFFFFFFFF}},
	--主要操作方法
	find = function(para)--通过para查找部队表,para可以是序数,也可以是部队的名字
		local tp = type(para)
		for key,val in ipairs(Troops) do
			if tp=='number' and key == para then return key,val end
			if tp=='string' and val.name == para then return key,val end
		end
	end,
	newTroop = function(troopName)--根据troopName创建部队
		local troopIndex,troopAttribute=Troops.find(troopName)
		--描述部队信息的表
		local troop=
		{
			color=troopIndex,--部队颜色,其实是个整数
			funds=0,--部队资金
			friends={},--友军表(保存Troops索引号)
			enemies={},--敌军表(保存Troops索引号)
			repairUnit=function(troop,unit)--修理单位的功能
				local corpKey,corp=Corps.find(unit.corpType)
				if not corp then return end
				--计算应该修复多少hp
				local repairValue = 10*unit:presentHP()
				if unit.healthPower + repairValue > 100 then repairValue=100-unit.healthPower end
				--计算修理费
				local price = corp.price
				local repairFee = repairValue * price / 100
				if repairFee > troop.funds then
					repairValue = troop.funds * 100 / price
					repairFee = repairValue * price / 100
				end
				--开始修理
				unit.healthPower = unit.healthPower + repairValue
				troop.funds = troop.funds - repairFee
			end
		}
		return troop
	end
}