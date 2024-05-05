#include "constants/moves.h"
#include "constants/battle.h"
#include "constants/battle_move_effects.h"
#include "constants/battle_script_commands.h"
#include "constants/battle_anim.h"
#include "constants/items.h"
#include "constants/abilities.h"
#include "constants/species.h"
#include "constants/pokemon.h"
#include "constants/songs.h"
#include "constants/game_stat.h"
#include "constants/battle_string_ids.h"
	.include "asm/macros/battle_script.inc"
@ Define these here since misc_constants.inc conflicts with the C headers
	.set NULL, 0
	.set FALSE, 0
	.set TRUE, 1
	.section script_data, "aw", %progbits
	.align 2

gBattlescriptsForBallThrow::
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall

gBattlescriptsForUsingItem::
	.4byte BattleScript_PlayerUseItem
	.4byte BattleScript_ItemRestoreHP                @ EFFECT_ITEM_RESTORE_HP (e.g. Potion)
    .4byte BattleScript_ItemCureStatus               @ EFFECT_ITEM_CURE_STATUS (e.g. Antidote, Pecha Berry)
    .4byte BattleScript_ItemHealAndCureStatus        @ EFFECT_ITEM_HEAL_AND_CURE_STATUS (e.g. Full Restore)
    .4byte BattleScript_ItemIncreaseStat             @ EFFECT_ITEM_INCREASE_STAT (e.g. X Attack)
    .4byte BattleScript_ItemSetMist                  @ EFFECT_ITEM_SET_MIST (e.g. Guard Spec)
    .4byte BattleScript_ItemSetFocusEnergy           @ EFFECT_ITEM_SET_FOCUS_ENERGY (e.g. Dire Hit)
    .4byte BattleScript_RunByUsingItem               @ EFFECT_ITEM_ESCAPE (e.g. Poké Doll)
    .4byte BattleScript_BallThrow                    @ EFFECT_ITEM_THROW_BALL (e.g. Pokéball)
    .4byte BattleScript_ItemRestoreHP                @ EFFECT_ITEM_REVIVE (e.g. Revive)
    .4byte BattleScript_ItemRestorePP                @ EFFECT_ITEM_RESTORE_PP (e.g. Ether)
    .4byte BattleScript_ItemIncreaseAllStats         @ EFFECT_ITEM_INCREASE_ALL_STATS (e.g. Max Mushrooms)

gBattleScriptsForAIUsingItems::
	.4byte BattleScript_AIUseFullRestoreOrHpHeal
	.4byte BattleScript_AIUseFullRestoreOrHpHeal
	.4byte BattleScript_AIUseStatRestore
	.4byte BattleScript_AIUseXstat
	.4byte BattleScript_AIUseGuardSpec

gBattlescriptsForRunningByItem::
	.4byte BattleScript_UseFluffyTail
	.4byte BattleScript_UsePokeFlute

BattleScript_ItemEnd:
    end

BattleScript_UseItemMessage:
    printstring STRINGID_EMPTYSTRING3
    pause B_WAIT_TIME_MED
    playse SE_USE_ITEM
    getbattlerside BS_ATTACKER
    copybyte cMULTISTRING_CHOOSER, gBattleCommunication
    printfromtable gTrainerUsedItemStringIds
    waitmessage B_WAIT_TIME_LONG
	moveendcase 15
    return
	
BattleScript_ItemRestoreHPRet:
	bichalfword gMoveResultFlags, MOVE_RESULT_NO_EFFECT
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate BS_SCRIPTING
	datahpupdate BS_SCRIPTING
	printstring STRINGID_ITEMRESTOREDSPECIESHEALTH
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_ItemRestoreHP::
	call BattleScript_UseItemMessage
	itemrestorehp BattleScript_ItemRestoreHPEnd
	call BattleScript_ItemRestoreHPRet
BattleScript_ItemRestoreHPEnd:
	end

BattleScript_ItemRestoreHP_Party::
	jumpifbyte CMP_EQUAL, gBattleCommunication, TRUE, BattleScript_ItemRestoreHP_SendOutRevivedBattler
	bichalfword gMoveResultFlags, MOVE_RESULT_NO_EFFECT
	printstring STRINGID_ITEMRESTOREDSPECIESHEALTH
	waitmessage B_WAIT_TIME_LONG
	end

BattleScript_ItemRestoreHP_SendOutRevivedBattler:
	switchinanim BS_SCRIPTING, FALSE
	waitstate
	switchineffects BS_SCRIPTING
	end

BattleScript_ItemCureStatus::
	call BattleScript_UseItemMessage
BattleScript_ItemCureStatusAfterItemMsg:
	itemcurestatus BattleScript_ItemCureStatusEnd
	updatestatusicon BS_SCRIPTING
	printstring STRINGID_ITEMCUREDSPECIESSTATUS
	waitmessage B_WAIT_TIME_LONG
BattleScript_ItemCureStatusEnd:
	end

