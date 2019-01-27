--这是地图编辑器有关的模块
editingUnit=false
centralSymmetry=false
leftRightSymmetry=false
upDownSymmetry=false

editing_Troop=1
editing_Corp=1
editing_TerrainType=1
editing_TerrainStatus=0

function edit_xy(x,y)
	print('editor:'..x..','..y)
	if editingUnit then--设定作战
		local unit=Corps.newUnit(editing_Corp,editing_Troop)
		if unit then--创建单位
			unit.coordinate.x=x
			unit.coordinate.y=y
			unitList:push_back(unit)
		else--删除单位
			unit=findUnit_byCoordinate(x,y)
			if unit then
				unitList:remove(unit)
			end
		end
	else--设定地形
		local trn=Terrain:new(editing_TerrainType,editing_TerrainStatus)
		if editing_TerrainType==0 then
			trn.status=0
		elseif Terrains[editing_TerrainType].capturable then--据点样式以部队颜色为准
			trn.status=editing_Troop
		end
		battleField:setTerrain(x,y,trn)
		--对称性调整
		local length=battleField:getLength()
		local width=battleField:getWidth()
		local xx=length-1-x
		local yy=width-1-y
		if centralSymmetry then
			battleField:setTerrain(xx,yy,trn)
		end
		if leftRightSymmetry then
			battleField:setTerrain(xx,y,trn)
		end
		if upDownSymmetry then
			battleField:setTerrain(x,yy,trn)
		end
	end
end