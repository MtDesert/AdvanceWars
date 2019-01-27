--这是损伤计算模块

local attacker=nil
local defender=nil

--从兵种和武器上判断能否攻击对方
--atker攻击的兵种
--wpnIdx所使用的武器
--dfder防御的兵种
function caculateDamage(atker,wpn,dfder)--
	attacker=atker
	defender=dfder
	--开始计算攻击参数
	attacker.corpDamage=Corps.baseDamage(attacker.corp,wpn,defender.corp)--基本损伤(%)
	attacker.towerAttack = 0--指令塔修正(%)
	attacker.attackPower = attacker.corpDamage * (1 + attacker.towerAttack / 100) * (attacker.unit:presentHP() / 10)--实际攻击力(%)=基本损伤*(1+指令塔修正(%))*(当前表现hp/10)
	--开始计算防御参数
	defender.terrainDefend = 0--地形防御力(%)
	if defender.corp.corpType~='AirForce' then
		defender.terrainDefend = defender.terrainAttrib.defendLV * defender.unit:presentHP()--地形防御力(%)=地形防御等级*当前表现hp
	end
	defender.defendPower = defender.terrainDefend--实际防御力(%)
	--开始计算理论损伤
	attacker.finalDamage = math.floor(attacker.attackPower * (1 - defender.defendPower / 100))--理论损伤(%)=实际攻击力(%) * (1-实际防御力(%))
	--理论价值损失
end

function doAttack(atker,wpn,dfder)
	caculateDamage(atker,wpn,dfder)--理论计算
	--开始攻击
	math.randomseed(os.time())
	attacker.attackPower = attacker.attackPower + math.random(0,attacker.unit:presentHP()-1)--幸运修正
	attacker.finalDamage = math.floor(attacker.attackPower * (1 - defender.defendPower / 100))--实际损伤
	defender.finalHP = defender.unit:healthPower() - attacker.finalDamage--计算剩余hp
	if defender.finalHP < 0 then defender.finalHP = 0 end
	defender.valueLost = defender.corp.price * (defender.healthPower-defender.finalHP) / 100--价值损失
	defender.unit.healthPower = defender.finalHP
end

function doAttack_and_CounterAttack(atker,wpn,dfder)
	doAttack(atker,wpn,dfder)
	doAttack(dfder,wpn,atker)
end

--[[static void caculate_conflict( &attacker, &defender,bool caculateLuckDamage=true);
static bool isCounterAttackable(const  &attacker,const  &defender);

	//Base data
	int terrainType;
	int amount_InstructionTower;

	//Derived data
	int corpDamage;
	int terrainDefendLevel;
	int towerAttack;
	int terrainDefend;
	int attackPower;
	int defendPower;
	int finalDamage;
	int finalHP;
	int valueLost;

	bool caculate_Attack( &defender);
};

():
	Unit(0),
	co(0),
	powerStatus(Commander::NoPower),
	//weatherType(Weather::NormalWeather),
	terrainType(0),
	amount_InstructionTower(0)
{
	corpDamage=-1;
	coAttackPercent=0;
	coDefendPercent=0;
	coLuckyDamage_Min=0;
	coLuckyDamage=0;
	coLuckyDamage_Max=10;
	towerAttack=0;
	terrainDefendLevel=0;
	terrainDefend=0;
	attackPower=0;
	defendPower=0;
	finalDamage=0;
	finalHP=healthPower;
	valueLost=0;
}]]

