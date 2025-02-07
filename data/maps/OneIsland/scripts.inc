# 1 "data/maps/OneIsland/scripts.pory"

# 2 "data/maps/OneIsland/scripts.pory"
.equ LOCALID_BILL, 1
# 3 "data/maps/OneIsland/scripts.pory"

# 4 "data/maps/OneIsland/scripts.pory"
OneIsland_MapScripts::
# 5 "data/maps/OneIsland/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, OneIsland_OnTransition
# 6 "data/maps/OneIsland/scripts.pory"
	map_script MAP_SCRIPT_ON_FRAME_TABLE, OneIsland_OnFrame
# 7 "data/maps/OneIsland/scripts.pory"
	.byte 0
# 8 "data/maps/OneIsland/scripts.pory"

# 9 "data/maps/OneIsland/scripts.pory"
OneIsland_OnTransition::
# 10 "data/maps/OneIsland/scripts.pory"
	setworldmapflag FLAG_WORLD_MAP_ONE_ISLAND
# 11 "data/maps/OneIsland/scripts.pory"
	end
# 12 "data/maps/OneIsland/scripts.pory"

# 13 "data/maps/OneIsland/scripts.pory"
OneIsland_OnFrame::
# 14 "data/maps/OneIsland/scripts.pory"
	map_script_2 VAR_MAP_SCENE_ONE_ISLAND_HARBOR, 2, OneIsland_EventScript_EnterOneIslandFirstTime
# 15 "data/maps/OneIsland/scripts.pory"
	.2byte 0
# 16 "data/maps/OneIsland/scripts.pory"

# 17 "data/maps/OneIsland/scripts.pory"
OneIsland_EventScript_EnterOneIslandFirstTime::
# 18 "data/maps/OneIsland/scripts.pory"
	lockall
# 19 "data/maps/OneIsland/scripts.pory"
	textcolor NPC_TEXT_COLOR_MALE
# 20 "data/maps/OneIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, OneIsland_Movement_PlayerExitHarbor
# 21 "data/maps/OneIsland/scripts.pory"
	waitmovement 0
# 22 "data/maps/OneIsland/scripts.pory"
	msgbox OneIsland_Text_BillLetsGoSeeCelio
# 23 "data/maps/OneIsland/scripts.pory"
	closemessage
# 24 "data/maps/OneIsland/scripts.pory"
	applymovement LOCALID_BILL, OneIsland_Movement_BillWalkToPokeCenter
# 25 "data/maps/OneIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, OneIsland_Movement_PlayerWalkToPokeCenter
# 26 "data/maps/OneIsland/scripts.pory"
	waitmovement 0
# 27 "data/maps/OneIsland/scripts.pory"
	opendoor 14, 5
# 28 "data/maps/OneIsland/scripts.pory"
	waitdooranim
# 29 "data/maps/OneIsland/scripts.pory"
	applymovement LOCALID_BILL, OneIsland_Movement_BillEnterPokeCenter
# 30 "data/maps/OneIsland/scripts.pory"
	applymovement OBJ_EVENT_ID_PLAYER, OneIsland_Movement_PlayerEnterPokeCenter
# 31 "data/maps/OneIsland/scripts.pory"
	waitmovement 0
# 32 "data/maps/OneIsland/scripts.pory"
	closedoor 14, 5
# 33 "data/maps/OneIsland/scripts.pory"
	waitdooranim
# 34 "data/maps/OneIsland/scripts.pory"
	removeobject LOCALID_BILL
# 35 "data/maps/OneIsland/scripts.pory"
	setvar VAR_MAP_SCENE_ONE_ISLAND_HARBOR, 3
# 36 "data/maps/OneIsland/scripts.pory"
	warp MAP_ONE_ISLAND_POKEMON_CENTER_1F, 9, 9
# 37 "data/maps/OneIsland/scripts.pory"
	waitstate
# 38 "data/maps/OneIsland/scripts.pory"
	releaseall
# 39 "data/maps/OneIsland/scripts.pory"
	end
# 40 "data/maps/OneIsland/scripts.pory"

# 41 "data/maps/OneIsland/scripts.pory"
	.macro walk_to_pokecenter
# 42 "data/maps/OneIsland/scripts.pory"
	walk_up
# 43 "data/maps/OneIsland/scripts.pory"
	walk_up
# 44 "data/maps/OneIsland/scripts.pory"
	walk_up
# 45 "data/maps/OneIsland/scripts.pory"
	walk_up
# 46 "data/maps/OneIsland/scripts.pory"
	walk_right
# 47 "data/maps/OneIsland/scripts.pory"
	walk_right
# 48 "data/maps/OneIsland/scripts.pory"
	walk_up
# 49 "data/maps/OneIsland/scripts.pory"
	walk_up
# 50 "data/maps/OneIsland/scripts.pory"
	walk_up
# 51 "data/maps/OneIsland/scripts.pory"
	walk_up
# 52 "data/maps/OneIsland/scripts.pory"
	walk_up
# 53 "data/maps/OneIsland/scripts.pory"
	.endm
