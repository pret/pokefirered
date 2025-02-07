# 1 "data/maps/SixIsland_PatternBush/scripts.pory"

# 2 "data/maps/SixIsland_PatternBush/scripts.pory"
SixIsland_PatternBush_MapScripts::
# 3 "data/maps/SixIsland_PatternBush/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, SixIsland_PatternBush_OnTransition
# 4 "data/maps/SixIsland_PatternBush/scripts.pory"
	.byte 0
# 5 "data/maps/SixIsland_PatternBush/scripts.pory"

# 6 "data/maps/SixIsland_PatternBush/scripts.pory"
SixIsland_PatternBush_OnTransition::
# 7 "data/maps/SixIsland_PatternBush/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_SIX_ISLAND_PATTERN_BUSH
# 8 "data/maps/SixIsland_PatternBush/scripts.pory"
	getplayerxy VAR_TEMP_1, VAR_TEMP_2
# 9 "data/maps/SixIsland_PatternBush/scripts.pory"
	call_if_ge VAR_TEMP_1, 50, SixIsland_PatternBush_EventScript_SetEscapeRightExit
# 10 "data/maps/SixIsland_PatternBush/scripts.pory"
	call_if_le VAR_TEMP_1, 49, SixIsland_PatternBush_EventScript_SetEscapeLeftExit
# 11 "data/maps/SixIsland_PatternBush/scripts.pory"
	end
# 12 "data/maps/SixIsland_PatternBush/scripts.pory"

# 13 "data/maps/SixIsland_PatternBush/scripts.pory"
SixIsland_PatternBush_EventScript_SetEscapeRightExit::
# 14 "data/maps/SixIsland_PatternBush/scripts.pory"
	setescapewarp MAP_SIX_ISLAND_GREEN_PATH, 255, 64, 10
# 15 "data/maps/SixIsland_PatternBush/scripts.pory"
	return
# 16 "data/maps/SixIsland_PatternBush/scripts.pory"

# 17 "data/maps/SixIsland_PatternBush/scripts.pory"
SixIsland_PatternBush_EventScript_SetEscapeLeftExit::
# 18 "data/maps/SixIsland_PatternBush/scripts.pory"
	setescapewarp MAP_SIX_ISLAND_GREEN_PATH, 255, 45, 10
# 19 "data/maps/SixIsland_PatternBush/scripts.pory"
	return
# 20 "data/maps/SixIsland_PatternBush/scripts.pory"

# 21 "data/maps/SixIsland_PatternBush/scripts.pory"
SixIsland_PatternBush_EventScript_Bethany::
# 22 "data/maps/SixIsland_PatternBush/scripts.pory"
	trainerbattle_single TRAINER_PKMN_BREEDER_BETHANY, SixIsland_PatternBush_Text_BethanyIntro, SixIsland_PatternBush_Text_BethanyDefeat
# 23 "data/maps/SixIsland_PatternBush/scripts.pory"
	msgbox SixIsland_PatternBush_Text_BethanyPostBattle, MSGBOX_AUTOCLOSE
# 24 "data/maps/SixIsland_PatternBush/scripts.pory"
	end
# 25 "data/maps/SixIsland_PatternBush/scripts.pory"

# 26 "data/maps/SixIsland_PatternBush/scripts.pory"
SixIsland_PatternBush_EventScript_Allison::
# 27 "data/maps/SixIsland_PatternBush/scripts.pory"
	trainerbattle_single TRAINER_PKMN_BREEDER_ALLISON, SixIsland_PatternBush_Text_AllisonIntro, SixIsland_PatternBush_Text_AllisonDefeat
# 28 "data/maps/SixIsland_PatternBush/scripts.pory"
	msgbox SixIsland_PatternBush_Text_AllisonPostBattle, MSGBOX_AUTOCLOSE
# 29 "data/maps/SixIsland_PatternBush/scripts.pory"
	end
# 30 "data/maps/SixIsland_PatternBush/scripts.pory"

# 31 "data/maps/SixIsland_PatternBush/scripts.pory"
SixIsland_PatternBush_EventScript_Garret::
# 32 "data/maps/SixIsland_PatternBush/scripts.pory"
	trainerbattle_single TRAINER_BUG_CATCHER_GARRET, SixIsland_PatternBush_Text_GarretIntro, SixIsland_PatternBush_Text_GarretDefeat
# 33 "data/maps/SixIsland_PatternBush/scripts.pory"
	msgbox SixIsland_PatternBush_Text_GarretPostBattle, MSGBOX_AUTOCLOSE
# 34 "data/maps/SixIsland_PatternBush/scripts.pory"
	end
# 35 "data/maps/SixIsland_PatternBush/scripts.pory"

# 36 "data/maps/SixIsland_PatternBush/scripts.pory"
SixIsland_PatternBush_EventScript_Jonah::
# 37 "data/maps/SixIsland_PatternBush/scripts.pory"
	trainerbattle_single TRAINER_BUG_CATCHER_JONAH, SixIsland_PatternBush_Text_JonahIntro, SixIsland_PatternBush_Text_JonahDefeat
# 38 "data/maps/SixIsland_PatternBush/scripts.pory"
	msgbox SixIsland_PatternBush_Text_JonahPostBattle, MSGBOX_AUTOCLOSE
# 39 "data/maps/SixIsland_PatternBush/scripts.pory"
	end
# 40 "data/maps/SixIsland_PatternBush/scripts.pory"

# 41 "data/maps/SixIsland_PatternBush/scripts.pory"
SixIsland_PatternBush_EventScript_Vance::
# 42 "data/maps/SixIsland_PatternBush/scripts.pory"
	trainerbattle_single TRAINER_BUG_CATCHER_VANCE, SixIsland_PatternBush_Text_VanceIntro, SixIsland_PatternBush_Text_VanceDefeat
