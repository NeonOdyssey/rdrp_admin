RegisterCommand("rdrp_goto", function() TriggerServerEvent('rdrp_admin:allowAccess', 'goto', data.player) end, false)
RegisterNUICallback('goto', function(data, cb) TriggerServerEvent('rdrp_admin:allowAccess', 'goto', data.player) end)


RegisterCommand("rdrp_bring", function() TriggerServerEvent('rdrp_admin:allowAccess', 'bring', data.player) end, false)
RegisterNUICallback('bring', function(data, cb) TriggerServerEvent('rdrp_admin:allowAccess', 'bring', data.player) end)


RegisterCommand("rdrp_tpm", function() TriggerServerEvent('rdrp_admin:allowAccess', 'tpm') end, false)
RegisterNUICallback('tpm', function(data, cb) TriggerServerEvent('rdrp_admin:allowAccess', 'tpm') end)
RegisterNetEvent('rdrp_admin:_tpm', function()
    local ply = PlayerPedId()
    if DoesEntityExist(ply) then
        local WaypointV = GetWaypointCoords()
        if WaypointV[1] ~= 0.00 then
            for height = 1, 1000 do
                SetEntityCoords(ply, WaypointV.x, WaypointV.y, height + 0.0)
                local foundground, groundZ, normal = GetGroundZAndNormalFor_3dCoord(WaypointV.x, WaypointV.y, height + 0.0)
                if foundground then SetEntityCoords(ply, WaypointV.x, WaypointV.y, height + 0.0) break end
                Wait(15)
            end
        end
    end
end)
