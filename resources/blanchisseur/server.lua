--[[
##################
#    Oskarr      #
#    MysticRP    #
#   server.lua   #
#      2017      #
##################
--]]

local taux = 0.80 -- 0.80 : 100000$ dirty = 80000$  // 0.80 : 100 000 d'argent sale = 80 000$ d'argent propre

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("blanchisseur:BlanchirCash")
AddEventHandler("blanchisseur:BlanchirCash", function(amount ,amounttime)
	local xPlayer 		= ESX.GetPlayerFromId(source)
	local account 		= xPlayer.getAccount('black_money')
	local _percent		= 70

	if amount > 0 and account.money >= amount then
		Citizen.Wait(3000)
		local bonus = math.random(10, 30)
		local washedMoney = math.floor(amount / 100 * (_percent + 25))	




		if amount > 250 then 
			Citizen.Wait(1500)
			xPlayer.removeAccountMoney('black_money', amount)
			xPlayer.addMoney(washedMoney)
			--TriggerClientEvent("esx_blanchisseur:notify", source, "CHAR_LESTER_DEATHWISH", 1,'Notification', false, 'cash' .. washedMoney .. 'cash1')
		elseif  amount < 500 then
			Citizen.Wait(amounttime)
			xPlayer.removeAccountMoney('black_money', amount)
			xPlayer.addMoney(washedMoney)
		elseif  amount < 1000 then
			Citizen.Wait(amounttime)
			xPlayer.removeAccountMoney('black_money', amount)
			xPlayer.addMoney(washedMoney)
		elseif  amount < 2000 then
			Citizen.Wait(amounttime)
			xPlayer.removeAccountMoney('black_money', amount)
			xPlayer.addMoney(washedMoney)
		elseif  amount < 3000 then
			Citizen.Wait(amounttime)
			xPlayer.removeAccountMoney('black_money', amount)
			xPlayer.addMoney(washedMoney)
		elseif  amount < 4000 then
			Citizen.Wait(amounttime)
			xPlayer.removeAccountMoney('black_money', amount)
			xPlayer.addMoney(washedMoney)
		elseif  amount < 5000 then
			Citizen.Wait(amounttime)
			xPlayer.removeAccountMoney('black_money', amount)
			xPlayer.addMoney(washedMoney)
		elseif  amount < 6000 then
			Citizen.Wait(amounttime)
			xPlayer.removeAccountMoney('black_money', amount)
			xPlayer.addMoney(washedMoney)
		elseif  amount < 7000 then
			Citizen.Wait(amounttime)
			xPlayer.removeAccountMoney('black_money', amount)
			xPlayer.addMoney(washedMoney)
		elseif  amount < 3800 then
			Citizen.Wait(amounttime)
			xPlayer.removeAccountMoney('black_money', amount)
			xPlayer.addMoney(washedMoney)
		elseif  amount < 9000 then
			Citizen.Wait(amounttime)
			xPlayer.removeAccountMoney('black_money', amount)
			xPlayer.addMoney(washedMoney)
		elseif  amount < 10000 then
			Citizen.Wait(amounttime)
			xPlayer.removeAccountMoney('black_money', amount)
			xPlayer.addMoney(washedMoney)
		elseif  amount < 15000 then
			Citizen.Wait(amounttime)
			xPlayer.removeAccountMoney('black_money', amount)
			xPlayer.addMoney(washedMoney)
		elseif  amount < 20000 then
			Citizen.Wait(amounttime)
			xPlayer.removeAccountMoney('black_money', amount)
			xPlayer.addMoney(washedMoney)
		elseif  amount < 1000000 then
			Citizen.Wait(amounttime)
			xPlayer.removeAccountMoney('black_money', amount)
			xPlayer.addMoney(washedMoney)
		
		else
			--
		end
	
	else
		--TriggerClientEvent("esx_blanchisseur:notify", source, "CHAR_LESTER_DEATHWISH", 1, 'Notification', false, 'invalid_amount')
	end
end)