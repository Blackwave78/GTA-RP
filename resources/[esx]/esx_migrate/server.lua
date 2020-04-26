-- these are all internal variables, there's nothing interesting here
ESX = nil

local NumberCharset = {}
local Charset = {}

local RegisteredPlateTable = {}
local currentExecuting = 0

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('migrate', function(source, args, rawCommand)
	migrateVehicles()
end, true)

function migrateVehicles()
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles', {}, function(result)
		for i=1, #result, 1 do
			Citizen.Wait(0)

			local vehicleID = result[i].id
			local vehicleProps = json.decode(result[i].vehicle)

			migrateVehicle(vehicleProps, vehicleID)
		end

		print('\n\n\n')
		print('esx_migrate: done!')
		print('\n\n\n')
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)
		if currentExecuting > (Config.MaxMigrates / 2) then
			currentExecuting = currentExecuting - 1
		end
	end
end)

function migrateVehicle(vehicleProps, vehicleID)
	while currentExecuting > Config.MaxMigrates do
		Citizen.Wait(2)
	end

	io.write('esx_migrate: migrating . . . ')
	currentExecuting = currentExecuting + 1

	MySQL.Async.execute('UPDATE `owned_vehicles` SET `plate` = @plateNew WHERE `id` = @vehicleID', {
		['@plateNew'] = vehicleProps.plate,
		['@vehicleID'] = vehicleID
	}, function(rowsChanged)
		print('migrating'..vehicleProps.plate)
		currentExecuting = currentExecuting - 1
	end)

end