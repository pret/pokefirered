SSAnne_B1F_Room5_MapScripts:: @ 8160DD5
	.byte 0

SSAnne_B1F_Room5_EventScript_160DD6:: @ 8160DD6
	loadword 0, gUnknown_81743F8
	callstd 2
	end

SSAnne_B1F_Room5_EventScript_160DDF:: @ 8160DDF
	lock
	faceplayer
	waitse
	playmoncry SPECIES_MACHOKE, 0
	loadword 0, gUnknown_8174444
	callstd 4
	waitmoncry
	release
	end
