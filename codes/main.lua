--主模块,主要放置一些公共的变量或者函数供其它模块使用
--方向常量
up=Point:new(0,1)
down=Point:new(0,-1)
left=Point:new(-1,0)
right=Point:new(1,0)

senario=Senario.senario--一个全局的剧情,剧情中有大量的数据,基本上全局变量都应该放在此处吧

--战况部分,用来记录各种战况数据
battleField = senario.battleField--战场由固定的长宽地形组成,每个地形都记录有地形编号和状态编号
--unitList = senario.unitList--作战单位列表,每个单位都有兵种,所属部队,坐标等东西
unitList = senario.battleField.chessPieces--作战单位列表,每个单位都有兵种,所属部队,坐标等东西

senario.isFogWar=true--是否开启雾的效果
visiblePoints = senario.visiblePoints--视野点，修改此处会直接影响到战场上的视野
movablePoints = senario.movablePoints--移动点，显示移动范围
movePath = senario.movePath
firablePoints = senario.firablePoints--攻击范围
dropablePoints = senario.firablePoints--卸载点

flarePoints={}--这个好像是闪光弹用的

troopList = {}--这是当前部队表,参与行动的部队都应该在这里
currentTroop=nil--当前行动的部队，指向troopList
currentViewer=nil--当前的观察着，因为有可能对方行动的时候，还是自己在观察
weatherName='Normal'

--控制部分
editingMode=false--是否处于编辑模式
selected={}--所选的部队
targeted={}--所选的目标

selectingUnit_toFire=nil
selectingPoint_toFlare=nil

selectingUnit_toDrop=nil--是否选择正在卸载的部队
selectingPoint_toDrop=nil--是否选择卸载坐标

selectingUnit_toLaunch=nil
selectingPoint_toLaunch=nil

selectingUnit_toRepair=nil

menuItems = senario.menuItems--这是菜单项，用来显示的

--处理地图坐标输入的函数
function cursorTouch(x,y)
	print('光标'..x..','..y)
	if editingMode then
		edit_xy(x,y)
		return
	end
	if not selected.unit then--如果没有选择单位
		selected=getTouchSelection(x,y)--获取选择到的所有信息
		if selected.unit then caculateMovement(selected) end--计算单位的移动范围
	else--选择了单位，那么下面应该是选择目标的处理方式
		if selectingUnit_toFire then
		elseif selectingPoint_toFlare then
			execute_Flare(x,y)
		elseif selectingPoint_toDrop then
			execute_Drop(x,y) selectingPoint_toDrop=nil
			caculateVision()--一卸载就刷新视野
			execute_Drop()--可以连续不断卸载
		elseif selectingPoint_toLaunch then
			execute_Launch(x,y)
		elseif selectingUnit_toRepair then
			execute_Repair(x,y)
		else
			targeted=getTouchSelection(x,y)
			local p=Point:new(x,y)
			local result=selectPath(p)
			if result==nil then--目标不可达，取消操作
				movablePoints:clear()
				movePath:clear()
				firablePoints:clear()
				selected={} targeted={}
			elseif result==false then--路径没有发生变化，应该弹出菜单
				showCorpMenu()
			end
		end
	end
end
--处理菜单输入的函数
function menuTouch(index)
	if senario.menuItems:constIteratorPos(index) then
		local command=senario.menuItems:constReferenceCurrent()
		--print('点击了第'..index..'个选项'..command)
		if selectingUnit_toDrop then
			selectedUnit_toDrop(index)
		elseif selectingUnit_toLaunch then
			selectedUnit_toLaunch(index)
		else executeCorpMenuCommand(index,command) end
	else
		senario.showingMenu=false
		selectingUnit_toDrop=nil
		selectingPoint_toDrop=nil
	end
end

function operateReset()--清除上个单位的行动结果
end
--根据坐标来获取所有相关的信息
--返回所选坐标的单位,地形,兵种等信息
function getTouchSelection(x,y)
	local select={}--所选内容
	local p=Point:new(x,y)
	select.coordinate=p--获取坐标
	select.terrain=Terrain:new()
	if not battleField:getTerrain(p,select.terrain) then select.terrain=nil
	else select.terrainKey,select.terrainAttrib = Terrains.find(select.terrain.terrainType) end--获取地形
	select.unit = unitList:findUnit_byCoordinate(x,y)--获取单位
	if select.unit ~= nil and select.unit.isVisible then
		select.corpKey,select.corp = Corps.find(select.unit.corpType)--获取兵种
		if select.corp then
			select.moveType=select.corp.move.moveType--获取移动类型
			select.troopKey,select.troop=findTroop_byUnit(select.unit)--获取所属的部队
			--获取所属部队的指挥官
		end
	end
	return select
end
function selectedUnitWillMove()
	if selected.coordinate.x~=targeted.coordinate.x
	or selected.coordinate.y~=targeted.coordinate.y
	then return true end
end
--通用模板,判断tab里面有没有value
function tableContain(tab,value)
	for k,v in ipairs(tab) do
		if v == value then return true end
	end
	return false
end
--使所有部队彼此进入敌对状态
function makeAllTroops_Enemies()
	local troopA,troopB=nil,nil
	for a,troopA in ipairs(troopList) do
		for b,troopB in ipairs(troopList) do
			if a~=b then--不同部队,彼此敌对
				--print(a..' vs '..b)
				table.insert(troopA.enemies,troopB.color)
			end
		end
	end
end


function findUnit_byCoordinate(x,y)
	local unit=unitList:referenceBegin()
	while not unitList:iteratorIsEnd() do
		if unit.coordinate.x==x and unit.coordinate.y==y then return unit end
		unit=unitList:referenceNext()
	end
end
function findUnit_byCoordinate_const(x,y)
	local unit=unitList:constReferenceBegin()
	while not unitList:constIteratorIsEnd() do
		if unit.coordinate.x==x and unit.coordinate.y==y then return unit end
		unit=unitList:constReferenceNext()
	end
end
--根据color寻找场上的部队
function findTroop_byColor(color)
	for key,troop in ipairs(troopList) do
		if troop.color==color then return key,troop end
	end
end
--根据unit寻找场上的部队
function findTroop_byUnit(unit)
	return findTroop_byColor(unit.color)
end
function treatMeAsFriend(myColor,yourColor)--yourColor是否把myColor当朋友
	local key,troop=findTroop_byColor(yourColor)
	if troop then return tableContain(troop.friends,myColor) end
end
function treatMeAsEnemy(myColor,yourColor)--yourColor是否把myColor当敌人
	local key,troop=findTroop_byColor(yourColor)
	if troop then return tableContain(troop.enemies,myColor) end
end