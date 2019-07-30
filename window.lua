local geometry = require('hs.geometry')
local window = require('hs.window')

exports = {}

function exports.move (rect)
    local w = window.frontmostWindow()
    w:setFullScreen(false)
    w:moveToUnit(geometry.rect(rect))
end

function exports.moveScreen (direction)
    local w = window.frontmostWindow()
    local s = w:screen()
    w:move(
        w:frame():toUnitRect(s:frame()),
        s[direction](s)
    )
end

function exports.fullScreen ()
    local w = window.frontmostWindow()
    w:toggleFullScreen()
end

return exports
