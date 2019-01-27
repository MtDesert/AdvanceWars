--这个模块是专门进行移动计算的模块，主要是可移动范围的计算和路径的选择处理

local select=nil

--计算unit的移动范围
function caculateMovement(selected)
	select=selected
	if select.corp == nil then return end
	--记录起点信息、剩余移动力、剩余燃料
	movablePoints:clear()--清空之前的计算结果
	local mp=Senario.MovePoint:new(select.unit.coordinate)
	mp.remainMovement=select.corp.move.movement
	mp.remainFuel=select.unit.fuel
	--少了个计算剩余移动力的东西
	--这里加入CO对移动力的修正,对了还有个别CO是可以以地形损耗1通过所有地形的
	--开始对点进行推算
	movablePoints:clear()
	movablePoints:push_back(mp)
	movePath:clear()
	movePath:push_back(mp)

	mp = movablePoints:constReferenceBegin()
	while not movablePoints:constIteratorIsEnd() do
		tryToMoveTo(mp,up)
		tryToMoveTo(mp,right)
		tryToMoveTo(mp,down)
		tryToMoveTo(mp,left)
		mp = movablePoints:constReferenceNext()
	end
	--根据情况计算攻击范围
	if select.corp.weapons then
		local min=select.corp.weapons[1].minRange
		local max=select.corp.weapons[1].maxRange
		if min==1 and max==1 then
			caculateFlightshot_byMovement()
		else
			caculateFlightshot_byCenter(select.unit.coordinate,min,max)
		end
	end

end

--试图移动函数，目标点可通行的话，会自动添加到列表中
--currentPos为当前点
--offset为与当前点的偏移量
function tryToMoveTo(currentPos,offset)
	local targetPos=Point:new(currentPos + offset)
	--坐标边界判定
	local terrain=Terrain:new()
	if not battleField:getTerrain(targetPos,terrain) then return end
	--获取地形信息，判断是否可移动的地形
	local moveCost = movementCost(select.moveType,terrain,weatherName)
	if moveCost==nil then return end
	--碰撞检测，检测是否发生碰撞
	local unit = unitList:constReferenceBegin()
	while not unitList:constIteratorIsEnd() do
		if unit.coordinate == targetPos and unit.color ~= select.unit.color and unit.isVisible then
			if not treatMeAsFriend(unit.color) then return end--判断是敌人还是朋友,不是朋友的一般都会采取拦截措施
		end
		--搜寻下一个unit
		unit = unitList:constReferenceNext()
	end
	--检查剩余的移动力和燃料
	--if moveCost1 then moveCost=1 end--某些指挥官貌似走可走的地形都是1
	if currentPos.remainMovement < moveCost then return end
	local costFuel = fuelCost(weatherName) * moveCost
	if currentPos.remainFuel < costFuel then return end

	--添加移动
	local p=Senario.MovePoint:new(targetPos);
	p.remainMovement = currentPos.remainMovement - moveCost;
	p.remainFuel = currentPos.remainFuel - costFuel;
	--检查是否重复
	local exist = movablePoints:referenceBegin()
	while not movablePoints:iteratorIsEnd() do
		if exist.x == p.x and exist.y == p.y then break end--嗯貌似别的路径也能走过这个点，那么应该找最优
		exist = movablePoints:referenceNext()
	end
	if movablePoints:iteratorIsEnd() then movablePoints:push_back(p)--插入新的移动点
	else
		if exist.remainMovement < p.remainMovement then movablePoints:iteratorModify(p) end--更新现有移动点信息
	end
end

--移动损耗计算
--参数terrain为地形(有状态)，weatherName天气名
--返回损耗值，nil为无法移动到该地形
function movementCost(moveType,terrain,weatherName)
	local terrainKey,terrainAttribute = Terrains.find(terrain.terrainType)
	if not terrainKey then return end
	local trnName = terrainAttribute.name
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
			else cost=3 end--非正常天气爬山会增加移动损耗
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

--燃料损耗
--返回损耗值
function fuelCost(weatherName)
	local cost=nil
	if weatherName == 'Snowy' or weatherName=='Blizzard' then cost=2
	else cost=1 end
	return cost
end

