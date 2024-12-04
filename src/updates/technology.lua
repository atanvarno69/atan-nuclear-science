local util = require("utility")

-- Update technologies requiring uranium processing
-- NOTE: biolab, kovarex-enrichment-process, nuclear-power and uranium-ammo
for technology_name, _ in pairs(data.raw["technology"]) do
    if util.delete_prerequisite(technology_name, "uranium-processing") then
        util.add_prerequisite(technology_name, "nuclear-science-pack")
        util.add_ingredient(technology_name, { "nuclear-science-pack", 1 })
    end
end

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
-- kovarex-enrichment-process
util.add_prerequisite("kovarex-enrichment-process", "production-science-pack")
util.add_prerequisite("kovarex-enrichment-process", "rocket-fuel")
util.add_ingredient("kovarex-enrichment-process", { "production-science-pack", 1 })

-- Guided Nauvis tech chain
--- Uranium mining
data.raw["technology"]["uranium-mining"].essential = true
data.raw["technology"]["uranium-mining"].prerequisites = { "electric-mining-drill", "sulfur-processing" }
data.raw["technology"]["uranium-mining"].unit = nil
data.raw["technology"]["uranium-mining"].research_trigger = { type = "craft-fluid", fluid = "sulfuric-acid" }
if settings.startup["aps-planet"].value ~= "nauvis" then
    table.insert(data.raw["technology"]["uranium-mining"].prerequisites, "planet-discovery-nauvis")
end
--- Uranium processing
data.raw["technology"]["uranium-processing"].essential = true
if settings.startup["aps-planet"].value == "nauvis" then
    table.insert(data.raw["technology"]["uranium-processing"].prerequisites, "concrete")
end
