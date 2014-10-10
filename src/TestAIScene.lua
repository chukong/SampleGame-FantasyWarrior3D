require "Helper"
require "Base3D"
require "Hero3D"
require "Monster3D"
require "Boss3D"
require "Manager"

local size = cc.Director:getInstance():getWinSize()
local activearea = {width = 500, height = 640}
local scheduler = cc.Director:getInstance():getScheduler()
local gloableZOrder = 1
local touchPos = nil
local beginUpdate = false
local chosenOne = nil
local currentLayer = nil
local heroOriginPositionX = -2900
local targetpos = {x=3000,y=0}
local scheduleid_1wave;
local scheduleid_2wave;

--hero ref
local warrior
local archer
local mage

local function isOutOfBound(object)
    local currentPos = cc.p(object:getPosition());
    local state = false;

    if currentPos.x < 0 then
        currentPos.x = 0
        state = true
        beginUpdate = false
    end    

    if currentPos.x > activearea.width then
        currentPos.x = activearea.width
        state = true
        beginUpdate = false
    end

    if currentPos.y < 0 then
        currentPos.y = 0
        state = true
        beginUpdate = false
    end

    if currentPos.y > activearea.height then
        currentPos.y = activearea.height
        state = true
        beginUpdate = false
    end

    --object:setPosition(currentPos)
    return false
end

local function collisionDetect()
    for val = 1, List.getSize(HeroManager) do
        local sprite = HeroManager[val-1]
        if sprite._isalive == true then
            collision(sprite)
            isOutOfBound(sprite)            
        end
    end
    
    for val = 1, List.getSize(MonsterManager) do
        local sprite = MonsterManager[val-1]
        if sprite._isalive == true then
            collision(sprite)
            isOutOfBound(sprite)            
        end
    end    
    
    for val = 1, List.getSize(BossManager) do
        local sprite = BossManager[val-1]
        if sprite._isalive == true then
            collision(sprite)
            isOutOfBound(sprite)            
        end
    end        
    
end

local function findMonster()

    --for warroir
    local shortest_distance = cc.pGetDistance(getPosTable(warrior),targetpos)
    for var = 1, List.getSize(MonsterManager) do
        local dis = cc.pGetDistance(getPosTable(warrior),getPosTable(MonsterManager[var-1]))
        if dis<shortest_distance then
            warrior._target = MonsterManager[var-1]
            shortest_distance = dis
        end
    end
    
    shortest_distance = cc.pGetDistance(getPosTable(archer),targetpos)
    for var = 1, List.getSize(MonsterManager) do
        local dis = cc.pGetDistance(getPosTable(archer),getPosTable(MonsterManager[var-1]))
        if dis<shortest_distance then
            archer._target = MonsterManager[var-1]
            shortest_distance = dis
        end
    end


    shortest_distance = cc.pGetDistance(getPosTable(mage),targetpos)
    for var = 1, List.getSize(MonsterManager) do
        local dis = cc.pGetDistance(getPosTable(mage),getPosTable(MonsterManager[var-1]))
        if dis<shortest_distance then
            mage._target = MonsterManager[var-1]
            shortest_distance = dis
        end
    end

    --cclog(shortest_distance)
end

local function update(dt)
    collisionDetect()
    findMonster()

    if chosenOne == 0 then return end

end

local function addNewSprite(x, y, tag)
    local sprite = nil
    local animation = nil
    if tag == EnumRaceType.DEBUG then
        sprite = Hero3D.create(EnumRaceType.WARRIOR)
        sprite._sprite3d:setScale(25)
        List.pushlast(HeroManager, sprite)
    elseif tag == EnumRaceType.MONSTER then
        sprite = Monster3D.create(EnumRaceType.MONSTER)   
        sprite._sprite3d:setScale(5)
        List.pushlast(MonsterManager, sprite)
    elseif tag == EnumRaceType.BOSS then
        sprite = Boss3D.create()
        sprite._sprite3d:setScale(1)
        sprite:setState(EnumStateType.ATTACK)
        List.pushlast(BossManager, sprite)
    else
        return
    end

    sprite:setPosition(cc.p(x, y))
    gloableZOrder = gloableZOrder + 1
    sprite:setGlobalZOrder(gloableZOrder)
    currentLayer:addChild(sprite)
   
    local rand2 = math.random()
    local speed = 1.0
    
    if rand2 < 1/3 then
        speed =  math.random()  
    elseif rand2 < 2/3 then
        speed = - 0.5 *  math.random()
    end

    sprite.speed =  speed + 0.5
    sprite.priority = sprite.speed        
    
    sprite:setState(EnumStateType.STAND)
    
    return sprite
