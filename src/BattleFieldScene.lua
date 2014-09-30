require "Helper"
require "Base3D"
require "Hero3D"
require "Monster3D"
require "Boss3D"
require "Manager"

local size = cc.Director:getInstance():getWinSize()
local scheduler = cc.Director:getInstance():getScheduler()
local gloableZOrder = 1
local camera = nil 
local touchPos = nil
local beginUpdate = false
local chosenOne = nil
local currentLayer = nil

local function isOutOfBound(object)
    local currentPos = cc.p(object:getPosition());
    local state = false;

    if currentPos.x < 0 then
        currentPos.x = 0
        state = true
        beginUpdate = false
    end    

    if currentPos.x > size.width then
        currentPos.x = size.width
        state = true
        beginUpdate = false
    end

    if currentPos.y < 0 then
        currentPos.y = 0
        state = true
        beginUpdate = false
    end

    if currentPos.y > size.height then
        currentPos.y = size.height
        state = true
        beginUpdate = false
    end

    object:setPosition(currentPos)
    return state
end

local function collisionDetect()
    for val = 1, List.getSize(HeroManager) do
        local sprite = HeroManager[val-1]
        if sprite._isalive == true then
            collisionDetectHero(sprite)
            isOutOfBound(sprite)            
        end
    end
    
    for val = 1, List.getSize(MonsterManager) do
        local sprite = MonsterManager[val-1]
        if sprite._isalive == true then
            collisionDetectHero(sprite)
            isOutOfBound(sprite)            
        end
    end    
    
    for val = 1, List.getSize(BossManager) do
        local sprite = BossManager[val-1]
        if sprite._isalive == true then
            collisionDetectHero(sprite)
            isOutOfBound(sprite)            
        end
    end        
    
end

local function update(dt)
    collisionDetect()

    if chosenOne == 0 then return end

    --change camera angle
    if beginUpdate then
        local position = chosenOne:getPosition3D()
        local dir = cc.V3Sub(touchPos, position) 
        cc.V3Normalize(dir)
        local dp = cc.V3MulEx(dir, 5.0*dt)
        local endPos = cc.V3Add(position, dp)
        if cc.V3LengthSquared(cc.V3Sub(endPos, touchPos)) <= cc.V3LengthSquared(dp) then
            if cc.V3Dot(cc.V3Sub(endPos, touchPos), dir) then
                endPos = touchPos
                beginUpdate = false
            end
        end

        --if endPos.y < 0 then endPos.y = 0 end

        chosenOne:setPosition3D(endPos)
        local aspect = cc.V3Dot(dir, cc.V3(0.0, 0.0, 1.0))
        aspect = math.acos(aspect)
        if dir.x < 0.0 then aspect = -aspect end 
               
        local roate3d = cc.V3(0.0, aspect * 57.29577951 +180.0, 0.0)
        chosenOne._sprite3d:setRotation3D(roate3d)
--        local aaaaa = math.deg(roate3d.y)
--        chosenOne:getChildByTag(1):setRotation3D(cc.V3(0, 0, aaaaa))
        --cclog("%.2f %.2f %.2f", roate3d.x, roate3d.y, roate3d.z)
        
        if camera then
            local position = chosenOne:getPosition3D()
            camera:lookAt(position, cc.V3(0.0, 1.0, 0.0))
            camera:setPosition3D(cc.V3Add(position, cc.V3(0.0, 10.0, 10.0)))
        end
    end
end


local function addNewSprite(x, y, tag)
    local sprite = nil
    local animation = nil
    if tag == EnumRaceType.DEBUG then
        sprite = Hero3D.create(EnumRaceType.DEBUG)
        sprite._sprite3d:setScale(5)
        List.pushlast(HeroManager, sprite)
    elseif tag == EnumRaceType.MONSTER then
        sprite = Monster3D.create(EnumRaceType.MONSTER)   
        sprite._sprite3d:setScale(5)
        List.pushlast(MonsterManager, sprite)
        sprite._sprite3d:addEffect(cc.V3(1,0,0),0.01, -1)
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
end

local function createRole()
 
    addNewSprite(size.width/2, size.height/2, EnumRaceType.DEBUG)
    addNewSprite(size.width/2 - 200, size.height/2, EnumRaceType.DEBUG)
    addNewSprite(size.width/2 - 100, size.height/2 + 50, EnumRaceType.DEBUG)
    
    addNewSprite(size.width/2-200, size.height/2-200, EnumRaceType.MONSTER)
    addNewSprite(size.width/2-300, size.height/2-200, EnumRaceType.MONSTER)
    addNewSprite(size.width/2-300, size.height/2-100, EnumRaceType.MONSTER)
    addNewSprite(size.width/2+300, size.height/2-100, EnumRaceType.BOSS)

    chosenOne = findAliveHero() --Assume it is the selected people
    --chosenOne = findAliveBoss() --Assume it is the selected people
end

local BattleFieldScene = class("BattleFieldScene",function()
    return cc.Scene:create()
end)

