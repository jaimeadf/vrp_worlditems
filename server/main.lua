local Proxy = module('lib/Proxy')
local Tunnel = module('lib/Tunnel')
local Config = require('server/Config')
local ItemManager = require('server/managers/ItemManager')
local PropManager = require('server/managers/PropManager')
local WorldItemManager = require('server/managers/WorldItemManager')
local WorldItemController = require('server/controllers/WorldItemController')

Client = Tunnel.getInterface('vrp_worlditems')

vRP = Proxy.getInterface('vRP')
vRPclient = Tunnel.getInterface('vRP')

local jsonConfig = json.decode(LoadResourceFile(GetCurrentResourceName(), 'config.json'))
local config = Config(jsonConfig.despawnTime, jsonConfig.itemModels)

local item_manager = ItemManager()
local prop_manager = PropManager()
local world_item_manager = WorldItemManager()

local world_item_controller = WorldItemController(config, item_manager, prop_manager, world_item_manager)
world_item_controller:start()

