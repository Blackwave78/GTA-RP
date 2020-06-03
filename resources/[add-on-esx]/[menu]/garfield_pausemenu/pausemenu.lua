function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

-- Uncomment if you want add Players Steam or connected players

local id = PlayerId()
local serverID = GetPlayerServerId(PlayerId())
players = {}
for i = 0, 255 do
   if NetworkIsPlayerActive( i ) then
       table.insert( players, i )
   end
end

Citizen.CreateThread(function()
  AddTextEntry('FE_THDR_GTAO', '~f~Bienvenue, vous êtes sur **server name**.')
  AddTextEntry('PM_PANE_LEAVE', '~o~Retourner sur la liste des serveurs.')
  AddTextEntry('PM_PANE_QUIT', '~r~Quitter cette belle ville :c')
  AddTextEntry('PM_SCR_MAP', '~b~Carte de Los Santos')
  AddTextEntry('PM_SCR_GAM', '~r~Prendre l\'avion')
  AddTextEntry('PM_SCR_INF', '~g~Logs')
  AddTextEntry('PM_SCR_SET', '~p~Configuration')
  AddTextEntry('PM_SCR_STA', '~f~Statistiques')
  AddTextEntry('PM_SCR_RPL', '~y~Éditeur ∑')
end)
