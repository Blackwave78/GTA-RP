----------------------------------------------------------------------
----------------------- Developped by AlphaKush ----------------------
----------------------------------------------------------------------

Config              = {}
Config.DrawDistance = 100.0
Config.MarkerColor  = {r = 120, g = 120, b = 240}
Config.EnableSocietyOwnedVehicles = false -- à tester
Config.EnablePlayerManagement     = true
Config.MaxInService               = -1
Config.Locale = 'fr'

Config.Zones = {

	CloakRoom = { --Vestaire privé président
		--Pos   = {x = 126.43100738525, y = -729.10052490234, z = 241.15190124512},
		Pos   = {x = -78.195304870605, y = -811.05993652344, z = 243.38598632813},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = 1
	},

	CloakRoom2 = { --Vestaire garde du corps
		Pos   = {x = -77.30256652832, y = -809.36346435547, z = 243.38598632813},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = 1
	},

	OfficeEnter = { --entré du batiement
		Pos   = {x = -429.0690612793, y = 1110.7834472656, z = 326.69631958008},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = 1
	},

	OfficeExit = { -- sorti du batiment
		--Pos   = {x = -486.63452148438, y = -335.03411865234, z = 90.007614135742},
		Pos   = {x = -75.69, y = -827.08, z = 242.43},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 91, b = 0},
		Type  = 1
	},

	OfficeInside = { -- spawn interieur batiment
			--Pos   = {x = 135.32885742188, y = -764.09942626953, z = 241.15211486816},
		Pos   = {x = -75.51, y = -823.90, z = 242.43},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},

	OfficeOutside = { --spawn exterieur batiment
		Pos   = {x = -428.12902832031, y = 1115.4178466797, z = 325.76840209961},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},

	OfficeActions = { -- Marker action boss
		--Pos   = {x = 156.23593139648, y = -740.03515625, z = 241.1519317624},
		Pos   = {x = -83.09139251709, y = -803.17999267578, z = 243.39022827148},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = 1
	},

	--- Garage ----
--old keep for test
--	GarageEnter = { -- entrée garage
--		Pos   = {x = -467.5237121582, y = 1128.8880615234, z = 324.85531616211},
--		Size  = {x = 1.5, y = 1.5, z = 1.0},
--		Color = {r = 0, g = 204, b = 3},
--		Type  = 1
--	},


	GarageInside = { -- spawn interieur garage
		Pos   = {x = 234.87281799316, y = -1003.8368530273, z = -99.999954223633},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = -1
	},

	GarageExit = { -- exit le garage ascensseur
		Pos   = {x = 240.86296081543, y = -1004.7778930664, z = -99.999969482422},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 91, b = 0},
		Type  = 1
	},

	GarageOutside = { -- spawn exterieur du garage
	--POS = entre garage
		Pos   = {x = -460.72052001953, y = 1127.3813476563, z = 324.85491943359},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = -1
	},

	VehicleSpawner = { -- Menua coter du gouv pour les véhicules
		Pos   = {x = -467.5237121582, y = 1128.8880615234, z = 324.85531616211},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 242, g = 255, b = 0},
		Type  = 1
	},
--old keep for test
--	VehicleSpawner = { -- Menu dans le garage pour les véhicules
--		Pos   = {x = 233.05233764648, y = -977.39697265625, z = -99.999954223633},
--		Size  = {x = 1.5, y = 1.5, z = 1.0},
--		Color = {r = 242, g = 255, b = 0},
--		Type  = 1
--	},

	VehicleSpawnPoint = { --Spawn du véhicule dans le garage
		Pos   = {x = -410.26104736328, y = 1063.0599365234, z = 323.53033447266},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = -1
	},

	VehicleSpawnExterior = { --Spawn devant l'observatoir à la sorti du garage
			Pos = {x = -413.34255981445, y = 1177.6545410156, z = 325.64166259766},
			Size  = {x = 1.5, y = 1.5, z = 1.0},
			Color = {r = 0, g = 204, b = 3},
			Type  = -1,
			Heading = 250.0
	},

	GarageExitWithVehicle = { -- Marker pour sortir du garage avec la voiture
			Pos = {x = 227.85629272461, y = -1003.4248657227, z = -99.999954223633},
			Size  = {x = 1.5, y = 1.5, z = 1.0},
			Color = {r = 204, g = 91, b = 0},
			Type  = 1
	},

	VehicleDeleter = { -- Marker pour ranger la voiture
		Pos   = {x = -420.76205444336, y = 1062.7672119141, z = 323.46441650391},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 0, b = 0},
		Type  = 1
	},

	------------ TP hélico -----------
	--HelicoEnter = { -- entrée helico
	--	Pos   = {x = -459.17309570313, y = -338.62091064453, z = 90.007537841797},
	--	Size  = {x = 1.5, y = 1.5, z = 1.0},
	--	Color = {r = 0, g = 204, b = 3},
	--	Type  = 1
	--},

	--HelicoInside = { -- spawn interieur place helico
	--	Pos   = {x = -499.70416259766, y = -322.44952392578, z = 72.168121337891},
	--	Size  = {x = 1.5, y = 1.5, z = 1.0},
	--	Color = {r = 0, g = 204, b = 3},
	--	Type  = -1
	--},

	--HelicoExit = { -- exit helico
	--	Pos   = {x = -499.54034423828, y = -324.3981628418, z = 72.168121337891},
	--	Size  = {x = 1.5, y = 1.5, z = 1.0},
	--	Color = {r = 204, g = 91, b = 0},
	--	Type  = 1
	--},

	--HelicoOutside = { -- spawn interieur batiment president
	--	Pos   = {x = -461.71112060547, y = -338.32485961914, z = 90.007621765137},
	--	Size  = {x = 1.5, y = 1.5, z = 1.0},
	--	Color = {r = 0, g = 204, b = 3},
	--	Type  = -1
	--},

	HelicoSpawner = { -- Menu pour spawn l'hélico
		Pos   = {x = -456.78277587891, y = 1104.8441162109, z = 332.53326416016},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 242, g = 255, b = 0},
		Type  = 1
	},

	HelicoSpawnPoint = { --Spawn de l'hélico sur la plateforme
		Pos   = {x = -447.78729248047, y = 1106.2475585938, z = 332.53167724609}, --Heading = 291.4347
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = -1
	},

	HelicoDeleter = { -- Marker pour ranger l'hélico
		Pos   = {x = -413.80212402344, y = 1097.7004394531, z = 332.53402709961},
		Size  = {x = 6.0, y = 6.0, z = 1.0},
		Color = {r = 204, g = 0, b = 0},
		Type  = 1
	},
}
