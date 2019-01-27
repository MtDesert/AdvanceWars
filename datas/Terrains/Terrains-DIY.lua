Terrains={
	{name="WasteLand",defendLV=0},
	{name="Plain",defendLV=1},
	{name="Wood",defendLV=2,hidable=true},
	{name="Mountain",defendLV=4},
	{name="River",defendLV=0,has4direction=true,tileType="Water"},
	{name="Sea",defendLV=0,has4direction=true,tileType="Water"},
	{name="Shoal",defendLV=0,has4direction=true,tileType="Water"},
	{name="Reef",defendLV=2,hidable=true,tileType="Water"},
	{name="Road",defendLV=0,has4direction=true,tileType="Way"},
	{name="Bridge",defendLV=0,has4direction=true,tileType="Way"},
	{name="Ruin",defendLV=1,hidable=true},
	{name="City",defendLV=3,capturable=true,hasIncome=true},
	{name="AirPort",defendLV=1,capturable=true},
	{name="ShipPort",defendLV=1,capturable=true},
	{name="Factory",defendLV=3,capturable=true,hasIncome=true},
	{name="AirFactory",defendLV=3,capturable=true,hasIncome=true},
	{name="ShipFactory",defendLV=3,capturable=true,hasIncome=true},
	{name="ComTower",defendLV=2,capturable=true},
	{name="Radar",defendLV=2,capturable=true},
	{name="Lab",defendLV=3,capturable=true},
	{name="HQ",defendLV=4,capturable=true,hasIncome=true},
	{name="Silo",defendLV=4,capturable=true},
	{name="SiloEmpty",defendLV=3,capturable=true},
	{name="Pipe",defendLV=0,has4direction=true,tileType="Pipe"},
	{name="PipeSeam",defendLV=0,has4direction=true,tileType="Pipe"},
	{name="PipeSeam_Broken",defendLV=-1,has4direction=true,tileType="Pipe"},
	--主要方法
	find = function(para)--通过para查找地形,para可以是序数,也可以是地形的名字
		local tp = type(para)
		for key,val in ipairs(Terrains) do
			if tp=='number' and key == para then return key,val end
			if tp=='string' and val.name == para then return key,val end
		end
	end
}
