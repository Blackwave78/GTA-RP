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

local times, randomnumber, count = 0, 0, 0
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Illegal", "~b~Revendeur d'infos illegal")

_menuPool:Add(mainMenu)
_menuPool:MouseControlsEnabled (false);
_menuPool:MouseEdgeEnabled (false);
_menuPool:ControlDisablingEnabled(false);


--/////Recolte start

function FirstItem(menu)

local submenu = _menuPool:AddSubMenu(menu, "~g~Recolte")
_menuPool:MouseControlsEnabled (false);
_menuPool:MouseEdgeEnabled (false);
_menuPool:ControlDisablingEnabled(false);

    local weedItemRecolt = NativeUI.CreateItem("Recolte de la weed", "Prix : ~r~500$")
    weedItemRecolt.Activated = function(sender, item)
        if item == weedItemRecolt then
            TriggerServerEvent('buyWeedF')
            _menuPool:CloseAllMenus(true)
        end
   end
   local OpiumItemRecolt = NativeUI.CreateItem("Recolte de l' Opium", "Prix : ~r~600$")
   OpiumItemRecolt.Activated = function(sender, item)
        if item == OpiumItemRecolt then
            TriggerServerEvent('buyOpiumF')
            _menuPool:CloseAllMenus(true)
        end
   end
   local CokeItemRecolt = NativeUI.CreateItem("Recolte de la Coke", "Prix : ~r~700$")
   CokeItemRecolt.Activated = function(sender, item)
        if item == CokeItemRecolt then
            TriggerServerEvent('buyCokeF')
            _menuPool:CloseAllMenus(true)
        end
   end
   local MethItemRecolt = NativeUI.CreateItem("Recolte de la Meth", "Prix : ~r~800$")
   MethItemRecolt.Activated = function(sender, item)
        if item == MethItemRecolt then
            TriggerServerEvent('buyMethF')
            _menuPool:CloseAllMenus(true)
        end
   end
   
   local CrackItemRecolt = NativeUI.CreateItem("Recolte du Crack", "Prix : ~r~900$") 
   CrackItemRecolt.Activated = function(sender, item)
        if item == CrackItemRecolt then
            TriggerServerEvent('buyCrackF')
            _menuPool:CloseAllMenus(true)
        end
   end
   local ketatemRecolt = NativeUI.CreateItem("Recolte de la ketamine", "Prix : ~r~1000$")
   ketatemRecolt.Activated = function(sender, item)
        if item == ketatemRecolt then
            TriggerServerEvent('buyketaF')
            _menuPool:CloseAllMenus(true)
        end
   end
   
   local EcstaItemRecolt = NativeUI.CreateItem("Recolte de l'Ecstasy", "Prix : ~r~1200$")
   EcstaItemRecolt.Activated = function(sender, item)
        if item ==EcstaItemRecolt then
            TriggerServerEvent('buyecstaF')
            _menuPool:CloseAllMenus(true)
        end
   end

submenu:AddItem(weedItemRecolt)
submenu:AddItem(CokeItemRecolt)
submenu:AddItem(OpiumItemRecolt)
submenu:AddItem(MethItemRecolt)
submenu:AddItem(CrackItemRecolt)
submenu:AddItem(ketatemRecolt)
submenu:AddItem(EcstaItemRecolt)
end


RegisterNetEvent("showweedpoint")
AddEventHandler("showweedpoint", function()
    ESX.ShowNotification('Vous avez payez ~r~500$')
    Citizen.Wait(0)
    x, y, z = Config.WeedFarm.x, Config.WeedFarm.y, Config.WeedFarm.z 
    SetWaypointOff ()
    SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)          
end)

RegisterNetEvent("showopiumpoint")
AddEventHandler("showopiumpoint", function()
    ESX.ShowNotification('Vous avez payez ~r~600$')
    Citizen.Wait(0)
    x, y, z = Config.OpiumFarm.x, Config.OpiumFarm.y, Config.OpiumFarm.z 
    SetWaypointOff ()
    SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)         
end)

RegisterNetEvent("showcokepoint")
AddEventHandler("showcokepoint", function()
    ESX.ShowNotification('Vous avez payez ~r~700$')
    Citizen.Wait(0)
    x, y, z = Config.CokeFarm.x, Config.CokeFarm.y, Config.CokeFarm.z 
    SetWaypointOff ()
    SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)

RegisterNetEvent("showMethpoint")
AddEventHandler("showMethpoint", function()
    ESX.ShowNotification('Vous avez payez ~r~800$')
    Citizen.Wait(0)
    x, y, z = Config.MethFarm.x, Config.MethFarm.y, Config.MethFarm.z 
    SetWaypointOff ()
    SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)

