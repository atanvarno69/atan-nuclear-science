local util = require("functions").entity

util.add_crafting_category("assembling-machine", "assembling-machine-1", "centrifuging-or-crafting")
util.add_crafting_category("assembling-machine", "assembling-machine-2", "centrifuging-or-crafting")
util.add_crafting_category("assembling-machine", "assembling-machine-3", "centrifuging-or-crafting")
util.add_crafting_category("assembling-machine", "centrifuge", "centrifuging-or-crafting")
util.add_crafting_category("character", "character", "centrifuging-or-crafting")
util.set_crafting_speed("assembling-machine", "centrifuge", 1.5)
util.add_lab_input("lab", "nuclear-science-pack")
util.add_lab_input("biolab", "nuclear-science-pack")
