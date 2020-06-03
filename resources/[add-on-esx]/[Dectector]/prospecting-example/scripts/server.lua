ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local locations = {
    {x = -1697.073, y = -994.132, z = 6.524, data = {
        item = "Bones",
    }},
    {x = -1682.353, y = -969.402, z = 7.604, data = {
        item = "Bones",
    }},
    {x = -1708.991, y = -960.25, z = 7.154, data = {
        item = "Bones",
    }},
    {x = -1708.991, y = -960.25, z = 7.154, data = {
        item = "Bones",
    }},
    {x = -1731.784, y = -961.766, z = 6.852, data = {
        item = "Bones",
    }},
    {x = -1777.967, y = -986.449, z = 3.536, data = {
        item = "Bones",
    }},
    {x = -1750.393, y = -971.303, z = 6.303, data = {
        item = "Bones",
    }},
    {x = -1741.394, y = -968.225, z = 6.596, data = {
        item = "Bones",
    }},
    {x = -1730.67, y = -944.735, z = 7.749, data = {
        item = "Bones",
    }},
    {x = -1738.261, y = -924.052, z = 7.719, data = {
        item = "Bones",
    }},
    {x = -1757.191, y = -913.522, z = 7.654, data = {
        item = "Bones",
    }},
    {x = -1781.077, y = -902.735, z = 6.192, data = {
        item = "Bones",
    }},
    {x = -1768.637, y = -875.008, z = 7.7, data = {
        item = "Bones",
    }},
    {x = -1759.906, y = -863.269, z = 7.718, data = {
        item = "Bones",
    }},
    {x = -1724.484, y = -852.274, z = 8.652, data = {
        item = "Bones",
    }},
    {x = -1713.884, y = -826.324, z = 9.166, data = {
        item = "Bones",
    }},
    {x = -1720.709, y = -804.951, z = 9.46, data = {
        item = "Bones",
    }},
    {x = -1746.84, y = -807.729, z = 8.953, data = {
        item = "Bones",
    }},
    {x = -1781.854, y = -815.981, z = 8.062, data = {
        item = "Bones",
    }},
    {x = -1805.753, y = -831.492, z = 7.259, data = {
        item = "Bones",
    }},
    {x = -1859.284, y = -762.122, z = 7.27, data = {
        item = "Bones",
    }},
    {x = -1844.213, y = -737.721, z = 8.758, data = {
        item = "Bones",
    }},
    {x = -1825.919, y = -713.559, z = 9.442, data = {
        item = "Bones",
    }},
    {x = -1805.029, y = -691.723, z = 10.025, data = {
        item = "Bones",
    }},
    {x = -1849.61, y = -700.693, z = 9.395, data = {
        item = "Bones",
    }},
    {x = -1858.158, y = -708.256, z = 9.063, data = {
        item = "Bones",
    }},
    {x = -1875.937, y = -724.09, z = 7.977, data = {
        item = "Bones",
    }},
    {x = -1913.646, y = -757.989, z = 3.398, data = {
        item = "Bones",
    }},
    {x = -1922.012, y = -741.846, z = 3.522, data = {
        item = "Bones",
    }},
    {x = -1900.072, y = -712.293, z = 7.114, data = {
        item = "Bones",
    }},
    {x = -1899.811, y = -706.725, z = 7.324, data = {
        item = "Bones",
    }},
    {x = -1904.353, y = -693.047, z = 8.264, data = {
        item = "Bones",
    }},
    {x = -1882.106, y = -651.142, z = 10.671, data = {
        item = "Bones",
    }},
    {x = -1865.883, y = -644.969, z = 11.116, data = {
        item = "Bones",
    }},
    {x = -1873.142, y = -640.252, z = 11.253, data = {
        item = "Bones",
    }},
    {x = -1926.797, y = -644.249, z = 10.498, data = {
        item = "Bones",
    }},
    {x = -1980.359, y = -646.187, z = 4.711, data = {
        item = "Bones",
    }},
    {x = -1989.591, y = -646.154, z = 4.09, data = {
        item = "Bones",
    }},
    {x = -1975.599, y = -642.56, z = 5.407, data = {
        item = "Bones",
    }},
    {x = -2025.123, y = -638.943, z = 3.041, data = {
        item = "Bones",
    }},
    {x = -2010.955, y = -613.137, z = 4.681, data = {
        item = "Bones",
    }},
    {x = -2005.859, y = -562.086, z = 11.111, data = {
        item = "Bones",
    }},
    {x = -1999.712, y = -552.65, z = 11.726, data = {
        item = "Bones",
    }},
    {x = -2021.811, y = -522.021, z = 11.405, data = {
        item = "Bones",
    }},
    {x = -2081.43, y = -577.427, z = 3.065, data = {
        item = "Bones",
    }},
    {x = -2093.783, y = -522.182, z = 4.946, data = {
        item = "Bones",
    }},
    {x = -2075.105, y = -471.182, z = 10.082, data = {
        item = "Bones",
    }},
    {x = -2086.544, y = -461.209, z = 9.201, data = {
        item = "Bones",
    }},
    {x = -2101.43, y = -464.555, z = 7.109, data = {
        item = "Bones",
    }},
    {x = -2089.959, y = -426.003, z = 9.011, data = {
        item = "Bones",
    }},
    {x = -2159.18, y = -467.564, z = 3.038, data = {
        item = "Bones",
    }},
        
--[[
    {x = 1548.082, y = 6633.096, z = 2.377085, data = {
        item = "Nuts and Bolts",
    }},
    {x = 1504.235, y = 6579.784, z = 4.365892, data = {
        item = "a Golden Ring",
        valuable = true,
    }},
    {x = 1580.016, y = 6547.394, z = 15.96557, data = {
        item = "Dragon Scales",
        valuable = true,
    }},
    {x = 1634.586, y = 6596.688, z = 22.55633, data = {
        item = "Scrap Metal",
    }},
    ]]
}

