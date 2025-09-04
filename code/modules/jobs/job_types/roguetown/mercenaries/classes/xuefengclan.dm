/datum/advclass/mercenary/xuefengclan
	name = "Xuefeng Clan"
	tutorial = "A band of foreign outcast Saltlians. The Xuefeng are outcasts from the Xinyi-Duvalti triad currently overseeing Saltlia, believed to be associated with the rebels during the Xinyi revolt. The clan departed lest they risked being executed for such suspicions, or worse. It is no organized group of soldiers, but rather a loose collection of experienced fighters that have wandered an entire continent to get here."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/human/northern,
		/datum/species/elf/wood,
		/datum/species/human/halfelf,
		/datum/species/demihuman,
		/datum/species/vulpkanin,
	)
	outfit = /datum/outfit/job/roguetown/mercenary/xuefengclan
	category_tags = list(CTAG_MERCENARY)
	traits_applied = list(TRAIT_OUTLANDER)
	cmode_music = 'sound/music/combat_saltlia.ogg'
	classes = list("Gun-in" = "You are well versed and experienced in swordfighting, you have no problem in taking up most jobs so long as the coin is good, for either yourself or the Xuefeng.",
					"Gungsu" = "You are an experienced archer of the clan, and many have called you a true marksman for your skills with the bow. You have no problem in taking up most jobs so long as the coin is good, for either yourself or the Xuefeng.")
/datum/outfit/job/roguetown/mercenary/xuefengclan/pre_equip(mob/living/carbon/human/H)
	..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Gun-in", "Gungsu")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes //probably gonna add in some more classes when i get more sprites

	switch(classchoice)
		if("Gun-in")
			H.set_blindness(0)
			to_chat(H, span_warning("You are well versed and experienced in swordfighting, you have no problem in taking up most jobs so long as the coin is good, for either yourself or the Xuefeng."))
			belt = /obj/item/storage/belt/rogue/leather/black
			beltr = /obj/item/rogueweapon/scabbard/sword/saltlian/steel
			beltl = /obj/item/rogueweapon/sword/sabre/mulyeog/xuefenghench
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/eastshirt2
			cloak = /obj/item/clothing/cloak/eastcloak2
			neck = /obj/item/clothing/neck/roguetown/leather
			armor = /obj/item/clothing/suit/roguetown/shirt/undershirt/easttats
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/eastpants2
			shoes = /obj/item/clothing/shoes/roguetown/armor/xuefengclan
			gloves = /obj/item/clothing/gloves/roguetown/eastgloves2
			backr = /obj/item/storage/backpack/rogue/satchel/short
			backpack_contents = list(
				/obj/item/roguekey/mercenary,
				/obj/item/flashlight/flare/torch/lantern,
				/obj/item/storage/belt/rogue/pouch/coins/poor
				)
			H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.change_stat("strength", 2)
			H.change_stat("endurance", 2)
			H.change_stat("constitution", 3)
			H.change_stat("perception", 1)
			H.change_stat("speed", -1)

		if("Gungsu")
			H.set_blindness(0)
			to_chat(H, span_warning("You are an experienced archer of the clan, and many have called you a true marksman for your skills with the bow. You have no problem in taking up most jobs so long as the coin is good, for either yourself or the Xuefeng."))
			belt = /obj/item/storage/belt/rogue/leather/black
			beltr = /obj/item/quiver/arrows
			beltl = /obj/item/flashlight/flare/torch/lantern
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/eastshirt2
			cloak = /obj/item/clothing/cloak/eastcloak2
			armor = /obj/item/clothing/suit/roguetown/shirt/undershirt/easttats
			neck = /obj/item/clothing/neck/roguetown/leather
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/eastpants2
			shoes = /obj/item/clothing/shoes/roguetown/armor/xuefengclan
			gloves = /obj/item/clothing/gloves/roguetown/eastgloves2
			backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
			backr = /obj/item/storage/backpack/rogue/satchel/short
			backpack_contents = list(
				/obj/item/roguekey/mercenary,
				/obj/item/storage/belt/rogue/pouch/coins/poor,
				/obj/item/rogueweapon/huntingknife/idagger/steel/saltlian,
				/obj/item/rogueweapon/scabbard/sheath = 1,
				)
			H.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
			H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
			H.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
			H.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
			H.change_stat("constitution", -1)
			H.change_stat("endurance", 2)
			H.change_stat("perception", 2)
			H.change_stat("speed", 4)
			H.change_stat("strength", -1)

	ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC) //i swear this isn't as good as it sounds
	H.grant_language(/datum/language/saltlian)
	H.merctype = 9
