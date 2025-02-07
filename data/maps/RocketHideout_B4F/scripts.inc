# 1 "data/maps/RocketHideout_B4F/scripts.pory"

# 2 "data/maps/RocketHideout_B4F/scripts.pory"
.equ LOCALID_GIOVANNI,    1
# 3 "data/maps/RocketHideout_B4F/scripts.pory"
.equ LOCALID_SILPH_SCOPE, 2
# 4 "data/maps/RocketHideout_B4F/scripts.pory"
.equ LOCALID_LIFT_KEY,    4
# 5 "data/maps/RocketHideout_B4F/scripts.pory"

# 6 "data/maps/RocketHideout_B4F/scripts.pory"
.equ NUM_DOOR_GRUNTS_DEFEATED, VAR_TEMP_1
# 7 "data/maps/RocketHideout_B4F/scripts.pory"

# 8 "data/maps/RocketHideout_B4F/scripts.pory"
RocketHideout_B4F_MapScripts::
# 9 "data/maps/RocketHideout_B4F/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, RocketHideout_B4F_OnLoad
# 10 "data/maps/RocketHideout_B4F/scripts.pory"
	.byte 0
# 11 "data/maps/RocketHideout_B4F/scripts.pory"

# 12 "data/maps/RocketHideout_B4F/scripts.pory"
RocketHideout_B4F_OnLoad::
# 13 "data/maps/RocketHideout_B4F/scripts.pory"
	setvar NUM_DOOR_GRUNTS_DEFEATED, 0
# 14 "data/maps/RocketHideout_B4F/scripts.pory"
	call_if_defeated TRAINER_TEAM_ROCKET_GRUNT_16, RocketHideout_B4F_EventScript_CountGruntDefeated
# 15 "data/maps/RocketHideout_B4F/scripts.pory"
	call_if_defeated TRAINER_TEAM_ROCKET_GRUNT_17, RocketHideout_B4F_EventScript_CountGruntDefeated
# 16 "data/maps/RocketHideout_B4F/scripts.pory"
	call_if_ne NUM_DOOR_GRUNTS_DEFEATED, 2, RocketHideout_B4F_EventScript_SetBarrier
# 17 "data/maps/RocketHideout_B4F/scripts.pory"
	end
# 18 "data/maps/RocketHideout_B4F/scripts.pory"

# 19 "data/maps/RocketHideout_B4F/scripts.pory"
RocketHideout_B4F_EventScript_CountGruntDefeated::
# 20 "data/maps/RocketHideout_B4F/scripts.pory"
	addvar NUM_DOOR_GRUNTS_DEFEATED, 1
# 21 "data/maps/RocketHideout_B4F/scripts.pory"
	return
# 22 "data/maps/RocketHideout_B4F/scripts.pory"

# 23 "data/maps/RocketHideout_B4F/scripts.pory"
RocketHideout_B4F_EventScript_Giovanni::
# 24 "data/maps/RocketHideout_B4F/scripts.pory"
	lock
# 25 "data/maps/RocketHideout_B4F/scripts.pory"
	faceplayer
# 26 "data/maps/RocketHideout_B4F/scripts.pory"
	famechecker FAMECHECKER_GIOVANNI, 0
# 27 "data/maps/RocketHideout_B4F/scripts.pory"
	message RocketHideout_B4F_Text_GiovanniIntro
# 28 "data/maps/RocketHideout_B4F/scripts.pory"
	waitmessage
# 29 "data/maps/RocketHideout_B4F/scripts.pory"
	playbgm MUS_ENCOUNTER_ROCKET, 0
# 30 "data/maps/RocketHideout_B4F/scripts.pory"
	waitbuttonpress
# 31 "data/maps/RocketHideout_B4F/scripts.pory"
	trainerbattle_no_intro TRAINER_BOSS_GIOVANNI, RocketHideout_B4F_Text_GiovanniDefeat
# 32 "data/maps/RocketHideout_B4F/scripts.pory"
	msgbox RocketHideout_B4F_Text_GiovanniPostBattle
# 33 "data/maps/RocketHideout_B4F/scripts.pory"
	fadescreen FADE_TO_BLACK
