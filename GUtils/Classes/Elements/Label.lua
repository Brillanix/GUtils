local Element=require("../Element")()

--- Creates a text label.
---@param parent ModelPart|Element
---@param name string?
---@return Label # A new label.
return function(parent,name)
    --- Text label element type used in GUtils.
    ---@class Label: Element
    ---@field Text string
    local Label=setmetatable({},Element)
    Label.ClassName="Label"
    Label.Parent=parent
    
    Label.Pos=Dim2.new(0,0,0,0)
    Label.Size=Dim2.new(50,0,50,0)
    Label.Rot=0
    Label.ZIndex=1
    Label.Name=name
    Label.Text="Label"
    Label.Background=vec(0,0,0,0)
    Label.Color=vec(1,1,1)

    local parent=parent
    local name=name
    while true do
        if type(parent)=="ModelPart"then
            table.insert(Label.Tasks,parent:newText(name))
            break
        elseif type(parent)=="Element"then
            name=parent.Name..name
            parent=parent.Parent
        end
    end

    table.insert(GUtils_ActiveElements,Label)

    return Label
end