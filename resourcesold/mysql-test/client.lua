
ESX = nil
local     var = 0
Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)

    end
end)

--get value part

RegisterNetEvent("output")
AddEventHandler("output", function(argument)
    TriggerEvent("chatMessage", "[Success]", {0,255,0}, argument)
end) 


--get value part
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------





function menu_main(var)
    local elems = {
        {label = 'Menu 1', value = 'valeurDeVotreMenu'},
        {label = 'Vers Menu Dialog', value = 'dialog'},
        {label = 'Vers Menu List                        '.. var, value = 'list'},
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menuPerso',{
        title    = 'Menu | Type Default',
        align = 'top-left',
        elements = elems
    },
    function(data, menu)
        if data.current.value == 'valeurDeVotreMenu' then -- Test la valeur après appuis sur "Entrée" pour diriger au "bon endroit"

            votreFonction() -- Fonction qui ammène vers votre sous menu ou l'action désiré.
            
            -- Vous pouvez aussi faire votre code directement dedans

        elseif data.current.value == 'dialog' then
            menu_diag() -- Ouvre le menu dialog
        elseif data.current.value == 'list' then
            menu_list(var) -- Ouvre le menu list
        end
    end,
    function(data, menu)
        menu.close()

    end)
end




--[[    Menu Dialog    ]]

function menu_diag(var)
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'menuDiag',{
        title = ('Menu | Type Dialog')
    },
    function(data, menu)
        local var = data.value -- Si nombre, tonumber(data.value) pour vérifier que la valeur soit bien numérique

        if var == nil then -- Test de la valeur. Si nil (null) affichage de l'erreur

            ESX.ShowNotification('Erreur à personnaliser')
        else
            menu.close()
            menu_main(var) -- Ou TriggerEvent('nomEvent', var), ESX.TriggerServerCallback(name, cb, var), etc
 
        end
    end,
    function(data, menu)
        menu.close()
        menu_main(var) -- Permet de retourner au menu principal à l'appuis sur backspace
    end)
end







 Citizen.CreateThread(function(var)
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 288) then -- F1
            menu_main(var)
        end
    end
end)





--RegisterNetEvent("monEventClient")-
--AddEventHandler("monEventClient", function()
--    print("monEventClienta été déclenché")
--end)

--TriggerServerEvent("monEventServer") -- Déclenche un événement coté serveur depuis le client


--[[

		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_gouv', function(account)
			account.addMoney(bankInterests)
		end)
------------------------------------------------------------------------------------------------
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_police', function(account)
			account.removeMoney(bankInterests)
			
		end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mecano', function(account)
			account.removeMoney(bankInterests)
		end)
		--TriggerEvent('esx_addonaccount:getSharedAccount', 'society_realestateagent', function(account)
		--	account.removeMoney(bankInterests)
		--end)
		--TriggerEvent('esx_addonaccount:getSharedAccount', 'society_dock', function(account)
		--	account.removeMoney(bankInterests)
		--end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_foodtruck', function(account)
			account.removeMoney(bankInterests)
		end)
	--	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_gouv', function(account)
	--		account.removeMoney(bankInterests)
	--	end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ambulance', function(account)
			account.removeMoney(bankInterests)
		end)
		--TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cardealer', function(account)
		--	account.removeMoney(bankInterests)
		--end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_taxi', function(account)
			account.removeMoney(bankInterests)
		end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
			account.removeMoney(bankInterests)
		end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_unicorn', function(account)
			account.removeMoney(bankInterests)
		end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_Litlle_Pricks', function(account)
			account.removeMoney(bankInterests)
		end)
		--TriggerEvent('esx_addonaccount:getSharedAccount', 'society_aircraftdealer', function(account)
		--	account.removeMoney(bankInterests)
		--end)
		--TriggerEvent('esx_addonaccount:getSharedAccount', 'society_gouvernor', function(account)
		--	account.removeMoney(bankInterests)
		--end)
		--TriggerEvent('esx_addonaccount:getSharedAccount', 'society_karting', function(account)
		--	account.removeMoney(bankInterests)
		--end)
		--TriggerEvent('esx_addonaccount:getSharedAccount', 'society_thelostmc', function(account)
		--	account.removeMoney(bankInterests)
		--end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_bucheron', function(account)
		--	account.removeMoney(bankInterests)
		end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_tabac', function(account)
			account.removeMoney(bankInterests)
		end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mineur', function(account)
			account.removeMoney(bankInterests)
		end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_brinks', function(account)
			account.removeMoney(bankInterests)
		end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_weazel', function(account)
			account.removeMoney(bankInterests)
		end)
		--TriggerEvent('esx_addonaccount:getSharedAccount', 'society_fueler', function(account)
		--	account.removeMoney(bankInterests)
		--end)
		--TriggerEvent('esx_addonaccount:getSharedAccount', 'society_boatdealer', function(account)
		--	account.removeMoney(bankInterests)
		--end)
		--TriggerEvent('esx_addonaccount:getSharedAccount', 'society_state', function(account)
		--	account.removeMoney(bankInterests)
		--end)
	
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
		--	account.removeMoney(bankInterests)
		end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ferme', function(account)
			account.removeMoney(bankInterests)
		end)
		--TriggerEvent('esx_addonaccount:getSharedAccount', 'society_pompiste', function(account)
		--	account.removeMoney(bankInterests)
		--end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_pecheur', function(account)
			account.removeMoney(bankInterests)
		end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_bahama', function(account)
			account.removeMoney(bankInterests)
		end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_pizza', function(account)
			account.removeMoney(bankInterests)
		end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_journaliste', function(account)
			account.removeMoney(bankInterests)
		end)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_casino', function(account)
			account.removeMoney(bankInterests)
		end)


]]