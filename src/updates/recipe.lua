local util = require("utility")

-- Double nuclear recipe crafting time
for recipe_name, _ in pairs(data.raw["recipe"]) do
    if util.has_nuclear_ingredient(recipe_name) then
        util.double_crafting_time(recipe_name)
    end
end

-- Adjust craft categories
local recipe_crafting_categories = {
    ["atomic-bomb"] = "centrifuging-or-crafting",
    ["explosive-uranium-cannon-shell"] = "centrifuging-or-crafting",
    ["fission-reactor-equipment"] = "centrifuging-or-crafting",
    ["fusion-reactor-equipment"] = "centrifuging-or-crafting",
    ["uranium-cannon-shell"] = "centrifuging-or-crafting",
    ["uranium-fuel-cell"] = "centrifuging",
    ["uranium-rounds-magazine"] = "centrifuging-or-crafting",
}
for recipe_name, category in pairs(recipe_crafting_categories) do
    util.set_crafting_category(recipe_name, category)
end
