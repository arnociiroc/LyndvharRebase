/datum/advclass/peasant
	name = "Peasant"
	tutorial = "You are a peasant. While you are not much to start with \
	The only way from rock bottom is up. Good luck."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/peasant
	cmode_music = 'sound/music/cmode/towner/combat_towner2.ogg'
	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)

/datum/outfit/job/roguetown/adventurer/peasant/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/labor/farming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	belt = /obj/item/storage/belt/rogue/leather/rope
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	pants = /obj/item/clothing/under/roguetown/trou
	head = /obj/item/clothing/head/roguetown/armingcap
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backl = /obj/item/storage/backpack/rogue/satchel/short
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	armor = /obj/item/clothing/suit/roguetown/armor/workervest
	mouth = /obj/item/rogueweapon/huntingknife
	beltr = /obj/item/flint
	if(H.pronouns == SHE_HER || H.pronouns == THEY_THEM_F)
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		pants = null
	backpack_contents = list(
						/obj/item/seeds/wheat=1,
						/obj/item/seeds/apple=1,
						/obj/item/ash=1,
						/obj/item/flashlight/flare/torch = 1,
						/obj/item/recipe_book/survival = 1,
						/obj/item/rogueweapon/scabbard/sheath = 1
						)
	beltl = /obj/item/rogueweapon/sickle
	backr = /obj/item/rogueweapon/hoe
	H.change_stat("strength", 1)
	H.change_stat("endurance", 1)
	H.change_stat("intelligence", 3)
