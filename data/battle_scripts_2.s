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
#include "battle_string_ids.h"
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
	.4byte BattleScript_ThrowSafariBall
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall
	.4byte BattleScript_ThrowBall

gBattlescriptsForUsingItem::
	.4byte BattleScript_PlayerUseItem
	.4byte BattleScript_AIUseFullRestoreOrHpHeal
	.4byte BattleScript_AIUseFullRestoreOrHpHeal
	.4byte BattleScript_AIUseStatRestore
	.4byte BattleScript_AIUseXstat
	.4byte BattleScript_AIUseGuardSpec

gBattlescriptsForRunningByItem::
	.4byte BattleScript_UseFluffyTail
	.4byte BattleScript_UsePokeFlute

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

BattleScript_ThrowSafariBall::
	printstring STRINGID_PLAYERUSEDITEM
	updatestatusicon BS_ATTACKER
	handleballthrow

BattleScript_SuccessBallThrow::
	jumpifhalfword CMP_EQUAL, gLastUsedItem, ITEM_SAFARI_BALL, BattleScript_SafariNoIncGameStat
	incrementgamestat GAME_STAT_POKEMON_CAPTURES
BattleScript_SafariNoIncGameStat::
	printstring STRINGID_GOTCHAPKMNCAUGHT
	trysetcaughtmondexflags BattleScript_CaughtPokemonSkipNewDex
	printstring STRINGID_PKMNDATAADDEDTODEX
	waitstate
	setbyte gBattleCommunication, 0
	displaydexinfo
BattleScript_CaughtPokemonSkipNewDex::
	printstring STRINGID_GIVENICKNAMECAPTURED
	waitstate
	setbyte gBattleCommunication, 0
	trygivecaughtmonnick BattleScript_CaughtPokemonSkipNickname
	givecaughtmon
	printfromtable gCaughtMonStringIds
	waitmessage 64
	goto BattleScript_CaughtPokemonDone

BattleScript_CaughtPokemonSkipNickname::
	givecaughtmon
BattleScript_CaughtPokemonDone::
	setbyte gBattleOutcome, B_OUTCOME_CAUGHT
	finishturn

BattleScript_OldMan_Pokedude_CaughtMessage::
	printstring STRINGID_GOTCHAPKMNCAUGHT2
	setbyte gBattleOutcome, B_OUTCOME_CAUGHT
	atk57
	finishturn

BattleScript_ShakeBallThrow::
	printfromtable gBallEscapeStringIds
	waitmessage 64
	jumpifnotbattletype BATTLE_TYPE_SAFARI, BattleScript_CatchFailEnd
	jumpifbyte CMP_NOT_EQUAL, gNumSafariBalls, 0, BattleScript_CatchFailEnd
	printstring STRINGID_OUTOFSAFARIBALLS
	waitmessage 64
	setbyte gBattleOutcome, B_OUTCOME_NO_SAFARI_BALLS
BattleScript_CatchFailEnd::
	finishaction

BattleScript_TrainerBallBlock::
	waitmessage 64
	printstring STRINGID_TRAINERBLOCKEDBALL
	waitmessage 64
	printstring STRINGID_DONTBEATHIEF
	waitmessage 64
	finishaction

BattleScript_GhostBallDodge::
	waitmessage 64
	printstring STRINGID_ITDODGEDBALL
	waitmessage 64
	finishaction

BattleScript_PlayerUseItem::
	moveendcase 15
	end

BattleScript_AIUseFullRestoreOrHpHeal::
	printstring STRINGID_EMPTYSTRING3
	pause 48
	playse SE_USE_ITEM
	printstring STRINGID_TRAINER1USEDITEM
	waitmessage 64
	useitemonopponent
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate BS_ATTACKER
	datahpupdate BS_ATTACKER
	printstring STRINGID_PKMNSITEMRESTOREDHEALTH
	waitmessage 64
	updatestatusicon BS_ATTACKER
	moveendcase 15
	finishaction

BattleScript_AIUseStatRestore::
	printstring STRINGID_EMPTYSTRING3
	pause 48
	playse SE_USE_ITEM
	printstring STRINGID_TRAINER1USEDITEM
	waitmessage 64
	useitemonopponent
	printfromtable gTrainerItemCuredStatusStringIds
	waitmessage 64
	updatestatusicon BS_ATTACKER
	moveendcase 15
	finishaction

BattleScript_AIUseXstat::
	printstring STRINGID_EMPTYSTRING3
	pause 48
	playse SE_USE_ITEM
	printstring STRINGID_TRAINER1USEDITEM
	waitmessage 64
	useitemonopponent
	printfromtable gStatUpStringIds
	waitmessage 64
	moveendcase 15
	finishaction

BattleScript_AIUseGuardSpec::
	printstring STRINGID_EMPTYSTRING3
	pause 48
	playse SE_USE_ITEM
	printstring STRINGID_TRAINER1USEDITEM
	waitmessage 64
	useitemonopponent
	printfromtable gMistUsedStringIds
	waitmessage 64
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
	waitmessage 64
	goto BattleScript_PokeFluteEnd

BattleScript_PokeFluteWakeUp::
	printstring STRINGID_POKEFLUTE
	waitmessage 64
	fanfare MUS_POKE_FLUTE
	waitfanfare BS_ATTACKER
	printstring STRINGID_MONHEARINGFLUTEAWOKE
	waitmessage 64
	updatestatusicon BS_PLAYER2
	waitstate
BattleScript_PokeFluteEnd::
	finishaction

BattleScript_WatchesCarefully::
	printfromtable gSafariPokeblockResultStringIds
	waitmessage 64
	playanimation BS_OPPONENT1, B_ANIM_SAFARI_REACTION, NULL
	end2

BattleScript_ThrowRock::
	printstring STRINGID_THREWROCK
	waitmessage 64
	playanimation BS_ATTACKER, B_ANIM_ROCK_THROW, NULL
	end2

BattleScript_ThrowBait::
	printstring STRINGID_THREWBAIT
	waitmessage 64
	playanimation BS_ATTACKER, B_ANIM_BAIT_THROW, NULL
	end2

BattleScript_LeftoverWallyPrepToThrow::
	printstring STRINGID_RETURNMON
	waitmessage 64
	returnatktoball
	waitstate
	trainerslide BS_TARGET
	waitstate
	printstring STRINGID_YOUTHROWABALLNOWRIGHT
	waitmessage 64
	end2
