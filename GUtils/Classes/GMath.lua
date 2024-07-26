--- General math used in GUtils.
Math={
    -- Gets whether a vector is between a minimum vector and maximum vector.
    inRect=function (pos,from,to)
        return (pos.x>from.x and pos.x<to.x)and(pos.y>from.y and pos.y<to.y)
    end,
    -- Like `cleint:getMousePos()`, but scaled with the UI Resolution.
    mousePos=function ()
        return client:getMousePos()/client:getWindowSize()*client:getScaledWindowSize()
    end,
    -- Same as `client:getScaledWindowSize()`.
    screenSize=function ()
        return client:getScaledWindowSize()
    end,
    -- Same as `client:getScaledWindowSize()/2`.
    screenCenter=function ()
        return client:getScaledWindowSize()/2
    end,
    -- Turns an offset vector to a scaled vector.
    sizeToScale=function (size)
        return size/client:getScaledWindowSize()
    end,
    -- Turns a scaled vector to an offset vector.
    scaleToSize=function (scale)
        return scale*client:getScaledWindowSize()
    end,
    -- Gets the 2D offset position of a 3D point in the world.
    pointToScreen=function(pos)
        return Math.scaleToSize((vectors.worldToScreenSpace(pos).xy+vec(1,1))/2)
    end,
    -- Gets whether a 3D vector is between a minimum and maximum vector.
    pointInside=function(pos,min,max)
        return(pos.x>min.x and pos.y>min.y and pos.z>min.z)and(pos.x<max.x and pos.y<max.y and pos.z<max.z)
    end,
    --
    textPixelSize=function(text,wraplimit)
        return client.getTextDimensions(text,wraplimit,wraplimit<=0)
    end,
    -- W.I.P - Used for ordering the GUI into a grid.
    gridLayout=function(index,size,parentsize,padding)
        local counter=0
        local Y=0
        for i=1,index-1 do
            counter=counter+size.x
            if counter>parentsize.x then
                counter=0
                Y=Y+(size.y+padding.y)
            else
                counter=counter+padding.x
            end
        end
        return vec(counter,Y)
    end,
}