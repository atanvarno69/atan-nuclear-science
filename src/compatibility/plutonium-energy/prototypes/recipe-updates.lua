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

for _, recipe in pairs(recipes) do
    if settings.startup["nuclear-science-continued-exclusive-centrifuging"].value == "true" then
        util.set_category(recipe, "centrifuging")
    else
        util.add_category(recipe, "centrifuging")
    end
end
