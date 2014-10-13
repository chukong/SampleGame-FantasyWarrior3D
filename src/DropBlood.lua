require("Cocos2d")

local DropBlood = class("DropBlood",function()
    return cc.Node:create()
end)

function DropBlood:ctor()
    self._isBloodLabelShowing = false
    self._size = cc.Director:getInstance():getWinSize()
end

function DropBlood:create()
    local dropBlood = DropBlood:new()
    dropBlood:addBillBoard()
    dropBlood:addEventListener()
    
    return dropBlood
end

function DropBlood:addEventListener()
    local function callback(num)
        self:showBloodLossNum(num)
    end

    local dispatch = require("MessageDispatchCenter")
    dispatch:registerMessage(dispatch.MessageType.BLOOD_DROP,callback)
end

function DropBlood:addBillBoard()
    local billBoard = cc.BillBoard:create("choosechapterscene/dog.png")
    billBoard:setScale(0.1)
    billBoard:setBlendFunc(gl.SRC_ALPHA,gl.ONE_MINUS_SRC_ALPHA)
--    billBoard:setCameraMask(2)
    self._billBoard = billBoard
    self:addChild(billBoard)
end

function DropBlood:showBloodLossNum(time)
    local function getRandomXYZ()
        local rand_x = 20*math.sin(math.rad(time*0.5+4356))
        local rand_y = 20*math.sin(math.rad(time*0.37+5436)) 
        local rand_z = 20*math.sin(math.rad(time*0.2+54325))
        time = time+1
        return {x=rand_x,y=rand_y,z=rand_z}
    end

    if not self._isBloodLabelShowing then
        self._isBloodLabelShowing = true
        local ttfconfig = {outlineSize=7,fontSize=50,fontFilePath="fonts/britanic bold.ttf"}
        local num = time
        local blood = cc.Label:createWithTTF(ttfconfig,"-"..num,cc.TEXT_ALIGNMENT_CENTER,400)
        blood:enableOutline(cc.c4b(0,0,0,255))
        blood:setScale(0.1)
--        blood:setPosition3D({x=-self._size.width*0.4,y=self._size.height*0.65,z=0})
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
            cc.RemoveSelf:create()
        )
        local spawn = cc.Spawn:create(sequence,
            cc.MoveBy:create(1,cc.p(0,150)),
            cc.RotateBy:create(1,math.random(-40,40)))
        blood:runAction(spawn)
        
        --add to billboard
        self._billBoard:addChild(blood)
        self._isBloodLabelShowing = false
    else

    end
end

return DropBlood