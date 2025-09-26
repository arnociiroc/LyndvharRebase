/datum/advclass/mercenary/grenzelhoft
	name = "Grenzelhoftian Doppelsoldner"
	tutorial = "Experts, Professionals, Expensive. Those are the first words that come to mind when the emperiate Grenzelhoft mercenary guild is mentioned. While you may work for coin like any common sellsword, maintaining the prestige of the guild will be of utmost priority."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
	outfit = /datum/outfit/job/roguetown/mercenary/grenzelhoft
	class_select_category = CLASS_CAT_GRENZELHOFT
	category_tags = list(CTAG_MERCENARY)
	cmode_music = 'sound/music/combat_grenzelhoft.ogg'
	subclass_languages = list(/datum/language/grenzelhoftian)
	traits_applied = list(TRAIT_HEAVYARMOR, TRAIT_STEELHEARTED)
	subclass_stats = list(
		STATKEY_CON = 3,
		STATKEY_WIL = 3,
		STATKEY_STR = 2, //Should give minimum required stats to use Zweihander
		STATKEY_PER = 1,
		STATKEY_SPD = -1 //They get heavy armor now + sword option; so lower speed.
	)
	subclass_skills = list(
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/maces = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/crossbows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields = SKILL_LEVEL_NOVICE,	//Won't be using normally with Zwiehander but useful.
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,		//Trust me, they'll need it due to stamina drain on their base-sword.
	)

/datum/outfit/job/roguetown/mercenary/grenzelhoft/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("You are a Doppelsoldner - \"Double-pay Mercenary\" - an experienced frontline swordsman trained by the Zenitstadt fencing guild."))
	backl = /obj/item/rogueweapon/scabbard/gwstrap
	armor = /obj/item/clothing/suit/roguetown/armor/plate/blacksteel_half_plate
	if(H.mind)
		var/weapons = list("Zweihander", "Kriegmesser & Buckler")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		switch(weapon_choice)
			if("Zweihander")
				r_hand = /obj/item/rogueweapon/greatsword/grenz
			if("Kriegmesser & Buckler") // Buckler cuz they have no shield skill.
				beltr = /obj/item/rogueweapon/scabbard/sword
				r_hand = /obj/item/rogueweapon/sword/long/kriegmesser
				l_hand = /obj/item/rogueweapon/shield/buckler
	//General gear regardless of class.
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/clothing/neck/roguetown/gorget
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/grenzelhoft
	head = /obj/item/clothing/head/roguetown/grenzelhofthat
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/grenzelpants
	shoes = /obj/item/clothing/shoes/roguetown/grenzelhoft
	gloves = /obj/item/clothing/gloves/roguetown/angle/grenzelgloves
	backr = /obj/item/storage/backpack/rogue/satchel/short
	backpack_contents = list(
		/obj/item/roguekey/mercenary = 1,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/flashlight/flare/torch = 1,
		/obj/item/rogueweapon/huntingknife = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1
		)
	H.merctype = 7

/datum/advclass/mercenary/grenzelhoft/halberdier
	name = "Grenzelhoftian Halberdier"
	tutorial = "Experts, Professionals, Expensive. Those are the first words that come to mind when the emperiate Grenzelhoft mercenary guild is mentioned. While you may work for coin like any common sellsword, maintaining the prestige of the guild will be of utmost priority."
	outfit = /datum/outfit/job/roguetown/mercenary/grenzelhoft_halberdier
	traits_applied = list(TRAIT_HEAVYARMOR, TRAIT_STEELHEARTED)
	subclass_stats = list(
		STATKEY_STR = 2,//same str, worse end, more speed - actually a good tradeoff, now.
		STATKEY_CON = 2,
		STATKEY_WIL = 2, 
		STATKEY_SPD = 1,
		STATKEY_PER = -1 
	)
	subclass_skills = list(
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/axes = SKILL_LEVEL_JOURNEYMAN,//Now you actually get your fabled axe skill
		/datum/skill/combat/crossbows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/polearms = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,		// Foot soldier that carries the Big Fuckin Polearm around. Also polearm stam drain from the fact they gon' be catching swings all day.
	)

