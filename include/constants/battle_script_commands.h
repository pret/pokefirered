#ifndef GUARD_CONSTANTS_BATTLE_SCRIPT_COMMANDS_H
#define GUARD_CONSTANTS_BATTLE_SCRIPT_COMMANDS_H

// The following correspond to the struct members of BattleScripting by adding their offset
#define sPAINSPLIT_HP                (gBattleScripting + 0x00) // painSplitHp
#define sBIDE_DMG                    (gBattleScripting + 0x04) // bideDmg
#define sMULTIHIT_STRING             (gBattleScripting + 0x08) // multihitString
#define sEXP_CATCH                   (gBattleScripting + 0x0E) // expOnCatch
#define sUNUSED                      (gBattleScripting + 0x0F) // unused
#define sB_ANIM_ARG1                 (gBattleScripting + 0x10) // animArg1
#define sB_ANIM_ARG2                 (gBattleScripting + 0x11) // animArg2
#define sSAVED_STRINID               (gBattleScripting + 0x12) // savedStringId
#define sMOVEEND_STATE               (gBattleScripting + 0x14) // moveendState
#define sSAVED_STAT_CHANGER          (gBattleScripting + 0x15) // savedStatChanger
#define sSHIFT_SWITCHED              (gBattleScripting + 0x16) // shiftSwitched
#define sBATTLER                     (gBattleScripting + 0x17) // battler
#define sB_ANIM_TURN                 (gBattleScripting + 0x18) // animTurn
#define sB_ANIM_TARGETS_HIT          (gBattleScripting + 0x19) // animTargetsHit
#define sSTATCHANGER                 (gBattleScripting + 0x1A) // statChanger
#define sSTAT_ANIM_PLAYED            (gBattleScripting + 0x1B) // statAnimPlayed
#define sGIVEEXP_STATE               (gBattleScripting + 0x1C) // getexpState
#define sBATTLE_STYLE                (gBattleScripting + 0x1D) // battleStyle
#define sLVLBOX_STATE                (gBattleScripting + 0x1E) // drawlvlupboxState
#define sLEARNMOVE_STATE             (gBattleScripting + 0x1F) // learnMoveState
#define sSAVED_BATTLER               (gBattleScripting + 0x20) // savedBattler
#define sRESHOW_MAIN_STATE           (gBattleScripting + 0x21) // reshowMainState
#define sRESHOW_HELPER_STATE         (gBattleScripting + 0x22) // reshowHelperState
#define sLVLUP_HP                    (gBattleScripting + 0x23) // levelUpHP
#define sWINDOWS_TYPE                (gBattleScripting + 0x24) // windowsType
#define sMULTIPLAYER_ID              (gBattleScripting + 0x25) // multiplayerId
#define sSPECIAL_TRAINER_BATTLE_TYPE (gBattleScripting + 0x26) // specialTrainerBattleType
#define sMON_CAUGHT                  (gBattleScripting + 0x27) // monCaught
#define sSAVED_DMG                   (gBattleScripting + 0x28) // savedDmg
#define sSAVED_MOVE_EFFECT           (gBattleScripting + 0x2C) // savedMoveEffect
#define sMOVE_EFFECT                 (gBattleScripting + 0x2E) // moveEffect
#define sMULTIHIT_EFFECT             (gBattleScripting + 0x30) // multihitMoveEffect
#define sILLUSION_NICK_HACK          (gBattleScripting + 0x32) // illusionNickHack
#define sFIXED_ABILITY_POPUP         (gBattleScripting + 0x33) // fixedPopup
#define sABILITY_OVERWRITE           (gBattleScripting + 0x34) // abilityPopupOverwrite
#define sSWITCH_CASE                 (gBattleScripting + 0x36) // switchCase
#define sBERRY_OVERRIDE              (gBattleScripting + 0x37) // overrideBerryRequirements
#define sSTICKY_WEB_STAT_DROP        (gBattleScripting + 0x38) // stickyWebStatDrop
#define sDMG_MULTIPLIER              (gBattleScripting + 0x39) // dmgMultiplier
#define sTWOTURN_STRINGID            (gBattleScripting + 0x3A) // twoTurnsMoveStringId
#define sBATTLER_WITH_ABILITY        (gBattleScripting + 0x3B) // battlerWithAbility
#define sTRIPLE_KICK_POWER           (gBattleScripting + 0x3C)// tripleKickPower
#define sPURSUIT_DOUBLES_ATTACKER    (gBattleScripting + 0x3E) // pursuitDoublesAttacker

// Array entries for battle communication
#define MULTIUSE_STATE          0
#define CURSOR_POSITION         1
#define TASK_ID                 1 // task Id and cursor position share the same field
#define SPRITES_INIT_STATE1     1 // shares the Id as well
#define SPRITES_INIT_STATE2     2
#define MOVE_EFFECT_BYTE        3
#define ACTIONS_CONFIRMED_COUNT 4
#define MULTISTRING_CHOOSER     5
#define MISS_TYPE               6
#define MSG_DISPLAY             7
#define BATTLE_COMMUNICATION_ENTRIES_COUNT  8

#define cEFFECT_CHOOSER      (gBattleCommunication + MOVE_EFFECT_BYTE)
#define cMULTISTRING_CHOOSER (gBattleCommunication + MULTISTRING_CHOOSER)
#define cMISS_TYPE           (gBattleCommunication + MISS_TYPE)

