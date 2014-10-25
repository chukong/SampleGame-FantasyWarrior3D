require "GlobalVariables"
require "MessageDispatchCenter"
require "Helper"
require "AttackCommand"

local file = "model/rat/rat.c3b"

Rat = class("Rat", function()
    return require "Actor".create()
end)

function Rat:ctor()
    copyTable(ActorCommonValues, self)
    copyTable(RatValues,self)

    self:init3D()
    self:initActions()
end

function Rat:reset()
    copyTable(ActorCommonValues, self)
    copyTable(RatValues,self)
    self:walkMode()
    self:setPositionZ(0)
end

function Rat.create()
    local ret = Rat.new()
    ret._AIEnabled = true

    --this update function do not do AI
    function update(dt)
        ret:baseUpdate(dt)
        ret:stateMachineUpdate(dt)
        ret:movementUpdate(dt)
    end
    ret:scheduleUpdateWithPriorityLua(update, 0.5) 
    return ret
end

function Rat:init3D()
    self:initShadow()
    self._sprite3d = cc.EffectSprite3D:create(file)
    self._sprite3d:setScale(10)
    self._sprite3d:addEffect(cc.V3(0,0,0),CelLine, -1)
    self:addChild(self._sprite3d)
    self._sprite3d:setRotation3D({x = 90, y = 0, z = 0})        
    self._sprite3d:setRotation(-90)
end

-- init Rat animations=============================
do
    Rat._action = {
        idle = createAnimation(file,0,23,0.7),
        knocked = createAnimation(file,30,37,0.7),
        dead = createAnimation(file,41,76,1),
        attack1 = createAnimation(file,81,99,0.7),
        attack2 = createAnimation(file,99,117,0.7),
        walk = createAnimation(file,122,142,0.7)
    }
end
-- end init Rat animations========================
function Rat:initActions()
    self._action = Rat._action
end