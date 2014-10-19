require "Helper"
require "Manager"

AttackManager = List.new()
function solveAttacks(dt)
    for val = AttackManager.last, 0, -1 do
        local attack = AttackManager[val]
        if attack.mask == EnumRaceType.HERO then
            --if heroes attack, then lets check monsters
            for mkey = MonsterManager.first, MonsterManager.last do
                --check distance first
                local monster = MonsterManager[mkey]
                local mpos = getPosTable(monster)
                local dist = cc.pGetDistance(attack.position, mpos)
                if dist < (attack.maxRange + monster._radius) and dist > attack.minRange then
                    --range test passed, now angle test
                    local angle = cc.pToAngleSelf(cc.pSub(mpos,attack.position))
                    if(attack.facing + attack.angle/2)>angle and angle > (attack.facing- attack.angle/2) then
                        monster:hurt(attack.damage)
                    end
                end
            end
        end
        List.remove(AttackManager,val)
    end
end

Collider = class("Collider", function()
    return {        
        minRange = 0,   --the min radius of the fan
        maxRange = 150, --the max radius of the fan
        angle    = 120, --arc of attack, in radians
        knock    = 150, --default knock, knocks 150 units 
        mask     = 1,   --1 is Heroes, 2 is enemy, 3 ??
        damage   = 100,
        facing    = 0, --this is radians
        position = nil
    }
end)

function Collider:ctor()

end
function Collider.create(pos, facing, attackInfo)
    local ret = Collider.new()    
    ret.minRange = attackInfo.minRange
    ret.maxRange = attackInfo.maxRange
    ret.angle = attackInfo.angle
    ret.knock = attackInfo.knock
    ret.mask = attackInfo.mask
    ret.facing = facing
    ret.position = pos
    ret.damage = attackInfo.damage

    List.pushlast(AttackManager, ret)
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