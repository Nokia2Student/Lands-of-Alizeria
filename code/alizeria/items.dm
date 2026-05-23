/obj/item/clothing/suit/roguetown/armor/alizeria/jandarms/chief/armor
	slot_flags = ITEM_SLOT_ARMOR
	name = "marshall gendarmes dress"
	desc = "Укреплённое, роскошное платье маршалла жандармов. Красиво и практично."
	body_parts_covered = COVERAGE_VEST
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "chiefarmor"
	item_state = "chiefarmor"
	armor = ARMOR_CUIRASS
	allowed_race = NON_DWARVEN_RACE_TYPES
	allowed_sex = list(FEMALE)
	nodismemsleeves = TRUE
	blocking_behavior = null
	max_integrity = 300
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_MEDIUM
	smelt_bar_num = 2
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sellprice = 120
	armor = ARMOR_LEATHER
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	blade_dulling = DULLING_BASHCHOP
	armor_class = ARMOR_CLASS_LIGHT
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	slot_flags = ITEM_SLOT_ARMOR
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "shirt"

/obj/item/clothing/suit/roguetown/armor/alizeria/jandarms/patrol/armor
	slot_flags = ITEM_SLOT_ARMOR
	name = "gendarmes' patrol skirt"
	desc = "Простая юбка жандармерии, с повешанной стальной кирасой. Используется патрульными."
	body_parts_covered = COVERAGE_VEST
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "patrol"
	item_state = "patrol"
	armor = ARMOR_CUIRASS
	allowed_race = NON_DWARVEN_RACE_TYPES
	allowed_sex = list(FEMALE)
	nodismemsleeves = TRUE
	blocking_behavior = null
	max_integrity = 300
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_MEDIUM
	smelt_bar_num = 2
	boobed_detail = FALSE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	slot_flags = ITEM_SLOT_ARMOR
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "shirt"

/obj/item/clothing/suit/roguetown/shirt/dress/alizeria/library
	name = "librarian's dress"
	desc = "Простенькое платье библиотекаря. Кажется местами чудом сохраняется пыль, как не пытаться её убирать."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "library"
	item_state = "library"
	boobed = TRUE
	allowed_sex = list(FEMALE)
	allowed_race = NON_DWARVEN_RACE_TYPES
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	slot_flags = ITEM_SLOT_ARMOR
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "shirt"

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/alizeria/jandarms/jandarm
	name = "the uniform of a gendarme"
	desc = "Строгая и практичная униформа жандармов. Покрыта лёгкими, но прочными пластинами."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "jandararmor"
	item_state = "jandararmor"
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_CHOP)
	armor = ARMOR_PADDED_GOOD
	sellprice = 50
	sewrepair = TRUE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	boobed = TRUE
	allowed_race = NON_DWARVEN_RACE_TYPES
	color = null
	slot_flags = ITEM_SLOT_ARMOR
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "shirt"

/obj/item/clothing/suit/roguetown/shirt/dress/alizeria/jandarms/instructor
	name = "instructor's vest"
	desc = "Качественный жилет инструктора жандармерии. Красив, но никак не защищает владельца."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "instructor"
	item_state = "instructor"
	boobed = TRUE
	allowed_race = NON_DWARVEN_RACE_TYPES
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "shirt"

/obj/item/clothing/suit/roguetown/shirt/dress/alizeria/jandarms/studyone
	name = "academic's robe"
	desc = "Роба учеников академии жандармов. Выглядит весьма дёшево."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "studyone"
	item_state = "studyone"
	boobed = TRUE
	allowed_race = NON_DWARVEN_RACE_TYPES
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "shirt"

/obj/item/clothing/suit/roguetown/shirt/dress/alizeria/jandarms/studytwo
	name = "academician's vest"
	desc = "Жилет учеников академии жандармов. Выглядит весьма дёшево."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "studytwo"
	item_state = "studytwo"
	boobed = TRUE
	allowed_sex = list(FEMALE)
	allowed_race = NON_DWARVEN_RACE_TYPES
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "shirt"

