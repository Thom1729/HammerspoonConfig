local alert = require('hs.alert')
local json = require('hs.json')

local HyperMode = dofile('lib/hyperMode.lua')

local commandMap = dofile('commandMap.lua')
local characterMap = json.read('characterMap.json')

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

dofile('menu.lua')

alert("Loaded Hammerspoon configuration.")
