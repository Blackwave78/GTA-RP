Config                            = {}
Config.DrawDistance               = 100.0
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = true
Config.Locale                     = 'fr'

Config.Zones = {

	Minefarm = {
		--oldposfortest  => Pos   = {x = 832.52093505859, y = -1981.8747558594, z = 29.300636291504},
		Pos   = {x = 2930.9636230469, y = 2790.4069824219, z = 40.134613037109},
		Size  = {x = 3.5, y = 3.5, z = 1.0},
		Color = {r = 0, g = 255, b = 0},
		Name  = "Récolte de Pierres",
		Type  = 27
	},


	TraitementMine = {
		Pos   = {x = 984.09436035156, y = -1924.0220947266, z = 31.134477615356},
		Size  = {x = 3.5, y = 3.5, z = 1.0},
		Color = {r = 0, g = 255, b = 0},
		Name  = "Traitement des Pierres",
		Type  = 27
	},

--	TraitementJus = {
--		Pos   = {x = 811.337, y = 2179.402, z = 51.388},
--		Size  = {x = 3.5, y = 3.5, z = 2.0},
--		Color = {r = 136, g = 243, b = 216},
--		Name  = "Traitement du Jus de raisin",
--		Type  = 1
--	},
	
	SellFarm = {
		Pos   = {x = -621.85034179688, y = -230.99514770508, z = 38.057052612305},
		Size  = {x = 3.5, y = 3.5, z = 1.0},
		Color = {r = 0, g = 255, b = 0},
		Name  = "Vente des produits",
		Type  = 27
	},

	mineurActions = {
		Pos   = {x = 848.23272705078, y = -1937.6958007813, z = 30.068355560303},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 0, b = 0},
		Name  = "Point d'action",
		Type  = 21
	},
	  
	VehicleSpawner = {
		Pos   = {x = 838.38134765625, y = -1931.7580566406, z = 28.977361679077},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 255, b = 0},
		Name  = "Garage véhicule",
		Type  = 0
	},

	VehicleSpawnPoint = {
		Pos   = {x = 835.62652587891, y = -1945.1214599609, z = 28.999074935913},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Spawn point",
		Type  = -1
	},

	VehicleDeleter = {
		Pos   = {x = 824.05792236328, y = -1917.3870849609, z = 29.314956665039},
		Size  = {x = 3.0, y = 3.0, z = 0.},
		Color = {r = 255, g = 0, b = 0},
		Name  = "Ranger son véhicule",
		Type  = 27
	}

}

