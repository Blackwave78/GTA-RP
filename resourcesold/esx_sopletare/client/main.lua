ESX        = nil
percent    = false
searching  = false
cachedBins = {}
closestBin = {
    'prop_dumpster_01a',
    'prop_dumpster_02a',
    'prop_dumpster_02b',
    'prop_cs_dumpster_01a',
    'prop_cs_dumpster_lidl',
    'prop_cs_dumpster_lidr',
    'prop_dumpster_3a',
    'prop_dumpster_3step',
    'prop_dumpster_4a',
    'prop_dumpster_4b'
}

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(5)

		TriggerEvent("esx:getSharedObject", function(library)
			ESX = library
		end)
    end

    if ESX.IsPlayerLoaded() then
		ESX.PlayerData = ESX.GetPlayerData()
	end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(response)
	ESX.PlayerData = response
end)

Citizen.CreateThread(function()
    Citizen.Wait(100)
    while true do
        
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for i = 1, #closestBin do
            local x = GetClosestObjectOfType(playerCoords, 1.0, GetHashKey(closestBin[i]), false, false, false)
            local entity = nil
            if DoesEntityExist(x) then
                sleep  = 5
                entity = x
                bin    = GetEntityCoords(entity)
                drawText3D(bin.x, bin.y, bin.z + 1.5, 'Appueyr sur [~g~E~s~] pour chercher dans ~b~la poubelle~s~')  
                if IsControlJustReleased(0, 38) then
                    if not cachedBins[entity] then
                        openBin(entity)
                    else
                    notification()
                     --   TriggerClientEvent('esx:showAdvancedNotification', source, 'Poubelle', 'La Poubelle est Vide !', 'CHAR_AMMUNATION', 3)
                        --sendNotification('La poubelle est vide !', 'error', 2000)
                    end
                end
                break
            else
                sleep = 1000
            end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(100)
    while true do

        local sleep = 1000

        if percent then

            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for i = 1, #closestBin do

                local x = GetClosestObjectOfType(playerCoords, 1.0, GetHashKey(closestBin[i]), false, false, false)
                local entity = nil
                
                if DoesEntityExist(x) then
                    sleep  = 5
                    entity = x
                    bin    = GetEntityCoords(entity)
                    drawText3D(bin.x, bin.y, bin.z + 1.5, TimeLeft .. '~g~%~s~')
                    break
                end
            end
        end
        Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if searching then
            DisableControlAction(0, 73) 
        end
    end
end)



function notification(msg)

  local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(-1))

  ESX.ShowAdvancedNotification('Poubelle', '', 'La Poubelle est Vide', mugshotStr, 1)

  UnregisterPedheadshot(mugshot)

end
