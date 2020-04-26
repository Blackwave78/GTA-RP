--CONFIGURATION--


local blips = {
  {title="ColisPostal", colour=51, id=318, x = -59.269546508789, y = -176.92587280273, z = 54.273845672607}, --Configuration du point sur la carte
}

local livpt = { --Configuration des points de livraisons (repris ceux de Maykellll1 / NetOut)
[1] = {name = "Vinewood Hills",x = -1220.50, y = 666.95 , z = 143.10},
[2] = {name = "Vinewood Hills",x = -1338.97, y = 606.31 , z = 133.37},
[3] = {name = "Rockford Hills",x = -1051.85, y = 431.66 , z = 76.06 },
[4] = {name = "Rockford Hills",x = -904.04 , y = 191.49 , z = 68.44 },
[5] = {name = "Rockford Hills",x = -21.58  , y = -23.70 , z = 72.24 },
[6] = {name = "Hawick"        ,x = -904.04 , y = 191.49 , z = 68.44 },
[7] = {name = "Alta"          ,x = 225.39  , y = -283.63, z = 28.25 },
[8] = {name = "Pillbox Hills" ,x = 5.62    , y = -707.72, z = 44.97 },
[9] = {name = "Mission Row"   ,x = 284.50  , y = -938.50 , z = 28.35},
[10] ={name = "Rancho"        ,x = 411.59  , y = -1487.54, z = 29.14},
[11] ={name = "Davis"         ,x = 85.19   , y = -1958.18, z = 20.12},
[12] ={name = "Chamberlain Hills",x = -213.00, y =-1617.35 , z =37.35},
[13] ={name = "La puerta"      ,x = -1015.65, y =-1515.05 ,z = 5.51}
}

local coursier = { x = -59.269546508789, y = -176.92587280273, z = 54.273845672607} --Configuration marker prise de service
local coursierfin = { x = -70.836, y = -182.460, z = 50.495} --Configuration marker fin de service
local spawnfaggio = { x = -52.984, y = -189.621, z = 54.164} --Configuration du point de spawn du faggio

local coefflouze = 0.1 --Coeficient multiplicateur qui en fonction de la distance definit la paie
local nbCours = 0
local isInJobCours = false
local livr = 0
local plateab = "POPJOBS"
local isToHouse = false
local isToCoursier = false
local paie = 0
local pourboire = 0
local posibilidad = 0
local px = 0
local py = 0
local pz = 0

--INIT--
ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

--THREADS--

Citizen.CreateThread(function() --Thread d'ajout du point de la pizzeria sur la carte

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

end)