end

local function jumpdone()
	warrior:setState(EnumStateType.WALK)
end

local function updateParticlePos()
	if warrior._particle ~= nil then
        warrior._particle:setPosition(getPosTable(warrior))
	end
    if archer._particle ~= nil then
        archer._particle:setPosition(getPosTable(archer))
    end
    if mage._particle ~= nil then
        mage._particle:setPosition(getPosTable(mage))
    end
end

local function addParticleToRole(role)
    role._particle = cc.BillboardParticleSystem:create("effect/walkingPuff.plist")
    role._particle:setDepthTestEnabled(true)
    role._particle:setScale(1)
    role._particle:setPositionZ(15)
    role._particle:setDuration(-1)    
    role._particle:setStartColor({r=234,g=123,b=245,a=255})
    currentLayer:addChild(role._particle,5)
    role._particle:setEmissionRate(0)
end

local function createRole()
 
    warrior = addNewSprite(heroOriginPositionX, 0, EnumRaceType.DEBUG)
    addParticleToRole(warrior)    
    warrior:setState(EnumStateType.STAND)
    warrior:runAction(cc.Sequence:create(cc.JumpBy3D:create(0.8,{x=200,y=0,z=0},300,1),cc.CallFunc:create(jumpdone)))
    
    archer = addNewSprite(heroOriginPositionX, 300, EnumRaceType.DEBUG)
    addParticleToRole(archer)    
    archer:setState(EnumStateType.WALK)

    mage = addNewSprite(heroOriginPositionX, -300, EnumRaceType.DEBUG)
    addParticleToRole(mage)
    mage:setState(EnumStateType.WALK)
       
    chosenOne = findAliveHero() --Assume it is the selected people
    
    scheduler:scheduleScriptFunc(updateParticlePos, 0, false)

end

local function createMonster()
    addNewSprite(size.width/2-1200, size.height/2-200, EnumRaceType.MONSTER)
    addNewSprite(size.width/2-1300, size.height/2-200, EnumRaceType.MONSTER)
    addNewSprite(size.width/2-1300, size.height/2-100, EnumRaceType.MONSTER)
end

local function createBoss()
    addNewSprite(size.width/2+300, size.height/2-100, EnumRaceType.BOSS)
end

local TestAIScene = class("TestAIScene",function()
    return cc.Scene:create()
end)

local function secondwavw_monster()
    for var = 1, List.getSize(MonsterManager) do
        currentLayer:removeChild(MonsterManager[var-1])
    end
    List.removeAll(MonsterManager)
    for var = 1, List.getSize(HeroManager) do
        HeroManager[var-1]._target = nil
        HeroManager[var-1]:setState(EnumStateType.WALK)
    end
end

local function firstwave_monster()
    createMonster()
    scheduler:unscheduleScriptEntry(scheduleid_1wave)
    scheduleid_2wave=scheduler:scheduleScriptFunc(secondwavw_monster,1.5,false)
end

function TestAIScene.create()
    local scene = TestAIScene:new()
    currentLayer = cc.Layer:create()
    scene:addChild(currentLayer)

    TestAIScene.createBackground()
    createRole()
    createBoss()
    TestAIScene.setCamera()
    
    warrior._particle:setCamera(camera)
    archer._particle:setCamera(camera)
    mage._particle:setCamera(camera)

    --test    

    --custom event
    local function battle_success(event)
        TestAIScene.success()
    end

    local function battle_fail(event)
        TestAIScene.fail()
    end    

    local listener1 = cc.EventListenerCustom:create("battle_success", battle_success)
    local eventDispatcher = currentLayer:getEventDispatcher()
    eventDispatcher:addEventListenerWithFixedPriority(listener1, 1)

    local listener2 = cc.EventListenerCustom:create("battle_fail", battle_fail)
    eventDispatcher:addEventListenerWithFixedPriority(listener2, 2)    

