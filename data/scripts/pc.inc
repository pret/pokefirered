EventScript_PC:: @ 81A6955
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lockall
	goto_if_set FLAG_SYS_PC_STORAGE_DISABLED, EventScript_PCDisabled
	setvar VAR_0x8004, 27
	special Special_SetSomeVariable
	setvar VAR_0x8004, 0
	special Special_AnimatePcTurnOn
	playse SE_PC_ON
	msgbox Text_BootedUpPC
	goto EventScript_PCMainMenu
	end

EventScript_PCDisabled:: @ 81A698E
	msgbox Text_UsualPCServicesUnavailable
	releaseall
	end

EventScript_PCMainMenu:: @ 81A6998
	message Text_AccessWhichPC
	waitmessage
	special ScrSpecial_CreatePCMenu
	waitstate
	goto EventScript_ChoosePCMenu
	end

EventScript_ChoosePCMenu:: @ 81A69A8
	switch VAR_RESULT
	case 0, EventScript_AccessPokemonStorage
	case 1, EventScript_AccessPlayersPC
	case 2, EventScript_AccessProfOaksPC
	case 3, EventScript_1A6A56
	case 4, EventScript_1A6A46
	case SCR_MENU_CANCEL, EventScript_1A6A46
	end

EventScript_AccessPlayersPC:: @ 81A69F0
	playse SE_PC_LOGIN
	msgbox Text_AccessedPlayersPC
	special PlayerPC
	waitstate
	goto EventScript_PCMainMenu
	end

EventScript_AccessPokemonStorage:: @ 81A6A05
	playse SE_PC_LOGIN
	call_if_unset FLAG_SYS_NOT_SOMEONES_PC, EventScript_1A6A34
	call_if_set FLAG_SYS_NOT_SOMEONES_PC, EventScript_1A6A3D
	msgbox Text_OpenedPkmnStorage
	special ShowPokemonStorageSystem
	waitstate
	setvar VAR_0x8004, 27
	special Special_SetSomeVariable
	goto EventScript_PCMainMenu
	end

EventScript_1A6A34:: @ 81A6A34
	msgbox Text_AccessedSomeonesPC
	return

EventScript_1A6A3D:: @ 81A6A3D
	msgbox Text_AccessedBillsPC
	return

EventScript_1A6A46:: @ 81A6A46
	setvar VAR_0x8004, 0
	playse SE_PC_OFF
	special Special_AnimatePcTurnOff
	special sub_812B35C
	releaseall
	end

EventScript_1A6A56:: @ 81A6A56
	goto_if_unset FLAG_SYS_GAME_CLEAR, EventScript_1A6A46
	playse SE_PC_LOGIN
	setvar VAR_0x8004, 31
	special HelpSystem_BackupSomeVariable
	special Special_SetSomeVariable
	special HallOfFamePCBeginFade
	waitstate
	special HelpSystem_RestoreSomeVariable
	goto EventScript_ChoosePCMenu
	end

EventScript_AccessProfOaksPC:: @ 81A6A7A
	goto_if_unset FLAG_SYS_POKEDEX_GET, EventScript_1A6A46
	playse SE_PC_LOGIN
	msgbox Text_AccessedProfOaksPC
	msgbox Text_HavePokedexRated, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_ExitOaksPC
	setflag FLAG_OAKS_RATING_IS_VIA_PC
	call EventScript_1A73E0
	clearflag FLAG_OAKS_RATING_IS_VIA_PC
	goto EventScript_ExitOaksPC
	end

EventScript_ExitOaksPC:: @ 81A6AB2
	msgbox Text_ClosedLinkToProfOaksPC
	goto EventScript_PCMainMenu
	end
