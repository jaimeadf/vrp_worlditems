local ModelUtils = {}

function ModelUtils.parseModel(model)
    if type(model) == 'string' then
        return GetHashKey(model)
    end
    return model
end

function ModelUtils.loadModel(model_hash)
    if IsModelValid(model_hash) then
        local start_time = GetGameTimer()
        while GetGameTimer() - start_time < 15000 do
            RequestModel(model_hash)
            if HasModelLoaded(model_hash) then
                return true
            end
            Citizen.Wait(100)
        end
    end
    return false
end

return ModelUtils
