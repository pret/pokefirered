ThreeIsland_DunsparceTunnel_MapScripts:: @ 8164D26
	map_script 3, ThreeIsland_DunsparceTunnel_MapScript1_164D2C
	.byte 0

ThreeIsland_DunsparceTunnel_MapScript1_164D2C:: @ 8164D2C
	setworldmapflag FLAG_WORLD_MAP_THREE_ISLAND_DUNSPARCE_TUNNEL
	specialvar VAR_RESULT, sub_806E25C
	copyvar VAR_0x8008, VAR_RESULT
	compare_var_to_value VAR_0x8008, 1
	call_if 1, EventScript_164D50
	compare_var_to_value VAR_0x8008, 0
	call_if 1, EventScript_164D54
	end

EventScript_164D50:: @ 8164D50
	setmaplayoutindex LAYOUT_UNUSED_LAYOUT_83453C0
	return

EventScript_164D54:: @ 8164D54
	setobjectxyperm 1, 6, 3
	setobjectmovementtype 1, 10
	return

ThreeIsland_DunsparceTunnel_EventScript_164D60:: @ 8164D60
	lock
	faceplayer
	checkflag FLAG_0x2E2
	goto_if 1, EventScript_164DC2
	specialvar VAR_RESULT, sub_806E25C
	compare_var_to_value VAR_RESULT, 1
	goto_if 1, EventScript_164D90
	msgbox gUnknown_817D13B
	closemessage
	applymovement 1, Movement_1A75E5
	waitmovement 0
	release
	end

EventScript_164D90:: @ 8164D90
	msgbox gUnknown_817D1C9
	setorcopyvar VAR_0x8000, 110
	setorcopyvar VAR_0x8001, 1
	callstd 0
	compare_var_to_value VAR_RESULT, 0
	goto_if 1, EventScript_164DB8
	setflag FLAG_0x2E2
	goto EventScript_164DC2
	end

EventScript_164DB8:: @ 8164DB8
	msgbox gUnknown_817D2DC
	release
	end

EventScript_164DC2:: @ 8164DC2
	msgbox gUnknown_817D28C
	release
	end
