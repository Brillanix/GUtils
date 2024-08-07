> # GUtils
> GUI Library made by Brillanix for FiguraMC.

> **NOTE**:<br>
> This project is W.I.P, errors or lack of functionality will arise.
> <br>You can help the development of this project if you want, I would appreciate it.

> #### **UPDATE**: <u>GUtils Lite</u> got released!<br>*(GUtils is still broken.)*

## About:
This is a GUI Library for FiguraMC, as stated on the title aimed to simplify the creation of HUD-type objects using `RenderTask`s.<br>

*(I will put media here when the project is more refined)*

## How to use (GUtils Lite):

To load the scripts, you can put them anywhere.<br>
If you're putting them on the avatar folder, you should try requiring `Main.lua` at the beginning of your script:<br>
```lua
require("GUtilsLite.Main"--[[File path goes here.]])
```
If `Main.lua` doesn't work, try requiring all other scripts excluding `Main.lua`.

After loading the scripts, you can start using all the stuff this library has.

Most globals and classes can be accessed by typing them, and most classes will have `.new()` function.<br>
Note that most objects' properties are recommended to be modified using functions.

### GUIContainer

```lua
GUIContainer.new(
    parent: ModelPart,
    location: Location,
    size: Dimension2,
    screensize: Vector2
)
```
A GUIContainer is an object made to store other GUIContainers or Elements.

### Element

```lua
Element.new(
    task: RenderTask,
    parent: GUIContainer
)
```

An Element is a RenderTask holder made for GUIs and HUDs.<br>
They support `Value` objects as well, making the element's property change everytime the Value changes.

Use the following to set an element's properties properly.
```lua
element:SetValues({
    Position: Dimension2,
    Scale: Dimension2,
    ZIndex: number,
    ZSize: number,
    Rotation: Vector3
}): self
```

After running `:SetValues()`, you can now run the following and apply the changes to the RenderTask:
```lua
element:Update() -- This'll update the RenderTask.
```
Consider putting `:Update()` inside a render event.

### Location

```lua
Location.new(
    position: Vector3,
    rotation: Vector3
)
```
```lua
Location.zero() -- This gives an empty location.
```

Locations hold both a position and rotation into a single value.<br>
As of now, you can only get a position and rotation vector, support for direction vectors will come later. Meanwhile you can use `*` to move it by another location considering the rotation or `+` and `-` to move it by a vector.

### Dimension2

```lua
Dimension2.new(
    x: Dimension,
    y: Dimension
)
```
```lua
Dimension2.fromVectors(
    offset: Vector2,
    scale: Vector2
)
```
```lua
Dimension2.zero() -- This gives an empty Dimension2.
```

These hold a 2D value with both a relative scale and pixel offset.<br>Used mainly in GUIs/HUDs.

### Dimension

```lua
Dimension.new(
    offset: number,
    scale: number
)
```
```lua
Dimension.zero() -- This gives an empty Dimension.
```

Similar to Dimension2, they hold a 1D value with both a relative scale and pixel offset.<br>
Also used mainly in GUIs/HUDs.

---
There are many other stuff you can do, with objects like `Spring`, `LerpAnim`, `Counter`, `CustomEvent`, `Value`, etc.

## How to use (GUtils):
<font size=2>NOTE: This is **for the original GUtils**, which is right now broken.<br>You can still use GUtils Lite if you want.</font>

Put the code inside your avatar folder, you should load it using:
```lua
local GUtils = require("GUtils.Main" --[[File path goes here.]])
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