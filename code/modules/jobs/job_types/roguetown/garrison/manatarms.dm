/datum/job/roguetown/manorguard
	title = "Manor Guard"
	flag = MANATARMS
	department_flag = GARRISON
	faction = "Station"
	total_positions = 4
	spawn_positions = 4

	allowed_sexes = list(MALE, FEMALE)
	allowed_patrons = ALL_NICE_PATRONS
	allowed_races = RACES_SHUNNED_UP
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_IMMORTAL)
	job_traits = list(TRAIT_GUARDSMAN, TRAIT_STEELHEARTED)
	tutorial = "Having proven yourself loyal and capable compared to most of the rabble on the streets, you were hired and entrusted to defend the Manor and keep it protected at all cost. \
				With your newfound position came much training under the Cataphract, and with it a true warrior's education. \
				The word of the Viscount is your law- much more than any common levy of the Watch. Show the noble court and the Cataphract your respect, so that you may earn it in turn. Not as a commoner- but as a guardian of the noble court."
	display_order = JDO_GUARD
	whitelist_req = FALSE

	outfit = /datum/outfit/job/roguetown/manorguard
	advclass_cat_rolls = list(CTAG_MENATARMS = 20)

	give_bank_account = 25
	min_pq = 0
	max_pq = null
	round_contrib_points = 2

	cmode_music = 'sound/music/combat_ManAtArms.ogg'
	job_subclasses = list(
		/datum/advclass/manorguard/footsman,
		/datum/advclass/manorguard/skirmisher,
		/datum/advclass/manorguard/cavalry,
		/datum/advclass/manorguard/standard_bearer,
	)

/datum/outfit/job/roguetown/manorguard
	job_bitflag = BITFLAG_GARRISON

/datum/job/roguetown/manorguard/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
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
			S.name = "manor guard tabard ([index])"

/datum/outfit/job/roguetown/manorguard
	cloak = /obj/item/clothing/cloak/tabard/stabard/surcoat/guard
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	beltl = /obj/item/rogueweapon/mace/cudgel
	belt = /obj/item/storage/belt/rogue/leather/steel
	backr = /obj/item/storage/backpack/rogue/satchel/short/black
	id = /obj/item/scomstone/bad/garrison

// Melee goon
/datum/advclass/manorguard/footsman
	name = "Footman"
	tutorial = "You are a professional soldier of the realm, specializing in melee warfare. Stalwart and hardy, your body can both withstand and dish out powerful strikes.."
	outfit = /datum/outfit/job/roguetown/manorguard/footsman

	category_tags = list(CTAG_MENATARMS)
	traits_applied = list(TRAIT_MEDIUMARMOR)
	subclass_stats = list(
		STATKEY_STR = 2,// seems kinda lame but remember guardsman bonus!!
		STATKEY_INT = 1,
		STATKEY_CON = 2, //Like other footman classes their main thing is constitution more so than anything else
		STATKEY_WIL = 1,
	)
	subclass_skills = list(
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/axes = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/slings = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/shields = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sneaking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/riding = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/manorguard/footsman/pre_equip(mob/living/carbon/human/H)
	..()

	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	neck = /obj/item/clothing/neck/roguetown/coif/heavypadding
	gloves = /obj/item/clothing/gloves/roguetown/chain

	H.adjust_blindness(-3)
	if(H.mind)
		var/weapons = list("Warhammer & Shield","Axe & Shield","Sword & Shield","Halberd & Sword","Greataxe & Sword")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		H.set_blindness(0)
		switch(weapon_choice)
			if("Warhammer & Shield")
				beltr = /obj/item/rogueweapon/mace/warhammer
				backl = /obj/item/rogueweapon/shield/iron
				H.adjust_skillrank_up_to(/datum/skill/combat/maces, 4, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, 4, TRUE)
			if("Axe & Shield")
				beltr = /obj/item/rogueweapon/stoneaxe/woodcut/steel
				backl = /obj/item/rogueweapon/shield/iron
				H.adjust_skillrank_up_to(/datum/skill/combat/axes, 4, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, 4, TRUE)
			if("Sword & Shield")
				l_hand = /obj/item/rogueweapon/sword
				beltr = /obj/item/rogueweapon/scabbard/sword
				backl = /obj/item/rogueweapon/shield/iron
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, 4, TRUE)
			if("Halberd & Sword")
				l_hand = /obj/item/rogueweapon/sword
				r_hand = /obj/item/rogueweapon/halberd
				backl = /obj/item/rogueweapon/scabbard/gwstrap
				beltr = /obj/item/rogueweapon/scabbard/sword
				H.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
			if("Greataxe & Sword")
				l_hand = /obj/item/rogueweapon/sword
				r_hand = /obj/item/rogueweapon/greataxe
				backl = /obj/item/rogueweapon/scabbard/gwstrap
				beltr = /obj/item/rogueweapon/scabbard/sword
				H.adjust_skillrank_up_to(/datum/skill/combat/axes, 4, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1,
		/obj/item/rope/chain = 1,
		/obj/item/storage/keyring/manatarms = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 1,
		)
	H.verbs |= /mob/proc/haltyell

	if(H.mind)
		var/armor_options = list("Light Brigandine Set", "Maille Set")
		var/armor_choice = input(H, "Choose your armor.", "TAKE UP ARMS") as anything in armor_options

		switch(armor_choice)
			if("Light Brigandine Set")
				armor = /obj/item/clothing/suit/roguetown/armor/brigandine/light/retinue
				shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
				wrists = /obj/item/clothing/wrists/roguetown/bracers/brigandine
				pants = /obj/item/clothing/under/roguetown/brigandinelegs

			if("Maille Set")
				armor = /obj/item/clothing/suit/roguetown/armor/plate
				shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord/heavy
				wrists = /obj/item/clothing/wrists/roguetown/bracers
				pants = /obj/item/clothing/under/roguetown/chainlegs

		var/helmets = list(
		"Simple Helmet" 	= /obj/item/clothing/head/roguetown/helmet,
		"Slitted Kettle Helmet" 	= /obj/item/clothing/head/roguetown/helmet/heavy/knight/skettle,
		"Bascinet Helmet"	= /obj/item/clothing/head/roguetown/helmet/bascinet,
		"Sallet Helmet"		= /obj/item/clothing/head/roguetown/helmet/sallet,
		"None"
		)
		var/helmchoice = input(H, "Choose your Helm.", "TAKE UP HELMS") as anything in helmets
		if(helmchoice != "None")
			head = helmets[helmchoice]
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_LOWER_MIDDLE_CLASS, H, "Savings.")

