Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 700  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = false -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'fr'

Config.EarlyRespawnTimer          = 60000 * 1  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 10 -- time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 50

Config.RespawnPoint = {coords = vector3(341.0, -1397.3, 32.5), heading = 48.5}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = 		vector3(335.94, -579.568, 28.791),
			sprite = 61,
			scale  = 1.0,
			color  = 2
		},

		AmbulanceActions = {
		--	{X: 335.94, Y: -579.568, Z: 28.791} {H: 172.562} {Comment: ambu},
		--{"x":335.9,"heading":245.2,"z":28.8,"y":-580.7}
			vector3(335.94, -579.568, 27.791) 
	
		},

		Pharmacies = {
			--{X: 330.78, Y: -581.048, Z: 28.791} {H: 164.715} {Comment: pharma},
		--	vector3(230.1, -1366.1, 38.5)
			vector3(330.78, -581.048, 27.791)
		},

		Vehicles = {
			{
				--{X: 314.799, Y: -558.462, Z: 28.743} {H: 341.468} {Comment: carsqpawqn},
				Spawner = vector3(314.799, -558.462, 28.743),
				InsideShop = vector3(446.7, -1355.6, 43.5),
				Marker = {type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					--{X: 328.397, Y: -557.153, Z: 28.743} {H: 248.122} {Comment: carspawn},
					--{X: 339.432, Y: -560.369, Z: 28.743} {H: 256.171} {Comment: carspawn2},
					{coords = vector3(328.397, -557.153, 28.743), heading = 227.6, radius = 4.0},
					{coords = vector3(339.432, -560.369, 28.743), heading = 227.6, radius = 4.0}
					--{coords = vector3(309.4, -1442.5, 29.8), heading = 227.6, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				--{X: 342.663, Y: -580.558, Z: 74.166} {H: 317.9} {Comment: helispenner},
				--{X: 352.056, Y: -588.06, Z: 74.166} {H: 231.696} {Comment: helispawn},
				Spawner = vector3(342.663, -580.558, 74.166),
				InsideShop = vector3(305.6, -1419.7, 41.5),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(352.056, -588.06, 74.166), heading = 142.7, radius = 10.0},
					--{coords = vector3(299.5, -1453.2, 46.5), heading = 142.7, radius = 10.0}
				}
			}
		},

		FastTravels = {
			--a finir
			{
		--		From = vector3(340.43, -595.498, 28.791),
		--		To = {coords = vector3(340.99, -584.739, 28.791), heading = 0.0},
		--		Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
		--		From = vector3(338.933, -583.991, 74.166),
		--		To = {coords = vector3(340.43, -595.498, 29.791), heading = 0.0},
		--		Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			}

		--	{
		--		From = vector3(247.3, -1371.5, 23.5),
		--		To = {coords = vector3(333.1, -1434.9, 45.5), heading = 138.6},
		--		Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
		--	},
--
--			{
--				From = vector3(335.5, -1432.0, 45.50),
--				To = {coords = vector3(249.1, -1369.6, 23.5), heading = 0.0},
--				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
--			},
--
--			{
--				From = vector3(234.5, -1373.7, 20.9),
--				To = {coords = vector3(320.9, -1478.6, 28.8), heading = 0.0},
--				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
--			},
--
--			{
--				From = vector3(317.9, -1476.1, 28.9),
--				To = {coords = vector3(238.6, -1368.4, 23.5), heading = 0.0},
--				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
--			}
		},

		FastTravelsPrompt = {
			{
		--		From = vector3(237.4, -1373.8, 26.0),
		--		To = {coords = vector3(251.9, -1363.3, 38.5), heading = 0.0},
		--		Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
		--		Prompt = _U('fast_travel')
			},

			{
		--		From = vector3(256.5, -1357.7, 36.0),
		--		To = {coords = vector3(235.4, -1372.8, 26.3), heading = 0.0},
		---		Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
			--	Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {
	car = {
		ambulance = {
			{model = 'ambulance', price = 5000}
		},

		doctor = {
			{model = 'ambulance', price = 4500}
		},

		chief_doctor = {
			{model = 'ambulance', price = 3000}
		},

		boss = {
			{model = 'ambulance', price = 2000}
		}
	},

	helicopter = {
		ambulance = {},

		doctor = {
			{model = 'buzzard2', price = 150000}
		},

		chief_doctor = {
			{model = 'buzzard2', price = 150000},
			{model = 'seasparrow', price = 300000}
		},

		boss = {
			{model = 'buzzard2', price = 10000},
			{model = 'seasparrow', price = 250000}
		}
	}
}
