/mob/living

/mob/living/proc/give_genitals()
	if(sexcon == null)
		sexcon = new /datum/sex_controller(src)
		var/mob/living/carbon/human/species/user = src
		if(gender == MALE)
			var/obj/item/organ/filling_organ/testicles/testicles = user.getorganslot(ORGAN_SLOT_TESTICLES)
			if(!show_genitals)
				testicles = new /obj/item/organ/filling_organ/testicles/internal
			else
				testicles = new /obj/item/organ/filling_organ/testicles
			testicles.organ_size = rand(MAX_TESTICLES_SIZE)
			testicles.Insert(user, TRUE)
			var/obj/item/organ/penis/penis = user.getorganslot(ORGAN_SLOT_PENIS)
			if(!show_genitals)
				penis = new /obj/item/organ/penis/internal
			else
				penis = new /obj/item/organ/penis
			penis.organ_size = rand(MAX_PENIS_SIZE)
			penis.Insert(user, TRUE)
		if(gender == FEMALE)
			var/obj/item/organ/butt/buttie = user.getorganslot(ORGAN_SLOT_BUTT)
			if(buttie)
				buttie.organ_size = rand(MAX_BUTT_SIZE)
				buttie.Insert(user, TRUE)
			var/obj/item/organ/filling_organ/breasts/breasts = user.getorganslot(ORGAN_SLOT_BREASTS)
			if(!show_genitals)
				breasts = new /obj/item/organ/filling_organ/breasts/internal
			else
				breasts = new /obj/item/organ/filling_organ/breasts
			breasts.organ_size = rand(MAX_BREASTS_SIZE)
			breasts.Insert(user, TRUE)
			var/obj/item/organ/filling_organ/vagina/vagina = user.getorganslot(ORGAN_SLOT_VAGINA)
			if(!show_genitals)
				vagina = new /obj/item/organ/filling_organ/vagina/internal
			else
				vagina = new /obj/item/organ/filling_organ/vagina
			vagina.Insert(user, TRUE)
			if(prob(3)) //3 chance to be dickgirl.
				var/obj/item/organ/filling_organ/testicles/testicles = user.getorganslot(ORGAN_SLOT_TESTICLES)
				if(!show_genitals)
					testicles = new /obj/item/organ/filling_organ/testicles/internal
				else
					testicles = new /obj/item/organ/filling_organ/testicles
				testicles.organ_size = rand(MAX_TESTICLES_SIZE)
				testicles.Insert(user, TRUE)
				var/obj/item/organ/penis/penis = user.getorganslot(ORGAN_SLOT_PENIS)
				if(!show_genitals)
					penis = new /obj/item/organ/penis/internal
				else
					penis = new /obj/item/organ/penis
				penis.organ_size = rand(MAX_PENIS_SIZE)
				penis.Insert(user, TRUE)