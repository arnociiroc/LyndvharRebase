/*
	Combat Mode Music Track Datums
	---
	Currently only used for overriding the default combat music that comes with your job or antagonist.
	As of writing they are never directly applied to mobs themselves, only the name and musicpath are.
	Deleting these datums or renaming subtypes will not break preferences; invalid saves get redirected to /default.
	When adding new songs, add a shortname around ~12 characters for the game preferences menu.
	
	IMPORTANT! Be careful about adding songs to this list that aren't used anywhere else, lest you needlessly inflate the RSC.
*/

// Admins: please don't molest my lists. You can't add new types at runtime anyways. Kisses! - Zoktiik
GLOBAL_LIST_EMPTY(cmode_tracks_by_type)
GLOBAL_LIST_EMPTY(cmode_tracks_by_name)

// People make mistakes. This should help catch when that happens.
/proc/cmode_track_to_namelist(var/datum/combat_music/track)
	if(!track)
		return
	if(!track.name)
		LAZYREMOVE(GLOB.cmode_tracks_by_type, track.type)
		CRASH("CMODE MUSIC: type [track.type] has no name!") 
	if(GLOB.cmode_tracks_by_name[track.name])
		LAZYREMOVE(GLOB.cmode_tracks_by_type, track.type)
		CRASH("CMODE MUSIC: type [track.type] has duplicate name \"[track.name]\"!")
	GLOB.cmode_tracks_by_name[track.name] = track
	return

/datum/combat_music
	var/name
	var/desc
	var/shortname
	var/credits
	var/musicpath = list()

// Shit WILL break if you change /default's typepath. Don't do it.
/datum/combat_music/default
	name = "Default"
	desc = "I let my current status sing for itself; its song will change dynamically."
	shortname = "Default"
	musicpath = list()

/datum/combat_music/original
	name = "Origin"
	desc = "The original song of battle."
	shortname = "Original"
	musicpath = list('sound/music/combat.ogg')

