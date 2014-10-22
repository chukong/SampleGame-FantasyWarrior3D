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
    self._name = "Mage"
    
    self._attackRange = 666
    
    --normal attack
    self._attackMinRadius = 0
	self._attackMaxRadius = 10
    self._attack = 150
    self._attackAngle = 360
    self._attackKnock = 0
    
    --special Attack
    self._specialMinRadius = 0
    self._specialMaxRadius = 140
    self._specialattack = 150
    self._specialAngle = 360
    self._specialKnock = 100

    self._mass = 500

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
    self:specialAttack()
--    MageNormalAttack.create(getPosTable(self), self._curFacing, self._normalAttack)
end
function Mage:specialAttack()
    --mage will create 3 ice spikes on the ground
    --get 3 positions
    local pos1 = getPosTable(self)
    local pos2 = getPosTable(self)
    local pos3 = getPosTable(self)
    pos1.x = pos1.x+130
    pos2.x = pos2.x+330
    pos3.x = pos3.x+530
    pos1 = cc.pRotateByAngle(pos1, self._myPos, self._curFacing)
    pos2 = cc.pRotateByAngle(pos2, self._myPos, self._curFacing)
    pos3 = cc.pRotateByAngle(pos3, self._myPos, self._curFacing)
    MageIceSpikes.create(pos1, self._curFacing, self._specialAttack)
    local function spike2()
        MageIceSpikes.create(pos2, self._curFacing, self._specialAttack)
    end
    local function spike3()
        MageIceSpikes.create(pos3, self._curFacing, self._specialAttack)
    end
    delayExecute(self,spike2,0.25)
    delayExecute(self,spike3,0.5)

end





function Mage:init3D()
    self:initShadow()
    self._sprite3d = cc.EffectSprite3D:create(file)
    self._sprite3d:setScale(1.9)
    self._sprite3d:addEffect(cc.V3(0,0,0),0.005, -1)
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
        duration = 1.2, -- 0 duration means it will be removed upon calculation
        speed    = 900
    }
    self._specialAttack = {
        minRange = self._specialMinRadius,
        maxRange = self._specialMaxRadius,
        angle    = DEGREES_TO_RADIANS(self._attackAngle),
        knock    = self._specialKnock,
        damage   = self._specialattack,
        mask     = self._racetype,
        duration = 1.3
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