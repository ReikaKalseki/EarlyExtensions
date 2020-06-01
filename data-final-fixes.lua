require "__DragonIndustries__.recipe"

lockRecipe("boiler", "steam-power")
lockRecipe("steam-engine", "steam-power")

lockRecipe("lab", "electric-machinery")
lockRecipe("inserter", "electric-machinery")
lockRecipe("electric-mining-drill", "electric-machinery")
lockRecipe("small-electric-pole", "electric-machinery")
lockRecipe("radar", "electric-machinery")

lockRecipe("automation-science-pack", "basic-science")

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

if data.raw.item["burner-offshore-pump"] then
	lockRecipe("burner-offshore-pump", "steam-power")
	lockRecipe("electric-offshore-pump", "electric-machinery")
	--lockRecipe("offshore-pump", "electric-machinery")
else
	lockRecipe("offshore-pump", "steam-power")
end
lockRecipe("wind-turbine", "electric-machinery")
lockRecipe("wind-turbine-2", "electric-machinery")
lockRecipe("burner-generator", "electric-machinery")
lockRecipe("burner-inserter-conversion-to-inserter", "electric-machinery")
lockRecipe("burner-mining-drill-conversion-to-electric-mining-drill", "electric-machinery")

--addPrereqToTech("bob-greenhouse", "electric-machinery")
addPrereqToTech("mining-speed-upgrade1", "basic-science")
addPrereqToTech("crafting-speed-upgrade1", "basic-science")