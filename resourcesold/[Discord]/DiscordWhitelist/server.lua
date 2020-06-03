----------------------------------------
--- Discord Whitelist, Made by FAXES ---
----------------------------------------

--- Config ---
notWhitelisted = "Vous n'étes pas authorisé a rejoindre ce serveur, vous n'étes pas sur la Whitelist 🖖." -- Message displayed when they are not whitelist with the role
noDiscord = "Vous devez avoir discord d'ouvert ..." -- Message displayed when discord is not found

roles = { -- Role nickname(s) needed to pass the whitelist
    "WHITELISTE",
   -- "Role2",
    --"Role3",
}


--- Code ---

AddEventHandler("playerConnecting", function(name, setCallback, deferrals)
    local src = source
    deferrals.defer()
    deferrals.update("Checking Permissions")

    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifierDiscord = v
        end
    end

    if identifierDiscord then
        for i = 1, #roles do
            if exports.discord_perms:IsRolePresent(src, roles[i]) then
                deferrals.done()
            else
                deferrals.done(notWhitelisted)
            end
        end
    else
        deferrals.done(noDiscord)
    end
end) 