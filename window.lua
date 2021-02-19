local application = require('hs.application')
local geometry = require('hs.geometry')
local window = require('hs.window')

exports = {}

function getWindows (all)
    if all then
        return application.frontmostApplication():allWindows()
    else
        return { window.frontmostWindow() }
    end
end

function exports.move (rect, all)
    for k, w in pairs(getWindows(all)) do
        w:setFullScreen(false)
        w:moveToUnit(geometry.rect(rect))
    end
end

function exports.moveScreen (direction, all)
    for k, w in pairs(getWindows(all)) do
        local s = w:screen()
        w:move(
            w:frame():toUnitRect(s:frame()),
            s[direction](s)
        )
    end
end

function exports.fullScreen ()
    local w = window.frontmostWindow()
    w:toggleFullScreen()
end

return exports
