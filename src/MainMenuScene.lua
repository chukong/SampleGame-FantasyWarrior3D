require "Cocos2d"

--declare a class extends scene
local MainMenuScene = class("MainMenuScene",function()
    return cc.Scene:create()
end
)

--constructor init member variable
function MainMenuScene:ctor()
    --get win size
    self.size = cc.Director:getInstance():getVisibleSize()
    self._isBloodLabelShowing = false
    math.randomseed(os.time())
end

function MainMenuScene.create()
    local scene = MainMenuScene.new()
    --add layer
    local layer = scene:createLayer()
    scene:addChild(layer)
    
    return scene
end

--crate a main layer
function MainMenuScene:createLayer()
    local mainLayer = cc.Layer:create()
    
    --add bg
    self:addBg(mainLayer)
    
    --add cloud
    self:addCloud(mainLayer)
    
    --add button
    self:addButton(mainLayer)
    
    --add logo
    self:addLogo(mainLayer)
    
    --
    local function onExit(event)
        if "exit" == event then
            cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.logoSchedule)
            cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.scheduleCloudMove)
        end
    end
    mainLayer:registerScriptHandler(onExit)
    
    return mainLayer
end

function MainMenuScene:addLogo(layer)
    --add logo
    local logo = cc.Sprite:create("mainmenugame/logo.png")
    logo:setPosition(self.size.width*0.7,self.size.height+logo:getContentSize().height/2)
    layer:addChild(logo,4)
    
    --from fast to slow
    --   cc.EaseOut:create(action,rate)
    --   cc.EaseBackOut:create(action)
    --   cc.EaseElasticOut:create(cc.ActionInterval,float)
    local action = cc.EaseElasticOut:create(cc.MoveBy:create(2,cc.p(0, -self.size.height*0.45)))
    
    logo:runAction(action)
    
    --set random seed
    local time = 0
    --logo animation
    local function logoShake()
        --rand_n = range * math.sin(math.rad(time*speed+offset))
        local rand_x = 0.1*math.sin(math.rad(time*0.5+4356))
        local rand_y = 0.1*math.sin(math.rad(time*0.37+5436)) 
        local rand_z = 0.1*math.sin(math.rad(time*0.2+54325))
        logo:setRotation3D({x=math.deg(rand_x),y=math.deg(rand_y),z=math.deg(rand_z)})
        time = time+1
    end
    self.logoSchedule = cc.Director:getInstance():getScheduler():scheduleScriptFunc(logoShake,0,false)
end

function MainMenuScene:addButton(layer)
    local button_callback = function(sender,eventType)
        print(eventType)
        if eventType == ccui.TouchEventType.ended then
        	cc.Director:getInstance():replaceScene(require("ChooseRoleScene").create())
        end
    end

    local button = ccui.Button:create("mainmenugame/button.png")
    button:setPressedActionEnabled(true)
    button:setPosition(self.size.width*0.87,self.size.height*0.28)
--    button:registerScriptHandler(button_callback)
    button:addTouchEventListener(button_callback)
    button:setOpacity(0)
    button:runAction(cc.Sequence:create(cc.FadeIn:create(3)))
    layer:addChild(button,4)
    
--    local button_item = cc.MenuItemImage:create("mainmenugame/button.png","mainmenugame/button.png")
--    button_item:registerScriptTapHandler(button_callback)
--    button_item:setPosition(self.size.width*0.87,self.size.height*0.28)
--    button_item:setOpacity(0)
--    button_item:runAction(cc.Sequence:create(cc.FadeIn:create(3)))
--    local menu = cc.Menu:create(button_item)
--    menu:setPosition({0,0})
--    layer:addChild(menu,4) 

end

function MainMenuScene:addCloud(layer)
    --cloud
    local cloud0 = cc.Sprite:create("mainmenugame/cloud1.png")
    local cloud1 = cc.Sprite:create("mainmenugame/cloud1.png")
    local cloud2 = cc.Sprite:create("mainmenugame/cloud3.png")
    local cloud3 = cc.Sprite:create("mainmenugame/cloud2.png")
    local cloud4 = cc.Sprite:create("mainmenugame/cloud3.png")
    
    --setPosition
    cloud0:setPosition(self.size.width*1.1,self.size.height*0.7)
    cloud1:setPosition(self.size.width*0.38,self.size.height*0.7)
    cloud2:setPosition(self.size.width*0.65,self.size.height*0.83)
    cloud3:setPosition(self.size.width*0.9,self.size.height*0.7)
    cloud4:setPosition(self.size.width*1.4,self.size.height*0.83)
    
    --add to layer
    layer:addChild(cloud0,2)
    layer:addChild(cloud1,2)
    layer:addChild(cloud2,2)
    layer:addChild(cloud3,2)
    layer:addChild(cloud4,2)
    local clouds = {cloud0,cloud1,cloud2,cloud3,cloud4}
    
    --move cloud
    local function cloud_move()
        --set cloud move speed
        local offset = {-0.5,-0.5,-1.2,-1,-1.2}
        for i,v in pairs(clouds) do
            local point = v:getPositionX()+offset[i]
            if(point<-v:getContentSize().width/2) then
                point = self.size.width+v:getContentSize().width/2
            end
            v:setPositionX(point)
        end

    end
    self.scheduleCloudMove = cc.Director:getInstance():getScheduler():scheduleScriptFunc(cloud_move,1/60,false)
