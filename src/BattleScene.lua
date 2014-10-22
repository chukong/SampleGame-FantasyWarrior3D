require "Cocos2d"
require "Helper"
require "Manager"
require "MessageDispatchCenter"

currentLayer = nil
local currentStep = 1
uiLayer = nil
local gameMaster = nil

local size = cc.Director:getInstance():getWinSize()
local scheduler = cc.Director:getInstance():getScheduler()



local function moveCamera(dt)
    --cclog("moveCamera")
    if camera and List.getSize(HeroManager) > 0 then
        local position = cc.pLerp({x=camera:getPositionX(),y=0},{x=getFocusPointOfHeros().x+size.width/5,y=0},2*dt)
        camera:setPositionX(position.x)
        camera:lookAt({x=position.x, y=size.width/2, z=0.0}, {x=0.0, y=1.0, z=0.0})
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
    water:setGlobalZOrder(-9)
    
end

local function setCamera()
    camera = cc.Camera:createPerspective(60.0, size.width/size.height, 10.0, 4000.0)
    camera:setPosition3D(cc.V3(getFocusPointOfHeros().x, getFocusPointOfHeros().y-size.height*1.3, size.height/2-30))
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

    uiLayer:setPositionZ(-cc.Director:getInstance():getZEye()/2)
    uiLayer:setScale(0.5)
    uiLayer:ignoreAnchorPointForPosition(false)
    uiLayer:setLocalZOrder(999)
end

local BattleScene = class("BattleScene",function()
    return cc.Scene:create()
end)

--dropValuePercent is the dropValue/bloodValue*100
function BattleScene.sendDropBlood(blood)
    if blood._racetype == EnumRaceType.KNIGHT or blood._racetype == EnumRaceType.ARCHER or blood._racetype == EnumRaceType.MAGE then    
        uiLayer:bloodDrop(blood)
    end
end

function BattleScene.create()
    local scene = BattleScene:new()
    currentLayer = cc.Layer:create()
    scene:addChild(currentLayer)
    
    createBackground()
    gameMaster = require("GameMaster").create()
    initUILayer()
    setCamera()
    scheduler:scheduleScriptFunc(gameController, 0, false)

    MessageDispatchCenter:registerMessage(MessageDispatchCenter.MessageType.BLOOD_DROP,BattleScene.sendDropBlood)

    return scene
end

return BattleScene
