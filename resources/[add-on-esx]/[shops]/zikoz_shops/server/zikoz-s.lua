ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('buyEau')
AddEventHandler('buyEau', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceEau
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('water', 1)
end)

RegisterNetEvent('buyChocolat')
AddEventHandler('buyChocolat', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceChocolat
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('chocolate', 1)
end)

RegisterNetEvent('buyCocaCola')
AddEventHandler('buyCocaCola', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceCocaCola
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('cocacola', 1)
end)

RegisterNetEvent('buyIceTea')
AddEventHandler('buyIceTea', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceIceTea
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('icetea', 1)
end)

RegisterNetEvent('buyCafe')
AddEventHandler('buyCafe', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceCafe
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('coffe', 1)
end)

RegisterNetEvent('buyLait')
AddEventHandler('buyLait', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceLait
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('milk', 1)
end)

RegisterNetEvent('buyPain')
AddEventHandler('buyPain', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PricePain
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('bread', 1)
end)

RegisterNetEvent('buySandwich')
AddEventHandler('buySandwich', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceSandwich
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('sandwich', 1)
end)

RegisterNetEvent('buyHamburger')
AddEventHandler('buyHamburger', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceHamburger
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('hamburger', 1)
end)

RegisterNetEvent('buyCupCake')
AddEventHandler('buyCupCake', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceCupCake
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('cupcake', 1)
end)

RegisterNetEvent('buyGPS')
AddEventHandler('buyGPS', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceGPS
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('gps', 1)
end)
