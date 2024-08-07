---@diagnostic disable: param-type-mismatch
-- ElementArray

--- GUI element array, like a normal Element, but an array of tasks instead.<br>
--- Call `:Update()` on the `render` or `world_render` event.
---@class ElementArray
---@field Tasks {[number]:SpriteTask|EntityTask|BlockTask|ItemTask|TextTask}
---@field Position Dimension2|Value
---@field ZIndex number|Value
---@field Scale Dimension2|Value
---@field ZSize number|Value
---@field Rotation Vector3|Value
---@field Parent GUIContainer
---@field OffsetFunction fun(self:ElementArray,i:number,task:SpriteTask|EntityTask|BlockTask|ItemTask|TextTask):{Position:Dimension2,Scale:Dimension2,Rotation:Vector3,ZIndex:number,ZSize:number}
local ElementArray={}
ElementArray.__index=ElementArray
ElementArray.__type="ElementArray"

--- Creates a new ElementArray.
---@param tasks {[number]:SpriteTask|EntityTask|BlockTask|ItemTask|TextTask}
---@param parent GUIContainer
---@param func fun(self:ElementArray,i:number,task:SpriteTask|EntityTask|BlockTask|ItemTask|TextTask):{Position:Dimension2,Scale:Dimension2,Rotation:Vector3,ZIndex:number,ZSize:number}
---@return ElementArray
function ElementArray.new(tasks,parent,func)
    local self={}

    self.Tasks=tasks
    self.Parent=parent
    
    self.Position=Dimension2.fromOffset(vec(10,10))
    self.ZIndex=0
    self.Scale=Dimension2.fromOffset(vec(1,1))
    self.ZSize=0.01
    self.Rotation=vec(0,0,0)
    self.OffsetFunction=func

    return setmetatable(self,ElementArray)
end

--- Updates the ElementArray.
---@param self ElementArray
---@return self
ElementArray.Update=function(self)
    local scrsize=self.Parent:GetScreenSize()
    
    local Position=type(self.Position)=="Value"and self.Position:Get() or self.Position
    local ZIndex=type(self.ZIndex)=="Value"and self.ZIndex:Get() or self.ZIndex
    local Scale=type(self.Scale)=="Value"and self.Scale:Get() or self.Scale
    local ZSize=type(self.ZSize)=="Value"and self.ZSize:Get() or self.ZSize
    local Rotation=type(self.Rotation)=="Value"and self.Rotation:Get() or self.Rotation
    
    for i,x in pairs(self.Tasks)do
        local Offset=self:OffsetFunction(i,x)
        local posoff=self.Parent:GetPositionFromModelPart()

        x:pos(-((Position+Offset.Position):ToOffset(scrsize).xy_+vec(0,0,Offset.ZIndex+ZIndex))+posoff)
        :scale((Scale+Offset.Scale):ToOffset(scrsize).xy_+vec(0,0,Offset.ZSize+ZSize))
        :rot(Rotation+Offset.Rotation)
    end
    return self
end

_G.ElementArray=ElementArray

return ElementArray