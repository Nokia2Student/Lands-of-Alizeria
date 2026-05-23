/datum/admins/proc/royal_announcement_monfor()
	set category = "-GameMaster-"
	set name = "Royal Announcement - Monfor"
	set desc = "Send a royal announcement from the Kingdom of Monfor"

	if(!check_rights())
		return

	var/announcement_text = input("Enter the announcement text:", "Royal Announcement - Monfor", "", null) as message|null
	if(!announcement_text)
		return

	// Send announcement to all clients
	for(var/client/C in GLOB.clients)
		to_chat(C, "<center><span style='font-size: 200%; font-weight: bold; color: #4579f2;'>⚜ ОБЪЯВЛЕНИЕ ⚜ </span></center>")
		to_chat(C, "<center><span style='font-size: 200%; font-weight: bold; color: white;'>ВЕЛИКОГО КОРОЛЯ</span></center>")
		to_chat(C, "<center><span style='font-size: 200%; font-weight: bold; color: #4579f2;'>⚜ МОНФОРА! ⚜ </span></center>")
		to_chat(C, "<center><span style='color: #f3e068;'>[announcement_text]</span></center>")
		C << sound('sound/alizeria/monfor_announcement.ogg')

	// Log and notify admins
	message_admins("[key_name_admin(usr)] made a Royal Announcement: [announcement_text]")
	log_admin("[key_name(usr)] made a Royal Announcement: [announcement_text]")
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Royal Announcement - Monfor")