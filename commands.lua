local fnutils = require('hs.fnutils')
local Window = dofile('lib/window.lua')
local ResizeTerminal = dofile('resizeTerminal.lua')

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
    Reload = hs.reload,

    SoundUp = fnutils.partial(systemKey, 'SOUND_UP', { alt=true, shift=true }),
    SoundDown = fnutils.partial(systemKey, 'SOUND_DOWN', { alt=true, shift=true }),

    Mute = fnutils.partial(systemKey, 'MUTE'),
    Play = fnutils.partial(systemKey, 'PLAY'),

    BrightnessUp = fnutils.partial(systemKey, 'BRIGHTNESS_UP'),
    BrightnessDown = fnutils.partial(systemKey, 'BRIGHTNESS_DOWN'),

    MoveLeft = fnutils.partial(Window.move, { 0,   0, 0.5, 1 }),
    MoveAllLeft = fnutils.partial(Window.move, { 0,   0, 0.5, 1 }, true),
    MoveLeftScreen = fnutils.partial(Window.moveScreen, 'toWest'),
    MoveAllLeftScreen = fnutils.partial(Window.moveScreen, 'toWest', true),

    MoveRight = fnutils.partial(Window.move, { 0.5, 0, 0.5, 1 }),
    MoveAllRight = fnutils.partial(Window.move, { 0.5, 0, 0.5, 1 }, true),
    MoveRightScreen = fnutils.partial(Window.moveScreen, 'toEast'),
    MoveAllRightScreen = fnutils.partial(Window.moveScreen, 'toEast', true),

    MoveFull = fnutils.partial(Window.move, { 0,   0,   1, 1 }),
    MoveAllFull = fnutils.partial(Window.move, { 0,   0,   1, 1 }, true),
    FullScreen = Window.fullScreen,

    ResizeTerminal = ResizeTerminal.resizeTerminal,
}