BattleScript_ItemHealAndCureStatus::
	call BattleScript_UseItemMessage
	itemrestorehp BattleScript_ItemCureStatusAfterItemMsg
	call BattleScript_ItemRestoreHPRet
	goto BattleScript_ItemCureStatusAfterItemMsg

BattleScript_ItemIncreaseStat::
	call BattleScript_UseItemMessage
    itemincreasestat
	statbuffchange MOVE_EFFECT_AFFECTS_USER | STAT_CHANGE_NOT_PROTECT_AFFECTED | STAT_CHANGE_ALLOW_PTR, BattleScript_ItemEnd
	setgraphicalstatchangevalues
	playanimation BS_ATTACKER, B_ANIM_STATS_CHANGE, sB_ANIM_ARG1
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
	moveendcase 15
    end

BattleScript_ItemSetMist::
    call BattleScript_UseItemMessage
    setmist
    playmoveanimation BS_ATTACKER, MOVE_MIST
    waitanimation
    printfromtable gMistUsedStringIds
    waitmessage B_WAIT_TIME_LONG
	moveendcase 15
    end

BattleScript_ItemSetFocusEnergy::
    call BattleScript_UseItemMessage
    jumpifstatus2 BS_ATTACKER, STATUS2_FOCUS_ENERGY, BattleScript_ButItFailed
    setfocusenergy
    playmoveanimation BS_ATTACKER, MOVE_FOCUS_ENERGY
    waitanimation
	copybyte sBATTLER, gBattlerAttacker
    printstring STRINGID_PKMNUSEDXTOGETPUMPED
    waitmessage B_WAIT_TIME_LONG
	moveendcase 15
    end

BattleScript_RunByUsingItem::
    playse SE_FLEE
    setbyte gBattleOutcome, B_OUTCOME_RAN
    finishturn

BattleScript_BallThrow::
	jumpifbattletype BATTLE_TYPE_OLD_MAN_TUTORIAL, BattleScript_OldManThrowBall
	jumpifbattletype BATTLE_TYPE_POKEDUDE, BattleScript_PokedudeThrowBall
	printstring STRINGID_PLAYERUSEDITEM
	handleballthrow

BattleScript_ItemRestorePP::
    call BattleScript_UseItemMessage
    itemrestorepp
    printstring STRINGID_ITEMRESTOREDSPECIESPP
    waitmessage B_WAIT_TIME_LONG
	moveendcase 15
    end

BattleScript_ItemIncreaseAllStats::
	call BattleScript_UseItemMessage
	call BattleScript_AllStatsUp
	moveendcase 15
    end

gBattlescriptsForSafariActions::
	.4byte BattleScript_WatchesCarefully
	.4byte BattleScript_ThrowRock
	.4byte BattleScript_ThrowBait
	.4byte BattleScript_LeftoverWallyPrepToThrow

BattleScript_ThrowBall::
	jumpifbattletype BATTLE_TYPE_OLD_MAN_TUTORIAL, BattleScript_OldManThrowBall
	jumpifbattletype BATTLE_TYPE_POKEDUDE, BattleScript_PokedudeThrowBall
	printstring STRINGID_PLAYERUSEDITEM
	handleballthrow

BattleScript_OldManThrowBall::
	printstring STRINGID_OLDMANUSEDITEM
	handleballthrow

BattleScript_PokedudeThrowBall::
	printstring STRINGID_POKEDUDEUSED
	handleballthrow

BattleScript_SafariBallThrow::
	printstring STRINGID_PLAYERUSEDITEM
	updatestatusicon BS_ATTACKER
	handleballthrow

BattleScript_SuccessBallThrow::
	setbyte sMON_CAUGHT, TRUE
	incrementgamestat GAME_STAT_POKEMON_CAPTURES
BattleScript_PrintCaughtMonInfo::
	printstring STRINGID_GOTCHAPKMNCAUGHTPLAYER
	jumpifbyte CMP_NOT_EQUAL, sEXP_CATCH, TRUE, BattleScript_TryPrintCaughtMonInfo
	setbyte sGIVEEXP_STATE, 0
	getexp BS_TARGET
	sethword gBattle_BG2_X, 0
BattleScript_TryPrintCaughtMonInfo:
	trysetcaughtmondexflags BattleScript_TryNicknameCaughtMon
	printstring STRINGID_PKMNDATAADDEDTODEX
	waitstate
	setbyte gBattleCommunication, 0
	displaydexinfo
BattleScript_TryNicknameCaughtMon::
	printstring STRINGID_GIVENICKNAMECAPTURED
	waitstate
	setbyte gBattleCommunication, 0
	trygivecaughtmonnick BattleScript_GiveCaughtMonEnd
	givecaughtmon
	printfromtable gCaughtMonStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_SuccessBallThrowEnd
BattleScript_GiveCaughtMonEnd::
	givecaughtmon
BattleScript_SuccessBallThrowEnd::
	setbyte gBattleOutcome, B_OUTCOME_CAUGHT
	finishturn

