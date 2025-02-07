# 1 "data/maps/VermilionCity_House3/scripts.pory"

# 2 "data/maps/VermilionCity_House3/scripts.pory"
VermilionCity_House3_MapScripts::
# 3 "data/maps/VermilionCity_House3/scripts.pory"
	.byte 0
# 4 "data/maps/VermilionCity_House3/scripts.pory"

# 5 "data/maps/VermilionCity_House3/scripts.pory"
VermilionCity_House3_EventScript_Boy::
# 6 "data/maps/VermilionCity_House3/scripts.pory"
	msgbox VermilionCity_House3_Text_PidgeyFlyLetterToSaffron, MSGBOX_NPC
# 7 "data/maps/VermilionCity_House3/scripts.pory"
	end
# 8 "data/maps/VermilionCity_House3/scripts.pory"

# 9 "data/maps/VermilionCity_House3/scripts.pory"
VermilionCity_House3_EventScript_Lass::
# 10 "data/maps/VermilionCity_House3/scripts.pory"
	msgbox VermilionCity_House3_Text_SendMyPidgeyToUnionRoom, MSGBOX_NPC
# 11 "data/maps/VermilionCity_House3/scripts.pory"
	end
# 12 "data/maps/VermilionCity_House3/scripts.pory"

# 13 "data/maps/VermilionCity_House3/scripts.pory"
VermilionCity_House3_EventScript_Pidgey::
# 14 "data/maps/VermilionCity_House3/scripts.pory"
	lock
# 15 "data/maps/VermilionCity_House3/scripts.pory"
	faceplayer
# 16 "data/maps/VermilionCity_House3/scripts.pory"
	waitse
# 17 "data/maps/VermilionCity_House3/scripts.pory"
	playmoncry SPECIES_PIDGEY, CRY_MODE_NORMAL
# 18 "data/maps/VermilionCity_House3/scripts.pory"
	msgbox VermilionCity_House3_Text_Pidgey
# 19 "data/maps/VermilionCity_House3/scripts.pory"
	waitmoncry
# 20 "data/maps/VermilionCity_House3/scripts.pory"
	release
# 21 "data/maps/VermilionCity_House3/scripts.pory"
	end
# 22 "data/maps/VermilionCity_House3/scripts.pory"

# 23 "data/maps/VermilionCity_House3/scripts.pory"
VermilionCity_House3_EventScript_Letter::
# 24 "data/maps/VermilionCity_House3/scripts.pory"
	msgbox VermilionCity_House3_Text_DearPippiLetter, MSGBOX_SIGN
# 25 "data/maps/VermilionCity_House3/scripts.pory"
	end
