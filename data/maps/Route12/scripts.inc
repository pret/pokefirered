# 1 "data/maps/Route12/scripts.pory"

# 2 "data/maps/Route12/scripts.pory"
Route12_MapScripts::
# 3 "data/maps/Route12/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, Route12_OnResume
# 4 "data/maps/Route12/scripts.pory"
	.byte 0
# 5 "data/maps/Route12/scripts.pory"

# 6 "data/maps/Route12/scripts.pory"
Route12_OnResume::
# 7 "data/maps/Route12/scripts.pory"
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, Route12_EventScript_TryRemoveSnorlax
# 8 "data/maps/Route12/scripts.pory"
	end
# 9 "data/maps/Route12/scripts.pory"

# 10 "data/maps/Route12/scripts.pory"
Route12_EventScript_TryRemoveSnorlax::
# 11 "data/maps/Route12/scripts.pory"
	removeobject VAR_LAST_TALKED
# 12 "data/maps/Route12/scripts.pory"
	return
# 13 "data/maps/Route12/scripts.pory"

# 14 "data/maps/Route12/scripts.pory"
Route12_EventScript_Snorlax::
# 15 "data/maps/Route12/scripts.pory"
	lock
# 16 "data/maps/Route12/scripts.pory"
	faceplayer
# 17 "data/maps/Route12/scripts.pory"
	goto_if_unset FLAG_GOT_POKE_FLUTE, Route12_EventScript_SnorlaxNoPokeFlute
# 18 "data/maps/Route12/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 19 "data/maps/Route12/scripts.pory"
	special QuestLog_CutRecording
# 20 "data/maps/Route12/scripts.pory"
	msgbox Text_WantToUsePokeFlute, MSGBOX_YESNO
# 21 "data/maps/Route12/scripts.pory"
	goto_if_eq VAR_RESULT, NO, Route12_EventScript_DontUsePokeFlute
# 22 "data/maps/Route12/scripts.pory"
	call EventScript_AwakenSnorlax
# 23 "data/maps/Route12/scripts.pory"
	setwildbattle SPECIES_SNORLAX, 30
# 24 "data/maps/Route12/scripts.pory"
	waitse
# 25 "data/maps/Route12/scripts.pory"
	playmoncry SPECIES_SNORLAX, CRY_MODE_ENCOUNTER
# 26 "data/maps/Route12/scripts.pory"
	delay 40
# 27 "data/maps/Route12/scripts.pory"
	waitmoncry
# 28 "data/maps/Route12/scripts.pory"
	setflag FLAG_HIDE_ROUTE_12_SNORLAX
# 29 "data/maps/Route12/scripts.pory"
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 30 "data/maps/Route12/scripts.pory"
	setflag FLAG_WOKE_UP_ROUTE_12_SNORLAX
# 31 "data/maps/Route12/scripts.pory"
	dowildbattle
# 32 "data/maps/Route12/scripts.pory"
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
# 33 "data/maps/Route12/scripts.pory"
	specialvar VAR_RESULT, GetBattleOutcome
# 34 "data/maps/Route12/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_WON, Route12_EventScript_FoughtSnorlax
# 35 "data/maps/Route12/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_RAN, Route12_EventScript_FoughtSnorlax
# 36 "data/maps/Route12/scripts.pory"
	goto_if_eq VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED, Route12_EventScript_FoughtSnorlax
# 37 "data/maps/Route12/scripts.pory"
	release
# 38 "data/maps/Route12/scripts.pory"
	end
# 39 "data/maps/Route12/scripts.pory"

# 40 "data/maps/Route12/scripts.pory"
Route12_EventScript_DontUsePokeFlute::
# 41 "data/maps/Route12/scripts.pory"
	release
# 42 "data/maps/Route12/scripts.pory"
	end
# 43 "data/maps/Route12/scripts.pory"

# 44 "data/maps/Route12/scripts.pory"
Route12_EventScript_FoughtSnorlax::
# 45 "data/maps/Route12/scripts.pory"
	msgbox Text_SnorlaxReturnedToMountains
# 46 "data/maps/Route12/scripts.pory"
	release
# 47 "data/maps/Route12/scripts.pory"
	end
# 48 "data/maps/Route12/scripts.pory"

# 49 "data/maps/Route12/scripts.pory"
Route12_EventScript_SnorlaxNoPokeFlute::
# 50 "data/maps/Route12/scripts.pory"
	msgbox Route12_Text_MonSprawledOutInSlumber
# 51 "data/maps/Route12/scripts.pory"
	release
# 52 "data/maps/Route12/scripts.pory"
	end
# 53 "data/maps/Route12/scripts.pory"

# 54 "data/maps/Route12/scripts.pory"
Route12_EventScript_RouteSign::
# 55 "data/maps/Route12/scripts.pory"
	msgbox Route12_Text_RouteSign, MSGBOX_SIGN
# 56 "data/maps/Route12/scripts.pory"
	end
# 57 "data/maps/Route12/scripts.pory"

# 58 "data/maps/Route12/scripts.pory"
Route12_EventScript_FishingSign::
# 59 "data/maps/Route12/scripts.pory"
	msgbox Route12_Text_SportfishingArea, MSGBOX_SIGN
# 60 "data/maps/Route12/scripts.pory"
	end
