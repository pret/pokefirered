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
#include "battle_string_ids.h"
	.include "asm/macros/battle_script.inc"
	.set NULL, 0
	.section script_data, "aw", %progbits
	.align 2

gBattleScriptsForMoveEffects:: @ 81D65A8
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectSleep
	.4byte BattleScript_EffectPoisonHit
	.4byte BattleScript_EffectAbsorb
	.4byte BattleScript_EffectBurnHit
	.4byte BattleScript_EffectFreezeHit
	.4byte BattleScript_EffectParalyzeHit
	.4byte BattleScript_EffectExplosion
	.4byte BattleScript_EffectDreamEater
	.4byte BattleScript_EffectMirrorMove
	.4byte BattleScript_EffectAttackUp
	.4byte BattleScript_EffectDefenseUp
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectSpecialAttackUp
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectEvasionUp
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectAttackDown
	.4byte BattleScript_EffectDefenseDown
	.4byte BattleScript_EffectSpeedDown
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectAccuracyDown
	.4byte BattleScript_EffectEvasionDown
	.4byte BattleScript_EffectHaze
	.4byte BattleScript_EffectBide
	.4byte BattleScript_EffectRampage
	.4byte BattleScript_EffectRoar
	.4byte BattleScript_EffectMultiHit
	.4byte BattleScript_EffectConversion
	.4byte BattleScript_EffectFlinchHit
	.4byte BattleScript_EffectRestoreHp
	.4byte BattleScript_EffectToxic
	.4byte BattleScript_EffectPayDay
	.4byte BattleScript_EffectLightScreen
	.4byte BattleScript_EffectTriAttack
	.4byte BattleScript_EffectRest
	.4byte BattleScript_EffectOhko
	.4byte BattleScript_EffectRazorWind
	.4byte BattleScript_EffectSuperFang
	.4byte BattleScript_EffectDragonRage
	.4byte BattleScript_EffectTrap
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectDoubleHit
	.4byte BattleScript_EffectRecoilIfMiss
	.4byte BattleScript_EffectMist
	.4byte BattleScript_EffectFocusEnergy
	.4byte BattleScript_EffectRecoil
	.4byte BattleScript_EffectConfuse
	.4byte BattleScript_EffectAttackUp2
	.4byte BattleScript_EffectDefenseUp2
	.4byte BattleScript_EffectSpeedUp2
	.4byte BattleScript_EffectSpecialAttackUp2
	.4byte BattleScript_EffectSpecialDefenseUp2
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectTransform
	.4byte BattleScript_EffectAttackDown2
	.4byte BattleScript_EffectDefenseDown2
	.4byte BattleScript_EffectSpeedDown2
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectSpecialDefenseDown2
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectReflect
	.4byte BattleScript_EffectPoison
	.4byte BattleScript_EffectParalyze
	.4byte BattleScript_EffectAttackDownHit
	.4byte BattleScript_EffectDefenseDownHit
	.4byte BattleScript_EffectSpeedDownHit
	.4byte BattleScript_EffectSpecialAttackDownHit
	.4byte BattleScript_EffectSpecialDefenseDownHit
	.4byte BattleScript_EffectAccuracyDownHit
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectSkyAttack
	.4byte BattleScript_EffectConfuseHit
	.4byte BattleScript_EffectTwineedle
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectSubstitute
	.4byte BattleScript_EffectRecharge
	.4byte BattleScript_EffectRage
	.4byte BattleScript_EffectMimic
	.4byte BattleScript_EffectMetronome
	.4byte BattleScript_EffectLeechSeed
	.4byte BattleScript_EffectSplash
	.4byte BattleScript_EffectDisable
	.4byte BattleScript_EffectLevelDamage
	.4byte BattleScript_EffectPsywave
	.4byte BattleScript_EffectCounter
	.4byte BattleScript_EffectEncore
	.4byte BattleScript_EffectPainSplit
	.4byte BattleScript_EffectSnore
	.4byte BattleScript_EffectConversion2
	.4byte BattleScript_EffectLockOn
	.4byte BattleScript_EffectSketch
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectSleepTalk
	.4byte BattleScript_EffectDestinyBond
	.4byte BattleScript_EffectFlail
	.4byte BattleScript_EffectSpite
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectHealBell
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectTripleKick
	.4byte BattleScript_EffectThief
	.4byte BattleScript_EffectMeanLook
	.4byte BattleScript_EffectNightmare
	.4byte BattleScript_EffectMinimize
	.4byte BattleScript_EffectCurse
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectProtect
	.4byte BattleScript_EffectSpikes
	.4byte BattleScript_EffectForesight
	.4byte BattleScript_EffectPerishSong
	.4byte BattleScript_EffectSandstorm
	.4byte BattleScript_EffectProtect
	.4byte BattleScript_EffectRollout
	.4byte BattleScript_EffectSwagger
	.4byte BattleScript_EffectFuryCutter
	.4byte BattleScript_EffectAttract
	.4byte BattleScript_EffectReturn
	.4byte BattleScript_EffectPresent
	.4byte BattleScript_EffectReturn
	.4byte BattleScript_EffectSafeguard
	.4byte BattleScript_EffectThawHit
	.4byte BattleScript_EffectMagnitude
	.4byte BattleScript_EffectBatonPass
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectRapidSpin
	.4byte BattleScript_EffectSonicboom
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectMorningSun
	.4byte BattleScript_EffectMorningSun
	.4byte BattleScript_EffectMorningSun
	.4byte BattleScript_EffectHiddenPower
	.4byte BattleScript_EffectRainDance
	.4byte BattleScript_EffectSunnyDay
	.4byte BattleScript_EffectDefenseUpHit
	.4byte BattleScript_EffectAttackUpHit
	.4byte BattleScript_EffectAllStatsUpHit
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectBellyDrum
	.4byte BattleScript_EffectPsychUp
	.4byte BattleScript_EffectMirrorCoat
	.4byte BattleScript_EffectSkullBash
	.4byte BattleScript_EffectTwister
	.4byte BattleScript_EffectEarthquake
	.4byte BattleScript_EffectFutureSight
	.4byte BattleScript_EffectGust
	.4byte BattleScript_EffectFlinchMinimizeHit
	.4byte BattleScript_EffectSolarbeam
	.4byte BattleScript_EffectThunder
	.4byte BattleScript_EffectTeleport
	.4byte BattleScript_EffectBeatUp
	.4byte BattleScript_EffectSemiInvulnerable
	.4byte BattleScript_EffectDefenseCurl
	.4byte BattleScript_EffectSoftboiled
	.4byte BattleScript_EffectFakeOut
	.4byte BattleScript_EffectUproar
	.4byte BattleScript_EffectStockpile
	.4byte BattleScript_EffectSpitUp
	.4byte BattleScript_EffectSwallow
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectHail
	.4byte BattleScript_EffectTorment
	.4byte BattleScript_EffectFlatter
	.4byte BattleScript_EffectWillOWisp
	.4byte BattleScript_EffectMemento
	.4byte BattleScript_EffectFacade
	.4byte BattleScript_EffectFocusPunch
	.4byte BattleScript_EffectSmellingsalt
	.4byte BattleScript_EffectFollowMe
	.4byte BattleScript_EffectNaturePower
	.4byte BattleScript_EffectCharge
	.4byte BattleScript_EffectTaunt
	.4byte BattleScript_EffectHelpingHand
	.4byte BattleScript_EffectTrick
	.4byte BattleScript_EffectRolePlay
	.4byte BattleScript_EffectWish
	.4byte BattleScript_EffectAssist
	.4byte BattleScript_EffectIngrain
	.4byte BattleScript_EffectSuperpower
	.4byte BattleScript_EffectMagicCoat
	.4byte BattleScript_EffectRecycle
	.4byte BattleScript_EffectRevenge
	.4byte BattleScript_EffectBrickBreak
	.4byte BattleScript_EffectYawn
	.4byte BattleScript_EffectKnockOff
	.4byte BattleScript_EffectEndeavor
	.4byte BattleScript_EffectEruption
	.4byte BattleScript_EffectSkillSwap
	.4byte BattleScript_EffectImprison
	.4byte BattleScript_EffectRefresh
	.4byte BattleScript_EffectGrudge
	.4byte BattleScript_EffectSnatch
	.4byte BattleScript_EffectLowKick
	.4byte BattleScript_EffectSecretPower
	.4byte BattleScript_EffectDoubleEdge
	.4byte BattleScript_EffectTeeterDance
	.4byte BattleScript_EffectBurnHit
	.4byte BattleScript_EffectMudSport
	.4byte BattleScript_EffectPoisonFang
	.4byte BattleScript_EffectWeatherBall
	.4byte BattleScript_EffectOverheat
	.4byte BattleScript_EffectTickle
	.4byte BattleScript_EffectCosmicPower
	.4byte BattleScript_EffectSkyUppercut
	.4byte BattleScript_EffectBulkUp
	.4byte BattleScript_EffectPoisonHit
	.4byte BattleScript_EffectMudSport
	.4byte BattleScript_EffectCalmMind
	.4byte BattleScript_EffectDragonDance
	.4byte BattleScript_EffectCamouflage

BattleScript_EffectHit:: @ 81D6900
	jumpifhalfword CMP_NOT_EQUAL, gCurrentMove, 0x39, BattleScript_81D6926
	jumpifspecialstatusflag BS_TARGET, 0x40000, 0x1, BattleScript_81D6926
	orword gHitMarker, HITMARKER_IGNORE_UNDERWATER
	setbyte sDMG_MULTIPLIER, 0x2

BattleScript_81D6926:: @ 81D6926
	attackcanceler

BattleScript_81D6927:: @ 81D6927
	accuracycheck BattleScript_81D695E, 0x0

BattleScript_81D692E:: @ 81D692E
	attackstring
	ppreduce

BattleScript_HitFromCritCalc:: @ 81D6930
	critcalc
	atk5
	atk6
	atk7

BattleScript_81D6934:: @ 81D6934
	attackanimation
	waitanimation
	missmessage
	atk5c BS_TARGET
	waitstateatk
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	critmessage
	waitmessage 0x40
	resultmessage
	waitmessage 0x40
	seteffectwithchancetarget
	faintpokemon BS_TARGET, 0x0, NULL

BattleScript_MoveEnd:: @ 81D694E
	setbyte sMOVEEND_STATE, 0x0
	atk49 0x0, 0x0
	end

BattleScript_81D6958:: @ 81D6958
	orbyte gMoveResultFlags, 0x1

BattleScript_81D695E:: @ 81D695E
	attackstring
	ppreduce

BattleScript_MoveMissedPause:: @ 81D6960
	pause 0x20

BattleScript_81D6963:: @ 81D6963
	missmessage
	resultmessage
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectSleep:: @ 81D696D
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_ButItFailed
	jumpifstatus BS_TARGET, 0x7, BattleScript_81D69B0
	jumpifcannotsleep BattleScript_81D69CC
	jumpifstatus BS_TARGET, 0xFF, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, 0x0
	jumpifhalverset BS_TARGET, 0x20, BattleScript_81D8B39
	attackanimation
	waitanimation
	setbyte cEFFECT_CHOOSER, 0x1
	seteffecttarget
	jump BattleScript_MoveEnd

BattleScript_81D69B0:: @ 81D69B0
	pause 0x20
	printstring STRINGID_PKMNALREADYASLEEP
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_81D69BE:: @ 81D69BE
	pause 0x20
	printstring STRINGID_PKMNWASNTAFFECTED
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_81D69CC:: @ 81D69CC
	pause 0x20
	printfromtable gUproarAwakeStringIds
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectPoisonHit:: @ 81D69DC
	setbyte cEFFECT_CHOOSER, 0x2
	jump BattleScript_EffectHit

BattleScript_EffectAbsorb:: @ 81D69E7
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	critcalc
	atk5
	atk6
	atk7
	attackanimation
	waitanimation
	missmessage
	atk5c BS_TARGET
	waitstateatk
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	critmessage
	waitmessage 0x40
	resultmessage
	waitmessage 0x40
	negativedamage
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	jumpifability BS_TARGET, ABILITY_LIQUID_OOZE, BattleScript_81D6A23
	setbyte cMULTISTRING_CHOOSER, 0x0
	jump BattleScript_81D6A2B

BattleScript_81D6A23:: @ 81D6A23
	manipulatedamage 0x0
	setbyte cMULTISTRING_CHOOSER, 0x1

BattleScript_81D6A2B:: @ 81D6A2B
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	jumpifbyte CMP_COMMON_BITS, gMoveResultFlags, 0x29, BattleScript_81D6A42
	printfromtable gLeechSeedDrainStringIds
	waitmessage 0x40

BattleScript_81D6A42:: @ 81D6A42
	faintpokemon BS_ATTACKER, 0x0, NULL
	faintpokemon BS_TARGET, 0x0, NULL
	jump BattleScript_MoveEnd

BattleScript_EffectBurnHit:: @ 81D6A55
	setbyte cEFFECT_CHOOSER, 0x3
	jump BattleScript_EffectHit

BattleScript_EffectFreezeHit:: @ 81D6A60
	setbyte cEFFECT_CHOOSER, 0x4
	jump BattleScript_EffectHit

BattleScript_EffectParalyzeHit:: @ 81D6A6B
	setbyte cEFFECT_CHOOSER, 0x5
	jump BattleScript_EffectHit

BattleScript_EffectExplosion:: @ 81D6A76
	attackcanceler
	attackstring
	ppreduce
	faintifabilitynotdamp
	setuserhptozero
	waitstateatk
	jumpifbyte CMP_NO_COMMON_BITS, gMoveResultFlags, 0x1, BattleScript_81D6A91
	callatk BattleScript_81D6AE7
	jump BattleScript_81D6A93

BattleScript_81D6A91:: @ 81D6A91
	attackanimation
	waitanimation

BattleScript_81D6A93:: @ 81D6A93
	atk25
	critcalc
	atk5
	atk6
	atk7
	accuracycheck BattleScript_81D6ACC, 0x0
	missmessage
	atk5c BS_TARGET
	waitstateatk
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	critmessage
	waitmessage 0x40
	resultmessage
	waitmessage 0x40
	faintpokemon BS_TARGET, 0x0, NULL
	setbyte sMOVEEND_STATE, 0x0
	atk49 0x2, 0x10
	jumpwhiletargetvalid BattleScript_81D6A93
	faintpokemon BS_ATTACKER, 0x0, NULL
	end

BattleScript_81D6ACC:: @ 81D6ACC
	missmessage
	resultmessage
	waitmessage 0x40
	setbyte sMOVEEND_STATE, 0x0
	atk49 0x2, 0x10
	jumpwhiletargetvalid BattleScript_81D6A93
	faintpokemon BS_ATTACKER, 0x0, NULL
	end

BattleScript_81D6AE7:: @ 81D6AE7
	bicbyte gMoveResultFlags, 0x1
	attackanimation
	waitanimation
	orbyte gMoveResultFlags, 0x1
	return

BattleScript_EffectDreamEater:: @ 81D6AF6
	attackcanceler
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_81D6B0B
	jumpifstatus BS_TARGET, 0x7, BattleScript_81D6B15

BattleScript_81D6B0B:: @ 81D6B0B
	attackstring
	ppreduce
	waitmessage 0x40
	jump BattleScript_81D69BE

BattleScript_81D6B15:: @ 81D6B15
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	critcalc
	atk5
	atk6
	atk7
	attackanimation
	waitanimation
	missmessage
	atk5c BS_TARGET
	waitstateatk
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	critmessage
	waitmessage 0x40
	resultmessage
	waitmessage 0x40
	negativedamage
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	jumpifbyte CMP_COMMON_BITS, gMoveResultFlags, 0x29, BattleScript_81D6B53
	printstring STRINGID_PKMNDREAMEATEN
	waitmessage 0x40

BattleScript_81D6B53:: @ 81D6B53
	faintpokemon BS_TARGET, 0x0, NULL
	jump BattleScript_MoveEnd

BattleScript_EffectMirrorMove:: @ 81D6B5F
	attackcanceler
	attackstring
	pause 0x40
	jumptolastusedattack
	ppreduce
	orbyte gMoveResultFlags, 0x20
	printstring STRINGID_MIRRORMOVEFAILED
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectAttackUp:: @ 81D6B77
	setbyte sSTATCHANGER, 0x11
	jump BattleScript_81D6B9E

BattleScript_EffectDefenseUp:: @ 81D6B82
	setbyte sSTATCHANGER, 0x12
	jump BattleScript_81D6B9E

BattleScript_EffectSpecialAttackUp:: @ 81D6B8D
	setbyte sSTATCHANGER, 0x14
	jump BattleScript_81D6B9E

BattleScript_EffectEvasionUp:: @ 81D6B98
	setbyte sSTATCHANGER, 0x17

BattleScript_81D6B9E:: @ 81D6B9E
	attackcanceler

BattleScript_81D6B9F:: @ 81D6B9F
	attackstring
	ppreduce
	statbuffchange 0x41, BattleScript_81D6BCC
	jumpifbyte CMP_NOT_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D6BBA
	pause 0x20
	jump BattleScript_81D6BC4

BattleScript_81D6BBA:: @ 81D6BBA
	attackanimation
	waitanimation

BattleScript_81D6BBC:: @ 81D6BBC
	atk47
	playanimation BS_ATTACKER, B_ANIM_STATS_CHANGE, sB_ANIM_ARG1

BattleScript_81D6BC4:: @ 81D6BC4
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D6BCC:: @ 81D6BCC
	jump BattleScript_MoveEnd

BattleScript_StatUp:: @ 81D6BD1
	playanimation BS_EFFECT_BATTLER, B_ANIM_STATS_CHANGE, sB_ANIM_ARG1
	printfromtable gStatUpStringIds
	waitmessage 0x40
	return

BattleScript_EffectAttackDown:: @ 81D6BE1
	setbyte sSTATCHANGER, 0x91
	jump BattleScript_81D6C13

BattleScript_EffectDefenseDown:: @ 81D6BEC
	setbyte sSTATCHANGER, 0x92
	jump BattleScript_81D6C13

BattleScript_EffectSpeedDown:: @ 81D6BF7
	setbyte sSTATCHANGER, 0x93
	jump BattleScript_81D6C13

BattleScript_EffectAccuracyDown:: @ 81D6C02
	setbyte sSTATCHANGER, 0x96
	jump BattleScript_81D6C13

