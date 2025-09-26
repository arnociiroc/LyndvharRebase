/datum/job/roguetown/councillor
	title = "Councillor"
	flag = COUNCILLOR
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	allowed_ages = ALL_AGES_LIST
	allowed_races = RACES_SHUNNED_UP
	allowed_sexes = list(MALE, FEMALE)
	display_order = JDO_COUNCILLOR
	tutorial = "You may have bought your way into this position, or were appointed to it by merit--perish the thought! Whatever the case though, you work as an assistant and agent of the city in matters of state, levy, law, or simply enjoying the free food of the keep- you do anything the court requires of you and your duties usually vary day by day. You may be the lowest rung of the ladder, but that rung still towers over everyone else in this shithole. Don't let any of these lesser folk think otherwise."
	whitelist_req = FALSE
	outfit = /datum/outfit/job/roguetown/councillor
	advclass_cat_rolls = list(CTAG_COUNCILLOR = 2)

	give_bank_account = 40
	noble_income = 20
	min_pq = 1
	max_pq = null
	round_contrib_points = 1
	cmode_music = 'sound/music/combat_noble.ogg'
	job_traits = list(TRAIT_SEEPRICES_SHITTY)
	job_subclasses = list(
		/datum/advclass/councillor
	)

/datum/advclass/councillor
	name = "Councillor"
	tutorial = "You may have inherited this position, bought your way into it, or were appointed to it by merit--perish the thought! Whatever the case though, you work as an assistant and agent of the crown in matters of state. Whether this be aiding the steward, the sheriff, or the crown itself, or simply enjoying the free food of the keep, your duties vary day by day. You may be the lowest rung of the ladder, but that rung still towers over everyone else in town."
	outfit = /datum/outfit/job/roguetown/councillor/basic
	category_tags = list(CTAG_COUNCILLOR)
	subclass_stats = list(
		STATKEY_SPD = 2,
		STATKEY_INT = 2,
		STATKEY_PER = 2,
		STATKEY_STR = -1,
		STATKEY_CON = -1
	)
	subclass_skills = list(
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/councillor
	job_bitflag = BITFLAG_ROYALTY

/datum/outfit/job/roguetown/councillor/basic/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	armor = /obj/item/clothing/suit/roguetown/armor/gambeson/councillor
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	pants = /obj/item/clothing/under/roguetown/tights/random
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backl = /obj/item/storage/backpack/rogue/satchel/short
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/keyring/steward // If this turns out to be overbearing re:stewardry bump down to the clerk keyring instead.
	beltr = /obj/item/rogueweapon/huntingknife/idagger/steel
	cloak = /obj/item/clothing/cloak/stabard/surcoat/councillor
