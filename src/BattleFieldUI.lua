require "GlobalVariables"
require "Actor"

local BattlefieldUI = class("battlefieldUI",function() return cc.Layer:create() end)

local function shakeWhenHurt()
    
    local shaky1 = cc.RotateBy:create(0.05,3,3)
    local shaky2 = cc.RotateBy:create(0.1,-6,-6)
    local shaky3 = cc.RotateBy:create(0.05,3,0)
    local shaky = cc.RepeatForever:create(cc.Sequence:create(shaky1,shaky2,shaky3))
    
    return shaky
end

function BattlefieldUI.create()
    local layer = BattlefieldUI.new()
	return layer
end

function BattlefieldUI:ctor()
    self:avatarInit()
    self:bloodbarInit()
    self:touchButtonInit()
    
    ccexp.AudioEngine:stopAll()
    AUDIO_ID.BATTLEFIELDBGM = ccexp.AudioEngine:play2d(BGM_RES.BATTLEFIELDBGM, true,0.6)
end

function BattlefieldUI:avatarInit()

    self.WarriorPng = cc.Sprite:createWithSpriteFrameName("UI-1136-640_03.png")
    self.WarriorPng:setPosition3D(cc.V3(860/1136*G.winSize.width,50/640*G.winSize.height,2))
    self.WarriorPng:setScale(0.5)
    self:addChild(self.WarriorPng,2)           
    self.WarriorPngFrame = cc.Sprite:createWithSpriteFrameName("UI-2.png")
    self.WarriorPngFrame:setScale(0.5)
    self.WarriorPngFrame:setPosition3D(cc.V3(self.WarriorPng:getPositionX()+1,self.WarriorPng:getPositionY()-4,1))
    self:addChild(self.WarriorPngFrame,1)
       
    self.ArcherPng = cc.Sprite:createWithSpriteFrameName("UI-1136-640_11.png")
    self.ArcherPng:setPosition3D(cc.V3(930/1136*G.winSize.width,50/640*G.winSize.height,2))
    self.ArcherPng:setScale(0.5)
    self:addChild(self.ArcherPng,2)
    self.ArcherPngFrame = cc.Sprite:createWithSpriteFrameName("UI-2.png")
    self.ArcherPngFrame:setScale(0.5)
    self.ArcherPngFrame:setPosition3D(cc.V3(self.ArcherPng:getPositionX()+1,self.ArcherPng:getPositionY()-4,1))
    self:addChild(self.ArcherPngFrame,1)
    
    self.MagePng = cc.Sprite:createWithSpriteFrameName("UI-1136-640_18.png")
    self.MagePng:setPosition3D(cc.V3(1000/1136*G.winSize.width,50/640*G.winSize.height,2))
    self.MagePng:setScale(0.5)    
    self:addChild(self.MagePng,2)
    self.MagePngFrame = cc.Sprite:createWithSpriteFrameName("UI-2.png")
    self.MagePngFrame:setScale(0.5)
    self.MagePngFrame:setPosition3D(cc.V3(self.MagePng:getPositionX()+1,self.MagePng:getPositionY()-4,1))
    self:addChild(self.MagePngFrame,1)
end

