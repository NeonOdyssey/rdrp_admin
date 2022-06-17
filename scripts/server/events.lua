RegisterServerEvent('rdrp_admin:allowAccess')
AddEventHandler('rdrp_admin:allowAccess', function(accessType, data)
    local src = source
    
    -- Check if the user has permission to open the admin menu
    if accessType == "open" then
        TriggerEvent('redemrp:getPlayerFromId', src, function(user)
            if user.getGroup():lower() == 'superadmin' and src ~= 0 then
                if Config.Perms.Open <= 2 then TriggerClientEvent('rdrp_admin:open', src, Players()) end
    
            elseif user.getGroup():lower() == 'admin' and src ~= 0 then
                if Config.Perms.Open <= 1 then TriggerClientEvent('rdrp_admin:open', src, Players()) end
    
            elseif user.getGroup():lower() == 'mod' and src ~= 0 then
                if Config.Perms.Open <= 0 then TriggerClientEvent('rdrp_admin:open', src, Players()) end

            end
        end)

    -- elseif accessType == 'dm'           and checkPerms(src, Config.Perms.Dm)        then 
    -- elseif accessType == 'announce'     and checkPerms(src, Config.Perms.Announce)  then 

    elseif accessType == 'goto'         and checkPerms(src, Config.Perms.Goto)      then SetEntityCoords(GetPlayerPed(src) , GetEntityCoords(GetPlayerPed(data)))
    elseif accessType == 'tpm'          and checkPerms(src, Config.Perms.Tpm)       then TriggerClientEvent('rdrp_admin:_tpm', src)
    elseif accessType == 'bring'        and checkPerms(src, Config.Perms.Bring)     then SetEntityCoords(GetPlayerPed(data) , GetEntityCoords(GetPlayerPed(src)))
    elseif accessType == 'noclip'       and checkPerms(src, Config.Perms.Noclip)    then TriggerClientEvent('rdrp_admin:_noclip', src)

    elseif accessType == 'ghost'        and checkPerms(src, Config.Perms.Ghost)     then TriggerClientEvent('rdrp_admin:_ghost', src)
    elseif accessType == 'heal'         and checkPerms(src, Config.Perms.Heal)      then TriggerClientEvent('rdrp_admin:_heal', data.player)
    -- elseif accessType == 'spectate'     and checkPerms(src, Config.Perms.Spectate)  then 

    elseif accessType == 'dv'           and checkPerms(src, Config.Perms.Dv)        then TriggerClientEvent('rdrp_admin:_dv', src)
    -- elseif accessType == 'cleararea'    and checkPerms(src, Config.Perms.ClearArea) then 
    elseif accessType == 'coords'       and checkPerms(src, Config.Perms.Coords)    then TriggerClientEvent('rdrp_admin:_coords', src)

    elseif accessType == 'warn'         and checkPerms(src, Config.Perms.Warn)      then 
    elseif accessType == 'chain'        and checkPerms(src, Config.Perms.Chain)     then 
    elseif accessType == 'slap'         and checkPerms(src, Config.Perms.Slap)      then 
    elseif accessType == 'slay'         and checkPerms(src, Config.Perms.Slay)      then 
    elseif accessType == 'kick'         and checkPerms(src, Config.Perms.Kick)      then 
    elseif accessType == 'ban'          and checkPerms(src, Config.Perms.Ban)       then 

    elseif accessType == 'job'          and checkPerms(src, Config.Perms.Job)       then 
    elseif accessType == 'money'        and checkPerms(src, Config.Perms.Money)     then 
    elseif accessType == 'gold'         and checkPerms(src, Config.Perms.Gold)      then 
    elseif accessType == 'staffperms'   and checkPerms(src, Config.Perms.StaffPerms)then 
    else  print('Get fucked mate!!') end
end)



function Players()
    local players = {}
    for k,i in pairs(GetPlayers()) do
        table.insert(players, {id = i, name = GetPlayerName(i)})
    end
    return players
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


