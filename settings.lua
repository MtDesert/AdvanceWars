--语言文件
language="chinese"

--兵种资料
CorpFilenames={
	"datas/Corps/Corps-DIY.lua"
}

--部队资料
TroopFilenames={
	"datas/Troops/Troops-AWDS.lua",
	"datas/Troops/Troops-AWDOR.lua",
	"datas/Troops/Troops-AWBW.lua",
}

--CO资料
CommanderFilenames={
	"datas/Commanders/CO-AW1.lua",
	"datas/Commanders/CO-AW2.lua",
	"datas/Commanders/CO-AWDS.lua",
	"datas/Commanders/CO-AWDOR.lua",
	"datas/Commanders/CO-SFC.lua",
	"datas/Commanders/CO-DIY.lua"
}

--地形资料
TerrainFilenames={
	"datas/Terrains/Terrains-DIY.lua"
}

--纹理加载路径
imagesPath={
	Corps="images/Corps",
	Troops="images/Troops",
	CommandersHeads="images/Commanders/Head",
	CommandersBodies="images/Commanders/Body"
}

senarioScriptsPath="scripts"
mapsPath="maps/awbw"

--用于支持文件打开界面的操作
defaultPath={
	Corps={title="兵种数据",path="datas/Corps"},
	Commanders={title="指挥官数据",path="datas/Commanders"},
	Troops={title="部队数据",path="datas/Troops"},
	Terrains={title="地形数据",path="datas/Terrains"},
	Weathers={title="天气数据",path="datas/Weathers"},
	Senarios={title="剧本数据",path="scripts"},
}
