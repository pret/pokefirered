SaffronCity_PokemonTrainerFanClub_MapScripts:: @ 816F0BF
	map_script MAP_SCRIPT_ON_FRAME_TABLE, SaffronCity_PokemonTrainerFanClub_OnFrame
	map_script MAP_SCRIPT_ON_TRANSITION, SaffronCity_PokemonTrainerFanClub_OnTransition
	.byte 0

SaffronCity_PokemonTrainerFanClub_OnFrame:: @ 816F0CA
	map_script_2 VAR_MAP_SCENE_SAFFRON_CITY_POKEMON_TRAINER_FAN_CLUB, 1, EventScript_16F0D4
	.2byte 0

EventScript_16F0D4:: @ 816F0D4
	lockall
	textcolor 1
	applymovement 1, Movement_1A75ED
	waitmovement 0
	playse SE_PIN
	applymovement 1, Movement_1A75DB
	waitmovement 0
	applymovement 1, Movement_1A75DD
	waitmovement 0
	msgbox gUnknown_819C22B
	closemessage
	applymovement 1, Movement_16F124
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Movement_1A75EB
	waitmovement 0
	msgbox gUnknown_819C235
	setvar VAR_MAP_SCENE_SAFFRON_CITY_POKEMON_TRAINER_FAN_CLUB, 2
	releaseall
	end

Movement_16F124:: @ 816F124
	step_1c
	step_1b
	step_10
	step_1c
	step_10
	step_1b
	step_12
	step_end

Movement_16F12C:: @ 816F12C
	step_1b
	step_2d
	step_10
	step_10
	step_10
	step_12
	step_12
	step_end

Movement_16F134:: @ 816F134
	step_1f
	step_1f
	step_1d
	step_1d
	step_1f
	step_1d
	step_end

Movement_16F13B:: @ 816F13B
	step_10
	step_30
	step_end

Movement_16F13E:: @ 816F13E
	step_55
	step_1e
	step_1e
	step_20
	step_2d
	step_end

SaffronCity_PokemonTrainerFanClub_OnTransition:: @ 816F144
	compare VAR_MAP_SCENE_SAFFRON_CITY_POKEMON_TRAINER_FAN_CLUB, 1
	goto_if eq, EventScript_16F267
	compare VAR_MAP_SCENE_SAFFRON_CITY_POKEMON_TRAINER_FAN_CLUB, 2
	goto_if eq, EventScript_16F15B
	end

EventScript_16F15B:: @ 816F15B
	special UpdateMovedSaffronFanClubMembers
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, ShouldMoveSaffronFanClubMember
	compare VAR_RESULT, 0
	call_if eq, EventScript_16F207
	setvar VAR_0x8004, 1
	specialvar VAR_RESULT, ShouldMoveSaffronFanClubMember
	compare VAR_RESULT, 0
	call_if eq, EventScript_16F213
	setvar VAR_0x8004, 2
	specialvar VAR_RESULT, ShouldMoveSaffronFanClubMember
	compare VAR_RESULT, 0
	call_if eq, EventScript_16F21F
	setvar VAR_0x8004, 3
	specialvar VAR_RESULT, ShouldMoveSaffronFanClubMember
	compare VAR_RESULT, 0
	call_if eq, EventScript_16F22B
	setvar VAR_0x8004, 4
	specialvar VAR_RESULT, ShouldMoveSaffronFanClubMember
	compare VAR_RESULT, 0
	call_if eq, EventScript_16F237
	setvar VAR_0x8004, 5
	specialvar VAR_RESULT, ShouldMoveSaffronFanClubMember
	compare VAR_RESULT, 0
	call_if eq, EventScript_16F243
	setvar VAR_0x8004, 6
	specialvar VAR_RESULT, ShouldMoveSaffronFanClubMember
	compare VAR_RESULT, 0
	call_if eq, EventScript_16F24F
	setvar VAR_0x8004, 7
	specialvar VAR_RESULT, ShouldMoveSaffronFanClubMember
	compare VAR_RESULT, 0
	call_if eq, EventScript_16F25B
	end

EventScript_16F207:: @ 816F207
	setobjectxyperm 1, 5, 2
	setobjectmovementtype 1, 7
	return

EventScript_16F213:: @ 816F213
	setobjectxyperm 3, 7, 4
	setobjectmovementtype 3, 9
	return

EventScript_16F21F:: @ 816F21F
	setobjectxyperm 4, 2, 2
	setobjectmovementtype 4, 7
	return

EventScript_16F22B:: @ 816F22B
	setobjectxyperm 2, 3, 4
	setobjectmovementtype 2, 10
	return

