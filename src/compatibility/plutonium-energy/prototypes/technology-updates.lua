local util = require("functions").tech

if not mods["PlutoniumEnergy"] then
    return
end

if settings.startup["atan-science-from-plutonium"].value == true then
    util.add_effect("plutonium-processing", {
        type = "unlock-recipe",
        recipe = "nuclear-science-pack-from-plutonium",
    })
end

local technologies = {
    "plutonium-atomic-bomb",
    "plutonium-nuclear-power",
    "MOX-nuclear-power",
    "plutonium-ammo",
    "plutonium-reprocessing",
    "nuclear-breeding",
    "breeder-fuel-cell-from-uranium-cell",
    "breeder-fuel-cell-from-MOX-fuel-cell",
    "fission-reactor-equipment-from-plutonium",
    "fission-reactor-equipment-from-MOX-fuel",
}

for _, technology_name in pairs(technologies) do
    util.add_ingredient(technology_name, { "nuclear-science-pack", 1 })
end
