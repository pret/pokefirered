ThreeIsland_DunsparceTunnel_MapScripts:: @ 8164D26
	map_script MAP_SCRIPT_ON_TRANSITION, ThreeIsland_DunsparceTunnel_OnTransition
	.byte 0

ThreeIsland_DunsparceTunnel_OnTransition:: @ 8164D2C
	setworldmapflag FLAG_WORLD_MAP_THREE_ISLAND_DUNSPARCE_TUNNEL
	specialvar VAR_RESULT, IsNationalPokedexEnabled
	copyvar VAR_0x8008, VAR_RESULT
	compare VAR_0x8008, TRUE
	call_if_eq EventScript_164D50
	compare VAR_0x8008, FALSE
	call_if_eq EventScript_164D54
	end

EventScript_164D50:: @ 8164D50
	setmaplayoutindex LAYOUT_THREE_ISLAND_DUNSPARCE_TUNNEL_2
	return

EventScript_164D54:: @ 8164D54
	setobjectxyperm 1, 6, 3
	setobjectmovementtype 1, 10
	return

ThreeIsland_DunsparceTunnel_EventScript_164D60:: @ 8164D60
	lock
	faceplayer
	goto_if_set FLAG_GOT_NUGGET_FROM_DUNSPARCE_TUNNEL, EventScript_164DC2
	specialvar VAR_RESULT, IsNationalPokedexEnabled
	compare VAR_RESULT, TRUE
	goto_if_eq EventScript_164D90
	msgbox gUnknown_817D13B
	closemessage
	applymovement 1, Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

EventScript_164D90:: @ 8164D90
	msgbox gUnknown_817D1C9
	giveitem ITEM_NUGGET
	compare VAR_RESULT, 0
	goto_if_eq EventScript_164DB8
	setflag FLAG_GOT_NUGGET_FROM_DUNSPARCE_TUNNEL
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
