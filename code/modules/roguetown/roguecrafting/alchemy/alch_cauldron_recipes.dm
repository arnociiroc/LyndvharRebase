/datum/alch_cauldron_recipe/antidote
	name = "Antidote"
	smells_like = "wet moss"
	output_reagents = list(/datum/reagent/medicine/antidote = 81)

/datum/alch_cauldron_recipe/strong_antidote
	name = "Antidote (Strong)"
	smells_like = "purity"
	output_reagents = list(/datum/reagent/medicine/strong_antidote = 81)

/datum/alch_cauldron_recipe/berrypoison
	name = "Poison (Berry)"
	smells_like = "death"
	skill_required = SKILL_LEVEL_JOURNEYMAN // Basic poison should be harder to handle
	output_reagents = list(/datum/reagent/berrypoison = 81)

/datum/alch_cauldron_recipe/doompoison
	name = "Poison (Doom)"
	smells_like = "doom"
	skill_required = SKILL_LEVEL_EXPERT // Strong poison should be more difficult to make
	output_reagents = list(/datum/reagent/berrypoison = 81,/datum/reagent/additive = 81)

/datum/alch_cauldron_recipe/stam_poison
	name = "Stamina Poison"
	smells_like = "a slow breeze"
	skill_required = SKILL_LEVEL_JOURNEYMAN // Basic poison should be harder to handle
	output_reagents = list(/datum/reagent/stampoison = 81)

/datum/alch_cauldron_recipe/big_stam_poison
	name = "Stamina Poison (Strong)"
	smells_like = "stagnant air"
	skill_required = SKILL_LEVEL_EXPERT // Strong poison should be more difficult to make
	output_reagents = list(/datum/reagent/stampoison = 81,/datum/reagent/additive = 81)

//Healing potions
/datum/alch_cauldron_recipe/health_potion
	name = "Elixir of Health"
	smells_like = "sweet berries"
	output_reagents = list(/datum/reagent/medicine/healthpot = 81)

/datum/alch_cauldron_recipe/big_health_potion
	name = "Elixir of Health (Strong)"
	smells_like = "berry pie"
	skill_required = SKILL_LEVEL_JOURNEYMAN // If it has "Strong", lock it roundstart for Apothecary or above
	output_reagents = list(/datum/reagent/medicine/healthpot = 81,/datum/reagent/additive = 81)

/datum/alch_cauldron_recipe/mana_potion
	name = "Elixir of Mana"
	smells_like = "power"
	output_reagents = list(/datum/reagent/medicine/manapot = 81)

/datum/alch_cauldron_recipe/big_mana_potion
	name = "Elixir of Mana (Strong)"
	smells_like = "fear"
	skill_required = SKILL_LEVEL_JOURNEYMAN
	output_reagents = list(/datum/reagent/medicine/manapot = 81,/datum/reagent/additive = 81)

/datum/alch_cauldron_recipe/stamina_potion
	name = "Elixir of Stamina"
	smells_like = "fresh air"
	output_reagents = list(/datum/reagent/medicine/stampot = 81)

/datum/alch_cauldron_recipe/big_stamina_potion
	name = "Elixir of Stamina (Strong)"
	smells_like = "clean winds"
	skill_required = SKILL_LEVEL_JOURNEYMAN
	output_reagents = list(/datum/reagent/medicine/stampot = 81,/datum/reagent/additive = 81)

//S.P.E.C.I.A.L. potions - Expert or above (roundstart Witch etc.)
/datum/alch_cauldron_recipe/str_potion
	name = "Potion of Mountain Muscles"
	smells_like = "petrichor"
	skill_required = SKILL_LEVEL_EXPERT
	output_reagents = list(/datum/reagent/buff/strength = 27)

/datum/alch_cauldron_recipe/per_potion
	name = "Potion of Keen Eye"
	smells_like = "fire"
	skill_required = SKILL_LEVEL_EXPERT
	output_reagents = list(/datum/reagent/buff/perception = 27)

/datum/alch_cauldron_recipe/end_potion
	name = "Potion of Enduring Fortitude"
	smells_like = "mountain air"
	skill_required = SKILL_LEVEL_EXPERT
	output_reagents = list(/datum/reagent/buff/endurance = 27)

/datum/alch_cauldron_recipe/con_potion
	name = "Potion of Stone Flesh"
	smells_like = "earth"
	skill_required = SKILL_LEVEL_EXPERT
	output_reagents = list(/datum/reagent/buff/constitution = 27)

/datum/alch_cauldron_recipe/int_potion
	name = "Potion of Keen Mind"
	smells_like = "water"
	skill_required = SKILL_LEVEL_EXPERT
	output_reagents = list(/datum/reagent/buff/intelligence = 27)

/datum/alch_cauldron_recipe/spd_potion
	name = "Potion of Fleet Foot"
	smells_like = "clean air"
	skill_required = SKILL_LEVEL_EXPERT
	output_reagents = list(/datum/reagent/buff/speed = 27)

/datum/alch_cauldron_recipe/lck_potion
	name = "Potion of Seven Clovers"
	smells_like = "calming"
	skill_required = SKILL_LEVEL_EXPERT
	output_reagents = list(/datum/reagent/buff/fortune = 27)

/datum/alch_cauldron_recipe/aphrodisiac
	name = "Aphrodisiac Wine"
	smells_like = "ardent sweetness"
	output_reagents = list(/datum/reagent/consumable/ethanol/beer/emberwine = 27)
