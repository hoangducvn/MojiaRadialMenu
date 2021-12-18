local QBCore = exports['qb-core']:GetCoreObject()
-- Menu state
local showMenu = false

-- Keybind Lookup table
local keybindControls = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173, ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local MAX_MENU_ITEMS = 5
local mainmenulist = {}
-- Main thread
Citizen.CreateThread(function()
    local keyBind = "F1"
	while true do
        Citizen.Wait(0)		
        if IsControlPressed(1, keybindControls[keyBind]) and GetLastInputMethod(2) and showMenu then
            showMenu = false
			mainmenulist = {}
            SetNuiFocus(false, false)
        end
        if IsControlPressed(1, keybindControls[keyBind]) and GetLastInputMethod(2) then
            showMenu = true
            local enabledMenuslv1 = {}			
			local datalv1Elements = {}
			for _, menulv1Config in ipairs(Config.MainMenu) do
				if menulv1Config:enableMenu() then
                    local datalv2Elements = {}
					local enabledMenuslv2 = {}
					local hasMenuslv1 = false
					if menulv1Config.items ~= nil and #menulv1Config.items > 0 then
						hasMenuslv1 = true
                        local data2v1Elements = {}
						for _, menulv2Config in ipairs(menulv1Config.items) do
							if menulv2Config:enableMenu() then
								local datalv3Elements = {}
								local enabledMenuslv3 = {}
								local hasMenuslv2 = false
								if menulv2Config.items ~= nil and #menulv2Config.items > 0 then
									hasMenuslv2 = true
									for _, menulv3Config in ipairs(menulv2Config.items) do
										if menulv3Config:enableMenu() then
											local datalv4Elements = {}
											local enabledMenuslv4 = {}
											local hasMenuslv3 = false
											if menulv3Config.items ~= nil and #menulv3Config.items > 0 then
												hasMenuslv3 = true
												for _, menulv4Config in ipairs(menulv3Config.items) do
													if menulv4Config:enableMenu() then
														local datalv5Elements = {}
														local enabledMenuslv5 = {}
														local hasMenuslv4 = false
														if menulv4Config.items ~= nil and #menulv4Config.items > 0 then
															hasMenuslv4 = true
															for _, menulv5Config in ipairs(menulv4Config.items) do
																if menulv5Config:enableMenu() then
																	enabledMenuslv5[#enabledMenuslv5+1] = {
																		id = menulv5Config.id,
																		title = menulv5Config.title,
																		event = menulv5Config.event,
																		icon = menulv5Config.icon,
																		type = menulv5Config.type,
																		arg = menulv5Config.arg or nil
																	}
																end
																--Thu Gon Menu cấp 5:
																local previousMenu = datalv5Elements
																local current4Element = {}
																if #enabledMenuslv5 > 0 then
																	for i = 1, #enabledMenuslv5 do
																		current4Element[#current4Element+1] = enabledMenuslv5[i]
																		current4Element[#current4Element].id = enabledMenuslv5[i].id
																		current4Element[#current4Element].enableMenu = nil
																		if i % MAX_MENU_ITEMS == 0 and i < (#enabledMenuslv5 - 1) then
																			previousMenu[MAX_MENU_ITEMS + 1] = {
																				id = "_morelv1",
																				title = 'More',
																				icon = "#ellipsis-h",
																				items = current4Element
																			}
																			previousMenu = current4Element
																			current4Element = {}
																		end
																	end
																	if #current4Element > 0 then
																		previousMenu[MAX_MENU_ITEMS + 1] = {
																			id = "_morelv1",
																			title = 'More',
																			icon = "#ellipsis-h",
																			items = current4Element
																		}
																	end
																	datalv5Elements = datalv5Elements[MAX_MENU_ITEMS + 1].items
																else
																	datalv5Elements = nil
																end
															end
														end
														enabledMenuslv4[#enabledMenuslv4+1] = {
															id = menulv4Config.id,
															title = menulv4Config.title,
															event = menulv4Config.event,
															icon = menulv4Config.icon,
															type = menulv4Config.type,
															arg = menulv4Config.arg or nil
														}
														if hasMenuslv4 then
															enabledMenuslv4[#enabledMenuslv4].items = datalv5Elements
														end
													end
												end
												--Thu Gon Menu cấp 4:
												local previousMenu = datalv4Elements
												local current3Element = {}
												if #enabledMenuslv4 > 0 then
													for i = 1, #enabledMenuslv4 do
														current3Element[#current3Element+1] = enabledMenuslv4[i]
														current3Element[#current3Element].id = enabledMenuslv4[i].id
														current3Element[#current3Element].enableMenu = nil
														if i % MAX_MENU_ITEMS == 0 and i < (#enabledMenuslv4 - 1) then
															previousMenu[MAX_MENU_ITEMS + 1] = {
																id = "_morelv1",
																title = 'More',
																icon = "#ellipsis-h",
																items = current3Element
															}
															previousMenu = current3Element
															current3Element = {}
														end
													end
													if #current3Element > 0 then
														previousMenu[MAX_MENU_ITEMS + 1] = {
															id = "_morelv1",
															title = 'More',
															icon = "#ellipsis-h",
															items = current3Element
														}
													end
													datalv4Elements = datalv4Elements[MAX_MENU_ITEMS + 1].items
												else
													datalv4Elements = nil
												end
											end
											enabledMenuslv3[#enabledMenuslv3+1] = {
												id = menulv3Config.id,
												title = menulv3Config.title,
												event = menulv3Config.event,
												icon = menulv3Config.icon,
												type = menulv3Config.type,
												arg = menulv3Config.arg or nil
											}
											if hasMenuslv3 then
												enabledMenuslv3[#enabledMenuslv3].items = datalv4Elements
											end
										end
									end
									--Thu Gon Menu cấp 3:
									local previousMenu = datalv3Elements
									local current2Element = {}
									if #enabledMenuslv3 > 0 then
										for i = 1, #enabledMenuslv3 do
											current2Element[#current2Element+1] = enabledMenuslv3[i]
											current2Element[#current2Element].id = enabledMenuslv3[i].id
											current2Element[#current2Element].enableMenu = nil
											if i % MAX_MENU_ITEMS == 0 and i < (#enabledMenuslv3 - 1) then
												previousMenu[MAX_MENU_ITEMS + 1] = {
													id = "_morelv1",
													title = 'More',
													icon = "#ellipsis-h",
													items = current2Element
												}
												previousMenu = current2Element
												current2Element = {}
											end
										end
										if #current2Element > 0 then
											previousMenu[MAX_MENU_ITEMS + 1] = {
												id = "_morelv1",
												title = 'More',
												icon = "#ellipsis-h",
												items = current2Element
											}
										end
										datalv3Elements = datalv3Elements[MAX_MENU_ITEMS + 1].items
									else
										datalv3Elements = nil
									end
								end
								enabledMenuslv2[#enabledMenuslv2+1] = {
									id = menulv2Config.id,
									title = menulv2Config.title,
									event = menulv2Config.event,
									icon = menulv2Config.icon,
									type = menulv2Config.type,
									arg = menulv2Config.arg or nil
								}
								if hasMenuslv2 then
									enabledMenuslv2[#enabledMenuslv2].items = datalv3Elements
								end
							end
						end
						
						--Thu Gon Menu cấp 2:
						local previousMenu = datalv2Elements
						local current1Element = {}
						if #enabledMenuslv2 > 0 then
							for i = 1, #enabledMenuslv2 do
								current1Element[#current1Element+1] = enabledMenuslv2[i]
								current1Element[#current1Element].id = enabledMenuslv2[i].id
								current1Element[#current1Element].enableMenu = nil
								if i % MAX_MENU_ITEMS == 0 and i < (#enabledMenuslv2 - 1) then
									previousMenu[MAX_MENU_ITEMS + 1] = {
										id = "_morelv1",
										title = 'More',
										icon = "#ellipsis-h",
										items = current1Element
									}
									previousMenu = current1Element
									current1Element = {}
								end
							end						
							if #current1Element > 0 then
								previousMenu[MAX_MENU_ITEMS + 1] = {
									id = "_morelv1",
									title = 'More',
									icon = "#ellipsis-h",
									items = current1Element
								}
							end
							datalv2Elements = datalv2Elements[MAX_MENU_ITEMS + 1].items
						else
							datalv2Elements = nil
						end
					end
					--Tạo menu cấp 1:
					enabledMenuslv1[#enabledMenuslv1+1] = {
                        id = menulv1Config.id,
                        title = menulv1Config.title,
                        event = menulv1Config.event,
                        icon = menulv1Config.icon,
						type = menulv1Config.type,
						arg = menulv1Config.arg or nil
                    }
					if hasMenuslv1 then
                        enabledMenuslv1[#enabledMenuslv1].items = datalv2Elements
                    end
					-----------------------------
				end
			end
			--Thu Gon Menu cấp 1:
			local previousMenu = datalv1Elements
			local currentElement = {}
			if #enabledMenuslv1 > 0 then
				for i = 1, #enabledMenuslv1 do
					currentElement[#currentElement+1] = enabledMenuslv1[i]
					currentElement[#currentElement].id = enabledMenuslv1[i].id
					currentElement[#currentElement].enableMenu = nil
					if i % MAX_MENU_ITEMS == 0 and i < (#enabledMenuslv1 - 1) then
						previousMenu[MAX_MENU_ITEMS + 1] = {
							id = "_morelv1",
							title = 'More',
							icon = "#ellipsis-h",
							items = currentElement
						}
						previousMenu = currentElement
						currentElement = {}
					end
				end
				if #currentElement > 0 then
					previousMenu[MAX_MENU_ITEMS + 1] = {
						id = "_morelv1",
						title = 'More',
						icon = "#ellipsis-h",
						items = currentElement
					}
				end
				datalv1Elements = datalv1Elements[MAX_MENU_ITEMS + 1].items
			else
				datalv1Elements = {}
			end
			---------------------
			--Gửi menu lên UI:
			SendNUIMessage({
                state = "show",
                resourceName = GetCurrentResourceName(),
                --data = enabledMenuslv1,
				data = datalv1Elements,
                menuKeyBind = keyBind
            })
            SetCursorLocation(0.5, 0.5)
            SetNuiFocus(true, true)
			----------------------------------------------
            -- Play sound
            PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)


            while showMenu == true do
				Citizen.Wait(100)
			end
            Citizen.Wait(100)
            while IsControlPressed(1, keybindControls[keyBind]) and GetLastInputMethod(2) do
				Citizen.Wait(100)
			end
        end
    end
end)
-- Callback function for closing menu
RegisterNUICallback('closemenu', function(data, cb)
    -- Clear focus and destroy UI
    showMenu = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        state = 'destroy'
    })
    -- Play sound
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
    -- Send ACK to callback function
    cb('ok')
end)
RegisterNUICallback('selectItem', function(data, cb)
    -- Clear focus and destroy UI
    showMenu = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        state = 'destroy'
    })
	local itemData = data.itemData
	-- Play sound
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
	if itemData.type == 'client' then
        TriggerEvent(itemData.event, itemData)
    elseif itemData.type == 'server' then
        TriggerServerEvent(itemData.event, itemData)
    end
	cb('ok')
end)
