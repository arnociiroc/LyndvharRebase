/datum/migrant_role/grenzelhoft/envoy
	greet_text = ""
	outfit = /datum/outfit/job/roguetown/grenzelhoft/envoy
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
/datum/outfit/job/roguetown/grenzelhoft/envoy/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/circlet
	neck = /obj/item/clothing/neck/roguetown/leather
	cloak = /obj/item/clothing/cloak/stabard/surcoat/bailiff
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	gloves = /obj/item/clothing/gloves/roguetown/angle/grenzelgloves
	id = /obj/item/clothing/ring/gold
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/grenzelhoft
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/grenzelpants
	shoes = /obj/item/clothing/shoes/roguetown/grenzelhoft
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	backl = /obj/item/storage/backpack/rogue/satchel/short
	l_hand = /obj/item/rogueweapon/sword/sabre
	beltl = /obj/item/rogueweapon/scabbard/sword
	beltr = /obj/item/flashlight/flare/torch/lantern
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1, 
		/obj/item/natural/feather = 1,
		/obj/item/paper/scroll = 2
		)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 1)
	H.change_stat("perception", 1)
	H.change_stat("speed", 2)
	H.change_stat("intelligence", 2)
	H.cmode_music = 'sound/music/combat_grenzelhoft.ogg'
	ADD_TRAIT(H, TRAIT_OUTLANDER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	H.grant_language(/datum/language/grenzelhoftian)

/datum/migrant_role/grenzelhoft/doppelsoldner
	greet_text = ""
	outfit = /datum/outfit/job/roguetown/grenzelhoft/doppelsoldner
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
/datum/outfit/job/roguetown/grenzelhoft/doppelsoldner/pre_equip(mob/living/carbon/human/H)
	..()
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/flashlight/flare/torch
	neck = /obj/item/clothing/neck/roguetown/gorget/steel
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/grenzelhoft
	head = /obj/item/clothing/head/roguetown/grenzelhofthat
	armor = /obj/item/clothing/suit/roguetown/armor/plate/blacksteel_half_plate
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/grenzelpants
	shoes = /obj/item/clothing/shoes/roguetown/grenzelhoft
	gloves = /obj/item/clothing/gloves/roguetown/angle/grenzelgloves
	backr = /obj/item/storage/backpack/rogue/satchel/short
	backl = /obj/item/rogueweapon/scabbard/gwstrap
	r_hand = /obj/item/rogueweapon/greatsword/grenz
	backpack_contents = list(
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/rogueweapon/huntingknife/idagger = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1
		)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)	//Won't be using normally with Zwiehander but useful.
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)	//Trust me, they'll need it due to stamina drain on their base-sword.
	H.change_stat("strength", 2)	//Should give minimum required stats to use Zweihander
	H.change_stat("endurance", 4)
	H.change_stat("constitution", 3)
	H.change_stat("perception", 1)
	H.change_stat("speed", -2)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.grant_language(/datum/language/grenzelhoftian)

/datum/migrant_role/grenzelhoft/boltslinger
	greet_text = ""
	outfit = /datum/outfit/job/roguetown/grenzelhoft/boltslinger
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
/datum/outfit/job/roguetown/grenzelhoft/boltslinger/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/grenzelhofthat
	neck = /obj/item/clothing/neck/roguetown/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	gloves = /obj/item/clothing/gloves/roguetown/angle/grenzelgloves
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/grenzelhoft
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/grenzelpants
	shoes = /obj/item/clothing/shoes/roguetown/grenzelhoft
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	backl = /obj/item/storage/backpack/rogue/satchel/short
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/slurbow
	l_hand = /obj/item/rogueweapon/sword/short
	beltl = /obj/item/rogueweapon/scabbard/sword
	beltr = /obj/item/quiver/bolts
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/flashlight/flare/torch/lantern = 1
		)
