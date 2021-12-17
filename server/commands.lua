local QBCore = exports['MojiaCity']:GetCoreObject()

QBCore.Commands.Add('admincar', 'Save Vehicle To Your Garage (Admin Only)', {}, false, function(source, args)
    local ply = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('MojiaRadialMenu:client:SaveCar', source)
end, 'admin')