-- Assembling machines
table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories, "centrifuging-or-crafting")
table.insert(data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories, "centrifuging-or-crafting")
table.insert(data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories, "centrifuging-or-crafting")

-- Character
table.insert(data.raw["character"]["character"].crafting_categories, "centrifuging-or-crafting")

-- Centrifuge
local centrifuge = data.raw["assembling-machine"]["centrifuge"]
table.insert(centrifuge.crafting_categories, "centrifuging-or-crafting")
centrifuge.crafting_speed = 1.5

-- Labs
table.insert(data.raw["lab"]["lab"].inputs, "nuclear-science-pack")
table.insert(data.raw["lab"]["biolab"].inputs, "nuclear-science-pack")