function BattlefieldUI:bloodbarInit()

    self.WarriorBlood = cc.ProgressTimer:create(cc.Sprite:createWithSpriteFrameName("UI-1136-640_36_clone.png"))
    self.WarriorBlood:setColor(cc.c3b(149,254,26))
    self.WarriorBlood:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    self.WarriorBlood:setBarChangeRate(cc.vertex2F(1,0))
    self.WarriorBlood:setMidpoint(cc.vertex2F(0,0))
    self.WarriorBlood:setPercentage(100)
    self.WarriorBlood:setPosition3D(cc.V3(self.WarriorPng:getPositionX()-1, self.WarriorPng:getPositionY()-32,4))
    self.WarriorBlood:setScale(0.5)
    self:addChild(self.WarriorBlood,4)
        
    self.WarriorBloodClone = cc.ProgressTimer:create(cc.Sprite:createWithSpriteFrameName("UI-1136-640_36_clone.png"))
    self.WarriorBloodClone:setColor(cc.c3b(255,83,23))
    self.WarriorBloodClone:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    self.WarriorBloodClone:setBarChangeRate(cc.vertex2F(1,0))
    self.WarriorBloodClone:setMidpoint(cc.vertex2F(0,0))
    self.WarriorBloodClone:setPercentage(100)
    self.WarriorBloodClone:setPosition3D(cc.V3(self.WarriorPng:getPositionX()-1, self.WarriorPng:getPositionY()-32,3))
    self.WarriorBloodClone:setScale(0.5)
    self:addChild(self.WarriorBloodClone,3)
        
    self.ArcherBlood = cc.ProgressTimer:create(cc.Sprite:createWithSpriteFrameName("UI-1136-640_36_clone.png"))
    self.ArcherBlood:setColor(cc.c3b(149,254,26))
    self.ArcherBlood:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    self.ArcherBlood:setMidpoint(cc.vertex2F(0,0))
    self.ArcherBlood:setBarChangeRate(cc.vertex2F(1,0))
    self.ArcherBlood:setPercentage(100)
    self.ArcherBlood:setPosition3D(cc.V3(self.ArcherPng:getPositionX()-1, self.ArcherPng:getPositionY()-32,4))
    self.ArcherBlood:setScale(0.5)
    self:addChild(self.ArcherBlood,4)

    self.ArcherBloodClone = cc.ProgressTimer:create(cc.Sprite:createWithSpriteFrameName("UI-1136-640_36_clone.png"))
    self.ArcherBloodClone:setColor(cc.c3b(255,83,23))
    self.ArcherBloodClone:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    self.ArcherBloodClone:setBarChangeRate(cc.vertex2F(1,0))
    self.ArcherBloodClone:setMidpoint(cc.vertex2F(0,0))
    self.ArcherBloodClone:setPercentage(100)
    self.ArcherBloodClone:setPosition3D(cc.V3(self.ArcherPng:getPositionX()-1, self.ArcherPng:getPositionY()-32,3))
    self.ArcherBloodClone:setScale(0.5)
    self:addChild(self.ArcherBloodClone,3)
 
    self.MageBlood = cc.ProgressTimer:create(cc.Sprite:createWithSpriteFrameName("UI-1136-640_36_clone.png"))
    self.MageBlood:setColor(cc.c3b(149,254,26))
    self.MageBlood:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    self.MageBlood:setMidpoint(cc.vertex2F(0,0))
    self.MageBlood:setBarChangeRate(cc.vertex2F(1,0))
    self.MageBlood:setPercentage(100)
    self.MageBlood:setPosition3D(cc.V3(self.MagePng:getPositionX()-1, self.MagePng:getPositionY()-32,4))
    self.MageBlood:setScale(0.5)
    self:addChild(self.MageBlood,4)
    
    self.MageBloodClone = cc.ProgressTimer:create(cc.Sprite:createWithSpriteFrameName("UI-1136-640_36_clone.png"))
    self.MageBloodClone:setColor(cc.c3b(255,83,23))
    self.MageBloodClone:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    self.MageBloodClone:setBarChangeRate(cc.vertex2F(1,0))
    self.MageBloodClone:setMidpoint(cc.vertex2F(0,0))
    self.MageBloodClone:setPercentage(100)
    self.MageBloodClone:setPosition3D(cc.V3(self.MagePng:getPositionX()-1, self.MagePng:getPositionY()-32,3))
    self.MageBloodClone:setScale(0.5)
    self:addChild(self.MageBloodClone,3)
end

