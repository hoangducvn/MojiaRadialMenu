local QBCore = exports['qb-core']:GetCoreObject()
local invisible = false
local godmode = false
local vehicles = {}
local showCoords = false
local vehicleDevMode = false
local deleteLazer = false

RegisterNetEvent('MojiaRadialMenu:client:ToggleNoClipMode', function()
	ToggleNoClipMode()
end)

RegisterNetEvent('MojiaRadialMenu:client:ReviveSelf', function()
    TriggerEvent('hospital:client:Revive', PlayerPedId())
end)

RegisterNetEvent('MojiaRadialMenu:client:Invisible', function()
    if not invisible then
        invisible = true
        SetEntityVisible(PlayerPedId(), false, 0)
    else
        invisible = false
        SetEntityVisible(PlayerPedId(), true, 0)
    end
end)

RegisterNetEvent('MojiaRadialMenu:client:GodMode', function()
    godmode = not godmode
    if godmode then
        while godmode do
            Wait(0)
            SetPlayerInvincible(PlayerId(), true)
        end
        SetPlayerInvincible(PlayerId(), false)
    end
end)

for k, v in pairs(QBCore.Shared.Vehicles) do
	local category = v["category"]
	if vehicles[category] == nil then
		vehicles[category] = { }
	end
	vehicles[category][k] = v
end

RegisterNetEvent('MojiaRadialMenu:client:VehiclesCategoryMenu', function()
	local CategoryMenu = {
		{
			header = 'Vehicles Category',
			isMenuHeader = true
		},
	}
    for k, v in pairs(vehicles) do
        table.insert(CategoryMenu, {
			header = k,
			txt = k..' Vehicles List',
			params = {
				event = "MojiaRadialMenu:client:OpenCarModelsMenu",
				args = v
			}
		})
    end
	table.insert(CategoryMenu, {
		header = 'Close',
		txt = "",
		params = {
			event = "qb-menu:closeMenu",
		}
	})
	exports['qb-menu']:openMenu(CategoryMenu)
end)



RegisterNetEvent('MojiaRadialMenu:client:OpenCarModelsMenu', function(category)
   local CarModelsMenu = {
		{
			header = 'Vehicles List',
			isMenuHeader = true
		},
	}
	
    for k, v in pairs(category) do
        table.insert(CarModelsMenu, {
			header = v["name"],
			txt = 'Spawn ' .. v["name"],
			params = {
				event = "MojiaRadialMenu:client:SpawnVehicle",
				args = k
			}
		})
    end
	table.insert(CarModelsMenu, {
		header = 'Back',
		txt = "",
		params = {
			event = "MojiaRadialMenu:client:VehiclesCategoryMenu"
		}
	})
	table.insert(CarModelsMenu, {
		header = 'Close',
		txt = "",
		params = {
			event = "qb-menu:closeMenu",
		}
	})
	exports['qb-menu']:openMenu(CarModelsMenu)
end)

RegisterNetEvent('MojiaRadialMenu:client:SpawnVehicle', function(vehicles)
    TriggerServerEvent('QBCore:CallCommand', "car", {vehicles})
end)

RegisterNetEvent('MojiaRadialMenu:client:FixVehicle', function()
    TriggerServerEvent('QBCore:CallCommand', "fix", {})
end)

RegisterNetEvent('MojiaRadialMenu:client:BuyVehicle', function()
    TriggerServerEvent('QBCore:CallCommand', "admincar", {})
end)

RegisterNetEvent('MojiaRadialMenu:client:DeleteVehicle', function()
    TriggerServerEvent('QBCore:CallCommand', "dv", {})
end)

RegisterNetEvent('MojiaRadialMenu:client:PlayerList', function()	
	QBCore.Functions.TriggerCallback('MojiaRadialMenu:getplayers', function(players)
        local PlayerList = {
			{
				header = '👨🏻‍🤝‍👨🏼|Player List',
				isMenuHeader = true
			},
		}
		for k, v in pairs(players) do
			table.insert(PlayerList, {
				header = 'ID:' .. v["id"] .. ' | ' .. v["name"],
				txt = '',
				params = {
					event = "MojiaRadialMenu:client:OpenPlayerMenus",
					args = v
				}
			})
        end
		table.insert(PlayerList, {
			header = 'Close',
			txt = "",
			params = {
				event = "qb-menu:closeMenu",
			}
		})
		exports['qb-menu']:openMenu(PlayerList)
    end)
	
end)

