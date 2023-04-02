minetest.register_on_mods_loaded(function()
	for i, def in pairs(minetest.registered_items) do
		local groups = def.groups
		if def.type == "node" then
			groups.node = 1
		elseif def.type == "craft" then
			groups.craftitem = 1
		elseif def.type == "tool" then
			groups.tool = 1
		end
		if def.type ~= "none" then
			groups.any = 1
		end
		minetest.override_item(i,{groups=groups})
	end

	local old_register_item = minetest.register_item
	function minetest.register_item(name, def)
		local groups = def.groups or {}
		if def.type == "node" then
			groups.node = 1
		elseif def.type == "craft" then
			groups.craftitem = 1
		elseif def.type == "tool" then
			groups.tool = 1
		end
		if def.type ~= "none" then
			groups.any = 1
		end
		def.groups = groups
		old_register_item(name, def)
	end
end)
