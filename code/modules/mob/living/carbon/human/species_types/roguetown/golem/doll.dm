/mob/living/carbon/human/species/golem/porcelain
	race = /datum/species/golem/porcelain
	construct = 1

/datum/species/golem/porcelain
	name = "Marionette"
	id = "doll"
	desc = "<b>Marionette</b><br>\
	The pinnacle of art, craftsmanship, and arcanist witch-engineering, the Marionette is a soul of artifice; \
	a mortal replication of the godspawn Aasimari. One of the youngest 'species' of the World, if one could call them that, Marionettes - or 'dolls,' as they are often referred, \
	are typically formed out of complex layers of enchanted brass, glass, porcelain; the ideal material-mediums for a series of complex hexes and runes to render them animate - and couch lux within their internals. \
	Thanks to this extravagantly expensive art, they speak, act, and think - and do not need to sleep, eat, or breathe. However, as imperfect imitations of the divine Aasimar, these constructs are frail, fragile things;  \
	built brittle and easily sundered. A single Marionette can be of exorbitant cost, depending on the workshop: the priciest remain in central Valoria. \
	Thus, they remain pawns and gifts of the nobility almost exclusively - a thoughtful servant, an efficient clerk, and a general aid around the manor, among other things- built to serve, but not to last. \
	As for what they themselves think of their fate? Well, who knows what goes on behind those artificed eyes?<br> \
	<span style='color: #cc0f0f;text-shadow:-1px -1px 0 #000,1px -1px 0 #000,-1px 1px 0 #000,1px 1px 0 #000;'><b><span style='color: #6a8cb7;text-shadow:-1px -1px 0 #000,1px -1px 0 #000,-1px 1px 0 #000,1px 1px 0 #000;'>Hungerless, Insomnia, Bloodless. Extremely fragile.</span></b></br>\
	<span style='color: #cc0f0f;text-shadow:-1px -1px 0 #000,1px -1px 0 #000,-1px 1px 0 #000,1px 1px 0 #000;'><b><span style='color: #6a8cb7;text-shadow:-1px -1px 0 #000,1px -1px 0 #000,-1px 1px 0 #000,1px 1px 0 #000;'>Capable of installing skill exhibitors in themselves or other constructs.</span></b></br>"


	construct = 1
	skin_tone_wording = "Material"
	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,HAIR,LIPS,OLDGREY,NOBLOOD)
	default_features = MANDATORY_FEATURE_LIST
	use_skintones = 1
	possible_ages = ALL_AGES_LIST
	skinned_type = /obj/item/ingot/steel
	disliked_food = NONE
	liked_food = NONE
	inherent_traits = list(TRAIT_NOHUNGER, TRAIT_BLOODLOSS_IMMUNE, TRAIT_NOBREATH, TRAIT_NOSLEEP, TRAIT_CRITICAL_WEAKNESS,
	TRAIT_EASYDISMEMBER, TRAIT_LIMBATTACHMENT, TRAIT_NOMETABOLISM, TRAIT_ZOMBIE_IMMUNE)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mdoll.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fdoll.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	soundpack_m = /datum/voicepack/male
	soundpack_f = /datum/voicepack/female
	offset_features = list(
		OFFSET_ID = list(0,0), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1), OFFSET_HANDS = list(0,0), \
		OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,0), OFFSET_HEAD = list(0,0), \
		OFFSET_FACE = list(0,0), OFFSET_BELT_F = list(0,0), OFFSET_BACK = list(0,0), \
		OFFSET_NECK = list(0,0), OFFSET_MOUTH = list(0,0), OFFSET_PANTS = list(0,1), \
		OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_UNDIES = list(0,1),\
		OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
		OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
		OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,-1), OFFSET_BACK_F = list(0,-1), \
		OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
		OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,-1), \
		)
	
	race_bonus = list(STAT_SPEED = 1, STAT_STRENGTH = -2, STAT_CONSTITUTION = -1)
	enflamed_icon = "widefire"
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain/construct,
		ORGAN_SLOT_HEART = /obj/item/organ/heart/construct,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs/construct,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes/construct,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue/construct,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver/construct,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach/construct,
		)
	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/bodypart_feature/underwear,
		/datum/customizer/organ/penis/anthro,
		/datum/customizer/organ/breasts/human,
		/datum/customizer/organ/vagina/human_anthro,
		/datum/customizer/organ/testicles/anthro,
		)
	body_marking_sets = list(
		/datum/body_marking_set/none,
	)
	body_markings = list(
	    /datum/body_marking/flushed_cheeks,
		/datum/body_marking/eyeliner,
		/datum/body_marking/tonage,
		/datum/body_marking/nose,
		/datum/body_marking/bangs,
		/datum/body_marking/bun,
	)

/datum/species/golem/porcelain/check_roundstart_eligible()
	return TRUE

/datum/species/golem/porcelain/get_skin_list()
	return list(
		"Porcelain" = DOLL_PORCELAIN,
		"Sienna" = DOLL_SIENNA,
		"Lotus" = DOLL_LOTUS,
		"Dawn" = DOLL_DAWN,
		"Walnut" = DOLL_WALNUT,
		"Gloom" = DOLL_GLOOM,
		"Dusk" = DOLL_DUSK,
	)

/datum/species/golem/porcelain/get_hairc_list()
	return sortList(list(

	"black - midnight" = "1d1b2b",

	"red - blood" = "822b2b"

	))

// Golem Skill Core Stuff that I've transplanted here.

