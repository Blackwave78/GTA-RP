Config        = {}
Config.Locale = 'fr'

-- Markers
Config.ZonesData = {
  Enable = true,
  EnableBlip = true,
  Type = 1,
  DrawDistance = 100.0,
  Size     = {x = 2.0, y = 2.0, z = 2.0},
  Color  = {r = 100, g = 204, b = 100},
}



Config.StartZoneData = {
  Enable = true,
  Type = 1,
  DrawDistance = 250.0,
  Size     = {x = 2.0, y = 2.0, z = 2.0},
  Color  = {r = 200, g = 0, b = 0}  
}






Config.CheckpointsData = {
  Enable = true,
  EnableBlip = true,
  Type = 6,
  DrawDistance = 500.0,
  Size     = {x = 10.0, y = 10.0, z = 12.0},
  Color  = {r = 0, g = 200, b = 0},
  BlipColor = 69,
  OutTime = 15 * 1000
}

Config.Zones = {
  SoloKey       =   {x = 192.197, y = -919.572, z = 29.692, name = _U('solo_key'),  sprite = 315, color = 2},
  MultiKey      =   {x = 179.261, y = -910.860, z = 29.692, name = _U('multi_key'), sprite = 315, color = 1},

  RegisterSolo  =   {
    SoloListing_one  =   {x = 256.353, y = -1390.096, z = 29.555,  name = _U('solo_listing'), sprite = 315, color = 2},
    SoloListing_two  =   {x = 1662.883, y = -25.811, z = 172.775,  name = _U('solo_listing'), sprite = 315, color = 2},
    SoloListing_three=   {x = 126.062, y = -870.863, z = 30.123,   name = _U('solo_listing'), sprite = 315, color = 2},
    SoloListing_four =   {x = -191.998, y = 1858.789, z = 196.808, name = _U('solo_listing'), sprite = 315, color = 2},
    SoloListing_five =   {x = 1093.270, y = 197.616, z = 79.990,   name = _U('solo_listing'), sprite = 315, color = 2},
    SoloListing_six  =   {x = 965.7685546875, y = 2214.6560058594, z = 49.27564239502, name = _U('solo_listing'), sprite = 315, color = 2},
  },

  RegisterMulti =   {
    MultiListing_one  =   {x = 216.088 , y = -1389.518, z = 29.587,  name = _U('multi_listing'), sprite = 315, color = 1},
    MultiListing_two  =   {x = 1662.727, y = -53.788  , z = 167.329, name = _U('multi_listing'), sprite = 315, color = 1},
    MultiListing_three=   {x = 121.888 , y = -864.174 , z = 30.123,  name = _U('multi_listing'), sprite = 315, color = 1},
    MultiListing_four =   {x = -201.185, y = 1853.182 , z = 196.780, name = _U('multi_listing'), sprite = 315, color = 1},
    MultiListing_five =   {x = 1091.045, y = 194.218, z = 79.990,    name = _U('multi_listing'), sprite = 315, color = 1},
    MultiListing_six =  {x = 967.142578125, y = 2207.8415527344, z = 48.971130371094,    name = _U('multi_listing'), sprite = 315, color = 1},
  }
}


Config.AllowCopsToCollect = false
-- solo params
Config.RequiredCopsSolo = 0
Config.TimeToCollectSoloKey = 1 * 1000
-- multi params
Config.RequiredCopsMulti = 0
Config.TimeToCollectMultiKey = 1 * 1000
Config.MaxLaps = 24

Config.VehicleClass = {'compacts', 'sedans', 'SUV\'s', 'coupes', 'muscle', 'sport classic', 'sport', 'super', 'motorcycle', 'offroad', 'industrial', 'utility', 'vans', 'bicycles', 'boats', 'helicopter', 'plane', 'service', 'emergency', 'military', ''}







