Config                            = {}
Config.DrawDistance               = 100.0
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.Locale                     = 'fr'

Config.Zones = {

    --Minefarm = {
    PetrolFarm = {
        --oldposfortest  => Pos   = {x = 832.52093505859, y = -1981.8747558594, z = 29.300636291504},
        Pos   = {x = 264.00, y = -2995.00, z = 5.00},
        Size  = {x = 3.5, y = 3.5, z = 1.0},
        Color = {r = 0, g = 255, b = 0},
        Name  = "Récolte Du Petrole",
        Type  = 27
    },


    PetrolTransform = {
        Pos   = {x = 2793.00, y = 1707.00, z = 24.00},
        Size  = {x = 3.5, y = 3.5, z = 1.0},
        Color = {r = 0, g = 255, b = 0},
        Name  = "Traitement du petrole",
        Type  = 27
    },

--  TraitementJus = {
--      Pos   = {x = 811.337, y = 2179.402, z = 51.388},
--      Size  = {x = 3.5, y = 3.5, z = 2.0},
--      Color = {r = 136, g = 243, b = 216},
--      Name  = "Traitement du Jus de raisin",
--      Type  = 1
--  },
     
--    SellFarm = {
--        Pos   = {x = -621.85034179688, y = -230.99514770508, z = 38.057052612305},
--        Size  = {x = 3.5, y = 3.5, z = 1.0},
--        Color = {r = 0, g = 255, b = 0},
--        Name  = "Vente des produits",
--        Type  = 27
--    },

    PetrolActions = {
        Pos   = {x = 1384.00, y = -2079.00, z = 51.80},
        Size  = {x = 1.5, y = 1.5, z = 1.0},
        Color = {r = 255, g = 0, b = 0},
        Name  = "Point d'action",
        Type  = 21
    },
      
    VehicleSpawner = {
        Pos   = {x = 1364.0611572266, y = -2074.7412109375, z = 50.998558044434}, 
        Size = {x = 1.5, y = 1.5, z = 1.0},
        Color = {r = 0, g = 255, b = 0},
        Name  = "Garage véhicule",
        Type  = 0
    },

    VehicleSpawnPoint = {
        Pos   = {x = 1358.6267089844, y = -2080.0537109375, z = 51.998519897461}, 
        Size  = {x = 1.5, y = 1.5, z = 1.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Spawn point",
        Type  = -1
    },

    VehicleSpawnPoint2 = {
        Pos   = {x = 1399.71484375, y = -2055.3491210938, z = 51.998519897461}, 
        Size  = {x = 1.5, y = 1.5, z = 1.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Spawn point",
        Type  = -1
    },
    VehicleDeleter = {
        Pos   = {x = 1356.4643554688, y = -2093.5283203125, z = 51.998561859131}, 
        Size  = {x = 3.0, y = 3.0, z = 0.},
        Color = {r = 255, g = 0, b = 0},
        Name  = "Ranger son véhicule",
        Type  = 27
    }

}