EventScript_16F237:: @ 816F237
	setobjectxyperm 6, 4, 6
	setobjectmovementtype 6, 7
	return

EventScript_16F243:: @ 816F243
	setobjectxyperm 5, 10, 3
	setobjectmovementtype 5, 7
	return

EventScript_16F24F:: @ 816F24F
	setobjectxyperm 7, 7, 5
	setobjectmovementtype 7, 9
	return

EventScript_16F25B:: @ 816F25B
	setobjectxyperm 8, 9, 6
	setobjectmovementtype 8, 9
	return

EventScript_16F267:: @ 816F267
	call EventScript_16F22B
	call EventScript_16F237
	call EventScript_16F243
	call EventScript_16F24F
	call EventScript_16F25B
	end

SaffronCity_PokemonTrainerFanClub_EventScript_16F281:: @ 816F281
	lock
	faceplayer
	setvar VAR_0x8004, 0
	special BufferStreakTrainerText
	compare VAR_MAP_SCENE_SAFFRON_CITY_POKEMON_TRAINER_FAN_CLUB, 0
	goto_if eq, EventScript_16F2EE
	specialvar VAR_RESULT, ShouldMoveSaffronFanClubMember
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F2C0
	specialvar VAR_RESULT, GetNumMovedSaffronFanClubMembers
	compare VAR_RESULT, 7
	goto_if eq, EventScript_16F2E4
	msgbox gUnknown_819C420
	release
	end

EventScript_16F2C0:: @ 816F2C0
	specialvar VAR_RESULT, GetNumMovedSaffronFanClubMembers
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F2DA
	msgbox gUnknown_819C390
	release
	end

EventScript_16F2DA:: @ 816F2DA
	msgbox gUnknown_819C3BD
	release
	end

EventScript_16F2E4:: @ 816F2E4
	msgbox gUnknown_819C4A5
	release
	end

EventScript_16F2EE:: @ 816F2EE
	msgbox gUnknown_819C55C
	release
	end

SaffronCity_PokemonTrainerFanClub_EventScript_16F2F8:: @ 816F2F8
	lock
	faceplayer
	setvar VAR_0x8004, 3
	special BufferStreakTrainerText
	compare VAR_MAP_SCENE_SAFFRON_CITY_POKEMON_TRAINER_FAN_CLUB, 0
	goto_if eq, EventScript_16F365
	specialvar VAR_RESULT, ShouldMoveSaffronFanClubMember
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F337
	specialvar VAR_RESULT, GetNumMovedSaffronFanClubMembers
	compare VAR_RESULT, 7
	goto_if eq, EventScript_16F35B
	msgbox gUnknown_819CBD3
	release
	end

EventScript_16F337:: @ 816F337
	specialvar VAR_RESULT, GetNumMovedSaffronFanClubMembers
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F351
	msgbox gUnknown_819CB32
	release
	end

EventScript_16F351:: @ 816F351
	msgbox gUnknown_819CB62
	release
	end

EventScript_16F35B:: @ 816F35B
	msgbox gUnknown_819CC2B
	release
	end

EventScript_16F365:: @ 816F365
	msgbox gUnknown_819CCC2
	release
	end

SaffronCity_PokemonTrainerFanClub_EventScript_16F36F:: @ 816F36F
	lock
	faceplayer
	setvar VAR_0x8004, 1
	special BufferStreakTrainerText
	compare VAR_MAP_SCENE_SAFFRON_CITY_POKEMON_TRAINER_FAN_CLUB, 0
	goto_if eq, EventScript_16F3DC
	specialvar VAR_RESULT, ShouldMoveSaffronFanClubMember
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F3AE
	specialvar VAR_RESULT, GetNumMovedSaffronFanClubMembers
	compare VAR_RESULT, 7
	goto_if eq, EventScript_16F3D2
	msgbox gUnknown_819C6BA
	release
	end

EventScript_16F3AE:: @ 816F3AE
	specialvar VAR_RESULT, GetNumMovedSaffronFanClubMembers
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F3C8
	msgbox gUnknown_819C5A9
	release
	end

EventScript_16F3C8:: @ 816F3C8
	msgbox gUnknown_819C600
	release
	end

EventScript_16F3D2:: @ 816F3D2
	msgbox gUnknown_819C73A
	release
	end

EventScript_16F3DC:: @ 816F3DC
	msgbox gUnknown_819C7C8
	release
	end

