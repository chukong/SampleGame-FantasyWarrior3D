require "GlobalVariables"
require "MessageDispatchCenter"
require "Helper"
require "AttackCommand"

local file = "model/dragon/xiaohuolong_ani_v05.c3b"

Dragon = class("Dragon", function()
    return require "Actor".create()
end)

function Dragon:ctor()
    copyTable(ActorCommonValues, self)
    copyTable(DragonValues,self)
    
    self:init3D()
    self:initActions()
end

function Dragon.create()
    local ret = Dragon.new()
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

function Dragon:normalAttack()
    DragonAttack.create(getPosTable(self), self._curFacing, self._normalAttack)
end

function Dragon:init3D()
    self:initShadow()
    self._sprite3d = cc.EffectSprite3D:create(file)
    self._sprite3d:setTexture("model/dragon/xiaohuolong_body.jpg")
    self._sprite3d:setScale(10)
    self._sprite3d:addEffect(cc.V3(0,0,0),0.005, -1)
    self:addChild(self._sprite3d)
    self._sprite3d:setRotation3D({x = 90, y = 0, z = 0})        
    self._sprite3d:setRotation(-90)
end

-- init Dragon animations=============================
do
    Dragon._action = {
        idle = createAnimation(file,0,24,0.7),
        knocked = createAnimation(file,30,37,0.7),
        dead = createAnimation(file,42,80,1),
        attack1 = createAnimation(file,85,100,0.7),
        attack2 = createAnimation(file,100,115,0.7),
        walk = createAnimation(file,120,140,1),
    }
end
-- end init Dragon animations========================
function Dragon:initActions()
    self._action = Dragon._action
end