ESX                = nil
local PlayersHarvesting  = {}
local MarketPrices		= {}
local PlayerData        = {}
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'foodtruck', 'Client FoodTruck', true, true)
TriggerEvent('esx_society:registerSociety', 'foodtruck', 'foodtruck', 'society_foodtruck', 'society_foodtruck', 'society_foodtruck', {type = 'private'})

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'foodtruck', Config.MaxInService)
end


AddEventHandler('onMySQLReady', function ()
--MySQL.Async.fetchAll("SELECT * FROM 'shops' WHERE 'store' = 'Market'",
MySQL.Async.fetchAll("SELECT * FROM `shops2` WHERE `store` = 'Market'",
		{},
		function(result)
			MySQL.Async.fetchAll("SELECT * FROM `items`",
				{},
				function(result2)
					for i=1, #result2, 1 do
						for j=1, #result, 1 do
							if result[j].item == result2[i].name then
								table.insert(MarketPrices, {label = result2[i].label, item = result[j].item, price = result[j].price})
								break
							end
						end
					end
				end
			)			
		end
	)
end)

ESX.RegisterServerCallback('esx_foodtruck:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_foodtruck', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_foodtruck:buyItem')
AddEventHandler('esx_foodtruck:buyItem', function(qtty, item)
	local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)

	for i=1, #MarketPrices, 1 do
		if item == MarketPrices[i].item then
			if qtty == -1 then -- ready for when I add the 'buy max' option
				local delta = max - stock
				local total = MarketPrices[i].price * delta
				if xPlayer.getMoney() > total then
					xPlayer.addInventoryItem(item, delta)
					xPlayer.removeMoney(total)
					TriggerClientEvent('esx:showNotification', _source, _U('purchased'))
				else
					TriggerClientEvent('esx:showNotification', _source, _U('no_money'))
				end
			else
				local total = MarketPrices[i].price * qtty
				if xPlayer.getMoney() > total then
					xPlayer.addInventoryItem(item, qtty)
					xPlayer.removeMoney(total)
					TriggerClientEvent('esx:showNotification', _source, _U('purchased'))
				else
					TriggerClientEvent('esx:showNotification', _source, _U('no_money'))
				end
			end
			break
		end
	end
	
	TriggerClientEvent('esx_foodtruck:refreshMarket', _source)
end)

RegisterServerEvent('esx_foodtruck:removeItem')
AddEventHandler('esx_foodtruck:removeItem', function(item, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem(item, count)
end)

RegisterServerEvent('esx_foodtruck:addItem')
AddEventHandler('esx_foodtruck:addItem', function(item, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem(item, count)
end)



RegisterServerEvent('esx_foodtruck:putStockItems')
AddEventHandler('esx_foodtruck:putStockItems', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_foodtruck', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)

	end)
end)

ESX.RegisterServerCallback('esx_foodtruck:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory
  cb({
    items      = items
  })
end) 


ESX.RegisterServerCallback('esx_foodtruck:getStockItems', function(source, cb)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_foodtruck', function(inventory)
		cb(inventory.items)
	end)

end)