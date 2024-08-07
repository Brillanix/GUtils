-- Spring

--- A Spring. A physics object that goes towards its target.<br>
--- Call `:Update()` on any event, you can provide `delta`.
---@class Spring
---@field Value any
---@field Target any
---@field Velocity any
---@field Stiffness number
---@field Damping number
local Spring={}
Spring.__index=Spring
Spring.__type="Spring"

--- Creates a new Spring.
---@param value any
---@param stiffness number?
---@param damping number?
---@return Spring
function Spring.new(value,stiffness,damping)
    local self={}

    self.Value=value
    self.Target=value
    self.Velocity=(type(value)=="Vector3" and vec(0,0,0))or(type(value)=="Vector2" and vec(0,0))or(0)
    self.Stiffness=stiffness or .5
    self.Damping=damping or .2

    return setmetatable(self,Spring)
end

--- Updates the Spring.
---@param self Spring
---@param delta number?
---@return self
Spring.Update=function(self,delta)
    self.Velocity=(self.Velocity+(self.Target-self.Value)*(delta or 1)*self.Stiffness)*(1-self.Damping)

    self.Value=self.Value+self.Velocity
    return self
end

--- Sets the Spring's target.
---@param self Spring
---@param target any
---@return self
Spring.SetTarget=function(self,target)
    self.Target=target
    return self
end

--- Sets the Spring's actual value.
---@param self Spring
---@param value any
---@return self
Spring.SetValue=function(self,value)
    self.Value=value
    return self
end

--- Sets the Spring's actual velocity.
---@param self Spring
---@param velocity number
---@return self
Spring.SetVelocity=function(self,velocity)
    self.Velocity=velocity
    return self
end

--- Sets the Spring's stiffness.
---@param self Spring
---@param stiffness number
---@return self
Spring.SetStiffness=function(self,stiffness)
    self.Stiffness=stiffness
    return self
end

--- Sets the Spring's actual damping.
---@param self Spring
---@param damping number
---@return self
Spring.SetDamping=function(self,damping)
    self.Damping=damping
    return self
end

--- Gets the Spring's actual value.
---@param self Spring
---@return any
Spring.GetValue=function(self)
    return self.Value
end

_G.Spring=Spring

return Spring