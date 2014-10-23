require "GlobalVariables"
require "MessageDispatchCenter"
require "Helper"
require "AttackCommand"

local file = "model/warrior/zhanshi_ALL_C.c3b"

Knight = class("Knight", function()
    return require "Actor".create()
end)

function Knight:ctor()
    self._useWeaponId = 1
    self._useArmourId = 1
    self._useHelmetId = 1
    self._particle = nil
    self._attack = 1000  
    self._attackFrequency = 2.5
    self._defense = 150       
    self._AIFrequency = 1.1
    self._name = "Knight"  
      
    self._attackKnock = 100
    self._mass = 1000
    self._racetype = EnumRaceType.KNIGHT
    if uiLayer~=nil then
        self._bloodBar = uiLayer.WarriorBlood
        self._bloodBarClone = uiLayer.WarriorBloodClone
        self._avatar = uiLayer.WarriorPng
    end

    self:init3D()
    self:initActions()
    self:setDefaultEqt()
end

function Knight.create()
    local ret = Knight.new()
    --ret:setRaceType(EnumRaceType.WARRIOR)
    
    
    --=====Testing block
    ret:idleMode()
    function test()
--        ret:walkMode()
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

    --delayExecute(ret,test,0.5)

--    delayExecute(ret,test2,2.5)
--    delayExecute(ret,test,3.5)
--    delayExecute(ret,test3,4.5)
    --=====testing block
    ret._AIEnabled = true
    --this update function do not do AI
    function update(dt)
        ret:baseUpdate(dt)
        ret:stateMachineUpdate(dt)
        ret:movementUpdate(dt)
    end
    ret:scheduleUpdateWithPriorityLua(update, 0) 
    ret:initAttackInfo()
    return ret
end

local function KnightNormalAttackCallback(audioID,filePath)
    ccexp.AudioEngine:play2d(WarriorProperty.normalAttack2, false,1)
end

local function KninghtSpecialAttackCallback(audioID, filePatch)
    ccexp.AudioEngine:play2d(WarriorProperty.specialAttack2, false,1)  
end


function Knight:hurtSoundEffects()
    ccexp.AudioEngine:play2d(WarriorProperty.hurt, false,1)
end

function Knight:normalAttack()
    ccexp.AudioEngine:play2d(WarriorProperty.shout, false,1)
    KnightNormalAttack.create(getPosTable(self), self._curFacing, self._normalAttack)
    self._sprite:runAction(self._action.attackEffect:clone()) 

    AUDIO_ID.KNIGHTNORMALATTACK = ccexp.AudioEngine:play2d(WarriorProperty.normalAttack1, false,1)
    ccexp.AudioEngine:setFinishCallback(AUDIO_ID.KNIGHTNORMALATTACK,KnightNormalAttackCallback)
end

function Knight:specialAttack()
    -- knight will create 2 attacks one by one  
    local attack = self._specialAttack
    attack.knock = 0
    ccexp.AudioEngine:play2d(WarriorProperty.shout, false,1)
    KnightNormalAttack.create(getPosTable(self), self._curFacing, attack)
    self._sprite:runAction(self._action.attackEffect:clone())

    local pos = getPosTable(self)
    pos.x = pos.x+50
    pos = cc.pRotateByAngle(pos, self._myPos, self._curFacing)    

    AUDIO_ID.KNIGHTSPECIALATTACK = ccexp.AudioEngine:play2d(WarriorProperty.specialAttack1, false,1)
    ccexp.AudioEngine:setFinishCallback(AUDIO_ID.KNIGHTSPECIALATTACK,KninghtSpecialAttackCallback)
    
    local function punch()
        KnightNormalAttack.create(pos, self._curFacing, self._specialAttack)
        self._sprite:runAction(self._action.attackEffect:clone())                
    end
    delayExecute(self,punch,0.2)
end

function Knight:initAttackInfo()
    --build the attack Infos
    self._normalAttack = {
        minRange = self._attackMinRadius,
        maxRange = self._attackMaxRadius,
        angle    = DEGREES_TO_RADIANS(self._attackAngle),
        knock    = self._attackKnock,
        damage   = self._attack,
        mask     = self._racetype,
        duration = 0, -- 0 duration means it will be removed upon calculation
        speed    = 0,
        criticalChance = 0
    }
    self._specialAttack = {
        minRange = self._attackMinRadius,
        maxRange = self._attackMaxRadius+50,
        angle    = DEGREES_TO_RADIANS(150),
        knock    = self._attackKnock,
        damage   = self._attack,
        mask     = self._racetype,
        duration = 0,
        speed    = 0,
        criticalChance = 0.5
    }
end

