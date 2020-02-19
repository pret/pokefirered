Route12_NorthEntrance_2F_MapScripts:: @ 816FE77
	.byte 0

Route12_NorthEntrance_2F_EventScript_LeftBinoculars:: @ 816FE78
	msgbox Route12_NorthEntrance_2F_Text_TheresManFishing, MSGBOX_SIGN
	end

Route12_NorthEntrance_2F_EventScript_RightBinoculars:: @ 816FE81
	msgbox Route12_NorthEntrance_2F_Text_ItsPokemonTower, MSGBOX_SIGN
	end

Route12_NorthEntrance_2F_EventScript_Lass:: @ 816FE8A
	lock
	faceplayer
	goto_if_set FLAG_GOT_TM27, Route12_NorthEntrance_2F_EventScript_ExplainTM27
	checkplayergender
	compare VAR_RESULT, MALE
	call_if_eq Route12_NorthEntrance_2F_EventScript_TakeTMMale
	compare VAR_RESULT, FEMALE
	call_if_eq Route12_NorthEntrance_2F_EventScript_TakeTMFemale
	checkitemspace ITEM_TM27, 1
	compare VAR_RESULT, FALSE
	goto_if_eq Route12_NorthEntrance_2F_EventScript_NoRoomForTM27
	giveitem_msg Route12_NorthEntrance_2F_Text_ReceivedTM27FromLittleGirl, ITEM_TM27
	msgbox Route12_NorthEntrance_2F_Text_ExplainTM27
	setflag FLAG_GOT_TM27
	release
	end

Route12_NorthEntrance_2F_EventScript_TakeTMMale:: @ 816FEE5
	msgbox Route12_NorthEntrance_2F_Text_TakeTMDontNeedAnymoreMale
	return

Route12_NorthEntrance_2F_EventScript_TakeTMFemale:: @ 816FEEE
	msgbox Route12_NorthEntrance_2F_Text_TakeTMDontNeedAnymoreFemale
	return

Route12_NorthEntrance_2F_EventScript_NoRoomForTM27:: @ 816FEF7
	msgbox Route12_NorthEntrance_2F_Text_DontHaveRoomForThis
	release
	end

Route12_NorthEntrance_2F_EventScript_ExplainTM27:: @ 816FF01
	msgbox Route12_NorthEntrance_2F_Text_ExplainTM27
	release
	end
