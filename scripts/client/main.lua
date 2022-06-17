RegisterCommand("rdrp_admin", function()
    TriggerEvent('rdrp_admin:_open')
end, false)

Citizen.CreateThread(function()
	while true do
        SetDiscordAppId(947262835598163968)
        SetRichPresence("In County: "..#GetActivePlayers().." Players")
		SetDiscordRichPresenceAsset('unchainedrp_logo')
        SetDiscordRichPresenceAssetText('UCRP.co.uk')
        SetDiscordRichPresenceAction(0, "Join!", "https://discord.gg/uncrp")
		Citizen.Wait(60000)
	end
end)


-------------------------
-- NET EVENTS
-------------------------

-- open menu and send all players
RegisterNetEvent('rdrp_admin:_open', function() TriggerServerEvent('rdrp_admin:allowAccess', 'open') end)

RegisterNetEvent('rdrp_admin:open', function(players)
    SetNuiFocus(true, true)
    SendNUIMessage({type = "open", players = players})
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
function getPlayers()
    local players = {}
    for _, player in ipairs(GetActivePlayers()) do
        table.insert(players, {id = GetPlayerServerId(player), name = GetPlayerName(player)})
    end
    return players
end