/obj/item/clothing/under/roguetown/tights/alizeria/jandarms/instructor
	name = "officer's trousers"
	desc = "Строгие брюки офицера жандармерии."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "inspants"
	item_state = "inspants"
	allowed_race = NON_DWARVEN_RACE_TYPES

/obj/item/clothing/under/roguetown/tights/alizeria/jandarms/studypants
	name = "academician's trousers"
	desc = "Обычные брюки академика жандармерии. Кажется проделать им дырку возможно даже пальцем."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "studypants"
	item_state = "studypants"
	allowed_race = NON_DWARVEN_RACE_TYPES

/obj/item/clothing/gloves/roguetown/alizeria/noblegloves
	name = "noble gloves"
	desc = "Роскошные перчатки, которые часто носят дворяне. Тяжело стираются."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "noblegloves"
	item_state = "noblegloves"
	armor = ARMOR_GLOVES_LEATHER
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	max_integrity = 100
	resistance_flags = FIRE_PROOF
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	salvage_result = /obj/item/natural/hide/cured
	unarmed_bonus = 1.1
	allowed_race = NON_DWARVEN_RACE_TYPES

/obj/item/clothing/gloves/roguetown/alizeria/noblegloves/alt
	icon_state = "noblegloves2"
	item_state = "noblegloves2"

/obj/item/clothing/cloak/jandarms/cief
	name = "coat of the marshall"
	desc = "Роскошный плащ, что хорошо греет владельца."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "ciefcoat"
	item_state = "ciefcoat"
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "ciefcoat"
	slot_flags = ITEM_SLOT_CLOAK
	sellprice = 50
	nodismemsleeves = TRUE
	slot_flags = ITEM_SLOT_CLOAK
	allowed_race = NON_DWARVEN_RACE_TYPES
	allowed_sex = list(FEMALE)

/obj/item/clothing/head/roguetown/helmet/jandarms/jandarm
	name = "helmet of a gendarme"
	desc = "Обычный шлем кавалериста. В меру защищает голову и уши носителя."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "janhelmet"
	item_state = "janhelmet"
	max_integrity = 215
	body_parts_covered = HEAD|HAIR|EARS
	armor = ARMOR_HEAD_HELMET

/obj/item/clothing/head/roguetown/jandarms/cief
	name = "cap of gendarmes"
	desc = "В меру строгая фуражка шефа жандармов."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "ciefhat"
	item_state = "ciefhat"
	sewrepair = TRUE

/obj/item/clothing/shoes/roguetown/boots/jandarms/cief
	name = "luxury boots"
	//dropshrink = 0.75
	desc = "Роскошные сапоги шефа жандармов. Ими убили не одного смерда."
	gender = PLURAL
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "ciefboots"
	item_state = "ciefboots"
	sewrepair = TRUE
	armor = ARMOR_BOOTS_BAD
	allowed_sex = list(FEMALE)
	salvage_amount = 2
	salvage_result = /obj/item/natural/hide/cured
	color = null

/obj/item/clothing/cloak/jandarms/jandarm
	name = "the cloak of the gendarmes"
	desc = "Качественный плащ, способный уберечь владельца от дождя и грязи."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "jancoat"
	item_state = "jancoat"
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "jancoat"
	slot_flags = ITEM_SLOT_CLOAK
	sellprice = 50
	nodismemsleeves = TRUE
	slot_flags = ITEM_SLOT_CLOAK
	allowed_race = NON_DWARVEN_RACE_TYPES

/obj/item/clothing/suit/roguetown/armor/leather/jacket/alizeria/necromist/coat
	name = "necromist coat"
	desc = "Мрачное пальто из странной на ощуп кожи."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "necromistcoat"
	item_state = "necromistcoat"
	boobed = TRUE
	allowed_race = NON_DWARVEN_RACE_TYPES
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "shirt"

/obj/item/clothing/suit/roguetown/shirt/dress/alizeria/priarmor
	name = "priestess's robe"
	desc = "Роскошная роба жрицы. Выглядит в меру богато, и в меру бедно."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "priarmor"
	item_state = "priarmor"
	boobed = TRUE
	allowed_sex = list(FEMALE)
	allowed_race = NON_DWARVEN_RACE_TYPES
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	slot_flags = ITEM_SLOT_ARMOR
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "shirt"

