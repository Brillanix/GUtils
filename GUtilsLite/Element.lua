-- Element

--- GUI element, for easing the creation of HUDs/GUIs.<br>
--- Call `:Update()` on the `render` or `world_render` event.
---@class Element
---@field Task SpriteTask|EntityTask|BlockTask|ItemTask|TextTask
---@field Position Dimension2|Value
---@field ZIndex number|Value
---@field Scale Dimension2|Value
---@field ZSize number|Value
---@field Rotation Vector3|Value
---@field Parent GUIContainer
local Element={}
Element.__index=Element
Element.__type="Element"

--- Creates a new Element.
---@param task SpriteTask|EntityTask|BlockTask|ItemTask|TextTask
---@param parent GUIContainer
---@return Element
function Element.new(task,parent)
    local self={}

    self.Task=task
    self.Parent=parent
    
    self.Position=Dimension2.fromOffset(vec(10,10))
    self.ZIndex=0
    self.Scale=Dimension2.fromOffset(vec(1,1))
    self.ZSize=0.01
    self.Rotation=vec(0,0,0)

    return setmetatable(self,Element)
end

--- Updates the Element.
---@param self Element
---@return self
Element.Update=function(self)
    local scrsize=self.Parent:GetScreenSize()
    local posoff=self.Parent:GetPositionFromModelPart()

    local Position=type(self.Position)=="Value"and self.Position:Get() or self.Position
    local ZIndex=type(self.ZIndex)=="Value"and self.ZIndex:Get() or self.ZIndex
    local Scale=type(self.Scale)=="Value"and self.Scale:Get() or self.Scale
    local ZSize=type(self.ZSize)=="Value"and self.ZSize:Get() or self.ZSize
    local Rotation=type(self.Rotation)=="Value"and self.Rotation:Get() or self.Rotation

    self.Task:pos(-(Position:ToOffset(scrsize).xy_+vec(0,0,ZIndex))+posoff)
    :scale(Scale:ToOffset(scrsize).xy_+vec(0,0,ZSize))
    :rot(Rotation)
    return self
end

--- Sets one or more properties of this Element.
---@param self Element
---@param values table
Element.SetValues=function(self,values)
    for i,x in pairs(values)do
        assert(type(x)~="function","You can't set existing functions!")
        if type(self[i])=="Value"then
            self[i].OnSet:DisconnectAll()
        end
        self[i]=x
        if type(x)=="Value"then
            x.OnSet:Connect(function (connection)
                self:Update()
            end)
        end
    end
end

--- Sets the Element's Parent.
---@param self Element
---@param parent GUIContainer
---@return self
Element.SetParent=function(self,parent)
    self.Parent=parent
    return self
end

_G.Element=Element

return Element