RegisterNetEvent("showcrackpoint")
AddEventHandler("showcrackpoint", function()
    ESX.ShowNotification('Vous avez payez ~r~900$')
    Citizen.Wait(0)
    x, y, z = Config.CrackFarm.x, Config.CrackFarm.y, Config.CrackFarm.z 
    SetWaypointOff ()
    SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)

RegisterNetEvent("showketapoint")
AddEventHandler("showketapoint", function()
    ESX.ShowNotification('Vous avez payez ~r~1000$')
    Citizen.Wait(0)
    x, y, z = Config.KetamineFarm.x, Config.KetamineFarm.y, Config.KetamineFarm.z 
    SetWaypointOff ()
    SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)

RegisterNetEvent("showecstapoint")
AddEventHandler("showecstapoint", function()
    ESX.ShowNotification('Vous avez payez ~r~1200$')
    Citizen.Wait(0)
    x, y, z = Config.EcstasyFarm.x, Config.EcstasyFarm.y, Config.EcstasyFarm.z
    SetWaypointOff ()
    SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)
--/////Recolte end

--/////Traitement start
function SecondItem(menu) 

  local submenu = _menuPool:AddSubMenu(menu, "~y~Traitement") 
  _menuPool:MouseControlsEnabled (false);
  _menuPool:MouseEdgeEnabled (false);
  _menuPool:ControlDisablingEnabled(false);


  local weedItemTreatement = NativeUI.CreateItem("Traitement de la weed", "Prix : ~r~800$")
  weedItemTreatement.Activated = function(sender, item)
      if item == weedItemTreatement then
            TriggerServerEvent('buytraitementweed')
            _menuPool:CloseAllMenus(true)
        end
 end
 local OpiumItemTreatement = NativeUI.CreateItem("Traitement de l' Opium", "Prix : ~r~900$")
 OpiumItemTreatement.Activated = function(sender, item)
      if item == OpiumItemTreatement then
            TriggerServerEvent('buytraitementOpium')
            _menuPool:CloseAllMenus(true)
        end
 end
 local CokeItemTreatement = NativeUI.CreateItem("Traitement de la Coke", "Prix : ~r~1000$")
 CokeItemTreatement.Activated = function(sender, item)
      if item == CokeItemTreatement then
              TriggerServerEvent('buytraitementCoke')
              _menuPool:CloseAllMenus(true)
          end
 end
 local MethItemTreatement = NativeUI.CreateItem("Traitement de la Meth", "Prix : ~r~1100$")
 MethItemTreatement.Activated = function(sender, item)
      if item == MethItemTreatement then
            TriggerServerEvent('buytraitementMeth')
            _menuPool:CloseAllMenus(true)
        end
 end
  local CrackItemTreatement = NativeUI.CreateItem("Traitement du Crack", "Prix : ~r~1200$")
 CrackItemTreatement.Activated = function(sender, item)
      if item == CrackItemTreatement then
            TriggerServerEvent('buytraitementCrack')
            _menuPool:CloseAllMenus(true)
        end
 end

 local KetaItemTreatement = NativeUI.CreateItem("Traitement de la Ketamine", "Prix : ~r~1300$")
 KetaItemTreatement.Activated = function(sender, item)
      if item == KetaItemTreatement then
            TriggerServerEvent('buytraitementKeta')
            _menuPool:CloseAllMenus(true)
        end
 end

 local EcstaItemTreatement = NativeUI.CreateItem("Traitement de l'exctasy", "Prix : ~r~1500$")
 EcstaItemTreatement.Activated = function(sender, item)
      if item == EcstaItemTreatement then
            TriggerServerEvent('buytraitmentexctasy')
            _menuPool:CloseAllMenus(true)
        end
 end

submenu:AddItem(weedItemTreatement)
submenu:AddItem(CokeItemTreatement)
submenu:AddItem(OpiumItemTreatement)
submenu:AddItem(MethItemTreatement)
submenu:AddItem(CrackItemTreatement)
submenu:AddItem(KetaItemTreatement)
submenu:AddItem(EcstaItemTreatement)

end

RegisterNetEvent("showweedtreapementpoint")
AddEventHandler("showweedtreapementpoint", function()
    ESX.ShowNotification('Vous avez payez ~r~500$')
    Citizen.Wait(0)
        x, y, z = Config.WeedTreatment.x, Config.WeedTreatment.y, Config.WeedTreatment.z 
        SetWaypointOff()
        SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)

