local class = require('common/utils/class')
local WorldItemMapper = require('server/mappers/WorldItemMapper')

local function set_client_world_item(player, world_item)
    Client._setWorldItem(player, WorldItemMapper.toDto(world_item))
end

local function remove_client_world_item(player, world_item)
    Client._removeWorldItem(player, world_item.id)
end

local WorldItemController =class(function(self, config, item_manager, prop_manager, world_item_manager)
    self.config = config
    self.items = item_manager
    self.props = prop_manager
    self.worldItems = world_item_manager
end)

function WorldItemController:start()
    exports('createWorldItem', function(...)
        return self:createWorldItem(...)
    end)
    exports('deleteWorldItem', function(...)
        return self:deleteWorldItem(...)
    end)
    exports('updateWorldItemAmount', function(...)
        return self:updateWorldItemAmount(...)
    end)
    exports('getWorldItem',function(...)
        return self:getWorldItem(...)
    end)
    exports('getWorldItems', function(...)
        return self:getWorldItems(...)
    end)

    RegisterCommand('takeworlditem', function(source)
        self:takeNearestWorldItem(source)
    end)

    AddEventHandler('vRP:playerSpawn', function(user_id, player)
        for i, world_item in pairs(self.worldItems:getAll()) do
            set_client_world_item(player, world_item)
        end
    end)

    AddEventHandler('vRP:playerLeave', function()
        if #GetPlayers() <= 1 then
            self.worldItems:clear()
        end
    end)
end

function WorldItemController:createWorldItem(player, item_id_name, item_amount, position)
    if not position then
        position = GetEntityCoords(GetPlayerPed(player))
    end

    local world_item = self.worldItems:getNearestToPosition(position, 2, item_id_name)
    if world_item then
        self:updateWorldItemAmount(world_item.id, world_item.amount + item_amount)
    else
        local item = self.items:create(item_id_name, item_amount)
        local prop = self.props:create(player, self.config:getItemModel(item_id_name), position, true)

        if not prop then
            return nil
        end

        world_item = self.worldItems:create(item, prop)

        SetTimeout(self.config:getDespawnTime(), function()
            self:deleteWorldItem(world_item.id)
        end)
    end

    set_client_world_item(-1, world_item)

    return world_item
end

function WorldItemController:deleteWorldItem(id)
    local world_item = self.worldItems:getById(id)
    if world_item then
        self.props:delete(world_item.prop)
        self.worldItems:delete(world_item)
        remove_client_world_item(-1, world_item)
    end
end

function WorldItemController:updateWorldItemAmount(id, amount)
    local world_item = self.worldItems:getById(id)
    if world_item then
        if amount <= 0 then
            self:deleteWorldItem(id)
        else
            world_item.amount = amount
            set_client_world_item(-1, world_item)
        end
    end
end

function WorldItemController:getWorldItem(id)
    return self.worldItems:getById(id)
end

function WorldItemController:getWorldItems()
    return self.worldItems:getAll()
end

function WorldItemController:takeNearestWorldItem(player)
    local user_id = vRP.getUserId(player)
    if user_id then
        local world_item = self.worldItems:getNearestToPlayer(player, 2)
        if world_item then
            local inventory_remaining_weight = vRP.getInventoryMaxWeight(user_id) - vRP.getInventoryWeight(user_id)
            local take_amount = math.min(math.floor(inventory_remaining_weight / world_item.weight), world_item.amount)
            if take_amount > 0 then
                vRP.giveInventoryItem(user_id, world_item.idName, take_amount, true)
                vRPclient._playAnim(player, true, {{'pickup_object', 'pickup_low', 1}}, false)
                self:updateWorldItemAmount(world_item.id, world_item.amount - take_amount)
            else
                vRPclient._notify(player, '~r~Inventory full')
            end
        end
    end
end

return WorldItemController
