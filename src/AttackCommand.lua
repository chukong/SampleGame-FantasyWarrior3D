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
                        monster:hurt(attack.damage)
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
                        hero:hurt(attack.damage)
                    end
                end
            end
        end
        --print(attack.damage)
        attack:delete()
        List.remove(AttackManager,val)
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
function BasicCollider:delete()
    self:removeFromParent()
end
function BasicCollider.create(pos, facing, attackInfo)
    local ret = BasicCollider.new()    
    ret.minRange = attackInfo.minRange or ret.minRange
    ret.maxRange = attackInfo.maxRange or ret.minRange
    ret.angle = attackInfo.angle or ret.angle
    ret.knock = attackInfo.knock or ret.knock
    ret.mask = attackInfo.mask or ret.mask
    ret.facing = facing or ret.facing
    ret.damage = attackInfo.damage or ret.damage
    ret.duration = attackInfo.duration or ret.duration
    ret.speed = attackInfo.speed or ret.speed

    ret:setPosition(pos)
    List.pushlast(AttackManager, ret)
    currentLayer:addChild(ret)
    return ret
end




AttackCommand = 
class("AttackCommand",function() 
        return {raceType = 0, position = cc.p(0,0), target = 0, attackType = {attack = 0, attackRadius = 0, melee = true, AOE = false, validDistance = 0}} 
      end)
      
AttackCommandManager = List.new()

function AttackCommand.create(object)
    local command = AttackCommand.new()
    command.raceType = object._racetype
    command.position = getPosTable(object)
    command.target = object._target
    command.attackType.attack = object.attack
    command.attackType.validDistance = 0
    command.attackType.attackRadius = object._attackRadius
    command.attackType.melee = true
    command.attackType.AOE = false
    command.attackType.validDistance = 0
    List.pushlast(AttackCommandManager, command)
end

local function isInCircleSector(command, object2)
    local attackDistance = command.attackRadius + object2._radius
    local tempDistance = cc.pGetDistance(command.position, object2:getPosition())
    if tempDistance < attackDistance then
        return true
    end 

    return false
end

function AttackCommand:attack()
    if self.target ~= nil then 
        self.target:setState(EnumStateType.KNOCKED)
    end
end

function AttackCommand:attackAll()
    if self.raceType ~= EnumRaceType.WARRIOR and self.raceType ~= EnumRaceType.MAGE and self.raceType ~= EnumRaceType.ARCHER then
        for val = HeroManager.first, HeroManager.last do
            local sprite = HeroManager[val]
            if sprite._isalive == true and isInCircleSector(self, sprite) then
                sprite:setState(EnumStateType.KNOCKED)
            end
        end
    else
        for val = MonsterManager.first, MonsterManager.last do
            local sprite = MonsterManager[val]
            if sprite._isalive == true and isInCircleSector(self, sprite) then
                sprite:setState(EnumStateType.KNOCKED)
            end
        end 

        for val = BossManager.first, BossManager.last do
            local sprite = BossManager[val]
            if sprite._isalive == true and isInCircleSector(self, sprite) then
                sprite:setState(EnumStateType.KNOCKED)
            end
        end 
    end            
end

function commandControl()
    if List.getSize(AttackCommandManager) == 0 then return end
    
    repeat 
        local command = List.popfirst(AttackCommandManager)
        if command ~= nil then 
            if command.attackType.AOE == true then
                command:attackAll() 
            else
                command:attack() 
            end
        end
    until command  == nil
end

return AttackCommand