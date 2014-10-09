require "Helper"
local size = cc.Director:getInstance():getWinSize()
local scheduler = cc.Director:getInstance():getScheduler()

HeroManager = List.new()
MonsterManager = List.new()
BossManager = List.new()

function findAliveMonster()
    for val = 1, List.getSize(MonsterManager) do
        if MonsterManager[val-1]._isalive == true then
            return MonsterManager[val-1]
        end                  
    end

    return 0
end

function findAliveHero()
    for val = 1, List.getSize(HeroManager) do
        if HeroManager[val-1]._isalive == true then
            return HeroManager[val-1]
        end                  
    end  

    return 0
end

function findAliveBoss()
    for val = 1, List.getSize(BossManager) do
        if BossManager[val-1]._isalive == true then
            return BossManager[val-1]
        end                  
    end  

    return 0
end

function tooClose(object1, object2)

    local miniDistance = object1._radius + object2._radius
    local obj1Pos = cc.p(object1:getPosition())
    local obj2Pos = cc.p(object2:getPosition())
    local tempDistance = cc.pGetDistance(obj1Pos, obj2Pos)
    
    if tempDistance < miniDistance then
        local angle = cc.pToAngleSelf(cc.pSub(obj1Pos, obj2Pos))
        local distance = miniDistance - tempDistance
        object1:setPosition(cc.pRotateByAngle(cc.pAdd(cc.p(distance/2,0),obj1Pos), obj1Pos, angle))
        object2:setPosition(cc.pRotateByAngle(cc.pAdd(cc.p(-distance/2,0),obj2Pos), obj2Pos, angle))
    --elseif tempDistance < miniDistance + 1 then
    elseif isInCircleSector(object1, object2) then           
        --cclog("i'm ready for attack")
        if object1:getRaceType() ~= object2:getRaceType() then
            object1:setState(EnumStateType.ATTACK)
            object1:setTarget(object2)
        end
    else
--        if object1._target == 0 then 
--            object1:setState(EnumStateType.STAND)
--        else
--            if object1._target == object2 then
--                object1:setTarget(0)
--                object1:setState(EnumStateType.STAND)
--            end
--        end        
    end  
end

function collision(object)
    for val = 1, List.getSize(HeroManager) do
        local sprite = HeroManager[val-1]
        if sprite._isalive == true and sprite ~= object then
            tooClose(sprite, object)
        end
    end

    for val = 1, List.getSize(MonsterManager) do
        local sprite = MonsterManager[val-1]
        if sprite._isalive == true and sprite ~= object then
            tooClose(sprite, object)
        end                  
    end 

    for val = 1, List.getSize(BossManager) do
        local sprite = BossManager[val-1]
        if sprite._isalive == true and sprite ~= object then
            tooClose(sprite, object)
        end
    end     
end

function getFocusPointOfHeros()
    local ptFocus ={x=0, y=0}
    for var =1, List.getSize(HeroManager) do
        ptFocus.x=ptFocus.x+HeroManager[var-1]:getPositionX()
        ptFocus.y=ptFocus.y+HeroManager[var-1]:getPositionY()
    end
    ptFocus.x = ptFocus.x/List.getSize(HeroManager)
    ptFocus.y = ptFocus.y/List.getSize(HeroManager)
    return ptFocus
end

function isOutOfBound(object)
    local currentPos = cc.p(object:getPosition());
    local state = false;

    if currentPos.x < 0 then
        currentPos.x = 0
        state = true
        beginUpdate = false
    end    

    if currentPos.x > size.width then
        currentPos.x = size.width
        state = true
        beginUpdate = false
    end

    if currentPos.y < 0 then
        currentPos.y = 0
        state = true
        beginUpdate = false
    end

    if currentPos.y > size.height then
        currentPos.y = size.height
        state = true
        beginUpdate = false
    end

    object:setPosition(currentPos)
    return state
end

function isInCircleSector(object1, object2)
    local attackDistance = object1._attackRadius + object2._radius
    local obj1Pos = cc.p(object1:getPosition())
    local obj2Pos = cc.p(object2:getPosition())
    local tempDistance = cc.pGetDistance(obj1Pos, obj2Pos)
   
    if tempDistance < attackDistance then
    	local angle = getAngleFrom2Point(obj2Pos, obj1Pos)
    	local rotation = object1:getRotation()
    	
    	if angle < 0 then
    		angle = angle + 360
    	end

        if rotation < 0 then
            rotation = rotation + 360
        end    	
    	
        --cclog("%d %f %f", object1._racetype, angle, rotation)
        if angle >= rotation  and angle <= rotation + 25 then
            --cclog("11111")
    		return true
    	end
    end 
    
    return false
end

function getAngleFrom2Point(p1, p2)
    local distance = cc.pGetDistance(p1,p2)
    local angle = math.acos( math.abs(p1.x-p2.x)/distance) * 57.2957795
    if p1.x >= p2.x and p1.y >= p2.y then
        angle = 90 - angle
    elseif p1.x >= p2.x and p1.y <= p2.y then
        angle = 90 + angle
    elseif p1.x <= p2.x and p1.y <= p2.y then
        angle = 270 - angle   
    else
        angle = 270 + angle   
    end
    
    angle = angle - 25 
    if angle > 180 then
        angle = angle - 360
    end
    
    return angle
end