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

Route2_EventScript_Policia::
	msgbox Route2_Text_Policia, MSGBOX_NPC
	end

Route2_EventScript_Adolescente::
	msgbox Route2_Text_Adolescente, MSGBOX_NPC
	end

Route2_EventScript_DiglettsCaveSign::
	msgbox Route2_Text_DiglettsCave, MSGBOX_SIGN
	end

Route2_EventScript_EntrenadorDamian::
	trainerbattle_single TRAINER_DAMIAN, Route2_Text_EntrenadorDamian1, Route2_Text_EntrenadorDamian2
	msgbox Route2_Text_EntrenadorDamian3, MSGBOX_AUTOCLOSE
	end
