ThreeIsland_Port_MapScripts:: @ 8168789
	map_script 3, ThreeIsland_Port_MapScript1_16878F
	.byte 0

ThreeIsland_Port_MapScript1_16878F:: @ 816878F
	clearflag FLAG_0x841
	setflag FLAG_0x2A1
	end

ThreeIsland_Port_EventScript_168796:: @ 8168796
	lock
	faceplayer
	compare_var_to_value VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 2
	goto_if ge, EventScript_1687B8
	compare_var_to_value VAR_MAP_SCENE_THREE_ISLAND, 4
	goto_if ge, EventScript_1687C2
	msgbox gUnknown_818A307
	release
	end

EventScript_1687B8:: @ 81687B8
	msgbox gUnknown_818A38B
	release
	end

EventScript_1687C2:: @ 81687C2
	msgbox gUnknown_818A339
	release
	end

ThreeIsland_Port_EventScript_1687CC:: @ 81687CC
	msgbox gUnknown_818A261, 2
	end

ThreeIsland_Port_EventScript_1687D5:: @ 81687D5
	lock
	msgbox gUnknown_818A2D8
	release
	end
