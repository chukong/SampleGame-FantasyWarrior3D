require "GlobalVariables"
require "MessageDispatchCenter"
require "Helper"
require "AttackCommand"

local file = "model/mage/mage.c3b"

Mage = class("Mage", function()
    return require "Actor".create()
end)

function Mage:ctor()
    self._useWeaponId = 0
    self._useArmourId = 0
    self._particle = nil
    self._racetype = EnumRaceType.HERO
    self._attackFrequency = 4.7
    self._AIFrequency = 1.3
    
    self._attackRange = 500
    
    --normal attack
    self._attackMinRadius = 0
	self._attackMaxRadius = 5
    self._attack = 300
    self._attackAngle = 360
    self._attackKnock = 0



    self:init3D()
    self:initActions()
end

function Mage.create()
    local ret = Mage.new()
    ret:idleMode()
    ret._AIEnabled = true
    --this update function do not do AI
    function update(dt)
        ret:baseUpdate(dt)
        ret:stateMachineUpdate(dt)
        ret:movementUpdate(dt)
    end
    ret:initAttackInfo()
    ret:scheduleUpdateWithPriorityLua(update, 0) 
    return ret
end
function Mage:normalAttack()
    MageNormalAttack.create(getPosTable(self), self._curFacing, self._normalAttack)
end





function Mage:init3D()
    self._sprite3d = cc.EffectSprite3D:create(file)
    self._sprite3d:setScale(1.9)
    self._sprite3d:addEffect(cc.V3(1,0,0),0.01, -1)
    self:addChild(self._sprite3d)
    self._sprite3d:setRotation3D({x = 90, y = 0, z = 0})        
    self._sprite3d:setRotation(-90)
end
function Mage:initAttackInfo()
    --build the attack Infos
    self._normalAttack = {
        minRange = self._attackMinRadius,
        maxRange = self._attackMaxRadius,
        angle    = DEGREES_TO_RADIANS(self._attackAngle),
        knock    = self._attackKnock,
        damage   = self._attack,
        mask     = self._racetype,
        duration = 3, -- 0 duration means it will be removed upon calculation
        speed    = 500
    }
    self._specialAttack = {
        minRange = self._attackMinRadius,
        maxRange = self._attackMaxRadius+50,
        angle    = DEGREES_TO_RADIANS(150),
        knock    = self._attackKnock,
        damage   = self._attack,
        mask     = self._racetype,
        duration = 3,
        speed    = 500
    }
end


-- init Mage animations=============================
do
    Mage._action = {
        idle = createAnimation(file,206,229,0.7),
        walk = createAnimation(file,99,119,0.7),
        attack1 = createAnimation(file,12,30,0.7),
        attack2 = createAnimation(file,31,49,0.7),
        specialattack1 = createAnimation(file,56,74,0.2),
        specialattack2 = createAnimation(file,75,92,0.2),
        defend = createAnimation(file,1,5,0.7),
        knocked = createAnimation(file,126,132,0.7),
        dead = createAnimation(file,139,199,0.7)
    }
end
-- end init Mage animations========================
function Mage:initActions()
    self._action = Mage._action
end