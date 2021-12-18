## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-menu](https://github.com/qbcore-framework/qb-menu)
- [MojiaClipboard](https://github.com/hoangducdt/MojiaClipboard)


## Add this event to qb-vehiclekeys server side:(Need test)
```
RegisterNetEvent('vehiclekeys:server:CheckHasKey', function(plate)
    local Player = QBCore.Functions.GetPlayer(source)
    return CheckOwner(plate, Player.PlayerData.citizenid)
end)
```
