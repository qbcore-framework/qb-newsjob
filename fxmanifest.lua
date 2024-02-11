fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Kakarot'
description 'Allows players to play as a news reporter and access the equipment for it'
version '1.3.0'

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
}

client_scripts {
    'client/main.lua',
    'client/camera.lua',
}

server_script 'server/main.lua'
