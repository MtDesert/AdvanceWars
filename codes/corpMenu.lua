--这个模块主要判定能否弹出哪些菜单项的

local firableUnits={}
local dropableUnits={}--与卸载指令有关
local suppliableUnits={}--与补给指令有关
local repairableUnits={}--与修复指令有关

function showCorpMenu()--显示兵种的菜单
	menuItems:clear()
	--添加各个菜单项
	if not showMenuItem_Join() and not showMenuItem_Load() then--要么Join要么Load,否则执行其它指令
		showMenuItem_Fire()
		showMenuItem_Capture()
		showMenuItem_Drop()
		showMenuItem_Supply()
		showMenuItem_Build()
		showMenuItem_Flare()
		showMenuItem_Hide()
		showMenuItem_Appear()
		showMenuItem_Dive()
		showMenuItem_Rise()
		showMenuItem_Launch()
		showMenuItem_Repair()
		showMenuItem_Explode()
		showMenuItem_Wait()
	end
	--添加完毕
	local itemCount = menuItems:size()
	if itemCount > 0 then senario.showingMenu=true end
	return itemCount
end
--'开火'指令
function showMenuItem_Fire()
	print('检测可攻击目标')
	if not selected.corp.weapons then return end--要有带武器(废话)
	--扫描攻击范围内的所有敌人
	firableUnits={}
	local enemy = unitList:referenceBegin()
	while not unitList:iteratorIsEnd() do
		if selected.troop and tableContain(selected.troop.enemies,enemy.color) and enemy.isVisible then--敌人必须看得见
			--武器必须能攻击对应兵种
			local weapon,damage=nil,nil
			local enemyCorpKey,enemyCorp=Corps.find(enemy.corpType)
			for k,wpn in ipairs(selected.corp.weapons) do--扫描武器列表
				if not wpn.ammunitionMax or (wpn.ammunitionMax and selected.unit.ammunition>0) then--无弹药上限,或者有残余弹药,是可以攻击的
					damage=Corps.baseDamage(selected.corp,k,enemyCorp)
				end
				if damage then weapon=wpn break end
			end
			if damage then--武器能攻击的情况下要检查射程
				local distance=(targeted.coordinate - enemy.coordinate):manhattanLength()
				local canFire=false
				if weapon.minRange==1 and weapon.maxRange==1 and distance==1 then canFire=true--近战的必须贴身攻击
				elseif weapon.minRange <= distance and distance <= weapon.maxRange and (not selectedUnitWillMove()) then canFire=true end--远程攻击的必须在射程内,并且没有移动过(但是似乎有例外)
				if canFire then
					table.insert(firableUnits,enemy)
					local xy=enemy.coordinate
					print(xy.x..','..xy.y..':'..enemyCorp.name..' damage='..damage)
				end
			end
		end
		enemy = unitList:referenceNext()
	end
	if table.maxn(firableUnits)>0 then menuItems:push_back('Fire') end
end
--'占领'指令
function showMenuItem_Capture()
	if not selected.corp.capturable then return end--兵种要具有占领能力
	if not targeted.terrainAttrib.capturable then return end--目标地形必须是可占领的据点
	if not selected.troop then return end--自军必须在行动部队表中
	if selected.unit.color == targeted.terrain.status then return end--自己不能占领自己
	if tableContain(selected.troop.friends,targeted.terrain.status) then return end--自己不能占领友军的据点
	if not tableContain(selected.troop.enemies,targeted.terrain.status) then--如果是非敌对势力的话....
		for k,v in ipairs(troopList) do
			if v.color == targeted.terrain.status then return end--只要不在行动列表中就可以占领
		end
	end
	menuItems:push_back('Capture')
end
--'合并'指令
function showMenuItem_Join()
	if selected.corp ~= targeted.corp then return end--兵种相同才能结合
	if selected.troop ~= targeted.troop then return end--同一支部队的才能结合
	if selected.unit == targeted.unit then return end--不能自己与自己结合
	if targeted.unit:presentHP() >= 10 then return end--被结合方的表现hp要小于10
	menuItems:push_back('Join') return true
