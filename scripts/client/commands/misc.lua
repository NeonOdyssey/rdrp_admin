RegisterNUICallback('heal', function(data, cb)
    data.staff = GetPlayerName(PlayerId())
	TriggerServerEvent('rdrp_admin:heal', source, data, Config.Perms.Heal)
end)

RegisterNUICallback('spectate', function(data, cb)
    data.staff = GetPlayerName(PlayerId())
    TriggerServerEvent('rdrp_admin:spectate', source, data, Config.Perms.Spectate )
end)

RegisterNetEvent('rdrp_admin:heal', function(data)
    TriggerServerEvent('redemrp_status:AddAmount', 100, 100)
end)