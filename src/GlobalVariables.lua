--[[
Monster Actors Values：
]]--

--G values
G =
{
    winSize = cc.Director:getInstance():getWinSize(),
    bloodPercentDropSpeed = 2,
    battleScene = nil
}
cc.SpriteFrameCache:getInstance():addSpriteFrames("FX/FX.plist")

--Audios
BGM_RES = 
{
    MAINMENUBGM = "audios/Royal Flush Party.mp3",
    BATTLEFIELDBGM = "audios/The_Last_Encounter_Short_Loop.mp3"
}

--play2d id
AUDIO_ID = 
{
    MAINMENUBGM,
    BATTLEFIELDBGM,
    CHOOSEROLECHAPTERBGM,
}

--Monster Slime
MonsterSlimeValues =
{
    fileNameNormal = "model/slime/slimeAnger.c3b",
    fileNameAnger = "model/slime/slimeAnger.c3b"
}

--Monster Dragon
MonsterDragonValues = 
{
    fileName = "model/dragon/dragon.c3b"
}

--Monster Rat
MonsterRatValues = 
    {
        fileName = "model/rat/rat.c3b"
    }

--Monster Piglet
MonsterPigletValues = 
    {
        fileName = "model/piglet/piglet.c3b",
        attack1 = "audios/effects/piglet1.mp3",
        attack2 = "audios/effects/piglet2.mp3",
        attack3 = "audios/effects/piglet3.mp3",
        dead = "audios/effects/pigletDead.mp3"
    }
    
--Warroir property
WarriorProperty =
{
    blood = 1000,
    attack = 100,
    defense = 100,
    speed = 50,
    special_attack_chance = 0.33,
    normalAttack1 = "audios/effects/swish-1.mp3",
    normalAttack2 = "audios/effects/swish-2.mp3",
    normalAttack3 = "audios/effects/swish-3.mp3",
    normalAttack4 = "audios/effects/swish-4.mp3",
}

--Mage property
MageProperty =
{
    blood = 1000,
    attack = 100,
    defense = 100,
    speed = 50,
    special_attack_chance = 0.33,
}