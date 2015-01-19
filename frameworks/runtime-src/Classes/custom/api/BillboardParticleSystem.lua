
--------------------------------
-- @module BillboardParticleSystem
-- @extend Node,TextureProtocol
-- @parent_module cc

--------------------------------
--  size variance in pixels of each particle 
-- @function [parent=#BillboardParticleSystem] getStartSizeVar 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
--  start color of each particle 
-- @function [parent=#BillboardParticleSystem] getStartColor 
-- @param self
-- @return color4f_table#color4f_table ret (return value: color4f_table)
        
--------------------------------
--  particles movement type: Free or Grouped<br>
-- since v0.8
-- @function [parent=#BillboardParticleSystem] getPositionType 
-- @param self
-- @return int#int ret (return value: int)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setPosVar 
-- @param self
-- @param #vec2_table pos
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getEndSpin 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setRotatePerSecondVar 
-- @param self
-- @param #float degrees
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getStartSpinVar 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getRadialAccelVar 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
--  end size variance in pixels of each particle 
-- @function [parent=#BillboardParticleSystem] getEndSizeVar 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setRotation 
-- @param self
-- @param #float newRotation
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setTangentialAccel 
-- @param self
-- @param #float t
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setScaleY 
-- @param self
-- @param #float newScaleY
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setScaleX 
-- @param self
-- @param #float newScaleX
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getRadialAccel 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setStartRadius 
-- @param self
-- @param #float startRadius
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setRotatePerSecond 
-- @param self
-- @param #float degrees
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setEndSize 
-- @param self
-- @param #float endSize
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getGravity 
-- @param self
-- @return vec2_table#vec2_table ret (return value: vec2_table)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getTangentialAccel 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setEndRadius 
-- @param self
-- @param #float endRadius
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getSpeed 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
--  angle and angle variation of each particle 
-- @function [parent=#BillboardParticleSystem] getAngle 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setEndColor 
-- @param self
-- @param #color4f_table color
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setStartSpin 
-- @param self
-- @param #float spin
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setDuration 
-- @param self
-- @param #float duration
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setTexture 
-- @param self
-- @param #cc.Texture2D texture
        
--------------------------------
--  Position variance of the emitter 
-- @function [parent=#BillboardParticleSystem] getPosVar 
-- @param self
-- @return vec2_table#vec2_table ret (return value: vec2_table)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] isBlendAdditive 
-- @param self
-- @return bool#bool ret (return value: bool)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getSpeedVar 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setPositionType 
-- @param self
-- @param #int type
        
--------------------------------
--  stop emitting particles. Running particles will continue to run until they die
-- @function [parent=#BillboardParticleSystem] stopSystem 
-- @param self
        
--------------------------------
--  sourcePosition of the emitter 
-- @function [parent=#BillboardParticleSystem] getSourcePosition 
-- @param self
-- @return vec2_table#vec2_table ret (return value: vec2_table)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setLifeVar 
-- @param self
-- @param #float lifeVar
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setTotalParticles 
-- @param self
-- @param #int totalParticles
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setEndColorVar 
-- @param self
-- @param #color4f_table color
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getAtlasIndex 
-- @param self
-- @return int#int ret (return value: int)
        
--------------------------------
--  start size in pixels of each particle 
-- @function [parent=#BillboardParticleSystem] getStartSize 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setTextureWithRect 
-- @param self
-- @param #cc.Texture2D texture
-- @param #rect_table rect
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setStartSpinVar 
-- @param self
-- @param #float pinVar
        
--------------------------------
--  Kill all living particles.
-- @function [parent=#BillboardParticleSystem] resetSystem 
-- @param self
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setAtlasIndex 
-- @param self
-- @param #int index
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setTangentialAccelVar 
-- @param self
-- @param #float t
        
--------------------------------
--  How many seconds the emitter will run. -1 means 'forever' 
-- @function [parent=#BillboardParticleSystem] getDuration 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getEndRadius 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setDepthTestEnabled 
-- @param self
-- @param #bool enable
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setRadialAccelVar 
-- @param self
-- @param #float t
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setStartSize 
-- @param self
-- @param #float startSize
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setSpeed 
-- @param self
-- @param #float speed
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getStartSpin 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getRotatePerSecond 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setEmitterMode 
-- @param self
-- @param #int mode
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setEndRadiusVar 
-- @param self
-- @param #float endRadiusVar
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] isOpacityModifyRGB 
-- @param self
-- @return bool#bool ret (return value: bool)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setSourcePosition 
-- @param self
-- @param #vec2_table pos
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getEndSpinVar 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setBlendAdditive 
-- @param self
-- @param #bool value
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setLife 
-- @param self
-- @param #float life
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setAngleVar 
-- @param self
-- @param #float angleVar
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setRotationIsDir 
-- @param self
-- @param #bool t
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setEndSizeVar 
-- @param self
-- @param #float sizeVar
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setAngle 
-- @param self
-- @param #float angle
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getTangentialAccelVar 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
--  Switch between different kind of emitter modes:<br>
-- - kParticleModeGravity: uses gravity, speed, radial and tangential acceleration<br>
-- - kParticleModeRadius: uses radius movement + rotation
-- @function [parent=#BillboardParticleSystem] getEmitterMode 
-- @param self
-- @return int#int ret (return value: int)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setEndSpinVar 
-- @param self
-- @param #float endSpinVar
        
--------------------------------
--  angle variance of each particle 
-- @function [parent=#BillboardParticleSystem] getAngleVar 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setStartColor 
-- @param self
-- @param #color4f_table color
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getRotatePerSecondVar 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
--  end size in pixels of each particle 
-- @function [parent=#BillboardParticleSystem] getEndSize 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
--  life, and life variation of each particle 
-- @function [parent=#BillboardParticleSystem] getLife 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setSpeedVar 
-- @param self
-- @param #float speed
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setGravity 
-- @param self
-- @param #vec2_table g
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setEmissionRate 
-- @param self
-- @param #float rate
        
--------------------------------
--  end color variance of each particle 
-- @function [parent=#BillboardParticleSystem] getEndColorVar 
-- @param self
-- @return color4f_table#color4f_table ret (return value: color4f_table)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getRotationIsDir 
-- @param self
-- @return bool#bool ret (return value: bool)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setScale 
-- @param self
-- @param #float s
        
--------------------------------
--  emission rate of the particles 
-- @function [parent=#BillboardParticleSystem] getEmissionRate 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
--  end color and end color variation of each particle 
-- @function [parent=#BillboardParticleSystem] getEndColor 
-- @param self
-- @return color4f_table#color4f_table ret (return value: color4f_table)
        
--------------------------------
--  life variance of each particle 
-- @function [parent=#BillboardParticleSystem] getLifeVar 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setCamera 
-- @param self
-- @param #cc.Camera camera
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setStartSizeVar 
-- @param self
-- @param #float sizeVar
        
--------------------------------
--  does the alpha value modify color 
-- @function [parent=#BillboardParticleSystem] setOpacityModifyRGB 
-- @param self
-- @param #bool opacityModifyRGB
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getStartRadius 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
--  Quantity of particles that are being simulated at the moment 
-- @function [parent=#BillboardParticleSystem] getParticleCount 
-- @param self
-- @return unsigned int#unsigned int ret (return value: unsigned int)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getStartRadiusVar 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setStartColorVar 
-- @param self
-- @param #color4f_table color
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setEndSpin 
-- @param self
-- @param #float endSpin
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setRadialAccel 
-- @param self
-- @param #float t
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] setStartRadiusVar 
-- @param self
-- @param #float startRadiusVar
        
--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] getEndRadiusVar 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
--  start color variance of each particle 
-- @function [parent=#BillboardParticleSystem] getStartColorVar 
-- @param self
-- @return color4f_table#color4f_table ret (return value: color4f_table)
        
--------------------------------
-- @overload self, map_table         
-- @overload self, string         
-- @function [parent=#BillboardParticleSystem] create
-- @param self
-- @param #string filename
-- @return BillboardParticleSystem#BillboardParticleSystem ret (return value: cc.BillboardParticleSystem)

--------------------------------
-- 
-- @function [parent=#BillboardParticleSystem] BillboardParticleSystem 
-- @param self
        
return nil
