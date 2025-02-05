local util = require("functions").tech

-- Update technologies requiring uranium processing
-- NOTE: biolab, kovarex-enrichment-process, nuclear-power and uranium-ammo
for tech, _ in pairs(data.raw["technology"]) do
    if util.delete_prerequisite(tech, "uranium-processing") then
        util.add_prerequisite(tech, "nuclear-science-pack")
        util.add_ingredient(tech, { "nuclear-science-pack", 1 })
    end
end
--- Fixes nuclear-science-pack requiring itself
util.add_prerequisite("nuclear-science-pack", "uranium-processing")

-- Update technologies requiring metallurgic, electromagnetic and agricultural science packs
-- NOTE: captive-biter-spawner, fusion-reactor-equipment, fusion-reactor, legendary-quality, planet-discovery-aquilo,
-- promethium-science-pack, research-productivity
for tech, _ in pairs(data.raw["technology"]) do
    if util.requires_planet_sciences(tech) then
        util.add_ingredient(tech, { "nuclear-science-pack", 1 })
    end
end

local techs = {
    "atomic-bomb",
    "fission-reactor-equipment",
    "nuclear-fuel-reprocessing",
    "physical-projectile-damage-7",
    "railgun-shooting-speed-1",
    "spidertron",
}
for _, tech in pairs(techs) do
    util.add_ingredient(tech, { "nuclear-science-pack", 1 })
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
util.make_essential("uranium-mining")
util.set_prerequisites("uranium-mining", { "electric-mining-drill", "sulfur-processing" })
util.set_trigger("uranium-mining", { type = "craft-fluid", fluid = "sulfuric-acid" })

--- Uranium processing
util.make_essential("uranium-processing")

-- Kovarex setting adjustment
if settings.startup["atan-kovarex-mode"].value == "trigger" then
    util.set_trigger("kovarex-enrichment-process", {
        type = "craft-item",
        item = "uranium-235",
        count = 40,
    })
else
    local kovarex = data.raw["technology"]["kovarex-enrichment-process"]
    if kovarex.unit then
        if kovarex.unit.time then
            kovarex.unit.time = kovarex.unit.time * 20
        end
        if kovarex.unit.count then
            kovarex.unit.count = kovarex.unit.count / 20
        end
        if kovarex.unit.ingredients then
            for _, ingredient in pairs(kovarex.unit.ingredients) do
                if ingredient[1] ~= "nuclear-science-pack" then
                    ingredient[2] = ingredient[2] * 20
                end
            end
        end
    end
end
