--[[这是天气模块
天气的主要影响
下雨:视野-1,进入雾战,视野=1
下雪:移动损耗加倍,移动-1
风沙:最大射程-1,攻击-30%
]]
Weathers={
	{name="Normal",note="正常天气"},--
	{name="Rainy",isRainy=true,note="雨天"},
	{name="RainStorm",isRainy=true,isStorm=true,note="暴雨"},
	{name="Snowy",isSnowy=true,note="雪天"},
	{name="Blizzard",isSnowy=true,isStorm=true,note="暴雪"},
	{name="Sandy",isSandy=true,note="沙天"},
	{name="SandStorm",isSandy=true,isStorm=true,note="沙尘暴"},
	--主要方法
	find = function(para)--通过para查找地形,para可以是序数,也可以是地形的名字
		local tp = type(para)
		for key,val in ipairs(Weathers) do
			if tp=='number' and key == para then return key,val end
			if tp=='string' and val.name == para then return key,val end
		end
	end
}
