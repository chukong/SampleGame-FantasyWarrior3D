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
    "ATTACKING",
    "SPECIALATTACK",
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
    cclog(DEBUG_TYPESTATE[obj._statetype+1])
end

EnumStateType = CreateEnumTable(EnumStateType) 

local Base3D = class ("Base3D", function ()
	return cc.Node:create()
end)

function Base3D:ctor()
    self._radius = 50
    self._attackRadius = 50*1.5
	self._isalive = true
	self._blood = 1000
	self._attack = 100
	self._defense = 100
	self._speed = 500
	self._rotatehead = 3
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

function Base3D.create()
    local base = Base3D.new()	
    base:addCircle()
	return base
end

function Base3D:addCircle()
    self._circle = cc.Sprite:create("shadow.png")
	self._circle:setScale(1.5)
	self:addChild(self._circle)
	
    self._attackZone = cc.ProgressTimer:create(cc.Sprite:create("btn_circle_normal.png"))
    self:addChild(self._attackZone)
    self._attackZone:setScale(2.5)
    self._attackZone:setColor(cc.c3b(255, 0, 0))
    self._attackZone:setType(cc.PROGRESS_TIMER_TYPE_RADIAL)
    self._attackZone:runAction(cc.ProgressTo:create(0, 25))	
    self._attackZone:setRotation(45) 
    self._attackZone:setVisible(false)
end

function Base3D:setState(type)
    if self._statetype == type then return end
    
    self._statetype = type
end

--getter & setter

-- get hero type
function Base3D:getRaceType()
    return self._racetype
end

function Base3D:setRaceType(type)
	self._racetype = type
end

function Base3D:getStateType()
    return self._statetype
end

function Base3D:setStateType(type)
	self._statetype = type
end

function Base3D:setTarget(target)
    if self._target ~= target then
        self._target = target
    end
end

function Base3D:hurt(hurtCount)
    if self._isalive == true then
        self._blood = self._blood - hurtCount
        if self._blood > 0 then
            self:setState(EnumStateType.KNOCKED)
        else
            self._isalive = false
            self:setState(EnumStateType.DEAD)          
        end
    end
end

return Base3D