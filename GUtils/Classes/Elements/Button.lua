local Element=require("../Element")()

--- Creates a button.
---@param parent ModelPart|Element
---@param name string?
---@return Button # A new button.
return function(parent,name)
    --- Button element type used in GUtils.
    ---@class Button: Element
    ---@field Text string
    local Button=setmetatable({},Element)
    Button.ClassName="Button"
    Button.Parent=parent
    
    Button.Pos=Dim2.new(0,0,0,0)
    Button.Size=Dim2.new(50,0,50,0)
    Button.Rot=0
    Button.ZIndex=1
    Button.Name=name
    Button.Text="Label"
    Button.Background=vec(1,1,1,1)
    Button.Color=vec(0,0,0)
    Button.IsHovering=false

    local parent=parent
    local name=name
    while true do
        if type(parent)=="ModelPart"then
            table.insert(Button.Tasks,parent:newText(name))
            break
        elseif type(parent)=="Element"then
            name=parent.Name.."."..name
            parent=parent.Parent
        end
    end

    Button.OnPress=CustomEvent.new()

    table.insert(GUtils_ActiveElements,Button)

    return Button
end