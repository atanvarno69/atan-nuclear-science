local settings = {
    {
        type = "bool-setting",
        name = "atan-nuclear-centrifuge-base-productivity",
        setting_type = "startup",
        default_value = false,
    },
}

if not data.raw["string-setting"]["aps-planet"] then
    settings[#settings + 1] = {
        type = "string-setting",
        name = "aps-planet",
        setting_type = "startup",
        default_value = "nauvis",
        allowed_values = { "nauvis" },
        hidden = true,
    }
end

data:extend(settings)
