Warrior = class("Warrior", function()
    return require "Base3D".create()
end)

local size = cc.Director:getInstance():getWinSize()
local scheduler = cc.Director:getInstance():getScheduler()
local filename = "model/warrior/warrior.c3b"

function Warrior:ctor()
    self._useWeaponId = 0
    self._useArmourId = 0
    self._particle = nil
    self._attack = 300  
end

function Warrior.create()

    local hero = Warrior.new()
    hero:AddSprite3D()

    -- base
    hero:setRaceType(EnumRaceType.WARRIOR)
    hero:initActions()

    --self
    hero._weapon = math.random() .. ""

    local function MainLoop(dt)
        if EnumStateType.WALK == hero._statetype then
            local targetPos = {x=3000, y=0}
            if hero._target ~= nil  then
                local distance = hero._attackRadius + hero._target._radius
                local p1 = getPosTable(hero)
                local p2 = getPosTable(hero._target)
                if distance < cc.pGetDistance(p1, p2) then
                    hero:setPosition(getNextStepPos(hero, p2, dt))
                else
                    hero:setPosition(getNextStepPos(hero, targetPos, dt))
                end
            else
                hero:setPosition(getNextStepPos(hero, targetPos, dt))            
            end

        elseif EnumStateType.STAND == hero._statetype then
        elseif EnumStateType.ATTACK == hero._statetype then
            --cclog("%f", dt)
        end
    end

    --mainloop
    scheduler:scheduleScriptFunc(MainLoop, 0, false)    

    return hero
end


function Warrior:AddSprite3D()
    self._sprite3d = cc.EffectSprite3D:create(filename)
    self._sprite3d:addEffect(cc.V3(0,0,0),0.01, -1)
    self:addChild(self._sprite3d)
    self._sprite3d:setRotation3D({x = 90, y = 0, z = 0})        
    self._sprite3d:setRotation(-90)

--    self:setDefaultEqt()
end

local function createAnimation(animationStruct, isloop )
    local animation3d = cc.Animation3D:create(filename)
    local animate3d = cc.Animate3D:create(animation3d, animationStruct.begin/30,(animationStruct.ended-animationStruct.begin)/30)
    animate3d:setSpeed(animationStruct.speed)
    if isloop then
        return cc.RepeatForever:create(animate3d)
    else
        return animate3d
    end
end

function Warrior:initActions()
    local stand = createAnimationStruct(267,283,0.7)
    local walk = createAnimationStruct(227,247,0.7)
    local attack1 = createAnimationStruct(103,129,0.7)
    local attack2 = createAnimationStruct(130,154,0.7)
    local specialattack = createAnimationStruct(160,220,0.7)
    local defend = createAnimationStruct(92,96,0.7)
    local knocked = createAnimationStruct(254,260,0.7)
    local dead = createAnimationStruct(0,77,0.7)

    self._action.stand = createAnimation(stand, true)
    self._action.stand:retain()
    self._action.walk = createAnimation(walk, true)
    self._action.walk:retain()
    self._action.attack1 = createAnimation(attack1, false)
    self._action.attack1:retain()
    self._action.attack2 = createAnimation(attack2, false)
    self._action.attack2:retain()
    self._action.specialattack = createAnimation(specialattack, false)
    self._action.specialattack:retain()
    self._action.defend = createAnimation(defend, false)
    self._action.defend:retain()
    self._action.knocked = createAnimation(knocked, false)
    self._action.knocked:retain()
    self._action.dead = createAnimation(dead, false)
    self._action.dead:retain()

end

-- find enemy
function Warrior:FindEnemy2Attack()
    if self._isalive == false then
        if self._scheduleAttackId ~= 0 then
            scheduler:unscheduleScriptEntry(self._scheduleAttackId)
            self._scheduleAttackId = 0
        end
        return
    end 

    if self._statetype == EnumStateType.ATTACK and self._scheduleAttackId == 0 then
        local function scheduleAttack(dt)
            if self._target == nil or self._target == 0 or self._target._isalive == false then
                scheduler:unscheduleScriptEntry(self._scheduleAttackId)
                self._scheduleAttackId = 0
                return
            end

            self._attackZone:runAction(cc.Sequence:create(cc.ProgressTo:create(0, 0), cc.ProgressTo:create(0.3, 25))) 
            --self._target:hurt(self._attack)
        end    
        self._scheduleAttackId = scheduler:scheduleScriptFunc(scheduleAttack, 1, false)            
    end

    if self._statetype ~= EnumStateType.ATTACK and self._scheduleAttackId ~= 0 then
        scheduler:unscheduleScriptEntry(self._scheduleAttackId)
        self._scheduleAttackId = 0
    end  
end

local function dosth(  )
    cclog("attack sb...")
end

