function Scene_SpecialMotorcade()
	background=CCSprite:create("images/scripts/SpecialMotorcade.jpg")
	background:setPosition(screenCenter)
	background:runAction(CCFadeIn:create(1))
	layer:addChild(background)
	--扫描本地目录并且显示
	local items=
	{
		"第1集",
		"第2集",
		"第3集",
		"第4集",
		"第5集",
		"第6集",
		"第7集",
		"第8集"
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