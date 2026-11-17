require("compatibility.any-planet-start.settings")
require("compatibility.plutonium-energy.settings")

data:extend({
    {
        type = "string-setting",
        name = "atan-kovarex-mode",
        setting_type = "startup",
        default_value = "cheap",
        allowed_values = { "cheap", "trigger" },
    },
    {
        type = "string-setting",
        name = "atan-exclusive-centrifuging",
        setting_type = "startup",
        default_value = "false",
        allowed_values = { "true", "false" },
    },
})
