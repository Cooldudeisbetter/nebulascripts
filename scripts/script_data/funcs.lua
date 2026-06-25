local icons_lib = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/nebula-icon-library-loader"))()

function geticon(name: string)
    return icons_lib:GetIcon(name,"lucide")
end

return {
    get_icon = geticon
}