return function()
    --- GUI element class used in GUtils.
    ---@class Element
    ---@field ClassName string The element's type as a string.
    ---@field Name string The element's name.
    ---@field Pos Dim2 The element's position.
    ---@field Size Dim2 The element's 2D size.
    ---@field Rot number The element's 2D rotation.
    ---@field ZIndex number The element's ZIndex (Z position).
    ---@field Tasks {[integer]:RenderTask}
    ---@field Children {[integer]:Element}
    ---@field Parent ModelPart|Element?
    ---@field Visible boolean If this element is visible.
    local Element={}
    Element.__index=Element
    Element.__type="Element"

    Element.Tasks={}
    Element.Children={}

    Element.Visible=true
    Element.ParentVisible=true

    --- Destroys the element and all its children.
    ---@param self Element
    function Element.destroy(self)
        self.Parent=nil
        for i=1,#self.Children do
            self.Children[i]:destroy()
        end
        for i=1,#self.Tasks do
            self.Tasks[i]:remove()
        end
        setmetatable(self,nil)
    end

    ---@private
    function Element.clone(self)
        

        for i=1,#self.Children do
            self.Children[i]=self.Children[i]:clone()
        end

    end

    return Element
end