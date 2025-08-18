/datum/advclass/roguemage //mage class - like the adventurer mage, but more evil.
	name = "Rogue Mage"
	tutorial = "Those fools at the academy laughed at you and cast you from the ivory tower of higher learning and magickal practice. No matter - you will ascend to great power one day, but first you need wealth - vast amounts of it. Show those fools in the town what REAL magic looks like."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	maximum_possible_slots = 1 // mages are supposed to be rare
	outfit = /datum/outfit/job/roguetown/bandit/roguemage
	category_tags = list(CTAG_BANDIT)
	cmode_music = 'sound/music/combat_bandit.ogg'

/datum/outfit/job/roguetown/bandit/roguemage/pre_equip(mob/living/carbon/human/H)
	..()
	if (!(istype(H.patron, /datum/patron/inhumen/matthios)))
		to_chat(H, span_warning("My former deity has abandoned me.. Matthios is my new master."))
		H.set_patron(/datum/patron/inhumen/matthios)	// MATTY.
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/brown
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/black
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	backr = /obj/item/storage/backpack/rogue/satchel/short
	backpack_contents = list(
					/obj/item/needle/thorn = 1,
					/obj/item/natural/cloth = 1,
					/obj/item/flashlight/flare/torch = 1,
					/obj/item/book/spellbook = 1, // Spell resetting is a key identity of good mage
					)
	mask = /obj/item/clothing/mask/rogue/facemask
	neck = /obj/item/clothing/neck/roguetown/coif/heavypadding
	head = /obj/item/clothing/head/roguetown/roguehood/black
	id = /obj/item/mattcoin

	r_hand = /obj/item/rogueweapon/woodstaff/diamond
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE) // Jman Polearms, for better parrying without making them bandit level 
	H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE) //needs climbing to get into hideout
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE) // Standards for athletics is 3, give them 2
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/alchemy, 3, TRUE)
	H.adjust_skillrank(/datum/skill/magic/arcane, 4, TRUE)
	ADD_TRAIT(H, TRAIT_MAGEARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ARCYNE_T3, TRAIT_GENERIC)
	if(H.age == AGE_OLD)
		head = /obj/item/clothing/head/roguetown/wizhat/gen
		armor = /obj/item/clothing/suit/roguetown/shirt/robe
		H.adjust_skillrank(/datum/skill/magic/arcane, 1, TRUE)
		H.change_stat("intelligence", 1)
		H.change_stat("perception", 1)
		H.mind?.adjust_spellpoints(6)
	H.change_stat("intelligence", 3)
	H.change_stat("constitution", 1)
	H.change_stat("perception", 2) // Adv mage get 2 perception so whatever. It is useful for aiming body parts but have no direct synergy with spells. 
	H.change_stat("endurance", 3)
	H.change_stat("fortune", 2)
	H.change_stat("speed", 1)
	H.mind?.adjust_spellpoints(21) // On par with Mage Associate
	H.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