end
--'装载'指令
function showMenuItem_Load()
	local loader,beLoader = targeted,selected--装载者和被装载者(只是为了好区分)
	if not loader.corp or not beLoader.corp then return end--没载体,不显示这个指令
	local lName,blName = loader.corp.name,beLoader.corp.name
	local loadList=
	{
		['TransportTruck']={{},{'Infantry','Mech'}},
		['APC']={{'Infantry','Mech'}},
		['TransportCopter']={{'Infantry','Mech'}},
		['TransportPlane']={{},{'Infantry','Mech','MotorBike'}},
		['Cruiser']={{},{'TransportCorter','BattleCopter','AntiSubCopter'}},
		['Carrier']={{},Corps.findNames_byCorpType('AirForce')},
		['GunBoat']={{'Infantry','Mech'}},
		['Lander']={{},Corps.findNames_byCorpType('LandForce')},
		['BlackBoat']={{'MotorBike'},{'Infantry','Mech'}}
	}
	--先计算理论上能载多少个单位
	local amount=nil
	if loadList[lName] == nil then return end
	for k,v in ipairs(loadList[lName]) do
		if tableContain(v,blName) then amount=k break end
	end
	if amount == nil then return end
	--再判断实际上能载多少个单位
	if loader.unit.loadedUnits:size() >= amount then return end
	--这里应该特殊处理一下TransportPlane
	menuItems:push_back('Load') return true
end

--关于卸载
function checkDropable()
	--首先,查看自己有没有部队可以卸载
	local loadedUnits=selected.unit.loadedUnits
	local terrain=Terrain:new()
	dropableUnits={}
	--开始扫描所有搭载的单位
	local unit = loadedUnits:referenceBegin()
	while not loadedUnits:iteratorIsEnd() do
		unit.upable=nil unit.downable=nil unit.leftable=nil unit.rightable=nil
		local corpKey,corp=Corps.find(unit.corpType)
		--此函数用来判断被搭载的单位能否停留在p点上
		local function canStayAt(p,checkBarrier)
			if not battleField:getTerrain(p,terrain) then return end--地图范围内
			if not movementCost(corp.move.moveType,terrain,weatherName) then return end--被卸载的兵种必须能行走于该地形上
			if checkBarrier then
				local barrier=unitList:constReferenceBegin()--被卸载的地方不能有单位占据着
				while not unitList:constIteratorIsEnd() do
					local xy=barrier.coordinate
					if xy.x==p.x and xy.y==p.y and barrier.isVisible then return false end--有障碍
					barrier = unitList:constReferenceNext()
				end
			end
			return true
		end
		--首先,检测部队能不能在目的地上移动
		if canStayAt(targeted.coordinate) then
			local u=targeted.coordinate + up if canStayAt(u,true) then unit.upable = u end
			local d=targeted.coordinate + down if canStayAt(d,true) then unit.downable = d end
			local l=targeted.coordinate + left if canStayAt(l,true) then unit.leftable = l end
			local r=targeted.coordinate + right if canStayAt(r,true) then unit.rightable = r end
			if unit.upable or unit.downable or unit.leftable or unit.rightable then
				table.insert(dropableUnits,unit)
			end
		end
		unit=loadedUnits:referenceNext()
	end
end
--'卸载'指令
function showMenuItem_Drop()
	checkDropable()--先进行扫描
	if table.maxn(dropableUnits) > 0 then menuItems:push_back('Drop') end
end

--'补给'指令
function showMenuItem_Supply()
	suppliableUnits={}
	if not selected.corp.suppliable then return end--必须具有补给功能
	local unit=unitList:constReferenceBegin()
	while not unitList:constIteratorIsEnd() do
		if (targeted.coordinate - unit.coordinate):manhattanLength()==1 and selected.unit ~= unit then--首先必须位置相邻,且不是自己
			if selected.troop.color==unit.color or tableContain(selected.troop.friends,unit.color) then--必须是自军或者友军
				table.insert(suppliableUnits,unit)
			end
		end
		unit = unitList:constReferenceNext()
	end
	if table.maxn(suppliableUnits)>0 then menuItems:push_back('Supply') end
end
--'建造'指令
function showMenuItem_Build()
	if not selected.corp.buildable then return end
	if selected.corp.name=='APC' then
		local canBuild={'WasteLand','Plain','Shoal'}--可建筑的地点
		if not tableContain(canBuild,targeted.terrainAttrib.name) then return end
		if selected.unit.ammunition<=0 then return end--有材料
	end
	menuItems:push_back('Build')
end
--'闪光'指令
function showMenuItem_Flare()
	if not selected.corp.flarable then return end
	if selectedUnitWillMove() then return end--发射时候不能移动
	if selected.unit.ammunition <=0 then return end--没弹药不能发射
	menuItems:push_back('Flare')
