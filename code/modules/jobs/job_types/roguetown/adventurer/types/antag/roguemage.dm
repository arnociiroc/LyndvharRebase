/datum/advclass/roguemage //mage class - like the adventurer mage, but more evil.
	name = "Rogue Mage"
	tutorial = "Those fools at the academy laughed at you and cast you from the ivory tower of higher learning and magickal practice. No matter - you will ascend to great power one day, but first you need wealth - vast amounts of it. Show those fools in the town what REAL magic looks like."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	maximum_possible_slots = 1 // mages are supposed to be rare
	outfit = /datum/outfit/job/roguetown/bandit/roguemage
	category_tags = list(CTAG_BANDIT)
	cmode_music = 'sound/music/combat_bandit.ogg'
	subclass_spellpoints = 21
	traits_applied = list(TRAIT_MAGEARMOR, TRAIT_ARCYNE_T3, TRAIT_DODGEEXPERT)
	subclass_stats = list(
		STATKEY_INT = 3,
		STATKEY_WIL = 3,
		STATKEY_PER = 2, // Adv mage get 2 perception so whatever. It is useful for aiming body parts but have no direct synergy with spells. 
		STATKEY_LCK = 2,
		STATKEY_SPD = 1,
		STATKEY_CON = 1,
	)
	subclass_skills = list(
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN, // Jman Polearms, for better parrying without making them bandit level 
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/bows = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN, //needs climbing to get into hideout
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE, // Standards for athletics is 3, give them 2
		/datum/skill/craft/crafting = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/alchemy = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/magic/arcane = SKILL_LEVEL_EXPERT,
	)

/datum/outfit/job/roguetown/bandit/roguemage/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/brown
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/black
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	backr = /obj/item/storage/backpack/rogue/satchel/short
	backpack_contents = list(
					/obj/item/needle/thorn = 1,
					/obj/item/natural/cloth = 1,
					/obj/item/flashlight/flare/torch = 1,
					/obj/item/book/spellbook = 1, // Spell resetting is a key identity of good mage
					)
	mask = /obj/item/clothing/mask/rogue/facemask
	neck = /obj/item/clothing/neck/roguetown/coif/heavypadding
	head = /obj/item/clothing/head/roguetown/roguehood/black
	id = /obj/item/mattcoin

	r_hand = /obj/item/rogueweapon/woodstaff/diamond
	if(H.age == AGE_OLD)
		head = /obj/item/clothing/head/roguetown/wizhat/gen
		armor = /obj/item/clothing/suit/roguetown/shirt/robe
		H.adjust_skillrank_up_to(/datum/skill/magic/arcane, SKILL_LEVEL_MASTER, TRUE)
		H.change_stat(STATKEY_INT, 1)
		H.change_stat(STATKEY_PER, 1)
		H.mind?.adjust_spellpoints(6)

	if (!(istype(H.patron, /datum/patron/inhumen/matthios)))
		to_chat(H, span_warning("My former deity has abandoned me.. Matthios is my new master."))
		H.set_patron(/datum/patron/inhumen/matthios)