/obj/item/clothing/shoes/roguetown/boots/jandarms/priboots
	name = "priestess's boots"
	//dropshrink = 0.75
	desc = "Роскошные сапоги жрицы. Чудом не пачкаются в грязи."
	gender = PLURAL
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "priboots"
	item_state = "priboots"
	sewrepair = TRUE
	armor = ARMOR_BOOTS_BAD
	allowed_sex = list(FEMALE)
	salvage_amount = 2
	salvage_result = /obj/item/natural/hide/cured
	color = null

/obj/item/clothing/cloak/stabard/townhood
	name = "guard hood"
	desc = "A hood with the town's heraldic colors."
	color = "#3a7a29"
	detail_tag = "_spl"
	detail_color = "#0b1e06"
	icon_state = "guard_hood"
	item_state = "guard_hood"
	body_parts_covered = CHEST

/obj/item/storage/belt/rogue/leather/battleskirt/town
	color = "#3a7a29"

/obj/item/clothing/gloves/roguetown/alizeria/necrogloves
	name = "necromist gloves"
	desc = "Роскошные перчатки от которых несёт трупным запахом."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "necrogloves"
	item_state = "necrogloves"
	armor = ARMOR_GLOVES_LEATHER
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	max_integrity = 100
	resistance_flags = FIRE_PROOF
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	salvage_result = /obj/item/natural/hide/cured
	unarmed_bonus = 1.1
	allowed_race = NON_DWARVEN_RACE_TYPES

/obj/item/clothing/suit/roguetown/armor/alizeria/jandarms/chief/jacket
	slot_flags = ITEM_SLOT_ARMOR
	name = "jacket of the marshall"
	desc = "Роскошная куртка шефа жандармов."
	body_parts_covered = COVERAGE_VEST
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "ciefjacket"
	item_state = "ciefjacket"
	armor = ARMOR_CUIRASS
	allowed_race = NON_DWARVEN_RACE_TYPES
	allowed_sex = list(FEMALE, MALE)
	nodismemsleeves = TRUE
	blocking_behavior = null
	max_integrity = 300
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_MEDIUM
	smelt_bar_num = 2
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sellprice = 120
	armor = ARMOR_LEATHER
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	blade_dulling = DULLING_BASHCHOP
	armor_class = ARMOR_CLASS_LIGHT
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	slot_flags = ITEM_SLOT_ARMOR
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "shirt"

/obj/item/clothing/cloak/jandarms/cief/alt
	name = "mastall half-cloak"
	desc = "Роскошный полуплащ шефа жандармов. Носит более декоративный характер, нежели практичный."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "ciefcoatalt"
	item_state = "ciefcoatalt"
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "ciefcoatalt"
	slot_flags = ITEM_SLOT_CLOAK
	sellprice = 50
	nodismemsleeves = TRUE
	slot_flags = ITEM_SLOT_CLOAK
	allowed_race = NON_DWARVEN_RACE_TYPES
	allowed_sex = list(FEMALE, MALE)

/obj/item/clothing/suit/roguetown/shirt/dress/alizeria/whorearmor
	name = "oriental bra"
	desc = "Восточный вульгарный лифчик. Пользуется популярностью среди шлюх."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "whorearmor"
	item_state = "whorearmor"
	boobed = TRUE
	allowed_race = NON_DWARVEN_RACE_TYPES
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "shirt"
	allowed_sex = list(FEMALE)

/obj/item/clothing/shoes/roguetown/boots/whoreboots
	name = "golden sandals"
	//dropshrink = 0.75
	desc = "Позолоченные сандали. Выглядят дорого, но для владельца весьма неудобны."
	gender = PLURAL
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "whoreboots"
	item_state = "whoreboots"
	sewrepair = TRUE
	armor = ARMOR_BOOTS_BAD
	allowed_sex = list(FEMALE)
	salvage_amount = 2
	salvage_result = /obj/item/natural/hide/cured
	color = null

