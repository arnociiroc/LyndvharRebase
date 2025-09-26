/datum/advclass/cleric
	name = "Wandering Monk"
	tutorial = "You are a wandering acolyte, versed in both miracles and martial arts. You forgo the heavy armor worn by paladins in favor of a more nimble approach to combat, utilizing your fists."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	vampcompat = FALSE
	outfit = /datum/outfit/job/roguetown/adventurer/cleric
	category_tags = list(CTAG_ADVENTURER, CTAG_COURTAGENT)
	class_select_category = CLASS_CAT_CLERIC
	traits_applied = list(TRAIT_DODGEEXPERT, TRAIT_CIVILIZEDBARBARIAN)
	subclass_stats = list(
		STATKEY_STR = 2,
		STATKEY_WIL = 2,
		STATKEY_CON = 2,
		STATKEY_SPD = 1,
	)
	subclass_skills = list(
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/unarmed = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/magic/holy = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/sewing = SKILL_LEVEL_APPRENTICE
	)
	// One of you is gonna look at me and act like I am stupid. It is a form of disguise
	// Also because the alternative is not very clean codewise.
	subclass_stashed_items = list(
		"The Verses and Acts of the Ten" = /obj/item/book/rogue/bibble,
		"Of Psydon" = /obj/item/book/rogue/bibble/psy
	)

/datum/outfit/job/roguetown/adventurer/cleric
	allowed_patrons = ALL_PATRONS

