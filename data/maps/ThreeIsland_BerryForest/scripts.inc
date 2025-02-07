# 1 "data/maps/ThreeIsland_BerryForest/scripts.pory"

# 2 "data/maps/ThreeIsland_BerryForest/scripts.pory"
.set LOCALID_LOSTELLE, 1
# 3 "data/maps/ThreeIsland_BerryForest/scripts.pory"

# 4 "data/maps/ThreeIsland_BerryForest/scripts.pory"
ThreeIsland_BerryForest_MapScripts::
# 5 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, ThreeIsland_BerryForest_OnTransition
# 6 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	.byte 0
# 7 "data/maps/ThreeIsland_BerryForest/scripts.pory"

# 8 "data/maps/ThreeIsland_BerryForest/scripts.pory"
ThreeIsland_BerryForest_OnTransition::
# 9 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_THREE_ISLAND_BERRY_FOREST
# 10 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	setescapewarp MAP_THREE_ISLAND_BOND_BRIDGE, 12, 6
# 11 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	end
# 12 "data/maps/ThreeIsland_BerryForest/scripts.pory"

# 13 "data/maps/ThreeIsland_BerryForest/scripts.pory"
ThreeIsland_BerryForest_EventScript_Lostelle::
# 14 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	lock
# 15 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	faceplayer
# 16 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	msgbox ThreeIsland_BerryForest_Text_HelpScaryPokemon
# 17 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	playse SE_PIN
# 18 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	applymovement LOCALID_LOSTELLE, Common_Movement_ExclamationMark
# 19 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	waitmovement 0
# 20 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	applymovement LOCALID_LOSTELLE, ThreeIsland_BerryForest_Movement_LostelleLookAround
# 21 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	waitmovement 0
# 22 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	msgbox ThreeIsland_BerryForest_Text_HereItComesAgain
# 23 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 24 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	waitse
# 25 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	playmoncry SPECIES_HYPNO, CRY_MODE_ENCOUNTER
# 26 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	waitmoncry
# 27 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	setwildbattle SPECIES_HYPNO, 30
# 28 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	dowildbattle
# 29 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	special QuestLog_CutRecording
# 30 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	applymovement LOCALID_LOSTELLE, Common_Movement_FacePlayer
# 31 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	waitmovement 0
# 32 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	msgbox ThreeIsland_BerryForest_Text_ThankYouHaveThis
# 33 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	giveitem ITEM_IAPAPA_BERRY
# 34 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	call_if_eq VAR_RESULT, FALSE, ThreeIsland_BerryForest_EventScript_NoRoomForBerry
# 35 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	special BufferBigGuyOrBigGirlString
# 36 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	msgbox ThreeIsland_BerryForest_Text_LetsGoHome
# 37 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	closemessage
# 38 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	setflag FLAG_RESCUED_LOSTELLE
# 39 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	setflag FLAG_HIDE_LOSTELLE_IN_BERRY_FOREST
# 40 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	setvar VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 2
# 41 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	clearflag FLAG_HIDE_TWO_ISLAND_GAME_CORNER_LOSTELLE
# 42 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	warp MAP_TWO_ISLAND_JOYFUL_GAME_CORNER, 6, 6
# 43 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	waitstate
# 44 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	release
# 45 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	end
# 46 "data/maps/ThreeIsland_BerryForest/scripts.pory"

# 47 "data/maps/ThreeIsland_BerryForest/scripts.pory"
ThreeIsland_BerryForest_EventScript_NoRoomForBerry::
# 48 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	msgbox ThreeIsland_BerryForest_Text_BerryPouchIsFull
# 49 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	return
# 50 "data/maps/ThreeIsland_BerryForest/scripts.pory"

# 51 "data/maps/ThreeIsland_BerryForest/scripts.pory"
ThreeIsland_BerryForest_Movement_LostelleLookAround::
# 52 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	walk_in_place_faster_left
# 53 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	delay_16
# 54 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	walk_in_place_faster_right
# 55 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	delay_8
# 56 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	walk_in_place_faster_left
# 57 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	step_end
# 58 "data/maps/ThreeIsland_BerryForest/scripts.pory"

# 59 "data/maps/ThreeIsland_BerryForest/scripts.pory"
ThreeIsland_BerryForest_EventScript_WelcomeSign::
# 60 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	msgbox ThreeIsland_BerryForest_Text_WelcomeToBerryForest, MSGBOX_SIGN
# 61 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	end
# 62 "data/maps/ThreeIsland_BerryForest/scripts.pory"

# 63 "data/maps/ThreeIsland_BerryForest/scripts.pory"
ThreeIsland_BerryForest_EventScript_BewareSign::
# 64 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	msgbox ThreeIsland_BerryForest_Text_BewareWildBerryLovingMons, MSGBOX_SIGN
# 65 "data/maps/ThreeIsland_BerryForest/scripts.pory"
	end
