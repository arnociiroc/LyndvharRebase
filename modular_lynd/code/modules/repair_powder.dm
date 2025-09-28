// recipes in here for modular purposes
/datum/crafting_recipe/roguetown/alchemy/roachdust_bronze
	name = "bronze repairhpowder (one loose zenny)"
	category = "Table"
	result = list(/obj/item/mundane/repair_powder)
	reqs = list(/obj/item/natural/stone = 1, /obj/item/natural/dirtclod = 1, /obj/item/roguecoin/copper = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/alchemy/roachdust_silver
	name = "silver repairpowder (one loose zilqua)"
	category = "Table"
	result = list(/obj/item/mundane/repair_powder)
	reqs = list(/obj/item/natural/stone = 1, /obj/item/natural/dirtclod = 1, /obj/item/roguecoin/silver = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/alchemy/roachdust_bronze
	name = "gold repairpowder (one loose zenar)"
	category = "Table"
	result = list(/obj/item/mundane/repair_powder)
	reqs = list(/obj/item/natural/stone = 1, /obj/item/natural/dirtclod = 1, /obj/item/roguecoin/gold = 1)
	craftdiff = 3

/obj/item/mundane/repair_powder
	name = "bronze roachpowder"
	desc = "Crushed hilo pillow't softly yonder buckram an frieze. Repairs equipment, but not the lout wearing it."
	icon = 'icons/roguetown/items/produce.dmi'
	icon_state = "salt"
	item_state = "salt"
	color = "#ffe100"
	sellprice = 1
	grid_width = 32
	grid_height = 32
	var/repair_percent = 0.25
	var/charges = 2

/obj/item/mundane/repair_powder/attack_obj(obj/O, mob/living/user, params)
	if(!istype(O, /obj/item))
		return

	var/obj/item/I = O
	if(!I.anvilrepair && !I.sewrepair)
		to_chat(user, span_warning("Not even the Golden Cockroach may repair this item."))
		return


	if(I.obj_integrity >= I.max_integrity)
		to_chat(user, span_info("[I] appears to be in perfect condition."))
		return
	playsound(I, 'sound/foley/cloth_wipe (1).ogg', 50, TRUE, -2)

	if(!do_after(user, 70, target = I)) //this kinda works better
		return

	var/repair_amount = I.max_integrity * src.repair_percent
	I.obj_integrity = min(I.obj_integrity + repair_amount, I.max_integrity)
	src.charges--
	user.visible_message(span_info("[I] glows in a faint mending light."))
	playsound(I, 'sound/foley/repairpowder.ogg', 50, TRUE, -2)

	if(I.obj_broken && I.obj_integrity >= I.max_integrity)
		I.obj_integrity = I.max_integrity
		I.obj_fix()

	if(src.charges <= 0)
		qdel(src)
	else
		src.desc = "[initial(src.desc)] It is half-used." //i remembered initial exists!


/obj/item/mundane/repair_powder/silver
	name = "silver roachpowder"
	repair_percent = 0.33

/obj/item/mundane/repair_powder/gold
	name = "golden roachpowder"
	desc = "Crushed hilo pillow't softly yonder buckram an frieze. Rumor speaks of the Golden Cockroach's gift to the downtrodden; the Third Transaction "
	repair_percent = 0.50

