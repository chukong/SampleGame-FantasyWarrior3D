
--------------------------------
-- @module TiledGrid3D
-- @extend GridBase
-- @parent_module cc

--------------------------------
--  returns the original tile (untransformed) at the given position <br>
-- js NA<br>
-- lua NA
-- @function [parent=#TiledGrid3D] getOriginalTile 
-- @param self
-- @param #vec2_table pos
-- @return Quad3#Quad3 ret (return value: cc.Quad3)
        
--------------------------------
--  returns the tile at the given position <br>
-- js NA<br>
-- lua NA
-- @function [parent=#TiledGrid3D] getTile 
-- @param self
-- @param #vec2_table pos
-- @return Quad3#Quad3 ret (return value: cc.Quad3)
        
--------------------------------
--  sets a new tile <br>
-- js NA<br>
-- lua NA
-- @function [parent=#TiledGrid3D] setTile 
-- @param self
-- @param #vec2_table pos
-- @param #cc.Quad3 coords
        
--------------------------------
-- @overload self, size_table         
-- @overload self, size_table, cc.Texture2D, bool         
-- @function [parent=#TiledGrid3D] create
-- @param self
-- @param #size_table gridSize
-- @param #cc.Texture2D texture
-- @param #bool flipped
-- @return TiledGrid3D#TiledGrid3D ret (retunr value: cc.TiledGrid3D)

--------------------------------
-- 
-- @function [parent=#TiledGrid3D] calculateVertexPoints 
-- @param self
        
--------------------------------
-- 
-- @function [parent=#TiledGrid3D] blit 
-- @param self
        
--------------------------------
-- 
-- @function [parent=#TiledGrid3D] reuse 
-- @param self
        
--------------------------------
-- js ctor
-- @function [parent=#TiledGrid3D] TiledGrid3D 
-- @param self
        
return nil
