local dir='scripts/PurpleSunset/'

function Scene_PurpleSunset()
	background=CCSprite:create("images/scripts/PurpleSunset.jpg")
	background:setPosition(screenCenter)
	background:runAction(CCFadeIn:create(1))
	layer:addChild(background)
	--扫描本地目录并且显示
	local items=
	{
		{name="解救作战",file='chapter1'},
		{name="误入歧途",file='chapter2'},
		{name="神风来袭",file='chapter3'},
		{name="紫色之日",file='chapter4'}
	}
	local menu=CCMenu:create()
	local itemsCount=table.getn(items)
	local menuHeight=itemsCount*textSize
	menu:setPosition(ccp(point.x+size.width/2,point.y+size.height/2-menuHeight/2))
	menu:setContentSize(CCSizeMake(200,menuHeight))
	--触摸的时候进入剧情地图
	local function itemTouch(tag)
		layer:removeAllChildrenWithCleanup(true)
		executeGameLuaScript('scripts/PurpleSunset/'..items[tag].file..'.lua')
		--CCDirector:sharedDirector():runWithScene()
		--items[tag].fun()
	end
	for i=1,itemsCount,1 do
		print(i..' '..items[i].name)
	        local label = CCLabelTTF:create(items[i].name,"System",textSize)
	        local item = CCMenuItemLabel:create(label)
		item:registerScriptTapHandler(itemTouch)
		item:setPosition(ccp(0,menuHeight-(i-0.5)*textSize))
		menu:addChild(item,i,i)
	end
	layer:addChild(menu)
end