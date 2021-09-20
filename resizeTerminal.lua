local osascript = require('hs.osascript')

local window = require('hs.window')
local application = require('hs.application')
local geometry = require('hs.geometry')

exports = {}

function exports.resizeTerminal()
    osascript.applescriptFromFile('resizeTerminal.applescript')
    local widthFraction
    for k, w in pairs(application.find("Terminal"):visibleWindows()) do
        widthFraction = w:frame().w / w:screen():frame().w

        w:moveToUnit(geometry.rect({ 1 - widthFraction, 0, widthFraction, 1 }))
    end
    for k, w in pairs(application.find("Sublime Text"):visibleWindows()) do
        w:moveToUnit(geometry.rect({ 0, 0, 1 - widthFraction, 1 }))
    end
end

return exports
