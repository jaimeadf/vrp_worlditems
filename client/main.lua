local Tunnel = module('vrp', 'lib/Tunnel')
local PropService = require('client/services/PropSpawnService')
local WorldItemService = require('client/services/WorldItemService')

local tunnel = {}
Tunnel.bindInterface('vrp_worlditems', tunnel)

local prop_service = PropService(tunnel)
local world_item_service = WorldItemService(tunnel)

prop_service:start()
world_item_service:start()
