local class = require('common/utils/class')
local WorldItem = require('common/models/WorldItem')
local VectorUtils = require('common/utils/VectorUtils')

local WorldItemManager = class(function (self)
    self.worldItems = {}
end)

function WorldItemManager:create(item, prop)
    local world_item = WorldItem(item, prop)

    self.worldItems[world_item.id] = world_item

    return world_item
end

function WorldItemManager:delete(world_item)
    self.worldItems[world_item.id] = nil
end

function WorldItemManager:getById(id)
    return self.worldItems[id]
end

function WorldItemManager:getAll()
    local world_item_list = {}
    for id, world_item in pairs(self.worldItems) do
        table.insert(world_item_list, world_item)
    end

    return world_item_list
end

function WorldItemManager:clear()
    self.worldItems = {}
end

function WorldItemManager:getNearestToPosition(position, min_distance, id_name)
    local nearest_world_item = nil
    local nearest_distance = min_distance
    for id, world_item in pairs(self.worldItems) do
        if not id_name or world_item.idName == id_name then
            local distance = VectorUtils.distance(position, world_item.prop.position)
            if distance <= nearest_distance then
                nearest_world_item = world_item
                nearest_distance = distance
            end
        end
    end

    return nearest_world_item
end

function WorldItemManager:getNearestToPlayer(player, min_distance, item_id_name)
    return self:getNearestToPosition(GetEntityCoords(GetPlayerPed(tostring(player))), min_distance, item_id_name)
end

return WorldItemManager
