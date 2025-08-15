/datum/migrant_role/underdark/thrallmaster
	name = "Underdark Thrallmaster"
	greet_text = ""
	outfit = /datum/outfit/job/roguetown/underdark/thrallmaster
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
/datum/outfit/job/roguetown/underdark/thrallmaster/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/sallet/visored/iron
	neck = /obj/item/clothing/neck/roguetown/gorget
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/black
	armor = /obj/item/clothing/suit/roguetown/armor/plate/iron
	gloves = /obj/item/clothing/gloves/roguetown/chain/iron
	wrists = /obj/item/clothing/wrists/roguetown/bracers/iron
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/iron
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	backl = /obj/item/storage/backpack/rogue/satchel/short
	beltl = /obj/item/rogueweapon/sword/rapier/dec
	beltr = /obj/item/rogueweapon/huntingknife/idagger/silver/elvish
	backpack_contents = list(
		/obj/item/rogueweapon/scabbard/sheath = 1, 
		/obj/item/flashlight/flare/torch/lantern = 1, 
		/obj/item/storage/belt/rogue/pouch/coins/rich = 1, 
		/obj/item/rope/chain = 2,
		/obj/item/clothing/neck/roguetown/collar/leather/nomagic = 1)

	H.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
	H.change_stat("strength", 3)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", -1)
	H.change_stat("perception", 1)
	H.change_stat("speed", -1)
	H.change_stat("intelligence", 1)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_PERFECT_TRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_OUTLANDER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)

/datum/migrant_role/underdark/halberdier
	name = "Underdark Halberdier"
	greet_text = ""
	outfit = /datum/outfit/job/roguetown/underdark/halberdier
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
/datum/outfit/job/roguetown/underdark/halberdier/pre_equip(mob/living/carbon/human/H)
	..()


/datum/migrant_role/underdark/bladesinger
	name = "Underdark Bladesinger"
	greet_text = ""
	outfit = /datum/outfit/job/roguetown/underdark/bladesinger
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
/datum/outfit/job/roguetown/underdark/bladesinger/pre_equip(mob/living/carbon/human/H)
	..()


/datum/migrant_role/underdark/archer
	name = "Underdark Archer"
	greet_text = ""
	outfit = /datum/outfit/job/roguetown/underdark/archer
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
/datum/outfit/job/roguetown/underdark/archer/pre_equip(mob/living/carbon/human/H)
	..()


/datum/migrant_role/underdark/slave
	name = "Underdark Slave"
	greet_text = ""
	outfit = /datum/outfit/job/roguetown/underdark/slave
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
/datum/outfit/job/roguetown/underdark/slave/pre_equip(mob/living/carbon/human/H)
	..()

