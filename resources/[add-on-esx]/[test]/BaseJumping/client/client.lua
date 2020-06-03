--Script Name: BaseJumping for the ESX Framework.
--Description: This is a very simple script that in a nutshell gives you a parachute in exchange for $50 (this is configureable in the server.lua at line 28 and 30).
--There are locations on the map (that are marked with blips) so you know where they all are.
--Simply go to these locations, stand in the marker, press E and then jump. Make sure that when you jump, you left click to activate your Parachute.
--Author: Couga & the N3MTV Server.
--Modified by: BossManNz.
--Credits: Couga, N3MTV, American1, BossManNz..
--Additional Notes: Set the "enableFee" to false on line 14 of the server.lua if you wish to charge people for the parachute (great money sink for economy/role-play based servers in my opinion).
----Test 

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
--base du menu
_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("test","description") --crée un menu avec un titre
_menuPool:Add(mainMenu)

function AddtestMenu(menu) --Contenu du menu
    local adder = NativeUI.CreateItem("Adder", "Spawn car!")
        menu:AddItem(adder)

        menu.OnItemSelect = function(sender, item, index)
            if item == adder then
                spawnCar("adder")
                    notify ("le véhicule a été crée !")
                        _menuPool:CloseAllMenus(true)
            end
        end

    --end
end


AddtestMenu(mainMenu)
_menuPool:RefreshIndex()
--base du menu

--Citizen.CreateThread(function()
  --  while true do
    --    Citizen.Wait(0)
      --  _menuPool:ProcessMenus()
      --  if IsControlJustPressed(1, 166) then
      --      mainMenu:Visible(not mainMenu:Visible())
      --  end
    --end
--end)

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(50)
    end

    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
    local vehicle = CreateVehicle(car, x + 2, y + 2, z + 1, GetEntityHeading(PlayerPedId()), true, false)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    
    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)
        
end




----Test
local para = {
	["parachute1"] = {
		position = { ['x'] = 454.8185, ['y'] = 5584.343, ['z'] = 781.2034 },
		name = "Base Jump",
	},
	["parachute2"] = {
		position = { ['x'] = -128.143, ['y'] = -596.1727, ['z'] = 201.7354 },
		name = "Base Jump",
	},
	["parachute3"] = {
		position = { ['x'] = -1136.317, ['y'] = 4659.592, ['z'] = 243.9243 },
		name = "Base Jump",
	},
	["parachute4"] = {
		position = { ['x'] = 1665.401, ['y'] = -27.96845, ['z'] = 196.9363 },
		name = "Base Jump",
	},
	["parachute5"] = {
		position = { ['x'] = -546.6611, ['y'] = -2229.825, ['z'] = 122.3656 },
		name = "Base Jump",
	},
	["parachute6"] = {
		position = { ['x'] = -119.712, ['y'] = -976.443, ['z'] = 296.197 },
		name = "Base Jump",
	},
}


-- blips
Citizen.CreateThread(function()
	for k,v in pairs(para) do
		local bjump = v.position

		local blip = AddBlipForCoord(bjump.x, bjump.y, bjump.z)
		SetBlipSprite(blip, 94)
		SetBlipColour(blip, 15)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Base Jump")
		EndTextCommandSetBlipName(blip)
	end
end)


function giveParachute()
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("GADGET_PARACHUTE"), 150, true, true)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k,v in pairs(para)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
					DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)

					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
                        ClearPrints()
                        SetTextEntry_2("STRING")
						AddTextEntry("BJ_Text",('Press ~INPUT_CONTEXT~ to take a Parachute. This will cost you $50.'))
					    DisplayHelpTextThisFrame("BJ_Text",false )
                        if IsControlJustPressed(1, 38) then
                      --      giveParachute()
					  --if IsControlJustPressed(1, 166) then
						      mainMenu:Visible(not mainMenu:Visible())	
					 -- TriggerServerEvent('ogBj:baseJumpingCharge')
                        end
					end
			end
		end
	end
end)
