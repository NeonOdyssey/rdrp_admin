RegisterServerEvent('rdrp_admin:open')
AddEventHandler('rdrp_admin:open', function()

    TriggerEvent('redemrp:getPlayerFromId', source, function(user)                          -- Grab the player by their ID

        if user.getGroup() == 'superAdmin' and source ~= 0 then                             -- Check if the player is a super admin
            if Config.Roles['SUPER'] then TriggerClient('rdrp_admin:_open', source) end     -- Check if super admin can open menu

        elseif user.getGroup() == 'admin' and source ~= 0 then                              -- Check if the player is an admin
            if Config.Roles['ADMIN'] then TriggerClient('rdrp_admin:_open', source) end     -- Check if admin can open menu

        elseif user.getGroup() == 'mod' and source ~= 0 then                                -- Check if the player is a mod
            if Config.Roles['MOD'] then TriggerClient('rdrp_admin:_open', source) end       -- Check if mod can open menu
        end
    end) 

end)