// Ranged weapons and daggers on the side - lighter armor, but fleet!
/datum/advclass/manorguard/skirmisher
	name = "Skirmisher"
	tutorial = "You are a professional soldier of the realm, specializing in ranged implements. You sport a keen eye, looking for your enemies weaknesses."
	outfit = /datum/outfit/job/roguetown/manorguard/skirmisher

	category_tags = list(CTAG_MENATARMS)
	//Garrison ranged/speed class. Time to go wild
	subclass_stats = list(
		STATKEY_SPD = 2,// seems kinda lame but remember guardsman bonus!!
		STATKEY_PER = 2,
		STATKEY_WIL = 2
	)
	subclass_skills = list(
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,		//Trained soldier, should have some skill??
		/datum/skill/combat/maces = SKILL_LEVEL_APPRENTICE, 		// Still have a cugel.
		/datum/skill/combat/crossbows = SKILL_LEVEL_EXPERT,		//Only effects draw and reload time.
		/datum/skill/combat/bows = SKILL_LEVEL_EXPERT,			//Only effects draw times.
		/datum/skill/combat/slings = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT, // A little better; run fast, weak boy.
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,	//On par with Watch Archer.
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/riding = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_APPRENTICE,
	)
	extra_context = "Chooses between Light Armor (Dodge Expert) & Medium Armor."

/datum/outfit/job/roguetown/manorguard/skirmisher/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/gorget/steel
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
	gloves = /obj/item/clothing/gloves/roguetown/leather

	H.adjust_blindness(-3)
	if(H.mind)
		var/weapons = list("Crossbow","Bow","Sling")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		var/armor_options = list("Leather Armor", "Brigandine Armor")
		var/armor_choice = input(H, "Choose your armor.", "TAKE UP ARMS") as anything in armor_options
		H.set_blindness(0)
		switch(weapon_choice)
			if("Crossbow")
				beltr = /obj/item/quiver/bolt/standard
				backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
			if("Bow") // They can head down to the armory to sideshift into one of the other bows.
				beltr = /obj/item/quiver/arrows
				backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
			if("Sling")
				beltr = /obj/item/quiver/sling/iron
				r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/sling // Both are belt slots and it's not worth setting where the cugel goes for everyone else, sad.

		switch(armor_choice)
			if("Leather Armor") //OG more or less RT guardsman archer
				head = /obj/item/clothing/head/roguetown/roguehood/studded/retinue
				armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy
				wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
				pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
				H.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
				ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			if("Brigandine Armor") //New MAA skirmisher
				head = /obj/item/clothing/head/roguetown/helmet/kettle
				armor = /obj/item/clothing/suit/roguetown/armor/brigandine/light/retinue
				wrists = /obj/item/clothing/wrists/roguetown/bracers/brigandine
				pants = /obj/item/clothing/under/roguetown/brigandinelegs
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)	//Medium armour with only knife skill is ??
				l_hand = /obj/item/rogueweapon/sword/short/messer
				ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

		backpack_contents = list(
			/obj/item/rogueweapon/huntingknife/combat/messser = 1,
			/obj/item/rope/chain = 1,
			/obj/item/storage/keyring/manatarms = 1,
			/obj/item/rogueweapon/scabbard/sheath = 1,
			/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 1,
			)
		H.verbs |= /mob/proc/haltyell

	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_LOWER_MIDDLE_CLASS, H, "Savings.")


