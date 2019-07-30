local fnutils = require('hs.fnutils')
local Window = dofile('window.lua')

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
}
