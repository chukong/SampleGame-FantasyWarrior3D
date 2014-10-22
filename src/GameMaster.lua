require "Manager"
require "Knight"
require "Mage"
require "Monster"
require "Actor"
require "GlobalVariables"
require "Piglet"
require "Slime"
require "Rat"
require "Dragon"
require "Archer"

local heroOriginPositionX = -2900
local gloableZOrder = 1
local monsterCount = {dragon=3,slime=3,piglet=2,rat=3}
local EXIST_MIN_MONSTER = 2
local kill_count = 0
local KILL_MAX_MONSTER = 5
local showboss = false
local scheduleid

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
    if kill_count < KILL_MAX_MONSTER then
        local max_const_count = monsterCount.piglet + monsterCount.dragon + monsterCount.rat + monsterCount.slime
        local last_count = List.getSize(DragonPool) + List.getSize(SlimePool) + List.getSize(SlimePool) + List.getSize(PigletPool)
        if max_const_count - last_count < EXIST_MIN_MONSTER then
            self:randomshowMonster()
        end
    elseif showboss == false then
        showboss = true
        self:showBoss()
    end
end

function GameMaster:AddHeros()

	local knight = Knight:create()
   	knight:setPosition(heroOriginPositionX+500, 400)
    currentLayer:addChild(knight)
    knight:idleMode()
    List.pushlast(HeroManager, knight)

	local mage = Mage:create()
   	mage:setPosition(heroOriginPositionX+500, 200)
   	currentLayer:addChild(mage)
   	mage:idleMode()
   	List.pushlast(HeroManager, mage)
   	
    local archer = Archer:create()
    archer:setPosition(heroOriginPositionX+300, 100)
    currentLayer:addChild(archer)
    archer:idleMode()
    List.pushlast(HeroManager, archer)   	

end

function GameMaster:addMonsters()
	self:addDragon()
	 self:addSlime()
	 self:addPiglet()
	 self:addRat()
end

function GameMaster:addDragon()
	for var=1, monsterCount.dragon do
		local dragon = Dragon:create()
		dragon:retain()
		List.pushlast(DragonPool,dragon)
	end 
end

function GameMaster:addSlime()
    for var=1, monsterCount.slime do
    	local slime = Slime:create()
    	slime:retain()
    	List.pushlast(SlimePool,slime)
    end   
end

function GameMaster:addPiglet()
    for var=1, monsterCount.piglet do
    	local piglet = Piglet:create()
    	currentLayer:addChild(piglet)
    	piglet:setVisible(false)
    	piglet:setAIEnabled(false)
    	List.pushlast(PigletPool,piglet)
    end   
end

function GameMaster:addRat()
    for var=1, monsterCount.rat do
    	local rat = Rat:create()
    	rat:retain()
    	List.pushlast(RatPool,rat)
    end   
end

function GameMaster:showDragon()
    if List.getSize(DragonPool) ~= 0 then
        local dragon  = List.poplast(DragonPool)
        dragon:setPosition({x=800,y=0})
        currentLayer:addChild(dragon)
        List.pushlast(MonsterManager, dragon)
        kill_count = kill_count + 1
    end
end

function GameMaster:showPiglet()
    if List.getSize(PigletPool) ~= 0 then
        local piglet = List.popfirst(PigletPool)
        local appearPos = getFocusPointOfHeros()
        local randomvar = math.random()
        if randomvar < 0.5 then appearPos.x = appearPos.x - 1200
        else appearPos.x = appearPos.x + 1200 end
        if appearPos.x < heroOriginPositionX then appearPos.x = appearPos.x + 2400 end
        if appearPos.x > 0 then appearPos.x = appearPos.x - 2400 end
        piglet:setPosition(appearPos)
        piglet:setVisible(true)
        piglet:setAIEnabled(true)
        List.pushlast(MonsterManager, piglet)
        kill_count = kill_count + 1
    end
end

function GameMaster:showSlime()
	if List.getSize(SlimePool) ~= 0 then
        local slime = List.popfirst(SlimePool)
        slime:setPosition({x=800,y=100})
        currentLayer:addChild(slime)
        List.pushlast(MonsterManager, slime)
        kill_count = kill_count + 1
    end
end

function GameMaster:showRat()
	if List.getSize(RatPool) ~= 0 then
        local rat = List.popfirst(RatPool)
        rat:setPosition({x=800,y=100})
        currentLayer:addChild(rat)
        List.pushlast(MonsterManager, rat)
        kill_count = kill_count + 1
    end
end

function GameMaster:randomshowMonster()
	local random_var = math.random()
	random_var = 0.4
	if random_var<0.25 then
		self:showDragon()
	elseif random_var<0.5 then
		self:showPiglet()
	elseif random_var<0.75 then
		self:showSlime()
	else
		self:showRat()
	end
end

function GameMaster:showBoss()
	self:showDialog()
	--TODO  show text dialog
	--TODO  show boss
end

function GameMaster:showDialog()
    local dialog = cc.Layer:create()
    local outframe = cc.Sprite:create("battlefieldUI/outframe.png")
    outframe:setPositionZ(1)
    dialog:addChild(outframe)
    local inframe = cc.Sprite:create("battlefieldUI/inframe.png")
    inframe:setPositionX(180)
    inframe:setPositionZ(2)
    dialog:addChild(inframe)
    local bossicon = cc.Sprite:create("battlefieldUI/bossicon.png")
    bossicon:setPosition(cc.p(-300,145))
    bossicon:setFlippedX(true)
    bossicon:setPositionZ(3)
    dialog:addChild(bossicon)
    local bosslogo = cc.Sprite:create("battlefieldUI/bosslogo.png")
    bosslogo:setPosition(cc.p(-300,-20))
    bosslogo:setPositionZ(4)
    dialog:addChild(bosslogo)
    local text = cc.Label:createWithSystemFont("引擎技术哪家强？","arial",40)
    text:setPosition(cc.p(200,0))
    text:setPositionZ(5)
    dialog:addChild(text)
    dialog:setAnchorPoint(cc.p(0.5,0.5))
    dialog:setPosition({x=300,y=50})
    dialog:setScale(0.1)
    dialog:setPositionZ(-cc.Director:getInstance():getZEye()/2)
    dialog:ignoreAnchorPointForPosition(false)
    dialog:setLocalZOrder(999)
    camera:addChild(dialog,2)
    dialog:runAction(cc.ScaleTo:create(0.5,0.5))
    uiLayer:setVisible(false)
    local function exitDialog( )
        local function removeDialog()
            dialog:removeFromParent()
            uiLayer:setVisible(true)
        end
        dialog:runAction(cc.Sequence:create(cc.ScaleTo:create(0.5,0.1),cc.CallFunc:create(removeDialog)))
    	cc.Director:getInstance():getScheduler():unscheduleScriptEntry(scheduleid)
    end
    
    scheduleid = cc.Director:getInstance():getScheduler():scheduleScriptFunc(exitDialog,3,false)
end

return GameMaster