BattleScript_EffectEvasionDown:: @ 81D6C0D
	setbyte sSTATCHANGER, 0x97

BattleScript_81D6C13:: @ 81D6C13
	attackcanceler
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_81D7DF0
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	statbuffchange 0x1, BattleScript_81D6C5D
	jumpifbyte CMP_LESS_THAN, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D6C4B
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x3, BattleScript_81D6C5D
	pause 0x20
	jump BattleScript_81D6C55

BattleScript_81D6C4B:: @ 81D6C4B
	attackanimation
	waitanimation
	atk47
	playanimation BS_TARGET, B_ANIM_STATS_CHANGE, sB_ANIM_ARG1

BattleScript_81D6C55:: @ 81D6C55
	printfromtable gStatDownStringIds
	waitmessage 0x40

BattleScript_81D6C5D:: @ 81D6C5D
	jump BattleScript_MoveEnd

BattleScript_StatDown:: @ 81D6C62
	playanimation BS_EFFECT_BATTLER, B_ANIM_STATS_CHANGE, sB_ANIM_ARG1
	printfromtable gStatDownStringIds
	waitmessage 0x40
	return

BattleScript_EffectHaze:: @ 81D6C72
	attackcanceler
	attackstring
	ppreduce
	attackanimation
	waitanimation
	normalisebuffs
	printstring STRINGID_STATCHANGESGONE
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectBide:: @ 81D6C83
	attackcanceler
	attackstring
	ppreduce
	attackanimation
	waitanimation
	orword gHitMarker, HITMARKER_CHARGING
	setbide
	jump BattleScript_MoveEnd

BattleScript_EffectRampage:: @ 81D6C97
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	jumpifsecondarytstatus BS_ATTACKER, 0x1000, BattleScript_81D6CAB
	ppreduce

BattleScript_81D6CAB:: @ 81D6CAB
	confuseifrepeatingattackends
	jump BattleScript_HitFromCritCalc

BattleScript_EffectRoar:: @ 81D6CB1
	attackcanceler
	attackstring
	ppreduce
	jumpifability BS_TARGET, ABILITY_SUCTION_CUPS, BattleScript_81D9408
	jumpifspecialstatusflag BS_TARGET, 0x400, 0x0, BattleScript_81D8F27
	accuracycheck BattleScript_ButItFailed, 0xFFFF
	accuracycheck BattleScript_MoveMissedPause, 0x0
	forcerandomswitch BattleScript_ButItFailed

BattleScript_EffectMultiHit:: @ 81D6CD9
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	setloopcounter 0x0
	atk8e
	setbyte sMULTIHIT_EFFECT, 0x0

BattleScript_81D6CEC:: @ 81D6CEC
	jumpiffainted BS_ATTACKER, BattleScript_81D6D82
	jumpiffainted BS_TARGET, BattleScript_81D6D63
	jumpifhalfword CMP_EQUAL, gChosenMove, 0xD6, BattleScript_81D6D0E
	jumpifstatus BS_ATTACKER, 0x7, BattleScript_81D6D63

BattleScript_81D6D0E:: @ 81D6D0E
	atk25
	copyarray cEFFECT_CHOOSER, sMULTIHIT_EFFECT, 0x1
	critcalc
	atk5
	atk6
	jumpifbyte CMP_COMMON_BITS, gMoveResultFlags, 0x29, BattleScript_81D6D60
	atk7
	attackanimation
	waitanimation
	missmessage
	atk5c BS_TARGET
	waitstateatk
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	critmessage
	waitmessage 0x40
	printstring STRINGID_EMPTYSTRING3
	waitmessage 0x1
	addbyte gBattleScripting + 0xC, 0x1
	setbyte sMOVEEND_STATE, 0x0
	atk49 0x2, 0x10
	jumpifbyte CMP_COMMON_BITS, gMoveResultFlags, 0x40, BattleScript_81D6D63
	atk27 BattleScript_81D6CEC
	jump BattleScript_81D6D63

BattleScript_81D6D60:: @ 81D6D60
	pause 0x20

BattleScript_81D6D63:: @ 81D6D63
	resultmessage
	waitmessage 0x40
	jumpifbyte CMP_COMMON_BITS, gMoveResultFlags, 0x29, BattleScript_81D6D82
	copyarray gBattleTextBuff1, sMULTIHIT_STRING, 0x6
	printstring STRINGID_HITXTIMES
	waitmessage 0x40

BattleScript_81D6D82:: @ 81D6D82
	seteffectwithchancetarget
	faintpokemon BS_TARGET, 0x0, NULL
	setbyte sMOVEEND_STATE, 0x2
	atk49 0x1, 0x0
	setbyte sMOVEEND_STATE, 0x4
	atk49 0x0, 0x0
	end

BattleScript_EffectConversion:: @ 81D6D9D
	attackcanceler
	attackstring
	ppreduce
	changetypestoenemyattacktype BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNCHANGEDTYPE
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectFlinchHit:: @ 81D6DB2
	setbyte cEFFECT_CHOOSER, 0x8
	jump BattleScript_EffectHit

BattleScript_EffectRestoreHp:: @ 81D6DBD
	attackcanceler
	attackstring
	ppreduce
	setdamageasrestorehalfmaxhp BattleScript_AlreadyAtFullHp, 0x1
	attackanimation
	waitanimation
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	printstring STRINGID_PKMNREGAINEDHEALTH
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectToxic:: @ 81D6DE0
	attackcanceler
	attackstring
	ppreduce
	jumpifability BS_TARGET, ABILITY_IMMUNITY, BattleScript_81D6E4F
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_ButItFailed
	jumpifstatus BS_TARGET, 0x8, BattleScript_81D6E41
	jumpifstatus BS_TARGET, 0x80, BattleScript_81D6E41
	jumpifstatus BS_TARGET, 0xFF, BattleScript_ButItFailed
	jumpiftype BS_TARGET, 0x3, BattleScript_81D7E04
	jumpiftype BS_TARGET, 0x8, BattleScript_81D7E04
	accuracycheck BattleScript_ButItFailed, 0x0
	jumpifhalverset BS_TARGET, 0x20, BattleScript_81D8B39
	attackanimation
	waitanimation
	setbyte cEFFECT_CHOOSER, 0x6
	seteffecttarget
	resultmessage
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_81D6E41:: @ 81D6E41
	pause 0x40
	printstring STRINGID_PKMNALREADYPOISONED
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_81D6E4F:: @ 81D6E4F
	copyarray gEffectBattler, gBattlerTarget, 0x1
	setbyte cMULTISTRING_CHOOSER, 0x0
	callatk BattleScript_PSNPrevention
	jump BattleScript_MoveEnd

BattleScript_EffectPayDay:: @ 81D6E69
	setbyte cEFFECT_CHOOSER, 0xB
	jump BattleScript_EffectHit

BattleScript_EffectLightScreen:: @ 81D6E74
	attackcanceler
	attackstring
	ppreduce
	setlightscreen
	jump BattleScript_81D7172

BattleScript_EffectTriAttack:: @ 81D6E7D
	setbyte cEFFECT_CHOOSER, 0x9
	jump BattleScript_EffectHit

BattleScript_EffectRest:: @ 81D6E88
	attackcanceler
	attackstring
	ppreduce
	jumpifstatus BS_ATTACKER, 0x7, BattleScript_81D6EC2
	jumpifcannotsleep BattleScript_81D6EB2
	setrest BattleScript_AlreadyAtFullHp
	pause 0x20
	printfromtable gRestUsedStringIds
	waitmessage 0x40
	atk98 0x1
	waitstateatk
	jump BattleScript_PresentHealTarget

BattleScript_81D6EB2:: @ 81D6EB2
	pause 0x40
	printfromtable gUproarAwakeStringIds
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_81D6EC2:: @ 81D6EC2
	pause 0x20
	printstring STRINGID_PKMNALREADYASLEEP2
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectOhko:: @ 81D6ED0
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 0xFFFF
	atk6
	jumpifbyte CMP_COMMON_BITS, gMoveResultFlags, 0x29, BattleScript_81D6934
	koplussomethings BattleScript_81D6EF1
	atkab
	jump BattleScript_81D6934

BattleScript_81D6EF1:: @ 81D6EF1
	pause 0x40
	printfromtable gKOFailedStringIds
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectRazorWind:: @ 81D6F01
	jumpifsecondarytstatus BS_ATTACKER, 0x1000, BattleScript_81D6F29
	jumpifword CMP_COMMON_BITS, gHitMarker, HITMARKER_NO_ATTACKSTRING, BattleScript_81D6F29
	setbyte sTWOTURN_STRINGID, 0x0
	callatk BattleScript_81D6F58
	jump BattleScript_MoveEnd

BattleScript_81D6F29:: @ 81D6F29
	attackcanceler
	setbyte cEFFECT_CHOOSER, 0xC
	setbyte sB_ANIM_TURN, 0x1
	clearstatus BS_ATTACKER
	orword gHitMarker, HITMARKER_NO_PPDEDUCT
	jumpifhalfword CMP_NOT_EQUAL, gCurrentMove, 0x8F, BattleScript_81D6927
	setbyte cEFFECT_CHOOSER, 0x8
	jump BattleScript_81D6927

BattleScript_81D6F58:: @ 81D6F58
	attackcanceler
	printstring STRINGID_EMPTYSTRING3
	ppreduce
	attackanimation
	waitanimation
	orword gHitMarker, HITMARKER_CHARGING
	setbyte cEFFECT_CHOOSER, 0x4C
	seteffecttarget
	copyarray cMULTISTRING_CHOOSER, sTWOTURN_STRINGID, 0x1
	printfromtable gFirstTurnOfTwoStringIds
	waitmessage 0x40
	return

BattleScript_EffectSuperFang:: @ 81D6F82
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	atk6
	bicbyte gMoveResultFlags, 0x6
	gethalfcurrentenemyhp
	jump BattleScript_81D6934

BattleScript_EffectDragonRage:: @ 81D6F99
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	atk6
	bicbyte gMoveResultFlags, 0x6
	setbyte gBattleMoveDamage, 0x28
	setbyte gBattleMoveDamage + 0x1, 0x0
	setbyte gBattleMoveDamage + 0x2, 0x0
	setbyte gBattleMoveDamage + 0x3, 0x0
	atk69
	jump BattleScript_81D6934

BattleScript_EffectTrap:: @ 81D6FC8
	jumpifhalfword CMP_NOT_EQUAL, gCurrentMove, 0xFA, BattleScript_81D6FEE
	jumpifspecialstatusflag BS_TARGET, 0x40000, 0x1, BattleScript_81D6FEE
	orword gHitMarker, HITMARKER_IGNORE_UNDERWATER
	setbyte sDMG_MULTIPLIER, 0x2

BattleScript_81D6FEE:: @ 81D6FEE
	setbyte cEFFECT_CHOOSER, 0xD
	jump BattleScript_EffectHit

BattleScript_EffectDoubleHit:: @ 81D6FF9
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	setloopcounter 0x2
	atk8e
	setbyte sMULTIHIT_EFFECT, 0x0
	jump BattleScript_81D6CEC

BattleScript_EffectRecoilIfMiss:: @ 81D7011
	attackcanceler
	accuracycheck BattleScript_81D701E, 0x0
	jump BattleScript_81D692E

BattleScript_81D701E:: @ 81D701E
	attackstring
	ppreduce
	pause 0x40
	resultmessage
	waitmessage 0x40
	jumpifbyte CMP_COMMON_BITS, gMoveResultFlags, 0x8, BattleScript_MoveEnd
	printstring STRINGID_PKMNCRASHED
	waitmessage 0x40
	atk5
	atk6
	atk7
	manipulatedamage 0x1
	bicbyte gMoveResultFlags, 0x1
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	faintpokemon BS_ATTACKER, 0x0, NULL
	orbyte gMoveResultFlags, 0x1
	jump BattleScript_MoveEnd

BattleScript_EffectMist:: @ 81D7062
	attackcanceler
	attackstring
	ppreduce
	setmisteffect
	attackanimation
	waitanimation
	printfromtable gMistUsedStringIds
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectFocusEnergy:: @ 81D7075
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus BS_ATTACKER, 0x100000, BattleScript_ButItFailed
	setincreasedcriticalchance
	attackanimation
	waitanimation
	printfromtable gFocusEnergyUsedStringIds
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectRecoil:: @ 81D7092
	setbyte cEFFECT_CHOOSER, 0xCE
	jumpifhalfword CMP_NOT_EQUAL, gCurrentMove, 0xA5, BattleScript_EffectHit
	atk60 0x1B
	jump BattleScript_EffectHit

BattleScript_EffectConfuse:: @ 81D70AB
	attackcanceler
	attackstring
	ppreduce
	jumpifability BS_TARGET, ABILITY_OWN_TEMPO, BattleScript_81D9460
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_ButItFailed
	jumpifsecondarytstatus BS_TARGET, 0x7, BattleScript_81D70EA
	accuracycheck BattleScript_ButItFailed, 0x0
	jumpifhalverset BS_TARGET, 0x20, BattleScript_81D8B39
	attackanimation
	waitanimation
	setbyte cEFFECT_CHOOSER, 0x7
	seteffecttarget
	resultmessage
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_81D70EA:: @ 81D70EA
	pause 0x20
	printstring STRINGID_PKMNALREADYCONFUSED
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectAttackUp2:: @ 81D70F8
	setbyte sSTATCHANGER, 0x21
	jump BattleScript_81D6B9E

BattleScript_EffectDefenseUp2:: @ 81D7103
	setbyte sSTATCHANGER, 0x22
	jump BattleScript_81D6B9E

BattleScript_EffectSpeedUp2:: @ 81D710E
	setbyte sSTATCHANGER, 0x23
	jump BattleScript_81D6B9E

BattleScript_EffectSpecialAttackUp2:: @ 81D7119
	setbyte sSTATCHANGER, 0x24
	jump BattleScript_81D6B9E

BattleScript_EffectSpecialDefenseUp2:: @ 81D7124
	setbyte sSTATCHANGER, 0x25
	jump BattleScript_81D6B9E

BattleScript_EffectTransform:: @ 81D712F
	attackcanceler
	attackstring
	ppreduce
	transformdataexecution
	attackanimation
	waitanimation
	printfromtable gTransformUsedStringIds
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectAttackDown2:: @ 81D7142
	setbyte sSTATCHANGER, 0xA1
	jump BattleScript_81D6C13

BattleScript_EffectDefenseDown2:: @ 81D714D
	setbyte sSTATCHANGER, 0xA2
	jump BattleScript_81D6C13

BattleScript_EffectSpeedDown2:: @ 81D7158
	setbyte sSTATCHANGER, 0xA3
	jump BattleScript_81D6C13

BattleScript_EffectSpecialDefenseDown2:: @ 81D7163
	setbyte sSTATCHANGER, 0xA5
	jump BattleScript_81D6C13

BattleScript_EffectReflect:: @ 81D716E
	attackcanceler
	attackstring
	ppreduce
	setreflect

BattleScript_81D7172:: @ 81D7172
	attackanimation
	waitanimation
	printfromtable gReflectLightScreenSafeguardStringIds
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectPoison:: @ 81D7181
	attackcanceler
	attackstring
	ppreduce
	jumpifability BS_TARGET, ABILITY_IMMUNITY, BattleScript_81D6E4F
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_ButItFailed
	jumpifstatus BS_TARGET, 0x8, BattleScript_81D6E41
	jumpifstatus BS_TARGET, 0x80, BattleScript_81D6E41
	jumpiftype BS_TARGET, 0x3, BattleScript_81D7E04
	jumpiftype BS_TARGET, 0x8, BattleScript_81D7E04
	jumpifstatus BS_TARGET, 0xFF, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, 0x0
	jumpifhalverset BS_TARGET, 0x20, BattleScript_81D8B39
	attackanimation
	waitanimation
	setbyte cEFFECT_CHOOSER, 0x2
	seteffecttarget
	resultmessage
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectParalyze:: @ 81D71E2
	attackcanceler
	attackstring
	ppreduce
	jumpifability BS_TARGET, ABILITY_LIMBER, BattleScript_81D7245
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_ButItFailed
	atk6
	jumpifbyte CMP_COMMON_BITS, gMoveResultFlags, 0x29, BattleScript_ButItFailed
	jumpifstatus BS_TARGET, 0x40, BattleScript_81D7237
	jumpifstatus BS_TARGET, 0xFF, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, 0x0
	jumpifhalverset BS_TARGET, 0x20, BattleScript_81D8B39
	attackanimation
	waitanimation
	setbyte cEFFECT_CHOOSER, 0x5
	seteffecttarget
	resultmessage
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_81D7237:: @ 81D7237
	pause 0x20
	printstring STRINGID_PKMNISALREADYPARALYZED
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_81D7245:: @ 81D7245
	copyarray gEffectBattler, gBattlerTarget, 0x1
	setbyte cMULTISTRING_CHOOSER, 0x0
	callatk BattleScript_PRLZPrevention
	jump BattleScript_MoveEnd

BattleScript_EffectAttackDownHit:: @ 81D725F
	setbyte cEFFECT_CHOOSER, 0x16
	jump BattleScript_EffectHit

BattleScript_EffectDefenseDownHit:: @ 81D726A
	setbyte cEFFECT_CHOOSER, 0x17
	jump BattleScript_EffectHit

BattleScript_EffectSpeedDownHit:: @ 81D7275
	setbyte cEFFECT_CHOOSER, 0x18
	jump BattleScript_EffectHit

BattleScript_EffectSpecialAttackDownHit:: @ 81D7280
	setbyte cEFFECT_CHOOSER, 0x19
	jump BattleScript_EffectHit

BattleScript_EffectSpecialDefenseDownHit:: @ 81D728B
	setbyte cEFFECT_CHOOSER, 0x1A
	jump BattleScript_EffectHit

BattleScript_EffectAccuracyDownHit:: @ 81D7296
	setbyte cEFFECT_CHOOSER, 0x1B
	jump BattleScript_EffectHit

BattleScript_EffectSkyAttack:: @ 81D72A1
	jumpifsecondarytstatus BS_ATTACKER, 0x1000, BattleScript_81D6F29
	jumpifword CMP_COMMON_BITS, gHitMarker, HITMARKER_NO_ATTACKSTRING, BattleScript_81D6F29
	setbyte sTWOTURN_STRINGID, 0x3
	callatk BattleScript_81D6F58
	jump BattleScript_MoveEnd

