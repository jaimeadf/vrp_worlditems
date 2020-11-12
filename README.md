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

## Installation

1. Make sure you artifacts ([windows](https://runtime.fivem.net/artifacts/fivem/build_server_windows/master) or [linux](https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master)) are up to date.
2. Download the latest zip file at [releases](https://github.com/jaimeadf/vrp_worlditems/releases) and extract it at your resources folder.
3. Add `ensure vrp_worlditems` in your `server.cfg`.
4. Configure the item models and the despawn time in the `config.json` file.

## API

### Structure of a World Item
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

### Server

#### createWorldItem(player, item_id_name, item_amount, position)
Creates a [world item](#structure-of-a-world-item) in the specified position or, if not passed, in the current player's position and returns it.

Arguments:
* **player**: number
* **item_id_name**: string
* **item_amount**: number
* **position**: vector3

#### deleteWorldItem(id)
Delete the [world item](#structure-of-a-world-item) with the specified id.

Arguments:
* **id**: string

#### updateWorldItemAmount(id, amount)
Update the [world item](#structure-of-a-world-item) amount with the specified id.

Arguments:
* **id**: string
* **amount**: number

#### getWorldItem(id)
Returns a [world item](#structure-of-a-world-item) with the specified id or `nil` if not found.

Arguments:
* **id**: string

#### getWorldItems()
Returns a list with all the [world items](#structure-of-a-world-item).

## Dependencies
* [vRP](https://github.com/ImagicTheCat/vRP/tree/1.0)

## Issues

Report any problem you have and try to provide all information about it.

## Contributing

Feel free to contribute and improve the code and the repository.

