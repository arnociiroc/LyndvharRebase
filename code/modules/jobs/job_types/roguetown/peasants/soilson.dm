/datum/job/roguetown/farmer
	title = "Soilson"
	flag = FARMER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 4
	spawn_positions = 5
	display_order = JDO_SOILSON
	selection_color = JCOLOR_PEASANT
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	cmode_music = 'sound/music/cmode/towner/combat_towner2.ogg'

	tutorial = "It is a simple life you live, your basic understanding of life is something many would be envious of if they knew just how perfect it was. You know a good day's work, the sweat on your brow is yours: Famines and plague may take their toll, but you know how to celebrate life well. Till the soil and produce fresh food for those around you, and maybe you'll be more than an unsung hero someday."


	f_title = "Soilbride"
	outfit = /datum/outfit/job/roguetown/farmer
	display_order = 24
	give_bank_account = 17
	min_pq = -10
	max_pq = null
	round_contrib_points = 3

	job_traits = list(TRAIT_SEEDKNOW, TRAIT_NOSTINK, TRAIT_LONGSTRIDER, TRAIT_HOMESTEAD_EXPERT)

	advclass_cat_rolls = list(CTAG_SOILBRIDE = 2)
	job_subclasses = list(
		/datum/advclass/soilson,
		/datum/advclass/butcher
	)

/datum/advclass/soilson
	name = "Soilson"
	maximum_possible_slots = 3
	tutorial = "It is a simple life you live, your basic understanding of life is something many would be envious of if they knew just how perfect it was. You know a good day's work, the sweat on your brow is yours: Famines and plague may take their toll, but you know how to celebrate life well. Till the soil and produce fresh food for those around you, and maybe you'll be more than an unsung hero someday."
	outfit = /datum/outfit/job/roguetown/farmer/basic
	category_tags = list(CTAG_SOILBRIDE)
	subclass_stats = list(
		STATKEY_WIL = 2,
		STATKEY_STR = 1,
		STATKEY_CON = 1,
		STATKEY_SPD = 1
	)
	subclass_skills = list(
		/datum/skill/combat/whipsflails = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/farming = SKILL_LEVEL_MASTER,
		/datum/skill/misc/medicine = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/sewing = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/carpentry = SKILL_LEVEL_APPRENTICE, //So they can actually even craft their makeshift weapons
		/datum/skill/craft/masonry = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/tanning = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/labor/butchering = SKILL_LEVEL_MASTER,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
	)
	
/datum/outfit/job/roguetown/farmer/basic/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/armingcap
	mask = /obj/item/clothing/head/roguetown/roguehood
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/storage/keyring/soilson
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/recipe_book/survival = 1,
		/obj/item/flashlight/flare/torch = 1,
		/obj/item/rogueweapon/huntingknife = 1,
		/obj/item/flint = 1,
		)
	if(H.age == AGE_OLD)//So ppl have reason to pick this I guess?
		H.adjust_skillrank_up_to(/datum/skill/labor/farming, 6, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/labor/butchering, 6, TRUE)

	if(should_wear_femme_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/random
		cloak = /obj/item/clothing/cloak/apron/brown
	else if(should_wear_masc_clothes(H))
		pants = /obj/item/clothing/under/roguetown/tights/random
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random

/datum/advclass/butcher
	name = "Butcher"
	tutorial = "Some say you're a strange individual, some say you're a cheat, while some claim you're a savant in the art of sausage making. Without your skilled hands and knifework, most of the livestock around the town would be wasted. "
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/butcher
	cmode_music = 'sound/music/cmode/towner/combat_retired.ogg'
	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)
	maximum_possible_slots = 1
	subclass_stats = list(
		STATKEY_WIL = 2,
		STATKEY_STR = 1,
		STATKEY_CON = 1,
		STATKEY_SPD = 1
	)
	subclass_skills = list(
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/axes = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/tanning = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/riding = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/butchering = SKILL_LEVEL_MASTER,
	)

/datum/outfit/job/roguetown/adventurer/butcher/pre_equip(mob/living/carbon/human/H)
	..()
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
	backl = /obj/item/storage/backpack/rogue/satchel
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/rogueweapon/huntingknife/cleaver // old tbutcher had no knife. as a butcher.
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	backpack_contents = list(
						/obj/item/kitchen/spoon,
						/obj/item/reagent_containers/food/snacks/rogue/truffles,
						/obj/item/flashlight/flare/torch = 1,
						/obj/item/recipe_book/survival = 1,
						/obj/item/reagent_containers/food/snacks/fat = 2, // make sausages :)
						/obj/item/rogueweapon/scabbard/sheath = 1
						)
	if(H.pronouns == SHE_HER || H.pronouns == THEY_THEM_F)
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
	else
		pants = /obj/item/clothing/under/roguetown/trou
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
