local blip_sprite = 485
--X: -1901.202, Y: -709.611, Z: 11.461} 
local blip_location = vector3(-1901.202, -709.611, 11.461)
local blip = nil
local area_blip = nil
local area_size = 100.0

--CreateThread(function()
--    AddTextEntry("PROSP_BLIP", "Prospecting")
--    blip = AddBlipForCoord(blip_location)
--    SetBlipSprite(blip, blip_sprite)
--    SetBlipAsShortRange(blip, true)
--    BeginTextCommandSetBlipName("PROSP_BLIP")
--    EndTextCommandSetBlipName(blip)
--    area_blip = AddBlipForRadius(blip_location, area_size)
--    SetBlipSprite(area_blip, 10)
--end)

RegisterCommand("prospect", function()
    local pos = GetEntityCoords(PlayerPedId())

    -- Make sure the player is within the prospecting zone before they start
    local dist = #(pos - blip_location)
    if dist < area_size then
        TriggerServerEvent("prospecting-example:activateProspecting")
    end
end, false)


RegisterNetEvent('prosp:prospect')
AddEventHandler('prosp:prospect', function()   
    blips()  
end)

RegisterNetEvent('prosp:prospectend')
AddEventHandler('prosp:prospectend', function()  
    deleteBlips()
end)

function blips()
    

    
        AddTextEntry("PROSP_BLIP", "Prospecting")
        blip = AddBlipForCoord(blip_location)
        SetBlipSprite(blip, blip_sprite)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("PROSP_BLIP")
        EndTextCommandSetBlipName(blip)
        area_blip = AddBlipForRadius(blip_location, area_size)
        SetBlipSprite(area_blip, 10)
       -- table.insert(JobBlips, blip)
       RemoveBlip(blip)
end


function deleteBlips()
    
        RemoveBlip(blip)
        --ACTIVE_EMERGENCY_PERSONNEL[id] = nil
    	--if blip ~= nil then
		--for i=1, #JobBlips, 1 do
	--	RemoveBlip(blip)
	--	JobBlips = nil
	--	end
	--end
end