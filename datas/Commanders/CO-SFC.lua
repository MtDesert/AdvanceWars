Commanders=
{
--Super Famicom Wars
	{name="Yuan Delta",
	note="Orange Star专家指挥官,很有技术",
	d2d="比较平衡",
	copName="Defend!",
	copStar=3,
	copNote="防御+10%",
	scopName="Attack!",
	scopStar=3,
	scopNote="攻击+20%",
	author="Shikamaru & New CO"},

	{name="Rojenski",
	note="Blue Moon一个很普通的指挥官,但他经常犯大量的错,与Yuan是冤家,但也不是在任何场合都是",
	d2d="缺乏判断力(幸运损伤-10%~10%)",
	copName="",
	copStar=1,
	copNote="幸运损伤-20%~20%",
	scopName="Death Squads",
	scopStar=1,
	scopNote="幸运损伤-30%~30%",
	author="Shikamaru & New CO"},

	{name="Fon Rosso",
	note="Green Earth喜欢攻击的CO,全力投入战斗并试图突破对手,然而不擅长防御",
	d2d="侧重攻击和冲刺(攻击+10%,防御-10%)",
	copName="Assualt!",
	copStar=3,
	copNote="攻击+20%",
	scopName="Rush!",
	scopStar=3,
	scopNote="攻击+30%,防御-20%,移动+1",
	author="Shikamaru & New CO"},

	{name="Helter",
	note="YellowComet的CO,'要站在人民的立场上'是他的座右铭,会防御好他的部队,但他的攻击战术比较薄弱",
	d2d="侧重用炮灰防御(攻击-10%,防御+10%)",
	copName="Defend!",
	copStar=1,
	copNote="防御+20%",
	scopName="Guard!",
	scopStar=1,
	scopNote="防御+30%,移动-1",
	author="Shikamaru & New CO"},

	{name="Mr.山本",
	note="传说中的将军，指挥着精英部队",
	d2d="所有部队出场LV2",
	copName="Level Up!",
	copStar=5,
	copNote="所有部队升级到LV3",
	scopName="Elite!",
	scopStar=5,
	scopNote="所有部队攻击+40%",
	author="Shikamaru & New CO"},

	{name="Billy Gates",
	note="有个土豪爹,有足够的战争基金,喜欢玩战争游戏",
	d2d="每日可额外获得10000资金",
	copName="Local tyrants",
	copStar=4,
	copNote="据点上的自军部队HP全恢复(消耗资金)",
	scopName="Power Of Money!",
	scopStar=4,
	scopNote="当前资金每200使攻击+1%,且不能生产任何部队,结束回合的时候资金变为0",
	author="Shikamaru & New CO"},

	{name="Caroline",
	note="攻击的时候会产生不明原因的高强度输出.她的昵称是'幸运女孩'",
	d2d="幸运损伤0%~40%",
	copName="Lucky Girl",
	copStar=4,
	copNote="幸运损伤20%~40%",
	scopName="Lucky Godness",
	scopStar=4,
	scopNote="幸运损伤20%~80%",
	author="Shikamaru & New CO"},
	--搜索方法
	find = function(para)
		local tp = type(para)
		for key,val in ipairs(Commanders) do
			if tp=='number' and key == para then return key,val end
			if tp=='string' and val.name == para then return key,val end
		end
	end,
}
