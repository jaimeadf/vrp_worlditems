local BaseService = require('client/services/BaseService')
local class = require('common/utils/class')
local Prop = require('common/models/Prop')
local ModelUtils = require('client/utils/ModelUtils')

local PropSpawnService = class(BaseService)

function PropSpawnService:start()
    self.tunnel.spawnProp = function(...)
        return self:spawnProp(...)
    end
end

function PropSpawnService:spawnProp(model, position, place_on_ground)
    local model_hash = ModelUtils.parseModel(model)
    if ModelUtils.loadModel(model_hash) then
        local entity_id = CreateObject(model_hash, position.x, position.y, position.z, true, true, true)
        local network_id = NetworkGetNetworkIdFromEntity(entity_id)
        SetModelAsNoLongerNeeded(model_hash)

        FreezeEntityPosition(entity_id, true)
        SetEntityCollision(entity_id, false, true)

        if place_on_ground then
            PlaceObjectOnGroundProperly(entity_id)
        end

        return network_id
    end
end

return PropSpawnService
