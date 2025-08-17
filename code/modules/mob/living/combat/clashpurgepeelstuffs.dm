/mob/living/carbon/human/proc/process_clash(mob/user, obj/item/IM, obj/item/IU)
	if(!ishuman(user))
		return
	if(user == src)
		bad_guard(span_warning("I hit myself."))
		return
	var/mob/living/carbon/human/H = user
	if(!IU)	//The opponent is trying to rawdog us with their bare hands while we have Guard up. We get a free attack on their active hand.
		var/obj/item/bodypart/affecting = H.get_bodypart("[(user.active_hand_index % 2 == 0) ? "r" : "l" ]_arm")
		var/force = get_complex_damage(IM, src)
		var/armor_block = H.run_armor_check(BODY_ZONE_PRECISE_L_HAND, used_intent.item_d_type, armor_penetration = used_intent.penfactor, damage = force)
		if(H.apply_damage(force, IM.damtype, affecting, armor_block))
			visible_message(span_suicide("[src] gores [user]'s hands with \the [IM]!"))
			affecting.bodypart_attacked_by(used_intent.blade_class, force, crit_message = TRUE)
		else
			visible_message(span_suicide("[src] clashes into [user]'s hands with \the [IM]!"))
		playsound(src, pick(used_intent.hitsound), 80)
		remove_status_effect(/datum/status_effect/buff/clash)
		return
	if(H.has_status_effect(/datum/status_effect/buff/clash))	//They also have Clash active. It'll trigger the special event.
		clash(user, IM, IU)
	else	//Otherwise, we just riposte them.
		var/damage = get_complex_damage(IM, src, IU.blade_dulling)
		if(IM.intdamage_factor != 1 || used_intent.intent_intdamage_factor != 1)
			var/higher_intfactor = max(IM.intdamage_factor, used_intent.intent_intdamage_factor)
			var/lowest_intfactor = min(IM.intdamage_factor, used_intent.intent_intdamage_factor)
			var/used_intfactor
			if(lowest_intfactor < 1)	//Our intfactor multiplier can be either 0 to 1, or 1 to whatever.
				used_intfactor = lowest_intfactor
			if(higher_intfactor > 1)	//Make sure to keep your weapon and intent intfactors consistent to avoid problems here!
				used_intfactor = higher_intfactor
			damage *= used_intfactor
		if(IM.wbalance == WBALANCE_HEAVY)
			damage *= 1.5
		IU.take_damage(max(damage,1), BRUTE, IM.d_type)
		visible_message(span_suicide("[src] ripostes [H] with \the [IM]!"))
		playsound(src, 'sound/combat/clash_struck.ogg', 100)
		var/staminadef = (stamina * 100) / max_stamina
		var/staminaatt = (H.stamina * 100) / H.max_stamina
		if(staminadef > staminaatt) 
			H.apply_status_effect(/datum/status_effect/debuff/exposed, 2 SECONDS)
			H.apply_status_effect(/datum/status_effect/debuff/clickcd, 3 SECONDS)
			H.Slowdown(3)
			to_chat(src, span_notice("[capitalize(H.p_theyre())] exposed!"))
		else
			H.changeNext_move(CLICK_CD_MELEE)
		remove_status_effect(/datum/status_effect/buff/clash)
		apply_status_effect(/datum/status_effect/buff/adrenaline_rush)
		purge_peel(GUARD_PEEL_REDUCTION)