RegisterNetEvent('MojiaRadialMenu:client:OpenPlayerMenus', function(player)
	local PlayerMenus = {
		{
			header = '👨🏻‍🤝‍👨🏼|Player '..player["name"],
			isMenuHeader = true
		},
	}
	table.insert(PlayerMenus, {
		header = '💀 | Kill',
		txt = "Kill " .. player.cid,
		params = {
			event = 'hospital:client:KillPlayer',
			args = player.id
		}
	})
	table.insert(PlayerMenus, {
		header = '🏥 | Revive',
		txt = "Revive " .. player.cid,
		params = {
			event = 'hospital:client:Revive',
			args = player.id
		}
	})
	table.insert(PlayerMenus, {
		header = '🥶 | Freeze',
		txt = "Freeze " .. player.cid,
		params = {
			event = 'MojiaRadialMenu:menu:freeze',
			args = player
		}
	})
	table.insert(PlayerMenus, {
		header = '👀 | Spectate',
		txt = "Spectate " .. player.cid,
		params = {
			event = 'MojiaRadialMenu:menu:spectate',
			args = player
		}
	})
	table.insert(PlayerMenus, {
		header = '➡️ | Go To',
		txt = "Go to " .. player.cid .. " Position",
		params = {
			event = 'MojiaRadialMenu:menu:goto',
			args = player
		}
	})
	table.insert(PlayerMenus, {
		header = '⬅️ | Bring',
		txt = "Bring " .. player.cid .. " to your position",
		params = {
			event = 'MojiaRadialMenu:menu:bring',
			args = player
		}
	})
	table.insert(PlayerMenus, {
		header = '🚗 | Sit in vehicle',
		txt = "Sit in " .. player.cid .. "'s vehicle",
		params = {
			event = 'MojiaRadialMenu:menu:intovehicle',
			args = player
		}
	})
	table.insert(PlayerMenus, {
		header = '🎒 | Open Inventory',
		txt = "Open " .. player.cid .. " inventorys",
		params = {
			event = 'MojiaRadialMenu:client:inventory',
			args = player.id
		}
	})
	table.insert(PlayerMenus, {
		header = '👕 | Give Clothing Menu',
		txt = "Give the Cloth menu to " .. player.cid,
		params = {
			event = 'qb-clothing:client:openMenu',
			args = player.id
		}
	})
	table.insert(PlayerMenus, {
		header = '🥾 | Kick',
		txt = "Kick " .. player.cid .. " you need to give a reason",
		params = {
			event = 'MojiaRadialMenu:menu:OpenKickMenu',
			args = player
		}
	})
	table.insert(PlayerMenus, {
		header = '🚫 | Ban',
		txt = "Ban " .. player.cid .. " you need to give a reason",
		params = {
			event = 'MojiaRadialMenu:menu:OpenBanMenu',
			args = player
		}
	})
	table.insert(PlayerMenus, {
		header = '🎟️ | Permissions',
		txt = "Give " .. player.cid .. " Permissions",
		params = {
			event = 'MojiaRadialMenu:menu:OpenPermsMenu',
			args = player
		}
	})
	table.insert(PlayerMenus, {
		header = 'Back',
		txt = "",
		params = {
			event = 'MojiaRadialMenu:client:PlayerList',
		}
	})
	table.insert(PlayerMenus, {
		header = 'Close',
		txt = "",
		params = {
			event = "qb-menu:closeMenu",
		}
	})
	exports['qb-menu']:openMenu(PlayerMenus)
end)

RegisterNetEvent('MojiaRadialMenu:menu:OpenKickMenu', function (kickplayer)
	local dialog = exports['qb-input']:ShowInput({
        header = 'Kick ' .. kickplayer["name"],
        submitText = "Confirm",
        inputs = {
            {
                type = 'text',
                isRequired = true,
                name = 'kickreason',
                text = 'Kick Reason'
            }
        }
    })
    if dialog then
        if not dialog.kickreason then return end
        TriggerServerEvent('MojiaRadialMenu:server:kick', kickplayer.id, dialog.kickreason)
    end
end)

