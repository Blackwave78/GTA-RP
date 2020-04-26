local cellblockOpen = false

RegisterNetEvent("pf_sv:setPosition")
AddEventHandler("pf_sv:setPosition", function(x, y, z)
    TriggerClientEvent("pf_cl:setPosition", -1, source, x, y, z)
end)