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
	applymovement LOCALID_PEWTER_HOUSE_NIDORAN, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

PewterCity_House1_EventScript_DoNidoranCry::
	waitse
	playmoncry SPECIES_NIDORAN_M, CRY_MODE_NORMAL
	applymovement LOCALID_PEWTER_HOUSE_NIDORAN, Common_Movement_ExclamationMark
	waitmovement 0
	namebox	Name_Nidoran
	msgbox PewterCity_House1_Text_Nidoran
	closemessage
	waitmoncry
	return
