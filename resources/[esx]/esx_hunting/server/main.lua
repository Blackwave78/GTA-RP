ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_hunting:harvestMeat')
AddEventHandler('esx_hunting:harvestMeat', function()
	
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addInventoryItem('meat', 4)
	
	TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ramassé 4x ~r~Viande')

end)

-- ESX.RegisterUsableItem('meat', function(source)

	-- local xPlayer = ESX.GetPlayerFromId(source)

	-- xPlayer.removeInventoryItem('meat', 1)

	-- TriggerEvent('esx_status:getStatus', xPlayer.source, 'hunger', function(status)

		-- status.add(50000)
		-- status.updateClient()

		-- TriggerClientEvent('esx_basicneeds:onEat', xPlayer.source)
		-- TriggerClientEvent('esx_hunting:onEatMeat', xPlayer.source)
		-- TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez utilisé 1x ~r~Viande')

	-- end)

-- end)
