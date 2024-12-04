data:extend({
    {
        type = "technology",
        name = "nuclear-science-pack",
        icon = "__atan-nuclear-science__/graphics/technology/nuclear-science-pack.png",
        icon_size = 256,
        essential = true,
        prerequisites = { "uranium-processing" },
        research_trigger = { type = "craft-item", item = "uranium-235" },
        effects = { { type = "unlock-recipe", recipe = "nuclear-science-pack" } },
    },
})
