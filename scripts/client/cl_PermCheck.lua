-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------

function AdminPermCheck(event, perm)
    local ticket = GetGameTimer()
    local p = promise.new()

    RegisterNetEvent(('RDRP:Admin:Client:Callback:%s:%s'):format(event, ticket))

    local e = AddEventHandler(('RDRP:Admin:Client:Callback:%s:%s'):format(event, ticket), function(...)
        p:resolve({...})
    end)

    TriggerServerEvent("RDRP:Admin:Server:ProcessCallback", event, ticket, perm)

    local result = Citizen.Await(p)

	RemoveEventHandler(e)
	return table.unpack(result)
end

exports("RDRP_Admin.PermCheck", AdminPermCheck)

-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------