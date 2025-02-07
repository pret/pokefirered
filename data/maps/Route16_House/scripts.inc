# 1 "data/maps/Route16_House/scripts.pory"

# 2 "data/maps/Route16_House/scripts.pory"
Route16_House_MapScripts::
# 3 "data/maps/Route16_House/scripts.pory"
	.byte 0
# 4 "data/maps/Route16_House/scripts.pory"

# 5 "data/maps/Route16_House/scripts.pory"
Route16_House_EventScript_Woman::
# 6 "data/maps/Route16_House/scripts.pory"
	lock
# 7 "data/maps/Route16_House/scripts.pory"
	faceplayer
# 8 "data/maps/Route16_House/scripts.pory"
	goto_if_set FLAG_GOT_HM02, Route16_House_EventScript_AlreadyGotHM02
# 9 "data/maps/Route16_House/scripts.pory"
	msgbox Route16_House_Text_FoundMySecretRetreat
# 10 "data/maps/Route16_House/scripts.pory"
	checkitemspace ITEM_HM02
# 11 "data/maps/Route16_House/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, Route16_House_EventScript_NoRoomForHM02
# 12 "data/maps/Route16_House/scripts.pory"
	giveitem_msg Route16_House_Text_ReceivedHM02FromGirl, ITEM_HM02
# 13 "data/maps/Route16_House/scripts.pory"
	msgbox Route16_House_Text_ExplainHM02
# 14 "data/maps/Route16_House/scripts.pory"
	setflag FLAG_GOT_HM02
# 15 "data/maps/Route16_House/scripts.pory"
	release
# 16 "data/maps/Route16_House/scripts.pory"
	end
# 17 "data/maps/Route16_House/scripts.pory"

# 18 "data/maps/Route16_House/scripts.pory"
Route16_House_EventScript_NoRoomForHM02::
# 19 "data/maps/Route16_House/scripts.pory"
	msgbox Route16_House_Text_DontHaveAnyRoomForThis
# 20 "data/maps/Route16_House/scripts.pory"
	release
# 21 "data/maps/Route16_House/scripts.pory"
	end
# 22 "data/maps/Route16_House/scripts.pory"

# 23 "data/maps/Route16_House/scripts.pory"
Route16_House_EventScript_AlreadyGotHM02::
# 24 "data/maps/Route16_House/scripts.pory"
	msgbox Route16_House_Text_ExplainHM02
# 25 "data/maps/Route16_House/scripts.pory"
	release
# 26 "data/maps/Route16_House/scripts.pory"
	end
# 27 "data/maps/Route16_House/scripts.pory"

# 28 "data/maps/Route16_House/scripts.pory"
Route16_House_EventScript_Fearow::
# 29 "data/maps/Route16_House/scripts.pory"
	lock
# 30 "data/maps/Route16_House/scripts.pory"
	faceplayer
# 31 "data/maps/Route16_House/scripts.pory"
	waitse
# 32 "data/maps/Route16_House/scripts.pory"
	playmoncry SPECIES_FEAROW, CRY_MODE_NORMAL
# 33 "data/maps/Route16_House/scripts.pory"
	msgbox Route16_House_Text_Fearow
# 34 "data/maps/Route16_House/scripts.pory"
	waitmoncry
# 35 "data/maps/Route16_House/scripts.pory"
	release
# 36 "data/maps/Route16_House/scripts.pory"
	end
