
Citizen.CreateThread(function()

    -- Check if player is wanting to open the admin menu
    while true do
        Citizen.wait(0)
        IsControlJustReleased(0, Config.Keys['OPEN']) and TriggerServerEvent('rdrp_admin:open', source) or return
    end

end)



-------------------------
-- NET EVENTS
-------------------------

-- open menu and send all players
RegisterNetEvent('rdrp_admin:_open')
AddEventHandler('rdrp_admin:_open', function()
    SetNuiFocus(true, true)
    SendNUIMessage({type = "open", players = getPlayersAll()})
end)



-------------------------
-- NUI CALLBACKS
-------------------------

-- When menu closes remove focus
RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false)
end)



-------------------------
-- FUNCTIONS
-------------------------

-- Get players close to player
-- function getPlayersNearest()
--     local players = {}
--     for i = 0, 32 do
--         if NetworkIsPlayerActive(i) then
--             table.insert(players, {id = GetPlayerServerId(i), name = GetPlayerName(i)})
--         end
--     end
--     return players
-- end

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