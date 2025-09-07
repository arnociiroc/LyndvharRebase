/datum/migrant_wave/grenzelhoft
	name = "Grenzelhoft Envoy"
	max_spawns = 1
	shared_wave_type = /datum/migrant_wave/grenzelhoft
	weight = 50
	downgrade_wave = /datum/migrant_wave/grenzelhoft_down_one
	roles = list(
		/datum/migrant_role/grenzelhoft/envoy = 1,
		/datum/migrant_role/grenzelhoft/doppelsoldner = 2,
		/datum/migrant_role/grenzelhoft/boltslinger = 1,
	)
	greet_text = ""

/datum/migrant_wave/grenzelhoft_down_one
	name = "Grenzelhoft Envoy"
	shared_wave_type = /datum/migrant_wave/grenzelhoft
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/grenzelhoft_down_two
	roles = list(
		/datum/migrant_role/grenzelhoft/envoy = 1,
		/datum/migrant_role/grenzelhoft/doppelsoldner = 2,
	)
	greet_text = ""

/datum/migrant_wave/grenzelhoft_down_two
	name = "Grenzelhoft Envoy"
	shared_wave_type = /datum/migrant_wave/grenzelhoft
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/grenzelhoft_down_three
	roles = list(
		/datum/migrant_role/grenzelhoft/envoy = 1,
		/datum/migrant_role/grenzelhoft/doppelsoldner = 1,
	)
	greet_text = ""

/datum/migrant_wave/grenzelhoft_down_three
	name = "Grenzelhoft Envoy"
	shared_wave_type = /datum/migrant_wave/grenzelhoft
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/grenzelhoft_down_four
	roles = list(
		/datum/migrant_role/grenzelhoft/envoy = 1,
		/datum/migrant_role/grenzelhoft/doppelsoldner = 1,
	)
	greet_text = ""

/datum/migrant_wave/grenzelhoft_down_four
	name = "Grenzelhoft Envoy"
	shared_wave_type = /datum/migrant_wave/grenzelhoft
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/grenzelhoft/envoy = 1,
	)
	greet_text = ""
