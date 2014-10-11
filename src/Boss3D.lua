Boss3D = class("Boss3D",function ()
	return require "Base3D".create()
end)

local size = cc.Director:getInstance():getWinSize()
local scheduler = cc.Director:getInstance():getScheduler()

function Boss3D:ctor()

end

function Boss3D.create()
	local boss = Boss3D.new()
	boss:addSprite3D()
	
	--base
	boss:setRaceType(EnumRaceType.BOSS)
	
    local function MainLoop(dt)
        if EnumStateType.WALK == boss._statetype and boss._target ~= nil then
            local distance = boss._attackRadius + boss._target._radius
            local p1 = getPosTable(boss)
            local p2 = getPosTable(boss._target)
            if distance < cc.pGetDistance(p1, p2) then
                boss:setPosition(getNextStepPos(boss, p2, dt))
            end
        end
    end

    --mainloop
    scheduler:scheduleScriptFunc(MainLoop, 0, false)    
    
	--self
    local function update(dt)
        if boss.FindEnemy2Attack == nil then return  end
        boss:FindEnemy2Attack()        
    end

    scheduler:scheduleScriptFunc(update, 0.5, false)  
    	
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


return Boss3D