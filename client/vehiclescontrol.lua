local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('MojiaVehicles:openDoor', function(data)
    local string = data.id
    local replace = string:gsub("door", "")
    local door = tonumber(replace)
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
			if GetIsDoorValid(veh, door) then
				if veh ~= GetVehiclePedIsIn(ped) then
					if GetVehicleDoorAngleRatio(veh, door) > 0.0 then
						if not IsVehicleSeatFree(veh, -1) then
							TriggerServerEvent('MojiaRadialMenu:server:Door', false, plate, door)
						else
							SetVehicleDoorShut(veh, door, false)
						end
					else
						if not IsVehicleSeatFree(veh, -1) then
							TriggerServerEvent('MojiaRadialMenu:server:Door', true, plate, door)
						else
							SetVehicleDoorOpen(veh, door, false, false)
						end
					end
				else
					if GetVehicleDoorAngleRatio(veh, door) > 0.0 then
						SetVehicleDoorShut(veh, door, false)
					else
						SetVehicleDoorOpen(veh, door, false, false)
					end
				end
			end
		end
	end
end)

RegisterNetEvent('MojiaVehicles:Window', function(data)
    local string = data.id
    local replace = string:gsub("window", "")
    local window = tonumber(replace)
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
			if IsVehicleWindowIntact(veh, window) then
				RollDownWindow(veh, window)
			else
				RollUpWindow(veh, window)
			end
		end
	end
end)

RegisterNetEvent('MojiaRadialMenu:client:Door', function(plate, door, open)
    local veh = GetVehiclePedIsIn(PlayerPedId())
    if veh ~= 0 then
        local pl = QBCore.Functions.GetPlate(veh)

        if pl == plate then
            if open then
                SetVehicleDoorOpen(veh, door, false, false)
            else
                SetVehicleDoorShut(veh, door, false)
            end
        end
    end
end)

RegisterNetEvent('MojiaVehicles:changeSeat', function(data)
    local string = data.id
    local replace = string:gsub("seat", "")
    local seat = tonumber(replace)
	PlayerData = QBCore.Functions.GetPlayerData()
	if not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() then 
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			veh = GetVehiclePedIsIn(ped)
			if IsVehicleSeatFree(veh, seat) then
				SetPedIntoVehicle(PlayerPedId(), veh, seat)
			end
		end
	end
end)