# 34 "data/maps/RocketHideout_B4F/scripts.pory"
	closemessage
# 35 "data/maps/RocketHideout_B4F/scripts.pory"
	removeobject LOCALID_GIOVANNI
# 36 "data/maps/RocketHideout_B4F/scripts.pory"
	addobject LOCALID_SILPH_SCOPE
# 37 "data/maps/RocketHideout_B4F/scripts.pory"
	clearflag FLAG_HIDE_SILPH_SCOPE
# 38 "data/maps/RocketHideout_B4F/scripts.pory"
	setflag FLAG_HIDE_CELADON_ROCKETS
# 39 "data/maps/RocketHideout_B4F/scripts.pory"
	famechecker FAMECHECKER_GIOVANNI, FCPICKSTATE_COLORED, UpdatePickStateFromSpecialVar8005
# 40 "data/maps/RocketHideout_B4F/scripts.pory"
	fadescreen FADE_FROM_BLACK
# 41 "data/maps/RocketHideout_B4F/scripts.pory"
	release
# 42 "data/maps/RocketHideout_B4F/scripts.pory"
	end
# 43 "data/maps/RocketHideout_B4F/scripts.pory"

# 44 "data/maps/RocketHideout_B4F/scripts.pory"
RocketHideout_B4F_EventScript_SilphScope::
# 45 "data/maps/RocketHideout_B4F/scripts.pory"
	lock
# 46 "data/maps/RocketHideout_B4F/scripts.pory"
	faceplayer
# 47 "data/maps/RocketHideout_B4F/scripts.pory"
	removeobject LOCALID_SILPH_SCOPE
# 48 "data/maps/RocketHideout_B4F/scripts.pory"
	giveitem ITEM_SILPH_SCOPE
# 49 "data/maps/RocketHideout_B4F/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, EventScript_BagIsFull
# 50 "data/maps/RocketHideout_B4F/scripts.pory"
	release
# 51 "data/maps/RocketHideout_B4F/scripts.pory"
	end
# 52 "data/maps/RocketHideout_B4F/scripts.pory"

# 53 "data/maps/RocketHideout_B4F/scripts.pory"
RocketHideout_B4F_EventScript_Grunt1::
# 54 "data/maps/RocketHideout_B4F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_18, RocketHideout_B4F_Text_Grunt1Intro, RocketHideout_B4F_Text_Grunt1Defeat, RocketHideout_B4F_EventScript_DefeatedGrunt1
# 55 "data/maps/RocketHideout_B4F/scripts.pory"
	msgbox RocketHideout_B4F_Text_Grunt1PostBattle
# 56 "data/maps/RocketHideout_B4F/scripts.pory"
	release
# 57 "data/maps/RocketHideout_B4F/scripts.pory"
	end
# 58 "data/maps/RocketHideout_B4F/scripts.pory"

# 59 "data/maps/RocketHideout_B4F/scripts.pory"
RocketHideout_B4F_EventScript_DefeatedGrunt1::
# 60 "data/maps/RocketHideout_B4F/scripts.pory"
	msgbox RocketHideout_B4F_Text_Grunt1PostBattle
# 61 "data/maps/RocketHideout_B4F/scripts.pory"
	addobject LOCALID_LIFT_KEY
# 62 "data/maps/RocketHideout_B4F/scripts.pory"
	clearflag FLAG_HIDE_LIFT_KEY
# 63 "data/maps/RocketHideout_B4F/scripts.pory"
	release
# 64 "data/maps/RocketHideout_B4F/scripts.pory"
	end
# 65 "data/maps/RocketHideout_B4F/scripts.pory"

# 66 "data/maps/RocketHideout_B4F/scripts.pory"
RocketHideout_B4F_EventScript_LiftKey::
# 67 "data/maps/RocketHideout_B4F/scripts.pory"
	lock
# 68 "data/maps/RocketHideout_B4F/scripts.pory"
	faceplayer
# 69 "data/maps/RocketHideout_B4F/scripts.pory"
	setflag FLAG_CAN_USE_ROCKET_HIDEOUT_LIFT
