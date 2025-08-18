/datum/advclass/brigand //Strength class, starts with axe or flails and medium armor training
	name = "Brigand"
	tutorial = "Cast from society, you use your powerful physical might and endurance to take from those who are weaker from you."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/bandit/brigand
	category_tags = list(CTAG_BANDIT)
	cmode_music = 'sound/music/combat_bandit.ogg'

/datum/outfit/job/roguetown/bandit/brigand/pre_equip(mob/living/carbon/human/H)
	..()
	if (!(istype(H.patron, /datum/patron/inhumen/matthios)))
		to_chat(H, span_warning("My former deity has abandoned me.. Matthios is my new master."))
		H.set_patron(/datum/patron/inhumen/matthios)	// MATTY.
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	belt = /obj/item/storage/belt/rogue/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/brown
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backr = /obj/item/storage/backpack/rogue/satchel/short
	backpack_contents = list(
					/obj/item/needle/thorn = 1,
					/obj/item/natural/cloth = 1,
					/obj/item/flashlight/flare/torch = 1,
					)
	mask = /obj/item/clothing/mask/rogue/facemask/hound
	neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
	head = /obj/item/clothing/head/roguetown/helmet/leather/volfhelm
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	id = /obj/item/mattcoin
	H.change_stat("strength", 3)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)
	H.change_stat("intelligence", -1)
	H.change_stat("speed", 1)
	H.change_stat("fortune", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.adjust_blindness(-3)
	var/weapons = list("Battleaxe & Cudgel","Flail & Shield")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Battleaxe & Cudgel") //one weapon to hurt people one weapon to kill people
			backl= /obj/item/rogueweapon/stoneaxe/battle
			beltr = /obj/item/rogueweapon/mace/cudgel
		if("Flail & Shield") //plate users beware, you're in for a scare!
			backl= /obj/item/rogueweapon/shield/tower
			beltr = /obj/item/rogueweapon/flail/sflail
