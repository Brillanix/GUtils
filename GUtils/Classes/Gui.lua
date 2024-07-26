GUtils_ActiveElements={}

-- Handle all GUIs in a single registered event.
events.world_render:register(function (delta)
    for i=1,#GUtils_ActiveElements do
        ---@type Element
        local element=GUtils_ActiveElements[i]
        if element.Parent==nil then
            element:destroy()
            GUtils_ActiveElements[i]=nil
        elseif #GUtils_ActiveElements>0 then
            local epos,erot,eindex=Dim2.new(0,0,0,0),0,0
            local parent=element.Parent
            while true do
                if type(parent)=="ModelPart"then
                    break
                elseif type(parent)=="Element"then
                    epos=epos+parent.Pos
                    --epos=epos+(vectors.rotateAroundAxis(erot,parent.Pos:augmented(0),vec(1,1,0)).xy) --TODO: Make position worh with rotation. (old useless code here)
                    erot=erot+parent.Rot
                    eindex=eindex+parent.ZIndex
                    parent=parent.Parent
                end
            end
            for j=1,#element.Tasks do
                ---@type RenderTask
                local task=element.Tasks[j]

                -- Here we update all tasks.
                local RealPos=-element.Pos-epos
                local RealPos2=RealPos:asOffset(Math:screenSize())
                local RealSize=element.Size:asOffset(Math:screenSize())
                if type(element.Parent)=="ModelPart"then
                    element.ParentVisible=element.Parent:getVisible()
                else
                    element.ParentVisible=element.Parent.Visible
                end
                if element.ClassName=="Button"or element.ClassName=="Label" then
                    if element.ClassName=="Button"then
                        local ElementVecPos=element.Pos:asOffset(Math.screenSize())
                        local ElementVecSize=element.Size:asOffset(Math.screenSize())*client.getTextDimensions(element.Text,0,false)
                        element.IsHovering=Math.inRect(Math.mousePos(),ElementVecPos,ElementVecSize+ElementVecPos)
                    end
                    local ElementBackCol=vectors.hsvToRGB(vectors.rgbToHSV(element.Background.xyz)+(element.ClassName=="Button" and element.IsHovering and vec(0,-.3,0)or vec(0,0,0))).xyz_+vec(0,0,0,element.Background.w)
                    local RealTextSize=RealSize/Math.textPixelSize(element.Text,0)
                    task:setText(toJson({{
                        text=element.Text,
                        color="#"..vectors.rgbToHex(element.Color),
                    }})):setBackground(true):setBackgroundColor(ElementBackCol):setScale(RealTextSize.x,RealTextSize.y,1)
                end
                if element.ClassName=="Sprite"then
                    if element.Texture then
                        task:setTexture(element.Texture,element.Texture:getDimensions().x,element.Texture:getDimensions().y)
                        --host:actionbar(task:getTexture())
                    else
                        task:setTexture()
                    end
                end
                task:setPos(RealPos2.x and RealPos2.x,RealPos2.y and RealPos2.y,element.ZIndex and -element.ZIndex-eindex):setRot(0,0,element.Rot+erot):setScale(RealSize.x,RealSize.y,1):setVisible(element.ParentVisible and element.Visible)
            end
        end
    end
end,"GUtils_RenderEvent")

events.mouse_press:register(function (button, state, modifiers)
    for i=1,#GUtils_ActiveElements do
        ---@type Element
        local element=GUtils_ActiveElements[i]

        if element.ClassName=="Button"and element.IsHovering then
            element.OnPress:run(button,state,modifiers)
        end
    end
end)

--- GUI Class used in GUtils.
---@class Gui
---@field Button table A button class.
local GUI={
    Button={},
    Label={},
    Sprite={},
}

--- Creates a button.
---@type fun(parent:ModelPart|Element,name:string?):Button
GUI.Button.new=require("../Classes/Elements/Button")

--- Creates a text label.
---@type fun(parent:ModelPart|Element,name:string?):Label
GUI.Label.new=require("../Classes/Elements/Label")

--- Creates a sprite.
---@type fun(parent:ModelPart|Element,name:string?):Sprite
GUI.Sprite.new=require("../Classes/Elements/Sprite")

return GUI