RegisterNetEvent('MojiaRadialMenu:menu:OpenBanMenu', function (banplayer)
	local dialog = exports['qb-input']:ShowInput({
        header = 'Ban' .. banplayer["name"],
        submitText = "Confirm",
        inputs = {
            {
                type = 'text',
                isRequired = true,
                name = 'banreason',
                text = 'Ban Reason'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'banlength',
                text = 'Time to ban(1h = 3600)'
            }
        }
    })
    if dialog then
        if not dialog.banreason or not dialog.banlength then return end
        TriggerServerEvent('MojiaRadialMenu:server:ban', banplayer.id, dialog.banlength, dialog.banreason)
    end
end)

RegisterNetEvent('MojiaRadialMenu:menu:OpenPermsMenu', function (permsply)
    QBCore.Functions.TriggerCallback('MojiaRadialMenu:server:getrank', function(rank)
        if rank then
            local dialog = exports['qb-input']:ShowInput({
				header = 'Give the permission for ' .. permsply["name"],
				submitText = "Confirm",
				inputs = {
					{
						type = 'text',
						isRequired = true,
						name = 'group',
						text = 'god|admin|user'
					}
				}
			})
			if dialog then
				if not dialog.group then return end
				if dialog.group == 'god' or dialog.group == 'admin' or dialog.group == 'user' then
					TriggerServerEvent('MojiaRadialMenu:server:setPermissions', permsply.id, dialog.group)
					QBCore.Functions.Notify('Authority group changed!', 'success')
				else
					QBCore.Functions.Notify('Choose a group!', 'error')
				end
			end
        end
    end)
end)

RegisterNetEvent('MojiaRadialMenu:menu:freeze', function(player)
    TriggerServerEvent('MojiaRadialMenu:server:freeze', player)
end)

RegisterNetEvent('MojiaRadialMenu:menu:spectate', function(player)
    TriggerServerEvent('MojiaRadialMenu:server:spectate', player)
end)

RegisterNetEvent('MojiaRadialMenu:menu:goto', function(player)
    TriggerServerEvent('MojiaRadialMenu:server:goto', player)
end)

RegisterNetEvent('MojiaRadialMenu:menu:bring', function(player)
    TriggerServerEvent('MojiaRadialMenu:server:bring', player)
end)

RegisterNetEvent('MojiaRadialMenu:menu:intovehicle', function(player)
    TriggerServerEvent('MojiaRadialMenu:server:intovehicle', player)
end)

RegisterNetEvent('MojiaRadialMenu:client:inventory', function(targetPed)
    TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", targetPed)
end)

local function Draw2DText(content, font, colour, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1],colour[2],colour[3], 255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(x, y)
end

local function ToggleShowCoordinates()
    local x = 0.4
    local y = 0.025
    showCoords = not showCoords
    CreateThread(function()
        while showCoords do
            local coords = GetEntityCoords(PlayerPedId())
            local heading = GetEntityHeading(PlayerPedId())
            local c = {}
            c.x = round(coords.x, 2)
            c.y = round(coords.y, 2)
            c.z = round(coords.z, 2)
            heading = round(heading, 2)
            Wait(0)
            Draw2DText(string.format('~w~Ped Coordinates:~b~ vector4(~w~%s~b~, ~w~%s~b~, ~w~%s~b~, ~w~%s~b~)', c.x, c.y, c.z, heading), 4, {66, 182, 245}, 0.4, x + 0.0, y + 0.0)
        end
    end)
end

RegisterNetEvent('MojiaRadialMenu:client:ToggleCoords', function()
    ToggleShowCoordinates()
end)

local function ToggleVehicleDeveloperMode()
    local x = 0.4
    local y = 0.888
    vehicleDevMode = not vehicleDevMode
    CreateThread(function()
        while vehicleDevMode do
            local ped = PlayerPedId()
            Wait(0)
            if IsPedInAnyVehicle(ped, false) then
                local vehicle = GetVehiclePedIsIn(ped, false)
                local netID = VehToNet(vehicle)
                local hash = GetEntityModel(vehicle)
                local modelName = GetLabelText(GetDisplayNameFromVehicleModel(hash))
                local eHealth = GetVehicleEngineHealth(vehicle)
                local bHealth = GetVehicleBodyHealth(vehicle)
                Draw2DText('Vehicle Developer Data:', 4, {66, 182, 245}, 0.4, x + 0.0, y + 0.0)
                Draw2DText(string.format('Entity ID: ~b~%s~s~ | Net ID: ~b~%s~s~', vehicle, netID), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.025)
                Draw2DText(string.format('Model: ~b~%s~s~ | Hash: ~b~%s~s~', modelName, hash), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.050)
                Draw2DText(string.format('Engine Health: ~b~%s~s~ | Body Health: ~b~%s~s~', round(eHealth, 2), round(bHealth, 2)), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.075)
            end
        end
    end)
