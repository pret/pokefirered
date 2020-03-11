EventScript_PC:: @ 81A6955
	goto_if_questlog EventScript_ReleaseEnd
	lockall
	goto_if_set FLAG_SYS_PC_STORAGE_DISABLED, EventScript_PCDisabled
	setvar VAR_0x8004, HELPCONTEXT_PC
	special Script_SetHelpContext
	setvar VAR_0x8004, 0
	special AnimatePcTurnOn
	playse SE_PC_ON
	msgbox Text_BootedUpPC
	goto EventScript_PCMainMenu
	end

@ For when the player first arrives on One Island
EventScript_PCDisabled:: @ 81A698E
	msgbox OneIsland_PokemonCenter_1F_Text_UsualPCServicesUnavailable
	releaseall
	end

EventScript_PCMainMenu:: @ 81A6998
	message Text_AccessWhichPC
	waitmessage
	special CreatePCMenu
	waitstate
	goto EventScript_ChoosePCMenu
	end

EventScript_ChoosePCMenu:: @ 81A69A8
	switch VAR_RESULT
	case 0, EventScript_AccessPokemonStorage
	case 1, EventScript_AccessPlayersPC
	case 2, EventScript_AccessProfOaksPC
	case 3, EventScript_AccessHallOfFame
	case 4, EventScript_TurnOffPC
	case SCR_MENU_CANCEL, EventScript_TurnOffPC
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
	call_if_unset FLAG_SYS_NOT_SOMEONES_PC, EventScript_AccessSomeonesPC
	call_if_set FLAG_SYS_NOT_SOMEONES_PC, EventScript_AccessBillsPC
	msgbox Text_OpenedPkmnStorage
	special ShowPokemonStorageSystemPC
	waitstate
	setvar VAR_0x8004, HELPCONTEXT_PC
	special Script_SetHelpContext
	goto EventScript_PCMainMenu
	end

EventScript_AccessSomeonesPC:: @ 81A6A34
	msgbox Text_AccessedSomeonesPC
	return

EventScript_AccessBillsPC:: @ 81A6A3D
	msgbox Text_AccessedBillsPC
	return

EventScript_TurnOffPC:: @ 81A6A46
	setvar VAR_0x8004, 0
	playse SE_PC_OFF
	special AnimatePcTurnOff
	special SetHelpContextForMap
	releaseall
	end

EventScript_AccessHallOfFame:: @ 81A6A56
	goto_if_unset FLAG_SYS_GAME_CLEAR, EventScript_TurnOffPC
	playse SE_PC_LOGIN
	setvar VAR_0x8004, HELPCONTEXT_PC_MISC
	special BackupHelpContext
	special Script_SetHelpContext
	special HallOfFamePCBeginFade
	waitstate
	special RestoreHelpContext
	goto EventScript_ChoosePCMenu
	end

EventScript_AccessProfOaksPC:: @ 81A6A7A
	goto_if_unset FLAG_SYS_POKEDEX_GET, EventScript_TurnOffPC
	playse SE_PC_LOGIN
	msgbox Text_AccessedProfOaksPC
	msgbox Text_HavePokedexRated, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_ExitOaksPC
	setflag FLAG_OAKS_RATING_IS_VIA_PC
	call PokedexRating_EventScript_Rate
	clearflag FLAG_OAKS_RATING_IS_VIA_PC
	goto EventScript_ExitOaksPC
	end

EventScript_ExitOaksPC:: @ 81A6AB2
	msgbox Text_ClosedLinkToProfOaksPC
	goto EventScript_PCMainMenu
	end