SaffronCity_PokemonTrainerFanClub_EventScript_16F3E6:: @ 816F3E6
	lock
	faceplayer
	setvar VAR_0x8004, 2
	special BufferStreakTrainerText
	compare VAR_MAP_SCENE_SAFFRON_CITY_POKEMON_TRAINER_FAN_CLUB, 0
	goto_if eq, EventScript_16F453
	specialvar VAR_RESULT, ShouldMoveSaffronFanClubMember
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F425
	specialvar VAR_RESULT, GetNumMovedSaffronFanClubMembers
	compare VAR_RESULT, 7
	goto_if eq, EventScript_16F449
	msgbox gUnknown_819C986
	release
	end

EventScript_16F425:: @ 816F425
	specialvar VAR_RESULT, GetNumMovedSaffronFanClubMembers
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F43F
	msgbox gUnknown_819C81E
	release
	end

EventScript_16F43F:: @ 816F43F
	msgbox gUnknown_819C8C1
	release
	end

EventScript_16F449:: @ 816F449
	msgbox gUnknown_819C9D5
	release
	end

EventScript_16F453:: @ 816F453
	msgbox gUnknown_819CA7C
	release
	end

SaffronCity_PokemonTrainerFanClub_EventScript_16F45D:: @ 816F45D
	lock
	faceplayer
	setvar VAR_0x8004, 5
	special BufferStreakTrainerText
	specialvar VAR_RESULT, ShouldMoveSaffronFanClubMember
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F491
	specialvar VAR_RESULT, GetNumMovedSaffronFanClubMembers
	compare VAR_RESULT, 7
	goto_if eq, EventScript_16F4B5
	msgbox gUnknown_819D01F
	release
	end

EventScript_16F491:: @ 816F491
	specialvar VAR_RESULT, GetNumMovedSaffronFanClubMembers
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F4AB
	msgbox gUnknown_819CEDF
	release
	end

EventScript_16F4AB:: @ 816F4AB
	msgbox gUnknown_819CF6D
	release
	end

EventScript_16F4B5:: @ 816F4B5
	msgbox gUnknown_819D075
	release
	end

SaffronCity_PokemonTrainerFanClub_EventScript_16F4BF:: @ 816F4BF
	lock
	faceplayer
	setvar VAR_0x8004, 4
	special BufferStreakTrainerText
	specialvar VAR_RESULT, ShouldMoveSaffronFanClubMember
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F4F3
	specialvar VAR_RESULT, GetNumMovedSaffronFanClubMembers
	compare VAR_RESULT, 7
	goto_if eq, EventScript_16F517
	msgbox gUnknown_819CDDA
	release
	end

EventScript_16F4F3:: @ 816F4F3
	specialvar VAR_RESULT, GetNumMovedSaffronFanClubMembers
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F50D
	msgbox gUnknown_819CCF3
	release
	end

EventScript_16F50D:: @ 816F50D
	msgbox gUnknown_819CD4E
	release
	end

EventScript_16F517:: @ 816F517
	msgbox gUnknown_819CE3A
	release
	end

SaffronCity_PokemonTrainerFanClub_EventScript_16F521:: @ 816F521
	lock
	faceplayer
	setvar VAR_0x8004, 6
	special BufferStreakTrainerText
	specialvar VAR_RESULT, ShouldMoveSaffronFanClubMember
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F555
	specialvar VAR_RESULT, GetNumMovedSaffronFanClubMembers
	compare VAR_RESULT, 7
	goto_if eq, EventScript_16F579
	msgbox gUnknown_819D1AE
	release
	end

EventScript_16F555:: @ 816F555
	specialvar VAR_RESULT, GetNumMovedSaffronFanClubMembers
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F56F
	msgbox gUnknown_819D0E3
	release
	end

EventScript_16F56F:: @ 816F56F
	msgbox gUnknown_819D148
	release
	end

EventScript_16F579:: @ 816F579
	msgbox gUnknown_819D211
	release
	end

SaffronCity_PokemonTrainerFanClub_EventScript_16F583:: @ 816F583
	lock
	faceplayer
	setvar VAR_0x8004, 7
	special BufferStreakTrainerText
	specialvar VAR_RESULT, ShouldMoveSaffronFanClubMember
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F5B7
	specialvar VAR_RESULT, GetNumMovedSaffronFanClubMembers
	compare VAR_RESULT, 7
	goto_if eq, EventScript_16F5DB
	msgbox gUnknown_819D3D2
	release
	end

EventScript_16F5B7:: @ 816F5B7
	specialvar VAR_RESULT, GetNumMovedSaffronFanClubMembers
	compare VAR_RESULT, 1
	goto_if eq, EventScript_16F5D1
	msgbox gUnknown_819D2B4
	release
	end

EventScript_16F5D1:: @ 816F5D1
	msgbox gUnknown_819D31F
	release
	end

EventScript_16F5DB:: @ 816F5DB
	msgbox gUnknown_819D477
	release
	end
