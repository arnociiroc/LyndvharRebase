/datum/migrant_wave/underdark
	name = "Underdark Slavers"
	max_spawns = 1
	shared_wave_type = /datum/migrant_wave/underdark
	weight = 50
	downgrade_wave = /datum/migrant_wave/underdark_down_one
	roles = list(
		/datum/migrant_role/underdark/thrallmaster = 1,
		/datum/migrant_role/underdark/halberdier = 2,
		/datum/migrant_role/underdark/bladesinger = 1,
		/datum/migrant_role/underdark/archer = 2,
		/datum/migrant_role/underdark/slave = 1,
	)
	greet_text = ""

/datum/migrant_wave/underdark_down_one
	name = "Underdark Slavers"
	shared_wave_type = /datum/migrant_wave/underdark
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/underdark_down_two
	roles = list(
		/datum/migrant_role/underdark/thrallmaster = 1,
		/datum/migrant_role/underdark/halberdier = 2,
		/datum/migrant_role/underdark/bladesinger = 1,
		/datum/migrant_role/underdark/archer = 2,
	)
	greet_text = ""

/datum/migrant_wave/underdark_down_two
	name = "Underdark Slavers"
	shared_wave_type = /datum/migrant_wave/underdark
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/underdark_down_three
	roles = list(
		/datum/migrant_role/underdark/thrallmaster = 1,
		/datum/migrant_role/underdark/halberdier = 2,
		/datum/migrant_role/underdark/bladesinger = 1,
		/datum/migrant_role/underdark/archer = 1,
	)
	greet_text = ""


/datum/migrant_wave/underdark_down_three
	name = "Underdark Slavers"
	shared_wave_type = /datum/migrant_wave/underdark
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/underdark_down_four
	roles = list(
		/datum/migrant_role/underdark/thrallmaster = 1,
		/datum/migrant_role/underdark/halberdier = 1,
		/datum/migrant_role/underdark/bladesinger = 1,
		/datum/migrant_role/underdark/archer = 1,
	)
	greet_text = ""

/datum/migrant_wave/underdark_down_four
	name = "Underdark Slavers"
	shared_wave_type = /datum/migrant_wave/underdark
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/underdark_down_five
	roles = list(
		/datum/migrant_role/underdark/thrallmaster = 1,
		/datum/migrant_role/underdark/halberdier = 1,
		/datum/migrant_role/underdark/bladesinger = 1,
	)
	greet_text = ""

/datum/migrant_wave/underdark_down_five
	name = "Underdark Slavers"
	shared_wave_type = /datum/migrant_wave/underdark
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/underdark_down_six
	roles = list(
		/datum/migrant_role/underdark/thrallmaster = 1,
		/datum/migrant_role/underdark/bladesinger = 1,
	)
	greet_text = ""

/datum/migrant_wave/underdark_down_six
	name = "Underdark Slavers"
	shared_wave_type = /datum/migrant_wave/underdark
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/underdark_down_seven
	roles = list(
		/datum/migrant_role/underdark/thrallmaster = 1,
	)
	greet_text = ""
