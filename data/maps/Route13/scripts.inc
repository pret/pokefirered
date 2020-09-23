Route13_MapScripts:: @ 81680B5
	.byte 0

Route13_EventScript_TrainerTips1:: @ 81680B6
	msgbox Route13_Text_LookToLeftOfThatPost, MSGBOX_SIGN
	end

Route13_EventScript_TrainerTips2:: @ 81680BF
	msgbox Route13_Text_SelectToSwitchItems, MSGBOX_SIGN
	end

Route13_EventScript_RouteSign:: @ 81680C8
	msgbox Route13_Text_RouteSign, MSGBOX_SIGN
	end

Script_Koga5_Badge_Gate:: 
		lock
		faceplayer
		msgbox Text_Koga5_Badge_Gate, MSGBOX_DEFAULT
		release
		end
		
Text_Koga5_Badge_Gate:
		.string "Hey beat it! Nobody can enter\n"
		.string "Route 12!$"
		
Script_Koga6_Badge_Gate:: 
		lock
		msgbox Text_Koga6_Badge_Gate, MSGBOX_DEFAULT
		release
		end
		
Text_Koga6_Badge_Gate:
		.string "Koga knows what he's doing!\n"
		.string "These Snorlax are dangerous and\l"
		.string "NEED to be taken care of!$"
		
Script_Koga7_Badge_Gate:: 
		lock
		goto_if_set FLAG_GOT_HM04 Script_HM04_Received
		msgbox Text_Koga7_Badge_Gate1, MSGBOX_DEFAULT
		faceplayer
		msgbox Text_Koga7_Badge_Gate2, MSGBOX_DEFAULT
		giveitem_msg ReceivedHM04FromSurge, ITEM_HM04
		setflag FLAG_GOT_HM04
		applymovement 13, Surge_Face_Down
		waitmovement 0
		release
		end
		
Script_HM04_Received::
	msgbox Text_Koga7_Badge_Gate1, MSGBOX_DEFAULT
	release
	end
		
Text_Koga7_Badge_Gate1:
		.string "Soldier, you are acting\n"
		.string "completely out of line and so is\l"
		.string "your superior.\p"
		.string "Route 12 is MY jurisdiction.\n"
		.string "Koga has NO authority here, \l"
		.string "is that clear?$"
		
Text_Koga7_Badge_Gate2:
		.string "Oh hey kid! I remember you!\n"
		.string "Kogas really been acting crazy\l"
		.string "huh?\p"
		.string "I'll give you the Strength to talk\n"
		.string "sense into him!$"
		
ReceivedHM04FromSurge::
    .string "{PLAYER} received HM04\n"
    .string "from the Lt. Surge.$"
	
Surge_Face_Down:
	face_down
	step_end