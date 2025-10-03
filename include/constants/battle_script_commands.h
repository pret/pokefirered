#ifndef GUARD_CONSTANTS_BATTLE_SCRIPT_COMMANDS_H
#define GUARD_CONSTANTS_BATTLE_SCRIPT_COMMANDS_H

// The following correspond to the struct members of BattleScripting by adding their offset
#define sUNUSED_0x00                 (gBattleScripting + 0x00) // unused_0x00
#define sUNUSED_0x04                 (gBattleScripting + 0x04) // unused_0x04
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
#define sUNUSED_0x30                 (gBattleScripting + 0x30) // unused_0x30
#define sILLUSION_NICK_HACK          (gBattleScripting + 0x32) // illusionNickHack
#define sFIXED_ABILITY_POPUP         (gBattleScripting + 0x33) // fixedPopup
#define sABILITY_OVERWRITE           (gBattleScripting + 0x34) // abilityPopupOverwrite
#define sSWITCH_CASE                 (gBattleScripting + 0x36) // switchCase
#define sBERRY_OVERRIDE              (gBattleScripting + 0x37) // overrideBerryRequirements
#define sSTICKY_WEB_STAT_DROP        (gBattleScripting + 0x38) // stickyWebStatDrop

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

#define cMULTISTRING_CHOOSER (gBattleCommunication + MULTISTRING_CHOOSER)
#define cMISS_TYPE           (gBattleCommunication + MISS_TYPE)

// Battle Script defines for getting the wanted battler
#define BS_TARGET                   0
#define BS_ATTACKER                 1
#define BS_EFFECT_BATTLER           2
#define BS_FAINTED                  3
#define BS_ATTACKER_WITH_PARTNER    4 // for Cmd_updatestatusicon
#define BS_FAINTED_MULTIPLE_1       5 // for openpartyscreen
#define BS_FAINTED_MULTIPLE_2       6 // for openpartyscreen
#define BS_BATTLER_0                7
#define BS_ATTACKER_SIDE            8 // for Cmd_jumpifability
#define BS_TARGET_SIDE              9 // for Cmd_jumpifability
#define BS_SCRIPTING                10
#define BS_PLAYER1                  11
#define BS_OPPONENT1                12
#define BS_PLAYER2                  13 // for Cmd_updatestatusicon
#define BS_OPPONENT2                14
#define BS_ABILITY_BATTLER          15
#define BS_ATTACKER_PARTNER         16

// Cmd_accuracycheck
#define NO_ACC_CALC_CHECK_LOCK_ON 0xFFFF
#define ACC_CURR_MOVE 0

// compare operands
#define CMP_EQUAL               0
#define CMP_NOT_EQUAL           1
#define CMP_GREATER_THAN        2
#define CMP_LESS_THAN           3
#define CMP_COMMON_BITS         4
#define CMP_NO_COMMON_BITS      5

// Veriouses have been deprecated but the enum and function will be supported for one more release cycle
enum CmdVarious
{
    VARIOUS_NONE,
};

// Cmd_manipulatedamage
#define DMG_CHANGE_SIGN         1
#define DMG_DOUBLED             2
#define DMG_1_8_TARGET_HP       3
#define DMG_FULL_ATTACKER_HP    4
#define DMG_BIG_ROOT            5

// Cmd_jumpifcantswitch
#define SWITCH_IGNORE_ESCAPE_PREVENTION   (1 << 7)

// Cmd_statbuffchange
#define STAT_CHANGE_ALLOW_PTR               (1 << 0)   // If set, allow use of jumpptr. If not set and unable to raise/lower stats, jump to failInstr.
#define STAT_CHANGE_MIRROR_ARMOR            (1 << 1)   // Stat change redirection caused by Mirror Armor ability.
#define STAT_CHANGE_ONLY_CHECKING           (1 << 2)   // Checks if the stat change can occur. Does not change stats or play stat change animation.
#define STAT_CHANGE_NOT_PROTECT_AFFECTED    (1 << 3)
#define STAT_CHANGE_UPDATE_MOVE_EFFECT      (1 << 4)
#define STAT_CHANGE_CHECK_PREVENTION        (1 << 5)
#define STAT_CHANGE_CERTAIN                 (1 << 6)

