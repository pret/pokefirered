# 1 "data/maps/MtEmber_Exterior/scripts.pory"

# 2 "data/maps/MtEmber_Exterior/scripts.pory"
.set LOCALID_GRUNT1, 2
# 3 "data/maps/MtEmber_Exterior/scripts.pory"
.set LOCALID_GRUNT2, 3
# 4 "data/maps/MtEmber_Exterior/scripts.pory"

# 5 "data/maps/MtEmber_Exterior/scripts.pory"
MtEmber_Exterior_MapScripts::
# 6 "data/maps/MtEmber_Exterior/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, MtEmber_Exterior_OnTransition
# 7 "data/maps/MtEmber_Exterior/scripts.pory"
	map_script MAP_SCRIPT_ON_LOAD, MtEmber_Exterior_OnLoad
# 8 "data/maps/MtEmber_Exterior/scripts.pory"
	.byte 0
# 9 "data/maps/MtEmber_Exterior/scripts.pory"

# 10 "data/maps/MtEmber_Exterior/scripts.pory"
MtEmber_Exterior_OnTransition::
# 11 "data/maps/MtEmber_Exterior/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_MT_EMBER_EXTERIOR
# 12 "data/maps/MtEmber_Exterior/scripts.pory"
	call_if_eq VAR_MAP_SCENE_MT_EMBER_EXTERIOR, 2, MtEmber_Exterior_EventScript_RocketsFaceDown
# 13 "data/maps/MtEmber_Exterior/scripts.pory"
	end
# 14 "data/maps/MtEmber_Exterior/scripts.pory"

# 15 "data/maps/MtEmber_Exterior/scripts.pory"
MtEmber_Exterior_EventScript_RocketsFaceDown::
# 16 "data/maps/MtEmber_Exterior/scripts.pory"
	setobjectmovementtype LOCALID_GRUNT1, MOVEMENT_TYPE_FACE_DOWN
# 17 "data/maps/MtEmber_Exterior/scripts.pory"
	setobjectmovementtype LOCALID_GRUNT2, MOVEMENT_TYPE_FACE_DOWN
# 18 "data/maps/MtEmber_Exterior/scripts.pory"
	return
# 19 "data/maps/MtEmber_Exterior/scripts.pory"

# 20 "data/maps/MtEmber_Exterior/scripts.pory"
MtEmber_Exterior_OnLoad::
# 21 "data/maps/MtEmber_Exterior/scripts.pory"
	call_if_ge VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 4, MtEmber_Exterior_EventScript_OpenCave
# 22 "data/maps/MtEmber_Exterior/scripts.pory"
	end
# 23 "data/maps/MtEmber_Exterior/scripts.pory"

# 24 "data/maps/MtEmber_Exterior/scripts.pory"
MtEmber_Exterior_EventScript_OpenCave::
# 25 "data/maps/MtEmber_Exterior/scripts.pory"
	setmetatile 42, 39, METATILE_MtEmber_CaveEntrance, 0
# 26 "data/maps/MtEmber_Exterior/scripts.pory"
	return
# 27 "data/maps/MtEmber_Exterior/scripts.pory"

# 28 "data/maps/MtEmber_Exterior/scripts.pory"
MtEmber_Exterior_EventScript_Grunt1::
# 29 "data/maps/MtEmber_Exterior/scripts.pory"
	lock
# 30 "data/maps/MtEmber_Exterior/scripts.pory"
	goto_if_defeated TRAINER_TEAM_ROCKET_GRUNT_43, MtEmber_Exterior_EventScript_Grunt1Defeated
# 31 "data/maps/MtEmber_Exterior/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 4, MtEmber_Exterior_EventScript_BattleGrunt1
# 32 "data/maps/MtEmber_Exterior/scripts.pory"
	msgbox MtEmber_Exterior_Text_WellTryDiggingHere
# 33 "data/maps/MtEmber_Exterior/scripts.pory"
	release