BattleScript_EffectConfuseHit:: @ 81D72C9
	setbyte cEFFECT_CHOOSER, 0x7
	jump BattleScript_EffectHit

BattleScript_EffectTwineedle:: @ 81D72D4
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	setbyte sMULTIHIT_EFFECT, 0x2
	attackstring
	ppreduce
	setloopcounter 0x2
	atk8e
	jump BattleScript_81D6CEC

BattleScript_EffectSubstitute:: @ 81D72EC
	attackcanceler
	ppreduce
	attackstring
	waitstateatk
	jumpifsecondarytstatus BS_ATTACKER, 0x1000000, BattleScript_81D7321
	setsubstituteeffect
	jumpifbyte CMP_NOT_EQUAL, cMULTISTRING_CHOOSER, 0x1, BattleScript_81D730E
	pause 0x20
	jump BattleScript_81D7314

BattleScript_81D730E:: @ 81D730E
	attackanimation
	waitanimation
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER

BattleScript_81D7314:: @ 81D7314
	printfromtable gSubsituteUsedStringIds
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_81D7321:: @ 81D7321
	pause 0x20
	printstring STRINGID_PKMNHASSUBSTITUTE
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectRecharge:: @ 81D732F
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	setbyte cEFFECT_CHOOSER, 0xDD
	jump BattleScript_81D692E

BattleScript_MoveUsedMustRecharge:: @ 81D7342
	printstring STRINGID_PKMNMUSTRECHARGE
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectRage:: @ 81D734D
	attackcanceler
	accuracycheck BattleScript_81D7367, 0x0
	setbyte cEFFECT_CHOOSER, 0x1E
	seteffecttarget
	setbyte cEFFECT_CHOOSER, 0x0
	jump BattleScript_81D692E

BattleScript_81D7367:: @ 81D7367
	setbyte cEFFECT_CHOOSER, 0x1E
	clearstatus BS_ATTACKER
	jump BattleScript_81D695E

BattleScript_EffectMimic:: @ 81D7374
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, 0xFFFF
	copyattack BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNLEARNEDMOVE2
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectMetronome:: @ 81D739A
	attackcanceler
	attackstring
	pause 0x20
	attackanimation
	waitanimation
	setbyte sB_ANIM_TURN, 0x0
	setbyte sB_ANIM_TARGETS_HIT, 0x0
	metronomeeffect

BattleScript_EffectLeechSeed:: @ 81D73AE
	attackcanceler
	attackstring
	pause 0x20
	ppreduce
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_ButItFailed
	accuracycheck BattleScript_81D73C5, 0x0

BattleScript_81D73C5:: @ 81D73C5
	setleechseed
	attackanimation
	waitanimation
	printfromtable gLeechSeedStringIds
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectSplash:: @ 81D73D5
	attackcanceler
	attackstring
	ppreduce
	attackanimation
	waitanimation
	atk60 0x1A
	printstring STRINGID_BUTNOTHINGHAPPENED
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectDisable:: @ 81D73E7
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 0x0
	disablelastusedattack BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNMOVEWASDISABLED
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectLevelDamage:: @ 81D7403
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	atk6
	bicbyte gMoveResultFlags, 0x6
	nightshadedamageeffect
	atk69
	jump BattleScript_81D6934

BattleScript_EffectPsywave:: @ 81D741B
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	atk6
	bicbyte gMoveResultFlags, 0x6
	psywavedamageeffect
	atk69
	jump BattleScript_81D6934

BattleScript_EffectCounter:: @ 81D7433
	attackcanceler
	counterdamagecalculator BattleScript_81D7DF0
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	damagecalc2
	atk69
	jump BattleScript_81D6934

BattleScript_EffectEncore:: @ 81D7449
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	setencore BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNGOTENCORE
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectPainSplit:: @ 81D7465
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 0xFFFF
	painsplitdamagecalculator BattleScript_ButItFailed
	attackanimation
	waitanimation
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	copyarray gBattleMoveDamage, gBattleScripting, 0x4
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	printstring STRINGID_SHAREDPAIN
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectSnore:: @ 81D749C
	attackcanceler
	jumpifstatus BS_ATTACKER, 0x7, BattleScript_81D74AE
	attackstring
	ppreduce
	jump BattleScript_ButItFailed

BattleScript_81D74AE:: @ 81D74AE
	jumpifhalfword CMP_EQUAL, gChosenMove, 0xD6, BattleScript_81D74C2
	printstring STRINGID_PKMNFASTASLEEP
	waitmessage 0x40
	statusanimation BS_ATTACKER

BattleScript_81D74C2:: @ 81D74C2
	attackstring
	ppreduce
	accuracycheck BattleScript_MoveMissedPause, 0x0
	setbyte cEFFECT_CHOOSER, 0x8
	jump BattleScript_HitFromCritCalc

BattleScript_EffectConversion2:: @ 81D74D6
	attackcanceler
	attackstring
	ppreduce
	settypetorandomresistance BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNCHANGEDTYPE
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectLockOn:: @ 81D74EB
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, 0x0
	setalwayshitflag
	attackanimation
	waitanimation
	printstring STRINGID_PKMNTOOKAIM
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectSketch:: @ 81D750D
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_ButItFailed
	copymovepermanently BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSKETCHEDMOVE
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectSleepTalk:: @ 81D752C
	attackcanceler
	jumpifstatus BS_ATTACKER, 0x7, BattleScript_81D753E
	attackstring
	ppreduce
	jump BattleScript_ButItFailed

BattleScript_81D753E:: @ 81D753E
	printstring STRINGID_PKMNFASTASLEEP
	waitmessage 0x40
	statusanimation BS_ATTACKER
	attackstring
	ppreduce
	orword gHitMarker, HITMARKER_NO_PPDEDUCT
	selectrandommovefromusermoves BattleScript_81D755E
	pause 0x40
	jump BattleScript_ButItFailed

BattleScript_81D755E:: @ 81D755E
	attackanimation
	waitanimation
	setbyte sB_ANIM_TURN, 0x0
	setbyte sB_ANIM_TARGETS_HIT, 0x0
	jumptoattack BS_ATTACKER

BattleScript_EffectDestinyBond:: @ 81D756E
	attackcanceler
	attackstring
	ppreduce
	destinybondeffect
	attackanimation
	waitanimation
	printstring STRINGID_PKMNTRYINGTOTAKEFOE
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectFlail:: @ 81D757F
	remaininghptopower
	jump BattleScript_EffectHit

BattleScript_EffectSpite:: @ 81D7585
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 0x0
	reducepprandom BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNREDUCEDPP
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectHealBell:: @ 81D75A1
	attackcanceler
	attackstring
	ppreduce
	clearstatusifnotsoundproofed
	waitstateatk
	attackanimation
	waitanimation
	printfromtable gPartyStatusHealStringIds
	waitmessage 0x40
	jumpifhalfword CMP_NOT_EQUAL, gCurrentMove, 0xD7, BattleScript_81D75DE
	jumpifbyte CMP_NO_COMMON_BITS, cMULTISTRING_CHOOSER, 0x1, BattleScript_81D75CD
	printstring STRINGID_PKMNSXBLOCKSY
	waitmessage 0x40

BattleScript_81D75CD:: @ 81D75CD
	jumpifbyte CMP_NO_COMMON_BITS, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D75DE
	printstring STRINGID_PKMNSXBLOCKSY2
	waitmessage 0x40

BattleScript_81D75DE:: @ 81D75DE
	atk98 0x4
	waitstateatk
	jump BattleScript_MoveEnd

BattleScript_EffectTripleKick:: @ 81D75E6
	attackcanceler
	attackstring
	ppreduce
	setbyte sTRIPLE_KICK_POWER, 0x0
	setbyte gBattleScripting + 0x13, 0x0
	atk8e
	atk26 0x3

BattleScript_81D75F8:: @ 81D75F8
	jumpiffainted BS_ATTACKER, BattleScript_81D76B7
	jumpiffainted BS_TARGET, BattleScript_81D7679
	jumpifhalfword CMP_EQUAL, gChosenMove, 0xD6, BattleScript_81D761A
	jumpifstatus BS_ATTACKER, 0x7, BattleScript_81D7679

BattleScript_81D761A:: @ 81D761A
	accuracycheck BattleScript_81D7679, 0x0
	atk25
	addbyte sTRIPLE_KICK_POWER, 0xA
	addbyte gBattleScripting + 0xC, 0x1
	copyarray gDynamicBasePower, sTRIPLE_KICK_POWER, 0x2
	critcalc
	atk5
	atk6
	atk7
	jumpifbyte CMP_COMMON_BITS, gMoveResultFlags, 0x29, BattleScript_81D7679
	attackanimation
	waitanimation
	missmessage
	atk5c BS_TARGET
	waitstateatk
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	critmessage
	waitmessage 0x40
	printstring STRINGID_EMPTYSTRING3
	waitmessage 0x1
	setbyte sMOVEEND_STATE, 0x0
	atk49 0x2, 0x10
	jumpifbyte CMP_COMMON_BITS, gMoveResultFlags, 0x40, BattleScript_81D768D
	atk27 BattleScript_81D75F8
	jump BattleScript_81D768D

BattleScript_81D7679:: @ 81D7679
	pause 0x20
	jumpifbyte CMP_EQUAL, gBattleScripting + 0xC, 0x0, BattleScript_81D768D
	bicbyte gMoveResultFlags, 0x1

BattleScript_81D768D:: @ 81D768D
	resultmessage
	waitmessage 0x40
	jumpifbyte CMP_EQUAL, gBattleScripting + 0xC, 0x0, BattleScript_81D76B7
	jumpifbyte CMP_COMMON_BITS, gMoveResultFlags, 0x8, BattleScript_81D76B7
	copyarray gBattleTextBuff1, sMULTIHIT_STRING, 0x6
	printstring STRINGID_HITXTIMES
	waitmessage 0x40

BattleScript_81D76B7:: @ 81D76B7
	seteffectwithchancetarget
	faintpokemon BS_TARGET, 0x0, NULL
	setbyte sMOVEEND_STATE, 0xE
	atk49 0x0, 0x0
	end

BattleScript_EffectThief:: @ 81D76C9
	setbyte cEFFECT_CHOOSER, 0x1F
	jump BattleScript_EffectHit

BattleScript_EffectMeanLook:: @ 81D76D4
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 0xFFFE
	jumpifsecondarytstatus BS_TARGET, 0x4000000, BattleScript_ButItFailed
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_ButItFailed
	attackanimation
	waitanimation
	setbyte cEFFECT_CHOOSER, 0x20
	seteffecttarget
	printstring STRINGID_TARGETCANTESCAPENOW
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectNightmare:: @ 81D7706
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_ButItFailed
	jumpifsecondarytstatus BS_TARGET, Start, BattleScript_ButItFailed
	jumpifstatus BS_TARGET, 0x7, BattleScript_81D772C
	jump BattleScript_ButItFailed

BattleScript_81D772C:: @ 81D772C
	attackanimation
	waitanimation
	setbyte cEFFECT_CHOOSER, 0x21
	seteffecttarget
	printstring STRINGID_PKMNFELLINTONIGHTMARE
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectMinimize:: @ 81D7740
	attackcanceler
	setminimize
	setbyte sSTATCHANGER, 0x17
	jump BattleScript_81D6B9F

BattleScript_EffectCurse:: @ 81D774D
	jumpiftype2 BS_ATTACKER, 0x7, BattleScript_81D77C5
	attackcanceler
	attackstring
	ppreduce
	jumpifstat BS_ATTACKER, CMP_GREATER_THAN, STAT_SPEED, 0x0, BattleScript_81D7772
	jumpifstat BS_ATTACKER, CMP_NOT_EQUAL, STAT_ATK, 0xC, BattleScript_81D7772
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_DEF, 0xC, BattleScript_ButItFailed

BattleScript_81D7772:: @ 81D7772
	copyarray gBattlerTarget, gBattlerAttacker, 0x1
	setbyte sB_ANIM_TURN, 0x1
	attackanimation
	waitanimation
	setbyte sSTATCHANGER, 0x93
	statbuffchange 0x41, BattleScript_81D7798
	printfromtable gStatDownStringIds
	waitmessage 0x40

BattleScript_81D7798:: @ 81D7798
	setbyte sSTATCHANGER, 0x11
	statbuffchange 0x41, BattleScript_81D77AC
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D77AC:: @ 81D77AC
	setbyte sSTATCHANGER, 0x12
	statbuffchange 0x41, BattleScript_81D77C0
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D77C0:: @ 81D77C0
	jump BattleScript_MoveEnd

BattleScript_81D77C5:: @ 81D77C5
	jumpifarraynotequal gBattlerAttacker, gBattlerTarget, 0x1, BattleScript_81D77D6
	atk76 0x1, BS_FAINTED

BattleScript_81D77D6:: @ 81D77D6
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, 0xFFFF
	cursetarget BattleScript_ButItFailed
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	setbyte sB_ANIM_TURN, 0x0
	attackanimation
	waitanimation
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	printstring STRINGID_PKMNLAIDCURSE
	waitmessage 0x40
	faintpokemon BS_ATTACKER, 0x0, NULL
	jump BattleScript_MoveEnd

BattleScript_EffectProtect:: @ 81D7816
	attackcanceler
	attackstring
	ppreduce
	setprotect
	attackanimation
	waitanimation
	printfromtable gProtectLikeUsedStringIds
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectSpikes:: @ 81D7829
	attackcanceler
	setspikes BattleScript_81D7DF0
	attackstring
	ppreduce
	attackanimation
	waitanimation
	printstring STRINGID_SPIKESSCATTERED
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectForesight:: @ 81D783E
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	setforesight
	attackanimation
	waitanimation
	printstring STRINGID_PKMNIDENTIFIED
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectPerishSong:: @ 81D7856
	attackcanceler
	attackstring
	ppreduce
	setperishsong BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_FAINTINTHREE
	waitmessage 0x40
	setbyte sBATTLER, 0x0

BattleScript_81D786C:: @ 81D786C
	jumpifability BS_SCRIPTING, ABILITY_SOUNDPROOF, BattleScript_81D788C

BattleScript_81D7873:: @ 81D7873
	addbyte sBATTLER, 0x1
	jumpifarraynotequal sBATTLER, gBattlersCount, 0x1, BattleScript_81D786C
	jump BattleScript_MoveEnd

BattleScript_81D788C:: @ 81D788C
	printstring STRINGID_PKMNSXBLOCKSY2
	waitmessage 0x40
	jump BattleScript_81D7873

BattleScript_EffectSandstorm:: @ 81D7897
	attackcanceler
	attackstring
	ppreduce
	setsandstorm
	jump BattleScript_81D7A14

BattleScript_EffectRollout:: @ 81D78A0
	attackcanceler
	attackstring
	jumpifsecondarytstatus BS_ATTACKER, 0x1000, BattleScript_81D78AD
	ppreduce

BattleScript_81D78AD:: @ 81D78AD
	accuracycheck BattleScript_81D78B4, 0x0

BattleScript_81D78B4:: @ 81D78B4
	damagecalc2
	rolloutdamagecalculation
	jump BattleScript_HitFromCritCalc

BattleScript_EffectSwagger:: @ 81D78BB
	attackcanceler
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_81D6958
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	jumpifconfusedandattackmaxed BS_ATTACKER, BattleScript_ButItFailed
	attackanimation
	waitanimation
	setbyte sSTATCHANGER, 0x21
	statbuffchange 0x1, BattleScript_81D78FE
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D78FE
	atk47
	playanimation BS_TARGET, B_ANIM_STATS_CHANGE, sB_ANIM_ARG1
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D78FE:: @ 81D78FE
	jumpifability BS_TARGET, ABILITY_OWN_TEMPO, BattleScript_81D9460
	jumpifhalverset BS_TARGET, 0x20, BattleScript_81D8B39
	setbyte cEFFECT_CHOOSER, 0x7
	seteffecttarget
	jump BattleScript_MoveEnd

BattleScript_EffectFuryCutter:: @ 81D7919
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_81D7923, 0x0

BattleScript_81D7923:: @ 81D7923
	furycutterdamagecalculation
	critcalc
	atk5
	atk6
	jumpifbyte CMP_COMMON_BITS, gMoveResultFlags, 0x29, BattleScript_81D7923
	atk7
	jump BattleScript_81D6934

BattleScript_EffectAttract:: @ 81D7938
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 0x0
	tryinfatuatetarget BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNFELLINLOVE
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectReturn:: @ 81D7954
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	happinesstodamagecalculation
	jump BattleScript_81D692E

BattleScript_EffectPresent:: @ 81D7962
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	atk6
	presentdamagecalculation

BattleScript_EffectSafeguard:: @ 81D796E
	attackcanceler
	attackstring
	ppreduce
	setsafeguard
	jump BattleScript_81D7172

BattleScript_EffectThawHit:: @ 81D7977
	setbyte cEFFECT_CHOOSER, 0x3
	jump BattleScript_EffectHit

BattleScript_EffectMagnitude:: @ 81D7982
	attackcanceler
	attackstring
	ppreduce
	selectnexttarget
	magnitudedamagecalculation
	pause 0x20
	printstring STRINGID_MAGNITUDESTRENGTH
	waitmessage 0x40
	jump BattleScript_81D7B17

BattleScript_EffectBatonPass:: @ 81D7995
	attackcanceler
	attackstring
	ppreduce
	jumpifcannotswitch BS_ATTACKER | 0x80, BattleScript_ButItFailed
	attackanimation
	waitanimation
	openpartyscreen 0x1, BattleScript_ButItFailed
	atke2 BS_ATTACKER
	waitstateatk
	atk51 BS_ATTACKER, 0x2
	atk58 BS_ATTACKER
	switch1 BS_ATTACKER
	switch2 BS_ATTACKER
	atk73 BS_ATTACKER
	printstring STRINGID_SWITCHINMON
	switch3 BS_ATTACKER, 0x1
	waitstateatk
	atk52 BS_ATTACKER
	jump BattleScript_MoveEnd

BattleScript_EffectRapidSpin:: @ 81D79C2
	setbyte cEFFECT_CHOOSER, 0xE3
	jump BattleScript_EffectHit

