local data = loadstring(game:HttpGet("https://raw.githubusercontent.com/Cooldudeisbetter/nebulascripts/main/scripts/script_data/data.lua"))()
local plr = game:GetService("Players").LocalPlayer
local luna = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/luna", true))()
local funcs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Cooldudeisbetter/nebulascripts/main/scripts/script_data/funcs.lua"))()


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
        Icon = funcs.get_icon("scroll-text")
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
