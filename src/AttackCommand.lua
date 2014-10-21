require "Helper"
require "Manager"

AttackManager = List.new()
function solveAttacks(dt)
    for val = AttackManager.last, AttackManager.first, -1 do
        local attack = AttackManager[val]
        if attack.mask == EnumRaceType.HERO then
            --if heroes attack, then lets check monsters
            for mkey = MonsterManager.first, MonsterManager.last do
                --check distance first
                local monster = MonsterManager[mkey]
                local mpos = getPosTable(monster)
                local dist = cc.pGetDistance(getPosTable(attack), mpos)
                if dist < (attack.maxRange + monster._radius) and dist > attack.minRange then
                    --range test passed, now angle test
                    local angle = cc.pToAngleSelf(cc.pSub(mpos,getPosTable(attack)))
                    if(attack.facing + attack.angle/2)>angle and angle > (attack.facing- attack.angle/2) then
                        attack:onCollide(monster)
                    end
                end
            end
        elseif attack.mask == EnumRaceType.MONSTER then
            --if heroes attack, then lets check monsters
            for hkey = HeroManager.first, HeroManager.last do
                --check distance first
                local hero = HeroManager[hkey]
                local hpos = getPosTable(hero)
                local dist = cc.pGetDistance(getPosTable(attack), hpos)
                if dist < (attack.maxRange + hero._radius) and dist > attack.minRange then
                    --range test passed, now angle test
                    local angle = cc.pToAngleSelf(cc.pSub(hpos,getPosTable(attack)))
                    if(attack.facing + attack.angle/2)>angle and angle > (attack.facing- attack.angle/2) then
                        attack:onCollide(hero)
                    end
                end
            end
        end
        if attack.curDuration > attack.duration then
            attack:onTimeOut()
            List.remove(AttackManager,val)
        else
            attack:onUpdate(dt)
            attack.curDuration = attack.curDuration+dt
        end
    end
end

BasicCollider = class("BasicCollider", function()
    return cc.Node:create()
end)

function BasicCollider:ctor()
    self.minRange = 0   --the min radius of the fan
    self.maxRange = 150 --the max radius of the fan
    self.angle    = 120 --arc of attack, in radians
    self.knock    = 150 --default knock, knocks 150 units 
    self.mask     = 1   --1 is Heroes, 2 is enemy, 3 ??
    self.damage   = 100
    self.facing    = 0 --this is radians
    self.duration = 0
    self.curDuration = 0
    self.speed = 0 --traveling speed}
end
--callback when the collider has being solved by the attack manager, 
--make sure you delete it from node tree, if say you have an effect attached to the collider node
function BasicCollider:onTimeOut()
    self:removeFromParent()
end
function BasicCollider:onCollide(target)
    target:hurt(self)
end
function BasicCollider:onUpdate()
    -- implement this function if this is a projectile
end
function BasicCollider:initData(pos, facing, attackInfo)
    self.minRange = attackInfo.minRange or self.minRange
    self.maxRange = attackInfo.maxRange or self.maxRange
    self.angle = attackInfo.angle or self.angle
    self.knock = attackInfo.knock or self.knock
    self.mask = attackInfo.mask or self.mask
    self.facing = facing or self.facing
    self.damage = attackInfo.damage or self.damage
    self.duration = attackInfo.duration or self.duration
    self.speed = attackInfo.speed or self.speed
    
    self:setPosition(pos)
    List.pushlast(AttackManager, self)
    currentLayer:addChild(self)
end
function BasicCollider.create(pos, facing, attackInfo)
    local ret = BasicCollider.new()    
    ret:initData(pos,facing,attackInfo)
    return ret
end

KnightNormalAttack = class("KnightNormalAttack", function()
    return BasicCollider.new()
end)
function KnightNormalAttack.create(pos, facing, attackInfo)
    local ret = KnightNormalAttack.new()
    ret:initData(pos,facing,attackInfo)
    ret.sp = cc.Sprite:create("btn_circle_normal.png")
    ret.sp:setPosition3D(cc.V3(100,0,50))
    ret.sp:setScale(5)
    ret:addChild(ret.sp)
    ret:setRotation(RADIANS_TO_DEGREES(facing))
    
    return ret
end
function KnightNormalAttack:onTimeOut()
    self.sp:runAction(cc.FadeOut:create(1))
    self:runAction(cc.Sequence:create(cc.DelayTime:create(1),cc.RemoveSelf:create()))
end

