/obj/structure/telescope
	name = "telescope"
	desc = "A mysterious telescope pointing towards the stars."
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "telescope"
	density = TRUE
	anchored = FALSE

/obj/structure/telescope/attack_hand(mob/user)
	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user
	var/random_message = pick("You can see noc rotating.", "Looking at Astrata blinds you!", "The stars smile at you.", "Nepolx is red today.", "Blessed yellow strife.", "You see a star!")
	to_chat(H, span_notice("[random_message]"))

	if(random_message == "Looking at Astrata blinds you!")
		if(do_after(H, 25, target = src))
			var/obj/item/bodypart/affecting = H.get_bodypart("head")
			to_chat(H, span_warning("The blinding light causes you intense pain!"))
			if(affecting && affecting.receive_damage(0, 5))
				H.update_damage_overlays()
	if(random_message == "You can see Noc rotating!")
		if(do_after(H, 2.5 SECONDS, target = src))
			to_chat(H, span_warning("Noc's glow seems to help clear your thoughts."))
			H.apply_status_effect(/datum/status_effect/buff/nocblessing)

/obj/structure/globe
	name = "globe"
	desc = "A mysterious globe representing the world."
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "globe"
	density = TRUE
	anchored = FALSE

/obj/structure/globe/attack_hand(mob/user)
	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user
	var/random_message = pick("You spin the globe!", "You land on Lyndvhar!", "You land on Zybantu!", "You land on Rhaenal!.", "You land on Aevislan!", "You land on Grenzelhoft!", "You land on Greencrest!", "You land on Valoria!", "You land on Khazumia!")
	to_chat(H, span_notice("[random_message]"))
