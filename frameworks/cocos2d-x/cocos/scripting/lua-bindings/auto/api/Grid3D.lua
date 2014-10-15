
--------------------------------
-- @module Grid3D
-- @extend GridBase
-- @parent_module cc

--------------------------------
--  sets a new vertex at a given position <br>
-- js NA<br>
-- lua NA
-- @function [parent=#Grid3D] setVertex 
-- @param self
-- @param #vec2_table pos
-- @param #vec3_table vertex
        
--------------------------------
--  returns the original (non-transformed) vertex at a given position<br>
-- js NA<br>
-- lua NA
-- @function [parent=#Grid3D] getOriginalVertex 
-- @param self
-- @param #vec2_table pos
-- @return vec3_table#vec3_table ret (return value: vec3_table)
        
--------------------------------
-- 
-- @function [parent=#Grid3D] getNeedDepthTestForBlit 
-- @param self
-- @return bool#bool ret (return value: bool)
        
--------------------------------
--  returns the vertex at a given position <br>
-- js NA<br>
-- lua NA
-- @function [parent=#Grid3D] getVertex 
-- @param self
-- @param #vec2_table pos
-- @return vec3_table#vec3_table ret (return value: vec3_table)
        
--------------------------------
-- 
-- @function [parent=#Grid3D] setNeedDepthTestForBlit 
-- @param self
-- @param #bool neededDepthTest
        
--------------------------------
-- @overload self, size_table         
-- @overload self, size_table, cc.Texture2D, bool         
-- @function [parent=#Grid3D] create
-- @param self
-- @param #size_table gridSize
-- @param #cc.Texture2D texture
-- @param #bool flipped
-- @return Grid3D#Grid3D ret (retunr value: cc.Grid3D)

--------------------------------
-- 
-- @function [parent=#Grid3D] calculateVertexPoints 
-- @param self
        
--------------------------------
-- 
-- @function [parent=#Grid3D] beforeBlit 
-- @param self
        
--------------------------------
-- 
-- @function [parent=#Grid3D] afterBlit 
-- @param self
        
--------------------------------
-- 
-- @function [parent=#Grid3D] reuse 
-- @param self
        
--------------------------------
-- 
-- @function [parent=#Grid3D] blit 
-- @param self
        
--------------------------------
-- js ctor
-- @function [parent=#Grid3D] Grid3D 
-- @param self
        
return nil
