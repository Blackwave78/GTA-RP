
ESX = nil
local PlayersTransforming  = {}
local PlayersSelling       = {}
local PlayersHarvesting = {}
--local vine = 1 
local bois = 1
--local jus = 1
local cuttedbois = 1

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

 
if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'buche', Config.MaxInService)
end


TriggerEvent('esx_phone:registerNumber', 'buche', _U('buche_client'), true, true)
TriggerEvent('esx_society:registerSociety', 'buche', 'buche', 'society_buche', 'society_buche', 'society_buche', {type = 'private'})


local function Harvest(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "woodFarm" then
			local itemQuantity = xPlayer.getInventoryItem('wood').count
			if itemQuantity >= 100 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_place'))
				return
			else
				--Activate for add random item and create a new item if need
				--local rand0 = math.random(0,100)
				--if (rand0 >= 98) then
				--	SetTimeout(1000, function()
				--		xPlayer.addInventoryItem('test', 1)
				--		xPlayer.removeInventoryItem('test', 1)
				--		TriggerClientEvent('esx:showNotification', source, _U('test'))
				--		Harvest(source, zone)
				--		end)
				--else
					SetTimeout(1800, function()
						xPlayer.addInventoryItem('wood', 1)
						Harvest(source, zone)
				
				end)
			end
		end
	end
end


RegisterServerEvent('esx_bucherons:startHarvest')
AddEventHandler('esx_bucherons:startHarvest', function(zone)
	local _source = source
  	
	if PlayersHarvesting[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersHarvesting[_source]=true --chnage flase if not work this is test
	else
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('wood_taken'))  
		Harvest(_source,zone)
	end
end)


RegisterServerEvent('esx_bucherons:stopHarvest')
AddEventHandler('esx_bucherons:stopHarvest', function()
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
		if zone == "TraitementBois" then
			local itemQuantity = xPlayer.getInventoryItem('wood').count
			
			if itemQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_plank'))
				return
			else
				--local rand = math.random(0,100)
				--if (rand >= 98) then
					--SetTimeout(1000, function()
						--xPlayer.removeInventoryItem('wood', 1)
						--xPlayer.addInventoryItem('cutted_wood', 1)
						--TriggerClientEvent('esx:showNotification', source, _U('tabacsec'))
						--Transform(source, zone)
					--end)
				--else
					SetTimeout(1000, function()
						xPlayer.removeInventoryItem('wood', 1)
						xPlayer.addInventoryItem('cutted_wood', 1)
				
						Transform(source, zone)
					end)
				--end
			end
		--elseif zone == "TraitementJus" then
		--	local itemQuantity = xPlayer.getInventoryItem('wood').count
		--	if itemQuantity <= 0 then
		--		TriggerClientEvent('esx:showNotification', source, _U('not_enough_feuilletab'))
		--		return
		--	else
		--		SetTimeout(1800, function()
		--			xPlayer.removeInventoryItem('wood', 1)
		--			xPlayer.addInventoryItem('cutted_wood', 1)
		--
		--			Transform(source, zone)	  
		--		end)
		--	end
		end
	end	
end



RegisterServerEvent('esx_bucherons:startTransform')
AddEventHandler('esx_bucherons:startTransform', function(zone)
	local _source = source
  	
	if PlayersTransforming[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersTransforming[_source]=false
	else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, 'transformation en cours') 
		Transform(_source,zone)
	end
end)



RegisterServerEvent('esx_bucherons:stopTransform')
AddEventHandler('esx_bucherons:stopTransform', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre ')
		PlayersTransforming[_source]=true
		
	end
end)



local function Sell(source, zone)

	if PlayersSelling[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		
		if zone == 'SellFarm' then
			
			if xPlayer.getInventoryItem('cutted_wood').count <= 0 then
				bois = 0
			else
				bois = 1
			end
			
			if xPlayer.getInventoryItem('cutted_wood').count <= 0 then
				cuttedbois = 0
			else
				cuttedbois = 1
			end
		
			if bois == 0 and cuttedbois == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_product_sale'))
				return
			elseif xPlayer.getInventoryItem('cutted_wood').count <= 0 and cuttedbois == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_planche_sale'))
				bois = 0
				return
			elseif xPlayer.getInventoryItem('cutted_wood').count <= 0 and bois == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_jus_sale'))
				cuttedbois = 0
				return
			else
				
				if (cuttedbois == 1) then
					SetTimeout(1100, function()
						local money = math.random(45,45)
						xPlayer.removeInventoryItem('cutted_wood', 1)
						local societyAccount = nil

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_buche', function(account)
							societyAccount = account
						end)
						if societyAccount ~= nil then
							societyAccount.addMoney(money)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. money)
						end
						Sell(source,zone)
					end)

				elseif (bois == 1) then
					SetTimeout(1100, function()
						local money = math.random(45,45)
						xPlayer.removeInventoryItem('vine', 1)
						local societyAccount = nil

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_buche', function(account)
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


RegisterServerEvent('esx_bucherons:startSell')
AddEventHandler('esx_bucherons:startSell', function(zone)

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



RegisterServerEvent('esx_bucherons:stopSell')
AddEventHandler('esx_bucherons:stopSell', function()

	local _source = source
	
	if PlayersSelling[_source] == true then
		PlayersSelling[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~vendre')
		PlayersSelling[_source]=true
	end

end)


ESX.RegisterServerCallback('esx_bucherons:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory
	cb({
	  items      = items
	})
end)


ESX.RegisterServerCallback('esx_bucherons:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_buche', function(inventory)
		cb(inventory.items)
	end)
end)


RegisterServerEvent('esx_bucherons:putStockItems')
AddEventHandler('esx_bucherons:putStockItems', function(itemName, count)
  
  local xPlayer = ESX.GetPlayerFromId(source)
  local sourceItem = xPlayer.getInventoryItem(itemName)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_buche', function(inventory)

    local inventoryitem = inventory.getItem(itemName)
  
    if sourceItem.count >= count and count > 0 then
       xPlayer.removeInventoryItem(itemName, count)
       inventory.addItem(itemName, count)
       --TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ''.. item.label)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end
  end)
end)




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
