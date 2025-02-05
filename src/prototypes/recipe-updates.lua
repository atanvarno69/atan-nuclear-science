local util = require("functions").recipe

local centrifugable = {
    "atomic-bomb",
    "explosive-uranium-cannon-shell",
    "fission-reactor-equipment",
    "fusion-reactor-equipment",
    "uranium-cannon-shell",
    "uranium-fuel-cell",
    "uranium-rounds-magazine",
}
local atom_forgable = {
    "centrifuge",
    "automation-science-pack",
    "logistic-science-pack",
    "military-science-pack",
    "chemical-science-pack",
    "production-science-pack",
    "utility-science-pack",
}

for _, recipe in pairs(centrifugable) do
    util.set_category(recipe, "centrifuging-or-crafting")
end

for _, recipe in pairs(atom_forgable) do
    util.set_category(recipe, "advanced-centrifuging-or-crafting")
end

for recipe, _ in pairs(data.raw["recipe"]) do
    if util.is_centrifuging(recipe) then
        util.double_time(recipe)
    end
end
