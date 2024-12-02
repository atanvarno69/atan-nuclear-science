local function double_crafting_time(recipe_name)
    data.raw["recipe"][recipe_name].energy_required = 2 * data.raw["recipe"][recipe_name].energy_required
end

local function set_crafting_category(recipe_name)
    data.raw["recipe"][recipe_name].category = "centrifuging-or-crafting"
end

data:extend({
    {
        type = "recipe",
        name = "nuclear-science-pack",
        --category = "centrifuging",
        category = "crafting-with-fluid",
        surface_conditions = {
            {
                property = "pressure",
                min = 1000,
                max = 1000,
            },
        },
        enabled = false,
        ingredients = {
            { type = "item", name = "uranium-235", amount = 1 },
            { type = "item", name = "wood", amount = 1},
            { type = "fluid", name = "steam", amount = 500 },
        },
        energy_required = 10,
        results = { { type = "item", name = "nuclear-science-pack", amount = 3 } },
        allow_productivity = true,
    },
})


local uranium_recipes = {
    "atomic-bomb",
    "explosive-uranium-cannon-shell",
    "fission-reactor-equipment",
    "fusion-reactor-equipment",
    "kovarex-enrichment-process",
    "nuclear-fuel",
    "nuclear-fuel-reprocessing",
    "uranium-cannon-shell",
    "uranium-fuel-cell",
    "uranium-processing",
    "uranium-rounds-magazine",
}
for _, recipe_name in pairs(uranium_recipes) do
    if data.raw["recipe"][recipe_name] then
        double_crafting_time(recipe_name)
    end
end

local centrifuging_or_crafting_recipes = {
    "atomic-bomb",
    "explosive-uranium-cannon-shell",
    "fission-reactor-equipment",
    "fusion-reactor-equipment",
    "uranium-cannon-shell",
    "uranium-rounds-magazine",
}
for _, recipe_name in pairs(centrifuging_or_crafting_recipes) do
    if data.raw["recipe"][recipe_name] then
        set_crafting_category(recipe_name)
    end
end
if data.raw["recipe"]["uranium-fuel-cell"] then
    data.raw["recipe"]["uranium-fuel-cell"].category = "centrifuging"
end

data.raw["recipe"]["agricultural-tower"].ingredients = 
{
  {type = "item", name = "steel-plate", amount = 10},
  {type = "item", name = "electronic-circuit", amount = 3},
  --{type = "item", name = "spoilage", amount = 20},
  {type = "item", name = "landfill", amount = 1}
}
