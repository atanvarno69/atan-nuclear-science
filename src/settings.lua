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
})
