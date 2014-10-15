#include "lua_cocos2dx_3d_auto.hpp"
#include "cocos2d.h"
#include "tolua_fix.h"
#include "LuaBasicConversions.h"



int lua_cocos2dx_3d_Waves3D_getAmplitudeRate(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Waves3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Waves3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Waves3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Waves3D_getAmplitudeRate'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        double ret = cobj->getAmplitudeRate();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Waves3D:getAmplitudeRate",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Waves3D_getAmplitudeRate'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Waves3D_setAmplitude(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Waves3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Waves3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Waves3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Waves3D_setAmplitude'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        double arg0;

        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.Waves3D:setAmplitude");
        if(!ok)
            return 0;
        cobj->setAmplitude(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Waves3D:setAmplitude",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Waves3D_setAmplitude'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Waves3D_setAmplitudeRate(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Waves3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Waves3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Waves3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Waves3D_setAmplitudeRate'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        double arg0;

        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.Waves3D:setAmplitudeRate");
        if(!ok)
            return 0;
        cobj->setAmplitudeRate(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Waves3D:setAmplitudeRate",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Waves3D_setAmplitudeRate'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Waves3D_getAmplitude(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Waves3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Waves3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Waves3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Waves3D_getAmplitude'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        double ret = cobj->getAmplitude();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Waves3D:getAmplitude",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Waves3D_getAmplitude'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Waves3D_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.Waves3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 4)
    {
        double arg0;
        cocos2d::Size arg1;
        unsigned int arg2;
        double arg3;
        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.Waves3D:create");
        ok &= luaval_to_size(tolua_S, 3, &arg1, "cc.Waves3D:create");
        ok &= luaval_to_uint32(tolua_S, 4,&arg2, "cc.Waves3D:create");
        ok &= luaval_to_number(tolua_S, 5,&arg3, "cc.Waves3D:create");
        if(!ok)
            return 0;
        cocos2d::Waves3D* ret = cocos2d::Waves3D::create(arg0, arg1, arg2, arg3);
        object_to_luaval<cocos2d::Waves3D>(tolua_S, "cc.Waves3D",(cocos2d::Waves3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "cc.Waves3D:create",argc, 4);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Waves3D_create'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_3d_Waves3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (Waves3D)");
    return 0;
}

int lua_register_cocos2dx_3d_Waves3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.Waves3D");
    tolua_cclass(tolua_S,"Waves3D","cc.Waves3D","cc.Grid3DAction",nullptr);

    tolua_beginmodule(tolua_S,"Waves3D");
        tolua_function(tolua_S,"getAmplitudeRate",lua_cocos2dx_3d_Waves3D_getAmplitudeRate);
        tolua_function(tolua_S,"setAmplitude",lua_cocos2dx_3d_Waves3D_setAmplitude);
        tolua_function(tolua_S,"setAmplitudeRate",lua_cocos2dx_3d_Waves3D_setAmplitudeRate);
        tolua_function(tolua_S,"getAmplitude",lua_cocos2dx_3d_Waves3D_getAmplitude);
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_Waves3D_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::Waves3D).name();
    g_luaType[typeName] = "cc.Waves3D";
    g_typeCast["Waves3D"] = "cc.Waves3D";
    return 1;
}

int lua_cocos2dx_3d_FlipX3D_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.FlipX3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 1)
    {
        double arg0;
        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.FlipX3D:create");
        if(!ok)
            return 0;
        cocos2d::FlipX3D* ret = cocos2d::FlipX3D::create(arg0);
        object_to_luaval<cocos2d::FlipX3D>(tolua_S, "cc.FlipX3D",(cocos2d::FlipX3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "cc.FlipX3D:create",argc, 1);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_FlipX3D_create'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_3d_FlipX3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (FlipX3D)");
    return 0;
}

int lua_register_cocos2dx_3d_FlipX3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.FlipX3D");
    tolua_cclass(tolua_S,"FlipX3D","cc.FlipX3D","cc.Grid3DAction",nullptr);

    tolua_beginmodule(tolua_S,"FlipX3D");
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_FlipX3D_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::FlipX3D).name();
    g_luaType[typeName] = "cc.FlipX3D";
    g_typeCast["FlipX3D"] = "cc.FlipX3D";
    return 1;
}

int lua_cocos2dx_3d_FlipY3D_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.FlipY3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 1)
    {
        double arg0;
        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.FlipY3D:create");
        if(!ok)
            return 0;
        cocos2d::FlipY3D* ret = cocos2d::FlipY3D::create(arg0);
        object_to_luaval<cocos2d::FlipY3D>(tolua_S, "cc.FlipY3D",(cocos2d::FlipY3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "cc.FlipY3D:create",argc, 1);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_FlipY3D_create'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_3d_FlipY3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (FlipY3D)");
    return 0;
}

int lua_register_cocos2dx_3d_FlipY3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.FlipY3D");
    tolua_cclass(tolua_S,"FlipY3D","cc.FlipY3D","cc.FlipX3D",nullptr);

    tolua_beginmodule(tolua_S,"FlipY3D");
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_FlipY3D_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::FlipY3D).name();
    g_luaType[typeName] = "cc.FlipY3D";
    g_typeCast["FlipY3D"] = "cc.FlipY3D";
    return 1;
}

