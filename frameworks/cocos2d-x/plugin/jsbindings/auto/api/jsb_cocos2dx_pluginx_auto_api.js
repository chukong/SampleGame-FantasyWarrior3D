/**
 * @module pluginx_protocols
 */
var plugin = plugin || {};

/**
 * @class PluginProtocol
 */
plugin.PluginProtocol = {

/**
 * @method getPluginName
 * @return {char}
 */
getPluginName : function (
)
{
    return 0;
},

/**
 * @method getPluginVersion
 * @return {String}
 */
getPluginVersion : function (
)
{
    return ;
},

/**
 * @method getSDKVersion
 * @return {String}
 */
getSDKVersion : function (
)
{
    return ;
},

/**
 * @method setDebugMode
 * @param {bool} arg0
 */
setDebugMode : function (
bool 
)
{
},

};

/**
 * @class PluginManager
 */
plugin.PluginManager = {

/**
 * @method unloadPlugin
 * @param {char} arg0
 */
unloadPlugin : function (
char 
)
{
},

/**
 * @method loadPlugin
 * @param {char} arg0
 * @return {cc.plugin::PluginProtocol}
 */
loadPlugin : function (
char 
)
{
    return cc.plugin::PluginProtocol;
},

/**
 * @method end
 */
end : function (
)
{
},

/**
 * @method getInstance
 * @return {cc.plugin::PluginManager}
 */
getInstance : function (
)
{
    return cc.plugin::PluginManager;
},

};

/**
 * @class ProtocolAnalytics
 */
plugin.ProtocolAnalytics = {

/**
 * @method logTimedEventBegin
 * @param {char} arg0
 */
logTimedEventBegin : function (
char 
)
{
},

/**
 * @method logError
 * @param {char} arg0
 * @param {char} arg1
 */
logError : function (
char, 
char 
)
{
},

/**
 * @method setCaptureUncaughtException
 * @param {bool} arg0
 */
setCaptureUncaughtException : function (
bool 
)
{
},

/**
 * @method setSessionContinueMillis
 * @param {long} arg0
 */
setSessionContinueMillis : function (
long 
)
{
},

/**
 * @method logEvent
 * @param {char} arg0
 * @param {map_object} arg1
 */
logEvent : function (
char, 
map 
)
{
},

/**
 * @method startSession
 * @param {char} arg0
 */
startSession : function (
char 
)
{
},

/**
 * @method stopSession
 */
stopSession : function (
)
{
},

/**
 * @method logTimedEventEnd
 * @param {char} arg0
 */
logTimedEventEnd : function (
char 
)
{
},

};

/**
 * @class ProtocolIAP
 */
plugin.ProtocolIAP = {

/**
 * @method payForProduct
 * @param {map_object} arg0
 */
payForProduct : function (
map 
)
{
},

/**
 * @method onPayResult
 * @param {cc.plugin::PayResultCode} arg0
 * @param {char} arg1
 */
onPayResult : function (
payresultcode, 
char 
)
{
},

/**
 * @method configDeveloperInfo
 * @param {map_object} arg0
 */
configDeveloperInfo : function (
map 
)
{
},

};

/**
 * @class ProtocolAds
 */
plugin.ProtocolAds = {

/**
 * @method showAds
 * @param {map_object} arg0
 * @param {cc.plugin::ProtocolAds::AdsPos} arg1
 */
showAds : function (
map, 
adspos 
)
{
},

/**
 * @method hideAds
 * @param {map_object} arg0
 */
hideAds : function (
map 
)
{
},

/**
 * @method queryPoints
 */
queryPoints : function (
)
{
},

/**
 * @method spendPoints
 * @param {int} arg0
 */
spendPoints : function (
int 
)
{
},

/**
 * @method configDeveloperInfo
 * @param {map_object} arg0
 */
configDeveloperInfo : function (
map 
)
{
},

};

/**
 * @class ProtocolShare
 */
plugin.ProtocolShare = {

/**
 * @method share
 * @param {map_object} arg0
 */
share : function (
map 
)
{
},

/**
 * @method onShareResult
 * @param {cc.plugin::ShareResultCode} arg0
 * @param {char} arg1
 */
onShareResult : function (
shareresultcode, 
char 
)
{
},

/**
 * @method configDeveloperInfo
 * @param {map_object} arg0
 */
configDeveloperInfo : function (
map 
)
{
},

};

/**
 * @class ProtocolSocial
 */
