> # GUtils
> FiguraMC GUI Library made by Brillanix.

> **NOTE**:<br>
> This project is W.I.P, errors or lack of functionality will arise.
> <br>You can help the development of this project if you want, I would appreciate it.

## About:
This is a GUI Library for FiguraMC, as stated on the title aimed to simplify the creation of HUD-type objects using `RenderTask`s.<br>

*(I will put media here when the project is more refined)*

## How to use:
Put the code inside your avatar folder, you should load it using:
```lua
local GUtils = require("libs.GUtils.Main" --[[File path goes here.]])
```
When you load it, you can use `GUtils.Gui` to get most GUI element types and create them.<br>For example, here's the code for a `Button`:
```lua
local TestButton = GUtils.Button.new(Parent, "TestButton")
```
Parent can be both other GUI `Element`s or `ModelPart`s.

After creating an `Element`, you can modify it's properties like the following:
```lua
TestButton.Pos=Dim2.new(0,25,0,25)
```
GUtils uses scaled pixel size, which means they are scaled with the Minecraft setting `GUI Scale`.<br>
Also, you probably saw how I used `Dim2.new()`, this is one of the value types GUtils add. A Dim2 is a dimension value type composed with 2 vectors:
- A scale one, relative to screen size,
- And an offset one, relative to screen pixels.

`Dim2` are also made with another value type called `Dim`, a `Dim` is a 1D version of the `Dim2`, only having a scale number and an offset number.

###### For more information, check out the documentation of this project.