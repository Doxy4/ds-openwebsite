fx_version 'cerulean'
game 'gta5'

description 'DS-OpenWebsite'
version '1.0'

escrow_ignore {
    'config.lua',
    'fxmanifest.lua',
    'client/main.lua',
    'ui/dashboard.html',
}

shared_scripts {
    'config.lua',
}

client_script 'client/main.lua'

ui_page 'ui/dashboard.html'

files {
    'ui/dashboard.html',
}

lua54 'yes'
