local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local PlayerData                = {}
local IsJailed = false
local unjail = false
local JailTime = 0
local fastTimer = 0
local JailLocation = Config.Zones
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_jail:jail')
AddEventHandler('esx_jail:jail', function(jailTime)
	if IsJailed then -- don't allow multiple jails
		return
	end

	JailTime = jailTime
	local playerPed = PlayerPedId()
	if DoesEntityExist(playerPed) then
		Citizen.CreateThread(function()
		
			-- Assign jail skin to user
			TriggerEvent('skinchanger:getSkin', function(skin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms['prison_wear'].male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms['prison_wear'].female)
				end
			end)
			
			-- Clear player
			SetPedArmour(playerPed, 0)
			ClearPedBloodDamage(playerPed)
			ResetPedVisibleDamage(playerPed)
			ClearPedLastWeaponDamage(playerPed)
			ResetPedMovementClipset(playerPed, 0)
			
			ESX.Game.Teleport(playerPed, JailLocation)
			IsJailed = true
			unjail = false
			while JailTime > 0 and not unjail do
				playerPed = PlayerPedId()

				RemoveAllPedWeapons(playerPed, true)
				if IsPedInAnyVehicle(playerPed, false) then
					ClearPedTasksImmediately(playerPed)
				end

				if JailTime % 120 == 0 then
					TriggerServerEvent('esx_jail:updateRemaining', JailTime)
				end

				Citizen.Wait(20000)
--need to test
				-- Is the player trying to escape?
				if GetDistanceBetweenCoords(GetEntityCoords(playerPed), JailLocation.x, JailLocation.y, JailLocation.z) > 155 then
			--	ESX.Game.Teleport(playerPed, JailLocation)
					TriggerEvent('chat:addMessage', { args = { _U('judge'), _U('escape_attempt') }, color = { 147, 196, 109 } })
					SendDistressSignal()
				end
				 
				JailTime = JailTime - 20
			end

			-- jail time served
			TriggerServerEvent('esx_jail:unjailTime', -1)
			ESX.Game.Teleport(playerPed, Config.JailBlip)
			IsJailed = false

			-- Change back the user skin
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		end)
	end
end)

--Citizen.CreateThread(function()
--	while true do
--		Citizen.Wait(1)
--
--		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), JailLocation.x, JailLocation.y, JailLocation.z) > 155 then
		--	ESX.Game.Teleport(playerPed, JailLocation)
--			TriggerEvent('chat:addMessage', { args = { _U('judge'), _U('escape_attempt') }, color = { 147, 196, 109 } })
--			SendDistressSignal()
--		end



--		if JailTime > 0 and IsJailed then
--			if fastTimer < 0 then
--				fastTimer = JailTime
--			end

--			draw2dText(_U('remaining_msg', ESX.Math.Round(fastTimer)), { 0.175, 0.955 } )
--			fastTimer = fastTimer - 0.01
--		else
--			Citizen.Wait(1000)
--		end
--	end
--end)







Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		if JailTime > 0 and IsJailed then
			if fastTimer < 0 then
				fastTimer = JailTime
			end

			draw2dText(_U('remaining_msg', ESX.Math.Round(fastTimer)), { 0.175, 0.955 } )
			fastTimer = fastTimer - 0.01
		else
			Citizen.Wait(1000)
		end
	end
end)

RegisterNetEvent('esx_jail:unjail')
AddEventHandler('esx_jail:unjail', function(source)
	unjail = true
	JailTime = 0
	fastTimer = 0
end)

-- When player respawns / joins
AddEventHandler('playerSpawned', function(spawn)
	if IsJailed then
		ESX.Game.Teleport(PlayerPedId(), JailLocation)
	else
		TriggerServerEvent('esx_jail:checkJail')
	end
end)

-- When script starts
Citizen.CreateThread(function()
	Citizen.Wait(2000) -- wait for mysql-async to be ready, this should be enough time
	TriggerServerEvent('esx_jail:checkJail')
end)

-- Create Blips
Citizen.CreateThread(function()
	local blip = AddBlipForCoord(Config.JailBlip.x, Config.JailBlip.y, Config.JailBlip.z)
	SetBlipSprite (blip, 188)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 1.0)
	SetBlipColour (blip, 4)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString(_U('blip_name'))
	EndTextCommandSetBlipName(blip)
end)

function draw2dText(text, pos)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(table.unpack(pos))
end

function SendDistressSignal()
	local playerPed = PlayerPedId()
	PedPosition		= GetEntityCoords(playerPed)
	
	local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }

	ESX.ShowNotification(_U('distress_sent'))

    TriggerServerEvent('esx_addons_gcphone:startCall', 'police', 'Tentative d\'evasion', PlayerCoords, {

		PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z },
	})
end

--------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
		--	if PlayerData.job ~= nil and PlayerData.job.name == 'ferme' then
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				end
		--	end
		end
	end
end)

function blips()
--	if publicBlip == true then
		local blip = AddBlipForCoord(Config.Zones.timeunjail.Pos.x, Config.Zones.timeunjail.Pos.y, Config.Zones.timeunjail.Pos.z)
	local blip = AddBlipForCoord(2444.408, 4987.925, 46)
		SetBlipSprite (blip, 181)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.0)
		SetBlipColour (blip, 28)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Unjail")
		EndTextCommandSetBlipName(blip)
		publicBlip = true
