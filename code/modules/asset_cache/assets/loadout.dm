/datum/asset/spritesheet/loadout_items
	name = "loadout_items"
	early = TRUE

/datum/asset/spritesheet/loadout_items/create_spritesheets()
	for(var/key in GLOB.loadout_items)
		var/datum/loadout_item/item = GLOB.loadout_items[key]
		if(!item.name || !item.path)
			continue
		var/obj/item/obj_path = item.path
		var/icon_file = initial(obj_path.icon)
		var/icon_state = initial(obj_path.icon_state)
		if(!icon_file || !icon_state)
			continue
		Insert(sanitize_css_class_name("loadout_[REF(item)]"), icon_file, icon_state)
