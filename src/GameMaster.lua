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

local gloableZOrder = 1
local monsterCount = {dragon=7,slime=7,piglet=7,rat=7}
local EXIST_MIN_MONSTER = 4
kill_count = 0
show_count = 0
local KILL_MAX_MONSTER = 30
local showboss = false
local scheduleid
local stage = 0
local battleSiteX = {-2800,-1800,-500}
local frontDistanceWithHeroX = 600
local backwardDistanceWithHeroX = 800
local distanceWithHeroX = 30
local distanceWithHeroY = 30

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
    stage = 0
    math.randomseed(tostring(os.time()):reverse():sub(1, 6))
    for i=1,7 do
        self:randomshowMonster(true)
    end
    stage = 1
end

function GameMaster:update(dt)
    self._totaltime = self._totaltime + dt
	if self._totaltime > self._logicFrq then
		self._totaltime = self._totaltime - self._logicFrq
		self:logicUpdate()
	end
end

function GameMaster:logicUpdate()    
    if stage == 1 then
        if List.getSize(MonsterManager) < EXIST_MIN_MONSTER then
            math.randomseed(tostring(os.time()):reverse():sub(1, 6))
            for i=1,4 do
                self:randomshowMonster(true)
            end
            stage = 2
        end
    elseif  stage == 2 then
        if List.getSize(MonsterManager) < EXIST_MIN_MONSTER then
            math.randomseed(tostring(os.time()):reverse():sub(1, 6))
            for i=1,4 do
                self:randomshowMonster(true)
            end
            stage = 3
        end
    elseif stage == 3 then
        if List.getSize(MonsterManager) == 0 then
            for i = HeroManager.first, HeroManager.last do
                local hero = HeroManager[i]
                if hero ~= nil then
                    hero._goRight = true
                end
            end
            stage = 4
        end
    elseif stage == 4 then
        if getFocusPointOfHeros().x > battleSiteX[2] then
            math.randomseed(tostring(os.time()):reverse():sub(1, 6))
            for i=1,3 do
                self:randomshowMonster(true)
            end
            for i=1,4 do
                self:randomshowMonster(false)
            end
            stage = 5
        end
    elseif stage == 5 then
        if List.getSize(MonsterManager) < EXIST_MIN_MONSTER then
            math.randomseed(tostring(os.time()):reverse():sub(1, 6))
            for i=1,4 do
                self:randomshowMonster(true)
            end
            stage = 6
        end
    elseif stage == 6 then
        if List.getSize(MonsterManager) < EXIST_MIN_MONSTER then
            math.randomseed(tostring(os.time()):reverse():sub(1, 6))
            for i=1,4 do
                self:randomshowMonster(false)
            end
            stage = 7
        end
    elseif stage == 7 then
        if List.getSize(MonsterManager) == 0 then
            for i = HeroManager.first, HeroManager.last do
                local hero = HeroManager[i]
                if hero ~= nil then
                    hero._goRight = true
                end
            end
            stage = 8
        end
    elseif stage == 8 then
        if getFocusPointOfHeros().x > battleSiteX[3] then
            self:showWarning()
            stage = 9
        end
    end
end

function GameMaster:AddHeros()

	local knight = Knight:create()
   	knight:setPosition(battleSiteX[1], 10)
    currentLayer:addChild(knight)
    knight:idleMode()
    List.pushlast(HeroManager, knight)

	local mage = Mage:create()
   	mage:setPosition(battleSiteX[1], 100)
   	currentLayer:addChild(mage)
   	mage:idleMode()
   	List.pushlast(HeroManager, mage)
   	
    local archer = Archer:create()
    archer:setPosition(battleSiteX[1], -80)
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
        currentLayer:addChild(dragon)
        dragon:setVisible(false)
        dragon:setAIEnabled(false)
        List.pushlast(DragonPool,dragon)
    end   
end

function GameMaster:addSlime()
    for var=1, monsterCount.slime do
        local slime = Slime:create()
        currentLayer:addChild(slime)
        slime:setVisible(false)
        slime:setAIEnabled(false)
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
        currentLayer:addChild(rat)
        rat:setVisible(false)
        rat:setAIEnabled(false)
        List.pushlast(RatPool,rat)
    end  
end

function GameMaster:showDragon(isFront)
    if List.getSize(DragonPool) ~= 0 then
        local dragon = List.popfirst(DragonPool)
        dragon:reset()
        local appearPos = getFocusPointOfHeros()
        local randomvarX = math.random()*0.2+1
        if stage == 0 then
            appearPos.x = appearPos.x + frontDistanceWithHeroX*randomvarX
            dragon:setFacing(180)
        else
            if isFront then
                appearPos.x = appearPos.x + frontDistanceWithHeroX*1.5*randomvarX
                dragon:setFacing(180)
            else
                appearPos.x = appearPos.x - backwardDistanceWithHeroX*1.5*randomvarX
                dragon:setFacing(0)
            end
        end
        local randomvarY = 2*math.random()-1
        appearPos.y = appearPos.y + randomvarY*distanceWithHeroY
        dragon:setPosition(appearPos)
        dragon._myPos = appearPos
        dragon:setVisible(true)
        dragon._goRight = false
        dragon:setAIEnabled(true)
        List.pushlast(MonsterManager, dragon)
        show_count = show_count + 1
    end