# 34 "data/maps/MtEmber_Exterior/scripts.pory"
	end
# 35 "data/maps/MtEmber_Exterior/scripts.pory"

# 36 "data/maps/MtEmber_Exterior/scripts.pory"
MtEmber_Exterior_EventScript_Grunt1Defeated::
# 37 "data/maps/MtEmber_Exterior/scripts.pory"
	msgbox MtEmber_Exterior_Text_Grunt1PostBattle
# 38 "data/maps/MtEmber_Exterior/scripts.pory"
	release
# 39 "data/maps/MtEmber_Exterior/scripts.pory"
	end
# 40 "data/maps/MtEmber_Exterior/scripts.pory"

# 41 "data/maps/MtEmber_Exterior/scripts.pory"
MtEmber_Exterior_EventScript_BattleGrunt1::
# 42 "data/maps/MtEmber_Exterior/scripts.pory"
	applymovement LOCALID_GRUNT1, Common_Movement_FacePlayer
# 43 "data/maps/MtEmber_Exterior/scripts.pory"
	waitmovement 0
# 44 "data/maps/MtEmber_Exterior/scripts.pory"
	playbgm MUS_ENCOUNTER_ROCKET, 0
# 45 "data/maps/MtEmber_Exterior/scripts.pory"
	msgbox MtEmber_Exterior_Text_Grunt1Intro
# 46 "data/maps/MtEmber_Exterior/scripts.pory"
	trainerbattle_no_intro TRAINER_TEAM_ROCKET_GRUNT_43, MtEmber_Exterior_Text_Grunt1Defeat
# 47 "data/maps/MtEmber_Exterior/scripts.pory"
	msgbox MtEmber_Exterior_Text_Grunt1PostBattle
# 48 "data/maps/MtEmber_Exterior/scripts.pory"
	goto_if_defeated TRAINER_TEAM_ROCKET_GRUNT_44, MtEmber_Exterior_EventScript_DefeatedBothGrunts
# 49 "data/maps/MtEmber_Exterior/scripts.pory"
	release
# 50 "data/maps/MtEmber_Exterior/scripts.pory"
	end
# 51 "data/maps/MtEmber_Exterior/scripts.pory"

# 52 "data/maps/MtEmber_Exterior/scripts.pory"
MtEmber_Exterior_EventScript_DefeatedBothGrunts::
# 53 "data/maps/MtEmber_Exterior/scripts.pory"
	msgbox MtEmber_Exterior_Text_WellRegroupDontStepInsideThere
# 54 "data/maps/MtEmber_Exterior/scripts.pory"
	closemessage
# 55 "data/maps/MtEmber_Exterior/scripts.pory"
	fadescreen FADE_TO_BLACK
# 56 "data/maps/MtEmber_Exterior/scripts.pory"
	removeobject LOCALID_GRUNT1
# 57 "data/maps/MtEmber_Exterior/scripts.pory"
	removeobject LOCALID_GRUNT2
# 58 "data/maps/MtEmber_Exterior/scripts.pory"
	fadescreen FADE_FROM_BLACK
# 59 "data/maps/MtEmber_Exterior/scripts.pory"
	release
# 60 "data/maps/MtEmber_Exterior/scripts.pory"
	end
# 61 "data/maps/MtEmber_Exterior/scripts.pory"

# 62 "data/maps/MtEmber_Exterior/scripts.pory"
MtEmber_Exterior_EventScript_Grunt2::
# 63 "data/maps/MtEmber_Exterior/scripts.pory"
	lock
# 64 "data/maps/MtEmber_Exterior/scripts.pory"
	faceplayer
# 65 "data/maps/MtEmber_Exterior/scripts.pory"
	goto_if_defeated TRAINER_TEAM_ROCKET_GRUNT_44, MtEmber_Exterior_EventScript_DefeatedGrunt2
