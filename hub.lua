local data = {
    WindUI = "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua",
    Banned_UserIds = {},
    LunaUI = "https://raw.nebulasoftworks.xyz/luna",
}

local plr = game:GetService("Players").LocalPlayer
local luna = loadstring(game:HttpGet(data.LunaUI, true))()

if plr.UserId and table.find(data.Banned_UserIds, plr.UserId) then
    plr:Kick("You are banned from using this script.")
end

local function notify(msg: string, title: string)
    luna:Notification({
        Title = title,
        Content = msg
    })
end

local Window = luna:CreateWindow({
    Name = "Spectra Hub",
    Subtitle = "by cooldudeisbetter",
    LoadingEnabled = true,
    LoadingTitle = "Loading Spectra Hub",
    LoadingDesc = "Welcome to Spectra Hub, please wait while we load everything up for you.",
    ConfigSettings = {
        RootFolder = nil,
        ConfigFolder = "Spectra Hub",
    },
    KeySystem = false
})

Window:CreateHomeTab({
    SupportedExecutors = {"Real", "Velocity", "madium", "Yub-X"},
    DiscordInvite = "0000"
})

local tabs = {
    ["Nebula_Scripts"] = Window:CreateTab({
        Name = "Nebula Scripts",
    })
}

tabs.Nebula_Scripts:CreateButton({
    Name = "Money Clicker Script",
    Description = "A unique auto-farm script for money clicker",
    Callback = function()
        notify("Loading Money Clicker Script, please wait...", "Money Clicker")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cooldudeisbetter/nebulascripts/main/scripts/money_clicker/nebulamoneyclicker.lua"))()
    end
})
