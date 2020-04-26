ESX = nil
local lastTime = nil
local Config = {}
Config.CopsOnDuty = 0

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('seed_weed', function(source)
    local _source = source
    local currentTime = os.time(os.date("!*t"))
    if lastTime and currentTime - lastTime < 10 then
        TriggerClientEvent("pNotify:SendNotification", source, {
            text = 'Attendez au moins 10 secondes avant de redémarrer cette configuration.',
            type = "error",
            timeout = 2000,
            layout = "centerLeft"
        })
        do return end
    end
    lastTime = os.time(os.date("!*t"))

    --Sprawdź czy jest wystarczająca liczba glin
    local xPlayers = ESX.GetPlayers()
    local cops = 0
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            cops = cops + 1
            if cops >= Config.CopsOnDuty then break end
        end
    end

    if cops >= Config.CopsOnDuty then
        TriggerClientEvent('esx_receptury:RequestStart', _source, 'seed_weed', lastTime)
    else
        TriggerClientEvent("pNotify:SendNotification", _source, {
            text = 'Pour démarrer cette opération doit être au moins '.. Config.CopsOnDuty .. 'policiers en service.',
            type = "error",
            timeout = 5000,
            layout = "centerLeft"
        })
        TriggerClientEvent("pNotify:SendNotification", _source, {
            text = 'Nombre actuel de policiers en service:'.. cops ..'/'.. Config.CopsOnDuty,
            type = "info",
            timeout = 6000,
            layout = "centerLeft"
        })
    end
end)


RegisterServerEvent("esx_receptury:RemoveItem")
AddEventHandler("esx_receptury:RemoveItem", function(item_name)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeInventoryItem(item_name, 1)
end)


RegisterServerEvent("esx_receptury:statusSuccess")
AddEventHandler("esx_receptury:statusSuccess", function(message, min, max, item)
    TriggerClientEvent('esx:showNotification', source, message)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    math.randomseed(os.time())
    local amount = math.random(min, max)
    local itemProps = xPlayer.getInventoryItem(item)
    if(itemProps.limit < itemProps.count + amount) then
        xPlayer.setInventoryItem(item, itemProps.limit)
        TriggerClientEvent("pNotify:SendNotification", source, {
            text = 'Vous laissez une partie du produit car vous n\'avez plus d\'espace dans vos poches.',
            type = "error",
            timeout = 2000,
            layout = "centerLeft"
        })
    else
        xPlayer.addInventoryItem(item, amount)
    end
end)
