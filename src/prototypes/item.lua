local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
    {
        type = "tool",
        name = "nuclear-science-pack",
        localised_description = { "item-description.science-pack" },
        icon = "__atan-nuclear-science__/graphics/icons/nuclear-science-pack.png",
        subgroup = "science-pack",
        color_hint = { text = "N" },
        order = "g[z-nuclear-science-pack]",
        inventory_move_sound = item_sounds.science_inventory_move,
        pick_sound = item_sounds.science_inventory_pickup,
        drop_sound = item_sounds.science_inventory_move,
        stack_size = 200,
        default_import_location = "nauvis",
        weight = 1 * kg,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        random_tint_color = require("__base__.prototypes.item-tints").bluish_science,
        pictures = {
            layers = {
                {
                    filename = "__atan-nuclear-science__/graphics/icons/nuclear-science-pack.png",
                    mipmap_count = 4,
                    scale = 0.5,
                    size = 64,
                },
                {
                    filename = "__atan-nuclear-science__/graphics/icons/space-age-science-pack-glow.png",
                    mipmap_count = 4,
                    scale = 0.5,
                    size = 64,
                    draw_as_light = true,
                },
            },
        },
    },
})