BattleScript_EffectSonicboom:: @ 81D79CD
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	atk6
	bicbyte gMoveResultFlags, 0x6
	setbyte gBattleMoveDamage, 0x14
	setbyte gBattleMoveDamage + 0x1, 0x0
	setbyte gBattleMoveDamage + 0x2, 0x0
	setbyte gBattleMoveDamage + 0x3, 0x0
	atk69
	jump BattleScript_81D6934

BattleScript_EffectMorningSun:: @ 81D79FC
	attackcanceler
	attackstring
	ppreduce
	recoverbasedonsunlight BattleScript_AlreadyAtFullHp
	jump BattleScript_PresentHealTarget

BattleScript_EffectHiddenPower:: @ 81D7A09
	attackcanceler
	hiddenpowerdamagecalculation
	jump BattleScript_81D6927

BattleScript_EffectRainDance:: @ 81D7A10
	attackcanceler
	attackstring
	ppreduce
	setrain

BattleScript_81D7A14:: @ 81D7A14
	attackanimation
	waitanimation
	printfromtable gMoveWeatherChangeStringIds
	waitmessage 0x40
	callatk BattleScript_81D92DC
	jump BattleScript_MoveEnd

BattleScript_EffectSunnyDay:: @ 81D7A28
	attackcanceler
	attackstring
	ppreduce
	setsunny
	jump BattleScript_81D7A14

BattleScript_EffectDefenseUpHit:: @ 81D7A31
	setbyte cEFFECT_CHOOSER, 0x50
	jump BattleScript_EffectHit

BattleScript_EffectAttackUpHit:: @ 81D7A3C
	setbyte cEFFECT_CHOOSER, 0x4F
	jump BattleScript_EffectHit

BattleScript_EffectAllStatsUpHit:: @ 81D7A47
	setbyte cEFFECT_CHOOSER, 0x62
	jump BattleScript_EffectHit

BattleScript_EffectBellyDrum:: @ 81D7A52
	attackcanceler
	attackstring
	ppreduce
	maxattackhalvehp BattleScript_ButItFailed
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	attackanimation
	waitanimation
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	printstring STRINGID_PKMNCUTHPMAXEDATTACK
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectPsychUp:: @ 81D7A74
	attackcanceler
	attackstring
	ppreduce
	copyfoestats BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNCOPIEDSTATCHANGES
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectMirrorCoat:: @ 81D7A89
	attackcanceler
	mirrorcoatdamagecalculator BattleScript_81D7DF0
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	damagecalc2
	atk69
	jump BattleScript_81D6934

BattleScript_EffectSkullBash:: @ 81D7A9F
	jumpifsecondarytstatus BS_ATTACKER, 0x1000, BattleScript_81D6F29
	jumpifword CMP_COMMON_BITS, gHitMarker, HITMARKER_NO_ATTACKSTRING, BattleScript_81D6F29
	setbyte sTWOTURN_STRINGID, 0x2
	callatk BattleScript_81D6F58
	setbyte sSTATCHANGER, 0x12
	statbuffchange 0x41, BattleScript_81D7AE9
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D7AE9
	atk47
	playanimation BS_ATTACKER, B_ANIM_STATS_CHANGE, sB_ANIM_ARG1
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D7AE9:: @ 81D7AE9
	jump BattleScript_MoveEnd

BattleScript_EffectTwister:: @ 81D7AEE
	jumpifspecialstatusflag BS_TARGET, 0x40, 0x1, BattleScript_81D7B08
	orword gHitMarker, HITMARKER_IGNORE_ON_AIR
	setbyte sDMG_MULTIPLIER, 0x2

BattleScript_81D7B08:: @ 81D7B08
	setbyte cEFFECT_CHOOSER, 0x8
	jump BattleScript_EffectHit

BattleScript_EffectEarthquake:: @ 81D7B13
	attackcanceler
	attackstring
	ppreduce
	selectnexttarget

BattleScript_81D7B17:: @ 81D7B17
	atk25
	jumpifspecialstatusflag BS_TARGET, 0x80, 0x1, BattleScript_81D7B37
	orword gHitMarker, HITMARKER_IGNORE_UNDERGROUND
	setbyte sDMG_MULTIPLIER, 0x2
	jump BattleScript_81D7B46

BattleScript_81D7B37:: @ 81D7B37
	bicword gHitMarker, 0x20000
	setbyte sDMG_MULTIPLIER, 0x1

BattleScript_81D7B46:: @ 81D7B46
	accuracycheck BattleScript_81D7B7F, 0x0
	critcalc
	atk5
	atk6
	atk7
	attackanimation
	waitanimation
	missmessage
	atk5c BS_TARGET
	waitstateatk
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	critmessage
	waitmessage 0x40
	resultmessage
	waitmessage 0x40
	printstring STRINGID_EMPTYSTRING3
	waitmessage 0x1
	faintpokemon BS_TARGET, 0x0, NULL
	setbyte sMOVEEND_STATE, 0x0
	atk49 0x2, 0x10
	jumpwhiletargetvalid BattleScript_81D7B17
	end

BattleScript_81D7B7F:: @ 81D7B7F
	pause 0x20
	atk6
	missmessage
	resultmessage
	waitmessage 0x40
	setbyte sMOVEEND_STATE, 0x0
	atk49 0x2, 0x10
	jumpwhiletargetvalid BattleScript_81D7B17
	end

BattleScript_EffectFutureSight:: @ 81D7B97
	attackcanceler
	attackstring
	ppreduce
	setfutureattack BattleScript_ButItFailed
	attackanimation
	waitanimation
	printfromtable gFutureMoveUsedStringIds
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectGust:: @ 81D7BAE
	jumpifspecialstatusflag BS_TARGET, 0x40, 0x1, BattleScript_EffectHit
	orword gHitMarker, HITMARKER_IGNORE_ON_AIR
	setbyte sDMG_MULTIPLIER, 0x2
	jump BattleScript_EffectHit

BattleScript_EffectFlinchMinimizeHit:: @ 81D7BCD
	jumpifspecialstatusflag BS_TARGET, 0x100, 0x1, BattleScript_81D7B08
	setbyte sDMG_MULTIPLIER, 0x2
	jump BattleScript_81D7B08

BattleScript_EffectSolarbeam:: @ 81D7BE3
	jumpifabilitypresent ABILITY_CLOUD_NINE, BattleScript_81D7BFB
	jumpifabilitypresent ABILITY_AIR_LOCK, BattleScript_81D7BFB
	jumpifhalfword CMP_COMMON_BITS, gBattleWeather, 0x60, BattleScript_81D7C23

BattleScript_81D7BFB:: @ 81D7BFB
	jumpifsecondarytstatus BS_ATTACKER, 0x1000, BattleScript_81D6F29
	jumpifword CMP_COMMON_BITS, gHitMarker, HITMARKER_NO_ATTACKSTRING, BattleScript_81D6F29
	setbyte sTWOTURN_STRINGID, 0x1
	callatk BattleScript_81D6F58
	jump BattleScript_MoveEnd

BattleScript_81D7C23:: @ 81D7C23
	orword gHitMarker, HITMARKER_CHARGING
	setbyte cEFFECT_CHOOSER, 0x4C
	seteffecttarget
	ppreduce
	jump BattleScript_81D6F29

BattleScript_EffectThunder:: @ 81D7C39
	setbyte cEFFECT_CHOOSER, 0x5
	orword gHitMarker, HITMARKER_IGNORE_ON_AIR
	jump BattleScript_EffectHit

BattleScript_EffectTeleport:: @ 81D7C4D
	attackcanceler
	attackstring
	ppreduce
	jumpifword CMP_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_TRAINER, BattleScript_ButItFailed
	atk76 0x1, BS_EFFECT_BATTLER
	jumpifbyte CMP_EQUAL, gBattleCommunication, 0x1, BattleScript_ButItFailed
	jumpifbyte CMP_EQUAL, gBattleCommunication, 0x2, BattleScript_81D8255
	attackanimation
	waitanimation
	printstring STRINGID_PKMNFLEDFROMBATTLE
	waitmessage 0x40
	setbyte gBattleOutcome, 0x5
	jump BattleScript_MoveEnd

BattleScript_EffectBeatUp:: @ 81D7C8A
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	pause 0x20
	ppreduce
	setbyte gBattleCommunication, 0x0

BattleScript_81D7C9D:: @ 81D7C9D
	atk25
	beatupcalculation BattleScript_81D7CE0, BattleScript_ButItFailed
	printstring STRINGID_PKMNATTACK
	critcalc
	jumpifbyte CMP_NOT_EQUAL, gCritMultiplier, 0x2, BattleScript_81D7CB8
	manipulatedamage 0x2

BattleScript_81D7CB8:: @ 81D7CB8
	atk7
	attackanimation
	waitanimation
	missmessage
	atk5c BS_TARGET
	waitstateatk
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	critmessage
	waitmessage 0x40
	resultmessage
	waitmessage 0x40
	faintpokemon BS_TARGET, 0x0, NULL
	setbyte sMOVEEND_STATE, 0x0
	atk49 0x2, 0x10
	jump BattleScript_81D7C9D

BattleScript_81D7CE0:: @ 81D7CE0
	end

BattleScript_EffectSemiInvulnerable:: @ 81D7CE1
	jumpifsecondarytstatus BS_ATTACKER, 0x1000, BattleScript_81D7D4F
	jumpifword CMP_COMMON_BITS, gHitMarker, HITMARKER_NO_ATTACKSTRING, BattleScript_81D7D4F
	jumpifhalfword CMP_EQUAL, gCurrentMove, 0x13, BattleScript_81D7D3E
	jumpifhalfword CMP_EQUAL, gCurrentMove, 0x123, BattleScript_81D7D33
	jumpifhalfword CMP_EQUAL, gCurrentMove, 0x154, BattleScript_81D7D28
	setbyte sTWOTURN_STRINGID, 0x5
	jump BattleScript_81D7D44

BattleScript_81D7D28:: @ 81D7D28
	setbyte sTWOTURN_STRINGID, 0x7
	jump BattleScript_81D7D44

BattleScript_81D7D33:: @ 81D7D33
	setbyte sTWOTURN_STRINGID, 0x6
	jump BattleScript_81D7D44

BattleScript_81D7D3E:: @ 81D7D3E
	setbyte sTWOTURN_STRINGID, 0x4

BattleScript_81D7D44:: @ 81D7D44
	callatk BattleScript_81D6F58
	hidepreattack
	jump BattleScript_MoveEnd

BattleScript_81D7D4F:: @ 81D7D4F
	attackcanceler
	setbyte cEFFECT_CHOOSER, 0xC
	setbyte sB_ANIM_TURN, 0x1
	clearstatus BS_ATTACKER
	orword gHitMarker, HITMARKER_NO_PPDEDUCT
	jumpifhalfword CMP_NOT_EQUAL, gCurrentMove, 0x154, BattleScript_81D7D79
	setbyte cEFFECT_CHOOSER, 0x5

BattleScript_81D7D79:: @ 81D7D79
	accuracycheck BattleScript_81D7D86, 0x0
	unhidepostattack
	jump BattleScript_81D692E

BattleScript_81D7D86:: @ 81D7D86
	unhidepostattack
	jump BattleScript_81D695E

BattleScript_EffectDefenseCurl:: @ 81D7D8C
	attackcanceler
	attackstring
	ppreduce
	setcurled
	setbyte sSTATCHANGER, 0x12
	statbuffchange 0x41, BattleScript_81D7DA9
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D6BC4
	attackanimation
	waitanimation

BattleScript_81D7DA9:: @ 81D7DA9
	jump BattleScript_81D6BBC

BattleScript_EffectSoftboiled:: @ 81D7DAE
	attackcanceler
	attackstring
	ppreduce
	setdamageasrestorehalfmaxhp BattleScript_AlreadyAtFullHp, 0x0

BattleScript_PresentHealTarget:: @ 81D7DB7
	attackanimation
	waitanimation
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	printstring STRINGID_PKMNREGAINEDHEALTH
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_AlreadyAtFullHp:: @ 81D7DD1
	pause 0x20
	printstring STRINGID_PKMNHPFULL
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectFakeOut:: @ 81D7DDF
	attackcanceler
	jumpifnotfirstturn BattleScript_81D7DF0
	setbyte cEFFECT_CHOOSER, 0x88
	jump BattleScript_EffectHit

BattleScript_81D7DF0:: @ 81D7DF0
	attackstring

BattleScript_81D7DF1:: @ 81D7DF1
	ppreduce

BattleScript_ButItFailed:: @ 81D7DF2
	pause 0x20
	orbyte gMoveResultFlags, 0x20
	resultmessage
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_81D7E04:: @ 81D7E04
	pause 0x20
	orbyte gMoveResultFlags, 0x8
	resultmessage
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectUproar:: @ 81D7E16
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	setbyte cEFFECT_CHOOSER, 0x4A
	attackstring
	jumpifsecondarytstatus BS_ATTACKER, 0x1000, BattleScript_81D7E30
	ppreduce

BattleScript_81D7E30:: @ 81D7E30
	nop3
	jump BattleScript_HitFromCritCalc

BattleScript_EffectStockpile:: @ 81D7E36
	attackcanceler
	attackstring
	ppreduce
	stockpile
	attackanimation
	waitanimation
	printfromtable gStockpileUsedStringIds
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectSpitUp:: @ 81D7E49
	attackcanceler
	jumpifbyte CMP_EQUAL, gBattleCommunication + 0x6, 0x1, BattleScript_81D7E78
	attackstring
	ppreduce
	accuracycheck BattleScript_81D695E, 0x0
	stockpiletobasedamage BattleScript_81D7E6A
	atk6
	atk69
	jump BattleScript_81D6934

BattleScript_81D7E6A:: @ 81D7E6A
	pause 0x20
	printstring STRINGID_FAILEDTOSPITUP
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_81D7E78:: @ 81D7E78
	attackstring
	ppreduce
	pause 0x40
	stockpiletobasedamage BattleScript_81D7E6A
	resultmessage
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectSwallow:: @ 81D7E8B
	attackcanceler
	attackstring
	ppreduce
	stockpiletohprecovery BattleScript_81D7E98
	jump BattleScript_PresentHealTarget

BattleScript_81D7E98:: @ 81D7E98
	pause 0x20
	printfromtable gSwallowFailStringIds
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectHail:: @ 81D7EA8
	attackcanceler
	attackstring
	ppreduce
	sethail
	jump BattleScript_81D7A14

BattleScript_EffectTorment:: @ 81D7EB1
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 0x0
	settorment BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSUBJECTEDTOTORMENT
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectFlatter:: @ 81D7ECD
	attackcanceler
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_81D6958
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	jumpifconfusedandattackmaxed BS_ATTACKER_WITH_PARTNER, BattleScript_ButItFailed
	attackanimation
	waitanimation
	setbyte sSTATCHANGER, 0x14
	statbuffchange 0x1, BattleScript_81D7F10
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D7F10
	atk47
	playanimation BS_TARGET, B_ANIM_STATS_CHANGE, sB_ANIM_ARG1
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D7F10:: @ 81D7F10
	jumpifability BS_TARGET, ABILITY_OWN_TEMPO, BattleScript_81D9460
	jumpifhalverset BS_TARGET, 0x20, BattleScript_81D8B39
	setbyte cEFFECT_CHOOSER, 0x7
	seteffecttarget
	jump BattleScript_MoveEnd

BattleScript_EffectWillOWisp:: @ 81D7F2B
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_ButItFailed
	jumpifstatus BS_TARGET, 0x10, BattleScript_81D7F91
	jumpiftype BS_TARGET, 0xA, BattleScript_81D7E04
	jumpifability BS_TARGET, ABILITY_WATER_VEIL, BattleScript_81D7F77
	jumpifstatus BS_TARGET, 0xFF, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, 0x0
	jumpifhalverset BS_TARGET, 0x20, BattleScript_81D8B39
	attackanimation
	waitanimation
	setbyte cEFFECT_CHOOSER, 0x3
	seteffecttarget
	jump BattleScript_MoveEnd

BattleScript_81D7F77:: @ 81D7F77
	copyarray gEffectBattler, gBattlerTarget, 0x1
	setbyte cMULTISTRING_CHOOSER, 0x0
	callatk BattleScript_BRNPrevention
	jump BattleScript_MoveEnd

BattleScript_81D7F91:: @ 81D7F91
	pause 0x20
	printstring STRINGID_PKMNALREADYHASBURN
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectMemento:: @ 81D7F9F
	attackcanceler
	jumpifbyte CMP_EQUAL, gBattleCommunication + 0x6, 0x1, BattleScript_81D8026
	attackstring
	ppreduce
	jumpifattackandspecialattackcannotfall BattleScript_ButItFailed
	setuserhptozero
	attackanimation
	waitanimation
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_81D801B
	setbyte sSTAT_ANIM_PLAYED, 0x0
	playstatchangeanimation BS_TARGET, 0x12, 0x7
	playstatchangeanimation BS_TARGET, 0x2, 0x3
	setbyte sSTATCHANGER, 0xA1
	statbuffchange 0x1, BattleScript_81D7FEC
	jumpifbyte CMP_GREATER_THAN, cMULTISTRING_CHOOSER, 0x1, BattleScript_81D7FEC
	printfromtable gStatDownStringIds
	waitmessage 0x40

BattleScript_81D7FEC:: @ 81D7FEC
	playstatchangeanimation BS_TARGET, 0x10, 0x3
	setbyte sSTATCHANGER, 0xA4
	statbuffchange 0x1, BattleScript_81D800F
	jumpifbyte CMP_GREATER_THAN, cMULTISTRING_CHOOSER, 0x1, BattleScript_81D800F
	printfromtable gStatDownStringIds
	waitmessage 0x40

BattleScript_81D800F:: @ 81D800F
	faintpokemon BS_ATTACKER, 0x0, NULL
	jump BattleScript_MoveEnd

BattleScript_81D801B:: @ 81D801B
	printstring STRINGID_BUTNOEFFECT
	waitmessage 0x40
	jump BattleScript_81D800F

BattleScript_81D8026:: @ 81D8026
	attackstring
	ppreduce
	jumpifattackandspecialattackcannotfall BattleScript_81D802D

BattleScript_81D802D:: @ 81D802D
	setuserhptozero
	pause 0x40
	missmessage
	resultmessage
	waitmessage 0x40
	faintpokemon BS_ATTACKER, 0x0, NULL
	jump BattleScript_MoveEnd

