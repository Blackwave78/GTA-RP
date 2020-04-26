local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

ESX = nil
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}
local isDead = false
allacce = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    Wait(3000)
    ESX.TriggerServerCallback('esx_accessories:get', function(allaccereturn) allacce = allaccereturn end)
end)

_menuPool = NativeUI.CreatePool()
Accemenu = NativeUI.CreateMenu("", "~s~MagaAccesoiresin", -18, 50,"shopui_title_highendfashion","shopui_title_highendfashion")

function GenerateMenu()
    _menuPool = NativeUI.CreatePool()
    Accemenu = NativeUI.CreateMenu("", "~s~Accesoire", -18, 50,"shopui_title_highendfashion","shopui_title_highendfashion")
    _menuPool:Add(Accemenu)
    _menuPool:ControlDisablingEnabled(false)
    _menuPool:MouseControlsEnabled(false)
    Addmenuacce(Accemenu)
    _menuPool:RefreshIndex()
end

function OpenAccessoryMenu()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'set_unset_accessory',
                     {
        title = _U('set_unset'),
        align = 'top-left',
        elements = {
            {label = _U('helmet'), value = 'Helmet'},
            {label = _U('ears'), value = 'Ears'},
            {label = _U('mask'), value = 'Mask'},
            {label = _U('glasses'), value = 'Glasses'},
            {label = 'Montres', value = 'Watches'},
            {label = 'Sac', value = 'Bags'},
            {label = 'Bracelet', value = 'Bracelets'},
            {label = 'Chaine', value = 'Chain'}
        }
    }, function(data, menu)
        menu.close()
        SetUnsetAccessory(data.current.value)

    end, function(data, menu) menu.close() end)
end

function SetUnsetAccessory(accessory)
    ESX.TriggerServerCallback('esx_accessories:get', function(hasAccessory, accessorySkin)
        local _accessory = string.lower(accessory)
        if hasAccessory then
            TriggerEvent('skinchanger:getSkin', function(skin)
                local mAccessory = -1
                local mColor = 0
                if _accessory == "mask" then mAccessory = 0 end
                if _accessory == "glasses" then
                    if skin.sex == 1 then
                        mAccessory = 5
                    elseif skin.sex == 0 then
                        mAccessory = 6
                    end
                end
                if skin[_accessory .. '_1'] == mAccessory then
                    mAccessory = accessorySkin[_accessory .. '_1']
                    mColor = accessorySkin[_accessory .. '_2']
                    if _accessory == "helmet" then end
                end
                local accessorySkin = {}
                accessorySkin[_accessory .. '_1'] = mAccessory
                accessorySkin[_accessory .. '_2'] = mColor
                TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
            end)
        else
            ESX.ShowNotification(_U('no_' .. _accessory))
        end

    end, accessory)
end

function OpenMenu(accessory)
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_menu', {
        title = 'Que voulez vous faire ?',
        align = 'top-left',
        elements = {
            {label = 'Acheter un accessoire', value = 'buy'},
            {label = 'Supprimer un accesoire', value = 'del'}
        }
    }, function(data, menu)
        if data.current.value == 'buy' then OpenShopMenu(accessory) end
        if data.current.value == 'del' then OpenDeleteAcc(accessory) end
    end, function(data, menu)
        menu.close()
        CurrentAction = 'shop_menu'
        CurrentActionMsg = _U('press_access')
        CurrentActionData = {}
    end
    )
end

function OpenDeleteAcc(accessory)
    ESX.TriggerServerCallback('esx_accessories:getPlayerAcc', function(dressing)
        local elements = {}
        for i = 1, #dressing, 1 do
            table.insert(elements, {label = i, value = i})
        end
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'supprime_cloth',
                         {
            title = 'Supprimer un accesoire',
            align = 'top-left',
            elements = elements
        }, function(data, menu)
            menu.close()
            TriggerServerEvent('esx_accessories:deleteOutfit', data.current.value, accessory)
            TriggerEvent('skinchanger:getSkin', function(skin)
                accessory = string.lower(accessory)
                table.remove(allacce[accessory], data.current.value)
            end)
            ESX.ShowNotification('Accessoire vendu')
        end, function(data, menu)
            menu.close()

            CurrentAction = 'shop_menu'
            CurrentActionMsg = _U('press_access')
            CurrentActionData = {}
        end)
    end, accessory)
end

