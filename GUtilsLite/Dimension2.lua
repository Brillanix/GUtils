-- Dimension2

--- A Dimension2 object. A 2D value with two Dimension objects.<br>
--- Mainly for GUI/HUD elements.
---@class Dimension2:Dimensions
---@field X Dimension
---@field Y Dimension
local Dimension2={}
Dimension2.__index=Dimension2
Dimension2.__type="Dimension2"

--- Creates a new Dimension2 using an X and Y value.
---@param x Dimension
---@param y Dimension
---@return Dimension2
function Dimension2.new(x,y)
    local self={}

    self.X=x
    self.Y=y

    return setmetatable(self,Dimension2)
end

--- Creates a new Dimension2 using both an offset and scale vector.
---@param offset Vector2
---@param scale Vector2
function Dimension2.fromVectors(offset,scale)
    return Dimension2.new(Dimension.new(offset.x,scale.x),Dimension.new(offset.y,scale.y))
end

--- Creates an empty Dimension2.
---@return Dimension2
function Dimension2.zero()
    return Dimension2.new(Dimension.zero(),Dimension.zero())
end

--- Creates a new Dimension2 with only the offset.
---@param offset Vector2
---@return Dimension2
function Dimension2.fromOffset(offset)
    return Dimension2.new(Dimension.fromOffset(offset.x),Dimension.fromOffset(offset.y))
end

--- Creates a new Dimension2 with only the scale.
---@param scale Vector2
---@return Dimension2
function Dimension2.fromScale(scale)
    return Dimension2.new(Dimension.fromScale(scale.x),Dimension.fromScale(scale.y))
end

--- Gets the Dimension2's offset.
---@param self Dimension2
---@return Vector2
Dimension2.GetOffset=function(self)
    return vec(self:GetX():GetOffset(),self:GetY():GetOffset())
end

--- Gets the Dimension2's scale.
---@param self Dimension2
---@return Vector2
Dimension2.GetScale=function(self)
    return vec(self:GetX():GetScale(),self:GetY():GetScale())
end

--- Gets the Dimension2 as a scale vector.
---@param self Dimension2
---@param size Vector2 The total offset size.
---@return Vector2
Dimension2.ToScale=function(self,size)
    return vec(self:GetX():ToScale(size.x),self:GetY():ToScale(size.y))
end

--- Gets the Dimension2 as an offset vector.
---@param self Dimension2
---@param size Vector2 The total offset size.
---@return Vector2
Dimension2.ToOffset=function(self,size)
    return vec(self:GetX():ToOffset(size.x),self:GetY():ToOffset(size.y))
end

--- Gets the Dimension2's X value.
---@param self Dimension2
---@return Dimension
Dimension2.GetX=function(self)
    return self.X
end

--- Gets the Dimension2's Y value.
---@param self Dimension2
---@return Dimension
Dimension2.GetY=function(self)
    return self.Y
end

---@param self Dimension2
---@param other Dimension2
---@return Dimension2
Dimension2.__add=function(self,other)
    local off=self:GetOffset()+other:GetOffset()
    local scale=self:GetScale()+other:GetScale()
    return Dimension2.fromVectors(off,scale)
end

---@param self Dimension2
---@param other Dimension2
---@return Dimension2
Dimension2.__sub=function(self,other)
    local off=self:GetOffset()-other:GetOffset()
    local scale=self:GetScale()-other:GetScale()
    return Dimension2.fromVectors(off,scale)
end

_G.Dimension2=Dimension2

return Dimension2