BattleScript_EffectFacade:: @ 81D8042
	jumpifstatus BS_ATTACKER, 0xD8, BattleScript_81D8051
	jump BattleScript_EffectHit

BattleScript_81D8051:: @ 81D8051
	setbyte sDMG_MULTIPLIER, 0x2
	jump BattleScript_EffectHit

BattleScript_EffectFocusPunch:: @ 81D805C
	attackcanceler
	jumpifnodamage BattleScript_81D6927
	ppreduce
	printstring STRINGID_PKMNLOSTFOCUS
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectSmellingsalt:: @ 81D806E
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_EffectHit
	setbyte cEFFECT_CHOOSER, 0xA4
	jumpifstatus BS_TARGET, 0x40, BattleScript_81D808D
	jump BattleScript_EffectHit

BattleScript_81D808D:: @ 81D808D
	setbyte sDMG_MULTIPLIER, 0x2
	jump BattleScript_EffectHit

BattleScript_EffectFollowMe:: @ 81D8098
	attackcanceler
	attackstring
	ppreduce
	setforcedtarget
	attackanimation
	waitanimation
	printstring STRINGID_PKMNCENTERATTENTION
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectNaturePower:: @ 81D80A9
	attackcanceler
	attackstring
	pause 0x20
	callterrainattack
	printstring STRINGID_NATUREPOWERTURNEDINTO
	waitmessage 0x40
	return

BattleScript_EffectCharge:: @ 81D80B6
	attackcanceler
	attackstring
	ppreduce
	setcharge
	attackanimation
	waitanimation
	printstring STRINGID_PKMNCHARGINGPOWER
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectTaunt:: @ 81D80C7
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 0x0
	settaunt BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNFELLFORTAUNT
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectHelpingHand:: @ 81D80E3
	attackcanceler
	attackstring
	ppreduce
	sethelpinghand BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNREADYTOHELP
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectTrick:: @ 81D80F8
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, 0x0
	itemswap BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSWITCHEDITEMS
	waitmessage 0x40
	printfromtable gItemSwapStringIds
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectRolePlay:: @ 81D8126
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 0xFFFF
	copyability BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNCOPIEDFOE
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectWish:: @ 81D8142
	attackcanceler
	attackstring
	ppreduce
	atkd4 0x0, BattleScript_ButItFailed
	attackanimation
	waitanimation
	jump BattleScript_MoveEnd

BattleScript_EffectAssist:: @ 81D8152
	attackcanceler
	attackstring
	assistattackselect BattleScript_81D7DF1
	attackanimation
	waitanimation
	setbyte sB_ANIM_TURN, 0x0
	setbyte sB_ANIM_TARGETS_HIT, 0x0
	jumptoattack BS_ATTACKER

BattleScript_EffectIngrain:: @ 81D8169
	attackcanceler
	attackstring
	ppreduce
	setroots BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNPLANTEDROOTS
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectSuperpower:: @ 81D817E
	setbyte cEFFECT_CHOOSER, 0xE5
	jump BattleScript_EffectHit

BattleScript_EffectMagicCoat:: @ 81D8189
	attackcanceler
	setmagiccoat BattleScript_81D7DF0
	attackstring
	ppreduce
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSHROUDEDITSELF
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectRecycle:: @ 81D819E
	attackcanceler
	attackstring
	ppreduce
	recycleitem BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_XFOUNDONEY
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectRevenge:: @ 81D81B3
	doubledamagedealtifdamaged
	jump BattleScript_EffectHit

BattleScript_EffectBrickBreak:: @ 81D81B9
	attackcanceler
	accuracycheck BattleScript_81D695E, 0x0
	attackstring
	ppreduce
	removereflectlightscreen
	critcalc
	atk5
	atk6
	atk7
	jumpifbyte CMP_EQUAL, sB_ANIM_TURN, 0x0, BattleScript_81D81D9
	bicbyte gMoveResultFlags, 0x9

BattleScript_81D81D9:: @ 81D81D9
	attackanimation
	waitanimation
	jumpifbyte CMP_LESS_THAN, sB_ANIM_TURN, 0x2, BattleScript_81D81EC
	printstring STRINGID_THEWALLSHATTERED
	waitmessage 0x40

BattleScript_81D81EC:: @ 81D81EC
	damagecalc2
	missmessage
	atk5c BS_TARGET
	waitstateatk
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	critmessage
	waitmessage 0x40
	resultmessage
	waitmessage 0x40
	seteffectwithchancetarget
	faintpokemon BS_TARGET, 0x0, NULL
	jump BattleScript_MoveEnd

BattleScript_EffectYawn:: @ 81D820A
	attackcanceler
	attackstring
	ppreduce
	jumpifability BS_TARGET, ABILITY_VITAL_SPIRIT, BattleScript_81D824B
	jumpifability BS_TARGET, ABILITY_INSOMNIA, BattleScript_81D824B
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_ButItFailed
	jumpifhalverset BS_TARGET, 0x20, BattleScript_81D8B39
	accuracycheck BattleScript_ButItFailed, 0xFFFF
	jumpifcannotsleep BattleScript_ButItFailed
	setyawn BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNWASMADEDROWSY
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_81D824B:: @ 81D824B
	copyarray sBATTLER, sBATTLER_WITH_ABILITY, 0x1

BattleScript_81D8255:: @ 81D8255
	pause 0x20
	printstring STRINGID_PKMNSXMADEITINEFFECTIVE
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectKnockOff:: @ 81D8263
	setbyte cEFFECT_CHOOSER, 0x36
	jump BattleScript_EffectHit

BattleScript_EffectEndeavor:: @ 81D826E
	attackcanceler
	attackstring
	ppreduce
	setdamagetohealthdifference BattleScript_ButItFailed
	copyarray gHpDealt, gBattleMoveDamage, 0x4
	accuracycheck BattleScript_MoveMissedPause, 0x0
	atk6
	jumpifbyte CMP_COMMON_BITS, gMoveResultFlags, 0x29, BattleScript_81D6934
	bicbyte gMoveResultFlags, 0x6
	copyarray gBattleMoveDamage, gHpDealt, 0x4
	atk69
	jump BattleScript_81D6934

BattleScript_EffectEruption:: @ 81D82A9
	scaledamagebyhealthratio
	jump BattleScript_EffectHit

BattleScript_EffectSkillSwap:: @ 81D82AF
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 0xFFFF
	abilityswap BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSWAPPEDABILITIES
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectImprison:: @ 81D82CB
	attackcanceler
	attackstring
	ppreduce
	imprisoneffect BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSEALEDOPPONENTMOVE
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectRefresh:: @ 81D82E0
	attackcanceler
	attackstring
	ppreduce
	cureifburnedparalysedorpoisoned BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNSTATUSNORMAL
	waitmessage 0x40
	atk98 0x1
	jump BattleScript_MoveEnd

BattleScript_EffectGrudge:: @ 81D82F7
	attackcanceler
	attackstring
	ppreduce
	setgrudge BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNWANTSGRUDGE
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectSnatch:: @ 81D830C
	attackcanceler
	setstealstatchange BattleScript_81D7DF0
	attackstring
	ppreduce
	attackanimation
	waitanimation
	pause 0x20
	printstring STRINGID_PKMNWAITSFORTARGET
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectLowKick:: @ 81D8324
	attackcanceler
	attackstring
	ppreduce
	weightdamagecalculation
	accuracycheck BattleScript_MoveMissedPause, 0x0
	jump BattleScript_HitFromCritCalc

BattleScript_EffectSecretPower:: @ 81D8334
	naturepowereffect
	jump BattleScript_EffectHit

BattleScript_EffectDoubleEdge:: @ 81D833A
	setbyte cEFFECT_CHOOSER, 0xE6
	jump BattleScript_EffectHit

BattleScript_EffectTeeterDance:: @ 81D8345
	attackcanceler
	attackstring
	ppreduce
	setbyte gBattlerTarget, 0x0

BattleScript_81D834E:: @ 81D834E
	atk25
	setbyte cEFFECT_CHOOSER, 0x7
	jumpifarrayequal gBattlerAttacker, gBattlerTarget, 0x1, BattleScript_81D8394
	jumpifability BS_TARGET, ABILITY_OWN_TEMPO, BattleScript_81D83B2
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_81D83CE
	jumpifsecondarytstatus BS_TARGET, 0x7, BattleScript_81D83DC
	accuracycheck BattleScript_81D83EA, 0x0
	jumpifhalverset BS_TARGET, 0x20, BattleScript_81D83C0
	attackanimation
	waitanimation
	seteffecttarget
	resultmessage
	waitmessage 0x40

BattleScript_81D8394:: @ 81D8394
	setbyte sMOVEEND_STATE, 0x0
	atk49 0x2, 0x10
	addbyte gBattlerTarget, 0x1
	jumpifarraynotequal gBattlerTarget, gBattlersCount, 0x1, BattleScript_81D834E
	end

BattleScript_81D83B2:: @ 81D83B2
	pause 0x20
	printstring STRINGID_PKMNPREVENTSCONFUSIONWITH
	waitmessage 0x40
	jump BattleScript_81D8394

BattleScript_81D83C0:: @ 81D83C0
	pause 0x20
	printstring STRINGID_PKMNUSEDSAFEGUARD
	waitmessage 0x40
	jump BattleScript_81D8394

BattleScript_81D83CE:: @ 81D83CE
	pause 0x20
	printstring STRINGID_BUTITFAILED
	waitmessage 0x40
	jump BattleScript_81D8394

BattleScript_81D83DC:: @ 81D83DC
	pause 0x20
	printstring STRINGID_PKMNALREADYCONFUSED
	waitmessage 0x40
	jump BattleScript_81D8394

BattleScript_81D83EA:: @ 81D83EA
	resultmessage
	waitmessage 0x40
	jump BattleScript_81D8394

BattleScript_EffectMudSport:: @ 81D83F3
	attackcanceler
	attackstring
	ppreduce
	settypebasedhalvers BattleScript_ButItFailed
	attackanimation
	waitanimation
	printfromtable gSportsUsedStringIds
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectPoisonFang:: @ 81D840A
	setbyte cEFFECT_CHOOSER, 0x6
	jump BattleScript_EffectHit

BattleScript_EffectWeatherBall:: @ 81D8415
	seteffectbyweather
	jump BattleScript_EffectHit

BattleScript_EffectOverheat:: @ 81D841B
	setbyte cEFFECT_CHOOSER, 0xFB
	jump BattleScript_EffectHit

BattleScript_EffectTickle:: @ 81D8426
	attackcanceler
	attackstring
	ppreduce
	jumpifstat BS_TARGET, CMP_GREATER_THAN, STAT_ATK, 0x0, BattleScript_81D843B
	jumpifstat BS_TARGET, CMP_EQUAL, STAT_DEF, 0x0, BattleScript_81D8499

BattleScript_81D843B:: @ 81D843B
	accuracycheck BattleScript_ButItFailed, 0x0
	attackanimation
	waitanimation
	setbyte sSTAT_ANIM_PLAYED, 0x0
	playstatchangeanimation BS_TARGET, 0x6, 0x5
	playstatchangeanimation BS_TARGET, 0x2, 0x1
	setbyte sSTATCHANGER, 0x91
	statbuffchange 0x1, BattleScript_81D8471
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D8471
	printfromtable gStatDownStringIds
	waitmessage 0x40

BattleScript_81D8471:: @ 81D8471
	playstatchangeanimation BS_TARGET, 0x4, 0x1
	setbyte sSTATCHANGER, 0x92
	statbuffchange 0x1, BattleScript_81D8494
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D8494
	printfromtable gStatDownStringIds
	waitmessage 0x40

BattleScript_81D8494:: @ 81D8494
	jump BattleScript_MoveEnd

BattleScript_81D8499:: @ 81D8499
	pause 0x20
	orbyte gMoveResultFlags, 0x20
	printstring STRINGID_STATSWONTDECREASE2
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectCosmicPower:: @ 81D84AD
	attackcanceler
	attackstring
	ppreduce
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_DEF, 0xC, BattleScript_81D84C2
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPDEF, 0xC, BattleScript_81D85E7

BattleScript_81D84C2:: @ 81D84C2
	attackanimation
	waitanimation
	setbyte sSTAT_ANIM_PLAYED, 0x0
	playstatchangeanimation BS_ATTACKER, 0x24, 0x0
	setbyte sSTATCHANGER, 0x12
	statbuffchange 0x41, BattleScript_81D84ED
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D84ED
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D84ED:: @ 81D84ED
	setbyte sSTATCHANGER, 0x15
	statbuffchange 0x41, BattleScript_81D850C
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D850C
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D850C:: @ 81D850C
	jump BattleScript_MoveEnd

BattleScript_EffectSkyUppercut:: @ 81D8511
	orword gHitMarker, HITMARKER_IGNORE_ON_AIR
	jump BattleScript_EffectHit

BattleScript_EffectBulkUp:: @ 81D851F
	attackcanceler
	attackstring
	ppreduce
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_ATK, 0xC, BattleScript_81D8534
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_DEF, 0xC, BattleScript_81D85E7

BattleScript_81D8534:: @ 81D8534
	attackanimation
	waitanimation
	setbyte sSTAT_ANIM_PLAYED, 0x0
	playstatchangeanimation BS_ATTACKER, 0x6, 0x0
	setbyte sSTATCHANGER, 0x11
	statbuffchange 0x41, BattleScript_81D855F
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D855F
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D855F:: @ 81D855F
	setbyte sSTATCHANGER, 0x12
	statbuffchange 0x41, BattleScript_81D857E
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D857E
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D857E:: @ 81D857E
	jump BattleScript_MoveEnd

BattleScript_EffectCalmMind:: @ 81D8583
	attackcanceler
	attackstring
	ppreduce
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPATK, 0xC, BattleScript_81D8598
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPDEF, 0xC, BattleScript_81D85E7

BattleScript_81D8598:: @ 81D8598
	attackanimation
	waitanimation
	setbyte sSTAT_ANIM_PLAYED, 0x0
	playstatchangeanimation BS_ATTACKER, 0x30, 0x0
	setbyte sSTATCHANGER, 0x14
	statbuffchange 0x41, BattleScript_81D85C3
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D85C3
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D85C3:: @ 81D85C3
	setbyte sSTATCHANGER, 0x15
	statbuffchange 0x41, BattleScript_81D85E2
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D85E2
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D85E2:: @ 81D85E2
	jump BattleScript_MoveEnd

BattleScript_81D85E7:: @ 81D85E7
	pause 0x20
	orbyte gMoveResultFlags, 0x20
	printstring STRINGID_STATSWONTINCREASE2
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_EffectDragonDance:: @ 81D85FB
	attackcanceler
	attackstring
	ppreduce
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_ATK, 0xC, BattleScript_81D8610
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPEED, 0xC, BattleScript_81D85E7

BattleScript_81D8610:: @ 81D8610
	attackanimation
	waitanimation
	setbyte sSTAT_ANIM_PLAYED, 0x0
	playstatchangeanimation BS_ATTACKER, 0xA, 0x0
	setbyte sSTATCHANGER, 0x11
	statbuffchange 0x41, BattleScript_81D863B
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D863B
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D863B:: @ 81D863B
	setbyte sSTATCHANGER, 0x13
	statbuffchange 0x41, BattleScript_81D865A
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D865A
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D865A:: @ 81D865A
	jump BattleScript_MoveEnd

BattleScript_EffectCamouflage:: @ 81D865F
	attackcanceler
	attackstring
	ppreduce
	settypetoterrain BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring STRINGID_PKMNCHANGEDTYPE
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_FaintAttacker:: @ 81D8674
	atk56 0x1
	pause 0x40
	atk1a 0x1
	atk1b BS_ATTACKER
	printstring STRINGID_ATTACKERFAINTED
	printstring STRINGID_EMPTYSTRING3
	return

BattleScript_FaintTarget:: @ 81D8684
	atk56 0x0
	pause 0x40
	atk1a 0x0
	atk1b BS_TARGET
	printstring STRINGID_TARGETFAINTED
	printstring STRINGID_EMPTYSTRING3
	return

BattleScript_GiveExp:: @ 81D8694
	setbyte sGIVEEXP_STATE, 0x0
	atk23 BS_TARGET
	end2

BattleScript_HandleFaintedMon:: @ 81D869D
	atk24 BattleScript_81D87B8
	jumpifbyte CMP_NOT_EQUAL, gBattleOutcome, 0x0, BattleScript_81D87B7
	jumpifword CMP_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_TRAINER, BattleScript_81D86E6
	jumpifword CMP_NO_COMMON_BITS, gHitMarker, HITMARKER_x400000, BattleScript_81D86E6
	printstring STRINGID_USENEXTPKMN
	setbyte gBattleCommunication, 0x0
	atk67
	jumpifbyte CMP_EQUAL, gBattleCommunication + 0x1, 0x0, BattleScript_81D86E6
	atk72 BattleScript_81D87B7
	printstring STRINGID_CANTESCAPE2

BattleScript_81D86E6:: @ 81D86E6
	openpartyscreen 0x3, BattleScript_81D87B7
	atk51 BS_FAINTED, 0x2
	jumpifword CMP_NO_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_TRAINER, BattleScript_81D8792
	jumpifword CMP_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_LINK, BattleScript_81D8792
	jumpifword CMP_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_BATTLE_TOWER, BattleScript_81D8792
	jumpifword CMP_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_DOUBLE, BattleScript_81D8792
	jumpifword CMP_COMMON_BITS, gHitMarker, HITMARKER_x400000, BattleScript_81D8792
	jumpifbyte CMP_EQUAL, sBATTLE_STYLE, 0x1, BattleScript_81D8792
	jumpifcannotswitch BS_PLAYER1, BattleScript_81D8792
	printstring STRINGID_ENEMYABOUTTOSWITCHPKMN
	setbyte gBattleCommunication, 0x0
	atk67
	jumpifbyte CMP_EQUAL, gBattleCommunication + 0x1, 0x1, BattleScript_81D8792
	atk6e
	openpartyscreen 0x81, BattleScript_81D8792
	atk51 BS_ATTACKER, 0x2
	jumpifbyte CMP_EQUAL, gBattleCommunication, 0x6, BattleScript_81D8792
	atk6b
	atk76 0x1, 0x5
	atk74 BS_ATTACKER
	printstring STRINGID_RETURNMON
	atke2 BS_ATTACKER
	waitstateatk
	atk4b
	waitstateatk
	atk61 0x1
	switch1 BS_ATTACKER
	switch2 BS_ATTACKER
	atk73 BS_ATTACKER
	printstring STRINGID_SWITCHINMON
	atk62_hidepartystatussummary 0x1
	switch3 BS_ATTACKER, 0x0
	waitstateatk
	atk52 BS_ATTACKER
	atk6d

