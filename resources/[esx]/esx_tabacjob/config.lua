Config                            = {}
Config.DrawDistance               = 100.0
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.Locale                     = 'fr'

Config.Zones = {

	feuilletabFarm = {
		Pos   = {x = 2234.5908203125, y = 5576.369140625, z = 54.056392669678},
		Size  = {x = 3.5, y = 3.5, z = 2.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Récolte de Feuilles",
		Type  = 27
	},


	TraitementVin = {
		Pos   = {x = -1097.0703, y = -2223.896, z = 13.226},
		Size  = {x = 3.5, y = 3.5, z = 2.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Traitement du Tabac",
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
		Pos   = {x = 1219.0184326172, y = -3233.1174316406, z = 5.5287489891052}, 
		Size  = {x = 3.5, y = 3.5, z = 2.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Vente des produits",
		Type  = 27
	},

	tabacActions = {
		Pos   = {x = 2220.8518066406, y = 5614.5888671875, z = 54.717853546143},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Point d'action",
		Type  = 2
	},
	  
	VehicleSpawner = {
		Pos   = {x = 2195.8168945313, y = 5605.2919921875, z = 53.526142120361},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Garage véhicule",
		Type  = 0
	},

	VehicleSpawnPoint = {
		Pos   = {x = 2204.1967773438, y = 5619.6435546875, z = 54.353191375732},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Spawn point",
		Type  = -1
	},

	VehicleDeleter = {
		Pos   = {x = 2190.1838378906, y = 5564.1567382813, z = 53.676666259766},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Ranger son véhicule",
		Type  = 0
	}

}

