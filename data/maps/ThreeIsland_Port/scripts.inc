# 1 "data/maps/ThreeIsland_Port/scripts.pory"

# 2 "data/maps/ThreeIsland_Port/scripts.pory"
ThreeIsland_Port_MapScripts::
# 3 "data/maps/ThreeIsland_Port/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, ThreeIsland_Port_OnTransition
# 4 "data/maps/ThreeIsland_Port/scripts.pory"
	.byte 0
# 5 "data/maps/ThreeIsland_Port/scripts.pory"

# 6 "data/maps/ThreeIsland_Port/scripts.pory"
ThreeIsland_Port_OnTransition::
# 7 "data/maps/ThreeIsland_Port/scripts.pory"
	clearflag FLAG_SYS_PC_STORAGE_DISABLED
# 8 "data/maps/ThreeIsland_Port/scripts.pory"
	setflag FLAG_SEVII_DETOUR_FINISHED
# 9 "data/maps/ThreeIsland_Port/scripts.pory"
	end
# 10 "data/maps/ThreeIsland_Port/scripts.pory"

# 11 "data/maps/ThreeIsland_Port/scripts.pory"
ThreeIsland_Port_EventScript_Woman::
# 12 "data/maps/ThreeIsland_Port/scripts.pory"
	lock
# 13 "data/maps/ThreeIsland_Port/scripts.pory"
	faceplayer
# 14 "data/maps/ThreeIsland_Port/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_TWO_ISLAND_JOYFUL_GAME_CORNER, 2, ThreeIsland_Port_EventScript_WomanLostelleFound
# 15 "data/maps/ThreeIsland_Port/scripts.pory"
	goto_if_ge VAR_MAP_SCENE_THREE_ISLAND, 4, ThreeIsland_Port_EventScript_WomanBikersGone
# 16 "data/maps/ThreeIsland_Port/scripts.pory"
	msgbox ThreeIsland_Port_Text_IllCallThePolice
# 17 "data/maps/ThreeIsland_Port/scripts.pory"
	release
# 18 "data/maps/ThreeIsland_Port/scripts.pory"
	end
# 19 "data/maps/ThreeIsland_Port/scripts.pory"

# 20 "data/maps/ThreeIsland_Port/scripts.pory"
ThreeIsland_Port_EventScript_WomanLostelleFound::
# 21 "data/maps/ThreeIsland_Port/scripts.pory"
	msgbox ThreeIsland_Port_Text_EverythingTurnedOutForBest
# 22 "data/maps/ThreeIsland_Port/scripts.pory"
	release
# 23 "data/maps/ThreeIsland_Port/scripts.pory"
	end
# 24 "data/maps/ThreeIsland_Port/scripts.pory"

# 25 "data/maps/ThreeIsland_Port/scripts.pory"
ThreeIsland_Port_EventScript_WomanBikersGone::
# 26 "data/maps/ThreeIsland_Port/scripts.pory"
	msgbox ThreeIsland_Port_Text_ThankGoodnessBikersGone
# 27 "data/maps/ThreeIsland_Port/scripts.pory"
	release
# 28 "data/maps/ThreeIsland_Port/scripts.pory"
	end
# 29 "data/maps/ThreeIsland_Port/scripts.pory"

# 30 "data/maps/ThreeIsland_Port/scripts.pory"
ThreeIsland_Port_EventScript_Biker1::
# 31 "data/maps/ThreeIsland_Port/scripts.pory"
	msgbox ThreeIsland_Port_Text_WereKantoRiderFederation, MSGBOX_NPC
# 32 "data/maps/ThreeIsland_Port/scripts.pory"
	end
# 33 "data/maps/ThreeIsland_Port/scripts.pory"

# 34 "data/maps/ThreeIsland_Port/scripts.pory"
ThreeIsland_Port_EventScript_Biker2::
# 35 "data/maps/ThreeIsland_Port/scripts.pory"
	lock
# 36 "data/maps/ThreeIsland_Port/scripts.pory"
	msgbox ThreeIsland_Port_Text_ForkOverMoney
# 37 "data/maps/ThreeIsland_Port/scripts.pory"
	release
# 38 "data/maps/ThreeIsland_Port/scripts.pory"
	end
