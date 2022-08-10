.set LOCALID_BALDING_MAN, 1

SevenIsland_SevaultCanyon_House_MapScripts::
	.byte 0

SevenIsland_SevaultCanyon_House_EventScript_BaldingMan::
	lock
	goto_if_set FLAG_TEMP_2, SevenIsland_SevaultCanyon_House_EventScript_AlreadyDanced
	playbgm MUS_SCHOOL, 0
	applymovement LOCALID_BALDING_MAN, SevenIsland_SevaultCanyon_House_Movement_ChanseyDance
	waitmovement 0
	fadedefaultbgm
	delay 30
	applymovement LOCALID_BALDING_MAN, Movement_FacePlayer
	waitmovement 0
	msgbox SevenIsland_SevaultCanyon_House_Text_ChanseyDanceJoinIn
	textcolor 3
	msgbox SevenIsland_SevaultCanyon_House_Text_WouldYouLikeToDance, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SevenIsland_SevaultCanyon_House_EventScript_DeclineDance
	msgbox SevenIsland_SevaultCanyon_House_Text_DancedChanseyDance
	closemessage
	call EventScript_RestorePrevTextColor
	compare VAR_FACING, DIR_SOUTH
	call_if_ne SevenIsland_SevaultCanyon_House_EventScript_PlayerFaceDown
	delay 30
	playbgm MUS_SCHOOL, 0
	applymovement OBJ_EVENT_ID_PLAYER, SevenIsland_SevaultCanyon_House_Movement_ChanseyDance
	waitmovement 0
	fadedefaultbgm
	delay 30
	call EventScript_OutOfCenterPartyHeal
	msgbox SevenIsland_SevaultCanyon_House_Text_YoureAllChipperNow
	setflag FLAG_TEMP_2
	release
	end

SevenIsland_SevaultCanyon_House_EventScript_PlayerFaceDown::
	applymovement OBJ_EVENT_ID_PLAYER, Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

SevenIsland_SevaultCanyon_House_EventScript_AlreadyDanced::
	applymovement LOCALID_BALDING_MAN, Movement_FacePlayer
	waitmovement 0
	msgbox SevenIsland_SevaultCanyon_House_Text_ChanseyDanceJoinIn
	release
	end

SevenIsland_SevaultCanyon_House_EventScript_DeclineDance::
	textcolor 0
	msgbox SevenIsland_SevaultCanyon_House_Text_ComeOnDance
	release
	end

SevenIsland_SevaultCanyon_House_Movement_ChanseyDance::
	walk_in_place_down
	delay_16
	walk_in_place_down
	delay_16
	walk_in_place_down
	delay_16
	walk_in_place_down
	delay_16
	walk_in_place_fastest_right
	delay_4
	walk_in_place_fastest_up
	delay_4
	walk_in_place_fastest_left
	delay_4
	walk_in_place_fastest_down
	delay_4
	step_end

SevenIsland_SevaultCanyon_House_EventScript_Chansey::
	lock
	faceplayer
	waitse
	playmoncry SPECIES_CHANSEY, CRY_MODE_NORMAL
	msgbox SevenIsland_SevaultCanyon_House_Text_Chansey
	waitmoncry
	release
	end