function Warrior:setState(type)
    if type == self._statetype then return end
    --cclog("Warrior:setState(" .. type ..")")

    if type == EnumStateType.STAND then
        self._statetype = type
        self._sprite3d:stopAllActions()
        self._sprite3d:runAction(self._action.stand:clone())
        if self._particle ~= nil then self._particle:setEmissionRate(0) end

    elseif type == EnumStateType.WALK then
        self._statetype = type
        self._sprite3d:stopAllActions()
        self._sprite3d:runAction(self._action.walk:clone())
        if self._particle ~= nil then self._particle:setEmissionRate(5) end

    elseif type == EnumStateType.DEAD then
        self._statetype = type
        self._sprite3d:stopAllActions()
        self._sprite3d:runAction(self._action.dead:clone())

    elseif type == EnumStateType.KNOCKED then
        self._statetype = type
        self._sprite3d:stopAllActions()
        self._sprite3d:runAction(self._action.knocked:clone())

    elseif type == EnumStateType.ATTACK then
        self._statetype = type
        self._sprite3d:stopAllActions()
        local attack = cc.Sequence:create(self._action.attack1:clone(),cc.CallFunc:create(dosth),self._action.attack2)
        self._sprite3d:runAction(attack)
    elseif type == EnumStateType.SPECIALATTACK then
        self._statetype = type
        self._sprite3d:stopAllActions()
        self._sprite3d:runAction(self._action.specialattack:clone())

    elseif type == EnumStateType.DEFEND then
        self._statetype = type
        self._sprite3d:stopAllActions()
        self._sprite3d:runAction(self._action.defense:clone())

    elseif type == EnumStateType.DEAD then
        self._statetype = type
        self._sprite3d:stopAllActions()
        self._sprite3d:runAction(self._action.dead:clone())

    else end
end

-- set default equipments
function Warrior:setDefaultEqt()
    local girl_lowerbody = self._sprite3d:getMeshByName("Girl_LowerBody01")
    girl_lowerbody:setVisible(false)
    local girl_shoe = self._sprite3d:getMeshByName("Girl_Shoes01")
    girl_shoe:setVisible(false)
    local girl_hair = self._sprite3d:getMeshByName("Girl_Hair01")
    girl_hair:setVisible(false)
    local girl_upperbody = self._sprite3d:getMeshByName("Girl_UpperBody01")
    girl_upperbody:setVisible(false)
end

--swicth weapon
function Warrior:switchWeapon()
    self._useWeaponId = self._useWeaponId+1
    if self._useWeaponId > 1 then
        self._useWeaponId = 0;
    end
    if self._useWeaponId == 1 then
        local girl_lowerbody = self._sprite3d:getMeshByName("Girl_LowerBody01")
        girl_lowerbody:setVisible(true)
        local girl_lowerbody = self._sprite3d:getMeshByName("Girl_LowerBody02")
        girl_lowerbody:setVisible(false)
        local girl_shoe = self._sprite3d:getMeshByName("Girl_Shoes01")
        girl_shoe:setVisible(true)
        local girl_shoe = self._sprite3d:getMeshByName("Girl_Shoes02")
        girl_shoe:setVisible(false)
    else
        local girl_lowerbody = self._sprite3d:getMeshByName("Girl_LowerBody01")
        girl_lowerbody:setVisible(false)
        local girl_lowerbody = self._sprite3d:getMeshByName("Girl_LowerBody02")
        girl_lowerbody:setVisible(true)
        local girl_shoe = self._sprite3d:getMeshByName("Girl_Shoes01")
        girl_shoe:setVisible(false)
        local girl_shoe = self._sprite3d:getMeshByName("Girl_Shoes02")
        girl_shoe:setVisible(true)
    end
end

--switch armour
function Warrior:switchArmour()
    self._useArmourId = self._useArmourId+1
    if self._useArmourId > 1 then
        self._useArmourId = 0;

    end
    if self._useArmourId == 1 then
        local girl_lowerbody = self._sprite3d:getMeshByName("Girl_Hair01")
        girl_lowerbody:setVisible(true)
        local girl_lowerbody = self._sprite3d:getMeshByName("Girl_Hair02")
        girl_lowerbody:setVisible(false)
        local girl_shoe = self._sprite3d:getMeshByName("Girl_UpperBody01")
        girl_shoe:setVisible(true)
        local girl_shoe = self._sprite3d:getMeshByName("Girl_UpperBody02")
        girl_shoe:setVisible(false)
    else
        local girl_lowerbody = self._sprite3d:getMeshByName("Girl_Hair01")
        girl_lowerbody:setVisible(false)
        local girl_lowerbody = self._sprite3d:getMeshByName("Girl_Hair02")
        girl_lowerbody:setVisible(true)
        local girl_shoe = self._sprite3d:getMeshByName("Girl_UpperBody01")
        girl_shoe:setVisible(false)
        local girl_shoe = self._sprite3d:getMeshByName("Girl_UpperBody02")
        girl_shoe:setVisible(true)
    end
end


-- get weapon id
function Warrior:getWeaponID()
    return self._useWeaponId
end

-- get armour id
function Warrior:getArmourID()
    return self._useArmourId
end

return Warrior