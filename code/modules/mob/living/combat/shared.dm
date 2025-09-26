/mob/living/carbon/human/proc/calculate_sentinel_bonus()
	if(STAINT > 10)
		var/fakeint = STAINT
		if(status_effects.len)
			for(var/S in status_effects)
				var/datum/status_effect/status = S
				if(status.effectedstats.len)
					if(status.effectedstats[STATKEY_INT])
						if(status.effectedstats[STATKEY_INT] > 0)
							fakeint -= status.effectedstats[STATKEY_INT]
		if(fakeint > 10)
			var/bonus = round(((fakeint - 10) / 2)) * 10
			if(bonus > 0)
				if(HAS_TRAIT(src, TRAIT_HEAVYARMOR) || HAS_TRAIT(src, TRAIT_MEDIUMARMOR) || HAS_TRAIT(src, TRAIT_DODGEEXPERT) || HAS_TRAIT(src, TRAIT_CRITICAL_RESISTANCE))
					bonus = clamp(bonus, 0, 25)
				else
					bonus = clamp(bonus, 0, 50)//20-21 INT
			return bonus
		else
			return 0
	else
		return 0

