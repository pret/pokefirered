SevenIsland_TrainerTower_Lobby_MapScripts:: @ 8164839
	map_script 5, SevenIsland_TrainerTower_Lobby_MapScript1_164853
	map_script 7, SevenIsland_TrainerTower_Lobby_MapScript2_164887
	map_script 3, SevenIsland_TrainerTower_Lobby_MapScript3_1648AD
	map_script 1, SevenIsland_TrainerTower_Lobby_MapScript4_164897
	map_script 2, SevenIsland_TrainerTower_Lobby_MapScript5_1648B6
	.byte 0

SevenIsland_TrainerTower_Lobby_MapScript1_164853:: @ 8164853
	setvar VAR_0x4002, 0
	setvar VAR_0x8004, 10
	special sub_815D9E8
	setvar VAR_0x8004, 18
	special sub_815D9E8
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_164886
	setvar VAR_0x4000, 0
	setobjectxy 255, 9, 7
	applymovement 255, Movement_164AD4

EventScript_164886:: @ 8164886
	end

SevenIsland_TrainerTower_Lobby_MapScript2_164887:: @ 8164887
	addobject 1
	addobject 2
	addobject 3
	addobject 4
	addobject 5
	end

SevenIsland_TrainerTower_Lobby_MapScript4_164897:: @ 8164897
	compare_var_to_value VAR_0x400D, 17
	call_if 1, EventScript_1648A3
	end

EventScript_1648A3:: @ 81648A3
	setmetatile 17, 10, 647, 0
	return

SevenIsland_TrainerTower_Lobby_MapScript3_1648AD:: @ 81648AD
	setworldmapflag FLAG_WORLD_MAP_SEVEN_ISLAND_TRAINER_TOWER_LOBBY
	getplayerxy VAR_0x400D, VAR_RESULT
	end

SevenIsland_TrainerTower_Lobby_MapScript5_1648B6:: @ 81648B6
	map_script_2 VAR_0x4000, 0, EventScript_1648ED
	map_script_2 VAR_0x400D, 0x11, EventScript_1648C8
	.2byte 0

EventScript_1648C8:: @ 81648C8
	lockall
	applymovement 255, Movement_1648EA
	waitmovement 0
	setmetatile 17, 10, 692, 1
	special DrawWholeMapView
	playse SE_N
	waitse
	setvar VAR_0x400D, 0
	releaseall
	end

Movement_1648EA:: @ 81648EA
	step_10
	step_10
	step_end

EventScript_1648ED:: @ 81648ED
	setvar VAR_0x4000, 1
	setvar VAR_0x8004, 12
	special sub_815D9E8
	switch VAR_RESULT
	case 0, EventScript_164920
	case 1, EventScript_164938
	case 2, EventScript_16495C

EventScript_164920:: @ 8164920
	lock
	faceplayer
	applymovement 255, Movement_164AD4
	textcolor 1
	msgbox gUnknown_817C937
	goto EventScript_16494B

EventScript_164938:: @ 8164938
	lock
	faceplayer
	applymovement 255, Movement_164AD4
	textcolor 1
	msgbox gUnknown_817C9C0

EventScript_16494B:: @ 816494B
	closemessage
	applymovement 255, Movement_164AD6
	waitmovement 0
	setvar VAR_0x4082, 0
	release

EventScript_16495C:: @ 816495C
	end

SevenIsland_TrainerTower_Lobby_EventScript_16495D:: @ 816495D
	lock
	faceplayer
	call EventScript_1A6578
	release
	end

SevenIsland_TrainerTower_Lobby_EventScript_164966:: @ 8164966
	lock
	faceplayer
	setvar VAR_0x8004, 20
	special sub_815D9E8
	compare_var_to_value VAR_RESULT, 1
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
	compare_var_to_value VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lock
	faceplayer
	message Text_1A6211
	waitmessage
	pokemart Items_1649B8
	msgbox gUnknown_81A5190
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
	applymovement 255, Movement_164AD4
	textcolor 1
	msgbox gUnknown_817C794
	setvar VAR_0x8004, 17
	special sub_815D9E8
	compare_var_to_value VAR_RESULT, 0
	goto_if_eq EventScript_164A00
	msgbox gUnknown_817C7D9
	goto EventScript_164A08

EventScript_164A00:: @ 8164A00
	msgbox gUnknown_817C850

EventScript_164A08:: @ 8164A08
	message Text_17C88D
	waitmessage
	multichoice 18, 6, 16, 0
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
	multichoice 13, 3, 64, 0
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
	setvar VAR_0x4082, 1
	special sp000_heal_pokemon
	msgbox gUnknown_817C8BF
	setvar VAR_0x8004, 6
	special sub_815D9E8
	releaseall
	end

EventScript_164ABF:: @ 8164ABF
	msgbox gUnknown_817C91D
	closemessage
	applymovement 255, Movement_164AD6
	waitmovement 0
	releaseall
	end

Movement_164AD4:: @ 8164AD4
	step_03
	step_end

Movement_164AD6:: @ 8164AD6
	step_10
	step_end

SevenIsland_TrainerTower_Lobby_EventScript_164AD8:: @ 8164AD8
	lockall
	fadescreen 1
	setvar VAR_0x8004, 1
	special sub_80CD228
	waitstate
	releaseall
	end

SevenIsland_TrainerTower_Lobby_EventScript_164AE6:: @ 8164AE6
	msgbox gUnknown_817CE38, 2
	end

SevenIsland_TrainerTower_Lobby_EventScript_164AEF:: @ 8164AEF
	msgbox gUnknown_817CE9F, 2
	end
