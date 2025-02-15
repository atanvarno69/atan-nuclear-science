local util = require("functions").recipe

if not mods["PlutoniumEnergy"] then
    return
end

-- Recipes
local recipes = {
    "breeder-fuel-cell",
    "explosive-plutonium-cannon-shell",
    "fission-reactor-equipment-from-plutonium",
    "fission-reactor-equipment-from-MOX-fuel",
    "MOX-fuel-cell",
    "plutonium-atomic-artillery-shell",
    "plutonium-cannon-shell",
    "plutonium-fuel-cell",
    "plutonium-rounds-magazine",
}

for _, name in pairs(recipes) do
    util.set_category(name, "centrifuging-or-crafting")
end
