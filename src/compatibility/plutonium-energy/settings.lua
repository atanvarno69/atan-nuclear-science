if mods["PlutoniumEnergy"] then
    data:extend({
        {
            type = "bool-setting",
            name = "atan-science-from-plutonium",
            setting_type = "startup",
            default_value = true,
        },
    })
else
    data:extend({
        {
            type = "bool-setting",
            name = "atan-science-from-plutonium",
            setting_type = "startup",
            hidden = true,
            default_value = false,
            forced_value = false,
        },
    })
end
