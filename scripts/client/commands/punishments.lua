-- NUI callbacks

RegisterNUICallback('warn', function(data, cb)
    data.staff = GetPlayerName(PlayerId()) .. "[" .. GetPlayerServerId() .. "]"
    TriggerServerEvent('rdrp_admin:warn', source, data, Config.Perms.Warn )

end)

RegisterNUICallback('chain', function(data, cb)


end)

RegisterNUICallback('slap', function(data, cb)
    TriggerServerEvent('rdrp_admin:slap', source, data, Config.Perms.Slap )
end)

RegisterNUICallback('slay', function(data, cb)
    TriggerServerEvent('rdrp_admin:slay', source, data, Config.Perms.Slay )
end)

RegisterNUICallback('kick', function(data, cb)


end)

RegisterNUICallback('ban', function(data, cb)


end)


-- Net events for NUI callbacks

-- Warn player
RegisterNetEvent('rdrp_admin:warn', function(data)
    print("YOU HAVE BEEN WARNED")
    print("--------------------------------")
    print(data)
end)

-- Slap player
RegisterNetEvent('rdrp_admin:slap', function()
    local ped = GetPlayerPed(PlayerId())
    ApplyDamageToPed(ped, 10, false, true, true)
end)

-- Slay player
RegisterNetEvent('rdrp_admin:slay', function()
    local ped = GetPlayerPed(PlayerId())
    ApplyDamageToPed(ped, 500000, false, true, true)
end)


RegisterNetEvent('rdrp_admin:slay', function()
    
end)


RegisterNetEvent('rdrp_admin:slay', function()
    
end)

