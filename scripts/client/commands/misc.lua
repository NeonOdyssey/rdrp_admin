RegisterCommand('rdrp_heal', function(id) TriggerServerEvent('rdrp_admin:allowAccess', 'heal', id) end, false)
RegisterNUICallback('heal', function(data) TriggerServerEvent('rdrp_admin:allowAccess', 'heal', data) end)
RegisterNetEvent('rdrp_admin:_heal', function() 
    print( "healing you", PlayerPedId() )
    Citizen.InvokeNative( 0xC6258F41D86676E0 , PlayerPedId(), 0 ,100)
    TriggerServerEvent('redemrp_status:AddAmount', 100, 100)
end)

RegisterNUICallback('spectate', function(data, cb)


end)