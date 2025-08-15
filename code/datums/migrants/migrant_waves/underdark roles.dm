/datum/migrant_role/underdark/thrallmaster
	name = "Underdark Thrallmaster"
	greet_text = ""
	outfit = /datum/outfit/job/roguetown/underdark/thrallmaster
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
/datum/outfit/job/roguetown/underdark/thrallmaster/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/sallet/visored/iron
	neck = /obj/item/clothing/neck/roguetown/bevor/iron
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/black
	armor = /obj/item/clothing/suit/roguetown/armor/plate/iron
	gloves = /obj/item/clothing/gloves/roguetown/plate/iron
	wrists = /obj/item/clothing/wrists/roguetown/bracers/iron
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/iron
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron
	backl = /obj/item/storage/backpack/rogue/satchel/
	backr = /obj/item/rogueweapon/shield/tower
	beltl = /obj/item/rogueweapon/whip/antique
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
	H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
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
	allowed_races = RACES_SHUNNED_UP
/datum/outfit/job/roguetown/underdark/halberdier/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/kettle/iron
	mask = /obj/item/clothing/mask/rogue/ragmask/black
	neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/black
	armor = /obj/item/clothing/suit/roguetown/armor/plate/iron
	gloves = /obj/item/clothing/gloves/roguetown/chain/iron
	wrists = /obj/item/clothing/wrists/roguetown/bracers/iron
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	backl = /obj/item/storage/backpack/rogue/satchel/short
	backr = /obj/item/gwstrap
	l_hand = /obj/item/rogueweapon/halberd/glaive
	beltr = /obj/item/rogueweapon/huntingknife/idagger/silver/elvish
	backpack_contents = list(
		/obj/item/rogueweapon/scabbard/sheath = 1, 
		/obj/item/flashlight/flare/torch/lantern = 1,
		/obj/item/rope/chain = 2)

	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 1, TRUE)
	H.change_stat("strength", 1)
	H.change_stat("endurance", 3)
	H.change_stat("constitution", 2)
	H.change_stat("perception", -2)
	H.change_stat("speed", -1)
	H.change_stat("intelligence", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_OUTLANDER, TRAIT_GENERIC)

/datum/migrant_role/underdark/bladesinger
	name = "Underdark Bladesinger"
	greet_text = ""
	outfit = /datum/outfit/job/roguetown/underdark/bladesinger
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
/datum/outfit/job/roguetown/underdark/bladesinger/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/roguehood/black
	mask = /obj/item/clothing/mask/rogue/ragmask/black
	neck = /obj/item/clothing/neck/roguetown/gorget
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/black
	armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	backl = /obj/item/storage/backpack/rogue/satchel/short
	l_hand = /obj/item/rogueweapon/sword/falx
	beltl = /obj/item/rogueweapon/scabbard/sword
	beltr = /obj/item/rogueweapon/huntingknife/idagger/silver/elvish
	backpack_contents = list(
		/obj/item/rogueweapon/scabbard/sheath = 1, 
		/obj/item/flashlight/flare/torch/lantern = 1,
		/obj/item/rope/chain = 2)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 1, TRUE)
	H.change_stat("strength", -2)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", -2)
	H.change_stat("perception", 2)
	H.change_stat("speed", 3)
	H.change_stat("intelligence", 1)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_OUTLANDER, TRAIT_GENERIC)

/datum/migrant_role/underdark/archer
	name = "Underdark Archer"
	greet_text = ""
	outfit = /datum/outfit/job/roguetown/underdark/archer
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
/datum/outfit/job/roguetown/underdark/archer/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/roguehood/black
	mask = /obj/item/clothing/mask/rogue/ragmask/black
	neck = /obj/item/clothing/neck/roguetown/gorget
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/black
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	backl = /obj/item/storage/backpack/rogue/satchel/short
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
	beltl = /obj/item/quiver/arrows
	beltr = /obj/item/rogueweapon/huntingknife/idagger/silver/elvish
		backpack_contents = list(
		/obj/item/rogueweapon/scabbard/sheath = 1, 
		/obj/item/flashlight/flare/torch/lantern = 1,
		/obj/item/rope/chain = 2)

	H.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/slings, 2, TRUE) 
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.change_stat("perception", 3)
	H.change_stat("constitution", -1)
	H.change_stat("endurance", 2)
	H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_OUTLANDER, TRAIT_GENERIC)

/datum/migrant_role/underdark/slave
	name = "Underdark Slave"
	greet_text = ""
	outfit = /datum/outfit/job/roguetown/underdark/slave
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
/datum/outfit/job/roguetown/underdark/slave/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/collar/leather/nomagic
	armor = /obj/item/clothing/suit/roguetown/shirt/rags
	pants = /obj/item/clothing/under/roguetown/loincloth/brown
	H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/music, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/labor/butchering, 1, TRUE)
	H.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)
	H.change_stat("intelligence", -1)
	H.change_stat("fortune", 5)
	H.change_stat("constitution", -1)
	H.change_stat("endurance", -2)
	H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_CICERONE, TRAIT_GENERIC)
