Boss3D = class("Boss3D",function ()
	return require "Base3D".create()
end)

function Boss3D:ctor()

end

function Boss3D.create()
	local boss = Boss3D.new()
	boss:addSprite3D()
	
	--base
	boss:setRaceType(EnumRaceType.BOSS)
	
	--self
	
	
	return boss
end

function Boss3D:addSprite3D()
    local filename = "Sprite3DTest/girl.c3b";
    self._sprite3d = cc.Sprite3D:create(filename)
    self:addChild(self._sprite3d)
    self._sprite3d:setRotation3D({x = 90, y = 0, z = 0})        
    self._sprite3d:setRotation(180)

    self._action.attack = filename
end

local scheduler = cc.Director:getInstance():getScheduler()

function Boss3D:FindEnemy2Attack()
    if self._isalive == false then return end 

    if self._target ~= 0 and self._target._isalive then
        if self._statetype == EnumStateType.ATTACK then
            return
        end

        local x1, y1 = self:getPosition()
        local x2, y2 = self._target:getPosition()
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

    self.target = findAliveWarrior()
end


return Boss3D