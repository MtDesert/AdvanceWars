--地形建造规则
local buildTerrain={
	Plain="AirPort",
	Shoal="ShipPort"
}

function getBuildTerrain(terrain)
	return buildTerrain[terrain]
end