end

RegisterNetEvent('MojiaRadialMenu:client:ToggleVehicleDeveloperMode', function()
    ToggleVehicleDeveloperMode()
end)

RegisterNetEvent('MojiaRadialMenu:client:WeatherMenu', function()	
	local WeatherMenu = {
		{
			header = '☁ | Weather Menu',
			isMenuHeader = true
		},
	}
	table.insert(WeatherMenu, {
		header = '☀️ | Extra Sunny',
		txt = 'I\'m Melting!',
		params = {
			event = 'MojiaRadialMenu:client:SetWeather',
			args = {
				label = 'Extra Sunny',
				value = "EXTRASUNNY",
			}
		}
	})
	table.insert(WeatherMenu, {
		header = '☀️ | Clear',
		txt = 'The Perfect Day!',
		params = {
			event = 'MojiaRadialMenu:client:SetWeather',
			args = {
				label = 'Clear',
				value = "CLEAR",
			}
		}
	})
	table.insert(WeatherMenu, {
		header = '☀️ | Neutral',
		txt = 'Just A Regular Day!',
		params = {
			event = 'MojiaRadialMenu:client:SetWeather',
			args = {
				label = 'Neutral',
				value = "NEUTRAL",
			}
		}
	})
	table.insert(WeatherMenu, {
		header = '🌁 | Smog',
		txt = 'Smoke Machine!',
		params = {
			event = 'MojiaRadialMenu:client:SetWeather',
			args = {
				label = 'Smog',
				value = "SMOG",
			}
		}
	})
	table.insert(WeatherMenu, {
		header = '🌫️ | Foggy',
		txt = 'Smoke Machine x2!',
		params = {
			event = 'MojiaRadialMenu:client:SetWeather',
			args = {
				label = 'Foggy',
				value = "FOGGY",
			}
		}
	})
	table.insert(WeatherMenu, {
		header = '⛅ | Overcast',
		txt = 'Not Too Sunny!',
		params = {
			event = 'MojiaRadialMenu:client:SetWeather',
			args = {
				label = 'Overcast',
				value = "OVERCAST",
			}
		}
	})
	table.insert(WeatherMenu, {
		header = '☁️ | Clouds',
		txt = 'Where\'s The Sun?',
		params = {
			event = 'MojiaRadialMenu:client:SetWeather',
			args = {
				label = 'Clouds',
				value = "CLOUDS",
			}
		}
	})
	table.insert(WeatherMenu, {
		header = '🌤️ | Clearing',
		txt = 'Clouds Start To Clear!',
		params = {
			event = 'MojiaRadialMenu:client:SetWeather',
			args = {
				label = 'Clearing',
				value = "CLEARING",
			}
		}
	})
	table.insert(WeatherMenu, {
		header = '☂️ | Rain',
		txt = 'Make It Rain!',
		params = {
			event = 'MojiaRadialMenu:client:SetWeather',
			args = {
				label = 'Rain',
				value = "RAIN",
			}
		}
	})
	table.insert(WeatherMenu, {
		header = '⛈️ | Thunder',
		txt = 'Run and Hide!',
		params = {
			event = 'MojiaRadialMenu:client:SetWeather',
			args = {
				label = 'Thunder',
				value = "THUNDER",
			}
		}
	})
	table.insert(WeatherMenu, {
		header = '❄️ | Snow',
		txt = 'Is It Cold Out Here?',
		params = {
			event = 'MojiaRadialMenu:client:SetWeather',
			args = {
				label = 'Snow',
				value = "SNOW",
			}
		}
	})
	table.insert(WeatherMenu, {
		header = '🌨️ | Blizzard',
		txt = 'Snow Machine?',
		params = {
			event = 'MojiaRadialMenu:client:SetWeather',
			args = {
				label = 'Blizzard',
				value = "BLIZZARD",
			}
		}
	})
	table.insert(WeatherMenu, {
		header = '❄️ | Light Snow',
		txt = 'Starting To Feel Like Christmas!',
		params = {
			event = 'MojiaRadialMenu:client:SetWeather',
			args = {
				label = 'Light Snow',
				value = "SNOWLIGHT",
			}
		}
	})
	table.insert(WeatherMenu, {
		header = '🌨️ | Heavy Snow (XMAS)',
		txt = 'Snowball Fight!',
		params = {
			event = 'MojiaRadialMenu:client:SetWeather',
			args = {
				label = 'Heavy Snow (XMAS)',
				value = "XMAS",
			}
		}
	})
	table.insert(WeatherMenu, {
		header = '🎃 | Halloween',
		txt = 'What Was That Noise?!',
		params = {
			event = 'MojiaRadialMenu:client:SetWeather',
			args = {
				label = 'Halloween',
				value = "HALLOWEEN",
			}
		}
	})
	table.insert(WeatherMenu, {
		header = 'Close',
		txt = "",
		params = {
			event = "qb-menu:closeMenu",
		}
	})
	exports['qb-menu']:openMenu(WeatherMenu)
end)

