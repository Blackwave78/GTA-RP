ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_accessories:pay')
AddEventHandler('esx_accessories:pay', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeMoney(Config.Price)
	TriggerClientEvent('esx:showNotification', _source, _U('you_paid', Config.Price))

end)

RegisterServerEvent('esx_accessories:save')
AddEventHandler('esx_accessories:save', function(skinplayer, accessory)
	--[[local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_datastore:getDataStore', 'user_' .. string.lower(accessory), xPlayer.identifier, function(store)
		store.set('has' .. accessory, true)

		local itemSkin = {}
		local item1 = string.lower(accessory) .. '_1'
		local item2 = string.lower(accessory) .. '_2'
		itemSkin[item1] = skin[item1]
		itemSkin[item2] = skin[item2]
		store.set('skin', itemSkin)

	end)]]
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerEvent('esx_datastore:getDataStore', 'user_' .. string.lower(accessory), xPlayer.identifier, function(store)
		local count    = store.count('skin')
		if count < 16 then
			local accesor = store.get('skin')
			local temp = {}
			if accesor == nil then
				accesor = {}
			end
			--store.set('has' .. accessory, true)
			local item1 = string.lower(accessory) .. '_1'
			local item2 = string.lower(accessory) .. '_2'
			temp[item1] = skinplayer[item1]
			temp[item2] = skinplayer[item2]
			table.insert(accesor, temp)
			store.set('skin', accesor)
		else
			TriggerClientEvent('esx:showNotification', _source,'Vous avez trop d\'accessoires de ce type, Vous avez était remboursé')
			xPlayer.addMoney(Config.Price)
		end
	end)
end)

local allaccesories = {}
ESX.RegisterServerCallback('esx_accessories:get', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'user_mask', xPlayer.identifier, function(store)
		local hasAccessory = (store.get('hasMask') and store.get('hasmask') or false)
		--local skin = (store.get('skin') and store.get('skin') or {})

		local count    = store.count('skin')
    	local entry   = {}

    	for i=1, count, 1 do
			entry[i] = store.get('skin', i)
		end

		allaccesories['mask'] = entry


	end)

	TriggerEvent('esx_datastore:getDataStore', 'user_helmet', xPlayer.identifier, function(store)
		local hasAccessory = (store.get('hasHelmet') and store.get('hasHelmet') or false)
		--local skin = (store.get('skin') and store.get('skin') or {})

		local count    = store.count('skin')
    	local entry   = {}

    	for i=1, count, 1 do
			entry[i] = store.get('skin', i)
		end

		allaccesories['helmet'] = entry

	end)

	TriggerEvent('esx_datastore:getDataStore', 'user_watches', xPlayer.identifier, function(store)
		local hasAccessory = (store.get('hasWatches') and store.get('hasWatches') or false)
		--local skin = (store.get('skin') and store.get('skin') or {})

		local count    = store.count('skin')
    	local entry   = {}

    	for i=1, count, 1 do
			entry[i] = store.get('skin', i)
		end

		allaccesories['watches'] = entry


	end)

	TriggerEvent('esx_datastore:getDataStore', 'user_ears', xPlayer.identifier, function(store)
		local hasAccessory = (store.get('hasEars') and store.get('hasEars') or false)
		--local skin = (store.get('skin') and store.get('skin') or {})

		local count    = store.count('skin')
    	local entry   = {}

    	for i=1, count, 1 do
			entry[i] = store.get('skin', i)
		end

		allaccesories['ears'] = entry


	end)

	TriggerEvent('esx_datastore:getDataStore', 'user_bags', xPlayer.identifier, function(store)
		local hasAccessory = (store.get('hasBags') and store.get('hasBags') or false)
		--local skin = (store.get('skin') and store.get('skin') or {})

		local count    = store.count('skin')
    	local entry   = {}

    	for i=1, count, 1 do
			entry[i] = store.get('skin', i)
		end

		allaccesories['bags'] = entry


	end)

	TriggerEvent('esx_datastore:getDataStore', 'user_glasses', xPlayer.identifier, function(store)
		local hasAccessory = (store.get('hasGlasses') and store.get('hasGlasses') or false)
		--local skin = (store.get('skin') and store.get('skin') or {})

		local count    = store.count('skin')
    	local entry   = {}

    	for i=1, count, 1 do
			entry[i] = store.get('skin', i)
		end

		allaccesories['glasses'] = entry


	end)

	TriggerEvent('esx_datastore:getDataStore', 'user_bracelets', xPlayer.identifier, function(store)
		local hasAccessory = (store.get('hasBracelets') and store.get('hasBracelets') or false)
		--local skin = (store.get('skin') and store.get('skin') or {})

		local count    = store.count('skin')
    	local entry   = {}

    	for i=1, count, 1 do
			entry[i] = store.get('skin', i)
		end

		allaccesories['bracelets'] = entry


	end)

	TriggerEvent('esx_datastore:getDataStore', 'user_chain', xPlayer.identifier, function(store)
		local hasAccessory = (store.get('hasChain') and store.get('hasChain') or false)
		--local skin = (store.get('skin') and store.get('skin') or {})

		local count    = store.count('skin')
    	local entry   = {}

    	for i=1, count, 1 do
			entry[i] = store.get('skin', i)
		end

		allaccesories['chain'] = entry


	end)


	cb(allaccesories)
end)




ESX.RegisterServerCallback('esx_accessories:checkMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.get('money') >= Config.Price then
		cb(true)
	else
		cb(false)
	end

end)



ESX.RegisterServerCallback('esx_accessories:getPlayerAcc', function(source, cb, accessory)
	local xPlayer  = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_datastore:getDataStore', 'user_' .. string.lower(accessory), xPlayer.identifier, function(store)
	  local count    = store.count('skin')
	  local labels   = {}
	  for i=1, count, 1 do
		local entry = store.get('skin', i)
		table.insert(labels, i)
	  end
	  cb(labels)
	end)
  end)

RegisterServerEvent('esx_accessories:deleteOutfit')
AddEventHandler('esx_accessories:deleteOutfit', function(label, accessory)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_datastore:getDataStore', 'user_' .. string.lower(accessory), xPlayer.identifier, function(store)
		local dressing = store.get('skin')
		if dressing == nil then
			dressing = {}
		end
		label = label
		table.remove(dressing, label)
		store.set('skin', dressing)
	end)
end)
