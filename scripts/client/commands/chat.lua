
-- Direct message staff > player
RegisterNUICallback('directMessage', function(data, cb)
    data.staff = GetPlayerName(PlayerId())

    if data.player == GetPlayerServerId(PlayerId()) then
        TriggerEvent('chat:addMessage', {
            color = { 237, 81, 81 },
            multiline = true,
            args = {"Staff Direct Message", data.data}
        })
    end

end)