end

function MainMenuScene:addBg(layer)
    --background
    local bg_back = cc.Sprite:create("mainmenugame/bg_back.png")
    local bg_front = cc.Sprite:create("mainmenugame/bg_front.png")
    bg_back:setPosition(self.size.width/2,self.size.height/2)
    bg_front:setPosition(self.size.width/2,self.size.height/2)
    layer:addChild(bg_back,1)
    layer:addChild(bg_front,3)
    
    --test
    self:showBloodLossNum(layer)
    
    --test billboardparticlesysytem
    local particle = cc.BillboardParticleSystem:create("toonSmoke.plist")
    particle:setPosition({x=200,y=200})
    particle:setDuration(-1)
    particle:setStartColor({r=234,g=123,b=245,a=255})
    layer:addChild(particle,5)
    
    --test jump3D
    self:testJump3D(layer)
end

function MainMenuScene:testDispatcher()
    --test MessageDispatchCenter
    local function test1(v)
        print(v)
    end

    local function test2(v)
        print(v.x,v.y)
    end

    --register
    local dispatch1 = require("MessageDispatchCenter")
    dispatch1:registerMessage(dispatch1.MessageType.BLOOD_DROP,test1)

    local dispatch2 = require("MessageDispatchCenter")
    dispatch2:registerMessage(dispatch2.MessageType.BLOOD_DROP,test1)
    --remove messagecenter
    dispatch2:removeMessage(dispatch2.MessageType.BLOOD_DROP,test1)

    --dispatch
    local dispatch3 = require("MessageDispatchCenter")
    dispatch3:dispatchMessage(dispatch2.MessageType.BLOOD_DROP,"test")

    local dispatch4 = require("MessageDispatchCenter")
    dispatch4:dispatchMessage(dispatch2.MessageType.BLOOD_DROP,"dispatch")

    --register
    local dispatch5 = require("MessageDispatchCenter")
    dispatch5:registerMessage(dispatch5.MessageType.REDUCE_SCORE,test2)

    local dispatch6 = require("MessageDispatchCenter")
    --    dispatch6:registerMessage(dispatch6.MessageType.REDUCE_SCORE,test2)

    --dispatch
    local dispatch7 = require("MessageDispatchCenter")
    dispatch7:dispatchMessage(dispatch7.MessageType.REDUCE_SCORE,{x=1,y=2})

    local dispatch8 = require("MessageDispatchCenter")
    dispatch8:dispatchMessage(dispatch8.MessageType.REDUCE_SCORE,{x=3,y=4})
end

function MainMenuScene:testJump3D(layer)
    local action = cc.JumpBy:create(2,cc.p(350,400),10,3)
    local sprite = cc.Sprite:create("dog.png")
    sprite:runAction(action)
    sprite:setPosition({x=100,y=100})
    
    layer:addChild(sprite,7)
end

function MainMenuScene:showBloodLossNum(layer)
    local time = math.random(0,300)
    
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
--        blood:setOpacity(50)
        blood:setScale(0)
        blood:setPosition3D({x=400,y=200,z=0})
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
--        blood:runAction(cc.FadeIn:create(0.3))
        local sequence = cc.Sequence:create(cc.EaseElasticOut:create(cc.ScaleTo:create(0.5,targetScale),0.4),
            cc.FadeOut:create(0.5),
            cc.RemoveSelf:create(),
            cc.CallFunc:create(function()self._isBloodLabelShowing = false 
                self:showBloodLossNum(layer)
            end)
            )
        local spawn = cc.Spawn:create(sequence,
            cc.MoveBy:create(1,cc.p(0,150)),
            cc.RotateBy:create(1,math.random(-40,40)))
        blood:runAction(spawn)
            
        layer:addChild(blood,5)
    else
    
    end
   

end

return MainMenuScene