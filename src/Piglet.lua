require "GlobalVariables"
require "MessageDispatchCenter"
require "Helper"
require "AttackCommand"

local file = "model/piglet/zhu_ani_v05.c3b"

Piglet = class("Piglet", function()
    return require "Actor".create()
end)

function Piglet:ctor()
    self._useWeaponId = 0
    self._useArmourId = 0
    self._particle = nil
    self._attack = 150  
    self._racetype = EnumRaceType.MONSTER
    self._speed = 400
    self._attackMinRadius = 0
    self._attackMaxRadius = 130
    self._radius = 50
    self._attackRange = 130
    
    self._attackMaxRadius = 130
    self._attackAngle = 30
    self._attackKnock = 50
    
    self._goRight = false
    
    self:init3D()
    self:initActions()
end

function Piglet:reset()
    self._priority = self._speed
    self._racetype = EnumRaceType.MONSTER
    self._statetype = nil
    self._attackZone = nil
    self._scheduleAttackId = 0

    --state variables
    self._aliveTime = 0
    self._curSpeed = 0
    self._curAnimation = nil
    self._curAnimation3d = nil
    self._curFacing = 0 --angle in radians, 0 is to the right, value is CCW, _curFacing is where t
    self._newAnimation = nil
    self._hp = 1000
    self._isalive = true
    self._elapseBlendTime = 0
    self._AITimer = 0
    self._AIEnabled = false
    self._attackTimer = 0
    self._timeKnocked = nil
    self._cooldown = false

    --constant variables
    self._blendTime = 0.4
    self._maxhp = 1000
    self._defense = 100
    self._radius = 50
    self._speed = 500 --500units a second maximum
    self._turnSpeed = DEGREES_TO_RADIANS(225) --180 degrees a second
    self._acceleration = 750 --accelerates to 500 in a second
    self._decceleration = 750*1.5 --stopping should be slightly faster than starting
    self._goRight = true
    self._AIFrequency = 1.0 --how often AI executes in seconds
    self._attackFrequency = 4.0 --an attack move every few seconds
    self._specialAttackChance = 0.33
    self._shadowSize = 70
    self._normalAttack = nil
    self._specialAttack = nil
    self._recoverTime = 0.8
    self._searchDistance = 5000 --distance which enemy can be found
    self._attackRange = 100

    --normal attack
    self._attackMinRadius = 0
    self._attackMaxRadius = 130
    self._attack = 100
    self._attackAngle = 30
    self._attackKnock = 50

    --target variables
    self._targetFacing = 0
    self._target = nil

    --overrite.
    self._useWeaponId = 0
    self._useArmourId = 0
    self._particle = nil
    self._attack = 150  
    self._racetype = EnumRaceType.MONSTER
    self._speed = 400
    self._attackMinRadius = 0
    self._attackMaxRadius = 130
    self._radius = 50
    self._attackRange = 130

    self._attackMaxRadius = 130
    self._attackAngle = 30
    self._attackKnock = 50

    self._goRight = false

-----
    self._goRight = false
    self._isalive = true
    self._maxhp = 1000
    self:walkMode()
    self._AIEnabled = true
    self._target = nil
    self._cooldown = 0
    self:setPositionZ(0)
    
    self:initAttackInfo()
end

function Piglet.create()
    local ret = Piglet.new()
    ret:initAttackInfo()
    ret._AIEnabled = true

    --this update function do not do AI
    function update(dt)
        ret:baseUpdate(dt)
        ret:stateMachineUpdate(dt)
        ret:movementUpdate(dt)
    end
    ret:scheduleUpdateWithPriorityLua(update, 0.5) 
    ret:initAttackInfo()
    return ret
end

function Piglet:dyingMode(knockSource, knockAmount)
    self:setStateType(EnumStateType.DYING)
    self:playAnimation("dead")
    if knockAmount then
        local p = getPosTable(self)
        local angle = cc.pToAngleSelf(cc.pSub(p, knockSource))
        local newPos = cc.pRotateByAngle(cc.pAdd({x=knockAmount,y=0}, p),p,angle)
        self:runAction(cc.EaseCubicActionOut:create(cc.MoveTo:create(self._action.knocked:getDuration()*3,newPos)))
    end
    local function recircle()
        self:setVisible(false)
        self:reset()
        List.removeObj(MonsterManager,self)    	
    	List.pushlast(PigletPool,self)
    end
    self:runAction(cc.Sequence:create(cc.DelayTime:create(3),cc.MoveBy:create(1.0,cc.V3(0,0,-50)),cc.CallFunc:create(recircle)))
end

function Piglet:initAttackInfo()
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

function Piglet:attackUpdate(dt)
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
function Piglet:_findEnemy()
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

function Piglet:init3D()
    self._sprite3d = cc.EffectSprite3D:create(file)
    self._sprite3d:setTexture("model/piglet/zhu0928.jpg")
    self._sprite3d:setScale(1.3)
    self._sprite3d:addEffect(cc.V3(0,0,0),0.005, -1)
    self:addChild(self._sprite3d)
    self._sprite3d:setRotation3D({x = 90, y = 0, z = 0})        
    self._sprite3d:setRotation(-90)
end

-- init Piglet animations=============================
do
    Piglet._action = {
        idle = createAnimation(file,0,40,0.7),
        walk = createAnimation(file,135,147,1.5),
        attack1 = createAnimation(file,45,60,0.7),
        attack2 = createAnimation(file,60,75,0.7),
        defend = createAnimation(file,92,96,0.7),
        knocked = createAnimation(file,81,87,0.7),
        dead = createAnimation(file,95,127,1)
    }
end
-- end init Piglet animations========================
function Piglet:initActions()
    self._action = Piglet._action
end