BattleScript_81D8792:: @ 81D8792
	atk61 0x3
	switch1 BS_FAINTED
	switch2 BS_FAINTED
	atk73 BS_FAINTED
	printstring STRINGID_SWITCHINMON
	atk62_hidepartystatussummary 0x3
	switch3 BS_FAINTED, 0x0
	waitstateatk
	atk76 0x1, BS_BATTLER_0
	atk52 BS_FAINTED
	jumpifword CMP_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_DOUBLE, BattleScript_81D87B7
	atk68

BattleScript_81D87B7:: @ 81D87B7
	end2

BattleScript_81D87B8:: @ 81D87B8
	openpartyscreen 0x5, BattleScript_81D87BE

BattleScript_81D87BE:: @ 81D87BE
	atk51 BS_FAINTED, 0x0
	openpartyscreen 0x6, BattleScript_81D87EE
	atk51 BS_FAINTED, 0x0

BattleScript_81D87CA:: @ 81D87CA
	atk51 BS_FAINTED, 0x2
	atk61 0x3
	switch1 BS_FAINTED
	switch2 BS_FAINTED
	atk73 BS_FAINTED
	printstring STRINGID_SWITCHINMON
	atk62_hidepartystatussummary 0x3
	switch3 BS_FAINTED, 0x0
	waitstateatk
	atk52 0x5
	jumpifarraynotequal gBattlerFainted, gBattlersCount, 0x1, BattleScript_81D87CA

BattleScript_81D87EE:: @ 81D87EE
	end2

BattleScript_LocalTrainerBattleWon:: @ 81D87EF
	printstring STRINGID_PLAYERDEFEATEDTRAINER1
	atk53 BS_ATTACKER
	waitstateatk
	printstring STRINGID_TRAINER1LOSETEXT
	atk5d BattleScript_81D87FD

BattleScript_81D87FD:: @ 81D87FD
	printstring STRINGID_PLAYERGOTMONEY
	waitmessage 0x40

BattleScript_PayDayMoneyAndPickUpItems:: @ 81D8803
	givemoney
	pickupitemcalculation
	end2

BattleScript_LocalBattleLost:: @ 81D8806
	jumpifword CMP_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_TRAINER_TOWER, BattleScript_81D8896
	jumpifword CMP_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_EREADER_TRAINER, BattleScript_81D886E
	jumpifhalfword CMP_EQUAL, gTrainerBattleOpponent_A, 0x400, BattleScript_81D886E
	jumpifbyte CMP_NOT_EQUAL, cMULTISTRING_CHOOSER, 0x0, BattleScript_81D8876

BattleScript_81D8839:: @ 81D8839
	jumpifword CMP_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_TRAINER, BattleScript_81D885D
	printstring STRINGID_PLAYERWHITEOUT
	waitmessage 0x40
	atk5d BattleScript_81D886F
	printstring STRINGID_PLAYERWHITEOUT2
	waitmessage 0x40
	jump BattleScript_81D886E

BattleScript_81D885D:: @ 81D885D
	printstring STRINGID_PLAYERLOSTAGAINSTENEMYTRAINER
	waitmessage 0x40
	atk5d BattleScript_81D886F
	printstring STRINGID_PLAYERPAIDPRIZEMONEY
	waitmessage 0x40

BattleScript_81D886E:: @ 81D886E
	end2

BattleScript_81D886F:: @ 81D886F
	printstring STRINGID_PLAYERWHITEDOUT
	waitmessage 0x40
	end2

BattleScript_81D8876:: @ 81D8876
	jumpiffainted BS_ATTACKER, BattleScript_81D8884
	printstring STRINGID_TRAINER1MON1COMEBACK
	waitmessage 0x40
	atk4b
	waitstateatk

BattleScript_81D8884:: @ 81D8884
	atk53 BS_ATTACKER
	waitstateatk
	printstring STRINGID_TRAINER1WINTEXT
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D8839
	end2

BattleScript_81D8896:: @ 81D8896
	atk76 0x1, BS_ATTACKER_SIDE
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x0, BattleScript_81D88B4
	printfromtable gDoubleBattleRecallStrings
	waitmessage 0x40
	atk76 0x1, BS_NOT_ATTACKER_SIDE
	waitstateatk
	atk76 0x1, BS_SCRIPTING
	waitstateatk

BattleScript_81D88B4:: @ 81D88B4
	atk53 BS_ATTACKER
	waitstateatk
	printstring STRINGID_TRAINER1WINTEXT
	jumpifword CMP_NO_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_DOUBLE, BattleScript_81D88CB
	printstring STRINGID_TRAINER2NAME

BattleScript_81D88CB:: @ 81D88CB
	end2

BattleScript_LinkBattleWonOrLost:: @ 81D88CC
	printstring STRINGID_BATTLEEND
	waitmessage 0x40
	atk57
	waitmessage 0x40
	end2

gUnknown_81D88D7:: @ 81D88D7
	printstring STRINGID_PLAYERDEFEATEDTRAINER1
	atk53 BS_ATTACKER
	waitstateatk
	jumpifword CMP_NO_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_TRAINER_TOWER, BattleScript_81D88FF
	printstring STRINGID_TRAINER1LOSETEXT
	jumpifword CMP_NO_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_DOUBLE, BattleScript_81D88FF
	printstring STRINGID_TRAINER2CLASS

BattleScript_81D88FF:: @ 81D88FF
	pickupitemcalculation
	end2

BattleScript_SmokeBallEscape:: @ 81D8901
	playanimation BS_ATTACKER, B_ANIM_SMOKEBALL_ESCAPE, NULL
	printstring STRINGID_PKMNFLEDUSINGITS
	waitmessage 0x40
	end2

BattleScript_RanAwayUsingMonAbility:: @ 81D890F
	printstring STRINGID_PKMNFLEDUSING
	waitmessage 0x40
	end2

BattleScript_GotAwaySafely:: @ 81D8916
	printstring STRINGID_GOTAWAYSAFELY
	waitmessage 0x40
	end2

BattleScript_WildMonFled:: @ 81D891D
	printstring STRINGID_WILDPKMNFLED
	waitmessage 0x40
	end2

BattleScript_PrintCantRunFromTrainer:: @ 81D8924
	jumpifword CMP_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_FIRST_BATTLE, BattleScript_81D8936
	printstring STRINGID_NORUNNINGFROMTRAINERS
	end2

BattleScript_81D8936:: @ 81D8936
	printstring STRINGID_DONTLEAVEBIRCH
	end2

BattleScript_PrintFailedToRunString:: @ 81D893A
	printfromtable gNoEscapeStringIds
	waitmessage 0x40
	end2

BattleScript_PrintCantEscapeFromBattle:: @ 81D8943
	printfromtable2 gNoEscapeStringIds
	atk44

BattleScript_PrintFullBox:: @ 81D8949
	printstring2 STRINGID_BOXISFULL
	atk44

BattleScript_ActionSwitch:: @ 81D894D
	atk74 BS_ATTACKER
	printstring STRINGID_RETURNMON
	setbyte sDMG_MULTIPLIER, 0x2
	jumpifword CMP_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_DOUBLE, BattleScript_81D896D
	atk26 0x1
	jump BattleScript_81D896F

BattleScript_81D896D:: @ 81D896D
	atk26 0x2

BattleScript_81D896F:: @ 81D896F
	atkba BattleScript_81D897C
	atk5f
	atkab
	callatk BattleScript_81D89AF
	atk5f

BattleScript_81D897C:: @ 81D897C
	atk27 BattleScript_81D896F
	atke2 BS_ATTACKER
	waitstateatk
	atk4b
	waitstateatk
	atk61 0x1
	atk51 BS_ATTACKER, 0x1
	switch1 BS_ATTACKER
	switch2 BS_ATTACKER
	atk73 BS_ATTACKER
	printstring STRINGID_SWITCHINMON
	atk62_hidepartystatussummary 0x1
	switch3 BS_ATTACKER, 0x0
	waitstateatk
	atk52 BS_ATTACKER
	setbyte sMOVEEND_STATE, 0x4
	atk49 0x1, 0x0
	setbyte sMOVEEND_STATE, 0xF
	atk49 0x1, 0x0
	end2

BattleScript_81D89AF:: @ 81D89AF
	pause 0x20
	attackstring
	ppreduce
	critcalc
	atk5
	atk6
	atk7
	attackanimation
	waitanimation
	missmessage
	atk5c BS_TARGET
	waitstateatk
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	critmessage
	waitmessage 0x40
	resultmessage
	waitmessage 0x40
	faintpokemon BS_TARGET, 0x0, NULL
	setbyte sMOVEEND_STATE, 0x3
	atk49 0x2, 0x6
	atk76 0x0, BS_ATTACKER_WITH_PARTNER
	jumpifbyte CMP_EQUAL, gBattleCommunication, 0x0, BattleScript_81D89F0
	setbyte sGIVEEXP_STATE, 0x0
	atk23 BS_TARGET

BattleScript_81D89F0:: @ 81D89F0
	return

BattleScript_Pausex20:: @ 81D89F1
	pause 0x20
	return

BattleScript_LevelUp:: @ 81D89F5
	atk55 MUS_FANFA1
	printstring STRINGID_PKMNGREWTOLV
	setbyte sLVLBOX_STATE, 0x0
	atk6c
	checkiflearnmoveinbattle BattleScript_81D8A51, BattleScript_81D8A63, 0x1
	jump BattleScript_81D8A1B

BattleScript_81D8A11:: @ 81D8A11
	checkiflearnmoveinbattle BattleScript_81D8A51, BattleScript_81D8A63, 0x0

BattleScript_81D8A1B:: @ 81D8A1B
	atk71
	printstring STRINGID_TRYTOLEARNMOVE1
	printstring STRINGID_TRYTOLEARNMOVE2
	printstring STRINGID_TRYTOLEARNMOVE3
	waitstateatk
	setbyte sLEARNMOVE_STATE, 0x0
	atk5a BattleScript_81D8A48
	printstring STRINGID_STOPLEARNINGMOVE
	waitstateatk
	setbyte sLEARNMOVE_STATE, 0x0
	atk5b BattleScript_81D8A1B
	printstring STRINGID_DIDNOTLEARNMOVE
	jump BattleScript_81D8A11

BattleScript_81D8A48:: @ 81D8A48
	printstring STRINGID_123POOF
	printstring STRINGID_PKMNFORGOTMOVE
	printstring STRINGID_ANDELLIPSIS

BattleScript_81D8A51:: @ 81D8A51
	atk71
	atk55 MUS_FANFA1
	printstring STRINGID_PKMNLEARNEDMOVE
	waitmessage 0x40
	atk76 0x1, 0x6
	jump BattleScript_81D8A11

BattleScript_81D8A63:: @ 81D8A63
	return

BattleScript_RainContinuesOrEnds:: @ 81D8A64
	printfromtable gRainContinuesStringIds
	waitmessage 0x40
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D8A7E
	playanimation BS_ATTACKER, B_ANIM_RAIN_CONTINUES, NULL

BattleScript_81D8A7E:: @ 81D8A7E
	end2

BattleScript_DamagingWeatherContinues:: @ 81D8A7F
	printfromtable gSandStormHailContinuesStringIds
	waitmessage 0x40
	atk46 BS_ATTACKER, sB_ANIM_ARG1, NULL
	setbyte gBattleCommunication, 0x0

BattleScript_81D8A97:: @ 81D8A97
	atk32 gBattlerAttacker, gBattlerByTurnOrder, gBattleCommunication, 0x1
	weatherdamage
	jumpifword CMP_EQUAL, gBattleMoveDamage, NULL, BattleScript_81D8AD8
	printfromtable gSandStormHailDmgStringIds
	waitmessage 0x40
	orword gHitMarker, HITMARKER_x20 | HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000 | HITMARKER_GRUDGE
	missmessage
	atk5c BS_ATTACKER
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	faintpokemon BS_ATTACKER, 0x0, NULL
	atk24 BattleScript_81D8AD8

BattleScript_81D8AD8:: @ 81D8AD8
	jumpifbyte CMP_NOT_EQUAL, gBattleOutcome, 0x0, BattleScript_81D8AF7
	addbyte gBattleCommunication, 0x1
	jumpifarraynotequal gBattleCommunication, gBattlersCount, 0x1, BattleScript_81D8A97

BattleScript_81D8AF7:: @ 81D8AF7
	bicword gHitMarker, 0x1100120
	end2

BattleScript_SandStormHailEnds:: @ 81D8B01
	printfromtable gSandStormHailEndStringIds
	waitmessage 0x40
	end2

BattleScript_SunlightContinues:: @ 81D8B0A
	printstring STRINGID_SUNLIGHTSTRONG
	waitmessage 0x40
	playanimation BS_ATTACKER, B_ANIM_SUN_CONTINUES, NULL
	end2

BattleScript_SunlightFaded:: @ 81D8B18
	printstring STRINGID_SUNLIGHTFADED
	waitmessage 0x40
	end2

BattleScript_OverworldWeatherStarts:: @ 81D8B1F
	printfromtable gWeatherContinuesStringIds
	waitmessage 0x40
	atk46 BS_ATTACKER, sB_ANIM_ARG1, NULL
	end3

BattleScript_SideStatusWoreOff:: @ 81D8B32
	printstring STRINGID_PKMNSXWOREOFF
	waitmessage 0x40
	end2

BattleScript_81D8B39:: @ 81D8B39
	pause 0x20
	printstring STRINGID_PKMNUSEDSAFEGUARD
	waitmessage 0x40
	end2

BattleScript_SafeguardEnds:: @ 81D8B43
	pause 0x20
	printstring STRINGID_PKMNSAFEGUARDEXPIRED
	waitmessage 0x40
	end2

BattleScript_LeechSeedTurnDrain:: @ 81D8B4D
	playanimation BS_ATTACKER, B_ANIM_LEECH_SEED_DRAIN, sB_ANIM_ARG1
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	copyarray gBattleMoveDamage, gHpDealt, 0x4
	jumpifability BS_ATTACKER, ABILITY_LIQUID_OOZE, BattleScript_81D8B7F
	manipulatedamage 0x0
	setbyte cMULTISTRING_CHOOSER, 0x3
	jump BattleScript_81D8B85

BattleScript_81D8B7F:: @ 81D8B7F
	setbyte cMULTISTRING_CHOOSER, 0x4

BattleScript_81D8B85:: @ 81D8B85
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	printfromtable gLeechSeedStringIds
	waitmessage 0x40
	faintpokemon BS_ATTACKER, 0x0, NULL
	faintpokemon BS_TARGET, 0x0, NULL
	end2

BattleScript_BideStoringEnergy:: @ 81D8BA9
	printstring STRINGID_PKMNSTORINGENERGY
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_BideAttack:: @ 81D8BB4
	attackcanceler
	setbyte cEFFECT_CHOOSER, 0xC
	clearstatus BS_ATTACKER
	printstring STRINGID_PKMNUNLEASHEDENERGY
	waitmessage 0x40
	accuracycheck BattleScript_81D6963, 0x0
	atk6
	bicbyte gMoveResultFlags, 0x6
	copyarray gBattleMoveDamage, sBIDE_DMG, 0x4
	atk69
	setbyte sB_ANIM_TURN, 0x1
	attackanimation
	waitanimation
	missmessage
	atk5c BS_TARGET
	waitstateatk
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	resultmessage
	waitmessage 0x40
	faintpokemon BS_TARGET, 0x0, NULL
	jump BattleScript_MoveEnd

BattleScript_BideNoEnergyToAttack:: @ 81D8BFC
	attackcanceler
	setbyte cEFFECT_CHOOSER, 0xC
	clearstatus BS_ATTACKER
	printstring STRINGID_PKMNUNLEASHEDENERGY
	waitmessage 0x40
	jump BattleScript_ButItFailed

BattleScript_SuccessForceOut:: @ 81D8C10
	attackanimation
	waitanimation
	atke2 BS_TARGET
	atk58 BS_TARGET
	waitstateatk
	jumpifword CMP_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_TRAINER, BattleScript_81D8C2C
	setbyte gBattleOutcome, 0x5
	atkf6

BattleScript_81D8C2C:: @ 81D8C2C
	switch1 BS_TARGET
	switch2 BS_TARGET
	switch3 BS_TARGET, 0x0
	waitstateatk
	printstring STRINGID_PKMNWASDRAGGEDOUT
	atk52 BS_TARGET
	jump BattleScript_MoveEnd

BattleScript_MistProtected:: @ 81D8C3E
	pause 0x20
	printstring STRINGID_PKMNPROTECTEDBYMIST
	waitmessage 0x40
	return

BattleScript_RageIsBuilding:: @ 81D8C48
	printstring STRINGID_PKMNRAGEBUILDING
	waitmessage 0x40
	return

BattleScript_MoveUsedIsDisabled:: @ 81D8C4F
	printstring STRINGID_PKMNMOVEISDISABLED
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_SelectingDisabledMove:: @ 81D8C5A
	printstring2 STRINGID_PKMNMOVEISDISABLED
	atk44

BattleScript_DisabledNoMore:: @ 81D8C5E
	printstring STRINGID_PKMNMOVEDISABLEDNOMORE
	waitmessage 0x40
	end2

BattleScript_EncoredNoMore:: @ 81D8C65
	printstring STRINGID_PKMNENCOREENDED
	waitmessage 0x40
	end2

BattleScript_DestinyBondTakesLife:: @ 81D8C6C
	printstring STRINGID_PKMNTOOKFOE
	waitmessage 0x40
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	faintpokemon BS_ATTACKER, 0x0, NULL
	return

BattleScript_SpikesOnAttacker:: @ 81D8C87
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	callatk BattleScript_81D8D2C
	faintpokemon BS_ATTACKER, 0x0, NULL
	faintpokemon BS_ATTACKER, 0x1, BattleScript_81D8CA8
	return

BattleScript_81D8CA8:: @ 81D8CA8
	setbyte sGIVEEXP_STATE, 0x0
	atk23 BS_ATTACKER
	setbyte sMOVEEND_STATE, 0x0
	atk49 0x0, 0x0
	jump BattleScript_HandleFaintedMon

