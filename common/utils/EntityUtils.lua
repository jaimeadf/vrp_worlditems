    local EntityUtils = {}

    function EntityUtils.getEntityIdFromNetworkId(network_id)
        local start_time = GetGameTimer()
        while GetGameTimer() - start_time < 15000 do
            local entity_id = NetworkGetEntityFromNetworkId(network_id)
            if entity_id ~= 0 then
                return entity_id
            end
            Wait(100)
        end
    end

    return EntityUtils