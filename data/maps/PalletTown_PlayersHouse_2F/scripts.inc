PalletTown_PlayersHouse_2F_MapScripts:: @ 8168CA3
	map_script MAP_SCRIPT_ON_TRANSITION, PalletTown_PlayersHouse_2F_OnTransition
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, PalletTown_PlayersHouse_2F_OnWarp
	.byte 0

PalletTown_PlayersHouse_2F_OnTransition:: @ 8168CAE
	compare VAR_MAP_SCENE_PALLET_TOWN_PLAYERS_HOUSE_2F, 0
	call_if_eq EventScript_168CBA
	end

EventScript_168CBA:: @ 8168CBA
	setrespawn SPAWN_PALLET_TOWN
	return

PalletTown_PlayersHouse_2F_OnWarp:: @ 8168CBE
	map_script_2 VAR_MAP_SCENE_PALLET_TOWN_PLAYERS_HOUSE_2F, 0, EventScript_168CC8
	.2byte 0

EventScript_168CC8:: @ 8168CC8
	turnobject OBJ_EVENT_ID_PLAYER, DIR_NORTH
	setvar VAR_MAP_SCENE_PALLET_TOWN_PLAYERS_HOUSE_2F, 1
	end

PalletTown_PlayersHouse_2F_EventScript_168CD2:: @ 8168CD2
	msgbox gUnknown_818D50B, 3
	end

PalletTown_PlayersHouse_2F_EventScript_168CDB:: @ 8168CDB
	msgbox gUnknown_818D53B, 3
	end

gUnknown_8168CE4:: @ 8168CE4
PalletTown_PlayersHouse_2F_EventScript_168CE4:: @ 8168CE4
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lockall
	setvar VAR_0x8004, 32
	special Special_SetSomeVariable
	setvar VAR_0x8004, 1
	special Special_AnimatePcTurnOn
	playse SE_PC_ON
	msgbox Text_PlayerBootedUpPC
	special BedroomPC
	waitstate
	special sub_812B35C
	releaseall
	end

EventScript_PalletTown_PlayersHouse_2F_ShutDownPC:: @ 8168D17
	setvar VAR_0x8004, 1
	playse SE_PC_OFF
	special Special_AnimatePcTurnOff
	special sub_812B35C
	releaseall
	end