/obj/item/clothing/under/roguetown/tights/alizeria/whorepants
	name = "oriental trousers"
	desc = "Открытая восточная юбка."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "whorepants"
	item_state = "whorepants"
	allowed_race = NON_DWARVEN_RACE_TYPES
	allowed_sex = list(FEMALE)

/obj/item/clothing/suit/roguetown/shirt/dress/alizeria/maidendress
	name = "exotic maiden dress"
	desc = "Роскошное платье служанки. Часто используется слугами знатных господ."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "maiden"
	item_state = "maiden"
	boobed = TRUE
	allowed_race = NON_DWARVEN_RACE_TYPES
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "shirt"
	allowed_sex = list(FEMALE)

/obj/item/clothing/gloves/roguetown/alizeria/maidengloves
	name = "maiden gloves"
	desc = "Обычные перчатки служанки. На них виднеются весьма неаккуратные штришки."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "maidgloves"
	item_state = "maidgloves"
	armor = ARMOR_GLOVES_LEATHER
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	max_integrity = 100
	resistance_flags = FIRE_PROOF
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	salvage_result = /obj/item/natural/hide/cured
	unarmed_bonus = 1.1
	allowed_race = NON_DWARVEN_RACE_TYPES
	allowed_sex = list(FEMALE)

/obj/item/clothing/suit/roguetown/shirt/dress/alizeria/maidendressu
	name = "maiden dress"
	desc = "Обычное платье служанки."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "maid"
	item_state = "maid"
	boobed = TRUE
	allowed_race = NON_DWARVEN_RACE_TYPES
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "shirt"
	allowed_sex = list(FEMALE)

/obj/item/clothing/head/roguetown/alizeria/maidhat
	name = "maid hat"
	icon = 'icons/roguetown/alizeria/armor.dmi'
	icon_state = "maidhat"
	item_state = "maidhat"
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	sewrepair = TRUE

///////////////////////////////////////
// NK ITEMS
/obj/item/clothing/head/roguetown/grenzelhofthat/nk
	altdetail_color = "#c1b144"
	color = "#414143"
	detail_color = "#c1b144"

/obj/item/clothing/suit/roguetown/armor/gambeson/nk
	color = "#414143"

/obj/item/storage/belt/rogue/leather/battleskirt/nk
	color = "#414143"

/obj/item/clothing/head/roguetown/helmet/otavan/nk
	color = "#414143"
	detail_color = "#c1b144"

/obj/item/clothing/cloak/championt/nk
	name = "champion's cape"
	desc = "A cape with a gold embroided heraldry of Scarlet Reach, worn by the realm's champion."
	icon = 'icons/roguetown/clothing/special/champion.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/champion.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/champion.dmi'
	sleevetype = "shirt"
	icon_state = "champcloak"
	detail_tag = "_detail"
	detail_color = "#414143"
	alternate_worn_layer = CLOAK_BEHIND_LAYER

/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/ornate/nk
	color = "#414143"

/obj/item/clothing/under/roguetown/platelegs/nk
	color = "#414143"

/obj/item/clothing/wrists/roguetown/bracers/nk
	color = "#414143"

/obj/item/clothing/cloak/raincloak/furcloak/nk
	color = "#414143"

/obj/item/clothing/cloak/tstabard/townguard/nk
	color = "#414143"
	detail_color = "#c1b144"

/////////////////////////////
/obj/item/clothing/suit/roguetown/armor/alizeria/lord/guard
	slot_flags = ITEM_SLOT_ARMOR
	name = "royal cuirass"
	desc = "Роскошная кираса придворного гвардейца. Возможно защитит от пули."
	body_parts_covered = COVERAGE_VEST
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "goldchest"
	item_state = "goldchest"
	armor = ARMOR_CUIRASS
	allowed_race = NON_DWARVEN_RACE_TYPES
	allowed_sex = list(FEMALE, MALE)
	nodismemsleeves = TRUE
	blocking_behavior = null
	max_integrity = 300
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_MEDIUM
	smelt_bar_num = 2
	boobed_detail = FALSE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	slot_flags = ITEM_SLOT_ARMOR
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "goldchest"

