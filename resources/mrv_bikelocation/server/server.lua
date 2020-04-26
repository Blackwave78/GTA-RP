ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local xPlayer = ESX.GetPlayerFromId(source)

RegisterNetEvent('buyBmx')
AddEventHandler('buyBmx', function()
--	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceBmx
    xPlayer.removeMoney(price)
end)

RegisterNetEvent('buyFixter')
AddEventHandler('buyFixter', function()
	local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceFixter
    xPlayer.removeMoney(price)
end)

RegisterNetEvent('buyCruiser')
AddEventHandler('buyCruiser', function()
	local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceCruiser
    xPlayer.removeMoney(price)
end)
