local Element=require("../Element")()

--- Creates a Sprite.
---@param parent ModelPart|Element
---@param name string?
---@return Sprite # A new Sprite.
return function(parent,name)
    --- Sprite element type used in GUtils.
    ---@class Sprite: Element
    local Sprite=setmetatable({},Element)
    Sprite.ClassName="Sprite"
    Sprite.Parent=parent
    
    Sprite.Pos=Dim2.new(0,0,0,0)
    Sprite.Size=Dim2.new(50,0,50,0)
    Sprite.Rot=0
    Sprite.ZIndex=1
    Sprite.Name=name
    Sprite.Texture=nil

    local parent=parent
    local name=name
    while true do
        if type(parent)=="ModelPart"then
            table.insert(Sprite.Tasks,parent:newSprite(name))
            break
        elseif type(parent)=="Element"then
            name=parent.Name.."."..name
            parent=parent.Parent
        end
    end

    Sprite.OnPress=CustomEvent.new()

    table.insert(GUtils_ActiveElements,Sprite)

    return Sprite
end