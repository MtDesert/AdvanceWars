require("scripts/PurpleSunset/main")
require("scripts/ShookBelta/main")
require("scripts/SpecialMotorcade/main")
require("scripts/FC_Contra/main")
require("scripts/FC_Jackal/main")

function Scene_ScriptMenu()
	background=CCSprite:create("images/MainMenu.png")
	background:setPosition(CCPoint(point.x+size.width/2,point.y+size.height/2));
	background:runAction(CCFadeIn:create(1))
	layer:addChild(background)
	CCDirector:sharedDirector():runWithScene(scene)
	--显示剧本列表
	local items=
	{
		{name="Purple Sunset",fun=Scene_PurpleSunset},
		{name="Shook & Belta",fun=Scene_ShookBelta},
		{name="Special Motorcade",fun=Scene_SpecialMotorcade},
		{name="FC_Contra",fun=Scene_FC_Contra},
		{name="FC_Jackal",fun=Scene_FC_Jackal}
		--{name="YYCO",fun=Scene_YYCO}
	}
	local itemsCount=table.getn(items)
	local function itemTouch(tag)
		--启动别的脚本
		layer:removeAllChildrenWithCleanup(true)
		items[tag].fun()
		--添加返回按钮
		local label = CCLabelTTF:create("Back","System",textSize)
	        label:setAnchorPoint(ccp(1,0))
		label:setPosition(ccp(size.width,0))
		layer:addChild(label)
		function onBackTouch(eventType,x,y)
			if eventType == "began" and label:boundingBox():containsPoint(ccp(x,y)) then
				print('back')
				layer:removeAllChildrenWithCleanup(true)
				Scene_ScriptMenu()
			end
		end
		layer:registerScriptTouchHandler(onBackTouch)
		layer:setTouchEnabled(true)
	end
	local menu=CCMenu:create()
	local menuHeight=itemsCount*textSize
	menu:setPosition(ccp(point.x+size.width/2,point.y+size.height/2-menuHeight/2))
	for i=1,itemsCount,1 do
	        local label = CCLabelTTF:create(items[i].name,"System",textSize)
	        local item = CCMenuItemLabel:create(label)
		item:registerScriptTapHandler(itemTouch)
		item:setPosition(ccp(0,menuHeight-(i-0.5)*textSize))
		menu:addChild(item,i,i)
	end
	layer:addChild(menu)
end