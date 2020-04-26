local teleports = {
	-- Cellblock - toilets
	{pos = vector3(1744.19, 2622.90, 44.5696), tPos = vector3(1745.74, 2616.25, 44.565), location = "toilets"},
	{tPos = vector3(1744.19, 2622.90, 44.5696), pos = vector3(1745.74, 2616.25, 44.565), location = "cellblock"},

	-- Cellblock - canteen
	{pos = vector3(1746.16, 2625.17, 44.5696), tPos = vector3(1729.3, 2592.42, 44.565), location = "canteen"},
	{tPos = vector3(1746.16, 2625.17, 44.5696), pos = vector3(1729.3, 2592.42, 44.565), location = "cellblock"},

	-- canteen - staff canteen area
	{pos = vector3(1728.14, 2578.36, 44.5696), tPos = vector3(1725.7, 2577.29, 44.565), location = "staff canteen"},
	{tPos = vector3(1728.14, 2578.36, 44.5696), pos = vector3(1725.7, 2577.29, 44.565), location = "canteen"},

	-- canteen - hallway (workout area + door to laundry)
	{pos = vector3(1724.7, 2584.32, 44.5696), tPos = vector3(1659.76, 2576.02, 44.565), location = "hallway"},
	{tPos = vector3(1724.7, 2584.32, 44.5696), pos = vector3(1659.76, 2576.02, 44.565), location = "canteen"},

	-- hallway (workout area + door to laundry) - laundry
	{pos = vector3(1655.8, 2577.778, 44.5696), tPos = vector3(1671.55, 2592.92, 44.565), location = "laundry room"},
	{tPos = vector3(1655.8, 2577.778, 44.5696), pos = vector3(1671.55, 2592.92, 44.565), location = "hallway"},

	-- Workout doors
	{pos = vector3(1651.34, 2575.34, 44.5696), tPos = vector3(1651.26, 2573.1, 44.565), location = "workout area"},
	{tPos = vector3(1651.34, 2575.34, 44.5696), pos = vector3(1651.26, 2573.1, 44.565), location = "hallway"},
	{pos = vector3(1642.57, 2575.44, 44.5696), tPos = vector3(1642.49, 2573.14, 44.565), location = "workout area"},
	{tPos = vector3(1642.57, 2575.44, 44.5696), pos = vector3(1642.49, 2573.14, 44.565), location = "hallway"},
	{pos = vector3(1629.72, 2575.88, 44.5696), tPos = vector3(1629.61, 2573.18, 44.565), location = "workout area"},
	{tPos = vector3(1629.72, 2575.88, 44.5696), pos = vector3(1629.61, 2573.18, 44.565), location = "hallway"},

	-- Entrance - checkin, checkin - yard
	{pos = vector3(1690.52, 2591.18, 44.5696), tPos = vector3(1770.97, 2516.98, 44.565), location = "checkin"},
	{tPos = vector3(1690.52, 2591.18, 44.5696), pos = vector3(1770.97, 2516.98, 44.565), location = "entrance"},
	{pos = vector3(1775.66, 2509.2, 44.5696), tPos = vector3(1616.53, 2530.36, 44.565), location = "yard"},
	{tPos = vector3(1775.66, 2509.2, 44.5696), pos = vector3(1616.53, 2530.36, 44.565), location = "checkin"},

	-- Yard - hallway
	{pos = vector3(1636.41, 2565.53, 44.5696), tPos = vector3(1634.0, 2578.0, 44.565), location = "hallway"},
	{tPos = vector3(1636.41, 2565.53, 44.5696), pos = vector3(1634.0, 2578.0, 44.565), location = "yard"},

	-- Staff canteen - wardens office
	{pos = vector3(1725.21, 2566.95, 49.9696), tPos = vector3(1691.09, 2539.32, 50.965), location = "wardens office"},
	{tPos = vector3(1725.21, 2566.95, 49.9696), pos = vector3(1691.09, 2539.32, 50.965), location = "staff canteen"},

	-- Front entrace - visitation
	{pos = vector3(1845.69, 2585.87, 44.6721), tPos = vector3(1840.36, 2580.9, 45.6721), location = "visitation"},
	{tPos = vector3(1845.69, 2585.87, 44.6721), pos = vector3(1840.36, 2580.9, 44.6721), location = "front entrance"},

	-- Canteen - visitation
	{pos = vector3(1748.68, 2581.84, 44.6721), tPos = vector3(1834.95, 2571.11, 44.6721), location = "visitation"},
	{tPos = vector3(1748.68, 2581.84, 44.6721), pos = vector3(1834.95, 2571.11, 44.6721), location = "canteen"},
}

