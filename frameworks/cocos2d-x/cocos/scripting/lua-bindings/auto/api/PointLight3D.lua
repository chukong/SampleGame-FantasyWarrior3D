
--------------------------------
-- @module PointLight3D
-- @extend BaseLight
-- @parent_module cc

--------------------------------
--  get or set range 
-- @function [parent=#PointLight3D] getRange 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- 
-- @function [parent=#PointLight3D] setRange 
-- @param self
-- @param #float range
        
--------------------------------
-- Creates a point light.<br>
-- param position The light's position<br>
-- param color The light's color.<br>
-- param range The light's range.<br>
-- return The new point light.
-- @function [parent=#PointLight3D] create 
-- @param self
-- @param #vec3_table position
-- @param #color3b_table color
-- @param #float range
-- @return point_table#point_table ret (return value: point_table)
        
--------------------------------
-- 
-- @function [parent=#PointLight3D] getLightType 
-- @param self
-- @return int#int ret (return value: int)
        
return nil
