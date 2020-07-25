local function onEntityAdded(event)	
	local entity = event.created_entity
	if entity.name == "early-science-assembler" then
		entity.set_recipe("early-science-pack")
	end
end

local function onEntityRemoved(event)
	
end

script.on_event(defines.events.on_entity_died, onEntityRemoved)
script.on_event(defines.events.on_pre_player_mined_item, onEntityRemoved)
script.on_event(defines.events.on_robot_pre_mined, onEntityRemoved)
script.on_event(defines.events.script_raised_destroy, onEntityRemoved)

script.on_event(defines.events.on_built_entity, onEntityAdded)
script.on_event(defines.events.on_robot_built_entity, onEntityAdded)