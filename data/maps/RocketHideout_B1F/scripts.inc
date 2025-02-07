# 1 "data/maps/RocketHideout_B1F/scripts.pory"

# 2 "data/maps/RocketHideout_B1F/scripts.pory"
RocketHideout_B1F_MapScripts::
# 3 "data/maps/RocketHideout_B1F/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, RocketHideout_B1F_OnLoad
# 4 "data/maps/RocketHideout_B1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, RocketHideout_B1F_OnTransition
# 5 "data/maps/RocketHideout_B1F/scripts.pory"
	.byte 0
# 6 "data/maps/RocketHideout_B1F/scripts.pory"

# 7 "data/maps/RocketHideout_B1F/scripts.pory"
RocketHideout_B1F_OnLoad::
# 8 "data/maps/RocketHideout_B1F/scripts.pory"
	call_if_not_defeated TRAINER_TEAM_ROCKET_GRUNT_12 RocketHideout_B1F_EventScript_SetBarrier
# 9 "data/maps/RocketHideout_B1F/scripts.pory"
	end
# 10 "data/maps/RocketHideout_B1F/scripts.pory"

# 11 "data/maps/RocketHideout_B1F/scripts.pory"
RocketHideout_B1F_OnTransition::
# 12 "data/maps/RocketHideout_B1F/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_ROCKET_HIDEOUT_B1F
# 13 "data/maps/RocketHideout_B1F/scripts.pory"
	end
# 14 "data/maps/RocketHideout_B1F/scripts.pory"

# 15 "data/maps/RocketHideout_B1F/scripts.pory"
RocketHideout_B1F_EventScript_Grunt1::
# 16 "data/maps/RocketHideout_B1F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_8, RocketHideout_B1F_Text_Grunt1Intro, RocketHideout_B1F_Text_Grunt1Defeat
# 17 "data/maps/RocketHideout_B1F/scripts.pory"
	msgbox RocketHideout_B1F_Text_Grunt1PostBattle, MSGBOX_AUTOCLOSE
# 18 "data/maps/RocketHideout_B1F/scripts.pory"
	end
# 19 "data/maps/RocketHideout_B1F/scripts.pory"

# 20 "data/maps/RocketHideout_B1F/scripts.pory"
RocketHideout_B1F_EventScript_Grunt2::
# 21 "data/maps/RocketHideout_B1F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_9, RocketHideout_B1F_Text_Grunt2Intro, RocketHideout_B1F_Text_Grunt2Defeat
# 22 "data/maps/RocketHideout_B1F/scripts.pory"
	msgbox RocketHideout_B1F_Text_Grunt2PostBattle, MSGBOX_AUTOCLOSE
# 23 "data/maps/RocketHideout_B1F/scripts.pory"
	end
# 24 "data/maps/RocketHideout_B1F/scripts.pory"

# 25 "data/maps/RocketHideout_B1F/scripts.pory"
RocketHideout_B1F_EventScript_Grunt3::
# 26 "data/maps/RocketHideout_B1F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_10, RocketHideout_B1F_Text_Grunt3Intro, RocketHideout_B1F_Text_Grunt3Defeat
# 27 "data/maps/RocketHideout_B1F/scripts.pory"
	msgbox RocketHideout_B1F_Text_Grunt3PostBattle, MSGBOX_AUTOCLOSE
# 28 "data/maps/RocketHideout_B1F/scripts.pory"
	end
# 29 "data/maps/RocketHideout_B1F/scripts.pory"

# 30 "data/maps/RocketHideout_B1F/scripts.pory"
RocketHideout_B1F_EventScript_Grunt4::
# 31 "data/maps/RocketHideout_B1F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_11, RocketHideout_B1F_Text_Grunt4Intro, RocketHideout_B1F_Text_Grunt4Defeat
# 32 "data/maps/RocketHideout_B1F/scripts.pory"
	msgbox RocketHideout_B1F_Text_Grunt4PostBattle, MSGBOX_AUTOCLOSE
# 33 "data/maps/RocketHideout_B1F/scripts.pory"
	end
# 34 "data/maps/RocketHideout_B1F/scripts.pory"

