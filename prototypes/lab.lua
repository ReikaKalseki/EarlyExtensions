require "__DragonIndustries__.cloning"

local lab = copyObject("lab", "lab", "burner-lab")
local labitem = copyObject("item", "lab", "burner-lab")
reparentSprites("base", "EarlyExtensions", lab)
reparentSprites("base", "EarlyExtensions", labitem)
lab.max_health = 70
lab.energy_source =
    {
      type = "burner",
      fuel_category = "chemical",
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = 12,
      smoke = data.raw.boiler.smoke
    }
--lab.light.color = {r = 1.0, g = 0.7, b = 0.2}
lab.energy_usage = "400kW"
lab.researching_speed = 0.25
lab.inputs = {"early-science-pack", "automation-science-pack"}
lab.module_specification = {}
lab.working_sound =
    {
      sound =
      {
        filename = "__EarlyExtensions__/sounds/lab.ogg",
        volume = 1.0
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
	
--log(serpent.block(lab))
	--[[
lab.on_animation.layers[1].width = 97
lab.on_animation.layers[1].frame_count = 40
lab.on_animation.layers[1].line_length = 10
lab.on_animation.layers[1].animation_speed = 0.5
lab.on_animation.layers[1].hr_version.frame_count = 40
lab.on_animation.layers[1].hr_version.line_length = 10
lab.on_animation.layers[1].hr_version.animation_speed = 0.5
lab.on_animation.layers[2].repeat_count = 40
lab.on_animation.layers[2].hr_version.repeat_count = 40
lab.on_animation.layers[3].repeat_count = 40
lab.on_animation.layers[3].hr_version.repeat_count = 40 --]]

for _,entry in pairs(lab.on_animation.layers) do
	if entry.frame_count and entry.frame_count > 1 then
		entry.frame_count = entry.frame_count/3;
		if entry.hr_version and entry.hr_version.frame_count > 1 then
			entry.hr_version.frame_count = entry.hr_version.frame_count/3;
		end
	end
	
	if entry.repeat_count and entry.repeat_count > 1 then
		entry.repeat_count = entry.repeat_count/3;
		if entry.hr_version and entry.hr_version.repeat_count > 1 then
			entry.hr_version.repeat_count = entry.hr_version.repeat_count/3;
		end
	end
end

log(serpent.block(lab))

local pack = copyObject("tool", "automation-science-pack", "early-science-pack")
replaceSpritesDynamic("EarlyExtensions", "automation-science-pack", pack)

data:extend({
	lab,labitem,pack,
	{
		type = "recipe-category",
		name = "early-science"
	},
	{
		type = "recipe",
		name = labitem.name,
		energy_required = 1,
		enabled = true,
		ingredients =
		{
		  {"iron-stick", 10},
		  {"iron-gear-wheel", 4},
		  {"burner-inserter", 5},
		{"stone-brick", 10},
		},
		result = labitem.name
	},
	{
		type = "recipe",
		name = pack.name,
		enabled = true,
		category = "early-science",
		normal = {
			ingredients =
			{
			  {"stone", 1},
			  {"iron-plate", 2},
			  {"copper-plate", 1},
			},
			energy_required = 2,
			result = pack.name
		},
		expensive = {
			ingredients =
			{
			  {"stone-brick", 1},
			  {"iron-plate", 4},
			  {"copper-plate", 3},
			},
			energy_required = 2.5,
			result = pack.name
		},
	}
})