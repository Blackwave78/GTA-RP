ESX = nil

if Config.UseESX then
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	RegisterServerEvent('fuel:pay')
	AddEventHandler('fuel:pay', function(price)
		local xPlayer = ESX.GetPlayerFromId(source)
		local amount = ESX.Math.Round(price)

		if price > 0 then
			xPlayer.removeMoney(amount)
		end
	end)

	
	RegisterServerEvent('fuel:pay1')
	AddEventHandler('fuel:pay1', function(currentcash1)
		local currentcash1 = ESX.GetPlayerData().money
	end)
end
