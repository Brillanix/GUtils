require("../GUtils-beta1/Classes/Dim")
require("../GUtils-beta1/Classes/Dim2")
require("../GUtils-beta1/Classes/GMath")
require("../GUtils-beta1/Classes/CustomEvent")

--- Main class used in GUtils.<br /> Contains most constructors and utility functions used by GUtils.<br />
---@class GUtils
---@field Gui Gui
-- A `GUtils` you get when you require the main script.<br />
local GUtils={}

GUtils.Gui=require("../GUtils-beta1/Classes/Gui")

return GUtils