
ESX = nil
local PlayersTransforming  = {}
local PlayersSelling       = {}
local PlayersHarvesting = {}
local tabacsec = 1
local jus = 1


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'ferme', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'ferme', _U('fermier_client'), true, true)
TriggerEvent('esx_society:registerSociety', 'ferme', 'ferme', 'society_ferme', 'society_ferme', 'society_ferme', {type = 'private'})

local function Harvest(source, zone)
	if PlayersHarvesting[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "blefarm" then
			local itemQuantity = xPlayer.getInventoryItem('blé').count
			if itemQuantity >= 100 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_raisin'))
				return
			else
				local rand = math.random(0,100)
				if (rand >= 98) then --a changer (baisser la valeur pour en avoir plus ....)
					SetTimeout(1800, function()
						xPlayer.addInventoryItem('blé', 1)
						xPlayer.addInventoryItem('vegetables', 1)
						TriggerClientEvent('esx:showNotification', source, _U('grand_cru'))
						Harvest(source, zone)
					end)
				else
					SetTimeout(1800, function()
						--xPlayer.removeInventoryItem('raisin', 1)
						xPlayer.addInventoryItem('blé', 1)
				
						Harvest(source, zone)
					end)
				end
			end
		end
	end
end


RegisterServerEvent('esx_fermier:startHarvest')
AddEventHandler('esx_fermier:startHarvest', function(zone)
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


RegisterServerEvent('esx_fermier:stopHarvest')
AddEventHandler('esx_fermier:stopHarvest', function()
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
		if zone == "TraitementBle" then
			local itemQuantity = xPlayer.getInventoryItem('blé').count
			
			if itemQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_feuilletab'))
				return
			else
				local rand = math.random(0,100)
				if (rand >= 98) then
					SetTimeout(1800, function()
						xPlayer.removeInventoryItem('blé', 1)
						xPlayer.addInventoryItem('farine_blé', 1)
						TriggerClientEvent('esx:showNotification', source, _U('tabacsec'))
						Transform(source, zone)
					end)
				else
					SetTimeout(1800, function()
						xPlayer.removeInventoryItem('blé', 1)
						xPlayer.addInventoryItem('farine_blé', 1)
				
						Transform(source, zone)
					end)
				end
			end
		--elseif zone == "TraitementJus" then
		--	local itemQuantity = xPlayer.getInventoryItem('feuilletab').count
		--	if itemQuantity <= 0 then
		--		TriggerClientEvent('esx:showNotification', source, _U('not_enough_feuilletab'))
		--		return
		--	else
		--		SetTimeout(1800, function()
		--			xPlayer.removeInventoryItem('feuilletab', 1)
		--			xPlayer.addInventoryItem('tabacsec', 1)
		--
		--			Transform(source, zone)	  
		--		end)
		--	end
		end
	end	
end

RegisterServerEvent('esx_fermier:startTransform')
AddEventHandler('esx_fermier:startTransform', function(zone)
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

RegisterServerEvent('esx_fermier:stopTransform')
AddEventHandler('esx_fermier:stopTransform', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre feuilletab')
		PlayersTransforming[_source]=true
		
	end
end)

local function Sell(source, zone)

	if PlayersSelling[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		
		if zone == 'SellFarm' then
			if xPlayer.getInventoryItem('farine_blé').count <= 0 then
				vine = 0
			else
				vine = 1
			end
			
			if xPlayer.getInventoryItem('farine_blé').count <= 0 then
				jus = 0
			else
				jus = 1
			end
		
			if vine == 0 and jus == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_product_sale'))
				return
			elseif xPlayer.getInventoryItem('farine_blé').count <= 0 and jus == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_vin_sale'))
				vine = 0
				return
			elseif xPlayer.getInventoryItem('farine_blé').count <= 0 and vine == 0then
				TriggerClientEvent('esx:showNotification', source, _U('no_jus_sale'))
				jus = 0
				return
			else
				if (jus == 1) then
					SetTimeout(1100, function()
						local money = math.random(15,45)
						xPlayer.removeInventoryItem('farine_blé', 1)
						local societyAccount = nil

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ferme', function(account)
							societyAccount = account
						end)
						if societyAccount ~= nil then
							societyAccount.addMoney(money)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. money)
						end
						Sell(source,zone)
					end)
				elseif (vine == 1) then
					SetTimeout(1100, function()
						local money = math.random(15,45)
						xPlayer.removeInventoryItem('vine', 1)
						local societyAccount = nil

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ferme', function(account)
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

RegisterServerEvent('esx_fermier:startSell')
AddEventHandler('esx_fermier:startSell', function(zone)

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

RegisterServerEvent('esx_fermier:stopSell')
AddEventHandler('esx_fermier:stopSell', function()

	local _source = source
	
	if PlayersSelling[_source] == true then
		PlayersSelling[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~vendre')
		PlayersSelling[_source]=true
	end

end)



ESX.RegisterServerCallback('esx_fermier:getPlayerInventory', function(source, cb)
  --printDebug('getPlayerInventory')
  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory
  cb({
    items      = items
  })
end)


ESX.RegisterServerCallback('esx_fermier:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ferme', function(inventory)
		cb(inventory.items)
	end)
end)


RegisterServerEvent('esx_fermier:getInventoryItem')
AddEventHandler('esx_fermier:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	--if xPlayer.job.name ~= 'taxi' then
	--	print(('esx_taxijob: %s attempted to trigger getStockItem!'):format(xPlayer.identifier))
	--	return
	--end
	
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ferme', function(inventory)
		local item = inventory.getItem(itemName)
		local sourceItem = xPlayer.getInventoryItem(itemName)

		-- is there enough in the society?
		if count > 0 and item.count >= count then
		
			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('player_cannot_hold'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn', count, item.label))
			end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

RegisterServerEvent('esx_fermier:putStockItems')
AddEventHandler('esx_fermier:putStockItems', function(itemName, count)
local xPlayer = ESX.GetPlayerFromId(source)

--	if xPlayer.job.name ~= 'taxi' then
--		print(('esx_taxijob: %s attempted to trigger getStockItem!'):format(xPlayer.identifier))
--		return
--	end
	
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ferme', function(inventory)
		local item = inventory.getItem(itemName)
		local sourceItem = xPlayer.getInventoryItem(itemName)

		-- is there enough in the society?
		if count > 0 and item.count >= count then
		
			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('player_cannot_hold'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn', count, item.label))
			end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

--ESX.RegisterServerCallback('esx_fermier:getPlayerInventory', function(source, cb)
--
--	local xPlayer    = ESX.GetPlayerFromId(source)
--	local items      = xPlayer.inventory
--
--	cb( { items      = items } )
--
--end)


--ESX.RegisterUsableItem('jus_feuilletab', function(source)
--
--	local xPlayer = ESX.GetPlayerFromId(source)
--
--	xPlayer.removeInventoryItem('jus_feuilletab', 1)
--
--	TriggerClientEvent('esx_status:add', source, 'hunger', 40000)
--	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
--	TriggerClientEvent('esx_basicneeds:onDrink', source)
--	TriggerClientEvent('esx:showNotification', source, _U('used_jus'))

--end)

--ESX.RegisterUsableItem('grand_cru', function(source)
--
--	local xPlayer = ESX.GetPlayerFromId(source)
--
--	xPlayer.removeInventoryItem('grand_cru', 1)
--
--	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
--	TriggerClientEvent('esx_basicneeds:onDrink', source)
--	TriggerClientEvent('esx:showNotification', source, _U('used_grand_cru'))

--end)