// stat flags for TryPlayStatChangeAnimation
#define BIT_HP                      (1 << 0)
#define BIT_ATK                     (1 << 1)
#define BIT_DEF                     (1 << 2)
#define BIT_SPEED                   (1 << 3)
#define BIT_SPATK                   (1 << 4)
#define BIT_SPDEF                   (1 << 5)
#define BIT_ACC                     (1 << 6)
#define BIT_EVASION                 (1 << 7)

#define PARTY_SCREEN_OPTIONAL (1 << 7) // Flag for first argument to openpartyscreen

// cases for Cmd_moveend - Order matters!
enum MoveEndEffects
{
    MOVEEND_SET_VALUES,
    MOVEEND_PROTECT_LIKE_EFFECT,
    MOVEEND_ABSORB,
    MOVEEND_RAGE,
    MOVEEND_SYNCHRONIZE_TARGET,
    MOVEEND_ABILITIES,
    MOVEEND_ABILITIES_ATTACKER,
    MOVEEND_STATUS_IMMUNITY_ABILITIES,
    MOVEEND_SYNCHRONIZE_ATTACKER,
    MOVEEND_ATTACKER_INVISIBLE,
    MOVEEND_ATTACKER_VISIBLE,
    MOVEEND_TARGET_VISIBLE,
    MOVEEND_ITEM_EFFECTS_TARGET,
    MOVEEND_ITEM_EFFECTS_ALL,
    MOVEEND_SYMBIOSIS,
    MOVEEND_KINGSROCK, // These item effects will occur each strike of a multi-hit move
    MOVEEND_SUBSTITUTE,
    MOVEEND_SKY_DROP_CONFUSE,
    MOVEEND_UPDATE_LAST_MOVES,
    MOVEEND_MIRROR_MOVE,
    MOVEEND_DEFROST,
    MOVEEND_NEXT_TARGET, // Everything up until here is handled for each strike of a spread move
    MOVEEND_MULTIHIT_MOVE,
    MOVEEND_MOVE_BLOCK,
    MOVEEND_ITEM_EFFECTS_ATTACKER,
    MOVEEND_ABILITY_BLOCK,
    MOVEEND_SHEER_FORCE, // If move is Sheer Force affected, skip until Opportunist
    MOVEEND_COLOR_CHANGE, // Color Change / Berserk / Anger Shell
    MOVEEND_RED_CARD, 
    MOVEEND_EJECT_BUTTON,
    MOVEEND_LIFEORB_SHELLBELL, 
    MOVEEND_FORM_CHANGE,
    MOVEEND_EMERGENCY_EXIT,
    MOVEEND_EJECT_PACK,
    MOVEEND_HIT_ESCAPE,
    MOVEEND_OPPORTUNIST,
    MOVEEND_MIRROR_HERB,
    MOVEEND_PICKPOCKET,
    MOVEEND_WHITE_HERB,
    MOVEEND_THIRD_MOVE_BLOCK,
    MOVEEND_CHANGED_ITEMS,
    MOVEEND_SAME_MOVE_TURNS,
    MOVEEND_CLEAR_BITS,
    MOVEEND_DANCER,
    MOVEEND_PURSUIT_NEXT_ACTION,
    MOVEEND_COUNT,
};

// switch cases
#define B_SWITCH_NORMAL     0
#define B_SWITCH_HIT        1   // dragon tail, circle throw
#define B_SWITCH_RED_CARD   2

enum StatusTrigger
{
    TRIGGER_ON_MOVE,
    TRIGGER_ON_ABILITY,
    TRIGGER_ON_PROTECT,
};

enum TriggerOnFieldStatus
{
    ON_ANY,
    ON_TERRAIN,
    ON_WEATHER,
};

#endif // GUARD_CONSTANTS_BATTLE_SCRIPT_COMMANDS_H