--[[function caculate_conflict( &attacker, &defender,bool caculateLuckDamage)
{
	//caculate
	if(caculateLuckDamage)
	{
		srand(time(NULL));
		attacker.caculate_derivedData_coLuckDamage_random();
		defender.caculate_derivedData_coLuckDamage_random();
	}
	else
	{
		attacker.caculate_derivedData_coLuckDamage_limit();
		defender.caculate_derivedData_coLuckDamage_limit();
	}

	//check who attack first
	bool counterAttackFirst=false;
	/*if(defender.co==Commander::Sonja&&defender.powerStatus==Commander::SuperPower)
	{
		counterAttackFirst=true;
	}*/

	int atkHP=attacker.healthPower;
	int defHP=defender.healthPower;
	//Counter Attack
	if(counterAttackFirst)
	{
		if(isCounterAttackable(attacker,defender))
		{
			//cout<<"Counter attack first"<<endl;cout.flush();
			defender.caculate_Attack(attacker);
			if(attacker.finalHP==0)return;
		}
	}
	//attack
	//cout<<"Attack"<<endl;cout.flush();
	attacker.healthPower=attacker.finalHP;
	attacker.caculate_Attack(defender);
	attacker.healthPower=atkHP;//recover
	if(defender.finalHP==0)return;
	//Counter Attack
	if(!counterAttackFirst)
	{
		if(isCounterAttackable(attacker,defender))
		{
			//cout<<"Counter attack"<<endl;cout.flush();
			defender.healthPower=defender.finalHP;
			defender.caculate_Attack(attacker);
			defender.healthPower=defHP;//recover
			if(attacker.finalHP==0)return;
		}
	}
}

function isCounterAttackable(const  &attacker, const  &defender)
{
	/*bool conditionDirectAttack=
			defender.corp->isDirectAttack()&&
			(attacker.coordinate-defender.coordinate).manhattanLength()==1;
	bool conditionAntiTank=
			(defender.corpType==Corp::AntiTank||defender.corpType==Corp::AntiAirArtillery)&&
			(attacker.coordinate-defender.coordinate).manhattanLength()<=
			CorpList::defaultCorpsList.iterate(defender.corpType)->mainWeapon.maxRange+
			Commander::attackRangeMax(defender.co,(Corp::CorpType)defender.corpType,defender.powerStatus);
	return conditionDirectAttack||conditionAntiTank;*/
	return true;
}

function statusAppend()const{return powerStatus!=Commander::NoPower;}

function caculate_derivedData()
{
	
}
function caculate_derivedData_coLuckDamage_random()
{
	if(coLuckyDamage_Min<coLuckyDamage_Max)
	{
		int value=rand()%(coLuckyDamage_Max-coLuckyDamage_Min);
		coLuckyDamage=coLuckyDamage_Min=value;
	}
	else if(coLuckyDamage_Min=coLuckyDamage_Max)
	{
		coLuckyDamage=coLuckyDamage_Min;
	}
}
function caculate_derivedData_coLuckDamage_limit()
{
	if(coLuckyDamage>=coLuckyDamage_Max)coLuckyDamage=coLuckyDamage_Max-1;
	if(coLuckyDamage<coLuckyDamage_Min)coLuckyDamage=coLuckyDamage_Min;
}

//attack!!!
function caculate_Attack( &defender)
{
	/*int weaponCount=CorpList::defaultCorpsList.iterate(corpType)->weapons.size();
	bool hasWeapon=false;
	for(int i=0;i<weaponCount;++i)
	{
		hasWeapon=CorpList::defaultCorpsList.damageValue(corpType,defender.corpType,i,corpDamage);
		if(hasWeapon)break;
	}
	if(!hasWeapon)
	{
		corpDamage=-1;
		defender.finalHP=defender.healthPower;
		defender.valueLost=0;
		return false;
	}
	//attack power
	attackPower=
			(corpDamage*(100+coAttackPercent+(statusAppend()?10:0)+
			towerAttack)+100*coLuckyDamage)*presentHP()/1000;
	attackPower=max(attackPower,0);//make sure attack power >= 0

	//defend power
	defender.terrainDefend=defender.terrainDefendLevel*defender.presentHP();
	defender.defendPower=
			defender.coDefendPercent+
			//(Corp::isAirForce(defender.corpType)?0:defender.terrainDefend)+
			(defender.statusAppend()?10:0);

	//attack!!!!
	finalDamage=attackPower*(100-defender.defendPower)/100;//AWDS version
	//finalDamage=attackPower/(100+def.defendPower);//AWDOR version
	finalDamage=max(finalDamage,0);

	defender.finalHP=defender.healthPower-finalDamage;
	defender.finalHP=max(defender.finalHP,0);

	//value lost
	_List_const_iterator<Corp> corp=CorpList::defaultCorpsList.iterate(defender.corpType);
	/*int buildPrice=Commander::builtPrice(defender.co,defender.corpType,defender.powerStatus);
	defender.valueLost=corp->price*(100+buildPrice)*(defender.healthPower-defender.finalHP)/10000;*/
	return true;
}
function Campaign::execute_Fire()
{
	/*//read data
	input(*selectedUnit,attacker);
	input(*selectedTarget,defender);
	//do!!!
	caculate_conflict(attacker,defender);
	//write data
	selectedUnit->healthPower=attacker.finalHP;
	selectedTarget->healthPower=defender.finalHP;
	if(selectedUnit->healthPower==0)battleField.deleteUnit(selectedUnit);
	if(selectedTarget->healthPower==0)battleField.deleteUnit(selectedTarget);*/
	return true;
}]]