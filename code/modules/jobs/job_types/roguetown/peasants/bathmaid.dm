/datum/job/roguetown/nightmaiden
	title = "Nightswain"
	f_title = "Nightmaiden"
	flag = WENCH
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 5
	spawn_positions = 5

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	

	tutorial = "Most would decry the workers of the Baths under the tavern as desperate fools tempting others into bedsheets for mammons- and unfortunately, you have found yourself as one of those. You work under your Bathmaster in the communal bathhouse, keeping it and the guests in turn as tidy as they please. Wash laundry, tend mild wounds, and deftly wash your patrons with soap and a skilled 'caress', for this is your craft. Perhaps you will eventually make enough coin to get out of here."

	outfit = /datum/outfit/job/roguetown/nightmaiden
	advclass_cat_rolls = list(CTAG_NIGHTMAIDEN = 20)
	display_order = JDO_WENCH
	give_bank_account = TRUE
	can_random = FALSE
	min_pq = -10
	max_pq = null
	round_contrib_points = 2
	advjob_examine = TRUE
	cmode_music = 'sound/music/cmode/towner/combat_towner.ogg'
	job_traits = list(TRAIT_EMPATH, TRAIT_GOODLOVER, TRAIT_HOMESTEAD_EXPERT)
	job_subclasses = list(
		/datum/advclass/nightmaiden,
		/datum/advclass/nightmaiden/concubine,
		/datum/advclass/nightmaiden/courtesan
	)

/datum/outfit/job/roguetown/nightmaiden
	name = "Nightmaiden"
	// This is just a base outfit, the actual outfits are defined in the advclasses

/datum/advclass/nightmaiden
	name = "Attendant"
	tutorial = "You are the zili-a-dozen of the baths, one of many simply working to either pay off a debt, or other. Deftly entertain, wash, and give a skilled 'caress' to those who pay. Perhaps you will eventually make enough coin to get out of here."
	outfit = /datum/outfit/job/roguetown/nightmaiden/attendant
	category_tags = list(CTAG_NIGHTMAIDEN)
	traits_applied = list(TRAIT_NUTCRACKER, TRAIT_CICERONE)
	subclass_stats = list(
		STATKEY_CON = 3,
		STATKEY_WIL = 2,
		STATKEY_STR = 1
	)
	subclass_skills = list(
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/stealing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/music = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/knives = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_NOVICE,
	)

/datum/outfit/job/roguetown/nightmaiden/attendant/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/armingcap
	neck = /obj/item/clothing/neck/roguetown/collar/leather
	beltl = /obj/item/roguekey/nightmaiden
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	backl = /obj/item/storage/backpack/rogue/satchel/short
	shoes = /obj/item/clothing/shoes/roguetown/sandals
	backpack_contents = list(
		/obj/item/soap/bath = 1
	)
	if(should_wear_femme_clothes(H))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy/random
		pants = /obj/item/clothing/under/roguetown/skirt/brown
		belt =	/obj/item/storage/belt/rogue/leather/cloth/lady
	else
		belt = /obj/item/storage/belt/rogue/leather
		pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/shorts

/datum/advclass/nightmaiden/concubine
	name = "Concubine"
	tutorial = "Unlike your fellow bath attendants who maintain a professional facade, you have abandoned all pretense. You are a prized possession of the nobility, adorned in exotic silks and gold. Your role is to provide companionship, entertainment, and pleasure. Working underneath the finespun courtesans, you're a step above the bath attendants in your craft."
	outfit = /datum/outfit/job/roguetown/nightmaiden/concubine
	category_tags = list(CTAG_NIGHTMAIDEN)
	traits_applied = list(TRAIT_LIGHT_STEP, TRAIT_BEAUTIFUL)
	subclass_stats = list(
		STATKEY_PER = 3,
		STATKEY_WIL = 2,
		STATKEY_STR = 1
	)
	subclass_skills = list(
		/datum/skill/combat/whipsflails = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/stealing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/music = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/medicine = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/sewing = SKILL_LEVEL_JOURNEYMAN,
	)