end
--'隐藏'指令
function showMenuItem_Hide()
	if not selected.corp.hidable then return end
	if selected.unit.isHide then return end
	menuItems:push_back('Hide')
end
--'出现'指令
function showMenuItem_Appear()
	if not selected.corp.hidable then return end
	if not selected.unit.isHide then return end
	menuItems:push_back('Appear')
end
--'潜水'指令
function showMenuItem_Dive()
	if not selected.corp.divable then return end
	if selected.unit.isHide then return end
	menuItems:push_back('Dive')
end
--'升起'指令
function showMenuItem_Rise()
	if not selected.corp.divable then return end
	if not selected.unit.isHide then return end
	menuItems:push_back('Rise')
end
--'发射'指令
function showMenuItem_Launch()
	if selected.corp.capturable then--主要是占领系的兵种可以发射火箭
		if targeted.terrainAttrib.name ~= 'Silo' then return end
		menuItems:push_back('Launch')
	end
end
--'修理'指令
function showMenuItem_Repair()
	if not selected.corp.repairable then return end
	repairableUnits={}
	local unit=unitList:constReferenceBegin()
	while not unitList:constIteratorIsEnd() do
		if (targeted.coordinate - unit.coordinate):manhattanLength()==1 and selected.unit ~= unit then--首先必须位置相邻,且不是自己
			if selected.troop.color==unit.color or tableContain(selected.troop.friends,unit.color) then--必须是自军或者友军
				table.insert(repairableUnits,unit)
			end
		end
		unit = unitList:constReferenceNext()
	end
	if table.maxn(repairableUnits)>0 then menuItems:push_back('Repair') end
end
--'爆炸'指令
function showMenuItem_Explode()
	if not selected.corp.explodable then return end
	menuItems:push_back('Explode')
end
--'待命'指令
function showMenuItem_Wait()
	menuItems:push_back('Wait')
end

--执行兵种命令
--idx命令序号,从0开始
--cmd命令正文
function executeCorpMenuCommand(idx,cmd)
	if cmd == 'Fire' then execute_Fire() return--需要选择攻击目标
	elseif cmd == 'Drop' then execute_Drop() return--需要选择单位和卸载点
	elseif cmd == 'Flare' then execute_Flare() return--需要选择闪光点
	elseif cmd == 'Launch' then execute_Launch() return--需要选择发射目标
	elseif cmd == 'Repair' then execute_Repair() return--需要选择修理目标
	end
	--以上指令的需要一些额外信息,但是以下指令则不需要
	if moveWithPath() then--没有发生碰撞的情况下,才执行指令
		if cmd == 'Capture' then execute_Capture()
		elseif cmd == 'Join' then execute_Join()
		elseif cmd == 'Load' then execute_Load()
		elseif cmd == 'Supply' then execute_Supply()
		elseif cmd == 'Build' then execute_Build()
		elseif cmd == 'Hide' then execute_Hide()
		elseif cmd == 'Appear' then execute_Appear()
		elseif cmd == 'Dive' then execute_Dive()
		elseif cmd == 'Rise' then execute_Rise()
		elseif cmd == 'Explode' then execute_Explode()
		elseif cmd == 'Wait' then execute_Wait()
		end
	end
	--清理一些结果
	movablePoints:clear()
	movePath:clear()
	firablePoints:clear()
	senario.showingMenu=false
	selected={} targeted={}
	--刷新一些数据
	caculateVision()
end
function selectedUnit_toDrop(idx)
	print('请选择卸载点')
	local unit = dropableUnits[idx+1]
	selectingUnit_toDrop=unit
	selectingPoint_toDrop=true

	dropablePoints:clear()
	if unit.upable then dropablePoints:push_back(unit.upable) end
	if unit.downable then dropablePoints:push_back(unit.downable) end
	if unit.leftable then dropablePoints:push_back(unit.leftable) end
	if unit.rightable then dropablePoints:push_back(unit.rightable) end
	senario.showingMenu=false
end
function selectedUnit_toLanuch(idx)
end

function execute_Fire(targetUnit)
end--需要损伤模块来实现
function execute_Capture()
	print('开始占领!')
	local unit=selected.unit
	if not (movePath:front()==movePath:back()) then unit.progressValue=0 end
	unit.progressValue = unit.progressValue + unit:presentHP()
	if unit.progressValue>=20 then--当占领完成的时候
		unit.progressValue=0
		--据点被占领了
		if targeted.terrainAttrib.capturable then
			targeted.terrain.status = unit.color
			battleField:setTerrain(targeted.coordinate,targeted.terrain)
			--statisticsTroopData();刷新统计数据()
		end
	end
