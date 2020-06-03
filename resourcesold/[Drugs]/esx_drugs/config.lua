Config              = {}
Config.MarkerType   = 1
Config.DrawDistance = 100.0
Config.ZoneSize     = {x = 2.5, y = 2.5, z = 2.0}
Config.MarkerColor  = {r = 100, g = 204, b = 100}
Config.ShowBlips    = false

Config.RequiredCopsWeed  	= 0
Config.RequiredCopsCoke  	= 0
--------------------------------
--------------------------------
Config.RequiredCopsMeth     = 0
Config.RequiredCopsMethlab  = 0
Config.RequiredCopsAcetone  = 0
Config.RequiredCopsLithium  = 0
--------------------------------
--------------------------------
Config.RequiredCopsCrack    = 0
Config.RequiredCopsKetamine = 0
Config.RequiredCopsEcstasy  = 0
-------------------------------
Config.RequiredCopsBillet   = 0
-------------------------------
Config.RequiredCopsOpium    = 0

Config.TimeToFarm           = 1 * 500 --5
Config.TimeToProcess        = 1 * 500 --5
Config.TimeToSell           = 1 * 500 --5

Config.Locale = 'fr'
 
Config.Zones = {

	WeedField           = {x=1057.68,   	y=-3196.309, 	z=-39.161,     name = _U('weed_field'),         sprite = 496,    color = 2},		
	WeedProcessing      = {x=372.24,  		y=-1791.277, 	z=28.095,   name = _U('weed_processing'),    sprite = 496,    color = 2},
	--WeedDealer          = {x=1110.605, 		y=-464.805,	 	z=66.319,   name = _U('weed_dealer'),        sprite = 500,    color = 2},
	---------------------------------------------------------------------------------------------------------------------------

	--OpiumField      	= {x=1838.24,		y=5035.191,  	z=57.245,	name = _U('opium_field'),		 sprite = 51,	color = 8},		
	--OpiumProcessing 	= {x=-438.544,  	y=-2184.25,  	z=10.522,	name = _U('opium_processing'),	 sprite = 51,	color = 8},		
	--OpiumDealer     	= {x=-1217.199, 	y=-1055.398, 	z=8.412,	name = _U('opium_dealer'),		 sprite = 500,	color = 8},		
	---------------------------------------------------------------------------------------------------------------------------
    CokeField           = {x=1090.571,  	y=-3196.696, 	z=-39.993,	name = _U('coke_field'),         sprite = 501,    color = 1},		
    CokeProcessing      = {x=1459.405,		y=-1930.637,	z=70.805,	name = _U('coke_processing'),    sprite = 478,    color = 1},		
	--CokeDealer          = {x=-1901.375,		y=-586.013,		z=10.871,    name = _U('coke_dealer'),        sprite = 500,    color = 1}, 		
	--------------------------------------------------------------------------------------------------------------------------
	--{X: 1090.571, Y: -3196.696, Z: -38.993} {H: 13.134} {Comment: recol meth},
	MethField           = {x=1003.198,  	y=-3199.675, 	z=-37.993, name = _U('meth_field'),         sprite = 499,    color = 9},	------------
	--MethlabField        = {x=0.0,  			y=0.0,	    	z=0.0,   name = _U('methlab_field'),      sprite = 499,    color = 9},	
	--AcetoneField        = {x=0.0,   		y=0.0,		   	z=0.0,    name = _U('acetone_field'),      sprite = 499,    color = 9},	
	--LithiumField        = {x=0.0,   		y=0.0,   		z=0.,    name = _U('lithium_field'),      sprite = 499,    color = 9},
	--{X: 434.053, Y: 6455.487, Z: 28.75} {H: 325.285} {Comment: methtretment},
	--{X: -21.631, Y: -24.477, Z: 73.245} {H: 156.341} {Comment: methtreatment},
	MethProcessing      = {x=-21.631,  	   	y=-24.447,       	z=72.145,      name = _U('meth_processing'),    sprite = 499,    color = 9},
    --MethDealer          = {x=93.52,     	y=3753.52,   	z=40.77,    name = _U('meth_dealer'),        sprite = 500,    color = 9},	
	---------------------------------------------------------------------------------------------------------------------------
	--CrackField          = {x=1099.826,  	y=-3194.494, 	z=-38.993,	name = _U('crack_field'),		 sprite = 501,	color = 3},		
	--CrackProcessing     = {x=1093.462,  	y=-3197.138, 	z=-38.993,	name = _U('crack_processing'),	 sprite = 478,	color = 3},		
	--CrackDealer         = {x=-603.277,  	y=-1628.447, 	z=27.011,	name = _U('crack_dealer'),		 sprite = 500,	color = 3},		
	---------------------------------------------------------------------------------------------------------------------------
	--KetamineField       = {x=1003.198,  	y=-3199.675, 	z=-37.993,	name = _U('ketamine_field'),	 sprite = 499,	color = 5},		
	--KetamineProcessing  = {x=1010.293,  	y=-3196.814, 	z=-38.993,	name = _U('ketamine_processing'),sprite = 499,	color = 5},	
	--KetamineDealer      = {x=1469.923,  	y=1134.3,  		z=114.323,	name = _U('ketamine_dealer'),	 sprite = 500,	color = 5},		

}