# 70 "data/maps/RocketHideout_B4F/scripts.pory"
	removeobject LOCALID_LIFT_KEY
# 71 "data/maps/RocketHideout_B4F/scripts.pory"
	giveitem ITEM_LIFT_KEY
# 72 "data/maps/RocketHideout_B4F/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, EventScript_BagIsFull
# 73 "data/maps/RocketHideout_B4F/scripts.pory"
	release
# 74 "data/maps/RocketHideout_B4F/scripts.pory"
	end
# 75 "data/maps/RocketHideout_B4F/scripts.pory"

# 76 "data/maps/RocketHideout_B4F/scripts.pory"
RocketHideout_B4F_EventScript_Grunt2::
# 77 "data/maps/RocketHideout_B4F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_16, RocketHideout_B4F_Text_Grunt2Intro, RocketHideout_B4F_Text_Grunt2Defeat, RocketHideout_B4F_EventScript_DefeatedGrunt2
# 78 "data/maps/RocketHideout_B4F/scripts.pory"
	msgbox RocketHideout_B4F_Text_Grunt2PostBattle, MSGBOX_AUTOCLOSE
# 79 "data/maps/RocketHideout_B4F/scripts.pory"
	end
# 80 "data/maps/RocketHideout_B4F/scripts.pory"

# 81 "data/maps/RocketHideout_B4F/scripts.pory"
RocketHideout_B4F_EventScript_DefeatedGrunt2::
# 82 "data/maps/RocketHideout_B4F/scripts.pory"
	setvar NUM_DOOR_GRUNTS_DEFEATED, 0
# 83 "data/maps/RocketHideout_B4F/scripts.pory"
	call_if_defeated TRAINER_TEAM_ROCKET_GRUNT_16, RocketHideout_B4F_EventScript_CountGruntDefeated
# 84 "data/maps/RocketHideout_B4F/scripts.pory"
	call_if_defeated TRAINER_TEAM_ROCKET_GRUNT_17, RocketHideout_B4F_EventScript_CountGruntDefeated
# 85 "data/maps/RocketHideout_B4F/scripts.pory"
	call_if_eq NUM_DOOR_GRUNTS_DEFEATED, 2, RocketHideout_B4F_EventScript_RemoveBarrier
# 86 "data/maps/RocketHideout_B4F/scripts.pory"
	call_if_eq NUM_DOOR_GRUNTS_DEFEATED, 2, RocketHideout_B4F_EventScript_DrawMapForBarrierRemoval
# 87 "data/maps/RocketHideout_B4F/scripts.pory"
	release
# 88 "data/maps/RocketHideout_B4F/scripts.pory"
	end
# 89 "data/maps/RocketHideout_B4F/scripts.pory"

# 90 "data/maps/RocketHideout_B4F/scripts.pory"
RocketHideout_B4F_EventScript_Grunt3::
# 91 "data/maps/RocketHideout_B4F/scripts.pory"
	trainerbattle_single TRAINER_TEAM_ROCKET_GRUNT_17, RocketHideout_B4F_Text_Grunt3Intro, RocketHideout_B4F_Text_Grunt3Defeat, RocketHideout_B4F_EventScript_DefeatedGrunt3
# 92 "data/maps/RocketHideout_B4F/scripts.pory"
	msgbox RocketHideout_B4F_Text_Grunt3PostBattle, MSGBOX_AUTOCLOSE
# 93 "data/maps/RocketHideout_B4F/scripts.pory"
	end
# 94 "data/maps/RocketHideout_B4F/scripts.pory"

# 95 "data/maps/RocketHideout_B4F/scripts.pory"
RocketHideout_B4F_EventScript_DefeatedGrunt3::
# 96 "data/maps/RocketHideout_B4F/scripts.pory"
	setvar NUM_DOOR_GRUNTS_DEFEATED, 0
# 97 "data/maps/RocketHideout_B4F/scripts.pory"
	call_if_defeated TRAINER_TEAM_ROCKET_GRUNT_16, RocketHideout_B4F_EventScript_CountGruntDefeated
