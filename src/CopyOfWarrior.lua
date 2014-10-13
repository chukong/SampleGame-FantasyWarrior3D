require "MessageDispatchCenter"
MonsterDebug = class("MonsterDebug", function()
    return require "Base3D".create()
end)

local size = cc.Director:getInstance():getWinSize()
local scheduler = cc.Director:getInstance():getScheduler()
local filename = "model/warrior/zhanshi_ALLv002.c3b"
filename  = "model/warrior/warrior.c3b"

function MonsterDebug:ctor()
    self._useWeaponId = 0
    self._useArmourId = 0
    self._particle = nil
    self._attack = 300  
end

function MonsterDebug.create()

    local monster = MonsterDebug.new()
    monster:AddSprite3D()

    -- base
    monster:setRaceType(EnumRaceType.WARRIOR)
    monster:initActions()

    --self
    monster._weapon = math.random() .. ""

    local function MainLoop(dt)
        if EnumStateType.WALK == monster._statetype and monster._target ~= nil then
            local distance = monster._attackRadius + monster._target._radius
            local p1 = getPosTable(monster)
            local p2 = getPosTable(monster._target)
            if distance < cc.pGetDistance(p1, p2) then
                monster:setPosition(getNextStepPos(monster, p2, dt))
            end
        end
    end
    
    --mainloop
    scheduler:scheduleScriptFunc(MainLoop, 0, false)    

    --regist message

    
    local function knocked(msgStruct)
        --stopAllActions and dropblood
        if msgStruct.target == self then 
            self.setState(EnumStateType.KNOCKED,msgStruct)
        end
    end

    MessageDispatchCenter:registerMessage(MessageDispatchCenter.MessageType.KNOCKED, knocked)

    return monster
end


function MonsterDebug:AddSprite3D()
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

function MonsterDebug:initActions()
    local stand = createAnimationStruct(267,283,0.7)
    local walk = createAnimationStruct(227,246,0.7)
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

function MonsterDebug:setState(type, other)
    if type == self._statetype then return end
    --cclog("MonsterDebug:setState(" .. type ..")")

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
        local function dropblood(sender, other)
            --dropblood logic
            cclog(other.attack)
            --
        end
        self._sprite3d:runAction(cc.Spawn:create(self._action.knocked:clone(),cc.CallFunc:create(dropblood,other)))

    elseif type == EnumStateType.ATTACK then
        self._statetype = type
        self._sprite3d:stopAllActions()
        local function sendKnockedMsg()
            MessageDispatchCenter:dispatchMessage(MessageDispatchCenter.MessageType.KNOCKED, createKnockedMsgStruct(self._target, self._attack))
        end
        local attack = cc.Sequence:create(self._action.attack1:clone(),cc.CallFunc:create(sendKnockedMsg),self._action.attack2)
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
function MonsterDebug:setDefaultEqt()
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
function MonsterDebug:switchWeapon()
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
function MonsterDebug:switchArmour()
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
function MonsterDebug:getWeaponID()
    return self._useWeaponId
end

-- get armour id
function MonsterDebug:getArmourID()
    return self._useArmourId
end

return MonsterDebug