function OpenShopMenu(accessory)
    local _accessory = string.lower(accessory)
    local restrict = {}

    restrict = {_accessory .. '_1', _accessory .. '_2'}

    TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)

        menu.close()

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
            title = _U('valid_purchase'),
            align = 'top-left',
            elements = {
                {label = _U('no'), value = 'no'},
                {label = _U('yes', Config.Price), value = 'yes'}
            }
        }, function(data, menu)
            menu.close()
            if data.current.value == 'yes' then
                ESX.TriggerServerCallback('esx_accessories:checkMoney', function(hasEnoughMoney)
                    if hasEnoughMoney then
                        TriggerServerEvent('esx_accessories:pay')
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_accessories:save', skin, accessory)
                            local temp = {}
                            accessory = string.lower(accessory)
                            if #allacce[accessory] < 17 then
                                local item1 = accessory .. '_1'
                                local item2 = accessory .. '_2'
                                temp[item1] = skin[item1]
                                temp[item2] = skin[item2]
                                table.insert(allacce[accessory], temp)
                            end
                        end)
                    else
                        TriggerEvent('esx_skin:getLastSkin', function(skin)
                            TriggerEvent('skinchanger:loadSkin', skin)
                        end)
                        ESX.ShowNotification(_U('not_enough_money'))
                    end
                end)
            end

            if data.current.value == 'no' then
                local player = GetPlayerPed(-1)
                TriggerEvent('esx_skin:getLastSkin',
                             function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
                end)
                if accessory == "Ears" then
                    ClearPedProp(player, 2)
                elseif accessory == "Mask" then
                    SetPedComponentVariation(player, 1, 0, 0, 2)
                elseif accessory == "Helmet" then
                    ClearPedProp(player, 0)
                elseif accessory == "Glasses" then
                    SetPedPropIndex(player, 1, 0, 0, 2)
                end
            end
            CurrentAction = 'shop_menu'
            CurrentActionMsg = _U('press_access')
            CurrentActionData = {}
        end, function(data, menu)
            menu.close()
            CurrentAction = 'shop_menu'
            CurrentActionMsg = _U('press_access')
            CurrentActionData = {}

        end)
    end, function(data, menu)
        menu.close()
        CurrentAction = 'shop_menu'
        CurrentActionMsg = _U('press_access')
        CurrentActionData = {}
    end, restrict)
end

AddEventHandler('playerSpawned', function() isDead = false end)

AddEventHandler('esx:onPlayerDeath', function() isDead = true end)

AddEventHandler('esx_accessories:hasEnteredMarker', function(zone)
    CurrentAction = 'shop_menu'
    CurrentActionMsg = _U('press_access')
    CurrentActionData = {accessory = zone}
end)

AddEventHandler('esx_accessories:hasExitedMarker', function(zone)
    ESX.UI.Menu.CloseAll()
    CurrentAction = nil
end)

-- Create Blips --
Citizen.CreateThread(function()
    for k, v in pairs(Config.ShopsBlips) do
        if v.Pos ~= nil then
            for i = 1, #v.Pos, 1 do
                local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)

                SetBlipSprite(blip, v.Blip.sprite)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, 1.0)
                SetBlipColour(blip, v.Blip.color)
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(_U('shop', _U(string.lower(k))))
                EndTextCommandSetBlipName(blip)
            end
        end
    end
end)

-- Display markers initail
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        local sleep = true
        for k, v in pairs(Config.Zones) do
            for i = 1, #v.Pos, 1 do
                if (GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < Config.DrawDistance) then
                    sleep = false
                    DrawMarker(Config.Type, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
                end
            end
        end
        if sleep then Citizen.Wait(750) end
    end
end)

-- Entrer exit shop
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        local isInMarker = false
        local currentZone = nil
        for k, v in pairs(Config.Zones) do
            for i = 1, #v.Pos, 1 do
                if (GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < Config.Size.x) then
                    isInMarker = true
                    currentZone = k
                end
            end
        end
        if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
            HasAlreadyEnteredMarker = true
            LastZone = currentZone
            TriggerEvent('esx_accessories:hasEnteredMarker', currentZone)
        end
        if not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('esx_accessories:hasExitedMarker', LastZone)
        end
    end
end)

-- Key controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2)
        if CurrentAction ~= nil then
            ESX.ShowHelpNotification(CurrentActionMsg)
            if IsControlJustReleased(0, Keys['E']) and CurrentActionData.accessory then
                OpenMenu(CurrentActionData.accessory)
                CurrentAction = nil
            end
        else
            Citizen.Wait(500)
        end
    end
end)

-- Key controls 2
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        _menuPool:ProcessMenus()
        if IsControlJustReleased(0, Keys['K']) then
            if Accemenu:Visible() then
                Accemenu:Visible(false)
            else
                GenerateMenu()
                Accemenu:Visible(true)
            end
        end
    end
end)

