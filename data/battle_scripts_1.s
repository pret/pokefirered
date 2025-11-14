#include "config/general.h"
#include "config/battle.h"
#include "constants/global.h"
#include "constants/battle.h"
#include "constants/pokemon.h"
@#include "constants/battle_arena.h"
#include "constants/battle_script_commands.h"
#include "constants/battle_anim.h"
#include "constants/battle_string_ids.h"
#include "constants/abilities.h"
#include "constants/hold_effects.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/game_stat.h"
#include "constants/trainers.h"
#include "constants/species.h"
#include "constants/generational_changes.h"
	.include "asm/macros.inc"
	.include "asm/macros/battle_script.inc"
	.include "constants/constants.inc"

	.section script_data, "aw", %progbits

BattleScript_BattleTowerLost::
	getbattlersforrecall
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0, BattleScript_BattleTowerLostLostSkipMonRecall
	printfromtable gDoubleBattleRecallStrings
	waitmessage B_WAIT_TIME_LONG
	returnopponentmon1toball
	waitstate
	returnopponentmon2toball
	waitstate
BattleScript_BattleTowerLostLostSkipMonRecall::
	trainerslidein BS_ATTACKER
	waitstate
	printstring STRINGID_TRAINER1WINTEXT
	jumpifnotbattletype BATTLE_TYPE_DOUBLE, BattleScript_BattleTowerLostLostSkipDouble
	printstring STRINGID_TRAINER2WINTEXT
BattleScript_BattleTowerLostLostSkipDouble::
	end2

BattleScript_LinkBattleWonOrLost::
	printstring STRINGID_BATTLEEND
	waitmessage B_WAIT_TIME_LONG
	endlinkbattle
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_BattleTowerTrainerBattleWon::
	printstring STRINGID_PLAYERDEFEATEDTRAINER1
	trainerslidein BS_ATTACKER
	waitstate
	jumpifnotbattletype BATTLE_TYPE_TRAINER_TOWER, BattleScript_BattleTowerEtcTrainerBattleWonSkipText
	printstring STRINGID_TRAINER1LOSETEXT
	jumpifnotbattletype BATTLE_TYPE_DOUBLE, BattleScript_BattleTowerEtcTrainerBattleWonSkipText
	printstring STRINGID_TRAINER2LOSETEXT
BattleScript_BattleTowerEtcTrainerBattleWonSkipText::
	pickup
	end2

BattleScript_LeftoverBirchString::
	printstring STRINGID_DONTLEAVEBIRCH
	end2

@ pokeemerald

BattleScript_EffectFickleBeam::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	ficklebeamdamagecalculation
	goto BattleScript_HitFromCritCalc
BattleScript_FickleBeamDoubled::
	pause B_WAIT_TIME_SHORTEST
	printstring STRINGID_FICKLEBEAMDOUBLED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_HitFromCritCalc

BattleScript_Terastallization::
	@ TODO: no string prints in S/V, but right now this helps with clarity
	printstring STRINGID_PKMNSTORINGENERGY
	playanimation BS_ATTACKER, B_ANIM_TERA_CHARGE
	waitanimation
	applyterastallization
	playanimation BS_ATTACKER, B_ANIM_TERA_ACTIVATE
	waitanimation
	printstring STRINGID_PKMNTERASTALLIZEDINTO
	waitmessage B_WAIT_TIME_LONG
	end3

BattleScript_TeraFormChange::
	@ TODO: no string prints in S/V, but right now this helps with clarity
	printstring STRINGID_PKMNSTORINGENERGY
	handleformchange BS_ATTACKER, 0
	handleformchange BS_ATTACKER, 1
	playanimation BS_ATTACKER, B_ANIM_TERA_CHARGE
	waitanimation
	applyterastallization
	playanimation BS_ATTACKER, B_ANIM_TERA_ACTIVATE
	waitanimation
	handleformchange BS_ATTACKER, 2
	printstring STRINGID_PKMNTERASTALLIZEDINTO
	waitmessage B_WAIT_TIME_LONG
	switchinabilities BS_ATTACKER
	end3

BattleScript_LowerAtkSpAtk::
	jumpifstat BS_EFFECT_BATTLER, CMP_GREATER_THAN, STAT_ATK, MIN_STAT_STAGE, BattleScript_LowerAtkSpAtkDoAnim
	jumpifstat BS_EFFECT_BATTLER, CMP_EQUAL, STAT_SPATK, MIN_STAT_STAGE, BattleScript_LowerAtkSpAtkEnd
BattleScript_LowerAtkSpAtkDoAnim::
	setstatchanger STAT_ATK, 1, TRUE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_LowerAtkSpAtkTrySpAtk, BIT_SPATK
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_LowerAtkSpAtkTrySpAtk::
	setstatchanger STAT_SPATK, 1, TRUE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_LowerAtkSpAtkEnd
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_LowerAtkSpAtkEnd:
	return

BattleScript_EffectSpicyExtract::
	attackcanceler
	jumpifsubstituteblocks BattleScript_ButItFailed
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	jumpifstat BS_TARGET, CMP_LESS_THAN, STAT_ATK, MAX_STAT_STAGE, BattleScript_SpicyExtract_CheckShouldSkipAttackAnim
	jumpifstat BS_TARGET, CMP_GREATER_THAN, STAT_DEF, MIN_STAT_STAGE, BattleScript_SpicyExtract_CheckShouldSkipAttackAnim
	goto BattleScript_ButItFailed
BattleScript_SpicyExtract_CheckShouldSkipAttackAnim:
	jumpifbyte CMP_NOT_EQUAL, gBattleCommunication, 0, BattleScript_SpicyExtract_RaiseAtk
	goto BattleScript_SpicyExtract_SkipAttackAnim
BattleScript_SpicyExtract_RaiseAtk:
	attackanimation
	waitanimation
BattleScript_SpicyExtract_SkipAttackAnim:
	setstatchanger STAT_ATK, 2, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectSpicyExtractDefenseDown
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectSpicyExtractDefenseDown:
	setstatchanger STAT_DEF, 2, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectSpicyExtract_End
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectSpicyExtract_End:
	goto BattleScript_MoveEnd

BattleScript_EffectTidyUp::
	attackcanceler
	pause B_WAIT_TIME_MED
	waitstate
	saveattacker
	savetarget
	trytidyup FALSE, BattleScript_EffectTidyUpDoMoveAnimation
	restoreattacker
	restoretarget
	goto BattleScript_EffectDragonDanceFromStatUp

BattleScript_EffectTidyUpDoMoveAnimation::
	attackanimation
	waitanimation
	trytidyup TRUE, NULL
	printstring STRINGID_TIDYINGUPCOMPLETE
	waitmessage B_WAIT_TIME_LONG
	restoreattacker
	restoretarget
	goto BattleScript_EffectDragonDanceFromStatUp

BattleScript_EffectUpperHand::
	attackcanceler
	tryupperhand BattleScript_ButItFailed
	goto BattleScript_HitFromAccCheck

BattleScript_EffectShedTail::
	attackcanceler
	waitstate
	jumpifvolatile BS_ATTACKER, VOLATILE_SUBSTITUTE, BattleScript_AlreadyHasSubstitute
	jumpifbattletype BATTLE_TYPE_ARENA, BattleScript_ButItFailed
	jumpifcantswitch SWITCH_IGNORE_ESCAPE_PREVENTION | BS_ATTACKER, BattleScript_ButItFailed
	setsubstitute
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_SUBSTITUTE_FAILED, BattleScript_SubstituteString
	attackanimation
	waitanimation
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	printstring STRINGID_SHEDITSTAIL
	waitmessage B_WAIT_TIME_LONG
	moveendto MOVEEND_ATTACKER_VISIBLE
	moveendfrom MOVEEND_TARGET_VISIBLE
	goto BattleScript_MoveSwitchOpenPartyScreen

BattleScript_EffectPsychicNoise::
	printstring STRINGID_PKMNPREVENTEDFROMHEALING
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_EffectFilletAway::
	attackcanceler
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_ATK, MAX_STAT_STAGE, BattleScript_FilletAwayTryAttack
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPATK, MAX_STAT_STAGE, BattleScript_FilletAwayTryAttack
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPEED, MAX_STAT_STAGE, BattleScript_ButItFailed
BattleScript_FilletAwayTryAttack::
	halvehp BattleScript_ButItFailed
	attackanimation
	waitanimation
	setstatchanger STAT_ATK, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_FilletAwayTrySpAtk, BIT_SPATK | BIT_SPEED
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_FilletAwayTrySpAtk::
	setstatchanger STAT_SPATK, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_FilletAwayTrySpeed, BIT_SPEED
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_FilletAwayTrySpeed::
	setstatchanger STAT_SPEED, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_FilletAwayEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_FilletAwayEnd::
	clearmoveresultflags MOVE_RESULT_NO_EFFECT
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	goto BattleScript_MoveEnd

BattleScript_EffectDoodle::
	attackcanceler
	trycopyability BS_ATTACKER, BattleScript_ButItFailed
	saveattacker
	attackanimation
	waitanimation
	setbyte gBattleCommunication, 0
	goto BattleScript_EffectDoodle_AfterCopy
BattleScript_EffectDoodle_CopyAbility:
	trycopyability BS_ATTACKER, BattleScript_EffectDoodleMoveEnd
BattleScript_EffectDoodle_AfterCopy:
	copybyte gBattlerAbility, gBattlerAttacker
	call BattleScript_AbilityPopUpOverwriteThenNormal
	recordability BS_ATTACKER
	printstring STRINGID_PKMNCOPIEDFOE
	waitmessage B_WAIT_TIME_LONG
	switchinabilities BS_ATTACKER
	jumpifbyte CMP_NOT_EQUAL, gBattleCommunication, 0x0, BattleScript_EffectDoodleMoveEnd
	addbyte gBattleCommunication, 1
	jumpifnoally BS_ATTACKER, BattleScript_EffectDoodleMoveEnd
	setallytonextattacker BattleScript_EffectDoodle_CopyAbility
BattleScript_EffectDoodleMoveEnd:
	restoreattacker
	goto BattleScript_MoveEnd

BattleScript_EffectGlaiveRush::
	call BattleScript_EffectHit_Ret
	jumpifmoveresultflags MOVE_RESULT_DOESNT_AFFECT_FOE, BattleScript_TryFaintMon
	setvolatile BS_ATTACKER, VOLATILE_GLAIVE_RUSH, 2
	goto BattleScript_TryFaintMon

BattleScript_SyrupBombActivates::
	printstring STRINGID_TARGETCOVEREDINSTICKYCANDYSYRUP
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_SyrupBombEndTurn::
	flushtextbox
	playanimation BS_ATTACKER, B_ANIM_SYRUP_BOMB_SPEED_DROP
	setstatchanger STAT_SPEED, 1, TRUE
	statbuffchange BS_ATTACKER, STAT_CHANGE_CHECK_PREVENTION | STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_NOT_PROTECT_AFFECTED, BattleScript_SyrupBombTurnDmgEnd
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_SyrupBombTurnDmgEnd:
	end2

BattleScript_EffectChillyReception::
	printstring STRINGID_PKMNTELLCHILLINGRECEPTIONJOKE
	waitmessage B_WAIT_TIME_LONG
	attackcanceler
	jumpifhalfword CMP_COMMON_BITS, gBattleWeather, B_WEATHER_SUN_PRIMAL, BattleScript_EffectChillyReceptionBlockedByPrimalSun
	jumpifhalfword CMP_COMMON_BITS, gBattleWeather, B_WEATHER_RAIN_PRIMAL, BattleScript_EffectChillyReceptionBlockedByPrimalRain
	jumpifhalfword CMP_COMMON_BITS, gBattleWeather, B_WEATHER_STRONG_WINDS, BattleScript_EffectChillyReceptionBlockedByStrongWinds
	call BattleScript_EffectChillyReceptionPlayAnimation
    #if B_PREFERRED_ICE_WEATHER == B_ICE_WEATHER_HAIL
	setfieldweather BATTLE_WEATHER_HAIL
    #else
	setfieldweather BATTLE_WEATHER_SNOW
    #endif
	call BattleScript_MoveWeatherChangeRet
	goto BattleScript_MoveSwitch
BattleScript_EffectChillyReceptionPlayAnimation:
	attackanimation
	waitanimation
	return
BattleScript_EffectChillyReceptionBlockedByPrimalSun:
	call BattleScript_EffectChillyReceptionTrySwitchWeatherFailed
	call BattleScript_ExtremelyHarshSunlightWasNotLessenedRet
	goto BattleScript_MoveSwitch
BattleScript_EffectChillyReceptionBlockedByPrimalRain:
	call BattleScript_EffectChillyReceptionTrySwitchWeatherFailed
	call BattleScript_NoReliefFromHeavyRainRet
	goto BattleScript_MoveSwitch
BattleScript_EffectChillyReceptionBlockedByStrongWinds:
	call BattleScript_EffectChillyReceptionTrySwitchWeatherFailed
	call BattleScript_MysteriousAirCurrentBlowsOnRet
	goto BattleScript_MoveSwitch
BattleScript_EffectChillyReceptionTrySwitchWeatherFailed:
	jumpifbattletype BATTLE_TYPE_ARENA, BattleScript_ButItFailed
	jumpifcantswitch SWITCH_IGNORE_ESCAPE_PREVENTION | BS_ATTACKER, BattleScript_ButItFailed
	call BattleScript_EffectChillyReceptionPlayAnimation
	return

BattleScript_CheckPrimalWeather:
	jumpifhalfword CMP_COMMON_BITS, gBattleWeather, B_WEATHER_SUN_PRIMAL, BattleScript_ExtremelyHarshSunlightWasNotLessened
	jumpifhalfword CMP_COMMON_BITS, gBattleWeather, B_WEATHER_RAIN_PRIMAL, BattleScript_NoReliefFromHeavyRain
	jumpifhalfword CMP_COMMON_BITS, gBattleWeather, B_WEATHER_STRONG_WINDS, BattleScript_MysteriousAirCurrentBlowsOn
	return

BattleScript_MoveSwitchPursuitEnd:
	call BattleScript_MoveSwitchPursuitRet
	end

BattleScript_MoveSwitchPursuitRet:
	jumpifbattletype BATTLE_TYPE_ARENA, BattleScript_MoveSwitchEnd
	jumpifcantswitch SWITCH_IGNORE_ESCAPE_PREVENTION | BS_ATTACKER, BattleScript_MoveSwitchEnd
	printstring STRINGID_PKMNWENTBACK
	waitmessage B_WAIT_TIME_SHORT
	jumpifnopursuitswitchdmg BattleScript_MoveSwitchOpenPartyScreen
	return

BattleScript_MoveSwitch:
	jumpifbattletype BATTLE_TYPE_ARENA, BattleScript_MoveSwitchEnd
	jumpifcantswitch SWITCH_IGNORE_ESCAPE_PREVENTION | BS_ATTACKER, BattleScript_MoveSwitchEnd
	printstring STRINGID_PKMNWENTBACK
	waitmessage B_WAIT_TIME_SHORT
BattleScript_MoveSwitchOpenPartyScreen::
	openpartyscreen BS_ATTACKER, BattleScript_MoveSwitchEnd
	switchoutabilities BS_ATTACKER
	waitstate
	switchhandleorder BS_ATTACKER, 2
	returntoball BS_ATTACKER, FALSE
	getswitchedmondata BS_ATTACKER
	switchindataupdate BS_ATTACKER
	hpthresholds BS_ATTACKER
	trytoclearprimalweather
	printstring STRINGID_EMPTYSTRING3
	waitmessage 1
	printstring STRINGID_SWITCHINMON
	switchinanim BS_ATTACKER, FALSE, TRUE
	waitstate
	switchineffects BS_ATTACKER
BattleScript_MoveSwitchEnd:
	end

BattleScript_EffectPledge::
	attackcanceler
	setpledge BattleScript_HitFromAccCheck
	pause B_WAIT_TIME_MED
	printstring STRINGID_WAITINGFORPARTNERSMOVE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectCombinedPledge_Water::
	call BattleScript_EffectHit_Pledge
	setpledgestatus BS_ATTACKER, SIDE_STATUS_RAINBOW
	pause B_WAIT_TIME_SHORTEST
	printstring STRINGID_ARAINBOWAPPEAREDONSIDE
	waitmessage B_WAIT_TIME_LONG
	playanimation BS_ATTACKER, B_ANIM_RAINBOW
	waitanimation
	goto BattleScript_MoveEnd

BattleScript_TheRainbowDisappeared::
	printstring STRINGID_THERAINBOWDISAPPEARED
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_EffectCombinedPledge_Fire::
	call BattleScript_EffectHit_Pledge
	setpledgestatus BS_TARGET, SIDE_STATUS_SEA_OF_FIRE
	pause B_WAIT_TIME_SHORTEST
	printstring STRINGID_SEAOFFIREENVELOPEDSIDE
	waitmessage B_WAIT_TIME_LONG
	playanimation BS_TARGET, B_ANIM_SEA_OF_FIRE
	waitanimation
	goto BattleScript_MoveEnd

BattleScript_HurtByTheSeaOfFire::
	printstring STRINGID_HURTBYTHESEAOFFIRE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_DoTurnDmg

BattleScript_TheSeaOfFireDisappeared::
	printstring STRINGID_THESEAOFFIREDISAPPEARED
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_EffectCombinedPledge_Grass::
	call BattleScript_EffectHit_Pledge
	setpledgestatus BS_TARGET, SIDE_STATUS_SWAMP
	pause B_WAIT_TIME_SHORTEST
	printstring STRINGID_SWAMPENVELOPEDSIDE
	waitmessage B_WAIT_TIME_LONG
	playanimation BS_TARGET, B_ANIM_SWAMP
	waitanimation
	goto BattleScript_MoveEnd

BattleScript_TheSwampDisappeared::
	printstring STRINGID_THESWAMPDISAPPEARED
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_EffectHit_Pledge::
	pause B_WAIT_TIME_MED
	printstring STRINGID_THETWOMOVESBECOMEONE
	waitmessage B_WAIT_TIME_LONG
	call BattleScript_EffectHit_RetFromAccCheck
	tryfaintmon BS_TARGET
	return

BattleScript_MoveEffectSaltCure::
	printstring STRINGID_TARGETISBEINGSALTCURED
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_SaltCureExtraDamage::
	playanimation BS_ATTACKER, B_ANIM_SALT_CURE_DAMAGE, NULL
	waitanimation
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	printstring STRINGID_TARGETISHURTBYSALTCURE
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_ATTACKER
	tryactivateitem BS_ATTACKER, ACTIVATION_ON_HP_THRESHOLD
	end2

BattleScript_EffectCorrosiveGas::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	jumpifsubstituteblocks BattleScript_CorrosiveGasFail
	jumpifcantloseitem BS_TARGET, BattleScript_CorrosiveGasFail
	attackanimation
	waitanimation
	jumpifability BS_TARGET, ABILITY_STICKY_HOLD, BattleScript_StickyHoldActivates
	setlastuseditem BS_TARGET
	removeitem BS_TARGET
	printstring STRINGID_PKMNITEMMELTED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_CorrosiveGasFail:
	pause B_WAIT_TIME_SHORT
	setmoveresultflags MOVE_RESULT_FAILED
	printstring STRINGID_NOEFFECTONTARGET
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectTakeHeart::
	attackcanceler
	curestatuswithmove BattleScript_CalmMindTryToRaiseStats
	attackanimation
	waitanimation
	updatestatusicon BS_ATTACKER
	printstring STRINGID_PKMNSTATUSNORMAL
	waitmessage B_WAIT_TIME_LONG
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPATK, MAX_STAT_STAGE, BattleScript_CalmMindStatRaise
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPDEF, MAX_STAT_STAGE, BattleScript_CalmMindStatRaise
	goto BattleScript_CantRaiseMultipleStats

BattleScript_EffectRevivalBlessing::
	attackcanceler
	tryrevivalblessing BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNREVIVEDREADYTOFIGHT
	waitmessage B_WAIT_TIME_LONG
	jumpifbyte CMP_EQUAL, gBattleCommunication, TRUE, BattleScript_EffectRevivalBlessingSendOut
	goto BattleScript_MoveEnd

BattleScript_EffectRevivalBlessingSendOut:
	getswitchedmondata BS_SCRIPTING
	switchindataupdate BS_SCRIPTING
	hpthresholds BS_SCRIPTING
	switchinanim BS_SCRIPTING, FALSE, FALSE
	waitstate
	switchineffects BS_SCRIPTING
	goto BattleScript_MoveEnd

BattleScript_StealthRockActivates::
	setstealthrock BattleScript_MoveEnd
	printfromtable gDmgHazardsStringIds
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_SpikesActivates::
	trysetspikes BattleScript_MoveEnd
	printfromtable gDmgHazardsStringIds
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_EffectAttackUpUserAlly::
	jumpifnoally BS_ATTACKER, BattleScript_EffectAttackUp
	attackcanceler
	jumpifstat BS_ATTACKER, CMP_NOT_EQUAL, STAT_ATK, MAX_STAT_STAGE, BattleScript_EffectAttackUpUserAlly_Works
	jumpifstat BS_ATTACKER_PARTNER, CMP_EQUAL, STAT_ATK, MAX_STAT_STAGE, BattleScript_ButItFailed
BattleScript_EffectAttackUpUserAlly_Works:
	attackanimation
	waitanimation
	setstatchanger STAT_ATK, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectAttackUpUserAlly_TryAlly
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectAttackUpUserAlly_TryAlly:
	setallytonexttarget BattleScript_EffectAttackUpUserAlly_TryAlly_
BattleScript_EffectAttackUpUserAlly_End:
	goto BattleScript_MoveEnd
BattleScript_EffectAttackUpUserAlly_TryAlly_:
	jumpifblockedbysoundproof BS_ATTACKER_PARTNER, BattleScript_EffectAttackUpUserAlly_TryAllyBlocked
	setstatchanger STAT_ATK, 1, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectAttackUpUserAlly_End
	jumpifbyte CMP_NOT_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_EffectAttackUpUserAlly_AllyString
	pause B_WAIT_TIME_SHORTEST
	printstring STRINGID_TARGETSTATWONTGOHIGHER
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_EffectAttackUpUserAlly_End
BattleScript_EffectAttackUpUserAlly_AllyString:
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_EffectAttackUpUserAlly_End

BattleScript_EffectAttackUpUserAlly_TryAllyBlocked:
	copybyte sBATTLER, gBattlerTarget
	call BattleScript_AbilityPopUpTarget
	printstring STRINGID_PKMNSXBLOCKSY2
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectTeatime::
	attackcanceler
	jumpifteanoberry BattleScript_ButItFailed
@ at least one battler is affected
	attackanimation
	waitanimation
	setbyte gBattlerTarget, 0
BattleScript_TeatimeLoop:
	jumpifelectricabilityaffected BS_TARGET, ABILITY_LIGHTNING_ROD, BattleScript_Teatimerod
	jumpifelectricabilityaffected BS_TARGET, ABILITY_VOLT_ABSORB, BattleScript_Teatimesorb
	jumpifelectricabilityaffected BS_TARGET, ABILITY_MOTOR_DRIVE, BattleScript_Teatimemotor
	jumpifteainvulnerable BS_TARGET, BattleScript_Teatimevul @ in semi-invulnerable state OR held item is not a Berry
	setbyte sBERRY_OVERRIDE, TRUE   @ override the requirements for eating berries
	consumeberry BS_TARGET, TRUE  @ consume the berry, then restore the item from changedItems
	setbyte sBERRY_OVERRIDE, FALSE
	removeitem BS_TARGET
	moveendto MOVEEND_NEXT_TARGET
	jumpifnexttargetvalid BattleScript_TeatimeLoop
	moveendcase MOVEEND_CLEAR_BITS
	goto BattleScript_MoveEnd
BattleScript_Teatimevul:
	moveendto MOVEEND_NEXT_TARGET
	jumpifnexttargetvalid BattleScript_TeatimeLoop
	moveendcase MOVEEND_CLEAR_BITS
	goto BattleScript_MoveEnd
BattleScript_Teatimesorb:
	call BattleScript_AbilityPopUpTarget
	tryhealquarterhealth BS_TARGET, BattleScript_Teatimesorb_end
	healthbarupdate BS_TARGET, PASSIVE_HP_UPDATE
	datahpupdate BS_TARGET, PASSIVE_HP_UPDATE
	printstring STRINGID_PKMNREGAINEDHEALTH
	waitmessage B_WAIT_TIME_LONG
BattleScript_Teatimesorb_end:
	moveendto MOVEEND_NEXT_TARGET
	jumpifnexttargetvalid BattleScript_TeatimeLoop
	moveendcase MOVEEND_CLEAR_BITS
	goto BattleScript_MoveEnd
BattleScript_Teatimerod:
	call BattleScript_AbilityPopUpTarget
	setstatchanger STAT_SPATK, 1, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_TeatimeBuffer
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_TeatimeBuffer
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
	moveendto MOVEEND_NEXT_TARGET
	jumpifnexttargetvalid BattleScript_TeatimeLoop
	moveendcase MOVEEND_CLEAR_BITS
	goto BattleScript_MoveEnd
BattleScript_Teatimemotor:
	call BattleScript_AbilityPopUpTarget
	setstatchanger STAT_SPEED, 1, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_TeatimeBuffer
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_TeatimeBuffer
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
	moveendto MOVEEND_NEXT_TARGET
	jumpifnexttargetvalid BattleScript_TeatimeLoop
	moveendcase MOVEEND_CLEAR_BITS
	goto BattleScript_MoveEnd
BattleScript_TeatimeBuffer:
	moveendto MOVEEND_NEXT_TARGET
	jumpifnexttargetvalid BattleScript_TeatimeLoop
	moveendcase MOVEEND_CLEAR_BITS
	goto BattleScript_MoveEnd

BattleScript_AffectionBasedEndurance::
	playanimation BS_TARGET, B_ANIM_AFFECTION_HANGED_ON
	printstring STRINGID_TARGETTOUGHEDITOUT
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_AffectionBasedStatusHeal::
	jumpifstatus BS_ATTACKER, STATUS1_POISON | STATUS1_TOXIC_POISON, BattleScript_AffectionBasedStatus_HealPoisonString
	jumpifstatus BS_ATTACKER, STATUS1_SLEEP, BattleScript_AffectionBasedStatus_HealSleepString
	jumpifstatus BS_ATTACKER, STATUS1_PARALYSIS, BattleScript_AffectionBasedStatus_HealParalysisString
	jumpifstatus BS_ATTACKER, STATUS1_BURN, BattleScript_AffectionBasedStatus_HealBurnString
	jumpifstatus BS_ATTACKER, STATUS1_FREEZE, BattleScript_AffectionBasedStatus_HealFreezeString
	jumpifstatus BS_ATTACKER, STATUS1_FROSTBITE, BattleScript_AffectionBasedStatus_HealFrostbiteString
	end2
BattleScript_AffectionBasedStatus_HealPoisonString:
	printstring STRINGID_ATTACKEREXPELLEDTHEPOISON
	goto BattleScript_AffectionBasedStatusHeal_Continue
BattleScript_AffectionBasedStatus_HealSleepString:
	printstring STRINGID_ATTACKERSHOOKITSELFAWAKE
	goto BattleScript_AffectionBasedStatusHeal_Continue
BattleScript_AffectionBasedStatus_HealParalysisString:
	printstring STRINGID_ATTACKERBROKETHROUGHPARALYSIS
	goto BattleScript_AffectionBasedStatusHeal_Continue
BattleScript_AffectionBasedStatus_HealBurnString:
	printstring STRINGID_ATTACKERHEALEDITSBURN
	goto BattleScript_AffectionBasedStatusHeal_Continue
BattleScript_AffectionBasedStatus_HealFreezeString:
	printstring STRINGID_ATTACKERMELTEDTHEICE
	goto BattleScript_AffectionBasedStatusHeal_Continue
BattleScript_AffectionBasedStatus_HealFrostbiteString:
	printstring STRINGID_ATTACKERHEALEDITSFROSTBITE
BattleScript_AffectionBasedStatusHeal_Continue:
	waitmessage B_WAIT_TIME_LONG
	clearstatus
	waitstate
	updatestatusicon BS_ATTACKER
	waitstate
	end2

BattleScript_ShellTrapSetUp::
	flushtextbox
	playanimation BS_ATTACKER, B_ANIM_SHELL_TRAP_SETUP, NULL
	printstring STRINGID_PREPARESHELLTRAP
	waitmessage B_WAIT_TIME_LONG
	end3

BattleScript_EffectShellTrap::
	attackcanceler
	jumpifshelltrap BS_ATTACKER, BattleScript_HitFromAccCheck
	printstring STRINGID_SHELLTRAPDIDNTWORK
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectCourtChange::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	swapsidestatuses
	attackanimation
	waitanimation
	printstring STRINGID_COURTCHANGE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_BeakBlastSetUp::
	setbeakblast
	flushtextbox
	playanimation BS_ATTACKER, B_ANIM_BEAK_BLAST_SETUP, NULL
	printstring STRINGID_HEATUPBEAK
	waitmessage B_WAIT_TIME_LONG
	end3

BattleScript_BeakBlastBurn::
	setbyte cMULTISTRING_CHOOSER, 0
	copybyte gEffectBattler, gBattlerAttacker
	call BattleScript_MoveEffectBurn
	return

BattleScript_EffectSkyDrop::
	attackcanceler
	jumpifvolatile BS_ATTACKER, VOLATILE_MULTIPLETURNS, BattleScript_SkyDropTurn2
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	jumpifsubstituteblocks BattleScript_ButItFailed
	jumpiftargetally BattleScript_ButItFailed
	jumpifunder200 BattleScript_SkyDropWork
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_TARGETTOOHEAVY
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_SkyDropWork:
	setskydrop
	call BattleScript_FirstChargingTurnAfterAttackString
	goto BattleScript_MoveEnd
BattleScript_SkyDropTurn2:
	call BattleScript_TwoTurnMovesSecondTurnRet
	clearskydrop BattleScript_SkyDropChangedTarget
	jumpiftype BS_TARGET, TYPE_FLYING, BattleScript_SkyDropFlyingType
	goto BattleScript_HitFromCritCalc
BattleScript_SkyDropFlyingType:
	makevisible BS_TARGET
	printstring STRINGID_ITDOESNTAFFECT
	waitmessage B_WAIT_TIME_LONG
	makevisible BS_ATTACKER
	jumpifvolatile BS_TARGET, VOLATILE_CONFUSION, BattleScript_SkyDropFlyingAlreadyConfused
	jumpifvolatile BS_TARGET, VOLATILE_LOCK_CONFUSE, BattleScript_SkyDropFlyingConfuseLock
	goto BattleScript_MoveEnd
BattleScript_SkyDropChangedTarget:
	pause B_WAIT_TIME_SHORT
	setmoveresultflags MOVE_RESULT_FAILED
	resultmessage
	waitmessage B_WAIT_TIME_LONG
	makevisible BS_ATTACKER
	goto BattleScript_MoveEnd

BattleScript_SkyDropFlyingConfuseLock:
	seteffectprimary BS_ATTACKER, BS_TARGET, MOVE_EFFECT_CONFUSION
BattleScript_SkyDropFlyingAlreadyConfused:
	clearvolatile BS_TARGET, VOLATILE_LOCK_CONFUSE
	jumpifvolatile BS_TARGET, VOLATILE_CONFUSION, BattleScript_MoveEnd
	setbyte BS_ATTACKER, BS_TARGET
	goto BattleScript_ThrashConfuses

BattleScript_EffectFling::
	attackcanceler
	setlastuseditem BS_ATTACKER
	accuracycheck BattleScript_FlingMissed, ACC_CURR_MOVE
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNFLUNG
	waitmessage B_WAIT_TIME_SHORT
	critcalc
	damagecalc
	adjustdamage
	removeitem BS_ATTACKER
	attackanimation
	waitanimation
	effectivenesssound
	hitanimation BS_TARGET
	waitstate
	healthbarupdate BS_TARGET, MOVE_DAMAGE_HP_UPDATE
	datahpupdate BS_TARGET, MOVE_DAMAGE_HP_UPDATE
	critmessage
	waitmessage B_WAIT_TIME_MED
	resultmessage
	waitmessage B_WAIT_TIME_MED
	jumpiflastuseditemberry BattleScript_EffectFlingConsumeBerry
	tryflingholdeffect
	goto BattleScript_FlingEnd

BattleScript_EffectFlingConsumeBerry:
	savebattleritem
	battleritemtolastuseditem
	setbyte sBERRY_OVERRIDE, 1 @ override the requirements for eating berries
	orword gHitMarker, HITMARKER_DISABLE_ANIMATION
	consumeberry BS_TARGET, FALSE
	bicword gHitMarker, HITMARKER_DISABLE_ANIMATION
	setbyte sBERRY_OVERRIDE, 0
	restorebattleritem
BattleScript_FlingEnd:
	tryfaintmon BS_TARGET
	trysymbiosis BS_ATTACKER
	goto BattleScript_MoveEnd

BattleScript_FlingFailConsumeItem::
	removeitem BS_ATTACKER
	goto BattleScript_ButItFailed

BattleScript_FlingBlockedByShieldDust::
	printstring STRINGID_ITEMWASUSEDUP
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_FlingEnd

BattleScript_FlingMissed:
	removeitem BS_ATTACKER
	goto BattleScript_MoveMissedPause

BattleScript_EffectClangorousSoul::
	attackcanceler
	cutonethirdhpandraisestats BattleScript_ButItFailed
	attackanimation
	waitanimation
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	call BattleScript_AllStatsUp
	goto BattleScript_MoveEnd

BattleScript_EffectOctolock::
	attackcanceler
	jumpifsubstituteblocks BattleScript_ButItFailed
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	trysetoctolock BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_CANTESCAPEBECAUSEOFCURRENTMOVE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_OctolockEndTurn::
	setstatchanger STAT_DEF, 1, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_NOT_PROTECT_AFFECTED, BattleScript_OctolockTryLowerSpDef, BIT_SPDEF
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_OctolockTryLowerSpDef:
	setstatchanger STAT_SPDEF, 1, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_NOT_PROTECT_AFFECTED, BattleScript_OctlockTurnDmgEnd
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_OctlockTurnDmgEnd:
	end2

BattleScript_EffectPoltergeist::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	setpoltergeistmessage BattleScript_ButItFailed
	printstring STRINGID_ABOUTTOUSEPOLTERGEIST
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_HitFromCritCalc

BattleScript_EffectTarShot::
	attackcanceler
	jumpifsubstituteblocks BattleScript_ButItFailed
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	cantarshotwork BattleScript_ButItFailed
	setstatchanger STAT_SPEED, 1, TRUE
	attackanimation
	waitanimation
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_TryTarShot
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_TryTarShot:
	trytarshot BattleScript_MoveEnd
	printstring STRINGID_PKMNBECAMEWEAKERTOFIRE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectNoRetreat::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	jumpifvolatile BS_TARGET, VOLATILE_NO_RETREAT, BattleScript_ButItFailed
	setvolatile BS_TARGET, VOLATILE_NO_RETREAT
	attackanimation
	waitanimation
	call BattleScript_AllStatsUp
	jumpifvolatile BS_TARGET, VOLATILE_ESCAPE_PREVENTION, BattleScript_MoveEnd
	seteffectprimary BS_TARGET, BS_TARGET, MOVE_EFFECT_PREVENT_ESCAPE
	printstring STRINGID_CANTESCAPEDUETOUSEDMOVE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_BothCanNoLongerEscape::
	printstring STRINGID_BOTHCANNOLONGERESCAPE
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_EffectHyperspaceFury::
	jumpifspecies SPECIES_HOOPA_UNBOUND, BattleScript_EffectHit
	jumpifspecies SPECIES_HOOPA_CONFINED, BattleScript_ButHoopaCantUseIt
	goto BattleScript_PokemonCantUseTheMove

BattleScript_ButHoopaCantUseIt:
	printstring STRINGID_BUTHOOPACANTUSEIT
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_HyperspaceFuryRemoveProtect::
	printstring STRINGID_BROKETHROUGHPROTECTION
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MoveEffectIonDeluge::
	printstring STRINGID_IONDELUGEON
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MoveEffectHaze::
	printstring STRINGID_STATCHANGESGONE
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MoveEffectLeechSeed::
	printstring STRINGID_PKMNSEEDED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_MoveEffectReflect::
	printfromtable gReflectLightScreenSafeguardStringIds
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MoveEffectLightScreen::
	printfromtable gReflectLightScreenSafeguardStringIds
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_EffectStuffCheeks::
	attackcanceler
	attackanimation
	waitanimation
	setbyte sBERRY_OVERRIDE, 1
	orword gHitMarker, HITMARKER_DISABLE_ANIMATION
	consumeberry BS_ATTACKER, TRUE
	bicword gHitMarker, HITMARKER_DISABLE_ANIMATION
	setbyte sBERRY_OVERRIDE, 0
	removeitem BS_ATTACKER
	setstatchanger STAT_DEF, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_StuffCheeksEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_StuffCheeksEnd:
	goto BattleScript_MoveEnd

BattleScript_EffectDecorate::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	jumpifstat BS_TARGET, CMP_NOT_EQUAL, STAT_ATK, 12, BattleScript_DecorateBoost
	jumpifstat BS_TARGET, CMP_NOT_EQUAL, STAT_SPATK, 12, BattleScript_DecorateBoost
	goto BattleScript_ButItFailed
BattleScript_DecorateBoost:
	attackanimation
	waitanimation
	setstatchanger STAT_ATK, 2, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_NOT_PROTECT_AFFECTED, BattleScript_DecorateBoostSpAtk, BIT_SPATK
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_DecorateBoostSpAtk
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_DecorateBoostSpAtk:
	setstatchanger STAT_SPATK, 2, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_NOT_PROTECT_AFFECTED, BattleScript_MoveEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_MoveEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectCoaching::
	attackcanceler
	jumpifnoally BS_ATTACKER, BattleScript_ButItFailed
	copybyte gBattlerTarget, gBattlerAttacker
	setallytonexttarget EffectCoaching_CheckAllyStats
	goto BattleScript_ButItFailed
EffectCoaching_CheckAllyStats:
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	jumpifstat BS_TARGET, CMP_NOT_EQUAL, STAT_ATK, MAX_STAT_STAGE, BattleScript_CoachingWorks
	jumpifstat BS_TARGET, CMP_NOT_EQUAL, STAT_DEF, MAX_STAT_STAGE, BattleScript_CoachingWorks
	goto BattleScript_ButItFailed   @ ally at max atk, def
BattleScript_CoachingWorks:
	attackanimation
	waitanimation
	setstatchanger STAT_ATK, 1, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_NOT_PROTECT_AFFECTED, BattleScript_CoachingBoostDef, BIT_DEF
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_CoachingBoostDef
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_CoachingBoostDef:
	setstatchanger STAT_DEF, 1, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_NOT_PROTECT_AFFECTED, BattleScript_MoveEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_MoveEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectJungleHealing::
	attackcanceler
	jumpifteamhealthy BattleScript_ButItFailed
	attackanimation
	waitanimation
	copybyte gBattlerTarget, gBattlerAttacker
	setbyte gBattleCommunication, 0
JungleHealing_RestoreTargetHealth:
	copybyte gBattlerAttacker, gBattlerTarget
	tryhealquarterhealth BS_TARGET, BattleScript_JungleHealing_TryCureStatus
	healthbarupdate BS_TARGET, PASSIVE_HP_UPDATE
	datahpupdate BS_TARGET, PASSIVE_HP_UPDATE
	printstring STRINGID_PKMNREGAINEDHEALTH
	waitmessage B_WAIT_TIME_LONG
BattleScript_JungleHealing_TryCureStatus:
	jumpifstatus BS_TARGET, STATUS1_ANY, BattleScript_JungleHealingCureStatus
	goto BattleScript_JungleHealingTryRestoreAlly
BattleScript_JungleHealingCureStatus:
	curestatus BS_TARGET
	updatestatusicon BS_TARGET
	printstring STRINGID_PKMNSTATUSNORMAL
	waitmessage B_WAIT_TIME_LONG
BattleScript_JungleHealingTryRestoreAlly:
	jumpifbyte CMP_NOT_EQUAL, gBattleCommunication, 0x0, BattleScript_MoveEnd
	addbyte gBattleCommunication, 1
	jumpifnoally BS_TARGET, BattleScript_MoveEnd
	setallytonexttarget JungleHealing_RestoreTargetHealth
	goto BattleScript_MoveEnd

BattleScript_EffectLifeDew::
    attackcanceler
    jumpiffullhp BS_ATTACKER, BattleScript_EffectLifeDewCheckPartner
    copybyte gBattlerTarget, gBattlerAttacker
    attackanimation
    waitanimation
    call BattleScript_EffectLifeDewHealing
    jumpifabsent BS_ATTACKER_PARTNER, BattleScript_EffectLifeDewEnd
    jumpiffullhp BS_ATTACKER_PARTNER, BattleScript_EffectLifeDewEnd
    setallytonexttarget BattleScript_EffectLifeDewNextTarget
BattleScript_EffectLifeDewNextTarget:
    call BattleScript_EffectLifeDewHealing
BattleScript_EffectLifeDewEnd:
    goto BattleScript_MoveEnd

BattleScript_EffectLifeDewCheckPartner:
    jumpifabsent BS_ATTACKER_PARTNER, BattleScript_ButItFailed
    jumpiffullhp BS_ATTACKER_PARTNER, BattleScript_ButItFailed
    attackanimation
    waitanimation
    setallytonexttarget BattleScript_EffectLifeDewNextTarget

BattleScript_EffectLifeDewHealing:
    tryhealquarterhealth BS_TARGET, BattleScript_EffectLifeDewEnd
    healthbarupdate BS_TARGET, PASSIVE_HP_UPDATE
    datahpupdate BS_TARGET, PASSIVE_HP_UPDATE
    printstring STRINGID_PKMNREGAINEDHEALTH
    waitmessage B_WAIT_TIME_LONG
    return

BattleScript_EffectAllySwitch::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	tryallyswitch BattleScript_ButItFailed
	attackanimation
	waitanimation
	@ The actual data/gfx swap happens in the move animation. Here it's just the gBattlerAttacker / scripting battler change
	allyswitchswapbattlers
	printstring STRINGID_ALLYSWITCHPOSITION
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectFairyLock::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	trysetfairylock BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_NOONEWILLBEABLETORUNAWAY
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_RemoveFireType::
	printstring STRINGID_ATTACKERLOSTFIRETYPE
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_RemoveElectricType::
	printstring STRINGID_ATTACKERLOSTELECTRICTYPE
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_RemoveGenericType::
	printstring STRINGID_ATTACKERLOSTITSTYPE
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_DefDown::
	modifybattlerstatstage BS_TARGET, STAT_DEF, DECREASE, 1, BattleScript_DefDown_Ret, ANIM_ON
BattleScript_DefDown_Ret:
	return

BattleScript_EffectPurify::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	jumpifstatus BS_TARGET, STATUS1_ANY, BattleScript_PurifyWorks
	goto BattleScript_ButItFailed
BattleScript_PurifyWorks:
	attackanimation
	waitanimation
	curestatus BS_TARGET
	updatestatusicon BS_TARGET
	printstring STRINGID_ATTACKERCUREDTARGETSTATUS
	waitmessage B_WAIT_TIME_LONG
	tryhealhalfhealth BS_ATTACKER, BattleScript_AlreadyAtFullHp
	goto BattleScript_RestoreHp

BattleScript_EffectStrengthSap::
	setstatchanger STAT_ATK, 1, TRUE
	attackcanceler
	jumpifsubstituteblocks BattleScript_ButItFailed
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	jumpifstat BS_TARGET, CMP_NOT_EQUAL, STAT_ATK, MIN_STAT_STAGE, BattleScript_StrengthSapTryLower
	pause B_WAIT_TIME_SHORT
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_MoveEnd
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd
BattleScript_StrengthSapTryLower:
	getstatvalue STAT_ATK
	jumpiffullhp BS_ATTACKER, BattleScript_StrengthSapMustLower
BattleScript_StrengthSapAnimation:
	attackanimation
	waitanimation
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_StrengthSapHp
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_CHANGE_EMPTY, BattleScript_StrengthSapHp
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
@ Drain HP without lowering a stat
BattleScript_StrengthSapHp:
	jumpifability BS_TARGET, ABILITY_LIQUID_OOZE, BattleScript_StrengthSapManipulateDmg
	jumpifvolatile BS_ATTACKER, VOLATILE_HEAL_BLOCK, BattleScript_MoveEnd
	jumpiffullhp BS_ATTACKER, BattleScript_MoveEnd
BattleScript_StrengthSapManipulateDmg:
	manipulatedamage DMG_BIG_ROOT
	jumpifability BS_TARGET, ABILITY_LIQUID_OOZE, BattleScript_StrengthSapLiquidOoze
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	printstring STRINGID_PKMNENERGYDRAINED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd
BattleScript_StrengthSapLiquidOoze:
	call BattleScript_AbilityPopUpTarget
	manipulatedamage DMG_CHANGE_SIGN
	setbyte cMULTISTRING_CHOOSER, B_MSG_ABSORB_OOZE
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	printfromtable gAbsorbDrainStringIds
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_ATTACKER
	goto BattleScript_MoveEnd
BattleScript_StrengthSapMustLower:
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_ONLY_CHECKING, BattleScript_MoveEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_CHANGE_EMPTY, BattleScript_MoveEnd
	goto BattleScript_StrengthSapAnimation

BattleScript_MoveEffectIncinerate::
	printstring STRINGID_INCINERATEBURN
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MoveEffectBugBite::
	printstring STRINGID_BUGBITE
	waitmessage B_WAIT_TIME_LONG
	orword gHitMarker, HITMARKER_DISABLE_ANIMATION
	setbyte sBERRY_OVERRIDE, 1   @ override the requirements for eating berries
	savetarget
	consumeberry BS_ATTACKER, FALSE
	bicword gHitMarker, HITMARKER_DISABLE_ANIMATION
	setbyte sBERRY_OVERRIDE, 0
	restoretarget
    trysymbiosis BS_TARGET
	return

BattleScript_MoveEffectCoreEnforcer::
	setgastroacid BattleScript_CoreEnforcerRet
	printstring STRINGID_PKMNSABILITYSUPPRESSED
	waitmessage B_WAIT_TIME_LONG
	trytoclearprimalweather
	tryrevertweatherform
	flushtextbox
BattleScript_CoreEnforcerRet:
	return

BattleScript_EffectLaserFocus::
	attackcanceler
	trysetvolatile BS_ATTACKER, VOLATILE_LASER_FOCUS, BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_LASERFOCUS
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_VCreateStatLoss::
	jumpifstat BS_ATTACKER, CMP_GREATER_THAN, STAT_DEF, MIN_STAT_STAGE, BattleScript_VCreateStatAnim
	jumpifstat BS_ATTACKER, CMP_GREATER_THAN, STAT_SPDEF, MIN_STAT_STAGE, BattleScript_VCreateStatAnim
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPEED, MIN_STAT_STAGE, BattleScript_VCreateStatLossRet
BattleScript_VCreateStatAnim:
	setstatchanger STAT_DEF, 1, TRUE
	statbuffchange BS_ATTACKER, STAT_CHANGE_NOT_PROTECT_AFFECTED | STAT_CHANGE_CERTAIN, BattleScript_VCreateTrySpDef, BIT_SPDEF | BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_VCreateTrySpDef
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_VCreateTrySpDef:
	setstatchanger STAT_SPDEF, 1, TRUE
	statbuffchange BS_ATTACKER, STAT_CHANGE_NOT_PROTECT_AFFECTED | STAT_CHANGE_CERTAIN, BattleScript_VCreateTrySpeed, BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_VCreateTrySpeed
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_VCreateTrySpeed:
	setstatchanger STAT_SPEED, 1, TRUE
	statbuffchange BS_ATTACKER, STAT_CHANGE_NOT_PROTECT_AFFECTED | STAT_CHANGE_CERTAIN, BattleScript_VCreateStatLossRet
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_VCreateStatLossRet
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_VCreateStatLossRet:
	return

BattleScript_SpectralThiefSteal::
	setbyte sB_ANIM_TURN, 1
	playmoveanimation MOVE_SPECTRAL_THIEF
	waitanimation
	setbyte sB_ANIM_TURN, 0
	printstring STRINGID_SPECTRALTHIEFSTEAL
	waitmessage B_WAIT_TIME_LONG
	setbyte sB_ANIM_ARG2, 0
	spectralthiefprintstats
	flushtextbox
	goto BattleScript_EffectSpectralThiefFromDamage

BattleScript_EffectSpectralThief::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	typecalc
	tryspectralthiefsteal BattleScript_SpectralThiefSteal
BattleScript_EffectSpectralThiefFromDamage:
	critcalc
	damagecalc
	adjustdamage
	call BattleScript_Hit_RetFromAtkAnimation
	tryfaintmon BS_TARGET
	moveendall
	end

BattleScript_EffectPartingShot::
	attackcanceler
	jumpifstat BS_TARGET, CMP_GREATER_THAN, STAT_ATK, MIN_STAT_STAGE, BattleScript_EffectPartingShotTryAtk
	jumpifstat BS_TARGET, CMP_EQUAL, STAT_SPATK, MIN_STAT_STAGE, BattleScript_CantLowerMultipleStats
BattleScript_EffectPartingShotTryAtk:
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	attackanimation
	waitanimation
	setstatchanger STAT_ATK, 1, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectPartingShotTrySpAtk, BIT_SPATK
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectPartingShotTrySpAtk:
	setstatchanger STAT_SPATK, 1, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectPartingShotSwitch
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectPartingShotSwitch:
	moveendall
	goto BattleScript_MoveSwitchPursuitEnd

BattleScript_EffectPowder::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, NO_ACC_CALC_CHECK_LOCK_ON
	jumpifvolatile BS_TARGET, VOLATILE_POWDER, BattleScript_ButItFailed
	setvolatile BS_TARGET, VOLATILE_POWDER
	attackanimation
	waitanimation
	printstring STRINGID_COVEREDINPOWDER
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectAromaticMist::
	attackcanceler
	jumpifbyteequal gBattlerTarget, gBattlerAttacker, BattleScript_ButItFailed
	jumpiftargetally BattleScript_EffectAromaticMistWorks
	goto BattleScript_ButItFailed
BattleScript_EffectAromaticMistWorks:
	setstatchanger STAT_SPDEF, 1, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ONLY_CHECKING, BattleScript_EffectAromaticMistWontGoHigher
	attackanimation
	waitanimation
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectAromaticMistEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectAromaticMistEnd:
	goto BattleScript_MoveEnd
BattleScript_EffectAromaticMistWontGoHigher:
	pause B_WAIT_TIME_SHORTEST
	printstring STRINGID_TARGETSTATWONTGOHIGHER
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_EffectAromaticMistEnd

BattleScript_EffectMagneticFlux::
	attackcanceler
	setbyte gBattleCommunication, 0
BattleScript_EffectMagneticFluxStart:
	jumpifability BS_TARGET, ABILITY_MINUS, BattleScript_EffectMagneticFluxCheckStats
	jumpifability BS_TARGET, ABILITY_PLUS, BattleScript_EffectMagneticFluxCheckStats
	goto BattleScript_EffectMagneticFluxLoop
BattleScript_EffectMagneticFluxCheckStats:
	jumpifstat BS_TARGET, CMP_LESS_THAN, STAT_DEF, MAX_STAT_STAGE, BattleScript_EffectMagneticFluxTryDef
	jumpifstat BS_TARGET, CMP_EQUAL, STAT_SPDEF, MAX_STAT_STAGE, BattleScript_EffectMagneticFluxLoop
BattleScript_EffectMagneticFluxTryDef:
	jumpifbyte CMP_NOT_EQUAL, gBattleCommunication, 0, BattleScript_EffectMagneticFluxSkipAnim
	attackanimation
	waitanimation
BattleScript_EffectMagneticFluxSkipAnim:
	setstatchanger STAT_DEF, 1, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectMagneticFluxTrySpDef, BIT_SPDEF
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_EffectMagneticFluxTrySpDef
	addbyte gBattleCommunication, 1
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectMagneticFluxTrySpDef:
	setstatchanger STAT_SPDEF, 1, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectMagneticFluxLoop
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_EffectMagneticFluxLoop
	addbyte gBattleCommunication, 1
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectMagneticFluxLoop:
	jumpifbytenotequal gBattlerTarget, gBattlerAttacker, BattleScript_EffectMagneticFluxEnd
	setallytonexttarget BattleScript_EffectMagneticFluxStart
BattleScript_EffectMagneticFluxEnd:
	jumpifbyte CMP_NOT_EQUAL, gBattleCommunication, 0, BattleScript_MoveEnd
	goto BattleScript_ButItFailed

BattleScript_EffectGearUp::
	attackcanceler
	setbyte gBattleCommunication, 0
BattleScript_EffectGearUpStart:
	jumpifability BS_TARGET, ABILITY_MINUS, BattleScript_EffectGearUpCheckStats
	jumpifability BS_TARGET, ABILITY_PLUS, BattleScript_EffectGearUpCheckStats
	goto BattleScript_EffectGearUpLoop
BattleScript_EffectGearUpCheckStats:
	jumpifstat BS_TARGET, CMP_LESS_THAN, STAT_ATK, MAX_STAT_STAGE, BattleScript_EffectGearUpTryAtk
	jumpifstat BS_TARGET, CMP_EQUAL, STAT_SPATK, MAX_STAT_STAGE, BattleScript_EffectGearUpLoop
BattleScript_EffectGearUpTryAtk:
	jumpifbyte CMP_NOT_EQUAL, gBattleCommunication, 0, BattleScript_EffectGearUpSkipAnim
	attackanimation
	waitanimation
BattleScript_EffectGearUpSkipAnim:
	setstatchanger STAT_ATK, 1, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectGearUpTrySpAtk, BIT_SPATK
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_EffectGearUpTrySpAtk
	addbyte gBattleCommunication, 1
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectGearUpTrySpAtk:
	setstatchanger STAT_SPATK, 1, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectGearUpLoop
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_EffectGearUpLoop
	addbyte gBattleCommunication, 1
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectGearUpLoop:
	jumpifbytenotequal gBattlerTarget, gBattlerAttacker, BattleScript_EffectGearUpEnd
	setallytonexttarget BattleScript_EffectGearUpStart
BattleScript_EffectGearUpEnd:
	jumpifbyte CMP_NOT_EQUAL, gBattleCommunication, 0, BattleScript_MoveEnd
	goto BattleScript_ButItFailed

BattleScript_EffectAcupressure::
	attackcanceler
	jumpifbyteequal gBattlerTarget, gBattlerAttacker, BattleScript_EffectAcupressureTry
	jumpifvolatile BS_TARGET, VOLATILE_SUBSTITUTE, BattleScript_MoveMissedPause
BattleScript_EffectAcupressureTry:
	tryacupressure BattleScript_ButItFailed
	attackanimation
	waitanimation
	statbuffchange BS_TARGET, STAT_CHANGE_CERTAIN, BattleScript_MoveEnd
	printstring STRINGID_DEFENDERSSTATROSE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_MoveEffectFeint::
	printstring STRINGID_FELLFORFEINT
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_EffectThirdType::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	trythirdtype BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_THIRDTYPEADDED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectFlowerShield::
	attackcanceler
	savetarget
	selectfirstvalidtarget
BattleScript_FlowerShieldIsAnyValidTarget:
	jumpifvolatile BS_TARGET, VOLATILE_SEMI_INVULNERABLE, BattleScript_FlowerShieldCheckNextTarget
	jumpiftype BS_TARGET, TYPE_GRASS, BattleScript_FlowerShieldLoopStart
BattleScript_FlowerShieldCheckNextTarget:
	jumpifnexttargetvalid BattleScript_FlowerShieldIsAnyValidTarget
	goto BattleScript_RestoreTargetButItFailed
BattleScript_FlowerShieldLoopStart:
	selectfirstvalidtarget
BattleScript_FlowerShieldLoop:
	movevaluescleanup
	jumpifvolatile BS_TARGET, VOLATILE_SEMI_INVULNERABLE, BattleScript_FlowerShieldMoveTargetEnd
	jumpiftype BS_TARGET, TYPE_GRASS, BattleScript_FlowerShieldLoop2
	goto BattleScript_FlowerShieldMoveTargetEnd
BattleScript_FlowerShieldLoop2:
	setstatchanger STAT_DEF, 1, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_ONLY_CHECKING, BattleScript_FlowerShieldMoveTargetEnd
	jumpifbyte CMP_LESS_THAN, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_FlowerShieldDoAnim
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_CHANGE_EMPTY, BattleScript_FlowerShieldMoveTargetEnd
	pause 21
	goto BattleScript_FlowerShieldString
BattleScript_FlowerShieldDoAnim:
	attackanimation
	waitanimation
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_FlowerShieldMoveTargetEnd
BattleScript_FlowerShieldString:
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_FlowerShieldMoveTargetEnd:
	moveendto MOVEEND_NEXT_TARGET
	jumpifnexttargetvalid BattleScript_FlowerShieldLoop
	restoretarget
	moveendfrom MOVEEND_ITEM_EFFECTS_ATTACKER_1
	end

BattleScript_EffectRototiller::
	attackcanceler
	getrototillertargets BattleScript_ButItFailed
	@ at least one battler is affected
	attackanimation
	waitanimation
	savetarget
	setbyte gBattlerTarget, 0
BattleScript_RototillerLoop:
	movevaluescleanup
	jumpifstat BS_TARGET, CMP_LESS_THAN, STAT_ATK, MAX_STAT_STAGE, BattleScript_RototillerCheckAffected
	jumpifstat BS_TARGET, CMP_EQUAL, STAT_SPATK, MAX_STAT_STAGE, BattleScript_RototillerCantRaiseMultipleStats
BattleScript_RototillerCheckAffected:
	jumpifnotrototilleraffected BattleScript_RototillerNoEffect
	setstatchanger STAT_ATK, 1, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_RototillerTrySpAtk, BIT_SPATK
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_RototillerTrySpAtk
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_RototillerTrySpAtk::
	setstatchanger STAT_SPATK, 1, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_RototillerMoveTargetEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_RototillerMoveTargetEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_RototillerMoveTargetEnd:
	moveendto MOVEEND_NEXT_TARGET
	addbyte gBattlerTarget, 1
	jumpifbytenotequal gBattlerTarget, gBattlersCount, BattleScript_RototillerLoop
	restoretarget
	end

BattleScript_RototillerCantRaiseMultipleStats:
	copybyte gBattlerAttacker, gBattlerTarget
	printstring STRINGID_STATSWONTINCREASE2
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_RototillerMoveTargetEnd

BattleScript_RototillerNoEffect:
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_NOEFFECTONTARGET
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_RototillerMoveTargetEnd

BattleScript_EffectBestow::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, NO_ACC_CALC_CHECK_LOCK_ON
	jumpifsubstituteblocks BattleScript_ButItFailed
	trybestow BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_BESTOWITEMGIVING
	waitmessage B_WAIT_TIME_LONG
	tryactivateitem BS_TARGET, ACTIVATION_ON_USABLE_AGAIN
	trysymbiosis BS_ATTACKER
	goto BattleScript_MoveEnd

BattleScript_EffectAfterYou::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	tryafteryou BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_KINDOFFER
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_MoveEffectFlameBurst::
	printstring STRINGID_BURSTINGFLAMESHIT
	waitmessage B_WAIT_TIME_LONG
	healthbarupdate BS_SCRIPTING, PASSIVE_HP_UPDATE
	datahpupdate BS_SCRIPTING, PASSIVE_HP_UPDATE
	tryfaintmon BS_SCRIPTING
	return

BattleScript_EffectPowerTrick::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	powertrick
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSWITCHEDATKANDDEF
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectPsychoShift::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	jumpifstatus BS_ATTACKER, STATUS1_ANY, BattleScript_EffectPsychoShiftCanWork
	goto BattleScript_ButItFailed
BattleScript_EffectPsychoShiftCanWork:
	jumpifstatus BS_TARGET, STATUS1_ANY, BattleScript_ButItFailed
	jumpifsafeguard BattleScript_SafeguardProtected
	trypsychoshift BattleScript_ButItFailed, BattleScript_SleepClauseBlocked
	attackanimation
	waitanimation
	copybyte gEffectBattler, gBattlerTarget
	printfromtable gStatusConditionsStringIds
	waitmessage B_WAIT_TIME_LONG
	statusanimation BS_TARGET
	updatestatusicon BS_TARGET
	curestatus BS_ATTACKER
	printstring STRINGID_PKMNSTATUSNORMAL
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_ATTACKER
	goto BattleScript_MoveEnd

BattleScript_EffectSynchronoise::
	attackcanceler
	pause B_WAIT_TIME_MED
	trysynchronoise BattleScript_MoveEnd
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	goto BattleScript_HitFromCritCalc

BattleScript_ItDoesntAffectFoe::
	savetarget
	copybyte gBattlerTarget, sBATTLER
	printstring STRINGID_ITDOESNTAFFECT
	waitmessage B_WAIT_TIME_SHORT
	flushtextbox
	restoretarget
	return

BattleScript_MoveEffectSmackDown::
	printstring STRINGID_FELLSTRAIGHTDOWN
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_EffectHitEnemyHealAlly::
	jumpiftargetally BattleScript_EffectHealPulse
	goto BattleScript_EffectHit

BattleScript_EffectDefog::
	setstatchanger STAT_EVASION, 1, TRUE
	attackcanceler
	jumpifsubstituteblocks BattleScript_DefogIfCanClearHazards
	jumpifstat BS_TARGET, CMP_NOT_EQUAL, STAT_EVASION, MIN_STAT_STAGE, BattleScript_DefogWorks
BattleScript_DefogIfCanClearHazards:
	trydefog FALSE, BattleScript_ButItFailed
BattleScript_DefogWorks:
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_ONLY_CHECKING, BattleScript_DefogTryHazardsWithAnim
	jumpifbyte CMP_LESS_THAN, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_DefogDoAnim
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_CHANGE_EMPTY, BattleScript_DefogTryHazardsWithAnim
	pause B_WAIT_TIME_SHORT
	goto BattleScript_DefogPrintString
BattleScript_DefogDoAnim::
	attackanimation
	waitanimation
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_DefogTryHazards
BattleScript_DefogPrintString::
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_DefogTryHazards:
	copybyte gEffectBattler, gBattlerAttacker
	trydefog TRUE, NULL
	copybyte gBattlerAttacker, gEffectBattler
	goto BattleScript_MoveEnd
BattleScript_DefogTryHazardsWithAnim:
	attackanimation
	waitanimation
	goto BattleScript_DefogTryHazards

BattleScript_MoveEffectDefog::
	saveattacker
	trydefog TRUE, NULL
	restoreattacker
	return

BattleScript_EffectInstruct::
	attackcanceler
	pause B_WAIT_TIME_SHORT
	tryinstruct BattleScript_ButItFailed
	attackanimation
	waitanimation
	copybyte gBattlerAttacker, gBattlerTarget
	copybyte gBattlerTarget, gEffectBattler
	printstring STRINGID_USEDINSTRUCTEDMOVE
	waitmessage B_WAIT_TIME_LONG
	jumptocalledmove TRUE

BattleScript_EffectAutotomize::
	setstatchanger STAT_SPEED, 2, FALSE
	attackcanceler
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_ONLY_CHECKING, BattleScript_AutotomizeWeightLoss
	jumpifbyte CMP_NOT_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_AutotomizeAttackAnim
	pause B_WAIT_TIME_SHORT
	goto BattleScript_AutotomizePrintString
BattleScript_AutotomizeAttackAnim::
	attackanimation
	waitanimation
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_AutotomizeWeightLoss
BattleScript_AutotomizePrintString::
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_AutotomizeWeightLoss::
	jumpifmovehadnoeffect BattleScript_MoveEnd
	tryautotomize BattleScript_MoveEnd
	printstring STRINGID_BECAMENIMBLE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_FinalGambit::
	setatkhptozero
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	tryfaintmon BS_ATTACKER
	return

BattleScript_TryHitSwitchTarget::
	forcerandomswitch BattleScript_HitSwitchTargetForceRandomSwitchFailed
	return

BattleScript_HitSwitchTargetDynamaxed::
	printstring STRINGID_MOVEBLOCKEDBYDYNAMAX
	waitmessage B_WAIT_TIME_LONG
BattleScript_HitSwitchTargetForceRandomSwitchFailed:
	setbyte sSWITCH_CASE, B_SWITCH_NORMAL
	return

BattleScript_EffectToxicThread::
	setstatchanger STAT_SPEED, 1, TRUE
	attackcanceler
	jumpifsubstituteblocks BattleScript_ButItFailed
	checknonvolatiletrigger MOVE_EFFECT_POISON, BattleScript_EffectStatDownFromAccCheck
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	attackanimation
	waitanimation
	setstatchanger STAT_SPEED, 1, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_ONLY_CHECKING, BattleScript_ToxicThreadTryPsn
	jumpifbyte CMP_LESS_THAN, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_ToxicThreadDoAnim
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_CHANGE_EMPTY, BattleScript_ToxicThreadTryPsn
	pause B_WAIT_TIME_SHORT
	goto BattleScript_ToxicThreadPrintString
BattleScript_ToxicThreadDoAnim::
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_ToxicThreadTryPsn
BattleScript_ToxicThreadPrintString::
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_ToxicThreadTryPsn::
	seteffectprimary BS_ATTACKER, BS_TARGET, MOVE_EFFECT_POISON
	goto BattleScript_MoveEnd

BattleScript_EffectVenomDrench::
	attackcanceler
	jumpifstatus BS_TARGET, STATUS1_PSN_ANY, BattleScript_EffectVenomDrenchCanBeUsed
	goto BattleScript_ButItFailed
BattleScript_EffectVenomDrenchCanBeUsed:
	jumpifstat BS_TARGET, CMP_GREATER_THAN, STAT_ATK, MIN_STAT_STAGE, BattleScript_VenomDrenchDoMoveAnim
	jumpifstat BS_TARGET, CMP_GREATER_THAN, STAT_SPATK, MIN_STAT_STAGE, BattleScript_VenomDrenchDoMoveAnim
	jumpifstat BS_TARGET, CMP_EQUAL, STAT_SPEED, MIN_STAT_STAGE, BattleScript_CantLowerMultipleStats
BattleScript_VenomDrenchDoMoveAnim::
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	attackanimation
	waitanimation
	setstatchanger STAT_ATK, 1, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_VenomDrenchTryLowerSpAtk, BIT_SPATK | BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_VenomDrenchTryLowerSpAtk
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_VenomDrenchTryLowerSpAtk::
	setstatchanger STAT_SPATK, 1, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_VenomDrenchTryLowerSpeed, BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_VenomDrenchTryLowerSpeed
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_VenomDrenchTryLowerSpeed::
	setstatchanger STAT_SPEED, 1, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_VenomDrenchEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_VenomDrenchEnd
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_VenomDrenchEnd::
	goto BattleScript_MoveEnd

BattleScript_EffectNobleRoar::
	attackcanceler
	jumpifstat BS_TARGET, CMP_GREATER_THAN, STAT_ATK, MIN_STAT_STAGE, BattleScript_NobleRoarDoMoveAnim
	jumpifstat BS_TARGET, CMP_EQUAL, STAT_SPATK, MIN_STAT_STAGE, BattleScript_CantLowerMultipleStats
BattleScript_NobleRoarDoMoveAnim::
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	attackanimation
	waitanimation
	setstatchanger STAT_ATK, 1, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_NobleRoarTryLowerSpAtk, BIT_SPATK
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_NobleRoarTryLowerSpAtk
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_NobleRoarTryLowerSpAtk::
	setstatchanger STAT_SPATK, 1, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_NobleRoarEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_NobleRoarEnd
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_NobleRoarEnd::
	goto BattleScript_MoveEnd

BattleScript_EffectShellSmash::
	attackcanceler
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_ATK, MAX_STAT_STAGE, BattleScript_ShellSmashTryDef
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPATK, MAX_STAT_STAGE, BattleScript_ShellSmashTryDef
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPEED, MAX_STAT_STAGE, BattleScript_ShellSmashTryDef
	jumpifstat BS_ATTACKER, CMP_GREATER_THAN, STAT_DEF, MIN_STAT_STAGE, BattleScript_ShellSmashTryDef
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPDEF, MIN_STAT_STAGE, BattleScript_ButItFailed
BattleScript_ShellSmashTryDef::
	attackanimation
	waitanimation
	setstatchanger STAT_DEF, 1, TRUE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_CERTAIN, BattleScript_ShellSmashTrySpDef, BIT_SPDEF
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_ShellSmashTrySpDef
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_ShellSmashTrySpDef:
	setstatchanger STAT_SPDEF, 1, TRUE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_CERTAIN, BattleScript_ShellSmashTryAttack
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_ShellSmashTryAttack
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_ShellSmashTryAttack:
	setstatchanger STAT_ATK, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_ShellSmashTrySpAtk, BIT_SPATK | BIT_SPEED,
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_ShellSmashTrySpAtk
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_ShellSmashTrySpAtk:
	setstatchanger STAT_SPATK, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_ShellSmashTrySpeed, BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_ShellSmashTrySpeed
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_ShellSmashTrySpeed:
	setstatchanger STAT_SPEED, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_ShellSmashEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_ShellSmashEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_ShellSmashEnd:
	goto BattleScript_MoveEnd

BattleScript_EffectGrowth::
	attackcanceler
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_ATK, MAX_STAT_STAGE, BattleScript_GrowthDoMoveAnim
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPATK, MAX_STAT_STAGE, BattleScript_CantRaiseMultipleStats
BattleScript_GrowthDoMoveAnim::
	attackanimation
	waitanimation
	jumpifweatheraffected B_WEATHER_SUN, BattleScript_GrowthAtk2
	setstatchanger STAT_ATK, 1, FALSE
	goto BattleScript_GrowthAtk
BattleScript_GrowthAtk2:
	setstatchanger STAT_ATK, 2, FALSE
BattleScript_GrowthAtk:
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_GrowthTrySpAtk, BIT_SPATK
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_GrowthTrySpAtk
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_GrowthTrySpAtk::
	jumpifweatheraffected B_WEATHER_SUN, BattleScript_GrowthSpAtk2
	setstatchanger STAT_SPATK, 1, FALSE
	goto BattleScript_GrowthSpAtk
BattleScript_GrowthSpAtk2:
	setstatchanger STAT_SPATK, 2, FALSE
BattleScript_GrowthSpAtk:
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_GrowthEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_GrowthEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_GrowthEnd:
	goto BattleScript_MoveEnd

BattleScript_EffectSoak::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	jumpifability BS_TARGET, ABILITY_MULTITYPE, BattleScript_ButItFailed
	jumpifability BS_TARGET, ABILITY_RKS_SYSTEM, BattleScript_ButItFailed
	jumpifsubstituteblocks BattleScript_ButItFailed
	attackanimation
	waitanimation
	trysoak BattleScript_ButItFailed
	printstring STRINGID_TARGETCHANGEDTYPE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectReflectType::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	tryreflecttype BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_REFLECTTARGETSTYPE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectElectrify::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	tryelectrify BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_TARGETELECTRIFIED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectShiftGear::
	attackcanceler
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPEED, MAX_STAT_STAGE, BattleScript_ShiftGearDoMoveAnim
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_ATK, MAX_STAT_STAGE, BattleScript_CantRaiseMultipleStats
BattleScript_ShiftGearDoMoveAnim:
	attackanimation
	waitanimation
	jumpifstat BS_ATTACKER, CMP_GREATER_THAN, STAT_SPEED, 10, BattleScript_ShiftGearSpeedBy1
	setstatchanger STAT_SPEED, 2, FALSE
	goto BattleScript_ShiftGearDoSpeed
BattleScript_ShiftGearSpeedBy1:
	setstatchanger STAT_SPEED, 1, FALSE
BattleScript_ShiftGearDoSpeed:
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_ShiftGearTryAtk, BIT_ATK
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_ShiftGearTryAtk
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_ShiftGearTryAtk:
	setstatchanger STAT_ATK, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_ShiftGearEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_ShiftGearEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_ShiftGearEnd:
	goto BattleScript_MoveEnd

BattleScript_EffectCoil::
	attackcanceler
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_ATK, MAX_STAT_STAGE, BattleScript_CoilDoMoveAnim
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_DEF, MAX_STAT_STAGE, BattleScript_CoilDoMoveAnim
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_ACC, MAX_STAT_STAGE, BattleScript_CantRaiseMultipleStats
BattleScript_CoilDoMoveAnim:
	attackanimation
	waitanimation
	setstatchanger STAT_ATK, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_CoilTryDef, BIT_DEF | BIT_ACC
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_CoilTryDef
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_CoilTryDef:
	setstatchanger STAT_DEF, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_CoilTryAcc, BIT_ACC
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_CoilTryAcc
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_CoilTryAcc:
	setstatchanger STAT_ACC, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_CoilEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_CoilEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_CoilEnd:
	goto BattleScript_MoveEnd

BattleScript_EffectQuiverDance::
	attackcanceler
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPATK, MAX_STAT_STAGE, BattleScript_QuiverDanceDoMoveAnim
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPDEF, MAX_STAT_STAGE, BattleScript_QuiverDanceDoMoveAnim
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPEED, MAX_STAT_STAGE, BattleScript_CantRaiseMultipleStats
BattleScript_QuiverDanceDoMoveAnim::
	attackanimation
	waitanimation
	setstatchanger STAT_SPATK, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_QuiverDanceTrySpDef, BIT_SPDEF | BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_QuiverDanceTrySpDef
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_QuiverDanceTrySpDef::
	setstatchanger STAT_SPDEF, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_QuiverDanceTrySpeed, BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_QuiverDanceTrySpeed
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_QuiverDanceTrySpeed::
	setstatchanger STAT_SPEED, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_QuiverDanceEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_QuiverDanceEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_QuiverDanceEnd::
	goto BattleScript_MoveEnd

BattleScript_EffectVictoryDance::
	attackcanceler
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_ATK, MAX_STAT_STAGE, BattleScript_VictoryDanceDoMoveAnim
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_DEF, MAX_STAT_STAGE, BattleScript_VictoryDanceDoMoveAnim
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPEED, MAX_STAT_STAGE, BattleScript_CantRaiseMultipleStats
BattleScript_VictoryDanceDoMoveAnim::
	attackanimation
	waitanimation
	setstatchanger STAT_ATK, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_VictoryDanceTryDef, BIT_DEF | BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_VictoryDanceTryDef
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_VictoryDanceTryDef::
	setstatchanger STAT_DEF, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_VictoryDanceTrySpeed, BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_VictoryDanceTrySpeed
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_VictoryDanceTrySpeed::
	setstatchanger STAT_SPEED, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_VictoryDanceEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_VictoryDanceEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_VictoryDanceEnd::
	goto BattleScript_MoveEnd

BattleScript_EffectAttackSpAttackUp::
	attackcanceler
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_ATK, MAX_STAT_STAGE, BattleScript_AttackSpAttackUpDoMoveAnim
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPATK, MAX_STAT_STAGE, BattleScript_CantRaiseMultipleStats
BattleScript_AttackSpAttackUpDoMoveAnim::
	attackanimation
	waitanimation
	setstatchanger STAT_ATK, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_AttackSpAttackUpTrySpAtk, BIT_SPATK
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_AttackSpAttackUpTrySpAtk
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_AttackSpAttackUpTrySpAtk::
	setstatchanger STAT_SPATK, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_AttackSpAttackUpEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_AttackSpAttackUpEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_AttackSpAttackUpEnd:
	goto BattleScript_MoveEnd

BattleScript_EffectAttackAccUp::
	attackcanceler
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_ATK, MAX_STAT_STAGE, BattleScript_AttackAccUpDoMoveAnim
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_ACC, MAX_STAT_STAGE, BattleScript_CantRaiseMultipleStats
BattleScript_AttackAccUpDoMoveAnim::
	attackanimation
	waitanimation
	setstatchanger STAT_ATK, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_AttackAccUpTryAcc, BIT_ACC
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_AttackAccUpTryAcc
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_AttackAccUpTryAcc::
	setstatchanger STAT_ACC, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_AttackAccUpEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_AttackAccUpEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_AttackAccUpEnd:
	goto BattleScript_MoveEnd

BattleScript_EffectMistyTerrain::
BattleScript_EffectGrassyTerrain::
BattleScript_EffectElectricTerrain::
BattleScript_EffectPsychicTerrain::
	attackcanceler
	setterrain BattleScript_ButItFailed
	attackanimation
	waitanimation
	printfromtable gTerrainStringIds
	waitmessage B_WAIT_TIME_LONG
	playanimation BS_ATTACKER, B_ANIM_RESTORE_BG
	call BattleScript_ActivateTerrainEffects
	goto BattleScript_MoveEnd

BattleScript_EffectTopsyTurvy::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	jumpifstat BS_TARGET, CMP_NOT_EQUAL, STAT_ATK, 6, BattleScript_EffectTopsyTurvyWorks
	jumpifstat BS_TARGET, CMP_NOT_EQUAL, STAT_DEF, 6, BattleScript_EffectTopsyTurvyWorks
	jumpifstat BS_TARGET, CMP_NOT_EQUAL, STAT_SPATK, 6, BattleScript_EffectTopsyTurvyWorks
	jumpifstat BS_TARGET, CMP_NOT_EQUAL, STAT_SPDEF, 6, BattleScript_EffectTopsyTurvyWorks
	jumpifstat BS_TARGET, CMP_NOT_EQUAL, STAT_SPEED, 6, BattleScript_EffectTopsyTurvyWorks
	jumpifstat BS_TARGET, CMP_NOT_EQUAL, STAT_ACC, 6, BattleScript_EffectTopsyTurvyWorks
	jumpifstat BS_TARGET, CMP_EQUAL, STAT_EVASION, 6, BattleScript_ButItFailed
BattleScript_EffectTopsyTurvyWorks:
	attackanimation
	waitanimation
	invertstatstages
	printstring STRINGID_TOPSYTURVYSWITCHEDSTATS
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectIonDeluge::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	orword gFieldStatuses, STATUS_FIELD_ION_DELUGE
	attackanimation
	waitanimation
	printstring STRINGID_IONDELUGEON
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectQuash::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	tryquash BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_QUASHSUCCESS
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectHealPulse::
	attackcanceler
	jumpifvolatile BS_ATTACKER, VOLATILE_HEAL_BLOCK, BattleScript_MoveUsedHealBlockPrevents @ stops pollen puff
	jumpifvolatile BS_TARGET, VOLATILE_HEAL_BLOCK, BattleScript_MoveUsedHealBlockPrevents
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	jumpifsubstituteblocks BattleScript_ButItFailed
	tryhealpulse BattleScript_AlreadyAtFullHp
	attackanimation
	waitanimation
	healthbarupdate BS_TARGET, PASSIVE_HP_UPDATE
	datahpupdate BS_TARGET, PASSIVE_HP_UPDATE
	printstring STRINGID_PKMNREGAINEDHEALTH
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectEntrainment::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	tryentrainment BattleScript_ButItFailed
	attackanimation
	waitanimation
	switchinabilities BS_TARGET
	printstring STRINGID_PKMNACQUIREDABILITY
	waitmessage B_WAIT_TIME_LONG
	trytoclearprimalweather
	tryrevertweatherform
	flushtextbox
	tryendneutralizinggas
	goto BattleScript_MoveEnd

BattleScript_EffectLuckyChant::
	attackcanceler
	setluckychant BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_SHIELDEDFROMCRITICALHITS
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectMetalBurst::
	attackcanceler
	metalburstdamagecalculator BattleScript_ButItFailed
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	typecalc
	clearmoveresultflags MOVE_RESULT_NOT_VERY_EFFECTIVE | MOVE_RESULT_SUPER_EFFECTIVE
	adjustdamage
	goto BattleScript_HitFromAtkAnimation

BattleScript_EffectHealingWish::
	attackcanceler
	jumpifcantswitch SWITCH_IGNORE_ESCAPE_PREVENTION | BS_ATTACKER, BattleScript_ButItFailed
	attackanimation
	waitanimation
	instanthpdrop
	setatkhptozero
	tryfaintmon BS_ATTACKER
	storehealingwish BS_ATTACKER
	jumpifgenconfiglowerthan GEN_CONFIG_HEALING_WISH_SWITCH, GEN_5, BattleScript_EffectHealingWishGen4
BattleScript_EffectHealingWishEnd:
	moveendall
	end
BattleScript_EffectHealingWishGen4:
	openpartyscreen BS_ATTACKER, BattleScript_EffectHealingWishEnd
	waitstate
	switchhandleorder BS_ATTACKER, 2
	returnatktoball
	getswitchedmondata BS_ATTACKER
	switchindataupdate BS_ATTACKER
	hpthresholds BS_ATTACKER
	trytoclearprimalweather
	tryrevertweatherform
	flushtextbox
	tryendneutralizinggas
	flushtextbox
	printstring STRINGID_SWITCHINMON
	switchinanim BS_ATTACKER, FALSE, TRUE
	waitstate
	switchineffects BS_ATTACKER
	goto BattleScript_EffectHealingWishEnd

BattleScript_HealingWishActivates::
	setbyte cMULTISTRING_CHOOSER, 0
	goto BattleScript_EffectHealingWishRestore
BattleScript_LunarDanceActivates::
	setbyte cMULTISTRING_CHOOSER, 1
	restoremovepp
BattleScript_EffectHealingWishRestore:
	printfromtable gHealingWishStringIds
	waitmessage B_WAIT_TIME_LONG
	playanimation BS_ATTACKER, B_ANIM_WISH_HEAL
	waitanimation
	dmgtomaxattackerhp
	manipulatedamage DMG_CHANGE_SIGN
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	clearstatus
	waitstate
	updatestatusicon BS_ATTACKER
	waitstate
	printstring STRINGID_HEALINGWISHHEALED
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_EffectOverwriteAbility::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	tryoverwriteability BattleScript_ButItFailed
	attackanimation
	waitanimation
	copybyte gBattlerAbility, gBattlerTarget
	call BattleScript_AbilityPopUpOverwriteThenNormal
	recordability BS_TARGET
	printstring STRINGID_PKMNACQUIREDABILITY
	waitmessage B_WAIT_TIME_LONG
	trytoclearprimalweather
	tryrevertweatherform
	flushtextbox
	tryendneutralizinggas
	goto BattleScript_MoveEnd

BattleScript_EffectPowerSplit::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	averagestats STAT_ATK
	averagestats STAT_SPATK
	attackanimation
	waitanimation
	printstring STRINGID_SHAREDITSPOWER
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectGuardSplit::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	averagestats STAT_DEF
	averagestats STAT_SPDEF
	attackanimation
	waitanimation
	printstring STRINGID_SHAREDITSGUARD
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectHeartSwap::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	swapstatstages STAT_ATK
	swapstatstages STAT_DEF
	swapstatstages STAT_SPEED
	swapstatstages STAT_SPATK
	swapstatstages STAT_SPDEF
	swapstatstages STAT_EVASION
	swapstatstages STAT_ACC
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSWITCHEDSTATCHANGES
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectPowerSwap::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	swapstatstages STAT_ATK
	swapstatstages STAT_SPATK
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSWITCHEDSTATCHANGES
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectGuardSwap::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	swapstatstages STAT_DEF
	swapstatstages STAT_SPDEF
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSWITCHEDSTATCHANGES
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectSpeedSwap::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	swapstats STAT_SPEED
	attackanimation
	waitanimation
	printstring STRINGID_ATTACKERSWITCHEDSTATWITHTARGET
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectTelekinesis::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, NO_ACC_CALC_CHECK_LOCK_ON
	settelekinesis BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_HURLEDINTOTHEAIR
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectStealthRock::
	attackcanceler
	setstealthrock BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_POINTEDSTONESFLOAT
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectStickyWeb::
	attackcanceler
	setstickyweb BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_STICKYWEBUSED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectGastroAcid::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	jumpifvolatile BS_TARGET, VOLATILE_GASTRO_ACID, BattleScript_ButItFailed
	setgastroacid BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSABILITYSUPPRESSED
	waitmessage B_WAIT_TIME_LONG
	trytoclearprimalweather
	tryrevertweatherform
	flushtextbox
	tryendneutralizinggas
	goto BattleScript_MoveEnd

BattleScript_EffectToxicSpikes::
	attackcanceler
	settoxicspikes BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_POISONSPIKESSCATTERED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectMagnetRise::
	attackcanceler
	jumpifvolatile BS_ATTACKER, VOLATILE_ROOT, BattleScript_ButItFailed
	jumpifvolatile BS_ATTACKER, VOLATILE_SMACK_DOWN, BattleScript_ButItFailed
	trysetvolatile BS_ATTACKER, VOLATILE_MAGNET_RISE, BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNLEVITATEDONELECTROMAGNETISM
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectTrickRoom::
	attackcanceler
	setroom
	attackanimation
	waitanimation
	printfromtable gRoomsStringIds
	waitmessage B_WAIT_TIME_LONG
	call BattleScript_TryRoomServiceLoop
	goto BattleScript_MoveEnd

BattleScript_TryRoomServiceLoop:
	savetarget
	setbyte gBattlerTarget, 0
BattleScript_RoomServiceLoop:
	copybyte sBATTLER, gBattlerTarget
	tryroomservice BS_TARGET, BattleScript_RoomServiceLoop_NextBattler
	removeitem BS_TARGET
BattleScript_RoomServiceLoop_NextBattler:
	addbyte gBattlerTarget, 0x1
	jumpifbytenotequal gBattlerTarget, gBattlersCount, BattleScript_RoomServiceLoop
	restoretarget
	return

BattleScript_EffectWonderRoom::
BattleScript_EffectMagicRoom::
	attackcanceler
	setroom
	attackanimation
	waitanimation
	printfromtable gRoomsStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectAquaRing::
	attackcanceler
	setvolatile BS_ATTACKER, VOLATILE_AQUA_RING
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSURROUNDEDWITHVEILOFWATER
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectEmbargo::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	setembargo BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNCANTUSEITEMSANYMORE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectTailwind::
	attackcanceler
	settailwind BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_TAILWINDBLEW
	waitmessage B_WAIT_TIME_LONG
	call BattleScript_TryTailwindAbilitiesLoop
	goto BattleScript_MoveEnd

BattleScript_TryTailwindAbilitiesLoop:
	savetarget
	setbyte gBattlerTarget, 0
BattleScript_TryTailwindAbilitiesLoop_Iter:
	trywindriderpower BS_TARGET, BattleScript_TryTailwindAbilitiesLoop_Increment
	jumpifability BS_TARGET, ABILITY_WIND_RIDER, BattleScript_TryTailwindAbilitiesLoop_WindRider
	jumpifability BS_TARGET, ABILITY_WIND_POWER, BattleScript_TryTailwindAbilitiesLoop_WindPower
BattleScript_TryTailwindAbilitiesLoop_Increment:
	addbyte gBattlerTarget, 0x1
	jumpifbytenotequal gBattlerTarget, gBattlersCount, BattleScript_TryTailwindAbilitiesLoop_Iter
	restoretarget
	return

BattleScript_TryTailwindAbilitiesLoop_WindRider:
	call BattleScript_AbilityPopUp
	modifybattlerstatstage BS_TARGET, STAT_ATK, INCREASE, 1, BattleScript_TryTailwindAbilitiesLoop_Increment, ANIM_ON
	goto BattleScript_TryTailwindAbilitiesLoop_Increment

BattleScript_TryTailwindAbilitiesLoop_WindPower:
	call BattleScript_AbilityPopUp
	setcharge BS_TARGET
	printstring STRINGID_BEINGHITCHARGEDPKMNWITHPOWER
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_TryTailwindAbilitiesLoop_Increment

BattleScript_EffectMiracleEye::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	setvolatile BS_TARGET, VOLATILE_MIRACLE_EYE
	goto BattleScript_IdentifiedFoe

BattleScript_EffectGravity::
	call BattleScript_EffectGravityInternal
	goto BattleScript_MoveEnd

BattleScript_EffectGravityInternal:
	attackcanceler
	setgravity BattleScript_ButItFailed
	attackanimation
	waitanimation
BattleScript_EffectGravitySuccess::
	printstring STRINGID_GRAVITYINTENSIFIED
	waitmessage B_WAIT_TIME_LONG
	savetarget
	selectfirstvalidtarget
BattleScript_GravityLoop:
	movevaluescleanup
	jumpfifsemiinvulnerable BS_TARGET, STATE_ON_AIR, BattleScript_GravityLoopDrop
	jumpifvolatile BS_TARGET, VOLATILE_MAGNET_RISE, BattleScript_GravityLoopDrop
	jumpifvolatile BS_TARGET, VOLATILE_TELEKINESIS, BattleScript_GravityLoopDrop
	goto BattleScript_GravityLoopEnd
BattleScript_GravityLoopDrop:
	gravityonairbornemons
	printstring STRINGID_GRAVITYGROUNDING
	waitmessage B_WAIT_TIME_LONG
BattleScript_GravityLoopEnd:
	moveendcase MOVEEND_TARGET_VISIBLE
	jumpifnexttargetvalid BattleScript_GravityLoop
	restoretarget
	return

BattleScript_EffectRoost::
	attackcanceler
	tryhealhalfhealth BS_TARGET, BattleScript_AlreadyAtFullHp
	setroost
	goto BattleScript_PresentHealTarget

BattleScript_EffectCaptivate::
	setstatchanger STAT_SPATK, 2, TRUE
	attackcanceler
	jumpifsubstituteblocks BattleScript_ButItFailed
	jumpifcaptivateaffected BattleScript_CaptivateCheckAcc
	goto BattleScript_ButItFailed
BattleScript_CaptivateCheckAcc:
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	goto BattleScript_EffectStatDownFromStatBuffChange

BattleScript_EffectHealBlock::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	jumpifability BS_TARGET_SIDE, ABILITY_AROMA_VEIL, BattleScript_AromaVeilProtects
	sethealblock BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNPREVENTEDFROMHEALING
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectHitEscape::
	jumpiffainted BS_TARGET, FALSE, BattleScript_HitEscapeSwitch
	setbyte sGIVEEXP_STATE, 0
	getexp BS_TARGET
BattleScript_HitEscapeSwitch:
	call BattleScript_MoveSwitchPursuitRet
	return

BattleScript_EffectPlaceholder::
	attackcanceler
	pause 5
	printstring STRINGID_NOTDONEYET
	goto BattleScript_MoveEnd

BattleScript_EffectHit::
	attackcanceler
BattleScript_HitFromAccCheck::
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
BattleScript_HitFromAtkString::
BattleScript_HitFromCritCalc::
	critcalc
	damagecalc
	adjustdamage
BattleScript_HitFromAtkAnimation::
	call BattleScript_Hit_RetFromAtkAnimation
BattleScript_TryFaintMon::
	tryfaintmon BS_TARGET
BattleScript_MoveEnd::
	moveendall
	end

BattleScript_EffectHit_Ret::
	attackcanceler
BattleScript_EffectHit_RetFromAccCheck::
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
BattleScript_EffectHit_RetFromCritCalc::
	critcalc
	damagecalc
	adjustdamage
BattleScript_Hit_RetFromAtkAnimation::
	attackanimation
	waitanimation
	effectivenesssound
	hitanimation BS_TARGET
	waitstate
	healthbarupdate BS_TARGET, MOVE_DAMAGE_HP_UPDATE
	datahpupdate BS_TARGET, MOVE_DAMAGE_HP_UPDATE
	critmessage
	waitmessage B_WAIT_TIME_LONG
	resultmessage
	waitmessage B_WAIT_TIME_LONG
	setadditionaleffects
	return

BattleScript_EffectNaturalGift::
	attackcanceler
	jumpifnotberry BS_ATTACKER, BattleScript_ButItFailed
	jumpifword CMP_COMMON_BITS, gFieldStatuses, STATUS_FIELD_MAGIC_ROOM, BattleScript_ButItFailed
	jumpifability BS_ATTACKER, ABILITY_KLUTZ, BattleScript_ButItFailed
	jumpifvolatile BS_ATTACKER, VOLATILE_EMBARGO, BattleScript_ButItFailed
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	call BattleScript_HitFromCritCalc

BattleScript_MakeMoveMissed::
	setmoveresultflags MOVE_RESULT_MISSED
BattleScript_MoveMissedPause::
	pause B_WAIT_TIME_SHORT
BattleScript_MoveMissed::
	effectivenesssound
	resultmessage
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_TerrainPreventsEnd2::
	pause B_WAIT_TIME_SHORT
	printfromtable gTerrainPreventsStringIds
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_ImmunityProtectedEnd2::
	call BattleScript_AbilityPopUp
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_ITDOESNTAFFECT
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_ElectricTerrainPrevents::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_ELECTRICTERRAINPREVENTS
	waitmessage B_WAIT_TIME_LONG
	setmoveresultflags MOVE_RESULT_FAILED
	goto BattleScript_MoveEnd

BattleScript_MistyTerrainPrevents::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_MISTYTERRAINPREVENTS
	waitmessage B_WAIT_TIME_LONG
	setmoveresultflags MOVE_RESULT_FAILED
	goto BattleScript_MoveEnd

BattleScript_FlowerVeilProtectsRet::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_FLOWERVEILPROTECTED
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_FlowerVeilProtects::
	call BattleScript_FlowerVeilProtectsRet
	setmoveresultflags MOVE_RESULT_FAILED
	goto BattleScript_MoveEnd

BattleScript_SweetVeilProtectsRet::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_FLOWERVEILPROTECTED
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_SweetVeilProtects:
	call BattleScript_SweetVeilProtectsRet
	setmoveresultflags MOVE_RESULT_FAILED
	goto BattleScript_MoveEnd

BattleScript_AromaVeilProtectsRet::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_AROMAVEILPROTECTED
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_AromaVeilProtects:
	call BattleScript_AromaVeilProtectsRet
	setmoveresultflags MOVE_RESULT_FAILED
	goto BattleScript_MoveEnd

BattleScript_AbilityProtectsDoesntAffectRet::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_ITDOESNTAFFECT
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_AbilityProtectsDoesntAffect::
	call BattleScript_AbilityProtectsDoesntAffectRet
	setmoveresultflags MOVE_RESULT_FAILED
	goto BattleScript_MoveEnd

BattleScript_InsomniaProtects::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNSTAYEDAWAKEUSING
	waitmessage B_WAIT_TIME_LONG
	setmoveresultflags MOVE_RESULT_FAILED
	goto BattleScript_MoveEnd

BattleScript_AlreadyAsleep::
	setalreadystatusedmoveattempt
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNALREADYASLEEP
	waitmessage B_WAIT_TIME_LONG
	setmoveresultflags MOVE_RESULT_FAILED
	goto BattleScript_MoveEnd

BattleScript_CantMakeAsleep::
	pause B_WAIT_TIME_SHORT
	printfromtable gUproarAwakeStringIds
	waitmessage B_WAIT_TIME_LONG
	setmoveresultflags MOVE_RESULT_FAILED
	goto BattleScript_MoveEnd

BattleScript_EffectAbsorbLiquidOoze::
	call BattleScript_AbilityPopUpTarget
	jumpifability BS_ATTACKER, ABILITY_MAGIC_GUARD, BattleScript_EffectAbsorbRet
	goto BattleScript_EffectAbsorb

BattleScript_EffectAbsorb::
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	printfromtable gAbsorbDrainStringIds
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_ATTACKER
BattleScript_EffectAbsorbRet:
	return

BattleScript_EffectExplosion::
	attackcanceler
	tryexplosion
	setatkhptozero
	waitstate
	jumpiffainted BS_TARGET, TRUE, BattleScript_MoveEnd
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	goto BattleScript_HitFromCritCalc

BattleScript_FaintAttackerForExplosion::
	tryfaintmon BS_ATTACKER
	return

BattleScript_MaxHp50Recoil::
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	tryfaintmon BS_ATTACKER
	return

BattleScript_EffectDreamEater::
	attackcanceler
	jumpifsubstituteblocks BattleScript_DoesntAffectTargetAtkString
	jumpifstatus BS_TARGET, STATUS1_SLEEP, BattleScript_HitFromAccCheck
	jumpifability BS_TARGET, ABILITY_COMATOSE, BattleScript_HitFromAccCheck
	goto BattleScript_DoesntAffectTargetAtkString

BattleScript_EffectAttackUp::
	setstatchanger STAT_ATK, 1, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectDefenseUp::
	setstatchanger STAT_DEF, 1, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectSpecialAttackUp::
	setstatchanger STAT_SPATK, 1, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectSpeedUp::
	setstatchanger STAT_SPEED, 1, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectSpecialDefenseUp::
	setstatchanger STAT_SPDEF, 1, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectAccuracyUp::
	setstatchanger STAT_ACC, 1, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectEvasionUp::
	setstatchanger STAT_EVASION, 1, FALSE
BattleScript_EffectStatUp::
	attackcanceler
BattleScript_EffectStatUpAfterAtkCanceler::
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_ONLY_CHECKING, BattleScript_StatUpEnd
	jumpifbyte CMP_NOT_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_StatUpAttackAnim
	pause B_WAIT_TIME_SHORT
	goto BattleScript_StatUpPrintString
BattleScript_StatUpAttackAnim::
	attackanimation
	waitanimation
BattleScript_StatUpDoAnim::
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_StatUpEnd
BattleScript_StatUpPrintString::
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_StatUpEnd::
	goto BattleScript_MoveEnd

BattleScript_StatUp::
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_EffectAttackDown::
	setstatchanger STAT_ATK, 1, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectDefenseDown::
	setstatchanger STAT_DEF, 1, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectSpeedDown::
	setstatchanger STAT_SPEED, 1, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectAccuracyDown::
	setstatchanger STAT_ACC, 1, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectSpecialAttackDown::
	setstatchanger STAT_SPATK, 1, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectSpecialDefenseDown::
	setstatchanger STAT_SPDEF, 1, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectEvasionDown::
	setstatchanger STAT_EVASION, 1, TRUE
BattleScript_EffectStatDown:
	attackcanceler
	jumpifsubstituteblocks BattleScript_ButItFailed
BattleScript_EffectStatDownFromAccCheck:
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
BattleScript_EffectStatDownFromStatBuffChange:
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_ONLY_CHECKING, BattleScript_StatDownEnd
	jumpifbyte CMP_LESS_THAN, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_StatDownDoAnim
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_CHANGE_EMPTY, BattleScript_StatDownEnd
	pause B_WAIT_TIME_SHORT
	goto BattleScript_StatDownPrintString
BattleScript_StatDownDoAnim::
	attackanimation
	waitanimation
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_StatDownEnd
	bicword gHitMarker, HITMARKER_DISABLE_ANIMATION
BattleScript_StatDownPrintString::
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_StatDownEnd::
	goto BattleScript_MoveEnd

BattleScript_MirrorArmorReflect::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	jumpifvolatile BS_ATTACKER, VOLATILE_SUBSTITUTE, BattleScript_MirrorArmorDoesntAffect
BattleScript_MirrorArmorReflectStatLoss:
	statbuffchange BS_ATTACKER, STAT_CHANGE_MIRROR_ARMOR | STAT_CHANGE_NOT_PROTECT_AFFECTED | STAT_CHANGE_ALLOW_PTR, BattleScript_MirrorArmorReflectEnd
	jumpifbyte CMP_LESS_THAN, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_MirrorArmorReflectPrintString
	goto BattleScript_MirrorArmorReflectWontFall
BattleScript_MirrorArmorReflectPrintString:
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_MirrorArmorReflectEnd:
	return

BattleScript_MirrorArmorDoesntAffect:
	swapattackerwithtarget
	printstring STRINGID_ITDOESNTAFFECT
	waitmessage B_WAIT_TIME_LONG
	swapattackerwithtarget
	return

BattleScript_MirrorArmorReflectWontFall:
	copybyte gBattlerTarget, gBattlerAttacker   @ STRINGID_STATSWONTDECREASE uses target
	goto BattleScript_MirrorArmorReflectPrintString

@ gBattlerTarget is battler with Mirror Armor
BattleScript_MirrorArmorReflectStickyWeb:
	call BattleScript_AbilityPopUp
	setattackertostickywebuser
	jumpifbyteequal gBattlerAttacker, gBattlerTarget, BattleScript_StickyWebOnSwitchInEnd   @ Sticky web user not on field -> no stat loss
	call BattleScript_MirrorArmorReflectStatLoss
	goto BattleScript_StickyWebOnSwitchInEnd

BattleScript_StatDown::
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_EffectHaze::
	attackcanceler
	attackanimation
	waitanimation
	normalisebuffs
	printstring STRINGID_STATCHANGESGONE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectBide::
	attackcanceler
	attackanimation
	waitanimation
	setbide
	goto BattleScript_MoveEnd

BattleScript_EffectRoar::
	attackcanceler
	jumpifroarfails BattleScript_ButItFailed
	jumpifcommanderactive BattleScript_ButItFailed
	jumpifability BS_TARGET, ABILITY_GUARD_DOG, BattleScript_ButItFailed
	jumpifability BS_TARGET, ABILITY_SUCTION_CUPS, BattleScript_AbilityPreventsPhasingOut
	jumpifvolatile BS_TARGET, VOLATILE_ROOT, BattleScript_PrintMonIsRooted
	jumpiftargetdynamaxed BattleScript_RoarBlockedByDynamax
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	jumpifbattletype BATTLE_TYPE_ARENA, BattleScript_ButItFailed
	forcerandomswitch BattleScript_ButItFailed

BattleScript_RoarBlockedByDynamax:
	printstring STRINGID_MOVEBLOCKEDBYDYNAMAX
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_MultiHitPrintStrings::
	resultmessage
	waitmessage B_WAIT_TIME_LONG
	copyarray gBattleTextBuff1, sMULTIHIT_STRING, 6
	printstring STRINGID_HITXTIMES
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_ScaleShot::
	call BattleScript_MultiHitPrintStrings
	goto BattleScript_DefDownSpeedUp

BattleScript_EffectConversion::
	attackcanceler
	tryconversiontypechange BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNCHANGEDTYPE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectRestoreHp::
	attackcanceler
	tryhealhalfhealth BS_ATTACKER, BattleScript_AlreadyAtFullHp
	attackanimation
	waitanimation
BattleScript_RestoreHp:
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	printstring STRINGID_PKMNREGAINEDHEALTH
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_AlreadyPoisoned::
	setalreadystatusedmoveattempt
	pause B_WAIT_TIME_LONG
	printstring STRINGID_PKMNALREADYPOISONED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_ImmunityProtected::
	call BattleScript_AbilityPopUp
	goto BattleScript_DoesntAffectTargetAtkString

BattleScript_EffectAuroraVeil::
	attackcanceler
	setauroraveil
	goto BattleScript_PrintReflectLightScreenSafeguardString

BattleScript_EffectLightScreen::
	attackcanceler
	setlightscreen
	goto BattleScript_PrintReflectLightScreenSafeguardString

BattleScript_EffectRest::
	attackcanceler
	jumpifstatus BS_ATTACKER, STATUS1_SLEEP, BattleScript_RestIsAlreadyAsleep
	jumpifability BS_ATTACKER, ABILITY_COMATOSE, BattleScript_RestIsAlreadyAsleep
	jumpifuproarwakes BattleScript_RestCantSleep
	jumpifability BS_TARGET, ABILITY_INSOMNIA, BattleScript_InsomniaProtects
	jumpifability BS_TARGET, ABILITY_VITAL_SPIRIT, BattleScript_InsomniaProtects
	jumpifability BS_ATTACKER, ABILITY_PURIFYING_SALT, BattleScript_InsomniaProtects
	jumpifabilitypreventsrest BS_TARGET, BattleScript_AbilityPreventsRest
	trysetrest
	pause B_WAIT_TIME_SHORT
	printfromtable gRestUsedStringIds
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_ATTACKER
	waitstate
	goto BattleScript_PresentHealTarget

BattleScript_RestCantSleep::
	pause B_WAIT_TIME_LONG
	printfromtable gUproarAwakeStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_RestIsAlreadyAsleep::
	setalreadystatusedmoveattempt
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNALREADYASLEEP2
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_AbilityPreventsRest::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_BUTITFAILED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectOHKO::
	attackcanceler
	typecalc
	jumpifmovehadnoeffect BattleScript_HitFromAtkAnimation
	tryKO BattleScript_KOFail
	goto BattleScript_HitFromAtkAnimation
BattleScript_KOFail::
	pause B_WAIT_TIME_LONG
	printfromtable gKOFailedStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_RecoilIfMiss::
	printstring STRINGID_PKMNCRASHED
	waitmessage B_WAIT_TIME_LONG
	jumpifability BS_ATTACKER, ABILITY_MAGIC_GUARD, BattleScript_RecoilEnd
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	tryfaintmon BS_ATTACKER
BattleScript_RecoilEnd:
	return

BattleScript_EffectMist::
	attackcanceler
	setmist
	attackanimation
	waitanimation
	printfromtable gMistUsedStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectFocusEnergy::
	attackcanceler
	jumpifvolatile BS_ATTACKER, VOLATILE_DRAGON_CHEER, BattleScript_ButItFailed
	jumpifvolatile BS_ATTACKER, VOLATILE_FOCUS_ENERGY, BattleScript_ButItFailed
	setfocusenergy BS_TARGET
	attackanimation
	waitanimation
	printfromtable gFocusEnergyUsedStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectConfuse::
	attackcanceler
	jumpifability BS_TARGET, ABILITY_OWN_TEMPO, BattleScript_OwnTempoPrevents
	jumpifsubstituteblocks BattleScript_ButItFailed
	jumpifvolatile BS_TARGET, VOLATILE_CONFUSION, BattleScript_AlreadyConfused
	jumpifterrainaffected BS_TARGET, STATUS_FIELD_MISTY_TERRAIN, BattleScript_MistyTerrainPrevents
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	jumpifsafeguard BattleScript_SafeguardProtected
	attackanimation
	waitanimation
	seteffectprimary BS_ATTACKER, BS_TARGET, MOVE_EFFECT_CONFUSION
	resultmessage
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_AlreadyConfused::
	setalreadystatusedmoveattempt
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNALREADYCONFUSED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectAttackUp2::
	setstatchanger STAT_ATK, 2, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectDefenseUp2::
	setstatchanger STAT_DEF, 2, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectDefenseUp3::
	setstatchanger STAT_DEF, 3, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectSpeedUp2::
	setstatchanger STAT_SPEED, 2, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectSpecialAttackUp2::
	setstatchanger STAT_SPATK, 2, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectSpecialAttackUp3::
	setstatchanger STAT_SPATK, 3, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectSpecialDefenseUp2::
	setstatchanger STAT_SPDEF, 2, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectAccuracyUp2::
	setstatchanger STAT_ACC, 2, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectEvasionUp2::
	setstatchanger STAT_EVASION, 2, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectTransform::
	attackcanceler
	trytoclearprimalweather
	tryrevertweatherform
	flushtextbox
	tryendneutralizinggas
	flushtextbox
	transformdataexecution
	attackanimation
	waitanimation
	printfromtable gTransformUsedStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectAttackDown2::
	setstatchanger STAT_ATK, 2, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectDefenseDown2::
	setstatchanger STAT_DEF, 2, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectSpeedDown2::
	setstatchanger STAT_SPEED, 2, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectSpecialDefenseDown2::
	setstatchanger STAT_SPDEF, 2, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectSpecialAttackDown2::
	setstatchanger STAT_SPATK, 2, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectAccuracyDown2::
	setstatchanger STAT_ACC, 2, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectEvasionDown2::
	setstatchanger STAT_EVASION, 2, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectReflect::
	attackcanceler
	setreflect
BattleScript_PrintReflectLightScreenSafeguardString::
	attackanimation
	waitanimation
	printfromtable gReflectLightScreenSafeguardStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_MoveEffectAuroraVeil::
	printfromtable gReflectLightScreenSafeguardStringIds
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_VoltAbsorbHeal:
	copybyte gBattlerAbility, gBattlerTarget
	tryhealquarterhealth BS_TARGET, BattleScript_MonMadeMoveUseless @ Check if max hp
	goto BattleScript_MoveHPDrain

BattleScript_AlreadyParalyzed::
	setalreadystatusedmoveattempt
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNISALREADYPARALYZED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_PowerHerbActivation:
	playanimation BS_ATTACKER, B_ANIM_HELD_ITEM_EFFECT
	printstring STRINGID_POWERHERB
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_ATTACKER
	return

BattleScript_EffectTwoTurnsAttack::
	jumpifvolatile BS_ATTACKER, VOLATILE_MULTIPLETURNS, BattleScript_TwoTurnMovesSecondTurn
	tryfiretwoturnmovewithoutcharging BS_ATTACKER, BattleScript_EffectHit @ e.g. Solar Beam
	call BattleScript_FirstChargingTurn
	tryfiretwoturnmoveaftercharging BS_ATTACKER, BattleScript_TwoTurnMovesSecondTurn @ e.g. Electro Shot
	jumpifholdeffect BS_ATTACKER, HOLD_EFFECT_POWER_HERB, BattleScript_TwoTurnMovesSecondPowerHerbActivates, TRUE
	goto BattleScript_MoveEnd

BattleScript_EffectGeomancy::
	jumpifvolatile BS_ATTACKER, VOLATILE_MULTIPLETURNS, BattleScript_GeomancySecondTurn
	call BattleScript_FirstChargingTurn
	jumpifnoholdeffect BS_ATTACKER, HOLD_EFFECT_POWER_HERB, BattleScript_MoveEnd
	call BattleScript_PowerHerbActivation
BattleScript_GeomancySecondTurn:
	attackcanceler
	setbyte sB_ANIM_TURN, 1
	clearvolatile BS_ATTACKER, VOLATILE_MULTIPLETURNS
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPATK, MAX_STAT_STAGE, BattleScript_GeomancyDoMoveAnim
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPDEF, MAX_STAT_STAGE, BattleScript_GeomancyDoMoveAnim
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPEED, MAX_STAT_STAGE, BattleScript_CantRaiseMultipleStats
BattleScript_GeomancyDoMoveAnim::
	attackanimation
	waitanimation
	setstatchanger STAT_SPATK, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_GeomancyTrySpDef, BIT_SPDEF | BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_GeomancyTrySpDef
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_GeomancyTrySpDef::
	setstatchanger STAT_SPDEF, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_GeomancyTrySpeed, BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_GeomancyTrySpeed
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_GeomancyTrySpeed::
	setstatchanger STAT_SPEED, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_GeomancyEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_GeomancyEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_GeomancyEnd::
	goto BattleScript_MoveEnd

BattleScript_FirstChargingTurn::
	attackcanceler
	waitmessage B_WAIT_TIME_LONG
BattleScript_FirstChargingTurnAfterAttackString:
	setsemiinvulnerablebit @ only for moves with EFFECT_SEMI_INVULNERABLE/EFFECT_SKY_DROP
	setchargingturn
	twoturnmoveschargestringandanimation
	setadditionaleffects @ only onChargeTurnOnly effects will work here
	return

BattleScript_TwoTurnMovesSecondPowerHerbActivates:
	call BattleScript_PowerHerbActivation
	trygulpmissile @ Edge case for Cramorant ability Gulp Missile
BattleScript_FromTwoTurnMovesSecondTurnRet:
	call BattleScript_TwoTurnMovesSecondTurnRet
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	goto BattleScript_HitFromCritCalc

BattleScript_TwoTurnMovesSecondTurn::
	attackcanceler
	call BattleScript_TwoTurnMovesSecondTurnRet
	goto BattleScript_HitFromAccCheck

BattleScript_TwoTurnMovesSecondTurnRet:
	setbyte sB_ANIM_TURN, 1
	setbyte sB_ANIM_TARGETS_HIT, 0
	clearvolatile BS_ATTACKER, VOLATILE_MULTIPLETURNS
	clearsemiinvulnerablebit @ only for moves with EFFECT_SEMI_INVULNERABLE/EFFECT_SKY_DROP
	return

BattleScript_EffectSubstitute::
	attackcanceler
	waitstate
	jumpifvolatile BS_ATTACKER, VOLATILE_SUBSTITUTE, BattleScript_AlreadyHasSubstitute
	setsubstitute
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_SUBSTITUTE_FAILED, BattleScript_SubstituteString
	attackanimation
	waitanimation
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
BattleScript_SubstituteString::
	pause B_WAIT_TIME_SHORT
	printfromtable gSubstituteUsedStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd
BattleScript_AlreadyHasSubstitute::
	setalreadystatusedmoveattempt
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNHASSUBSTITUTE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_MoveUsedMustRecharge::
	printstring STRINGID_PKMNMUSTRECHARGE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectRage::
	attackcanceler
	accuracycheck BattleScript_RageMiss, ACC_CURR_MOVE
	seteffectprimary BS_ATTACKER, BS_TARGET, MOVE_EFFECT_RAGE
	goto BattleScript_HitFromAtkString
BattleScript_RageMiss::
	clearvolatile BS_ATTACKER, VOLATILE_RAGE
	goto BattleScript_MoveMissedPause

BattleScript_EffectMimic::
	attackcanceler
	jumpifsubstituteblocks BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	mimicattackcopy BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNLEARNEDMOVE2
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectLeechSeed::
	attackcanceler
	pause B_WAIT_TIME_SHORT
	jumpifsubstituteblocks BattleScript_ButItFailed
	accuracycheck BattleScript_DoLeechSeed, ACC_CURR_MOVE
BattleScript_DoLeechSeed::
	setseeded
	attackanimation
	waitanimation
	printfromtable gLeechSeedStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectDoNothing::
	attackcanceler
	attackanimation
	waitanimation
	incrementgamestat GAME_STAT_USED_SPLASH
	printstring STRINGID_BUTNOTHINGHAPPENED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectHoldHands::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	jumpifbyteequal gBattlerTarget, gBattlerAttacker, BattleScript_ButItFailed
	attackanimation
	waitanimation
	goto BattleScript_MoveEnd

BattleScript_EffectCelebrate::
	attackcanceler
	attackanimation
	waitanimation
	printstring STRINGID_CELEBRATEMESSAGE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectHappyHour::
	attackcanceler
	attackanimation
	waitanimation
	seteffectprimary BS_ATTACKER, BS_TARGET, MOVE_EFFECT_HAPPY_HOUR
	goto BattleScript_MoveEnd

BattleScript_EffectDisable::
	attackcanceler
	jumpifability BS_TARGET_SIDE, ABILITY_AROMA_VEIL, BattleScript_AromaVeilProtects
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	disablelastusedattack BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNMOVEWASDISABLED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectCounter::
	attackcanceler
	counterdamagecalculator BattleScript_ButItFailed
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	typecalc
	clearmoveresultflags MOVE_RESULT_NOT_VERY_EFFECTIVE | MOVE_RESULT_SUPER_EFFECTIVE
	adjustdamage
	goto BattleScript_HitFromAtkAnimation

BattleScript_EffectEncore::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	jumpifability BS_TARGET_SIDE, ABILITY_AROMA_VEIL, BattleScript_AromaVeilProtects
	trysetencore BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNGOTENCORE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectPainSplit::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	painsplitdmgcalc BattleScript_ButItFailed
	attackanimation
	waitanimation
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	healthbarupdate BS_TARGET, PASSIVE_HP_UPDATE
	datahpupdate BS_TARGET, PASSIVE_HP_UPDATE
	printstring STRINGID_SHAREDPAIN
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectSnore::
	attackcanceler
	jumpifhalfword CMP_EQUAL, gChosenMove, MOVE_SLEEP_TALK, BattleScript_DoSnore
	printstring STRINGID_PKMNFASTASLEEP
	waitmessage B_WAIT_TIME_LONG
	statusanimation BS_ATTACKER
BattleScript_DoSnore::
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	goto BattleScript_HitFromCritCalc

BattleScript_EffectConversion2::
	attackcanceler
	settypetorandomresistance BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNCHANGEDTYPE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectLockOn::
	attackcanceler
	jumpifsubstituteblocks BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	setalwayshitflag
	attackanimation
	waitanimation
	printstring STRINGID_PKMNTOOKAIM
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectSketch::
	attackcanceler
	copymovepermanently BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSKETCHEDMOVE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectDestinyBond::
	attackcanceler
	setvolatile BS_ATTACKER, VOLATILE_DESTINY_BOND, 2
	attackanimation
	waitanimation
	printstring STRINGID_PKMNTRYINGTOTAKEFOE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_MoveEffectEerieSpell::
	printstring STRINGID_PKMNREDUCEDPP
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_EffectSpite::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	tryspiteppreduce BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNREDUCEDPP
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

@ TODO: Simplfy script
BattleScript_EffectHealBell::
	attackcanceler
	attackanimation
	waitanimation
	healpartystatus
	waitstate
	printfromtable gPartyStatusHealStringIds
	waitmessage B_WAIT_TIME_LONG
	jumpifblockedbysoundproof BS_ATTACKER_PARTNER, BattleScript_HealBellSoundproof
	goto BattleScript_PartyHealEnd
BattleScript_HealBellSoundproof::
	jumpifbyte CMP_NO_COMMON_BITS, cMULTISTRING_CHOOSER, B_MSG_BELL_SOUNDPROOF_ATTACKER, BattleScript_CheckHealBellMon2Unaffected
	printstring STRINGID_PKMNSXBLOCKSY
	waitmessage B_WAIT_TIME_LONG
BattleScript_CheckHealBellMon2Unaffected::
	jumpifbyte CMP_NO_COMMON_BITS, cMULTISTRING_CHOOSER, B_MSG_BELL_SOUNDPROOF_PARTNER, BattleScript_PartyHealEnd
	printstring STRINGID_PKMNSXBLOCKSY2
	waitmessage B_WAIT_TIME_LONG
BattleScript_PartyHealEnd::
	updatestatusicon BS_ATTACKER_WITH_PARTNER
	waitstate
	goto BattleScript_MoveEnd

BattleScript_MoveEffectAromatherapy::
	healpartystatus
	waitstate
	printfromtable gPartyStatusHealStringIds
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_ATTACKER_WITH_PARTNER
	waitstate
	return

BattleScript_EffectMeanLook::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	jumpifvolatile BS_TARGET, VOLATILE_ESCAPE_PREVENTION, BattleScript_ButItFailed
	jumpifsubstituteblocks BattleScript_ButItFailed
.if B_GHOSTS_ESCAPE >= GEN_6
	jumpiftype BS_TARGET, TYPE_GHOST, BattleScript_ButItFailed
.endif
	attackanimation
	waitanimation
	seteffectprimary BS_ATTACKER, BS_TARGET, MOVE_EFFECT_PREVENT_ESCAPE
	printstring STRINGID_TARGETCANTESCAPENOW
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectNightmare::
	attackcanceler
	jumpifsubstituteblocks BattleScript_ButItFailed
	jumpifvolatile BS_TARGET, VOLATILE_NIGHTMARE, BattleScript_ButItFailed
	jumpifstatus BS_TARGET, STATUS1_SLEEP, BattleScript_NightmareWorked
	jumpifability BS_TARGET, ABILITY_COMATOSE, BattleScript_NightmareWorked
	goto BattleScript_ButItFailed
BattleScript_NightmareWorked::
	attackanimation
	waitanimation
	seteffectprimary BS_ATTACKER, BS_TARGET, MOVE_EFFECT_NIGHTMARE
	printstring STRINGID_PKMNFELLINTONIGHTMARE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectMinimize::
	attackcanceler
	setvolatile BS_ATTACKER, VOLATILE_MINIMIZE
.if B_MINIMIZE_EVASION >= GEN_5
	setstatchanger STAT_EVASION, 2, FALSE
.else
	setstatchanger STAT_EVASION, 1, FALSE
.endif
	goto BattleScript_EffectStatUpAfterAtkCanceler

BattleScript_EffectCurse::
	jumpiftype BS_ATTACKER, TYPE_GHOST, BattleScript_GhostCurse
	attackcanceler
	jumpiftype BS_ATTACKER, TYPE_GHOST, BattleScript_DoGhostCurse
	jumpifstat BS_ATTACKER, CMP_GREATER_THAN, STAT_SPEED, MIN_STAT_STAGE, BattleScript_CurseTrySpeed
	jumpifstat BS_ATTACKER, CMP_NOT_EQUAL, STAT_ATK, MAX_STAT_STAGE, BattleScript_CurseTrySpeed
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_DEF, MAX_STAT_STAGE, BattleScript_ButItFailed
BattleScript_CurseTrySpeed::
	copybyte gBattlerTarget, gBattlerAttacker
	setbyte sB_ANIM_TURN, 1
	attackanimation
	waitanimation
	setstatchanger STAT_SPEED, 1, TRUE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_CurseTryAttack
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_CurseTryAttack::
	setstatchanger STAT_ATK, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_CurseTryDefense, BIT_DEF
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_CurseTryDefense::
	setstatchanger STAT_DEF, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_CurseEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_CurseEnd::
	goto BattleScript_MoveEnd
BattleScript_GhostCurse::
	jumpifbytenotequal gBattlerAttacker, gBattlerTarget, BattleScript_DoGhostCurse
	getmovetarget
BattleScript_DoGhostCurse::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	cursetarget BattleScript_ButItFailed
	setbyte sB_ANIM_TURN, 0
	attackanimation
	waitanimation
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	printstring STRINGID_PKMNLAIDCURSE
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_ATTACKER
	goto BattleScript_MoveEnd

BattleScript_EffectProtect::
BattleScript_EffectEndure::
	attackcanceler
	setprotectlike
	attackanimation
	waitanimation
	printfromtable gProtectLikeUsedStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectSpikes::
	attackcanceler
	trysetspikes BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_SPIKESSCATTERED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectForesight::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	jumpifvolatile BS_TARGET, VOLATILE_FORESIGHT, BattleScript_ButItFailed
	setvolatile BS_TARGET, VOLATILE_FORESIGHT
BattleScript_IdentifiedFoe:
	attackanimation
	waitanimation
	printstring STRINGID_PKMNIDENTIFIED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectPerishSong::
	attackcanceler
	trysetperishsong BattleScript_ButItFailed
	savetarget
	attackanimation
	waitanimation
	printstring STRINGID_FAINTINTHREE
	waitmessage B_WAIT_TIME_LONG
	setbyte gBattlerTarget, 0
BattleScript_PerishSongLoop::
	jumpifblockedbysoundproof BS_TARGET, BattleScript_PerishSongBlocked
	jumpifpranksterblocked BattleScript_PerishSongNotAffected
BattleScript_PerishSongLoopIncrement::
	addbyte gBattlerTarget, 1
	jumpifbytenotequal gBattlerTarget, gBattlersCount, BattleScript_PerishSongLoop
	restoretarget
	goto BattleScript_MoveEnd

BattleScript_PerishSongBlocked::
	copybyte sBATTLER, gBattlerTarget
	printstring STRINGID_PKMNSXBLOCKSY2
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_PerishSongLoopIncrement

BattleScript_PerishSongNotAffected:
	printstring STRINGID_ITDOESNTAFFECT
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_PerishSongLoopIncrement

BattleScript_EffectSandstorm::
	attackcanceler
	call BattleScript_CheckPrimalWeather
	setfieldweather BATTLE_WEATHER_SANDSTORM
	goto BattleScript_MoveWeatherChange

BattleScript_EffectRollout::
	attackcanceler
	jumpifvolatile BS_ATTACKER, VOLATILE_MULTIPLETURNS, BattleScript_RolloutCheckAccuracy
BattleScript_RolloutCheckAccuracy::
	accuracycheck BattleScript_RolloutHit, ACC_CURR_MOVE
BattleScript_RolloutHit::
	typecalc
	handlerollout
	goto BattleScript_HitFromCritCalc

BattleScript_EffectSwagger::
	attackcanceler
	jumpifsubstituteblocks BattleScript_MakeMoveMissed
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	jumpifconfusedandstatmaxed STAT_ATK, BattleScript_ButItFailed
	attackanimation
	waitanimation
	setstatchanger STAT_ATK, 2, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_SwaggerTryConfuse
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_SwaggerTryConfuse
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_SwaggerTryConfuse:
	jumpifability BS_TARGET, ABILITY_OWN_TEMPO, BattleScript_OwnTempoPrevents
	jumpifsafeguard BattleScript_SafeguardProtected
	seteffectprimary BS_ATTACKER, BS_TARGET, MOVE_EFFECT_CONFUSION
	goto BattleScript_MoveEnd

BattleScript_EffectFuryCutter::
	attackcanceler
	accuracycheck BattleScript_FuryCutterHit, ACC_CURR_MOVE
BattleScript_FuryCutterHit:
	handlefurycutter
	critcalc
	damagecalc
	jumpifmovehadnoeffect BattleScript_FuryCutterHit
	adjustdamage
	goto BattleScript_HitFromAtkAnimation

BattleScript_TryDestinyKnotTarget:
	jumpifnoholdeffect BS_ATTACKER, HOLD_EFFECT_DESTINY_KNOT, BattleScript_TryDestinyKnotTargetRet
	playanimation BS_ATTACKER, B_ANIM_HELD_ITEM_EFFECT
	waitanimation
	printstring STRINGID_DESTINYKNOTACTIVATES
	tryinfatuating BattleScript_ButItFailed
	volatileanimation BS_TARGET, VOLATILE_INFATUATION
	waitanimation
	waitmessage B_WAIT_TIME_LONG
BattleScript_TryDestinyKnotTargetRet:
	return

BattleScript_TryDestinyKnotAttacker:
	jumpifnoholdeffect BS_TARGET, HOLD_EFFECT_DESTINY_KNOT, BattleScript_TryDestinyKnotTargetRet
	playanimation BS_TARGET, B_ANIM_HELD_ITEM_EFFECT
	waitanimation
	swapattackerwithtarget
	printstring STRINGID_DESTINYKNOTACTIVATES
	tryinfatuating BattleScript_SwapTargetAttackerButItFailed
	swapattackerwithtarget
	volatileanimation BS_ATTACKER, VOLATILE_INFATUATION
	waitanimation
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_EffectAttract::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	jumpifability BS_TARGET_SIDE, ABILITY_AROMA_VEIL, BattleScript_AromaVeilProtects
	tryinfatuating BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNFELLINLOVE
	waitmessage B_WAIT_TIME_LONG
	call BattleScript_TryDestinyKnotAttacker
	goto BattleScript_MoveEnd

BattleScript_EffectPresent::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	typecalc
	presentdamagecalculation

BattleScript_EffectSafeguard::
	attackcanceler
	setsafeguard
	goto BattleScript_PrintReflectLightScreenSafeguardString

BattleScript_EffectMagnitude::
	attackcanceler
	magnitudedamagecalculation
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_MAGNITUDESTRENGTH
	waitmessage B_WAIT_TIME_LONG
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	goto BattleScript_HitFromCritCalc

BattleScript_EffectBatonPass::
	attackcanceler
	jumpifbattletype BATTLE_TYPE_ARENA, BattleScript_ButItFailed
	jumpifcantswitch SWITCH_IGNORE_ESCAPE_PREVENTION | BS_ATTACKER, BattleScript_ButItFailed
	attackanimation
	waitanimation
	openpartyscreen BS_ATTACKER, BattleScript_ButItFailed
	switchoutabilities BS_ATTACKER
	waitstate
	switchhandleorder BS_ATTACKER, 2
	returntoball BS_ATTACKER, FALSE
	getswitchedmondata BS_ATTACKER
	switchindataupdate BS_ATTACKER
	hpthresholds BS_ATTACKER
	trytoclearprimalweather
	flushtextbox
	printstring STRINGID_SWITCHINMON
	switchinanim BS_ATTACKER, FALSE, TRUE
	waitstate
	switchineffects BS_ATTACKER
	goto BattleScript_MoveEnd

BattleScript_EffectMorningSun::
BattleScript_EffectSynthesis::
BattleScript_EffectMoonlight::
BattleScript_EffectShoreUp::
	attackcanceler
	recoverbasedonsunlight BattleScript_AlreadyAtFullHp
	goto BattleScript_PresentHealTarget

BattleScript_EffectRainDance::
	attackcanceler
	call BattleScript_CheckPrimalWeather
	setfieldweather BATTLE_WEATHER_RAIN
BattleScript_MoveWeatherChange::
	attackanimation
	waitanimation
	call BattleScript_MoveWeatherChangeRet
	goto BattleScript_MoveEnd

BattleScript_MoveWeatherChangeRet::
	printfromtable gMoveWeatherChangeStringIds
	waitmessage B_WAIT_TIME_LONG
	call BattleScript_ActivateWeatherAbilities
	return

BattleScript_EffectSunnyDay::
	attackcanceler
	call BattleScript_CheckPrimalWeather
	setfieldweather BATTLE_WEATHER_SUN
	goto BattleScript_MoveWeatherChange

BattleScript_ExtremelyHarshSunlightWasNotLessened:
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_EXTREMELYHARSHSUNLIGHTWASNOTLESSENED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_ExtremelyHarshSunlightWasNotLessenedEnd3:
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_EXTREMELYHARSHSUNLIGHTWASNOTLESSENED
	waitmessage B_WAIT_TIME_LONG
	end3

BattleScript_ExtremelyHarshSunlightWasNotLessenedRet:
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_EXTREMELYHARSHSUNLIGHTWASNOTLESSENED
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_NoReliefFromHeavyRain:
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_NORELIEFROMHEAVYRAIN
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_NoReliefFromHeavyRainEnd3:
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_NORELIEFROMHEAVYRAIN
	waitmessage B_WAIT_TIME_LONG
	end3

BattleScript_NoReliefFromHeavyRainRet:
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_NORELIEFROMHEAVYRAIN
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MysteriousAirCurrentBlowsOn:
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_MYSTERIOUSAIRCURRENTBLOWSON
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_MysteriousAirCurrentBlowsOnEnd3:
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_MYSTERIOUSAIRCURRENTBLOWSON
	waitmessage B_WAIT_TIME_LONG
	end3

BattleScript_MysteriousAirCurrentBlowsOnRet:
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_MYSTERIOUSAIRCURRENTBLOWSON
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_BlockedByPrimalWeatherEnd3::
	call BattleScript_AbilityPopUp
	jumpifhalfword CMP_COMMON_BITS, gBattleWeather, B_WEATHER_SUN_PRIMAL, BattleScript_ExtremelyHarshSunlightWasNotLessenedEnd3
	jumpifhalfword CMP_COMMON_BITS, gBattleWeather, B_WEATHER_RAIN_PRIMAL, BattleScript_NoReliefFromHeavyRainEnd3
	jumpifhalfword CMP_COMMON_BITS, gBattleWeather, B_WEATHER_STRONG_WINDS, BattleScript_MysteriousAirCurrentBlowsOnEnd3
	end3

BattleScript_BlockedByPrimalWeatherRet::
	call BattleScript_AbilityPopUp
	jumpifhalfword CMP_COMMON_BITS, gBattleWeather, B_WEATHER_SUN_PRIMAL, BattleScript_ExtremelyHarshSunlightWasNotLessenedRet
	jumpifhalfword CMP_COMMON_BITS, gBattleWeather, B_WEATHER_RAIN_PRIMAL, BattleScript_NoReliefFromHeavyRainRet
	jumpifhalfword CMP_COMMON_BITS, gBattleWeather, B_WEATHER_STRONG_WINDS, BattleScript_MysteriousAirCurrentBlowsOnRet
	return

BattleScript_EffectBellyDrum::
	attackcanceler
	jumpifstatignorecontrary BS_ATTACKER, CMP_EQUAL, STAT_ATK, MAX_STAT_STAGE, BattleScript_ButItFailed
	halvehp BattleScript_ButItFailed
	attackanimation
	waitanimation
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	setstatchanger STAT_ATK, MAX_STAT_STAGE, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_MoveEnd
	printstring STRINGID_PKMNCUTHPMAXEDATTACK
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectPsychUp::
	attackcanceler
	copyfoestats
	attackanimation
	waitanimation
	printstring STRINGID_PKMNCOPIEDSTATCHANGES
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectMirrorCoat::
	attackcanceler
	mirrorcoatdamagecalculator BattleScript_ButItFailed
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	typecalc
	clearmoveresultflags MOVE_RESULT_NOT_VERY_EFFECTIVE | MOVE_RESULT_SUPER_EFFECTIVE
	adjustdamage
	goto BattleScript_HitFromAtkAnimation

BattleScript_EffectFutureSight::
	attackcanceler
	setfutureattack
	attackanimation
	waitanimation
	printfromtable gFutureMoveUsedStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectTeleport::
	jumpifgenconfiglowerthan GEN_CONFIG_TELEPORT_BEHAVIOR, GEN_8, BattleScript_EffectTeleportGen7
	jumpifbattletype BATTLE_TYPE_TRAINER, BattleScript_EffectBatonPass
	jumpifside BS_ATTACKER, B_SIDE_PLAYER, BattleScript_EffectBatonPass
	goto BattleScript_DoEffectTeleport
BattleScript_EffectTeleportGen7::
	jumpifbattletype BATTLE_TYPE_TRAINER, BattleScript_FailedFromAtkCanceler
BattleScript_DoEffectTeleport::
	attackcanceler
	isrunningimpossible
	jumpifbyte CMP_EQUAL, gBattleCommunication, BATTLE_RUN_FORBIDDEN, BattleScript_ButItFailed
	jumpifbyte CMP_EQUAL, gBattleCommunication, BATTLE_RUN_FAILURE, BattleScript_PrintAbilityMadeIneffective
	attackanimation
	waitanimation
	printstring STRINGID_PKMNFLEDFROMBATTLE
	waitmessage B_WAIT_TIME_LONG
	setteleportoutcome BS_ATTACKER
	goto BattleScript_MoveEnd

BattleScript_EffectBeatUp::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	pause B_WAIT_TIME_SHORT
	setbyte gBattleCommunication, 0
BattleScript_BeatUpLoop::
	movevaluescleanup
	trydobeatup BattleScript_BeatUpEnd, BattleScript_ButItFailed
	printstring STRINGID_PKMNATTACK
	critcalc
	jumpifcriticalhit BattleScript_BeatUpAttack
	manipulatedamage DMG_DOUBLED
BattleScript_BeatUpAttack::
	adjustdamage
	attackanimation
	waitanimation
	effectivenesssound
	hitanimation BS_TARGET
	waitstate
	healthbarupdate BS_TARGET, MOVE_DAMAGE_HP_UPDATE
	datahpupdate BS_TARGET, MOVE_DAMAGE_HP_UPDATE
	critmessage
	waitmessage B_WAIT_TIME_LONG
	resultmessage
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_TARGET
	moveendto MOVEEND_NEXT_TARGET
	goto BattleScript_BeatUpLoop
BattleScript_BeatUpEnd::
	end

BattleScript_EffectDefenseCurl::
	attackcanceler
	setvolatile BS_TARGET, VOLATILE_DEFENSE_CURL
	setstatchanger STAT_DEF, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_ONLY_CHECKING, BattleScript_DefenseCurlDoStatUpAnim
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_StatUpPrintString
	attackanimation
	waitanimation
BattleScript_DefenseCurlDoStatUpAnim::
	goto BattleScript_StatUpDoAnim

BattleScript_EffectSoftboiled::
	attackcanceler
	tryhealhalfhealth BS_TARGET, BattleScript_AlreadyAtFullHp
BattleScript_PresentHealTarget::
	attackanimation
	waitanimation
	healthbarupdate BS_TARGET, PASSIVE_HP_UPDATE
	datahpupdate BS_TARGET, PASSIVE_HP_UPDATE
	printstring STRINGID_PKMNREGAINEDHEALTH
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_AlreadyAtFullHp::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNHPFULL
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_FailedFromAtkCanceler::
	attackcanceler
BattleScript_ButItFailed::
	pause B_WAIT_TIME_SHORT
	setmoveresultflags MOVE_RESULT_FAILED
	resultmessage
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd
BattleScript_RestoreAttackerButItFailed:
	restoreattacker
	goto BattleScript_ButItFailed
BattleScript_RestoreTargetButItFailed:
	restoretarget
	goto BattleScript_ButItFailed
BattleScript_SwapTargetAttackerButItFailed:
	swapattackerwithtarget
	goto BattleScript_ButItFailed

BattleScript_NotAffected::
	pause B_WAIT_TIME_SHORT
	setmoveresultflags MOVE_RESULT_DOESNT_AFFECT_FOE
	resultmessage
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_NotAffectedAbilityPopUp::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUpTarget
	setmoveresultflags MOVE_RESULT_DOESNT_AFFECT_FOE
	resultmessage
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectStockpile::
	attackcanceler
	stockpile 0
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSTOCKPILED
	waitmessage B_WAIT_TIME_LONG
	.if B_STOCKPILE_RAISES_DEFS < GEN_4
	goto BattleScript_EffectStockpileEnd
	.endif
	jumpifmovehadnoeffect BattleScript_EffectStockpileEnd
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_DEF, MAX_STAT_STAGE, BattleScript_EffectStockpileDef
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPDEF, MAX_STAT_STAGE, BattleScript_EffectStockpileEnd
BattleScript_EffectStockpileDef:
	setstatchanger STAT_DEF, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectStockpileSpDef, BIT_SPDEF
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_EffectStockpileSpDef
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectStockpileSpDef::
	setstatchanger STAT_SPDEF, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectStockpileEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_EffectStockpileEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectStockpileEnd:
	stockpile 1
	goto BattleScript_MoveEnd

BattleScript_MoveEffectStockpileWoreOff::
	.if B_STOCKPILE_RAISES_DEFS >= GEN_4
	dostockpilestatchangeswearoff BS_ATTACKER, BattleScript_StockpileStatChangeDown
	printstring STRINGID_STOCKPILEDEFFECTWOREOFF
	waitmessage B_WAIT_TIME_SHORT
	.endif
	return

BattleScript_StockpileStatChangeDown:
	statbuffchange BS_ATTACKER, STAT_CHANGE_CERTAIN, BattleScript_StockpileStatChangeDown_Ret
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_StockpileStatChangeDown_Ret:
	return

BattleScript_EffectSpitUp::
	attackcanceler
	jumpifbyte CMP_EQUAL, cMISS_TYPE, B_MSG_PROTECTED, BattleScript_SpitUpFailProtect
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	damagecalc
	adjustdamage
	stockpiletobasedamage
	call BattleScript_Hit_RetFromAtkAnimation
	tryfaintmon BS_TARGET
	removestockpilecounters
	goto BattleScript_MoveEnd

BattleScript_SpitUpFailProtect::
	pause B_WAIT_TIME_LONG
	stockpiletobasedamage
	resultmessage
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectSwallow::
	attackcanceler
	stockpiletohpheal BattleScript_ButItFailed
	attackanimation
	waitanimation
	healthbarupdate BS_TARGET, PASSIVE_HP_UPDATE
	datahpupdate BS_TARGET, PASSIVE_HP_UPDATE
	printstring STRINGID_PKMNREGAINEDHEALTH
	waitmessage B_WAIT_TIME_LONG
	removestockpilecounters
	goto BattleScript_MoveEnd

BattleScript_EffectHail::
	attackcanceler
	call BattleScript_CheckPrimalWeather
	setfieldweather BATTLE_WEATHER_HAIL
	goto BattleScript_MoveWeatherChange

BattleScript_EffectTorment::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	jumpifability BS_TARGET_SIDE, ABILITY_AROMA_VEIL, BattleScript_AromaVeilProtects
	settorment BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSUBJECTEDTOTORMENT
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectFlatter::
	attackcanceler
	jumpifsubstituteblocks BattleScript_MakeMoveMissed
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	jumpifconfusedandstatmaxed STAT_SPATK, BattleScript_ButItFailed
	attackanimation
	waitanimation
	setstatchanger STAT_SPATK, 1, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_FlatterTryConfuse
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_FlatterTryConfuse
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_FlatterTryConfuse::
	jumpifability BS_TARGET, ABILITY_OWN_TEMPO, BattleScript_OwnTempoPrevents
	jumpifsafeguard BattleScript_SafeguardProtected
	seteffectprimary BS_ATTACKER, BS_TARGET, MOVE_EFFECT_CONFUSION
	goto BattleScript_MoveEnd

BattleScript_EffectDarkVoid::
.if B_DARK_VOID_FAIL >= GEN_7
	jumpifspecies SPECIES_DARKRAI, BattleScript_EffectNonVolatileStatus
	goto BattleScript_PokemonCantUseTheMove
.endif
BattleScript_EffectNonVolatileStatus::
	attackcanceler
	trynonvolatilestatus
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	attackanimation
	waitanimation
	setnonvolatilestatus TRIGGER_ON_MOVE
	clearmoveresultflags MOVE_RESULT_NOT_VERY_EFFECTIVE | MOVE_RESULT_SUPER_EFFECTIVE
	resultmessage
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_AlreadyBurned::
	setalreadystatusedmoveattempt
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNALREADYHASBURN
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectMemento::
	attackcanceler
	jumpifbyte CMP_EQUAL, cMISS_TYPE, B_MSG_PROTECTED, BattleScript_MementoTargetProtect
	trymemento BattleScript_ButItFailed
	setatkhptozero
	attackanimation
	waitanimation
	jumpifsubstituteblocks BattleScript_EffectMementoPrintNoEffect
	setstatchanger STAT_ATK, 2, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectMementoTrySpAtk, BIT_SPATK
@ Greater than B_MSG_DEFENDER_STAT_CHANGED is checking if the stat cannot decrease
	jumpifbyte CMP_GREATER_THAN, cMULTISTRING_CHOOSER, B_MSG_DEFENDER_STAT_CHANGED, BattleScript_EffectMementoTrySpAtk
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectMementoTrySpAtk:
	setstatchanger STAT_SPATK, 2, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectMementoTryFaint
@ Greater than B_MSG_DEFENDER_STAT_CHANGED is checking if the stat cannot decrease
	jumpifbyte CMP_GREATER_THAN, cMULTISTRING_CHOOSER, B_MSG_DEFENDER_STAT_CHANGED, BattleScript_EffectMementoTryFaint
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectMementoTryFaint:
	tryfaintmon BS_ATTACKER
	goto BattleScript_MoveEnd
BattleScript_EffectMementoPrintNoEffect:
	printstring STRINGID_BUTNOEFFECT
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_EffectMementoTryFaint
@ If the target is protected there's no need to check the target's stats or animate, the user will just faint
BattleScript_MementoTargetProtect:
	trymemento BattleScript_MementoTargetProtectEnd
BattleScript_MementoTargetProtectEnd:
	setatkhptozero
	pause B_WAIT_TIME_LONG
	effectivenesssound
	resultmessage
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_ATTACKER
	goto BattleScript_MoveEnd

BattleScript_EffectFocusPunch::
	attackcanceler
	jumpifnodamage BattleScript_HitFromAccCheck
	printstring STRINGID_PKMNLOSTFOCUS
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectFollowMe::
	attackcanceler
	setforcedtarget
	attackanimation
	waitanimation
	printstring STRINGID_PKMNCENTERATTENTION
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectCharge::
	attackcanceler
	setcharge BS_ATTACKER
	attackanimation
	waitanimation
.if B_CHARGE_SPDEF_RAISE >= GEN_5
	setstatchanger STAT_SPDEF, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectChargeString
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_EffectChargeString
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectChargeString:
.endif
	printstring STRINGID_PKMNCHARGINGPOWER
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectTaunt::
	attackcanceler
	jumpifability BS_TARGET_SIDE, ABILITY_AROMA_VEIL, BattleScript_AromaVeilProtects
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	settaunt BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNFELLFORTAUNT
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectHelpingHand::
	attackcanceler
	trysethelpinghand BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNREADYTOHELP
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectTrick::
	attackcanceler
	jumpifsubstituteblocks BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	tryswapitems BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSWITCHEDITEMS
	waitmessage B_WAIT_TIME_LONG
	printfromtable gItemSwapStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectRolePlay::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	trycopyability BS_ATTACKER, BattleScript_ButItFailed
	attackanimation
	waitanimation
	copybyte gBattlerAbility, gBattlerAttacker
	call BattleScript_AbilityPopUpOverwriteThenNormal
	recordability BS_ATTACKER
	printstring STRINGID_PKMNCOPIEDFOE
	waitmessage B_WAIT_TIME_LONG
	switchinabilities BS_ATTACKER
	goto BattleScript_MoveEnd

BattleScript_EffectWish::
	attackcanceler
	trywish BattleScript_ButItFailed
	attackanimation
	waitanimation
	goto BattleScript_MoveEnd

BattleScript_EffectIngrain::
	attackcanceler
	trysetvolatile BS_ATTACKER, VOLATILE_ROOT, BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNPLANTEDROOTS
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectMagicCoat::
	attackcanceler
	trysetmagiccoat BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSHROUDEDITSELF
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectRecycle::
	attackcanceler
	tryrecycleitem BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_XFOUNDONEY
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectBrickBreak::
	attackcanceler
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	typecalc
	removescreens
	critcalc
	damagecalc
	adjustdamage
	jumpifbyte CMP_EQUAL, sB_ANIM_TURN, 0, BattleScript_BrickBreakAnim
	clearmoveresultflags MOVE_RESULT_MISSED | MOVE_RESULT_DOESNT_AFFECT_FOE
BattleScript_BrickBreakAnim::
	attackanimation
	waitanimation
	jumpifbyte CMP_LESS_THAN, sB_ANIM_TURN, 2, BattleScript_BrickBreakDoHit
	printstring STRINGID_THEWALLSHATTERED
	waitmessage B_WAIT_TIME_LONG
BattleScript_BrickBreakDoHit::
	typecalc
	effectivenesssound
	hitanimation BS_TARGET
	waitstate
	healthbarupdate BS_TARGET, MOVE_DAMAGE_HP_UPDATE
	datahpupdate BS_TARGET, MOVE_DAMAGE_HP_UPDATE
	critmessage
	waitmessage B_WAIT_TIME_LONG
	resultmessage
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_TARGET
	setadditionaleffects
	goto BattleScript_MoveEnd

BattleScript_EffectYawn::
	attackcanceler
	trynonvolatilestatus
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	setyawn BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNWASMADEDROWSY
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_MoveEffectYawnSide::
	printstring STRINGID_PKMNWASMADEDROWSY
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_PrintAbilityMadeIneffective::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNSXMADEITINEFFECTIVE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectEndeavor::
	attackcanceler
	setdamagetohealthdifference BattleScript_ButItFailed
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	typecalc
	jumpifmovehadnoeffect BattleScript_HitFromAtkAnimation
	clearmoveresultflags MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE
	adjustdamage
	goto BattleScript_HitFromAtkAnimation

BattleScript_EffectSkillSwap::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	tryswapabilities BattleScript_ButItFailed
	attackanimation
	waitanimation
	jumpiftargetally BattleScript_EffectSkillSwap_AfterAbilityPopUp
	copybyte gBattlerAbility, gBattlerAttacker
	call BattleScript_AbilityPopUpOverwriteThenNormal
	copybyte gBattlerAbility, gBattlerTarget
	copyhword sABILITY_OVERWRITE, gLastUsedAbility
	call BattleScript_AbilityPopUpOverwriteThenNormal
BattleScript_EffectSkillSwap_AfterAbilityPopUp:
	recordability BS_ATTACKER
	recordability BS_TARGET
	printstring STRINGID_PKMNSWAPPEDABILITIES
	waitmessage B_WAIT_TIME_LONG
.if B_SKILL_SWAP >= GEN_4
	switchinabilities BS_ATTACKER
	switchinabilities BS_TARGET
.endif
	goto BattleScript_MoveEnd

BattleScript_EffectImprison::
	attackcanceler
	tryimprison BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSEALEDOPPONENTMOVE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectRefresh::
	attackcanceler
	curestatuswithmove BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSTATUSNORMAL
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_ATTACKER
	goto BattleScript_MoveEnd

BattleScript_EffectGrudge::
	attackcanceler
	jumpifvolatile BS_ATTACKER, VOLATILE_GRUDGE, BattleScript_ButItFailed
	setvolatile BS_ATTACKER, VOLATILE_GRUDGE, 2
	attackanimation
	waitanimation
	printstring STRINGID_PKMNWANTSGRUDGE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectSnatch::
	attackcanceler
	trysetsnatch BattleScript_ButItFailed
	attackanimation
	waitanimation
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNWAITSFORTARGET
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectStruggle::
	jumpifnotmove MOVE_STRUGGLE, BattleScript_EffectHit
	incrementgamestat GAME_STAT_USED_STRUGGLE
	goto BattleScript_EffectHit

BattleScript_EffectMudSport::
BattleScript_EffectWaterSport::
	attackcanceler
	settypebasedhalvers BattleScript_ButItFailed
	attackanimation
	waitanimation
	printfromtable gSportsUsedStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectTickle::
	attackcanceler
	jumpifstat BS_TARGET, CMP_GREATER_THAN, STAT_ATK, MIN_STAT_STAGE, BattleScript_TickleDoMoveAnim
	jumpifstat BS_TARGET, CMP_EQUAL, STAT_DEF, MIN_STAT_STAGE, BattleScript_CantLowerMultipleStats
BattleScript_TickleDoMoveAnim::
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	attackanimation
	waitanimation
	setstatchanger STAT_ATK, 1, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_TickleTryLowerDef, BIT_DEF
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_TickleTryLowerDef
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_TickleTryLowerDef::
	setstatchanger STAT_DEF, 1, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_TickleEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_TickleEnd
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_TickleEnd::
	goto BattleScript_MoveEnd

BattleScript_CantLowerMultipleStats::
	pause B_WAIT_TIME_SHORT
	setmoveresultflags MOVE_RESULT_FAILED
	printstring STRINGID_STATSWONTDECREASE2
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectCosmicPower::
	attackcanceler
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_DEF, MAX_STAT_STAGE, BattleScript_CosmicPowerDoMoveAnim
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPDEF, MAX_STAT_STAGE, BattleScript_CantRaiseMultipleStats
BattleScript_CosmicPowerDoMoveAnim::
	attackanimation
	waitanimation
	setstatchanger STAT_DEF, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_CosmicPowerTrySpDef, BIT_SPDEF
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_CosmicPowerTrySpDef
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_CosmicPowerTrySpDef::
	setstatchanger STAT_SPDEF, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_CosmicPowerEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_CosmicPowerEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_CosmicPowerEnd::
	goto BattleScript_MoveEnd

BattleScript_EffectBulkUp::
	attackcanceler
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_ATK, MAX_STAT_STAGE, BattleScript_BulkUpDoMoveAnim
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_DEF, MAX_STAT_STAGE, BattleScript_CantRaiseMultipleStats
BattleScript_BulkUpDoMoveAnim::
	attackanimation
	waitanimation
	setstatchanger STAT_ATK, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_BulkUpTryDef, BIT_DEF
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_BulkUpTryDef
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_BulkUpTryDef::
	setstatchanger STAT_DEF, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_BulkUpEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_BulkUpEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_BulkUpEnd::
	goto BattleScript_MoveEnd

BattleScript_EffectCalmMind::
	attackcanceler
BattleScript_CalmMindTryToRaiseStats::
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPATK, MAX_STAT_STAGE, BattleScript_CalmMindDoMoveAnim
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPDEF, MAX_STAT_STAGE, BattleScript_CantRaiseMultipleStats
BattleScript_CalmMindDoMoveAnim::
	attackanimation
	waitanimation
BattleScript_CalmMindStatRaise::
	setstatchanger STAT_SPATK, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_CalmMindTrySpDef, BIT_SPDEF
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_CalmMindTrySpDef
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_CalmMindTrySpDef::
	setstatchanger STAT_SPDEF, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_CalmMindEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_CalmMindEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_CalmMindEnd::
	goto BattleScript_MoveEnd

BattleScript_CantRaiseMultipleStats::
	pause B_WAIT_TIME_SHORT
	setmoveresultflags MOVE_RESULT_FAILED
	printstring STRINGID_STATSWONTINCREASE2
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_EffectDragonDance::
	attackcanceler
BattleScript_EffectDragonDanceFromStatUp::
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_ATK, MAX_STAT_STAGE, BattleScript_DragonDanceDoMoveAnim
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPEED, MAX_STAT_STAGE, BattleScript_CantRaiseMultipleStats
BattleScript_DragonDanceDoMoveAnim::
	attackanimation
	waitanimation
	setstatchanger STAT_ATK, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_DragonDanceTrySpeed, BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_DragonDanceTrySpeed
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_DragonDanceTrySpeed::
	setstatchanger STAT_SPEED, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_DragonDanceEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_DragonDanceEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_DragonDanceEnd::
	goto BattleScript_MoveEnd

BattleScript_EffectCamouflage::
	attackcanceler
	settypetoenvironment BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNCHANGEDTYPE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_FaintBattler::
	tryillusionoff BS_FAINTED
	tryactivategulpmissile
	playfaintcry BS_FAINTED
	pause B_WAIT_TIME_LONG
	dofaintanimation BS_FAINTED
	copybyte sBATTLER, gBattlerFainted @ for message
	printstring STRINGID_BATTLERFAINTED
	cleareffectsonfaint BS_FAINTED
	trytoclearprimalweather
	tryrevertweatherform
	flushtextbox
	waitanimation
	tryactivatereceiver BS_FAINTED
	tryactivatesoulheart
	trytrainerslidemsgfirstoff BS_FAINTED
	return

BattleScript_GiveExp::
	setbyte sGIVEEXP_STATE, 0
	getexp BS_TARGET
	end2

BattleScript_HandleFaintedMon::
	setbyte sSHIFT_SWITCHED, 0
	checkteamslost BattleScript_HandleFaintedMonMultiple
	jumpifbyte CMP_NOT_EQUAL, gBattleOutcome, 0, BattleScript_FaintedMonEnd
	jumpifbattletype BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLE, BattleScript_FaintedMonTryChoose
	jumpifword CMP_NO_COMMON_BITS, gHitMarker, HITMARKER_PLAYER_FAINTED, BattleScript_FaintedMonTryChoose
@ Yes/No for sending out a new Pokémon if one is defeated in a wild battle
	printstring STRINGID_USENEXTPKMN
	setbyte gBattleCommunication, 0
	yesnobox
	jumpifbyte CMP_EQUAL, gBattleCommunication + 1, 0, BattleScript_FaintedMonTryChoose
@ Player said no, try to run
	jumpifplayerran BattleScript_FaintedMonEnd
	printstring STRINGID_CANTESCAPE2
BattleScript_FaintedMonTryChoose:
	openpartyscreen BS_FAINTED, BattleScript_FaintedMonEnd
	switchhandleorder BS_FAINTED, 2
	jumpifnotbattletype BATTLE_TYPE_TRAINER, BattleScript_FaintedMonSendOutNew
	jumpifbattletype BATTLE_TYPE_LINK, BattleScript_FaintedMonSendOutNew
	jumpifbattletype BATTLE_TYPE_RECORDED_LINK, BattleScript_FaintedMonSendOutNew
	jumpifbattletype BATTLE_TYPE_FRONTIER, BattleScript_FaintedMonSendOutNew
	jumpifbattletype BATTLE_TYPE_DOUBLE, BattleScript_FaintedMonSendOutNew
	jumpifword CMP_COMMON_BITS, gHitMarker, HITMARKER_PLAYER_FAINTED, BattleScript_FaintedMonSendOutNew
	jumpifbyte CMP_EQUAL, sBATTLE_STYLE, OPTIONS_BATTLE_STYLE_SET, BattleScript_FaintedMonSendOutNew
	jumpifcantswitch BS_PLAYER1, BattleScript_FaintedMonSendOutNew
	setbyte sILLUSION_NICK_HACK, 1
@ Yes/No for sending out a new Pokémon when the opponent is switching
	printstring STRINGID_ENEMYABOUTTOSWITCHPKMN
	setbyte gBattleCommunication, 0
	yesnobox
	jumpifbyte CMP_EQUAL, gBattleCommunication + 1, 1, BattleScript_FaintedMonSendOutNew
@ Player said yes, go to party screen (note optional flag, player may exit the menu instead)
	setatktoplayer0
	openpartyscreen BS_ATTACKER | PARTY_SCREEN_OPTIONAL, BattleScript_FaintedMonSendOutNew
	switchhandleorder BS_ATTACKER, 2
	jumpifbyte CMP_EQUAL, gBattleCommunication, PARTY_SIZE, BattleScript_FaintedMonSendOutNew
@ Switch Pokémon before opponent
	atknameinbuff1
	resetswitchinabilitybits
	hpthresholds2 BS_ATTACKER
	printstring STRINGID_RETURNMON
	switchoutabilities BS_ATTACKER
	waitstate
	returnatktoball
	waitstate
	drawpartystatussummary BS_ATTACKER
	getswitchedmondata BS_ATTACKER
	switchindataupdate BS_ATTACKER
	hpthresholds BS_ATTACKER
	trytoclearprimalweather
	flushtextbox
	printstring STRINGID_SWITCHINMON
	hidepartystatussummary BS_ATTACKER
	switchinanim BS_ATTACKER, FALSE, FALSE
	waitstate
	setbyte sSHIFT_SWITCHED, 1
BattleScript_FaintedMonSendOutNew:
	drawpartystatussummary BS_FAINTED
	getswitchedmondata BS_FAINTED
	switchindataupdate BS_FAINTED
	hpthresholds BS_FAINTED
	trytoclearprimalweather
	flushtextbox
	printstring STRINGID_SWITCHINMON
	hidepartystatussummary BS_FAINTED
	switchinanim BS_FAINTED, FALSE, FALSE
	waitstate
	resetplayerfainted
	trytrainerslidemsglaston BS_FAINTED
	jumpifbytenotequal sSHIFT_SWITCHED, sZero, BattleScript_FaintedMonShiftSwitched
BattleScript_FaintedMonSendOutNewEnd:
	switchineffects BS_FAINTED
	jumpifbattletype BATTLE_TYPE_DOUBLE, BattleScript_FaintedMonEnd
	cancelallactions
BattleScript_FaintedMonEnd::
	end2
BattleScript_FaintedMonShiftSwitched:
	copybyte sSAVED_BATTLER, gBattlerTarget
	switchineffects BS_ATTACKER
	resetsentmonsvalue
	copybyte gBattlerTarget, sSAVED_BATTLER
	goto BattleScript_FaintedMonSendOutNewEnd

BattleScript_HandleFaintedMonMultiple::
	openpartyscreen BS_FAINTED_MULTIPLE_1, BattleScript_HandleFaintedMonMultipleStart
BattleScript_HandleFaintedMonMultipleStart::
	switchhandleorder BS_FAINTED, 0
	openpartyscreen BS_FAINTED_MULTIPLE_2, BattleScript_HandleFaintedMonMultipleEnd
	switchhandleorder BS_FAINTED, 0
BattleScript_HandleFaintedMonLoop::
	switchhandleorder BS_FAINTED, 3
	drawpartystatussummary BS_FAINTED
	getswitchedmondata BS_FAINTED
	switchindataupdate BS_FAINTED
	hpthresholds BS_FAINTED
	trytoclearprimalweather
	flushtextbox
	printstring STRINGID_SWITCHINMON
	hidepartystatussummary BS_FAINTED
	switchinanim BS_FAINTED, FALSE, FALSE
	waitstate
	switchineffects BS_FAINTED_MULTIPLE_1
	jumpifbytenotequal gBattlerFainted, gBattlersCount, BattleScript_HandleFaintedMonLoop
BattleScript_HandleFaintedMonMultipleEnd::
	switchineffects BS_FAINTED_MULTIPLE_2
	end2

BattleScript_LocalTrainerBattleWon::
	jumpifbattletype BATTLE_TYPE_TWO_OPPONENTS, BattleScript_LocalTwoTrainersDefeated
	printstring STRINGID_PLAYERDEFEATEDTRAINER1
	goto BattleScript_LocalBattleWonLoseTexts
BattleScript_LocalTwoTrainersDefeated::
	printstring STRINGID_TWOENEMIESDEFEATED
BattleScript_LocalBattleWonLoseTexts::
	trainerslidein BS_OPPONENT1
	waitstate
	printstring STRINGID_TRAINER1LOSETEXT
	jumpifnotbattletype BATTLE_TYPE_TWO_OPPONENTS, BattleScript_LocalBattleWonReward
	trainerslideout BS_OPPONENT1
	waitstate
	trainerslidein BS_OPPONENT2
	waitstate
	printstring STRINGID_TRAINER2LOSETEXT
BattleScript_LocalBattleWonReward::
	getmoneyreward
	printstring STRINGID_PLAYERGOTMONEY
	waitmessage B_WAIT_TIME_LONG
BattleScript_PayDayMoneyAndPickUpItems::
	givepaydaymoney
	pickup
	end2

BattleScript_RivalBattleLost::
	jumpifhasnohp BS_ATTACKER, BattleScript_RivalBattleLostSkipMonRecall
	printstring STRINGID_TRAINER1MON1COMEBACK
	waitmessage B_WAIT_TIME_LONG
	returnatktoball
	waitstate
BattleScript_RivalBattleLostSkipMonRecall::
	trainerslidein BS_ATTACKER
	waitstate
	printstring STRINGID_TRAINER1WINTEXT
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_LocalBattleLostPrintWhiteOut
	end2

BattleScript_LocalBattleLost::
	jumpifbattletype BATTLE_TYPE_TRAINER_TOWER, BattleScript_BattleTowerLost
	jumpifbattletype BATTLE_TYPE_EREADER_TRAINER, BattleScript_LocalBattleLostEnd
	jumpifhalfword CMP_EQUAL, gTrainerBattleParameter + 2, TRAINER_SECRET_BASE, BattleScript_LocalBattleLostEnd
	jumpifbyte CMP_NOT_EQUAL, cMULTISTRING_CHOOSER, 0, BattleScript_RivalBattleLost
	jumpifnowhiteout BattleScript_LocalBattleLostEnd_
	jumpifbattletype BATTLE_TYPE_INGAME_PARTNER, BattleScript_LocalBattleLostPrintWhiteOut
BattleScript_LocalBattleLostPrintWhiteOut::
	getmoneyreward
	printstring STRINGID_PLAYERWHITEOUT
	waitmessage B_WAIT_TIME_LONG
.if B_WHITEOUT_MONEY >= GEN_4
	jumpifbattletype BATTLE_TYPE_TRAINER, BattleScript_LocalBattleLostEnd
	printstring STRINGID_PLAYERWHITEOUT2_WILD
	waitmessage B_WAIT_TIME_LONG
	printstring STRINGID_PLAYERWHITEOUT3
	waitmessage B_WAIT_TIME_LONG
	end2
BattleScript_LocalBattleLostEnd::
	printstring STRINGID_PLAYERWHITEOUT2_TRAINER
	waitmessage B_WAIT_TIME_LONG
	printstring STRINGID_PLAYERWHITEOUT3
	waitmessage B_WAIT_TIME_LONG
	end2
.else
	printstring STRINGID_PLAYERWHITEOUT3
	waitmessage B_WAIT_TIME_LONG
BattleScript_LocalBattleLostEnd::
	end2
.endif

@BattleScript_CheckDomeDrew::
@	jumpifbyte CMP_EQUAL, gBattleOutcome, B_OUTCOME_DREW, BattleScript_LocalBattleLostEnd_
@BattleScript_LocalBattleLostPrintTrainersWinText::
@	jumpifnotbattletype BATTLE_TYPE_TRAINER, BattleScript_LocalBattleLostPrintWhiteOut
@	returnopponentmon1toball
@	waitstate
@	returnopponentmon2toball
@	waitstate
@	trainerslidein BS_OPPONENT1
@	waitstate
@	printstring STRINGID_TRAINER1WINTEXT
@	jumpifbattletype BATTLE_TYPE_TOWER_LINK_MULTI, BattleScript_LocalBattleLostDoTrainer2WinText
@	jumpifnotbattletype BATTLE_TYPE_TWO_OPPONENTS, BattleScript_LocalBattleLostEnd_
@BattleScript_LocalBattleLostDoTrainer2WinText::
@	trainerslideout BS_OPPONENT1
@	waitstate
@	trainerslidein BS_OPPONENT2
@	waitstate
@	printstring STRINGID_TRAINER2WINTEXT
BattleScript_LocalBattleLostEnd_::
	end2

@BattleScript_FrontierLinkBattleLost::
@	returnopponentmon1toball
@	waitstate
@	returnopponentmon2toball
@	waitstate
@	trainerslidein BS_OPPONENT1
@	waitstate
@	printstring STRINGID_TRAINER1WINTEXT
@	trainerslideout BS_OPPONENT1
@	waitstate
@	trainerslidein BS_OPPONENT2
@	waitstate
@	printstring STRINGID_TRAINER2WINTEXT
@	jumpifbattletype BATTLE_TYPE_RECORDED, BattleScript_FrontierLinkBattleLostEnd
@	endlinkbattle
@BattleScript_FrontierLinkBattleLostEnd::
@	waitmessage B_WAIT_TIME_LONG
@	end2
@
@BattleScript_LinkBattleWonOrLost::
@	jumpifbattletype BATTLE_TYPE_BATTLE_TOWER, BattleScript_TowerLinkBattleWon
@	printstring STRINGID_BATTLEEND
@	waitmessage B_WAIT_TIME_LONG
@	jumpifbattletype BATTLE_TYPE_RECORDED, BattleScript_LinkBattleWonOrLostWaitEnd
@	endlinkbattle
@BattleScript_LinkBattleWonOrLostWaitEnd::
@	waitmessage B_WAIT_TIME_LONG
@	end2
@
@BattleScript_TowerLinkBattleWon::
@	playtrainerdefeatedmusic
@	printstring STRINGID_BATTLEEND
@	waitmessage B_WAIT_TIME_LONG
@	trainerslidein BS_OPPONENT1
@	waitstate
@	printstring STRINGID_TRAINER1LOSETEXT
@	trainerslideout BS_OPPONENT1
@	waitstate
@	trainerslidein BS_OPPONENT2
@	waitstate
@	printstring STRINGID_TRAINER2LOSETEXT
@	jumpifbattletype BATTLE_TYPE_RECORDED, BattleScript_TowerLinkBattleWonEnd
@	endlinkbattle
@BattleScript_TowerLinkBattleWonEnd::
@	waitmessage B_WAIT_TIME_LONG
@	end2
@
@BattleScript_FrontierTrainerBattleWon::
@	jumpifnotbattletype BATTLE_TYPE_TRAINER, BattleScript_PayDayMoneyAndPickUpItems
@	jumpifbattletype BATTLE_TYPE_TWO_OPPONENTS, BattleScript_FrontierTrainerBattleWon_TwoDefeated
@	printstring STRINGID_PLAYERDEFEATEDTRAINER1
@	goto BattleScript_FrontierTrainerBattleWon_LoseTexts
@BattleScript_FrontierTrainerBattleWon_TwoDefeated:
@	printstring STRINGID_TWOENEMIESDEFEATED
@BattleScript_FrontierTrainerBattleWon_LoseTexts:
@	trainerslidein BS_OPPONENT1
@	waitstate
@	printstring STRINGID_TRAINER1LOSETEXT
@	jumpifnotbattletype BATTLE_TYPE_TWO_OPPONENTS, BattleScript_TryPickUpItems
@	trainerslideout BS_OPPONENT1
@	waitstate
@	trainerslidein BS_OPPONENT2
@	waitstate
@	printstring STRINGID_TRAINER2LOSETEXT
@BattleScript_TryPickUpItems:
@	jumpifnotbattletype BATTLE_TYPE_PYRAMID, BattleScript_FrontierTrainerBattleWon_End
@	pickup
@BattleScript_FrontierTrainerBattleWon_End:
@	end2

BattleScript_SmokeBallEscape::
	playanimation BS_ATTACKER, B_ANIM_SMOKEBALL_ESCAPE
	printstring STRINGID_PKMNFLEDUSINGITS
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_RanAwayUsingMonAbility::
	printstring STRINGID_PKMNFLEDUSING
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_GotAwaySafely::
	printstring STRINGID_GOTAWAYSAFELY
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_WildMonFled::
	printstring STRINGID_WILDPKMNFLED
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_PrintCantRunFromTrainer::
	printstring STRINGID_NORUNNINGFROMTRAINERS
	end2

BattleScript_PrintFailedToRunString::
	printfromtable gNoEscapeStringIds
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_PrintCantEscapeFromBattle::
	printselectionstringfromtable gNoEscapeStringIds
	endselectionscript

BattleScript_PrintFullBox::
	printselectionstring STRINGID_BOXISFULL
	endselectionscript

BattleScript_ActionSwitch::
	hpthresholds2 BS_ATTACKER
	printstring STRINGID_RETURNMON
	jumpifnopursuitswitchdmg BattleScript_DoSwitchOut
	end2

BattleScript_DoSwitchOut::
	switchoutabilities BS_ATTACKER
	undodynamax BS_ATTACKER
	waitstate
	returnatktoball
	waitstate
	drawpartystatussummary BS_ATTACKER
	switchhandleorder BS_ATTACKER, 1
	getswitchedmondata BS_ATTACKER
	switchindataupdate BS_ATTACKER
	hpthresholds BS_ATTACKER
	trytoclearprimalweather
	flushtextbox
	printstring STRINGID_SWITCHINMON
	hidepartystatussummary BS_ATTACKER
	switchinanim BS_ATTACKER, FALSE, FALSE
	waitstate
	switchineffects BS_ATTACKER
	moveendcase MOVEEND_STATUS_IMMUNITY_ABILITIES
	moveendcase MOVEEND_MIRROR_MOVE
	end2

BattleScript_Pausex20::
	pause B_WAIT_TIME_SHORT
	return

BattleScript_LevelUp::
	fanfare MUS_LEVEL_UP
	printstring STRINGID_PKMNGREWTOLV
	setbyte sLVLBOX_STATE, 0
	drawlvlupbox
	handlelearnnewmove BattleScript_LearnedNewMove, BattleScript_LearnMoveReturn, TRUE
	goto BattleScript_AskToLearnMove
BattleScript_TryLearnMoveLoop::
	handlelearnnewmove BattleScript_LearnedNewMove, BattleScript_LearnMoveReturn, FALSE
BattleScript_AskToLearnMove::
	buffermovetolearn
	printstring STRINGID_TRYTOLEARNMOVE1
	printstring STRINGID_TRYTOLEARNMOVE2
	printstring STRINGID_TRYTOLEARNMOVE3
	waitstate
	setbyte sLEARNMOVE_STATE, 0
	yesnoboxlearnmove BattleScript_ForgotAndLearnedNewMove
.if P_ASK_MOVE_CONFIRMATION == TRUE
	printstring STRINGID_STOPLEARNINGMOVE
	waitstate
	setbyte sLEARNMOVE_STATE, 0
	yesnoboxstoplearningmove BattleScript_AskToLearnMove
.endif
	printstring STRINGID_DIDNOTLEARNMOVE
	goto BattleScript_TryLearnMoveLoop
BattleScript_ForgotAndLearnedNewMove::
	printstring STRINGID_123POOF
	printstring STRINGID_PKMNFORGOTMOVE
	printstring STRINGID_ANDELLIPSIS
BattleScript_LearnedNewMove::
	buffermovetolearn
	fanfare MUS_LEVEL_UP
	printstring STRINGID_PKMNLEARNEDMOVE
	waitmessage B_WAIT_TIME_LONG
	updatechoicemoveonlvlup
	goto BattleScript_TryLearnMoveLoop
BattleScript_LearnMoveReturn::
	return

BattleScript_WeatherContinues::
	printfromtable gWeatherTurnStringIds
	waitmessage B_WAIT_TIME_LONG
	playanimation_var BS_ATTACKER, sB_ANIM_ARG1
	setbyte gBattleCommunication, 0
	call BattleScript_ActivateWeatherAbilities
	end2

BattleScript_WeatherFaded::
	printfromtable gWeatherEndsStringIds
	waitmessage B_WAIT_TIME_LONG
	call BattleScript_ActivateWeatherAbilities
	end2

BattleScript_DamagingWeather::
	printfromtable gSandStormHailDmgStringIds
	waitmessage B_WAIT_TIME_LONG
	effectivenesssound
	hitanimation BS_ATTACKER
	goto BattleScript_DoTurnDmg

BattleScript_FogEnded_Ret::
	printstring STRINGID_FOGLIFTED
	waitmessage B_WAIT_TIME_LONG
	call BattleScript_ActivateWeatherAbilities
	return

BattleScript_IceBodyHeal::
	call BattleScript_AbilityPopUp
	playanimation BS_ATTACKER, B_ANIM_SIMPLE_HEAL
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	printstring STRINGID_ICEBODYHPGAIN
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_OverworldStatusStarts::
	printfromtable gStartingStatusStringIds
	waitmessage B_WAIT_TIME_LONG
	playanimation_var BS_ATTACKER, sB_ANIM_ARG1
	call BattleScript_OverworldStatusStarts_TryActivations
	end3

BattleScript_OverworldStatusStarts_TryActivations:
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_SET_TRICK_ROOM, BattleScript_TryRoomServiceLoop
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_SET_TAILWIND, BattleScript_TryTailwindAbilitiesLoop
	return

BattleScript_OverworldWeatherStarts::
	printfromtable gWeatherStartsStringIds
	waitmessage B_WAIT_TIME_LONG
	playanimation_var BS_BATTLER_0, sB_ANIM_ARG1
	call BattleScript_ActivateWeatherAbilities
	end3

BattleScript_OverworldTerrain::
	printfromtable gTerrainStartsStringIds
	waitmessage B_WAIT_TIME_LONG
	playanimation BS_BATTLER_0, B_ANIM_RESTORE_BG
	call BattleScript_ActivateTerrainEffects
	end3

BattleScript_SideStatusWoreOff::
	printstring STRINGID_PKMNSXWOREOFF
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_SideStatusWoreOffReturn::
	printstring STRINGID_PKMNSXWOREOFF
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_LuckyChantEnds::
	printstring STRINGID_LUCKYCHANTENDS
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_TailwindEnds::
	printstring STRINGID_TAILWINDENDS
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_TrickRoomEnds::
	printstring STRINGID_TRICKROOMENDS
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_WonderRoomEnds::
	printstring STRINGID_WONDERROOMENDS
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_MagicRoomEnds::
	printstring STRINGID_MAGICROOMENDS
	waitmessage B_WAIT_TIME_LONG
	setbyte gBattlerTarget, 0
BattleScript_MagicRoomHealingItemsLoop:
	copyarraywithindex gBattlerAttacker, gBattlerByTurnOrder, gBattlerTarget, 1
	tryactivateitem BS_ATTACKER, ACTIVATION_ON_USABLE_AGAIN
	addbyte gBattlerTarget, 1
	jumpifbytenotequal gBattlerTarget, gBattlersCount, BattleScript_MagicRoomHealingItemsLoop
	end2

BattleScript_TerrainEnds_Ret::
	printfromtable gTerrainStringIds
	waitmessage B_WAIT_TIME_LONG
	playanimation BS_ATTACKER, B_ANIM_RESTORE_BG
	tryboosterenergy ON_TERRAIN
	return

BattleScript_TerrainEnds::
	call BattleScript_TerrainEnds_Ret
	end2

BattleScript_MudSportEnds::
	printstring STRINGID_MUDSPORTENDS
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_WaterSportEnds::
	printstring STRINGID_WATERSPORTENDS
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_GravityEnds::
	printstring STRINGID_GRAVITYENDS
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_SafeguardProtected::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNUSEDSAFEGUARD
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_SafeguardEnds::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNSAFEGUARDEXPIRED
	waitmessage B_WAIT_TIME_LONG
	end2

@ Leech Seed end turn effect
@ attacker is the victim
@ target is the leech seeder (recieving HP)
BattleScript_LeechSeedTurnDrainLiquidOoze::
	call BattleScript_LeechSeedTurnDrain
	copybyte gBattlerAbility, gBattlerAttacker
	call BattleScript_AbilityPopUp
	copybyte gBattlerAttacker, gBattlerTarget   @ needed to get liquid ooze message correct
	jumpifability BS_TARGET, ABILITY_MAGIC_GUARD, BattleScript_LeechSeedTurnDrainHealBlockEnd2
	goto BattleScript_LeechSeedTurnDrainGainHp

BattleScript_LeechSeedTurnDrainHealBlock::
	call BattleScript_LeechSeedTurnDrain
BattleScript_LeechSeedTurnDrainHealBlockEnd2:
	end2

BattleScript_LeechSeedTurnDrainRecovery::
	call BattleScript_LeechSeedTurnDrain
BattleScript_LeechSeedTurnDrainGainHp:
	healthbarupdate BS_TARGET, PASSIVE_HP_UPDATE
	datahpupdate BS_TARGET, PASSIVE_HP_UPDATE
	printfromtable gLeechSeedStringIds
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_TARGET
	end2

BattleScript_LeechSeedTurnDrain:
	playanimation BS_ATTACKER, B_ANIM_LEECH_SEED_DRAIN, sB_ANIM_ARG1
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	tryfaintmon BS_ATTACKER
	return

BattleScript_BideStoringEnergy::
	printstring STRINGID_PKMNSTORINGENERGY
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_BideAttack::
	attackcanceler
	clearvolatile BS_ATTACKER, VOLATILE_MULTIPLETURNS
	printstring STRINGID_PKMNUNLEASHEDENERGY
	waitmessage B_WAIT_TIME_LONG
	accuracycheck BattleScript_MoveMissed, ACC_CURR_MOVE
	typecalc
	clearmoveresultflags MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE
	copybidedmg
	adjustdamage
	setbyte sB_ANIM_TURN, 1
	attackanimation
	waitanimation
	effectivenesssound
	hitanimation BS_TARGET
	waitstate
	healthbarupdate BS_TARGET, MOVE_DAMAGE_HP_UPDATE
	datahpupdate BS_TARGET, MOVE_DAMAGE_HP_UPDATE
	resultmessage
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_TARGET
	goto BattleScript_MoveEnd

BattleScript_BideNoEnergyToAttack::
	attackcanceler
	clearvolatile BS_ATTACKER, VOLATILE_MULTIPLETURNS
	printstring STRINGID_PKMNUNLEASHEDENERGY
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_ButItFailed

BattleScript_RoarSuccessSwitch::
	call BattleScript_RoarSuccessRet
	getswitchedmondata BS_TARGET
	switchindataupdate BS_TARGET
	trytoclearprimalweather
	flushtextbox
	switchinanim BS_TARGET, FALSE, FALSE
	waitstate
	printstring STRINGID_PKMNWASDRAGGEDOUT
	switchineffects BS_TARGET
	jumpifbyte CMP_EQUAL, sSWITCH_CASE, B_SWITCH_RED_CARD, BattleScript_RoarSuccessSwitch_Ret
	setbyte sSWITCH_CASE, B_SWITCH_NORMAL
	goto BattleScript_MoveEnd
BattleScript_RoarSuccessSwitch_Ret:
	swapattackerwithtarget  @ continuation of RedCardActivates
	restoretarget
	restoreattacker
	setbyte sSWITCH_CASE, B_SWITCH_NORMAL
	return

BattleScript_RoarSuccessEndBattle::
	call BattleScript_RoarSuccessRet
	setbyte sSWITCH_CASE, B_SWITCH_NORMAL
	setteleportoutcome BS_ATTACKER
	finishaction

BattleScript_RoarSuccessRet:
	jumpifbyte CMP_EQUAL, sSWITCH_CASE, B_SWITCH_HIT, BattleScript_RoarSuccessRet_Ret
	jumpifbyte CMP_EQUAL, sSWITCH_CASE, B_SWITCH_RED_CARD, BattleScript_RoarSuccessRet_Ret
	attackanimation
	waitanimation
BattleScript_RoarSuccessRet_Ret:
	switchoutabilities BS_TARGET
	returntoball BS_TARGET, FALSE
	waitstate
	return

BattleScript_WeaknessPolicy::
	copybyte sBATTLER, gBattlerTarget
	jumpifstat BS_TARGET, CMP_LESS_THAN, STAT_ATK, MAX_STAT_STAGE, BattleScript_WeaknessPolicyAtk
	jumpifstat BS_TARGET, CMP_EQUAL, STAT_SPATK, MAX_STAT_STAGE, BattleScript_WeaknessPolicyEnd
BattleScript_WeaknessPolicyAtk:
	playanimation BS_TARGET, B_ANIM_HELD_ITEM_EFFECT
	waitanimation
	setstatchanger STAT_ATK, 2, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_WeaknessPolicySpAtk, BIT_SPATK
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_WeaknessPolicySpAtk
	printstring STRINGID_USINGITEMSTATOFPKMNROSE
	waitmessage B_WAIT_TIME_LONG
BattleScript_WeaknessPolicySpAtk:
	setstatchanger STAT_SPATK, 2, FALSE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_WeaknessPolicyRemoveItem
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_WeaknessPolicyRemoveItem
	printstring STRINGID_USINGITEMSTATOFPKMNROSE
	waitmessage B_WAIT_TIME_LONG
BattleScript_WeaknessPolicyRemoveItem:
	removeitem BS_TARGET
BattleScript_WeaknessPolicyEnd:
	return

BattleScript_TargetItemStatRaise::
	copybyte sBATTLER, gBattlerTarget
	statbuffchange BS_TARGET, STAT_CHANGE_ONLY_CHECKING, BattleScript_TargetItemStatRaiseRemoveItemRet
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_TargetItemStatRaiseRemoveItemRet
	playanimation BS_TARGET, B_ANIM_HELD_ITEM_EFFECT
	waitanimation
	statbuffchange BS_TARGET, 0, BattleScript_TargetItemStatRaiseRemoveItemRet
	printstring STRINGID_USINGITEMSTATOFPKMNROSE
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_TARGET
BattleScript_TargetItemStatRaiseRemoveItemRet:
	return

BattleScript_AttackerItemStatRaise::
	copybyte sBATTLER, gBattlerAttacker
	statbuffchange BS_ATTACKER, STAT_CHANGE_ONLY_CHECKING, BattleScript_AttackerItemStatRaiseRet
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_AttackerItemStatRaiseRet
	playanimation BS_ATTACKER, B_ANIM_HELD_ITEM_EFFECT
	waitanimation
	statbuffchange BS_ATTACKER, 0, BattleScript_AttackerItemStatRaiseRet
	printstring STRINGID_USINGITEMSTATOFPKMNROSE
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_ATTACKER
BattleScript_AttackerItemStatRaiseRet:
	return

BattleScript_MistProtected::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNPROTECTEDBYMIST
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_RageIsBuilding::
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_RageIsBuildingEnd
	printstring STRINGID_PKMNRAGEBUILDING
	waitmessage B_WAIT_TIME_LONG
BattleScript_RageIsBuildingEnd:
	return

BattleScript_MoveUsedIsDisabled::
	printstring STRINGID_PKMNMOVEISDISABLED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_SelectingDisabledMove::
	printselectionstring STRINGID_PKMNMOVEISDISABLED
	endselectionscript

BattleScript_DisabledNoMore::
	printstring STRINGID_PKMNMOVEDISABLEDNOMORE
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_SelectingDisabledMoveInPalace::
	printstring STRINGID_PKMNMOVEISDISABLED
	goto BattleScript_SelectingUnusableMoveInPalace

BattleScript_EncoredMove::
	printselectionstring STRINGID_PKMNGOTENCOREDMOVE
	endselectionscript

BattleScript_EncoredMoveInPalace::
	printselectionstring STRINGID_PKMNGOTENCOREDMOVE
BattleScript_SelectingUnusableMoveInPalace::
	moveendto MOVEEND_NEXT_TARGET
	end

BattleScript_EncoredNoMore::
	printstring STRINGID_PKMNENCOREENDED
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_DestinyBondTakesLife::
	printstring STRINGID_PKMNTOOKFOE
	waitmessage B_WAIT_TIME_LONG
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	tryfaintmon BS_ATTACKER
	return

BattleScript_DmgHazardsOnAttacker::
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	call BattleScript_PrintHurtByDmgHazards
	tryfaintmon BS_ATTACKER
	tryfaintmon_spikes BS_ATTACKER, BattleScript_DmgHazardsOnAttackerFainted
	return

BattleScript_DmgHazardsOnAttackerFainted::
	setbyte sGIVEEXP_STATE, 0
	getexp BS_ATTACKER
	moveendall
	goto BattleScript_HandleFaintedMon

BattleScript_DmgHazardsOnTarget::
	healthbarupdate BS_TARGET, PASSIVE_HP_UPDATE
	datahpupdate BS_TARGET, PASSIVE_HP_UPDATE
	call BattleScript_PrintHurtByDmgHazards
	tryfaintmon BS_TARGET
	tryfaintmon_spikes BS_TARGET, BattleScript_DmgHazardsOnTargetFainted
	return

BattleScript_DmgHazardsOnTargetFainted::
	setbyte sGIVEEXP_STATE, 0
	getexp BS_TARGET
	moveendall
	goto BattleScript_HandleFaintedMon

BattleScript_DmgHazardsOnBattlerScripting::
	healthbarupdate BS_SCRIPTING, PASSIVE_HP_UPDATE
	datahpupdate BS_SCRIPTING, PASSIVE_HP_UPDATE
	call BattleScript_PrintHurtByDmgHazards
	tryfaintmon BS_SCRIPTING
	tryfaintmon_spikes BS_SCRIPTING, BattleScript_DmgHazardsOnBattlerScriptingFainted
	return

BattleScript_DmgHazardsOnBattlerScriptingFainted::
	setbyte sGIVEEXP_STATE, 0
	getexp BS_SCRIPTING
	moveendall
	goto BattleScript_HandleFaintedMon

BattleScript_DmgHazardsOnFaintedBattler::
	healthbarupdate BS_FAINTED, PASSIVE_HP_UPDATE
	datahpupdate BS_FAINTED, PASSIVE_HP_UPDATE
	call BattleScript_PrintHurtByDmgHazards
	tryfaintmon BS_FAINTED
	tryfaintmon_spikes BS_FAINTED, BattleScript_DmgHazardsOnFaintedBattlerFainted
	return

BattleScript_DmgHazardsOnFaintedBattlerFainted::
	setbyte sGIVEEXP_STATE, 0
	getexp BS_FAINTED
	moveendall
	goto BattleScript_HandleFaintedMon

BattleScript_PrintHurtByDmgHazards::
	printfromtable gDmgHazardsStringIds
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_ToxicSpikesAbsorbed::
	printstring STRINGID_TOXICSPIKESABSORBED
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_ToxicSpikesPoisoned::
	printstring STRINGID_TOXICSPIKESPOISONED
	waitmessage B_WAIT_TIME_LONG
	statusanimation BS_SCRIPTING
	updatestatusicon BS_SCRIPTING
	waitstate
	return

BattleScript_ToxicSpikesBadlyPoisoned::
	printstring STRINGID_TOXICSPIKESBADLYPOISONED
	waitmessage B_WAIT_TIME_LONG
	statusanimation BS_SCRIPTING
	updatestatusicon BS_SCRIPTING
	waitstate
	return

BattleScript_StickyWebOnSwitchIn::
	savetarget
	saveattacker
	copybyte gBattlerTarget, sBATTLER
	setbyte sSTICKY_WEB_STAT_DROP, 1
	printstring STRINGID_STICKYWEBSWITCHIN
	waitmessage B_WAIT_TIME_LONG
	jumpifability BS_TARGET, ABILITY_MIRROR_ARMOR, BattleScript_MirrorArmorReflectStickyWeb
	statbuffchange BS_TARGET, STAT_CHANGE_CHECK_PREVENTION | STAT_CHANGE_ALLOW_PTR, BattleScript_StickyWebOnSwitchInEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_CHANGE_EMPTY, BattleScript_StickyWebOnSwitchInEnd
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_StickyWebOnSwitchInEnd:
	restoretarget
	restoreattacker
	setbyte sSTICKY_WEB_STAT_DROP, 0
	return

BattleScript_PerishSongTakesLife::
	printstring STRINGID_PKMNPERISHCOUNTFELL
	waitmessage B_WAIT_TIME_LONG
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	tryfaintmon BS_ATTACKER
	end2

BattleScript_PerishBodyActivates::
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNSWILLPERISHIN3TURNS
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_GulpMissileGorging::
	call BattleScript_AbilityPopUp
	playanimation BS_ATTACKER, B_ANIM_GULP_MISSILE
	waitanimation
	effectivenesssound
	hitanimation BS_ATTACKER
	waitstate
	jumpifability BS_ATTACKER, ABILITY_MAGIC_GUARD, BattleScript_GulpMissileNoDmgGorging
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	tryfaintmon BS_ATTACKER
	jumpiffainted BS_ATTACKER, TRUE, BattleScript_GulpMissileNoSecondEffectGorging
BattleScript_GulpMissileNoDmgGorging:
	handleformchange BS_TARGET, 0
	playanimation BS_TARGET, B_ANIM_FORM_CHANGE
	waitanimation
	swapattackerwithtarget
	seteffectprimary BS_ATTACKER, BS_TARGET, MOVE_EFFECT_PARALYSIS
	swapattackerwithtarget
	return
BattleScript_GulpMissileNoSecondEffectGorging:
	handleformchange BS_TARGET, 0
	playanimation BS_TARGET, B_ANIM_FORM_CHANGE
	waitanimation
	return

BattleScript_GulpMissileGulping::
	call BattleScript_AbilityPopUp
	playanimation BS_ATTACKER, B_ANIM_GULP_MISSILE
	waitanimation
	effectivenesssound
	hitanimation BS_ATTACKER
	waitstate
	jumpifability BS_ATTACKER, ABILITY_MAGIC_GUARD, BattleScript_GulpMissileNoDmgGulping
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	tryfaintmon BS_ATTACKER
	jumpiffainted BS_ATTACKER, TRUE, BattleScript_GulpMissileNoSecondEffectGulping
BattleScript_GulpMissileNoDmgGulping:
	handleformchange BS_TARGET, 0
	playanimation BS_TARGET, B_ANIM_FORM_CHANGE
	waitanimation
	swapattackerwithtarget @ to make gStatDownStringIds down below print the right battler
	setstatchanger STAT_DEF, 1, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_NOT_PROTECT_AFFECTED | STAT_CHANGE_ALLOW_PTR, BattleScript_GulpMissileGulpingEnd
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_GulpMissileGulpingEnd:
	swapattackerwithtarget @ restore the battlers, just in case
	return
BattleScript_GulpMissileNoSecondEffectGulping:
	handleformchange BS_TARGET, 0
	playanimation BS_TARGET, B_ANIM_FORM_CHANGE
	waitanimation
	return

BattleScript_SeedSowerActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_TERRAINBECOMESGRASSY
	waitmessage B_WAIT_TIME_LONG
	playanimation BS_SCRIPTING, B_ANIM_RESTORE_BG
	call BattleScript_ActivateTerrainEffects
	return

BattleScript_BerserkActivates::
	saveattacker
	copybyte gBattlerAttacker, gEffectBattler
	call BattleScript_AbilityPopUp
	statbuffchange BS_EFFECT_BATTLER, STAT_CHANGE_CERTAIN, BattleScript_BerserkActivatesTryBerry
	call BattleScript_StatUp
BattleScript_BerserkActivatesTryBerry:
	restoreattacker
	return

BattleScript_AngerShellActivates::
	call BattleScript_AbilityPopUp
	jumpifstat BS_EFFECT_BATTLER, CMP_LESS_THAN, STAT_ATK, MAX_STAT_STAGE, BattleScript_AngerShellTryDef
	jumpifstat BS_EFFECT_BATTLER, CMP_LESS_THAN, STAT_SPATK, MAX_STAT_STAGE, BattleScript_AngerShellTryDef
	jumpifstat BS_EFFECT_BATTLER, CMP_LESS_THAN, STAT_SPEED, MAX_STAT_STAGE, BattleScript_AngerShellTryDef
	jumpifstat BS_EFFECT_BATTLER, CMP_GREATER_THAN, STAT_DEF, MIN_STAT_STAGE, BattleScript_AngerShellTryDef
	jumpifstat BS_EFFECT_BATTLER, CMP_EQUAL, STAT_SPDEF, MIN_STAT_STAGE, BattleScript_RestoreAttackerButItFailed
BattleScript_AngerShellTryDef::
	modifybattlerstatstage BS_EFFECT_BATTLER, STAT_DEF, DECREASE, 1, BattleScript_AngerShellTrySpDef, ANIM_ON
BattleScript_AngerShellTrySpDef:
	modifybattlerstatstage BS_EFFECT_BATTLER, STAT_SPDEF, DECREASE, 1, BattleScript_AngerShellTryAttack, ANIM_ON
BattleScript_AngerShellTryAttack:
	modifybattlerstatstage BS_EFFECT_BATTLER, STAT_ATK, INCREASE, 1, BattleScript_AngerShellTrySpAtk, ANIM_ON
BattleScript_AngerShellTrySpAtk:
	modifybattlerstatstage BS_EFFECT_BATTLER, STAT_SPATK, INCREASE, 1, BattleScript_AngerShellTrySpeed, ANIM_ON
BattleScript_AngerShellTrySpeed:
	modifybattlerstatstage BS_EFFECT_BATTLER, STAT_SPEED, INCREASE, 1, BattleScript_AngerShellRet, ANIM_ON
BattleScript_AngerShellRet:
	return

BattleScript_WindPowerActivates::
	call BattleScript_AbilityPopUp
	setcharge BS_TARGET
	printstring STRINGID_BEINGHITCHARGEDPKMNWITHPOWER
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_ToxicDebrisActivates::
	call BattleScript_AbilityPopUp
	pause B_WAIT_TIME_SHORT
	settoxicspikes BattleScript_ToxicDebrisRet
	printstring STRINGID_POISONSPIKESSCATTERED
	waitmessage B_WAIT_TIME_LONG
BattleScript_ToxicDebrisRet:
	restoretarget
	restoreattacker
	return

BattleScript_EarthEaterActivates::
	call BattleScript_AbilityPopUp
	pause B_WAIT_TIME_LONG
	tryhealquarterhealth BS_TARGET, BattleScript_EarthEaterRet
	healthbarupdate BS_TARGET, PASSIVE_HP_UPDATE
	datahpupdate BS_TARGET, PASSIVE_HP_UPDATE
	printstring STRINGID_PKMNREGAINEDHEALTH
	waitmessage B_WAIT_TIME_LONG
BattleScript_EarthEaterRet:
	return

BattleScript_PerishSongCountGoesDown::
	printstring STRINGID_PKMNPERISHCOUNTFELL
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_AllStatsUpZMove::
	printfromtable gZEffectStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_AllStatsUp::
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_ATK, MAX_STAT_STAGE, BattleScript_AllStatsUpAtk
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_DEF, MAX_STAT_STAGE, BattleScript_AllStatsUpAtk
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPEED, MAX_STAT_STAGE, BattleScript_AllStatsUpAtk
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPATK, MAX_STAT_STAGE, BattleScript_AllStatsUpAtk
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPDEF, MAX_STAT_STAGE, BattleScript_AllStatsUpRet
BattleScript_AllStatsUpAtk::
	setstatchanger STAT_ATK, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_AllStatsUpDef, BIT_DEF | BIT_SPEED | BIT_SPATK | BIT_SPDEF
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_AllStatsUpDef::
	setstatchanger STAT_DEF, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_AllStatsUpSpeed, BIT_SPEED | BIT_SPATK | BIT_SPDEF
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_AllStatsUpSpeed::
	setstatchanger STAT_SPEED, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_AllStatsUpSpAtk, BIT_SPATK | BIT_SPDEF
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_AllStatsUpSpAtk::
	setstatchanger STAT_SPATK, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_AllStatsUpSpDef, BIT_SPDEF
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_AllStatsUpSpDef::
	setstatchanger STAT_SPDEF, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_AllStatsUpRet
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_AllStatsUpRet::
	return

BattleScript_RapidSpinAway::
	rapidspinfree
	return

BattleScript_WrapFree::
	printstring STRINGID_PKMNGOTFREE
	waitmessage B_WAIT_TIME_LONG
	copybyte gBattlerTarget, sBATTLER
	return

BattleScript_LeechSeedFree::
	printstring STRINGID_PKMNSHEDLEECHSEED
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_SpinHazardsAway::
	printfromtable gSpinHazardsStringIds
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_DefogClearHazards::
	printfromtable gDefogHazardsStringIds
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MonTookFutureAttack::
	printstring STRINGID_PKMNTOOKATTACK
	waitmessage B_WAIT_TIME_LONG
	jumpifbyte CMP_NOT_EQUAL, cMULTISTRING_CHOOSER, B_MSG_FUTURE_SIGHT, BattleScript_CheckDoomDesireMiss
	accuracycheck BattleScript_FutureAttackMiss, MOVE_FUTURE_SIGHT
	goto BattleScript_FutureAttackAnimate
BattleScript_CheckDoomDesireMiss::
	accuracycheck BattleScript_FutureAttackMiss, MOVE_DOOM_DESIRE
BattleScript_FutureAttackAnimate::
	critcalc
	damagecalc
	adjustdamage
	jumpifmovehadnoeffect BattleScript_DoFutureAttackResult
	jumpifbyte CMP_NOT_EQUAL, cMULTISTRING_CHOOSER, B_MSG_FUTURE_SIGHT, BattleScript_FutureHitAnimDoomDesire
	playanimation BS_ATTACKER, B_ANIM_FUTURE_SIGHT_HIT
	goto BattleScript_DoFutureAttackHit
BattleScript_FutureHitAnimDoomDesire::
	playanimation BS_ATTACKER, B_ANIM_DOOM_DESIRE_HIT
BattleScript_DoFutureAttackHit::
	effectivenesssound
	hitanimation BS_TARGET
	waitstate
	healthbarupdate BS_TARGET, MOVE_DAMAGE_HP_UPDATE
	datahpupdate BS_TARGET, MOVE_DAMAGE_HP_UPDATE
	critmessage
	waitmessage B_WAIT_TIME_LONG
BattleScript_DoFutureAttackResult:
	resultmessage
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_TARGET
	checkteamslost BattleScript_FutureAttackEnd
BattleScript_FutureAttackEnd::
	moveendcase MOVEEND_SET_VALUES
	moveendcase MOVEEND_RAGE
	moveendcase MOVEEND_ABILITIES
	moveendcase MOVEEND_COLOR_CHANGE
	moveendcase MOVEEND_ITEM_EFFECTS_TARGET
	moveendfromto MOVEEND_SYMBIOSIS, MOVEEND_UPDATE_LAST_MOVES
	goto BattleScript_FutureAttackClearResults
BattleScript_FutureAttackMiss::
	pause B_WAIT_TIME_SHORT
	setmoveresultflags MOVE_RESULT_FAILED
	resultmessage
	waitmessage B_WAIT_TIME_LONG
BattleScript_FutureAttackClearResults:
	setmoveresultflags 0
	clearspecialstatuses
	end2

BattleScript_NoMovesLeft::
	printselectionstring STRINGID_PKMNHASNOMOVESLEFT
	endselectionscript

BattleScript_SelectingMoveWithNoPP::
	printselectionstring STRINGID_NOPPLEFT
	endselectionscript

BattleScript_NoPPForMove::
	printattackstring
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_BUTNOPPLEFT
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_SelectingTormentedMove::
	printselectionstring STRINGID_PKMNCANTUSEMOVETORMENT
	endselectionscript

BattleScript_MoveUsedIsTormented::
	printstring STRINGID_PKMNCANTUSEMOVETORMENT
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_SelectingTormentedMoveInPalace::
	printstring STRINGID_PKMNCANTUSEMOVETORMENT
	goto BattleScript_SelectingUnusableMoveInPalace

BattleScript_SelectingNotAllowedMoveTaunt::
	printselectionstring STRINGID_PKMNCANTUSEMOVETAUNT
	endselectionscript

BattleScript_MoveUsedIsTaunted::
	printstring STRINGID_PKMNCANTUSEMOVETAUNT
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_SelectingNotAllowedMoveTauntInPalace::
	printstring STRINGID_PKMNCANTUSEMOVETAUNT
	goto BattleScript_SelectingUnusableMoveInPalace

BattleScript_SelectingNotAllowedMoveThroatChop::
	printselectionstring STRINGID_PKMNCANTUSEMOVETHROATCHOP
	endselectionscript

BattleScript_MoveUsedIsThroatChopPrevented::
	printstring STRINGID_PKMNCANTUSEMOVETHROATCHOP
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_SelectingNotAllowedMoveThroatChopInPalace::
	printstring STRINGID_PKMNCANTUSEMOVETHROATCHOP
	goto BattleScript_SelectingUnusableMoveInPalace

BattleScript_ThroatChopEndTurn::
	printstring STRINGID_THROATCHOPENDS
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_SlowStartEnds::
	pause 5
	copybyte gBattlerAbility, gBattlerAttacker
	call BattleScript_AbilityPopUp
	printstring STRINGID_SLOWSTARTEND
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_SelectingNotAllowedMoveGravity::
	printselectionstring STRINGID_GRAVITYPREVENTSUSAGE
	endselectionscript

BattleScript_SelectingNotAllowedStuffCheeks::
	printselectionstring STRINGID_STUFFCHEEKSCANTSELECT
	endselectionscript

BattleScript_SelectingNotAllowedStuffCheeksInPalace::
	printstring STRINGID_STUFFCHEEKSCANTSELECT
	goto BattleScript_SelectingUnusableMoveInPalace

BattleScript_SelectingNotAllowedBelch::
	printselectionstring STRINGID_BELCHCANTSELECT
	endselectionscript

BattleScript_SelectingNotAllowedBelchInPalace::
	printstring STRINGID_BELCHCANTSELECT
	goto BattleScript_SelectingUnusableMoveInPalace

BattleScript_MoveUsedGravityPrevents::
	printstring STRINGID_GRAVITYPREVENTSUSAGE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_SelectingNotAllowedMoveGravityInPalace::
	printstring STRINGID_GRAVITYPREVENTSUSAGE
	goto BattleScript_SelectingUnusableMoveInPalace

BattleScript_SelectingNotAllowedMoveHealBlock::
	printselectionstring STRINGID_HEALBLOCKPREVENTSUSAGE
	endselectionscript

BattleScript_MoveUsedHealBlockPrevents::
	printstring STRINGID_HEALBLOCKPREVENTSUSAGE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_SelectingNotAllowedMoveHealBlockInPalace::
	printstring STRINGID_HEALBLOCKPREVENTSUSAGE
	goto BattleScript_SelectingUnusableMoveInPalace

BattleScript_SelectingNotAllowedCurrentMove::
	printselectionstring STRINGID_CURRENTMOVECANTSELECT
	endselectionscript

BattleScript_SelectingNotAllowedCurrentMoveInPalace::
	printstring STRINGID_CURRENTMOVECANTSELECT
	goto BattleScript_SelectingUnusableMoveInPalace

BattleScript_WishComesTrue::
	playanimation BS_TARGET, B_ANIM_WISH_HEAL
	printstring STRINGID_PKMNWISHCAMETRUE
	waitmessage B_WAIT_TIME_LONG
	healthbarupdate BS_TARGET, PASSIVE_HP_UPDATE
	datahpupdate BS_TARGET, PASSIVE_HP_UPDATE
	printstring STRINGID_PKMNREGAINEDHEALTH
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_WishButFullHp::
	printstring STRINGID_PKMNWISHCAMETRUE
	waitmessage B_WAIT_TIME_LONG
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNHPFULL
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_WishButHealBlocked::
	printstring STRINGID_PKMNWISHCAMETRUE
	waitmessage B_WAIT_TIME_LONG
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_HEALBLOCKPREVENTSUSAGE
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_IngrainTurnHeal::
	playanimation BS_ATTACKER, B_ANIM_INGRAIN_HEAL
	printstring STRINGID_PKMNABSORBEDNUTRIENTS
BattleScript_TurnHeal:
	waitmessage B_WAIT_TIME_LONG
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	end2

BattleScript_AquaRingHeal::
	playanimation BS_ATTACKER, B_ANIM_AQUA_RING_HEAL
	printstring STRINGID_AQUARINGHEAL
	goto BattleScript_TurnHeal

BattleScript_PrintMonIsRooted::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNANCHOREDITSELF
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_PrintMonIsRootedRet::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNANCHOREDITSELF
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_AtkDefDown::
	setstatchanger STAT_ATK, 1, TRUE
	statbuffchange BS_ATTACKER, STAT_CHANGE_CERTAIN | STAT_CHANGE_ALLOW_PTR, BattleScript_AtkDefDownTryDef, BIT_DEF
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_AtkDefDownTryDef
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_AtkDefDownTryDef:
	setstatchanger STAT_DEF, 1, TRUE
	statbuffchange BS_ATTACKER, STAT_CHANGE_CERTAIN | STAT_CHANGE_ALLOW_PTR, BattleScript_AtkDefDownRet
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_AtkDefDownRet:
	return

BattleScript_DefSpDefDown::
	setstatchanger STAT_DEF, 1, TRUE
	statbuffchange BS_ATTACKER, STAT_CHANGE_CERTAIN | STAT_CHANGE_ALLOW_PTR, BattleScript_DefSpDefDownTrySpDef, BIT_SPDEF
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_DefSpDefDownTrySpDef
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_DefSpDefDownTrySpDef::
	setstatchanger STAT_SPDEF, 1, TRUE
	statbuffchange BS_ATTACKER, STAT_CHANGE_CERTAIN | STAT_CHANGE_ALLOW_PTR, BattleScript_DefSpDefDownRet
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_DefSpDefDownRet
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_DefSpDefDownRet::
	return

BattleScript_DefDownSpeedUp::
	jumpifstat BS_ATTACKER, CMP_GREATER_THAN, STAT_DEF, MIN_STAT_STAGE, BattleScript_DefDownSpeedUpTryDef
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPEED, MAX_STAT_STAGE, BattleScript_DefDownSpeedUpRet
BattleScript_DefDownSpeedUpTryDef::
	setstatchanger STAT_DEF, 1, TRUE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_CERTAIN, BattleScript_DefDownSpeedUpTrySpeed
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_DefDownSpeedUpTrySpeed
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_DefDownSpeedUpTrySpeed:
	setstatchanger STAT_SPEED, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_CERTAIN, BattleScript_DefDownSpeedUpRet
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_DefDownSpeedUpRet
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_DefDownSpeedUpRet::
	return

BattleScript_KnockedOff::
	playanimation BS_TARGET, B_ANIM_ITEM_KNOCKOFF
	printstring STRINGID_PKMNKNOCKEDOFF
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MoveUsedIsImprisoned::
	printstring STRINGID_PKMNCANTUSEMOVESEALED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_SelectingImprisonedMove::
	printselectionstring STRINGID_PKMNCANTUSEMOVESEALED
	endselectionscript

BattleScript_SelectingImprisonedMoveInPalace::
	printstring STRINGID_PKMNCANTUSEMOVESEALED
	goto BattleScript_SelectingUnusableMoveInPalace

BattleScript_GrudgeTakesPp::
	printstring STRINGID_PKMNLOSTPPGRUDGE
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MagicBounce::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNMOVEBOUNCEDABILITY
	waitmessage B_WAIT_TIME_LONG
	setmagiccoattarget
	return

BattleScript_MagicCoat::
	pause B_WAIT_TIME_SHORT
	setmagiccoattarget
	printstring STRINGID_PKMNMOVEBOUNCED
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MagicCoatPrankster::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNMOVEBOUNCED
	waitmessage B_WAIT_TIME_LONG
	printstring STRINGID_ITDOESNTAFFECT
	waitmessage B_WAIT_TIME_LONG
	setmoveresultflags MOVE_RESULT_NO_EFFECT
	goto BattleScript_MoveEnd

BattleScript_SnatchedMove::
	snatchsetbattlers
	playanimation BS_TARGET, B_ANIM_SNATCH_MOVE
	printstring STRINGID_PKMNSNATCHEDMOVE
	waitmessage B_WAIT_TIME_LONG
	swapattackerwithtarget
	return

BattleScript_EnduredMsg::
	printstring STRINGID_PKMNENDUREDHIT
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_SturdiedMsg::
	pause B_WAIT_TIME_SHORTEST
	call BattleScript_AbilityPopUpTarget
	printstring STRINGID_ENDUREDSTURDY
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_OneHitKOMsg::
	printstring STRINGID_ONEHITKO
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MoveEffectClearSmog::
	printstring STRINGID_RESETSTARGETSSTATLEVELS
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_FocusPunchSetUp::
	flushtextbox
	playanimation BS_ATTACKER, B_ANIM_FOCUS_PUNCH_SETUP
	printstring STRINGID_PKMNTIGHTENINGFOCUS
	waitmessage B_WAIT_TIME_LONG
	end3

BattleScript_MegaEvolution::
	flushtextbox
	trytrainerslidemegaevolutionmsg
	printstring STRINGID_MEGAEVOREACTING
BattleScript_MegaEvolutionAfterString:
	waitmessage B_WAIT_TIME_LONG
	handlemegaevo BS_SCRIPTING, 0
	playanimation BS_SCRIPTING, B_ANIM_MEGA_EVOLUTION
	waitanimation
	handlemegaevo BS_SCRIPTING, 1
	printstring STRINGID_MEGAEVOEVOLVED
	waitmessage B_WAIT_TIME_LONG
	switchinabilities BS_SCRIPTING
	end3

BattleScript_WishMegaEvolution::
	flushtextbox
	trytrainerslidemegaevolutionmsg
	printstring STRINGID_FERVENTWISHREACHED
	goto BattleScript_MegaEvolutionAfterString

BattleScript_PrimalReversion::
	flushtextbox
	handleprimalreversion BS_SCRIPTING, 0
	handleprimalreversion BS_SCRIPTING, 1
	playanimation BS_SCRIPTING, B_ANIM_PRIMAL_REVERSION
	waitanimation
	handleprimalreversion BS_SCRIPTING, 2
	printstring STRINGID_PKMNREVERTEDTOPRIMAL
	waitmessage B_WAIT_TIME_LONG
	switchinabilities BS_SCRIPTING
	end3

BattleScript_PowerConstruct::
	flushtextbox
	printstring STRINGID_POWERCONSTRUCTPRESENCEOFMANY
	waitmessage B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUpScripting
	handleformchange BS_SCRIPTING, 0
	handleformchange BS_SCRIPTING, 1
	playanimation BS_SCRIPTING, B_ANIM_POWER_CONSTRUCT
	waitanimation
	handleformchange BS_SCRIPTING, 2
	printstring STRINGID_POWERCONSTRUCTTRANSFORM
	waitmessage B_WAIT_TIME_SHORT
	end2

BattleScript_UltraBurst::
	flushtextbox
	trytrainerslidezmovemsg
	printstring STRINGID_ULTRABURSTREACTING
	waitmessage B_WAIT_TIME_LONG
	handleultraburst BS_SCRIPTING, 0
	playanimation BS_SCRIPTING, B_ANIM_ULTRA_BURST
	waitanimation
	handleultraburst BS_SCRIPTING, 1
	printstring STRINGID_ULTRABURSTCOMPLETED
	waitmessage B_WAIT_TIME_LONG
	switchinabilities BS_SCRIPTING
	end3

BattleScript_GulpMissileFormChange::
	call BattleScript_BattlerFormChange
	goto BattleScript_FromTwoTurnMovesSecondTurnRet

BattleScript_BattlerFormChange::
	pause 5
	call BattleScript_AbilityPopUpScripting
	flushtextbox
BattleScript_BattlerFormChangeNoPopup:
	handleformchange BS_SCRIPTING, 0
	handleformchange BS_SCRIPTING, 1
	playanimation BS_SCRIPTING, B_ANIM_FORM_CHANGE
	waitanimation
	handleformchange BS_SCRIPTING, 2
	return

BattleScript_BattlerFormChangeEnd3::
	call BattleScript_BattlerFormChange
	end3

BattleScript_BattlerFormChangeEnd3NoPopup::
	call BattleScript_BattlerFormChangeNoPopup
	end2

BattleScript_BattlerFormChangeEnd2::
	call BattleScript_BattlerFormChange
	end2

BattleScript_BattlerFormChangeWithStringEnd3::
	pause 5
	call BattleScript_AbilityPopUpScripting
	flushtextbox
	handleformchange BS_SCRIPTING, 0
	handleformchange BS_SCRIPTING, 1
	playanimation BS_SCRIPTING, B_ANIM_FORM_CHANGE
	waitanimation
	handleformchange BS_SCRIPTING, 2
	printstring STRINGID_PKMNTRANSFORMED
	waitmessage B_WAIT_TIME_LONG
	end3

BattleScript_AttackerFormChangeMoveEffect::
	waitmessage 1
	handleformchange BS_ATTACKER, 0
	handleformchange BS_ATTACKER, 1
	playanimation BS_ATTACKER, B_ANIM_FORM_CHANGE
	waitanimation
	copybyte sBATTLER, gBattlerAttacker
	printstring STRINGID_PKMNTRANSFORMED
	waitmessage B_WAIT_TIME_LONG
	handleformchange BS_ATTACKER, 2
	return

BattleScript_BallFetch::
	call BattleScript_AbilityPopUp
	printstring STRINGID_FETCHEDPOKEBALL
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_CudChewActivates::
	pause B_WAIT_TIME_SHORTEST
	call BattleScript_AbilityPopUp
	setbyte sBERRY_OVERRIDE, 1 @ override the requirements for eating berries
	consumeberry BS_ATTACKER, FALSE
	setbyte sBERRY_OVERRIDE, 0
	end2

BattleScript_ApplyDisguiseFormChangeHPLoss::
	jumpifgenconfiglowerthan GEN_CONFIG_DISGUISE_HP_LOSS, GEN_8, BattleScript_ApplyDisguiseFormChangeHPLossReturn
	healthbarupdate BS_SCRIPTING, PASSIVE_HP_UPDATE
	datahpupdate BS_SCRIPTING, PASSIVE_HP_UPDATE
BattleScript_ApplyDisguiseFormChangeHPLossReturn:
	return

BattleScript_TargetFormChangeNoPopup:
	flushtextbox
	handleformchange BS_SCRIPTING, 0
	handleformchange BS_SCRIPTING, 1
	playanimation BS_TARGET, B_ANIM_FORM_CHANGE
	waitanimation
	handleformchange BS_SCRIPTING, 2
	jumpifability BS_TARGET, ABILITY_DISGUISE, BattleScript_ApplyDisguiseFormChangeHPLoss
	return

BattleScript_TargetFormChange::
	pause 5
	call BattleScript_AbilityPopUpTarget
	call BattleScript_TargetFormChangeNoPopup
	return

BattleScript_TargetFormChangeWithString::
	pause 5
	call BattleScript_AbilityPopUpTarget
	call BattleScript_TargetFormChangeNoPopup
	printstring STRINGID_PKMNTRANSFORMED
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_TargetFormChangeWithStringNoPopup::
	call BattleScript_TargetFormChangeNoPopup
	printstring STRINGID_PKMNTRANSFORMED
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_IllusionOffAndTerastallization::
	call BattleScript_IllusionOff
	goto BattleScript_Terastallization

BattleScript_IllusionOffEnd3::
	call BattleScript_IllusionOff
	end3

BattleScript_IllusionOff::
	setspriteignore0hp TRUE
	playanimation BS_SCRIPTING, B_ANIM_ILLUSION_OFF
	waitanimation
	updatenick
	waitstate
	setspriteignore0hp FALSE
	printstring STRINGID_ILLUSIONWOREOFF
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_CottonDownActivates::
	copybyte sSAVED_BATTLER, gBattlerAttacker
	call BattleScript_AbilityPopUpTarget
	copybyte gEffectBattler, gBattlerTarget
	swapattackerwithtarget
	setbyte gBattlerTarget, 0
BattleScript_CottonDownLoop:
	jumpifabsent BS_TARGET, BattleScript_CottonDownLoopIncrement
	setstatchanger STAT_SPEED, 1, TRUE
	jumpifbyteequal gBattlerTarget, gEffectBattler, BattleScript_CottonDownLoopIncrement
	statbuffchange BS_TARGET, STAT_CHANGE_NOT_PROTECT_AFFECTED | STAT_CHANGE_ALLOW_PTR, BattleScript_CottonDownLoopIncrement
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_CottonDownTargetSpeedCantGoLower
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_CottonDownLoopIncrement
BattleScript_CottonDownTargetSpeedCantGoLower:
	printstring STRINGID_STATSWONTDECREASE
	waitmessage B_WAIT_TIME_LONG
BattleScript_CottonDownLoopIncrement:
	addbyte gBattlerTarget, 1
	jumpifbytenotequal gBattlerTarget, gBattlersCount, BattleScript_CottonDownLoop
	swapattackerwithtarget
	copybyte gBattlerAttacker, sSAVED_BATTLER
	return

BattleScript_AnticipationActivates::
	pause 5
	call BattleScript_AbilityPopUp
	printstring STRINGID_ANTICIPATIONACTIVATES
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_AftermathDmg::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUpScripting
	jumpifability BS_ATTACKER, ABILITY_MAGIC_GUARD, BattleScript_AftermathDmgRet
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	printstring STRINGID_AFTERMATHDMG
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_ATTACKER
BattleScript_AftermathDmgRet:
	return

BattleScript_DampPreventsAftermath::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	pause 40
	copybyte gBattlerAbility, sBATTLER
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNSABILITYPREVENTSABILITY
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MoveUsedIsAsleep::
	printstring STRINGID_PKMNFASTASLEEP
	waitmessage B_WAIT_TIME_LONG
	statusanimation BS_ATTACKER
	goto BattleScript_MoveEnd

BattleScript_MoveUsedWokeUp::
	printfromtable gWokeUpStringIds
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_ATTACKER
	return

BattleScript_MonWokeUpInUproar::
	printstring STRINGID_PKMNWOKEUPINUPROAR
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_EFFECT_BATTLER
	end2

BattleScript_PoisonTurnDmg::
	printstring STRINGID_PKMNHURTBYPOISON
	waitmessage B_WAIT_TIME_LONG
BattleScript_DoStatusTurnDmg::
	statusanimation BS_ATTACKER
BattleScript_DoTurnDmg:
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	tryfaintmon BS_ATTACKER
	checkteamslost BattleScript_DoTurnDmgEnd
	tryactivateitem BS_ATTACKER, ACTIVATION_ON_HP_THRESHOLD
BattleScript_DoTurnDmgEnd:
	end2

BattleScript_PoisonHealActivates::
	copybyte gBattlerAbility, gBattlerAttacker
	call BattleScript_AbilityPopUp
	printstring STRINGID_POISONHEALHPUP
	waitmessage B_WAIT_TIME_LONG
	statusanimation BS_ATTACKER
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	end2

BattleScript_BurnTurnDmg::
	printstring STRINGID_PKMNHURTBYBURN
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_DoStatusTurnDmg

BattleScript_FrostbiteTurnDmg::
	printstring STRINGID_PKMNHURTBYFROSTBITE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_DoStatusTurnDmg

BattleScript_MoveUsedIsFrozen::
	printstring STRINGID_PKMNISFROZEN
	waitmessage B_WAIT_TIME_LONG
	statusanimation BS_ATTACKER
	goto BattleScript_MoveEnd

BattleScript_MoveUsedUnfroze::
	printfromtable gGotDefrostedStringIds
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_ATTACKER
	return

BattleScript_MoveUsedUnfrostbite::
	printfromtable gFrostbiteHealedStringIds
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_ATTACKER
	return

BattleScript_DefrostedViaFireMove::
	printstring STRINGID_PKMNWASDEFROSTED
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_TARGET
	return

BattleScript_FrostbiteHealedViaFireMove::
	printstring STRINGID_PKMNFROSTBITEHEALED
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_TARGET
	return

BattleScript_MoveUsedIsParalyzed::
	printstring STRINGID_PKMNISPARALYZED
	waitmessage B_WAIT_TIME_LONG
	statusanimation BS_ATTACKER
	cancelmultiturnmoves
	goto BattleScript_MoveEnd

BattleScript_PowderMoveNoEffect::
	pause B_WAIT_TIME_SHORT
	jumpiftype BS_TARGET, TYPE_GRASS, BattleScript_PowderMoveNoEffectPrint
	jumpifability BS_TARGET, ABILITY_OVERCOAT, BattleScript_PowderMoveNoEffectOvercoat
	setlastuseditem BS_TARGET
	printstring STRINGID_SAFETYGOGGLESPROTECTED
	goto BattleScript_PowderMoveNoEffectWaitMsg
BattleScript_PowderMoveNoEffectOvercoat:
	call BattleScript_AbilityPopUpTarget
BattleScript_PowderMoveNoEffectPrint:
	printstring STRINGID_ITDOESNTAFFECT
BattleScript_PowderMoveNoEffectWaitMsg:
	waitmessage B_WAIT_TIME_LONG
	cancelmultiturnmoves
	setmoveresultflags MOVE_RESULT_FAILED
	goto BattleScript_MoveEnd

BattleScript_MoveUsedFlinched::
	printstring STRINGID_PKMNFLINCHED
	waitmessage B_WAIT_TIME_LONG
	jumpifability BS_ATTACKER, ABILITY_STEADFAST, BattleScript_TryActivateSteadFast
BattleScript_MoveUsedFlinchedEnd:
	goto BattleScript_MoveEnd
BattleScript_TryActivateSteadFast:
	setstatchanger STAT_SPEED, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_ONLY_CHECKING, BattleScript_MoveUsedFlinchedEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_MoveUsedFlinchedEnd
	copybyte gBattlerAbility, gBattlerAttacker
	call BattleScript_AbilityPopUp
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_MoveUsedFlinchedEnd
	setbyte gBattleCommunication, STAT_SPEED
	stattextbuffer
	printstring STRINGID_ATTACKERABILITYSTATRAISE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveUsedFlinchedEnd

BattleScript_PrintUproarOverTurns::
	printfromtable gUproarOverTurnStringIds
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_ThrashConfuses::
	volatileanimation BS_ATTACKER, VOLATILE_CONFUSION
	printstring STRINGID_PKMNFATIGUECONFUSION
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_MoveUsedIsConfused::
	printstring STRINGID_PKMNISCONFUSED
	waitmessage B_WAIT_TIME_LONG
	volatileanimation BS_ATTACKER, VOLATILE_CONFUSION
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, FALSE, BattleScript_MoveUsedIsConfusedRet
BattleScript_DoSelfConfusionDmg::
	cancelmultiturnmoves
	adjustdamage
	printstring STRINGID_ITHURTCONFUSION
	waitmessage B_WAIT_TIME_LONG
	effectivenesssound
	hitanimation BS_ATTACKER
	waitstate
	isdmgblockedbydisguise
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	resultmessage
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_ATTACKER
	goto BattleScript_MoveEnd
BattleScript_MoveUsedIsConfusedRet::
	return

BattleScript_MoveUsedPowder::
	pause B_WAIT_TIME_SHORT
	cancelmultiturnmoves
	volatileanimation BS_ATTACKER, VOLATILE_POWDER
	waitanimation
	effectivenesssound
	hitanimation BS_ATTACKER
	waitstate
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	printstring STRINGID_POWDEREXPLODES
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_ATTACKER
	goto BattleScript_MoveEnd

BattleScript_MoveUsedIsConfusedNoMore::
	printstring STRINGID_PKMNHEALEDCONFUSION
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_PrintPayDayMoneyString::
	printstring STRINGID_PLAYERPICKEDUPMONEY
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_WrapTurnDmg::
	jumpifability BS_ATTACKER, ABILITY_MAGIC_GUARD, BattleScript_DoTurnDmgEnd
	playanimation BS_ATTACKER, B_ANIM_TURN_TRAP, sB_ANIM_ARG1
	printstring STRINGID_PKMNHURTBY
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_DoTurnDmg

BattleScript_WrapEnds::
	printstring STRINGID_PKMNFREEDFROM
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_MoveUsedIsInLove::
	printstring STRINGID_PKMNINLOVE
	waitmessage B_WAIT_TIME_LONG
	volatileanimation BS_ATTACKER, VOLATILE_INFATUATION
	return

BattleScript_MoveUsedIsInLoveCantAttack::
	printstring STRINGID_PKMNIMMOBILIZEDBYLOVE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_NightmareTurnDmg::
	printstring STRINGID_PKMNLOCKEDINNIGHTMARE
	waitmessage B_WAIT_TIME_LONG
	volatileanimation BS_ATTACKER, VOLATILE_NIGHTMARE
	goto BattleScript_DoTurnDmg

BattleScript_CurseTurnDmg::
	printstring STRINGID_PKMNAFFLICTEDBYCURSE
	waitmessage B_WAIT_TIME_LONG
	volatileanimation BS_ATTACKER, VOLATILE_CURSED
	goto BattleScript_DoTurnDmg

BattleScript_TargetPRLZHeal::
	printstring STRINGID_PKMNHEALEDPARALYSIS
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_TARGET
	return

BattleScript_TargetWokeUp::
	printstring STRINGID_TARGETWOKEUP
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_TARGET
	return

BattleScript_TargetBurnHeal::
	printstring STRINGID_PKMNBURNHEALED
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_TARGET
	return

BattleScript_TargetPoisonHealed::
	printstring STRINGID_PASTELVEILENTERS
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_TARGET
	return

BattleScript_MoveEffectSleep::
	statusanimation BS_EFFECT_BATTLER
	printfromtable gFellAsleepStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_UpdateEffectStatusIconRet::
	updatestatusicon BS_EFFECT_BATTLER
	waitstate
	trytriggerstatusform
	flushtextbox
	return

BattleScript_YawnMakesAsleepEnd2::
	statusanimation BS_EFFECT_BATTLER
	printstring STRINGID_PKMNFELLASLEEP
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_EFFECT_BATTLER
	waitstate
	jumpfifsemiinvulnerable BS_EFFECT_BATTLER, STATE_SKY_DROP, BattleScript_YawnEnd
	makevisible BS_EFFECT_BATTLER
	skydropyawn
BattleScript_YawnEnd:
	end2

BattleScript_EmbargoEndTurn::
	printstring STRINGID_EMBARGOENDS
	waitmessage B_WAIT_TIME_LONG
	tryactivateitem BS_ATTACKER, ACTIVATION_ON_USABLE_AGAIN
	end2

BattleScript_TelekinesisEndTurn::
	printstring STRINGID_TELEKINESISENDS
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_BufferEndTurn::
	printstring STRINGID_BUFFERENDS
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_ToxicOrb::
	setbyte cMULTISTRING_CHOOSER, 0
	copybyte gEffectBattler, gBattlerAttacker
	call BattleScript_MoveEffectToxic
	end2

BattleScript_FlameOrb::
	setbyte cMULTISTRING_CHOOSER, 0
	copybyte gEffectBattler, gBattlerAttacker
	call BattleScript_MoveEffectBurn
	end2

BattleScript_MoveEffectPoison::
	statusanimation BS_EFFECT_BATTLER
	printfromtable gGotPoisonedStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_UpdateEffectStatusIconRet

BattleScript_MoveEffectBurn::
	statusanimation BS_EFFECT_BATTLER
	printfromtable gGotBurnedStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_UpdateEffectStatusIconRet

BattleScript_MoveEffectFrostbite::
	statusanimation BS_EFFECT_BATTLER
	printfromtable gGotFrostbiteStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_UpdateEffectStatusIconRet

BattleScript_MoveEffectFreeze::
	statusanimation BS_EFFECT_BATTLER
	printfromtable gGotFrozenStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_UpdateEffectStatusIconRet

BattleScript_MoveEffectParalysis::
	statusanimation BS_EFFECT_BATTLER
	printfromtable gGotParalyzedStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_UpdateEffectStatusIconRet

BattleScript_MoveEffectUproar::
	printstring STRINGID_PKMNCAUSEDUPROAR
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MoveEffectToxic::
	statusanimation BS_EFFECT_BATTLER
	printstring STRINGID_PKMNBADLYPOISONED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_UpdateEffectStatusIconRet

BattleScript_MoveEffectPayDay::
	printstring STRINGID_COINSSCATTERED
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MoveEffectWrap::
	printfromtable gWrappedStringIds
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MoveEffectConfusion::
	volatileanimation BS_EFFECT_BATTLER, VOLATILE_CONFUSION
	printstring STRINGID_PKMNWASCONFUSED
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MoveEffectRecoil::
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	printstring STRINGID_PKMNHITWITHRECOIL
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_ATTACKER
	return

BattleScript_ItemSteal::
	playanimation BS_EFFECT_BATTLER, B_ANIM_ITEM_STEAL
	printstring STRINGID_PKMNSTOLEITEM
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_DrizzleActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNMADEITRAIN
	waitstate
	playanimation BS_BATTLER_0, B_ANIM_RAIN_CONTINUES
	call BattleScript_ActivateWeatherAbilities
	end3

BattleScript_AbilityRaisesDefenderStat::
	pause B_WAIT_TIME_SHORT
	statbuffchange BS_TARGET, STAT_CHANGE_ONLY_CHECKING, BattleScript_AbilityCantRaiseDefenderStat
	call BattleScript_AbilityPopUp
	statbuffchange BS_TARGET, 0, BattleScript_AbilityCantRaiseDefenderStat
	printstring STRINGID_DEFENDERSSTATROSE
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_AbilityCantRaiseDefenderStat::
	saveattacker
	copybyte gBattlerAttacker, gBattlerTarget
	printstring STRINGID_STATSWONTINCREASE
	waitmessage B_WAIT_TIME_LONG
	restoreattacker
	return

BattleScript_AbilityShieldProtects::
	saveattacker
	copybyte gBattlerAttacker, gBattlerAbility
	playanimation BS_ATTACKER, B_ANIM_HELD_ITEM_EFFECT
	waitanimation
	printstring STRINGID_ABILITYSHIELDPROTECTS
	waitmessage B_WAIT_TIME_LONG
	restoreattacker
	return

BattleScript_AbilityPopUpTarget::
	copybyte gBattlerAbility, gBattlerTarget
BattleScript_AbilityPopUp::
	tryactivateabilityshield BS_ABILITY_BATTLER
	showabilitypopup
	pause B_WAIT_TIME_SHORT
	recordability BS_ABILITY_BATTLER
	sethword sABILITY_OVERWRITE, 0
	return

BattleScript_AbilityPopUpScripting:
	copybyte gBattlerAbility, sBATTLER
	goto BattleScript_AbilityPopUp

BattleScript_AbilityPopUpOverwriteThenNormal:
	setbyte sFIXED_ABILITY_POPUP, TRUE
	showabilitypopup
	pause B_WAIT_TIME_SHORT
	sethword sABILITY_OVERWRITE, 0
	updateabilitypopup
	pause B_WAIT_TIME_SHORT
	recordability BS_ABILITY_BATTLER
	destroyabilitypopup
	setbyte sFIXED_ABILITY_POPUP, FALSE
	return

@ Can't compare directly to a value, have to compare to value at pointer
sZero:
.byte 0

BattleScript_MoodyActivates::
	call BattleScript_AbilityPopUp
	jumpifbyteequal sSTATCHANGER, sZero, BattleScript_MoodyLower
	statbuffchange BS_ATTACKER, STAT_CHANGE_CERTAIN | STAT_CHANGE_NOT_PROTECT_AFFECTED, BattleScript_MoodyLower
	jumpifbyte CMP_GREATER_THAN, cMULTISTRING_CHOOSER, B_MSG_DEFENDER_STAT_CHANGED, BattleScript_MoodyLower
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_MoodyLower:
	jumpifbyteequal sSAVED_STAT_CHANGER, sZero, BattleScript_MoodyEnd
	copybyte sSTATCHANGER, sSAVED_STAT_CHANGER
	statbuffchange BS_ATTACKER, STAT_CHANGE_CERTAIN | STAT_CHANGE_NOT_PROTECT_AFFECTED, BattleScript_MoodyEnd
	jumpifbyte CMP_GREATER_THAN, cMULTISTRING_CHOOSER, B_MSG_DEFENDER_STAT_CHANGED, BattleScript_MoodyEnd
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_MoodyEnd:
	end2

BattleScript_EmergencyExit::
	pause 5
	call BattleScript_AbilityPopUpScripting
	pause B_WAIT_TIME_LONG
	playanimation BS_SCRIPTING, B_ANIM_SLIDE_OFFSCREEN
	waitanimation
	openpartyscreen BS_SCRIPTING, BattleScript_EmergencyExitRet
	switchoutabilities BS_SCRIPTING
	waitstate
	switchhandleorder BS_SCRIPTING, 2
	returntoball BS_SCRIPTING, FALSE
	getswitchedmondata BS_SCRIPTING
	switchindataupdate BS_SCRIPTING
	hpthresholds BS_SCRIPTING
	printstring STRINGID_SWITCHINMON
	switchinanim BS_SCRIPTING, FALSE, TRUE
	waitstate
	switchineffects BS_SCRIPTING
BattleScript_EmergencyExitRet:
	return

BattleScript_EmergencyExitWild::
	pause 5
	call BattleScript_AbilityPopUpScripting
	pause B_WAIT_TIME_LONG
	playanimation BS_SCRIPTING, B_ANIM_SLIDE_OFFSCREEN
	waitanimation
	setteleportoutcome BS_SCRIPTING
	finishaction
	return

BattleScript_EmergencyExitEnd2::
	pause 5
	call BattleScript_AbilityPopUp
	pause B_WAIT_TIME_LONG
	playanimation BS_ATTACKER, B_ANIM_SLIDE_OFFSCREEN
	waitanimation
	openpartyscreen BS_ATTACKER, BattleScript_EmergencyExitRetEnd2
	switchoutabilities BS_ATTACKER
	waitstate
	switchhandleorder BS_ATTACKER, 2
	returntoball BS_ATTACKER, FALSE
	getswitchedmondata BS_ATTACKER
	switchindataupdate BS_ATTACKER
	hpthresholds BS_ATTACKER
	printstring STRINGID_SWITCHINMON
	switchinanim BS_ATTACKER, FALSE, TRUE
	waitstate
	switchineffects BS_ATTACKER
BattleScript_EmergencyExitRetEnd2:
	end2

BattleScript_EmergencyExitWildEnd2::
	pause 5
	call BattleScript_AbilityPopUp
	pause B_WAIT_TIME_LONG
	playanimation BS_ATTACKER, B_ANIM_SLIDE_OFFSCREEN
	waitanimation
	setteleportoutcome BS_ATTACKER
	finishaction
	end2

BattleScript_TraceActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUpScripting
	printstring STRINGID_PKMNTRACED
	waitmessage B_WAIT_TIME_LONG
	settracedability BS_SCRIPTING
	switchinabilities BS_SCRIPTING
	end3

BattleScript_ReceiverActivates::
	call BattleScript_AbilityPopUp
	printstring STRINGID_RECEIVERABILITYTAKEOVER
	waitmessage B_WAIT_TIME_LONG
	settracedability BS_ABILITY_BATTLER
	switchinabilities BS_ABILITY_BATTLER
	return

BattleScript_AbilityHpHeal:
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNSXRESTOREDHPALITTLE2
	waitmessage B_WAIT_TIME_LONG
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	return

BattleScript_RainDishActivates::
	call BattleScript_AbilityHpHeal
	end2

BattleScript_CheekPouchActivates::
	copybyte sSAVED_BATTLER, gBattlerAttacker
	copybyte gBattlerAttacker, gBattlerAbility
	call BattleScript_AbilityHpHeal
	copybyte gBattlerAttacker, sSAVED_BATTLER
	return

BattleScript_PickupActivates::
	pause 5
	tryrecycleitem BattleScript_PickupActivatesEnd
	call BattleScript_AbilityPopUp
	printstring STRINGID_XFOUNDONEY
	waitmessage B_WAIT_TIME_LONG
	tryactivateitem BS_ATTACKER, ACTIVATION_ON_PICK_UP
BattleScript_PickupActivatesEnd:
	end2

BattleScript_HarvestActivates::
	pause 5
	tryrecycleitem BattleScript_HarvestActivatesEnd
	call BattleScript_AbilityPopUp
	printstring STRINGID_HARVESTBERRY
	waitmessage B_WAIT_TIME_LONG
	tryactivateitem BS_ATTACKER, ACTIVATION_ON_HARVEST
BattleScript_HarvestActivatesEnd:
	end2

BattleScript_SolarPowerActivates::
	call BattleScript_AbilityPopUp
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	printstring STRINGID_SOLARPOWERHPDROP
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_ATTACKER
	end2

BattleScript_HealerActivates::
	call BattleScript_AbilityPopUp
	curestatus BS_SCRIPTING
	updatestatusicon BS_SCRIPTING
	printstring STRINGID_HEALERCURE
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_SandstreamActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNSXWHIPPEDUPSANDSTORM
	waitstate
	playanimation BS_BATTLER_0, B_ANIM_SANDSTORM_CONTINUES
	call BattleScript_ActivateWeatherAbilities
	end3

BattleScript_SandSpitActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_ASANDSTORMKICKEDUP
	waitstate
	playanimation BS_BATTLER_0, B_ANIM_SANDSTORM_CONTINUES
	call BattleScript_ActivateWeatherAbilities
	return

BattleScript_ShedSkinActivates::
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNSXCUREDYPROBLEM
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_ATTACKER
	end2

BattleScript_ActivateWeatherAbilities:
	saveattacker
	savetarget
	tryboosterenergy ON_WEATHER
	setbyte gBattlerAttacker, 0
BattleScript_ActivateWeatherAbilities_Loop:
	copyarraywithindex gBattlerTarget, gBattlerByTurnOrder, gBattlerAttacker, 1
	activateweatherchangeabilities BS_TARGET
	addbyte gBattlerAttacker, 1
	jumpifbytenotequal gBattlerAttacker, gBattlersCount, BattleScript_ActivateWeatherAbilities_Loop
	restoreattacker
	restoretarget
	return

BattleScript_TryIntimidateHoldEffects:
	jumpifnoholdeffect BS_TARGET, HOLD_EFFECT_ADRENALINE_ORB, BattleScript_TryIntimidateHoldEffectsRet
	jumpifstat BS_TARGET, CMP_EQUAL, STAT_SPEED, MAX_STAT_STAGE, BattleScript_TryIntimidateHoldEffectsRet
	setstatchanger STAT_SPEED, 1, FALSE
	playanimation BS_TARGET, B_ANIM_HELD_ITEM_EFFECT
	statbuffchange BS_TARGET, STAT_CHANGE_NOT_PROTECT_AFFECTED | STAT_CHANGE_CERTAIN | STAT_CHANGE_ALLOW_PTR, BattleScript_TryIntimidateHoldEffectsRet
	copybyte sBATTLER, gBattlerTarget
	setlastuseditem BS_TARGET
	printstring STRINGID_USINGITEMSTATOFPKMNROSE
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_TARGET
BattleScript_TryIntimidateHoldEffectsRet:
	return

BattleScript_IntimidateActivates::
	savetarget
	call BattleScript_AbilityPopUp
	setbyte gBattlerTarget, 0
BattleScript_IntimidateLoop:
	jumpiftargetally BattleScript_IntimidateLoopIncrement
	jumpifabsent BS_TARGET, BattleScript_IntimidateLoopIncrement
	jumpifvolatile BS_TARGET, VOLATILE_SUBSTITUTE, BattleScript_IntimidateLoopIncrement
	jumpifintimidateabilityprevented
BattleScript_IntimidateEffect:
	copybyte sBATTLER, gBattlerAttacker
	setstatchanger STAT_ATK, 1, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_NOT_PROTECT_AFFECTED | STAT_CHANGE_ALLOW_PTR, BattleScript_IntimidateLoopIncrement
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_IntimidateWontDecrease
	printstring STRINGID_PKMNCUTSATTACKWITH
BattleScript_IntimidateEffect_WaitString:
	waitmessage B_WAIT_TIME_LONG
	saveattacker
	savetarget
	copybyte sBATTLER, gBattlerTarget
	call BattleScript_TryIntimidateHoldEffects
	restoreattacker
	restoretarget
BattleScript_IntimidateLoopIncrement:
	addbyte gBattlerTarget, 1
	jumpifbytenotequal gBattlerTarget, gBattlersCount, BattleScript_IntimidateLoop
	copybyte sBATTLER, gBattlerAttacker
	destroyabilitypopup
	restoretarget
	restoreattacker
	pause B_WAIT_TIME_MED
	end3

BattleScript_IntimidatePrevented::
	copybyte sBATTLER, gBattlerTarget
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNPREVENTSSTATLOSSWITH
	goto BattleScript_IntimidateEffect_WaitString

BattleScript_IntimidateWontDecrease:
	printstring STRINGID_STATSWONTDECREASE
	goto BattleScript_IntimidateEffect_WaitString

BattleScript_IntimidateInReverse::
	copybyte sBATTLER, gBattlerTarget
	call BattleScript_AbilityPopUpTarget
	pause B_WAIT_TIME_SHORT
	modifybattlerstatstage BS_TARGET, STAT_ATK, INCREASE, 1, BattleScript_IntimidateLoopIncrement, ANIM_ON
	call BattleScript_TryIntimidateHoldEffects
	goto BattleScript_IntimidateLoopIncrement

BattleScript_SupersweetSyrupActivates::
 	savetarget
	call BattleScript_AbilityPopUp
	printstring STRINGID_SUPERSWEETAROMAWAFTS
	waitmessage B_WAIT_TIME_LONG
	setbyte gBattlerTarget, 0
BattleScript_SupersweetSyrupLoop:
	jumpiftargetally BattleScript_SupersweetSyrupLoopIncrement
	jumpifabsent BS_TARGET, BattleScript_SupersweetSyrupLoopIncrement
	jumpifvolatile BS_TARGET, VOLATILE_SUBSTITUTE, BattleScript_SupersweetSyrupLoopIncrement
BattleScript_SupersweetSyrupEffect:
	copybyte sBATTLER, gBattlerAttacker
	setstatchanger STAT_EVASION, 1, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_NOT_PROTECT_AFFECTED | STAT_CHANGE_ALLOW_PTR, BattleScript_SupersweetSyrupLoopIncrement
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_SupersweetSyrupWontDecrease
	printfromtable gStatDownStringIds
BattleScript_SupersweetSyrupEffect_WaitString:
	waitmessage B_WAIT_TIME_LONG
	saveattacker
	savetarget
	copybyte sBATTLER, gBattlerTarget
	call BattleScript_TryIntimidateHoldEffects
	restoreattacker
	restoretarget
BattleScript_SupersweetSyrupLoopIncrement:
	addbyte gBattlerTarget, 1
	jumpifbytenotequal gBattlerTarget, gBattlersCount, BattleScript_SupersweetSyrupLoop
	copybyte sBATTLER, gBattlerAttacker
	destroyabilitypopup
	restoretarget
	restoreattacker
	pause B_WAIT_TIME_MED
	end3

BattleScript_SupersweetSyrupWontDecrease:
	printstring STRINGID_STATSWONTDECREASE
	goto BattleScript_SupersweetSyrupEffect_WaitString

BattleScript_DroughtActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNSXINTENSIFIEDSUN
	waitstate
	playanimation BS_BATTLER_0, B_ANIM_SUN_CONTINUES
	call BattleScript_ActivateWeatherAbilities
	end3

BattleScript_DesolateLandActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_EXTREMELYHARSHSUNLIGHT
	waitstate
	playanimation BS_BATTLER_0, B_ANIM_SUN_CONTINUES
	call BattleScript_ActivateWeatherAbilities
	end3

BattleScript_PrimalWeatherBlocksMove::
	pause B_WAIT_TIME_SHORT
	printfromtable gPrimalWeatherBlocksStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_PrimordialSeaActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_HEAVYRAIN
	waitstate
	playanimation BS_BATTLER_0, B_ANIM_RAIN_CONTINUES
	call BattleScript_ActivateWeatherAbilities
	end3

BattleScript_DeltaStreamActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_MYSTERIOUSAIRCURRENT
	waitstate
	playanimation BS_ATTACKER, B_ANIM_STRONG_WINDS
	end3

BattleScript_ProtosynthesisActivates::
	call BattleScript_AbilityPopUpScripting
	printstring STRINGID_SUNLIGHTACTIVATEDABILITY
	waitmessage B_WAIT_TIME_MED
	printstring STRINGID_STATWASHEIGHTENED
	waitmessage B_WAIT_TIME_MED
	end3

BattleScript_QuarkDriveActivates::
	call BattleScript_AbilityPopUp
	printstring STRINGID_ELECTRICTERRAINACTIVATEDABILITY
	waitmessage B_WAIT_TIME_MED
	printstring STRINGID_STATWASHEIGHTENED
	waitmessage B_WAIT_TIME_MED
	end3

BattleScript_RuinAbilityActivates::
	call BattleScript_AbilityPopUp
	printstring STRINGID_ABILITYWEAKENEDSURROUNDINGMONSSTAT
	waitmessage B_WAIT_TIME_LONG
	end3

BattleScript_SupremeOverlordActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_ATTACKERGAINEDSTRENGTHFROMTHEFALLEN
	waitmessage B_WAIT_TIME_LONG
	end3

BattleScript_CostarActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNCOPIEDSTATCHANGES
	waitmessage B_WAIT_TIME_LONG
	end3

BattleScript_ZeroToHeroActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUpScripting
	printstring STRINGID_ZEROTOHEROTRANSFORMATION
	waitmessage B_WAIT_TIME_LONG
	end3

BattleScript_CommanderActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUpScripting
	printstring STRINGID_COMMANDERACTIVATES
	waitmessage B_WAIT_TIME_LONG
BattleScript_CommanderAtkIncrease:
	setstatchanger STAT_ATK, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_CommanderDefIncrease, BIT_DEF | BIT_SPATK | BIT_SPDEF | BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_CommanderDefIncrease
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_CommanderDefIncrease:
	setstatchanger STAT_DEF, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_CommanderSpAtkIncrease, BIT_SPATK | BIT_SPDEF | BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_CommanderSpAtkIncrease
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_CommanderSpAtkIncrease:
	setstatchanger STAT_SPATK, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_CommanderSpDefIncrease, BIT_SPDEF | BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_CommanderSpDefIncrease
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_CommanderSpDefIncrease:
	setstatchanger STAT_SPDEF, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_CommanderSpeedIncrease, BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_CommanderSpeedIncrease
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_CommanderSpeedIncrease:
	setstatchanger STAT_SPEED, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_CommanderEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_CommanderEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_CommanderEnd:
	restoreattacker
	end3

BattleScript_HospitalityActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_HOSPITALITYRESTORATION
	waitmessage B_WAIT_TIME_LONG
 	playanimation BS_EFFECT_BATTLER, B_ANIM_SIMPLE_HEAL
	healthbarupdate BS_EFFECT_BATTLER, PASSIVE_HP_UPDATE
	datahpupdate BS_EFFECT_BATTLER, PASSIVE_HP_UPDATE
	end3

BattleScript_AttackWeakenedByStrongWinds::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_ATTACKWEAKENEDBSTRONGWINDS
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MimicryActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_BATTLERTYPECHANGEDTO
	waitmessage B_WAIT_TIME_SHORT
	end3

BattleScript_SnowWarningActivatesHail::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_SNOWWARNINGHAIL
	waitstate
	playanimation BS_BATTLER_0, B_ANIM_HAIL_CONTINUES
	call BattleScript_ActivateWeatherAbilities
	end3

BattleScript_SnowWarningActivatesSnow::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_SNOWWARNINGSNOW
	waitstate
	playanimation BS_BATTLER_0, B_ANIM_SNOW_CONTINUES
	call BattleScript_ActivateWeatherAbilities
	end3

BattleScript_ActivateTerrainEffects:
	saveattacker
	savetarget
	tryboosterenergy ON_TERRAIN
    resetterrainabilityflags
	setbyte gBattlerAttacker, 0
BattleScript_ActivateTerrainSeed:
	copyarraywithindex gBattlerTarget, gBattlerByTurnOrder, gBattlerAttacker, 1
	tryterrainseed BS_TARGET, BattleScript_ActivateTerrainAbility
	removeitem BS_TARGET
BattleScript_ActivateTerrainAbility:
	activateterrainchangeabilities BS_TARGET
	addbyte gBattlerAttacker, 1
	jumpifbytenotequal gBattlerAttacker, gBattlersCount, BattleScript_ActivateTerrainSeed
	restoreattacker
	restoretarget
	return

BattleScript_ElectricSurgeActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_TERRAINBECOMESELECTRIC
	waitmessage B_WAIT_TIME_LONG
	playanimation BS_SCRIPTING, B_ANIM_RESTORE_BG
	call BattleScript_ActivateTerrainEffects
	end3

BattleScript_MistySurgeActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_TERRAINBECOMESMISTY
	waitmessage B_WAIT_TIME_LONG
	playanimation BS_SCRIPTING, B_ANIM_RESTORE_BG
	call BattleScript_ActivateTerrainEffects
	end3

BattleScript_GrassySurgeActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_TERRAINBECOMESGRASSY
	waitmessage B_WAIT_TIME_LONG
	playanimation BS_SCRIPTING, B_ANIM_RESTORE_BG
	call BattleScript_ActivateTerrainEffects
	end3

BattleScript_PsychicSurgeActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_TERRAINBECOMESPSYCHIC
	waitmessage B_WAIT_TIME_LONG
	playanimation BS_SCRIPTING, B_ANIM_RESTORE_BG
	call BattleScript_ActivateTerrainEffects
	end3

BattleScript_BadDreamsActivates::
	setbyte gBattlerTarget, 0
BattleScript_BadDreamsLoop:
	jumpiftargetally BattleScript_BadDreamsIncrement
	jumpifability BS_TARGET, ABILITY_MAGIC_GUARD, BattleScript_BadDreamsIncrement
	jumpifability BS_TARGET, ABILITY_COMATOSE, BattleScript_BadDreams_Dmg
	jumpifstatus BS_TARGET, STATUS1_SLEEP, BattleScript_BadDreams_Dmg
	goto BattleScript_BadDreamsIncrement
BattleScript_BadDreams_Dmg:
	jumpifbyteequal sFIXED_ABILITY_POPUP, sZero, BattleScript_BadDreams_ShowPopUp
BattleScript_BadDreams_DmgAfterPopUp:
	printstring STRINGID_BADDREAMSDMG
	waitmessage B_WAIT_TIME_LONG
	dmg_1_8_targethp
	healthbarupdate BS_TARGET, PASSIVE_HP_UPDATE
	datahpupdate BS_TARGET, PASSIVE_HP_UPDATE
	jumpifhasnohp BS_TARGET, BattleScript_BadDreams_HidePopUp
BattleScript_BadDreamsIncrement:
	addbyte gBattlerTarget, 1
	jumpifbytenotequal gBattlerTarget, gBattlersCount, BattleScript_BadDreamsLoop
	jumpifbyteequal sFIXED_ABILITY_POPUP, sZero, BattleScript_BadDreamsEnd
	destroyabilitypopup
	pause 15
BattleScript_BadDreamsEnd:
	end2
BattleScript_BadDreams_ShowPopUp:
	copybyte gBattlerAbility, gBattlerAttacker
	call BattleScript_AbilityPopUp
	setbyte sFIXED_ABILITY_POPUP, TRUE
	goto BattleScript_BadDreams_DmgAfterPopUp
BattleScript_BadDreams_HidePopUp:
	destroyabilitypopup
	tryfaintmon BS_TARGET
	goto BattleScript_BadDreamsIncrement

BattleScript_TookAttack::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNSXTOOKATTACK
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_SturdyPreventsOHKO::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNPROTECTEDBY
	pause B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_DampStopsExplosion::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUpScripting
	printstring STRINGID_PKMNPREVENTSUSAGE
	pause B_WAIT_TIME_LONG
	moveendto MOVEEND_NEXT_TARGET
	moveendcase MOVEEND_CLEAR_BITS
	end

BattleScript_MoveHPDrain::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	healthbarupdate BS_TARGET, PASSIVE_HP_UPDATE
	datahpupdate BS_TARGET, PASSIVE_HP_UPDATE
	printstring STRINGID_PKMNRESTOREDHPUSING
	waitmessage B_WAIT_TIME_LONG
	setmoveresultflags MOVE_RESULT_DOESNT_AFFECT_FOE
	goto BattleScript_MoveEnd

BattleScript_MoveStatDrain::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_MoveStatDrain_Cont
.if B_ABSORBING_ABILITY_STRING >= GEN_5
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
.else
	printstring STRINGID_TARGETABILITYSTATRAISE
	waitmessage B_WAIT_TIME_LONG
.endif
BattleScript_MoveStatDrain_Cont:
	clearsemiinvulnerablebit
	goto BattleScript_MoveEnd

BattleScript_MonMadeMoveUseless::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNSXMADEYUSELESS
	waitmessage B_WAIT_TIME_LONG
	setmoveresultflags MOVE_RESULT_DOESNT_AFFECT_FOE
	goto BattleScript_MoveEnd

BattleScript_FlashFireBoost::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printfromtable gFlashFireStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_AbilityPreventsPhasingOut::
	call BattleScript_AbilityPreventsPhasingOutRet
	goto BattleScript_MoveEnd

BattleScript_AbilityPreventsPhasingOutRet::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUpTarget
	printstring STRINGID_PKMNANCHORSITSELFWITH
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_AbilityNoStatLoss::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNPREVENTSSTATLOSSWITH
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_ItemNoStatLoss::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_CLEARAMULETWONTLOWERSTATS
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_ObliviousPreventsAttraction::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNPREVENTSROMANCEWITH
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_FlinchPrevention::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNSXPREVENTSFLINCHING
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_OwnTempoPrevents::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	copybyte sBATTLER, gBattlerTarget
	printstring STRINGID_PKMNPREVENTSCONFUSIONWITH
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_SoundproofProtected::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNSXBLOCKSY
	waitmessage B_WAIT_TIME_LONG
	setmoveresultflags MOVE_RESULT_DOESNT_AFFECT_FOE
	goto BattleScript_MoveEnd

BattleScript_IceFaceNullsDamage::
	call BattleScript_TargetFormChangeWithString
	return

BattleScript_DazzlingProtected::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUpScripting
	printstring STRINGID_POKEMONCANNOTUSEMOVE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_MoveUsedPsychicTerrainPrevents::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PSYCHICTERRAINPREVENTS
	waitmessage B_WAIT_TIME_LONG
	setmoveresultflags MOVE_RESULT_NO_EFFECT
	goto BattleScript_MoveEnd

BattleScript_GrassyTerrainHeals::
	printstring STRINGID_GRASSYTERRAINHEALS
	waitmessage B_WAIT_TIME_LONG
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	end2

BattleScript_AbilityNoSpecificStatLoss::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNSXPREVENTSYLOSS
	waitmessage B_WAIT_TIME_LONG
	setbyte cMULTISTRING_CHOOSER, B_MSG_STAT_CHANGE_EMPTY
	setmoveresultflags MOVE_RESULT_NO_EFFECT
	return

BattleScript_StickyHoldActivates::
	call BattleScript_StickyHoldActivatesRet
	goto BattleScript_MoveEnd

BattleScript_StickyHoldActivatesRet::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNSXMADEYINEFFECTIVE
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_ColorChangeActivates::
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNCHANGEDTYPEWITH
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_ProteanActivates::
	pause B_WAIT_TIME_SHORTEST
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNCHANGEDTYPE
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_AbilityAvoidsDamage::
	call BattleScript_AbilityPopUp
	printfromtable gMissStringIds @ waitmessage is executed next so no waitmessage here
	return

BattleScript_TeraShellDistortingTypeMatchups::
	pause B_WAIT_TIME_SHORTEST
	call BattleScript_AbilityPopUpScripting
	printstring STRINGID_PKMNMADESHELLGLEAM
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_CursedBodyActivates::
	call BattleScript_AbilityPopUp
	printstring STRINGID_CURSEDBODYDISABLED
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MummyActivates::
	setbyte sFIXED_ABILITY_POPUP, TRUE
	call BattleScript_AbilityPopUpTarget
	copybyte gBattlerAbility, gBattlerAttacker
	copyhword sABILITY_OVERWRITE, gLastUsedAbility
	call BattleScript_AbilityPopUpOverwriteThenNormal
	recordability BS_TARGET
	recordability BS_ATTACKER
	printstring STRINGID_ATTACKERACQUIREDABILITY
	waitmessage B_WAIT_TIME_LONG
	trytoclearprimalweather
	tryrevertweatherform
	flushtextbox
	tryendneutralizinggas
	return

BattleScript_WanderingSpiritActivates::
	saveattacker
	savetarget
	copybyte gBattlerAbility, gBattlerTarget
	sethword sABILITY_OVERWRITE, ABILITY_WANDERING_SPIRIT
	call BattleScript_AbilityPopUpOverwriteThenNormal
	copybyte gBattlerAbility, gBattlerAttacker
	copyhword sABILITY_OVERWRITE, gLastUsedAbility
	call BattleScript_AbilityPopUpOverwriteThenNormal
	recordability BS_TARGET
	recordability BS_ATTACKER
	printstring STRINGID_SWAPPEDABILITIES
	waitmessage B_WAIT_TIME_LONG
	switchinabilities BS_ATTACKER
	jumpiffainted BS_TARGET, TRUE, BattleScript_WanderingSpiritActivatesRet
	switchinabilities BS_TARGET
BattleScript_WanderingSpiritActivatesRet:
	restoreattacker
	restoretarget
	return

BattleScript_TargetsStatWasMaxedOut::
	call BattleScript_AbilityPopUp
	statbuffchange BS_TARGET, STAT_CHANGE_NOT_PROTECT_AFFECTED | STAT_CHANGE_CERTAIN, BattleScript_TargetsStatWasMaxedOutRet
	printstring STRINGID_TARGETSSTATWASMAXEDOUT
	waitmessage B_WAIT_TIME_LONG
BattleScript_TargetsStatWasMaxedOutRet:
	return

BattleScript_BattlerAbilityStatRaiseOnSwitchIn::
	call BattleScript_AbilityPopUpScripting
	statbuffchange BS_SCRIPTING, STAT_CHANGE_NOT_PROTECT_AFFECTED | STAT_CHANGE_CERTAIN, BattleScript_BattlerAbilityStatRaiseOnSwitchInRet
	waitanimation
	printstring STRINGID_SCRIPTINGABILITYSTATRAISE
	waitmessage B_WAIT_TIME_LONG
BattleScript_BattlerAbilityStatRaiseOnSwitchInRet:
	end3

BattleScript_ScriptingAbilityStatRaise::
	copybyte gBattlerAbility, sBATTLER
	call BattleScript_AbilityPopUp
	saveattacker
	copybyte gBattlerAttacker, sBATTLER
	statbuffchange BS_ATTACKER, STAT_CHANGE_NOT_PROTECT_AFFECTED | STAT_CHANGE_CERTAIN, BattleScript_ScriptingAbilityStatRaiseRet
	printstring STRINGID_ATTACKERABILITYSTATRAISE
	waitmessage B_WAIT_TIME_LONG
BattleScript_ScriptingAbilityStatRaiseRet:
	restoreattacker
	return

BattleScript_WeakArmorActivates::
	call BattleScript_AbilityPopUp
	setstatchanger STAT_DEF, 1, TRUE
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_WeakArmorActivatesSpeed
	jumpifbyte CMP_LESS_THAN, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_WeakArmorDefPrintString
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_CHANGE_EMPTY, BattleScript_WeakArmorActivatesSpeed
	pause B_WAIT_TIME_SHORTEST
	printfromtable gStatDownStringIds
	clearmoveresultflags MOVE_RESULT_MISSED @ Set by statbuffchange when stat can't be decreased
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_WeakArmorActivatesSpeed
BattleScript_WeakArmorDefPrintString:
	printstring STRINGID_TARGETABILITYSTATLOWER
	waitmessage B_WAIT_TIME_LONG
BattleScript_WeakArmorActivatesSpeed:
	jumpifgenconfiglowerthan GEN_CONFIG_WEAK_ARMOR_SPEED, GEN_7, BattleScript_WeakArmorSetSpeedGen6
	setstatchanger STAT_SPEED, 2, FALSE
	goto BattleScript_WeakArmorDoSpeed
BattleScript_WeakArmorSetSpeedGen6:
	setstatchanger STAT_SPEED, 1, FALSE
BattleScript_WeakArmorDoSpeed:
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_WeakArmorActivatesEnd
	jumpifbyte CMP_LESS_THAN, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_WeakArmorSpeedPrintString
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_CHANGE_EMPTY, BattleScript_WeakArmorActivatesEnd
	pause B_WAIT_TIME_SHORTEST
	printstring STRINGID_TARGETSTATWONTGOHIGHER
	clearmoveresultflags MOVE_RESULT_MISSED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_WeakArmorActivatesEnd
BattleScript_WeakArmorSpeedPrintString:
	printstring STRINGID_TARGETABILITYSTATRAISE
	waitmessage B_WAIT_TIME_LONG
BattleScript_WeakArmorActivatesEnd:
	return

BattleScript_RaiseStatOnFaintingTarget::
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_ONLY_CHECKING, BattleScript_RaiseStatOnFaintingTarget_End
	copybyte gBattlerAbility, gBattlerAttacker
	call BattleScript_AbilityPopUp
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_RaiseStatOnFaintingTarget_End
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_RaiseStatOnFaintingTarget_End:
	return

BattleScript_AttackerAbilityStatRaise::
	statbuffchange BS_SCRIPTING, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_ONLY_CHECKING, BattleScript_AttackerAbilityStatRaise_End
	call BattleScript_AbilityPopUpScripting
	statbuffchange BS_SCRIPTING, STAT_CHANGE_ALLOW_PTR, BattleScript_AttackerAbilityStatRaise_End
	printstring STRINGID_ATTACKERABILITYSTATRAISE
	waitmessage B_WAIT_TIME_LONG
BattleScript_AttackerAbilityStatRaise_End:
	return

BattleScript_FellStingerRaisesStat::
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_FellStingerRaisesAtkEnd
	jumpifbyte CMP_GREATER_THAN, cMULTISTRING_CHOOSER, B_MSG_DEFENDER_STAT_CHANGED, BattleScript_FellStingerRaisesAtkEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_FellStingerRaisesAtkEnd:
	return

BattleScript_AttackerAbilityStatRaiseEnd3::
	call BattleScript_AttackerAbilityStatRaise
	restoreattacker
	end3

BattleScript_AttackerAbilityStatRaiseEnd2::
	call BattleScript_AttackerAbilityStatRaise
	restoreattacker
	end2

BattleScript_SwitchInAbilityMsg::
	call BattleScript_AbilityPopUp
	printfromtable gSwitchInAbilityStringIds
	waitmessage B_WAIT_TIME_LONG
	end3

BattleScript_SwitchInAbilityMsgRet::
	call BattleScript_AbilityPopUp
	printfromtable gSwitchInAbilityStringIds
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_ActivateAsOne::
	call BattleScript_AbilityPopUp
	printfromtable gSwitchInAbilityStringIds
	waitmessage B_WAIT_TIME_LONG
	@ show unnerve
	sethword sABILITY_OVERWRITE, ABILITY_UNNERVE
	setbyte cMULTISTRING_CHOOSER, B_MSG_SWITCHIN_UNNERVE
	call BattleScript_AbilityPopUp
	printfromtable gSwitchInAbilityStringIds
	waitmessage B_WAIT_TIME_LONG
	end3

BattleScript_FriskMsgWithPopup::
	copybyte gBattlerAbility, gBattlerAttacker
	call BattleScript_AbilityPopUp
BattleScript_FriskMsg::
	printstring STRINGID_FRISKACTIVATES
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_FriskActivates::
	saveattacker
	savetarget
	copybyte gBattlerAttacker, sBATTLER
	tryfriskmessage
	restoreattacker
	restoretarget
	end3

BattleScript_ImposterActivates::
	call BattleScript_AbilityPopUp
	transformdataexecution
	playmoveanimation MOVE_TRANSFORM
	waitanimation
	printstring STRINGID_IMPOSTERTRANSFORM
	waitmessage B_WAIT_TIME_LONG
	restoreattacker
	restoretarget
	end3

BattleScript_HurtAttacker:
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	printstring STRINGID_PKMNHURTSWITH
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_ATTACKER
	return

BattleScript_RoughSkinActivates::
	call BattleScript_AbilityPopUp
	call BattleScript_HurtAttacker
	return

BattleScript_RockyHelmetActivates::
	@ don't play the animation for a fainted mon
	jumpifabsent BS_TARGET, BattleScript_RockyHelmetActivatesDmg
	playanimation BS_TARGET, B_ANIM_HELD_ITEM_EFFECT
	waitanimation
BattleScript_RockyHelmetActivatesDmg:
	call BattleScript_HurtAttacker
	return

BattleScript_SpikyShieldEffect::
	jumpifabsent BS_ATTACKER, BattleScript_SpikyShieldRet
	clearmoveresultflags MOVE_RESULT_NO_EFFECT
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	printstring STRINGID_PKMNHURTSWITH
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_ATTACKER
	setmoveresultflags MOVE_RESULT_MISSED
BattleScript_SpikyShieldRet::
	return

BattleScript_KingsShieldEffect::
	clearmoveresultflags MOVE_RESULT_NO_EFFECT
	seteffectsecondary BS_ATTACKER, BS_TARGET, MOVE_EFFECT_NONE
	copybyte sBATTLER, gBattlerTarget
	copybyte gBattlerTarget, gBattlerAttacker
	copybyte gBattlerAttacker, sBATTLER
	setmoveresultflags MOVE_RESULT_MISSED
	return

BattleScript_BanefulBunkerEffect::
	clearmoveresultflags MOVE_RESULT_NO_EFFECT
	setnonvolatilestatus TRIGGER_ON_PROTECT
	setmoveresultflags MOVE_RESULT_MISSED
	return

BattleScript_CuteCharmActivates::
	call BattleScript_AbilityPopUp
	volatileanimation BS_ATTACKER, VOLATILE_INFATUATION
	printstring STRINGID_PKMNSXINFATUATEDY
	waitmessage B_WAIT_TIME_LONG
	call BattleScript_TryDestinyKnotTarget
	return

BattleScript_GooeyActivates::
	statbuffchange BS_ATTACKER, STAT_CHANGE_ONLY_CHECKING, BattleScript_GooeyActivatesRet
	waitstate
	call BattleScript_AbilityPopUp
	swapattackerwithtarget  @ for defiant, mirror armor
	seteffectsecondary BS_ATTACKER, BS_TARGET, MOVE_EFFECT_SPD_MINUS_1
	swapattackerwithtarget
BattleScript_GooeyActivatesRet:
	return

BattleScript_AbilityStatusEffect::
	waitstate
	call BattleScript_AbilityPopUp
	setnonvolatilestatus TRIGGER_ON_ABILITY
	return

BattleScript_BattleBondActivatesOnMoveEndAttacker::
	pause 5
	copybyte gBattlerAbility, gBattlerAttacker
	call BattleScript_AbilityPopUp
	printstring STRINGID_ATTACKERBECAMEFULLYCHARGED
	handleformchange BS_ATTACKER, 0
	handleformchange BS_ATTACKER, 1
	playanimation BS_ATTACKER, B_ANIM_FORM_CHANGE
	waitanimation
	handleformchange BS_ATTACKER, 2
	printstring STRINGID_ATTACKERBECAMEASHSPECIES
	return

BattleScript_EffectBattleBondStatIncrease::
	call BattleScript_AbilityPopUp
	setstatchanger STAT_ATK, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectBattleBondStatIncreaseTrySpAtk, BIT_SPATK | BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_EffectBattleBondStatIncreaseTrySpAtk
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectBattleBondStatIncreaseTrySpAtk:
	setstatchanger STAT_SPATK, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectBattleBondStatIncreaseTrySpeed, BIT_SPEED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_EffectBattleBondStatIncreaseTrySpeed
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectBattleBondStatIncreaseTrySpeed:
	setstatchanger STAT_SPEED, 1, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_EffectBattleBondStatIncreaseRet
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_EffectBattleBondStatIncreaseRet
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_EffectBattleBondStatIncreaseRet:
	return

BattleScript_DancerActivates::
	call BattleScript_AbilityPopUp
	waitmessage B_WAIT_TIME_SHORT
	jumptocalledmove TRUE

BattleScript_SynchronizeActivates::
	waitstate
	call BattleScript_AbilityPopUp
	setnonvolatilestatus TRIGGER_ON_ABILITY
	return

BattleScript_NoItemSteal::
	call BattleScript_AbilityPopUpTarget
	printstring STRINGID_PKMNSXMADEYINEFFECTIVE
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_AbilityCuredStatus::
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNSXCUREDITSYPROBLEM
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_SCRIPTING
	return

BattleScript_AbilityCuredStatusEnd3::
    call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNSXCUREDITSYPROBLEM
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_SCRIPTING
	end3

BattleScript_BattlerShookOffTaunt::
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNSHOOKOFFTHETAUNT
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_BattlerGotOverItsInfatuation::
	call BattleScript_AbilityPopUp
	printstring STRINGID_PKMNGOTOVERITSINFATUATION
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_IgnoresWhileAsleep::
	printstring STRINGID_PKMNIGNORESASLEEP
	waitmessage B_WAIT_TIME_LONG
	moveendto MOVEEND_NEXT_TARGET
	end

BattleScript_IgnoresAndUsesRandomMove::
	printstring STRINGID_PKMNIGNOREDORDERS
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_MoveUsedLoafingAround::
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_LOAFING, BattleScript_MoveUsedLoafingAroundMsg
	@ Skip ahead if not the Battle Palace message
	jumpifbyte CMP_NOT_EQUAL, cMULTISTRING_CHOOSER, B_MSG_INCAPABLE_OF_POWER, BattleScript_MoveUsedLoafingAroundMsg
	setbyte gBattleCommunication, 0
	palacetryescapestatus
	setbyte cMULTISTRING_CHOOSER, B_MSG_INCAPABLE_OF_POWER
BattleScript_MoveUsedLoafingAroundMsg::
	printfromtable gInobedientStringIds
	waitmessage B_WAIT_TIME_LONG
	moveendto MOVEEND_NEXT_TARGET
	end
BattleScript_TruantLoafingAround::
	flushtextbox
	call BattleScript_AbilityPopUp
	goto BattleScript_MoveUsedLoafingAroundMsg

BattleScript_IgnoresAndFallsAsleep::
	printstring STRINGID_PKMNBEGANTONAP
	waitmessage B_WAIT_TIME_LONG
	seteffectprimary BS_ATTACKER, BS_ATTACKER, MOVE_EFFECT_SLEEP
	moveendto MOVEEND_NEXT_TARGET
	end

BattleScript_IgnoresAndHitsItself::
	printstring STRINGID_PKMNWONTOBEY
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_DoSelfConfusionDmg

BattleScript_SubstituteFade::
	playanimation BS_TARGET, B_ANIM_SUBSTITUTE_FADE
	printstring STRINGID_PKMNSUBSTITUTEFADED
	return

BattleScript_BerryCureStatusEnd2::
	call BattleScript_BerryCureStatusRet
	end2

BattleScript_BerryCureStatusRet::
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT
	printfromtable CureStatusBerryEffectStringID
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_SCRIPTING
	removeitem BS_SCRIPTING
	return

BattleScript_GemActivates::
	playanimation BS_ATTACKER, B_ANIM_HELD_ITEM_EFFECT
	waitanimation
	setlastuseditem BS_ATTACKER
	printstring STRINGID_GEMACTIVATES
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_ATTACKER
	return

BattleScript_BerryReduceDmg::
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT
	waitanimation
	setlastuseditem BS_SCRIPTING
	printstring STRINGID_BERRYDMGREDUCES
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_SCRIPTING
	return

BattleScript_BerryCureConfusionEnd2::
	call BattleScript_BerryCureConfusionRet
	end2

BattleScript_BerryCureConfusionRet::
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT
	printstring STRINGID_PKMNSITEMSNAPPEDOUT
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_SCRIPTING
	return

BattleScript_MentalHerbCureRet::
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT
	printfromtable gMentalHerbCureStringIds
	waitmessage B_WAIT_TIME_LONG
	updatestatusicon BS_SCRIPTING
	removeitem BS_SCRIPTING
	return

BattleScript_MentalHerbCureEnd2::
	call BattleScript_MentalHerbCureRet
	end2

BattleScript_WhiteHerbEnd2::
	call BattleScript_WhiteHerbRet
	end2

BattleScript_WhiteHerbRet::
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT
	printstring STRINGID_PKMNSITEMRESTOREDSTATUS
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_SCRIPTING
	return

BattleScript_ItemHealHP_RemoveItemRet::
	jumpifability BS_SCRIPTING, ABILITY_RIPEN, BattleScript_ItemHealHP_RemoveItemRet_AbilityPopUp
	goto BattleScript_ItemHealHP_RemoveItemRet_Anim
BattleScript_ItemHealHP_RemoveItemRet_AbilityPopUp:
	call BattleScript_AbilityPopUpScripting
BattleScript_ItemHealHP_RemoveItemRet_Anim:
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT
	printstring STRINGID_PKMNSITEMRESTOREDHEALTH
	waitmessage B_WAIT_TIME_LONG
	healthbarupdate BS_SCRIPTING, PASSIVE_HP_UPDATE
	datahpupdate BS_SCRIPTING, PASSIVE_HP_UPDATE
	removeitem BS_SCRIPTING
	return

BattleScript_ItemHealHP_RemoveItemEnd2::
	jumpifability BS_ATTACKER, ABILITY_RIPEN, BattleScript_ItemHealHP_RemoveItemEnd2_AbilityPopUp
	goto BattleScript_ItemHealHP_RemoveItemEnd2_Anim
BattleScript_ItemHealHP_RemoveItemEnd2_AbilityPopUp:
	call BattleScript_AbilityPopUpScripting
BattleScript_ItemHealHP_RemoveItemEnd2_Anim:
	playanimation BS_ATTACKER, B_ANIM_HELD_ITEM_EFFECT
	printstring STRINGID_PKMNSITEMRESTOREDHEALTH
	waitmessage B_WAIT_TIME_LONG
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	removeitem BS_ATTACKER
	end2

BattleScript_BerryPPHealRet::
	jumpifability BS_SCRIPTING, ABILITY_RIPEN, BattleScript_BerryPPHeal_AbilityPopup
	goto BattleScript_BerryPPHeal_Anim
BattleScript_BerryPPHeal_AbilityPopup:
	call BattleScript_AbilityPopUpScripting
BattleScript_BerryPPHeal_Anim:
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT
	printstring STRINGID_PKMNSITEMRESTOREDPP
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_SCRIPTING
	return

BattleScript_BerryPPHealEnd2::
	call BattleScript_BerryPPHealRet
	end2

BattleScript_ItemHealHP_End2::
	call BattleScript_ItemHealHP_Ret
	end2

BattleScript_AirBalloonMsgIn::
	printstring STRINGID_AIRBALLOONFLOAT
	waitmessage B_WAIT_TIME_LONG
	end3

BattleScript_AirBalloonMsgInRet::
	printstring STRINGID_AIRBALLOONFLOAT
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_AirBalloonMsgPop::
	printstring STRINGID_AIRBALLOONPOP
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_TARGET
	return

BattleScript_ItemHurtRet::
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	printstring STRINGID_HURTBYITEM
	waitmessage B_WAIT_TIME_LONG
	tryfaintmon BS_ATTACKER
	return

BattleScript_ItemHurtEnd2::
	playanimation BS_ATTACKER, B_ANIM_MON_HIT
	waitanimation
	call BattleScript_ItemHurtRet
	end2

BattleScript_ItemHealHP_Ret::
	playanimation BS_ATTACKER, B_ANIM_HELD_ITEM_EFFECT
	printstring STRINGID_PKMNSITEMRESTOREDHPALITTLE
	waitmessage B_WAIT_TIME_LONG
	healthbarupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	datahpupdate BS_ATTACKER, PASSIVE_HP_UPDATE
	return

BattleScript_SelectingNotAllowedMoveChoiceItem::
	printselectionstring STRINGID_ITEMALLOWSONLYYMOVE
	endselectionscript

BattleScript_SelectingNotAllowedMoveChoiceItemInPalace::
	printstring STRINGID_ITEMALLOWSONLYYMOVE
	goto BattleScript_SelectingUnusableMoveInPalace

BattleScript_SelectingNotAllowedMoveGorillaTactics::
	printselectionstring STRINGID_ABILITYALLOWSONLYMOVE
	endselectionscript

BattleScript_SelectingNotAllowedMoveGorillaTacticsInPalace::
	printstring STRINGID_ABILITYALLOWSONLYMOVE
	goto BattleScript_SelectingUnusableMoveInPalace

BattleScript_SelectingNotAllowedMoveAssaultVest::
	printselectionstring STRINGID_ASSAULTVESTDOESNTALLOW
	endselectionscript

BattleScript_SelectingNotAllowedMoveAssaultVestInPalace::
	printstring STRINGID_ASSAULTVESTDOESNTALLOW
	goto BattleScript_SelectingUnusableMoveInPalace

BattleScript_SelectingNotAllowedPlaceholder::
	printselectionstring STRINGID_NOTDONEYET
	endselectionscript

BattleScript_SelectingNotAllowedPlaceholderInPalace::
	printstring STRINGID_NOTDONEYET
	goto BattleScript_SelectingUnusableMoveInPalace

BattleScript_HangedOnMsg::
	playanimation BS_TARGET, B_ANIM_HANGED_ON
	printstring STRINGID_PKMNHUNGONWITHX
	waitmessage B_WAIT_TIME_LONG
	jumpifnoholdeffect BS_TARGET, HOLD_EFFECT_FOCUS_SASH, BattleScript_HangedOnMsgRet
	removeitem BS_TARGET
BattleScript_HangedOnMsgRet:
	return

BattleScript_BerryConfuseHealEnd2::
	jumpifability BS_SCRIPTING, ABILITY_RIPEN, BattleScript_BerryConfuseHealEnd2_AbilityPopup
	goto BattleScript_BerryConfuseHealEnd2_Anim
BattleScript_BerryConfuseHealEnd2_AbilityPopup:
	call BattleScript_AbilityPopUp
BattleScript_BerryConfuseHealEnd2_Anim:
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT
	printstring STRINGID_PKMNSITEMRESTOREDHEALTH
	waitmessage B_WAIT_TIME_LONG
	healthbarupdate BS_SCRIPTING, PASSIVE_HP_UPDATE
	datahpupdate BS_SCRIPTING, PASSIVE_HP_UPDATE
	seteffectprimary BS_SCRIPTING, BS_SCRIPTING, MOVE_EFFECT_CONFUSION
	removeitem BS_SCRIPTING
	end2

BattleScript_BerryConfuseHealRet::
	jumpifability BS_SCRIPTING, ABILITY_RIPEN, BattleScript_BerryConfuseHealRet_AbilityPopup
	goto BattleScript_BerryConfuseHealRet_Anim
BattleScript_BerryConfuseHealRet_AbilityPopup:
	call BattleScript_AbilityPopUp
BattleScript_BerryConfuseHealRet_Anim:
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT
	printstring STRINGID_PKMNSITEMRESTOREDHEALTH
	waitmessage B_WAIT_TIME_LONG
	healthbarupdate BS_SCRIPTING, PASSIVE_HP_UPDATE
	datahpupdate BS_SCRIPTING, PASSIVE_HP_UPDATE
	seteffectprimary BS_SCRIPTING, BS_SCRIPTING, MOVE_EFFECT_CONFUSION
	removeitem BS_SCRIPTING
	return

BattleScript_ConsumableStatRaiseEnd2::
	call BattleScript_ConsumableStatRaiseRet
	end2

BattleScript_ConsumableStatRaiseRet::
	jumpifnotberry BS_SCRIPTING, BattleScript_ConsumableStatRaiseRet_Anim
	jumpifability BS_SCRIPTING, ABILITY_RIPEN, BattleScript_ConsumableStatRaiseRet_AbilityPopup
	goto BattleScript_ConsumableStatRaiseRet_Anim
BattleScript_ConsumableStatRaiseRet_AbilityPopup:
	call BattleScript_AbilityPopUp
BattleScript_ConsumableStatRaiseRet_Anim:
	statbuffchange BS_SCRIPTING, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_ONLY_CHECKING, BattleScript_ConsumableStatRaiseRet_End
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT, sB_ANIM_ARG1
	statbuffchange BS_SCRIPTING, STAT_CHANGE_ALLOW_PTR, BattleScript_ConsumableStatRaiseRet_End
	setbyte cMULTISTRING_CHOOSER, B_MSG_STAT_CHANGED_ITEM
	savetarget
	copybyte gBattlerTarget, sBATTLER @ BattleScript_StatUp uses target as a message arg
	call BattleScript_StatUp
	restoretarget
	removeitem BS_SCRIPTING
BattleScript_ConsumableStatRaiseRet_End:
	return

BattleScript_BerryFocusEnergyRet::
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT
	printstring STRINGID_PKMNUSEDXTOGETPUMPED
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_SCRIPTING
	return

BattleScript_BerryFocusEnergyEnd2::
	call BattleScript_BerryFocusEnergyRet
	end2

BattleScript_ActionSelectionItemsCantBeUsed::
	printselectionstring STRINGID_ITEMSCANTBEUSEDNOW
	endselectionscript

BattleScript_FlushMessageBox::
	flushtextbox
	return

@BattleScript_PalacePrintFlavorText::
@	setbyte gBattleCommunication + 1, 0
@BattleScript_PalaceTryBattlerFlavorText::
@	palaceflavortext
@	jumpifbyte CMP_NOT_EQUAL, gBattleCommunication, TRUE, BattleScript_PalaceEndFlavorText
@	printfromtable gBattlePalaceFlavorTextTable
@	waitmessage B_WAIT_TIME_LONG
@BattleScript_PalaceEndFlavorText::
@	addbyte gBattleCommunication + 1, 1
@	jumpifbytenotequal gBattleCommunication + 1, gBattlersCount, BattleScript_PalaceTryBattlerFlavorText
@	setbyte gBattleCommunication, 0
@	setbyte gBattleCommunication + 1, 0
@	end2
@
@BattleScript_ArenaTurnBeginning::
@	waitcry
@	volumedown
@	playse SE_ARENA_TIMEUP1
@	pause 8
@	playse SE_ARENA_TIMEUP1
@	drawarenareftextbox
@	arenajudgmentstring B_MSG_REF_COMMENCE_BATTLE
@	arenawaitmessage B_MSG_REF_COMMENCE_BATTLE
@	pause B_WAIT_TIME_LONG
@	erasearenareftextbox
@	volumeup
@	end2
@
@BattleScript_ArenaDoJudgment::
@	makevisible BS_PLAYER1
@	waitstate
@	makevisible BS_OPPONENT1
@	waitstate
@	volumedown
@	playse SE_ARENA_TIMEUP1
@	pause 8
@	playse SE_ARENA_TIMEUP1
@	pause B_WAIT_TIME_LONG
@	drawarenareftextbox
@	arenajudgmentstring B_MSG_REF_THATS_IT
@	arenawaitmessage B_MSG_REF_THATS_IT
@	pause B_WAIT_TIME_LONG
@	setbyte gBattleCommunication, 0  @ Reset state for arenajudgmentwindow
@	arenajudgmentwindow
@	pause B_WAIT_TIME_LONG
@	arenajudgmentwindow
@	arenajudgmentstring B_MSG_REF_JUDGE_MIND
@	arenawaitmessage B_MSG_REF_JUDGE_MIND
@	arenajudgmentwindow
@	arenajudgmentstring B_MSG_REF_JUDGE_SKILL
@	arenawaitmessage B_MSG_REF_JUDGE_SKILL
@	arenajudgmentwindow
@	arenajudgmentstring B_MSG_REF_JUDGE_BODY
@	arenawaitmessage B_MSG_REF_JUDGE_BODY
@	arenajudgmentwindow
@	jumpifbyte CMP_EQUAL, gBattleCommunication + 1, ARENA_RESULT_PLAYER_LOST, BattleScript_ArenaJudgmentPlayerLoses
@	jumpifbyte CMP_EQUAL, gBattleCommunication + 1, ARENA_RESULT_TIE, BattleScript_ArenaJudgmentDraw
@@ ARENA_RESULT_PLAYER_WON
@	arenajudgmentstring B_MSG_REF_PLAYER_WON
@	arenawaitmessage B_MSG_REF_PLAYER_WON
@	arenajudgmentwindow
@	erasearenareftextbox
@	printstring STRINGID_DEFEATEDOPPONENTBYREFEREE
@	waitmessage B_WAIT_TIME_LONG
@	playfaintcry BS_OPPONENT1
@	waitcry
@	dofaintanimation BS_OPPONENT1
@	cleareffectsonfaint BS_OPPONENT1
@	waitanimation
@	arenaopponentmonlost
@	end2
@
@BattleScript_ArenaJudgmentPlayerLoses:
@	arenajudgmentstring B_MSG_REF_OPPONENT_WON
@	arenawaitmessage B_MSG_REF_OPPONENT_WON
@	arenajudgmentwindow
@	erasearenareftextbox
@	printstring STRINGID_LOSTTOOPPONENTBYREFEREE
@	waitmessage B_WAIT_TIME_LONG
@	playfaintcry BS_PLAYER1
@	waitcry
@	dofaintanimation BS_PLAYER1
@	cleareffectsonfaint BS_PLAYER1
@	waitanimation
@	arenaplayermonlost
@	end2
@
@BattleScript_ArenaJudgmentDraw:
@	arenajudgmentstring B_MSG_REF_DRAW
@	arenawaitmessage B_MSG_REF_DRAW
@	arenajudgmentwindow
@	erasearenareftextbox
@	printstring STRINGID_TIEDOPPONENTBYREFEREE
@	waitmessage B_WAIT_TIME_LONG
@	playfaintcry BS_PLAYER1
@	waitcry
@	dofaintanimation BS_PLAYER1
@	cleareffectsonfaint BS_PLAYER1
@	waitanimation
@	playfaintcry BS_OPPONENT1
@	waitcry
@	dofaintanimation BS_OPPONENT1
@	cleareffectsonfaint BS_OPPONENT1
@	waitanimation
@	arenabothmonslost
@	end2

BattleScript_AskIfWantsToForfeitMatch::
	printselectionstring STRINGID_QUESTIONFORFEITMATCH
	forfeityesnobox
	endselectionscript

BattleScript_PrintPlayerForfeited::
	printstring STRINGID_FORFEITEDMATCH
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_PrintPlayerForfeitedLinkBattle::
	printstring STRINGID_FORFEITEDMATCH
	waitmessage B_WAIT_TIME_LONG
	endlinkbattle
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_TotemFlaredToLife::
	playanimation BS_ATTACKER, B_ANIM_TOTEM_FLARE, NULL
	printstring STRINGID_AURAFLAREDTOLIFE
	waitmessage B_WAIT_TIME_LONG
	call BattleScript_ApplyTotemVarBoost
	end2

BattleScript_MirrorHerbCopyStatChangeEnd2::
	call BattleScript_MirrorHerbCopyStatChange
	end2

BattleScript_MirrorHerbCopyStatChange::
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT, NULL
	printstring STRINGID_MIRRORHERBCOPIED
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_SCRIPTING
BattleScript_MirrorHerbStartCopyStats:
	copyfoesstatincrease BS_SCRIPTING, BattleScript_MirrorHerbStartReturn
	statbuffchange BS_SCRIPTING, STAT_CHANGE_ALLOW_PTR, BattleScript_MirrorHerbStartReturn
	setbyte sSTAT_ANIM_PLAYED, TRUE @ play stat change animation only once
	goto BattleScript_MirrorHerbStartCopyStats
BattleScript_MirrorHerbStartReturn:
	setbyte sSTAT_ANIM_PLAYED, FALSE
	return

BattleScript_OpportunistCopyStatChange::
	call BattleScript_AbilityPopUpScripting
BattleScript_OpportunistStartCopyStats:
	copyfoesstatincrease BS_SCRIPTING, BattleScript_OpportunistCopyStatChangeEnd
	statbuffchange BS_SCRIPTING, STAT_CHANGE_ALLOW_PTR, BattleScript_OpportunistCopyStatChangeEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
	setbyte sSTAT_ANIM_PLAYED, TRUE @ play stat change animation only once
	goto BattleScript_OpportunistStartCopyStats
BattleScript_OpportunistCopyStatChangeEnd:
	setbyte sSTAT_ANIM_PLAYED, FALSE
	return

BattleScript_OpportunistCopyStatChangeEnd3::
	call BattleScript_OpportunistCopyStatChange
	end3

BattleScript_TotemVar::
	call BattleScript_TotemVar_Ret
	end2

BattleScript_TotemVar_Ret::
	gettotemboost BattleScript_ApplyTotemVarBoost
BattleScript_TotemVarEnd:
	return
BattleScript_ApplyTotemVarBoost:
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_TotemVarEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_TotemVar_Ret  @loop until stats bitfield is empty


BattleScript_AnnounceAirLockCloudNine::
	call BattleScript_AbilityPopUp
	printstring STRINGID_AIRLOCKACTIVATES
	waitmessage B_WAIT_TIME_LONG
	call BattleScript_ActivateWeatherAbilities
	end3

BattleScript_ActivateTeraformZero::
	call BattleScript_AbilityPopUp
	waitmessage B_WAIT_TIME_LONG
	jumpifhalfword CMP_COMMON_BITS, gBattleWeather, B_WEATHER_ANY, BattleScript_ActivateTeraformZero_RemoveWeather
	jumpifhalfword CMP_COMMON_BITS, gFieldStatuses, STATUS_FIELD_TERRAIN_ANY, BattleScript_ActivateTeraformZero_RemoveTerrain
	goto BattleScript_ActivateTeraformZero_End
BattleScript_ActivateTeraformZero_RemoveWeather:
	removeweather
	printfromtable gWeatherEndsStringIds
	waitmessage B_WAIT_TIME_LONG
	call BattleScript_ActivateWeatherAbilities
	jumpifhalfword CMP_NO_COMMON_BITS, gFieldStatuses, STATUS_FIELD_TERRAIN_ANY, BattleScript_ActivateTeraformZeroEffects
BattleScript_ActivateTeraformZero_RemoveTerrain:
	removeterrain
	playanimation BS_ATTACKER, B_ANIM_RESTORE_BG
	printfromtable gTerrainStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_ActivateTeraformZeroEffects:
	saveattacker
	savetarget
	tryboosterenergy ON_ANY
	resetterrainabilityflags
	setbyte gBattlerAttacker, 0
BattleScript_ActivateTeraformZeroLoop:
	copyarraywithindex gBattlerTarget, gBattlerByTurnOrder, gBattlerAttacker, 1
	activateterrainchangeabilities BS_TARGET
	activateweatherchangeabilities BS_TARGET
	addbyte gBattlerAttacker, 1
	jumpifbytenotequal gBattlerAttacker, gBattlersCount, BattleScript_ActivateTeraformZeroLoop
	restoreattacker
	restoretarget
BattleScript_ActivateTeraformZero_End:
	end3

BattleScript_QuickClawActivation::
	flushtextbox
	playanimation BS_ATTACKER, B_ANIM_HELD_ITEM_EFFECT
	waitanimation
	printstring STRINGID_CANACTFASTERTHANKSTO
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_QuickDrawActivation::
	flushtextbox
	call BattleScript_AbilityPopUp
	printstring STRINGID_CANACTFASTERTHANKSTO
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_CustapBerryActivation::
	flushtextbox
	playanimation BS_ATTACKER, B_ANIM_HELD_ITEM_EFFECT
	waitanimation
	printstring STRINGID_CANACTFASTERTHANKSTO
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_ATTACKER
	end2

BattleScript_MicleBerryActivateEnd2::
	jumpifability BS_ATTACKER, ABILITY_RIPEN, BattleScript_MicleBerryActivateEnd2_Ripen
	goto BattleScript_MicleBerryActivateEnd2_Anim
BattleScript_MicleBerryActivateEnd2_Ripen:
	call BattleScript_AbilityPopUp
BattleScript_MicleBerryActivateEnd2_Anim:
	playanimation BS_ATTACKER, B_ANIM_HELD_ITEM_EFFECT
	printstring STRINGID_MICLEBERRYACTIVATES
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_ATTACKER
	end2

BattleScript_MicleBerryActivateRet::
	jumpifability BS_SCRIPTING, ABILITY_RIPEN, BattleScript_MicleBerryActivateRet_Ripen
	goto BattleScript_MicleBerryActivateRet_Anim
BattleScript_MicleBerryActivateRet_Ripen:
	call BattleScript_AbilityPopUpScripting
BattleScript_MicleBerryActivateRet_Anim:
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT
	printstring STRINGID_MICLEBERRYACTIVATES
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_SCRIPTING
	return

BattleScript_JabocaRowapBerryActivates::
	jumpifability BS_TARGET, ABILITY_RIPEN, BattleScript_JabocaRowapBerryActivate_Ripen
	goto BattleScript_JabocaRowapBerryActivate_Anim
BattleScript_JabocaRowapBerryActivate_Ripen:
	call BattleScript_AbilityPopUp
BattleScript_JabocaRowapBerryActivate_Anim:
	jumpifabsent BS_TARGET, BattleScript_JabocaRowapBerryActivate_Dmg   @ dont play the animation for a fainted target
	playanimation BS_TARGET, B_ANIM_HELD_ITEM_EFFECT
	waitanimation
BattleScript_JabocaRowapBerryActivate_Dmg:
	call BattleScript_HurtAttacker
	removeitem BS_TARGET
	return

@ z moves / effects
BattleScript_ZMoveActivateDamaging::
	flushtextbox
	trytrainerslidezmovemsg
	printstring STRINGID_ZPOWERSURROUNDS
	playanimation BS_ATTACKER, B_ANIM_ZMOVE_ACTIVATE, NULL
	printstring STRINGID_ZMOVEUNLEASHED
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_ZMoveActivateStatus::
	flushtextbox
	trytrainerslidezmovemsg
	savetarget
	printstring STRINGID_ZPOWERSURROUNDS
	playanimation BS_ATTACKER, B_ANIM_ZMOVE_ACTIVATE, NULL
	setzeffect
	restoretarget
	copybyte sSTATCHANGER, sSAVED_STAT_CHANGER
	return

BattleScript_ZEffectPrintString::
	printfromtable gZEffectStringIds
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_RecoverHPZMove::
	healthbarupdate BS_SCRIPTING, PASSIVE_HP_UPDATE
	datahpupdate BS_SCRIPTING, PASSIVE_HP_UPDATE
	printfromtable gZEffectStringIds
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_StatUpZMove::
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_StatUpZMoveEnd
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_StatUpZMoveEnd
	printstring STRINGID_ZMOVESTATUP
	waitmessage B_WAIT_TIME_LONG
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_StatUpZMoveEnd:
	return

BattleScript_HealReplacementZMove::
	playanimation BS_SCRIPTING, B_ANIM_WISH_HEAL, 0x0
	printfromtable gZEffectStringIds
	waitmessage B_WAIT_TIME_LONG
	healthbarupdate BS_SCRIPTING, PASSIVE_HP_UPDATE
	datahpupdate BS_SCRIPTING, PASSIVE_HP_UPDATE
	return

BattleScript_EffectExtremeEvoboost::
	attackcanceler
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_ATK, MAX_STAT_STAGE, BattleScript_ExtremeEvoboostAnim
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_DEF, MAX_STAT_STAGE, BattleScript_ExtremeEvoboostAnim
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPEED, MAX_STAT_STAGE, BattleScript_ExtremeEvoboostAnim
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPATK, MAX_STAT_STAGE, BattleScript_ExtremeEvoboostAnim
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPDEF, MAX_STAT_STAGE, BattleScript_ExtremeEvoboostAnim
	goto BattleScript_ButItFailed
BattleScript_ExtremeEvoboostAnim:
	attackanimation
	waitanimation
	setstatchanger STAT_ATK, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_ExtremeEvoboostDef, BIT_DEF | BIT_SPEED | BIT_SPATK | BIT_SPDEF
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_ExtremeEvoboostDef::
	setstatchanger STAT_DEF, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_ExtremeEvoboostSpeed, BIT_SPEED | BIT_SPATK | BIT_SPDEF
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_ExtremeEvoboostSpeed::
	setstatchanger STAT_SPEED, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_ExtremeEvoboostSpAtk, BIT_SPATK | BIT_SPDEF
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_ExtremeEvoboostSpAtk::
	setstatchanger STAT_SPATK, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_ExtremeEvoboostSpDef, BIT_SPDEF
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_ExtremeEvoboostSpDef::
	setstatchanger STAT_SPDEF, 2, FALSE
	statbuffchange BS_ATTACKER, STAT_CHANGE_ALLOW_PTR, BattleScript_ExtremeEvoboostEnd
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_ExtremeEvoboostEnd::
	goto BattleScript_MoveEnd

BattleScript_RemoveTerrain::
	removeterrain
	playanimation BS_ATTACKER, B_ANIM_RESTORE_BG
	printfromtable gTerrainStringIds
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_Pickpocket::
	call BattleScript_AbilityPopUp
	jumpifability BS_ATTACKER, ABILITY_STICKY_HOLD, BattleScript_PickpocketPrevented
	swapattackerwithtarget
	copybyte gEffectBattler, gBattlerTarget
	call BattleScript_ItemSteal
	swapattackerwithtarget
	activateitemeffects
	return

BattleScript_PickpocketPrevented:
	pause B_WAIT_TIME_SHORT
	copybyte gBattlerAbility, gBattlerAttacker
	call BattleScript_AbilityPopUp
	printstring STRINGID_ITEMCANNOTBEREMOVED
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_StickyBarbTransfer::
	playanimation BS_TARGET, B_ANIM_ITEM_STEAL
	printstring STRINGID_STICKYBARBTRANSFER
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_TARGET
	return

BattleScript_RedCardActivationNoSwitch::
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT
	printstring STRINGID_REDCARDACTIVATE
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_SCRIPTING
	restoretarget
	restoreattacker
	return

BattleScript_RedCardActivates::
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT
	printstring STRINGID_REDCARDACTIVATE
	waitmessage B_WAIT_TIME_LONG
	swapattackerwithtarget
	jumpifvolatile BS_EFFECT_BATTLER, VOLATILE_ROOT, BattleScript_RedCardIngrain
	jumpifability BS_EFFECT_BATTLER, ABILITY_SUCTION_CUPS, BattleScript_RedCardSuctionCups
	jumpiftargetdynamaxed BattleScript_RedCardDynamaxed
	removeitem BS_SCRIPTING
	setbyte sSWITCH_CASE, B_SWITCH_RED_CARD
	forcerandomswitch BattleScript_RedCardEnd
	@ changes the current battle script. the rest happens in BattleScript_RoarSuccessSwitch_Ret, if switch is successful
BattleScript_RedCardEnd:
	return
BattleScript_RedCardIngrain:
	printstring STRINGID_PKMNANCHOREDITSELF
BattleScript_RedCardIngrainContinue:
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_SCRIPTING
	restoretarget
	restoreattacker
	return
BattleScript_RedCardSuctionCups:
    printstring STRINGID_PKMNANCHORSITSELFWITH
    goto BattleScript_RedCardIngrainContinue
BattleScript_RedCardDynamaxed:
	printstring STRINGID_MOVEBLOCKEDBYDYNAMAX
    goto BattleScript_RedCardIngrainContinue

BattleScript_EjectButtonActivates::
	makevisible BS_ATTACKER
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT
	printstring STRINGID_EJECTBUTTONACTIVATE
	waitmessage B_WAIT_TIME_LONG
	removeitem BS_SCRIPTING
	undodynamax BS_SCRIPTING
	makeinvisible BS_SCRIPTING
	openpartyscreen BS_SCRIPTING, BattleScript_EjectButtonEnd
	copybyte sSAVED_BATTLER, sBATTLER
	switchoutabilities BS_SCRIPTING
	copybyte sBATTLER, sSAVED_BATTLER
	waitstate
	switchhandleorder BS_SCRIPTING, 0x2
	returntoball BS_SCRIPTING, FALSE
	getswitchedmondata BS_SCRIPTING
	switchindataupdate BS_SCRIPTING
	hpthresholds BS_SCRIPTING
	trytoclearprimalweather
	flushtextbox
	printstring 0x3
	switchinanim BS_SCRIPTING, FALSE, TRUE
	waitstate
	switchineffects BS_SCRIPTING
BattleScript_EjectButtonEnd:
	return

BattleScript_EjectPackActivate_Ret::
	goto BattleScript_EjectButtonActivates

BattleScript_EjectPackActivate_End2::
	call BattleScript_EjectPackActivate_Ret
	end2

BattleScript_EjectPackActivate_End3::
	call BattleScript_EjectPackActivate_Ret
	end3

BattleScript_EjectPackActivates::
	jumpifcantswitch BS_SCRIPTING, BattleScript_EjectButtonEnd
	goto BattleScript_EjectPackActivate_Ret

BattleScript_DoesntAffectTargetAtkString::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_ITDOESNTAFFECT
	waitmessage B_WAIT_TIME_LONG
	setmoveresultflags MOVE_RESULT_NO_EFFECT
	goto BattleScript_MoveEnd

BattleScript_WellBakedBodyActivates::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUpTarget
	setmoveresultflags MOVE_RESULT_NO_EFFECT
	modifybattlerstatstage BS_TARGET, STAT_DEF, INCREASE, 1, BattleScript_WellBakedBodyEnd, ANIM_ON
BattleScript_WellBakedBodyEnd:
	goto BattleScript_MoveEnd

BattleScript_WindRiderActivatesMoveEnd::
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUpTarget
	setmoveresultflags MOVE_RESULT_NO_EFFECT
	modifybattlerstatstage BS_TARGET, STAT_ATK, INCREASE, 1, BattleScript_WindRiderActivatesMoveEnd_End, ANIM_ON
BattleScript_WindRiderActivatesMoveEnd_End:
	goto BattleScript_MoveEnd

BattleScript_GoodAsGoldActivates::
	call BattleScript_AbilityPopUpTarget
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_ITDOESNTAFFECT
	waitmessage B_WAIT_TIME_MED
	goto BattleScript_MoveEnd

BattleScript_PastelVeilActivates::
	setbyte gBattleCommunication, 0
	setbyte gBattleCommunication + 1, 0
BattleScript_PastelVeil_TryCurePoison:
	jumpifstatus BS_TARGET, STATUS1_POISON | STATUS1_TOXIC_POISON, BattleScript_PastelVeilCurePoison
	goto BattleScript_PastelVeilLoopIncrement
BattleScript_PastelVeilCurePoison:
	jumpifbyte CMP_NOT_EQUAL, gBattleCommunication + 1, 0x0, BattleScript_PastelVeilCurePoisonNoPopUp
	call BattleScript_AbilityPopUp
	setbyte gBattleCommunication + 1, 1
BattleScript_PastelVeilCurePoisonNoPopUp: @ Only show Pastel Veil pop up once if it cures two mons
	printfromtable gSwitchInAbilityStringIds
	waitmessage B_WAIT_TIME_LONG
	curestatus BS_TARGET
	updatestatusicon BS_TARGET
BattleScript_PastelVeilLoopIncrement:
	jumpifbyte CMP_NOT_EQUAL, gBattleCommunication, 0x0, BattleScript_PastelVeilEnd
	addbyte gBattleCommunication, 1
	jumpifnoally BS_TARGET, BattleScript_PastelVeilEnd
	setallytonexttarget BattleScript_PastelVeil_TryCurePoison
	goto BattleScript_PastelVeilEnd
BattleScript_PastelVeilEnd:
	restoretarget
	end3

BattleScript_NeutralizingGasExits::
	saveattacker
	savetarget
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_NEUTRALIZINGGASOVER
	waitmessage B_WAIT_TIME_LONG
	setbyte gBattlerAttacker, 0
BattleScript_NeutralizingGasExitsLoop:
	copyarraywithindex gBattlerTarget, gBattlerByTurnOrder, gBattlerAttacker, 1
	jumpifabilitycantbesuppressed BS_TARGET, BattleScript_NeutralizingGasExitsLoopIncrement
	jumpifability BS_TARGET, ABILITY_IMPOSTER, BattleScript_NeutralizingGasExitsLoopIncrement @ Imposter only activates when first entering the field
	saveattacker
	switchinabilities BS_TARGET
	restoreattacker
BattleScript_NeutralizingGasExitsLoopIncrement:
	addbyte gBattlerAttacker, 1
	jumpifbytenotequal gBattlerAttacker, gBattlersCount, BattleScript_NeutralizingGasExitsLoop
	restoreattacker
	restoretarget
	return

BattleScript_MagicianActivates::
	call BattleScript_AbilityPopUp
	call BattleScript_ItemSteal
	return

BattleScript_SymbiosisActivates::
	call BattleScript_AbilityPopUp
	printstring STRINGID_SYMBIOSISITEMPASS
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_TargetAbilityStatRaiseRet::
	saveattacker
	copybyte gBattlerAttacker, gEffectBattler
	call BattleScript_AbilityPopUp
	statbuffchange BS_ATTACKER, STAT_CHANGE_CERTAIN, BattleScript_TargetAbilityStatRaiseRet_End
	call BattleScript_StatUp
BattleScript_TargetAbilityStatRaiseRet_End:
	restoreattacker
	return

@@@ MAX MOVES @@@
BattleScript_EffectMaxMove::
	attackcanceler
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	goto BattleScript_HitFromAtkString

BattleScript_EffectRaiseStatAllies::
	savetarget
	copybyte gBattlerTarget, gBattlerAttacker
BattleScript_RaiseSideStatsLoop:
	jumpifabsent BS_TARGET, BattleScript_RaiseSideStatsIncrement
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_RaiseSideStatsIncrement
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_RaiseSideStatsIncrement
	printfromtable gStatUpStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_RaiseSideStatsIncrement:
	jumpifbytenotequal gBattlerTarget, gBattlerAttacker, BattleScript_RaiseSideStatsEnd
	setallytonexttarget BattleScript_RaiseSideStatsLoop
BattleScript_RaiseSideStatsEnd:
	restoretarget
	return

BattleScript_EffectLowerStatFoes::
	savetarget
	copybyte sBATTLER, gBattlerTarget
BattleScript_LowerSideStatsLoop:
	jumpifabsent BS_TARGET, BattleScript_LowerSideStatsIncrement
	statbuffchange BS_TARGET, STAT_CHANGE_ALLOW_PTR, BattleScript_LowerSideStatsIncrement
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, B_MSG_STAT_WONT_CHANGE, BattleScript_LowerSideStatsIncrement
	printfromtable gStatDownStringIds
	waitmessage B_WAIT_TIME_LONG
BattleScript_LowerSideStatsIncrement:
	jumpifbytenotequal gBattlerTarget, sBATTLER, BattleScript_LowerSideStatsEnd
	setallytonexttarget BattleScript_LowerSideStatsLoop
BattleScript_LowerSideStatsEnd:
	restoretarget
	return

BattleScript_EffectSetWeather::
	playanimation 0, B_ANIM_MAX_SET_WEATHER
	printfromtable gMoveWeatherChangeStringIds
	waitmessage B_WAIT_TIME_LONG
	call BattleScript_ActivateWeatherAbilities
	return

BattleScript_EffectSetTerrain::
	printfromtable gTerrainStringIds
	waitmessage B_WAIT_TIME_LONG
	playanimation BS_ATTACKER, B_ANIM_RESTORE_BG
	call BattleScript_ActivateTerrainEffects
	return

BattleScript_DamageNonTypesStarts::
	printfromtable gDamageNonTypesStartStringIds
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_DamageNonTypesContinues::
	printfromtable gDamageNonTypesDmgStringIds
	waitmessage B_WAIT_TIME_LONG
	effectivenesssound
	hitanimation BS_ATTACKER
	goto BattleScript_DoTurnDmg

BattleScript_EffectTryReducePP::
	tryspiteppreduce BattleScript_MoveEnd
	printstring STRINGID_PKMNREDUCEDPP
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_EffectParalyzeSide::
	savetarget
	copybyte sBATTLER, gBattlerTarget
BattleScript_ParalyzeSideLoop:
	jumpifabsent BS_TARGET, BattleScript_ParalyzeSideIncrement
	trysetparalysis BattleScript_ParalyzeSideIncrement
BattleScript_ParalyzeSideIncrement:
	jumpifbytenotequal gBattlerTarget, sBATTLER, BattleScript_ParalyzeSideEnd
	setallytonexttarget BattleScript_ParalyzeSideLoop
BattleScript_ParalyzeSideEnd:
	restoretarget
	return

BattleScript_EffectPoisonSide::
	savetarget
	copybyte sBATTLER, gBattlerTarget
BattleScript_PoisonSideLoop:
	jumpifabsent BS_TARGET, BattleScript_PoisonSideIncrement
	trysetpoison BattleScript_PoisonSideIncrement
BattleScript_PoisonSideIncrement:
	jumpifbytenotequal gBattlerTarget, sBATTLER, BattleScript_PoisonSideEnd
	setallytonexttarget BattleScript_PoisonSideLoop
BattleScript_PoisonSideEnd:
	restoretarget
	return

BattleScript_EffectPoisonParalyzeSide::
	savetarget
	copybyte sBATTLER, gBattlerTarget
BattleScript_PoisonParalyzeSideLoop:
	jumpifabsent BS_TARGET, BattleScript_PoisonParalyzeSideIncrement
	trysetpoisonparalysis BattleScript_PoisonParalyzeSideIncrement
BattleScript_PoisonParalyzeSideIncrement:
	jumpifbytenotequal gBattlerTarget, sBATTLER, BattleScript_PoisonParalyzeSideEnd
	setallytonexttarget BattleScript_PoisonParalyzeSideLoop
BattleScript_PoisonParalyzeSideEnd:
	restoretarget
	return

BattleScript_EffectEffectSporeSide::
	savetarget
	copybyte sBATTLER, gBattlerTarget
BattleScript_EffectSporeSideLoop:
	jumpifabsent BS_TARGET, BattleScript_EffectSporeSideIncrement
	tryseteffectspore BattleScript_EffectSporeSideIncrement
BattleScript_EffectSporeSideIncrement:
	jumpifbytenotequal gBattlerTarget, sBATTLER, BattleScript_EffectSporeSideEnd
	setallytonexttarget BattleScript_EffectSporeSideLoop
BattleScript_EffectSporeSideEnd:
	restoretarget
	return

BattleScript_EffectConfuseSide::
	savetarget
	copybyte sBATTLER, gBattlerTarget
BattleScript_ConfuseSideLoop:
	jumpifabsent BS_TARGET, BattleScript_ConfuseSideIncrement
	trysetconfusion BattleScript_ConfuseSideIncrement
	volatileanimation BS_EFFECT_BATTLER, VOLATILE_CONFUSION
BattleScript_ConfuseSidePrintMessage:
	printstring STRINGID_PKMNWASCONFUSED
	waitmessage B_WAIT_TIME_LONG
BattleScript_ConfuseSideIncrement:
	jumpifbytenotequal gBattlerTarget, sBATTLER, BattleScript_ConfuseSideEnd
	setallytonexttarget BattleScript_ConfuseSideLoop
BattleScript_ConfuseSideEnd:
	restoretarget
	jumpifbyte CMP_EQUAL, gBattleCommunication + 1, 1, BattleScript_PrintCoinsScattered @ Gold Rush
	return

BattleScript_PrintCoinsScattered:
	printstring STRINGID_COINSSCATTERED
	return

BattleScript_EffectInfatuateSide::
	savetarget
	copybyte sBATTLER, gBattlerTarget
BattleScript_InfatuateSideLoop:
	jumpifabsent BS_TARGET, BattleScript_InfatuateSideIncrement
	trysetinfatuation BattleScript_InfatuateSideIncrement
	volatileanimation BS_EFFECT_BATTLER, VOLATILE_INFATUATION
BattleScript_InfatuateSidePrintMessage:
	printstring STRINGID_PKMNFELLINLOVE
	waitmessage B_WAIT_TIME_LONG
BattleScript_InfatuateSideIncrement:
	jumpifbytenotequal gBattlerTarget, sBATTLER, BattleScript_InfatuateSideEnd
	setallytonexttarget BattleScript_InfatuateSideLoop
BattleScript_InfatuateSideEnd:
	restoretarget
	return

BattleScript_EffectTormentSide::
	savetarget
	copybyte sBATTLER, gBattlerTarget
BattleScript_TormentSideLoop:
	jumpifabsent BS_TARGET, BattleScript_TormentSideIncrement
	trysettorment BattleScript_TormentSideIncrement
BattleScript_TormentSidePrintMessage:
	printstring STRINGID_PKMNSUBJECTEDTOTORMENT
	waitmessage B_WAIT_TIME_LONG
BattleScript_TormentSideIncrement:
	jumpifbytenotequal gBattlerTarget, sBATTLER, BattleScript_TormentSideEnd
	setallytonexttarget BattleScript_TormentSideLoop
BattleScript_TormentSideEnd:
	restoretarget
	return

BattleScript_TormentEnds::
	printstring STRINGID_TORMENTEDNOMORE
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_EffectMeanLookSide::
	savetarget
	copybyte sBATTLER, gBattlerTarget
BattleScript_MeanLookSideLoop:
	jumpifabsent BS_TARGET, BattleScript_MeanLookSideIncrement
	trysetescapeprevention BattleScript_MeanLookSideIncrement
BattleScript_MeanLookSidePrintMessage:
	printstring STRINGID_TARGETCANTESCAPENOW
	waitmessage B_WAIT_TIME_LONG
BattleScript_MeanLookSideIncrement:
	jumpifbytenotequal gBattlerTarget, sBATTLER, BattleScript_MeanLookSideEnd
	setallytonexttarget BattleScript_MeanLookSideLoop
BattleScript_MeanLookSideEnd:
	restoretarget
	return

BattleScript_EffectRaiseCritAlliesAnim::
	savetarget
	copybyte gBattlerTarget, gBattlerAttacker
BattleScript_RaiseCritAlliesLoop:
	jumpifabsent BS_TARGET, BattleScript_RaiseCritAlliesIncrement
	setstatchanger STAT_ATK, 0, FALSE @ for animation
	statbuffchange BS_TARGET, 0, BattleScript_RaiseCritAlliesIncrement @ for animation
	printstring STRINGID_PKMNGETTINGPUMPED
	waitmessage B_WAIT_TIME_LONG
BattleScript_RaiseCritAlliesIncrement:
	jumpifbytenotequal gBattlerTarget, gBattlerAttacker, BattleScript_RaiseCritAlliesEnd
	setallytonexttarget BattleScript_RaiseCritAlliesLoop
BattleScript_RaiseCritAlliesEnd:
	restoretarget
	return

BattleScript_EffectHealOneSixthAllies::
	jumpifteamhealthy BattleScript_MoveEnd
	savetarget
	copybyte gBattlerTarget, gBattlerAttacker
BattleScript_HealOneSixthAlliesLoop:
	jumpifabsent BS_TARGET, BattleScript_HealOneSixthAlliesIncrement
	tryhealsixthhealth BattleScript_HealOneSixthAlliesIncrement
	healthbarupdate BS_TARGET, PASSIVE_HP_UPDATE
	datahpupdate BS_TARGET, PASSIVE_HP_UPDATE
	printstring STRINGID_PKMNREGAINEDHEALTH
	waitmessage B_WAIT_TIME_LONG
BattleScript_HealOneSixthAlliesIncrement:
	jumpifbytenotequal gBattlerTarget, gBattlerAttacker, BattleScript_HealOneSixthAlliesEnd
	setallytonexttarget BattleScript_HealOneSixthAlliesLoop
BattleScript_HealOneSixthAlliesEnd:
	restoretarget
	return

BattleScript_EffectRecycleBerriesAllies::
	savetarget
	copybyte gBattlerTarget, gBattlerAttacker
BattleScript_RecycleBerriesAlliesLoop:
	jumpifabsent BS_TARGET, BattleScript_RecycleBerriesAlliesIncrement
	tryrecycleberry BattleScript_RecycleBerriesAlliesIncrement
	swapattackerwithtarget
	printstring STRINGID_XFOUNDONEY
	waitmessage B_WAIT_TIME_LONG
	swapattackerwithtarget
BattleScript_RecycleBerriesAlliesIncrement:
	jumpifbytenotequal gBattlerTarget, gBattlerAttacker, BattleScript_RecycleBerriesAlliesEnd
	setallytonexttarget BattleScript_RecycleBerriesAlliesLoop
BattleScript_RecycleBerriesAlliesEnd:
	restoretarget
	return

BattleScript_EffectSteelsurge::
	setsteelsurge BattleScript_MoveEnd
	printfromtable gDmgHazardsStringIds
	waitmessage B_WAIT_TIME_LONG
	return

@@@ END MAX MOVES @@@

BattleScript_DynamaxBegins::
	flushtextbox
	trytrainerslidedynamaxmsg
	jumpifcangigantamax BS_ATTACKER, BattleScript_DynamaxBegins_GigantamaxString_01
	printstring STRINGID_TIMETODYNAMAX
	waitmessage B_WAIT_TIME_MED
	goto BattleScript_DynamaxBegins_SwitchIn
BattleScript_DynamaxBegins_GigantamaxString_01:
	printstring STRINGID_TIMETOGIGANTAMAX
	waitmessage B_WAIT_TIME_MED
BattleScript_DynamaxBegins_SwitchIn:
	returnatktoball
	pause B_WAIT_TIME_SHORT
	returntoball BS_SCRIPTING, TRUE
	switchinanim BS_SCRIPTING, TRUE, TRUE
	updatedynamax
	playanimation BS_SCRIPTING, B_ANIM_DYNAMAX_GROWTH
	waitanimation
	jumpifbyteequal B_SHOW_DYNAMAX_MESSAGE, FALSE, BattleScript_DynamaxBegins_End3
	jumpifcangigantamax BS_ATTACKER, BattleScript_DynamaxBegins_GigantamaxString_02
	printstring STRINGID_PKMNDYNAMAXED
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_DynamaxBegins_End3
BattleScript_DynamaxBegins_GigantamaxString_02:
	printstring STRINGID_PKMNGIGANTAMAXED
	waitmessage B_WAIT_TIME_LONG
BattleScript_DynamaxBegins_End3:
	end3

BattleScript_DynamaxEnds::
	flushtextbox
	updatedynamax
	playanimation BS_SCRIPTING, B_ANIM_FORM_CHANGE
	waitanimation
	end2

BattleScript_DynamaxEnds_Ret::
	flushtextbox
	setspriteignore0hp TRUE
	updatedynamax
	playanimation BS_SCRIPTING, B_ANIM_FORM_CHANGE
	waitanimation
	setspriteignore0hp FALSE
	pause B_WAIT_TIME_SHORT
	return

BattleScript_MoveBlockedByDynamax::
	accuracycheck BattleScript_MoveMissedPause, ACC_CURR_MOVE
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_MOVEBLOCKEDBYDYNAMAX
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_PokemonCantUseTheMove::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_BUTPOKEMONCANTUSETHEMOVE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_CouldntFullyProtect::
	printstring STRINGID_COULDNTFULLYPROTECT
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_BerserkGeneRet::
	statbuffchange BS_SCRIPTING, STAT_CHANGE_ALLOW_PTR | STAT_CHANGE_ONLY_CHECKING, BattleScript_BerserkGeneRet_TryConfuse
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT, sB_ANIM_ARG1
	statbuffchange BS_SCRIPTING, STAT_CHANGE_ALLOW_PTR, BattleScript_BerserkGeneRet_TryConfuse
	setbyte cMULTISTRING_CHOOSER, B_MSG_STAT_CHANGED_ITEM
	call BattleScript_StatUp
BattleScript_BerserkGeneRet_TryConfuse:
	jumpifability BS_SCRIPTING, ABILITY_OWN_TEMPO, BattleScript_BerserkGeneRet_OwnTempoPrevents
	jumpifsafeguard BattleScript_BerserkGeneRet_SafeguardProtected
	seteffectprimary BS_SCRIPTING, BS_SCRIPTING, MOVE_EFFECT_CONFUSION
	goto BattleScript_BerserkGeneRet_End
BattleScript_BerserkGeneRet_SafeguardProtected::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_PKMNUSEDSAFEGUARD
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_BerserkGeneRet_End
BattleScript_BerserkGeneRet_OwnTempoPrevents:
	pause B_WAIT_TIME_SHORT
	call BattleScript_AbilityPopUpScripting
	printstring STRINGID_PKMNPREVENTSCONFUSIONWITH
	waitmessage B_WAIT_TIME_LONG
BattleScript_BerserkGeneRet_End:
	removeitem BS_SCRIPTING
	return

BattleScript_BerserkGeneRetEnd2::
	call BattleScript_BerserkGeneRet
	end2

BattleScript_BoosterEnergyEnd2::
	call BattleScript_BoosterEnergyRet
	end2

BattleScript_BoosterEnergyRet::
	playanimation BS_SCRIPTING, B_ANIM_HELD_ITEM_EFFECT, sB_ANIM_ARG1
	call BattleScript_AbilityPopUpScripting
	printstring STRINGID_BOOSTERENERGYACTIVATES
	waitmessage B_WAIT_TIME_MED
	printstring STRINGID_STATWASHEIGHTENED
	waitmessage B_WAIT_TIME_MED
	removeitem BS_SCRIPTING
	return

BattleScript_EffectSnow::
	attackcanceler
	call BattleScript_CheckPrimalWeather
	setfieldweather BATTLE_WEATHER_SNOW
	goto BattleScript_MoveWeatherChange

BattleScript_SleepClauseBlocked::
	pause B_WAIT_TIME_SHORT
	setmoveresultflags MOVE_RESULT_FAILED
	printstring STRINGID_BLOCKEDBYSLEEPCLAUSE
	waitmessage B_WAIT_TIME_LONG
	goto BattleScript_MoveEnd

BattleScript_SleepClausePreventsEnd2::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_BLOCKEDBYSLEEPCLAUSE
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_QuestionForfeitBattle::
	printselectionstring STRINGID_QUESTIONFORFEITBATTLE
	forfeityesnobox
	endselectionscript

BattleScript_ForfeitBattleGaveMoney::
	getmoneyreward
.if B_WHITEOUT_MONEY >= GEN_4
	printstring STRINGID_PLAYERWHITEOUT2_TRAINER
.else
	printstring STRINGID_PLAYERWHITEOUT3
.endif
	waitmessage B_WAIT_TIME_LONG
	end2

BattleScript_Attackstring::
	printattackstring
	return

BattleScript_SubmoveAttackstring::
	printattackstring
	pause B_WAIT_TIME_LONG
	attackanimation
	waitanimation
	setcalledmove
	return

BattleScript_SleepTalkAttackstring::
	printattackstring
	pause B_WAIT_TIME_LONG
	printstring STRINGID_PKMNFASTASLEEP
	waitmessage B_WAIT_TIME_LONG
	statusanimation BS_ATTACKER
	attackanimation
	waitanimation
	setcalledmove
	return

BattleScript_MetronomeAttackstring::
	printattackstring
	pause B_WAIT_TIME_LONG
	attackanimation
	waitanimation
	setcalledmove
	printstring STRINGID_WAGGLINGAFINGER
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_NaturePowerAttackstring::
	printattackstring
	pause B_WAIT_TIME_SHORT
	setcalledmove
	printstring STRINGID_NATUREPOWERTURNEDINTO
	waitmessage B_WAIT_TIME_LONG
	return

BattleScript_TooScaredToMove::
	printstring STRINGID_MONTOOSCAREDTOMOVE
	waitmessage B_WAIT_TIME_LONG
	playanimation BS_ATTACKER, B_ANIM_MON_SCARED
	goto BattleScript_MoveEnd

BattleScript_GhostGetOutGetOut::
	printstring STRINGID_GHOSTGETOUTGETOUT
	playanimation BS_ATTACKER, B_ANIM_GHOST_GET_OUT
	goto BattleScript_MoveEnd

BattleScript_SilphScopeUnveiled::
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_SILPHSCOPEUNVEILED
	waitstate
	playanimation BS_OPPONENT1, B_ANIM_SILPH_SCOPED
	pause B_WAIT_TIME_SHORT
	printstring STRINGID_GHOSTWASMAROWAK
	waitmessage B_WAIT_TIME_LONG
	end2
