local beds = {

   -- {X: 354.216, Y: -562.11, Z: 29.718} {H: 346.597} {Comment: 159},
    --{X: 357.649, Y: -563.282, Z: 29.718} {H: 337.067} {Comment: 2},
   -- {X: 361.17, Y: -564.694, Z: 29.718} {H: 340.499} {Comment: 3},
      
    { x = 354.216, y = -562.11, z = 29.718, h = 346.597, taken = false, model = 1631638868 },
    { x = 357.649, y = -563.282, z = 29.718, h = 337.067, taken = false, model = -1091386327 },
    { x = 361.17, y = -564.694, z = 29.718, h = 340.449, taken = false, model = 1631638868 },
--	{ x = 349.62, y = -583.53, z = 43.022, h = -20.0, taken = false, model = -1091386327 },
--	{ x = 344.80, y = -581.12, z = 43.02, h = 80.0, taken = false, model = -1091386327 },
--	{ x = 334.09, y = -578.43, z = 43.01, h = 80.0, taken = false, model = -1091386327 },
--	{ x = 323.64, y = -575.16, z = 43.02, h = -20.0, taken = false, model = -1091386327 },
--	{ x = 326.97, y = -576.229, z = 43.02, h = -20.0, taken = false, model = -1091386327 },
--	{ x = 354.24, y = -592.74, z = 43.11, h = 160.0, taken = false, model = 2117668672 },
--	{ x = 357.34, y = -594.45, z = 43.11, h = 160.0, taken = false, model = 2117668672 },
--	{ x = 350.80, y = -591.72, z = 43.11, h = 160.0, taken = false, model = 2117668672 },
--	{ x = 346.89, y = -591.01, z = 42.58, h = 160.0, taken = false, model = 2117668672 },
}

local bedsTaken = {}
local injuryBasePrice = 100

AddEventHandler('playerDropped', function()
    if bedsTaken[source] ~= nil then
        beds[bedsTaken[source]].taken = false
    end
end)

RegisterServerEvent('mythic_hospital:server:RequestBed')
AddEventHandler('mythic_hospital:server:RequestBed', function()
    for k, v in pairs(beds) do
        if not v.taken then
            v.taken = true
            bedsTaken[source] = k
            TriggerClientEvent('mythic_hospital:client:SendToBed', source, k, v)
            return
        end
    end
    exports['mythic_notify']:DoHudText('type', 'message')
  --  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Il n\'y a pas de lit disponible' })
end)

RegisterServerEvent('mythic_hospital:server:RPRequestBed')
AddEventHandler('mythic_hospital:server:RPRequestBed', function(plyCoords)
    local foundbed = false
    for k, v in pairs(beds) do
        local distance = #(vector3(v.x, v.y, v.z) - plyCoords)
        if distance < 3.0 then
            if not v.taken then
                v.taken = true
                foundbed = true
                TriggerClientEvent('mythic_hospital:client:RPSendToBed', source, k, v)
                return
            else
                TriggerEvent('mythic_chat:server:System', source, 'Ce Lit n\'est pas disponible')
            end
        end
    end

    if not foundbed then
        TriggerEvent('mythic_chat:server:System', source, 'Vous devez étre a coter d\'un lit !')
    end
end)

RegisterServerEvent('mythic_hospital:server:EnteredBed')
AddEventHandler('mythic_hospital:server:EnteredBed', function()
    local src = source
    local injuries = GetCharsInjuries(src)

    local totalBill = injuryBasePrice

    if injuries ~= nil then
        for k, v in pairs(injuries.limbs) do
            if v.isDamaged then
                totalBill = totalBill + (injuryBasePrice * v.severity)
            end
        end

        if injuries.isBleeding > 0 then
            totalBill = totalBill + (injuryBasePrice * injuries.isBleeding)
        end
    end

	-- YOU NEED TO IMPLEMENT YOUR FRAMEWORKS BILLING HERE
	TriggerClientEvent('mythic_hospital:client:FinishServices', src)
end)

RegisterServerEvent('mythic_hospital:server:LeaveBed')
AddEventHandler('mythic_hospital:server:LeaveBed', function(id)
    beds[id].taken = false
end)