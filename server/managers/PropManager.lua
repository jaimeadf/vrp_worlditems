local class = require('common/utils/class')
local Prop = require('common/models/Prop')
local EntityUtils = require('common/utils/EntityUtils')

local PropManager = class()

function PropManager:create(player, model, position, place_on_ground)
    local network_id = Client.spawnProp(player, model, position, place_on_ground)
    local entity_id = EntityUtils.getEntityIdFromNetworkId(network_id)

    if entity_id then
        return Prop(entity_id, network_id)
    end

    return nil
end

function PropManager:delete(prop)
    DeleteEntity(prop.entityId)
end

return PropManager
