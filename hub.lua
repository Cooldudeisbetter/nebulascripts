local datascript = loadstring(game:HttpGet("https://raw.githubusercontent.com/Cooldudeisbetter/nebulascripts/refs/heads/main/scripts/script_data/data.lua"))()
local plr = game:GetService("Players").LocalPlayer
local luna = loadstring(game:HttpGet(datascript.LunaUI, true))()
local NebulaIcons = loadstring(game:HttpGet(datascript.Icons))()

if plr.UserId and table.find(datascript.Banned_UserIds, plr.UserId) then
    plr:Kick("You are banned from using this script.")    
end


local Window = luna:CreateWindow({
    Name = "Nebula Hub",
    Subtitle = "by cooldudeisbetter",

})
