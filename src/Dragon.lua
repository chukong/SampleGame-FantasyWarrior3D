require "GlobalVariables"
require "MessageDispatchCenter"
require "Helper"
require "AttackCommand"

local file = "model/dragon/xiaohuolong_ani_v05.c3b"

Dragon = class("Dragon", function()
    return require "Actor".create()
end)

function Dragon:ctor()
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

function Dragon.create()
    local ret = Dragon.new()
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

function Dragon:initAttackInfo()
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

function Dragon:attackUpdate(dt)
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
function Dragon:_findEnemy()
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

function Dragon:init3D()
    self._sprite3d = cc.EffectSprite3D:create(file)
    self._sprite3d:setTexture("model/dragon/xiaohuolong_body.jpg")
    self._sprite3d:setScale(30)
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