Route12_MapScripts:: @ 8168000
	map_script MAP_SCRIPT_ON_RESUME, Route12_OnResume
	.byte 0

Route12_OnResume:: @ 8168006
	call_if_set FLAG_SYS_SPECIAL_WILD_BATTLE, EventScript_168010
	end

EventScript_168010:: @ 8168010
	removeobject VAR_LAST_TALKED
	return

Route12_EventScript_168014:: @ 8168014
	lock
	faceplayer
	goto_if_unset FLAG_GOT_POKE_FLUTE, EventScript_168099
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	special sub_8112364
	msgbox gUnknown_81853CC, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_16808D
	call EventScript_1A924B
	setwildbattle SPECIES_SNORLAX, 30, ITEM_NONE
	waitse
	playmoncry SPECIES_SNORLAX, 2
	delay 40
	waitmoncry
	setflag FLAG_HIDE_ROUTE_12_SNORLAX
	setflag FLAG_SYS_SPECIAL_WILD_BATTLE
	setflag FLAG_WOKE_UP_ROUTE_12_SNORLAX
	dowildbattle
	clearflag FLAG_SYS_SPECIAL_WILD_BATTLE
	specialvar VAR_RESULT, Special_GetBattleOutcome
	compare VAR_RESULT, B_OUTCOME_WON
	goto_if_eq EventScript_16808F
	compare VAR_RESULT, B_OUTCOME_RAN
	goto_if_eq EventScript_16808F
	compare VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED
	goto_if_eq EventScript_16808F
	release
	end

EventScript_16808D:: @ 816808D
	release
	end

EventScript_16808F:: @ 816808F
	msgbox gUnknown_8185383
	release
	end

EventScript_168099:: @ 8168099
	msgbox gUnknown_8185317
	release
	end

Route12_EventScript_1680A3:: @ 81680A3
	msgbox gUnknown_8185797, MSGBOX_SIGN
	end

Route12_EventScript_1680AC:: @ 81680AC
	msgbox gUnknown_81857B3, MSGBOX_SIGN
	end
