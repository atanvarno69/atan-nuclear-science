data:extend({
    {
        type = "technology",
        name = "nuclear-science-pack",
        icon = "__atan-nuclear-science__/graphics/technology/nuclear-science-pack.png",
        icon_size = 256,
        essential = true,
        research_trigger = { type = "craft-item", item = "uranium-235" },
        effects = { { type = "unlock-recipe", recipe = "nuclear-science-pack" } },
    },
    {
        type = "technology",
        name = "atan-atom-forge",
        icon = "__atan-nuclear-science__/graphics/technology/atom-forge.png",
        icon_size = 256,
        prerequisites = {
            "nuclear-science-pack",
            "processing-unit",
        },
        unit = {
            count = 500,
            time = 45,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 },
                { "chemical-science-pack", 1 },
                { "nuclear-science-pack", 1 },
            },
        },
        effects = { { type = "unlock-recipe", recipe = "atan-atom-forge" } },
    },
})
