local data = {
    WindUI = "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua",
    Banned_UserIds = {},
    LunaUI = "https://raw.nebulasoftworks.xyz/luna",
    Icons = "https://raw.nebulasoftworks.xyz/nebula-icon-library-loader"
}

local plr = game:GetService("Players").LocalPlayer
local luna = loadstring(game:HttpGet(data.LunaUI, true))()
local icons_lib = loadstring(game:HttpGet(data.Icons))()

local funcs = {
    get_icon = function(name: string)
        return icons_lib:GetIcon(name, "lucide")
    end
}


if plr.UserId and table.find(data.Banned_UserIds, plr.UserId) then
    plr:Kick("You are banned from using this script.")
end

local function notify(msg: string, title: string, icon: string)
    luna:Notification({
        Title = title,
        Icon = funcs.get_icon(icon),
        Content = msg
    })
end

local Window = luna:CreateWindow({
    Name = "Nebula Hub",
    Subtitle = "by cooldudeisbetter",
    -- LogoId = funcs.get_icon("moon"),
    LoadingEnabled = true,
    LoadingTitle = "Loading Nebula Hub",
    LoadingDesc = "Welcome to Nebula Hub, please wait while we load everything up for you.",

    ConfigSettings = {
        RootFolder = nil,
        ConfigFolder = "Nebula Hub",
    },
    KeySystem=false
})

Window:CreateHomeTab({
    SupportedExecutors = {"Real","Velocity","madium","Yub-X"},
    DiscordInvite = "0000"
})

local tabs = {
    ["Nebula_Scripts"] = Window:CreateTab({
        Name = "Nebula Scripts",
        Icon = funcs.get_icon("scroll")
    })
}


tabs.Nebula_Scripts:CreateButton({
    Name = "Money Clicker Script",
    Description = "A unique auto-farm script for money clicker",
    Callback = function()
        notify("Loading Money Clicker Script, please wait...", "Money Clicker", "loader")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cooldudeisbetter/nebulascripts/main/scripts/money_clicker/nebulamoneyclicker.lua"))()
    end
})
