require "Helper"
require "Manager"

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