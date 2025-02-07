# 1 "data/maps/CeruleanCity_House2/scripts.pory"

# 2 "data/maps/CeruleanCity_House2/scripts.pory"
CeruleanCity_House2_MapScripts::
# 3 "data/maps/CeruleanCity_House2/scripts.pory"
	.byte 0
# 4 "data/maps/CeruleanCity_House2/scripts.pory"

# 5 "data/maps/CeruleanCity_House2/scripts.pory"
CeruleanCity_House2_EventScript_Hiker::
# 6 "data/maps/CeruleanCity_House2/scripts.pory"
	lock
# 7 "data/maps/CeruleanCity_House2/scripts.pory"
	faceplayer
# 8 "data/maps/CeruleanCity_House2/scripts.pory"
	goto_if_set FLAG_GOT_TM28_FROM_ROCKET, CeruleanCity_House2_EventScript_HikerGotTM28
# 9 "data/maps/CeruleanCity_House2/scripts.pory"
	msgbox CeruleanCity_House2_Text_RocketsStoleTMForDig
# 10 "data/maps/CeruleanCity_House2/scripts.pory"
	release
# 11 "data/maps/CeruleanCity_House2/scripts.pory"
	end
# 12 "data/maps/CeruleanCity_House2/scripts.pory"

# 13 "data/maps/CeruleanCity_House2/scripts.pory"
CeruleanCity_House2_EventScript_HikerGotTM28::
# 14 "data/maps/CeruleanCity_House2/scripts.pory"
	msgbox CeruleanCity_House2_Text_TeachDiglettDigWithoutTM
# 15 "data/maps/CeruleanCity_House2/scripts.pory"
	release
# 16 "data/maps/CeruleanCity_House2/scripts.pory"
	end
# 17 "data/maps/CeruleanCity_House2/scripts.pory"

# 18 "data/maps/CeruleanCity_House2/scripts.pory"
CeruleanCity_House2_EventScript_Lass::
# 19 "data/maps/CeruleanCity_House2/scripts.pory"
	msgbox CeruleanCity_House2_Text_TeamRocketTryingToDigIntoNoGood, MSGBOX_NPC
# 20 "data/maps/CeruleanCity_House2/scripts.pory"
	end
# 21 "data/maps/CeruleanCity_House2/scripts.pory"

# 22 "data/maps/CeruleanCity_House2/scripts.pory"
CeruleanCity_House2_EventScript_WallHole::
# 23 "data/maps/CeruleanCity_House2/scripts.pory"
	msgbox CeruleanCity_House2_Text_TeamRocketLeftWayOut, MSGBOX_SIGN
# 24 "data/maps/CeruleanCity_House2/scripts.pory"
	end
