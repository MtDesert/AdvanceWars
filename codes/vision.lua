--这是视野计算模块,包括闪光弹
--临时变量,只用来取数据
local terrain=Terrain:new()
local p=Point:new()

local forceSee={}--一定能看到的,其实就是自军或者友军周围的点
local airOnly={}--可以看到空军的点,一般是掩体

function caculateVision()
	visiblePoints:clear()
	forceSee={}
	airOnly={}
	if not senario.isFogWar or not currentViewer then return end
	--检查地形
	local l=battleField:getLength()
	local w=battleField:getWidth()
	for x=0,l-1 do
		for y=0,w-1 do
			p.x=x p.y=y
			battleField:getTerrain(p,terrain)--先获取地形
			local terrainKey,terrainAttrib=Terrains.find(terrain.terrainType)
			if terrainKey and terrainAttrib.capturable then--判断是不是可占领的地形
				local troopKey,troop=Troops.find(terrain.status)
				if terrain.status==currentViewer.color or treatMeAsFriend(currentViewer.color,terrain.status) then--判断是不是自己的或者友军的
					visiblePoints:push_back(p)
					--雷达地形还能加1-5视野
					if terrainAttrib.name=='Radar' then
						caculateVision_byCenter(p,1,5)
					end
				end
			end
		end
	end
	--检查单位视野
	local unit = unitList:constReferenceBegin()
	while not unitList:constIteratorIsEnd() do
		--local troopKey,troop=Troops.find(unit.color)
		if (unit.color == currentViewer.color or treatMeAsFriend(currentViewer.color,unit.color)) then--判断是不是自己或者友军的,并且没有被装载过
			caculateVision_unit(unit)
		end
		unit = unitList:constReferenceNext()
	end
	--计算一下闪光弹
	for k,p in ipairs(flarePoints) do
		visiblePoints:push_back(p)
		caculateVision_byCenter(p,1,2)
	end
	--移除重复点
	battleField:removePoints_NoInRange(visiblePoints)
	visiblePoints:eraseDuplicate()
	--计算单位的可见性
	caculateVisibility_unit()
end

function caculateVision_unit(unit)
	--查找兵种，获取其视野
	local corpKey,corp=Corps.find(unit.corpType)
	if not corp then return end
	local vision=corp.vision
	--根据视野来进行计算
	visiblePoints:push_back(unit.coordinate)
	caculateVision_byCenter(unit.coordinate,1,vision)
end

--添加可视范围的算法(好吧这是个比较恶心的递归函数的写法)
function caculateVision_byCenter(center,minDistance,maxDistance)
	if maxDistance then--这是有三个参数的情况
		for i=minDistance,maxDistance do
			caculateVision_byCenter(center,i)
		end
	else--这是只有两个参数的情况
		local d=minDistance
		for i=1,d do
			tryToLookAt(center,i,i-d)
			tryToLookAt(center,d-i,i)
			tryToLookAt(center,-i,d-i)
			tryToLookAt(center,i-d,-i)
		end
	end
end
--试图观察某个点，这个点可能临近，可能是掩体，可能有空军
function tryToLookAt(center,dx,dy)
	p.x=center.x+dx p.y=center.y+dy
	if math.abs(dx) + math.abs(dy)==1 then 
		visiblePoints:push_back(p)--临近的点,一定能看到
		table.insert(forceSee,p)
	else
		if battleField:getTerrain(p,terrain) then
			local terrainKey,terrainAttrib=Terrains.find(terrain.terrainType)
			if terrainKey then
				if not terrainAttrib.hidable then visiblePoints:push_back(p)--视野内的掩体是可以看到的
				else table.insert(airOnly,Point:new(p)) end--掩体只能看到空军吧(注意,如果这里吧Point:new(p)改成p的话，空军就有可能隐藏在掩体里了)
			end
		end
	end
end

function caculateVisibility_unit()--计算单位的可见性
	local unit = unitList:referenceBegin()
	while not unitList:iteratorIsEnd() do
		local troopKey,troop=Troops.find(unit.color)
		if (unit.color == currentViewer.color or treatMeAsFriend(currentViewer.color,unit.color)) then unit.isVisible=true--可以看见自己和友军的部队
		elseif tableContain(forceSee,unit.coordinate) then unit.isVisible=true--附近部队可见
		elseif unit.isHide then unit.isVisible=false--隐藏的部队不可见
		elseif senario.isFogWar then--雾战中
			if visiblePoints:contain(unit.coordinate) then unit.isVisible=true--视野内的部队可以看见
			else
				local corpKey,corp=Corps.find(unit.corpType)
				if corp.corpType=='AirForce' then--空军不能隐藏在掩体中
					unit.isVisible = tableContain(airOnly,unit.coordinate)
				else unit.isVisible=false end
			end
		else unit.isVisible=true end
		unit = unitList:referenceNext()
	end
end