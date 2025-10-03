/datum/advclass/sawbones // doctor class. like the pilgrim, but more evil
	name = "Sawbones"
	tutorial = "It was an accident! Your patient wasn't using his second kidney, anyway. After an unfortunate 'misunderstanding' with the town and your medical practice, you know practice medicine on the run with your new associates. Business has never been better!"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/bandit/sawbones
	category_tags = list(CTAG_BANDIT)
	cmode_music = 'sound/music/combat_physician.ogg'
	traits_applied = list(TRAIT_MEDICINE_EXPERT, TRAIT_NOSTINK, TRAIT_EMPATH, TRAIT_DODGEEXPERT, TRAIT_DECEIVING_MEEKNESS, TRAIT_ALCHEMY_EXPERT)
	subclass_stats = list(
		STATKEY_INT = 4,
		STATKEY_SPD = 3,
		STATKEY_LCK = 3
	)
	subclass_skills = list(
		/datum/skill/combat/knives = SKILL_LEVEL_EXPERT, // scalpel stabbing
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/crafting = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/carpentry = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/labor/lumberjacking = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN, //needed for getting into hideout
		/datum/skill/misc/sneaking = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_LEGENDARY,
		/datum/skill/craft/sewing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/alchemy = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/bandit/sawbones/pre_equip(mob/living/carbon/human/H)
	..()
	mask = /obj/item/clothing/mask/rogue/facemask/steel/hound
	head = /obj/item/clothing/head/roguetown/roguehood/feld
	neck = /obj/item/clothing/neck/roguetown/collar/feldcollar
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/feld
	gloves = /obj/item/clothing/gloves/roguetown/angle/atgervi
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/belt/rogue/surgery_bag/full/physician
	l_hand = /obj/item/rogueweapon/huntingknife/idagger/steel
	beltr = /obj/item/rogueweapon/scabbard/sheath
	pants = /obj/item/clothing/under/roguetown/trou
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced/short
	backr = /obj/item/storage/backpack/rogue/satchel/short
	id = /obj/item/mattcoin
	backpack_contents = list(
					/obj/item/natural/worms/leech/cheele = 1,
					/obj/item/natural/cloth = 2,
					/obj/item/flashlight/flare/torch = 1,
					/obj/item/bedroll = 1,
					)
	if(H.age == AGE_OLD)
		H.change_stat(STATKEY_SPD, -1)
		H.change_stat(STATKEY_INT, 1)
		H.change_stat(STATKEY_PER, 1)
	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)

	if (!(istype(H.patron, /datum/patron/inhumen/matthios)))
		to_chat(H, span_warning("My former deity has abandoned me.. Matthios is my new master."))
		H.set_patron(/datum/patron/inhumen/matthios)
