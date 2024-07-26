Dim={}
Dim.__type="Dim"

function Dim.new(scale,offset)
    ---@class Dim
    ---@field Scale number
    ---@field Offset number
    local Dimv={}

    Dimv.Offset=offset
    Dimv.Scale=scale

    return setmetatable(Dimv,Dim)
end

return Dim