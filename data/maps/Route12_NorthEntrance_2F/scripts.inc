# 1 "data/maps/Route12_NorthEntrance_2F/scripts.pory"

# 2 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
Route12_NorthEntrance_2F_MapScripts::
# 3 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	.byte 0
# 4 "data/maps/Route12_NorthEntrance_2F/scripts.pory"

# 5 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
Route12_NorthEntrance_2F_EventScript_LeftBinoculars::
# 6 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	msgbox Route12_NorthEntrance_2F_Text_TheresManFishing, MSGBOX_SIGN
# 7 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	end
# 8 "data/maps/Route12_NorthEntrance_2F/scripts.pory"

# 9 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
Route12_NorthEntrance_2F_EventScript_RightBinoculars::
# 10 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	msgbox Route12_NorthEntrance_2F_Text_ItsPokemonTower, MSGBOX_SIGN
# 11 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	end
# 12 "data/maps/Route12_NorthEntrance_2F/scripts.pory"

# 13 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
Route12_NorthEntrance_2F_EventScript_Lass::
# 14 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	lock
# 15 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	faceplayer
# 16 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	goto_if_set FLAG_GOT_TM27, Route12_NorthEntrance_2F_EventScript_ExplainTM27
# 17 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	checkplayergender
# 18 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	call_if_eq VAR_RESULT, MALE, Route12_NorthEntrance_2F_EventScript_TakeTMMale
# 19 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	call_if_eq VAR_RESULT, FEMALE, Route12_NorthEntrance_2F_EventScript_TakeTMFemale
# 20 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	checkitemspace ITEM_TM27
# 21 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, Route12_NorthEntrance_2F_EventScript_NoRoomForTM27
# 22 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	giveitem_msg Route12_NorthEntrance_2F_Text_ReceivedTM27FromLittleGirl, ITEM_TM27
# 23 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	msgbox Route12_NorthEntrance_2F_Text_ExplainTM27
# 24 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	setflag FLAG_GOT_TM27
# 25 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	release
# 26 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	end
# 27 "data/maps/Route12_NorthEntrance_2F/scripts.pory"

# 28 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
Route12_NorthEntrance_2F_EventScript_TakeTMMale::
# 29 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	msgbox Route12_NorthEntrance_2F_Text_TakeTMDontNeedAnymoreMale
# 30 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	return
# 31 "data/maps/Route12_NorthEntrance_2F/scripts.pory"

# 32 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
Route12_NorthEntrance_2F_EventScript_TakeTMFemale::
# 33 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	msgbox Route12_NorthEntrance_2F_Text_TakeTMDontNeedAnymoreFemale
# 34 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	return
# 35 "data/maps/Route12_NorthEntrance_2F/scripts.pory"

# 36 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
Route12_NorthEntrance_2F_EventScript_NoRoomForTM27::
# 37 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	msgbox Route12_NorthEntrance_2F_Text_DontHaveRoomForThis
# 38 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	release
# 39 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	end
# 40 "data/maps/Route12_NorthEntrance_2F/scripts.pory"

# 41 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
Route12_NorthEntrance_2F_EventScript_ExplainTM27::
# 42 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	msgbox Route12_NorthEntrance_2F_Text_ExplainTM27
# 43 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	release
# 44 "data/maps/Route12_NorthEntrance_2F/scripts.pory"
	end
