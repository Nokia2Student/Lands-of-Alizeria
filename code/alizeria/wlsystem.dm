// ¬À —»—“≈Ã¿
var/global/list/landowner_whitelist = list(
	"ivaxan",
	"blazeba",
	"thisisadvokat",
	"moksii",
	"pauchek_dio",
	"lorki",
	"elite1323",
	"honkhonk2",
	"gleb31",
	"fawl",
	"bynoob",
	"normcheliksi",
	"errakoksta",
	"dajehibus",
	"bratoksashok",
	"zmiksontheggreat",
	"cila",
	"variannn",
	"alexanderg5",
	"ghostsanya228",
	"blub28",
	"barka",
	"penot1971",
	"yukiharathotg",
	"lazur_azur",
	"reilina",
	"blockbatr",
	"nemohukto",
	"myhungryboy",
	"lieeater",
	"jubothoe",
	"tempest_5251",
	"illa_3000",
	"arion1234",
	"sloak",
	"devolgen",
	"alexfaf",
	"savel8",
	"gunkrest",
	"leroygarn",
	"1moth2",
	"mogetopenci",
	"lechis",
	"metaslavery",
	"tabyret_29",
	"rodion09",
	"namenlos66",
	"sergo_abchihbovich",
	"atomas",
	"mrbav",
	"gardelin0",
	"sneeek",
	"sarov",
	"vladegeg",
	"illa3000",
	"tabyret29",
	"tempest5251",
	"lazurazur",
	"pauchekdio",
	"imm0ral",
)

/datum/job/roguetown/lord/special_job_check(mob/dead/new_player/player)
	if(!player)
		return FALSE
	if(!player.ckey)
		return FALSE
	if(!(player.ckey in landowner_whitelist))
		return FALSE
	return TRUE

/datum/job/roguetown/marshgen/special_job_check(mob/dead/new_player/player)
	if(!player)
		return FALSE
	if(!player.ckey)
		return FALSE
	if(!(player.ckey in landowner_whitelist))
		return FALSE
	return TRUE

/datum/job/roguetown/capo/special_job_check(mob/dead/new_player/player)
	if(!player)
		return FALSE
	if(!player.ckey)
		return FALSE
	if(!(player.ckey in landowner_whitelist))
		return FALSE
	return TRUE

/datum/job/roguetown/ojandarme/special_job_check(mob/dead/new_player/player)
	if(!player)
		return FALSE
	if(!player.ckey)
		return FALSE
	if(!(player.ckey in landowner_whitelist))
		return FALSE
	return TRUE

/datum/job/roguetown/ins/special_job_check(mob/dead/new_player/player)
	if(!player)
		return FALSE
	if(!player.ckey)
		return FALSE
	if(!(player.ckey in landowner_whitelist))
		return FALSE
	return TRUE

/datum/job/roguetown/jandarme/special_job_check(mob/dead/new_player/player)
	if(!player)
		return FALSE
	if(!player.ckey)
		return FALSE
	if(!(player.ckey in landowner_whitelist))
		return FALSE
	return TRUE

/datum/job/roguetown/lguard/special_job_check(mob/dead/new_player/player)
	if(!player)
		return FALSE
	if(!player.ckey)
		return FALSE
	if(!(player.ckey in landowner_whitelist))
		return FALSE
	return TRUE

/datum/job/roguetown/marshal/special_job_check(mob/dead/new_player/player)
	if(!player)
		return FALSE
	if(!player.ckey)
		return FALSE
	if(!(player.ckey in landowner_whitelist))
		return FALSE
	return TRUE

/datum/job/roguetown/priest/special_job_check(mob/dead/new_player/player)
	if(!player)
		return FALSE
	if(!player.ckey)
		return FALSE
	if(!(player.ckey in landowner_whitelist))
		return FALSE
	return TRUE

/datum/job/roguetown/martyr/special_job_check(mob/dead/new_player/player)
	if(!player)
		return FALSE
	if(!player.ckey)
		return FALSE
	if(!(player.ckey in landowner_whitelist))
		return FALSE
	return TRUE

/datum/job/roguetown/hand/special_job_check(mob/dead/new_player/player)
	if(!player)
		return FALSE
	if(!player.ckey)
		return FALSE
	if(!(player.ckey in landowner_whitelist))
		return FALSE
	return TRUE

/datum/job/roguetown/magician/special_job_check(mob/dead/new_player/player)
	if(!player)
		return FALSE
	if(!player.ckey)
		return FALSE
	if(!(player.ckey in landowner_whitelist))
		return FALSE
	return TRUE

/datum/job/roguetown/niteman/special_job_check(mob/dead/new_player/player)
	if(!player)
		return FALSE
	if(!player.ckey)
		return FALSE
	if(!(player.ckey in landowner_whitelist))
		return FALSE
	return TRUE

/datum/job/roguetown/mercenary/special_job_check(mob/dead/new_player/player)
	if(!player)
		return FALSE
	if(!player.ckey)
		return FALSE
	if(!(player.ckey in landowner_whitelist))
		return FALSE
	return TRUE