int lua_cocos2dx_3d_Lens3D_setPosition(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Lens3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Lens3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Lens3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Lens3D_setPosition'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        cocos2d::Vec2 arg0;

        ok &= luaval_to_vec2(tolua_S, 2, &arg0, "cc.Lens3D:setPosition");
        if(!ok)
            return 0;
        cobj->setPosition(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Lens3D:setPosition",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Lens3D_setPosition'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Lens3D_setConcave(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Lens3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Lens3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Lens3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Lens3D_setConcave'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        bool arg0;

        ok &= luaval_to_boolean(tolua_S, 2,&arg0, "cc.Lens3D:setConcave");
        if(!ok)
            return 0;
        cobj->setConcave(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Lens3D:setConcave",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Lens3D_setConcave'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Lens3D_setLensEffect(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Lens3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Lens3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Lens3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Lens3D_setLensEffect'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        double arg0;

        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.Lens3D:setLensEffect");
        if(!ok)
            return 0;
        cobj->setLensEffect(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Lens3D:setLensEffect",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Lens3D_setLensEffect'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Lens3D_getPosition(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Lens3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Lens3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Lens3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Lens3D_getPosition'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        const cocos2d::Vec2& ret = cobj->getPosition();
        vec2_to_luaval(tolua_S, ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Lens3D:getPosition",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Lens3D_getPosition'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Lens3D_getLensEffect(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Lens3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Lens3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Lens3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Lens3D_getLensEffect'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        double ret = cobj->getLensEffect();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Lens3D:getLensEffect",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Lens3D_getLensEffect'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Lens3D_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.Lens3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 4)
    {
        double arg0;
        cocos2d::Size arg1;
        cocos2d::Vec2 arg2;
        double arg3;
        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.Lens3D:create");
        ok &= luaval_to_size(tolua_S, 3, &arg1, "cc.Lens3D:create");
        ok &= luaval_to_vec2(tolua_S, 4, &arg2, "cc.Lens3D:create");
        ok &= luaval_to_number(tolua_S, 5,&arg3, "cc.Lens3D:create");
        if(!ok)
            return 0;
        cocos2d::Lens3D* ret = cocos2d::Lens3D::create(arg0, arg1, arg2, arg3);
        object_to_luaval<cocos2d::Lens3D>(tolua_S, "cc.Lens3D",(cocos2d::Lens3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "cc.Lens3D:create",argc, 4);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Lens3D_create'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_3d_Lens3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (Lens3D)");
    return 0;
}

int lua_register_cocos2dx_3d_Lens3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.Lens3D");
    tolua_cclass(tolua_S,"Lens3D","cc.Lens3D","cc.Grid3DAction",nullptr);

    tolua_beginmodule(tolua_S,"Lens3D");
        tolua_function(tolua_S,"setPosition",lua_cocos2dx_3d_Lens3D_setPosition);
        tolua_function(tolua_S,"setConcave",lua_cocos2dx_3d_Lens3D_setConcave);
        tolua_function(tolua_S,"setLensEffect",lua_cocos2dx_3d_Lens3D_setLensEffect);
        tolua_function(tolua_S,"getPosition",lua_cocos2dx_3d_Lens3D_getPosition);
        tolua_function(tolua_S,"getLensEffect",lua_cocos2dx_3d_Lens3D_getLensEffect);
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_Lens3D_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::Lens3D).name();
    g_luaType[typeName] = "cc.Lens3D";
    g_typeCast["Lens3D"] = "cc.Lens3D";
    return 1;
}

int lua_cocos2dx_3d_Ripple3D_setAmplitudeRate(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Ripple3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Ripple3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Ripple3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Ripple3D_setAmplitudeRate'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        double arg0;

        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.Ripple3D:setAmplitudeRate");
        if(!ok)
            return 0;
        cobj->setAmplitudeRate(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Ripple3D:setAmplitudeRate",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Ripple3D_setAmplitudeRate'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Ripple3D_getAmplitudeRate(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Ripple3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Ripple3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Ripple3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Ripple3D_getAmplitudeRate'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        double ret = cobj->getAmplitudeRate();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Ripple3D:getAmplitudeRate",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Ripple3D_getAmplitudeRate'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Ripple3D_setAmplitude(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Ripple3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Ripple3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Ripple3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Ripple3D_setAmplitude'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        double arg0;

        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.Ripple3D:setAmplitude");
        if(!ok)
            return 0;
        cobj->setAmplitude(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Ripple3D:setAmplitude",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Ripple3D_setAmplitude'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Ripple3D_getAmplitude(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Ripple3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Ripple3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Ripple3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Ripple3D_getAmplitude'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        double ret = cobj->getAmplitude();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Ripple3D:getAmplitude",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Ripple3D_getAmplitude'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Ripple3D_setPosition(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Ripple3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Ripple3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Ripple3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Ripple3D_setPosition'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        cocos2d::Vec2 arg0;

        ok &= luaval_to_vec2(tolua_S, 2, &arg0, "cc.Ripple3D:setPosition");
        if(!ok)
            return 0;
        cobj->setPosition(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Ripple3D:setPosition",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Ripple3D_setPosition'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Ripple3D_getPosition(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Ripple3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Ripple3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Ripple3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Ripple3D_getPosition'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        const cocos2d::Vec2& ret = cobj->getPosition();
        vec2_to_luaval(tolua_S, ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Ripple3D:getPosition",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Ripple3D_getPosition'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Ripple3D_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.Ripple3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 6)
    {
        double arg0;
        cocos2d::Size arg1;
        cocos2d::Vec2 arg2;
        double arg3;
        unsigned int arg4;
        double arg5;
        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.Ripple3D:create");
        ok &= luaval_to_size(tolua_S, 3, &arg1, "cc.Ripple3D:create");
        ok &= luaval_to_vec2(tolua_S, 4, &arg2, "cc.Ripple3D:create");
        ok &= luaval_to_number(tolua_S, 5,&arg3, "cc.Ripple3D:create");
        ok &= luaval_to_uint32(tolua_S, 6,&arg4, "cc.Ripple3D:create");
        ok &= luaval_to_number(tolua_S, 7,&arg5, "cc.Ripple3D:create");
        if(!ok)
            return 0;
        cocos2d::Ripple3D* ret = cocos2d::Ripple3D::create(arg0, arg1, arg2, arg3, arg4, arg5);
        object_to_luaval<cocos2d::Ripple3D>(tolua_S, "cc.Ripple3D",(cocos2d::Ripple3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "cc.Ripple3D:create",argc, 6);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Ripple3D_create'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_3d_Ripple3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (Ripple3D)");
    return 0;
}

int lua_register_cocos2dx_3d_Ripple3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.Ripple3D");
    tolua_cclass(tolua_S,"Ripple3D","cc.Ripple3D","cc.Grid3DAction",nullptr);

    tolua_beginmodule(tolua_S,"Ripple3D");
        tolua_function(tolua_S,"setAmplitudeRate",lua_cocos2dx_3d_Ripple3D_setAmplitudeRate);
        tolua_function(tolua_S,"getAmplitudeRate",lua_cocos2dx_3d_Ripple3D_getAmplitudeRate);
        tolua_function(tolua_S,"setAmplitude",lua_cocos2dx_3d_Ripple3D_setAmplitude);
        tolua_function(tolua_S,"getAmplitude",lua_cocos2dx_3d_Ripple3D_getAmplitude);
        tolua_function(tolua_S,"setPosition",lua_cocos2dx_3d_Ripple3D_setPosition);
        tolua_function(tolua_S,"getPosition",lua_cocos2dx_3d_Ripple3D_getPosition);
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_Ripple3D_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::Ripple3D).name();
    g_luaType[typeName] = "cc.Ripple3D";
    g_typeCast["Ripple3D"] = "cc.Ripple3D";
    return 1;
}

int lua_cocos2dx_3d_Shaky3D_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.Shaky3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 4)
    {
        double arg0;
        cocos2d::Size arg1;
        int arg2;
        bool arg3;
        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.Shaky3D:create");
        ok &= luaval_to_size(tolua_S, 3, &arg1, "cc.Shaky3D:create");
        ok &= luaval_to_int32(tolua_S, 4,(int *)&arg2, "cc.Shaky3D:create");
        ok &= luaval_to_boolean(tolua_S, 5,&arg3, "cc.Shaky3D:create");
        if(!ok)
            return 0;
        cocos2d::Shaky3D* ret = cocos2d::Shaky3D::create(arg0, arg1, arg2, arg3);
        object_to_luaval<cocos2d::Shaky3D>(tolua_S, "cc.Shaky3D",(cocos2d::Shaky3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "cc.Shaky3D:create",argc, 4);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Shaky3D_create'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_3d_Shaky3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (Shaky3D)");
    return 0;
}

int lua_register_cocos2dx_3d_Shaky3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.Shaky3D");
    tolua_cclass(tolua_S,"Shaky3D","cc.Shaky3D","cc.Grid3DAction",nullptr);

    tolua_beginmodule(tolua_S,"Shaky3D");
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_Shaky3D_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::Shaky3D).name();
    g_luaType[typeName] = "cc.Shaky3D";
    g_typeCast["Shaky3D"] = "cc.Shaky3D";
    return 1;
}

int lua_cocos2dx_3d_PageTurn3D_getGrid(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::PageTurn3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.PageTurn3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::PageTurn3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_PageTurn3D_getGrid'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        cocos2d::GridBase* ret = cobj->getGrid();
        object_to_luaval<cocos2d::GridBase>(tolua_S, "cc.GridBase",(cocos2d::GridBase*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.PageTurn3D:getGrid",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_PageTurn3D_getGrid'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_PageTurn3D_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.PageTurn3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 2)
    {
        double arg0;
        cocos2d::Size arg1;
        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.PageTurn3D:create");
        ok &= luaval_to_size(tolua_S, 3, &arg1, "cc.PageTurn3D:create");
        if(!ok)
            return 0;
        cocos2d::PageTurn3D* ret = cocos2d::PageTurn3D::create(arg0, arg1);
        object_to_luaval<cocos2d::PageTurn3D>(tolua_S, "cc.PageTurn3D",(cocos2d::PageTurn3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "cc.PageTurn3D:create",argc, 2);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_PageTurn3D_create'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_3d_PageTurn3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (PageTurn3D)");
    return 0;
}

int lua_register_cocos2dx_3d_PageTurn3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.PageTurn3D");
    tolua_cclass(tolua_S,"PageTurn3D","cc.PageTurn3D","cc.Grid3DAction",nullptr);

    tolua_beginmodule(tolua_S,"PageTurn3D");
        tolua_function(tolua_S,"getGrid",lua_cocos2dx_3d_PageTurn3D_getGrid);
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_PageTurn3D_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::PageTurn3D).name();
    g_luaType[typeName] = "cc.PageTurn3D";
    g_typeCast["PageTurn3D"] = "cc.PageTurn3D";
    return 1;
}

int lua_cocos2dx_3d_ShakyTiles3D_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.ShakyTiles3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 4)
    {
        double arg0;
        cocos2d::Size arg1;
        int arg2;
        bool arg3;
        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.ShakyTiles3D:create");
        ok &= luaval_to_size(tolua_S, 3, &arg1, "cc.ShakyTiles3D:create");
        ok &= luaval_to_int32(tolua_S, 4,(int *)&arg2, "cc.ShakyTiles3D:create");
        ok &= luaval_to_boolean(tolua_S, 5,&arg3, "cc.ShakyTiles3D:create");
        if(!ok)
            return 0;
        cocos2d::ShakyTiles3D* ret = cocos2d::ShakyTiles3D::create(arg0, arg1, arg2, arg3);
        object_to_luaval<cocos2d::ShakyTiles3D>(tolua_S, "cc.ShakyTiles3D",(cocos2d::ShakyTiles3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "cc.ShakyTiles3D:create",argc, 4);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_ShakyTiles3D_create'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_3d_ShakyTiles3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (ShakyTiles3D)");
    return 0;
}

int lua_register_cocos2dx_3d_ShakyTiles3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.ShakyTiles3D");
    tolua_cclass(tolua_S,"ShakyTiles3D","cc.ShakyTiles3D","cc.TiledGrid3DAction",nullptr);

    tolua_beginmodule(tolua_S,"ShakyTiles3D");
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_ShakyTiles3D_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::ShakyTiles3D).name();
    g_luaType[typeName] = "cc.ShakyTiles3D";
    g_typeCast["ShakyTiles3D"] = "cc.ShakyTiles3D";
    return 1;
}

int lua_cocos2dx_3d_ShatteredTiles3D_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.ShatteredTiles3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 4)
    {
        double arg0;
        cocos2d::Size arg1;
        int arg2;
        bool arg3;
        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.ShatteredTiles3D:create");
        ok &= luaval_to_size(tolua_S, 3, &arg1, "cc.ShatteredTiles3D:create");
        ok &= luaval_to_int32(tolua_S, 4,(int *)&arg2, "cc.ShatteredTiles3D:create");
        ok &= luaval_to_boolean(tolua_S, 5,&arg3, "cc.ShatteredTiles3D:create");
        if(!ok)
            return 0;
        cocos2d::ShatteredTiles3D* ret = cocos2d::ShatteredTiles3D::create(arg0, arg1, arg2, arg3);
        object_to_luaval<cocos2d::ShatteredTiles3D>(tolua_S, "cc.ShatteredTiles3D",(cocos2d::ShatteredTiles3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "cc.ShatteredTiles3D:create",argc, 4);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_ShatteredTiles3D_create'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_3d_ShatteredTiles3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (ShatteredTiles3D)");
    return 0;
}

int lua_register_cocos2dx_3d_ShatteredTiles3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.ShatteredTiles3D");
    tolua_cclass(tolua_S,"ShatteredTiles3D","cc.ShatteredTiles3D","cc.TiledGrid3DAction",nullptr);

    tolua_beginmodule(tolua_S,"ShatteredTiles3D");
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_ShatteredTiles3D_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::ShatteredTiles3D).name();
    g_luaType[typeName] = "cc.ShatteredTiles3D";
    g_typeCast["ShatteredTiles3D"] = "cc.ShatteredTiles3D";
    return 1;
}

int lua_cocos2dx_3d_WavesTiles3D_getAmplitudeRate(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::WavesTiles3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.WavesTiles3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::WavesTiles3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_WavesTiles3D_getAmplitudeRate'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        double ret = cobj->getAmplitudeRate();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.WavesTiles3D:getAmplitudeRate",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_WavesTiles3D_getAmplitudeRate'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_WavesTiles3D_setAmplitude(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::WavesTiles3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.WavesTiles3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::WavesTiles3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_WavesTiles3D_setAmplitude'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        double arg0;

        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.WavesTiles3D:setAmplitude");
        if(!ok)
            return 0;
        cobj->setAmplitude(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.WavesTiles3D:setAmplitude",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_WavesTiles3D_setAmplitude'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_WavesTiles3D_setAmplitudeRate(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::WavesTiles3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.WavesTiles3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::WavesTiles3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_WavesTiles3D_setAmplitudeRate'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        double arg0;

        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.WavesTiles3D:setAmplitudeRate");
        if(!ok)
            return 0;
        cobj->setAmplitudeRate(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.WavesTiles3D:setAmplitudeRate",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_WavesTiles3D_setAmplitudeRate'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_WavesTiles3D_getAmplitude(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::WavesTiles3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.WavesTiles3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::WavesTiles3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_WavesTiles3D_getAmplitude'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        double ret = cobj->getAmplitude();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.WavesTiles3D:getAmplitude",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_WavesTiles3D_getAmplitude'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_WavesTiles3D_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.WavesTiles3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 4)
    {
        double arg0;
        cocos2d::Size arg1;
        unsigned int arg2;
        double arg3;
        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.WavesTiles3D:create");
        ok &= luaval_to_size(tolua_S, 3, &arg1, "cc.WavesTiles3D:create");
        ok &= luaval_to_uint32(tolua_S, 4,&arg2, "cc.WavesTiles3D:create");
        ok &= luaval_to_number(tolua_S, 5,&arg3, "cc.WavesTiles3D:create");
        if(!ok)
            return 0;
        cocos2d::WavesTiles3D* ret = cocos2d::WavesTiles3D::create(arg0, arg1, arg2, arg3);
        object_to_luaval<cocos2d::WavesTiles3D>(tolua_S, "cc.WavesTiles3D",(cocos2d::WavesTiles3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "cc.WavesTiles3D:create",argc, 4);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_WavesTiles3D_create'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_3d_WavesTiles3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (WavesTiles3D)");
    return 0;
}

int lua_register_cocos2dx_3d_WavesTiles3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.WavesTiles3D");
    tolua_cclass(tolua_S,"WavesTiles3D","cc.WavesTiles3D","cc.TiledGrid3DAction",nullptr);

    tolua_beginmodule(tolua_S,"WavesTiles3D");
        tolua_function(tolua_S,"getAmplitudeRate",lua_cocos2dx_3d_WavesTiles3D_getAmplitudeRate);
        tolua_function(tolua_S,"setAmplitude",lua_cocos2dx_3d_WavesTiles3D_setAmplitude);
        tolua_function(tolua_S,"setAmplitudeRate",lua_cocos2dx_3d_WavesTiles3D_setAmplitudeRate);
        tolua_function(tolua_S,"getAmplitude",lua_cocos2dx_3d_WavesTiles3D_getAmplitude);
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_WavesTiles3D_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::WavesTiles3D).name();
    g_luaType[typeName] = "cc.WavesTiles3D";
    g_typeCast["WavesTiles3D"] = "cc.WavesTiles3D";
    return 1;
}

int lua_cocos2dx_3d_JumpTiles3D_getAmplitudeRate(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::JumpTiles3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.JumpTiles3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::JumpTiles3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_JumpTiles3D_getAmplitudeRate'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        double ret = cobj->getAmplitudeRate();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.JumpTiles3D:getAmplitudeRate",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_JumpTiles3D_getAmplitudeRate'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_JumpTiles3D_setAmplitude(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::JumpTiles3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.JumpTiles3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::JumpTiles3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_JumpTiles3D_setAmplitude'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        double arg0;

        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.JumpTiles3D:setAmplitude");
        if(!ok)
            return 0;
        cobj->setAmplitude(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.JumpTiles3D:setAmplitude",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_JumpTiles3D_setAmplitude'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_JumpTiles3D_setAmplitudeRate(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::JumpTiles3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.JumpTiles3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::JumpTiles3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_JumpTiles3D_setAmplitudeRate'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        double arg0;

        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.JumpTiles3D:setAmplitudeRate");
        if(!ok)
            return 0;
        cobj->setAmplitudeRate(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.JumpTiles3D:setAmplitudeRate",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_JumpTiles3D_setAmplitudeRate'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_JumpTiles3D_getAmplitude(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::JumpTiles3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.JumpTiles3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::JumpTiles3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_JumpTiles3D_getAmplitude'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        double ret = cobj->getAmplitude();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.JumpTiles3D:getAmplitude",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_JumpTiles3D_getAmplitude'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_JumpTiles3D_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.JumpTiles3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 4)
    {
        double arg0;
        cocos2d::Size arg1;
        unsigned int arg2;
        double arg3;
        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.JumpTiles3D:create");
        ok &= luaval_to_size(tolua_S, 3, &arg1, "cc.JumpTiles3D:create");
        ok &= luaval_to_uint32(tolua_S, 4,&arg2, "cc.JumpTiles3D:create");
        ok &= luaval_to_number(tolua_S, 5,&arg3, "cc.JumpTiles3D:create");
        if(!ok)
            return 0;
        cocos2d::JumpTiles3D* ret = cocos2d::JumpTiles3D::create(arg0, arg1, arg2, arg3);
        object_to_luaval<cocos2d::JumpTiles3D>(tolua_S, "cc.JumpTiles3D",(cocos2d::JumpTiles3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "cc.JumpTiles3D:create",argc, 4);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_JumpTiles3D_create'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_3d_JumpTiles3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (JumpTiles3D)");
    return 0;
}

int lua_register_cocos2dx_3d_JumpTiles3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.JumpTiles3D");
    tolua_cclass(tolua_S,"JumpTiles3D","cc.JumpTiles3D","cc.TiledGrid3DAction",nullptr);

    tolua_beginmodule(tolua_S,"JumpTiles3D");
        tolua_function(tolua_S,"getAmplitudeRate",lua_cocos2dx_3d_JumpTiles3D_getAmplitudeRate);
        tolua_function(tolua_S,"setAmplitude",lua_cocos2dx_3d_JumpTiles3D_setAmplitude);
        tolua_function(tolua_S,"setAmplitudeRate",lua_cocos2dx_3d_JumpTiles3D_setAmplitudeRate);
        tolua_function(tolua_S,"getAmplitude",lua_cocos2dx_3d_JumpTiles3D_getAmplitude);
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_JumpTiles3D_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::JumpTiles3D).name();
    g_luaType[typeName] = "cc.JumpTiles3D";
    g_typeCast["JumpTiles3D"] = "cc.JumpTiles3D";
    return 1;
}

int lua_cocos2dx_3d_Grid3D_setVertex(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Grid3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Grid3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Grid3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Grid3D_setVertex'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 2) 
    {
        cocos2d::Vec2 arg0;
        cocos2d::Vec3 arg1;

        ok &= luaval_to_vec2(tolua_S, 2, &arg0, "cc.Grid3D:setVertex");

        ok &= luaval_to_vec3(tolua_S, 3, &arg1, "cc.Grid3D:setVertex");
        if(!ok)
            return 0;
        cobj->setVertex(arg0, arg1);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Grid3D:setVertex",argc, 2);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Grid3D_setVertex'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Grid3D_getOriginalVertex(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Grid3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Grid3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Grid3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Grid3D_getOriginalVertex'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        cocos2d::Vec2 arg0;

        ok &= luaval_to_vec2(tolua_S, 2, &arg0, "cc.Grid3D:getOriginalVertex");
        if(!ok)
            return 0;
        cocos2d::Vec3 ret = cobj->getOriginalVertex(arg0);
        vec3_to_luaval(tolua_S, ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Grid3D:getOriginalVertex",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Grid3D_getOriginalVertex'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Grid3D_getNeedDepthTestForBlit(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Grid3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Grid3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Grid3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Grid3D_getNeedDepthTestForBlit'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        bool ret = cobj->getNeedDepthTestForBlit();
        tolua_pushboolean(tolua_S,(bool)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Grid3D:getNeedDepthTestForBlit",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Grid3D_getNeedDepthTestForBlit'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Grid3D_getVertex(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Grid3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Grid3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Grid3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Grid3D_getVertex'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        cocos2d::Vec2 arg0;

        ok &= luaval_to_vec2(tolua_S, 2, &arg0, "cc.Grid3D:getVertex");
        if(!ok)
            return 0;
        cocos2d::Vec3 ret = cobj->getVertex(arg0);
        vec3_to_luaval(tolua_S, ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Grid3D:getVertex",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Grid3D_getVertex'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Grid3D_setNeedDepthTestForBlit(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Grid3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Grid3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Grid3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Grid3D_setNeedDepthTestForBlit'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        bool arg0;

        ok &= luaval_to_boolean(tolua_S, 2,&arg0, "cc.Grid3D:setNeedDepthTestForBlit");
        if(!ok)
            return 0;
        cobj->setNeedDepthTestForBlit(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Grid3D:setNeedDepthTestForBlit",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Grid3D_setNeedDepthTestForBlit'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Grid3D_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;
#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.Grid3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S)-1;

    do 
    {
        if (argc == 1)
        {
            cocos2d::Size arg0;
            ok &= luaval_to_size(tolua_S, 2, &arg0, "cc.Grid3D:create");
            if (!ok) { break; }
            cocos2d::Grid3D* ret = cocos2d::Grid3D::create(arg0);
            object_to_luaval<cocos2d::Grid3D>(tolua_S, "cc.Grid3D",(cocos2d::Grid3D*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    do 
    {
        if (argc == 3)
        {
            cocos2d::Size arg0;
            ok &= luaval_to_size(tolua_S, 2, &arg0, "cc.Grid3D:create");
            if (!ok) { break; }
            cocos2d::Texture2D* arg1;
            ok &= luaval_to_object<cocos2d::Texture2D>(tolua_S, 3, "cc.Texture2D",&arg1);
            if (!ok) { break; }
            bool arg2;
            ok &= luaval_to_boolean(tolua_S, 4,&arg2, "cc.Grid3D:create");
            if (!ok) { break; }
            cocos2d::Grid3D* ret = cocos2d::Grid3D::create(arg0, arg1, arg2);
            object_to_luaval<cocos2d::Grid3D>(tolua_S, "cc.Grid3D",(cocos2d::Grid3D*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    CCLOG("%s has wrong number of arguments: %d, was expecting %d", "cc.Grid3D:create",argc, 3);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Grid3D_create'.",&tolua_err);
#endif
    return 0;
}
int lua_cocos2dx_3d_Grid3D_constructor(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Grid3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif



    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        cobj = new cocos2d::Grid3D();
        cobj->autorelease();
        int ID =  (int)cobj->_ID ;
        int* luaID =  &cobj->_luaID ;
        toluafix_pushusertype_ccobject(tolua_S, ID, luaID, (void*)cobj,"cc.Grid3D");
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Grid3D:Grid3D",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Grid3D_constructor'.",&tolua_err);
#endif

    return 0;
}

static int lua_cocos2dx_3d_Grid3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (Grid3D)");
    return 0;
}

int lua_register_cocos2dx_3d_Grid3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.Grid3D");
    tolua_cclass(tolua_S,"Grid3D","cc.Grid3D","cc.GridBase",nullptr);

    tolua_beginmodule(tolua_S,"Grid3D");
        tolua_function(tolua_S,"new",lua_cocos2dx_3d_Grid3D_constructor);
        tolua_function(tolua_S,"setVertex",lua_cocos2dx_3d_Grid3D_setVertex);
        tolua_function(tolua_S,"getOriginalVertex",lua_cocos2dx_3d_Grid3D_getOriginalVertex);
        tolua_function(tolua_S,"getNeedDepthTestForBlit",lua_cocos2dx_3d_Grid3D_getNeedDepthTestForBlit);
        tolua_function(tolua_S,"getVertex",lua_cocos2dx_3d_Grid3D_getVertex);
        tolua_function(tolua_S,"setNeedDepthTestForBlit",lua_cocos2dx_3d_Grid3D_setNeedDepthTestForBlit);
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_Grid3D_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::Grid3D).name();
    g_luaType[typeName] = "cc.Grid3D";
    g_typeCast["Grid3D"] = "cc.Grid3D";
    return 1;
}

int lua_cocos2dx_3d_TiledGrid3D_getOriginalTile(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::TiledGrid3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.TiledGrid3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::TiledGrid3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_TiledGrid3D_getOriginalTile'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        cocos2d::Vec2 arg0;

        ok &= luaval_to_vec2(tolua_S, 2, &arg0, "cc.TiledGrid3D:getOriginalTile");
        if(!ok)
            return 0;
        cocos2d::Quad3 ret = cobj->getOriginalTile(arg0);
        #pragma warning NO CONVERSION FROM NATIVE FOR Quad3;
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.TiledGrid3D:getOriginalTile",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_TiledGrid3D_getOriginalTile'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_TiledGrid3D_getTile(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::TiledGrid3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.TiledGrid3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::TiledGrid3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_TiledGrid3D_getTile'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        cocos2d::Vec2 arg0;

        ok &= luaval_to_vec2(tolua_S, 2, &arg0, "cc.TiledGrid3D:getTile");
        if(!ok)
            return 0;
        cocos2d::Quad3 ret = cobj->getTile(arg0);
        #pragma warning NO CONVERSION FROM NATIVE FOR Quad3;
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.TiledGrid3D:getTile",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_TiledGrid3D_getTile'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_TiledGrid3D_setTile(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::TiledGrid3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.TiledGrid3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::TiledGrid3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_TiledGrid3D_setTile'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 2) 
    {
        cocos2d::Vec2 arg0;
        cocos2d::Quad3 arg1;

        ok &= luaval_to_vec2(tolua_S, 2, &arg0, "cc.TiledGrid3D:setTile");

        #pragma warning NO CONVERSION TO NATIVE FOR Quad3
		ok = false;
        if(!ok)
            return 0;
        cobj->setTile(arg0, arg1);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.TiledGrid3D:setTile",argc, 2);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_TiledGrid3D_setTile'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_TiledGrid3D_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;
#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.TiledGrid3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S)-1;

    do 
    {
        if (argc == 1)
        {
            cocos2d::Size arg0;
            ok &= luaval_to_size(tolua_S, 2, &arg0, "cc.TiledGrid3D:create");
            if (!ok) { break; }
            cocos2d::TiledGrid3D* ret = cocos2d::TiledGrid3D::create(arg0);
            object_to_luaval<cocos2d::TiledGrid3D>(tolua_S, "cc.TiledGrid3D",(cocos2d::TiledGrid3D*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    do 
    {
        if (argc == 3)
        {
            cocos2d::Size arg0;
            ok &= luaval_to_size(tolua_S, 2, &arg0, "cc.TiledGrid3D:create");
            if (!ok) { break; }
            cocos2d::Texture2D* arg1;
            ok &= luaval_to_object<cocos2d::Texture2D>(tolua_S, 3, "cc.Texture2D",&arg1);
            if (!ok) { break; }
            bool arg2;
            ok &= luaval_to_boolean(tolua_S, 4,&arg2, "cc.TiledGrid3D:create");
            if (!ok) { break; }
            cocos2d::TiledGrid3D* ret = cocos2d::TiledGrid3D::create(arg0, arg1, arg2);
            object_to_luaval<cocos2d::TiledGrid3D>(tolua_S, "cc.TiledGrid3D",(cocos2d::TiledGrid3D*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    CCLOG("%s has wrong number of arguments: %d, was expecting %d", "cc.TiledGrid3D:create",argc, 3);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_TiledGrid3D_create'.",&tolua_err);
#endif
    return 0;
}
int lua_cocos2dx_3d_TiledGrid3D_constructor(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::TiledGrid3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif



    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        cobj = new cocos2d::TiledGrid3D();
        cobj->autorelease();
        int ID =  (int)cobj->_ID ;
        int* luaID =  &cobj->_luaID ;
        toluafix_pushusertype_ccobject(tolua_S, ID, luaID, (void*)cobj,"cc.TiledGrid3D");
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.TiledGrid3D:TiledGrid3D",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_TiledGrid3D_constructor'.",&tolua_err);
#endif

    return 0;
}

static int lua_cocos2dx_3d_TiledGrid3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (TiledGrid3D)");
    return 0;
}

int lua_register_cocos2dx_3d_TiledGrid3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.TiledGrid3D");
    tolua_cclass(tolua_S,"TiledGrid3D","cc.TiledGrid3D","cc.GridBase",nullptr);

    tolua_beginmodule(tolua_S,"TiledGrid3D");
        tolua_function(tolua_S,"new",lua_cocos2dx_3d_TiledGrid3D_constructor);
        tolua_function(tolua_S,"getOriginalTile",lua_cocos2dx_3d_TiledGrid3D_getOriginalTile);
        tolua_function(tolua_S,"getTile",lua_cocos2dx_3d_TiledGrid3D_getTile);
        tolua_function(tolua_S,"setTile",lua_cocos2dx_3d_TiledGrid3D_setTile);
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_TiledGrid3D_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::TiledGrid3D).name();
    g_luaType[typeName] = "cc.TiledGrid3D";
    g_typeCast["TiledGrid3D"] = "cc.TiledGrid3D";
    return 1;
}

int lua_cocos2dx_3d_Bone3D_getInverseBindPose(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Bone3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Bone3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Bone3D_getInverseBindPose'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        const cocos2d::Mat4& ret = cobj->getInverseBindPose();
        mat4_to_luaval(tolua_S, ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Bone3D:getInverseBindPose",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_getInverseBindPose'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Bone3D_clearBoneBlendState(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Bone3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Bone3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Bone3D_clearBoneBlendState'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        cobj->clearBoneBlendState();
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Bone3D:clearBoneBlendState",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_clearBoneBlendState'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Bone3D_resetPose(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Bone3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Bone3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Bone3D_resetPose'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        cobj->resetPose();
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Bone3D:resetPose",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_resetPose'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Bone3D_setAnimationValue(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Bone3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Bone3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Bone3D_setAnimationValue'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 3) 
    {
        float* arg0;
        float* arg1;
        float* arg2;

        #pragma warning NO CONVERSION TO NATIVE FOR float*
		ok = false;

        #pragma warning NO CONVERSION TO NATIVE FOR float*
		ok = false;

        #pragma warning NO CONVERSION TO NATIVE FOR float*
		ok = false;
        if(!ok)
            return 0;
        cobj->setAnimationValue(arg0, arg1, arg2);
        return 0;
    }
    if (argc == 4) 
    {
        float* arg0;
        float* arg1;
        float* arg2;
        void* arg3;

        #pragma warning NO CONVERSION TO NATIVE FOR float*
		ok = false;

        #pragma warning NO CONVERSION TO NATIVE FOR float*
		ok = false;

        #pragma warning NO CONVERSION TO NATIVE FOR float*
		ok = false;

        #pragma warning NO CONVERSION TO NATIVE FOR void*
		ok = false;
        if(!ok)
            return 0;
        cobj->setAnimationValue(arg0, arg1, arg2, arg3);
        return 0;
    }
    if (argc == 5) 
    {
        float* arg0;
        float* arg1;
        float* arg2;
        void* arg3;
        double arg4;

        #pragma warning NO CONVERSION TO NATIVE FOR float*
		ok = false;

        #pragma warning NO CONVERSION TO NATIVE FOR float*
		ok = false;

        #pragma warning NO CONVERSION TO NATIVE FOR float*
		ok = false;

        #pragma warning NO CONVERSION TO NATIVE FOR void*
		ok = false;

        ok &= luaval_to_number(tolua_S, 6,&arg4, "cc.Bone3D:setAnimationValue");
        if(!ok)
            return 0;
        cobj->setAnimationValue(arg0, arg1, arg2, arg3, arg4);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Bone3D:setAnimationValue",argc, 3);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_setAnimationValue'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Bone3D_getChildBoneByIndex(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Bone3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Bone3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Bone3D_getChildBoneByIndex'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        int arg0;

        ok &= luaval_to_int32(tolua_S, 2,(int *)&arg0, "cc.Bone3D:getChildBoneByIndex");
        if(!ok)
            return 0;
        cocos2d::Bone3D* ret = cobj->getChildBoneByIndex(arg0);
        object_to_luaval<cocos2d::Bone3D>(tolua_S, "cc.Bone3D",(cocos2d::Bone3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Bone3D:getChildBoneByIndex",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_getChildBoneByIndex'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Bone3D_removeChildBone(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Bone3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Bone3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Bone3D_removeChildBone'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        cocos2d::Bone3D* arg0;

        ok &= luaval_to_object<cocos2d::Bone3D>(tolua_S, 2, "cc.Bone3D",&arg0);
        if(!ok)
            return 0;
        cobj->removeChildBone(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Bone3D:removeChildBone",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_removeChildBone'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Bone3D_getParentBone(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Bone3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Bone3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Bone3D_getParentBone'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        cocos2d::Bone3D* ret = cobj->getParentBone();
        object_to_luaval<cocos2d::Bone3D>(tolua_S, "cc.Bone3D",(cocos2d::Bone3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Bone3D:getParentBone",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_getParentBone'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Bone3D_getName(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Bone3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Bone3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Bone3D_getName'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        const std::string& ret = cobj->getName();
        tolua_pushcppstring(tolua_S,ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Bone3D:getName",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_getName'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Bone3D_removeAllChildBone(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Bone3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Bone3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Bone3D_removeAllChildBone'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        cobj->removeAllChildBone();
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Bone3D:removeAllChildBone",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_removeAllChildBone'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Bone3D_addChildBone(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Bone3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Bone3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Bone3D_addChildBone'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        cocos2d::Bone3D* arg0;

        ok &= luaval_to_object<cocos2d::Bone3D>(tolua_S, 2, "cc.Bone3D",&arg0);
        if(!ok)
            return 0;
        cobj->addChildBone(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Bone3D:addChildBone",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_addChildBone'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Bone3D_getChildBoneCount(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Bone3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Bone3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Bone3D_getChildBoneCount'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        ssize_t ret = cobj->getChildBoneCount();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Bone3D:getChildBoneCount",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_getChildBoneCount'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Bone3D_updateJointMatrix(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Bone3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Bone3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Bone3D_updateJointMatrix'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        cocos2d::Vec4* arg0;

        ok &= luaval_to_object<cocos2d::Vec4>(tolua_S, 2, "cc.Vec4",&arg0);
        if(!ok)
            return 0;
        cobj->updateJointMatrix(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Bone3D:updateJointMatrix",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_updateJointMatrix'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Bone3D_setInverseBindPose(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Bone3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Bone3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Bone3D_setInverseBindPose'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        cocos2d::Mat4 arg0;

        ok &= luaval_to_mat4(tolua_S, 2, &arg0, "cc.Bone3D:setInverseBindPose");
        if(!ok)
            return 0;
        cobj->setInverseBindPose(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Bone3D:setInverseBindPose",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_setInverseBindPose'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Bone3D_getWorldMat(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Bone3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Bone3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Bone3D_getWorldMat'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        const cocos2d::Mat4& ret = cobj->getWorldMat();
        mat4_to_luaval(tolua_S, ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Bone3D:getWorldMat",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_getWorldMat'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Bone3D_updateWorldMat(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Bone3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Bone3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Bone3D_updateWorldMat'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        cobj->updateWorldMat();
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Bone3D:updateWorldMat",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_updateWorldMat'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Bone3D_setOriPose(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Bone3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Bone3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Bone3D_setOriPose'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        cocos2d::Mat4 arg0;

        ok &= luaval_to_mat4(tolua_S, 2, &arg0, "cc.Bone3D:setOriPose");
        if(!ok)
            return 0;
        cobj->setOriPose(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Bone3D:setOriPose",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_setOriPose'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Bone3D_removeChildBoneByIndex(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Bone3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Bone3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Bone3D_removeChildBoneByIndex'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        int arg0;

        ok &= luaval_to_int32(tolua_S, 2,(int *)&arg0, "cc.Bone3D:removeChildBoneByIndex");
        if(!ok)
            return 0;
        cobj->removeChildBoneByIndex(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Bone3D:removeChildBoneByIndex",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_removeChildBoneByIndex'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Bone3D_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.Bone3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 1)
    {
        std::string arg0;
        ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.Bone3D:create");
        if(!ok)
            return 0;
        cocos2d::Bone3D* ret = cocos2d::Bone3D::create(arg0);
        object_to_luaval<cocos2d::Bone3D>(tolua_S, "cc.Bone3D",(cocos2d::Bone3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "cc.Bone3D:create",argc, 1);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Bone3D_create'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_3d_Bone3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (Bone3D)");
    return 0;
}

int lua_register_cocos2dx_3d_Bone3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.Bone3D");
    tolua_cclass(tolua_S,"Bone3D","cc.Bone3D","cc.Ref",nullptr);

    tolua_beginmodule(tolua_S,"Bone3D");
        tolua_function(tolua_S,"getInverseBindPose",lua_cocos2dx_3d_Bone3D_getInverseBindPose);
        tolua_function(tolua_S,"clearBoneBlendState",lua_cocos2dx_3d_Bone3D_clearBoneBlendState);
        tolua_function(tolua_S,"resetPose",lua_cocos2dx_3d_Bone3D_resetPose);
        tolua_function(tolua_S,"setAnimationValue",lua_cocos2dx_3d_Bone3D_setAnimationValue);
        tolua_function(tolua_S,"getChildBoneByIndex",lua_cocos2dx_3d_Bone3D_getChildBoneByIndex);
        tolua_function(tolua_S,"removeChildBone",lua_cocos2dx_3d_Bone3D_removeChildBone);
        tolua_function(tolua_S,"getParentBone",lua_cocos2dx_3d_Bone3D_getParentBone);
        tolua_function(tolua_S,"getName",lua_cocos2dx_3d_Bone3D_getName);
        tolua_function(tolua_S,"removeAllChildBone",lua_cocos2dx_3d_Bone3D_removeAllChildBone);
        tolua_function(tolua_S,"addChildBone",lua_cocos2dx_3d_Bone3D_addChildBone);
        tolua_function(tolua_S,"getChildBoneCount",lua_cocos2dx_3d_Bone3D_getChildBoneCount);
        tolua_function(tolua_S,"updateJointMatrix",lua_cocos2dx_3d_Bone3D_updateJointMatrix);
        tolua_function(tolua_S,"setInverseBindPose",lua_cocos2dx_3d_Bone3D_setInverseBindPose);
        tolua_function(tolua_S,"getWorldMat",lua_cocos2dx_3d_Bone3D_getWorldMat);
        tolua_function(tolua_S,"updateWorldMat",lua_cocos2dx_3d_Bone3D_updateWorldMat);
        tolua_function(tolua_S,"setOriPose",lua_cocos2dx_3d_Bone3D_setOriPose);
        tolua_function(tolua_S,"removeChildBoneByIndex",lua_cocos2dx_3d_Bone3D_removeChildBoneByIndex);
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_Bone3D_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::Bone3D).name();
    g_luaType[typeName] = "cc.Bone3D";
    g_typeCast["Bone3D"] = "cc.Bone3D";
    return 1;
}

int lua_cocos2dx_3d_Skeleton3D_getBoneByName(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Skeleton3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Skeleton3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Skeleton3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Skeleton3D_getBoneByName'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        std::string arg0;

        ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.Skeleton3D:getBoneByName");
        if(!ok)
            return 0;
        cocos2d::Bone3D* ret = cobj->getBoneByName(arg0);
        object_to_luaval<cocos2d::Bone3D>(tolua_S, "cc.Bone3D",(cocos2d::Bone3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Skeleton3D:getBoneByName",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Skeleton3D_getBoneByName'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Skeleton3D_getRootBone(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Skeleton3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Skeleton3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Skeleton3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Skeleton3D_getRootBone'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        int arg0;

        ok &= luaval_to_int32(tolua_S, 2,(int *)&arg0, "cc.Skeleton3D:getRootBone");
        if(!ok)
            return 0;
        cocos2d::Bone3D* ret = cobj->getRootBone(arg0);
        object_to_luaval<cocos2d::Bone3D>(tolua_S, "cc.Bone3D",(cocos2d::Bone3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Skeleton3D:getRootBone",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Skeleton3D_getRootBone'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Skeleton3D_updateBoneMatrix(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Skeleton3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Skeleton3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Skeleton3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Skeleton3D_updateBoneMatrix'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        cobj->updateBoneMatrix();
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Skeleton3D:updateBoneMatrix",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Skeleton3D_updateBoneMatrix'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Skeleton3D_getBoneByIndex(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Skeleton3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Skeleton3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Skeleton3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Skeleton3D_getBoneByIndex'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        unsigned int arg0;

        ok &= luaval_to_uint32(tolua_S, 2,&arg0, "cc.Skeleton3D:getBoneByIndex");
        if(!ok)
            return 0;
        cocos2d::Bone3D* ret = cobj->getBoneByIndex(arg0);
        object_to_luaval<cocos2d::Bone3D>(tolua_S, "cc.Bone3D",(cocos2d::Bone3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Skeleton3D:getBoneByIndex",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Skeleton3D_getBoneByIndex'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Skeleton3D_getRootCount(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Skeleton3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Skeleton3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Skeleton3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Skeleton3D_getRootCount'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        ssize_t ret = cobj->getRootCount();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Skeleton3D:getRootCount",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Skeleton3D_getRootCount'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Skeleton3D_getBoneIndex(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Skeleton3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Skeleton3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Skeleton3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Skeleton3D_getBoneIndex'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        cocos2d::Bone3D* arg0;

        ok &= luaval_to_object<cocos2d::Bone3D>(tolua_S, 2, "cc.Bone3D",&arg0);
        if(!ok)
            return 0;
        int ret = cobj->getBoneIndex(arg0);
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Skeleton3D:getBoneIndex",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Skeleton3D_getBoneIndex'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Skeleton3D_getBoneCount(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Skeleton3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Skeleton3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Skeleton3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Skeleton3D_getBoneCount'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        ssize_t ret = cobj->getBoneCount();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Skeleton3D:getBoneCount",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Skeleton3D_getBoneCount'.",&tolua_err);
#endif

    return 0;
}
static int lua_cocos2dx_3d_Skeleton3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (Skeleton3D)");
    return 0;
}

int lua_register_cocos2dx_3d_Skeleton3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.Skeleton3D");
    tolua_cclass(tolua_S,"Skeleton3D","cc.Skeleton3D","cc.Ref",nullptr);

    tolua_beginmodule(tolua_S,"Skeleton3D");
        tolua_function(tolua_S,"getBoneByName",lua_cocos2dx_3d_Skeleton3D_getBoneByName);
        tolua_function(tolua_S,"getRootBone",lua_cocos2dx_3d_Skeleton3D_getRootBone);
        tolua_function(tolua_S,"updateBoneMatrix",lua_cocos2dx_3d_Skeleton3D_updateBoneMatrix);
        tolua_function(tolua_S,"getBoneByIndex",lua_cocos2dx_3d_Skeleton3D_getBoneByIndex);
        tolua_function(tolua_S,"getRootCount",lua_cocos2dx_3d_Skeleton3D_getRootCount);
        tolua_function(tolua_S,"getBoneIndex",lua_cocos2dx_3d_Skeleton3D_getBoneIndex);
        tolua_function(tolua_S,"getBoneCount",lua_cocos2dx_3d_Skeleton3D_getBoneCount);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::Skeleton3D).name();
    g_luaType[typeName] = "cc.Skeleton3D";
    g_typeCast["Skeleton3D"] = "cc.Skeleton3D";
    return 1;
}

int lua_cocos2dx_3d_Sprite3D_setCullFaceEnabled(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Sprite3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Sprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Sprite3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Sprite3D_setCullFaceEnabled'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        bool arg0;

        ok &= luaval_to_boolean(tolua_S, 2,&arg0, "cc.Sprite3D:setCullFaceEnabled");
        if(!ok)
            return 0;
        cobj->setCullFaceEnabled(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Sprite3D:setCullFaceEnabled",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Sprite3D_setCullFaceEnabled'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Sprite3D_setTexture(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Sprite3D* cobj = nullptr;
    bool ok  = true;
#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Sprite3D",0,&tolua_err)) goto tolua_lerror;
#endif
    cobj = (cocos2d::Sprite3D*)tolua_tousertype(tolua_S,1,0);
#if COCOS2D_DEBUG >= 1
    if (!cobj)
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Sprite3D_setTexture'", nullptr);
        return 0;
    }
#endif
    argc = lua_gettop(tolua_S)-1;
    do{
        if (argc == 1) {
            cocos2d::Texture2D* arg0;
            ok &= luaval_to_object<cocos2d::Texture2D>(tolua_S, 2, "cc.Texture2D",&arg0);

            if (!ok) { break; }
            cobj->setTexture(arg0);
            return 0;
        }
    }while(0);
    ok  = true;
    do{
        if (argc == 1) {
            std::string arg0;
            ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.Sprite3D:setTexture");

            if (!ok) { break; }
            cobj->setTexture(arg0);
            return 0;
        }
    }while(0);
    ok  = true;
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n",  "cc.Sprite3D:setTexture",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Sprite3D_setTexture'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Sprite3D_getLightMask(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Sprite3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Sprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Sprite3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Sprite3D_getLightMask'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        unsigned int ret = cobj->getLightMask();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Sprite3D:getLightMask",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Sprite3D_getLightMask'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Sprite3D_removeAllAttachNode(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Sprite3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Sprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Sprite3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Sprite3D_removeAllAttachNode'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        cobj->removeAllAttachNode();
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Sprite3D:removeAllAttachNode",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Sprite3D_removeAllAttachNode'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Sprite3D_getMesh(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Sprite3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Sprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Sprite3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Sprite3D_getMesh'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        cocos2d::Mesh* ret = cobj->getMesh();
        object_to_luaval<cocos2d::Mesh>(tolua_S, "cc.Mesh",(cocos2d::Mesh*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Sprite3D:getMesh",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Sprite3D_getMesh'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Sprite3D_setLightMask(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Sprite3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Sprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Sprite3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Sprite3D_setLightMask'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        unsigned int arg0;

        ok &= luaval_to_uint32(tolua_S, 2,&arg0, "cc.Sprite3D:setLightMask");
        if(!ok)
            return 0;
        cobj->setLightMask(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Sprite3D:setLightMask",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Sprite3D_setLightMask'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Sprite3D_getBlendFunc(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Sprite3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Sprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Sprite3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Sprite3D_getBlendFunc'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        const cocos2d::BlendFunc& ret = cobj->getBlendFunc();
        blendfunc_to_luaval(tolua_S, ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Sprite3D:getBlendFunc",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Sprite3D_getBlendFunc'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Sprite3D_setCullFace(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Sprite3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Sprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Sprite3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Sprite3D_setCullFace'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        unsigned int arg0;

        ok &= luaval_to_uint32(tolua_S, 2,&arg0, "cc.Sprite3D:setCullFace");
        if(!ok)
            return 0;
        cobj->setCullFace(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Sprite3D:setCullFace",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Sprite3D_setCullFace'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Sprite3D_removeAttachNode(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Sprite3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Sprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Sprite3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Sprite3D_removeAttachNode'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        std::string arg0;

        ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.Sprite3D:removeAttachNode");
        if(!ok)
            return 0;
        cobj->removeAttachNode(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Sprite3D:removeAttachNode",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Sprite3D_removeAttachNode'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Sprite3D_getMeshByIndex(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Sprite3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Sprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Sprite3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Sprite3D_getMeshByIndex'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        int arg0;

        ok &= luaval_to_int32(tolua_S, 2,(int *)&arg0, "cc.Sprite3D:getMeshByIndex");
        if(!ok)
            return 0;
        cocos2d::Mesh* ret = cobj->getMeshByIndex(arg0);
        object_to_luaval<cocos2d::Mesh>(tolua_S, "cc.Mesh",(cocos2d::Mesh*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Sprite3D:getMeshByIndex",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Sprite3D_getMeshByIndex'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Sprite3D_getMeshByName(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Sprite3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Sprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Sprite3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Sprite3D_getMeshByName'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        std::string arg0;

        ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.Sprite3D:getMeshByName");
        if(!ok)
            return 0;
        cocos2d::Mesh* ret = cobj->getMeshByName(arg0);
        object_to_luaval<cocos2d::Mesh>(tolua_S, "cc.Mesh",(cocos2d::Mesh*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Sprite3D:getMeshByName",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Sprite3D_getMeshByName'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Sprite3D_getSkeleton(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Sprite3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Sprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Sprite3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Sprite3D_getSkeleton'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        cocos2d::Skeleton3D* ret = cobj->getSkeleton();
        object_to_luaval<cocos2d::Skeleton3D>(tolua_S, "cc.Skeleton3D",(cocos2d::Skeleton3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Sprite3D:getSkeleton",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Sprite3D_getSkeleton'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Sprite3D_getAttachNode(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Sprite3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Sprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Sprite3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Sprite3D_getAttachNode'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        std::string arg0;

        ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.Sprite3D:getAttachNode");
        if(!ok)
            return 0;
        cocos2d::AttachNode* ret = cobj->getAttachNode(arg0);
        object_to_luaval<cocos2d::AttachNode>(tolua_S, "cc.AttachNode",(cocos2d::AttachNode*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Sprite3D:getAttachNode",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Sprite3D_getAttachNode'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Sprite3D_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;
#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.Sprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S)-1;

    do 
    {
        if (argc == 2)
        {
            std::string arg0;
            ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.Sprite3D:create");
            if (!ok) { break; }
            std::string arg1;
            ok &= luaval_to_std_string(tolua_S, 3,&arg1, "cc.Sprite3D:create");
            if (!ok) { break; }
            cocos2d::Sprite3D* ret = cocos2d::Sprite3D::create(arg0, arg1);
            object_to_luaval<cocos2d::Sprite3D>(tolua_S, "cc.Sprite3D",(cocos2d::Sprite3D*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    do 
    {
        if (argc == 1)
        {
            std::string arg0;
            ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.Sprite3D:create");
            if (!ok) { break; }
            cocos2d::Sprite3D* ret = cocos2d::Sprite3D::create(arg0);
            object_to_luaval<cocos2d::Sprite3D>(tolua_S, "cc.Sprite3D",(cocos2d::Sprite3D*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    CCLOG("%s has wrong number of arguments: %d, was expecting %d", "cc.Sprite3D:create",argc, 1);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Sprite3D_create'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_3d_Sprite3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (Sprite3D)");
    return 0;
}

int lua_register_cocos2dx_3d_Sprite3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.Sprite3D");
    tolua_cclass(tolua_S,"Sprite3D","cc.Sprite3D","cc.Node",nullptr);

    tolua_beginmodule(tolua_S,"Sprite3D");
        tolua_function(tolua_S,"setCullFaceEnabled",lua_cocos2dx_3d_Sprite3D_setCullFaceEnabled);
        tolua_function(tolua_S,"setTexture",lua_cocos2dx_3d_Sprite3D_setTexture);
        tolua_function(tolua_S,"getLightMask",lua_cocos2dx_3d_Sprite3D_getLightMask);
        tolua_function(tolua_S,"removeAllAttachNode",lua_cocos2dx_3d_Sprite3D_removeAllAttachNode);
        tolua_function(tolua_S,"getMesh",lua_cocos2dx_3d_Sprite3D_getMesh);
        tolua_function(tolua_S,"setLightMask",lua_cocos2dx_3d_Sprite3D_setLightMask);
        tolua_function(tolua_S,"getBlendFunc",lua_cocos2dx_3d_Sprite3D_getBlendFunc);
        tolua_function(tolua_S,"setCullFace",lua_cocos2dx_3d_Sprite3D_setCullFace);
        tolua_function(tolua_S,"removeAttachNode",lua_cocos2dx_3d_Sprite3D_removeAttachNode);
        tolua_function(tolua_S,"getMeshByIndex",lua_cocos2dx_3d_Sprite3D_getMeshByIndex);
        tolua_function(tolua_S,"getMeshByName",lua_cocos2dx_3d_Sprite3D_getMeshByName);
        tolua_function(tolua_S,"getSkeleton",lua_cocos2dx_3d_Sprite3D_getSkeleton);
        tolua_function(tolua_S,"getAttachNode",lua_cocos2dx_3d_Sprite3D_getAttachNode);
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_Sprite3D_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::Sprite3D).name();
    g_luaType[typeName] = "cc.Sprite3D";
    g_typeCast["Sprite3D"] = "cc.Sprite3D";
    return 1;
}

int lua_cocos2dx_3d_Mesh_getMeshVertexAttribCount(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_getMeshVertexAttribCount'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        ssize_t ret = cobj->getMeshVertexAttribCount();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:getMeshVertexAttribCount",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_getMeshVertexAttribCount'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_setTexture(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;
#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif
    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);
#if COCOS2D_DEBUG >= 1
    if (!cobj)
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_setTexture'", nullptr);
        return 0;
    }
#endif
    argc = lua_gettop(tolua_S)-1;
    do{
        if (argc == 1) {
            cocos2d::Texture2D* arg0;
            ok &= luaval_to_object<cocos2d::Texture2D>(tolua_S, 2, "cc.Texture2D",&arg0);

            if (!ok) { break; }
            cobj->setTexture(arg0);
            return 0;
        }
    }while(0);
    ok  = true;
    do{
        if (argc == 1) {
            std::string arg0;
            ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.Mesh:setTexture");

            if (!ok) { break; }
            cobj->setTexture(arg0);
            return 0;
        }
    }while(0);
    ok  = true;
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n",  "cc.Mesh:setTexture",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_setTexture'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_getMeshIndexData(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_getMeshIndexData'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        cocos2d::MeshIndexData* ret = cobj->getMeshIndexData();
        object_to_luaval<cocos2d::MeshIndexData>(tolua_S, "cc.MeshIndexData",(cocos2d::MeshIndexData*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:getMeshIndexData",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_getMeshIndexData'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_getTexture(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_getTexture'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        cocos2d::Texture2D* ret = cobj->getTexture();
        object_to_luaval<cocos2d::Texture2D>(tolua_S, "cc.Texture2D",(cocos2d::Texture2D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:getTexture",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_getTexture'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_getSkin(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_getSkin'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        cocos2d::MeshSkin* ret = cobj->getSkin();
        object_to_luaval<cocos2d::MeshSkin>(tolua_S, "cc.MeshSkin",(cocos2d::MeshSkin*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:getSkin",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_getSkin'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_getName(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_getName'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        const std::string& ret = cobj->getName();
        tolua_pushcppstring(tolua_S,ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:getName",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_getName'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_setBlendFunc(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_setBlendFunc'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        cocos2d::BlendFunc arg0;

        #pragma warning NO CONVERSION TO NATIVE FOR BlendFunc
		ok = false;
        if(!ok)
            return 0;
        cobj->setBlendFunc(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:setBlendFunc",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_setBlendFunc'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_getIndexFormat(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_getIndexFormat'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        unsigned int ret = cobj->getIndexFormat();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:getIndexFormat",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_getIndexFormat'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_getVertexSizeInBytes(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_getVertexSizeInBytes'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        int ret = cobj->getVertexSizeInBytes();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:getVertexSizeInBytes",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_getVertexSizeInBytes'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_getBlendFunc(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_getBlendFunc'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        const cocos2d::BlendFunc& ret = cobj->getBlendFunc();
        blendfunc_to_luaval(tolua_S, ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:getBlendFunc",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_getBlendFunc'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_getGLProgramState(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_getGLProgramState'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        cocos2d::GLProgramState* ret = cobj->getGLProgramState();
        object_to_luaval<cocos2d::GLProgramState>(tolua_S, "cc.GLProgramState",(cocos2d::GLProgramState*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:getGLProgramState",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_getGLProgramState'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_getIndexCount(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_getIndexCount'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        ssize_t ret = cobj->getIndexCount();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:getIndexCount",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_getIndexCount'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_getVertexBuffer(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_getVertexBuffer'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        unsigned int ret = cobj->getVertexBuffer();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:getVertexBuffer",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_getVertexBuffer'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_getMeshVertexAttribute(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_getMeshVertexAttribute'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        int arg0;

        ok &= luaval_to_int32(tolua_S, 2,(int *)&arg0, "cc.Mesh:getMeshVertexAttribute");
        if(!ok)
            return 0;
        const cocos2d::MeshVertexAttrib& ret = cobj->getMeshVertexAttribute(arg0);
        mesh_vertex_attrib_to_luaval(tolua_S, ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:getMeshVertexAttribute",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_getMeshVertexAttribute'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_isVisible(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_isVisible'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        bool ret = cobj->isVisible();
        tolua_pushboolean(tolua_S,(bool)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:isVisible",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_isVisible'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_getIndexBuffer(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_getIndexBuffer'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        unsigned int ret = cobj->getIndexBuffer();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:getIndexBuffer",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_getIndexBuffer'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_hasVertexAttrib(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_hasVertexAttrib'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        int arg0;

        ok &= luaval_to_int32(tolua_S, 2,(int *)&arg0, "cc.Mesh:hasVertexAttrib");
        if(!ok)
            return 0;
        bool ret = cobj->hasVertexAttrib(arg0);
        tolua_pushboolean(tolua_S,(bool)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:hasVertexAttrib",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_hasVertexAttrib'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_getPrimitiveType(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_getPrimitiveType'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        unsigned int ret = cobj->getPrimitiveType();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:getPrimitiveType",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_getPrimitiveType'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Mesh_setVisible(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Mesh* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Mesh",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Mesh*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Mesh_setVisible'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        bool arg0;

        ok &= luaval_to_boolean(tolua_S, 2,&arg0, "cc.Mesh:setVisible");
        if(!ok)
            return 0;
        cobj->setVisible(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Mesh:setVisible",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Mesh_setVisible'.",&tolua_err);
#endif

    return 0;
}
static int lua_cocos2dx_3d_Mesh_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (Mesh)");
    return 0;
}

int lua_register_cocos2dx_3d_Mesh(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.Mesh");
    tolua_cclass(tolua_S,"Mesh","cc.Mesh","cc.Ref",nullptr);

    tolua_beginmodule(tolua_S,"Mesh");
        tolua_function(tolua_S,"getMeshVertexAttribCount",lua_cocos2dx_3d_Mesh_getMeshVertexAttribCount);
        tolua_function(tolua_S,"setTexture",lua_cocos2dx_3d_Mesh_setTexture);
        tolua_function(tolua_S,"getMeshIndexData",lua_cocos2dx_3d_Mesh_getMeshIndexData);
        tolua_function(tolua_S,"getTexture",lua_cocos2dx_3d_Mesh_getTexture);
        tolua_function(tolua_S,"getSkin",lua_cocos2dx_3d_Mesh_getSkin);
        tolua_function(tolua_S,"getName",lua_cocos2dx_3d_Mesh_getName);
        tolua_function(tolua_S,"setBlendFunc",lua_cocos2dx_3d_Mesh_setBlendFunc);
        tolua_function(tolua_S,"getIndexFormat",lua_cocos2dx_3d_Mesh_getIndexFormat);
        tolua_function(tolua_S,"getVertexSizeInBytes",lua_cocos2dx_3d_Mesh_getVertexSizeInBytes);
        tolua_function(tolua_S,"getBlendFunc",lua_cocos2dx_3d_Mesh_getBlendFunc);
        tolua_function(tolua_S,"getGLProgramState",lua_cocos2dx_3d_Mesh_getGLProgramState);
        tolua_function(tolua_S,"getIndexCount",lua_cocos2dx_3d_Mesh_getIndexCount);
        tolua_function(tolua_S,"getVertexBuffer",lua_cocos2dx_3d_Mesh_getVertexBuffer);
        tolua_function(tolua_S,"getMeshVertexAttribute",lua_cocos2dx_3d_Mesh_getMeshVertexAttribute);
        tolua_function(tolua_S,"isVisible",lua_cocos2dx_3d_Mesh_isVisible);
        tolua_function(tolua_S,"getIndexBuffer",lua_cocos2dx_3d_Mesh_getIndexBuffer);
        tolua_function(tolua_S,"hasVertexAttrib",lua_cocos2dx_3d_Mesh_hasVertexAttrib);
        tolua_function(tolua_S,"getPrimitiveType",lua_cocos2dx_3d_Mesh_getPrimitiveType);
        tolua_function(tolua_S,"setVisible",lua_cocos2dx_3d_Mesh_setVisible);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::Mesh).name();
    g_luaType[typeName] = "cc.Mesh";
    g_typeCast["Mesh"] = "cc.Mesh";
    return 1;
}

int lua_cocos2dx_3d_Animation3D_getDuration(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Animation3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Animation3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Animation3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Animation3D_getDuration'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        double ret = cobj->getDuration();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Animation3D:getDuration",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Animation3D_getDuration'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Animation3D_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.Animation3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 1)
    {
        std::string arg0;
        ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.Animation3D:create");
        if(!ok)
            return 0;
        cocos2d::Animation3D* ret = cocos2d::Animation3D::create(arg0);
        object_to_luaval<cocos2d::Animation3D>(tolua_S, "cc.Animation3D",(cocos2d::Animation3D*)ret);
        return 1;
    }
    if (argc == 2)
    {
        std::string arg0;
        std::string arg1;
        ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.Animation3D:create");
        ok &= luaval_to_std_string(tolua_S, 3,&arg1, "cc.Animation3D:create");
        if(!ok)
            return 0;
        cocos2d::Animation3D* ret = cocos2d::Animation3D::create(arg0, arg1);
        object_to_luaval<cocos2d::Animation3D>(tolua_S, "cc.Animation3D",(cocos2d::Animation3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "cc.Animation3D:create",argc, 1);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Animation3D_create'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_3d_Animation3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (Animation3D)");
    return 0;
}

int lua_register_cocos2dx_3d_Animation3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.Animation3D");
    tolua_cclass(tolua_S,"Animation3D","cc.Animation3D","cc.Ref",nullptr);

    tolua_beginmodule(tolua_S,"Animation3D");
        tolua_function(tolua_S,"getDuration",lua_cocos2dx_3d_Animation3D_getDuration);
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_Animation3D_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::Animation3D).name();
    g_luaType[typeName] = "cc.Animation3D";
    g_typeCast["Animation3D"] = "cc.Animation3D";
    return 1;
}

int lua_cocos2dx_3d_Animate3D_setSpeed(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Animate3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Animate3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Animate3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Animate3D_setSpeed'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        double arg0;

        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.Animate3D:setSpeed");
        if(!ok)
            return 0;
        cobj->setSpeed(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Animate3D:setSpeed",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Animate3D_setSpeed'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Animate3D_setWeight(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Animate3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Animate3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Animate3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Animate3D_setWeight'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        double arg0;

        ok &= luaval_to_number(tolua_S, 2,&arg0, "cc.Animate3D:setWeight");
        if(!ok)
            return 0;
        cobj->setWeight(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Animate3D:setWeight",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Animate3D_setWeight'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Animate3D_getSpeed(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Animate3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Animate3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Animate3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Animate3D_getSpeed'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        double ret = cobj->getSpeed();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Animate3D:getSpeed",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Animate3D_getSpeed'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Animate3D_getWeight(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::Animate3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.Animate3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::Animate3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_Animate3D_getWeight'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        double ret = cobj->getWeight();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.Animate3D:getWeight",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Animate3D_getWeight'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_Animate3D_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;
#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.Animate3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S)-1;

    do 
    {
        if (argc == 3)
        {
            cocos2d::Animation3D* arg0;
            ok &= luaval_to_object<cocos2d::Animation3D>(tolua_S, 2, "cc.Animation3D",&arg0);
            if (!ok) { break; }
            double arg1;
            ok &= luaval_to_number(tolua_S, 3,&arg1, "cc.Animate3D:create");
            if (!ok) { break; }
            double arg2;
            ok &= luaval_to_number(tolua_S, 4,&arg2, "cc.Animate3D:create");
            if (!ok) { break; }
            cocos2d::Animate3D* ret = cocos2d::Animate3D::create(arg0, arg1, arg2);
            object_to_luaval<cocos2d::Animate3D>(tolua_S, "cc.Animate3D",(cocos2d::Animate3D*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    do 
    {
        if (argc == 1)
        {
            cocos2d::Animation3D* arg0;
            ok &= luaval_to_object<cocos2d::Animation3D>(tolua_S, 2, "cc.Animation3D",&arg0);
            if (!ok) { break; }
            cocos2d::Animate3D* ret = cocos2d::Animate3D::create(arg0);
            object_to_luaval<cocos2d::Animate3D>(tolua_S, "cc.Animate3D",(cocos2d::Animate3D*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    CCLOG("%s has wrong number of arguments: %d, was expecting %d", "cc.Animate3D:create",argc, 1);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Animate3D_create'.",&tolua_err);
#endif
    return 0;
}
int lua_cocos2dx_3d_Animate3D_getTransitionTime(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.Animate3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 0)
    {
        if(!ok)
            return 0;
        double ret = cocos2d::Animate3D::getTransitionTime();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "cc.Animate3D:getTransitionTime",argc, 0);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_Animate3D_getTransitionTime'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_3d_Animate3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (Animate3D)");
    return 0;
}

int lua_register_cocos2dx_3d_Animate3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.Animate3D");
    tolua_cclass(tolua_S,"Animate3D","cc.Animate3D","cc.ActionInterval",nullptr);

    tolua_beginmodule(tolua_S,"Animate3D");
        tolua_function(tolua_S,"setSpeed",lua_cocos2dx_3d_Animate3D_setSpeed);
        tolua_function(tolua_S,"setWeight",lua_cocos2dx_3d_Animate3D_setWeight);
        tolua_function(tolua_S,"getSpeed",lua_cocos2dx_3d_Animate3D_getSpeed);
        tolua_function(tolua_S,"getWeight",lua_cocos2dx_3d_Animate3D_getWeight);
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_Animate3D_create);
        tolua_function(tolua_S,"getTransitionTime", lua_cocos2dx_3d_Animate3D_getTransitionTime);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::Animate3D).name();
    g_luaType[typeName] = "cc.Animate3D";
    g_typeCast["Animate3D"] = "cc.Animate3D";
    return 1;
}

int lua_cocos2dx_3d_AttachNode_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.AttachNode",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 1)
    {
        cocos2d::Bone3D* arg0;
        ok &= luaval_to_object<cocos2d::Bone3D>(tolua_S, 2, "cc.Bone3D",&arg0);
        if(!ok)
            return 0;
        cocos2d::AttachNode* ret = cocos2d::AttachNode::create(arg0);
        object_to_luaval<cocos2d::AttachNode>(tolua_S, "cc.AttachNode",(cocos2d::AttachNode*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "cc.AttachNode:create",argc, 1);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_AttachNode_create'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_3d_AttachNode_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (AttachNode)");
    return 0;
}

int lua_register_cocos2dx_3d_AttachNode(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.AttachNode");
    tolua_cclass(tolua_S,"AttachNode","cc.AttachNode","cc.Node",nullptr);

    tolua_beginmodule(tolua_S,"AttachNode");
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_AttachNode_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::AttachNode).name();
    g_luaType[typeName] = "cc.AttachNode";
    g_typeCast["AttachNode"] = "cc.AttachNode";
    return 1;
}

int lua_cocos2dx_3d_BillBoard_getMode(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::BillBoard* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.BillBoard",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::BillBoard*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_BillBoard_getMode'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        int ret = (int)cobj->getMode();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.BillBoard:getMode",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_BillBoard_getMode'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_BillBoard_setMode(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::BillBoard* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.BillBoard",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::BillBoard*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_3d_BillBoard_setMode'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        cocos2d::BillBoard::Mode arg0;

        ok &= luaval_to_int32(tolua_S, 2,(int *)&arg0, "cc.BillBoard:setMode");
        if(!ok)
            return 0;
        cobj->setMode(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "cc.BillBoard:setMode",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_BillBoard_setMode'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_3d_BillBoard_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;
#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.BillBoard",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S)-1;

    do 
    {
        if (argc == 1)
        {
            std::string arg0;
            ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.BillBoard:create");
            if (!ok) { break; }
            cocos2d::BillBoard* ret = cocos2d::BillBoard::create(arg0);
            object_to_luaval<cocos2d::BillBoard>(tolua_S, "cc.BillBoard",(cocos2d::BillBoard*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    do 
    {
        if (argc == 2)
        {
            std::string arg0;
            ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.BillBoard:create");
            if (!ok) { break; }
            cocos2d::BillBoard::Mode arg1;
            ok &= luaval_to_int32(tolua_S, 3,(int *)&arg1, "cc.BillBoard:create");
            if (!ok) { break; }
            cocos2d::BillBoard* ret = cocos2d::BillBoard::create(arg0, arg1);
            object_to_luaval<cocos2d::BillBoard>(tolua_S, "cc.BillBoard",(cocos2d::BillBoard*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    do 
    {
        if (argc == 0)
        {
            cocos2d::BillBoard* ret = cocos2d::BillBoard::create();
            object_to_luaval<cocos2d::BillBoard>(tolua_S, "cc.BillBoard",(cocos2d::BillBoard*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    do 
    {
        if (argc == 1)
        {
            cocos2d::BillBoard::Mode arg0;
            ok &= luaval_to_int32(tolua_S, 2,(int *)&arg0, "cc.BillBoard:create");
            if (!ok) { break; }
            cocos2d::BillBoard* ret = cocos2d::BillBoard::create(arg0);
            object_to_luaval<cocos2d::BillBoard>(tolua_S, "cc.BillBoard",(cocos2d::BillBoard*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    do 
    {
        if (argc == 2)
        {
            std::string arg0;
            ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.BillBoard:create");
            if (!ok) { break; }
            cocos2d::Rect arg1;
            ok &= luaval_to_rect(tolua_S, 3, &arg1, "cc.BillBoard:create");
            if (!ok) { break; }
            cocos2d::BillBoard* ret = cocos2d::BillBoard::create(arg0, arg1);
            object_to_luaval<cocos2d::BillBoard>(tolua_S, "cc.BillBoard",(cocos2d::BillBoard*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    do 
    {
        if (argc == 3)
        {
            std::string arg0;
            ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.BillBoard:create");
            if (!ok) { break; }
            cocos2d::Rect arg1;
            ok &= luaval_to_rect(tolua_S, 3, &arg1, "cc.BillBoard:create");
            if (!ok) { break; }
            cocos2d::BillBoard::Mode arg2;
            ok &= luaval_to_int32(tolua_S, 4,(int *)&arg2, "cc.BillBoard:create");
            if (!ok) { break; }
            cocos2d::BillBoard* ret = cocos2d::BillBoard::create(arg0, arg1, arg2);
            object_to_luaval<cocos2d::BillBoard>(tolua_S, "cc.BillBoard",(cocos2d::BillBoard*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    CCLOG("%s has wrong number of arguments: %d, was expecting %d", "cc.BillBoard:create",argc, 2);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_BillBoard_create'.",&tolua_err);
#endif
    return 0;
}
int lua_cocos2dx_3d_BillBoard_createWithTexture(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"cc.BillBoard",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 1)
    {
        cocos2d::Texture2D* arg0;
        ok &= luaval_to_object<cocos2d::Texture2D>(tolua_S, 2, "cc.Texture2D",&arg0);
        if(!ok)
            return 0;
        cocos2d::BillBoard* ret = cocos2d::BillBoard::createWithTexture(arg0);
        object_to_luaval<cocos2d::BillBoard>(tolua_S, "cc.BillBoard",(cocos2d::BillBoard*)ret);
        return 1;
    }
    if (argc == 2)
    {
        cocos2d::Texture2D* arg0;
        cocos2d::BillBoard::Mode arg1;
        ok &= luaval_to_object<cocos2d::Texture2D>(tolua_S, 2, "cc.Texture2D",&arg0);
        ok &= luaval_to_int32(tolua_S, 3,(int *)&arg1, "cc.BillBoard:createWithTexture");
        if(!ok)
            return 0;
        cocos2d::BillBoard* ret = cocos2d::BillBoard::createWithTexture(arg0, arg1);
        object_to_luaval<cocos2d::BillBoard>(tolua_S, "cc.BillBoard",(cocos2d::BillBoard*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "cc.BillBoard:createWithTexture",argc, 1);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_3d_BillBoard_createWithTexture'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_3d_BillBoard_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (BillBoard)");
    return 0;
}

int lua_register_cocos2dx_3d_BillBoard(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.BillBoard");
    tolua_cclass(tolua_S,"BillBoard","cc.BillBoard","cc.Sprite",nullptr);

    tolua_beginmodule(tolua_S,"BillBoard");
        tolua_function(tolua_S,"getMode",lua_cocos2dx_3d_BillBoard_getMode);
        tolua_function(tolua_S,"setMode",lua_cocos2dx_3d_BillBoard_setMode);
        tolua_function(tolua_S,"create", lua_cocos2dx_3d_BillBoard_create);
        tolua_function(tolua_S,"createWithTexture", lua_cocos2dx_3d_BillBoard_createWithTexture);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::BillBoard).name();
    g_luaType[typeName] = "cc.BillBoard";
    g_typeCast["BillBoard"] = "cc.BillBoard";
    return 1;
}
TOLUA_API int register_all_cocos2dx_3d(lua_State* tolua_S)
{
	tolua_open(tolua_S);
	
	tolua_module(tolua_S,"cc",0);
	tolua_beginmodule(tolua_S,"cc");

	lua_register_cocos2dx_3d_Sprite3D(tolua_S);
	lua_register_cocos2dx_3d_BillBoard(tolua_S);
	lua_register_cocos2dx_3d_Mesh(tolua_S);
	lua_register_cocos2dx_3d_Bone3D(tolua_S);
	lua_register_cocos2dx_3d_Animate3D(tolua_S);
	lua_register_cocos2dx_3d_AttachNode(tolua_S);
	lua_register_cocos2dx_3d_JumpTiles3D(tolua_S);
	lua_register_cocos2dx_3d_Skeleton3D(tolua_S);
	lua_register_cocos2dx_3d_TiledGrid3D(tolua_S);
	lua_register_cocos2dx_3d_Ripple3D(tolua_S);
	lua_register_cocos2dx_3d_ShakyTiles3D(tolua_S);
	lua_register_cocos2dx_3d_Lens3D(tolua_S);
	lua_register_cocos2dx_3d_FlipX3D(tolua_S);
	lua_register_cocos2dx_3d_FlipY3D(tolua_S);
	lua_register_cocos2dx_3d_Animation3D(tolua_S);
	lua_register_cocos2dx_3d_PageTurn3D(tolua_S);
	lua_register_cocos2dx_3d_Shaky3D(tolua_S);
	lua_register_cocos2dx_3d_Grid3D(tolua_S);
	lua_register_cocos2dx_3d_Waves3D(tolua_S);
	lua_register_cocos2dx_3d_WavesTiles3D(tolua_S);
	lua_register_cocos2dx_3d_ShatteredTiles3D(tolua_S);

	tolua_endmodule(tolua_S);
	return 1;
}

