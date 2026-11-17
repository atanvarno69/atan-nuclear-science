local updateDiscoScience = function()
    if remote.interfaces["DiscoScience"] and remote.interfaces["DiscoScience"]["setIngredientColor"] then
        remote.call("DiscoScience", "setIngredientColor", "nuclear-science-pack", {r = 0.15, g = 1.0, b = 0.15})
    end
end

script.on_configuration_changed(
    function ()
        updateDiscoScience()
    end
)
script.on_init(
    function ()
        updateDiscoScience()
    end
)
