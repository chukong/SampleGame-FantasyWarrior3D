require "Helper"
require "Manager"

AttackCommand = 
class("AttackCommand",function() 
        return {raceType = 0, position = cc.p(0,0), radius = 0, attack = 0, attackType = {melee = true, AOE = false, range = 0}, valid = true} 
      end)
      
AttackCommandManager = List.new()

function AttackCommand.create(object)
    local command = AttackCommand.new()
    command.attacker = object
    command.raceType = object._racetype
    command.position = getPosTable(object)
    command.radius = object._attackRadius
    command.attack = object.attack
    command.attackType.melee = false
    command.attackType.AOE = false
    command.attackType.range = 50
    List.pushlast(AttackCommandManager, command)
end

function AttackCommand:attackAll()
    if self.raceType ~= EnumRaceType.WARRIOR and self.raceType ~= EnumRaceType.MAGE and self.raceType ~= EnumRaceType.ARCHER then
        for val = HeroManager.first, HeroManager.last do
            local sprite = HeroManager[val]
            if sprite._isalive == true and isInCircleSector(self.attacker, sprite) then
                sprite:setState(EnumStateType.KNOCKED)
            end
        end
    else
        for val = MonsterManager.first, MonsterManager.last do
            local sprite = MonsterManager[val]
            if sprite._isalive == true and isInCircleSector(self.attacker, sprite) then
                sprite:setState(EnumStateType.KNOCKED)
            end
        end 

        for val = BossManager.first, BossManager.last do
            local sprite = BossManager[val]
            if sprite._isalive == true and isInCircleSector(self.attacker, sprite) then
                sprite:setState(EnumStateType.KNOCKED)
            end
        end 
    end            
end

function commandControl()
    if List.getSize(AttackCommandManager) == 0 then return end
    
    repeat 
        local command = List.popfirst(AttackCommandManager)
        if command ~= nil then command:attackAll() end
    until command  == nil
end

return AttackCommand