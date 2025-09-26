// Meant for cave-races, less boons than other mercs but unique weapon + mining skill and helmet-torch combo. ALSO gets alchemy now for bomb-making.
/datum/advclass/mercenary/underdweller
	name = "Underdweller Contractor"
	tutorial = "A member of the Underdwellers, you've taken many of the deadliest contracts known to man in literal underground circles. No matter the race, you've put your differences aside for coin and adventure."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
	outfit = /datum/outfit/job/roguetown/mercenary/underdweller
	class_select_category = CLASS_CAT_RACIAL
	category_tags = list(CTAG_MERCENARY)
	traits_applied = list(TRAIT_MEDIUMARMOR, TRAIT_WEBWALK)
	subclass_stats = list(
		STATKEY_CON = 2,
		STATKEY_WIL = 2,
		STATKEY_SPD = 1,
		STATKEY_STR = 1,
		STATKEY_LCK = 2
	)
	subclass_skills = list(
		/datum/skill/combat/axes = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/labor/mining = SKILL_LEVEL_MASTER,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/alchemy = SKILL_LEVEL_APPRENTICE,	//Gets this for bomb making.
		/datum/skill/craft/engineering = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/smelting = SKILL_LEVEL_APPRENTICE,	//Accompanies mining; they know how to smelt, not make armor though.
	)

/datum/outfit/job/roguetown/mercenary/underdweller/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/kettle/minershelm
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	gloves = /obj/item/clothing/gloves/roguetown/leather
	mask = /obj/item/clothing/mask/rogue/shepherd
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	belt = /obj/item/storage/belt/rogue/leather/steel	//Should give these guys a unique miners belt at some point..
	neck = /obj/item/clothing/neck/roguetown/gorget/steel
	beltl = /obj/item/rogueweapon/stoneaxe/woodcut/pick
	beltr = /obj/item/rogueweapon/huntingknife
	backl = /obj/item/storage/backpack/rogue/backpack
	backr = /obj/item/rogueweapon/shield/wood
	backpack_contents = list(
		/obj/item/roguekey/mercenary,
		/obj/item/storage/belt/rogue/pouch/coins/poor,
		/obj/item/bomb = 2,
		/obj/item/rogueweapon/scabbard/sheath = 1
		)
	H.merctype = 12


//Clothing here to avoid overcrowding the hats.dm with snowflake gear. It's just a kettle with a light.
/obj/item/clothing/head/roguetown/helmet/kettle/minershelm
	name = "reinforced miners helmet"
	desc = "A rimmed miners helmet reinforced with leather atop its flimsy thin inner steel, its glowing lamp fueled by magiks from the depths."
	icon_state = "minerslamp"
	var/on = FALSE
	light_outer_range = 5 	//Same as a lamptern; can't be extinguished either.
	light_power = 1
	max_integrity = 250		//Slightly better integrity. Just because unique kettle. Plus class doesn't have much going for it traits-wise.
	light_color = LIGHT_COLOR_ORANGE
	light_system = MOVABLE_LIGHT

/obj/item/clothing/head/roguetown/helmet/kettle/minershelm/MiddleClick(mob/user)
	if(.)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	playsound(loc, 'sound/misc/toggle_lamp.ogg', 100)
	toggle_helmet_light(user)
	to_chat(user, span_info("I toggle [src] [on ? "on" : "off"]."))

/obj/item/clothing/head/roguetown/helmet/kettle/minershelm/proc/toggle_helmet_light(mob/living/user)
	on = !on
	set_light_on(on)
	update_icon()

/obj/item/clothing/head/roguetown/helmet/kettle/minershelm/update_icon()
	icon_state = "minerslamp[on]"
	item_state = "minerslamp[on]"
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		H.update_inv_head()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon(force = TRUE)
	..()
