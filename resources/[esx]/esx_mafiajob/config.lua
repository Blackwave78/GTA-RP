Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale = 'fr'

Config.MafiaStations = {

  Mafia = {

    Blip = {
      Pos     = {x = 1514.4807128906, y = 6335.03515625, z = 23.093391418457}, 
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_NIGHTSTICK',       price = 4500 },
      { name = 'WEAPON_COMBATPISTOL',     price = 10 },
      { name = 'WEAPON_ASSAULTSMG',       price = 1500 },
      { name = 'WEAPON_ASSAULTRIFLE',     price = 10 },
      { name = 'WEAPON_PUMPSHOTGUN',      price = 10 },
      { name = 'WEAPON_STUNGUN',          price = 5000 },
      { name = 'WEAPON_FLASHLIGHT',       price = 800 },
      { name = 'WEAPON_FIREEXTINGUISHER', price = 1200 },
      { name = 'WEAPON_FLAREGUN',         price = 6000 },
      { name = 'GADGET_PARACHUTE',        price = 3000 },
      { name = 'WEAPON_STICKYBOMB',       price = 12000 },
      { name = 'WEAPON_SNIPERRIFLE',      price = 22000 },
      { name = 'WEAPON_FIREWORK',         price = 30000 },
      { name = 'WEAPON_GRENADE',          price = 1800 },
      { name = 'WEAPON_BZGAS',            price = 1200 },
      { name = 'WEAPON_SMOKEGRENADE',     price = 1000 },
      { name = 'WEAPON_APPISTOL',         price = 70000 },
      { name = 'WEAPON_CARBINERIFLE',     price = 11000 },
      { name = 'WEAPON_HEAVYSNIPER',      price = 20000 },
    },

	  AuthorizedVehicles = {
		  { name = 'schafter5',  label = 'Schafter Blindée' },
		  { name = 'sandking',   label = '4X4' },
		  { name = 'mule3',      label = 'Camion de Transport' },
		  { name = 'guardian',   label = 'Grand 4x4' },
		  { name = 'burrito3',   label = 'Fourgonnette' },
		  { name = 'mesa',       label = 'Tout-Terrain' },
	  },

    Cloakrooms = {
      {x = 1509.9196777344, y = 6326.5336914063, z = 23.607110977173}, --
    },

    Armories = {
      {x = 1505.1492919922, y = 6325.4541015625, z = 23.08250617981}, -- 
    },

    Vehicles = {
      {
        Spawner    = {x = 1532.0270996094, y = 6340.6743164063, z = 23.168027877808}, --
        SpawnPoint = {x = 1539.0598144531, y = 6336.7763671875, z = 23.073877334595},  --
        Heading    = 90.0,
      }
    },

    Helicopters = {
      {
        Spawner    = {x = 1516.9161376953, y = 6348.009765625, z = 22.922647476196},-- 

        SpawnPoint = {x = 1518.7515869141, y = 6340.9467773438, z = 22.063016891479},-- 
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      {x = 1541.5550537109, y = 6335.4130859375, z = 23.075458526611},  --car
      {x = 1516.4959716797, y = 6357.2626953125, z = 23.176843643188},   --heli
    },

    BossActions = {
      {x = 1522.4468994141, y = 6329.2641601563, z = 23.606866836548},
    },

  },

}