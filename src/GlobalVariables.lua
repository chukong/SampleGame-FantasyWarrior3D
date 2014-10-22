--[[
Monster Actors Values：
]]--

--G values
G =
{
    winSize = cc.Director:getInstance():getWinSize(),
    bloodPercentDropSpeed = 2,
    activearea = {left = -2800, right = 500, bottom = 100, top = 700}
}
cc.SpriteFrameCache:getInstance():addSpriteFrames("FX/FX.plist")
FXZorder = 1999


--Audios
BGM_RES = 
{
    MAINMENUBGM = "audios/Royal Flush Party.mp3",
    MAINMENUSTART= "audios/effects/magical_3.mp3",
    BATTLEFIELDBGM = "audios/The_Last_Encounter_Short_Loop.mp3"
}

--play2d id
AUDIO_ID = 
{
    MAINMENUBGM,
    BATTLEFIELDBGM,
    CHOOSEROLECHAPTERBGM,
    KNIGHTNORMALATTACK,
    KNIGHTSPECIALATTACK,
    ARCHERATTACK
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
        attack1 = "audios/effects/piglet/piglet1.mp3",
        attack2 = "audios/effects/piglet/piglet2.mp3",
        attack3 = "audios/effects/piglet/piglet3.mp3",
        dead = "audios/effects/piglet/dead.mp3",
        hurt = "audios/effects/piglet/hurt.mp3"    
}
    
--Warroir property
WarriorProperty =
{
    blood = 1000,
    attack = 100,
    defense = 100,
    speed = 50,
    special_attack_chance = 0.33,
    shout = "audios/effects/Knight1.mp3",
    normalAttack1 = "audios/effects/swish-1.mp3",
    normalAttack2 = "audios/effects/swish-2.mp3",
    specialAttack1 = "audios/effects/swish-3.mp3",
    specialAttack2 = "audios/effects/swish-4.mp3",
    hurt = "audios/effects/gruntsound.mp3"
}

--Archer property
Archerproperty =
{
    attack1 = "audios/effects/archer/swish-3.mp3",
    attack2 = "audios/effects/archer/swish-4.mp3"
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