/datum/advclass/manorguard/cavalry
	name = "Cavalryman"
	tutorial = "You are a professional soldier of the realm, specializing in the steady beat of hoof falls. Lighter and more expendable then the knights, you charge with lance in hand."
	outfit = /datum/outfit/job/roguetown/manorguard/cavalry
	subclass_stashed_items = list("Ducal Caparison" = /obj/item/caparison/lyndvhar)
	extra_context = "This subclass recieves Lyndvhar Caparison in it's stash."

	category_tags = list(CTAG_MENATARMS)
	traits_applied = list(TRAIT_MEDIUMARMOR)
	maximum_possible_slots = 2 //We don't want a horde of these as well there ARE only 2 stables at barracks
	//Garrison mounted class; charge and charge often.
	subclass_stats = list(
		STATKEY_CON = 2,// seems kinda lame but remember guardsman bonus!!
		STATKEY_WIL = 2,// Your name is speed, and speed is running.
		STATKEY_STR = 1,
		STATKEY_INT = 1, // No strength to account for the nominally better weapons. We'll see.
		STATKEY_PER = 1, //Trackers
	)
	subclass_skills = list(
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/maces = SKILL_LEVEL_APPRENTICE, 		// Still have a cugel.
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/crossbows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN, 		// Like the other horselords.
		/datum/skill/misc/tracking = SKILL_LEVEL_EXPERT,	//Best tracker. Might as well give it something to stick-out utility wise.
	)
	subclass_virtues = list(
		/datum/virtue/utility/riding
	)

/datum/outfit/job/roguetown/manorguard/cavalry/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/gorget/steel
	armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord/heavy
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	gloves = /obj/item/clothing/gloves/roguetown/chain
	pants = /obj/item/clothing/under/roguetown/chainlegs

	H.adjust_blindness(-3)
	if(H.mind)
		var/weapons = list("Sabre & Crossbow", "Flail & Shield","Lucerne & Whip")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		H.set_blindness(0)
		switch(weapon_choice)
			if("Sabre & Crossbow")
				l_hand = /obj/item/rogueweapon/sword/sabre
				r_hand = /obj/item/rogueweapon/scabbard/sword
				backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
				beltr = /obj/item/quiver/bolt/standard
				H.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 4, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
			if("Flail & Shield")
				beltr = /obj/item/rogueweapon/flail/sflail
				backl = /obj/item/rogueweapon/shield/tower
				H.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 4, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, 4, TRUE)
			if("Lucerne & Whip")
				r_hand = /obj/item/rogueweapon/eaglebeak/lucerne
				backl = /obj/item/rogueweapon/scabbard/gwstrap
				beltr = /obj/item/rogueweapon/whip
				H.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 4, TRUE)

		backpack_contents = list(
			/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1,
			/obj/item/rope/chain = 1,
			/obj/item/storage/keyring/manatarms = 1,
			/obj/item/rogueweapon/scabbard/sheath = 1,
			/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 1
			)
		H.verbs |= /mob/proc/haltyell

		var/helmets = list(
		"Slitted Kettle Helmet" 	= /obj/item/clothing/head/roguetown/helmet/heavy/knight/skettle,
		"Bascinet Helmet"	= /obj/item/clothing/head/roguetown/helmet/bascinet,
		"Visored Sallet"		= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
		"Klappvisier Helmet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/calmirixia,
		"None"
		)
		var/helmchoice = input(H, "Choose your Helm.", "TAKE UP HELMS") as anything in helmets
		if(helmchoice != "None")
			head = helmets[helmchoice]

	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_LOWER_MIDDLE_CLASS, H, "Savings.")

