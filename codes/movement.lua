--这个模块是专门进行移动计算的模块，主要是可移动范围的计算和路径的选择处理

--移动损耗计算
--moveType移动类型,terrain为地形,weatherName天气名
--返回损耗值，nil为无法移动到该地形
function movementCost(moveType,trnName,weatherName)
	--根据移动方式来判断
	local cost=nil
	if moveType == 'Foot' then
		if trnName == 'Sea' or trnName == 'Reef' or trnName == 'Pipe' or trnName == 'PipeJoint' then return nil--不可通过的地形
		elseif trnName=='WasteLand' and (weatherName=='Rainy' or weatherName=='RainStorm') then cost=2--下雨时候荒地会增加移动损耗
		elseif trnName=='Plain' and (weatherName=='Snowy' or weatherName=='Blizzard') then cost=2--下雪时候草地会增加移动损耗
		elseif trnName=='River' then
			if weatherName=='Rainy' or weatherName=='RainStorm' or weatherName=='Blizzard' or weathername=='SandStorm' then cost=3--下雨天、暴风雪、沙暴增加移动损耗
			else cost=2 end
		elseif trnName=='Mountain' then
			if weatherName=='Normal' then cost=2
			else cost=3 end--非正常天气爬山会增加移动损耗
		elseif trnName=='Ruin' then cost=2--废墟会增加移动损耗
		else cost=1 end--正常损耗
		return cost
	elseif moveType =='Boot' then
		if trnName == 'Sea' or trnName == 'Reef' or trnName == 'Pipe' or trnName == 'PipeJoint' then return nil--不可通过的地形
		elseif trnName=='WasteLand' and (weatherName=='Rainy' or weatherName=='RainStorm') then cost=2--下雨时候荒地会增加移动损耗
		elseif trnName=='Plain' and weatherName=='Blizzard' then cost=2--暴风雪时候草地会增加移动损耗
		elseif trnName=='River' then
			if weatherName=='Rainy' or weatherName=='RainStorm' or weatherName=='Blizzard' or weathername=='SandStorm' then cost=2--下雨天、暴风雪、沙暴增加移动损耗
			else cost=1 end
		elseif trnName=='Mountain' then
			if weatherName=='RainStorm' or weatherName=='Blizzard' or weatherName=='SandStorm' then cost=2
			else cost=1 end--非正常天气爬山会增加移动损耗
		elseif trnName=='Ruin' then cost=2--废墟会增加移动损耗
		else cost=1 end--正常损耗
		return cost
	elseif moveType =='Tire' then
		if trnName=='Mountain' or trnName=='River' or trnName == 'Sea' or trnName == 'Reef' or trnName == 'Pipe' or trnName == 'PipeJoint' then return nil--不可通过的地形
		elseif trnName=='WasteLand' then
			if weatherName=='Rainy' or weatherName=='RainStorm' then cost=2
			else cost=1 end--下雨时候荒地会增加移动损耗
		elseif trnName=='Plain' then
			if weatherName=='Snowy' or weatherName=='Blizzard' then cost=3--暴风雪时候草地会增加移动损耗
			else cost=2 end
		elseif trnName=='Wood' then cost=3
		elseif trnName=='Ruin' then cost=2--废墟会增加移动损耗
		else cost=1 end--正常损耗
		return cost
	elseif moveType =='Tread' then
		if trnName=='Mountain' or trnName=='River' or trnName == 'Sea' or trnName == 'Reef' or trnName == 'Pipe' or trnName == 'PipeJoint' then return nil--不可通过的地形
		elseif trnName=='WasteLand' and weatherName=='RainStorm' then cost=2--下雨时候荒地会增加移动损耗
		elseif trnName=='Plain' and weatherName=='Blizzard' then cost=2--暴风雪时候草地会增加移动损耗
		elseif trnName=='Wood' then cost=2
		elseif trnName=='Ruin' then cost=2--废墟会增加移动损耗
		else cost=1 end--正常损耗
		return cost
	elseif moveType =='Heli' then
		if trnName=='Pipe' or trnName=='PipeJoint' then return nil
		elseif weatherName=='Blizzard' then cost=3
		elseif weatherName=='Snowy' or weatherName=='RainStorm' or weatherName=='SandStorm' then cost=2
		else cost=1 end
		return cost
	elseif moveType =='Plane' then
		if trnName=='Pipe' or trnName=='PipeJoint' then return nil
		elseif weatherName=='Snowy' or weatherName=='Blizzard' then cost=2
		else cost=1 end
		return cost
	elseif moveType =='Ship' then
		if trnName=='ShipPort' or trnName=='ShipFactory' then cost=1
		elseif trnName=='Sea' then cost=1--这里要看海浪的情况
		elseif trnName=='Reef' then cost=1--这里要看海浪的情况
		else return nil end
		return cost
	elseif moveType =='Boat' then
		if trnName=='ShipPort' or trnName=='ShipFactory' or trnName=='Shoal' then cost=1
		elseif trnName=='Sea' then cost=1--这里要看海浪的情况
		elseif trnName=='Reef' then cost=1--这里要看海浪的情况
		else return nil end
		return cost
	elseif moveType =='PipeRun' then
		if trnName=='Pipe' or trnName=='PipeJoint' or trnName=='Factory' then return 1--管道上跑,风雨无阻
		else return nil end
	end
	return nil
end

--燃料损耗(天气名),返回损耗值
function fuelCost(weatherName)
	local cost=1
	if weatherName == 'Snowy' or weatherName=='Blizzard' then cost=2 end
	return cost
end