local item_pool = {
    {item = "Bones", valuable = false},
    {item = "Nuts and Bolts", valuable = false},
    {item = "a Golden Ring", valuable = true},
    {item = "Dragon Scales", valuable = true},
    {item = "Scrap Metal", valuable = false},
}

-- Area to create targets within, matches the client side blips
local base_location = vector3(1580.9, 6592.204, 13.84828)
local area_size = 100.0

-- Choose a random item from the item_pool list
function GetNewRandomItem()
    local item = item_pool[math.random(#item_pool)]
    return {item = item.item, valuable = item.valuable}
end

-- Make a random location within the area
function GetNewRandomLocation()
    local offsetX = math.random(-area_size, area_size)
    local offsetY = math.random(-area_size, area_size)
    local pos = vector3(offsetX, offsetY, 0.0)
    if #(pos) > area_size then
        -- It's not within the circle, generate a new one instead
        return GetNewRandomLocation()
    end
    return base_location + pos
end

-- Generate a new target location
function GenerateNewTarget()
    local newPos = GetNewRandomLocation()
    local newData = GetNewRandomItem()
    Prospecting.AddTarget(newPos.x, newPos.y, newPos.z, newData)
end
------------------------------------------------------------------------------
--RegisterServerEvent("prospecting-example:activateProspecting")
--AddEventHandler("prospecting-example:activateProspecting", function()
--    local player = source
--    Prospecting.StartProspecting(player)
--end)


ESX.RegisterUsableItem('detector', function(source)  
	--local _source = source
	--local xPlayer = ESX.GetPlayerFromId(source)
    local player = source
    Prospecting.StartProspecting(player) --start la recherche
    --xPlayer.addInventoryItem('detector', 1)
    TriggerClientEvent('prosp:prospect', source)
end)





------------------------------------------------------------------------------
CreateThread(function()
    -- Default difficulty
    Prospecting.SetDifficulty(1.0)

    -- Add a list of targets
    -- Each target needs an x, y, z and data entry
    Prospecting.AddTargets(locations)

    -- Generate 10 random extra targets
    for n = 0, 10 do
        GenerateNewTarget()
    end

    -- The player collected something
    Prospecting.SetHandler(function(player, data, x, y, z)
        -- Check if the item is valuable, which is a part of the data we pass when creating it!
        if data.valuable then
            TriggerClientEvent("chatMessage", player, "You found " .. data.item .. " worth a lot of money!")
            local _source = player
         --   TriggerClientEvent('esx:showNotification', _source, 'sale_in_prog')
	        recupobj(_source)
        else
            TriggerClientEvent("chatMessage", player, "You found nothing!")
        end
        -- Every time a
        GenerateNewTarget()
    end)

    -- The player started prospecting
    Prospecting.OnStart(function(player)
        TriggerClientEvent("chatMessage", player, "Started prospecting")
    end)

    -- The player stopped prospecting
    -- time in milliseconds
    Prospecting.OnStop(function(player, time)
        TriggerClientEvent("chatMessage", player, "Stopped prospecting")
        TriggerClientEvent('prosp:prospectend', player)
      --  TriggerClientEvent('prosp:prospectend', player)
    end)
end)




 function recupobj(source)

--	-if CopsConnected < Config.RequiredCopsOpium then
--		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
--		return
--	end

--	SetTimeout(Config.TimeToSell, function()

--		if PlayersSellingOpium[source] == true then

			local _source = source
  			local Player = ESX.GetPlayerFromId(_source)

			local poochQuantity = Player.getInventoryItem('opium_pooch').count

			if poochQuantity == 100 then
				TriggerClientEvent('esx:showNotification', source, 'no_pouches_sale')
			else
				Player.addInventoryItem('opium_pooch', 1)
			--	if CopsConnected == 0 then
			--		xPlayer.addAccountMoney('black_money', 20)
			--		TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
			--	elseif CopsConnected == 1 then
			--		xPlayer.addAccountMoney('black_money', 34)
			--		TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
			--	elseif CopsConnected == 2 then
			--		xPlayer.addAccountMoney('black_money', 47)
			--		TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
			--	elseif CopsConnected == 3 then
			--		xPlayer.addAccountMoney('black_money', 56)
			--		TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
			--	elseif CopsConnected == 4 then
			--		xPlayer.addAccountMoney('black_money', 67)
			--		TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
			--	elseif CopsConnected >= 5 then
			--		xPlayer.addAccountMoney('black_money', 70)
			--		TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
			end
				
          --  recupobj(source)
			--end

	--	end
--	end)
end