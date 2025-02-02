local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
    {
        type = "assembling-machine",
        name = "atan-atom-forge",
        icon = "__atan-nuclear-science__/graphics/icons/atom-forge.png",
        flags = { "placeable-neutral", "placeable-player", "player-creation" },
        minable = { mining_time = 0.2, result = "atan-atom-forge" },
        fast_replaceable_group = "atom-forge",
        max_health = 350,
        resistances = { { type = "fire", percent = 70 } },
        corpse = "big-remnants",
        dying_explosion = "big-explosion",
        -- TODO:
        circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
        -- TODO:
        circuit_connector = circuit_connector_definitions["foundry"],
        collision_box = { { -2.7, -2.7 }, { 2.7, 2.7 } },
        selection_box = { { -3, -3 }, { 3, 3 } },
        heating_energy = "300kW",
        damaged_trigger_effect = require("__base__.prototypes.entity.hit-effects").entity(),
        effect_receiver = { base_effect = { productivity = 0.5 } },
        module_slots = 4,
        allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },
        crafting_categories = {
            "centrifuging",
            "centrifuging-or-crafting",
            "advanced-centrifuging-or-crafting",
        },
        crafting_speed = 2,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = { pollution = 6 },
        },
        energy_usage = "2500kW",
        perceived_performance = { minimum = 0.25, maximum = 20 },
        open_sound = sounds.metal_large_open,
        close_sound = sounds.metal_large_close,
        impact_category = "metal-large",
        working_sound = table.deepcopy(data.raw["assembling-machine"]["centrifuge"].working_sound),
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__atan-nuclear-science__/graphics/atom-forge/atom-forge-shadow.png",
                        priority = "high",
                        width = 900,
                        height = 500,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 80,
                        draw_as_shadow = true,
                        animation_speed = 0.3,
                        scale = 0.5,
                    },
                    {
                        priority = "high",
                        width = 400,
                        height = 480,
                        frame_count = 80,
                        animation_speed = 0.3,
                        scale = 0.5,
                        stripes = {
                            {
                                filename = "__atan-nuclear-science__/graphics/atom-forge/atom-forge-animation-1.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            },
                            {
                                filename = "__atan-nuclear-science__/graphics/atom-forge/atom-forge-animation-2.png",
                                width_in_frames = 8,
                                height_in_frames = 2,
                            },
                        },
                    },
                },
            },
            working_visualisations = {
                {
                    fadeout = true,
                    secondary_draw_order = 1,
                    animation = {
                        priority = "high",
                        width = 400,
                        height = 480,
                        frame_count = 80,
                        draw_as_glow = true,
                        scale = 0.5,
                        animation_speed = 0.3,
                        blend_mode = "additive",
                        stripes = {
                            {
                                filename = "__atan-nuclear-science__/graphics/atom-forge/atom-forge-emission-1.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            },
                            {
                                filename = "__atan-nuclear-science__/graphics/atom-forge/atom-forge-emission-2.png",
                                width_in_frames = 8,
                                height_in_frames = 2,
                            },
                        },
                    },
                },
            },
            reset_animation_when_frozen = true,
        },
    },
})
