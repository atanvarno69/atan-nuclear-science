local sounds = require("__base__.prototypes.entity.sounds")

local circuit_connector = circuit_connector_definitions.create_vector(universal_connector_template, {
    { variation = 25, main_offset = util.by_pixel(4, 104), shadow_offset = util.by_pixel(6, 106), show_shadow = true },
    { variation = 25, main_offset = util.by_pixel(4, 104), shadow_offset = util.by_pixel(6, 106), show_shadow = true },
    { variation = 25, main_offset = util.by_pixel(4, 104), shadow_offset = util.by_pixel(6, 106), show_shadow = true },
    { variation = 25, main_offset = util.by_pixel(4, 104), shadow_offset = util.by_pixel(6, 106), show_shadow = true },
})

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
        circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
        circuit_connector = circuit_connector,
        collision_box = { { -2.7, -2.7 }, { 2.7, 2.7 } },
        selection_box = { { -3, -3 }, { 3, 3 } },
        drawing_box_vertical_extension = 0.5,
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
        working_sound = {
            fade_in_ticks = 4,
            fade_out_ticks = 20,
            audible_distance_modifier = 0.6,
            max_sounds_per_prototype = 2,
            main_sounds = {
                {
                    sound = { filename = "__atan-nuclear-science__/sound/atom-forge-working-1.ogg", volume = 0.1 },
                    audible_distance_modifier = 0.5,
                },
                {
                    sound = { filename = "__atan-nuclear-science__/sound/atom-forge-working-2.ogg", volume = 0.5 },
                    audible_distance_modifier = 0.6,
                },
            },
        },
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
