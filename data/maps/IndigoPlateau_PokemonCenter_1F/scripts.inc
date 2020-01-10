IndigoPlateau_PokemonCenter_1F_MapScripts:: @ 816EA5A
	map_script MAP_SCRIPT_ON_TRANSITION, IndigoPlateau_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, IndigoPlateau_PokemonCenter_1F_MapScript2_1BC05C
	.byte 0

IndigoPlateau_PokemonCenter_1F_OnTransition:: @ 816EA65
	setrespawn SPAWN_INDIGO_PLATEAU
	specialvar VAR_RESULT, IsNationalPokedexEnabled
	compare VAR_RESULT, 1
	call_if_eq EventScript_16EA79
	end

EventScript_16EA79:: @ 816EA79
	goto_if_set FLAG_SYS_CAN_LINK_WITH_RS, EventScript_1A77A9
	setobjectxyperm 4, 4, 2
	return

IndigoPlateau_PokemonCenter_1F_EventScript_16EA8A:: @ 816EA8A
	lock
	faceplayer
	specialvar VAR_RESULT, IsNationalPokedexEnabled
	compare VAR_RESULT, 1
	goto_if_eq EventScript_16EAA6
	msgbox gUnknown_819A8D8
	release
	end

EventScript_16EAA6:: @ 816EAA6
	goto_if_set FLAG_SYS_CAN_LINK_WITH_RS, EventScript_16EAB9
	msgbox gUnknown_819A943
	release
	end

EventScript_16EAB9:: @ 816EAB9
	msgbox gUnknown_819A8D8
	release
	end

IndigoPlateau_PokemonCenter_1F_EventScript_16EAC3:: @ 816EAC3
	msgbox gUnknown_819A837, MSGBOX_NPC
	end

IndigoPlateau_PokemonCenter_1F_EventScript_16EACC:: @ 816EACC
	special sub_8110AB4
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A7AE0
	lock
	faceplayer
	message Text_MayIHelpYou
	waitmessage
	pokemart Items_16EAF4
	msgbox gUnknown_81A5190
	release
	end

	.align 2
Items_16EAF4:: @ 816EAF4
	.2byte ITEM_ULTRA_BALL
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_FULL_RESTORE
	.2byte ITEM_MAX_POTION
	.2byte ITEM_REVIVE
	.2byte ITEM_FULL_HEAL
	.2byte ITEM_MAX_REPEL
	.2byte ITEM_NONE
	release
	end

IndigoPlateau_PokemonCenter_1F_EventScript_16EB06:: @ 816EB06
	lock
	faceplayer
	call EventScript_PkmnCenterNurse
	release
	end
