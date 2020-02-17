SSAnne_B1F_Room5_MapScripts:: @ 8160DD5
	.byte 0

SSAnne_B1F_Room5_EventScript_Boy:: @ 8160DD6
	msgbox SSAnne_B1F_Room5_Text_MachokeHasStrengthToMoveRocks, MSGBOX_NPC
	end

SSAnne_B1F_Room5_EventScript_Machoke:: @ 8160DDF
	lock
	faceplayer
	waitse
	playmoncry SPECIES_MACHOKE, 0
	msgbox SSAnne_B1F_Room5_Text_Machoke
	waitmoncry
	release
	end
