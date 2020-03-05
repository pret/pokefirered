EventScript_DoTrainerBattleFromApproach:: @ 81A4EB4
	lock
	special PlayTrainerEncounterMusic
	special EndTrainerApproach
	waitstate
	goto EventScript_DoTrainerBattle

EventScript_TryDoNormalTrainerBattle:: @ 81A4EC1
	lock
	faceplayer
	applymovement VAR_LAST_TALKED, Movement_RevealTrainer
	waitmovement 0
	specialvar VAR_RESULT, Script_HasTrainerBeenFought
	compare VAR_RESULT, FALSE
	goto_if_ne EventScript_NoTrainerBattle
	special PlayTrainerEncounterMusic
	special SetUpTrainerMovement
	goto EventScript_DoTrainerBattle

EventScript_NoTrainerBattle:: @ 81A4EE8
	ontrainerbattleend

EventScript_TryDoDoubleTrainerBattle:: @ 81A4EE9
	lock
	faceplayer
	call EventScript_RevealTrainer
	specialvar VAR_RESULT, Script_HasTrainerBeenFought
	compare VAR_RESULT, FALSE
	goto_if_ne EventScript_NoDoubleTrainerBattle
	special HasEnoughMonsForDoubleBattle
	compare VAR_RESULT, PLAYER_HAS_TWO_USABLE_MONS
	goto_if_ne EventScript_NotEnoughMonsForDoubleBattle
	special PlayTrainerEncounterMusic
	special SetUpTrainerMovement
	goto EventScript_DoTrainerBattle

EventScript_NotEnoughMonsForDoubleBattle:: @ 81A4F19
	special ShowTrainerCantBattleSpeech
	waitmessage
	waitbuttonpress
	release
	end

EventScript_NoDoubleTrainerBattle:: @ 81A4F20
	ontrainerbattleend

EventScript_DoNoIntroTrainerBattle:: @ 81A4F21
	applymovement VAR_LAST_TALKED, Movement_RevealTrainer
	waitmovement 0
	special PlayTrainerEncounterMusic
	goto_if_questlog EventScript_EndQuestLogBattle
	battlebegin
	ontrainerbattleend

EventScript_TryDoRematchBattle:: @ 81A4F3E
	call EventScript_RevealTrainer
	specialvar VAR_RESULT, IsTrainerReadyForRematch
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_NoRematchBattle
	special PlayTrainerEncounterMusic
	special SetUpTrainerMovement
	special ShowTrainerIntroSpeech
	waitmessage
	waitbuttonpress
	goto_if_questlog EventScript_EndQuestLogRematch
	special StartRematchBattle
	waitstate
	releaseall
	end

EventScript_NoRematchBattle:: @ 81A4F72
	ontrainerbattleend

EventScript_TryDoDoubleRematchBattle:: @ 81A4F73
	specialvar VAR_RESULT, IsTrainerReadyForRematch
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_NoDoubleRematchBattle
	special HasEnoughMonsForDoubleBattle
	compare VAR_RESULT, PLAYER_HAS_TWO_USABLE_MONS
	goto_if_ne EventScript_NotEnoughMonsForDoubleRematchBattle
	special PlayTrainerEncounterMusic
	special SetUpTrainerMovement
	special ShowTrainerIntroSpeech
	waitmessage
	waitbuttonpress
	goto_if_questlog EventScript_EndQuestLogRematch
	special StartRematchBattle
	waitstate
	releaseall
	end

EventScript_NoDoubleRematchBattle:: @ 81A4FB0
	ontrainerbattleend

EventScript_NotEnoughMonsForDoubleRematchBattle:: @ 81A4FB1
	special ShowTrainerCantBattleSpeech
	waitmessage
	waitbuttonpress
	release
	end

EventScript_EndQuestLogRematch:: @ 81A4FB8
	releaseall
	end

EventScript_RevealTrainer:: @ 81A4FBA
	applymovement VAR_LAST_TALKED, Movement_RevealTrainer
	waitmovement 0
	return

Movement_RevealTrainer:: @ 81A4FC5
	reveal_trainer
	step_end

EventScript_DoTrainerBattle:: @ 81A4FC7
	special ShowTrainerIntroSpeech
	waitmessage
	waitbuttonpress
	goto_if_questlog EventScript_EndQuestLogBattle
	battlebegin
	specialvar VAR_RESULT, GetTrainerBattleMode
	compare VAR_RESULT, TRAINER_BATTLE_SINGLE
	goto_if_eq EventScript_EndTrainerBattle
	compare VAR_RESULT, TRAINER_BATTLE_CONTINUE_SCRIPT
	goto_if_eq EventScript_EndTrainerBattleContinueScript
	compare VAR_RESULT, TRAINER_BATTLE_CONTINUE_SCRIPT_NO_MUSIC
	goto_if_eq EventScript_EndTrainerBattleContinueScript
	compare VAR_RESULT, TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE
	goto_if_eq EventScript_EndTrainerBattleContinueScript
	compare VAR_RESULT, TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE_NO_MUSIC
	goto_if_eq EventScript_EndTrainerBattleContinueScript
EventScript_EndTrainerBattle:: @ 81A5017
	releaseall
	end

EventScript_EndTrainerBattleContinueScript:: @ 81A5019
	ontrainerbattleendgoto

EventScript_EndQuestLogBattle:: @ 81A501A
	special SetBattledTrainerFlag
	releaseall
	end

Std_MsgboxAutoclose:: @ 81A501F
	message 0x0
	waitmessage
	waitbuttonpress
	release
	return
