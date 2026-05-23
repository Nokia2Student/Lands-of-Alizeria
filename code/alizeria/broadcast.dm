/// Broadcast verb for OOC rumors
/// Tracks last broadcast time per player for cooldown enforcement

GLOBAL_LIST_INIT(broadcast_cooldowns, list())
GLOBAL_PROTECT(broadcast_cooldowns)

#define BROADCAST_COOLDOWN_MS (2 MINUTES)

/client/verb/broadcast()
	set name = "Broadcast"
	set category = "OOC"
	set desc = "Share a rumor with everyone in the chat."

	// Check if player is Age Vetted
	if(!check_agevet())
		to_chat(src, span_danger("Только для доверенных игроков."))
		return

	// Check cooldown
	var/current_time = world.time
	var/last_broadcast_time = GLOB.broadcast_cooldowns[ckey]

	if(last_broadcast_time && (current_time - last_broadcast_time) < BROADCAST_COOLDOWN_MS)
		var/time_remaining = round((BROADCAST_COOLDOWN_MS - (current_time - last_broadcast_time)) / 10)
		to_chat(src, span_danger("Ты должен подождать [time_remaining] секунд перед подачей следующего объявления."))
		return

	// Get broadcast message from input
	var/msg = input(src, "Впиши свои слухи:", "Broadcast") as text|null

	if(!msg || !length(msg))
		return

	// Sanitize message
	msg = copytext(sanitize(msg), 1, MAX_MESSAGE_LEN)
	if(!msg)
		return

	// Log the broadcast
	mob.log_talk(msg, LOG_OOC)

	// Update cooldown
	GLOB.broadcast_cooldowns[ckey] = current_time

	// Build and send the broadcast message to all clients
	var/broadcast_message = "<b><font color='#6cb271'>Слухи:</font></b> <font color='#ffffff'>[msg]</font>"

	for(var/client/C in GLOB.clients)
		// Broadcast is sent to everyone regardless of OOC toggle
		to_chat(C, broadcast_message)

	// Log to admins with player info
	var/player_name = mob ? mob.name : "Unknown"
	var/admin_log = "<b>BROADCAST:</b> [key_name(src)] ([player_name]) broadcasted: [msg]"
	message_admins(admin_log)
	log_admin(admin_log)

#undef BROADCAST_COOLDOWN_MS