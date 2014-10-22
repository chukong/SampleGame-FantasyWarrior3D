require "Helper"
local size = cc.Director:getInstance():getWinSize()
local scheduler = cc.Director:getInstance():getScheduler()
local activearea = {width = 500, height = 640}

HeroPool = List.new()
DragonPool = List.new()
SlimePool = List.new()
PigletPool = List.new()
RatPool = List.new()
BossPool = List.new()

HeroManager = List.new()
MonsterManager = List.new()
BossManager = List.new()

local function solveCollision(object1, object2)
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

local function collision(object)
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

local function isOutOfBound(object)
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

function collisionDetect(dt)
    --cclog("collisionDetect")
    for val = HeroManager.last, HeroManager.first, -1 do
        local sprite = HeroManager[val]
        if sprite._isalive == true then
            collision(sprite)
            isOutOfBound(sprite)
        else
            List.remove(HeroManager, val)
        end
    end

    for val = MonsterManager.last, MonsterManager.first, -1 do
        local sprite = MonsterManager[val]
        if sprite._isalive == true then
            collision(sprite)
            isOutOfBound(sprite)            
        else
            List.remove(MonsterManager, val)
        end
    end    

    for val = BossManager.last, MonsterManager.first, -1 do
        local sprite = BossManager[val]
        if sprite._isalive == true then
            collision(sprite)
            isOutOfBound(sprite)            
        else
            List.remove(BossManager, val)
        end
    end        
end