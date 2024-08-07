--- A table for retrieving GUI values.
---@class GUIValues
local GUIValues={}

--- GUI Size values, Call `GUIValues:Update()` to update.
GUIValues.GUISize={
    -- Dynamic Values

    PixelSize=vec(0,0),
    ScaledSize=vec(0,0),
    GUIScale=0,
    -- Functions

    GetTextWidth=client.getTextWidth,
    GetTextHeight=client.getTextHeight,
}

GUIValues.GUIPos={
    MousePos=vec(0,0),
}

--- Updates all GUI Values.
---@param self GUIValues
---@return self
GUIValues.Update=function(self)
    self.GUISize.GUIScale=client:getGuiScale()
    self.GUISize.ScaledSize=client:getScaledWindowSize()
    self.GUISize.PixelSize=client:getWindowSize()

    self.GUIPos.MousePos=client:getMousePos()/self.GUISize.GUIScale

    return self
end

_G.GUIValues=GUIValues

return GUIValues