//
//  water.cpp
//  watertest
//
//  Created by WuHao on 14/10/11.
//
//

#include "Water.h"

Water *Water::create(const std::string& tex1,const std::string& tex2,const std::string& tex3, const cocos2d::Size& size, float hSpeed, float vSpeed, float saturation)
{
    Water *water = new (std::nothrow) Water();
    if (water && water->initWithFile(tex1, cocos2d::Rect(0,0, size.width,size.height)))
    {
        water->autorelease();
        
        auto TexCache = cocos2d::Director::getInstance()->getTextureCache();
        auto wave2 = TexCache->addImage(tex2);
        auto wave1 = TexCache->addImage(tex3);
        
        cocos2d::Texture2D::TexParams wave1TexParams = {GL_LINEAR, GL_LINEAR, GL_REPEAT, GL_REPEAT};
        cocos2d::Texture2D::TexParams wave2TexParams = {GL_LINEAR, GL_LINEAR, GL_REPEAT, GL_REPEAT};
        wave1->setTexParameters(wave1TexParams);
        wave2->setTexParameters(wave2TexParams);
        auto glprogram = cocos2d::GLProgram::createWithFilenames("res/shader3D/water.vsh", "res/shader3D/water.fsh");
        auto glprogramstate = cocos2d::GLProgramState::getOrCreateWithGLProgram(glprogram);
        water->setGLProgramState(glprogramstate);
        
        glprogramstate->setUniformTexture("u_wave1", wave1);
        glprogramstate->setUniformTexture("u_wave2", wave2);
        glprogramstate->setUniformFloat("saturateValue", saturation);
        glprogramstate->setUniformFloat("verticalSpeed", vSpeed);
        glprogramstate->setUniformFloat("horizontalSpeed", hSpeed);
        
        
        return water;
    }
    CC_SAFE_DELETE(water);
    return nullptr;
}

//void Water::draw(cocos2d::Renderer *renderer, const cocos2d::Mat4 &transform, uint32_t flags)
//{
//    _beforeDraw.init(_globalZOrder);
//    _beforeDraw.func =  CC_CALLBACK_0(Water::onBeforeDraw, this);
//    renderer->addCommand(&_beforeDraw);
//    Sprite::draw(renderer, transform, flags);
//    _afterDraw.init(_globalZOrder);
//    _afterDraw.func =  CC_CALLBACK_0(Water::onAfterDraw, this);
//    renderer->addCommand(&_afterDraw);
//}
//
//void Water::onBeforeDraw()
//{
//    //glEnable(GL_DEPTH_TEST);
//    glDepthMask(GL_FALSE);
//    //bool a; = glGetBooleanv(GL_DEPTH_WRITEMASK, &a);
//}
//void Water::onAfterDraw()
//{
//    //glDisable(GL_DEPTH_TEST);
//    glDepthMask(GL_TRUE);
//    //bool a; = glGetBooleanv(GL_DEPTH_WRITEMASK, &a);
//}

