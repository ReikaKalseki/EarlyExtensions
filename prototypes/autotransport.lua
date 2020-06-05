require "__DragonIndustries__.tech"
require "__DragonIndustries__.items"
require "__DragonIndustries__.recipe"

require "config"

if not Config.beltAndInserterTech then return end

data:extend({
  {
    type = "technology",
    name = "automated-transport",
    icon = "__EarlyExtensions__/graphics/technology/transport.png",
    icon_size = 128,
    effects =
    {

    },
    prerequisites =
    {
     
    },
    unit =
    {
      count = 5,
      ingredients =
      {
        {"early-science-pack", 1},
      },
      time = 5
    },
    order = "c-k-b-a",
  },
}
)

addPrereqToTech("logistics", "automated-transport")
addPrereqToTech("electric-machinery", "automated-transport")
replaceItemInRecipe("burner-lab", "burner-inserter", "copper-cable", 3)

for _,recipe in pairs(data.raw.recipe) do
	local out = getRecipeOutput(recipe)
	if recipeProduces(recipe, "burner-inserter") then
		lockRecipe(recipe, "automated-transport")
	elseif recipeStartsEnabled(recipe) and isItemInCategory(out, "transport-belt") then
		lockRecipe(recipe, "automated-transport")
	end
end