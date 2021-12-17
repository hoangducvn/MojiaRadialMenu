local QBCore = exports['MojiaCity']:GetCoreObject()

Config = {}

Config.MainMenu = {
	---------------------------------------------------------------------------------
	--								Begin Admin Menu							   --
	---------------------------------------------------------------------------------
	{
		id = 'adminmenu',
		title = QBCore.Shared.MultilLang('admin_menu'),
		icon = '#mj-user-secret',
		enableMenu = function()
			if isGod() or isAdmin() then
				return true
			end
			return false
		end,
		items = {
			--Admin option:
			{
				id = 'admin_options',
				title = QBCore.Shared.MultilLang('admin_options'),
				icon = '#mj-user-secret',
				enableMenu = function()
					if isGod() or isAdmin() then
						return true
					end
					return false
				end,
				items = {
					--Noclip:
					{
						id = 'admin_options1',
						title = QBCore.Shared.MultilLang('noclip'),
						icon = '#mj-diagnoses',
						type = 'client',
						event = 'MojiaRadialMenu:client:ToggleNoClipMode',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					},
					--Revive:
					{
						id = 'admin_options2',
						title = QBCore.Shared.MultilLang('revive'),
						icon = '#mj-heartbeat',
						type = 'client',
						event = 'MojiaRadialMenu:client:ReviveSelf',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					},
					--Invisible
					{
						id = 'admin_options3',
						title = QBCore.Shared.MultilLang('invisible'),
						icon = '#mj-eye-slash',
						type = 'client',
						event = 'MojiaRadialMenu:client:Invisible',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					},
					--Godmode
					{
						id = 'admin_options4',
						title = QBCore.Shared.MultilLang('godmode'),
						icon = '#mj-crown',
						type = 'client',
						event = 'MojiaRadialMenu:client:GodMode',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					}
				}
			},
			
			{
				--Player Management:
				id = 'player_management',
				title = QBCore.Shared.MultilLang('player_management'),
				icon = '#mj-users',
				type = 'client',
				event = 'MojiaRadialMenu:client:PlayerList',
				enableMenu = function()
					if isGod() or isAdmin() then
						return true
					end
					return false
				end
			},
			
			{
				--Server Management:
				id = 'server_management',
				title = QBCore.Shared.MultilLang('server_management'),
				icon = '#mj-planet-ringed',
				type = 'client',
				enableMenu = function()
					if isGod() or isAdmin() then
						return true
					end
					return false
				end,
				items = {
					--Weather Options:
					{
						id = 'server_management1',
						title = QBCore.Shared.MultilLang('weather_options'),
						icon = '#mj-thunderstorm-sun',
						type = 'client',
						event = 'MojiaRadialMenu:client:WeatherMenu',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					},
					--Server Time:
					{
						id = 'server_management2',
						title = QBCore.Shared.MultilLang('server_time'),
						icon = '#mj-clock',
						type = 'client',
						event = 'mojiamenu:client:cancelEmote',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					},
					--Blips:
					{
						id = 'server_management3',
						title = QBCore.Shared.MultilLang('blips'),
						icon = '#mj-map-marked-alt',
						type = 'client',
						event = 'MojiaRadialMenu:client:toggleBlips',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					},
					--Names:
					{
						id = 'server_management4',
						title = QBCore.Shared.MultilLang('names'),
						icon = '#mj-signature',
						type = 'client',
						event = 'MojiaRadialMenu:client:toggleNames',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					}
				}
			},
			
			{
				--Vehicles:
				id = 'vehicles',
				title = QBCore.Shared.MultilLang('vehicles'),
				icon = '#mj-car',
				type = 'client',
				enableMenu = function()
					if isGod() or isAdmin() then
						return true
					end
					return false
				end,
				items = {
					--Spawn Vehicle:
					{
						id = 'vehicles1',
						title = QBCore.Shared.MultilLang('spawn_vehicle'),
						icon = '#mj-map-marker-check',
						type = 'client',
						event = 'MojiaRadialMenu:client:VehiclesCategoryMenu',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					},
					--Fix Vehicle:
					{
						id = 'vehicles2',
						title = QBCore.Shared.MultilLang('fix_vehicle'),
						icon = '#mj-wrench',
						type = 'client',
						event = 'MojiaRadialMenu:client:FixVehicle',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					},
					--Buy Vehicle:
					{
						id = 'vehicles3',
						title = QBCore.Shared.MultilLang('buy_vehicle'),
						icon = '#mj-hand-holding-usd',
						type = 'client',
						event = 'MojiaRadialMenu:client:BuyVehicle',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					},
					--Remove Vehicle:
					{
						id = 'vehicles4',
						title = QBCore.Shared.MultilLang('remove_vehicle'),
						icon = '#mj-parking-slash',
						type = 'client',
						event = 'MojiaRadialMenu:client:DeleteVehicle',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					}
				}
			},
			
			{
				--Dealer List:
				id = 'dealer_list',
				title = QBCore.Shared.MultilLang('dealer_list'),
				icon = '#mj-capsules',
				type = 'client',
				event = 'MojiaRadialMenu:client:DealerList',
				enableMenu = function()
					if isGod() or isAdmin() then
						return true
					end
					return false
				end			
			},
			
			{
				--Developer Options:
				id = 'developer_options',
				title = QBCore.Shared.MultilLang('developer_options'),
				icon = '#mj-code',
				type = 'client',
				enableMenu = function()
					if isGod() or isAdmin() then
						return true
					end
					return false
				end,
				items = {
					--Copy vector2:
					{
						id = 'developer_options2',
						title = QBCore.Shared.MultilLang('copy_vector2'),
						icon = '#mj-location',
						type = 'client',
						event = 'MojiaClipboard:client:copycoords2',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					},
					--Copy vector3:
					{
						id = 'developer_options1',
						title = QBCore.Shared.MultilLang('copy_vector3'),
						icon = '#mj-map-marked-alt',
						type = 'client',
						event = 'MojiaClipboard:client:copycoords3',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					},
					--Copy vector4:
					{
						id = 'developer_options2',
						title = QBCore.Shared.MultilLang('copy_vector4'),
						icon = '#mj-street-view',
						type = 'client',
						event = 'MojiaClipboard:client:copycoords4',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					},
					--Copy Veh Coord:
					{
						id = 'copyvehcoord',
						title = 'Copy Veh Coord',
						icon = '#mj-road',
						type = 'client',
						event = 'MojiaClipboard:client:copyvehcoord',
						enableMenu = function()
							if isGod() or isAdmin() then
								local ped = PlayerPedId()
								if IsPedInAnyVehicle(ped, false) then
									return true
								end
							end
							return false
						end
					},
					--Display Coords:
					{
						id = 'developer_options3',
						title = QBCore.Shared.MultilLang('display_coords'),
						icon = '#mj-map-pin',
						type = 'client',
						event = 'MojiaRadialMenu:client:ToggleCoords',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					},
					--Copy Heading:
					{
						id = 'developer_options4',
						title = QBCore.Shared.MultilLang('copy_heading'),
						icon = '#mj-location-arrow',
						type = 'client',
						event = 'MojiaClipboard:client:copyheading',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					},
					--Vehicle Dev Mode:
					{
						id = 'developer_options5',
						title = QBCore.Shared.MultilLang('vehicle_dev_mode'),
						icon = '#mj-car',
						type = 'client',
						event = 'MojiaRadialMenu:client:ToggleVehicleDeveloperMode',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					},
					--Delete Laser:
					{
						id = 'developer_options6',
						title = QBCore.Shared.MultilLang('delete_laser'),
						icon = '#mj-sword-laser-alt',
						type = 'client',
						event = 'MojiaRadialMenu:client:deleteLazer',
						enableMenu = function()
							if isGod() or isAdmin() then
								return true
							end
							return false
						end
					}
				}
			}
		}
	},
	---------------------------------------------------------------------------------
	--								End Admin Menu								   --
	---------------------------------------------------------------------------------
	
	---------------------------------------------------------------------------------
	--									Begin ATM								   --
	---------------------------------------------------------------------------------
	{
		id = "atm",
		title = QBCore.Shared.MultilLang('atm'),
		icon = '#mj-credit-card',
		type = 'server',
		event = 'ATMs:server:openATM',
		enableMenu = function()
			PlayerData = QBCore.Functions.GetPlayerData()
			if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
				local playerPed = PlayerPedId()
				local playerCoords = GetEntityCoords(playerPed, true)
				for k, v in pairs(ATMModels) do
					local hash = GetHashKey(v)
					local atm = IsObjectNearPoint(hash, playerCoords.x, playerCoords.y, playerCoords.z, 1.5)
					if atm then
						return TriggerServerEvent('MojiaMenu:server:checkCard')
					end
				end
			end
			return false
		end
	},
	---------------------------------------------------------------------------------
	--									End ATM									   --
	---------------------------------------------------------------------------------
	
	---------------------------------------------------------------------------------
	--									Begin Shop								   --
	---------------------------------------------------------------------------------
	{
		id = "shop",
		title = QBCore.Shared.MultilLang('shop'),
		icon = '#mj-shopping-cart',
		type = 'client',
		event = 'Shop:openShop',
		enableMenu = function()
			PlayerData = QBCore.Functions.GetPlayerData()
			if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
				local playerPed = PlayerPedId()
				local playerCoords = GetEntityCoords(playerPed, true)
				for k, v in pairs(ShopLocations) do 
					local shopDist = #(playerCoords - v)
					if shopDist < 1.0 then
						return true
					end
				end
			end
			return false
		end
	},
	---------------------------------------------------------------------------------
	--									End Shop									   --
	---------------------------------------------------------------------------------
	
	---------------------------------------------------------------------------------
	--									Begin Citizen							   --
	---------------------------------------------------------------------------------
	{
        --Citizen:
		id = 'citizen',
        title = QBCore.Shared.MultilLang('citizen'),
        icon = '#mj-user',
		enableMenu = function()
			PlayerData = QBCore.Functions.GetPlayerData()
			if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
				return true
			end
			return false
		end,
        items = {
			--Open Inventory:
			{
				id = 'openinventory',
				title = QBCore.Shared.MultilLang('open_inventory'),
				icon = '#mj-backpack',
				type = 'client',
				event = 'inv:openbag',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
						return true
					end
					return false
				end
			},
			--Mobile:
			{
				id = "mobile",
				title = QBCore.Shared.MultilLang('phone_label'),
				icon = '#mj-mobile-alt',
				type = 'client',
				event = 'Phone:client:openPhone',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
						return true
					end
					return false
				end
			},
			--Give Contact Details:
			{
				id = "givenum",
				title = QBCore.Shared.MultilLang('give_contact_details'),
				icon = '#mj-address-book',
				type = 'client',
				event = 'qb-phone:client:GiveContactDetails',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
						return true
					end
					return false
				end
			},
			--Get In Trunk:
			{
				id = "getintrunk",
				title = QBCore.Shared.MultilLang('get_in_trunk'),
				icon = '#mj-car',
				type = 'client',
				event = 'qb-trunk:client:GetIn',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
						return true
					end
					return false
				end
			},
			--Corner Selling:
			{
				id = "cornerselling",
				title = QBCore.Shared.MultilLang('corner_selling'),
				icon = '#mj-cannabis',
				type = 'client',
				event = 'qb-drugs:client:cornerselling',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
						return true
					end
					return false
				end
			},
			--Hotdog Selling:
			{
				id = "togglehotdogsell",
				title = QBCore.Shared.MultilLang('hotdog_selling'),
				icon = '#mj-hotdog',
				type = 'client',
				event = 'qb-hotdogjob:client:ToggleSell',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
						return true
					end
					return false
				end
			},
			--Interaction:
			{
				id = "interaction",
				title = QBCore.Shared.MultilLang('interaction'),
				icon = '#mj-exclamation-triangle',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
						return true
					end
					return false
				end,
				items = {
					--Cuff:
					{
						id = "handcuff",
						title = QBCore.Shared.MultilLang('cuff'),
						icon = '#mj-user-lock',
						type = 'client',
						event = 'police:client:CuffPlayerSoft',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								return true
							end
							return false
						end
					},
					--Put In Vehicle:
					{
						id = "playerinvehicle",
						title = QBCore.Shared.MultilLang('put_in_vehicle'),
						icon = '#mj-car-side',
						type = 'client',
						event = 'police:client:PutPlayerInVehicle',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								return true
							end
							return false
						end
					},
					--Take Out Of Vehicle:
					{
						id = "playeroutvehicle",
						title = QBCore.Shared.MultilLang('take_out_of_vehicle'),
						icon = '#mj-car-side',
						type = 'client',
						event = 'police:client:SetPlayerOutVehicle',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								return true
							end
							return false
						end
					},
					--Rob:
					{
						id = "stealplayer",
						title = QBCore.Shared.MultilLang('rob'),
						icon = '#mj-mask',
						type = 'client',
						event = 'police:client:RobPlayer',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								return true
							end
							return false
						end
					},
					--Kidnap:
					{
						id = "escort",
						title = QBCore.Shared.MultilLang('kidnap'),
						icon = '#mj-user-friends',
						type = 'client',
						event = 'police:client:KidnapPlayer',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								return true
							end
							return false
						end
					},
					--Escort:
					{
						id = "escort2",
						title = QBCore.Shared.MultilLang('escort'),
						icon = '#mj-user-friends',
						type = 'client',
						event = 'police:client:EscortPlayer',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								return true
							end
							return false
						end
					},
					--Hostage:
					{
						id = "escort554",
						title = QBCore.Shared.MultilLang('hostage'),
						icon = '#mj-child',
						type = 'client',
						event = 'A5:Client:TakeHostage',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								return true
							end
							return false
						end
					}
				}
			}
		}
	},
	---------------------------------------------------------------------------------
	--									End Citizen								   --
	---------------------------------------------------------------------------------
	
	---------------------------------------------------------------------------------
	--									Begin General							   --
	---------------------------------------------------------------------------------
	{
        --General:
		id = 'general',
        title = QBCore.Shared.MultilLang('general'),
        icon = '#mj-list-alt',
		enableMenu = function()
			PlayerData = QBCore.Functions.GetPlayerData()
			if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
				return true
			end
			return false
		end,
        items = {
			--House Interaction:
			{
				id = "house",
				title = QBCore.Shared.MultilLang('house_interaction'),
				icon = '#mj-home',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
						return true
					end
					return false
				end,
				items = {
					--Give House Keys:
					{
						id = "givehousekey",
						title = QBCore.Shared.MultilLang('give_house_keys'),
						icon = '#mj-key',
						type = 'client',
						event = 'qb-houses:client:giveHouseKey',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								return true
							end
							return false
						end
					},
					--Remove House Keys:
					{
						id = "removehousekey",
						title = QBCore.Shared.MultilLang('remove_house_keys'),
						icon = '#mj-key',
						type = 'client',
						event = 'qb-houses:client:removeHouseKey',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								return true
							end
							return false
						end
					},
					--Toggle Doorlock:
					{
						id = "togglelock",
						title = QBCore.Shared.MultilLang('toggle_doorlock'),
						icon = '#mj-door-closed',
						type = 'client',
						event = 'qb-houses:client:toggleDoorlock',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								return true
							end
							return false
						end
					},
					--Decorate House:
					{
						id = "decoratehouse",
						title = QBCore.Shared.MultilLang('decorate_house'),
						icon = '#mj-boxes',
						type = 'client',
						event = 'qb-houses:client:decorate',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								return true
							end
							return false
						end
					},
					--Interaction Locations:
					{
						id = "houseLocations",
						title = QBCore.Shared.MultilLang('interaction_locations'),
						icon = '#mj-home',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								return true
							end
							return false
						end,
						items = {
							--Set Stash:
							{
								id = "setstash",
								title = QBCore.Shared.MultilLang('set_stash'),
								icon = '#mj-box-open',
								type = 'client',
								event = 'qb-houses:client:setLocation',
								enableMenu = function()
									PlayerData = QBCore.Functions.GetPlayerData()
									if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
										return true
									end
									return false
								end
							},
							--Set Wardrobe:
							{
								id = "setoutift",
								title = QBCore.Shared.MultilLang('set_wardrobe'),
								icon = '#mj-tshirt',
								type = 'client',
								event = 'qb-houses:client:setLocation',
								enableMenu = function()
									PlayerData = QBCore.Functions.GetPlayerData()
									if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
										return true
									end
									return false
								end
							},
							--Set Logout:
							{
								id = "setlogout",
								title = QBCore.Shared.MultilLang('set_logout'),
								icon = '#mj-door-open',
								type = 'client',
								event = 'qb-houses:client:setLocation',
								enableMenu = function()
									PlayerData = QBCore.Functions.GetPlayerData()
									if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
										return true
									end
									return false
								end
							}
						}
					}
				}
			},
			--Clothing:
			{
				id = "clothesmenu",
				title = QBCore.Shared.MultilLang('clothing'),
				icon = '#mj-tshirt',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
						return true
					end
					return false
				end,
				items = {
				
				}
			},
		}
	},
	---------------------------------------------------------------------------------
	--									End General								   --
	---------------------------------------------------------------------------------
	
	---------------------------------------------------------------------------------
	--									Begin Vehicle							   --
	---------------------------------------------------------------------------------
	{
        --Vehicle:
		id = 'vehicle',
        title = QBCore.Shared.MultilLang('vehicle'),
        icon = '#mj-car',
		enableMenu = function()
			PlayerData = QBCore.Functions.GetPlayerData()
			if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
				return true
			end
			return false
		end,
        items = {
			--Vehicle Key:
			{
				id = "vehiclekey",
				title = 'Vehicle Key',
				icon = '#mj-car-key',
				type = 'client',
				event = 'MojiaVehicles:KeyMenu',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
						return true
					end
					return false
				end
			},
			--Open Garage:
			{
				id = "opengarage",
				title = 'Open Garage',
				icon = '#mj-garage-open',
				type = 'client',
				event = 'Garage:openGarage',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and exports["MojiaGarages"]:IsInGarage() then 
						local ped = PlayerPedId()
						if not IsPedInAnyVehicle(ped, false) then
							return true
						end
					end
					return false
				end
			},
			--Store Vehicle:
			{
				id = "storeVehicle",
				title = 'Store Vehicle',
				icon = '#mj-parking',
				type = 'client',
				event = 'Garage:storeVehicle',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and exports["MojiaGarages"]:IsInGarage() then 
						local ped = PlayerPedId()
						local pos = GetEntityCoords(ped)
						local ped = PlayerPedId()
						local veh = QBCore.Functions.GetClosestVehicle(pos)
						if IsPedInAnyVehicle(ped) then
							veh = GetVehiclePedIsIn(ped)
						end
						if exports["MojiaVehicleKey"]:CheckHasKey(veh) then
							return true
						end
					end
					return false
				end
			},
			--Off Engine:
			{
				id = "offengine",
				title = 'Off Engine',
				icon = '#mj-engine',
				type = 'client',
				event = 'MojiaVehicles:Engine',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
						local ped = PlayerPedId()
						if IsPedInAnyVehicle(ped, false) then
							local veh = GetVehiclePedIsIn(ped)
							local driver = GetPedInVehicleSeat(veh, -1)
							if driver == ped then
								if exports["MojiaVehicleKey"]:CheckHasKey(veh) then
									if GetIsVehicleEngineRunning(veh) then
										return true
									end
								end
							end
						end
					end
					return false
				end
			},
			--On Engine:
			{
				id = "offengine",
				title = 'On Engine',
				icon = '#mj-engine',
				type = 'client',
				event = 'MojiaVehicles:Engine',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
						local ped = PlayerPedId()
						if IsPedInAnyVehicle(ped, false) then
							local veh = GetVehiclePedIsIn(ped)
							local plate = QBCore.Functions.GetPlate(veh)
							local driver = GetPedInVehicleSeat(veh, -1)
							if driver == ped then
								if exports["MojiaVehicleKey"]:CheckHasKey(veh) then
									if not GetIsVehicleEngineRunning(veh) then
										return true
									end
								end
							end
						end
					end
					return false
				end
			},
			--Lock Vehicle:
			{
				id = "lockvehicle",
				title = 'Lock Vehicle',
				icon = '#mj-car-key',
				type = 'client',
				event = 'MojiaVehicles:lockVehicle',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
						local ped = PlayerPedId()
						local pos = GetEntityCoords(ped)
						local veh = QBCore.Functions.GetClosestVehicle(pos)
						if IsPedInAnyVehicle(ped) then
							veh = GetVehiclePedIsIn(ped)
						end
						local plate = QBCore.Functions.GetPlate(veh)
						local vehpos = GetEntityCoords(veh)						
						if veh ~= nil and #(pos - vehpos) < 7.5 then
							if exports["MojiaVehicleKey"]:CheckHasKey(veh) then
								local vehLockStatus = GetVehicleDoorLockStatus(veh)
								if vehLockStatus == 1 then
									return true
								end
							end
						end
					end
					return false
				end
			},
			--Unlock Vehicle:
			{
				id = "unlockvehicle",
				title = 'Unlock Vehicle',
				icon = '#mj-car-key',
				type = 'client',
				event = 'MojiaVehicles:lockVehicle',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
						local ped = PlayerPedId()
						local pos = GetEntityCoords(ped)
						local veh = QBCore.Functions.GetClosestVehicle(pos)
						if IsPedInAnyVehicle(ped) then
							veh = GetVehiclePedIsIn(ped)
						end
						local plate = QBCore.Functions.GetPlate(veh)
						local vehpos = GetEntityCoords(veh)						
						if veh ~= nil and #(pos - vehpos) < 7.5 then
							if exports["MojiaVehicleKey"]:CheckHasKey(veh) then
								local vehLockStatus = GetVehicleDoorLockStatus(veh)
								if vehLockStatus ~= 1 then
									return true
								end
							end
						end
					end
					return false
				end
			},
			--Vehicle Doors:
			{
				id = "vehicledoors",
				title = 'Vehicle Doors',
				icon = '#mj-car-side',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
						local ped = PlayerPedId()
						local pos = GetEntityCoords(ped)
						local veh = QBCore.Functions.GetClosestVehicle(pos)
						if IsPedInAnyVehicle(ped) then
							veh = GetVehiclePedIsIn(ped)
						end
						local plate = QBCore.Functions.GetPlate(veh)
						local vehpos = GetEntityCoords(veh)
						local class = GetVehicleClass(veh)
						if veh ~= nil and #(pos - vehpos) < 7.5 and class ~= 8 and class ~= 13 and class ~= 14 and class ~= 21 and exports["MojiaVehicleKey"]:CheckHasKey(veh) then
							return true
						end
					end
					return false
				end,
				--[[
				Driver Side Front = 0,
				Driver Side Rear = 1,
				Passenger Side Front = 2,
				Passenger Side Rear = 3,
				Bonnet = 4,
				Boot = 5,
				]]--
				items = {
					--Driver Side Front:
					{
						id = "door0", -- 0 → 5
						title = 'Driver Side Front',
						icon = '#mj-doorr1',
						type = 'client',
						event = 'MojiaVehicles:openDoor',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								local ped = PlayerPedId()
								local pos = GetEntityCoords(ped)
								local veh = QBCore.Functions.GetClosestVehicle(pos)
								if IsPedInAnyVehicle(ped) then
									veh = GetVehiclePedIsIn(ped)
								end
								local plate = QBCore.Functions.GetPlate(veh)
								local vehpos = GetEntityCoords(veh)						
								if veh ~= nil and #(pos - vehpos) < 7.5 and class ~= 8 and class ~= 13 and class ~= 14 and class ~= 21 and exports["MojiaVehicleKey"]:CheckHasKey(veh) then
									return GetIsDoorValid(veh, 0)
								end
							end
							return false
						end
					},
					--Driver Side Rear:
					{
						id = "door1", -- 0 → 5
						title = 'Driver Side Rear',
						icon = '#mj-doorr1',
						type = 'client',
						event = 'MojiaVehicles:openDoor',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								local ped = PlayerPedId()
								local pos = GetEntityCoords(ped)
								local veh = QBCore.Functions.GetClosestVehicle(pos)
								if IsPedInAnyVehicle(ped) then
									veh = GetVehiclePedIsIn(ped)
								end
								local plate = QBCore.Functions.GetPlate(veh)
								local vehpos = GetEntityCoords(veh)						
								if veh ~= nil and #(pos - vehpos) < 7.5 and class ~= 8 and class ~= 13 and class ~= 14 and class ~= 21 and exports["MojiaVehicleKey"]:CheckHasKey(veh) then
									return GetIsDoorValid(veh, 1)
								end
							end
							return false
						end
					},
					--Passenger Side Front:
					{
						id = "door2", -- 0 → 5
						title = 'Passenger Side Front',
						icon = '#mj-doorr1',
						type = 'client',
						event = 'MojiaVehicles:openDoor',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								local ped = PlayerPedId()
								local pos = GetEntityCoords(ped)
								local veh = QBCore.Functions.GetClosestVehicle(pos)
								if IsPedInAnyVehicle(ped) then
									veh = GetVehiclePedIsIn(ped)
								end
								local plate = QBCore.Functions.GetPlate(veh)
								local vehpos = GetEntityCoords(veh)						
								if veh ~= nil and #(pos - vehpos) < 7.5 and class ~= 8 and class ~= 13 and class ~= 14 and class ~= 21 and exports["MojiaVehicleKey"]:CheckHasKey(veh) then
									return GetIsDoorValid(veh, 2)
								end
							end
							return false
						end
					},
					--Passenger Side Rear:
					{
						id = "door3", -- 0 → 5
						title = 'Passenger Side Rear',
						icon = '#mj-doorr1',
						type = 'client',
						event = 'MojiaVehicles:openDoor',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								local ped = PlayerPedId()
								local pos = GetEntityCoords(ped)
								local veh = QBCore.Functions.GetClosestVehicle(pos)
								if IsPedInAnyVehicle(ped) then
									veh = GetVehiclePedIsIn(ped)
								end
								local plate = QBCore.Functions.GetPlate(veh)
								local vehpos = GetEntityCoords(veh)						
								if veh ~= nil and #(pos - vehpos) < 7.5 and class ~= 8 and class ~= 13 and class ~= 14 and class ~= 21 and exports["MojiaVehicleKey"]:CheckHasKey(veh) then
									return GetIsDoorValid(veh, 3)
								end
							end
							return false
						end
					},
					--Bonnet:
					{
						id = "door4", -- 0 → 5
						title = 'Bonnet',
						icon = '#mj-doorr1',
						type = 'client',
						event = 'MojiaVehicles:openDoor',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								local ped = PlayerPedId()
								local pos = GetEntityCoords(ped)
								local veh = QBCore.Functions.GetClosestVehicle(pos)
								if IsPedInAnyVehicle(ped) then
									veh = GetVehiclePedIsIn(ped)
								end
								local plate = QBCore.Functions.GetPlate(veh)
								local vehpos = GetEntityCoords(veh)						
								if veh ~= nil and #(pos - vehpos) < 7.5 and class ~= 8 and class ~= 13 and class ~= 14 and class ~= 21 and exports["MojiaVehicleKey"]:CheckHasKey(veh) then
									return GetIsDoorValid(veh, 4)
								end
							end
							return false
						end
					},
					--Boot:
					{
						id = "door5", -- 0 → 5
						title = 'Boot',
						icon = '#mj-doorr1',
						type = 'client',
						event = 'MojiaVehicles:openDoor',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								local ped = PlayerPedId()
								local pos = GetEntityCoords(ped)
								local veh = QBCore.Functions.GetClosestVehicle(pos)
								if IsPedInAnyVehicle(ped) then
									veh = GetVehiclePedIsIn(ped)
								end
								local plate = QBCore.Functions.GetPlate(veh)
								local vehpos = GetEntityCoords(veh)						
								if veh ~= nil and #(pos - vehpos) < 7.5 and class ~= 8 and class ~= 13 and class ~= 14 and class ~= 21 and exports["MojiaVehicleKey"]:CheckHasKey(veh) then
									return GetIsDoorValid(veh, 5)
								end
							end
							return false
						end
					}
				}
			},
			--Vehicle Window:
			{
				id = "vehicledoors",
				title = 'Vehicle Window',
				icon = '#mj-car-side',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
						local ped = PlayerPedId()
						local pos = GetEntityCoords(ped)
						local veh = QBCore.Functions.GetClosestVehicle(pos)
						if IsPedInAnyVehicle(ped) then
							veh = GetVehiclePedIsIn(ped)
						end
						local plate = QBCore.Functions.GetPlate(veh)
						local vehpos = GetEntityCoords(veh)
						local class = GetVehicleClass(veh)
						if veh ~= nil and #(pos - vehpos) < 7.5 and class ~= 8 and class ~= 13 and class ~= 14 and class ~= 21 and exports["MojiaVehicleKey"]:CheckHasKey(veh) then
							return true
						end
					end
					return false
				end,
				--[[
				Windscreen = 0,
				Windscreen Right = 1,
				Window Left Front = 2,
				Window Right Front = 3,
				Window Left Rear = 4,
				Window Right Rear = 5,
				WINDOW_LM = 6,
				WINDOW_RM = 7,
				]]--
				items = {
					--Windscreen:
					{
						id = "window0", -- 0 → 7
						title = 'Windscreen',
						icon = '#mj-doorr1',
						type = 'client',
						event = 'MojiaVehicles:Window',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								local ped = PlayerPedId()
								local pos = GetEntityCoords(ped)
								local veh = QBCore.Functions.GetClosestVehicle(pos)
								if IsPedInAnyVehicle(ped) then
									veh = GetVehiclePedIsIn(ped)
								end
								local plate = QBCore.Functions.GetPlate(veh)
								local vehpos = GetEntityCoords(veh)						
								if veh ~= nil and #(pos - vehpos) < 7.5 and class ~= 8 and class ~= 13 and class ~= 14 and class ~= 21 and exports["MojiaVehicleKey"]:CheckHasKey(veh) then
									return GetIsDoorValid(veh, 0)
								end
							end
							return false
						end
					},
					--Windscreen Right:
					{
						id = "window1", -- 0 → 7
						title = 'Windscreen Right',
						icon = '#mj-doorr1',
						type = 'client',
						event = 'MojiaVehicles:Window',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								local ped = PlayerPedId()
								local pos = GetEntityCoords(ped)
								local veh = QBCore.Functions.GetClosestVehicle(pos)
								if IsPedInAnyVehicle(ped) then
									veh = GetVehiclePedIsIn(ped)
								end
								local plate = QBCore.Functions.GetPlate(veh)
								local vehpos = GetEntityCoords(veh)						
								if veh ~= nil and #(pos - vehpos) < 7.5 and class ~= 8 and class ~= 13 and class ~= 14 and class ~= 21 and exports["MojiaVehicleKey"]:CheckHasKey(veh) then
									return GetIsDoorValid(veh, 1)
								end
							end
							return false
						end
					},
					--Window Left Front:
					{
						id = "window2", -- 0 → 7
						title = 'Window Left Front',
						icon = '#mj-doorr1',
						type = 'client',
						event = 'MojiaVehicles:Window',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								local ped = PlayerPedId()
								local pos = GetEntityCoords(ped)
								local veh = QBCore.Functions.GetClosestVehicle(pos)
								if IsPedInAnyVehicle(ped) then
									veh = GetVehiclePedIsIn(ped)
								end
								local plate = QBCore.Functions.GetPlate(veh)
								local vehpos = GetEntityCoords(veh)						
								if veh ~= nil and #(pos - vehpos) < 7.5 and class ~= 8 and class ~= 13 and class ~= 14 and class ~= 21 and exports["MojiaVehicleKey"]:CheckHasKey(veh) then
									return GetIsDoorValid(veh, 2)
								end
							end
							return false
						end
					},
					--Window Right Front:
					{
						id = "window3", -- 0 → 7
						title = 'Window Right Front',
						icon = '#mj-doorr1',
						type = 'client',
						event = 'MojiaVehicles:Window',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								local ped = PlayerPedId()
								local pos = GetEntityCoords(ped)
								local veh = QBCore.Functions.GetClosestVehicle(pos)
								if IsPedInAnyVehicle(ped) then
									veh = GetVehiclePedIsIn(ped)
								end
								local plate = QBCore.Functions.GetPlate(veh)
								local vehpos = GetEntityCoords(veh)						
								if veh ~= nil and #(pos - vehpos) < 7.5 and class ~= 8 and class ~= 13 and class ~= 14 and class ~= 21 and exports["MojiaVehicleKey"]:CheckHasKey(veh) then
									return GetIsDoorValid(veh, 3)
								end
							end
							return false
						end
					},
					--[[Window Left Rear:
					{
						id = "window4", -- 0 → 7
						title = 'Window Left Rear',
						icon = '#mj-doorr1',
						type = 'client',
						event = 'MojiaVehicles:Window',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								local ped = PlayerPedId()
								local pos = GetEntityCoords(ped)
								local veh = QBCore.Functions.GetClosestVehicle(pos)
								if IsPedInAnyVehicle(ped) then
									veh = GetVehiclePedIsIn(ped)
								end
								local plate = QBCore.Functions.GetPlate(veh)
								local vehpos = GetEntityCoords(veh)						
								if veh ~= nil and #(pos - vehpos) < 7.5 and class ~= 8 and class ~= 13 and class ~= 14 and class ~= 21 and exports["MojiaVehicleKey"]:CheckHasKey(veh) then
									return GetIsDoorValid(veh, 4)
								end
							end
							return false
						end
					},
					--Window Right Rear:
					{
						id = "window5", -- 0 → 7
						title = 'Window Right Rear',
						icon = '#mj-doorr1',
						type = 'client',
						event = 'MojiaVehicles:Window',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								local ped = PlayerPedId()
								local pos = GetEntityCoords(ped)
								local veh = QBCore.Functions.GetClosestVehicle(pos)
								if IsPedInAnyVehicle(ped) then
									veh = GetVehiclePedIsIn(ped)
								end
								local plate = QBCore.Functions.GetPlate(veh)
								local vehpos = GetEntityCoords(veh)						
								if veh ~= nil and #(pos - vehpos) < 7.5 and class ~= 8 and class ~= 13 and class ~= 14 and class ~= 21 and exports["MojiaVehicleKey"]:CheckHasKey(veh) then
									return true
								end
							end
							return false
						end
					},
					--WINDOW_LM:
					{
						id = "window6", -- 0 → 7
						title = 'WINDOW_LM',
						icon = '#mj-doorr1',
						type = 'client',
						event = 'MojiaVehicles:Window',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								local ped = PlayerPedId()
								local pos = GetEntityCoords(ped)
								local veh = QBCore.Functions.GetClosestVehicle(pos)
								if IsPedInAnyVehicle(ped) then
									veh = GetVehiclePedIsIn(ped)
								end
								local plate = QBCore.Functions.GetPlate(veh)
								local vehpos = GetEntityCoords(veh)						
								if veh ~= nil and #(pos - vehpos) < 7.5 and class ~= 8 and class ~= 13 and class ~= 14 and class ~= 21 and exports["MojiaVehicleKey"]:CheckHasKey(veh) then
									return true
								end
							end
							return false
						end
					},
					--WINDOW_RM:
					{
						id = "window7", -- 0 → 7
						title = 'WINDOW_RM',
						icon = '#mj-doorr1',
						type = 'client',
						event = 'MojiaVehicles:Window',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
								local ped = PlayerPedId()
								local pos = GetEntityCoords(ped)
								local veh = QBCore.Functions.GetClosestVehicle(pos)
								if IsPedInAnyVehicle(ped) then
									veh = GetVehiclePedIsIn(ped)
								end
								local plate = QBCore.Functions.GetPlate(veh)
								local vehpos = GetEntityCoords(veh)						
								if veh ~= nil and #(pos - vehpos) < 7.5 and class ~= 8 and class ~= 13 and class ~= 14 and class ~= 21 and exports["MojiaVehicleKey"]:CheckHasKey(veh) then
									return true
								end
							end
							return false
						end
					}
					]]--
				}
			},
			--Vehicle Seats:
			{
				id = "vehicleseats",
				title = QBCore.Shared.MultilLang('vehicle_seats'),
				icon = '#mj-seat',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
						return IsPedInAnyVehicle(PlayerPedId(), false)
					end
					return false
				end,
				--[[
				{
					Front Driver Side = -1,
					Front Passenger Side = 0,
					Back Driver Side = 1,
					Back Passenger Side = 2,
					Alt Front Driver Side = 3,
					Alt Front Passenger Side = 4,
					Alt Back Driver Side = 5,
					Alt Back Passenger Side = 6,
				}
				]]--
				items = {
					--Front Driver Side:
					{
						id = "seat-1", -- -1 → 6
						title = 'Front Driver Side',
						icon = '#mj-seat',
						type = 'client',
						event = 'MojiaVehicles:changeSeat',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and IsPedInAnyVehicle(PlayerPedId(), false) then 
								local veh = GetVehiclePedIsIn(PlayerPedId(), false)
								return IsVehicleSeatFree(veh, -1)
							end
							return false
						end
					},
					--Front Passenger Side:
					{
						id = "seat0", -- -1 → 6
						title = 'Front Passenger Side',
						icon = '#mj-seat',
						type = 'client',
						event = 'MojiaVehicles:changeSeat',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and IsPedInAnyVehicle(PlayerPedId(), false) then 
								local veh = GetVehiclePedIsIn(PlayerPedId(), false)
								return IsVehicleSeatFree(veh, 0)
							end
							return false
						end
					},
					--Back Driver Side:
					{
						id = "seat1", -- -1 → 6
						title = 'Back Driver Side',
						icon = '#mj-seat',
						type = 'client',
						event = 'MojiaVehicles:changeSeat',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and IsPedInAnyVehicle(PlayerPedId(), false) then 
								local veh = GetVehiclePedIsIn(PlayerPedId(), false)
								return IsVehicleSeatFree(veh, 1)
							end
							return false
						end
					},
					--Back Passenger Side:
					{
						id = "seat2", -- -1 → 6
						title = 'Back Passenger Side',
						icon = '#mj-seat',
						type = 'client',
						event = 'MojiaVehicles:changeSeat',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and IsPedInAnyVehicle(PlayerPedId(), false) then 
								local veh = GetVehiclePedIsIn(PlayerPedId(), false)
								return IsVehicleSeatFree(veh, 2)
							end
							return false
						end
					},
					--Alt Front Driver Side:
					{
						id = "seat3", -- -1 → 6
						title = 'Alt Front Driver Side',
						icon = '#mj-seat',
						type = 'client',
						event = 'MojiaVehicles:changeSeat',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and IsPedInAnyVehicle(PlayerPedId(), false) then 
								local veh = GetVehiclePedIsIn(PlayerPedId(), false)
								return IsVehicleSeatFree(veh, 3)
							end
							return false
						end
					},
					--Alt Front Passenger Side:
					{
						id = "seat4", -- -1 → 6
						title = 'Alt Front Passenger Side',
						icon = '#mj-seat',
						type = 'client',
						event = 'MojiaVehicles:changeSeat',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and IsPedInAnyVehicle(PlayerPedId(), false) then 
								local veh = GetVehiclePedIsIn(PlayerPedId(), false)
								return IsVehicleSeatFree(veh, 4)
							end
							return false
						end
					},
					--Alt Back Driver Side:
					{
						id = "seat5", -- -1 → 6
						title = 'Alt Back Driver Side',
						icon = '#mj-seat',
						type = 'client',
						event = 'MojiaVehicles:changeSeat',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and IsPedInAnyVehicle(PlayerPedId(), false) then 
								local veh = GetVehiclePedIsIn(PlayerPedId(), false)
								return IsVehicleSeatFree(veh, 5)
							end
							return false
						end
					},
					--Alt Back Passenger Side:
					{
						id = "seat6", -- -1 → 6
						title = 'Alt Back Passenger Side',
						icon = '#mj-seat',
						type = 'client',
						event = 'MojiaVehicles:changeSeat',
						enableMenu = function()
							PlayerData = QBCore.Functions.GetPlayerData()
							if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and IsPedInAnyVehicle(PlayerPedId(), false) then 
								local veh = GetVehiclePedIsIn(PlayerPedId(), false)
								return IsVehicleSeatFree(veh, 6)
							end
							return false
						end
					},
				}
			},
		}
	},
	---------------------------------------------------------------------------------
	--									End Vehicle								   --
	---------------------------------------------------------------------------------
	
	---------------------------------------------------------------------------------
	--									Begin Police							   --
	---------------------------------------------------------------------------------
	{
        --Police:
		id = 'police',
        title = QBCore.Shared.MultilLang('police'),
        icon = '#mj-badge-sheriff',
		enableMenu = function()
			PlayerData = QBCore.Functions.GetPlayerData()
			if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and PlayerData.job.name == 'police' then 
				return true
			end
			return false
		end,
        items = {
		
		}
	},
	---------------------------------------------------------------------------------
	--									End Police								   --
	---------------------------------------------------------------------------------
	
	---------------------------------------------------------------------------------
	--									Begin Ambulance							   --
	---------------------------------------------------------------------------------
	{
        --Ambulance:
		id = 'ambulance',
        title = QBCore.Shared.MultilLang('ambulance'),
        icon = '#mj-ambulance',
		enableMenu = function()
			PlayerData = QBCore.Functions.GetPlayerData()
			if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and PlayerData.job.name == 'ambulance' then 
				return true
			end
			return false
		end,
        items = {
		
		}
	},
	---------------------------------------------------------------------------------
	--									End Ambulance							   --
	---------------------------------------------------------------------------------
	
	---------------------------------------------------------------------------------
	--									Begin Mechanic							   --
	---------------------------------------------------------------------------------
	{
        --Mechanic:
		id = 'mechanic',
        title = QBCore.Shared.MultilLang('mechanic'),
        icon = '#mj-car-mechanic',
		enableMenu = function()
			PlayerData = QBCore.Functions.GetPlayerData()
			if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and PlayerData.job.name == 'mechanic' then 
				return true
			end
			return false
		end,
        items = {
			--Towing:
			{
				id = "towing",
				title = 'Towing',
				icon = '#mj-truck-loading',
				type = 'client',
				event = 'Mojia:Flatbed:TowVehicle',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and PlayerData.job.name == 'mechanic' and exports["TowingScripts"]:checkLocationVehAndFlatbedOK() then  
						return true
					end
					return false
				end
			},
			--Release:
			{
				id = "Release",
				title = 'Release',
				icon = '#mj-truck-ramp',
				type = 'client',
				event = 'Mojia:Flatbed:TowVehicle',
				enableMenu = function()
					PlayerData = QBCore.Functions.GetPlayerData()
					if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and PlayerData.job.name == 'mechanic' and exports["TowingScripts"]:checkLocationReleaseVehOK() then  
						return true
					end
					return false
				end
			},
		}
	},
	---------------------------------------------------------------------------------
	--									End Mechanic							   --
	---------------------------------------------------------------------------------
}

