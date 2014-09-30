require "Cocos2d"

CC_CONTENT_SCALE_FACTOR = function()
    return cc.Director:getInstance():getContentScaleFactor()
end


CC_POINT_PIXELS_TO_POINTS = function(pixels)
    return cc.p(pixels.x/CC_CONTENT_SCALE_FACTOR(), pixels.y/CC_CONTENT_SCALE_FACTOR())
end

CC_POINT_POINTS_TO_PIXELS = function(points)
    return cc.p(points.x*CC_CONTENT_SCALE_FACTOR(), points.y*CC_CONTENT_SCALE_FACTOR())
end

--print table
function printTab(tab)
  for i,v in pairs(tab) do
    if type(v) == "table" then
      print("table",i,"{")
      printTab(v)
      print("}")
    else
     print(v)
    end
  end
end

-- cclog
cclog = function(...)
    print(string.format(...))
end

-- change table to enum type
function CreateEnumTable(tbl, index)
    local enumTable = {}
    local enumIndex = index or -1
    for i, v in ipairs(tbl) do
        enumTable[v] = enumIndex + i
    end
    return enumTable
end

function removeAll(table)
    while true do
        local k =next(table)
        if not k then break end
        table[k] = nil
    end
end

List = {}
function List.new()
	return {first = 0, last = -1}
end

function List.pushfirst(list, value)
	local first = list.first - 1
	list.first = first
	list[first] = value
end

function List.pushlast(list, value)
	local last = list.last + 1
	list.last = last
	list[last] = value
end

function List.popfirst(list)
	local first = list.first
	if first > list.last then error("list is empty") end
	local value = list[first]
	list[first] = nil
	list.first = first + 1
	return value
end

function List.poplast(list)
	local last = list.last
	if list.first > last then error("list is empty") end
	local value = list[last]
	list[last] = nil
	list.last = last - 1
	return value	
end

function List.removeAll(list)
    removeAll(list)
    list.first = 0
    list.last = -1
end

function List.getSize(list)
    return list.last + 1
end

function List.first(list)
    local value = nil
    if list.first <= list.last then
        value = list[first]
    end
    
    return value
end