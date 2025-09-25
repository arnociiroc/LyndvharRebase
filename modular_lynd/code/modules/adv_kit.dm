/obj/item/mundane/adventurer_kit
	name = "outlander's kit"
	desc = "Miscelanious kit supplies for traveling supplies. Tightly packed, but can't be re-packed when opened."
	icon = 'icons/roguetown/misc/gadgets.dmi'
	icon_state = "messkit" //im sorry. im sorry. im sorry. im sorry. im sorry. im s
	w_class = WEIGHT_CLASS_TINY
	slot_flags = ITEM_SLOT_HIP
	resistance_flags = FIRE_PROOF
	grid_height = 32
	grid_width = 64
	var/totalitemcount = 0

/obj/item/mundane/adventurer_kit/attack_self(mob/living/user)

	user.changeNext_move(CLICK_CD_MELEE)
	playsound(src.loc, 'sound/items/wood_sharpen.ogg', 75, TRUE)
	playsound(src.loc, 'sound/items/visor.ogg', 75, TRUE)
	visible_message(span_notice ("[user] begins unwrapping \the [src]."))
	if(prob(10))
		new /obj/item/needle/thorn(user)
		totalitemcount++
	if(prob(15))
		new /obj/item/needle(user)
		totalitemcount++