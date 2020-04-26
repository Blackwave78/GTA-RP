
ESX = nil
local PlayersTransforming  = {}
local PlayersSelling       = {}
local PlayersHarvesting = {}
local tabacsec = 1
local jus = 1


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'pompiste', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'pompiste', _U('pompiste_client'), true, true)
TriggerEvent('esx_society:registerSociety', 'pompiste', 'pompiste', 'society_pompiste', 'society_pompiste', 'society_pompiste', {type = 'private'})





local function Harvest(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "PetrolFarm" then
			local itemQuantity = xPlayer.getInventoryItem('petrole').count
			if itemQuantity >= 100 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_place'))
				return
			else
				SetTimeout(1800, function()
					xPlayer.addInventoryItem('petrole', 1)
					Harvest(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('esx_pompiste:startHarvest')
AddEventHandler('esx_pompiste:startHarvest', function(zone)
	local _source = source
  	
	if PlayersHarvesting[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('feuilletab_taken'))  
		Harvest(_source,zone)
	end
end)


RegisterServerEvent('esx_pompiste:stopHarvest')
AddEventHandler('esx_pompiste:stopHarvest', function()
	local _source = source
	
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~récolter')
		PlayersHarvesting[_source]=true
	end
end)














local function Transform(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "PetrolTransform" then
			local itemQuantity = xPlayer.getInventoryItem('petrole').count
			
			if itemQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_feuilletab'))
				return
			else
				--local rand = math.random(0,100)
				--if (rand >= 98) then
				--	SetTimeout(1800, function()
				--		xPlayer.removeInventoryItem('pierreb', 1)
				--		xPlayer.addInventoryItem('or', 1)
						--TriggerClientEvent('esx:showNotification', source, _U('tabacsec'))
				--		Transform(source, zone)
				--	end)
				--else
					SetTimeout(1800, function()
						xPlayer.removeInventoryItem('petrole', 1)
						xPlayer.addInventoryItem('essence', 1)
				
						Transform(source, zone)
					end)
				--end
			end
--		elseif zone == "TraitementJus" then
--			local itemQuantity = xPlayer.getInventoryItem('pierreb').count
--			if itemQuantity <= 0 then
--				TriggerClientEvent('esx:showNotification', source, _U('not_enough_feuilletab'))
--				return
--			else
--				SetTimeout(1800, function()
--					xPlayer.removeInventoryItem('pierreb', 1)
--					xPlayer.addInventoryItem('tabacsec', 1)
--		  
--					Transform(source, zone)	  
--				end)
--			end
		end
	end	
end

RegisterServerEvent('esx_pompiste:startTransform')
AddEventHandler('esx_pompiste:startTransform', function(zone)
	local _source = source
  	
	if PlayersTransforming[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersTransforming[_source]=false
	else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('transforming_in_progress')) 
		Transform(_source,zone)
	end
end)

RegisterServerEvent('esx_pompiste:stopTransform')
AddEventHandler('esx_pompiste:stopTransform', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer vos Pierres')
		PlayersTransforming[_source]=true
		
	end
end)












--[[

local function Sell(source, zone)

	if PlayersSelling[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		
		if zone == 'SellFarm' then
			local itemQuantity = xPlayer.getInventoryItem('or').count
			if xPlayer.getInventoryItem('or').count <= 0 then
				tabacsec = 0
			else
				tabacsec = 1
			end
			local itemQuantity = xPlayer.getInventoryItem('diamon').count
			if xPlayer.getInventoryItem('diamon').count <= 0 then
				jus = 0
			else
				jus = 1
			end
		
			if tabacsec == 0 and jus == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_product_sale'))
				return
			elseif xPlayer.getInventoryItem('or').count <= 0 and jus == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_vin_sale'))
				tabacsec = 0
				return
			elseif xPlayer.getInventoryItem('diamon').count <= 0 and tabacsec == 0then
				TriggerClientEvent('esx:showNotification', source, _U('no_jus_sale'))
				jus = 0
				return
			else
				if (jus == 1) then
					SetTimeout(1100, function()
						local money = math.random(45,45)
						xPlayer.removeInventoryItem('diamon', 1)
						local societyAccount = nil

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mineur', function(account)
							societyAccount = account
						end)
						if societyAccount ~= nil then
							societyAccount.addMoney(money)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. money)
						end
						Sell(source,zone)
					end)
				elseif (tabacsec == 1) then
					SetTimeout(1100, function()
						local money = math.random(45,45)
						xPlayer.removeInventoryItem('or', 1)
						local societyAccount = nil

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mineur', function(account)
							societyAccount = account
						end)
						if societyAccount ~= nil then
							societyAccount.addMoney(money)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. money)
						end
						Sell(source,zone)
					end)
				end
				
			end
		end
	end
end

]]


--[[

RegisterServerEvent('esx_mineurjob:startSell')
AddEventHandler('esx_mineurjob:startSell', function(zone)

	local _source = source
	
	if PlayersSelling[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersSelling[_source]=false
	else
		PlayersSelling[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
		Sell(_source, zone)
	end

end)

RegisterServerEvent('esx_mineurjob:stopSell')
AddEventHandler('esx_mineurjob:stopSell', function()

	local _source = source
	
	if PlayersSelling[_source] == true then
		PlayersSelling[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~vendre')
		PlayersSelling[_source]=true
	end

end)

]]



----------------work---------------------
RegisterServerEvent('esx_pompiste:getStockItem')
AddEventHandler('esx_pompiste:getStockItem', function(itemName, count)
	
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pompiste', function(inventory)

		local inventoryItem = inventory.getItem(itemName)

		if count > 0 and inventoryItem.count >= count then
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, _U('have_withdrawn', count, inventoryItem.label))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
		end
	end)

 
end)
----------------work---------------------
ESX.RegisterServerCallback('esx_pompiste:getStockItems', function(source, cb)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pompiste', function(inventory)
		cb(inventory.items)
	end)

end)

RegisterServerEvent('esx_pompiste:putStockItems')
AddEventHandler('esx_pompiste:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pompiste', function(inventory)

		local inventoryItem = inventory.getItem(itemName)
		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', count, inventoryItem.label))
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

	end)
end)

ESX.RegisterServerCallback('esx_pompiste:getPlayerInventory', function(source, cb)

	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({
		items      = items
	})

end)
----------------work---------------------