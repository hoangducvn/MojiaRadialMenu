fx_version 'adamant'
game "gta5"

version '1.0.0'
description 'QB-NewRadialMenu'

ui_page 'html/ui.html'

client_scripts {
    'client/*.lua',
	'config.lua',
}

server_scripts {
    'server/*.lua',
}

files {
	"html/ui.html",
	"html/css/RadialMenu.css",
	"html/js/RadialMenu.js",
}