function Addmenuacce(menu)
    if allacce ~= {} then
        local slmask = {}
        local slcasque = {}
        local slmontre = {}
        local sloreil = {}
        local slsac = {}
        local slgla = {}
        local slbra = {}
        local slchain = {}
        slmask[1] = 'aucun'
        for i = 2, #allacce['mask'] + 1, 1 do slmask[i] = i - 1 end
        slcasque[1] = 'aucun'
        for i = 2, #allacce['helmet'] + 1, 1 do slcasque[i] = i - 1 end
        slmontre[1] = 'aucun'
        for i = 2, #allacce['watches'] + 1, 1 do slmontre[i] = i - 1 end

        sloreil[1] = 'aucun'
        for i = 2, #allacce['ears'] + 1, 1 do sloreil[i] = i - 1 end

        slsac[1] = 'aucun'
        for i = 2, #allacce['bags'] + 1, 1 do slsac[i] = i - 1 end

        slgla[1] = 'aucun'
        for i = 2, #allacce['glasses'] + 1, 1 do slgla[i] = i - 1 end

        slbra[1] = 'aucun'
        for i = 2, #allacce['bracelets'] + 1, 1 do slbra[i] = i - 1 end

        slchain[1] = 'aucun'
        for i = 2, #allacce['chain'] + 1, 1 do slchain[i] = i - 1 end

        local mask = NativeUI.CreateListItem('Masque', slmask, 1, '')
        local casque = NativeUI.CreateListItem('Casque / Chapeau', slcasque, 1,
                                               '')
        local montre = NativeUI.CreateListItem('Montre', slmontre, 1, '')
        local oreile = NativeUI.CreateListItem('Oreille', sloreil, 1, '')
        local bag = NativeUI.CreateListItem('Sac', slsac, 1, '')
        local glasse = NativeUI.CreateListItem('Lunette', slgla, 1, '')
        local bracelet = NativeUI.CreateListItem('Bracelet', slbra, 1, '')
        local chain = NativeUI.CreateListItem('Chaine', slchain, 1, '')

        menu:AddItem(mask)
        menu:AddItem(casque)
        menu:AddItem(montre)
        menu:AddItem(oreile)
        menu:AddItem(bag)
        menu:AddItem(glasse)
        menu:AddItem(bracelet)
        menu:AddItem(chain)

        menu.OnListChange = function(sender, item, index)
            if item == mask then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if index == 1 then
                        local reset = {['mask_1'] = 0, ['mask_2'] = 0}
                        TriggerEvent('skinchanger:loadClothes', skin, reset)
                    else
                        TriggerEvent('skinchanger:loadClothes', skin, allacce.mask[index - 1])
                    end
                end)
            end
            if item == bracelet then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if index == 1 then
                        local reset = {
                            ['bracelets_1'] = -1,
                            ['bracelets_2'] = 0
                        }
                        TriggerEvent('skinchanger:loadClothes', skin, reset)
                    else
                        TriggerEvent('skinchanger:loadClothes', skin, allacce.bracelets[index - 1])
                    end
                end)
            end
            if item == casque then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if index == 1 then
                        local reset = {['helmet_1'] = -1, ['helmet_2'] = 0}
                        TriggerEvent('skinchanger:loadClothes', skin, reset)
                    else
                        TriggerEvent('skinchanger:loadClothes', skin, allacce.helmet[index - 1])
                    end
                end)
            end
            if item == montre then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if index == 1 then
                        local reset = {['watches_1'] = -1, ['watches_2'] = 0}
                        TriggerEvent('skinchanger:loadClothes', skin, reset)
                    else
                        TriggerEvent('skinchanger:loadClothes', skin, allacce.watches[index - 1])
                    end
                end)
            end
            if item == oreile then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if index == 1 then
                        local reset = {['ears_1'] = -1, ['ears_2'] = 0}
                        TriggerEvent('skinchanger:loadClothes', skin, reset)
                    else
                        TriggerEvent('skinchanger:loadClothes', skin, allacce.ears[index - 1])
                    end
                end)
            end
            if item == bag then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if index == 1 then
                        local reset = {['bags_1'] = 0, ['bags_2'] = 0}
                        TriggerEvent('skinchanger:loadClothes', skin, reset)
                    else
                        TriggerEvent('skinchanger:loadClothes', skin, allacce.bags[index - 1])
                    end
                end)
            end
            if item == glasse then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if index == 1 then
                        if skin.sex == 0 then
                            local reset = {['glasses_1'] = 0, ['glasses_2'] = 0}
                            TriggerEvent('skinchanger:loadClothes', skin, reset)
                        else
                            local reset = {['glasses_1'] = 5, ['glasses_2'] = 0}
                            TriggerEvent('skinchanger:loadClothes', skin, reset)
                        end
                    else
                        TriggerEvent('skinchanger:loadClothes', skin, allacce.glasses[index - 1])
                    end
                end)
            end
            if item == chain then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    if index == 1 then
                        local reset = {['chain_1'] = -1, ['chain_2'] = 0}
                        TriggerEvent('skinchanger:loadClothes', skin, reset)
                    else
                        TriggerEvent('skinchanger:loadClothes', skin, allacce.chain[index - 1])
                    end
                end)
            end
        end
    end
end
