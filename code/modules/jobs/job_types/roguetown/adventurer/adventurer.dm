GLOBAL_LIST_EMPTY(billagerspawns)

GLOBAL_VAR_INIT(adventurer_hugbox_duration, 40 SECONDS)
GLOBAL_VAR_INIT(adventurer_hugbox_duration_still, 3 MINUTES)

/datum/job/roguetown/adventurer
	title = "Outlander"
	flag = ADVENTURER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 20
	spawn_positions = 20
	allowed_races = RACES_ALL_KINDS
	tutorial = "A wanderer, not from this region. Whatever led you to this fate is up to the wind to decide, be it that you are fleeing the civil war, looking for work, or otherwise. Whether you will survive the coming week is an altogether different matter entirely- however. The roads have become inhospitable and treacherous to most. You may learn fairly quickly why your destination has become so isolated from everywhere else."
	class_categories = TRUE

	outfit = null
	outfit_female = null

	display_order = JDO_ADVENTURER
	show_in_credits = FALSE
	min_pq = 0
	max_pq = null

	advclass_cat_rolls = list(CTAG_ADVENTURER = 20)
	PQ_boost_divider = 10

	announce_latejoin = FALSE
	wanderer_examine = TRUE
	advjob_examine = TRUE
	always_show_on_latechoices = TRUE
	job_reopens_slots_on_death = TRUE
	same_job_respawn_delay = 1 MINUTES

	cmode_music = 'sound/music/cmode/adventurer/combat_outlander2.ogg'
	job_traits = list(TRAIT_OUTLANDER)

	job_subclasses = list(
		/datum/advclass/cleric,
		/datum/advclass/cleric/paladin,
		/datum/advclass/cleric/cantor,
		/datum/advclass/cleric/missionary,
		/datum/advclass/sfighter,
		/datum/advclass/sfighter/duelist,
		/datum/advclass/sfighter/mhunter,
		/datum/advclass/sfighter/barbarian,
		/datum/advclass/sfighter/ironclad,
		/datum/advclass/rogue,
		/datum/advclass/rogue/thief,
		/datum/advclass/rogue/bard,
		/datum/advclass/rogue/swashbuckler,
		/datum/advclass/mage,
		/datum/advclass/mage/spellblade,
		/datum/advclass/mage/spellsinger,
		/datum/advclass/ranger,
		/datum/advclass/ranger/assassin,
		/datum/advclass/ranger/bombadier,
		/datum/advclass/ranger/bwanderer,
		/datum/advclass/trader,
		/datum/advclass/trader/doomsayer,
		/datum/advclass/trader/scholar,
		/datum/advclass/trader/harlequin,
		/datum/advclass/trader/peddler,
		/datum/advclass/trader/brewer,
		/datum/advclass/trader/cuisiner,
		/datum/advclass/foreigner,
		/datum/advclass/foreigner/amsalja,
		/datum/advclass/foreigner/repentant,
		/datum/advclass/foreigner/refugee,
		/datum/advclass/foreigner/slaver
	)

/mob/living/carbon/human/proc/adv_hugboxing_start()
	to_chat(src, span_warning("I will lose my divine protection when I begin to move."))
	status_flags |= GODMODE
	ADD_TRAIT(src, TRAIT_PACIFISM, HUGBOX_TRAIT)
	RegisterSignal(src, COMSIG_MOVABLE_MOVED, PROC_REF(adv_hugboxing_moved))
	//Lies, it goes away even if you don't move after enough time
	if(GLOB.adventurer_hugbox_duration_still)
		addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/carbon/human, adv_hugboxing_end)), GLOB.adventurer_hugbox_duration_still)

/mob/living/carbon/human/proc/adv_hugboxing_moved()
	UnregisterSignal(src, COMSIG_MOVABLE_MOVED)
	to_chat(src, span_danger("I have [DisplayTimeText(GLOB.adventurer_hugbox_duration)] to begone!"))
	addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/carbon/human, adv_hugboxing_end)), GLOB.adventurer_hugbox_duration)

/mob/living/carbon/human/proc/adv_hugboxing_end()
	if(QDELETED(src))
		return
	//hugbox already ended
	if(!(status_flags & GODMODE))
		return
	status_flags &= ~GODMODE
	REMOVE_TRAIT(src, TRAIT_PACIFISM, HUGBOX_TRAIT)
	to_chat(src, span_danger("The warm feeling vanishes. Danger surrounds me.. my divine protection has vanished."))
