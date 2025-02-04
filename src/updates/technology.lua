local util = require("utility")

-- Update technologies requiring uranium processing
-- NOTE: biolab, kovarex-enrichment-process, nuclear-power and uranium-ammo
for technology_name, _ in pairs(data.raw["technology"]) do
    if util.delete_prerequisite(technology_name, "uranium-processing") then
        util.add_prerequisite(technology_name, "nuclear-science-pack")
        util.add_ingredient(technology_name, { "nuclear-science-pack", 1 })
    end
end
--- Fixes nuclear-science-pack requiring itself
util.add_prerequisite("nuclear-science-pack", "uranium-processing")

-- Update technologies requiring metallurgic, electromagnetic and agricultural science packs
-- NOTE: captive-biter-spawner, fusion-reactor-equipment, fusion-reactor, legendary-quality, planet-discovery-aquilo,
-- promethium-science-pack, research-productivity
for technology_name, _ in pairs(data.raw["technology"]) do
    if util.requires_planet_sciences(technology_name) then
        util.add_ingredient(technology_name, { "nuclear-science-pack", 1 })
    end
end

-- Further update base technologies
local base_technologies = {
    "atomic-bomb",
    "fission-reactor-equipment",
    "nuclear-fuel-reprocessing",
    "physical-projectile-damage-7",
    "railgun-shooting-speed-1",
    "spidertron",
}
for _, technology_name in pairs(base_technologies) do
    util.add_ingredient(technology_name, { "nuclear-science-pack", 1 })
end

-- Additional tweaks to base technologies
--- atomic-bomb
util.delete_prerequisite("atomic-bomb", "space-science-pack")
util.delete_ingredient("atomic-bomb", "space-science-pack")
util.add_ingredient("atomic-bomb", { "production-science-pack", 1 })
--- kovarex-enrichment-process
util.delete_prerequisite("kovarex-enrichment-process", "space-science-pack")
util.delete_ingredient("kovarex-enrichment-process", "space-science-pack")
util.add_prerequisite("kovarex-enrichment-process", "rocket-fuel")
util.add_prerequisite("kovarex-enrichment-process", "production-science-pack")
util.add_ingredient("kovarex-enrichment-process", { "production-science-pack", 1 })
--- physical-projectile-damage-7
util.add_prerequisite("physical-projectile-damage-7", "nuclear-science-pack")
--- planet-discovery-aquilo
util.add_prerequisite("planet-discovery-aquilo", "nuclear-science-pack")

-- Guided Nauvis tech chain
--- Uranium mining
data.raw["technology"]["uranium-mining"].essential = true
data.raw["technology"]["uranium-mining"].prerequisites = { "electric-mining-drill", "sulfur-processing" }
data.raw["technology"]["uranium-mining"].unit = nil
data.raw["technology"]["uranium-mining"].research_trigger = { type = "craft-fluid", fluid = "sulfuric-acid" }
if settings.startup["aps-planet"].value ~= "none" then
    util.add_prerequisite("uranium-mining", "planet-discovery-nauvis")
end
--- Uranium processing
data.raw["technology"]["uranium-processing"].essential = true
if settings.startup["aps-planet"].value == "none" then
    util.add_prerequisite("uranium-processing", "concrete")
end

-- Kovarex setting adjustment
if settings.startup["atan-kovarex-mode"].value == "trigger" then
    data.raw["technology"]["kovarex-enrichment-process"].unit = nil
    data.raw["technology"]["kovarex-enrichment-process"].research_trigger = {
        type = "craft-item",
        item = "uranium-235",
        count = 40,
    }
else
    local kovarex = data.raw["technology"]["kovarex-enrichment-process"]
    kovarex.unit.time = kovarex.unit.time * 20
    kovarex.unit.count = kovarex.unit.count / 20
    for _, ingredient in pairs(kovarex.unit.ingredients) do
        if ingredient[1] ~= "nuclear-science-pack" then
            ingredient[2] = ingredient[2] * 20
        end
    end
end

local power = data.raw["technology"]["nuclear-power"]
power.unit.time = power.unit.time * 20
power.unit.count = power.unit.count / 20
for _, ingredient in pairs(power.unit.ingredients) do
    if ingredient[1] ~= "nuclear-science-pack" then
        ingredient[2] = ingredient[2] * 20
    end
end
