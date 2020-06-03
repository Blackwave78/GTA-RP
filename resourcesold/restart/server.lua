
local text1 = "Penssez a finir ce que vous avez commencé !!!"
local text2 = "Le serveur reboot automatique dans 25 minutes ! A 12h30 / 00h00"
local text3 = "Le serveur reboot automatique dans 20 minutes  ! A 12h30 / 00h00"
local test4 = "Le serveur reboot automatique dans 15 minutes ! A 12h30 / 00h00"
local test5 = "Le serveur reboot automatique dans 5 minutes ! A 12h30 / 00h00 \n Pensez à sauvegarder votre position et vous déconnecté ! merci d'attendre 1/2 min avant ce de reconnecter merci !!!"


RegisterServerEvent("restart:checkreboot")

AddEventHandler('restart:checkreboot', function(var1)
	date_local1 = os.date('%H:%M:%S', os.time())
	local date_local = date_local1


	if date_local == '12:00:00' then
		TriggerClientEvent('chatMessage', -1, "REBOOT - SERVEUR", {0, 0, 0}, text1)

	elseif date_local == '12:05:00' then
		TriggerClientEvent('chatMessage', -1, "REBOOT - SERVEUR", {0, 0, 0}, text2)
			
	elseif date_local == '12:10:00' then
		TriggerClientEvent('chatMessage', -1, "REBOOT - SERVEUR", {0, 0, 0}, text3)

	elseif date_local == '12:15:00' then
		TriggerClientEvent('chatMessage', -1, "REBOOT - SERVEUR", {0, 0, 0}, test4)
		TriggerClientEvent("thundereefect", -1) --thundereffect
		
	elseif date_local == '12:25:00' then
		TriggerClientEvent('chatMessage', -1, "REBOOT - SERVEUR", {0, 0, 0}, test5)
		TriggerClientEvent("snoweffect", -1) --snoweffect


--- 12/30/00

	elseif date_local == '23:30:00' then
		TriggerClientEvent('chatMessage', -1, "REBOOT - SERVEUR", {0, 0, 0}, text1)

	elseif date_local == '23:35:00' then 
		TriggerClientEvent('chatMessage', -1, "REBOOT - SERVEUR", {0, 0, 0}, text2)

	elseif date_local == '23:40:00' then
		TriggerClientEvent('chatMessage', -1, "REBOOT - SERVEUR", {0, 0, 0}, text3)

	elseif date_local == '23:45:00' then
		TriggerClientEvent('chatMessage', -1, "REBOOT - SERVEUR", {0, 0, 0}, text4)
		TriggerClientEvent("thundereefect", -1) --thundereffect

	elseif date_local == '23:55:00' then
		TriggerClientEvent('chatMessage', -1, "REBOOT - SERVEUR", {0, 0, 0}, text5)
		TriggerClientEvent("snoweffect", -1) --snoweffect
-- ELSEIF 00/00/00 THEN REBOOT
	end
end)

function restart_server()
	SetTimeout(1000, function()
		TriggerEvent('restart:checkreboot')
		restart_server()
	end)
end
restart_server()
