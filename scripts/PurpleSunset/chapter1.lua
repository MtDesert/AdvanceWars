function senarioStart()
	print("紫日章节1")
	battleField:loadFile('PurpleSunset/PurpleSunset1.map')
	--鬼子的部队(预设)
	print("正在部署鬼子的反坦克炮")
	local jpn_AntiTank=makeUnit('AntiTank','Yellow Comet')
	jpn_AntiTank.coordinate.x=20
	for y=0,9 do
		jpn_AntiTank.coordinate.y=y
		unitList:push_back(jpn_AntiTank)
	end
	print("正在部署鬼子的机械兵")
	local jpn_Mech=makeUnit('Mech','Yellow Comet')
	for x=21,23 do
		jpn_Mech.coordinate.x=x
		for y=0,9 do
			jpn_Mech.coordinate.y=y
			unitList:push_back(jpn_Mech)
		end
	end
	print("正在部署鬼子的打飞机炮")
	local jpn_AntiAir=makeUnit('AntiAir','Yellow Comet')
	jpn_AntiAir.coordinate.x=24
	for y=0,9 do
		jpn_AntiAir.coordinate.y=y
		unitList:push_back(jpn_AntiAir)
	end

	local jpn_Inf=makeUnit('Infantry','Yellow Comet')
	jpn_Inf.coordinate.x=6
	for y=0,9,2 do
		jpn_Inf.coordinate.y=y
		unitList:push_back(jpn_Inf)
	end
	--鬼子请求支援
	--[[showSay()
	say("images/scripts/PurpleSunset/guizi.png","鬼子","大家好，俺是日本鬼子")
	say("images/scripts/PurpleSunset/guizi.png","鬼子","Enemies are approaching, require aid")
	hideSay()]]
	--waitKeyPress()

	--苏维埃部队开始逼近(本来想在这里做进场动画的)
	--坦克部队入场
	local soviet_Tank=makeUnit("Tank","Orange Star")
	for x=2,4 do
		soviet_Tank.coordinate.x=x
		for y=0,9 do
			soviet_Tank.coordinate.y=y
			unitList:push_back(soviet_Tank)
		end
	end
	--坦克部队全部就位后，飞机部队入场
	local soviet_Duster=makeUnit("Duster","Orange Star")
	for x=0,1 do
		soviet_Duster.coordinate.x=x
		for y=0,9 do
			soviet_Duster.coordinate.y=y
			unitList:push_back(soviet_Duster)
		end
	end
	local soviet_Duster=makeUnit("Infantry","Orange Star")
	for x=5,5 do
		soviet_Duster.coordinate.x=x
		for y=0,9 do
			soviet_Duster.coordinate.y=y
			unitList:push_back(soviet_Duster)
		end
	end
	table.insert(troopList,makeTroop("Orange Star"))
	table.insert(troopList,makeTroop("Yellow Comet"))
	makeAllTroops_Enemies()--进入敌对状态
	--雾战
	senario.isFogWar=true
	currentTroop=troopList[1]
	currentViewer=troopList[1]
	caculateVision()
	--[[showSay()
	say("images/Commanders/Lex.png","New CO","I am New CO")
	hideSay()]]
	--下面开始把操作权交给玩家
end

function afterUnitMoved()
end