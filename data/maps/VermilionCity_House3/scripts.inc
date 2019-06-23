VermilionCity_House3_MapScripts:: @ 816BAA9
	.byte 0

VermilionCity_House3_EventScript_16BAAA:: @ 816BAAA
	msgbox gUnknown_81953AF, 2
	end

VermilionCity_House3_EventScript_16BAB3:: @ 816BAB3
	msgbox gUnknown_8195471, 2
	end

VermilionCity_House3_EventScript_16BABC:: @ 816BABC
	lock
	faceplayer
	waitse
	playmoncry SPECIES_PIDGEY, 0
	msgbox gUnknown_81953EE
	waitmoncry
	release
	end

VermilionCity_House3_EventScript_16BACF:: @ 816BACF
	msgbox gUnknown_8195400, 3
	end
