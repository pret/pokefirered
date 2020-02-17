SaffronCity_House_MapScripts:: @ 816EF73
	.byte 0

SaffronCity_House_EventScript_Lass:: @ 816EF74
	msgbox SaffronCity_House_Text_DontLookAtMyLetter, MSGBOX_NPC
	end

SaffronCity_House_EventScript_Youngster:: @ 816EF7D
	msgbox SaffronCity_House_Text_GettingCopycatPokeDoll, MSGBOX_NPC
	end

SaffronCity_House_EventScript_Pidgey:: @ 816EF86
	lock
	faceplayer
	waitse
	playmoncry SPECIES_PIDGEY, 0
	msgbox SaffronCity_House_Text_Pidgey
	waitmoncry
	release
	end

SaffronCity_House_EventScript_Letter:: @ 816EF99
	msgbox SaffronCity_House_Text_ExplainPPUp, MSGBOX_SIGN
	end
