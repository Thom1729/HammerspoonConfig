local exports = {}

function exports.map(tbl, callback)
    local result = {}
    for k,v in pairs(tbl) do
        result[k] = callback(v, k)
    end
    return result
end

return exports
