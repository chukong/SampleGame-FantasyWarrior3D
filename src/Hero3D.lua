Hero3D = class("Hero3D", function()
    return require "Base3D".create()
end)

local scheduler = cc.Director:getInstance():getScheduler()

function Hero3D:ctor()
    self._useWeaponId = 0
    self._useArmourId = 0
    self._arm = ""
    self._chest = ""
    self._weapon = ""
end

function Hero3D.create(type)
    
    local hero = Hero3D.new()
    hero:AddSprite3D(type)
    
    -- base
    hero:setRaceType(type)

    --self
    hero._weapon = math.random() .. ""
    
    local function update(dt)
        hero:FindEnemy2Attack()
    end

    scheduler:scheduleScriptFunc(update, 0.5, false)    
    
    return hero
end

function Hero3D:AddSprite3D(type)
    
    local filename;
    if type == EnumRaceType.WARRIOR then --warrior
        filename = "Sprite3DTest/ReskinGirl.c3b"
    elseif type == EnumRaceType.ARCHER then --archer
        filename = "Sprite3DTest/ReskinGirl.c3b"
    elseif type == EnumRaceType.WAGE then --wage
        filename = "Sprite3DTest/ReskinGirl.c3b"
    else
        filename = "Sprite3DTest/orc.c3b" 
    end
    self._sprite3d = cc.Sprite3D:create(filename)
    self:addChild(self._sprite3d)
    self._sprite3d:setRotation3D({x = 90, y = 0, z = 0})        
    self._sprite3d:setRotation(180)
            
    self._action.attack = filename
    
    --set default equipment
    if type ~= EnumRaceType.DEBUG then
        self:setDefaultEqt()
    end
end

-- set default equipments
function Hero3D:setDefaultEqt()
    local girl_lowerbody = self._sprite3d:getMeshByName("Girl_LowerBody01")
    girl_lowerbody:setVisible(false)
    local girl_shoe = self._sprite3d:getMeshByName("Girl_Shoes01")
    girl_shoe:setVisible(false)
    local girl_hair = self._sprite3d:getMeshByName("Girl_Hair01")
    girl_hair:setVisible(false)
    local girl_upperbody = self._sprite3d:getMeshByName("Girl_UpperBody01")
    girl_upperbody:setVisible(false)
end

--swicth weapon
function Hero3D:switchWeapon()
    self._useWeaponId = self._useWeaponId+1
    if self._useWeaponId > 1 then
        self._useWeaponId = 0;
    end
    if self._useWeaponId == 1 then
        local girl_lowerbody = self._sprite3d:getMeshByName("Girl_LowerBody01")
        girl_lowerbody:setVisible(true)
        local girl_lowerbody = self._sprite3d:getMeshByName("Girl_LowerBody02")
        girl_lowerbody:setVisible(false)
        local girl_shoe = self._sprite3d:getMeshByName("Girl_Shoes01")
        girl_shoe:setVisible(true)
        local girl_shoe = self._sprite3d:getMeshByName("Girl_Shoes02")
        girl_shoe:setVisible(false)
    else
        local girl_lowerbody = self._sprite3d:getMeshByName("Girl_LowerBody01")
        girl_lowerbody:setVisible(false)
        local girl_lowerbody = self._sprite3d:getMeshByName("Girl_LowerBody02")
        girl_lowerbody:setVisible(true)
        local girl_shoe = self._sprite3d:getMeshByName("Girl_Shoes01")
        girl_shoe:setVisible(false)
        local girl_shoe = self._sprite3d:getMeshByName("Girl_Shoes02")
        girl_shoe:setVisible(true)
    end
end

--switch armour
function Hero3D:switchArmour()
    self._useArmourId = self._useArmourId+1
    if self._useArmourId > 1 then
        self._useArmourId = 0;

    end
    if self._useArmourId == 1 then
        local girl_lowerbody = self._sprite3d:getMeshByName("Girl_Hair01")
        girl_lowerbody:setVisible(true)
        local girl_lowerbody = self._sprite3d:getMeshByName("Girl_Hair02")
        girl_lowerbody:setVisible(false)
        local girl_shoe = self._sprite3d:getMeshByName("Girl_UpperBody01")
        girl_shoe:setVisible(true)
        local girl_shoe = self._sprite3d:getMeshByName("Girl_UpperBody02")
        girl_shoe:setVisible(false)
    else
        local girl_lowerbody = self._sprite3d:getMeshByName("Girl_Hair01")
        girl_lowerbody:setVisible(false)
        local girl_lowerbody = self._sprite3d:getMeshByName("Girl_Hair02")
        girl_lowerbody:setVisible(true)
        local girl_shoe = self._sprite3d:getMeshByName("Girl_UpperBody01")
        girl_shoe:setVisible(false)
        local girl_shoe = self._sprite3d:getMeshByName("Girl_UpperBody02")
        girl_shoe:setVisible(true)
    end
end


-- get weapon id
function Hero3D:getWeaponID()
    return self._useWeaponId
end

-- get armour id
function Hero3D:getArmourID()
    return self._useArmourId
end


-- find enemy
function Hero3D:FindEnemy2Attack()
    if self._isalive == false then return end 

    local fjksd = self._statetype
    local bbbb = self._scheduleAttackId
    if self._statetype == EnumStateType.ATTACK and self._scheduleAttackId == 0 then
        local function scheduleAttack(dt)
            if self._isalive == false or (self._target == 0 and self.target._isalive == false) then
                scheduler:unscheduleScriptEntry(self._scheduleAttackId)
                self._scheduleAttackId = 0
                return          
            end

            self._target:hurt(self._attack)
        end    
        self._scheduleAttackId = scheduler:scheduleScriptFunc(scheduleAttack, 1, false)            
    end

    if self._statetype ~= EnumStateType.ATTACK and self._scheduleAttackId ~= 0 then
        scheduler:unscheduleScriptEntry(self._scheduleAttackId)
        self._scheduleAttackId = 0
    end  
end

return Hero3D