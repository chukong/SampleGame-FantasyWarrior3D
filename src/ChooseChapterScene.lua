require "Cocos2d"
require "Cocos2dConstants"

local ChooseChapter = class("ChooseChapter",
    function ()
        return cc.Scene:create()
end)

function ChooseChapter:ctor()
    self.size = cc.Director:getInstance():getWinSize()
end

function ChooseChapter:create()
    local scene = ChooseChapter:new()
    --add layer
    scene:addElement()

    return scene
end

function ChooseChapter:addElement()
    local bg = cc.Sprite:create("choosechapterscene/background.jpg")
    bg:setPosition({x=self.size.width/2,y=self.size.height/2})
    self:addChild(bg)
--    self:addBg()

    -- add hero
    self:addHero()
    
    --test 3D camera
--    self:testJump3D()
    
    --addCamera
    self:addCamera()
    self:setCameraMask(2)
end

function ChooseChapter:testJump3D()
    local hero = require("Hero3D").create(0)
    hero:setRotation3D({x=0,y=0,z=-180})
    hero:setScale(10)
    hero:setPosition3D({x=self.size.width*0.65, y=self.size.height*0.01,z=10})
    
    local action = cc.JumpBy3D:create(2,{x=100,y=400,z=10},100,3)
    local reverse = action:reverse()
    local clone = action:clone()
    
    local jumpTo = cc.JumpTo3D:create(2,{x=self.size.width*0.65, y=self.size.height*0.01,z=10},100,4)
    local cloneJump = jumpTo:clone()
    
    hero:runAction(cc.Sequence:create(action,reverse,clone,jumpTo,cloneJump)) 
    
    self:addChild(hero)
end

--add camera
function ChooseChapter:addCamera()
    --add camera
    local camera = cc.Camera:createPerspective(60,self.size.width/self.size.height,1,1000)
    local point = self._hero:getPosition3D()
    camera:setPosition3D({x=point.x,y=-point.y-300,z=250+point.z})
    camera:lookAt(point,{x=0,y=1,z=0})
    camera:setCameraFlag(2)
    self:addChild(camera)
    
    --camera follow
    local function cameraFollow(dt)
        local offset = self._hero:getPositionX()-self._prePosition
        local point = cc.pLerp({x=camera:getPositionX(),y=0},{x=self._hero:getPositionX(),y=0},2*dt)
        camera:setPositionX(point.x)
        
        camera:lookAt({x=point.x, y=self._hero:getPositionY(),z=0},{x=0,y=1,z=0})
        self._prePosition = self._hero:getPositionX()
    end   
    self.scheduleID = cc.Director:getInstance():getScheduler():scheduleScriptFunc(cameraFollow,0,false)
end

--add hero 
function ChooseChapter:addHero()
    --add hero
    local hero = require("Hero3D").create(0)
    hero:setRotation3D({x=0,y=0,z=0})
    hero:setScale(10)
    hero:setPosition3D({x=self.size.width*0.95, y=self.size.height*0.15,z=10}) 
    self:addChild(hero)
    self._hero = hero
    self._prePosition = hero:getPositionX()
    
    --action   
    local controlPoint = {{x=0,y=0},
        {x=-self.size.width*0.25,y=-self.size.height*0.18},
        {x=-self.size.width*0.5,y=-self.size.height*0.06},
        {x=-self.size.width*0.58,y=self.size.height*0.07},
        {x=-self.size.width*0.59,y=self.size.height*0.17},
        {x=-self.size.width*0.73,y=self.size.height*0.28}}
    local cardinalSpline = cc.CardinalSplineBy:create(3,controlPoint,0)
--    hero:runAction(cardinalSpline)

    --test billboard
    local dropBlood = require("DropBlood"):create()
    dropBlood:setPosition3D({x=0,y=0,z=0})
    hero:addChild(dropBlood)
    
    local dispatch = require("MessageDispatchCenter")
    local offset = 1
    local function schedule_function()
--        hero:setRotation3D({x=0,y=0,z=offset})
--        offset = offset+1
    end
    cc.Director:getInstance():getScheduler():scheduleScriptFunc(schedule_function,0,false)

    local function schedule_function2()
        local num = math.random(0,300)
        dispatch:dispatchMessage(dispatch.MessageType.BLOOD_DROP,num)
    end
    cc.Director:getInstance():getScheduler():scheduleScriptFunc(schedule_function2,1,false)
end

return ChooseChapter