Config               = {}

Config.DrawDistance  = 100
Config.Size          = { x = 1.5, y = 1.5, z = 0.5 }
Config.Color         = { r = 0, g = 128, b = 255 }
Config.Type          = 1
Config.Locale        = 'fr'

Config.LicenseEnable = false -- only turn this on if you are using esx_license
Config.LicensePrice  = 5000

Config.Zones = {

	GunShop = {
		Legal = true,
		Items = {
			{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000, ammoPrice = 20, AmmoToGive = 100 },
--			{ weapon = 'WEAPON_ADVANCEDRIFLE', price = 100, ammoPrice = 30, AmmoToGive = 50 },
			{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 0, 1000, 4000, nil }, price = 10000, ammoPrice = 20, AmmoToGive = 100 },
			
			{ weapon = 'WEAPON_KNIFE', price = 500},
			{ weapon = 'WEAPON_HAMMER', price = 500},
			{ weapon = 'WEAPON_BAT', price = 500},
			{ weapon = 'WEAPON_GOLFCLUB', price = 500},
			{ weapon = 'WEAPON_CROWBAR', price = 500},

			{ weapon = 'WEAPON_PISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000, ammoPrice = 20, AmmoToGive = 100 },
			{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000, ammoPrice = 20, AmmoToGive = 100 },
			{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 1000, 4000, nil }, price = 10000, ammoPrice = 20, AmmoToGive = 100 },
			{ weapon = 'WEAPON_SMG', components = { 0, 0, 1000, 4000, nil }, price = 10000, ammoPrice = 20, AmmoToGive = 100 },
			{ weapon = 'WEAPON_ASSAULTRIFLE', components = { 0, 0, 1000, 4000, nil }, price = 10000, ammoPrice = 20, AmmoToGive = 100 },
			{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 1000, 4000, nil }, price = 10000, ammoPrice = 20, AmmoToGive = 100 },
			{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 0, 1000, 4000, nil }, price = 10000, ammoPrice = 20, AmmoToGive = 100 },
			{ weapon = 'WEAPON_MG', components = { 0, 0, 1000, 4000, nil }, price = 10000, ammoPrice = 20, AmmoToGive = 100 },
			{ weapon = 'WEAPON_COMBATMG', components = { 0, 0, 1000, 4000, nil }, price = 10000, ammoPrice = 20, AmmoToGive = 100 },
			{ weapon = 'WEAPON_FLASHLIGHT', price = 80},
			{ weapon = 'WEAPON_FLARE', price = 55},
			{ weapon = 'WEAPON_BALL', price = 5}
		
		--[[	{ weapon = 'WEAPON_REMOTESNIPER', price = 500},
			
			{ weapon = 'WEAPON_RPG', price = 500},
			{ weapon = 'WEAPON_PASSENGER_ROCKET', price = 500},
			{ weapon = 'WEAPON_AIRSTRIKE_ROCKET', price = 500},
			{ weapon = 'WEAPON_MINIGUN', price = 500},
			{ weapon = 'WEAPON_STICKYBOMB', price = 500},
			{ weapon = 'WEAPON_FIREEXTINGUISHER', price = 500},
			{ weapon = 'WEAPON_BRIEFCASE', price = 500},
			{ weapon = 'WEAPON_BRIEFCASE_02', price = 500},
			{ weapon = 'WEAPON_VEHICLE_ROCKET', price = 500},
			{ weapon = 'WEAPON_BARBED_WIRE', price = 500},
			{ weapon = 'WEAPON_DROWNING', price = 500},
			{ weapon = 'WEAPON_DROWNING_IN_VEHICLE', price = 500},
			{ weapon = 'WEAPON_BLEEDING', price = 500},
			{ weapon = 'WEAPON_STUNGUN', price = 1500},
			]]
		},
		Locations = {
			vector3(-662.1, -935.3, 20.8),
			vector3(810.2, -2157.3, 28.6),
			vector3(1693.4, 3759.5, 33.7),
			vector3(-330.2, 6083.8, 30.4),
			vector3(252.3, -50.0, 68.9),
			vector3(22.0, -1107.2, 28.8),
			vector3(2567.6, 294.3, 107.7),
			vector3(-1117.5, 2698.6, 17.5),
			vector3(842.4, -1033.4, 27.1)
		}
	},

	BlackWeashop = {
		Legal = false,
		Items = {
			{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000, ammoPrice = 20, AmmoToGive = 20 },
			{ weapon = 'WEAPON_STINGER', price = 500},
			{ weapon = 'WEAPON_SNIPERRIFLE', price = 500},
			{ weapon = 'WEAPON_HEAVYSNIPER', price = 500},
			{ weapon = 'WEAPON_PETROLCAN', price = 500},
			{ weapon = 'WEAPON_NIGHTSTICK', price = 500},
			{ weapon = 'WEAPON_GRENADE', price = 500},
			{ weapon = 'WEAPON_MOLOTOV', price = 500},
			{ weapon = 'WEAPON_BZGAS', price = 500},
			{ weapon = 'WEAPON_GRENADELAUNCHER_SMOKE', price = 500},
			{ weapon = 'WEAPON_GRENADELAUNCHER', price = 500, ammoPrice = 20, AmmoToGive = 100 },
			{ weapon = 'WEAPON_PUMPSHOTGUN', price = 500},
			{ weapon = 'WEAPON_SAWNOFFSHOTGUN', price = 500},
			{ weapon = 'WEAPON_ASSAULTSHOTGUN', price = 500},
			{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 500},
			{ weapon = 'WEAPON_STUNGUN', price = 500},
			{ weapon = 'WEAPON_SNIPERRIFLE', price = 500},
			{ weapon = 'WEAPON_HEAVYSNIPER', price = 500}
		
		},
		Locations = {
			vector3(-1306.2, -394.0, 35.6)
		}
	}
}