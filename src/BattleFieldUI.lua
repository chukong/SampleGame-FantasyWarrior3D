require "GlobalVariables"
require "Actor"

local BattlefieldUI = class("battlefieldUI",function() return cc.Layer:create() end)

function BattlefieldUI.create()
    local layer = BattlefieldUI.new()
	return layer
end

function BattlefieldUI:ctor()
    self:avatarInit()
    self:bloodbarInit()
    self:touchButtonInit()
    ccexp.AudioEngine:play2d("audios/The Last Encounter Short Loop.mp3", true,100)
end

function BattlefieldUI:avatarInit()
    self.WarriorPng = cc.Sprite:create("battlefieldUI/UI-1136-640_03.png")
    self.WarriorPng:setPosition(865/1136*G.winSize.width,50/640*G.winSize.height)
    self.WarriorPng:setScale(0.5)
    self:addChild(self.WarriorPng,2)
    
    self.WarriorPngFrame = cc.Sprite:create("battlefieldUI/UI-2.png")
    self.WarriorPngFrame:setScale(0.5)
    self.WarriorPngFrame:setPosition(self.WarriorPng:getPositionX(),self.WarriorPng:getPositionY()-3)
    self:addChild(self.WarriorPngFrame,1)
    
       
    self.ArcherPng = cc.Sprite:create("battlefieldUI/UI-1136-640_11.png")
    self.ArcherPng:setPosition(935/1136*G.winSize.width,50/640*G.winSize.height)
    self.ArcherPng:setScale(0.5)
    self:addChild(self.ArcherPng,2)
    self.ArcherPngFrame = cc.Sprite:create("battlefieldUI/UI-2.png")
    self.ArcherPngFrame:setScale(0.5)
    self.ArcherPngFrame:setPosition(self.ArcherPng:getPositionX(),self.ArcherPng:getPositionY()-3)
    self:addChild(self.ArcherPngFrame,1)
    
    self.MagePng = cc.Sprite:create("battlefieldUI/UI-1136-640_18.png")
    self.MagePng:setPosition(1005/1136*G.winSize.width,50/640*G.winSize.height)
    self.MagePng:setScale(0.5)    
    self:addChild(self.MagePng,2)
    self.MagePngFrame = cc.Sprite:create("battlefieldUI/UI-2.png")
    self.MagePngFrame:setScale(0.5)
    self.MagePngFrame:setPosition(self.MagePng:getPositionX(),self.MagePng:getPositionY()-3)
    self:addChild(self.MagePngFrame,1)
end

function BattlefieldUI:bloodbarInit()

    self.WarriorBlood = cc.ProgressTimer:create(cc.Sprite:create("battlefieldUI/UI-1136-640_36.png"))
    self.WarriorBlood:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    self.WarriorBlood:setBarChangeRate(cc.vertex2F(1,0))
    self.WarriorBlood:setMidpoint(cc.vertex2F(0,0))
    self.WarriorBlood:setPercentage(100)
    self.WarriorBlood:setPosition(self.WarriorPng:getPositionX(), self.WarriorPng:getPositionY()-32)
    self.WarriorBlood:setScale(0.5)
    self:addChild(self.WarriorBlood,4)
        
    self.WarriorBloodClone = cc.ProgressTimer:create(cc.Sprite:create("battlefieldUI/UI-1136-640_36_clone.png"))
    self.WarriorBloodClone:setColor(cc.c3b(255,83,23))
    self.WarriorBloodClone:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    self.WarriorBloodClone:setBarChangeRate(cc.vertex2F(1,0))
    self.WarriorBloodClone:setMidpoint(cc.vertex2F(0,0))
    self.WarriorBloodClone:setPercentage(100)
    self.WarriorBloodClone:setPosition(self.WarriorPng:getPositionX(), self.WarriorPng:getPositionY()-32)
    self.WarriorBloodClone:setScale(0.5)
    self:addChild(self.WarriorBloodClone,3)
        
    self.ArcherBlood = cc.ProgressTimer:create(cc.Sprite:create("battlefieldUI/UI-1136-640_36.png"))
    self.ArcherBlood:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    self.ArcherBlood:setMidpoint(cc.vertex2F(0,0))
    self.ArcherBlood:setBarChangeRate(cc.vertex2F(1,0))
    self.ArcherBlood:setPercentage(100)
    self.ArcherBlood:setPosition(self.ArcherPng:getPositionX(), self.ArcherPng:getPositionY()-32)
    self.ArcherBlood:setScale(0.5)
    self:addChild(self.ArcherBlood,4)

    self.ArcherBloodClone = cc.ProgressTimer:create(cc.Sprite:create("battlefieldUI/UI-1136-640_36_clone.png"))
    self.ArcherBloodClone:setColor(cc.c3b(255,83,23))
    self.ArcherBloodClone:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    self.ArcherBloodClone:setBarChangeRate(cc.vertex2F(1,0))
    self.ArcherBloodClone:setMidpoint(cc.vertex2F(0,0))
    self.ArcherBloodClone:setPercentage(100)
    self.ArcherBloodClone:setPosition(self.ArcherPng:getPositionX(), self.ArcherPng:getPositionY()-32)
    self.ArcherBloodClone:setScale(0.5)
    self:addChild(self.ArcherBloodClone,3)
 
    self.MageBlood = cc.ProgressTimer:create(cc.Sprite:create("battlefieldUI/UI-1136-640_36.png"))
    self.MageBlood:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    self.MageBlood:setMidpoint(cc.vertex2F(0,0))
    self.MageBlood:setBarChangeRate(cc.vertex2F(1,0))
    self.MageBlood:setPercentage(100)
    self.MageBlood:setPosition(self.MagePng:getPositionX(), self.MagePng:getPositionY()-32)
    self.MageBlood:setScale(0.5)
    self:addChild(self.MageBlood,4)
    
    self.MageBloodClone = cc.ProgressTimer:create(cc.Sprite:create("battlefieldUI/UI-1136-640_36_clone.png"))
    self.MageBloodClone:setColor(cc.c3b(255,83,23))
    self.MageBloodClone:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    self.MageBloodClone:setBarChangeRate(cc.vertex2F(1,0))
    self.MageBloodClone:setMidpoint(cc.vertex2F(0,0))
    self.MageBloodClone:setPercentage(100)
    self.MageBloodClone:setPosition(self.MagePng:getPositionX(), self.MagePng:getPositionY()-32)
    self.MageBloodClone:setScale(0.5)
    self:addChild(self.MageBloodClone,3)


