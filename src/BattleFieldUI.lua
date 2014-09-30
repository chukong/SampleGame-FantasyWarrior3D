local BattlefieldUI = class("BattleFieldUI",function() return cc.Layer:create() end)

function BattlefieldUI.create()
    local layer = BattlefieldUI.new()
	return layer
end

function BattlefieldUI:ctor()
    self:avatarInit()
    self:bloodbarInit()
    self:touchButtonInit()
end

function BattlefieldUI:avatarInit()
    self.WarriorPng = cc.Sprite:create("BattlefieldUI/UI-1136-640_03.png")
    self.WarriorPng:setPosition(90.5,566.72)
    self.WarriorPng:setScale(0.70)
    self.WarriorPng:setOpacity(255*0.7)
    self:addChild(self.WarriorPng,2)
       
    self.ArcherPng = cc.Sprite:create("BattlefieldUI/UI-1136-640_11.png")
    self.ArcherPng:setPosition(200.5,566.72)
    self.ArcherPng:setScale(0.70)
    self.ArcherPng:setOpacity(255*0.7)
    self:addChild(self.ArcherPng,2)
    
    self.MagePng = cc.Sprite:create("BattlefieldUI/UI-1136-640_18.png")
    self.MagePng:setPosition(310.5,566.72)
    self.MagePng:setScale(0.70)    
    self.MagePng:setOpacity(255*0.7)
    self:addChild(self.MagePng,2)
end

function BattlefieldUI:bloodbarInit()
    self.WarriorBlood = ccui.LoadingBar:create("BattlefieldUI/UI-1136-640_36.png",100)
    self.WarriorBlood:setPosition(self.WarriorPng:getPositionX(), (532/566.72)*self.WarriorPng:getPositionY())
    self.WarriorBlood:setScale(0.7)
    self.WarriorBlood:setOpacity(255*0.6)
    self:addChild(self.WarriorBlood,3)
    
    self.ArcherBlood = ccui.LoadingBar:create("BattlefieldUI/UI-1136-640_36.png",100)
    self.ArcherBlood:setPosition(self.ArcherPng:getPositionX(), (532/566.72)*self.ArcherPng:getPositionY())
    self.ArcherBlood:setScale(0.7)
    self.ArcherBlood:setOpacity(255*0.6)
    self:addChild(self.ArcherBlood,3)
    
    self.MageBlood = ccui.LoadingBar:create("BattlefieldUI/UI-1136-640_36.png",100)
    self.MageBlood:setPosition(self.MagePng:getPositionX(), (532/566.72)*self.MagePng:getPositionY())
    self.MageBlood:setScale(0.7)
    self.MageBlood:setOpacity(255*0.6)
    self:addChild(self.MageBlood,3)
end

function BattlefieldUI:touchButtonInit()
    self.DefenceBtn = ccui.Button:create("BattlefieldUI/UI-1136-640_26.png","BattlefieldUI/UI-1136-640_24.png","BattlefieldUI/UI-1136-640_22.png",0)
    self.DefenceBtn:setPosition(1019.50,109)
    self.DefenceBtn:setOpacity(255*0.9)
    self:addChild(self.DefenceBtn,3)

    self.SetBtn = ccui.Button:create("BattlefieldUI/UI-1136-640_06.png","BattlefieldUI/UI-1136-640_06.png","BattlefieldUI/UI-1136-640_06.png",0)
    self.SetBtn:setPosition(1019.50,570)
    self.SetBtn:setOpacity(255*0.9)
    self:addChild(self.SetBtn,3)
end

function BattlefieldUI:setDefenceBtnDisabled()
    self.DefenceBtn:setBright(false)
    self.DefenceBtn:setEnabled(false)
end

function BattlefieldUI:setWarriorBlood(parameters)
    self.WarriorBlood:setPercent(parameters)
end

function BattlefieldUI:setArcherBlood(parameters)
    self.ArcherBlood:setPercent(parameters)
end

function BattlefieldUI:setMageBlood(parameters)
    self.MageBlood:setPercent(parameters)
end

return BattlefieldUI