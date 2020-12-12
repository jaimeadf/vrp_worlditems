local class = require('common/utils/class')
local BaseService = require('client/services/BaseService')
local Color = require('common/models/Color')
local VectorUtils = require('common/utils/VectorUtils')
local UI = require('client/utils/UI')

local WorldItemService = class(BaseService, function (self, tunnel)
    BaseService.init(self, tunnel)
    self.worldItems = {}
end)

function WorldItemService:start()
    self.tunnel.setWorldItem = function (...)
        return self:setWorldItem(...)
    end
    self.tunnel.removeWorldItem = function (...)
        return self:removeWorldItem(...)
    end

    RegisterKeyMapping('takeworlditem', 'Take a world item', 'keyboard', 'e')

    RegisterCommand('takeworlditem', function ()
        TriggerServerEvent('vrp_worlditems:takeNearestWorldItem')
    end)

    CreateThread(function ()
        while true do
            Wait(0)
            local player_position = GetEntityCoords(PlayerPedId())
            for id, world_item in pairs(self.worldItems) do
                local distance = VectorUtils.distance(player_position, world_item.position)
                if distance < 10 then
                    UI.drawText3d(world_item.label, world_item.position, Color(255, 255, 255, 255 * (1 - distance / 10)))
                end
            end
        end
    end)
end

function WorldItemService:setWorldItem(world_item)
    self.worldItems[world_item.id] = world_item
end

function WorldItemService:removeWorldItem(id)
    self.worldItems[id] = nil
end

return WorldItemService
