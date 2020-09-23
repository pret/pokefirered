Route9_MapScripts:: @ 8167FCF
	.byte 0

Route9_EventScript_RouteSign:: @ 8167FD0
	msgbox Route9_Text_RouteSign, MSGBOX_SIGN
	end

Script_Surge_Badge_Gate:: 
		lock
		faceplayer
		msgbox Text_Surge_Badge_Gate, MSGBOX_DEFAULT
		release
		end
		
Text_Surge_Badge_Gate:
	.string "Hey, so sorry to bother you.\n"
	.string "My husband Surge has been feeling\l"
	.string "a little insecure lately.\p"
	.string "Trainers challenging the Pokemon\n"
	.string "League always skip his gym.\p"
	.string "Maybe you could help build his\n"
	.string "confidence by fighting him first?\l"
	.string "He really needs it right now.$"