# 66 "data/maps/MtEmber_Exterior/scripts.pory"
	goto_if_eq VAR_MAP_SCENE_ONE_ISLAND_POKEMON_CENTER_1F, 4, MtEmber_Exterior_EventScript_BattleGrunt2
# 67 "data/maps/MtEmber_Exterior/scripts.pory"
	msgbox MtEmber_Exterior_Text_YoureInTheWayGetLost
# 68 "data/maps/MtEmber_Exterior/scripts.pory"
	closemessage
# 69 "data/maps/MtEmber_Exterior/scripts.pory"
	applymovement LOCALID_GRUNT2, Common_Movement_FaceOriginalDirection
# 70 "data/maps/MtEmber_Exterior/scripts.pory"
	waitmovement 0
# 71 "data/maps/MtEmber_Exterior/scripts.pory"
	release
# 72 "data/maps/MtEmber_Exterior/scripts.pory"
	end
# 73 "data/maps/MtEmber_Exterior/scripts.pory"

# 74 "data/maps/MtEmber_Exterior/scripts.pory"
MtEmber_Exterior_EventScript_DefeatedGrunt2::
# 75 "data/maps/MtEmber_Exterior/scripts.pory"
	msgbox MtEmber_Exterior_Text_Grunt2PostBattle
# 76 "data/maps/MtEmber_Exterior/scripts.pory"
	release
# 77 "data/maps/MtEmber_Exterior/scripts.pory"
	end
# 78 "data/maps/MtEmber_Exterior/scripts.pory"

# 79 "data/maps/MtEmber_Exterior/scripts.pory"
MtEmber_Exterior_EventScript_BattleGrunt2::
# 80 "data/maps/MtEmber_Exterior/scripts.pory"
	playbgm MUS_ENCOUNTER_ROCKET, 0
# 81 "data/maps/MtEmber_Exterior/scripts.pory"
	msgbox MtEmber_Exterior_Text_Grunt2Intro
# 82 "data/maps/MtEmber_Exterior/scripts.pory"
	trainerbattle_no_intro TRAINER_TEAM_ROCKET_GRUNT_44, MtEmber_Exterior_Text_Grunt2Defeat
# 83 "data/maps/MtEmber_Exterior/scripts.pory"
	msgbox MtEmber_Exterior_Text_Grunt2PostBattle
# 84 "data/maps/MtEmber_Exterior/scripts.pory"
	goto_if_defeated TRAINER_TEAM_ROCKET_GRUNT_43, MtEmber_Exterior_EventScript_DefeatedBothGrunts
# 85 "data/maps/MtEmber_Exterior/scripts.pory"
	release
# 86 "data/maps/MtEmber_Exterior/scripts.pory"
	end
# 87 "data/maps/MtEmber_Exterior/scripts.pory"

# 88 "data/maps/MtEmber_Exterior/scripts.pory"
MtEmber_Exterior_EventScript_RocketPasswordScene::
# 89 "data/maps/MtEmber_Exterior/scripts.pory"
	lockall
# 90 "data/maps/MtEmber_Exterior/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 91 "data/maps/MtEmber_Exterior/scripts.pory"
	msgbox MtEmber_Exterior_Text_PunchedThroughAtLast
# 92 "data/maps/MtEmber_Exterior/scripts.pory"
	message MtEmber_Exterior_Text_WhatsPasswordAgain
# 93 "data/maps/MtEmber_Exterior/scripts.pory"
	waitmessage
# 94 "data/maps/MtEmber_Exterior/scripts.pory"
	playse SE_PIN
# 95 "data/maps/MtEmber_Exterior/scripts.pory"
	applymovement LOCALID_GRUNT2, Common_Movement_QuestionMark
# 96 "data/maps/MtEmber_Exterior/scripts.pory"
	waitmovement 0
# 97 "data/maps/MtEmber_Exterior/scripts.pory"
	waitbuttonpress
# 98 "data/maps/MtEmber_Exterior/scripts.pory"
	msgbox MtEmber_Exterior_Text_FirstPasswordGoldeen
