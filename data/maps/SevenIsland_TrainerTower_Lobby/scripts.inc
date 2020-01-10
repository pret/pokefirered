SevenIsland_TrainerTower_Lobby_MapScripts:: @ 8164839
	map_script MAP_SCRIPT_ON_RESUME, SevenIsland_TrainerTower_Lobby_OnResume
	map_script MAP_SCRIPT_ON_RETURN_TO_FIELD, SevenIsland_TrainerTower_Lobby_OnReturnToField
	map_script MAP_SCRIPT_ON_TRANSITION, SevenIsland_TrainerTower_Lobby_OnTransition
	map_script MAP_SCRIPT_ON_LOAD, SevenIsland_TrainerTower_Lobby_OnLoad
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SevenIsland_TrainerTower_Lobby_OnFrame
	.byte 0

SevenIsland_TrainerTower_Lobby_OnResume:: @ 8164853
	setvar VAR_TEMP_2, 0
	setvar VAR_0x8004, 10
	special sub_815D9E8
	setvar VAR_0x8004, 18
	special sub_815D9E8
	compare VAR_RESULT, 0
	goto_if_eq EventScript_164886
	setvar VAR_TEMP_0, 0
	setobjectxy OBJ_EVENT_ID_PLAYER, 9, 7
	applymovement OBJ_EVENT_ID_PLAYER, Movement_164AD4

EventScript_164886:: @ 8164886
	end

SevenIsland_TrainerTower_Lobby_OnReturnToField:: @ 8164887
	addobject 1
	addobject 2
	addobject 3
	addobject 4
	addobject 5
	end

SevenIsland_TrainerTower_Lobby_OnLoad:: @ 8164897
	compare VAR_TEMP_D, 17
	call_if_eq EventScript_1648A3
	end

EventScript_1648A3:: @ 81648A3
	setmetatile 17, 10, 647, 0
	return

SevenIsland_TrainerTower_Lobby_OnTransition:: @ 81648AD
	setworldmapflag FLAG_WORLD_MAP_SEVEN_ISLAND_TRAINER_TOWER_LOBBY
	getplayerxy VAR_TEMP_D, VAR_RESULT
	end

SevenIsland_TrainerTower_Lobby_OnFrame:: @ 81648B6
	map_script_2 VAR_TEMP_0, 0, EventScript_1648ED
	map_script_2 VAR_TEMP_D, 0x11, EventScript_1648C8
	.2byte 0

EventScript_1648C8:: @ 81648C8
	lockall
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1648EA
	waitmovement 0
	setmetatile 17, 10, 692, 1
	special DrawWholeMapView
	playse SE_TK_KASYA
	waitse
	setvar VAR_TEMP_D, 0
	releaseall
	end

Movement_1648EA:: @ 81648EA
	walk_down
	walk_down
	step_end

EventScript_1648ED:: @ 81648ED
	setvar VAR_TEMP_0, 1
	setvar VAR_0x8004, 12
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_164920
	case 1, EventScript_164938
	case 2, EventScript_16495C

EventScript_164920:: @ 8164920
	lock
	faceplayer
	applymovement OBJ_EVENT_ID_PLAYER, Movement_164AD4
	textcolor 1
	msgbox gUnknown_817C937
	goto EventScript_16494B

EventScript_164938:: @ 8164938
	lock
	faceplayer
	applymovement OBJ_EVENT_ID_PLAYER, Movement_164AD4
	textcolor 1
	msgbox gUnknown_817C9C0

EventScript_16494B:: @ 816494B
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_164AD6
	waitmovement 0
	setvar VAR_MAP_SCENE_TRAINER_TOWER, 0
	release

EventScript_16495C:: @ 816495C
	end

SevenIsland_TrainerTower_Lobby_EventScript_16495D:: @ 816495D
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end

SevenIsland_TrainerTower_Lobby_EventScript_164966:: @ 8164966
	lock
	faceplayer
	setvar VAR_0x8004, 20
	special sub_815D9E8
	compare VAR_RESULT, 1
	goto_if_eq EventScript_164988
	msgbox gUnknown_817C9A2
	goto EventScript_164990

EventScript_164988:: @ 8164988
	msgbox gUnknown_817CE1F

EventScript_164990:: @ 8164990
	release
	end

SevenIsland_TrainerTower_Lobby_EventScript_164992:: @ 8164992
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart Items_1649B8
	msgbox Text_PleaseComeAgain
	release
	end

	.align 2
Items_1649B8:: @ 81649B8
	.2byte ITEM_ULTRA_BALL
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_FULL_RESTORE
	.2byte ITEM_MAX_POTION
	.2byte ITEM_HYPER_POTION
	.2byte ITEM_REVIVE
	.2byte ITEM_FULL_HEAL
	.2byte ITEM_ESCAPE_ROPE
	.2byte ITEM_MAX_REPEL
	.2byte ITEM_NONE
	release
	end

SevenIsland_TrainerTower_Lobby_EventScript_1649CE:: @ 81649CE
	lockall
	applymovement OBJ_EVENT_ID_PLAYER, Movement_164AD4
	textcolor 1
	msgbox gUnknown_817C794
	setvar VAR_0x8004, 17
	special sub_815D9E8
	compare VAR_RESULT, 0
	goto_if_eq EventScript_164A00
	msgbox gUnknown_817C7D9
	goto EventScript_164A08

EventScript_164A00:: @ 8164A00
	msgbox gUnknown_817C850

EventScript_164A08:: @ 8164A08
	message Text_17C88D
	waitmessage
	multichoice 18, 6, MULTICHOICE_YES_NO_INFO, FALSE
	switch VAR_RESULT
	case 0, EventScript_164A53
	case 1, EventScript_164ABF
	case 2, EventScript_164A45
	case 127, EventScript_164ABF
	end

EventScript_164A45:: @ 8164A45
	msgbox gUnknown_817CCC9
	goto EventScript_164A08
	end

EventScript_164A53:: @ 8164A53
	multichoice 13, 3, MULTICHOICE_TRAINER_TOWER_MODE, FALSE
	switch VAR_RESULT
	case 0, EventScript_164AA0
	case 1, EventScript_164AA0
	case 2, EventScript_164AA0
	case 3, EventScript_164AA0
	case 4, EventScript_164ABF
	case 127, EventScript_164ABF
	end

EventScript_164AA0:: @ 8164AA0
	copyvar VAR_0x8005, VAR_RESULT
	setvar VAR_MAP_SCENE_TRAINER_TOWER, 1
	special sp000_heal_pokemon
	msgbox gUnknown_817C8BF
	setvar VAR_0x8004, 6
	special sub_815D9E8
	releaseall
	end

EventScript_164ABF:: @ 8164ABF
	msgbox gUnknown_817C91D
	closemessage
	applymovement OBJ_EVENT_ID_PLAYER, Movement_164AD6
	waitmovement 0
	releaseall
	end

Movement_164AD4:: @ 8164AD4
	face_right
	step_end

Movement_164AD6:: @ 8164AD6
	walk_down
	step_end

SevenIsland_TrainerTower_Lobby_EventScript_164AD8:: @ 8164AD8
	lockall
	fadescreen FADE_TO_BLACK
	setvar VAR_0x8004, 1
	special Special_BattleRecords
	waitstate
	releaseall
	end

SevenIsland_TrainerTower_Lobby_EventScript_164AE6:: @ 8164AE6
	msgbox gUnknown_817CE38, MSGBOX_NPC
	end

SevenIsland_TrainerTower_Lobby_EventScript_164AEF:: @ 8164AEF
	msgbox gUnknown_817CE9F, MSGBOX_NPC
	end
