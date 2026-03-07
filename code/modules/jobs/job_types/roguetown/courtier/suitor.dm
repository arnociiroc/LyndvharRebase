/datum/job/roguetown/suitor
	title = "Suitor"
	flag = SUITOR
	department_flag = COURTIERS
	faction = "Station"
	total_positions = 0
	spawn_positions = 0

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	advclass_cat_rolls = list(CTAG_SUITOR = 20)
	tutorial = "You are a noble from a foreign court who has travelled to the city in order to win the hand of Lyndvhar's eligible ruler or his offspring and secure a political ally for your lesser house in this time of civil strife amongst the continent. Competition is fierce due to the city's relative isolation and safety from the war, and it seems you're not the only one vying for the Viscount's favor..."

	outfit = /datum/outfit/job/roguetown/suitor

	display_order = JDO_SUITOR
	give_bank_account = 40
	noble_income = 20
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	cmode_music = 'sound/music/combat_noble.ogg'
	job_traits = list(TRAIT_NOBLE)

/datum/outfit/job/roguetown/suitor
	job_bitflag = BITFLAG_ROYALTY

/datum/advclass/suitor/envoy
	name = "Envoy"
	tutorial = "You're a graceful envoy - fluent in flattery, courtesy, and calculated sincerity. You'll charm your way into the Viscount's heart, winning favor with warmth, wit, and well-timed smiles."
	outfit = /datum/outfit/job/roguetown/suitor/envoy
	category_tags = list(CTAG_SUITOR)
	traits_applied = list(TRAIT_SEEPRICES, TRAIT_NUTCRACKER, TRAIT_GOODLOVER)
	subclass_stats = list(
		STATKEY_INT = 3,
		STATKEY_PER = 3,
		STATKEY_WIL = 1,
		STATKEY_SPD = 1,
		STATKEY_LCK = 1
	)
	subclass_skills = list(
		/datum/skill/misc/music = SKILL_LEVEL_MASTER,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/sewing = SKILL_LEVEL_JOURNEYMAN,
	)

/datum/outfit/job/roguetown/suitor/envoy/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/roguekey/manor
	head = /obj/item/clothing/head/roguetown/nyle/consortcrown
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	backr = /obj/item/storage/backpack/rogue/satchel
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/lowcut
	pants = /obj/item/clothing/under/roguetown/tights
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	id = /obj/item/clothing/ring/signet
	if(should_wear_femme_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gown/wintergown
		backl = /obj/item/rogue/instrument/harp
		beltl = /obj/item/flashlight/flare/torch/lantern
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
		backr = /obj/item/storage/backpack/rogue/satchel
		id = /obj/item/clothing/ring/signet
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
	else if(should_wear_masc_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/tunic/noblecoat
		backl = /obj/item/rogue/instrument/lute
		shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
		belt = /obj/item/storage/belt/rogue/leather
		neck = /obj/item/roguekey/manor
		beltl = /obj/item/flashlight/flare/torch/lantern
		beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
		backr = /obj/item/storage/backpack/rogue/satchel
		id = /obj/item/clothing/ring/signet
/*if(H.mind)
		var/datum/antagonist/new_antag = new /datum/antagonist/suitor()
		H.mind.add_antag_datum(new_antag)*/
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_RICH, H, "Savings.")

/datum/advclass/suitor/schemer
	name = "Schemer"
	tutorial = "You're a silver-tongued snake - master of whispers, poison, and perfectly timed accidents. Why win hearts when you can twist them? With rivals removed and secrets weaponized, the Viscount will have no choice but to choose you."
	outfit = /datum/outfit/job/roguetown/suitor/schemer
	traits_applied = list(TRAIT_ALCHEMY_EXPERT)
	category_tags = list(CTAG_SUITOR)
	subclass_stats = list(
		STATKEY_SPD = 3,
		STATKEY_INT = 1,
		STATKEY_PER = 2,
		STATKEY_LCK = 1
	)
	subclass_skills = list(
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/sneaking = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/stealing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/traps = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/alchemy = SKILL_LEVEL_JOURNEYMAN,
	)

/datum/outfit/job/roguetown/suitor/schemer/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/nyle/consortcrown
	pants = /obj/item/clothing/under/roguetown/tights/black
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord/heavy
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	belt = /obj/item/storage/belt/rogue/leather/black
	neck = /obj/item/roguekey/manor
	beltl = /obj/item/rogueweapon/huntingknife/idagger/steel
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	backr = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/clothing/ring/signet
	armor = /obj/item/clothing/suit/roguetown/shirt/tunic/silktunic
	backpack_contents = list(
		/obj/item/reagent_containers/glass/bottle/rogue/poison = 1,
		/obj/item/lockpick = 1,
		)
	/*if(H.mind)
		var/datum/antagonist/new_antag = new /datum/antagonist/suitor()
		H.mind.add_antag_datum(new_antag)*/
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_RICH, H, "Savings.")

/datum/advclass/suitor/gallant
	name = "Gallant"
	tutorial = "With honor and the flash of your steel, you meet your rivals in open challenge. You'll win the Viscount's favor not with whispers or warmth, but with roaring applause."
	outfit = /datum/outfit/job/roguetown/suitor/gallant
	category_tags = list(CTAG_SUITOR)
	traits_applied = list(TRAIT_MEDIUMARMOR)
	subclass_stats = list(
		STATKEY_STR = 2,
		STATKEY_PER = 2,
		STATKEY_WIL = 1, //no more con but hey you got armour back
		STATKEY_SPD = 1,
		STATKEY_LCK = 1
	)
	subclass_skills = list(
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT, //pushups could impress someone
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN,
	)

/datum/outfit/job/roguetown/suitor/gallant/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/nyle/consortcrown
	mask = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/gallant
	pants = /obj/item/clothing/under/roguetown/tights/black
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	armor = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/valorian
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/roguekey/manor
	beltl = /obj/item/rogueweapon/scabbard/sword/noble
	beltr = /obj/item/rogueweapon/sword/sabre/dec
	backr = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/clothing/ring/signet
	backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/mid = 1, /obj/item/flashlight/flare/torch/lantern = 1)
	/*if(H.mind)
		var/datum/antagonist/new_antag = new /datum/antagonist/suitor()
		H.mind.add_antag_datum(new_antag)*/
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_RICH, H, "Savings.")


/obj/item/clothing/head/roguetown/roguehood/shalal/hijab/gallant
	color = "#384d8a"