RegisterNetEvent("showopiumtreapementpoint")
AddEventHandler("showopiumtreapementpoint", function()
    ESX.ShowNotification('Vous avez payez ~r~500$')
    Citizen.Wait(0)
        x, y, z = Config.OpiumTreatment.x, Config.OpiumTreatment.y, Config.OpiumTreatment.z 
        SetWaypointOff()
        SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)

RegisterNetEvent("showcoketreapementpoint")
AddEventHandler("showcoketreapementpoint", function()
    ESX.ShowNotification('Vous avez payez ~r~500$')
    Citizen.Wait(0)
        x, y, z = Config.CokeTreatment.x, Config.CokeTreatment.y, Config.CokeTreatment.z
        SetWaypointOff()
        SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)

RegisterNetEvent("showmethtreapementpoint")
AddEventHandler("showmethtreapementpoint", function()
    ESX.ShowNotification('Vous avez payez ~r~500$')
    Citizen.Wait(0)
        x, y, z = Config.MethTreatment.x, Config.MethTreatment.y, Config.MethTreatment.z
        SetWaypointOff()
        SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)

RegisterNetEvent("showcracktreapementpoint")
AddEventHandler("showcracktreapementpoint", function() 
    ESX.ShowNotification('Vous avez payez ~r~500$')
    Citizen.Wait(0)
        SetWaypointOff ()
        x, y, z = Config.CrackTreatment.x, Config.CrackTreatment.y, Config.CrackTreatment.z 
        SetWaypointOff()
        SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)

RegisterNetEvent("showketatreapementpoint")
AddEventHandler("showketatreapementpoint", function() 
    ESX.ShowNotification('Vous avez payez ~r~500$')
    Citizen.Wait(0)
        x, y, z = Config.KetamineTreatment.x, Config.KetamineTreatment.y, Config.KetamineTreatment.z 
        SetWaypointOff()
        SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)

RegisterNetEvent("showecstatreapementpoint")
AddEventHandler("showecstatreapementpoint", function() 
    ESX.ShowNotification('Vous avez payez ~r~500$')
    Citizen.Wait(0)
        x, y, z = Config.EcstasyTreatment.x, Config.EcstasyTreatment.y, Config.EcstasyTreatment.z 
        SetWaypointOff()
        SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)

--/////Traitement stop

--/////Transform start

function FourthItem(menu) 
   local submenu = _menuPool:AddSubMenu(menu, "~r~Revente") 
   _menuPool:MouseControlsEnabled (false);
   _menuPool:MouseEdgeEnabled (false);
   _menuPool:ControlDisablingEnabled(false);
  
   local weedItemRev = NativeUI.CreateItem("Revente de la weed", "Prix : ~r~1200$")
   weedItemRev.Activated = function(sender, item)
       if item == weedItemRev then
            TriggerServerEvent('buyrevweed')
            _menuPool:CloseAllMenus(true)
        end
  end
  
  local OpiumItemRev = NativeUI.CreateItem("Revente de l' Opium", "Prix : ~r~1300$")
  OpiumItemRev.Activated = function(sender, item)
       if item == OpiumItemRev then
            TriggerServerEvent('buyrevOpium')
            _menuPool:CloseAllMenus(true)
        end
  end
    
  local CokeItemRev = NativeUI.CreateItem("Revente de la Coke", "Prix : ~r~1300$")
  CokeItemRev.Activated = function(sender, item)
       if item == CokeItemRev then
            TriggerServerEvent('buyrevCoke') 
            _menuPool:CloseAllMenus(true)
        end
  end

  local MethItemRev = NativeUI.CreateItem("Revente de la Meth", "Prix : ~r~1400$")
  MethItemRev.Activated = function(sender, item)
       if item == MethItemRev then
            TriggerServerEvent('buyrevMeth')
            _menuPool:CloseAllMenus(true)
        end
  end


  local CrackItemRev = NativeUI.CreateItem("Revente du Crack", "Prix : ~r~1500$")
  CrackItemRev.Activated = function(sender, item)
       if item == CrackItemREv then
            TriggerServerEvent('buyrevCrack')
            _menuPool:CloseAllMenus(true)
        end
  end

  local KetaItemRev = NativeUI.CreateItem("Revente de la Ketamine", "Prix : ~r~1600$")
  KetaItemRev.Activated = function(sender, item)
       if item == KetaItemRev then
            TriggerServerEvent('buyrevKeta') 
            _menuPool:CloseAllMenus(true)
        end
  end

  local EcstaItemRev = NativeUI.CreateItem("Revente de l'Ecstasy", "Prix : ~r~1800$")
  EcstaItemRev.Activated = function(sender, item)
       if item == EcstaItemRev then
            TriggerServerEvent('buyrevExsta') 
            _menuPool:CloseAllMenus(true)
        end
  end

     submenu:AddItem(weedItemRev)
     submenu:AddItem(CokeItemRev)
     submenu:AddItem(OpiumItemRev)
     submenu:AddItem(MethItemRev)
     submenu:AddItem(CrackItemRev)
     submenu:AddItem(KetaItemRev)
     submenu:AddItem(EcstaItemRev)