--	end
end



-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do

		Wait(0)

		--if PlayerData.job ~= nil and PlayerData.job.name == 'ferme' then

			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil

			for k,v in pairs(Config.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('esx_jail:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_jail:hasExitedMarker', LastZone)
			end
		--end
	end
end)

AddEventHandler('esx_jail:hasEnteredMarker', function(zone)
	if IsJailed == true then
		if zone == 'timeunjail' then--and PlayerData.job ~= nil and PlayerData.job.name == 'ferme'  then
			CurrentAction     = 'ble_harvest'
			CurrentActionMsg  = _U('press_collect')
			CurrentActionData = {zone= zone}
		end
		--[[	
		if zone == 'TraitementBle' and PlayerData.job ~= nil and PlayerData.job.name == 'ferme'  then
			CurrentAction     = 'tabacsec_traitement'
			CurrentActionMsg  = _U('press_collect')
			CurrentActionData = {zone= zone}
		end		
		
		if zone == 'TraitementJus' and PlayerData.job ~= nil and PlayerData.job.name == 'ferme'  then
			CurrentAction     = 'ble_traitement'
			CurrentActionMsg  = _U('press_traitement')
			CurrentActionData = {zone = zone}
		end
		
		if zone == 'SellFarm' and PlayerData.job ~= nil and PlayerData.job.name == 'ferme'  then
			CurrentAction     = 'farm_resell'
			CurrentActionMsg  = _U('press_sell')
			CurrentActionData = {zone = zone}
		end

		if zone == 'FermeActions' and PlayerData.job ~= nil and PlayerData.job.name == 'ferme' then
			CurrentAction     = 'ferme_actions_menu'
			CurrentActionMsg  = _U('press_to_open')
			CurrentActionData = {}
		end
  
		if zone == 'VehicleSpawner' and PlayerData.job ~= nil and PlayerData.job.name == 'ferme' then
			CurrentAction     = 'vehicle_spawner_menu'
			CurrentActionMsg  = _U('spawn_veh')
			CurrentActionData = {}
		end
		
		if zone == 'VehicleDeleter' and PlayerData.job ~= nil and PlayerData.job.name == 'ferme' then

			local playerPed = GetPlayerPed(-1)
			local coords    = GetEntityCoords(playerPed)
		
		if IsPedInAnyVehicle(playerPed,  false) then

			local vehicle, distance = ESX.Game.GetClosestVehicle({
				x = coords.x,
				y = coords.y,
				z = coords.z
			})

			if distance ~= -1 and distance <= 1.0 then

				CurrentAction     = 'delete_vehicle'
				CurrentActionMsg  = _U('store_veh')
				CurrentActionData = {vehicle = vehicle}

			end
		end
	end
	]]
	end
end)


AddEventHandler('esx_jail:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	if (zone == 'timeunjail') then --and PlayerData.job ~= nil and PlayerData.job.name == 'ferme' then
		TriggerServerEvent('esx_jail:stopHarvest')
	end  
	--if (zone == 'TraitementBle' or zone == 'TraitementJus') and PlayerData.job ~= nil and PlayerData.job.name == 'ferme' then
	--	TriggerServerEvent('esx_jail:stopTransform')
	--end
	--if (zone == 'SellFarm') and PlayerData.job ~= nil and PlayerData.job.name == 'ferme' then
	--	TriggerServerEvent('esx_jail:stopSell')
	--end
	CurrentAction = nil
end)


-- Key Controls
Citizen.CreateThread(function(jailTime)
	while true do

		Citizen.Wait(0)

		if CurrentAction ~= nil then

			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlPressed(0,  Keys['E']) then --and PlayerData.job ~= nil and PlayerData.job.name == 'ferme' and (GetGameTimer() - GUI.Time) > 300 then
				if CurrentAction == 'ble_harvest' then
					--TriggerServerEvent('esx_jail:startHarvest', CurrentActionData.zone)
				--	TriggerServerEvent('esx_jail:unjailTime', -1)
				JailTime = JailTime - 200


				end
	--			if CurrentAction == 'ble_traitement' then
	--				TriggerServerEvent('esx_fermier:startTransform', CurrentActionData.zone)
	--			end
	--			if CurrentAction == 'tabacsec_traitement' then
	--				TriggerServerEvent('esx_fermier:startTransform', CurrentActionData.zone)
	--			end
	--			if CurrentAction == 'farm_resell' then
	--				TriggerServerEvent('esx_fermier:startSell', CurrentActionData.zone)
	--			end
	--			
	--			if CurrentAction == 'ferme_actions_menu' then
	--				OpentabacActionsMenu()
	--			end
	--			if CurrentAction == 'vehicle_spawner_menu' then
	--				OpenVehicleSpawnerMenu()
	--			end
	--			if CurrentAction == 'delete_vehicle' then
--
--					if Config.EnableSocietyOwnedVehicles then
--						local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
--						TriggerServerEvent('esx_society:putVehicleInGarage', 'ferme', vehicleProps)
--					end
---
	--				ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
	--			end

				CurrentAction = nil
			--	GUI.Time      = GetGameTimer()

			end
		end

	--	if IsControlPressed(0,  Keys['F6']) and Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.name == 'ferme' and (GetGameTimer() - GUI.Time) > 150 then
	--		OpenMobilefermeActionsMenu()
	--		GUI.Time = GetGameTimer()
	--	end
	end
end)




