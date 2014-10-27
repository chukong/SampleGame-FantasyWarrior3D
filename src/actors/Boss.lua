require "GlobalVariables"
require "MessageDispatchCenter"
require "Helper"
require "AttackCommand"

local file ="model/boss/boss.c3b"

Boss = class("Boss", function()
    return require "Actor".create()
end)

function Boss:ctor()
    copyTable(ActorCommonValues, self)
    copyTable(BossValues,self)

    self:init3D()
    self:initActions()
end

function Boss:reset()
    copyTable(ActorCommonValues, self)
    copyTable(BossValues,self)
    self:walkMode()
    self:setPositionZ(0)
end

function Boss.create()
    local ret = Boss.new()
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

function Boss:init3D()
    self:initShadow()
    self._sprite3d = cc.EffectSprite3D:create(file)
    self._sprite3d:setScale(15)
    self._sprite3d:addEffect(cc.V3(0,0,0),CelLine, -1)
    self:addChild(self._sprite3d)
    self._sprite3d:setRotation3D({x = 90, y = 0, z = 0})        
    self._sprite3d:setRotation(-90)
end

-- init Rat animations=============================
do
    Boss._action = {
        idle = createAnimation(file,0,23,0.7),
        knocked = createAnimation(file,30,37,0.7),
        dead = createAnimation(file,41,76,1),
        attack1 = createAnimation(file,81,99,0.7),
        attack2 = createAnimation(file,99,117,0.7),
        walk = createAnimation(file,122,142,0.7)
    }
end
-- end init Rat animations========================
function Boss:initActions()
    self._action = Boss._action
end