// Carries the ducal standard.
// When carrying it, he's granted a few unique traits.
// Bonuses, relaying location, etc.
// The stats are middling, as a result. Really bad, honestly.
// No armour trait, but gets crit resist. STAY STANDING!!!
/datum/advclass/manorguard/standard_bearer
	name = "Standard Bearer"
	tutorial = "You are one of the men of the manor entrusted with the keep's standard when you sally out into battle. \
	Your fellow soldiers know to rally around you, should you keep it safe."
	outfit = /datum/outfit/job/roguetown/manorguard/standard_bearer
	category_tags = list(CTAG_MENATARMS)
	traits_applied = list(TRAIT_STANDARD_BEARER)
	// on-par with footman, with one less CON and INT swapped out for PER
	subclass_stats = list(
		STATKEY_STR = 2, // seems kinda lame but remember guardsman bonus!!
		STATKEY_PER = 1,
		STATKEY_CON = 2,
		STATKEY_WIL = 1
	)
	subclass_skills = list(
		/datum/skill/combat/polearms = SKILL_LEVEL_EXPERT, // SWING THAT THING.
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT, // OR THOSE ARMS, I GUESS.
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
	)
	maximum_possible_slots = 1 // Haha... no... unless...?

/datum/outfit/job/roguetown/manorguard/standard_bearer/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	neck = /obj/item/clothing/neck/roguetown/gorget/steel
	gloves = /obj/item/clothing/gloves/roguetown/chain
	head = /obj/item/clothing/head/roguetown/helmet/kettle
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/light/retinue
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
	wrists = /obj/item/clothing/wrists/roguetown/bracers/brigandine
	pants = /obj/item/clothing/under/roguetown/brigandinelegs
	r_hand = /obj/item/rogueweapon/spear/keep_standard
	backl = /obj/item/rogueweapon/scabbard/gwstrap
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1,
		/obj/item/rope/chain = 1,
		/obj/item/storage/keyring/manatarms = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 1,
	)
	H.verbs |= /mob/proc/haltyell

// These are really hacky, but it works.
// One proc to moodbuff.
/mob/proc/standard_position()
	set name = "PLANT"
	set category = "Standard"
	emote("standard_position", intentional = TRUE)
	stamina_add(rand(15, 35))

/datum/emote/living/standard_position
	key = "standard_position"
	message = "plants the standard!"
	emote_type = EMOTE_VISIBLE
	show_runechat = TRUE

/datum/emote/living/standard_position/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(do_after(user, 8 SECONDS)) // SCORE SOME GOALS!!!
		playsound(user.loc, 'sound/combat/shieldraise.ogg', 100, FALSE, -1)
		if(.)
			for(var/mob/living/carbon/human/L in viewers(7, user))
				if(HAS_TRAIT(L, TRAIT_GUARDSMAN))
					to_chat(L, span_monkeyhive("The standard calls out to me!"))
					L.add_stress(/datum/stressevent/keep_standard_lesser)

//Another to call out.
/mob/proc/standard_rally()
	set name = "RALLY"
	set category = "Standard"
	emote("standard_rally", intentional = TRUE)
	stamina_add(rand(15, 35))

/datum/emote/living/standard_rally
	key = "standard_rally"
	message = "activates the standard's rallying cry!"
	emote_type = EMOTE_VISIBLE
	show_runechat = TRUE

/datum/emote/living/standard_rally/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(do_after(user, 8 SECONDS)) // COME ON!!!
		playsound(user.loc, 'sound/combat/shieldraise.ogg', 100, FALSE, -1)
		if(.)
			// gives them a rallying message, but doesn't reveal a location. gives antags some leeway
			var/input_text = "<big><span style='color: [CLOTHING_WOAD_BLUE]'>THE CITY STANDARD CALLS FOR ALL GUARDSMEN TO RALLY AT [uppertext(get_area_name(user))]!</span></big>" // non-specific rallying call
			for(var/obj/item/scomstone/bad/garrison/S in SSroguemachine.scomm_machines)
				S.repeat_message(input_text, src, CLOTHING_WOAD_BLUE)
			for(var/obj/item/scomstone/garrison/S in SSroguemachine.scomm_machines)
				S.repeat_message(input_text, src, CLOTHING_WOAD_BLUE)
			for(var/obj/structure/roguemachine/scomm/S in SSroguemachine.scomm_machines)
				if(S.garrisonline)
					S.repeat_message(input_text, src, CLOTHING_WOAD_BLUE)
			SSroguemachine.crown?.repeat_message(input_text, src, CLOTHING_WOAD_BLUE)
