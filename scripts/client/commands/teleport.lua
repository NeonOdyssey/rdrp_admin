-- NUI callbacks

RegisterNUICallback('goto', function(data, cb)
    data.staff = GetPlayerName(PlayerId())
    TriggerServerEvent('rdrp_admin:goto', source, data, Config.Perms.Goto )
end)

RegisterNUICallback('bring', function(data, cb)
    data.staff = GetPlayerName(PlayerId())
    TriggerServerEvent('rdrp_admin:bring', source, data, Config.Perms.Bring )
end)


-- Net events for NUI callbacks

-- Bring player
RegisterNetEvent('rdrp_admin:bring', function()
    
end)