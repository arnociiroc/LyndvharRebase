/datum/status_effect/debuff
	status_type = STATUS_EFFECT_REFRESH

///////////////////////////

/datum/status_effect/debuff/hungryt1
	id = "hungryt1"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt1
	effectedstats = list(STATKEY_CON = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/hungryt1
	name = "Hungry"
	desc = "Hunger weakens my living body."
	icon_state = "hunger1"

/datum/status_effect/debuff/hungryt2
	id = "hungryt2"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt2
	effectedstats = list(STATKEY_STR = -2, STATKEY_CON = -2, STATKEY_WIL = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/hungryt2
	name = "Hungry"
	desc = "My poor body suffers heavily from hunger."
	icon_state = "hunger2"

/datum/status_effect/debuff/hungryt3
	id = "hungryt3"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt3
	effectedstats = list(STATKEY_STR = -5, STATKEY_CON = -3, STATKEY_WIL = -2)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/hungryt3
	name = "Hungry"
	desc = "My body can barely hold it!"
	icon_state = "hunger3"

/datum/status_effect/debuff/thirstyt1
	id = "thirsty1"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/thirstyt1
	effectedstats = list(STATKEY_WIL = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/thirstyt1
	name = "Thirsty"
	desc = "I need water."
	icon_state = "thirst1"

/datum/status_effect/debuff/thirstyt2
	id = "thirsty2"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/thirstyt2
	effectedstats = list(STATKEY_SPD = -1, STATKEY_WIL = -2)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/thirstyt2
	name = "Thirsty"
	desc = "My mouth feels much drier."
	icon_state = "thirst2"

/datum/status_effect/debuff/thirstyt3
	id = "thirsty3"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/thirstyt3
	effectedstats = list(STATKEY_STR = -1, STATKEY_SPD = -2, STATKEY_WIL = -3)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/thirstyt3
	name = "Thirsty"
	desc = "I urgently need water!"
	icon_state = "thirst3"

/////////

/datum/status_effect/debuff/uncookedfood
	id = "uncookedfood"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/uncookedfood/on_apply()
	if(HAS_TRAIT(owner, TRAIT_NASTY_EATER) || HAS_TRAIT(owner, TRAIT_ORGAN_EATER) || HAS_TRAIT(owner, TRAIT_WILD_EATER))
		return ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_nausea(100)
	return ..()

/datum/status_effect/debuff/badmeal
	id = "badmeal"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/badmeal/on_apply()
	owner.add_stress(/datum/stressevent/badmeal)
	return ..()

/datum/status_effect/debuff/burnedfood
	id = "burnedfood"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/burnedfood/on_apply()
	if(HAS_TRAIT(owner, TRAIT_NASTY_EATER))
		return ..()
	owner.add_stress(/datum/stressevent/burntmeal)
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_nausea(100)
	return ..()

/datum/status_effect/debuff/rotfood
	id = "rotfood"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/rotfood/on_apply()
	if(HAS_TRAIT(owner, TRAIT_NASTY_EATER) || HAS_TRAIT(owner, TRAIT_ROT_EATER))
		return ..()
	owner.add_stress(/datum/stressevent/rotfood)
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_nausea(200)
	return ..()

/datum/status_effect/debuff/bleeding
	id = "bleedingt1"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bleedingt1
	effectedstats = list(STATKEY_SPD = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/bleedingt1
	name = "Dizzy"
	desc = "I have lost some blood."
	icon_state = "bleed1"

/datum/status_effect/debuff/bleedingworse
	id = "bleedingt2"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bleedingt2
	effectedstats = list(STATKEY_STR = -1, STATKEY_SPD = -2)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/bleedingt2
	name = "Faint"
	desc = "I have lost a lot of blood.."
	icon_state = "bleed2"

/datum/status_effect/debuff/bleedingworst
	id = "bleedingt3"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bleedingt3
	effectedstats = list(STATKEY_STR = -3, STATKEY_SPD = -4)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/bleedingt3
	name = "Drained"
	desc = "My vision fails me, and reality begins to blur. I have lost too much blood.."
	icon_state = "bleed3"

/datum/status_effect/debuff/sleepytime
	id = "sleepytime"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/sleepytime

/atom/movable/screen/alert/status_effect/debuff/netted
	name = "Net"
	desc = "A net was thrown on me.. how can I move?"
	icon_state = "muscles"

/datum/status_effect/debuff/netted
	id = "net"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/netted
	effectedstats = list(STATKEY_SPD = -5, STATKEY_WIL = -2)
	duration = 3 MINUTES

/datum/status_effect/debuff/netted/on_apply()
		. = ..()
		var/mob/living/carbon/C = owner
		C.add_movespeed_modifier(MOVESPEED_ID_NET_SLOWDOWN, multiplicative_slowdown = 3)

/datum/status_effect/debuff/netted/on_remove()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.legcuffed = null
		C.update_inv_legcuffed()
		C.remove_movespeed_modifier(MOVESPEED_ID_NET_SLOWDOWN)

/atom/movable/screen/alert/status_effect/debuff/sleepytime
	name = "Tired"
	desc = "I should get some rest."
	icon_state = "sleepy"

/datum/status_effect/debuff/muscle_sore
	id = "muscle_sore"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/muscle_sore
	effectedstats = list(STATKEY_STR = -1, STATKEY_WIL = -1)

/atom/movable/screen/alert/status_effect/debuff/muscle_sore
	name = "Muscle Soreness"
	desc = "My muscles need some sleep to recover."
	icon_state = "muscles"

/datum/status_effect/debuff/devitalised
	id = "devitalised"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/devitalised
	effectedstats = list(STATKEY_STR = -1, STATKEY_WIL = -1, STATKEY_CON = -1, STATKEY_SPD = -1, STATKEY_LCK = -1)	//Slightly punishing.
	duration = 15 MINUTES	//Punishing, same time as revival, but mildly less punishing than revival itself.

/atom/movable/screen/alert/status_effect/debuff/devitalised
	name = "Devitalised"
	desc = "I feel like something extremely important has been taken from me.. my body is horribly weak."

/datum/status_effect/debuff/vamp_dreams
	id = "sleepytime"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/vamp_dreams

/atom/movable/screen/alert/status_effect/debuff/vamp_dreams
	name = "Insight"
	desc = "With some sleep in a coffin I feel like I could become better."
	icon_state = "sleepy"

/datum/status_effect/debuff/ritualdefiled
	id = "ritualdefiled"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/ritualdefiled
	effectedstats = list(STATKEY_STR = -1, STATKEY_WIL = -1, STATKEY_CON = -1, STATKEY_SPD = -1, STATKEY_LCK = -1)
	duration = 1 HOURS // Punishing AS FUCK, but not as punishing as being dead.


/atom/movable/screen/alert/status_effect/debuff/ritualdefiled
	name = "Tainted Lux"
	desc = "My Lux has been tainted in a vile heretic ritual."

/// SURRENDERING DEBUFFS

/datum/status_effect/debuff/breedable
	id = "breedable"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/breedable
	duration = 30 SECONDS

/datum/status_effect/debuff/breedable/on_apply()
	. = ..()
	ADD_TRAIT(owner, TRAIT_CRITICAL_RESISTANCE, id)

/datum/status_effect/debuff/breedable/on_remove()
	. = ..()
	REMOVE_TRAIT(owner, TRAIT_CRITICAL_RESISTANCE, id)

/atom/movable/screen/alert/status_effect/debuff/breedable
	name = "Obedient"
	desc = "They won't hurt me too much..."

/datum/status_effect/debuff/submissive
	id = "submissive"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/submissive
	duration = 60 SECONDS

/datum/status_effect/debuff/submissive/on_apply()
	. = ..()
	owner.add_movespeed_modifier("SUBMISSIVE", multiplicative_slowdown = 4)

/datum/status_effect/debuff/submissive/on_remove()
	. = ..()
	owner.remove_movespeed_modifier("SUBMISSIVE")

/atom/movable/screen/alert/status_effect/debuff/submissive
	name = "Conformable"
	desc = "Falling in line is my only choice."

/datum/status_effect/debuff/chilled
	id = "chilled"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/chilled
	effectedstats = list(STATKEY_SPD = -5, STATKEY_STR = -2, STATKEY_WIL = -2)
	duration = 15 SECONDS

/atom/movable/screen/alert/status_effect/debuff/chilled
	name = "Chilled"
	desc = "I can barely feel my limbs!"
	icon_state = "chilled"


/datum/status_effect/debuff/ritesexpended
	id = "ritesexpended"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/ritesexpended
	duration = 30 MINUTES

/atom/movable/screen/alert/status_effect/debuff/ritesexpended
	name = "Rites Complete"
	desc = "It will take time before I can next perform a rite."
	icon_state = "ritesexpended"

/datum/status_effect/debuff/ritesexpended_heavy
	id = "ritesexpended_heavy"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/ritesexpended_heavy
	duration = 1 HOURS

/atom/movable/screen/alert/status_effect/debuff/ritesexpended_heavy
	name = "Rites Complete"
	desc = "It will take a lot of time before I can perform a next rite. I am drained."
	icon_state = "ritesexpended"

/datum/status_effect/debuff/call_to_arms
	id = "call_to_arms"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/call_to_arms
	effectedstats = list(STATKEY_WIL = -2, STATKEY_CON = -2)
	duration = 2.5 MINUTES

/atom/movable/screen/alert/status_effect/debuff/call_to_arms
	name = "Ravox's Call to Arms"
	desc = "His voice keeps ringing in your ears, rocking your soul.."
	icon_state = "call_to_arms"

/datum/status_effect/debuff/ravox_burden
	id = "ravox_burden"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/ravox_burden
	effectedstats = list(STATKEY_SPD = -2, STATKEY_WIL = -3)
	duration = 12 SECONDS

/atom/movable/screen/alert/status_effect/debuff/ravox_burden
	name = "Ravox's Burden"
	desc = "My arms and legs are restrained by divine chains!\n"
	icon_state = "restrained"

/datum/status_effect/debuff/call_to_slaughter
	id = "call_to_slaughter"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/call_to_slaughter
	effectedstats = list(STATKEY_WIL = -2, STATKEY_CON = -2)
	duration = 2.5 MINUTES

/atom/movable/screen/alert/status_effect/debuff/call_to_slaughter
	name = "Call to Slaughter"
	desc = "A putrid rotting scent fills your nose as Graggar's call for slaughter rattles you to your core.."
	icon_state = "call_to_slaughter"

//For revive - your body DIDN'T rot, but it did suffer damage. Unlike being rotted, this one is only timed. Not forever.
/datum/status_effect/debuff/revived
	id = "revived"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/revived
	effectedstats = list(STATKEY_STR = -1, STATKEY_PER = -1, STATKEY_INT = -1, STATKEY_WIL = -1, STATKEY_CON = -1, STATKEY_SPD = -1, STATKEY_LCK = -1)
	duration = 15 MINUTES		//Should be long enough to stop someone from running back into battle. Plus, this stacks with body-rot debuff. RIP.

/atom/movable/screen/alert/status_effect/debuff/revived
	name = "Revival Sickness"
	desc = "You felt lyfe itself course through you, restoring your lux and your essence. You.. live - but your body aches. It still needs time to recover.."
	icon_state = "revived"

//For de-rot - your body ROTTED. Harsher penalty for longer, can be fully off-set with a cure-rot potion.
/datum/status_effect/debuff/rotted
	id = "rotted_body"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/rotted
	effectedstats = list(STATKEY_STR = -2, STATKEY_PER = -2, STATKEY_INT = -2, STATKEY_WIL = -2, STATKEY_CON = -2, STATKEY_SPD = -2, STATKEY_LCK = -2)
	duration = 30 MINUTES	//Back to a temporary 30 min duration. It hurts.

/atom/movable/screen/alert/status_effect/debuff/rotted
	name = "Rot Paralysis"
	desc = "You came back from death, but everything aches.. you can feel it in your muscles. Even in your nose, you can smell something putrid and foul. You live yet, but at what cost..?"
	icon_state = "rotted_body"

//Replaces the flat-stat change, this should ONLY apply to zombies who have been dead for some time. Makes them easier to kill.
/datum/status_effect/debuff/rotted_zombie
	id = "rotted_zombie"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/rotted_zombie
	effectedstats = list(STATKEY_CON = -8)
	//No duration = infinate in time - this is removed on de-rot miricle OR de-rot surgery. Won't be applied unless you've been a zombie for ~20 min.

/atom/movable/screen/alert/status_effect/debuff/rotted_zombie
	name = "Decomposing Corpse"
	desc = "You've been dead for some time.. your body is finally starting to give out on you."
	icon_state = "rotted_body"	//Temp holdover, no idea what I'd do for a new icon for this.

/datum/status_effect/debuff/dazed
	id = "dazed"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/dazed
	effectedstats = list(STATKEY_PER = -2, STATKEY_INT = -2)
	duration = 15 SECONDS
	status_type = STATUS_EFFECT_REFRESH

/datum/status_effect/debuff/dazed/shield
	effectedstats = list(STATKEY_PER = -3, STATKEY_LCK = -1)
	duration = 8 SECONDS

/atom/movable/screen/alert/status_effect/debuff/dazed
	name = "Dazed"
	desc = "You've been smacked on the head very hard. Which way is left, again?"
	icon_state = "dazed"

/datum/status_effect/debuff/cold
	id = "Frostveiled"
	alert_type =  /atom/movable/screen/alert/status_effect/debuff/cold
	effectedstats = list(STATKEY_SPD = -2)
	duration = 12 SECONDS

/datum/status_effect/debuff/cold/on_apply()
	. = ..()
	var/mob/living/target = owner
	var/newcolor = rgb(136, 191, 255)
	target.add_atom_colour(newcolor, TEMPORARY_COLOUR_PRIORITY)
	addtimer(CALLBACK(target, TYPE_PROC_REF(/atom, remove_atom_colour), TEMPORARY_COLOUR_PRIORITY, newcolor), 12 SECONDS)

/atom/movable/screen/alert/status_effect/debuff/cold
	name = "Cold"
	desc = "Something has chilled me to the bone! It's hard to move."
	icon_state = "muscles"

/*/atom/movable/screen/alert/status_effect/debuff/dazed/shield
	name = "Dazed by fencer's wrap"
	desc = "That stupid piece of cloth is so distracting! It pisses me off!"
	icon_state = "dazed" */

/datum/status_effect/debuff/staggered
	id = "staggered"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/staggered
	effectedstats = list(STATKEY_PER = -2, STATKEY_SPD = -2, STATKEY_CON = -2)
	duration = 10 SECONDS

/atom/movable/screen/alert/status_effect/debuff/staggered
	name = "Staggered"
	desc = "You've been smacked by something big. The force of impact has left you staggered."
	icon_state = "dazed"

/datum/status_effect/debuff/staggered/on_apply()
		. = ..()
		var/mob/living/carbon/C = owner
		C.add_movespeed_modifier(MOVESPEED_ID_DAMAGE_SLOWDOWN, multiplicative_slowdown = 1.5)

/datum/status_effect/debuff/staggered/on_remove()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_movespeed_modifier(MOVESPEED_ID_DAMAGE_SLOWDOWN)

/datum/status_effect/debuff/excomm
	id = "Excommunicated!"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/excomm
	effectedstats = list(STATKEY_LCK = -2, STATKEY_INT = -2, STATKEY_SPD = -1, STATKEY_WIL = -1, STATKEY_CON = -1)
	duration = -1

/atom/movable/screen/alert/status_effect/debuff/excomm
	name = "Excommunicated!"
	desc = "The Ten have forsaken me!"
	icon_state = "muscles"
	color ="#6d1313"

/datum/status_effect/debuff/apostasy
	id = "Apostasy!"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/apostasy
	effectedstats = list(STATKEY_LCK = -5, STATKEY_INT = -3, STATKEY_PER = -2 , STATKEY_SPD = -2, STATKEY_WIL = -2, STATKEY_CON = -2)
	duration = -1
	var/resistant = FALSE
	var/original_devotion = 0
	var/original_prayer_effectiveness = 0
	var/original_passive_devotion_gain = 0
	var/original_passive_progression_gain = 0

/datum/status_effect/debuff/apostasy/on_creation(mob/living/new_owner, resistant = FALSE)
	src.resistant = resistant
	return ..()

/datum/status_effect/debuff/apostasy/on_apply()
	. = ..()
	if(!ishuman(owner))
		return FALSE
	var/mob/living/carbon/human/H = owner
	if(!H.devotion)
		return FALSE

	var/datum/devotion/D = H.devotion
	original_devotion = D.devotion
	original_prayer_effectiveness = D.prayer_effectiveness
	original_passive_devotion_gain = D.passive_devotion_gain
	original_passive_progression_gain = D.passive_progression_gain

	if(resistant)
		D.devotion = original_devotion * 0.5
		D.prayer_effectiveness = original_prayer_effectiveness * 0.5
		D.passive_devotion_gain = original_passive_devotion_gain * 0.5
		D.passive_progression_gain = original_passive_progression_gain * 0.5
	else
		D.devotion = 0
		D.prayer_effectiveness = 0
		D.passive_devotion_gain = 0
		D.passive_progression_gain = 0

	to_chat(H, span_boldnotice("I have been excommunicated. I am now unable to gain devotion."))
	return ..()

/datum/status_effect/debuff/apostasy/on_remove()
	. = ..()
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		if(H.devotion)
			var/datum/devotion/D = H.devotion
			D.devotion = original_devotion
			D.prayer_effectiveness = original_prayer_effectiveness
			D.passive_devotion_gain = original_passive_devotion_gain
			D.passive_progression_gain = original_passive_progression_gain

		to_chat(H, span_boldnotice("I have been welcomed back to the Church. I am now able to gain devotion again."))

/atom/movable/screen/alert/status_effect/debuff/apostasy
	name = "Apostasy!"
	desc = "Shame upon this member of the clergy!"
	icon_state = "debuff"
	color ="#7a0606"

/datum/status_effect/debuff/hereticsermon
	id = "Heretic on sermon!"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hereticsermon
	effectedstats = list(STATKEY_INT = -2, STATKEY_SPD = -2, STATKEY_LCK = -2)
	duration = 20 MINUTES

/atom/movable/screen/alert/status_effect/debuff/hereticsermon
	name = "Daemonic Omen"
	desc = "I heard a holy pantheonic sermon. My patron is not pleased."
	icon_state = "debuff"
	color ="#af9f9f"

/datum/status_effect/debuff/lost_naledi_mask
	id = "naledimask"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/naledimask
	effectedstats = list(STATKEY_WIL = -3, STATKEY_LCK = -3)

/atom/movable/screen/alert/status_effect/debuff/naledimask
	name = "Lost Mask"
	desc = "Djinns and daemons may claim me at any moment without the mask. It is not safe."
	icon_state = "muscles"

/datum/status_effect/debuff/lost_shaman_hood
	id = "naledimask"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/shamanhood
	effectedstats = list(STATKEY_WIL = -3, STATKEY_LCK = -3)

/atom/movable/screen/alert/status_effect/debuff/shamanhood
	name = "Lost Hood"
	desc = "The sacred hood is lost. I feel frail and sapped without it."

///////////////////////
/// CLIMBING STUFF ///
/////////////////////

/// OPEN SPACE TURF BASED CLIMBING, MOB DRAG-DROP TILE
/datum/status_effect/debuff/climbing_lfwb
	id = "climbing_lfwb"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/climbing_lfwb
	tick_interval = 10

/datum/status_effect/debuff/climbing_lfwb/on_apply()
	. = ..()
	var/mob/living/climber = owner
	climber.climbing = TRUE
	climber.put_in_hands(new /obj/item/clothing/wall_grab, TRUE, FALSE, TRUE) // gotta have new before /obj/... , otherwise its gonna die

/datum/status_effect/debuff/climbing_lfwb/tick() // do we wanna do this shit every single second? I guess we do boss
	. = ..()
	var/mob/living/carbon/human/climber = owner
	var/baseline_stamina_cost = 35 // have to disable stamina regen while on wall bruh in energystamina.dm
	var/climb_gear_bonus = 1
	if((istype(climber.backr, /obj/item/clothing/climbing_gear)) || (istype(climber.backl, /obj/item/clothing/climbing_gear)))
		climb_gear_bonus = 2
	var/climbing_skill = max(climber.get_skill_level(/datum/skill/misc/climbing), SKILL_LEVEL_NOVICE) // freestyla hugboxed my shitcode FVCK
	var/stamina_cost_final = round(((baseline_stamina_cost / climbing_skill) / climb_gear_bonus), 1) // each END is 10 stam, each athletics is 5 stam
//	to_chat(climber, span_warningbig("[stamina_cost_final] REMOVED!")) // debug msg
	climber.stamina_add(stamina_cost_final) // every tick interval this much stamina is deducted
	var/turf/tile_under_climber = climber.loc
	var/list/random_shit_under_climber = list()
	for(var/obj/structure/flora/newbranch/branch in climber.loc)
		random_shit_under_climber += branch
	for(var/obj/machinery/light/rogue/chand/chandelier in climber.loc)
		random_shit_under_climber += chandelier
	for(var/obj/structure/kybraxor/fucking_hatch in climber.loc)
		random_shit_under_climber += fucking_hatch
	if(!istype(tile_under_climber, /turf/open/transparent/openspace))// if we aren't on open space turf, remove debuff (aka our feet are on solid shi or water)
		climber.remove_status_effect(/datum/status_effect/debuff/climbing_lfwb)
	if(random_shit_under_climber.len) // branches dont remove open space turf, so we have to check for it separately
		climber.remove_status_effect(/datum/status_effect/debuff/climbing_lfwb)
	else if(climber.stamina >= climber.max_stamina) // if we run out of green bar stamina, we fall
		to_chat(climber, span_dead("I can't hold onto the ledge for any longer!"))
		climber.remove_status_effect(/datum/status_effect/debuff/climbing_lfwb)
		tile_under_climber.zFall(climber)


/datum/status_effect/debuff/climbing_lfwb/on_remove()
	. = ..()
	var/mob/living/climber = owner
	climber.climbing = FALSE
	if(climber.is_holding_item_of_type(/obj/item/clothing/wall_grab)) // the slop slops itself holy shit
		for(var/obj/item/clothing/wall_grab/I in climber.held_items)
			if(istype(I, /obj/item/clothing/wall_grab))
				qdel(I)
				return

/atom/movable/screen/alert/status_effect/debuff/climbing_lfwb
	name = "Climbing..."
	desc = "Guess what, you are climbing, buddy."
	icon_state = "muscles"
	
/atom/movable/screen/alert/status_effect/emberwine
	name = "Aphrodesiac"
	desc = "The warmth is spreading through my body..."
	icon_state = "emberwine"

/datum/status_effect/debuff/emberwine
	id = "emberwine"
	effectedstats = list("strength" = -1, "endurance" = -2, "speed" = -2, "intelligence" = -3)
	duration = 1 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/emberwine
	
/* Kockout */
/datum/status_effect/debuff/knockout
	id = "knockout"
	effectedstats = null
	alert_type = null
	duration = 12 SECONDS
	var/time = 0

/datum/status_effect/debuff/knockout/tick()
	time += 1
	switch(time)
		if(3)
			if(prob(50)) //You don't always know...
				var/msg = pick("I feel sleepy...", "I feel relaxed.", "My eyes feel a little heavy.")
				to_chat(owner, span_warn(msg))

		if(5)
			if(prob(50))
				owner.Slowdown(20)
			else
				owner.Slowdown(10)
		if(8)
			if(iscarbon(owner))
				var/mob/living/carbon/C = owner
				var/msg = pick("yawn", "cough", "clearthroat")
				C.emote(msg, forced = TRUE)
		if(12)
			// it's possible that stacking effects delay this.
			// If we hit 12 regardless we end
			Destroy()

/datum/status_effect/debuff/knockout/on_remove()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		if(C.IsSleeping()) //No need to add more it's already pretty long.
			return ..()
		C.SetSleeping(20 SECONDS)
	..()

/atom/movable/screen/alert/status_effect/debuff/knockout
	name = "Drowsy"
