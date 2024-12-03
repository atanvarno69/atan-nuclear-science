local function add_nuclear_pack_cost(tech_name)
    if data.raw["technology"][tech_name] then
        table.insert(data.raw["technology"][tech_name].unit.ingredients, { "nuclear-science-pack", 1 })
    end
end

local function add_nuclear_pack_prereq(tech_name)
    if data.raw["technology"][tech_name] then
        table.insert(data.raw["technology"][tech_name].prerequisites, "nuclear-science-pack")
    end
end

local function delete_space_science_prereq_cost(tech_name)
    if not data.raw["technology"][tech_name] then
        return false
    end
    local needed = false
    local prerequisites = {}
    for _, value in pairs(data.raw["technology"][tech_name].prerequisites) do
        if value ~= "space-science-pack" then
            table.insert(prerequisites, value)
        else
            needed = true
        end
    end
    if needed then
        data.raw["technology"][tech_name].prerequisites = prerequisites
    end
    if not data.raw["technology"][tech_name].unit then
        return needed
    end
    local edited = false
    local ingredients = {}
    for _, ingredient in pairs(data.raw["technology"][tech_name].unit.ingredients) do
        if ingredient[1] ~= "space-science-pack" then
            table.insert(ingredients, ingredient)
        else
            edited = true
        end
    end
    if edited then
        data.raw["technology"][tech_name].unit.ingredients = ingredients
    end
    if needed or edited then
        return true
    end
    return false
end

local function replace_uranium_processing_prereq(tech_name)
    if not data.raw["technology"][tech_name] or not data.raw["technology"][tech_name].prerequisites then
        return false
    end
    local needed = false
    local prerequisites = {}
    for _, prereq in pairs(data.raw["technology"][tech_name].prerequisites) do
        if prereq == "uranium-processing" then
            table.insert(prerequisites, "nuclear-science-pack")
            needed = true
        else
            table.insert(prerequisites, prereq)
        end
    end
    if needed then
        data.raw["technology"][tech_name].prerequisites = prerequisites
    end
    return needed
end

-- Updates biolab, kovarex-enrichment-process, nuclear-power and uranium-ammo
for tech_name, _ in pairs(data.raw["technology"]) do
    if replace_uranium_processing_prereq(tech_name) then
        add_nuclear_pack_cost(tech_name)
    end
end
delete_space_science_prereq_cost("kovarex-enrichment-process")
if data.raw["technology"]["kovarex-enrichment-process"] then
    table.insert(data.raw["technology"]["kovarex-enrichment-process"].prerequisites, "production-science-pack")
    table.insert(data.raw["technology"]["kovarex-enrichment-process"].prerequisites, "rocket-fuel")
    table.insert(
        data.raw["technology"]["kovarex-enrichment-process"].unit.ingredients,
        { "production-science-pack", 1 }
    )
end

-- Guided tech chain
if data.raw["technology"]["uranium-mining"] then
    data.raw["technology"]["uranium-mining"].essential = true
    data.raw["technology"]["uranium-mining"].prerequisites = { "electric-mining-drill", "sulfur-processing" }
    data.raw["technology"]["uranium-mining"].unit = nil
    data.raw["technology"]["uranium-mining"].research_trigger = { type = "craft-fluid", fluid = "sulfuric-acid" }
end
if mods["any-planet-start"] and settings.startup["aps-planet"].value ~= "nauvis" then
    table.insert(data.raw["technology"]["uranium-mining"].prerequisites, "planet-discovery-nauvis")
end
if not mods["any-planet-start"] or settings.startup["aps-planet"].value == "nauvis" then
    if data.raw["technology"]["uranium-processing"] then
        table.insert(data.raw["technology"]["uranium-processing"].prerequisites, "concrete")
    end
end
if data.raw["technology"]["uranium-processing"] then
    data.raw["technology"]["uranium-processing"].essential = true
end
data:extend({
    {
        type = "technology",
        name = "nuclear-science-pack",
        icon = "__atan-nuclear-science__/graphics/technologies/nuclear-science-pack.png",
        icon_size = 256,
        essential = true,
        prerequisites = { "uranium-processing" },
        research_trigger = { type = "craft-item", item = "uranium-235" },
        effects = { { type = "unlock-recipe", recipe = "nuclear-science-pack" } },
    },
})

-- Update tech tree
local techs = {
    "atomic-bomb",
    "captive-biter-spawner",
    "fission-reactor-equipment",
    "fusion-reactor-equipment",
    "fusion-reactor",
    "legendary-quality",
    "nuclear-fuel-reprocessing",
    "physical-projectile-damage-7",
    "planet-discovery-aquilo",
    "promethium-science-pack",
    "research-productivity",
    "spidertron",
}
for _, tech_name in pairs(techs) do
    add_nuclear_pack_cost(tech_name)
end
add_nuclear_pack_prereq("planet-discovery-aquilo")
delete_space_science_prereq_cost("atomic-bomb")
if data.raw["technology"]["atomic-bomb"] and data.raw["technology"]["atomic-bomb"].unit then
    table.insert(data.raw["technology"]["atomic-bomb"].unit.ingredients, { "production-science-pack", 1 })
end

-- Changes to agriculture tower techs

local tree_seeding=data.raw["technology"]["tree-seeding"]
data.raw["technology"]["fish-breeding"].prerequisites=tree_seeding.prerequisites
tree_seeding.unit.ingredients = {
    { "automation-science-pack", 1 },
    { "logistic-science-pack", 1 }
}
tree_seeding.prerequisites = {
    "landfill"
}
table.insert(tree_seeding.effects,{type="unlock-recipe", recipe="agricultural-tower"})


-- if mods["any-planet-start"] and settings.startup["aps-planet"].value ~= "nauvis" then

-- end
table.insert(data.raw["technology"]["nuclear-science-pack"].prerequisites,"tree-seeding")
