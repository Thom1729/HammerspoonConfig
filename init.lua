local alert = require('hs.alert')
local HyperMode = dofile('lib/hyperMode.lua')

local commandMap = dofile('commandMap.lua')
local characterMap = dofile('characterMap.lua')

HyperMode.new('f18', function(key, flags)
    local tbl

    if flags.cmd then
        tbl = commandMap
    else
        tbl = characterMap
    end

    if tbl[key] == nil then
        return nil
    else
        local i = 1
        if flags.shift then
            i = i + 1
        end
        if flags.alt then
            i = i + 2
        end
        return tbl[key][i]
    end
end)

alert("Loaded Hammerspoon configuration.")