# 35 "data/maps/RocketHideout_B1F/scripts.pory"
RocketHideout_B1F_EventScript_Grunt5::
# 36 "data/maps/RocketHideout_B1F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_12, RocketHideout_B1F_Text_Grunt5Intro, RocketHideout_B1F_Text_Grunt5Defeat, RocketHideout_B1F_EventScript_DefeatedGrunt5
# 37 "data/maps/RocketHideout_B1F/scripts.pory"
	msgbox RocketHideout_B1F_Text_Grunt5PostBattle, MSGBOX_AUTOCLOSE
# 38 "data/maps/RocketHideout_B1F/scripts.pory"
	end
# 39 "data/maps/RocketHideout_B1F/scripts.pory"

# 40 "data/maps/RocketHideout_B1F/scripts.pory"
RocketHideout_B1F_EventScript_DefeatedGrunt5::
# 41 "data/maps/RocketHideout_B1F/scripts.pory"
	call RocketHideout_B1F_EventScript_RemoveBarrier
# 42 "data/maps/RocketHideout_B1F/scripts.pory"
	playse SE_UNLOCK
# 43 "data/maps/RocketHideout_B1F/scripts.pory"
	special DrawWholeMapView
# 44 "data/maps/RocketHideout_B1F/scripts.pory"
	waitse
# 45 "data/maps/RocketHideout_B1F/scripts.pory"
	release
# 46 "data/maps/RocketHideout_B1F/scripts.pory"
	end
# 47 "data/maps/RocketHideout_B1F/scripts.pory"

# 48 "data/maps/RocketHideout_B1F/scripts.pory"
RocketHideout_B1F_EventScript_SetBarrier::
# 49 "data/maps/RocketHideout_B1F/scripts.pory"
	setmetatile 20, 19, METATILE_SilphCo_HideoutBarrier_TopLeft_Floor, 1
# 50 "data/maps/RocketHideout_B1F/scripts.pory"
	setmetatile 21, 19, METATILE_SilphCo_HideoutBarrier_TopRight_Floor, 1
# 51 "data/maps/RocketHideout_B1F/scripts.pory"
	setmetatile 20, 20, METATILE_SilphCo_HideoutBarrier_BottomLeft, 1
# 52 "data/maps/RocketHideout_B1F/scripts.pory"
	setmetatile 21, 20, METATILE_SilphCo_HideoutBarrier_BottomRight, 1
# 53 "data/maps/RocketHideout_B1F/scripts.pory"
	setmetatile 20, 21, METATILE_SilphCo_HideoutFloor_ShadeFull, 0
# 54 "data/maps/RocketHideout_B1F/scripts.pory"
	setmetatile 21, 21, METATILE_SilphCo_HideoutFloor_ShadeFull, 0
# 55 "data/maps/RocketHideout_B1F/scripts.pory"
	return
# 56 "data/maps/RocketHideout_B1F/scripts.pory"

# 57 "data/maps/RocketHideout_B1F/scripts.pory"
RocketHideout_B1F_EventScript_RemoveBarrier::
# 58 "data/maps/RocketHideout_B1F/scripts.pory"
	setmetatile 20, 19, METATILE_SilphCo_HideoutFloor_ShadeFull, 0
# 59 "data/maps/RocketHideout_B1F/scripts.pory"
	setmetatile 21, 19, METATILE_SilphCo_HideoutFloor, 0
# 60 "data/maps/RocketHideout_B1F/scripts.pory"
	setmetatile 20, 20, METATILE_SilphCo_HideoutFloor_ShadeFull, 0
# 61 "data/maps/RocketHideout_B1F/scripts.pory"
	setmetatile 21, 20, METATILE_SilphCo_HideoutFloor, 0
# 62 "data/maps/RocketHideout_B1F/scripts.pory"
	setmetatile 20, 21, METATILE_SilphCo_HideoutFloor_ShadeFull, 0
# 63 "data/maps/RocketHideout_B1F/scripts.pory"
	setmetatile 21, 21, METATILE_SilphCo_HideoutFloor, 0
# 64 "data/maps/RocketHideout_B1F/scripts.pory"
	return