plugin.ProtocolSocial = {

/**
 * @method showLeaderboard
 * @param {char} arg0
 */
showLeaderboard : function (
char 
)
{
},

/**
 * @method showAchievements
 */
showAchievements : function (
)
{
},

/**
 * @method submitScore
 * @param {char} arg0
 * @param {long} arg1
 */
submitScore : function (
char, 
long 
)
{
},

/**
 * @method configDeveloperInfo
 * @param {map_object} arg0
 */
configDeveloperInfo : function (
map 
)
{
},

/**
 * @method unlockAchievement
 * @param {map_object} arg0
 */
unlockAchievement : function (
map 
)
{
},

};

/**
 * @class ProtocolUser
 */
plugin.ProtocolUser = {

/**
 * @method isLogined
 * @return {bool}
 */
isLogined : function (
)
{
    return false;
},

/**
 * @method logout
 */
logout : function (
)
{
},

/**
 * @method configDeveloperInfo
 * @param {map_object} arg0
 */
configDeveloperInfo : function (
map 
)
{
},

/**
 * @method login
 */
login : function (
)
{
},

/**
 * @method getSessionID
 * @return {String}
 */
getSessionID : function (
)
{
    return ;
},

};

/**
 * @class AgentManager
 */
plugin.AgentManager = {

/**
 * @method showAds
 * @param {map_object} arg0
 */
showAds : function (
map 
)
{
},

/**
 * @method getSocialPlugin
 * @return {cc.plugin::ProtocolSocial}
 */
getSocialPlugin : function (
)
{
    return cc.plugin::ProtocolSocial;
},

/**
 * @method setSessionContinueMillis
 * @param {long} arg0
 */
setSessionContinueMillis : function (
long 
)
{
},

/**
 * @method getAnalyticsPlugin
 * @return {cc.plugin::ProtocolAnalytics}
 */
getAnalyticsPlugin : function (
)
{
    return cc.plugin::ProtocolAnalytics;
},

/**
 * @method startSession
 * @param {char} arg0
 */
startSession : function (
char 
)
{
},

/**
 * @method stopSession
 */
stopSession : function (
)
{
},

/**
 * @method getSharePlugin
 * @return {cc.plugin::ProtocolShare}
 */
getSharePlugin : function (
)
{
    return cc.plugin::ProtocolShare;
},

/**
 * @method getSessionID
 * @return {String}
 */
getSessionID : function (
)
{
    return ;
},

/**
 * @method logTimedEventBegin
 * @param {char} arg0
 */
logTimedEventBegin : function (
char 
)
{
},

/**
 * @method logError
 * @param {char} arg0
 * @param {char} arg1
 */
logError : function (
char, 
char 
)
{
},

/**
 * @method showLeaderboard
 * @param {String} arg0
 */
showLeaderboard : function (
str 
)
{
},

/**
 * @method getIAPPlugin
 * @return {cc.plugin::ProtocolIAP}
 */
getIAPPlugin : function (
)
{
    return cc.plugin::ProtocolIAP;
},

/**
 * @method init
 * @return {bool}
 */
init : function (
)
{
    return false;
},

/**
 * @method unlockAchievement
 * @param {map_object} arg0
 */
unlockAchievement : function (
map 
)
{
},

/**
 * @method queryPoints
 */
queryPoints : function (
)
{
},

/**
 * @method setCaptureUncaughtException
 * @param {bool} arg0
 */
setCaptureUncaughtException : function (
bool 
)
{
},

/**
 * @method payForProduct
 * @param {map_object} arg0
 */
payForProduct : function (
map 
)
{
},

/**
 * @method showAchievements
 */
showAchievements : function (
)
{
},

/**
 * @method logEvent
 * @param {char} arg0
 */
logEvent : function (
char 
)
{
},

/**
 * @method logout
 */
logout : function (
)
{
},

/**
 * @method submitScore
 * @param {String} arg0
 * @param {long} arg1
 */
submitScore : function (
str, 
long 
)
{
},

/**
 * @method spendPoints
 * @param {int} arg0
 */
spendPoints : function (
int 
)
{
},

/**
 * @method hideAds
 * @param {map_object} arg0
 */
hideAds : function (
map 
)
{
},

/**
 * @method logTimedEventEnd
 * @param {char} arg0
 */
logTimedEventEnd : function (
char 
)
{
},

/**
 * @method isLogined
 * @return {bool}
 */
isLogined : function (
)
{
    return false;
},

/**
 * @method getAdsPlugin
 * @return {cc.plugin::ProtocolAds}
 */
getAdsPlugin : function (
)
{
    return cc.plugin::ProtocolAds;
},

/**
 * @method purge
 */
purge : function (
)
{
},

/**
 * @method getUserPlugin
 * @return {cc.plugin::ProtocolUser}
 */
getUserPlugin : function (
)
{
    return cc.plugin::ProtocolUser;
},

/**
 * @method getInstance
 * @return {cc.plugin::AgentManager}
 */
getInstance : function (
)
{
    return cc.plugin::AgentManager;
},

};
