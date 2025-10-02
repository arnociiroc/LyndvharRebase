/datum/advclass/blacksmith
	name = "Blacksmith"
	tutorial = "A skilled blacksmith, able to forge capable weapons for warriors in the absence of a guild, \
	only after building a forge for themselves of course."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/blacksmith
	
	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)
	traits_applied = list(TRAIT_TRAINED_SMITH, TRAIT_SMITHING_EXPERT)
	subclass_stats = list(
		STATKEY_WIL = 2,
		STATKEY_CON = 2,
		STATKEY_STR = 1,
		STATKEY_LCK = 1,
		STATKEY_SPD = -1
	)
	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/maces = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/axes = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/crossbows = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/bows = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN, // The strongest fists in the land.
		/datum/skill/combat/knives = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/engineering = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/blacksmithing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/armorsmithing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/weaponsmithing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/smelting = SKILL_LEVEL_JOURNEYMAN
	)

/datum/outfit/job/roguetown/adventurer/blacksmith/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/hammer/iron
	beltl = /obj/item/rogueweapon/tongs
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	gloves = /obj/item/clothing/gloves/roguetown/angle/grenzelgloves/blacksmith
	cloak = /obj/item/clothing/cloak/apron/blacksmith
	mouth = /obj/item/rogueweapon/huntingknife
	pants = /obj/item/clothing/under/roguetown/trou
	backl = /obj/item/storage/backpack/rogue/satchel/short
	backpack_contents = list(
						/obj/item/flint = 1,
						/obj/item/rogueore/coal=1,
						/obj/item/rogueore/iron=1,
						/obj/item/flashlight/flare/torch = 1,
						/obj/item/recipe_book/blacksmithing = 1,
						/obj/item/recipe_book/survival = 1,
						/obj/item/rogueweapon/scabbard/sheath = 1
						)
	if(H.pronouns == HE_HIM)
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