end
function execute_Join()
	print('开始汇合!')
	--累加计算
	local presentHP = selected.unit:presentHP() + targeted.unit:presentHP()
	local factHP = selected.unit.healthPower + targeted.unit.healthPower
	targeted.unit.fuel = targeted.unit.fuel + selected.unit.fuel--累加燃料
	if targeted.unit.fuel > target.corp.move.gasMax then targeted.unit.fuel = target.corp.move.gasMax end--燃料不超过上限
	if targeted.corp.weapons then
		for k,wpn in ipairs(targeted.corp.weapons) do
			if wpn.ammunitionMax then--武器有弹药上限,计算吧
				targeted.unit.ammunition = targeted.unit.ammunition + selected.unit.ammunition--累加弹药
				if targeted.unit.ammunition > wpn.ammunitionMax then targeted.unit.fuel = wpn.ammunitionMax end--弹药不超过上限
				break
			end
		end
	end
	if presentHP>10 then
		local pastHP=presentHP-10--多出来的表现HP
		presentHP=10
		selected.troop.funds = selected.troop.funds + selected.corp.price * pastHP / 10--我们应该转换成价值
	end
	--调整一下精确的hp
	if presentHP * 10 < factHP then factHP = presentHP*10--不超过上限
	elseif presentHP * 10 > factHP then factHP = (presentHP-1)*10+1 end--不低于下限
	targeted.unit.healthPower = factHP
	unitList:remove(selected.unit)--要删除掉selected.unit,以targeted.unit的状态为准
end
function execute_Load()
	print('搭载中')
	targeted.unit.loadedUnits:push_back(selected.unit)
	unitList:remove(selected.unit)
end
function execute_Drop(x,y)
	if x and y then--这是执行卸载的功能的
		local p=Point:new(x,y)
		if dropablePoints:contain(p) then
			if moveWithPath() then
				--开始卸载
				print('开始卸载')
				local unit=selectingUnit_toDrop
				selected.unit.loadedUnits:remove(unit)
				unit.coordinate=Point:new(x,y)
				unit.isWait=true--卸载后默认是待机的
				unitList:push_back(unit)
			end
		else--取消卸载
		end
		--一点收尾工作
		movablePoints:clear()
		movePath:clear()
		firablePoints:clear()
		dropablePoints:clear()
		selectingUnit_toDrop=nil
		selectingPoint_toDrop=nil
	else--这只是判断是否需要卸载的
		checkDropable()
		menuItems:clear()
		for k,unit in ipairs(dropableUnits) do
			local corpKey,corp=Corps.find(unit.corpType)
			menuItems:push_back(corp.name)
		end
		if table.maxn(dropableUnits) > 0 then
			senario.showingMenu=true
			senario.menuChanged=true--设置为true可以让菜单刷新
			selectingUnit_toDrop=true
			print('请选择要卸载的单位')
			return true
		else selected={} targeted={} end
	end
end
function execute_Supply(unit)
	if unit then
		local corpKey,corp=Corps.find(unit.corpType)
		if corp then
			unit.fuel=corp.move.gasMax--补给燃料
			if corp.weapons then--补给弹药(如果有武器的话)
				for k,wpn in ipairs(corp.weapons) do
					if wpn.ammunitionMax then
						unit.ammunition=wpn.ammunitionMax break
					end
				end
			elseif corp.ammunitionMax then
				unit.ammunition=corp.ammunitionMax
			end
		end
	else
		print('执行补给')
		for k,unit in ipairs(suppliableUnits) do
			execute_Supply(unit)
		end
	end
end
function execute_Build()
	print('开始建造!')
	local unit=selected.unit
	if not (movePath:front()==movePath:back()) then unit.progressValue=0 end
	unit.progressValue = unit.progressValue + unit:presentHP()
	if unit.progressValue>=20 then--当建造完成的时候
		unit.progressValue=0
		unit.ammunition = unit.ammunition-1
		if targeted.terrainAttrib.name=='WasteLand' or targeted.terrainAttrib.name=='Plain' then
			targeted.terrain.terrainType=Terrains.find('AirPort')
		elseif targeted.terrainAttrib.name=='Shoal' then
			targeted.terrain.terrainType=Terrains.find('ShipPort')
		end
		targeted.terrain.status = unit.color
		battleField:setTerrain(targeted.coordinate,targeted.terrain)
		--statisticsTroopData();刷新统计数据()
	end
