SaffronCity_House2_MapScripts:: @ 816EF73
	.byte 0

SaffronCity_House2_EventScript_16EF74:: @ 816EF74
	msgbox gUnknown_819BE74, 2
	end

SaffronCity_House2_EventScript_16EF7D:: @ 816EF7D
	msgbox gUnknown_819BED5, 2
	end

SaffronCity_House2_EventScript_16EF86:: @ 816EF86
	lock
	faceplayer
	waitse
	playmoncry SPECIES_PIDGEY, 0
	msgbox gUnknown_819BEC3
	waitmoncry
	release
	end

SaffronCity_House2_EventScript_16EF99:: @ 816EF99
	msgbox gUnknown_819BF07, 3
	end
