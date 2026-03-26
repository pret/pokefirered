.set LOCALID_NIDORAN, 3

PewterCity_House1_MapScripts::
	.byte 0

PewterCity_House1_EventScript_BaldingMan::
	msgbox PewterCity_House1_Text_TradeMonsAreFinicky, MSGBOX_NPC
	end

PewterCity_House1_EventScript_LittleBoy::
	lock
	msgbox PewterCity_House1_Text_NidoranSit
	call PewterCity_House1_EventScript_DoNidoranCry
	release
	end

PewterCity_House1_EventScript_Nidoran::
	lock
	faceplayer
	call PewterCity_House1_EventScript_DoNidoranCry
	applymovement LOCALID_NIDORAN, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

PewterCity_House1_EventScript_DoNidoranCry::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	waitse
	playmoncry SPECIES_NIDORAN_M, CRY_MODE_NORMAL
	msgbox PewterCity_House1_Text_Nidoran
	waitmoncry
	call EventScript_RestorePrevTextColor
	return
