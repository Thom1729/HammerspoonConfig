local fnutils = require('hs.fnutils')
local Window = dofile('window.lua')

local event = require('hs.eventtap.event')

function systemKey(key, flags)
    local keydown = event.newSystemKeyEvent(key, true)
    if flags then
        keydown:setFlags(flags)
    end
    keydown:post()
    event.newSystemKeyEvent(key, false):post()
end

return {
    escape = { hs.reload },

    left  = {
        fnutils.partial(Window.move, { 0,   0, 0.5, 1 }),
        fnutils.partial(Window.moveScreen, 'toWest'),
        fnutils.partial(Window.move, { 0,   0, 0.5, 1 }, true),
        fnutils.partial(Window.moveScreen, 'toWest', true),
    },

    right = {
        fnutils.partial(Window.move, { 0.5, 0, 0.5, 1 }),
        fnutils.partial(Window.moveScreen, 'toEast'),
        fnutils.partial(Window.move, { 0.5, 0, 0.5, 1 }, true),
        fnutils.partial(Window.moveScreen, 'toEast', true),
    },

    up = {
        fnutils.partial(Window.move, { 0,   0,   1, 1 }),
        Window.fullScreen,
        fnutils.partial(Window.move, { 0,   0,   1, 1 }, true),
    },

    pageup = {
        fnutils.partial(systemKey, 'SOUND_UP', { alt=true, shift=true }),
        fnutils.partial(systemKey, 'BRIGHTNESS_UP'),
    },

    pagedown = {
        fnutils.partial(systemKey, 'SOUND_DOWN', { alt=true, shift=true }),
        fnutils.partial(systemKey, 'BRIGHTNESS_DOWN'),
    },

    f15  = { fnutils.partial(systemKey, 'MUTE') }, -- Pause
    help = { fnutils.partial(systemKey, 'PLAY') }, -- Insert
}