/datum/outfit/job/roguetown/adventurer/cleric/pre_equip(mob/living/carbon/human/H)
	..()

	// Add druidic skill for Dendor followers
	if(istype(H.patron, /datum/patron/divine/dendor))
		H.adjust_skillrank(/datum/skill/magic/druidic, 3, TRUE)
		to_chat(H, span_notice("As a follower of Dendor, you have innate knowledge of druidic magic."))

	to_chat(H, span_warning("You are a wandering acolyte, versed in both miracles and martial arts. You forego the heavy armor paladins wear in favor of a more nimble approach to combat, utilizing your fists."))
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/monk
	pants = /obj/item/clothing/under/roguetown/tights/black
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	shoes = /obj/item/clothing/shoes/roguetown/sandals
	backl = /obj/item/storage/backpack/rogue/satchel/short
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	backpack_contents = list(
		/obj/item/flashlight/flare/torch = 1, 
		/obj/item/recipe_book/survival = 1,
		/obj/item/mundane/adventurer_kit = 1
		)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_miracles(H, cleric_tier = CLERIC_T2, passive_gain = CLERIC_REGEN_MINOR, devotion_limit = CLERIC_REQ_2)	//Capped to T1 miracles.
	if(H.mind)
		var/weapons = list("Katar","Knuckle Dusters")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		switch(weapon_choice)
			if("Katar")
				backpack_contents += list(/obj/item/rogueweapon/katar = 1)
			if("Knuckle Dusters")
				backpack_contents += list(/obj/item/rogueweapon/knuckles/bronzeknuckles = 1)
	H.cmode_music = 'sound/music/combat_holy.ogg' // left in bc i feel like monk players want their darktide
	switch(H.patron?.type)
		if(/datum/patron/old_god)
			cloak = /obj/item/clothing/cloak/psydontabard
			head = /obj/item/clothing/head/roguetown/roguehood/psydon
		if(/datum/patron/divine/astrata)
			head = /obj/item/clothing/head/roguetown/roguehood/astrata
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/astrata
		if(/datum/patron/divine/noc)
			head =  /obj/item/clothing/head/roguetown/nochood
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/noc
		if(/datum/patron/divine/abyssor)
			head = /obj/item/clothing/head/roguetown/roguehood/abyssor
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/abyssor
		if(/datum/patron/divine/dendor)
			head = /obj/item/clothing/head/roguetown/dendormask
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
		if(/datum/patron/divine/necra)
			head = /obj/item/clothing/head/roguetown/necrahood
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/necra
		if (/datum/patron/divine/malum)
			head = /obj/item/clothing/head/roguetown/roguehood //placeholder
			cloak = /obj/item/clothing/cloak/templar/malumite
		if (/datum/patron/divine/eora)
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/eora
			head = /obj/item/clothing/head/roguetown/eoramask
		if (/datum/patron/divine/xylix)
			cloak = /obj/item/clothing/cloak/templar/xylix
		else
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe //placeholder, anyone who doesn't have cool patron drip sprites just gets generic robes
			head = /obj/item/clothing/head/roguetown/roguehood
	switch(H.patron?.type)
		if(/datum/patron/old_god)
			neck = /obj/item/clothing/neck/roguetown/psicross
		if(/datum/patron/divine/undivided)
			neck = /obj/item/clothing/neck/roguetown/psicross/undivided
		if(/datum/patron/divine/astrata)
			neck = /obj/item/clothing/neck/roguetown/psicross/astrata
			H.cmode_music = 'sound/music/cmode/church/combat_astrata.ogg'
		if(/datum/patron/divine/noc)
			neck = /obj/item/clothing/neck/roguetown/psicross/noc
		if(/datum/patron/divine/abyssor)
			neck = /obj/item/clothing/neck/roguetown/psicross/abyssor
		if(/datum/patron/divine/dendor)
			neck = /obj/item/clothing/neck/roguetown/psicross/dendor
			H.cmode_music = 'sound/music/cmode/garrison/combat_warden.ogg' // see: druid.dm
		if(/datum/patron/divine/necra)
			neck = /obj/item/clothing/neck/roguetown/psicross/necra
			H.cmode_music = 'sound/music/cmode/church/combat_necra.ogg'
		if(/datum/patron/divine/pestra)
			neck = /obj/item/clothing/neck/roguetown/psicross/pestra
		if(/datum/patron/divine/ravox)
			neck = /obj/item/clothing/neck/roguetown/psicross/ravox
		if(/datum/patron/divine/malum)
			neck = /obj/item/clothing/neck/roguetown/psicross/malum
		if(/datum/patron/divine/eora)
			neck = /obj/item/clothing/neck/roguetown/psicross/eora
			H.cmode_music = 'sound/music/cmode/church/combat_eora.ogg'
		if(/datum/patron/inhumen/zizo)
			H.cmode_music = 'sound/music/combat_heretic.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/inhumen/matthios)
			H.cmode_music = 'sound/music/combat_matthios.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/inhumen/graggar)
			H.cmode_music = 'sound/music/combat_graggar.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/inhumen/baotha)
			H.cmode_music = 'sound/music/combat_baotha.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/divine/xylix)
			neck = /obj/item/clothing/neck/roguetown/luckcharm
			H.cmode_music = 'sound/music/combat_jester.ogg'

/datum/advclass/cleric/paladin
	name = "Paladin"
	tutorial = "A holy warrior. Where others of the clergy may have spent their free time studying scriptures, you have instead honed your skills with a blade."
	outfit = /datum/outfit/job/roguetown/adventurer/paladin
	traits_applied = list(TRAIT_MEDIUMARMOR)
	subclass_stats = list(
		STATKEY_STR = 2,
		STATKEY_WIL = 1,
		STATKEY_CON = 2,
		STATKEY_INT = 1,
		STATKEY_PER = 1
	)
	subclass_skills = list(
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/maces = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/magic/holy = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/armorsmithing = SKILL_LEVEL_NOVICE
	)
	subclass_stashed_items = list(
		"The Verses and Acts of the Ten" = /obj/item/book/rogue/bibble,
		"Of Psydon" = /obj/item/book/rogue/bibble/psy
	)

