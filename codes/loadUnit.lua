--[[所有可装载的部队,结构如下
	装载者名称={vol=容量,loadableCorps={兵种A=重量A,兵种B=重量B,...}},
	装载者名称={vol=容量,loadableCorpType={兵种类型A=重量A,兵种类型B=重量B,...}},
]]
local allLoader={
	APC={vol=1,loadableCorps={Infantry=1,Mech=1}},
	TransportTruck={vol=2,loadableCorps={Infantry=1,Mech=1}},
	TransportCopter={vol=1,loadableCorps={Infantry=1,Mech=1}},
	TransportPlane={vol=2,loadableCorpType={LandForce=1}},
	Lander={vol=2,loadableCorpType={LandForce=1}},
	BlackBoat={vol=2,loadableCorps={Infantry=1,Mech=1}},
	GunBoat={vol=1,loadableCorps={Infantry=1,Mech=1}},
	Cruiser={vol=2,loadableCorps={TransportCorter=1,BattleCopter=1,AntiSubCopter=1}},
	Carrier={vol=2,loadableCorpType={AirForce=1}},
}
--获取载体的容积
function volumnOfLoader(loaderName)
	local loader = allLoader[loaderName]
	if loader then
		return loader.vol
	end
	return nil
end
--单位的重量(载体名,被载体名,被载体类型)
function unitWeight(loaderName,beLoaderName,beLoaderCorpType)
	--获取载体
	local loader = allLoader[loaderName]
	if not loader then return end
	--检查能否装被载体
	local weight
	if loader.loadableCorps then--检查名字
		weight = loader.loadableCorps[beLoaderName]
	end
	if not weight and loader.loadableCorpType then--名字不符合,还可以比对类型
		weight = loader.loadableCorpType[beLoaderName]
	end
	return weight
end