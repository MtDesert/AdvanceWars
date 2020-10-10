--指挥官相关的能力描述,主要用于辅助../datas/Commanders.lua中的指挥官描述
--判断条件的全局变量为:corp兵种,terrain地形,weather天气,由游戏程序直接传递进来

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

--CO瞬间发动的技能
function increaseSelfUnitsHP(repairHP)--增加自身HP,免费
	forEachUnit({
		self=function(unit)
			repairUnit(unit,repairHP,0)
		end,
	})
end
--减少敌人HP
function decreaseEnemyUnitHP(reduceHP)
	forEachUnit({
		enemy=function(unit)
			reduceUnitHP(unit,reduceHP)
		end,
	})
end
--Andy瞬发技能
function HyperRepair() increaseSelfUnitsHP(20) end
function HyperUpgrade()	increaseSelfUnitsHP(50) end
--Rachel瞬发技能
function CoveringFire()
	for i=1,3 do
		rocketCoveringFire(2,30)
	end
end
--Olaf瞬发技能
function WinterFury() decreaseEnemyUnitHP(20) end
--Sasha瞬发技能
function MarketCrash()
end
--Eagle瞬发技能
function LightningStrike()
end
--Drake瞬发技能
function Tsunami()
end
function Typhoon()
end
--Jess瞬发技能
function TurboCharge()end
function Overdrive()end
--Sensei瞬发技能
function CopterCommand()end
function AirborneAssault()end
--Hawke瞬发技能
function BlackWave()end
function BlackStorm()end
--Sturm瞬发技能
function MeteorStrike()end
--Kindle瞬发技能
function UrbanBlight()end
--VonBolt瞬发技能
function ExMachina()end
--Brenner瞬发技能
function Reinforce()end
--Greyfield瞬发技能
function SupplyChain()end
function WeatherRandom()end
--Tabitha瞬发技能
function StormFront()end
--Caulder瞬发技能
function ScienceRecover()end
--BillyGates瞬发技能
function LocalTyrants()end
