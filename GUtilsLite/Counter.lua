-- Counter

--- A Counter. It reduces its count every tick, can be resetted anytime.<br>
--- Call `:Update()` on the `tick` event.
---@class Counter
---@field Value number
---@field Time number
local Counter={}
Counter.__index=Counter
Counter.__type="Counter"

--- Creates a new Counter.
---@param time number
---@return Counter
function Counter.new(time)
    local self={}

    self.Value=0
    self.Time=time

    return setmetatable(self,Counter)
end

--- Updates the Counter.
---@param self Counter
---@return self
Counter.Update=function(self)
    self.Value=math.max(0,self.Value-1)
    return self
end

--- Resets the Counter.
---@param self Counter
---@return self
Counter.Reset=function(self)
    self.Value=self.Time
    return self
end

_G.Counter=Counter

return Counter