# 98 "data/maps/RocketHideout_B4F/scripts.pory"
	call_if_defeated TRAINER_TEAM_ROCKET_GRUNT_17, RocketHideout_B4F_EventScript_CountGruntDefeated
# 99 "data/maps/RocketHideout_B4F/scripts.pory"
	call_if_eq NUM_DOOR_GRUNTS_DEFEATED, 2, RocketHideout_B4F_EventScript_RemoveBarrier
# 100 "data/maps/RocketHideout_B4F/scripts.pory"
	call_if_eq NUM_DOOR_GRUNTS_DEFEATED, 2, RocketHideout_B4F_EventScript_DrawMapForBarrierRemoval
# 101 "data/maps/RocketHideout_B4F/scripts.pory"
	release
# 102 "data/maps/RocketHideout_B4F/scripts.pory"
	end
# 103 "data/maps/RocketHideout_B4F/scripts.pory"

# 104 "data/maps/RocketHideout_B4F/scripts.pory"
RocketHideout_B4F_EventScript_DrawMapForBarrierRemoval::
# 105 "data/maps/RocketHideout_B4F/scripts.pory"
	playse SE_UNLOCK
# 106 "data/maps/RocketHideout_B4F/scripts.pory"
	special DrawWholeMapView
# 107 "data/maps/RocketHideout_B4F/scripts.pory"
	waitse
# 108 "data/maps/RocketHideout_B4F/scripts.pory"
	return
# 109 "data/maps/RocketHideout_B4F/scripts.pory"

# 110 "data/maps/RocketHideout_B4F/scripts.pory"
RocketHideout_B4F_EventScript_SetBarrier::
# 111 "data/maps/RocketHideout_B4F/scripts.pory"
	setmetatile 17, 12, METATILE_SilphCo_HideoutBarrier_TopLeft_Floor, 1
# 112 "data/maps/RocketHideout_B4F/scripts.pory"
	setmetatile 18, 12, METATILE_SilphCo_HideoutBarrier_TopRight_Floor, 1
# 113 "data/maps/RocketHideout_B4F/scripts.pory"
	setmetatile 17, 13, METATILE_SilphCo_HideoutBarrier_BottomLeft, 1
# 114 "data/maps/RocketHideout_B4F/scripts.pory"
	setmetatile 18, 13, METATILE_SilphCo_HideoutBarrier_BottomRight, 1
# 115 "data/maps/RocketHideout_B4F/scripts.pory"
	setmetatile 17, 14, METATILE_SilphCo_HideoutFloor_ShadeFull, 0
# 116 "data/maps/RocketHideout_B4F/scripts.pory"
	setmetatile 18, 14, METATILE_SilphCo_HideoutFloor_ShadeFull, 0
# 117 "data/maps/RocketHideout_B4F/scripts.pory"
	return
# 118 "data/maps/RocketHideout_B4F/scripts.pory"

# 119 "data/maps/RocketHideout_B4F/scripts.pory"
RocketHideout_B4F_EventScript_RemoveBarrier::
# 120 "data/maps/RocketHideout_B4F/scripts.pory"
	setmetatile 17, 12, METATILE_SilphCo_HideoutFloor_ShadeFull, 0
# 121 "data/maps/RocketHideout_B4F/scripts.pory"
	setmetatile 18, 12, METATILE_SilphCo_HideoutFloor, 0
# 122 "data/maps/RocketHideout_B4F/scripts.pory"
	setmetatile 17, 13, METATILE_SilphCo_HideoutFloor_ShadeFull, 0
# 123 "data/maps/RocketHideout_B4F/scripts.pory"
	setmetatile 18, 13, METATILE_SilphCo_HideoutFloor, 0
# 124 "data/maps/RocketHideout_B4F/scripts.pory"
	setmetatile 17, 14, METATILE_SilphCo_HideoutFloor_ShadeFull, 0
# 125 "data/maps/RocketHideout_B4F/scripts.pory"
	setmetatile 18, 14, METATILE_SilphCo_HideoutFloor, 0
# 126 "data/maps/RocketHideout_B4F/scripts.pory"
	return
