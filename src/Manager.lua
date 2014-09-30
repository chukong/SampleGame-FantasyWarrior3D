require "Helper"

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
    local miniDistance = 100
    local startP = cc.p(object1:getPosition())
    local endP = cc.p(object2:getPosition())

    local tempDistance = cc.pGetDistance(startP, endP)
    if tempDistance < miniDistance then
        local tempX, tempZ
        if startP.x > endP.x then
            tempX =  startP.x - endP.x                
        else
            tempX = endP.x - startP.x
        end

        if startP.y > endP.y then
            tempZ =  startP.y - endP.y                
        else
            tempZ = endP.y - startP.y
        end

        local ratio = (miniDistance - tempDistance) / miniDistance
        tempX = ratio * tempX + tempX * 0.01
        tempZ = ratio * tempZ + tempZ * 0.01
        if tempX == 0 then tempX = 0.01 end  -- setPosition3D doesn't work when only z is changed      

        if startP.x > endP.x then
            startP.x = startP.x + tempX/2
            endP.x = endP.x - tempX/2
        else
            startP.x = startP.x - tempX/2
            endP.x = endP.x + tempX/2                                        
        end

        if startP.y > endP.y then
            startP.y = startP.y + tempZ/2
            endP.y = endP.y - tempZ/2
        else
            startP.y = startP.y - tempZ/2
            endP.y = endP.y + tempZ/2                                        
        end                

        object1:setPosition(startP)
        object2:setPosition(endP)
    elseif tempDistance < miniDistance + 1 then           
        --cclog("i'm ready for attack")
        if object1:getRaceType() ~= object2:getRaceType() then
            object1:setState(EnumStateType.ATTACK)
            object1:setTarget(object2)
        end
    else
        if object1._target == 0 then 
            object1:setState(EnumStateType.STAND)
        elseif object1._target._isalive == false then
            object1:setState(EnumStateType.STAND)
        end
    end  
end

function collisionDetectHero(Object)
    for val = 1, List.getSize(HeroManager) do
        local sprite = HeroManager[val-1]
        if sprite._isalive == true and sprite ~= Object then
            tooClose(sprite, Object)
        end
    end

    for val = 1, List.getSize(MonsterManager) do
        local sprite = MonsterManager[val-1]
        if sprite._isalive == true and sprite ~= Object then
            tooClose(sprite, Object)
        end                  
    end 

    for val = 1, List.getSize(BossManager) do
        local sprite = BossManager[val-1]
        if sprite._isalive == true and sprite ~= Object then
            tooClose(sprite, Object)
        end
    end     
end