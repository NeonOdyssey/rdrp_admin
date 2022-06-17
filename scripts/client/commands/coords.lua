-- Copy coords to clipboard
RegisterNUICallback('coords', function(data, cb) TriggerServerEvent('rdrp_admin:allowAccess', 'coords') end)
RegisterCommand("rdrp_coords", function() TriggerServerEvent('rdrp_admin:allowAccess', 'coords') end, false)
RegisterNetEvent('rdrp_admin:_coords', function() SendNuiMessage(json.encode({type = "copyToClipboard", coords = coords()})) end)

function coords()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    local mnt = GetMount(ped)
    local entity = (veh == 0 and (mnt == 0 and ped or mnt) or veh)
    local _x, _y, _z = table.unpack(GetEntityCoords(entity))

    return { x = _x, y = _y, z = _z, heading = GetEntityHeading(entity) }
end