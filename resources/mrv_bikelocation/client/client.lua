ESX = nil
onmenu = false

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

-- Fonction achat

function SpawnBmx()
    TriggerServerEvent('buyBmx')
    ESX.ShowAdvancedNotification("Location de vélo", "Votre véhicule est en ~b~route~s~", "", "CHAR_BIKESITE", 1)
    Citizen.Wait(10000)
    spawnCar("bmx")
    ESX.ShowAdvancedNotification("Location de vélo", "Voilà votre ~b~véhicule~s~", "", "CHAR_BIKESITE", 1)
end

function SpawnCruiser()
    TriggerServerEvent('buyCruiser')
    ESX.ShowAdvancedNotification("Location de vélo", "Votre véhicule est en ~b~route~s~", "", "CHAR_BIKESITE", 1)
    Citizen.Wait(10000)
    spawnCar("cruiser")
    ESX.ShowAdvancedNotification("Location de vélo", "Voilà votre ~b~véhicule~s~", "", "CHAR_BIKESITE", 1)
end

function SpawnFixter()
    TriggerServerEvent('buyFixter')
    ESX.ShowAdvancedNotification("Location de vélo", "Votre véhicule est en ~b~route~s~", "", "CHAR_BIKESITE", 1)
    Citizen.Wait(10000)
    spawnCar("fixter")
    ESX.ShowAdvancedNotification("Location de vélo", "Voilà votre ~b~véhicule~s~", "", "CHAR_BIKESITE", 1)
end

-- Spawn

function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car,  -1103.7249755859, -1694.2042236328, 4.3391332626343, 0.0, true, false)

    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleNumberPlateText(vehicle, "LOC")
end

-- Blips

local blips = {
    {title="Location de Vélos", colour=5, id=226, x = -1107.165, y = -1692.084, z = 3.372}
}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.7)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)


-- Marker and help text


local location = {
    {x = -1107.244,y = -1692.400,z = 3.374}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(location) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, location[k].x, location[k].y, location[k].z)

            if dist <= 1.2 and onmenu == false then
                ESX.ShowHelpNotification("~INPUT_TALK~ pour louer un ~b~vélo~s~")
				if IsControlJustPressed(1,51) then 
					WarMenu.OpenMenu('locationmenu')
				end
            end
        end
    end
end)

-- texte

local v1 = vector3(-1108.208, -1693.145, 5.500)

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local distance = 20

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance then
            Draw3DText(v1.x,v1.y,v1.z, "Larry")
		end
	end
end)

-- ped

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_y_surfer_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
	ped = CreatePed("PED_TYPE_CIVMALE", "a_m_y_surfer_01", -1108.208, -1693.145, 3.374, 301.591, true, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)
end)
