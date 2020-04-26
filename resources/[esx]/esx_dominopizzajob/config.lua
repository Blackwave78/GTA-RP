Config                            = {}
Config.DrawDistance               = 100.0

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.MaxInService               = -1
Config.Locale = 'fr'

Config.MissCraft                  = 10 -- %


Config.AuthorizedVehicles = {
    {name = 'speedo',  label = 'Véhicule de Service'},
    {name = 'taco',  label = 'Food Truck'},
    {name = 'faggio2',  label = 'Scooter de Livraison'},
}

Config.Blips = {
    
    Blip = {
      Pos     = {x = -162.62075805664, y = 281.31216430664, z = 93.76383972168}, 
      Sprite  = 354,--52
      Display = 4,
      Scale   = 2.0,
      Colour  = 1,
    },

}

Config.Zones = {

    Cloakrooms = {
        Pos   = {x = -151.56521606445, y = 292.66885375977, z = 97.838409423828},
        Size  = { x = 1.5, y = 1.5, z = 0.5 },
        Color = { r = 255, g = 187, b = 255 },
        Type  = 1,
    },

    Vaults = {
        Pos   = {x = -152.44062805176, y = 286.33615112305, z = 93.76390838623}, 
        Size  = { x = 1.3, y = 1.3, z = 0.5 },
        Color = { r = 30, g = 144, b = 255 },
        Type  = 1,
    },

    Fridge = {
        Pos   = {x = -167.22393798828, y = 285.13470458984, z = 93.76392364502}, 
        Size  = { x = 1.2, y = 1.2, z = 0.5 },
        Color = { r = 248, g = 248, b = 255 },
        Type  = 1,
    },

    Vehicles = {
        Pos          = {x = -144.58016967773, y = 281.61151123047, z = 93.789527893066}, 
        SpawnPoint   = {x = -141.94110107422, y = 275.93197631836, z = 94.454193115234},
        Size         = { x = 1.8, y = 1.8, z = 0.5 },
        Color        = { r = 255, g = 0, b = 129 },
        Type         = 1,
        Heading      = 356.522,
    },

    VehicleDeleters = {
        Pos   = {x = -138.84729003906, y = 278.31530761719, z = 94.434089660645}, 
        Size  = { x = 2.5, y = 2.5, z = 0.5 },
        Color = { r = 255, g = 0, b = 0 },
        Type  = 1,
    },

--[[
    Helicopters = {
        Pos          = { x = 137.177, y = -1278.757, z = 28.371 },
        SpawnPoint   = { x = 138.436, y = -1263.095, z = 28.626 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 23,
        Heading      = 207.43,
    },

    HelicopterDeleters = {
        Pos   = { x = 133.203, y = -1265.573, z = 28.396 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
    },
]]--

    BossActions = {
        Pos   = {x = -147.91209411621, y = 293.49844360352, z = 97.838325500488}, 
        Size  = { x = 1.5, y = 1.5, z = 0.5 },
        Color = { r = 255, g = 0, b = 129 },
        Type  = 1,
    },

-----------------------
-------- SHOPS --------

    Ingredients = {
        Pos   = {x = -174.81925964355, y = 293.48803710938, z = 93.763916015625}, 
        Size  = { x = 1.5, y = 1.5, z = 0.5 },
        Color = { r = 0, g = 255, b = 0 },
        Type  = 1,
        Items = {
            { name = 'flour',         label = _U('flour'),          price = 3 },
            { name = 'levure',        label = _U('levure'),         price = 3 },
            { name = 'saucetomate',   label = _U('saucetomate'),    price = 3 },
            { name = 'chorizo',       label = _U('chorizo'),        price = 3 },
            { name = 'fromage',       label = _U('fromage'),        price = 3 },
            { name = 'mozzarella',    label = _U('mozzarella'),     price = 3 },
            { name = 'lardon',        label = _U('lardon'),         price = 3 },
            { name = 'merguez',       label = _U('merguez'),        price = 3 },
            { name = 'viandehache',   label = _U('viandehache'),    price = 3 },
            { name = 'saucebarbecue', label = _U('saucebarbecue'),  price = 3 },
            { name = 'cremefraiche',  label = _U('cremefraiche'),   price = 3 },
            { name = 'ananas',        label = _U('ananas'),         price = 3 },
            { name = 'origan',        label = _U('origan'),         price = 3 },
            { name = 'olive',         label = _U('olive'),          price = 3 },
            { name = 'salade',        label = _U('salade'),         price = 3 },
            { name = 'tomate',        label = _U('tomate'),   	    price = 3 },
            { name = 'jambon',        label = _U('jambon'),         price = 3 },
            { name = 'vinaigrette',   label = _U('vinaigrette'),    price = 3 }
        },
    },

    Boissons = {
        Pos   = {x = -175.13505554199, y = 295.86721801758, z = 93.763916015625}, 
        Size  = { x = 1.5, y = 1.5, z = 0.5 },
        Color = { r = 238, g = 110, b = 0 },
        Type  = 1,
        Items = {
            { name = 'water',       label = _U('water'),       price = 5 },
            { name = 'coca',        label = _U('coca'),        price = 12 },
            { name = 'fanta',    	label = _U('fanta'),       price = 12 },
            { name = 'sprite',      label = _U('sprite'),      price = 12 },
            { name = 'oasis',       label = _U('oasis'),       price = 12 },
            { name = '7up',         label = _U('7up'),         price = 12 },
            { name = 'orangina',    label = _U('orangina'),    price = 12 },
            { name = 'icetea',      label = _U('icetea'),      price = 12 },
            { name = 'minute_maid', label = _U('minute_maid'), price = 12 },
            { name = 'pepsi',       label = _U('pepsi'),       price = 12 },
            { name = 'tropico',     label = _U('tropico'),     price = 12 },
            { name = 'redbull',     label = _U('redbull'),     price = 20 },
            { name = 'monster',     label = _U('monster'),     price = 20 }
        },
    },

    Dessert = {
        Pos   = {x = -177.41123962402, y = 297.39166259766, z = 93.763916015625}, 
        Size  = { x = 1.5, y = 1.5, z = 0.5 },
        Color = { r = 0, g = 125, b = 36 },
        Type  = 1,
        Items = {
            { name = 'glace',     label = _U('glace'),       price = 7 },
            { name = 'beignet',   label = _U('beignet'),     price = 5 },
            { name = 'tiramisu',  label = _U('tiramisu'),    price = 15 },
            { name = 'yaourt',    label = _U('yaourt'),      price = 5 }
        },
    },

    BoissonsChaudes = {
        Pos   = {x = -179.54824829102, y = 295.67376708984, z = 93.763916015625}, 
        Size  = { x = 1.5, y = 1.5, z = 0.5 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
        Items = {
            { name = 'chocolatchaud',   label = _U('chocolatchaud'),    price = 10 },
            { name = 'café',            label = _U('café'),             price = 10 },
            { name = 'thé',             label = _U('thé'),              price = 10 }
        },
    },


}

-----------------------
----- TELEPORTERS -----

Config.TeleportZones = {
 --[[
  EnterBuilding = {
    Pos       = { x = -608.316, y = -386.541, z = 34.0 },
    Size      = { x = 1.2, y = 1.2, z = 0.2 },
    Color     = { r = 72, g = 0, b = 255 },
    Marker    = 1,
    Hint      = _U('e_to_enter_1'),
    Teleport  = { x = -608.371, y = -382.806, z = 34.0 },
  },

  ExitBuilding = {
    Pos       = { x = -608.371, y = -382.806, z = 34.0 },
    Size      = { x = 1.0, y = 1.0, z = 0.2 },
    Color     = { r = 255, g = 0, b = 217 },
    Marker    = 1,
    Hint      = _U('e_to_exit_1'),
    Teleport  = { x = -608.316, y = -386.541, z = 34.0 },
  },


  EnterHeliport = {
    Pos       = { x = 126.843, y = -729.012, z = 241.201 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_enter_2),
    Teleport  = { x = -65.944, y = -818.589, z =  320.801 }
  },

  ExitHeliport = {
    Pos       = { x = -67.236, y = -821.702, z = 320.401 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_exit_2'),
    Teleport  = { x = 124.164, y = -728.231, z = 241.801 },
  },
]]--
}