/obj/item/clothing/suit/roguetown/armor/gambeson/alizeria/guardalt
	name = "guardian jacket"
	desc = "Качественный дублет королевской гвардии."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "guardian"
	item_state = "guardian"
	allowed_race = NON_DWARVEN_RACE_TYPES
	allowed_sex = list(FEMALE, MALE)
	nodismemsleeves = TRUE
	max_integrity = 300
	smelt_bar_num = 2
	sellprice = 60
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "shirt"

////////////////////
// ВЕДЬМА
/obj/item/clothing/suit/roguetown/shirt/dress/alizeria/witch
	name = "witch dress"
	desc = "Мрачное платье ведьмы. Пропитано трупным запахом."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "witchdress"
	item_state = "witchdress"
	boobed = TRUE
	allowed_race = NON_DWARVEN_RACE_TYPES
	color = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "shirt"
	allowed_sex = list(FEMALE)

/obj/item/clothing/gloves/roguetown/alizeria/witchgloves
	name = "witch gloves"
	desc = "Кожаные чёрные перчатки. На них удачно скрывается засохшая кровь."
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "witchgloves"
	item_state = "witchgloves"
	armor = ARMOR_GLOVES_LEATHER
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	max_integrity = 100
	resistance_flags = FIRE_PROOF
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	salvage_result = /obj/item/natural/hide/cured
	unarmed_bonus = 1.1
	allowed_race = NON_DWARVEN_RACE_TYPES
	allowed_sex = list(FEMALE)

/obj/item/clothing/cloak/alizeria/witchcloak
	name = "witch cloak"
	desc = "Мрачный плащ ведьмы."
	color = null
	icon = 'icons/roguetown/alizeria/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon_state = "witchcloak"
	item_state = "witchcloak"
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	slot_flags = ITEM_SLOT_BACK_R|ITEM_SLOT_CLOAK
//	body_parts_covered = ARMS|CHEST
	boobed = TRUE
	sleeved = 'icons/roguetown/alizeria/armoronmob.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	inhand_mod = TRUE
	hoodtype = /obj/item/clothing/head/hooded/alizeria/witchhood
	toggle_icon_state = FALSE
	salvage_result = /obj/item/natural/hide/cured
	allowed_race = NON_DWARVEN_RACE_TYPES
	allowed_sex = list(FEMALE)

/obj/item/clothing/head/hooded/alizeria/witchhood
	name = "hood"
	desc = "This one will shelter me from the weather and my identity too."
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon = 'icons/roguetown/alizeria/armor.dmi'
	icon_state = "witchhood"
	item_state = "witchhood"
	slot_flags = ITEM_SLOT_HEAD
	dynamic_hair_suffix = ""
	edelay_type = 1
	body_parts_covered = HEAD
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDETAIL
	block2add = FOV_BEHIND

/obj/item/clothing/head/roguetown/helmet/blacksteel/modern/alizeria/sheriffhelmet
	name = "sturdy armet"
	desc = "Крайне качественный шлем из стали, которую умелые мастера смогли довести до качества чёрностали."
	body_parts_covered = FULL_HEAD
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon = 'icons/roguetown/alizeria/armor.dmi'
	icon_state = "sheriffhelmet"
	item_state = "sheriffhelmet"
	flags_inv = HIDEEARS|HIDEFACE|HIDESNOUT|HIDEHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = ARMOR_PLATE_BSTEEL
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST, BCLASS_PICK)
	block2add = FOV_BEHIND
	max_integrity = 850
	smeltresult = /obj/item/ingot/blacksteel
	smelt_bar_num = 2

/obj/item/clothing/suit/roguetown/armor/plate/full/alizeria/sheriffchest
	name = "sturdy plate"
	mob_overlay_icon = 'icons/roguetown/alizeria/armoronmob.dmi'
	icon = 'icons/roguetown/alizeria/armor.dmi'
	icon_state = "sheriffarmor"
	item_state = "sheriffarmor"
	desc = "Крепкие латы, идеальные подогнанные под своего заказчика.."

	equip_delay_self = 10 SECONDS
	unequip_delay_self = 10 SECONDS

	max_integrity = 1200