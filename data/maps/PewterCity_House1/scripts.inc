.set LOCALID_NIDORAN, 3

PewterCity_House1_MapScripts:: @ 816A71C
	.byte 0

PewterCity_House1_EventScript_BaldingMan:: @ 816A71D
	msgbox PewterCity_House1_Text_TradeMonsAreFinicky, MSGBOX_NPC
	end

PewterCity_House1_EventScript_LittleBoy:: @ 816A726
	lock
	msgbox PewterCity_House1_Text_NidoranSit
	call PewterCity_House1_EventScript_DoNidoranCry
	release
	end

PewterCity_House1_EventScript_Nidoran:: @ 816A736
	lock
	faceplayer
	call PewterCity_House1_EventScript_DoNidoranCry
	applymovement LOCALID_NIDORAN, Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

PewterCity_House1_EventScript_DoNidoranCry:: @ 816A749
	textcolor 3
	waitse
	playmoncry SPECIES_NIDORAN_M, 0
	msgbox PewterCity_House1_Text_Nidoran
	waitmoncry
	call EventScript_RestorePrevTextColor
	return
