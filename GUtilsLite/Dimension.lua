-- Dimension

--- A Dimension object. An 1D value with both a relative scale and pixel offset.<br>
--- Mainly for GUI/HUD elements.
---@class Dimension
---@field Offset number
---@field Scale number
local Dimension={}
Dimension.__index=Dimension
Dimension.__type="Dimension"

--- Creates a new Dimension.
---@param offset number
---@param scale number
---@return Dimension
function Dimension.new(offset,scale)
    local self={}

    self.Offset=offset
    self.Scale=scale

    return setmetatable(self,Dimension)
end

--- Creates an empty Dimension.
---@return Dimension
function Dimension.zero()
    return Dimension.new(0,0)
end

--- Creates a new Dimension with only the offset.
---@param offset number
---@return Dimension
function Dimension.fromOffset(offset)
    return Dimension.new(offset,0)
end

--- Creates a new Dimension with only the scale.
---@param scale number
---@return Dimension
function Dimension.fromScale(scale)
    return Dimension.new(0,scale)
end

--- Gets the Dimension's offset.
---@param self Dimension
---@return number
Dimension.GetOffset=function(self)
    return self.Offset
end

--- Gets the Dimension's scale.
---@param self Dimension
---@return number
Dimension.GetScale=function(self)
    return self.Scale
end

--- Turns a Dimension into a scale vector.
---@param self Dimension
---@param size number The total offset size.
---@return number
Dimension.ToScale=function(self,size)
    return self.Scale+(self.Offset/size)
end

--- Turns a Dimension into an offset vector.
---@param self Dimension
---@param size number The total offset size.
---@return number
Dimension.ToOffset=function(self,size)
    return self.Offset+(self.Scale*size)
end

---@param self Dimension
---@param other Dimension
---@return Dimension
Dimension.__add=function(self,other)
    local off=self:GetOffset()+other:GetOffset()
    local scale=self:GetScale()+other:GetScale()
    return Dimension.new(off,scale)
end

---@param self Dimension
---@param other Dimension
---@return Dimension
Dimension.__sub=function(self,other)
    local off=self:GetOffset()-other:GetOffset()
    local scale=self:GetScale()-other:GetScale()
    return Dimension.new(off,scale)
end

_G.Dimension=Dimension

return Dimension