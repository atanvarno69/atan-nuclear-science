local util = require("functions").recipe

if not mods["SchallUraniumProcessing"] then
    return
end

if
    settings.startup["Schall-UP-remove-kovarex-enrichment-process"]
    and settings.startup["Schall-UP-remove-kovarex-enrichment-process"].value == true
then
    util.hide_in_factoriopedia("kovarex-enrichment-process")
end
