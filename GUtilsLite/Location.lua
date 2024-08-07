-- Location

--- A Location object. An object that stores both a position and a rotation.<br>
--- Mainly for GUI/HUD elements.
---@class Location
---@field Position Vector3
---@field Rotation Vector3
---@operator mul(Location):Location
---@operator add(Vector3):Location
---@operator sub(Vector3):Location
local Location={}
Location.__index=Location
Location.__type="Location"

--- Creates a new Location.
---@return Location
---@param position Vector3
---@param rotation Vector3
function Location.new(position,rotation)
    local self={}

    self.Position=position
    self.Rotation=rotation

    return setmetatable(self,Location)
end

--- Creates an empty Location.
---@return Location
function Location.zero()
    return Location.new(vec(0,0,0),vec(0,0,0))
end

--- Gets the Location's position.
---@param self Location
---@return Vector3
Location.GetPosition=function(self)
    return self.Position
end

--- Gets the Location's rotation.
---@param self Location
---@return Vector3
Location.GetRotation=function(self)
    return self.Rotation
end

--- Sets the Location's rotation.
---@param self Location
---@param value Vector3
---@return self
Location.SetPosition=function(self,value)
    self.Position=value
    return self
end

--- Sets the Location's rotation.
---@param self Location
---@param value Vector3
---@return self
Location.SetRotation=function(self,value)
    self.Rotation=value
    return self
end

---@param self Location
---@param other Location
---@return Location
Location.__mul=function(self,other)
    local matpos=other:GetPosition()
    local axis={vec(1,0,0),vec(0,1,0),vec(0,0,1)}
    for i=3,1,-1 do
        matpos=vectors.rotateAroundAxis(self:GetRotation()[i],matpos,axis[i])
    end
    matpos=matpos+self:GetPosition()

    local pos=self:GetPosition()+other:GetPosition()
    local rot=self:GetRotation()+other:GetRotation()
    return Location.new(matpos,rot)
end

---@param self Location
---@param other Vector3
---@return Location
Location.__add=function(self,other)
    local pos=self:GetPosition()+other
    local rot=self:GetRotation()
    return Location.new(pos,rot)
end

---@param self Location
---@param other Vector3
---@return Location
Location.__sub=function(self,other)
    local pos=self:GetPosition()-other
    local rot=self:GetRotation()
    return Location.new(pos,rot)
end

_G.Location=Location

return Location