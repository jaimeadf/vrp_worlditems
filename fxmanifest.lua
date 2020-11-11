fx_version 'cerulean'
game 'gta5'

author 'Jaime Filho <https://github.com/jaimeadf>'
description 'A vRP resource for FiveM and RedM that create items in the world'
version '0.9.0'
url 'https://github.com/jaimeadf/vrp_worlditems'

server_scripts {
    '@vrp/lib/utils.lua',
    'common/utils/utils.lua',
    'server/main.lua'
}

client_scripts {
    '@vrp/lib/utils.lua',
    'common/utils/utils.lua',
    'client/main.lua'
}

files {
    'common/**/*.lua',
    'client/**/*.lua'
}
