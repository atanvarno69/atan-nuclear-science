local recipes = {
    {
        type = "recipe",
        name = "nuclear-science-pack",
        category = "centrifuging",
        enabled = false,
        energy_required = 5, -- NOTE: will be doubled to 10 in data-updates
        ingredients = {
            { type = "item", name = "uranium-235", amount = 1 },
            { type = "item", name = "water-barrel", amount = 20 },
            { type = "item", name = "concrete", amount = 10 },
        },
        results = {
            { type = "item", name = "nuclear-science-pack", amount = 2 },
            { type = "item", name = "barrel", amount = 20, ignored_by_productivity = 20 },
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
}
if settings.startup["atan-science-from-plutonium"].value == true then
    recipes[#recipes + 1] = {
        type = "recipe",
        name = "nuclear-science-pack-from-plutonium",
        category = "centrifuging",
        enabled = false,
        energy_required = 5, -- NOTE: will be doubled to 10 in data-updates
        ingredients = {
            { type = "item", name = "plutonium-239", amount = 1 },
            { type = "item", name = "water-barrel", amount = 10 },
            { type = "item", name = "concrete", amount = 5 },
        },
        results = {
            { type = "item", name = "nuclear-science-pack", amount = 5 },
            { type = "item", name = "barrel", amount = 10, ignored_by_productivity = 10 },
        },
        main_product = "nuclear-science-pack",
        allow_productivity = true,
        icons = {
            {
                icon = "__PlutoniumEnergy__/graphics/icons/plutonium-239.png",
                icon_size = 64,
                draw_background = true,
                scale = 0.35,
                shift = { -4, -4 },
            },
            {
                icon = "__atan-nuclear-science__/graphics/icons/nuclear-science-pack.png",
                icon_size = 64,
                draw_background = true,
                shift = { 4, 4 },
            },
        },
        surface_conditions = {
            {
                property = "pressure",
                min = 1000,
                max = 1000,
            },
        },
    }
end
data:extend(recipes)
