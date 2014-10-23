require "Cocos2d"
require "Helper"
require "GlobalVariables"
require "Knight"

--declare a class extends scene
local ActorTestScene = class("ActorTestScene",function()
    return cc.Scene:create()
end
)
function ActorTestScene:ctor()
    --get win size
    local size = cc.Director:getInstance():getVisibleSize()
    self.lay = cc.Node:create()
    self.act = nil
    self.lay:setPosition(size.width/2, size.height/2-50)
    self:addChild(self.lay)
    self.lay:setRotation3D(cc.V3(-65,0,0))
end

function ActorTestScene.create()
    local scene = ActorTestScene.new()
    --add layer


    local act = Knight:create()
    
    act:idleMode()
    act:setAIEnabled(false)
    
    scene.lay:addChild(act)
    scene:enableTouch()
    scene.act = act
    return scene
end

function ActorTestScene:enableTouch()

    local listener = cc.EventListenerTouchAllAtOnce:create()
    listener:registerScriptHandler(function(touches, event)
        if #touches == 1 then
            local touch = touches[1]
            local delta = touch:getDelta()
            
            local lrot = self.lay:getRotation3D()
            local arot = self.act:getRotation3D()
            self.lay:setRotation3D(cc.V3(lrot.x+delta.y,lrot.y,lrot.z))
            self.act:setRotation3D(cc.V3(arot.x, arot.y, arot.z+delta.x))
        end
    end, cc.Handler.EVENT_TOUCHES_MOVED)
    local eventDispatcher = self:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self)
    
end

return ActorTestScene