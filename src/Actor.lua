require "Helper"

--type

EnumRaceType = 
{ 
    "DEBUG",
    "BASE",
    "HERO", 
    "WARRIOR",
    "ARCHER",
    "SORCERESS",
    "MONSTER",
    "BOSS", 
}
EnumRaceType = CreateEnumTable(EnumRaceType) 

EnumStateType =
{
    "STAND",
    "STANDING",
    "WALK",
    "ATTACK",
    "NORMALATTACK",
    "SPECIALATTACK",
    "NORMALATTACKING",
    "SPECIALATTACKING",
    "DEFEND",
    "KNOCKED",    
    "KNOCKING",
    "DEAD",
    "DYING",
    "NULL" -- means dead already.
}

DEBUG_TYPESTATE = {}
for key, var in pairs(EnumStateType) do
    DEBUG_TYPESTATE[key] = var	
end
function getDebugStateType(obj)
    if type(obj) == "number" then
        cclog(DEBUG_TYPESTATE[obj+1])    
    else
        cclog(DEBUG_TYPESTATE[obj._statetype+1])
    end
end

EnumStateType = CreateEnumTable(EnumStateType) 

local Actor = class ("Actor", function ()
	return cc.Node:create()
end)

function Actor:ctor()
    self._radius = 50
    self._attackRadius = 50*3.5
	self._isalive = true
	self._hp = 1000
	self._attack = 100
	self._defense = 100
	self._speed = 500
	self._priority = self._speed
    self._racetype = EnumRaceType.BASE
    self._statetype = nil
    self._sprite3d = nil
    self._circle = nil
    self._attackZone = nil
    self._scheduleAttackId = 0
    self._target = nil
    self._action = {
                    -- stand = nil,
                    -- walk = nil,
                    -- attack = nil,
                    -- specialattack = nil,
                    -- defense = nil,
                    -- knocked = nil,
                    -- dead = nil
                   }
end

function Actor.create()
    local base = Actor.new()	
    base:addShadow(50, 0.7)
	return base
end

function Actor:addShadow(size, opacity)
    self._circle = cc.Sprite:create("shadow.png")
	self._circle:setScale(size/32)
	self._circle:setOpacity(255*opacity)
	self:addChild(self._circle)
	
--    self._attackZone = cc.ProgressTimer:create(cc.Sprite:create("btn_circle_normal.png"))
--    self:addChild(self._attackZone)
--    self._attackZone:setScale(2.5)
--    self._attackZone:setColor(cc.c3b(255, 0, 0))
--    self._attackZone:setType(cc.PROGRESS_TIMER_TYPE_RADIAL)
--    self._attackZone:runAction(cc.ProgressTo:create(0, 25))	
--    self._attackZone:setRotation(45) 
--    self._attackZone:setVisible(false)
end

function Actor:setState(type)
    if self._statetype == type then return end
    
    self._statetype = type
end

--getter & setter

-- get hero type
function Actor:getRaceType()
    return self._racetype
end

function Actor:setRaceType(type)
	self._racetype = type
end

function Actor:getStateType()
    return self._statetype
end

function Actor:setStateType(type)
	self._statetype = type
end

function Actor:setTarget(target)
    if self._target ~= target then
        self._target = target
    end
end

function Actor:hurt(damage)
    if self._isalive == true then
        self._hp = self._hp - damage
        if self._hp > 0 then
            self:setState(EnumStateType.KNOCKED)
        else
            self._isalive = false
            self:setState(EnumStateType.DEAD)          
        end
    end
end

return Actor