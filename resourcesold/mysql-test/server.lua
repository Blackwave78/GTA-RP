RegisterServerEvent('mysql-test:rent')
AddEventHandler('mysql-test:rent', function(target, property, price)

  local xPlayer = ESX.GetPlayerFromId(target)

 -- TriggerEvent('esx_property:setPropertyOwned', property, price, true, xPlayer.identifier)
end)




RegisterNetEvent("monEventServer")
AddEventHandler("monEventServer", function(var1)
 --   local player_id = source
    print("monEventServer a été déclenché par " .. var1)
    TriggerClientEvent("monEventClient", var1)
end)


--TriggerClientEvent("monEventClient", var1) --Déclenche un événement coté client, correspondant au player_id, depuis le serveur