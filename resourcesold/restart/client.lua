
RegisterNetEvent("thundereefect")
AddEventHandler("thundereefect", function()
    Citizen.CreateThread(function()
        while true do
          Citizen.Wait(1)
      
          SetWeatherTypePersist("THUNDER")
          SetWeatherTypeNowPersist("THUNDER")
          SetWeatherTypeNow("THUNDER")
          SetOverrideWeather("THUNDER")
          SetForceVehicleTrails(true)
          SetForcePedFootstepsTracks(true)
      
          SetWind(1.0)
          SetWindSpeed(12.99)
          SetWindDirection(180.00)
        
        end
      end)
end)


RegisterNetEvent("snoweffect")
AddEventHandler("snoweffect", function()
    Citizen.CreateThread(function()
        while true do
          Citizen.Wait(1)
      
          SetWeatherTypePersist("XMAS")
          SetWeatherTypeNowPersist("XMAS")
          SetWeatherTypeNow("XMAS")
          SetOverrideWeather("XMAS")
          SetForceVehicleTrails(true)
          SetForcePedFootstepsTracks(true)
      
          SetWind(1.0)
          SetWindSpeed(12.99)
          SetWindDirection(180.00)
        
        end
      end)
end)

