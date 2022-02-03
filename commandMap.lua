local json = require('hs.json')

local Commands = dofile('commands.lua')
local util = dofile('lib/util.lua')

local raw = json.read('commandMap.json')

return util.map(raw, function(commands)
    return util.map(commands, function(c) return Commands[c] end)
end)
