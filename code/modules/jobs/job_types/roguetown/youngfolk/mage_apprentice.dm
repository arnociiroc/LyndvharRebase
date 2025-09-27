/datum/job/roguetown/wapprentice
	title = "Magus Apprentice"
	flag = MAGEAPPRENTICE
	department_flag = YOUNGFOLK
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_races = RACES_SHUNNED_UP
	allowed_ages = list(AGE_ADULT)
	allowed_sexes = list(MALE, FEMALE)
	spells = list(/obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
	advclass_cat_rolls = list(CTAG_WAPPRENTICE = 20)

	tutorial = "Your master once saw potential in you, although you are uncertain if they still do, given how rigorous and difficult your studies have been. The path to using magic is a treacherous and untamed one, and you are still decades away from calling yourself even a journeyman in the field. Listen and serve, and someday you will earn your hat."

	outfit = /datum/outfit/job/roguetown/wapprentice

	display_order = JDO_MAGEAPPRENTICE
	give_bank_account = TRUE

	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	cmode_music = 'sound/music/cmode/nobility/combat_courtmage.ogg'
	advjob_examine = TRUE // So that Archmaguss can know if they're teachin' a Apprentice or if someone's a bit more advanced of a player. Just makes the title show up as the advjob's name.

	job_traits = list(TRAIT_MAGEARMOR, TRAIT_ARCYNE_T3)
	job_subclasses = list(
		/datum/advclass/wapprentice/associate,
		/datum/advclass/wapprentice/alchemist,
		/datum/advclass/wapprentice/apprentice
	)

/datum/outfit/job/roguetown/wapprentice
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	pants = /obj/item/clothing/under/roguetown/tights/random
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/magebag/associate
	beltr = /obj/item/storage/keyring/mageapprentice
	backl = /obj/item/storage/backpack/rogue/satchel/short
	backr = /obj/item/rogueweapon/woodstaff
	shoes = /obj/item/clothing/shoes/roguetown/gladiator // FANCY SANDALS

/datum/advclass/wapprentice/associate
	name = "Magus Apprentice"
	tutorial = "You were once an apprentice, though through your studies and practice you've mastered the basics of the arcyne. You now spend your days working under your master, honing your skills so that you might one day be considered a true master yourself."
	outfit = /datum/outfit/job/roguetown/wapprentice/associate

	category_tags = list(CTAG_WAPPRENTICE)
	subclass_stats = list(
		STATKEY_INT = 3,
		STATKEY_PER = 2,
		STATKEY_SPD = 1
	)
	subclass_spellpoints = 21
	subclass_skills = list(
		/datum/skill/combat/polearms = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/riding = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/reading = SKILL_LEVEL_MASTER,
		/datum/skill/craft/alchemy = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/magic/arcane = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,
	)

/datum/outfit/job/roguetown/wapprentice/associate/pre_equip(mob/living/carbon/human/H)
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/mage
	head = /obj/item/clothing/head/roguetown/roguehood/mage
	backpack_contents = list(
		/obj/item/roguegem/amethyst = 1,
		/obj/item/spellbook_unfinished/pre_arcyne = 1,
		/obj/item/recipe_book/alchemy = 1,
		/obj/item/recipe_book/magic = 1,
		/obj/item/chalk = 1,
		)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/magic/arcane, 1, TRUE)
		H.change_stat(STATKEY_SPD, -1)
		H.change_stat(STATKEY_INT, 1)
		H.mind?.adjust_spellpoints(6)
	switch(H.patron?.type)
		if(/datum/patron/inhumen/zizo)
			H.cmode_music = 'sound/music/combat_heretic.ogg'

/datum/advclass/wapprentice/alchemist
	name = "Alchemical Apprentice"
	tutorial = "During your studies, you became less focused on the arcyne and instead turned yourself to your true passion, alchemy. Through the art of transmutation, you have learned that the elements (much like the arcyne) can be maniupulated and bent to your will."
	outfit = /datum/outfit/job/roguetown/wapprentice/alchemist

	category_tags = list(CTAG_WAPPRENTICE)
	traits_applied = list(TRAIT_SEEDKNOW)
	subclass_stats = list(
		STATKEY_INT = 3,
		STATKEY_PER = 3,
		STATKEY_WIL = 1
	)
	subclass_spellpoints = 18
	subclass_skills = list(
		/datum/skill/combat/polearms = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/reading = SKILL_LEVEL_MASTER,
		/datum/skill/craft/alchemy = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_NOVICE,
		/datum/skill/magic/arcane = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/farming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sewing = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/mining = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/fishing = SKILL_LEVEL_NOVICE,
	)

/datum/outfit/job/roguetown/wapprentice/alchemist/pre_equip(mob/living/carbon/human/H)
	backpack_contents = list(
		/obj/item/roguegem/amethyst = 1,
		/obj/item/seeds/swampweed = 1,
		/obj/item/seeds/pipeweed = 1,
		/obj/item/recipe_book/alchemy = 1,
		/obj/item/recipe_book/magic = 1,
		/obj/item/chalk = 1,
		/obj/item/spellbook_unfinished/pre_arcyne = 1
		)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/craft/alchemy, 1, TRUE)
		H.change_stat(STATKEY_PER, -1)
		H.change_stat(STATKEY_INT, 1)
	switch(H.patron?.type)
		if(/datum/patron/inhumen/zizo)
			H.cmode_music = 'sound/music/combat_heretic.ogg'

/datum/advclass/wapprentice/apprentice
	name = "Magus Novitiate"
	tutorial = "Your master once saw potential in you, although you are uncertain if they still do, given how rigorous and difficult your studies have been. The path to using magic is a treacherous and untamed one, and you are still decades away from calling yourself even a journeyman in the field. Listen and serve, and someday you will earn your hat."
	outfit = /datum/outfit/job/roguetown/wapprentice/apprentice

	category_tags = list(CTAG_WAPPRENTICE)
	subclass_stats = list(
		STATKEY_INT = 4,
		STATKEY_WIL = 1,
		STATKEY_SPD = 1,
		STATKEY_LCK = 1 // this is just a carrot for the folk who are mad enough to take this role...
	)
	subclass_spellpoints = 18
	subclass_skills = list(
		/datum/skill/misc/reading = SKILL_LEVEL_MASTER,
		/datum/skill/magic/arcane = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/alchemy = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/polearms = SKILL_LEVEL_NOVICE,
	)

/datum/outfit/job/roguetown/wapprentice/apprentice/pre_equip(mob/living/carbon/human/H)
	backpack_contents = list(
		/obj/item/roguegem/amethyst = 1,
		/obj/item/recipe_book/alchemy = 1,
		/obj/item/recipe_book/magic = 1,
		/obj/item/spellbook_unfinished/pre_arcyne = 1,
		/obj/item/chalk = 1,
		)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/craft/alchemy, 1, TRUE)
		H.adjust_skillrank(/datum/skill/magic/arcane, 1, TRUE)
		H.change_stat(STATKEY_SPD, -1)
		H.change_stat(STATKEY_INT, 1)
		H.mind?.adjust_spellpoints(3)
	switch(H.patron?.type)
		if(/datum/patron/inhumen/zizo)
			H.cmode_music = 'sound/music/combat_heretic.ogg'
