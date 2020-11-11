local VectorUtils = {}

function VectorUtils.distance(v1, v2)
    return #(v1 - v2)
end

return VectorUtils
