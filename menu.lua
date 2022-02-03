local menubar = require('hs.menubar')
local Commands = dofile('commands.lua')

-- http://cocoamine.net/blog/2015/03/20/replacing-photoshop-with-nsstring/
local ICON = [[
· · · · · · · · · · · · · · · ·
7 8 · · · · · · · · · 8 6 · · ·
· · · · · · · · · · · · 6 · · ·
· · 1 · · · · · · · · · · · 1 ·
· · 3 · · · · · · · · · · · 4 ·
· · · · · · · · b · · · · · · ·
· · · · · · · a z c · · · · · ·
· · · · · m · · · · · i · · · ·
· · · · p y · · · · · y j · · ·
· · · · · n · · · · · k · · · ·
7 · · · · · · e z g · · · · · ·
5 5 · · · · · · f · · · · · · ·
· · 3 · · · · · · · · · · · 4 ·
· · 2 · · · · · · · · · · · 2 ·
· · · · · · · · · · · · · · · ·
· · · · · · · · · · · · · · · ·
]]

menu = menubar.new(true)
menu:setIcon('ASCII:' .. ICON)
menu:setMenu({
    {
        title = 'Resize Terminal',
        fn = Commands.ResizeTerminal,
    },
    { title = '-' },
    {
        title = 'Reload',
        fn = Commands.Reload,
    },
})
