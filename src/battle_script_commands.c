#include "global.h"
#include "gflib.h"
#include "item.h"
#include "util.h"
#include "random.h"
#include "pokedex.h"
#include "money.h"
#include "pokemon_icon.h"
#include "mail.h"
#include "event_data.h"
#include "strings.h"
#include "pokemon_special_anim.h"
#include "pokemon_storage_system.h"
#include "pokemon_summary_screen.h"
#include "task.h"
#include "naming_screen.h"
#include "overworld.h"
#include "party_menu.h"
#include "trainer_pokemon_sprites.h"
#include "field_specials.h"
#include "battle.h"
#include "battle_message.h"
#include "battle_anim.h"
#include "battle_ai_script_commands.h"
#include "battle_scripts.h"
#include "reshow_battle_screen.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "constants/battle_anim.h"
#include "constants/battle_move_effects.h"
#include "constants/battle_script_commands.h"
#include "constants/items.h"
#include "constants/item_effects.h"
#include "constants/hold_effects.h"
#include "constants/songs.h"
#include "constants/moves.h"
#include "constants/abilities.h"
#include "constants/pokemon.h"
#include "constants/maps.h"
#include "data/battle_move_effects.h"

// Helper for accessing command arguments and advancing gBattlescriptCurrInstr.
//
// For example accuracycheck is defined as:
//
//     .macro accuracycheck failInstr:req, move:req
//     .byte 0x1
//     .4byte \failInstr
//     .2byte \move
//     .endm
//
// Which corresponds to:
//
//     CMD_ARGS(const u8 *failInstr, u16 move);
//
// The arguments can be accessed as cmd->failInstr and cmd->move.
// gBattlescriptCurrInstr = cmd->nextInstr; advances to the next instruction.
#define CMD_ARGS(...) const struct __attribute__((packed)) { u8 opcode; MEMBERS(__VA_ARGS__) const u8 nextInstr[0]; } *const cmd UNUSED = (const void *)gBattlescriptCurrInstr
#define VARIOUS_ARGS(...) CMD_ARGS(u8 battler, u8 id, ##__VA_ARGS__)
#define NATIVE_ARGS(...) CMD_ARGS(void (*func)(void), ##__VA_ARGS__)

#define MEMBERS(...) VARARG_8(MEMBERS_, __VA_ARGS__)
#define MEMBERS_0()
#define MEMBERS_1(a) a;
#define MEMBERS_2(a, b) a; b;
#define MEMBERS_3(a, b, c) a; b; c;
#define MEMBERS_4(a, b, c, d) a; b; c; d;
#define MEMBERS_5(a, b, c, d, e) a; b; c; d; e;
#define MEMBERS_6(a, b, c, d, e, f) a; b; c; d; e; f;
#define MEMBERS_7(a, b, c, d, e, f, g) a; b; c; d; e; f; g;
#define MEMBERS_8(a, b, c, d, e, f, g, h) a; b; c; d; e; f; g; h;

// table to avoid ugly powing on gba (courtesy of doesnt)
// this returns (i^2.5)/4
// the quarters cancel so no need to re-quadruple them in actual calculation
static const s32 sExperienceScalingFactors[] =
{
    0,
    0,
    1,
    3,
    8,
    13,
    22,
    32,
    45,
    60,
    79,
    100,
    124,
    152,
    183,
    217,
    256,
    297,
    343,
    393,
    447,
    505,
    567,
    634,
    705,
    781,
    861,
    946,
    1037,
    1132,
    1232,
    1337,
    1448,
    1563,
    1685,
    1811,
    1944,
    2081,
    2225,
    2374,
    2529,
    2690,
    2858,
    3031,
    3210,
    3396,
    3587,
    3786,
    3990,
    4201,
    4419,
    4643,
    4874,
    5112,
    5357,
    5608,
    5866,
    6132,
    6404,
    6684,
    6971,
    7265,
    7566,
    7875,
    8192,
    8515,
    8847,
    9186,
    9532,
    9886,
    10249,
    10619,
    10996,
    11382,
    11776,
    12178,
    12588,
    13006,
    13433,
    13867,
    14310,
    14762,
    15222,
    15690,
    16167,
    16652,
    17146,
    17649,
    18161,
    18681,
    19210,
    19748,
    20295,
    20851,
    21417,
    21991,
    22574,
    23166,
    23768,
    24379,
    25000,
    25629,
    26268,
    26917,
    27575,
    28243,
    28920,
    29607,
    30303,
    31010,
    31726,
    32452,
    33188,
    33934,
    34689,
    35455,
    36231,
    37017,
    37813,
    38619,
    39436,
    40262,
    41099,
    41947,
    42804,
    43673,
    44551,
    45441,
    46340,
    47251,
    48172,
    49104,
    50046,
    50999,
    51963,
    52938,
    53924,
    54921,
    55929,
    56947,
    57977,
    59018,
    60070,
    61133,
    62208,
    63293,
    64390,
    65498,
    66618,
    67749,
    68891,
    70045,
    71211,
    72388,
    73576,
    74777,
    75989,
    77212,
    78448,
    79695,
    80954,
    82225,
    83507,
    84802,
    86109,
    87427,
    88758,
    90101,
    91456,
    92823,
    94202,
    95593,
    96997,
    98413,
    99841,
    101282,
    102735,
    104201,
    105679,
    107169,
    108672,
    110188,
    111716,
    113257,
    114811,
    116377,
    117956,
    119548,
    121153,
    122770,
    124401,
    126044,
    127700,
    129369,
    131052,
    132747,
    134456,
    136177,
    137912,
    139660,
    141421,
    143195,
    144983,
    146784,
    148598,
    150426,
    152267,
    154122,
    155990,
    157872,
    159767,
};


static const u16 sTrappingMoves[NUM_TRAPPING_MOVES] =
{
    MOVE_BIND,
    MOVE_WRAP,
    MOVE_FIRE_SPIN,
    MOVE_CLAMP,
    MOVE_WHIRLPOOL,
    MOVE_SAND_TOMB,
    MOVE_MAGMA_STORM,
    MOVE_INFESTATION,
    MOVE_SNAP_TRAP,
    MOVE_THUNDER_CAGE
};

#define STAT_CHANGE_WORKED      0
#define STAT_CHANGE_DIDNT_WORK  1

extern const u8 *const gBattleScriptsForMoveEffects[];

#define DEFENDER_IS_PROTECTED ((gProtectStructs[gBattlerTarget].protected) && (!gMovesInfo[gCurrentMove].ignoresProtect))

#define LEVEL_UP_BANNER_START 416
#define LEVEL_UP_BANNER_END   512

#define TAG_LVLUP_BANNER_MON_ICON 55130

static bool8 IsTwoTurnsMove(u16 move);
static void TrySetDestinyBondToHappen(void);
static u8 AttacksThisTurn(u8 battlerId, u16 move); // Note: returns 1 if it's a charging turn, otherwise 2.
static void CheckWonderGuardAndLevitate(void);
static u8 ChangeStatBuffs(s8 statValue, u32 statId, u32, const u8 *BS_ptr);
static void InitLevelUpBanner(void);
static bool8 SlideInLevelUpBanner(void);
static bool8 SlideOutLevelUpBanner(void);
static void DrawLevelUpWindow1(void);
static void DrawLevelUpWindow2(void);
static void PutMonIconOnLvlUpBanner(void);
static void DrawLevelUpBannerText(void);
static void SpriteCB_MonIconOnLvlUpBanner(struct Sprite* sprite);
static u32 GetNextTarget(u32 moveTarget, bool32 excludeCurrent);
static bool8 IsFinalStrikeEffect(u16 move);
static void TryUpdateRoundTurnOrder(void);
static void BestowItem(u32 battlerAtk, u32 battlerDef);
static void ApplyExperienceMultipliers(s32 *expAmount, u8 expGetterMonId, u8 faintedBattler);

static void Cmd_attackcanceler(void);
static void Cmd_accuracycheck(void);
static void Cmd_attackstring(void);
static void Cmd_ppreduce(void);
static void Cmd_critcalc(void);
static void Cmd_damagecalc(void);
static void Cmd_typecalc(void);
static void Cmd_adjustdamage(void);
static void Cmd_multihitresultmessage(void);
static void Cmd_attackanimation(void);
static void Cmd_waitanimation(void);
static void Cmd_healthbarupdate(void);
static void Cmd_datahpupdate(void);
static void Cmd_critmessage(void);
static void Cmd_effectivenesssound(void);
static void Cmd_resultmessage(void);
static void Cmd_printstring(void);
static void Cmd_printselectionstring(void);
static void Cmd_waitmessage(void);
static void Cmd_printfromtable(void);
static void Cmd_printselectionstringfromtable(void);
static void Cmd_setadditionaleffects(void);
static void Cmd_seteffectprimary(void);
static void Cmd_seteffectsecondary(void);
static void Cmd_clearstatusfromeffect(void);
static void Cmd_tryfaintmon(void);
static void Cmd_dofaintanimation(void);
static void Cmd_cleareffectsonfaint(void);
static void Cmd_jumpifstatus(void);
static void Cmd_jumpifstatus2(void);
static void Cmd_jumpifability(void);
static void Cmd_jumpifsideaffecting(void);
static void Cmd_jumpifstat(void);
static void Cmd_jumpifstatus3condition(void);
static void Cmd_jumpbasedontype(void);
static void Cmd_getexp(void);
static void Cmd_checkteamslost(void);
static void Cmd_movevaluescleanup(void);
static void Cmd_setmultihit(void);
static void Cmd_decrementmultihit(void);
static void Cmd_goto(void);
static void Cmd_jumpifbyte(void);
static void Cmd_jumpifhalfword(void);
static void Cmd_jumpifword(void);
static void Cmd_jumpifarrayequal(void);
static void Cmd_jumpifarraynotequal(void);
static void Cmd_setbyte(void);
static void Cmd_addbyte(void);
static void Cmd_subbyte(void);
static void Cmd_copyarray(void);
static void Cmd_copyarraywithindex(void);
static void Cmd_orbyte(void);
static void Cmd_orhalfword(void);
static void Cmd_orword(void);
static void Cmd_bicbyte(void);
static void Cmd_bichalfword(void);
static void Cmd_bicword(void);
static void Cmd_pause(void);
static void Cmd_waitstate(void);
static void Cmd_healthbar_update(void);
static void Cmd_return(void);
static void Cmd_end(void);
static void Cmd_end2(void);
static void Cmd_end3(void);
static void Cmd_unused5(void);
static void Cmd_call(void);
static void Cmd_setroost(void);
static void Cmd_jumpifabilitypresent(void);
static void Cmd_endselectionscript(void);
static void Cmd_playanimation(void);
static void Cmd_playanimation_var(void);
static void Cmd_setgraphicalstatchangevalues(void);
static void Cmd_playstatchangeanimation(void);
static void Cmd_moveend(void);
static void Cmd_typecalc2(void);
static void Cmd_returnatktoball(void);
static void Cmd_getswitchedmondata(void);
static void Cmd_switchindataupdate(void);
static void Cmd_switchinanim(void);
static void Cmd_jumpifcantswitch(void);
static void Cmd_openpartyscreen(void);
static void Cmd_switchhandleorder(void);
static void Cmd_switchineffects(void);
static void Cmd_trainerslidein(void);
static void Cmd_playse(void);
static void Cmd_fanfare(void);
static void Cmd_playfaintcry(void);
static void Cmd_endlinkbattle(void);
static void Cmd_returntoball(void);
static void Cmd_handlelearnnewmove(void);
static void Cmd_yesnoboxlearnmove(void);
static void Cmd_yesnoboxstoplearningmove(void);
static void Cmd_hitanimation(void);
static void Cmd_getmoneyreward(void);
static void Cmd_updatebattlermoves(void);
static void Cmd_swapattackerwithtarget(void);
static void Cmd_incrementgamestat(void);
static void Cmd_drawpartystatussummary(void);
static void Cmd_hidepartystatussummary(void);
static void Cmd_jumptocalledmove(void);
static void Cmd_statusanimation(void);
static void Cmd_status2animation(void);
static void Cmd_chosenstatusanimation(void);
static void Cmd_yesnobox(void);
static void Cmd_cancelallactions(void);
static void Cmd_adjustsetdamage(void);
static void Cmd_removeitem(void);
static void Cmd_atknameinbuff1(void);
static void Cmd_drawlvlupbox(void);
static void Cmd_resetsentmonsvalue(void);
static void Cmd_setatktoplayer0(void);
static void Cmd_makevisible(void);
static void Cmd_recordability(void);
static void Cmd_buffermovetolearn(void);
static void Cmd_jumpifplayerran(void);
static void Cmd_hpthresholds(void);
static void Cmd_hpthresholds2(void);
static void Cmd_useitemonopponent(void);
static void Cmd_various(void);
static void Cmd_setprotectlike(void);
static void Cmd_tryexplosion(void);
static void Cmd_setatkhptozero(void);
static void Cmd_jumpifnexttargetvalid(void);
static void Cmd_tryhealhalfhealth(void);
static void Cmd_trymirrormove(void);
static void Cmd_setrain(void);
static void Cmd_setreflect(void);
static void Cmd_setseeded(void);
static void Cmd_manipulatedamage(void);
static void Cmd_trysetrest(void);
static void Cmd_jumpifnotfirstturn(void);
static void Cmd_nop(void);
static void Cmd_jumpifcantmakeasleep(void);
static void Cmd_stockpile(void);
static void Cmd_stockpiletobasedamage(void);
static void Cmd_stockpiletohpheal(void);
static void Cmd_negativedamage(void);
static void Cmd_statbuffchange(void);
static void Cmd_normalisebuffs(void);
static void Cmd_setbide(void);
static void Cmd_confuseifrepeatingattackends(void);
static void Cmd_setmultihitcounter(void);
static void Cmd_initmultihitstring(void);
static void Cmd_forcerandomswitch(void);
static void Cmd_tryconversiontypechange(void);
static void Cmd_givepaydaymoney(void);
static void Cmd_setlightscreen(void);
static void Cmd_tryKO(void);
static void Cmd_damagetohalftargethp(void);
static void Cmd_setsandstorm(void);
static void Cmd_weatherdamage(void);
static void Cmd_tryinfatuating(void);
static void Cmd_updatestatusicon(void);
static void Cmd_setmist(void);
static void Cmd_setfocusenergy(void);
static void Cmd_transformdataexecution(void);
static void Cmd_setsubstitute(void);
static void Cmd_mimicattackcopy(void);
static void Cmd_metronome(void);
static void Cmd_dmgtolevel(void);
static void Cmd_psywavedamageeffect(void);
static void Cmd_counterdamagecalculator(void);
static void Cmd_mirrorcoatdamagecalculator(void);
static void Cmd_disablelastusedattack(void);
static void Cmd_trysetencore(void);
static void Cmd_painsplitdmgcalc(void);
static void Cmd_settypetorandomresistance(void);
static void Cmd_setalwayshitflag(void);
static void Cmd_copymovepermanently(void);
static void Cmd_trychoosesleeptalkmove(void);
static void Cmd_setdestinybond(void);
static void Cmd_trysetdestinybondtohappen(void);
static void Cmd_remaininghptopower(void);
static void Cmd_tryspiteppreduce(void);
static void Cmd_healpartystatus(void);
static void Cmd_cursetarget(void);
static void Cmd_trysetspikes(void);
static void Cmd_setforesight(void);
static void Cmd_trysetperishsong(void);
static void Cmd_rolloutdamagecalculation(void);
static void Cmd_jumpifconfusedandstatmaxed(void);
static void Cmd_furycuttercalc(void);
static void Cmd_friendshiptodamagecalculation(void);
static void Cmd_presentdamagecalculation(void);
static void Cmd_setsafeguard(void);
static void Cmd_magnitudedamagecalculation(void);
static void Cmd_jumpifnopursuitswitchdmg(void);
static void Cmd_setsunny(void);
static void Cmd_maxattackhalvehp(void);
static void Cmd_copyfoestats(void);
static void Cmd_rapidspinfree(void);
static void Cmd_setdefensecurlbit(void);
static void Cmd_recoverbasedonsunlight(void);
static void Cmd_hiddenpowercalc(void);
static void Cmd_selectfirstvalidtarget(void);
static void Cmd_trysetfutureattack(void);
static void Cmd_trydobeatup(void);
static void Cmd_setsemiinvulnerablebit(void);
static void Cmd_clearsemiinvulnerablebit(void);
static void Cmd_setminimize(void);
static void Cmd_sethail(void);
static void Cmd_trymemento(void);
static void Cmd_setforcedtarget(void);
static void Cmd_setcharge(void);
static void Cmd_callterrainattack(void);
static void Cmd_cureifburnedparalysedorpoisoned(void);
static void Cmd_settorment(void);
static void Cmd_jumpifnodamage(void);
static void Cmd_settaunt(void);
static void Cmd_trysethelpinghand(void);
static void Cmd_tryswapitems(void);
static void Cmd_trycopyability(void);
static void Cmd_trywish(void);
static void Cmd_settoxicspikes(void);
static void Cmd_setgastroacid(void);
static void Cmd_setyawn(void);
static void Cmd_setdamagetohealthdifference(void);
static void Cmd_scaledamagebyhealthratio(void);
static void Cmd_tryswapabilities(void);
static void Cmd_tryimprison(void);
static void Cmd_setstealthrock(void);
static void Cmd_weightdamagecalculation(void);
static void Cmd_assistattackselect(void);
static void Cmd_trysetmagiccoat(void);
static void Cmd_trysetsnatch(void);
static void Cmd_trygetintimidatetarget(void);
static void Cmd_switchoutabilities(void);
static void Cmd_jumpifhasnohp(void);
static void Cmd_getsecretpowereffect(void);
static void Cmd_pickup(void);
static void Cmd_docastformchangeanimation(void);
static void Cmd_trycastformdatachange(void);
static void Cmd_settypebasedhalvers(void);
static void Cmd_setweatherballtype(void);
static void Cmd_tryrecycleitem(void);
static void Cmd_settypetoterrain(void);
static void Cmd_pursuitdoubles(void);
static void Cmd_snatchsetbattlers(void);
static void Cmd_removelightscreenreflect(void);
static void Cmd_handleballthrow(void);
static void Cmd_givecaughtmon(void);
static void Cmd_trysetcaughtmondexflags(void);
static void Cmd_displaydexinfo(void);
static void Cmd_trygivecaughtmonnick(void);
static void Cmd_subattackerhpbydmg(void);
static void Cmd_removeattackerstatus1(void);
static void Cmd_finishaction(void);
static void Cmd_finishturn(void);
static void Cmd_callnative(void);

void (* const gBattleScriptingCommandsTable[])(void) =
{
    Cmd_attackcanceler,                          //0x0  // done
    Cmd_accuracycheck,                           //0x1  // done
    Cmd_attackstring,                            //0x2  // done
    Cmd_ppreduce,                                //0x3  // done
    Cmd_critcalc,                                //0x4  // done
    Cmd_damagecalc,                              //0x5  // done
    Cmd_typecalc,                                //0x6  // done
    Cmd_adjustdamage,                            //0x7  // done
    Cmd_multihitresultmessage,                   //0x8  // done
    Cmd_attackanimation,                         //0x9  // done
    Cmd_waitanimation,                           //0xA  // done
    Cmd_healthbarupdate,                         //0xB  // done
    Cmd_datahpupdate,                            //0xC  // done
    Cmd_critmessage,                             //0xD  // done
    Cmd_effectivenesssound,                      //0xE  // done
    Cmd_resultmessage,                           //0xF  // done
    Cmd_printstring,                             //0x10 // done
    Cmd_printselectionstring,                    //0x11 // done
    Cmd_waitmessage,                             //0x12 // done
    Cmd_printfromtable,                          //0x13 // done
    Cmd_printselectionstringfromtable,           //0x14 // done
    Cmd_setadditionaleffects,                    //0x15 // done
    Cmd_seteffectprimary,                        //0x16 // done
    Cmd_seteffectsecondary,                      //0x17 // done
    Cmd_clearstatusfromeffect,                   //0x18 // done
    Cmd_tryfaintmon,                             //0x19 // done
    Cmd_dofaintanimation,                        //0x1A // done
    Cmd_cleareffectsonfaint,                     //0x1B // done
    Cmd_jumpifstatus,                            //0x1C // done
    Cmd_jumpifstatus2,                           //0x1D // done
    Cmd_jumpifability,                           //0x1E // done
    Cmd_jumpifsideaffecting,                     //0x1F // done
    Cmd_jumpifstat,                              //0x20 // done
    Cmd_jumpifstatus3condition,                  //0x21 // done
    Cmd_jumpbasedontype,                         //0x22 // done
    Cmd_getexp,                                  //0x23 // done
    Cmd_checkteamslost,                          //0x24 // done
    Cmd_movevaluescleanup,                       //0x25 // done
    Cmd_setmultihit,                             //0x26 // done
    Cmd_decrementmultihit,                       //0x27 // done
    Cmd_goto,                                    //0x28 // done
    Cmd_jumpifbyte,                              //0x29 // done
    Cmd_jumpifhalfword,                          //0x2A // done
    Cmd_jumpifword,                              //0x2B // done
    Cmd_jumpifarrayequal,                        //0x2C // done
    Cmd_jumpifarraynotequal,                     //0x2D // done
    Cmd_setbyte,                                 //0x2E // done
    Cmd_addbyte,                                 //0x2F // done
    Cmd_subbyte,                                 //0x30 // done
    Cmd_copyarray,                               //0x31 // done
    Cmd_copyarraywithindex,                      //0x32 // done
    Cmd_orbyte,                                  //0x33 // done
    Cmd_orhalfword,                              //0x34 // done
    Cmd_orword,                                  //0x35 // done
    Cmd_bicbyte,                                 //0x36 // done
    Cmd_bichalfword,                             //0x37 // done
    Cmd_bicword,                                 //0x38 // done
    Cmd_pause,                                   //0x39 // done
    Cmd_waitstate,                               //0x3A // done
    Cmd_healthbar_update,                        //0x3B // done
    Cmd_return,                                  //0x3C // done
    Cmd_end,                                     //0x3D // done
    Cmd_end2,                                    //0x3E // done
    Cmd_end3,                                    //0x3F // done
    Cmd_unused5,                                 //0x40 // done
    Cmd_call,                                    //0x41 // done
    Cmd_setroost,                                //0x42 // done
    Cmd_jumpifabilitypresent,                    //0x43 // done
    Cmd_endselectionscript,                      //0x44 // done
    Cmd_playanimation,                           //0x45 // done
    Cmd_playanimation_var,                       //0x46 // done
    Cmd_setgraphicalstatchangevalues,            //0x47 // done
    Cmd_playstatchangeanimation,                 //0x48
    Cmd_moveend,                                 //0x49
    Cmd_typecalc2,                               //0x4A
    Cmd_returnatktoball,                         //0x4B
    Cmd_getswitchedmondata,                      //0x4C
    Cmd_switchindataupdate,                      //0x4D
    Cmd_switchinanim,                            //0x4E
    Cmd_jumpifcantswitch,                        //0x4F
    Cmd_openpartyscreen,                         //0x50
    Cmd_switchhandleorder,                       //0x51
    Cmd_switchineffects,                         //0x52
    Cmd_trainerslidein,                          //0x53
    Cmd_playse,                                  //0x54
    Cmd_fanfare,                                 //0x55
    Cmd_playfaintcry,                            //0x56
    Cmd_endlinkbattle,                           //0x57
    Cmd_returntoball,                            //0x58 // done
    Cmd_handlelearnnewmove,                      //0x59
    Cmd_yesnoboxlearnmove,                       //0x5A
    Cmd_yesnoboxstoplearningmove,                //0x5B
    Cmd_hitanimation,                            //0x5C
    Cmd_getmoneyreward,                          //0x5D
    Cmd_updatebattlermoves,                      //0x5E
    Cmd_swapattackerwithtarget,                  //0x5F
    Cmd_incrementgamestat,                       //0x60
    Cmd_drawpartystatussummary,                  //0x61
    Cmd_hidepartystatussummary,                  //0x62
    Cmd_jumptocalledmove,                        //0x63
    Cmd_statusanimation,                         //0x64
    Cmd_status2animation,                        //0x65
    Cmd_chosenstatusanimation,                   //0x66
    Cmd_yesnobox,                                //0x67
    Cmd_cancelallactions,                        //0x68
    Cmd_adjustsetdamage,                         //0x69
    Cmd_removeitem,                              //0x6A
    Cmd_atknameinbuff1,                          //0x6B
    Cmd_drawlvlupbox,                            //0x6C
    Cmd_resetsentmonsvalue,                      //0x6D
    Cmd_setatktoplayer0,                         //0x6E
    Cmd_makevisible,                             //0x6F
    Cmd_recordability,                           //0x70 // done
    Cmd_buffermovetolearn,                       //0x71
    Cmd_jumpifplayerran,                         //0x72
    Cmd_hpthresholds,                            //0x73
    Cmd_hpthresholds2,                           //0x74
    Cmd_useitemonopponent,                       //0x75
    Cmd_various,                                 //0x76
    Cmd_setprotectlike,                          //0x77
    Cmd_tryexplosion,                            //0x78
    Cmd_setatkhptozero,                          //0x79
    Cmd_jumpifnexttargetvalid,                   //0x7A
    Cmd_tryhealhalfhealth,                       //0x7B
    Cmd_trymirrormove,                           //0x7C
    Cmd_setrain,                                 //0x7D
    Cmd_setreflect,                              //0x7E
    Cmd_setseeded,                               //0x7F
    Cmd_manipulatedamage,                        //0x80 // done
    Cmd_trysetrest,                              //0x81
    Cmd_jumpifnotfirstturn,                      //0x82
    Cmd_nop,                                     //0x83
    Cmd_jumpifcantmakeasleep,                    //0x84
    Cmd_stockpile,                               //0x85
    Cmd_stockpiletobasedamage,                   //0x86
    Cmd_stockpiletohpheal,                       //0x87
    Cmd_negativedamage,                          //0x88
    Cmd_statbuffchange,                          //0x89
    Cmd_normalisebuffs,                          //0x8A
    Cmd_setbide,                                 //0x8B
    Cmd_confuseifrepeatingattackends,            //0x8C
    Cmd_setmultihitcounter,                      //0x8D
    Cmd_initmultihitstring,                      //0x8E
    Cmd_forcerandomswitch,                       //0x8F
    Cmd_tryconversiontypechange,                 //0x90
    Cmd_givepaydaymoney,                         //0x91
    Cmd_setlightscreen,                          //0x92
    Cmd_tryKO,                                   //0x93
    Cmd_damagetohalftargethp,                    //0x94
    Cmd_setsandstorm,                            //0x95
    Cmd_weatherdamage,                           //0x96
    Cmd_tryinfatuating,                          //0x97
    Cmd_updatestatusicon,                        //0x98
    Cmd_setmist,                                 //0x99
    Cmd_setfocusenergy,                          //0x9A
    Cmd_transformdataexecution,                  //0x9B
    Cmd_setsubstitute,                           //0x9C
    Cmd_mimicattackcopy,                         //0x9D
    Cmd_metronome,                               //0x9E
    Cmd_dmgtolevel,                              //0x9F
    Cmd_psywavedamageeffect,                     //0xA0
    Cmd_counterdamagecalculator,                 //0xA1
    Cmd_mirrorcoatdamagecalculator,              //0xA2
    Cmd_disablelastusedattack,                   //0xA3
    Cmd_trysetencore,                            //0xA4
    Cmd_painsplitdmgcalc,                        //0xA5
    Cmd_settypetorandomresistance,               //0xA6
    Cmd_setalwayshitflag,                        //0xA7
    Cmd_copymovepermanently,                     //0xA8
    Cmd_trychoosesleeptalkmove,                  //0xA9
    Cmd_setdestinybond,                          //0xAA
    Cmd_trysetdestinybondtohappen,               //0xAB
    Cmd_remaininghptopower,                      //0xAC
    Cmd_tryspiteppreduce,                        //0xAD
    Cmd_healpartystatus,                         //0xAE
    Cmd_cursetarget,                             //0xAF
    Cmd_trysetspikes,                            //0xB0
    Cmd_setforesight,                            //0xB1
    Cmd_trysetperishsong,                        //0xB2
    Cmd_rolloutdamagecalculation,                //0xB3
    Cmd_jumpifconfusedandstatmaxed,              //0xB4
    Cmd_furycuttercalc,                          //0xB5
    Cmd_friendshiptodamagecalculation,           //0xB6
    Cmd_presentdamagecalculation,                //0xB7
    Cmd_setsafeguard,                            //0xB8
    Cmd_magnitudedamagecalculation,              //0xB9
    Cmd_jumpifnopursuitswitchdmg,                //0xBA
    Cmd_setsunny,                                //0xBB
    Cmd_maxattackhalvehp,                        //0xBC
    Cmd_copyfoestats,                            //0xBD
    Cmd_rapidspinfree,                           //0xBE
    Cmd_setdefensecurlbit,                       //0xBF
    Cmd_recoverbasedonsunlight,                  //0xC0
    Cmd_hiddenpowercalc,                         //0xC1
    Cmd_selectfirstvalidtarget,                  //0xC2
    Cmd_trysetfutureattack,                      //0xC3
    Cmd_trydobeatup,                             //0xC4
    Cmd_setsemiinvulnerablebit,                  //0xC5
    Cmd_clearsemiinvulnerablebit,                //0xC6
    Cmd_setminimize,                             //0xC7
    Cmd_sethail,                                 //0xC8
    Cmd_trymemento,                              //0xC9
    Cmd_setforcedtarget,                         //0xCA
    Cmd_setcharge,                               //0xCB // done
    Cmd_callterrainattack,                       //0xCC
    Cmd_cureifburnedparalysedorpoisoned,         //0xCD
    Cmd_settorment,                              //0xCE
    Cmd_jumpifnodamage,                          //0xCF
    Cmd_settaunt,                                //0xD0
    Cmd_trysethelpinghand,                       //0xD1
    Cmd_tryswapitems,                            //0xD2
    Cmd_trycopyability,                          //0xD3
    Cmd_trywish,                                 //0xD4
    Cmd_settoxicspikes,                          //0xD5 // done
    Cmd_setgastroacid,                           //0xD6 // done
    Cmd_setyawn,                                 //0xD7
    Cmd_setdamagetohealthdifference,             //0xD8
    Cmd_scaledamagebyhealthratio,                //0xD9
    Cmd_tryswapabilities,                        //0xDA
    Cmd_tryimprison,                             //0xDB
    Cmd_setstealthrock,                          //0xDC // done
    Cmd_weightdamagecalculation,                 //0xDD
    Cmd_assistattackselect,                      //0xDE
    Cmd_trysetmagiccoat,                         //0xDF
    Cmd_trysetsnatch,                            //0xE0
    Cmd_trygetintimidatetarget,                  //0xE1
    Cmd_switchoutabilities,                      //0xE2
    Cmd_jumpifhasnohp,                           //0xE3
    Cmd_getsecretpowereffect,                    //0xE4
    Cmd_pickup,                                  //0xE5
    Cmd_docastformchangeanimation,               //0xE6
    Cmd_trycastformdatachange,                   //0xE7
    Cmd_settypebasedhalvers,                     //0xE8
    Cmd_setweatherballtype,                      //0xE9
    Cmd_tryrecycleitem,                          //0xEA
    Cmd_settypetoterrain,                        //0xEB
    Cmd_pursuitdoubles,                          //0xEC
    Cmd_snatchsetbattlers,                       //0xED
    Cmd_removelightscreenreflect,                //0xEE
    Cmd_handleballthrow,                         //0xEF
    Cmd_givecaughtmon,                           //0xF0
    Cmd_trysetcaughtmondexflags,                 //0xF1
    Cmd_displaydexinfo,                          //0xF2
    Cmd_trygivecaughtmonnick,                    //0xF3
    Cmd_subattackerhpbydmg,                      //0xF4
    Cmd_removeattackerstatus1,                   //0xF5
    Cmd_finishaction,                            //0xF6
    Cmd_finishturn,                              //0xF7
    NULL,                                        //0xF8
    NULL,                                        //0xF9
    NULL,                                        //0xFA
    NULL,                                        //0xFB
    NULL,                                        //0xFC
    NULL,                                        //0xFD
    NULL,                                        //0xFE
    Cmd_callnative,                              //0xFF
};

const struct StatFractions gAccuracyStageRatios[] =
{
    { 33, 100}, // -6
    { 36, 100}, // -5
    { 43, 100}, // -4
    { 50, 100}, // -3
    { 60, 100}, // -2
    { 75, 100}, // -1
    {  1,   1}, //  0
    {133, 100}, // +1
    {166, 100}, // +2
    {  2,   1}, // +3
    {233, 100}, // +4
    {133,  50}, // +5
    {  3,   1}, // +6
};

static const u32 sStatusFlagsForMoveEffects[NUM_MOVE_EFFECTS] =
{
    [MOVE_EFFECT_SLEEP]          = STATUS1_SLEEP,
    [MOVE_EFFECT_POISON]         = STATUS1_POISON,
    [MOVE_EFFECT_BURN]           = STATUS1_BURN,
    [MOVE_EFFECT_FREEZE]         = STATUS1_FREEZE,
    [MOVE_EFFECT_PARALYSIS]      = STATUS1_PARALYSIS,
    [MOVE_EFFECT_TOXIC]          = STATUS1_TOXIC_POISON,
    [MOVE_EFFECT_CONFUSION]      = STATUS2_CONFUSION,
    [MOVE_EFFECT_FLINCH]         = STATUS2_FLINCHED,
    [MOVE_EFFECT_UPROAR]         = STATUS2_UPROAR,
    [MOVE_EFFECT_CHARGING]       = STATUS2_MULTIPLETURNS,
    [MOVE_EFFECT_WRAP]           = STATUS2_WRAPPED,
    [MOVE_EFFECT_RECHARGE]       = STATUS2_RECHARGE,
    [MOVE_EFFECT_PREVENT_ESCAPE] = STATUS2_ESCAPE_PREVENTION,
    [MOVE_EFFECT_NIGHTMARE]      = STATUS2_NIGHTMARE,
    [MOVE_EFFECT_THRASH]         = STATUS2_LOCK_CONFUSE,
};

static const u8 *const sMoveEffectBS_Ptrs[] =
{
    [0]                            = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_SLEEP]            = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_POISON]           = BattleScript_MoveEffectPoison,
    [MOVE_EFFECT_BURN]             = BattleScript_MoveEffectBurn,
    [MOVE_EFFECT_FREEZE]           = BattleScript_MoveEffectFreeze,
    [MOVE_EFFECT_PARALYSIS]        = BattleScript_MoveEffectParalysis,
    [MOVE_EFFECT_TOXIC]            = BattleScript_MoveEffectToxic,
    [MOVE_EFFECT_CONFUSION]        = BattleScript_MoveEffectConfusion,
    [MOVE_EFFECT_FLINCH]           = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_TRI_ATTACK]       = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_UPROAR]           = BattleScript_MoveEffectUproar,
    [MOVE_EFFECT_PAYDAY]           = BattleScript_MoveEffectPayDay,
    [MOVE_EFFECT_CHARGING]         = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_WRAP]             = BattleScript_MoveEffectWrap,
    [MOVE_EFFECT_RECOIL_25]        = BattleScript_MoveEffectRecoil,
    [MOVE_EFFECT_ATK_PLUS_1]       = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_DEF_PLUS_1]       = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_SPD_PLUS_1]       = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_SP_ATK_PLUS_1]    = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_SP_DEF_PLUS_1]    = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_ACC_PLUS_1]       = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_EVS_PLUS_1]       = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_ATK_MINUS_1]      = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_DEF_MINUS_1]      = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_SPD_MINUS_1]      = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_SP_ATK_MINUS_1]   = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_SP_DEF_MINUS_1]   = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_ACC_MINUS_1]      = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_EVS_MINUS_1]      = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_RECHARGE]         = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_RAGE]             = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_STEAL_ITEM]       = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_PREVENT_ESCAPE]   = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_NIGHTMARE]        = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_ALL_STATS_UP]     = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_RAPIDSPIN]        = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_REMOVE_PARALYSIS] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_ATK_DEF_DOWN]     = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_RECOIL_33]        = BattleScript_MoveEffectRecoil,
};

static const struct WindowTemplate sUnusedWinTemplate =
{
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 3,
    .width = 7,
    .height = 15,
    .paletteNum = 31,
    .baseBlock = 0x3F
};

static const u16 sLevelUpBanner_Pal[] = INCBIN_U16("graphics/battle_interface/level_up_banner.gbapal");
static const u32 sLevelUpBanner_Gfx[] = INCBIN_U32("graphics/battle_interface/level_up_banner.4bpp.lz");

static const struct OamData sOamData_MonIconOnLvlUpBanner =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = 0,
    .mosaic = FALSE,
    .bpp = 0,
    .shape = SPRITE_SHAPE(32x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x32),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

static const struct SpriteTemplate sSpriteTemplate_MonIconOnLvlUpBanner =
{
    .tileTag = TAG_LVLUP_BANNER_MON_ICON,
    .paletteTag = TAG_LVLUP_BANNER_MON_ICON,
    .oam = &sOamData_MonIconOnLvlUpBanner,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_MonIconOnLvlUpBanner
};

static const u16 sProtectSuccessRates[] = {USHRT_MAX, USHRT_MAX / 2, USHRT_MAX / 4, USHRT_MAX / 8};

#define MIMIC_FORBIDDEN_END             0xFFFE
#define METRONOME_FORBIDDEN_END         0xFFFF
#define ASSIST_FORBIDDEN_END            0xFFFF

static const u16 sMovesForbiddenToCopy[] =
{
    MOVE_METRONOME,
    MOVE_STRUGGLE,
    MOVE_SKETCH,
    MOVE_MIMIC,
    MIMIC_FORBIDDEN_END,
    MOVE_COUNTER,
    MOVE_MIRROR_COAT,
    MOVE_PROTECT,
    MOVE_DETECT,
    MOVE_ENDURE,
    MOVE_DESTINY_BOND,
    MOVE_SLEEP_TALK,
    MOVE_THIEF,
    MOVE_FOLLOW_ME,
    MOVE_SNATCH,
    MOVE_HELPING_HAND,
    MOVE_COVET,
    MOVE_TRICK,
    MOVE_FOCUS_PUNCH,
    METRONOME_FORBIDDEN_END
};

static const u8 sFlailHpScaleToPowerTable[] =
{
    1, 200,
    4, 150,
    9, 100,
    16, 80,
    32, 40,
    48, 20
};

static const u16 sFinalStrikeOnlyEffects[] =
{
    MOVE_EFFECT_BUG_BITE,
    MOVE_EFFECT_STEAL_ITEM,
    MOVE_EFFECT_REMOVE_ARG_TYPE,
    MOVE_EFFECT_SMACK_DOWN,
    MOVE_EFFECT_REMOVE_STATUS,
    MOVE_EFFECT_RECOIL_HP_25,
    MOVE_EFFECT_PREVENT_ESCAPE,
    MOVE_EFFECT_WRAP,
};

static const u16 sNaturePowerMoves[BATTLE_TERRAIN_COUNT] =
{
#if B_NATURE_POWER_MOVES >= GEN_7
    [BATTLE_TERRAIN_GRASS]      = MOVE_ENERGY_BALL,
    [BATTLE_TERRAIN_LONG_GRASS] = MOVE_ENERGY_BALL,
    [BATTLE_TERRAIN_SAND]       = MOVE_EARTH_POWER,
    [BATTLE_TERRAIN_WATER]      = MOVE_HYDRO_PUMP,
    [BATTLE_TERRAIN_POND]       = MOVE_HYDRO_PUMP,
    [BATTLE_TERRAIN_MOUNTAIN]   = MOVE_EARTH_POWER,
    [BATTLE_TERRAIN_CAVE]       = MOVE_EARTH_POWER,
    [BATTLE_TERRAIN_BUILDING]   = MOVE_TRI_ATTACK,
    [BATTLE_TERRAIN_PLAIN]      = MOVE_TRI_ATTACK,
    [BATTLE_TERRAIN_SNOW]       = MOVE_ICE_BEAM,
#elif B_NATURE_POWER_MOVES == GEN_6
    [BATTLE_TERRAIN_GRASS]      = MOVE_ENERGY_BALL,
    [BATTLE_TERRAIN_LONG_GRASS] = MOVE_ENERGY_BALL,
    [BATTLE_TERRAIN_SAND]       = MOVE_EARTH_POWER,
    [BATTLE_TERRAIN_WATER]      = MOVE_HYDRO_PUMP,
    [BATTLE_TERRAIN_POND]       = MOVE_HYDRO_PUMP,
    [BATTLE_TERRAIN_MOUNTAIN]   = MOVE_EARTH_POWER,
    [BATTLE_TERRAIN_CAVE]       = MOVE_EARTH_POWER,
    [BATTLE_TERRAIN_BUILDING]   = MOVE_TRI_ATTACK,
    [BATTLE_TERRAIN_PLAIN]      = MOVE_TRI_ATTACK,
    [BATTLE_TERRAIN_SNOW]       = MOVE_FROST_BREATH,
#elif B_NATURE_POWER_MOVES == GEN_5
    [BATTLE_TERRAIN_GRASS]      = MOVE_SEED_BOMB,
    [BATTLE_TERRAIN_LONG_GRASS] = MOVE_SEED_BOMB,
    [BATTLE_TERRAIN_SAND]       = MOVE_EARTHQUAKE,
    [BATTLE_TERRAIN_WATER]      = MOVE_HYDRO_PUMP,
    [BATTLE_TERRAIN_POND]       = MOVE_HYDRO_PUMP,
    [BATTLE_TERRAIN_MOUNTAIN]   = MOVE_EARTHQUAKE,
    [BATTLE_TERRAIN_CAVE]       = MOVE_EARTHQUAKE,
    [BATTLE_TERRAIN_BUILDING]   = MOVE_TRI_ATTACK,
    [BATTLE_TERRAIN_PLAIN]      = MOVE_EARTHQUAKE,
    [BATTLE_TERRAIN_SNOW]       = MOVE_BLIZZARD,
#elif B_NATURE_POWER_MOVES == GEN_4
    [BATTLE_TERRAIN_GRASS]      = MOVE_SEED_BOMB,
    [BATTLE_TERRAIN_LONG_GRASS] = MOVE_SEED_BOMB,
    [BATTLE_TERRAIN_SAND]       = MOVE_EARTHQUAKE,
    [BATTLE_TERRAIN_WATER]      = MOVE_HYDRO_PUMP,
    [BATTLE_TERRAIN_POND]       = MOVE_HYDRO_PUMP,
    [BATTLE_TERRAIN_MOUNTAIN]   = MOVE_ROCK_SLIDE,
    [BATTLE_TERRAIN_CAVE]       = MOVE_ROCK_SLIDE,
    [BATTLE_TERRAIN_BUILDING]   = MOVE_TRI_ATTACK,
    [BATTLE_TERRAIN_PLAIN]      = MOVE_EARTHQUAKE,
    [BATTLE_TERRAIN_SNOW]       = MOVE_BLIZZARD,
#else // Gen 1-3
    [BATTLE_TERRAIN_GRASS]      = MOVE_STUN_SPORE,
    [BATTLE_TERRAIN_LONG_GRASS] = MOVE_RAZOR_LEAF,
    [BATTLE_TERRAIN_SAND]       = MOVE_EARTHQUAKE,
    [BATTLE_TERRAIN_WATER]      = MOVE_SURF,
    [BATTLE_TERRAIN_POND]       = MOVE_BUBBLE_BEAM,
    [BATTLE_TERRAIN_MOUNTAIN]   = MOVE_ROCK_SLIDE,
    [BATTLE_TERRAIN_CAVE]       = MOVE_SHADOW_BALL,
    [BATTLE_TERRAIN_BUILDING]   = MOVE_SWIFT,
    [BATTLE_TERRAIN_PLAIN]      = MOVE_SWIFT,
    [BATTLE_TERRAIN_SNOW]       = MOVE_BLIZZARD,
#endif
    [BATTLE_TERRAIN_UNDERWATER]       = MOVE_HYDRO_PUMP,
    [BATTLE_TERRAIN_SOARING]          = MOVE_AIR_SLASH,
    [BATTLE_TERRAIN_SKY_PILLAR]       = MOVE_AIR_SLASH,
    [BATTLE_TERRAIN_BURIAL_GROUND]    = MOVE_SHADOW_BALL,
    [BATTLE_TERRAIN_PUDDLE]           = MOVE_MUD_BOMB,
    [BATTLE_TERRAIN_MARSH]            = MOVE_MUD_BOMB,
    [BATTLE_TERRAIN_SWAMP]            = MOVE_MUD_BOMB,
    [BATTLE_TERRAIN_ICE]              = MOVE_ICE_BEAM,
    [BATTLE_TERRAIN_VOLCANO]          = MOVE_LAVA_PLUME,
    [BATTLE_TERRAIN_DISTORTION_WORLD] = MOVE_TRI_ATTACK,
    [BATTLE_TERRAIN_SPACE]            = MOVE_DRACO_METEOR,
    [BATTLE_TERRAIN_ULTRA_SPACE]      = MOVE_PSYSHOCK,
};

// format: min. weight (hectograms), base power
static const u16 sWeightToDamageTable[] =
{
    100, 20,
    250, 40,
    500, 60,
    1000, 80,
    2000, 100,
    0xFFFF, 0xFFFF
};

struct PickupItem
{
    u16 itemId;
    u8 chance;
};

static const struct PickupItem sPickupItems[] =
{
    { ITEM_ORAN_BERRY, 15 },
    { ITEM_CHERI_BERRY, 25 },
    { ITEM_CHESTO_BERRY, 35 },
    { ITEM_PECHA_BERRY, 45 },
    { ITEM_RAWST_BERRY, 55 },
    { ITEM_ASPEAR_BERRY, 65 },
    { ITEM_PERSIM_BERRY, 75 },
    { ITEM_TM10, 80 },
    { ITEM_PP_UP, 85 },
    { ITEM_RARE_CANDY, 90 },
    { ITEM_NUGGET, 95 },
    { ITEM_SPELON_BERRY, 96 },
    { ITEM_PAMTRE_BERRY, 97 },
    { ITEM_WATMEL_BERRY, 98 },
    { ITEM_DURIN_BERRY, 99 },
    { ITEM_BELUE_BERRY, 1 },

};

static const u8 sTerrainToType[] =
{
    [BATTLE_TERRAIN_GRASS]      = TYPE_GRASS,
    [BATTLE_TERRAIN_LONG_GRASS] = TYPE_GRASS,
    [BATTLE_TERRAIN_SAND]       = TYPE_GROUND,
    [BATTLE_TERRAIN_UNDERWATER] = TYPE_WATER,
    [BATTLE_TERRAIN_WATER]      = TYPE_WATER,
    [BATTLE_TERRAIN_POND]       = TYPE_WATER,
    [BATTLE_TERRAIN_MOUNTAIN]   = TYPE_ROCK,
    [BATTLE_TERRAIN_CAVE]       = TYPE_ROCK,
    [BATTLE_TERRAIN_BUILDING]   = TYPE_NORMAL,
    [BATTLE_TERRAIN_PLAIN]      = TYPE_NORMAL,
};

// - ITEM_ULTRA_BALL skips Master Ball and ITEM_NONE
static const u8 sBallCatchBonuses[] =
{
    [ITEM_ULTRA_BALL - ITEM_ULTRA_BALL]  = 20,
    [ITEM_GREAT_BALL - ITEM_ULTRA_BALL]  = 15,
    [ITEM_POKE_BALL - ITEM_ULTRA_BALL]   = 10,
    [ITEM_SAFARI_BALL - ITEM_ULTRA_BALL] = 15
};

static bool32 NoTargetPresent(u8 battler, u32 move)
{
    if (!IsBattlerAlive(gBattlerTarget))
        gBattlerTarget = GetMoveTarget(move, NO_TARGET_OVERRIDE);

    switch (GetBattlerMoveTargetType(battler, move))
    {
    case MOVE_TARGET_SELECTED:
    case MOVE_TARGET_DEPENDS:
    case MOVE_TARGET_RANDOM:
        if (!IsBattlerAlive(gBattlerTarget))
            return TRUE;
        break;
    case MOVE_TARGET_BOTH:
        if (!IsBattlerAlive(gBattlerTarget) && !IsBattlerAlive(BATTLE_PARTNER(gBattlerTarget)))
            return TRUE;
        break;
    case MOVE_TARGET_FOES_AND_ALLY:
        if (!IsBattlerAlive(gBattlerTarget) && !IsBattlerAlive(BATTLE_PARTNER(gBattlerTarget)) && !IsBattlerAlive(BATTLE_PARTNER(gBattlerAttacker)))
            return TRUE;
        break;
    }

    return FALSE;
}


// TODO: Convert this to a proper FORM_CHANGE type.
static bool32 TryAegiFormChange(void)
{
    // Only Aegislash with Stance Change can transform, transformed mons cannot.
    // if (GetBattlerAbility(gBattlerAttacker) != ABILITY_STANCE_CHANGE
    //     || gBattleMons[gBattlerAttacker].status2 & STATUS2_TRANSFORMED)
    //     return FALSE;

    // switch (gBattleMons[gBattlerAttacker].species)
    // {
    // default:
    //     return FALSE;
    // case SPECIES_AEGISLASH_SHIELD: // Shield -> Blade
    //     if (IS_MOVE_STATUS(gCurrentMove))
    //         return FALSE;
    //     gBattleMons[gBattlerAttacker].species = SPECIES_AEGISLASH_BLADE;
    //     break;
    // case SPECIES_AEGISLASH_BLADE: // Blade -> Shield
    //     if (gCurrentMove != MOVE_KINGS_SHIELD)
    //         return FALSE;
    //     gBattleMons[gBattlerAttacker].species = SPECIES_AEGISLASH_SHIELD;
    //     break;
    // }

    // BattleScriptPushCursor();
    // gBattlescriptCurrInstr = BattleScript_AttackerFormChange;
    // return TRUE;
    return FALSE;
}

bool32 ProteanTryChangeType(u32 battler, u32 ability, u32 move, u32 moveType)
{
      if ((ability == ABILITY_PROTEAN || ability == ABILITY_LIBERO)
         && !gDisableStructs[gBattlerAttacker].usedProteanLibero
         && (gBattleMons[battler].type1 != moveType || gBattleMons[battler].type2 != moveType
             || (gBattleMons[battler].type3 != moveType && gBattleMons[battler].type3 != TYPE_MYSTERY))
         && move != MOVE_STRUGGLE)
    {
        SET_BATTLER_TYPE(battler, moveType);
        return TRUE;
    }
    return FALSE;
}

static bool32 IsMoveNotAllowedInSkyBattles(u32 move)
{
    return ((gBattleStruct->isSkyBattle) && (gMovesInfo[gCurrentMove].skyBattleBanned));
}

static void Cmd_attackcanceler(void)
{
    CMD_ARGS();

    s32 i, moveType;
    u16 attackerAbility = GetBattlerAbility(gBattlerAttacker);
    GET_MOVE_TYPE(gCurrentMove, moveType);

    // TODO: dynamax
    // Weight-based moves are blocked by Dynamax.
    // if (IsDynamaxed(gBattlerTarget) && IsMoveBlockedByDynamax(gCurrentMove))
    // {
    //     BattleScriptPushCursor();
    //     gBattlescriptCurrInstr = BattleScript_MoveBlockedByDynamax;
    //     return;
    // }

    if (gBattleOutcome != 0)
    {
        gCurrentActionFuncId = B_ACTION_FINISHED;
        return;
    }
    if (gBattleMons[gBattlerAttacker].hp == 0 && !(gHitMarker & HITMARKER_NO_ATTACKSTRING))
    {
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        gBattlescriptCurrInstr = BattleScript_MoveEnd;
        return;
    }
    if (B_STANCE_CHANGE_FAIL < GEN_7 && TryAegiFormChange())
        return;
    if (AtkCanceller_UnableToUseMove(moveType))
        return;

    if (WEATHER_HAS_EFFECT && gMovesInfo[gCurrentMove].power)
    {
        if (moveType == TYPE_FIRE && (gBattleWeather & B_WEATHER_RAIN_PRIMAL))
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_PRIMAL_WEATHER_FIZZLED_BY_RAIN;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_PrimalWeatherBlocksMove;
            return;
        }
        else if (moveType == TYPE_WATER && (gBattleWeather & B_WEATHER_SUN_PRIMAL))
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_PRIMAL_WEATHER_EVAPORATED_IN_SUN;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_PrimalWeatherBlocksMove;
            return;
        }
    }

    if (gSpecialStatuses[gBattlerAttacker].parentalBondState == PARENTAL_BOND_OFF
    && GetBattlerAbility(gBattlerAttacker) == ABILITY_PARENTAL_BOND
    && IsMoveAffectedByParentalBond(gCurrentMove, gBattlerAttacker)
    && !(gAbsentBattlerFlags & gBitTable[gBattlerTarget])
    /*&& gBattleStruct->zmove.toBeUsed[gBattlerAttacker] == MOVE_NONE*/) // TODO: Z-Moves
    {
        gSpecialStatuses[gBattlerAttacker].parentalBondState = PARENTAL_BOND_1ST_HIT;
        gMultiHitCounter = 2;
        PREPARE_BYTE_NUMBER_BUFFER(gBattleScripting.multihitString, 1, 0)
        return;
    }

    // Check Protean activation.
    if (ProteanTryChangeType(gBattlerAttacker, attackerAbility, gCurrentMove, moveType))
    {
        if (B_PROTEAN_LIBERO == GEN_9)
            gDisableStructs[gBattlerAttacker].usedProteanLibero = TRUE;
        PREPARE_TYPE_BUFFER(gBattleTextBuff1, moveType);
        gBattlerAbility = gBattlerAttacker;
        BattleScriptPushCursor();
        PrepareStringBattle(STRINGID_EMPTYSTRING3, gBattlerAttacker);
        gBattleCommunication[MSG_DISPLAY] = 1;
        gBattlescriptCurrInstr = BattleScript_ProteanActivates;
        return;
    }

    if (AtkCanceller_UnableToUseMove2())
        return;
    if (AbilityBattleEffects(ABILITYEFFECT_MOVES_BLOCK, gBattlerTarget, 0, 0, 0))
        return;
    if (!gBattleMons[gBattlerAttacker].pp[gCurrMovePos] && gCurrentMove != MOVE_STRUGGLE 
     && !(gHitMarker & (HITMARKER_ALLOW_NO_PP | HITMARKER_NO_ATTACKSTRING | HITMARKER_NO_PPDEDUCT))
     && !(gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS))
    {
        gBattlescriptCurrInstr = BattleScript_NoPPForMove;
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        return;
    }
    if (B_STANCE_CHANGE_FAIL >= GEN_7 && TryAegiFormChange())
        return;

    gHitMarker &= ~HITMARKER_ALLOW_NO_PP;

    if (!(gHitMarker & HITMARKER_OBEYS) && !(gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS))
    {
        switch (IsMonDisobedient())
        {
        case 0:
            break;
        case 2:
            gHitMarker |= HITMARKER_OBEYS;
            return;
        default:
            gMoveResultFlags |= MOVE_RESULT_MISSED;
            return;
        }
    }

    gHitMarker |= HITMARKER_OBEYS;
    // Check if no available target present on the field or if Sky Battles ban the move
    if ((NoTargetPresent(gBattlerAttacker, gCurrentMove)
        && (!gBattleMoveEffects[gMovesInfo[gCurrentMove].effect].twoTurnEffect || (gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS)))
        || (IsMoveNotAllowedInSkyBattles(gCurrentMove)))
    {
        if (gMovesInfo[gCurrentMove].effect == EFFECT_FLING) // Edge case for removing a mon's item when there is no target available after using Fling.
            gBattlescriptCurrInstr = BattleScript_FlingFailConsumeItem;
        else
            gBattlescriptCurrInstr = BattleScript_FailedFromAtkString;

        if (!gBattleMoveEffects[gMovesInfo[gCurrentMove].effect].twoTurnEffect || (gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS))
            CancelMultiTurnMoves(gBattlerAttacker);
        return;
    }

    if (gProtectStructs[gBattlerTarget].bounceMove
        && gMovesInfo[gCurrentMove].magicCoatAffected
        && !gProtectStructs[gBattlerAttacker].usesBouncedMove)
    {
        gProtectStructs[gBattlerTarget].usesBouncedMove = TRUE;
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
        // Edge case for bouncing a powder move against a grass type pokemon.
        SetAtkCancellerForCalledMove();
        if (BlocksPrankster(gCurrentMove, gBattlerTarget, gBattlerAttacker, TRUE))
        {
            // Opponent used a prankster'd magic coat -> reflected status move should fail against a dark-type attacker
            gBattlerTarget = gBattlerAttacker;
            gBattlescriptCurrInstr = BattleScript_MagicCoatBouncePrankster;
        }
        else
        {
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_MagicCoatBounce;
        }
        return;
    }
    else if (GetBattlerAbility(gBattlerTarget) == ABILITY_MAGIC_BOUNCE
             && gMovesInfo[gCurrentMove].magicCoatAffected
             && !gProtectStructs[gBattlerAttacker].usesBouncedMove)
    {
        gProtectStructs[gBattlerTarget].usesBouncedMove = TRUE;
        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
        // Edge case for bouncing a powder move against a grass type pokemon.
        SetAtkCancellerForCalledMove();
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_MagicCoatBounce;
        gBattlerAbility = gBattlerTarget;
        return;
    }

    // Z-moves and Max Moves bypass protection, but deal reduced damage (factored in AccumulateOtherModifiers)
    // TODO: Z-Moves and Dynamax
    // if ((gBattleStruct->zmove.active || IsMaxMove(gCurrentMove))
    //      && IS_BATTLER_PROTECTED(gBattlerTarget))
    // {
    //     BattleScriptPush(cmd->nextInstr);
    //     gBattlescriptCurrInstr = BattleScript_CouldntFullyProtect;
    //     return;
    // }

    for (i = 0; i < gBattlersCount; i++)
    {
        if ((gProtectStructs[gBattlerByTurnOrder[i]].stealMove) && gMovesInfo[gCurrentMove].snatchAffected)
        {
            gProtectStructs[gBattlerByTurnOrder[i]].stealMove = FALSE;
            gBattleScripting.battler = gBattlerByTurnOrder[i];
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_SnatchedMove;
            return;
        }
    }

    if (gSpecialStatuses[gBattlerTarget].lightningRodRedirected)
    {
        gSpecialStatuses[gBattlerTarget].lightningRodRedirected = FALSE;
        gLastUsedAbility = ABILITY_LIGHTNING_ROD;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_TookAttack;
        RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
    }
    else if (gSpecialStatuses[gBattlerTarget].stormDrainRedirected)
    {
        gSpecialStatuses[gBattlerTarget].stormDrainRedirected = FALSE;
        gLastUsedAbility = ABILITY_STORM_DRAIN;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_TookAttack;
        RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
    }
    else if (IsBattlerProtected(gBattlerTarget, gCurrentMove)
     && (gCurrentMove != MOVE_CURSE || IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_GHOST))
     && (!gBattleMoveEffects[gMovesInfo[gCurrentMove].effect].twoTurnEffect || (gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS))
     && gMovesInfo[gCurrentMove].effect != EFFECT_SUCKER_PUNCH
     && gMovesInfo[gCurrentMove].effect != EFFECT_UPPER_HAND)
    {
        if (IsMoveMakingContact(gCurrentMove, gBattlerAttacker))
            gProtectStructs[gBattlerAttacker].touchedProtectLike = TRUE;
        CancelMultiTurnMoves(gBattlerAttacker);
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gLastLandedMoves[gBattlerTarget] = 0;
        gLastHitByType[gBattlerTarget] = 0;

        if (gSpecialStatuses[gBattlerAttacker].parentalBondState == PARENTAL_BOND_1ST_HIT)
        {
            gSpecialStatuses[gBattlerAttacker].parentalBondState = PARENTAL_BOND_OFF; // No second hit if first hit was blocked
            gSpecialStatuses[gBattlerAttacker].multiHitOn = 0;
            gMultiHitCounter = 0;
        }
        gBattleCommunication[MISS_TYPE] = B_MSG_PROTECTED;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else if (gProtectStructs[gBattlerTarget].beakBlastCharge && IsMoveMakingContact(gCurrentMove, gBattlerAttacker))
    {
        gProtectStructs[gBattlerAttacker].touchedProtectLike = TRUE;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static bool32 JumpIfMoveFailed(u8 adder, u16 move)
{
    if (gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
    {
        gLastLandedMoves[gBattlerTarget] = 0;
        gLastHitByType[gBattlerTarget] = 0;
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        return TRUE;
    }
    else
    {
        TrySetDestinyBondToHappen();
        if (AbilityBattleEffects(ABILITYEFFECT_ABSORBING, gBattlerTarget, 0, 0, move))
            return TRUE;
    }
    gBattlescriptCurrInstr += adder;
    return FALSE;
}

// used to be Cmd_jumpifaffectedbyprotect
static void Cmd_unused5(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (IsBattlerProtected(gBattlerTarget, gCurrentMove))
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        JumpIfMoveFailed(sizeof(*cmd), MOVE_NONE);
        gBattleCommunication[MISS_TYPE] = B_MSG_PROTECTED;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static bool8 JumpIfMoveAffectedByProtect(u16 move)
{
    bool8 affected = FALSE;
    if (IsBattlerProtected(gBattlerTarget, move))
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        JumpIfMoveFailed(7, move);
        gBattleCommunication[MISS_TYPE] = B_MSG_PROTECTED;
        affected = TRUE;
    }
    return affected;
}

static bool32 AccuracyCalcHelper(u16 move)
{
    if ((gStatuses3[gBattlerTarget] & STATUS3_ALWAYS_HITS && gDisableStructs[gBattlerTarget].battlerWithSureHit == gBattlerAttacker)
     || (B_TOXIC_NEVER_MISS >= GEN_6 && gMovesInfo[move].effect == EFFECT_TOXIC && IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_POISON))
     || gStatuses4[gBattlerTarget] & STATUS4_GLAIVE_RUSH)
    {
        JumpIfMoveFailed(7, move);
        return TRUE;
    }
    // If the attacker has the ability No Guard and they aren't targeting a Pokemon involved in a Sky Drop with the move Sky Drop, move hits.
    else if (GetBattlerAbility(gBattlerAttacker) == ABILITY_NO_GUARD && (move != MOVE_SKY_DROP || gBattleStruct->skyDropTargets[gBattlerTarget] == 0xFF))
    {
        if (!JumpIfMoveFailed(7, move))
            RecordAbilityBattle(gBattlerAttacker, ABILITY_NO_GUARD);
        return TRUE;
    }
    // If the target has the ability No Guard and they aren't involved in a Sky Drop or the current move isn't Sky Drop, move hits.
    else if (GetBattlerAbility(gBattlerTarget) == ABILITY_NO_GUARD && (move != MOVE_SKY_DROP || gBattleStruct->skyDropTargets[gBattlerTarget] == 0xFF))
    {
        if (!JumpIfMoveFailed(7, move))
            RecordAbilityBattle(gBattlerTarget, ABILITY_NO_GUARD);
        return TRUE;
    }
    // If the target is under the effects of Telekinesis, and the move isn't a OH-KO move, move hits.
    else if (gStatuses3[gBattlerTarget] & STATUS3_TELEKINESIS
             && !(gStatuses3[gBattlerTarget] & STATUS3_SEMI_INVULNERABLE)
             && gMovesInfo[move].effect != EFFECT_OHKO)
    {
        JumpIfMoveFailed(7, move);
        return TRUE;
    }

    // TODO: Z-Moves
    // if (gBattleStruct->zmove.active && !(gStatuses3[gBattlerTarget] & STATUS3_SEMI_INVULNERABLE))
    // {
    //     JumpIfMoveFailed(7, move);
    //     return TRUE;
    // }

    if ((gStatuses3[gBattlerTarget] & STATUS3_PHANTOM_FORCE)
    || ((gStatuses3[gBattlerTarget] & STATUS3_ON_AIR) && !(gMovesInfo[move].damagesAirborne || gMovesInfo[move].damagesAirborneDoubleDamage))
    || ((gStatuses3[gBattlerTarget] & STATUS3_UNDERGROUND) && !gMovesInfo[move].damagesUnderground)
    || ((gStatuses3[gBattlerTarget] & STATUS3_UNDERWATER) && !gMovesInfo[move].damagesUnderwater))
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        JumpIfMoveFailed(7, move);
        return TRUE;
    }

    if (WEATHER_HAS_EFFECT)
    {
        if ((gMovesInfo[move].effect == EFFECT_THUNDER || gMovesInfo[move].effect == EFFECT_RAIN_ALWAYS_HIT)
            && IsBattlerWeatherAffected(gBattlerTarget, B_WEATHER_RAIN))
        {
            // thunder/hurricane/genie moves ignore acc checks in rain unless target is holding utility umbrella
            JumpIfMoveFailed(7, move);
            return TRUE;
        }
        else if ((gBattleWeather & (B_WEATHER_HAIL | B_WEATHER_SNOW)) && gMovesInfo[move].effect == EFFECT_BLIZZARD)
        {
            // Blizzard ignores acc checks in Hail in Gen4+
            JumpIfMoveFailed(7, move);
            return TRUE;
        }
    }

    if (B_MINIMIZE_DMG_ACC >= GEN_6
     && (gStatuses3[gBattlerTarget] & STATUS3_MINIMIZED)
     && gMovesInfo[move].minimizeDoubleDamage)
    {
        JumpIfMoveFailed(7, move);
        return TRUE;
    }

    if (gMovesInfo[move].accuracy == 0)
    {
        JumpIfMoveFailed(7, move);
        return TRUE;
    }

    return FALSE;
}

u32 GetTotalAccuracy(u32 battlerAtk, u32 battlerDef, u32 move, u32 atkAbility, u32 defAbility, u32 atkHoldEffect, u32 defHoldEffect)
{
    u32 calc, moveAcc;
    s8 buff, accStage, evasionStage;
    u32 atkParam = GetBattlerHoldEffectParam(battlerAtk);
    u32 defParam = GetBattlerHoldEffectParam(battlerDef);
    u32 atkAlly = BATTLE_PARTNER(battlerAtk);
    u32 atkAllyAbility = GetBattlerAbility(atkAlly);

    gPotentialItemEffectBattler = battlerDef;
    accStage = gBattleMons[battlerAtk].statStages[STAT_ACC];
    evasionStage = gBattleMons[battlerDef].statStages[STAT_EVASION];
    if (atkAbility == ABILITY_UNAWARE || atkAbility == ABILITY_KEEN_EYE || atkAbility == ABILITY_MINDS_EYE
            || (B_ILLUMINATE_EFFECT >= GEN_9 && atkAbility == ABILITY_ILLUMINATE))
        evasionStage = DEFAULT_STAT_STAGE;
    if (gMovesInfo[move].ignoresTargetDefenseEvasionStages)
        evasionStage = DEFAULT_STAT_STAGE;
    if (defAbility == ABILITY_UNAWARE)
        accStage = DEFAULT_STAT_STAGE;

    if (gBattleMons[battlerDef].status2 & STATUS2_FORESIGHT || gStatuses3[battlerDef] & STATUS3_MIRACLE_EYED)
        buff = accStage;
    else
        buff = accStage + DEFAULT_STAT_STAGE - evasionStage;

    if (buff < MIN_STAT_STAGE)
        buff = MIN_STAT_STAGE;
    if (buff > MAX_STAT_STAGE)
        buff = MAX_STAT_STAGE;

    moveAcc = gMovesInfo[move].accuracy;
    // Check Thunder and Hurricane on sunny weather.
    if (IsBattlerWeatherAffected(battlerDef, B_WEATHER_SUN) && gMovesInfo[move].effect == EFFECT_THUNDER)
        moveAcc = 50;
    // Check Wonder Skin.
    if (defAbility == ABILITY_WONDER_SKIN && IS_MOVE_STATUS(move) && moveAcc > 50)
        moveAcc = 50;

    calc = gAccuracyStageRatios[buff].dividend * moveAcc;
    calc /= gAccuracyStageRatios[buff].divisor;

    // Attacker's ability
    switch (atkAbility)
    {
    case ABILITY_COMPOUND_EYES:
        calc = (calc * 130) / 100; // 1.3 compound eyes boost
        break;
    case ABILITY_VICTORY_STAR:
        calc = (calc * 110) / 100; // 1.1 victory star boost
        break;
    case ABILITY_HUSTLE:
        if (IS_MOVE_PHYSICAL(move))
            calc = (calc * 80) / 100; // 1.2 hustle loss
        break;
    }

    // Target's ability
    switch (defAbility)
    {
    case ABILITY_SAND_VEIL:
        if (WEATHER_HAS_EFFECT && gBattleWeather & B_WEATHER_SANDSTORM)
            calc = (calc * 80) / 100; // 1.2 sand veil loss
        break;
    case ABILITY_SNOW_CLOAK:
        if (WEATHER_HAS_EFFECT && (gBattleWeather & (B_WEATHER_HAIL | B_WEATHER_SNOW)))
            calc = (calc * 80) / 100; // 1.2 snow cloak loss
        break;
    case ABILITY_TANGLED_FEET:
        if (gBattleMons[battlerDef].status2 & STATUS2_CONFUSION)
            calc = (calc * 50) / 100; // 1.5 tangled feet loss
        break;
    }

    // Attacker's ally's ability
    switch (atkAllyAbility)
    {
    case ABILITY_VICTORY_STAR:
        if (IsBattlerAlive(atkAlly))
            calc = (calc * 110) / 100; // 1.1 ally's victory star boost
        break;
    }

    // Attacker's hold effect
    switch (atkHoldEffect)
    {
    case HOLD_EFFECT_WIDE_LENS:
        calc = (calc * (100 + atkParam)) / 100;
        break;
    case HOLD_EFFECT_ZOOM_LENS:
        if (GetBattlerTurnOrderNum(battlerAtk) > GetBattlerTurnOrderNum(battlerDef))
            calc = (calc * (100 + atkParam)) / 100;
        break;
    }

    // Target's hold effect
    switch (defHoldEffect)
    {
    case HOLD_EFFECT_EVASION_UP:
        calc = (calc * (100 - defParam)) / 100;
        break;
    }

    if (gProtectStructs[battlerAtk].usedMicleBerry)
    {
        gProtectStructs[battlerAtk].usedMicleBerry = FALSE;
        if (atkAbility == ABILITY_RIPEN)
            calc = (calc * 140) / 100;  // ripen gives 40% acc boost
        else
            calc = (calc * 120) / 100;  // 20% acc boost
    }

    if (gFieldStatuses & STATUS_FIELD_GRAVITY)
        calc = (calc * 5) / 3; // 1.66 Gravity acc boost

    if (B_AFFECTION_MECHANICS == TRUE && GetBattlerAffectionHearts(battlerDef) == AFFECTION_FIVE_HEARTS)
        calc = (calc * 90) / 100;

    return calc;
}

static void Cmd_accuracycheck(void)
{
    CMD_ARGS(const u8 *failInstr, u16 move);

    u32 type, move = cmd->move;
    u32 moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, move);
    u32 abilityAtk = GetBattlerAbility(gBattlerAttacker);
    u32 abilityDef = GetBattlerAbility(gBattlerTarget);
    u32 holdEffectAtk = GetBattlerHoldEffect(gBattlerAttacker, TRUE);

    // pokefirered specific
    if ((gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE
        && !BtlCtrl_OakOldMan_TestState2Flag(1)
        && gMovesInfo[move].power != 0
        && GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
     || (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE
        && !BtlCtrl_OakOldMan_TestState2Flag(2)
        && gMovesInfo[move].power == 0
        && GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
     || (gBattleTypeFlags & BATTLE_TYPE_POKEDUDE))
    {
        JumpIfMoveFailed(7, move);
        return;
    }

    if (move == ACC_CURR_MOVE)
        move = gCurrentMove;

    if (move == NO_ACC_CALC_CHECK_LOCK_ON)
    {
        if (gStatuses3[gBattlerTarget] & STATUS3_ALWAYS_HITS && gDisableStructs[gBattlerTarget].battlerWithSureHit == gBattlerAttacker)
            gBattlescriptCurrInstr = cmd->nextInstr;
        else if (gStatuses3[gBattlerTarget] & (STATUS3_SEMI_INVULNERABLE))
            gBattlescriptCurrInstr = cmd->failInstr;
        else if (!JumpIfMoveAffectedByProtect(gCurrentMove))
            gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else if (gSpecialStatuses[gBattlerAttacker].parentalBondState == PARENTAL_BOND_2ND_HIT
        || (gSpecialStatuses[gBattlerAttacker].multiHitOn
        && (abilityAtk == ABILITY_SKILL_LINK || holdEffectAtk == HOLD_EFFECT_LOADED_DICE
        || !(gMovesInfo[move].effect == EFFECT_TRIPLE_KICK || gMovesInfo[move].effect == EFFECT_POPULATION_BOMB))))
    {
        // No acc checks for second hit of Parental Bond or multi hit moves, except Triple Kick/Triple Axel/Population Bomb
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        u32 accuracy;

        GET_MOVE_TYPE(move, type);
        if (JumpIfMoveAffectedByProtect(move))
            return;
        if (AccuracyCalcHelper(move))
            return;

        accuracy = GetTotalAccuracy(
            gBattlerAttacker,
            gBattlerTarget,
            move,
            abilityAtk,
            abilityDef,
            holdEffectAtk,
            GetBattlerHoldEffect(gBattlerTarget, TRUE)
        );

        if (!RandomPercentage(RNG_ACCURACY, accuracy))
        {
            gMoveResultFlags |= MOVE_RESULT_MISSED;
            if (holdEffectAtk == HOLD_EFFECT_BLUNDER_POLICY)
                gBattleStruct->blunderPolicy = TRUE;    // Only activates from missing through acc/evasion checks

            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE &&
                (moveTarget == MOVE_TARGET_BOTH || moveTarget == MOVE_TARGET_FOES_AND_ALLY))
                gBattleCommunication[MISS_TYPE] = B_MSG_AVOIDED_ATK;
            else
                gBattleCommunication[MISS_TYPE] = B_MSG_MISSED;

            if (gMovesInfo[move].power)
                CalcTypeEffectivenessMultiplier(move, type, gBattlerAttacker, gBattlerTarget, abilityDef, TRUE);
        }
        JumpIfMoveFailed(7, move);
    }
}

static void Cmd_attackstring(void)
{
    CMD_ARGS();

    if (gBattleControllerExecFlags)
        return;

    if (!(gHitMarker & (HITMARKER_NO_ATTACKSTRING | HITMARKER_ATTACKSTRING_PRINTED)))
    {
        PrepareStringBattle(STRINGID_USEDMOVE, gBattlerAttacker);
        gHitMarker |= HITMARKER_ATTACKSTRING_PRINTED;
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
    gBattleCommunication[MSG_DISPLAY] = 0;
}

static void Cmd_ppreduce(void)
{
    CMD_ARGS();

    s32 i, ppToDeduct = 1;
    u32 moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);

    if (gBattleControllerExecFlags)
        return;

    if (gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS)
        gHitMarker |= HITMARKER_NO_PPDEDUCT;

    if (moveTarget == MOVE_TARGET_BOTH
        || moveTarget == MOVE_TARGET_FOES_AND_ALLY
        || moveTarget == MOVE_TARGET_ALL_BATTLERS
        || gMovesInfo[gCurrentMove].forcePressure)
    {
        for (i = 0; i < gBattlersCount; i++)
        {
            if (GetBattlerSide(i) != GetBattlerSide(gBattlerAttacker) && IsBattlerAlive(i))
                ppToDeduct += (GetBattlerAbility(i) == ABILITY_PRESSURE);
        }
    }
    else if (moveTarget != MOVE_TARGET_OPPONENTS_FIELD)
    {
        if (gBattlerAttacker != gBattlerTarget && GetBattlerAbility(gBattlerTarget) == ABILITY_PRESSURE)
             ppToDeduct++;
    }

    if (!(gHitMarker & (HITMARKER_NO_PPDEDUCT | HITMARKER_NO_ATTACKSTRING)) && gBattleMons[gBattlerAttacker].pp[gCurrMovePos])
    {
        gProtectStructs[gBattlerAttacker].notFirstStrike = TRUE;

        // For item Metronome, echoed voice
        if (gCurrentMove != gLastResultingMoves[gBattlerAttacker] || WasUnableToUseMove(gBattlerAttacker))
            gBattleStruct->sameMoveTurns[gBattlerAttacker] = 0;

        if (gBattleMons[gBattlerAttacker].pp[gCurrMovePos] > ppToDeduct)
            gBattleMons[gBattlerAttacker].pp[gCurrMovePos] -= ppToDeduct;
        else
            gBattleMons[gBattlerAttacker].pp[gCurrMovePos] = 0;

        if (MOVE_IS_PERMANENT(gBattlerAttacker, gCurrMovePos))
        {
            BtlController_EmitSetMonData(BUFFER_A, REQUEST_PPMOVE1_BATTLE + gCurrMovePos, 0,
                                         sizeof(gBattleMons[gBattlerAttacker].pp[gCurrMovePos]),
                                         &gBattleMons[gBattlerAttacker].pp[gCurrMovePos]);
            MarkBattlerForControllerExec(gBattlerAttacker);
        }
    }

    gHitMarker &= ~HITMARKER_NO_PPDEDUCT;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

// The chance is 1/N for each stage.
#if B_CRIT_CHANCE >= GEN_7
    static const u8 sCriticalHitChance[] = {24, 8, 2, 1, 1};
#elif B_CRIT_CHANCE == GEN_6
    static const u8 sCriticalHitChance[] = {16, 8, 2, 1, 1};
#else
    static const u8 sCriticalHitChance[] = {16, 8, 4, 3, 2}; // Gens 2,3,4,5
#endif // B_CRIT_CHANCE

#define BENEFITS_FROM_LEEK(battler, holdEffect)((holdEffect == HOLD_EFFECT_LEEK) && (GET_BASE_SPECIES_ID(gBattleMons[battler].species) == SPECIES_FARFETCHD || gBattleMons[battler].species == SPECIES_SIRFETCHD))
s32 CalcCritChanceStageArgs(u32 battlerAtk, u32 battlerDef, u32 move, bool32 recordAbility, u32 abilityAtk, u32 abilityDef, u32 holdEffectAtk)
{
    s32 critChance = 0;

    if (gSideStatuses[battlerDef] & SIDE_STATUS_LUCKY_CHANT
        || abilityDef == ABILITY_BATTLE_ARMOR || abilityDef == ABILITY_SHELL_ARMOR)
    {
        critChance = -1;
    }
    else if (gStatuses3[battlerAtk] & STATUS3_LASER_FOCUS
        || gMovesInfo[gCurrentMove].alwaysCriticalHit
        || (abilityAtk == ABILITY_MERCILESS && gBattleMons[battlerDef].status1 & STATUS1_PSN_ANY))
    {
        critChance = -2;
    }
    else
    {
        critChance  = 2 * ((gBattleMons[battlerAtk].status2 & STATUS2_FOCUS_ENERGY) != 0)
                    + 1 * ((gBattleMons[battlerAtk].status2 & STATUS2_DRAGON_CHEER) != 0)
                    + gMovesInfo[gCurrentMove].criticalHitStage
                    + (holdEffectAtk == HOLD_EFFECT_SCOPE_LENS)
                    + 2 * (holdEffectAtk == HOLD_EFFECT_LUCKY_PUNCH && gBattleMons[battlerAtk].species == SPECIES_CHANSEY)
                    + 2 * BENEFITS_FROM_LEEK(battlerAtk, holdEffectAtk)
                    + 2 * (B_AFFECTION_MECHANICS == TRUE && GetBattlerAffectionHearts(battlerAtk) == AFFECTION_FIVE_HEARTS)
                    + (abilityAtk == ABILITY_SUPER_LUCK)
                    + gBattleStruct->bonusCritStages[gBattlerAttacker];

        // Record ability only if move had at least +3 chance to get a crit
        if (critChance >= 3 && recordAbility && (abilityDef == ABILITY_BATTLE_ARMOR || abilityDef == ABILITY_SHELL_ARMOR))
            RecordAbilityBattle(battlerDef, abilityDef);

        if (critChance >= ARRAY_COUNT(sCriticalHitChance))
            critChance = ARRAY_COUNT(sCriticalHitChance) - 1;
    }

    return critChance;
}

s32 CalcCritChanceStage(u32 battlerAtk, u32 battlerDef, u32 move, bool32 recordAbility)
{
    u32 abilityAtk = GetBattlerAbility(gBattlerAttacker);
    u32 abilityDef = GetBattlerAbility(gBattlerTarget);
    u32 holdEffectAtk = GetBattlerHoldEffect(battlerAtk, TRUE);
    return CalcCritChanceStageArgs(battlerAtk, battlerDef, move, recordAbility, abilityAtk, abilityDef, holdEffectAtk);
}
#undef BENEFITS_FROM_LEEK

static void Cmd_critcalc(void)
{
    CMD_ARGS();

    u16 partySlot;
    s32 critChance = CalcCritChanceStage(gBattlerAttacker, gBattlerTarget, gCurrentMove, TRUE);
    gPotentialItemEffectBattler = gBattlerAttacker;

    if ((gBattleTypeFlags & (BATTLE_TYPE_OLD_MAN_TUTORIAL | BATTLE_TYPE_POKEDUDE))
    || ((gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE) && !BtlCtrl_OakOldMan_TestState2Flag(1)))
        gIsCriticalHit = FALSE;
    else if (critChance == -1)
        gIsCriticalHit = FALSE;
    else if (critChance == -2)
        gIsCriticalHit = TRUE;
    else
        gIsCriticalHit = RandomWeighted(RNG_CRITICAL_HIT, sCriticalHitChance[critChance] - 1, 1);

    // Counter for EVO_CRITICAL_HITS.
    partySlot = gBattlerPartyIndexes[gBattlerAttacker];
    if (gIsCriticalHit && GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER
        && !(gBattleTypeFlags & BATTLE_TYPE_MULTI && GetBattlerPosition(gBattlerAttacker) == B_POSITION_PLAYER_LEFT))
        gPartyCriticalHits[partySlot]++;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_damagecalc(void)
{
    CMD_ARGS();

    u8 moveType;

    GET_MOVE_TYPE(gCurrentMove, moveType);
    gBattleMoveDamage = CalculateMoveDamage(gCurrentMove, gBattlerAttacker, gBattlerTarget, moveType, 0, gIsCriticalHit, TRUE, TRUE);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void AI_CalcDmg(u8 attacker, u8 defender)
{
    u32 sideStatus = gSideStatuses[GET_BATTLER_SIDE(defender)];
    gBattleMoveDamage = CalculateBaseDamageOld(&gBattleMons[attacker], &gBattleMons[defender], gCurrentMove,
                                            sideStatus, gDynamicBasePower,
                                            gBattleStruct->dynamicMoveType, attacker, defender);
    gDynamicBasePower = 0;
    gBattleMoveDamage = gBattleMoveDamage * gCritMultiplier * gBattleScripting.dmgMultiplier;

    if (gStatuses3[attacker] & STATUS3_CHARGED_UP && gMovesInfo[gCurrentMove].type == TYPE_ELECTRIC)
        gBattleMoveDamage *= 2;
    if (gProtectStructs[attacker].helpingHand)
        gBattleMoveDamage = gBattleMoveDamage * 15 / 10;
}

static void ModulateDmgByType(u8 multiplier)
{
    gBattleMoveDamage = gBattleMoveDamage * multiplier / 10;
    if (gBattleMoveDamage == 0 && multiplier != 0)
        gBattleMoveDamage = 1;

    switch (multiplier)
    {
    case TYPE_MUL_NO_EFFECT:
        gMoveResultFlags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
        gMoveResultFlags &= ~MOVE_RESULT_NOT_VERY_EFFECTIVE;
        gMoveResultFlags &= ~MOVE_RESULT_SUPER_EFFECTIVE;
        break;
    case TYPE_MUL_NOT_EFFECTIVE:
        if (gMovesInfo[gCurrentMove].power && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
        {
            if (gMoveResultFlags & MOVE_RESULT_SUPER_EFFECTIVE)
                gMoveResultFlags &= ~MOVE_RESULT_SUPER_EFFECTIVE;
            else
                gMoveResultFlags |= MOVE_RESULT_NOT_VERY_EFFECTIVE;
        }
        break;
    case TYPE_MUL_SUPER_EFFECTIVE:
        if (gMovesInfo[gCurrentMove].power && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
        {
            if (gMoveResultFlags & MOVE_RESULT_NOT_VERY_EFFECTIVE)
                gMoveResultFlags &= ~MOVE_RESULT_NOT_VERY_EFFECTIVE;
            else
                gMoveResultFlags |= MOVE_RESULT_SUPER_EFFECTIVE;
        }
        break;
    }
}

static void Cmd_typecalc(void)
{
    CMD_ARGS();

    u8 moveType;

    GET_MOVE_TYPE(gCurrentMove, moveType);
    CalcTypeEffectivenessMultiplier(gCurrentMove, moveType, gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerTarget), TRUE);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void CheckWonderGuardAndLevitate(void)
{
    u8 flags = 0;
    s32 i = 0;
    u8 moveType;

    if (gCurrentMove == MOVE_STRUGGLE || !gMovesInfo[gCurrentMove].power)
        return;

    GET_MOVE_TYPE(gCurrentMove, moveType);

    if (gBattleMons[gBattlerTarget].ability == ABILITY_LEVITATE && moveType == TYPE_GROUND)
    {
        gLastUsedAbility = ABILITY_LEVITATE;
        gBattleCommunication[MISS_TYPE] = B_MSG_GROUND_MISS;
        RecordAbilityBattle(gBattlerTarget, ABILITY_LEVITATE);
        return;
    }

    while (TYPE_EFFECT_ATK_TYPE(i) != TYPE_ENDTABLE)
    {
        if (TYPE_EFFECT_ATK_TYPE(i) == TYPE_FORESIGHT)
        {
            if (gBattleMons[gBattlerTarget].status2 & STATUS2_FORESIGHT)
                break;
            i += 3;
            continue;
        }
        if (TYPE_EFFECT_ATK_TYPE(i) == moveType)
        {
            // check no effect
            if (TYPE_EFFECT_DEF_TYPE(i) == gBattleMons[gBattlerTarget].type1
                && TYPE_EFFECT_MULTIPLIER(i) == TYPE_MUL_NO_EFFECT)
            {
                gMoveResultFlags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
                gProtectStructs[gBattlerAttacker].targetNotAffected = 1;
            }
            if (TYPE_EFFECT_DEF_TYPE(i) == gBattleMons[gBattlerTarget].type2 &&
                gBattleMons[gBattlerTarget].type1 != gBattleMons[gBattlerTarget].type2 &&
                TYPE_EFFECT_MULTIPLIER(i) == TYPE_MUL_NO_EFFECT)
            {
                gMoveResultFlags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
                gProtectStructs[gBattlerAttacker].targetNotAffected = 1;
            }

            // check super effective
            if (TYPE_EFFECT_DEF_TYPE(i) == gBattleMons[gBattlerTarget].type1 && TYPE_EFFECT_MULTIPLIER(i) == 20)
                flags |= 1;
            if (TYPE_EFFECT_DEF_TYPE(i) == gBattleMons[gBattlerTarget].type2
             && gBattleMons[gBattlerTarget].type1 != gBattleMons[gBattlerTarget].type2
             && TYPE_EFFECT_MULTIPLIER(i) == TYPE_MUL_SUPER_EFFECTIVE)
                flags |= 1;

            // check not very effective
            if (TYPE_EFFECT_DEF_TYPE(i) == gBattleMons[gBattlerTarget].type1 && TYPE_EFFECT_MULTIPLIER(i) == 5)
                flags |= 2;
            if (TYPE_EFFECT_DEF_TYPE(i) == gBattleMons[gBattlerTarget].type2
             && gBattleMons[gBattlerTarget].type1 != gBattleMons[gBattlerTarget].type2
             && TYPE_EFFECT_MULTIPLIER(i) == TYPE_MUL_NOT_EFFECTIVE)
                flags |= 2;
        }
        i += 3;
    }

    if (gBattleMons[gBattlerTarget].ability == ABILITY_WONDER_GUARD && AttacksThisTurn(gBattlerAttacker, gCurrentMove) == 2)
    {
        if (((flags & 2) || !(flags & 1)) && gMovesInfo[gCurrentMove].power)
        {
            gLastUsedAbility = ABILITY_WONDER_GUARD;
            gBattleCommunication[MISS_TYPE] = B_MSG_AVOIDED_DMG;
            RecordAbilityBattle(gBattlerTarget, ABILITY_WONDER_GUARD);
        }
    }
}

// Same as ModulateDmgByType except different arguments
static void ModulateDmgByType2(u8 multiplier, u16 move, u8 *flags)
{
    gBattleMoveDamage = gBattleMoveDamage * multiplier / 10;
    if (gBattleMoveDamage == 0 && multiplier != 0)
        gBattleMoveDamage = 1;

    switch (multiplier)
    {
    case TYPE_MUL_NO_EFFECT:
        *flags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
        *flags &= ~MOVE_RESULT_NOT_VERY_EFFECTIVE;
        *flags &= ~MOVE_RESULT_SUPER_EFFECTIVE;
        break;
    case TYPE_MUL_NOT_EFFECTIVE:
        if (gMovesInfo[move].power && !(*flags & MOVE_RESULT_NO_EFFECT))
        {
            if (*flags & MOVE_RESULT_SUPER_EFFECTIVE)
                *flags &= ~MOVE_RESULT_SUPER_EFFECTIVE;
            else
                *flags |= MOVE_RESULT_NOT_VERY_EFFECTIVE;
        }
        break;
    case TYPE_MUL_SUPER_EFFECTIVE:
        if (gMovesInfo[move].power && !(*flags & MOVE_RESULT_NO_EFFECT))
        {
            if (*flags & MOVE_RESULT_NOT_VERY_EFFECTIVE)
                *flags &= ~MOVE_RESULT_NOT_VERY_EFFECTIVE;
            else
                *flags |= MOVE_RESULT_SUPER_EFFECTIVE;
        }
        break;
    }
}

u8 TypeCalc(u16 move, u8 attacker, u8 defender)
{
    s32 i = 0;
    u8 flags = 0;
    u8 moveType;

    if (move == MOVE_STRUGGLE)
        return 0;

    moveType = gMovesInfo[move].type;

    // check stab
    if (IS_BATTLER_OF_TYPE(attacker, moveType))
    {
        gBattleMoveDamage = gBattleMoveDamage * 15;
        gBattleMoveDamage = gBattleMoveDamage / 10;
    }

    if (gBattleMons[defender].ability == ABILITY_LEVITATE && moveType == TYPE_GROUND)
    {
        flags |= (MOVE_RESULT_MISSED | MOVE_RESULT_DOESNT_AFFECT_FOE);
    }
    else
    {
        while (TYPE_EFFECT_ATK_TYPE(i) != TYPE_ENDTABLE)
        {
            if (TYPE_EFFECT_ATK_TYPE(i) == TYPE_FORESIGHT)
            {
                if (gBattleMons[defender].status2 & STATUS2_FORESIGHT)
                    break;
                i += 3;
                continue;
            }

            else if (TYPE_EFFECT_ATK_TYPE(i) == moveType)
            {
                // check type1
                if (TYPE_EFFECT_DEF_TYPE(i) == gBattleMons[defender].type1)
                    ModulateDmgByType2(TYPE_EFFECT_MULTIPLIER(i), move, &flags);
                // check type2
                if (TYPE_EFFECT_DEF_TYPE(i) == gBattleMons[defender].type2 &&
                    gBattleMons[defender].type1 != gBattleMons[defender].type2)
                    ModulateDmgByType2(TYPE_EFFECT_MULTIPLIER(i), move, &flags);
            }
            i += 3;
        }
    }

    if (gBattleMons[defender].ability == ABILITY_WONDER_GUARD && !(flags & MOVE_RESULT_MISSED)
        && AttacksThisTurn(attacker, move) == 2
        && (!(flags & MOVE_RESULT_SUPER_EFFECTIVE) || ((flags & (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE)) == (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE)))
        && gMovesInfo[move].power)
    {
        flags |= MOVE_RESULT_MISSED;
    }
    return flags;
}

u8 AI_TypeCalc(u16 move, u16 targetSpecies, u16 targetAbility)
{
    s32 i = 0;
    u8 flags = 0;
    u8 type1 = gSpeciesInfo[targetSpecies].types[0], type2 = gSpeciesInfo[targetSpecies].types[1];
    u8 moveType;

    if (move == MOVE_STRUGGLE)
        return 0;

    moveType = gMovesInfo[move].type;

    if (targetAbility == ABILITY_LEVITATE && moveType == TYPE_GROUND)
    {
        flags = MOVE_RESULT_MISSED | MOVE_RESULT_DOESNT_AFFECT_FOE;
    }
    else
    {
        while (TYPE_EFFECT_ATK_TYPE(i) != TYPE_ENDTABLE)
        {
            if (TYPE_EFFECT_ATK_TYPE(i) == TYPE_FORESIGHT)
            {
                i += 3;
                continue;
            }
            if (TYPE_EFFECT_ATK_TYPE(i) == moveType)
            {
                // check type1
                if (TYPE_EFFECT_DEF_TYPE(i) == type1)
                    ModulateDmgByType2(TYPE_EFFECT_MULTIPLIER(i), move, &flags);
                // check type2
                if (TYPE_EFFECT_DEF_TYPE(i) == type2 && type1 != type2)
                    ModulateDmgByType2(TYPE_EFFECT_MULTIPLIER(i), move, &flags);
            }
            i += 3;
        }
    }
    if (targetAbility == ABILITY_WONDER_GUARD
     && (!(flags & MOVE_RESULT_SUPER_EFFECTIVE) || ((flags & (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE)) == (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE)))
     && gMovesInfo[move].power)
        flags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
    return flags;
}

// Multiplies the damage by a random factor between 85% to 100% inclusive
static inline void ApplyRandomDmgMultiplier(void)
{
    u16 rand = Random();
    u16 randPercent = 100 - (rand % 16);

    if (gBattleMoveDamage != 0)
    {
        gBattleMoveDamage *= randPercent;
        gBattleMoveDamage /= 100;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
    }
}

static void Unused_ApplyRandomDmgMultiplier(void)
{
    ApplyRandomDmgMultiplier();
}

static void Cmd_adjustdamage(void)
{
    CMD_ARGS();

    u8 holdEffect, param;
    u32 moveType;
    u32 affectionScore = GetBattlerAffectionHearts(gBattlerTarget);
    u32 rand = Random() % 100;

    GET_MOVE_TYPE(gCurrentMove, moveType);

    if (DoesSubstituteBlockMove(gBattlerAttacker, gBattlerTarget, gCurrentMove))
        goto END;
    if (DoesDisguiseBlockMove(gBattlerTarget, gCurrentMove))
    {
        gBattleStruct->enduredDamage |= gBitTable[gBattlerTarget];
        goto END;
    }
    if (GetBattlerAbility(gBattlerTarget) == ABILITY_ICE_FACE && IS_MOVE_PHYSICAL(gCurrentMove) && gBattleMons[gBattlerTarget].species == SPECIES_EISCUE)
    {
        // Damage deals typeless 0 HP.
        gMoveResultFlags &= ~(MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE);
        gBattleMoveDamage = 0;
        RecordAbilityBattle(gBattlerTarget, ABILITY_ICE_FACE);
        gBattleResources->flags->flags[gBattlerTarget] |= RESOURCE_FLAG_ICE_FACE;
        // Form change will be done after attack animation in Cmd_resultmessage.
        goto END;
    }
    if (gBattleMons[gBattlerTarget].hp > gBattleMoveDamage)
        goto END;

    holdEffect = GetBattlerHoldEffect(gBattlerTarget, TRUE);
    param = GetBattlerHoldEffectParam(gBattlerTarget);

    gPotentialItemEffectBattler = gBattlerTarget;

    if (holdEffect == HOLD_EFFECT_FOCUS_BAND && rand < param)
    {
        RecordItemEffectBattle(gBattlerTarget, holdEffect);
        gSpecialStatuses[gBattlerTarget].focusBanded = TRUE;
    }
    else if (B_STURDY >= GEN_5 && GetBattlerAbility(gBattlerTarget) == ABILITY_STURDY && BATTLER_MAX_HP(gBattlerTarget))
    {
        RecordAbilityBattle(gBattlerTarget, ABILITY_STURDY);
        gSpecialStatuses[gBattlerTarget].sturdied = TRUE;
    }
    else if (holdEffect == HOLD_EFFECT_FOCUS_SASH && BATTLER_MAX_HP(gBattlerTarget))
    {
        RecordItemEffectBattle(gBattlerTarget, holdEffect);
        gSpecialStatuses[gBattlerTarget].focusSashed = TRUE;
    }
    else if (B_AFFECTION_MECHANICS == TRUE && GetBattlerSide(gBattlerTarget) == B_SIDE_PLAYER && affectionScore >= AFFECTION_THREE_HEARTS)
    {
        if ((affectionScore == AFFECTION_FIVE_HEARTS && rand < 20)
         || (affectionScore == AFFECTION_FOUR_HEARTS && rand < 15)
         || (affectionScore == AFFECTION_THREE_HEARTS && rand < 10))
            gSpecialStatuses[gBattlerTarget].affectionEndured = TRUE;
    }

    if (gMovesInfo[gCurrentMove].effect != EFFECT_FALSE_SWIPE
        && !gProtectStructs[gBattlerTarget].endured
        && !gSpecialStatuses[gBattlerTarget].focusBanded
        && !gSpecialStatuses[gBattlerTarget].focusSashed
        && (B_AFFECTION_MECHANICS == FALSE || !gSpecialStatuses[gBattlerTarget].affectionEndured)
        && !gSpecialStatuses[gBattlerTarget].sturdied)
        goto END;

    // Handle reducing the dmg to 1 hp.
    gBattleMoveDamage = gBattleMons[gBattlerTarget].hp - 1;
    gBattleStruct->enduredDamage |= gBitTable[gBattlerTarget];

    if (gProtectStructs[gBattlerTarget].endured)
    {
        gMoveResultFlags |= MOVE_RESULT_FOE_ENDURED;
    }
    else if (gSpecialStatuses[gBattlerTarget].focusBanded || gSpecialStatuses[gBattlerTarget].focusSashed)
    {
        gMoveResultFlags |= MOVE_RESULT_FOE_HUNG_ON;
        gLastUsedItem = gBattleMons[gBattlerTarget].item;
    }
    else if (gSpecialStatuses[gBattlerTarget].sturdied)
    {
        gMoveResultFlags |= MOVE_RESULT_STURDIED;
        gLastUsedAbility = ABILITY_STURDY;
    }
    else if (B_AFFECTION_MECHANICS == TRUE && gSpecialStatuses[gBattlerTarget].affectionEndured)
    {
        gMoveResultFlags |= MOVE_RESULT_FOE_ENDURED_AFFECTION;
    }

END:
    gBattlescriptCurrInstr = cmd->nextInstr;

    if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT) && gBattleMoveDamage >= 1)
        gSpecialStatuses[gBattlerAttacker].damagedMons |= gBitTable[gBattlerTarget];

    // Check gems and damage reducing berries.
    if (gSpecialStatuses[gBattlerTarget].berryReduced
        && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
        && gBattleMons[gBattlerTarget].item)
    {
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_BerryReduceDmg;
        gLastUsedItem = gBattleMons[gBattlerTarget].item;
    }
    if (gSpecialStatuses[gBattlerAttacker].gemBoost
        && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
        && gBattleMons[gBattlerAttacker].item
        && gMovesInfo[gCurrentMove].effect != EFFECT_PLEDGE
        && gCurrentMove != MOVE_STRUGGLE)
    {
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_GemActivates;
        gLastUsedItem = gBattleMons[gBattlerAttacker].item;
    }

    // B_WEATHER_STRONG_WINDS prints a string when it's about to reduce the power
    // of a move that is Super Effective against a Flying-type Pokémon.
    if (gBattleWeather & B_WEATHER_STRONG_WINDS)
    {
        if ((GetBattlerType(gBattlerTarget, 0) == TYPE_FLYING
         && GetTypeModifier(moveType, GetBattlerType(gBattlerTarget, 0)) >= UQ_4_12(2.0))
         || (GetBattlerType(gBattlerTarget, 1) == TYPE_FLYING
         && GetTypeModifier(moveType, GetBattlerType(gBattlerTarget, 1)) >= UQ_4_12(2.0))
         || (GetBattlerType(gBattlerTarget, 2) == TYPE_FLYING
         && GetTypeModifier(moveType, GetBattlerType(gBattlerTarget, 2)) >= UQ_4_12(2.0)))
        {
            gBattlerAbility = gBattlerTarget;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_AttackWeakenedByStrongWinds;
        }
    }
}

static void Cmd_multihitresultmessage(void)
{
    CMD_ARGS();

    if (gBattleControllerExecFlags)
        return;

    if (!(gMoveResultFlags & MOVE_RESULT_FAILED) && !(gMoveResultFlags & MOVE_RESULT_FOE_ENDURED))
    {
        if (gMoveResultFlags & MOVE_RESULT_STURDIED)
        {
            gMoveResultFlags &= ~(MOVE_RESULT_STURDIED | MOVE_RESULT_FOE_HUNG_ON);
            gSpecialStatuses[gBattlerTarget].sturdied = FALSE; // Delete this line to make Sturdy last for the duration of the whole move turn.
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_SturdiedMsg;
            return;
        }
        else if (gMoveResultFlags & MOVE_RESULT_FOE_HUNG_ON)
        {
            gLastUsedItem = gBattleMons[gBattlerTarget].item;
            gPotentialItemEffectBattler = gBattlerTarget;
            gMoveResultFlags &= ~(MOVE_RESULT_STURDIED | MOVE_RESULT_FOE_HUNG_ON);
            gSpecialStatuses[gBattlerTarget].focusBanded = FALSE; // Delete this line to make Focus Band last for the duration of the whole move turn.
            gSpecialStatuses[gBattlerTarget].focusSashed = FALSE; // Delete this line to make Focus Sash last for the duration of the whole move turn.
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_HangedOnMsg;
            return;
        }
    }
    gBattlescriptCurrInstr = cmd->nextInstr;

    // Print berry reducing message after result message.
    if (gSpecialStatuses[gBattlerTarget].berryReduced
        && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
    {
        gSpecialStatuses[gBattlerTarget].berryReduced = FALSE;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_PrintBerryReduceString;
    }
}

static void Cmd_attackanimation(void)
{
    CMD_ARGS();

    u16 moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);

    if (gBattleControllerExecFlags)
        return;

    if ((gHitMarker & (HITMARKER_NO_ANIMATIONS | HITMARKER_DISABLE_ANIMATION))
        && gCurrentMove != MOVE_TRANSFORM
        && gCurrentMove != MOVE_SUBSTITUTE
        && gCurrentMove != MOVE_ALLY_SWITCH
        // In a wild double battle gotta use the teleport animation if two wild pokemon are alive.
        && !(gCurrentMove == MOVE_TELEPORT && WILD_DOUBLE_BATTLE && GetBattlerSide(gBattlerAttacker) == B_SIDE_OPPONENT && IsBattlerAlive(BATTLE_PARTNER(gBattlerAttacker))))
    {
        BattleScriptPush(cmd->nextInstr);
        gBattlescriptCurrInstr = BattleScript_Pausex20;
        gBattleScripting.animTurn++;
        gBattleScripting.animTargetsHit++;
    }
    else
    {
        if (gSpecialStatuses[gBattlerAttacker].parentalBondState == PARENTAL_BOND_2ND_HIT) // No animation on second hit
        {
            gBattlescriptCurrInstr = cmd->nextInstr;
            return;
        }

        if ((moveTarget & MOVE_TARGET_BOTH
             || moveTarget & MOVE_TARGET_FOES_AND_ALLY
             || moveTarget & MOVE_TARGET_DEPENDS)
            && gBattleScripting.animTargetsHit)
        {
            gBattlescriptCurrInstr = cmd->nextInstr;
            return;
        }
        if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
        {
            u8 multihit;

            if (gBattleMons[gBattlerTarget].status2 & STATUS2_SUBSTITUTE)
                multihit = gMultiHitCounter;
            else if (gMultiHitCounter != 0 && gMultiHitCounter != 1)
            {
                if (gBattleMons[gBattlerTarget].hp <= gBattleMoveDamage)
                    multihit = 1;
                else
                    multihit = gMultiHitCounter;
            }
            else
                multihit = gMultiHitCounter;

            gActiveBattler = gBattlerAttacker;

            BtlController_EmitMoveAnimation(BUFFER_A, gCurrentMove, gBattleScripting.animTurn, gBattleMovePower, gBattleMoveDamage, gBattleMons[gBattlerAttacker].friendship, &gDisableStructs[gBattlerAttacker], multihit);
            gBattleScripting.animTurn++;
            gBattleScripting.animTargetsHit++;
            MarkBattlerForControllerExec(gBattlerAttacker);
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        else
        {
            BattleScriptPush(cmd->nextInstr);
            gBattlescriptCurrInstr = BattleScript_Pausex20;
        }
    }
}

static void Cmd_waitanimation(void)
{
    CMD_ARGS();

    if (gBattleControllerExecFlags == 0)
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_healthbarupdate(void)
{
    CMD_ARGS(u8 battler);

    if (gBattleControllerExecFlags)
        return;

    if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT) || (gHitMarker & HITMARKER_PASSIVE_DAMAGE))
    {
        u32 battler = GetBattlerForBattleScript(cmd->battler);
        gActiveBattler = battler;

        if (DoesSubstituteBlockMove(gBattlerAttacker, battler, gCurrentMove) && gDisableStructs[battler].substituteHP && !(gHitMarker & HITMARKER_IGNORE_SUBSTITUTE))
        {
            PrepareStringBattle(STRINGID_SUBSTITUTEDAMAGED, battler);
        }
        else if (!DoesDisguiseBlockMove(battler, gCurrentMove))
        {
            s16 healthValue = min(gBattleMoveDamage, 10000); // Max damage (10000) not present in R/S, ensures that huge damage values don't change sign

            BtlController_EmitHealthBarUpdate(BUFFER_A, healthValue);
            MarkBattlerForControllerExec(battler);

            if (GetBattlerSide(battler) == B_SIDE_PLAYER && gBattleMoveDamage > 0)
                gBattleResults.playerMonWasDamaged = TRUE;
        }
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_datahpupdate(void)
{
    CMD_ARGS(u8 battler);

    u32 battler;

    if (gBattleControllerExecFlags)
        return;

    if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT) || (gHitMarker & HITMARKER_PASSIVE_DAMAGE))
    {
        battler = GetBattlerForBattleScript(cmd->battler);
        gActiveBattler = battler;
        if (DoesSubstituteBlockMove(gBattlerAttacker, battler, gCurrentMove) && gDisableStructs[battler].substituteHP && !(gHitMarker & HITMARKER_IGNORE_SUBSTITUTE))
        {
            if (gDisableStructs[battler].substituteHP >= gBattleMoveDamage)
            {
                if (gSpecialStatuses[battler].shellBellDmg == 0)
                    gSpecialStatuses[battler].shellBellDmg = gBattleMoveDamage;
                gDisableStructs[battler].substituteHP -= gBattleMoveDamage;
                gHpDealt = gBattleMoveDamage;
            }
            else
            {
                if (gSpecialStatuses[battler].shellBellDmg == 0)
                    gSpecialStatuses[battler].shellBellDmg = gDisableStructs[battler].substituteHP;
                gHpDealt = gDisableStructs[battler].substituteHP;
                gDisableStructs[battler].substituteHP = 0;
            }
            // check substitute fading
            if (gDisableStructs[battler].substituteHP == 0)
            {
                gBattlescriptCurrInstr = cmd->nextInstr;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_SubstituteFade;
                return;
            }
        }
        else if (DoesDisguiseBlockMove(battler, gCurrentMove))
        {
            // TODO: Convert this to a proper FORM_CHANGE type.
            u32 side = GetBattlerSide(battler);
            gBattleScripting.battler = battler;
            if (gBattleStruct->changedSpecies[side][gBattlerPartyIndexes[battler]] == SPECIES_NONE)
                gBattleStruct->changedSpecies[side][gBattlerPartyIndexes[battler]] = gBattleMons[battler].species;
            // TODO: Totems
            // if (gBattleMons[battler].species == SPECIES_MIMIKYU_TOTEM_DISGUISED)
            //     gBattleMons[battler].species = SPECIES_MIMIKYU_TOTEM_BUSTED;
            // else
            //     gBattleMons[battler].species = SPECIES_MIMIKYU_BUSTED;
            gBattleMons[battler].species = SPECIES_MIMIKYU_BUSTED;
            if (B_DISGUISE_HP_LOSS >= GEN_8)
            {
                // TODO: Dynamax
                // gBattleMoveDamage = GetNonDynamaxMaxHP(battler) / 8;
                gBattleMoveDamage = gBattleMons[battler].maxHP / 8;
            }
            BattleScriptPush(cmd->nextInstr);
            gBattlescriptCurrInstr = BattleScript_TargetFormChange;
            return;
        }
        else
        {
            gHitMarker &= ~HITMARKER_IGNORE_SUBSTITUTE;
            if (gBattleMoveDamage < 0)
            {
                // Negative damage is HP gain
                gBattleMons[battler].hp += -gBattleMoveDamage;
                if (gBattleMons[battler].hp > gBattleMons[battler].maxHP)
                    gBattleMons[battler].hp = gBattleMons[battler].maxHP;
            }
            else
            {
                if (gHitMarker & HITMARKER_IGNORE_BIDE)
                {
                    gHitMarker &= ~HITMARKER_IGNORE_BIDE;
                }
                else
                {
                    gBideDmg[battler] += gBattleMoveDamage;
                    if (cmd->battler == BS_TARGET)
                        gBideTarget[battler] = gBattlerAttacker;
                    else
                        gBideTarget[battler] = gBattlerTarget;
                }

                // Deal damage to the battler
                if (gBattleMons[battler].hp > gBattleMoveDamage)
                {
                    gBattleMons[battler].hp -= gBattleMoveDamage;
                    gHpDealt = gBattleMoveDamage;
                }
                else
                {
                    gHpDealt = gBattleMons[battler].hp;
                    gBattleMons[battler].hp = 0;
                }

                // Record damage for Shell Bell
                if (gSpecialStatuses[battler].shellBellDmg == 0 && !(gHitMarker & HITMARKER_PASSIVE_DAMAGE))
                    gSpecialStatuses[battler].shellBellDmg = gHpDealt;

                // Note: While physicalDmg/specialDmg below are only distinguished between for Counter/Mirror Coat, they are
                //       used in combination as general damage trackers for other purposes. specialDmg is additionally used
                //       to help determine if a fire move should defrost the target.
                if (IS_MOVE_PHYSICAL(gCurrentMove) && !(gHitMarker & HITMARKER_PASSIVE_DAMAGE) && gMovesInfo[gCurrentMove].effect != EFFECT_PAIN_SPLIT)
                {
                    gProtectStructs[battler].physicalDmg = gHpDealt;
                    gSpecialStatuses[battler].physicalDmg = gHpDealt;
                    if (cmd->battler == BS_TARGET)
                    {
                        gProtectStructs[battler].physicalBattlerId = gBattlerAttacker;
                        gSpecialStatuses[battler].physicalBattlerId = gBattlerAttacker;
                    }
                    else
                    {
                        gProtectStructs[battler].physicalBattlerId = gBattlerTarget;
                        gSpecialStatuses[battler].physicalBattlerId = gBattlerTarget;
                    }
                }
                else if (!IS_MOVE_PHYSICAL(gCurrentMove) && !(gHitMarker & HITMARKER_PASSIVE_DAMAGE) && gMovesInfo[gCurrentMove].effect != EFFECT_PAIN_SPLIT)
                {
                    // Record special damage/attacker for Mirror Coat
                    gProtectStructs[battler].specialDmg = gHpDealt;
                    gSpecialStatuses[battler].specialDmg = gHpDealt;
                    if (cmd->battler == BS_TARGET)
                    {
                        gProtectStructs[battler].specialBattlerId = gBattlerAttacker;
                        gSpecialStatuses[battler].specialBattlerId = gBattlerAttacker;
                    }
                    else
                    {
                        gProtectStructs[battler].specialBattlerId = gBattlerTarget;
                        gSpecialStatuses[battler].specialBattlerId = gBattlerTarget;
                    }
                }
            }
            gHitMarker &= ~HITMARKER_PASSIVE_DAMAGE;

            // Send updated HP
            BtlController_EmitSetMonData(BUFFER_A, REQUEST_HP_BATTLE, 0, sizeof(gBattleMons[battler].hp), &gBattleMons[battler].hp);
            MarkBattlerForControllerExec(battler);
        }
    }
    else
    {
        // MOVE_RESULT_NO_EFFECT was set
        battler = GetBattlerForBattleScript(cmd->battler);
        if (gSpecialStatuses[battler].shellBellDmg == 0)
            gSpecialStatuses[battler].shellBellDmg = IGNORE_SHELL_BELL;
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_critmessage(void)
{
    CMD_ARGS();

    if (gBattleControllerExecFlags == 0)
    {
        if (gIsCriticalHit == TRUE && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
        {
            PrepareStringBattle(STRINGID_CRITICALHIT, gBattlerAttacker);

            // Signal for the trainer slide-in system.
            if (GetBattlerSide(gBattlerTarget) != B_SIDE_PLAYER && gBattleStruct->trainerSlideFirstCriticalHitMsgState != 2)
                gBattleStruct->trainerSlideFirstCriticalHitMsgState = 1;

            gBattleCommunication[MSG_DISPLAY] = 1;
        }
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_effectivenesssound(void)
{
    CMD_ARGS();

    if (gBattleControllerExecFlags)
        return;

    gActiveBattler = gBattlerTarget;
    if (!(gMoveResultFlags & MOVE_RESULT_MISSED))
    {
        switch (gMoveResultFlags & ~MOVE_RESULT_MISSED)
        {
        case MOVE_RESULT_SUPER_EFFECTIVE:
            BtlController_EmitPlaySE(BUFFER_A, SE_SUPER_EFFECTIVE);
            MarkBattlerForControllerExec(gBattlerTarget);
            break;
        case MOVE_RESULT_NOT_VERY_EFFECTIVE:
            BtlController_EmitPlaySE(BUFFER_A, SE_NOT_EFFECTIVE);
            MarkBattlerForControllerExec(gBattlerTarget);
            break;
        case MOVE_RESULT_DOESNT_AFFECT_FOE:
        case MOVE_RESULT_FAILED:
            // no sound
            break;
        case MOVE_RESULT_FOE_ENDURED:
        case MOVE_RESULT_ONE_HIT_KO:
        case MOVE_RESULT_FOE_HUNG_ON:
        case MOVE_RESULT_STURDIED:
        default:
            if (gMoveResultFlags & MOVE_RESULT_SUPER_EFFECTIVE)
            {
                BtlController_EmitPlaySE(BUFFER_A, SE_SUPER_EFFECTIVE);
                MarkBattlerForControllerExec(gBattlerTarget);
            }
            else if (gMoveResultFlags & MOVE_RESULT_NOT_VERY_EFFECTIVE)
            {
                BtlController_EmitPlaySE(BUFFER_A, SE_NOT_EFFECTIVE);
                MarkBattlerForControllerExec(gBattlerTarget);
            }
            else if (!(gMoveResultFlags & (MOVE_RESULT_DOESNT_AFFECT_FOE | MOVE_RESULT_FAILED)))
            {
                BtlController_EmitPlaySE(BUFFER_A, SE_EFFECTIVE);
                MarkBattlerForControllerExec(gBattlerTarget);
            }
            break;
        }
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_resultmessage(void)
{
    CMD_ARGS();

    u32 stringId = 0;

    if (gBattleControllerExecFlags)
        return;

    // TODO: Convert this to a proper FORM_CHANGE type.
    // Do Ice Face form change which was set up in Cmd_adjustdamage.
    if (gBattleResources->flags->flags[gBattlerTarget] & RESOURCE_FLAG_ICE_FACE)
    {
        gBattleResources->flags->flags[gBattlerTarget] &= ~(RESOURCE_FLAG_ICE_FACE);
        gBattleMons[gBattlerTarget].species = SPECIES_EISCUE_NOICE_FACE;
        gBattleScripting.battler = gBattlerTarget; // For STRINGID_PKMNTRANSFORMED
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_IceFaceNullsDamage;
        return;
    }

    if (gMoveResultFlags & MOVE_RESULT_MISSED && (!(gMoveResultFlags & MOVE_RESULT_DOESNT_AFFECT_FOE) || gBattleCommunication[MISS_TYPE] > B_MSG_AVOIDED_ATK))
    {
        // TODO: Ability Popup
        // if (gBattleCommunication[MISS_TYPE] > B_MSG_AVOIDED_ATK) // Wonder Guard or Levitate - show the ability pop-up
        //     CreateAbilityPopUp(gBattlerTarget, gBattleMons[gBattlerTarget].ability, (gBattleTypeFlags & BATTLE_TYPE_DOUBLE) != 0);
        stringId = gMissStringIds[gBattleCommunication[MISS_TYPE]];
        gBattleCommunication[MSG_DISPLAY] = 1;
    }
    else
    {
        gBattleCommunication[MSG_DISPLAY] = 1;
        switch (gMoveResultFlags & ~MOVE_RESULT_MISSED)
        {
        case MOVE_RESULT_SUPER_EFFECTIVE:
            if (!gMultiHitCounter)  // Don't print effectiveness on each hit in a multi hit attack
            {
                // Signal for the trainer slide-in system.
                if (GetBattlerSide(gBattlerTarget) != B_SIDE_PLAYER && gBattleStruct->trainerSlideFirstSuperEffectiveHitMsgState != 2)
                    gBattleStruct->trainerSlideFirstSuperEffectiveHitMsgState = 1;

                stringId = STRINGID_SUPEREFFECTIVE;
            }
            break;
        case MOVE_RESULT_NOT_VERY_EFFECTIVE:
            if (!gMultiHitCounter)
                stringId = STRINGID_NOTVERYEFFECTIVE;
            break;
        case MOVE_RESULT_ONE_HIT_KO:
            stringId = STRINGID_ONEHITKO;
            break;
        case MOVE_RESULT_FOE_ENDURED:
            stringId = STRINGID_PKMNENDUREDHIT;
            break;
        case MOVE_RESULT_FAILED:
            stringId = STRINGID_BUTITFAILED;
            break;
        case MOVE_RESULT_DOESNT_AFFECT_FOE:
            stringId = STRINGID_ITDOESNTAFFECT;
            break;
        case MOVE_RESULT_FOE_HUNG_ON:
            gLastUsedItem = gBattleMons[gBattlerTarget].item;
            gPotentialItemEffectBattler = gBattlerTarget;
            gMoveResultFlags &= ~(MOVE_RESULT_FOE_ENDURED | MOVE_RESULT_FOE_HUNG_ON);
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_HangedOnMsg;
            return;
        default:
            if (gMoveResultFlags & MOVE_RESULT_DOESNT_AFFECT_FOE)
            {
                stringId = STRINGID_ITDOESNTAFFECT;
            }
            else if (gMoveResultFlags & MOVE_RESULT_ONE_HIT_KO)
            {
                gMoveResultFlags &= ~MOVE_RESULT_ONE_HIT_KO;
                gMoveResultFlags &= ~MOVE_RESULT_SUPER_EFFECTIVE;
                gMoveResultFlags &= ~MOVE_RESULT_NOT_VERY_EFFECTIVE;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_OneHitKOMsg;
                return;
            }
            else if (gMoveResultFlags & MOVE_RESULT_STURDIED)
            {
                gMoveResultFlags &= ~(MOVE_RESULT_STURDIED | MOVE_RESULT_FOE_ENDURED | MOVE_RESULT_FOE_HUNG_ON);
                gSpecialStatuses[gBattlerTarget].sturdied = FALSE;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_SturdiedMsg;
                return;
            }
            else if (gMoveResultFlags & MOVE_RESULT_FOE_ENDURED)
            {
                gMoveResultFlags &= ~(MOVE_RESULT_FOE_ENDURED | MOVE_RESULT_FOE_HUNG_ON);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_EnduredMsg;
                return;
            }
            else if (gMoveResultFlags & MOVE_RESULT_FOE_HUNG_ON)
            {
                gLastUsedItem = gBattleMons[gBattlerTarget].item;
                gPotentialItemEffectBattler = gBattlerTarget;
                gMoveResultFlags &= ~(MOVE_RESULT_FOE_ENDURED | MOVE_RESULT_FOE_HUNG_ON);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_HangedOnMsg;
                return;
            }
            else if (gMoveResultFlags & MOVE_RESULT_FAILED)
            {
                stringId = STRINGID_BUTITFAILED;
            }
            else if (B_AFFECTION_MECHANICS == TRUE && (gMoveResultFlags & MOVE_RESULT_FOE_ENDURED_AFFECTION))
            {
                gSpecialStatuses[gBattlerTarget].affectionEndured = FALSE;
                gMoveResultFlags &= ~MOVE_RESULT_FOE_ENDURED_AFFECTION;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_AffectionBasedEndurance;
                return;
            }
            else
            {
                gBattleCommunication[MSG_DISPLAY] = 0;
            }
        }
    }

    if (stringId)
        PrepareStringBattle(stringId, gBattlerAttacker);

    gBattlescriptCurrInstr = cmd->nextInstr;

    // Print berry reducing message after result message.
    if (gSpecialStatuses[gBattlerTarget].berryReduced
        && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
    {
        gSpecialStatuses[gBattlerTarget].berryReduced = FALSE;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_PrintBerryReduceString;
    }
}

static void Cmd_printstring(void)
{
    CMD_ARGS(u16 id);

    if (gBattleControllerExecFlags == 0)
    {
        u16 id = cmd->id;

        gBattlescriptCurrInstr = cmd->nextInstr;
        PrepareStringBattle(id, gBattlerAttacker);
        gBattleCommunication[MSG_DISPLAY] = 1;
    }
}

static void Cmd_printselectionstring(void)
{
    CMD_ARGS(u16 id);

    gActiveBattler = gBattlerAttacker;
    BtlController_EmitPrintSelectionString(BUFFER_A, cmd->id);
    MarkBattlerForControllerExec(gBattlerAttacker);

    gBattlescriptCurrInstr = cmd->nextInstr;
    gBattleCommunication[MSG_DISPLAY] = 1;
}

static void Cmd_waitmessage(void)
{
    CMD_ARGS(u16 time);

    if (gBattleControllerExecFlags == 0)
    {
        if (!gBattleCommunication[MSG_DISPLAY])
        {
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        else
        {
            u16 toWait = cmd->time;
            if (++gPauseCounterBattle >= toWait)
            {
                gPauseCounterBattle = 0;
                gBattlescriptCurrInstr = cmd->nextInstr;
                gBattleCommunication[MSG_DISPLAY] = 0;
            }
        }
    }
}

static void Cmd_printfromtable(void)
{
    CMD_ARGS(const u16 *ptr);

    if (gBattleControllerExecFlags == 0)
    {
        const u16 *ptr = cmd->ptr;
        ptr += gBattleCommunication[MULTISTRING_CHOOSER];

        gBattlescriptCurrInstr = cmd->nextInstr;
        PrepareStringBattle(*ptr, gBattlerAttacker);
        gBattleCommunication[MSG_DISPLAY] = 1;
    }
}

static void Cmd_printselectionstringfromtable(void)
{
    CMD_ARGS(const u16 *ptr);

    if (gBattleControllerExecFlags == 0)
    {
        const u16 *ptr = cmd->ptr;
        ptr += gBattleCommunication[MULTISTRING_CHOOSER];

        gActiveBattler = gBattlerAttacker;
        BtlController_EmitPrintSelectionString(BUFFER_A, *ptr);
        MarkBattlerForControllerExec(gBattlerAttacker);

        gBattlescriptCurrInstr = cmd->nextInstr;
        gBattleCommunication[MSG_DISPLAY] = 1;
    }
}

u8 GetBattlerTurnOrderNum(u8 battler)
{
    s32 i;
    for (i = 0; i < gBattlersCount; i++)
    {
        if (gBattlerByTurnOrder[i] == battler)
            break;
    }
    return i;
}

static void CheckSetUnburden(u8 battler)
{
    if (GetBattlerAbility(battler) == ABILITY_UNBURDEN)
    {
        gBattleResources->flags->flags[battler] |= RESOURCE_FLAG_UNBURDEN;
        RecordAbilityBattle(battler, ABILITY_UNBURDEN);
    }
}

// battlerStealer steals the item of battlerItem
void StealTargetItem(u8 battlerStealer, u8 battlerItem)
{
    gLastUsedItem = gBattleMons[battlerItem].item;
    gBattleMons[battlerItem].item = 0;

    RecordItemEffectBattle(battlerItem, 0);
    RecordItemEffectBattle(battlerStealer, ItemId_GetHoldEffect(gLastUsedItem));
    gBattleMons[battlerStealer].item = gLastUsedItem;

    CheckSetUnburden(battlerItem);
    gBattleResources->flags->flags[battlerStealer] &= ~RESOURCE_FLAG_UNBURDEN;

    gActiveBattler = battlerStealer;
    BtlController_EmitSetMonData(BUFFER_A, REQUEST_HELDITEM_BATTLE, 0, sizeof(gLastUsedItem), &gLastUsedItem); // set attacker item
    MarkBattlerForControllerExec(battlerStealer);

    gActiveBattler = battlerItem;
    BtlController_EmitSetMonData(BUFFER_A, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[gBattlerTarget].item), &gBattleMons[battlerItem].item);  // remove target item
    MarkBattlerForControllerExec(battlerItem);

    gBattleStruct->choicedMove[battlerItem] = 0;

    TrySaveExchangedItem(battlerItem, gLastUsedItem);
}

#define INCREMENT_RESET_RETURN                  \
{                                               \
    gBattlescriptCurrInstr++;                   \
    gBattleScripting.moveEffect = 0;            \
    return;                                     \
}

#define RESET_RETURN                            \
{                                               \
    gBattleScripting.moveEffect = 0;            \
    return;                                     \
}

void SetMoveEffect(bool32 primary, bool32 certain)
{
    s32 i, affectsUser = 0;
    bool32 statusChanged = FALSE;
    bool32 mirrorArmorReflected = (GetBattlerAbility(gBattlerTarget) == ABILITY_MIRROR_ARMOR);
    u32 flags = 0;
    u16 battlerAbility;
    bool8 activateAfterFaint = FALSE;

    // NULL move effect
    if (gBattleScripting.moveEffect == 0)
        return;

    if (gSpecialStatuses[gBattlerAttacker].parentalBondState == PARENTAL_BOND_1ST_HIT
        && gBattleMons[gBattlerTarget].hp != 0
        && IsFinalStrikeEffect(gBattleScripting.moveEffect))
    {
        gBattlescriptCurrInstr++;
        return;
    }

    switch (gBattleScripting.moveEffect) // Set move effects which happen later on
    {
    case MOVE_EFFECT_KNOCK_OFF:
    case MOVE_EFFECT_SMACK_DOWN:
    case MOVE_EFFECT_REMOVE_STATUS:
    case MOVE_EFFECT_STOCKPILE_WORE_OFF:
        gBattleStruct->moveEffect2 = gBattleScripting.moveEffect;
        gBattlescriptCurrInstr++;
        return;
    case MOVE_EFFECT_STEALTH_ROCK:
    case MOVE_EFFECT_SPIKES:
    case MOVE_EFFECT_PAYDAY:
    case MOVE_EFFECT_STEAL_ITEM:
    case MOVE_EFFECT_BUG_BITE:
        activateAfterFaint = TRUE;
        break;
    }

    if (gBattleScripting.moveEffect & MOVE_EFFECT_AFFECTS_USER)
    {
        gEffectBattler = gBattlerAttacker; // battler that effects get applied on
        gBattleScripting.moveEffect &= ~MOVE_EFFECT_AFFECTS_USER;
        affectsUser = MOVE_EFFECT_AFFECTS_USER;
        gBattleScripting.battler = gBattlerTarget; // theoretically the attacker
    }
    else
    {
        gEffectBattler = gBattlerTarget;
        gBattleScripting.battler = gBattlerAttacker;
    }

    battlerAbility = GetBattlerAbility(gEffectBattler);

     // Just in case this flag is still set
    gBattleScripting.moveEffect &= ~MOVE_EFFECT_CERTAIN;

    if (!primary && affectsUser != MOVE_EFFECT_AFFECTS_USER
      && !(gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
      && (battlerAbility == ABILITY_SHIELD_DUST || GetBattlerHoldEffect(gEffectBattler, TRUE) == HOLD_EFFECT_COVERT_CLOAK))
    {
        if (battlerAbility == ABILITY_SHIELD_DUST)
            RecordAbilityBattle(gEffectBattler, battlerAbility);
        else
            RecordItemEffectBattle(gEffectBattler, HOLD_EFFECT_COVERT_CLOAK);
        INCREMENT_RESET_RETURN
    }

    if (gSideStatuses[GetBattlerSide(gEffectBattler)] & SIDE_STATUS_SAFEGUARD && !(gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
        && !primary && gBattleScripting.moveEffect <= MOVE_EFFECT_CONFUSION)
        INCREMENT_RESET_RETURN

    if (!(gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
      && TestIfSheerForceAffected(gBattlerAttacker, gCurrentMove)
      && !primary
      && gBattleScripting.moveEffect != MOVE_EFFECT_CHARGING)
        INCREMENT_RESET_RETURN

    if (gBattleMons[gEffectBattler].hp == 0 && !activateAfterFaint)
        INCREMENT_RESET_RETURN

    if (DoesSubstituteBlockMove(gBattlerAttacker, gEffectBattler, gCurrentMove) && affectsUser != MOVE_EFFECT_AFFECTS_USER)
        INCREMENT_RESET_RETURN

    if (gBattleScripting.moveEffect <= PRIMARY_STATUS_MOVE_EFFECT) // status change
    {
        const u8 *cancelMultiTurnMovesResult = NULL;
        switch (sStatusFlagsForMoveEffects[gBattleScripting.moveEffect])
        {
        case STATUS1_SLEEP:
            // check active uproar
            if (battlerAbility != ABILITY_SOUNDPROOF || B_UPROAR_IGNORE_SOUNDPROOF >= GEN_5)
            {
                for (i = 0; i < gBattlersCount && !(gBattleMons[i].status2 & STATUS2_UPROAR); i++)
                    ;
            }
            else
            {
                i = gBattlersCount;
                gActiveBattler = gBattlersCount;
            }

            if (i != gBattlersCount)
                break;
            if (!CanSleep(gEffectBattler))
                break;

            cancelMultiTurnMovesResult = CancelMultiTurnMoves(gEffectBattler);
            if (cancelMultiTurnMovesResult)
                gBattlescriptCurrInstr = cancelMultiTurnMovesResult;
            statusChanged = TRUE;
            break;
        case STATUS1_POISON:
            if ((battlerAbility == ABILITY_IMMUNITY || battlerAbility == ABILITY_PASTEL_VEIL)
                && (primary == TRUE || certain == TRUE))
            {
                gLastUsedAbility = battlerAbility;
                RecordAbilityBattle(gEffectBattler, battlerAbility);

                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_PSNPrevention;

                if (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABILITY_PREVENTS_ABILITY_STATUS;
                    gHitMarker &= ~HITMARKER_STATUS_ABILITY_EFFECT;
                }
                else
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABILITY_PREVENTS_MOVE_STATUS;
                }
                RESET_RETURN
            }
            if (!CanPoisonType(gBattleScripting.battler, gEffectBattler)
                && (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
                && (primary == TRUE || certain == TRUE))
            {
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_PSNPrevention;

                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STATUS_HAD_NO_EFFECT;
                RESET_RETURN
            }
            if (!CanBePoisoned(gBattleScripting.battler, gEffectBattler))
                break;

            statusChanged = TRUE;
            break;
        case STATUS1_BURN:
            if ((battlerAbility == ABILITY_WATER_VEIL || battlerAbility == ABILITY_WATER_BUBBLE)
              && (primary == TRUE || certain == TRUE))
            {
                gLastUsedAbility = battlerAbility;
                RecordAbilityBattle(gEffectBattler, battlerAbility);

                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_BRNPrevention;
                if (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABILITY_PREVENTS_ABILITY_STATUS;
                    gHitMarker &= ~HITMARKER_STATUS_ABILITY_EFFECT;
                }
                else
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABILITY_PREVENTS_MOVE_STATUS;
                }
                RESET_RETURN
            }
            if (IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_FIRE)
                && (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
                && (primary == TRUE || certain == TRUE))
            {
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_BRNPrevention;

                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STATUS_HAD_NO_EFFECT;
                RESET_RETURN
            }

            if (B_STATUS_TYPE_IMMUNITY == GEN_1)
            {
                u8 moveType = 0;
                GET_MOVE_TYPE(gCurrentMove, moveType);
                if (primary == FALSE && certain == FALSE && IS_BATTLER_OF_TYPE(gEffectBattler, moveType))
                    break;
            }

            if (!CanBeBurned(gEffectBattler))
                break;

            statusChanged = TRUE;
            break;
        case STATUS1_FREEZE:
            if (B_STATUS_TYPE_IMMUNITY == GEN_1)
            {
                u8 moveType = 0;
                GET_MOVE_TYPE(gCurrentMove, moveType);
                if (primary == FALSE && certain == FALSE && IS_BATTLER_OF_TYPE(gEffectBattler, moveType))
                    break;
            }
            if (!CanBeFrozen(gEffectBattler))
                break;

            cancelMultiTurnMovesResult = CancelMultiTurnMoves(gEffectBattler);
            if (cancelMultiTurnMovesResult)
                gBattlescriptCurrInstr = cancelMultiTurnMovesResult;
            statusChanged = TRUE;
            break;
        case STATUS1_PARALYSIS:
            if (battlerAbility == ABILITY_LIMBER)
            {
                if (primary == TRUE || certain == TRUE)
                {
                    gLastUsedAbility = ABILITY_LIMBER;
                    RecordAbilityBattle(gEffectBattler, ABILITY_LIMBER);

                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_PRLZPrevention;

                    if (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
                    {
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABILITY_PREVENTS_ABILITY_STATUS;
                        gHitMarker &= ~HITMARKER_STATUS_ABILITY_EFFECT;
                    }
                    else
                    {
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABILITY_PREVENTS_MOVE_STATUS;
                    }
                    RESET_RETURN
                }
                else
                    break;
            }
            if (B_STATUS_TYPE_IMMUNITY == GEN_1)
            {
                u8 moveType = 0;
                GET_MOVE_TYPE(gCurrentMove, moveType);
                if (primary == FALSE && certain == FALSE && IS_BATTLER_OF_TYPE(gEffectBattler, moveType))
                    break;
            }
            if (!CanParalyzeType(gBattleScripting.battler, gEffectBattler)
                && (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
                && (primary == TRUE || certain == TRUE))
            {
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_PRLZPrevention;

                gBattleCommunication[MULTISTRING_CHOOSER] = 2;
                RESET_RETURN
            }
            if (!CanParalyzeType(gBattleScripting.battler, gEffectBattler))
                break;
            if (!CanBeParalyzed(gEffectBattler))
                break;

            statusChanged = TRUE;
            break;
        case STATUS1_TOXIC_POISON:
            if ((battlerAbility == ABILITY_IMMUNITY || battlerAbility == ABILITY_PASTEL_VEIL)
             && (primary == TRUE || certain == TRUE))
            {
                gLastUsedAbility = battlerAbility;
                RecordAbilityBattle(gEffectBattler, battlerAbility);

                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_PSNPrevention;

                if (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABILITY_PREVENTS_ABILITY_STATUS;
                    gHitMarker &= ~HITMARKER_STATUS_ABILITY_EFFECT;
                }
                else
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABILITY_PREVENTS_MOVE_STATUS;
                }
                RESET_RETURN
            }
            if (!CanPoisonType(gBattleScripting.battler, gEffectBattler)
                && (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
                && (primary == TRUE || certain == TRUE))
            {
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_PSNPrevention;

                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STATUS_HAD_NO_EFFECT;
                RESET_RETURN
            }
            if (gBattleMons[gEffectBattler].status1)
                break;
            if (CanBePoisoned(gBattleScripting.battler, gEffectBattler))
            {
                // It's redundant, because at this point we know the status1 value is 0.
                gBattleMons[gEffectBattler].status1 &= ~STATUS1_TOXIC_POISON;
                gBattleMons[gEffectBattler].status1 &= ~STATUS1_POISON;
                statusChanged = TRUE;
                break;
            }
            else
            {
                gMoveResultFlags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
            }
            break;
        case STATUS1_FROSTBITE:
            if (B_STATUS_TYPE_IMMUNITY == GEN_1)
            {
                u8 moveType = 0;
                GET_MOVE_TYPE(gCurrentMove, moveType);
                if (primary == FALSE && certain == FALSE && IS_BATTLER_OF_TYPE(gEffectBattler, moveType))
                    break;
            }
            if (!CanGetFrostbite(gEffectBattler))
                break;

            statusChanged = TRUE;
            break;
        }
        if (statusChanged == TRUE)
        {
            BattleScriptPush(gBattlescriptCurrInstr + 1);

            if (sStatusFlagsForMoveEffects[gBattleScripting.moveEffect] == STATUS1_SLEEP)
            {
                if (B_SLEEP_TURNS >= GEN_5)
                    gBattleMons[gEffectBattler].status1 |= STATUS1_SLEEP_TURN(1 + RandomUniform(RNG_SLEEP_TURNS, 1, 3));
                else
                    gBattleMons[gEffectBattler].status1 |= STATUS1_SLEEP_TURN(1 + RandomUniform(RNG_SLEEP_TURNS, 2, 5));
            }
            else
            {
                gBattleMons[gEffectBattler].status1 |= sStatusFlagsForMoveEffects[gBattleScripting.moveEffect];
            }

            gBattlescriptCurrInstr = sMoveEffectBS_Ptrs[gBattleScripting.moveEffect];

            gActiveBattler = gEffectBattler;
            BtlController_EmitSetMonData(BUFFER_A, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[gEffectBattler].status1), &gBattleMons[gEffectBattler].status1);
            MarkBattlerForControllerExec(gEffectBattler);

            if (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STATUSED_BY_ABILITY;
                gHitMarker &= ~HITMARKER_STATUS_ABILITY_EFFECT;
            }
            else
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STATUSED;
            }

            // for synchronize

            if (gBattleScripting.moveEffect == MOVE_EFFECT_POISON
             || gBattleScripting.moveEffect == MOVE_EFFECT_TOXIC
             || gBattleScripting.moveEffect == MOVE_EFFECT_PARALYSIS
             || gBattleScripting.moveEffect == MOVE_EFFECT_BURN)
             {
                gBattleStruct->synchronizeMoveEffect = gBattleScripting.moveEffect;
                gHitMarker |= HITMARKER_SYNCHRONISE_EFFECT;
             }
            return;
        }
        else if (statusChanged == FALSE)
        {
            gBattleScripting.moveEffect = 0;
            gBattlescriptCurrInstr++;
            return;
        }
        return;
    }
    else
    {
        if (gBattleMons[gEffectBattler].status2 & sStatusFlagsForMoveEffects[gBattleScripting.moveEffect])
        {
            gBattlescriptCurrInstr++;
        }
        else
        {
            u8 side;
            switch (gBattleScripting.moveEffect)
            {
            case MOVE_EFFECT_CONFUSION:
                if (!CanBeConfused(gEffectBattler))
                {
                    gBattlescriptCurrInstr++;
                }
                else
                {
                    gBattleMons[gEffectBattler].status2 |= STATUS2_CONFUSION_TURN(((Random()) % 4) + 2); // 2-5 turns

                    // If the confusion is activating due to being released from Sky Drop, go to "confused due to fatigue" script.
                    // Otherwise, do normal confusion script.
                    if(gCurrentMove == MOVE_SKY_DROP)
                    {
                        gBattleMons[gEffectBattler].status2 &= ~(STATUS2_LOCK_CONFUSE);
                        gBattlerAttacker = gEffectBattler;
                        gBattlescriptCurrInstr = BattleScript_ThrashConfuses;
                    }
                    else
                    {
                        BattleScriptPush(gBattlescriptCurrInstr + 1);
                        gBattlescriptCurrInstr = sMoveEffectBS_Ptrs[gBattleScripting.moveEffect];
                    }
                }
                break;
            case MOVE_EFFECT_FLINCH:
                if (battlerAbility == ABILITY_INNER_FOCUS)
                {
                    // Inner Focus ALWAYS prevents flinching but only activates
                    // on a move that's supposed to flinch, like Fake Out
                    if (primary == TRUE || certain == TRUE)
                    {
                        gLastUsedAbility = ABILITY_INNER_FOCUS;
                        gBattlerAbility = gEffectBattler;
                        RecordAbilityBattle(gEffectBattler, ABILITY_INNER_FOCUS);
                        gBattlescriptCurrInstr = BattleScript_FlinchPrevention;
                    }
                    else
                    {
                        gBattlescriptCurrInstr++;
                    }
                }
                else if (GetBattlerTurnOrderNum(gEffectBattler) > gCurrentTurnActionNumber
                        /* && !IsDynamaxed(gEffectBattler) */) // TODO: Dynamax
                {
                    gBattleMons[gEffectBattler].status2 |= sStatusFlagsForMoveEffects[gBattleScripting.moveEffect];
                    gBattlescriptCurrInstr++;
                }
                break;
            case MOVE_EFFECT_UPROAR:
                if (!(gBattleMons[gEffectBattler].status2 & STATUS2_UPROAR))
                {
                    gBattleMons[gEffectBattler].status2 |= STATUS2_MULTIPLETURNS;
                    gLockedMoves[gEffectBattler] = gCurrentMove;
                    gBattleMons[gEffectBattler].status2 |= STATUS2_UPROAR_TURN(B_UPROAR_TURNS >= GEN_5 ? 3 : (Random() & 3) + 2);

                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = sMoveEffectBS_Ptrs[gBattleScripting.moveEffect];
                }
                else
                {
                    gBattlescriptCurrInstr++;
                }
                break;
            case MOVE_EFFECT_PAYDAY:
                // Don't scatter coins on the second hit of Parental Bond
                if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER && gSpecialStatuses[gBattlerAttacker].parentalBondState!= PARENTAL_BOND_2ND_HIT)
                {
                    u16 payday = gPaydayMoney;
                    u16 moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);
                    gPaydayMoney += (gBattleMons[gBattlerAttacker].level * 5);
                    if (payday > gPaydayMoney)
                        gPaydayMoney = 0xFFFF;

                    // For a move that hits multiple targets (i.e. Make it Rain)
                    // we only want to print the message on the final hit
                    if (!((moveTarget == MOVE_TARGET_BOTH || moveTarget == MOVE_TARGET_FOES_AND_ALLY)
                        && GetNextTarget(moveTarget, TRUE) != MAX_BATTLERS_COUNT))
                    {
                        BattleScriptPush(gBattlescriptCurrInstr + 1);
                        gBattlescriptCurrInstr = BattleScript_MoveEffectPayDay;
                    }
                    else
                        gBattlescriptCurrInstr++;
                }
                else
                {
                    gBattlescriptCurrInstr++;
                }
                break;
            case MOVE_EFFECT_HAPPY_HOUR:
                if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER && !gBattleStruct->moneyMultiplierMove)
                {
                    gBattleStruct->moneyMultiplier *= 2;
                    gBattleStruct->moneyMultiplierMove = 1;
                }
                gBattlescriptCurrInstr++;
                break;
            case MOVE_EFFECT_TRI_ATTACK:
                if (gBattleMons[gEffectBattler].status1)
                {
                    gBattlescriptCurrInstr++;
                }
                else
                {
                    static const u8 sTriAttackEffects[] =
                    {
                        MOVE_EFFECT_BURN,
                        MOVE_EFFECT_FREEZE_OR_FROSTBITE,
                        MOVE_EFFECT_PARALYSIS
                    };
                    gBattleScripting.moveEffect = RandomElement(RNG_TRI_ATTACK, sTriAttackEffects);
                    SetMoveEffect(primary, certain);
                }
                break;
            case MOVE_EFFECT_CHARGING:
                gBattleMons[gEffectBattler].status2 |= STATUS2_MULTIPLETURNS;
                gLockedMoves[gEffectBattler] = gCurrentMove;
                gProtectStructs[gEffectBattler].chargingTurn = TRUE;
                gBattlescriptCurrInstr++;
                break;
            case MOVE_EFFECT_WRAP:
                if (gBattleMons[gEffectBattler].status2 & STATUS2_WRAPPED)
                {
                    gBattlescriptCurrInstr++;
                }
                else
                {
                    gBattleMons[gEffectBattler].status2 |= STATUS2_WRAPPED;
                    if (GetBattlerHoldEffect(gBattlerAttacker, TRUE) == HOLD_EFFECT_GRIP_CLAW)
                        gDisableStructs[gEffectBattler].wrapTurns = B_BINDING_TURNS >= GEN_5 ? 7 : 5;
                    else
                        gDisableStructs[gEffectBattler].wrapTurns = B_BINDING_TURNS >= GEN_5 ? (Random() % 2) + 4 : (Random() % 4) + 2;

                    gBattleStruct->wrappedMove[gEffectBattler] = gCurrentMove;
                    gBattleStruct->wrappedBy[gEffectBattler] = gBattlerAttacker;

                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = sMoveEffectBS_Ptrs[gBattleScripting.moveEffect];

                    for (gBattleCommunication[MULTISTRING_CHOOSER] = 0; gBattleCommunication[MULTISTRING_CHOOSER] < NUM_TRAPPING_MOVES; gBattleCommunication[MULTISTRING_CHOOSER]++)
                    {
                        if (sTrappingMoves[gBattleCommunication[MULTISTRING_CHOOSER]] == gCurrentMove)
                            break;
                    }
                }
                break;
            case MOVE_EFFECT_ATK_PLUS_1:
            case MOVE_EFFECT_DEF_PLUS_1:
            case MOVE_EFFECT_SPD_PLUS_1:
            case MOVE_EFFECT_SP_ATK_PLUS_1:
            case MOVE_EFFECT_SP_DEF_PLUS_1:
            case MOVE_EFFECT_ACC_PLUS_1:
            case MOVE_EFFECT_EVS_PLUS_1:
                if (NoAliveMonsForEitherParty()
                  || ChangeStatBuffs(SET_STAT_BUFF_VALUE(1),
                                    gBattleScripting.moveEffect - MOVE_EFFECT_ATK_PLUS_1 + 1,
                                    affectsUser | STAT_CHANGE_UPDATE_MOVE_EFFECT, 0))
                {
                    gBattlescriptCurrInstr++;
                }
                else
                {
                    gBattleScripting.animArg1 = gBattleScripting.moveEffect & ~(MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN);
                    gBattleScripting.animArg2 = 0;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_StatUp;
                }
                break;
            case MOVE_EFFECT_ATK_MINUS_1:
            case MOVE_EFFECT_DEF_MINUS_1:
            case MOVE_EFFECT_SPD_MINUS_1:
            case MOVE_EFFECT_SP_ATK_MINUS_1:
            case MOVE_EFFECT_SP_DEF_MINUS_1:
            case MOVE_EFFECT_ACC_MINUS_1:
            case MOVE_EFFECT_EVS_MINUS_1:
                flags = affectsUser;
                if (mirrorArmorReflected)
                    flags |= (STAT_CHANGE_ALLOW_PTR * !affectsUser);
                else
                    flags |= STAT_CHANGE_UPDATE_MOVE_EFFECT;

                if (ChangeStatBuffs(SET_STAT_BUFF_VALUE(1) | STAT_BUFF_NEGATIVE,
                                    gBattleScripting.moveEffect - MOVE_EFFECT_ATK_MINUS_1 + 1,
                                    flags, gBattlescriptCurrInstr + 1))
                {
                    if (!mirrorArmorReflected)
                        gBattlescriptCurrInstr++;
                }
                else
                {
                    gBattleScripting.animArg1 = gBattleScripting.moveEffect & ~(MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN);
                    gBattleScripting.animArg2 = 0;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_StatDown;
                }
                break;
            case MOVE_EFFECT_ATK_PLUS_2:
            case MOVE_EFFECT_DEF_PLUS_2:
            case MOVE_EFFECT_SPD_PLUS_2:
            case MOVE_EFFECT_SP_ATK_PLUS_2:
            case MOVE_EFFECT_SP_DEF_PLUS_2:
            case MOVE_EFFECT_ACC_PLUS_2:
            case MOVE_EFFECT_EVS_PLUS_2:
                if (NoAliveMonsForEitherParty()
                  || ChangeStatBuffs(SET_STAT_BUFF_VALUE(2),
                                    gBattleScripting.moveEffect - MOVE_EFFECT_ATK_PLUS_2 + 1,
                                    affectsUser | STAT_CHANGE_UPDATE_MOVE_EFFECT, 0))
                {
                    gBattlescriptCurrInstr++;
                }
                else
                {
                    gBattleScripting.animArg1 = gBattleScripting.moveEffect & ~(MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN);
                    gBattleScripting.animArg2 = 0;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_StatUp;
                }
                break;
            case MOVE_EFFECT_ATK_MINUS_2:
            case MOVE_EFFECT_DEF_MINUS_2:
            case MOVE_EFFECT_SPD_MINUS_2:
            case MOVE_EFFECT_SP_ATK_MINUS_2:
            case MOVE_EFFECT_SP_DEF_MINUS_2:
            case MOVE_EFFECT_ACC_MINUS_2:
            case MOVE_EFFECT_EVS_MINUS_2:
                flags = affectsUser;
                if (mirrorArmorReflected && !affectsUser)
                    flags |= STAT_CHANGE_ALLOW_PTR;
                if (ChangeStatBuffs(SET_STAT_BUFF_VALUE(2) | STAT_BUFF_NEGATIVE,
                                    gBattleScripting.moveEffect - MOVE_EFFECT_ATK_MINUS_2 + 1,
                                    flags | STAT_CHANGE_UPDATE_MOVE_EFFECT, gBattlescriptCurrInstr + 1))
                {
                    if (!mirrorArmorReflected)
                        gBattlescriptCurrInstr++;
                }
                else
                {
                    gBattleScripting.animArg1 = gBattleScripting.moveEffect & ~(MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN);
                    gBattleScripting.animArg2 = 0;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_StatDown;
                }
                break;
            case MOVE_EFFECT_RECHARGE:
                gBattleMons[gEffectBattler].status2 |= STATUS2_RECHARGE;
                gDisableStructs[gEffectBattler].rechargeTimer = 2;
                gLockedMoves[gEffectBattler] = gCurrentMove;
                gBattlescriptCurrInstr++;
                break;
            case MOVE_EFFECT_RAGE:
                gBattleMons[gBattlerAttacker].status2 |= STATUS2_RAGE;
                gBattlescriptCurrInstr++;
                break;
            case MOVE_EFFECT_STEAL_ITEM:
                {
                    if (!CanStealItem(gBattlerAttacker, gBattlerTarget, gBattleMons[gBattlerTarget].item))
                    {
                        gBattlescriptCurrInstr++;
                        break;
                    }

                    side = GetBattlerSide(gBattlerAttacker);
                    if (GetBattlerSide(gBattlerAttacker) == B_SIDE_OPPONENT
                        && !(gBattleTypeFlags &
                            (BATTLE_TYPE_EREADER_TRAINER
                            | BATTLE_TYPE_BATTLE_TOWER
                            | BATTLE_TYPE_LINK))
                        && gTrainerBattleOpponent_A != TRAINER_SECRET_BASE)
                    {
                        gBattlescriptCurrInstr++;
                    }
                    else if (!(gBattleTypeFlags &
                            (BATTLE_TYPE_EREADER_TRAINER
                            | BATTLE_TYPE_BATTLE_TOWER
                            | BATTLE_TYPE_LINK))
                        && gTrainerBattleOpponent_A != TRAINER_SECRET_BASE
                        && (gWishFutureKnock.knockedOffMons[side] & gBitTable[gBattlerPartyIndexes[gBattlerAttacker]]))
                    {
                        gBattlescriptCurrInstr++;
                    }
                    else if (gBattleMons[gBattlerTarget].item
                        && GetBattlerAbility(gBattlerTarget) == ABILITY_STICKY_HOLD)
                    {
                        BattleScriptPushCursor();
                        gBattlescriptCurrInstr = BattleScript_NoItemSteal;

                        gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
                        RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
                    }
                    else if (gBattleMons[gBattlerAttacker].item != ITEM_NONE
                        || gBattleMons[gBattlerTarget].item == ITEM_ENIGMA_BERRY_E_READER
                        || gBattleMons[gBattlerTarget].item == ITEM_NONE)
                    {
                        gBattlescriptCurrInstr++;
                    }
                    else
                    {
                        StealTargetItem(gBattlerAttacker, gBattlerTarget);  // Attacker steals target item
                        gBattleMons[gBattlerAttacker].item = ITEM_NONE; // Item assigned later on with thief (see MOVEEND_CHANGED_ITEMS)
                        gBattleStruct->changedItems[gBattlerAttacker] = gLastUsedItem; // Stolen item to be assigned later
                        BattleScriptPush(gBattlescriptCurrInstr + 1);
                        gBattlescriptCurrInstr = BattleScript_ItemSteal;
                    }
                }
                break;
            case MOVE_EFFECT_PREVENT_ESCAPE:
                gBattleMons[gBattlerTarget].status2 |= STATUS2_ESCAPE_PREVENTION;
                gDisableStructs[gBattlerTarget].battlerPreventingEscape = gBattlerAttacker;
                gBattlescriptCurrInstr++;
                break;
            case MOVE_EFFECT_NIGHTMARE:
                gBattleMons[gBattlerTarget].status2 |= STATUS2_NIGHTMARE;
                gBattlescriptCurrInstr++;
                break;
            case MOVE_EFFECT_ALL_STATS_UP:
                if (!NoAliveMonsForEitherParty())
                {
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_AllStatsUp;
                }
                break;
            case MOVE_EFFECT_RAPID_SPIN:
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_RapidSpinAway;
                break;
            case MOVE_EFFECT_ATK_DEF_DOWN: // SuperPower
                if (!NoAliveMonsForEitherParty())
                {
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_AtkDefDown;
                }
                break;
            case MOVE_EFFECT_DEF_SPDEF_DOWN: // Close Combat
                if (!NoAliveMonsForEitherParty())
                {
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_DefSpDefDown;
                }
                break;
            case MOVE_EFFECT_RECOIL_HP_25: // Struggle
                gBattleMoveDamage = (gBattleMons[gEffectBattler].maxHP) / 4;
                if (gBattleMoveDamage == 0)
                    gBattleMoveDamage = 1;
                if (GetBattlerAbility(gEffectBattler) == ABILITY_PARENTAL_BOND)
                    gBattleMoveDamage *= 2;

                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_MoveEffectRecoil;
                break;
            case MOVE_EFFECT_THRASH:
                // Petal Dance doesn't lock mons that copy the move with Dancer
                if (gSpecialStatuses[gEffectBattler].dancerUsedMove)
                {
                    gBattlescriptCurrInstr++;
                }
                else
                {
                    gBattleMons[gEffectBattler].status2 |= STATUS2_MULTIPLETURNS;
                    gLockedMoves[gEffectBattler] = gCurrentMove;
                    gBattleMons[gEffectBattler].status2 |= STATUS2_LOCK_CONFUSE_TURN(RandomUniform(RNG_RAMPAGE_TURNS, 2, 3));
                }
                break;
            case MOVE_EFFECT_SP_ATK_TWO_DOWN: // Overheat
                if (!NoAliveMonsForEitherParty())
                {
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_SAtkDown2;
                }
                break;
            case MOVE_EFFECT_CLEAR_SMOG:
                for (i = 0; i < NUM_BATTLE_STATS; i++)
                {
                    if (gBattleMons[gEffectBattler].statStages[i] != DEFAULT_STAT_STAGE)
                        break;
                }
                if ((gSpecialStatuses[gEffectBattler].physicalDmg || gSpecialStatuses[gEffectBattler].specialDmg) && i != NUM_BATTLE_STATS)
                {
                    for (i = 0; i < NUM_BATTLE_STATS; i++)
                        gBattleMons[gEffectBattler].statStages[i] = DEFAULT_STAT_STAGE;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_MoveEffectClearSmog;
                }
                break;
            case MOVE_EFFECT_FLAME_BURST:
                if (IsBattlerAlive(BATTLE_PARTNER(gBattlerTarget))
                        && !(gStatuses3[BATTLE_PARTNER(gBattlerTarget)] & STATUS3_SEMI_INVULNERABLE)
                        && GetBattlerAbility(BATTLE_PARTNER(gBattlerTarget)) != ABILITY_MAGIC_GUARD)
                {
                    gBattleScripting.savedBattler = BATTLE_PARTNER(gBattlerTarget);
                    gBattleMoveDamage = gBattleMons[BATTLE_PARTNER(gBattlerTarget)].hp / 16;
                    if (gBattleMoveDamage == 0)
                        gBattleMoveDamage = 1;
                    gBattlescriptCurrInstr = BattleScript_MoveEffectFlameBurst;
                }
                break;
            case MOVE_EFFECT_FEINT:
                if (IS_BATTLER_PROTECTED(gBattlerTarget))
                {
                    gProtectStructs[gBattlerTarget].protected = FALSE;
                    gSideStatuses[GetBattlerSide(gBattlerTarget)] &= ~SIDE_STATUS_WIDE_GUARD;
                    gSideStatuses[GetBattlerSide(gBattlerTarget)] &= ~SIDE_STATUS_QUICK_GUARD;
                    gSideStatuses[GetBattlerSide(gBattlerTarget)] &= ~SIDE_STATUS_CRAFTY_SHIELD;
                    gSideStatuses[GetBattlerSide(gBattlerTarget)] &= ~SIDE_STATUS_MAT_BLOCK;
                    gProtectStructs[gBattlerTarget].spikyShielded = FALSE;
                    gProtectStructs[gBattlerTarget].kingsShielded = FALSE;
                    gProtectStructs[gBattlerTarget].banefulBunkered = FALSE;
                    gProtectStructs[gBattlerTarget].obstructed = FALSE;
                    gProtectStructs[gBattlerTarget].silkTrapped = FALSE;
                    gProtectStructs[gBattlerAttacker].burningBulwarked = FALSE;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    if (gCurrentMove == MOVE_HYPERSPACE_FURY)
                        gBattlescriptCurrInstr = BattleScript_HyperspaceFuryRemoveProtect;
                    else
                        gBattlescriptCurrInstr = BattleScript_MoveEffectFeint;
                }
                break;
            case MOVE_EFFECT_SPECTRAL_THIEF:
                if (!NoAliveMonsForEitherParty())
                {
                    gBattleStruct->stolenStats[0] = 0; // Stats to steal.
                    gBattleScripting.animArg1 = 0;
                    for (i = STAT_ATK; i < NUM_BATTLE_STATS; i++)
                    {
                        if (gBattleMons[gBattlerTarget].statStages[i] > DEFAULT_STAT_STAGE && gBattleMons[gBattlerAttacker].statStages[i] != MAX_STAT_STAGE)
                        {
                            bool32 byTwo = FALSE;

                            gBattleStruct->stolenStats[0] |= gBitTable[i];
                            // Store by how many stages to raise the stat.
                            gBattleStruct->stolenStats[i] = gBattleMons[gBattlerTarget].statStages[i] - DEFAULT_STAT_STAGE;
                            while (gBattleMons[gBattlerAttacker].statStages[i] + gBattleStruct->stolenStats[i] > MAX_STAT_STAGE)
                                gBattleStruct->stolenStats[i]--;
                            gBattleMons[gBattlerTarget].statStages[i] = DEFAULT_STAT_STAGE;

                            if (gBattleStruct->stolenStats[i] >= 2)
                                byTwo++;

                            if (gBattleScripting.animArg1 == 0)
                            {
                                if (byTwo)
                                    gBattleScripting.animArg1 = STAT_ANIM_PLUS2 + i;
                                else
                                    gBattleScripting.animArg1 = STAT_ANIM_PLUS1 + i;
                            }
                            else
                            {
                                if (byTwo)
                                    gBattleScripting.animArg1 = STAT_ANIM_MULTIPLE_PLUS2;
                                else
                                    gBattleScripting.animArg1 = STAT_ANIM_MULTIPLE_PLUS1;
                            }
                        }
                    }

                    if (gBattleStruct->stolenStats[0] != 0)
                    {
                        BattleScriptPush(gBattlescriptCurrInstr + 1);
                        gBattlescriptCurrInstr = BattleScript_SpectralThiefSteal;
                    }
                }
                break;
            case MOVE_EFFECT_V_CREATE:
                if (!NoAliveMonsForEitherParty())
                {
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_VCreateStatLoss;
                }
                break;
            case MOVE_EFFECT_CORE_ENFORCER:
                if (GetBattlerTurnOrderNum(gBattlerAttacker) > GetBattlerTurnOrderNum(gBattlerTarget)
                 && !NoAliveMonsForEitherParty())
                {
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_MoveEffectCoreEnforcer;
                }
                break;
            case MOVE_EFFECT_THROAT_CHOP:
                gDisableStructs[gEffectBattler].throatChopTimer = 2;
                gBattlescriptCurrInstr++;
                break;
            case MOVE_EFFECT_INCINERATE:
                if ((gBattleMons[gEffectBattler].item >= FIRST_BERRY_INDEX && gBattleMons[gEffectBattler].item <= LAST_BERRY_INDEX)
                 || (B_INCINERATE_GEMS >= GEN_6 && GetBattlerHoldEffect(gEffectBattler, FALSE) == HOLD_EFFECT_GEMS))
                {
                    gLastUsedItem = gBattleMons[gEffectBattler].item;
                    gBattleMons[gEffectBattler].item = 0;
                    CheckSetUnburden(gEffectBattler);

                    gActiveBattler = gEffectBattler;
                    BtlController_EmitSetMonData(BUFFER_A, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[gEffectBattler].item), &gBattleMons[gEffectBattler].item);
                    MarkBattlerForControllerExec(gEffectBattler);
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_MoveEffectIncinerate;
                }
                break;
            case MOVE_EFFECT_BUG_BITE:
                if (ItemId_GetPocket(gBattleMons[gEffectBattler].item) == POCKET_BERRY_POUCH
                    && battlerAbility != ABILITY_STICKY_HOLD)
                {
                    // target loses their berry
                    gLastUsedItem = gBattleMons[gEffectBattler].item;
                    gBattleMons[gEffectBattler].item = 0;
                    CheckSetUnburden(gEffectBattler);

                    gActiveBattler = gEffectBattler;
                    BtlController_EmitSetMonData(BUFFER_A, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[gEffectBattler].item), &gBattleMons[gEffectBattler].item);
                    MarkBattlerForControllerExec(gEffectBattler);
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_MoveEffectBugBite;
                }
                break;
            case MOVE_EFFECT_TRAP_BOTH:
                if (!(gBattleMons[gBattlerTarget].status2 & STATUS2_ESCAPE_PREVENTION) && !(gBattleMons[gBattlerAttacker].status2 & STATUS2_ESCAPE_PREVENTION))
                {
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_BothCanNoLongerEscape;
                }
                if (!(gBattleMons[gBattlerTarget].status2 & STATUS2_ESCAPE_PREVENTION))
                    gDisableStructs[gBattlerTarget].battlerPreventingEscape = gBattlerAttacker;

                if (!(gBattleMons[gBattlerAttacker].status2 & STATUS2_ESCAPE_PREVENTION))
                    gDisableStructs[gBattlerAttacker].battlerPreventingEscape = gBattlerTarget;

                gBattleMons[gBattlerTarget].status2 |= STATUS2_ESCAPE_PREVENTION;
                gBattleMons[gBattlerAttacker].status2 |= STATUS2_ESCAPE_PREVENTION;
                break;
            case MOVE_EFFECT_REMOVE_ARG_TYPE:
                // This seems unnecessary but is done to make it work properly with Parental Bond
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                switch (gMovesInfo[gCurrentMove].argument)
                {
                    case TYPE_FIRE: // Burn Up
                        gBattlescriptCurrInstr = BattleScript_RemoveFireType;
                        break;
                    case TYPE_ELECTRIC: // Double Shot
                        gBattlescriptCurrInstr = BattleScript_RemoveElectricType;
                        break;
                    default:
                        gBattlescriptCurrInstr = BattleScript_RemoveGenericType;
                        break;
                }
                RemoveBattlerType(gEffectBattler, gMovesInfo[gCurrentMove].argument);
                break;
            case MOVE_EFFECT_ROUND:
                TryUpdateRoundTurnOrder(); // If another Pokémon uses Round before the user this turn, the user will use Round directly after it
                gBattlescriptCurrInstr++;
                break;
            case MOVE_EFFECT_DIRE_CLAW:
                if (!gBattleMons[gEffectBattler].status1)
                {
                    static const u8 sDireClawEffects[] = { MOVE_EFFECT_POISON, MOVE_EFFECT_PARALYSIS, MOVE_EFFECT_SLEEP };
                    gBattleScripting.moveEffect = RandomElement(RNG_DIRE_CLAW, sDireClawEffects);
                    SetMoveEffect(primary, certain);
                }
                break;
            case MOVE_EFFECT_STEALTH_ROCK:
                if (!(gSideStatuses[GetBattlerSide(gEffectBattler)] & SIDE_STATUS_STEALTH_ROCK))
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_POINTEDSTONESFLOAT;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_StealthRockActivates;
                }
                break;
            case MOVE_EFFECT_SPIKES:
                if (gSideTimers[GetBattlerSide(gEffectBattler)].spikesAmount < 3)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SPIKESSCATTERED;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);

                    if (gBattleStruct->isSkyBattle)
                        gBattlescriptCurrInstr++;
                    else
                        gBattlescriptCurrInstr = BattleScript_SpikesActivates;
                }
                break;
            case MOVE_EFFECT_SYRUP_BOMB:
                if (!(gStatuses4[gEffectBattler] & STATUS4_SYRUP_BOMB))
                {
                    struct Pokemon *party = GetBattlerParty(gBattlerAttacker);

                    gStatuses4[gEffectBattler] |= STATUS4_SYRUP_BOMB;
                    gDisableStructs[gEffectBattler].syrupBombTimer = 3;
                    gDisableStructs[gEffectBattler].syrupBombIsShiny = IsMonShiny(&party[gBattlerPartyIndexes[gBattlerAttacker]]);
                    gBattleStruct->stickySyrupdBy[gEffectBattler] = gBattlerAttacker;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_SyrupBombActivates;
                }
                break;
            case MOVE_EFFECT_SECRET_POWER:
                if (gFieldStatuses & STATUS_FIELD_TERRAIN_ANY)
                {
                    switch (gFieldStatuses & STATUS_FIELD_TERRAIN_ANY)
                    {
                    case STATUS_FIELD_MISTY_TERRAIN:
                        gBattleScripting.moveEffect = MOVE_EFFECT_SP_ATK_MINUS_1;
                        break;
                    case STATUS_FIELD_GRASSY_TERRAIN:
                        gBattleScripting.moveEffect = MOVE_EFFECT_SLEEP;
                        break;
                    case STATUS_FIELD_ELECTRIC_TERRAIN:
                        gBattleScripting.moveEffect = MOVE_EFFECT_PARALYSIS;
                        break;
                    case STATUS_FIELD_PSYCHIC_TERRAIN:
                        gBattleScripting.moveEffect = MOVE_EFFECT_SPD_MINUS_1;
                        break;
                    default:
                        gBattleScripting.moveEffect = MOVE_EFFECT_PARALYSIS;
                        break;
                    }
                }
                else
                {
                    switch (gBattleTerrain)
                    {
                    case BATTLE_TERRAIN_GRASS:
                        gBattleScripting.moveEffect = (B_SECRET_POWER_EFFECT >= GEN_4 ? MOVE_EFFECT_SLEEP : MOVE_EFFECT_POISON);
                        break;
                    case BATTLE_TERRAIN_UNDERWATER:
                        gBattleScripting.moveEffect = (B_SECRET_POWER_EFFECT >= GEN_6 ? MOVE_EFFECT_ATK_MINUS_1 : MOVE_EFFECT_DEF_MINUS_1);
                        break;
                    case BATTLE_TERRAIN_POND:
                        gBattleScripting.moveEffect = (B_SECRET_POWER_EFFECT >= GEN_4 ? MOVE_EFFECT_ATK_MINUS_1 : MOVE_EFFECT_SPD_MINUS_1);
                        break;
                    case BATTLE_TERRAIN_MOUNTAIN:
                        if (B_SECRET_POWER_EFFECT >= GEN_5)
                            gBattleScripting.moveEffect = MOVE_EFFECT_ACC_MINUS_1;
                        else if (B_SECRET_POWER_EFFECT >= GEN_4)
                            gBattleScripting.moveEffect = MOVE_EFFECT_FLINCH;
                        else
                            gBattleScripting.moveEffect = MOVE_EFFECT_CONFUSION;
                        break;
                    case BATTLE_TERRAIN_PUDDLE:
                        gBattleScripting.moveEffect = (B_SECRET_POWER_EFFECT >= GEN_5 ? MOVE_EFFECT_SPD_MINUS_1 : MOVE_EFFECT_ACC_MINUS_1);
                        break;
                    case BATTLE_TERRAIN_LONG_GRASS:
                        gBattleScripting.moveEffect = MOVE_EFFECT_SLEEP;
                        break;
                    case BATTLE_TERRAIN_SAND:
                        gBattleScripting.moveEffect = MOVE_EFFECT_ACC_MINUS_1;
                        break;
                    case BATTLE_TERRAIN_WATER:
                        gBattleScripting.moveEffect = MOVE_EFFECT_ATK_MINUS_1;
                        break;
                    case BATTLE_TERRAIN_CAVE:
                    case BATTLE_TERRAIN_BURIAL_GROUND:
                    case BATTLE_TERRAIN_SPACE:
                        gBattleScripting.moveEffect = MOVE_EFFECT_FLINCH;
                        break;
                    case BATTLE_TERRAIN_SOARING:
                    case BATTLE_TERRAIN_SKY_PILLAR:
                    case BATTLE_TERRAIN_MARSH:
                    case BATTLE_TERRAIN_SWAMP:
                        gBattleScripting.moveEffect = MOVE_EFFECT_SPD_MINUS_1;
                        break;
                    case BATTLE_TERRAIN_SNOW:
                    case BATTLE_TERRAIN_ICE:
                        gBattleScripting.moveEffect = MOVE_EFFECT_FREEZE_OR_FROSTBITE;
                        break;
                    case BATTLE_TERRAIN_VOLCANO:
                        gBattleScripting.moveEffect = MOVE_EFFECT_BURN;
                        break;
                    case BATTLE_TERRAIN_ULTRA_SPACE:
                        gBattleScripting.moveEffect = MOVE_EFFECT_DEF_MINUS_1;
                        break;
                    default:
                        gBattleScripting.moveEffect = MOVE_EFFECT_PARALYSIS;
                        break;
                    }
                }
                SetMoveEffect(primary, certain);
                break;
            case MOVE_EFFECT_PSYCHIC_NOISE:
                battlerAbility = IsAbilityOnSide(gEffectBattler, ABILITY_AROMA_VEIL);

                if (battlerAbility)
                {
                    gBattlerAbility = battlerAbility - 1;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_AromaVeilProtectsRet;
                }
                else if (!(gStatuses3[gEffectBattler] & STATUS3_HEAL_BLOCK))
                {
                    gStatuses3[gEffectBattler] |= STATUS3_HEAL_BLOCK;
                    gDisableStructs[gEffectBattler].healBlockTimer = 2;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_EffectPsychicNoise;
                }
                break;
            }
        }
    }

    gBattleScripting.moveEffect = 0;
}

static bool32 CanApplyAdditionalEffect(const struct AdditionalEffect *additionalEffect)
{
    // Self-targeting move effects only apply after the last mon has been hit
    u16 moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);
    if (additionalEffect->self
      && (moveTarget == MOVE_TARGET_BOTH || moveTarget == MOVE_TARGET_FOES_AND_ALLY)
      && GetNextTarget(moveTarget, TRUE) != MAX_BATTLERS_COUNT)
        return FALSE;

    // Certain move effects only apply if the target raised stats this turn (e.g. Burning Jealousy)
    if (additionalEffect->onlyIfTargetRaisedStats && !gProtectStructs[gBattlerTarget].statRaised)
        return FALSE;

    // Certain additional effects only apply on a two-turn move's charge turn
    if (additionalEffect->onChargeTurnOnly != gProtectStructs[gBattlerAttacker].chargingTurn)
        return FALSE;

    return TRUE;
}

static void Cmd_setadditionaleffects(void)
{
    CMD_ARGS();

    if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
    {
        if (gMovesInfo[gCurrentMove].numAdditionalEffects > gBattleStruct->additionalEffectsCounter)
        {
            u32 percentChance;
            const struct AdditionalEffect *additionalEffect = &gMovesInfo[gCurrentMove].additionalEffects[gBattleStruct->additionalEffectsCounter];
            const u8 *currentPtr = gBattlescriptCurrInstr;

            // Various checks for if this move effect can be applied this turn
            if (CanApplyAdditionalEffect(additionalEffect))
            {
                percentChance = CalcSecondaryEffectChance(gBattlerAttacker, GetBattlerAbility(gBattlerAttacker), additionalEffect);

                // Activate effect if it's primary (chance == 0) or if RNGesus says so
                if ((percentChance == 0) || RandomPercentage(RNG_SECONDARY_EFFECT + gBattleStruct->additionalEffectsCounter, percentChance))
                {
                    gBattleScripting.moveEffect = additionalEffect->moveEffect | (MOVE_EFFECT_AFFECTS_USER * (additionalEffect->self));

                    SetMoveEffect(
                        percentChance == 0, // a primary effect
                        percentChance >= 100 // certain to happen
                    );
                }
            }

            // Move script along if we haven't jumped elsewhere
            if (gBattlescriptCurrInstr == currentPtr)
                gBattlescriptCurrInstr = cmd->nextInstr;

            // Call setadditionaleffects again in the case of a move with multiple effects
            gBattleStruct->additionalEffectsCounter++;
            if (gMovesInfo[gCurrentMove].numAdditionalEffects > gBattleStruct->additionalEffectsCounter)
                gBattleScripting.moveEffect = MOVE_EFFECT_CONTINUE;
            else
                gBattleScripting.moveEffect = gBattleStruct->additionalEffectsCounter = 0;
        }
        else
        {
            gBattleScripting.moveEffect = 0;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
    }
    else
    {
        gBattleScripting.moveEffect = 0;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }

    gBattleScripting.multihitMoveEffect = 0;
}

static void Cmd_seteffectprimary(void)
{
    CMD_ARGS();

    SetMoveEffect(TRUE, FALSE);
}

static void Cmd_seteffectsecondary(void)
{
    CMD_ARGS();

    SetMoveEffect(FALSE, FALSE);
}

static void Cmd_clearstatusfromeffect(void)
{
    CMD_ARGS(u8 battler);
    
    u32 battler = gActiveBattler = GetBattlerForBattleScript(cmd->battler);

    if (gBattleScripting.moveEffect <= PRIMARY_STATUS_MOVE_EFFECT)
        gBattleMons[battler].status1 &= (~sStatusFlagsForMoveEffects[gBattleScripting.moveEffect]);
    else
    {
        gBattleMons[battler].status2 &= (~sStatusFlagsForMoveEffects[gBattleScripting.moveEffect]);
        if (gBattleScripting.moveEffect == MOVE_EFFECT_CHARGING)
            gProtectStructs[battler].chargingTurn = FALSE;
    }

    gBattleScripting.moveEffect = 0;
    gBattlescriptCurrInstr = cmd->nextInstr;
    gBattleScripting.multihitMoveEffect = 0;
}

static void Cmd_tryfaintmon(void)
{
    CMD_ARGS(u8 battler, bool8 isSpikes, const u8 *instr);
    u32 battler, destinyBondBattler;
    const u8 *faintScript;

    battler = gActiveBattler = GetBattlerForBattleScript(cmd->battler);
    if (cmd->isSpikes != FALSE)
    {
        if (gHitMarker & HITMARKER_FAINTED(battler))
        {
            BattleScriptPop();
            gBattlescriptCurrInstr = cmd->instr;
        }
        else
        {
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
    }
    else
    {
        if (cmd->battler == BS_ATTACKER)
        {
            gActiveBattler = gBattlerAttacker;
            destinyBondBattler = gBattlerTarget;
            faintScript = BattleScript_FaintAttacker;
        }
        else
        {
            gActiveBattler = gBattlerTarget;
            destinyBondBattler = gBattlerAttacker;
            faintScript = BattleScript_FaintTarget;
        }
        if (!(gAbsentBattlerFlags & gBitTable[battler])
         && gBattleMons[battler].hp == 0)
        {
            gHitMarker |= HITMARKER_FAINTED(battler);
            BattleScriptPush(cmd->nextInstr);
            gBattlescriptCurrInstr = faintScript;
            if (GetBattlerSide(battler) == B_SIDE_PLAYER)
            {
                gHitMarker |= HITMARKER_PLAYER_FAINTED;
                if (gBattleResults.playerFaintCounter < 255)
                    gBattleResults.playerFaintCounter++;
                AdjustFriendshipOnBattleFaint(battler);
                gSideTimers[B_SIDE_PLAYER].retaliateTimer = 2;
            }
            else
            {
                if (gBattleResults.opponentFaintCounter < 255)
                    gBattleResults.opponentFaintCounter++;
                gBattleResults.lastOpponentSpecies = GetMonData(&gEnemyParty[gBattlerPartyIndexes[battler]], MON_DATA_SPECIES, NULL);
                gSideTimers[B_SIDE_OPPONENT].retaliateTimer = 2;
            }
            if ((gHitMarker & HITMARKER_DESTINYBOND) && gBattleMons[gBattlerAttacker].hp != 0
                 /* && !IsDynamaxed(gBattlerAttacker) */) // TODO: Dynamax
            {
                gHitMarker &= ~HITMARKER_DESTINYBOND;
                BattleScriptPush(gBattlescriptCurrInstr);
                gBattleMoveDamage = gBattleMons[destinyBondBattler].hp;
                gBattlescriptCurrInstr = BattleScript_DestinyBondTakesLife;
            }
            if ((gStatuses3[gBattlerTarget] & STATUS3_GRUDGE)
             && !(gHitMarker & HITMARKER_GRUDGE)
             && GetBattlerSide(gBattlerAttacker) != GetBattlerSide(gBattlerTarget)
             && gBattleMons[gBattlerAttacker].hp != 0
             && gCurrentMove != MOVE_STRUGGLE)
            {
                u8 moveIndex = *(gBattleStruct->chosenMovePositions + gBattlerAttacker);

                gBattleMons[gBattlerAttacker].pp[moveIndex] = 0;
                BattleScriptPush(gBattlescriptCurrInstr);
                gBattlescriptCurrInstr = BattleScript_GrudgeTakesPp;
                gActiveBattler = gBattlerAttacker;
                BtlController_EmitSetMonData(BUFFER_A, moveIndex + REQUEST_PPMOVE1_BATTLE, 0, sizeof(gBattleMons[gBattlerAttacker].pp[moveIndex]), &gBattleMons[gBattlerAttacker].pp[moveIndex]);
                MarkBattlerForControllerExec(gBattlerAttacker);

                PREPARE_MOVE_BUFFER(gBattleTextBuff1, gBattleMons[gBattlerAttacker].moves[moveIndex])
            }
        }
        else
        {
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
    }
}

static void Cmd_dofaintanimation(void)
{
    CMD_ARGS(u8 battler);

    if (gBattleControllerExecFlags == 0)
    {
        u32 battler = gActiveBattler = GetBattlerForBattleScript(cmd->battler);
        BtlController_EmitFaintAnimation(BUFFER_A);
        MarkBattlerForControllerExec(battler);
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_cleareffectsonfaint(void)
{
    CMD_ARGS(u8 battler);

    if (gBattleControllerExecFlags == 0)
    {
        u32 battler = gActiveBattler = GetBattlerForBattleScript(cmd->battler);
        const u8 *clearDataResult = NULL;

        gBattleMons[battler].status1 = 0;
        BtlController_EmitSetMonData(BUFFER_A, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[battler].status1), &gBattleMons[battler].status1);
        MarkBattlerForControllerExec(battler);

        clearDataResult = FaintClearSetData(battler); // Effects like attractions, trapping, etc.
        if (clearDataResult)
            gBattlescriptCurrInstr = clearDataResult;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_jumpifstatus(void)
{
    CMD_ARGS(u8 battler, u32 flags, const u8 *jumpInstr);

    u8 battler = GetBattlerForBattleScript(cmd->battler);
    u32 flags = cmd->flags;
    const u8 *jumpInstr = cmd->jumpInstr;

    if (gBattleMons[battler].status1 & flags && gBattleMons[battler].hp != 0)
        gBattlescriptCurrInstr = jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_jumpifstatus2(void)
{
    CMD_ARGS(u8 battler, u32 flags, const u8 *jumpInstr);

    u8 battler = GetBattlerForBattleScript(cmd->battler);
    u32 flags = cmd->flags;
    const u8 *jumpInstr = cmd->jumpInstr;

    if (gBattleMons[battler].status2 & flags && gBattleMons[battler].hp != 0)
        gBattlescriptCurrInstr = jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_jumpifability(void)
{
    CMD_ARGS(u8 battler, u16 ability, const u8 *jumpInstr);

    u32 battler;
    bool32 hasAbility = FALSE;
    u32 ability = cmd->ability;

    switch (cmd->battler)
    {
    default:
        battler = GetBattlerForBattleScript(cmd->battler);
        if (GetBattlerAbility(battler) == ability)
            hasAbility = TRUE;
        break;
    case BS_ATTACKER_SIDE:
        battler = IsAbilityOnSide(gBattlerAttacker, ability);
        if (battler)
        {
            battler--;
            hasAbility = TRUE;
        }
        break;
    case BS_TARGET_SIDE:
        battler = IsAbilityOnOpposingSide(gBattlerAttacker, ability);
        if (battler)
        {
            battler--;
            hasAbility = TRUE;
        }
        break;
    }

    if (hasAbility)
    {
        gLastUsedAbility = ability;
        gBattlescriptCurrInstr = cmd->jumpInstr;
        RecordAbilityBattle(battler, gLastUsedAbility);
        gBattlerAbility = battler;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_jumpifsideaffecting(void)
{
    CMD_ARGS(u8 battler, u32 flags, const u8 *jumpInstr);

    u32 side = GetBattlerSide(GetBattlerForBattleScript(cmd->battler));

    if (gSideStatuses[side] & cmd->flags)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_jumpifstat(void)
{
    CMD_ARGS(u8 battler, u8 comparison, u8 stat, u8 value, const u8 *jumpInstr);

    bool32 ret = 0;
    u8 battler = GetBattlerForBattleScript(cmd->battler);
    u8 stat = cmd->stat;
    u8 value = cmd->value;
    u8 comparison = cmd->comparison;

    ret = CompareStat(battler, stat, value, comparison);

    if (ret)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_jumpifstatus3condition(void)
{
    CMD_ARGS(u8 battler, u32 flags, bool8 jumpIfTrue, const u8 *jumpInstr);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    if (cmd->jumpIfTrue)
    {
        if ((gStatuses3[battler] & cmd->flags) != 0)
            gBattlescriptCurrInstr = cmd->nextInstr;
        else
            gBattlescriptCurrInstr = cmd->jumpInstr;
    }
    else
    {
        if ((gStatuses3[battler] & cmd->flags) != 0)
            gBattlescriptCurrInstr = cmd->jumpInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_jumpbasedontype(void)
{
    CMD_ARGS(u8 battler, u8 type, u8 jumpIfType, const u8 *jumpInstr);

    u8 battler = GetBattlerForBattleScript(cmd->battler);
    u8 type = cmd->type;
    const u8 *jumpInstr = cmd->jumpInstr;

    // jumpiftype
    if (cmd->jumpIfType)
    {
        if (IS_BATTLER_OF_TYPE(battler, type))
            gBattlescriptCurrInstr = jumpInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
    }
    // jumpifnottype
    else
    {
        if (!IS_BATTLER_OF_TYPE(battler, type))
            gBattlescriptCurrInstr = jumpInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

FEATURE_FLAG_ASSERT(I_EXP_SHARE_FLAG, YouNeedToSetTheExpShareFlagToAnUnusedFlag);

static bool32 BattleTypeAllowsExp(void)
{
    if (gBattleTypeFlags &
              ( BATTLE_TYPE_LINK
              | BATTLE_TYPE_TRAINER_TOWER
              | BATTLE_TYPE_BATTLE_TOWER
              | BATTLE_TYPE_SAFARI
              | BATTLE_TYPE_EREADER_TRAINER))
        return FALSE;
    else
        return TRUE;
}

static u32 GetMonHoldEffect(struct Pokemon *mon)
{
    u32 holdEffect;
    u32 item = GetMonData(mon, MON_DATA_HELD_ITEM);

    if (item == ITEM_ENIGMA_BERRY_E_READER)
    #if FREE_ENIGMA_BERRY == FALSE
        holdEffect = gSaveBlock1Ptr->enigmaBerry.holdEffect;
    #else
        holdEffect = 0;
    #endif //FREE_ENIGMA_BERRY
    else
        holdEffect = ItemId_GetHoldEffect(item);

    return holdEffect;
}

static void Cmd_getexp(void)
{
    CMD_ARGS(u8 battler);

    u32 holdEffect;
    s32 i; // also used as stringId
    u8 *expMonId = &gBattleStruct->expGetterMonId;

    gBattlerFainted = GetBattlerForBattleScript(cmd->battler);

    switch (gBattleScripting.getexpState)
    {
    case 0: // check if should receive exp at all
        if (GetBattlerSide(gBattlerFainted) != B_SIDE_OPPONENT
            || IsAiVsAiBattle()
            || !BattleTypeAllowsExp())
        {
            gBattleScripting.getexpState = 6; // goto last case
        }
        else
        {
            gBattleScripting.getexpState++;
            gBattleStruct->givenExpMons |= gBitTable[gBattlerPartyIndexes[gBattlerFainted]];
        }
        break;
    case 1: // calculate experience points to redistribute
        {
            u32 orderId = 0;
            u32 calculatedExp = 0;
            u32 *exp = &gBattleStruct->expValue;
            u32 sentInBits = gSentPokesToOpponent[(gBattlerFainted & 2) >> 1];
            u32 expShareBits = 0;
            s32 viaSentIn = 0;
            s32 viaExpShare = 0;

            for (i = 0; i < PARTY_SIZE; i++)
            {
                if (!IsValidForBattle(&gPlayerParty[i]))
                    continue;
                if (gBitTable[i] & sentInBits)
                    viaSentIn++;

                holdEffect = GetMonHoldEffect(&gPlayerParty[i]);
                if (holdEffect == HOLD_EFFECT_EXP_SHARE || IsGen6ExpShareEnabled())
                {
                    expShareBits |= gBitTable[i];
                    viaExpShare++;
                }
            }
            // Get order of mons getting exp: 1. all mons via sent in, 2. all mons via exp share
            for (i = 0; i < PARTY_SIZE; i++)
            {
                if (gBitTable[i] & sentInBits)
                    gBattleStruct->expGettersOrder[orderId++] = i;
            }
            for (i = 0; i < PARTY_SIZE; i++)
            {
                if (!(gBitTable[i] & sentInBits) && gBitTable[i] & expShareBits)
                    gBattleStruct->expGettersOrder[orderId++] = i;
            }
            if (orderId < PARTY_SIZE)
                gBattleStruct->expGettersOrder[orderId] = PARTY_SIZE;

            calculatedExp = gSpeciesInfo[gBattleMons[gBattlerFainted].species].expYield * gBattleMons[gBattlerFainted].level;
            if (B_SCALED_EXP >= GEN_5 && B_SCALED_EXP != GEN_6)
                calculatedExp /= 5;
            else
                calculatedExp /= 7;

            if (B_TRAINER_EXP_MULTIPLIER <= GEN_7 && gBattleTypeFlags & BATTLE_TYPE_TRAINER)
                calculatedExp = (calculatedExp * 150) / 100;

            if (B_SPLIT_EXP < GEN_6)
            {
                if (viaExpShare) // at least one mon is getting exp via exp share
                {
                    *exp = SAFE_DIV(calculatedExp / 2, viaSentIn);
                    if (*exp == 0)
                        *exp = 1;

                    gBattleStruct->expShareExpValue = calculatedExp / 2 / viaExpShare;
                    if (gBattleStruct->expShareExpValue == 0)
                        gBattleStruct->expShareExpValue = 1;
                }
                else
                {
                    *exp = SAFE_DIV(calculatedExp, viaSentIn);
                    if (*exp == 0)
                        *exp = 1;
                    gBattleStruct->expShareExpValue = 0;
                }
            }
            else
            {
                *exp = calculatedExp;
                gBattleStruct->expShareExpValue = calculatedExp / 2;
                if (gBattleStruct->expShareExpValue == 0)
                    gBattleStruct->expShareExpValue = 1;
            }

            gBattleScripting.getexpState++;
            gBattleStruct->expOrderId = 0;
            *expMonId = gBattleStruct->expGettersOrder[0];
            gBattleStruct->expSentInMons = sentInBits;
        }
        // fall through
    case 2: // set exp value to the poke in expgetter_id and print message
        if (gBattleControllerExecFlags == 0)
        {
            bool32 wasSentOut = ((gBattleStruct->expSentInMons & gBitTable[*expMonId]) != 0);
            holdEffect = GetMonHoldEffect(&gPlayerParty[*expMonId]);

            if ((holdEffect != HOLD_EFFECT_EXP_SHARE && !wasSentOut && !IsGen6ExpShareEnabled())
             || GetMonData(&gPlayerParty[*expMonId], MON_DATA_SPECIES_OR_EGG) == SPECIES_EGG)
            {
                gBattleScripting.getexpState = 5;
                gBattleMoveDamage = 0; // used for exp
            }
            else if ((gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER && *expMonId >= 3)
                  || GetMonData(&gPlayerParty[*expMonId], MON_DATA_LEVEL) == MAX_LEVEL)
            {
                gBattleScripting.getexpState = 5;
                gBattleMoveDamage = 0; // used for exp
                if (B_MAX_LEVEL_EV_GAINS >= GEN_5)
                    MonGainEVs(&gPlayerParty[*expMonId], gBattleMons[gBattlerFainted].species);
            }
            else
            {
                // Music change in a wild battle after fainting opposing pokemon.
                if (!(gBattleTypeFlags & BATTLE_TYPE_TRAINER)
                    && (gBattleMons[0].hp || (gBattleTypeFlags & BATTLE_TYPE_DOUBLE && gBattleMons[2].hp))
                    && !IsBattlerAlive(GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT))
                    && !IsBattlerAlive(GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT))
                    && !gBattleStruct->wildVictorySong)
                {
                    BattleStopLowHpSound();
                    PlayBGM(MUS_VICTORY_WILD);
                    gBattleStruct->wildVictorySong++;
                }

                if (IsValidForBattle(&gPlayerParty[*expMonId]))
                {
                    if (wasSentOut)
                        gBattleMoveDamage = gBattleStruct->expValue; // GetSoftLevelCapExpValue(gPlayerParty[*expMonId].level, gBattleStruct->expValue); TODO: Level caps?
                    else
                        gBattleMoveDamage = 0;

                    if ((holdEffect == HOLD_EFFECT_EXP_SHARE || IsGen6ExpShareEnabled())
                        && (B_SPLIT_EXP < GEN_6 || gBattleMoveDamage == 0)) // only give exp share bonus in later gens if the mon wasn't sent out
                    {
                        gBattleMoveDamage += gBattleStruct->expValue; // GetSoftLevelCapExpValue(gPlayerParty[*expMonId].level, gBattleStruct->expShareExpValue); TODO: Level caps?
                    }

                    ApplyExperienceMultipliers(&gBattleMoveDamage, *expMonId, gBattlerFainted);

                    if (IsTradedMon(&gPlayerParty[*expMonId]))
                    {
                        // check if the Pokémon doesn't belong to the player
                        if (gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER && *expMonId >= 3)
                            i = STRINGID_EMPTYSTRING4;
                        else
                            i = STRINGID_ABOOSTED;
                    }
                    else
                    {
                        i = STRINGID_EMPTYSTRING4;
                    }

                    // get exp getter battler
                    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                    {
                        if (gBattlerPartyIndexes[2] == *expMonId && !(gAbsentBattlerFlags & gBitTable[2]))
                            gBattleStruct->expGetterBattlerId = 2;
                        else
                        {
                            if (!(gAbsentBattlerFlags & gBitTable[0]))
                                gBattleStruct->expGetterBattlerId = 0;
                            else
                                gBattleStruct->expGetterBattlerId = 2;
                        }
                    }
                    else
                    {
                        gBattleStruct->expGetterBattlerId = 0;
                    }

                    PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, gBattleStruct->expGetterBattlerId, *expMonId);
                    // buffer 'gained' or 'gained a boosted'
                    PREPARE_STRING_BUFFER(gBattleTextBuff2, i);
                    PREPARE_WORD_NUMBER_BUFFER(gBattleTextBuff3, 6, gBattleMoveDamage);

                    if (wasSentOut || holdEffect == HOLD_EFFECT_EXP_SHARE)
                    {
                        PrepareStringBattle(STRINGID_PKMNGAINEDEXP, gBattleStruct->expGetterBattlerId);
                    }
                    else if (IsGen6ExpShareEnabled() && !gBattleStruct->teamGotExpMsgPrinted) // Print 'the rest of your team got exp' message once, when all of the sent-in mons were given experience
                    {
                        gLastUsedItem = ITEM_EXP_SHARE;
                        PrepareStringBattle(STRINGID_TEAMGAINEDEXP, gBattleStruct->expGetterBattlerId);
                        gBattleStruct->teamGotExpMsgPrinted = TRUE;
                    }

                    MonGainEVs(&gPlayerParty[*expMonId], gBattleMons[gBattlerFainted].species);
                }
                gBattleScripting.getexpState++;
            }
        }
        break;
    case 3: // Set stats and give exp
        if (gBattleControllerExecFlags == 0)
        {
            // gBattleResources->bufferB[gBattleStruct->expGetterBattlerId][0] = 0; TODO: bufferB as part of battle resource
            gBattleBufferB[gBattleStruct->expGetterBattlerId][0] = 0; 
            if (GetMonData(&gPlayerParty[*expMonId], MON_DATA_HP) && GetMonData(&gPlayerParty[*expMonId], MON_DATA_LEVEL) != MAX_LEVEL)
            {
                gBattleResources->beforeLvlUp->stats[STAT_HP]    = GetMonData(&gPlayerParty[*expMonId], MON_DATA_MAX_HP);
                gBattleResources->beforeLvlUp->stats[STAT_ATK]   = GetMonData(&gPlayerParty[*expMonId], MON_DATA_ATK);
                gBattleResources->beforeLvlUp->stats[STAT_DEF]   = GetMonData(&gPlayerParty[*expMonId], MON_DATA_DEF);
                gBattleResources->beforeLvlUp->stats[STAT_SPEED] = GetMonData(&gPlayerParty[*expMonId], MON_DATA_SPEED);
                gBattleResources->beforeLvlUp->stats[STAT_SPATK] = GetMonData(&gPlayerParty[*expMonId], MON_DATA_SPATK);
                gBattleResources->beforeLvlUp->stats[STAT_SPDEF] = GetMonData(&gPlayerParty[*expMonId], MON_DATA_SPDEF);

                gActiveBattler = gBattleStruct->expGetterBattlerId;
                BtlController_EmitExpUpdate(BUFFER_A, *expMonId, gBattleMoveDamage);
                MarkBattlerForControllerExec(gBattleStruct->expGetterBattlerId);
            }
            gBattleScripting.getexpState++;
        }
        break;
    case 4: // lvl up if necessary
        if (gBattleControllerExecFlags == 0)
        {
            u32 expBattler = gBattleStruct->expGetterBattlerId;
            if (gBattleBufferB[expBattler][0] == CONTROLLER_TWORETURNVALUES && gBattleBufferB[expBattler][1] == RET_VALUE_LEVELED_UP)
            {
                u16 temp, battler = 0xFF;
                if (gBattleTypeFlags & BATTLE_TYPE_TRAINER && gBattlerPartyIndexes[expBattler] == *expMonId)
                    HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[expBattler]], expBattler);

                PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, expBattler, *expMonId);
                PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff2, 3, GetMonData(&gPlayerParty[*expMonId], MON_DATA_LEVEL));

                BattleScriptPushCursor();
                gLeveledUpInBattle |= gBitTable[*expMonId];
                gBattlescriptCurrInstr = BattleScript_LevelUp;
                gBattleMoveDamage = T1_READ_32(&gBattleBufferB[expBattler][2]);
                AdjustFriendship(&gPlayerParty[*expMonId], FRIENDSHIP_EVENT_GROW_LEVEL);

                // update battle mon structure after level up
                if (gBattlerPartyIndexes[0] == *expMonId && gBattleMons[0].hp)
                    battler = 0;
                else if (gBattlerPartyIndexes[2] == *expMonId && gBattleMons[2].hp && (gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
                    battler = 2;

                if (battler != 0xFF)
                {
                    CopyMonLevelAndBaseStatsToBattleMon(battler, &gPlayerParty[*expMonId]);
                    if (gStatuses3[battler] & STATUS3_POWER_TRICK)
                        SWAP(gBattleMons[battler].attack, gBattleMons[battler].defense, temp);
                }

                gBattleScripting.getexpState = 5;
            }
            else
            {
                gBattleMoveDamage = 0;
                gBattleScripting.getexpState = 5;
            }
        }
        break;
    case 5: // looper increment
        if (gBattleMoveDamage) // there is exp to give, goto case 3 that gives exp
        {
            gBattleScripting.getexpState = 3;
        }
        else
        {
            if ((++gBattleStruct->expOrderId) < PARTY_SIZE)
            {
                *expMonId = gBattleStruct->expGettersOrder[gBattleStruct->expOrderId];
                if (*expMonId < PARTY_SIZE)
                {
                    gBattleScripting.getexpState = 2; // loop again
                    break;
                }
            }
            gBattleScripting.getexpState = 6; // we're done
        }
        break;
    case 6: // increment instruction
        if (gBattleControllerExecFlags == 0)
        {
            // not sure why gf clears the item and ability here
            gBattleStruct->expOrderId = 0;
            gBattleStruct->teamGotExpMsgPrinted = FALSE;
            gBattleMons[gBattlerFainted].item = ITEM_NONE;
            gBattleMons[gBattlerFainted].ability = ABILITY_NONE;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        break;
    }
}

bool32 NoAliveMonsForPlayer(void)
{
    u32 i;
    u32 maxI = PARTY_SIZE;
    u32 HP_count = 0;

    if (B_MULTI_BATTLE_WHITEOUT < GEN_4 && gBattleTypeFlags & (BATTLE_TYPE_MULTI | BATTLE_TYPE_INGAME_PARTNER))
        maxI = MULTI_PARTY_SIZE;

    // Get total HP for the player's party to determine if the player has lost
    for (i = 0; i < maxI; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) && !GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
        {
            HP_count += GetMonData(&gPlayerParty[i], MON_DATA_HP);
        }
    }

    return (HP_count == 0);
}

static bool32 NoAliveMonsForOpponent(void)
{
    u32 i;
    u32 HP_count = 0;

    // Get total HP for the enemy's party to determine if the player has won
    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gEnemyParty[i], MON_DATA_SPECIES) && !GetMonData(&gEnemyParty[i], MON_DATA_IS_EGG))
        {
            HP_count += GetMonData(&gEnemyParty[i], MON_DATA_HP);
        }
    }

    return (HP_count == 0);
}

bool32 NoAliveMonsForEitherParty(void)
{
    return (NoAliveMonsForPlayer() || NoAliveMonsForOpponent());
}

// For battles that aren't BATTLE_TYPE_LINK, the only thing this
// command does is check whether the player has won/lost by totaling each team's HP. It then
// sets gBattleOutcome accordingly, if necessary.
static void Cmd_checkteamslost(void)
{
    CMD_ARGS(const u8 *jumpInstr);

    if (gBattleControllerExecFlags)
        return;

    if (NoAliveMonsForPlayer())
        gBattleOutcome |= B_OUTCOME_LOST;

    if (NoAliveMonsForOpponent())
        gBattleOutcome |= B_OUTCOME_WON;

    // For link battles that haven't ended, count number of empty battler spots
    // In link multi battles, jump to pointer if more than 1 spot empty
    // In non-multi battles, jump to pointer if 1 spot is missing on both sides
    if (gBattleOutcome == 0 && (gBattleTypeFlags & (BATTLE_TYPE_LINK)))
    {
        s32 i, emptyPlayerSpots, emptyOpponentSpots;

        for (emptyPlayerSpots = 0, i = 0; i < gBattlersCount; i += 2)
        {
            if ((gHitMarker & HITMARKER_FAINTED2(i)) && (!gSpecialStatuses[i].faintedHasReplacement))
                emptyPlayerSpots++;
        }

        emptyOpponentSpots = 0;
        for (i = 1; i < gBattlersCount; i += 2)
        {
            if ((gHitMarker & HITMARKER_FAINTED2(i)) && (!gSpecialStatuses[i].faintedHasReplacement))
                emptyOpponentSpots++;
        }

        if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
        {
            if (emptyOpponentSpots + emptyPlayerSpots > 1)
                gBattlescriptCurrInstr = cmd->jumpInstr;
            else
                gBattlescriptCurrInstr = cmd->nextInstr;
        }
        else
        {
            if (emptyOpponentSpots != 0 && emptyPlayerSpots != 0)
                gBattlescriptCurrInstr = cmd->jumpInstr;
            else
                gBattlescriptCurrInstr = cmd->nextInstr;
        }
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void MoveValuesCleanUp(void)
{
    gMoveResultFlags = 0;
    gIsCriticalHit = FALSE;
    gBattleScripting.moveEffect = 0;
    gBattleCommunication[MISS_TYPE] = 0;
    gHitMarker &= ~HITMARKER_DESTINYBOND;
    gHitMarker &= ~HITMARKER_SYNCHRONISE_EFFECT;
}

static void Cmd_movevaluescleanup(void)
{
    CMD_ARGS();

    MoveValuesCleanUp();
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_setmultihit(void)
{
    CMD_ARGS(u8 value);

    gMultiHitCounter = cmd->value;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_decrementmultihit(void)
{
    CMD_ARGS(const u8 *loopInstr);

    if (--gMultiHitCounter == 0)
        gBattlescriptCurrInstr = cmd->nextInstr;
    else
        gBattlescriptCurrInstr = cmd->loopInstr;
}

static void Cmd_goto(void)
{
    CMD_ARGS(const u8 *instr);

    gBattlescriptCurrInstr = cmd->instr;
}

static void Cmd_jumpifbyte(void)
{
    CMD_ARGS(u8 comparison, const u8 *bytePtr, u8 value, const u8 *jumpInstr);

    u8 comparison = cmd->comparison;
    const u8 *bytePtr = cmd->bytePtr;
    u8 value = cmd->value;
    const u8 *jumpInstr = cmd->jumpInstr;

    gBattlescriptCurrInstr = cmd->nextInstr;

    switch (comparison)
    {
    case CMP_EQUAL:
        if (*bytePtr == value)
            gBattlescriptCurrInstr = jumpInstr;
        break;
    case CMP_NOT_EQUAL:
        if (*bytePtr != value)
            gBattlescriptCurrInstr = jumpInstr;
        break;
    case CMP_GREATER_THAN:
        if (*bytePtr > value)
            gBattlescriptCurrInstr = jumpInstr;
        break;
    case CMP_LESS_THAN:
        if (*bytePtr < value)
            gBattlescriptCurrInstr = jumpInstr;
        break;
    case CMP_COMMON_BITS:
        if (*bytePtr & value)
            gBattlescriptCurrInstr = jumpInstr;
        break;
    case CMP_NO_COMMON_BITS:
        if (!(*bytePtr & value))
            gBattlescriptCurrInstr = jumpInstr;
        break;
    }
}

static void Cmd_jumpifhalfword(void)
{
    CMD_ARGS(u8 comparison, const u16 *halfwordPtr, u16 value, const u8 *jumpInstr);

    u8 comparison = cmd->comparison;
    const u16 *halfwordPtr = cmd->halfwordPtr;
    u16 value = cmd->value;
    const u8 *jumpInstr = cmd->jumpInstr;

    gBattlescriptCurrInstr = cmd->nextInstr;

    switch (comparison)
    {
    case CMP_EQUAL:
        if (*halfwordPtr == value)
            gBattlescriptCurrInstr = jumpInstr;
        break;
    case CMP_NOT_EQUAL:
        if (*halfwordPtr != value)
            gBattlescriptCurrInstr = jumpInstr;
        break;
    case CMP_GREATER_THAN:
        if (*halfwordPtr > value)
            gBattlescriptCurrInstr = jumpInstr;
        break;
    case CMP_LESS_THAN:
        if (*halfwordPtr < value)
            gBattlescriptCurrInstr = jumpInstr;
        break;
    case CMP_COMMON_BITS:
        if (*halfwordPtr & value)
            gBattlescriptCurrInstr = jumpInstr;
        break;
    case CMP_NO_COMMON_BITS:
        if (!(*halfwordPtr & value))
            gBattlescriptCurrInstr = jumpInstr;
        break;
    }
}

static void Cmd_jumpifword(void)
{
    CMD_ARGS(u8 comparison, const u32 *wordPtr, u32 value, const u8 *jumpInstr);

    u8 comparison = cmd->comparison;
    const u32 *wordPtr = cmd->wordPtr;
    u32 value = cmd->value;
    const u8 *jumpInstr = cmd->jumpInstr;

    gBattlescriptCurrInstr = cmd->nextInstr;

    switch (comparison)
    {
    case CMP_EQUAL:
        if (*wordPtr == value)
            gBattlescriptCurrInstr = jumpInstr;
        break;
    case CMP_NOT_EQUAL:
        if (*wordPtr != value)
            gBattlescriptCurrInstr = jumpInstr;
        break;
    case CMP_GREATER_THAN:
        if (*wordPtr > value)
            gBattlescriptCurrInstr = jumpInstr;
        break;
    case CMP_LESS_THAN:
        if (*wordPtr < value)
            gBattlescriptCurrInstr = jumpInstr;
        break;
    case CMP_COMMON_BITS:
        if (*wordPtr & value)
            gBattlescriptCurrInstr = jumpInstr;
        break;
    case CMP_NO_COMMON_BITS:
        if (!(*wordPtr & value))
            gBattlescriptCurrInstr = jumpInstr;
        break;
    }
}

static void Cmd_jumpifarrayequal(void)
{
    CMD_ARGS(const u8 *array1, const u8 *array2, u8 size, const u8 *jumpInstr);

    const u8 *array1 = cmd->array1;
    const u8 *array2 = cmd->array2;
    u32 size = cmd->size;
    const u8 *jumpInstr = cmd->jumpInstr;

    u8 i;
    for (i = 0; i < size; i++)
    {
        if (*array1 != *array2)
        {
            gBattlescriptCurrInstr = cmd->nextInstr;
            break;
        }
        array1++, array2++;
    }

    if (i == size)
        gBattlescriptCurrInstr = jumpInstr;
}

static void Cmd_jumpifarraynotequal(void)
{
    CMD_ARGS(const u8 *array1, const u8 *array2, u8 size, const u8 *jumpInstr);

    u8 equalBytes = 0;
    const u8 *array1 = cmd->array1;
    const u8 *array2 = cmd->array2;
    u32 size = cmd->size;
    const u8 *jumpInstr = cmd->jumpInstr;

    u8 i;
    for (i = 0; i < size; i++)
    {
        if (*array1 == *array2)
            equalBytes++;
        array1++, array2++;
    }

    if (equalBytes != size)
        gBattlescriptCurrInstr = jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_setbyte(void)
{
    CMD_ARGS(u8 *bytePtr, u8 value);

    u8 *bytePtr = cmd->bytePtr;
    *bytePtr = cmd->value;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_addbyte(void)
{
    CMD_ARGS(u8 *bytePtr, u8 value);

    u8 *bytePtr = cmd->bytePtr;
    *bytePtr += cmd->value;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_subbyte(void)
{
    CMD_ARGS(u8 *bytePtr, u8 value);

    u8 *bytePtr = cmd->bytePtr;
    *bytePtr -= cmd->value;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_copyarray(void)
{
    CMD_ARGS(u8 *dest, const u8 *src, u8 size);

    u8 *dest = cmd->dest;
    const u8 *src = cmd->src;
    s32 size = cmd->size;

    s32 i;
    for (i = 0; i < size; i++)
        dest[i] = src[i];

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_copyarraywithindex(void)
{
    CMD_ARGS(u8 *dest, const u8 *src, const u8 *indexPtr, u8 size);

    u8 *dest = cmd->dest;
    const u8 *src = cmd->src;
    const u8 *indexPtr = cmd->indexPtr;
    s32 size = cmd->size;

    s32 i;
    for (i = 0; i < size; i++)
        dest[i] = src[i + *indexPtr];

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_orbyte(void)
{
    CMD_ARGS(u8 *bytePtr, u8 value);

    u8 *bytePtr = cmd->bytePtr;
    *bytePtr |= cmd->value;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_orhalfword(void)
{
    CMD_ARGS(u16 *halfwordPtr, u16 value);

    u16 *halfwordPtr = cmd->halfwordPtr;
    u16 value = cmd->value;

    *halfwordPtr |= value;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_orword(void)
{
    CMD_ARGS(u32 *wordPtr, u32 value);

    u32 *wordPtr = cmd->wordPtr;
    u32 value = cmd->value;

    *wordPtr |= value;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_bicbyte(void)
{
    CMD_ARGS(u8 *bytePtr, u8 value);

    u8 *bytePtr = cmd->bytePtr;
    *bytePtr &= ~cmd->value;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_bichalfword(void)
{
    CMD_ARGS(u16 *halfwordPtr, u16 value);

    u16 *halfwordPtr = cmd->halfwordPtr;
    u16 value = cmd->value;

    *halfwordPtr &= ~value;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_bicword(void)
{
    CMD_ARGS(u32 *wordPtr, u32 value);

    u32 *wordPtr = cmd->wordPtr;
    u32 value = cmd->value;

    *wordPtr &= ~value;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_pause(void)
{
    CMD_ARGS(u16 frames);

    if (gBattleControllerExecFlags == 0)
    {
        u16 value = cmd->frames;
        if (++gPauseCounterBattle >= value)
        {
            gPauseCounterBattle = 0;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
    }
}

static void Cmd_waitstate(void)
{
    CMD_ARGS();

    if (gBattleControllerExecFlags == 0)
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_healthbar_update(void)
{
    CMD_ARGS(u8 battler);
    u32 battler;

    if (cmd->battler == BS_TARGET)
        battler = gBattlerTarget;
    else
        battler = gBattlerAttacker;
    
    gActiveBattler = battler;
    BtlController_EmitHealthBarUpdate(BUFFER_A, gBattleMoveDamage);
    MarkBattlerForControllerExec(battler);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_return(void)
{
    BattleScriptPop();
}

static void Cmd_end(void)
{
    CMD_ARGS();

    gMoveResultFlags = 0;
    gActiveBattler = 0;
    gCurrentActionFuncId = B_ACTION_TRY_FINISH;
}

static void Cmd_end2(void)
{
    CMD_ARGS();

    gActiveBattler = 0;
    gCurrentActionFuncId = B_ACTION_TRY_FINISH;
}

// Pops the main function stack
static void Cmd_end3(void)
{
    CMD_ARGS();

    BattleScriptPop();
    if (gBattleResources->battleCallbackStack->size != 0)
        gBattleResources->battleCallbackStack->size--;
    gBattleMainFunc = gBattleResources->battleCallbackStack->function[gBattleResources->battleCallbackStack->size];
}

static void Cmd_call(void)
{
    CMD_ARGS(const u8 *instr);

    BattleScriptPush(cmd->nextInstr);
    gBattlescriptCurrInstr = cmd->instr;
}

static void Cmd_setroost(void)
{
    CMD_ARGS();

    gBattleResources->flags->flags[gBattlerAttacker] |= RESOURCE_FLAG_ROOST;
    gBattleStruct->roostTypes[gBattlerAttacker][0] = gBattleMons[gBattlerAttacker].type1;
    gBattleStruct->roostTypes[gBattlerAttacker][1] = gBattleMons[gBattlerAttacker].type2;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_jumpifabilitypresent(void)
{
    CMD_ARGS(u16 ability, const u8 *jumpInstr);

    u16 ability = cmd->ability;
    u32 abilityBattler = IsAbilityOnField(ability);
    if (abilityBattler)
    {
        gBattlerAbility = abilityBattler - 1;
        gBattlescriptCurrInstr = cmd->jumpInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_endselectionscript(void)
{
    CMD_ARGS();

    *(gBattlerAttacker + gBattleStruct->selectionScriptFinished) = TRUE;
}

static void PlayAnimation(u32 battler, u8 animId, const u16 *argPtr, const u8 *nextInstr)
{
    if (B_TERRAIN_BG_CHANGE == FALSE && animId == B_ANIM_RESTORE_BG)
    {
        // workaround for .if not working
        gBattlescriptCurrInstr = nextInstr;
        return;
    }

    gActiveBattler = battler;
    // TODO: Animation
    if (animId == B_ANIM_STATS_CHANGE
     || animId == B_ANIM_SNATCH_MOVE
     /* || animId == B_ANIM_MEGA_EVOLUTION
     || animId == B_ANIM_ILLUSION_OFF */
     || animId == B_ANIM_FORM_CHANGE
     || animId == B_ANIM_SUBSTITUTE_FADE
     /* || animId == B_ANIM_PRIMAL_REVERSION
     || animId == B_ANIM_ULTRA_BURST */)
    {
        BtlController_EmitBattleAnimation(BUFFER_A, animId, &gDisableStructs[battler], *argPtr);
        MarkBattlerForControllerExec(battler);
        gBattlescriptCurrInstr = nextInstr;
    }
    else if (gHitMarker & (HITMARKER_NO_ANIMATIONS | HITMARKER_DISABLE_ANIMATION) && animId != B_ANIM_RESTORE_BG)
    {
        BattleScriptPush(nextInstr);
        gBattlescriptCurrInstr = BattleScript_Pausex20;
    }
    else if (animId == B_ANIM_RAIN_CONTINUES
          || animId == B_ANIM_SUN_CONTINUES
          || animId == B_ANIM_SANDSTORM_CONTINUES
          || animId == B_ANIM_HAIL_CONTINUES
          /* || animId == B_ANIM_SNOW_CONTINUES */) // TODO: Animation
    {
        BtlController_EmitBattleAnimation(BUFFER_A, animId, &gDisableStructs[battler], *argPtr);
        MarkBattlerForControllerExec(battler);
        gBattlescriptCurrInstr = nextInstr;
    }
    else if (gStatuses3[battler] & STATUS3_SEMI_INVULNERABLE)
    {
        gBattlescriptCurrInstr = nextInstr;
    }
    else
    {
        BtlController_EmitBattleAnimation(BUFFER_A, animId, &gDisableStructs[battler], *argPtr);
        MarkBattlerForControllerExec(battler);
        gBattlescriptCurrInstr = nextInstr;
    }
}

static void Cmd_playanimation(void)
{
    CMD_ARGS(u8 battler, u8 animId, const u16 *argPtr);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    PlayAnimation(battler, cmd->animId, cmd->argPtr, cmd->nextInstr);
}

// Same as playanimation, except it takes a pointer to some animation id, instead of taking the value directly
static void Cmd_playanimation_var(void)
{
    CMD_ARGS(u8 battler, const u8 *animIdPtr, const u16 *argPtr);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    PlayAnimation(battler, *(cmd->animIdPtr), cmd->argPtr, cmd->nextInstr);
}

static void Cmd_setgraphicalstatchangevalues(void)
{
    CMD_ARGS();

    u8 value = GET_STAT_BUFF_VALUE_WITH_SIGN(gBattleScripting.statChanger);

    switch (value)
    {
    case SET_STAT_BUFF_VALUE(1): // +1
        value = STAT_ANIM_PLUS1 + 1;
        break;
    case SET_STAT_BUFF_VALUE(2): // +2
        value = STAT_ANIM_PLUS2 + 1;
        break;
    case SET_STAT_BUFF_VALUE(3): // +3
        value = STAT_ANIM_PLUS2 + 1;
        break;
    case SET_STAT_BUFF_VALUE(1) | STAT_BUFF_NEGATIVE: // -1
        value = STAT_ANIM_MINUS1 + 1;
        break;
    case SET_STAT_BUFF_VALUE(2) | STAT_BUFF_NEGATIVE: // -2
        value = STAT_ANIM_MINUS2 + 1;
        break;
    case SET_STAT_BUFF_VALUE(3) | STAT_BUFF_NEGATIVE: // -3
        value = STAT_ANIM_MINUS2 + 1;
        break;
    default: // <-12,-4> and <4, 12>
        if (value & STAT_BUFF_NEGATIVE)
            value = STAT_ANIM_MINUS2 + 1;
        else
            value = STAT_ANIM_PLUS2 + 1;
        break;
    }
    gBattleScripting.animArg1 = GET_STAT_BUFF_ID(gBattleScripting.statChanger) + value - 1;
    gBattleScripting.animArg2 = 0;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_playstatchangeanimation(void)
{
    u32 currStat = 0;
    u16 statAnimId = 0;
    s32 changeableStatsCount = 0;
    u8 statsToCheck = 0;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    statsToCheck = gBattlescriptCurrInstr[2];

    if (gBattlescriptCurrInstr[3] & STAT_CHANGE_NEGATIVE) // goes down
    {
        s16 startingStatAnimId;
        if (gBattlescriptCurrInstr[3] & STAT_CHANGE_BY_TWO)
            startingStatAnimId = STAT_ANIM_MINUS2 - 1;
        else
            startingStatAnimId = STAT_ANIM_MINUS1 - 1;

        while (statsToCheck != 0)
        {
            if (statsToCheck & 1)
            {
                if (gBattlescriptCurrInstr[3] & STAT_CHANGE_CANT_PREVENT)
                {
                    if (gBattleMons[gActiveBattler].statStages[currStat] > MIN_STAT_STAGE)
                    {
                        statAnimId = startingStatAnimId + currStat;
                        changeableStatsCount++;
                    }
                }
                else if (!gSideTimers[GET_BATTLER_SIDE(gActiveBattler)].mistTimer
                        && gBattleMons[gActiveBattler].ability != ABILITY_CLEAR_BODY
                        && gBattleMons[gActiveBattler].ability != ABILITY_WHITE_SMOKE
                        && !(gBattleMons[gActiveBattler].ability == ABILITY_KEEN_EYE && currStat == STAT_ACC)
                        && !(gBattleMons[gActiveBattler].ability == ABILITY_HYPER_CUTTER && currStat == STAT_ATK))
                {
                    if (gBattleMons[gActiveBattler].statStages[currStat] > MIN_STAT_STAGE)
                    {
                        statAnimId = startingStatAnimId + currStat;
                        changeableStatsCount++;
                    }
                }
            }
            statsToCheck >>= 1, currStat++;
        }

        if (changeableStatsCount > 1) // more than one stat, so the color is gray
        {
            if (gBattlescriptCurrInstr[3] & STAT_CHANGE_BY_TWO)
                statAnimId = STAT_ANIM_MULTIPLE_MINUS2;
            else
                statAnimId = STAT_ANIM_MULTIPLE_MINUS1;
        }
    }
    else // goes up
    {
        s16 startingStatAnimId;
        if (gBattlescriptCurrInstr[3] & STAT_CHANGE_BY_TWO)
            startingStatAnimId = STAT_ANIM_PLUS2 - 1;
        else
            startingStatAnimId = STAT_ANIM_PLUS1 - 1;

        while (statsToCheck != 0)
        {
            if (statsToCheck & 1 && gBattleMons[gActiveBattler].statStages[currStat] < MAX_STAT_STAGE)
            {
                statAnimId = startingStatAnimId + currStat;
                changeableStatsCount++;
            }
            statsToCheck >>= 1, currStat++;
        }

        if (changeableStatsCount > 1) // more than one stat, so the color is gray
        {
            if (gBattlescriptCurrInstr[3] & STAT_CHANGE_BY_TWO)
                statAnimId = STAT_ANIM_MULTIPLE_PLUS2;
            else
                statAnimId = STAT_ANIM_MULTIPLE_PLUS1;
        }
    }

    if (gBattlescriptCurrInstr[3] & STAT_CHANGE_MULTIPLE_STATS && changeableStatsCount < 2)
    {
        gBattlescriptCurrInstr += 4;
    }
    else if (changeableStatsCount != 0 && !gBattleScripting.statAnimPlayed)
    {
        BtlController_EmitBattleAnimation(BUFFER_A, B_ANIM_STATS_CHANGE, &gDisableStructs[gActiveBattler], statAnimId);
        MarkBattlerForControllerExec(gActiveBattler);
        if (gBattlescriptCurrInstr[3] & STAT_CHANGE_MULTIPLE_STATS && changeableStatsCount > 1)
            gBattleScripting.statAnimPlayed = TRUE;
        gBattlescriptCurrInstr += 4;
    }
    else
    {
        gBattlescriptCurrInstr += 4;
    }
}

#define SYMBIOSIS_CHECK(battler, ally)                                                                                               \
    GetBattlerAbility(ally) == ABILITY_SYMBIOSIS                   \
    && gBattleMons[battler].item == ITEM_NONE                      \
    && gBattleMons[ally].item != ITEM_NONE                         \
    && CanBattlerGetOrLoseItem(battler, gBattleMons[ally].item)    \
    && CanBattlerGetOrLoseItem(ally, gBattleMons[ally].item)       \
    && gBattleMons[battler].hp != 0                                \
    && gBattleMons[ally].hp != 0

static u32 GetNextTarget(u32 moveTarget, bool32 excludeCurrent)
{
    u32 i;
    for (i = 0; i < MAX_BATTLERS_COUNT; i++)
    {
        if (i != gBattlerAttacker
            && !(excludeCurrent && i == gBattlerTarget)
            && IsBattlerAlive(i)
            && !(gBattleStruct->targetsDone[gBattlerAttacker] & gBitTable[i])
            && (GetBattlerSide(i) != GetBattlerSide(gBattlerAttacker) || moveTarget == MOVE_TARGET_FOES_AND_ALLY))
                break;
    }
    return i;
}

static void Cmd_moveend(void)
{
    s32 i;
    bool32 effect = FALSE;
    u8 moveType = 0;
    u8 holdEffectAtk = 0;
    u16 *choicedMoveAtk = NULL;
    u8 endMode, endState;
    u16 originallyUsedMove;

    if (gChosenMove == MOVE_UNAVAILABLE)
        originallyUsedMove = MOVE_NONE;
    else
        originallyUsedMove = gChosenMove;

    endMode = gBattlescriptCurrInstr[1];
    endState = gBattlescriptCurrInstr[2];

    if (gBattleMons[gBattlerAttacker].item == ITEM_ENIGMA_BERRY)
        holdEffectAtk = gEnigmaBerries[gBattlerAttacker].holdEffect;
    else
        holdEffectAtk = ItemId_GetHoldEffect(gBattleMons[gBattlerAttacker].item);

    choicedMoveAtk = &gBattleStruct->choicedMove[gBattlerAttacker];
    GET_MOVE_TYPE(gCurrentMove, moveType);

    do
    {
        switch (gBattleScripting.moveendState)
        {
        case MOVEEND_RAGE: // rage check
            if (gBattleMons[gBattlerTarget].status2 & STATUS2_RAGE
                && gBattleMons[gBattlerTarget].hp != 0
                && gBattlerAttacker != gBattlerTarget
                && GetBattlerSide(gBattlerAttacker) != GetBattlerSide(gBattlerTarget)
                && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
                && TARGET_TURN_DAMAGED
                && gMovesInfo[gCurrentMove].power != 0
                && gBattleMons[gBattlerTarget].statStages[STAT_ATK] < MAX_STAT_STAGE)
            {
                gBattleMons[gBattlerTarget].statStages[STAT_ATK]++;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_RageIsBuilding;
                effect = TRUE;
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_DEFROST: // defrosting check
            if (gBattleMons[gBattlerTarget].status1 & STATUS1_FREEZE
                && gBattleMons[gBattlerTarget].hp != 0
                && gBattlerAttacker != gBattlerTarget
                && gSpecialStatuses[gBattlerTarget].specialDmg
                && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
                && moveType == TYPE_FIRE)
            {
                gBattleMons[gBattlerTarget].status1 &= ~STATUS1_FREEZE;
                gActiveBattler = gBattlerTarget;
                BtlController_EmitSetMonData(BUFFER_A, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[gBattlerTarget].status1), &gBattleMons[gBattlerTarget].status1);
                MarkBattlerForControllerExec(gActiveBattler);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_DefrostedViaFireMove;
                effect = TRUE;
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_SYNCHRONIZE_TARGET: // target synchronize
            if (AbilityBattleEffects(ABILITYEFFECT_SYNCHRONIZE, gBattlerTarget, 0, 0, 0))
                effect = TRUE;
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_ON_DAMAGE_ABILITIES: // Such as abilities activating on contact (Effect Spore, Rough Skin, etc.).
            if (AbilityBattleEffects(ABILITYEFFECT_ON_DAMAGE, gBattlerTarget, 0, 0, 0))
                effect = TRUE;
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_IMMUNITY_ABILITIES: // status immunities
            if (AbilityBattleEffects(ABILITYEFFECT_IMMUNITY, 0, 0, 0, 0))
                effect = TRUE; // it loops through all battlers, so we increment after its done with all battlers
            else
                gBattleScripting.moveendState++;
            break;
        case MOVEEND_SYNCHRONIZE_ATTACKER: // attacker synchronize
            if (AbilityBattleEffects(ABILITYEFFECT_ATK_SYNCHRONIZE, gBattlerAttacker, 0, 0, 0))
                effect = TRUE;
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_CHOICE_MOVE: // update choice band move
            if (gHitMarker & HITMARKER_OBEYS
             && holdEffectAtk == HOLD_EFFECT_CHOICE_BAND
             && gChosenMove != MOVE_STRUGGLE
             && (*choicedMoveAtk == MOVE_NONE || *choicedMoveAtk == MOVE_UNAVAILABLE))
            {
                if (gChosenMove == MOVE_BATON_PASS && !(gMoveResultFlags & MOVE_RESULT_FAILED))
                {
                    gBattleScripting.moveendState++;
                    break;
                }
                *choicedMoveAtk = gChosenMove;
            }
            for (i = 0; i < MAX_MON_MOVES; i++)
            {
                if (gBattleMons[gBattlerAttacker].moves[i] == *choicedMoveAtk)
                    break;
            }
            if (i == MAX_MON_MOVES)
                *choicedMoveAtk = MOVE_NONE;
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_CHANGED_ITEMS: // changed held items
            for (i = 0; i < gBattlersCount; i++)
            {
                u16 *changedItem = &gBattleStruct->changedItems[i];
                if (*changedItem != ITEM_NONE)
                {
                    gBattleMons[i].item = *changedItem;
                    *changedItem = ITEM_NONE;
                }
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_ITEM_EFFECTS_ALL: // item effects for all battlers
            if (ItemBattleEffects(ITEMEFFECT_MOVE_END, 0, FALSE))
                effect = TRUE;
            else
                gBattleScripting.moveendState++;
            break;
        case MOVEEND_KINGSROCK_SHELLBELL: // king's rock and shell bell
            if (ItemBattleEffects(ITEMEFFECT_KINGSROCK, 0, FALSE))
                effect = TRUE;
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_ATTACKER_INVISIBLE: // make attacker sprite invisible
            if (gStatuses3[gBattlerAttacker] & (STATUS3_SEMI_INVULNERABLE)
                && gHitMarker & HITMARKER_NO_ANIMATIONS)
            {
                gActiveBattler = gBattlerAttacker;
                BtlController_EmitSpriteInvisibility(BUFFER_A, TRUE);
                MarkBattlerForControllerExec(gActiveBattler);
                gBattleScripting.moveendState++;
                return;
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_ATTACKER_VISIBLE: // make attacker sprite visible
            if (gMoveResultFlags & MOVE_RESULT_NO_EFFECT
                || !(gStatuses3[gBattlerAttacker] & (STATUS3_SEMI_INVULNERABLE))
                || WasUnableToUseMove(gBattlerAttacker))
            {
                gActiveBattler = gBattlerAttacker;
                BtlController_EmitSpriteInvisibility(BUFFER_A, FALSE);
                MarkBattlerForControllerExec(gActiveBattler);
                gStatuses3[gBattlerAttacker] &= ~STATUS3_SEMI_INVULNERABLE;
                gSpecialStatuses[gBattlerAttacker].restoredBattlerSprite = 1;
                gBattleScripting.moveendState++;
                return;
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_TARGET_VISIBLE: // make target sprite visible
            if (!gSpecialStatuses[gBattlerTarget].restoredBattlerSprite && gBattlerTarget < gBattlersCount
                && !(gStatuses3[gBattlerTarget] & STATUS3_SEMI_INVULNERABLE))
            {
                gActiveBattler = gBattlerTarget;
                BtlController_EmitSpriteInvisibility(BUFFER_A, FALSE);
                MarkBattlerForControllerExec(gActiveBattler);
                gStatuses3[gBattlerTarget] &= ~STATUS3_SEMI_INVULNERABLE;
                gBattleScripting.moveendState++;
                return;
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_SUBSTITUTE: // update substitute
            for (i = 0; i < gBattlersCount; i++)
            {
                if (gDisableStructs[i].substituteHP == 0)
                    gBattleMons[i].status2 &= ~STATUS2_SUBSTITUTE;
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_UPDATE_LAST_MOVES:
            if (gHitMarker & HITMARKER_SWAP_ATTACKER_TARGET)
            {
                gActiveBattler = gBattlerAttacker;
                gBattlerAttacker = gBattlerTarget;
                gBattlerTarget = gActiveBattler;
                gHitMarker &= ~HITMARKER_SWAP_ATTACKER_TARGET;
            }
            if (gHitMarker & HITMARKER_ATTACKSTRING_PRINTED)
            {
                gLastPrintedMoves[gBattlerAttacker] = gChosenMove;
            }
            if (!(gAbsentBattlerFlags & gBitTable[gBattlerAttacker])
                && !(gBattleStruct->absentBattlerFlags & gBitTable[gBattlerAttacker])
                && gMovesInfo[originallyUsedMove].effect != EFFECT_BATON_PASS)
            {
                if (gHitMarker & HITMARKER_OBEYS)
                {
                    gLastMoves[gBattlerAttacker] = gChosenMove;
                    gLastResultingMoves[gBattlerAttacker] = gCurrentMove;
                }
                else
                {
                    gLastMoves[gBattlerAttacker] = MOVE_UNAVAILABLE;
                    gLastResultingMoves[gBattlerAttacker] = MOVE_UNAVAILABLE;
                }

                if (!(gHitMarker & HITMARKER_FAINTED(gBattlerTarget)))
                    gLastHitBy[gBattlerTarget] = gBattlerAttacker;

                if (gHitMarker & HITMARKER_OBEYS && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
                {
                    if (gChosenMove == MOVE_UNAVAILABLE)
                    {
                        gLastLandedMoves[gBattlerTarget] = gChosenMove;
                    }
                    else
                    {
                        gLastLandedMoves[gBattlerTarget] = gCurrentMove;
                        GET_MOVE_TYPE(gCurrentMove, gLastHitByType[gBattlerTarget]);
                    }
                }
                else
                {
                    gLastLandedMoves[gBattlerTarget] = MOVE_UNAVAILABLE;
                }
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_MIRROR_MOVE: // mirror move
            if (!(gAbsentBattlerFlags & gBitTable[gBattlerAttacker])
                && !(gBattleStruct->absentBattlerFlags & gBitTable[gBattlerAttacker])
                && !gMovesInfo[originallyUsedMove].mirrorMoveBanned
                && gHitMarker & HITMARKER_OBEYS
                && gBattlerAttacker != gBattlerTarget
                && !(gHitMarker & HITMARKER_FAINTED(gBattlerTarget))
                && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
            {
                u8 target, attacker;

                *(gBattleStruct->lastTakenMove + gBattlerTarget * 2 + 0) = gChosenMove;
                *(gBattleStruct->lastTakenMove + gBattlerTarget * 2 + 1) = gChosenMove >> 8;

                target = gBattlerTarget;
                attacker = gBattlerAttacker;
                *(attacker * 2 + target * 8 + (u8 *)(gBattleStruct->lastTakenMoveFrom) + 0) = gChosenMove;

                target = gBattlerTarget;
                attacker = gBattlerAttacker;
                *(attacker * 2 + target * 8 + (u8 *)(gBattleStruct->lastTakenMoveFrom) + 1) = gChosenMove >> 8;
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_NEXT_TARGET: // For moves hitting two opposing Pokemon.
            if (!(gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE) && gBattleTypeFlags & BATTLE_TYPE_DOUBLE
                && !gProtectStructs[gBattlerAttacker].chargingTurn && gMovesInfo[gCurrentMove].target == MOVE_TARGET_BOTH
                && !(gHitMarker & HITMARKER_NO_ATTACKSTRING))
            {
                u8 battlerId = GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerPosition(gBattlerTarget)));
                if (gBattleMons[battlerId].hp != 0)
                {
                    gBattlerTarget = battlerId;
                    gHitMarker |= HITMARKER_NO_ATTACKSTRING;
                    gBattleScripting.moveendState = 0;
                    MoveValuesCleanUp();
                    BattleScriptPush(gBattleScriptsForMoveEffects[gMovesInfo[gCurrentMove].effect]);
                    gBattlescriptCurrInstr = BattleScript_FlushMessageBox;
                    return;
                }
                else
                {
                    gHitMarker |= HITMARKER_NO_ATTACKSTRING;
                }
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_COUNT:
            break;
        }

        if (endMode == 1 && effect == FALSE)
            gBattleScripting.moveendState = MOVEEND_COUNT;
        if (endMode == 2 && endState == gBattleScripting.moveendState)
            gBattleScripting.moveendState = MOVEEND_COUNT;

    } while (gBattleScripting.moveendState != MOVEEND_COUNT && effect == FALSE);

    if (gBattleScripting.moveendState == MOVEEND_COUNT && effect == FALSE)
        gBattlescriptCurrInstr += 3;
}

static void Cmd_typecalc2(void)
{
    u8 flags = 0;
    s32 i = 0;
    u8 moveType = gMovesInfo[gCurrentMove].type;

    if (gBattleMons[gBattlerTarget].ability == ABILITY_LEVITATE && moveType == TYPE_GROUND)
    {
        gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
        gMoveResultFlags |= (MOVE_RESULT_MISSED | MOVE_RESULT_DOESNT_AFFECT_FOE);
        gLastLandedMoves[gBattlerTarget] = 0;
        gBattleCommunication[MISS_TYPE] = B_MSG_GROUND_MISS;
        RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
    }
    else
    {
        while (TYPE_EFFECT_ATK_TYPE(i) != TYPE_ENDTABLE)
        {
            if (TYPE_EFFECT_ATK_TYPE(i) == TYPE_FORESIGHT)
            {
                if (gBattleMons[gBattlerTarget].status2 & STATUS2_FORESIGHT)
                {
                    break;
                }
                else
                {
                    i += 3;
                    continue;
                }
            }

            if (TYPE_EFFECT_ATK_TYPE(i) == moveType)
            {
                // check type1
                if (TYPE_EFFECT_DEF_TYPE(i) == gBattleMons[gBattlerTarget].type1)
                {
                    if (TYPE_EFFECT_MULTIPLIER(i) == TYPE_MUL_NO_EFFECT)
                    {
                        gMoveResultFlags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
                        break;
                    }
                    if (TYPE_EFFECT_MULTIPLIER(i) == TYPE_MUL_NOT_EFFECTIVE)
                    {
                        flags |= MOVE_RESULT_NOT_VERY_EFFECTIVE;
                    }
                    if (TYPE_EFFECT_MULTIPLIER(i) == TYPE_MUL_SUPER_EFFECTIVE)
                    {
                        flags |= MOVE_RESULT_SUPER_EFFECTIVE;
                    }
                }
                // check type2
                if (TYPE_EFFECT_DEF_TYPE(i) == gBattleMons[gBattlerTarget].type2)
                {
                    if (gBattleMons[gBattlerTarget].type1 != gBattleMons[gBattlerTarget].type2
                        && TYPE_EFFECT_MULTIPLIER(i) == TYPE_MUL_NO_EFFECT)
                    {
                        gMoveResultFlags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
                        break;
                    }
                    if (TYPE_EFFECT_DEF_TYPE(i) == gBattleMons[gBattlerTarget].type2
                        && gBattleMons[gBattlerTarget].type1 != gBattleMons[gBattlerTarget].type2
                        && TYPE_EFFECT_MULTIPLIER(i) == TYPE_MUL_NOT_EFFECTIVE)
                    {
                        flags |= MOVE_RESULT_NOT_VERY_EFFECTIVE;
                    }
                    if (TYPE_EFFECT_DEF_TYPE(i) == gBattleMons[gBattlerTarget].type2
                        && gBattleMons[gBattlerTarget].type1 != gBattleMons[gBattlerTarget].type2
                        && TYPE_EFFECT_MULTIPLIER(i) == TYPE_MUL_SUPER_EFFECTIVE)
                    {
                        flags |= MOVE_RESULT_SUPER_EFFECTIVE;
                    }
                }
            }
            i += 3;
        }
    }

    if (gBattleMons[gBattlerTarget].ability == ABILITY_WONDER_GUARD
        && !(flags & MOVE_RESULT_NO_EFFECT)
        && AttacksThisTurn(gBattlerAttacker, gCurrentMove) == 2
        && (!(flags & MOVE_RESULT_SUPER_EFFECTIVE) || ((flags & (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE)) == (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE)))
        && gMovesInfo[gCurrentMove].power)
    {
        gLastUsedAbility = ABILITY_WONDER_GUARD;
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gLastLandedMoves[gBattlerTarget] = 0;
        gBattleCommunication[MISS_TYPE] = B_MSG_AVOIDED_DMG;
        RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
    }
    if (gMoveResultFlags & MOVE_RESULT_DOESNT_AFFECT_FOE)
        gProtectStructs[gBattlerAttacker].targetNotAffected = 1;

    gBattlescriptCurrInstr++;
}

static void Cmd_returnatktoball(void)
{
    gActiveBattler = gBattlerAttacker;
    if (!(gHitMarker & HITMARKER_FAINTED(gActiveBattler)))
    {
        BtlController_EmitReturnMonToBall(BUFFER_A, FALSE);
        MarkBattlerForControllerExec(gActiveBattler);
    }
    gBattlescriptCurrInstr++;
}

static void Cmd_getswitchedmondata(void)
{
    if (gBattleControllerExecFlags)
        return;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);

    gBattlerPartyIndexes[gActiveBattler] = *(gBattleStruct->monToSwitchIntoId + gActiveBattler);

    BtlController_EmitGetMonData(BUFFER_A, REQUEST_ALL_BATTLE, gBitTable[gBattlerPartyIndexes[gActiveBattler]]);
    MarkBattlerForControllerExec(gActiveBattler);

    gBattlescriptCurrInstr += 2;
}

static void Cmd_switchindataupdate(void)
{
    struct BattlePokemon oldData;
    s32 i;
    u8 *monData;

    if (gBattleControllerExecFlags)
        return;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    oldData = gBattleMons[gActiveBattler];
    monData = (u8 *)(&gBattleMons[gActiveBattler]);

    for (i = 0; i < sizeof(struct BattlePokemon); i++)
        monData[i] = gBattleBufferB[gActiveBattler][4 + i];

    gBattleMons[gActiveBattler].type1 = gSpeciesInfo[gBattleMons[gActiveBattler].species].types[0];
    gBattleMons[gActiveBattler].type2 = gSpeciesInfo[gBattleMons[gActiveBattler].species].types[1];
    gBattleMons[gActiveBattler].ability = GetAbilityBySpecies(gBattleMons[gActiveBattler].species, gBattleMons[gActiveBattler].abilityNum);

    // check knocked off item
    i = GetBattlerSide(gActiveBattler);
    if (gWishFutureKnock.knockedOffMons[i] & gBitTable[gBattlerPartyIndexes[gActiveBattler]])
    {
        gBattleMons[gActiveBattler].item = ITEM_NONE;
    }

    if (gMovesInfo[gCurrentMove].effect == EFFECT_BATON_PASS)
    {
        for (i = 0; i < NUM_BATTLE_STATS; i++)
        {
            gBattleMons[gActiveBattler].statStages[i] = oldData.statStages[i];
        }
        gBattleMons[gActiveBattler].status2 = oldData.status2;
    }

    SwitchInClearSetData(gActiveBattler);

    gBattleScripting.battler = gActiveBattler;

    PREPARE_MON_NICK_BUFFER(gBattleTextBuff1, gActiveBattler, gBattlerPartyIndexes[gActiveBattler]);

    gBattlescriptCurrInstr += 2;
}

static void Cmd_switchinanim(void)
{
    if (gBattleControllerExecFlags)
        return;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);

    if (GetBattlerSide(gActiveBattler) == B_SIDE_OPPONENT
        && !(gBattleTypeFlags & (BATTLE_TYPE_LINK
                                 | BATTLE_TYPE_LEGENDARY
                                 | BATTLE_TYPE_OLD_MAN_TUTORIAL
                                 | BATTLE_TYPE_POKEDUDE
                                 | BATTLE_TYPE_EREADER_TRAINER
                                 | BATTLE_TYPE_GHOST)))
        HandleSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gActiveBattler].species), FLAG_SET_SEEN, gBattleMons[gActiveBattler].personality);

    gAbsentBattlerFlags &= ~(gBitTable[gActiveBattler]);

    BtlController_EmitSwitchInAnim(BUFFER_A, gBattlerPartyIndexes[gActiveBattler], gBattlescriptCurrInstr[2]);
    MarkBattlerForControllerExec(gActiveBattler);

    gBattlescriptCurrInstr += 3;
}

bool32 CanBattlerSwitch(u32 battler)
{
    s32 i, lastMonId, battlerIn1, battlerIn2;
    bool32 ret = FALSE;
    struct Pokemon *party;

    if (BATTLE_TWO_VS_ONE_OPPONENT && GetBattlerSide(battler) == B_SIDE_OPPONENT)
    {
        battlerIn1 = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
        battlerIn2 = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
        party = gEnemyParty;

        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (GetMonData(&party[i], MON_DATA_HP) != 0
             && GetMonData(&party[i], MON_DATA_SPECIES) != SPECIES_NONE
             && !GetMonData(&party[i], MON_DATA_IS_EGG)
             && i != gBattlerPartyIndexes[battlerIn1] && i != gBattlerPartyIndexes[battlerIn2])
                break;
        }

        ret = (i != PARTY_SIZE);
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER)
    {
        party = GetBattlerParty(battler);

        lastMonId = 0;
        if (battler & 2)
            lastMonId = MULTI_PARTY_SIZE;

        for (i = lastMonId; i < lastMonId + MULTI_PARTY_SIZE; i++)
        {
            if (GetMonData(&party[i], MON_DATA_SPECIES) != SPECIES_NONE
             && !GetMonData(&party[i], MON_DATA_IS_EGG)
             && GetMonData(&party[i], MON_DATA_HP) != 0
             && gBattlerPartyIndexes[battler] != i)
                break;
        }

        ret = (i != lastMonId + MULTI_PARTY_SIZE);
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        if (gBattleTypeFlags & BATTLE_TYPE_TOWER_LINK_MULTI)
        {
            if (GetBattlerSide(battler) == B_SIDE_PLAYER)
            {
                party = gPlayerParty;

                lastMonId = 0;
                if (GetLinkTrainerFlankId(GetBattlerMultiplayerId(battler)) == TRUE)
                    lastMonId = MULTI_PARTY_SIZE;
            }
            else
            {
                party = gEnemyParty;

                if (battler == 1)
                    lastMonId = 0;
                else
                    lastMonId = MULTI_PARTY_SIZE;
            }
        }
        else
        {
            party = GetBattlerParty(battler);

            lastMonId = 0;
            if (GetLinkTrainerFlankId(GetBattlerMultiplayerId(battler)) == TRUE)
                lastMonId = MULTI_PARTY_SIZE;
        }

        for (i = lastMonId; i < lastMonId + MULTI_PARTY_SIZE; i++)
        {
            if (GetMonData(&party[i], MON_DATA_SPECIES) != SPECIES_NONE
             && !GetMonData(&party[i], MON_DATA_IS_EGG)
             && GetMonData(&party[i], MON_DATA_HP) != 0
             && gBattlerPartyIndexes[battler] != i)
                break;
        }

        ret = (i != lastMonId + MULTI_PARTY_SIZE);
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS && GetBattlerSide(battler) == B_SIDE_OPPONENT)
    {
        party = gEnemyParty;

        lastMonId = 0;
        if (battler == B_POSITION_OPPONENT_RIGHT)
            lastMonId = PARTY_SIZE / 2;

        for (i = lastMonId; i < lastMonId + (PARTY_SIZE / 2); i++)
        {
            if (GetMonData(&party[i], MON_DATA_SPECIES) != SPECIES_NONE
             && !GetMonData(&party[i], MON_DATA_IS_EGG)
             && GetMonData(&party[i], MON_DATA_HP) != 0
             && gBattlerPartyIndexes[battler] != i)
                break;
        }

        ret = (i != lastMonId + (PARTY_SIZE / 2));
    }
    else
    {
        if (GetBattlerSide(battler) == B_SIDE_OPPONENT)
        {
            battlerIn1 = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);

            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                battlerIn2 = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
            else
                battlerIn2 = battlerIn1;

            party = gEnemyParty;
        }
        else
        {
            // Check if attacker side has mon to switch into
            battlerIn1 = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);

            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                battlerIn2 = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
            else
                battlerIn2 = battlerIn1;

            party = gPlayerParty;
        }

        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (GetMonData(&party[i], MON_DATA_HP) != 0
             && GetMonData(&party[i], MON_DATA_SPECIES) != SPECIES_NONE
             && !GetMonData(&party[i], MON_DATA_IS_EGG)
             && i != gBattlerPartyIndexes[battlerIn1] && i != gBattlerPartyIndexes[battlerIn2])
                break;
        }

        ret = (i != PARTY_SIZE);
    }
    return ret;
}

static void Cmd_jumpifcantswitch(void)
{
    s32 i;
    s32 lastMonId;
    struct Pokemon *party;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1] & ~SWITCH_IGNORE_ESCAPE_PREVENTION);
    if (!(gBattlescriptCurrInstr[1] & SWITCH_IGNORE_ESCAPE_PREVENTION)
        && ((gBattleMons[gActiveBattler].status2 & (STATUS2_WRAPPED | STATUS2_ESCAPE_PREVENTION))
            || (gStatuses3[gActiveBattler] & STATUS3_ROOTED)))
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        if (GetBattlerSide(gActiveBattler) == B_SIDE_OPPONENT)
            party = gEnemyParty;
        else
            party = gPlayerParty;

        i = 0;
        if (GetLinkTrainerFlankId(GetBattlerMultiplayerId(gActiveBattler)) == TRUE)
            i = 3;
        for (lastMonId = i + 3; i < lastMonId; i++)
        {
            if (GetMonData(&party[i], MON_DATA_SPECIES) != SPECIES_NONE
             && !GetMonData(&party[i], MON_DATA_IS_EGG)
             && GetMonData(&party[i], MON_DATA_HP) != 0
             && gBattlerPartyIndexes[gActiveBattler] != i)
                break;
        }

        if (i == lastMonId)
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
        else
            gBattlescriptCurrInstr += 6;
    }
    else
    {
        u8 battlerIn1, battlerIn2;

        if (GetBattlerSide(gActiveBattler) == B_SIDE_OPPONENT)
        {
            battlerIn1 = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);

            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                battlerIn2 = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
            else
                battlerIn2 = battlerIn1;

            party = gEnemyParty;
        }
        else
        {
            battlerIn1 = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);

            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                battlerIn2 = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
            else
                battlerIn2 = battlerIn1;

            party = gPlayerParty;
        }

        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (GetMonData(&party[i], MON_DATA_HP) != 0
             && GetMonData(&party[i], MON_DATA_SPECIES) != SPECIES_NONE
             && !GetMonData(&party[i], MON_DATA_IS_EGG)
             && i != gBattlerPartyIndexes[battlerIn1] && i != gBattlerPartyIndexes[battlerIn2])
                break;
        }

        if (i == PARTY_SIZE)
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
        else
            gBattlescriptCurrInstr += 6;
    }
}

// Opens the party screen to choose a new Pokémon to send out.
// slotId is the Pokémon to replace.
// Note that this is not used by the Switch action, only replacing fainted Pokémon or Baton Pass
static void ChooseMonToSendOut(u8 slotId)
{
    *(gBattleStruct->battlerPartyIndexes + gActiveBattler) = gBattlerPartyIndexes[gActiveBattler];
    BtlController_EmitChoosePokemon(BUFFER_A, PARTY_ACTION_SEND_OUT, slotId, ABILITY_NONE, gBattleStruct->battlerPartyOrders[gActiveBattler]);
    MarkBattlerForControllerExec(gActiveBattler);
}

static void Cmd_openpartyscreen(void)
{
    u32 flags;
    u8 hitmarkerFaintBits;
    u8 battlerId;
    const u8 *jumpPtr;

    battlerId = 0;
    flags = 0;
    jumpPtr = T1_READ_PTR(gBattlescriptCurrInstr + 2);

    if (gBattlescriptCurrInstr[1] == BS_FAINTED_LINK_MULTIPLE_1)
    {
        if ((gBattleTypeFlags & (BATTLE_TYPE_DOUBLE | BATTLE_TYPE_MULTI)) != BATTLE_TYPE_DOUBLE)
        {
            for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
            {
                if (gHitMarker & HITMARKER_FAINTED(gActiveBattler))
                {
                    if (HasNoMonsToSwitch(gActiveBattler, PARTY_SIZE, PARTY_SIZE))
                    {
                        gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                        gHitMarker &= ~HITMARKER_FAINTED(gActiveBattler);
                        BtlController_EmitLinkStandbyMsg(BUFFER_A, LINK_STANDBY_MSG_ONLY);
                        MarkBattlerForControllerExec(gActiveBattler);
                    }
                    else if (!gSpecialStatuses[gActiveBattler].faintedHasReplacement)
                    {
                        ChooseMonToSendOut(PARTY_SIZE);
                        gSpecialStatuses[gActiveBattler].faintedHasReplacement = TRUE;
                    }
                }
                else
                {
                    BtlController_EmitLinkStandbyMsg(BUFFER_A, LINK_STANDBY_MSG_ONLY);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
            }
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
        {
            bool8 hasReplacement_0, hasReplacement_1, hasReplacement_2, hasReplacement_3;

            hitmarkerFaintBits = gHitMarker >> 28;

            if (gBitTable[0] & hitmarkerFaintBits)
            {
                gActiveBattler = 0;
                if (HasNoMonsToSwitch(gActiveBattler, PARTY_SIZE, PARTY_SIZE))
                {
                    gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                    gHitMarker &= ~HITMARKER_FAINTED(gActiveBattler);
                    BtlController_EmitCantSwitch(BUFFER_A);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
                else if (!gSpecialStatuses[gActiveBattler].faintedHasReplacement)
                {
                    ChooseMonToSendOut(gBattleStruct->monToSwitchIntoId[2]);
                    gSpecialStatuses[gActiveBattler].faintedHasReplacement = TRUE;
                }
                else
                {
                    BtlController_EmitLinkStandbyMsg(BUFFER_A, LINK_STANDBY_MSG_ONLY);
                    MarkBattlerForControllerExec(gActiveBattler);
                    flags |= 1;
                }
            }
            if (gBitTable[2] & hitmarkerFaintBits && !(gBitTable[0] & hitmarkerFaintBits))
            {
                gActiveBattler = 2;
                if (HasNoMonsToSwitch(gActiveBattler, PARTY_SIZE, PARTY_SIZE))
                {
                    gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                    gHitMarker &= ~HITMARKER_FAINTED(gActiveBattler);
                    BtlController_EmitCantSwitch(BUFFER_A);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
                else if (!gSpecialStatuses[gActiveBattler].faintedHasReplacement)
                {
                    ChooseMonToSendOut(gBattleStruct->monToSwitchIntoId[0]);
                    gSpecialStatuses[gActiveBattler].faintedHasReplacement = TRUE;
                }
                else if (!(flags & 1))
                {
                    BtlController_EmitLinkStandbyMsg(BUFFER_A, LINK_STANDBY_MSG_ONLY);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
            }
            if (gBitTable[1] & hitmarkerFaintBits)
            {
                gActiveBattler = 1;
                if (HasNoMonsToSwitch(gActiveBattler, PARTY_SIZE, PARTY_SIZE))
                {
                    gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                    gHitMarker &= ~HITMARKER_FAINTED(gActiveBattler);
                    BtlController_EmitCantSwitch(BUFFER_A);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
                else if (!gSpecialStatuses[gActiveBattler].faintedHasReplacement)
                {
                    ChooseMonToSendOut(gBattleStruct->monToSwitchIntoId[3]);
                    gSpecialStatuses[gActiveBattler].faintedHasReplacement = TRUE;
                }
                else
                {
                    BtlController_EmitLinkStandbyMsg(BUFFER_A, LINK_STANDBY_MSG_ONLY);
                    MarkBattlerForControllerExec(gActiveBattler);
                    flags |= 2;
                }
            }
            if (gBitTable[3] & hitmarkerFaintBits && !(gBitTable[1] & hitmarkerFaintBits))
            {
                gActiveBattler = 3;
                if (HasNoMonsToSwitch(gActiveBattler, PARTY_SIZE, PARTY_SIZE))
                {
                    gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                    gHitMarker &= ~HITMARKER_FAINTED(gActiveBattler);
                    BtlController_EmitCantSwitch(BUFFER_A);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
                else if (!gSpecialStatuses[gActiveBattler].faintedHasReplacement)
                {
                    ChooseMonToSendOut(gBattleStruct->monToSwitchIntoId[1]);
                    gSpecialStatuses[gActiveBattler].faintedHasReplacement = TRUE;
                }
                else if (!(flags & 2))
                {
                    BtlController_EmitLinkStandbyMsg(BUFFER_A, LINK_STANDBY_MSG_ONLY);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
            }

            hasReplacement_0 = gSpecialStatuses[0].faintedHasReplacement;
            if (!hasReplacement_0)
            {
                hasReplacement_2 = gSpecialStatuses[2].faintedHasReplacement;
                if (!hasReplacement_2 && hitmarkerFaintBits != 0)
                {
                    if (gAbsentBattlerFlags & gBitTable[0])
                        gActiveBattler = 2;
                    else
                        gActiveBattler = 0;

                    BtlController_EmitLinkStandbyMsg(BUFFER_A, LINK_STANDBY_MSG_ONLY);
                    MarkBattlerForControllerExec(gActiveBattler);
                }

            }
            hasReplacement_1 = gSpecialStatuses[1].faintedHasReplacement;
            if (!hasReplacement_1)
            {
                hasReplacement_3 = gSpecialStatuses[3].faintedHasReplacement;
                if (!hasReplacement_3 && hitmarkerFaintBits != 0)
                {
                    if (gAbsentBattlerFlags & gBitTable[1])
                        gActiveBattler = 3;
                    else
                        gActiveBattler = 1;

                    BtlController_EmitLinkStandbyMsg(BUFFER_A, LINK_STANDBY_MSG_ONLY);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
            }
        }
        gBattlescriptCurrInstr += 6;
    }
    else if (gBattlescriptCurrInstr[1] == BS_FAINTED_LINK_MULTIPLE_2)
    {
        if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
            {
                hitmarkerFaintBits = gHitMarker >> 28;
                if (gBitTable[2] & hitmarkerFaintBits && gBitTable[0] & hitmarkerFaintBits)
                {
                    gActiveBattler = 2;
                    if (HasNoMonsToSwitch(gActiveBattler, gBattleBufferB[0][1], PARTY_SIZE))
                    {
                        gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                        gHitMarker &= ~HITMARKER_FAINTED(gActiveBattler);
                        BtlController_EmitCantSwitch(BUFFER_A);
                        MarkBattlerForControllerExec(gActiveBattler);
                    }
                    else if (!gSpecialStatuses[gActiveBattler].faintedHasReplacement)
                    {
                        ChooseMonToSendOut(gBattleStruct->monToSwitchIntoId[0]);
                        gSpecialStatuses[gActiveBattler].faintedHasReplacement = TRUE;
                    }
                }
                if (gBitTable[3] & hitmarkerFaintBits && hitmarkerFaintBits & gBitTable[1])
                {
                    gActiveBattler = 3;
                    if (HasNoMonsToSwitch(gActiveBattler, gBattleBufferB[1][1], PARTY_SIZE))
                    {
                        gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                        gHitMarker &= ~HITMARKER_FAINTED(gActiveBattler);
                        BtlController_EmitCantSwitch(BUFFER_A);
                        MarkBattlerForControllerExec(gActiveBattler);
                    }
                    else if (!gSpecialStatuses[gActiveBattler].faintedHasReplacement)
                    {
                        ChooseMonToSendOut(gBattleStruct->monToSwitchIntoId[1]);
                        gSpecialStatuses[gActiveBattler].faintedHasReplacement = TRUE;
                    }
                }
                gBattlescriptCurrInstr += 6;
            }
            else
            {
                // Not multi or double battle
                gBattlescriptCurrInstr += 6;
            }
        }
        else
        {
            // Multi battle
            gBattlescriptCurrInstr += 6;
        }

        hitmarkerFaintBits = gHitMarker >> 28;

        gBattlerFainted = 0;
        while (!(gBitTable[gBattlerFainted] & hitmarkerFaintBits)
               && gBattlerFainted < gBattlersCount)
            gBattlerFainted++;

        if (gBattlerFainted == gBattlersCount)
            gBattlescriptCurrInstr = jumpPtr;
    }
    else
    {
        if (gBattlescriptCurrInstr[1] & PARTY_SCREEN_OPTIONAL)
            hitmarkerFaintBits = PARTY_ACTION_CHOOSE_MON; // Used here as the caseId for the EmitChoose function.
        else
            hitmarkerFaintBits = PARTY_ACTION_SEND_OUT;

        battlerId = GetBattlerForBattleScript(gBattlescriptCurrInstr[1] & ~PARTY_SCREEN_OPTIONAL);
        if (gSpecialStatuses[battlerId].faintedHasReplacement)
        {
            gBattlescriptCurrInstr += 6;
        }
        else if (HasNoMonsToSwitch(battlerId, PARTY_SIZE, PARTY_SIZE))
        {
            gActiveBattler = battlerId;
            gAbsentBattlerFlags |= gBitTable[gActiveBattler];
            gHitMarker &= ~HITMARKER_FAINTED(gActiveBattler);
            gBattlescriptCurrInstr = jumpPtr;
        }
        else
        {
            gActiveBattler = battlerId;
            *(gBattleStruct->battlerPartyIndexes + gActiveBattler) = gBattlerPartyIndexes[gActiveBattler];

            BtlController_EmitChoosePokemon(BUFFER_A, hitmarkerFaintBits, *(gBattleStruct->monToSwitchIntoId + (gActiveBattler ^ 2)), 0, gBattleStruct->battlerPartyOrders[gActiveBattler]);
            MarkBattlerForControllerExec(gActiveBattler);

            gBattlescriptCurrInstr += 6;

            if (GetBattlerPosition(gActiveBattler) == B_POSITION_PLAYER_LEFT && gBattleResults.playerSwitchesCounter < 255)
                gBattleResults.playerSwitchesCounter++;

            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                for (gActiveBattler = 0; gActiveBattler < gBattlersCount; gActiveBattler++)
                {
                    if (gActiveBattler != battlerId)
                    {
                        BtlController_EmitLinkStandbyMsg(BUFFER_A, LINK_STANDBY_MSG_ONLY);
                        MarkBattlerForControllerExec(gActiveBattler);
                    }
                }
            }
            else
            {
                gActiveBattler = GetBattlerAtPosition(GetBattlerPosition(battlerId) ^ BIT_SIDE);
                if (gAbsentBattlerFlags & gBitTable[gActiveBattler])
                    gActiveBattler ^= BIT_FLANK;

                BtlController_EmitLinkStandbyMsg(BUFFER_A, LINK_STANDBY_MSG_ONLY);
                MarkBattlerForControllerExec(gActiveBattler);
            }
        }
    }
}

static void Cmd_switchhandleorder(void)
{
    s32 i;
    if (gBattleControllerExecFlags)
        return;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);

    switch (gBattlescriptCurrInstr[2])
    {
    case 0:
        for (i = 0; i < gBattlersCount; i++)
        {
            if (gBattleBufferB[i][0] == CONTROLLER_CHOSENMONRETURNVALUE)
            {
                *(gBattleStruct->monToSwitchIntoId + i) = gBattleBufferB[i][1];
            }
        }
        break;
    case 1:
        if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI))
            UpdatePartyOwnerOnSwitch_NonMulti(gActiveBattler);
        break;
    case 2:
        gBattleCommunication[0] = gBattleBufferB[gActiveBattler][1];
        *(gBattleStruct->monToSwitchIntoId + gActiveBattler) = gBattleBufferB[gActiveBattler][1];

        if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
        {
            *(gActiveBattler * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 0) &= 0xF;
            *(gActiveBattler * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 0) |= (gBattleBufferB[gActiveBattler][2] & 0xF0);
            *(gActiveBattler * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 1) = gBattleBufferB[gActiveBattler][3];

            *((gActiveBattler ^ BIT_FLANK) * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 0) &= (0xF0);
            *((gActiveBattler ^ BIT_FLANK) * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 0) |= (gBattleBufferB[gActiveBattler][2] & 0xF0) >> 4;
            *((gActiveBattler ^ BIT_FLANK) * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 2) = gBattleBufferB[gActiveBattler][3];
        }
        else
        {
            UpdatePartyOwnerOnSwitch_NonMulti(gActiveBattler);
        }
        PREPARE_SPECIES_BUFFER(gBattleTextBuff1, gBattleMons[gBattlerAttacker].species)
        PREPARE_MON_NICK_BUFFER(gBattleTextBuff2, gActiveBattler, gBattleBufferB[gActiveBattler][1])

        break;
    }

    gBattlescriptCurrInstr += 3;
}

static void Cmd_switchineffects(void)
{
    s32 i;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    UpdateSentPokesToOpponentValue(gActiveBattler);

    gHitMarker &= ~HITMARKER_FAINTED(gActiveBattler);
    gSpecialStatuses[gActiveBattler].faintedHasReplacement = FALSE;

    if (!(gSideStatuses[GetBattlerSide(gActiveBattler)] & SIDE_STATUS_SPIKES_DAMAGED)
        && (gSideStatuses[GetBattlerSide(gActiveBattler)] & SIDE_STATUS_SPIKES)
        && !IS_BATTLER_OF_TYPE(gActiveBattler, TYPE_FLYING)
        && gBattleMons[gActiveBattler].ability != ABILITY_LEVITATE)
    {
        u8 spikesDmg;

        gSideStatuses[GetBattlerSide(gActiveBattler)] |= SIDE_STATUS_SPIKES_DAMAGED;

        // Present in pokeemerald but not here
        // gBattleMons[gActiveBattler].status2 &= ~STATUS2_DESTINY_BOND;
        // gHitMarker &= ~HITMARKER_DESTINYBOND;

        spikesDmg = (5 - gSideTimers[GetBattlerSide(gActiveBattler)].spikesAmount) * 2;
        gBattleMoveDamage = gBattleMons[gActiveBattler].maxHP / (spikesDmg);
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;

        gBattleScripting.battler = gActiveBattler;
        BattleScriptPushCursor();

        if (gBattlescriptCurrInstr[1] == BS_TARGET)
            gBattlescriptCurrInstr = BattleScript_SpikesOnTarget;
        else if (gBattlescriptCurrInstr[1] == BS_ATTACKER)
            gBattlescriptCurrInstr = BattleScript_SpikesOnAttacker;
        else
            gBattlescriptCurrInstr = BattleScript_SpikesOnFaintedBattler;
    }
    else
    {
        // There is a hack here in pokeemerald to ensure the truant counter will be 0 when the battler's next turn starts.
        // The truant counter is not updated in the case where a mon switches in after a lost judgement in the battle arena.
        if (gBattleMons[gActiveBattler].ability == ABILITY_TRUANT)
        //if (gBattleMons[gActiveBattler].ability == ABILITY_TRUANT && !gDisableStructs[gActiveBattler].truantSwitchInHack) // In pokeemerald.
            gDisableStructs[gActiveBattler].truantCounter = 1;

        //gDisableStructs[gActiveBattler].truantSwitchInHack = 0; // In pokeemerald, otherwise unused.

        if (!AbilityBattleEffects(ABILITYEFFECT_ON_SWITCHIN, gActiveBattler, 0, 0, 0)
            && !ItemBattleEffects(ITEMEFFECT_ON_SWITCH_IN, gActiveBattler, FALSE))
        {
            gSideStatuses[GetBattlerSide(gActiveBattler)] &= ~SIDE_STATUS_SPIKES_DAMAGED;

            for (i = 0; i < gBattlersCount; i++)
            {
                if (gBattlerByTurnOrder[i] == gActiveBattler)
                    gActionsByTurnOrder[i] = B_ACTION_CANCEL_PARTNER;
            }

            for (i = 0; i < gBattlersCount; i++)
            {
                u16 *hpOnSwitchout = &gBattleStruct->hpOnSwitchout[GetBattlerSide(i)];
                *hpOnSwitchout = gBattleMons[i].hp;
            }

            if (gBattlescriptCurrInstr[1] == BS_FAINTED_LINK_MULTIPLE_1)
            {
                u32 hitmarkerFaintBits = gHitMarker >> 28;

                gBattlerFainted++;
                while (TRUE)
                {
                    if (hitmarkerFaintBits & gBitTable[gBattlerFainted] && !(gAbsentBattlerFlags & gBitTable[gBattlerFainted]))
                        break;
                    if (gBattlerFainted >= gBattlersCount)
                        break;
                    gBattlerFainted++;
                }
            }
            gBattlescriptCurrInstr += 2;
        }
    }
}

static void Cmd_trainerslidein(void)
{
    if (!gBattlescriptCurrInstr[1])
        gActiveBattler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
    else
        gActiveBattler = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
    BtlController_EmitTrainerSlide(BUFFER_A);
    MarkBattlerForControllerExec(gActiveBattler);

    gBattlescriptCurrInstr += 2;
}

static void Cmd_playse(void)
{
    gActiveBattler = gBattlerAttacker;
    BtlController_EmitPlaySE(BUFFER_A, T2_READ_16(gBattlescriptCurrInstr + 1));
    MarkBattlerForControllerExec(gActiveBattler);

    gBattlescriptCurrInstr += 3;
}

static void Cmd_fanfare(void)
{
    gActiveBattler = gBattlerAttacker;
    BtlController_EmitPlayFanfare(BUFFER_A, T2_READ_16(gBattlescriptCurrInstr + 1));
    MarkBattlerForControllerExec(gActiveBattler);

    gBattlescriptCurrInstr += 3;
}

static void Cmd_playfaintcry(void)
{
    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    BtlController_EmitFaintingCry(BUFFER_A);
    MarkBattlerForControllerExec(gActiveBattler);

    gBattlescriptCurrInstr += 2;
}

static void Cmd_endlinkbattle(void)
{
    gActiveBattler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
    BtlController_EmitEndLinkBattle(BUFFER_A, gBattleOutcome);
    MarkBattlerForControllerExec(gActiveBattler);

    gBattlescriptCurrInstr += 1;
}

static void Cmd_returntoball(void)
{
    CMD_ARGS(u8 battler, bool8 changingForm);

    u32 battler = gActiveBattler = GetBattlerForBattleScript(cmd->battler);
    BtlController_EmitReturnMonToBall(BUFFER_A, TRUE);
    MarkBattlerForControllerExec(battler);

    // Don't always execute a form change here otherwise we can stomp gigantamax
    if(!cmd->changingForm)
        TryBattleFormChange(battler, FORM_CHANGE_BATTLE_SWITCH);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_handlelearnnewmove(void)
{
    const u8 *learnedMovePtr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    const u8 *nothingToLearnPtr = T1_READ_PTR(gBattlescriptCurrInstr + 5);

    u16 learnMove = MonTryLearningNewMove(&gPlayerParty[gBattleStruct->expGetterMonId], gBattlescriptCurrInstr[9]);
    while (learnMove == MON_ALREADY_KNOWS_MOVE)
        learnMove = MonTryLearningNewMove(&gPlayerParty[gBattleStruct->expGetterMonId], FALSE);

    if (learnMove == MOVE_NONE)
    {
        gBattlescriptCurrInstr = nothingToLearnPtr;
    }
    else if (learnMove == MON_HAS_MAX_MOVES)
    {
        gBattlescriptCurrInstr += 10;
    }
    else
    {
        gActiveBattler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);

        if (gBattlerPartyIndexes[gActiveBattler] == gBattleStruct->expGetterMonId
            && !(gBattleMons[gActiveBattler].status2 & STATUS2_TRANSFORMED))
        {
            GiveMoveToBattleMon(&gBattleMons[gActiveBattler], learnMove);
        }
        if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
        {
            gActiveBattler = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
            if (gBattlerPartyIndexes[gActiveBattler] == gBattleStruct->expGetterMonId
                && !(gBattleMons[gActiveBattler].status2 & STATUS2_TRANSFORMED))
            {
                GiveMoveToBattleMon(&gBattleMons[gActiveBattler], learnMove);
            }
        }

        gBattlescriptCurrInstr = learnedMovePtr;
    }
}

static void Cmd_yesnoboxlearnmove(void)
{
    gActiveBattler = 0;

    switch (gBattleScripting.learnMoveState)
    {
    case 0:
        HandleBattleWindow(23, 8, 29, 13, 0);
        BattlePutTextOnWindow(gText_BattleYesNoChoice, B_WIN_YESNO);
        gBattleScripting.learnMoveState++;
        gBattleCommunication[CURSOR_POSITION] = 0;
        BattleCreateYesNoCursorAt();
        break;
    case 1:
        if (JOY_NEW(DPAD_UP) && gBattleCommunication[CURSOR_POSITION] != 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt();
            gBattleCommunication[CURSOR_POSITION] = 0;
            BattleCreateYesNoCursorAt();
        }
        if (JOY_NEW(DPAD_DOWN) && gBattleCommunication[CURSOR_POSITION] == 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt();
            gBattleCommunication[CURSOR_POSITION] = 1;
            BattleCreateYesNoCursorAt();
        }
        if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            if (gBattleCommunication[1] == 0)
            {
                HandleBattleWindow(23, 8, 29, 13, WINDOW_CLEAR);
                BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
                gBattleScripting.learnMoveState++;
            }
            else
            {
                gBattleScripting.learnMoveState = 4;
            }
        }
        else if (JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            gBattleScripting.learnMoveState = 4;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            FreeAllWindowBuffers();
            ShowSelectMovePokemonSummaryScreen(gPlayerParty, gBattleStruct->expGetterMonId, gPlayerPartyCount - 1, ReshowBattleScreenAfterMenu, gMoveToLearn);
            gBattleScripting.learnMoveState++;
        }
        break;
    case 3:
        if (!gPaletteFade.active && gMain.callback2 == BattleMainCB2)
        {
            u8 movePosition = GetMoveSlotToReplace();
            if (movePosition == MAX_MON_MOVES)
            {
                gBattleScripting.learnMoveState = 4;
            }
            else
            {
                u16 moveId = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_MOVE1 + movePosition);
                
                if (IsHMMove2(moveId))
                {
                    PrepareStringBattle(STRINGID_HMMOVESCANTBEFORGOTTEN, gActiveBattler);
                    gBattleScripting.learnMoveState = 5;
                }
                else
                {
                    gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);

                    PREPARE_MOVE_BUFFER(gBattleTextBuff2, moveId)

                    RemoveMonPPBonus(&gPlayerParty[gBattleStruct->expGetterMonId], movePosition);
                    SetMonMoveSlot(&gPlayerParty[gBattleStruct->expGetterMonId], gMoveToLearn, movePosition);

                    if (gBattlerPartyIndexes[0] == gBattleStruct->expGetterMonId && MOVE_IS_PERMANENT(0, movePosition))
                    {
                        RemoveBattleMonPPBonus(&gBattleMons[0], movePosition);
                        SetBattleMonMoveSlot(&gBattleMons[0], gMoveToLearn, movePosition);
                    }
                    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE
                        && gBattlerPartyIndexes[2] == gBattleStruct->expGetterMonId
                        && MOVE_IS_PERMANENT(2, movePosition))
                    {
                        RemoveBattleMonPPBonus(&gBattleMons[2], movePosition);
                        SetBattleMonMoveSlot(&gBattleMons[2], gMoveToLearn, movePosition);
                    }
                }
            }
        }
        break;
    case 4:
        HandleBattleWindow(23, 8, 29, 13, WINDOW_CLEAR);
        gBattlescriptCurrInstr += 5;
        break;
    case 5:
        if (gBattleControllerExecFlags == 0)
        {
            gBattleScripting.learnMoveState = 2;
        }
        break;
    }
}

static void Cmd_yesnoboxstoplearningmove(void)
{
    switch (gBattleScripting.learnMoveState)
    {
    case 0:
        HandleBattleWindow(23, 8, 29, 13, 0);
        BattlePutTextOnWindow(gText_BattleYesNoChoice, B_WIN_YESNO);
        gBattleScripting.learnMoveState++;
        gBattleCommunication[CURSOR_POSITION] = 0;
        BattleCreateYesNoCursorAt();
        break;
    case 1:
        if (JOY_NEW(DPAD_UP) && gBattleCommunication[CURSOR_POSITION] != 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt();
            gBattleCommunication[CURSOR_POSITION] = 0;
            BattleCreateYesNoCursorAt();
        }
        if (JOY_NEW(DPAD_DOWN) && gBattleCommunication[CURSOR_POSITION] == 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt();
            gBattleCommunication[CURSOR_POSITION] = 1;
            BattleCreateYesNoCursorAt();
        }
        if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);

            if (gBattleCommunication[1] != 0)
                gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
            else
                gBattlescriptCurrInstr += 5;

            HandleBattleWindow(23, 8, 29, 13, WINDOW_CLEAR);
        }
        else if (JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
            HandleBattleWindow(23, 8, 29, 13, WINDOW_CLEAR);
        }
        break;
    }
}

static void Cmd_hitanimation(void)
{
    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);

    if (gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
    {
        gBattlescriptCurrInstr += 2;
    }
    else if (!(gHitMarker & HITMARKER_IGNORE_SUBSTITUTE) || !(gBattleMons[gActiveBattler].status2 & STATUS2_SUBSTITUTE) || gDisableStructs[gActiveBattler].substituteHP == 0)
    {
        BtlController_EmitHitAnimation(BUFFER_A);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 2;
    }
    else
    {
        gBattlescriptCurrInstr += 2;
    }
}

static void Cmd_getmoneyreward(void)
{
    u32 i = 0;
    u32 moneyReward;
    u8 lastMonLevel = 0;

    const struct TrainerMonItemCustomMoves *party4; //This needs to be out here

    if (gBattleOutcome == B_OUTCOME_WON)
    {
        if (gTrainerBattleOpponent_A == TRAINER_SECRET_BASE)
        {
            moneyReward = gBattleResources->secretBase->party.levels[0] * 20 * gBattleStruct->moneyMultiplier;
        }
        else
        {
            switch (gTrainers[gTrainerBattleOpponent_A].partyFlags)
            {
            case 0:
                {
                    const struct TrainerMonNoItemDefaultMoves *party1 = gTrainers[gTrainerBattleOpponent_A].party.NoItemDefaultMoves;
                    
                    lastMonLevel = party1[gTrainers[gTrainerBattleOpponent_A].partySize - 1].lvl;
                }
                break;
            case F_TRAINER_PARTY_CUSTOM_MOVESET:
                {
                    const struct TrainerMonNoItemCustomMoves *party2 = gTrainers[gTrainerBattleOpponent_A].party.NoItemCustomMoves;
                    
                    lastMonLevel = party2[gTrainers[gTrainerBattleOpponent_A].partySize - 1].lvl;
                }
                break;
            case F_TRAINER_PARTY_HELD_ITEM:
                {
                    const struct TrainerMonItemDefaultMoves *party3 = gTrainers[gTrainerBattleOpponent_A].party.ItemDefaultMoves;
                    
                    lastMonLevel = party3[gTrainers[gTrainerBattleOpponent_A].partySize - 1].lvl;
                }
                break;
            case (F_TRAINER_PARTY_CUSTOM_MOVESET | F_TRAINER_PARTY_HELD_ITEM):
                {
                    party4 = gTrainers[gTrainerBattleOpponent_A].party.ItemCustomMoves;
                    
                    lastMonLevel = party4[gTrainers[gTrainerBattleOpponent_A].partySize - 1].lvl;
                }
                break;
            }
            for (; gTrainerMoneyTable[i].classId != 0xFF; i++)
            {
                if (gTrainerMoneyTable[i].classId == gTrainers[gTrainerBattleOpponent_A].trainerClass)
                    break;
            }
            party4 = gTrainers[gTrainerBattleOpponent_A].party.ItemCustomMoves; // Needed to Match. Has no effect.
            moneyReward = 4 * lastMonLevel * gBattleStruct->moneyMultiplier * (gBattleTypeFlags & BATTLE_TYPE_DOUBLE ? 2 : 1) * gTrainerMoneyTable[i].value;
        }
        AddMoney(&gSaveBlock1Ptr->money, moneyReward);
    }
    else
    {
        moneyReward = ComputeWhiteOutMoneyLoss();
    }
    PREPARE_WORD_NUMBER_BUFFER(gBattleTextBuff1, 5, moneyReward);
    if (moneyReward)
        gBattlescriptCurrInstr += 5;
    else
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

// Command is never used
static void Cmd_updatebattlermoves(void)
{
    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);

    switch (gBattleCommunication[0])
    {
    case 0:
        BtlController_EmitGetMonData(BUFFER_A, REQUEST_ALL_BATTLE, 0);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattleCommunication[0]++;
        break;
    case 1:
         if (gBattleControllerExecFlags == 0)
         {
            s32 i;
            struct BattlePokemon *bufferPoke = (struct BattlePokemon *) &gBattleBufferB[gActiveBattler][4];
            for (i = 0; i < MAX_MON_MOVES; i++)
            {
                gBattleMons[gActiveBattler].moves[i] = bufferPoke->moves[i];
                gBattleMons[gActiveBattler].pp[i] = bufferPoke->pp[i];
            }
            gBattlescriptCurrInstr += 2;
         }
         break;
    }
}

static void Cmd_swapattackerwithtarget(void)
{
    gActiveBattler = gBattlerAttacker;
    gBattlerAttacker = gBattlerTarget;
    gBattlerTarget = gActiveBattler;

    if (gHitMarker & HITMARKER_SWAP_ATTACKER_TARGET)
        gHitMarker &= ~HITMARKER_SWAP_ATTACKER_TARGET;
    else
        gHitMarker |= HITMARKER_SWAP_ATTACKER_TARGET;

    gBattlescriptCurrInstr++;
}

static void Cmd_incrementgamestat(void)
{
    if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
        IncrementGameStat(gBattlescriptCurrInstr[1]);

    gBattlescriptCurrInstr += 2;
}

static void Cmd_drawpartystatussummary(void)
{
    s32 i;
    struct Pokemon *party;
    struct HpAndStatus hpStatuses[PARTY_SIZE];

    if (gBattleControllerExecFlags)
        return;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);

    if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
        party = gPlayerParty;
    else
        party = gEnemyParty;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&party[i], MON_DATA_SPECIES_OR_EGG) == SPECIES_NONE
            || GetMonData(&party[i], MON_DATA_SPECIES_OR_EGG) == SPECIES_EGG)
        {
            hpStatuses[i].hp = 0xFFFF;
            hpStatuses[i].status = 0;
        }
        else
        {
            hpStatuses[i].hp = GetMonData(&party[i], MON_DATA_HP);
            hpStatuses[i].status = GetMonData(&party[i], MON_DATA_STATUS);
        }
    }

    BtlController_EmitDrawPartyStatusSummary(BUFFER_A, hpStatuses, 1);
    MarkBattlerForControllerExec(gActiveBattler);

    gBattlescriptCurrInstr += 2;
}

static void Cmd_hidepartystatussummary(void)
{
    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    BtlController_EmitHidePartyStatusSummary(BUFFER_A);
    MarkBattlerForControllerExec(gActiveBattler);

    gBattlescriptCurrInstr += 2;
}

static void Cmd_jumptocalledmove(void)
{
    if (gBattlescriptCurrInstr[1])
        gCurrentMove = gCalledMove;
    else
        gChosenMove = gCurrentMove = gCalledMove;

    gBattlescriptCurrInstr = gBattleScriptsForMoveEffects[gMovesInfo[gCurrentMove].effect];
}

static void Cmd_statusanimation(void)
{
    if (gBattleControllerExecFlags == 0)
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        if (!(gStatuses3[gActiveBattler] & STATUS3_SEMI_INVULNERABLE)
            && gDisableStructs[gActiveBattler].substituteHP == 0
            && !(gHitMarker & HITMARKER_NO_ANIMATIONS))
        {
            BtlController_EmitStatusAnimation(BUFFER_A, FALSE, gBattleMons[gActiveBattler].status1);
            MarkBattlerForControllerExec(gActiveBattler);
        }
        gBattlescriptCurrInstr += 2;
    }
}

static void Cmd_status2animation(void)
{
    u32 wantedToAnimate;

    if (gBattleControllerExecFlags == 0)
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        wantedToAnimate = T1_READ_32(gBattlescriptCurrInstr + 2);
        if (!(gStatuses3[gActiveBattler] & STATUS3_SEMI_INVULNERABLE)
            && gDisableStructs[gActiveBattler].substituteHP == 0
            && !(gHitMarker & HITMARKER_NO_ANIMATIONS))
        {
            BtlController_EmitStatusAnimation(BUFFER_A, TRUE, gBattleMons[gActiveBattler].status2 & wantedToAnimate);
            MarkBattlerForControllerExec(gActiveBattler);
        }
        gBattlescriptCurrInstr += 6;
    }
}

static void Cmd_chosenstatusanimation(void)
{
    u32 wantedStatus;

    if (gBattleControllerExecFlags == 0)
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        wantedStatus = T1_READ_32(gBattlescriptCurrInstr + 3);
        if (!(gStatuses3[gActiveBattler] & STATUS3_SEMI_INVULNERABLE)
            && gDisableStructs[gActiveBattler].substituteHP == 0
            && !(gHitMarker & HITMARKER_NO_ANIMATIONS))
        {
            BtlController_EmitStatusAnimation(BUFFER_A, gBattlescriptCurrInstr[2], wantedStatus);
            MarkBattlerForControllerExec(gActiveBattler);
        }
        gBattlescriptCurrInstr += 7;
    }
}

static void Cmd_yesnobox(void)
{
    switch (gBattleCommunication[0])
    {
    case 0:
        HandleBattleWindow(23, 8, 29, 13, 0);
        BattlePutTextOnWindow(gText_BattleYesNoChoice, B_WIN_YESNO);
        gBattleCommunication[0]++;
        gBattleCommunication[CURSOR_POSITION] = 0;
        BattleCreateYesNoCursorAt();
        break;
    case 1:
        if (JOY_NEW(DPAD_UP) && gBattleCommunication[CURSOR_POSITION] != 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt();
            gBattleCommunication[CURSOR_POSITION] = 0;
            BattleCreateYesNoCursorAt();
        }
        if (JOY_NEW(DPAD_DOWN) && gBattleCommunication[CURSOR_POSITION] == 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt();
            gBattleCommunication[CURSOR_POSITION] = 1;
            BattleCreateYesNoCursorAt();
        }
        if (JOY_NEW(B_BUTTON))
        {
            gBattleCommunication[CURSOR_POSITION] = 1;
            PlaySE(SE_SELECT);
            HandleBattleWindow(23, 8, 29, 13, WINDOW_CLEAR);
            gBattlescriptCurrInstr++;
        }
        else if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            HandleBattleWindow(23, 8, 29, 13, WINDOW_CLEAR);
            gBattlescriptCurrInstr++;
        }
        break;
    }
}

static void Cmd_cancelallactions(void)
{
    s32 i;

    for (i = 0; i < gBattlersCount; i++)
        gActionsByTurnOrder[i] = B_ACTION_CANCEL_PARTNER;

    gBattlescriptCurrInstr++;
}

// The same as adjustdamage, except there's no random damage multiplier.
static void Cmd_adjustsetdamage(void)
{
    u8 holdEffect, param;

    if (gBattleMons[gBattlerTarget].item == ITEM_ENIGMA_BERRY)
    {
        holdEffect = gEnigmaBerries[gBattlerTarget].holdEffect;
        param = gEnigmaBerries[gBattlerTarget].holdEffectParam;
    }
    else
    {
        holdEffect = ItemId_GetHoldEffect(gBattleMons[gBattlerTarget].item);
        param = ItemId_GetHoldEffectParam(gBattleMons[gBattlerTarget].item);
    }

    gPotentialItemEffectBattler = gBattlerTarget;

    if (holdEffect == HOLD_EFFECT_FOCUS_BAND && (Random() % 100) < param)
    {
        RecordItemEffectBattle(gBattlerTarget, holdEffect);
        gSpecialStatuses[gBattlerTarget].focusBanded = 1;
    }
    if (!(gBattleMons[gBattlerTarget].status2 & STATUS2_SUBSTITUTE)
     && (gMovesInfo[gCurrentMove].effect == EFFECT_FALSE_SWIPE || gProtectStructs[gBattlerTarget].endured || gSpecialStatuses[gBattlerTarget].focusBanded)
     && gBattleMons[gBattlerTarget].hp <= gBattleMoveDamage)
    {
        gBattleMoveDamage = gBattleMons[gBattlerTarget].hp - 1;
        if (gProtectStructs[gBattlerTarget].endured)
        {
            gMoveResultFlags |= MOVE_RESULT_FOE_ENDURED;
        }
        else if (gSpecialStatuses[gBattlerTarget].focusBanded)
        {
            gMoveResultFlags |= MOVE_RESULT_FOE_HUNG_ON;
            gLastUsedItem = gBattleMons[gBattlerTarget].item;
        }
    }
    gBattlescriptCurrInstr++;
}

static void Cmd_removeitem(void)
{
    u16 *usedHeldItem;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);

    usedHeldItem = &gBattleStruct->usedHeldItems[gActiveBattler][GetBattlerSide(gActiveBattler)];
    *usedHeldItem = gBattleMons[gActiveBattler].item;
    gBattleMons[gActiveBattler].item = ITEM_NONE;

    BtlController_EmitSetMonData(BUFFER_A, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[gActiveBattler].item), &gBattleMons[gActiveBattler].item);
    MarkBattlerForControllerExec(gActiveBattler);

    gBattlescriptCurrInstr += 2;
}

static void Cmd_atknameinbuff1(void)
{
    PREPARE_MON_NICK_BUFFER(gBattleTextBuff1, gBattlerAttacker, gBattlerPartyIndexes[gBattlerAttacker])

    gBattlescriptCurrInstr++;
}

static void Cmd_drawlvlupbox(void)
{
    if (gBattleScripting.drawlvlupboxState == 0)
    {
        // If the Pokémon getting exp is not in-battle then
        // slide out a banner with their name and icon on it.
        // Otherwise skip ahead.
        if (IsMonGettingExpSentOut())
            gBattleScripting.drawlvlupboxState = 3;
        else
            gBattleScripting.drawlvlupboxState = 1;
    }

    switch (gBattleScripting.drawlvlupboxState)
    {
    case 1:
        // Start level up banner
        gBattle_BG2_Y = 96;
        SetBgAttribute(2, BG_ATTR_PRIORITY, 0);
        ShowBg(2);
        InitLevelUpBanner();
        gBattleScripting.drawlvlupboxState = 2;
        break;
    case 2:
        if (!SlideInLevelUpBanner())
            gBattleScripting.drawlvlupboxState = 3;
        break;
    case 3:
        // Init level up box
        gBattle_BG1_X = 0;
        gBattle_BG1_Y = 256;
        SetBgAttribute(0, BG_ATTR_PRIORITY, 1);
        SetBgAttribute(1, BG_ATTR_PRIORITY, 0);
        ShowBg(0);
        ShowBg(1);
        HandleBattleWindow(18, 7, 29, 19, WINDOW_BG1);
        gBattleScripting.drawlvlupboxState = 4;
        break;
    case 4:
        // Draw page 1 of level up box
        DrawLevelUpWindow1();
        PutWindowTilemap(B_WIN_LEVEL_UP_BOX);
        CopyWindowToVram(B_WIN_LEVEL_UP_BOX, COPYWIN_FULL);
        gBattleScripting.drawlvlupboxState++;
        break;
    case 5:
    case 7:
        // Wait for draw after each page
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            gBattle_BG1_Y = 0;
            gBattleScripting.drawlvlupboxState++;
        }
        break;
    case 6:
        if (gMain.newKeys != 0)
        {
            // Draw page 2 of level up box
            PlaySE(SE_SELECT);
            DrawLevelUpWindow2();
            CopyWindowToVram(B_WIN_LEVEL_UP_BOX, COPYWIN_GFX);
            gBattleScripting.drawlvlupboxState++;
        }
        break;
    case 8:
        if (gMain.newKeys != 0)
        {
            // Close level up box
            PlaySE(SE_SELECT);
            HandleBattleWindow(18, 7, 29, 19, WINDOW_BG1 | WINDOW_CLEAR);
            gBattleScripting.drawlvlupboxState++;
        }
        break;
    case 9:
        if (!SlideOutLevelUpBanner())
        {
            ClearWindowTilemap(B_WIN_LEVEL_UP_BANNER);
            CopyWindowToVram(B_WIN_LEVEL_UP_BANNER, COPYWIN_MAP);

            ClearWindowTilemap(B_WIN_LEVEL_UP_BOX);
            CopyWindowToVram(B_WIN_LEVEL_UP_BOX, COPYWIN_MAP);

            SetBgAttribute(2, BG_ATTR_PRIORITY, 2);
            ShowBg(2);

            gBattleScripting.drawlvlupboxState = 10;
        }
        break;
    case 10:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            SetBgAttribute(0, BG_ATTR_PRIORITY, 0);
            SetBgAttribute(1, BG_ATTR_PRIORITY, 1);
            ShowBg(0);
            ShowBg(1);
            gBattlescriptCurrInstr++;
        }
        break;
    }
}

static void DrawLevelUpWindow1(void)
{
    u16 currStats[NUM_STATS];

    GetMonLevelUpWindowStats(&gPlayerParty[gBattleStruct->expGetterMonId], currStats);
    DrawLevelUpWindowPg1(B_WIN_LEVEL_UP_BOX, gBattleResources->beforeLvlUp->stats, currStats, TEXT_DYNAMIC_COLOR_5, TEXT_DYNAMIC_COLOR_4, TEXT_DYNAMIC_COLOR_6);
}

static void DrawLevelUpWindow2(void)
{
    u16 currStats[NUM_STATS];

    GetMonLevelUpWindowStats(&gPlayerParty[gBattleStruct->expGetterMonId], currStats);
    DrawLevelUpWindowPg2(B_WIN_LEVEL_UP_BOX, currStats, TEXT_DYNAMIC_COLOR_5, TEXT_DYNAMIC_COLOR_4, TEXT_DYNAMIC_COLOR_6);
}

static void InitLevelUpBanner(void)
{
    gBattle_BG2_Y = 0;
    gBattle_BG2_X = LEVEL_UP_BANNER_START;

    LoadPalette(sLevelUpBanner_Pal, BG_PLTT_ID(6), sizeof(sLevelUpBanner_Pal));
    CopyToWindowPixelBuffer(B_WIN_LEVEL_UP_BANNER, sLevelUpBanner_Gfx, 0, 0);
    PutWindowTilemap(B_WIN_LEVEL_UP_BANNER);
    CopyWindowToVram(B_WIN_LEVEL_UP_BANNER, COPYWIN_FULL);

    PutMonIconOnLvlUpBanner();
}

static bool8 SlideInLevelUpBanner(void)
{
    if (IsDma3ManagerBusyWithBgCopy())
        return TRUE;

    if (gBattle_BG2_X == LEVEL_UP_BANNER_END)
        return FALSE;

    if (gBattle_BG2_X == LEVEL_UP_BANNER_START)
        DrawLevelUpBannerText();

    gBattle_BG2_X += 8;
    if (gBattle_BG2_X >= LEVEL_UP_BANNER_END)
        gBattle_BG2_X = LEVEL_UP_BANNER_END;

    return (gBattle_BG2_X != LEVEL_UP_BANNER_END);
}

static void DrawLevelUpBannerText(void)
{
    u16 monLevel;
    u8 monGender;
    struct TextPrinterTemplate printerTemplate;
    u8 *txtPtr;
    u8 *txtPtr2;

    monLevel = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_LEVEL);
    monGender = GetMonGender(&gPlayerParty[gBattleStruct->expGetterMonId]);
    GetMonNickname(&gPlayerParty[gBattleStruct->expGetterMonId], gStringVar4);

    printerTemplate.currentChar = gStringVar4;
    printerTemplate.windowId = B_WIN_LEVEL_UP_BANNER;
    printerTemplate.fontId = FONT_SMALL;
    printerTemplate.x = 32;
    printerTemplate.y = 0;
    printerTemplate.currentX = 32;
    printerTemplate.currentY = 0;
    printerTemplate.letterSpacing = 0;
    printerTemplate.lineSpacing = 0;
    printerTemplate.unk = 0;
    printerTemplate.fgColor = TEXT_COLOR_WHITE;
    printerTemplate.bgColor = TEXT_COLOR_TRANSPARENT;
    printerTemplate.shadowColor = TEXT_COLOR_DARK_GRAY;

    AddTextPrinter(&printerTemplate, TEXT_SKIP_DRAW, NULL);

    txtPtr = gStringVar4;
    gStringVar4[0] = CHAR_EXTRA_SYMBOL;
    *++txtPtr = CHAR_LV_2;
    *++txtPtr = 0;
    txtPtr2 = txtPtr + 1;
    txtPtr = ConvertIntToDecimalStringN(++txtPtr, monLevel, STR_CONV_MODE_LEFT_ALIGN, 3);
    txtPtr = StringFill(txtPtr, 0, 5);
    txtPtr = txtPtr2 + 4;
    if (monGender != MON_GENDERLESS)
    {
        if (monGender == MON_MALE)
        {
            txtPtr = WriteColorChangeControlCode(txtPtr, 0, TEXT_DYNAMIC_COLOR_3);
            txtPtr = WriteColorChangeControlCode(txtPtr, 1, TEXT_DYNAMIC_COLOR_4);
            *(txtPtr++) = CHAR_MALE;
        }
        else
        {
            txtPtr = WriteColorChangeControlCode(txtPtr, 0, TEXT_DYNAMIC_COLOR_5);
            txtPtr = WriteColorChangeControlCode(txtPtr, 1, TEXT_DYNAMIC_COLOR_6);
            *(txtPtr++) = CHAR_FEMALE;
        }
        *(txtPtr++) = EOS;
    }

    printerTemplate.y = 10;
    printerTemplate.currentY = 10;
    AddTextPrinter(&printerTemplate, TEXT_SKIP_DRAW, NULL);

    CopyWindowToVram(B_WIN_LEVEL_UP_BANNER, COPYWIN_GFX);
}

static bool8 SlideOutLevelUpBanner(void)
{
    if (gBattle_BG2_X == LEVEL_UP_BANNER_START)
        return FALSE;

    if (gBattle_BG2_X - 16 < LEVEL_UP_BANNER_START)
        gBattle_BG2_X = LEVEL_UP_BANNER_START;
    else
        gBattle_BG2_X -= 16;

    return (gBattle_BG2_X != LEVEL_UP_BANNER_START);
}

#define sDestroy data[0]
#define sXOffset data[1]

static void PutMonIconOnLvlUpBanner(void)
{
    u8 spriteId;
    const u16 *iconPal;
    struct SpriteSheet iconSheet;
    struct SpritePalette iconPalSheet;

    u16 species = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPECIES);
    u32 personality = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_PERSONALITY);

    const u8 *iconPtr = GetMonIconPtr(species, personality, 1);
    iconSheet.data = iconPtr;
    iconSheet.size = 0x200;
    iconSheet.tag = TAG_LVLUP_BANNER_MON_ICON;

    iconPal = GetValidMonIconPalettePtr(species);
    iconPalSheet.data = iconPal;
    iconPalSheet.tag = TAG_LVLUP_BANNER_MON_ICON;

    LoadSpriteSheet(&iconSheet);
    LoadSpritePalette(&iconPalSheet);

    spriteId = CreateSprite(&sSpriteTemplate_MonIconOnLvlUpBanner, 256, 10, 0);
    gSprites[spriteId].sDestroy = FALSE;
    gSprites[spriteId].sXOffset = gBattle_BG2_X;
}

static void SpriteCB_MonIconOnLvlUpBanner(struct Sprite* sprite)
{
    sprite->x2 = sprite->sXOffset - gBattle_BG2_X;

    if (sprite->x2 != 0)
    {
        sprite->sDestroy = TRUE;
    }
    else if (sprite->sDestroy)
    {
        DestroySprite(sprite);
        FreeSpriteTilesByTag(TAG_LVLUP_BANNER_MON_ICON);
        FreeSpritePaletteByTag(TAG_LVLUP_BANNER_MON_ICON);
    }
}

#undef sDestroy
#undef sXOffset

bool32 IsMonGettingExpSentOut(void)
{
    if (gBattlerPartyIndexes[0] == gBattleStruct->expGetterMonId)
        return TRUE;
    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE && gBattlerPartyIndexes[2] == gBattleStruct->expGetterMonId)
        return TRUE;

    return FALSE;
}

static void Cmd_resetsentmonsvalue(void)
{
    ResetSentPokesToOpponentValue();
    gBattlescriptCurrInstr++;
}

static void Cmd_setatktoplayer0(void)
{
    gBattlerAttacker = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
    gBattlescriptCurrInstr++;
}

static void Cmd_makevisible(void)
{
    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    BtlController_EmitSpriteInvisibility(BUFFER_A, FALSE);
    MarkBattlerForControllerExec(gActiveBattler);

    gBattlescriptCurrInstr += 2;
}

static void Cmd_recordability(void)
{
    CMD_ARGS(u8 battler);
    gActiveBattler = GetBattlerForBattleScript(cmd->battler);
    RecordAbilityBattle(gActiveBattler, gBattleMons[gActiveBattler].ability);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BufferMoveToLearnIntoBattleTextBuff2(void)
{
    PREPARE_MOVE_BUFFER(gBattleTextBuff2, gMoveToLearn);
}

static void Cmd_buffermovetolearn(void)
{
    BufferMoveToLearnIntoBattleTextBuff2();
    gBattlescriptCurrInstr++;
}

static void Cmd_jumpifplayerran(void)
{
    if (TryRunFromBattle(gBattlerFainted))
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    else
        gBattlescriptCurrInstr += 5;
}

static void Cmd_hpthresholds(void)
{
    u8 opposingBattler;
    s32 result;

    if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        opposingBattler = gActiveBattler ^ BIT_SIDE;

        result = gBattleMons[opposingBattler].hp * 100 / gBattleMons[opposingBattler].maxHP;
        if (result == 0)
            result = 1;

        if (result > 69 || gBattleMons[opposingBattler].hp == 0)
            gBattleStruct->hpScale = 0;
        else if (result > 39)
            gBattleStruct->hpScale = 1;
        else if (result > 9)
            gBattleStruct->hpScale = 2;
        else
            gBattleStruct->hpScale = 3;
    }

    gBattlescriptCurrInstr += 2;
}

static void Cmd_hpthresholds2(void)
{
    u8 opposingBattler;
    s32 result;
    u8 hpSwitchout;

    if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        opposingBattler = gActiveBattler ^ BIT_SIDE;
        hpSwitchout = *(gBattleStruct->hpOnSwitchout + GetBattlerSide(opposingBattler));
        result = (hpSwitchout - gBattleMons[opposingBattler].hp) * 100 / hpSwitchout;

        if (gBattleMons[opposingBattler].hp >= hpSwitchout)
            gBattleStruct->hpScale = 0;
        else if (result <= 29)
            gBattleStruct->hpScale = 1;
        else if (result <= 69)
            gBattleStruct->hpScale = 2;
        else
            gBattleStruct->hpScale = 3;
    }

    gBattlescriptCurrInstr += 2;
}

static void Cmd_useitemonopponent(void)
{
    gBattlerInMenuId = gBattlerAttacker;
    PokemonUseItemEffects(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker]], gLastUsedItem, gBattlerPartyIndexes[gBattlerAttacker], 0, TRUE);
    gBattlescriptCurrInstr++;
}

static void Cmd_various(void)
{
    CMD_ARGS(u8 battler, u8 id);
    u32 side, battler;
    s32 i;
    u32 monToCheck, status;
    u16 species;
    u8 abilityNum;
    struct Pokemon *mon;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    battler = gActiveBattler;

    switch (gBattlescriptCurrInstr[2])
    {
    case VARIOUS_CANCEL_MULTI_TURN_MOVES:
        CancelMultiTurnMoves(gActiveBattler);
        break;
    case VARIOUS_SET_MAGIC_COAT_TARGET:
        gBattlerAttacker = gBattlerTarget;
        side = GetBattlerSide(gBattlerAttacker) ^ BIT_SIDE;
        if (gSideTimers[side].followmeTimer != 0 && gBattleMons[gSideTimers[side].followmeTarget].hp != 0)
            gBattlerTarget = gSideTimers[side].followmeTarget;
        else
            gBattlerTarget = gActiveBattler;
        break;
    case VARIOUS_IS_RUNNING_IMPOSSIBLE:
        gBattleCommunication[0] = IsRunningFromBattleImpossible();
        break;
    case VARIOUS_GET_MOVE_TARGET:
        gBattlerTarget = GetMoveTarget(gCurrentMove, NO_TARGET_OVERRIDE);
        break;
    case VARIOUS_GET_BATTLER_FAINTED:
        if (gHitMarker & HITMARKER_FAINTED(gActiveBattler))
            gBattleCommunication[0] = TRUE;
        else
            gBattleCommunication[0] = FALSE;
        break;
    case VARIOUS_RESET_INTIMIDATE_TRACE_BITS:
        gSpecialStatuses[gActiveBattler].intimidatedMon = 0;
        gSpecialStatuses[gActiveBattler].traced = 0;
        break;
    case VARIOUS_UPDATE_CHOICE_MOVE_ON_LVL_UP:
        if (gBattlerPartyIndexes[0] == gBattleStruct->expGetterMonId || gBattlerPartyIndexes[2] == gBattleStruct->expGetterMonId)
        {
            u16 *choicedMove;

            if (gBattlerPartyIndexes[0] == gBattleStruct->expGetterMonId)
                gActiveBattler = 0;
            else
                gActiveBattler = 2;

            choicedMove = &gBattleStruct->choicedMove[gActiveBattler];

            for (i = 0; i < MAX_MON_MOVES; i++)
            {
                if (gBattleMons[gActiveBattler].moves[i] == *choicedMove)
                    break;
            }
            if (i == MAX_MON_MOVES)
                *choicedMove = MOVE_NONE;
        }
        break;
    case VARIOUS_RESET_PLAYER_FAINTED:
        if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_DOUBLE))
            && gBattleTypeFlags & BATTLE_TYPE_TRAINER
            && gBattleMons[0].hp != 0
            && gBattleMons[1].hp != 0)
        {
            gHitMarker &= ~HITMARKER_PLAYER_FAINTED;
        }
        break;
    case VARIOUS_GET_BATTLERS_FOR_RECALL:
        i = 0; // redundant
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
        gActiveBattler = 1;
        for (i = 0; gActiveBattler < MAX_BATTLERS_COUNT; gActiveBattler += 2)
        {
            if (gActiveBattler < gBattlersCount && gBattleMons[gActiveBattler].hp != 0)
                gBattleCommunication[MULTISTRING_CHOOSER] |= gBitTable[i];
            i++;
        }
        break;
    case VARIOUS_RETURN_OPPONENT_MON1:
        gActiveBattler = 1;
        if (gBattleMons[gActiveBattler].hp != 0)
        {
            BtlController_EmitReturnMonToBall(BUFFER_A, FALSE);
            MarkBattlerForControllerExec(gActiveBattler);
        }
        break;
    case VARIOUS_RETURN_OPPONENT_MON2:
        if (gBattlersCount > 3)
        {
            gActiveBattler = 3;
            if (gBattleMons[gActiveBattler].hp != 0)
            {
                BtlController_EmitReturnMonToBall(BUFFER_A, FALSE);
                MarkBattlerForControllerExec(gActiveBattler);
            }
        }
        break;
    case VARIOUS_CHECK_POKEFLUTE:
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
        monToCheck = 0;
        for (i = 0; i < gBattlersCount; i++)
        {
            if (gBattleMons[i].ability != ABILITY_SOUNDPROOF)
            {
                gBattleMons[i].status1 &= ~STATUS1_SLEEP;
                gBattleMons[i].status2 &= ~STATUS2_NIGHTMARE;

            }
        }
        for (i = 0; i < PARTY_SIZE; i++)
        {
            species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG);
            abilityNum = GetMonData(&gPlayerParty[i], MON_DATA_ABILITY_NUM);
            status = GetMonData(&gPlayerParty[i], MON_DATA_STATUS);
            if (species != SPECIES_NONE
             && species != SPECIES_EGG
             && status & AILMENT_FNT
             && GetAbilityBySpecies(species, abilityNum) != ABILITY_SOUNDPROOF)
                monToCheck |= (1 << i);
        }
        if (monToCheck)
        {
            gActiveBattler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
            status = 0;
            BtlController_EmitSetMonData(BUFFER_A, REQUEST_STATUS_BATTLE, monToCheck, 4, &status);
            MarkBattlerForControllerExec(gActiveBattler);
            gBattleCommunication[MULTISTRING_CHOOSER] = 1;
        }
        monToCheck = 0;
        for (i = 0; i < PARTY_SIZE; i++)
        {
            species = GetMonData(&gEnemyParty[i], MON_DATA_SPECIES_OR_EGG);
            abilityNum = GetMonData(&gEnemyParty[i], MON_DATA_ABILITY_NUM);
            status = GetMonData(&gEnemyParty[i], MON_DATA_STATUS);

            if (species != SPECIES_NONE
             && species != SPECIES_EGG
             && status & AILMENT_FNT
             && GetAbilityBySpecies(species, abilityNum) != ABILITY_SOUNDPROOF)
                monToCheck |= (1 << i);
        }
        if (monToCheck)
        {
            gActiveBattler = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
            status = 0;
            BtlController_EmitSetMonData(BUFFER_A, REQUEST_STATUS_BATTLE, monToCheck, 4, &status);
            MarkBattlerForControllerExec(gActiveBattler);
            gBattleCommunication[5] = 1;
        }
        break;
    case VARIOUS_WAIT_FANFARE:
        if (!IsFanfareTaskInactive())
            return;
        break;
    case VARIOUS_PLAY_MOVE_ANIMATION:
    {
        VARIOUS_ARGS(u16 move);
        BtlController_EmitMoveAnimation(BUFFER_A, cmd->move, gBattleScripting.animTurn, 0, 0, gBattleMons[gActiveBattler].friendship, &gDisableStructs[gActiveBattler], gMultiHitCounter);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_ABILITY_POPUP:
    {
        VARIOUS_ARGS();
        // TODO: Ability Popup
        // CreateAbilityPopUp(cmd->battler, gBattleMons[cmd->battler].ability, (gBattleTypeFlags & BATTLE_TYPE_DOUBLE) != 0);
        break;
    }
    case VARIOUS_SET_LAST_USED_ITEM:
    {
        VARIOUS_ARGS();
        gLastUsedItem = gBattleMons[gActiveBattler].item;
        break;
    }
    case VARIOUS_JUMP_IF_HOLD_EFFECT:
    {
        VARIOUS_ARGS(u8 holdEffect, const u8 *jumpInstr, u8 equal);
        if ((GetBattlerHoldEffect(gActiveBattler, TRUE) == cmd->holdEffect) == cmd->equal)
        {
            if (cmd->equal)
                gLastUsedItem = gBattleMons[gActiveBattler].item; // For B_LAST_USED_ITEM
            gBattlescriptCurrInstr = cmd->jumpInstr;
        }
        else
        {
            if (!cmd->equal)
                gLastUsedItem = gBattleMons[gActiveBattler].item; // For B_LAST_USED_ITEM
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        return;
    }
    case VARIOUS_HANDLE_FORM_CHANGE:
    {
        VARIOUS_ARGS(u8 case_);
        if (GetBattlerSide(battler) == B_SIDE_OPPONENT)
            mon = &gEnemyParty[gBattlerPartyIndexes[battler]];
        else
            mon = &gPlayerParty[gBattlerPartyIndexes[battler]];

        // Change species.
        if (cmd->case_ == 0)
        {
            /* What was the idea here?
            if (!gBattleTextBuff1)
                PREPARE_SPECIES_BUFFER(gBattleTextBuff1, gBattleMons[battler].species);
            */
            gActiveBattler = battler;
            BtlController_EmitSetMonData(BUFFER_A, REQUEST_SPECIES_BATTLE, gBitTable[gBattlerPartyIndexes[battler]], sizeof(gBattleMons[battler].species), &gBattleMons[battler].species);
            MarkBattlerForControllerExec(battler);
        }
        // Change stats.
        else if (cmd->case_ == 1)
        {
            RecalcBattlerStats(battler, mon);
        }
        // Update healthbox.
        else
        {
            UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], mon, HEALTHBOX_ALL);
        }
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_SAVE_TARGET:
    {
        VARIOUS_ARGS();
        gBattleStruct->savedBattlerTarget = gBattlerTarget;
        break;
    }
    case VARIOUS_RESTORE_TARGET:
    {
        VARIOUS_ARGS();
        gBattlerTarget = gBattleStruct->savedBattlerTarget;
        break;
    }
    case VARIOUS_SPECTRAL_THIEF:
    {
        VARIOUS_ARGS();
        // Raise stats
        for (i = STAT_ATK; i < NUM_BATTLE_STATS; i++)
        {
            if (gBattleStruct->stolenStats[0] & gBitTable[i])
            {
                gBattleStruct->stolenStats[0] &= ~(gBitTable[i]);
                SET_STATCHANGER(i, gBattleStruct->stolenStats[i], FALSE);
                if (ChangeStatBuffs(GET_STAT_BUFF_VALUE_WITH_SIGN(gBattleScripting.statChanger), i, MOVE_EFFECT_CERTAIN | MOVE_EFFECT_AFFECTS_USER, NULL) == STAT_CHANGE_WORKED)
                {
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_StatUpMsg;
                    return;
                }
            }
        }
        break;
    }
    case VARIOUS_TRY_TO_CLEAR_PRIMAL_WEATHER:
    {
        bool8 shouldNotClear = FALSE;

        for (i = 0; i < gBattlersCount; i++)
        {
            u32 ability = GetBattlerAbility(i);
            if (((ability == ABILITY_DESOLATE_LAND && gBattleWeather & B_WEATHER_SUN_PRIMAL)
             || (ability == ABILITY_PRIMORDIAL_SEA && gBattleWeather & B_WEATHER_RAIN_PRIMAL)
             || (ability == ABILITY_DELTA_STREAM && gBattleWeather & B_WEATHER_STRONG_WINDS))
             && IsBattlerAlive(i))
                shouldNotClear = TRUE;
        }
        if (gBattleWeather & B_WEATHER_SUN_PRIMAL && !shouldNotClear)
        {
            gBattleWeather &= ~B_WEATHER_SUN_PRIMAL;
            PrepareStringBattle(STRINGID_EXTREMESUNLIGHTFADED, battler);
            gBattleCommunication[MSG_DISPLAY] = 1;
        }
        else if (gBattleWeather & B_WEATHER_RAIN_PRIMAL && !shouldNotClear)
        {
            gBattleWeather &= ~B_WEATHER_RAIN_PRIMAL;
            PrepareStringBattle(STRINGID_HEAVYRAINLIFTED, battler);
            gBattleCommunication[MSG_DISPLAY] = 1;
        }
        else if (gBattleWeather & B_WEATHER_STRONG_WINDS && !shouldNotClear)
        {
            gBattleWeather &= ~B_WEATHER_STRONG_WINDS;
            PrepareStringBattle(STRINGID_STRONGWINDSDISSIPATED, battler);
            gBattleCommunication[MSG_DISPLAY] = 1;
        }
        break;
    }
    case VARIOUS_CONSUME_BERRY:
    {
        VARIOUS_ARGS(bool8 fromBattler);
        if (gBattleScripting.overrideBerryRequirements == 2)
        {
            gBattlescriptCurrInstr = cmd->nextInstr;
            return;
        }

        if (cmd->fromBattler)
            gLastUsedItem = gBattleMons[battler].item;

        gBattleStruct->ateBerry[battler & BIT_SIDE] |= gBitTable[gBattlerPartyIndexes[battler]];
        gBattleScripting.battler = gEffectBattler = gBattlerTarget = battler;    // Cover all berry effect battler cases. e.g. ChangeStatBuffs uses target ID
        if (ItemBattleEffects(ITEMEFFECT_USE_LAST_ITEM, battler, FALSE))
            return;
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_ROOM_SERVICE:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if (GetBattlerHoldEffect(battler, TRUE) == HOLD_EFFECT_ROOM_SERVICE && TryRoomService(battler))
        {
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_BerryStatRaiseRet;
        }
        else
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        return;
    }
    case VARIOUS_TRY_WIND_RIDER_POWER:
        {
            VARIOUS_ARGS(const u8 *failInstr);
            u16 ability = GetBattlerAbility(battler);
            if (GetBattlerSide(battler) == GetBattlerSide(gBattlerAttacker)
             && (ability == ABILITY_WIND_RIDER || ability == ABILITY_WIND_POWER))
            {
                gLastUsedAbility = ability;
                RecordAbilityBattle(battler, gLastUsedAbility);
                gBattlerAbility = gBattleScripting.battler = battler;
                gBattlescriptCurrInstr = cmd->nextInstr;
            }
            else
            {
                gBattlescriptCurrInstr = cmd->failInstr;
            }
            return;
        }
    case VARIOUS_CURE_STATUS:
    {
        VARIOUS_ARGS();
        gBattleMons[battler].status1 = 0;
        gActiveBattler = battler;
        BtlController_EmitSetMonData(BUFFER_A, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[battler].status1), &gBattleMons[battler].status1);
        MarkBattlerForControllerExec(battler);
        break;
    }
    case VARIOUS_JUMP_IF_NO_ALLY:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        if (!IsBattlerAlive(BATTLE_PARTNER(battler)))
            gBattlescriptCurrInstr = cmd->jumpInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_TRY_FRISK:
    {
        VARIOUS_ARGS();
        while (gBattleStruct->friskedBattler < gBattlersCount)
        {
            gBattlerTarget = gBattleStruct->friskedBattler++;
            if (GetBattlerSide(battler) != GetBattlerSide(gBattlerTarget)
                && IsBattlerAlive(gBattlerTarget)
                && gBattleMons[gBattlerTarget].item != ITEM_NONE)
            {
                gLastUsedItem = gBattleMons[gBattlerTarget].item;
                RecordItemEffectBattle(gBattlerTarget, GetBattlerHoldEffect(gBattlerTarget, FALSE));
                BattleScriptPushCursor();
                // If Frisk identifies two mons' items, show the pop-up only once.
                if (gBattleStruct->friskedAbility)
                {
                    gBattlescriptCurrInstr = BattleScript_FriskMsg;
                }
                else
                {
                    gBattleStruct->friskedAbility = TRUE;
                    gBattlescriptCurrInstr = BattleScript_FriskMsgWithPopup;
                }
                return;
            }
        }
        gBattleStruct->friskedBattler = 0;
        gBattleStruct->friskedAbility = FALSE;
        break;
    }
    case VARIOUS_DESTROY_ABILITY_POPUP:
    {
        VARIOUS_ARGS();
        // TODO: Ability Popup
        // DestroyAbilityPopUp(battler);
        break;
    }
    case VARIOUS_JUMP_IF_TARGET_ALLY:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        if (GetBattlerSide(gBattlerAttacker) != GetBattlerSide(gBattlerTarget))
            gBattlescriptCurrInstr = cmd->nextInstr;
        else
            gBattlescriptCurrInstr = cmd->jumpInstr;
        return;
    }
    case VARIOUS_JUMP_IF_ABSENT:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        if (!IsBattlerAlive(battler))
            gBattlescriptCurrInstr = cmd->jumpInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_UPDATE_ABILITY_POPUP:
    {
        VARIOUS_ARGS();
        // TODO: Ability Popup
        // UpdateAbilityPopup(battler);
        break;
    }
    case VARIOUS_SWITCHIN_ABILITIES:
    {
        VARIOUS_ARGS();
        gBattlescriptCurrInstr = cmd->nextInstr;
        AbilityBattleEffects(ABILITYEFFECT_NEUTRALIZINGGAS, battler, 0, 0, 0);
        AbilityBattleEffects(ABILITYEFFECT_ON_SWITCHIN, battler, 0, 0, 0);
        AbilityBattleEffects(ABILITYEFFECT_TRACE2, battler, 0, 0, 0);
        AbilityBattleEffects(ABILITYEFFECT_OPPORTUNIST, battler, 0, 0, 0);
        return;
    }
    case VARIOUS_SET_SPRITEIGNORE0HP:
    {
        VARIOUS_ARGS(bool8 ignore0HP);
        gBattleStruct->spriteIgnore0Hp = cmd->ignore0HP;
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_UPDATE_NICK:
    {
        VARIOUS_ARGS();
        if (GetBattlerSide(battler) == B_SIDE_PLAYER)
            mon = &gPlayerParty[gBattlerPartyIndexes[battler]];
        else
            mon = &gEnemyParty[gBattlerPartyIndexes[battler]];
        UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], mon, HEALTHBOX_NICK);
        break;
    }
    case VARIOUS_TERRAIN_SEED:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if (GetBattlerHoldEffect(battler, TRUE) == HOLD_EFFECT_SEEDS)
        {
            u8 effect = 0;
            u16 item = gBattleMons[battler].item;
            switch (GetBattlerHoldEffectParam(battler))
            {
            case HOLD_EFFECT_PARAM_ELECTRIC_TERRAIN:
                effect = TryHandleSeed(battler, STATUS_FIELD_ELECTRIC_TERRAIN, STAT_DEF, item, FALSE);
                break;
            case HOLD_EFFECT_PARAM_GRASSY_TERRAIN:
                effect = TryHandleSeed(battler, STATUS_FIELD_GRASSY_TERRAIN, STAT_DEF, item, FALSE);
                break;
            case HOLD_EFFECT_PARAM_MISTY_TERRAIN:
                effect = TryHandleSeed(battler, STATUS_FIELD_MISTY_TERRAIN, STAT_SPDEF, item, FALSE);
                break;
            case HOLD_EFFECT_PARAM_PSYCHIC_TERRAIN:
                effect = TryHandleSeed(battler, STATUS_FIELD_PSYCHIC_TERRAIN, STAT_SPDEF, item, FALSE);
                break;
            }

            if (effect)
                return;
        }
        gBattlescriptCurrInstr = cmd->failInstr;
        return;
    }
    case VARIOUS_ACTIVATE_TERRAIN_CHANGE_ABILITIES:
    {
        VARIOUS_ARGS();
        gBattlescriptCurrInstr = cmd->nextInstr;
        AbilityBattleEffects(ABILITYEFFECT_ON_TERRAIN, battler, 0, 0, 0);
        return;
    }
    case VARIOUS_ACTIVATE_WEATHER_CHANGE_ABILITIES:
    {
        VARIOUS_ARGS();
        gBattlescriptCurrInstr = cmd->nextInstr;
        AbilityBattleEffects(ABILITYEFFECT_ON_WEATHER, battler, 0, 0, 0);
        return;
    }
    case VARIOUS_TOTEM_BOOST:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        battler = gBattlerAttacker;
        if (gQueuedStatBoosts[battler].stats == 0)
        {
            gBattlescriptCurrInstr = cmd->nextInstr;    // stats done, exit
        }
        else
        {
            for (i = 0; i < (NUM_BATTLE_STATS - 1); i++)
            {
                if (gQueuedStatBoosts[battler].stats & (1 << i))
                {
                    if (gQueuedStatBoosts[battler].statChanges[i] <= -1)
                        SET_STATCHANGER(i + 1, abs(gQueuedStatBoosts[battler].statChanges[i]), TRUE);
                    else
                        SET_STATCHANGER(i + 1, gQueuedStatBoosts[battler].statChanges[i], FALSE);

                    gQueuedStatBoosts[battler].stats &= ~(1 << i);
                    gBattleScripting.battler = battler;
                    gBattlerTarget = battler;
                    if (gQueuedStatBoosts[battler].stats & 0x80)
                    {
                        gQueuedStatBoosts[battler].stats &= ~0x80; // set 'aura flared to life' flag
                        gBattlescriptCurrInstr = BattleScript_TotemFlaredToLife;
                    }
                    else
                    {
                        gBattlescriptCurrInstr = cmd->jumpInstr;   // do boost
                    }
                    return;
                }
            }
            gBattlescriptCurrInstr = cmd->nextInstr;    // exit if loop failed (failsafe)
        }
        return;
    }
    case VARIOUS_MAKE_INVISIBLE:
    {
        VARIOUS_ARGS();
        if (gBattleControllerExecFlags)
            break;
        
        gActiveBattler = battler;
        BtlController_EmitSpriteInvisibility(BUFFER_A, TRUE);
        MarkBattlerForControllerExec(battler);
        break;
    }
    }

    gBattlescriptCurrInstr += 3;
}

 // Protect and Endure
static void Cmd_setprotectlike(void)
{
    bool8 notLastTurn = TRUE;
    u16 lastMove = gLastResultingMoves[gBattlerAttacker];

    if (lastMove != MOVE_PROTECT && lastMove != MOVE_DETECT && lastMove != MOVE_ENDURE)
        gDisableStructs[gBattlerAttacker].protectUses = 0;

    if (gCurrentTurnActionNumber == (gBattlersCount - 1))
        notLastTurn = FALSE;

    if (sProtectSuccessRates[gDisableStructs[gBattlerAttacker].protectUses] >= Random() && notLastTurn)
    {
        if (gMovesInfo[gCurrentMove].effect == EFFECT_PROTECT)
        {
            gProtectStructs[gBattlerAttacker].protected = 1;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_PROTECTED_ITSELF;
        }
        if (gMovesInfo[gCurrentMove].effect == EFFECT_ENDURE)
        {
            gProtectStructs[gBattlerAttacker].endured = 1;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_BRACED_ITSELF;
        }
        gDisableStructs[gBattlerAttacker].protectUses++;
    }
    else
    {
        gDisableStructs[gBattlerAttacker].protectUses = 0;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_PROTECT_FAILED;
        gMoveResultFlags |= MOVE_RESULT_MISSED;
    }

    gBattlescriptCurrInstr++;
}

static void Cmd_tryexplosion(void)
{
    if (gBattleControllerExecFlags)
        return;

    // Explosion can only fail if any battler has Damp
    for (gBattlerTarget = 0; gBattlerTarget < gBattlersCount; gBattlerTarget++)
    {
        if (gBattleMons[gBattlerTarget].ability == ABILITY_DAMP)
            break;
    }

    if (gBattlerTarget == gBattlersCount)
    {
        // Success, no battlers with Damp. Drop user's HP bar to 0
        gActiveBattler = gBattlerAttacker;
        gBattleMoveDamage = gBattleMons[gActiveBattler].hp;
        BtlController_EmitHealthBarUpdate(BUFFER_A, INSTANT_HP_BAR_DROP);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr++;

        // Find first target
        for (gBattlerTarget = 0; gBattlerTarget < gBattlersCount; gBattlerTarget++)
        {
            if (gBattlerTarget == gBattlerAttacker)
                continue;
            if (!(gAbsentBattlerFlags & gBitTable[gBattlerTarget]))
                break;
        }
    }
    else
    {
        // Failed, a battler has Damp
        gLastUsedAbility = ABILITY_DAMP;
        RecordAbilityBattle(gBattlerTarget, gBattleMons[gBattlerTarget].ability);
        gBattlescriptCurrInstr = BattleScript_DampStopsExplosion;
    }
}

static void Cmd_setatkhptozero(void)
{
    if (gBattleControllerExecFlags)
        return;

    gActiveBattler = gBattlerAttacker;
    gBattleMons[gActiveBattler].hp = 0;
    BtlController_EmitSetMonData(BUFFER_A, REQUEST_HP_BATTLE, 0, sizeof(gBattleMons[gActiveBattler].hp), &gBattleMons[gActiveBattler].hp);
    MarkBattlerForControllerExec(gActiveBattler);

    gBattlescriptCurrInstr++;
}

static void Cmd_jumpifnexttargetvalid(void)
{
    const u8 *jumpPtr = T1_READ_PTR(gBattlescriptCurrInstr + 1);

    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
    {
        for (gBattlerTarget++; ; gBattlerTarget++)
        {
            if (gBattlerTarget == gBattlerAttacker)
                continue;
            if (!(gAbsentBattlerFlags & gBitTable[gBattlerTarget]))
                break;
        }

        if (gBattlerTarget >= gBattlersCount)
            gBattlescriptCurrInstr += 5;
        else
            gBattlescriptCurrInstr = jumpPtr;
    }
    else
    {
        gBattlescriptCurrInstr += 5;
    }
}

static void Cmd_tryhealhalfhealth(void)
{
    const u8 *failPtr = T1_READ_PTR(gBattlescriptCurrInstr + 1);

    if (gBattlescriptCurrInstr[5] == BS_ATTACKER)
        gBattlerTarget = gBattlerAttacker;

    gBattleMoveDamage = gBattleMons[gBattlerTarget].maxHP / 2;
    if (gBattleMoveDamage == 0)
        gBattleMoveDamage = 1;
    gBattleMoveDamage *= -1;

    if (gBattleMons[gBattlerTarget].hp == gBattleMons[gBattlerTarget].maxHP)
        gBattlescriptCurrInstr = failPtr;
    else
        gBattlescriptCurrInstr += 6;
}

static void Cmd_trymirrormove(void)
{
    s32 validMovesCount;
    s32 i;
    u16 move;
    u16 validMoves[MAX_BATTLERS_COUNT - 1];

    for (i = 0; i < (MAX_BATTLERS_COUNT - 1); i++) // -1 to exclude the user
        validMoves[i] = MOVE_NONE;

    for (validMovesCount = 0, i = 0; i < gBattlersCount; i++)
    {
        if (i != gBattlerAttacker)
        {
            move = gBattleStruct->lastTakenMoveFrom[gBattlerAttacker][i];

            if (move != MOVE_NONE && move != MOVE_UNAVAILABLE)
            {
                validMoves[validMovesCount] = move;
                validMovesCount++;
            }
        }
    }

    move = T1_READ_16(gBattleStruct->lastTakenMove + gBattlerAttacker * 2);
    move++;move--; // why?

    if (move != MOVE_NONE && move != MOVE_UNAVAILABLE)
    {
        gHitMarker &= ~HITMARKER_ATTACKSTRING_PRINTED;
        gCurrentMove = move;
        gBattlerTarget = GetMoveTarget(gCurrentMove, NO_TARGET_OVERRIDE);
        gBattlescriptCurrInstr = gBattleScriptsForMoveEffects[gMovesInfo[gCurrentMove].effect];
    }
    else if (validMovesCount != 0)
    {
        gHitMarker &= ~HITMARKER_ATTACKSTRING_PRINTED;
        i = Random() % validMovesCount;
        gCurrentMove = validMoves[i];
        gBattlerTarget = GetMoveTarget(gCurrentMove, NO_TARGET_OVERRIDE);
        gBattlescriptCurrInstr = gBattleScriptsForMoveEffects[gMovesInfo[gCurrentMove].effect];
    }
    else // no valid moves found
    {
        gSpecialStatuses[gBattlerAttacker].ppNotAffectedByPressure = TRUE;
        gBattlescriptCurrInstr++;
    }
}

static void Cmd_setrain(void)
{
    if (gBattleWeather & B_WEATHER_RAIN)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_FAILED;
    }
    else
    {
        gBattleWeather = B_WEATHER_RAIN_TEMPORARY;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STARTED_RAIN;
        gWishFutureKnock.weatherDuration = 5;
    }
    gBattlescriptCurrInstr++;
}

static void Cmd_setreflect(void)
{
    if (gSideStatuses[GET_BATTLER_SIDE(gBattlerAttacker)] & SIDE_STATUS_REFLECT)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SIDE_STATUS_FAILED;
    }
    else
    {
        gSideStatuses[GET_BATTLER_SIDE(gBattlerAttacker)] |= SIDE_STATUS_REFLECT;
        gSideTimers[GET_BATTLER_SIDE(gBattlerAttacker)].reflectTimer = 5;
        gSideTimers[GET_BATTLER_SIDE(gBattlerAttacker)].reflectBattlerId = gBattlerAttacker;

        if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE && CountAliveMonsInBattle(BATTLE_ALIVE_SIDE, gBattlerAttacker) == 2)
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_REFLECT_DOUBLE;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_REFLECT_SINGLE;
    }
    gBattlescriptCurrInstr++;
}

static void Cmd_setseeded(void)
{
    if (gMoveResultFlags & MOVE_RESULT_NO_EFFECT || gStatuses3[gBattlerTarget] & STATUS3_LEECHSEED)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_LEECH_SEED_MISS;
    }
    else if (IS_BATTLER_OF_TYPE(gBattlerTarget, TYPE_GRASS))
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_LEECH_SEED_FAIL;
    }
    else
    {
        gStatuses3[gBattlerTarget] |= gBattlerAttacker;
        gStatuses3[gBattlerTarget] |= STATUS3_LEECHSEED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_LEECH_SEED_SET;
    }

    gBattlescriptCurrInstr++;
}

static void Cmd_manipulatedamage(void)
{
    CMD_ARGS(u8 mode);

    switch (cmd->mode)
    {
    case DMG_CHANGE_SIGN:
        gBattleMoveDamage *= -1;
        break;
    case DMG_RECOIL_FROM_MISS:
        if (B_RECOIL_IF_MISS_DMG >= GEN_5)
        {
            // TODO: Dynamax
            // gBattleMoveDamage = GetNonDynamaxMaxHP(gBattlerAttacker) / 2;
            gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 2;
        }
        else if (B_RECOIL_IF_MISS_DMG == GEN_4)
        {
            if ((gBattleMons[gBattlerTarget].maxHP / 2) < gBattleMoveDamage)
            {
                // TODO: Dynamax
                // gBattleMoveDamage = GetNonDynamaxMaxHP(gBattlerTarget) / 2;
                gBattleMoveDamage = gBattleMons[gBattlerTarget].maxHP / 2;
            }
        }
        else
        {
            gBattleMoveDamage /= 2;
        }
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        break;
    case DMG_DOUBLED:
        gBattleMoveDamage *= 2;
        break;
    case DMG_1_8_TARGET_HP:
        // TODO: Dynamax
        // gBattleMoveDamage = GetNonDynamaxMaxHP(gBattlerTarget) / 8;
        gBattleMoveDamage = gBattleMons[gBattlerTarget].maxHP / 8;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        break;
    case DMG_FULL_ATTACKER_HP:
        // TODO: Dynamax
        // gBattleMoveDamage = GetNonDynamaxMaxHP(gBattlerAttacker);
        gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP;
        break;
    case DMG_CURR_ATTACKER_HP:
        // TODO: Dynamax
        // gBattleMoveDamage = GetNonDynamaxHP(gBattlerAttacker);
        gBattleMoveDamage = gBattleMons[gBattlerAttacker].hp;
        break;
    case DMG_BIG_ROOT:
        gBattleMoveDamage = GetDrainedBigRootHp(gBattlerAttacker, gBattleMoveDamage);
        break;
    case DMG_1_2_ATTACKER_HP:
        // TODO: Dynamax
        // gBattleMoveDamage = (GetNonDynamaxMaxHP(gBattlerAttacker) + 1) / 2; // Half of Max HP Rounded UP
        gBattleMoveDamage = (gBattleMons[gBattlerAttacker].maxHP + 1) / 2; // Half of Max HP Rounded UP
        break;
    case DMG_RECOIL_FROM_IMMUNE:
        // TODO: Dynamax
        // gBattleMoveDamage = GetNonDynamaxMaxHP(gBattlerTarget) / 2;
        gBattleMoveDamage = gBattleMons[gBattlerTarget].maxHP / 2;
        break;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_trysetrest(void)
{
    const u8 *failJump = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    gActiveBattler = gBattlerTarget = gBattlerAttacker;
    gBattleMoveDamage = gBattleMons[gBattlerTarget].maxHP * (-1);

    if (gBattleMons[gBattlerTarget].hp == gBattleMons[gBattlerTarget].maxHP)
    {
        gBattlescriptCurrInstr = failJump;
    }
    else
    {
        if (gBattleMons[gBattlerTarget].status1 & ((u8)(~STATUS1_SLEEP)))
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_REST_STATUSED;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_REST;

        gBattleMons[gBattlerTarget].status1 = STATUS1_SLEEP_TURN(3);
        BtlController_EmitSetMonData(BUFFER_A, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[gActiveBattler].status1), &gBattleMons[gActiveBattler].status1);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 5;
    }
}

static void Cmd_jumpifnotfirstturn(void)
{
    const u8 *failJump = T1_READ_PTR(gBattlescriptCurrInstr + 1);

    if (gDisableStructs[gBattlerAttacker].isFirstTurn)
        gBattlescriptCurrInstr += 5;
    else
        gBattlescriptCurrInstr = failJump;
}

static void Cmd_nop(void)
{
    gBattlescriptCurrInstr++;
}

bool8 UproarWakeUpCheck(u8 battlerId)
{
    s32 i;

    for (i = 0; i < gBattlersCount; i++)
    {
        if (!(gBattleMons[i].status2 & STATUS2_UPROAR) || gBattleMons[battlerId].ability == ABILITY_SOUNDPROOF)
            continue;

        gBattleScripting.battler = i;

        if (gBattlerTarget == 0xFF)
            gBattlerTarget = i;
        else if (gBattlerTarget == i)
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CANT_SLEEP_UPROAR;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_UPROAR_KEPT_AWAKE;

        break;
    }

    if (i == gBattlersCount)
        return FALSE;
    else
        return TRUE;
}

static void Cmd_jumpifcantmakeasleep(void)
{
    const u8 *jumpPtr = T1_READ_PTR(gBattlescriptCurrInstr + 1);

    if (UproarWakeUpCheck(gBattlerTarget))
    {
        gBattlescriptCurrInstr = jumpPtr;
    }
    else if (gBattleMons[gBattlerTarget].ability == ABILITY_INSOMNIA
            || gBattleMons[gBattlerTarget].ability == ABILITY_VITAL_SPIRIT)
    {
        gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STAYED_AWAKE_USING;
        gBattlescriptCurrInstr = jumpPtr;
        RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
    }
    else
    {
        gBattlescriptCurrInstr += 5;
    }
}

static void Cmd_stockpile(void)
{
    if (gDisableStructs[gBattlerAttacker].stockpileCounter == 3)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CANT_STOCKPILE;
    }
    else
    {
        gDisableStructs[gBattlerAttacker].stockpileCounter++;

        PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff1, 1, gDisableStructs[gBattlerAttacker].stockpileCounter)

        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STOCKPILED;
    }
    gBattlescriptCurrInstr++;
}

static void Cmd_stockpiletobasedamage(void)
{
    const u8 *jumpPtr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    if (gDisableStructs[gBattlerAttacker].stockpileCounter == 0)
    {
        gBattlescriptCurrInstr = jumpPtr;
    }
    else
    {
        if (gBattleCommunication[MISS_TYPE] != B_MSG_PROTECTED)
        {
            gBattleMoveDamage = CalculateBaseDamageOld(&gBattleMons[gBattlerAttacker], &gBattleMons[gBattlerTarget], gCurrentMove,
                                                    gSideStatuses[GET_BATTLER_SIDE(gBattlerTarget)], 0,
                                                    0, gBattlerAttacker, gBattlerTarget)
                                * gDisableStructs[gBattlerAttacker].stockpileCounter;
            gBattleScripting.animTurn = gDisableStructs[gBattlerAttacker].stockpileCounter;

            if (gProtectStructs[gBattlerAttacker].helpingHand)
                gBattleMoveDamage = gBattleMoveDamage * 15 / 10;
        }

        gDisableStructs[gBattlerAttacker].stockpileCounter = 0;
        gBattlescriptCurrInstr += 5;
    }
}

static void Cmd_stockpiletohpheal(void)
{
    const u8 *jumpPtr = T1_READ_PTR(gBattlescriptCurrInstr + 1);

    if (gDisableStructs[gBattlerAttacker].stockpileCounter == 0)
    {
        gBattlescriptCurrInstr = jumpPtr;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWALLOW_FAILED;
    }
    else if (gBattleMons[gBattlerAttacker].maxHP == gBattleMons[gBattlerAttacker].hp)
    {
        gDisableStructs[gBattlerAttacker].stockpileCounter = 0;
        gBattlescriptCurrInstr = jumpPtr;
        gBattlerTarget = gBattlerAttacker;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWALLOW_FULL_HP;
    }
    else
    {
        gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / (1 << (3 - gDisableStructs[gBattlerAttacker].stockpileCounter));

        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattleMoveDamage *= -1;

        gBattleScripting.animTurn = gDisableStructs[gBattlerAttacker].stockpileCounter;
        gDisableStructs[gBattlerAttacker].stockpileCounter = 0;
        gBattlescriptCurrInstr += 5;
        gBattlerTarget = gBattlerAttacker;
    }
}

static void Cmd_negativedamage(void)
{
    gBattleMoveDamage = -(gHpDealt / 2);
    if (gBattleMoveDamage == 0)
        gBattleMoveDamage = -1;

    gBattlescriptCurrInstr++;
}

static u8 ChangeStatBuffs(s8 statValue, u32 statId, u32 flags, const u8 *BS_ptr)
{
    bool32 certain = FALSE;
    bool32 notProtectAffected = FALSE;
    u32 index;

    if (flags & MOVE_EFFECT_AFFECTS_USER)
        gActiveBattler = gBattlerAttacker;
    else
        gActiveBattler = gBattlerTarget;

    flags &= ~MOVE_EFFECT_AFFECTS_USER;

    if (flags & MOVE_EFFECT_CERTAIN)
        certain++;
    flags &= ~MOVE_EFFECT_CERTAIN;

    if (flags & STAT_CHANGE_NOT_PROTECT_AFFECTED)
        notProtectAffected++;
    flags &= ~STAT_CHANGE_NOT_PROTECT_AFFECTED;

    PREPARE_STAT_BUFFER(gBattleTextBuff1, statId)

    if (statValue <= -1) // Stat decrease.
    {
        if (gSideTimers[GET_BATTLER_SIDE(gActiveBattler)].mistTimer
            && !certain && gCurrentMove != MOVE_CURSE)
        {
            if (flags == STAT_CHANGE_ALLOW_PTR)
            {
                if (gSpecialStatuses[gActiveBattler].statLowered)
                {
                    gBattlescriptCurrInstr = BS_ptr;
                }
                else
                {
                    BattleScriptPush(BS_ptr);
                    gBattleScripting.battler = gActiveBattler;
                    gBattlescriptCurrInstr = BattleScript_MistProtected;
                    gSpecialStatuses[gActiveBattler].statLowered = 1;
                }
            }
            return STAT_CHANGE_DIDNT_WORK;
        }
        else if (gCurrentMove != MOVE_CURSE
                 && notProtectAffected != TRUE && JumpIfMoveAffectedByProtect(0))
        {
            gBattlescriptCurrInstr = BattleScript_ButItFailed;
            return STAT_CHANGE_DIDNT_WORK;
        }
        else if ((gBattleMons[gActiveBattler].ability == ABILITY_CLEAR_BODY
                  || gBattleMons[gActiveBattler].ability == ABILITY_WHITE_SMOKE)
                 && !certain && gCurrentMove != MOVE_CURSE)
        {
            if (flags == STAT_CHANGE_ALLOW_PTR)
            {
                if (gSpecialStatuses[gActiveBattler].statLowered)
                {
                    gBattlescriptCurrInstr = BS_ptr;
                }
                else
                {
                    BattleScriptPush(BS_ptr);
                    gBattleScripting.battler = gActiveBattler;
                    gBattlescriptCurrInstr = BattleScript_AbilityNoStatLoss;
                    gLastUsedAbility = gBattleMons[gActiveBattler].ability;
                    RecordAbilityBattle(gActiveBattler, gLastUsedAbility);
                    gSpecialStatuses[gActiveBattler].statLowered = 1;
                }
            }
            return STAT_CHANGE_DIDNT_WORK;
        }
        else if (gBattleMons[gActiveBattler].ability == ABILITY_KEEN_EYE
                 && !certain && statId == STAT_ACC)
        {
            if (flags == STAT_CHANGE_ALLOW_PTR)
            {
                BattleScriptPush(BS_ptr);
                gBattleScripting.battler = gActiveBattler;
                gBattlescriptCurrInstr = BattleScript_AbilityNoSpecificStatLoss;
                gLastUsedAbility = gBattleMons[gActiveBattler].ability;
                RecordAbilityBattle(gActiveBattler, gLastUsedAbility);
            }
            return STAT_CHANGE_DIDNT_WORK;
        }
        else if (gBattleMons[gActiveBattler].ability == ABILITY_HYPER_CUTTER
                 && !certain && statId == STAT_ATK)
        {
            if (flags == STAT_CHANGE_ALLOW_PTR)
            {
                BattleScriptPush(BS_ptr);
                gBattleScripting.battler = gActiveBattler;
                gBattlescriptCurrInstr = BattleScript_AbilityNoSpecificStatLoss;
                gLastUsedAbility = gBattleMons[gActiveBattler].ability;
                RecordAbilityBattle(gActiveBattler, gLastUsedAbility);
            }
            return STAT_CHANGE_DIDNT_WORK;
        }
        else if (gBattleMons[gActiveBattler].ability == ABILITY_SHIELD_DUST && flags == 0)
        {
            return STAT_CHANGE_DIDNT_WORK;
        }
        else // try to decrease
        {
            statValue = -GET_STAT_BUFF_VALUE(statValue);
            gBattleTextBuff2[0] = B_BUFF_PLACEHOLDER_BEGIN;
            index = 1;
            if (statValue == -2)
            {
                gBattleTextBuff2[1] = B_BUFF_STRING;
                gBattleTextBuff2[2] = STRINGID_STATHARSHLY;
                gBattleTextBuff2[3] = STRINGID_STATHARSHLY >> 8;
                index = 4;
            }
            gBattleTextBuff2[index++] = B_BUFF_STRING;
            gBattleTextBuff2[index++] = STRINGID_STATFELL;
            gBattleTextBuff2[index++] = STRINGID_STATFELL >> 8;
            gBattleTextBuff2[index] = B_BUFF_EOS;

            if (gBattleMons[gActiveBattler].statStages[statId] == MIN_STAT_STAGE)
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STAT_WONT_DECREASE;
            else
                gBattleCommunication[MULTISTRING_CHOOSER] = (gBattlerTarget == gActiveBattler); // B_MSG_ATTACKER_STAT_FELL or B_MSG_DEFENDER_STAT_FELL
        }
    }
    else // stat increase
    {
        statValue = GET_STAT_BUFF_VALUE(statValue);
        gBattleTextBuff2[0] = B_BUFF_PLACEHOLDER_BEGIN;
        index = 1;
        if (statValue == 2)
        {
            gBattleTextBuff2[1] = B_BUFF_STRING;
            gBattleTextBuff2[2] = STRINGID_STATSHARPLY;
            gBattleTextBuff2[3] = STRINGID_STATSHARPLY >> 8;
            index = 4;
        }
        gBattleTextBuff2[index++] = B_BUFF_STRING;
        gBattleTextBuff2[index++] = STRINGID_STATROSE;
        gBattleTextBuff2[index++] = STRINGID_STATROSE >> 8;
        gBattleTextBuff2[index] = B_BUFF_EOS;

        if (gBattleMons[gActiveBattler].statStages[statId] == MAX_STAT_STAGE)
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STAT_WONT_INCREASE;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = (gBattlerTarget == gActiveBattler); // B_MSG_ATTACKER_STAT_ROSE or B_MSG_DEFENDER_STAT_ROSE
    }

    gBattleMons[gActiveBattler].statStages[statId] += statValue;
    if (gBattleMons[gActiveBattler].statStages[statId] < MIN_STAT_STAGE)
        gBattleMons[gActiveBattler].statStages[statId] = MIN_STAT_STAGE;
    if (gBattleMons[gActiveBattler].statStages[statId] > MAX_STAT_STAGE)
        gBattleMons[gActiveBattler].statStages[statId] = MAX_STAT_STAGE;

    if (gBattleCommunication[MULTISTRING_CHOOSER] == B_MSG_STAT_WONT_INCREASE && flags & STAT_CHANGE_ALLOW_PTR)
        gMoveResultFlags |= MOVE_RESULT_MISSED;

    if (gBattleCommunication[MULTISTRING_CHOOSER] == B_MSG_STAT_WONT_INCREASE && !(flags & STAT_CHANGE_ALLOW_PTR))
        return STAT_CHANGE_DIDNT_WORK;

    return STAT_CHANGE_WORKED;
}

static void Cmd_statbuffchange(void)
{
    CMD_ARGS(u16 flags, const u8 *failInstr);
    u16 flags = cmd->flags;
    const u8 *ptrBefore = gBattlescriptCurrInstr;
    const u8 *failInstr = cmd->failInstr;

    if (ChangeStatBuffs(gBattleScripting.statChanger & 0xF0, GET_STAT_BUFF_ID(gBattleScripting.statChanger), flags, failInstr) == STAT_CHANGE_WORKED)
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = ptrBefore;
    }
}

// Haze
static void Cmd_normalisebuffs(void)
{
    s32 i, j;

    for (i = 0; i < gBattlersCount; i++)
    {
        for (j = 0; j < NUM_BATTLE_STATS; j++)
            gBattleMons[i].statStages[j] = DEFAULT_STAT_STAGE;
    }

    gBattlescriptCurrInstr++;
}

bool32 TryResetBattlerStatChanges(u8 battler)
{
    u32 j;
    bool32 ret = FALSE;

    gDisableStructs[battler].stockpileDef = 0;
    gDisableStructs[battler].stockpileSpDef = 0;
    for (j = 0; j < NUM_BATTLE_STATS; j++)
    {
        if (gBattleMons[battler].statStages[j] != DEFAULT_STAT_STAGE)
            ret = TRUE; // returns TRUE if any stat was reset

        gBattleMons[battler].statStages[j] = DEFAULT_STAT_STAGE;
    }

    return ret;
}

static void Cmd_setbide(void)
{
    gBattleMons[gBattlerAttacker].status2 |= STATUS2_MULTIPLETURNS;
    gLockedMoves[gBattlerAttacker] = gCurrentMove;
    gTakenDmg[gBattlerAttacker] = 0;
    gBattleMons[gBattlerAttacker].status2 |= STATUS2_BIDE_TURN(2);

    gBattlescriptCurrInstr++;
}

static void Cmd_confuseifrepeatingattackends(void)
{
    if (!(gBattleMons[gBattlerAttacker].status2 & STATUS2_LOCK_CONFUSE))
    {
        gBattleScripting.moveEffect = (MOVE_EFFECT_THRASH | MOVE_EFFECT_AFFECTS_USER);
    }

    gBattlescriptCurrInstr++;
}

static void Cmd_setmultihitcounter(void)
{
    if (gBattlescriptCurrInstr[1])
    {
        gMultiHitCounter = gBattlescriptCurrInstr[1];
    }
    else
    {
        gMultiHitCounter = Random() & 3;
        if (gMultiHitCounter > 1)
            gMultiHitCounter = (Random() & 3) + 2;
        else
            gMultiHitCounter += 2;
    }

    gBattlescriptCurrInstr += 2;
}

static void Cmd_initmultihitstring(void)
{
    PREPARE_BYTE_NUMBER_BUFFER(gBattleScripting.multihitString, 1, 0)

    gBattlescriptCurrInstr++;
}

static bool8 TryDoForceSwitchOut(void)
{
    if (gBattleMons[gBattlerAttacker].level >= gBattleMons[gBattlerTarget].level)
    {
        *(gBattleStruct->battlerPartyIndexes + gBattlerTarget) = gBattlerPartyIndexes[gBattlerTarget];
    }
    else
    {
        u16 random = Random() & 0xFF;
        if ((u32)((random * (gBattleMons[gBattlerAttacker].level + gBattleMons[gBattlerTarget].level) >> 8) + 1) <= (gBattleMons[gBattlerTarget].level / 4))
        {
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
            return FALSE;
        }
        *(gBattleStruct->battlerPartyIndexes + gBattlerTarget) = gBattlerPartyIndexes[gBattlerTarget];
    }

    gBattlescriptCurrInstr = BattleScript_SuccessForceOut;
    return TRUE;
}

#define MON_CAN_BATTLE(mon) (((GetMonData(mon, MON_DATA_SPECIES) && GetMonData(mon, MON_DATA_IS_EGG) != TRUE && GetMonData(mon, MON_DATA_HP))))

static void Cmd_forcerandomswitch(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
    {
        u8 i;
        struct Pokemon *party;
        u8 valid;
        u8 val;

        if (GetBattlerSide(gBattlerTarget) == B_SIDE_PLAYER)
            party = gPlayerParty;
        else
            party = gEnemyParty;

        if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
        {
            valid = 0;
            val = 0;
            if (GetLinkTrainerFlankId(GetBattlerMultiplayerId(gBattlerTarget)) == 1)
                val = PARTY_SIZE / 2;
            for (i = val; i < val + (PARTY_SIZE / 2); i++)
            {
                if (GetMonData(&party[i], MON_DATA_SPECIES) != SPECIES_NONE
                 && !GetMonData(&party[i], MON_DATA_IS_EGG)
                 && GetMonData(&party[i], MON_DATA_HP) != 0)
                    ++valid;
            }
        }
        else
        {
            valid = 0;
            for (i = 0; i < PARTY_SIZE; i++)
            {
                if (GetMonData(&party[i], MON_DATA_SPECIES) != SPECIES_NONE
                 && !GetMonData(&party[i], MON_DATA_IS_EGG)
                 && GetMonData(&party[i], MON_DATA_HP) != 0)
                    ++valid;
            }
        }

        // Fails if there's only 1 mon left in single battle or there's less than 3 left in non-multi double battle.
        if ((valid < 2 && (gBattleTypeFlags & (BATTLE_TYPE_DOUBLE | BATTLE_TYPE_MULTI)) != BATTLE_TYPE_DOUBLE)
         || (valid < 3 && (gBattleTypeFlags & BATTLE_TYPE_DOUBLE) && !(gBattleTypeFlags & BATTLE_TYPE_MULTI)))
        {
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        }
        else if (TryDoForceSwitchOut())
        {
            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                do
                {
                    val = Random() % (PARTY_SIZE / 2);
                    if (GetLinkTrainerFlankId(GetBattlerMultiplayerId(gBattlerTarget)) == 1)
                        i = val + (PARTY_SIZE / 2);
                    else
                        i = val;
                }
                while (i == gBattlerPartyIndexes[gBattlerTarget]
                      || i == gBattlerPartyIndexes[gBattlerTarget ^ 2]
                      || !MON_CAN_BATTLE(&party[i]));
            }
            else
            {
                if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                {
                    do
                    {
                        i = Random() % PARTY_SIZE;
                    }
                    while (i == gBattlerPartyIndexes[gBattlerTarget]
                        || i == gBattlerPartyIndexes[gBattlerTarget ^ 2]
                        || !MON_CAN_BATTLE(&party[i]));
                }
                else
                {
                    do
                    {
                        i = Random() % PARTY_SIZE;
                    }
                    while (i == gBattlerPartyIndexes[gBattlerTarget]
                        || !MON_CAN_BATTLE(&party[i]));
                }
            }
            *(gBattleStruct->monToSwitchIntoId + gBattlerTarget) = i;
            if (!IsMultiBattle())
                UpdatePartyOwnerOnSwitch_NonMulti(gBattlerTarget);
            SwitchPartyOrderLinkMulti(gBattlerTarget, i, 0);
            SwitchPartyOrderLinkMulti(gBattlerTarget ^ BIT_FLANK, i, 1);
        }
    }
    else
    {
        TryDoForceSwitchOut();
    }
}

// Randomly changes user's type to one of its moves' type
static void Cmd_tryconversiontypechange(void)
{
    u8 validMoves = 0;
    u8 moveChecked;
    u8 moveType;

    while (validMoves < MAX_MON_MOVES)
    {
        if (gBattleMons[gBattlerAttacker].moves[validMoves] == MOVE_NONE)
            break;

        validMoves++;
    }

    for (moveChecked = 0; moveChecked < validMoves; moveChecked++)
    {
        moveType = gMovesInfo[gBattleMons[gBattlerAttacker].moves[moveChecked]].type;

        if (moveType == TYPE_MYSTERY)
        {
            if (IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_GHOST))
                moveType = TYPE_GHOST;
            else
                moveType = TYPE_NORMAL;
        }
        if (moveType != gBattleMons[gBattlerAttacker].type1
            && moveType != gBattleMons[gBattlerAttacker].type2)
        {
            break;
        }
    }

    if (moveChecked == validMoves)
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        do
        {
            while ((moveChecked = Random() & (MAX_MON_MOVES - 1)) >= validMoves);

            moveType = gMovesInfo[gBattleMons[gBattlerAttacker].moves[moveChecked]].type;

            if (moveType == TYPE_MYSTERY)
            {
                if (IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_GHOST))
                    moveType = TYPE_GHOST;
                else
                    moveType = TYPE_NORMAL;
            }
        }
        while (moveType == gBattleMons[gBattlerAttacker].type1 || moveType == gBattleMons[gBattlerAttacker].type2);

        SET_BATTLER_TYPE(gBattlerAttacker, moveType);
        PREPARE_TYPE_BUFFER(gBattleTextBuff1, moveType);

        gBattlescriptCurrInstr += 5;
    }
}

static void Cmd_givepaydaymoney(void)
{
    if (!(gBattleTypeFlags & BATTLE_TYPE_LINK) && gPaydayMoney != 0)
    {
        u32 bonusMoney = gPaydayMoney * gBattleStruct->moneyMultiplier;
        AddMoney(&gSaveBlock1Ptr->money, bonusMoney);

        PREPARE_HWORD_NUMBER_BUFFER(gBattleTextBuff1, 5, bonusMoney)

        BattleScriptPush(gBattlescriptCurrInstr + 1);
        gBattlescriptCurrInstr = BattleScript_PrintPayDayMoneyString;
    }
    else
    {
        gBattlescriptCurrInstr++;
    }
}

static void Cmd_setlightscreen(void)
{
    if (gSideStatuses[GET_BATTLER_SIDE(gBattlerAttacker)] & SIDE_STATUS_LIGHTSCREEN)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SIDE_STATUS_FAILED;
    }
    else
    {
        gSideStatuses[GET_BATTLER_SIDE(gBattlerAttacker)] |= SIDE_STATUS_LIGHTSCREEN;
        gSideTimers[GET_BATTLER_SIDE(gBattlerAttacker)].lightscreenTimer = 5;
        gSideTimers[GET_BATTLER_SIDE(gBattlerAttacker)].lightscreenBattlerId = gBattlerAttacker;

        if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE && CountAliveMonsInBattle(BATTLE_ALIVE_SIDE, gBattlerAttacker) == 2)
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_LIGHTSCREEN_DOUBLE;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_LIGHTSCREEN_SINGLE;
    }

    gBattlescriptCurrInstr++;
}

static void Cmd_tryKO(void)
{
    u8 holdEffect, param;

    if (gBattleMons[gBattlerTarget].item == ITEM_ENIGMA_BERRY)
    {
       holdEffect = gEnigmaBerries[gBattlerTarget].holdEffect;
       param = gEnigmaBerries[gBattlerTarget].holdEffectParam;
    }
    else
    {
        holdEffect = ItemId_GetHoldEffect(gBattleMons[gBattlerTarget].item);
        param = ItemId_GetHoldEffectParam(gBattleMons[gBattlerTarget].item);
    }

    gPotentialItemEffectBattler = gBattlerTarget;

    if (holdEffect == HOLD_EFFECT_FOCUS_BAND && (Random() % 100) < param)
    {
        RecordItemEffectBattle(gBattlerTarget, HOLD_EFFECT_FOCUS_BAND);
        gSpecialStatuses[gBattlerTarget].focusBanded = 1;
    }

    if (gBattleMons[gBattlerTarget].ability == ABILITY_STURDY)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gLastUsedAbility = ABILITY_STURDY;
        gBattlescriptCurrInstr = BattleScript_SturdyPreventsOHKO;
        RecordAbilityBattle(gBattlerTarget, ABILITY_STURDY);
    }
    else
    {
        u16 chance;
        if (!(gStatuses3[gBattlerTarget] & STATUS3_ALWAYS_HITS))
        {
            chance = gMovesInfo[gCurrentMove].accuracy + (gBattleMons[gBattlerAttacker].level - gBattleMons[gBattlerTarget].level);
            if (Random() % 100 + 1 < chance && gBattleMons[gBattlerAttacker].level >= gBattleMons[gBattlerTarget].level)
                chance = TRUE;
            else
                chance = FALSE;
        }
        else if (gDisableStructs[gBattlerTarget].battlerWithSureHit == gBattlerAttacker
                 && gBattleMons[gBattlerAttacker].level >= gBattleMons[gBattlerTarget].level)
        {
            chance = TRUE;
        }
        else
        {
            chance = gMovesInfo[gCurrentMove].accuracy + (gBattleMons[gBattlerAttacker].level - gBattleMons[gBattlerTarget].level);
            if (Random() % 100 + 1 < chance && gBattleMons[gBattlerAttacker].level >= gBattleMons[gBattlerTarget].level)
                chance = TRUE;
            else
                chance = FALSE;
        }
        if (chance)
        {
            if (gProtectStructs[gBattlerTarget].endured)
            {
                gBattleMoveDamage = gBattleMons[gBattlerTarget].hp - 1;
                gMoveResultFlags |= MOVE_RESULT_FOE_ENDURED;
            }
            else if (gSpecialStatuses[gBattlerTarget].focusBanded)
            {
                gBattleMoveDamage = gBattleMons[gBattlerTarget].hp - 1;
                gMoveResultFlags |= MOVE_RESULT_FOE_HUNG_ON;
                gLastUsedItem = gBattleMons[gBattlerTarget].item;
            }
            else
            {
                gBattleMoveDamage = gBattleMons[gBattlerTarget].hp;
                gMoveResultFlags |= MOVE_RESULT_ONE_HIT_KO;
            }
            gBattlescriptCurrInstr += 5;
        }
        else
        {
            gMoveResultFlags |= MOVE_RESULT_MISSED;
            if (gBattleMons[gBattlerAttacker].level >= gBattleMons[gBattlerTarget].level)
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_KO_MISS;
            else
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_KO_UNAFFECTED;
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        }
    }
}

// Super Fang
static void Cmd_damagetohalftargethp(void)
{
    gBattleMoveDamage = gBattleMons[gBattlerTarget].hp / 2;
    if (gBattleMoveDamage == 0)
        gBattleMoveDamage = 1;

    gBattlescriptCurrInstr++;
}

static void Cmd_setsandstorm(void)
{
    if (gBattleWeather & B_WEATHER_SANDSTORM)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_FAILED;
    }
    else
    {
        gBattleWeather = B_WEATHER_SANDSTORM_TEMPORARY;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STARTED_SANDSTORM;
        gWishFutureKnock.weatherDuration = 5;
    }
    gBattlescriptCurrInstr++;
}

static void Cmd_weatherdamage(void)
{
    if (IS_BATTLE_TYPE_GHOST_WITHOUT_SCOPE(gBattleTypeFlags)
     && (GetBattlerSide(gBattlerAttacker) == B_SIDE_OPPONENT))
    {
        gBattleMoveDamage = 0;
        gBattlescriptCurrInstr++;
        return;
    }
    if (WEATHER_HAS_EFFECT)
    {
        if (gBattleWeather & B_WEATHER_SANDSTORM)
        {
            if (gBattleMons[gBattlerAttacker].type1 != TYPE_ROCK
                && gBattleMons[gBattlerAttacker].type1 != TYPE_STEEL
                && gBattleMons[gBattlerAttacker].type1 != TYPE_GROUND
                && gBattleMons[gBattlerAttacker].type2 != TYPE_ROCK
                && gBattleMons[gBattlerAttacker].type2 != TYPE_STEEL
                && gBattleMons[gBattlerAttacker].type2 != TYPE_GROUND
                && gBattleMons[gBattlerAttacker].ability != ABILITY_SAND_VEIL
                && !(gStatuses3[gBattlerAttacker] & STATUS3_UNDERGROUND)
                && !(gStatuses3[gBattlerAttacker] & STATUS3_UNDERWATER))
            {
                gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 16;
                if (gBattleMoveDamage == 0)
                    gBattleMoveDamage = 1;
            }
            else
            {
                gBattleMoveDamage = 0;
            }
        }
        if (gBattleWeather & B_WEATHER_HAIL)
        {
            if (!IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_ICE)
                && !(gStatuses3[gBattlerAttacker] & STATUS3_UNDERGROUND)
                && !(gStatuses3[gBattlerAttacker] & STATUS3_UNDERWATER))
            {
                gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 16;
                if (gBattleMoveDamage == 0)
                    gBattleMoveDamage = 1;
            }
            else
            {
                gBattleMoveDamage = 0;
            }
        }
    }
    else
    {
        gBattleMoveDamage = 0;
    }

    if (gAbsentBattlerFlags & gBitTable[gBattlerAttacker])
        gBattleMoveDamage = 0;

    gBattlescriptCurrInstr++;
}

static void Cmd_tryinfatuating(void)
{
    struct Pokemon *monAttacker, *monTarget;
    u16 speciesAttacker, speciesTarget;
    u32 personalityAttacker, personalityTarget;

    if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
        monAttacker = &gPlayerParty[gBattlerPartyIndexes[gBattlerAttacker]];
    else
        monAttacker = &gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker]];

    if (GetBattlerSide(gBattlerTarget) == B_SIDE_PLAYER)
        monTarget = &gPlayerParty[gBattlerPartyIndexes[gBattlerTarget]];
    else
        monTarget = &gEnemyParty[gBattlerPartyIndexes[gBattlerTarget]];

    speciesAttacker = GetMonData(monAttacker, MON_DATA_SPECIES);
    personalityAttacker = GetMonData(monAttacker, MON_DATA_PERSONALITY);

    speciesTarget = GetMonData(monTarget, MON_DATA_SPECIES);
    personalityTarget = GetMonData(monTarget, MON_DATA_PERSONALITY);

    if (gBattleMons[gBattlerTarget].ability == ABILITY_OBLIVIOUS)
    {
        gBattlescriptCurrInstr = BattleScript_ObliviousPreventsAttraction;
        gLastUsedAbility = ABILITY_OBLIVIOUS;
        RecordAbilityBattle(gBattlerTarget, ABILITY_OBLIVIOUS);
    }
    else
    {
        if (GetGenderFromSpeciesAndPersonality(speciesAttacker, personalityAttacker) == GetGenderFromSpeciesAndPersonality(speciesTarget, personalityTarget)
            || gBattleMons[gBattlerTarget].status2 & STATUS2_INFATUATION
            || GetGenderFromSpeciesAndPersonality(speciesAttacker, personalityAttacker) == MON_GENDERLESS
            || GetGenderFromSpeciesAndPersonality(speciesTarget, personalityTarget) == MON_GENDERLESS)
        {
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        }
        else
        {
            gBattleMons[gBattlerTarget].status2 |= STATUS2_INFATUATED_WITH(gBattlerAttacker);
            gBattlescriptCurrInstr += 5;
        }
    }
}

static void Cmd_updatestatusicon(void)
{
    if (gBattleControllerExecFlags)
        return;

    if (gBattlescriptCurrInstr[1] == BS_PLAYER2)
    {
        for (gActiveBattler = gBattleControllerExecFlags; gActiveBattler < gBattlersCount; gActiveBattler++)
        {
            if (!(gAbsentBattlerFlags & gBitTable[gActiveBattler]))
            {
                BtlController_EmitStatusIconUpdate(BUFFER_A, gBattleMons[gActiveBattler].status1, gBattleMons[gActiveBattler].status2);
                MarkBattlerForControllerExec(gActiveBattler);
            }
        }
        gBattlescriptCurrInstr += 2;
    }
    else if (gBattlescriptCurrInstr[1] == BS_ATTACKER_WITH_PARTNER)
    {
        gActiveBattler = gBattlerAttacker;
        if (!(gAbsentBattlerFlags & gBitTable[gActiveBattler]))
        {
            BtlController_EmitStatusIconUpdate(BUFFER_A, gBattleMons[gActiveBattler].status1, gBattleMons[gActiveBattler].status2);
            MarkBattlerForControllerExec(gActiveBattler);
        }
        if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
        {
            gActiveBattler = GetBattlerAtPosition(GetBattlerPosition(gBattlerAttacker) ^ BIT_FLANK);
            if (!(gAbsentBattlerFlags & gBitTable[gActiveBattler]))
            {
                BtlController_EmitStatusIconUpdate(BUFFER_A, gBattleMons[gActiveBattler].status1, gBattleMons[gActiveBattler].status2);
                MarkBattlerForControllerExec(gActiveBattler);
            }
        }
        gBattlescriptCurrInstr += 2;
    }
    else
    {

        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        BtlController_EmitStatusIconUpdate(BUFFER_A, gBattleMons[gActiveBattler].status1, gBattleMons[gActiveBattler].status2);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 2;
    }
}

static void Cmd_setmist(void)
{
    if (gSideTimers[GET_BATTLER_SIDE(gBattlerAttacker)].mistTimer)
    {
        gMoveResultFlags |= MOVE_RESULT_FAILED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MIST_FAILED;
    }
    else
    {
        gSideTimers[GET_BATTLER_SIDE(gBattlerAttacker)].mistTimer = 5;
        gSideTimers[GET_BATTLER_SIDE(gBattlerAttacker)].mistBattlerId = gBattlerAttacker;
        gSideStatuses[GET_BATTLER_SIDE(gBattlerAttacker)] |= SIDE_STATUS_MIST;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_MIST;
    }
    gBattlescriptCurrInstr++;
}

static void Cmd_setfocusenergy(void)
{
    if (gBattleMons[gBattlerAttacker].status2 & STATUS2_FOCUS_ENERGY)
    {
        gMoveResultFlags |= MOVE_RESULT_FAILED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_FOCUS_ENERGY_FAILED;
    }
    else
    {
        gBattleMons[gBattlerAttacker].status2 |= STATUS2_FOCUS_ENERGY;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_GETTING_PUMPED;
    }
    gBattlescriptCurrInstr++;
}

static void Cmd_transformdataexecution(void)
{
    gChosenMove = MOVE_UNAVAILABLE;
    gBattlescriptCurrInstr++;
    if (gBattleMons[gBattlerTarget].status2 & STATUS2_TRANSFORMED
        || gStatuses3[gBattlerTarget] & STATUS3_SEMI_INVULNERABLE)
    {
        gMoveResultFlags |= MOVE_RESULT_FAILED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TRANSFORM_FAILED;
    }
    else
    {
        s32 i;
        u8 *battleMonAttacker, *battleMonTarget;

        gBattleMons[gBattlerAttacker].status2 |= STATUS2_TRANSFORMED;
        gDisableStructs[gBattlerAttacker].disabledMove = MOVE_NONE;
        gDisableStructs[gBattlerAttacker].disableTimer = 0;
        gDisableStructs[gBattlerAttacker].transformedMonPersonality = gBattleMons[gBattlerTarget].personality;
        gDisableStructs[gBattlerAttacker].mimickedMoves = 0;

        PREPARE_SPECIES_BUFFER(gBattleTextBuff1, gBattleMons[gBattlerTarget].species)

        battleMonAttacker = (u8 *)(&gBattleMons[gBattlerAttacker]);
        battleMonTarget = (u8 *)(&gBattleMons[gBattlerTarget]);

        for (i = 0; i < offsetof(struct BattlePokemon, pp); i++)
            battleMonAttacker[i] = battleMonTarget[i];

        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            if (gMovesInfo[gBattleMons[gBattlerAttacker].moves[i]].pp < 5)
                gBattleMons[gBattlerAttacker].pp[i] = gMovesInfo[gBattleMons[gBattlerAttacker].moves[i]].pp;
            else
                gBattleMons[gBattlerAttacker].pp[i] = 5;
        }

        gActiveBattler = gBattlerAttacker;
        BtlController_EmitResetActionMoveSelection(BUFFER_A, RESET_MOVE_SELECTION);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TRANSFORMED;
    }
}

static void Cmd_setsubstitute(void)
{
    u32 hp = gBattleMons[gBattlerAttacker].maxHP / 4;
    if (gBattleMons[gBattlerAttacker].maxHP / 4 == 0)
        hp = 1;

    if (gBattleMons[gBattlerAttacker].hp <= hp)
    {
        gBattleMoveDamage = 0;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SUBSTITUTE_FAILED;
    }
    else
    {
        gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 4; // one bit value will only work for pokemon which max hp can go to 1020(which is more than possible in games)
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;

        gBattleMons[gBattlerAttacker].status2 |= STATUS2_SUBSTITUTE;
        gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_WRAPPED;
        gDisableStructs[gBattlerAttacker].substituteHP = gBattleMoveDamage;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_SUBSTITUTE;
        gHitMarker |= HITMARKER_IGNORE_SUBSTITUTE;
    }

    gBattlescriptCurrInstr++;
}

static bool8 IsMoveUncopyableByMimic(u16 move)
{
    s32 i;
    for (i = 0; sMovesForbiddenToCopy[i] != MIMIC_FORBIDDEN_END
                && sMovesForbiddenToCopy[i] != move; i++);

    return (sMovesForbiddenToCopy[i] != MIMIC_FORBIDDEN_END);
}

static void Cmd_mimicattackcopy(void)
{
    gChosenMove = MOVE_UNAVAILABLE;

    if (IsMoveUncopyableByMimic(gLastMoves[gBattlerTarget])
        || gBattleMons[gBattlerAttacker].status2 & STATUS2_TRANSFORMED
        || gLastMoves[gBattlerTarget] == MOVE_NONE
        || gLastMoves[gBattlerTarget] == MOVE_UNAVAILABLE)
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        int i;

        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            if (gBattleMons[gBattlerAttacker].moves[i] == gLastMoves[gBattlerTarget])
                break;
        }

        if (i == MAX_MON_MOVES)
        {
            gBattleMons[gBattlerAttacker].moves[gCurrMovePos] = gLastMoves[gBattlerTarget];
            if (gMovesInfo[gLastMoves[gBattlerTarget]].pp < 5)
                gBattleMons[gBattlerAttacker].pp[gCurrMovePos] = gMovesInfo[gLastMoves[gBattlerTarget]].pp;
            else
                gBattleMons[gBattlerAttacker].pp[gCurrMovePos] = 5;

            PREPARE_MOVE_BUFFER(gBattleTextBuff1, gLastMoves[gBattlerTarget])

            gDisableStructs[gBattlerAttacker].mimickedMoves |= gBitTable[gCurrMovePos];
            gBattlescriptCurrInstr += 5;
        }
        else
        {
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        }
    }
}

static void Cmd_metronome(void)
{
    while (TRUE)
    {
        s32 i;

        gCurrentMove = (Random() & 0x1FF) + 1;
        if (gCurrentMove >= MOVES_COUNT)
            continue;

        for (i = 0; i < MAX_MON_MOVES; i++); // ?

        i = -1;
        while (TRUE)
        {
            i++;
            if (sMovesForbiddenToCopy[i] == gCurrentMove)
                break;
            if (sMovesForbiddenToCopy[i] == METRONOME_FORBIDDEN_END)
                break;
        }

        if (sMovesForbiddenToCopy[i] == METRONOME_FORBIDDEN_END)
        {
            gHitMarker &= ~HITMARKER_ATTACKSTRING_PRINTED;
            gBattlescriptCurrInstr = gBattleScriptsForMoveEffects[gMovesInfo[gCurrentMove].effect];
            gBattlerTarget = GetMoveTarget(gCurrentMove, NO_TARGET_OVERRIDE);
            return;
        }
    }
}

static void Cmd_dmgtolevel(void)
{
    gBattleMoveDamage = gBattleMons[gBattlerAttacker].level;
    gBattlescriptCurrInstr++;
}

static void Cmd_psywavedamageeffect(void)
{
    s32 randDamage;

    while ((randDamage = Random() % 16) > 10);

    randDamage *= 10;
    gBattleMoveDamage = gBattleMons[gBattlerAttacker].level * (randDamage + 50) / 100;
    gBattlescriptCurrInstr++;
}

static void Cmd_counterdamagecalculator(void)
{
    u8 sideAttacker = GetBattlerSide(gBattlerAttacker);
    u8 sideTarget = GetBattlerSide(gProtectStructs[gBattlerAttacker].physicalBattlerId);

    if (gProtectStructs[gBattlerAttacker].physicalDmg
        && sideAttacker != sideTarget
        && gBattleMons[gProtectStructs[gBattlerAttacker].physicalBattlerId].hp)
    {
        gBattleMoveDamage = gProtectStructs[gBattlerAttacker].physicalDmg * 2;

        if (gSideTimers[sideTarget].followmeTimer && gBattleMons[gSideTimers[sideTarget].followmeTarget].hp)
            gBattlerTarget = gSideTimers[sideTarget].followmeTarget;
        else
            gBattlerTarget = gProtectStructs[gBattlerAttacker].physicalBattlerId;

        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gSpecialStatuses[gBattlerAttacker].ppNotAffectedByPressure = 1;
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

// A copy of Cmd_counterdamagecalculator with the physical -> special field changes
static void Cmd_mirrorcoatdamagecalculator(void)
{
    u8 sideAttacker = GetBattlerSide(gBattlerAttacker);
    u8 sideTarget = GetBattlerSide(gProtectStructs[gBattlerAttacker].specialBattlerId);

    if (gProtectStructs[gBattlerAttacker].specialDmg && sideAttacker != sideTarget && gBattleMons[gProtectStructs[gBattlerAttacker].specialBattlerId].hp)
    {
        gBattleMoveDamage = gProtectStructs[gBattlerAttacker].specialDmg * 2;

        if (gSideTimers[sideTarget].followmeTimer && gBattleMons[gSideTimers[sideTarget].followmeTarget].hp)
            gBattlerTarget = gSideTimers[sideTarget].followmeTarget;
        else
            gBattlerTarget = gProtectStructs[gBattlerAttacker].specialBattlerId;

        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gSpecialStatuses[gBattlerAttacker].ppNotAffectedByPressure = 1;
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void Cmd_disablelastusedattack(void)
{
    s32 i;

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (gBattleMons[gBattlerTarget].moves[i] == gLastMoves[gBattlerTarget])
            break;
    }
    if (gDisableStructs[gBattlerTarget].disabledMove == MOVE_NONE
        && i != MAX_MON_MOVES && gBattleMons[gBattlerTarget].pp[i] != 0)
    {
        PREPARE_MOVE_BUFFER(gBattleTextBuff1, gBattleMons[gBattlerTarget].moves[i])

        gDisableStructs[gBattlerTarget].disabledMove = gBattleMons[gBattlerTarget].moves[i];
        gDisableStructs[gBattlerTarget].disableTimer = (Random() & 3) + 2;
        // gDisableStructs[gBattlerTarget].disableTimerStartValue = gDisableStructs[gBattlerTarget].disableTimer; // used to save the random amount of turns?
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void Cmd_trysetencore(void)
{
    s32 i;

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (gBattleMons[gBattlerTarget].moves[i] == gLastMoves[gBattlerTarget])
            break;
    }

    if (gLastMoves[gBattlerTarget] == MOVE_STRUGGLE
        || gLastMoves[gBattlerTarget] == MOVE_ENCORE
        || gLastMoves[gBattlerTarget] == MOVE_MIRROR_MOVE)
    {
        i = MAX_MON_MOVES;
    }

    if (gDisableStructs[gBattlerTarget].encoredMove == MOVE_NONE
        && i != MAX_MON_MOVES && gBattleMons[gBattlerTarget].pp[i] != 0)
    {
        gDisableStructs[gBattlerTarget].encoredMove = gBattleMons[gBattlerTarget].moves[i];
        gDisableStructs[gBattlerTarget].encoredMovePos = i;
        gDisableStructs[gBattlerTarget].encoreTimer = (Random() & 3) + 3;
        // gDisableStructs[gBattlerTarget].encoreTimerStartValue = gDisableStructs[gBattlerTarget].encoreTimer;
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void Cmd_painsplitdmgcalc(void)
{
    if (!(gBattleMons[gBattlerTarget].status2 & STATUS2_SUBSTITUTE))
    {
        s32 hpDiff = (gBattleMons[gBattlerAttacker].hp + gBattleMons[gBattlerTarget].hp) / 2;
        s32 painSplitHp = gBattleMoveDamage = gBattleMons[gBattlerTarget].hp - hpDiff;
        u8 *storeLoc = (void *)(&gBattleScripting.painSplitHp);

        storeLoc[0] = (painSplitHp);
        storeLoc[1] = (painSplitHp & 0x0000FF00) >> 8;
        storeLoc[2] = (painSplitHp & 0x00FF0000) >> 16;
        storeLoc[3] = (painSplitHp & 0xFF000000) >> 24;

        gBattleMoveDamage = gBattleMons[gBattlerAttacker].hp - hpDiff;
        gSpecialStatuses[gBattlerTarget].dmg = 0xFFFF;

        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

// Conversion 2
static void Cmd_settypetorandomresistance(void)
{
    if (gLastLandedMoves[gBattlerAttacker] == MOVE_NONE
     || gLastLandedMoves[gBattlerAttacker] == MOVE_UNAVAILABLE)
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else if (IsTwoTurnsMove(gLastLandedMoves[gBattlerAttacker])
            && gBattleMons[gLastHitBy[gBattlerAttacker]].status2 & STATUS2_MULTIPLETURNS)
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        s32 i, j, rands;

        for (rands = 0; rands < 1000; rands++)
        {
            while (((i = Random() % 128) > sizeof(gTypeEffectiveness) / 3));

            i *= 3;

            if (TYPE_EFFECT_ATK_TYPE(i) == gLastHitByType[gBattlerAttacker]
                && TYPE_EFFECT_MULTIPLIER(i) <= TYPE_MUL_NOT_EFFECTIVE
                && !IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_EFFECT_DEF_TYPE(i)))
            {
                SET_BATTLER_TYPE(gBattlerAttacker, TYPE_EFFECT_DEF_TYPE(i));
                PREPARE_TYPE_BUFFER(gBattleTextBuff1, TYPE_EFFECT_DEF_TYPE(i));

                gBattlescriptCurrInstr += 5;
                return;
            }
        }

        for (j = 0, rands = 0; rands < sizeof(gTypeEffectiveness); j += 3, rands += 3)
        {
            switch (TYPE_EFFECT_ATK_TYPE(j))
            {
            case TYPE_ENDTABLE:
            case TYPE_FORESIGHT:
                break;
            default:
                if (TYPE_EFFECT_ATK_TYPE(j) == gLastHitByType[gBattlerAttacker]
                 && TYPE_EFFECT_MULTIPLIER(j) <= 5
                 && !IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_EFFECT_DEF_TYPE(i)))
                {
                    SET_BATTLER_TYPE(gBattlerAttacker, TYPE_EFFECT_DEF_TYPE(rands));
                    PREPARE_TYPE_BUFFER(gBattleTextBuff1, TYPE_EFFECT_DEF_TYPE(rands))

                    gBattlescriptCurrInstr += 5;
                    return;
                }
                break;
            }
        }

        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void Cmd_setalwayshitflag(void)
{
    gStatuses3[gBattlerTarget] &= ~STATUS3_ALWAYS_HITS;
    gStatuses3[gBattlerTarget] |= STATUS3_ALWAYS_HITS_TURN(2);
    gDisableStructs[gBattlerTarget].battlerWithSureHit = gBattlerAttacker;
    gBattlescriptCurrInstr++;
}

// Sketch
static void Cmd_copymovepermanently(void)
{
    gChosenMove = MOVE_UNAVAILABLE;

    if (!(gBattleMons[gBattlerAttacker].status2 & STATUS2_TRANSFORMED)
        && gLastPrintedMoves[gBattlerTarget] != MOVE_STRUGGLE
        && gLastPrintedMoves[gBattlerTarget] != MOVE_NONE
        && gLastPrintedMoves[gBattlerTarget] != MOVE_UNAVAILABLE
        && gLastPrintedMoves[gBattlerTarget] != MOVE_SKETCH)
    {
        s32 i;

        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            if (gBattleMons[gBattlerAttacker].moves[i] == MOVE_SKETCH)
                continue;
            if (gBattleMons[gBattlerAttacker].moves[i] == gLastPrintedMoves[gBattlerTarget])
                break;
        }

        if (i != MAX_MON_MOVES)
        {
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        }
        else // sketch worked
        {
            struct MovePpInfo movePpData;

            gBattleMons[gBattlerAttacker].moves[gCurrMovePos] = gLastPrintedMoves[gBattlerTarget];
            gBattleMons[gBattlerAttacker].pp[gCurrMovePos] = gMovesInfo[gLastPrintedMoves[gBattlerTarget]].pp;
            gActiveBattler = gBattlerAttacker;

            for (i = 0; i < MAX_MON_MOVES; i++)
            {
                movePpData.moves[i] = gBattleMons[gBattlerAttacker].moves[i];
                movePpData.pp[i] = gBattleMons[gBattlerAttacker].pp[i];
            }
            movePpData.ppBonuses = gBattleMons[gBattlerAttacker].ppBonuses;

            BtlController_EmitSetMonData(BUFFER_A, REQUEST_MOVES_PP_BATTLE, 0, sizeof(movePpData), &movePpData);
            MarkBattlerForControllerExec(gActiveBattler);

            PREPARE_MOVE_BUFFER(gBattleTextBuff1, gLastPrintedMoves[gBattlerTarget])

            gBattlescriptCurrInstr += 5;
        }
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static bool8 IsTwoTurnsMove(u16 move)
{
    if (gMovesInfo[move].effect == EFFECT_TWO_TURNS_ATTACK
     || gMovesInfo[move].effect == EFFECT_SOLAR_BEAM
     || gMovesInfo[move].effect == EFFECT_SEMI_INVULNERABLE
     || gMovesInfo[move].effect == EFFECT_BIDE)
        return TRUE;
    else
        return FALSE;
}

static bool8 IsInvalidForSleepTalkOrAssist(u16 move)
{
    if (move == MOVE_NONE
     || move == MOVE_SLEEP_TALK
     || move == MOVE_ASSIST
     || move == MOVE_MIRROR_MOVE
     || move == MOVE_METRONOME)
        return TRUE;
    else
        return FALSE;
}

static u8 AttacksThisTurn(u8 battlerId, u16 move) // Note: returns 1 if it's a charging turn, otherwise 2
{
    // first argument is unused
    if (gMovesInfo[move].effect == EFFECT_SOLAR_BEAM
        && (gBattleWeather & B_WEATHER_SUN))
        return 2;

    if (gMovesInfo[move].effect == EFFECT_TWO_TURNS_ATTACK
     || gMovesInfo[move].effect == EFFECT_SOLAR_BEAM
     || gMovesInfo[move].effect == EFFECT_SEMI_INVULNERABLE
     || gMovesInfo[move].effect == EFFECT_BIDE)
    {
        if ((gHitMarker & HITMARKER_CHARGING))
            return 1;
    }
    return 2;
}

static void Cmd_trychoosesleeptalkmove(void)
{
    s32 i;
    u8 unusableMovesBits = 0;

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (IsInvalidForSleepTalkOrAssist(gBattleMons[gBattlerAttacker].moves[i])
            || gBattleMons[gBattlerAttacker].moves[i] == MOVE_FOCUS_PUNCH
            || gBattleMons[gBattlerAttacker].moves[i] == MOVE_UPROAR
            || IsTwoTurnsMove(gBattleMons[gBattlerAttacker].moves[i]))
        {
            unusableMovesBits |= gBitTable[i];
        }
    }

    unusableMovesBits = CheckMoveLimitations(gBattlerAttacker, unusableMovesBits, ~MOVE_LIMITATION_PP);
    if (unusableMovesBits == (1 << MAX_MON_MOVES) - 1) // all 4 moves cannot be chosen
    {
        gBattlescriptCurrInstr += 5;
    }
    else // at least one move can be chosen
    {
        u32 movePosition;

        do
        {
            movePosition = Random() & (MAX_MON_MOVES - 1);
        } while ((gBitTable[movePosition] & unusableMovesBits));

        gCalledMove = gBattleMons[gBattlerAttacker].moves[movePosition];
        gCurrMovePos = movePosition;
        gHitMarker &= ~HITMARKER_ATTACKSTRING_PRINTED;
        gBattlerTarget = GetMoveTarget(gCalledMove, NO_TARGET_OVERRIDE);
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void Cmd_setdestinybond(void)
{
    gBattleMons[gBattlerAttacker].status2 |= STATUS2_DESTINY_BOND;
    gBattlescriptCurrInstr++;
}

static void TrySetDestinyBondToHappen(void)
{
    u8 sideAttacker = GetBattlerSide(gBattlerAttacker);
    u8 sideTarget = GetBattlerSide(gBattlerTarget);
    if (gBattleMons[gBattlerTarget].status2 & STATUS2_DESTINY_BOND
        && sideAttacker != sideTarget
        && !(gHitMarker & HITMARKER_GRUDGE))
    {
        gHitMarker |= HITMARKER_DESTINYBOND;
    }
}

static void Cmd_trysetdestinybondtohappen(void)
{
    TrySetDestinyBondToHappen();
    gBattlescriptCurrInstr++;
}

static void Cmd_remaininghptopower(void)
{
    s32 i;
    s32 hpFraction = GetScaledHPFraction(gBattleMons[gBattlerAttacker].hp, gBattleMons[gBattlerAttacker].maxHP, 48);

    for (i = 0; i < (s32) sizeof(sFlailHpScaleToPowerTable); i += 2)
    {
        if (hpFraction <= sFlailHpScaleToPowerTable[i])
            break;
    }

    gDynamicBasePower = sFlailHpScaleToPowerTable[i + 1];
    gBattlescriptCurrInstr++;
}

static void Cmd_tryspiteppreduce(void)
{
    if (gLastMoves[gBattlerTarget] != MOVE_NONE
     && gLastMoves[gBattlerTarget] != MOVE_UNAVAILABLE)
    {
        s32 i;

        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            if (gLastMoves[gBattlerTarget] == gBattleMons[gBattlerTarget].moves[i])
                break;
        }

        if (i != MAX_MON_MOVES && gBattleMons[gBattlerTarget].pp[i] > 1)
        {
            s32 ppToDeduct = (Random() & 3) + 2;
            if (gBattleMons[gBattlerTarget].pp[i] < ppToDeduct)
                ppToDeduct = gBattleMons[gBattlerTarget].pp[i];

            PREPARE_MOVE_BUFFER(gBattleTextBuff1, gLastMoves[gBattlerTarget])

            ConvertIntToDecimalStringN(gBattleTextBuff2, ppToDeduct, STR_CONV_MODE_LEFT_ALIGN, 1);

            PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff2, 1, ppToDeduct)

            gBattleMons[gBattlerTarget].pp[i] -= ppToDeduct;
            gActiveBattler = gBattlerTarget;

            // if (MOVE_IS_PERMANENT(gActiveBattler, i)), but backwards
            if (!(gDisableStructs[gActiveBattler].mimickedMoves & gBitTable[i])
                && !(gBattleMons[gActiveBattler].status2 & STATUS2_TRANSFORMED))
            {
                BtlController_EmitSetMonData(BUFFER_A, REQUEST_PPMOVE1_BATTLE + i, 0, sizeof(gBattleMons[gActiveBattler].pp[i]), &gBattleMons[gActiveBattler].pp[i]);
                MarkBattlerForControllerExec(gActiveBattler);
            }

            gBattlescriptCurrInstr += 5;

            if (gBattleMons[gBattlerTarget].pp[i] == 0)
                CancelMultiTurnMoves(gBattlerTarget);
        }
        else
        {
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        }
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void Cmd_healpartystatus(void)
{
    u32 zero = 0;
    u8 toHeal = 0;

    if (gCurrentMove == MOVE_HEAL_BELL)
    {
        struct Pokemon *party;
        s32 i;

        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_BELL;

        if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
            party = gPlayerParty;
        else
            party = gEnemyParty;

        if (gBattleMons[gBattlerAttacker].ability != ABILITY_SOUNDPROOF)
        {
            gBattleMons[gBattlerAttacker].status1 = 0;
            gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_NIGHTMARE;
        }
        else
        {
            RecordAbilityBattle(gBattlerAttacker, gBattleMons[gBattlerAttacker].ability);
            gBattleCommunication[MULTISTRING_CHOOSER] |= B_MSG_BELL_SOUNDPROOF_ATTACKER;
        }

        gActiveBattler = gBattleScripting.battler = GetBattlerAtPosition(GetBattlerPosition(gBattlerAttacker) ^ BIT_FLANK);

        if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE
            && !(gAbsentBattlerFlags & gBitTable[gActiveBattler]))
        {
            if (gBattleMons[gActiveBattler].ability != ABILITY_SOUNDPROOF)
            {
                gBattleMons[gActiveBattler].status1 = 0;
                gBattleMons[gActiveBattler].status2 &= ~STATUS2_NIGHTMARE;
            }
            else
            {
                RecordAbilityBattle(gActiveBattler, gBattleMons[gActiveBattler].ability);
                gBattleCommunication[MULTISTRING_CHOOSER] |= B_MSG_BELL_SOUNDPROOF_PARTNER;
            }
        }

        // Because the above MULTISTRING_CHOOSER are ORd, if both are set then it will be B_MSG_BELL_BOTH_SOUNDPROOF

        for (i = 0; i < PARTY_SIZE; i++)
        {
            u16 species = GetMonData(&party[i], MON_DATA_SPECIES_OR_EGG);
            u8 abilityNum = GetMonData(&party[i], MON_DATA_ABILITY_NUM);

            if (species != SPECIES_NONE && species != SPECIES_EGG)
            {
                u16 ability;

                if (gBattlerPartyIndexes[gBattlerAttacker] == i)
                    ability = gBattleMons[gBattlerAttacker].ability;
                else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE
                         && gBattlerPartyIndexes[gActiveBattler] == i
                         && !(gAbsentBattlerFlags & gBitTable[gActiveBattler]))
                    ability = gBattleMons[gActiveBattler].ability;
                else
                    ability = GetAbilityBySpecies(species, abilityNum);

                if (ability != ABILITY_SOUNDPROOF)
                    toHeal |= (1 << i);
            }
        }
    }
    else // Aromatherapy
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SOOTHING_AROMA;
        toHeal = (1 << PARTY_SIZE) - 1;

        gBattleMons[gBattlerAttacker].status1 = 0;
        gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_NIGHTMARE;

        gActiveBattler = GetBattlerAtPosition(GetBattlerPosition(gBattlerAttacker) ^ BIT_FLANK);
        if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE
            && !(gAbsentBattlerFlags & gBitTable[gActiveBattler]))
        {
            gBattleMons[gActiveBattler].status1 = 0;
            gBattleMons[gActiveBattler].status2 &= ~STATUS2_NIGHTMARE;
        }

    }

    if (toHeal)
    {
        gActiveBattler = gBattlerAttacker;
        BtlController_EmitSetMonData(BUFFER_A, REQUEST_STATUS_BATTLE, toHeal, sizeof(zero), &zero);
        MarkBattlerForControllerExec(gActiveBattler);
    }

    gBattlescriptCurrInstr++;
}

static void Cmd_cursetarget(void)
{
    if (gBattleMons[gBattlerTarget].status2 & STATUS2_CURSED)
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        gBattleMons[gBattlerTarget].status2 |= STATUS2_CURSED;
        gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 2;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;

        gBattlescriptCurrInstr += 5;
    }
}

static void Cmd_trysetspikes(void)
{
    u8 targetSide = GetBattlerSide(gBattlerAttacker) ^ BIT_SIDE;

    if (gSideTimers[targetSide].spikesAmount == 3)
    {
        gSpecialStatuses[gBattlerAttacker].ppNotAffectedByPressure = 1;
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        gSideStatuses[targetSide] |= SIDE_STATUS_SPIKES;
        gSideTimers[targetSide].spikesAmount++;
        gBattlescriptCurrInstr += 5;
    }
}

static void Cmd_setforesight(void)
{
    gBattleMons[gBattlerTarget].status2 |= STATUS2_FORESIGHT;
    gBattlescriptCurrInstr++;
}

static void Cmd_trysetperishsong(void)
{
    s32 i;
    s32 notAffectedCount = 0;

    for (i = 0; i < gBattlersCount; i++)
    {
        if (gStatuses3[i] & STATUS3_PERISH_SONG
            || gBattleMons[i].ability == ABILITY_SOUNDPROOF)
        {
            notAffectedCount++;
        }
        else
        {
            gStatuses3[i] |= STATUS3_PERISH_SONG;
            gDisableStructs[i].perishSongTimer = 3;
            // gDisableStructs[i].perishSongTimerStartValue = 3;
        }
    }

    PressurePPLoseOnUsingPerishSong(gBattlerAttacker);

    if (notAffectedCount == gBattlersCount)
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    else
        gBattlescriptCurrInstr += 5;
}

static void Cmd_rolloutdamagecalculation(void)
{
    if (gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
    {
        CancelMultiTurnMoves(gBattlerAttacker);
        gBattlescriptCurrInstr = BattleScript_MoveMissedPause;
    }
    else
    {
        s32 i;

        if (!(gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS)) // first hit
        {
            gDisableStructs[gBattlerAttacker].rolloutTimer = 5;
            gDisableStructs[gBattlerAttacker].rolloutTimerStartValue = 5;
            gBattleMons[gBattlerAttacker].status2 |= STATUS2_MULTIPLETURNS;
            gLockedMoves[gBattlerAttacker] = gCurrentMove;
        }
        if (--gDisableStructs[gBattlerAttacker].rolloutTimer == 0) // last hit
        {
            gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_MULTIPLETURNS;
        }

        gDynamicBasePower = gMovesInfo[gCurrentMove].power;

        for (i = 1; i < (5 - gDisableStructs[gBattlerAttacker].rolloutTimer); i++)
            gDynamicBasePower *= 2;

        if (gBattleMons[gBattlerAttacker].status2 & STATUS2_DEFENSE_CURL)
            gDynamicBasePower *= 2;

        gBattlescriptCurrInstr++;
    }
}

static void Cmd_jumpifconfusedandstatmaxed(void)
{
    if (gBattleMons[gBattlerTarget].status2 & STATUS2_CONFUSION
        && gBattleMons[gBattlerTarget].statStages[gBattlescriptCurrInstr[1]] == MAX_STAT_STAGE)
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
    else
        gBattlescriptCurrInstr += 6;
}

static void Cmd_furycuttercalc(void)
{
    if (gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
    {
        gDisableStructs[gBattlerAttacker].furyCutterCounter = 0;
        gBattlescriptCurrInstr = BattleScript_MoveMissedPause;
    }
    else
    {
        s32 i;

        if (gDisableStructs[gBattlerAttacker].furyCutterCounter != 5)
            gDisableStructs[gBattlerAttacker].furyCutterCounter++;

        gDynamicBasePower = gMovesInfo[gCurrentMove].power;

        for (i = 1; i < gDisableStructs[gBattlerAttacker].furyCutterCounter; i++)
            gDynamicBasePower *= 2;

        gBattlescriptCurrInstr++;
    }
}

static void Cmd_friendshiptodamagecalculation(void)
{
    if (gMovesInfo[gCurrentMove].effect == EFFECT_RETURN)
        gDynamicBasePower = 10 * (gBattleMons[gBattlerAttacker].friendship) / 25;
    else // EFFECT_FRUSTRATION
        gDynamicBasePower = 10 * (255 - gBattleMons[gBattlerAttacker].friendship) / 25;

    gBattlescriptCurrInstr++;
}

static void Cmd_presentdamagecalculation(void)
{
    s32 rand = Random() & 0xFF;

    if (rand < 102)
        gDynamicBasePower = 40;
    else if (rand < 178)
        gDynamicBasePower = 80;
    else if (rand < 204)
        gDynamicBasePower = 120;
    else
    {
        gBattleMoveDamage = gBattleMons[gBattlerTarget].maxHP / 4;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattleMoveDamage *= -1;
    }
    if (rand < 204)
        gBattlescriptCurrInstr = BattleScript_HitFromCritCalc;
    else if (gBattleMons[gBattlerTarget].maxHP == gBattleMons[gBattlerTarget].hp)
        gBattlescriptCurrInstr = BattleScript_AlreadyAtFullHp;
    else
    {
        gMoveResultFlags &= ~MOVE_RESULT_DOESNT_AFFECT_FOE;
        gBattlescriptCurrInstr = BattleScript_PresentHealTarget;
    }
}

static void Cmd_setsafeguard(void)
{
    if (gSideStatuses[GET_BATTLER_SIDE(gBattlerAttacker)] & SIDE_STATUS_SAFEGUARD)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SIDE_STATUS_FAILED;
    }
    else
    {
        gSideStatuses[GET_BATTLER_SIDE(gBattlerAttacker)] |= SIDE_STATUS_SAFEGUARD;
        gSideTimers[GET_BATTLER_SIDE(gBattlerAttacker)].safeguardTimer = 5;
        gSideTimers[GET_BATTLER_SIDE(gBattlerAttacker)].safeguardBattlerId = gBattlerAttacker;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_SAFEGUARD;
    }

    gBattlescriptCurrInstr++;
}

static void Cmd_magnitudedamagecalculation(void)
{
    s32 magnitude = Random() % 100;

    if (magnitude < 5)
    {
        gDynamicBasePower = 10;
        magnitude = 4;
    }
    else if (magnitude < 15)
    {
        gDynamicBasePower = 30;
        magnitude = 5;
    }
    else if (magnitude < 35)
    {
        gDynamicBasePower = 50;
        magnitude = 6;
    }
    else if (magnitude < 65)
    {
        gDynamicBasePower = 70;
        magnitude = 7;
    }
    else if (magnitude < 85)
    {
        gDynamicBasePower = 90;
        magnitude = 8;
    }
    else if (magnitude < 95)
    {
        gDynamicBasePower = 110;
        magnitude = 9;
    }
    else
    {
        gDynamicBasePower = 150;
        magnitude = 10;
    }

    PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff1, 2, magnitude)

    for (gBattlerTarget = 0; gBattlerTarget < gBattlersCount; gBattlerTarget++)
    {
        if (gBattlerTarget == gBattlerAttacker)
            continue;
        if (!(gAbsentBattlerFlags & gBitTable[gBattlerTarget])) // a valid target was found
            break;
    }

    gBattlescriptCurrInstr++;
}

static void Cmd_jumpifnopursuitswitchdmg(void)
{
    if (gMultiHitCounter == 1)
    {
        if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
            gBattlerTarget = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
        else
            gBattlerTarget = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
    }
    else
    {
        if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
            gBattlerTarget = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
        else
            gBattlerTarget = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
    }

    if (gChosenActionByBattler[gBattlerTarget] == B_ACTION_USE_MOVE
        && gBattlerAttacker == *(gBattleStruct->moveTarget + gBattlerTarget)
        && !(gBattleMons[gBattlerTarget].status1 & (STATUS1_SLEEP | STATUS1_FREEZE))
        && gBattleMons[gBattlerAttacker].hp
        && !gDisableStructs[gBattlerTarget].truantCounter
        && gChosenMoveByBattler[gBattlerTarget] == MOVE_PURSUIT)
    {
        s32 i;

        for (i = 0; i < gBattlersCount; i++)
        {
            if (gBattlerByTurnOrder[i] == gBattlerTarget)
                gActionsByTurnOrder[i] = B_ACTION_TRY_FINISH;
        }

        gCurrentMove = MOVE_PURSUIT;
        gCurrMovePos = gChosenMovePos = *(gBattleStruct->chosenMovePositions + gBattlerTarget);
        gBattlescriptCurrInstr += 5;
        gBattleScripting.animTurn = 1;
        gHitMarker &= ~HITMARKER_ATTACKSTRING_PRINTED;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void Cmd_setsunny(void)
{
    if (gBattleWeather & B_WEATHER_SUN)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_FAILED;
    }
    else
    {
        gBattleWeather = B_WEATHER_SUN_TEMPORARY;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STARTED_SUNLIGHT;
        gWishFutureKnock.weatherDuration = 5;
    }

    gBattlescriptCurrInstr++;
}

// Belly Drum
static void Cmd_maxattackhalvehp(void)
{
    u32 halfHp = gBattleMons[gBattlerAttacker].maxHP / 2;

    if (!(gBattleMons[gBattlerAttacker].maxHP / 2))
        halfHp = 1;

    if (gBattleMons[gBattlerAttacker].statStages[STAT_ATK] < MAX_STAT_STAGE
        && gBattleMons[gBattlerAttacker].hp > halfHp)
    {
        gBattleMons[gBattlerAttacker].statStages[STAT_ATK] = MAX_STAT_STAGE;
        gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 2;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;

        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

// Psych Up
static void Cmd_copyfoestats(void)
{
    s32 i;

    for (i = 0; i < NUM_BATTLE_STATS; i++)
    {
        gBattleMons[gBattlerAttacker].statStages[i] = gBattleMons[gBattlerTarget].statStages[i];
    }

    gBattlescriptCurrInstr += 5; // Has an unused jump ptr(possibly for a failed attempt) parameter.
}

static void Cmd_rapidspinfree(void)
{
    if (gBattleMons[gBattlerAttacker].status2 & STATUS2_WRAPPED)
    {
        gBattleScripting.battler = gBattlerTarget;
        gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_WRAPPED;
        gBattlerTarget = *(gBattleStruct->wrappedBy + gBattlerAttacker);

        gBattleTextBuff1[0] = B_BUFF_PLACEHOLDER_BEGIN;
        gBattleTextBuff1[1] = B_BUFF_MOVE;
        gBattleTextBuff1[2] = *(gBattleStruct->wrappedMove + gBattlerAttacker * 2 + 0);
        gBattleTextBuff1[3] = *(gBattleStruct->wrappedMove + gBattlerAttacker * 2 + 1);
        gBattleTextBuff1[4] = B_BUFF_EOS;

        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_WrapFree;
    }
    else if (gStatuses3[gBattlerAttacker] & STATUS3_LEECHSEED)
    {
        gStatuses3[gBattlerAttacker] &= ~STATUS3_LEECHSEED;
        gStatuses3[gBattlerAttacker] &= ~STATUS3_LEECHSEED_BATTLER;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_LeechSeedFree;
    }
    else if (gSideStatuses[GetBattlerSide(gBattlerAttacker)] & SIDE_STATUS_SPIKES)
    {
        gSideStatuses[GetBattlerSide(gBattlerAttacker)] &= ~SIDE_STATUS_SPIKES;
        gSideTimers[GetBattlerSide(gBattlerAttacker)].spikesAmount = 0;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_SpikesFree;
    }
    else
    {
        gBattlescriptCurrInstr++;
    }
}

static void Cmd_setdefensecurlbit(void)
{
    gBattleMons[gBattlerAttacker].status2 |= STATUS2_DEFENSE_CURL;
    gBattlescriptCurrInstr++;
}

static void Cmd_recoverbasedonsunlight(void)
{
    gBattlerTarget = gBattlerAttacker;

    if (gBattleMons[gBattlerAttacker].hp != gBattleMons[gBattlerAttacker].maxHP)
    {
        if (gBattleWeather == 0 || !WEATHER_HAS_EFFECT)
            gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 2;
        else if (gBattleWeather & B_WEATHER_SUN)
            gBattleMoveDamage = 20 * gBattleMons[gBattlerAttacker].maxHP / 30;
        else // not sunny weather
            gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 4;

        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattleMoveDamage *= -1;

        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void Cmd_hiddenpowercalc(void)
{
    s32 powerBits, typeBits;

    powerBits = ((gBattleMons[gBattlerAttacker].hpIV & 2) >> 1)
              | ((gBattleMons[gBattlerAttacker].attackIV & 2) << 0)
              | ((gBattleMons[gBattlerAttacker].defenseIV & 2) << 1)
              | ((gBattleMons[gBattlerAttacker].speedIV & 2) << 2)
              | ((gBattleMons[gBattlerAttacker].spAttackIV & 2) << 3)
              | ((gBattleMons[gBattlerAttacker].spDefenseIV & 2) << 4);
    typeBits  = ((gBattleMons[gBattlerAttacker].hpIV & 1) << 0)
              | ((gBattleMons[gBattlerAttacker].attackIV & 1) << 1)
              | ((gBattleMons[gBattlerAttacker].defenseIV & 1) << 2)
              | ((gBattleMons[gBattlerAttacker].speedIV & 1) << 3)
              | ((gBattleMons[gBattlerAttacker].spAttackIV & 1) << 4)
              | ((gBattleMons[gBattlerAttacker].spDefenseIV & 1) << 5);

    gDynamicBasePower = (40 * powerBits) / 63 + 30;

    // Subtract 3 instead of 1 below because 2 types are excluded (TYPE_NORMAL and TYPE_MYSTERY)
    // The final + 1 skips past Normal, and the following conditional skips TYPE_MYSTERY
    gBattleStruct->dynamicMoveType = ((NUMBER_OF_MON_TYPES - 3) * typeBits) / 63 + 1;
    if (gBattleStruct->dynamicMoveType >= TYPE_MYSTERY)
        gBattleStruct->dynamicMoveType++;
    gBattleStruct->dynamicMoveType |= F_DYNAMIC_TYPE_1 | F_DYNAMIC_TYPE_2;

    gBattlescriptCurrInstr++;
}

static void Cmd_selectfirstvalidtarget(void)
{
    for (gBattlerTarget = 0; gBattlerTarget < gBattlersCount; gBattlerTarget++)
    {
        if (gBattlerTarget == gBattlerAttacker)
            continue;
        if (!(gAbsentBattlerFlags & gBitTable[gBattlerTarget]))
            break;
    }
    gBattlescriptCurrInstr++;
}

static void Cmd_trysetfutureattack(void)
{
    if (gWishFutureKnock.futureSightCounter[gBattlerTarget] != 0)
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        gWishFutureKnock.futureSightMove[gBattlerTarget] = gCurrentMove;
        gWishFutureKnock.futureSightAttacker[gBattlerTarget] = gBattlerAttacker;
        gWishFutureKnock.futureSightCounter[gBattlerTarget] = 3;
        gWishFutureKnock.futureSightDmg[gBattlerTarget] = CalculateBaseDamageOld(&gBattleMons[gBattlerAttacker], &gBattleMons[gBattlerTarget], gCurrentMove,
                                                    gSideStatuses[GET_BATTLER_SIDE(gBattlerTarget)], 0,
                                                    0, gBattlerAttacker, gBattlerTarget);

        if (gProtectStructs[gBattlerAttacker].helpingHand)
            gWishFutureKnock.futureSightDmg[gBattlerTarget] = gWishFutureKnock.futureSightDmg[gBattlerTarget] * 15 / 10;

        if (gCurrentMove == MOVE_DOOM_DESIRE)
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_DOOM_DESIRE;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_FUTURE_SIGHT;

        gBattlescriptCurrInstr += 5;
    }
}

static void Cmd_trydobeatup(void)
{
    struct Pokemon *party;

    if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
        party = gPlayerParty;
    else
        party = gEnemyParty;

    if (gBattleMons[gBattlerTarget].hp == 0)
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        u8 beforeLoop = gBattleCommunication[0];
        for (;gBattleCommunication[0] < PARTY_SIZE; gBattleCommunication[0]++)
        {
            if (GetMonData(&party[gBattleCommunication[0]], MON_DATA_HP)
                && GetMonData(&party[gBattleCommunication[0]], MON_DATA_SPECIES_OR_EGG)
                && GetMonData(&party[gBattleCommunication[0]], MON_DATA_SPECIES_OR_EGG) != SPECIES_EGG
                && !GetMonData(&party[gBattleCommunication[0]], MON_DATA_STATUS))
                break;
        }
        if (gBattleCommunication[0] < PARTY_SIZE)
        {
            PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, gBattlerAttacker, gBattleCommunication[0])

            gBattlescriptCurrInstr += 9;

            gBattleMoveDamage = gSpeciesInfo[GetMonData(&party[gBattleCommunication[0]], MON_DATA_SPECIES)].baseAttack;
            gBattleMoveDamage *= gMovesInfo[gCurrentMove].power;
            gBattleMoveDamage *= (GetMonData(&party[gBattleCommunication[0]], MON_DATA_LEVEL) * 2 / 5 + 2);
            gBattleMoveDamage /= gSpeciesInfo[gBattleMons[gBattlerTarget].species].baseDefense;
            gBattleMoveDamage = (gBattleMoveDamage / 50) + 2;
            if (gProtectStructs[gBattlerAttacker].helpingHand)
                gBattleMoveDamage = gBattleMoveDamage * 15 / 10;

            gBattleCommunication[0]++;
        }
        else if (beforeLoop != 0)
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        else
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 5);
    }
}

static void Cmd_setsemiinvulnerablebit(void)
{
    switch (gCurrentMove)
    {
    case MOVE_FLY:
    case MOVE_BOUNCE:
        gStatuses3[gBattlerAttacker] |= STATUS3_ON_AIR;
        break;
    case MOVE_DIG:
        gStatuses3[gBattlerAttacker] |= STATUS3_UNDERGROUND;
        break;
    case MOVE_DIVE:
        gStatuses3[gBattlerAttacker] |= STATUS3_UNDERWATER;
        break;
    }

    gBattlescriptCurrInstr++;
}

static void Cmd_clearsemiinvulnerablebit(void)
{
    switch (gCurrentMove)
    {
    case MOVE_FLY:
    case MOVE_BOUNCE:
        gStatuses3[gBattlerAttacker] &= ~STATUS3_ON_AIR;
        break;
    case MOVE_DIG:
        gStatuses3[gBattlerAttacker] &= ~STATUS3_UNDERGROUND;
        break;
    case MOVE_DIVE:
        gStatuses3[gBattlerAttacker] &= ~STATUS3_UNDERWATER;
        break;
    }

    gBattlescriptCurrInstr++;
}

static void Cmd_setminimize(void)
{
    if (gHitMarker & HITMARKER_OBEYS)
        gStatuses3[gBattlerAttacker] |= STATUS3_MINIMIZED;

    gBattlescriptCurrInstr++;
}

static void Cmd_sethail(void)
{
    if (gBattleWeather & B_WEATHER_HAIL)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_FAILED;
    }
    else
    {
        gBattleWeather = B_WEATHER_HAIL_TEMPORARY;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STARTED_HAIL;
        gWishFutureKnock.weatherDuration = 5;
    }

    gBattlescriptCurrInstr++;
}

static void Cmd_trymemento(void)
{
    if (gBattleMons[gBattlerTarget].statStages[STAT_ATK] == MIN_STAT_STAGE
        && gBattleMons[gBattlerTarget].statStages[STAT_SPATK] == MIN_STAT_STAGE
        && gBattleCommunication[MISS_TYPE] != B_MSG_PROTECTED)
    {
        // Failed, unprotected target already has minimum Attack and Special Attack.
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        // Success, drop user's HP bar to 0
        gActiveBattler = gBattlerAttacker;
        gBattleMoveDamage = gBattleMons[gActiveBattler].hp;
        BtlController_EmitHealthBarUpdate(BUFFER_A, INSTANT_HP_BAR_DROP);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 5;
    }
}

// Follow Me
static void Cmd_setforcedtarget(void)
{
    gSideTimers[GetBattlerSide(gBattlerAttacker)].followmeTimer = 1;
    gSideTimers[GetBattlerSide(gBattlerAttacker)].followmeTarget = gBattlerAttacker;
    gBattlescriptCurrInstr++;
}

static void Cmd_setcharge(void)
{
    CMD_ARGS(u8 battler);

    u8 battler = GetBattlerForBattleScript(cmd->battler);
    gStatuses3[battler] |= STATUS3_CHARGED_UP;
    gDisableStructs[battler].chargeTimer = 2;
    gBattlescriptCurrInstr++;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

// Nature Power
static void Cmd_callterrainattack(void)
{
    gHitMarker &= ~HITMARKER_ATTACKSTRING_PRINTED;
    gCurrentMove = sNaturePowerMoves[gBattleTerrain];
    gBattlerTarget = GetMoveTarget(gCurrentMove, NO_TARGET_OVERRIDE);
    BattleScriptPush(gBattleScriptsForMoveEffects[gMovesInfo[gCurrentMove].effect]);
    gBattlescriptCurrInstr++;
}

// Refresh
static void Cmd_cureifburnedparalysedorpoisoned(void)
{
    if (gBattleMons[gBattlerAttacker].status1 & (STATUS1_POISON | STATUS1_BURN | STATUS1_PARALYSIS | STATUS1_TOXIC_POISON))
    {
        gBattleMons[gBattlerAttacker].status1 = 0;
        gBattlescriptCurrInstr += 5;
        gActiveBattler = gBattlerAttacker;
        BtlController_EmitSetMonData(BUFFER_A, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[gActiveBattler].status1), &gBattleMons[gActiveBattler].status1);
        MarkBattlerForControllerExec(gActiveBattler);
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void Cmd_settorment(void)
{
    if (gBattleMons[gBattlerTarget].status2 & STATUS2_TORMENT)
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        gBattleMons[gBattlerTarget].status2 |= STATUS2_TORMENT;
        gBattlescriptCurrInstr += 5;
    }
}

static void Cmd_jumpifnodamage(void)
{
    if (gProtectStructs[gBattlerAttacker].physicalDmg || gProtectStructs[gBattlerAttacker].specialDmg)
        gBattlescriptCurrInstr += 5;
    else
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

static void Cmd_settaunt(void)
{
    if (gDisableStructs[gBattlerTarget].tauntTimer == 0)
    {
        gDisableStructs[gBattlerTarget].tauntTimer = 2;
        // gDisableStructs[gBattlerTarget].tauntTimer2 = 2;
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void Cmd_trysethelpinghand(void)
{
    gBattlerTarget = GetBattlerAtPosition(GetBattlerPosition(gBattlerAttacker) ^ BIT_FLANK);

    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE
        && !(gAbsentBattlerFlags & gBitTable[gBattlerTarget])
        && !gProtectStructs[gBattlerAttacker].helpingHand
        && !gProtectStructs[gBattlerTarget].helpingHand)
    {
        gProtectStructs[gBattlerTarget].helpingHand = 1;
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

// Trick
static void Cmd_tryswapitems(void)
{
    // opponent can't swap items with player in regular battles
    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER_TOWER
        || (GetBattlerSide(gBattlerAttacker) == B_SIDE_OPPONENT
            && !(gBattleTypeFlags & (BATTLE_TYPE_LINK
                                  | BATTLE_TYPE_BATTLE_TOWER
                                  | BATTLE_TYPE_EREADER_TRAINER))
                && gTrainerBattleOpponent_A != TRAINER_SECRET_BASE))
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        u8 sideAttacker = GetBattlerSide(gBattlerAttacker);
        u8 sideTarget = GetBattlerSide(gBattlerTarget);

        // you can't swap items if they were knocked off in regular battles
        if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK
                             | BATTLE_TYPE_BATTLE_TOWER
                             | BATTLE_TYPE_EREADER_TRAINER))
            && gTrainerBattleOpponent_A != TRAINER_SECRET_BASE
            && (gWishFutureKnock.knockedOffMons[sideAttacker] & gBitTable[gBattlerPartyIndexes[gBattlerAttacker]]
                || gWishFutureKnock.knockedOffMons[sideTarget] & gBitTable[gBattlerPartyIndexes[gBattlerTarget]]))
        {
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        }
        // can't swap if two pokemon don't have an item
        // or if either of them is an enigma berry or a mail
        else if ((gBattleMons[gBattlerAttacker].item == ITEM_NONE && gBattleMons[gBattlerTarget].item == ITEM_NONE)
                 || gBattleMons[gBattlerAttacker].item == ITEM_ENIGMA_BERRY
                 || gBattleMons[gBattlerTarget].item == ITEM_ENIGMA_BERRY
                 || IS_ITEM_MAIL(gBattleMons[gBattlerAttacker].item)
                 || IS_ITEM_MAIL(gBattleMons[gBattlerTarget].item))
        {
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        }
        // check if ability prevents swapping
        else if (gBattleMons[gBattlerTarget].ability == ABILITY_STICKY_HOLD)
        {
            gBattlescriptCurrInstr = BattleScript_StickyHoldActivates;
            gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
            RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
        }
        // took a while, but all checks passed and items can be safely swapped
        else
        {
            u16 oldItemAtk, *newItemAtk;

            newItemAtk = &gBattleStruct->changedItems[gBattlerAttacker];
            oldItemAtk = gBattleMons[gBattlerAttacker].item;
            *newItemAtk = gBattleMons[gBattlerTarget].item;

            gBattleMons[gBattlerAttacker].item = ITEM_NONE;
            gBattleMons[gBattlerTarget].item = oldItemAtk;

            gActiveBattler = gBattlerAttacker;
            BtlController_EmitSetMonData(BUFFER_A, REQUEST_HELDITEM_BATTLE, 0, sizeof(*newItemAtk), newItemAtk);
            MarkBattlerForControllerExec(gBattlerAttacker);

            gActiveBattler = gBattlerTarget;
            BtlController_EmitSetMonData(BUFFER_A, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[gBattlerTarget].item), &gBattleMons[gBattlerTarget].item);
            MarkBattlerForControllerExec(gBattlerTarget);

            *(u8 *)((u8 *)(&gBattleStruct->choicedMove[gBattlerTarget]) + 0) = 0;
            *(u8 *)((u8 *)(&gBattleStruct->choicedMove[gBattlerTarget]) + 1) = 0;

            *(u8 *)((u8 *)(&gBattleStruct->choicedMove[gBattlerAttacker]) + 0) = 0;
            *(u8 *)((u8 *)(&gBattleStruct->choicedMove[gBattlerAttacker]) + 1) = 0;

            gBattlescriptCurrInstr += 5;

            PREPARE_ITEM_BUFFER(gBattleTextBuff1, *newItemAtk)
            PREPARE_ITEM_BUFFER(gBattleTextBuff2, oldItemAtk)

            if (oldItemAtk != ITEM_NONE && *newItemAtk != ITEM_NONE)
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ITEM_SWAP_BOTH;  // attacker's item -> <- target's item
            else if (oldItemAtk == ITEM_NONE && *newItemAtk != ITEM_NONE)
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ITEM_SWAP_TAKEN; // nothing -> <- target's item
            else
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ITEM_SWAP_GIVEN; // attacker's item -> <- nothing
        }
    }
}

// Role Play
static void Cmd_trycopyability(void)
{
    if (gBattleMons[gBattlerTarget].ability != ABILITY_NONE
        && gBattleMons[gBattlerTarget].ability != ABILITY_WONDER_GUARD)
    {
        gBattleMons[gBattlerAttacker].ability = gBattleMons[gBattlerTarget].ability;
        gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void Cmd_trywish(void)
{
    switch (gBattlescriptCurrInstr[1])
    {
    case 0: // use wish
        if (gWishFutureKnock.wishCounter[gBattlerAttacker] == 0)
        {
            gWishFutureKnock.wishCounter[gBattlerAttacker] = 2;
            gWishFutureKnock.wishMonId[gBattlerAttacker] = gBattlerPartyIndexes[gBattlerAttacker];
            gBattlescriptCurrInstr += 6;
        }
        else
        {
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
        }
        break;
    case 1: // heal effect
        PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, gBattlerTarget, gWishFutureKnock.wishMonId[gBattlerTarget])

        gBattleMoveDamage = gBattleMons[gBattlerTarget].maxHP / 2;
        if (gBattleMoveDamage == 0)
            gBattleMoveDamage = 1;
        gBattleMoveDamage *= -1;

        if (gBattleMons[gBattlerTarget].hp == gBattleMons[gBattlerTarget].maxHP)
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
        else
            gBattlescriptCurrInstr += 6;

        break;
    }
}

// Ingrain
static void Cmd_settoxicspikes(void)
{
    CMD_ARGS(const u8 *failInstr);

    u8 targetSide = GetBattlerSide(gBattlerTarget);
    if (gSideTimers[targetSide].toxicSpikesAmount >= 2)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gSideTimers[targetSide].toxicSpikesAmount++;
        gSideStatuses[targetSide] |= SIDE_STATUS_TOXIC_SPIKES;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_setgastroacid(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gAbilitiesInfo[gBattleMons[gBattlerTarget].ability].cantBeSuppressed)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        if (gBattleMons[gBattlerTarget].ability == ABILITY_NEUTRALIZING_GAS)
            gSpecialStatuses[gBattlerTarget].neutralizingGasRemoved = TRUE;

        gStatuses3[gBattlerTarget] |= STATUS3_GASTRO_ACID;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_setyawn(void)
{
    if (gStatuses3[gBattlerTarget] & STATUS3_YAWN
        || gBattleMons[gBattlerTarget].status1 & STATUS1_ANY)
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        gStatuses3[gBattlerTarget] |= STATUS3_YAWN_TURN(2);
        gBattlescriptCurrInstr += 5;
    }
}

static void Cmd_setdamagetohealthdifference(void)
{
    if (gBattleMons[gBattlerTarget].hp <= gBattleMons[gBattlerAttacker].hp)
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        gBattleMoveDamage = gBattleMons[gBattlerTarget].hp - gBattleMons[gBattlerAttacker].hp;
        gBattlescriptCurrInstr += 5;
    }
}

static void Cmd_scaledamagebyhealthratio(void)
{
    if (gDynamicBasePower == 0)
    {
        u8 power = gMovesInfo[gCurrentMove].power;
        gDynamicBasePower = gBattleMons[gBattlerAttacker].hp * power / gBattleMons[gBattlerAttacker].maxHP;
        if (gDynamicBasePower == 0)
            gDynamicBasePower = 1;
    }
    gBattlescriptCurrInstr++;
}

// Skill Swap
static void Cmd_tryswapabilities(void)
{
    if ((gBattleMons[gBattlerAttacker].ability == ABILITY_NONE
        && gBattleMons[gBattlerTarget].ability == ABILITY_NONE)
     || gBattleMons[gBattlerAttacker].ability == ABILITY_WONDER_GUARD
     || gBattleMons[gBattlerTarget].ability == ABILITY_WONDER_GUARD
     || gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
     {
         gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
     }
    else
    {
        u16 abilityAtk = gBattleMons[gBattlerAttacker].ability;
        gBattleMons[gBattlerAttacker].ability = gBattleMons[gBattlerTarget].ability;
        gBattleMons[gBattlerTarget].ability = abilityAtk;

            gBattlescriptCurrInstr += 5;
    }
}

static void Cmd_tryimprison(void)
{
    if ((gStatuses3[gBattlerAttacker] & STATUS3_IMPRISONED_OTHERS))
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        u8 battlerId, sideAttacker;

        sideAttacker = GetBattlerSide(gBattlerAttacker);
        PressurePPLoseOnUsingImprison(gBattlerAttacker);
        for (battlerId = 0; battlerId < gBattlersCount; battlerId++)
        {
            if (sideAttacker != GetBattlerSide(battlerId))
            {
                s32 attackerMoveId;
                for (attackerMoveId = 0; attackerMoveId < MAX_MON_MOVES; attackerMoveId++)
                {
                    s32 i;
                    for (i = 0; i < MAX_MON_MOVES; i++)
                    {
                        if (gBattleMons[gBattlerAttacker].moves[attackerMoveId] == gBattleMons[battlerId].moves[i]
                            && gBattleMons[gBattlerAttacker].moves[attackerMoveId] != MOVE_NONE)
                            break;
                    }
                    if (i != MAX_MON_MOVES)
                        break;
                }
                if (attackerMoveId != MAX_MON_MOVES)
                {
                    gStatuses3[gBattlerAttacker] |= STATUS3_IMPRISONED_OTHERS;
                    gBattlescriptCurrInstr += 5;
                    break;
                }
            }
        }
        if (battlerId == gBattlersCount) // In Generation 3 games, Imprison fails if the user doesn't share any moves with any of the foes
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void Cmd_setstealthrock(void)
{
    CMD_ARGS(const u8 *failInstr);

    u8 targetSide = GetBattlerSide(gBattlerTarget);
    if (gSideStatuses[targetSide] & SIDE_STATUS_STEALTH_ROCK)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gSideStatuses[targetSide] |= SIDE_STATUS_STEALTH_ROCK;
        gSideTimers[targetSide].stealthRockAmount = 1;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_weightdamagecalculation(void)
{
    s32 i;
    for (i = 0; sWeightToDamageTable[i] != 0xFFFF; i += 2)
    {
        if (sWeightToDamageTable[i] > GetPokedexHeightWeight(SpeciesToNationalPokedexNum(gBattleMons[gBattlerTarget].species), 1))
            break;
    }

    if (sWeightToDamageTable[i] != 0xFFFF)
        gDynamicBasePower = sWeightToDamageTable[i + 1];
    else
        gDynamicBasePower = 120;

    gBattlescriptCurrInstr++;
}

static void Cmd_assistattackselect(void)
{
    s32 chooseableMovesNo = 0;
    struct Pokemon* party;
    s32 monId, moveId;
    u16 *validMoves = gBattleStruct->assistPossibleMoves;

    if (GET_BATTLER_SIDE(gBattlerAttacker) != B_SIDE_PLAYER)
        party = gEnemyParty;
    else
        party = gPlayerParty;

    for (monId = 0; monId < PARTY_SIZE; monId++)
    {
        if (monId == gBattlerPartyIndexes[gBattlerAttacker])
            continue;
        if (GetMonData(&party[monId], MON_DATA_SPECIES_OR_EGG) == SPECIES_NONE)
            continue;
        if (GetMonData(&party[monId], MON_DATA_SPECIES_OR_EGG) == SPECIES_EGG)
            continue;

        for (moveId = 0; moveId < MAX_MON_MOVES; moveId++)
        {
            s32 i = 0;
            u16 move = GetMonData(&party[monId], MON_DATA_MOVE1 + moveId);

            if (IsInvalidForSleepTalkOrAssist(move))
                continue;

            for (; sMovesForbiddenToCopy[i] != ASSIST_FORBIDDEN_END && move != sMovesForbiddenToCopy[i]; i++);

            if (sMovesForbiddenToCopy[i] != ASSIST_FORBIDDEN_END)
                continue;
            if (move == MOVE_NONE)
                continue;

            validMoves[chooseableMovesNo] = move;
            chooseableMovesNo++;
        }
    }
    if (chooseableMovesNo)
    {
        gHitMarker &= ~HITMARKER_ATTACKSTRING_PRINTED;
        gCalledMove = validMoves[((Random() & 0xFF) * chooseableMovesNo) >> 8];
        gBattlerTarget = GetMoveTarget(gCalledMove, NO_TARGET_OVERRIDE);
        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void Cmd_trysetmagiccoat(void)
{
    gBattlerTarget = gBattlerAttacker;
    gSpecialStatuses[gBattlerAttacker].ppNotAffectedByPressure = 1;
    if (gCurrentTurnActionNumber == gBattlersCount - 1) // moves last turn
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        gProtectStructs[gBattlerAttacker].bounceMove = TRUE;
        gBattlescriptCurrInstr += 5;
    }
}

// Snatch
static void Cmd_trysetsnatch(void)
{
    gSpecialStatuses[gBattlerAttacker].ppNotAffectedByPressure = 1;
    if (gCurrentTurnActionNumber == gBattlersCount - 1) // moves last turn
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        gProtectStructs[gBattlerAttacker].stealMove = 1;
        gBattlescriptCurrInstr += 5;
    }
}

static void Cmd_trygetintimidatetarget(void)
{
    u8 side;

    gBattleScripting.battler = gBattleStruct->intimidateBattler;
    side = GetBattlerSide(gBattleScripting.battler);

    PREPARE_ABILITY_BUFFER(gBattleTextBuff1, gBattleMons[gBattleScripting.battler].ability)

    for (;gBattlerTarget < gBattlersCount; gBattlerTarget++)
    {
        if (GetBattlerSide(gBattlerTarget) == side)
            continue;
        if (!(gAbsentBattlerFlags & gBitTable[gBattlerTarget]))
            break;
    }

    if (gBattlerTarget >= gBattlersCount)
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    else
        gBattlescriptCurrInstr += 5;
}

static void Cmd_switchoutabilities(void)
{
    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);

    switch (gBattleMons[gActiveBattler].ability)
    {
    case ABILITY_NATURAL_CURE:
        gBattleMons[gActiveBattler].status1 = 0;
        BtlController_EmitSetMonData(BUFFER_A, REQUEST_STATUS_BATTLE,
                                     gBitTable[*(gBattleStruct->battlerPartyIndexes + gActiveBattler)],
                                     sizeof(gBattleMons[gActiveBattler].status1),
                                     &gBattleMons[gActiveBattler].status1);
        MarkBattlerForControllerExec(gActiveBattler);
        break;
    }

    gBattlescriptCurrInstr += 2;
}

static void Cmd_jumpifhasnohp(void)
{
    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);

    if (gBattleMons[gActiveBattler].hp == 0)
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
    else
        gBattlescriptCurrInstr += 6;
}

static void Cmd_getsecretpowereffect(void)
{
    switch (gBattleTerrain)
    {
    case BATTLE_TERRAIN_GRASS:
        gBattleScripting.moveEffect= MOVE_EFFECT_POISON;
        break;
    case BATTLE_TERRAIN_LONG_GRASS:
        gBattleScripting.moveEffect = MOVE_EFFECT_SLEEP;
        break;
    case BATTLE_TERRAIN_SAND:
        gBattleScripting.moveEffect = MOVE_EFFECT_ACC_MINUS_1;
        break;
    case BATTLE_TERRAIN_UNDERWATER:
        gBattleScripting.moveEffect = MOVE_EFFECT_DEF_MINUS_1;
        break;
    case BATTLE_TERRAIN_WATER:
        gBattleScripting.moveEffect = MOVE_EFFECT_ATK_MINUS_1;
        break;
    case BATTLE_TERRAIN_POND:
        gBattleScripting.moveEffect = MOVE_EFFECT_SPD_MINUS_1;
        break;
    case BATTLE_TERRAIN_MOUNTAIN:
        gBattleScripting.moveEffect = MOVE_EFFECT_CONFUSION;
        break;
    case BATTLE_TERRAIN_CAVE:
        gBattleScripting.moveEffect = MOVE_EFFECT_FLINCH;
        break;
    default:
        gBattleScripting.moveEffect = MOVE_EFFECT_PARALYSIS;
        break;
    }
    gBattlescriptCurrInstr++;
}

static void Cmd_pickup(void)
{
    s32 i;
    u32 j;
    u16 species, heldItem;
    u32 ability;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG);
        heldItem = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
        if (GetMonData(&gPlayerParty[i], MON_DATA_ABILITY_NUM) != ABILITY_NONE)
            ability = gSpeciesInfo[species].abilities[1];
        else
            ability = gSpeciesInfo[species].abilities[0];
        if (ability == ABILITY_PICKUP && species != SPECIES_NONE && species != SPECIES_EGG && heldItem == ITEM_NONE && !(Random() % 10))
        {
            s32 random = Random() % 100;

            for (j = 0; j < 15; ++j)
                if (sPickupItems[j].chance > random)
                    break;
            SetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM, &sPickupItems[j]);
        }
    }
    gBattlescriptCurrInstr++;
}

static void Cmd_docastformchangeanimation(void)
{
    gActiveBattler = gBattleScripting.battler;

    if (gBattleMons[gActiveBattler].status2 & STATUS2_SUBSTITUTE)
        *(&gBattleStruct->formToChangeInto) |= CASTFORM_SUBSTITUTE;

    BtlController_EmitBattleAnimation(BUFFER_A, B_ANIM_FORM_CHANGE, &gDisableStructs[gActiveBattler], gBattleStruct->formToChangeInto);
    MarkBattlerForControllerExec(gActiveBattler);

    gBattlescriptCurrInstr++;
}

static void Cmd_trycastformdatachange(void)
{
    u8 form;

    gBattlescriptCurrInstr++;
    form = CastformDataTypeChange(gBattleScripting.battler);
    if (form)
    {
        BattleScriptPushCursorAndCallback(BattleScript_CastformChange);
        *(&gBattleStruct->formToChangeInto) = form - 1;
    }
}

// Water and Mud Sport
static void Cmd_settypebasedhalvers(void)
{
    bool8 worked = FALSE;

    if (gMovesInfo[gCurrentMove].effect == EFFECT_MUD_SPORT)
    {
        if (!(gStatuses4[gBattlerAttacker] & STATUS4_MUD_SPORT))
        {
            gStatuses4[gBattlerAttacker] |= STATUS4_MUD_SPORT;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEAKEN_ELECTRIC;
            worked = TRUE;
        }
    }
    else // Water Sport
    {
        if (!(gStatuses4[gBattlerAttacker] & STATUS4_WATER_SPORT))
        {
            gStatuses4[gBattlerAttacker] |= STATUS4_WATER_SPORT;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEAKEN_FIRE;
            worked = TRUE;
        }
    }

    if (worked)
        gBattlescriptCurrInstr += 5;
    else
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

static void Cmd_setweatherballtype(void)
{
    if (WEATHER_HAS_EFFECT)
    {
        if (gBattleWeather & B_WEATHER_ANY)
            gBattleScripting.dmgMultiplier = 2;
        if (gBattleWeather & B_WEATHER_RAIN)
            *(&gBattleStruct->dynamicMoveType) = TYPE_WATER | F_DYNAMIC_TYPE_2;
        else if (gBattleWeather & B_WEATHER_SANDSTORM)
            *(&gBattleStruct->dynamicMoveType) = TYPE_ROCK | F_DYNAMIC_TYPE_2;
        else if (gBattleWeather & B_WEATHER_SUN)
            *(&gBattleStruct->dynamicMoveType) = TYPE_FIRE | F_DYNAMIC_TYPE_2;
        else if (gBattleWeather & B_WEATHER_HAIL)
            *(&gBattleStruct->dynamicMoveType) = TYPE_ICE | F_DYNAMIC_TYPE_2;
        else
            *(&gBattleStruct->dynamicMoveType) = TYPE_NORMAL | F_DYNAMIC_TYPE_2;
    }

    gBattlescriptCurrInstr++;
}

static void Cmd_tryrecycleitem(void)
{
    u16 *usedHeldItem;

    gActiveBattler = gBattlerAttacker;
    usedHeldItem = &gBattleStruct->usedHeldItems[gActiveBattler][GetBattlerSide(gActiveBattler)];
    if (*usedHeldItem != ITEM_NONE && gBattleMons[gActiveBattler].item == ITEM_NONE)
    {
        gLastUsedItem = *usedHeldItem;
        *usedHeldItem = ITEM_NONE;
        gBattleMons[gActiveBattler].item = gLastUsedItem;

        BtlController_EmitSetMonData(BUFFER_A, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[gActiveBattler].item), &gBattleMons[gActiveBattler].item);
        MarkBattlerForControllerExec(gActiveBattler);

        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void Cmd_settypetoterrain(void)
{
    if (!IS_BATTLER_OF_TYPE(gBattlerAttacker, sTerrainToType[gBattleTerrain]))
    {
        SET_BATTLER_TYPE(gBattlerAttacker, sTerrainToType[gBattleTerrain]);
        PREPARE_TYPE_BUFFER(gBattleTextBuff1, sTerrainToType[gBattleTerrain]);

        gBattlescriptCurrInstr += 5;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

// Unused
static void Cmd_pursuitdoubles(void)
{
    gActiveBattler = GetBattlerAtPosition(GetBattlerPosition(gBattlerAttacker) ^ BIT_FLANK);

    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE
        && !(gAbsentBattlerFlags & gBitTable[gActiveBattler])
        && gChosenActionByBattler[gActiveBattler] == B_ACTION_USE_MOVE
        && gChosenMoveByBattler[gActiveBattler] == MOVE_PURSUIT)
    {
        gActionsByTurnOrder[gActiveBattler] = B_ACTION_TRY_FINISH;
        gCurrentMove = MOVE_PURSUIT;
        gBattlescriptCurrInstr += 5;
        gBattleScripting.animTurn = 1;
        gBattleScripting.pursuitDoublesAttacker = gBattlerAttacker;
        gBattlerAttacker = gActiveBattler;
    }
    else
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
}

static void Cmd_snatchsetbattlers(void)
{
    gEffectBattler = gBattlerAttacker;

    if (gBattlerAttacker == gBattlerTarget)
        gBattlerAttacker = gBattlerTarget = gBattleScripting.battler;
    else
        gBattlerTarget = gBattleScripting.battler;

    gBattleScripting.battler = gEffectBattler;
    gBattlescriptCurrInstr++;
}

// Brick Break
static void Cmd_removelightscreenreflect(void)
{
    u8 opposingSide = GetBattlerSide(gBattlerAttacker) ^ BIT_SIDE;

    if (gSideTimers[opposingSide].reflectTimer || gSideTimers[opposingSide].lightscreenTimer)
    {
        gSideStatuses[opposingSide] &= ~SIDE_STATUS_REFLECT;
        gSideStatuses[opposingSide] &= ~SIDE_STATUS_LIGHTSCREEN;
        gSideTimers[opposingSide].reflectTimer = 0;
        gSideTimers[opposingSide].lightscreenTimer = 0;
        gBattleScripting.animTurn = 1;
        gBattleScripting.animTargetsHit = 1;
    }
    else
    {
        gBattleScripting.animTurn = 0;
        gBattleScripting.animTargetsHit = 0;
    }

    gBattlescriptCurrInstr++;
}

u8 GetCatchingBattler(void)
{
    if (IsBattlerAlive(GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT)))
        return GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
    else
        return GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
}

static void Cmd_handleballthrow(void)
{
    u8 ballMultiplier = 0;
    if (gBattleControllerExecFlags)
        return;

    gActiveBattler = gBattlerAttacker;
    gBattlerTarget = gBattlerAttacker ^ BIT_SIDE;

    if (gBattleTypeFlags & BATTLE_TYPE_GHOST)
    {
        BtlController_EmitBallThrowAnim(BUFFER_A, BALL_GHOST_DODGE);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr = BattleScript_GhostBallDodge;
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
    {
        BtlController_EmitBallThrowAnim(BUFFER_A, BALL_TRAINER_BLOCK);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr = BattleScript_TrainerBallBlock;
    }
    else if (gBattleTypeFlags & (BATTLE_TYPE_POKEDUDE | BATTLE_TYPE_OLD_MAN_TUTORIAL))
    {
        BtlController_EmitBallThrowAnim(BUFFER_A, BALL_3_SHAKES_SUCCESS);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr = BattleScript_OldMan_Pokedude_CaughtMessage;
    }
    else
    {
        u32 odds;
        u8 catchRate;

        if (gLastUsedItem == ITEM_SAFARI_BALL)
            catchRate = gBattleStruct->safariCatchFactor * 1275 / 100;
        else
            catchRate = gSpeciesInfo[gBattleMons[gBattlerTarget].species].catchRate;

        if (gLastUsedItem > ITEM_SAFARI_BALL)
        {
            switch (gLastUsedItem)
            {
            case ITEM_NET_BALL:
                if (IS_BATTLER_OF_TYPE(gBattlerTarget, TYPE_WATER) || IS_BATTLER_OF_TYPE(gBattlerTarget, TYPE_BUG))
                    ballMultiplier = 30;
                else
                    ballMultiplier = 10;
                break;
            case ITEM_DIVE_BALL:
                if (GetCurrentMapType() == MAP_TYPE_UNDERWATER)
                    ballMultiplier = 35;
                else
                    ballMultiplier = 10;
                break;
            case ITEM_NEST_BALL:
                if (gBattleMons[gBattlerTarget].level < 40)
                {
                    ballMultiplier = 40 - gBattleMons[gBattlerTarget].level;
                    if (ballMultiplier <= 9)
                        ballMultiplier = 10;
                }
                else
                {
                    ballMultiplier = 10;
                }
                break;
            case ITEM_REPEAT_BALL:
                if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gBattlerTarget].species), FLAG_GET_CAUGHT))
                    ballMultiplier = 30;
                else
                    ballMultiplier = 10;
                break;
            case ITEM_TIMER_BALL:
                ballMultiplier = gBattleResults.battleTurnCounter + 10;
                if (ballMultiplier > 40)
                    ballMultiplier = 40;
                break;
            case ITEM_LUXURY_BALL:
            case ITEM_PREMIER_BALL:
                ballMultiplier = 10;
                break;
            }
        }
        else
            ballMultiplier = sBallCatchBonuses[gLastUsedItem - ITEM_ULTRA_BALL];

        odds = (catchRate * ballMultiplier / 10)
            * (gBattleMons[gBattlerTarget].maxHP * 3 - gBattleMons[gBattlerTarget].hp * 2)
            / (3 * gBattleMons[gBattlerTarget].maxHP);

        if (gBattleMons[gBattlerTarget].status1 & (STATUS1_SLEEP | STATUS1_FREEZE))
            odds *= 2;
        if (gBattleMons[gBattlerTarget].status1 & (STATUS1_POISON | STATUS1_BURN | STATUS1_PARALYSIS | STATUS1_TOXIC_POISON))
            odds = (odds * 15) / 10;

        if (gLastUsedItem != ITEM_SAFARI_BALL)
        {
            if (gLastUsedItem == ITEM_MASTER_BALL)
            {
                gBattleResults.usedMasterBall = TRUE;
            }
            else
            {
                if (gBattleResults.catchAttempts[gLastUsedItem - ITEM_ULTRA_BALL] < 255)
                    gBattleResults.catchAttempts[gLastUsedItem - ITEM_ULTRA_BALL]++;
            }
        }

        if (odds > 254) // mon caught
        {
            BtlController_EmitBallThrowAnim(BUFFER_A, BALL_3_SHAKES_SUCCESS);
            MarkBattlerForControllerExec(gActiveBattler);
            gBattlescriptCurrInstr = BattleScript_SuccessBallThrow;
            SetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattlerTarget]], MON_DATA_POKEBALL, &gLastUsedItem);

            if (CalculatePlayerPartyCount() == PARTY_SIZE)
                gBattleCommunication[MULTISTRING_CHOOSER] = 0;
            else
                gBattleCommunication[MULTISTRING_CHOOSER] = 1;
        }
        else // mon may be caught, calculate shakes
        {
            u8 shakes;

            odds = Sqrt(Sqrt(16711680 / odds));
            odds = 1048560 / odds;

            for (shakes = 0; shakes < BALL_3_SHAKES_SUCCESS && Random() < odds; shakes++);

            if (gLastUsedItem == ITEM_MASTER_BALL)
                shakes = BALL_3_SHAKES_SUCCESS; // why calculate the shakes before that check?

            BtlController_EmitBallThrowAnim(BUFFER_A, shakes);
            MarkBattlerForControllerExec(gActiveBattler);

            if (shakes == BALL_3_SHAKES_SUCCESS) // mon caught, copy of the code above
            {
                gBattlescriptCurrInstr = BattleScript_SuccessBallThrow;
                SetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattlerTarget]], MON_DATA_POKEBALL, &gLastUsedItem);

                if (CalculatePlayerPartyCount() == PARTY_SIZE)
                    gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                else
                    gBattleCommunication[MULTISTRING_CHOOSER] = 1;
            }
            else // not caught
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = shakes;
                gBattlescriptCurrInstr = BattleScript_ShakeBallThrow;
            }
        }
    }
}

static void Cmd_givecaughtmon(void)
{
    if (GiveMonToPlayer(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker ^ BIT_SIDE]]) != MON_GIVEN_TO_PARTY)
    {
        if (!ShouldShowBoxWasFullMessage())
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SENT_SOMEONES_PC;
            StringCopy(gStringVar1, GetBoxNamePtr(VarGet(VAR_PC_BOX_TO_SEND_MON)));
            GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker ^ BIT_SIDE]], MON_DATA_NICKNAME, gStringVar2);
        }
        else
        {
            StringCopy(gStringVar1, GetBoxNamePtr(VarGet(VAR_PC_BOX_TO_SEND_MON))); // box the mon was sent to
            GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker ^ BIT_SIDE]], MON_DATA_NICKNAME, gStringVar2);
            StringCopy(gStringVar3, GetBoxNamePtr(GetPCBoxToSendMon())); //box the mon was going to be sent to
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SOMEONES_BOX_FULL;
        }

        // Change to B_MSG_SENT_BILLS_PC or B_MSG_BILLS_BOX_FULL
        if (FlagGet(FLAG_SYS_NOT_SOMEONES_PC))
            gBattleCommunication[MULTISTRING_CHOOSER]++;
    }

    gBattleResults.caughtMonSpecies = gBattleMons[gBattlerAttacker ^ BIT_SIDE].species;
    GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker ^ BIT_SIDE]], MON_DATA_NICKNAME, gBattleResults.caughtMonNick);

    gBattlescriptCurrInstr++;
}

static void Cmd_trysetcaughtmondexflags(void)
{
    u16 species = GetMonData(&gEnemyParty[0], MON_DATA_SPECIES, NULL);
    u32 personality = GetMonData(&gEnemyParty[0], MON_DATA_PERSONALITY, NULL);

    if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_CAUGHT))
    {
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        HandleSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_SET_CAUGHT, personality);
        gBattlescriptCurrInstr += 5;
    }
}

static void Cmd_displaydexinfo(void)
{
    u16 species = GetMonData(&gEnemyParty[0], MON_DATA_SPECIES, NULL);

    switch (gBattleCommunication[0])
    {
    case 0:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_WHITE);
        gBattleCommunication[0]++;
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            FreeAllWindowBuffers();
            gBattleCommunication[TASK_ID] = DexScreen_RegisterMonToPokedex(species);
            gBattleCommunication[0]++;
        }
        break;
    case 2:
        if (!gPaletteFade.active
            && gMain.callback2 == BattleMainCB2
            && !gTasks[gBattleCommunication[TASK_ID]].isActive)
        {
            CpuFill32(0, (void *)VRAM, VRAM_SIZE);
            SetVBlankCallback(VBlankCB_Battle);
            gBattleCommunication[0]++;
        }
        break;
    case 3:
        InitBattleBgsVideo();
        LoadBattleTextboxAndBackground();
        gBattle_BG3_X = 256;
        gBattleCommunication[0]++;
        break;
    case 4:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            CreateMonPicSprite_HandleDeoxys(species,
                                            gBattleMons[B_POSITION_OPPONENT_LEFT].otId,
                                            gBattleMons[B_POSITION_OPPONENT_LEFT].personality,
                                            TRUE,
                                            120,
                                            64,
                                            0,
                                            0xFFFF);
            CpuFill32(0, gPlttBufferFaded, BG_PLTT_SIZE);
            BeginNormalPaletteFade(0x1FFFF, 0, 16, 0, RGB_BLACK);
            ShowBg(0);
            ShowBg(3);
            gBattleCommunication[0]++;
        }
        break;
    case 5:
        if (!gPaletteFade.active)
            gBattlescriptCurrInstr++;
        break;
    }
}

void HandleBattleWindow(u8 xStart, u8 yStart, u8 xEnd, u8 yEnd, u8 flags)
{
    s32 destY, destX;
    u16 var = 0;

    for (destY = yStart; destY <= yEnd; destY++)
    {
        for (destX = xStart; destX <= xEnd; destX++)
        {
            if (destY == yStart)
            {
                if (destX == xStart)
                    var = 0x1022;
                else if (destX == xEnd)
                    var = 0x1024;
                else
                    var = 0x1023;
            }
            else if (destY == yEnd)
            {
                if (destX == xStart)
                    var = 0x1028;
                else if (destX == xEnd)
                    var = 0x102A;
                else
                    var = 0x1029;
            }
            else
            {
                if (destX == xStart)
                    var = 0x1025;
                else if (destX == xEnd)
                    var = 0x1027;
                else
                    var = 0x1026;
            }

            if (flags & WINDOW_CLEAR)
                var = 0;

            if (flags & WINDOW_BG1)
                CopyToBgTilemapBufferRect_ChangePalette(1, &var, destX, destY, 1, 1, 0x11);
            else
                CopyToBgTilemapBufferRect_ChangePalette(0, &var, destX, destY, 1, 1, 0x11);
        }
    }
    CopyBgTilemapBufferToVram(1);
}

void BattleCreateYesNoCursorAt(void)
{
    u16 src[2];
    src[0] = 1;
    src[1] = 2;
    CopyToBgTilemapBufferRect_ChangePalette(0, src, 0x18, 9 + (2 * gBattleCommunication[1]), 1, 2, 0x11);
    CopyBgTilemapBufferToVram(0);
}

void BattleDestroyYesNoCursorAt(void)
{
    u16 src[2];
    src[0] = 32;
    src[1] = 32;

    CopyToBgTilemapBufferRect_ChangePalette(0, src, 0x18, 9 + (2 * gBattleCommunication[1]), 1, 2, 0x11);
    CopyBgTilemapBufferToVram(0);
}

static void Cmd_trygivecaughtmonnick(void)
{
    switch (gBattleCommunication[MULTIUSE_STATE])
    {
    case 0:
        HandleBattleWindow(23, 8, 29, 13, 0);
        BattlePutTextOnWindow(gText_BattleYesNoChoice, B_WIN_YESNO);
        gBattleCommunication[MULTIUSE_STATE]++;
        gBattleCommunication[CURSOR_POSITION] = 0;
        BattleCreateYesNoCursorAt();
        break;
    case 1:
        if (JOY_NEW(DPAD_UP) && gBattleCommunication[CURSOR_POSITION] != 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt();
            gBattleCommunication[CURSOR_POSITION] = 0;
            BattleCreateYesNoCursorAt();
        }
        if (JOY_NEW(DPAD_DOWN) && gBattleCommunication[CURSOR_POSITION] == 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt();
            gBattleCommunication[CURSOR_POSITION] = 1;
            BattleCreateYesNoCursorAt();
        }
        if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            if (gBattleCommunication[CURSOR_POSITION] == 0)
            {
                gBattleCommunication[MULTIUSE_STATE]++;
                BeginFastPaletteFade(3);
            }
            else
            {
                gBattleCommunication[MULTIUSE_STATE] = 4;
            }
        }
        else if (JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            gBattleCommunication[MULTIUSE_STATE] = 4;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker ^ BIT_SIDE]], MON_DATA_NICKNAME, gBattleStruct->caughtMonNick);
            FreeAllWindowBuffers();

            DoNamingScreen(NAMING_SCREEN_CAUGHT_MON, gBattleStruct->caughtMonNick,
                           GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker ^ BIT_SIDE]], MON_DATA_SPECIES),
                           GetMonGender(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker ^ BIT_SIDE]]),
                           GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker ^ BIT_SIDE]], MON_DATA_PERSONALITY, NULL),
                           BattleMainCB2);

            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 3:
        if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
        {
            SetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattlerAttacker ^ BIT_SIDE]], MON_DATA_NICKNAME, gBattleStruct->caughtMonNick);
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        }
        break;
    case 4:
        if (CalculatePlayerPartyCount() == PARTY_SIZE)
            gBattlescriptCurrInstr += 5;
        else
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        break;
    }
}

static void Cmd_subattackerhpbydmg(void)
{
    gBattleMons[gBattlerAttacker].hp -= gBattleMoveDamage;
    gBattlescriptCurrInstr++;
}

static void Cmd_removeattackerstatus1(void)
{
    gBattleMons[gBattlerAttacker].status1 = 0;
    gBattlescriptCurrInstr++;
}

static void Cmd_finishaction(void)
{
    gCurrentActionFuncId = B_ACTION_FINISHED;
}

static void Cmd_finishturn(void)
{
    gCurrentActionFuncId = B_ACTION_FINISHED;
    gCurrentTurnActionNumber = gBattlersCount;
}

static void Cmd_callnative(void)
{
    CMD_ARGS(void (*func)(void));
    void (*func)(void) = cmd->func;
    func();
}

void BS_GetBattlerSide(void)
{
    NATIVE_ARGS(u8 battler);
    gBattleCommunication[0] = GetBattlerSide(GetBattlerForBattleScript(cmd->battler));
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_ItemRestoreHP(void)
{
    NATIVE_ARGS(const u8 *alreadyMaxHpInstr);
    u16 healAmount;
    u32 battler = MAX_BATTLERS_COUNT;
    u32 healParam = ItemId_GetEffect(gLastUsedItem)[6];
    u32 side = GetBattlerSide(gBattlerAttacker);
    struct Pokemon *party = GetSideParty(side);
    u16 hp = GetMonData(&party[gBattleStruct->itemPartyIndex[gBattlerAttacker]], MON_DATA_HP);
    u16 maxHP = GetMonData(&party[gBattleStruct->itemPartyIndex[gBattlerAttacker]], MON_DATA_MAX_HP);
    gBattleCommunication[MULTIUSE_STATE] = 0;

    if (hp == maxHP)
    {
        gBattlescriptCurrInstr = cmd->alreadyMaxHpInstr;
    }
    else
    {
        // Track the number of Revives used in a battle.
        if (hp == 0 && side == B_SIDE_PLAYER && gBattleResults.numRevivesUsed < 255)
            gBattleResults.numRevivesUsed++;

        // Check if the recipient is an active battler.
        if (gBattleStruct->itemPartyIndex[gBattlerAttacker] == gBattlerPartyIndexes[gBattlerAttacker])
            battler = gBattlerAttacker;
        else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE
                    && gBattleStruct->itemPartyIndex[gBattlerAttacker] == gBattlerPartyIndexes[BATTLE_PARTNER(gBattlerAttacker)])
            battler = BATTLE_PARTNER(gBattlerAttacker);

        // Get amount to heal.
        switch (healParam)
        {
            case ITEM6_HEAL_HP_FULL:
                healAmount = maxHP;
                break;
            case ITEM6_HEAL_HP_HALF:
                healAmount = maxHP / 2;
                break;
            case ITEM6_HEAL_HP_QUARTER:
                healAmount = maxHP / 4;
                break;
            default:
                healAmount = healParam;
                break;
        }
        if (hp + healAmount > maxHP)
            healAmount = maxHP - hp;

        gBattleScripting.battler = battler;
        PREPARE_SPECIES_BUFFER(gBattleTextBuff1, GetMonData(&party[gBattleStruct->itemPartyIndex[gBattlerAttacker]], MON_DATA_SPECIES));

        // Heal is applied as move damage if battler is active.
        if (battler != MAX_BATTLERS_COUNT && hp != 0)
        {
            gBattleMoveDamage = -healAmount;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        else
        {
            hp += healAmount;
            SetMonData(&party[gBattleStruct->itemPartyIndex[gBattlerAttacker]], MON_DATA_HP, &hp);

            // Revived battlers on the field need to be brought back.
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE && battler != MAX_BATTLERS_COUNT)
            {
                gAbsentBattlerFlags &= ~gBitTable[battler];
                gBattleCommunication[MULTIUSE_STATE] = TRUE;
            }
            gBattlescriptCurrInstr = BattleScript_ItemRestoreHP_Party;
        }
    }
}

void BS_ItemCureStatus(void)
{
    NATIVE_ARGS(const u8 *noStatusInstr);
    u32 battler = gBattlerAttacker;
    u32 side = GetBattlerSide(gBattlerAttacker);
    u32 previousStatus2 = 0;
    bool32 statusChanged = FALSE;
    struct Pokemon *party = GetSideParty(side);

    // Heal Status2 conditions if battler is active.
    if (gBattleStruct->itemPartyIndex[gBattlerAttacker] == gBattlerPartyIndexes[gBattlerAttacker])
    {
        previousStatus2 = gBattleMons[battler].status2;
        gBattleMons[gBattlerAttacker].status2 &= ~GetItemStatus2Mask(gLastUsedItem);
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE
                && gBattleStruct->itemPartyIndex[gBattlerAttacker] == gBattlerPartyIndexes[BATTLE_PARTNER(gBattlerAttacker)])
    {
        battler = BATTLE_PARTNER(gBattlerAttacker);
        previousStatus2 = gBattleMons[battler].status2;
        gBattleMons[battler].status2 &= ~GetItemStatus2Mask(gLastUsedItem);
    }

    if (previousStatus2 != gBattleMons[battler].status2)
        statusChanged = TRUE;

    // Heal Status1 conditions.
    if (!HealStatusConditions(&party[gBattleStruct->itemPartyIndex[gBattlerAttacker]], GetItemStatus1Mask(gLastUsedItem), battler))
    {
        statusChanged = TRUE;
        if (GetItemStatus1Mask(gLastUsedItem) & STATUS1_SLEEP)
            gBattleMons[battler].status2 &= ~STATUS2_NIGHTMARE;
        if (GetItemStatus2Mask(gLastUsedItem) & STATUS2_CONFUSION)
            gStatuses4[battler] &= ~STATUS4_INFINITE_CONFUSION;
    }

    if (statusChanged)
    {
        gBattleScripting.battler = battler;
        PREPARE_SPECIES_BUFFER(gBattleTextBuff1, GetMonData(&party[gBattleStruct->itemPartyIndex[gBattlerAttacker]], MON_DATA_SPECIES));
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->noStatusInstr;
    }
}

void BS_ItemIncreaseStat(void)
{
    NATIVE_ARGS();
    u16 statId = ItemId_GetEffect(gLastUsedItem)[1];
    u16 stages = ItemId_GetHoldEffectParam(gLastUsedItem);
    SET_STATCHANGER(statId, stages, FALSE);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_ItemRestorePP(void)
{
    NATIVE_ARGS();
    const u8 *effect = ItemId_GetEffect(gLastUsedItem);
    u32 i, pp, maxPP, moveId, loopEnd;
    u32 battler = MAX_BATTLERS_COUNT;
    struct Pokemon *mon = (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER) ? &gPlayerParty[gBattleStruct->itemPartyIndex[gBattlerAttacker]] : &gEnemyParty[gBattleStruct->itemPartyIndex[gBattlerAttacker]];
    u16 species = GetMonData(mon, MON_DATA_SPECIES);

    // // Check whether to apply to all moves.
    if (effect[4] & ITEM4_HEAL_PP_ONE)
    {
        i = gBattleStruct->itemMoveIndex[gBattlerAttacker];
        loopEnd = i + 1;
    }
    else
    {
        i = 0;
        loopEnd = MAX_MON_MOVES;
    }

    // Check if the recipient is an active battler.
    if (gBattleStruct->itemPartyIndex[gBattlerAttacker] == gBattlerPartyIndexes[gBattlerAttacker])
        battler = gBattlerAttacker;
    else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE
                && gBattleStruct->itemPartyIndex[gBattlerAttacker] == gBattlerPartyIndexes[BATTLE_PARTNER(gBattlerAttacker)])
        battler = BATTLE_PARTNER(gBattlerAttacker);

    // Heal PP!
    for (; i < loopEnd; i++)
    {
        pp = GetMonData(mon, MON_DATA_PP1 + i, NULL);
        moveId = GetMonData(mon, MON_DATA_MOVE1 + i, NULL);
        maxPP = CalculatePPWithBonus(moveId, GetMonData(mon, MON_DATA_PP_BONUSES, NULL), i);
        if (pp != maxPP)
        {
            pp += effect[6];
            if (pp > maxPP)
                pp = maxPP;
            SetMonData(mon, MON_DATA_PP1 + i, &pp);

            // Update battler PP if needed.
            if (battler != MAX_BATTLERS_COUNT
                && gBattleStruct->itemPartyIndex[gBattlerAttacker] == gBattlerPartyIndexes[battler]
                && MOVE_IS_PERMANENT(battler, i))
            {
                gBattleMons[battler].pp[i] = pp;
            }
        }
    }
    gBattleScripting.battler = battler;
    PREPARE_SPECIES_BUFFER(gBattleTextBuff1, species);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_RunStatChangeItems(void)
{
    NATIVE_ARGS(u8 battler);

    // Change instruction before calling ItemBattleEffects.
    gBattlescriptCurrInstr = cmd->nextInstr;
    ItemBattleEffects(ITEMEFFECT_STATS_CHANGED, GetBattlerForBattleScript(cmd->battler), FALSE); // TODO: update
}

bool32 IsMoveAffectedByParentalBond(u32 move, u32 battler)
{
    if (move != MOVE_NONE && move != MOVE_UNAVAILABLE && move != MOVE_STRUGGLE
        && !gMovesInfo[move].parentalBondBanned
        && gMovesInfo[move].category != DAMAGE_CATEGORY_STATUS
        && gMovesInfo[move].strikeCount < 2)
    {
        if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
        {
            switch (GetBattlerMoveTargetType(battler, move))
            {
            // Both foes are alive, spread move strikes once
            case MOVE_TARGET_BOTH:
                if (CountAliveMonsInBattle(BATTLE_ALIVE_SIDE, gBattlerTarget) >= 2)
                    return FALSE;
                break;
            // Either both foes or one foe and its ally are alive; spread move strikes once
            case MOVE_TARGET_FOES_AND_ALLY:
                if (CountAliveMonsInBattle(BATTLE_ALIVE_EXCEPT_BATTLER, gBattlerAttacker) >= 2)
                    return FALSE;
                break;
            default:
            break;
            }
        }
        return TRUE;
    }
    return FALSE;
}

u32 IsFlowerVeilProtected(u32 battler)
{
    if (IS_BATTLER_OF_TYPE(battler, TYPE_GRASS))
        return IsAbilityOnSide(battler, ABILITY_FLOWER_VEIL);
    else
        return 0;
}

u32 IsLeafGuardProtected(u32 battler)
{
    if (IsBattlerWeatherAffected(battler, B_WEATHER_SUN))
        return GetBattlerAbility(battler) == ABILITY_LEAF_GUARD;
    else
        return 0;
}

bool32 IsShieldsDownProtected(u32 battler)
{
    return (GetBattlerAbility(battler) == ABILITY_SHIELDS_DOWN
            && GetFormIdFromFormSpeciesId(gBattleMons[battler].species) < GetFormIdFromFormSpeciesId(SPECIES_MINIOR_CORE_RED)); // Minior is not in core form
}

u32 IsAbilityStatusProtected(u32 battler)
{
    return IsFlowerVeilProtected(battler)
        || IsLeafGuardProtected(battler)
        || IsShieldsDownProtected(battler);
}

u32 GetHighestStatId(u32 battler)
{
    u32 i, highestId = STAT_ATK, highestStat = gBattleMons[battler].attack;

    for (i = STAT_DEF; i < NUM_STATS; i++)
    {
        u16 *statVal = &gBattleMons[battler].attack + (i - 1);
        if (*statVal > highestStat)
        {
            highestStat = *statVal;
            highestId = i;
        }
    }
    return highestId;
}

bool32 DoesSubstituteBlockMove(u32 battlerAtk, u32 battlerDef, u32 move)
{
    if (!(gBattleMons[battlerDef].status2 & STATUS2_SUBSTITUTE))
        return FALSE;
    else if (gMovesInfo[move].ignoresSubstitute)
        return FALSE;
    else if (GetBattlerAbility(battlerAtk) == ABILITY_INFILTRATOR)
        return FALSE;
    else
        return TRUE;
}

bool32 DoesDisguiseBlockMove(u32 battler, u32 move)
{
    // TODO: Totems
    if (!(gBattleMons[battler].species == SPECIES_MIMIKYU_DISGUISED /* || gBattleMons[battler].species == SPECIES_MIMIKYU_TOTEM_DISGUISED */)
        || gBattleMons[battler].status2 & STATUS2_TRANSFORMED
        || (!gProtectStructs[battler].confusionSelfDmg && (IS_MOVE_STATUS(move) || gHitMarker & HITMARKER_PASSIVE_DAMAGE))
        || gHitMarker & HITMARKER_IGNORE_DISGUISE
        || GetBattlerAbility(battler) != ABILITY_DISGUISE)
        return FALSE;
    else
        return TRUE;
}

static bool8 IsFinalStrikeEffect(u16 move)
{
    u32 i;
    u16 moveEffect = gMovesInfo[move].effect;

    for (i = 0; i < ARRAY_COUNT(sFinalStrikeOnlyEffects); i++)
    {
        if (moveEffect == sFinalStrikeOnlyEffects[i])
            return TRUE;
    }
    return FALSE;
}

bool32 CanPoisonType(u8 battlerAttacker, u8 battlerTarget)
{
    return GetBattlerAbility(battlerAttacker) == ABILITY_CORROSION
        || (!IS_BATTLER_OF_TYPE(battlerTarget, TYPE_STEEL) && !IS_BATTLER_OF_TYPE(battlerTarget, TYPE_POISON));
}

bool32 CanParalyzeType(u8 battlerAttacker, u8 battlerTarget)
{
    return !(B_PARALYZE_ELECTRIC >= GEN_6 && IS_BATTLER_OF_TYPE(battlerTarget, TYPE_ELECTRIC));
}

static void TryUpdateRoundTurnOrder(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
    {
        u32 i;
        u32 j = 0;
        u32 k = 0;
        u32 currRounder = 0;
        u8 roundUsers[3] = {0xFF, 0xFF, 0xFF};
        u8 nonRoundUsers[3] = {0xFF, 0xFF, 0xFF};
        for (i = 0; i < gBattlersCount; i++)
        {
            if (gBattlerByTurnOrder[i] == gBattlerAttacker)
            {
                currRounder = i + 1; // Current battler going after attacker
                break;
            }
        }

        // Get battlers after us using round
        for (i = currRounder; i < gBattlersCount; i++)
        {
            if (gChosenMoveByBattler[gBattlerByTurnOrder[i]] == MOVE_ROUND)
                roundUsers[j++] = gBattlerByTurnOrder[i];
            else
                nonRoundUsers[k++] = gBattlerByTurnOrder[i];
        }

        // update turn order for round users
        for (i = 0; roundUsers[i] != 0xFF && i < 3; i++)
        {
            gBattlerByTurnOrder[currRounder] = roundUsers[i];
            gActionsByTurnOrder[currRounder] = gActionsByTurnOrder[roundUsers[i]];
            gProtectStructs[roundUsers[i]].quash = TRUE; // Make it so their turn order can't be changed again
            currRounder++;
        }

        // Update turn order for non-round users
        for (i = 0; nonRoundUsers[i] != 0xFF && i < 3; i++)
        {
            gBattlerByTurnOrder[currRounder] = nonRoundUsers[i];
            gActionsByTurnOrder[currRounder] = gActionsByTurnOrder[nonRoundUsers[i]];
            currRounder++;
        }
    }
}

void BS_TryRevertWeatherForm(void)
{
    NATIVE_ARGS();
    if (TryBattleFormChange(gBattlerTarget, FORM_CHANGE_BATTLE_WEATHER))
    {
        gBattleScripting.battler = gBattlerTarget;
        BattleScriptPush(cmd->nextInstr);
        gBattlescriptCurrInstr = BattleScript_TargetFormChangeWithStringNoPopup;
        return;
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

// Used by Bestow and Symbiosis to take an item from one battler and give to another.
static void BestowItem(u32 battlerAtk, u32 battlerDef)
{
    gLastUsedItem = gBattleMons[battlerAtk].item;

    gBattleMons[battlerAtk].item = ITEM_NONE;
    gActiveBattler = battlerAtk;
    BtlController_EmitSetMonData(BUFFER_A, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[battlerAtk].item), &gBattleMons[battlerAtk].item);
    MarkBattlerForControllerExec(battlerAtk);
    CheckSetUnburden(battlerAtk);

    gBattleMons[battlerDef].item = gLastUsedItem;
    gActiveBattler = battlerDef;
    BtlController_EmitSetMonData(BUFFER_A, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[battlerDef].item), &gBattleMons[battlerDef].item);
    MarkBattlerForControllerExec(battlerDef);
    gBattleResources->flags->flags[battlerDef] &= ~RESOURCE_FLAG_UNBURDEN;
}

void BS_TrySymbiosis(void)
{
    NATIVE_ARGS();
    //called by Bestow, Fling, and Bug Bite, which don't work with Cmd_removeitem.
    u32 partner = BATTLE_PARTNER(gBattlerAttacker);
    if (SYMBIOSIS_CHECK(gBattlerAttacker, partner))
    {
        BestowItem(partner, gBattlerAttacker);
        gLastUsedAbility = gBattleMons[partner].ability;
        gBattleScripting.battler = gBattlerAbility = partner;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_SymbiosisActivates;
        return;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void ApplyExperienceMultipliers(s32 *expAmount, u8 expGetterMonId, u8 faintedBattler)
{
    u32 holdEffect = GetMonHoldEffect(&gPlayerParty[expGetterMonId]);

    if (IsTradedMon(&gPlayerParty[expGetterMonId]))
        *expAmount = (*expAmount * 150) / 100;
    if (holdEffect == HOLD_EFFECT_LUCKY_EGG)
        *expAmount = (*expAmount * 150) / 100;
    if (B_UNEVOLVED_EXP_MULTIPLIER >= GEN_6 && IsMonPastEvolutionLevel(&gPlayerParty[expGetterMonId]))
        *expAmount = (*expAmount * 4915) / 4096;
    if (B_AFFECTION_MECHANICS == TRUE && GetBattlerAffectionHearts(expGetterMonId) >= AFFECTION_FOUR_HEARTS)
        *expAmount = (*expAmount * 4915) / 4096;
    if (CheckBagHasItem(ITEM_EXP_CHARM, 1)) //is also for other exp boosting Powers if/when implemented
        *expAmount = (*expAmount * 150) / 100;

    if (B_SCALED_EXP >= GEN_5 && B_SCALED_EXP != GEN_6)
    {
        // Note: There is an edge case where if a pokemon receives a large amount of exp, it wouldn't be properly calculated
        //       because of multiplying by scaling factor(the value would simply be larger than an u32 can hold). Hence u64 is needed.
        u64 value = *expAmount;
        u8 faintedLevel = gBattleMons[faintedBattler].level;
        u8 expGetterLevel = GetMonData(&gPlayerParty[expGetterMonId], MON_DATA_LEVEL);

        value *= sExperienceScalingFactors[(faintedLevel * 2) + 10];
        value /= sExperienceScalingFactors[faintedLevel + expGetterLevel + 10];
        *expAmount = value + 1;
    }
}
