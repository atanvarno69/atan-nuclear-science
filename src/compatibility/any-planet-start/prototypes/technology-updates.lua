local util = require("functions").tech

if settings.startup["aps-planet"].value ~= "none" then
    util.add_prerequisite("uranium-mining", "planet-discovery-nauvis")
else
    util.add_prerequisite("uranium-processing", "concrete")
end
