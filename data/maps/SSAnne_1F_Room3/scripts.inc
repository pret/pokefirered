SSAnne_1F_Room3_MapScripts:: @ 8160C1D
	.byte 0

SSAnne_1F_Room3_EventScript_160C1E:: @ 8160C1E
	msgbox gUnknown_8173B21, 2
	end

SSAnne_1F_Room3_EventScript_160C27:: @ 8160C27
	msgbox gUnknown_8173AFA, 2
	end

SSAnne_1F_Room3_EventScript_160C30:: @ 8160C30
	lock
	faceplayer
	waitse
	playmoncry SPECIES_WIGGLYTUFF, 0
	msgbox gUnknown_8173B61
	waitmoncry
	release
	end
