-- Connection

--- A Connection. It can be hooked up and fired.<br>
--- Call `:Fire()` to run all connections.
---@class Connection
---@field Function fun(self:Connection):any
local Connection={}
Connection.__index=Connection
Connection.__type="Connection"

--- Creates a new Connection.
---@param func fun(self:Connection):any
---@return Connection
function Connection.new(func)
    local self={}

    self.Function=func

    return setmetatable(self,Connection)
end

--- Runs this connection.
---@param self Connection
---@return any
function Connection.Run(self)
    return self:Function()
end

--- Disconnects and destroys this connection.
---@param self Connection
function Connection.Disconnect(self)
    setmetatable(self,nil)
end

_G.Connection=Connection

return Connection