# 1 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"

# 2 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
.set LOCALID_DOOR_GUARD, 4
# 3 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"

# 4 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
IndigoPlateau_PokemonCenter_1F_MapScripts::
# 5 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_TRANSITION, IndigoPlateau_PokemonCenter_1F_OnTransition
# 6 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
# 7 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	.byte 0
# 8 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"

# 9 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
IndigoPlateau_PokemonCenter_1F_OnTransition::
# 10 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	setrespawn SPAWN_INDIGO_PLATEAU
# 11 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	specialvar VAR_RESULT, IsNationalPokedexEnabled
# 12 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	call_if_eq VAR_RESULT, TRUE, IndigoPlateau_PokemonCenter_1F_EventScript_CheckBlockDoor
# 13 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	end
# 14 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"

# 15 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
IndigoPlateau_PokemonCenter_1F_EventScript_CheckBlockDoor::
# 16 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	goto_if_set FLAG_SYS_CAN_LINK_WITH_RS, EventScript_Return
# 17 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	setobjectxyperm LOCALID_DOOR_GUARD, 4, 2
# 18 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	return
# 19 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"

# 20 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
IndigoPlateau_PokemonCenter_1F_EventScript_DoorGuard::
# 21 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	lock
# 22 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	faceplayer
# 23 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	specialvar VAR_RESULT, IsNationalPokedexEnabled
# 24 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	goto_if_eq VAR_RESULT, TRUE, IndigoPlateau_PokemonCenter_1F_EventScript_CheckSeviiIslandComplete
# 25 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	msgbox IndigoPlateau_PokemonCenter_1F_Text_FaceEliteFourGoodLuck
# 26 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	release
# 27 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	end
# 28 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"

# 29 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
IndigoPlateau_PokemonCenter_1F_EventScript_CheckSeviiIslandComplete::
# 30 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	goto_if_set FLAG_SYS_CAN_LINK_WITH_RS, IndigoPlateau_PokemonCenter_1F_EventScript_SeviiIslandComplete
# 31 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	msgbox IndigoPlateau_PokemonCenter_1F_Text_LoreleiIsAbsentClosedForTimeBeing
# 32 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	release
# 33 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	end
# 34 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"

# 35 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
IndigoPlateau_PokemonCenter_1F_EventScript_SeviiIslandComplete::
# 36 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	msgbox IndigoPlateau_PokemonCenter_1F_Text_FaceEliteFourGoodLuck
# 37 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	release
# 38 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	end
# 39 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"

# 40 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
IndigoPlateau_PokemonCenter_1F_EventScript_GymGuy::
# 41 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	msgbox IndigoPlateau_PokemonCenter_1F_Text_GymGuyAdvice, MSGBOX_NPC
# 42 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	end
# 43 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"

# 44 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
IndigoPlateau_PokemonCenter_1F_EventScript_Clerk::
# 45 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	goto_if_questlog EventScript_ReleaseEnd
# 46 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	lock
# 47 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	faceplayer
# 48 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	message Text_MayIHelpYou
# 49 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	waitmessage
# 50 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	pokemart IndigoPlateau_PokemonCenter_1F_Items
# 51 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	msgbox Text_PleaseComeAgain
# 52 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	release
# 53 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	end
# 54 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"

# 55 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	.align 2
# 56 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
IndigoPlateau_PokemonCenter_1F_Items::
# 57 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	.2byte ITEM_ULTRA_BALL
# 58 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	.2byte ITEM_GREAT_BALL
# 59 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	.2byte ITEM_FULL_RESTORE
# 60 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	.2byte ITEM_MAX_POTION
# 61 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	.2byte ITEM_REVIVE
# 62 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	.2byte ITEM_FULL_HEAL
# 63 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	.2byte ITEM_MAX_REPEL
# 64 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	.2byte ITEM_NONE
# 65 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	release
# 66 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	end
# 67 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"

# 68 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
IndigoPlateau_PokemonCenter_1F_EventScript_Nurse::
# 69 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	lock
# 70 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	faceplayer
# 71 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	call EventScript_PkmnCenterNurse
# 72 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	release
# 73 "data/maps/IndigoPlateau_PokemonCenter_1F/scripts.pory"
	end
