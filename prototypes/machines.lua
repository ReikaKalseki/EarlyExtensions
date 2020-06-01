require "__DragonIndustries__.cloning"

local crafter = copyObject("assembling-machine", "assembling-machine-1", "early-science-assembler")
local crafteritem = copyObject("item", "assembling-machine-1", "early-science-assembler")
replaceSpritesDynamic("EarlyExtensions", "assembling-machine-1", crafter)
replaceSpritesDynamic("EarlyExtensions", "assembling-machine-1", crafteritem)

crafter.crafting_categories = {"early-science"}
crafter.max_health = 100
crafter.next_upgrade = "assembling-machine-1"
crafter.crafting_speed = 0.25
crafter.energy_source =
    {
      type = "burner",
      fuel_category = "chemical",
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = 5,
      smoke = data.raw.boiler.smoke
    }
crafter.energy_usage = "80kW"

data:extend({
	crafter,crafteritem,
	{
		type = "recipe",
		name = crafteritem.name,
		enabled = true,
		ingredients =
		{
		  {"copper-cable", 3},
		  {"iron-gear-wheel", 3},
		  {"iron-plate", 5}
		},
		result = crafteritem.name
	}
})