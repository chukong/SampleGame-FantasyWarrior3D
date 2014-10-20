require "GlobalVariables"
require "MessageDispatchCenter"
require "Helper"
require "AttackCommand"

local file = "model/piglet/piglet.c3b"

Dragon = class("Dragon", function()
    return require "Actor".create()
end)

function Dragon:ctor()
    self._useWeaponId = 0
    self._useArmourId = 0
    self._particle = nil
    self._attack = 800  
    self._racetype = EnumRaceType.DRAGON
    self._speed = 500
    
    self:init3D()
    self:initActions()
end

function Dragon.create()
    local ret = Dragon.new()

    --=====Testing block
    function test()
        ret:walkMode()
        --        ret._targetFacing = DEGREES_TO_RADIANS(120)
        ret._AIEnabled = true
    end
    function test2()
        ret:idleMode()
        ret._targetFacing = 0
    end
    function test3()
        ret:attackMode()
    end
    function test4()
        ret:knockMode({x=-1000,y=00}, 150)
    end

    delayExecute(ret,test,0.5)

    --    delayExecute(ret,test2,2.5)
    --    delayExecute(ret,test,3.5)
    --    delayExecute(ret,test3,4.5)
    --=====testing block

    --this update function do not do AI
    function update(dt)
        ret:baseUpdate(dt)
        ret:stateMachineUpdate(dt)
        ret:movementUpdate(dt)
    end
    ret:scheduleUpdateWithPriorityLua(update, 0.5) 
    return ret
end

function Dragon:init3D()
    self._sprite3d = cc.EffectSprite3D:create(file)
    self._sprite3d:setTexture("model/piglet/zhu0928.jpg")
    self._sprite3d:setScale(2)
    self._sprite3d:addEffect(cc.V3(0,0,1),0.01, -1)
    self:addChild(self._sprite3d)
    self._sprite3d:setRotation3D({x = 90, y = 0, z = 0})        
    self._sprite3d:setRotation(-90)
end

-- init Dragon animations=============================
do
    Dragon._action = {
        idle = createAnimation(file,0,40,0.7),
        walk = createAnimation(file,135,147,0.5),
        attack1 = createAnimation(file,45,75,0.7),
--        attack2 = createAnimation(file,130,154,0.7),
--        specialattack1 = createAnimation(file,160,190,0.3),
--        specialattack2 = createAnimation(file,191,220,0.4),
        defend = createAnimation(file,92,96,0.7),
        knocked = createAnimation(file,81,87,0.7),
        dead = createAnimation(file,95,127,1)
    }
end
-- end init Dragon animations========================
function Dragon:initActions()
    self._action = Dragon._action
end