local function getSetLoader(sets)
	return function()
		-- request all the models
		for _,obj in ipairs(sets) do
			RequestModel(obj.hash)
		end

		-- make sure all the models are loaded
		while true do
			local loaded = true

			Citizen.Wait(0)

			for _,obj in ipairs(sets) do
				if not HasModelLoaded(obj.hash) then
					loaded = false
					break
				end
			end

			if loaded then
				break
			end
		end
	end
end

Citizen.CreateThread(function()
	getSetLoader(objects)
end)

-- object streamer
local function isNearObject(p1, obj)
	local diff = obj.pos - p1
	local dist = (diff.x * diff.x) + (diff.y * diff.y)

	return (dist < 1000.0)
end


local jaildoorsOpen = false
local jailDoors = {}

RegisterNetEvent('toggleJailDoors')
AddEventHandler('toggleJailDoors', function(t)
	jaildoorsOpen = t

	if t then
		for k,v in pairs(jailDoors) do
			SetEntityVisible(k, false)
			SetEntityCollision(k, false, true)
		end
	else
		for k,v in pairs(jailDoors) do
			SetEntityVisible(k, true)
			SetEntityCollision(k, true, true)
		end
	end
end)

RegisterNetEvent("pf_cl:setPosition")
AddEventHandler("pf_cl:setPosition", function(id, x, y, z)
	SetEntityCoordsNoOffset(GetPlayerPed(GetPlayerFromServerId(id)), x, y, z)
end)

Citizen.CreateThread(function()
	DoScreenFadeIn(1000)
	while true do
		Wait(0)

		if IsControlJustPressed(1, 51) then
			local pos = GetEntityCoords(PlayerPedId(), true)

			for k,v in ipairs(teleports) do
				if Vdist(pos, v.pos) < 2.0 and not IsPedRagdoll(PlayerPedId()) then
					DoScreenFadeOut(500)
					Wait(500)
					TriggerServerEvent("pf_sv:setPosition", v.tPos.x, v.tPos.y, v.tPos.z)
					TriggerEvent("pf_cl:setLocation", v.location)
					Wait(500)
					DoScreenFadeIn(1000)
					break
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)

		-- spawn objects
		local pos = GetEntityCoords(GetPlayerPed(-1))

		for i, obj in ipairs(objects) do
			local shouldHave = isNearObject(pos, obj)

			if shouldHave and not obj.object then
				local o = CreateObjectNoOffset(obj.hash, obj.pos, false, true, obj.dynamic)

				if o then
					SetEntityRotation(o, obj.rot, 2, true)
					FreezeEntityPosition(o, true)

					if obj.cellblockDoor then
						jailDoors[o] = true

						if(jaildoorsOpen)then
							SetEntityVisible(o, false)
							SetEntityCollision(o, false, true)
						end
					end

					obj.object = o
				end
			elseif not shouldHave and obj.object then
				DeleteObject(obj.object)
				if obj.cellblockDoor then
					if jailDoors[o]then
						jailDoors[o] = nil
					end
				end
				obj.object = nil
			end

			if (i % 75) == 0 then
				Citizen.Wait(15)
			end
		end
	end
end)