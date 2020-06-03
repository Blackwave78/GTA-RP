ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


--/////Recolte start
RegisterNetEvent('buyWeedF') --ok
AddEventHandler('buyWeedF', function(xPlayer)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceWeedF

    if(xPlayer.getMoney() >= price) then
       xPlayer.removeMoney(price)
       TriggerClientEvent("showweedpoint", source)
    else 
       xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

RegisterNetEvent('buyOpiumF') ---ok
AddEventHandler('buyOpiumF', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceOpiumF

    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showopiumpoint", source)
    else 
       xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

RegisterNetEvent('buyCokeF') --ok
AddEventHandler('buyCokeR', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceCokeF

    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showcokepoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

RegisterNetEvent('buyMethF') --ok
AddEventHandler('buyMethF', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceMethF

    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showMethpoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

RegisterNetEvent('buyCrackF') --ok
AddEventHandler('buyCrackF', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceCrackF

    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showcrackpoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

RegisterNetEvent('buyketaF') --ok
AddEventHandler('buyketaF', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceKetaF

    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showketapoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

RegisterNetEvent('buyecstaF')
AddEventHandler('buyecstaF', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceEcstaF --ok
   
    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showecstapoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

--/////Recolte end









--/////Traitement start

RegisterNetEvent('buytraitementweed')
AddEventHandler('buytraitementweed', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceWeedT -- ok

    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showweedtreapementpoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

RegisterNetEvent('buytraitementOpium')
AddEventHandler('buytraitementOpium', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceOpiumT -- ok

    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showopiumtreapementpoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

RegisterNetEvent('buytraitementCoke')
AddEventHandler('buytraitementCoke', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceCokeT -- ok

    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showcoketreapementpoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

RegisterNetEvent('buytraitementMeth')
AddEventHandler('buytraitementMeth', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceMethT -- ok
    
    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showmethtreapementpoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

RegisterNetEvent('buytraitementCrack')
AddEventHandler('buytraitementCrack', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceCrackT -- ok
   
    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showcracktreapementpoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

RegisterNetEvent('buytraitementKeta')
AddEventHandler('buytraitementKeta', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceKetaT -- ok

    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showketatreapementpoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

RegisterNetEvent('buytraitmentexctasy')
AddEventHandler('buytraitmentexctasy', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceEcstaT -- ok

    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showecstatreapementpoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

--/////Traitement stop

--/////Vente start

RegisterNetEvent('buyrevweed')
AddEventHandler('buyrevweed', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceWeedR -- ok
    
    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showweedrevpoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

RegisterNetEvent('buyrevOpium')
AddEventHandler('buyrevOpium', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceOpiumR -- ok

    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showopiumrevpoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end

end)

RegisterNetEvent('buyrevCoke')
AddEventHandler('buyrevCoke', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceCokeR -- ok
 
    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showcokerevpoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end

end)

RegisterNetEvent('buyrevMeth')
AddEventHandler('buyrevMeth', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceMethR -- ok

    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showMethrevpoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

RegisterNetEvent('buyrevCrack')
AddEventHandler('buyrevCrack', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceCrackR -- ok

    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showCrackrevpoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

RegisterNetEvent('buyrevKeta')
AddEventHandler('buyrevKeta', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceKetaR -- ok

    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showketarevpoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end
end)

RegisterNetEvent('buyrevExsta')
AddEventHandler('buyrevExsta', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceEcstaR -- ok

    if(xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        TriggerClientEvent("showexstarevpoint", source)
    else 
        xPlayer.showNotification('t\'est pauvre !!!')
    end

end)