# 99 "data/maps/MtEmber_Exterior/scripts.pory"
	applymovement LOCALID_GRUNT1, Common_Movement_WalkInPlaceFasterDown
# 100 "data/maps/MtEmber_Exterior/scripts.pory"
	waitmovement 0
# 101 "data/maps/MtEmber_Exterior/scripts.pory"
	playse SE_PIN
# 102 "data/maps/MtEmber_Exterior/scripts.pory"
	applymovement LOCALID_GRUNT1, Common_Movement_ExclamationMark
# 103 "data/maps/MtEmber_Exterior/scripts.pory"
	waitmovement 0
# 104 "data/maps/MtEmber_Exterior/scripts.pory"
	applymovement LOCALID_GRUNT1, Common_Movement_Delay48
# 105 "data/maps/MtEmber_Exterior/scripts.pory"
	waitmovement 0
# 106 "data/maps/MtEmber_Exterior/scripts.pory"
	applymovement LOCALID_GRUNT2, Common_Movement_WalkInPlaceFasterDown
# 107 "data/maps/MtEmber_Exterior/scripts.pory"
	waitmovement 0
# 108 "data/maps/MtEmber_Exterior/scripts.pory"
	call MtEmber_Exterior_EventScript_RocketsFaceDown
# 109 "data/maps/MtEmber_Exterior/scripts.pory"
	msgbox MtEmber_Exterior_Text_SnoopsBeenListeningIn
# 110 "data/maps/MtEmber_Exterior/scripts.pory"
	setvar VAR_MAP_SCENE_MT_EMBER_EXTERIOR, 2
# 111 "data/maps/MtEmber_Exterior/scripts.pory"
	releaseall
# 112 "data/maps/MtEmber_Exterior/scripts.pory"
	end
# 113 "data/maps/MtEmber_Exterior/scripts.pory"

# 114 "data/maps/MtEmber_Exterior/scripts.pory"
MtEmber_Exterior_EventScript_Logan::
# 115 "data/maps/MtEmber_Exterior/scripts.pory"
	trainerbattle_single TRAINER_PKMN_RANGER_LOGAN, MtEmber_Exterior_Text_LoganIntro, MtEmber_Exterior_Text_LoganDefeat
# 116 "data/maps/MtEmber_Exterior/scripts.pory"
	msgbox MtEmber_Exterior_Text_LoganPostBattle, MSGBOX_AUTOCLOSE
# 117 "data/maps/MtEmber_Exterior/scripts.pory"
	end
# 118 "data/maps/MtEmber_Exterior/scripts.pory"

# 119 "data/maps/MtEmber_Exterior/scripts.pory"
MtEmber_Exterior_EventScript_Beth::
# 120 "data/maps/MtEmber_Exterior/scripts.pory"
	trainerbattle_single TRAINER_PKMN_RANGER_BETH, MtEmber_Exterior_Text_BethIntro, MtEmber_Exterior_Text_BethDefeat
# 121 "data/maps/MtEmber_Exterior/scripts.pory"
	msgbox MtEmber_Exterior_Text_BethPostBattle, MSGBOX_AUTOCLOSE
# 122 "data/maps/MtEmber_Exterior/scripts.pory"
	end
# 123 "data/maps/MtEmber_Exterior/scripts.pory"

# 124 "data/maps/MtEmber_Exterior/scripts.pory"
MtEmber_Exterior_EventScript_Jocelyn::
# 125 "data/maps/MtEmber_Exterior/scripts.pory"
	trainerbattle_single TRAINER_CRUSH_GIRL_JOCELYN, MtEmber_Exterior_Text_JocelynIntro, MtEmber_Exterior_Text_JocelynDefeat
# 126 "data/maps/MtEmber_Exterior/scripts.pory"
	msgbox MtEmber_Exterior_Text_JocelynPostBattle, MSGBOX_AUTOCLOSE
# 127 "data/maps/MtEmber_Exterior/scripts.pory"
	end
