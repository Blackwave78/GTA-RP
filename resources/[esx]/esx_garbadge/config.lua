Config            = {}
Config.Locale     = 'fr'
Config.debug      = true
Config.debugPrint = '[esx_garbadge]'
 
Config.jobName      = 'Litlle_Pricks'
Config.companyLabel = 'society_Litlle_Pricks'
Config.companyName  = 'Litlle_Pricks'
Config.platePrefix  = 'LPricks'

Config.storageMinGrade = 1
Config.armoryMinGrade  = 2 -- armory and boss car
Config.manageMinGrade  = 3
Config.weeklyMinGrade  = 2

-- native run
Config.itemTime     = 2500
Config.itemDb_name  = 'trash'
Config.itemName     = 'Sac poubelles'
Config.itemAdd      = 1
Config.itemRemove   = 1
Config.itemPrice    = 100
Config.companyRate  = 0.8
Config.gouvRate     = 0.05

-- weekly run
Config.blackTime    = 7500
Config.blackStep    = 5
Config.blackMax     = 0
Config.blackAdd     = 100000
Config.blackRemove  = 100000
Config.blackPrice   = 4000

-- zones
Config.zones = {
  cloakRoom = {
    enable  = true,
    gps     = {x=-429.51473999023, y=-1728.3231201172, z=19.00064457397},
    markerD = {type=27, drawDistance=50.0, size={x=2.0, y=2.0, z=1.5}, color={r=11, g=203, b=159} },
    blipD   = {sprite=569, display=4, scale=1.2, color=52, range=true, name=_U('cloakroom_blip') }
  },
  vehicleSpawner = {
    enable = false,
    gps    = {x=-425.98150634766, y=-1704.2830810547, z=18.153583068848},
    markerD = {type=27, drawDistance=50.0, size={x=1.5, y=1.5, z=1.5}, color={r=11, g=203, b=159} },
    blipD   = {sprite=67, display=4, scale=0.9, color=52, range=true, name=_U('vehicleSpawner_blip') }
  },
  vehicleSpawnPoint = {
    enable = false,
    gps    = {x=-427.24682617188, y=-1694.4006347656, z=19.029067993164},
    markerD = {type=-1, drawDistance=0.0, size={x=3, y=3, z=3}, color={r=0, g=0, b=0}, heading=182 }
  },
  market = {
    enable = false ,
    gps    = {},
    markerD = {type=11, drawDistance=50.0, size={x=1.5, y=1.5, z=1.5}, color={r=204, g=204, b=0} },
    blipD   = {route=1 }
  },
  vehicleDeleter = {
    enable = false,
    gps    = {x=-421.93719482422, y=-1677.8406982422, z=18.153567993164},
    markerD = {type=27, drawDistance=100.0, size={x=3.0, y=3.0, z=3.0}, color={r=255, g=0, b=0} },
    blipD   = {sprite=67, display=4, scale=0.9, color=52, range=true, name=_U('vehicleDeleter_blip') }
  },
  bank = {
    enable = false,
    gps    = {x=254.04, y=225.42, z=101.0},
    markerD = {type=27, drawDistance=50.0, size={x=2.0, y=2.0, z=1.5}, color={r=11, g=203, b=159} },
    blipD   = {sprite=527, display=4, scale=0.9, color=52, range=true, name=_U('bank_blip') }
  },
  northBank = {
    enable = false,
    gps    = {x=-103.74, y=6477.91, z=30.62},
    markerD = {type=27, drawDistance=50.0, size={x=2.0, y=2.0, z=1.5}, color={r=11, g=203, b=159} },
    blipD   = {sprite=527, display=4, scale=0.9, color=52, range=true, name=_U('northBank_blip') }
  },
  decheterie = {
    enable = false,
    gps    = {x=-444.53225708008, y=-1698.9772949219, z=18.153567993164},
    markerD = {type=27, drawDistance=50.0, size={x=2.0, y=2.0, z=1.5}, color={r=11, g=203, b=159} },
    blipD   = {sprite=527, display=4, scale=0.9, color=52, range=true, name=_U('unionDepository_blip') }
  },
}

