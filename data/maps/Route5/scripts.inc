Route5_MapScripts:: @ 8167FA7
	.byte 0

Route5_EventScript_UndergroundPathSign:: @ 8167FA8
	msgbox Route5_Text_UndergroundPathSign, MSGBOX_SIGN
	end

Daycare_Sign1::
	msgbox Daycare_Sign1_Text, MSGBOX_SIGN
	end

Daycare_Sign1_Text:
	.string "We're on vacation!\n"
	.string "For emergencies please refer to\l"
	.string "our partner day care on Four\l"
	.string "Island!$"