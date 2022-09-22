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
replaceTechPack("gun-turret", "automation-science-pack", "early-science-pack")
replaceTechPack("stone-wall", "automation-science-pack", "early-science-pack")
--lockRecipe("automation-science-pack", "automation")

addPrereqToTech("fluid-generator-1", "steam-power")

if (not mods["bobelectronics"]) then
	local rec = table.deepcopy(data.raw.recipe.splitter)
	rec.name = "splitter-early"
	replaceItemInRecipe(rec, "electronic-circuit", "copper-cable", {3, 8}, true)
	addRecipeIngredientToRecipe(rec, "iron-plate", "electronic-circuit", 5) --since 5 circuits
	data:extend({rec})
	table.insert(data.raw.technology.logistics.effects, {type = "unlock-recipe", recipe = rec.name})
end

replaceItemInRecipe("repair-pack", "electronic-circuit", "copper-cable", 3, mods["bobelectronics"])
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
lockRecipe("bob-burner-generator", "electric-machinery")

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

--createConversionRecipe("burner-lab", "lab", true, "basic-science", false) --they share too few ingredients; better to do manually
rec =
	{
		type = "recipe",
		name = "burner-lab-upgrade",
		energy_required = 3,
		enabled = false,
		subgroup = data.raw.item.lab.subgroup,
		localised_name = {"conversion-recipe.name", {"entity-name.burner-lab"}, {"entity-name.lab"}},
		allow_decomposition = false,
		allow_as_intermediate = false,
		allow_intermediates = false,
		ingredients =
		{
			{"burner-lab", 1},
			{data.raw.item["basic-circuit-board"] and "basic-circuit-board" or "electronic-circuit", 12},
			{"iron-plate", 10},
		},
		results = {
			{"lab", 1},
			{"stone-brick", 10}
		},
		icons = {{icon = data.raw.item.lab.icon, icon_size = data.raw.item.lab.icon_size}, {icon = "__DragonIndustries__/graphics/icons/conversion_overlay.png", icon_size = 32}}
	}
if mods["RubberBelts"] then
	table.insert(rec.ingredients, {"rubber", 8})
end
data:extend({rec})
lockRecipe("burner-lab-upgrade", "basic-science")

if mods["bobelectronics"] then
	rec = {
		type = "recipe",
		name = "early-science-assembler-upgrade",
		energy_required = 5,
		enabled = false,
		allow_decomposition = false,
		allow_as_intermediate = false,
		allow_intermediates = false,
		ingredients =
		{
			{"early-science-assembler", 1},
			{data.raw.item["basic-circuit-board"] and "basic-circuit-board" or "electronic-circuit", 2},
			{"iron-plate", 4},
			{"iron-gear-wheel", 2},
		},
		result = "assembling-machine-1",
		icons = {{icon = data.raw.item["assembling-machine-1"].icon, icon_size = data.raw.item["assembling-machine-1"].icon_size}, {icon = "__DragonIndustries__/graphics/icons/conversion_overlay.png", icon_size = 32}}
	}
	if data.raw.item["wooden-board"] then
		table.insert(rec.ingredients, {"wooden-board", 1})
	end
	data:extend({rec})
	addTechUnlock("automation", rec.name)
else
	rec = createConversionRecipe("early-science-assembler", "assembling-machine-1", true, "automation", false)
	streamlineRecipeOutputWithRecipe(rec, "electronic-circuit", "assembling-machine-1")
end

table.insert(data.raw.character.character.crafting_categories, "early-science")
for _,assembler in pairs(data.raw["assembling-machine"]) do
	if listHasValue(assembler.crafting_categories, "crafting") then
		table.insert(assembler.crafting_categories, "early-science")
	end
end