Config.market = {
  { -- center
      {x = -3248.2229003906, y = 1010.467590332, z = 12.468814849854}, 
      {x = -3051.9035644531, y = 589.69378662109, z = 7.6074843406677}, 
      {x = -2954.6611328125, y = 376.64566040039, z = 15.001963615417}, 
      {x = 1742.6557617188, y = 6408.5361328125, z = 35.131767272949}, 
      {x = 1719.5389404297, y = 4933.2651367188, z = 42.087230682373}, 
      {x = 1967.4122314453, y = 3756.5786132813, z = 32.220832824707}, 
      {x = 1385.8820800781, y = 3601.556640625, z = 34.894840240479}, 
      {x = 535.82092285156, y = 2667.1274414063, z = 42.259220123291}, 
      {x = -1820.3032226563, y = 803.4013671875, z = 138.53773498535}, 
      {x = -546.99945068359, y = 285.75534057617, z = 83.020462036133}, 
      {x = 372.92391967773, y = 351.15875244141, z = 102.80416107178}, 
      {x = 1167.6516113281, y = -316.02563476563, z = 69.341239929199}, 
      {x = -43.092590332031, y = -1759.2886962891, z = 29.491674423218}, 
      {x = 89.107421875, y = -1283.8369140625, z = 29.31770324707}, 
      {x = -713.95648193359, y = -915.56719970703, z = 19.215589523315}, 
      {x = 2543.2368164063, y = 343.10815429688, z = 108.46101379395}

  },
 -- { -- east coast
   -- {x=-2965.91  ,y=390.7833  ,z=14.06 },
   -- {x=-3242.203 ,y=999.7093  ,z=11.84 },
   -- {x=-1819.728 ,y=794.6349  ,z=137.09},
 -- },
 -- { -- west coast
    --{x=2555.058  ,y=380.6407  ,z=107.63},
 -- },
 -- {  -- sandy shore
    --{x=2675.866  ,y=3280.38   ,z=54.25 },
    --{x=549.6006  ,y=2669.001  ,z=41.17 },
    --{x=1165.902  ,y=2711.337  ,z=37.17 },
    --{x=1958.744  ,y=3741.852  ,z=31.35 },
    --{x=1697.708  ,y=4922.295  ,z=41.08 },
  --},
  --{ -- paleto
   -- {x=1728.768  ,y=6417.453  ,z=34.05 }
 -- }
}


--Config.AuthorizedVehicles = {
--
--  {
--    model = 'taxi',
--    label = 'Taxi'
--  }
--
--}

Config.vehicles = {
  truck = {
    label   = 'Fourgon',
    hash    = 'trash'
  },

  bossCar = {
    label   = 'Voiture Commercial',
    hash    = 'Patriot'
  }
}

Config.uniforms = {
  job_wear = {
    male = {
      ['tshirt_1'] = 131, ['tshirt_2'] = 0,
      ['torso_1']  = 50 , ['torso_2']  = 4,
      ['decals_1'] = 0  , ['decals_2'] = 0,
      ['arms']     = 22 ,
      ['pants_1']  = 25 , ['pants_2']  = 0,
      ['shoes_1']  = 51 , ['shoes_2']  = 0,
      ['helmet_1'] = 58 , ['helmet_2'] = 1,
      ['chain_1']  = 0  , ['chain_2']  = 0,
      ['ears_1']   = -1 , ['ears_2']   = 0,
      ['bags_1']   = 0  , ['bags_2']   = 0
    },
    female = {
      ['tshirt_1'] = 161, ['tshirt_2'] = 0,
      ['torso_1']  = 43 , ['torso_2']  = 4,
      ['decals_1'] = 0  , ['decals_2'] = 0,
      ['arms']     = 23 ,
      ['pants_1']  = 6  , ['pants_2']  = 0,
      ['shoes_1']  = 52 , ['shoes_2']  = 0,
      ['helmet_1'] = -1 , ['helmet_2'] = 0,
      ['chain_1']  = 0  , ['chain_2']  = 0,
      ['ears_1']   = -1 , ['ears_2']   = 0,
      ['bags_1']   = 0  , ['bags_2']   = 0
    }
  },
}
