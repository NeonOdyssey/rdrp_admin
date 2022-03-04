RegisterServerEvent('rdrp_admin:allowAccess')
AddEventHandler('rdrp_admin:allowAccess', function(type)

    allowAccess = false
    
    if type == "open" then
        -- TriggerEvent('redemrp:getPlayerFromId', source, function(user)                          -- Grab the player by their ID
        --     if user.getGroup() == 'superAdmin' and source ~= 0 then                             -- Check if the player is a super admin
        --         if Config.Roles['SUPER'] then allowAccess = true end                            -- Check if super admin can open menu

        --     elseif user.getGroup() == 'admin' and source ~= 0 then                              -- Check if the player is an admin
        --         if Config.Roles['ADMIN'] then allowAccess = true end                            -- Check if admin can open menu

        --     elseif user.getGroup() == 'mod' and source ~= 0 then                                -- Check if the player is a mod
        --         if Config.Roles['MOD'] then allowAccess = true end                              -- Check if mod can open menu
        --     end
        -- end) 

        allowAccess = true

    elseif type == "super" then
        TriggerEvent('redemrp:getPlayerFromId', source, function(user)
            if user.getGroup() == 'superAdmin' and source ~= 0 then
                allowAccess = true
            end
        end)

    elseif type == "admin" then
        TriggerEvent('redemrp:getPlayerFromId', source, function(user)
            if user.getGroup() == 'superAdmin' or user.getGroup() == 'admin' and source ~= 0 then
                allowAccess = true
            end
        end)

    elseif type == "mod" then
        -- TriggerEvent('redemrp:getPlayerFromId', source, function(user)
        --     if user.getGroup() == 'superAdmin' or user.getGroup() == 'admin' or user.getGroup() == 'mod' and source ~= 0 then
        --         allowAccess = true
        --     end
        -- end)
        allowAccess = false
    end    

    return allowAccess

end)