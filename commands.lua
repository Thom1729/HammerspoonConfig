local fnutils = require('hs.fnutils')
local Window = dofile('window.lua')

local event = require('hs.eventtap.event')

function systemKey(key)
    event.newSystemKeyEvent(key, true):post()
    event.newSystemKeyEvent(key, false):post()
end

return {
    escape = {hs.reload},

    left  = {
        fnutils.partial(Window.move, { 0,   0, 0.5, 1 }),
        fnutils.partial(Window.moveScreen, 'toWest'),
    },

    right = {
        fnutils.partial(Window.move, { 0.5, 0, 0.5, 1 }),
        fnutils.partial(Window.moveScreen, 'toEast'),
    },

    up = {
        fnutils.partial(Window.move, { 0,   0,   1, 1 }),
        Window.fullScreen,
    },

    pageup   = {
        fnutils.partial(systemKey, 'SOUND_UP'),
        fnutils.partial(systemKey, 'BRIGHTNESS_UP'),
    },
    pagedown = {
        fnutils.partial(systemKey, 'SOUND_DOWN'),
        fnutils.partial(systemKey, 'BRIGHTNESS_DOWN'),
    },

    f15      = {fnutils.partial(systemKey, 'MUTE')}, -- Pause
    help     = {fnutils.partial(systemKey, 'PLAY')}, -- Insert
}