/datum/outfit/job/roguetown/mercenary/grenzelhoft_halberdier/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("You're an experienced soldier skilled in the use of polearms and axes. Your equals make up the bulk of the mercenary guild's forces."))
	backl = /obj/item/rogueweapon/scabbard/gwstrap
	armor = /obj/item/clothing/suit/roguetown/armor/plate/blacksteel_half_plate
	if(H.mind)
		var/weapons = list("Halberd", "Partizan")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		switch(weapon_choice)
			if("Halberd")
				r_hand = /obj/item/rogueweapon/halberd
			if("Partizan")
				r_hand = /obj/item/rogueweapon/spear/partizan
	//General gear regardless of class.
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/clothing/neck/roguetown/gorget
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/grenzelhoft
	head = /obj/item/clothing/head/roguetown/grenzelhofthat
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/grenzelpants
	shoes = /obj/item/clothing/shoes/roguetown/grenzelhoft
	gloves = /obj/item/clothing/gloves/roguetown/angle/grenzelgloves
	backr = /obj/item/storage/backpack/rogue/satchel/short
	backpack_contents = list(
		/obj/item/roguekey/mercenary = 1,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/flashlight/flare/torch = 1,
		/obj/item/rogueweapon/huntingknife = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1
		)
	H.merctype = 7

//crossbow and axe class. Rearguard. Utility skills, no medium armor, no dodge expert. This is NOT a go-face-first-into-war class.
/datum/advclass/mercenary/grenzelhoft/crossbowman
	name = "Grenzelhoftian Armbrustschutze"
	tutorial = "Experts, Professionals, Expensive. Those are the first words that come to mind when the emperiate Grenzelhoft mercenary guild is mentioned. While you may work for coin like any common sellsword, maintaining the prestige of the guild will be of utmost priority."
	outfit = /datum/outfit/job/roguetown/mercenary/grenzelhoft_crossbowman
	traits_applied = list(TRAIT_DODGEEXPERT, TRAIT_STEELHEARTED)
	subclass_stats = list(
		STATKEY_SPD = 2,
		STATKEY_WIL = 2,
		STATKEY_PER = 2, 
		STATKEY_STR = 1,// 1 STR for the axe and crossbow reload. END for chopping trees, a bit of SPD for running, PER for shooting. -1 CON bc you aint a frontliner
		STATKEY_CON = -1 
	)
	subclass_skills = list(
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,		// gotta get to a vantage point
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/axes = SKILL_LEVEL_JOURNEYMAN,		// this is not only a tool!
		/datum/skill/combat/crossbows = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,		// Make your energy count, little silly individual
		/datum/skill/labor/butchering = SKILL_LEVEL_APPRENTICE,		// meant to live off the land and set up camp.
		/datum/skill/misc/sewing = SKILL_LEVEL_APPRENTICE,		// learn 2 maintain your uniform.
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,		// Just so you don't suck at cooking
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/lumberjacking = SKILL_LEVEL_APPRENTICE,	
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,	// crafting for pallisades, lumberjacking for not fucking up wood
	)

/datum/outfit/job/roguetown/mercenary/grenzelhoft_crossbowman/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("You're a proved marksman with a crossbow, and learned how to set up camp and defenses in the wild. The guild needs you."))
	beltr = /obj/item/quiver/bolts
	beltl = /obj/item/rogueweapon/stoneaxe/woodcut/steel
	r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	if(H.mind)
		var/armor_options = list("Light Brigandine", "Studded Leather Vest")
		var/armor_choice = input(H, "Choose your armor.", "DRESS UP") as anything in armor_options
		switch(armor_choice)
			if("Light Brigandine")
				armor = /obj/item/clothing/suit/roguetown/armor/brigandine/light	// find a smithy to fix it
			if("Studded Leather Vest")
				armor = /obj/item/clothing/suit/roguetown/armor/leather/studded		// or maintain it yourself!
	//General gear regardless of class.
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/clothing/neck/roguetown/gorget
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/grenzelhoft
	head = /obj/item/clothing/head/roguetown/grenzelhofthat
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/grenzelpants
	shoes = /obj/item/clothing/shoes/roguetown/grenzelhoft
	gloves = /obj/item/clothing/gloves/roguetown/angle/grenzelgloves
	backr = /obj/item/storage/backpack/rogue/satchel/short
	backpack_contents = list(
		/obj/item/roguekey/mercenary = 1,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/flashlight/flare/torch = 1,
		/obj/item/rogueweapon/huntingknife = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1
		)
	H.merctype = 7