--    -- handling touch events   
--    local function onTouchBegan(touch, event)
--        return true
--    end
--
--    local function onTouchMoved(touches, event)     
--    end    
--
--    local function onTouchEnded(touch, event)
--        if touch == nil then return end
--
--        local location = touch:getLocationInView()
--        local nearP = cc.V3(location.x, location.y, -1.0)
--        local farP = cc.V3(location.x, location.y, 1.0)
--        nearP = camera:unproject(size, nearP, nearP)
--        farP = camera:unproject(size, farP, farP)
--
--        local dir = cc.V3Sub(farP, nearP)
--        local dist = 0.0
--        local temp = cc.V3(0.0, 0.0, 1.0)
--        local ndd = cc.V3Dot(temp, dir)
--
--        if ndd == 0 then dist = 0.0 end
--
--        local ndo = cc.V3Dot(temp, nearP)
--        dist = (0 - ndo) / ndd
--
--        local tt = cc.V3MulEx(dir, dist)
--        touchPos =  cc.V3Add(nearP, tt)
--
--        local prePosX,prePosY = chosenOne:getPosition()
--        local prePos = {x = prePosX, y = prePosY}
--        local t = cc.pGetDistance(prePos,touchPos)/500
--        
--        chosenOne:runAction(cc.MoveTo:create(t, touchPos))
--        local angel = -math.atan2(touchPos.y-prePosY,touchPos.x-prePosX)*180/math.pi;
--        chosenOne:setRotation(angel)
--    end
--
--    local listener = cc.EventListenerTouchOneByOne:create()
--    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
--    listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCHES_MOVED )
--    listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
--    local eventDispatcher = currentLayer:getEventDispatcher()
--    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, currentLayer)

    -- schedule
    scheduler:scheduleScriptFunc(update, 0, false)

    scheduleid_1wave=scheduler:scheduleScriptFunc(firstwave_monster,1.5,false)
    return scene
end

function TestAIScene.createBackground()
    local spriteBg = cc.Sprite3D:create("Sprite3DTest/scene/DemoScene.c3b")
    local children = spriteBg:getChildren()
    for key1, var1 in ipairs(children) do
        if key1 ~= 2 then
            var1:setVisible(false)
        else
            for key2, var2 in ipairs(var1:getChildren()) do
                if key2 ~=2 then
                    var2:setVisible(false)
                end
            end
        end
    end

    currentLayer:addChild(spriteBg)
    spriteBg:setScaleX(300)
    spriteBg:setScaleY(100)
    spriteBg:setPosition3D(cc.V3(size.width/2, size.height/2, 0))
    spriteBg:setRotation3D(cc.V3(90,0,0))
end


local function moveCamera(dt)
    if camera then
        local position = cc.pLerp({x=camera:getPositionX(),y=0},{x=getFocusPointOfHeros().x,y=0},2*dt)
        camera:setPositionX(position.x)
        camera:lookAt({x=position.x, y=size.width/2, z=0.0}, {x=0.0, y=1.0, z=0.0})
    end
end

function TestAIScene.setCamera()
    camera = cc.Camera:createPerspective(60.0, size.width/size.height, 1.0, 2000.0)
    camera:setPosition3D(cc.V3(getFocusPointOfHeros().x, getFocusPointOfHeros().y-size.height*1.2, size.width/2))
    camera:lookAt(cc.V3(getFocusPointOfHeros().x, getFocusPointOfHeros().y, 0.0), cc.V3(0.0, 1.0, 0.0))
    currentLayer:addChild(camera)
    scheduler:scheduleScriptFunc(moveCamera,0,false)
end

function TestAIScene.success()
    local successLabel = cc.Label:createWithTTF("Warrior SUCCESS!!!", "fonts/Marker Felt.ttf", 18)
    
    successLabel:setPosition(size.width / 2 - 100, size.height / 2)
    currentLayer:addChild(successLabel)
    
    local spawnAction = cc.Spawn:create(cc.ScaleBy:create(3.0, 3.0), cc.FadeOut:create(3.0))
    local action = cc.Sequence:create(showAction, spawnAction)

    successLabel:runAction(cc.Sequence:create(action, cc.RemoveSelf:create()))
    
    List.removeAll(MonsterManager)
    
    TestAIScene.restore()
    
    TestAIScene.moveForth()
end

function TestAIScene.restore()
    for val = 1, List.getSize(HeroManager) do
       HeroManager[val-1]._blood = 100
       HeroManager[val-1]._isalive = true
       HeroManager[val-1]:setState(EnumStateType.STAND)
       HeroManager[val-1]:setState(EnumStateType.WALK)
    end  
end

function TestAIScene.fail()
    local failLabel = cc.Label:createWithTTF("YOU LOSE!!!", "fonts/Marker Felt.ttf", 18)
    failLabel:setTextColor(cc.c4b(255, 0, 0, 255))
    failLabel:setPosition(size.width / 2 - 100, size.height / 2)
    currentLayer:addChild(failLabel)

    local action = cc.Sequence:create(showAction, cc.ScaleBy:create(3.0, 3.0))

    failLabel:runAction(action)
end

return TestAIScene