function BattlefieldUI:touchButtonInit()
    self._defenceBtn = cc.Sprite:createWithSpriteFrameName("UI-1136-640_26.png")
    self._defenceBtn:setPosition3D(cc.V3(1089/1136*G.winSize.width,49/640*G.winSize.height,3))
    self._defenceBtn:setScale(0.65)
    self:addChild(self._defenceBtn,3)

    self._setBtn =cc.Sprite:createWithSpriteFrameName("UI-1136-640_06.png")
    self._setBtn:setPosition3D(cc.V3(1093/1136*G.winSize.width,601/640*G.winSize.height,3))
    self._setBtn:setScale(0.8)
    self:addChild(self._setBtn,3)
    
    self._chest = cc.Sprite:createWithSpriteFrameName("chest.png")
    self._chest:setPosition3D(cc.V3(861/1136*G.winSize.width,605/640*G.winSize.height,3))
    self._chest:setScale(0.7)
    self:addChild(self._chest,3)
    
    self._coin = cc.Sprite:createWithSpriteFrameName("coins.png")
    self._coin:setPosition3D(cc.V3(1028.49/1136*G.winSize.width,603/640*G.winSize.height,3))
    self._coin:setScaleX(0.7)
    self._coin:setScaleY(0.68)
    self:addChild(self._coin,3)
    
    self._chestAmount = cc.Sprite:createWithSpriteFrameName("UI-1.png")
    self._chestAmount:setPosition3D(cc.V3(790/1136*G.winSize.width,600/640*G.winSize.height,2))
    self._chestAmount:setScaleX(0.8)
    self._chestAmount:setScaleY(0.7)
    self:addChild(self._chestAmount,2)
    
    self._coinAmount = cc.Sprite:createWithSpriteFrameName("UI-1.png")
    self._coinAmount:setPosition3D(cc.V3(962/1136*G.winSize.width,600/640*G.winSize.height,2))
    self._coinAmount:setScaleX(0.8)
    self._coinAmount:setScaleY(0.7)
    self:addChild(self._coinAmount,2)
end

local scheduleID = nil

function BattlefieldUI:shakeAvatar()
    return cc.Repeat:create(cc.Spawn:create(cc.Sequence:create(cc.ScaleTo:create(0.075,0.55), cc.ScaleTo:create(0.075,0.5)), cc.Sequence:create(cc.MoveBy:create(0.05,{x=6.5,y=0}),cc.MoveBy:create(0.05,{x=-13,y=0}),cc.MoveBy:create(0.05,{x=6.5,y=0}))),2)
end

function BattlefieldUI:bloodDrop(heroActor)
    local progressTo
    local progressToClone
    local tintTo
    local percent = heroActor._hp/heroActor._maxhp*100
    heroActor._bloodBar:stopAllActions()
    heroActor._bloodBarClone:stopAllActions()
    heroActor._avatar:runAction(BattlefieldUI:shakeAvatar())
    
    if heroActor._hp > 0 and percent>50 then

        progressTo = cc.ProgressTo:create(0.3,percent)
        progressToClone = cc.ProgressTo:create(1,percent+2)
        heroActor._bloodBar:runAction(progressTo)
        heroActor._bloodBarClone:runAction(progressToClone)
        
    elseif heroActor._hp>0 and percent <=50 then
        
        progressTo = cc.ProgressTo:create(0.3,percent)
        progressToClone = cc.ProgressTo:create(1,percent+2) 
        tintTo = cc.TintTo:create(0.5,254,225,26)   
        
        heroActor._bloodBar:runAction(cc.Spawn:create(progressTo,tintTo))
        heroActor._bloodBarClone:runAction(progressToClone)
    elseif heroActor._hp>0 and percent <=30 then

        progressTo = cc.ProgressTo:create(0.3,percent)
        progressToClone = cc.ProgressTo:create(1,percent+2) 
        
        tintTo = cc.TintTo:create(0.5,254,26,69)   
        heroActor._bloodBar:runAction(cc.Spawn:create(progressTo,tintTo))
        heroActor._bloodBarClone:runAction(progressToClone)
    elseif heroActor._hp  <=0 then
        progressTo = cc.ProgressTo:create(0.3,0)
        progressToClone = cc.ProgressTo:create(1,2)
        
        heroActor._bloodBar:runAction(progressTo)
        heroActor._bloodBarClone:runAction(progressToClone)
    end
end

function BattlefieldUI:heroDead(hero)

    if hero._name =="Knight" then
        cc.GreyShader:setGreyShader(self.WarriorPng)
        cc.GreyShader:setGreyShader(self.WarriorPngFrame)       
    elseif hero._name =="Mage" then
        cc.GreyShader:setGreyShader(self.MagePng)
        cc.GreyShader:setGreyShader(self.MagePngFrame)
    elseif hero._name=="Archer" then
        cc.GreyShader:setGreyShader(self.ArcherPng)
        cc.GreyShader:setGreyShader(self.ArcherPngFrame)
    end
end

return BattlefieldUI