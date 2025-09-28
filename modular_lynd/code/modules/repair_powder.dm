/obj/item/mundane/repair_powder
	name = "bronze repair powder"
	desc = "Crushed hilo pillow't softly yonder buckram an frieze. The Golden Cockroach's gift to the downtrodden; the Third Transaction."
	icon = 'icons/roguetown/items/produce.dmi'
	icon_state = "salt"
	item_state = "salt"
	color = "#ffe100"
	sellprice = 10
	grid_width = 16
	grid_height = 16
	var/repair_percent = 0.25
	var/charges = 2

/obj/item/mundane/repair_powder/attack_obj(list/targets, mob/living/user)

	if(istype(targets[1], /obj/item))
		var/obj/item/I = targets[1]
		playsound(I, 'sound/foley/cloth_wipe (1).ogg', 50, TRUE, -2)
		if(do_after(user,70, target = src))
			if(istype(targets[1], /obj/item))
				if(!I.anvilrepair && !I.sewrepair)
					to_chat(user, span_warning("Not even the Golden Cockroach may repair this item."))
					return

		if(I.obj_integrity < I.max_integrity)
			repair_percent *= I.max_integrity
			I.obj_integrity = min(I.obj_integrity + repair_percent, I.max_integrity)
			user.visible_message(span_info("[I] glows in a faint mending light."))
			playsound(I, 'sound/foley/sewflesh.ogg', 50, TRUE, -2)
			if(I.obj_broken && I.obj_integrity >= I.max_integrity)
				I.obj_integrity = I.max_integrity
				I.obj_fix()
				charges--
				desc +=" It is half-used." //if it gets used twice it'll delete itself so it's fine (clueless)
				if(charges == 0)
					qdel(src)
		else
			to_chat(user, span_info("[I] appears to be in perfect condition."))
		return

/obj/item/mundane/repair_powder/silver
	repair_percent = 0.33

/obj/item/mundane/repair_powder/gold
	repair_percent = 0.50