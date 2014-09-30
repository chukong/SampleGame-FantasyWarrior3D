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
end

return MainMenuScene