Citizen.CreateThread(function() --Thread lancement + livraison depuis le marker vert
  while true do

    Citizen.Wait(0)

    if isInJobCours == false then

      DrawMarker(1,coursier.x,coursier.y,coursier.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,255,0, 200, 0, 0, 0, 0) --crée le marker pour lancer la mission cercle vert

      if GetDistanceBetweenCoords(coursier.x, coursier.y, coursier.z, GetEntityCoords(GetPlayerPed(-1),true)) < 1.5 then   --Récupére l'info si on est proche du marker et affiche l'info d'aide
        HelpText("Appuyez sur ~INPUT_CONTEXT~ pour lancer la livraison de ~r~colis",0,1,0.5,0.8,0.6,255,255,255,255)

        if IsControlJustPressed(1,38) then  --si E est pressé allors
            notif = true
            isInJobCours = true
            isToHouse = true
            livr = math.random(1, 13) --select des points alléatoire dans la liste des livraisons

            px = livpt[livr].x
            py = livpt[livr].y
            pz = livpt[livr].z
            distance = round(GetDistanceBetweenCoords(coursier.x, coursier.y, coursier.z, px,py,pz))
            paie = distance * coefflouze

            spawn_faggio()
            goliv(livpt,livr)
            nbCours = math.random(1, 13)

            TriggerServerEvent("coursier:itemadd", nbCours) ---add item pour livraison en fonction du nombres de livraison
             DrawSub('Test54564', 5000)

                  ESX.ShowAdvancedNotification('Mission :', '', 'Conduiser et livrer les colis', 'CHAR_DEFAULT', 8) --affiche un message ....


            Citizen.Wait(3000)
        end
      end
    end

    if isToHouse == true then
 
      destinol = livpt[livr].name --recupére le nom de la destination et l'affiche
        
      while notif == true do
         
            ESX.ShowAdvancedNotification('Mission :', '', 'Testing notification', 'CHAR_DEFAULT', 8) 
            --TriggerClientEvent("pNotify:SendNotification", -1, {
            --text = "Testing Notification",
            --type = "error",
            --queue = "lmao",
            --timeout = 10000,
            --layout = "bottomCenter"
        --})

        notif = false

        i = 1
      end

      DrawMarker(1,livpt[livr].x,livpt[livr].y,livpt[livr].z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,255,0, 200, 0, 0, 0, 0)

      if GetDistanceBetweenCoords(px,py,pz, GetEntityCoords(GetPlayerPed(-1),true)) < 3 then
        HelpText("Appuyez sur ~INPUT_CONTEXT~ pour livrer le colis",0,1,0.5,0.8,0.6,255,255,255,255)

        if IsControlJustPressed(1,38) then

          notif2 = true
          posibilidad = math.random(1, 100)
          afaitunecoursmin = true

          TriggerServerEvent("coursier:itemrm")
           ESX.ShowAdvancedNotification('Mission :', '', 'Un Colis deposé', 'CHAR_DEFAULT', 8) 
          nbCours = nbCours - 1

          if (posibilidad > 70) and (posibilidad < 90) then

            pourboire = math.random(100, 200)
              
            ESX.ShowAdvancedNotification('Mission :', '', 'Un petit pourboire : ' .. pourboire .. '$', 'CHAR_DEFAULT', 8) 
            --TriggerEvent("pNotify:SendNotification", {
            --  text = "Un petit pourboire : " .. pourboire .. "$",
            --  type = "success",
            --  queue = "global",
            --  timeout = 4000,
            --  layout = "bottomRight"
            --})

            TriggerServerEvent("coursier:pourboire", pourboire)

          end

          RemoveBlip(liv)
          Wait(250)
          if nbCours == 0 then
            isToHouse = false
            isToCoursier = true
          else
            isToHouse = true
            isToCoursier = false
            livr = math.random(1, 13)

            px = livpt[livr].x
            py = livpt[livr].y
            pz = livpt[livr].z

            distance = round(GetDistanceBetweenCoords(coursier.x, coursier.y, coursier.z, px,py,pz))
            paie = distance * coefflouze

            goliv(livpt,livr)
          end


        end
      end
    end

    if isToCoursier == true then

      while notif2 == true do
        SetNewWaypoint(coursier.x,coursier.y)
        ESX.ShowAdvancedNotification('Mission :', '', 'Direction dépot!', 'CHAR_DEFAULT', 8)
        --TriggerEvent("pNotify:SendNotification", {
        --  text = "Direction dépot!",
        --  type = "info",
        --  queue = "global",
        --  timeout = 4000,
        --  layout = "bottomRight"
        --})

        notif2 = false

      end
      DrawMarker(1,coursier.x,coursier.y,coursier.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,255,0, 200, 0, 0, 0, 0)

      if GetDistanceBetweenCoords(coursier.x,coursier.y,coursier.z, GetEntityCoords(GetPlayerPed(-1),true)) < 3 and afaitunecoursmin == true then
        HelpText("Appuyez sur ~INPUT_CONTEXT~ pour recuperer les colis",0,1,0.5,0.8,0.6,255,255,255,255)

        if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("mule2"))  then

          if IsControlJustPressed(1,38) then

            if IsInVehicle() then

              afaitunecoursmin = false
                ESX.ShowAdvancedNotification('Mission :', '', 'Nous vous remercions de votre travail, voici votre paie : ' .. paie .. '$', 'CHAR_DEFAULT', 8)
             -- TriggerEvent("pNotify:SendNotification", {
             --   text = "Nous vous remercions de votre travail, voici votre paie : " .. paie .. "$",
             --   type = "success",
             --   queue = "global",
             --   timeout = 4000,
             --   layout = "bottomRight"
             -- })

              TriggerServerEvent("coursier:pourboire", paie)

              isInJobCours = true
              isToHouse = true
              livr = math.random(1, 13)

              px = livpt[livr].x
              py = livpt[livr].y
              pz = livpt[livr].z

              distance = round(GetDistanceBetweenCoords(coursier.x, coursier.y, coursier.z, px,py,pz))
              paie = distance * coefflouze

              goliv(livpt,livr)
              nbPizza = math.random(1, 8)

              TriggerServerEvent("coursier:itemadd", nbPizza)

            else

              notifmoto1 = true

              while notifmoto1 == true do
                ESX.ShowAdvancedNotification('Mission :', '', 'Et le camion tu l\'as oublié ?', 'CHAR_DEFAULT', 8)
                --TriggerEvent("pNotify:SendNotification", {
                --  text = "Et le camion tu l'as oublié ?",
                --  type = "error",
                --  queue = "global",
                --  timeout = 4000,
                -- layout = "bottomRight"
                --})

                notifmoto1 = false

              end
            end
          end
        else

          notifmoto2 = true

          while notifmoto2 == true do
            ESX.ShowAdvancedNotification('Mission :', '', 'Et le camion tu l\'as oublié ?', 'CHAR_DEFAULT', 8)
            --TriggerEvent("pNotify:SendNotification", {
            -- text = "Et le camion tu l'as oublié ?",
            --  type = "error",
            --  queue = "global",
            --  timeout = 4000,
            --  layout = "bottomRight"
            --})

            notifmoto2 = false

          end
        end
      end
    end
    if IsEntityDead(GetPlayerPed(-1)) then

      isInJobCours = false
      livr = 0
      isToHouse = false
      isToCoursier = false

      paie = 0
      px = 0
      py = 0
      pz = 0
      RemoveBlip(liv)

    end
  end
