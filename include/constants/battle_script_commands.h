#ifndef GUARD_CONSTANTS_BATTLE_SCRIPT_COMMANDS_H
#define GUARD_CONSTANTS_BATTLE_SCRIPT_COMMANDS_H

enum BattleScriptOpcode
{
    B_SCR_OP_ATTACKCANCELER,
    B_SCR_OP_ACCURACYCHECK,
    B_SCR_OP_PRINTATTACKSTRING,
    B_SCR_OP_PRINTSELECTIONSTRINGFROMTABLE,
    B_SCR_OP_CRITCALC,
    B_SCR_OP_DAMAGECALC,
    B_SCR_OP_TYPECALC,
    B_SCR_OP_ADJUSTDAMAGE,
    B_SCR_OP_MULTIHITRESULTMESSAGE,
    B_SCR_OP_ATTACKANIMATION,
    B_SCR_OP_WAITANIMATION,
    B_SCR_OP_HEALTHBARUPDATE,
    B_SCR_OP_DATAHPUPDATE,
    B_SCR_OP_CRITMESSAGE,
    B_SCR_OP_EFFECTIVENESSSOUND,
    B_SCR_OP_RESULTMESSAGE,
    B_SCR_OP_PRINTSTRING,
    B_SCR_OP_PRINTSELECTIONSTRING,
    B_SCR_OP_WAITMESSAGE,
    B_SCR_OP_PRINTFROMTABLE,
    B_SCR_OP_SETPREATTACKADDITIONALEFFECT,
    B_SCR_OP_SETADDITIONALEFFECTS,
    B_SCR_OP_SETEFFECTPRIMARY,
    B_SCR_OP_SETEFFECTSECONDARY,
    B_SCR_OP_CLEARVOLATILE,
    B_SCR_OP_TRYFAINTMON,
    B_SCR_OP_DOFAINTANIMATION,
    B_SCR_OP_CLEAREFFECTSONFAINT,
    B_SCR_OP_JUMPIFSTATUS,
    B_SCR_OP_JUMPIFVOLATILE,
    B_SCR_OP_JUMPIFABILITY,
    B_SCR_OP_JUMPIFSIDEAFFECTING,
    B_SCR_OP_JUMPIFSTAT,
    B_SCR_OP_JUMPIFSTATIGNORECONTRARY,
    B_SCR_OP_JUMPBASEDONTYPE,
    B_SCR_OP_GETEXP,
    B_SCR_OP_CHECKTEAMSLOST,
    B_SCR_OP_MOVEVALUESCLEANUP,
    B_SCR_OP_SETMULTIHIT,
    B_SCR_OP_DECREMENTMULTIHIT,
    B_SCR_OP_GOTO,
    B_SCR_OP_JUMPIFBYTE,
    B_SCR_OP_JUMPIFHALFWORD,
    B_SCR_OP_JUMPIFWORD,
    B_SCR_OP_JUMPIFARRAYEQUAL,
    B_SCR_OP_JUMPIFARRAYNOTEQUAL,
    B_SCR_OP_SETBYTE,
    B_SCR_OP_ADDBYTE,
    B_SCR_OP_SUBBYTE,
    B_SCR_OP_COPYARRAY,
    B_SCR_OP_COPYARRAYWITHINDEX,
    B_SCR_OP_ORBYTE,
    B_SCR_OP_ORHALFWORD,
    B_SCR_OP_ORWORD,
    B_SCR_OP_BICBYTE,
    B_SCR_OP_BICHALFWORD,
    B_SCR_OP_BICWORD,
    B_SCR_OP_PAUSE,
    B_SCR_OP_WAITSTATE,
    B_SCR_OP_ISDMGBLOCKEDBYDISGUISE,
    B_SCR_OP_RETURN,
    B_SCR_OP_END,
    B_SCR_OP_END2,
    B_SCR_OP_END3,
    B_SCR_OP_SETCHARGINGTURN,
    B_SCR_OP_CALL,
    B_SCR_OP_SETROOST,
    B_SCR_OP_JUMPIFABILITYPRESENT,
    B_SCR_OP_ENDSELECTIONSCRIPT,
    B_SCR_OP_PLAYANIMATION,
    B_SCR_OP_PLAYANIMATION_VAR,
    B_SCR_OP_JUMPFIFSEMIINVULNERABLE,
    B_SCR_OP_TRAINERSLIDEIN,
    B_SCR_OP_MOVEEND,
    B_SCR_OP_SETHEALBLOCK,
    B_SCR_OP_RETURNATKTOBALL,
    B_SCR_OP_GETSWITCHEDMONDATA,
    B_SCR_OP_SWITCHINDATAUPDATE,
    B_SCR_OP_SWITCHINANIM,
    B_SCR_OP_JUMPIFCANTSWITCH,
    B_SCR_OP_OPENPARTYSCREEN,
    B_SCR_OP_SWITCHHANDLEORDER,
    B_SCR_OP_SWITCHINEFFECTS,
    B_SCR_OP_SWITCHINEVENTS,
    B_SCR_OP_PLAYSE,
    B_SCR_OP_FANFARE,
    B_SCR_OP_PLAYFAINTCRY,
    B_SCR_OP_ENDLINKBATTLE,
    B_SCR_OP_RETURNTOBALL,
    B_SCR_OP_HANDLELEARNNEWMOVE,
    B_SCR_OP_YESNOBOXLEARNMOVE,
    B_SCR_OP_YESNOBOXSTOPLEARNINGMOVE,
    B_SCR_OP_HITANIMATION,
    B_SCR_OP_GETMONEYREWARD,
    B_SCR_OP_UPDATEBATTLERMOVES,
    B_SCR_OP_SWAPATTACKERWITHTARGET,
    B_SCR_OP_INCREMENTGAMESTAT,
    B_SCR_OP_DRAWPARTYSTATUSSUMMARY,
    B_SCR_OP_HIDEPARTYSTATUSSUMMARY,
    B_SCR_OP_JUMPTOCALLEDMOVE,
    B_SCR_OP_STATUSANIMATION,
    B_SCR_OP_FUTURESIGHTTARGETFAILURE,
    B_SCR_OP_GETPOSSIBLENEXTTARGET,
    B_SCR_OP_YESNOBOX,
    B_SCR_OP_CANCELALLACTIONS,
    B_SCR_OP_SETGRAVITY,
    B_SCR_OP_REMOVEITEM,
    B_SCR_OP_ATKNAMEINBUFF1,
    B_SCR_OP_DRAWLVLUPBOX,
    B_SCR_OP_RESETSENTMONSVALUE,
    B_SCR_OP_SETATKTOPLAYER0,
    B_SCR_OP_MAKEVISIBLE,
    B_SCR_OP_RECORDABILITY,
    B_SCR_OP_BUFFERMOVETOLEARN,
    B_SCR_OP_JUMPIFPLAYERRAN,
    B_SCR_OP_HPTHRESHOLDS,
    B_SCR_OP_HPTHRESHOLDS2,
    B_SCR_OP_USEITEMONOPPONENT,
    B_SCR_OP_UNUSED_0X78,
    B_SCR_OP_SETPROTECTLIKE,
    B_SCR_OP_TRYEXPLOSION,
    B_SCR_OP_SETATKHPTOZERO,
    B_SCR_OP_JUMPIFNEXTTARGETVALID,
    B_SCR_OP_TRYHEALHALFHEALTH,
    B_SCR_OP_UNUSED_0X7E,
    B_SCR_OP_SETFIELDWEATHER,
    B_SCR_OP_SETREFLECT,
    B_SCR_OP_SETSEEDED,
    B_SCR_OP_MANIPULATEDAMAGE,
    B_SCR_OP_TRYSETREST,
    B_SCR_OP_UNUSED_0X82,
    B_SCR_OP_UNUSED_0X83,
    B_SCR_OP_JUMPIFUPROARWAKES,
    B_SCR_OP_STOCKPILE,
    B_SCR_OP_STOCKPILETOBASEDAMAGE,
    B_SCR_OP_STOCKPILETOHPHEAL,
    B_SCR_OP_UNUSED_0X88,
    B_SCR_OP_STATBUFFCHANGE,
    B_SCR_OP_NORMALISEBUFFS,
    B_SCR_OP_SETBIDE,
    B_SCR_OP_TWOTURNMOVESCHARGESTRINGANDANIMATION,
    B_SCR_OP_TRYNONVOLATILESTATUS,
    B_SCR_OP_INITMULTIHITSTRING,
    B_SCR_OP_FORCERANDOMSWITCH,
    B_SCR_OP_TRYCONVERSIONTYPECHANGE,
    B_SCR_OP_GIVEPAYDAYMONEY,
    B_SCR_OP_SETLIGHTSCREEN,
    B_SCR_OP_TRYKO,
    B_SCR_OP_CHECKNONVOLATILETRIGGER,
    B_SCR_OP_COPYBIDEDMG,
    B_SCR_OP_ANIMATEWILDPOKEMONAFTERFAILEDPOKEBALL,
    B_SCR_OP_TRYINFATUATING,
    B_SCR_OP_UPDATESTATUSICON,
    B_SCR_OP_SETMIST,
    B_SCR_OP_SETFOCUSENERGY,
    B_SCR_OP_TRANSFORMDATAEXECUTION,
    B_SCR_OP_SETSUBSTITUTE,
    B_SCR_OP_MIMICATTACKCOPY,
    B_SCR_OP_SETCALLEDMOVE,
    B_SCR_OP_UNUSED_0X9F,
    B_SCR_OP_UNUSED_0XA0,
    B_SCR_OP_UNUSED_0XA1,
    B_SCR_OP_UNUSED_0XA2,
    B_SCR_OP_DISABLELASTUSEDATTACK,
    B_SCR_OP_TRYSETENCORE,
    B_SCR_OP_PAINSPLITDMGCALC,
    B_SCR_OP_SETTYPETORANDOMRESISTANCE,
    B_SCR_OP_SETALWAYSHITFLAG,
    B_SCR_OP_COPYMOVEPERMANENTLY,
    B_SCR_OP_UNUSED_0XA9,
    B_SCR_OP_UNUSED_AA,
    B_SCR_OP_UNUSED_0XAB,
    B_SCR_OP_SETTAILWIND,
    B_SCR_OP_TRYSPITEPPREDUCE,
    B_SCR_OP_HEALPARTYSTATUS,
    B_SCR_OP_CURSETARGET,
    B_SCR_OP_TRYSETSPIKES,
    B_SCR_OP_SETVOLATILE,
    B_SCR_OP_TRYSETPERISHSONG,
    B_SCR_OP_UNUSED_0XB3,
    B_SCR_OP_JUMPIFCONFUSEDANDSTATMAXED,
    B_SCR_OP_UNUSED_0XB5,
    B_SCR_OP_SETEMBARGO,
    B_SCR_OP_PRESENTDAMAGECALCULATION,
    B_SCR_OP_SETSAFEGUARD,
    B_SCR_OP_MAGNITUDEDAMAGECALCULATION,
    B_SCR_OP_JUMPIFNOPURSUITSWITCHDMG,
    B_SCR_OP_TRYACTIVATEITEM,
    B_SCR_OP_HALVEHP,
    B_SCR_OP_COPYFOESTATS,
    B_SCR_OP_RAPIDSPINFREE,
    B_SCR_OP_UNUSED_0XBF,
    B_SCR_OP_RECOVERBASEDONSUNLIGHT,
    B_SCR_OP_SETSTICKYWEB,
    B_SCR_OP_SELECTFIRSTVALIDTARGET,
    B_SCR_OP_SETFUTUREATTACK,
    B_SCR_OP_TRYDOBEATUP,
    B_SCR_OP_SETSEMIINVULNERABLEBIT,
    B_SCR_OP_UNUSED_0XC6,
    B_SCR_OP_UNUSED_0XC7,
    B_SCR_OP_UNUSED_C8,
    B_SCR_OP_TRYMEMENTO,
    B_SCR_OP_SETFORCEDTARGET,
    B_SCR_OP_UNUSED_0XCB,
    B_SCR_OP_UNUSED_0XCC,
    B_SCR_OP_CURESTATUSWITHMOVE,
    B_SCR_OP_SETTORMENT,
    B_SCR_OP_UNUSED_0XCF,
    B_SCR_OP_SETTAUNT,
    B_SCR_OP_TRYSETHELPINGHAND,
    B_SCR_OP_TRYSWAPITEMS,
    B_SCR_OP_TRYCOPYABILITY,
    B_SCR_OP_TRYWISH,
    B_SCR_OP_SETTOXICSPIKES,
    B_SCR_OP_SETGASTROACID,
    B_SCR_OP_SETYAWN,
    B_SCR_OP_UNUSED0XD8,
    B_SCR_OP_SETROOM,
    B_SCR_OP_TRYSWAPABILITIES,
    B_SCR_OP_TRYIMPRISON,
    B_SCR_OP_SETSTEALTHROCK,
    B_SCR_OP_TRYSETVOLATILE,
    B_SCR_OP_UNUSED_0XDE,
    B_SCR_OP_TRYSETMAGICCOAT,
    B_SCR_OP_TRYSETSNATCH,
    B_SCR_OP_UNUSED2,
    B_SCR_OP_SWITCHOUTABILITIES,
    B_SCR_OP_JUMPIFHASNOHP,
    B_SCR_OP_UNUSED_0XE4,
    B_SCR_OP_PICKUP,
    B_SCR_OP_UNUSED_0XE6,
    B_SCR_OP_UNUSED_0XE7,
    B_SCR_OP_SETTYPEBASEDHALVERS,
    B_SCR_OP_JUMPIFSUBSTITUTEBLOCKS,
    B_SCR_OP_TRYRECYCLEITEM,
    B_SCR_OP_SETTYPETOENVIRONMENT,
    B_SCR_OP_PURSUITDOUBLES,
    B_SCR_OP_SNATCHSETBATTLERS,
    B_SCR_OP_UNUSED_0XEE,
    B_SCR_OP_HANDLEBALLTHROW,
    B_SCR_OP_GIVECAUGHTMON,
    B_SCR_OP_TRYSETCAUGHTMONDEXFLAGS,
    B_SCR_OP_DISPLAYDEXINFO,
    B_SCR_OP_TRYGIVECAUGHTMONNICK,
    B_SCR_OP_SORTBATTLERS,
    B_SCR_OP_REMOVEATTACKERSTATUS1,
    B_SCR_OP_FINISHACTION,
    B_SCR_OP_FINISHTURN,
    B_SCR_OP_TRAINERSLIDEOUT,
    B_SCR_OP_SETTELEKINESIS,
    B_SCR_OP_SWAPSTATSTAGES,
    B_SCR_OP_AVERAGESTATS,
    B_SCR_OP_JUMPIFCAPTIVATEAFFECTED,
    B_SCR_OP_SETNONVOLATILESTATUS,
    B_SCR_OP_TRYOVERWRITEABILITY,
    B_SCR_OP_CALLNATIVE,
};

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
#define sUNUSED_0x2C                 (gBattleScripting + 0x2C) // unused_0x2c
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

