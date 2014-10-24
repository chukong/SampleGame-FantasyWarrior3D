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
    
    copyTable(ActorCommonValues, self)
    copyTable(PigletValues,self)
    
    self:init3D()
    self:initActions()
end

function Piglet:reset()
    copyTable(ActorCommonValues, self)
    copyTable(PigletValues,self)
    self:_findEnemy(self._raceType)
    self:walkMode()
    self:setPositionZ(0)
    
end

function Piglet.create()
    local ret = Piglet.new()
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

function Piglet:dyingMode(knockSource, knockAmount)
    self:setStateType(EnumStateType.DYING)
    self:playAnimation("dead")
    
    --Twice play in order to inhance the sounds,
    ccexp.AudioEngine:play2d(MonsterPigletValues.dead, false,1)
    
    if knockAmount then
        local p = getPosTable(self)
        local angle = cc.pToAngleSelf(cc.pSub(p, knockSource))
        local newPos = cc.pRotateByAngle(cc.pAdd({x=knockAmount,y=0}, p),p,angle)
        self:runAction(cc.EaseCubicActionOut:create(cc.MoveTo:create(self._action.knocked:getDuration()*3,newPos)))
    end
    self._AIEnabled = false
    List.removeObj(MonsterManager,self) 
    local function recycle()
        self:setVisible(false)
        kill_count = kill_count + 1
        --self:reset()
    	List.pushlast(PigletPool,self)
    end
    self:runAction(cc.Sequence:create(cc.DelayTime:create(3),cc.MoveBy:create(1.0,cc.V3(0,0,-50)),cc.CallFunc:create(recycle)))
end

function Piglet:hurtSoundEffects()
    ccexp.AudioEngine:play2d(MonsterPigletValues.hurt, false,0.5)
end

function Piglet:normalAttackSoundEffects()
    local randomEffect =  math.random()                   
    if randomEffect<=0.3 and randomEffect>=0 then
        ccexp.AudioEngine:play2d(MonsterPigletValues.attack1, false,1)
    elseif randomEffect<=0.6 and randomEffect>0.3 then
        ccexp.AudioEngine:play2d(MonsterPigletValues.attack2, false,1)  
    elseif randomEffect>0.6 and randomEffect<=1 then
        ccexp.AudioEngine:play2d(MonsterPigletValues.attack3, false,1)              
    end
end

--function Piglet:attackUpdate(dt)
--    self._attackTimer = self._attackTimer + dt
--    if self._attackTimer > self._attackFrequency then
--        self._attackTimer = self._attackTimer - self._attackFrequency
--        local function playIdle()
--            self:playAnimation("idle", true)
--            self._cooldown = false
--        end
--        --time for an attack, which attack should i do?
--            local function createCol()
--                self:normalAttack()
--                local randomEffect =  math.random()                   
--                if randomEffect<=0.3 and randomEffect>=0 then
--                    ccexp.AudioEngine:play2d(MonsterPigletValues.attack1, false,1)
--                elseif randomEffect<=0.6 and randomEffect>0.3 then
--                    ccexp.AudioEngine:play2d(MonsterPigletValues.attack2, false,1)  
--                elseif randomEffect>0.6 and randomEffect<=1 then
--                    ccexp.AudioEngine:play2d(MonsterPigletValues.attack3, false,1)              
--                end
--            end
--            local attackAction = cc.Sequence:create(self._action.attack1:clone(),cc.CallFunc:create(createCol),self._action.attack2:clone(),cc.CallFunc:create(playIdle))
--            self._sprite3d:stopAction(self._curAnimation3d)
--            self._sprite3d:runAction(attackAction)
--            self._curAnimation = attackAction
--            self._cooldown = true
--    end
--end


function Piglet:init3D()
    self:initShadow()
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