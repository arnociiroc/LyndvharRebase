/datum/job/roguetown/butler // really need to re-name all these when the codebase isn't a fork and search will update for the peasants...
	title = "Seneschal"
	flag = BUTLER
	department_flag = COURTIERS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_SHUNNED_UP

	tutorial = "Servitude unto death; that is your motto. You have worked tirelessly in the court of Lyndvhar as a servant, and this had not gone unrecognized. You have become the de-facto head of the serving staff, with power over the lesser courtiers. For if it were not for you and your underlings, the nobles would have starved to death long ago."
	outfit = /datum/outfit/job/roguetown/seneschal
	advclass_cat_rolls = list(CTAG_SENESCHAL = 20)
	display_order = JDO_BUTLER
	give_bank_account = 30
	min_pq = 1
	max_pq = null
	round_contrib_points = 3
	job_subclasses = list(
		/datum/advclass/seneschal/seneschal,
		/datum/advclass/seneschal/headmaid,
		/datum/advclass/seneschal/chiefbutler
	)

/datum/advclass/seneschal
	traits_applied = list(TRAIT_CICERONE, TRAIT_HOMESTEAD_EXPERT, TRAIT_SEWING_EXPERT) // They have Expert Sewing
	category_tags = list(CTAG_SENESCHAL)

/datum/advclass/seneschal/seneschal
	name = "Seneschal"
	tutorial = "While still expected to fill in for the duties of the household servantry as needed, you have styled yourself as a figure beyond them."
	outfit = /datum/outfit/job/roguetown/seneschal/seneschal
	subclass_stats = list(
		STATKEY_INT = 2,
		STATKEY_PER = 2,
		STATKEY_LCK = 1, // Usual leadership carrot.
		STATKEY_SPD = 1
	)
	subclass_skills = list(
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/cooking = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/medicine = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/sewing = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/crafting = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/stealing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/seneschal
	has_loadout = TRUE

//This applies to all Seneschal subclasses
/datum/outfit/job/roguetown/seneschal/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	if(H.age == AGE_MIDDLEAGED)
		H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)

/datum/outfit/job/roguetown/seneschal/seneschal/pre_equip(mob/living/carbon/human/H)
	..()
	pants = /obj/item/clothing/under/roguetown/tights
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced/short
	backl = /obj/item/storage/backpack/rogue/satchel/short
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/keyring/servant
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	if(should_wear_femme_clothes(H)) 
		armor = /obj/item/clothing/suit/roguetown/armor/silkcoat

/datum/advclass/seneschal/headmaid
	name = "Head Maid"
	tutorial = "Whether you were promoted from one or just like the frills, you stylize yourself as a head maid. Your duties and talents remain the same, though."
	outfit = /datum/outfit/job/roguetown/seneschal/headmaid
	subclass_stats = list(
		STATKEY_INT = 2,
		STATKEY_PER = 2,
		STATKEY_LCK = 1, // Usual leadership carrot.
		STATKEY_SPD = 1
	)
	subclass_skills = list(
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/cooking = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/medicine = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/sewing = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/crafting = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/stealing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/seneschal/headmaid/pre_equip(mob/living/carbon/human/H)
	..()
	armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/black
	pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/white 
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced/short
	cloak = /obj/item/clothing/cloak/apron/waist
	backl = /obj/item/storage/backpack/rogue/satchel/short
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/keyring/servant
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid

/datum/advclass/seneschal/chiefbutler
	name = "Chief Butler"
	tutorial = "You are the ruling class of butler and your ability to clear your throat and murmur 'I say' is without peer. Your duties and talents as seneschal remain the same, though."
	outfit = /datum/outfit/job/roguetown/seneschal/chiefbutler
	subclass_stats = list(
		STATKEY_INT = 2,
		STATKEY_PER = 2,
		STATKEY_LCK = 1, // Usual leadership carrot.
		STATKEY_SPD = 1
	)
	subclass_skills = list(
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/cooking = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/medicine = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/sewing = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/crafting = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sneaking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/stealing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/seneschal/chiefbutler/pre_equip(mob/living/carbon/human/H)
	..() // They need a monocle.
	pants = /obj/item/clothing/under/roguetown/tights/black
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced/short
	backl = /obj/item/storage/backpack/rogue/satchel/short
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/keyring/servant
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/black
