# vrp_worlditems

<p>
    <a href="https://github.com/jaimeadf/vrp_worlditems/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="License">
    </a>
</p>

<p>
    <a href="https://discord.gg/z6Yx9A8VDR">
        <img src="https://discordapp.com/api/guilds/514185816315265068/widget.png?style=banner2" alt="Chat">
    </a>
</p>

https://discord.gg/z6Yx9A8VDR

You can also read this README in [Portuguese](https://github.com/jaimeadf/vrp_worlditems/blob/master/README.pt.md).

## Overview
`vrp_worlditems` is a [vRP](https://github.com/ImagicTheCat/vRP/tree/1.0) resource for [FiveM](http://fivem.net/) that creates items related to props.

[![Showcase](https://yt-embed.herokuapp.com/embed?v=je4q3Ym9Up4)](https://youtu.be/je4q3Ym9Up4)

## Installation

1. Make sure your artifacts ([windows](https://runtime.fivem.net/artifacts/fivem/build_server_windows/master) or [linux](https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master)) are up to date and `onesync` is activated.
2. Download the latest zip file at [releases](https://github.com/jaimeadf/vrp_worlditems/releases) and extract it at your resources folder.
3. Add `ensure vrp_worlditems` in your `server.cfg`.
4. Configure the item models and the despawn time in the `config.json` file.

## API

### Server

#### createWorldItem(player, item_id_name, item_amount, position)
Creates a [world item](#world-item-payload) in the specified position or, if not passed, in the current player's position and returns it.

Arguments:
* **player**: number
* **item_id_name**: string
* **item_amount**: number
* **position**: vector3

Example:
```lua
local world_item = exports['vrp_worlditems']:createWorldItem(GetPlayers()[1], 'donut', 3, vector3(393.26, -1813.78, 28.99))
print(json.encode(world_item, {
    indent = true
}))
```

#### deleteWorldItem(id)
Delete the [world item](#world-item-payload) with the specified id.

Arguments:
* **id**: string

Example:
```lua
local world_item = exports['vrp_worlditems']:createWorldItem(GetPlayers()[1], 'donut', 3)
SetTimeout(15000, function () 
    exports['vrp_worlditems']:deleteWorldItem(world_item.id)
end)
```

#### updateWorldItemAmount(id, amount)
Update the [world item](#world-item-payload) amount with the specified id.

Arguments:
* **id**: string
* **amount**: number

Example:
```lua
local world_item = exports['vrp_worlditems']:createWorldItem(GetPlayers()[1], 'donut', 3)
SetTimeout(5000, function () 
    exports['vrp_worlditems']:updateWorldItemAmount(world_item.id, 10)
end)
```

#### getWorldItem(id)
Returns a [world item](#world-item-payload) with the specified id or `nil` if not found.

Arguments:
* **id**: string

Example:
```lua
local world_item = exports['vrp_worlditems']:getWorldItem('0e2a7230-407f-4cc6-8aab-c490c0deb876')
print(json.encode(world_item, {
    indent = true
}))
```

#### getWorldItems()
Returns a list with all the [world items](#world-item-payload).

Example:
```lua
local world_items = exports['vrp_worlditems']:getWorldItems()
print(json.encode(world_items, {
    indent = true
}))
```

## World Item Payload
* **id**: string
* **idName**: string
* **name**: string
* **description**: string
* **weight**: number
* **amount**: number
* **prop**:
    * **entityId**: number
    * **networkId**: number
    * **position**: vector3

## Dependencies
* [vRP](https://github.com/ImagicTheCat/vRP/tree/1.0)

## Issues

Report any problem you have and try to provide all information about it.

## Contributing

Feel free to contribute and improve the code and the repository.

