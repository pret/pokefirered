PalletTown_PlayersHouse_2F_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, PalletTown_PlayersHouse_2F_OnTransition
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, PalletTown_PlayersHouse_2F_OnWarp
	.byte 0

PalletTown_PlayersHouse_2F_OnTransition::
	call_if_eq VAR_MAP_SCENE_PALLET_TOWN_PLAYERS_HOUSE_2F, 0, PalletTown_PlayersHouse_2F_EventScript_SetRespawn
	end

PalletTown_PlayersHouse_2F_EventScript_SetRespawn::
	setrespawn SPAWN_PALLET_TOWN
	return

PalletTown_PlayersHouse_2F_OnWarp::
	map_script_2 VAR_MAP_SCENE_PALLET_TOWN_PLAYERS_HOUSE_2F, 0, PalletTown_PlayersHouse_2F_FirstWarpIn
	.2byte 0

PalletTown_PlayersHouse_2F_FirstWarpIn::
	turnobject OBJ_EVENT_ID_PLAYER, DIR_NORTH
	setvar VAR_MAP_SCENE_PALLET_TOWN_PLAYERS_HOUSE_2F, 1
	end

PalletTown_PlayersHouse_2F_EventScript_NES::	
	msgbox PalletTown_PlayersHouse_2F_Text_PlayedWithNES, MSGBOX_SIGN
	end

PalletTown_OaksHouse_EventScript_Regalo::
	lock
	faceplayer
	goto_if_set FLAG_0x0B3, PalletTown_OaksHouse_EventScript_RegaloEntregado
	setflag FLAG_0x0B3
	random 3
	copyvar VAR_0x8008, VAR_RESULT
	call_if_eq VAR_0x8008, 0, PalletTown_OaksHouse_EventScript_RegaloGrimer
	call_if_eq VAR_0x8008, 1, PalletTown_OaksHouse_EventScript_RegaloGrowlithe
	call_if_eq VAR_0x8008, 2, PalletTown_OaksHouse_EventScript_RegaloTauros
	release
	end


PalletTown_OaksHouse_EventScript_RegaloGrimer::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PalletTown_OaksHouse_Text_EventScript_Regalo
	setflag FLAG_SYS_POKEMON_GET
	givemon SPECIES_NIDORAN_M, 100
	playfanfare MUS_LEVEL_UP
	signmsg
	message PalletTown_OaksHouse_EventScript_Regalo_Entrega
	waitmessage
	normalmsg
	waitfanfare
	bufferspeciesname STR_VAR_1, SPECIES_NIDORAN_M
	msgbox Text_GiveNicknameToThisMon, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, CeladonCity_Condominiums_RoofRoom_EventScript_SetGotEevee
	call EventScript_GetGiftMonPartySlot
	call EventScript_ChangePokemonNickname
	msgbox PalletTown_OaksHouse_EventScript_Regalo_MsgEntregado
	return

PalletTown_OaksHouse_EventScript_RegaloGrowlithe::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PalletTown_OaksHouse_Text_EventScript_Regalo
	setflag FLAG_SYS_POKEMON_GET
	givemon SPECIES_NIDORAN_M, 100
	playfanfare MUS_LEVEL_UP
	signmsg
	message PalletTown_OaksHouse_EventScript_Regalo_Entrega
	waitmessage
	normalmsg
	waitfanfare
	bufferspeciesname STR_VAR_1, SPECIES_NIDORAN_M
	msgbox Text_GiveNicknameToThisMon, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, CeladonCity_Condominiums_RoofRoom_EventScript_SetGotEevee
	call EventScript_GetGiftMonPartySlot
	call EventScript_ChangePokemonNickname
	msgbox PalletTown_OaksHouse_EventScript_Regalo_MsgEntregado
	return

PalletTown_OaksHouse_EventScript_RegaloTauros::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PalletTown_OaksHouse_Text_EventScript_Regalo
	setflag FLAG_SYS_POKEMON_GET
	givemon SPECIES_NIDORAN_M, 100
	playfanfare MUS_LEVEL_UP
	signmsg
	message PalletTown_OaksHouse_EventScript_Regalo_Entrega	
	waitmessage
	normalmsg
	waitfanfare
	bufferspeciesname STR_VAR_1, SPECIES_NIDORAN_M
	msgbox Text_GiveNicknameToThisMon, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, CeladonCity_Condominiums_RoofRoom_EventScript_SetGotEevee
	call EventScript_GetGiftMonPartySlot
	call EventScript_ChangePokemonNickname
	msgbox PalletTown_OaksHouse_EventScript_Regalo_MsgEntregado
	return



PalletTown_OaksHouse_EventScript_RegaloEntregado::
	textcolor NPC_TEXT_COLOR_NEUTRAL
	msgbox PalletTown_OaksHouse_EventScript_Regalo_MsgEntregado
	release
	end


PalletTown_PlayersHouse_2F_EventScript_Sign::
	msgbox PalletTown_PlayersHouse_2F_Text_PressLRForHelp, MSGBOX_SIGN
	end

PalletTown_PlayersHouse_2F_EventScript_PC::
	goto_if_questlog EventScript_ReleaseEnd
	lockall
	setvar VAR_0x8004, HELPCONTEXT_BEDROOM_PC
	special Script_SetHelpContext
	setvar VAR_0x8004, 1
	special AnimatePcTurnOn
	playse SE_PC_ON
	msgbox Text_PlayerBootedUpPC
	special BedroomPC
	waitstate
	special SetHelpContextForMap
	releaseall
	end

EventScript_PalletTown_PlayersHouse_2F_ShutDownPC::
	setvar VAR_0x8004, 1
	playse SE_PC_OFF
	special AnimatePcTurnOff
	special SetHelpContextForMap
	releaseall
	end

PuebloPaleta_CasaPlayer_2P_PC::
	goto PalletTown_PlayersHouse_2F_EventScript_PC
	releaseall
	end
