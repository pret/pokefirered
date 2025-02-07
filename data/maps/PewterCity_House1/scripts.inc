# 1 "data/maps/PewterCity_House1/scripts.pory"

# 2 "data/maps/PewterCity_House1/scripts.pory"
.set LOCALID_NIDORAN, 3
# 3 "data/maps/PewterCity_House1/scripts.pory"

# 4 "data/maps/PewterCity_House1/scripts.pory"
PewterCity_House1_MapScripts::
# 5 "data/maps/PewterCity_House1/scripts.pory"
	.byte 0
# 6 "data/maps/PewterCity_House1/scripts.pory"

# 7 "data/maps/PewterCity_House1/scripts.pory"
PewterCity_House1_EventScript_BaldingMan::
# 8 "data/maps/PewterCity_House1/scripts.pory"
	msgbox PewterCity_House1_Text_TradeMonsAreFinicky, MSGBOX_NPC
# 9 "data/maps/PewterCity_House1/scripts.pory"
	end
# 10 "data/maps/PewterCity_House1/scripts.pory"

# 11 "data/maps/PewterCity_House1/scripts.pory"
PewterCity_House1_EventScript_LittleBoy::
# 12 "data/maps/PewterCity_House1/scripts.pory"
	lock
# 13 "data/maps/PewterCity_House1/scripts.pory"
	msgbox PewterCity_House1_Text_NidoranSit
# 14 "data/maps/PewterCity_House1/scripts.pory"
	call PewterCity_House1_EventScript_DoNidoranCry
# 15 "data/maps/PewterCity_House1/scripts.pory"
	release
# 16 "data/maps/PewterCity_House1/scripts.pory"
	end
# 17 "data/maps/PewterCity_House1/scripts.pory"

# 18 "data/maps/PewterCity_House1/scripts.pory"
PewterCity_House1_EventScript_Nidoran::
# 19 "data/maps/PewterCity_House1/scripts.pory"
	lock
# 20 "data/maps/PewterCity_House1/scripts.pory"
	faceplayer
# 21 "data/maps/PewterCity_House1/scripts.pory"
	call PewterCity_House1_EventScript_DoNidoranCry
# 22 "data/maps/PewterCity_House1/scripts.pory"
	applymovement LOCALID_NIDORAN, Common_Movement_FaceOriginalDirection
# 23 "data/maps/PewterCity_House1/scripts.pory"
	waitmovement 0
# 24 "data/maps/PewterCity_House1/scripts.pory"
	release
# 25 "data/maps/PewterCity_House1/scripts.pory"
	end
# 26 "data/maps/PewterCity_House1/scripts.pory"

# 27 "data/maps/PewterCity_House1/scripts.pory"
PewterCity_House1_EventScript_DoNidoranCry::
# 28 "data/maps/PewterCity_House1/scripts.pory"
	textcolor NPC_TEXT_COLOR_NEUTRAL
# 29 "data/maps/PewterCity_House1/scripts.pory"
	waitse
# 30 "data/maps/PewterCity_House1/scripts.pory"
	playmoncry SPECIES_NIDORAN_M, CRY_MODE_NORMAL
# 31 "data/maps/PewterCity_House1/scripts.pory"
	msgbox PewterCity_House1_Text_Nidoran
# 32 "data/maps/PewterCity_House1/scripts.pory"
	waitmoncry
# 33 "data/maps/PewterCity_House1/scripts.pory"
	call EventScript_RestorePrevTextColor
# 34 "data/maps/PewterCity_House1/scripts.pory"
	return