--添加路径上的点，这个函数有可能会被频繁调用
--p为目标点，该函数会进行自动寻路
--返回nil表示点p不在移动范围内，false表示路径没有变化，true表示路径发生了变化
function selectPath(p)
	--检查目标点在不在移动路径内
	local path = movePath:referenceBegin()
	while not movePath:iteratorIsEnd() do
		if p.x == path.x and p.y == path.y then break end
		path = movePath:referenceNext()
	end
	--如果在路径内，删除掉后续的点
	if not movePath:iteratorIsEnd() then
		--print('路径内')
		movePath:iteratorNext()
		--如果是终点，直接弹出菜单
		if movePath:iteratorIsEnd() then return false end
		--否则退回多余的路径
		repeat
			movePath:iteratorErase()
		until movePath:iteratorIsEnd()
	else
		--检查目标点在不在移动范围内
		local mp = movablePoints:referenceBegin()
		while not movablePoints:iteratorIsEnd() do
			if p.x == mp.x and p.y == mp.y then break end
			mp = movablePoints:referenceNext()
		end
		if movablePoints:iteratorIsEnd() then return end
		--试图移动到新的点
		if tryToPathTo(mp) then --print('下一个移动点')
		else--不能沿着新的路径移动过去，那么我们就调整路径
			--print('自动搜寻新路径')
			movePath:clear()
			movePath:push_front(mp)
			local pp = movePath:front()
			--上下左右
			local up=Point:new(0,1)
			local down=Point:new(0,-1)
			local left=Point:new(-1,0)
			local right=Point:new(1,0)
			while true do
				if tryToBackPathTo(pp,up) then
				elseif tryToBackPathTo(pp,down) then
				elseif tryToBackPathTo(pp,left) then
				elseif tryToBackPathTo(pp,right) then
				else break end
				pp = movePath:front()
			end
		end
	end
	return true
end

--试图沿着路径移动到target点
--返回是否移动成功
function tryToPathTo(target)
	--这个点必须和路径的最后一个点是相邻的
	movePath:constIteratorEnd()
	local lastP = movePath:constReferencePrev()
	local delta = target - lastP
	if delta:manhattanLength() ~= 1 then return end
	--取地形
	local terrain=Terrain:new()
	if not battleField:getTerrain(target,terrain) then return end
	--看看剩余的移动力和燃料能不能过去
	local moveCost=movementCost(select.moveType,terrain,weatherName)
	if lastP.remainMovement < moveCost then return end
	local costFuel = fuelCost() * moveCost
	if lastP.remainFuel < costFuel then return end
	--可以移动过去
	local p=Senario.MovePoint:new(target);
	p.remainMovement = lastP.remainMovement-moveCost;
	p.remainFuel = lastP.remainFuel-costFuel;
	movePath:push_back(p)
	return true
end

--逆向寻路函数，根据终点坐标和偏移量自动算出路径，需要移动范围作为依据
--currentPos为终点
--offset为与当前点的偏移量
--返回当前寻找的路径是否可行
function tryToBackPathTo(current,offset)
	--搜索一下有没有临近点
	local target = current + offset
	local prev = movablePoints:constReferenceBegin()
	while not movablePoints:constIteratorIsEnd() do
		if prev.x == target.x and prev.y == target.y then break end
		--搜索下一个
		prev = movablePoints:constReferenceNext()
	end
	if movablePoints:constIteratorIsEnd() then return end
	--检查一下移动力
	if prev.remainMovement <= current.remainMovement then return end
	--OK!!!
	movePath:push_front(prev)
	return true;
end

--移动函数，执行移动过程
--没有发生碰撞时返回true
function moveWithPath()
	local path = movePath:constReferenceBegin()
	while not movePath:constIteratorIsEnd() do
		--碰撞检测，检测是否发生碰撞
		local unit = unitList:constReferenceBegin()
		while not unitList:constIteratorIsEnd() do
			if unit.coordinate.x == path.x and unit.coordinate.y == path.y and unit.color ~= select.unit.color then--有部队并且非我军部队，需要进行判断
				if not treatMeAsFriend(select.unit.color,unit.color) then return print('糟糕!有埋伏!') end--判断是敌人还是朋友,不是朋友的一般都会采取拦截措施
			end
			--搜寻下一个unit
			unit = unitList:constReferenceNext()
		end
		--没有问题，移动过去吧!
		--print('正在经过点'..path.x..','..path.y)
		select.unit.coordinate = path
		select.unit.fuel = path.remainFuel
		path = movePath:constReferenceNext()
	end
	return true
end