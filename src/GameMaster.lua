require "Manager"
require "Knight"
require "Mage"
require "Monster"
require "Actor"
require "GlobalVariables"
require "Piglet"
require "Archer"

local heroOriginPositionX = -2900
local gloableZOrder = 1
local monsterCount = {dragon=3,slime=3,piglet=3,rat=3}
local minMonsterCount = 2

local GameMaster = class("GameMaster")

local size = cc.Director:getInstance():getWinSize()

function GameMaster:ctor()
	self._totaltime = 0
	self._logicFrq = 1.0
end

function GameMaster.create()
	local gm = GameMaster.new()
	gm:init()

	return gm
end

function GameMaster:init()
	self:AddHeros()
	self:addMonsters()
end

function GameMaster:update(dt)
    self._totaltime = self._totaltime + dt
	if self._totaltime > self._logicFrq then
		self._totaltime = self._totaltime - self._logicFrq
		self:logicUpdate()
	end
end

function GameMaster:logicUpdate()
    local max_const_count = monsterCount.piglet
    local last_count = List.getSize(DragonManager) + List.getSize(SlimeManager) + List.getSize(SlimeManager) + List.getSize(PigletManager)
    if max_const_count - last_count < minMonsterCount then
    	self:randomShowMonster()
    end
end

function GameMaster:AddHeros()

	local knight = Knight:create()
   	knight:setPosition(heroOriginPositionX+500, 300)
    currentLayer:addChild(knight)
    knight:idleMode()
    List.pushlast(HeroManager, knight)

	local mage = Mage:create()
   	mage:setPosition(heroOriginPositionX+500, 000)
   	currentLayer:addChild(mage)
   	mage:idleMode()
   	List.pushlast(HeroManager, mage)
   	
    local archer = Archer:create()
    archer:setPosition(heroOriginPositionX+300, -100)
    currentLayer:addChild(archer)
    archer:idleMode()
    List.pushlast(HeroManager, archer)   	

end

function GameMaster:addMonsters()
	--self:addDragon()
	-- self:addSlime()
	 self:addPiglet()
	-- self:addRat()
end

function GameMaster:addDragon()
	for var=1, monsterCount.dragon do
		local dragon = Dragon:create()
		dragon:retain()
		List.pushlast(DragonManager,dragon)
	end 
end

function GameMaster:addSlime()
    for var=1, monsterCount.slime do
    	local slime = Slime:create()
    	slime:retain()
    	List.pushlast(SlimeManager,slime)
    end   
end

function GameMaster:addPiglet()
    for var=1, monsterCount.piglet do
    	local piglet = Piglet:create()
    	piglet:retain()
    	List.pushlast(PigletManager,piglet)
    end   
end

function GameMaster:addRat()
    for var=1, monsterCount.rat do
    	local rat = Rat:create()
    	rat:retain()
    	List.pushlast(RatManager,rat)
    end   
end

function GameMaster:ShowDragon()
    if List.getSize(DragonManager) ~= 0 then
        local dragon  = List.poplast(DragonManager)
        dragon:setPosition({x=800,y=0})
        currentLayer:addChild(dragon)
        List.pushlast(MonsterManager, dragon)
    end
end

function GameMaster:ShowPiglet()
    if List.getSize(PigletManager) ~= 0 then
    cclog(List.getSize(PigletManager))
        local piglet = List.popfirst(PigletManager)
        piglet:setPosition({x=800,y=0})
        currentLayer:addChild(piglet)
        List.pushlast(MonsterManager, piglet)
    end
end

function GameMaster:randomShowMonster()
	local random_var = math.random()
	random_var = 0.4
	if random_var<0.25 then
		self:ShowDragon()
	elseif random_var<0.5 then
		self:ShowPiglet()
	elseif random_var<0.75 then
		--todo
	else
		--todo
	end
end

return GameMaster