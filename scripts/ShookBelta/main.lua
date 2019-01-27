function Scene_ShookBelta()
	background=CCSprite:create("images/scripts/ShookBelta.jpg")
	background:setPosition(screenCenter)
	background:runAction(CCFadeIn:create(1))
	layer:addChild(background)
	--扫描本地目录并且显示
	local items=
	{
		"不打不相识",--AntiAir & Copter VS Stealth
		"Cris王国的真相",--Tank & Copter VS Infantry
		"路见不平",--Copter VS Duster & Fighter
		"出师不利",--Tank & Infantry VS Mech
		"保卫机场",--Copter & Infantry VS Infantry
		"空中伏击",--TransportPlane VS Duster VS Stealth
		"秘密武器",--Radar & Copter & FighterBomber VS FighterBomber
		"天地双枪"--AntiAir & Plane VS Plane
	}
	local menu=CCMenu:create()
	local itemsCount=table.getn(items)
	local menuHeight=itemsCount*textSize
	menu:setPosition(ccp(point.x+size.width/2,point.y+size.height/2-menuHeight/2))
	menu:setContentSize(CCSizeMake(200,menuHeight))
	for i=1,itemsCount,1 do
		print(i..' '..items[i])
	        local label = CCLabelTTF:create(items[i],"System",textSize)
	        local item = CCMenuItemLabel:create(label)
		--item:registerScriptTapHandler(itemTouch)
		item:setPosition(ccp(0,menuHeight-(i-0.5)*textSize))
		menu:addChild(item,i,i)
	end
	layer:addChild(menu)
end