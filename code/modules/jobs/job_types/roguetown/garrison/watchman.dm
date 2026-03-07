/datum/job/roguetown/watchman
	title = "Watchman"
	f_title = "Watchwoman"
	flag = WATCHMAN
	department_flag = GARRISON
	faction = "Station"
	total_positions = 8
	spawn_positions = 8
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
	allowed_patrons = ALL_PATRONS
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_IMMORTAL)
	tutorial = "Whether it was through a conscription or a want to do good and serve the city, you are one of the many city guard dotted the walls and streets. Responsible for the safety of the port city and the enforcement of the law, you are the vanguard of the city faced with punishing those who defy the Viscount and their laws. Life is difficult and danger often lurks around every single alley, but you find great camaraderie in your fellow men and women of the watch. Hopefully the city will endure another week with you protecting it."
	display_order = JDO_WATCHMAN
	whitelist_req = FALSE

	outfit = /datum/outfit/job/roguetown/watchman
	advclass_cat_rolls = list(CTAG_WATCH = 20)

	give_bank_account = 20
	min_pq = 0
	max_pq = null
	round_contrib_points = 2

	cmode_music = 'sound/music/combat_ManAtArms.ogg'

	job_traits = list(TRAIT_GUARDSMAN, TRAIT_STEELHEARTED)
	job_subclasses = list(
		/datum/advclass/watchman/footsman,
		/datum/advclass/watchman/archer,
		/datum/advclass/watchman/dungeoneer,
		)

/datum/outfit/job/roguetown/watchman
	job_bitflag = BITFLAG_GARRISON

/datum/job/roguetown/guardsman/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/tabard/stabard/surcoat/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "watchman jupon ([index])"

/obj/item/storage/backpack/rogue/satchel/short/black
	color = CLOTHING_BLACK

/datum/outfit/job/roguetown/guardsman
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	cloak = /obj/item/clothing/cloak/tabard/stabard/surcoat/guard
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	neck = /obj/item/clothing/neck/roguetown/gorget
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	belt = /obj/item/storage/belt/rogue/leather/black
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	backr = /obj/item/storage/backpack/rogue/satchel/short/black

/*Design philosophy: Men and women from various areas of life, from hunters to street-brawlers and more 'veteran' levy-men. Know less skills overall than Bog, but far more specialized.
Footsman is basically a regular foots-soldier with gear to combat criminals, specializes in maces, polearms, and decent flail/sword training.
Archer is basically a 'bounty-catcher' in function, less specialized at close-quarters, beyond knives, but very capable of downing a fleeing criminal.*/
/datum/advclass/watchman/footsman
	name = "Watch Footman"
	tutorial = "You are a footman of the Town Watch. Well versed in various close-quarters weapons and aprehending street-savy criminals."
	outfit = /datum/outfit/job/roguetown/guardsman/footsman

	category_tags = list(CTAG_WATCH)
	traits_applied = list(TRAIT_MEDIUMARMOR)
	subclass_stats = list(
		STATKEY_STR = 1,
		STATKEY_CON = 2,
		STATKEY_WIL = 2,
		STATKEY_SPD = -1
	)
	subclass_skills = list(
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/axes = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/sneaking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/riding = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_NOVICE, 
	)

/datum/outfit/job/roguetown/guardsman/footsman/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/kettle/iron
	armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron
	beltr = /obj/item/rogueweapon/scabbard/sword
	l_hand = /obj/item/rogueweapon/sword/short
	beltl = /obj/item/rogueweapon/mace/cudgel
	backl = /obj/item/rogueweapon/shield/iron
	gloves = /obj/item/clothing/gloves/roguetown/angle
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1, 
		/obj/item/rope/chain = 1, 
		/obj/item/rogueweapon/scabbard/sheath = 1, 
		/obj/item/reagent_containers/glass/bottle/alchemical/healthpot = 2, 
		/obj/item/storage/keyring/watchman = 1,
		/obj/item/signal_horn = 1,
		)
	H.verbs |= /mob/proc/haltyell

/datum/advclass/watchman/archer
	name = "Watch Archer"
	tutorial = "You are an archer of the Town Watch. Once a hunter, now a man-hunter for your lord. Rooftops, bows, and daggers are your best friend."
	outfit = /datum/outfit/job/roguetown/guardsman/archer

	category_tags = list(CTAG_WATCH)
	traits_applied = list(TRAIT_DODGEEXPERT)
	subclass_stats = list(
		STATKEY_SPD = 2,
		STATKEY_PER = 2,
		STATKEY_STR = -1,
		STATKEY_INT = 1,
		STATKEY_CON = -1
	)
	subclass_skills = list(
		/datum/skill/combat/bows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/crossbows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/swords = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/tanning = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_JOURNEYMAN, 
	)

/datum/outfit/job/roguetown/guardsman/archer/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/kettle/iron
	armor = /obj/item/clothing/suit/roguetown/armor/leather/studded
	beltl = /obj/item/rogueweapon/mace/cudgel
	gloves = /obj/item/clothing/gloves/roguetown/angle
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1, 
		/obj/item/rope/chain = 1, /obj/item/rogueweapon/scabbard/sheath = 1, 
		/obj/item/reagent_containers/glass/bottle/alchemical/healthpot = 2, 
		/obj/item/storage/keyring/watchman = 1,
		/obj/item/signal_horn = 1,
		)
	H.verbs |= /mob/proc/haltyell

	if(H.mind)
		var/weapons = list("Crossbow","Bow")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		H.set_blindness(0)
		switch(weapon_choice)
			if("Crossbow")
				beltr = /obj/item/quiver/bolt/standard
				backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
			if("Bow")
				beltr = /obj/item/quiver/arrows
				backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve

/datum/advclass/watchman/dungeoneer
	name = "Dungeoneer"
	tutorial = "Penance, filthy sense of sadism or a queer outlook on justice, something has led you to don the shunned mask and fulfill the whims of the Nobility. Their whims are your guidance, as you've no 'moral quandaries' to care for."
	maximum_possible_slots = 1
	traits_applied = list(TRAIT_DUNGEONMASTER, TRAIT_STEELHEARTED)
	outfit = /datum/outfit/job/roguetown/dungeoneer/base
	category_tags = list(CTAG_WATCH)
	subclass_stats = list(
		STATKEY_STR = 2,
		STATKEY_CON = 2,
		STATKEY_WIL = 1
	)
	subclass_skills = list(
		/datum/skill/combat/whipsflails = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/wrestling = SKILL_LEVEL_MASTER, //hilarious
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/medicine = SKILL_LEVEL_JOURNEYMAN,//Enough for majority of surgeries without grinding.
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/sewing = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/traps = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
	)
	adv_stat_ceiling = list(STAT_STRENGTH = 16, STAT_CONSTITUTION = 16, STAT_WILLPOWER = 16)

/datum/outfit/job/roguetown/dungeoneer/base/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/rogueweapon/whip/antique
	beltl = /obj/item/storage/keyring/manatarms
	backr = /obj/item/storage/backpack/rogue/satchel/short
	backpack_contents = list(
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 2,
		/obj/item/flashlight/flare/torch/lantern = 1,
		) //No armoury access
	H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
	//Torture victim is for inquisition - doesn't even work without a psicross anymore so maybe come up with a variant for him specifically?
	switch(H.patron?.type)
		if(/datum/patron/divine/necra)
			head = /obj/item/clothing/head/roguetown/necrahood
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/necra
		else
			cloak = /obj/item/clothing/cloak/tabard/stabard/dungeon
			head = /obj/item/clothing/head/roguetown/menacing
