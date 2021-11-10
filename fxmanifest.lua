fx_version 'cerulean'
game 'gta5'

description 'QB-NewsJob'
version '1.0.1'

shared_script 'config.lua'

client_scripts {
    'client/main.lua',
    'client/camera.lua',
}

server_script 'server/main.lua'

lua54 'yes'