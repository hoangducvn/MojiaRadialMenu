fx_version 'adamant'

game "gta5"

ui_page 'html/ui.html'
--[[
shared_scripts {
	'config.lua',
}
]]--

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