//This is a gargantuan, clunky proc that is meant to tally stats and weapon properties for the potential disarm.
//For future coders: Feel free to change this, just make sure someone like Struggler statpack doesn't get 3-fold advantage.
/mob/living/carbon/human/proc/clash(mob/user, obj/item/IM, obj/item/IU)
	var/mob/living/carbon/human/HU = user
	var/instantloss = FALSE
	var/instantwin = FALSE

	//Stat checks. Basic comparison.
	var/strdiff = STASTR - HU.STASTR
	var/perdiff = STAPER - HU.STAPER
	var/spddiff = STASPD - HU.STASPD
	var/fordiff = STALUC - HU.STALUC
	var/intdiff = STAINT - HU.STAINT

	var/list/statdiffs = list(strdiff, perdiff, spddiff, fordiff, intdiff)

	//Skill check, very simple. If you're more skilled with your weapon than the opponent is with theirs -> +10% to disarm or vice-versa.
	var/skilldiff
	if(IM.associated_skill)
		skilldiff = get_skill_level(IM.associated_skill)
	else
		instantloss = TRUE	//We are Guarding with a book or something -- no chance for us.

	if(IU.associated_skill)
		skilldiff = skilldiff - HU.get_skill_level(IU.associated_skill)
	else
		instantwin = TRUE	//THEY are Guarding with a book or something -- no chance for them.
	
	//Weapon checks.
	var/lengthdiff = IM.wlength - IU.wlength //The longer the weapon the better.
	var/wieldeddiff = IM.wielded - IU.wielded //If ours is wielded but theirs is not.
	var/weightdiff = (IM.wbalance < IU.wbalance) //If our weapon is heavy-balanced and theirs is not.
	var/wildcard = pick(-1,0,1)

	var/list/wepdiffs = list(lengthdiff, wieldeddiff, weightdiff)

	var/prob_us = 0
	var/prob_opp = 0

	//Stat checks only matter if their difference is 2 or more.
	for(var/statdiff in statdiffs)
		if(statdiff >= 2)
			prob_us += 10
		else if(statdiff <= -2)
			prob_opp += 10
	
	for(var/wepdiff in wepdiffs)
		if(wepdiff > 0)
			prob_us += 10
		else if(wepdiff < 0)
			prob_opp += 10

	//Wildcard modifier that can go either way or to neither.
	if(wildcard > 0)
		prob_us += 10
	else if(wildcard < 0 )
		prob_opp += 10
	
	//Small bonus to the first one to strike in a Clash.
	var/initiator_bonus = rand(5, 10)
	prob_us += initiator_bonus

	if(has_duelist_ring() && HU.has_duelist_ring())
		prob_us = max(prob_us, prob_opp)
		prob_opp = max(prob_us, prob_opp)

	if((!instantloss && !instantwin) || (instantloss && instantwin))	//We are both using normal weapons OR we're both using memes. Either way, proceed as normal.
		visible_message(span_boldwarning("[src] and [HU] clash!"))
		flash_fullscreen("whiteflash")
		HU.flash_fullscreen("whiteflash")
		var/datum/effect_system/spark_spread/S = new()
		var/turf/front = get_step(src,src.dir)
		S.set_up(1, 1, front)
		S.start()
		var/success
		if(prob(prob_us))
			HU.remove_status_effect(/datum/status_effect/buff/clash)
			HU.play_overhead_indicator('icons/mob/overhead_effects.dmi', "clashtwo", 1 SECONDS, OBJ_LAYER, soundin = 'sound/combat/clash_disarm_us.ogg', y_offset = 24)
			disarmed(IM)
			Slowdown(5)
			success = TRUE
		if(prob(prob_opp))
			HU.disarmed(IU)
			HU.Slowdown(5)
			remove_status_effect(/datum/status_effect/buff/clash)
			play_overhead_indicator('icons/mob/overhead_effects.dmi', "clashtwo", 1 SECONDS, OBJ_LAYER, soundin = 'sound/combat/clash_disarm_opp.ogg', y_offset = 24)
			success = TRUE
		if(!success)
			to_chat(src, span_warningbig("Draw! Opponent's chances were... [prob_opp]%"))
			to_chat(HU, span_warningbig("Draw! Opponent's chances were... [prob_us]%"))
			playsound(src, 'sound/combat/clash_draw.ogg', 100, TRUE)
	else
		if(instantloss)
			disarmed(IM)
		if(instantwin)
			HU.disarmed(IU)
	
	remove_status_effect(/datum/status_effect/buff/clash)
	HU.remove_status_effect(/datum/status_effect/buff/clash)


