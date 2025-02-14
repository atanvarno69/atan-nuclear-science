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
    {
        type = "technology",
        name = "atan-ammunition-productivity-1",
        icon = "__atan-nuclear-science__/graphics/technology/placeholder.png",
        icon_size = 256,
        upgrade = true,
        max_level = "infinite",
        -- Feels wrong to require railgun when it's meant to be a Nauvis tech. However, I think the tech needs to buff
        -- all the ammo you might want to build on a space platform to be desirable.
        --
        -- Could split it into seperate guns, rockets and railguns (and tesla, I guess), techs.
        --
        -- More thought needed.
        prerequisites = { "railgun" },
        -- Placeholder. Need to think about cost.
        unit = {
            count_formula = "1.5^L*1000",
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 },
                { "military-science-pack", 1 },
                { "chemical-science-pack", 1 },
                { "production-science-pack", 1 },
                { "utility-science-pack", 1 },
                { "space-science-pack", 1 },
                { "nuclear-science-pack", 1 },
                { "cryogenic-science-pack", 1 },
            },
            time = 60,
        },
        effect = {
            { type = "change-recipe-productivity", change = 0.1, recipe = "firearm-magazine" },
            { type = "change-recipe-productivity", change = 0.1, recipe = "piercing-rounds-magazine" },
            { type = "change-recipe-productivity", change = 0.1, recipe = "uranium-rounds-magazine" },
            { type = "change-recipe-productivity", change = 0.1, recipe = "rocket" },
            { type = "change-recipe-productivity", change = 0.1, recipe = "explosive-rocket" },
            { type = "change-recipe-productivity", change = 0.1, recipe = "atomic-bomb" },
            { type = "change-recipe-productivity", change = 0.1, recipe = "railgun-ammo" },
        },
    },
    {
        type = "technology",
        name = "atan-hyrdocarbon-productivity-1",
        icon = "__atan-nuclear-science__/graphics/technology/placeholder.png",
        icon_size = 256,
        upgrade = true,
        max_level = "infinite",
        prerequisites = { "coal-liquefaction" },
        -- Placeholder. Need to think about cost.
        unit = {
            count_formula = "1.5^L*1000",
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 },
                { "chemical-science-pack", 1 },
                { "production-science-pack", 1 },
                { "space-science-pack", 1 },
                { "nuclear-science-pack", 1 },
            },
            time = 60,
        },
        effect = {
            { type = "change-recipe-productivity", change = 0.1, recipe = "advanced-oil-processing" },
            { type = "change-recipe-productivity", change = 0.1, recipe = "heavy-oil-cracking" },
            { type = "change-recipe-productivity", change = 0.1, recipe = "light-oil-cracking" },
            { type = "change-recipe-productivity", change = 0.1, recipe = "coal-liquefaction" },
        },
    },
})
