require "GlobalVariables"
require "MessageDispatchCenter"
require "Helper"
require "AttackCommand"

local file = "model/slime/slime_ani.c3b"

Slime = class("Slime", function()
    return require "Actor".create()
end)

function Slime:ctor()
    self._useWeaponId = 0
    self._useArmourId = 0
    self._particle = nil
    self._attack = 500  
    self._racetype = EnumRaceType.MONSTER
    self._speed = 500
    self._attackMinRadius = 0
    self._attackMaxRadius = 130
    self._radius = 120
    self._attackRange = 130

    self:init3D()
    self:initActions()
end

function Slime.create()
    local ret = Slime.new()
    ret:initAttackInfo()
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

function Slime:initAttackInfo()
    --build the attack Infos
    self._normalAttack = {
        minRange = self._attackMinRadius,
        maxRange = self._attackMaxRadius,
        angle    = DEGREES_TO_RADIANS(self._attackAngle),
        knock    = self._attackKnock,
        damage   = self._attack,
        mask     = self._racetype,
        duration = 0, -- 0 duration means it will be removed upon calculation
        speed    = 0
    }
    self._specialAttack = {
        minRange = self._attackMinRadius,
        maxRange = self._attackMaxRadius+50,
        angle    = DEGREES_TO_RADIANS(150),
        knock    = self._attackKnock,
        damage   = self._attack,
        mask     = self._racetype,
        duration = 0,
        speed    = 0
    }
end

function Slime:attackUpdate(dt)
    self._attackTimer = self._attackTimer + dt
    if self._attackTimer > self._attackFrequency then
        self._attackTimer = self._attackTimer - self._attackFrequency
        local function playIdle()
            self:playAnimation("idle", true)
            self._cooldown = false
        end
        --time for an attack, which attack should i do?
        local function createCol()
            self:normalAttack()
        end
        local attackAction = cc.Sequence:create(self._action.attack1:clone(),cc.CallFunc:create(createCol),self._action.attack2:clone(),cc.CallFunc:create(playIdle))
        self._sprite3d:stopAction(self._curAnimation3d)
        self._sprite3d:runAction(attackAction)
        self._curAnimation = attackAction
        self._cooldown = true
    end
end
function Slime:_findEnemy()
    local shortest = self._searchDistance
    local target = nil
    local allDead = true
    for val = HeroManager.first, HeroManager.last do
        local temp = HeroManager[val]
        local dis = cc.pGetDistance(self._myPos,getPosTable(temp))
        if temp._isalive then
            if dis < shortest then
                shortest = dis
                target = temp
            end
            allDead = false
        end
    end
    return target, allDead
end

function Slime:init3D()
    self:initShadow()
    self._sprite3d = cc.EffectSprite3D:create(file)
    self._sprite3d:setTexture("model/slime/baozi.jpg")
    self._sprite3d:setScale(17)
    self._sprite3d:addEffect(cc.V3(0,0,0),0.005, -1)
    self:addChild(self._sprite3d)
    self._sprite3d:setRotation3D({x = 90, y = 0, z = 0})        
    self._sprite3d:setRotation(-90)
end

-- init Slime animations=============================
do
    Slime._action = {
        idle = createAnimation(file,0,22,0.7)
    }
end
-- end init Slime animations========================
function Slime:initActions()
    self._action = Slime._action
end