/datum/outfit/job/roguetown/adventurer/paladin/pre_equip(mob/living/carbon/human/H)
	to_chat(H, span_warning("A holy warrior. Where others of the clergy may have spent their free time studying scriptures, you have instead honed your skills with a blade."))
	belt = /obj/item/storage/belt/rogue/leather
	backl = /obj/item/storage/backpack/rogue/satchel/short
	backr = /obj/item/rogueweapon/shield/iron
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/iron
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
	wrists = /obj/item/clothing/wrists/roguetown/bracers/iron
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	gloves = /obj/item/clothing/gloves/roguetown/chain/iron
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	backpack_contents = list(
		/obj/item/flashlight/flare/torch = 1,
		/obj/item/recipe_book/survival = 1,
		/obj/item/mundane/adventurer_kit = 1
		)
	H.cmode_music = 'sound/music/cmode/church/combat_reckoning.ogg'
	switch(H.patron?.type)
		if(/datum/patron/old_god)
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half/fluted/ornate
			cloak = /obj/item/clothing/cloak/psydontabard
			if(H.mind)
				var/helmets = list("Armet","Bucket Helm")
				var/helmet_choice = input(H, "Choose your Psydonian Helm", "WALK IN HIS LIGHT") as anything in helmets
				switch(helmet_choice)
					if("Bucket Helm")
						head = /obj/item/clothing/head/roguetown/helmet/heavy/psybucket
					if("Armet")
						head = /obj/item/clothing/head/roguetown/helmet/heavy/psydonhelm
		if(/datum/patron/divine/astrata)
			cloak = /obj/item/clothing/cloak/templar/astrata
			head = /obj/item/clothing/head/roguetown/helmet/heavy/astratan
		if(/datum/patron/divine/noc)
			cloak = /obj/item/clothing/cloak/templar/noc
			head = /obj/item/clothing/head/roguetown/helmet/heavy/nochelm
		if(/datum/patron/divine/abyssor)
			cloak = /obj/item/clothing/cloak/abyssortabard
			head = /obj/item/clothing/head/roguetown/helmet/heavy/abyssorgreathelm
		if(/datum/patron/divine/dendor)
			cloak = /obj/item/clothing/cloak/templar/dendor
			head = /obj/item/clothing/head/roguetown/helmet/heavy/dendorhelm
		if(/datum/patron/divine/necra)
			cloak = /obj/item/clothing/cloak/templar/necra
			head = /obj/item/clothing/head/roguetown/helmet/heavy/necrahelm
		if (/datum/patron/divine/malum)
			cloak = /obj/item/clothing/cloak/templar/malum
			head = /obj/item/clothing/head/roguetown/helmet/heavy/malum
		if (/datum/patron/divine/eora)
			cloak = /obj/item/clothing/cloak/templar/eora
			head = /obj/item/clothing/head/roguetown/helmet/heavy/eoran
		if (/datum/patron/divine/ravox)
			cloak = /obj/item/clothing/cloak/cleric/ravox
			head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket/gold
		if (/datum/patron/divine/xylix)
			cloak = /obj/item/clothing/cloak/templar/xylix
			head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket
		if (/datum/patron/divine/pestra)
			cloak = /obj/item/clothing/cloak/templar/pestra
			head = /obj/item/clothing/head/roguetown/helmet/heavy/pestran
		else
			cloak = /obj/item/clothing/cloak/cape/crusader
			head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_miracles(H, cleric_tier = CLERIC_T2, passive_gain = CLERIC_REGEN_MINOR, devotion_limit = CLERIC_REQ_2)	//Capped to T1 miracles.
	if(H.mind)
		var/weapons = list("Longsword","Mace","Flail")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		switch(weapon_choice)
			if("Longsword")
				if(HAS_TRAIT(H, TRAIT_PSYDONIAN_GRIT))
					beltr = /obj/item/rogueweapon/sword/long/oldpsysword
				else
					beltr = /obj/item/rogueweapon/sword/long
				r_hand = /obj/item/rogueweapon/scabbard/sword
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_JOURNEYMAN, TRUE)
			if("Mace")
				H.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_JOURNEYMAN, TRUE)
				if(HAS_TRAIT(H, TRAIT_PSYDONIAN_GRIT))
					beltr = /obj/item/rogueweapon/mace/cudgel/psy/old
				else
					beltr = /obj/item/rogueweapon/mace
			if("Flail")
				H.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, SKILL_LEVEL_JOURNEYMAN, TRUE)
				beltr = /obj/item/rogueweapon/flail
	H.set_blindness(0)
	switch(H.patron?.type)
		if(/datum/patron/old_god)
			neck = /obj/item/clothing/neck/roguetown/psicross
		if(/datum/patron/divine/undivided)
			neck = /obj/item/clothing/neck/roguetown/psicross/undivided
		if(/datum/patron/divine/astrata)
			neck = /obj/item/clothing/neck/roguetown/psicross/astrata
			H.cmode_music = 'sound/music/cmode/church/combat_astrata.ogg'
		if(/datum/patron/divine/noc)
			neck = /obj/item/clothing/neck/roguetown/psicross/noc
		if(/datum/patron/divine/abyssor)
			neck = /obj/item/clothing/neck/roguetown/psicross/abyssor
		if(/datum/patron/divine/dendor)
			neck = /obj/item/clothing/neck/roguetown/psicross/dendor
			H.cmode_music = 'sound/music/cmode/garrison/combat_warden.ogg' // see: druid.dm
		if(/datum/patron/divine/necra)
			neck = /obj/item/clothing/neck/roguetown/psicross/necra
			H.cmode_music = 'sound/music/cmode/church/combat_necra.ogg'
		if(/datum/patron/divine/pestra)
			neck = /obj/item/clothing/neck/roguetown/psicross/pestra
		if(/datum/patron/divine/ravox)
			neck = /obj/item/clothing/neck/roguetown/psicross/ravox
		if(/datum/patron/divine/malum)
			neck = /obj/item/clothing/neck/roguetown/psicross/malum
		if(/datum/patron/divine/eora)
			neck = /obj/item/clothing/neck/roguetown/psicross/eora
			H.cmode_music = 'sound/music/cmode/church/combat_eora.ogg'
		if(/datum/patron/inhumen/zizo)
			H.cmode_music = 'sound/music/combat_heretic.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/inhumen/matthios)
			H.cmode_music = 'sound/music/combat_matthios.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/inhumen/graggar)
			H.cmode_music = 'sound/music/combat_graggar.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/inhumen/baotha)
			H.cmode_music = 'sound/music/combat_baotha.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/divine/xylix)
			neck = /obj/item/clothing/neck/roguetown/luckcharm
			H.cmode_music = 'sound/music/combat_jester.ogg'

