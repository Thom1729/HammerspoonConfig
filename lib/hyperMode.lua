local eventtap = require('hs.eventtap')
local keycodes = require('hs.keycodes')
local alert = require('hs.alert')
local inspect = require('hs.inspect')
local fnutils = require('hs.fnutils')

local exports = {}

local HyperMode = {}
HyperMode.__index = HyperMode

function exports.new (key, commands)
    local self = {}
    setmetatable(self, HyperMode)

    self.active = false
    self.key = key
    self.commands = commands
    self.tap = eventtap.new({
        eventtap.event.types.keyDown,
        eventtap.event.types.keyUp,
    }, fnutils.partial(self.handler, self))
    self.tap:start()

    return self
end

function HyperMode:handler (event)
    local key = keycodes.map[event:getKeyCode()]
    local isDown = event:getType() == eventtap.event.types.keyDown

    if key == self.key then
        self.active = isDown

        return true
    elseif self.active then
        if isDown then
            self.tap:stop()
            local command = self.commands(key, event:getFlags())
            if type(command) == 'function' then
                command()
            elseif type(command) == 'string' then
                eventtap.keyStrokes(command)
            elseif command == nil then
                -- pass
            else
                alert('bad return value')
                alert(inspect(command))
            end
            self.tap:start()
        end
        return true
    else
        return false
    end
end

return exports
