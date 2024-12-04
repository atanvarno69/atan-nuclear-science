-- Character
table.insert(data.raw["character"]["character"].crafting_categories, "centrifuging-or-crafting")

-- Centrifuge
local centrifuge = data.raw["assembling-machine"]["centrifuge"]
table.insert(centrifuge.crafting_categories, "centrifuging-or-crafting")
centrifuge.crafting_speed = 2
centrifuge.module_slots = 4
if settings.startup["atan-nuclear-centrifuge-base-productivity"].value then
    centrifuge.effect_receiver = centrifuge.effect_receiver or {}
    centrifuge.effect_receiver.base_effect = centrifuge.effect_receiver.base_effect or {}
    centrifuge.effect_receiver.base_effect.productivity = 0.5
end

-- Labs
table.insert(data.raw["lab"]["lab"].inputs, "nuclear-science-pack")
table.insert(data.raw["lab"]["biolab"].inputs, "nuclear-science-pack")
