require "Cocos2d"
require "Helper"
require "Manager"
require "MessageDispatchCenter"

currentLayer = nil
uiLayer = nil
local gameMaster = nil
local specialCamera = {valid = false, position = cc.p(0,0)}
local size = cc.Director:getInstance():getWinSize()
local scheduler = cc.Director:getInstance():getScheduler()



local function moveCamera(dt)
    --cclog("moveCamera")
    if camera == nil then return end

    local cameraPosition = getPosTable(camera)
    if specialCamera.valid == true then
        --local position = cc.pRotateByAngle(cameraPosition, cc.p(specialCamera.position.x, -size.height/2), -360/60/2*dt)
        local position = cc.pLerp(cameraPosition, cc.p(specialCamera.position.x, -size.height/2), 5*dt)
        camera:setPosition(position)
        camera:lookAt(cc.V3(position.x, specialCamera.position.y, 50.0), cc.V3(0.0, 0.0, 1.0))
    elseif List.getSize(HeroManager) > 0 then
        local position = cc.pLerp(cameraPosition, cc.p(getFocusPointOfHeros().x + size.width/5, getFocusPointOfHeros().y - size.height), 2*dt)
        camera:setPosition(position)
        camera:lookAt(cc.V3(position.x, size.height/2, 50.0), cc.V3(0.0, 1.0, 0.0))
    end
end

local function updateParticlePos()
    --cclog("updateParticlePos")
    for val = HeroManager.first, HeroManager.last do
        local sprite = HeroManager[val]
        if sprite._particle ~= nil then        
            sprite._particle:setPosition(getPosTable(sprite))
        end
    end
end

local function createBackground()
    local spriteBg = cc.Sprite3D:create("model/scene1.c3b", "model/zhenghe.png")

    currentLayer:addChild(spriteBg)
    spriteBg:setScale(2.65)
    --spriteBg:setGlobalZOrder(-9)
    spriteBg:setPosition3D(cc.V3(-1000,350,0))
    spriteBg:setRotation3D(cc.V3(90,0,0))
        
    local water = cc.Water:create("shader3D/water.png", "shader3D/wave1.png", "shader3D/18.jpg", {width=5000, height=400}, 0.77, 0.3797, 1.2)
    currentLayer:addChild(water)
    water:setPosition3D(cc.V3(-3500,-400,-35))
    water:setAnchorPoint(0,0)
    water:setGlobalZOrder(0)
    
end

local function setCamera()
    camera = cc.Camera:createPerspective(60.0, size.width/size.height, 10.0, 4000.0)
    camera:setPosition3D(cc.V3(getFocusPointOfHeros().x, getFocusPointOfHeros().y-size.height, size.height/2-100))
    camera:lookAt(cc.V3(getFocusPointOfHeros().x, getFocusPointOfHeros().y, 0.0), cc.V3(0.0, 1.0, 0.0))
    currentLayer:addChild(camera)
    camera:setGlobalZOrder(10)
    
    for val = HeroManager.first, HeroManager.last do
        local sprite = HeroManager[val]
        if sprite._particle then
            sprite._particle:setCamera(camera)
        end
    end      
    
    camera:addChild(uiLayer)
end

local function gameController(dt)
    collisionDetect(dt)
    solveAttacks(dt)
    moveCamera(dt)
    updateParticlePos()
    gameMaster:update(dt)
end

local function initUILayer()
    uiLayer = require("BattleFieldUI").create()

    uiLayer:setPositionZ(-cc.Director:getInstance():getZEye()/3)
    uiLayer:setScale(0.333)
    uiLayer:ignoreAnchorPointForPosition(false)
    uiLayer:setGlobalZOrder(3000)
end

local BattleScene = class("BattleScene",function()
    return cc.Scene:create()
end)

local function sendDropBlood(heroActor)
    if heroActor._racetype == EnumRaceType.KNIGHT or heroActor._racetype == EnumRaceType.ARCHER or heroActor._racetype == EnumRaceType.MAGE then    
        uiLayer:bloodDrop(heroActor)
    end
end

local function specialPerspective(position)
    if specialCamera.valid == true then return end
    
    specialCamera.valid = true
    specialCamera.position = position
    cc.Director:getInstance():getScheduler():setTimeScale(0.1)

    local function restoreTimeScale()
        specialCamera.valid = false
        cc.Director:getInstance():getScheduler():setTimeScale(1.0)
    end
    delayExecute(currentLayer, restoreTimeScale, 0.5)      
      
end

function BattleScene.create()
    local scene = BattleScene:new()
    currentLayer = cc.Layer:create()
    scene:addChild(currentLayer)
    
    createBackground()
    initUILayer()
    gameMaster = require("GameMaster").create()
    setCamera()
    scheduler:scheduleScriptFunc(gameController, 0, false)

    MessageDispatchCenter:registerMessage(MessageDispatchCenter.MessageType.BLOOD_DROP, sendDropBlood)
    MessageDispatchCenter:registerMessage(MessageDispatchCenter.MessageType.SPECIAL_PERSPECTIVE,specialPerspective)

    return scene
end

return BattleScene
