local datascript = loadstring(game:HttpGet("https://raw.githubusercontent.com/Cooldudeisbetter/nebulascripts/main/scripts/script_data/data.lua"))()
local plr = game:GetService("Players").LocalPlayer
local icons_lib = loadstring(game:HttpGet(datascript.Icons))()

function geticon(name: string)
    return icons_lib:GetIcon(name,"lucide")
end

return {
    get_icon = geticon
}