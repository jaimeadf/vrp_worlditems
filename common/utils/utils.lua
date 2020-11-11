function require(path)
    return module(GetCurrentResourceName(), path)
end

function table.clone(t)
    local clone = {}
    for k, v in pairs(t) do
        clone[k] = v
    end
    return clone
end
