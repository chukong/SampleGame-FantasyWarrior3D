require "Helper"
local size = cc.Director:getInstance():getWinSize()
local scheduler = cc.Director:getInstance():getScheduler()
local activearea = {width = 500, height = 640}

HeroPool = List.new()
MonsterPool = List.new()
BossPool = List.new()

HeroManager = List.new()
MonsterManager = List.new()
BossManager = List.new()

function findAliveMonster()
    for val = MonsterManager.first, MonsterManager.last do
        if MonsterManager[val]._isalive == true then
            return MonsterManager[val]
        end                  
    end

    return 0
end

function findAliveHero()
    for val = HeroManager.first, HeroManager.last do
        if HeroManager[val]._isalive == true then
            return HeroManager[val]
        end                  
    end  

    return 0
end

function findAliveBoss()
    for val = BossManager.first, BossManager.last do
        if BossManager[val]._isalive == true then
            return BossManager[val]
        end                  
    end  

    return 0
end

function solveCollision(object1, object2)

    local miniDistance = object1._radius + object2._radius
    local obj1Pos = cc.p(object1:getPosition())
    local obj2Pos = cc.p(object2:getPosition())
    local tempDistance = cc.pGetDistance(obj1Pos, obj2Pos)
    
    if tempDistance < miniDistance then
        local angle = cc.pToAngleSelf(cc.pSub(obj1Pos, obj2Pos))
        local distance = miniDistance - tempDistance + 1 -- Add extra 1 to avoid 'tempDistance < miniDistance' is always true
        object1:setPosition(cc.pRotateByAngle(cc.pAdd(cc.p(distance/2,0),obj1Pos), obj1Pos, angle))
        object2:setPosition(cc.pRotateByAngle(cc.pAdd(cc.p(-distance/2,0),obj2Pos), obj2Pos, angle))
    end  
end

function collision(object)
    for val = HeroManager.first, HeroManager.last do
        local sprite = HeroManager[val]
        if sprite._isalive and sprite ~= object then
            solveCollision(sprite, object)
        end
    end

    for val = MonsterManager.first, MonsterManager.last do
        local sprite = MonsterManager[val]
        if sprite._isalive == true and sprite ~= object then
            solveCollision(sprite, object)
        end                  
    end 

    for val = BossManager.first, BossManager.last do
        local sprite = BossManager[val]
        if sprite._isalive == true and sprite ~= object then
            solveCollision(sprite, object)
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
    end    

    if currentPos.x > activearea.width then
        currentPos.x = activearea.width
        state = true
    end

    if currentPos.y < 0 then
        currentPos.y = 0
        state = true
    end

    if currentPos.y > activearea.height then
        currentPos.y = activearea.height
        state = true
    end

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
    	
    	local min = rotation
        local max = rotation + 90
        --cclog("%d [%f %f] %f", object1._racetype, rotation, rotation+90, angle)
        if angle >= min  and angle <= max then
            --cclog("in circle sector")
    		return true
    	end
    	
        if max > 360 and angle >= 0 and angle <= max - 360 then
           --cclog("in circle sector")
    	   return true
    	else
            faceToEnmey(object1, object2)
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
    
    angle = angle - 90 
    if angle > 180 then
        angle = angle - 360
    end
    
    return angle
end

function faceToEnmey(object1, object2)
    local pos1 = getPosTable(object1)
    local pos2 = getPosTable(object2)
    
    if cc.pGetDistance(pos1, pos2) > 500 then
        object1:setRotation(0)    
    else
        local angle = getAngleFrom2Point(pos2, pos1)
        object1:setRotation(angle)
    end
end

function attackAll(object)
    if object:getRaceType() ~= EnumRaceType.WARRIOR then
        for val = HeroManager.first, HeroManager.last do
            local sprite = HeroManager[val]
            if sprite._isalive == true 
                and sprite ~= object 
                and isInCircleSector(object, sprite) then
                    sprite._knockedMsgStruct = msgStruct
                    sprite:setState(EnumStateType.KNOCKED)
            end
        end
    else
        for val = MonsterManager.first, MonsterManager.last do
            local sprite = MonsterManager[val]
            if sprite._isalive == true 
                and sprite ~= object 
                and isInCircleSector(object, sprite) then
                    sprite._knockedMsgStruct = msgStruct
                    sprite:setState(EnumStateType.KNOCKED)
            end                
        end 

        for val = BossManager.first, BossManager.last do
            local sprite = BossManager[val]
            if sprite._isalive == true 
                and sprite ~= object 
                and isInCircleSector(object, sprite) then
                    sprite._knockedMsgStruct = msgStruct
                    sprite:setState(EnumStateType.KNOCKED)
            end
        end 
    end            
end