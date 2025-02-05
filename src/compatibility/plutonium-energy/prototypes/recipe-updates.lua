local util = require("functions").recipe

if not mods["PlutoniumEnergy"] then
    return
end

-- Recipes
local recipes = {
    "breeder-fuel-cell",
    "fission-reactor-equipment-from-plutonium",
    "fission-reactor-equipment-from-MOX-fuel",
    "MOX-fuel-cell",
    "plutonium-atomic-artillery-shell",
    "plutonium-fuel-cell",
}
if settings.startup["enable-plutonium-ammo"].value then
    recipes[#recipes + 1] = "explosive-plutonium-cannon-shell"
    recipes[#recipes + 1] = "plutonium-cannon-shell"
    recipes[#recipes + 1] = "plutonium-rounds-magazine"
end

for _, name in pairs(recipes) do
    util.set_category(name, "centrifuging-or-crafting")
end
