/datum/advclass/mercenary/seonjang //shitcode approved by free
	name = "Seonjang"
	tutorial = "The respected leader and singular representative of the Ruma clan, you're an experienced swordsman. It matters not where the coin comes from, so long as you can make enough to support the clan in its survival from the Xinyi Dynasty and its conflicts, now in strange lands."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/human/northern,
		/datum/species/elf/wood,
		/datum/species/human/halfelf,
		/datum/species/demihuman,
		/datum/species/vulpkanin,
	)
	outfit = /datum/outfit/job/roguetown/mercenary/seonjang
	category_tags = list(CTAG_MERCENARY)
	traits_applied = list(TRAIT_OUTLANDER)
	cmode_music = 'sound/music/combat_saltlia.ogg'
	maximum_possible_slots = 1

/datum/outfit/job/roguetown/mercenary/seonjang/pre_equip(mob/living/carbon/human/H)
	..()
	belt = belt = /obj/item/storage/belt/rogue/leather/knifebelt/black/saltlian
	beltr = /obj/item/rogueweapon/sword/sabre/mulyeog/rumacaptain
	beltl = /obj/item/rogueweapon/scabbard/sword/saltlian/gold
	backr = /obj/item/storage/backpack/rogue/satchel/short
	backpack_contents = list(
		/obj/item/roguekey/mercenary,
		/obj/item/flashlight/flare/torch/lantern,
		/obj/item/storage/belt/rogue/pouch/coins/poor,
		/obj/item/rogueweapon/scabbard/sheath,
		/obj/item/rogueweapon/huntingknife/idagger/steel/saltlian
		)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.change_stat("strength", 3)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)
	H.change_stat("perception", 3)
	H.change_stat("speed", -1)
	H.adjust_blindness(-3)

	if(should_wear_masc_clothes(H))
		head = /obj/item/clothing/head/roguetown/mentorhat
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/eastshirt1
		cloak = /obj/item/clothing/cloak/eastcloak1
		pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/eastpants1
		gloves = /obj/item/clothing/gloves/roguetown/eastgloves2
		armor = /obj/item/clothing/suit/roguetown/shirt/undershirt/easttats
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
		H.dna.species.soundpack_m = new /datum/voicepack/male/evil()
	else if(should_wear_femme_clothes(H))
		head = /obj/item/clothing/head/roguetown/mentorhat
		armor = /obj/item/clothing/suit/roguetown/armor/basiceast/captainrobe
		cloak = /obj/item/clothing/cloak/eastcloak1
		gloves = /obj/item/clothing/gloves/roguetown/eastgloves2
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/easttats
		pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/eastpants2
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced/short

	ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC) //i swear this isn't as good as it sounds
	H.grant_language(/datum/language/saltlian)
	H.merctype = 9
