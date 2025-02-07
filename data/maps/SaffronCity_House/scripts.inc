# 1 "data/maps/SaffronCity_House/scripts.pory"

# 2 "data/maps/SaffronCity_House/scripts.pory"
SaffronCity_House_MapScripts::
# 3 "data/maps/SaffronCity_House/scripts.pory"
	.byte 0
# 4 "data/maps/SaffronCity_House/scripts.pory"

# 5 "data/maps/SaffronCity_House/scripts.pory"
SaffronCity_House_EventScript_Lass::
# 6 "data/maps/SaffronCity_House/scripts.pory"
	msgbox SaffronCity_House_Text_DontLookAtMyLetter, MSGBOX_NPC
# 7 "data/maps/SaffronCity_House/scripts.pory"
	end
# 8 "data/maps/SaffronCity_House/scripts.pory"

# 9 "data/maps/SaffronCity_House/scripts.pory"
SaffronCity_House_EventScript_Youngster::
# 10 "data/maps/SaffronCity_House/scripts.pory"
	msgbox SaffronCity_House_Text_GettingCopycatPokeDoll, MSGBOX_NPC
# 11 "data/maps/SaffronCity_House/scripts.pory"
	end
# 12 "data/maps/SaffronCity_House/scripts.pory"

# 13 "data/maps/SaffronCity_House/scripts.pory"
SaffronCity_House_EventScript_Pidgey::
# 14 "data/maps/SaffronCity_House/scripts.pory"
	lock
# 15 "data/maps/SaffronCity_House/scripts.pory"
	faceplayer
# 16 "data/maps/SaffronCity_House/scripts.pory"
	waitse
# 17 "data/maps/SaffronCity_House/scripts.pory"
	playmoncry SPECIES_PIDGEY, CRY_MODE_NORMAL
# 18 "data/maps/SaffronCity_House/scripts.pory"
	msgbox SaffronCity_House_Text_Pidgey
# 19 "data/maps/SaffronCity_House/scripts.pory"
	waitmoncry
# 20 "data/maps/SaffronCity_House/scripts.pory"
	release
# 21 "data/maps/SaffronCity_House/scripts.pory"
	end
# 22 "data/maps/SaffronCity_House/scripts.pory"

# 23 "data/maps/SaffronCity_House/scripts.pory"
SaffronCity_House_EventScript_Letter::
# 24 "data/maps/SaffronCity_House/scripts.pory"
	msgbox SaffronCity_House_Text_ExplainPPUp, MSGBOX_SIGN
# 25 "data/maps/SaffronCity_House/scripts.pory"
	end
