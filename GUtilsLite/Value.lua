-- Value

--- A Value. Like a variable, but with other extra utilities.<br>
--- Mainly for tracking variable changes.
---@class Value
---@field Value any
---@field OnSet CustomEvent
local Value={}
Value.__index=Value
Value.__type="Value"

--- Creates a new Value.
---@param value any
---@return Value
function Value.new(value)
    local self={}

    self.Value=value
    self.OnSet=CustomEvent.new()

    return setmetatable(self,Value)
end

--- Updates the Value.
---@param self Value
---@param value any
---@return self
Value.Set=function(self,value)
    if self.Value~=value then
        self.OnSet:Fire()
    end
    self.Value=value
    return self
end

--- Resets the Value.
---@param self Value
---@return any
Value.Get=function(self)
    return self.Value
end

_G.Value=Value

return Value