end)



Citizen.CreateThread(function() -- Thread de "fin de service" depuis le point rouge
  while true do

    Citizen.Wait(0)

    if isInJobCours == true then

      DrawMarker(1,coursierfin.x,coursierfin.y,coursierfin.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)

      if GetDistanceBetweenCoords(coursierfin.x, coursierfin.y, coursierfin.z, GetEntityCoords(GetPlayerPed(-1),true)) < 1.5 then
        HelpText("Appuyez sur ~INPUT_CONTEXT~ pour arreter la livraison de ~r~colis",0,1,0.5,0.8,0.6,255,255,255,255)

        if IsControlJustPressed(1,38) then
          TriggerServerEvent('coursier:deleteAllCours')
          isInJobCours = false
          livr = 0
          isToHouse = false
          isToCoursier = false

          paie = 0
          px = 0
          py = 0
          pz = 0

          if afaitunecoursmin == true then

            local vehicleu = GetVehiclePedIsIn(GetPlayerPed(-1), false)

            SetEntityAsMissionEntity( vehicleu, true, true )
            deleteCar( vehicleu )
            
            ESX.ShowAdvancedNotification('Mission :', '', 'Merci d\'avoir travaillé, bonne journée', 'CHAR_DEFAULT', 8)
            --TriggerEvent("pNotify:SendNotification", {
            --  text = "Merci d'avoir travaillé, bonne journée",
            --  type = "success",
            --  queue = "global",
            --  timeout = 4000,
            --  layout = "bottomRight"
            --})

            TriggerServerEvent("coursier:paiefinale")

            SetWaypointOff()

            afaitunecoursmin = false

          else

            local vehicleu = GetVehiclePedIsIn(GetPlayerPed(-1), false)

            SetEntityAsMissionEntity( vehicleu, true, true )
            deleteCar( vehicleu )
           
            ESX.ShowAdvancedNotification('Mission :', '', 'Merci quand même (pour rien), bonne journée', 'CHAR_DEFAULT', 8)
            --TriggerEvent("pNotify:SendNotification", {
            --  text = "Merci quand même (pour rien), bonne journée",
            --  type = "error",
            --  queue = "global",
            --  timeout = 4000,
            --  layout = "bottomRight"
            --})
          end
        end
      end
    end
  end
end)

--FONCTIONS--


function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
  SetTextFont(font)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(centre)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x , y)
end


function goliv(livpt,livr) -- Fonction d'ajout du point en fonction de la destination de livraison chosie
  liv = AddBlipForCoord(livpt[livr].x,livpt[livr].y, livpt[livr].z)
  SetBlipSprite(liv, 1)
  SetNewWaypoint(livpt[livr].x,livpt[livr].y)
end

function spawn_faggio() -- Thread spawn faggio

  Citizen.Wait(0)

  local myPed = GetPlayerPed(-1)
  local player = PlayerId()
  local vehicle = GetHashKey('mule2')

  RequestModel(vehicle)

  while not HasModelLoaded(vehicle) do
    Wait(1)
  end

  local plateJob = math.random(1000, 9999)
  local spawned_car = CreateVehicle(vehicle, spawnfaggio.x,spawnfaggio.y,spawnfaggio.z, 431.436, - 996.786, 25.1887, true, false)

  local plate = "COURSIER"..plateJob

  SetVehicleNumberPlateText(spawned_car, plate)
  SetVehicleOnGroundProperly(spawned_car)
  SetVehicleLivery(spawned_car, 2)
  SetPedIntoVehicle(myPed, spawned_car, - 1)
  SetModelAsNoLongerNeeded(vehicle)

  Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
end

function round(num, numDecimalPlaces)
  local mult = 5^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function deleteCar( entity )
  Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) ) --Native qui del le vehicule
end

function IsInVehicle() --Fonction de verification de la presence ou non en vehicule du joueur
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

function HelpText(text, state) --Fonction qui permet de creer les "Help Text" (Type "Appuyez sur ...")
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end


function DrawSub(msg, time)
  ClearPrints()
  SetTextEntry_2("STRING")
  AddTextComponentString(msg)
  DrawSubtitleTimed(time, 1)
end