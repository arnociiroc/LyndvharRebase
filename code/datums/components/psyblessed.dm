#define BLESSING_NONE 0
#define BLESSING_PSYDONIAN 1
#define BLESSING_TENNITE 2
/// Tennite blessings are 30% worse. Cope.
#define TENNITE_BLESSING_DIVISOR 0.7

#define SILVER_PSYDONIAN (1<<0)
#define SILVER_TENNITE (1<<1)

#define CURSEITEM_INT_DAMAGE_PSY_MULTIPLIER 1.3
#define CURSEITEM_INT_DAMAGE_TEN_MULTIPLIER 1.1

/datum/component/silverbless
	var/is_blessed
	var/pre_blessed
	var/silver_type
	var/added_force
	var/added_blade_int
	var/added_int
	var/added_def
	var/cursed_item_intdamage

/datum/component/silverbless/Initialize(pre_blessed = BLESSING_NONE, silver_type, added_force, added_blade_int, added_int, added_def)
	if(!istype(parent, /obj/item/rogueweapon))
		return COMPONENT_INCOMPATIBLE
	src.pre_blessed = pre_blessed
	src.silver_type = silver_type
	src.added_force = added_force
	src.added_blade_int = added_blade_int
	src.added_int = added_int
	src.added_def = added_def
	if(pre_blessed)
		apply_bless(pre_blessed)

/datum/component/silverbless/RegisterWithParent()
	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, PROC_REF(on_examine))
	RegisterSignal(parent, COMSIG_ITEM_OBJFIX, PROC_REF(on_fix))
	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(on_equipped))
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, PROC_REF(on_dropped))

/datum/component/silverbless/UnregisterFromParent()
	UnregisterSignal(parent, list(COMSIG_PARENT_EXAMINE, COMSIG_ITEM_OBJFIX, COMSIG_ITEM_EQUIPPED, COMSIG_ITEM_DROPPED))

/datum/component/silverbless/proc/on_equipped(obj/item/equipped, mob/user, slot)
	if(is_blessed && slot & ITEM_SLOT_HANDS)
		user.add_stress(/datum/stressevent/blessed_weapon)

/datum/component/silverbless/proc/on_dropped(obj/item/dropped, mob/user, slot)
	if(is_blessed)
		user.remove_stress(/datum/stressevent/blessed_weapon)

/datum/component/silverbless/proc/on_examine(datum/source, mob/user, list/examine_list)
	if(!is_blessed)
		if(silver_type & SILVER_PSYDONIAN)
			examine_list += span_info("<font color = '#cfa446'>This object may be blessed by the lingering dust of the Golgotha.</font>")
		else if(silver_type & SILVER_TENNITE)
			examine_list += span_info("<font color = '#cfa446'>This object may be blessed by a priest.</font>")
	if(is_blessed == BLESSING_PSYDONIAN)
		examine_list += span_info("<font color = '#46bacf'>This object has been blessed by powerful arcyne dust.</font>")
	else if(is_blessed == BLESSING_TENNITE)
		examine_list += span_info("<font color = '#46bacf'>This object has been blessed by THE TEN.</font>")

/datum/component/silverbless/proc/try_bless(blessing_type)
	if(!is_blessed)
		apply_bless(blessing_type)
		play_effects()
		return TRUE
	else
		return FALSE

/datum/component/silverbless/proc/play_effects()
	if(isitem(parent))
		var/obj/item/I = parent
		playsound(I, 'sound/magic/holyshield.ogg', 100)
		I.visible_message(span_notice("[I] glistens with power as dust of powerful arcyne substance lands upon it!"))

/datum/component/silverbless/proc/apply_bless(blessing_type)
	var/blessing_divisor = 1
	if(blessing_type == BLESSING_TENNITE)
		blessing_divisor = TENNITE_BLESSING_DIVISOR
		cursed_item_intdamage = CURSEITEM_INT_DAMAGE_TEN_MULTIPLIER
	else
		cursed_item_intdamage = CURSEITEM_INT_DAMAGE_PSY_MULTIPLIER
	if(isitem(parent))
		var/obj/item/I = parent
		is_blessed = blessing_type
		I.force += added_force
		if(I.force_wielded)
			I.force_wielded += added_force
		if(I.max_blade_int)
			I.max_blade_int += round(added_blade_int * blessing_divisor)
			I.blade_int = round(I.max_blade_int * blessing_divisor)
		I.max_integrity += round(added_int * blessing_divisor)
		I.obj_integrity = I.max_integrity
		I.wdefense += round(added_def * blessing_divisor)
		I.name = "blessed [I.name]"
		I.AddComponent(/datum/component/metal_glint)

// This is called right after the object is fixed and all of its force / wdefense values are reset to initial. We re-apply the relevant bonuses.
/datum/component/silverbless/proc/on_fix()
	if(!is_blessed)
		return
	var/obj/item/rogueweapon/I = parent
	I.force += added_force
	if(I.force_wielded)
		I.force_wielded += added_force
	I.wdefense += round(added_def * (is_blessed == BLESSING_TENNITE ? TENNITE_BLESSING_DIVISOR : 1))

#undef CURSEITEM_INT_DAMAGE_PSY_MULTIPLIER
#undef CURSEITEM_INT_DAMAGE_TEN_MULTIPLIER
