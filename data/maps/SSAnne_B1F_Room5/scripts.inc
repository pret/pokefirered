SSAnne_B1F_Room5_MapScripts:: @ 8160DD5
	.byte 0

SSAnne_B1F_Room5_EventScript_160DD6:: @ 8160DD6
	msgbox gUnknown_81743F8, MSGBOX_NPC
	end

SSAnne_B1F_Room5_EventScript_160DDF:: @ 8160DDF
	lock
	faceplayer
	waitse
	playmoncry SPECIES_MACHOKE, 0
	msgbox gUnknown_8174444
	waitmoncry
	release
	end
