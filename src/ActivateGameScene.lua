require "Cocos2d"
require "Cocos2dConstants"

local ActivateGame = class("ActivateGame",
function ()
    return cc.Scene:create()
end
)

function ActivateGame:ctor()
    self.size = cc.Director:getInstance():getWinSize()
end

function ActivateGame:create()
    local activate = ActivateGame:new()
    --add layer
    local layer = activate:createLayer()
    activate:addChild(layer)
    
    return activate
end

function ActivateGame:createLayer()
    local layer = cc.Layer:create()
    
    -- add bg
    local bg = cc.Sprite:create("activate_background.jpg")
    bg:setPosition(self.size.width/2,self.size.height/2)
    layer:addChild(bg,0)
    
    -- add hero
    self:addHero(layer)
    
    --addCamera
--    self:addCamera(layer)
--    layer:setCameraMask(2)

    return layer
end

--add camera
function ActivateGame:addCamera(layer)
    --add camera
    local camera = cc.Camera:createPerspective(60,self.size.width/self.size.height,1,1000)
    camera:setPosition3D({x=0,y=10,z=10})
    camera:lookAt(self._hero:getPosition3D(),{x=0,y=1,z=0})
    camera:setCameraFlag(2)
    layer:addChild(camera)
    
    
end

--add hero
function ActivateGame:addHero(layer)
    --add hero
    local hero = require("Hero").create(0)
    hero:setScale(2.0)
    hero:setRotation3D({x=0,y=-60,z=0})
    hero:setPosition({x=self.size.width*0.95, y=self.size.height*0.15})   
    layer:addChild(hero)
    self._hero = hero

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
        
  
return ActivateGame