function BattleFieldScene.create()
    local scene = BattleFieldScene:new()
    currentLayer = cc.Layer:create()
    scene:addChild(currentLayer)

    BattleFieldScene.createBackground()
    BattleFieldScene.setCamera()
    createRole()

    --button
    local function touchEvent_return(sender,eventType)
        if eventType == ccui.TouchEventType.ended then
            local scene = require("ChooseRoleScene")
            cc.Director:getInstance():replaceScene(scene.create())
        end
    end  

    local return_Button = ccui.Button:create()
    return_Button:setTouchEnabled(true)
    return_Button:loadTextures("btn_circle_normal.png", "btn_circle_normal.png", "")
    return_Button:setTitleText("Return")
    return_Button:setAnchorPoint(0,1)

    return_Button:setPosition(size.width / 2 - 300, size.height  - 200)
    return_Button:addTouchEventListener(touchEvent_return)        
    currentLayer:addChild(return_Button, 10)
    return_Button:setScale(0.5)

    local function battle_success(event)
        BattleFieldScene.success()
    end

    local function battle_fail(event)
        BattleFieldScene.fail()
    end    

    local listener1 = cc.EventListenerCustom:create("battle_success", battle_success)
    local eventDispatcher = currentLayer:getEventDispatcher()
    eventDispatcher:addEventListenerWithFixedPriority(listener1, 1)

    local listener2 = cc.EventListenerCustom:create("battle_fail", battle_fail)
    eventDispatcher:addEventListenerWithFixedPriority(listener2, 2)    

    -- handling touch events   
    local function onTouchBegan(touch, event)
        return true
    end

    local function onTouchMoved(touches, event)     
    end    

    local function onTouchEnded(touch, event)
        if touch == nil then return end

        local location = touch:getLocationInView()
        cclog("%f %f", location.x, location.y)
        local nearP = cc.V3(location.x, location.y, -1.0)
        local farP = cc.V3(location.x, location.y, 1.0)
        nearP = camera:unproject(size, nearP, nearP)
        farP = camera:unproject(size, farP, farP)

        local dir = cc.V3Sub(farP, nearP)
        local dist = 0.0
        local temp = cc.V3(0.0, 0.0, 1.0)
        local ndd = cc.V3Dot(temp, dir)

        if ndd == 0 then dist = 0.0 end

        local ndo = cc.V3Dot(temp, nearP)
        dist = (0 - ndo) / ndd

        local tt = cc.V3MulEx(dir, dist)
        touchPos =  cc.V3Add(nearP, tt)

        chosenOne:runAction(cc.MoveTo:create(0.5, touchPos))
        --beginUpdate = true;          
    end

    local listener = cc.EventListenerTouchOneByOne:create()
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCHES_MOVED )
    listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
    local eventDispatcher = currentLayer:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, currentLayer)

    scheduler:scheduleScriptFunc(update, 0, false)

    return scene
end

function BattleFieldScene.createBackground()
    local spriteBg = cc.Sprite3D:create("Sprite3DTest/scene/DemoScene.c3b")
    local children = spriteBg:getChildren()
    for key1, var1 in ipairs(children) do
        if key1 ~= 2 then
            var1:setVisible(false)
        else
            for key2, var2 in ipairs(var1:getChildren()) do
                print(key2)
                if key2 ~=2 then
                    var2:setVisible(false)
                end
            end
        end
    end

    currentLayer:addChild(spriteBg)
    spriteBg:setScale(40)
    spriteBg:setPosition3D(cc.V3(size.width/2, size.height/2, 0))
    spriteBg:setRotation3D(cc.V3(90,0,0))
end

function BattleFieldScene.setCamera()
    camera = cc.Camera:createPerspective(60.0, size.width/size.height, 1.0, 2000.0)
    camera:setPosition3D(cc.V3(size.width/2, -size.height/2, size.width/2))
    camera:lookAt(cc.V3(size.width/2, size.height/2, 0.0), cc.V3(0.0, 1.0, 0.0))
    currentLayer:addChild(camera)  
end

function BattleFieldScene.success()
    local successLabel = cc.Label:createWithTTF("Warrior SUCCESS!!!", "fonts/Marker Felt.ttf", 18)
    
    successLabel:setPosition(size.width / 2 - 100, size.height / 2)
    currentLayer:addChild(successLabel)
    
    local spawnAction = cc.Spawn:create(cc.ScaleBy:create(3.0, 3.0), cc.FadeOut:create(3.0))
    local action = cc.Sequence:create(showAction, spawnAction)

    successLabel:runAction(cc.Sequence:create(action, cc.RemoveSelf:create()))
    
    List.removeAll(MonsterManager)
    
    BattleFieldScene.restore()
    
    BattleFieldScene.moveForth()    
end

function BattleFieldScene.restore()
    for val = 1, List.getSize(HeroManager) do
       HeroManager[val-1]._blood = 100
       HeroManager[val-1]._isalive = true
       HeroManager[val-1]:setState(EnumStateType.STAND)
       HeroManager[val-1]:setState(EnumStateType.WALK)
    end  
end

function BattleFieldScene.fail()
    local failLabel = cc.Label:createWithTTF("YOU LOSE!!!", "fonts/Marker Felt.ttf", 18)
    failLabel:setTextColor(cc.c4b(255, 0, 0, 255))
    failLabel:setPosition(size.width / 2 - 100, size.height / 2)
    currentLayer:addChild(failLabel)

    local action = cc.Sequence:create(showAction, cc.ScaleBy:create(3.0, 3.0))

    failLabel:runAction(action)
end


return BattleFieldScene
