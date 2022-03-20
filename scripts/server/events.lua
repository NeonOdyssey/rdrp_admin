RegisterServerEvent('rdrp_admin:allowAccess')
AddEventHandler('rdrp_admin:allowAccess', function(src, perms)
    print(perms)
    if checkPerms(source, perms) then
        print("Permission allowed")
        TriggerClientEvent('rdrp_admin:open', source)
    end
end)

RegisterServerEvent('rdrp_admin:goto')
AddEventHandler('rdrp_admin:goto', function(src, data, perms)

end)

RegisterServerEvent('rdrp_admin:goto')
AddEventHandler('rdrp_admin:goto', function(src, data, perms)   
    if checkPerms(src, perms) then
        local ped = GetPlayerPed(src)
        local coords = GetEntityCoords(GetPlayerPed(data.player))
        SetEntityCoords(ped , coords)
        exports.rdrp_logs:console(data.staff.." teleported to "..player(data.player), GetCurrentResourceName(), "info")
        exports.rdrp_logs:discord(data.staff.." teleported to "..player(data.player), "admin", GetCurrentResourceName(), "/goto", {{["name"] = "Coords", ["value"] = jason.encode(coords)}})
    end
end)

RegisterServerEvent('rdrp_admin:bring')
AddEventHandler('rdrp_admin:bring', function(src, data, perms)   
    if checkPerms(src, perms) then
        local ped = GetPlayerPed(data.player)
        local coords = GetEntityCoords(GetPlayerPed(src))
        SetEntityCoords(ped , coords)
        exports.rdrp_logs:console(data.staff.." teleported "..player(data.player).." to themself", GetCurrentResourceName(), "info")
        exports.rdrp_logs:discord(data.staff.." teleported "..player(data.player).." to themself", "admin", GetCurrentResourceName(), "/bring", {{["name"] = "Coords", ["value"] = jason.encode(coords)}})
    end
end)

RegisterServerEvent('rdrp_admin:warn')
AddEventHandler('rdrp_admin:warn', function(src, data, perms)   
    if checkPerms(src, perms) then
        print("!!!! WARNING !!!!")
        TriggerClientEvent('rdrp_admin:warn', data.player, data.data)
        exports.rdrp_logs:console(data.staff .. " warned " .. player(data.player) .. " with reason: " .. data.data, GetCurrentResourceName(), "info")
        exports.rdrp_logs:discord(data.staff .. " warned " .. player(data.player), "admin", GetCurrentResourceName(), "/warn", {{["name"] = "Reason", ["value"] = data.data}})
    end
end)

RegisterServerEvent('rdrp_admin:slap')
AddEventHandler('rdrp_admin:slap', function(src, data, perms)   
    if checkPerms(src, perms) then
        TriggerClientEvent('rdrp_admin:slap', data.player)
        print(data.staff)
        exports.rdrp_logs:console(data.staff .. " slapped " .. player(data.player), GetCurrentResourceName(), "info")
        exports.rdrp_logs:discord(data.staff .. " slapped " .. player(data.player), "admin", GetCurrentResourceName(), "/slap")
    end
end)

RegisterServerEvent('rdrp_admin:slay')
AddEventHandler('rdrp_admin:slay', function(src, data, perms)   
    if checkPerms(src, perms) then
        TriggerClientEvent('rdrp_admin:slay', data.player)
        exports.rdrp_logs:console(data.staff .. " slayed " .. player(data.player), GetCurrentResourceName(), "info")
        exports.rdrp_logs:discord(data.staff .. " slayed " .. player(data.player), "admin", GetCurrentResourceName(), "/slay")
    end
end)

RegisterServerEvent('rdrp_admin:spectate_start')
AddEventHandler('rdrp_admin:spectate_start', function(src, data, perms)
    if checkPerms(src, perms) then
        local _coords = GetEntityCoords(GetPlayerPed(data.player))
        SetEntityCoords(GetPlayerPed(src) ,_coords.x , _coords.y, _coords.z-50 )
        TriggerClientEvent('rdrp_admin:spectate_start', src, data)
        exports.rdrp_logs:console(data.staff .. " started to spectate " .. player(data.player), GetCurrentResourceName(), "info")
        exports.rdrp_logs:discord(data.staff .. " is now spectating " .. player(data.player), "admin", GetCurrentResourceName(), "/spectate")
    end
end)



function player(player)
    return "["..player.."]"..GetPlayerName(player)
end

-- Check if player has perm levels
function checkPerms(src, perms)
    TriggerEvent('redemrp:getPlayerFromId', src, function(user)
        if perms == 0 then return checkMod(user) 
        elseif perms == 1 then return checkAdmin(user) 
        elseif perms == 2 then return checkSenior(user)
        elseif perms == 3 then return checkManager(user)
        elseif perms == 4 then return checkSuper(user) end

    end)
    return true
end

function checkMod(user)
    if user.getGroup() == 'superAdmin' or user.getGroup() == 'manager' or user.getGroup() == 'senior' or user.getGroup() == 'admin' or user.getGroup() == 'mod' and src ~= 0 then
        return true
    end
    print('')
end

function checkAdmin(user)
    if user.getGroup() == 'superAdmin' or user.getGroup() == 'manager' or user.getGroup() == 'senior' or user.getGroup() == 'admin' and src ~= 0 then
        return true
    end
end

function checkSenior(user)
    if user.getGroup() == 'superAdmin' or user.getGroup() == 'manager' or user.getGroup() == 'senior' and src ~= 0 then
        return true
    end
end

function checkManager(user)
    if user.getGroup() == 'superAdmin' or user.getGroup() == 'manager' and src ~= 0 then
        return true
    end
end

function checkSuper(user)
    if user.getGroup() == 'superAdmin'and src ~= 0 then
        return true
    end
end
