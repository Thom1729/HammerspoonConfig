local json = require('hs.json')

local Commands = dofile('commands.lua')

local raw = json.read('commandMap.json')

function map(tbl, callback)
    local result = {}
    for k,v in pairs(tbl) do
        result[k] = callback(v, k)
    end
    return result
end

return map(raw, function(commands)
    return map(commands, function(c) return Commands[c] end)
end)
