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
	goto_if_ne VAR_RESULT, FALSE, EventScript_NoTrainerBattle
	special PlayTrainerEncounterMusic
	special SetUpTrainerMovement
	goto EventScript_DoTrainerBattle

EventScript_NoTrainerBattle::
	gotopostbattlescript

EventScript_TryDoDoubleTrainerBattle::
	lock
	faceplayer
	call EventScript_RevealTrainer
	specialvar VAR_RESULT, Script_HasTrainerBeenFought
	goto_if_ne VAR_RESULT, FALSE, EventScript_NoDoubleTrainerBattle
	special HasEnoughMonsForDoubleBattle
	goto_if_ne VAR_RESULT, PLAYER_HAS_TWO_USABLE_MONS, EventScript_NotEnoughMonsForDoubleBattle
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
	gotopostbattlescript

EventScript_DoNoIntroTrainerBattle::
	applymovement VAR_LAST_TALKED, Movement_RevealTrainer
	waitmovement 0
	special PlayTrainerEncounterMusic
	goto_if_questlog EventScript_EndQuestLogBattle
	dotrainerbattle
	gotopostbattlescript

EventScript_TryDoRematchBattle::
	call EventScript_RevealTrainer
	specialvar VAR_RESULT, IsTrainerReadyForRematch
	goto_if_eq VAR_RESULT, FALSE, EventScript_NoRematchBattle
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
	gotopostbattlescript

EventScript_TryDoDoubleRematchBattle::
	specialvar VAR_RESULT, IsTrainerReadyForRematch
	goto_if_eq VAR_RESULT, FALSE, EventScript_NoDoubleRematchBattle
	special HasEnoughMonsForDoubleBattle
	goto_if_ne VAR_RESULT, PLAYER_HAS_TWO_USABLE_MONS, EventScript_NotEnoughMonsForDoubleRematchBattle
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
	gotopostbattlescript

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
	dotrainerbattle
	specialvar VAR_RESULT, GetTrainerBattleMode
	goto_if_eq VAR_RESULT, TRAINER_BATTLE_SINGLE, EventScript_EndTrainerBattle
	goto_if_eq VAR_RESULT, TRAINER_BATTLE_CONTINUE_SCRIPT, EventScript_EndTrainerBattleContinueScript
	goto_if_eq VAR_RESULT, TRAINER_BATTLE_CONTINUE_SCRIPT_NO_MUSIC, EventScript_EndTrainerBattleContinueScript
	goto_if_eq VAR_RESULT, TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE, EventScript_EndTrainerBattleContinueScript
	goto_if_eq VAR_RESULT, TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE_NO_MUSIC, EventScript_EndTrainerBattleContinueScript
EventScript_EndTrainerBattle::
	releaseall
	end

EventScript_EndTrainerBattleContinueScript::
	gotobeatenscript

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
