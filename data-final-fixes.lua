require "__DragonIndustries__.recipe"
require "__DragonIndustries__.tech"
require "__DragonIndustries__.arrays"

require "prototypes.autotransport"

lockRecipe("boiler", "steam-power")
--lockRecipe("steam-engine", "steam-power")
lockRecipe("steam-engine", "electric-machinery")

--lockRecipe("inserter", "electric-machinery")
--lockRecipe("electric-mining-drill", "electric-machinery")
lockRecipe("small-electric-pole", "electric-machinery")
lockRecipe("radar", "electric-machinery")

lockRecipe("automation-science-pack", "basic-science")
lockRecipe("lab", "basic-science")

--addPrereqToTech("automation", "electric-machinery")
addPrereqToTech("optics", "electric-machinery")

addPrereqToTech("logistic-science-pack", "basic-science")
--addPrereqToTech("logistics", "basic-science")
addPrereqToTech("steel-processing", "basic-science")

addPrereqToTech("military", "basic-science")

addPrereqToTech("automation", "basic-science")

replaceTechPack("logistics", "automation-science-pack", "early-science-pack")
--replaceTechPack("automation", "automation-science-pack", "early-science-pack")
replaceTechPack("turrets", "automation-science-pack", "early-science-pack")
replaceTechPack("stone-walls", "automation-science-pack", "early-science-pack")
--lockRecipe("automation-science-pack", "automation")

replaceItemInRecipe("splitter", "electronic-circuit", "copper-cable", 3)
replaceItemInRecipe("splitter", "iron-plate", "iron-gear-wheel", 0.67)
addItemToRecipe("splitter", "iron-gear-wheel", 1, 2, true)

replaceItemInRecipe("repair-pack", "electronic-circuit", "copper-cable", 3)
addItemToRecipe("repair-pack", "iron-plate", 1, 1, true)

if data.raw.item["burner-offshore-pump"] then
	lockRecipe("burner-offshore-pump", "steam-power")
	lockRecipe("electric-offshore-pump", "electric-machinery")
	--lockRecipe("offshore-pump", "electric-machinery")
	lockRecipe("electronic-circuit", "electric-machinery")
	addItemToRecipe("burner-offshore-pump", "iron-gear-wheel", 2, 3, true)
else
	lockRecipe("offshore-pump", "steam-power")
	removeItemFromRecipe("offshore-pump", "electronic-circuit")
	addItemToRecipe("offshore-pump", "iron-gear-wheel", 2, 3, true)
end
lockRecipe("wind-turbine", "electric-machinery")
lockRecipe("wind-turbine-2", "electric-machinery")
lockRecipe("burner-generator", "electric-machinery")

--[[
lockRecipe("burner-inserter-conversion-to-inserter", "electric-machinery")
lockRecipe("burner-mining-drill-conversion-to-electric-mining-drill", "electric-machinery")
--]]
for _,recipe in pairs(data.raw.recipe) do
	local out = getRecipeOutput(recipe)
	if recipeProduces(recipe, "inserter") or recipeProduces(recipe, "electric-mining-drill") then
		lockRecipe(recipe, "electric-machinery")
	end
end

--addPrereqToTech("bob-greenhouse", "electric-machinery")
addPrereqToTech("mining-speed-upgrade1", "basic-science")
addPrereqToTech("crafting-speed-upgrade1", "basic-science")

createConversionRecipe("burner-lab", "lab", true, "basic-science", false)
local rec = createConversionRecipe("early-science-assembler", "assembling-machine-1", true, "automation", false)
streamlineRecipeOutputWithRecipe(rec, "electronic-circuit", "assembling-machine-1")

table.insert(data.raw.character.character.crafting_categories, "early-science")
for _,assembler in pairs(data.raw["assembling-machine"]) do
	if listHasValue(assembler.crafting_categories, "crafting") then
		table.insert(assembler.crafting_categories, "early-science")
	end
end