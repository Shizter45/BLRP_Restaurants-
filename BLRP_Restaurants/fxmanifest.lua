fx_version 'cerulean'
game 'gta5'

-- Resource Metadata
name 'Blueline RP Restaurants'
author 'Bobby2023'
description 'A script to place at restaurants (such as Wing Stop and In & Out) where a marker is drawn and when the player enters the marker they can press a button to open the food menu for that particular restaurant.'
version 'v1.0.0'

-- What to run
client_scripts {
    'Client/main.lua',
    'config.lua'
}

server_scripts {
    'Server/main.lua',
    'config.lua'
}
