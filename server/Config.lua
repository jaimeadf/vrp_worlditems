local class = require('common/utils/class')

local Config = class(function (self, despawn_time, item_models)
    self.despawnTime = despawn_time
    self.itemModels = item_models
end)

function Config:getDespawnTime()
    return self.despawnTime
end

function Config:getItemModel(id_name)
    local item_model = self.itemModels[id_name]
    if item_model == nil then
        local args = vRP.parseItem(id_name)
        item_model = self.itemModels[args[1]] or self.itemModels.__default
    end

    return item_model
end

return Config
