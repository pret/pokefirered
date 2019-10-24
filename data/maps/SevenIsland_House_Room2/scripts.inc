SevenIsland_House_Room2_MapScripts:: @ 8170A7E
	map_script 3, SevenIsland_House_Room2_MapScript1_170A89
	map_script 2, SevenIsland_House_Room2_MapScript2_170A8D
	.byte 0

SevenIsland_House_Room2_MapScript1_170A89:: @ 8170A89
	special SetEReaderTrainerGfxId
	end

SevenIsland_House_Room2_MapScript2_170A8D:: @ 8170A8D
	map_script_2 VAR_0x4001, 0, EventScript_170A97
	.2byte 0

EventScript_170A97:: @ 8170A97
	lockall
	applymovement 255, Movement_170B22
	waitmovement 0
	special PrintEReaderTrainerGreeting
	msgbox gStringVar4
	closemessage
	setvar VAR_0x8004, 2
	setvar VAR_0x8005, 0
	special StartSpecialBattle
	waitstate
	compare_var_to_value VAR_RESULT, 3
	call_if eq, EventScript_170AFE
	compare_var_to_value VAR_RESULT, 1
	call_if eq, EventScript_170B0C
	compare_var_to_value VAR_RESULT, 2
	call_if eq, EventScript_170B17
	closemessage
	special sp000_heal_pokemon
	applymovement 255, Movement_170B28
	waitmovement 0
	special LoadPlayerParty
	setvar VAR_0x4001, 1
	warp MAP_SEVEN_ISLAND_HOUSE_ROOM1, 255, 4, 1
	waitstate
	releaseall
	end

EventScript_170AFE:: @ 8170AFE
	setvar VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 3
	msgbox gUnknown_81A07EC
	return

EventScript_170B0C:: @ 8170B0C
	setvar VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 1
	special Special_ShowStringVar4AsFieldMessage
	waitmessage
	waitbuttonpress
	return

EventScript_170B17:: @ 8170B17
	setvar VAR_MAP_SCENE_SEVEN_ISLAND_HOUSE_ROOM1, 2
	special Special_ShowStringVar4AsFieldMessage
	waitmessage
	waitbuttonpress
	return

Movement_170B22:: @ 8170B22
	step_10
	step_10
	step_10
	step_13
	step_13
	step_end

Movement_170B28:: @ 8170B28
	step_12
	step_12
	step_11
	step_11
	step_11
	step_11
	step_1b
	step_end
