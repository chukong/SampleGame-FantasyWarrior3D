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

function Warrior:initActions()
    local stand = createAnimationStruct(267,283,0.7)
    local walk = createAnimationStruct(227,247,0.7)
    local attack = createAnimationStruct(103,153,0.7)
    local specialattack = createAnimationStruct(160,220,0.7)
    local defense = createAnimationStruct(92,96,0.7)
    local knocked = createAnimationStruct(254,260,0.7)
    local dead = createAnimationStruct(0,77,0.7)


    local stand_animation3d = cc.Animation3D:create(filename)
    local stand_animate3d = cc.Animate3D:create(stand_animation3d, stand.begin/30,(stand.ended-stand.begin)/30)
    stand_animate3d:setSpeed(stand.speed)
    self._action.stand = cc.RepeatForever:create(stand_animate3d)
    self._action.stand:retain()

    local walk_animation3d = cc.Animation3D:create(filename)
    local walk_animate3d = cc.Animate3D:create(walk_animation3d, walk.begin/30,(walk.ended-walk.begin)/30)
    walk_animate3d:setSpeed(walk.speed)
    self._action.walk = cc.RepeatForever:create(walk_animate3d)
    self._action.walk:retain()

    local attack_animation3d = cc.Animation3D:create(filename)
    local attack_animate3d = cc.Animate3D:create(attack_animation3d, attack.begin/30,(attack.ended-attack.begin)/30)
    attack_animate3d:setSpeed(attack.speed)
    self._action.attack = cc.RepeatForever:create(attack_animate3d)
    self._action.attack:retain()

    local specialattack_animation3d = cc.Animation3D:create(filename)
    local specialattack_animate3d = cc.Animate3D:create(specialattack_animation3d, specialattack.begin/30,(specialattack.ended-specialattack.begin)/30)
    specialattack_animate3d:setSpeed(specialattack.speed)
    self._action.specialattack = cc.RepeatForever:create(specialattack_animate3d)
    self._action.specialattack:retain()

    local defense_animation3d = cc.Animation3D:create(filename)
    local defense_animate3d = cc.Animate3D:create(defense_animation3d, defense.begin/30,(defense.ended-defense.begin)/30)
    defense_animate3d:setSpeed(defense.speed)
    self._action.defense = cc.Sequence:create(cc.DelayTime:create(1.0), defense_animate3d)
    self._action.defense:retain()

    local knocked_animation3d = cc.Animation3D:create(filename)
    local knocked_animate3d = cc.Animate3D:create(knocked_animation3d, knocked.begin/30,(knocked.ended-knocked.begin)/30)
    knocked_animate3d:setSpeed(knocked.speed)
    self._action.knocked = knocked_animate3d
    self._action.knocked:retain()

    local dead_animation3d = cc.Animation3D:create(filename)
    local dead_animate3d = cc.Animate3D:create(dead_animation3d, dead.begin/30,(dead.ended-dead.begin)/30)
    dead_animate3d:setSpeed(dead.speed)
    self._action.dead = dead_animate3d
    self._action.dead:retain()
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
        self._sprite3d:runAction(self._action.attack:clone())
                
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