/datum/job/roguetown/tailor
	title = "Tailor"
	flag = TAILOR
	department_flag = YEOMEN
	faction = "Station"
	tutorial = "Cloth, linen, silk and leather. You've tirelessly studied and poured your life into \
	sewing articles of protection, padding, and fashion for serf and noble alike. While many may not see you as such, you are perhaps \
	one of the most important individuals in the city: your deft hand and meticulous work will keep many a citizen alive and well-fitted."
	total_positions = 1
	spawn_positions = 1
	display_order = 6
	min_pq = 0
	selection_color = JCOLOR_YEOMAN
	allowed_races = RACES_ALL_KINDS
	display_order = JDO_TAILOR
	outfit = /datum/outfit/job/roguetown/tailor
	give_bank_account = 16
	min_pq = -4
	max_pq = null
	round_contrib_points = 4
	cmode_music = 'sound/music/cmode/towner/combat_towner3.ogg'

/datum/outfit/job/roguetown/tailor/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 5, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/tanning, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	pants = /obj/item/clothing/under/roguetown/tights
	belt = /obj/item/storage/belt/rogue/leather/cloth
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltl = /obj/item/rogueweapon/huntingknife/scissors/steel
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backr = /obj/item/storage/backpack/rogue/satchel/short
	backpack_contents = list(
		/obj/item/needle, 
		/obj/item/storage/keyring/tailor,
		/obj/item/dye_brush, 
		/obj/item/recipe_book/sewing, 
		/obj/item/recipe_book/leatherworking
		)
	if(should_wear_femme_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress
	else if(should_wear_masc_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/tunic/random
	H.change_stat("intelligence", 2)
	H.change_stat("perception", 1)
	H.change_stat("speed", 1)
	H.change_stat("strength", -1)
