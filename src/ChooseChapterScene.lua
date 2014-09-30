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
    -- add bg
--    local bg = cc.Sprite3D:create("Sprite3DTest/scene/DemoScene.c3b")
--    bg:setScale(60)
--    bg:setRotation3D({x=0,y=180,z=0})
--    bg:setPosition3D({x=self.size.width/2,y=0,z=0})
--    self:addChild(bg,0)
    local bg = cc.Sprite:create("activate_background.jpg")
    bg:setPosition({x=self.size.width/2,y=self.size.height/2})
    self:addChild(bg)
--    self:addBg()

    -- add hero
    self:addHero()

    --addCamera
    self:addCamera()
    self:setCameraMask(2)
end

function ChooseChapter:addBg()
     local line = cc.DrawNode3D:create()
    --draw x
    for j=-20,200 do
        line:drawLine({x=-100,y=0,z=10*j},{x=100,y=0,z=10*j},{r=1,g=0,b=0,a=1})
    end
    
    for j=-20,200 do
        line:drawLine({x=10*j,y=0,z=-100},{x=10*j,y=0,z=100},{r=0,g=0,b=1,a=1})
    end
    line:drawLine({x=0,y=-50,z=0},{x=0,y=0,z=0},{r=0,g=0.5,b=0,a=1})
    line:drawLine({x=0,y=0,z=0},{x=0,y=50,z=0},{r=0,g=1,b=0,a=1})
--    line:setPosition3D({x=self.size.width/2,y=self.size.height/2,z=0})
--    line:setPositionX(self.size.width/2)r
    self:addChild(line)
end

--add camera
function ChooseChapter:addCamera()
    --add camera
    local camera = cc.Camera:createPerspective(60,self.size.width/self.size.height,1,1000)
    local point = self._hero:getPosition3D()
    camera:setPosition3D({x=point.x,y=-point.y-300,z=100+point.z})
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
    hero:setPosition({x=self.size.width*0.95, y=self.size.height*0.15})   
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
    hero:runAction(cardinalSpline)
end


return ChooseChapter