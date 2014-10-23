require "GlobalVariables"
require "MessageDispatchCenter"
require "Helper"
require "AttackCommand"

local file = "model/archer/gongjiashou_an_v005.c3b"

Archer = class("Archer", function()
    return require "Actor".create()
end)

function Archer:ctor()
    self._useWeaponId = 0
    self._useArmourId = 0
    self._particle = nil
    self._racetype = EnumRaceType.ARCHER
    self._attackFrequency = 4.7
    self._AIFrequency = 1.3
    self._name = "Archer"
    
    if uiLayer~=nil then
        self._bloodBar = uiLayer.ArcherBlood
        self._bloodBarClone = uiLayer.ArcherBloodClone
    end

    self._attackRange = 1000

    --normal attack
    self._attackMinRadius = 0
    self._attackMaxRadius = 5
    self._attack = 150
    self._attackAngle = 360
    self._attackKnock = 0

    self._mass = 500
    self:init3D()
    self:initActions()
end

function Archer.create()
    local ret = Archer.new()
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

local function ArcherlAttackCallback(audioID,filePath)
    ccexp.AudioEngine:play2d(Archerproperty.attack2, false,1)
end

function Archer:normalAttack()
    ArcherNormalAttack.create(getPosTable(self), self._curFacing, self._normalAttack)
    AUDIO_ID.ARCHERATTACK = ccexp.AudioEngine:play2d(Archerproperty.attack1, false,1)
    ccexp.AudioEngine:play2d(Archerproperty.wow, false,1)
    ccexp.AudioEngine:setFinishCallback(AUDIO_ID.ARCHERATTACK,ArcherlAttackCallback)
end

function Archer:specialAttack()
    --archer will create 3 attack circle on the ground
    --get 3 positions
    AUDIO_ID.ARCHERATTACK = ccexp.AudioEngine:play2d(Archerproperty.attack1, false,1)
    ccexp.AudioEngine:setFinishCallback(AUDIO_ID.ARCHERATTACK,ArcherlAttackCallback)
    
    local normalAttack = self._normalAttack
    normalAttack.knock = 10
    normalAttack.angle = 360
    
    local pos1 = getPosTable(self)
    local pos2 = getPosTable(self)
    local pos3 = getPosTable(self)
    pos1.x = pos1.x
    pos2.x = pos2.x
    pos3.x = pos3.x
    pos1 = cc.pRotateByAngle(pos1, self._myPos, self._curFacing)
    pos2 = cc.pRotateByAngle(pos2, self._myPos, self._curFacing)
    pos3 = cc.pRotateByAngle(pos3, self._myPos, self._curFacing)
    ArcherNormalAttack.create(pos1, self._curFacing, self._specialAttack)
    local function spike2()
        ArcherNormalAttack.create(pos2, self._curFacing, self._specialAttack)
        AUDIO_ID.ARCHERATTACK = ccexp.AudioEngine:play2d(Archerproperty.attack1, false,1)
        ccexp.AudioEngine:setFinishCallback(AUDIO_ID.ARCHERATTACK,ArcherlAttackCallback)
    end
    local function spike3()
        ArcherNormalAttack.create(pos3, self._curFacing, self._specialAttack)
        AUDIO_ID.ARCHERATTACK = ccexp.AudioEngine:play2d(Archerproperty.attack1, false,1)
        ccexp.AudioEngine:setFinishCallback(AUDIO_ID.ARCHERATTACK,ArcherlAttackCallback)
    end
    delayExecute(self,spike2,0.2)
    delayExecute(self,spike3,0.4)
end

function Archer:init3D()
    self:initShadow()
    self._sprite3d = cc.EffectSprite3D:create(file)
    self._sprite3d:setScale(1.6)
    self._sprite3d:addEffect(cc.V3(0,0,0),0.005, -1)
    self:addChild(self._sprite3d)
    self._sprite3d:setRotation3D({x = 90, y = 0, z = 0})        
    self._sprite3d:setRotation(-90)
end
function Archer:initAttackInfo()
    --build the attack Infos
    self._normalAttack = {
        minRange = self._attackMinRadius,
        maxRange = self._attackMaxRadius,
        angle    = DEGREES_TO_RADIANS(self._attackAngle),
        knock    = self._attackKnock,
        damage   = self._attack,
        mask     = self._racetype,
        duration = 3, -- 0 duration means it will be removed upon calculation
        speed    = 800
    }
    self._specialAttack = {
        minRange = self._attackMinRadius,
        maxRange = self._attackMaxRadius+50,
        angle    = DEGREES_TO_RADIANS(360),
        knock    = 50,--self._attackKnock,
        damage   = self._attack,
        mask     = self._racetype,
        duration = 3,
        speed    = 800
    }
end


-- init Archer animations=============================
do
    Archer._action = {
        idle = createAnimation(file,208,253,0.7),
        walk = createAnimation(file,110,130,0.7),
        attack1 = createAnimation(file,0,12,0.7),
        attack2 = createAnimation(file,12,24,0.7),
        specialattack1 = createAnimation(file,30,43,0.2),
        specialattack2 = createAnimation(file,44,56,0.2),
        defend = createAnimation(file,70,95,0.7),
        knocked = createAnimation(file,135,145,0.7),
        dead = createAnimation(file,150,196,0.7)
    }
end
-- end init Archer animations========================
function Archer:initActions()
    self._action = Archer._action
end