function Knight:initAttackEffect()
    local speed = 0.1
    local startRotate = 145
    local rotate = -60
    local scale = 0.01
    local sprite = cc.Sprite:createWithSpriteFrameName("specialAttack.jpg")
    sprite:setVisible(false)
    sprite:setBlendFunc(gl.ONE_MINUS_SRC_ALPHA,gl.ONE)
    sprite:setScaleX(scale)
    sprite:setRotation(startRotate)
    sprite:setOpacity(0)
    sprite:setAnchorPoint(cc.p(0.5, -1))    
    sprite:setPosition3D(cc.V3(10, 0, 50))
    self:addChild(sprite)

    local scaleAction = cc.ScaleTo:create(speed, 1, 1)
    local rotateAction = cc.RotateBy:create(speed, rotate)
    local attack = cc.Spawn:create(scaleAction, rotateAction)
    local attack = cc.EaseCircleActionOut:create(attack)
    local fadeAction = cc.FadeIn:create(speed)
    
    local fadeAction2 = cc.FadeOut:create(0)
    local scaleAction2 = cc.ScaleTo:create(0, scale, 1)
    local rotateAction2 = cc.RotateTo:create(0, startRotate)
    local restore = cc.Spawn:create(fadeAction2, scaleAction2, rotateAction2, cc.Hide:create())

    self._sprite = sprite
    self._action.attackEffect = cc.Sequence:create(cc.Show:create(), attack, fadeAction, restore)    
    self._action.attackEffect:retain()
end


function Knight:init3D()
    self:initShadow()
    self._sprite3d = cc.EffectSprite3D:create(file)
    self._sprite3d:setScale(25)
    self._sprite3d:addEffect(cc.V3(0,0,0),0.02, -1)
    self:addChild(self._sprite3d)
    self._sprite3d:setRotation3D({x = 90, y = 0, z = 0})        
    self._sprite3d:setRotation(-90)
end



-- init knight animations=============================
do
    Knight._action = {
        idle = createAnimation(file,267,283,0.7),
        walk = createAnimation(file,227,246,0.7),
        attack1 = createAnimation(file,103,129,0.7),
        attack2 = createAnimation(file,130,154,0.7),
        specialattack1 = createAnimation(file,160,190,0.3),
        specialattack2 = createAnimation(file,191,220,0.4),
        defend = createAnimation(file,92,96,0.7),
        knocked = createAnimation(file,254,260,0.7),
        dead = createAnimation(file,0,77,1)
    }
end
-- end init knight animations========================
function Knight:initActions()
    self._action = Knight._action
    self._action.effect = self:initAttackEffect()    
end

-- set default equipments
function Knight:setDefaultEqt()
    self:updateWeapon()
    self:updateHelmet()
    self:updateArmour()
end

function Knight:updateWeapon()
    if self._useWeaponId == 0 then
        local weapon = self._sprite3d:getMeshByName("zhanshi_wuqi01")
        weapon:setVisible(true)
        weapon = self._sprite3d:getMeshByName("zhanshi_wuqi02")
        weapon:setVisible(false)
    else
        local weapon = self._sprite3d:getMeshByName("zhanshi_wuqi02")
        weapon:setVisible(true)
        weapon = self._sprite3d:getMeshByName("zhanshi_wuqi01")
        weapon:setVisible(false)
    end
end

function Knight:updateHelmet()
    if self._useHelmetId == 0 then
        local helmet = self._sprite3d:getMeshByName("zhanshi_tou01")
        helmet:setVisible(true)
        helmet = self._sprite3d:getMeshByName("zhanshi_tou02")
        helmet:setVisible(false)
    else
        local helmet = self._sprite3d:getMeshByName("zhanshi_tou02")
        helmet:setVisible(true)
        helmet = self._sprite3d:getMeshByName("zhanshi_tou01")
        helmet:setVisible(false)
    end
end

function Knight:updateArmour()
    if self._useArmourId == 0 then
        local armour = self._sprite3d:getMeshByName("zhanshi_shenti01")
        armour:setVisible(true)
        armour = self._sprite3d:getMeshByName("zhanshi_shenti02")
        armour:setVisible(false)
    else
        local armour = self._sprite3d:getMeshByName("zhanshi_shenti02")
        armour:setVisible(true)
        armour = self._sprite3d:getMeshByName("zhanshi_shenti01")
        armour:setVisible(false)
    end
end

--swicth weapon
function Knight:switchWeapon()
    self._useWeaponId = self._useWeaponId+1
    if self._useWeaponId > 1 then
        self._useWeaponId = 0;
    end
    self:updateWeapon()
end

--switch helmet
function Knight:switchHelmet()
    self._useHelmetId = self._useHelmetId+1
    if self._useHelmetId > 1 then
        self._useHelmetId = 0;
    end
    self:updateHelmet()
end

--switch armour
function Knight:switchArmour()
    self._useArmourId = self._useArmourId+1
    if self._useArmourId > 1 then
        self._useArmourId = 0;
    end
    self:updateArmour()
end


-- get weapon id
function Knight:getWeaponID()
    return self._useWeaponId
end

-- get armour id
function Knight:getArmourID()
    return self._useArmourId
end

-- get helmet id
function Knight:getHelmet()
    return self._useHelmetId
end

return Knight
