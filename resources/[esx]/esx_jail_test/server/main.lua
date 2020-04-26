ESX = nil
local PlayersHarvesting = {}


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-- jail command
TriggerEvent('es:addGroupCommand', 'jail', 'admin', function(source, args, user)

	if args[1] and GetPlayerName(args[1]) ~= nil and tonumber(args[2]) then
		TriggerEvent('esx_jail:sendToJail', tonumber(args[1]), tonumber(args[2] * 60))
	else
		TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Invalid player ID or jail time!' } } )
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = "Put a player in jail", params = {{name = "id", help = "target id"}, {name = "time", help = "jail time in minutes"}}})



-- unjail
TriggerEvent('es:addGroupCommand', 'unjail', 'admin', function(source, args, user)
	if args[1] then
		if GetPlayerName(args[1]) ~= nil then
			TriggerEvent('esx_jail:unjailQuest', tonumber(args[1]))
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Invalid player ID!' } } )
		end
	else
		TriggerEvent('esx_jail:unjailQuest', source)
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = "Unjail people from jail", params = {{name = "id", help = "target id"}}})






-- send to jail and register in database
RegisterServerEvent('esx_jail:sendToJail')
AddEventHandler('esx_jail:sendToJail', function(target, jailTime)
	local identifier = GetPlayerIdentifiers(target)[1]

	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] then
			MySQL.Async.execute('UPDATE jail SET jail_time = @jail_time WHERE identifier = @identifier', {
				['@identifier'] = identifier,
				['@jail_time'] = jailTime
			})
		else
			MySQL.Async.execute('INSERT INTO jail (identifier, jail_time) VALUES (@identifier, @jail_time)', {
				['@identifier'] = identifier,
				['@jail_time'] = jailTime
			})
		end
	end)
	
	TriggerClientEvent('chat:addMessage', -1, { args = { _U('judge'), _U('jailed_msg', GetPlayerName(target), ESX.Math.Round(jailTime / 60)) }, color = { 147, 196, 109 } })
	TriggerClientEvent('esx_policejob:unrestrain', target)
	TriggerClientEvent('esx_jail:jail', target, jailTime)
end)





-- should the player be in jail?
RegisterServerEvent('esx_jail:checkJail')
AddEventHandler('esx_jail:checkJail', function()
	local _source = source -- cannot parse source to client trigger for some weird reason
	local identifier = GetPlayerIdentifiers(_source)[1] -- get steam identifier

	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] ~= nil then
			TriggerClientEvent('chat:addMessage', -1, { args = { _U('judge'), _U('jailed_msg', GetPlayerName(_source), ESX.Math.Round(result[1].jail_time / 60)) }, color = { 147, 196, 109 } })
			TriggerClientEvent('esx_jail:jail', _source, tonumber(result[1].jail_time))
		end
	end)
end)




-- unjail via command
RegisterServerEvent('esx_jail:unjailQuest')
AddEventHandler('esx_jail:unjailQuest', function(source)
	if source ~= nil then
		unjail(source)
	end
end)



-- unjail after time served
RegisterServerEvent('esx_jail:unjailTime')
AddEventHandler('esx_jail:unjailTime', function()
	unjail(source)
end)



-- keep jailtime updated
RegisterServerEvent('esx_jail:updateRemaining')
AddEventHandler('esx_jail:updateRemaining', function(jailTime)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] then
			MySQL.Async.execute('UPDATE jail SET jail_time = @jailTime WHERE identifier = @identifier', {
				['@identifier'] = identifier,
				['@jailTime'] = jailTime
			})
		end
	end)
end)




function unjail(target)
	local identifier = GetPlayerIdentifiers(target)[1]
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] then
			MySQL.Async.execute('DELETE from jail WHERE identifier = @identifier', {
				['@identifier'] = identifier
			})

			TriggerClientEvent('chat:addMessage', -1, { args = { _U('judge'), _U('unjailed', GetPlayerName(target)) }, color = { 147, 196, 109 } })
		end
	end)

	TriggerClientEvent('esx_jail:unjail', target)
end





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






RegisterServerEvent('esx_jail:startHarvest')
AddEventHandler('esx_jail:startHarvest', function(zone)
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


RegisterServerEvent('esx_jail:stopHarvest')
AddEventHandler('esx_jail:stopHarvest', function()
	local _source = source
	
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~récolter')
		PlayersHarvesting[_source]=true
	end
end)