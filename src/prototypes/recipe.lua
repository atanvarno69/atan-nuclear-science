data:extend({
    {
        type = "recipe",
        name = "nuclear-science-pack",
        category = "centrifuging",
        enabled = false,
        energy_required = 5, -- NOTE: will be doubled to 10 in data-updates
        ingredients = {
            { type = "item", name = "uranium-235", amount = 1 },
            { type = "item", name = "water-barrel", amount = 10 },
            { type = "item", name = "concrete", amount = 5 },
        },
        results = {
            { type = "item", name = "nuclear-science-pack", amount = 1 },
            { type = "item", name = "empty-barrel", amount = 10, ignored_by_productivity = 10 },
        },
        main_product = "nuclear-science-pack",
        allow_productivity = true,
        surface_conditions = {
            {
                property = "pressure",
                min = 1000,
                max = 1000,
            },
        },
    },
})
