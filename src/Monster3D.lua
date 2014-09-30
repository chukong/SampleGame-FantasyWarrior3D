Monster3D = class("Monster3D",function ()
	return require "Base3D".create()
end)

function Monster3D:ctor()

end

function Monster3D.create(type)

    local monster = Monster3D.new()
    monster:AddSprite3D(type)    
    
    --base
    monster:setRaceType(type)

    --self
    
    return monster
end

function Monster3D:AddSprite3D(type)
	
    local filename = "Sprite3DTest/orc.c3b";
    self._sprite3d = cc.EffectSprite3D:create(filename)
    self:addChild(self._sprite3d)
    self._sprite3d:setRotation3D({x = 90, y = 0, z = 0})        
    self._sprite3d:setRotation(180)
      
    self._action.attack = filename
end

local scheduler = cc.Director:getInstance():getScheduler()

function Monster3D:FindEnemy2Attack()
    if self._isalive == false then return end 

    if self._target ~= 0 and self._target._isalive then
        if self._statetype == EnumStateType.ATTACK then
            return
        end

        local x1, y1 = self:getPosition()
        local x2, y2 = self.target:getPosition()
        local distance = math.abs(x1-x2)

        if distance < 100 then
            self:setState(EnumStateType.ATTACK)

            local function scheduleAttack(dt)
                if self._isalive == false or self._target == 0 or self._target._isalive == false then
                    scheduler:unscheduleScriptEntry(self._scheduleAttackId)
                    self._scheduleAttackId = 0
                    return            
                end            
                local attacker = self
                local defender = self._target

                defender._blood = defender._blood - attacker._attack
                if defender._blood > 0 then
                    defender:runAction(cc.RotateBy:create(0.5, 360.0))
                else
                    defender._isalive = false
                    defender:setState(EnumStateType.DEAD)
                    attacker:setState(EnumStateType.STAND)
                end
            end

            self._scheduleAttackId = scheduler:scheduleScriptFunc(scheduleAttack, self._priority+5, false)            
        end  
    end

    self._target = findAliveWarrior()
end

return Monster3D