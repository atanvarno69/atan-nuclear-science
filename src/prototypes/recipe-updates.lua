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
    "space-science-pack",
}

for _, recipe in pairs(centrifugable) do
    if settings.startup["nuclear-science-continued-exclusive-centrifuging"].value == "true" then
        util.set_category(recipe, "centrifuging")
    else
        util.add_category(recipe, "centrifuging")
    end
end

for _, recipe in pairs(atom_forgable) do
    util.add_category(recipe, "advanced-centrifuging")
end

for recipe, _ in pairs(data.raw["recipe"]) do
    if util.is_centrifuging(recipe) then
        util.double_time(recipe)
    end
end