// compare operands
#define CMP_EQUAL               0
#define CMP_NOT_EQUAL           1
#define CMP_GREATER_THAN        2
#define CMP_LESS_THAN           3
#define CMP_COMMON_BITS         4
#define CMP_NO_COMMON_BITS      5

// Cmd_manipulatedamage
#define DMG_CHANGE_SIGN         1
#define DMG_1_8_TARGET_HP       2
#define DMG_BIG_ROOT            3

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

enum SetMoveEffectFlags
{
    NO_FLAGS          = 0,
    EFFECT_PRIMARY    = (1 << 0),
    EFFECT_CERTAIN    = (1 << 1),
};

enum FaintBlockStates
{
    FAINT_BLOCK_FINAL_GAMBIT,
    FAINT_BLOCK_CHECK_TARGET_FAINTED, // Exits if target is not fainted
    FAINT_BLOCK_END_NEUTRALIZING_GAS,
    // Destiny Bond and Grudge are tested first, but Faint Target's script plays first
    FAINT_BLOCK_TRY_DESTINY_BOND,
    FAINT_BLOCK_TRY_GRUDGE,
    FAINT_BLOCK_FAINT_TARGET,
    FAINT_BLOCK_DO_DESTINY_BOND,
    FAINT_BLOCK_DO_GRUDGE,
    FAINT_BLOCK_COUNT,
};

enum SwitchInCases
{
    B_SWITCH_NORMAL,
    B_SWITCH_HIT, // dragon tail, circle throw
    B_SWITCH_RED_CARD,
};

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

enum HealthUpdate
{
    PASSIVE_HP_UPDATE,
    MOVE_DAMAGE_HP_UPDATE,
};

#endif // GUARD_CONSTANTS_BATTLE_SCRIPT_COMMANDS_H
