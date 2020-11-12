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

## Overview
`vrp_worlditems` é um resource [vRP](https://github.com/ImagicTheCat/vRP/tree/1.0) para [FiveM](http://fivem.net/) que cria itens relacionados a props.

[![Showcase](https://yt-embed.herokuapp.com/embed?v=je4q3Ym9Up4)](https://youtu.be/je4q3Ym9Up4)

## Installation

1. Certifique-se que seus artefatos ([windows](https://runtime.fivem.net/artifacts/fivem/build_server_windows/master) ou [linux](https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master)) estejam atualizados.
2. Baixe o último arquivo zip em [releases](https://github.com/jaimeadf/vrp_worlditems/releases) e extraia na sua pasta resources.
3. Adicione `ensure vrp_worlditems` no seu `server.cfg`.
4. Configure os modelos dos itens e o tempo de despawn no arquivo `config.json`.

## API

### Server

#### createWorldItem(player, item_id_name, item_amount, position)
Cria um [world item](#payload-do-world-item) na posição especificada ou, se não passada, na posição atual do player e o retorna.

Argumentos:
* **player**: number
* **item_id_name**: string
* **item_amount**: number
* **position**: vector3

#### deleteWorldItem(id)
Deleta o world item com o id.

Argumentos:
* **id**: string

#### updateWorldItemAmount(id, amount)
Atualiza a quantidade do [world item](#payload-do-world-item) com o id.

Argumentos:
* **id**: string
* **amount**: number

#### getWorldItem(id)
Retorna o [world item](#payload-do-world-item) com o id ou `nil` se não encontrado.

Argumentos:
* **id**: string

#### getWorldItems()
Retorna uma lista com todos os [world items](#payload-do-world-item).

## Payload do World Item
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

## Dependências
* [vRP](https://github.com/ImagicTheCat/vRP/tree/1.0)

## Issues

Reporte qualquer problema que tiver e tente fornecer todas as informações sobre ele.

## Contribuindo

Sinta-se livre para contribuir e melhorar o código e o repositório.
