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
    "WALK",
    "ATTACK",
    "DEFEND",
    "KNOCKED",    
    "DEAD",
}
EnumStateType = CreateEnumTable(EnumStateType) 



local Base3D = class ("Base3D", function ()
	return cc.Node:create()
end)

function Base3D:ctor()
	self._isalive = true
	self._blood = 1000
	self._attack = 100
	self._defense = 100
	self._speed = 100
	self._priority = self._speed
    self._racetype = EnumRaceType.BASE
    self._statetype = EnumStateType.STAND
    self._sprite3d = nil
    self._circle = nil
    self._attackZone = nil
    self._scheduleAttackId = 0
    self._target = 0
    self._action = {stand="", attack="", walk="", defend=""}
end

function Base3D.create()
    local base = Base3D.new()	
    base:addCircle()
	return base
end

function Base3D:addCircle()
	self._circle = cc.Sprite:create("btn_circle_normal.png")
	self._circle:setScale(1.5)
	self:addChild(self._circle)
	
    self._attackZone = cc.ProgressTimer:create(cc.Sprite:create("btn_circle_normal.png"))
    self:addChild(self._attackZone)
    self._attackZone:setScale(1.5)
    self._attackZone:setColor(cc.c3b(255, 0, 0))
    self._attackZone:setType(cc.PROGRESS_TIMER_TYPE_RADIAL)
    self._attackZone:runAction(cc.ProgressTo:create(0, 25))	
end

function Base3D:setState(type)
    if self._statetype == type then
        return
    elseif type ~= EnumStateType.KNOCKED then
        self._sprite3d:stopActionByTag(self._statetype)    
        self._statetype = type
    end    

    if type == EnumStateType.STAND then
        local standAction = cc.RotateTo:create(0.5, 0)
        standAction:setTag(self._statetype) 
        self:runAction(standAction) 
    end

    if type == EnumStateType.DEAD then
        local rotateAngle = nil
        if self._racetype == EnumRaceType.DEBUG then
            rotateAngle = 90.0
        else 
            rotateAngle = -90.0
        end
        --self._sprite3d:runAction(cc.RotateTo:create(0.02, rotateAngle)) 
        self._sprite3d:runAction(cc.ScaleBy:create(0.2, 0.2))            
    end 

    if type == EnumStateType.WALK then
        local x = 0
        if self._racetype == EnumRaceType.DEBUG then
            x = 10
        else
            x = -10
        end
        local walkAction = cc.JumpBy:create(0.5, cc.p(x,0), 5, 1)
        local repeatAction = cc.RepeatForever:create(walkAction)
        repeatAction:setTag(self._statetype) 
        self._sprite3d:runAction(repeatAction)   
    end 

    if type == EnumStateType.ATTACK then
        local animation = cc.Animation3D:create(self._action.attack)
        local animate = cc.Animate3D:create(animation)
        animate:setSpeed(self._speed)
        local repeatAction = cc.RepeatForever:create(animate)
        repeatAction:setTag(self._statetype) 
        self._sprite3d:runAction(repeatAction)
    end

    if type == EnumStateType.DEFEND then
        local x = 0
        if self._racetype == EnumRaceType.HERO then
            x = -15
        else
            x = 15
        end    
        local defendAction = cc.RotateBy:create(0.5, x)
        defendAction:setTag(self._statetype) 
        self._sprite3d:runAction(defendAction)     
    end     
    
    if type == EnumStateType.KNOCKED then
        if self._racetype == EnumRaceType.BOSS then
            local action = cc.Sequence:create(cc.MoveBy:create(0.05, cc.p(5,5)),  cc.MoveBy:create(0.05, cc.p(-5,-5)))
            self._sprite3d:runAction(action)
        else 
            self._sprite3d:runAction(cc.RotateBy:create(0.5, 360.0))
        end 
    end
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
    if self._target ~= target and target ~= 0 and target._isalive then
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