/obj/item/golem_skill_core
	icon = 'icons/roguetown/items/misc.dmi'
	name = "golem skill exhibitor"
	desc = "A series of gears joined around a copper rod. When inserted into a Golem's head, it will allow them to grow their skills beyond their original design."
	icon_state = "golem_upgrade"
	w_class = WEIGHT_CLASS_SMALL
	smeltresult = /obj/item/ingot/bronze
	var/self_usable = FALSE //allow golems to use it on themselves without skill reqs, exclusively used for the black market ver
	var/in_use = FALSE //to avoid situations where the dialog box is open but you click the golem again with it

/obj/item/golem_skill_core/blackmarket
	name = "modified golem skill exhibitor"
	desc = "A series of gears joined around a copper rod. When inserted into a Golem's head, it will allow them to grow their skills beyond their original design. This one looks like it was purposefully altered to allow Golems to use it themselves."
	self_usable = TRUE

/obj/item/golem_skill_core/examine(mob/user)
	. = ..()
	if(in_use)
		. += span_warning("It's spinning and whirring.")

/obj/item/golem_skill_core/attack(mob/living/T, mob/U)
	if(!ishuman(U))
		return
	var/mob/living/user = U
	if(!ishuman(T))
		to_chat(user, span_warning("[T] is not a Golem. It will have no effect."))
		return

	var/mob/living/carbon/human/M = T
	if(!M.construct)
		if(user == M)
			to_chat(user, span_warning("I am not a Golem. It will have no effect."))//Golems can't upgrade themselves anyway, but I think it's at least somewhat useful to say something when an organic tries to use it on themselves
		else
			to_chat(user, span_warning("[M] is not a Golem. It will have no effect."))
		return
	if(user.construct && !self_usable)
		if(!isdoll(user))//dolls can install skill exhibitors in themselves or in other golems
			to_chat(user, span_warning("I am unable to modify Golems. I must ask another."))//Golems NEED to ask organics to modify them.
			return
	if(user.get_skill_level(/datum/skill/craft/engineering) < SKILL_LEVEL_APPRENTICE && !self_usable) //need to be at least level 2 skill level in engineering to use this
		to_chat(user, span_warning("I fiddle around trying to properly insert [src] into [M], but I'm not skilled enough."))
		return
	if(in_use)
		to_chat(user, span_warning("I can't- [src] is still working."))
		return

	var/list/learnable_skills = list()
	var/list/skill_datums = list()
	if(M.mind)
		for(var/skill_type in SSskills.all_skills)
			var/datum/skill/skill = GetSkillRef(skill_type)
			if(skill in M.skills?.known_skills)
				if(M?.mind?.sleep_adv.enough_sleep_xp_to_advance(skill_type, 1))
					LAZYADD(learnable_skills, skill)//we need the actual names of the skill_types so the dialog boxes say "Skill" rather than the type path
					LAZYADD(skill_datums,skill_type)//hold the skill datums so we can reference them later to use in our leveling up procs

	if(!length(learnable_skills))//don't waste the core if we can't use it
		to_chat(user, span_warning("[M] has no new skills to develop."))
		return

	in_use = TRUE
	smeltresult = null //edge case where you'd fully activate it and then smelt it before the golem selects their skill to level, I like denying the smelt more than denying the skill up
	var/time_to_upgrade = 130
	time_to_upgrade -= (user.get_skill_level(/datum/skill/craft/engineering) * 10)//starts at 10 seconds normally, reduced by 1 second per each engineering skill level above 3

	user.visible_message(span_notice("[user] presses [src] against [M]'s head."), span_notice("I begin to insert [src] into [M]'s head."))
	if(!do_mob(user, M, time_to_upgrade))
		disable()
		return

	var/skill_choice = input(M, "Improve yourself.","Skills") as null|anything in learnable_skills
	if(skill_choice)
		for(var/real_skill in skill_datums)//really ugly but I can't think of a way to implement this to show the skill names properly in the dialog box. real_skill is the actual datum for the skill rather than the "Skill" string
			if(skill_choice == GetSkillRef(real_skill))
				if(!M?.mind?.sleep_adv.enough_sleep_xp_to_advance(real_skill, 1))//this should only ever happen if you try and install two knowledge cores at the same time for the same skill, which we don't want to happen
					user.visible_message(span_notice("[src] fizzles in [user]'s hand."), span_notice("[src] fizzles and returns to a resting state."))
					disable()
					return
				M.mind.sleep_adv.adjust_sleep_xp(real_skill, -M.mind.sleep_adv.get_requried_sleep_xp_for_skill(real_skill, 1))
				M.adjust_skillrank(real_skill, 1, FALSE)
				//record_round_statistic(STATS_SKILLS_DREAMED) //up for debate whether golems gaining skills like this should count
				M.visible_message(span_notice("[M] absorbs [src]."), span_notice("I absorb [src] into myself, becoming more skilled."))
				if(M.get_skill_level(real_skill) >= 4)//if our skill is now expert or more, gain a triumph
					to_chat(M, span_boldgreen("Gaining such exquisite expertise in [lowertext(skill_choice)] is a true TRIUMPH."))
					M.adjust_triumphs(1)
				M.allmig_reward++//we also need to do this for RCP and endround triumphs- it's the closest thing Golems have to sleeping.
				add_sleep_experience(user, /datum/skill/craft/engineering, user.STAINT)//give some engi exp for the installer as a reward since it's a skill check
				qdel(src)
				return
	else //if you click "cancel" in the dialog
		user.visible_message(span_notice("[src] deactivates in [user]'s hand."), span_notice("[src] turns off. Perhaps [M] does not yet wish to improve?"))
		disable()
		return

/obj/item/golem_skill_core/proc/disable() //reset it to inactive mode to be paired later on
	in_use = FALSE
	smeltresult = /obj/item/ingot/bronze
	return 