end

function GameMaster:showPiglet(isFront)
    if List.getSize(PigletPool) ~= 0 then
        local piglet = List.popfirst(PigletPool)
        piglet:reset()
        local appearPos = getFocusPointOfHeros()
        local randomvarX = math.random()*0.2+1
        if stage == 0 then
            appearPos.x = appearPos.x + frontDistanceWithHeroX*randomvarX
            piglet:setFacing(180)
        else
            if isFront then
                appearPos.x = appearPos.x + frontDistanceWithHeroX*1.5*randomvarX
                piglet:setFacing(180)
            else
                appearPos.x = appearPos.x - backwardDistanceWithHeroX*1.5*randomvarX
                piglet:setFacing(0)
            end
        end
        local randomvarY = 2*math.random()-1
        appearPos.y = appearPos.y + randomvarY*distanceWithHeroY
        piglet:setPosition(appearPos)
        piglet._myPos = appearPos
        piglet:setVisible(true)
        piglet._goRight = false
        piglet:setAIEnabled(true)
        List.pushlast(MonsterManager, piglet)
        show_count = show_count + 1
    end
end

function GameMaster:showSlime(isFront)
    if List.getSize(SlimePool) ~= 0 then
        local slime = List.popfirst(SlimePool)
        slime:reset()
        local appearPos = getFocusPointOfHeros()
        local randomvarX = math.random()*0.2+1
        if stage == 0 then
            appearPos.x = appearPos.x + frontDistanceWithHeroX*randomvarX
            slime:setFacing(180)
        else
            if isFront then
                appearPos.x = appearPos.x + frontDistanceWithHeroX*1.5*randomvarX
                slime:setFacing(180)
            else
                appearPos.x = appearPos.x - backwardDistanceWithHeroX*1.5*randomvarX
                slime:setFacing(0)
            end
        end
        local randomvarY = 2*math.random()-1
        appearPos.y = appearPos.y + randomvarY*distanceWithHeroY
        slime:setPosition(appearPos)
        slime._myPos = appearPos
        slime:setVisible(true)
        slime._goRight = false
        slime:setAIEnabled(true)
        List.pushlast(MonsterManager, slime)
        show_count = show_count + 1
    end
end

function GameMaster:showRat(isFront)
    if List.getSize(RatPool) ~= 0 then
        local rat = List.popfirst(RatPool)
        rat:reset()
        local appearPos = getFocusPointOfHeros()
        local randomvar = 2*math.random()-1
        if isFront then
            appearPos.x = appearPos.x + frontDistanceWithHeroX+randomvar*distanceWithHeroX
        else
            appearPos.x = appearPos.x - backwardDistanceWithHeroX+randomvar*distanceWithHeroX
        end
        appearPos.y = appearPos.y + 1000
        rat:setPosition(appearPos)
        rat._myPos = appearPos
        rat:setVisible(true)
        rat._goRight = false
        local function enableAI()
            rat:setAIEnabled(true)
        end
        if stage == 0 then
            rat:runAction(cc.Sequence:create(cc.JumpBy3D:create(0.5,cc.V3(-200,-200,0),150,1),cc.CallFunc:create(enableAI)))
            rat:setFacing(45)
        else
            rat:runAction(cc.Sequence:create(cc.JumpBy3D:create(0.5,cc.V3(0,-200,0),150,1),cc.CallFunc:create(enableAI)))
            rat:setFacing(90)
        end
        List.pushlast(MonsterManager, rat)
        show_count = show_count + 1
    end
end

function GameMaster:randomshowMonster(isFront)
	local random_var = math.random()
    -- random_var = 0.8
	if random_var<0.15 then
		self:showDragon(isFront)
	elseif random_var<0.3 then
        self:showRat(isFront)
	elseif random_var<0.6 then
        self:showPiglet(isFront)
	else
        self:showSlime(isFront)
	end
end

function GameMaster:showBoss()
    --boss should appear int pos(300,200)
    --now assume Boss is a piglet.
    if List.getSize(PigletPool) ~= 0 then
        local piglet = List.popfirst(PigletPool)
        piglet:reset()
        piglet:setScale(3)
        piglet:setFacing(180)
        local appearPos = cc.p(300,200)
        piglet:setPosition(appearPos)
        piglet._myPos = appearPos
        piglet:setVisible(true)
        piglet._goRight = false
        piglet:setAIEnabled(true)
        List.pushlast(MonsterManager, piglet)
        show_count = show_count + 1
    end
