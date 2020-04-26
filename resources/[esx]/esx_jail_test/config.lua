Config              = {}
Config.DrawDistance               = 100.0
Config.JailBlip     = {x = 1854.00, y = 2622.00, z = 45.00}
-- old Config.JailLocation = {x = 1641.64, y = 2571.08, z = 45.56}
Config .JailLocation = {x = 1665.2424316406, y = 2547.7495117188, z = 45.564861297607}

Config.Locale       = 'fr'

Config.Uniforms = {
	prison_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 146, ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 0,   ['pants_1']  = 3,
			['pants_2']  = 7,   ['shoes_1']  = 12,
			['shoes_2']  = 12,  ['chain_1']  = 50,
			['chain_2']  = 0
		},
		female = {
			['tshirt_1'] = 3,   ['tshirt_2'] = 0,
			['torso_1']  = 38,  ['torso_2']  = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 2,   ['pants_1']  = 3,
			['pants_2']  = 15,  ['shoes_1']  = 66,
			['shoes_2']  = 5,   ['chain_1']  = 0,
			['chain_2']  = 2
		}
	}
}

Config.Zones = {
	timeunjail = {
		Pos = { z = 45.6, y = 2544.3, x = 1629.9},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 255, b = 0},
		Name = "",
		Type = 21
	},
}