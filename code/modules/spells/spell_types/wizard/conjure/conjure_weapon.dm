/obj/effect/proc_holder/spell/invoked/conjure_weapon
	name = "Conjure Weapon"
	desc = "Conjure a weapon of your choice in your hand. The weapon will be unsummoned should you conjure a new one or unbind the spell.\n\
	At 12 int or above, conjure steel-tier weapons, otherwise conjure iron-tier weapons. Melee weapons only."
	overlay_state = "conjure_weapon"
	sound = list('sound/magic/whiteflame.ogg')

	releasedrain = 60
	chargedrain = 1
	chargetime = 2 SECONDS
	no_early_release = TRUE
	recharge_time = 5 MINUTES // Not meant to be spammed or used as a mega support spell to outfit an entire party

	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	antimagic_allowed = FALSE
	charging_slowdown = 3
	cost = 2
	spell_tier = 2 // Spellblade tier.

	invocation = "Conjura Telum!" // I was offered Me Armare (Arm Myself) but Conjura Telum (Conjure Weapon) is more suitable.
	invocation_type = "shout"
	glow_color = GLOW_COLOR_METAL
	glow_intensity = GLOW_INTENSITY_LOW

	var/obj/item/rogueweapon/conjured_weapon = null

	var/list/iron_weapons = list(
		"Iron Short Sword" = /obj/item/rogueweapon/sword/short/iron,
		"Iron Messer" = /obj/item/rogueweapon/sword/short/messer/iron,
		"Zweihander" = /obj/item/rogueweapon/greatsword/zwei,
		"Cudgel" = /obj/item/rogueweapon/mace/cudgel,
		"Iron Warhammer" = /obj/item/rogueweapon/mace/warhammer,
		"Iron Dagger" = /obj/item/rogueweapon/huntingknife/idagger,
		"Iron Axe" = /obj/item/rogueweapon/stoneaxe/woodcut,
		"Iron Greataxe" = /obj/item/rogueweapon/greataxe,
		"Iron Flail" = /obj/item/rogueweapon/flail,
		"Iron Spear" = /obj/item/rogueweapon/spear,
		"Whip" = /obj/item/rogueweapon/whip,
	)
	// There's no way I am putting Lucerne in iron tier I am gonna misclassify it as steel on purpose

	// Trying to keep the list manageable so 1 / 2 iconic thing from each family is fine
	var/list/steel_weapons = list(
		"Steel Sabre" = /obj/item/rogueweapon/sword/sabre,
		"Steel Rapier" = /obj/item/rogueweapon/sword/rapier,
		"Longsword" = /obj/item/rogueweapon/sword/long,
		"Zweihander" = /obj/item/rogueweapon/greatsword/grenz,
		"Battle Axe" = /obj/item/rogueweapon/stoneaxe/battle,
		"Steel Dagger" = /obj/item/rogueweapon/huntingknife/idagger/steel,
		"Halberd" = /obj/item/rogueweapon/halberd,
		"Steel Warhammer" = /obj/item/rogueweapon/mace/warhammer/steel,
		"Steel Flail" = /obj/item/rogueweapon/flail/sflail,
		"Whip" = /obj/item/rogueweapon/whip,
	)

/obj/effect/proc_holder/spell/invoked/conjure_weapon/cast(list/targets, mob/living/user = usr)
	var/list/weapons = iron_weapons
	if(user.STAINT >= 12)
		weapons = steel_weapons
	var/weapon_choice = input(user, "Choose a weapon", "Conjure Weapon") as anything in weapons
	if(!weapon_choice)
		return
	if(src.conjured_weapon)
		qdel(src.conjured_weapon)
	weapon_choice = weapons[weapon_choice]

	var/obj/item/rogueweapon/R = new weapon_choice(user.drop_location())
	R.blade_dulling = DULLING_SHAFT_CONJURED
	if(!QDELETED(R))
		R.AddComponent(/datum/component/conjured_item, GLOW_COLOR_ARCANE)
	user.put_in_hands(R)
	src.conjured_weapon = R
	return TRUE

/obj/effect/proc_holder/spell/invoked/conjure_weapon/miracle
	associated_skill = /datum/skill/magic/holy

/obj/effect/proc_holder/spell/invoked/conjure_weapon/Destroy()
	if(src.conjured_weapon)
		conjured_weapon.visible_message(span_warning("The [conjured_weapon]'s borders begin to shimmer and fade, before it vanishes entirely!"))
		qdel(src.conjured_weapon)
	return ..()
