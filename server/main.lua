-- Simple functions to convert the oweners and developers list to a string (Please do not edit above the line unless you know what you are doing)
local function escapeQuotes(s)
  if string.find(s, '[,"]') then
    s = '"' .. string.gsub(s, '"', '""') .. '"'
  end
  return s
end

local function tblCompress(tbl)
    local s = ""
    for _, p in ipairs(tbl) do
        s = s .. "," .. escapeQuotes(p)
    end
    return string.sub(s, 2)
end
------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    if Config.ShowWebsite and Config.Website ~= "" or nil then
        SetConvarServerInfo("Website: ", Config.Website)
    elseif Config.ShowDiscord and Config.DiscordInvite ~= "" or nil then
        SetConvarServerInfo("Discord: ", Config.DiscordInvite)
    elseif Config.ShowTebex and Config.TebexLink ~= "" or nil then
        SetConvarServerInfo("Store: ", Config.TebexLink)
    elseif Config.ShowSteam and Config.SteamRequired ~= "" or nil then
        SetConvarServerInfo("Steam Needed: ", Config.SteamRequired)
    elseif Config.ShowMic and Config.MicRequired ~= "" or nil then
        SetConvarServerInfo("Mic Required: ", Config.MicRequired)
    end
    
    if Config.ShowDevs  then
        SetConvarServerInfo("Developers: ", tblCompress(Config.Developers))
    elseif Config.ShowOwners then
        SetConvarServerInfo("Owners: ", tblCompress(Config.Owners))
    end

    if Config.ShowCustomInfo then
        for k, v in pairs(Config.CustomInfo) do
            SetConvarServerInfo(k, v)
        end
    end
end)