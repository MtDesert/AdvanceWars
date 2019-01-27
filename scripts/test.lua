--测试脚本专用
function senarioStart()
	battleField:loadFile('test.map')
	for key,corp in ipairs(Corps) do
		local unit=Corps.newUnit(corp.name,'Orange Star')
		local k=key-1
		unit.coordinate.x=k % 8
		unit.coordinate.y=k / 8
		unitList:push_back(unit)
	end
	for key,corp in ipairs(Corps) do
		local unit=Corps.newUnit(corp.name,'Blue Moon')
		local k=key-1
		unit.coordinate.x=k % 8 + 8
		unit.coordinate.y=k / 8
		unitList:push_back(unit)
	end
	table.insert(troopList,Troops.newTroop('Orange Star'))
	table.insert(troopList,Troops.newTroop('Blue Moon'))
	makeAllTroops_Enemies()
	table.insert(troopList,Troops.newTroop('Green Earth'))
	currentTroop = troopList[1]
	currentViewer = troopList[1]
	caculateVision()

	local unit=Corps.newUnit('Infantry','Orange Star')
	unit.coordinate.x=8 unit.coordinate.y=6
	unitList:push_back(unit)

	local unit=Corps.newUnit('Lander','Orange Star')
	unit.coordinate.x=6 unit.coordinate.y=6
	unitList:push_back(unit)

	print(_VERSION)
end

function afterUnitMoved()
end