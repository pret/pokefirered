EventScript_DoTrainerBattleFromApproach::
	lock
	special PlayTrainerEncounterMusic
	special EndTrainerApproach
	waitstate
	goto EventScript_DoTrainerBattle

EventScript_TryDoNormalTrainerBattle::
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

EventScript_NoTrainerBattle::
	ontrainerbattleend

EventScript_TryDoDoubleTrainerBattle::
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

EventScript_NotEnoughMonsForDoubleBattle::
	special ShowTrainerCantBattleSpeech
	waitmessage
	waitbuttonpress
	release
	end

EventScript_NoDoubleTrainerBattle::
	ontrainerbattleend

EventScript_DoNoIntroTrainerBattle::
	applymovement VAR_LAST_TALKED, Movement_RevealTrainer
	waitmovement 0
	special PlayTrainerEncounterMusic
	goto_if_questlog EventScript_EndQuestLogBattle
	battlebegin
	ontrainerbattleend

EventScript_TryDoRematchBattle::
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

EventScript_NoRematchBattle::
	ontrainerbattleend

EventScript_TryDoDoubleRematchBattle::
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

EventScript_NoDoubleRematchBattle::
	ontrainerbattleend

EventScript_NotEnoughMonsForDoubleRematchBattle::
	special ShowTrainerCantBattleSpeech
	waitmessage
	waitbuttonpress
	release
	end

EventScript_EndQuestLogRematch::
	releaseall
	end

EventScript_RevealTrainer::
	applymovement VAR_LAST_TALKED, Movement_RevealTrainer
	waitmovement 0
	return

Movement_RevealTrainer::
	reveal_trainer
	step_end

EventScript_DoTrainerBattle::
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
EventScript_EndTrainerBattle::
	releaseall
	end

EventScript_EndTrainerBattleContinueScript::
	ontrainerbattleendgoto

EventScript_EndQuestLogBattle::
	special SetBattledTrainerFlag
	releaseall
	end

Std_MsgboxAutoclose::
	message 0x0
	waitmessage
	waitbuttonpress
	release
	return
