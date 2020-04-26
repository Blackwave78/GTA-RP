----------------
----------------
----------------
----------------
----------------
----Prototype


local malade = false
local chance = 6 -- The chance of being sick


local IsAlreadyDrunk = false
local DrunkLevel     = -1

Citizen.CreateThread(function()

while true do
		Citizen.Wait(60000)

  local chancesaint = math.random(1, 100)

   if chancesaint <= chance then -- Checks if the randomized number is under 6, 5% of 100 (as default).
       malade = true -- Getting sick if you successfully got under the "chance".

    end
  end
end)
  

Citizen.CreateThread(function()

while true do

    local chansattmalade = math.random(3000, 5000)

	Citizen.Wait(chansattmalade)

    if malade then --Checks if ill

        --Cough animation
	  -- RequestAnimDict("timetable@gardener@smoking_joint")
      --   while not HasAnimDictLoaded("timetable@gardener@smoking_joint") do
      RequestAnimDict("amb@lo_res_idles@")  ---try
      while not HasAnimDictLoaded("amb@lo_res_idles@") do ---try
          Citizen.Wait(100)
         end

        --    TaskPlayAnim(GetPlayerPed(-1), "timetable@gardener@smoking_joint", "idle_cough", 8.0, 8.0, -1, 50, 0, false, false, false)
           TaskPlayAnim(GetPlayerPed(-1), "amb@lo_res_idles@", "squat_lo_res_base", 8.0, 8.0, -1, 50, 0, false, false, false)  ---try
       
            Citizen.Wait(3000)
            ClearPedSecondaryTask(GetPlayerPed(-1))

        end
    end
end)

Citizen.CreateThread(function()

    while true do

    local chanstgerison = math.random(900000, 1800000) -- Chance of being healthy by yourself

    Citizen.Wait(chanstgerison)

    if malade then

    malade = false

        end
    end
end)

--antibiotics stuff 
RegisterNetEvent('esx_maladie:frisk')
AddEventHandler('esx_maladie:frisk', function()

  malade = false
  Clear()
  
end)

----


--antibiotics stuff 
RegisterNetEvent('esx_maladie:trost')
AddEventHandler('esx_maladie:trost', function()

  malade = true
  Malade()

end)







--------------------------------------------------------------
function Malade()
  
  RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
  while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
    Citizen.Wait(0)
  end
 -- TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
  Citizen.Wait(5000)
  DoScreenFadeOut(1000)
  Citizen.Wait(1000)
  ClearPedTasksImmediately(GetPlayerPed(-1))
  SetTimecycleModifier("spectator5")
  SetPedMotionBlur(GetPlayerPed(-1), true)
  SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
  SetPedIsDrunk(GetPlayerPed(-1), true)
  DoScreenFadeIn(1000)
  Citizen.Wait(600000)
  DoScreenFadeOut(1000)
  Citizen.Wait(1000)
  DoScreenFadeIn(1000)
  ClearTimecycleModifier()
  ResetScenarioTypesEnabled()
  ResetPedMovementClipset(GetPlayerPed(-1), 0)
  SetPedIsDrunk(GetPlayerPed(-1), false)
  SetPedMotionBlur(GetPlayerPed(-1), false)
  --[[
--  Citizen.CreateThread(function()

    local playerPed = GetPlayerPed(-1)

  -- if start then
      DoScreenFadeOut(800)
      Wait(1000) 
      DoScreenFadeIn(800)
      Wait(1000)
   -- end
      RequestAnimSet("move_m@drunk@slightlydrunk")
      
      while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
        Citizen.Wait(0)
      end

      SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)

   
 -- end

 ]]
  
end



function Clear()

  Citizen.CreateThread(function()

    local playerPed = GetPlayerPed(-1)

    DoScreenFadeOut(800)
    Wait(1000)

    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(playerPed, 0)
    SetPedIsDrunk(playerPed, false)
    SetPedMotionBlur(playerPed, false)

    DoScreenFadeIn(800)

  end)

end