#include "BillboardParticleSystem.h"
USING_NS_CC;
BillboardParticleSystem * BillboardParticleSystem::create(const std::string& filename)
{
    BillboardParticleSystem *ret = new (std::nothrow) BillboardParticleSystem();
    if (ret && ret->initWithFile(filename))
    {
        ret->autorelease();
        return ret;
    }
    CC_SAFE_DELETE(ret);
    return ret;
}
BillboardParticleSystem::BillboardParticleSystem():
 _camera(nullptr),
 _cameraUp(0,1,0),
 _cameraRight(1,0,0)
{

}
BillboardParticleSystem::~BillboardParticleSystem()
{

}

void BillboardParticleSystem::updateQuadWithParticle(tParticle* particle, const Vec2& newPosition)
{
    V3F_C4B_T2F_Quad *quad;
    if (_batchNode)
    {
        V3F_C4B_T2F_Quad *batchQuads = _batchNode->getTextureAtlas()->getQuads();
        quad = &(batchQuads[_atlasIndex+particle->atlasIndex]);
    }
    else
    {
        quad = &(_quads[_particleIdx]);
    }
    Color4B color = (_opacityModifyRGB)
        ? Color4B( particle->color.r*particle->color.a*255, particle->color.g*particle->color.a*255, particle->color.b*particle->color.a*255, particle->color.a*255)
        : Color4B( particle->color.r*255, particle->color.g*255, particle->color.b*255, particle->color.a*255);

    quad->bl.colors = color;
    quad->br.colors = color;
    quad->tl.colors = color;
    quad->tr.colors = color;

    // vertices
    //GLfloat size_2 = particle->size/2;
    //if (particle->rotation) 
    //{
    //    GLfloat x1 = -size_2;
    //    GLfloat y1 = -size_2;

    //    GLfloat x2 = size_2;
    //    GLfloat y2 = size_2;
    //    GLfloat x = newPosition.x;
    //    GLfloat y = newPosition.y;

    //    GLfloat r = (GLfloat)-CC_DEGREES_TO_RADIANS(particle->rotation);
    //    GLfloat cr = cosf(r);
    //    GLfloat sr = sinf(r);
    //    GLfloat ax = x1 * cr - y1 * sr + x;
    //    GLfloat ay = x1 * sr + y1 * cr + y;
    //    GLfloat bx = x2 * cr - y1 * sr + x;
    //    GLfloat by = x2 * sr + y1 * cr + y;
    //    GLfloat cx = x2 * cr - y2 * sr + x;
    //    GLfloat cy = x2 * sr + y2 * cr + y;
    //    GLfloat dx = x1 * cr - y2 * sr + x;
    //    GLfloat dy = x1 * sr + y2 * cr + y;

    //    // bottom-left
    //    quad->bl.vertices.x = ax;
    //    quad->bl.vertices.y = ay;

    //    // bottom-right vertex:
    //    quad->br.vertices.x = bx;
    //    quad->br.vertices.y = by;

    //    // top-left vertex:
    //    quad->tl.vertices.x = dx;
    //    quad->tl.vertices.y = dy;

    //    // top-right vertex:
    //    quad->tr.vertices.x = cx;
    //    quad->tr.vertices.y = cy;
    //} 
    //else 
    //{
    //    // bottom-left vertex:
    //    quad->bl.vertices.x = newPosition.x - size_2;
    //    quad->bl.vertices.y = newPosition.y - size_2;

    //    // bottom-right vertex:
    //    quad->br.vertices.x = newPosition.x + size_2;
    //    quad->br.vertices.y = newPosition.y - size_2;

    //    // top-left vertex:
    //    quad->tl.vertices.x = newPosition.x - size_2;
    //    quad->tl.vertices.y = newPosition.y + size_2;

    //    // top-right vertex:
    //    quad->tr.vertices.x = newPosition.x + size_2;
    //    quad->tr.vertices.y = newPosition.y + size_2;                
    //}
    Vec3  billboardX = _cameraRight.getNormalized();
    Vec3  billboardY = _cameraUp.getNormalized();
    float fLeft   = -0.5f;
    float fRight  =  0.5f;
    float fTop    =  0.5f;
    float fBottom = -0.5f;
    Vec3  leftOff   = billboardX * particle->size * fLeft;
    Vec3  rightOff  = billboardX * particle->size * fRight;
    Vec3  topOff    = billboardY * particle->size * fTop;
    Vec3  bottomOff = billboardY * particle->size * fBottom;
    Vec3 vOffset[4];
    vOffset[0] = leftOff + bottomOff;
    vOffset[1] = rightOff + bottomOff;
    vOffset[2] = leftOff + topOff;
    vOffset[3] = rightOff + topOff;

    quad->bl.vertices.x = newPosition.x + vOffset[0].x;
    quad->bl.vertices.y = newPosition.y + vOffset[0].y;
    quad->bl.vertices.z = vOffset[0].z;

    // bottom-right vertex:
    quad->br.vertices.x = newPosition.x + vOffset[1].x;
    quad->br.vertices.y = newPosition.y + vOffset[1].y;
    quad->br.vertices.z = vOffset[1].z;

    // top-left vertex:
    quad->tl.vertices.x = newPosition.x + vOffset[2].x;
    quad->tl.vertices.y = newPosition.y + vOffset[2].y;
    quad->tl.vertices.z = vOffset[2].z;

    // top-right vertex:
    quad->tr.vertices.x = newPosition.x + vOffset[3].x;
    quad->tr.vertices.y = newPosition.y + vOffset[3].y; 
    quad->tr.vertices.z = vOffset[3].z;    
}
void BillboardParticleSystem::setCamera(Camera* camera)
{
    _camera = camera;
}
void BillboardParticleSystem::update(float dt)
{
    if(_camera)
    {
        const Mat4& cameraViewMatrix = _camera->getViewMatrix().getInversed();
        cameraViewMatrix.getRightVector(&_cameraRight);
        cameraViewMatrix.getUpVector(&_cameraUp);
    }
    ParticleSystemQuad::update(dt);
}