# 54 "data/maps/OneIsland/scripts.pory"

# 55 "data/maps/OneIsland/scripts.pory"
OneIsland_Movement_PlayerWalkToPokeCenter::
# 56 "data/maps/OneIsland/scripts.pory"
	walk_up
# 57 "data/maps/OneIsland/scripts.pory"
	walk_to_pokecenter
# 58 "data/maps/OneIsland/scripts.pory"
	step_end
# 59 "data/maps/OneIsland/scripts.pory"

# 60 "data/maps/OneIsland/scripts.pory"
OneIsland_Movement_PlayerEnterPokeCenter::
# 61 "data/maps/OneIsland/scripts.pory"
	walk_up
# 62 "data/maps/OneIsland/scripts.pory"
	walk_up
# 63 "data/maps/OneIsland/scripts.pory"
	set_invisible
# 64 "data/maps/OneIsland/scripts.pory"
	step_end
# 65 "data/maps/OneIsland/scripts.pory"

# 66 "data/maps/OneIsland/scripts.pory"
OneIsland_Movement_PlayerExitHarbor::
# 67 "data/maps/OneIsland/scripts.pory"
	walk_up
# 68 "data/maps/OneIsland/scripts.pory"
	step_end
# 69 "data/maps/OneIsland/scripts.pory"

# 70 "data/maps/OneIsland/scripts.pory"
OneIsland_Movement_BillWalkToPokeCenter::
# 71 "data/maps/OneIsland/scripts.pory"
	walk_to_pokecenter
# 72 "data/maps/OneIsland/scripts.pory"
	walk_up
# 73 "data/maps/OneIsland/scripts.pory"
	step_end
# 74 "data/maps/OneIsland/scripts.pory"

# 75 "data/maps/OneIsland/scripts.pory"
OneIsland_Movement_BillEnterPokeCenter::
# 76 "data/maps/OneIsland/scripts.pory"
	walk_up
# 77 "data/maps/OneIsland/scripts.pory"
	set_invisible
# 78 "data/maps/OneIsland/scripts.pory"
	step_end
# 79 "data/maps/OneIsland/scripts.pory"

# 80 "data/maps/OneIsland/scripts.pory"
OneIsland_EventScript_OldMan::
# 81 "data/maps/OneIsland/scripts.pory"
	lock
# 82 "data/maps/OneIsland/scripts.pory"
	faceplayer
# 83 "data/maps/OneIsland/scripts.pory"
	goto_if_set FLAG_SYS_CAN_LINK_WITH_RS, OneIsland_EventScript_OldManLinkHoenn
# 84 "data/maps/OneIsland/scripts.pory"
	goto_if_set FLAG_SEVII_DETOUR_FINISHED, OneIsland_EventScript_OldManLinkKanto
# 85 "data/maps/OneIsland/scripts.pory"
	msgbox OneIsland_Text_LuckyToHaveCelioHere
# 86 "data/maps/OneIsland/scripts.pory"
	release
# 87 "data/maps/OneIsland/scripts.pory"
	end
# 88 "data/maps/OneIsland/scripts.pory"

# 89 "data/maps/OneIsland/scripts.pory"
OneIsland_EventScript_OldManLinkKanto::
# 90 "data/maps/OneIsland/scripts.pory"
	msgbox OneIsland_Text_HavePCLinkageWithKanto
# 91 "data/maps/OneIsland/scripts.pory"
	release
# 92 "data/maps/OneIsland/scripts.pory"
	end
# 93 "data/maps/OneIsland/scripts.pory"

# 94 "data/maps/OneIsland/scripts.pory"
OneIsland_EventScript_OldManLinkHoenn::
# 95 "data/maps/OneIsland/scripts.pory"
	msgbox OneIsland_Text_HavePCLinkageWithHoenn
# 96 "data/maps/OneIsland/scripts.pory"
	release
# 97 "data/maps/OneIsland/scripts.pory"
	end
# 98 "data/maps/OneIsland/scripts.pory"

# 99 "data/maps/OneIsland/scripts.pory"
OneIsland_EventScript_BaldingMan::
# 100 "data/maps/OneIsland/scripts.pory"
	msgbox OneIsland_Text_IsntWarmClimateHereGreat, MSGBOX_NPC
# 101 "data/maps/OneIsland/scripts.pory"
	end
# 102 "data/maps/OneIsland/scripts.pory"

# 103 "data/maps/OneIsland/scripts.pory"
OneIsland_EventScript_IslandSign::
# 104 "data/maps/OneIsland/scripts.pory"
	msgbox OneIsland_Text_IslandSign, MSGBOX_SIGN
# 105 "data/maps/OneIsland/scripts.pory"
	end
# 106 "data/maps/OneIsland/scripts.pory"

# 107 "data/maps/OneIsland/scripts.pory"
OneIsland_EventScript_PokemonNetCenterSign::
# 108 "data/maps/OneIsland/scripts.pory"
	msgbox OneIsland_Text_PokemonNetCenterSign, MSGBOX_SIGN
# 109 "data/maps/OneIsland/scripts.pory"
	end
