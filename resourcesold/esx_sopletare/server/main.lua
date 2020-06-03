ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

TriggerEvent("esx:getSharedObject", function(response)
    ESX = response
end)

RegisterServerEvent('esx_sopletare:getItem')
AddEventHandler('esx_sopletare:getItem', function()

    local luck = math.random(1, 3)

    if luck == 2 then

        local items = { -- add whatever items you want here
            'bandage',
            'medikit',
            'meth',
            'coke',
            'weed',
            'bread',
            --'fish',
          --  'cerflex',
            --'lingot',
           -- 'or',
           -- 'cigarett'
        }

        local player = ESX.GetPlayerFromId(source)
        local randomItems = items[math.random(#items)]
        local quantity = math.random(1, 3)
        local itemfound = ESX.GetItemLabel(randomItems)
              
        player.addInventoryItem(randomItems, quantity)
        TriggerClientEvent('esx:showAdvancedNotification', source, 'Poubelle', 'Items Trouvées', 'Vous avez trouver x'..quantity.. ' ' ..randomItems, 'CHAR_AMMUNATION', 3)

  --  elseif luck == 2 then

   --     local weapons = { -- add whatever weapons you want here
    --        'WEAPON_KNIFE',
    --        'WEAPON_PISTOL'
    --    }

    --    local player = ESX.GetPlayerFromId(source)
    --    local randomWeapons = weapons[math.random(#weapons)]
    --    local quantity = math.random(#weapons)
    --    local weaponfound = ESX.GetWeaponLabel(randomWeapons)

    --    player.addWeapon(randomWeapons, quantity)
    --    TriggerClientEvent('esx:showAdvancedNotification', source, 'Poubelle', 'Items Trouvées', 'Vous avez trouver x'..quantity.. ' ' ..randomWeapons, 'CHAR_AMMUNATION', 3)
        --sendNotification(source, 'Vous avez trouver x 1' .. weaponfound, 'success', 2500)
    else
      TriggerClientEvent('esx:showAdvancedNotification', source, 'Poubelle', '', 'La Poubelle est Vide !', 'CHAR_AMMUNATION', 3)
       --  TriggerClientEvent('esx:showNotification', source, 'la poubelle est vide')
       -- sendNotification(source, 'la poubelle est vide', 'error', 2000)
    end
end)



function notification(msg)

  local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(-1))

  ESX.ShowAdvancedNotification('title', 'subject', 'msg', mugshotStr, 1)

  UnregisterPedheadshot(mugshot)

end
