# 1 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"

# 2 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
SaffronCity_MrPsychicsHouse_MapScripts::
# 3 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	.byte 0
# 4 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"

# 5 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
SaffronCity_MrPsychicsHouse_EventScript_MrPsychic::
# 6 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	lock
# 7 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	faceplayer
# 8 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	goto_if_set FLAG_GOT_TM29_FROM_MR_PSYCHIC, SaffronCity_MrPsychicsHouse_EventScript_AlreadyGotTM29
# 9 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	msgbox SaffronCity_MrPsychicsHouse_Text_YouWantedThis
# 10 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	checkitemspace ITEM_TM29
# 11 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	goto_if_eq VAR_RESULT, FALSE, SaffronCity_MrPsychicsHouse_EventScript_NoRoomForTM29
# 12 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	giveitem_msg SaffronCity_MrPsychicsHouse_Text_ReceivedTM29FromMrPsychic, ITEM_TM29
# 13 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	msgbox SaffronCity_MrPsychicsHouse_Text_ExplainTM29
# 14 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	setflag FLAG_GOT_TM29_FROM_MR_PSYCHIC
# 15 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	release
# 16 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	end
# 17 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"

# 18 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
SaffronCity_MrPsychicsHouse_EventScript_NoRoomForTM29::
# 19 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	msgbox SaffronCity_MrPsychicsHouse_Text_YouveNoRoom
# 20 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	release
# 21 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	end
# 22 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"

# 23 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
SaffronCity_MrPsychicsHouse_EventScript_AlreadyGotTM29::
# 24 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	msgbox SaffronCity_MrPsychicsHouse_Text_ExplainTM29
# 25 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	release
# 26 "data/maps/SaffronCity_MrPsychicsHouse/scripts.pory"
	end
