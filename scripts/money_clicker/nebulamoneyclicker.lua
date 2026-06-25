local datascript = {
    WindUI = "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua",
    Banned_UserIds = {}
}
local WindUI = loadstring(game:HttpGet(datascript.WindUI))()
local plr = game:GetService("Players").LocalPlayer

if plr.UserId and table.find(datascript.Banned_UserIds, plr.UserId) then
    plr:Kick("You are banned from using this script.")    
end



local events = {
    ClickMoney = game:GetService("ReplicatedStorage").Events.ClickMoney :: RemoteEvent,
    EnterCode = game:GetService("ReplicatedStorage").Events.EnterCode :: RemoteEvent
}

local script_settings = {
    ["AutoClicker"] = {
        Timer = 0.01 
    }
}

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

local function uiError(errormsg: string)
    WindUI:Notify({
        Title = "ERROR",
        Icon = "circle-x",
        Content = errormsg,
        Duration = 10
    })
end

local function notify(msg: string, title: string)
    WindUI:Notify({
        Title = title,
        Icon = "message-circle",
        Content = msg,
        Duration = 5
    })
end

local Window = WindUI:CreateWindow({
    Title = "Nebula",
    Icon = "sparkles",
    Author = "by cooldudeisbetter",
    Theme = "NebulaTheme"
})

local AutoFarmTab = Window:Tab({
    Title = "AutoFarm",
    Icon = "gamepad-2"
})

Window:Tag({
    Title = "Money Clicker",
    Color = Color3.fromRGB(100, 200, 100)
})

local AutoClickerSection = AutoFarmTab:Section({
    Title = "Auto Clicker"
})

local loopThread = nil 

local AutoClickerToggle = AutoClickerSection:Toggle({
    Title = "Enable Auto Clicker",
    Callback = function(state)
        if state == true then
            if loopThread then
                uiError("Double Start in Autoclicker. Disabling.")
                return
            end
            loopThread = task.spawn(function()
                while true do
                    local success, err = pcall(function()
                        events.ClickMoney:FireServer()
                    end)
                    
                    if not success then
                        warn("AutoClick failed: " .. tostring(err))
                    end

                    task.wait(script_settings.AutoClicker.Timer) 
                end
            end)
            
            notify("Auto Clicker has been activated.", "Enabled")
        else
            if loopThread then
                task.cancel(loopThread)
                loopThread = nil
                notify("Auto Clicker has been deactivated.", "Disabled")
            end
        end
    end
})

local autoclickerslider = AutoClickerSection:Slider({
    Title = "AutoClicker Delay",
    Desc = "Control the delay in-between clicks of the autoclicker",
    Step = 0.01,
    Value = {
        Min = 0,
        Max = 0.5,
        Default = 0.05
    },
    Callback = function(value)
        script_settings.AutoClicker.Timer = value
    end
})

AutoClickerSection:Tag({
    Title = "Laggy",
    Icon = "triangle-alert",
    Color = Color3.fromHex("#ffba00")
})

local codestab = Window:Tab({
    Title = "Codes",
    Icon = "key-square"
})

