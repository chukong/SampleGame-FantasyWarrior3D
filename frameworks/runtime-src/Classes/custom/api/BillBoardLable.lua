
--------------------------------
-- @module BillBoardLable
-- @extend Label
-- @parent_module cc

--------------------------------
--  Get the billboard rotation mode. 
-- @function [parent=#BillBoardLable] getMode 
-- @param self
-- @return int#int ret (return value: int)
        
--------------------------------
--  Set the billboard rotation mode. 
-- @function [parent=#BillBoardLable] setMode 
-- @param self
-- @param #int mode
        
--------------------------------
-- @overload self, cc._ttfConfig, string, int, int         
-- @overload self, string, string, float, size_table, int, int         
-- @function [parent=#BillBoardLable] createWithTTF
-- @param self
-- @param #string text
-- @param #string fontFile
-- @param #float fontSize
-- @param #size_table dimensions
-- @param #int hAlignment
-- @param #int vAlignment
-- @return Label#Label ret (return value: cc.Label)

return nil
