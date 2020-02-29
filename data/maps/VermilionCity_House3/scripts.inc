VermilionCity_House3_MapScripts:: @ 816BAA9
	.byte 0

VermilionCity_House3_EventScript_Boy:: @ 816BAAA
	msgbox VermilionCity_House3_Text_PidgeyFlyLetterToSaffron, MSGBOX_NPC
	end

VermilionCity_House3_EventScript_Lass:: @ 816BAB3
	msgbox VermilionCity_House3_Text_SendMyPidgeyToUnionRoom, MSGBOX_NPC
	end

VermilionCity_House3_EventScript_Pidgey:: @ 816BABC
	lock
	faceplayer
	waitse
	playmoncry SPECIES_PIDGEY, 0
	msgbox VermilionCity_House3_Text_Pidgey
	waitmoncry
	release
	end

VermilionCity_House3_EventScript_Letter:: @ 816BACF
	msgbox VermilionCity_House3_Text_DearPippiLetter, MSGBOX_SIGN
	end