# 43 "data/maps/SixIsland_PatternBush/scripts.pory"
	msgbox SixIsland_PatternBush_Text_VancePostBattle, MSGBOX_AUTOCLOSE
# 44 "data/maps/SixIsland_PatternBush/scripts.pory"
	end
# 45 "data/maps/SixIsland_PatternBush/scripts.pory"

# 46 "data/maps/SixIsland_PatternBush/scripts.pory"
SixIsland_PatternBush_EventScript_Nash::
# 47 "data/maps/SixIsland_PatternBush/scripts.pory"
	trainerbattle_single TRAINER_YOUNGSTER_NASH, SixIsland_PatternBush_Text_NashIntro, SixIsland_PatternBush_Text_NashDefeat
# 48 "data/maps/SixIsland_PatternBush/scripts.pory"
	msgbox SixIsland_PatternBush_Text_NashPostBattle, MSGBOX_AUTOCLOSE
# 49 "data/maps/SixIsland_PatternBush/scripts.pory"
	end
# 50 "data/maps/SixIsland_PatternBush/scripts.pory"

# 51 "data/maps/SixIsland_PatternBush/scripts.pory"
SixIsland_PatternBush_EventScript_Cordell::
# 52 "data/maps/SixIsland_PatternBush/scripts.pory"
	trainerbattle_single TRAINER_YOUNGSTER_CORDELL, SixIsland_PatternBush_Text_CordellIntro, SixIsland_PatternBush_Text_CordellDefeat
# 53 "data/maps/SixIsland_PatternBush/scripts.pory"
	msgbox SixIsland_PatternBush_Text_CordellPostBattle, MSGBOX_AUTOCLOSE
# 54 "data/maps/SixIsland_PatternBush/scripts.pory"
	end
# 55 "data/maps/SixIsland_PatternBush/scripts.pory"

# 56 "data/maps/SixIsland_PatternBush/scripts.pory"
SixIsland_PatternBush_EventScript_Dalia::
# 57 "data/maps/SixIsland_PatternBush/scripts.pory"
	trainerbattle_single TRAINER_LASS_DALIA, SixIsland_PatternBush_Text_DaliaIntro, SixIsland_PatternBush_Text_DaliaDefeat
# 58 "data/maps/SixIsland_PatternBush/scripts.pory"
	msgbox SixIsland_PatternBush_Text_DaliaPostBattle, MSGBOX_AUTOCLOSE
# 59 "data/maps/SixIsland_PatternBush/scripts.pory"
	end
# 60 "data/maps/SixIsland_PatternBush/scripts.pory"

# 61 "data/maps/SixIsland_PatternBush/scripts.pory"
SixIsland_PatternBush_EventScript_Joana::
# 62 "data/maps/SixIsland_PatternBush/scripts.pory"
	trainerbattle_single TRAINER_LASS_JOANA, SixIsland_PatternBush_Text_JoanaIntro, SixIsland_PatternBush_Text_JoanaDefeat
# 63 "data/maps/SixIsland_PatternBush/scripts.pory"
	msgbox SixIsland_PatternBush_Text_JoanaPostBattle, MSGBOX_AUTOCLOSE
# 64 "data/maps/SixIsland_PatternBush/scripts.pory"
	end
# 65 "data/maps/SixIsland_PatternBush/scripts.pory"

# 66 "data/maps/SixIsland_PatternBush/scripts.pory"
SixIsland_PatternBush_EventScript_Riley::
# 67 "data/maps/SixIsland_PatternBush/scripts.pory"
	trainerbattle_single TRAINER_CAMPER_RILEY, SixIsland_PatternBush_Text_RileyIntro, SixIsland_PatternBush_Text_RileyDefeat
# 68 "data/maps/SixIsland_PatternBush/scripts.pory"
	msgbox SixIsland_PatternBush_Text_RileyPostBattle, MSGBOX_AUTOCLOSE
# 69 "data/maps/SixIsland_PatternBush/scripts.pory"
	end
# 70 "data/maps/SixIsland_PatternBush/scripts.pory"

# 71 "data/maps/SixIsland_PatternBush/scripts.pory"
SixIsland_PatternBush_EventScript_Marcy::
# 72 "data/maps/SixIsland_PatternBush/scripts.pory"
	trainerbattle_single TRAINER_PICNICKER_MARCY, SixIsland_PatternBush_Text_MarcyIntro, SixIsland_PatternBush_Text_MarcyDefeat
# 73 "data/maps/SixIsland_PatternBush/scripts.pory"
	msgbox SixIsland_PatternBush_Text_MarcyPostBattle, MSGBOX_AUTOCLOSE
# 74 "data/maps/SixIsland_PatternBush/scripts.pory"
	end
# 75 "data/maps/SixIsland_PatternBush/scripts.pory"

# 76 "data/maps/SixIsland_PatternBush/scripts.pory"
SixIsland_PatternBush_EventScript_Layton::
# 77 "data/maps/SixIsland_PatternBush/scripts.pory"
	trainerbattle_single TRAINER_RUIN_MANIAC_LAYTON, SixIsland_PatternBush_Text_LaytonIntro, SixIsland_PatternBush_Text_LaytonDefeat
# 78 "data/maps/SixIsland_PatternBush/scripts.pory"
	msgbox SixIsland_PatternBush_Text_LaytonPostBattle, MSGBOX_AUTOCLOSE
# 79 "data/maps/SixIsland_PatternBush/scripts.pory"
	end