end

RegisterNetEvent("showweedrevpoint")
AddEventHandler("showweedrevpoint", function() 
    ESX.ShowNotification('Vous avez payez ~r~200$')
    Citizen.Wait(0)
        x, y, z = Config.WeedResell.x, Config.WeedResell.y, Config.WeedResell.z 
        SetWaypointOff()
        SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)

RegisterNetEvent("showopiumrevpoint")
AddEventHandler("showopiumrevpoint", function() 
    ESX.ShowNotification('Vous avez payez ~r~200$')
    Citizen.Wait(0)
        x, y, z = Config.OpiumResell.x, Config.OpiumResell.y, Config.OpiumResell.z 
        SetWaypointOff()
        SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)

RegisterNetEvent("showcokerevpoint")
AddEventHandler("showcokerevpoint", function() 
    ESX.ShowNotification('Vous avez payez ~r~200$')
    Citizen.Wait(0)
        x, y, z = Config.CokeResell.x, Config.CokeResell.y, Config.CokeResell.z 
        SetWaypointOff()
        SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)

RegisterNetEvent("showMethrevpoint")
AddEventHandler("showMethrevpoint", function() 
    ESX.ShowNotification('Vous avez payez ~r~200$')
    Citizen.Wait(0)
        x, y, z = Config.MethResell.x, Config.MethResell.y, Config.MethResell.z 
        SetWaypointOff()
        SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)

RegisterNetEvent("showCrackrevpoint")
AddEventHandler("showCrackrevpoint", function() 
    ESX.ShowNotification('Vous avez payez ~r~200$')
    Citizen.Wait(0)
        x, y, z = Config.CrackResell.x, Config.CrackResell.y, Config.CrackResell.z 
        SetWaypointOff()
        SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)


RegisterNetEvent("showketarevpoint")
AddEventHandler("showketarevpoint", function() 
    ESX.ShowNotification('Vous avez payez ~r~200$')
    Citizen.Wait(0)
        --  spawnCar("bmx")
        x, y, z = Config.KetamineResel.x, Config.KetamineResel.y, Config.KetamineResel.z 
        SetWaypointOff()
        SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)

RegisterNetEvent("showexstarevpoint")
AddEventHandler("showexstarevpoint", function() 
    ESX.ShowNotification('Vous avez payez ~r~200$')
    Citizen.Wait(0)
        x, y, z = Config.EcstasyResel.x, Config.EcstasyResel.y, Config.EcstasyResel.z 
        SetWaypointOff()
        SetNewWaypoint(x, y, z)
    ESX.ShowAdvancedNotification("Illegal", "Voici l'endroit Trouve le type prés de ~b~cette endroit~w~!", "", "CHAR_CARSITE", 1)
end)

FirstItem(mainMenu)
SecondItem(mainMenu)
FourthItem(mainMenu)
_menuPool:RefreshIndex()

--/////Transform stop


function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

-- Blips

local blips = {
    {title="~b~Info-Illegal", colour=3, id=66, x = 163.31, y = 552.557, z = 182.342}
}

Citizen.CreateThread(function()
if Config.showblip == true then
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.9)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end
end)

local zikoz = {
 	{x = 163.31, y = 552.557, z = 182.342},
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        _menuPool:MouseEdgeEnabled (false);

        for k in pairs(zikoz) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, zikoz[k].x, zikoz[k].y, zikoz[k].z)

            if dist <= 1.2 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour intéragir avec ~b~Bernard")
				if IsControlJustPressed(1,51) then 
                    mainMenu:Visible(not mainMenu:Visible())
				end
            end
        end
    end
end)

local v1 = vector3(163.31, 552.557, 182.342)

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
            Draw3DText(v1.x,v1.y,v1.z, "Bernard")
		end
	end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_m_gardener_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
	ped = CreatePed("PED_TYPE_CIVMALE", "s_m_m_gardener_01", 163.31, 552.557, 181.342, 224.591, true, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)
end)