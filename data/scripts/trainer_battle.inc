gUnknown_81A4EB4:: @ 81A4EB4
	lock
	special PlayTrainerEncounterMusic
	special ScrSpecial_EndTrainerApproach
	waitstate
	goto EventScript_1A4FC7

EventScript_TryDoNormalTrainerBattle:: @ 81A4EC1
	lock
	faceplayer
	applymovement VAR_LAST_TALKED, Movement_1A4FC5
	waitmovement 0
	specialvar VAR_RESULT, ScrSpecial_HasTrainerBeenFought
	compare VAR_RESULT, 0
	goto_if_ne EventScript_1A4EE8
	special PlayTrainerEncounterMusic
	special SetUpTrainerMovement
	goto EventScript_1A4FC7

EventScript_1A4EE8:: @ 81A4EE8
	ontrainerbattleend

EventScript_TryDoDoubleTrainerBattle:: @ 81A4EE9
	lock
	faceplayer
	call EventScript_1A4FBA
	specialvar VAR_RESULT, ScrSpecial_HasTrainerBeenFought
	compare VAR_RESULT, 0
	goto_if_ne EventScript_1A4F20
	special HasEnoughMonsForDoubleBattle
	compare VAR_RESULT, PLAYER_HAS_TWO_USABLE_MONS
	goto_if_ne EventScript_1A4F19
	special PlayTrainerEncounterMusic
	special SetUpTrainerMovement
	goto EventScript_1A4FC7

EventScript_1A4F19:: @ 81A4F19
	special ScrSpecial_ShowTrainerNonBattlingSpeech
	waitmessage
	waitbuttonpress
	release
	end

EventScript_1A4F20:: @ 81A4F20
	ontrainerbattleend

EventScript_DoTrainerBattle:: @ 81A4F21
	applymovement VAR_LAST_TALKED, Movement_1A4FC5
	waitmovement 0
	special PlayTrainerEncounterMusic
	goto_if_questlog EventScript_1A501A
	battlebegin
	ontrainerbattleend

EventScript_TryDoRematchBattle:: @ 81A4F3E
	call EventScript_1A4FBA
	specialvar VAR_RESULT, ScrSpecial_GetTrainerEyeRematchFlag
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1A4F72
	special PlayTrainerEncounterMusic
	special SetUpTrainerMovement
	special ScrSpecial_ShowTrainerIntroSpeech
	waitmessage
	waitbuttonpress
	goto_if_questlog EventScript_1A4FB8
	special ScrSpecial_StartTrainerEyeRematch
	waitstate
	releaseall
	end

EventScript_1A4F72:: @ 81A4F72
	ontrainerbattleend

EventScript_TryDoDoubleRematchBattle:: @ 81A4F73
	specialvar VAR_RESULT, ScrSpecial_GetTrainerEyeRematchFlag
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1A4FB0
	special HasEnoughMonsForDoubleBattle
	compare VAR_RESULT, PLAYER_HAS_TWO_USABLE_MONS
	goto_if_ne EventScript_1A4FB1
	special PlayTrainerEncounterMusic
	special SetUpTrainerMovement
	special ScrSpecial_ShowTrainerIntroSpeech
	waitmessage
	waitbuttonpress
	goto_if_questlog EventScript_1A4FB8
	special ScrSpecial_StartTrainerEyeRematch
	waitstate
	releaseall
	end

EventScript_1A4FB0:: @ 81A4FB0
	ontrainerbattleend

EventScript_1A4FB1:: @ 81A4FB1
	special ScrSpecial_ShowTrainerNonBattlingSpeech
	waitmessage
	waitbuttonpress
	release
	end

EventScript_1A4FB8:: @ 81A4FB8
	releaseall
	end

EventScript_1A4FBA:: @ 81A4FBA
	applymovement VAR_LAST_TALKED, Movement_1A4FC5
	waitmovement 0
	return

Movement_1A4FC5:: @ 81A4FC5
	step_67
	step_end

EventScript_1A4FC7:: @ 81A4FC7
	special ScrSpecial_ShowTrainerIntroSpeech
	waitmessage
	waitbuttonpress
	goto_if_questlog EventScript_1A501A
	battlebegin
	specialvar VAR_RESULT, ScrSpecial_GetTrainerBattleMode
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1A5017
	compare VAR_RESULT, 2
	goto_if_eq EventScript_1A5019
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1A5019
	compare VAR_RESULT, 6
	goto_if_eq EventScript_1A5019
	compare VAR_RESULT, 8
	goto_if_eq EventScript_1A5019

EventScript_1A5017:: @ 81A5017
	releaseall
	end

EventScript_1A5019:: @ 81A5019
	ontrainerbattleendgoto

EventScript_1A501A:: @ 81A501A
	special SetBattledTrainerFlag
	releaseall
	end

Std_MsgboxAutoclose:: @ 81A501F
	message 0x0
	waitmessage
	waitbuttonpress
	release
	return
