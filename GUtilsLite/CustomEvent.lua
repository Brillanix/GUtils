-- CustomEvent

--- A CustomEvent. It can be hooked up and fired.<br>
--- Call `:Fire()` to run all connections.
---@class CustomEvent
---@field Connections {[integer]:Connection}
local CustomEvent={}
CustomEvent.__index=CustomEvent
CustomEvent.__type="CustomEvent"

--- Creates a new CustomEvent.
---@return CustomEvent
function CustomEvent.new()
    local self={}

    self.Connections={}

    return setmetatable(self,CustomEvent)
end

--- Fires all the connections of this event.
---@param self CustomEvent
---@return self 
function CustomEvent.Fire(self)
    local toremove={}
    for i=1, #self.Connections do
        local connect=self.Connections[i]
        if not getmetatable(connect) then
            table.insert(toremove,i)
        else
            connect:Run()
        end
    end
    if #toremove>0 then
        for i=1,#toremove do
            table.remove(self.Connections,toremove[i])
        end
    end
    return self
end

--- Disconnects all the connections in this event.
---@param self CustomEvent
---@return self 
function CustomEvent.DisconnectAll(self)
    for i=1, #self.Connections do
        self.Connections[i]:Disconnect()
    end
    return self
end

--- Connects this event to a function.
---@param self CustomEvent
---@param func fun(self:Connection):any
---@return Connection
function CustomEvent.Connect(self,func)
    local connect=Connection.new(func)
    table.insert(self.Connections,connect)return connect
end

--- Connects this event to a function to be ran once.
---@param self CustomEvent
---@param func fun(self:Connection):any
---@return Connection
function CustomEvent.Once(self,func)
    ---@param connection Connection
    local connect=Connection.new(function(connection)
        func(connection)
        connection:Disconnect()
    end)table.insert(self.Connections,connect)return connect
end

_G.CustomEvent=CustomEvent

return CustomEvent