BattleScript_SpikesOnTarget:: @ 81D8CBE
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	callatk BattleScript_81D8D2C
	faintpokemon BS_TARGET, 0x0, NULL
	faintpokemon BS_TARGET, 0x1, BattleScript_81D8CDF
	return

BattleScript_81D8CDF:: @ 81D8CDF
	setbyte sGIVEEXP_STATE, 0x0
	atk23 BS_TARGET
	setbyte sMOVEEND_STATE, 0x0
	atk49 0x0, 0x0
	jump BattleScript_HandleFaintedMon

BattleScript_SpikesOnFaintedBattler:: @ 81D8CF5
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	graphicalhpupdate BS_FAINTED
	datahpupdate BS_FAINTED
	callatk BattleScript_81D8D2C
	faintpokemon BS_FAINTED, 0x0, NULL
	faintpokemon BS_FAINTED, 0x1, BattleScript_81D8D16
	return

BattleScript_81D8D16:: @ 81D8D16
	setbyte sGIVEEXP_STATE, 0x0
	atk23 BS_FAINTED
	setbyte sMOVEEND_STATE, 0x0
	atk49 0x0, 0x0
	jump BattleScript_HandleFaintedMon

BattleScript_81D8D2C:: @ 81D8D2C
	printstring STRINGID_PKMNHURTBYSPIKES
	waitmessage 0x40
	return

BattleScript_PerishSongTakesLife:: @ 81D8D33
	printstring STRINGID_PKMNPERISHCOUNTFELL
	waitmessage 0x40
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	faintpokemon BS_ATTACKER, 0x0, NULL
	end2

BattleScript_PerishSongCountGoesDown:: @ 81D8D4E
	printstring STRINGID_PKMNPERISHCOUNTFELL
	waitmessage 0x40
	end2

BattleScript_AllStatsUp:: @ 81D8D55
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_ATK, 0xC, BattleScript_81D8D82
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_DEF, 0xC, BattleScript_81D8D82
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPEED, 0xC, BattleScript_81D8D82
	jumpifstat BS_ATTACKER, CMP_LESS_THAN, STAT_SPATK, 0xC, BattleScript_81D8D82
	jumpifstat BS_ATTACKER, CMP_EQUAL, STAT_SPDEF, 0xC, BattleScript_81D8DF0

BattleScript_81D8D82:: @ 81D8D82
	setbyte sSTAT_ANIM_PLAYED, 0x0
	playstatchangeanimation BS_ATTACKER, 0x3E, 0x0
	setbyte sSTATCHANGER, 0x11
	statbuffchange 0x41, BattleScript_81D8DA0
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D8DA0:: @ 81D8DA0
	setbyte sSTATCHANGER, 0x12
	statbuffchange 0x41, BattleScript_81D8DB4
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D8DB4:: @ 81D8DB4
	setbyte sSTATCHANGER, 0x13
	statbuffchange 0x41, BattleScript_81D8DC8
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D8DC8:: @ 81D8DC8
	setbyte sSTATCHANGER, 0x14
	statbuffchange 0x41, BattleScript_81D8DDC
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D8DDC:: @ 81D8DDC
	setbyte sSTATCHANGER, 0x15
	statbuffchange 0x41, BattleScript_81D8DF0
	printfromtable gStatUpStringIds
	waitmessage 0x40

BattleScript_81D8DF0:: @ 81D8DF0
	return

BattleScript_RapidSpinAway:: @ 81D8DF1
	breakfree
	return

BattleScript_WrapFree:: @ 81D8DF3
	printstring STRINGID_PKMNGOTFREE
	waitmessage 0x40
	copyarray gBattlerTarget, sBATTLER, 0x1
	return

BattleScript_LeechSeedFree:: @ 81D8E04
	printstring STRINGID_PKMNSHEDLEECHSEED
	waitmessage 0x40
	return

BattleScript_SpikesFree:: @ 81D8E0B
	printstring STRINGID_PKMNBLEWAWAYSPIKES
	waitmessage 0x40
	return

BattleScript_MonTookFutureAttack:: @ 81D8E12
	printstring STRINGID_PKMNTOOKATTACK
	waitmessage 0x40
	jumpifbyte CMP_NOT_EQUAL, cMULTISTRING_CHOOSER, 0x0, BattleScript_81D8E2F
	accuracycheck BattleScript_81D8E86, 0xF8
	jump BattleScript_81D8E36

BattleScript_81D8E2F:: @ 81D8E2F
	accuracycheck BattleScript_81D8E86, 0x161

BattleScript_81D8E36:: @ 81D8E36
	atk8
	jumpifbyte CMP_NOT_EQUAL, cMULTISTRING_CHOOSER, 0x0, BattleScript_81D8E4E
	playanimation BS_ATTACKER, B_ANIM_FUTURE_SIGHT_HIT, NULL
	jump BattleScript_81D8E55

BattleScript_81D8E4E:: @ 81D8E4E
	playanimation BS_ATTACKER, B_ANIM_DOOM_DESIRE_HIT, NULL

BattleScript_81D8E55:: @ 81D8E55
	missmessage
	atk5c BS_TARGET
	waitstateatk
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	resultmessage
	waitmessage 0x40
	faintpokemon BS_TARGET, 0x0, NULL
	atk24 BattleScript_81D8E6D

BattleScript_81D8E6D:: @ 81D8E6D
	setbyte sMOVEEND_STATE, 0x0
	atk49 0x1, 0x0
	setbyte sMOVEEND_STATE, 0xB
	atk49 0x2, 0xE
	setbyte gMoveResultFlags, 0x0
	end2

BattleScript_81D8E86:: @ 81D8E86
	pause 0x20
	setbyte gMoveResultFlags, 0x0
	orbyte gMoveResultFlags, 0x20
	resultmessage
	waitmessage 0x40
	setbyte gMoveResultFlags, 0x0
	end2

BattleScript_NoMovesLeft:: @ 81D8EA0
	printstring2 STRINGID_PKMNHASNOMOVESLEFT
	atk44

BattleScript_SelectingMoveWithNoPP:: @ 81D8EA4
	printstring2 STRINGID_NOPPLEFT
	atk44

BattleScript_NoPPForMove:: @ 81D8EA8
	attackstring
	pause 0x20
	printstring STRINGID_BUTNOPPLEFT
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_SelectingTormentedMove:: @ 81D8EB7
	printstring2 STRINGID_PKMNCANTUSEMOVETORMENT
	atk44
	printstring STRINGID_PKMNCANTUSEMOVETORMENT
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_SelectingNotAllowedMoveTaunt:: @ 81D8EC6
	printstring2 STRINGID_PKMNCANTUSEMOVETAUNT
	atk44

BattleScript_MoveUsedIsTaunted:: @ 81D8ECA
	printstring STRINGID_PKMNCANTUSEMOVETAUNT
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_WishComesTrue:: @ 81D8ED5
	atkd4 0x1, BattleScript_81D8EFC
	playanimation BS_TARGET, B_ANIM_WISH_HEAL, NULL
	printstring STRINGID_PKMNWISHCAMETRUE
	waitmessage 0x40
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	printstring STRINGID_PKMNREGAINEDHEALTH
	waitmessage 0x40
	end2

BattleScript_81D8EFC:: @ 81D8EFC
	printstring STRINGID_PKMNWISHCAMETRUE
	waitmessage 0x40
	pause 0x20
	printstring STRINGID_PKMNHPFULL
	waitmessage 0x40
	end2

BattleScript_IngrainTurnHeal:: @ 81D8F0C
	playanimation BS_ATTACKER, B_ANIM_INGRAIN_HEAL, NULL
	printstring STRINGID_PKMNABSORBEDNUTRIENTS
	waitmessage 0x40
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	end2

BattleScript_81D8F27:: @ 81D8F27
	pause 0x20
	printstring STRINGID_PKMNANCHOREDITSELF
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_AtkDefDown:: @ 81D8F35
	setbyte sSTAT_ANIM_PLAYED, 0x0
	playstatchangeanimation BS_ATTACKER, 0x6, 0xD
	playstatchangeanimation BS_ATTACKER, 0x2, 0x9
	setbyte sSTATCHANGER, 0x91
	statbuffchange 0xC1, BattleScript_81D8F62
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D8F62
	printfromtable gStatDownStringIds
	waitmessage 0x40

BattleScript_81D8F62:: @ 81D8F62
	playstatchangeanimation BS_ATTACKER, 0x4, 0x9
	setbyte sSTATCHANGER, 0x92
	statbuffchange 0xC1, BattleScript_81D8F85
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D8F85
	printfromtable gStatDownStringIds
	waitmessage 0x40

BattleScript_81D8F85:: @ 81D8F85
	return

BattleScript_KnockedOff:: @ 81D8F86
	playanimation BS_TARGET, B_ANIM_ITEM_KNOCKOFF, NULL
	printstring STRINGID_PKMNKNOCKEDOFF
	waitmessage 0x40
	return

BattleScript_MoveUsedIsImprisoned:: @ 81D8F94
	printstring STRINGID_PKMNCANTUSEMOVESEALED
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_SelectingImprisonedMove:: @ 81D8F9F
	printstring2 STRINGID_PKMNCANTUSEMOVESEALED
	atk44

BattleScript_GrudgeTakesPp:: @ 81D8FA3
	printstring STRINGID_PKMNLOSTPPGRUDGE
	waitmessage 0x40
	return

BattleScript_MagicCoatBounce:: @ 81D8FAA
	attackstring
	ppreduce
	pause 0x20
	printstring STRINGID_PKMNMOVEBOUNCED
	waitmessage 0x40
	orword gHitMarker, HITMARKER_ATTACKSTRING_PRINTED | HITMARKER_NO_PPDEDUCT | HITMARKER_x800000
	atk76 0x1, BS_ATTACKER
	return

BattleScript_SnatchedMove:: @ 81D8FC2
	attackstring
	ppreduce
	snatchmove
	playanimation BS_TARGET, B_ANIM_SNATCH_MOVE, NULL
	printstring STRINGID_PKMNSNATCHEDMOVE
	waitmessage 0x40
	orword gHitMarker, HITMARKER_ATTACKSTRING_PRINTED | HITMARKER_NO_PPDEDUCT | HITMARKER_x800000
	atk5f
	return

BattleScript_EnduredMsg:: @ 81D8FDD
	printstring STRINGID_PKMNENDUREDHIT
	waitmessage 0x40
	return

BattleScript_OneHitKOMsg:: @ 81D8FE4
	printstring STRINGID_ONEHITKO
	waitmessage 0x40
	return

BattleScript_SAtkDown2:: @ 81D8FEB
	setbyte sSTAT_ANIM_PLAYED, 0x0
	playstatchangeanimation BS_ATTACKER, 0x10, 0xB
	setbyte sSTATCHANGER, 0xA4
	statbuffchange 0xC1, BattleScript_81D9014
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x2, BattleScript_81D9014
	printfromtable gStatDownStringIds
	waitmessage 0x40

BattleScript_81D9014:: @ 81D9014
	return

BattleScript_FocusPunchSetUp:: @ 81D9015
	printstring STRINGID_EMPTYSTRING3
	waitmessage 0x1
	playanimation BS_ATTACKER, B_ANIM_FOCUS_PUNCH_SETUP, NULL
	printstring STRINGID_PKMNTIGHTENINGFOCUS
	waitmessage 0x40
	end2

BattleScript_MoveUsedIsAsleep:: @ 81D9029
	printstring STRINGID_PKMNFASTASLEEP
	waitmessage 0x40
	statusanimation BS_ATTACKER
	jump BattleScript_MoveEnd

BattleScript_MoveUsedWokeUp:: @ 81D9036
	bicword gHitMarker, 0x10
	printfromtable gWokeUpStringIds
	waitmessage 0x40
	atk98 0x1
	return

BattleScript_MonWokeUpInUproar:: @ 81D904A
	printstring STRINGID_PKMNWOKEUPINUPROAR
	waitmessage 0x40
	atk98 0x1
	end2

BattleScript_PoisonTurnDmg:: @ 81D9053
	printstring STRINGID_PKMNHURTBYPOISON
	waitmessage 0x40

BattleScript_81D9059:: @ 81D9059
	statusanimation BS_ATTACKER

BattleScript_81D905B:: @ 81D905B
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	faintpokemon BS_ATTACKER, 0x0, NULL
	atk24 BattleScript_81D9074

BattleScript_81D9074:: @ 81D9074
	end2

BattleScript_BurnTurnDmg:: @ 81D9075
	printstring STRINGID_PKMNHURTBYBURN
	waitmessage 0x40
	jump BattleScript_81D9059

BattleScript_MoveUsedIsFrozen:: @ 81D9080
	printstring STRINGID_PKMNISFROZEN
	waitmessage 0x40
	statusanimation BS_ATTACKER
	jump BattleScript_MoveEnd

BattleScript_MoveUsedUnfroze:: @ 81D908D
	printfromtable gGotDefrostedStringIds
	waitmessage 0x40
	atk98 0x1
	return

BattleScript_DefrostedViaFireMove:: @ 81D9098
	printstring STRINGID_PKMNWASDEFROSTED
	waitmessage 0x40
	atk98 0x0
	return

BattleScript_MoveUsedIsParalyzed:: @ 81D90A1
	printstring STRINGID_PKMNISPARALYZED
	waitmessage 0x40
	statusanimation BS_ATTACKER
	atk76 0x1, BS_TARGET
	jump BattleScript_MoveEnd

BattleScript_MoveUsedFlinched:: @ 81D90B1
	printstring STRINGID_PKMNFLINCHED
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_PrintUproarOverTurns:: @ 81D90BC
	printfromtable gUproarOverTurnStringIds
	waitmessage 0x40
	end2

BattleScript_ThrashConfuses:: @ 81D90C5
	atk66 0x1, 0x1, 0x7
	printstring STRINGID_PKMNFATIGUECONFUSION
	waitmessage 0x40
	end2

BattleScript_MoveUsedIsConfused:: @ 81D90D3
	printstring STRINGID_PKMNISCONFUSED
	waitmessage 0x40
	atk65 0x1, STATUS2_CONFUSION
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 0x0, BattleScript_81D9115

BattleScript_81D90EA:: @ 81D90EA
	atk76 0x1, BS_TARGET
	atk8
	printstring STRINGID_ITHURTCONFUSION
	waitmessage 0x40
	missmessage
	atk5c BS_ATTACKER
	waitstateatk
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	resultmessage
	waitmessage 0x40
	faintpokemon BS_ATTACKER, 0x0, NULL
	jump BattleScript_MoveEnd

BattleScript_81D9115:: @ 81D9115
	return

BattleScript_MoveUsedIsConfusedNoMore:: @ 81D9116
	printstring STRINGID_PKMNHEALEDCONFUSION
	waitmessage 0x40
	return

BattleScript_PrintPayDayMoneyString:: @ 81D911D
	printstring STRINGID_PKMNPICKEDUPITEM
	waitmessage 0x40
	return

BattleScript_WrapTurnDmg:: @ 81D9124
	playanimation BS_ATTACKER, B_ANIM_TURN_TRAP, sB_ANIM_ARG1
	printstring STRINGID_PKMNHURTBY
	waitmessage 0x40
	jump BattleScript_81D905B

BattleScript_WrapEnds:: @ 81D9136
	printstring STRINGID_PKMNFREEDFROM
	waitmessage 0x40
	end2

BattleScript_MoveUsedIsInLove:: @ 81D913D
	printstring STRINGID_PKMNINLOVE
	waitmessage 0x40
	atk65 0x1, STATUS2_INFATUATION
	return

BattleScript_MoveUsedIsInLoveCantAttack:: @ 81D914A
	printstring STRINGID_PKMNIMMOBILIZEDBYLOVE
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_NightmareTurnDmg:: @ 81D9155
	printstring STRINGID_PKMNLOCKEDINNIGHTMARE
	waitmessage 0x40
	atk65 0x1, STATUS2_NIGHTMARE
	jump BattleScript_81D905B

BattleScript_CurseTurnDmg:: @ 81D9166
	printstring STRINGID_PKMNAFFLICTEDBYCURSE
	waitmessage 0x40
	atk65 0x1, STATUS2_CURSED
	jump BattleScript_81D905B

BattleScript_TargetPRLZHeal:: @ 81D9177
	printstring STRINGID_PKMNHEALEDPARALYSIS
	waitmessage 0x40
	atk98 0x0
	return

gUnknown_81D9180:: @ 81D9180
	printstring STRINGID_MONTOOSCAREDTOMOVE
	waitmessage 0x40
	playanimation BS_ATTACKER, 0x17, NULL
	jump BattleScript_MoveEnd

gUnknown_81D9192:: @ 81D9192
	printstring STRINGID_GHOSTGETOUTGETOUT
	playanimation BS_ATTACKER, 0x18, NULL
	jump BattleScript_MoveEnd

gUnknown_81D91A1:: @ 81D91A1
	pause 0x20
	printstring STRINGID_SILPHSCOPEUNVEILED
	waitstateatk
	playanimation BS_OPPONENT1, B_ANIM_x19, NULL
	pause 0x20
	printstring STRINGID_GHOSTWASMAROWAK
	waitmessage 0x40
	end2

BattleScript_MoveEffectSleep:: @ 81D91B9
	statusanimation BS_EFFECT_BATTLER
	printfromtable gFellAsleepStringIds
	waitmessage 0x40

BattleScript_81D91C3:: @ 81D91C3
	atk98 0x2
	waitstateatk
	return

BattleScript_YawnMakesAsleep:: @ 81D91C7
	statusanimation BS_EFFECT_BATTLER
	printstring STRINGID_PKMNFELLASLEEP
	waitmessage 0x40
	atk98 0x2
	waitstateatk
	atk6f BS_EFFECT_BATTLER
	end2

BattleScript_MoveEffectPoison:: @ 81D91D5
	statusanimation BS_EFFECT_BATTLER
	printfromtable gGotPoisonedStringIds
	waitmessage 0x40
	jump BattleScript_81D91C3

BattleScript_MoveEffectBurn:: @ 81D91E4
	statusanimation BS_EFFECT_BATTLER
	printfromtable gGotBurnedStringIds
	waitmessage 0x40
	jump BattleScript_81D91C3

BattleScript_MoveEffectFreeze:: @ 81D91F3
	statusanimation BS_EFFECT_BATTLER
	printfromtable gGotFrozenStringIds
	waitmessage 0x40
	jump BattleScript_81D91C3