/datum/advclass/cleric/cantor
	name = "Cantor"
	tutorial = "You were a bard once - but you've found a new calling. Your eyes have been opened to the divine, now you wander from city to city singing songs and telling tales of your patron's greatness."
	outfit = /datum/outfit/job/roguetown/adventurer/cantor
	traits_applied = list(TRAIT_DODGEEXPERT, TRAIT_EMPATH)
	subclass_stats = list(
		STATKEY_STR = -1,
		STATKEY_WIL = 1,
		STATKEY_SPD = 2,
		STATKEY_INT = 3,
		STATKEY_PER = 2
	)
	subclass_skills = list(
		/datum/skill/misc/music = SKILL_LEVEL_EXPERT,
		/datum/skill/magic/holy = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/sewing = SKILL_LEVEL_NOVICE
	)
	subclass_stashed_items = list(
		"The Verses and Acts of the Ten" = /obj/item/book/rogue/bibble,
		"Of Psydon" = /obj/item/book/rogue/bibble/psy
	)
	
/datum/outfit/job/roguetown/adventurer/cantor/pre_equip(mob/living/carbon/human/H)
	to_chat(H, span_warning("You were a bard once - but you've found a new calling. Your eyes have been opened to the divine, now you wander from city to city singing songs and telling tales of your patron's greatness."))
	head = /obj/item/clothing/head/roguetown/bardhat
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
	backl = /obj/item/storage/backpack/rogue/satchel/short
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather/knifebelt/iron
	beltr = /obj/item/rogueweapon/huntingknife/idagger
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_miracles(H, cleric_tier = CLERIC_T1, passive_gain = CLERIC_REGEN_DEVOTEE, devotion_limit = CLERIC_REQ_1)	//Capped to T1 miracles.
	backpack_contents = list(
		/obj/item/flashlight/flare/torch = 1,
		/obj/item/recipe_book/survival = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/mundane/adventurer_kit = 1
		)
	H.cmode_music = 'sound/music/cmode/church/combat_reckoning.ogg'
	H.mind?.AddSpell(new /obj/effect/proc_holder/spell/invoked/mockery)
	switch(H.patron?.type)
		if(/datum/patron/old_god)
			cloak = /obj/item/clothing/cloak/templar/psydon
		if(/datum/patron/divine/astrata)
			cloak = /obj/item/clothing/cloak/templar/astrata
		if(/datum/patron/divine/noc)
			cloak = /obj/item/clothing/cloak/templar/noc
		if(/datum/patron/divine/abyssor)
			cloak = /obj/item/clothing/cloak/templar/abyssor
		if(/datum/patron/divine/dendor)
			cloak = /obj/item/clothing/cloak/templar/dendor
		if(/datum/patron/divine/necra)
			cloak = /obj/item/clothing/cloak/templar/necra
		if (/datum/patron/divine/malum)
			cloak = /obj/item/clothing/cloak/templar/malum
		if (/datum/patron/divine/eora)
			cloak = /obj/item/clothing/cloak/templar/eora
		if (/datum/patron/divine/ravox)
			cloak = /obj/item/clothing/cloak/templar/ravox
		if (/datum/patron/divine/xylix)
			cloak = /obj/item/clothing/cloak/templar/xylix
		if (/datum/patron/divine/pestra)
			cloak = /obj/item/clothing/cloak/templar/pestra
		else
			cloak = /obj/item/clothing/cloak/cape/crusader
	if(H.mind)
		var/weapons = list("Harp","Lute","Accordion","Guitar","Hurdy-Gurdy","Viola","Vocal Talisman")
		var/weapon_choice = input(H, "Choose your instrument.", "TAKE UP ARMS") as anything in weapons
		H.set_blindness(0)
		switch(weapon_choice)
			if("Harp")
				backr = /obj/item/rogue/instrument/harp
			if("Lute")
				backr = /obj/item/rogue/instrument/lute
			if("Accordion")
				backr = /obj/item/rogue/instrument/accord
			if("Guitar")
				backr = /obj/item/rogue/instrument/guitar
			if("Hurdy-Gurdy")
				backr = /obj/item/rogue/instrument/hurdygurdy
			if("Viola")
				backr = /obj/item/rogue/instrument/viola
			if("Vocal Talisman")
				backr = /obj/item/rogue/instrument/vocals

	switch(H.patron?.type)
		if(/datum/patron/old_god)
			neck = /obj/item/clothing/neck/roguetown/psicross
		if(/datum/patron/divine/undivided)
			neck = /obj/item/clothing/neck/roguetown/psicross/undivided
		if(/datum/patron/divine/astrata)
			neck = /obj/item/clothing/neck/roguetown/psicross/astrata
			H.cmode_music = 'sound/music/cmode/church/combat_astrata.ogg'
		if(/datum/patron/divine/noc)
			neck = /obj/item/clothing/neck/roguetown/psicross/noc
		if(/datum/patron/divine/abyssor)
			neck = /obj/item/clothing/neck/roguetown/psicross/abyssor
		if(/datum/patron/divine/dendor)
			neck = /obj/item/clothing/neck/roguetown/psicross/dendor
			H.cmode_music = 'sound/music/cmode/garrison/combat_warden.ogg' // see: druid.dm
		if(/datum/patron/divine/necra)
			neck = /obj/item/clothing/neck/roguetown/psicross/necra
			H.cmode_music = 'sound/music/cmode/church/combat_necra.ogg'
		if(/datum/patron/divine/pestra)
			neck = /obj/item/clothing/neck/roguetown/psicross/pestra
		if(/datum/patron/divine/ravox)
			neck = /obj/item/clothing/neck/roguetown/psicross/ravox
		if(/datum/patron/divine/malum)
			neck = /obj/item/clothing/neck/roguetown/psicross/malum
		if(/datum/patron/divine/eora)
			neck = /obj/item/clothing/neck/roguetown/psicross/eora
			H.cmode_music = 'sound/music/cmode/church/combat_eora.ogg'
		if(/datum/patron/inhumen/zizo)
			H.cmode_music = 'sound/music/combat_heretic.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/inhumen/matthios)
			H.cmode_music = 'sound/music/combat_matthios.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/inhumen/graggar)
			H.cmode_music = 'sound/music/combat_graggar.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/inhumen/baotha)
			H.cmode_music = 'sound/music/combat_baotha.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/divine/xylix)
			neck = /obj/item/clothing/neck/roguetown/luckcharm
			H.cmode_music = 'sound/music/combat_jester.ogg'

