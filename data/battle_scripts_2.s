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


gBattlescriptsForBallThrow:: @ 81D99B4
	.4byte BattleScript_81D9A14
	.4byte BattleScript_81D9A14
	.4byte BattleScript_81D9A14
	.4byte BattleScript_81D9A14
	.4byte BattleScript_81D9A14
	.4byte BattleScript_81D9A3C
	.4byte BattleScript_81D9A14
	.4byte BattleScript_81D9A14
	.4byte BattleScript_81D9A14
	.4byte BattleScript_81D9A14
	.4byte BattleScript_81D9A14
	.4byte BattleScript_81D9A14
	.4byte BattleScript_81D9A14

gBattlescriptsForUsingItem:: @ 81D99E8
	.4byte BattleScript_81D9ADB
	.4byte BattleScript_81D9AE5
	.4byte BattleScript_81D9AE5
	.4byte BattleScript_81D9B14
	.4byte BattleScript_81D9B38
	.4byte BattleScript_81D9B5A

gBattlescriptsForRunningByItem:: @ 81D9A00
	.4byte BattleScript_81D9B7C
	.4byte BattleScript_81D9B86

gBattlescriptsForSafariActions:: @ 81D9A08
	.4byte BattleScript_81D9BB5
	.4byte BattleScript_81D9BC5
	.4byte BattleScript_81D9BD3
	.4byte BattleScript_81D9BE1

BattleScript_81D9A14:: @ 81D9A14
	jumpifword CMP_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_OLD_MAN_TUTORIAL, BattleScript_81D9A34
	jumpifword CMP_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_POKEDUDE, BattleScript_81D9A38
	printstring STRINGID_PLAYERUSEDITEM
	handleballthrow

BattleScript_81D9A34:: @ 81D9A34
	printstring STRINGID_WALLYUSEDITEM
	handleballthrow

BattleScript_81D9A38:: @ 81D9A38
	printstring STRINGID_POKEDUDEUSED
	handleballthrow

BattleScript_81D9A3C:: @ 81D9A3C
	printstring STRINGID_PLAYERUSEDITEM
	updatestatusicon BS_ATTACKER
	handleballthrow

BattleScript_SuccessBallThrow:: @ 81D9A42
	jumpifhalfword CMP_EQUAL, gLastUsedItem, ITEM_SAFARI_BALL, BattleScript_81D9A50
	incrementgamestat GAME_STAT_POKEMON_CAPTURES
BattleScript_81D9A50:: @ 81D9A50
	printstring STRINGID_GOTCHAPKMNCAUGHT
	trysetcaughtmondexflags BattleScript_81D9A63
	printstring STRINGID_PKMNDATAADDEDTODEX
	waitstate
	setbyte gBattleCommunication, 0
	displaydexinfo
BattleScript_81D9A63:: @ 81D9A63
	printstring STRINGID_GIVENICKNAMECAPTURED
	waitstate
	setbyte gBattleCommunication, 0
	trygivecaughtmonnick BattleScript_81D9A80
	givecaughtmon
	printfromtable gCaughtMonStringIds
	waitmessage 64
	goto BattleScript_81D9A81

BattleScript_81D9A80:: @ 81D9A80
	givecaughtmon
BattleScript_81D9A81:: @ 81D9A81
	setbyte gBattleOutcome, B_OUTCOME_CAUGHT
	finishturn

gUnknown_81D9A88:: @ 81D9A88
	printstring STRINGID_GOTCHAPKMNCAUGHT2
	setbyte gBattleOutcome, B_OUTCOME_CAUGHT
	atk57
	finishturn

BattleScript_ShakeBallThrow:: @ 81D9A93
	printfromtable gBallEscapeStringIds
	waitmessage 64
	jumpifword CMP_NO_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_SAFARI, BattleScript_81D9AC0
	jumpifbyte CMP_NOT_EQUAL, gNumSafariBalls, 0, BattleScript_81D9AC0
	printstring STRINGID_OUTOFSAFARIBALLS
	waitmessage 64
	setbyte gBattleOutcome, B_OUTCOME_NO_SAFARI_BALLS
