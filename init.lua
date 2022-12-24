minetest.register_on_mods_loaded(function()
	for i,v in pairs(minetest.registered_items) do
		local groups = v.groups
		if v.type == "node" then
			groups.node = 1
		elseif v.type == "craft" then
			groups.craftitem = 1
		elseif v.type == "tool" then
			groups.tool = 1
		end
		if v.type ~= "none" then
			groups.any = 1
		end
		minetest.override_item(i,{groups=groups})
	end
end)
