require("Cocos2d")

local DropBlood = class("DropBlood",function()
    return cc.Node:create()
end)

function DropBlood:create()
    self._isBlooding = false
    self._num = 0
    return DropBlood.new()
end

function DropBlood:showBloodLossNum(num)
    local time = 1
    local function getRandomXYZ()
        local rand_x = 20*math.sin(math.rad(time*0.5+4356))
        local rand_y = 20*math.sin(math.rad(time*0.37+5436)) 
        local rand_z = 20*math.sin(math.rad(time*0.2+54325))
        return {x=rand_x,y=rand_y,z=rand_z}
    end
    
    local function getBlood()
        num = self._num
        local ttfconfig = {outlineSize=7,fontSize=50,fontFilePath="fonts/britanic bold.ttf"}
        local blood = cc.BillBoardLable:createWithTTF(ttfconfig,"-"..num,cc.TEXT_ALIGNMENT_CENTER,400)
        blood:enableOutline(cc.c4b(0,0,0,255))
        blood:setScale(0.1)
        blood:setRotation3D(getRandomXYZ())

        local targetScale = 1
        if num > 200 then 
            blood:setColor(cc.c3b(255,0,0))
        elseif num > 100 then
            blood:setColor(cc.c3b(250,121,65))
            targetScale = 0.75
        else
            blood:setColor(cc.c3b(250,191,65))
            targetScale = 0.85
        end
        local sequence = cc.Sequence:create(cc.EaseElasticOut:create(cc.ScaleTo:create(0.5,targetScale),0.4),
            cc.FadeOut:create(0.5),
            cc.RemoveSelf:create(),
            cc.CallFunc:create(function()
                print("end")
                self._isBlooding=false 
                self._num = 0
            end)
        )
        local spawn = cc.Spawn:create(sequence,
            cc.MoveBy:create(1,{x=0,y=0,z=150}),
            cc.RotateBy:create(1,math.random(-40,40)))
        blood:runAction(spawn)
        self._blood = blood
        
        return blood
    end
    
    if self._isBlooding == false then
        self._isBlooding = true
        self._num = num
    else
        print(self._num)
        self._blood:stopAllActions()
        self._blood:removeFromParent(true)
        self._num = self._num+num
    end
    
    return getBlood()
end

return DropBlood