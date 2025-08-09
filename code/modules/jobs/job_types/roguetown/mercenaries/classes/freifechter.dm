/datum/advclass/mercenary/freelancer
	name = "Kargradi Freifechter"
	tutorial = "As a member of the Kargrade Freifechters - \"Freelancers\" - you are a member of the Potentate's largest mercenary guild from the southeastern most part of Grenzelhoft, recognized as a mercenary force by the Kaiser themself, tasked with protecting a portion of the border against the Khaliphate. It is not uncommon to see one of these warriors dressed in equipment similar to the Khaliphate- as they adorn themselves in their gear like trophies. It has waned in recent years due to a lack of necessity, causing contingents to find work elsewhere- this one in particular made its way to Llewyn."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
	outfit = /datum/outfit/job/roguetown/mercenary/freelancer
	category_tags = list(CTAG_MERCENARY)
	traits_applied = list(TRAIT_OUTLANDER)
	cmode_music = 'sound/music/combat_routier.ogg'	
	classes = list("Kardforgató" = "As part of the Potentate's leading vanguard, you have served diligently along the Khaliphate border. Wielder of Beowricke's most versatile and noble weapon, you needn't anything else.",
					"Lándzsa" = "You put complete trust in your polearm, the most effective weapon this side of the world has seen- perfect for piercing through Khaliphate raids. Your worth has found use abroad outside of the Potentate's gaze.")

/datum/outfit/job/roguetown/mercenary/freelancer/pre_equip(mob/living/carbon/human/H)
	..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Kardforgató","Lándzsa")
	var/classchoice = input("Which master did you train under?", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Kardforgató")
			H.set_blindness(0)
			to_chat(H, span_warning("As part of the Potentate's leading vanguard, you have served diligently along the Khaliphate border. Wielder of Beowricke's most versatile and noble weapon, you needn't anything else. You can choose a regional longsword."))
			H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
			H.change_stat("perception", 2)
			H.change_stat("constitution", 3)
			H.change_stat("intelligence", 3)
			l_hand = /obj/item/rogueweapon/scabbard/sword
			var/weapons = list("Dunargiac Longsword", "Kriegsmesser", "Freifechter Longsword", "Field Longsword")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Dunargiac Longsword") // A longsword with a compound ricasso. Accompanied by a traditional flip knife.
					r_hand = /obj/item/rogueweapon/sword/long/dunargi
					beltr = /obj/item/rogueweapon/huntingknife/idagger/navaja
				if("Kriegsmesser")		// Och- eugh- German!
					r_hand = /obj/item/rogueweapon/sword/long/kriegmesser
					beltr = /obj/item/rogueweapon/huntingknife/idagger
				if("Freifechter Longsword")	// A sharp feder. Less damage, better defense. Definitely not a good choice.
					r_hand = /obj/item/rogueweapon/sword/long/frei
					beltr = /obj/item/rogueweapon/huntingknife/idagger
				if("Field Longsword")	//A common longsword.
					r_hand = /obj/item/rogueweapon/sword/long
					beltr = /obj/item/rogueweapon/huntingknife/idagger
		if("Lándzsa")
			H.set_blindness(0)
			to_chat(H, span_warning("You put complete trust in your polearm, the most effective weapon this side of the world has seen- perfect for piercing through Khaliphate raids. You can choose your polearm, and are exceptionally accurate."))
			H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
			H.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
			H.change_stat("strength", 2)
			H.change_stat("perception", 3)
			H.change_stat("constitution", 3)
			H.change_stat("speed", -1)
			beltr = /obj/item/rogueweapon/scabbard/sheath
			l_hand = /obj/item/rogueweapon/huntingknife/idagger
			backl = /obj/item/gwstrap
			var/weapons = list("Freifechter Spear", "Lucerne")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Freifechter Spear") // A steel spear with a cool-looking stick & a banner sticking out of it.
					r_hand = /obj/item/rogueweapon/spear/boar/frei
					wrists = /obj/item/rogueweapon/katar/punchdagger/frei
				if("Boar Spear") // A normal boar spear. Without the freifechter stuff on it.
					r_hand = /obj/item/rogueweapon/spear/boar
					wrists = /obj/item/rogueweapon/katar/punchdagger
				if("Lucerne")		// A normal lucerne for the people that get no drip & no bitches.
					r_hand = /obj/item/rogueweapon/eaglebeak/lucerne
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	head = /obj/item/clothing/head/roguetown/roguehood/pontifex
	mask = /obj/item/clothing/mask/rogue/lordmask/khazumian
	neck = /obj/item/clothing/neck/roguetown/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	gloves = /obj/item/clothing/gloves/roguetown/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/pontifex
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	backr = /obj/item/storage/backpack/rogue/satchel/short

	backpack_contents = list(/obj/item/roguekey/mercenary, /obj/item/rogueweapon/scabbard/sheath, /obj/item/flashlight/flare/torch/lantern)

	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_OUTDOORSMAN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BADTRAINER, TRAIT_GENERIC)
	H.grant_language(/datum/language/kargradi)