/datum/outfit/job/roguetown/nightmaiden/concubine/pre_equip(mob/living/carbon/human/H)
	..()
	beltl = /obj/item/roguekey/nightmaiden
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	backl = /obj/item/storage/backpack/rogue/satchel/short
	backpack_contents = list(
		/obj/item/rope = 1,
		/obj/item/candle/eora = 1,
		/obj/item/rogueweapon/whip = 1,
		/obj/item/clothing/mask/rogue/blindfold = 1,
	)
	if(should_wear_femme_clothes(H))
		mask = /obj/item/clothing/mask/rogue/exoticsilkmask
		neck = /obj/item/clothing/neck/roguetown/collar/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/exoticsilkbra
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk
		shoes = /obj/item/clothing/shoes/roguetown/anklets
		belt = /obj/item/storage/belt/rogue/leather/exoticsilkbelt
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/lowcut
		neck = /obj/item/clothing/neck/roguetown/collar/catbell
		pants = /obj/item/clothing/under/roguetown/trou/leathertights
		belt = /obj/item/storage/belt/rogue/leather/black
		shoes = /obj/item/clothing/shoes/roguetown/sandals

	if(H.mind)
		var/weapons = list("Harp","Lute","Accordion","Guitar","Hurdy-Gurdy","Viola","Vocal Talisman","Flute")
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
			if("Flute")
				backr = /obj/item/rogue/instrument/flute

/datum/advclass/nightmaiden/courtesan
	name = "Courtesan"
	tutorial = "Overcoming mind games, deceit and competition, you came into your own as one of the bathhouse's most prized moneymakers and socialites. Dressed in lavish gifts left behind by your patrons, not just anyone can have you. Under the matron, you do most of the social heavylifting and provide entertainment of all forms - behind a heavy price tag. "
	outfit = /datum/outfit/job/roguetown/nightmaiden/courtesan
	category_tags = list(CTAG_NIGHTMAIDEN)
	traits_applied = list(TRAIT_KEENEARS, TRAIT_BEAUTIFUL)
	subclass_stats = list(
		STATKEY_SPD = 3,
		STATKEY_WIL = 2,
		STATKEY_PER = 1
	)
	subclass_skills = list(
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/music = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/sewing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/medicine = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,
	)

/datum/outfit/job/roguetown/nightmaiden/courtesan/pre_equip(mob/living/carbon/human/H)
	..()
	var/pinroll = rand(1, 20)
	switch(pinroll)
		if(1 to 19)
			head = /obj/item/lockpick/goldpin
		if(20)
			head = /obj/item/lockpick/goldpin/silver
	var/ringroll = rand(1, 100)
	switch(ringroll)
		if(1 to 25)
			id = /obj/item/clothing/ring/gold
		if(26 to 50)
			id = /obj/item/clothing/ring/emerald
		if(51 to 80)
			id = /obj/item/clothing/ring/topaz
		if(81 to 95)
			id = /obj/item/clothing/ring/silver
		if(96 to 100)
			id = /obj/item/clothing/ring/diamond
	beltl = /obj/item/roguekey/nightmaiden
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	backl = /obj/item/storage/backpack/rogue/satchel/short
	backpack_contents = list(
		/obj/item/reagent_containers/powder/moondust = 2,
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 1,
		/obj/item/toy/cards/deck = 1,
	)
	if(should_wear_femme_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/silkydress/random
		shirt = /obj/item/clothing/suit/roguetown/armor/corset
		belt = /obj/item/storage/belt/rogue/leather/cloth/lady
		shoes = /obj/item/clothing/shoes/roguetown/anklets
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/random
		pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/valorian
		belt = /obj/item/storage/belt/rogue/leather/black
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced/short

	if(H.mind)
		var/weapons = list("Harp","Lute","Accordion","Guitar","Hurdy-Gurdy","Viola","Vocal Talisman","Flute")
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
			if("Flute")
				backr = /obj/item/rogue/instrument/flute

/obj/item/soap/bath
	name = "herbal soap"
	desc = "A soap made from various herbs"
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "soap"
	lefthand_file = 'icons/mob/inhands/equipment/custodial_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/custodial_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	item_flags = NOBLUDGEON

/obj/item/bath/soap/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/slippery, 80)
