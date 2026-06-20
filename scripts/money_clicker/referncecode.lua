--Money Clicker

local Event:RemoteEvent = game:GetService("ReplicatedStorage").Events.ClickMoney
Event:FireServer()

local Event = game:GetService("ReplicatedStorage").Events.EnterCode
Event:FireServer(
    "Code"
)
