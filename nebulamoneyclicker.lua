local RunService = game:GetService("RunService")

local datascript = loadstring(game:HttpGet("https://raw.githubusercontent.com/Cooldudeisbetter/nebulascripts/refs/heads/main/data.lua"))()
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. datascript.WindUi_Version .. "/main.lua"))() 

local events = {
    ClickMoney = game:GetService("ReplicatedStorage").Events.ClickMoney :: RemoteEvent
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

-- Renamed from 'error' to avoid breaking Luau's built-in error handler
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

-- Holds our thread reference globally across toggle states
local loopThread = nil 

-- Fixed: Changed parent from AutoFarmTab to AutoClickerSection
local AutoClickerToggle = AutoClickerSection:Toggle({
    Title = "Enable Auto Clicker",
    Callback = function(state)
        if state == true then
            -- Double start validation
            if loopThread then
                uiError("Double Start in Autoclicker. Disabling.")
                return
            end

            -- Safe background thread optimized for performance
            loopThread = task.spawn(function()
                while true do
                    -- Wrapped inside pcall to protect against network drops
                    local success, err = pcall(function()
                        events.ClickMoney:FireServer()
                    end)
                    
                    if not success then
                        warn("AutoClick failed: " .. tostring(err))
                    end

                    -- Safe, un-laggy throttle (Approx 20 clicks per second)
                    task.wait(0.05) 
                end
            end)
            
            notify("Auto Clicker has been activated.", "Enabled")
        else
            -- Destroys the thread instantly on toggle off
            if loopThread then
                task.cancel(loopThread)
                loopThread = nil
                notify("Auto Clicker has been deactivated.", "Disabled")
            end
        end
    end
})
