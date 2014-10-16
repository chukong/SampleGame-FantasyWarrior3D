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
    
    --when replease scene unschedule schedule
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
    local logo = cc.EffectSprite:create("mainmenuscene/logo.png")
    self._logoSize = logo:getContentSize()
    logo:setPosition(self.size.width*0.68,self.size.height+self._logoSize.height*0.4)
    layer:addChild(logo,4)
    
    local action = cc.EaseElasticOut:create(cc.MoveBy:create(2,cc.p(0, -self.size.height*0.45)))
    
    logo:runAction(action)
    
    --logo shake
    local time = 0
    --logo animation
    local function logoShake()
        --rand_n = range * math.sin(math.rad(time*speed+offset))
        local rand_x = 0.1*math.sin(math.rad(time*0.5+4356))
        local rand_y = 0.1*math.sin(math.rad(time*0.37+5436)) 
        local rand_z = 0.1*math.sin(math.rad(time*0.2+54325))
        logo:setRotation3D({x=math.deg(rand_x),y=math.deg(rand_y),z=math.deg(rand_z)})
        time = time+1
        self._pointLight:setPosition3D(cc.vec3(math.abs(rand_x)*self._logoSize.width*9,math.abs(rand_y)*self._logoSize.height*9,math.abs(rand_z)*50))
        self._lightSprite:setPosition3D(cc.vec3(math.abs(rand_x)*self._logoSize.width*9,math.abs(rand_y)*self._logoSize.height*9,math.abs(rand_z)*50))
    end
    self.logoSchedule = cc.Director:getInstance():getScheduler():scheduleScriptFunc(logoShake,0,false)

    --add pointlight
    self._pointLight = cc.PointLight:create(cc.vec3(0,0,50),cc.c3b(255,255,255),10000)
    self._pointLight:setCameraMask(1)
    self._pointLight:setEnabled(true)
    logo:addChild(self._pointLight)
    
    --add light sprite
    self._lightSprite = cc.Sprite:create("mainmenuscene/light.png")
    self._lightSprite:setPosition3D(cc.vec3(0,0,50))
    self._lightSprite:setColor(cc.c3b(200,0,0))
    logo:addChild(self._lightSprite)
    
    -- effectNormalMap
    local effectNormalMapped = cc.EffectNormalMapped:create("mainmenuscene/logo_normal.png");
    effectNormalMapped:setPointLight(self._pointLight)
    effectNormalMapped:setKBump(100)
    logo:setEffect(effectNormalMapped)
    
end

--add button to start game
function MainMenuScene:addButton(layer)
    local button_callback = function(sender,eventType)
        print(eventType)
        if eventType == ccui.TouchEventType.ended then
        	cc.Director:getInstance():replaceScene(require("ChooseRoleScene").create())
        end
    end

    local button = ccui.Button:create("mainmenuscene/button.png")
    button:setPressedActionEnabled(true)
    button:setPosition(self.size.width*0.87,self.size.height*0.28)
    button:addTouchEventListener(button_callback)
    button:setOpacity(0)
    button:runAction(cc.Sequence:create(cc.FadeIn:create(3)))
    layer:addChild(button,4)
end

-- cloud action
function MainMenuScene:addCloud(layer)
    --cloud
    local cloud0 = cc.Sprite:create("mainmenuscene/cloud1.png")
    local cloud1 = cc.Sprite:create("mainmenuscene/cloud1.png")
    local cloud2 = cc.Sprite:create("mainmenuscene/cloud3.png")
    local cloud3 = cc.Sprite:create("mainmenuscene/cloud2.png")
    local cloud4 = cc.Sprite:create("mainmenuscene/cloud3.png")
    
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

--bg
function MainMenuScene:addBg(layer)
    --background
    local bg_back = cc.Sprite:create("mainmenuscene/bg_back.png")
    local bg_front = cc.Sprite:create("mainmenuscene/bg_front.png")
    bg_back:setPosition(self.size.width/2,self.size.height/2)
    bg_front:setPosition(self.size.width/2,self.size.height/2)
    layer:addChild(bg_back,1)
    layer:addChild(bg_front,3)
end

return MainMenuScene