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
    self._attack = 150  
    self._racetype = EnumRaceType.MONSTER
    self._speed = 500
    
    self._attackRange = 100
    self._attackMaxRadius = 130
    self._attackAngle = 30
    self._attackKnock = 50
    
    self._goRight = false
    
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
    ret._AIEnabled = true
    --delayExecute(ret,test,0.5)

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
    ret:initAttackInfo()
    return ret
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
end
function Dragon:init3D()
    self._sprite3d = cc.EffectSprite3D:create(file)
    self._sprite3d:setTexture("model/piglet/zhu0928.jpg")
    self._sprite3d:setScale(1.3)
    self._sprite3d:addEffect(cc.V3(0,0,0),0.005, -1)
    self:addChild(self._sprite3d)
    self._sprite3d:setRotation3D({x = 90, y = 0, z = 0})        
    self._sprite3d:setRotation(-90)
end

-- init Dragon animations=============================
do
    Dragon._action = {
        idle = createAnimation(file,0,40,0.7),
        walk = createAnimation(file,135,147,1),
        attack1 = createAnimation(file,45,60,0.7),
        attack2 = createAnimation(file,60,75,0.7),
        defend = createAnimation(file,92,96,0.7),
        knocked = createAnimation(file,81,87,0.7),
        dead = createAnimation(file,95,127,1)
    }
end
-- end init Dragon animations========================
function Dragon:initActions()
    self._action = Dragon._action
end