/datum/combat_music/ascended
	name = "Ascended"
	desc = "Achieving a higher state of being."
	shortname = "Ascended"
	musicpath = list('sound/music/combat_ascended.ogg')

	/datum/combat_music/bandit
	name = "Bandit"
	desc = "The status of the common crook- the envy of Matthios."
	shortname = "Bandit"
	musicpath = list('sound/music/combat_bandit.ogg')

	/datum/combat_music/bandit2
	name = "Bandit Two"
	desc = "The status of the common crook- the envy of Matthios."
	shortname = "Bandit"
	musicpath = list('sound/music/combat_bandit_mage.ogg')

	/datum/combat_music/baotha
	name = "Baotha Heretic"
	desc = "The songs of one desperate for love- that finds none."
	shortname = "Baotha"
	musicpath = list('sound/music/combat_baotha.ogg')

	/datum/combat_music/blackoak
	name = "Black Oak"
	desc = "The songs of those protective of the woodlands."
	shortname = "Warden"
	musicpath = list('sound/music/combat_blackoak.ogg')

	/datum/combat_music/blackstar
	name = "Blackened Star"
	desc = "The dark star shines upon you- and not lightly."
	shortname = "Blackstar"
	musicpath = list('sound/music/combat_blackstar.ogg')

	/datum/combat_music/bum
	name = "Bum"
	desc = "Showcasing how much of a useless wastrel you truly are."
	shortname = "Bum"
	musicpath = list('sound/music/combat_bum.ogg')

	/datum/combat_music/captain
	name = "Captain"
	desc = "The guardian protector of the city watch."
	shortname = "Captain"
	musicpath = list('sound/music/combat_captain.ogg')

	/datum/combat_music/condottiero
	name = "Condottiero"
	desc = "The songs and power of the Dunargiac provincial."
	shortname = "Condottiero"
	musicpath = list('sound/music/combat_condottiero.ogg')

	/datum/combat_music/cult
	name = "Cult"
	desc = "The voices of the beyond call in damnation."
	shortname = "Cult"
	musicpath = list('sound/music/combat_cult.ogg')

	/datum/combat_music/delf
	name = "Dark Elf"
	desc = "The call of the Underdark."
	shortname = "Drow"
	musicpath = list('sound/music/combat_delf.ogg')

	/datum/combat_music/desertrider
	name = "Desert Rider"
	desc = "The sands and jungles of Zybantu call upon you for a reckoning."
	shortname = "Zybantu"
	musicpath = list('sound/music/combat_desertrider.ogg')

	/datum/combat_music/dungeoneer
	name = "Dungeoneer"
	desc = "The screams of a dungeon echo in your mind."
	shortname = "Dungeoneer"
	musicpath = list('sound/music/combat_dungeoneer.ogg')

	/datum/combat_music/dwarf
	name = "Dwarf"
	desc = "This hole won't dig itself, after all."
	shortname = "Dwarf"
	musicpath = list('sound/music/combat_dwarf.ogg')

	/datum/combat_music/garrison
	name = "Garrison"
	desc = "It is your watch that protects this realm."
	shortname = "Guardsman"
	musicpath = list('sound/music/combat_garrison.ogg')

	/datum/combat_music/graggar
	name = "Graggar"
	desc = "The music of the warriors of Graggar."
	shortname = "Graggar"
	musicpath = list('sound/music/combat_graggar.ogg')

	/datum/combat_music/grenzelhoft
	name = "Grenzelhoft"
	desc = "The Kaiserate commands- and you obey. No other word matters to you- not even the so-called gods."
	shortname = "Grenz"
	musicpath = list('sound/music/combat_grenzelhoft.ogg')

	/datum/combat_music/rhaenval
	name = "Rhaenvalian"
	desc = "The winds speak to you- an omen upon the horizon. The shamans will speak highly of you."
	shortname = "Rhaenval"
	musicpath = list('sound/music/combat_rhaenval.ogg')

	/datum/combat_music/hand
	name = "Hand of the Viscount"
	desc = "A melody of the second most powerful individual in the city."
	shortname = "Hand"
	musicpath = list('sound/music/combat_rhaenval.ogg')

	/datum/combat_music/heretic
	name = "Heretic"
	desc = "Cast aside by the divine- who else shall heed your pleas?"
	shortname = "Heretic"
	musicpath = list('sound/music/combat_heretic.ogg')

	/datum/combat_music/holy
	name = "Holy Devout"
	desc = "The pantheon speaks through you- and all around you."
	shortname = "Holy"
	musicpath = list('sound/music/combat_holy.ogg')

	/datum/combat_music/inqold
	name = "Inquisition (Old)"
	desc = "A reckoning comes before this realm- Psydon's will."
	shortname = "Inqold"
	musicpath = list('sound/music/combat_inqold.ogg')

	/datum/combat_music/ordinator
	name = "Inquisition (Ordinator)"
	desc = "A reckoning comes before this realm- Psydon's will."
	shortname = "Inqord"
	musicpath = list('sound/music/combat_inqordinator.ogg')

	/datum/combat_music/jester
	name = "Jester"
	desc = "Laughter echoes throughout these halls."
	shortname = "Jester"
	musicpath = list('sound/music/combat_jester.ogg')

	/datum/combat_music/khazumite
	name = "Khazumite"
	desc = "How did you even get here, I wonder..? It matters little."
	shortname = "Khazumite"
	musicpath = list('sound/music/combat_khazumite.ogg')

	/datum/combat_music/knight
	name = "Knightly Oath"
	desc = "You swore an oath and you will see it upheld."
	shortname = "Knight"
	musicpath = list('sound/music/combat_knight.ogg')

	/datum/combat_music/manatarms
	name = "Man-At-Arms"
	desc = "It is your watch that protects this realm. (Old Garrison)"
	shortname = "MAA"
	musicpath = list('sound/music/combat_ManAtArms.ogg')

	/datum/combat_music/maniac
	name = "Maniac"
	desc = "Driven by an endless, never-satiated spree for death. They will wake up."
	shortname = "Maniac"
	musicpath = list('sound/music/combat_maniac.ogg')

	/datum/combat_music/default
	name = "Default"
	desc = "I let my current status sing for itself; its song will change dynamically."
	shortname = "Default"
	musicpath = list()
