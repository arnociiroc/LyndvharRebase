/datum/job/roguetown/dungeoneer
	title = "Dungeoneer"
	flag = DUNGEONEER
	department_flag = GARRISON
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_ALL_KINDS
	allowed_sexes = list(MALE, FEMALE)

	display_order = JDO_DUNGEONEER

	tutorial = "Sometimes at night you stare into the vacant room and feel the loneliness of your existence crawl into whatever remains of your loathsome soul. You will never know hunger, thirst or want for anything with the mammons you make: Just as you’ll never forget the sounds a saw makes cutting through the bone, what a drowning man will gurgle out between the blood and teeth strangling his breath. You’re a terrible person, and the carriagemen are going to enjoy walking you down that lonesome path to hell."

	announce_latejoin = FALSE
	outfit = /datum/outfit/job/roguetown/dungeoneer
	give_bank_account = 25
	min_pq = 0
	max_pq = null
	round_contrib_points = 1

	cmode_music = 'sound/music/combat_garrison.ogg'

	stat_ceilings = list(STAT_STRENGTH = 16, STAT_CONSTITUTION = 16, STAT_ENDURANCE = 16)

/datum/job/roguetown/dungeoneer/New()
	. = ..()
	peopleknowme = list()
	for(var/X in GLOB.garrison_positions)
		peopleknowme += X
	for(var/X in GLOB.noble_positions)
		peopleknowme += X
	for(var/X in GLOB.courtier_positions)
		peopleknowme += X

/datum/outfit/job/roguetown/dungeoneer
	job_bitflag = BITFLAG_GARRISON

/datum/outfit/job/roguetown/dungeoneer/pre_equip(mob/living/carbon/human/H)
	..()
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/rogueweapon/whip/antique
	beltl = /obj/item/storage/keyring/dungeoneer
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 2,
		/obj/item/flashlight/flare/torch/lantern = 1,
		) //No armoury access
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE) //hilarious
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)//Enough for majority of surgeries without grinding.
	H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
	H.change_stat("strength", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 2)
	//Torture victim is for inquisition - doesn't even work without a psicross anymore so maybe come up with a variant for him specifically?
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DUNGEONMASTER, TRAIT_GENERIC)
	switch(H.patron?.type)
		if(/datum/patron/divine/necra)
			head = /obj/item/clothing/head/roguetown/necrahood
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/necra
		else
			cloak = /obj/item/clothing/cloak/stabard/dungeon
			head = /obj/item/clothing/head/roguetown/menacing
