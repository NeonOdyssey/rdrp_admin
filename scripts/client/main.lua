Keys = {
    Open = 0x3C3DD371
}

Citizen.CreateThread(function() 
    -- Check if player is wanting to open the admin menu
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, Keys.Open) then
            TriggerEvent('rdrp_admin:_open')
        end
    end
end)



-------------------------
-- NET EVENTS
-------------------------

-- open menu and send all players
RegisterNetEvent('rdrp_admin:_open', function()
    if TriggerServerEvent('rdrp_admin:allowAccess', 'open') then
        SetNuiFocus(true, true)
        SendNUIMessage({type = "open", players = getPlayersAll()})
    end
end)


-------------------------
-- NUI CALLBACKS
-------------------------

-- When menu closes remove focus
RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false)
    cb({error = ''})
end)


-------------------------
-- FUNCTIONS
-------------------------

-- Get players close to player

-- Get all players in server
function getPlayersAll()
    local players = {}
    for i = 0, 32 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, {id = GetPlayerServerId(i), name = GetPlayerName(i)})
        end
    end
    return players
end