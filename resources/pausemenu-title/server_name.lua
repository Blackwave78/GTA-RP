



local pedindex = {}

function SetWeaponDrops() -- This function will set the closest entity to you as the variable entity.
    local handle, ped = FindFirstPed()
    local finished = false -- FindNextPed will turn the first variable to false when it fails to find another ped in the index
    repeat 
        if not IsEntityDead(ped) then
                pedindex[ped] = {}
        end
        finished, ped = FindNextPed(handle) -- first param returns true while entities are found
    until not finished
    EndFindPed(handle)

    for peds,_ in pairs(pedindex) do
        if peds ~= nil then -- set all peds to not drop weapons on death.
            SetPedDropsWeaponsWhenDead(peds, false) 
                    DisablePlayerVehicleRewards(PlayerId())
        end
    end
       DisablePlayerVehicleRewards(PlayerId())
end




function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()

  AddTextEntry('FE_THDR_GTAO', '~g~New~y~Wave-Rp ~m~| ~b~ Fivem ID : ~r~ ' .. GetPlayerServerId(PlayerId()))
end)
 