MageNormalAttack = class("MageNormalAttack", function()
    return BasicCollider.new()
end)
function MageNormalAttack.create(pos,facing,attackInfo)
    local ret = MageNormalAttack.new()
    ret:initData(pos,facing,attackInfo)
    
    ret.sp = cc.Sprite:create("btn_circle_normal.png")
    ret.sp:setPosition3D(cc.V3(0,0,50))
    ret.sp:setScale(2)
    ret.sp:setColor({r=255,g=0,b=0})
    ret:addChild(ret.sp)
    
    return ret
end
function MageNormalAttack:onTimeOut()
    self:runAction(cc.RemoveSelf:create())
end
function MageNormalAttack:onCollide(target)
    target:hurt(self)
    --set cur duration to its max duration, so it will be removed when checking time out
    self.curDuration = self.duration+1
end
function MageNormalAttack:onUpdate(dt)
    local selfPos = getPosTable(self)
    local nextPos = cc.pRotateByAngle(cc.pAdd({x=self.speed*dt, y=0},selfPos),selfPos,self.facing)
    self:setPosition(nextPos)
end
MageIceSpikes = class("MageIceSpikes", function()
    return BasicCollider.new()
end)
function MageIceSpikes.create(pos, facing, attackInfo)
    local ret = MageIceSpikes.new()
    ret:initData(pos,facing,attackInfo)
    ret.sp = cc.Sprite:create("btn_circle_normal.png")
    ret.sp:setColor({r=0,g=0,b=255})
    ret.sp:setPosition3D(cc.V3(0,0,5))
    ret.sp:setScale(2)
    ret:addChild(ret.sp)
    --ret:setRotation(RADIANS_TO_DEGREES(facing))
    ret.DOTTimer = 0.5 --it will be able to hurt every 0.5 seconds
    ret.curDOTTime = 0.5
    ret.DOTApplied = false
    return ret
end
function MageIceSpikes:onTimeOut()
    self.sp:runAction(cc.FadeOut:create(1))
    self:runAction(cc.Sequence:create(cc.DelayTime:create(1),cc.RemoveSelf:create()))
end
function MageIceSpikes:onCollide(target)
    if self.curDOTTime > self.DOTTimer then
        target:hurt(self)
        self.DOTApplied = true
    end
end
function MageIceSpikes:onUpdate(dt)
-- implement this function if this is a projectile
    self.curDOTTime = self.curDOTTime + dt
    if self.DOTApplied then
        self.DOTApplied = false
        self.curDOTTime = 0
    end
end

ArcherNormalAttack = class("ArcherNormalAttack", function()
    return BasicCollider.new()
end)
function ArcherNormalAttack.create(pos,facing,attackInfo)
    local ret = ArcherNormalAttack.new()
    ret:initData(pos,facing,attackInfo)

    ret.sp = cc.Sprite:create("chooseRole/cr_rotate.png")
    ret.sp:setPosition3D(cc.V3(0,0,50))
    ret.sp:setScale(2)
    ret.sp:setColor({r=255,g=0,b=0})
    ret:addChild(ret.sp)

    return ret
end
function ArcherNormalAttack:onTimeOut()
    self:runAction(cc.RemoveSelf:create())
end
function ArcherNormalAttack:onCollide(target)
    target:hurt(self)
    --set cur duration to its max duration, so it will be removed when checking time out
    self.curDuration = self.duration+1
end
function ArcherNormalAttack:onUpdate(dt)
    local selfPos = getPosTable(self)
    local nextPos = cc.pRotateByAngle(cc.pAdd({x=self.speed*dt, y=0},selfPos),selfPos,self.facing)
    self:setPosition(nextPos)
end

ArcherArrowRainFall = class("ArcherArrowRainFall", function()
    return BasicCollider.new()
end)
function ArcherArrowRainFall.create(pos, facing, attackInfo)
    local ret = ArcherArrowRainFall.new()
    ret:initData(pos,facing,attackInfo)
    ret.sp = cc.Sprite:create("chooseRole/cr_rotate.png")
    ret.sp:setColor({r=0,g=0,b=255})
    ret.sp:setPosition3D(cc.V3(0,0,5))
    ret.sp:setScale(2)
    ret:addChild(ret.sp)
    --ret:setRotation(RADIANS_TO_DEGREES(facing))

    return ret
end
function ArcherArrowRainFall:onTimeOut()
    self.sp:runAction(cc.FadeOut:create(1))
    self:runAction(cc.Sequence:create(cc.DelayTime:create(1),cc.RemoveSelf:create()))
end
function ArcherArrowRainFall:onCollide(target)
    target:hurt(self)
end

return AttackManager