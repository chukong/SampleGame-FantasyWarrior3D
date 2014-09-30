#ifndef __Billboard_PARTICLE_SYSTEM_H__
#define __Billboard_PARTICLE_SYSTEM_H__


#include "cocos2d.h"
#include <string>

NS_CC_BEGIN

USING_NS_CC;

class CC_DLL BillboardParticleSystem : public ParticleSystemQuad
{
public:
    static BillboardParticleSystem * create(const std::string& filename);
    BillboardParticleSystem();
    ~BillboardParticleSystem();
    void setCamera(Camera* camera);
protected:
        /**
     * @js NA
     * @lua NA
     */
    virtual void updateQuadWithParticle(tParticle* particle, const Vec2& newPosition) override; 
    virtual void update(float dt) override;
private:
    Mat4 _billboardTransform;
    Mat4 _camWorldMat;
    float _zDepthInView;
    Mat4 _transform;
    Camera* _camera;
    Vec3     _cameraRight; // camera right dir
    Vec3     _cameraUp;    // camera up dir

};

NS_CC_END

#endif // __HELLOWORLD_SCENE_H__
