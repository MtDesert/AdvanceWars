--指挥官相关的能力描述

--单位过滤条件,请判断corp变量
function DirectAttack()--直接攻击系
	if corp.weapons then
		for k,v in ipairs(corp.weapons) do
			--取武器数据
			local min = v.minRange or 1
			local max = v.maxRange or 1
			local flare = v.flareRange or 0
			if min==1 and max==1 and flare==0 then--符合直接攻击的武器条件
				return true
			end
		end
	end
	return false
end

function IndirectAttack()--间接攻击系
	if corp.weapons then
		for k,v in ipairs(corp.weapons) do
			--取武器数据
			local max = v.maxRange or 1
			local flare = v.flareRange or 0
			if max>=2 and flare==0 then--符合间接攻击的武器条件
				return true
			end
		end
	end
	return false
end

function Capturable()--占领系
	return corp.capturable
end

function NotCapturable()--非占领系
	return not corp.capturable
end

function Vehicle()--车辆系
	return LandForce() and not Capturable()
end

function NotVehicle()--非车辆系
	return not Vehicle()
end

function Copter()--直升机系
	return corp.move.moveType == "Copter"
end

function DirectAttack_NotCapturable()--直接攻击,非占领系
	return DirectAttack() and NotCapturable()
end

function IndirectAttack_NotCapturable(corp)--间接攻击,非占领系
	return IndirectAttack() and NotCapturable()
end

function PowerlessCarrier()--无火力运输系
	if corp.weapons then return false end--有武器,排除
	return volumnOfLoader(corp.name)--请看loadUnit.lua
end

function AirForce()--空军
	return corp.corpType=="AirForce"
end

function LandForce()--陆军
	return corp.corpType=="LandForce"
end

function NavyForce()--海军
	return corp.corpType=="NavyForce"
end

function NotAirForce()--非空军
	return not AirForce()
end

function LandForce_NotCapturable()--陆军,非占领
	return LandForce() and NotCapturable()
end

function LandForce_DirectAttack()--陆军,直接攻击
	return LandForce() and DirectAttack()
end

function LandForce_IndirectAttack()--陆军,间接攻击
	return LandForce() and IndirectAttack()
end

function NavyOrIndirectAttack()--海军或间接攻击系
	return NavyForce() or IndirectAttack()
end

function NavyOrSeaPlaneOrCopter()--海军或水上飞机或直升机系
	return NavyForce() or Copter() or corp.name=="SeaPlane"
end

function InfantryTankLander()--步兵坦克登陆艇
	return corp.name=="Infantry"
		or corp.name=="Tank"
		or corp.name=="Lander"
end

function PlaneOrBike()--翼飞机或摩托车
	return corp.move.moveType=="Plane"
		or corp.name=="Bike"
end

--地形过滤条件,判断terrain
function Plain()--平原
	return terrain.name=="Plain"
end

function Base()--据点
	return terrain.capturable
end

--天气过滤条件,判断weather
function Rainy()
	return weather.isRainy
end

function Snowy()
	return weather.isSnowy
end

function Sandy()
	return weather.isSandy
end