// Battle Script defines for getting the wanted battler
#define BS_TARGET                   0
#define BS_ATTACKER                 1
#define BS_EFFECT_BATTLER           2
#define BS_FAINTED                  3
#define BS_ATTACKER_WITH_PARTNER    4 // for Cmd_updatestatusicon
#define BS_FAINTED_LINK_MULTIPLE_1  5 // for openpartyscreen
#define BS_FAINTED_LINK_MULTIPLE_2  6 // for openpartyscreen
#define BS_BATTLER_0                7
#define BS_ATTACKER_SIDE            8 // for Cmd_jumpifability
#define BS_NOT_ATTACKER_SIDE        9 // for Cmd_jumpifability
#define BS_SCRIPTING                10
#define BS_PLAYER1                  11
#define BS_OPPONENT1                12
#define BS_PLAYER2                  13 // for Cmd_updatestatusicon
#define BS_OPPONENT2                14
#define BS_ABILITY_BATTLER          15
#define BS_ATTACKER_PARTNER         16

// atk 01, accuracy calc
#define NO_ACC_CALC 0xFFFE
#define NO_ACC_CALC_CHECK_LOCK_ON 0xFFFF
#define ACC_CURR_MOVE 0

// compare operands
#define CMP_EQUAL               0x0
#define CMP_NOT_EQUAL           0x1
#define CMP_GREATER_THAN        0x2
#define CMP_LESS_THAN           0x3
#define CMP_COMMON_BITS         0x4
#define CMP_NO_COMMON_BITS      0x5

// TODO: documentation
// atk76, various
#define VARIOUS_CANCEL_MULTI_TURN_MOVES         0
#define VARIOUS_SET_MAGIC_COAT_TARGET           1
#define VARIOUS_IS_RUNNING_IMPOSSIBLE           2
#define VARIOUS_GET_MOVE_TARGET                 3
#define VARIOUS_GET_BATTLER_FAINTED             4
#define VARIOUS_RESET_INTIMIDATE_TRACE_BITS     5
#define VARIOUS_UPDATE_CHOICE_MOVE_ON_LVL_UP    6
#define VARIOUS_RESET_PLAYER_FAINTED            7
#define VARIOUS_GET_BATTLERS_FOR_RECALL         8
#define VARIOUS_RETURN_OPPONENT_MON1            9
#define VARIOUS_RETURN_OPPONENT_MON2            10
#define VARIOUS_CHECK_POKEFLUTE                 11
#define VARIOUS_WAIT_FANFARE                    12
#define VARIOUS_PLAY_MOVE_ANIMATION             36
#define VARIOUS_ABILITY_POPUP                   53

// Cmd_manipulatedmg
#define DMG_CHANGE_SIGN            0
#define DMG_RECOIL_FROM_MISS       1
#define DMG_DOUBLED                2

// Cmd_jumpifcantswitch
#define SWITCH_IGNORE_ESCAPE_PREVENTION   (1 << 7)

// Cmd_statbuffchange
#define STAT_CHANGE_ALLOW_PTR               (1 << 0)   // If set, allow use of jumpptr. Set in every use of statbuffchange
#define STAT_CHANGE_NOT_PROTECT_AFFECTED    (1 << 5)

// stat change flags for Cmd_playstatchangeanimation
#define STAT_CHANGE_NEGATIVE             (1 << 0)
#define STAT_CHANGE_BY_TWO               (1 << 1)
#define STAT_CHANGE_MULTIPLE_STATS       (1 << 2)
#define STAT_CHANGE_CANT_PREVENT         (1 << 3)

// stat flags for Cmd_playstatchangeanimation
#define BIT_HP                      (1 << 0)
#define BIT_ATK                     (1 << 1)
#define BIT_DEF                     (1 << 2)
#define BIT_SPEED                   (1 << 3)
#define BIT_SPATK                   (1 << 4)
#define BIT_SPDEF                   (1 << 5)
#define BIT_ACC                     (1 << 6)
#define BIT_EVASION                 (1 << 7)

#define PARTY_SCREEN_OPTIONAL (1 << 7) // Flag for first argument to openpartyscreen

// cases for Cmd_moveend
#define MOVEEND_RAGE                            0
#define MOVEEND_DEFROST                         1
#define MOVEEND_SYNCHRONIZE_TARGET              2
#define MOVEEND_ON_DAMAGE_ABILITIES             3
#define MOVEEND_IMMUNITY_ABILITIES              4
#define MOVEEND_SYNCHRONIZE_ATTACKER            5
#define MOVEEND_CHOICE_MOVE                     6
#define MOVEEND_CHANGED_ITEMS                   7
#define MOVEEND_ATTACKER_INVISIBLE              8
#define MOVEEND_ATTACKER_VISIBLE                9
#define MOVEEND_TARGET_VISIBLE                  10
#define MOVEEND_ITEM_EFFECTS_ALL                11
#define MOVEEND_KINGSROCK_SHELLBELL             12
#define MOVEEND_SUBSTITUTE                      13
#define MOVEEND_UPDATE_LAST_MOVES               14
#define MOVEEND_MIRROR_MOVE                     15
#define MOVEEND_NEXT_TARGET                     16
#define MOVEEND_COUNT                           17

// switch cases
#define B_SWITCH_NORMAL     0
#define B_SWITCH_HIT        1   // dragon tail, circle throw
#define B_SWITCH_RED_CARD   2

// Argument labels for EFFECT_HIT_SET_REMOVE_TERRAIN
#define ARG_SET_PSYCHIC_TERRAIN        0
#define ARG_TRY_REMOVE_TERRAIN_HIT     1
#define ARG_TRY_REMOVE_TERRAIN_FAIL    2

#endif // GUARD_CONSTANTS_BATTLE_SCRIPT_COMMANDS_H
