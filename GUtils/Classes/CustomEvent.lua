CustomEvent={}
CustomEvent.__type="CustomEvent"

function CustomEvent.new()
    ---@class CustomEvent
    ---@field Functions {[any]:fun(...):any}
    local CustomEventv={}

    CustomEventv.Functions={}

    --- Registers a function to be ran when this event fires.
    ---@param self self
    ---@param func function
    ---@param name string?
    ---@return self
    function CustomEventv.register(self,func,name)
        if name then
            self.Functions[name]=func
        else
            table.insert(self.Functions,func)
        end
        return self
    end

    --- Triggers all functions registered to this event with the specified parameters.
    ---@param self self
    ---@param ... any
    ---@return self
    function CustomEventv.run(self,...)
        for i,x in pairs(self.Functions)do
            x(...)
        end
        return self
    end

    return setmetatable(CustomEventv,CustomEvent)
end