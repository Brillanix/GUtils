---@diagnostic disable: param-type-mismatch
-- GUIContainer

--- A GUIContainer object. It can store Element objects in it.<br>
--- Mainly for GUI/HUD elements.
---@class GUIContainer
---@field Parent ModelPart|GUIContainer
---@field Location Location
---@field Size Dimension2
---@field ScreenSize Vector2
local GUIContainer={}
GUIContainer.__index=GUIContainer
GUIContainer.__type="GUIContainer"

--- Creates a new GUIContainer.
---@return GUIContainer
---@param parent ModelPart|GUIContainer
---@param location Location
---@param size Dimension2
---@param screensize Vector2
function GUIContainer.new(parent,location,size,screensize)
    local self={}

    self.Parent=parent
    self.Location=location
    self.Size=size
    self.ScreenSize=screensize

    return setmetatable(self,GUIContainer)
end

--- Gets the GUIContainer's size.
---@param self GUIContainer
---@return Dimension2
GUIContainer.GetSize=function(self)
    return self.Size
end

--- Gets the GUIContainer's position.
---@param self GUIContainer
---@return Location
GUIContainer.GetLocation=function(self)
    return self.Location
end

--- Gets the GUIContainer's rotation.
---@param self GUIContainer
---@return Vector3
GUIContainer.GetRotation=function(self)
    return self:GetLocation():GetRotation()
end

--- Gets the GUIContainer's rotation.
---@param self GUIContainer
---@return Vector3
GUIContainer.GetPosition=function(self)
    return self:GetLocation():GetPosition()
end

--- Gets the GUIContainer's screen size.
---@param self GUIContainer
---@return Vector2
GUIContainer.GetScreenSize=function(self)
    return self.ScreenSize
end

--- Gets the GUIContainer's parent.
---@param self GUIContainer
---@return ModelPart|GUIContainer
GUIContainer.GetParent=function(self)
    return self.Parent
end

--- Gets the GUIContainer's position from the root modelpath.
---@param self GUIContainer
---@return Vector3
GUIContainer.GetPositionFromModelPart=function(self)
    if type(self:GetParent())=="ModelPart"then
        return self:GetPosition()
    else
        return self:GetParent():GetPositionFromModelPart()+self:GetPosition()
    end
end

_G.GUIContainer=GUIContainer

return GUIContainer