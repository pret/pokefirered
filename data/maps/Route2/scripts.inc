Route2_MapScripts::
	.byte 0

Route2_EventScript_RouteSign::
	msgbox Route2_Text_RouteSign, MSGBOX_SIGN
	end

Route2_EventScript_RouteSign2::
	msgbox Route2_Text_RouteSign2, MSGBOX_SIGN
	end

Route2_EventScript_RouteSign3::
	msgbox Route2_Text_RouteSign3, MSGBOX_SIGN
	end

Route2_EventScript_RouteSign4::
	msgbox Route2_Text_RouteSign4, MSGBOX_SIGN
	end

Route2_EventScript_Police::
	msgbox Route2_Text_Police, MSGBOX_NPC
	end

Route2_EventScript_Girl::
	msgbox Route2_Text_Girl, MSGBOX_NPC
	end

Route2_EventScript_DiglettsCaveSign::
	msgbox Route2_Text_DiglettsCave, MSGBOX_SIGN
	end

Route2_EventScript_TrainerFidel::
	trainerbattle_single TRAINER_GENTLEMAN_FIDEL, Route2_EventScript_TrainerFidelIntro, Route2_EventScript_TrainerFidelDefeat
	msgbox Route2_EventScript_TrainerFidelPostBattle, MSGBOX_AUTOCLOSE
	end