BattleScript_OldMan_Pokedude_CaughtMessage::
	printstring STRINGID_GOTCHAPKMNCAUGHT2
	setbyte gBattleOutcome, B_OUTCOME_CAUGHT
	endlinkbattle
	finishturn

BattleScript_ShakeBallThrow::
	printfromtable gBallEscapeStringIds
	waitmessage B_WAIT_TIME_LONG
	jumpifnotbattletype BATTLE_TYPE_SAFARI, BattleScript_CatchFailEnd
	jumpifbyte CMP_NOT_EQUAL, gNumSafariBalls, 0, BattleScript_CatchFailEnd
	printstring STRINGID_OUTOFSAFARIBALLS
	waitmessage B_WAIT_TIME_LONG
	setbyte gBattleOutcome, B_OUTCOME_NO_SAFARI_BALLS
BattleScript_CatchFailEnd::
	finishaction

BattleScript_TrainerBallBlock::
	waitmessage B_WAIT_TIME_LONG
	printstring STRINGID_TRAINERBLOCKEDBALL
	waitmessage B_WAIT_TIME_LONG
	printstring STRINGID_DONTBEATHIEF
	waitmessage B_WAIT_TIME_LONG
	finishaction

BattleScript_GhostBallDodge::
	waitmessage B_WAIT_TIME_LONG
	printstring STRINGID_ITDODGEDBALL
	waitmessage B_WAIT_TIME_LONG
	finishaction

BattleScript_PlayerUseItem::
	moveendcase 15
	end

BattleScript_AIUseFullRestoreOrHpHeal::
	printstring STRINGID_EMPTYSTRING3
	pause B_WAIT_TIME_MED
	playse SE_USE_ITEM
	printstring STRINGID_TRAINER1USEDITEM
	waitmessage B_WAIT_TIME_LONG
	useitemonopponent
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	printstring STRINGID_PKMNSITEMRESTOREDHEALTH
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_ATTACKER
	moveendcase 15
	finishaction

BattleScript_AIUseStatRestore::
	printstring STRINGID_EMPTYSTRING3
	pause B_WAIT_TIME_MED
	playse SE_USE_ITEM
	printstring STRINGID_TRAINER1USEDITEM
	waitmessage B_WAIT_TIME_LONG
	useitemonopponent
	printfromtable gTrainerItemCuredStatusStringIds
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_ATTACKER
	moveendcase 15
	finishaction

BattleScript_AIUseXstat::
	printstring STRINGID_EMPTYSTRING3
	pause B_WAIT_TIME_MED
	playse SE_USE_ITEM
	printstring STRINGID_TRAINER1USEDITEM
	waitmessage B_WAIT_TIME_LONG
	useitemonopponent
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
	moveendcase 15
	finishaction

BattleScript_AIUseGuardSpec::
	printstring STRINGID_EMPTYSTRING3
	pause B_WAIT_TIME_MED
	playse SE_USE_ITEM
	printstring STRINGID_TRAINER1USEDITEM
	waitmessage B_WAIT_TIME_LONG
	useitemonopponent
	printfromtable gMistUsedStringIds
	waitmessage B_WAIT_TIME_LONG
	moveendcase 15
	finishaction

BattleScript_UseFluffyTail::
	playse SE_FLEE
	setbyte gBattleOutcome, B_OUTCOME_RAN
	finishturn

BattleScript_UsePokeFlute::
	checkpokeflute BS_ATTACKER
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 1, BattleScript_PokeFluteWakeUp
	printstring STRINGID_POKEFLUTECATCHY
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_PokeFluteEnd

BattleScript_PokeFluteWakeUp::
	printstring STRINGID_POKEFLUTE
	waitmessage B_WAIT_TIME_LONG
	fanfare MUS_POKE_FLUTE
	waitfanfare BS_ATTACKER
	printstring STRINGID_MONHEARINGFLUTEAWOKE
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_PLAYER2
	waitstate
BattleScript_PokeFluteEnd::
	finishaction

BattleScript_WatchesCarefully::
	printfromtable gSafariReactionStringIds
	waitmessage B_WAIT_TIME_LONG
	playanimation BS_OPPONENT1, B_ANIM_SAFARI_REACTION
	end2

BattleScript_ThrowRock::
	printstring STRINGID_THREWROCK
	waitmessage B_WAIT_TIME_LONG
	playanimation BS_ATTACKER, B_ANIM_ROCK_THROW
	end2

BattleScript_ThrowBait::
	printstring STRINGID_THREWBAIT
	waitmessage B_WAIT_TIME_LONG
	playanimation BS_ATTACKER, B_ANIM_BAIT_THROW
	end2

BattleScript_LeftoverWallyPrepToThrow::
	printstring STRINGID_RETURNMON
	waitmessage B_WAIT_TIME_LONG
	returnatktoball
	waitstate
	trainerslidein BS_TARGET
	waitstate
	printstring STRINGID_YOUTHROWABALLNOWRIGHT
	waitmessage B_WAIT_TIME_LONG
	end2