BattleScript_81D9AC0:: @ 81D9AC0
	finishaction

BattleScript_TrainerBallBlock:: @ 81D9AC1
	waitmessage 64
	printstring STRINGID_TRAINERBLOCKEDBALL
	waitmessage 64
	printstring STRINGID_DONTBEATHIEF
	waitmessage 64
	finishaction

BattleScript_GhostBallDodge:: @ 81D9AD1
	waitmessage 64
	printstring STRINGID_ITDODGEDBALL
	waitmessage 64
	finishaction

BattleScript_81D9ADB:: @ 81D9ADB
	moveendcase 15
	end

BattleScript_81D9AE5:: @ 81D9AE5
	printstring STRINGID_EMPTYSTRING3
	pause 48
	playse SE_KAIFUKU
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

BattleScript_81D9B14:: @ 81D9B14
	printstring STRINGID_EMPTYSTRING3
	pause 48
	playse SE_KAIFUKU
	printstring STRINGID_TRAINER1USEDITEM
	waitmessage 64
	useitemonopponent
	printfromtable gTrainerItemCuredStatusStringIds
	waitmessage 64
	updatestatusicon BS_ATTACKER
	moveendcase 15
	finishaction

BattleScript_81D9B38:: @ 81D9B38
	printstring STRINGID_EMPTYSTRING3
	pause 48
	playse SE_KAIFUKU
	printstring STRINGID_TRAINER1USEDITEM
	waitmessage 64
	useitemonopponent
	printfromtable gStatUpStringIds
	waitmessage 64
	moveendcase 15
	finishaction

BattleScript_81D9B5A:: @ 81D9B5A
	printstring STRINGID_EMPTYSTRING3
	pause 48
	playse SE_KAIFUKU
	printstring STRINGID_TRAINER1USEDITEM
	waitmessage 64
	useitemonopponent
	printfromtable gMistUsedStringIds
	waitmessage 64
	moveendcase 15
	finishaction

BattleScript_81D9B7C:: @ 81D9B7C
	playse SE_NIGERU
	setbyte gBattleOutcome, B_OUTCOME_RAN
	finishturn

BattleScript_81D9B86:: @ 81D9B86
	various11 BS_ATTACKER
	jumpifbyte CMP_EQUAL, cMULTISTRING_CHOOSER, 1, BattleScript_81D9B9F
	printstring STRINGID_POKEFLUTECATCHY
	waitmessage 64
	goto BattleScript_81D9BB4

BattleScript_81D9B9F:: @ 81D9B9F
	printstring STRINGID_POKEFLUTE
	waitmessage 64
	fanfare MUS_POKEFUE
	waitfanfare BS_ATTACKER
	printstring STRINGID_MONHEARINGFLUTEAWOKE
	waitmessage 64
	updatestatusicon BS_PLAYER2
	waitstate
BattleScript_81D9BB4:: @ 81D9BB4
	finishaction

BattleScript_81D9BB5:: @ 81D9BB5
	printfromtable gSafariPokeblockResultStringIds
	waitmessage 64
	playanimation BS_OPPONENT1, B_ANIM_SAFARI_REACTION, NULL
	end2

BattleScript_81D9BC5:: @ 81D9BC5
	printstring STRINGID_THREWROCK
	waitmessage 64
	playanimation BS_ATTACKER, B_ANIM_ROCK_THROW, NULL
	end2

BattleScript_81D9BD3:: @ 81D9BD3
	printstring STRINGID_THREWBAIT
	waitmessage 64
	playanimation BS_ATTACKER, B_ANIM_BAIT_THROW, NULL
	end2

BattleScript_81D9BE1:: @ 81D9BE1
	printstring STRINGID_RETURNMON
	waitmessage 64
	returnatktoball
	waitstate
	trainerslidein BS_TARGET
	waitstate
	printstring STRINGID_YOUTHROWABALLNOWRIGHT
	waitmessage 64
	end2
