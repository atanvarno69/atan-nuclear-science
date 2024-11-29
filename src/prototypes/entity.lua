-- Labs
table.insert(data.raw["lab"]["lab"].inputs, "nuclear-science-pack")
table.insert(data.raw["lab"]["biolab"].inputs, "nuclear-science-pack")

-- Character
table.insert(data.raw["character"]["character"].crafting_categories, "centrifuging-or-crafting")

-- Centrifuge
table.insert(data.raw["assembling-machine"]["centrifuge"].crafting_categories, "centrifuging-or-crafting")
data.raw["assembling-machine"]["centrifuge"].crafting_speed = 2
data.raw["assembling-machine"]["centrifuge"].module_slots = 4
if settings.startup["atan-nuclear-centrifuge-base-productivity"].value then
    data.raw["assembling-machine"]["centrifuge"].effect_receiver = { base_effect = { productivity = 0.5 } }
end

-- Assembling machines
table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories, "centrifuging-or-crafting")
table.insert(data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories, "centrifuging-or-crafting")
table.insert(data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories, "centrifuging-or-crafting")
