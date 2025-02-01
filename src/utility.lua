local M = {}

function M.double_crafting_time(recipe_name)
    data.raw["recipe"][recipe_name].energy_required = 2 * data.raw["recipe"][recipe_name].energy_required
end

function M.is_centrifuging_recipe(recipe_name)
    local category = data.raw["recipe"][recipe_name].category
    return category == "centrifuging" or category == "centrifuging-or-crafting"
end

function M.set_crafting_category(recipe_name, category)
    data.raw["recipe"][recipe_name].category = category
end

function M.has_nuclear_ingredient(recipe_name)
    if not data.raw["recipe"][recipe_name].ingredients then
        return false
    end
    for _, ingredient in pairs(data.raw["recipe"][recipe_name].ingredients) do
        if ingredient.name == "uranium-235" or ingredient.name == "uranium-238" then
            return true
        end
    end
    return false
end

function M.has_ingredient(technology_name, ingredient)
    for _, extant in pairs(data.raw["technology"][technology_name].unit.ingredients) do
        if extant[1] == ingredient then
            return true
        end
    end
    return false
end

function M.has_prerequisite(technology_name, prerequisite)
    for _, extant in pairs(data.raw["technology"][technology_name].prerequisites) do
        if extant == prerequisite then
            return true
        end
    end
    return false
end

function M.add_ingredient(technology_name, ingredient)
    if not data.raw["technology"][technology_name].unit then
        return false
    end
    -- Check ingredient doesn't already exist (for mod compatibility)
    if M.has_ingredient(technology_name, ingredient) then
        return false
    end
    table.insert(data.raw["technology"][technology_name].unit.ingredients, ingredient)
    return true
end

function M.add_prerequisite(technology_name, prerequisite)
    if not data.raw["technology"][technology_name].prerequisites then
        data.raw["technology"][technology_name].prerequisites = {}
    end
    -- Check prerequisite doesn't already exist (for mod compatibility)
    if not M.has_prerequisite(technology_name, prerequisite) then
        table.insert(data.raw["technology"][technology_name].prerequisites, prerequisite)
    end
end

function M.delete_ingredient(technology_name, target)
    if not data.raw["technology"][technology_name].unit then
        return false
    end
    local needed = false
    local ingredients = {}
    for _, ingredient in pairs(data.raw["technology"][technology_name].unit.ingredients) do
        if ingredient[1] == target then
            needed = true
        else
            ingredients[#ingredients + 1] = ingredient
        end
    end
    if not needed then
        return false
    end
    data.raw["technology"][technology_name].unit.ingredients = ingredients
    return true
end

function M.delete_prerequisite(technology_name, target)
    if not data.raw["technology"][technology_name].prerequisites then
        return false
    end
    local needed = false
    local prerequisites = {}
    for _, prerequisite in pairs(data.raw["technology"][technology_name].prerequisites) do
        if prerequisite == target then
            needed = true
        else
            prerequisites[#prerequisites + 1] = prerequisite
        end
    end
    if not needed then
        return false
    end
    data.raw["technology"][technology_name].prerequisites = prerequisites
    return true
end

function M.requires_planet_sciences(technology_name)
    if not data.raw["technology"][technology_name].unit then
        return false
    end
    local count = 0
    for _, ingredient in pairs(data.raw["technology"][technology_name].unit.ingredients) do
        if
            ingredient[1] == "metallurgic-science-pack"
            or ingredient[1] == "electromagnetic-science-pack"
            or ingredient[1] == "agricultural-science-pack"
        then
            count = count + 1
        end
    end
    return count == 3
end

return M
