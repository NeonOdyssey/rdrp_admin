-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------

RegisterNetEvent("RDRP:Admin:Server:ProcessCallback", function(event, ticket, perm)
    local src = source
	local p = promise.new()

    TriggerEvent("RDRP:Admin:CheckIf" + event, function(...)
		p:resolve({...})
	end, src, src)

	local result = Citizen.Await(p)

	TriggerClientEvent(('RDRP:Admin:Client:Callback:%s:%s'):format(event, ticket), src, ServerCb(result))
end)

-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------

RegisterServerEvent("RDRP:Admin:CheckIfSuperAdmin", function(src)
	TriggerEvent('redemrp:getPlayerFromId', src, function(user)
		if user.getGroup() == 'superAdmin' and src ~= 0 then 
			
		end
	end)
end)

RegisterServerEvent("RDRP:Admin:CheckIfAdmin", function(src)
	TriggerEvent('redemrp:getPlayerFromId', src, function(user)
		if user.getGroup() == 'superAdmin' or user.getGroup() == 'admin' and src ~= 0 then
			
		end
	end)
end)

RegisterServerEvent("RDRP:Admin:CheckIfMod", function(src)
	TriggerEvent('redemrp:getPlayerFromId', src, function(user)
		if user.getGroup() == 'superAdmin' or user.getGroup() == 'admin' or user.getGroup() == 'mod' and src ~= 0 then
			
		end
	end)
end)

-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------