RegisterNetEvent('MojiaRadialMenu:client:SetWeather', function(data)
	TriggerServerEvent('qb-weathersync:server:setWeather', data.value)
	QBCore.Functions.Notify('Weather Changed To: '..data.label)
end)

RegisterNetEvent('MojiaRadialMenu:client:SetTime', function(value)
    TriggerServerEvent("qb-weathersync:server:setTime", value, value)
    QBCore.Functions.Notify("Time changed to " .. value .. " hs 00 min")
end)

RegisterNetEvent('MojiaRadialMenu:client:DealerList', function()
    QBCore.Functions.TriggerCallback('MojiaRadialMenu:getdealers', function(dealers)
        local DealerList = {
			{
				header = '💊 | Dealer List',
				isMenuHeader = true
			},
		}
		for k, v in pairs(dealers) do
            table.insert(PlayerList, {
				header = v["name"],
				txt = 'Edit Dealer ' .. v["name"],
				params = {
					event = "MojiaRadialMenu:client:OpenDealerMenu",
					args = v
				}
			})
        end
		table.insert(DealerList, {
		header = 'Close',
		txt = "",
		params = {
			event = "qb-menu:closeMenu",
		}
	})
	exports['qb-menu']:openMenu(DealerList)
    end)
end)

RegisterNetEvent('MojiaRadialMenu:client:OpenDealerMenu', function(dealer)
    local DealerMenu = {
		{
			header = '💊 | Edit Dealer ' .. dealer["name"],
			isMenuHeader = true
		},
	}
	table.insert(DealerMenu, {
		header = '➡️ | Go to',
		txt = "Goto dealer " .. dealer["name"],
		params = {
			event = 'MojiaRadialMenu:client:EditDealer',
			args = {
				cm = "dealergoto",
				dl = dealer["name"],
			}
		}
	})
	table.insert(DealerMenu, {
		header = '☠ | Remove',
		txt = "Remove dealer " .. dealer["name"],
		params = {
			event = 'MojiaRadialMenu:client:EditDealer',
			args = {
				cm = "deletedealer",
				dl = dealer["name"],
			}
		}
	})
	table.insert(DealerMenu, {
		header = 'Back',
		txt = "",
		params = {
			event = 'MojiaRadialMenu:client:DealerList',
		}
	})
	table.insert(DealerMenu, {
		header = 'Close',
		txt = "",
		params = {
			event = "qb-menu:closeMenu",
		}
	})
	exports['qb-menu']:openMenu(DealerMenu)
end)

RegisterNetEvent('MojiaRadialMenu:client:EditDealer', function(data)
    TriggerServerEvent('QBCore:CallCommand', data.cm, {data.dl})
end)

RegisterNetEvent('MojiaRadialMenu:client:deleteLazer', function()
    deleteLazer = not deleteLazer
end)

local function RotationToDirection(rotation)
	local adjustedRotation =
	{
		x = (math.pi / 180) * rotation.x,
		y = (math.pi / 180) * rotation.y,
		z = (math.pi / 180) * rotation.z
	}
	local direction =
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

local function RayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination =
	{
		x = cameraCoord.x + direction.x * distance,
		y = cameraCoord.y + direction.y * distance,
		z = cameraCoord.z + direction.z * distance
	}
	local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
	return b, c, e
end

