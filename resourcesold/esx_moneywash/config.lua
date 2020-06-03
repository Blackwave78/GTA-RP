Config = {}
Config.Locale = 'fr'

Config.number = '6666'

Config.washrefresh = 60000 * 5 -- Refresh rate to check if money is washed (every 5 minutes is enough)
Config.washminamount = 5000 -- Minimum amount of money for deposit
Config.washtime = 1 -- Not used if washmult != 0, Hours before washing complete
Config.washmult = 0 -- si 0 non utilisé, si 10 cela prendra 1h tous les 10 $ donc pour 100 $ cela prendra 10h (bon réglage est 10000 donc 10h pour 100000 $)
Config.rate = 85 -- Percent given back (0% return 0$, 100% return everything)


Config.position = {
--    { x = 1885.135, y = 3912.506, z = 32.09, h = 180.0 },
    { x = -1161.464, y = -1532.642, z = 3.537, h = 302.761}
    --{X: 1885.135, Y: 3912.506, Z: 33.09} {H: 268.517} {Comment: 1},
    --{ x=0,y=0,z=0,h=0.0 }
}