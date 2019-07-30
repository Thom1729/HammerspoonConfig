local alert = require('hs.alert')
local HyperMode = dofile('hyperMode.lua')

local commands = dofile('commands.lua')
local characters = dofile('characters.lua')

HyperMode.new('f18', function(key, flags)
    local tbl

    if flags.cmd then
        tbl = commands
    else
        tbl = characters
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
