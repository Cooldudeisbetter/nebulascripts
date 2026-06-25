local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:AddTheme({
    Name = "NebulaTheme",
    Accent = Color3.fromHex("#FFFFFF"),
    Background = Color3.fromHex("#9810fa"),
    Outline = Color3.fromHex("#FFFFFF"),
    Text = Color3.fromHex("#FFFFFF"),
    Placeholder = Color3.fromHex("#7a7a7a"),
    Button = Color3.fromHex("#252525"),
    Icon = Color3.fromHex("#FFFFFF"),
})

local Window = WindUI:CreateWindow({
    Title = "Nebula Hub",
    Icon = "moon",
    Author = "by cooldudeisbetter",
    Theme = "NebulaTheme"
})

local ScriptsTab = Window:Tab({
    Title = "Nebula Scripts",
    Icon = "scroll-text"
})

local ScriptsSection = ScriptsTab:Section({
    Title = "Scripts"
})

ScriptsSection:Button({
    Title = "Money Clicker",
    Desc = "A unique auto-farm script for money clicker",
    Callback = function()
        WindUI:Notify({
            Title = "Money Clicker",
            Icon = "loader",
            Content = "Loading Money Clicker Script, please wait...",
            Duration = 3
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cooldudeisbetter/nebulascripts/main/scripts/money_clicker/nebulamoneyclicker.lua"))()
    end
})
