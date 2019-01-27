function Scene_FC_Jackal()
	background=CCSprite:create("images/scripts/Jackal.jpg")
	background:setPosition(screenCenter)
	background:runAction(CCFadeIn:create(1))
	layer:addChild(background)
	--扫描本地目录并且显示
	local items=
	{
		"坦克杀手",
		"神秘雕像",
		"海上风暴",
		"峡谷空袭",
		"穿越荒野",
		"巨型兵器"
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