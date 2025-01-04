#ifndef GUARD_CONSTANTS_BATTLE_SCRIPT_COMMANDS_H
#define GUARD_CONSTANTS_BATTLE_SCRIPT_COMMANDS_H

// The following correspond to the struct members of BattleScripting by adding their offset
#define sPAINSPLIT_HP                (gBattleScripting + 0x00) // painSplitHp
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
#define sMULTIHIT_EFFECT             (gBattleScripting + 0x30) // multihitMoveEffect
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

enum CmdVarious
{
    VARIOUS_CANCEL_MULTI_TURN_MOVES,
    VARIOUS_IS_RUNNING_IMPOSSIBLE,
    VARIOUS_GET_MOVE_TARGET,
    VARIOUS_GET_BATTLER_FAINTED,
    VARIOUS_RESET_SWITCH_IN_ABILITY_BITS,
    VARIOUS_UPDATE_CHOICE_MOVE_ON_LVL_UP,
    VARIOUS_RESET_PLAYER_FAINTED,
    VARIOUS_PALACE_FLAVOR_TEXT,
    VARIOUS_ARENA_JUDGMENT_WINDOW,
    VARIOUS_ARENA_OPPONENT_MON_LOST,
    VARIOUS_ARENA_PLAYER_MON_LOST,
    VARIOUS_ARENA_BOTH_MONS_LOST,
    VARIOUS_EMIT_YESNOBOX,
    VARIOUS_DRAW_ARENA_REF_TEXT_BOX,
    VARIOUS_ERASE_ARENA_REF_TEXT_BOX,
    VARIOUS_ARENA_JUDGMENT_STRING,
    VARIOUS_ARENA_WAIT_STRING,
    VARIOUS_WAIT_CRY,
    VARIOUS_RETURN_OPPONENT_MON1,
    VARIOUS_RETURN_OPPONENT_MON2,
    VARIOUS_VOLUME_DOWN,
    VARIOUS_VOLUME_UP,
    VARIOUS_SET_ALREADY_STATUS_MOVE_ATTEMPT,
    VARIOUS_PALACE_TRY_ESCAPE_STATUS,
    VARIOUS_SET_TELEPORT_OUTCOME,
    VARIOUS_PLAY_TRAINER_DEFEATED_MUSIC,
    VARIOUS_STAT_TEXT_BUFFER,
    VARIOUS_SWITCHIN_ABILITIES,
    VARIOUS_INSTANT_HP_DROP,
    VARIOUS_CLEAR_STATUS,
    VARIOUS_RESTORE_PP,
    VARIOUS_TRY_ACTIVATE_MOXIE,
    VARIOUS_TRY_ACTIVATE_FELL_STINGER,
    VARIOUS_PLAY_MOVE_ANIMATION,
    VARIOUS_SET_LUCKY_CHANT,
    VARIOUS_SUCKER_PUNCH_CHECK,
    VARIOUS_SET_SIMPLE_BEAM,
    VARIOUS_TRY_ENTRAINMENT,
    VARIOUS_SET_LAST_USED_ABILITY,
    VARIOUS_INVERT_STAT_STAGES,
    VARIOUS_TRY_ME_FIRST,
    VARIOUS_JUMP_IF_BATTLE_END,
    VARIOUS_TRY_ELECTRIFY,
    VARIOUS_TRY_SOAK,
    VARIOUS_TRY_LAST_RESORT,
    VARIOUS_SET_ARG_TO_BATTLE_DAMAGE,
    VARIOUS_TRY_AUTOTOMIZE,
    VARIOUS_ABILITY_POPUP,
    VARIOUS_JUMP_IF_TARGET_ALLY,
    VARIOUS_TRY_SYNCHRONOISE,
    VARIOUS_PSYCHO_SHIFT,
    VARIOUS_CURE_STATUS,
    VARIOUS_POWER_TRICK,
    VARIOUS_AFTER_YOU,
    VARIOUS_BESTOW,
    VARIOUS_JUMP_IF_NOT_GROUNDED,
    VARIOUS_HANDLE_TRAINER_SLIDE_MSG,
    VARIOUS_TRY_TRAINER_SLIDE_MSG_FIRST_OFF,
    VARIOUS_TRY_TRAINER_SLIDE_MSG_LAST_ON,
    VARIOUS_SET_AURORA_VEIL,
    VARIOUS_TRY_THIRD_TYPE,
    VARIOUS_ACUPRESSURE,
    VARIOUS_SET_POWDER,
    VARIOUS_SPECTRAL_THIEF,
    VARIOUS_GRAVITY_ON_AIRBORNE_MONS,
    VARIOUS_CHECK_IF_GRASSY_TERRAIN_HEALS,
    VARIOUS_JUMP_IF_ROAR_FAILS,
    VARIOUS_TRY_INSTRUCT,
    VARIOUS_JUMP_IF_NOT_BERRY,
    VARIOUS_TRACE_ABILITY,
    VARIOUS_UPDATE_NICK,
    VARIOUS_TRY_ILLUSION_OFF,
    VARIOUS_SET_SPRITEIGNORE0HP,
    VARIOUS_HANDLE_FORM_CHANGE,
    VARIOUS_GET_STAT_VALUE,
    VARIOUS_JUMP_IF_FULL_HP,
    VARIOUS_LOSE_TYPE,
    VARIOUS_TRY_ACTIVATE_SOULHEART,
    VARIOUS_TRY_ACTIVATE_RECEIVER,
    VARIOUS_TRY_ACTIVATE_BEAST_BOOST,
    VARIOUS_TRY_FRISK,
    VARIOUS_JUMP_IF_SHIELDS_DOWN_PROTECTED,
    VARIOUS_TRY_FAIRY_LOCK,
    VARIOUS_JUMP_IF_NO_ALLY,
    VARIOUS_POISON_TYPE_IMMUNITY,
    VARIOUS_JUMP_IF_HOLD_EFFECT,
    VARIOUS_INFATUATE_WITH_BATTLER,
    VARIOUS_SET_LAST_USED_ITEM,
    VARIOUS_PARALYZE_TYPE_IMMUNITY,
    VARIOUS_JUMP_IF_ABSENT,
    VARIOUS_DESTROY_ABILITY_POPUP,
    VARIOUS_TOTEM_BOOST,
    VARIOUS_TRY_ACTIVATE_GRIM_NEIGH,
    VARIOUS_MOVEEND_ITEM_EFFECTS,
    VARIOUS_TERRAIN_SEED,
    VARIOUS_MAKE_INVISIBLE,
    VARIOUS_ROOM_SERVICE,
    VARIOUS_JUMP_IF_TEAM_HEALTHY,
    VARIOUS_TRY_HEAL_QUARTER_HP,
    VARIOUS_JUMP_IF_PRANKSTER_BLOCKED,
    VARIOUS_TRY_TO_CLEAR_PRIMAL_WEATHER,
    VARIOUS_GET_ROTOTILLER_TARGETS,
    VARIOUS_JUMP_IF_NOT_ROTOTILLER_AFFECTED,
    VARIOUS_TRY_ACTIVATE_BATTLE_BOND,
    VARIOUS_CONSUME_BERRY,
    VARIOUS_JUMP_IF_CANT_REVERT_TO_PRIMAL,
    VARIOUS_JUMP_IF_SPECIES,
    VARIOUS_UPDATE_ABILITY_POPUP,
    VARIOUS_JUMP_IF_WEATHER_AFFECTED,
    VARIOUS_JUMP_IF_LEAF_GUARD_PROTECTED,
    VARIOUS_SET_ATTACKER_STICKY_WEB_USER,
    VARIOUS_TRY_NO_RETREAT,
    VARIOUS_CHECK_POLTERGEIST,
    VARIOUS_CUT_1_3_HP_RAISE_STATS,
    VARIOUS_TRY_END_NEUTRALIZING_GAS,
    VARIOUS_JUMP_IF_UNDER_200,
    VARIOUS_SET_SKY_DROP,
    VARIOUS_CLEAR_SKY_DROP,
    VARIOUS_SKY_DROP_YAWN,
    VARIOUS_CURE_CERTAIN_STATUSES,
    VARIOUS_TRY_RESET_NEGATIVE_STAT_STAGES,
    VARIOUS_JUMP_IF_LAST_USED_ITEM_BERRY,
    VARIOUS_JUMP_IF_LAST_USED_ITEM_HOLD_EFFECT,
    VARIOUS_SAVE_BATTLER_ITEM,
    VARIOUS_RESTORE_BATTLER_ITEM,
    VARIOUS_BATTLER_ITEM_TO_LAST_USED_ITEM,
    VARIOUS_SWAP_SIDE_STATUSES,
    VARIOUS_SWAP_STATS,
    // pokefirered
    VARIOUS_GET_BATTLERS_FOR_RECALL, // for battle tower
};