/datum/advclass/cleric/missionary
	name = "Missionary"
	tutorial = "You are a devout worshipper of the divine with a strong connection to your patron god. You've spent years studying scriptures and serving your deity - now you wander into foreign lands, spreading the word of your faith."
	outfit = /datum/outfit/job/roguetown/adventurer/missionary
	traits_applied = list()
	subclass_stats = list(
		STATKEY_INT = 3,
		STATKEY_PER = 2,
		STATKEY_WIL = 1,
		STATKEY_SPD = 1,
	)
	subclass_skills = list(
		/datum/skill/combat/polearms = SKILL_LEVEL_APPRENTICE,
		/datum/skill/magic/holy = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/wrestling = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/sewing = SKILL_LEVEL_APPRENTICE
	)
	subclass_stashed_items = list(
		"The Verses and Acts of the Ten" = /obj/item/book/rogue/bibble,
		"Of Psydon" = /obj/item/book/rogue/bibble/psy
	)
	
/datum/outfit/job/roguetown/adventurer/missionary/pre_equip(mob/living/carbon/human/H)
	to_chat(H, span_warning("You are a devout worshipper of the divine with a strong connection to your patron god. You've spent years studying scriptures and serving your deity - now you wander into foreign lands, spreading the word of your faith."))
	backl = /obj/item/storage/backpack/rogue/satchel/short
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backr = /obj/item/rogueweapon/woodstaff
	belt = /obj/item/storage/belt/rogue/leather
	backpack_contents = list(
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/flashlight/flare/torch = 1,
		/obj/item/recipe_book/survival = 1,
		/obj/item/mundane/adventurer_kit = 1
		)
	H.cmode_music = 'sound/music/cmode/church/combat_reckoning.ogg'
	switch(H.patron?.type)
		if(/datum/patron/old_god)
			cloak = /obj/item/clothing/cloak/psydontabard
			head = /obj/item/clothing/head/roguetown/roguehood/psydon
		if(/datum/patron/divine/astrata)
			head = /obj/item/clothing/head/roguetown/roguehood/astrata
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/astrata
		if(/datum/patron/divine/noc)
			head =  /obj/item/clothing/head/roguetown/nochood
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/noc
		if(/datum/patron/divine/abyssor)
			head = /obj/item/clothing/head/roguetown/roguehood/abyssor
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/abyssor
		if(/datum/patron/divine/dendor)
			head = /obj/item/clothing/head/roguetown/dendormask
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
		if(/datum/patron/divine/necra)
			head = /obj/item/clothing/head/roguetown/necrahood
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/necra
		if (/datum/patron/divine/malum)
			head = /obj/item/clothing/head/roguetown/roguehood //placeholder
			cloak = /obj/item/clothing/cloak/templar/malumite
		if (/datum/patron/divine/eora)
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/eora
			head = /obj/item/clothing/head/roguetown/eoramask
			backpack_contents[/obj/item/reagent_containers/eoran_seed] = 1
		if (/datum/patron/divine/xylix)
			cloak = /obj/item/clothing/cloak/templar/xylix
		if(/datum/patron/inhumen/zizo)
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe 
			head = /obj/item/clothing/head/roguetown/roguehood
			H.mind?.AddSpell(new /obj/effect/proc_holder/spell/invoked/minion_order)
			H.mind?.AddSpell(new /obj/effect/proc_holder/spell/invoked/gravemark)
		else
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe //placeholder, anyone who doesn't have cool patron drip sprites just gets generic robes
			head = /obj/item/clothing/head/roguetown/roguehood
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_miracles(H, cleric_tier = CLERIC_T3, passive_gain = CLERIC_REGEN_MINOR, devotion_limit = CLERIC_REQ_3)	//Minor regen, capped to T3.
	if(istype(H.patron, /datum/patron/divine))
		H.mind?.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/divineblast)
	if(istype(H.patron, /datum/patron/inhumen))
		H.mind?.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/divineblast/unholyblast)
	switch(H.patron?.type)
		if(/datum/patron/old_god)
			neck = /obj/item/clothing/neck/roguetown/psicross
		if(/datum/patron/divine/undivided)
			neck = /obj/item/clothing/neck/roguetown/psicross/undivided
		if(/datum/patron/divine/astrata)
			neck = /obj/item/clothing/neck/roguetown/psicross/astrata
			H.cmode_music = 'sound/music/cmode/church/combat_astrata.ogg'
		if(/datum/patron/divine/noc)
			neck = /obj/item/clothing/neck/roguetown/psicross/noc
		if(/datum/patron/divine/abyssor)
			neck = /obj/item/clothing/neck/roguetown/psicross/abyssor
		if(/datum/patron/divine/dendor)
			neck = /obj/item/clothing/neck/roguetown/psicross/dendor
			H.cmode_music = 'sound/music/cmode/garrison/combat_warden.ogg' // see: druid.dm
		if(/datum/patron/divine/necra)
			neck = /obj/item/clothing/neck/roguetown/psicross/necra
			H.cmode_music = 'sound/music/cmode/church/combat_necra.ogg'
		if(/datum/patron/divine/pestra)
			neck = /obj/item/clothing/neck/roguetown/psicross/pestra
		if(/datum/patron/divine/ravox)
			neck = /obj/item/clothing/neck/roguetown/psicross/ravox
		if(/datum/patron/divine/malum)
			neck = /obj/item/clothing/neck/roguetown/psicross/malum
		if(/datum/patron/divine/eora)
			neck = /obj/item/clothing/neck/roguetown/psicross/eora
			H.cmode_music = 'sound/music/cmode/church/combat_eora.ogg'
		if(/datum/patron/inhumen/zizo)
			H.cmode_music = 'sound/music/combat_heretic.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/inhumen/matthios)
			H.cmode_music = 'sound/music/combat_matthios.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/inhumen/graggar)
			H.cmode_music = 'sound/music/combat_graggar.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/inhumen/baotha)
			H.cmode_music = 'sound/music/combat_baotha.ogg'
			ADD_TRAIT(H, TRAIT_HERESIARCH, TRAIT_GENERIC)
		if(/datum/patron/divine/xylix)
			neck = /obj/item/clothing/neck/roguetown/luckcharm
			H.cmode_music = 'sound/music/combat_jester.ogg'
