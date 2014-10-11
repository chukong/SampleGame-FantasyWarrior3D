Monster3D = class("Monster3D",function ()
	return require "Base3D".create()
end)

local size = cc.Director:getInstance():getWinSize()
local scheduler = cc.Director:getInstance():getScheduler()

function Monster3D:ctor()

end

function Monster3D.create(type)

    local monster = Monster3D.new()
    monster:AddSprite3D(type)    
    
    --base
    monster:setRaceType(type)

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
    
    --self
    local function update(dt)
        if monster.FindEnemy2Attack == nil then return  end
        monster:FindEnemy2Attack()        
    end

    scheduler:scheduleScriptFunc(update, 0.5, false)  
    
    return monster
end

function Monster3D:AddSprite3D(type)
	
    local filename = "Sprite3DTest/orc.c3b";
    self._sprite3d = cc.EffectSprite3D:create(filename)
    self._sprite3d:addEffect(cc.V3(0,0,0),0.01, -1)
    self:addChild(self._sprite3d)
    self._sprite3d:setRotation3D({x = 90, y = 0, z = 0})        
    self._sprite3d:setRotation(0)
      
    self._action.attack = filename
    
    local animation3d = cc.Animation3D:create(filename)
    local animate3d = cc.Animate3D:create(animation3d)
    self._sprite3d:runAction(cc.RepeatForever:create(animate3d))

end

local scheduler = cc.Director:getInstance():getScheduler()

function Monster3D:FindEnemy2Attack()
    if self._isalive == false then
        if self._scheduleAttackId ~= 0 then
            scheduler:unscheduleScriptEntry(self._scheduleAttackId)
            self._scheduleAttackId = 0
        end
        return
    end 
    
    if self._statetype == EnumStateType.ATTACK and self._scheduleAttackId == 0 then
        local function scheduleAttack(dt)
            if self._target == nil or self._target == 0 or self._target._isalive == false then
                scheduler:unscheduleScriptEntry(self._scheduleAttackId)
                self._scheduleAttackId = 0
                return
            end
            
            self._attackZone:runAction(cc.Sequence:create(cc.ProgressTo:create(0, 0), cc.ProgressTo:create(0.3, 25))) 
            self._target:hurt(self._attack)
        end    
        self._scheduleAttackId = scheduler:scheduleScriptFunc(scheduleAttack, 1, false)            
    end

    if self._statetype ~= EnumStateType.ATTACK and self._scheduleAttackId ~= 0 then
        scheduler:unscheduleScriptEntry(self._scheduleAttackId)
        self._scheduleAttackId = 0
    end  
end

return Monster3D