function isGod()
	return TriggerServerEvent('MojiaMenu:server:checkGod')
end

function isAdmin()
	return TriggerServerEvent('MojiaMenu:server:checkAdmin')
end

ATMModels = {
    "prop_atm_01",
    "prop_atm_02",
    "prop_atm_03",
    "prop_fleeca_atm"
}

ShopLocations = {
    vector3(-633.72, 236.15, 81.88),
	vector3(948.3834, 34.21247, 71.839),
	vector3(-48.44, -1757.86, 29.42),
	vector3(-47.23, -1756.58, 29.42),
	vector3(25.7, -1347.3, 29.49),
	vector3(25.7, -1344.99, 29.49),
    vector3(936.1185, 28.61719, 71.833),
    vector3(-1222.77, -907.19, 12.32),
    vector3(-707.41, -912.83, 19.21),
    vector3(-707.32, -914.65, 19.21),
    vector3(-1487.7, -378.53, 40.16),
    vector3(-1820.33, 792.66, 138.1),
    vector3(-2967.79, 391.64, 15.04),
    vector3(-3038.71, 585.9, 7.9),
    vector3(-3041.04, 585.11, 7.9),
    vector3(-3241.47, 1001.14, 12.83),
    vector3(-3243.98, 1001.35, 12.83),
    vector3(1728.66, 6414.16, 35.03),
    vector3(1729.72, 6416.27, 35.03),
    vector3(1697.99, 4924.4, 42.06),
    vector3(1699.44, 4923.47, 42.06),
    vector3(1961.48, 3739.96, 32.34),
    vector3(1960.22, 3742.12, 32.34),
    vector3(1165.28, 2709.4, 38.15),
    vector3(547.79, 2671.79, 42.15),
    vector3(548.1, 2669.38, 42.15),
    vector3(2679.25, 3280.12, 55.24),
    vector3(2677.13, 281.38, 55.24),
    vector3(2557.94, 382.05, 108.62),
    vector3(2555.53, 382.18, 108.62),
    vector3(-159.36, 6321.59, 31.58),
    vector3(-160.66, 6322.85, 31.58),
    vector3(161.41, 6640.78, 31.69),
    vector3(163.04, 6642.45, 31.70),
    vector3(1163.7, -323.92, 69.2),
    vector3(1163.4, -322.24, 69.2),
    vector3(1135.66, -982.76, 46.41),
    vector3(373.55, 325.56, 103.56),
    vector3(374.29, 327.9, 103.56),
    vector3(45.55, -1749.01, 29.6),
    vector3(2747.8, 3472.86, 55.67),
    vector3(-421.84, 6136.09, 31.78),
    vector3(-1172.43, -1572.24, 4.66),
    vector3(-662.1, -935.3, 21.8),
    vector3(810.2, -2157.3, 29.6),
    vector3(1693.4, 3759.5, 34.7),
    vector3(-330.2, 6083.8, 31.4),
    vector3(252.3, -50.0, 69.9),
    vector3(22.0, -1107.2, 29.8),
    vector3(2567.6, 294.3, 108.7),
    vector3(-1117.5, 2698.6, 18.5),
    vector3(842.4, -1033.4, 28.1),
    vector3(-1686.9, -1072.23, 13.15),
    vector3(-1508.774, 1509.015, 115.2903),
    vector3(-31.18, -1397.537, 29.50)
}

