/mob/living/proc/Life(seconds, times_fired)
	set waitfor = FALSE
	set invisibility = 0

	SEND_SIGNAL(src, COMSIG_LIVING_LIFE, seconds, times_fired)

	if((movement_type & FLYING) && !(movement_type & FLOATING))	//TODO: Better floating
		float(on = TRUE)

	if (client)
		var/turf/T = get_turf(src)
		if(!T)
			var/msg = "[ADMIN_LOOKUPFLW(src)] was found to have no .loc with an attached client, if the cause is unknown it would be wise to ask how this was accomplished."
			message_admins(msg)
			send2irc_adminless_only("Mob", msg, R_ADMIN)
			log_game("[key_name(src)] was found to have no .loc with an attached client.")

		// This is a temporary error tracker to make sure we've caught everything
		else if (registered_z != T.z)
#ifdef TESTING
			message_admins("[ADMIN_LOOKUPFLW(src)] has somehow ended up in Z-level [T.z] despite being registered in Z-level [registered_z]. If you could ask them how that happened and notify coderbus, it would be appreciated.")
#endif
			log_game("Z-TRACKING: [src] has somehow ended up in Z-level [T.z] despite being registered in Z-level [registered_z].")
			update_z(T.z)
	else if (registered_z)
		log_game("Z-TRACKING: [src] of type [src.type] has a Z-registration despite not having a client.")
		update_z(null)

	if (notransform)
		return
	if(!loc)
		return

	//Breathing, if applicable
	handle_breathing(times_fired)
	if(HAS_TRAIT(src, TRAIT_SIMPLE_WOUNDS))
		handle_wounds()
		handle_embedded_objects()
		handle_blood()
		//passively heal even wounds with no passive healing
		for(var/datum/wound/wound as anything in get_wounds())
			wound.heal_wound(1)

	/// ENDVRE AS HE DOES.
	if(!stat && HAS_TRAIT(src, TRAIT_NOFAITHHEAL) && !HAS_TRAIT(src, TRAIT_PARALYSIS))
		handle_wounds()
		//passively heal wounds, but not if you're skullcracked OR DEAD.
		if(blood_volume > BLOOD_VOLUME_SURVIVE)
			for(var/datum/wound/wound as anything in get_wounds())
				wound.heal_wound(0.6)		

	if (QDELETED(src)) // diseases can qdel the mob via transformations
		return

	handle_environment()
	
	//Random events (vomiting etc)
	handle_random_events()

	handle_gravity()

	handle_traits() // eye, ear, brain damages
	handle_status_effects() //all special effects, stun, knockdown, jitteryness, hallucination, sleeping, etc

	update_sneak_invis()

	if(machine)
		machine.check_eye(src)

	if(istype(loc, /turf/open/water))
		handle_inwater(loc)

	if(stat != DEAD)
		return 1

/mob/living/proc/DeadLife()
	set invisibility = 0
	if (notransform)
		return
	if(!loc)
		return
	if(HAS_TRAIT(src, TRAIT_SIMPLE_WOUNDS))
		handle_wounds()
		handle_embedded_objects()
		handle_blood()
	update_sneak_invis()
	if(istype(loc, /turf/open/water))
		handle_inwater(loc)

/mob/living/proc/handle_breathing(times_fired)
	return

/mob/living/proc/handle_random_events()
	//random painstun
	if(!stat && !HAS_TRAIT(src, TRAIT_NOPAINSTUN))
		if(world.time > mob_timers["painstun"] + 600)
			if(getBruteLoss() + getFireLoss() >= (STAWIL * 10))
				var/probby = 53 - (STAWIL * 2)
				if(!(mobility_flags & MOBILITY_STAND))
					probby = probby - 20
				if(prob(probby))
					mob_timers["painstun"] = world.time
					Immobilize(10)
					emote("painscream")
					visible_message(span_warning("[src] freezes in pain!"),
								span_warning("I'm frozen in pain!"))
					sleep(10)
					Stun(110)
					Knockdown(110)

/mob/living/proc/handle_environment()
	return

/mob/living/proc/handle_wounds()
	if(stat >= DEAD)
		for(var/datum/wound/wound as anything in get_wounds())
			if(istype(wound, /datum/wound))
				wound.on_death()
		return
	for(var/datum/wound/wound as anything in get_wounds())
		if(istype(wound, /datum/wound))
			wound.on_life()

/obj/item/proc/on_embed_life(mob/living/user, obj/item/bodypart/bodypart)
	return

/mob/living/proc/handle_embedded_objects()
	for(var/obj/item/embedded in simple_embedded_objects)
		if(embedded.on_embed_life(src))
			continue

		if(prob(embedded.embedding.embedded_pain_chance))
			if(embedded.is_silver && HAS_TRAIT(src, TRAIT_SILVER_WEAK) && !has_status_effect(STATUS_EFFECT_ANTIMAGIC))
				var/datum/component/silverbless/psyblessed = embedded.GetComponent(/datum/component/silverbless)
				adjust_fire_stacks(1, psyblessed?.is_blessed ? /datum/status_effect/fire_handler/fire_stacks/sunder/blessed : /datum/status_effect/fire_handler/fire_stacks/sunder)
			to_chat(src, span_danger("[embedded] in me hurts!"))

		if(prob(embedded.embedding.embedded_fall_chance))
			simple_remove_embedded_object(embedded)
			to_chat(src,span_danger("[embedded] falls out of me!"))

//this updates all special effects: knockdown, druggy, stuttering, etc..
/mob/living/proc/handle_status_effects()
	if(confused)
		confused = max(confused - 1, 0)
	if(slowdown)
		slowdown = max(slowdown - 1, 0)
	if(slowdown <= 0)
		remove_movespeed_modifier(MOVESPEED_ID_LIVING_SLOWDOWN_STATUS)

/mob/living/proc/handle_traits()
	//Eyes
	if(eye_blind)	//blindness, heals slowly over time
		if(HAS_TRAIT_FROM(src, TRAIT_BLIND, EYES_COVERED)) //covering your eyes heals blurry eyes faster
			adjust_blindness(-3)
		else if(!stat && !(HAS_TRAIT(src, TRAIT_BLIND)))
			adjust_blindness(-1)
	else if(eye_blurry)			//blurry eyes heal slowly
		adjust_blurriness(-1)

/mob/living/proc/update_damage_hud()
	return

/mob/living/proc/handle_gravity()
	var/gravity = mob_has_gravity()
	update_gravity(gravity)

	if(gravity > STANDARD_GRAVITY)
		gravity_animate()
		handle_high_gravity(gravity)

/mob/living/proc/gravity_animate()
	if(!get_filter("gravity"))
		add_filter("gravity",1,list("type"="motion_blur", "x"=0, "y"=0))
	INVOKE_ASYNC(src, PROC_REF(gravity_pulse_animation))

/mob/living/proc/gravity_pulse_animation()
	animate(get_filter("gravity"), y = 1, time = 10)
	sleep(10)
	animate(get_filter("gravity"), y = 0, time = 10)

/mob/living/proc/handle_high_gravity(gravity)
	if(gravity >= GRAVITY_DAMAGE_TRESHOLD) //Aka gravity values of 3 or more
		var/grav_stregth = gravity - GRAVITY_DAMAGE_TRESHOLD
		adjustBruteLoss(min(grav_stregth,3))