BattleScript_MoveEffectParalysis:: @ 81D9202
	statusanimation BS_EFFECT_BATTLER
	printfromtable gGotParalyzedStringIds
	waitmessage 0x40
	jump BattleScript_81D91C3

BattleScript_MoveEffectUproar:: @ 81D9211
	printstring STRINGID_PKMNCAUSEDUPROAR
	waitmessage 0x40
	return

BattleScript_MoveEffectToxic:: @ 81D9218
	statusanimation BS_EFFECT_BATTLER
	printstring STRINGID_PKMNBADLYPOISONED
	waitmessage 0x40
	jump BattleScript_81D91C3

BattleScript_MoveEffectPayDay:: @ 81D9225
	printstring STRINGID_COINSSCATTERED
	waitmessage 0x40
	return

BattleScript_MoveEffectWrap:: @ 81D922C
	printfromtable gWrappedStringIds
	waitmessage 0x40
	return

BattleScript_MoveEffectConfusion:: @ 81D9235
	atk66 0x2, 0x1, 0x7
	printstring STRINGID_PKMNWASCONFUSED
	waitmessage 0x40
	return

BattleScript_MoveEffectRecoil:: @ 81D9243
	jumpifhalfword CMP_EQUAL, gCurrentMove, 0xA5, BattleScript_81D9256
	jumpifability BS_ATTACKER, ABILITY_ROCK_HEAD, BattleScript_81D9270

BattleScript_81D9256:: @ 81D9256
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	printstring STRINGID_PKMNHITWITHRECOIL
	waitmessage 0x40
	faintpokemon BS_ATTACKER, 0x0, NULL

BattleScript_81D9270:: @ 81D9270
	return

BattleScript_ItemSteal:: @ 81D9271
	playanimation BS_TARGET, B_ANIM_ITEM_STEAL, NULL
	printstring STRINGID_PKMNSTOLEITEM
	waitmessage 0x40
	return

BattleScript_DrizzleActivates:: @ 81D927F
	pause 0x20
	printstring STRINGID_PKMNMADEITRAIN
	waitstateatk
	playanimation BS_BATTLER_0, B_ANIM_RAIN_CONTINUES, NULL
	callatk BattleScript_81D92DC
	end3

BattleScript_SpeedBoostActivates:: @ 81D9293
	playanimation BS_ATTACKER, B_ANIM_STATS_CHANGE, sB_ANIM_ARG1
	printstring STRINGID_PKMNRAISEDSPEED
	waitmessage 0x40
	end3

BattleScript_TraceActivates:: @ 81D92A1
	pause 0x20
	printstring STRINGID_PKMNTRACED
	waitmessage 0x40
	end3

BattleScript_RainDishActivates:: @ 81D92AB
	printstring STRINGID_PKMNSXRESTOREDHPALITTLE2
	waitmessage 0x40
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	end3

BattleScript_SandstreamActivates:: @ 81D92BF
	pause 0x20
	printstring STRINGID_PKMNSXWHIPPEDUPSANDSTORM
	waitstateatk
	playanimation BS_BATTLER_0, B_ANIM_SANDSTORM_CONTINUES, NULL
	callatk BattleScript_81D92DC
	end3

BattleScript_ShedSkinActivates:: @ 81D92D3
	printstring STRINGID_PKMNSXCUREDYPROBLEM
	waitmessage 0x40
	atk98 0x1
	end3

BattleScript_81D92DC:: @ 81D92DC
	setbyte sBATTLER, 0x0

BattleScript_81D92E2:: @ 81D92E2
	castformswitch
	addbyte sBATTLER, 0x1
	jumpifarraynotequal sBATTLER, gBattlersCount, 0x1, BattleScript_81D92E2
	return

BattleScript_CastformChange:: @ 81D92F8
	callatk BattleScript_81D92FE
	end3

BattleScript_81D92FE:: @ 81D92FE
	actualcastformswitch
	waitstateatk
	printstring STRINGID_PKMNTRANSFORMED
	waitmessage 0x40
	return

BattleScript_IntimidateActivatesEnd3:: @ 81D9307
	callatk BattleScript_81D930D
	end3

BattleScript_81D930D:: @ 81D930D
	pause 0x20

BattleScript_IntimidateActivates:: @ 81D9310
	setbyte gBattlerTarget, 0x0
	setbyte sSTATCHANGER, 0x91

BattleScript_81D931C:: @ 81D931C
	atke1 BattleScript_81D936A
	jumpifsecondarytstatus BS_TARGET, 0x1000000, BattleScript_81D935F
	jumpifability BS_TARGET, ABILITY_CLEAR_BODY, BattleScript_81D936B
	jumpifability BS_TARGET, ABILITY_HYPER_CUTTER, BattleScript_81D936B
	jumpifability BS_TARGET, ABILITY_WHITE_SMOKE, BattleScript_81D936B
	statbuffchange 0x21, BattleScript_81D935F
	jumpifbyte CMP_GREATER_THAN, cMULTISTRING_CHOOSER, 0x1, BattleScript_81D935F
	atk47
	playanimation BS_TARGET, B_ANIM_STATS_CHANGE, sB_ANIM_ARG1
	printstring STRINGID_PKMNCUTSATTACKWITH
	waitmessage 0x40

BattleScript_81D935F:: @ 81D935F
	addbyte gBattlerTarget, 0x1
	jump BattleScript_81D931C

BattleScript_81D936A:: @ 81D936A
	return

BattleScript_81D936B:: @ 81D936B
	pause 0x20
	printstring STRINGID_PREVENTEDFROMWORKING
	waitmessage 0x40
	jump BattleScript_81D935F

BattleScript_DroughtActivates:: @ 81D9379
	pause 0x20
	printstring STRINGID_PKMNSXINTENSIFIEDSUN
	waitstateatk
	playanimation BS_BATTLER_0, B_ANIM_SUN_CONTINUES, NULL
	callatk BattleScript_81D92DC
	end3

BattleScript_TookAttack:: @ 81D938D
	attackstring
	pause 0x20
	printstring STRINGID_PKMNSXTOOKATTACK
	waitmessage 0x40
	orword gHitMarker, HITMARKER_ATTACKSTRING_PRINTED
	return

BattleScript_SturdyPreventsOHKO:: @ 81D93A1
	pause 0x20
	printstring STRINGID_PKMNPROTECTEDBY
	pause 0x40
	jump BattleScript_MoveEnd

BattleScript_DampStopsExplosion:: @ 81D93AF
	pause 0x20
	printstring STRINGID_PKMNPREVENTSUSAGE
	pause 0x40
	jump BattleScript_MoveEnd

BattleScript_MoveHPDrain_PPLoss:: @ 81D93BD
	ppreduce

BattleScript_MoveHPDrain:: @ 81D93BE
	attackstring
	pause 0x20
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	graphicalhpupdate BS_TARGET
	datahpupdate BS_TARGET
	printstring STRINGID_PKMNRESTOREDHPUSING
	waitmessage 0x40
	orbyte gMoveResultFlags, 0x8
	jump BattleScript_MoveEnd

BattleScript_MonMadeMoveUseless_PPLoss:: @ 81D93E0
	ppreduce

BattleScript_MonMadeMoveUseless:: @ 81D93E1
	attackstring
	pause 0x20
	printstring STRINGID_PKMNSXMADEYUSELESS
	waitmessage 0x40
	orbyte gMoveResultFlags, 0x8
	jump BattleScript_MoveEnd

BattleScript_FlashFireBoost_PPLoss:: @ 81D93F6
	ppreduce

BattleScript_FlashFireBoost:: @ 81D93F7
	attackstring
	pause 0x20
	printfromtable gFlashFireStringIds
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_81D9408:: @ 81D9408
	pause 0x20
	printstring STRINGID_PKMNANCHORSITSELFWITH
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_AbilityNoStatLoss:: @ 81D9416
	pause 0x20
	printstring STRINGID_PKMNPREVENTSSTATLOSSWITH
	waitmessage 0x40
	return

BattleScript_BRNPrevention:: @ 81D9420
	pause 0x20
	printfromtable gBRNPreventionStringIds
	waitmessage 0x40
	return

BattleScript_PRLZPrevention:: @ 81D942C
	pause 0x20
	printfromtable gPRLZPreventionStringIds
	waitmessage 0x40
	return

BattleScript_PSNPrevention:: @ 81D9438
	pause 0x20
	printfromtable gPSNPreventionStringIds
	waitmessage 0x40
	return

BattleScript_ObliviousPreventsAttraction:: @ 81D9444
	pause 0x20
	printstring STRINGID_PKMNPREVENTSROMANCEWITH
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_FlinchPrevention:: @ 81D9452
	pause 0x20
	printstring STRINGID_PKMNSXPREVENTSFLINCHING
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_81D9460:: @ 81D9460
	pause 0x20
	printstring STRINGID_PKMNPREVENTSCONFUSIONWITH
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_SoundproofProtected:: @ 81D946E
	attackstring
	ppreduce
	pause 0x20
	printstring STRINGID_PKMNSXBLOCKSY
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_AbilityNoSpecificStatLoss:: @ 81D947E
	pause 0x20
	printstring STRINGID_PKMNSXPREVENTSYLOSS
	waitmessage 0x40
	setbyte cMULTISTRING_CHOOSER, 0x3
	return

BattleScript_StickyHoldActivates:: @ 81D948E
	pause 0x20
	printstring STRINGID_PKMNSXMADEYINEFFECTIVE
	waitmessage 0x40
	jump BattleScript_MoveEnd

BattleScript_ColorChangeActivates:: @ 81D949C
	printstring STRINGID_PKMNCHANGEDTYPEWITH
	waitmessage 0x40
	return

BattleScript_RoughSkinActivates:: @ 81D94A3
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	printstring STRINGID_PKMNHURTSWITH
	waitmessage 0x40
	faintpokemon BS_ATTACKER, 0x0, NULL
	return

BattleScript_CuteCharmActivates:: @ 81D94BE
	atk65 0x1, STATUS2_INFATUATION
	printstring STRINGID_PKMNSXINFATUATEDY
	waitmessage 0x40
	return

BattleScript_ApplySecondaryEffect:: @ 81D94CB
	waitstateatk
	seteffectuser
	return

BattleScript_SynchronizeActivates:: @ 81D94CE
	waitstateatk
	seteffecttarget
	return

BattleScript_AbilityCuredStatus:: @ 81D94D1
	printstring STRINGID_PKMNSXCUREDITSYPROBLEM
	waitmessage 0x40
	atk98 0xA
	return

BattleScript_IgnoresWhileAsleep:: @ 81D94DA
	printstring STRINGID_PKMNIGNORESASLEEP
	waitmessage 0x40
	setbyte sMOVEEND_STATE, 0x0
	atk49 0x2, 0x10
	end

BattleScript_IgnoresAndUsesRandomMove:: @ 81D94EA
	printstring STRINGID_PKMNIGNOREDORDERS
	waitmessage 0x40
	jumptoattack BS_TARGET

BattleScript_MoveUsedLoafingAround:: @ 81D94F2
	printfromtable gInobedientStringIds
	waitmessage 0x40
	setbyte sMOVEEND_STATE, 0x0
	atk49 0x2, 0x10
	end

BattleScript_IgnoresAndFallsAsleep:: @ 81D9504
	printstring STRINGID_PKMNBEGANTONAP
	waitmessage 0x40
	setbyte cEFFECT_CHOOSER, 0x41
	seteffecttarget
	setbyte sMOVEEND_STATE, 0x0
	atk49 0x2, 0x10
	end

BattleScript_IgnoresAndHitsItself:: @ 81D951B
	printstring STRINGID_PKMNWONTOBEY
	waitmessage 0x40
	jump BattleScript_81D90EA

BattleScript_SubstituteFade:: @ 81D9526
	playanimation BS_TARGET, B_ANIM_SUBSTITUTE_FADE, NULL
	printstring STRINGID_PKMNSUBSTITUTEFADED
	return

BattleScript_BerryCurePrlzEnd2:: @ 81D9531
	callatk BattleScript_BerryCureParRet
	end2

BattleScript_BerryCureParRet:: @ 81D9537
	playanimation BS_SCRIPTING, B_ANIM_ITEM_EFFECT, NULL
	printstring STRINGID_PKMNSITEMCUREDPARALYSIS
	waitmessage 0x40
	atk98 0xA
	removeitem BS_SCRIPTING
	return

BattleScript_BerryCurePsnEnd2:: @ 81D9549
	callatk BattleScript_BerryCurePsnRet
	end2

BattleScript_BerryCurePsnRet:: @ 81D954F
	playanimation BS_SCRIPTING, B_ANIM_ITEM_EFFECT, NULL
	printstring STRINGID_PKMNSITEMCUREDPOISON
	waitmessage 0x40
	atk98 0xA
	removeitem BS_SCRIPTING
	return

BattleScript_BerryCureBrnEnd2:: @ 81D9561
	callatk BattleScript_BerryCureBrnRet
	end2

BattleScript_BerryCureBrnRet:: @ 81D9567
	playanimation BS_SCRIPTING, B_ANIM_ITEM_EFFECT, NULL
	printstring STRINGID_PKMNSITEMHEALEDBURN
	waitmessage 0x40
	atk98 0xA
	removeitem BS_SCRIPTING
	return

BattleScript_BerryCureFrzEnd2:: @ 81D9579
	callatk BattleScript_BerryCureFrzRet
	end2

BattleScript_BerryCureFrzRet:: @ 81D957F
	playanimation BS_SCRIPTING, B_ANIM_ITEM_EFFECT, NULL
	printstring STRINGID_PKMNSITEMDEFROSTEDIT
	waitmessage 0x40
	atk98 0xA
	removeitem BS_SCRIPTING
	return

BattleScript_BerryCureSlpEnd2:: @ 81D9591
	callatk BattleScript_BerryCureSlpRet
	end2

BattleScript_BerryCureSlpRet:: @ 81D9597
	playanimation BS_SCRIPTING, B_ANIM_ITEM_EFFECT, NULL
	printstring STRINGID_PKMNSITEMWOKEIT
	waitmessage 0x40
	atk98 0xA
	removeitem BS_SCRIPTING
	return

BattleScript_BerryCureConfusionEnd2:: @ 81D95A9
	callatk BattleScript_BerryCureConfusionRet
	end2

BattleScript_BerryCureConfusionRet:: @ 81D95AF
	playanimation BS_SCRIPTING, B_ANIM_ITEM_EFFECT, NULL
	printstring STRINGID_PKMNSITEMSNAPPEDOUT
	waitmessage 0x40
	removeitem BS_SCRIPTING
	return

BattleScript_BerryCureChosenStatusEnd2:: @ 81D95BF
	callatk BattleScript_BerryCureChosenStatusRet
	end2

BattleScript_BerryCureChosenStatusRet:: @ 81D95C5
	playanimation BS_SCRIPTING, B_ANIM_ITEM_EFFECT, NULL
	printfromtable gBerryEffectStringIds
	waitmessage 0x40
	atk98 0xA
	removeitem BS_SCRIPTING
	return

BattleScript_WhiteHerbEnd2:: @ 81D95D9
	callatk BattleScript_WhiteHerbRet
	end2

BattleScript_WhiteHerbRet:: @ 81D95DF
	playanimation BS_SCRIPTING, B_ANIM_ITEM_EFFECT, NULL
	printstring STRINGID_PKMNSITEMRESTOREDSTATUS
	waitmessage 0x40
	removeitem BS_SCRIPTING
	return

BattleScript_ItemHealHP_RemoveItem:: @ 81D95EF
	playanimation BS_ATTACKER, B_ANIM_ITEM_EFFECT, NULL
	printstring STRINGID_PKMNSITEMRESTOREDHEALTH
	waitmessage 0x40
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	removeitem BS_ATTACKER
	end2

BattleScript_BerryPPHealEnd2:: @ 81D960C
	playanimation BS_ATTACKER, B_ANIM_ITEM_EFFECT, NULL
	printstring STRINGID_PKMNSITEMRESTOREDPP
	waitmessage 0x40
	removeitem BS_ATTACKER
	end2

BattleScript_ItemHealHP_End2:: @ 81D961C
	callatk BattleScript_ItemHealHP_Ret
	end2

BattleScript_ItemHealHP_Ret:: @ 81D9622
	playanimation BS_ATTACKER, B_ANIM_ITEM_EFFECT, NULL
	printstring STRINGID_PKMNSITEMRESTOREDHPALITTLE
	waitmessage 0x40
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	return

BattleScript_SelectingNotAllowedMoveChoiceItem:: @ 81D963D
	printstring2 STRINGID_ITEMALLOWSONLYYMOVE
	atk44

BattleScript_HangedOnMsg:: @ 81D9641
	playanimation BS_TARGET, B_ANIM_HANGED_ON, NULL
	printstring STRINGID_PKMNHUNGONWITHX
	waitmessage 0x40
	return

BattleScript_BerryConfuseHealEnd2:: @ 81D964F
	playanimation BS_ATTACKER, B_ANIM_ITEM_EFFECT, NULL
	printstring STRINGID_PKMNSITEMRESTOREDHEALTH
	waitmessage 0x40
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	graphicalhpupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	printstring STRINGID_FORXCOMMAYZ
	waitmessage 0x40
	setbyte cEFFECT_CHOOSER, 0x47
	seteffecttarget
	removeitem BS_ATTACKER
	end2

BattleScript_BerryStatRaiseEnd2:: @ 81D9679
	playanimation BS_ATTACKER, B_ANIM_ITEM_EFFECT, NULL
	statbuffchange 0x41, BattleScript_81D9686

BattleScript_81D9686:: @ 81D9686
	setbyte cMULTISTRING_CHOOSER, 0x4
	callatk BattleScript_StatUp
	removeitem BS_ATTACKER
	end2

BattleScript_BerryFocusEnergyEnd2:: @ 81D9694
	playanimation BS_ATTACKER, B_ANIM_ITEM_EFFECT, NULL
	printstring STRINGID_PKMNUSEDXTOGETPUMPED
	waitmessage 0x40
	removeitem BS_ATTACKER
	end2

BattleScript_ActionSelectionItemsCantBeUsed:: @ 81D96A4
	printstring2 STRINGID_ITEMSCANTBEUSEDNOW
	atk44

BattleScript_FlushMessageBox:: @ 81D96A8
	printstring STRINGID_EMPTYSTRING3
	return
