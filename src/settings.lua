local atan_settings = {
    ["atan-nuclear-centrifuge-base-productivity"] = {
        type = "bool-setting",
        name = "atan-nuclear-centrifuge-base-productivity",
        setting_type = "startup",
        default_value = false,
    },
    ["atan-science-from-plutonium"] = {
        type = "bool-setting",
        name = "atan-science-from-plutonium",
        setting_type = "startup",
        default_value = true,
    },
}

if not mods["PlutoniumEnergy"] then
    atan_settings["atan-science-from-plutonium"].hidden = true
    atan_settings["atan-science-from-plutonium"].forced_value = false
end

if not data.raw["string-setting"]["aps-planet"] then
    atan_settings["aps-planet"] = {
        type = "string-setting",
        name = "aps-planet",
        setting_type = "startup",
        default_value = "nauvis",
        allowed_values = { "nauvis" },
        hidden = true,
    }
end

for _, setting in pairs(atan_settings) do
    data:extend({ setting })
end