end

function BattlefieldUI:touchButtonInit()
    self._defenceBtn = ccui.Button:create("battlefieldUI/UI-1136-640_26.png","battlefieldUI/UI-1136-640_24.png","battlefieldUI/UI-1136-640_22.png",0)
    self._defenceBtn:setPosition(1089/1136*G.winSize.width,49/640*G.winSize.height)
    self._defenceBtn:setScale(0.65)
    self:addChild(self._defenceBtn,3)

    self._setBtn = ccui.Button:create("battlefieldUI/UI-1136-640_06.png","battlefieldUI/UI-1136-640_06.png","battlefieldUI/UI-1136-640_06.png",0)
    self._setBtn:setPosition(1093/1136*G.winSize.width,601/640*G.winSize.height)
    self._setBtn:setScale(0.8)
    self:addChild(self._setBtn,3)
    
    self._chest = cc.Sprite:create("battlefieldUI/chest.png")
    self._chest:setPosition(861/1136*G.winSize.width,605/640*G.winSize.height)
    self._chest:setScale(0.7)
    self:addChild(self._chest,3)
    
    self._coin = cc.Sprite:create("battlefieldUI/coins.png")
    self._coin:setPosition(1028.49/1136*G.winSize.width,603/640*G.winSize.height)
    self._coin:setScaleX(0.7)
    self._coin:setScaleY(0.68)
    self:addChild(self._coin,3)
    
    self._chestAmount = cc.Sprite:create("battlefieldUI/UI-1.png")
    self._chestAmount:setPosition(790/1136*G.winSize.width,600/640*G.winSize.height)
    self._chestAmount:setScaleX(0.8)
    self._chestAmount:setScaleY(0.7)
    self:addChild(self._chestAmount,2)
    
    self._coinAmount = cc.Sprite:create("battlefieldUI/UI-1.png")
    self._coinAmount:setPosition(962/1136*G.winSize.width,600/640*G.winSize.height)
    self._coinAmount:setScaleX(0.8)
    self._coinAmount:setScaleY(0.7)
    self:addChild(self._coinAmount,2)
end

local scheduleID = nil

function BattlefieldUI:bloodDrop(dropValuePercent,hero)

    local progressTo = cc.ProgressTo:create(0.5,100-dropValuePercent)
    local progressToClone = cc.ProgressTo:create(1,100-dropValuePercent)

    if hero._racetype==EnumRaceType.WARRIOR then
        self.WarriorBlood:runAction(progressTo)
        self.WarriorBloodClone:runAction(progressToClone)
    end

    if hero._racetype==EnumRaceType.ARCHER then
        self.ArcherBlood:runAction(progressTo)
    end

    if hero._racetype==EnumRaceType.MAGE then
        self.MageBlood:runAction(progressTo)
    end
end

return BattlefieldUI