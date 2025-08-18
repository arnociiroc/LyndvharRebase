/datum/job/roguetown/magician
	title = "Archmagus"
	flag = WIZARD
	department_flag = COURTIERS
	selection_color = JCOLOR_COURTIER
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_SHUNNED_UP
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD)
	spells = list(/obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
	display_order = JDO_MAGICIAN
	tutorial = "The art of magic and the arcyne in this age is on the decline, but you stand as one of its top practictioners. For your efforts to maintain the art as well as protection from the dark, you were elevated to nobility and given residency in the Manor by the Lord. Keep the traditions of the magi alive, and teach your apprentice what you know, for there is power to be found in what is lost."
	outfit = /datum/outfit/job/roguetown/magician
	whitelist_req = TRUE
	give_bank_account = 47
	min_pq = 4
	max_pq = null
	round_contrib_points = 3
	cmode_music = 'sound/music/cmode/nobility/combat_courtmage.ogg'

	// Can't get very far as a magician if you can't chant spells now can you?
	vice_restrictions = list(/datum/charflaw/mute)

/datum/outfit/job/roguetown/magician
	job_bitflag = BITFLAG_ROYALTY

/datum/outfit/job/roguetown/magician/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/talkstone
	cloak = /obj/item/clothing/cloak/black_cloak
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/black
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced/short
	belt = /obj/item/storage/belt/rogue/leather/plaquegold
	beltr = /obj/item/storage/keyring/mage
	beltl = /obj/item/storage/magebag
	id = /obj/item/clothing/ring/active/nomag
	r_hand = /obj/item/rogueweapon/woodstaff/riddle_of_steel/magos
	backl = /obj/item/storage/backpack/rogue/satchel/short
	backpack_contents = list(
		/obj/item/reagent_containers/glass/bottle/rogue/poison, 
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot,
		/obj/item/recipe_book/alchemy,
		/obj/item/recipe_book/magic,
		/obj/item/book/spellbook,
		/obj/item/rogueweapon/huntingknife/idagger/silver/arcyne
	)
	ADD_TRAIT(H, TRAIT_SEEPRICES, "[type]")
	ADD_TRAIT(H, TRAIT_INTELLECTUAL, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ARCYNE_T4, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	H.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
	H.adjust_skillrank(/datum/skill/craft/alchemy, 5, TRUE)
	H.adjust_skillrank(/datum/skill/magic/arcane, 6, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE) // more stam for holding spells
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
	H.adjust_skillrank(/datum/skill/craft/alchemy, 4, TRUE)
	H.adjust_skillrank(/datum/skill/magic/arcane, 5, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.change_stat("strength", -1)
	H.change_stat("constitution", -1)
	H.change_stat("intelligence", 5) // Automatic advanced magic for most spells. (I.E summon weapon being upgraded to steel from iron/etc)
	H.change_stat("perception", 3)
	H.change_stat("fortune", 1) // Leadership carrot, stats weight lower than usual leadership weight due to having T4 magic.
	if(H.mind)
		H?.mind.adjust_spellpoints(36)
	ADD_TRAIT(H, TRAIT_MAGEARMOR, TRAIT_GENERIC)
	if(H.age == AGE_OLD)
		H.change_stat("speed", -1)
		H.change_stat("intelligence", 1)
		H.change_stat("perception", 1)
		H?.mind.adjust_spellpoints(6)
		if(ishumannorthern(H))
			belt = /obj/item/storage/belt/rogue/leather/plaquegold
			cloak = null
			head = /obj/item/clothing/head/roguetown/wizhat
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/wizard
			H.dna.species.soundpack_m = new /datum/voicepack/male/wizard()
	switch(H.patron?.type)
		if(/datum/patron/inhumen/zizo,
	  		/datum/patron/inhumen/matthios,
	   		/datum/patron/inhumen/graggar,
	   		/datum/patron/inhumen/baotha)
			H.cmode_music = 'sound/music/combat_heretic.ogg'
