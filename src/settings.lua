local atan_settings = {
    ["atan-science-from-plutonium"] = {
        type = "bool-setting",
        name = "atan-science-from-plutonium",
        setting_type = "startup",
        default_value = true,
    },
    ["atan-kovarex-mode"] = {
        type = "string-setting",
        name = "atan-kovarex-mode",
        setting_type = "startup",
        default_value = "cheap",
        allowed_values = { "cheap", "expensive", "trigger" },
    },
}

if not mods["PlutoniumEnergy"] then
    atan_settings["atan-science-from-plutonium"].hidden = true
    atan_settings["atan-science-from-plutonium"].forced_value = false
end

if not mods["any-planet-start"] then
    atan_settings["aps-planet"] = {
        type = "string-setting",
        name = "aps-planet",
        setting_type = "startup",
        default_value = "none",
        allowed_values = { "none" },
        hidden = true,
    }
end

for _, setting in pairs(atan_settings) do
    data:extend({ setting })
end
