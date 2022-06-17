-------------------------
-- Ghost Config
-------------------------

Ghost = {
    Status  = false,
    Player  = PlayerPedId()
}


-------------------------
-- NUI Callback
-------------------------
RegisterCommand("rdrp_ghost", function() TriggerServerEvent('rdrp_admin:allowAccess', 'ghost') end, false)
RegisterNUICallback('ghost', function() TriggerServerEvent('rdrp_admin:allowAccess', 'ghost') end)
RegisterNetEvent('rdrp_admin:_ghost', function()
    ghostToggle()
    if Config.Ghost.CloseOnToggle then SendNUIMessage({type = "close", ghostStatus = not Ghost.Status}) end
end)


-------------------------
-- Ghost Functions
-------------------------

function ghostToggle()
    Ghost.Status = not Ghost.Status
    SetEntityVisible(Ghost.Player, not Ghost.Status, false)
end