/mob/living/carbon/human/proc/disarmed(obj/item/I)
	visible_message(span_suicide("[src] is disarmed!"), 
					span_boldwarning("I'm disarmed!"))
	var/turnangle = (prob(50) ? 270 : 90)
	var/turndir = turn(dir, turnangle)
	var/dist = rand(1, 5)
	var/current_turf = get_turf(src)
	var/target_turf = get_ranged_target_turf(current_turf, turndir, dist)
	throw_item(target_turf, FALSE)
	apply_status_effect(/datum/status_effect/debuff/clickcd, 3 SECONDS)

/mob/living/carbon/human/proc/bad_guard(msg, cheesy = FALSE)
	stamina_add(((max_stamina * BAD_GUARD_FATIGUE_DRAIN) / 100))
	if(cheesy)	//We tried to hit someone with Guard up. Unfortunately this must be super punishing to prevent cheese.
		energy_add(-((max_energy * BAD_GUARD_FATIGUE_DRAIN) / 100))
		Immobilize(2 SECONDS)
	if(msg)
		to_chat(src, msg)
		emote("strain", forced = TRUE)
	remove_status_effect(/datum/status_effect/buff/clash)

/mob/living/carbon/human/proc/purge_peel(amt)
	//Equipment slots manually picked out cus we don't have a proc for this apparently
	var/list/slots = list(wear_armor, wear_pants, wear_wrists, wear_shirt, gloves, head, shoes, wear_neck, wear_mask, wear_ring)
	for(var/slot in slots)
		if(isnull(slot) || !istype(slot, /obj/item/clothing))
			slots.Remove(slot)

	for(var/obj/item/clothing/C in slots)
		if(C.peel_count > 0)
			C.reduce_peel(amt)

/mob/living/carbon/human/proc/purge_bait()
	if(!cmode)
		if(bait_stacks > 0)
			bait_stacks = 0
			to_chat(src, span_info("My focus and balance returns. I won't lose my footing if I am baited again."))

/mob/living/carbon/human/proc/measured_statcheck(mob/living/carbon/human/HT)
	var/finalprob = 40

	//We take the highest and the lowest stats, clamped to 14.
	var/max_target = min(max(HT.STASTR, HT.STACON, HT.STAEND, HT.STAINT, HT.STAPER, HT.STASPD), 14)
	var/min_target = min(HT.STASTR, HT.STACON, HT.STAEND, HT.STAINT, HT.STAPER, HT.STASPD)
	var/max_user = min(max(STASTR, STACON, STAEND, STAINT, STAPER, STASPD), 14)
	var/min_user = min(STASTR, STACON, STAEND, STAINT, STAPER, STASPD)
	
	if(max_target > max_user)
		finalprob -= max_target
	if(min_target > min_user)
		finalprob -= 3 * min_target
	
	if(max_target < max_user)
		finalprob += max_user
	if(min_target < min_user)
		finalprob += 3 * min_user

	finalprob = clamp(finalprob, 5, 75)

	if(STALUC > HT.STALUC)
		finalprob += rand(1, rand(1,25))	//good luck mathing this out, code divers
	if(STALUC < HT.STALUC)
		finalprob -= rand(1, rand(1,25))

	return prob(finalprob)

/mob/living/carbon/human/proc/has_duelist_ring()
	if(wear_ring)
		if(istype(wear_ring, /obj/item/clothing/ring/duelist))
			return TRUE
	return FALSE

/mob/living/carbon/human/proc/highest_ac_worn()
	var/list/slots = list(wear_armor, wear_pants, wear_wrists, wear_shirt, gloves, head, shoes, wear_neck, wear_mask, wear_ring)
	for(var/slot in slots)
		if(isnull(slot) || !istype(slot, /obj/item/clothing))
			slots.Remove(slot)
	
	var/highest_ac = ARMOR_CLASS_NONE

	for(var/obj/item/clothing/C in slots)
		if(C.armor_class)
			if(C.armor_class > highest_ac)
				highest_ac = C.armor_class
	
	return highest_ac

