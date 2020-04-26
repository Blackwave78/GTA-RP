Config = {}

-- specifies how many vehicles to migrate at the same time. A high value will cause deadlocks on the database, but will process faster, set to a decent value depending on the hardware
Config.MaxMigrates = 2