local function DrawEntityBoundingBox(entity, color)
    local model = GetEntityModel(entity)
    local min, max = GetModelDimensions(model)
    local rightVector, forwardVector, upVector, position = GetEntityMatrix(entity)

    -- Calculate size
    local dim =
	{
		x = 0.5*(max.x - min.x),
		y = 0.5*(max.y - min.y),
		z = 0.5*(max.z - min.z)
	}

    local FUR =
    {
		x = position.x + dim.y*rightVector.x + dim.x*forwardVector.x + dim.z*upVector.x,
		y = position.y + dim.y*rightVector.y + dim.x*forwardVector.y + dim.z*upVector.y,
		z = 0
    }

    local FUR_bool, FUR_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    FUR.z = FUR_z
    FUR.z = FUR.z + 2 * dim.z

    local BLL =
    {
        x = position.x - dim.y*rightVector.x - dim.x*forwardVector.x - dim.z*upVector.x,
        y = position.y - dim.y*rightVector.y - dim.x*forwardVector.y - dim.z*upVector.y,
        z = 0
    }
    local BLL_bool, BLL_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    BLL.z = BLL_z

    -- DEBUG
    local edge1 = BLL
    local edge5 = FUR

    local edge2 =
    {
        x = edge1.x + 2 * dim.y*rightVector.x,
        y = edge1.y + 2 * dim.y*rightVector.y,
        z = edge1.z + 2 * dim.y*rightVector.z
    }

    local edge3 =
    {
        x = edge2.x + 2 * dim.z*upVector.x,
        y = edge2.y + 2 * dim.z*upVector.y,
        z = edge2.z + 2 * dim.z*upVector.z
    }

    local edge4 =
    {
        x = edge1.x + 2 * dim.z*upVector.x,
        y = edge1.y + 2 * dim.z*upVector.y,
        z = edge1.z + 2 * dim.z*upVector.z
    }

    local edge6 =
    {
        x = edge5.x - 2 * dim.y*rightVector.x,
        y = edge5.y - 2 * dim.y*rightVector.y,
        z = edge5.z - 2 * dim.y*rightVector.z
    }

    local edge7 =
    {
        x = edge6.x - 2 * dim.z*upVector.x,
        y = edge6.y - 2 * dim.z*upVector.y,
        z = edge6.z - 2 * dim.z*upVector.z
    }

    local edge8 =
    {
        x = edge5.x - 2 * dim.z*upVector.x,
        y = edge5.y - 2 * dim.z*upVector.y,
        z = edge5.z - 2 * dim.z*upVector.z
    }

    DrawLine(edge1.x, edge1.y, edge1.z, edge2.x, edge2.y, edge2.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge3.x, edge3.y, edge3.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge6.x, edge6.y, edge6.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge7.x, edge7.y, edge7.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge5.x, edge5.y, edge5.z, color.r, color.g, color.b, color.a)
    DrawLine(edge4.x, edge4.y, edge4.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
end

CreateThread(function()	-- While loop needed for delete lazer
	while true do
		sleep = 1000
		if deleteLazer then
		    sleep = 7
		    local color = {r = 255, g = 255, b = 255, a = 200}
		    local position = GetEntityCoords(PlayerPedId())
		    local hit, coords, entity = RayCastGamePlayCamera(1000.0)
		    -- If entity is found then verifie entity
		    if hit and (IsEntityAVehicle(entity) or IsEntityAPed(entity) or IsEntityAnObject(entity)) then
			local entityCoord = GetEntityCoords(entity)
			local minimum, maximum = GetModelDimensions(GetEntityModel(entity))
			DrawEntityBoundingBox(entity, color)
			DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
			Draw2DText('Obj: ~b~' .. entity .. '~w~ Model: ~b~' .. GetEntityModel(entity), 4, {255, 255, 255}, 0.4, 0.55, 0.888)
			Draw2DText('If you want to delete the object click on ~g~E', 4, {255, 255, 255}, 0.4, 0.55, 0.888 + 0.025)
			-- When E pressed then remove targeted entity
			if IsControlJustReleased(0, 38) then
			    -- Set as missionEntity so the object can be remove (Even map objects)
			    SetEntityAsMissionEntity(entity, true, true)
			    --SetEntityAsNoLongerNeeded(entity)
			    --RequestNetworkControl(entity)
			    DeleteEntity(entity)
			end
		    -- Only draw of not center of map
		    elseif coords.x ~= 0.0 and coords.y ~= 0.0 then
			-- Draws line to targeted position
			DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
			DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.1, 0.1, 0.1, color.r, color.g, color.b, color.a, false, true, 2, nil, nil, false)
		    end
		end
		Wait(sleep)
	end
end)