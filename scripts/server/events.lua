RegisterServerEvent('rdrp_admin:allowAccess')
AddEventHandler('rdrp_admin:allowAccess', function(accessType)
    
    -- Check if the user has permission to open the admin menu
    if accessType == "open" then
        -- TriggerEvent('redemrp:getPlayerFromId', source, function(user)                          -- Grab the player by their ID
        --     if user.getGroup() == 'superAdmin' and source ~= 0 then                             -- Check if the player is a super admin
        --         if Config.Roles['SUPER'] then allowAccess = true end                            -- Check if super admin can open menu

        --     elseif user.getGroup() == 'admin' and source ~= 0 then                              -- Check if the player is an admin
        --         if Config.Roles['ADMIN'] then allowAccess = true end                            -- Check if admin can open menu

        --     elseif user.getGroup() == 'mod' and source ~= 0 then                                -- Check if the player is a mod
        --         if Config.Roles['MOD'] then allowAccess = true end                              -- Check if mod can open menu
        --     end
        -- end) 

        TriggerClientEvent('rdrp_admin:open', source)
    end   

end)

RegisterServerEvent('rdrp_admin:warn')
AddEventHandler('rdrp_admin:warn', function(src, data, perms)   
    if checkPerms(src, perms) then
        print("!!!! WARNING !!!!")
        print(data.staff .. " warned '" .. GetPlayerName(data.player) .. "[" .. data.player .. "] with reason: " .. data.data)
    end
end)

RegisterServerEvent('rdrp_admin:warn')
AddEventHandler('rdrp_admin:warn', function(src, data, perms)   
    if checkPerms(src, perms) then
        print("!!!! WARNING !!!!")
        print(data.staff .. " warned '" .. GetPlayerName(data.player) .. "[" .. data.player .. "] with reason: " .. data.data)
        TriggerClientEvent('rdrp_admin:warn', data.player, data.data)
    end
end)









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