end

function GameMaster:showWarning()
    cc.Texture2D:setDefaultAlphaPixelFormat(cc.TEXTURE2_D_PIXEL_FORMAT_AUTO)
	local warning = cc.Layer:create()
	local warning_logo = cc.Sprite:createWithSpriteFrameName("caution.png")
    cc.Texture2D:setDefaultAlphaPixelFormat(cc.TEXTURE2_D_PIXEL_FORMAT_RG_B565)
    warning_logo:setPosition(G.winSize.width*0.5,G.winSize.height*0.5)
	warning_logo:setPositionZ(1)
	local function showdialog()
	   warning:removeFromParent()
	   self:showDialog()
	end
	warning_logo:runAction(cc.Sequence:create(cc.DelayTime:create(0.5),cc.EaseSineOut:create(cc.Blink:create(1.5,3)),cc.CallFunc:create(showdialog)))
	warning:addChild(warning_logo)
	
	warning:setScale(0.5)
    warning:setPositionZ(-cc.Director:getInstance():getZEye()/2)
    warning:ignoreAnchorPointForPosition(false)
    warning:setLocalZOrder(999)
    camera:addChild(warning,2)
end

function GameMaster:showDialog()
    cc.Texture2D:setDefaultAlphaPixelFormat(cc.TEXTURE2_D_PIXEL_FORMAT_AUTO)
    local colorLayer = cc.LayerColor:create(cc.c4b(10,10,10,150))
    colorLayer:ignoreAnchorPointForPosition(false)
    colorLayer:setPositionZ(-cc.Director:getInstance():getZEye()/4)
    colorLayer:setGlobalZOrder(0)
    camera:addChild(colorLayer)
    
    --create dialog
    local dialog = cc.Layer:create()
    dialog:setPositionX(-G.winSize.width*0.025)

    --add outframe
    local outframe = cc.Sprite:createWithSpriteFrameName("outframe.png")
    outframe:setPosition(G.winSize.width*0.55,G.winSize.height*0.27)
    outframe:setScale(0.6*resolutionRate)
    dialog:addChild(outframe)
    --add inframe
    local inframe = cc.Sprite:createWithSpriteFrameName("inframe.png")
    inframe:setPosition(G.winSize.width*0.67,G.winSize.height*0.27)
    inframe:setScale(0.5*resolutionRate)
    dialog:addChild(inframe)
    --add boss icon
    local bossicon = cc.Sprite:createWithSpriteFrameName("bossicon.png")
    bossicon:setPosition(G.winSize.width*0.42,G.winSize.height*0.46)
    bossicon:setScale(0.75*resolutionRate)
    bossicon:setFlippedX(true)
    dialog:addChild(bossicon)
    --add boss logo
    local bosslogo = cc.Sprite:createWithSpriteFrameName("bosslogo.png")
    bosslogo:setPosition(G.winSize.width*0.417,G.winSize.height*0.265)
    bosslogo:setScale(0.74*resolutionRate)
    dialog:addChild(bosslogo)
    --add text
    local text = cc.Label:createWithSystemFont(BossTaunt,"arial",24)
    text:setPosition(G.winSize.width*0.68,G.winSize.height*0.27)
    dialog:addChild(text)
    --set dialog
    dialog:setScale(0.1)
    dialog:ignoreAnchorPointForPosition(false)
    dialog:setPositionZ(-cc.Director:getInstance():getZEye()/3)
    dialog:setGlobalZOrder(0)
    camera:addChild(dialog)
    local function pausegame()
        for var = HeroManager.first, HeroManager.last do
            HeroManager[var]:idleMode()
            HeroManager[var]:setAIEnabled(false)
        end
    end
    dialog:runAction(cc.Sequence:create(cc.ScaleTo:create(0.5 ,0.5),cc.CallFunc:create(pausegame)))
    uiLayer:setVisible(false)
    local function exitDialog( )
        local function removeDialog()
            dialog:removeFromParent()
            colorLayer:removeFromParent()
            uiLayer:setVisible(true)
            for var = HeroManager.first, HeroManager.last do
                HeroManager[var]:setAIEnabled(true)
            end
            self:showBoss()
        end
        dialog:runAction(cc.Sequence:create(cc.ScaleTo:create(0.5,0.1),cc.CallFunc:create(removeDialog)))
    	cc.Director:getInstance():getScheduler():unscheduleScriptEntry(scheduleid)
    end
    
    scheduleid = cc.Director:getInstance():getScheduler():scheduleScriptFunc(exitDialog,3,false)

    cc.Texture2D:setDefaultAlphaPixelFormat(cc.TEXTURE2_D_PIXEL_FORMAT_RG_B565)    
end

function GameMaster:showVictoryUI()
    uiLayer:showVictoryUI()
end

return GameMaster