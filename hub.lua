local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:AddTheme({
    Name = "Lunar Theme",
    
    Accent = Color3.fromHex("#101010"),
    Background = Color3.fromHex("#5e00b0"), 
    Outline = Color3.fromHex("#FFFFFF"),
    Text = Color3.fromHex("#FFFFFF"),
    Placeholder = Color3.fromHex("#7a7a7a"),
    Button = Color3.fromHex("#52525b"),
    Icon = Color3.fromHex("#a1a1aa"),
})

local Window = WindUI:CreateWindow({
    Theme = "Lunar Theme",
    Title = "Lunar Hub",
    Icon = "lucide:moon",
    Author = "by cooldudeisbetter",
    Folder = "Lunar Hub",
})

local function Notify(title,content,Icon,Duration)
    if title and content then 
        WindUI:Notify({
            Title = title,
            Content = content,
            Icon = Icon or nil,
            Duration = Duration or 5,
        })
    else
        WindUI:Notify({
            Title = "ERROR",
            Content = "Invalid variables",
            Icon = "shield-alert",
            Duration = 10
        })
    end
end

local home = Window:Tab({
    Title = "Home",
    Icon = "house",
    Locked = false,
})

Window:Tag({
    Title = "v1.0.0 APLHA",
    Icon = "rocket",
    Color = Color3.fromHex("#e3102c"),
    Radius = 10,
})

Window:Tag({
    Title = "Custom",
    Icon = "zap",
    Color = Color3.fromHex("#002fff"),
    Radius = 10,
})

home:Select()

Notify("Lunar Hub","Lunar hub has been loaded | Have a good day","refresh-ccw",5)

home:Code({
    Title = "Script Copy",
    Code = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/Cooldudeisbetter/Scripts/refs/heads/main/Loader.lua"))()]]
})

local scripts = Window:Tab({
    Title = "Scripts",
    Icon = "scroll-text",
})

scripts:Button({
    Title = "Solara Hub v4",
    Desc = "Solara hub is one of the best script hubs out there",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://solarahub.space/SH.lua'))()
        Notify("Lunar Hub","Solara Hub has been loaded","check",5)
    end
})

scripts:Button({
    Title = "VoidWare Loader",
    Desc = "Best script ever",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/loader.lua", true))()
        Notify("Lunar Hub","Voidware has been loaded","check",5)
    end
})

local chat = Window:Tab({
    Title = "Chat Bypassers",
    Icon = "message-square-text",
})

chat:Button({
    Title = "Betterbypasser",
    Desc = "Best chat bypasser by synergy",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Synergy-Networks/products/main/BetterBypasser/loader.lua"))()
        Notify("Lunar hub","Betterbypasser has been loaded","check",5)
    end
})

local acb = Window:Tab({
    Title = "Anticheat Bypasser",
    Icon = "shield-off",
})

acb:Button({
    Title = "Anti Kick",
    Desc = "Activates anti kick",
    Locked = false,
    Callback = function()
        Notify("Lunar Hub","Running anti kick","check",5)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Anti-Kick/main/Anti-Kick.lua"))()
    end
})

acb:Divider()

acb:Button({
    Title = "Bypass adonis anti-cheat",
    Desc = "Bypasses adonis anti-cheat",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/refs/heads/main/Source.lua"))()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Anti-Kick/main/Anti-Kick.lua"))()
    end
})