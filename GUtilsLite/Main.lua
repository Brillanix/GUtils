local files=listFiles("GUtilsLite",false)
printTable(files)

for i,x in ipairs(files)do
    if not string.find(x,"GUtilsLite.Main",1,true)then
        require(x)
    end
end

return