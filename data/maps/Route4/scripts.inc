Route4_MapScripts::
	.byte 0

Route4_EventScript_Unused::
	end

Route4_EventScript_MtMoonSign::
	msgbox Route4_Text_MtMoonEntrance, MSGBOX_SIGN
	end

Route4_EventScript_RouteSign::
	msgbox Route4_Text_RouteSign, MSGBOX_SIGN
	end

Route4_EventScript_IfFindRareTakeToPewterMuseum::
	msgbox Route4_Text_IfFindRareTakeToPewterMuseum, MSGBOX_NPC
	end


Route4_EventScript_GeodudeHelpsClearLooseRocks::
	msgbox Route4_Text_GeodudeHelpsClearLooseRocks, MSGBOX_NPC
	end

Route4_EventScript_Geodude::
	faceplayer
	waitse
	applymovement LOCALID_ROUTE4_GEODUDE, Common_Movement_ExclamationMark
	waitmovement 0
	playmoncry SPECIES_GEODUDE, CRY_MODE_NORMAL
	namebox Name_Geodude
	msgbox Route4_Text_Geodude
	closemessage
	waitmoncry
	applymovement LOCALID_ROUTE4_GEODUDE, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end