-- race
Config.Races = {

	{
    Name            =   'Licence Race',
    Label           =   'race',
	  SoloRegister    =	'SoloListing_one',
    MultiRegister   =   'MultiListing_one',
    StartingBlock   =   {
      {x = 230.564, y = -1391.092, z = 29.500}, {x = 229.257, y = -1393.385, z = 29.500},
      {x = 235.405, y = -1394.969, z = 29.500}, {x = 224.416, y = -1389.508, z = 29.500},
      {x = 240.246, y = -1398.846, z = 29.500}, {x = 229.257, y = -1393.385, z = 29.500},
    },
	Checkpoints     =		{
      {x = 255.139, y = -1400.731, z = 29.537},	
      {x = 271.874, y = -1370.574, z = 30.932},
      {x = 234.907, y = -1345.385, z = 29.542},
      {x = 217.821, y = -1410.520, z = 28.292},
      {x = 178.550, y = -1401.755, z = 27.725},
      {x = 113.160, y = -1365.276, z = 27.725},
      {x = -73.542, y = -1364.335, z = 27.789},
      {x = -355.143, y = -1420.282, z = 27.868},
      {x = -439.148, y = -1417.100, z = 27.704},
      {x = -453.790, y = -1444.726, z = 27.665},
      {x = -463.237, y = -1592.178, z = 37.519},
      {x = -900.647, y = -1986.28, z = 26.109},
      {x = 1225.759, y = -1948.792, z = 38.718},
      {x = 1225.759, y = -1948.792, z = 38.718},
      {x = 1163.603, y = -1841.771, z = 35.679},
      {x = 255.139, y = -1400.731, z = 29.537}
		}
	},




	{
    Name            =   'Little Lake Race',
    Label           =   'race',
    SoloRegister    =   'SoloListing_two',
    MultiRegister   =   'MultiListing_two',
    StartingBlock   =   {
      {x=1670.651,y=-33.005,z=172.774},
      {x=1671.117,y=-40.577,z=172.774},
      {x=1671.562,y=-48.390,z=172.774},
      {x=1673.265,y=-57.384,z=172.774},
    },
    Checkpoints     =   {
      {x=1669.83 , y=-26.422 , z=172.775},
      {x=1653.842, y=47.392  , z=171.418},
      {x=1829.884, y=174.312 , z=170.723},
      {x=1909.378, y=503.860 , z=170.668},
      {x=1988.511, y=955.508 , z=212.055},
      {x=1897.159, y=1309.823, z=151.001},
      {x=1578.417, y=961.265 , z=77.261 },
      {x=1701.498, y=1336.841, z=85.791 },
      {x=2179.104, y=1247.633, z=75.048 },
      {x=2271.261, y=1079.827, z=67.503 },
      {x=2432.844, y=585.725 , z=141.980},
      {x=2200.69 , y=117.609 , z=227.763},
      {x=1759.131, y=-92.326 , z=183.679},
      {x=1669.83 , y=-26.422 , z=172.775},
    }
  },





  {
    Name            =   'Cubes Park Race',
    Label           =   'race',
    SoloRegister    =   'SoloListing_three',
    MultiRegister   =   'MultiListing_three',
    StartingBlock   =   {
      {x=142.100 , y=-917.853, z=29.134}, {x=146.781 , y=-919.538, z=29.070},
      {x=139.493 , y=-924.787 , z=30.049}, {x=144.174 , y=-926.472 , z=29.985},
      {x=136.886 , y=-931.721 , z=30.964}, {x=141.567 , y=-933.406 , z=30.9},
    },
    Checkpoints     =   {
      {x=148.481, y=-907.434 , z=29.275},
      {x=164.882, y=-862.260 , z=29.850},
      {x=223.404, y=-845.187 , z=29.298},
      {x=263.236, y=-902.330 , z=28.007},
      {x=234.266, y=-981.945 , z=28.320},
      {x=154.822, y=-1014.136, z=28.395},
      {x=134.592, y=-945.898 , z=28.784},
      {x=148.481, y=-907.434 , z=29.275},
    }
  },







  {
    Name            =   'Dirty Race',
    Label           =   'race',
    SoloRegister    =   'SoloListing_four',
    MultiRegister   =   'MultiListing_four',
    StartingBlock   =   {
      {x=-197.371 , y=1862.528, z=196.865}, {x=-200.368 , y=1867.48 , z=196.863},
      {x=-203.8793, y=1858.682, z=196.867}, {x=-206.8763, y=1863.634, z=196.865},
      {x=-210.3876, y=1854.836, z=196.869}, {x=-213.3846, y=1859.788, z=196.867},
    },
    Checkpoints     =   {
      {x=-168.925, y=1883.309 , z=197.223},
      {x=-201.474, y=1907.723 , z=194.029},
      {x=-279.963, y=1949.338 , z=162.067},
      {x=-253.262, y=2133.469 , z=132.155},
      {x=-231.356, y=2592.907 , z=61.479},
      {x=-324.427, y=2717.28 , z=67.456},
      {x=-559.525, y=2639.544 , z=44.762},
      {x=-732.536, y=2288.143, z=73.787},
      {x=-622.990, y=1991.52 , z=163.999},
      {x=-168.925, y=1883.309 , z=197.223},
    }
  },



  {
    Name            =   'Circle Race',
    Label           =   'race',
    SoloRegister    =   'SoloListing_five',
    MultiRegister   =   'MultiListing_five',
    StartingBlock   =   {
      {x=1116.208 , y=183.889 , z=81.146}, {x=1109.819 , y=187.924 , z=81.168},
    },
    Checkpoints     =   {
      {x=1095.6445 , y=159.8285 , z=81.092},
      {x=1198.452 , y=80.747 , z=80.847},
      {x=1095.6445 , y=159.8285 , z=81.092},
    }
  },





  {
    Name            =   'Off-road Race',
    Label           =   'race',
    SoloRegister    =   'SoloListing_six',
    MultiRegister   =   'MultiListing_six',
    StartingBlock   =   {
      {x = 960.27783203125, y = 2240.302734375, z = 46.235637664795},{x=956.08868408203 , y=2241.8188476563 , z=45.621662139893},
    },




    Checkpoints     =   {

      {x=973.21362304688 , y=2237.8427734375 , z=48.646362304688},
      {x = 1020.9625854492, y = 2191.0939941406, z = 44.83211517334}, 
      {x=1100.0610351563 , y=2157.1967773438 , z=52.996982574463},
      {x=1160.1639404297 , y=2218.6486816406 , z=51.236557006836},
      {x=1121.7105712891 , y=2231.7556152344 , z=48.236694335938},    
      {x=1058.3801269531 , y=2260.6318359375 , z=44.255886077881},
      {x=987.095703125 ,  y=2262.0935058594 , z=47.57271194458},
      {x=937.76263427734 , y=2291.9685058594 , z=45.395652770996},         
      {x=980.60784912109 , y=2340.9899902344 , z=48.386211395264},                         
      {x=927.41735839844 , y=2366.4675292969 , z=46.165557861328},                                    
      {x=1022.7495117188 , y=2410.9323730469 , z=53.625774383545},                 
      --{x=1100.0610351563 ,  y=2157.1967773438 , z=52.996982574463},
      {x=1131.1032714844, y=2452.7453613281, z=51.670597076416}, 
      {x=1139.9404296875, y=2339.3400878906, z=53.807678222656}, 
      {x=1166.9489746094, y=2285.017578125, z=52.194797515869}, 
      {x=1166.1224365234, y=2378.8637695313, z=57.086273193359}, 
      {x=1148.1094970703, y=2478.8598632813, z=53.365074157715}, 
      {x=1073.5087890625, y=2441.0166015625, z=49.49486541748}, 
      {x=1019.803894043, y=2441.4038085938, z=43.988632202148}, 
      {x=971.72229003906, y=2461.3227539063, z=50.094463348389}, 
      {x=914.85626220703, y=2480.0026855469, z=50.801086425781}, 
      {x=897.94964599609, y=2345.5549316406, z=51.340648651123}, 
      {x=898.55535888672, y=2294.7368164063, z=45.450435638428}, 
      {x=972.51867675781, y=2233.6528320313, z=46.624603271484},                                      
    }
  },
}




