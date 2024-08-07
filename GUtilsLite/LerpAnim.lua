-- LerpAnim

--- A LerpAnim, used for creating `math.lerp`-based animations.<br>
--- You can call `:Update()` anywhere, you can input `delta` on render-based events.
---@class LerpAnim
---@field Value any
---@field Target any
---@field Speed number
local LerpAnim={}
LerpAnim.__index=LerpAnim
LerpAnim.__type="LerpAnim"

--- Creates a new LerpAnim.
---@param value any
---@param speed any
---@return LerpAnim
function LerpAnim.new(value,speed)
    local self={}

    self.Value=value
    self.Target=value
    self.Speed=speed or .5

    return setmetatable(self,LerpAnim)
end

--- Updates the LerpAnim
---@param self LerpAnim
---@param delta number?
---@return self
LerpAnim.Update=function(self,delta)
    self.Value=math.lerp(self.Value,self.Target,self.Speed*math.min(delta or 1,1))
    return self
end

--- Sets the LerpAnim's target<br>
--- The LerpAnim's value will lerp to match the target value everytime you update it.
---@param self LerpAnim
---@param value any
---@return self
LerpAnim.SetTarget=function(self,value)
    self.Target=value
    return self
end

--- Sets the LerpAnim's actual value<br>
--- This will lerp to the target everytime its updated.
---@param self LerpAnim
---@param value any
---@return self
LerpAnim.SetValue=function(self,value)
    self.Value=value
    return self
end

--- Gets the LerpAnim's actual value.
---@param self LerpAnim
---@return any
LerpAnim.Get=function(self)
    return self.Value
end

_G.LerpAnim=LerpAnim

return LerpAnim