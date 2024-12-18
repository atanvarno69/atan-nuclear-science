if not mods["PlutoniumEnergy"] then
    return
end

local util = require("utility")

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
for _, recipe_name in pairs(recipes) do
    util.set_crafting_category(recipe_name, "centrifuging-or-crafting")
end

-- Technologies
local technologies = {
    "plutonium-atomic-bomb",
    "plutonium-nuclear-power",
    "MOX-nuclear-power",
    "plutonium-reprocessing",
    "nuclear-breeding",
    "breeder-fuel-cell-from-uranium-cell",
    "breeder-fuel-cell-from-MOX-fuel-cell",
    "fission-reactor-equipment-from-plutonium",
    "fission-reactor-equipment-from-MOX-fuel",
}
if settings.startup["enable-plutonium-ammo"].value then
    technologies[#technologies + 1] = "plutonium-ammo"
end
for _, technology_name in pairs(technologies) do
    util.add_ingredient(technology_name, { "nuclear-science-pack", 1 })
end

if settings.startup["atan-science-from-plutonium"].value == true then
    table.insert(data.raw["technology"]["plutonium-processing"].effects, {
        type = "unlock-recipe",
        recipe = "nuclear-science-pack-from-plutonium",
    })
end