end
function execute_Flare(x,y)
	if x and y then
		selectingPoint_toFlare=nil
		if firablePoints:contain(Point:new(x,y)) then
			print('发射照明弹!!!')
			selected.unit.ammunition=selected.unit.ammunition-1
			firablePoints:clear()
			movePath:clear()
			table.insert(flarePoints,Point:new(x,y))
			caculateVision()
		end
		selected={} targeted={}
	else
		print('请选择需要照明的范围')
		senario.showingMenu=false
		movablePoints:clear()
		caculateFlightshot_byCenter(selected.coordinate,3,5)
		selectingPoint_toFlare=true
	end
end
function execute_Hide()
	print('进入隐形模式')
	selected.unit.isHide=true
end
function execute_Appear()
	print('退出隐形模式')
	selected.unit.isHide=false
end
function execute_Dive()
	print('开始潜水')
	selected.unit.isHide=true
end
function execute_Rise()
	print('开始上浮')
	selected.unit.isHide=false
end
function execute_Launch(x,y)
	if x and y then
		if targeted.coordinate.x==x and targeted.coordinate.y==y then--确认目标,炸
			print('开始发射')
			selectingPoint_toLaunch=nil
			--变成空的发射台
			local terrain=Terrain:new()
			if battleField:getTerrain(selected.coordinate,terrain) then
				local src,srcAttrib=Terrains.find(terrain.terrainType)
				if srcAttrib.name=='Silo' then--判断原地形
					local dst,dstAttrib=Terrains.find('Silo_Empty')
					if dst then--改变地形
						terrain.terrainType=dst
						battleField:setTerrain(selected.coordinate,terrain)
					end
				end
			end
			--炸炸炸
			local unit = unitList:referenceBegin()
			while not unitList:iteratorIsEnd() do
				if(targeted.coordinate - unit.coordinate):manhattanLength()<=2 then--只要在爆炸范围内,就会被波及
					if unit.healthPower > 30 then unit.healthPower = unit.healthPower - 30--被炸的话,表现hp会减去3
					else unit.healthPower = 1 end--最低为1
				end
				unit = unitList:referenceNext()
			end
			firablePoints:clear()
			caculateVision()
			selected={} targeted={}
		else--重新选择目标
			print('选择目标'..x..','..y)
			targeted.coordinate=Point:new(x,y)
			caculateFlightshot_byCenter(targeted.coordinate,1,2)
			firablePoints:push_back(targeted.coordinate)
		end
	else
		senario.showingMenu=false
		if moveWithPath() then
			print('准备发射')
			movablePoints:clear()
			movePath:clear()
			caculateVision()
			selected=getTouchSelection(targeted.coordinate.x,targeted.coordinate.y)

			selectingPoint_toLaunch=true
			caculateFlightshot_byCenter(targeted.coordinate,1,2)
			firablePoints:push_back(targeted.coordinate)
		end
	end
end
function execute_Repair(x,y)
	if x and y then
		selectingUnit_toRepair=nil
		if dropablePoints:contain(Point:new(x,y)) then
			print('开始修理')
			for k,unit in ipairs(repairableUnits) do
				if unit.coordinate.x==x and unit.coordinate.y==y then
					execute_Supply(unit)
					selected.troop:repairUnit(unit)
					--execute_Repair--修理部分,是不是要交给部队来做
				end
			end
		end
		dropablePoints:clear()
		selected={} targeted={}
	else
		senario.showingMenu=false
		if moveWithPath() then
			movablePoints:clear()
			movePath:clear()
			caculateVision()
			print('请选择要修理的单位')
			selectingUnit_toRepair=true
			dropablePoints:clear()--暂时借用一下dropablePoints,绘制4个方向的点
			for k,unit in ipairs(repairableUnits) do
				dropablePoints:push_back(unit.coordinate)
			end
		end
	end
end
function execute_Explode()
	print('爆炸了!!!!')
	local unit = unitList:referenceBegin()
	while not unitList:iteratorIsEnd() do
		if(selected.unit.coordinate - unit.coordinate):manhattanLength()<=3 then--只要在爆炸范围内,就会被波及
			if unit.healthPower > 50 then unit.healthPower = unit.healthPower - 50--被炸的话,表现hp会减去5
			else unit.healthPower = 1 end--最低为1
		end
		unit = unitList:referenceNext()
	end
	unitList:remove(selected.unit)--自爆了
	return true
end
function execute_Wait()
	selected.unit.isWait=true
end