Config                            = {}
Config.DrawDistance               = 100.0
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.Locale                     = 'fr'

Config.Zones = {

	blefarm = { ---ok
		Pos   = {x = 2662.6762695313, y = 4547.0590820313, z = 39.601595184326},
		Size  = {x = 3.5, y = 3.5, z = 2.0},
		Color = {r = 255, g = 201, b = 0},
		Name  = "Récolte de Feuilles",
		Type  = 27
	},


	TraitementBle = { ---ok
		Pos   = {x = 580.92352294922, y = -2806.0930175781, z = 5.719289932251},
		--oldPos   = {x = 580.92352294922, y = -2806.0930175781, z = 4.929289932251},
		Size  = {x = 3.5, y = 3.5, z = 2.0},
		Color = {r = 255, g = 201, b = 0},
		Name  = "Traitement du blé",
		Type  = 27
	},

--	TraitementJus = {
--		Pos   = {x = 811.337, y = 2179.402, z = 51.388},
--		Size  = {x = 3.5, y = 3.5, z = 2.0},
--		Color = {r = 136, g = 243, b = 216},
--		Name  = "Traitement du Jus de raisin",
--		Type  = 1
--	},
	
	SellFarm = { --ok
		Pos   = {x = -40.258697509766, y = -1747.4923095703, z = 28.284219741821}, --for test 
		Size  = {x = 3.5, y = 3.5, z = 2.0},
		Color = {r = 255, g = 201, b = 0},
		Name  = "Vente des produits",
		Type  = 27
	},
	
	FermeActions = { ---ok
	--tabacActions = {
		Pos   = {x = 2426.08984375, y = 4971.0932617188, z = 45.93516708374}, 
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 201, b = 0},
		Name  = "Point d'action",
		Type  = 22
	},
	  
	VehicleSpawner = { --ok
		Pos   = {x = 2414.3576660156, y = 4991.5078125, z = 46.218807220459}, 
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 201, b = 0},
		Name  = "Garage véhicule",
		Type  = 20
	},

	VehicleSpawnPoint = { --ok
		Pos   = {x = 2406.826171875, y = 4983.875, z = 46.089908599854},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 201, b = 0},
		Name  = "Spawn point",
		Type  = -1
	},

	VehicleDeleter = {  --ok
		Pos   = {x = 2407.5, y = 4996.2075195313, z = 46.581645965576},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 255, g = 201, b = 0},
		Name  = "Ranger son véhicule",
		Type  = 20
	}

}

