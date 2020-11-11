local class = require('common/utils/class')

local Prop = class(function (self, entity_id, network_id)
    self.entityId = entity_id
    self.networkId = network_id
    self.position = GetEntityCoords(self.entityId)
end)

return Prop
