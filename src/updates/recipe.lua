local util = require("utility")

-- Adjust craft categories
local recipe_crafting_categories = {
    "atomic-bomb",
    "explosive-uranium-cannon-shell",
    "fission-reactor-equipment",
    "fusion-reactor-equipment",
    "uranium-cannon-shell",
    "uranium-fuel-cell",
    "uranium-rounds-magazine",
}
for _, recipe_name in pairs(recipe_crafting_categories) do
    util.set_crafting_category(recipe_name, "centrifuging-or-crafting")
end

-- Double nuclear recipe crafting time
for recipe_name, _ in pairs(data.raw["recipe"]) do
    if util.is_centrifuging_recipe(recipe_name) then
        util.double_crafting_time(recipe_name)
    end
end
