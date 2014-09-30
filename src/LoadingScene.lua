require "Cocos2d"
require "Cocos2dConstants"

local LoadingScene = class("loadingScene",
function ()
    return cc.Scene:create()
end
)

function LoadingScene:ctor()
    self.numOfTexture = 100
    self.size = cc.Director:getInstance():getWinSize()
end

function LoadingScene:create()
    local loadingScene = LoadingScene:new()
    local layer = loadingScene:init()
    loadingScene:addChild(layer)
    return loadingScene
end

function LoadingScene:init()
    local layer = cc.Layer:create()
    
    local this = self
    --loading texture
    for i = 1,100 do
        cc.TextureCache:getInstance():addImageAsync("background.jpg",function ()this:loadingImage_callback()end)
    end
    
    --label
    local val = 100
    local percent = cc.Label:createWithTTF("100%","fonts/Marker Felt.ttf",34)
    percent:setPosition(self.size.width/2,self.size.height/2)
    layer:addChild(percent)
    
    --update
    local update = function()
        val = val-1
        if(val == 0) then
            cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.scheduleID)
            if self.numOfTexture == 0 then
                local scene = require("ActivateGameScene")
                cc.Director:getInstance():replaceScene(scene:create())
            end
        end
        percent:setString(val .. "%")
        --load other resource
    end
    self.scheduleID = cc.Director:getInstance():getScheduler():scheduleScriptFunc(update,1/60,false)
    
    return layer
end

--load texture
function LoadingScene:loadingImage_callback()
    self.numOfTexture = self.numOfTexture-1
    if self.numOfTexture == 0 then
        print("end")
    end
    print(self.numOfTexture)
end

return LoadingScene