// Cmd_manipulatedamage
#define DMG_CHANGE_SIGN         1
#define DMG_RECOIL_FROM_MISS    2
#define DMG_DOUBLED             3
#define DMG_1_8_TARGET_HP       4
#define DMG_FULL_ATTACKER_HP    5
#define DMG_CURR_ATTACKER_HP    6
#define DMG_BIG_ROOT            7
#define DMG_RECOIL_FROM_IMMUNE  8  // Used to calculate recoil for the Gen 4 version of Jump Kick

// Cmd_jumpifcantswitch
#define SWITCH_IGNORE_ESCAPE_PREVENTION   (1 << 7)

// Cmd_statbuffchange
#define STAT_CHANGE_ALLOW_PTR               (1 << 0)   // If set, allow use of jumpptr. Set in every use of statbuffchange
#define STAT_CHANGE_MIRROR_ARMOR            (1 << 1)   // Stat change redirection caused by Mirror Armor ability.
#define STAT_CHANGE_NOT_PROTECT_AFFECTED    (1 << 5)
#define STAT_CHANGE_UPDATE_MOVE_EFFECT      (1 << 6)

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
enum MoveEndEffects
{
    MOVEEND_SUM_DAMAGE,
    MOVEEND_PROTECT_LIKE_EFFECT,
    MOVEEND_ABSORB,
    MOVEEND_RAGE,
    MOVEEND_SYNCHRONIZE_TARGET,
    MOVEEND_ABILITIES,
    MOVEEND_ABILITIES_ATTACKER,
    MOVEEND_STATUS_IMMUNITY_ABILITIES,
    MOVEEND_SYNCHRONIZE_ATTACKER,
    MOVEEND_CHOICE_MOVE,
    MOVEEND_ATTACKER_INVISIBLE,
    MOVEEND_ATTACKER_VISIBLE,
    MOVEEND_TARGET_VISIBLE,
    MOVEEND_ITEM_EFFECTS_TARGET,
    MOVEEND_MOVE_EFFECTS2,
    MOVEEND_ITEM_EFFECTS_ALL,
    MOVEEND_KINGSROCK, // These item effects will occur each strike of a multi-hit move
    MOVEEND_NUM_HITS,
    MOVEEND_SUBSTITUTE,
    MOVEEND_SKY_DROP_CONFUSE,
    MOVEEND_UPDATE_LAST_MOVES,
    MOVEEND_MIRROR_MOVE,
    MOVEEND_NEXT_TARGET, // Everything up until here is handled for each strike of a multi-hit move
    MOVEEND_MULTIHIT_MOVE,
    MOVEEND_DEFROST,
    MOVEEND_RECOIL,
    MOVEEND_ITEM_EFFECTS_ATTACKER,
    MOVEEND_MAGICIAN, // Occurs after final multi-hit strike, and after other items/abilities would activate
    MOVEEND_RED_CARD, // Red Card triggers before Eject Pack
    MOVEEND_EJECT_ITEMS,
    MOVEEND_WHITE_HERB,
    MOVEEND_LIFEORB_SHELLBELL, // Includes shell bell, throat spray, etc
    MOVEEND_CHANGED_ITEMS,
    MOVEEND_PICKPOCKET,
    MOVEEND_DANCER,
    MOVEEND_EMERGENCY_EXIT,
    MOVEEND_SYMBIOSIS,
    MOVEEND_OPPORTUNIST, // Occurs after other stat change items/abilities to try and copy the boosts
    MOVEEND_SAME_MOVE_TURNS,
    MOVEEND_SET_EVOLUTION_TRACKER,
    MOVEEND_CLEAR_BITS,
    MOVEEND_PURSUIT_NEXT_ACTION,
    MOVEEND_COUNT,
};

// switch cases
#define B_SWITCH_NORMAL     0
#define B_SWITCH_HIT        1   // dragon tail, circle throw
#define B_SWITCH_RED_CARD   2

// Argument labels for EFFECT_HIT_SET_REMOVE_TERRAIN
#define ARG_SET_PSYCHIC_TERRAIN        0
#define ARG_TRY_REMOVE_TERRAIN_HIT     1
#define ARG_TRY_REMOVE_TERRAIN_FAIL    2

#endif // GUARD_CONSTANTS_BATTLE_SCRIPT_COMMANDS_H
