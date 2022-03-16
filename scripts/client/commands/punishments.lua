RegisterNUICallback('warn', function(data, cb)
    data.staff = GetPlayerName(PlayerId()) .. "[" .. GetPlayerServerId() .. "]"
    TriggerServerEvent('rdrp_admin:warn', source, data, Config.Perms.Warn )

end)

RegisterNUICallback('chain', function(data, cb)


end)

RegisterNUICallback('slap', function(data, cb)


end)

RegisterNUICallback('slay', function(data, cb)


end)

RegisterNUICallback('kick', function(data, cb)


end)

RegisterNUICallback('ban', function(data, cb)


end)


RegisterNetEvent('rdrp_admin:warn', function(data)
    print("YOU HAVE BEEN WARNED")
    print("--------------------------------")
    print(data)
end)