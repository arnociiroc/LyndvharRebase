/datum/job/roguetown/hostage
	title = "Hostage"
	flag = HOSTAGE
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	tutorial = "You're too valuable to outright kill- yet not a free person. You either messed up really bad or got very unlucky. Either way, the city has seen fit to hold you as prisoner for your crimes until ransom is met.. as if that would ever happen. Might as well start praying to whatever patron you find solace in."

	outfit = /datum/outfit/job/roguetown/hostage
	bypass_jobban = TRUE
	display_order = JDO_HOSTAGE
	give_bank_account = 10
	min_pq = -25
	max_pq = null
	can_random = FALSE

/datum/outfit/job/roguetown/hostage/pre_equip(mob/living/carbon/human/H)
	..()
	mask = /obj/item/clothing/mask/rogue/facemask/prisoner
	if(H.wear_mask)
		var/obj/I = H.wear_mask
		H.dropItemToGround(H.wear_mask, TRUE)
		qdel(I)
	armor = /obj/item/clothing/suit/roguetown/shirt/rags
	pants = /obj/item/clothing/under/roguetown/loincloth/brown
	H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/music, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.change_stat("intelligence", 1)
	H.change_stat("fortune", 2)
	if(H.mind)
		var/datum/antagonist/new_antag = new /datum/antagonist/prisoner()
		H.mind.add_antag_datum(new_antag)
	ADD_TRAIT(H, TRAIT_BANDITCAMP, TRAIT_GENERIC)
	wretch_select_bounty(H)
