
-- Direct message staff > player
RegisterNUICallback('directMessage', function(data, cb)

    if data.player == GetPlayerServerId(PlayerId()) then
        print(data.player .. " = " .. GetPlayerServerId(PlayerId()))
        print(data.data)
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {"System", "Direct message from staff member:\n" + data.data}
        })
    end

end)