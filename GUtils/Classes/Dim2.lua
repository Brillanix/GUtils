Dim2={}
Dim2.__type="Dim2"

function Dim2.new(scaleX,offsetX,scaleY,offsetY)
    ---@class Dim2
    ---@field Scale Vector2
    ---@field Offset Vector2
    ---@field X Dim
    ---@field Y Dim
    ---@operator sub(Dim2):Dim2
    ---@operator add(Dim2):Dim2
    ---@operator unm(Dim2):Dim2
    local Dim2v={}

    Dim2v.Offset=vec(offsetX,offsetY)
    Dim2v.Scale=vec(scaleX,scaleY)
    Dim2v.X=Dim.new(scaleX,offsetX)
    Dim2v.Y=Dim.new(scaleY,offsetY)

    ---@param self self
    ---@param sub Dim2
    ---@return Dim2
    function Dim2.__sub(self,sub)
        return Dim2.new(self.X.Offset-sub.X.Offset,self.X.Scale-sub.X.Scale,self.Y.Offset-sub.Y.Offset,self.Y.Scale-sub.Y.Scale)
    end

    ---@param self self
    ---@param add Dim2
    ---@return Dim2
    function Dim2.__add(self,add)
        return Dim2.new(self.X.Offset+add.X.Offset,self.X.Scale+add.X.Scale,self.Y.Offset+add.Y.Offset,self.Y.Scale+add.Y.Scale)
    end

    ---@param self self
    ---@return Dim2
    function Dim2.__unm(self)
        return Dim2.new(-self.X.Offset,-self.X.Scale,-self.Y.Offset,-self.Y.Scale)
    end

    --- Gets a vector with an Dim2's scale.
    ---@param self self
    ---@param scaleSize Vector2
    ---@return Vector2
    function Dim2v.asOffset(self,scaleSize)
        return self.Offset+(self.Scale*scaleSize)
    end

    return setmetatable(Dim2v,Dim2)
end


return Dim2