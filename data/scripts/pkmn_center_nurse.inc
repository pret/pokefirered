EventScript_PkmnCenterNurse:: @ 81A6578
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if eq, EventScript_1A7AE0
	message Text_WelcomeWantToHealPkmn
	waitmessage
	multichoice 19, 8, MULTICHOICE_YES_NO, FALSE | (TRUE << 1)
	switch VAR_RESULT
	case 0, EventScript_PkmnCenterNurse_HealPkmn
	case 1 EventScript_PkmnCenterNurse_Goodbye
	case SCR_MENU_CANCEL, EventScript_PkmnCenterNurse_Goodbye
	end

EventScript_PkmnCenterNurse_HealPkmn:: @ 81A65B8
	incrementgamestat GAME_STAT_USED_POKECENTER
	message Text_TakeYourPkmnForFewSeconds
	waitmessage
	call EventScript_PkmnCenterNurse_TakeAndHealPkmn
	special sub_80CC524
	goto EventScript_PkmnCenterNurse_CheckTrainerTowerAndUnionRoom
	end

EventScript_PkmnCenterNurse_TakeAndHealPkmn:: @ 81A65CE
	applymovement VAR_LAST_TALKED, Movement_WalkInPlaceFastestLeft
	waitmovement 0
	dofieldeffect FLDEFF_POKECENTER_HEAL
	waitfieldeffect FLDEFF_POKECENTER_HEAL
	applymovement VAR_LAST_TALKED, Movement_WalkInPlaceFastestDown
	waitmovement 0
	special sp000_heal_pokemon
	return

EventScript_PkmnCenterNurse_CheckTrainerTowerAndUnionRoom:: @ 81A65EC
	specialvar VAR_RESULT, Special_PlayerIsNotInTrainerTowerLobby
	compare VAR_RESULT, FALSE
	goto_if eq, EventScript_PkmnCenterNurse_ReturnPkmn
	specialvar VAR_RESULT, BufferUnionRoomPlayerName
	copyvar VAR_0x8008, VAR_RESULT
	compare VAR_0x8008, 0
	goto_if eq, EventScript_PkmnCenterNurse_ReturnPkmn
	compare VAR_0x8008, 1
	goto_if eq, EventScript_PkmnCenterNurse_PlayerWaitingInUionRoom
	end

EventScript_PkmnCenterNurse_ReturnPkmn:: @ 81A661D
	message Text_RestoredPkmnToFullHealth
	waitmessage
	applymovement VAR_LAST_TALKED, Movement_1A666C
	waitmovement 0
	msgbox Text_WeHopeToSeeYouAgain
	return

EventScript_PkmnCenterNurse_PlayerWaitingInUionRoom:: @ 81A6636
	checkflag FLAG_SYS_INFORMED_OF_LOCAL_WIRELESS_PLAYER
	goto_if TRUE, EventScript_PkmnCenterNurse_ReturnPkmn
	msgbox Text_RestoredPkmnToFullHealth
	setflag FLAG_SYS_INFORMED_OF_LOCAL_WIRELESS_PLAYER
	message Text_PlayerIsPlayingRightNowGoForIt
	waitmessage
	applymovement VAR_LAST_TALKED, Movement_1A666C
	waitmovement 0
	msgbox Text_WeHopeToSeeYouAgain
	return

EventScript_PkmnCenterNurse_Goodbye:: @ 81A6663
	msgbox Text_WeHopeToSeeYouAgain
	return

Movement_1A666C:: @ 81A666C
	nurse_joy_bow
	delay_4
	step_end
