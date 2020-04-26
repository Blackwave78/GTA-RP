----------------
----------------
----------------
----------------
----------------
----Prototype

local ESX = nil
local ill = false 

-- ESX
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('anti', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('anti', 1)
	TriggerClientEvent('esx_maladie:frisk', source)
end)


ESX.RegisterUsableItem('virus', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('virus', 1)
	TriggerClientEvent('esx_maladie:trost', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous étes malade ... consulté un médecin')
end) 