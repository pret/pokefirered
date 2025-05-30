#include "global.h"
#include "battle.h"
#include "battle_message.h"
#include "battle_anim.h"
#include "battle_ai_main.h"
#include "battle_ai_util.h"
#include "battle_scripts.h"
#include "battle_terrain.h"
#include "battle_z_move.h"
#include "item.h"
#include "util.h"
#include "pokemon.h"
#include "random.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "text.h"
#include "sound.h"
#include "pokedex.h"
#include "recorded_battle.h"
#include "window.h"
#include "reshow_battle_screen.h"
#include "main.h"
#include "palette.h"
#include "money.h"
#include "malloc.h"
#include "bg.h"
#include "string_util.h"
#include "pokemon_icon.h"
#include "caps.h"
#include "m4a.h"
#include "mail.h"
#include "event_data.h"
#include "pokemon_special_anim.h"
#include "pokemon_storage_system.h"
#include "task.h"
#include "naming_screen.h"
#include "battle_setup.h"
#include "overworld.h"
#include "wild_encounter.h"
#include "rtc.h"
#include "party_menu.h"
#include "trainer_pokemon_sprites.h"
// #include "battle_arena.h"
// #include "battle_pike.h"
// #include "battle_pyramid.h"
#include "field_specials.h"
#include "pokemon_summary_screen.h"
// #include "pokenav.h"
// #include "menu_specialized.h"
#include "data.h"
#include "generational_changes.h"
#include "move.h"
#include "constants/abilities.h"
#include "constants/battle_anim.h"
#include "constants/battle_move_effects.h"
#include "constants/battle_string_ids.h"
#include "constants/battle_partner.h"
#include "constants/hold_effects.h"
#include "constants/items.h"
#include "constants/item_effects.h"
#include "constants/map_types.h"
#include "constants/moves.h"
#include "constants/party_menu.h"
#include "constants/rgb.h"
#include "constants/songs.h"
#include "constants/trainer_slide.h"
#include "constants/trainers.h"
#include "battle_util.h"
#include "constants/pokemon.h"
#include "config/battle.h"
#include "data/battle_move_effects.h"

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

static const u16 sWhiteOutBadgeMoney[9] = { 8, 16, 24, 36, 48, 64, 80, 100, 120 };

enum GiveCaughtMonStates
{
    GIVECAUGHTMON_CHECK_PARTY_SIZE,
    GIVECAUGHTMON_ASK_ADD_TO_PARTY,
    GIVECAUGHTMON_HANDLE_INPUT,
    GIVECAUGHTMON_DO_CHOOSE_MON,
    GIVECAUGHTMON_HANDLE_CHOSEN_MON,
    GIVECAUGHTMON_GIVE_AND_SHOW_MSG,
};

#define STAT_CHANGE_WORKED      0
#define STAT_CHANGE_DIDNT_WORK  1

#define LEVEL_UP_BANNER_START 416
#define LEVEL_UP_BANNER_END   512

#define TAG_LVLUP_BANNER_MON_ICON 55130

static void TrySetDestinyBondToHappen(void);
static u32 ChangeStatBuffs(s8 statValue, u32 statId, u32 flags, const u8 *BS_ptr);
static void InitLevelUpBanner(void);
static bool8 SlideInLevelUpBanner(void);
static bool8 SlideOutLevelUpBanner(void);
static void DrawLevelUpWindow1(void);
static void DrawLevelUpWindow2(void);
static void PutMonIconOnLvlUpBanner(void);
static void DrawLevelUpBannerText(void);
static void SpriteCB_MonIconOnLvlUpBanner(struct Sprite *sprite);
static bool32 CriticalCapture(u32 odds);
static void BestowItem(u32 battlerAtk, u32 battlerDef);
static bool8 IsFinalStrikeEffect(enum BattleMoveEffects moveEffect);
static void TryUpdateRoundTurnOrder(void);
static bool32 ChangeOrderTargetAfterAttacker(void);
static bool32 SetTargetToNextPursuiter(u32 battlerDef);
void ApplyExperienceMultipliers(s32 *expAmount, u8 expGetterMonId, u8 faintedBattler);
static void RemoveAllWeather(void);
static void RemoveAllTerrains(void);
static bool32 CanAbilityPreventStatLoss(u32 abilityDef);
static u32 GetNextTarget(u32 moveTarget, bool32 excludeCurrent);
static void TryUpdateEvolutionTracker(u32 evolutionCondition, u32 upAmount, u16 usedMove);
static void AccuracyCheck(bool32 recalcDragonDarts, const u8 *nextInstr, const u8 *failInstr, u16 move);
static void ResetValuesForCalledMove(void);
static void TryRestoreDamageAfterCheeckPouch(u32 battler);

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
static void Cmd_absorb(void);
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
static void Cmd_sethealblock(void);
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
static void Cmd_setgravity(void);
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
static void Cmd_setfieldweather(void);
static void Cmd_setreflect(void);
static void Cmd_setseeded(void);
static void Cmd_manipulatedamage(void);
static void Cmd_trysetrest(void);
static void Cmd_jumpifnotfirstturn(void);
static void Cmd_setmiracleeye(void);
static void Cmd_jumpifuproarwakes(void);
static void Cmd_stockpile(void);
static void Cmd_stockpiletobasedamage(void);
static void Cmd_stockpiletohpheal(void);
static void Cmd_setdrainedhp(void);
static void Cmd_statbuffchange(void);
static void Cmd_normalisebuffs(void);
static void Cmd_setbide(void);
static void Cmd_twoturnmoveschargestringandanimation(void);
static void Cmd_trynonvolatilestatus(void);
static void Cmd_initmultihitstring(void);
static void Cmd_forcerandomswitch(void);
static void Cmd_tryconversiontypechange(void);
static void Cmd_givepaydaymoney(void);
static void Cmd_setlightscreen(void);
static void Cmd_tryKO(void);
static void Cmd_unused_0x94(void);
static void Cmd_copybidedmg(void);
static void Cmd_unused_96(void);
static void Cmd_tryinfatuating(void);
static void Cmd_updatestatusicon(void);
static void Cmd_setmist(void);
static void Cmd_setfocusenergy(void);
static void Cmd_transformdataexecution(void);
static void Cmd_setsubstitute(void);
static void Cmd_mimicattackcopy(void);
static void Cmd_metronome(void);
static void Cmd_unused_0x9f(void);
static void Cmd_unused_0xA0(void);
static void Cmd_counterdamagecalculator(void);
static void Cmd_mirrorcoatdamagecalculator(void);
static void Cmd_disablelastusedattack(void);
static void Cmd_trysetencore(void);
static void Cmd_painsplitdmgcalc(void);
static void Cmd_settypetorandomresistance(void);
static void Cmd_setalwayshitflag(void);
static void Cmd_copymovepermanently(void);
static void Cmd_trychoosesleeptalkmove(void);
static void Cmd_trysetdestinybond(void);
static void Cmd_trysetdestinybondtohappen(void);
static void Cmd_settailwind(void);
static void Cmd_tryspiteppreduce(void);
static void Cmd_healpartystatus(void);
static void Cmd_cursetarget(void);
static void Cmd_trysetspikes(void);
static void Cmd_setforesight(void);
static void Cmd_trysetperishsong(void);
static void Cmd_handlerollout(void);
static void Cmd_jumpifconfusedandstatmaxed(void);
static void Cmd_handlefurycutter(void);
static void Cmd_setembargo(void);
static void Cmd_presentdamagecalculation(void);
static void Cmd_setsafeguard(void);
static void Cmd_magnitudedamagecalculation(void);
static void Cmd_jumpifnopursuitswitchdmg(void);
static void Cmd_tryrestorehpberry(void);
static void Cmd_halvehp(void);
static void Cmd_copyfoestats(void);
static void Cmd_rapidspinfree(void);
static void Cmd_setdefensecurlbit(void);
static void Cmd_recoverbasedonsunlight(void);
static void Cmd_setstickyweb(void);
static void Cmd_selectfirstvalidtarget(void);
static void Cmd_trysetfutureattack(void);
static void Cmd_trydobeatup(void);
static void Cmd_setsemiinvulnerablebit(void);
static void Cmd_tryfiretwoturnmovenowbyeffect(void);
static void Cmd_setminimize(void);
static void Cmd_unused_c8(void);
static void Cmd_trymemento(void);
static void Cmd_setforcedtarget(void);
static void Cmd_setcharge(void);
static void Cmd_callenvironmentattack(void);
static void Cmd_curestatuswithmove(void);
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
static void Cmd_setroom(void);
static void Cmd_tryswapabilities(void);
static void Cmd_tryimprison(void);
static void Cmd_setstealthrock(void);
static void Cmd_setuserstatus3(void);
static void Cmd_assistattackselect(void);
static void Cmd_trysetmagiccoat(void);
static void Cmd_trysetsnatch(void);
static void Cmd_unused2(void);
static void Cmd_switchoutabilities(void);
static void Cmd_jumpifhasnohp(void);
static void Cmd_jumpifnotcurrentmoveargtype(void);
static void Cmd_pickup(void);
static void Cmd_unused_0xE6(void);
static void Cmd_unused_0xE7(void);
static void Cmd_settypebasedhalvers(void);
static void Cmd_jumpifsubstituteblocks(void);
static void Cmd_tryrecycleitem(void);
static void Cmd_settypetoenvironment(void);
static void Cmd_pursuitdoubles(void);
static void Cmd_snatchsetbattlers(void);
static void Cmd_removescreens(void);
static void Cmd_handleballthrow(void);
static void Cmd_givecaughtmon(void);
static void Cmd_trysetcaughtmondexflags(void);
static void Cmd_displaydexinfo(void);
static void Cmd_trygivecaughtmonnick(void);
static void Cmd_subattackerhpbydmg(void);
static void Cmd_removeattackerstatus1(void);
static void Cmd_finishaction(void);
static void Cmd_finishturn(void);
static void Cmd_trainerslideout(void);
static void Cmd_settelekinesis(void);
static void Cmd_swapstatstages(void);
static void Cmd_averagestats(void);
static void Cmd_jumpifcaptivateaffected(void);
static void Cmd_setnonvolatilestatus(void);
static void Cmd_tryworryseed(void);
static void Cmd_callnative(void);

void (*const gBattleScriptingCommandsTable[])(void) =
{
    Cmd_attackcanceler,                          //0x0
    Cmd_accuracycheck,                           //0x1
    Cmd_attackstring,                            //0x2
    Cmd_ppreduce,                                //0x3
    Cmd_critcalc,                                //0x4
    Cmd_damagecalc,                              //0x5
    Cmd_typecalc,                                //0x6
    Cmd_adjustdamage,                            //0x7
    Cmd_multihitresultmessage,                   //0x8
    Cmd_attackanimation,                         //0x9
    Cmd_waitanimation,                           //0xA
    Cmd_healthbarupdate,                         //0xB
    Cmd_datahpupdate,                            //0xC
    Cmd_critmessage,                             //0xD
    Cmd_effectivenesssound,                      //0xE
    Cmd_resultmessage,                           //0xF
    Cmd_printstring,                             //0x10
    Cmd_printselectionstring,                    //0x11
    Cmd_waitmessage,                             //0x12
    Cmd_printfromtable,                          //0x13
    Cmd_printselectionstringfromtable,           //0x14
    Cmd_setadditionaleffects,                    //0x15
    Cmd_seteffectprimary,                        //0x16
    Cmd_seteffectsecondary,                      //0x17
    Cmd_clearstatusfromeffect,                   //0x18
    Cmd_tryfaintmon,                             //0x19
    Cmd_dofaintanimation,                        //0x1A
    Cmd_cleareffectsonfaint,                     //0x1B
    Cmd_jumpifstatus,                            //0x1C
    Cmd_jumpifstatus2,                           //0x1D
    Cmd_jumpifability,                           //0x1E
    Cmd_jumpifsideaffecting,                     //0x1F
    Cmd_jumpifstat,                              //0x20
    Cmd_jumpifstatus3condition,                  //0x21
    Cmd_jumpbasedontype,                         //0x22
    Cmd_getexp,                                  //0x23
    Cmd_checkteamslost,                          //0x24
    Cmd_movevaluescleanup,                       //0x25
    Cmd_setmultihit,                             //0x26
    Cmd_decrementmultihit,                       //0x27
    Cmd_goto,                                    //0x28
    Cmd_jumpifbyte,                              //0x29
    Cmd_jumpifhalfword,                          //0x2A
    Cmd_jumpifword,                              //0x2B
    Cmd_jumpifarrayequal,                        //0x2C
    Cmd_jumpifarraynotequal,                     //0x2D
    Cmd_setbyte,                                 //0x2E
    Cmd_addbyte,                                 //0x2F
    Cmd_subbyte,                                 //0x30
    Cmd_copyarray,                               //0x31
    Cmd_copyarraywithindex,                      //0x32
    Cmd_orbyte,                                  //0x33
    Cmd_orhalfword,                              //0x34
    Cmd_orword,                                  //0x35
    Cmd_bicbyte,                                 //0x36
    Cmd_bichalfword,                             //0x37
    Cmd_bicword,                                 //0x38
    Cmd_pause,                                   //0x39
    Cmd_waitstate,                               //0x3A
    Cmd_absorb,                                  //0x3B
    Cmd_return,                                  //0x3C
    Cmd_end,                                     //0x3D
    Cmd_end2,                                    //0x3E
    Cmd_end3,                                    //0x3F
    Cmd_unused5,                                 //0x40
    Cmd_call,                                    //0x41
    Cmd_setroost,                                //0x42
    Cmd_jumpifabilitypresent,                    //0x43
    Cmd_endselectionscript,                      //0x44
    Cmd_playanimation,                           //0x45
    Cmd_playanimation_var,                       //0x46
    Cmd_setgraphicalstatchangevalues,            //0x47
    Cmd_playstatchangeanimation,                 //0x48
    Cmd_moveend,                                 //0x49
    Cmd_sethealblock,                            //0x4A
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
    Cmd_returntoball,                            //0x58
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
    Cmd_setgravity,                              //0x69
    Cmd_removeitem,                              //0x6A
    Cmd_atknameinbuff1,                          //0x6B
    Cmd_drawlvlupbox,                            //0x6C
    Cmd_resetsentmonsvalue,                      //0x6D
    Cmd_setatktoplayer0,                         //0x6E
    Cmd_makevisible,                             //0x6F
    Cmd_recordability,                           //0x70
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
    Cmd_setfieldweather,                         //0x7D
    Cmd_setreflect,                              //0x7E
    Cmd_setseeded,                               //0x7F
    Cmd_manipulatedamage,                        //0x80
    Cmd_trysetrest,                              //0x81
    Cmd_jumpifnotfirstturn,                      //0x82
    Cmd_setmiracleeye,                           //0x83
    Cmd_jumpifuproarwakes,                       //0x84
    Cmd_stockpile,                               //0x85
    Cmd_stockpiletobasedamage,                   //0x86
    Cmd_stockpiletohpheal,                       //0x87
    Cmd_setdrainedhp,                            //0x88
    Cmd_statbuffchange,                          //0x89
    Cmd_normalisebuffs,                          //0x8A
    Cmd_setbide,                                 //0x8B
    Cmd_twoturnmoveschargestringandanimation,    //0x8C
    Cmd_trynonvolatilestatus,                    //0x8D
    Cmd_initmultihitstring,                      //0x8E
    Cmd_forcerandomswitch,                       //0x8F
    Cmd_tryconversiontypechange,                 //0x90
    Cmd_givepaydaymoney,                         //0x91
    Cmd_setlightscreen,                          //0x92
    Cmd_tryKO,                                   //0x93
    Cmd_unused_0x94,                             //0x94
    Cmd_copybidedmg,                             //0x95
    Cmd_unused_96,                               //0x96
    Cmd_tryinfatuating,                          //0x97
    Cmd_updatestatusicon,                        //0x98
    Cmd_setmist,                                 //0x99
    Cmd_setfocusenergy,                          //0x9A
    Cmd_transformdataexecution,                  //0x9B
    Cmd_setsubstitute,                           //0x9C
    Cmd_mimicattackcopy,                         //0x9D
    Cmd_metronome,                               //0x9E
    Cmd_unused_0x9f,                             //0x9F
    Cmd_unused_0xA0,                             //0xA0
    Cmd_counterdamagecalculator,                 //0xA1
    Cmd_mirrorcoatdamagecalculator,              //0xA2
    Cmd_disablelastusedattack,                   //0xA3
    Cmd_trysetencore,                            //0xA4
    Cmd_painsplitdmgcalc,                        //0xA5
    Cmd_settypetorandomresistance,               //0xA6
    Cmd_setalwayshitflag,                        //0xA7
    Cmd_copymovepermanently,                     //0xA8
    Cmd_trychoosesleeptalkmove,                  //0xA9
    Cmd_trysetdestinybond,                       //0xAA
    Cmd_trysetdestinybondtohappen,               //0xAB
    Cmd_settailwind,                             //0xAC
    Cmd_tryspiteppreduce,                        //0xAD
    Cmd_healpartystatus,                         //0xAE
    Cmd_cursetarget,                             //0xAF
    Cmd_trysetspikes,                            //0xB0
    Cmd_setforesight,                            //0xB1
    Cmd_trysetperishsong,                        //0xB2
    Cmd_handlerollout,                           //0xB3
    Cmd_jumpifconfusedandstatmaxed,              //0xB4
    Cmd_handlefurycutter,                        //0xB5
    Cmd_setembargo,                              //0xB6
    Cmd_presentdamagecalculation,                //0xB7
    Cmd_setsafeguard,                            //0xB8
    Cmd_magnitudedamagecalculation,              //0xB9
    Cmd_jumpifnopursuitswitchdmg,                //0xBA
    Cmd_tryrestorehpberry,                       //0xBB
    Cmd_halvehp,                                 //0xBC
    Cmd_copyfoestats,                            //0xBD
    Cmd_rapidspinfree,                           //0xBE
    Cmd_setdefensecurlbit,                       //0xBF
    Cmd_recoverbasedonsunlight,                  //0xC0
    Cmd_setstickyweb,                            //0xC1
    Cmd_selectfirstvalidtarget,                  //0xC2
    Cmd_trysetfutureattack,                      //0xC3
    Cmd_trydobeatup,                             //0xC4
    Cmd_setsemiinvulnerablebit,                  //0xC5
    Cmd_tryfiretwoturnmovenowbyeffect,           //0xC6
    Cmd_setminimize,                             //0xC7
    Cmd_unused_c8,                               //0xC8
    Cmd_trymemento,                              //0xC9
    Cmd_setforcedtarget,                         //0xCA
    Cmd_setcharge,                               //0xCB
    Cmd_callenvironmentattack,                   //0xCC
    Cmd_curestatuswithmove,                      //0xCD
    Cmd_settorment,                              //0xCE
    Cmd_jumpifnodamage,                          //0xCF
    Cmd_settaunt,                                //0xD0
    Cmd_trysethelpinghand,                       //0xD1
    Cmd_tryswapitems,                            //0xD2
    Cmd_trycopyability,                          //0xD3
    Cmd_trywish,                                 //0xD4
    Cmd_settoxicspikes,                          //0xD5
    Cmd_setgastroacid,                           //0xD6
    Cmd_setyawn,                                 //0xD7
    Cmd_setdamagetohealthdifference,             //0xD8
    Cmd_setroom,                                 //0xD9
    Cmd_tryswapabilities,                        //0xDA
    Cmd_tryimprison,                             //0xDB
    Cmd_setstealthrock,                          //0xDC
    Cmd_setuserstatus3,                          //0xDD
    Cmd_assistattackselect,                      //0xDE
    Cmd_trysetmagiccoat,                         //0xDF
    Cmd_trysetsnatch,                            //0xE0
    Cmd_unused2,                                 //0xE1
    Cmd_switchoutabilities,                      //0xE2
    Cmd_jumpifhasnohp,                           //0xE3
    Cmd_jumpifnotcurrentmoveargtype,             //0xE4
    Cmd_pickup,                                  //0xE5
    Cmd_unused_0xE6,                             //0xE6
    Cmd_unused_0xE7,                             //0xE7
    Cmd_settypebasedhalvers,                     //0xE8
    Cmd_jumpifsubstituteblocks,                  //0xE9
    Cmd_tryrecycleitem,                          //0xEA
    Cmd_settypetoenvironment,                    //0xEB
    Cmd_pursuitdoubles,                          //0xEC
    Cmd_snatchsetbattlers,                       //0xED
    Cmd_removescreens,                           //0xEE
    Cmd_handleballthrow,                         //0xEF
    Cmd_givecaughtmon,                           //0xF0
    Cmd_trysetcaughtmondexflags,                 //0xF1
    Cmd_displaydexinfo,                          //0xF2
    Cmd_trygivecaughtmonnick,                    //0xF3
    Cmd_subattackerhpbydmg,                      //0xF4
    Cmd_removeattackerstatus1,                   //0xF5
    Cmd_finishaction,                            //0xF6
    Cmd_finishturn,                              //0xF7
    Cmd_trainerslideout,                         //0xF8
    Cmd_settelekinesis,                          //0xF9
    Cmd_swapstatstages,                          //0xFA
    Cmd_averagestats,                            //0xFB
    Cmd_jumpifcaptivateaffected,                 //0xFC
    Cmd_setnonvolatilestatus,                    //0xFD
    Cmd_tryworryseed,                            //0xFE
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
    [MOVE_EFFECT_FROSTBITE]      = STATUS1_FROSTBITE,
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
    [MOVE_EFFECT_SLEEP]            = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_POISON]           = BattleScript_MoveEffectPoison,
    [MOVE_EFFECT_BURN]             = BattleScript_MoveEffectBurn,
    [MOVE_EFFECT_FREEZE]           = BattleScript_MoveEffectFreeze,
    [MOVE_EFFECT_PARALYSIS]        = BattleScript_MoveEffectParalysis,
    [MOVE_EFFECT_TOXIC]            = BattleScript_MoveEffectToxic,
    [MOVE_EFFECT_CONFUSION]        = BattleScript_MoveEffectConfusion,
    [MOVE_EFFECT_UPROAR]           = BattleScript_MoveEffectUproar,
    [MOVE_EFFECT_PAYDAY]           = BattleScript_MoveEffectPayDay,
    [MOVE_EFFECT_WRAP]             = BattleScript_MoveEffectWrap,
    [MOVE_EFFECT_FROSTBITE]        = BattleScript_MoveEffectFrostbite,
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
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
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

static const u16 sFinalStrikeOnlyEffects[] =
{
    MOVE_EFFECT_BUG_BITE,
    MOVE_EFFECT_STEAL_ITEM,
    MOVE_EFFECT_REMOVE_ARG_TYPE,
    MOVE_EFFECT_REMOVE_STATUS,
    MOVE_EFFECT_RECOIL_HP_25,
    MOVE_EFFECT_PREVENT_ESCAPE,
    MOVE_EFFECT_WRAP,
};

#define _ 0

static const struct PickupItem sPickupTable[] =
{//   Item                      1+  11+  21+  31+  41+  51+  61+  71+  81+  91+   Levels
    { ITEM_POTION,          {  35,   _,   _,   _,   _,   _,   _,   _,   _,   _, } },
    { ITEM_TINY_MUSHROOM,   {  25,  10,   _,   _,   _,   _,   _,   _,   _,   _, } },
    { ITEM_REPEL,           {   8,  30,   _,   _,   _,   _,   _,   _,   _,   _, } },
    { ITEM_SUPER_POTION,    {   8,  10,  30,   _,   _,   _,   _,   _,   _,   _, } },
    { ITEM_POKE_DOLL,       {   8,  10,   9,  30,   _,   _,   _,   _,   _,   _, } },
    { ITEM_BIG_MUSHROOM,    {   3,  10,   9,   _,   _,   _,   _,   _,   _,   _, } },
    { ITEM_SUPER_REPEL,     {   3,  10,   9,   9,  30,   _,   _,   _,   _,   _, } },
    { ITEM_FULL_HEAL,       {   3,   3,   9,   8,   9,  30,   _,   _,   _,   _, } },
    { ITEM_REVIVE,          {   3,   3,   3,   8,   8,   9,  30,   _,   _,   _, } },
    { ITEM_HYPER_POTION,    {   3,   3,   3,   4,   8,   9,   8,  30,   _,   _, } },
    { ITEM_ETHER,           {   1,   1,   3,   4,   4,   _,   _,   _,   _,   _, } },
    { ITEM_MAX_REPEL,       {   _,   3,   3,   4,   4,   9,   8,   8,  30,   _, } },
    { ITEM_MOON_STONE,      {   _,   3,   3,   4,   4,   4,   4,   5,   9,  10, } },
    { ITEM_SUN_STONE,       {   _,   3,   3,   4,   4,   4,   4,   5,   9,  10, } },
    { ITEM_RARE_CANDY,      {   _,   1,   1,   1,   1,   4,   4,   5,   4,   5, } },
    { ITEM_NUGGET,          {   _,   _,   3,   4,   4,   4,   4,   5,   4,   5, } },
    { ITEM_MAX_POTION,      {   _,   _,   3,   4,   4,   4,   8,   8,   9,  30, } },
    { ITEM_MAX_ETHER,       {   _,   _,   1,   1,   4,   4,   4,   _,   _,   _, } },
    { ITEM_PP_UP,           {   _,   _,   1,   1,   1,   4,   4,   5,   4,   5, } },
    { ITEM_BIG_NUGGET,      {   _,   _,   1,   1,   1,   1,   4,   5,   4,   5, } },
    { ITEM_DESTINY_KNOT,    {   _,   _,   1,   1,   1,   1,   1,   1,   1,   1, } },
    { ITEM_LEFTOVERS,       {   _,   _,   1,   1,   1,   1,   1,   1,   1,   1, } },
    { ITEM_MENTAL_HERB,     {   _,   _,   1,   1,   1,   1,   1,   1,   1,   1, } },
    { ITEM_POWER_HERB,      {   _,   _,   1,   1,   1,   1,   1,   1,   1,   1, } },
    { ITEM_WHITE_HERB,      {   _,   _,   1,   1,   1,   1,   1,   1,   1,   1, } },
    { ITEM_BALM_MUSHROOM,   {   _,   _,   1,   4,   4,   4,   4,   5,   4,   5, } },
    { ITEM_MAX_REVIVE,      {   _,   _,   _,   4,   4,   4,   4,   7,   9,   9, } },
    { ITEM_ELIXIR,          {   _,   _,   _,   _,   1,   1,   4,   5,   4,   5, } },
    { ITEM_MAX_ELIXIR,      {   _,   _,   _,   _,   _,   _,   1,   1,   4,   5, } },
    { ITEM_BOTTLE_CAP,      {   _,   _,   _,   _,   _,   _,   _,   1,   1,   1, } },
};

#undef _

static bool32 NoTargetPresent(u8 battler, u32 move)
{
    if (!IsBattlerAlive(gBattlerTarget))
        gBattlerTarget = GetBattleMoveTarget(move, NO_TARGET_OVERRIDE);

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

bool32 ProteanTryChangeType(u32 battler, u32 ability, u32 move, u32 moveType)
{
      if ((ability == ABILITY_PROTEAN || ability == ABILITY_LIBERO)
         && !gDisableStructs[gBattlerAttacker].usedProteanLibero
         && (gBattleMons[battler].types[0] != moveType || gBattleMons[battler].types[1] != moveType
             || (gBattleMons[battler].types[2] != moveType && gBattleMons[battler].types[2] != TYPE_MYSTERY))
         && move != MOVE_STRUGGLE
         && GetActiveGimmick(battler) != GIMMICK_TERA)
    {
        SET_BATTLER_TYPE(battler, moveType);
        return TRUE;
    }
    return FALSE;
}

bool32 IsMoveNotAllowedInSkyBattles(u32 move)
{
    return (gBattleStruct->isSkyBattle && IsMoveSkyBattleBanned(gCurrentMove));
}

u32 NumAffectedSpreadMoveTargets(void)
{
    u32 targetCount = 0;

    if (!IsDoubleSpreadMove())
        return targetCount;

    for (u32 battler = 0; battler < gBattlersCount; battler++)
    {
        if (!(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT))
            targetCount++;
    }

    return targetCount;
}

u32 NumFaintedBattlersByAttacker(u32 battlerAtk)
{
    u32 numMonsFainted = 0;

    for (u32 battler = 0; battler < gBattlersCount; battler++)
    {
        if (battler == battlerAtk)
            continue;

        if (IsBattlerTurnDamaged(battler) && !IsBattlerAlive(battler))
            numMonsFainted++;
    }

    return numMonsFainted;
}

bool32 IsMovePowderBlocked(u32 battlerAtk, u32 battlerDef, u32 move)
{
    bool32 effect = FALSE;

    if (IsPowderMove(move) && (battlerAtk != battlerDef))
    {
        if (B_POWDER_GRASS >= GEN_6
         && (IS_BATTLER_OF_TYPE(battlerDef, TYPE_GRASS) || GetBattlerAbility(battlerDef) == ABILITY_OVERCOAT))
        {
            gBattlerAbility = battlerDef;
            RecordAbilityBattle(gBattlerTarget, ABILITY_OVERCOAT);
            effect = TRUE;
        }
        else if (GetBattlerHoldEffect(battlerDef, TRUE) == HOLD_EFFECT_SAFETY_GOGGLES)
        {
            RecordItemEffectBattle(battlerDef, HOLD_EFFECT_SAFETY_GOGGLES);
            gLastUsedItem = gBattleMons[battlerDef].item;
            effect = TRUE;
        }

        if (effect)
            gBattlescriptCurrInstr = BattleScript_PowderMoveNoEffect;
    }

    return effect;
}

bool32 EmergencyExitCanBeTriggered(u32 battler)
{
    u32 ability = GetBattlerAbility(battler);

    if (ability != ABILITY_EMERGENCY_EXIT && ability != ABILITY_WIMP_OUT)
        return FALSE;

    if (IsBattlerTurnDamaged(battler)
     && IsBattlerAlive(battler)
     && HadMoreThanHalfHpNowDoesnt(battler)
     && (CanBattlerSwitch(battler) || !(gBattleTypeFlags & BATTLE_TYPE_TRAINER))
     && !(gBattleTypeFlags & BATTLE_TYPE_ARENA)
     && CountUsablePartyMons(battler) > 0
     && !(gStatuses3[battler] & STATUS3_SKY_DROPPED))
        return TRUE;

    return FALSE;
}

static void Cmd_attackcanceler(void)
{
    CMD_ARGS();

    if (gBattleStruct->battlerState[gBattlerAttacker].usedEjectItem)
    {
        gBattleStruct->battlerState[gBattlerAttacker].usedEjectItem = FALSE;
        gCurrentActionFuncId = B_ACTION_TRY_FINISH;
        return;
    }

    if (gBattleOutcome != 0)
    {
        gCurrentActionFuncId = B_ACTION_FINISHED;
        return;
    }

    enum BattleMoveEffects effect = GetMoveEffect(gCurrentMove);

    if (!IsBattlerAlive(gBattlerAttacker) && effect != EFFECT_EXPLOSION && !(gHitMarker & HITMARKER_NO_ATTACKSTRING))
    {
        gHitMarker |= HITMARKER_UNABLE_TO_USE_MOVE;
        gBattlescriptCurrInstr = BattleScript_MoveEnd;
        return;
    }
    if (AtkCanceller_MoveSuccessOrder())
        return;

    if (gSpecialStatuses[gBattlerAttacker].parentalBondState == PARENTAL_BOND_OFF
     && GetBattlerAbility(gBattlerAttacker) == ABILITY_PARENTAL_BOND
     && IsMoveAffectedByParentalBond(gCurrentMove, gBattlerAttacker)
     && !(gAbsentBattlerFlags & (1u << gBattlerTarget))
     && GetActiveGimmick(gBattlerAttacker) != GIMMICK_Z_MOVE)
    {
        gSpecialStatuses[gBattlerAttacker].parentalBondState = PARENTAL_BOND_1ST_HIT;
        gMultiHitCounter = 2;
        PREPARE_BYTE_NUMBER_BUFFER(gBattleScripting.multihitString, 1, 0)
        return;
    }


    u32 abilityDef = GetBattlerAbility(gBattlerTarget);
    if (CanAbilityBlockMove(gBattlerAttacker,
                            gBattlerTarget,
                            GetBattlerAbility(gBattlerAttacker),
                            abilityDef,
                            gCurrentMove,
                            ABILITY_RUN_SCRIPT))
        return;

    if (GetMoveNonVolatileStatus(gCurrentMove) == MOVE_EFFECT_PARALYSIS)
    {
        if (CanAbilityAbsorbMove(gBattlerAttacker,
                                 gBattlerTarget,
                                 abilityDef,
                                 gCurrentMove,
                                 GetBattleMoveType(gCurrentMove),
                                 ABILITY_RUN_SCRIPT))
            return;
    }

    if (IsMovePowderBlocked(gBattlerAttacker, gBattlerTarget, gCurrentMove))
        return;

    if (!gBattleMons[gBattlerAttacker].pp[gCurrMovePos] && gCurrentMove != MOVE_STRUGGLE
     && !(gHitMarker & (HITMARKER_ALLOW_NO_PP | HITMARKER_NO_ATTACKSTRING | HITMARKER_NO_PPDEDUCT))
     && !(gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS))
    {
        gBattlescriptCurrInstr = BattleScript_NoPPForMove;
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
        return;
    }

    gHitMarker &= ~HITMARKER_ALLOW_NO_PP;

    // Check if no available target present on the field or if Sky Battles ban the move
    if ((NoTargetPresent(gBattlerAttacker, gCurrentMove)
        && (!gBattleMoveEffects[effect].twoTurnEffect || (gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS)))
        || (IsMoveNotAllowedInSkyBattles(gCurrentMove)))
    {
        gBattleStruct->noTargetPresent = TRUE;

        if (effect == EFFECT_FLING) // Edge case for removing a mon's item when there is no target available after using Fling.
            gBattlescriptCurrInstr = BattleScript_FlingFailConsumeItem;
        else
            gBattlescriptCurrInstr = BattleScript_FailedFromAtkString;

        if (!gBattleMoveEffects[effect].twoTurnEffect || (gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS))
            CancelMultiTurnMoves(gBattlerAttacker, SKY_DROP_ATTACKCANCELLER_CHECK);
        return;
    }

    u32 isBounceable = MoveCanBeBouncedBack(gCurrentMove);
    if (gProtectStructs[gBattlerTarget].bounceMove
        && isBounceable
        && !gBattleStruct->bouncedMoveIsUsed)
    {
        gBattleStruct->bouncedMoveIsUsed = TRUE;
        // Edge case for bouncing a powder move against a grass type pokemon.

        ClearDamageCalcResults();
        SetAtkCancellerForCalledMove();
        gEffectBattler = gBattlerTarget;
        if (BlocksPrankster(gCurrentMove, gBattlerTarget, gBattlerAttacker, TRUE))
        {
            // Opponent used a prankster'd magic coat -> reflected status move should fail against a dark-type attacker
            gBattlerTarget = gBattlerAttacker;
            gBattlescriptCurrInstr = BattleScript_MagicCoatPrankster;
        }
        else
        {
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_MagicCoat;
        }
        return;
    }
    else if (isBounceable && !gBattleStruct->bouncedMoveIsUsed)
    {
        u32 battler = gBattlerTarget;

        if (abilityDef == ABILITY_MAGIC_BOUNCE)
        {
            battler = gBattlerTarget;
            gBattleStruct->bouncedMoveIsUsed = TRUE;
        }
        else if (IsDoubleBattle()
              && GetBattlerMoveTargetType(battler, gCurrentMove) == MOVE_TARGET_OPPONENTS_FIELD
              && GetBattlerAbility(BATTLE_PARTNER(gBattlerTarget)) == ABILITY_MAGIC_BOUNCE)
        {
            gBattlerTarget = battler = BATTLE_PARTNER(gBattlerTarget);
            gBattleStruct->bouncedMoveIsUsed = TRUE;
        }

        if (gBattleStruct->bouncedMoveIsUsed)
        {
            ClearDamageCalcResults();
            SetAtkCancellerForCalledMove(); // Edge case for bouncing a powder move against a grass type pokemon.
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_MagicBounce;
            gBattlerAbility = battler;
            return;
        }
    }

    // Z-moves and Max Moves bypass protection, but deal reduced damage (factored in AccumulateOtherModifiers)
    if ((IsZMove(gCurrentMove) || IsMaxMove(gCurrentMove))
     && gProtectStructs[gBattlerTarget].protected != PROTECT_NONE
     && gProtectStructs[gBattlerTarget].protected != PROTECT_MAX_GUARD)
    {
        BattleScriptPush(cmd->nextInstr);
        gBattlescriptCurrInstr = BattleScript_CouldntFullyProtect;
        return;
    }

    for (u32 i = 0; i < gBattlersCount; i++)
    {
        if ((gProtectStructs[gBattlerByTurnOrder[i]].stealMove) && MoveCanBeSnatched(gCurrentMove))
        {
            gProtectStructs[gBattlerByTurnOrder[i]].stealMove = FALSE;
            gBattleStruct->snatchedMoveIsUsed = TRUE;
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
    else if (IsBattlerProtected(gBattlerAttacker, gBattlerTarget, gCurrentMove)
     && (effect != EFFECT_CURSE || IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_GHOST))
     && (!gBattleMoveEffects[effect].twoTurnEffect || (gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS))
     && effect != EFFECT_SUCKER_PUNCH
     && effect != EFFECT_COUNTER
     && effect != EFFECT_UPPER_HAND)
    {
        if (IsMoveMakingContact(gCurrentMove, gBattlerAttacker))
            gProtectStructs[gBattlerAttacker].touchedProtectLike = TRUE;
        CancelMultiTurnMoves(gBattlerAttacker, SKY_DROP_ATTACKCANCELLER_CHECK);
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
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

static void JumpIfMoveFailed(u32 adder, u32 move, u32 moveType, const u8 *failInstr)
{
    if (gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
    {
        gLastLandedMoves[gBattlerTarget] = 0;
        gLastHitByType[gBattlerTarget] = 0;
        gBattlescriptCurrInstr = failInstr;
        return;
    }
    else
    {
        TrySetDestinyBondToHappen();

        if (CanAbilityAbsorbMove(gBattlerAttacker,
                                 gBattlerTarget,
                                 GetBattlerAbility(gBattlerTarget),
                                 move,
                                 moveType,
                                 ABILITY_RUN_SCRIPT))
            return;
    }

    gBattlescriptCurrInstr += adder;
}

static void Cmd_unused5(void)
{
}

static bool32 JumpIfMoveAffectedByProtect(u32 move, u32 battler, u32 shouldJump, const u8 *failInstr)
{
    bool32 affected = IsBattlerProtected(gBattlerAttacker, battler, move);
    if (affected)
    {
        gBattleStruct->moveResultFlags[battler] |= MOVE_RESULT_MISSED;
        if (shouldJump)
            JumpIfMoveFailed(7, move, GetBattleMoveType(move), failInstr);
    }
    return affected;
}

static bool32 AccuracyCalcHelper(u32 move, u32 battler)
{
    bool32 effect = FALSE;
    u32 ability = ABILITY_NONE;
    enum BattleMoveEffects moveEffect = GetMoveEffect(move);
    u32 nonVolatileStatus = GetMoveNonVolatileStatus(move);

    if ((gStatuses3[battler] & STATUS3_ALWAYS_HITS && gDisableStructs[battler].battlerWithSureHit == gBattlerAttacker)
     || (B_TOXIC_NEVER_MISS >= GEN_6
        && nonVolatileStatus == MOVE_EFFECT_TOXIC
        && IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_POISON))
     || gStatuses4[battler] & STATUS4_GLAIVE_RUSH)
    {
        effect = TRUE;
    }
    // If the attacker has the ability No Guard and they aren't targeting a Pokemon involved in a Sky Drop with the move Sky Drop, move hits.
    else if (GetBattlerAbility(gBattlerAttacker) == ABILITY_NO_GUARD
          && !(gStatuses3[battler] & STATUS3_COMMANDER)
          && (moveEffect != EFFECT_SKY_DROP || gBattleStruct->skyDropTargets[battler] == SKY_DROP_NO_TARGET))
    {
        effect = TRUE;
        ability = ABILITY_NO_GUARD;
    }
    // If the target has the ability No Guard and they aren't involved in a Sky Drop or the current move isn't Sky Drop, move hits.
    else if (GetBattlerAbility(battler) == ABILITY_NO_GUARD
          && (moveEffect != EFFECT_SKY_DROP || gBattleStruct->skyDropTargets[battler] == SKY_DROP_NO_TARGET))
    {
        effect = TRUE;
        ability = ABILITY_NO_GUARD;
    }
    // If the target is under the effects of Telekinesis, and the move isn't a OH-KO move, move hits.
    else if (gStatuses3[battler] & STATUS3_TELEKINESIS
          && !(gStatuses3[battler] & STATUS3_SEMI_INVULNERABLE)
          && moveEffect != EFFECT_OHKO)
    {
        effect = TRUE;
    }
    else if (gBattleStruct->battlerState[battler].pursuitTarget)
    {
        effect = TRUE;
    }
    else if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_Z_MOVE && !(gStatuses3[battler] & STATUS3_SEMI_INVULNERABLE))
    {
        effect = TRUE;
    }
    else if ((gStatuses3[battler] & STATUS3_COMMANDER)
          || (gStatuses3[battler] & STATUS3_PHANTOM_FORCE)
          || ((gStatuses3[battler] & STATUS3_ON_AIR) && !(MoveDamagesAirborne(move) || MoveDamagesAirborneDoubleDamage(move)))
          || ((gStatuses3[battler] & STATUS3_UNDERGROUND) && !MoveDamagesUnderground(move))
          || ((gStatuses3[battler] & STATUS3_UNDERWATER) && !MoveDamagesUnderWater(move)))
    {
        gBattleStruct->moveResultFlags[battler] |= MOVE_RESULT_MISSED;
        effect = TRUE;
    }
    else if (B_MINIMIZE_DMG_ACC >= GEN_6
     && (gStatuses3[battler] & STATUS3_MINIMIZED)
     && MoveIncreasesPowerToMinimizedTargets(move))
    {
        effect = TRUE;
    }
    else if (GetMoveAccuracy(move) == 0)
    {
        effect = TRUE;
    }

    if (!effect && HasWeatherEffect())
    {
        if (MoveAlwaysHitsInRain(move) && IsBattlerWeatherAffected(battler, B_WEATHER_RAIN))
            effect = TRUE;
        else if ((gBattleWeather & (B_WEATHER_HAIL | B_WEATHER_SNOW)) && MoveAlwaysHitsInHailSnow(move))
            effect = TRUE;

        if (effect)
            return effect;
    }

    if (ability != ABILITY_NONE)
        RecordAbilityBattle(gBattlerAttacker, ABILITY_NO_GUARD);

    return effect;
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
    if (MoveIgnoresDefenseEvasionStages(move))
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

    moveAcc = GetMoveAccuracy(move);
    // Check Thunder and Hurricane on sunny weather.
    if (IsBattlerWeatherAffected(battlerDef, B_WEATHER_SUN) && MoveHas50AccuracyInSun(move))
        moveAcc = 50;
    // Check Wonder Skin.
    if (defAbility == ABILITY_WONDER_SKIN && IsBattleMoveStatus(move) && moveAcc > 50)
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
        if (IsBattleMovePhysical(move))
            calc = (calc * 80) / 100; // 1.2 hustle loss
        break;
    }

    // Target's ability
    switch (defAbility)
    {
    case ABILITY_SAND_VEIL:
        if (HasWeatherEffect() && gBattleWeather & B_WEATHER_SANDSTORM)
            calc = (calc * 80) / 100; // 1.2 sand veil loss
        break;
    case ABILITY_SNOW_CLOAK:
        if (HasWeatherEffect() && (gBattleWeather & (B_WEATHER_HAIL | B_WEATHER_SNOW)))
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

    if (gBattleStruct->battlerState[battlerAtk].usedMicleBerry)
    {
        if (atkAbility == ABILITY_RIPEN)
            calc = (calc * 140) / 100;  // ripen gives 40% acc boost
        else
            calc = (calc * 120) / 100;  // 20% acc boost
    }

    if (gFieldStatuses & STATUS_FIELD_GRAVITY)
        calc = (calc * 5) / 3; // 1.66 Gravity acc boost

    if (B_AFFECTION_MECHANICS == TRUE && GetBattlerAffectionHearts(battlerDef) == AFFECTION_FIVE_HEARTS)
        calc = (calc * 90) / 100;

    if (HasWeatherEffect() && gBattleWeather & B_WEATHER_FOG)
        calc = (calc * 60) / 100; // modified by 3/5

    return calc;
}

static void AccuracyCheck(bool32 recalcDragonDarts, const u8 *nextInstr, const u8 *failInstr, u16 move)
{
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
        JumpIfMoveFailed(7, move, GetBattleMoveType(move), failInstr);
        return;
    }

    if (move == ACC_CURR_MOVE)
        move = gCurrentMove;

    enum BattleMoveEffects effect = GetMoveEffect(move);
    u32 abilityAtk = GetBattlerAbility(gBattlerAttacker);
    enum ItemHoldEffect holdEffectAtk = GetBattlerHoldEffect(gBattlerAttacker, TRUE);

    if (move == NO_ACC_CALC_CHECK_LOCK_ON)
    {
        if (gStatuses3[gBattlerTarget] & STATUS3_ALWAYS_HITS && gDisableStructs[gBattlerTarget].battlerWithSureHit == gBattlerAttacker)
            gBattlescriptCurrInstr = nextInstr;
        else if (gStatuses3[gBattlerTarget] & (STATUS3_SEMI_INVULNERABLE))
            gBattlescriptCurrInstr = failInstr;
        else if (!JumpIfMoveAffectedByProtect(gCurrentMove, gBattlerTarget, TRUE, failInstr))
            gBattlescriptCurrInstr = nextInstr;
        if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_DYNAMAX)
        {
            if (gProtectStructs[gBattlerTarget].protected == PROTECT_MAX_GUARD)
                gBattlescriptCurrInstr = nextInstr;
            else
                CanAbilityAbsorbMove(gBattlerAttacker,
                                     gBattlerTarget,
                                     GetBattlerAbility(gBattlerTarget),
                                     gCurrentMove,
                                     GetBattleMoveType(gCurrentMove),
                                     ABILITY_RUN_SCRIPT);
        }
    }
    else if (gSpecialStatuses[gBattlerAttacker].parentalBondState == PARENTAL_BOND_2ND_HIT
        || (gSpecialStatuses[gBattlerAttacker].multiHitOn
        && (abilityAtk == ABILITY_SKILL_LINK || holdEffectAtk == HOLD_EFFECT_LOADED_DICE
        || !(effect == EFFECT_TRIPLE_KICK || effect == EFFECT_POPULATION_BOMB))))
    {
        // No acc checks for second hit of Parental Bond or multi hit moves, except Triple Kick/Triple Axel/Population Bomb
        gBattlescriptCurrInstr = nextInstr;
    }
    else
    {
        u32 numTargets = 0;
        u32 numMisses = 0;
        u32 moveType = GetBattleMoveType(move);
        u32 moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, move);
        bool32 calcSpreadMove = IsSpreadMove(moveTarget) && !IsBattleMoveStatus(move);

        for (u32 battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
        {
            if (gBattleStruct->calculatedSpreadMoveAccuracy)
                break;

            if ((!calcSpreadMove && battlerDef != gBattlerTarget)
             || IsBattlerInvalidForSpreadMove(gBattlerAttacker, battlerDef, moveTarget)
             || (gBattleStruct->noResultString[battlerDef] && gBattleStruct->noResultString[battlerDef] != DO_ACCURACY_CHECK))
                continue;

            numTargets++;
            if (JumpIfMoveAffectedByProtect(move, battlerDef, FALSE, failInstr) || AccuracyCalcHelper(move, battlerDef))
                continue;

            u32 accuracy = GetTotalAccuracy(gBattlerAttacker,
                                            battlerDef,
                                            move,
                                            abilityAtk,
                                            GetBattlerAbility(battlerDef),
                                            holdEffectAtk,
                                            GetBattlerHoldEffect(battlerDef, TRUE));

            if (!RandomPercentage(RNG_ACCURACY, accuracy))
            {
                gBattleStruct->moveResultFlags[battlerDef] = MOVE_RESULT_MISSED;
                gBattleStruct->missStringId[battlerDef] = gBattleCommunication[MISS_TYPE] = B_MSG_MISSED;
                numMisses++;

                if (holdEffectAtk == HOLD_EFFECT_BLUNDER_POLICY)
                    gBattleStruct->blunderPolicy = TRUE;    // Only activates from missing through acc/evasion checks

                if (effect == EFFECT_DRAGON_DARTS
                    && !IsAffectedByFollowMe(gBattlerAttacker, GetBattlerSide(battlerDef), gCurrentMove)
                    && !recalcDragonDarts // So we don't jump back and forth between targets
                    && CanTargetPartner(gBattlerAttacker, battlerDef)
                    && !TargetFullyImmuneToCurrMove(gBattlerAttacker, BATTLE_PARTNER(battlerDef)))
                {
                    // Smart target to partner if miss
                    numMisses = 0; // Other dart might hit
                    gBattlerTarget = BATTLE_PARTNER(battlerDef);
                    AccuracyCheck(TRUE, nextInstr, failInstr, move);
                    return;
                }

                if (GetMovePower(move) != 0)
                    CalcTypeEffectivenessMultiplier(move, moveType, gBattlerAttacker, battlerDef, GetBattlerAbility(battlerDef), TRUE);
            }
        }

        if (numTargets == numMisses)
            gBattleStruct->battlerState[gBattlerAttacker].stompingTantrumTimer = 2;

        if (gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_MISSED)
            gBattleStruct->moveResultFlags[gBattlerTarget] = MOVE_RESULT_MISSED;

        if (calcSpreadMove)
            gBattleStruct->calculatedSpreadMoveAccuracy = TRUE;

        JumpIfMoveFailed(7, move, moveType, failInstr);
    }
}

static void Cmd_accuracycheck(void)
{
    CMD_ARGS(const u8 *failInstr, u16 move);

    // The main body of this function has been moved to AccuracyCheck() to accomodate
    // Dragon Darts' multiple accuracy checks on a single attack;
    // each dart can try to re-target once after missing.
    AccuracyCheck(FALSE, cmd->nextInstr, cmd->failInstr, cmd->move);
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
        || MoveForcesPressure(gCurrentMove))
    {
        for (i = 0; i < gBattlersCount; i++)
        {
            if (!IsBattlerAlly(i, gBattlerAttacker) && IsBattlerAlive(i))
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
            BtlController_EmitSetMonData(gBattlerAttacker, B_COMM_TO_CONTROLLER, REQUEST_PPMOVE1_BATTLE + gCurrMovePos, 0,
                                         sizeof(gBattleMons[gBattlerAttacker].pp[gCurrMovePos]),
                                         &gBattleMons[gBattlerAttacker].pp[gCurrMovePos]);
            MarkBattlerForControllerExec(gBattlerAttacker);
        }
    }

    gHitMarker &= ~HITMARKER_NO_PPDEDUCT;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

// The chance is 1/N for each stage.
static const u32 sGen7CriticalHitOdds[] = {24,  8,  2,  1,   1}; // 1/X
static const u32 sGen6CriticalHitOdds[] = {16,  8,  2,  1,   1}; // 1/X
static const u32 sCriticalHitOdds[]     = {16,  8,  4,  3,   2}; // 1/X, Gens 3,4,5
static const u32 sGen2CriticalHitOdds[] = {17, 32, 64, 85, 128}; // X/256

static inline u32 GetCriticalHitOdds(u32 critChance)
{
    if (GetGenConfig(GEN_CONFIG_CRIT_CHANCE) >= GEN_7)
        return sGen7CriticalHitOdds[critChance];
    if (GetGenConfig(GEN_CONFIG_CRIT_CHANCE) == GEN_6)
        return sGen6CriticalHitOdds[critChance];
    if (GetGenConfig(GEN_CONFIG_CRIT_CHANCE) == GEN_2)
        return sGen2CriticalHitOdds[critChance];

    return sCriticalHitOdds[critChance];
}

static inline u32 IsBattlerLeekAffected(u32 battler, enum ItemHoldEffect holdEffect)
{
    if (holdEffect == HOLD_EFFECT_LEEK)
    {
        return GET_BASE_SPECIES_ID(gBattleMons[battler].species) == SPECIES_FARFETCHD
            || gBattleMons[battler].species == SPECIES_SIRFETCHD;
    }
    return FALSE;
}

static inline u32 GetHoldEffectCritChanceIncrease(u32 battler, enum ItemHoldEffect holdEffect)
{
    u32 critStageIncrease = 0;

    switch (holdEffect)
    {
    case HOLD_EFFECT_SCOPE_LENS:
        critStageIncrease = 1;
        break;
    case HOLD_EFFECT_LUCKY_PUNCH:
        if (gBattleMons[battler].species == SPECIES_CHANSEY)
            critStageIncrease = 2;
        break;
    case HOLD_EFFECT_LEEK:
        if (IsBattlerLeekAffected(battler, holdEffect))
            critStageIncrease = 2;
        break;
    default:
        critStageIncrease = 0;
        break;
    }

    return critStageIncrease;
}

s32 CalcCritChanceStage(u32 battlerAtk, u32 battlerDef, u32 move, bool32 recordAbility, u32 abilityAtk, u32 abilityDef, enum ItemHoldEffect holdEffectAtk)
{
    s32 critChance = 0;

    if (gSideStatuses[battlerDef] & SIDE_STATUS_LUCKY_CHANT)
    {
        critChance = CRITICAL_HIT_BLOCKED;
    }
    else if (gStatuses3[battlerAtk] & STATUS3_LASER_FOCUS
          || MoveAlwaysCrits(move)
          || (abilityAtk == ABILITY_MERCILESS && gBattleMons[battlerDef].status1 & STATUS1_PSN_ANY))
    {
        critChance = CRITICAL_HIT_ALWAYS;
    }
    else
    {
        critChance  = 2 * ((gBattleMons[battlerAtk].status2 & STATUS2_FOCUS_ENERGY) != 0)
                    + 1 * ((gBattleMons[battlerAtk].status2 & STATUS2_DRAGON_CHEER) != 0)
                    + GetMoveCriticalHitStage(move)
                    + GetHoldEffectCritChanceIncrease(battlerAtk, holdEffectAtk)
                    + 2 * (B_AFFECTION_MECHANICS == TRUE && GetBattlerAffectionHearts(battlerAtk) == AFFECTION_FIVE_HEARTS)
                    + (abilityAtk == ABILITY_SUPER_LUCK)
                    + gBattleStruct->bonusCritStages[gBattlerAttacker];

        if (critChance >= ARRAY_COUNT(sCriticalHitOdds))
            critChance = ARRAY_COUNT(sCriticalHitOdds) - 1;
    }

    if (critChance != CRITICAL_HIT_BLOCKED && (abilityDef == ABILITY_BATTLE_ARMOR || abilityDef == ABILITY_SHELL_ARMOR))
    {
        // Record ability only if move had 100% chance to get a crit
        if (recordAbility)
        {
            if (critChance == CRITICAL_HIT_ALWAYS)
                RecordAbilityBattle(battlerDef, abilityDef);
            else if (GetCriticalHitOdds(critChance) == 1)
                RecordAbilityBattle(battlerDef, abilityDef);
        }
        critChance = CRITICAL_HIT_BLOCKED;
    }

    return critChance;
}

// Bulbapedia: https://bulbapedia.bulbagarden.net/wiki/Critical_hit#Generation_I
// Crit chance = Threshold / 256, Threshold maximum of 255
// Threshold = Base Speed / 2
// High crit move = 8 * (Base Speed / 2)
// Focus Energy = 4 * (Base Speed / 2)
s32 CalcCritChanceStageGen1(u32 battlerAtk, u32 battlerDef, u32 move, bool32 recordAbility, u32 abilityAtk, u32 abilityDef, enum ItemHoldEffect holdEffectAtk)
{
    s32 critChance = 0;
    s32 moveCritStage = GetMoveCriticalHitStage(gCurrentMove);
    s32 bonusCritStage = gBattleStruct->bonusCritStages[battlerAtk]; // G-Max Chi Strike
    u32 holdEffectCritStage = GetHoldEffectCritChanceIncrease(battlerAtk, holdEffectAtk);
    u16 baseSpeed = gSpeciesInfo[gBattleMons[battlerAtk].species].baseSpeed;

    critChance = baseSpeed / 2;

    // Crit scaling
    if (moveCritStage > 0)
        critChance *= 8 * moveCritStage;

    if (bonusCritStage > 0)
        critChance *= bonusCritStage;

    if (gBattleMons[battlerAtk].status2 & STATUS2_FOCUS_ENERGY)
        critChance *= 4;
    else if (gBattleMons[battlerAtk].status2 & STATUS2_DRAGON_CHEER)
        critChance *= 2;

    if (holdEffectCritStage > 0)
        critChance *= 4 * holdEffectCritStage;

    if (abilityAtk == ABILITY_SUPER_LUCK)
        critChance *= 4;

    if (critChance > 255)
        critChance = 255;

    // Prevented crits
    if (gSideStatuses[battlerDef] & SIDE_STATUS_LUCKY_CHANT)
        critChance = CRITICAL_HIT_BLOCKED;
    else if (abilityDef == ABILITY_BATTLE_ARMOR || abilityDef == ABILITY_SHELL_ARMOR)
    {
        if (recordAbility)
            RecordAbilityBattle(battlerDef, abilityDef);
        critChance = CRITICAL_HIT_BLOCKED;
    }

    // Guaranteed crits
    else if (gStatuses3[battlerAtk] & STATUS3_LASER_FOCUS
             || MoveAlwaysCrits(move)
             || (abilityAtk == ABILITY_MERCILESS && gBattleMons[battlerDef].status1 & STATUS1_PSN_ANY))
    {
        critChance = CRITICAL_HIT_ALWAYS;
    }

    return critChance;
}

s32 GetCritHitOdds(s32 critChanceIndex)
{
    if (critChanceIndex < 0)
        return -1;
    else
        return GetCriticalHitOdds(critChanceIndex);
}

static void Cmd_critcalc(void)
{
    CMD_ARGS();

    u32 partySlot = gBattlerPartyIndexes[gBattlerAttacker];
    u32 moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);
    bool32 calcSpreadMoveDamage = IsSpreadMove(moveTarget) && !IsBattleMoveStatus(gCurrentMove);
    u32 abilityAtk = GetBattlerAbility(gBattlerAttacker);
    enum ItemHoldEffect holdEffectAtk = GetBattlerHoldEffect(gBattlerAttacker, TRUE);
    gPotentialItemEffectBattler = gBattlerAttacker;

    for (u32 battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
    {
        if (gBattleStruct->calculatedDamageDone)
            break;

        if (!calcSpreadMoveDamage && battlerDef != gBattlerTarget)
            continue;

        if (IsBattlerInvalidForSpreadMove(gBattlerAttacker, battlerDef, moveTarget)
         || gBattleStruct->noResultString[battlerDef]
         || gBattleStruct->moveResultFlags[battlerDef] & MOVE_RESULT_NO_EFFECT)
            continue;

        u32 abilityDef = GetBattlerAbility(battlerDef);

        if (GetGenConfig(GEN_CONFIG_CRIT_CHANCE) == GEN_1)
            gBattleStruct->critChance[battlerDef] = CalcCritChanceStageGen1(gBattlerAttacker, battlerDef, gCurrentMove, TRUE, abilityAtk, abilityDef, holdEffectAtk);
        else
            gBattleStruct->critChance[battlerDef] = CalcCritChanceStage(gBattlerAttacker, battlerDef, gCurrentMove, TRUE, abilityAtk, abilityDef, holdEffectAtk);

        if ((gBattleTypeFlags & (BATTLE_TYPE_OLD_MAN_TUTORIAL | BATTLE_TYPE_POKEDUDE))
            || ((gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE) && !BtlCtrl_OakOldMan_TestState2Flag(1)))
            gSpecialStatuses[battlerDef].criticalHit = FALSE;
        else if (gBattleStruct->critChance[battlerDef] == -1)
            gSpecialStatuses[battlerDef].criticalHit = FALSE;
        else if (gBattleStruct->critChance[battlerDef] == -2)
            gSpecialStatuses[battlerDef].criticalHit = TRUE;
        else
        {
            if (GetGenConfig(GEN_CONFIG_CRIT_CHANCE) == GEN_1)
                gSpecialStatuses[battlerDef].criticalHit = RandomChance(RNG_CRITICAL_HIT, gBattleStruct->critChance[battlerDef], 256);
            else if (GetGenConfig(GEN_CONFIG_CRIT_CHANCE) == GEN_2)
                gSpecialStatuses[battlerDef].criticalHit = RandomChance(RNG_CRITICAL_HIT, GetCriticalHitOdds(gBattleStruct->critChance[battlerDef]), 256);
            else
                gSpecialStatuses[battlerDef].criticalHit = RandomChance(RNG_CRITICAL_HIT, 1, GetCriticalHitOdds(gBattleStruct->critChance[battlerDef]));
        }

        // Counter for IF_CRITICAL_HITS_GE evolution condition.
        if (gSpecialStatuses[battlerDef].criticalHit && IsOnPlayerSide(gBattlerAttacker)
         && !(gBattleTypeFlags & BATTLE_TYPE_MULTI && GetBattlerPosition(gBattlerAttacker) == B_POSITION_PLAYER_LEFT))
            gPartyCriticalHits[partySlot]++;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static inline void CalculateAndSetMoveDamage(struct DamageCalculationData *damageCalcData, u32 battlerDef)
{
    SetDynamicMoveCategory(gBattlerAttacker, battlerDef, gCurrentMove);
    damageCalcData->battlerDef = battlerDef;
    damageCalcData->isCrit = gSpecialStatuses[battlerDef].criticalHit;
    gBattleStruct->moveDamage[battlerDef] = CalculateMoveDamage(damageCalcData, 0);

    // Slighly hacky but we need to check move result flags for distortion match-up as well but it can only be done after damage calcs
    if (gSpecialStatuses[battlerDef].distortedTypeMatchups && gBattleStruct->moveResultFlags[battlerDef] & MOVE_RESULT_NO_EFFECT)
    {
        gSpecialStatuses[battlerDef].distortedTypeMatchups = FALSE;
        gSpecialStatuses[battlerDef].teraShellAbilityDone = FALSE;
    }
}

static void Cmd_damagecalc(void)
{
    CMD_ARGS();

    if (gBattleStruct->calculatedDamageDone)
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }

    u32 moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);

    struct DamageCalculationData damageCalcData;
    damageCalcData.battlerAtk = gBattlerAttacker;
    damageCalcData.move = gCurrentMove;
    damageCalcData.moveType = GetBattleMoveType(gCurrentMove);
    damageCalcData.randomFactor = TRUE;
    damageCalcData.updateFlags = TRUE;

    if (IsSpreadMove(moveTarget))
    {
        u32 battlerDef;
        for (battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
        {
            if (IsBattlerInvalidForSpreadMove(gBattlerAttacker, battlerDef, moveTarget)
             || gBattleStruct->noResultString[battlerDef]
             || gBattleStruct->moveResultFlags[battlerDef] & MOVE_RESULT_NO_EFFECT)
                continue;

            CalculateAndSetMoveDamage(&damageCalcData, battlerDef);
        }
    }
    else
    {
        CalculateAndSetMoveDamage(&damageCalcData, gBattlerTarget);
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_typecalc(void)
{
    CMD_ARGS();

    if (!IsSpreadMove(GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove))) // Handled in CANCELLER_MULTI_TARGET_MOVES for Spread Moves
    {
        u32 moveType = GetBattleMoveType(gCurrentMove);
        CalcTypeEffectivenessMultiplier(gCurrentMove, moveType, gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerTarget), TRUE);
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_adjustdamage(void)
{
    CMD_ARGS();

    enum ItemHoldEffect holdEffect;
    u8 param;
    u32 battlerDef;
    u32 rand = Random() % 100;
    u32 affectionScore = GetBattlerAffectionHearts(gBattlerTarget);
    u32 moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);
    enum BattleMoveEffects moveEffect = GetMoveEffect(gCurrentMove);
    bool32 calcSpreadMoveDamage = IsSpreadMove(moveTarget) && !IsBattleMoveStatus(gCurrentMove);
    bool32 enduredHit = FALSE;

    for (battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
    {
        if (gBattleStruct->calculatedDamageDone)
            break;

        if (!calcSpreadMoveDamage && battlerDef != gBattlerTarget)
            continue;

        if (IsBattlerInvalidForSpreadMove(gBattlerAttacker, battlerDef, moveTarget)
         || gBattleStruct->noResultString[battlerDef])
            continue;

        if (DoesSubstituteBlockMove(gBattlerAttacker, battlerDef, gCurrentMove))
            continue;

        if (DoesDisguiseBlockMove(battlerDef, gCurrentMove))
        {
            gSpecialStatuses[battlerDef].enduredDamage = TRUE;
            continue;
        }

        if (GetBattlerAbility(battlerDef) == ABILITY_ICE_FACE && IsBattleMovePhysical(gCurrentMove) && gBattleMons[battlerDef].species == SPECIES_EISCUE)
        {
            // Damage deals typeless 0 HP.
            gBattleStruct->moveResultFlags[battlerDef] &= ~(MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE);
            gBattleStruct->moveDamage[battlerDef] = 0;
            gSpecialStatuses[battlerDef].enduredDamage = TRUE;
            RecordAbilityBattle(gBattlerTarget, ABILITY_ICE_FACE);
            gDisableStructs[battlerDef].iceFaceActivationPrevention = TRUE;
            // Form change will be done after attack animation in Cmd_resultmessage.
            continue;
        }

        if (gBattleMons[gBattlerTarget].hp > gBattleStruct->moveDamage[battlerDef])
            continue;

        holdEffect = GetBattlerHoldEffect(battlerDef, TRUE);
        param = GetBattlerHoldEffectParam(battlerDef);

        gPotentialItemEffectBattler = battlerDef;

        if (moveEffect == EFFECT_FALSE_SWIPE)
        {
            enduredHit = TRUE;
        }
        else if (gProtectStructs[battlerDef].endured)
        {
            enduredHit = TRUE;
            gBattleStruct->moveResultFlags[battlerDef] |= MOVE_RESULT_FOE_ENDURED;
        }
        else if (holdEffect == HOLD_EFFECT_FOCUS_BAND && rand < param)
        {
            enduredHit = TRUE;
            RecordItemEffectBattle(battlerDef, holdEffect);
            gLastUsedItem = gBattleMons[battlerDef].item;
            gBattleStruct->moveResultFlags[battlerDef] |= MOVE_RESULT_FOE_HUNG_ON;
        }
        else if (B_STURDY >= GEN_5 && GetBattlerAbility(battlerDef) == ABILITY_STURDY && IsBattlerAtMaxHp(battlerDef))
        {
            enduredHit = TRUE;
            RecordAbilityBattle(battlerDef, ABILITY_STURDY);
            gLastUsedAbility = ABILITY_STURDY;
            gBattleStruct->moveResultFlags[battlerDef] |= MOVE_RESULT_STURDIED;
        }
        else if (holdEffect == HOLD_EFFECT_FOCUS_SASH && IsBattlerAtMaxHp(battlerDef))
        {
            enduredHit = TRUE;
            RecordItemEffectBattle(battlerDef, holdEffect);
            gLastUsedItem = gBattleMons[battlerDef].item;
            gBattleStruct->moveResultFlags[battlerDef] |= MOVE_RESULT_FOE_HUNG_ON;
        }
        else if (B_AFFECTION_MECHANICS == TRUE && IsOnPlayerSide(battlerDef) && affectionScore >= AFFECTION_THREE_HEARTS)
        {
            if ((affectionScore == AFFECTION_FIVE_HEARTS && rand < 20)
             || (affectionScore == AFFECTION_FOUR_HEARTS && rand < 15)
             || (affectionScore == AFFECTION_THREE_HEARTS && rand < 10))
            {
                enduredHit = TRUE;
                gBattleStruct->moveResultFlags[battlerDef] |= MOVE_RESULT_FOE_ENDURED_AFFECTION;
            }
        }

        // Handle reducing the dmg to 1 hp.
        if (enduredHit)
        {
            gBattleStruct->moveDamage[battlerDef] = gBattleMons[battlerDef].hp - 1;
            gSpecialStatuses[battlerDef].enduredDamage = TRUE;
        }
    }

    if (calcSpreadMoveDamage)
        gBattleStruct->calculatedDamageDone = TRUE;

    gBattlescriptCurrInstr = cmd->nextInstr;

    if (gSpecialStatuses[gBattlerAttacker].gemBoost
        && !(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
        && !(gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE)
        && gBattleMons[gBattlerAttacker].item)
    {
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_GemActivates;
        gLastUsedItem = gBattleMons[gBattlerAttacker].item;
    }
}

static void Cmd_multihitresultmessage(void)
{
    CMD_ARGS();

    if (gBattleControllerExecFlags)
        return;

    if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_FAILED)
     && !(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_FOE_ENDURED))
    {
        if (gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_STURDIED)
        {
            gBattleStruct->moveResultFlags[gBattlerTarget] &= ~(MOVE_RESULT_STURDIED | MOVE_RESULT_FOE_HUNG_ON);
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_SturdiedMsg;
            return;
        }
        else if (gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_FOE_HUNG_ON)
        {
            gLastUsedItem = gBattleMons[gBattlerTarget].item;
            gPotentialItemEffectBattler = gBattlerTarget;
            gBattleStruct->moveResultFlags[gBattlerTarget] &= ~(MOVE_RESULT_STURDIED | MOVE_RESULT_FOE_HUNG_ON);
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_HangedOnMsg;
            return;
        }
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static inline bool32 DoesBattlerNegateDamage(u32 battler)
{
    u32 species = gBattleMons[battler].species;
    u32 ability = GetBattlerAbility(battler);

    if (gBattleMons[battler].status2 & STATUS2_TRANSFORMED)
        return FALSE;
    if (ability == ABILITY_DISGUISE && species == SPECIES_MIMIKYU)
        return TRUE;
    if (ability == ABILITY_ICE_FACE && species == SPECIES_EISCUE && GetBattleMoveCategory(gCurrentMove) == DAMAGE_CATEGORY_PHYSICAL)
        return TRUE;

    return FALSE;
}

static u32 UpdateEffectivenessResultFlagsForDoubleSpreadMoves(u32 resultFlags)
{
    // Only play the "best" sound
    for (u32 sound = 0; sound < 3; sound++)
    {
        for (u32 battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
        {
            if ((gBattleStruct->moveResultFlags[battlerDef] & (MOVE_RESULT_MISSED | MOVE_RESULT_NO_EFFECT)
             || gBattleStruct->noResultString[battlerDef]))
                continue;

            switch (sound)
            {
            case 0:
                if (gBattleStruct->moveResultFlags[battlerDef] & MOVE_RESULT_SUPER_EFFECTIVE
                 && !DoesBattlerNegateDamage(battlerDef))
                    return gBattleStruct->moveResultFlags[battlerDef];
                break;
            case 1:
                if (gBattleStruct->moveResultFlags[battlerDef] & MOVE_RESULT_NOT_VERY_EFFECTIVE
                 && !DoesBattlerNegateDamage(battlerDef))
                    return gBattleStruct->moveResultFlags[battlerDef];
                break;
            case 2:
                if (DoesBattlerNegateDamage(battlerDef))
                    return 0; //Normal effectiveness
                return gBattleStruct->moveResultFlags[battlerDef];
            }
        }
    }

    return resultFlags;
}

static inline bool32 TryStrongWindsWeakenAttack(u32 battlerDef, u32 moveType)
{
    if (gBattleWeather & B_WEATHER_STRONG_WINDS && HasWeatherEffect())
    {
        if (GetMoveCategory(gCurrentMove) != DAMAGE_CATEGORY_STATUS
         && IS_BATTLER_OF_TYPE(battlerDef, TYPE_FLYING)
         && gTypeEffectivenessTable[moveType][TYPE_FLYING] >= UQ_4_12(2.0)
         && !gBattleStruct->printedStrongWindsWeakenedAttack)
        {
            gBattleStruct->printedStrongWindsWeakenedAttack = TRUE;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_AttackWeakenedByStrongWinds;
            return TRUE;
        }
    }

    return FALSE;
}

static inline bool32 TryTeraShellDistortTypeMatchups(u32 battlerDef)
{
    if (gSpecialStatuses[battlerDef].teraShellAbilityDone)
    {
        gSpecialStatuses[battlerDef].teraShellAbilityDone = FALSE;
        gBattleScripting.battler = battlerDef;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_TeraShellDistortingTypeMatchups;
        return TRUE;
    }
    return FALSE;
}

// According to Gen5 Weakness berry activation happens after the attackanimation.
// It doesn't have any impact on gameplay and is only a visual thing which can be adjusted later.
static inline bool32 TryActivateWeakenessBerry(u32 battlerDef)
{
    if (gSpecialStatuses[battlerDef].berryReduced && gBattleMons[battlerDef].item != ITEM_NONE)
    {
        gBattleScripting.battler = battlerDef;
        gLastUsedItem = gBattleMons[battlerDef].item;
        gBattleStruct->partyState[GetBattlerSide(battlerDef)][gBattlerPartyIndexes[battlerDef]].ateBerry = TRUE;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_BerryReduceDmg;
        return TRUE;
    }

    return FALSE;
}

static bool32 ProcessPreAttackAnimationFuncs(void)
{
    u32 moveType = GetBattleMoveType(gCurrentMove);
    if (IsDoubleSpreadMove())
    {
        u32 moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);
        if (!gBattleStruct->printedStrongWindsWeakenedAttack)
        {
            for (u32 battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
            {
                if (IsBattlerInvalidForSpreadMove(gBattlerAttacker, battlerDef, moveTarget)
                 || (battlerDef == BATTLE_PARTNER(gBattlerAttacker) && !(moveTarget & MOVE_TARGET_FOES_AND_ALLY))
                 || (gBattleStruct->noResultString[battlerDef] && gBattleStruct->noResultString[battlerDef] != DO_ACCURACY_CHECK))
                    continue;

                if (TryStrongWindsWeakenAttack(battlerDef, moveType))
                    return TRUE;
            }
        }

        for (u32 battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
        {
            if (IsBattlerInvalidForSpreadMove(gBattlerAttacker, battlerDef, moveTarget)
             || (battlerDef == BATTLE_PARTNER(gBattlerAttacker) && !(moveTarget & MOVE_TARGET_FOES_AND_ALLY))
             || (gBattleStruct->noResultString[battlerDef] && gBattleStruct->noResultString[battlerDef] != DO_ACCURACY_CHECK))
                continue;

            if (TryTeraShellDistortTypeMatchups(battlerDef))
                return TRUE;
            if (TryActivateWeakenessBerry(battlerDef))
                return TRUE;
        }
    }
    else
    {
        if (TryStrongWindsWeakenAttack(gBattlerTarget, moveType))
            return TRUE;
        if (TryTeraShellDistortTypeMatchups(gBattlerTarget))
            return TRUE;
        if (TryActivateWeakenessBerry(gBattlerTarget))
            return TRUE;
    }

    return FALSE;
}

static void Cmd_attackanimation(void)
{
    CMD_ARGS();

    if (gBattleControllerExecFlags || ProcessPreAttackAnimationFuncs())
        return;

    u32 moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);
    u32 moveResultFlags = gBattleStruct->moveResultFlags[gBattlerTarget];

    if (IsDoubleSpreadMove())
        moveResultFlags = UpdateEffectivenessResultFlagsForDoubleSpreadMoves(gBattleStruct->moveResultFlags[gBattlerTarget]);

    if ((gHitMarker & (HITMARKER_NO_ANIMATIONS | HITMARKER_DISABLE_ANIMATION))
        && gCurrentMove != MOVE_TRANSFORM
        && gCurrentMove != MOVE_SUBSTITUTE
        && gCurrentMove != MOVE_ALLY_SWITCH
        // In a wild double battle gotta use the teleport animation if two wild pokemon are alive.
        && !(GetMoveEffect(gCurrentMove) == EFFECT_TELEPORT && WILD_DOUBLE_BATTLE && !IsOnPlayerSide(gBattlerAttacker) && IsBattlerAlive(BATTLE_PARTNER(gBattlerAttacker))))
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

        // handle special move animations
        if (GetMoveEffect(gCurrentMove) == EFFECT_EXPANDING_FORCE && moveTarget & MOVE_TARGET_BOTH && CountAliveMonsInBattle(BATTLE_ALIVE_SIDE, BATTLE_OPPOSITE(gBattlerAttacker) > 1))
            gBattleScripting.animTurn = 1;

        if (!(moveResultFlags & MOVE_RESULT_NO_EFFECT))
        {
            u32 multihit;
            if (gBattleMons[gBattlerTarget].status2 & STATUS2_SUBSTITUTE)
            {
                multihit = gMultiHitCounter;
            }
            else if (gMultiHitCounter != 0 && gMultiHitCounter != 1)
            {
                if (gBattleMons[gBattlerTarget].hp <= gBattleStruct->moveDamage[gBattlerTarget])
                    multihit = 1;
                else
                    multihit = gMultiHitCounter;
            }
            else
            {
                multihit = gMultiHitCounter;
            }

            BtlController_EmitMoveAnimation(gBattlerAttacker,
                                            B_COMM_TO_CONTROLLER,
                                            gCurrentMove,
                                            gBattleScripting.animTurn,
                                            gBattleMovePower,
                                            gBattleStruct->moveDamage[gBattlerTarget],
                                            gBattleMons[gBattlerAttacker].friendship,
                                            &gDisableStructs[gBattlerAttacker],
                                            multihit);
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

static void DoublesHPBarReduction(void)
{
    if (gBattleStruct->doneDoublesSpreadHit
     || gHitMarker & (HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_PASSIVE_DAMAGE))
        return;

    for (u32 battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
    {
        if (gBattleStruct->moveResultFlags[battlerDef] & MOVE_RESULT_NO_EFFECT
         || gBattleStruct->moveDamage[battlerDef] == 0
         || gBattleStruct->noResultString[battlerDef]
         || DoesSubstituteBlockMove(gBattlerAttacker, battlerDef, gCurrentMove)
         || DoesDisguiseBlockMove(battlerDef, gCurrentMove))
            continue;

        s32 currDmg = gBattleStruct->moveDamage[battlerDef];
        s32 healthValue = min(currDmg, 10000); // Max damage (10000) not present in R/S, ensures that huge damage values don't change sign
        BtlController_EmitHealthBarUpdate(battlerDef, B_COMM_TO_CONTROLLER, healthValue);
        MarkBattlerForControllerExec(battlerDef);

        if (IsOnPlayerSide(battlerDef) && currDmg > 0)
            gBattleResults.playerMonWasDamaged = TRUE;
    }

    gBattleStruct->doneDoublesSpreadHit = TRUE;
}

static void Cmd_healthbarupdate(void)
{
    CMD_ARGS(u8 battler);
    u32 battler = GetBattlerForBattleScript(cmd->battler);

    if (gBattleControllerExecFlags)
        return;

    if (!(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT) || (gHitMarker & HITMARKER_PASSIVE_DAMAGE))
    {
        if (DoesSubstituteBlockMove(gBattlerAttacker, battler, gCurrentMove) && gDisableStructs[battler].substituteHP && !(gHitMarker & HITMARKER_IGNORE_SUBSTITUTE))
        {
            PrepareStringBattle(STRINGID_SUBSTITUTEDAMAGED, battler);
            if (IsDoubleSpreadMove())
                DoublesHPBarReduction();
        }
        else if (!DoesDisguiseBlockMove(battler, gCurrentMove))
        {
            if (IsDoubleSpreadMove())
            {
                DoublesHPBarReduction();
            }
            else
            {
                s16 healthValue = min(gBattleStruct->moveDamage[battler], 10000); // Max damage (10000) not present in R/S, ensures that huge damage values don't change sign

                BtlController_EmitHealthBarUpdate(battler, B_COMM_TO_CONTROLLER, healthValue);
                MarkBattlerForControllerExec(battler);

                if (IsOnPlayerSide(battler) && gBattleStruct->moveDamage[battler] > 0)
                    gBattleResults.playerMonWasDamaged = TRUE;
            }
        }
    }
    else if (IsDoubleSpreadMove())
    {
        DoublesHPBarReduction();
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

// Update the active battler's HP and various HP trackers (Substitute, Bide, etc.)
static void Cmd_datahpupdate(void)
{
    CMD_ARGS(u8 battler);

    if (gBattleControllerExecFlags)
        return;

    u32 battler = GetBattlerForBattleScript(cmd->battler);

    if (!(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT) || (gHitMarker & HITMARKER_PASSIVE_DAMAGE))
    {
        if (DoesSubstituteBlockMove(gBattlerAttacker, battler, gCurrentMove) && gDisableStructs[battler].substituteHP && !(gHitMarker & HITMARKER_IGNORE_SUBSTITUTE))
        {
            if (gDisableStructs[battler].substituteHP >= gBattleStruct->moveDamage[battler])
            {
                gDisableStructs[battler].substituteHP -= gBattleStruct->moveDamage[battler];
            }
            else
            {
                gBattleStruct->moveDamage[battler] = gDisableStructs[battler].substituteHP;
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
            if (gBattleMons[battler].species == SPECIES_MIMIKYU_TOTEM_DISGUISED)
                gBattleMons[battler].species = SPECIES_MIMIKYU_BUSTED_TOTEM;
            else
                gBattleMons[battler].species = SPECIES_MIMIKYU_BUSTED;
            if (B_DISGUISE_HP_LOSS >= GEN_8)
                gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 8;
            BattleScriptPush(cmd->nextInstr);
            gBattlescriptCurrInstr = BattleScript_TargetFormChange;
            return;
        }
        else
        {
            gHitMarker &= ~HITMARKER_IGNORE_SUBSTITUTE;
            if (gBattleStruct->moveDamage[battler] < 0)
            {
                // Negative damage is HP gain
                gBattleMons[battler].hp += -gBattleStruct->moveDamage[battler];
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
                    gBideDmg[battler] += gBattleStruct->moveDamage[battler];
                    if (cmd->battler == BS_TARGET)
                        gBideTarget[battler] = gBattlerAttacker;
                    else
                        gBideTarget[battler] = gBattlerTarget;
                }

                // Deal damage to the battler
                if (gBattleMons[battler].hp > gBattleStruct->moveDamage[battler])
                {
                    gBattleMons[battler].hp -= gBattleStruct->moveDamage[battler];
                }
                else
                {
                    gBattleStruct->moveDamage[battler] = gBattleMons[battler].hp;
                    gBattleMons[battler].hp = 0;
                }

                enum BattleMoveEffects effect = GetMoveEffect(gCurrentMove);

                // Note: While physicalDmg/specialDmg below are only distinguished between for Counter/Mirror Coat, they are
                //       used in combination as general damage trackers for other purposes. specialDmg is additionally used
                //       to help determine if a fire move should defrost the target.
                if (IsBattleMovePhysical(gCurrentMove) && !(gHitMarker & HITMARKER_PASSIVE_DAMAGE) && effect != EFFECT_PAIN_SPLIT)
                {
                    gProtectStructs[battler].physicalDmg = gBattleStruct->moveDamage[battler];
                    gSpecialStatuses[battler].physicalDmg = gBattleStruct->moveDamage[battler];
                    if (cmd->battler == BS_TARGET)
                        gProtectStructs[battler].physicalBattlerId = gBattlerAttacker;
                    else
                        gProtectStructs[battler].physicalBattlerId = gBattlerTarget;
                }
                else if (!IsBattleMovePhysical(gCurrentMove) && !(gHitMarker & HITMARKER_PASSIVE_DAMAGE) && effect != EFFECT_PAIN_SPLIT)
                {
                    // Record special damage/attacker for Mirror Coat
                    gProtectStructs[battler].specialDmg = gBattleStruct->moveDamage[battler];
                    gSpecialStatuses[battler].specialDmg = gBattleStruct->moveDamage[battler];
                    if (cmd->battler == BS_TARGET)
                        gProtectStructs[battler].specialBattlerId = gBattlerAttacker;
                    else
                        gProtectStructs[battler].specialBattlerId = gBattlerTarget;
                }
            }
            gHitMarker &= ~HITMARKER_PASSIVE_DAMAGE;
            // Send updated HP
            BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_HP_BATTLE, 0, sizeof(gBattleMons[battler].hp), &gBattleMons[battler].hp);
            MarkBattlerForControllerExec(battler);
        }

        if (gBattlerAttacker != gBattlerTarget
         && GetMoveCategory(gCurrentMove) != DAMAGE_CATEGORY_STATUS
         && IsBattlerTurnDamaged(gBattlerTarget))
            gBattleStruct->timesGotHit[GetBattlerSide(gBattlerTarget)][gBattlerPartyIndexes[gBattlerTarget]]++;
    }

    TryRestoreDamageAfterCheeckPouch(battler);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_critmessage(void)
{
    CMD_ARGS();

    if (gBattleControllerExecFlags == 0)
    {
        if (gSpecialStatuses[gBattlerTarget].criticalHit && !(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT))
        {
            PrepareStringBattle(STRINGID_CRITICALHIT, gBattlerAttacker);

            TryInitializeTrainerSlideEnemyLandsFirstCriticalHit(gBattlerTarget);
            TryInitializeTrainerSlidePlayerLandsFirstCriticalHit(gBattlerTarget);

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

    u32 moveResultFlags = gBattleStruct->moveResultFlags[gBattlerTarget];

    if (IsDoubleSpreadMove())
    {
        if (gBattleStruct->doneDoublesSpreadHit
         || !gBattleStruct->calculatedDamageDone //The attack animation didn't play yet - only play sound after animation
         || GetBattleMoveCategory(gCurrentMove) == DAMAGE_CATEGORY_STATUS) //To handle Dark Void missing basically
        {
            gBattlescriptCurrInstr = cmd->nextInstr;
            return;
        }
        moveResultFlags = UpdateEffectivenessResultFlagsForDoubleSpreadMoves(gBattleStruct->moveResultFlags[gBattlerTarget]);
    }
    else if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT) && DoesBattlerNegateDamage(gBattlerTarget))
        moveResultFlags = 0;

    if (!(moveResultFlags & MOVE_RESULT_MISSED))
    {
        switch (moveResultFlags & ~MOVE_RESULT_MISSED)
        {
        case MOVE_RESULT_SUPER_EFFECTIVE:
            BtlController_EmitPlaySE(gBattlerTarget, B_COMM_TO_CONTROLLER, SE_SUPER_EFFECTIVE);
            MarkBattlerForControllerExec(gBattlerTarget);
            break;
        case MOVE_RESULT_NOT_VERY_EFFECTIVE:
            BtlController_EmitPlaySE(gBattlerTarget, B_COMM_TO_CONTROLLER, SE_NOT_EFFECTIVE);
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
            if (moveResultFlags & MOVE_RESULT_SUPER_EFFECTIVE)
            {
                BtlController_EmitPlaySE(gBattlerTarget, B_COMM_TO_CONTROLLER, SE_SUPER_EFFECTIVE);
                MarkBattlerForControllerExec(gBattlerTarget);
            }
            else if (moveResultFlags & MOVE_RESULT_NOT_VERY_EFFECTIVE)
            {
                BtlController_EmitPlaySE(gBattlerTarget, B_COMM_TO_CONTROLLER, SE_NOT_EFFECTIVE);
                MarkBattlerForControllerExec(gBattlerTarget);
            }
            else if (!(moveResultFlags & (MOVE_RESULT_DOESNT_AFFECT_FOE | MOVE_RESULT_FAILED)))
            {
                BtlController_EmitPlaySE(gBattlerTarget, B_COMM_TO_CONTROLLER, SE_EFFECTIVE);
                MarkBattlerForControllerExec(gBattlerTarget);
            }
            break;
        }
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static inline bool32 ShouldPrintTwoFoesMessage(u32 moveResult)
{
    return gBattlerTarget == BATTLE_OPPOSITE(gBattlerAttacker)
        && gBattleStruct->moveResultFlags[BATTLE_PARTNER(gBattlerTarget)] & moveResult
        && !gBattleStruct->noResultString[BATTLE_PARTNER(gBattlerTarget)];
}

static inline bool32 ShouldRelyOnTwoFoesMessage(u32 moveResult)
{
    return gBattlerTarget == BATTLE_PARTNER(BATTLE_OPPOSITE(gBattlerAttacker))
        && gBattleStruct->moveResultFlags[BATTLE_OPPOSITE(gBattlerAttacker)] & moveResult
        && !(gBattleStruct->moveResultFlags[BATTLE_OPPOSITE(gBattlerAttacker)] & MOVE_RESULT_MISSED && gBattleStruct->missStringId[BATTLE_OPPOSITE(gBattlerAttacker)] > B_MSG_AVOIDED_ATK)
        && !gBattleStruct->noResultString[BATTLE_OPPOSITE(gBattlerAttacker)];
}

static void Cmd_resultmessage(void)
{
    CMD_ARGS();

    enum StringID stringId = 0;
    u16 *moveResultFlags = &gBattleStruct->moveResultFlags[gBattlerTarget];

    if (gBattleControllerExecFlags)
        return;

    // TODO: Convert this to a proper FORM_CHANGE type.
    // Do Ice Face form change which was set up in Cmd_adjustdamage.
    if (gDisableStructs[gBattlerTarget].iceFaceActivationPrevention)
    {
        gDisableStructs[gBattlerTarget].iceFaceActivationPrevention = FALSE;
        u32 side = GetBattlerSide(gBattlerTarget);
        if (gBattleStruct->changedSpecies[side][gBattlerPartyIndexes[gBattlerTarget]] == SPECIES_NONE)
            gBattleStruct->changedSpecies[side][gBattlerPartyIndexes[gBattlerTarget]] = gBattleMons[gBattlerTarget].species; 
        gBattleMons[gBattlerTarget].species = SPECIES_EISCUE_NOICE;
        gBattleScripting.battler = gBattlerTarget; // For STRINGID_PKMNTRANSFORMED
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_IceFaceNullsDamage;
        return;
    }

    if (*moveResultFlags & MOVE_RESULT_MISSED
     && (!(*moveResultFlags & MOVE_RESULT_DOESNT_AFFECT_FOE) || gBattleStruct->missStringId[gBattlerTarget] > B_MSG_AVOIDED_ATK))
    {
        if (gMultiHitCounter && gMultiHitCounter < GetMoveStrikeCount(gCurrentMove))
        {
            gMultiHitCounter = 0;
            *moveResultFlags &= ~MOVE_RESULT_MISSED;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_MultiHitPrintStrings;
            return;
        }

        if (gBattleStruct->missStringId[gBattlerTarget] > B_MSG_AVOIDED_ATK) // Wonder Guard or Levitate - show the ability pop-up
            CreateAbilityPopUp(gBattlerTarget, gBattleMons[gBattlerTarget].ability, IsDoubleBattle());
        gBattleCommunication[MSG_DISPLAY] = 1;
        stringId = gMissStringIds[gBattleStruct->missStringId[gBattlerTarget]];
    }
    else
    {
        gBattleCommunication[MSG_DISPLAY] = 1;
        switch (*moveResultFlags & ~MOVE_RESULT_MISSED)
        {
        case MOVE_RESULT_SUPER_EFFECTIVE:
            if (IsDoubleSpreadMove())
            {
                if (ShouldPrintTwoFoesMessage(MOVE_RESULT_SUPER_EFFECTIVE))
                    stringId = STRINGID_SUPEREFFECTIVETWOFOES;
                else if (ShouldRelyOnTwoFoesMessage(MOVE_RESULT_SUPER_EFFECTIVE))
                    stringId = 0; // Was handled or will be handled as a double string
                else
                    stringId = STRINGID_SUPEREFFECTIVE;
            }
            else if (!gMultiHitCounter)  // Don't print effectiveness on each hit in a multi hit attack
            {
                stringId = STRINGID_SUPEREFFECTIVE;
            }
            if (stringId == STRINGID_SUPEREFFECTIVE || stringId == STRINGID_SUPEREFFECTIVETWOFOES)
                TryInitializeTrainerSlidePlayerLandsFirstSuperEffectiveHit(gBattlerTarget);
            break;
        case MOVE_RESULT_NOT_VERY_EFFECTIVE:
            if (IsDoubleSpreadMove())
            {
                if (ShouldPrintTwoFoesMessage(MOVE_RESULT_NOT_VERY_EFFECTIVE))
                    stringId = STRINGID_NOTVERYEFFECTIVETWOFOES;
                else if (ShouldRelyOnTwoFoesMessage(MOVE_RESULT_NOT_VERY_EFFECTIVE))
                    stringId = 0; // Was handled or will be handled as a double string
                else
                    stringId = STRINGID_NOTVERYEFFECTIVE; // Needs a string
            }
            else if (!gMultiHitCounter)
            {
                stringId = STRINGID_NOTVERYEFFECTIVE;
            }
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
            if (IsDoubleSpreadMove())
            {
                if (ShouldPrintTwoFoesMessage(MOVE_RESULT_DOESNT_AFFECT_FOE))
                {
                    stringId = STRINGID_ITDOESNTAFFECTTWOFOES;
                }
                else if (ShouldRelyOnTwoFoesMessage(MOVE_RESULT_DOESNT_AFFECT_FOE))
                {
                    stringId = 0; // Was handled or will be handled as a double string
                }
                else
                    stringId = STRINGID_ITDOESNTAFFECT;
            }
            else
            {
                stringId = STRINGID_ITDOESNTAFFECT;
            }
            break;
        case MOVE_RESULT_FOE_HUNG_ON:
            gLastUsedItem = gBattleMons[gBattlerTarget].item;
            gPotentialItemEffectBattler = gBattlerTarget;
            *moveResultFlags &= ~(MOVE_RESULT_FOE_ENDURED | MOVE_RESULT_FOE_HUNG_ON);
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_HangedOnMsg;
            return;
        default:
            if (*moveResultFlags & MOVE_RESULT_ONE_HIT_KO)
            {
                *moveResultFlags &= ~MOVE_RESULT_ONE_HIT_KO;
                *moveResultFlags &= ~MOVE_RESULT_SUPER_EFFECTIVE;
                *moveResultFlags &= ~MOVE_RESULT_NOT_VERY_EFFECTIVE;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_OneHitKOMsg;
                return;
            }
            else if (*moveResultFlags & MOVE_RESULT_STURDIED)
            {
                *moveResultFlags &= ~(MOVE_RESULT_STURDIED | MOVE_RESULT_FOE_ENDURED | MOVE_RESULT_FOE_HUNG_ON);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_SturdiedMsg;
                return;
            }
            else if (*moveResultFlags & MOVE_RESULT_FOE_ENDURED)
            {
                *moveResultFlags &= ~(MOVE_RESULT_FOE_ENDURED | MOVE_RESULT_FOE_HUNG_ON);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_EnduredMsg;
                return;
            }
            else if (*moveResultFlags & MOVE_RESULT_FOE_HUNG_ON)
            {
                gLastUsedItem = gBattleMons[gBattlerTarget].item;
                gPotentialItemEffectBattler = gBattlerTarget;
                *moveResultFlags &= ~(MOVE_RESULT_FOE_ENDURED | MOVE_RESULT_FOE_HUNG_ON);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_HangedOnMsg;
                return;
            }
            else if (*moveResultFlags & MOVE_RESULT_FAILED)
            {
                stringId = STRINGID_BUTITFAILED;
            }
            else if (B_AFFECTION_MECHANICS == TRUE && (*moveResultFlags & MOVE_RESULT_FOE_ENDURED_AFFECTION))
            {
                *moveResultFlags &= ~MOVE_RESULT_FOE_ENDURED_AFFECTION;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_AffectionBasedEndurance;
                return;
            }
        }
    }
    if (stringId)
        PrepareStringBattle(stringId, gBattlerAttacker);
    else
        gBattleCommunication[MSG_DISPLAY] = 0;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_printstring(void)
{
    CMD_ARGS(u16 id);

    if (gBattleControllerExecFlags == 0)
    {
        u16 id = (cmd->id == 0 ? gBattleScripting.savedStringId : cmd->id);

        gBattlescriptCurrInstr = cmd->nextInstr;
        PrepareStringBattle(id, gBattlerAttacker);
        gBattleCommunication[MSG_DISPLAY] = 1;
    }
}

static void Cmd_printselectionstring(void)
{
    CMD_ARGS(u16 id);

    BtlController_EmitPrintSelectionString(gBattlerAttacker, B_COMM_TO_CONTROLLER, cmd->id);
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
            if (gTestRunnerHeadless)
                gPauseCounterBattle = toWait;
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

        BtlController_EmitPrintSelectionString(gBattlerAttacker, B_COMM_TO_CONTROLLER, *ptr);
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
        gDisableStructs[battler].unburdenActive = TRUE;
        RecordAbilityBattle(battler, ABILITY_UNBURDEN);
    }
}

// battlerStealer steals the item of battlerItem
void StealTargetItem(u8 battlerStealer, u8 battlerItem)
{
    gLastUsedItem = gBattleMons[battlerItem].item;
    gBattleMons[battlerItem].item = ITEM_NONE;

    if (B_STEAL_WILD_ITEMS >= GEN_9
     && !(gBattleTypeFlags & (BATTLE_TYPE_TRAINER | BATTLE_TYPE_PALACE))
     && MoveHasAdditionalEffect(gCurrentMove, MOVE_EFFECT_STEAL_ITEM)
     && battlerStealer == gBattlerAttacker) // ensure that Pickpocket isn't activating this
    {
        AddBagItem(gLastUsedItem, 1);
    }
    else
    {
        RecordItemEffectBattle(battlerStealer, GetItemHoldEffect(gLastUsedItem));
        gBattleMons[battlerStealer].item = gLastUsedItem;

        gDisableStructs[battlerStealer].unburdenActive = FALSE;
        BtlController_EmitSetMonData(battlerStealer, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gLastUsedItem), &gLastUsedItem); // set attacker item
        MarkBattlerForControllerExec(battlerStealer);
    }

    RecordItemEffectBattle(battlerItem, ITEM_NONE);
    CheckSetUnburden(battlerItem);

    BtlController_EmitSetMonData(battlerItem, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[gBattlerTarget].item), &gBattleMons[battlerItem].item);  // remove target item
    MarkBattlerForControllerExec(battlerItem);

    gBattleStruct->choicedMove[battlerItem] = 0;

    TrySaveExchangedItem(battlerItem, gLastUsedItem);
}

static inline bool32 TrySetReflect(u32 battler)
{
    u32 side = GetBattlerSide(battler);
    if (!(gSideStatuses[side] & SIDE_STATUS_REFLECT))
    {
        gSideStatuses[side] |= SIDE_STATUS_REFLECT;
        if (GetBattlerHoldEffect(battler, TRUE) == HOLD_EFFECT_LIGHT_CLAY)
            gSideTimers[side].reflectTimer = gBattleTurnCounter + 8;
        else
            gSideTimers[side].reflectTimer = gBattleTurnCounter + 5;

        if (IsDoubleBattle() && CountAliveMonsInBattle(BATTLE_ALIVE_SIDE, battler) == 2)
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_REFLECT_DOUBLE;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_REFLECT_SINGLE;

        return TRUE;
    }
    return FALSE;
}

static inline bool32 TrySetLightScreen(u32 battler)
{
    u32 side = GetBattlerSide(battler);
    if (!(gSideStatuses[side] & SIDE_STATUS_LIGHTSCREEN))
    {
        gSideStatuses[side] |= SIDE_STATUS_LIGHTSCREEN;
        if (GetBattlerHoldEffect(battler, TRUE) == HOLD_EFFECT_LIGHT_CLAY)
            gSideTimers[side].lightscreenTimer = gBattleTurnCounter + 8;
        else
            gSideTimers[side].lightscreenTimer = gBattleTurnCounter + 5;

        if (IsDoubleBattle() && CountAliveMonsInBattle(BATTLE_ALIVE_SIDE, battler) == 2)
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_LIGHTSCREEN_DOUBLE;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_LIGHTSCREEN_SINGLE;

        return TRUE;
    }
    return FALSE;
}

void SetNonVolatileStatusCondition(u32 effectBattler, enum MoveEffects effect)
{
    if (effect == MOVE_EFFECT_SLEEP
     || effect == MOVE_EFFECT_FREEZE)
    {
        const u8 *cancelMultiTurnMovesResult = NULL;
        cancelMultiTurnMovesResult = CancelMultiTurnMoves(effectBattler, SKY_DROP_STATUS_FREEZE_SLEEP);
        if (cancelMultiTurnMovesResult)
            gBattlescriptCurrInstr = cancelMultiTurnMovesResult;
    }

    BattleScriptPush(gBattlescriptCurrInstr + 1);

    if (sStatusFlagsForMoveEffects[effect] == STATUS1_SLEEP)
    {
        if (B_SLEEP_TURNS >= GEN_5)
            gBattleMons[effectBattler].status1 |= STATUS1_SLEEP_TURN(1 + RandomUniform(RNG_SLEEP_TURNS, 1, 3));
        else
            gBattleMons[effectBattler].status1 |= STATUS1_SLEEP_TURN(1 + RandomUniform(RNG_SLEEP_TURNS, 2, 5));

        TryActivateSleepClause(effectBattler, gBattlerPartyIndexes[effectBattler]);
    }
    else
    {
        gBattleMons[effectBattler].status1 |= sStatusFlagsForMoveEffects[effect];
    }

    gBattlescriptCurrInstr = sMoveEffectBS_Ptrs[effect];

    BtlController_EmitSetMonData(effectBattler, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[effectBattler].status1), &gBattleMons[effectBattler].status1);
    MarkBattlerForControllerExec(effectBattler);

    if (gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STATUSED_BY_ABILITY;
        gHitMarker &= ~HITMARKER_STATUS_ABILITY_EFFECT;
    }
    else
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STATUSED;
    }

    gBattleScripting.moveEffect = MOVE_EFFECT_NONE;

    // for synchronize
    if (effect == MOVE_EFFECT_POISON
     || effect == MOVE_EFFECT_TOXIC
     || effect == MOVE_EFFECT_PARALYSIS
     || effect == MOVE_EFFECT_BURN)
     {
        gBattleStruct->synchronizeMoveEffect = effect;
        gHitMarker |= HITMARKER_SYNCHRONIZE_EFFECT;
     }

    if (effect == MOVE_EFFECT_POISON || effect == MOVE_EFFECT_TOXIC)
        gBattleStruct->poisonPuppeteerConfusion = TRUE;
}

#define INCREMENT_RESET_RETURN                  \
{                                               \
    gBattlescriptCurrInstr++;                   \
    gBattleScripting.moveEffect = 0;            \
    return;                                     \
}

void SetMoveEffect(bool32 primary, bool32 certain)
{
    s32 i, affectsUser = 0;
    bool32 statusChanged = FALSE;
    bool32 mirrorArmorReflected = (GetBattlerAbility(gBattlerTarget) == ABILITY_MIRROR_ARMOR);
    u32 flags = 0;
    u32 battlerAbility;
    bool32 activateAfterFaint = FALSE;

    // NULL move effect
    if (gBattleScripting.moveEffect == 0)
        return;

    if (gSpecialStatuses[gBattlerAttacker].parentalBondState == PARENTAL_BOND_1ST_HIT
        && IsBattlerAlive(gBattlerTarget)
        && IsFinalStrikeEffect(gBattleScripting.moveEffect))
    {
        gBattlescriptCurrInstr++;
        return;
    }

    switch (gBattleScripting.moveEffect) // Set move effects which happen later on
    {
    case MOVE_EFFECT_STEALTH_ROCK:
    case MOVE_EFFECT_SPIKES:
    case MOVE_EFFECT_PAYDAY:
    case MOVE_EFFECT_BUG_BITE:
    case MOVE_EFFECT_STEAL_ITEM:
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
     && IsMoveEffectBlockedByTarget(battlerAbility))
        INCREMENT_RESET_RETURN

    if (gSideStatuses[GetBattlerSide(gEffectBattler)] & SIDE_STATUS_SAFEGUARD && !(gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
        && !primary && gBattleScripting.moveEffect <= MOVE_EFFECT_CONFUSION)
        INCREMENT_RESET_RETURN

    if (!(gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
     && TestIfSheerForceAffected(gBattlerAttacker, gCurrentMove)
     && !(GetMoveEffect(gCurrentMove) == EFFECT_ORDER_UP && gBattleStruct->commanderActive[gBattlerAttacker])
     && !primary
     && gBattleScripting.moveEffect != MOVE_EFFECT_CHARGING)
        INCREMENT_RESET_RETURN

    if (!IsBattlerAlive(gEffectBattler) && !activateAfterFaint)
        INCREMENT_RESET_RETURN

    if (DoesSubstituteBlockMove(gBattlerAttacker, gEffectBattler, gCurrentMove) && affectsUser != MOVE_EFFECT_AFFECTS_USER)
        INCREMENT_RESET_RETURN

    if (gBattleScripting.moveEffect <= PRIMARY_STATUS_MOVE_EFFECT) // status change
    {
        if (!(gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)) // Calcs already done
        {
            statusChanged = CanSetNonVolatileStatus(gBattlerAttacker,
                                                    gEffectBattler,
                                                    GetBattlerAbility(gBattlerAttacker),
                                                    battlerAbility,
                                                    gBattleScripting.moveEffect,
                                                    STATUS_CHECK_TRIGGER);
        }

        if (statusChanged || gHitMarker & HITMARKER_STATUS_ABILITY_EFFECT)
        {
            SetNonVolatileStatusCondition(gEffectBattler, gBattleScripting.moveEffect);
        }
        else
        {
            gBattleScripting.moveEffect = 0;
            gBattlescriptCurrInstr++;
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
                    if (GetMoveEffect(gCurrentMove) == EFFECT_SKY_DROP)
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
                        && !(GetActiveGimmick(gEffectBattler) == GIMMICK_DYNAMAX))
                {
                    gBattleMons[gEffectBattler].status2 |= sStatusFlagsForMoveEffects[gBattleScripting.moveEffect];
                    gBattlescriptCurrInstr++;
                }
                else
                {
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
                if (IsOnPlayerSide(gBattlerAttacker) && gSpecialStatuses[gBattlerAttacker].parentalBondState!= PARENTAL_BOND_2ND_HIT)
                {
                    u16 payday = gPaydayMoney;
                    u16 moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);
                    gPaydayMoney += (gBattleMons[gBattlerAttacker].level * 5);
                    if (payday > gPaydayMoney)
                        gPaydayMoney = 0xFFFF;

                    // For a move that hits multiple targets (i.e. Make it Rain)
                    // we only want to print the message on the final hit
                    if (!(NumAffectedSpreadMoveTargets() > 1 && GetNextTarget(moveTarget, TRUE) != MAX_BATTLERS_COUNT))
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
                if (IsOnPlayerSide(gBattlerAttacker) && !gBattleStruct->moneyMultiplierMove)
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
                                    affectsUser | STAT_CHANGE_UPDATE_MOVE_EFFECT, 0) == STAT_CHANGE_DIDNT_WORK)
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
                if (affectsUser == MOVE_EFFECT_AFFECTS_USER)
                    flags = MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN;
                else
                    flags = 0;
                if (mirrorArmorReflected && !affectsUser)
                    flags |= STAT_CHANGE_ALLOW_PTR;
                else
                    flags |= STAT_CHANGE_UPDATE_MOVE_EFFECT;

                if (ChangeStatBuffs(SET_STAT_BUFF_VALUE(1) | STAT_BUFF_NEGATIVE,
                                    gBattleScripting.moveEffect - MOVE_EFFECT_ATK_MINUS_1 + 1,
                                    flags, gBattlescriptCurrInstr + 1) == STAT_CHANGE_DIDNT_WORK)
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
                                    affectsUser | STAT_CHANGE_UPDATE_MOVE_EFFECT, 0) == STAT_CHANGE_DIDNT_WORK)
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
                if (affectsUser == MOVE_EFFECT_AFFECTS_USER)
                    flags = MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN;
                else
                    flags = 0;
                if (mirrorArmorReflected && !affectsUser)
                    flags |= STAT_CHANGE_ALLOW_PTR;
                else
                    flags |= STAT_CHANGE_UPDATE_MOVE_EFFECT;

                if (ChangeStatBuffs(SET_STAT_BUFF_VALUE(2) | STAT_BUFF_NEGATIVE,
                                    gBattleScripting.moveEffect - MOVE_EFFECT_ATK_MINUS_2 + 1,
                                    flags, gBattlescriptCurrInstr + 1) == STAT_CHANGE_DIDNT_WORK)
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
                if (B_SKIP_RECHARGE == GEN_1 && !IsBattlerAlive(gBattlerTarget))  // Skip recharge if gen 1 and foe is KO'd
                    break;

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
                if (!CanStealItem(gBattlerAttacker, gBattlerTarget, gBattleMons[gBattlerTarget].item)
                    || gBattleMons[gBattlerAttacker].item != ITEM_NONE
                    || gBattleMons[gBattlerTarget].item == ITEM_NONE)
                {
                    gBattlescriptCurrInstr++;
                }
                else if (GetBattlerAbility(gBattlerTarget) == ABILITY_STICKY_HOLD)
                {
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_NoItemSteal;

                    gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
                    RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
                }
                else
                {
                    StealTargetItem(gBattlerAttacker, gBattlerTarget);  // Attacker steals target item

                    if (!(B_STEAL_WILD_ITEMS >= GEN_9
                     && !(gBattleTypeFlags & (BATTLE_TYPE_TRAINER | BATTLE_TYPE_PALACE))))
                    {
                        gBattleMons[gBattlerAttacker].item = ITEM_NONE; // Item assigned later on with thief (see MOVEEND_CHANGED_ITEMS)
                        gBattleStruct->changedItems[gBattlerAttacker] = gLastUsedItem; // Stolen item to be assigned later
                    }
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_ItemSteal;
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
                gBattleStruct->moveDamage[gEffectBattler] = (gBattleMons[gEffectBattler].maxHP) / 4;
                if (gBattleStruct->moveDamage[gEffectBattler] == 0)
                    gBattleStruct->moveDamage[gEffectBattler] = 1;
                if (GetBattlerAbility(gEffectBattler) == ABILITY_PARENTAL_BOND)
                    gBattleStruct->moveDamage[gEffectBattler] *= 2;

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
                    i = BATTLE_PARTNER(gBattlerTarget);
                    gBattleScripting.savedBattler = i;
                    gBattleStruct->moveDamage[i] = gBattleMons[i].maxHP / 16;
                    if (gBattleStruct->moveDamage[i] == 0)
                        gBattleStruct->moveDamage[i] = 1;
                    gBattlescriptCurrInstr = BattleScript_MoveEffectFlameBurst;
                }
                break;
            case MOVE_EFFECT_FEINT:
                i = FALSE; // Remove Protect if any
                if (gProtectStructs[gBattlerTarget].protected != PROTECT_NONE
                 && gProtectStructs[gBattlerTarget].protected != PROTECT_MAX_GUARD)
                {
                    gProtectStructs[gBattlerTarget].protected = PROTECT_NONE;
                    i = TRUE;
                }
                if (GetProtectType(gProtectStructs[BATTLE_PARTNER(gBattlerTarget)].protected) == PROTECT_TYPE_SIDE)
                {
                    gProtectStructs[BATTLE_PARTNER(gBattlerTarget)].protected = PROTECT_NONE;
                    i = TRUE;
                }
                if (i)
                {
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    if (gCurrentMove == MOVE_HYPERSPACE_FURY)
                        gBattlescriptCurrInstr = BattleScript_HyperspaceFuryRemoveProtect;
                    else
                        gBattlescriptCurrInstr = BattleScript_MoveEffectFeint;
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
                gDisableStructs[gEffectBattler].throatChopTimer = gBattleTurnCounter + 2;
                gBattlescriptCurrInstr++;
                break;
            case MOVE_EFFECT_INCINERATE:
                if ((gBattleMons[gEffectBattler].item >= FIRST_BERRY_INDEX && gBattleMons[gEffectBattler].item <= LAST_BERRY_INDEX)
                 || (B_INCINERATE_GEMS >= GEN_6 && GetBattlerHoldEffect(gEffectBattler, FALSE) == HOLD_EFFECT_GEMS))
                {
                    gLastUsedItem = gBattleMons[gEffectBattler].item;
                    gBattleMons[gEffectBattler].item = 0;
                    CheckSetUnburden(gEffectBattler);

                    BtlController_EmitSetMonData(gEffectBattler, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[gEffectBattler].item), &gBattleMons[gEffectBattler].item);
                    MarkBattlerForControllerExec(gEffectBattler);
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_MoveEffectIncinerate;
                }
                break;
            case MOVE_EFFECT_BUG_BITE:
                if (GetItemPocket(gBattleMons[gEffectBattler].item) == POCKET_BERRIES
                    && battlerAbility != ABILITY_STICKY_HOLD)
                {
                    // target loses their berry
                    gLastUsedItem = gBattleMons[gEffectBattler].item;
                    gBattleMons[gEffectBattler].item = 0;
                    CheckSetUnburden(gEffectBattler);

                    BtlController_EmitSetMonData(gEffectBattler, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[gEffectBattler].item), &gBattleMons[gEffectBattler].item);
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
            {
                u32 type = GetMoveArgType(gCurrentMove);
                // This seems unnecessary but is done to make it work properly with Parental Bond
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                switch (type)
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
                RemoveBattlerType(gEffectBattler, type);
                break;
            }
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
                    struct Pokemon *mon = GetBattlerMon(gBattlerAttacker);

                    gStatuses4[gEffectBattler] |= STATUS4_SYRUP_BOMB;
                    gDisableStructs[gEffectBattler].syrupBombTimer = 3;
                    gDisableStructs[gEffectBattler].syrupBombIsShiny = IsMonShiny(mon);
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
                    gBattleScripting.moveEffect = gBattleEnvironmentInfo[gBattleEnvironment].secretPowerEffect;
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
                    gDisableStructs[gEffectBattler].healBlockTimer = gBattleTurnCounter + 2;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_EffectPsychicNoise;
                }
                break;
            case MOVE_EFFECT_TERA_BLAST:
                if (GetActiveGimmick(gEffectBattler) == GIMMICK_TERA
                    && GetBattlerTeraType(gEffectBattler) == TYPE_STELLAR
                    && !NoAliveMonsForEitherParty())
                {
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_LowerAtkSpAtk;
                }
                break;
            case MOVE_EFFECT_ORDER_UP:
                {
                    u32 stat = 0;
                    bool32 commanderAffected = TRUE;
                    switch (gBattleStruct->commanderActive[gEffectBattler])
                    {
                    case SPECIES_TATSUGIRI_CURLY:
                        stat = STAT_ATK;
                        break;
                    case SPECIES_TATSUGIRI_DROOPY:
                        stat = STAT_DEF;
                        break;
                    case SPECIES_TATSUGIRI_STRETCHY:
                        stat = STAT_SPEED;
                        break;
                    default:
                        commanderAffected = FALSE;
                        break;
                    }
                    if (!commanderAffected
                     || NoAliveMonsForEitherParty()
                     || ChangeStatBuffs(SET_STAT_BUFF_VALUE(1),
                                        stat,
                                        affectsUser | STAT_CHANGE_UPDATE_MOVE_EFFECT,
                                        0) == STAT_CHANGE_DIDNT_WORK)
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
                }
                break;
            case MOVE_EFFECT_ION_DELUGE:
                if (!(gFieldStatuses & STATUS_FIELD_ION_DELUGE))
                {
                    gFieldStatuses |= STATUS_FIELD_ION_DELUGE;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_MoveEffectIonDeluge;
                }
                break;
            case MOVE_EFFECT_HAZE:
                for (i = 0; i < gBattlersCount; i++)
                    TryResetBattlerStatChanges(i);
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_MoveEffectHaze;
                break;
            case MOVE_EFFECT_LEECH_SEED:
                if (!IS_BATTLER_OF_TYPE(gBattlerTarget, TYPE_GRASS) && !(gStatuses3[gBattlerTarget] & STATUS3_LEECHSEED))
                {
                    gStatuses3[gBattlerTarget] |= gBattlerAttacker;
                    gStatuses3[gBattlerTarget] |= STATUS3_LEECHSEED;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_MoveEffectLeechSeed;
                }
                break;
            case MOVE_EFFECT_REFLECT:
                if (TrySetReflect(gBattlerAttacker))
                {
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_MoveEffectReflect;
                }
                break;
            case MOVE_EFFECT_LIGHT_SCREEN:
                if (TrySetLightScreen(gBattlerAttacker))
                {
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_MoveEffectLightScreen;
                }
                break;
            case MOVE_EFFECT_SALT_CURE:
                if (!(gStatuses4[gBattlerTarget] & STATUS4_SALT_CURE))
                {
                    gStatuses4[gBattlerTarget] |= STATUS4_SALT_CURE;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_MoveEffectSaltCure;
                }
                break;
            case MOVE_EFFECT_EERIE_SPELL:
                if (gLastMoves[gBattlerTarget] != MOVE_NONE && gLastMoves[gBattlerTarget] != 0xFFFF)
                {
                    u32 i;

                    for (i = 0; i < MAX_MON_MOVES; i++)
                    {
                        if (gLastMoves[gBattlerTarget] == gBattleMons[gBattlerTarget].moves[i])
                            break;
                    }

                    if (i != MAX_MON_MOVES && gBattleMons[gBattlerTarget].pp[i] != 0)
                    {
                        u32 ppToDeduct = 3;

                        if (gBattleMons[gBattlerTarget].pp[i] < ppToDeduct)
                            ppToDeduct = gBattleMons[gBattlerTarget].pp[i];

                        PREPARE_MOVE_BUFFER(gBattleTextBuff1, gLastMoves[gBattlerTarget])
                        ConvertIntToDecimalStringN(gBattleTextBuff2, ppToDeduct, STR_CONV_MODE_LEFT_ALIGN, 1);
                        PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff2, 1, ppToDeduct)
                        gBattleMons[gBattlerTarget].pp[i] -= ppToDeduct;
                        if (!(gDisableStructs[gBattlerTarget].mimickedMoves & (1u << i))
                            && !(gBattleMons[gBattlerTarget].status2 & STATUS2_TRANSFORMED))
                        {
                            BtlController_EmitSetMonData(gBattlerTarget, B_COMM_TO_CONTROLLER, REQUEST_PPMOVE1_BATTLE + i, 0, sizeof(gBattleMons[gBattlerTarget].pp[i]), &gBattleMons[gBattlerTarget].pp[i]);
                            MarkBattlerForControllerExec(gBattlerTarget);
                        }

                        if (gBattleMons[gBattlerTarget].pp[i] == 0 && gBattleStruct->skyDropTargets[gBattlerTarget] == SKY_DROP_NO_TARGET)
                            CancelMultiTurnMoves(gBattlerTarget, SKY_DROP_IGNORE);

                        BattleScriptPush(gBattlescriptCurrInstr + 1);
                        gBattlescriptCurrInstr = BattleScript_MoveEffectEerieSpell;
                    }
                }
                break;
            case MOVE_EFFECT_RAISE_TEAM_ATTACK:
                if (!NoAliveMonsForEitherParty())
                {
                    // Max Effects are ordered by stat ID.
                    SET_STATCHANGER(STAT_ATK, 1, FALSE);
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_EffectRaiseStatAllies;
                }
                break;
            case MOVE_EFFECT_RAISE_TEAM_DEFENSE:
                if (!NoAliveMonsForEitherParty())
                {
                    // Max Effects are ordered by stat ID.
                    SET_STATCHANGER(STAT_DEF, 1, FALSE);
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_EffectRaiseStatAllies;
                }
                break;
            case MOVE_EFFECT_RAISE_TEAM_SPEED:
                if (!NoAliveMonsForEitherParty())
                {
                    // Max Effects are ordered by stat ID.
                    SET_STATCHANGER(STAT_SPEED, 1, FALSE);
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_EffectRaiseStatAllies;
                }
                break;
            case MOVE_EFFECT_RAISE_TEAM_SP_ATK:
                if (!NoAliveMonsForEitherParty())
                {
                    // Max Effects are ordered by stat ID.
                    SET_STATCHANGER(STAT_SPATK, 1, FALSE);
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_EffectRaiseStatAllies;
                }
                break;
            case MOVE_EFFECT_RAISE_TEAM_SP_DEF:
                if (!NoAliveMonsForEitherParty())
                {
                    // Max Effects are ordered by stat ID.
                    SET_STATCHANGER(STAT_SPDEF, 1, FALSE);
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_EffectRaiseStatAllies;
                }
                break;
            case MOVE_EFFECT_LOWER_ATTACK_SIDE:
            case MOVE_EFFECT_LOWER_DEFENSE_SIDE:
            case MOVE_EFFECT_LOWER_SPEED_SIDE:
            case MOVE_EFFECT_LOWER_SP_ATK_SIDE:
            case MOVE_EFFECT_LOWER_SP_DEF_SIDE:
            case MOVE_EFFECT_LOWER_SPEED_2_SIDE:
            case MOVE_EFFECT_LOWER_EVASIVENESS_SIDE:
                if (!NoAliveMonsForEitherParty())
                {
                    u32 statId = 0;
                    u32 stage = 1;
                    switch (gBattleScripting.moveEffect)
                    {
                        case MOVE_EFFECT_LOWER_SPEED_2_SIDE:
                            statId = STAT_SPEED;
                            stage = 2;
                            break;
                        case MOVE_EFFECT_LOWER_EVASIVENESS_SIDE:
                            statId = STAT_EVASION;
                            break;
                        default:
                            // Max Effects are ordered by stat ID.
                            statId = gBattleScripting.moveEffect - MOVE_EFFECT_LOWER_ATTACK_SIDE + 1;
                            break;
                    }
                    SET_STATCHANGER(statId, stage, TRUE);
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_EffectLowerStatFoes;
                }
                break;
            case MOVE_EFFECT_SUN:
            case MOVE_EFFECT_RAIN:
            case MOVE_EFFECT_SANDSTORM:
            case MOVE_EFFECT_HAIL:
            {
                u8 weather = 0, msg = 0;
                switch (gBattleScripting.moveEffect)
                {
                    case MOVE_EFFECT_SUN:
                        weather = BATTLE_WEATHER_SUN;
                        msg = B_MSG_STARTED_SUNLIGHT;
                        break;
                    case MOVE_EFFECT_RAIN:
                        weather = BATTLE_WEATHER_RAIN;
                        msg = B_MSG_STARTED_RAIN;
                        break;
                    case MOVE_EFFECT_SANDSTORM:
                        weather = BATTLE_WEATHER_SANDSTORM;
                        msg = B_MSG_STARTED_SANDSTORM;
                        break;
                    case MOVE_EFFECT_HAIL:
                        if (B_PREFERRED_ICE_WEATHER == B_ICE_WEATHER_SNOW)
                        {
                            weather = BATTLE_WEATHER_SNOW;
                            msg = B_MSG_STARTED_SNOW;
                        }
                        else
                        {
                            weather = BATTLE_WEATHER_HAIL;
                            msg = B_MSG_STARTED_HAIL;
                        }
                        break;
                }
                if (TryChangeBattleWeather(gBattlerAttacker, weather, FALSE))
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = msg;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_EffectSetWeather;
                }
                break;
            }
            case MOVE_EFFECT_MISTY_TERRAIN:
            case MOVE_EFFECT_GRASSY_TERRAIN:
            case MOVE_EFFECT_ELECTRIC_TERRAIN:
            case MOVE_EFFECT_PSYCHIC_TERRAIN:
            {
                u32 statusFlag = 0;
                switch (gBattleScripting.moveEffect)
                {
                    case MOVE_EFFECT_MISTY_TERRAIN:
                        statusFlag = STATUS_FIELD_MISTY_TERRAIN;
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_SET_MISTY;
                        break;
                    case MOVE_EFFECT_GRASSY_TERRAIN:
                        statusFlag = STATUS_FIELD_GRASSY_TERRAIN;
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_SET_GRASSY;
                        break;
                    case MOVE_EFFECT_ELECTRIC_TERRAIN:
                        statusFlag = STATUS_FIELD_ELECTRIC_TERRAIN;
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_SET_ELECTRIC;
                        break;
                    case MOVE_EFFECT_PSYCHIC_TERRAIN:
                        statusFlag = STATUS_FIELD_PSYCHIC_TERRAIN;
                        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_SET_PSYCHIC;
                        break;
                }
                if (!(gFieldStatuses & statusFlag) && statusFlag != 0)
                {
                    gFieldStatuses &= ~STATUS_FIELD_TERRAIN_ANY;
                    gFieldStatuses |= statusFlag;
                    if (GetBattlerHoldEffect(gBattlerAttacker, TRUE) == HOLD_EFFECT_TERRAIN_EXTENDER)
                        gFieldTimers.terrainTimer = gBattleTurnCounter + 8;
                    else
                        gFieldTimers.terrainTimer = gBattleTurnCounter + 5;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_EffectSetTerrain;
                }
                break;
            }
            case MOVE_EFFECT_VINE_LASH:
            case MOVE_EFFECT_CANNONADE:
            case MOVE_EFFECT_WILDFIRE:
            case MOVE_EFFECT_VOLCALITH:
            {
                u8 side = GetBattlerSide(gBattlerTarget);
                if (!(gSideStatuses[side] & SIDE_STATUS_DAMAGE_NON_TYPES))
                {
                    u32 moveType = GetMoveType(gCurrentMove);
                    gSideStatuses[side] |= SIDE_STATUS_DAMAGE_NON_TYPES;
                    gSideTimers[side].damageNonTypesTimer = gBattleTurnCounter + 5; // damage is dealt for 4 turns, ends on 5th
                    gSideTimers[side].damageNonTypesType = moveType;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    ChooseDamageNonTypesString(moveType);
                    gBattlescriptCurrInstr = BattleScript_DamageNonTypesStarts;
                }
                break;
            }
            case MOVE_EFFECT_STEELSURGE:
                if (!(gSideStatuses[GetBattlerSide(gBattlerTarget)] & SIDE_STATUS_STEELSURGE))
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SHARPSTEELFLOATS;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_EffectSteelsurge;
                }
                break;
            case MOVE_EFFECT_DEFOG:
                if (gSideStatuses[GetBattlerSide(gBattlerTarget)] & SIDE_STATUS_SCREEN_ANY
                    || gSideStatuses[GetBattlerSide(gBattlerTarget)] & SIDE_STATUS_HAZARDS_ANY
                    || gSideStatuses[GetBattlerSide(gBattlerAttacker)] & SIDE_STATUS_HAZARDS_ANY
                    || gFieldStatuses & STATUS_FIELD_TERRAIN_ANY)
                {
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_DefogTryHazards;
                }
                break;
            case MOVE_EFFECT_AURORA_VEIL:
                if (!(gSideStatuses[GetBattlerSide(gBattlerAttacker)] & SIDE_STATUS_AURORA_VEIL))
                {
                    gSideStatuses[GetBattlerSide(gBattlerAttacker)] |= SIDE_STATUS_AURORA_VEIL;
                    if (GetBattlerHoldEffect(gBattlerAttacker, TRUE) == HOLD_EFFECT_LIGHT_CLAY)
                        gSideTimers[GetBattlerSide(gBattlerAttacker)].auroraVeilTimer = gBattleTurnCounter + 8;
                    else
                        gSideTimers[GetBattlerSide(gBattlerAttacker)].auroraVeilTimer = gBattleTurnCounter + 5;
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_SAFEGUARD;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_EffectAuroraVeilSuccess;
                }
                break;
            case MOVE_EFFECT_GRAVITY:
                if (!(gFieldStatuses & STATUS_FIELD_GRAVITY))
                {
                    gFieldStatuses |= STATUS_FIELD_GRAVITY;
                    gFieldTimers.gravityTimer = gBattleTurnCounter + 5;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_EffectGravitySuccess;
                }
                break;
            case MOVE_EFFECT_SANDBLAST_SIDE:
            case MOVE_EFFECT_FIRE_SPIN_SIDE:
            {
                // Affects both opponents, but doesn't print strings so we can handle it here.
                u8 battler;
                for (battler = 0; battler < MAX_BATTLERS_COUNT; ++battler)
                {
                    if (!IsBattlerAlly(battler, gBattlerTarget))
                        continue;
                    if (!(gBattleMons[battler].status2 & STATUS2_WRAPPED))
                    {
                        gBattleMons[battler].status2 |= STATUS2_WRAPPED;
                        if (GetBattlerHoldEffect(gBattlerAttacker, TRUE) == HOLD_EFFECT_GRIP_CLAW)
                            gDisableStructs[battler].wrapTurns = (B_BINDING_TURNS >= GEN_5) ? 7 : 5;
                        else
                            gDisableStructs[battler].wrapTurns = (Random() % 2) + 4;
                        // The Wrap effect does not expire when the user switches, so here's some cheese.
                        gBattleStruct->wrappedBy[battler] = gBattlerTarget;
                        if (gBattleScripting.moveEffect == MOVE_EFFECT_SANDBLAST_SIDE)
                            gBattleStruct->wrappedMove[battler] = MOVE_SAND_TOMB;
                        else
                            gBattleStruct->wrappedMove[battler] = MOVE_FIRE_SPIN;
                    }
                }
                break;
            }
            case MOVE_EFFECT_YAWN_FOE:
            {
                if (!(gStatuses3[gBattlerTarget] & STATUS3_YAWN)
                    && CanBeSlept(gBattlerTarget, gBattlerTarget, GetBattlerAbility(gBattlerTarget), BLOCKED_BY_SLEEP_CLAUSE)
                    && RandomPercentage(RNG_G_MAX_SNOOZE, 50))
                {
                    gStatuses3[gBattlerTarget] |= STATUS3_YAWN_TURN(2);
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_EffectYawnSuccess;
                }
                break;
            }
            case MOVE_EFFECT_SPITE:
                if (gLastMoves[gBattlerTarget] != MOVE_NONE
                    && gLastMoves[gBattlerTarget] != MOVE_UNAVAILABLE)
                {
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_EffectTryReducePP;
                }
                break;
            case MOVE_EFFECT_PARALYZE_SIDE:
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_EffectParalyzeSide;
                break;
            case MOVE_EFFECT_POISON_SIDE:
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_EffectPoisonSide;
                break;
            case MOVE_EFFECT_POISON_PARALYZE_SIDE:
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_EffectPoisonParalyzeSide;
                break;
            case MOVE_EFFECT_EFFECT_SPORE_SIDE:
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_EffectEffectSporeSide;
                break;
            case MOVE_EFFECT_CONFUSE_PAY_DAY_SIDE:
                if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
                {
                    u32 payday = gPaydayMoney;
                    gPaydayMoney += (gBattleMons[gBattlerAttacker].level * 100);
                    if (payday > gPaydayMoney)
                        gPaydayMoney = 0xFFFF;
                    gBattleCommunication[CURSOR_POSITION] = 1; // add "Coins scattered." message
                }
                // fall through
            case MOVE_EFFECT_CONFUSE_SIDE:
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_EffectConfuseSide;
                break;
            case MOVE_EFFECT_INFATUATE_SIDE:
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_EffectInfatuateSide;
                break;
            case MOVE_EFFECT_TORMENT_SIDE:
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_EffectTormentSide;
                break;
            case MOVE_EFFECT_PREVENT_ESCAPE_SIDE:
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_EffectMeanLookSide;
                break;
            case MOVE_EFFECT_CRIT_PLUS_SIDE:
                gBattleStruct->bonusCritStages[gBattlerAttacker]++;
                gBattleStruct->bonusCritStages[BATTLE_PARTNER(gBattlerAttacker)]++;
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_EffectRaiseCritAlliesAnim;
                break;
            case MOVE_EFFECT_HEAL_TEAM:
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_EffectHealOneSixthAllies;
                break;
            case MOVE_EFFECT_AROMATHERAPY:
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_EffectHealBell_FromHeal;
                break;
            case MOVE_EFFECT_RECYCLE_BERRIES:
            {
                if (RandomPercentage(RNG_G_MAX_REPLENISH, 50))
                {
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_EffectRecycleBerriesAllies;
                }
                break;
            }
            case MOVE_EFFECT_REMOVE_STATUS:
            {
                u32 argStatus = GetMoveEffectArg_Status(gCurrentMove);
                if ((gBattleMons[gEffectBattler].status1 & argStatus)
                 && (NumAffectedSpreadMoveTargets() > 1 || !IsMoveEffectBlockedByTarget(GetBattlerAbility(gEffectBattler))))
                {
                    gBattleMons[gEffectBattler].status1 &= ~(argStatus);
                    BtlController_EmitSetMonData(gEffectBattler, 0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gEffectBattler].status1);
                    MarkBattlerForControllerExec(gEffectBattler);
                    BattleScriptPush(gBattlescriptCurrInstr + 1);

                    switch (argStatus)
                    {
                    case STATUS1_PARALYSIS:
                        gBattlescriptCurrInstr = BattleScript_TargetPRLZHeal;
                        break;
                    case STATUS1_SLEEP:
                        TryDeactivateSleepClause(GetBattlerSide(gEffectBattler), gBattlerPartyIndexes[gBattlerTarget]);
                        gBattlescriptCurrInstr = BattleScript_TargetWokeUp;
                        break;
                    case STATUS1_BURN:
                        gBattlescriptCurrInstr = BattleScript_TargetBurnHeal;
                        break;
                    case STATUS1_FREEZE:
                        gBattlescriptCurrInstr = BattleScript_DefrostedViaFireMove;
                        break;
                    case STATUS1_FROSTBITE:
                        gBattlescriptCurrInstr = BattleScript_FrostbiteHealedViaFireMove;
                        break;
                    case STATUS1_POISON:
                    case STATUS1_TOXIC_POISON:
                    case STATUS1_PSN_ANY:
                        gBattlescriptCurrInstr = BattleScript_TargetPoisonHealed;
                        break;
                    }
                }
                break;
            }
            }
        }
    }

    gBattleScripting.moveEffect = 0;
}

static bool32 CanApplyAdditionalEffect(const struct AdditionalEffect *additionalEffect)
{
    if (additionalEffect->self
     && NumAffectedSpreadMoveTargets() > 1
     && GetNextTarget(GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove), TRUE) != MAX_BATTLERS_COUNT)
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

    if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT))
    {
        u32 numAdditionalEffects = GetMoveAdditionalEffectCount(gCurrentMove);
        if (numAdditionalEffects > gBattleStruct->additionalEffectsCounter)
        {
            u32 percentChance;
            const struct AdditionalEffect *additionalEffect = GetMoveAdditionalEffectById(gCurrentMove, gBattleStruct->additionalEffectsCounter);
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
            if (numAdditionalEffects > gBattleStruct->additionalEffectsCounter)
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

    u32 battler = GetBattlerForBattleScript(cmd->battler);

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

    battler = GetBattlerForBattleScript(cmd->battler);
    if (cmd->isSpikes != 0)
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
        if (gBattleMons[battler].ability == ABILITY_NEUTRALIZING_GAS
         && !(gAbsentBattlerFlags & (1u << battler))
         && !IsBattlerAlive(battler))
        {
            gBattleMons[battler].ability = ABILITY_NONE;
            BattleScriptPush(gBattlescriptCurrInstr);
            gBattlescriptCurrInstr = BattleScript_NeutralizingGasExits;
            return;
        }
        if (cmd->battler == BS_ATTACKER)
        {
            destinyBondBattler = gBattlerTarget;
            faintScript = BattleScript_FaintAttacker;
        }
        else
        {
            destinyBondBattler = gBattlerAttacker;
            faintScript = BattleScript_FaintTarget;
        }
        if (!(gAbsentBattlerFlags & (1u << battler))
         && !IsBattlerAlive(battler))
        {
            gHitMarker |= HITMARKER_FAINTED(battler);
            BattleScriptPush(cmd->nextInstr);
            gBattlescriptCurrInstr = faintScript;
            if (IsOnPlayerSide(battler))
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
                gBattleResults.lastOpponentSpecies = GetMonData(GetBattlerMon(battler), MON_DATA_SPECIES, NULL);
                gSideTimers[B_SIDE_OPPONENT].retaliateTimer = 2;
            }
            if ((gHitMarker & HITMARKER_DESTINYBOND) && IsBattlerAlive(gBattlerAttacker)
                 && !(GetActiveGimmick(gBattlerAttacker) == GIMMICK_DYNAMAX))
            {
                gHitMarker &= ~HITMARKER_DESTINYBOND;
                BattleScriptPush(gBattlescriptCurrInstr);
                gBattleStruct->moveDamage[destinyBondBattler] = gBattleMons[destinyBondBattler].hp;
                gBattlescriptCurrInstr = BattleScript_DestinyBondTakesLife;
            }
            if ((gStatuses3[gBattlerTarget] & STATUS3_GRUDGE)
             && !(gHitMarker & HITMARKER_GRUDGE)
             && !IsBattlerAlly(gBattlerAttacker, gBattlerTarget)
             && IsBattlerAlive(gBattlerAttacker)
             && gCurrentMove != MOVE_STRUGGLE)
            {
                u8 moveIndex = gBattleStruct->chosenMovePositions[gBattlerAttacker];

                gBattleMons[gBattlerAttacker].pp[moveIndex] = 0;
                BattleScriptPush(gBattlescriptCurrInstr);
                gBattlescriptCurrInstr = BattleScript_GrudgeTakesPp;
                BtlController_EmitSetMonData(gBattlerAttacker, B_COMM_TO_CONTROLLER, moveIndex + REQUEST_PPMOVE1_BATTLE, 0, sizeof(gBattleMons[gBattlerAttacker].pp[moveIndex]), &gBattleMons[gBattlerAttacker].pp[moveIndex]);
                MarkBattlerForControllerExec(gBattlerAttacker);

                PREPARE_MOVE_BUFFER(gBattleTextBuff1, gBattleMons[gBattlerAttacker].moves[moveIndex])
            }

            TryDeactivateSleepClause(GetBattlerSide(battler), gBattlerPartyIndexes[battler]);
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

    if (gBattleControllerExecFlags != 0)
        return;

    u32 battler = GetBattlerForBattleScript(cmd->battler);

    if (GetActiveGimmick(battler) == GIMMICK_DYNAMAX)
    {
        BattleScriptPushCursor();
        UndoDynamax(battler);
        gBattleScripting.battler = battler;
        gBattlescriptCurrInstr = BattleScript_DynamaxEnds_Ret;
        return;
    }

    BtlController_EmitFaintAnimation(battler, B_COMM_TO_CONTROLLER);
    MarkBattlerForControllerExec(battler);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_cleareffectsonfaint(void)
{
    CMD_ARGS(u8 battler);

    if (gBattleControllerExecFlags == 0)
    {
        u32 battler = GetBattlerForBattleScript(cmd->battler);
        const u8 *clearDataResult = NULL;
        if (!(gBattleTypeFlags & BATTLE_TYPE_ARENA) || !IsBattlerAlive(battler))
        {
            gBattleMons[battler].status1 = 0;
            BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[battler].status1), &gBattleMons[battler].status1);
            MarkBattlerForControllerExec(battler);
        }

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

    if (gBattleMons[battler].status1 & flags && IsBattlerAlive(battler))
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

    if (gBattleMons[battler].status2 & flags && IsBattlerAlive(battler))
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
    if (RECORDED_WILD_BATTLE)
        return TRUE;
    else if (gBattleTypeFlags &
              ( BATTLE_TYPE_LINK
              | BATTLE_TYPE_RECORDED_LINK
              | BATTLE_TYPE_TRAINER_HILL
              | BATTLE_TYPE_FRONTIER
              | BATTLE_TYPE_SAFARI
              | BATTLE_TYPE_BATTLE_TOWER
              | BATTLE_TYPE_EREADER_TRAINER))
        return FALSE;
    else
        return TRUE;
}

static u32 GetMonHoldEffect(struct Pokemon *mon)
{
    enum ItemHoldEffect holdEffect;
    u32 item = GetMonData(mon, MON_DATA_HELD_ITEM);

    if (item == ITEM_ENIGMA_BERRY_E_READER)
    #if FREE_ENIGMA_BERRY == FALSE
        holdEffect = gSaveBlock1Ptr->enigmaBerry.holdEffect;
    #else
        holdEffect = 0;
    #endif //FREE_ENIGMA_BERRY
    else
        holdEffect = GetItemHoldEffect(item);

    return holdEffect;
}

static void Cmd_getexp(void)
{
    CMD_ARGS(u8 battler);

    enum ItemHoldEffect holdEffect;
    s32 i; // also used as stringId
    u8 *expMonId = &gBattleStruct->expGetterMonId;
    u32 currLvl;

    gBattlerFainted = GetBattlerForBattleScript(cmd->battler);

    switch (gBattleScripting.getexpState)
    {
    case 0: // check if should receive exp at all
        if (IsOnPlayerSide(gBattlerFainted)
            || IsAiVsAiBattle()
            || !BattleTypeAllowsExp())
        {
            gBattleScripting.getexpState = 6; // goto last case
        }
        else
        {
            gBattleScripting.getexpState++;
            gBattleStruct->givenExpMons |= (1u << gBattlerPartyIndexes[gBattlerFainted]);
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
                if ((1u << i) & sentInBits)
                    viaSentIn++;

                holdEffect = GetMonHoldEffect(&gPlayerParty[i]);
                if (holdEffect == HOLD_EFFECT_EXP_SHARE || IsGen6ExpShareEnabled())
                {
                    expShareBits |= 1u << i;
                    viaExpShare++;
                }
            }
            // Get order of mons getting exp: 1. all mons via sent in, 2. all mons via exp share
            for (i = 0; i < PARTY_SIZE; i++)
            {
                if ((1u << i) & sentInBits)
                    gBattleStruct->expGettersOrder[orderId++] = i;
            }
            for (i = 0; i < PARTY_SIZE; i++)
            {
                if (!((1u << i) & sentInBits) && (1u << i) & expShareBits)
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
            bool32 wasSentOut = (gBattleStruct->expSentInMons & (1u << *expMonId)) != 0;
            holdEffect = GetMonHoldEffect(&gPlayerParty[*expMonId]);

            if ((holdEffect != HOLD_EFFECT_EXP_SHARE && !wasSentOut && !IsGen6ExpShareEnabled())
             || GetMonData(&gPlayerParty[*expMonId], MON_DATA_SPECIES_OR_EGG) == SPECIES_EGG)
            {
                gBattleScripting.getexpState = 5;
                gBattleStruct->battlerExpReward = 0;
            }
            else if ((gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER && *expMonId >= 3)
                  || GetMonData(&gPlayerParty[*expMonId], MON_DATA_LEVEL) == MAX_LEVEL)
            {
                gBattleScripting.getexpState = 5;
                gBattleStruct->battlerExpReward = 0;
                if (B_MAX_LEVEL_EV_GAINS >= GEN_5)
                    MonGainEVs(&gPlayerParty[*expMonId], gBattleMons[gBattlerFainted].species);
            }
            else
            {
                // Music change in a wild battle after fainting opposing pokemon.
                if (!(gBattleTypeFlags & BATTLE_TYPE_TRAINER)
                    && (gBattleMons[0].hp || (IsDoubleBattle() && gBattleMons[2].hp))
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
                        gBattleStruct->battlerExpReward = GetSoftLevelCapExpValue(gPlayerParty[*expMonId].level, gBattleStruct->expValue);
                    else
                        gBattleStruct->battlerExpReward = 0;

                    if ((holdEffect == HOLD_EFFECT_EXP_SHARE || IsGen6ExpShareEnabled())
                        && (B_SPLIT_EXP < GEN_6 || gBattleStruct->battlerExpReward == 0)) // only give exp share bonus in later gens if the mon wasn't sent out
                    {
                        gBattleStruct->battlerExpReward += GetSoftLevelCapExpValue(gPlayerParty[*expMonId].level, gBattleStruct->expShareExpValue);;
                    }

                    ApplyExperienceMultipliers(&gBattleStruct->battlerExpReward, *expMonId, gBattlerFainted);

                    if (B_EXP_CAP_TYPE == EXP_CAP_HARD && gBattleStruct->battlerExpReward != 0)
                    {
                        u32 growthRate = gSpeciesInfo[GetMonData(&gPlayerParty[*expMonId], MON_DATA_SPECIES)].growthRate;
                        u32 currentExp = GetMonData(&gPlayerParty[*expMonId], MON_DATA_EXP);
                        u32 levelCap = GetCurrentLevelCap();

                        if (GetMonData(&gPlayerParty[*expMonId], MON_DATA_LEVEL) >= levelCap)
                            gBattleStruct->battlerExpReward = 0;
                        else if (gExperienceTables[growthRate][levelCap] < currentExp + gBattleStruct->battlerExpReward)
                            gBattleStruct->battlerExpReward = gExperienceTables[growthRate][levelCap] - currentExp;
                    }

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
                    if (IsDoubleBattle())
                    {
                        if (gBattlerPartyIndexes[2] == *expMonId && !(gAbsentBattlerFlags & 4))
                            gBattleStruct->expGetterBattlerId = 2;
                        else if (!(gAbsentBattlerFlags & 1))
                            gBattleStruct->expGetterBattlerId = 0;
                        else
                            gBattleStruct->expGetterBattlerId = 2;
                    }
                    else
                    {
                        gBattleStruct->expGetterBattlerId = 0;
                    }

                    PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, gBattleStruct->expGetterBattlerId, *expMonId);
                    // buffer 'gained' or 'gained a boosted'
                    PREPARE_STRING_BUFFER(gBattleTextBuff2, i);
                    PREPARE_WORD_NUMBER_BUFFER(gBattleTextBuff3, 6, gBattleStruct->battlerExpReward);

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
            gBattleResources->bufferB[gBattleStruct->expGetterBattlerId][0] = 0;
            currLvl = GetMonData(&gPlayerParty[*expMonId], MON_DATA_LEVEL);
            if (GetMonData(&gPlayerParty[*expMonId], MON_DATA_HP) && currLvl != MAX_LEVEL)
            {
                gBattleResources->beforeLvlUp->stats[STAT_HP]    = GetMonData(&gPlayerParty[*expMonId], MON_DATA_MAX_HP);
                gBattleResources->beforeLvlUp->stats[STAT_ATK]   = GetMonData(&gPlayerParty[*expMonId], MON_DATA_ATK);
                gBattleResources->beforeLvlUp->stats[STAT_DEF]   = GetMonData(&gPlayerParty[*expMonId], MON_DATA_DEF);
                gBattleResources->beforeLvlUp->stats[STAT_SPEED] = GetMonData(&gPlayerParty[*expMonId], MON_DATA_SPEED);
                gBattleResources->beforeLvlUp->stats[STAT_SPATK] = GetMonData(&gPlayerParty[*expMonId], MON_DATA_SPATK);
                gBattleResources->beforeLvlUp->stats[STAT_SPDEF] = GetMonData(&gPlayerParty[*expMonId], MON_DATA_SPDEF);
                gBattleResources->beforeLvlUp->level             = currLvl;
                gBattleResources->beforeLvlUp->learnMultipleMoves = FALSE;

                BtlController_EmitExpUpdate(gBattleStruct->expGetterBattlerId, B_COMM_TO_CONTROLLER, *expMonId, gBattleStruct->battlerExpReward);
                MarkBattlerForControllerExec(gBattleStruct->expGetterBattlerId);
            }
            gBattleScripting.getexpState++;
        }
        break;
    case 4: // lvl up if necessary
        if (gBattleControllerExecFlags == 0)
        {
            u32 expBattler = gBattleStruct->expGetterBattlerId;
            if (gBattleResources->bufferB[expBattler][0] == CONTROLLER_TWORETURNVALUES && gBattleResources->bufferB[expBattler][1] == RET_VALUE_LEVELED_UP)
            {
                u16 temp, battler = 0xFF;
                if (gBattleTypeFlags & BATTLE_TYPE_TRAINER && gBattlerPartyIndexes[expBattler] == *expMonId)
                    HandleLowHpMusicChange(GetBattlerMon(expBattler), expBattler);

                PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, expBattler, *expMonId);
                PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff2, 3, GetMonData(&gPlayerParty[*expMonId], MON_DATA_LEVEL));

                BattleScriptPushCursor();
                gLeveledUpInBattle |= 1 << *expMonId;
                gBattlescriptCurrInstr = BattleScript_LevelUp;
                gBattleStruct->battlerExpReward = T1_READ_32(&gBattleResources->bufferB[expBattler][2]);
                AdjustFriendship(&gPlayerParty[*expMonId], FRIENDSHIP_EVENT_GROW_LEVEL);

                // update battle mon structure after level up
                if (gBattlerPartyIndexes[0] == *expMonId && gBattleMons[0].hp)
                    battler = 0;
                else if (gBattlerPartyIndexes[2] == *expMonId && gBattleMons[2].hp && (IsDoubleBattle()))
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
                gBattleStruct->battlerExpReward = 0;
                gBattleScripting.getexpState = 5;
            }
        }
        break;
    case 5: // looper increment
        if (gBattleStruct->battlerExpReward) // there is exp to give, goto case 3 that gives exp
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

static u32 CountAliveMonsForBattlerSide(u32 battler)
{
    u32 aliveMons = 0;
    struct Pokemon *party = GetBattlerParty(battler);

    for (u32 partyMon = 0; partyMon < PARTY_SIZE; partyMon++)
    {
        if (GetMonData(&party[partyMon], MON_DATA_SPECIES)
         && GetMonData(&party[partyMon], MON_DATA_HP) > 0
         && !GetMonData(&party[partyMon], MON_DATA_IS_EGG))
            aliveMons++;
    }

    return aliveMons;
}

bool32 NoAliveMonsForBattlerSide(u32 battler)
{
    return CountAliveMonsForBattlerSide(battler) == 0;
}

bool32 NoAliveMonsForPlayer(void)
{
    u32 i;
    u32 maxI = PARTY_SIZE;
    u32 HP_count = 0;
    u32 ineligibleMonsCount = 0;

    if (B_MULTI_BATTLE_WHITEOUT < GEN_4 && gBattleTypeFlags & (BATTLE_TYPE_MULTI | BATTLE_TYPE_INGAME_PARTNER))
        maxI = MULTI_PARTY_SIZE;

    // Get total HP for the player's party to determine if the player has lost
    for (i = 0; i < maxI; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) && !GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG)
            && (!(gBattleTypeFlags & BATTLE_TYPE_ARENA) || !(gBattleStruct->arenaLostPlayerMons & (1u << i))))
        {
            HP_count += GetMonData(&gPlayerParty[i], MON_DATA_HP);
        }

        // Get the number of fainted mons or eggs (not empty slots) in the first three party slots.
        if (i < 3 && ((GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) && !GetMonData(&gPlayerParty[i], MON_DATA_HP))
         || GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG)))
            ineligibleMonsCount++;
    }

    // Get the number of inelligible slots in the saved player party.
    if (B_MULTI_BATTLE_WHITEOUT > GEN_3 && gBattleTypeFlags & (BATTLE_TYPE_MULTI | BATTLE_TYPE_INGAME_PARTNER)
     && !(gBattleTypeFlags & BATTLE_TYPE_ARENA))
    {
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (!GetMonData(&gSaveBlock1Ptr->playerParty[i], MON_DATA_SPECIES)
             || !GetMonData(&gSaveBlock1Ptr->playerParty[i], MON_DATA_HP)
             || GetMonData(&gSaveBlock1Ptr->playerParty[i], MON_DATA_IS_EGG))
                ineligibleMonsCount++;
        }

        // If the total number of ineligible mons is 6 or more, lose the battle.
        if (ineligibleMonsCount >= 6)
            return TRUE;
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
        if (GetMonData(&gEnemyParty[i], MON_DATA_SPECIES) && !GetMonData(&gEnemyParty[i], MON_DATA_IS_EGG)
         && (!(gBattleTypeFlags & BATTLE_TYPE_ARENA) || !(gBattleStruct->arenaLostOpponentMons & (1u << i))))
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

// For battles that aren't BATTLE_TYPE_LINK or BATTLE_TYPE_RECORDED_LINK or trainer battles, the only thing this
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

    // Fair switching - everyone has to switch in most at the same time, without knowing which pokemon the other trainer selected.
    // In vanilla Emerald this was only used for link battles, in expansion it's also used for regular trainer battles.
    // For battles that haven't ended, count number of empty battler spots
    // In multi battles, jump to pointer if more than 1 spot empty
    // In non-multi battles, jump to pointer if 1 spot is missing on both sides
    if (gBattleOutcome == 0 && (gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_RECORDED_LINK | BATTLE_TYPE_TRAINER)))
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
            u32 occupiedPlayerSpots = (gBattlersCount / 2) - emptyPlayerSpots;
            u32 occupiedOpponentSpots = (gBattlersCount / 2) - emptyOpponentSpots;
            u32 alivePlayerPartyMons = CountAliveMonsForBattlerSide(B_POSITION_PLAYER_LEFT) - occupiedPlayerSpots;
            u32 aliveOpponentPartyMons = CountAliveMonsForBattlerSide(B_POSITION_OPPONENT_LEFT) - occupiedOpponentSpots;

            if (emptyPlayerSpots > 0 && alivePlayerPartyMons > 0 && emptyOpponentSpots > 0 && aliveOpponentPartyMons > 0)
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
    gBattleScripting.moveEffect = 0;
    gBattleCommunication[MISS_TYPE] = 0;
    if (!gMultiHitCounter)
        gHitMarker &= ~HITMARKER_DESTINYBOND;
    gHitMarker &= ~HITMARKER_SYNCHRONIZE_EFFECT;
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
        if (gTestRunnerHeadless)
            gPauseCounterBattle = value;
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

static void Cmd_absorb(void)
{
    CMD_ARGS(u8 battler);

    if (gBattleControllerExecFlags)
        return;

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    BtlController_EmitHealthBarUpdate(battler, B_COMM_TO_CONTROLLER, gBattleStruct->moveDamage[battler]);
    MarkBattlerForControllerExec(battler);

    if (IsOnPlayerSide(battler) && gBattleStruct->moveDamage[battler] > 0)
        gBattleResults.playerMonWasDamaged = TRUE;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_return(void)
{
    BattleScriptPop();
}

static void Cmd_end(void)
{
    CMD_ARGS();

    // if (gBattleTypeFlags & BATTLE_TYPE_ARENA)
    //     BattleArena_AddSkillPoints(gBattlerAttacker);

    gCurrentActionFuncId = B_ACTION_TRY_FINISH;
}

static void Cmd_end2(void)
{
    CMD_ARGS();

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

    gDisableStructs[gBattlerAttacker].roostActive = TRUE;
    gBattleStruct->roostTypes[gBattlerAttacker][0] = gBattleMons[gBattlerAttacker].types[0];
    gBattleStruct->roostTypes[gBattlerAttacker][1] = gBattleMons[gBattlerAttacker].types[1];

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

    if (animId == B_ANIM_STATS_CHANGE
     || animId == B_ANIM_SNATCH_MOVE
     || animId == B_ANIM_MEGA_EVOLUTION
     || animId == B_ANIM_ILLUSION_OFF
     || animId == B_ANIM_FORM_CHANGE
     || animId == B_ANIM_SUBSTITUTE_FADE
     || animId == B_ANIM_PRIMAL_REVERSION
     || animId == B_ANIM_ULTRA_BURST
     || animId == B_ANIM_TERA_CHARGE
     || animId == B_ANIM_TERA_ACTIVATE)
    {
        BtlController_EmitBattleAnimation(battler, B_COMM_TO_CONTROLLER, animId, &gDisableStructs[battler], *argPtr);
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
          || animId == B_ANIM_SNOW_CONTINUES
          || animId == B_ANIM_FOG_CONTINUES)
    {
        BtlController_EmitBattleAnimation(battler, B_COMM_TO_CONTROLLER, animId, &gDisableStructs[battler], *argPtr);
        MarkBattlerForControllerExec(battler);
        gBattlescriptCurrInstr = nextInstr;
    }
    else if (gStatuses3[battler] & STATUS3_SEMI_INVULNERABLE)
    {
        gBattlescriptCurrInstr = nextInstr;
    }
    else
    {
        BtlController_EmitBattleAnimation(battler, B_COMM_TO_CONTROLLER, animId, &gDisableStructs[battler], *argPtr);
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
    CMD_ARGS(u8 battler, u8 stats, u8 flags);

    u32 currStat = 0;
    u32 statAnimId = 0;
    u32 changeableStatsCount = 0;
    u32 startingStatAnimId = 0;
    u32 flags = cmd->flags;
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    u32 ability = GetBattlerAbility(battler);
    u32 stats = cmd->stats;

    // Handle Contrary and Simple
    if (ability == ABILITY_CONTRARY)
    {
        flags ^= STAT_CHANGE_NEGATIVE;
        RecordAbilityBattle(battler, ability);
    }
    else if (ability == ABILITY_SIMPLE)
    {
        flags |= STAT_CHANGE_BY_TWO;
        RecordAbilityBattle(battler, ability);
    }

    if (flags & STAT_CHANGE_NEGATIVE) // goes down
    {
        if (flags & STAT_CHANGE_BY_TWO)
            startingStatAnimId = STAT_ANIM_MINUS2;
        else
            startingStatAnimId = STAT_ANIM_MINUS1;

        while (stats != 0)
        {
            if (stats & 1)
            {
                if (flags & STAT_CHANGE_CANT_PREVENT)
                {
                    if (gBattleMons[battler].statStages[currStat] > MIN_STAT_STAGE)
                    {
                        statAnimId = startingStatAnimId + currStat;
                        changeableStatsCount++;
                    }
                }
                else if (!gSideTimers[GetBattlerSide(battler)].mistTimer
                        && GetBattlerHoldEffect(battler, TRUE) != HOLD_EFFECT_CLEAR_AMULET
                        && ability != ABILITY_CLEAR_BODY
                        && ability != ABILITY_FULL_METAL_BODY
                        && ability != ABILITY_WHITE_SMOKE
                        && !((ability == ABILITY_KEEN_EYE || ability == ABILITY_MINDS_EYE) && currStat == STAT_ACC)
                        && !(B_ILLUMINATE_EFFECT >= GEN_9 && ability == ABILITY_ILLUMINATE && currStat == STAT_ACC)
                        && !(ability == ABILITY_HYPER_CUTTER && currStat == STAT_ATK)
                        && !(ability == ABILITY_BIG_PECKS && currStat == STAT_DEF))
                {
                    if (gBattleMons[battler].statStages[currStat] > MIN_STAT_STAGE)
                    {
                        statAnimId = startingStatAnimId + currStat;
                        changeableStatsCount++;
                    }
                }
            }
            stats >>= 1, currStat++;
        }

        if (changeableStatsCount > 1) // more than one stat, so the color is gray
        {
            if (flags & STAT_CHANGE_BY_TWO)
                statAnimId = STAT_ANIM_MULTIPLE_MINUS2;
            else
                statAnimId = STAT_ANIM_MULTIPLE_MINUS1;
        }
    }
    else // goes up
    {
        if (flags & STAT_CHANGE_BY_TWO)
            startingStatAnimId = STAT_ANIM_PLUS2;
        else
            startingStatAnimId = STAT_ANIM_PLUS1;

        while (stats != 0)
        {
            if (stats & 1 && gBattleMons[battler].statStages[currStat] < MAX_STAT_STAGE)
            {
                statAnimId = startingStatAnimId + currStat;
                changeableStatsCount++;
            }
            stats >>= 1, currStat++;
        }

        if (changeableStatsCount > 1) // more than one stat, so the color is gray
        {
            if (flags & STAT_CHANGE_BY_TWO)
                statAnimId = STAT_ANIM_MULTIPLE_PLUS2;
            else
                statAnimId = STAT_ANIM_MULTIPLE_PLUS1;
        }
    }

    if (flags & STAT_CHANGE_MULTIPLE_STATS && changeableStatsCount < 2)
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else if (changeableStatsCount != 0 && !gBattleScripting.statAnimPlayed)
    {
        BtlController_EmitBattleAnimation(battler, B_COMM_TO_CONTROLLER, B_ANIM_STATS_CHANGE, &gDisableStructs[battler], statAnimId);
        MarkBattlerForControllerExec(battler);
        if (flags & STAT_CHANGE_MULTIPLE_STATS && changeableStatsCount > 1)
            gBattleScripting.statAnimPlayed = TRUE;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static bool32 TryKnockOffBattleScript(u32 battlerDef)
{
    if (gBattleMons[battlerDef].item != 0
        && CanBattlerGetOrLoseItem(battlerDef, gBattleMons[battlerDef].item)
        && !NoAliveMonsForEitherParty())
    {
        if (GetBattlerAbility(battlerDef) == ABILITY_STICKY_HOLD && IsBattlerAlive(battlerDef))
        {
            gBattlerAbility = battlerDef;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_StickyHoldActivates;
        }
        else
        {
            u32 side = GetBattlerSide(battlerDef);

            gLastUsedItem = gBattleMons[battlerDef].item;
            gBattleMons[battlerDef].item = 0;
            if (gBattleMons[battlerDef].ability != ABILITY_GORILLA_TACTICS)
                gBattleStruct->choicedMove[battlerDef] = 0;
            CheckSetUnburden(battlerDef);

            // In Gen 5+, Knock Off removes the target's item rather than rendering it unusable.
            if (B_KNOCK_OFF_REMOVAL >= GEN_5)
            {
                BtlController_EmitSetMonData(battlerDef, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[battlerDef].item), &gBattleMons[battlerDef].item);
                MarkBattlerForControllerExec(battlerDef);
            }
            else
            {
                gWishFutureKnock.knockedOffMons[side] |= 1u << gBattlerPartyIndexes[battlerDef];
            }

            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_KnockedOff;
        }
        return TRUE;
    }
    return FALSE;
}

static inline bool32 TryTriggerSymbiosis(u32 battler, u32 ally)
{
    return GetBattlerAbility(ally) == ABILITY_SYMBIOSIS
        && gBattleMons[battler].item == ITEM_NONE
        && gBattleMons[ally].item != ITEM_NONE
        && CanBattlerGetOrLoseItem(battler, gBattleMons[ally].item)
        && CanBattlerGetOrLoseItem(ally, gBattleMons[ally].item)
        && IsBattlerAlive(battler)
        && IsBattlerAlive(ally);
}

static u32 GetNextTarget(u32 moveTarget, bool32 excludeCurrent)
{
    u32 battler;
    for (battler = 0; battler < MAX_BATTLERS_COUNT; battler++)
    {
        if (battler != gBattlerAttacker
         && !(excludeCurrent && battler == gBattlerTarget)
         && IsBattlerAlive(battler)
         && !gBattleStruct->battlerState[gBattlerAttacker].targetsDone[battler]
         && (!IsBattlerAlly(battler, gBattlerAttacker) || moveTarget == MOVE_TARGET_FOES_AND_ALLY))
            break;
    }
    return battler;
}

static inline bool32 IsProtectivePadsProtected(u32 battler, enum ItemHoldEffect holdEffect)
{
    if (holdEffect != HOLD_EFFECT_PROTECTIVE_PADS)
        return FALSE;

    RecordItemEffectBattle(battler, holdEffect);
    return TRUE;
}

static inline bool32 IsProtectEffectAffected(u32 battler, u32 move)
{
    enum ItemHoldEffect holdEffect = GetBattlerHoldEffect(gBattlerAttacker, TRUE);
    if (IsProtectivePadsProtected(battler, holdEffect))
        return TRUE;

    if (holdEffect == HOLD_EFFECT_CLEAR_AMULET)
    {
        RecordItemEffectBattle(battler, holdEffect);
        return TRUE;
    }

    u32 ability = GetBattlerAbility(gBattlerAttacker);
    if (CanAbilityPreventStatLoss(ability))
    {
        RecordAbilityBattle(battler, ability);
        return TRUE;
    }

    return FALSE;
}

static inline bool32 CanEjectButtonTrigger(u32 battlerAtk, u32 battlerDef, enum BattleMoveEffects moveEffect)
{
    if (GetBattlerHoldEffect(battlerDef, TRUE) == HOLD_EFFECT_EJECT_BUTTON
     && battlerAtk != battlerDef
     && IsBattlerTurnDamaged(battlerDef)
     && IsBattlerAlive(battlerDef)
     && CountUsablePartyMons(battlerDef) > 0
     && !(moveEffect == EFFECT_HIT_SWITCH_TARGET && CanBattlerSwitch(battlerAtk)))
        return TRUE;

    return FALSE;
}

static inline bool32 CanEjectPackTrigger(u32 battlerAtk, u32 battlerDef, enum BattleMoveEffects moveEffect)
{
    if (gProtectStructs[battlerDef].statFell
     && GetBattlerHoldEffect(battlerDef, TRUE) == HOLD_EFFECT_EJECT_PACK
     && IsBattlerAlive(battlerDef)
     && CountUsablePartyMons(battlerDef) > 0
     && !gProtectStructs[battlerDef].disableEjectPack
     && !(moveEffect == EFFECT_HIT_SWITCH_TARGET && CanBattlerSwitch(battlerAtk))
     && !(moveEffect == EFFECT_PARTING_SHOT && CanBattlerSwitch(battlerAtk)))
        return TRUE;

    return FALSE;
}

static bool32 HandleMoveEndAbilityBlock(u32 battlerAtk, u32 battlerDef, u32 move)
{
    bool32 effect = FALSE;
    u32 abilityAtk = GetBattlerAbility(battlerAtk);

    switch (abilityAtk)
    {
    case ABILITY_MAGICIAN:
        if (move != MOVE_FLING && move != MOVE_NATURAL_GIFT
         && gBattleMons[battlerAtk].item == ITEM_NONE
         && gBattleMons[battlerDef].item != ITEM_NONE
         && IsBattlerAlive(battlerAtk)
         && IsBattlerTurnDamaged(battlerDef)
         && CanStealItem(battlerAtk, battlerDef, gBattleMons[battlerDef].item)
         && !gSpecialStatuses[battlerAtk].gemBoost   // In base game, gems are consumed after magician would activate.
         && !(gWishFutureKnock.knockedOffMons[GetBattlerSide(battlerDef)] & (1u << gBattlerPartyIndexes[battlerDef]))
         && !DoesSubstituteBlockMove(battlerAtk, battlerDef, move)
         && (GetBattlerAbility(battlerDef) != ABILITY_STICKY_HOLD || !IsBattlerAlive(battlerDef)))
        {
            StealTargetItem(battlerAtk, battlerDef);
            gBattleScripting.battler = gBattlerAbility = battlerAtk;
            gEffectBattler = battlerDef;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_MagicianActivates;
            effect = TRUE;
        }
        break;
    case ABILITY_MOXIE:
    case ABILITY_CHILLING_NEIGH:
    case ABILITY_AS_ONE_ICE_RIDER:
    case ABILITY_GRIM_NEIGH:
    case ABILITY_AS_ONE_SHADOW_RIDER:
    case ABILITY_BEAST_BOOST:
        {
            if (!IsBattlerAlive(battlerAtk) || NoAliveMonsForEitherParty())
                break;

            u32 stat = STAT_ATK;
            u32 numMonsFainted = NumFaintedBattlersByAttacker(battlerAtk);

            if (abilityAtk == ABILITY_BEAST_BOOST)
                stat = GetHighestStatId(battlerAtk);
            else if (abilityAtk == ABILITY_GRIM_NEIGH || abilityAtk == ABILITY_AS_ONE_SHADOW_RIDER)
                stat = STAT_SPATK;

            if (numMonsFainted && CompareStat(battlerAtk, stat, MAX_STAT_STAGE, CMP_LESS_THAN))
            {
                gLastUsedAbility = abilityAtk;
                if (abilityAtk == ABILITY_AS_ONE_ICE_RIDER)
                    gBattleScripting.abilityPopupOverwrite = gLastUsedAbility = ABILITY_CHILLING_NEIGH;
                else if (abilityAtk == ABILITY_AS_ONE_SHADOW_RIDER)
                    gBattleScripting.abilityPopupOverwrite = gLastUsedAbility = ABILITY_GRIM_NEIGH;

                SET_STATCHANGER(stat, numMonsFainted, FALSE);
                PREPARE_STAT_BUFFER(gBattleTextBuff1, stat);
                gBattleScripting.animArg1 = GET_STAT_BUFF_ID(stat) + (numMonsFainted > 1 ? STAT_ANIM_PLUS2 : STAT_ANIM_PLUS1);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_RaiseStatOnFaintingTarget;
                effect = TRUE;
            }
        }
        break;
    case ABILITY_BATTLE_BOND:
        {
            if (!IsBattlerAlive(battlerAtk)
             || NoAliveMonsForEitherParty()
             || NumFaintedBattlersByAttacker(battlerAtk) == 0)
                break;

            u32 side = GetBattlerSide(battlerAtk);

            if (gBattleStruct->partyState[side][gBattlerPartyIndexes[battlerAtk]].battleBondBoost)
                break;

            if (GetGenConfig(GEN_CONFIG_BATTLE_BOND) < GEN_9 && gBattleMons[battlerAtk].species == SPECIES_GRENINJA_BATTLE_BOND)
            {
                // TODO: Convert this to a proper FORM_CHANGE type.
                gLastUsedAbility = abilityAtk;
                gBattleStruct->partyState[side][gBattlerPartyIndexes[battlerAtk]].battleBondBoost = TRUE;
                PREPARE_SPECIES_BUFFER(gBattleTextBuff1, gBattleMons[battlerAtk].species);
                gBattleStruct->changedSpecies[side][gBattlerPartyIndexes[battlerAtk]] = gBattleMons[battlerAtk].species;
                gBattleMons[battlerAtk].species = SPECIES_GRENINJA_ASH;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_BattleBondActivatesOnMoveEndAttacker;
                effect = TRUE;
            }
            else
            {
                u32 numStatBuffs = 0;
                if (CompareStat(battlerAtk, STAT_ATK, MAX_STAT_STAGE, CMP_LESS_THAN))
                {
                    gBattleScripting.animArg1 = GET_STAT_BUFF_ID(STAT_ATK) + STAT_ANIM_PLUS1;
                    numStatBuffs++;
                }
                if (CompareStat(battlerAtk, STAT_SPATK, MAX_STAT_STAGE, CMP_LESS_THAN))
                {
                    gBattleScripting.animArg1 = GET_STAT_BUFF_ID(STAT_SPATK) + STAT_ANIM_PLUS1;
                    numStatBuffs++;
                }
                if (CompareStat(battlerAtk, STAT_SPEED, MAX_STAT_STAGE, CMP_LESS_THAN))
                {
                    gBattleScripting.animArg1 = GET_STAT_BUFF_ID(STAT_SPEED) + STAT_ANIM_PLUS1;
                    numStatBuffs++;
                }

                if (numStatBuffs > 0)
                {
                    if (numStatBuffs > 1)
                        gBattleScripting.animArg1 = STAT_ANIM_MULTIPLE_PLUS1;

                    gLastUsedAbility = abilityAtk;
                    gBattlerAbility = battlerAtk;
                    gBattleStruct->partyState[side][gBattlerPartyIndexes[battlerAtk]].battleBondBoost = TRUE;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_EffectBattleBondStatIncrease;
                    effect = TRUE;
                }
            }
        }
        break;
    }

    return effect;
}

static void Cmd_moveend(void)
{
    CMD_ARGS(u8 endMode, u8 endState);

    s32 i;
    bool32 effect = FALSE;
    u32 moveType = 0;
    enum ItemHoldEffect holdEffectAtk = HOLD_EFFECT_NONE;
    u32 endMode, endState;
    u32 originallyUsedMove;

    if (gChosenMove == MOVE_UNAVAILABLE)
        originallyUsedMove = MOVE_NONE;
    else
        originallyUsedMove = gChosenMove;

    endMode = cmd->endMode;
    endState = cmd->endState;

    holdEffectAtk = GetBattlerHoldEffect(gBattlerAttacker, TRUE);
    moveType = GetBattleMoveType(gCurrentMove);

    enum BattleMoveEffects moveEffect = GetMoveEffect(gCurrentMove);

    do
    {
        switch (gBattleScripting.moveendState)
        {
        case MOVEEND_SUM_DAMAGE: // Sum and store damage dealt for multi strike recoil
            gBattleScripting.savedDmg += gBattleStruct->moveDamage[gBattlerTarget];
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_PROTECT_LIKE_EFFECT:
            if (gProtectStructs[gBattlerAttacker].touchedProtectLike)
            {
                enum ProtectMethod method = gProtectStructs[gBattlerTarget].protected;
                switch (method)
                {
                case PROTECT_SPIKY_SHIELD:
                    if (moveEffect != EFFECT_COUNTER
                     && !IsProtectivePadsProtected(gBattlerAttacker, GetBattlerHoldEffect(gBattlerAttacker, TRUE))
                     && !IsMagicGuardProtected(gBattlerAttacker, GetBattlerAbility(gBattlerAttacker)))
                    {
                        gProtectStructs[gBattlerAttacker].touchedProtectLike = FALSE;
                        gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerAttacker) / 8;
                        if (gBattleStruct->moveDamage[gBattlerAttacker] == 0)
                            gBattleStruct->moveDamage[gBattlerAttacker] = 1;
                        PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_SPIKY_SHIELD);
                        BattleScriptPushCursor();
                        gBattlescriptCurrInstr = BattleScript_SpikyShieldEffect;
                        effect = 1;
                    }
                    break;
                case PROTECT_KINGS_SHIELD:
                    if (!IsProtectivePadsProtected(gBattlerAttacker, GetBattlerHoldEffect(gBattlerAttacker, TRUE)))
                    {
                        gProtectStructs[gBattlerAttacker].touchedProtectLike = FALSE;
                        i = gBattlerAttacker;
                        gBattlerAttacker = gBattlerTarget;
                        gBattlerTarget = i; // gBattlerTarget and gBattlerAttacker are swapped in order to activate Defiant, if applicable
                        if (B_KINGS_SHIELD_LOWER_ATK >= GEN_8)
                            gBattleScripting.moveEffect = MOVE_EFFECT_ATK_MINUS_1;
                        else
                            gBattleScripting.moveEffect = MOVE_EFFECT_ATK_MINUS_2;
                        BattleScriptPushCursor();
                        gBattlescriptCurrInstr = BattleScript_KingsShieldEffect;
                        effect = 1;
                    }
                    break;
                case PROTECT_BANEFUL_BUNKER:
                    if (!IsProtectivePadsProtected(gBattlerAttacker, GetBattlerHoldEffect(gBattlerAttacker, TRUE)))
                    {
                        gProtectStructs[gBattlerAttacker].touchedProtectLike = FALSE;
                        gBattleScripting.moveEffect = MOVE_EFFECT_POISON | MOVE_EFFECT_AFFECTS_USER;
                        PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_BANEFUL_BUNKER);
                        BattleScriptPushCursor();
                        gBattlescriptCurrInstr = BattleScript_BanefulBunkerEffect;
                        effect = 1;
                    }
                    break;
                case PROTECT_BURNING_BULWARK:
                    if (!IsProtectivePadsProtected(gBattlerAttacker, GetBattlerHoldEffect(gBattlerAttacker, TRUE)))
                    {
                        gProtectStructs[gBattlerAttacker].touchedProtectLike = FALSE;
                        gBattleScripting.moveEffect = MOVE_EFFECT_BURN | MOVE_EFFECT_AFFECTS_USER;
                        PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_BURNING_BULWARK);
                        BattleScriptPushCursor();
                        gBattlescriptCurrInstr = BattleScript_BanefulBunkerEffect;
                        effect = 1;
                    }
                    break;
                case PROTECT_OBSTRUCT:
                    if (moveEffect != EFFECT_SUCKER_PUNCH // Why???
                        && moveEffect != EFFECT_UPPER_HAND // Why???
                        && !IsProtectivePadsProtected(gBattlerAttacker, GetBattlerHoldEffect(gBattlerAttacker, TRUE)))
                    {
                        gProtectStructs[gBattlerAttacker].touchedProtectLike = FALSE;
                        i = gBattlerAttacker;
                        gBattlerAttacker = gBattlerTarget;
                        gBattlerTarget = i; // gBattlerTarget and gBattlerAttacker are swapped in order to activate Defiant, if applicable
                        gBattleScripting.moveEffect = MOVE_EFFECT_DEF_MINUS_2;
                        BattleScriptPushCursor();
                        gBattlescriptCurrInstr = BattleScript_KingsShieldEffect;
                        effect = 1;
                    }
                    break;
                case PROTECT_SILK_TRAP:
                    if (!IsProtectivePadsProtected(gBattlerAttacker, GetBattlerHoldEffect(gBattlerAttacker, TRUE)))
                    {
                        gProtectStructs[gBattlerAttacker].touchedProtectLike = FALSE;
                        i = gBattlerAttacker;
                        gBattlerAttacker = gBattlerTarget;
                        gBattlerTarget = i; // gBattlerTarget and gBattlerAttacker are swapped in order to activate Defiant, if applicable
                        gBattleScripting.moveEffect = MOVE_EFFECT_SPD_MINUS_1;
                        BattleScriptPushCursor();
                        gBattlescriptCurrInstr = BattleScript_KingsShieldEffect;
                        effect = 1;
                    }
                    break;
                default:
                    break;
                }

                // Not strictly a protect effect, but works the same way
                if (gProtectStructs[gBattlerTarget].beakBlastCharge
                 && CanBeBurned(gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerAttacker))
                 && !(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT))
                {
                    gProtectStructs[gBattlerAttacker].touchedProtectLike = FALSE;
                    gBattleMons[gBattlerAttacker].status1 = STATUS1_BURN;
                    BtlController_EmitSetMonData(gBattlerAttacker, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[gBattlerAttacker].status1), &gBattleMons[gBattlerAttacker].status1);
                    MarkBattlerForControllerExec(gBattlerAttacker);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_BeakBlastBurn;
                    effect = 1;
                }
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_ABSORB:
            if (moveEffect == EFFECT_ABSORB
             && !(gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE)
             && !(gStatuses3[gBattlerAttacker] & STATUS3_HEAL_BLOCK)
             && IsBattlerAlive(gBattlerAttacker)
             && IsBattlerTurnDamaged(gBattlerTarget))
            {
                gBattleStruct->moveDamage[gBattlerAttacker] = max(1, (gBattleStruct->moveDamage[gBattlerTarget] * GetMoveAbsorbPercentage(gCurrentMove) / 100));
                gBattleStruct->moveDamage[gBattlerAttacker] = GetDrainedBigRootHp(gBattlerAttacker, gBattleStruct->moveDamage[gBattlerAttacker]);
                gHitMarker |= HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_IGNORE_DISGUISE;
                effect = TRUE;
                if (GetBattlerAbility(gBattlerTarget) == ABILITY_LIQUID_OOZE)
                {
                    gBattleStruct->moveDamage[gBattlerAttacker] *= -1;
                    gHitMarker |= HITMARKER_PASSIVE_DAMAGE;
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABSORB_OOZE;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_EffectAbsorbLiquidOoze;
                }
                else
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ABSORB;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_EffectAbsorb;
                }
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_RAGE: // rage check
            if (gBattleMons[gBattlerTarget].status2 & STATUS2_RAGE
                && IsBattlerAlive(gBattlerTarget)
                && gBattlerAttacker != gBattlerTarget
                && !IsBattlerAlly(gBattlerAttacker, gBattlerTarget)
                && !(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
                && IsBattlerTurnDamaged(gBattlerTarget)
                && !IsBattleMoveStatus(gCurrentMove)
                && CompareStat(gBattlerTarget, STAT_ATK, MAX_STAT_STAGE, CMP_LESS_THAN))
            {
                SET_STATCHANGER(STAT_ATK, 1, FALSE);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_RageIsBuilding;
                effect = TRUE;
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_SYNCHRONIZE_TARGET: // target synchronize
            if (AbilityBattleEffects(ABILITYEFFECT_SYNCHRONIZE, gBattlerTarget, 0, 0, 0))
                effect = TRUE;
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_ABILITIES: // Such as abilities activating on contact(Poison Spore, Rough Skin, etc.).
            if (AbilityBattleEffects(ABILITYEFFECT_MOVE_END, gBattlerTarget, 0, 0, 0))
                effect = TRUE;
            else if (TryClearIllusion(gBattlerTarget, ABILITYEFFECT_MOVE_END))
                effect = TRUE;
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_ABILITIES_ATTACKER: // Poison Touch, possibly other in the future
            if (AbilityBattleEffects(ABILITYEFFECT_MOVE_END_ATTACKER, gBattlerAttacker, 0, 0, 0))
                effect = TRUE;
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_STATUS_IMMUNITY_ABILITIES: // status immunities
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
            {
                u16 *choicedMoveAtk = &gBattleStruct->choicedMove[gBattlerAttacker];
                if (gHitMarker & HITMARKER_OBEYS
                 && !(gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE)
                 && gChosenMove != MOVE_STRUGGLE
                 && (*choicedMoveAtk == MOVE_NONE || *choicedMoveAtk == MOVE_UNAVAILABLE)
                 && (HOLD_EFFECT_CHOICE(holdEffectAtk) || GetBattlerAbility(gBattlerAttacker) == ABILITY_GORILLA_TACTICS))
                {
                    if ((moveEffect == EFFECT_BATON_PASS || moveEffect == EFFECT_HEALING_WISH)
                     && !(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_FAILED))
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
                {
                    *choicedMoveAtk = MOVE_NONE;
                }
                gBattleScripting.moveendState++;
                break;
            }
        case MOVEEND_ITEM_EFFECTS_TARGET:
            if (ItemBattleEffects(ITEMEFFECT_TARGET, gBattlerTarget, FALSE))
                effect = TRUE;
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_FIRST_MOVE_BLOCK:
            if ((gSpecialStatuses[gBattlerAttacker].parentalBondState == PARENTAL_BOND_1ST_HIT && IsBattlerAlive(gBattlerTarget))
             || gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT
             || gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE)
            {
                gBattleScripting.moveendState++;
                break;
            }

            switch (moveEffect)
            {
            case EFFECT_KNOCK_OFF:
                if (!DoesSubstituteBlockMove(gBattlerAttacker, gBattlerTarget, gCurrentMove))
                    effect = TryKnockOffBattleScript(gBattlerTarget);
                break;
            case EFFECT_HIT_SWITCH_TARGET:
                if (IsBattlerTurnDamaged(gBattlerTarget)
                 && IsBattlerAlive(gBattlerTarget)
                 && IsBattlerAlive(gBattlerAttacker)
                 && !(gStatuses3[BATTLE_PARTNER(gBattlerTarget)] & STATUS3_COMMANDER))
                {
                    u32 targetAbility = GetBattlerAbility(gBattlerTarget);
                    if (targetAbility == ABILITY_GUARD_DOG)
                    {
                        gBattleScripting.moveendState++;
                        break;
                    }

                    effect = TRUE;
                    BattleScriptPushCursor();
                    if (targetAbility == ABILITY_SUCTION_CUPS)
                    {
                        gBattlescriptCurrInstr = BattleScript_AbilityPreventsPhasingOutRet;
                    }
                    else if (gStatuses3[gBattlerTarget] & STATUS3_ROOTED)
                    {
                        gBattlescriptCurrInstr = BattleScript_PrintMonIsRootedRet;
                    }
                    else if (GetActiveGimmick(gBattlerTarget) == GIMMICK_DYNAMAX)
                    {
                        gBattlescriptCurrInstr = BattleScript_HitSwitchTargetDynamaxed;
                    }
                    else
                    {
                        gBattleScripting.switchCase = B_SWITCH_HIT;
                        gBattlescriptCurrInstr = BattleScript_TryHitSwitchTarget;
                    }
                }
                break;
            case EFFECT_SMACK_DOWN:
                if (!IsBattlerGrounded(gBattlerTarget)
                 && IsBattlerAlive(gBattlerTarget)
                 && !DoesSubstituteBlockMove(gBattlerAttacker, gBattlerTarget, gCurrentMove))
                {
                    gStatuses3[gBattlerTarget] |= STATUS3_SMACKED_DOWN;
                    gStatuses3[gBattlerTarget] &= ~(STATUS3_MAGNET_RISE | STATUS3_TELEKINESIS | STATUS3_ON_AIR);
                    effect = TRUE;
                    BattleScriptPush(gBattlescriptCurrInstr);
                    gBattlescriptCurrInstr = BattleScript_MoveEffectSmackDown;
                }
                break;
            default:
                break;
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_ITEM_EFFECTS_ALL: // item effects for all battlers
            if (ItemBattleEffects(ITEMEFFECT_MOVE_END, 0, FALSE))
                effect = TRUE;
            else
                gBattleScripting.moveendState++;
            break;
        case MOVEEND_KINGSROCK: // King's rock
            // These effects will occur at each hit in a multi-strike move
            if (ItemBattleEffects(ITEMEFFECT_KINGSROCK, 0, FALSE))
                effect = TRUE;
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_ATTACKER_INVISIBLE: // make attacker sprite invisible
            if (gStatuses3[gBattlerAttacker] & (STATUS3_SEMI_INVULNERABLE)
                && gHitMarker & (HITMARKER_NO_ANIMATIONS | HITMARKER_DISABLE_ANIMATION))
            {
                BtlController_EmitSpriteInvisibility(gBattlerAttacker, B_COMM_TO_CONTROLLER, TRUE);
                MarkBattlerForControllerExec(gBattlerAttacker);
                gBattleScripting.moveendState++;
                return;
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_ATTACKER_VISIBLE: // make attacker sprite visible
            if (gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT
                || !(gStatuses3[gBattlerAttacker] & (STATUS3_SEMI_INVULNERABLE))
                || WasUnableToUseMove(gBattlerAttacker))
            {
                BtlController_EmitSpriteInvisibility(gBattlerAttacker, B_COMM_TO_CONTROLLER, FALSE);
                MarkBattlerForControllerExec(gBattlerAttacker);
                gStatuses3[gBattlerAttacker] &= ~STATUS3_SEMI_INVULNERABLE;
                gSpecialStatuses[gBattlerAttacker].restoredBattlerSprite = TRUE;
                gBattleScripting.moveendState++;
                return;
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_TARGET_VISIBLE: // make target sprite visible
            if (!gSpecialStatuses[gBattlerTarget].restoredBattlerSprite && gBattlerTarget < gBattlersCount
                && !(gStatuses3[gBattlerTarget] & STATUS3_SEMI_INVULNERABLE))
            {
                BtlController_EmitSpriteInvisibility(gBattlerTarget, B_COMM_TO_CONTROLLER, FALSE);
                MarkBattlerForControllerExec(gBattlerTarget);
                gStatuses3[gBattlerTarget] &= ~STATUS3_SEMI_INVULNERABLE;
                gBattleScripting.moveendState++;
                return;
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_SUBSTITUTE:
            for (i = 0; i < gBattlersCount; i++)
            {
                if (gDisableStructs[i].substituteHP == 0)
                    gBattleMons[i].status2 &= ~STATUS2_SUBSTITUTE;
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_SKY_DROP_CONFUSE: // If a Pokemon was released from Sky Drop and was in LOCK_CONFUSE, go to "confused due to fatigue" scripts and clear Sky Drop data.
            for (i = 0; i < gBattlersCount; i++)
            {
                if (gBattleStruct->skyDropTargets[i] == SKY_DROP_RELEASED_TARGET)
                {
                    u8 targetId;
                    // Find the battler id of the Pokemon that was held by Sky Drop
                    for (targetId = 0; targetId < gBattlersCount; targetId++)
                    {
                        if (gBattleStruct->skyDropTargets[targetId] == i)
                            break;
                    }

                    // Set gBattlerAttacker to the battler id of the target
                    gBattlerAttacker = targetId;

                    // Jump to "confused due to fatigue" script
                    gBattlescriptCurrInstr = BattleScript_ThrashConfuses;

                    // Clear skyDropTargets data
                    gBattleStruct->skyDropTargets[i] = SKY_DROP_NO_TARGET;
                    gBattleStruct->skyDropTargets[targetId] = SKY_DROP_NO_TARGET;
                    return;
                }
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_UPDATE_LAST_MOVES:
            if (!IsOnPlayerSide(gBattlerAttacker))
                UpdateStallMons();
            if ((gBattleStruct->moveResultFlags[gBattlerTarget] & (MOVE_RESULT_FAILED | MOVE_RESULT_DOESNT_AFFECT_FOE))
             || (gBattleMons[gBattlerAttacker].status2 & (STATUS2_FLINCHED))
             || gProtectStructs[gBattlerAttacker].nonVolatileStatusImmobility)
                gBattleStruct->battlerState[gBattlerAttacker].stompingTantrumTimer = 2;

            // Set ShellTrap to activate after the attacker's turn if target was hit by a physical move.
            if (GetMoveEffect(gChosenMoveByBattler[gBattlerTarget]) == EFFECT_SHELL_TRAP
                && gBattlerTarget != gBattlerAttacker
                && !IsBattlerAlly(gBattlerTarget, gBattlerAttacker)
                && gProtectStructs[gBattlerTarget].physicalDmg
                && gProtectStructs[gBattlerTarget].physicalBattlerId == gBattlerAttacker
                && !TestIfSheerForceAffected(gBattlerAttacker, gCurrentMove))
            {
                gProtectStructs[gBattlerTarget].shellTrap = TRUE;
                // Change move order in double battles, so the hit mon with shell trap moves immediately after being hit.
                if (IsDoubleBattle())
                {
                    ChangeOrderTargetAfterAttacker();
                }
            }

            // After swapattackerwithtarget is used for snatch the correct battlers have to be restored so data is stored correctly
            if (gBattleStruct->snatchedMoveIsUsed)
            {
                u32 temp;
                SWAP(gBattlerAttacker, gBattlerTarget, temp);
            }

            if (!gSpecialStatuses[gBattlerAttacker].dancerUsedMove)
            {
                gDisableStructs[gBattlerAttacker].usedMoves |= 1u << gCurrMovePos;
                gBattleStruct->lastMoveTarget[gBattlerAttacker] = gBattlerTarget;
                if (gHitMarker & HITMARKER_ATTACKSTRING_PRINTED)
                {
                    gLastPrintedMoves[gBattlerAttacker] = gChosenMove;
                    gLastUsedMove = gCurrentMove;
                    if (IsMaxMove(gCurrentMove))
                        gBattleStruct->dynamax.lastUsedBaseMove = gBattleStruct->dynamax.baseMoves[gBattlerAttacker];
                }
            }
            enum BattleMoveEffects originalEffect = GetMoveEffect(originallyUsedMove);
            if (!(gAbsentBattlerFlags & (1u << gBattlerAttacker))
                && !gBattleStruct->battlerState[gBattlerAttacker].absent
                && originalEffect != EFFECT_BATON_PASS && originalEffect != EFFECT_HEALING_WISH)
            {
                if (gHitMarker & HITMARKER_OBEYS)
                {
                    if (!gSpecialStatuses[gBattlerAttacker].dancerUsedMove)
                    {
                        gLastMoves[gBattlerAttacker] = gChosenMove;
                        RecordKnownMove(gBattlerAttacker, gChosenMove);
                        gLastResultingMoves[gBattlerAttacker] = gCurrentMove;
                        gLastUsedMoveType[gBattlerAttacker] = GetBattleMoveType(gCurrentMove);
                    }
                }
                else
                {
                    gLastMoves[gBattlerAttacker] = MOVE_UNAVAILABLE;
                    gLastResultingMoves[gBattlerAttacker] = MOVE_UNAVAILABLE;
                    gLastUsedMoveType[gBattlerAttacker] = 0;
                }

                if (!(gHitMarker & HITMARKER_FAINTED(gBattlerTarget)))
                    gLastHitBy[gBattlerTarget] = gBattlerAttacker;

                if (gHitMarker & HITMARKER_OBEYS && !(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT))
                {
                    if (gChosenMove == MOVE_UNAVAILABLE)
                    {
                        gLastLandedMoves[gBattlerTarget] = gChosenMove;
                    }
                    else
                    {
                        gLastLandedMoves[gBattlerTarget] = gCurrentMove;
                        gLastHitByType[gBattlerTarget] = GetBattleMoveType(gCurrentMove);
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
            if (!(gAbsentBattlerFlags & (1u << gBattlerAttacker))
                && !gBattleStruct->battlerState[gBattlerAttacker].absent
                && !IsMoveMirrorMoveBanned(originallyUsedMove)
                && gHitMarker & HITMARKER_OBEYS
                && gBattlerAttacker != gBattlerTarget
                && !(gHitMarker & HITMARKER_FAINTED(gBattlerTarget))
                && !(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT))
            {
                gBattleStruct->lastTakenMove[gBattlerTarget] = gChosenMove;
                gBattleStruct->lastTakenMoveFrom[gBattlerTarget][gBattlerAttacker] = gChosenMove;
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_NEXT_TARGET: // For moves hitting two opposing Pokemon.
        {
            u16 moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);

            gBattleStruct->battlerState[gBattlerAttacker].targetsDone[gBattlerTarget] = TRUE;
            if (!(gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE)
                && IsDoubleBattle()
                && !gProtectStructs[gBattlerAttacker].chargingTurn
                && (moveTarget == MOVE_TARGET_BOTH
                    || moveTarget == MOVE_TARGET_FOES_AND_ALLY)
                && !(gHitMarker & HITMARKER_NO_ATTACKSTRING))
            {
                u32 nextTarget = GetNextTarget(moveTarget, FALSE);
                gHitMarker |= HITMARKER_NO_PPDEDUCT;

                if (nextTarget != MAX_BATTLERS_COUNT)
                {
                    gBattleStruct->moveTarget[gBattlerAttacker] = gBattlerTarget = nextTarget; // Fix for moxie spread moves
                    gBattleScripting.moveendState = 0;
                    MoveValuesCleanUp();
                    gBattleScripting.moveEffect = gBattleScripting.savedMoveEffect;

                    if (moveEffect == EFFECT_EXPLOSION)
                        BattleScriptPush(gBattleMoveEffects[EFFECT_HIT].battleScript); // Edge case for Explosion not changing targets
                    else
                        BattleScriptPush(GetMoveBattleScript(gCurrentMove));
                    gBattlescriptCurrInstr = BattleScript_FlushMessageBox;
                    return;
                }
                // Check if the move used was actually a bounced move. If so, we need to go back to the original attacker and make sure, its move hits all 2 or 3 pokemon.
                else if (gBattleStruct->bouncedMoveIsUsed)
                {
                    u8 originalBounceTarget = gBattlerAttacker;
                    gBattleStruct->bouncedMoveIsUsed = FALSE;
                    gBattlerAttacker = gBattleStruct->attackerBeforeBounce;
                    gBattleStruct->battlerState[gBattlerAttacker].targetsDone[originalBounceTarget] = TRUE;
                    for (i = 0; i < gBattlersCount; i++)
                        gBattleStruct->battlerState[originalBounceTarget].targetsDone[i] = FALSE;
                    nextTarget = GetNextTarget(moveTarget, FALSE);
                    if (nextTarget != MAX_BATTLERS_COUNT)
                    {
                        // We found another target for the original move user.
                        gBattleStruct->moveTarget[gBattlerAttacker] = gBattlerTarget = nextTarget;
                        gBattleScripting.moveendState = 0;
                        gBattleScripting.animTurn = 0;
                        gBattleScripting.animTargetsHit = 0;
                        MoveValuesCleanUp();
                        BattleScriptPush(GetMoveBattleScript(gCurrentMove));
                        gBattlescriptCurrInstr = BattleScript_FlushMessageBox;
                        return;
                    }
                }

                gHitMarker |= HITMARKER_NO_ATTACKSTRING;
                gHitMarker &= ~HITMARKER_NO_PPDEDUCT;
            }
            RecordLastUsedMoveBy(gBattlerAttacker, gCurrentMove);
            gBattleScripting.moveendState++;
            break;
        }
        case MOVEEND_MULTIHIT_MOVE:
        {
            if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
             && !(gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE)
             && gMultiHitCounter
             && !(moveEffect == EFFECT_PRESENT && gBattleStruct->presentBasePower == 0)) // Silly edge case
            {
                gMultiHitCounter--;
                if (!IsBattlerAlive(gBattlerTarget) && moveEffect != EFFECT_DRAGON_DARTS)
                    gMultiHitCounter = 0;

                gBattleScripting.multihitString[4]++;
                if (gMultiHitCounter == 0)
                {
                    BattleScriptPushCursor();
                    if (GetMoveEffectArg_MoveProperty(gCurrentMove) == MOVE_EFFECT_SCALE_SHOT && !NoAliveMonsForEitherParty())
                        gBattlescriptCurrInstr = BattleScript_ScaleShot;
                    else
                        gBattlescriptCurrInstr = BattleScript_MultiHitPrintStrings;
                    effect = TRUE;
                }
                else
                {
                    if (moveEffect == EFFECT_DRAGON_DARTS
                     && !IsAffectedByFollowMe(gBattlerAttacker, GetBattlerSide(gBattlerTarget), gCurrentMove)
                     && !(gBattleStruct->moveResultFlags[BATTLE_PARTNER(gBattlerTarget)] & MOVE_RESULT_MISSED) // didn't miss the other target
                     && CanTargetPartner(gBattlerAttacker, gBattlerTarget)
                     && !TargetFullyImmuneToCurrMove(gBattlerAttacker, BATTLE_PARTNER(gBattlerTarget)))
                        gBattlerTarget = BATTLE_PARTNER(gBattlerTarget); // Target the partner in doubles for second hit.

                    enum BattleMoveEffects chosenEffect = GetMoveEffect(gChosenMove);

                    if (gBattleMons[gBattlerAttacker].hp
                     && gBattleMons[gBattlerTarget].hp
                     && (chosenEffect == EFFECT_SLEEP_TALK || chosenEffect == EFFECT_SNORE || !(gBattleMons[gBattlerAttacker].status1 & STATUS1_SLEEP))
                     && !(gBattleMons[gBattlerAttacker].status1 & STATUS1_FREEZE))
                    {
                        if (gSpecialStatuses[gBattlerAttacker].parentalBondState)
                            gSpecialStatuses[gBattlerAttacker].parentalBondState--;

                        gHitMarker |= (HITMARKER_NO_PPDEDUCT | HITMARKER_NO_ATTACKSTRING);
                        gBattleScripting.animTargetsHit = 0;
                        gBattleScripting.moveendState = 0;
                        gSpecialStatuses[gBattlerAttacker].multiHitOn = TRUE;
                        MoveValuesCleanUp();
                        BattleScriptPush(GetMoveBattleScript(gCurrentMove));
                        gBattlescriptCurrInstr = BattleScript_FlushMessageBox;
                        return;
                    }
                    else
                    {
                        BattleScriptPushCursor();
                        gBattlescriptCurrInstr = BattleScript_MultiHitPrintStrings;
                        effect = TRUE;
                    }
                }
            }
            gMultiHitCounter = 0;
            gSpecialStatuses[gBattlerAttacker].parentalBondState = PARENTAL_BOND_OFF;
            gSpecialStatuses[gBattlerAttacker].multiHitOn = 0;
            gBattleScripting.moveendState++;
            break;
        }
        case MOVEEND_DEFROST:
            if (gBattleMons[gBattlerTarget].status1 & STATUS1_FREEZE
                && IsBattlerTurnDamaged(gBattlerTarget)
                && IsBattlerAlive(gBattlerTarget)
                && gBattlerAttacker != gBattlerTarget
                && (moveType == TYPE_FIRE || CanBurnHitThaw(gCurrentMove))
                && !(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT))
            {
                gBattleMons[gBattlerTarget].status1 &= ~STATUS1_FREEZE;
                BtlController_EmitSetMonData(gBattlerTarget, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[gBattlerTarget].status1), &gBattleMons[gBattlerTarget].status1);
                MarkBattlerForControllerExec(gBattlerTarget);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_DefrostedViaFireMove;
                effect = TRUE;
            }
            if (gBattleMons[gBattlerTarget].status1 & STATUS1_FROSTBITE
                && IsBattlerAlive(gBattlerTarget)
                && gBattlerAttacker != gBattlerTarget
                && MoveThawsUser(originallyUsedMove)
                && !(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT))
            {
                gBattleMons[gBattlerTarget].status1 &= ~STATUS1_FROSTBITE;
                BtlController_EmitSetMonData(gBattlerTarget, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[gBattlerTarget].status1), &gBattleMons[gBattlerTarget].status1);
                MarkBattlerForControllerExec(gBattlerTarget);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_FrostbiteHealedViaFireMove;
                effect = TRUE;
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_SECOND_MOVE_BLOCK:
            if (gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE)
            {
                gBattleScripting.moveendState++;
                break;
            }

            switch (moveEffect)
            {
            case EFFECT_RECOIL_IF_MISS:
                if (IsBattlerAlive(gBattlerAttacker)
                 && (!IsBattlerTurnDamaged(gBattlerTarget) || gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
                 && !gBattleStruct->noTargetPresent)
                {
                    if (B_RECOIL_IF_MISS_DMG >= GEN_5 || (B_CRASH_IF_TARGET_IMMUNE == GEN_4 && gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_DOESNT_AFFECT_FOE))
                        gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerAttacker) / 2;
                    else if (B_RECOIL_IF_MISS_DMG == GEN_4 && (GetNonDynamaxMaxHP(gBattlerTarget) / 2) < gBattleStruct->moveDamage[gBattlerTarget])
                        gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerTarget) / 2;
                    else // Fallback if B_RECOIL_IF_MISS_DMG is set to gen3 or lower.
                        gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerTarget) / 2;

                    if (gBattleStruct->moveDamage[gBattlerAttacker] == 0)
                        gBattleStruct->moveDamage[gBattlerAttacker] = 1;

                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_RecoilIfMiss;
                    effect = TRUE;
                }
                break;
            case EFFECT_RECOIL:
                if (IsBattlerTurnDamaged(gBattlerTarget) && IsBattlerAlive(gBattlerAttacker))
                {
                    gBattleStruct->moveDamage[gBattlerAttacker] = max(1, gBattleStruct->moveDamage[gBattlerTarget] * max(1, GetMoveRecoil(gCurrentMove)) / 100);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_MoveEffectRecoil;
                    effect = TRUE;
                }
                break;
            case EFFECT_EXPLOSION:
                if (!IsAbilityOnField(ABILITY_DAMP))
                {
                    gBattleStruct->moveDamage[gBattlerAttacker] = 0;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_FaintAttackerForExplosion;
                    effect = TRUE;
                }
                break;
            case EFFECT_MAX_HP_50_RECOIL:
            case EFFECT_MIND_BLOWN:
                if (IsBattlerAlive(gBattlerAttacker)
                 && !(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_FAILED)
                 && GetBattlerAbility(gBattlerAttacker) != ABILITY_MAGIC_GUARD)
                {
                    gBattleStruct->moveDamage[gBattlerAttacker] = (GetNonDynamaxMaxHP(gBattlerAttacker) + 1) / 2; // Half of Max HP Rounded UP
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_MaxHp50Recoil;
                    effect = TRUE;
                }
                break;
            case EFFECT_RAPID_SPIN:
                if (IsBattlerTurnDamaged(gBattlerTarget))
                {
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_RapidSpinAway;
                    effect = TRUE;
                }
                break;
            case EFFECT_FELL_STINGER:
                if (IsBattlerAlive(gBattlerAttacker)
                 && !IsBattlerAlive(gBattlerTarget)
                 && IsBattlerTurnDamaged(gBattlerTarget)
                 && !NoAliveMonsForEitherParty()
                 && CompareStat(gBattlerAttacker, STAT_ATK, MAX_STAT_STAGE, CMP_LESS_THAN))
                {
                    SET_STATCHANGER(STAT_ATK, GetGenConfig(GEN_CONFIG_FELL_STINGER_STAT_RAISE) >= GEN_7 ? 3 : 2, FALSE);
                    PREPARE_STAT_BUFFER(gBattleTextBuff1, STAT_ATK);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_FellStingerRaisesStat;
                    effect = TRUE;
                }
                break;
            default:
                break;
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_ITEM_EFFECTS_ATTACKER:
            if (ItemBattleEffects(ITEMEFFECT_MOVE_END, gBattlerAttacker, FALSE))
                effect = TRUE;
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_ABILITY_BLOCK:
            effect = HandleMoveEndAbilityBlock(gBattlerAttacker, gBattlerTarget, gCurrentMove);
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_SHEER_FORCE:
            if (TestIfSheerForceAffected(gBattlerAttacker, gCurrentMove))
                gBattleScripting.moveendState = MOVEEND_EJECT_PACK;
            else
                gBattleScripting.moveendState++;
            break;
        case MOVEEND_EJECT_BUTTON:
            {
                // Because sorting the battlers by speed takes lots of cycles, it's better to just check if any of the battlers has the Eject items.
                u32 numEjectButtonBattlers = 0;
                u32 ejectButtonBattlers = 0;

                for (i = 0; i < gBattlersCount; i++)
                {
                    if (CanEjectButtonTrigger(gBattlerAttacker, i, moveEffect))
                    {
                        ejectButtonBattlers |= 1u << i;
                        numEjectButtonBattlers++;
                    }
                }

                if (numEjectButtonBattlers == 0)
                {
                    gBattleScripting.moveendState++;
                    break;
                }

                u8 battlers[4] = {0, 1, 2, 3};
                if (numEjectButtonBattlers > 1)
                    SortBattlersBySpeed(battlers, FALSE);

                for (i = 0; i < gBattlersCount; i++)
                {
                    u32 battler = battlers[i];

                    if (!(ejectButtonBattlers & 1u << battler))
                        continue;

                    gBattleScripting.battler = battler;
                    gLastUsedItem = gBattleMons[battler].item;
                    effect = TRUE;
                    gBattleStruct->battlerState[battler].usedEjectItem = TRUE;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_EjectButtonActivates;
                    gAiLogicData->ejectButtonSwitch = TRUE;
                    break; // Only the fastest Eject Button activates
                }
            }
            if (effect)
                gBattleScripting.moveendState = MOVEEND_OPPORTUNIST;
            else
                gBattleScripting.moveendState++;
            break;
        case MOVEEND_EJECT_PACK:
            {
                // Because sorting the battlers by speed takes lots of cycles, it's better to just check if any of the battlers has the Eject items.
                u32 ejectPackBattlers = 0;
                u32 numEjectPackBattlers = 0;

                for (i = 0; i < gBattlersCount; i++)
                {
                    if (CanEjectPackTrigger(gBattlerAttacker, i, moveEffect))
                    {
                        ejectPackBattlers |= 1u << i;
                        numEjectPackBattlers++;
                    }
                }

                if (numEjectPackBattlers == 0)
                {
                    gBattleScripting.moveendState++;
                    break;
                }

                u8 battlers[4] = {0, 1, 2, 3};
                if (numEjectPackBattlers > 1)
                    SortBattlersBySpeed(battlers, FALSE);

                for (i = 0; i < gBattlersCount; i++)
                    gProtectStructs[i].statFell = FALSE; // restore for every possible eject pack battler

                for (i = 0; i < gBattlersCount; i++)
                {
                    u32 battler = battlers[i];

                    if (!(ejectPackBattlers & 1u << battler))
                        continue;

                    // Hit escape moves activate before Eject Pack for user
                    if (moveEffect == EFFECT_HIT_ESCAPE && gBattlerAttacker == battler)
                        continue;

                    gBattleScripting.battler = battler;
                    gLastUsedItem = gBattleMons[battler].item;
                    effect = TRUE;
                    gBattleStruct->battlerState[battler].usedEjectItem = TRUE;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_EjectPackActivates;
                    gAiLogicData->ejectPackSwitch = TRUE;
                    break; // Only the fastest Eject item activates
                }
            }
            if (effect)
                gBattleScripting.moveendState = MOVEEND_OPPORTUNIST;
            else
                gBattleScripting.moveendState++;
            break;
        case MOVEEND_WHITE_HERB:
            for (i = 0; i < gBattlersCount; i++)
            {
                if (!IsBattlerAlive(i))
                    continue;

                if (GetBattlerHoldEffect(i, TRUE) == HOLD_EFFECT_WHITE_HERB
                 && RestoreWhiteHerbStats(i))
                {
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_WhiteHerbRet;
                    effect = TRUE;
                    break;
                }
            }
            if (!effect)
                gBattleScripting.moveendState++;
            break;
        case MOVEEND_RED_CARD:
            {
                u32 redCardBattlers = 0, i;
                for (i = 0; i < gBattlersCount; i++)
                {
                    if (i == gBattlerAttacker)
                        continue;
                    if (GetBattlerHoldEffect(i, TRUE) == HOLD_EFFECT_RED_CARD)
                        redCardBattlers |= (1u << i);
                }
                if (redCardBattlers && IsBattlerAlive(gBattlerAttacker))
                {
                    // Since we check if battler was damaged, we don't need to check move result.
                    // In fact, doing so actually prevents multi-target moves from activating red card properly
                    u8 battlers[4] = {0, 1, 2, 3};
                    SortBattlersBySpeed(battlers, FALSE);
                    for (i = 0; i < gBattlersCount; i++)
                    {
                        u32 battler = battlers[i];
                        // Search for fastest hit pokemon with a red card
                        // Attacker is the one to be switched out, battler is one with red card
                        if (redCardBattlers & (1u << battler)
                          && IsBattlerAlive(battler)
                          && !DoesSubstituteBlockMove(gBattlerAttacker, battler, gCurrentMove)
                          && IsBattlerTurnDamaged(battler)
                          && CanBattlerSwitch(gBattlerAttacker)
                          && !(moveEffect == EFFECT_HIT_SWITCH_TARGET && CanBattlerSwitch(battler)))
                        {
                            effect = TRUE;
                            gLastUsedItem = gBattleMons[battler].item;
                            SaveBattlerTarget(battler); // save battler with red card
                            SaveBattlerAttacker(gBattlerAttacker);
                            gBattleScripting.battler = battler;
                            gEffectBattler = gBattlerAttacker;
                            BattleScriptPushCursor();
                            if (gBattleStruct->commanderActive[gBattlerAttacker] != SPECIES_NONE
                             || GetBattlerAbility(gBattlerAttacker) == ABILITY_GUARD_DOG
                             || GetActiveGimmick(gBattlerAttacker) == GIMMICK_DYNAMAX)
                                gBattlescriptCurrInstr = BattleScript_RedCardActivationNoSwitch;
                            else
                                gBattlescriptCurrInstr = BattleScript_RedCardActivates;
                            break;  // Only fastest red card activates
                        }
                    }
                }
            }
            if (effect)
                gBattleScripting.moveendState = MOVEEND_OPPORTUNIST;
            else
                gBattleScripting.moveendState++;
            break;
        case MOVEEND_LIFEORB_SHELLBELL:
            if (ItemBattleEffects(ITEMEFFECT_LIFEORB_SHELLBELL, 0, FALSE))
                effect = TRUE;
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_PICKPOCKET:
            if (IsBattlerAlive(gBattlerAttacker)
              && gBattleMons[gBattlerAttacker].item != ITEM_NONE        // Attacker must be holding an item
              && !(gWishFutureKnock.knockedOffMons[GetBattlerSide(gBattlerAttacker)] & (1u << gBattlerPartyIndexes[gBattlerAttacker]))   // But not knocked off
              && IsMoveMakingContact(gCurrentMove, gBattlerAttacker)    // Pickpocket requires contact
              && !(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT))           // Obviously attack needs to have worked
            {
                u8 battlers[4] = {0, 1, 2, 3};
                SortBattlersBySpeed(battlers, FALSE); // Pickpocket activates for fastest mon without item
                for (i = 0; i < gBattlersCount; i++)
                {
                    u8 battler = battlers[i];
                    // Attacker is mon who made contact, battler is mon with pickpocket
                    if (battler != gBattlerAttacker                                                     // Cannot pickpocket yourself
                      && GetBattlerAbility(battler) == ABILITY_PICKPOCKET                               // Target must have pickpocket ability
                      && IsBattlerTurnDamaged(battler)                                                  // Target needs to have been damaged
                      && !DoesSubstituteBlockMove(gBattlerAttacker, battler, gCurrentMove)              // Subsitute unaffected
                      && IsBattlerAlive(battler)                                                        // Battler must be alive to pickpocket
                      && gBattleMons[battler].item == ITEM_NONE                                         // Pickpocketer can't have an item already
                      && CanStealItem(battler, gBattlerAttacker, gBattleMons[gBattlerAttacker].item))   // Cannot steal plates, mega stones, etc
                    {
                        gBattlerTarget = gBattlerAbility = battler;
                        // Battle scripting is super brittle so we shall do the item exchange now (if possible)
                        if (GetBattlerAbility(gBattlerAttacker) != ABILITY_STICKY_HOLD)
                            StealTargetItem(gBattlerTarget, gBattlerAttacker);  // Target takes attacker's item

                        gEffectBattler = gBattlerAttacker;
                        BattleScriptPushCursor();
                        gBattlescriptCurrInstr = BattleScript_Pickpocket;   // Includes sticky hold check to print separate string
                        effect = TRUE;
                        break; // Pickpocket activates on fastest mon, so exit loop.
                    }
                }
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_EMERGENCY_EXIT: // Special case, because moves hitting multiple opponents stop after switching out
            {
                // Because sorting the battlers by speed takes lots of cycles,
                // we check if EE can be activated and cound how many.
                u32 numEmergencyExitBattlers = 0;
                u32 emergencyExitBattlers = 0;

                for (i = 0; i < gBattlersCount; i++)
                {
                    if (EmergencyExitCanBeTriggered(i))
                    {
                        emergencyExitBattlers |= 1u << i;
                        numEmergencyExitBattlers++;
                    }
                }

                if (numEmergencyExitBattlers == 0)
                {
                    gBattleScripting.moveendState++;
                    break;
                }

                u8 battlers[4] = {0, 1, 2, 3};
                if (numEmergencyExitBattlers > 1)
                    SortBattlersBySpeed(battlers, FALSE);

                for (i = 0; i < gBattlersCount; i++)
                {
                    u32 battler = battlers[i];

                    if (!(emergencyExitBattlers & 1u << battler))
                        continue;

                    effect = TRUE;
                    gBattleScripting.battler = battler;
                    BattleScriptPushCursor();

                    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER || IsOnPlayerSide(battler))
                        gBattlescriptCurrInstr = BattleScript_EmergencyExit;
                    else
                        gBattlescriptCurrInstr = BattleScript_EmergencyExitWild;

                    break; // Only the fastest Emergency Exit / Wimp Out activates
                }
            }
            if (effect)
                gBattleScripting.moveendState = MOVEEND_OPPORTUNIST;
            else
                gBattleScripting.moveendState++;
            break;
        case MOVEEND_HIT_ESCAPE:
            if (moveEffect == EFFECT_HIT_ESCAPE
             && !(gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE)
             && IsBattlerTurnDamaged(gBattlerTarget)
             && IsBattlerAlive(gBattlerAttacker)
             && !NoAliveMonsForBattlerSide(gBattlerTarget))
            {
                effect = TRUE;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_EffectHitEscape;
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_OPPORTUNIST:
            if (AbilityBattleEffects(ABILITYEFFECT_OPPORTUNIST, 0, 0, 0, 0))
                effect = TRUE; // it loops through all battlers, so we increment after its done with all battlers
            else
                gBattleScripting.moveendState++;
            break;
        case MOVEEND_SYMBIOSIS:
            for (i = 0; i < gBattlersCount; i++)
            {
                if ((gSpecialStatuses[i].berryReduced
                      || (B_SYMBIOSIS_GEMS >= GEN_7 && gSpecialStatuses[i].gemBoost))
                    && TryTriggerSymbiosis(i, BATTLE_PARTNER(i)))
                {
                    BestowItem(BATTLE_PARTNER(i), i);
                    gLastUsedAbility = gBattleMons[BATTLE_PARTNER(i)].ability;
                    gBattleScripting.battler = gBattlerAbility = BATTLE_PARTNER(i);
                    gBattlerAttacker = i;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_SymbiosisActivates;
                    effect = TRUE;
                }
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_SAME_MOVE_TURNS:
            if (gCurrentMove != gLastResultingMoves[gBattlerAttacker]
             || gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT
             || gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE)
                gBattleStruct->sameMoveTurns[gBattlerAttacker] = 0;
            else if (gCurrentMove == gLastResultingMoves[gBattlerAttacker] && gSpecialStatuses[gBattlerAttacker].parentalBondState != PARENTAL_BOND_1ST_HIT)
                gBattleStruct->sameMoveTurns[gBattlerAttacker]++;
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_CHANGED_ITEMS:
            for (i = 0; i < gBattlersCount; i++)
            {
                if (gBattleStruct->changedItems[i] != ITEM_NONE)
                {
                    gBattleMons[i].item = gBattleStruct->changedItems[i];
                    gBattleStruct->changedItems[i] = ITEM_NONE;
                }
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_CLEAR_BITS: // Clear/Set bits for things like using a move for all targets and all hits.
            if (gSpecialStatuses[gBattlerAttacker].instructedChosenTarget)
                gBattleStruct->moveTarget[gBattlerAttacker] = gSpecialStatuses[gBattlerAttacker].instructedChosenTarget & 0x3;
            if (gSpecialStatuses[gBattlerAttacker].dancerOriginalTarget)
                gBattleStruct->moveTarget[gBattlerAttacker] = gSpecialStatuses[gBattlerAttacker].dancerOriginalTarget & 0x3;

            // If the Pokémon needs to keep track of move usage for its evolutions, do it
            if (originallyUsedMove != MOVE_NONE)
                TryUpdateEvolutionTracker(IF_USED_MOVE_X_TIMES, 1, originallyUsedMove);

            if (B_RAMPAGE_CANCELLING >= GEN_5
              && MoveHasAdditionalEffectSelf(gCurrentMove, MOVE_EFFECT_THRASH)           // If we're rampaging
              && gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT  // And it is unusable
              && (gBattleMons[gBattlerAttacker].status2 & STATUS2_LOCK_CONFUSE) != STATUS2_LOCK_CONFUSE_TURN(1))  // And won't end this turn
                CancelMultiTurnMoves(gBattlerAttacker, SKY_DROP_IGNORE); // Cancel it

            if (gBattleStruct->savedAttackerCount > 0)
            {
                // #if TESTING
                // Test_ExitWithResult(TEST_RESULT_ERROR,  "savedAttackerCount is greater than 0! More calls to SaveBattlerAttacker than RestoreBattlerAttacker!");
                // #else
                DebugPrintfLevel(MGBA_LOG_WARN, "savedAttackerCount is greater than 0! More calls to SaveBattlerAttacker than RestoreBattlerAttacker!");
                // #endif
            }
            if (gBattleStruct->savedTargetCount > 0)
            {
                // #if TESTING
                // Test_ExitWithResult(TEST_RESULT_ERROR, "savedTargetCount is greater than 0! More calls to SaveBattlerTarget than RestoreBattlerTarget!");
                // #else
                DebugPrintfLevel(MGBA_LOG_WARN, "savedTargetCount is greater than 0! More calls to SaveBattlerTarget than RestoreBattlerTarget!");
                // #endif
            }
            gProtectStructs[gBattlerAttacker].shellTrap = FALSE;
            gBattleStruct->ateBoost[gBattlerAttacker] = FALSE;
            gSpecialStatuses[gBattlerAttacker].gemBoost = FALSE;
            gSpecialStatuses[gBattlerTarget].berryReduced = FALSE;
            gSpecialStatuses[gBattlerTarget].distortedTypeMatchups = FALSE;
            gBattleScripting.moveEffect = 0;
            gBattleStruct->isAtkCancelerForCalledMove = FALSE;
            gBattleStruct->swapDamageCategory = FALSE;
            gBattleStruct->categoryOverride = FALSE;
            gBattleStruct->additionalEffectsCounter = 0;
            gBattleStruct->poisonPuppeteerConfusion = FALSE;
            gBattleStruct->fickleBeamBoosted = FALSE;
            gBattleStruct->battlerState[gBattlerAttacker].usedMicleBerry = FALSE;
            gBattleStruct->noTargetPresent = FALSE;
            if (gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE)
                gBattleStruct->pledgeMove = FALSE;
            if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_Z_MOVE)
                SetActiveGimmick(gBattlerAttacker, GIMMICK_NONE);
            if (B_CHARGE >= GEN_9 && moveType == TYPE_ELECTRIC && (IsBattlerTurnDamaged(gBattlerTarget) || gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT))
                gStatuses3[gBattlerAttacker] &= ~(STATUS3_CHARGED_UP);
            memset(gQueuedStatBoosts, 0, sizeof(gQueuedStatBoosts));

            for (i = 0; i < gBattlersCount; i++)
            {
                gBattleStruct->battlerState[gBattlerAttacker].targetsDone[i] = FALSE;

                if (gBattleStruct->commanderActive[i] != SPECIES_NONE && !IsBattlerAlive(i))
                {
                    u32 partner = BATTLE_PARTNER(i);
                    gBattleStruct->commanderActive[i] = SPECIES_NONE;
                    if (IsBattlerAlive(partner))
                        gStatuses3[partner] &= ~STATUS3_COMMANDER;
                }
            }

            gBattleScripting.moveendState++;
            break;
        case MOVEEND_DANCER:
            if (gCurrentMove == MOVE_NONE)
                originallyUsedMove = gChosenMove; // Fallback to chosen move in case attacker is switched out in the middle of an attack resolution (eg red card)
            else
                originallyUsedMove = gCurrentMove;
            if (IsDanceMove(originallyUsedMove) && !gBattleStruct->snatchedMoveIsUsed)
            {
                u32 battler, nextDancer = 0;
                bool32 hasDancerTriggered = FALSE;

                for (battler = 0; battler < gBattlersCount; battler++)
                {
                    if (gSpecialStatuses[battler].dancerUsedMove)
                    {
                        // in case a battler fails to act on a Dancer-called move
                        hasDancerTriggered = TRUE;
                        break;
                    }
                }

                if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & (MOVE_RESULT_FAILED | MOVE_RESULT_DOESNT_AFFECT_FOE)
                 || (gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE && !hasDancerTriggered)
                 || (!gSpecialStatuses[gBattlerAttacker].dancerUsedMove && gBattleStruct->bouncedMoveIsUsed)))
                {   // Dance move succeeds
                    // Set target for other Dancer mons; set bit so that mon cannot activate Dancer off of its own move
                    if (!gSpecialStatuses[gBattlerAttacker].dancerUsedMove)
                    {
                        gBattleScripting.savedBattler = gBattlerTarget | 0x4;
                        gBattleScripting.savedBattler |= (gBattlerAttacker << 4);
                        gSpecialStatuses[gBattlerAttacker].dancerUsedMove = TRUE;
                    }
                    for (battler = 0; battler < gBattlersCount; battler++)
                    {
                        if (GetBattlerAbility(battler) == ABILITY_DANCER && !gSpecialStatuses[battler].dancerUsedMove)
                        {
                            if (!nextDancer || (gBattleMons[battler].speed < gBattleMons[nextDancer & 0x3].speed))
                                nextDancer = battler | 0x4;
                        }
                    }
                    if (nextDancer && AbilityBattleEffects(ABILITYEFFECT_MOVE_END_OTHER, nextDancer & 0x3, 0, 0, originallyUsedMove))
                        effect = TRUE;
                }
            }
            gBattleScripting.moveendState++;
            break;
        case MOVEEND_PURSUIT_NEXT_ACTION:
            if (gBattleStruct->battlerState[gBattlerTarget].pursuitTarget)
            {
                u32 storedTarget = gBattlerTarget;
                if (SetTargetToNextPursuiter(gBattlerTarget))
                {
                    ChangeOrderTargetAfterAttacker();
                    gBattleStruct->moveTarget[gBattlerTarget] = storedTarget;
                    gBattlerTarget = storedTarget;
                }
                else if (IsBattlerAlive(gBattlerTarget))
                {
                    gBattlerAttacker = gBattlerTarget;
                    if (gBattleStruct->pursuitStoredSwitch == PARTY_SIZE)
                        gBattlescriptCurrInstr = BattleScript_MoveSwitchOpenPartyScreen;
                    else
                        gBattlescriptCurrInstr = BattleScript_DoSwitchOut;
                    gBattleStruct->monToSwitchIntoId[gBattlerTarget] = gBattleStruct->pursuitStoredSwitch;
                    ClearPursuitValues();
                    effect = TRUE;
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
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_sethealblock(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gStatuses3[gBattlerTarget] & STATUS3_HEAL_BLOCK)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gStatuses3[gBattlerTarget] |= STATUS3_HEAL_BLOCK;
        gDisableStructs[gBattlerTarget].healBlockTimer = gBattleTurnCounter + 5;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_returnatktoball(void)
{
    CMD_ARGS();

    if (!(gHitMarker & HITMARKER_FAINTED(gBattlerAttacker)))
    {
        BtlController_EmitReturnMonToBall(gBattlerAttacker, B_COMM_TO_CONTROLLER, FALSE);
        MarkBattlerForControllerExec(gBattlerAttacker);
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_getswitchedmondata(void)
{
    CMD_ARGS(u8 battler);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    if (gBattleControllerExecFlags)
        return;

    gBattlerPartyIndexes[battler] = gBattleStruct->monToSwitchIntoId[battler];

    BtlController_EmitGetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_ALL_BATTLE, 1u << gBattlerPartyIndexes[battler]);
    MarkBattlerForControllerExec(battler);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_switchindataupdate(void)
{
    CMD_ARGS(u8 battler);

    struct BattlePokemon oldData;
    u32 battler, i;
    u8 *monData;

    if (gBattleControllerExecFlags)
        return;

    battler = GetBattlerForBattleScript(cmd->battler);
    oldData = gBattleMons[battler];
    monData = (u8 *)(&gBattleMons[battler]);

    for (i = 0; i < sizeof(struct BattlePokemon); i++)
        monData[i] = gBattleResources->bufferB[battler][4 + i];

    // Edge case: the sent out pokemon has 0 HP. This should never happen.
    if (!IsBattlerAlive(battler))
    {
        // If it's a test, mark it as invalid.
        if (gTestRunnerEnabled)
        {
            TestRunner_Battle_InvalidNoHPMon(battler, gBattlerPartyIndexes[battler]);
        }
        // Handle in-game scenario.
        else
        {
            struct Pokemon *party = GetBattlerParty(battler);
            // Find the first possible replacement for the not valid pokemon.
            for (i = 0; i < PARTY_SIZE; i++)
            {
                if (IsValidForBattle(&party[i]))
                    break;
            }
            // There is valid replacement.
            if (i != PARTY_SIZE)
            {
                gBattlerPartyIndexes[battler] = gBattleStruct->monToSwitchIntoId[battler] = i;
                BtlController_EmitGetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_ALL_BATTLE, 1u << gBattlerPartyIndexes[battler]);
                MarkBattlerForControllerExec(battler);
                return;
            }
        }
    }

    gBattleMons[battler].types[0] = gSpeciesInfo[gBattleMons[battler].species].types[0];
    gBattleMons[battler].types[1] = gSpeciesInfo[gBattleMons[battler].species].types[1];
    gBattleMons[battler].types[2] = TYPE_MYSTERY;
    gBattleMons[battler].ability = GetAbilityBySpecies(gBattleMons[battler].species, gBattleMons[battler].abilityNum);
    #if TESTING
    if (gTestRunnerEnabled)
    {
        u32 side = GetBattlerSide(battler);
        u32 partyIndex = gBattlerPartyIndexes[battler];
        if (TestRunner_Battle_GetForcedAbility(side, partyIndex))
            gBattleMons[battler].ability = gDisableStructs[battler].overwrittenAbility = TestRunner_Battle_GetForcedAbility(side, partyIndex);
    }
    #endif

    // check knocked off item
    i = GetBattlerSide(battler);
    if (gWishFutureKnock.knockedOffMons[i] & (1u << gBattlerPartyIndexes[battler]))
    {
        gBattleMons[battler].item = ITEM_NONE;
    }

    if (GetMoveEffect(gCurrentMove) == EFFECT_BATON_PASS)
    {
        for (i = 0; i < NUM_BATTLE_STATS; i++)
        {
            gBattleMons[battler].statStages[i] = oldData.statStages[i];
        }
        gBattleMons[battler].status2 = oldData.status2;
    }

    SwitchInClearSetData(battler);

    if (gBattleTypeFlags & BATTLE_TYPE_PALACE
        && gBattleMons[battler].maxHP / 2 >= gBattleMons[battler].hp
        && IsBattlerAlive(battler)
        && !(gBattleMons[battler].status1 & STATUS1_SLEEP))
    {
        gBattleStruct->palaceFlags |= 1u << battler;
    }

    gBattleScripting.battler = battler;

    PREPARE_MON_NICK_BUFFER(gBattleTextBuff1, battler, gBattlerPartyIndexes[battler]);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_switchinanim(void)
{
    u32 battler;

    CMD_ARGS(u8 battler, bool8 dontClearTransform, bool8 dontClearSubstitute);

    if (gBattleControllerExecFlags)
        return;

    battler = GetBattlerForBattleScript(cmd->battler);

    if (!IsOnPlayerSide(battler)
        && !(gBattleTypeFlags & (BATTLE_TYPE_LINK
                                 | BATTLE_TYPE_EREADER_TRAINER
                                 | BATTLE_TYPE_RECORDED_LINK
                                 | BATTLE_TYPE_TRAINER_HILL
                                 | BATTLE_TYPE_FRONTIER
                                 | BATTLE_TYPE_LEGENDARY
                                 | BATTLE_TYPE_OLD_MAN_TUTORIAL
                                 | BATTLE_TYPE_POKEDUDE
                                 | BATTLE_TYPE_GHOST)))
        HandleSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[battler].species), FLAG_SET_SEEN, gBattleMons[battler].personality);

    gAbsentBattlerFlags &= ~(1u << battler);

    BtlController_EmitSwitchInAnim(battler, B_COMM_TO_CONTROLLER, gBattlerPartyIndexes[battler], cmd->dontClearTransform, cmd->dontClearSubstitute);
    MarkBattlerForControllerExec(battler);

    gBattlescriptCurrInstr = cmd->nextInstr;

    // if (gBattleTypeFlags & BATTLE_TYPE_ARENA)
    //     BattleArena_InitPoints();
}

bool32 CanBattlerSwitch(u32 battler)
{
    s32 i, lastMonId, battlerIn1, battlerIn2;
    bool32 ret = FALSE;
    struct Pokemon *party;

    if (BATTLE_TWO_VS_ONE_OPPONENT && !IsOnPlayerSide(battler))
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
            if (IsOnPlayerSide(battler))
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
    else if (gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS && !IsOnPlayerSide(battler))
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
        if (!IsOnPlayerSide(battler))
        {
            battlerIn1 = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);

            if (IsDoubleBattle())
                battlerIn2 = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
            else
                battlerIn2 = battlerIn1;

            party = gEnemyParty;
        }
        else
        {
            // Check if attacker side has mon to switch into
            battlerIn1 = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);

            if (IsDoubleBattle())
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
    CMD_ARGS(u8 battler:7, u8 ignoreEscapePrevention:1, const u8 *jumpInstr);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    if (!cmd->ignoreEscapePrevention && !CanBattlerEscape(battler))
    {
        gBattlescriptCurrInstr = cmd->jumpInstr;
    }
    else
    {
        if (CanBattlerSwitch(battler))
            gBattlescriptCurrInstr = cmd->nextInstr;
        else
           gBattlescriptCurrInstr = cmd->jumpInstr;
    }
}

// Opens the party screen to choose a new Pokémon to send out.
// slotId is the Pokémon to replace.
// Note that this is not used by the Switch action, only replacing fainted Pokémon or Baton Pass
static void ChooseMonToSendOut(u32 battler, u8 slotId)
{
    gBattleStruct->battlerPartyIndexes[battler] = gBattlerPartyIndexes[battler];
    gBattleStruct->monToSwitchIntoId[battler] = PARTY_SIZE;
    gBattleStruct->field_93 &= ~(1u << battler);

    BtlController_EmitChoosePokemon(battler, B_COMM_TO_CONTROLLER, PARTY_ACTION_SEND_OUT, slotId, ABILITY_NONE, gBattleStruct->battlerPartyOrders[battler]);
    MarkBattlerForControllerExec(battler);
}

static void Cmd_openpartyscreen(void)
{
    CMD_ARGS(u8 battler:7, u8 partyScreenOptional:1, const u8 *failInstr);

    u32 flags = 0;
    u8 hitmarkerFaintBits = 0;
    u32 i, battler = 0;
    const u8 *failInstr = cmd->failInstr;

    if (cmd->battler == BS_FAINTED_MULTIPLE_1)
    {
        if ((gBattleTypeFlags & BATTLE_TYPE_MULTI) || !(IsDoubleBattle()))
        {
            for (battler = 0; battler < gBattlersCount; battler++)
            {
                if (gHitMarker & HITMARKER_FAINTED(battler))
                {
                    if (HasNoMonsToSwitch(battler, PARTY_SIZE, PARTY_SIZE))
                    {
                        gAbsentBattlerFlags |= 1u << battler;
                        gHitMarker &= ~HITMARKER_FAINTED(battler);
                        BtlController_EmitLinkStandbyMsg(battler, B_COMM_TO_CONTROLLER, LINK_STANDBY_MSG_ONLY, FALSE);
                        MarkBattlerForControllerExec(battler);
                    }
                    else if (!gSpecialStatuses[battler].faintedHasReplacement)
                    {
                        ChooseMonToSendOut(battler, PARTY_SIZE);
                        gSpecialStatuses[battler].faintedHasReplacement = TRUE;
                    }
                }
                else
                {
                    BtlController_EmitLinkStandbyMsg(battler, B_COMM_TO_CONTROLLER, LINK_STANDBY_MSG_ONLY, FALSE);
                    MarkBattlerForControllerExec(battler);
                }
            }
        }
        else if (IsDoubleBattle())
        {
            bool32 hasReplacement;

            hitmarkerFaintBits = gHitMarker >> 28;
            for (i = 0; i < gBattlersCount; i++)
            {
                if (((1u << i) & hitmarkerFaintBits))
                {
                    if (i > 1 && ((1u << BATTLE_PARTNER(i)) & hitmarkerFaintBits))
                        continue;

                    battler = i;
                    if (HasNoMonsToSwitch(battler, PARTY_SIZE, PARTY_SIZE))
                    {
                        gAbsentBattlerFlags |= 1u << battler;
                        gHitMarker &= ~HITMARKER_FAINTED(battler);
                        BtlController_EmitCantSwitch(battler, B_COMM_TO_CONTROLLER);
                        MarkBattlerForControllerExec(battler);
                    }
                    else if (!gSpecialStatuses[battler].faintedHasReplacement)
                    {
                        ChooseMonToSendOut(battler, gBattleStruct->monToSwitchIntoId[BATTLE_PARTNER(battler)]);
                        gSpecialStatuses[battler].faintedHasReplacement = TRUE;
                    }
                    else if (battler < 2 || (battler > 1 && !(flags & BATTLE_PARTNER(battler))))
                    {
                        BtlController_EmitLinkStandbyMsg(battler, B_COMM_TO_CONTROLLER, LINK_STANDBY_MSG_ONLY, FALSE);
                        MarkBattlerForControllerExec(battler);
                        flags |= battler;
                    }
                }
            }

            for (i = 0; i < NUM_BATTLE_SIDES; i++)
            {
                if (!(gSpecialStatuses[i].faintedHasReplacement))
                {
                    hasReplacement = gSpecialStatuses[BATTLE_PARTNER(i)].faintedHasReplacement;
                    if (!hasReplacement && hitmarkerFaintBits != 0)
                    {
                        if (gAbsentBattlerFlags & (1 << i))
                            battler = BATTLE_PARTNER(i);
                        else
                            battler = i;

                        BtlController_EmitLinkStandbyMsg(battler, B_COMM_TO_CONTROLLER, LINK_STANDBY_MSG_ONLY, FALSE);
                        MarkBattlerForControllerExec(battler);
                    }
                }
            }
        }
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else if (cmd->battler == BS_FAINTED_MULTIPLE_2)
    {
        if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            if (IsDoubleBattle())
            {
                hitmarkerFaintBits = gHitMarker >> 28;
                for (i = 0; i < NUM_BATTLE_SIDES; i++)
                {
                    if ((1 << BATTLE_PARTNER(i)) & hitmarkerFaintBits && (1 << i) & hitmarkerFaintBits)
                    {
                        battler = BATTLE_PARTNER(i);
                        if (HasNoMonsToSwitch(battler, PARTY_SIZE, PARTY_SIZE))
                        {
                            gAbsentBattlerFlags |= (1u << battler);
                            gHitMarker &= ~(HITMARKER_FAINTED(battler));
                            BtlController_EmitCantSwitch(battler, B_COMM_TO_CONTROLLER);
                            MarkBattlerForControllerExec(battler);
                        }
                        else if (!gSpecialStatuses[battler].faintedHasReplacement)
                        {
                            ChooseMonToSendOut(battler, gBattleStruct->monToSwitchIntoId[i]);
                            gSpecialStatuses[battler].faintedHasReplacement = TRUE;
                        }
                    }
                }
                gBattlescriptCurrInstr = cmd->nextInstr;
            }
            else
            {
                // Not multi or double battle
                gBattlescriptCurrInstr = cmd->nextInstr;
            }
        }
        else
        {
            // Multi battle
            gBattlescriptCurrInstr = cmd->nextInstr;
        }

        hitmarkerFaintBits = gHitMarker >> 28;

        gBattlerFainted = 0;
        while (!((1u << gBattlerFainted) & hitmarkerFaintBits)
               && gBattlerFainted < gBattlersCount)
            gBattlerFainted++;

        if (gBattlerFainted == gBattlersCount)
            gBattlescriptCurrInstr = failInstr;
    }
    else
    {
        if (cmd->partyScreenOptional)
            hitmarkerFaintBits = PARTY_ACTION_CHOOSE_MON; // Used here as the caseId for the EmitChoose function.
        else
            hitmarkerFaintBits = PARTY_ACTION_SEND_OUT;

        battler = GetBattlerForBattleScript(cmd->battler);
        if (gSpecialStatuses[battler].faintedHasReplacement)
        {
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        else if (HasNoMonsToSwitch(battler, PARTY_SIZE, PARTY_SIZE))
        {
            gAbsentBattlerFlags |= 1u << battler;
            gHitMarker &= ~HITMARKER_FAINTED(battler);
            gBattlescriptCurrInstr = failInstr;
        }
        else
        {
            gBattleStruct->battlerPartyIndexes[battler] = gBattlerPartyIndexes[battler];
            gBattleStruct->monToSwitchIntoId[battler] = PARTY_SIZE;
            gBattleStruct->field_93 &= ~(1u << battler);

            BtlController_EmitChoosePokemon(battler, B_COMM_TO_CONTROLLER, hitmarkerFaintBits, gBattleStruct->monToSwitchIntoId[BATTLE_PARTNER(battler)], ABILITY_NONE, gBattleStruct->battlerPartyOrders[battler]);
            MarkBattlerForControllerExec(battler);

            gBattlescriptCurrInstr = cmd->nextInstr;

            if (GetBattlerPosition(battler) == B_POSITION_PLAYER_LEFT && gBattleResults.playerSwitchesCounter < 255)
                gBattleResults.playerSwitchesCounter++;

            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                for (i = 0; i < gBattlersCount; i++)
                {
                    if (i != battler)
                    {
                        BtlController_EmitLinkStandbyMsg(i, B_COMM_TO_CONTROLLER, LINK_STANDBY_MSG_ONLY, FALSE);
                        MarkBattlerForControllerExec(i);
                    }
                }
            }
            else
            {
                u32 battlerOpposite = GetBattlerAtPosition(BATTLE_OPPOSITE(GetBattlerPosition(battler)));
                if (gAbsentBattlerFlags & (1u << battlerOpposite))
                    battlerOpposite ^= BIT_FLANK;

                // Make sure we're checking a valid battler. In edge case scenarios - battler could be absent and battlerOpposite would become a non-existent one softlocking the game.
                if (battlerOpposite < gBattlersCount)
                {
                    BtlController_EmitLinkStandbyMsg(battlerOpposite, B_COMM_TO_CONTROLLER, LINK_STANDBY_MSG_ONLY, FALSE);
                    MarkBattlerForControllerExec(battlerOpposite);
                }
            }
        }
    }
}

static void Cmd_switchhandleorder(void)
{
    CMD_ARGS(u8 battler, u8 state);

    u32 battler, i;
    if (gBattleControllerExecFlags)
        return;

    battler = GetBattlerForBattleScript(cmd->battler);

    switch (cmd->state)
    {
    case 0:
        for (i = 0; i < gBattlersCount; i++)
        {
            if (gBattleResources->bufferB[i][0] == CONTROLLER_CHOSENMONRETURNVALUE)
            {
                gBattleStruct->monToSwitchIntoId[i] = gBattleResources->bufferB[i][1];
                if (!(gBattleStruct->field_93 & (1u << i)))
                {
                    RecordedBattle_SetBattlerAction(i, gBattleResources->bufferB[i][1]);
                    gBattleStruct->field_93 |= 1u << i;
                }
            }
        }
        break;
    case 1:
        if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI))
            SwitchPartyOrder(battler);
        break;
    case 2:
        if (!(gBattleStruct->field_93 & (1u << battler)))
        {
            RecordedBattle_SetBattlerAction(battler, gBattleResources->bufferB[battler][1]);
            gBattleStruct->field_93 |= 1u << battler;
        }
        // fall through
    case 3:
        gBattleCommunication[0] = gBattleResources->bufferB[battler][1];
        gBattleStruct->monToSwitchIntoId[battler] = gBattleResources->bufferB[battler][1];

        if (gBattleTypeFlags & BATTLE_TYPE_LINK && gBattleTypeFlags & BATTLE_TYPE_MULTI)
        {
            *(battler * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 0) &= 0xF;
            *(battler * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 0) |= (gBattleResources->bufferB[battler][2] & 0xF0);
            *(battler * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 1) = gBattleResources->bufferB[battler][3];

            *((BATTLE_PARTNER(battler)) * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 0) &= (0xF0);
            *((BATTLE_PARTNER(battler)) * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 0) |= (gBattleResources->bufferB[battler][2] & 0xF0) >> 4;
            *((BATTLE_PARTNER(battler)) * 3 + (u8 *)(gBattleStruct->battlerPartyOrders) + 2) = gBattleResources->bufferB[battler][3];
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER)
        {
            SwitchPartyOrderInGameMulti(battler, gBattleStruct->monToSwitchIntoId[battler]);
        }
        else
        {
            SwitchPartyOrder(battler);
        }

        PREPARE_SPECIES_BUFFER(gBattleTextBuff1, gBattleMons[gBattlerAttacker].species)
        PREPARE_MON_NICK_BUFFER(gBattleTextBuff2, battler, gBattleResources->bufferB[battler][1])
        break;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void SetDmgHazardsBattlescript(u8 battler, u8 multistringId)
{
    gBattleMons[battler].status2 &= ~STATUS2_DESTINY_BOND;
    gHitMarker &= ~HITMARKER_DESTINYBOND;
    gBattleScripting.battler = battler;
    gBattleCommunication[MULTISTRING_CHOOSER] = multistringId;

    BattleScriptPushCursor();
    if (gBattlescriptCurrInstr[1] == BS_TARGET)
        gBattlescriptCurrInstr = BattleScript_DmgHazardsOnTarget;
    else if (gBattlescriptCurrInstr[1] == BS_ATTACKER)
        gBattlescriptCurrInstr = BattleScript_DmgHazardsOnAttacker;
    else if (gBattlescriptCurrInstr[1] == BS_SCRIPTING)
        gBattlescriptCurrInstr = BattleScript_DmgHazardsOnBattlerScripting;
    else
        gBattlescriptCurrInstr = BattleScript_DmgHazardsOnFaintedBattler;
}

bool32 DoSwitchInAbilities(u32 battler)
{
    return (TryPrimalReversion(battler)
         || AbilityBattleEffects(ABILITYEFFECT_ON_SWITCHIN, battler, 0, 0, 0)
         || (gBattleWeather & B_WEATHER_ANY && HasWeatherEffect() && AbilityBattleEffects(ABILITYEFFECT_ON_WEATHER, battler, 0, 0, 0))
         || (gFieldStatuses & STATUS_FIELD_TERRAIN_ANY && AbilityBattleEffects(ABILITYEFFECT_ON_TERRAIN, battler, 0, 0, 0)));
}

static void UpdateSentMonFlags(u32 battler)
{
    UpdateSentPokesToOpponentValue(battler);

    gHitMarker &= ~HITMARKER_FAINTED(battler);
    gSpecialStatuses[battler].faintedHasReplacement = FALSE;

    if (!BattlerHasAi(battler))
        gBattleStruct->appearedInBattle |= 1u << gBattlerPartyIndexes[battler];
}

static bool32 DoSwitchInEffectsForBattler(u32 battler)
{
    u32 i = 0;
    // Neutralizing Gas announces itself before hazards
    if (gBattleMons[battler].ability == ABILITY_NEUTRALIZING_GAS && gSpecialStatuses[battler].announceNeutralizingGas == 0)
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWITCHIN_NEUTRALIZING_GAS;
        gSpecialStatuses[battler].announceNeutralizingGas = TRUE;
        gDisableStructs[battler].neutralizingGas = TRUE;
        gBattlerAbility = battler;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_SwitchInAbilityMsgRet;
    }
    // Healing Wish activates before hazards.
    // Starting from Gen8 - it heals only pokemon which can be healed. In gens 5,6,7 the effect activates anyways.
    else if ((gBattleStruct->battlerState[battler].storedHealingWish || gBattleStruct->battlerState[battler].storedLunarDance)
        && (gBattleMons[battler].hp != gBattleMons[battler].maxHP || gBattleMons[battler].status1 != 0 || B_HEALING_WISH_SWITCH < GEN_8))
    {
        gBattlerAttacker = battler;
        if (gBattleStruct->battlerState[battler].storedHealingWish)
        {
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_HealingWishActivates;
            gBattleStruct->battlerState[battler].storedHealingWish = FALSE;
        }
        else // Lunar Dance
        {
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_LunarDanceActivates;
            gBattleStruct->battlerState[battler].storedLunarDance = FALSE;
        }
    }
    else if (!(gDisableStructs[battler].spikesDone)
        && (gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_SPIKES)
        && GetBattlerAbility(battler) != ABILITY_MAGIC_GUARD
        && IsBattlerAffectedByHazards(battler, FALSE)
        && IsBattlerGrounded(battler))
    {
        u8 spikesDmg = (5 - gSideTimers[GetBattlerSide(battler)].spikesAmount) * 2;
        gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / (spikesDmg);
        if (gBattleStruct->moveDamage[battler] == 0)
            gBattleStruct->moveDamage[battler] = 1;

        gDisableStructs[battler].spikesDone = TRUE;
        SetDmgHazardsBattlescript(battler, B_MSG_PKMNHURTBYSPIKES);
    }
    else if (!(gDisableStructs[battler].stealthRockDone)
        && (gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_STEALTH_ROCK)
        && IsBattlerAffectedByHazards(battler, FALSE)
        && GetBattlerAbility(battler) != ABILITY_MAGIC_GUARD)
    {
        gDisableStructs[battler].stealthRockDone = TRUE;
        gBattleStruct->moveDamage[battler] = GetStealthHazardDamage(TYPE_SIDE_HAZARD_POINTED_STONES, battler);

        if (gBattleStruct->moveDamage[battler] != 0)
            SetDmgHazardsBattlescript(battler, B_MSG_STEALTHROCKDMG);
    }
    else if (!(gDisableStructs[battler].toxicSpikesDone)
        && (gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_TOXIC_SPIKES)
        && IsBattlerGrounded(battler))
    {
        gDisableStructs[battler].toxicSpikesDone = TRUE;
        if (IS_BATTLER_OF_TYPE(battler, TYPE_POISON)) // Absorb the toxic spikes.
        {
            gSideStatuses[GetBattlerSide(battler)] &= ~SIDE_STATUS_TOXIC_SPIKES;
            gSideTimers[GetBattlerSide(battler)].toxicSpikesAmount = 0;
            gBattleScripting.battler = battler;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_ToxicSpikesAbsorbed;
        }
        else if (IsBattlerAffectedByHazards(battler, TRUE))
        {
            if (CanBePoisoned(gBattlerAttacker, battler, GetBattlerAbility(gBattlerAttacker), GetBattlerAbility(battler)))
            {
                u32 tspikes = 0;
                if (gSideTimers[GetBattlerSide(battler)].toxicSpikesAmount >= 2) {
                    tspikes = 1;
                    gBattleMons[battler].status1 |= STATUS1_TOXIC_POISON;
                }
                else
                    gBattleMons[battler].status1 |= STATUS1_POISON;

                BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[battler].status1), &gBattleMons[battler].status1);
                MarkBattlerForControllerExec(battler);
                gBattleScripting.battler = battler;
                BattleScriptPushCursor();
                if (tspikes == 0)
                    gBattlescriptCurrInstr = BattleScript_ToxicSpikesPoisoned;
                else
                    gBattlescriptCurrInstr = BattleScript_ToxicSpikesBadlyPoisoned;
            }
        }
    }
    else if (!(gDisableStructs[battler].stickyWebDone)
        && (gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_STICKY_WEB)
        && IsBattlerAffectedByHazards(battler, FALSE)
        && IsBattlerGrounded(battler))
    {
        gDisableStructs[battler].stickyWebDone = TRUE;
        gBattleScripting.battler = battler;
        SET_STATCHANGER(STAT_SPEED, 1, TRUE);
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_StickyWebOnSwitchIn;
    }
    else if (!(gDisableStructs[battler].steelSurgeDone)
        && (gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_STEELSURGE)
        && IsBattlerAffectedByHazards(battler, FALSE)
        && GetBattlerAbility(battler) != ABILITY_MAGIC_GUARD)
    {
        gDisableStructs[battler].steelSurgeDone = TRUE;
        gBattleStruct->moveDamage[battler] = GetStealthHazardDamage(TYPE_SIDE_HAZARD_SHARP_STEEL, battler);

        if (gBattleStruct->moveDamage[battler] != 0)
            SetDmgHazardsBattlescript(battler, B_MSG_SHARPSTEELDMG);
    }
    else if (gBattleMons[battler].hp != gBattleMons[battler].maxHP && gBattleStruct->zmove.healReplacement)
    {
        gBattleStruct->zmove.healReplacement = FALSE;
        gBattleStruct->moveDamage[battler] = -1 * (gBattleMons[battler].maxHP);
        gBattleScripting.battler = battler;
        BattleScriptPushCursor();
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_Z_HP_TRAP;
        gBattlescriptCurrInstr = BattleScript_HealReplacementZMove;
        return TRUE;
    }
    else
    {
        u32 battlerAbility = GetBattlerAbility(battler);
        // There is a hack here to ensure the truant counter will be 0 when the battler's next turn starts.
        // The truant counter is not updated in the case where a mon switches in after a lost judgment in the battle arena.
        if (battlerAbility == ABILITY_TRUANT
            && gCurrentActionFuncId != B_ACTION_USE_MOVE
            && !gDisableStructs[battler].truantSwitchInHack)
            gDisableStructs[battler].truantCounter = 1;

        gDisableStructs[battler].truantSwitchInHack = 0;

        if (DoSwitchInAbilities(battler) || ItemBattleEffects(ITEMEFFECT_ON_SWITCH_IN, battler, FALSE))
            return TRUE;
        else if (AbilityBattleEffects(ABILITYEFFECT_OPPORTUNIST, battler, 0, 0, 0))
            return TRUE;

        for (i = 0; i < gBattlersCount; i++)
        {
            if (i == battler)
                continue;

            switch (GetBattlerAbility(i))
            {
            case ABILITY_TRACE:
            case ABILITY_COMMANDER:
                if (AbilityBattleEffects(ABILITYEFFECT_ON_SWITCHIN, i, 0, 0, 0))
                    return TRUE;
                break;
            case ABILITY_FORECAST:
            case ABILITY_FLOWER_GIFT:
            case ABILITY_PROTOSYNTHESIS:
                if (AbilityBattleEffects(ABILITYEFFECT_ON_WEATHER, i, 0, 0, 0))
                    return TRUE;
                break;
            }
            if (TryClearIllusion(i, ABILITYEFFECT_ON_SWITCHIN))
                return TRUE;
        }

        gDisableStructs[battler].stickyWebDone = FALSE;
        gDisableStructs[battler].spikesDone = FALSE;
        gDisableStructs[battler].toxicSpikesDone = FALSE;
        gDisableStructs[battler].stealthRockDone = FALSE;
        gDisableStructs[battler].steelSurgeDone = FALSE;

        for (i = 0; i < gBattlersCount; i++)
        {
            if (gBattlerByTurnOrder[i] == battler)
                gActionsByTurnOrder[i] = B_ACTION_CANCEL_PARTNER;

            gBattleStruct->hpOnSwitchout[GetBattlerSide(i)] = gBattleMons[i].hp;
        }

        gBattleStruct->battlerState[battler].forcedSwitch = FALSE;
        return FALSE;
    }

    return TRUE; // Effect's script plays.
}

static void Cmd_switchineffects(void)
{
    CMD_ARGS(u8 battler);
    u32 i, battler = GetBattlerForBattleScript(cmd->battler);

    switch (cmd->battler)
    {
    // Multiple mons fainted and are being switched-in. Their abilities/hazards will play according to speed ties.
    case BS_FAINTED_MULTIPLE_1: // Saves the battlers.
        gBattleStruct->battlerState[battler].multipleSwitchInBattlers = TRUE;
        UpdateSentMonFlags(battler);

        // Increment fainted battler.
        do
        {
            gBattlerFainted++;
            if (gBattlerFainted >= gBattlersCount)
                break;
            if (gHitMarker & HITMARKER_FAINTED(gBattlerFainted) && !(gAbsentBattlerFlags & (1u << gBattlerFainted)))
                break;
        } while (1);

        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    case BS_FAINTED_MULTIPLE_2: // Plays hazards/abilities.
        switch (gBattleStruct->multipleSwitchInState)
        {
        case 0: // Sort battlers by speed
            for (i = 0; i < gBattlersCount; i++)
                gBattleStruct->multipleSwitchInSortedBattlers[i] = i;
            SortBattlersBySpeed(gBattleStruct->multipleSwitchInSortedBattlers, FALSE);
            gBattleStruct->multipleSwitchInState++;
            gBattleStruct->multipleSwitchInCursor = 0;
            // Loop through all available battlers
        case 1:
            for (; gBattleStruct->multipleSwitchInCursor < gBattlersCount; gBattleStruct->multipleSwitchInCursor++)
            {
                gBattlerFainted = gBattleStruct->multipleSwitchInSortedBattlers[gBattleStruct->multipleSwitchInCursor];
                if (gBattleStruct->battlerState[gBattlerFainted].multipleSwitchInBattlers)
                {
                    if (DoSwitchInEffectsForBattler(gBattlerFainted))
                        return;
                }
            }
            // All battlers done, end
            for (i = 0; i < gBattlersCount; i++)
                gBattleStruct->battlerState[i].multipleSwitchInBattlers = FALSE;

            gBattleStruct->multipleSwitchInState = 0;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        break;
    default:
        UpdateSentMonFlags(battler);
        if (!DoSwitchInEffectsForBattler(battler))
            gBattlescriptCurrInstr = cmd->nextInstr;
        break;
    }
}

static void Cmd_trainerslidein(void)
{
    CMD_ARGS(u8 position);

    u32 battler = GetBattlerForBattleScript(cmd->position);
    BtlController_EmitTrainerSlide(battler, B_COMM_TO_CONTROLLER);
    MarkBattlerForControllerExec(battler);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_playse(void)
{
    CMD_ARGS(u16 song);

    BtlController_EmitPlaySE(gBattlerAttacker, B_COMM_TO_CONTROLLER, cmd->song);
    MarkBattlerForControllerExec(gBattlerAttacker);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_fanfare(void)
{
    CMD_ARGS(u16 song);

    BtlController_EmitPlayFanfareOrBGM(gBattlerAttacker, B_COMM_TO_CONTROLLER, cmd->song, FALSE);
    MarkBattlerForControllerExec(gBattlerAttacker);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_playfaintcry(void)
{
    CMD_ARGS(u8 battler);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    BtlController_EmitFaintingCry(battler, B_COMM_TO_CONTROLLER);
    MarkBattlerForControllerExec(battler);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_endlinkbattle(void)
{
    CMD_ARGS();

    u32 battler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
    BtlController_EmitEndLinkBattle(battler, B_COMM_TO_CONTROLLER, gBattleOutcome);
    MarkBattlerForControllerExec(battler);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_returntoball(void)
{
    CMD_ARGS(u8 battler, bool8 changingForm);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    BtlController_EmitReturnMonToBall(battler, B_COMM_TO_CONTROLLER, TRUE);
    MarkBattlerForControllerExec(battler);

    // Don't always execute a form change here otherwise we can stomp gigantamax
    if(!cmd->changingForm)
        TryBattleFormChange(battler, FORM_CHANGE_BATTLE_SWITCH);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_handlelearnnewmove(void)
{
    CMD_ARGS(const u8 *learnedMovePtr, const u8 *nothingToLearnPtr, bool8 isFirstMove);

    u16 learnMove = MOVE_NONE;
    u32 monId = gBattleStruct->expGetterMonId;
    u32 currLvl = GetMonData(&gPlayerParty[monId], MON_DATA_LEVEL);

    if (!gBattleResources->beforeLvlUp->learnMultipleMoves && gBattleResources->beforeLvlUp->level != (currLvl - 1))
        gBattleResources->beforeLvlUp->learnMultipleMoves = TRUE;

    if (B_LEVEL_UP_NOTIFICATION >= GEN_9 && gBattleResources->beforeLvlUp->learnMultipleMoves)
    {
        while (gBattleResources->beforeLvlUp->level <= currLvl)
        {
            learnMove = MonTryLearningNewMoveAtLevel(&gPlayerParty[monId], cmd->isFirstMove, gBattleResources->beforeLvlUp->level);

            while (learnMove == MON_ALREADY_KNOWS_MOVE)
                learnMove = MonTryLearningNewMoveAtLevel(&gPlayerParty[monId], FALSE, gBattleResources->beforeLvlUp->level);

            if (learnMove != MOVE_NONE)
                break;

            gBattleResources->beforeLvlUp->level++;
        }
    }
    else
    {
        learnMove = MonTryLearningNewMove(&gPlayerParty[monId], cmd->isFirstMove);
        while (learnMove == MON_ALREADY_KNOWS_MOVE)
            learnMove = MonTryLearningNewMove(&gPlayerParty[monId], FALSE);
    }

    if (learnMove == MOVE_NONE || RECORDED_WILD_BATTLE)
    {
        gBattlescriptCurrInstr = cmd->nothingToLearnPtr;
    }
    else if (learnMove == MON_HAS_MAX_MOVES)
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        u32 battler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);

        if (gBattlerPartyIndexes[battler] == monId
            && !(gBattleMons[battler].status2 & STATUS2_TRANSFORMED))
        {
            GiveMoveToBattleMon(&gBattleMons[battler], learnMove);
        }
        if (IsDoubleBattle())
        {
            battler = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
            if (gBattlerPartyIndexes[battler] == monId
                && !(gBattleMons[battler].status2 & STATUS2_TRANSFORMED))
            {
                GiveMoveToBattleMon(&gBattleMons[battler], learnMove);
            }
        }

        gBattlescriptCurrInstr = cmd->learnedMovePtr;
    }
}

static void Cmd_yesnoboxlearnmove(void)
{
    CMD_ARGS(const u8 *forgotMovePtr);

    switch (gBattleScripting.learnMoveState)
    {
    case 0:
        HandleBattleWindow(YESNOBOX_X_Y, 0);
        BattlePutTextOnWindow(gText_BattleYesNoChoice, B_WIN_YESNO);
        gBattleScripting.learnMoveState++;
        gBattleCommunication[CURSOR_POSITION] = 0;
        BattleCreateYesNoCursorAt(0);
        break;
    case 1:
        if (JOY_NEW(DPAD_UP) && gBattleCommunication[CURSOR_POSITION] != 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt(gBattleCommunication[CURSOR_POSITION]);
            gBattleCommunication[CURSOR_POSITION] = 0;
            BattleCreateYesNoCursorAt(0);
        }
        if (JOY_NEW(DPAD_DOWN) && gBattleCommunication[CURSOR_POSITION] == 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt(gBattleCommunication[CURSOR_POSITION]);
            gBattleCommunication[CURSOR_POSITION] = 1;
            BattleCreateYesNoCursorAt(1);
        }
        if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            if (gBattleCommunication[1] == 0)
            {
                HandleBattleWindow(YESNOBOX_X_Y, WINDOW_CLEAR);
                BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
                gBattleScripting.learnMoveState++;
            }
            else
            {
                gBattleScripting.learnMoveState = 5;
            }
        }
        else if (JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            gBattleScripting.learnMoveState = 5;
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
            gBattleScripting.learnMoveState++;
        }
        break;
    case 4:
        if (!gPaletteFade.active && gMain.callback2 == BattleMainCB2)
        {
            u8 movePosition = GetMoveSlotToReplace();
            if (movePosition == MAX_MON_MOVES)
            {
                gBattleScripting.learnMoveState = 5;
            }
            else
            {
                u16 move = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_MOVE1 + movePosition);
                if (IsMoveHM(move))
                {
                    PrepareStringBattle(STRINGID_HMMOVESCANTBEFORGOTTEN, B_POSITION_PLAYER_LEFT);
                    gBattleScripting.learnMoveState = 6;
                }
                else
                {
                    gBattlescriptCurrInstr = cmd->forgotMovePtr;

                    PREPARE_MOVE_BUFFER(gBattleTextBuff2, move)

                    RemoveMonPPBonus(&gPlayerParty[gBattleStruct->expGetterMonId], movePosition);
                    SetMonMoveSlot(&gPlayerParty[gBattleStruct->expGetterMonId], gMoveToLearn, movePosition);

                    if (gBattlerPartyIndexes[0] == gBattleStruct->expGetterMonId && MOVE_IS_PERMANENT(0, movePosition))
                    {
                        RemoveBattleMonPPBonus(&gBattleMons[0], movePosition);
                        SetBattleMonMoveSlot(&gBattleMons[0], gMoveToLearn, movePosition);
                    }
                    if (IsDoubleBattle()
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
    case 5:
        HandleBattleWindow(YESNOBOX_X_Y, WINDOW_CLEAR);
        gBattlescriptCurrInstr = cmd->nextInstr;
        break;
    case 6:
        if (gBattleControllerExecFlags == 0)
        {
            gBattleScripting.learnMoveState = 2;
        }
        break;
    }
}

static void Cmd_yesnoboxstoplearningmove(void)
{
    CMD_ARGS(const u8 *noInstr);

    switch (gBattleScripting.learnMoveState)
    {
    case 0:
        HandleBattleWindow(YESNOBOX_X_Y, 0);
        BattlePutTextOnWindow(gText_BattleYesNoChoice, B_WIN_YESNO);
        gBattleScripting.learnMoveState++;
        gBattleCommunication[CURSOR_POSITION] = 0;
        BattleCreateYesNoCursorAt(0);
        break;
    case 1:
        if (JOY_NEW(DPAD_UP) && gBattleCommunication[CURSOR_POSITION] != 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt(gBattleCommunication[CURSOR_POSITION]);
            gBattleCommunication[CURSOR_POSITION] = 0;
            BattleCreateYesNoCursorAt(0);
        }
        if (JOY_NEW(DPAD_DOWN) && gBattleCommunication[CURSOR_POSITION] == 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt(gBattleCommunication[CURSOR_POSITION]);
            gBattleCommunication[CURSOR_POSITION] = 1;
            BattleCreateYesNoCursorAt(1);
        }
        if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);

            if (gBattleCommunication[1] != 0)
                gBattlescriptCurrInstr = cmd->noInstr;
            else
                gBattlescriptCurrInstr = cmd->nextInstr;

            HandleBattleWindow(YESNOBOX_X_Y, WINDOW_CLEAR);
        }
        else if (JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            gBattlescriptCurrInstr = cmd->noInstr;
            HandleBattleWindow(YESNOBOX_X_Y, WINDOW_CLEAR);
        }
        break;
    }
}

static void Cmd_hitanimation(void)
{
    CMD_ARGS(u8 battler);

    if (!IsDoubleSpreadMove())
    {
        u32 battler = GetBattlerForBattleScript(cmd->battler);

        if (!(gBattleStruct->moveResultFlags[battler] & MOVE_RESULT_NO_EFFECT))
        {
            if (!(gHitMarker & HITMARKER_IGNORE_SUBSTITUTE)
             || !(DoesSubstituteBlockMove(gBattlerAttacker, battler, gCurrentMove))
             || gDisableStructs[battler].substituteHP == 0)
            {
                BtlController_EmitHitAnimation(battler, B_COMM_TO_CONTROLLER);
                MarkBattlerForControllerExec(battler);
            }
        }
    }
    else if (!gBattleStruct->doneDoublesSpreadHit)
    {
        u32 battlerDef;
        for (battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
        {
            if (gBattleStruct->moveResultFlags[battlerDef] & MOVE_RESULT_NO_EFFECT
             || gBattleStruct->noResultString[battlerDef])
                continue;

            if (!(gHitMarker & HITMARKER_IGNORE_SUBSTITUTE)
             || !(DoesSubstituteBlockMove(gBattlerAttacker, battlerDef, gCurrentMove))
             || gDisableStructs[battlerDef].substituteHP == 0)
            {
                BtlController_EmitHitAnimation(battlerDef, B_COMM_TO_CONTROLLER);
                MarkBattlerForControllerExec(battlerDef);
            }
        }
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static u32 GetTrainerMoneyToGive(u16 trainerId)
{
    u32 lastMonLevel = 0;
    u32 moneyReward;
    u8 trainerMoney = 0;

    if (trainerId == TRAINER_SECRET_BASE)
    {
        moneyReward = 20 * gBattleResources->secretBase->party.levels[0] * gBattleStruct->moneyMultiplier;
    }
    else
    {
        const struct TrainerMon *party = GetTrainerPartyFromId(trainerId);
        if (party == NULL)
            return 20;
        lastMonLevel = party[GetTrainerPartySizeFromId(trainerId) - 1].lvl;
        trainerMoney = gTrainerClasses[GetTrainerClassFromId(trainerId)].money ?: 5;

        if (gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS)
            moneyReward = 4 * lastMonLevel * gBattleStruct->moneyMultiplier * trainerMoney;
        else if (IsDoubleBattle())
            moneyReward = 4 * lastMonLevel * gBattleStruct->moneyMultiplier * 2 * trainerMoney;
        else
            moneyReward = 4 * lastMonLevel * gBattleStruct->moneyMultiplier * trainerMoney;
    }

    return moneyReward;
}

static void Cmd_getmoneyreward(void)
{
    CMD_ARGS();

    u32 money;
    u8 sPartyLevel = 1;

    if (gBattleOutcome == B_OUTCOME_WON)
    {
        money = GetTrainerMoneyToGive(TRAINER_BATTLE_PARAM.opponentA);
        if (gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS)
            money += GetTrainerMoneyToGive(TRAINER_BATTLE_PARAM.opponentB);
        AddMoney(&gSaveBlock1Ptr->money, money);
    }
    else
    {
        if (B_WHITEOUT_MONEY <= GEN_3)
        {
            money = GetMoney(&gSaveBlock1Ptr->money) / 2;
        }
        else
        {
            s32 i, count;
            for (i = 0; i < PARTY_SIZE; i++)
            {
                if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG) != SPECIES_NONE
                && GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG) != SPECIES_EGG)
                {
                    if (GetMonData(&gPlayerParty[i], MON_DATA_LEVEL) > sPartyLevel)
                        sPartyLevel = GetMonData(&gPlayerParty[i], MON_DATA_LEVEL);
                }
            }
            for (count = 0, i = 0; i < ARRAY_COUNT(gBadgeFlags); i++)
            {
                if (FlagGet(gBadgeFlags[i]) == TRUE)
                    ++count;
            }
            money = sWhiteOutBadgeMoney[count] * sPartyLevel;
        }
        RemoveMoney(&gSaveBlock1Ptr->money, money);
    }

    PREPARE_WORD_NUMBER_BUFFER(gBattleTextBuff1, 5, money);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

// Command is never used
static void Cmd_updatebattlermoves(void)
{
    CMD_ARGS(u8 battler);

    u32 battler = GetBattlerForBattleScript(cmd->battler);

    switch (gBattleCommunication[0])
    {
    case 0:
        BtlController_EmitGetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_ALL_BATTLE, 0);
        MarkBattlerForControllerExec(battler);
        gBattleCommunication[0]++;
        break;
    case 1:
         if (gBattleControllerExecFlags == 0)
         {
            s32 i;
            struct BattlePokemon *bufferPoke = (struct BattlePokemon *) &gBattleResources->bufferB[battler][4];
            for (i = 0; i < MAX_MON_MOVES; i++)
            {
                gBattleMons[battler].moves[i] = bufferPoke->moves[i];
                gBattleMons[battler].pp[i] = bufferPoke->pp[i];
            }
            gBattlescriptCurrInstr = cmd->nextInstr;
         }
         break;
    }
}

static void Cmd_swapattackerwithtarget(void)
{
    CMD_ARGS();

    u32 temp;
    SWAP(gBattlerAttacker, gBattlerTarget, temp);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_incrementgamestat(void)
{
    CMD_ARGS(u8 stat);

    if (IsOnPlayerSide(gBattlerAttacker))
        IncrementGameStat(cmd->stat);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_drawpartystatussummary(void)
{
    CMD_ARGS(u8 battler);

    u32 battler, i;
    struct Pokemon *party;
    struct HpAndStatus hpStatuses[PARTY_SIZE];

    if (gBattleControllerExecFlags)
        return;

    battler = GetBattlerForBattleScript(cmd->battler);
    party = GetBattlerParty(battler);

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

    BtlController_EmitDrawPartyStatusSummary(battler, B_COMM_TO_CONTROLLER, hpStatuses, 1);
    MarkBattlerForControllerExec(battler);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_hidepartystatussummary(void)
{
    CMD_ARGS(u8 battler);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    BtlController_EmitHidePartyStatusSummary(battler, B_COMM_TO_CONTROLLER);
    MarkBattlerForControllerExec(battler);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void ResetValuesForCalledMove(void)
{
    if (gBattlerByTurnOrder[gCurrentTurnActionNumber] != gBattlerAttacker)
        gBattleStruct->atkCancellerTracker = 0;
    else
        SetAtkCancellerForCalledMove();
    gBattleScripting.animTurn = 0;
    gBattleScripting.animTargetsHit = 0;
    SetTypeBeforeUsingMove(gCurrentMove, gBattlerAttacker);
    HandleMoveTargetRedirection();
    ClearDamageCalcResults();
}

static void Cmd_jumptocalledmove(void)
{
    CMD_ARGS(bool8 notChosenMove);

    if (cmd->notChosenMove)
        gCurrentMove = gCalledMove;
    else
        gChosenMove = gCurrentMove = gCalledMove;

    ResetValuesForCalledMove();

    gBattlescriptCurrInstr = GetMoveBattleScript(gCurrentMove);
}

static void Cmd_statusanimation(void)
{
    CMD_ARGS(u8 battler);

    if (gBattleControllerExecFlags == 0)
    {
        u32 battler = GetBattlerForBattleScript(cmd->battler);
        if (!(gStatuses3[battler] & STATUS3_SEMI_INVULNERABLE)
            && gDisableStructs[battler].substituteHP == 0
            && !(gHitMarker & (HITMARKER_NO_ANIMATIONS | HITMARKER_DISABLE_ANIMATION)))
        {
            BtlController_EmitStatusAnimation(battler, B_COMM_TO_CONTROLLER, FALSE, gBattleMons[battler].status1);
            MarkBattlerForControllerExec(battler);
        }
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_status2animation(void)
{
    CMD_ARGS(u8 battler, u32 status2);

    if (gBattleControllerExecFlags == 0)
    {
        u32 battler = GetBattlerForBattleScript(cmd->battler);
        u32 status2ToAnim = cmd->status2;
        if (!(gStatuses3[battler] & STATUS3_SEMI_INVULNERABLE)
            && gDisableStructs[battler].substituteHP == 0
            && !(gHitMarker & (HITMARKER_NO_ANIMATIONS | HITMARKER_DISABLE_ANIMATION)))
        {
            BtlController_EmitStatusAnimation(battler, B_COMM_TO_CONTROLLER, TRUE, gBattleMons[battler].status2 & status2ToAnim);
            MarkBattlerForControllerExec(battler);
        }
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_chosenstatusanimation(void)
{
    CMD_ARGS(u8 battler, bool8 isStatus2, u32 status);

    if (gBattleControllerExecFlags == 0)
    {
        u32 battler = GetBattlerForBattleScript(cmd->battler);
        u32 wantedStatus = cmd->status;
        if (!(gStatuses3[battler] & STATUS3_SEMI_INVULNERABLE)
            && gDisableStructs[battler].substituteHP == 0
            && !(gHitMarker & (HITMARKER_NO_ANIMATIONS | HITMARKER_DISABLE_ANIMATION)))
        {
            BtlController_EmitStatusAnimation(battler, B_COMM_TO_CONTROLLER, cmd->isStatus2, wantedStatus);
            MarkBattlerForControllerExec(battler);
        }
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_yesnobox(void)
{
    CMD_ARGS();

    switch (gBattleCommunication[0])
    {
    case 0:
        HandleBattleWindow(YESNOBOX_X_Y, 0);
        BattlePutTextOnWindow(gText_BattleYesNoChoice, B_WIN_YESNO);
        gBattleCommunication[0]++;
        gBattleCommunication[CURSOR_POSITION] = 0;
        BattleCreateYesNoCursorAt(0);
        break;
    case 1:
        if (JOY_NEW(DPAD_UP) && gBattleCommunication[CURSOR_POSITION] != 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt(gBattleCommunication[CURSOR_POSITION]);
            gBattleCommunication[CURSOR_POSITION] = 0;
            BattleCreateYesNoCursorAt(0);
        }
        if (JOY_NEW(DPAD_DOWN) && gBattleCommunication[CURSOR_POSITION] == 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt(gBattleCommunication[CURSOR_POSITION]);
            gBattleCommunication[CURSOR_POSITION] = 1;
            BattleCreateYesNoCursorAt(1);
        }
        if (JOY_NEW(B_BUTTON))
        {
            gBattleCommunication[CURSOR_POSITION] = 1;
            PlaySE(SE_SELECT);
            HandleBattleWindow(YESNOBOX_X_Y, WINDOW_CLEAR);
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        else if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            HandleBattleWindow(YESNOBOX_X_Y, WINDOW_CLEAR);
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        break;
    }
}

static void Cmd_cancelallactions(void)
{
    CMD_ARGS();

    s32 i;

    for (i = 0; i < gBattlersCount; i++)
        gActionsByTurnOrder[i] = B_ACTION_CANCEL_PARTNER;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_setgravity(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gFieldStatuses & STATUS_FIELD_GRAVITY)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gFieldStatuses |= STATUS_FIELD_GRAVITY;
        gFieldTimers.gravityTimer = gBattleTurnCounter + 5;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static bool32 TryCheekPouch(u32 battler, u32 itemId)
{
    if (GetItemPocket(itemId) == POCKET_BERRIES
        && GetBattlerAbility(battler) == ABILITY_CHEEK_POUCH
        && !(gStatuses3[battler] & STATUS3_HEAL_BLOCK)
        && gBattleStruct->partyState[GetBattlerSide(battler)][gBattlerPartyIndexes[battler]].ateBerry
        && !IsBattlerAtMaxHp(battler))
    {
        gBattleStruct->cheekPouchActivated = TRUE;
        gBattleStruct->savedcheekPouchDamage = gBattleStruct->moveDamage[battler];
        gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 3;
        if (gBattleStruct->moveDamage[battler] == 0)
            gBattleStruct->moveDamage[battler] = 1;
        gBattleStruct->moveDamage[battler] *= -1;
        gBattlerAbility = battler;
        BattleScriptPush(gBattlescriptCurrInstr + 2);
        gBattlescriptCurrInstr = BattleScript_CheekPouchActivates;
        return TRUE;
    }
    return FALSE;
}

// When Cheek Pouch activates mid-battle it overwrites the current damage, so restore it
static void TryRestoreDamageAfterCheeckPouch(u32 battler)
{
    if (gBattleStruct->cheekPouchActivated)
    {
        gBattleStruct->moveDamage[battler] = gBattleStruct->savedcheekPouchDamage;
        gBattleStruct->cheekPouchActivated = FALSE;
    }
}

// Used by Bestow and Symbiosis to take an item from one battler and give to another.
static void BestowItem(u32 battlerAtk, u32 battlerDef)
{
    gLastUsedItem = gBattleMons[battlerAtk].item;

    gBattleMons[battlerAtk].item = ITEM_NONE;
    BtlController_EmitSetMonData(battlerAtk, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[battlerAtk].item), &gBattleMons[battlerAtk].item);
    MarkBattlerForControllerExec(battlerAtk);
    CheckSetUnburden(battlerAtk);

    gBattleMons[battlerDef].item = gLastUsedItem;
    BtlController_EmitSetMonData(battlerDef, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[battlerDef].item), &gBattleMons[battlerDef].item);
    MarkBattlerForControllerExec(battlerDef);
    gDisableStructs[battlerDef].unburdenActive = FALSE;
}

// Called by Cmd_removeitem. itemId represents the item that was removed, not being given.
static bool32 TrySymbiosis(u32 battler, u32 itemId)
{
    if (!gBattleStruct->itemLost[B_SIDE_PLAYER][gBattlerPartyIndexes[battler]].stolen
        && gBattleStruct->changedItems[battler] == ITEM_NONE
        && GetBattlerHoldEffect(battler, TRUE) != HOLD_EFFECT_EJECT_BUTTON
        && GetBattlerHoldEffect(battler, TRUE) != HOLD_EFFECT_EJECT_PACK
        && (B_SYMBIOSIS_GEMS < GEN_7 || !(gSpecialStatuses[battler].gemBoost))
        && gCurrentMove != MOVE_FLING //Fling and damage-reducing berries are handled separately.
        && !gSpecialStatuses[battler].berryReduced
        && TryTriggerSymbiosis(battler, BATTLE_PARTNER(battler)))
    {
        BestowItem(BATTLE_PARTNER(battler), battler);
        gLastUsedAbility = gBattleMons[BATTLE_PARTNER(battler)].ability;
        gBattleScripting.battler = gBattlerAbility = BATTLE_PARTNER(battler);
        gBattlerAttacker = battler;
        BattleScriptPush(gBattlescriptCurrInstr + 2);
        gBattlescriptCurrInstr = BattleScript_SymbiosisActivates;
        return TRUE;
    }
    return FALSE;
}

static void Cmd_removeitem(void)
{
    CMD_ARGS(u8 battler);

    u32 battler;
    u16 itemId = 0;

    if (gBattleScripting.overrideBerryRequirements)
    {
        // bug bite / pluck - don't remove current item
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }

    battler = GetBattlerForBattleScript(cmd->battler);
    itemId = gBattleMons[battler].item;

    // Popped Air Balloon cannot be restored by any means.
    // Corroded items cannot be restored either.
    if (GetBattlerHoldEffect(battler, TRUE) != HOLD_EFFECT_AIR_BALLOON
        && GetMoveEffect(gCurrentMove) != EFFECT_CORROSIVE_GAS)
        gBattleStruct->usedHeldItems[gBattlerPartyIndexes[battler]][GetBattlerSide(battler)] = itemId; // Remember if switched out

    gBattleMons[battler].item = ITEM_NONE;
    gBattleStruct->battlerState[battler].canPickupItem = TRUE;
    CheckSetUnburden(battler);

    BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[battler].item), &gBattleMons[battler].item);
    MarkBattlerForControllerExec(battler);

    ClearBattlerItemEffectHistory(battler);
    if (!TryCheekPouch(battler, itemId) && !TrySymbiosis(battler, itemId))
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_atknameinbuff1(void)
{
    CMD_ARGS();

    PREPARE_MON_NICK_BUFFER(gBattleTextBuff1, gBattlerAttacker, gBattlerPartyIndexes[gBattlerAttacker]);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_drawlvlupbox(void)
{
    CMD_ARGS();

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
        if (gMain.newKeys != 0 || RECORDED_WILD_BATTLE)
        {
            // Draw page 2 of level up box
            PlaySE(SE_SELECT);
            DrawLevelUpWindow2();
            CopyWindowToVram(B_WIN_LEVEL_UP_BOX, COPYWIN_GFX);
            gBattleScripting.drawlvlupboxState++;
        }
        break;
    case 8:
        if (gMain.newKeys != 0 || RECORDED_WILD_BATTLE)
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
            gBattlescriptCurrInstr = cmd->nextInstr;
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
    struct TextPrinterTemplate printerTemplate;
    u8 *txtPtr;
    u32 var;

    struct Pokemon *mon = &gPlayerParty[gBattleStruct->expGetterMonId];
    u32 monLevel = GetMonData(mon, MON_DATA_LEVEL);
    u8 monGender = GetMonGender(mon);
    GetMonNickname(mon, gStringVar4);

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
    *(txtPtr)++ = CHAR_EXTRA_SYMBOL;
    *(txtPtr)++ = CHAR_LV_2;

    var = (u32)(txtPtr);
    txtPtr = ConvertIntToDecimalStringN(txtPtr, monLevel, STR_CONV_MODE_LEFT_ALIGN, 3);
    var = (u32)(txtPtr) - var;
    txtPtr = StringFill(txtPtr, CHAR_SPACER, 4 - var);

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
    struct SpriteSheet iconSheet;
    struct SpritePalette iconPalSheet;

    struct Pokemon *mon = &gPlayerParty[gBattleStruct->expGetterMonId];
    u32 species = GetMonData(mon, MON_DATA_SPECIES);
    u32 personality = GetMonData(mon, MON_DATA_PERSONALITY);

    iconSheet.data = GetMonIconPtr(species, personality);
    iconSheet.size = 0x200;
    iconSheet.tag = TAG_LVLUP_BANNER_MON_ICON;

    iconPalSheet.data = GetValidMonIconPalettePtr(species);
    iconPalSheet.tag = TAG_LVLUP_BANNER_MON_ICON;

    LoadSpriteSheet(&iconSheet);
    LoadSpritePalette(&iconPalSheet);

    spriteId = CreateSprite(&sSpriteTemplate_MonIconOnLvlUpBanner, 256, 10, 0);
    gSprites[spriteId].sDestroy = FALSE;
    gSprites[spriteId].sXOffset = gBattle_BG2_X;
}

static void SpriteCB_MonIconOnLvlUpBanner(struct Sprite *sprite)
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
    if (IsDoubleBattle() && gBattlerPartyIndexes[2] == gBattleStruct->expGetterMonId)
        return TRUE;

    return FALSE;
}

static void Cmd_resetsentmonsvalue(void)
{
    CMD_ARGS();

    ResetSentPokesToOpponentValue();
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_setatktoplayer0(void)
{
    CMD_ARGS();

    gBattlerAttacker = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_makevisible(void)
{
    CMD_ARGS(u8 battler);
    u32 battler;

    if (gBattleControllerExecFlags)
        return;

    battler = GetBattlerForBattleScript(cmd->battler);
    BtlController_EmitSpriteInvisibility(battler, B_COMM_TO_CONTROLLER, FALSE);
    MarkBattlerForControllerExec(battler);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_recordability(void)
{
    CMD_ARGS(u8 battler);

    u8 battler = GetBattlerForBattleScript(cmd->battler);
    RecordAbilityBattle(battler, gBattleMons[battler].ability);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BufferMoveToLearnIntoBattleTextBuff2(void)
{
    PREPARE_MOVE_BUFFER(gBattleTextBuff2, gMoveToLearn);
}

static void Cmd_buffermovetolearn(void)
{
    CMD_ARGS();

    BufferMoveToLearnIntoBattleTextBuff2();
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_jumpifplayerran(void)
{
    CMD_ARGS(const u8 *jumpInstr);

    if (TryRunFromBattle(gBattlerFainted))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_hpthresholds(void)
{
    CMD_ARGS(u8 battler);

    if (!(IsDoubleBattle()))
    {
        u32 battler = GetBattlerForBattleScript(cmd->battler);
        u32 opposingBattler = BATTLE_OPPOSITE(battler);

        s32 result = gBattleMons[opposingBattler].hp * 100 / gBattleMons[opposingBattler].maxHP;
        if (result == 0)
            result = 1;

        if (result > 69 || !IsBattlerAlive(opposingBattler))
            gBattleStruct->hpScale = 0;
        else if (result > 39)
            gBattleStruct->hpScale = 1;
        else if (result > 9)
            gBattleStruct->hpScale = 2;
        else
            gBattleStruct->hpScale = 3;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_hpthresholds2(void)
{
    CMD_ARGS(u8 battler);

    if (!(IsDoubleBattle()))
    {
        u32 battler = GetBattlerForBattleScript(cmd->battler);
        u32 opposingBattler = BATTLE_OPPOSITE(battler);
        u8 hpSwitchout = gBattleStruct->hpOnSwitchout[GetBattlerSide(opposingBattler)];
        s32 result = (hpSwitchout - gBattleMons[opposingBattler].hp) * 100 / hpSwitchout;

        if (gBattleMons[opposingBattler].hp >= hpSwitchout)
            gBattleStruct->hpScale = 0;
        else if (result <= 29)
            gBattleStruct->hpScale = 1;
        else if (result <= 69)
            gBattleStruct->hpScale = 2;
        else
            gBattleStruct->hpScale = 3;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_useitemonopponent(void)
{
    CMD_ARGS();

    gBattlerInMenuId = gBattlerAttacker;
    PokemonUseItemEffects(GetBattlerMon(gBattlerAttacker), gLastUsedItem, gBattlerPartyIndexes[gBattlerAttacker], 0, TRUE);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

bool32 CanUseLastResort(u8 battler)
{
    u32 i;
    u32 knownMovesCount = 0, usedMovesCount = 0;

    for (i = 0; i < 4; i++)
    {
        if (gBattleMons[battler].moves[i] != MOVE_NONE)
            knownMovesCount++;
        if (i != gCurrMovePos && gDisableStructs[battler].usedMoves & (1u << i)) // Increment used move count for all moves except current Last Resort.
            usedMovesCount++;
    }

    return (knownMovesCount >= 2 && usedMovesCount >= knownMovesCount - 1);
}

static void RemoveAllWeather(void)
{
    gWishFutureKnock.weatherDuration = 0;

    if (gBattleWeather & B_WEATHER_RAIN)
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_END_RAIN;
    else if(gBattleWeather & B_WEATHER_SANDSTORM)
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_END_SANDSTORM;
    else if(gBattleWeather & B_WEATHER_SUN)
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_END_SUN;
    else if(gBattleWeather & B_WEATHER_HAIL)
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_END_HAIL;
    else if(gBattleWeather & B_WEATHER_STRONG_WINDS)
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_END_STRONG_WINDS;
    else if(gBattleWeather & B_WEATHER_SNOW)
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_END_SNOW;
    else if(gBattleWeather & B_WEATHER_FOG)
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_END_FOG;
    else
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_END_COUNT;  // failsafe

    gBattleWeather = 0;    // remove the weather
}

static void RemoveAllTerrains(void)
{
    switch (gFieldStatuses & STATUS_FIELD_TERRAIN_ANY)
    {
    case STATUS_FIELD_MISTY_TERRAIN:
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_END_MISTY;
        break;
    case STATUS_FIELD_GRASSY_TERRAIN:
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_END_GRASSY;
        break;
    case STATUS_FIELD_ELECTRIC_TERRAIN:
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_END_ELECTRIC;
        break;
    case STATUS_FIELD_PSYCHIC_TERRAIN:
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_END_PSYCHIC;
        break;
    default:
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_COUNT;  // failsafe
        break;
    }
    gFieldStatuses &= ~STATUS_FIELD_TERRAIN_ANY;    // remove the terrain
    TryToRevertMimicryAndFlags();
}

#define DEFOG_CLEAR(status, structField, battlescript, move)\
{                                                           \
    if (*sideStatuses & status)                             \
    {                                                       \
        if (clear)                                          \
        {                                                   \
            if (move)                                       \
                PREPARE_MOVE_BUFFER(gBattleTextBuff1, move);\
            *sideStatuses &= ~status;                       \
            sideTimer->structField = 0;                     \
            BattleScriptPushCursor();                       \
            gBattlescriptCurrInstr = battlescript;          \
        }                                                   \
        else                                                \
        {                                                   \
            gBattlerAttacker = saveBattler;                 \
        }                                                   \
        return TRUE;                                        \
    }                                                       \
}

static bool32 TryDefogClear(u32 battlerAtk, bool32 clear)
{
    s32 i;
    u8 saveBattler = gBattlerAttacker;

    for (i = 0; i < NUM_BATTLE_SIDES; i++)
    {
        struct SideTimer *sideTimer = &gSideTimers[i];
        u32 *sideStatuses = &gSideStatuses[i];

        if (GetBattlerSide(battlerAtk) != i)
        {
            gBattlerAttacker = i; // For correct battle string. Ally's / Foe's
            DEFOG_CLEAR(SIDE_STATUS_REFLECT, reflectTimer, BattleScript_SideStatusWoreOffReturn, MOVE_REFLECT);
            DEFOG_CLEAR(SIDE_STATUS_LIGHTSCREEN, lightscreenTimer, BattleScript_SideStatusWoreOffReturn, MOVE_LIGHT_SCREEN);
            DEFOG_CLEAR(SIDE_STATUS_MIST, mistTimer, BattleScript_SideStatusWoreOffReturn, MOVE_MIST);
            DEFOG_CLEAR(SIDE_STATUS_AURORA_VEIL, auroraVeilTimer, BattleScript_SideStatusWoreOffReturn, MOVE_AURORA_VEIL);
            DEFOG_CLEAR(SIDE_STATUS_SAFEGUARD, safeguardTimer, BattleScript_SideStatusWoreOffReturn, MOVE_SAFEGUARD);
        }
        if (B_DEFOG_EFFECT_CLEARING >= GEN_6)
        {
            gBattlerAttacker = i; // For correct battle string. Ally's / Foe's
            DEFOG_CLEAR(SIDE_STATUS_SPIKES, spikesAmount, BattleScript_SpikesDefog, 0);
            DEFOG_CLEAR(SIDE_STATUS_STEALTH_ROCK, stealthRockAmount, BattleScript_StealthRockDefog, 0);
            DEFOG_CLEAR(SIDE_STATUS_TOXIC_SPIKES, toxicSpikesAmount, BattleScript_ToxicSpikesDefog, 0);
            DEFOG_CLEAR(SIDE_STATUS_STICKY_WEB, stickyWebAmount, BattleScript_StickyWebDefog, 0);
            DEFOG_CLEAR(SIDE_STATUS_STEELSURGE, steelsurgeAmount, BattleScript_SteelsurgeDefog, 0);
        }
        if (gBattleWeather & B_WEATHER_FOG)
        {
            gBattleWeather &= ~B_WEATHER_FOG;
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_FogEnded_Ret;
            return TRUE;
        }
        if (B_DEFOG_EFFECT_CLEARING >= GEN_8 && (gFieldStatuses & STATUS_FIELD_TERRAIN_ANY))
        {
            RemoveAllTerrains();
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_TerrainEnds_Ret;
            return TRUE;
        }
    }

    gBattlerAttacker = saveBattler;

    return FALSE;
}

static bool32 TryTidyUpClear(u32 battlerAtk, bool32 clear)
{
    u32 i;
    u32 saveBattler = gBattlerAttacker;

    for (i = 0; i < NUM_BATTLE_SIDES; i++)
    {
        struct SideTimer *sideTimer = &gSideTimers[i];
        u32 *sideStatuses = &gSideStatuses[i];

        gBattlerAttacker = i; // For correct battle string. Ally's / Foe's
        DEFOG_CLEAR(SIDE_STATUS_SPIKES, spikesAmount, BattleScript_SpikesDefog, 0);
        DEFOG_CLEAR(SIDE_STATUS_STEALTH_ROCK, stealthRockAmount, BattleScript_StealthRockDefog, 0);
        DEFOG_CLEAR(SIDE_STATUS_TOXIC_SPIKES, toxicSpikesAmount, BattleScript_ToxicSpikesDefog, 0);
        DEFOG_CLEAR(SIDE_STATUS_STICKY_WEB, stickyWebAmount, BattleScript_StickyWebDefog, 0);
    }

    for (i = 0; i < MAX_BATTLERS_COUNT; i++)
    {
        if (gBattleMons[i].status2 & STATUS2_SUBSTITUTE)
        {
            if (clear)
            {
                gBattlerTarget = i;
                gDisableStructs[i].substituteHP = 0;
                gBattleMons[i].status2 &= ~STATUS2_SUBSTITUTE;
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_SubstituteFade;
            }
            gBattlerAttacker = saveBattler;
            return TRUE;
        }
    }

    gBattlerAttacker = saveBattler;
    return FALSE;
}

u32 IsFlowerVeilProtected(u32 battler)
{
    if (IS_BATTLER_OF_TYPE(battler, TYPE_GRASS))
        return IsAbilityOnSide(battler, ABILITY_FLOWER_VEIL);
    else
        return 0;
}

u32 IsLeafGuardProtected(u32 battler, u32 ability)
{
    if (IsBattlerWeatherAffected(battler, B_WEATHER_SUN))
        return ability == ABILITY_LEAF_GUARD;
    else
        return 0;
}

bool32 IsShieldsDownProtected(u32 battler, u32 ability)
{
    return (ability == ABILITY_SHIELDS_DOWN
            && GetFormIdFromFormSpeciesId(gBattleMons[battler].species) < GetFormIdFromFormSpeciesId(SPECIES_MINIOR_CORE_RED)); // Minior is not in core form
}

u32 IsAbilityStatusProtected(u32 battler, u32 ability)
{
    return IsLeafGuardProtected(battler, ability)
        || IsShieldsDownProtected(battler, ability)
        || IsFlowerVeilProtected(battler);
}

u32 GetHighestStatId(u32 battler)
{
    u32 i, highestId = STAT_ATK, highestStat = gBattleMons[battler].attack;

    for (i = STAT_DEF; i < NUM_STATS; i++)
    {
        u16 *statVal = &gBattleMons[battler].attack + (i - 1);
        if (*statVal > highestStat && i != STAT_SPEED)
        {
            highestStat = *statVal;
            highestId = i;
        }
    }
    if (gBattleMons[battler].speed > highestStat)
        highestId = STAT_SPEED;

    return highestId;
}

static bool32 IsRototillerAffected(u32 battler)
{
    if (!IsBattlerAlive(battler))
        return FALSE;
    if (!IsBattlerGrounded(battler))
        return FALSE;   // Only grounded battlers affected
    if (!IS_BATTLER_OF_TYPE(battler, TYPE_GRASS))
        return FALSE;   // Only grass types affected
    if (gStatuses3[battler] & STATUS3_SEMI_INVULNERABLE)
        return FALSE;   // Rototiller doesn't affected semi-invulnerable battlers
    if (BlocksPrankster(MOVE_ROTOTILLER, gBattlerAttacker, battler, FALSE))
        return FALSE;
    return TRUE;
}

static bool32 IsElectricAbilityAffected(u32 battler, u32 ability)
{
    u32 moveType;

    if (gBattleStruct->dynamicMoveType == 0)
        moveType = GetMoveType(gCurrentMove);
    else if (!(gBattleStruct->dynamicMoveType & F_DYNAMIC_TYPE_IGNORE_PHYSICALITY))
        moveType = gBattleStruct->dynamicMoveType & DYNAMIC_TYPE_MASK;
    else
        moveType = GetMoveType(gCurrentMove);

    if (moveType == TYPE_ELECTRIC
     && (ability != ABILITY_LIGHTNING_ROD || B_REDIRECT_ABILITY_IMMUNITY >= GEN_5)
     && GetBattlerAbility(battler) == ability)
        return TRUE;
    else
        return FALSE;
}

static bool32 IsTeatimeAffected(u32 battler)
{
    if (GetItemPocket(gBattleMons[battler].item) != POCKET_BERRIES)
        return FALSE;   // Only berries
    if (gStatuses3[battler] & STATUS3_SEMI_INVULNERABLE)
        return FALSE;   // Teatime doesn't affected semi-invulnerable battlers
    return TRUE;
}

#define COURTCHANGE_SWAP(status, structField, temp)                     \
{                                                                       \
    temp = gSideStatuses[B_SIDE_PLAYER];                                \
    if (gSideStatuses[B_SIDE_OPPONENT] & status)                        \
        gSideStatuses[B_SIDE_PLAYER] |= status;                         \
    else                                                                \
        gSideStatuses[B_SIDE_PLAYER] &= ~(status);                      \
    if (temp & status)                                                  \
        gSideStatuses[B_SIDE_OPPONENT] |= status;                       \
    else                                                                \
        gSideStatuses[B_SIDE_OPPONENT] &= ~(status);                    \
    SWAP(sideTimerPlayer->structField, sideTimerOpp->structField, temp);\
}                                                                       \

#define UPDATE_COURTCHANGED_BATTLER(structField)\
{                                               \
    temp = sideTimerPlayer->structField;        \
    sideTimerPlayer->structField = BATTLE_OPPOSITE(sideTimerOpp->structField);        \
    sideTimerOpp->structField = BATTLE_OPPOSITE(temp);        \
}                                               \

void BS_CourtChangeSwapSideStatuses(void)
{
    NATIVE_ARGS();

    struct SideTimer *sideTimerPlayer = &gSideTimers[B_SIDE_PLAYER];
    struct SideTimer *sideTimerOpp = &gSideTimers[B_SIDE_OPPONENT];
    u32 temp;

    // Swap timers and statuses
    COURTCHANGE_SWAP(SIDE_STATUS_REFLECT, reflectTimer, temp)
    COURTCHANGE_SWAP(SIDE_STATUS_LIGHTSCREEN, lightscreenTimer, temp)
    COURTCHANGE_SWAP(SIDE_STATUS_MIST, mistTimer, temp);
    COURTCHANGE_SWAP(SIDE_STATUS_SAFEGUARD, safeguardTimer, temp);
    COURTCHANGE_SWAP(SIDE_STATUS_AURORA_VEIL, auroraVeilTimer, temp);
    COURTCHANGE_SWAP(SIDE_STATUS_TAILWIND, tailwindTimer, temp);
    // Lucky Chant doesn't exist in gen 8, but seems like it should be affected by Court Change
    COURTCHANGE_SWAP(SIDE_STATUS_LUCKY_CHANT, luckyChantTimer, temp);
    COURTCHANGE_SWAP(SIDE_STATUS_SPIKES, spikesAmount, temp);
    COURTCHANGE_SWAP(SIDE_STATUS_STEALTH_ROCK, stealthRockAmount, temp);
    COURTCHANGE_SWAP(SIDE_STATUS_TOXIC_SPIKES, toxicSpikesAmount, temp);
    COURTCHANGE_SWAP(SIDE_STATUS_STICKY_WEB, stickyWebAmount, temp);
    COURTCHANGE_SWAP(SIDE_STATUS_STEELSURGE, steelsurgeAmount, temp);
    COURTCHANGE_SWAP(SIDE_STATUS_DAMAGE_NON_TYPES, damageNonTypesTimer, temp);
    // Track Pledge effect side
    COURTCHANGE_SWAP(SIDE_STATUS_RAINBOW, rainbowTimer, temp);
    COURTCHANGE_SWAP(SIDE_STATUS_SEA_OF_FIRE, seaOfFireTimer, temp);
    COURTCHANGE_SWAP(SIDE_STATUS_SWAMP, swampTimer, temp);

    // Change battler IDs of swapped effects. Needed for the correct string when they expire
    UPDATE_COURTCHANGED_BATTLER(stickyWebBattlerId);

    // Track which side originally set the Sticky Web
    SWAP(sideTimerPlayer->stickyWebBattlerSide, sideTimerOpp->stickyWebBattlerSide, temp);

    // Swap what type set the Gigantamax damage over time effect
    SWAP(sideTimerPlayer->damageNonTypesType, sideTimerOpp->damageNonTypesType, temp);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void HandleScriptMegaPrimalBurst(u32 caseId, u32 battler, u32 type)
{
    struct Pokemon *mon = GetBattlerMon(battler);

    // Change species.
    if (caseId == 0)
    {
        if (type == HANDLE_TYPE_MEGA_EVOLUTION)
        {
            if (!TryBattleFormChange(battler, FORM_CHANGE_BATTLE_MEGA_EVOLUTION_ITEM))
                TryBattleFormChange(battler, FORM_CHANGE_BATTLE_MEGA_EVOLUTION_MOVE);
        }
        else if (type == HANDLE_TYPE_PRIMAL_REVERSION)
            TryBattleFormChange(battler, FORM_CHANGE_BATTLE_PRIMAL_REVERSION);
        else
            TryBattleFormChange(battler, FORM_CHANGE_BATTLE_ULTRA_BURST);

        PREPARE_SPECIES_BUFFER(gBattleTextBuff1, gBattleMons[battler].species);

        BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_SPECIES_BATTLE, 1u << gBattlerPartyIndexes[battler], sizeof(gBattleMons[battler].species), &gBattleMons[battler].species);
        MarkBattlerForControllerExec(battler);
    }
    // Update healthbox and elevation and play cry.
    else
    {
        UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], mon, HEALTHBOX_ALL);
        if (!IsOnPlayerSide(battler))
            SetBattlerShadowSpriteCallback(battler, gBattleMons[battler].species);
        if (type == HANDLE_TYPE_MEGA_EVOLUTION)
            SetGimmickAsActivated(battler, GIMMICK_MEGA);
        if (type == HANDLE_TYPE_ULTRA_BURST)
            SetGimmickAsActivated(battler, GIMMICK_ULTRA_BURST);
    }
}

// Return True if the order was changed, and false if the order was not changed(for example because the target would move after the attacker anyway).
static bool32 ChangeOrderTargetAfterAttacker(void)
{
    u32 i;
    u8 data[MAX_BATTLERS_COUNT];
    u8 actionsData[MAX_BATTLERS_COUNT];

    if (GetBattlerTurnOrderNum(gBattlerAttacker) > GetBattlerTurnOrderNum(gBattlerTarget))
        return FALSE;
    if (GetBattlerTurnOrderNum(gBattlerAttacker) + 1 == GetBattlerTurnOrderNum(gBattlerTarget))
        return B_AFTER_YOU_TURN_ORDER >= GEN_8;

    for (i = 0; i < MAX_BATTLERS_COUNT; i++)
    {
        data[i] = gBattlerByTurnOrder[i];
        actionsData[i] = gActionsByTurnOrder[i];
    }
    if (GetBattlerTurnOrderNum(gBattlerAttacker) == 0 && GetBattlerTurnOrderNum(gBattlerTarget) == 2)
    {
        gBattlerByTurnOrder[1] = gBattlerTarget;
        gActionsByTurnOrder[1] = actionsData[2];
        gBattlerByTurnOrder[2] = data[1];
        gActionsByTurnOrder[2] = actionsData[1];
    }
    else if (GetBattlerTurnOrderNum(gBattlerAttacker) == 0 && GetBattlerTurnOrderNum(gBattlerTarget) == 3)
    {
        gBattlerByTurnOrder[1] = gBattlerTarget;
        gActionsByTurnOrder[1] = actionsData[3];
        gBattlerByTurnOrder[2] = data[1];
        gActionsByTurnOrder[2] = actionsData[1];
        gBattlerByTurnOrder[3] = data[2];
        gActionsByTurnOrder[3] = actionsData[2];
    }
    else // Attacker == 1, Target == 3
    {
        gBattlerByTurnOrder[2] = gBattlerTarget;
        gActionsByTurnOrder[2] = actionsData[3];
        gBattlerByTurnOrder[3] = data[2];
        gActionsByTurnOrder[3] = actionsData[2];
    }
    return TRUE;
}

static void Cmd_various(void)
{
    CMD_ARGS(u8 battler, u8 id);

    struct Pokemon *mon;
    s32 i;
    u8 data[10];
    u32 battler, bits;
    enum CmdVarious variousId = cmd->id;

    if (gBattleControllerExecFlags)
        return;

    battler = GetBattlerForBattleScript(cmd->battler);

    switch (variousId)
    {
    // Roar will fail in a double wild battle when used by the player against one of the two alive wild mons.
    // Also when an opposing wild mon uses it againt its partner.
    // Also when B_FLAG_NO_RUNNING is enabled.
    case VARIOUS_JUMP_IF_ROAR_FAILS:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        if (WILD_DOUBLE_BATTLE
            && IsOnPlayerSide(gBattlerAttacker)
            && !IsOnPlayerSide(gBattlerTarget)
            && IS_WHOLE_SIDE_ALIVE(gBattlerTarget))
            gBattlescriptCurrInstr = cmd->jumpInstr;
        else if (WILD_DOUBLE_BATTLE
                 && !IsOnPlayerSide(gBattlerAttacker)
                 && !IsOnPlayerSide(gBattlerTarget))
            gBattlescriptCurrInstr = cmd->jumpInstr;
        else if (FlagGet(B_FLAG_NO_RUNNING))
            gBattlescriptCurrInstr = cmd->jumpInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
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
    case VARIOUS_JUMP_IF_SHIELDS_DOWN_PROTECTED:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        if (IsShieldsDownProtected(battler, GetBattlerAbility(battler)))
        {
            gBattlerAbility = battler;
            gBattlescriptCurrInstr = cmd->jumpInstr;
        }
        else
        {
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        return;
    }
    case VARIOUS_JUMP_IF_HOLD_EFFECT:
    {
        VARIOUS_ARGS(u8 holdEffect, const u8 *jumpInstr, u8 equal);
        if ((GetBattlerHoldEffect(battler, TRUE) == cmd->holdEffect) == cmd->equal)
        {
            if (cmd->equal)
                gLastUsedItem = gBattleMons[battler].item; // For B_LAST_USED_ITEM
            gBattlescriptCurrInstr = cmd->jumpInstr;
        }
        else
        {
            if (!cmd->equal)
                gLastUsedItem = gBattleMons[battler].item; // For B_LAST_USED_ITEM
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        return;
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
    case VARIOUS_INFATUATE_WITH_BATTLER:
    {
        VARIOUS_ARGS(u8 infatuateWith);
        gBattleScripting.battler = battler;
        gBattleMons[battler].status2 |= STATUS2_INFATUATED_WITH(GetBattlerForBattleScript(cmd->infatuateWith));
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_SET_LAST_USED_ITEM:
    {
        VARIOUS_ARGS();
        gLastUsedItem = gBattleMons[battler].item;
        break;
    }
    case VARIOUS_TRY_FAIRY_LOCK:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if (gFieldStatuses & STATUS_FIELD_FAIRY_LOCK)
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            gFieldStatuses |= STATUS_FIELD_FAIRY_LOCK;
            gFieldTimers.fairyLockTimer = gBattleTurnCounter + 2;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        return;
    }
    case VARIOUS_GET_STAT_VALUE:
    {
        VARIOUS_ARGS(u8 stat);
        i = cmd->stat;
        gBattleStruct->moveDamage[gBattlerAttacker] = *(u16 *)(&gBattleMons[battler].attack) + (i - 1);
        gBattleStruct->moveDamage[gBattlerAttacker] *= gStatStageRatios[gBattleMons[battler].statStages[i]][0];
        gBattleStruct->moveDamage[gBattlerAttacker] /= gStatStageRatios[gBattleMons[battler].statStages[i]][1];
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_JUMP_IF_FULL_HP:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        if (IsBattlerAtMaxHp(battler))
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
            if (!IsBattlerAlly(battler, gBattlerTarget)
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
    case VARIOUS_TRACE_ABILITY:
    {
        VARIOUS_ARGS();
        gBattleMons[battler].ability = gDisableStructs[battler].overwrittenAbility = gBattleStruct->tracedAbility[battler];
        break;
    }
    case VARIOUS_TRY_ILLUSION_OFF:
    {
        VARIOUS_ARGS();
        if (TryClearIllusion(battler, ABILITYEFFECT_MOVE_END))
            return;
        break;
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
        if (IsOnPlayerSide(battler))
            mon = GetBattlerMon(battler);
        else
            mon = GetBattlerMon(battler);
        UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], mon, HEALTHBOX_NICK);
        break;
    }
    case VARIOUS_JUMP_IF_NOT_BERRY:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        if (GetItemPocket(gBattleMons[battler].item) == POCKET_BERRIES)
            gBattlescriptCurrInstr = cmd->nextInstr;
        else
            gBattlescriptCurrInstr = cmd->jumpInstr;
        return;
    }
    case VARIOUS_CHECK_IF_GRASSY_TERRAIN_HEALS:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if ((gStatuses3[battler] & (STATUS3_SEMI_INVULNERABLE | STATUS3_HEAL_BLOCK))
            || IsBattlerAtMaxHp(battler)
            || !gBattleMons[battler].hp
            || !(IsBattlerGrounded(battler)))
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 16;
            if (gBattleStruct->moveDamage[battler] == 0)
                gBattleStruct->moveDamage[battler] = 1;
            gBattleStruct->moveDamage[battler] *= -1;

            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        return;
    }
    case VARIOUS_GRAVITY_ON_AIRBORNE_MONS:
    {
        VARIOUS_ARGS();
        // Cancel all multiturn moves of IN_AIR Pokemon except those being targeted by Sky Drop.
        if (gStatuses3[battler] & STATUS3_ON_AIR && !(gStatuses3[battler] & STATUS3_SKY_DROPPED))
            CancelMultiTurnMoves(battler, SKY_DROP_GRAVITY_ON_AIRBORNE);

        gStatuses3[battler] &= ~(STATUS3_MAGNET_RISE | STATUS3_TELEKINESIS | STATUS3_ON_AIR | STATUS3_SKY_DROPPED);
        break;
    }
    case VARIOUS_SET_POWDER:
    {
        VARIOUS_ARGS();
        gBattleMons[battler].status2 |= STATUS2_POWDER;
        break;
    }
    case VARIOUS_ACUPRESSURE:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        bits = 0;
        for (i = STAT_ATK; i < NUM_BATTLE_STATS; i++)
        {
            if (CompareStat(battler, i, MAX_STAT_STAGE, CMP_LESS_THAN))
                bits |= 1u << i;
        }
        if (bits)
        {
            u32 statId;
            do
            {
                statId = (Random() % (NUM_BATTLE_STATS - 1)) + 1;
            } while (!(bits & (1u << statId)));

            SET_STATCHANGER(statId, 2, FALSE);
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        else
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        return;
    }
    case VARIOUS_CANCEL_MULTI_TURN_MOVES:
    {
        VARIOUS_ARGS();
        const u8 *result;
        result = CancelMultiTurnMoves(battler, SKY_DROP_CANCEL_MULTI_TURN_MOVES);
        if (result)
        {
            gBattlescriptCurrInstr = result;
            return;
        }
        break;
    }
    case VARIOUS_IS_RUNNING_IMPOSSIBLE:
    {
        VARIOUS_ARGS();
        gBattleCommunication[0] = IsRunningFromBattleImpossible(battler);
        break;
    }
    case VARIOUS_GET_MOVE_TARGET:
    {
        VARIOUS_ARGS();
        gBattlerTarget = GetBattleMoveTarget(gCurrentMove, NO_TARGET_OVERRIDE);
        break;
    }
    case VARIOUS_GET_BATTLER_FAINTED:
    {
        VARIOUS_ARGS();
        if (gHitMarker & HITMARKER_FAINTED(battler))
            gBattleCommunication[0] = TRUE;
        else
            gBattleCommunication[0] = FALSE;
        break;
    }
    case VARIOUS_RESET_SWITCH_IN_ABILITY_BITS:
    {
        VARIOUS_ARGS();
        gSpecialStatuses[battler].switchInAbilityDone = FALSE;
        break;
    }
    case VARIOUS_UPDATE_CHOICE_MOVE_ON_LVL_UP:
    {
        VARIOUS_ARGS();
        if (gBattlerPartyIndexes[0] == gBattleStruct->expGetterMonId || gBattlerPartyIndexes[2] == gBattleStruct->expGetterMonId)
        {
            if (gBattlerPartyIndexes[0] == gBattleStruct->expGetterMonId)
                battler = 0;
            else
                battler = 2;

            for (i = 0; i < MAX_MON_MOVES; i++)
            {
                if (gBattleMons[battler].moves[i] == gBattleStruct->choicedMove[battler])
                    break;
            }
            if (i == MAX_MON_MOVES)
                gBattleStruct->choicedMove[battler] = MOVE_NONE;
        }
        break;
    }
    case VARIOUS_RESET_PLAYER_FAINTED:
    {
        VARIOUS_ARGS();
        if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_DOUBLE))
            && gBattleTypeFlags & BATTLE_TYPE_TRAINER
            && IsBattlerAlive(B_POSITION_PLAYER_LEFT)
            && IsBattlerAlive(B_POSITION_OPPONENT_LEFT))
        {
            gHitMarker &= ~HITMARKER_PLAYER_FAINTED;
        }
        break;
    }
    case VARIOUS_PALACE_FLAVOR_TEXT:
    {
        VARIOUS_ARGS();
        // Try and print end-of-turn Battle Palace flavor text (e.g. "A glint appears in mon's eyes")
        // gBattleCommunication[0] = FALSE; // whether or not msg should be printed
        // gBattleScripting.battler = battler = gBattleCommunication[1];
        // if (!(gBattleStruct->palaceFlags & (1u << battler))
        //     && gBattleMons[battler].maxHP / 2 >= gBattleMons[battler].hp
        //     && IsBattlerAlive(battler)
        //     && !(gBattleMons[battler].status1 & STATUS1_SLEEP))
        // {
        //     gBattleStruct->palaceFlags |= 1u << battler;
        //     gBattleCommunication[0] = TRUE;
        //     gBattleCommunication[MULTISTRING_CHOOSER] = gNaturesInfo[GetNatureFromPersonality(gBattleMons[battler].personality)].battlePalaceFlavorText;
        // }
        break;
    }
    case VARIOUS_ARENA_JUDGMENT_WINDOW:
    {
        VARIOUS_ARGS();

        // i = BattleArena_ShowJudgmentWindow(&gBattleCommunication[0]);

        // // BattleArena_ShowJudgmentWindow's last state was an intermediate step.
        // // Return without advancing the current instruction so that it will be called again.
        // if (i == ARENA_RESULT_RUNNING)
        //     return;

        // gBattleCommunication[1] = i;
        break;
    }
    case VARIOUS_ARENA_OPPONENT_MON_LOST:
    {
        VARIOUS_ARGS();
        // gBattleMons[1].hp = 0;
        // gHitMarker |= HITMARKER_FAINTED(1);
        // gBattleStruct->arenaLostOpponentMons |= 1u << gBattlerPartyIndexes[1];
        // gDisableStructs[1].truantSwitchInHack = 1;
        break;
    }
    case VARIOUS_ARENA_PLAYER_MON_LOST:
    {
        VARIOUS_ARGS();
        // gBattleMons[0].hp = 0;
        // gHitMarker |= HITMARKER_FAINTED(0);
        // gHitMarker |= HITMARKER_PLAYER_FAINTED;
        // gBattleStruct->arenaLostPlayerMons |= 1u << gBattlerPartyIndexes[0];
        // gDisableStructs[0].truantSwitchInHack = 1;
        break;
    }
    case VARIOUS_ARENA_BOTH_MONS_LOST:
    {
        VARIOUS_ARGS();
        // gBattleMons[0].hp = 0;
        // gBattleMons[1].hp = 0;
        // gHitMarker |= HITMARKER_FAINTED(0);
        // gHitMarker |= HITMARKER_FAINTED(1);
        // gHitMarker |= HITMARKER_PLAYER_FAINTED;
        // gBattleStruct->arenaLostPlayerMons |= 1u << gBattlerPartyIndexes[0];
        // gBattleStruct->arenaLostOpponentMons |= 1u << gBattlerPartyIndexes[1];
        // gDisableStructs[0].truantSwitchInHack = 1;
        // gDisableStructs[1].truantSwitchInHack = 1;
        break;
    }
    case VARIOUS_EMIT_YESNOBOX:
    {
        VARIOUS_ARGS();
        BtlController_EmitYesNoBox(battler, B_COMM_TO_CONTROLLER);
        MarkBattlerForControllerExec(battler);
        break;
    }
    case VARIOUS_DRAW_ARENA_REF_TEXT_BOX:
    {
        VARIOUS_ARGS();
        // DrawArenaRefereeTextBox();
        break;
    }
    case VARIOUS_ERASE_ARENA_REF_TEXT_BOX:
    {
        VARIOUS_ARGS();
        // EraseArenaRefereeTextBox();
        break;
    }
    case VARIOUS_ARENA_JUDGMENT_STRING:
    {
        CMD_ARGS(u8 id, u8 _);
        // BattleStringExpandPlaceholdersToDisplayedString(gRefereeStringsTable[cmd->id]);
        // BattlePutTextOnWindow(gDisplayedStringBattle, ARENA_WIN_JUDGMENT_TEXT);
        break;
    }
    case VARIOUS_ARENA_WAIT_STRING:
    {
        VARIOUS_ARGS();
        // if (IsTextPrinterActive(ARENA_WIN_JUDGMENT_TEXT))
        //     return;
        break;
    }
    case VARIOUS_WAIT_CRY:
    {
        VARIOUS_ARGS();
        if (!IsCryFinished())
            return;
        break;
    }
    case VARIOUS_RETURN_OPPONENT_MON1:
    {
        VARIOUS_ARGS();
        battler = 1;
        if (IsBattlerAlive(battler))
        {
            BtlController_EmitReturnMonToBall(battler, B_COMM_TO_CONTROLLER, FALSE);
            MarkBattlerForControllerExec(battler);
        }
        break;
    }
    case VARIOUS_RETURN_OPPONENT_MON2:
    {
        VARIOUS_ARGS();
        if (gBattlersCount > 3)
        {
            battler = 3;
            if (IsBattlerAlive(battler))
            {
                BtlController_EmitReturnMonToBall(battler, B_COMM_TO_CONTROLLER, FALSE);
                MarkBattlerForControllerExec(battler);
            }
        }
        break;
    }
    case VARIOUS_VOLUME_DOWN:
    {
        VARIOUS_ARGS();
        m4aMPlayVolumeControl(&gMPlayInfo_BGM, TRACKS_ALL, 0x55);
        break;
    }
    case VARIOUS_VOLUME_UP:
    {
        VARIOUS_ARGS();
        m4aMPlayVolumeControl(&gMPlayInfo_BGM, TRACKS_ALL, 0x100);
        break;
    }
    case VARIOUS_SET_ALREADY_STATUS_MOVE_ATTEMPT:
    {
        VARIOUS_ARGS();
        gBattleStruct->battlerState[battler].alreadyStatusedMoveAttempt = TRUE;
        break;
    }
    case VARIOUS_PALACE_TRY_ESCAPE_STATUS:
    {
        VARIOUS_ARGS();
        // if (BattlePalace_TryEscapeStatus(battler))
        //     return;
        break;
    }
    case VARIOUS_SET_TELEPORT_OUTCOME:
    {
        VARIOUS_ARGS();
        // Don't end the battle if one of the wild mons teleported from the wild double battle
        // and its partner is still alive.
        if (!IsOnPlayerSide(battler) && IsBattlerAlive(BATTLE_PARTNER(battler)))
        {
            gAbsentBattlerFlags |= 1u << battler;
            gHitMarker |= HITMARKER_FAINTED(battler);
            gBattleMons[battler].hp = 0;
            SetMonData(GetBattlerMon(battler), MON_DATA_HP, &gBattleMons[battler].hp);
            SetHealthboxSpriteInvisible(gHealthboxSpriteIds[battler]);
            FaintClearSetData(battler);
        }
        else if (IsOnPlayerSide(battler))
        {
            gBattleOutcome = B_OUTCOME_PLAYER_TELEPORTED;
        }
        else
        {
            gBattleOutcome = B_OUTCOME_MON_TELEPORTED;
        }
        break;
    }
    case VARIOUS_PLAY_TRAINER_DEFEATED_MUSIC:
    {
        VARIOUS_ARGS();
        BtlController_EmitPlayFanfareOrBGM(battler, B_COMM_TO_CONTROLLER, MUS_VICTORY_TRAINER, TRUE);
        MarkBattlerForControllerExec(battler);
        break;
    }
    case VARIOUS_STAT_TEXT_BUFFER:
    {
        VARIOUS_ARGS();
        PREPARE_STAT_BUFFER(gBattleTextBuff1, gBattleCommunication[0]);
        break;
    }
    case VARIOUS_SWITCHIN_ABILITIES:
    {
        VARIOUS_ARGS();
        gBattlescriptCurrInstr = cmd->nextInstr;
        AbilityBattleEffects(ABILITYEFFECT_NEUTRALIZINGGAS, battler, 0, 0, 0);
        AbilityBattleEffects(ABILITYEFFECT_ON_SWITCHIN, battler, 0, 0, 0);
        AbilityBattleEffects(ABILITYEFFECT_OPPORTUNIST, battler, 0, 0, 0);
        return;
    }
    case VARIOUS_INSTANT_HP_DROP:
    {
        VARIOUS_ARGS();
        BtlController_EmitHealthBarUpdate(battler, B_COMM_TO_CONTROLLER, INSTANT_HP_BAR_DROP);
        MarkBattlerForControllerExec(battler);
        break;
    }
    case VARIOUS_CLEAR_STATUS:
    {
        VARIOUS_ARGS();
        gBattleMons[battler].status1 = 0;
        BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[battler].status1), &gBattleMons[battler].status1);
        MarkBattlerForControllerExec(battler);
        break;
    }
    case VARIOUS_RESTORE_PP:
    {
        VARIOUS_ARGS();
        for (i = 0; i < 4; i++)
        {
            gBattleMons[battler].pp[i] = CalculatePPWithBonus(gBattleMons[battler].moves[i], gBattleMons[battler].ppBonuses, i);
            data[i] = gBattleMons[battler].pp[i];
        }
        data[i] = gBattleMons[battler].ppBonuses;
        BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_PP_DATA_BATTLE, 0, 5, data);
        MarkBattlerForControllerExec(battler);
        break;
    }
    case VARIOUS_TRY_ACTIVATE_RECEIVER: // Partner gets fainted's ally ability
    {
        VARIOUS_ARGS();
        gBattlerAbility = BATTLE_PARTNER(battler);
        i = GetBattlerAbility(gBattlerAbility);
        if (IsBattlerAlive(gBattlerAbility)
            && (i == ABILITY_RECEIVER || i == ABILITY_POWER_OF_ALCHEMY)
            && GetBattlerHoldEffect(battler, TRUE) != HOLD_EFFECT_ABILITY_SHIELD
            && !gAbilitiesInfo[gBattleMons[battler].ability].cantBeCopied)
        {
            gBattleStruct->tracedAbility[gBattlerAbility] = gBattleMons[battler].ability; // re-using the variable for trace
            gBattleScripting.battler = battler;
            BattleScriptPush(cmd->nextInstr);
            gBattlescriptCurrInstr = BattleScript_ReceiverActivates;
            return;
        }
        break;
    }
    case VARIOUS_TRY_ACTIVATE_SOULHEART:
    {
        VARIOUS_ARGS();
        while (gBattleStruct->soulheartBattlerId < gBattlersCount)
        {
            gBattleScripting.battler = gBattleStruct->soulheartBattlerId++;
            if (GetBattlerAbility(gBattleScripting.battler) == ABILITY_SOUL_HEART
                && IsBattlerAlive(gBattleScripting.battler)
                && !NoAliveMonsForEitherParty()
                && CompareStat(gBattleScripting.battler, STAT_SPATK, MAX_STAT_STAGE, CMP_LESS_THAN))
            {
                SET_STATCHANGER(STAT_SPATK, 1, FALSE);
                PREPARE_STAT_BUFFER(gBattleTextBuff1, STAT_SPATK);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_ScriptingAbilityStatRaise;
                return;
            }
        }
        gBattleStruct->soulheartBattlerId = 0;
        break;
    }
    case VARIOUS_PLAY_MOVE_ANIMATION:
    {
        VARIOUS_ARGS(u16 move);
        BtlController_EmitMoveAnimation(battler, B_COMM_TO_CONTROLLER, cmd->move, gBattleScripting.animTurn, 0, 0, gBattleMons[battler].friendship, &gDisableStructs[battler], gMultiHitCounter);
        MarkBattlerForControllerExec(battler);
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_SET_LUCKY_CHANT:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if (!(gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_LUCKY_CHANT))
        {
            gSideStatuses[GetBattlerSide(battler)] |= SIDE_STATUS_LUCKY_CHANT;
            gSideTimers[GetBattlerSide(battler)].luckyChantTimer = gBattleTurnCounter + 5;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        else
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        return;
    }
    case VARIOUS_SUCKER_PUNCH_CHECK:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if (gProtectStructs[gBattlerTarget].protected == PROTECT_OBSTRUCT)
            gBattlescriptCurrInstr = cmd->failInstr;
        else if (GetBattlerTurnOrderNum(gBattlerAttacker) > GetBattlerTurnOrderNum(gBattlerTarget))
            gBattlescriptCurrInstr = cmd->failInstr;
        else if (IsBattleMoveStatus(gBattleMons[gBattlerTarget].moves[gBattleStruct->chosenMovePositions[gBattlerTarget]]) && !gProtectStructs[gBattlerTarget].noValidMoves)
            gBattlescriptCurrInstr = cmd->failInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_SET_SIMPLE_BEAM:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if (gAbilitiesInfo[gBattleMons[gBattlerTarget].ability].cantBeOverwritten
            || gBattleMons[gBattlerTarget].ability == ABILITY_SIMPLE)
        {
            RecordAbilityBattle(gBattlerTarget, gBattleMons[gBattlerTarget].ability);
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else if (GetBattlerHoldEffect(gBattlerTarget, TRUE) == HOLD_EFFECT_ABILITY_SHIELD)
        {
            RecordItemEffectBattle(gBattlerTarget, HOLD_EFFECT_ABILITY_SHIELD);
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            if (gBattleMons[gBattlerTarget].ability == ABILITY_NEUTRALIZING_GAS)
                gSpecialStatuses[gBattlerTarget].neutralizingGasRemoved = TRUE;

            gBattleScripting.abilityPopupOverwrite = gBattleMons[gBattlerTarget].ability;
            gBattleMons[gBattlerTarget].ability = gDisableStructs[gBattlerTarget].overwrittenAbility = ABILITY_SIMPLE;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        return;
    }
    case VARIOUS_TRY_ENTRAINMENT:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if (gAbilitiesInfo[gBattleMons[gBattlerAttacker].ability].cantBeCopied
          || gAbilitiesInfo[gBattleMons[gBattlerTarget].ability].cantBeOverwritten)
        {
            RecordAbilityBattle(gBattlerTarget, gBattleMons[gBattlerTarget].ability);
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else if (GetBattlerHoldEffect(gBattlerTarget, TRUE) == HOLD_EFFECT_ABILITY_SHIELD)
        {
            RecordItemEffectBattle(gBattlerTarget, HOLD_EFFECT_ABILITY_SHIELD);
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            if (gBattleMons[gBattlerTarget].ability == gBattleMons[gBattlerAttacker].ability
                || (GetActiveGimmick(gBattlerTarget) == GIMMICK_DYNAMAX))
            {
                gBattlescriptCurrInstr = cmd->failInstr;
            }
            else
            {
                gBattleMons[gBattlerTarget].ability = gDisableStructs[gBattlerTarget].overwrittenAbility = gBattleMons[gBattlerAttacker].ability;
                gBattlescriptCurrInstr = cmd->nextInstr;
            }
        }
        return;
    }
    case VARIOUS_SET_LAST_USED_ABILITY:
    {
        VARIOUS_ARGS();
        gLastUsedAbility = gBattleMons[battler].ability;
        break;
    }
    case VARIOUS_INVERT_STAT_STAGES:
    {
        VARIOUS_ARGS();
        for (i = 0; i < NUM_BATTLE_STATS; i++)
        {
            if (gBattleMons[battler].statStages[i] < DEFAULT_STAT_STAGE) // Negative becomes positive.
                gBattleMons[battler].statStages[i] = DEFAULT_STAT_STAGE + (DEFAULT_STAT_STAGE - gBattleMons[battler].statStages[i]);
            else if (gBattleMons[battler].statStages[i] > DEFAULT_STAT_STAGE) // Positive becomes negative.
                gBattleMons[battler].statStages[i] = DEFAULT_STAT_STAGE - (gBattleMons[battler].statStages[i] - DEFAULT_STAT_STAGE);
        }
        break;
    }
    case VARIOUS_TRY_ME_FIRST:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        u16 move = gBattleMons[gBattlerTarget].moves[gBattleStruct->chosenMovePositions[gBattlerTarget]];
        if (IsBattleMoveStatus(move) || IsMoveMeFirstBanned(move)
            || GetBattlerTurnOrderNum(gBattlerAttacker) > GetBattlerTurnOrderNum(gBattlerTarget))
            gBattlescriptCurrInstr = cmd->failInstr;
        else
        {
            if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_Z_MOVE && !IsBattleMoveStatus(move))
            {
                gBattleStruct->zmove.baseMoves[gBattlerAttacker] = move;
                gCalledMove = GetTypeBasedZMove(move);
            }
            else
            {
                gCalledMove = move;
            }
            gHitMarker &= ~HITMARKER_ATTACKSTRING_PRINTED;
            gBattlerTarget = GetBattleMoveTarget(gCalledMove, NO_TARGET_OVERRIDE);
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        return;
    }
    case VARIOUS_JUMP_IF_BATTLE_END:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        if (NoAliveMonsForEitherParty())
            gBattlescriptCurrInstr = cmd->jumpInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_TRY_ELECTRIFY:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if (GetBattlerTurnOrderNum(gBattlerAttacker) > GetBattlerTurnOrderNum(gBattlerTarget))
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            gStatuses4[gBattlerTarget] |= STATUS4_ELECTRIFIED;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        return;
    }
    case VARIOUS_TRY_SOAK:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        u32 types[3];
        GetBattlerTypes(gBattlerTarget, FALSE, types);
        u32 moveType = GetMoveType(gCurrentMove);
        if ((types[0] == moveType && types[1] == moveType)
         || GetActiveGimmick(gBattlerTarget) == GIMMICK_TERA)
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            SET_BATTLER_TYPE(gBattlerTarget, moveType);
            PREPARE_TYPE_BUFFER(gBattleTextBuff1, moveType);
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        return;
    }
    case VARIOUS_HANDLE_FORM_CHANGE:
    {
        VARIOUS_ARGS(u8 case_);
        mon = GetBattlerMon(battler);

        // Change species.
        if (cmd->case_ == 0)
        {
            /* What was the idea here?
            if (!gBattleTextBuff1)
                PREPARE_SPECIES_BUFFER(gBattleTextBuff1, gBattleMons[battler].species);
            */
            BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_SPECIES_BATTLE, 1u << gBattlerPartyIndexes[battler], sizeof(gBattleMons[battler].species), &gBattleMons[battler].species);
            MarkBattlerForControllerExec(battler);
        }
        // Change stats.
        else if (cmd->case_ == 1)
        {
            RecalcBattlerStats(battler, mon, FALSE);
        }
        // Update healthbox.
        else
        {
            UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], mon, HEALTHBOX_ALL);
        }
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_TRY_LAST_RESORT:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if (CanUseLastResort(battler))
            gBattlescriptCurrInstr = cmd->nextInstr;
        else
            gBattlescriptCurrInstr = cmd->failInstr;
        return;
    }
    case VARIOUS_TRY_AUTOTOMIZE:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if (GetBattlerWeight(battler) > 1)
        {
            gDisableStructs[battler].autotomizeCount++;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        else
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        return;
    }
    case VARIOUS_TRY_INSTRUCT:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        u16 move = gLastPrintedMoves[gBattlerTarget];
        if (move == MOVE_NONE || move == MOVE_UNAVAILABLE || MoveHasAdditionalEffectSelf(move, MOVE_EFFECT_RECHARGE)
         || IsMoveInstructBanned(move)
         || gBattleMoveEffects[GetMoveEffect(move)].twoTurnEffect
         || (GetActiveGimmick(gBattlerTarget) == GIMMICK_DYNAMAX)
         || IsZMove(move)
         || IsMaxMove(move))
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            gSpecialStatuses[gBattlerTarget].instructedChosenTarget = gBattleStruct->moveTarget[gBattlerTarget] | 0x4;
            gCalledMove = move;
            for (i = 0; i < MAX_MON_MOVES; i++)
            {
                if (gBattleMons[gBattlerTarget].moves[i] == gCalledMove)
                {
                    gCurrMovePos = i;
                    i = 4;
                    break;
                }
            }
            if (i != 4 || gBattleMons[gBattlerTarget].pp[gCurrMovePos] == 0)
                gBattlescriptCurrInstr = cmd->failInstr;
            else
            {
                gEffectBattler = gBattleStruct->lastMoveTarget[gBattlerTarget];
                gHitMarker &= ~HITMARKER_ATTACKSTRING_PRINTED;
                PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, battler, gBattlerPartyIndexes[battler]);
                gBattlescriptCurrInstr = cmd->nextInstr;
            }
        }
        return;
    }
    case VARIOUS_ABILITY_POPUP:
    {
        VARIOUS_ARGS();
        CreateAbilityPopUp(battler, gBattleMons[battler].ability, (IsDoubleBattle()) != 0);
        break;
    }
    case VARIOUS_UPDATE_ABILITY_POPUP:
    {
        VARIOUS_ARGS();
        UpdateAbilityPopup(battler);
        break;
    }
    case VARIOUS_JUMP_IF_TARGET_ALLY:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        if (!IsBattlerAlly(gBattlerAttacker, gBattlerTarget))
            gBattlescriptCurrInstr = cmd->nextInstr;
        else
            gBattlescriptCurrInstr = cmd->jumpInstr;
        return;
    }
    case VARIOUS_TRY_SYNCHRONOISE:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if (!DoBattlersShareType(gBattlerAttacker, gBattlerTarget))
            gBattlescriptCurrInstr = cmd->failInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_LOSE_TYPE:
    {
        VARIOUS_ARGS(u8 type);
        RemoveBattlerType(battler, cmd->type);
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_PSYCHO_SHIFT:
        {
            VARIOUS_ARGS(const u8 *failInstr, const u8 *sleepClauseFailInstr);
            u32 targetAbility = GetBattlerAbility(gBattlerTarget);
            // Psycho shift works
            if ((gBattleMons[gBattlerAttacker].status1 & STATUS1_POISON) && CanBePoisoned(gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerAttacker), targetAbility))
                gBattleCommunication[MULTISTRING_CHOOSER] = 0;
            else if ((gBattleMons[gBattlerAttacker].status1 & STATUS1_TOXIC_POISON) && CanBePoisoned(gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerAttacker), targetAbility))
                gBattleCommunication[MULTISTRING_CHOOSER] = 1;
            else if ((gBattleMons[gBattlerAttacker].status1 & STATUS1_BURN) && CanBeBurned(gBattlerAttacker, gBattlerTarget, targetAbility))
                gBattleCommunication[MULTISTRING_CHOOSER] = 2;
            else if ((gBattleMons[gBattlerAttacker].status1 & STATUS1_PARALYSIS) && CanBeParalyzed(gBattlerAttacker, gBattlerTarget, targetAbility))
                gBattleCommunication[MULTISTRING_CHOOSER] = 3;
            else if ((gBattleMons[gBattlerAttacker].status1 & STATUS1_SLEEP) && CanBeSlept(gBattlerAttacker, gBattlerTarget, targetAbility, BLOCKED_BY_SLEEP_CLAUSE))
                gBattleCommunication[MULTISTRING_CHOOSER] = 4;
            else if ((gBattleMons[gBattlerAttacker].status1 & STATUS1_FROSTBITE) && CanBeFrozen(gBattlerAttacker, gBattlerTarget, targetAbility))
                gBattleCommunication[MULTISTRING_CHOOSER] = 5;
            else if (IsSleepClauseActiveForSide(GetBattlerSide(battler)))
            {
                gBattlescriptCurrInstr = cmd->sleepClauseFailInstr;
                return;
            }
            else
            {
                gBattlescriptCurrInstr = cmd->failInstr;
                return;
            }
            gBattleMons[gBattlerTarget].status1 = gBattleMons[gBattlerAttacker].status1 & STATUS1_ANY;
            battler = gBattlerTarget;
            BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[battler].status1), &gBattleMons[battler].status1);
            MarkBattlerForControllerExec(battler);
            gBattlescriptCurrInstr = cmd->nextInstr;
            TryActivateSleepClause(battler, gBattlerPartyIndexes[battler]);
            return;
        }
    case VARIOUS_CURE_STATUS:
    {
        VARIOUS_ARGS();

        if (gBattleMons[battler].status1 & STATUS1_SLEEP)
            TryDeactivateSleepClause(GetBattlerSide(battler), gBattlerPartyIndexes[battler]);

        gBattleMons[battler].status1 = 0;
        BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[battler].status1), &gBattleMons[battler].status1);
        MarkBattlerForControllerExec(battler);
        break;
    }
    case VARIOUS_POWER_TRICK:
    {
        VARIOUS_ARGS();
        gStatuses3[battler] ^= STATUS3_POWER_TRICK;
        SWAP(gBattleMons[battler].attack, gBattleMons[battler].defense, i);
        break;
    }
    case VARIOUS_AFTER_YOU:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if (ChangeOrderTargetAfterAttacker())
        {
            gSpecialStatuses[gBattlerTarget].afterYou = 1;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        else
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        return;
    }
    case VARIOUS_BESTOW:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if (gBattleMons[gBattlerAttacker].item == ITEM_NONE
            || gBattleMons[gBattlerTarget].item != ITEM_NONE
            || !CanBattlerGetOrLoseItem(gBattlerAttacker, gBattleMons[gBattlerAttacker].item)
            || !CanBattlerGetOrLoseItem(gBattlerTarget, gBattleMons[gBattlerAttacker].item)
            || gWishFutureKnock.knockedOffMons[GetBattlerSide(gBattlerTarget)] & (1u << gBattlerPartyIndexes[gBattlerTarget]))
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            BestowItem(gBattlerAttacker, gBattlerTarget);
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        return;
    }
    case VARIOUS_JUMP_IF_NOT_GROUNDED:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        if (!IsBattlerGrounded(battler))
            gBattlescriptCurrInstr = cmd->jumpInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_HANDLE_TRAINER_SLIDE_MSG:
    {
        VARIOUS_ARGS(u8 case_);
        if (cmd->case_ == PRINT_SLIDE_MESSAGE)
        {
            BtlController_EmitPrintString(battler, B_COMM_TO_CONTROLLER, STRINGID_TRAINERSLIDE);
            MarkBattlerForControllerExec(battler);
        }
        else if (cmd->case_ == RESTORE_BATTLER_SLIDE_CONTROL)
        {
            if (IsBattlerAlive(battler))
            {
                SetBattlerShadowSpriteCallback(battler, gBattleMons[battler].species);
                BattleLoadMonSpriteGfx(GetBattlerMon(battler), battler);
            }
            i = BATTLE_PARTNER(battler);
            if (IsBattlerAlive(i))
            {
                SetBattlerShadowSpriteCallback(i, gBattleMons[i].species);
                BattleLoadMonSpriteGfx(GetBattlerMon(i), i);
            }
        }
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_TRY_TRAINER_SLIDE_MSG_FIRST_OFF:
    {
        VARIOUS_ARGS();
        if ((i = ShouldDoTrainerSlide(battler, TRAINER_SLIDE_PLAYER_LANDS_FIRST_DOWN)))
        {
            gBattleScripting.battler = battler;
            BattleScriptPush(cmd->nextInstr);
            gBattlescriptCurrInstr = (i == 1 ? BattleScript_TrainerASlideMsgRet : BattleScript_TrainerBSlideMsgRet);
            return;
        }
        break;
    }
    case VARIOUS_TRY_TRAINER_SLIDE_MSG_LAST_ON:
    {
        VARIOUS_ARGS();
        if ((i = ShouldDoTrainerSlide(battler, TRAINER_SLIDE_LAST_SWITCHIN)))
        {
            gBattleScripting.battler = battler;
            BattleScriptPush(cmd->nextInstr);
            gBattlescriptCurrInstr = (i == 1 ? BattleScript_TrainerASlideMsgRet : BattleScript_TrainerBSlideMsgRet);
            return;
        }
        break;
    }
    case VARIOUS_SET_AURORA_VEIL:
    {
        VARIOUS_ARGS();
        if (gSideStatuses[GetBattlerSide(battler)] & SIDE_STATUS_AURORA_VEIL
            || !(HasWeatherEffect() && gBattleWeather & (B_WEATHER_HAIL | B_WEATHER_SNOW)))
        {
            gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
            gBattleCommunication[MULTISTRING_CHOOSER] = 0;
        }
        else
        {
            gSideStatuses[GetBattlerSide(battler)] |= SIDE_STATUS_AURORA_VEIL;
            if (GetBattlerHoldEffect(battler, TRUE) == HOLD_EFFECT_LIGHT_CLAY)
                gSideTimers[GetBattlerSide(battler)].auroraVeilTimer = gBattleTurnCounter + 8;
            else
                gSideTimers[GetBattlerSide(battler)].auroraVeilTimer = gBattleTurnCounter + 5;

            if (IsDoubleBattle() && CountAliveMonsInBattle(BATTLE_ALIVE_SIDE, gBattlerAttacker) == 2)
                gBattleCommunication[MULTISTRING_CHOOSER] = 5;
            else
                gBattleCommunication[MULTISTRING_CHOOSER] = 5;
        }
        break;
    }
    case VARIOUS_TRY_THIRD_TYPE:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        u32 type = GetMoveArgType(gCurrentMove);
        if (IS_BATTLER_OF_TYPE(battler, type) || GetActiveGimmick(battler) == GIMMICK_TERA)
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            gBattleMons[battler].types[2] = type;
            PREPARE_TYPE_BUFFER(gBattleTextBuff1, type);
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        return;
    }
    case VARIOUS_DESTROY_ABILITY_POPUP:
    {
        VARIOUS_ARGS();
        DestroyAbilityPopUp(battler);
        break;
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
    case VARIOUS_MOVEEND_ITEM_EFFECTS:
    {
        VARIOUS_ARGS();
        if (ItemBattleEffects(ITEMEFFECT_NORMAL, battler, FALSE))
            return;
        break;
    }
    case VARIOUS_ROOM_SERVICE:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if (GetBattlerHoldEffect(battler, TRUE) == HOLD_EFFECT_ROOM_SERVICE && TryRoomService(battler))
        {
            BattleScriptPushCursor();
            gBattlescriptCurrInstr = BattleScript_ConsumableStatRaiseRet;
        }
        else
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        return;
    }
    case VARIOUS_TERRAIN_SEED:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if (GetBattlerHoldEffect(battler, TRUE) == HOLD_EFFECT_SEEDS)
        {
            enum ItemEffect effect = ITEM_NO_EFFECT;
            u16 item = gBattleMons[battler].item;
            switch (GetBattlerHoldEffectParam(battler))
            {
            case HOLD_EFFECT_PARAM_ELECTRIC_TERRAIN:
                effect = TryHandleSeed(battler, STATUS_FIELD_ELECTRIC_TERRAIN, STAT_DEF, item, ITEMEFFECT_NONE);
                break;
            case HOLD_EFFECT_PARAM_GRASSY_TERRAIN:
                effect = TryHandleSeed(battler, STATUS_FIELD_GRASSY_TERRAIN, STAT_DEF, item, ITEMEFFECT_NONE);
                break;
            case HOLD_EFFECT_PARAM_MISTY_TERRAIN:
                effect = TryHandleSeed(battler, STATUS_FIELD_MISTY_TERRAIN, STAT_SPDEF, item, ITEMEFFECT_NONE);
                break;
            case HOLD_EFFECT_PARAM_PSYCHIC_TERRAIN:
                effect = TryHandleSeed(battler, STATUS_FIELD_PSYCHIC_TERRAIN, STAT_SPDEF, item, ITEMEFFECT_NONE);
                break;
            }

            if (effect != ITEM_NO_EFFECT)
                return;
        }
        gBattlescriptCurrInstr = cmd->failInstr;
        return;
    }
    case VARIOUS_MAKE_INVISIBLE:
    {
        VARIOUS_ARGS();
        if (gBattleControllerExecFlags)
            break;

        BtlController_EmitSpriteInvisibility(battler, B_COMM_TO_CONTROLLER, TRUE);
        MarkBattlerForControllerExec(battler);
        break;
    }
    case VARIOUS_JUMP_IF_TEAM_HEALTHY:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        if ((IsDoubleBattle()) && IsBattlerAlive(BATTLE_PARTNER(battler)))
        {
            u8 partner = BATTLE_PARTNER(battler);
            if ((gBattleMons[battler].hp == gBattleMons[battler].maxHP && !(gBattleMons[battler].status1 & STATUS1_ANY))
             && (gBattleMons[partner].hp == gBattleMons[partner].maxHP && !(gBattleMons[partner].status1 & STATUS1_ANY)))
                gBattlescriptCurrInstr = cmd->jumpInstr;
            else
                gBattlescriptCurrInstr = cmd->nextInstr;
        }
        else // single battle
        {
            if (gBattleMons[battler].hp == gBattleMons[battler].maxHP && !(gBattleMons[battler].status1 & STATUS1_ANY))
                gBattlescriptCurrInstr = cmd->jumpInstr;
            else
                gBattlescriptCurrInstr = cmd->nextInstr;
        }
        return;
    }
    case VARIOUS_TRY_HEAL_QUARTER_HP:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        gBattleStruct->moveDamage[battler] = GetNonDynamaxMaxHP(battler) / 4;
        if (gBattleStruct->moveDamage[battler] == 0)
            gBattleStruct->moveDamage[battler] = 1;
        gBattleStruct->moveDamage[battler] *= -1;

        if (gBattleMons[battler].hp == gBattleMons[battler].maxHP)
            gBattlescriptCurrInstr = cmd->failInstr;    // fail
        else
            gBattlescriptCurrInstr = cmd->nextInstr;   // can heal
        return;
    }
    case VARIOUS_JUMP_IF_UNDER_200:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        // If the Pokemon is less than 200 kg, or weighing less than 441 lbs, then Sky Drop will work. Otherwise, it will fail.
        if (GetBattlerWeight(gBattlerTarget) < 2000)
            gBattlescriptCurrInstr = cmd->jumpInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_SET_SKY_DROP:
    {
        VARIOUS_ARGS();
        gStatuses3[gBattlerTarget] |= (STATUS3_SKY_DROPPED | STATUS3_ON_AIR);
        /* skyDropTargets holds the information of who is in a particular instance of Sky Drop.
           This is needed in the case that multiple Pokemon use Sky Drop in the same turn or if
           the target of a Sky Drop faints while in the air.*/
        gBattleStruct->skyDropTargets[gBattlerAttacker] = gBattlerTarget;
        gBattleStruct->skyDropTargets[gBattlerTarget] = gBattlerAttacker;

        // End any multiturn effects caused by the target except STATUS2_LOCK_CONFUSE
        gBattleMons[gBattlerTarget].status2 &= ~(STATUS2_MULTIPLETURNS);
        gBattleMons[gBattlerTarget].status2 &= ~(STATUS2_UPROAR);
        gBattleMons[gBattlerTarget].status2 &= ~(STATUS2_BIDE);
        gDisableStructs[gBattlerTarget].rolloutTimer = 0;
        gDisableStructs[gBattlerTarget].furyCutterCounter = 0;

        // End any Follow Me/Rage Powder effects caused by the target
        if (gSideTimers[GetBattlerSide(gBattlerTarget)].followmeTimer != 0 && gSideTimers[GetBattlerSide(gBattlerTarget)].followmeTarget == gBattlerTarget)
            gSideTimers[GetBattlerSide(gBattlerTarget)].followmeTimer = 0;

        break;
    }
    case VARIOUS_CLEAR_SKY_DROP:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        // Check to see if the initial target of this Sky Drop fainted before the 2nd turn of Sky Drop.
        // If so, make the move fail. If not, clear all of the statuses and continue the move.
        if (gBattleStruct->skyDropTargets[gBattlerAttacker] == SKY_DROP_NO_TARGET)
            gBattlescriptCurrInstr = cmd->failInstr;
        else
        {
            gBattleStruct->skyDropTargets[gBattlerAttacker] = SKY_DROP_NO_TARGET;
            gBattleStruct->skyDropTargets[gBattlerTarget] = SKY_DROP_NO_TARGET;
            gStatuses3[gBattlerTarget] &= ~(STATUS3_SKY_DROPPED | STATUS3_ON_AIR);
            gBattlescriptCurrInstr = cmd->nextInstr;
        }

        // Confuse target if they were in the middle of Petal Dance/Outrage/Thrash when targeted.
        if (gBattleMons[gBattlerTarget].status2 & STATUS2_LOCK_CONFUSE)
            gBattleScripting.moveEffect = (MOVE_EFFECT_CONFUSION | MOVE_EFFECT_CERTAIN);
        return;
    }
    case VARIOUS_SKY_DROP_YAWN: // If the mon that's sleeping due to Yawn was holding a Pokemon in Sky Drop, release the target and clear Sky Drop data.
    {
        VARIOUS_ARGS();
        if (gBattleStruct->skyDropTargets[gEffectBattler] != SKY_DROP_NO_TARGET && !(gStatuses3[gEffectBattler] & STATUS3_SKY_DROPPED))
        {
            // Set the target of Sky Drop as gEffectBattler
            gEffectBattler = gBattleStruct->skyDropTargets[gEffectBattler];

            // Clear skyDropTargets data
            gBattleStruct->skyDropTargets[gBattleStruct->skyDropTargets[gEffectBattler]] = SKY_DROP_NO_TARGET;
            gBattleStruct->skyDropTargets[gEffectBattler] = SKY_DROP_NO_TARGET;

            // If the target was in the middle of Outrage/Thrash/etc. when targeted by Sky Drop, confuse them on release and do proper animation
            if (gBattleMons[gEffectBattler].status2 & STATUS2_LOCK_CONFUSE && CanBeConfused(gEffectBattler))
            {
                gBattleMons[gEffectBattler].status2 &= ~(STATUS2_LOCK_CONFUSE);
                gBattlerAttacker = gEffectBattler;
                gBattleMons[gBattlerTarget].status2 |= STATUS2_CONFUSION_TURN(((Random()) % 4) + 2);
                gBattlescriptCurrInstr = BattleScript_ThrashConfuses;
                return;
            }
        }
        break;
    }
    case VARIOUS_JUMP_IF_PRANKSTER_BLOCKED:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        if (BlocksPrankster(gCurrentMove, gBattlerAttacker, battler, TRUE))
            gBattlescriptCurrInstr = cmd->jumpInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
        return;
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
    case VARIOUS_TRY_END_NEUTRALIZING_GAS:
    {
        VARIOUS_ARGS();
        if (gSpecialStatuses[battler].neutralizingGasRemoved)
        {
            gSpecialStatuses[battler].neutralizingGasRemoved = FALSE;
            BattleScriptPush(cmd->nextInstr);
            gBattlescriptCurrInstr = BattleScript_NeutralizingGasExits;
            return;
        }
        break;
    }
    case VARIOUS_GET_ROTOTILLER_TARGETS:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        // Gets the battlers to be affected by rototiller. If there are none, print 'But it failed!'
        {
            u32 count = 0;
            for (i = 0; i < gBattlersCount; i++)
            {
                gSpecialStatuses[i].rototillerAffected = FALSE;
                if (IsRototillerAffected(i))
                {
                    gSpecialStatuses[i].rototillerAffected = TRUE;
                    count++;
                }
            }

            if (count == 0)
                gBattlescriptCurrInstr = cmd->failInstr;   // Rototiller fails
            else
                gBattlescriptCurrInstr = cmd->nextInstr;
        }
        return;
    }
    case VARIOUS_JUMP_IF_NOT_ROTOTILLER_AFFECTED:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        if (gSpecialStatuses[battler].rototillerAffected)
        {
            gSpecialStatuses[battler].rototillerAffected = FALSE;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        else
        {
            gBattlescriptCurrInstr = cmd->jumpInstr;   // Unaffected by rototiller - print STRINGID_NOEFFECTONTARGET
        }
        return;
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

        gBattleStruct->partyState[GetBattlerSide(battler)][gBattlerPartyIndexes[battler]].ateBerry = TRUE;
        gBattleScripting.battler = gEffectBattler = gBattlerTarget = battler;    // Cover all berry effect battler cases. e.g. ChangeStatBuffs uses target ID
        if (ItemBattleEffects(ITEMEFFECT_USE_LAST_ITEM, battler, FALSE))
            return;
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_JUMP_IF_CANT_REVERT_TO_PRIMAL:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        if (GetBattleFormChangeTargetSpecies(battler, FORM_CHANGE_BATTLE_PRIMAL_REVERSION) == gBattleMons[battler].species)
            gBattlescriptCurrInstr = cmd->jumpInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_JUMP_IF_WEATHER_AFFECTED:
        {
            VARIOUS_ARGS(u32 flags, const u8 *jumpInstr);
            u32 flags = cmd->flags;
            if (IsBattlerWeatherAffected(battler, flags))
                gBattlescriptCurrInstr = cmd->jumpInstr;
            else
                gBattlescriptCurrInstr = cmd->nextInstr;
            return;
        }
    case VARIOUS_JUMP_IF_SPECIES:
    {
        VARIOUS_ARGS(u16 species, const u8 *jumpInstr);
        if (gBattleMons[battler].species == cmd->species)
            gBattlescriptCurrInstr = cmd->jumpInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_JUMP_IF_LEAF_GUARD_PROTECTED:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        if (IsLeafGuardProtected(battler, GetBattlerAbility(battler)))
        {
            gBattlerAbility = battler;
            gBattlescriptCurrInstr = cmd->jumpInstr;
        }
        else
        {
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        return;
    }
    case VARIOUS_SET_ATTACKER_STICKY_WEB_USER:
    {
        VARIOUS_ARGS();
        // For Mirror Armor: "If the Pokémon with this Ability is affected by Sticky Web, the effect is reflected back to the Pokémon which set it up.
        //  If Pokémon which set up Sticky Web is not on the field, no Pokémon have their Speed lowered."
        gBattlerAttacker = gBattlerTarget;  // Initialize 'fail' condition
        SET_STATCHANGER(STAT_SPEED, 1, TRUE);
        if (gSideTimers[GetBattlerSide(battler)].stickyWebBattlerId != 0xFF)
            gBattlerAttacker = gSideTimers[GetBattlerSide(battler)].stickyWebBattlerId;
        break;
    }
    case VARIOUS_CUT_1_3_HP_RAISE_STATS:
        {
            VARIOUS_ARGS(const u8 *failInstr);

            bool8 atLeastOneStatBoosted = FALSE;
            u16 hpFraction = max(1, GetNonDynamaxMaxHP(gBattlerAttacker) / 3);

            for (i = 1; i < NUM_STATS; i++)
            {
                if (CompareStat(gBattlerAttacker, i, MAX_STAT_STAGE, CMP_LESS_THAN))
                {
                    atLeastOneStatBoosted = TRUE;
                    break;
                }
            }
            if (atLeastOneStatBoosted && gBattleMons[gBattlerAttacker].hp > hpFraction)
            {
                gBattleStruct->moveDamage[gBattlerAttacker] = hpFraction;
                gBattlescriptCurrInstr = cmd->nextInstr;
            }
            else
            {
                gBattlescriptCurrInstr = cmd->failInstr;
            }
            return;
        }
    case VARIOUS_CHECK_POLTERGEIST:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if (gBattleMons[battler].item == ITEM_NONE
           || gFieldStatuses & STATUS_FIELD_MAGIC_ROOM
           || GetBattlerAbility(battler) == ABILITY_KLUTZ)
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            PREPARE_ITEM_BUFFER(gBattleTextBuff1, gBattleMons[battler].item);
            gLastUsedItem = gBattleMons[battler].item;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        return;
    }
    case VARIOUS_TRY_NO_RETREAT:
    {
        VARIOUS_ARGS(const u8 *failInstr);
        if (gDisableStructs[battler].noRetreat)
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            if (!(gBattleMons[battler].status2 & STATUS2_ESCAPE_PREVENTION))
                gDisableStructs[battler].noRetreat = TRUE;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        return;
    }
    case VARIOUS_CURE_CERTAIN_STATUSES:
    {
        VARIOUS_ARGS();
        // Check infatuation
        if (gBattleMons[battler].status2 & STATUS2_INFATUATION)
        {
            gBattleMons[battler].status2 &= ~(STATUS2_INFATUATION);
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_INFATUATION;  // STRINGID_TARGETGOTOVERINFATUATION
            StringCopy(gBattleTextBuff1, gStatusConditionString_LoveJpn);
        }
        // Check taunt
        if (gDisableStructs[battler].tauntTimer != 0)
        {
            gDisableStructs[battler].tauntTimer = 0;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_TAUNT;
            PREPARE_MOVE_BUFFER(gBattleTextBuff1, MOVE_TAUNT);
        }
        // Check encore
        if (gDisableStructs[battler].encoreTimer != 0)
        {
            gDisableStructs[battler].encoredMove = 0;
            gDisableStructs[battler].encoreTimer = 0;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_ENCORE;   // STRINGID_PKMNENCOREENDED
        }
        // Check torment
        if (gBattleMons[battler].status2 & STATUS2_TORMENT)
        {
            gBattleMons[battler].status2 &= ~(STATUS2_TORMENT);
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_TORMENT;
        }
        // Check heal block
        if (gStatuses3[battler] & STATUS3_HEAL_BLOCK)
        {
            gStatuses3[battler] &= ~(STATUS3_HEAL_BLOCK);
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_HEALBLOCK;
        }
        // Check disable
        if (gDisableStructs[battler].disableTimer != 0)
        {
            gDisableStructs[battler].disableTimer = 0;
            gDisableStructs[battler].disabledMove = 0;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MENTALHERBCURE_DISABLE;
        }
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_TRY_RESET_NEGATIVE_STAT_STAGES:
    {
        VARIOUS_ARGS();
        battler = gBattlerTarget;
        for (i = 0; i < NUM_BATTLE_STATS; i++)
            if (gBattleMons[battler].statStages[i] < DEFAULT_STAT_STAGE)
                gBattleMons[battler].statStages[i] = DEFAULT_STAT_STAGE;
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_JUMP_IF_LAST_USED_ITEM_BERRY:
    {
        VARIOUS_ARGS(const u8 *jumpInstr);
        if (GetItemPocket(gLastUsedItem) == POCKET_BERRIES)
            gBattlescriptCurrInstr = cmd->jumpInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    case VARIOUS_SAVE_BATTLER_ITEM:
    {
        VARIOUS_ARGS();
        gBattleHistory->heldItems[battler] = gBattleMons[battler].item;
        break;
    }
    case VARIOUS_RESTORE_BATTLER_ITEM:
    {
        VARIOUS_ARGS();
        gBattleMons[battler].item = gBattleHistory->heldItems[battler];
        break;
    }
    case VARIOUS_BATTLER_ITEM_TO_LAST_USED_ITEM:
    {
        VARIOUS_ARGS();
        gBattleMons[battler].item = gLastUsedItem;
        break;
    }
    case VARIOUS_GET_BATTLERS_FOR_RECALL:
    {
        battler = 1;
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
        for (i = 0; battler < MAX_BATTLERS_COUNT; battler += 2)
        {
            if (battler < gBattlersCount && gBattleMons[battler].hp != 0)
                gBattleCommunication[MULTISTRING_CHOOSER] |= gBitTable[i];
            i++;
        }
        break;
    }
    } // End of switch (cmd->id)

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void TryResetProtectUseCounter(u32 battler)
{
    u32 lastMove = gLastResultingMoves[battler];
    enum BattleMoveEffects lastEffect = GetMoveEffect(lastMove);
    if (lastMove == MOVE_UNAVAILABLE
        || (!gBattleMoveEffects[lastEffect].usesProtectCounter
          && ((B_ALLY_SWITCH_FAIL_CHANCE >= GEN_9 && lastEffect != EFFECT_ALLY_SWITCH)
            || B_ALLY_SWITCH_FAIL_CHANCE < GEN_9)))
        gDisableStructs[battler].protectUses = 0;
}

static void Cmd_setprotectlike(void)
{
    CMD_ARGS();

    bool32 protectFails = TRUE;
    bool32 notLastTurn = TRUE;
    u32 protectMethod = GetMoveProtectMethod(gCurrentMove);

    TryResetProtectUseCounter(gBattlerAttacker);

    if (gCurrentTurnActionNumber == (gBattlersCount - 1))
        notLastTurn = FALSE;

    if ((sProtectSuccessRates[gDisableStructs[gBattlerAttacker].protectUses] >= Random() && notLastTurn)
     || (protectMethod == PROTECT_WIDE_GUARD && B_WIDE_GUARD != GEN_5)
     || (protectMethod == PROTECT_QUICK_GUARD && B_QUICK_GUARD != GEN_5))
    {
        if (GetMoveEffect(gCurrentMove) == EFFECT_ENDURE)
        {
            gProtectStructs[gBattlerAttacker].endured = TRUE;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_BRACED_ITSELF;
        }
        else if (GetProtectType(protectMethod) == PROTECT_TYPE_SIDE)
        {
            gProtectStructs[gBattlerAttacker].protected = protectMethod;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_PROTECTED_TEAM;
        }
        else
        {
            gProtectStructs[gBattlerAttacker].protected = protectMethod;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_PROTECTED_ITSELF;
        }

        gDisableStructs[gBattlerAttacker].protectUses++;
        protectFails = FALSE;
    }

    if (protectFails)
    {
        gDisableStructs[gBattlerAttacker].protectUses = 0;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_PROTECT_FAILED;
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_tryexplosion(void)
{
    CMD_ARGS();

    if (gBattleControllerExecFlags)
        return;

    gBattleStruct->moveDamage[gBattlerAttacker] = gBattleMons[gBattlerAttacker].hp;
    BtlController_EmitHealthBarUpdate(gBattlerAttacker, B_COMM_TO_CONTROLLER, INSTANT_HP_BAR_DROP);
    MarkBattlerForControllerExec(gBattlerAttacker);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_setatkhptozero(void)
{
    CMD_ARGS();

    if (gBattleControllerExecFlags)
        return;

    gBattleMons[gBattlerAttacker].hp = 0;
    BtlController_EmitSetMonData(gBattlerAttacker, B_COMM_TO_CONTROLLER, REQUEST_HP_BATTLE, 0, sizeof(gBattleMons[gBattlerAttacker].hp), &gBattleMons[gBattlerAttacker].hp);
    MarkBattlerForControllerExec(gBattlerAttacker);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_jumpifnexttargetvalid(void)
{
    CMD_ARGS(const u8 *jumpInstr);

    const u8 *jumpInstr = cmd->jumpInstr;

    for (gBattlerTarget++; gBattlerTarget < gBattlersCount; gBattlerTarget++)
    {
        if (gBattlerTarget == gBattlerAttacker && !(GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove) & MOVE_TARGET_USER))
            continue;
        if (IsBattlerAlive(gBattlerTarget))
            break;
    }

    if (gBattlerTarget >= gBattlersCount)
        gBattlescriptCurrInstr = cmd->nextInstr;
    else
        gBattlescriptCurrInstr = jumpInstr;
}

static void Cmd_tryhealhalfhealth(void)
{
    CMD_ARGS(const u8 *failInstr, u8 battler);

    const u8 *failInstr = cmd->failInstr;

    if (cmd->battler == BS_ATTACKER)
        gBattlerTarget = gBattlerAttacker;

    gBattleStruct->moveDamage[gBattlerTarget] = GetNonDynamaxMaxHP(gBattlerTarget) / 2;
    if (gBattleStruct->moveDamage[gBattlerTarget] == 0)
        gBattleStruct->moveDamage[gBattlerTarget] = 1;
    gBattleStruct->moveDamage[gBattlerTarget] *= -1;

    if (gBattleMons[gBattlerTarget].hp == gBattleMons[gBattlerTarget].maxHP)
        gBattlescriptCurrInstr = failInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void SetMoveForMirrorMove(u32 move)
{
    gHitMarker &= ~HITMARKER_ATTACKSTRING_PRINTED;
    // Edge case, we used Z Mirror Move, got the stat boost and now need to use the Z-move
    if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_Z_MOVE && !IsBattleMoveStatus(move))
    {
        gBattleStruct->zmove.baseMoves[gBattlerAttacker] = move;
        gCurrentMove = GetTypeBasedZMove(move);
    }
    else
    {
        gCurrentMove = move;
    }

    gBattlerTarget = GetBattleMoveTarget(gCurrentMove, NO_TARGET_OVERRIDE);
    ResetValuesForCalledMove();
    gBattlescriptCurrInstr = GetMoveBattleScript(gCurrentMove);
}

static void Cmd_trymirrormove(void)
{
    CMD_ARGS();

    s32 i, validMovesCount;
    u16 move;
    u16 validMoves[MAX_BATTLERS_COUNT] = {0};

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

    move = gBattleStruct->lastTakenMove[gBattlerAttacker];
    if (move != MOVE_NONE && move != MOVE_UNAVAILABLE)
    {
        SetMoveForMirrorMove(move);
    }
    else if (validMovesCount != 0)
    {
        SetMoveForMirrorMove(validMoves[Random() % validMovesCount]);
    }
    else // no valid moves found
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_setfieldweather(void)
{
    CMD_ARGS(u8 weather);

    u8 battleWeatherId = cmd->weather;

    if (!TryChangeBattleWeather(gBattlerAttacker, battleWeatherId, FALSE))
    {
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_FAILED;
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }

    switch (battleWeatherId)
    {
    case BATTLE_WEATHER_RAIN:
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STARTED_RAIN;
        break;
    case BATTLE_WEATHER_SUN:
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STARTED_SUNLIGHT;
        break;
    case BATTLE_WEATHER_SANDSTORM:
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STARTED_SANDSTORM;
        break;
    case BATTLE_WEATHER_HAIL:
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STARTED_HAIL;
        break;
    case BATTLE_WEATHER_SNOW:
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STARTED_SNOW;
        break;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_setreflect(void)
{
    CMD_ARGS();
    if (!TrySetReflect(gBattlerAttacker))
    {
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SIDE_STATUS_FAILED;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_setseeded(void)
{
    CMD_ARGS();

    if (gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT || gStatuses3[gBattlerTarget] & STATUS3_LEECHSEED)
    {
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_LEECH_SEED_MISS;
    }
    else if (IS_BATTLER_OF_TYPE(gBattlerTarget, TYPE_GRASS))
    {
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_LEECH_SEED_FAIL;
    }
    else
    {
        gStatuses3[gBattlerTarget] |= gBattlerAttacker;
        gStatuses3[gBattlerTarget] |= STATUS3_LEECHSEED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_LEECH_SEED_SET;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

// TODO: Needs tests for everything
static void Cmd_manipulatedamage(void)
{
    CMD_ARGS(u8 mode);

    switch (cmd->mode)
    {
    case DMG_CHANGE_SIGN:
        gBattleStruct->moveDamage[gBattlerAttacker] *= -1;
        break;
    case DMG_DOUBLED:
        gBattleStruct->moveDamage[gBattlerTarget] *= 2;
        break;
    case DMG_1_8_TARGET_HP:
        gBattleStruct->moveDamage[gBattlerTarget] = GetNonDynamaxMaxHP(gBattlerTarget) / 8;
        if (gBattleStruct->moveDamage[gBattlerTarget] == 0)
            gBattleStruct->moveDamage[gBattlerTarget] = 1;
        break;
    case DMG_FULL_ATTACKER_HP:
        gBattleStruct->moveDamage[gBattlerTarget] = GetNonDynamaxMaxHP(gBattlerAttacker);
        break;
    case DMG_BIG_ROOT:
        gBattleStruct->moveDamage[gBattlerAttacker] = GetDrainedBigRootHp(gBattlerAttacker, gBattleStruct->moveDamage[gBattlerAttacker]);
        break;
    case DMG_CURR_ATTACKER_HP:
        gBattleStruct->moveDamage[gBattlerTarget] = GetNonDynamaxHP(gBattlerAttacker);
        break;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_trysetrest(void)
{
    CMD_ARGS(const u8 *failInstr);

    const u8 *failInstr = cmd->failInstr;
    gBattlerTarget = gBattlerAttacker;
    gBattleStruct->moveDamage[gBattlerTarget] = gBattleMons[gBattlerTarget].maxHP * (-1);

    if (gBattleMons[gBattlerTarget].hp == gBattleMons[gBattlerTarget].maxHP)
    {
        gBattlescriptCurrInstr = failInstr;
    }
    else if (IsBattlerTerrainAffected(gBattlerTarget, STATUS_FIELD_ELECTRIC_TERRAIN))
    {
        gBattlescriptCurrInstr = BattleScript_ElectricTerrainPrevents;
    }
    else if (IsBattlerTerrainAffected(gBattlerTarget, STATUS_FIELD_MISTY_TERRAIN))
    {
        gBattlescriptCurrInstr = BattleScript_MistyTerrainPrevents;
    }
    else
    {
        if (gBattleMons[gBattlerTarget].status1 & ((u8)(~STATUS1_SLEEP)))
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_REST_STATUSED;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_REST;

        gBattleMons[gBattlerTarget].status1 = STATUS1_SLEEP_TURN(3);
        BtlController_EmitSetMonData(gBattlerTarget, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[gBattlerTarget].status1), &gBattleMons[gBattlerTarget].status1);
        MarkBattlerForControllerExec(gBattlerTarget);
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_jumpifnotfirstturn(void)
{
    CMD_ARGS(const u8 *jumpInstr);

    const u8 *jumpInstr = cmd->jumpInstr;

    if (gDisableStructs[gBattlerAttacker].isFirstTurn && !(gSpecialStatuses[gBattlerAttacker].instructedChosenTarget))
        gBattlescriptCurrInstr = cmd->nextInstr;
    else
        gBattlescriptCurrInstr = jumpInstr;
}

static void Cmd_setmiracleeye(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (!(gStatuses3[gBattlerTarget] & STATUS3_MIRACLE_EYED))
    {
        gStatuses3[gBattlerTarget] |= STATUS3_MIRACLE_EYED;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

bool8 UproarWakeUpCheck(u8 battler)
{
    s32 i;
    bool32 hasSoundproof = (B_UPROAR_IGNORE_SOUNDPROOF < GEN_5 && GetBattlerAbility(battler) == ABILITY_SOUNDPROOF);

    for (i = 0; i < gBattlersCount; i++)
    {
        if (!(gBattleMons[i].status2 & STATUS2_UPROAR) || hasSoundproof)
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

static void Cmd_jumpifuproarwakes(void)
{
    CMD_ARGS(const u8 *jumpInstr);

    if (UproarWakeUpCheck(gBattlerTarget))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_stockpile(void)
{
    CMD_ARGS(u8 id);

    switch (cmd->id)
    {
    case 0:
        if (gDisableStructs[gBattlerAttacker].stockpileCounter >= 3)
        {
            gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_CANT_STOCKPILE;
        }
        else
        {
            gDisableStructs[gBattlerAttacker].stockpileCounter++;
            gDisableStructs[gBattlerAttacker].stockpileBeforeDef = gBattleMons[gBattlerAttacker].statStages[STAT_DEF];
            gDisableStructs[gBattlerAttacker].stockpileBeforeSpDef = gBattleMons[gBattlerAttacker].statStages[STAT_SPDEF];
            PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff1, 1, gDisableStructs[gBattlerAttacker].stockpileCounter);
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STOCKPILED;
        }
        break;
    case 1: // Save def/sp def stats.
        if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT))
        {
            gDisableStructs[gBattlerAttacker].stockpileDef += gBattleMons[gBattlerAttacker].statStages[STAT_DEF] - gDisableStructs[gBattlerAttacker].stockpileBeforeDef;
            gDisableStructs[gBattlerAttacker].stockpileSpDef += gBattleMons[gBattlerAttacker].statStages[STAT_SPDEF] - gDisableStructs[gBattlerAttacker].stockpileBeforeSpDef;
        }
        break;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_stockpiletobasedamage(void)
{
    CMD_ARGS(const u8 *failInstr);

    const u8 *failInstr = cmd->failInstr;
    if (gDisableStructs[gBattlerAttacker].stockpileCounter == 0)
    {
        gBattlescriptCurrInstr = failInstr;
    }
    else
    {
        if (gBattleCommunication[MISS_TYPE] != B_MSG_PROTECTED)
            gBattleScripting.animTurn = gDisableStructs[gBattlerAttacker].stockpileCounter;

        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_stockpiletohpheal(void)
{
    CMD_ARGS(const u8 *failInstr);

    const u8 *failInstr = cmd->failInstr;

    if (gDisableStructs[gBattlerAttacker].stockpileCounter == 0 && !gBattleStruct->snatchedMoveIsUsed)
    {
        gBattlescriptCurrInstr = failInstr;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWALLOW_FAILED;
    }
    else
    {
        if (gBattleMons[gBattlerAttacker].maxHP == gBattleMons[gBattlerAttacker].hp)
        {
            gDisableStructs[gBattlerAttacker].stockpileCounter = 0;
            gBattlescriptCurrInstr = failInstr;
            gBattlerTarget = gBattlerAttacker;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWALLOW_FULL_HP;
        }
        else
        {
            if (gDisableStructs[gBattlerAttacker].stockpileCounter > 0)
            {
                gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerAttacker) / (1 << (3 - gDisableStructs[gBattlerAttacker].stockpileCounter));
                gBattleScripting.animTurn = gDisableStructs[gBattlerAttacker].stockpileCounter;
            }
            else // Snatched move
            {
                gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerAttacker) / 4;
                gBattleScripting.animTurn = 1;
            }

            if (gBattleStruct->moveDamage[gBattlerAttacker] == 0)
                gBattleStruct->moveDamage[gBattlerAttacker] = 1;
            gBattleStruct->moveDamage[gBattlerAttacker] *= -1;

            gBattlescriptCurrInstr = cmd->nextInstr;
            gBattlerTarget = gBattlerAttacker;
        }
    }
}

void BS_RemoveStockpileCounters(void)
{
    NATIVE_ARGS();

    if (GetMoveEffect(gCurrentMove) == EFFECT_SWALLOW
     && gSpecialStatuses[gBattlerAttacker].parentalBondState == PARENTAL_BOND_1ST_HIT
     && IsBattlerAlive(gBattlerTarget))
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gDisableStructs[gBattlerAttacker].stockpileCounter = 0;
        BattleScriptPush(cmd->nextInstr);
        gBattlescriptCurrInstr = BattleScript_MoveEffectStockpileWoreOff;
    }
}

// Sign change for drained HP handled in GetDrainedBigRootHp
static void Cmd_setdrainedhp(void)
{
    CMD_ARGS();

    gBattleStruct->moveDamage[gBattlerAttacker] = (gBattleStruct->moveDamage[gBattlerTarget] * GetMoveAbsorbPercentage(gCurrentMove) / 100);

    if (gBattleStruct->moveDamage[gBattlerAttacker] == 0)
        gBattleStruct->moveDamage[gBattlerAttacker] = 1;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static u16 ReverseStatChangeMoveEffect(u16 moveEffect)
{
    switch (moveEffect)
    {
    // +1
    case MOVE_EFFECT_ATK_PLUS_1:
        return MOVE_EFFECT_ATK_MINUS_1;
    case MOVE_EFFECT_DEF_PLUS_1:
        return MOVE_EFFECT_DEF_MINUS_1;
    case MOVE_EFFECT_SPD_PLUS_1:
        return MOVE_EFFECT_SPD_MINUS_1;
    case MOVE_EFFECT_SP_ATK_PLUS_1:
        return MOVE_EFFECT_SP_ATK_MINUS_1;
    case MOVE_EFFECT_SP_DEF_PLUS_1:
        return MOVE_EFFECT_SP_DEF_MINUS_1;
    case MOVE_EFFECT_ACC_PLUS_1:
        return MOVE_EFFECT_ACC_MINUS_1;
    case MOVE_EFFECT_EVS_PLUS_1:
        return MOVE_EFFECT_EVS_MINUS_1;
    // -1
    case MOVE_EFFECT_ATK_MINUS_1:
        return MOVE_EFFECT_ATK_PLUS_1;
    case MOVE_EFFECT_DEF_MINUS_1:
        return MOVE_EFFECT_DEF_PLUS_1;
    case MOVE_EFFECT_SPD_MINUS_1:
        return MOVE_EFFECT_SPD_PLUS_1;
    case MOVE_EFFECT_SP_ATK_MINUS_1:
        return MOVE_EFFECT_SP_ATK_PLUS_1;
    case MOVE_EFFECT_SP_DEF_MINUS_1:
        return MOVE_EFFECT_SP_DEF_PLUS_1;
    case MOVE_EFFECT_ACC_MINUS_1:
        return MOVE_EFFECT_ACC_PLUS_1;
    case MOVE_EFFECT_EVS_MINUS_1:
    // +2
    case MOVE_EFFECT_ATK_PLUS_2:
        return MOVE_EFFECT_ATK_MINUS_2;
    case MOVE_EFFECT_DEF_PLUS_2:
        return MOVE_EFFECT_DEF_MINUS_2;
    case MOVE_EFFECT_SPD_PLUS_2:
        return MOVE_EFFECT_SPD_MINUS_2;
    case MOVE_EFFECT_SP_ATK_PLUS_2:
        return MOVE_EFFECT_SP_ATK_MINUS_2;
    case MOVE_EFFECT_SP_DEF_PLUS_2:
        return MOVE_EFFECT_SP_DEF_MINUS_2;
    case MOVE_EFFECT_ACC_PLUS_2:
        return MOVE_EFFECT_ACC_MINUS_2;
    case MOVE_EFFECT_EVS_PLUS_2:
        return MOVE_EFFECT_EVS_MINUS_2;
    // -2
    case MOVE_EFFECT_ATK_MINUS_2:
        return MOVE_EFFECT_ATK_PLUS_2;
    case MOVE_EFFECT_DEF_MINUS_2:
        return MOVE_EFFECT_DEF_PLUS_2;
    case MOVE_EFFECT_SPD_MINUS_2:
        return MOVE_EFFECT_SPD_PLUS_2;
    case MOVE_EFFECT_SP_ATK_MINUS_2:
        return MOVE_EFFECT_SP_ATK_PLUS_2;
    case MOVE_EFFECT_SP_DEF_MINUS_2:
        return MOVE_EFFECT_SP_DEF_PLUS_2;
    case MOVE_EFFECT_ACC_MINUS_2:
        return MOVE_EFFECT_ACC_PLUS_2;
    case MOVE_EFFECT_EVS_MINUS_2:
        return MOVE_EFFECT_EVS_PLUS_2;
    default:
        return 0;
    }
}

static u32 ChangeStatBuffs(s8 statValue, u32 statId, u32 flags, const u8 *BS_ptr)
{
    bool32 certain = FALSE;
    bool32 notProtectAffected = FALSE;
    u32 index, battler, battlerAbility;
    enum ItemHoldEffect battlerHoldEffect;
    bool32 affectsUser = (flags & MOVE_EFFECT_AFFECTS_USER);
    bool32 mirrorArmored = (flags & STAT_CHANGE_MIRROR_ARMOR);

    if (affectsUser)
        battler = gBattlerAttacker;
    else
        battler = gBattlerTarget;

    battlerAbility = GetBattlerAbility(battler);
    battlerHoldEffect = GetBattlerHoldEffect(battler, TRUE);

    gSpecialStatuses[battler].changedStatsBattlerId = gBattlerAttacker;

    flags &= ~(MOVE_EFFECT_AFFECTS_USER | STAT_CHANGE_MIRROR_ARMOR);

    if (flags & MOVE_EFFECT_CERTAIN)
        certain = TRUE;
    flags &= ~MOVE_EFFECT_CERTAIN;

    if (flags & STAT_CHANGE_NOT_PROTECT_AFFECTED)
        notProtectAffected++;
    flags &= ~STAT_CHANGE_NOT_PROTECT_AFFECTED;

    if (battlerAbility == ABILITY_CONTRARY)
    {
        statValue ^= STAT_BUFF_NEGATIVE;
        gBattleScripting.statChanger ^= STAT_BUFF_NEGATIVE;
        RecordAbilityBattle(battler, battlerAbility);
        if (flags & STAT_CHANGE_UPDATE_MOVE_EFFECT)
        {
            flags &= ~STAT_CHANGE_UPDATE_MOVE_EFFECT;
            gBattleScripting.moveEffect = ReverseStatChangeMoveEffect(gBattleScripting.moveEffect);
        }
    }
    else if (battlerAbility == ABILITY_SIMPLE)
    {
        statValue = (SET_STAT_BUFF_VALUE(GET_STAT_BUFF_VALUE(statValue) * 2)) | ((statValue <= -1) ? STAT_BUFF_NEGATIVE : 0);
    }

    PREPARE_STAT_BUFFER(gBattleTextBuff1, statId);

    if (statValue <= -1) // Stat decrease.
    {
        if (gSideTimers[GetBattlerSide(battler)].mistTimer
            && !certain && gCurrentMove != MOVE_CURSE
            && !(battler == gBattlerTarget && GetBattlerAbility(gBattlerAttacker) == ABILITY_INFILTRATOR))
        {
            if (flags == STAT_CHANGE_ALLOW_PTR)
            {
                if (gSpecialStatuses[battler].statLowered)
                {
                    gBattlescriptCurrInstr = BS_ptr;
                }
                else
                {
                    BattleScriptPush(BS_ptr);
                    gBattleScripting.battler = battler;
                    gBattlescriptCurrInstr = BattleScript_MistProtected;
                    gSpecialStatuses[battler].statLowered = TRUE;
                }
            }
            return STAT_CHANGE_DIDNT_WORK;
        }
        else if (gCurrentMove != MOVE_CURSE
                 && notProtectAffected != TRUE && JumpIfMoveAffectedByProtect(gCurrentMove, gBattlerTarget, TRUE, BattleScript_ButItFailed))
        {
            return STAT_CHANGE_DIDNT_WORK;
        }
        else if ((battlerHoldEffect == HOLD_EFFECT_CLEAR_AMULET || CanAbilityPreventStatLoss(battlerAbility))
              && (!affectsUser || mirrorArmored) && !certain && gCurrentMove != MOVE_CURSE)
        {
            if (flags == STAT_CHANGE_ALLOW_PTR)
            {
                if (gSpecialStatuses[battler].statLowered)
                {
                    gBattlescriptCurrInstr = BS_ptr;
                }
                else
                {
                    gBattleScripting.battler = battler;
                    if (battlerHoldEffect == HOLD_EFFECT_CLEAR_AMULET)
                    {
                        gLastUsedItem = gBattleMons[battler].item;
                        BattleScriptPush(BS_ptr);
                        gBattlescriptCurrInstr = BattleScript_ItemNoStatLoss;
                        RecordItemEffectBattle(battler, HOLD_EFFECT_CLEAR_AMULET);
                    }
                    else
                    {
                        gBattlerAbility = battler;
                        BattleScriptPush(BS_ptr);
                        gBattlescriptCurrInstr = BattleScript_AbilityNoStatLoss;
                        gLastUsedAbility = battlerAbility;
                        RecordAbilityBattle(battler, gLastUsedAbility);
                    }
                    gSpecialStatuses[battler].statLowered = TRUE;
                }
            }
            return STAT_CHANGE_DIDNT_WORK;
        }
        else if ((index = IsFlowerVeilProtected(battler)) && !certain)
        {
            if (flags == STAT_CHANGE_ALLOW_PTR)
            {
                if (gSpecialStatuses[battler].statLowered)
                {
                    gBattlescriptCurrInstr = BS_ptr;
                }
                else
                {
                    BattleScriptPush(BS_ptr);
                    gBattleScripting.battler = battler;
                    gBattlerAbility = index - 1;
                    gBattlescriptCurrInstr = BattleScript_FlowerVeilProtectsRet;
                    gLastUsedAbility = ABILITY_FLOWER_VEIL;
                    gSpecialStatuses[battler].statLowered = TRUE;
                }
            }
            return STAT_CHANGE_DIDNT_WORK;
        }
        else if (!certain
                && (((battlerAbility == ABILITY_KEEN_EYE || battlerAbility == ABILITY_MINDS_EYE) && statId == STAT_ACC)
                || (B_ILLUMINATE_EFFECT >= GEN_9 && battlerAbility == ABILITY_ILLUMINATE && statId == STAT_ACC)
                || (battlerAbility == ABILITY_HYPER_CUTTER && statId == STAT_ATK)
                || (battlerAbility == ABILITY_BIG_PECKS && statId == STAT_DEF)))
        {
            if (flags == STAT_CHANGE_ALLOW_PTR)
            {
                BattleScriptPush(BS_ptr);
                gBattleScripting.battler = battler;
                gBattlerAbility = battler;
                gBattlescriptCurrInstr = BattleScript_AbilityNoSpecificStatLoss;
                gLastUsedAbility = battlerAbility;
                RecordAbilityBattle(battler, gLastUsedAbility);
            }
            return STAT_CHANGE_DIDNT_WORK;
        }
        else if (battlerAbility == ABILITY_MIRROR_ARMOR && !affectsUser && !mirrorArmored && gBattlerAttacker != gBattlerTarget && battler == gBattlerTarget)
        {
            if (flags == STAT_CHANGE_ALLOW_PTR)
            {
                SET_STATCHANGER(statId, GET_STAT_BUFF_VALUE(statValue) | STAT_BUFF_NEGATIVE, TRUE);
                BattleScriptPush(BS_ptr);
                gBattleScripting.battler = battler;
                gBattlerAbility = battler;
                gBattlescriptCurrInstr = BattleScript_MirrorArmorReflect;
                RecordAbilityBattle(battler, gBattleMons[battler].ability);
            }
            return STAT_CHANGE_DIDNT_WORK;
        }
        else // try to decrease
        {
            statValue = -GET_STAT_BUFF_VALUE(statValue);
            if (gBattleMons[battler].statStages[statId] == 1)
                statValue = -1;
            else if (gBattleMons[battler].statStages[statId] == 2 && statValue < -2)
                statValue = -2;
            gBattleTextBuff2[0] = B_BUFF_PLACEHOLDER_BEGIN;
            index = 1;
            if (statValue == -2)
            {
                gBattleTextBuff2[1] = B_BUFF_STRING;
                gBattleTextBuff2[2] = STRINGID_STATHARSHLY;
                gBattleTextBuff2[3] = STRINGID_STATHARSHLY >> 8;
                index = 4;
            }
            else if (statValue <= -3)
            {
                gBattleTextBuff2[1] = B_BUFF_STRING;
                gBattleTextBuff2[2] = STRINGID_SEVERELY & 0xFF;
                gBattleTextBuff2[3] = STRINGID_SEVERELY >> 8;
                index = 4;
            }
            gBattleTextBuff2[index++] = B_BUFF_STRING;
            gBattleTextBuff2[index++] = STRINGID_STATFELL;
            gBattleTextBuff2[index++] = STRINGID_STATFELL >> 8;
            gBattleTextBuff2[index] = B_BUFF_EOS;

            if (gBattleMons[battler].statStages[statId] == MIN_STAT_STAGE)
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STAT_WONT_DECREASE;
            }
            else
            {
                gProtectStructs[battler].statFell = TRUE;
                gProtectStructs[battler].lashOutAffected = TRUE;
                gBattleCommunication[MULTISTRING_CHOOSER] = (gBattlerTarget == battler); // B_MSG_ATTACKER_STAT_FELL or B_MSG_DEFENDER_STAT_FELL
            }
        }
    }
    else // stat increase
    {
        statValue = GET_STAT_BUFF_VALUE(statValue);
        if (gBattleMons[battler].statStages[statId] == 11)
            statValue = 1;
        else if (gBattleMons[battler].statStages[statId] == 10 && statValue > 2)
            statValue = 2;
        gBattleTextBuff2[0] = B_BUFF_PLACEHOLDER_BEGIN;
        index = 1;
        if (statValue == 2)
        {
            gBattleTextBuff2[1] = B_BUFF_STRING;
            gBattleTextBuff2[2] = STRINGID_STATSHARPLY;
            gBattleTextBuff2[3] = STRINGID_STATSHARPLY >> 8;
            index = 4;
        }
        else if (statValue >= 3)
        {
            gBattleTextBuff2[1] = B_BUFF_STRING;
            gBattleTextBuff2[2] = STRINGID_DRASTICALLY & 0xFF;
            gBattleTextBuff2[3] = STRINGID_DRASTICALLY >> 8;
            index = 4;
        }
        gBattleTextBuff2[index++] = B_BUFF_STRING;
        gBattleTextBuff2[index++] = STRINGID_STATROSE;
        gBattleTextBuff2[index++] = STRINGID_STATROSE >> 8;
        gBattleTextBuff2[index] = B_BUFF_EOS;

        if (gBattleMons[battler].statStages[statId] == MAX_STAT_STAGE)
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STAT_WONT_INCREASE;
        }
        else
        {
            u32 statIncrease;
            if ((statValue + gBattleMons[battler].statStages[statId]) > MAX_STAT_STAGE)
                statIncrease = MAX_STAT_STAGE - gBattleMons[battler].statStages[statId];
            else
                statIncrease = statValue;

            gBattleCommunication[MULTISTRING_CHOOSER] = (gBattlerTarget == battler);
            gProtectStructs[battler].statRaised = TRUE;

            // Check Mirror Herb / Opportunist
            for (index = 0; index < gBattlersCount; index++)
            {
                if (IsBattlerAlly(index, battler))
                    continue; // Only triggers on opposing side

                if (GetBattlerAbility(index) == ABILITY_OPPORTUNIST
                 && gProtectStructs[battler].activateOpportunist == 0) // don't activate opportunist on other mon's opportunist raises
                {
                    gProtectStructs[index].activateOpportunist = 2;      // set stats to copy
                }
                if (GetBattlerHoldEffect(index, TRUE) == HOLD_EFFECT_MIRROR_HERB)
                {
                    gProtectStructs[index].eatMirrorHerb = 1;
                }

                if (gProtectStructs[index].activateOpportunist == 2 || gProtectStructs[index].eatMirrorHerb == 1)
                {
                    gQueuedStatBoosts[index].stats |= (1 << (statId - 1));    // -1 to start at atk
                    gQueuedStatBoosts[index].statChanges[statId - 1] += statIncrease;
                }
            }
        }
    }

    gBattleMons[battler].statStages[statId] += statValue;
    if (gBattleMons[battler].statStages[statId] < MIN_STAT_STAGE)
        gBattleMons[battler].statStages[statId] = MIN_STAT_STAGE;
    if (gBattleMons[battler].statStages[statId] > MAX_STAT_STAGE)
        gBattleMons[battler].statStages[statId] = MAX_STAT_STAGE;

    if (gBattleCommunication[MULTISTRING_CHOOSER] == B_MSG_STAT_WONT_INCREASE && flags & STAT_CHANGE_ALLOW_PTR)
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;

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

    if (ChangeStatBuffs(GET_STAT_BUFF_VALUE_WITH_SIGN(gBattleScripting.statChanger),
                        GET_STAT_BUFF_ID(gBattleScripting.statChanger),
                        flags,
                        failInstr) == STAT_CHANGE_WORKED)
        gBattlescriptCurrInstr = cmd->nextInstr;
    else if (gBattlescriptCurrInstr == ptrBefore) // Prevent infinite looping.
        gBattlescriptCurrInstr = failInstr;
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

// Haze
static void Cmd_normalisebuffs(void)
{
    CMD_ARGS();

    s32 i;

    for (i = 0; i < gBattlersCount; i++)
        TryResetBattlerStatChanges(i);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_setbide(void)
{
    CMD_ARGS();

    gBattleMons[gBattlerAttacker].status2 |= STATUS2_MULTIPLETURNS;
    gLockedMoves[gBattlerAttacker] = gCurrentMove;
    gBideDmg[gBattlerAttacker] = 0;
    gBattleMons[gBattlerAttacker].status2 |= STATUS2_BIDE_TURN(2);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_twoturnmoveschargestringandanimation(void)
{
    CMD_ARGS(const u8 *animationThenStringPtr);

    gBattleScripting.savedStringId = GetMoveTwoTurnAttackStringId(gCurrentMove);
    if (B_UPDATED_MOVE_DATA < GEN_5 || MoveHasChargeTurnAdditionalEffect(gCurrentMove))
        gBattlescriptCurrInstr = cmd->animationThenStringPtr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_trynonvolatilestatus(void)
{
    CMD_ARGS();
    bool32 canInflictStatus = TRUE;

    if (!CanSetNonVolatileStatus(gBattlerAttacker,
                                 gBattlerTarget,
                                 GetBattlerAbility(gBattlerAttacker),
                                 GetBattlerAbility(gBattlerTarget),
                                 GetMoveNonVolatileStatus(gCurrentMove),
                                 STATUS_RUN_SCRIPT))
        canInflictStatus = FALSE;

    if (canInflictStatus && DoesSubstituteBlockMove(gBattlerAttacker, gBattlerTarget, gCurrentMove))
    {
        canInflictStatus = FALSE;
        gBattlescriptCurrInstr = BattleScript_ButItFailed;
    }

    if (canInflictStatus)
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_initmultihitstring(void)
{
    CMD_ARGS();

    PREPARE_BYTE_NUMBER_BUFFER(gBattleScripting.multihitString, 1, 0)

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_forcerandomswitch(void)
{
    CMD_ARGS(const u8 *failInstr);

    s32 battler1PartyId = 0;
    s32 battler2PartyId = 0;

    s32 firstMonId;
    s32 lastMonId = 0; // + 1
    struct Pokemon *party = NULL;
    u8 validMons[PARTY_SIZE];
    s32 validMonsCount = 0;

    bool32 redCardForcedSwitch = FALSE;

    // Red card checks against wild pokemon. If we have reached here, the player has a mon to switch into
    // Red card swaps attacker with target to get the animation correct, so here we check attacker which is really the target. Thanks GF...
    if (gBattleScripting.switchCase == B_SWITCH_RED_CARD
      && !(gBattleTypeFlags & BATTLE_TYPE_TRAINER)
      && !IsOnPlayerSide(gBattlerAttacker))   // Check opponent's red card activating
    {
        if (!WILD_DOUBLE_BATTLE)
        {
            // Wild mon with red card will end single battle
            gBattlescriptCurrInstr = BattleScript_RoarSuccessEndBattle;
            return;
        }
        else
        {
            // Wild double battle, wild mon red card activation on player
            if (IS_WHOLE_SIDE_ALIVE(gBattlerTarget))
            {
                // Both player's battlers are alive
                redCardForcedSwitch = FALSE;
            }
            else
            {
                // Player has only one mon alive -> force red card switch before manually switching to other mon
                redCardForcedSwitch = TRUE;
            }
        }
    }

    // Swapping pokemon happens in:
    // trainer battles
    // wild double battles when an opposing pokemon uses it against one of the two alive player mons
    // wild double battle when a player pokemon uses it against its partner
    if ((gBattleTypeFlags & BATTLE_TYPE_TRAINER)
        || (WILD_DOUBLE_BATTLE
            && !IsOnPlayerSide(gBattlerAttacker)
            && IsOnPlayerSide(gBattlerTarget)
            && IS_WHOLE_SIDE_ALIVE(gBattlerTarget))
        || (WILD_DOUBLE_BATTLE
            && IsOnPlayerSide(gBattlerAttacker)
            && IsOnPlayerSide(gBattlerTarget))
        || redCardForcedSwitch
       )
    {
        party = GetBattlerParty(gBattlerTarget);

        if (BATTLE_TWO_VS_ONE_OPPONENT && !IsOnPlayerSide(gBattlerTarget))
        {
            firstMonId = 0;
            lastMonId = 6;
            battler2PartyId = gBattlerPartyIndexes[gBattlerTarget];
            battler1PartyId = gBattlerPartyIndexes[BATTLE_PARTNER(gBattlerTarget)];
        }
        else if ((gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER && gBattleTypeFlags & BATTLE_TYPE_LINK)
            || (gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER && gBattleTypeFlags & BATTLE_TYPE_RECORDED_LINK)
            || (gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER))
        {
            if ((gBattlerTarget & BIT_FLANK) != B_FLANK_LEFT)
            {
                firstMonId = PARTY_SIZE / 2;
                lastMonId = PARTY_SIZE;
            }
            else
            {
                firstMonId = 0;
                lastMonId = PARTY_SIZE / 2;
            }
            battler2PartyId = gBattlerPartyIndexes[gBattlerTarget];
            battler1PartyId = gBattlerPartyIndexes[BATTLE_PARTNER(gBattlerTarget)];
        }
        else if ((gBattleTypeFlags & BATTLE_TYPE_MULTI && gBattleTypeFlags & BATTLE_TYPE_LINK)
                 || (gBattleTypeFlags & BATTLE_TYPE_MULTI && gBattleTypeFlags & BATTLE_TYPE_RECORDED_LINK))
        {
            if (GetLinkTrainerFlankId(GetBattlerMultiplayerId(gBattlerTarget)) == B_FLANK_RIGHT)
            {
                firstMonId = PARTY_SIZE / 2;
                lastMonId = PARTY_SIZE;
            }
            else
            {
                firstMonId = 0;
                lastMonId = PARTY_SIZE / 2;
            }
            battler2PartyId = gBattlerPartyIndexes[gBattlerTarget];
            battler1PartyId = gBattlerPartyIndexes[BATTLE_PARTNER(gBattlerTarget)];
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS)
        {
            if (IsOnPlayerSide(gBattlerTarget))
            {
                firstMonId = 0;
                lastMonId = PARTY_SIZE;
            }
            else
            {
                if ((gBattlerTarget & BIT_FLANK) != B_FLANK_LEFT)
                {
                    firstMonId = PARTY_SIZE / 2;
                    lastMonId = PARTY_SIZE;
                }
                else
                {
                    firstMonId = 0;
                    lastMonId = PARTY_SIZE / 2;
                }
            }
            battler2PartyId = gBattlerPartyIndexes[gBattlerTarget];
            battler1PartyId = gBattlerPartyIndexes[BATTLE_PARTNER(gBattlerTarget)];
        }
        else if (IsDoubleBattle())
        {
            firstMonId = 0;
            lastMonId = PARTY_SIZE;
            battler2PartyId = gBattlerPartyIndexes[gBattlerTarget];
            battler1PartyId = gBattlerPartyIndexes[BATTLE_PARTNER(gBattlerTarget)];
        }
        else
        {
            firstMonId = 0;
            lastMonId = PARTY_SIZE;
            battler2PartyId = gBattlerPartyIndexes[gBattlerTarget]; // there is only one Pokémon out in single battles
            battler1PartyId = gBattlerPartyIndexes[gBattlerTarget];
        }

        for (u32 i = firstMonId; i < lastMonId; i++)
        {
            if (GetMonData(&party[i], MON_DATA_SPECIES) != SPECIES_NONE
             && !GetMonData(&party[i], MON_DATA_IS_EGG)
             && GetMonData(&party[i], MON_DATA_HP) != 0
             && i != battler1PartyId
             && i != battler2PartyId)
             {
                 validMons[validMonsCount++] = i;
             }
        }

        if (validMonsCount == 0)
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            gBattleStruct->battlerPartyIndexes[gBattlerTarget] = gBattlerPartyIndexes[gBattlerTarget];
            gBattlescriptCurrInstr = BattleScript_RoarSuccessSwitch;
            gBattleStruct->battlerState[gBattlerTarget].forcedSwitch = TRUE;
            gBattleStruct->monToSwitchIntoId[gBattlerTarget] = validMons[RandomUniform(RNG_FORCE_RANDOM_SWITCH, 0, validMonsCount - 1)];

            if (!IsMultiBattle())
                SwitchPartyOrder(gBattlerTarget);

            if ((gBattleTypeFlags & BATTLE_TYPE_LINK && gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
                || (gBattleTypeFlags & BATTLE_TYPE_LINK && gBattleTypeFlags & BATTLE_TYPE_MULTI)
                || (gBattleTypeFlags & BATTLE_TYPE_RECORDED_LINK && gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
                || (gBattleTypeFlags & BATTLE_TYPE_RECORDED_LINK && gBattleTypeFlags & BATTLE_TYPE_MULTI))
            {
                SwitchPartyOrderLinkMulti(gBattlerTarget, gBattleStruct->monToSwitchIntoId[gBattlerTarget], 0);
                SwitchPartyOrderLinkMulti(BATTLE_PARTNER(gBattlerTarget), gBattleStruct->monToSwitchIntoId[gBattlerTarget], 1);
            }

            if (gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER)
                SwitchPartyOrderInGameMulti(gBattlerTarget, gBattleStruct->monToSwitchIntoId[gBattlerTarget]);
        }
    }
    else
    {
        // In normal wild doubles, Roar will always fail if the user's level is less than the target's.
        if (gBattleMons[gBattlerAttacker].level >= gBattleMons[gBattlerTarget].level)
            gBattlescriptCurrInstr = BattleScript_RoarSuccessEndBattle;
        else
            gBattlescriptCurrInstr = cmd->failInstr;
    }
}

static void Cmd_tryconversiontypechange(void)
{
    CMD_ARGS(const u8 *failInstr);

    u8 validMoves = 0;
    u8 moveChecked = 0;
    u8 moveType = 0;

    if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_TERA)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
        return;
    }

    if (B_UPDATED_CONVERSION >= GEN_6)
    {
        // Changes user's type to its first move's type
        for (moveChecked = 0; moveChecked < MAX_MON_MOVES; moveChecked++)
        {
            if (gBattleMons[gBattlerAttacker].moves[moveChecked] != MOVE_NONE)
            {
                moveType = GetMoveType(gBattleMons[gBattlerAttacker].moves[moveChecked]);
                break;
            }
        }
        if (IS_BATTLER_OF_TYPE(gBattlerAttacker, moveType))
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            SET_BATTLER_TYPE(gBattlerAttacker, moveType);
            PREPARE_TYPE_BUFFER(gBattleTextBuff1, moveType);
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
    }
    else
    {
        // Randomly changes user's type to one of its moves' type
        while (validMoves < MAX_MON_MOVES)
        {
            if (gBattleMons[gBattlerAttacker].moves[validMoves] == MOVE_NONE)
                break;

            validMoves++;
        }

        for (moveChecked = 0; moveChecked < validMoves; moveChecked++)
        {
            moveType = GetMoveType(gBattleMons[gBattlerAttacker].moves[moveChecked]);

            if (moveType == TYPE_MYSTERY)
            {
                if (IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_GHOST))
                    moveType = TYPE_GHOST;
                else
                    moveType = TYPE_NORMAL;
            }
            if (moveType != gBattleMons[gBattlerAttacker].types[0]
                && moveType != gBattleMons[gBattlerAttacker].types[1]
                && moveType != gBattleMons[gBattlerAttacker].types[2])
            {
                break;
            }
        }

        if (moveChecked == validMoves)
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            do
            {
                while ((moveChecked = MOD(Random(), MAX_MON_MOVES)) >= validMoves);

                moveType = GetMoveType(gBattleMons[gBattlerAttacker].moves[moveChecked]);

                if (moveType == TYPE_MYSTERY)
                {
                    if (IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_GHOST))
                        moveType = TYPE_GHOST;
                    else
                        moveType = TYPE_NORMAL;
                }
            }
            while (moveType == gBattleMons[gBattlerAttacker].types[0] || moveType == gBattleMons[gBattlerAttacker].types[1] || moveType == gBattleMons[gBattlerAttacker].types[2]);

            SET_BATTLER_TYPE(gBattlerAttacker, moveType);
            PREPARE_TYPE_BUFFER(gBattleTextBuff1, moveType);

            gBattlescriptCurrInstr = cmd->nextInstr;
        }
    }
}

static void Cmd_givepaydaymoney(void)
{
    CMD_ARGS();

    if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_RECORDED_LINK)) && gPaydayMoney != 0)
    {
        u32 bonusMoney = gPaydayMoney * gBattleStruct->moneyMultiplier;
        AddMoney(&gSaveBlock1Ptr->money, bonusMoney);

        PREPARE_HWORD_NUMBER_BUFFER(gBattleTextBuff1, 5, bonusMoney)

        BattleScriptPush(cmd->nextInstr);
        gBattlescriptCurrInstr = BattleScript_PrintPayDayMoneyString;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_setlightscreen(void)
{
    CMD_ARGS();

    if (!TrySetLightScreen(gBattlerAttacker))
    {
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SIDE_STATUS_FAILED;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

#define NOT_ENDURED       0
#define FOCUS_SASHED      1
#define FOCUS_BANDED      2
#define AFFECTION_ENDURED 3
static void Cmd_tryKO(void)
{
    CMD_ARGS(const u8 *failInstr);

    bool32 lands = FALSE;
    enum ItemHoldEffect holdEffect = GetBattlerHoldEffect(gBattlerTarget, TRUE);
    u16 targetAbility = GetBattlerAbility(gBattlerTarget);
    u32 rand = Random() % 100;
    u32 affectionScore = GetBattlerAffectionHearts(gBattlerTarget);
    u32 endured = NOT_ENDURED;

    // Dynamaxed Pokemon cannot be hit by OHKO moves.
    if ((GetActiveGimmick(gBattlerTarget) == GIMMICK_DYNAMAX))
    {
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_KO_UNAFFECTED;
        gBattlescriptCurrInstr = cmd->failInstr;
        return;
    }

    gPotentialItemEffectBattler = gBattlerTarget;
    if (holdEffect == HOLD_EFFECT_FOCUS_BAND
        && (Random() % 100) < GetBattlerHoldEffectParam(gBattlerTarget))
    {
        endured = FOCUS_BANDED;
        RecordItemEffectBattle(gBattlerTarget, holdEffect);
    }
    else if (holdEffect == HOLD_EFFECT_FOCUS_SASH && IsBattlerAtMaxHp(gBattlerTarget))
    {
        endured = FOCUS_SASHED;
        RecordItemEffectBattle(gBattlerTarget, holdEffect);
    }
    else if (B_AFFECTION_MECHANICS == TRUE && IsOnPlayerSide(gBattlerTarget) && affectionScore >= AFFECTION_THREE_HEARTS)
    {
        if ((affectionScore == AFFECTION_FIVE_HEARTS && rand < 20)
         || (affectionScore == AFFECTION_FOUR_HEARTS && rand < 15)
         || (affectionScore == AFFECTION_THREE_HEARTS && rand < 10))
            endured = AFFECTION_ENDURED;
    }

    if (targetAbility == ABILITY_STURDY)
    {
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
        gLastUsedAbility = ABILITY_STURDY;
        gBattlescriptCurrInstr = BattleScript_SturdyPreventsOHKO;
        gBattlerAbility = gBattlerTarget;
    }
    else
    {
        if ((((gStatuses3[gBattlerTarget] & STATUS3_ALWAYS_HITS)
                && gDisableStructs[gBattlerTarget].battlerWithSureHit == gBattlerAttacker)
            || GetBattlerAbility(gBattlerAttacker) == ABILITY_NO_GUARD
            || targetAbility == ABILITY_NO_GUARD)
            && gBattleMons[gBattlerAttacker].level >= gBattleMons[gBattlerTarget].level)
        {
            lands = TRUE;
        }
        else
        {
            u16 odds = GetMoveAccuracy(gCurrentMove) + (gBattleMons[gBattlerAttacker].level - gBattleMons[gBattlerTarget].level);
            if (B_SHEER_COLD_ACC >= GEN_7 && gCurrentMove == MOVE_SHEER_COLD && !IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_ICE))
                odds -= 10;
            if (RandomPercentage(RNG_ACCURACY, odds) && gBattleMons[gBattlerAttacker].level >= gBattleMons[gBattlerTarget].level)
                lands = TRUE;
        }

        if (lands)
        {
            if (gProtectStructs[gBattlerTarget].endured)
            {
                gBattleStruct->moveDamage[gBattlerTarget] = gBattleMons[gBattlerTarget].hp - 1;
                gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_FOE_ENDURED;
            }
            else if (endured == FOCUS_BANDED || endured == FOCUS_SASHED)
            {
                gBattleStruct->moveDamage[gBattlerTarget] = gBattleMons[gBattlerTarget].hp - 1;
                gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_FOE_HUNG_ON;
                gLastUsedItem = gBattleMons[gBattlerTarget].item;
            }
            else if (endured == AFFECTION_ENDURED)
            {
                gBattleStruct->moveDamage[gBattlerTarget] = gBattleMons[gBattlerTarget].hp - 1;
                gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_FOE_ENDURED_AFFECTION;
            }
            else
            {
                gBattleStruct->moveDamage[gBattlerTarget] = gBattleMons[gBattlerTarget].hp;
                gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_ONE_HIT_KO;
            }
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        else
        {
            gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
            if (gBattleMons[gBattlerAttacker].level >= gBattleMons[gBattlerTarget].level)
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_KO_MISS;
            else
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_KO_UNAFFECTED;
            gBattlescriptCurrInstr = cmd->failInstr;
        }
    }
}
#undef NOT_ENDURED
#undef FOCUS_SASHED
#undef FOCUS_BANDED
#undef AFFECTION_ENDURED

static void Cmd_unused_0x94(void)
{
}

static void Cmd_copybidedmg(void)
{
    CMD_ARGS();
    gBattleStruct->moveDamage[gBattlerTarget] = gBideDmg[gBattlerAttacker] * 2;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_unused_96(void)
{
}

static void Cmd_tryinfatuating(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (GetBattlerAbility(gBattlerTarget) == ABILITY_OBLIVIOUS)
    {
        gBattlescriptCurrInstr = BattleScript_NotAffectedAbilityPopUp;
        gLastUsedAbility = ABILITY_OBLIVIOUS;
        RecordAbilityBattle(gBattlerTarget, ABILITY_OBLIVIOUS);
    }
    else
    {
        if (gBattleMons[gBattlerTarget].status2 & STATUS2_INFATUATION
            || !AreBattlersOfOppositeGender(gBattlerAttacker, gBattlerTarget))
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            gBattleMons[gBattlerTarget].status2 |= STATUS2_INFATUATED_WITH(gBattlerAttacker);
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
    }
}

static void Cmd_updatestatusicon(void)
{
    CMD_ARGS(u8 battler);
    u32 battler;

    if (gBattleControllerExecFlags)
        return;

    if (cmd->battler == BS_PLAYER2)
    {
        for (battler = gBattleControllerExecFlags; battler < gBattlersCount; battler++)
        {
            if (!(gAbsentBattlerFlags & (1u << battler)))
            {
                BtlController_EmitStatusIconUpdate(battler, B_COMM_TO_CONTROLLER, gBattleMons[battler].status1, gBattleMons[battler].status2);
                MarkBattlerForControllerExec(battler);
            }
        }
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else if (cmd->battler == BS_ATTACKER_WITH_PARTNER)
    {
        battler = gBattlerAttacker;
        if (!(gAbsentBattlerFlags & (1u << battler)))
        {
            BtlController_EmitStatusIconUpdate(battler, B_COMM_TO_CONTROLLER, gBattleMons[battler].status1, gBattleMons[battler].status2);
            MarkBattlerForControllerExec(battler);
        }
        if ((IsDoubleBattle()))
        {
            battler = GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerPosition(gBattlerAttacker)));
            if (!(gAbsentBattlerFlags & (1u << battler)))
            {
                BtlController_EmitStatusIconUpdate(battler, B_COMM_TO_CONTROLLER, gBattleMons[battler].status1, gBattleMons[battler].status2);
                MarkBattlerForControllerExec(battler);
            }
        }
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        battler = GetBattlerForBattleScript(cmd->battler);
        BtlController_EmitStatusIconUpdate(battler, B_COMM_TO_CONTROLLER, gBattleMons[battler].status1, gBattleMons[battler].status2);
        MarkBattlerForControllerExec(battler);
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_setmist(void)
{
    CMD_ARGS();

    if (gSideTimers[GetBattlerSide(gBattlerAttacker)].mistTimer)
    {
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_FAILED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_MIST_FAILED;
    }
    else
    {
        gSideTimers[GetBattlerSide(gBattlerAttacker)].mistTimer = gBattleTurnCounter + 5;
        gSideStatuses[GetBattlerSide(gBattlerAttacker)] |= SIDE_STATUS_MIST;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_MIST;
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_setfocusenergy(void)
{
    CMD_ARGS(u8 battler);
    u8 battler = GetBattlerForBattleScript(cmd->battler);
    enum BattleMoveEffects effect = GetMoveEffect(gCurrentMove);

    if ((effect == EFFECT_DRAGON_CHEER && (!(IsDoubleBattle()) || (gAbsentBattlerFlags & (1u << battler))))
         || gBattleMons[battler].status2 & STATUS2_FOCUS_ENERGY_ANY)
    {
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_FAILED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_FOCUS_ENERGY_FAILED;
    }
    else if (effect == EFFECT_DRAGON_CHEER && !IS_BATTLER_OF_TYPE(battler, TYPE_DRAGON))
    {
        gBattleMons[battler].status2 |= STATUS2_DRAGON_CHEER;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_GETTING_PUMPED;
    }
    else
    {
        if (GetGenConfig(GEN_CONFIG_FOCUS_ENERGY_CRIT_RATIO) >= GEN_3)
            gBattleMons[battler].status2 |= STATUS2_FOCUS_ENERGY;
        else
            gBattleMons[battler].status2 |= STATUS2_DRAGON_CHEER;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_GETTING_PUMPED;
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_transformdataexecution(void)
{
    CMD_ARGS();

    gChosenMove = MOVE_UNAVAILABLE;
    gBattlescriptCurrInstr = cmd->nextInstr;
    if (gBattleMons[gBattlerTarget].status2 & STATUS2_TRANSFORMED
        || gBattleStruct->illusion[gBattlerTarget].state == ILLUSION_ON
        || gStatuses3[gBattlerTarget] & STATUS3_SEMI_INVULNERABLE_NO_COMMANDER)
    {
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_FAILED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TRANSFORM_FAILED;
    }
    else
    {
        s32 i;
        u8 *battleMonAttacker, *battleMonTarget;
        u8 timesGotHit;

        gBattleMons[gBattlerAttacker].status2 |= STATUS2_TRANSFORMED;
        gDisableStructs[gBattlerAttacker].disabledMove = MOVE_NONE;
        gDisableStructs[gBattlerAttacker].disableTimer = 0;
        gDisableStructs[gBattlerAttacker].transformedMonPersonality = gBattleMons[gBattlerTarget].personality;
        gDisableStructs[gBattlerAttacker].transformedMonShininess = gBattleMons[gBattlerTarget].isShiny;
        gDisableStructs[gBattlerAttacker].mimickedMoves = 0;
        gDisableStructs[gBattlerAttacker].usedMoves = 0;

        timesGotHit = gBattleStruct->timesGotHit[GetBattlerSide(gBattlerTarget)][gBattlerPartyIndexes[gBattlerTarget]];
        gBattleStruct->timesGotHit[GetBattlerSide(gBattlerAttacker)][gBattlerPartyIndexes[gBattlerAttacker]] = timesGotHit;

        PREPARE_SPECIES_BUFFER(gBattleTextBuff1, gBattleMons[gBattlerTarget].species)

        battleMonAttacker = (u8 *)(&gBattleMons[gBattlerAttacker]);
        battleMonTarget = (u8 *)(&gBattleMons[gBattlerTarget]);

        for (i = 0; i < offsetof(struct BattlePokemon, pp); i++)
            battleMonAttacker[i] = battleMonTarget[i];

        gDisableStructs[gBattlerAttacker].overwrittenAbility = GetBattlerAbility(gBattlerTarget);
        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            u32 pp = GetMovePP(gBattleMons[gBattlerAttacker].moves[i]);
            if (pp < 5)
                gBattleMons[gBattlerAttacker].pp[i] = pp;
            else
                gBattleMons[gBattlerAttacker].pp[i] = 5;
        }

        // update AI knowledge
        RecordAllMoves(gBattlerAttacker);
        RecordAbilityBattle(gBattlerAttacker, gBattleMons[gBattlerAttacker].ability);

        BtlController_EmitResetActionMoveSelection(gBattlerAttacker, B_COMM_TO_CONTROLLER, RESET_MOVE_SELECTION);
        MarkBattlerForControllerExec(gBattlerAttacker);
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TRANSFORMED;
    }
}

static void Cmd_setsubstitute(void)
{
    CMD_ARGS();

    u32 factor = GetMoveEffect(gCurrentMove) == EFFECT_SHED_TAIL ? 2 : 4;
    u32 hp;

    if (factor == 2)
        hp = (GetNonDynamaxMaxHP(gBattlerAttacker)+1) / factor; // shed tail rounds up
    else
        hp = GetNonDynamaxMaxHP(gBattlerAttacker) / factor; // one bit value will only work for Pokémon which max hp can go to 1020(which is more than possible in games)

    if (hp == 0)
        hp = 1;

    if (gBattleMons[gBattlerAttacker].hp <= hp)
    {
        gBattleStruct->moveDamage[gBattlerAttacker] = 0;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SUBSTITUTE_FAILED;
    }
    else
    {
        gBattleStruct->moveDamage[gBattlerAttacker] = hp; // one bit value will only work for Pokémon which max hp can go to 1020(which is more than possible in games)
        if (gBattleStruct->moveDamage[gBattlerAttacker] == 0)
            gBattleStruct->moveDamage[gBattlerAttacker] = 1;

        gBattleMons[gBattlerAttacker].status2 |= STATUS2_SUBSTITUTE;
        gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_WRAPPED;
        if (factor == 2)
            gDisableStructs[gBattlerAttacker].substituteHP = gBattleStruct->moveDamage[gBattlerAttacker] / 2;
        else
            gDisableStructs[gBattlerAttacker].substituteHP = gBattleStruct->moveDamage[gBattlerAttacker];
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_SUBSTITUTE;
        gHitMarker |= HITMARKER_IGNORE_SUBSTITUTE;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_mimicattackcopy(void)
{
    CMD_ARGS(const u8 *failInstr);

    if ((IsMoveMimicBanned(gLastMoves[gBattlerTarget]))
        || (gBattleMons[gBattlerAttacker].status2 & STATUS2_TRANSFORMED)
        || gLastMoves[gBattlerTarget] == MOVE_NONE
        || gLastMoves[gBattlerTarget] == MOVE_UNAVAILABLE)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
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
            gChosenMove = 0xFFFF;
            gBattleMons[gBattlerAttacker].moves[gCurrMovePos] = gLastMoves[gBattlerTarget];
            u32 pp = GetMovePP(gLastMoves[gBattlerTarget]);
            if (pp < 5)
                gBattleMons[gBattlerAttacker].pp[gCurrMovePos] = pp;
            else
                gBattleMons[gBattlerAttacker].pp[gCurrMovePos] = 5;

            PREPARE_MOVE_BUFFER(gBattleTextBuff1, gLastMoves[gBattlerTarget])

            gDisableStructs[gBattlerAttacker].mimickedMoves |= 1u << gCurrMovePos;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        else
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
    }
}

static bool32 InvalidMetronomeMove(u32 move)
{
    return GetMoveEffect(move) == EFFECT_PLACEHOLDER
        || IsMoveMetronomeBanned(move);
}

static void Cmd_metronome(void)
{
    CMD_ARGS();

#if B_METRONOME_MOVES >= GEN_9
    u32 moveCount = MOVES_COUNT_GEN9;
#elif B_METRONOME_MOVES >= GEN_8
    u32 moveCount = MOVES_COUNT_GEN8;
#elif B_METRONOME_MOVES >= GEN_7
    u32 moveCount = MOVES_COUNT_GEN7;
#elif B_METRONOME_MOVES >= GEN_6
    u32 moveCount = MOVES_COUNT_GEN6;
#elif B_METRONOME_MOVES >= GEN_5
    u32 moveCount = MOVES_COUNT_GEN5;
#elif B_METRONOME_MOVES >= GEN_4
    u32 moveCount = MOVES_COUNT_GEN4;
#elif B_METRONOME_MOVES >= GEN_3
    u32 moveCount = MOVES_COUNT_GEN3;
#elif B_METRONOME_MOVES >= GEN_2
    u32 moveCount = MOVES_COUNT_GEN2;
#else
    u32 moveCount = MOVES_COUNT_GEN1;
#endif

    gCurrentMove = RandomUniformExcept(RNG_METRONOME, 1, moveCount - 1, InvalidMetronomeMove);
    PrepareStringBattle(STRINGID_WAGGLINGAFINGER, gBattlerAttacker);
    gBattlescriptCurrInstr = GetMoveBattleScript(gCurrentMove);
    gBattlerTarget = GetBattleMoveTarget(gCurrentMove, NO_TARGET_OVERRIDE);
    ResetValuesForCalledMove();
}

static void Cmd_unused_0x9f(void)
{
}

static void Cmd_unused_0xA0(void)
{
}

static void Cmd_counterdamagecalculator(void)
{
    CMD_ARGS(const u8 *failInstr);

    u8 sideAttacker = GetBattlerSide(gBattlerAttacker);
    u8 sideTarget = GetBattlerSide(gProtectStructs[gBattlerAttacker].physicalBattlerId);

    if (gProtectStructs[gBattlerAttacker].physicalDmg
        && sideAttacker != sideTarget
        && gBattleMons[gProtectStructs[gBattlerAttacker].physicalBattlerId].hp)
    {
        gBattleStruct->moveDamage[gBattlerTarget] = gProtectStructs[gBattlerAttacker].physicalDmg * 2;

        if (IsAffectedByFollowMe(gBattlerAttacker, sideTarget, gCurrentMove))
            gBattlerTarget = gSideTimers[sideTarget].followmeTarget;
        else
            gBattlerTarget = gProtectStructs[gBattlerAttacker].physicalBattlerId;

        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

// A copy of Cmd with the physical -> special field changes
static void Cmd_mirrorcoatdamagecalculator(void)
{
    CMD_ARGS(const u8 *failInstr);

    u8 sideAttacker = GetBattlerSide(gBattlerAttacker);
    u8 sideTarget = GetBattlerSide(gProtectStructs[gBattlerAttacker].specialBattlerId);

    if (gProtectStructs[gBattlerAttacker].specialDmg
        && sideAttacker != sideTarget
        && gBattleMons[gProtectStructs[gBattlerAttacker].specialBattlerId].hp)
    {
        gBattleStruct->moveDamage[gBattlerTarget] = gProtectStructs[gBattlerAttacker].specialDmg * 2;

        if (IsAffectedByFollowMe(gBattlerAttacker, sideTarget, gCurrentMove))
            gBattlerTarget = gSideTimers[sideTarget].followmeTarget;
        else
            gBattlerTarget = gProtectStructs[gBattlerAttacker].specialBattlerId;

        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

static void Cmd_disablelastusedattack(void)
{
    CMD_ARGS(const u8 *failInstr);

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
        if (B_DISABLE_TURNS >= GEN_5)
            gDisableStructs[gBattlerTarget].disableTimer = 4;
        else if (B_DISABLE_TURNS >= GEN_4)
            gDisableStructs[gBattlerTarget].disableTimer = (Random() & 3) + 4; // 4-7 turns
        else
            gDisableStructs[gBattlerTarget].disableTimer = (Random() & 3) + 2; // 2-5 turns
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

static void Cmd_trysetencore(void)
{
    CMD_ARGS(const u8 *failInstr);

    s32 i;

    if (IsMaxMove(gLastMoves[gBattlerTarget]) && !(GetActiveGimmick(gBattlerTarget) == GIMMICK_DYNAMAX))
    {
        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            if (gBattleMons[gBattlerTarget].moves[i] == gBattleStruct->dynamax.baseMoves[gBattlerTarget])
                break;
        }
    }
    else
    {
        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            if (gBattleMons[gBattlerTarget].moves[i] == gLastMoves[gBattlerTarget])
                break;
        }
    }

    if ((IsMoveEncoreBanned(gLastMoves[gBattlerTarget]))
     || gLastMoves[gBattlerTarget] == MOVE_NONE
     || gLastMoves[gBattlerTarget] == MOVE_UNAVAILABLE)
    {
        i = MAX_MON_MOVES;
    }

    if (gDisableStructs[gBattlerTarget].encoredMove == MOVE_NONE
        && i != MAX_MON_MOVES && gBattleMons[gBattlerTarget].pp[i] != 0)
    {
        gDisableStructs[gBattlerTarget].encoredMove = gBattleMons[gBattlerTarget].moves[i];
        gDisableStructs[gBattlerTarget].encoredMovePos = i;
        // Encore always lasts 3 turns, but we need to account for a scenario where Encore changes the move during the same turn.
        if (GetBattlerTurnOrderNum(gBattlerAttacker) > GetBattlerTurnOrderNum(gBattlerTarget))
            gDisableStructs[gBattlerTarget].encoreTimer = 4;
        else
            gDisableStructs[gBattlerTarget].encoreTimer = 3;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

static void Cmd_painsplitdmgcalc(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (!(DoesSubstituteBlockMove(gBattlerAttacker, gBattlerTarget, gCurrentMove)))
    {
        s32 hpDiff = (gBattleMons[gBattlerAttacker].hp + GetNonDynamaxHP(gBattlerTarget)) / 2;

        gBattleStruct->moveDamage[gBattlerTarget] = GetNonDynamaxHP(gBattlerTarget) - hpDiff;
        gBattleStruct->moveDamage[gBattlerAttacker] = gBattleMons[gBattlerAttacker].hp - hpDiff;

        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

// Conversion 2
static void Cmd_settypetorandomresistance(void)
{
    CMD_ARGS(const u8 *failInstr);

    // Before Gen 5 Conversion 2 only worked on a move the attacker was actually hit by.
    // This changed later to the last move used by the selected target.
    if (B_UPDATED_CONVERSION_2 < GEN_5)
    {
        if (gLastLandedMoves[gBattlerAttacker] == MOVE_NONE
         || gLastLandedMoves[gBattlerAttacker] == MOVE_UNAVAILABLE)
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else if (gBattleMoveEffects[GetMoveEffect(gLastLandedMoves[gBattlerAttacker])].twoTurnEffect
              && gBattleMons[gLastHitBy[gBattlerAttacker]].status2 & STATUS2_MULTIPLETURNS)
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_TERA)
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else if (gLastHitByType[gBattlerAttacker] == TYPE_STELLAR || gLastHitByType[gBattlerAttacker] == TYPE_MYSTERY)
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            u32 i, resistTypes = 0;
            u32 hitByType = gLastHitByType[gBattlerAttacker];

            for (i = 0; i < NUMBER_OF_MON_TYPES; i++) // Find all types that resist.
            {
                switch (GetTypeModifier(hitByType, i))
                {
                case UQ_4_12(0):
                case UQ_4_12(0.5):
                    resistTypes |= 1u << i;
                    break;
                }
            }

            while (resistTypes != 0)
            {
                i = Random() % NUMBER_OF_MON_TYPES;
                if (resistTypes & 1u << i)
                {
                    if (IS_BATTLER_OF_TYPE(gBattlerAttacker, i))
                    {
                        resistTypes &= ~(1u << i); // Type resists, but the user is already of this type.
                    }
                    else
                    {
                        SET_BATTLER_TYPE(gBattlerAttacker, i);
                        PREPARE_TYPE_BUFFER(gBattleTextBuff1, i);
                        gBattlescriptCurrInstr = cmd->nextInstr;
                        return;
                    }
                }
            }

            gBattlescriptCurrInstr = cmd->failInstr;
        }
    }
    else
    {
        if (gLastResultingMoves[gBattlerTarget] == MOVE_NONE
         || gLastResultingMoves[gBattlerTarget] == MOVE_UNAVAILABLE
         || gLastResultingMoves[gBattlerTarget] == MOVE_STRUGGLE)
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else if (IsSemiInvulnerable(gBattlerTarget, gCurrentMove))
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else if (gLastUsedMoveType[gBattlerTarget] == TYPE_NONE || gLastUsedMoveType[gBattlerTarget] == TYPE_STELLAR || gLastUsedMoveType[gBattlerTarget] == TYPE_MYSTERY)
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_TERA)
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            u32 i, resistTypes = 0;

            for (i = 0; i < NUMBER_OF_MON_TYPES; i++) // Find all types that resist.
            {
                switch (GetTypeModifier(gLastUsedMoveType[gBattlerTarget], i))
                {
                case UQ_4_12(0):
                case UQ_4_12(0.5):
                    resistTypes |= 1u << i;
                    break;
                }
            }

            while (resistTypes != 0)
            {
                i = Random() % NUMBER_OF_MON_TYPES;
                if (resistTypes & 1u << i)
                {
                    if (IS_BATTLER_OF_TYPE(gBattlerAttacker, i))
                    {
                        resistTypes &= ~(1u << i); // Type resists, but the user is already of this type.
                    }
                    else
                    {
                        SET_BATTLER_TYPE(gBattlerAttacker, i);
                        PREPARE_TYPE_BUFFER(gBattleTextBuff1, i);
                        gBattlescriptCurrInstr = cmd->nextInstr;
                        return;
                    }
                }
            }

            gBattlescriptCurrInstr = cmd->failInstr;
        }
    }
}

static void Cmd_setalwayshitflag(void)
{
    CMD_ARGS();

    gStatuses3[gBattlerTarget] &= ~STATUS3_ALWAYS_HITS;
    gStatuses3[gBattlerTarget] |= STATUS3_ALWAYS_HITS_TURN(2);
    gDisableStructs[gBattlerTarget].battlerWithSureHit = gBattlerAttacker;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

// Sketch
static void Cmd_copymovepermanently(void)
{
    CMD_ARGS(const u8 *failInstr);

    gChosenMove = MOVE_UNAVAILABLE;

    if (!(gBattleMons[gBattlerAttacker].status2 & STATUS2_TRANSFORMED)
        && gLastPrintedMoves[gBattlerTarget] != MOVE_UNAVAILABLE
        && !IsMoveSketchBanned(gLastPrintedMoves[gBattlerTarget]))
    {
        s32 i;

        for (i = 0; i < MAX_MON_MOVES; i++)
        {
            if (GetMoveEffect(gBattleMons[gBattlerAttacker].moves[i]) == EFFECT_SKETCH)
                continue;
            if (gBattleMons[gBattlerAttacker].moves[i] == gLastPrintedMoves[gBattlerTarget])
                break;
        }

        if (i != MAX_MON_MOVES)
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else // sketch worked
        {
            struct MovePpInfo movePpData;

            gBattleMons[gBattlerAttacker].moves[gCurrMovePos] = gLastPrintedMoves[gBattlerTarget];
            gBattleMons[gBattlerAttacker].pp[gCurrMovePos] = GetMovePP(gLastPrintedMoves[gBattlerTarget]);

            for (i = 0; i < MAX_MON_MOVES; i++)
            {
                movePpData.moves[i] = gBattleMons[gBattlerAttacker].moves[i];
                movePpData.pp[i] = gBattleMons[gBattlerAttacker].pp[i];
            }
            movePpData.ppBonuses = gBattleMons[gBattlerAttacker].ppBonuses;

            BtlController_EmitSetMonData(gBattlerAttacker, B_COMM_TO_CONTROLLER, REQUEST_MOVES_PP_BATTLE, 0, sizeof(movePpData), &movePpData);
            MarkBattlerForControllerExec(gBattlerAttacker);

            PREPARE_MOVE_BUFFER(gBattleTextBuff1, gLastPrintedMoves[gBattlerTarget])

            gBattlescriptCurrInstr = cmd->nextInstr;
        }
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

static void Cmd_trychoosesleeptalkmove(void)
{
    CMD_ARGS(const u8 *failInstr);

    u32 i, unusableMovesBits = 0, movePosition;

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        if (IsMoveSleepTalkBanned(gBattleMons[gBattlerAttacker].moves[i])
            || gBattleMoveEffects[GetMoveEffect(gBattleMons[gBattlerAttacker].moves[i])].twoTurnEffect)
        {
            unusableMovesBits |= (1 << (i));
        }
    }

    unusableMovesBits = CheckMoveLimitations(gBattlerAttacker, unusableMovesBits, ~(MOVE_LIMITATION_PP | MOVE_LIMITATION_CHOICE_ITEM));
    if (unusableMovesBits == ALL_MOVES_MASK) // all 4 moves cannot be chosen
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else // at least one move can be chosen
    {
        // Set Sleep Talk as used move, so it works with Last Resort.
        gDisableStructs[gBattlerAttacker].usedMoves |= 1u << gCurrMovePos;
        do
        {
            movePosition = MOD(Random(), MAX_MON_MOVES);
        } while ((1u << movePosition) & unusableMovesBits);

        if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_Z_MOVE && !IsBattleMoveStatus(gBattleMons[gBattlerAttacker].moves[movePosition]))
        {
            gBattleStruct->zmove.baseMoves[gBattlerAttacker] = gBattleMons[gBattlerAttacker].moves[movePosition];
            gCalledMove = GetTypeBasedZMove(gBattleMons[gBattlerAttacker].moves[movePosition]);
        }
        else
        {
            gCalledMove = gBattleMons[gBattlerAttacker].moves[movePosition];
        }
        gCurrMovePos = movePosition;
        gHitMarker &= ~HITMARKER_ATTACKSTRING_PRINTED;
        gBattlerTarget = GetBattleMoveTarget(gCalledMove, NO_TARGET_OVERRIDE);
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

static inline bool32 IsDanamaxMonPresent(void)
{
    for (u32 battler = 0; battler < gBattlersCount; battler++)
    {
        if (battler == gBattlerAttacker)
            continue;

        if (GetActiveGimmick(battler) == GIMMICK_DYNAMAX)
            return TRUE;
    }

    return FALSE;
}

static void Cmd_trysetdestinybond(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (IsDanamaxMonPresent())
    {
        gBattlescriptCurrInstr = BattleScript_MoveBlockedByDynamax;
    }
    else if (DoesDestinyBondFail(gBattlerAttacker))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gBattleMons[gBattlerAttacker].status2 |= STATUS2_DESTINY_BOND;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void TrySetDestinyBondToHappen(void)
{
    if (gBattleMons[gBattlerTarget].status2 & STATUS2_DESTINY_BOND
        && !IsBattlerAlly(gBattlerAttacker, gBattlerTarget)
        && !(gHitMarker & HITMARKER_GRUDGE))
    {
        gHitMarker |= HITMARKER_DESTINYBOND;
    }
}

static void Cmd_trysetdestinybondtohappen(void)
{
    CMD_ARGS();

    TrySetDestinyBondToHappen();
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_settailwind(void)
{
    CMD_ARGS(const u8 *failInstr);

    u8 side = GetBattlerSide(gBattlerAttacker);

    if (!(gSideStatuses[side] & SIDE_STATUS_TAILWIND))
    {
        gSideStatuses[side] |= SIDE_STATUS_TAILWIND;
        gSideTimers[side].tailwindTimer = gBattleTurnCounter +  (B_TAILWIND_TURNS >= GEN_5 ? 4 : 3);
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

static void Cmd_tryspiteppreduce(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gLastMoves[gBattlerTarget] != MOVE_NONE
     && gLastMoves[gBattlerTarget] != MOVE_UNAVAILABLE)
    {
        s32 i;

        // Get move slot to reduce PP.
        if (IsMaxMove(gLastMoves[gBattlerTarget]))
        {
            for (i = 0; i < MAX_MON_MOVES; i++)
            {
                if (gBattleStruct->dynamax.baseMoves[gBattlerTarget] == gBattleMons[gBattlerTarget].moves[i])
                    break;
            }
        }
        else
        {
            for (i = 0; i < MAX_MON_MOVES; i++)
            {
                if (gLastMoves[gBattlerTarget] == gBattleMons[gBattlerTarget].moves[i])
                    break;
            }
        }

        if (i != MAX_MON_MOVES && gBattleMons[gBattlerTarget].pp[i] > (B_CAN_SPITE_FAIL >= GEN_4 ? 0 : 1))
        {
            s32 ppToDeduct = B_PP_REDUCED_BY_SPITE >= GEN_4 ? 4 : (Random() & 3) + 2;
            // G-Max Depletion only deducts 2 PP.
            if (IsMaxMove(gCurrentMove) && MoveHasAdditionalEffect(gCurrentMove, MOVE_EFFECT_SPITE))
                ppToDeduct = 2;

            if (gBattleMons[gBattlerTarget].pp[i] < ppToDeduct)
                ppToDeduct = gBattleMons[gBattlerTarget].pp[i];

            PREPARE_MOVE_BUFFER(gBattleTextBuff1, gLastMoves[gBattlerTarget])

            ConvertIntToDecimalStringN(gBattleTextBuff2, ppToDeduct, STR_CONV_MODE_LEFT_ALIGN, 1);

            PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff2, 1, ppToDeduct)

            gBattleMons[gBattlerTarget].pp[i] -= ppToDeduct;

            // if (MOVE_IS_PERMANENT(gBattlerTarget, i)), but backwards
            if (!(gDisableStructs[gBattlerTarget].mimickedMoves & (1u << i))
                && !(gBattleMons[gBattlerTarget].status2 & STATUS2_TRANSFORMED))
            {
                BtlController_EmitSetMonData(gBattlerTarget, B_COMM_TO_CONTROLLER, REQUEST_PPMOVE1_BATTLE + i, 0, sizeof(gBattleMons[gBattlerTarget].pp[i]), &gBattleMons[gBattlerTarget].pp[i]);
                MarkBattlerForControllerExec(gBattlerTarget);
            }

            gBattlescriptCurrInstr = cmd->nextInstr;

            // Don't cut off Sky Drop if pp is brought to zero.
            if (gBattleMons[gBattlerTarget].pp[i] == 0 && gBattleStruct->skyDropTargets[gBattlerTarget] == SKY_DROP_NO_TARGET)
                CancelMultiTurnMoves(gBattlerTarget, SKY_DROP_IGNORE);
        }
        else
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

static void Cmd_healpartystatus(void)
{
    CMD_ARGS();

    u32 i = 0;
    u32 zero = 0;
    u32 toHeal = 0;
    u32 partner = GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerPosition(gBattlerAttacker)));
    struct Pokemon *party = GetBattlerParty(gBattlerAttacker);
    bool32 isSoundMove = IsSoundMove(gCurrentMove);

    if (GetGenConfig(GEN_CONFIG_HEAL_BELL_SOUNDPROOF) == GEN_5
     || GetGenConfig(GEN_CONFIG_HEAL_BELL_SOUNDPROOF) >= GEN_8
     || !(isSoundMove && GetBattlerAbility(gBattlerAttacker) == ABILITY_SOUNDPROOF))
    {
        if (isSoundMove)
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_BELL;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SOOTHING_AROMA;
        gBattleMons[gBattlerAttacker].status1 = 0;
        gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_NIGHTMARE;
    }
    else
    {
        RecordAbilityBattle(gBattlerAttacker, gBattleMons[gBattlerAttacker].ability);
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_BELL_SOUNDPROOF_ATTACKER;
    }

    gBattleScripting.battler = partner;

    if (IsBattlerAlive(partner))
    {
        if (GetGenConfig(GEN_CONFIG_HEAL_BELL_SOUNDPROOF) == GEN_5
         || !(isSoundMove && GetBattlerAbility(partner) == ABILITY_SOUNDPROOF))
        {
            gBattleMons[partner].status1 = 0;
            gBattleMons[partner].status2 &= ~STATUS2_NIGHTMARE;
        }
        else
        {
            RecordAbilityBattle(partner, gBattleMons[partner].ability);
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_BELL_SOUNDPROOF_PARTNER;
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
            bool32 isAttacker = gBattlerPartyIndexes[gBattlerAttacker] == i;
            bool32 isDoublesPartner = gBattlerPartyIndexes[partner] == i && IsBattlerAlive(partner);

            if (GetGenConfig(GEN_CONFIG_HEAL_BELL_SOUNDPROOF) == GEN_5
             || (GetGenConfig(GEN_CONFIG_HEAL_BELL_SOUNDPROOF) >= GEN_8 && isAttacker))
                ability = ABILITY_NONE;
            else if (GetGenConfig(GEN_CONFIG_HEAL_BELL_SOUNDPROOF) > GEN_5 && !isAttacker && !isDoublesPartner)
                ability = ABILITY_NONE;
            else if (isAttacker)
                ability = GetBattlerAbility(gBattlerAttacker);
            else if (isDoublesPartner)
                ability = GetBattlerAbility(partner);
            else
            {
                ability = GetAbilityBySpecies(species, abilityNum);
                #if TESTING
                if (gTestRunnerEnabled)
                {
                    u32 side = GetBattlerSide(gBattlerAttacker);
                    if (TestRunner_Battle_GetForcedAbility(side, i))
                        ability = TestRunner_Battle_GetForcedAbility(side, i);
                }
                #endif
            }

            if (!(isSoundMove && ability == ABILITY_SOUNDPROOF))
            {
                toHeal |= (1 << i);
                TryDeactivateSleepClause(GetBattlerSide(gBattlerAttacker), i);
            }
        }
    }

    if (toHeal)
    {
        BtlController_EmitSetMonData(gBattlerAttacker, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, toHeal, sizeof(zero), &zero);
        MarkBattlerForControllerExec(gBattlerAttacker);
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_cursetarget(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gBattleMons[gBattlerTarget].status2 & STATUS2_CURSED)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gBattleMons[gBattlerTarget].status2 |= STATUS2_CURSED;
        gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerAttacker) / 2;
        if (gBattleStruct->moveDamage[gBattlerAttacker] == 0)
            gBattleStruct->moveDamage[gBattlerAttacker] = 1;

        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_trysetspikes(void)
{
    CMD_ARGS(const u8 *failInstr);

    u8 targetSide = BATTLE_OPPOSITE(GetBattlerSide(gBattlerAttacker));

    if (gSideTimers[targetSide].spikesAmount == 3)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gSideStatuses[targetSide] |= SIDE_STATUS_SPIKES;
        gSideTimers[targetSide].spikesAmount++;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_setforesight(void)
{
    CMD_ARGS();

    gBattleMons[gBattlerTarget].status2 |= STATUS2_FORESIGHT;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_trysetperishsong(void)
{
    CMD_ARGS(const u8 *failInstr);

    s32 i;
    s32 notAffectedCount = 0;

    for (i = 0; i < gBattlersCount; i++)
    {
        if (gStatuses3[i] & STATUS3_PERISH_SONG
            || GetBattlerAbility(i) == ABILITY_SOUNDPROOF
            || BlocksPrankster(gCurrentMove, gBattlerAttacker, i, TRUE)
            || gStatuses3[i] & STATUS3_COMMANDER)
        {
            notAffectedCount++;
        }
        else
        {
            gStatuses3[i] |= STATUS3_PERISH_SONG;
            gDisableStructs[i].perishSongTimer = 3;
        }
    }

    if (notAffectedCount == gBattlersCount)
        gBattlescriptCurrInstr = cmd->failInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_handlerollout(void)
{
    CMD_ARGS();

    if (gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
    {
        CancelMultiTurnMoves(gBattlerAttacker, SKY_DROP_IGNORE);
        gBattlescriptCurrInstr = BattleScript_MoveMissedPause;
    }
    else
    {
        if (!(gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS)) // First hit.
        {
            gDisableStructs[gBattlerAttacker].rolloutTimer = 5;
            gDisableStructs[gBattlerAttacker].rolloutTimerStartValue = 5;
            gBattleMons[gBattlerAttacker].status2 |= STATUS2_MULTIPLETURNS;
            gLockedMoves[gBattlerAttacker] = gCurrentMove;
        }
        if (--gDisableStructs[gBattlerAttacker].rolloutTimer == 0) // Last hit.
        {
            gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_MULTIPLETURNS;
        }

        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_jumpifconfusedandstatmaxed(void)
{
    CMD_ARGS(u8 stat, const u8 *jumpInstr);

    if (gBattleMons[gBattlerTarget].status2 & STATUS2_CONFUSION
      && !CompareStat(gBattlerTarget, cmd->stat, MAX_STAT_STAGE, CMP_LESS_THAN))
        gBattlescriptCurrInstr = cmd->jumpInstr; // Fails if we're confused AND stat cannot be raised
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_handlefurycutter(void)
{
    CMD_ARGS();

    if (gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
    {
        gDisableStructs[gBattlerAttacker].furyCutterCounter = 0;
        gBattlescriptCurrInstr = BattleScript_MoveMissedPause;
    }
    else
    {
        u32 max;

        if (B_UPDATED_MOVE_DATA >= GEN_6)
            max = 3;
        else if (B_UPDATED_MOVE_DATA == GEN_5)
            max = 4;
        else
            max = 5;

        if (gDisableStructs[gBattlerAttacker].furyCutterCounter < max
            && gSpecialStatuses[gBattlerAttacker].parentalBondState != PARENTAL_BOND_2ND_HIT) // Don't increment counter on second hit
            gDisableStructs[gBattlerAttacker].furyCutterCounter++;

        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_setembargo(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gStatuses3[gBattlerTarget] & STATUS3_EMBARGO)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gStatuses3[gBattlerTarget] |= STATUS3_EMBARGO;
        gDisableStructs[gBattlerTarget].embargoTimer = gBattleTurnCounter + 5;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_presentdamagecalculation(void)
{
    CMD_ARGS();

    u32 rand = Random() & 0xFF;

    /* Don't reroll present effect/power for the second hit of Parental Bond.
     * Not sure if this is the correct behaviour, but bulbapedia states
     * that if present heals the foe, it doesn't strike twice, and if it deals
     * damage, the second strike will always deal damage too. This is a simple way
     * to replicate that effect.
     */
    if (gSpecialStatuses[gBattlerAttacker].parentalBondState != PARENTAL_BOND_2ND_HIT)
    {
        if (rand < 102)
        {
            gBattleStruct->presentBasePower = 40;
        }
        else if (rand < 178)
        {
            gBattleStruct->presentBasePower = 80;
        }
        else if (rand < 204)
        {
            gBattleStruct->presentBasePower = 120;
        }
        else
        {
            // TODO: Check if this is correct
            gBattleStruct->moveDamage[gBattlerTarget] = GetNonDynamaxMaxHP(gBattlerTarget) / 4;
            if (gBattleStruct->moveDamage[gBattlerTarget] == 0)
                gBattleStruct->moveDamage[gBattlerTarget] = 1;
            gBattleStruct->moveDamage[gBattlerTarget] *= -1;
            gBattleStruct->presentBasePower = 0;
        }
    }

    if (gBattleStruct->presentBasePower)
    {
        gBattlescriptCurrInstr = BattleScript_HitFromCritCalc;
    }
    else if (gBattleMons[gBattlerTarget].maxHP == gBattleMons[gBattlerTarget].hp)
    {
        gBattlescriptCurrInstr = BattleScript_AlreadyAtFullHp;
    }
    else
    {
        gBattleStruct->moveResultFlags[gBattlerTarget] &= ~MOVE_RESULT_DOESNT_AFFECT_FOE;
        gBattlescriptCurrInstr = BattleScript_PresentHealTarget;
    }
}

static void Cmd_setsafeguard(void)
{
    CMD_ARGS();

    if (gSideStatuses[GetBattlerSide(gBattlerAttacker)] & SIDE_STATUS_SAFEGUARD)
    {
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SIDE_STATUS_FAILED;
    }
    else
    {
        gSideStatuses[GetBattlerSide(gBattlerAttacker)] |= SIDE_STATUS_SAFEGUARD;
        gSideTimers[GetBattlerSide(gBattlerAttacker)].safeguardTimer = gBattleTurnCounter + 5;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_SAFEGUARD;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_magnitudedamagecalculation(void)
{
    CMD_ARGS();

    u32 magnitude = Random() % 100;

    if (magnitude < 5)
    {
        gBattleStruct->magnitudeBasePower = 10;
        magnitude = 4;
    }
    else if (magnitude < 15)
    {
        gBattleStruct->magnitudeBasePower = 30;
        magnitude = 5;
    }
    else if (magnitude < 35)
    {
        gBattleStruct->magnitudeBasePower = 50;
        magnitude = 6;
    }
    else if (magnitude < 65)
    {
        gBattleStruct->magnitudeBasePower = 70;
        magnitude = 7;
    }
    else if (magnitude < 85)
    {
        gBattleStruct->magnitudeBasePower = 90;
        magnitude = 8;
    }
    else if (magnitude < 95)
    {
        gBattleStruct->magnitudeBasePower = 110;
        magnitude = 9;
    }
    else
    {
        gBattleStruct->magnitudeBasePower = 150;
        magnitude = 10;
    }

    PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff1, 2, magnitude)

    for (gBattlerTarget = 0; gBattlerTarget < gBattlersCount; gBattlerTarget++)
    {
        if (gBattlerTarget == gBattlerAttacker)
            continue;
        if (!(gAbsentBattlerFlags & (1u << gBattlerTarget))) // A valid target was found.
            break;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static bool32 SetTargetToNextPursuiter(u32 battlerDef)
{
    u32 i;
    for (i = gCurrentTurnActionNumber + 1; i < gBattlersCount; i++)
    {
        u32 battler = gBattlerByTurnOrder[i];
        if (gChosenActionByBattler[battler] == B_ACTION_USE_MOVE
        && GetMoveEffect(gChosenMoveByBattler[battler]) == EFFECT_PURSUIT
        && IsBattlerAlive(battlerDef)
        && IsBattlerAlive(battler)
        && !IsBattlerAlly(battler, battlerDef)
        && (B_PURSUIT_TARGET >= GEN_4 || gBattleStruct->moveTarget[battler] == battlerDef)
        && !IsGimmickSelected(battler, GIMMICK_Z_MOVE)
        && !IsGimmickSelected(battler, GIMMICK_DYNAMAX)
        && GetActiveGimmick(battler) != GIMMICK_DYNAMAX)
        {
            gBattlerTarget = battler;
            return TRUE;
        }
    }
    return FALSE;
}

static void Cmd_jumpifnopursuitswitchdmg(void)
{
    CMD_ARGS(const u8 *jumpInstr);

    u32 savedTarget = gBattlerTarget;

    if (SetTargetToNextPursuiter(gBattlerAttacker))
    {
        ChangeOrderTargetAfterAttacker();
        gBattleStruct->battlerState[gBattlerAttacker].pursuitTarget = TRUE;
        gBattleStruct->pursuitStoredSwitch = gBattleStruct->monToSwitchIntoId[gBattlerAttacker];
        gBattleStruct->moveTarget[gBattlerTarget] = gBattlerAttacker;
        gBattlerTarget = savedTarget;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->jumpInstr;
    }
}

static void Cmd_tryrestorehpberry(void)
{
    CMD_ARGS();
    if (TryRestoreHPBerries(gBattlerAttacker, ITEMEFFECT_TRY_HEALING))
        return;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

// Belly Drum, Fillet Away
static void Cmd_halvehp(void)
{
    CMD_ARGS(const u8 *failInstr);

    u32 halfHp = GetNonDynamaxMaxHP(gBattlerAttacker) / 2;

    if (!(GetNonDynamaxMaxHP(gBattlerAttacker) / 2))
        halfHp = 1;

    if (gBattleMons[gBattlerAttacker].hp > halfHp)
    {
        gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerAttacker) / 2;
        if (gBattleStruct->moveDamage[gBattlerAttacker] == 0)
            gBattleStruct->moveDamage[gBattlerAttacker] = 1;

        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

// Psych Up
static void Cmd_copyfoestats(void)
{
    CMD_ARGS(const u8 *unused);

    s32 i;

    for (i = 0; i < NUM_BATTLE_STATS; i++)
    {
        gBattleMons[gBattlerAttacker].statStages[i] = gBattleMons[gBattlerTarget].statStages[i];
    }

    gBattlescriptCurrInstr = cmd->nextInstr; // Has an unused jump ptr(possibly for a failed attempt) parameter.
}

static void Cmd_rapidspinfree(void)
{
    CMD_ARGS();

    u8 atkSide = GetBattlerSide(gBattlerAttacker);

    if (gBattleMons[gBattlerAttacker].status2 & STATUS2_WRAPPED)
    {
        gBattleScripting.battler = gBattlerTarget;
        gBattleMons[gBattlerAttacker].status2 &= ~STATUS2_WRAPPED;
        gBattlerTarget = gBattleStruct->wrappedBy[gBattlerAttacker];
        PREPARE_MOVE_BUFFER(gBattleTextBuff1, gBattleStruct->wrappedMove[gBattlerAttacker]);
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
    else if (gSideStatuses[atkSide] & SIDE_STATUS_SPIKES)
    {
        gSideStatuses[atkSide] &= ~SIDE_STATUS_SPIKES;
        gSideTimers[atkSide].spikesAmount = 0;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_SpikesFree;
    }
    else if (gSideStatuses[atkSide] & SIDE_STATUS_TOXIC_SPIKES)
    {
        gSideStatuses[atkSide] &= ~SIDE_STATUS_TOXIC_SPIKES;
        gSideTimers[atkSide].toxicSpikesAmount = 0;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_ToxicSpikesFree;
    }
    else if (gSideStatuses[atkSide] & SIDE_STATUS_STICKY_WEB)
    {
        gSideStatuses[atkSide] &= ~SIDE_STATUS_STICKY_WEB;
        gSideTimers[atkSide].stickyWebAmount = 0;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_StickyWebFree;
    }
    else if (gSideStatuses[atkSide] & SIDE_STATUS_STEALTH_ROCK)
    {
        gSideStatuses[atkSide] &= ~SIDE_STATUS_STEALTH_ROCK;
        gSideTimers[atkSide].stealthRockAmount = 0;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_StealthRockFree;
    }
    else if (gSideStatuses[atkSide] & SIDE_STATUS_STEELSURGE)
    {
        gSideStatuses[atkSide] &= ~SIDE_STATUS_STEELSURGE;
        gSideTimers[atkSide].steelsurgeAmount = 0;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_SteelsurgeFree;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_setdefensecurlbit(void)
{
    CMD_ARGS();

    gBattleMons[gBattlerAttacker].status2 |= STATUS2_DEFENSE_CURL;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_recoverbasedonsunlight(void)
{
    CMD_ARGS(const u8 *failInstr);

    gBattlerTarget = gBattlerAttacker;
    if (gBattleMons[gBattlerAttacker].hp != gBattleMons[gBattlerAttacker].maxHP)
    {
        if (GetMoveEffect(gCurrentMove) == EFFECT_SHORE_UP)
        {
            if (HasWeatherEffect() && gBattleWeather & B_WEATHER_SANDSTORM)
                gBattleStruct->moveDamage[gBattlerAttacker] = 20 * GetNonDynamaxMaxHP(gBattlerAttacker) / 30;
            else
                gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerAttacker) / 2;
        }
        else
        {
            if (!(gBattleWeather & B_WEATHER_ANY) || !HasWeatherEffect() || GetBattlerHoldEffect(gBattlerAttacker, TRUE) == HOLD_EFFECT_UTILITY_UMBRELLA)
                gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerAttacker) / 2;
            else if (gBattleWeather & B_WEATHER_SUN)
                gBattleStruct->moveDamage[gBattlerAttacker] = 20 * GetNonDynamaxMaxHP(gBattlerAttacker) / 30;
            else // not sunny weather
                gBattleStruct->moveDamage[gBattlerAttacker] = GetNonDynamaxMaxHP(gBattlerAttacker) / 4;
        }

        if (gBattleStruct->moveDamage[gBattlerAttacker] == 0)
            gBattleStruct->moveDamage[gBattlerAttacker] = 1;
        gBattleStruct->moveDamage[gBattlerAttacker] *= -1;

        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

static void Cmd_setstickyweb(void)
{
    CMD_ARGS(const u8 *failInstr);

    u8 targetSide = GetBattlerSide(gBattlerTarget);

    if (gSideStatuses[targetSide] & SIDE_STATUS_STICKY_WEB)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gSideStatuses[targetSide] |= SIDE_STATUS_STICKY_WEB;
        gSideTimers[targetSide].stickyWebBattlerId = gBattlerAttacker; // For Mirror Armor
        gSideTimers[targetSide].stickyWebBattlerSide = GetBattlerSide(gBattlerAttacker); // For Court Change/Defiant - set this to the user's side
        gSideTimers[targetSide].stickyWebAmount = 1;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_selectfirstvalidtarget(void)
{
    CMD_ARGS();

    for (gBattlerTarget = 0; gBattlerTarget < gBattlersCount; gBattlerTarget++)
    {
        if (gBattlerTarget == gBattlerAttacker && !(GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove) & MOVE_TARGET_USER))
            continue;
        if (IsBattlerAlive(gBattlerTarget))
            break;
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_trysetfutureattack(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gWishFutureKnock.futureSightCounter[gBattlerTarget] > gBattleTurnCounter)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gSideStatuses[GetBattlerSide(gBattlerTarget)] |= SIDE_STATUS_FUTUREATTACK;
        gWishFutureKnock.futureSightMove[gBattlerTarget] = gCurrentMove;
        gWishFutureKnock.futureSightBattlerIndex[gBattlerTarget] = gBattlerAttacker;
        gWishFutureKnock.futureSightPartyIndex[gBattlerTarget] = gBattlerPartyIndexes[gBattlerAttacker];
        gWishFutureKnock.futureSightCounter[gBattlerTarget] = gBattleTurnCounter + 3;

        if (gCurrentMove == MOVE_DOOM_DESIRE)
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_DOOM_DESIRE;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_FUTURE_SIGHT;

        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_trydobeatup(void)
{
#if B_BEAT_UP >= GEN_5
    CMD_ARGS();

    gBattleStruct->beatUpSlot++;
    gBattlescriptCurrInstr = cmd->nextInstr;
#else
    CMD_ARGS(const u8 *endInstr, const u8 *failInstr);
    struct Pokemon *party = GetBattlerParty(gBattlerAttacker);

    if (!IsBattlerAlive(gBattlerTarget))
    {
        gBattlescriptCurrInstr = cmd->endInstr;
    }
    else
    {
        u8 beforeLoop = gBattleCommunication[0];
        for (;gBattleCommunication[0] < PARTY_SIZE; gBattleCommunication[0]++)
        {
            if (GetMonData(&party[gBattleCommunication[0]], MON_DATA_HP)
                && GetMonData(&party[gBattleCommunication[0]], MON_DATA_SPECIES_OR_EGG) != SPECIES_NONE
                && GetMonData(&party[gBattleCommunication[0]], MON_DATA_SPECIES_OR_EGG) != SPECIES_EGG
                && !GetMonData(&party[gBattleCommunication[0]], MON_DATA_STATUS))
                break;
        }

        if (gBattleCommunication[0] < PARTY_SIZE)
        {
            PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, gBattlerAttacker, gBattleCommunication[0])

            gBattlescriptCurrInstr = cmd->nextInstr;

            gBattleStruct->moveDamage[gBattlerTarget] = gSpeciesInfo[GetMonData(&party[gBattleCommunication[0]], MON_DATA_SPECIES)].baseAttack;
            gBattleStruct->moveDamage[gBattlerTarget] *= GetMovePower(gCurrentMove);
            gBattleStruct->moveDamage[gBattlerTarget] *= (GetMonData(&party[gBattleCommunication[0]], MON_DATA_LEVEL) * 2 / 5 + 2);
            gBattleStruct->moveDamage[gBattlerTarget] /= gSpeciesInfo[gBattleMons[gBattlerTarget].species].baseDefense;
            gBattleStruct->moveDamage[gBattlerTarget] = (gBattleStruct->moveDamage[gBattlerTarget] / 50) + 2;
            if (gProtectStructs[gBattlerAttacker].helpingHand)
                gBattleStruct->moveDamage[gBattlerTarget] = gBattleStruct->moveDamage[gBattlerTarget] * 15 / 10;

            gBattleCommunication[0]++;
        }
        else if (beforeLoop != 0)
        {
            gBattlescriptCurrInstr = cmd->endInstr;
        }
        else
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
    }
#endif
}

static void Cmd_setsemiinvulnerablebit(void)
{
    CMD_ARGS(bool8 clear);

    if (gBattleMoveEffects[GetMoveEffect(gCurrentMove)].semiInvulnerableEffect == TRUE)
    {
        u32 semiInvulnerableEffect = GetMoveTwoTurnAttackStatus(gCurrentMove);
        if (cmd->clear)
            gStatuses3[gBattlerAttacker] &= ~semiInvulnerableEffect;
        else
            gStatuses3[gBattlerAttacker] |= semiInvulnerableEffect;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static bool32 CheckIfCanFireTwoTurnMoveNow(u8 battler, bool8 checkChargeTurnEffects)
{
    // Semi-invulnerable moves cannot skip their charge turn (except with Power Herb)
    if (gBattleMoveEffects[GetMoveEffect(gCurrentMove)].semiInvulnerableEffect == TRUE)
        return FALSE;

    // If this move has charge turn effects, it must charge, activate them, then try to fire
    if (checkChargeTurnEffects && MoveHasChargeTurnAdditionalEffect(gCurrentMove))
        return FALSE;

    // Insert custom conditions here

    // Certain two-turn moves may fire on the first turn in the right weather (Solar Beam, Electro Shot)
    // By default, all two-turn moves have the option of adding weather to their argument
    if (IsBattlerWeatherAffected(battler, GetMoveTwoTurnAttackWeather(gCurrentMove)))
        return TRUE;

    return FALSE;
}

static void Cmd_tryfiretwoturnmovenowbyeffect(void)
{
    CMD_ARGS(u8 battler, bool8 checkChargeTurnEffects, const u8 *jumpInstr);

    if (CheckIfCanFireTwoTurnMoveNow(cmd->battler, cmd->checkChargeTurnEffects) == TRUE)
    {
        gBattleScripting.animTurn = 1;
        gBattlescriptCurrInstr = cmd->jumpInstr;
    }
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_setminimize(void)
{
    CMD_ARGS();

    if (gHitMarker & HITMARKER_OBEYS)
        gStatuses3[gBattlerAttacker] |= STATUS3_MINIMIZED;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_unused_c8(void)
{
}

static void Cmd_trymemento(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (B_MEMENTO_FAIL >= GEN_4
      && (gBattleCommunication[MISS_TYPE] == B_MSG_PROTECTED
        || gStatuses3[gBattlerTarget] & STATUS3_SEMI_INVULNERABLE
        || IsBattlerProtected(gBattlerAttacker, gBattlerTarget, gCurrentMove)
        || DoesSubstituteBlockMove(gBattlerAttacker, gBattlerTarget, gCurrentMove)))
    {
        // Failed, target was protected.
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (B_MEMENTO_FAIL < GEN_4
        && gBattleMons[gBattlerTarget].statStages[STAT_ATK] == MIN_STAT_STAGE
        && gBattleMons[gBattlerTarget].statStages[STAT_SPATK] == MIN_STAT_STAGE
        && gBattleCommunication[MISS_TYPE] != B_MSG_PROTECTED)
    {
        // Failed, unprotected target already has minimum Attack and Special Attack.
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        // Success, drop user's HP bar to 0
        gBattleStruct->moveDamage[gBattlerAttacker] = gBattleMons[gBattlerAttacker].hp;
        BtlController_EmitHealthBarUpdate(gBattlerAttacker, B_COMM_TO_CONTROLLER, INSTANT_HP_BAR_DROP);
        MarkBattlerForControllerExec(gBattlerAttacker);
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

// Follow Me
static void Cmd_setforcedtarget(void)
{
    CMD_ARGS();

    gSideTimers[GetBattlerSide(gBattlerTarget)].followmeTimer = 1;
    gSideTimers[GetBattlerSide(gBattlerTarget)].followmeTarget = gBattlerTarget;
    gSideTimers[GetBattlerSide(gBattlerTarget)].followmePowder = IsPowderMove(gCurrentMove);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_setcharge(void)
{
    CMD_ARGS(u8 battler);

    u8 battler = GetBattlerForBattleScript(cmd->battler);
    gStatuses3[battler] |= STATUS3_CHARGED_UP;
    if (B_CHARGE < GEN_9)
        gDisableStructs[battler].chargeTimer = 2;
    else
        gDisableStructs[battler].chargeTimer = 0;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

// Nature Power
static void Cmd_callenvironmentattack(void)
{
    CMD_ARGS();

    gHitMarker &= ~HITMARKER_ATTACKSTRING_PRINTED;
    gCurrentMove = GetNaturePowerMove(gBattlerAttacker);
    gBattlerTarget = GetBattleMoveTarget(gCurrentMove, NO_TARGET_OVERRIDE);
    BattleScriptPush(GetMoveBattleScript(gCurrentMove));
    gBattlescriptCurrInstr = cmd->nextInstr;
}

u32 GetNaturePowerMove(u32 battler)
{
    u32 move = gBattleEnvironmentInfo[gBattleEnvironment].naturePower;
    if (gFieldStatuses & STATUS_FIELD_MISTY_TERRAIN)
        move = MOVE_MOONBLAST;
    else if (gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN)
        move = MOVE_THUNDERBOLT;
    else if (gFieldStatuses & STATUS_FIELD_GRASSY_TERRAIN)
        move = MOVE_ENERGY_BALL;
    else if (gFieldStatuses & STATUS_FIELD_PSYCHIC_TERRAIN)
        move = MOVE_PSYCHIC;
    else if (gBattleEnvironmentInfo[gBattleEnvironment].naturePower == MOVE_NONE)
        move = MOVE_TRI_ATTACK;

    if (GetActiveGimmick(battler) == GIMMICK_Z_MOVE)
    {
        gBattleStruct->zmove.baseMoves[gBattlerAttacker] = move;
        move = GetTypeBasedZMove(move);
    }

    return move;
}

static void Cmd_curestatuswithmove(void)
{
    CMD_ARGS(const u8 *failInstr);
    u32 shouldHeal;

    if (GetMoveEffect(gCurrentMove) == EFFECT_REFRESH)
        shouldHeal = gBattleMons[gBattlerAttacker].status1 & STATUS1_REFRESH;
    else // Take Heart
        shouldHeal = gBattleMons[gBattlerAttacker].status1 & STATUS1_ANY;

    if (shouldHeal)
    {
        if (gBattleMons[gBattlerAttacker].status1 & STATUS1_SLEEP)
            TryDeactivateSleepClause(GetBattlerSide(gBattlerAttacker), gBattlerPartyIndexes[gBattlerAttacker]);

        gBattleMons[gBattlerAttacker].status1 = 0;
        gBattlescriptCurrInstr = cmd->nextInstr;
        BtlController_EmitSetMonData(gBattlerAttacker, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[gBattlerAttacker].status1), &gBattleMons[gBattlerAttacker].status1);
        MarkBattlerForControllerExec(gBattlerAttacker);
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

static void Cmd_settorment(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gBattleMons[gBattlerTarget].status2 & STATUS2_TORMENT
        || (GetActiveGimmick(gBattlerTarget) == GIMMICK_DYNAMAX))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gBattleMons[gBattlerTarget].status2 |= STATUS2_TORMENT;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_jumpifnodamage(void)
{
    CMD_ARGS(const u8 *jumpInstr);

    if (gProtectStructs[gBattlerAttacker].physicalDmg || gProtectStructs[gBattlerAttacker].specialDmg)
        gBattlescriptCurrInstr = cmd->nextInstr;
    else
        gBattlescriptCurrInstr = cmd->jumpInstr;
}

static void Cmd_settaunt(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (B_OBLIVIOUS_TAUNT >= GEN_6 && GetBattlerAbility(gBattlerTarget) == ABILITY_OBLIVIOUS)
    {
        gBattlescriptCurrInstr = BattleScript_NotAffectedAbilityPopUp;
        gLastUsedAbility = ABILITY_OBLIVIOUS;
        RecordAbilityBattle(gBattlerTarget, ABILITY_OBLIVIOUS);
    }
    else if (gDisableStructs[gBattlerTarget].tauntTimer == 0)
    {
        u8 turns;
        if (B_TAUNT_TURNS >= GEN_5)
        {
            turns = 4;
            if (GetBattlerTurnOrderNum(gBattlerTarget) > GetBattlerTurnOrderNum(gBattlerAttacker))
                turns--; // If the target hasn't yet moved this turn, Taunt lasts for only three turns (source: Bulbapedia)
        }
        else if (B_TAUNT_TURNS >= GEN_4)
        {
            turns = (Random() & 2) + 3;
        }
        else
        {
            turns = 2;
        }

        gDisableStructs[gBattlerTarget].tauntTimer = turns;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

static void Cmd_trysethelpinghand(void)
{
    CMD_ARGS(const u8 *failInstr);

    gBattlerTarget = GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerPosition(gBattlerAttacker)));

    if (IsDoubleBattle()
        && !(gAbsentBattlerFlags & (1u << gBattlerTarget))
        && !gProtectStructs[gBattlerAttacker].helpingHand
        && !gProtectStructs[gBattlerTarget].helpingHand)
    {
        gProtectStructs[gBattlerTarget].helpingHand = TRUE;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

// Trick
static void Cmd_tryswapitems(void)
{
    CMD_ARGS(const u8 *failInstr);

    // opponent can't swap items with player in regular battles
    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER_HILL
        || (!IsOnPlayerSide(gBattlerAttacker)
            && !(gBattleTypeFlags & (BATTLE_TYPE_LINK
                                  | BATTLE_TYPE_EREADER_TRAINER
                                  | BATTLE_TYPE_FRONTIER
                                  | BATTLE_TYPE_SECRET_BASE
                                  | BATTLE_TYPE_RECORDED_LINK
                                  | (B_TRAINERS_KNOCK_OFF_ITEMS == TRUE ? BATTLE_TYPE_TRAINER : 0)
                                  ))))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        u8 sideAttacker = GetBattlerSide(gBattlerAttacker);
        u8 sideTarget = GetBattlerSide(gBattlerTarget);

        // You can't swap items if they were knocked off in regular battles
        if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK
                             | BATTLE_TYPE_EREADER_TRAINER
                             | BATTLE_TYPE_FRONTIER
                             | BATTLE_TYPE_SECRET_BASE
                             | BATTLE_TYPE_RECORDED_LINK))
            && (gWishFutureKnock.knockedOffMons[sideAttacker] & (1u << gBattlerPartyIndexes[gBattlerAttacker])
                || gWishFutureKnock.knockedOffMons[sideTarget] & (1u << gBattlerPartyIndexes[gBattlerTarget])))
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        // can't swap if two Pokémon don't have an item
        // or if either of them is an enigma berry or a mail
        else if ((gBattleMons[gBattlerAttacker].item == ITEM_NONE && gBattleMons[gBattlerTarget].item == ITEM_NONE)
                 || !CanBattlerGetOrLoseItem(gBattlerAttacker, gBattleMons[gBattlerAttacker].item)
                 || !CanBattlerGetOrLoseItem(gBattlerAttacker, gBattleMons[gBattlerTarget].item)
                 || !CanBattlerGetOrLoseItem(gBattlerTarget, gBattleMons[gBattlerTarget].item)
                 || !CanBattlerGetOrLoseItem(gBattlerTarget, gBattleMons[gBattlerAttacker].item))
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        // check if ability prevents swapping
        else if (GetBattlerAbility(gBattlerTarget) == ABILITY_STICKY_HOLD)
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

            RecordItemEffectBattle(gBattlerAttacker, 0);
            RecordItemEffectBattle(gBattlerTarget, GetItemHoldEffect(oldItemAtk));

            BtlController_EmitSetMonData(gBattlerAttacker, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(*newItemAtk), newItemAtk);
            MarkBattlerForControllerExec(gBattlerAttacker);

            BtlController_EmitSetMonData(gBattlerTarget, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[gBattlerTarget].item), &gBattleMons[gBattlerTarget].item);
            MarkBattlerForControllerExec(gBattlerTarget);

            gBattleStruct->choicedMove[gBattlerTarget] = MOVE_NONE;
            gBattleStruct->choicedMove[gBattlerAttacker] = MOVE_NONE;

            gBattlescriptCurrInstr = cmd->nextInstr;

            PREPARE_ITEM_BUFFER(gBattleTextBuff1, *newItemAtk)
            PREPARE_ITEM_BUFFER(gBattleTextBuff2, oldItemAtk)

            if (!(sideAttacker == sideTarget && IsPartnerMonFromSameTrainer(gBattlerAttacker)))
            {
                // if targeting your own side and you aren't in a multi battle, don't save items as stolen
                if (IsOnPlayerSide(gBattlerAttacker))
                    TrySaveExchangedItem(gBattlerAttacker, oldItemAtk);
                if (IsOnPlayerSide(gBattlerTarget))
                    TrySaveExchangedItem(gBattlerTarget, *newItemAtk);
            }

            if (oldItemAtk != ITEM_NONE && *newItemAtk != ITEM_NONE)
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ITEM_SWAP_BOTH;  // attacker's item -> <- target's item
            }
            else if (oldItemAtk == ITEM_NONE && *newItemAtk != ITEM_NONE)
            {
                if (GetBattlerAbility(gBattlerAttacker) == ABILITY_UNBURDEN && gDisableStructs[gBattlerAttacker].unburdenActive)
                    gDisableStructs[gBattlerAttacker].unburdenActive = FALSE;

                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ITEM_SWAP_TAKEN; // nothing -> <- target's item
            }
            else
            {
                CheckSetUnburden(gBattlerAttacker);
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ITEM_SWAP_GIVEN; // attacker's item -> <- nothing
            }
        }
    }
}

// Role Play, Doodle
static void Cmd_trycopyability(void)
{
    CMD_ARGS(u8 battler, const u8 *failInstr);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    u16 defAbility = gBattleMons[gBattlerTarget].ability;

    if (gBattleMons[battler].ability == defAbility
      || defAbility == ABILITY_NONE
      || gAbilitiesInfo[gBattleMons[battler].ability].cantBeSuppressed
      || (IsBattlerAlive(BATTLE_PARTNER(battler)) && gAbilitiesInfo[gBattleMons[BATTLE_PARTNER(battler)].ability].cantBeSuppressed && GetMoveEffect(gCurrentMove) == EFFECT_DOODLE)
      || gAbilitiesInfo[defAbility].cantBeCopied)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gBattleScripting.abilityPopupOverwrite = gBattleMons[battler].ability;
        gBattleMons[battler].ability = gDisableStructs[battler].overwrittenAbility = defAbility;
        gLastUsedAbility = defAbility;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_trywish(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gStatuses3[gBattlerTarget] & STATUS3_HEAL_BLOCK)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (gWishFutureKnock.wishCounter[gBattlerAttacker] <= gBattleTurnCounter)
    {
        gWishFutureKnock.wishCounter[gBattlerAttacker] = gBattleTurnCounter + 2;
        gWishFutureKnock.wishPartyId[gBattlerAttacker] = gBattlerPartyIndexes[gBattlerAttacker];
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

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
    CMD_ARGS(const u8 *failInstr);

    if (gStatuses3[gBattlerTarget] & STATUS3_YAWN
        || gBattleMons[gBattlerTarget].status1 & STATUS1_ANY)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (IsBattlerTerrainAffected(gBattlerTarget, STATUS_FIELD_ELECTRIC_TERRAIN))
    {
        // When Yawn is used while Electric Terrain is set and drowsiness is set from Yawn being used against target in the previous turn:
        // "But it failed" will display first.
        gBattlescriptCurrInstr = BattleScript_ElectricTerrainPrevents;
    }
    else if (IsBattlerTerrainAffected(gBattlerTarget, STATUS_FIELD_MISTY_TERRAIN))
    {
        // When Yawn is used while Misty Terrain is set and drowsiness is set from Yawn being used against target in the previous turn:
        // "But it failed" will display first.
        gBattlescriptCurrInstr = BattleScript_MistyTerrainPrevents;
    }
    else
    {
        gStatuses3[gBattlerTarget] |= STATUS3_YAWN_TURN(2);
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_setdamagetohealthdifference(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (GetNonDynamaxHP(gBattlerTarget) <= gBattleMons[gBattlerAttacker].hp)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gBattleStruct->moveDamage[gBattlerTarget] = GetNonDynamaxHP(gBattlerTarget) - gBattleMons[gBattlerAttacker].hp;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void HandleRoomMove(u32 statusFlag, u16 *timer, u8 stringId)
{
    if (gFieldStatuses & statusFlag)
    {
        gFieldStatuses &= ~statusFlag;
        gBattleCommunication[MULTISTRING_CHOOSER] = stringId + 1;
    }
    else
    {
        gFieldStatuses |= statusFlag;
        *timer = gBattleTurnCounter + 5;
        gBattleCommunication[MULTISTRING_CHOOSER] = stringId;
    }
}

static void Cmd_setroom(void)
{
    CMD_ARGS();

    switch (GetMoveEffect(gCurrentMove))
    {
    case EFFECT_TRICK_ROOM:
        HandleRoomMove(STATUS_FIELD_TRICK_ROOM, &gFieldTimers.trickRoomTimer, 0);
        break;
    case EFFECT_WONDER_ROOM:
        HandleRoomMove(STATUS_FIELD_WONDER_ROOM, &gFieldTimers.wonderRoomTimer, 2);
        break;
    case EFFECT_MAGIC_ROOM:
        HandleRoomMove(STATUS_FIELD_MAGIC_ROOM, &gFieldTimers.magicRoomTimer, 4);
        break;
    default:
        gBattleCommunication[MULTISTRING_CHOOSER] = 6;
        break;
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

// Skill Swap
static void Cmd_tryswapabilities(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gAbilitiesInfo[gBattleMons[gBattlerAttacker].ability].cantBeSwapped
      || gAbilitiesInfo[gBattleMons[gBattlerTarget].ability].cantBeSwapped)
    {
        RecordAbilityBattle(gBattlerTarget, gBattleMons[gBattlerTarget].ability);
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (GetBattlerHoldEffect(gBattlerTarget, TRUE) == HOLD_EFFECT_ABILITY_SHIELD)
    {
        RecordItemEffectBattle(gBattlerTarget, HOLD_EFFECT_ABILITY_SHIELD);
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        if (gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT || (GetActiveGimmick(gBattlerTarget) == GIMMICK_DYNAMAX))
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            if (!IsBattlerAlly(gBattlerAttacker, gBattlerTarget))
                gBattleScripting.abilityPopupOverwrite = gBattleMons[gBattlerAttacker].ability;
            gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
            gBattleMons[gBattlerTarget].ability = gDisableStructs[gBattlerTarget].overwrittenAbility = gBattleMons[gBattlerAttacker].ability;
            gBattleMons[gBattlerAttacker].ability = gDisableStructs[gBattlerAttacker].overwrittenAbility = gLastUsedAbility;

            gBattlescriptCurrInstr = cmd->nextInstr;
        }
    }
}

static void Cmd_tryimprison(void)
{
    CMD_ARGS(const u8 *failInstr);

    if ((gStatuses3[gBattlerAttacker] & STATUS3_IMPRISONED_OTHERS))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (B_IMPRISON >= GEN_5)
    {
        gStatuses3[gBattlerAttacker] |= STATUS3_IMPRISONED_OTHERS;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        u8 battler;

        for (battler = 0; battler < gBattlersCount; battler++)
        {
            if (!IsBattlerAlly(gBattlerAttacker, battler))
            {
                s32 attackerMoveId;
                for (attackerMoveId = 0; attackerMoveId < MAX_MON_MOVES; attackerMoveId++)
                {
                    s32 i;
                    for (i = 0; i < MAX_MON_MOVES; i++)
                    {
                        if (gBattleMons[gBattlerAttacker].moves[attackerMoveId] == gBattleMons[battler].moves[i]
                            && gBattleMons[gBattlerAttacker].moves[attackerMoveId] != MOVE_NONE)
                            break;
                    }
                    if (i != MAX_MON_MOVES)
                        break;
                }
                if (attackerMoveId != MAX_MON_MOVES)
                {
                    gStatuses3[gBattlerAttacker] |= STATUS3_IMPRISONED_OTHERS;
                    gBattlescriptCurrInstr = cmd->nextInstr;
                    break;
                }
            }
        }
        if (battler == gBattlersCount) // In Generation 3 games, Imprison fails if the user doesn't share any moves with any of the foes.
            gBattlescriptCurrInstr = cmd->failInstr;
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

static void Cmd_setuserstatus3(void)
{
    CMD_ARGS(u32 flags, const u8 *failInstr);

    u32 flags = cmd->flags;

    if (gStatuses3[gBattlerAttacker] & flags)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gStatuses3[gBattlerAttacker] |= flags;
        if (flags & STATUS3_MAGNET_RISE)
            gDisableStructs[gBattlerAttacker].magnetRiseTimer = gBattleTurnCounter + 5;
        if (flags & STATUS3_LASER_FOCUS)
            gDisableStructs[gBattlerAttacker].laserFocusTimer = gBattleTurnCounter + 2;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_assistattackselect(void)
{
    CMD_ARGS(const u8 *failInstr);

    s32 chooseableMovesNo = 0;
    struct Pokemon *party;
    s32 monId, moveId;
    u16 *validMoves = Alloc(sizeof(u16) * PARTY_SIZE * MAX_MON_MOVES);

    if (validMoves != NULL)
    {
        party = GetBattlerParty(gBattlerAttacker);

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
                u16 move = GetMonData(&party[monId], MON_DATA_MOVE1 + moveId);

                if (IsMoveAssistBanned(move))
                    continue;

                validMoves[chooseableMovesNo++] = move;
            }
        }
    }

    if (chooseableMovesNo)
    {
        gHitMarker &= ~HITMARKER_ATTACKSTRING_PRINTED;
        gCalledMove = validMoves[Random() % chooseableMovesNo];
        gBattlerTarget = GetBattleMoveTarget(gCalledMove, NO_TARGET_OVERRIDE);
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }

    TRY_FREE_AND_SET_NULL(validMoves);
}

static void Cmd_trysetmagiccoat(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gCurrentTurnActionNumber == gBattlersCount - 1) // moves last turn
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gProtectStructs[gBattlerAttacker].bounceMove = TRUE;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

// Snatch
static void Cmd_trysetsnatch(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gCurrentTurnActionNumber == gBattlersCount - 1) // moves last turn
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gProtectStructs[gBattlerAttacker].stealMove = TRUE;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_unused2(void)
{
}

static void Cmd_switchoutabilities(void)
{
    CMD_ARGS(u8 battler);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    if (gBattleMons[battler].ability == ABILITY_NEUTRALIZING_GAS)
    {
        gBattleMons[battler].ability = ABILITY_NONE;
        BattleScriptPush(gBattlescriptCurrInstr);
        gBattlescriptCurrInstr = BattleScript_NeutralizingGasExits;
    }
    else
    {
        switch (GetBattlerAbility(battler))
        {
        case ABILITY_NATURAL_CURE:
            if (gBattleMons[battler].status1 & STATUS1_SLEEP)
                TryDeactivateSleepClause(GetBattlerSide(battler), gBattlerPartyIndexes[battler]);

            gBattleMons[battler].status1 = 0;
            BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE,
                                         1u << gBattleStruct->battlerPartyIndexes[battler],
                                         sizeof(gBattleMons[battler].status1),
                                         &gBattleMons[battler].status1);
            MarkBattlerForControllerExec(battler);
            break;
        case ABILITY_REGENERATOR:
        {
            u32 regenerate = GetNonDynamaxMaxHP(battler) / 3;
            regenerate += gBattleMons[battler].hp;
            if (regenerate > gBattleMons[battler].maxHP)
                regenerate = gBattleMons[battler].maxHP;
            BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_HP_BATTLE,
                                         1u << gBattleStruct->battlerPartyIndexes[battler],
                                         sizeof(regenerate),
                                         &regenerate);
            MarkBattlerForControllerExec(battler);
            break;
        }
        }

        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_jumpifhasnohp(void)
{
    CMD_ARGS(u8 battler, const u8 *jumpInstr);

    u32 battler = GetBattlerForBattleScript(cmd->battler);

    if (!IsBattlerAlive(battler))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_jumpifnotcurrentmoveargtype(void)
{
    CMD_ARGS(u8 battler, const u8 *failInstr);

    u8 battler = GetBattlerForBattleScript(cmd->battler);
    const u8 *failInstr = cmd->failInstr;
    u32 type = GetMoveArgType(gCurrentMove);

    if (!IS_BATTLER_OF_TYPE(battler, type))
        gBattlescriptCurrInstr = failInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_pickup(void)
{
    CMD_ARGS();

    u32 i, j;
    u16 species, heldItem, ability;
    u8 lvlDivBy10;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG);
        heldItem = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
        lvlDivBy10 = (GetMonData(&gPlayerParty[i], MON_DATA_LEVEL)-1) / 10; //Moving this here makes it easier to add in abilities like Honey Gather.
        if (lvlDivBy10 > 9)
            lvlDivBy10 = 9;

        ability = gSpeciesInfo[species].abilities[GetMonData(&gPlayerParty[i], MON_DATA_ABILITY_NUM)];

        if (ability == ABILITY_PICKUP
            && species != SPECIES_NONE
            && species != SPECIES_EGG
            && heldItem == ITEM_NONE
            && (Random() % 10) == 0)
        {
            u32 rand = Random() % 100;
            u32 percentTotal = 0;

            for (j = 0; j < ARRAY_COUNT(sPickupTable); j++)
            {
                percentTotal += sPickupTable[j].percentage[lvlDivBy10];
                if (rand < percentTotal)
                {
                    SetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM, &sPickupTable[j].itemId);
                    break;
                }
            }
        }
        else if (ability == ABILITY_HONEY_GATHER
            && species != 0
            && species != SPECIES_EGG
            && heldItem == ITEM_NONE)
        {
            if ((lvlDivBy10 + 1 ) * 5 > Random() % 100)
            {
                heldItem = ITEM_HONEY;
                SetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM, &heldItem);
            }
        }
        else if (P_SHUCKLE_BERRY_JUICE == GEN_2
            && species == SPECIES_SHUCKLE
            && heldItem == ITEM_ORAN_BERRY
            && (Random() % 16) == 0)
        {
            heldItem = ITEM_BERRY_JUICE;
            SetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM, &heldItem);
        }
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_unused_0xE6(void)
{
}

static void Cmd_unused_0xE7(void)
{
}

// Water and Mud Sport
static void Cmd_settypebasedhalvers(void)
{
    CMD_ARGS(const u8 *failInstr);

    bool8 worked = FALSE;

    if (GetMoveEffect(gCurrentMove) == EFFECT_MUD_SPORT)
    {
        if (B_SPORT_TURNS >= GEN_6)
        {
            if (!(gFieldStatuses & STATUS_FIELD_MUDSPORT))
            {
                gFieldStatuses |= STATUS_FIELD_MUDSPORT;
                gFieldTimers.mudSportTimer = gBattleTurnCounter + 5;
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEAKEN_ELECTRIC;
                worked = TRUE;
            }
        }
        else
        {
            if (!(gStatuses4[gBattlerAttacker] & STATUS4_MUD_SPORT))
            {
                gStatuses4[gBattlerAttacker] |= STATUS4_MUD_SPORT;
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEAKEN_ELECTRIC;
                worked = TRUE;
            }
        }
    }
    else // Water Sport
    {
        if (B_SPORT_TURNS >= GEN_6)
        {
            if (!(gFieldStatuses & STATUS_FIELD_WATERSPORT))
            {
                gFieldStatuses |= STATUS_FIELD_WATERSPORT;
                gFieldTimers.waterSportTimer = gBattleTurnCounter + 5;
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEAKEN_FIRE;
                worked = TRUE;
            }
        }
        else
        {
            if (!(gStatuses4[gBattlerAttacker] & STATUS4_WATER_SPORT))
            {
                gStatuses4[gBattlerAttacker] |= STATUS4_WATER_SPORT;
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEAKEN_FIRE;
                worked = TRUE;
            }
        }
    }

    if (worked)
        gBattlescriptCurrInstr = cmd->nextInstr;
    else
        gBattlescriptCurrInstr = cmd->failInstr;
}

bool32 DoesSubstituteBlockMove(u32 battlerAtk, u32 battlerDef, u32 move)
{
    if (!(gBattleMons[battlerDef].status2 & STATUS2_SUBSTITUTE))
        return FALSE;
    else if (MoveIgnoresSubstitute(move))
        return FALSE;
    else if (GetBattlerAbility(battlerAtk) == ABILITY_INFILTRATOR)
        return FALSE;
    else
        return TRUE;
}

bool32 DoesDisguiseBlockMove(u32 battler, u32 move)
{
    if (!(gBattleMons[battler].species == SPECIES_MIMIKYU_DISGUISED || gBattleMons[battler].species == SPECIES_MIMIKYU_TOTEM_DISGUISED)
        || gBattleMons[battler].status2 & STATUS2_TRANSFORMED
        || (!gProtectStructs[battler].confusionSelfDmg && (IsBattleMoveStatus(move) || gHitMarker & HITMARKER_PASSIVE_DAMAGE))
        || gHitMarker & HITMARKER_IGNORE_DISGUISE
        || GetBattlerAbility(battler) != ABILITY_DISGUISE)
        return FALSE;
    else
        return TRUE;
}

static void Cmd_jumpifsubstituteblocks(void)
{
    CMD_ARGS(const u8 *jumpInstr);

    if (DoesSubstituteBlockMove(gBattlerAttacker, gBattlerTarget, gCurrentMove))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_tryrecycleitem(void)
{
    CMD_ARGS(const u8 *failInstr);

    u16 *usedHeldItem;

    if (gCurrentMove == MOVE_NONE && GetBattlerAbility(gBattlerAttacker) == ABILITY_PICKUP)
        usedHeldItem = &gBattleStruct->usedHeldItems[gBattlerPartyIndexes[gBattlerTarget]][GetBattlerSide(gBattlerTarget)];
    else
        usedHeldItem = &gBattleStruct->usedHeldItems[gBattlerPartyIndexes[gBattlerAttacker]][GetBattlerSide(gBattlerAttacker)];
    if (*usedHeldItem != ITEM_NONE && gBattleMons[gBattlerAttacker].item == ITEM_NONE)
    {
        gLastUsedItem = *usedHeldItem;
        *usedHeldItem = ITEM_NONE;
        gBattleMons[gBattlerAttacker].item = gLastUsedItem;

        BtlController_EmitSetMonData(gBattlerAttacker, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[gBattlerAttacker].item), &gBattleMons[gBattlerAttacker].item);
        MarkBattlerForControllerExec(gBattlerAttacker);

        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

bool32 CanCamouflage(u8 battler)
{
    if (IS_BATTLER_OF_TYPE(battler, gBattleEnvironmentInfo[gBattleEnvironment].camouflageType))
        return FALSE;
    return TRUE;
}

static void Cmd_settypetoenvironment(void)
{
    CMD_ARGS(const u8 *failInstr);

    u8 environmentType;
    switch(gFieldStatuses & STATUS_FIELD_TERRAIN_ANY)
    {
    case STATUS_FIELD_ELECTRIC_TERRAIN:
        environmentType = TYPE_ELECTRIC;
        break;
    case STATUS_FIELD_GRASSY_TERRAIN:
        environmentType = TYPE_GRASS;
        break;
    case STATUS_FIELD_MISTY_TERRAIN:
        environmentType = TYPE_FAIRY;
        break;
    case STATUS_FIELD_PSYCHIC_TERRAIN:
        environmentType = TYPE_PSYCHIC;
        break;
    default:
        environmentType = gBattleEnvironmentInfo[gBattleEnvironment].camouflageType;
        break;
    }

    if (!IS_BATTLER_OF_TYPE(gBattlerAttacker, environmentType) && GetActiveGimmick(gBattlerAttacker) != GIMMICK_TERA)
    {
        SET_BATTLER_TYPE(gBattlerAttacker, environmentType);
        PREPARE_TYPE_BUFFER(gBattleTextBuff1, environmentType);

        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

// Unused
static void Cmd_pursuitdoubles(void)
{
    CMD_ARGS(const u8 *failInstr);

    u32 battler = GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerPosition(gBattlerAttacker)));

    if (IsDoubleBattle()
        && !(gAbsentBattlerFlags & (1u << battler))
        && gChosenActionByBattler[battler] == B_ACTION_USE_MOVE
        && GetMoveEffect(gChosenMoveByBattler[battler]) == EFFECT_PURSUIT)
    {
        gActionsByTurnOrder[battler] = B_ACTION_TRY_FINISH;
        gCurrentMove = gChosenMoveByBattler[battler];
        gBattlescriptCurrInstr = cmd->nextInstr;
        gBattleScripting.animTurn = 1;
        gBattleScripting.savedBattler = gBattlerAttacker;
        gBattlerAttacker = battler;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

static void Cmd_snatchsetbattlers(void)
{
    CMD_ARGS();

    gEffectBattler = gBattlerAttacker;

    if (gBattlerAttacker == gBattlerTarget)
        gBattlerAttacker = gBattlerTarget = gBattleScripting.battler;
    else
        gBattlerTarget = gBattleScripting.battler;

    gBattleScripting.battler = gEffectBattler;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_removescreens(void)
{
    CMD_ARGS();

    u8 side;
    bool32 failed;

    if (B_BRICK_BREAK >= GEN_4)
        side = GetBattlerSide(gBattlerTarget); // From Gen 4 onwards, Brick Break can remove screens on the user's side if used on an ally
    else
        side = GetBattlerSide(gBattlerAttacker) ^ BIT_SIDE;

    if (B_BRICK_BREAK >= GEN_5)
        failed = gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT;
    else
        failed = FALSE;

    if (!failed && gSideStatuses[side] & SIDE_STATUS_SCREEN_ANY)
    {
        gSideStatuses[side] &= ~SIDE_STATUS_SCREEN_ANY;
        gBattleScripting.animTurn = 1;
        gBattleScripting.animTargetsHit = 1;
    }
    else
    {
        gBattleScripting.animTurn = 0;
        gBattleScripting.animTargetsHit = 0;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
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
    CMD_ARGS();

    u16 ballMultiplier = 100;
    s8 ballAddition = 0;

    if (gBattleControllerExecFlags)
        return;

    gBattlerTarget = GetCatchingBattler();

    if (gBattleTypeFlags & BATTLE_TYPE_GHOST)
    {
        BtlController_EmitBallThrowAnim(gBattlerAttacker, B_COMM_TO_CONTROLLER, BALL_GHOST_DODGE);
        MarkBattlerForControllerExec(gBattlerAttacker);
        gBattlescriptCurrInstr = BattleScript_GhostBallDodge;
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
    {
        BtlController_EmitBallThrowAnim(gBattlerAttacker, B_COMM_TO_CONTROLLER, BALL_TRAINER_BLOCK);
        MarkBattlerForControllerExec(gBattlerAttacker);
        gBattlescriptCurrInstr = BattleScript_TrainerBallBlock;
    }
    else if (gBattleTypeFlags & (BATTLE_TYPE_POKEDUDE | BATTLE_TYPE_OLD_MAN_TUTORIAL))
    {
        BtlController_EmitBallThrowAnim(gBattlerAttacker, B_COMM_TO_CONTROLLER, BALL_3_SHAKES_SUCCESS);
        MarkBattlerForControllerExec(gBattlerAttacker);
        gBattlescriptCurrInstr = BattleScript_OldMan_Pokedude_CaughtMessage;
    }
    else
    {
        u32 odds, i;
        u32 catchRate;
        u32 ballId = ItemIdToBallId(gLastUsedItem);

        gBallToDisplay = gLastThrownBall = gLastUsedItem;
        if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
            catchRate = gBattleStruct->safariCatchFactor * 1275 / 100;
        else
            catchRate = gSpeciesInfo[gBattleMons[gBattlerTarget].species].catchRate;

        if (gSpeciesInfo[gBattleMons[gBattlerTarget].species].isUltraBeast)
        {
            if (ballId == BALL_BEAST)
                ballMultiplier = 500;
            else
                ballMultiplier = 10;
        }
        else
        {
            switch (ballId)
            {
            case BALL_ULTRA:
                ballMultiplier = 200;
                break;
            case BALL_SPORT:
                if (B_SPORT_BALL_MODIFIER <= GEN_7)
                    ballMultiplier = 150;
                break;
            case BALL_GREAT:
                ballMultiplier = 150;
                break;
            case BALL_SAFARI:
                if (B_SAFARI_BALL_MODIFIER <= GEN_7)
                    ballMultiplier = 150;
                break;
            case BALL_NET:
                if (IS_BATTLER_ANY_TYPE(gBattlerTarget, TYPE_WATER, TYPE_BUG))
                    ballMultiplier = B_NET_BALL_MODIFIER >= GEN_7 ? 350 : 300;
                break;
            case BALL_DIVE:
                if (GetCurrentMapType() == MAP_TYPE_UNDERWATER
                    || (B_DIVE_BALL_MODIFIER >= GEN_4 && (gIsFishingEncounter || gIsSurfingEncounter)))
                    ballMultiplier = 350;
                break;
            case BALL_NEST:
                if (B_NEST_BALL_MODIFIER >= GEN_6)
                {
                    //((41 - Pokémon's level) ÷ 10)× if Pokémon's level is between 1 and 29, 1× otherwise.
                    if (gBattleMons[gBattlerTarget].level < 30)
                        ballMultiplier = 410 - (gBattleMons[gBattlerTarget].level * 10);
                }
                else if (B_NEST_BALL_MODIFIER >= GEN_5)
                {
                    //((41 - Pokémon's level) ÷ 10)×, minimum 1×
                    if (gBattleMons[gBattlerTarget].level < 31)
                        ballMultiplier = 410 - (gBattleMons[gBattlerTarget].level * 10);
                }
                else if (gBattleMons[gBattlerTarget].level < 40)
                {
                    //((40 - Pokémon's level) ÷ 10)×, minimum 1×
                    ballMultiplier = 400 - (gBattleMons[gBattlerTarget].level * 10);
                    if (ballMultiplier <= 90)
                        ballMultiplier = 100;
                }
                break;
            case BALL_REPEAT:
                if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gBattlerTarget].species), FLAG_GET_CAUGHT))
                    ballMultiplier = (B_REPEAT_BALL_MODIFIER >= GEN_7 ? 350 : 300);
                break;
            case BALL_TIMER:
                ballMultiplier = 100 + (gBattleResults.battleTurnCounter * (B_TIMER_BALL_MODIFIER >= GEN_5 ? 30 : 10));
                if (ballMultiplier > 400)
                    ballMultiplier = 400;
                break;
            case BALL_DUSK:
                i = GetTimeOfDay();
                if (i == TIME_EVENING || i == TIME_NIGHT || gMapHeader.cave || gMapHeader.mapType == MAP_TYPE_UNDERGROUND)
                    ballMultiplier = (B_DUSK_BALL_MODIFIER >= GEN_7 ? 300 : 350);
                break;
            case BALL_QUICK:
                if (gBattleResults.battleTurnCounter == 0)
                    ballMultiplier = (B_QUICK_BALL_MODIFIER >= GEN_5 ? 500 : 400);
                break;
            case BALL_LEVEL:
                if (gBattleMons[gBattlerAttacker].level >= 4 * gBattleMons[gBattlerTarget].level)
                    ballMultiplier = 800;
                else if (gBattleMons[gBattlerAttacker].level > 2 * gBattleMons[gBattlerTarget].level)
                    ballMultiplier = 400;
                else if (gBattleMons[gBattlerAttacker].level > gBattleMons[gBattlerTarget].level)
                    ballMultiplier = 200;
                break;
            case BALL_LURE:
                if (gIsFishingEncounter)
                {
                    if (B_LURE_BALL_MODIFIER >= GEN_8)
                        ballMultiplier = 400;
                    else if (B_LURE_BALL_MODIFIER >= GEN_7)
                        ballMultiplier = 500;
                    else
                        ballMultiplier = 300;
                }
                break;
            case BALL_MOON:
            {
                const struct Evolution *evolutions = GetSpeciesEvolutions(gBattleMons[gBattlerTarget].species);
                if (evolutions == NULL)
                    break;
                for (i = 0; evolutions[i].method != EVOLUTIONS_END; i++)
                {
                    if (evolutions[i].method == EVO_ITEM
                        && evolutions[i].param == ITEM_MOON_STONE)
                        ballMultiplier = 400;
                }
            }
            break;
            case BALL_LOVE:
                if (gBattleMons[gBattlerTarget].species == gBattleMons[gBattlerAttacker].species)
                {
                    u8 gender1 = GetMonGender(GetBattlerMon(gBattlerTarget));
                    u8 gender2 = GetMonGender(GetBattlerMon(gBattlerAttacker));

                    if (gender1 != gender2 && gender1 != MON_GENDERLESS && gender2 != MON_GENDERLESS)
                        ballMultiplier = 800;
                }
                break;
            case BALL_FAST:
                if (gSpeciesInfo[gBattleMons[gBattlerTarget].species].baseSpeed >= 100)
                    ballMultiplier = 400;
                break;
            case BALL_HEAVY:
                i = GetSpeciesWeight(gBattleMons[gBattlerTarget].species);
                if (B_HEAVY_BALL_MODIFIER >= GEN_7)
                {
                    if (i < 1000)
                        ballAddition = -20;
                    else if (i < 2000)
                        ballAddition = 0;
                    else if (i < 3000)
                        ballAddition = 20;
                    else
                        ballAddition = 30;
                }
                else if (B_HEAVY_BALL_MODIFIER >= GEN_4)
                {
                    if (i < 2048)
                        ballAddition = -20;
                    else if (i < 3072)
                        ballAddition = 20;
                    else if (i < 4096)
                        ballAddition = 30;
                    else
                        ballAddition = 40;
                }
                else
                {
                    if (i < 1024)
                        ballAddition = -20;
                    else if (i < 2048)
                        ballAddition = 0;
                    else if (i < 3072)
                        ballAddition = 20;
                    else if (i < 4096)
                        ballAddition = 30;
                    else
                        ballAddition = 40;
                }
                break;
            case BALL_DREAM:
                if (B_DREAM_BALL_MODIFIER >= GEN_8 && (gBattleMons[gBattlerTarget].status1 & STATUS1_SLEEP || GetBattlerAbility(gBattlerTarget) == ABILITY_COMATOSE))
                    ballMultiplier = 400;
                break;
            case BALL_BEAST:
                ballMultiplier = 10;
                break;
            }
        }

        // catchRate is unsigned, which means that it may potentially overflow if sum is applied directly.
        if (catchRate < 21 && ballAddition == -20)
            catchRate = 1;
        else
            catchRate = catchRate + ballAddition;

        odds = (catchRate * ballMultiplier / 100)
            * (gBattleMons[gBattlerTarget].maxHP * 3 - gBattleMons[gBattlerTarget].hp * 2)
            / (3 * gBattleMons[gBattlerTarget].maxHP);

        if (gBattleMons[gBattlerTarget].status1 & (STATUS1_SLEEP | STATUS1_FREEZE))
            odds *= 2;
        if (gBattleMons[gBattlerTarget].status1 & (STATUS1_POISON | STATUS1_BURN | STATUS1_PARALYSIS | STATUS1_TOXIC_POISON | STATUS1_FROSTBITE))
            odds = (odds * 15) / 10;

        if (gBattleResults.catchAttempts[ballId] < 255)
            gBattleResults.catchAttempts[ballId]++;

        if (odds > 254) // mon caught
        {
            BtlController_EmitBallThrowAnim(gBattlerAttacker, B_COMM_TO_CONTROLLER, BALL_3_SHAKES_SUCCESS);
            MarkBattlerForControllerExec(gBattlerAttacker);
            TryBattleFormChange(gBattlerTarget, FORM_CHANGE_END_BATTLE);
            gBattlescriptCurrInstr = BattleScript_SuccessBallThrow;
            SetMonData(GetBattlerMon(gBattlerTarget), MON_DATA_POKEBALL, &ballId);

            if (CalculatePlayerPartyCount() == PARTY_SIZE)
                gBattleCommunication[MULTISTRING_CHOOSER] = 0;
            else
                gBattleCommunication[MULTISTRING_CHOOSER] = 1;

            if (ballId == BALL_HEAL)
            {
                MonRestorePP(GetBattlerMon(gBattlerTarget));
                HealStatusConditions(GetBattlerMon(gBattlerTarget), STATUS1_ANY, gBattlerTarget);
                gBattleMons[gBattlerTarget].hp = gBattleMons[gBattlerTarget].maxHP;
                SetMonData(GetBattlerMon(gBattlerTarget), MON_DATA_HP, &gBattleMons[gBattlerTarget].hp);
            }
            else if (ballId == BALL_FRIEND)
            {
                u32 friendship = (B_FRIEND_BALL_MODIFIER >= GEN_8 ? 150 : 200);
                SetMonData(GetBattlerMon(gBattlerTarget), MON_DATA_FRIENDSHIP, &friendship);
            }
        }
        else // mon may be caught, calculate shakes
        {
            u8 shakes;
            u8 maxShakes;

            gBattleSpritesDataPtr->animationData->isCriticalCapture = FALSE;
            gBattleSpritesDataPtr->animationData->criticalCaptureSuccess = FALSE;

            if (CriticalCapture(odds))
            {
                maxShakes = BALL_1_SHAKE;  // critical capture doesn't guarantee capture
                gBattleSpritesDataPtr->animationData->isCriticalCapture = TRUE;
            }
            else
            {
                maxShakes = BALL_3_SHAKES_SUCCESS;
            }

            if (ballId == BALL_MASTER)
            {
                shakes = maxShakes;
            }
            else
            {
                odds = Sqrt(Sqrt(16711680 / odds));
                odds = 1048560 / odds;
                for (shakes = 0; shakes < maxShakes && Random() < odds; shakes++);
            }

            BtlController_EmitBallThrowAnim(gBattlerAttacker, B_COMM_TO_CONTROLLER, shakes);
            MarkBattlerForControllerExec(gBattlerAttacker);

            if (shakes == maxShakes) // mon caught, copy of the code above
            {
                if (IsCriticalCapture())
                    gBattleSpritesDataPtr->animationData->criticalCaptureSuccess = TRUE;

                TryBattleFormChange(gBattlerTarget, FORM_CHANGE_END_BATTLE);
                gBattlescriptCurrInstr = BattleScript_SuccessBallThrow;
                SetMonData(GetBattlerMon(gBattlerTarget), MON_DATA_POKEBALL, &ballId);

                if (CalculatePlayerPartyCount() == PARTY_SIZE)
                    gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                else
                    gBattleCommunication[MULTISTRING_CHOOSER] = 1;

                if (ballId == BALL_HEAL)
                {
                    MonRestorePP(GetBattlerMon(gBattlerTarget));
                    HealStatusConditions(GetBattlerMon(gBattlerTarget), STATUS1_ANY, gBattlerTarget);
                    gBattleMons[gBattlerTarget].hp = gBattleMons[gBattlerTarget].maxHP;
                    SetMonData(GetBattlerMon(gBattlerTarget), MON_DATA_HP, &gBattleMons[gBattlerTarget].hp);
                }
                else if (ballId == BALL_FRIEND)
                {
                    u32 friendship = (B_FRIEND_BALL_MODIFIER >= GEN_8 ? 150 : 200);
                    SetMonData(GetBattlerMon(gBattlerTarget), MON_DATA_FRIENDSHIP, &friendship);
                }
            }
            else // not caught
            {
                if (!gHasFetchedBall)
                    gLastUsedBall = gLastUsedItem;

                if (IsCriticalCapture())
                    gBattleCommunication[MULTISTRING_CHOOSER] = BALL_3_SHAKES_FAIL;
                else
                    gBattleCommunication[MULTISTRING_CHOOSER] = shakes;

                gBattlescriptCurrInstr = BattleScript_ShakeBallThrow;
            }
        }
    }
}

static void Cmd_givecaughtmon(void)
{
    CMD_ARGS(const u8 *passInstr);
    enum GiveCaughtMonStates state = gBattleCommunication[MULTIUSE_STATE];

    switch (state)
    {
    case GIVECAUGHTMON_CHECK_PARTY_SIZE:
        if (CalculatePlayerPartyCount() == PARTY_SIZE && B_CATCH_SWAP_INTO_PARTY >= GEN_7)
        {
            PrepareStringBattle(STRINGID_SENDCAUGHTMONPARTYORBOX, gBattlerAttacker);
            gBattleCommunication[MSG_DISPLAY] = 1;
            gBattleCommunication[MULTIUSE_STATE] = GIVECAUGHTMON_ASK_ADD_TO_PARTY;
        }
        else
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_NO_MESSSAGE_SKIP;
            gBattleCommunication[MULTIUSE_STATE] = GIVECAUGHTMON_GIVE_AND_SHOW_MSG;
        }
        break;
    case GIVECAUGHTMON_ASK_ADD_TO_PARTY:
        HandleBattleWindow(YESNOBOX_X_Y, 0);
        BattlePutTextOnWindow(gText_BattleYesNoChoice, B_WIN_YESNO);
        gBattleCommunication[MULTIUSE_STATE] = GIVECAUGHTMON_HANDLE_INPUT;
        gBattleCommunication[CURSOR_POSITION] = 0;
        BattleCreateYesNoCursorAt(0);
        break;
    case GIVECAUGHTMON_HANDLE_INPUT:
        if (JOY_NEW(DPAD_UP) && gBattleCommunication[CURSOR_POSITION] != 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt(gBattleCommunication[CURSOR_POSITION]);
            gBattleCommunication[CURSOR_POSITION] = 0;
            BattleCreateYesNoCursorAt(0);
        }
        if (JOY_NEW(DPAD_DOWN) && gBattleCommunication[CURSOR_POSITION] == 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt(gBattleCommunication[CURSOR_POSITION]);
            gBattleCommunication[CURSOR_POSITION] = 1;
            BattleCreateYesNoCursorAt(1);
        }
        if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            if (gBattleCommunication[CURSOR_POSITION] == 0)
            {
                gBattleCommunication[MULTIUSE_STATE] = GIVECAUGHTMON_DO_CHOOSE_MON;
            }
            else
            {
                gBattleCommunication[MULTIUSE_STATE] = GIVECAUGHTMON_GIVE_AND_SHOW_MSG;
            }
        }
        else if (JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            gBattleCommunication[MULTIUSE_STATE] = GIVECAUGHTMON_GIVE_AND_SHOW_MSG;
        }
        break;
    case GIVECAUGHTMON_DO_CHOOSE_MON:
        if (!gPaletteFade.active)
        {
            BtlController_EmitChoosePokemon(gBattlerAttacker, B_COMM_TO_CONTROLLER, PARTY_ACTION_SEND_MON_TO_BOX, PARTY_SIZE, ABILITY_NONE, gBattleStruct->battlerPartyOrders[gBattlerAttacker]);
            MarkBattlerForControllerExec(gBattlerAttacker);
            gBattleCommunication[MULTIUSE_STATE] = GIVECAUGHTMON_HANDLE_CHOSEN_MON;
        }
        break;
    case GIVECAUGHTMON_HANDLE_CHOSEN_MON:
        if (gSelectedMonPartyId != PARTY_SIZE)
        {
            if (gSelectedMonPartyId > PARTY_SIZE)
            {
                // Choosing Pokemon was cancelled
                gSelectedMonPartyId = PARTY_SIZE;
                gBattleCommunication[MULTIUSE_STATE] = GIVECAUGHTMON_GIVE_AND_SHOW_MSG;
            }
            else
            {
                // Mon chosen, try to put it in the PC
                if (CopyMonToPC(&gPlayerParty[gSelectedMonPartyId]) == MON_GIVEN_TO_PC)
                {
                    GetMonNickname(&gPlayerParty[gSelectedMonPartyId], gStringVar2);
                    StringCopy(gStringVar1, GetBoxNamePtr(GetPCBoxToSendMon()));
                    ZeroMonData(&gPlayerParty[gSelectedMonPartyId]);
                    gBattleStruct->itemLost[B_SIDE_PLAYER][gSelectedMonPartyId].originalItem = ITEM_NONE;
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SWAPPED_INTO_PARTY;
                    gSelectedMonPartyId = PARTY_SIZE;
                    gBattleCommunication[MULTIUSE_STATE] = GIVECAUGHTMON_GIVE_AND_SHOW_MSG;
                }
                else
                {
                    gSelectedMonPartyId = PARTY_SIZE;
                    gBattleCommunication[MULTIUSE_STATE] = GIVECAUGHTMON_GIVE_AND_SHOW_MSG;
                }
            }
        }
        break;
    case GIVECAUGHTMON_GIVE_AND_SHOW_MSG:
        if (B_RESTORE_HELD_BATTLE_ITEMS >= GEN_9)
        {
            u16 lostItem = gBattleStruct->itemLost[B_SIDE_OPPONENT][gBattlerPartyIndexes[GetCatchingBattler()]].originalItem;
            if (lostItem != ITEM_NONE && GetItemPocket(lostItem) != POCKET_BERRIES)
                SetMonData(GetBattlerMon(GetCatchingBattler()), MON_DATA_HELD_ITEM, &lostItem);  // Restore non-berry items
        }

        if (GiveMonToPlayer(GetBattlerMon(GetCatchingBattler())) != MON_GIVEN_TO_PARTY
         && gBattleCommunication[MULTISTRING_CHOOSER] != B_MSG_SWAPPED_INTO_PARTY)
        {
            if (!ShouldShowBoxWasFullMessage())
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SENT_SOMEONES_PC;
                StringCopy(gStringVar1, GetBoxNamePtr(VarGet(VAR_PC_BOX_TO_SEND_MON)));
                GetMonData(GetBattlerMon(GetCatchingBattler()), MON_DATA_NICKNAME, gStringVar2);
            }
            else
            {
                StringCopy(gStringVar1, GetBoxNamePtr(VarGet(VAR_PC_BOX_TO_SEND_MON))); // box the mon was sent to
                GetMonData(GetBattlerMon(GetCatchingBattler()), MON_DATA_NICKNAME, gStringVar2);
                StringCopy(gStringVar3, GetBoxNamePtr(GetPCBoxToSendMon())); //box the mon was going to be sent to
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SOMEONES_BOX_FULL;
            }

            // Change to B_MSG_SENT_LANETTES_PC or B_MSG_LANETTES_BOX_FULL
            if (FlagGet(FLAG_SYS_NOT_SOMEONES_PC))
                gBattleCommunication[MULTISTRING_CHOOSER]++;
        }

        gBattleResults.caughtMonSpecies = GetMonData(GetBattlerMon(GetCatchingBattler()), MON_DATA_SPECIES, NULL);
        GetMonData(GetBattlerMon(GetCatchingBattler()), MON_DATA_NICKNAME, gBattleResults.caughtMonNick);
        gBattleResults.caughtMonBall = GetMonData(GetBattlerMon(GetCatchingBattler()), MON_DATA_POKEBALL, NULL);

        gSelectedMonPartyId = PARTY_SIZE;
        gBattleCommunication[MULTIUSE_STATE] = 0;

        if (gBattleCommunication[MULTISTRING_CHOOSER] == B_MSG_NO_MESSSAGE_SKIP)
            gBattlescriptCurrInstr = cmd->passInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
        break;
    }
}

static void Cmd_trysetcaughtmondexflags(void)
{
    CMD_ARGS(const u8 *failInstr);

    u32 species = GetMonData(GetBattlerMon(GetCatchingBattler()), MON_DATA_SPECIES, NULL);
    u32 personality = GetMonData(GetBattlerMon(GetCatchingBattler()), MON_DATA_PERSONALITY, NULL);

    if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_CAUGHT))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        HandleSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_SET_CAUGHT, personality);
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_displaydexinfo(void)
{
    CMD_ARGS();

    u16 species = GetMonData(GetBattlerMon(GetCatchingBattler()), MON_DATA_SPECIES, NULL);

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
            struct Pokemon *mon = &gEnemyParty[gBattlerPartyIndexes[GetCatchingBattler()]];
            CreateMonPicSprite(species, GetMonData(mon, MON_DATA_IS_SHINY), GetMonData(mon, MON_DATA_PERSONALITY), TRUE, 120, 64, 0, 0xFFFF);
            CpuFill32(0, gPlttBufferFaded, BG_PLTT_SIZE);
            BeginNormalPaletteFade(0x1FFFF, 0, 16, 0, RGB_BLACK);
            ShowBg(0);
            ShowBg(3);
            gBattleCommunication[0]++;
        }
        break;
    case 5:
        if (!gPaletteFade.active) {
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
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

void BattleCreateYesNoCursorAt(u8 cursorPosition)
{
    u16 src[2];
    src[0] = 1;
    src[1] = 2;

    CopyToBgTilemapBufferRect_ChangePalette(0, src, 0x18, 9 + (2 * cursorPosition), 1, 2, 0x11);
    CopyBgTilemapBufferToVram(0);
}

void BattleDestroyYesNoCursorAt(u8 cursorPosition)
{
    u16 src[2];
    src[0] = 32;
    src[1] = 32;

    CopyToBgTilemapBufferRect_ChangePalette(0, src, 0x18, 9 + (2 * cursorPosition), 1, 2, 0x11);
    CopyBgTilemapBufferToVram(0);
}

static void Cmd_trygivecaughtmonnick(void)
{
    CMD_ARGS();

    switch (gBattleCommunication[MULTIUSE_STATE])
    {
    case 0:
        HandleBattleWindow(YESNOBOX_X_Y, 0);
        BattlePutTextOnWindow(gText_BattleYesNoChoice, B_WIN_YESNO);
        gBattleCommunication[MULTIUSE_STATE]++;
        gBattleCommunication[CURSOR_POSITION] = 0;
        BattleCreateYesNoCursorAt(0);
        break;
    case 1:
        if (JOY_NEW(DPAD_UP) && gBattleCommunication[CURSOR_POSITION] != 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt(gBattleCommunication[CURSOR_POSITION]);
            gBattleCommunication[CURSOR_POSITION] = 0;
            BattleCreateYesNoCursorAt(0);
        }
        if (JOY_NEW(DPAD_DOWN) && gBattleCommunication[CURSOR_POSITION] == 0)
        {
            PlaySE(SE_SELECT);
            BattleDestroyYesNoCursorAt(gBattleCommunication[CURSOR_POSITION]);
            gBattleCommunication[CURSOR_POSITION] = 1;
            BattleCreateYesNoCursorAt(1);
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
            GetMonData(GetBattlerMon(gBattlerTarget), MON_DATA_NICKNAME, gBattleStruct->caughtMonNick);
            FreeAllWindowBuffers();
            MainCallback callback = CalculatePlayerPartyCount() == PARTY_SIZE ? ReshowBlankBattleScreenAfterMenu : BattleMainCB2;

            DoNamingScreen(NAMING_SCREEN_CAUGHT_MON, gBattleStruct->caughtMonNick,
                           GetMonData(GetBattlerMon(gBattlerTarget), MON_DATA_SPECIES),
                           GetMonGender(GetBattlerMon(gBattlerTarget)),
                           GetMonData(GetBattlerMon(gBattlerTarget), MON_DATA_PERSONALITY, NULL),
                           callback);

            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 3:
        if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
        {
            SetMonData(GetBattlerMon(gBattlerTarget), MON_DATA_NICKNAME, gBattleStruct->caughtMonNick);
            gBattleCommunication[MULTIUSE_STATE]++;
        }
        break;
    case 4:
        gBattleCommunication[MULTIUSE_STATE] = 0;
        gBattlescriptCurrInstr = cmd->nextInstr;
        break;
    }
}

static void Cmd_subattackerhpbydmg(void)
{
    CMD_ARGS();

    gBattleMons[gBattlerAttacker].hp -= gBattleStruct->moveDamage[gBattlerTarget];
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_removeattackerstatus1(void)
{
    CMD_ARGS();

    gBattleMons[gBattlerAttacker].status1 = 0;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

// CMD_ARGS is not needed for these functions as they end the script execution.
static void Cmd_finishaction(void)
{
    gCurrentActionFuncId = B_ACTION_FINISHED;
}

static void Cmd_finishturn(void)
{
    gCurrentActionFuncId = B_ACTION_FINISHED;
    gCurrentTurnActionNumber = gBattlersCount;
}

static void Cmd_trainerslideout(void)
{
    CMD_ARGS(u8 position);

    u32 battler = GetBattlerForBattleScript(cmd->position);
    BtlController_EmitTrainerSlideBack(battler, B_COMM_TO_CONTROLLER);
    MarkBattlerForControllerExec(battler);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static const u16 sTelekinesisBanList[] =
{
    SPECIES_DIGLETT,
    SPECIES_DUGTRIO,
    SPECIES_DIGLETT_ALOLA,
    SPECIES_DUGTRIO_ALOLA,
    SPECIES_SANDYGAST,
    SPECIES_PALOSSAND,
    SPECIES_GENGAR_MEGA,
};

bool32 IsTelekinesisBannedSpecies(u16 species)
{
    u32 i;

    for (i = 0; i < ARRAY_COUNT(sTelekinesisBanList); i++)
    {
        if (species == sTelekinesisBanList[i])
            return TRUE;
    }
    return FALSE;
}

static void Cmd_settelekinesis(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gStatuses3[gBattlerTarget] & (STATUS3_TELEKINESIS | STATUS3_ROOTED | STATUS3_SMACKED_DOWN)
        || gFieldStatuses & STATUS_FIELD_GRAVITY
        || IsTelekinesisBannedSpecies(gBattleMons[gBattlerTarget].species))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gStatuses3[gBattlerTarget] |= STATUS3_TELEKINESIS;
        gDisableStructs[gBattlerTarget].telekinesisTimer = gBattleTurnCounter + 3;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_swapstatstages(void)
{
    CMD_ARGS(u8 stat);

    u8 stat = cmd->stat;
    s8 atkStatStage = gBattleMons[gBattlerAttacker].statStages[stat];
    s8 defStatStage = gBattleMons[gBattlerTarget].statStages[stat];

    gBattleMons[gBattlerAttacker].statStages[stat] = defStatStage;
    gBattleMons[gBattlerTarget].statStages[stat] = atkStatStage;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static u16 *GetBattlerStat(struct BattlePokemon *battler, u32 stat)
{
    switch (stat)
    {
    case STAT_ATK:   return &battler->attack;
    case STAT_DEF:   return &battler->defense;
    case STAT_SPATK: return &battler->spAttack;
    case STAT_SPDEF: return &battler->spDefense;
    default:         return NULL;
    }
}

static void Cmd_averagestats(void)
{
    CMD_ARGS(u8 stat);

    u16 *stat1 = GetBattlerStat(&gBattleMons[gBattlerAttacker], cmd->stat);
    u16 *stat2 = GetBattlerStat(&gBattleMons[gBattlerTarget], cmd->stat);
    u16 avg = (*stat1 + *stat2) / 2;
    *stat1 = *stat2 = avg;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_jumpifcaptivateaffected(void)
{
    CMD_ARGS(const u8 *jumpInstr);

    if (GetBattlerAbility(gBattlerTarget) == ABILITY_OBLIVIOUS)
    {
        gBattlescriptCurrInstr = BattleScript_NotAffectedAbilityPopUp;
        gLastUsedAbility = ABILITY_OBLIVIOUS;
        RecordAbilityBattle(gBattlerTarget, ABILITY_OBLIVIOUS);
    }
    else if (AreBattlersOfOppositeGender(gBattlerAttacker, gBattlerTarget))
    {
        gBattlescriptCurrInstr = cmd->jumpInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_setnonvolatilestatus(void)
{
    CMD_ARGS();
    gEffectBattler = gBattlerTarget;
    SetNonVolatileStatusCondition(gBattlerTarget, GetMoveNonVolatileStatus(gCurrentMove));
}

static void Cmd_tryworryseed(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gAbilitiesInfo[gBattleMons[gBattlerTarget].ability].cantBeOverwritten
      || gBattleMons[gBattlerTarget].ability == ABILITY_INSOMNIA)
    {
        RecordAbilityBattle(gBattlerTarget, gBattleMons[gBattlerTarget].ability);
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (GetBattlerHoldEffect(gBattlerTarget, TRUE) == HOLD_EFFECT_ABILITY_SHIELD)
    {
        RecordItemEffectBattle(gBattlerTarget, HOLD_EFFECT_ABILITY_SHIELD);
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gBattleScripting.abilityPopupOverwrite = gBattleMons[gBattlerTarget].ability;
        gBattleMons[gBattlerTarget].ability = gDisableStructs[gBattlerTarget].overwrittenAbility = ABILITY_INSOMNIA;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_callnative(void)
{
    CMD_ARGS(void (*func)(void));
    void (*func)(void) = cmd->func;
    func();
}

// Callnative Funcs

void SaveBattlerTarget(u32 battler)
{
    if (gBattleStruct->savedTargetCount < NELEMS(gBattleStruct->savedBattlerTarget))
        gBattleStruct->savedBattlerTarget[gBattleStruct->savedTargetCount++] = battler;
    else
        DebugPrintfLevel(MGBA_LOG_WARN, "Attempting to exceed savedBattlerTarget array size!");
}

void SaveBattlerAttacker(u32 battler)
{
    if (gBattleStruct->savedAttackerCount < NELEMS(gBattleStruct->savedBattlerAttacker))
        gBattleStruct->savedBattlerAttacker[gBattleStruct->savedAttackerCount++] = battler;
    else
        DebugPrintfLevel(MGBA_LOG_WARN, "Attempting to exceed savedBattlerAttacker array size!");
}

void BS_SaveTarget(void)
{
    NATIVE_ARGS();
    SaveBattlerTarget(gBattlerTarget);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_RestoreTarget(void)
{
    NATIVE_ARGS();
    if (gBattleStruct->savedTargetCount > 0)
    {
        gBattleStruct->savedTargetCount--;
        gBattlerTarget = gBattleStruct->savedBattlerTarget[gBattleStruct->savedTargetCount];
    }
    else
    {
        // #if TESTING
        // Test_ExitWithResult(TEST_RESULT_ERROR, "BS_RestoreTarget attempting to restore an empty target!");
        // #else
        DebugPrintfLevel(MGBA_LOG_WARN, "BS_RestoreTarget attempting to restore an empty target!");
        // #endif
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SaveAttacker(void)
{
    NATIVE_ARGS();
    SaveBattlerAttacker(gBattlerAttacker);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_RestoreAttacker(void)
{
    NATIVE_ARGS();
    if (gBattleStruct->savedAttackerCount > 0)
    {
        gBattleStruct->savedAttackerCount--;
        gBattlerAttacker = gBattleStruct->savedBattlerAttacker[gBattleStruct->savedAttackerCount];
    }
    else
    {
        // #if TESTING
        // Test_ExitWithResult(TEST_RESULT_ERROR,  "BS_RestoreAttacker attempting to restore an empty attacker!");
        // #else
        DebugPrintfLevel(MGBA_LOG_WARN, "BS_RestoreAttacker attempting to restore an empty attacker!");
        // #endif
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_CalcMetalBurstDmg(void)
{
    NATIVE_ARGS(const u8 *failInstr);

    u8 sideAttacker = GetBattlerSide(gBattlerAttacker);
    u8 sideTarget = 0;

    if (gProtectStructs[gBattlerAttacker].physicalDmg
        && sideAttacker != (sideTarget = GetBattlerSide(gProtectStructs[gBattlerAttacker].physicalBattlerId))
        && gBattleMons[gProtectStructs[gBattlerAttacker].physicalBattlerId].hp)
    {
        gBattleStruct->moveDamage[gBattlerTarget] = gProtectStructs[gBattlerAttacker].physicalDmg * 150 / 100;

        if (IsAffectedByFollowMe(gBattlerAttacker, sideTarget, gCurrentMove))
            gBattlerTarget = gSideTimers[sideTarget].followmeTarget;
        else
            gBattlerTarget = gProtectStructs[gBattlerAttacker].physicalBattlerId;

        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else if (gProtectStructs[gBattlerAttacker].specialDmg
             && sideAttacker != (sideTarget = GetBattlerSide(gProtectStructs[gBattlerAttacker].specialBattlerId))
             && gBattleMons[gProtectStructs[gBattlerAttacker].specialBattlerId].hp)
    {
        gBattleStruct->moveDamage[gBattlerTarget] = gProtectStructs[gBattlerAttacker].specialDmg * 150 / 100;

        if (IsAffectedByFollowMe(gBattlerAttacker, sideTarget, gCurrentMove))
            gBattlerTarget = gSideTimers[sideTarget].followmeTarget;
        else
            gBattlerTarget = gProtectStructs[gBattlerAttacker].specialBattlerId;

        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

void BS_JumpIfCantFling(void)
{
    NATIVE_ARGS(u8 battler, const u8 *jumpInstr);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    if (!CanFling(battler))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfMoreThanHalfHP(void)
{
    NATIVE_ARGS(u8 battler, const u8 *jumpInstr);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    if (gBattleMons[battler].hp > (gBattleMons[battler].maxHP + 1) / 2)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_DoStockpileStatChangesWearOff(void)
{
    NATIVE_ARGS(u8 battler, const u8 *statChangeInstr);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    if (gDisableStructs[battler].stockpileDef != 0)
    {
        SET_STATCHANGER(STAT_DEF, abs(gDisableStructs[battler].stockpileDef), TRUE);
        gDisableStructs[battler].stockpileDef = 0;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = cmd->statChangeInstr;
    }
    else if (gDisableStructs[battler].stockpileSpDef)
    {
        SET_STATCHANGER(STAT_SPDEF, abs(gDisableStructs[battler].stockpileSpDef), TRUE);
        gDisableStructs[battler].stockpileSpDef = 0;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = cmd->statChangeInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static bool32 CriticalCapture(u32 odds)
{
    u32 numCaught;
    u32 totalDexCount;

    if (B_CRITICAL_CAPTURE == FALSE)
        return FALSE;

    if (B_CRITICAL_CAPTURE_LOCAL_DEX == TRUE)
        totalDexCount = KANTO_DEX_COUNT;
    else
        totalDexCount = NATIONAL_DEX_COUNT;

    numCaught = GetNationalPokedexCount(FLAG_GET_CAUGHT);

    if (numCaught <= (totalDexCount * 30) / 650)
        odds = 0;
    else if (numCaught <= (totalDexCount * 150) / 650)
        odds /= 2;
    else if (numCaught <= (totalDexCount * 300) / 650)
        ;   // odds = (odds * 100) / 100;
    else if (numCaught <= (totalDexCount * 450) / 650)
        odds = (odds * 150) / 100;
    else if (numCaught <= (totalDexCount * 600) / 650)
        odds *= 2;
    else
        odds = (odds * 250) / 100;

    if (CheckBagHasItem(ITEM_CATCHING_CHARM, 1))
        odds = (odds * (100 + B_CATCHING_CHARM_BOOST)) / 100;

    odds /= 6;

    if ((Random() % 255) < odds)
        return TRUE;

    return FALSE;
}

bool32 IsMoveAffectedByParentalBond(u32 move, u32 battler)
{
    if (move != MOVE_NONE && move != MOVE_UNAVAILABLE && move != MOVE_STRUGGLE
        && !IsMoveParentalBondBanned(move)
        && GetMoveCategory(move) != DAMAGE_CATEGORY_STATUS
        && GetMoveStrikeCount(move) < 2
        && GetMoveEffect(move) != EFFECT_SEMI_INVULNERABLE
        && GetMoveEffect(move) != EFFECT_TWO_TURNS_ATTACK
        && GetMoveEffect(move) != EFFECT_MULTI_HIT)
    {
        if (IsDoubleBattle())
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

static bool8 IsFinalStrikeEffect(enum BattleMoveEffects moveEffect)
{
    u32 i;

    for (i = 0; i < ARRAY_COUNT(sFinalStrikeOnlyEffects); i++)
    {
        if (moveEffect == sFinalStrikeOnlyEffects[i])
            return TRUE;
    }
    return FALSE;
}

static bool32 CanAbilityPreventStatLoss(u32 abilityDef)
{
    switch (abilityDef)
    {
    case ABILITY_CLEAR_BODY:
    case ABILITY_FULL_METAL_BODY:
    case ABILITY_WHITE_SMOKE:
        return TRUE;
    }
    return FALSE;
}

bool32 CanBurnHitThaw(u16 move)
{
    u8 i;

    if (B_BURN_HIT_THAW >= GEN_6)
    {
        u32 numAdditionalEffects = GetMoveAdditionalEffectCount(move);
        for (i = 0; i < numAdditionalEffects; i++)
        {
            const struct AdditionalEffect *additionalEffect = GetMoveAdditionalEffectById(move, i);
            if (additionalEffect->moveEffect == MOVE_EFFECT_BURN)
                return TRUE;
        }
    }
    return FALSE;
}

void BS_CheckParentalBondCounter(void)
{
    NATIVE_ARGS(u8 counter, const u8 *jumpInstr);
    // Some effects should only happen on the first or second strike of Parental Bond,
    // so a way to check this in battle scripts is useful
    if (gSpecialStatuses[gBattlerAttacker].parentalBondState == cmd->counter && IsBattlerAlive(gBattlerTarget))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfCantLoseItem(void)
{
    NATIVE_ARGS(u8 battler, const u8 *jumpInstr);
    u8 battler = GetBattlerForBattleScript(cmd->battler);
    u16 item = gBattleMons[battler].item;

    if (item == ITEM_NONE || !CanBattlerGetOrLoseItem(battler, item))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_GetBattlerSide(void)
{
    NATIVE_ARGS(u8 battler);
    gBattleCommunication[0] = GetBattlerSide(GetBattlerForBattleScript(cmd->battler));
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TrySymbiosis(void)
{
    NATIVE_ARGS(u8 battler);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    //called by Bestow, Fling, and Bug Bite, which don't work with Cmd_removeitem.
    u32 partner = BATTLE_PARTNER(battler);
    if (TryTriggerSymbiosis(battler, partner))
    {
        BestowItem(partner, battler);
        gLastUsedAbility = gBattleMons[partner].ability;
        gBattleScripting.battler = gBattlerAbility = partner;
        gEffectBattler = battler;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_SymbiosisActivates;
        return;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SetZEffect(void)
{
    SetZEffect();   // Handles battle script jumping internally
}

static void TryUpdateRoundTurnOrder(void)
{
    if (IsDoubleBattle())
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
            gProtectStructs[roundUsers[i]].quash = TRUE; // Make it so their turn order can't be changed again
            currRounder++;
        }

        // Update turn order for non-round users
        for (i = 0; nonRoundUsers[i] != 0xFF && i < 3; i++)
        {
            gBattlerByTurnOrder[currRounder] = nonRoundUsers[i];
            currRounder++;
        }
    }
}

u8 GetFirstFaintedPartyIndex(u8 battler)
{
    u32 i;
    u32 start = 0;
    u32 end = PARTY_SIZE;
    struct Pokemon *party = GetBattlerParty(battler);

    // Check whether partner is separate trainer.
    if ((IsOnPlayerSide(battler) && gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER)
        || (!IsOnPlayerSide(battler) && gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS))
    {
        if (GetBattlerPosition(battler) == B_POSITION_OPPONENT_LEFT
            || GetBattlerPosition(battler) == B_POSITION_PLAYER_LEFT)
        {
            end = PARTY_SIZE / 2;
        }
        else
        {
            start = PARTY_SIZE / 2;
        }
    }

    // Loop through to find fainted battler.
    for (i = start; i < end; ++i)
    {
        u32 species = GetMonData(&party[i], MON_DATA_SPECIES_OR_EGG);
        if (species != SPECIES_NONE
            && species != SPECIES_EGG
            && GetMonData(&party[i], MON_DATA_HP) == 0)
        {
            return i;
        }
    }

    // Returns PARTY_SIZE if none found.
    return PARTY_SIZE;
}

void ApplyExperienceMultipliers(s32 *expAmount, u8 expGetterMonId, u8 faintedBattler)
{
    enum ItemHoldEffect holdEffect = GetMonHoldEffect(&gPlayerParty[expGetterMonId]);

    if (IsTradedMon(&gPlayerParty[expGetterMonId]))
        *expAmount = (*expAmount * 150) / 100;
    if (holdEffect == HOLD_EFFECT_LUCKY_EGG)
        *expAmount = (*expAmount * 150) / 100;
    if (B_UNEVOLVED_EXP_MULTIPLIER >= GEN_6 && IsMonPastEvolutionLevel(&gPlayerParty[expGetterMonId]))
        *expAmount = (*expAmount * 4915) / 4096;
    if (B_AFFECTION_MECHANICS == TRUE && GetMonAffectionHearts(&gPlayerParty[expGetterMonId]) >= AFFECTION_FOUR_HEARTS)
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

void BS_ItemRestoreHP(void)
{
    NATIVE_ARGS(const u8 *alreadyMaxHpInstr, const u8 *restoreBattlerInstr);
    u16 healAmount;
    u32 battler = MAX_BATTLERS_COUNT;
    u32 healParam = GetItemEffect(gLastUsedItem)[6];
    struct Pokemon *party = GetBattlerParty(gBattlerAttacker);
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
        if (hp == 0 && IsOnPlayerSide(gBattlerAttacker) && gBattleResults.numRevivesUsed < 255)
            gBattleResults.numRevivesUsed++;

        // Check if the recipient is an active battler.
        if (gBattleStruct->itemPartyIndex[gBattlerAttacker] == gBattlerPartyIndexes[gBattlerAttacker])
            battler = gBattlerAttacker;
        else if (IsDoubleBattle() && gBattleStruct->itemPartyIndex[gBattlerAttacker] == gBattlerPartyIndexes[BATTLE_PARTNER(gBattlerAttacker)])
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
            gBattleStruct->moveDamage[battler] = -healAmount;
            gBattlescriptCurrInstr = cmd->restoreBattlerInstr;
        }
        else
        {
            hp += healAmount;
            SetMonData(&party[gBattleStruct->itemPartyIndex[gBattlerAttacker]], MON_DATA_HP, &hp);

            // Revived battlers on the field need to be brought back.
            if (IsDoubleBattle() && battler != MAX_BATTLERS_COUNT)
            {
                gAbsentBattlerFlags &= ~(1u << battler);
                gBattleMons[battler].hp = hp;
                gBattleCommunication[MULTIUSE_STATE] = TRUE;
            }
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
    }
}

void BS_ItemCureStatus(void)
{
    NATIVE_ARGS(const u8 *noStatusInstr);
    u32 battler = gBattlerAttacker;
    u32 previousStatus2 = 0;
    bool32 statusChanged = FALSE;
    struct Pokemon *party = GetBattlerParty(gBattlerAttacker);

    // Heal Status2 conditions if battler is active.
    if (gBattleStruct->itemPartyIndex[gBattlerAttacker] == gBattlerPartyIndexes[gBattlerAttacker])
    {
        previousStatus2 = gBattleMons[battler].status2;
        gBattleMons[gBattlerAttacker].status2 &= ~GetItemStatus2Mask(gLastUsedItem);
    }
    else if (IsDoubleBattle()
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
    u16 statId = GetItemEffect(gLastUsedItem)[1];
    u16 stages = GetItemHoldEffectParam(gLastUsedItem);
    SET_STATCHANGER(statId, stages, FALSE);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_ItemRestorePP(void)
{
    NATIVE_ARGS();
    const u8 *effect = GetItemEffect(gLastUsedItem);
    u32 i, pp, maxPP, moveId, loopEnd;
    u32 battler = MAX_BATTLERS_COUNT;
    struct Pokemon *mon = (IsOnPlayerSide(gBattlerAttacker)) ? &gPlayerParty[gBattleStruct->itemPartyIndex[gBattlerAttacker]] : &gEnemyParty[gBattleStruct->itemPartyIndex[gBattlerAttacker]];

    // Check whether to apply to all moves.
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
    else if (IsDoubleBattle()
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
    PREPARE_SPECIES_BUFFER(gBattleTextBuff1, GetMonData(mon, MON_DATA_SPECIES));
    gBattlescriptCurrInstr = cmd->nextInstr;
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

void BS_HandleMegaEvolution(void)
{
    NATIVE_ARGS(u8 battler, u8 caseId);

    u8 battler = GetBattlerForBattleScript(cmd->battler);
    HandleScriptMegaPrimalBurst(cmd->caseId, battler, HANDLE_TYPE_MEGA_EVOLUTION);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_HandlePrimalReversion(void)
{
    NATIVE_ARGS(u8 battler, u8 caseId);

    u8 battler = GetBattlerForBattleScript(cmd->battler);
    HandleScriptMegaPrimalBurst(cmd->caseId, battler, HANDLE_TYPE_PRIMAL_REVERSION);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_HandleUltraBurst(void)
{
    NATIVE_ARGS(u8 battler, u8 caseId);

    u8 battler = GetBattlerForBattleScript(cmd->battler);
    HandleScriptMegaPrimalBurst(cmd->caseId, battler, HANDLE_TYPE_ULTRA_BURST);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfShellTrap(void)
{
    NATIVE_ARGS(u8 battler, const u8 *jumpInstr);

    u8 battler = GetBattlerForBattleScript(cmd->battler);
    if (gProtectStructs[battler].shellTrap)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfElectricAbilityAffected(void)
{
    NATIVE_ARGS(u8 battler, u16 ability, const u8 *jumpInstr);
    u32 battler = GetBattlerForBattleScript(cmd->battler);

    if (IsElectricAbilityAffected(battler, cmd->ability))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_ApplySaltCure(void)
{
    NATIVE_ARGS(u8 battler);

    u8 battler = GetBattlerForBattleScript(cmd->battler);
    gStatuses4[battler] |= STATUS4_SALT_CURE;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfMovePropertyArgument(void)
{
    NATIVE_ARGS(u8 argument, const u8 *jumpInstr);

    if (GetMoveEffectArg_MoveProperty(gCurrentMove) == cmd->argument)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SetRemoveTerrain(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);
    u32 statusFlag = 0;

    switch (GetMoveEffect(gCurrentMove))
    {
    case EFFECT_MISTY_TERRAIN:
        statusFlag = STATUS_FIELD_MISTY_TERRAIN;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_SET_MISTY;
        break;
    case EFFECT_GRASSY_TERRAIN:
        statusFlag = STATUS_FIELD_GRASSY_TERRAIN;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_SET_GRASSY;
        break;
    case EFFECT_ELECTRIC_TERRAIN:
        statusFlag = STATUS_FIELD_ELECTRIC_TERRAIN;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_SET_ELECTRIC;
        break;
    case EFFECT_PSYCHIC_TERRAIN:
        statusFlag = STATUS_FIELD_PSYCHIC_TERRAIN;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_SET_PSYCHIC;
        break;
    case EFFECT_HIT_SET_REMOVE_TERRAIN:
        switch (GetMoveEffectArg_MoveProperty(gCurrentMove))
        {
        case ARG_SET_PSYCHIC_TERRAIN: // Genesis Supernova
            statusFlag = STATUS_FIELD_PSYCHIC_TERRAIN;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_SET_PSYCHIC;
            break;
        case ARG_TRY_REMOVE_TERRAIN_HIT: // Splintered Stormshards
        case ARG_TRY_REMOVE_TERRAIN_FAIL: // Steel Roller
            if (!(gFieldStatuses & STATUS_FIELD_TERRAIN_ANY))
            {
                // No terrain to remove, jump to battle script pointer.
                gBattlescriptCurrInstr = cmd->jumpInstr;
            }
            else
            {
                // Remove all terrains.
                RemoveAllTerrains();
                gBattlescriptCurrInstr = cmd->nextInstr;
            }
            return;
        default:
            break;
        }
        break;
    default:
        break;
    }

    if (gFieldStatuses & statusFlag || statusFlag == 0)
    {
        gBattlescriptCurrInstr = cmd->jumpInstr;
    }
    else
    {
        enum ItemHoldEffect atkHoldEffect = GetBattlerHoldEffect(gBattlerAttacker, TRUE);

        gFieldStatuses &= ~STATUS_FIELD_TERRAIN_ANY;
        gFieldStatuses |= statusFlag;
        gFieldTimers.terrainTimer = gBattleTurnCounter + (atkHoldEffect == HOLD_EFFECT_TERRAIN_EXTENDER) ? 8 : 5;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_JumpIfTerrainAffected(void)
{
    NATIVE_ARGS(u8 battler, u32 flags, const u8 *jumpInstr);
    u32 battler = GetBattlerForBattleScript(cmd->battler);

    if (IsBattlerTerrainAffected(battler, cmd->flags))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryReflectType(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    u16 targetBaseSpecies = GET_BASE_SPECIES_ID(gBattleMons[gBattlerTarget].species);
    u32 targetTypes[3];
    GetBattlerTypes(gBattlerTarget, FALSE, targetTypes);

    if (targetBaseSpecies == SPECIES_ARCEUS || targetBaseSpecies == SPECIES_SILVALLY)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_TERA)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (IS_BATTLER_TYPELESS(gBattlerTarget))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (targetTypes[0] == TYPE_MYSTERY && targetTypes[1] == TYPE_MYSTERY && targetTypes[2] != TYPE_MYSTERY)
    {
        gBattleMons[gBattlerAttacker].types[0] = TYPE_NORMAL;
        gBattleMons[gBattlerAttacker].types[1] = TYPE_NORMAL;
        gBattleMons[gBattlerAttacker].types[2] = targetTypes[2];
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else if (targetTypes[0] == TYPE_MYSTERY && targetTypes[1] != TYPE_MYSTERY)
    {
        gBattleMons[gBattlerAttacker].types[0] = targetTypes[1];
        gBattleMons[gBattlerAttacker].types[1] = targetTypes[1];
        gBattleMons[gBattlerAttacker].types[2] = targetTypes[2];
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else if (targetTypes[0] != TYPE_MYSTERY && targetTypes[1] == TYPE_MYSTERY)
    {
        gBattleMons[gBattlerAttacker].types[0] = targetTypes[0];
        gBattleMons[gBattlerAttacker].types[1] = targetTypes[0];
        gBattleMons[gBattlerAttacker].types[2] = targetTypes[2];
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattleMons[gBattlerAttacker].types[0] = targetTypes[0];
        gBattleMons[gBattlerAttacker].types[1] = targetTypes[1];
        gBattleMons[gBattlerAttacker].types[2] = targetTypes[2];
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_TrySetOctolock(void)
{
    NATIVE_ARGS(u8 battler, const u8 *failInstr);
    u32 battler = GetBattlerForBattleScript(cmd->battler);

    if (gDisableStructs[battler].octolock)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gDisableStructs[battler].octolock = TRUE;
        gBattleMons[battler].status2 |= STATUS2_ESCAPE_PREVENTION;
        gDisableStructs[battler].battlerPreventingEscape = gBattlerAttacker;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_SetGlaiveRush(void)
{
    NATIVE_ARGS();
    gStatuses4[gBattlerAttacker] |= STATUS4_GLAIVE_RUSH;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

// TODO: Convert this to a proper FORM_CHANGE type.
void BS_TryRelicSong(void)
{
    NATIVE_ARGS();

    if (GetBattlerAbility(gBattlerAttacker) != ABILITY_SHEER_FORCE && !(gBattleMons[gBattlerAttacker].status2 & STATUS2_TRANSFORMED)
        && (gBattleMons[gBattlerAttacker].species == SPECIES_MELOETTA_ARIA || gBattleMons[gBattlerAttacker].species == SPECIES_MELOETTA_PIROUETTE))
    {
        if (gBattleMons[gBattlerAttacker].species == SPECIES_MELOETTA_ARIA)
            gBattleMons[gBattlerAttacker].species = SPECIES_MELOETTA_PIROUETTE;
        else if (gBattleMons[gBattlerAttacker].species == SPECIES_MELOETTA_PIROUETTE)
            gBattleMons[gBattlerAttacker].species = SPECIES_MELOETTA_ARIA;

        BattleScriptPush(cmd->nextInstr);
        gBattlescriptCurrInstr = BattleScript_AttackerFormChangeMoveEffect;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_SetPledge(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);

    u32 partner = BATTLE_PARTNER(gBattlerAttacker);
    u32 partnerMove = gBattleMons[partner].moves[gBattleStruct->chosenMovePositions[partner]];
    u32 i = 0;
    u32 k = 0;

    if (gBattleStruct->pledgeMove && !(gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE))
    {
        PrepareStringBattle(STRINGID_USEDMOVE, gBattlerAttacker);
        gHitMarker |= HITMARKER_ATTACKSTRING_PRINTED;

        if ((gCurrentMove == MOVE_GRASS_PLEDGE && partnerMove == MOVE_WATER_PLEDGE)
         || (gCurrentMove == MOVE_WATER_PLEDGE && partnerMove == MOVE_GRASS_PLEDGE))
        {
            gCurrentMove = MOVE_GRASS_PLEDGE;
            gBattlescriptCurrInstr = BattleScript_EffectCombinedPledge_Grass;
        }
        else if ((gCurrentMove == MOVE_FIRE_PLEDGE && partnerMove == MOVE_GRASS_PLEDGE)
              || (gCurrentMove == MOVE_GRASS_PLEDGE && partnerMove == MOVE_FIRE_PLEDGE))
        {
            gCurrentMove = MOVE_FIRE_PLEDGE;
            gBattlescriptCurrInstr = BattleScript_EffectCombinedPledge_Fire;
        }
        else if ((gCurrentMove == MOVE_WATER_PLEDGE && partnerMove == MOVE_FIRE_PLEDGE)
              || (gCurrentMove == MOVE_FIRE_PLEDGE && partnerMove == MOVE_WATER_PLEDGE))
        {
            gCurrentMove = MOVE_WATER_PLEDGE;
            gBattlescriptCurrInstr = BattleScript_EffectCombinedPledge_Water;
        }

        gBattleCommunication[MSG_DISPLAY] = 0;
    }
    else if ((gChosenActionByBattler[partner] == B_ACTION_USE_MOVE)
          && IsDoubleBattle()
          && IsBattlerAlive(partner)
          && GetBattlerTurnOrderNum(gBattlerAttacker) < GetBattlerTurnOrderNum(partner)
          && !(gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE)
          && gCurrentMove != partnerMove
          && GetMoveEffect(partnerMove) == EFFECT_PLEDGE)
    {
        u32 currPledgeUser = 0;
        u32 newTurnOrder[] = {0xFF, 0xFF};

        for (i = 0; i < gBattlersCount; i++)
        {
            if (gBattlerByTurnOrder[i] == gBattlerAttacker)
            {
                currPledgeUser = i + 1; // Current battler going after attacker
                break;
            }
        }
        for (i = currPledgeUser; i < gBattlersCount; i++)
        {
            if (gBattlerByTurnOrder[i] != partner)
            {
                newTurnOrder[k] = gBattlerByTurnOrder[i];
                k++;
            }
        }

        gBattlerByTurnOrder[currPledgeUser] = partner;
        currPledgeUser++;

        for (i = 0; newTurnOrder[i] != 0xFF && i < 2; i++)
        {
            gBattlerByTurnOrder[currPledgeUser] = newTurnOrder[i];
            currPledgeUser++;
        }

        gBattleStruct->pledgeMove = TRUE;
        gBattleScripting.battler = partner;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattleStruct->pledgeMove = FALSE;
        gBattlescriptCurrInstr = cmd->jumpInstr;
    }
}

void BS_SetPledgeStatus(void)
{
    NATIVE_ARGS(u8 battler, u32 sideStatus);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    u32 side = GetBattlerSide(battler);

    gBattleStruct->pledgeMove = FALSE;
    if (!(gSideStatuses[side] & cmd->sideStatus))
    {
        gSideStatuses[side] |= cmd->sideStatus;

        switch (cmd->sideStatus)
        {
        case SIDE_STATUS_RAINBOW:
            gSideTimers[side].rainbowTimer = gBattleTurnCounter + 4;
            break;
        case SIDE_STATUS_SEA_OF_FIRE:
            gSideTimers[side].seaOfFireTimer = gBattleTurnCounter + 4;
            break;
        case SIDE_STATUS_SWAMP:
            gSideTimers[side].swampTimer = gBattleTurnCounter + 4;
        }

        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
        gBattlescriptCurrInstr = BattleScript_MoveEnd;
}

void BS_TryTrainerSlideZMoveMsg(void)
{
    NATIVE_ARGS();
    s32 shouldSlide;

    if ((shouldSlide = ShouldDoTrainerSlide(gBattlerAttacker, TRAINER_SLIDE_Z_MOVE)))
    {
        gBattleScripting.battler = gBattlerAttacker;
        BattleScriptPush(cmd->nextInstr);
        gBattlescriptCurrInstr = (shouldSlide == 1 ? BattleScript_TrainerASlideMsgRet : BattleScript_TrainerBSlideMsgRet);
    }
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryTrainerSlideMegaEvolutionMsg(void)
{
    NATIVE_ARGS();
    s32 shouldSlide;

    if ((shouldSlide = ShouldDoTrainerSlide(gBattlerAttacker, TRAINER_SLIDE_MEGA_EVOLUTION)))
    {
        gBattleScripting.battler = gBattlerAttacker;
        BattleScriptPush(cmd->nextInstr);
        gBattlescriptCurrInstr = (shouldSlide == 1 ? BattleScript_TrainerASlideMsgRet : BattleScript_TrainerBSlideMsgRet);
    }
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryTrainerSlideDynamaxMsg(void)
{
    NATIVE_ARGS();
    s32 shouldSlide;

    if ((shouldSlide = ShouldDoTrainerSlide(gBattleScripting.battler, TRAINER_SLIDE_DYNAMAX)))
    {
        BattleScriptPush(cmd->nextInstr);
        gBattlescriptCurrInstr = (shouldSlide == 1 ? BattleScript_TrainerASlideMsgRet : BattleScript_TrainerBSlideMsgRet);
    }
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryHealPulse(void)
{
    NATIVE_ARGS(const u8 *failInstr);

    if (IsBattlerAtMaxHp(gBattlerTarget))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        if (GetBattlerAbility(gBattlerAttacker) == ABILITY_MEGA_LAUNCHER && IsPulseMove(gCurrentMove))
            gBattleStruct->moveDamage[gBattlerTarget] = -(GetNonDynamaxMaxHP(gBattlerTarget) * 75 / 100);
        else if (gFieldStatuses & STATUS_FIELD_GRASSY_TERRAIN && GetMoveEffectArg_MoveProperty(gCurrentMove) == MOVE_EFFECT_FLORAL_HEALING)
            gBattleStruct->moveDamage[gBattlerTarget] = -(GetNonDynamaxMaxHP(gBattlerTarget) * 2 / 3);
        else
            gBattleStruct->moveDamage[gBattlerTarget] = -(GetNonDynamaxMaxHP(gBattlerTarget) / 2);

        if (gBattleStruct->moveDamage[gBattlerTarget] == 0)
            gBattleStruct->moveDamage[gBattlerTarget] = -1;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_TryCopycat(void)
{
    NATIVE_ARGS(const u8 *failInstr);

    if (gLastUsedMove == MOVE_NONE || gLastUsedMove == MOVE_UNAVAILABLE || IsMoveCopycatBanned(gLastUsedMove) || IsZMove(gLastUsedMove))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_Z_MOVE && !IsBattleMoveStatus(gLastUsedMove))
        {
            gBattleStruct->zmove.baseMoves[gBattlerAttacker] = gLastUsedMove;
            gCalledMove = GetTypeBasedZMove(gLastUsedMove);
        }
        else if (IsMaxMove(gLastUsedMove))
        {
            gCalledMove = gBattleStruct->dynamax.lastUsedBaseMove;
        }
        else
        {
            gCalledMove = gLastUsedMove;
        }

        gHitMarker &= ~HITMARKER_ATTACKSTRING_PRINTED;
        gBattlerTarget = GetBattleMoveTarget(gCalledMove, NO_TARGET_OVERRIDE);
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_TryDefog(void)
{
    NATIVE_ARGS(u8 clear, const u8 *failInstr);

    if (cmd->clear)
    {
        if (TryDefogClear(gEffectBattler, TRUE))
            return;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        if (TryDefogClear(gBattlerAttacker, FALSE))
            gBattlescriptCurrInstr = cmd->nextInstr;
        else
            gBattlescriptCurrInstr = cmd->failInstr;
    }
}

void BS_TryUpperHand(void)
{
    NATIVE_ARGS(const u8 *failInstr);

    u32 abilityDef = GetBattlerAbility(gBattlerTarget);
    u32 prio = GetChosenMovePriority(gBattlerTarget, abilityDef);

    if (GetBattlerTurnOrderNum(gBattlerAttacker) > GetBattlerTurnOrderNum(gBattlerTarget)
     || gChosenMoveByBattler[gBattlerTarget] == MOVE_NONE
     || IsBattleMoveStatus(gChosenMoveByBattler[gBattlerTarget])
     || prio < 1
     || prio > 3) // Fails if priority is less than 1 or greater than 3, if target already moved, or if using a status
        gBattlescriptCurrInstr = cmd->failInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryTriggerStatusForm(void)
{
    NATIVE_ARGS();
    if (TryBattleFormChange(gBattlerTarget, FORM_CHANGE_STATUS))
    {
        gBattleScripting.battler = gBattlerTarget;
        BattleScriptPush(cmd->nextInstr);
        gBattlescriptCurrInstr = BattleScript_TargetFormChangeWithStringNoPopup;
        return;
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_AllySwitchSwapBattler(void)
{
    NATIVE_ARGS();

    gBattleScripting.battler = gBattlerAttacker;
    gBattlerAttacker ^= BIT_FLANK;
    gProtectStructs[gBattlerAttacker].usedAllySwitch = TRUE;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_AllySwitchFailChance(void)
{
    NATIVE_ARGS(const u8 *failInstr);

    if (B_ALLY_SWITCH_FAIL_CHANCE >= GEN_9)
    {
        TryResetProtectUseCounter(gBattlerAttacker);
        if (sProtectSuccessRates[gDisableStructs[gBattlerAttacker].protectUses] < Random())
        {
            gDisableStructs[gBattlerAttacker].protectUses = 0;
            gBattlescriptCurrInstr = cmd->failInstr;
            return;
        }
        else
        {
            gDisableStructs[gBattlerAttacker].protectUses++;
        }
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_RunStatChangeItems(void)
{
    NATIVE_ARGS(u8 battler);

    // Change instruction before calling ItemBattleEffects.
    gBattlescriptCurrInstr = cmd->nextInstr;
    ItemBattleEffects(ITEMEFFECT_STATS_CHANGED, GetBattlerForBattleScript(cmd->battler), FALSE);
}

static void TryUpdateEvolutionTracker(u32 evolutionCondition, u32 upAmount, u16 usedMove)
{
    u32 i, j;

    if (IsOnPlayerSide(gBattlerAttacker)
     && !(gBattleTypeFlags & (BATTLE_TYPE_LINK
                             | BATTLE_TYPE_EREADER_TRAINER
                             | BATTLE_TYPE_RECORDED_LINK
                             | BATTLE_TYPE_TRAINER_HILL
                             | BATTLE_TYPE_FRONTIER)))
    {
        const struct Evolution *evolutions = GetSpeciesEvolutions(gBattleMons[gBattlerAttacker].species);
        if (evolutions == NULL)
            return;

        for (i = 0; evolutions[i].method != EVOLUTIONS_END; i++)
        {
            if (SanitizeSpeciesId(evolutions[i].targetSpecies) == SPECIES_NONE)
                continue;
            if (evolutions[i].params == NULL)
                continue;

            for (j = 0; evolutions[i].params[j].condition != CONDITIONS_END; j++)
            {
                if (evolutions[i].params[j].condition == evolutionCondition)
                {
                    // We only have 10 bits to use
                    u16 val = min(1023, GetMonData(GetBattlerMon(gBattlerAttacker), MON_DATA_EVOLUTION_TRACKER) + upAmount);
                    // Reset progress if you faint for the recoil method.
                    switch (evolutionCondition)
                    {
                        case IF_USED_MOVE_X_TIMES:
                            if (evolutions[i].params[j].arg1 == usedMove)
                                SetMonData(GetBattlerMon(gBattlerAttacker), MON_DATA_EVOLUTION_TRACKER, &val);
                            break;
                        case IF_RECOIL_DAMAGE_GE:
                            if (gBattleMons[gBattlerAttacker].hp == 0)
                                val = 0;
                            SetMonData(GetBattlerMon(gBattlerAttacker), MON_DATA_EVOLUTION_TRACKER, &val);
                            break;
                        case IF_DEFEAT_X_WITH_ITEMS:
                            if (GetMonData(GetBattlerMon(gBattlerTarget), MON_DATA_SPECIES) == evolutions[i].params[j].arg1
                             && GetMonData(GetBattlerMon(gBattlerTarget), MON_DATA_HELD_ITEM) == evolutions[i].params[j].arg2)
                                SetMonData(GetBattlerMon(gBattlerAttacker), MON_DATA_EVOLUTION_TRACKER, &val);
                            break;
                    }
                    return;
                }
            }
        }
    }
}

void BS_TryUpdateRecoilTracker(void)
{
    NATIVE_ARGS();
    TryUpdateEvolutionTracker(IF_RECOIL_DAMAGE_GE, gBattleStruct->moveDamage[gBattlerAttacker], MOVE_NONE);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryUpdateLeadersCrestTracker(void)
{
    NATIVE_ARGS();
    TryUpdateEvolutionTracker(IF_DEFEAT_X_WITH_ITEMS, 1, MOVE_NONE);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryTidyUp(void)
{
    NATIVE_ARGS(u8 clear, const u8 *jumpInstr);

    if (cmd->clear)
    {
        if (TryTidyUpClear(gEffectBattler, TRUE))
            return;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        if (TryTidyUpClear(gBattlerAttacker, FALSE))
            gBattlescriptCurrInstr = cmd->jumpInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_TryGulpMissile(void)
{
    NATIVE_ARGS();

    if ((gBattleMons[gBattlerAttacker].species == SPECIES_CRAMORANT)
     && (gCurrentMove == MOVE_DIVE)
     && (GetBattlerAbility(gBattlerAttacker) == ABILITY_GULP_MISSILE)
     && TryBattleFormChange(gBattlerAttacker, FORM_CHANGE_BATTLE_HP_PERCENT))
        gBattlescriptCurrInstr = BattleScript_GulpMissileFormChange;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryActivateGulpMissile(void)
{
    NATIVE_ARGS();

    if (!(gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
        && !gProtectStructs[gBattlerAttacker].confusionSelfDmg
        && IsBattlerAlive(gBattlerAttacker)
        && IsBattlerTurnDamaged(gBattlerTarget)
        && gBattleMons[gBattlerTarget].species != SPECIES_CRAMORANT
        && GetBattlerAbility(gBattlerTarget) == ABILITY_GULP_MISSILE)
    {
        if (GetBattlerAbility(gBattlerAttacker) != ABILITY_MAGIC_GUARD)
        {
            gBattleStruct->moveDamage[gBattlerTarget] = GetNonDynamaxMaxHP(gBattlerAttacker) / 4;
            if (gBattleStruct->moveDamage[gBattlerTarget] == 0)
                gBattleStruct->moveDamage[gBattlerTarget] = 1;
        }

        switch(gBattleMons[gBattlerTarget].species)
        {
            case SPECIES_CRAMORANT_GORGING:
                BattleScriptPushCursor();
                TryBattleFormChange(gBattlerTarget, FORM_CHANGE_HIT_BY_MOVE);
                gBattlescriptCurrInstr = BattleScript_GulpMissileGorging;
                return;
            case SPECIES_CRAMORANT_GULPING:
                BattleScriptPushCursor();
                TryBattleFormChange(gBattlerTarget, FORM_CHANGE_HIT_BY_MOVE);
                gBattlescriptCurrInstr = BattleScript_GulpMissileGulping;
                return;
        }
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryQuash(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    u32 i, j;

    // It's true if foe is faster, has a bigger priority, or switches
    if (GetBattlerTurnOrderNum(gBattlerAttacker) > GetBattlerTurnOrderNum(gBattlerTarget))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
        return;
    }

    // If the above condition is not true, it means we are faster than the foe, so we can set the quash bit
    gProtectStructs[gBattlerTarget].quash = TRUE;

    // this implementation assumes turn order is correct when using Quash
    i = GetBattlerTurnOrderNum(gBattlerTarget);
    for (j = i + 1; j < gBattlersCount; j++)
    {
        // Gen 7- config makes target go last so that the order of quash targets is kept for the correct turn order
        // Gen 8+ config alters Turn Order of the target according to speed, dynamic speed should handle the rest
        if (B_QUASH_TURN_ORDER < GEN_8 || GetWhichBattlerFaster(gBattlerByTurnOrder[i], gBattlerByTurnOrder[j], FALSE) == -1)
            SwapTurnOrder(i, j);
        else
            break;
        i++;
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_CopyFoesStatIncrease(void)
{
    NATIVE_ARGS(u8 battler, const u8 *jumpInstr);
    u32 stat = 0;
    u32 battler = GetBattlerForBattleScript(cmd->battler);

    if (gQueuedStatBoosts[battler].stats == 0)
    {
        for (stat = 0; stat < (NUM_BATTLE_STATS - 1); stat++)
        {
            if (gQueuedStatBoosts[battler].statChanges[stat] != 0)
                gQueuedStatBoosts[battler].stats |= (1 << stat);
        }
        gBattlescriptCurrInstr = cmd->jumpInstr;
        return;
    }

    for (stat = 0; stat < (NUM_BATTLE_STATS - 1); stat++)
    {
        if (gQueuedStatBoosts[battler].stats & (1 << stat))
        {
            if (gQueuedStatBoosts[battler].statChanges[stat] <= -1)
                SET_STATCHANGER(stat + 1, abs(gQueuedStatBoosts[battler].statChanges[stat]), TRUE);
            else
                SET_STATCHANGER(stat + 1, gQueuedStatBoosts[battler].statChanges[stat], FALSE);

            gQueuedStatBoosts[battler].stats &= ~(1 << stat);
            gBattlerTarget = battler;
            gBattlescriptCurrInstr = cmd->nextInstr;
            return;
        }
    }
    gBattlescriptCurrInstr = cmd->jumpInstr;
}

void BS_RemoveWeather(void)
{
    NATIVE_ARGS();
    RemoveAllWeather();
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_ApplyTerastallization(void)
{
    NATIVE_ARGS();
    ApplyBattlerVisualsForTeraAnim(gBattlerAttacker);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_DamageToQuarterTargetHP(void)
{
    NATIVE_ARGS();
    gBattleStruct->moveDamage[gBattlerTarget] = (3 * GetNonDynamaxHP(gBattlerTarget)) / 4;
    if (gBattleStruct->moveDamage[gBattlerTarget] == 0)
        gBattleStruct->moveDamage[gBattlerTarget] = 1;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfSleepClause(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);

    // Can freely sleep own partner
    if (IsDoubleBattle() && IsSleepClauseEnabled() && IsBattlerAlly(gBattlerAttacker, gBattlerTarget))
    {
        gBattleStruct->battlerState[gBattlerTarget].sleepClauseEffectExempt = TRUE;
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    gBattleStruct->battlerState[gBattlerTarget].sleepClauseEffectExempt = FALSE;
    // Can't sleep if clause is active otherwise
    if (IsSleepClauseActiveForSide(GetBattlerSide(gBattlerTarget)))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_FickleBeamDamageCalculation(void)
{
    NATIVE_ARGS();
    gBattleStruct->fickleBeamBoosted = FALSE;

    if (RandomPercentage(RNG_FICKLE_BEAM, 30))
    {
        gBattleStruct->fickleBeamBoosted = TRUE;
        gBattlescriptCurrInstr = BattleScript_FickleBeamDoubled;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_TryTarShot(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    if (gDisableStructs[gBattlerTarget].tarShot || GetActiveGimmick(gBattlerTarget) == GIMMICK_TERA)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gDisableStructs[gBattlerTarget].tarShot = TRUE;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_CanTarShotWork(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    // Tar Shot will fail if it's already been used on the target and its speed can't be lowered further
    if (!gDisableStructs[gBattlerTarget].tarShot
        && CompareStat(gBattlerTarget, STAT_SPEED, MAX_STAT_STAGE, CMP_LESS_THAN))
        gBattlescriptCurrInstr = cmd->nextInstr;
    else
        gBattlescriptCurrInstr = cmd->failInstr;
}

void BS_JumpIfBlockedBySoundproof(void)
{
    NATIVE_ARGS(u8 battler, const u8 *jumpInstr);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    if (IsSoundMove(gCurrentMove) && GetBattlerAbility(battler) == ABILITY_SOUNDPROOF)
    {
        gLastUsedAbility = ABILITY_SOUNDPROOF;
        gBattlescriptCurrInstr = cmd->jumpInstr;
        RecordAbilityBattle(battler, gLastUsedAbility);
        gBattlerAbility = battler;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_SetMagicCoatTarget(void)
{
    NATIVE_ARGS();
    gBattleStruct->attackerBeforeBounce = gBattleScripting.battler = gBattlerAttacker;
    gBattlerAttacker = gBattlerTarget;
    gBattlerTarget = gBattleStruct->attackerBeforeBounce;
    HandleMoveTargetRedirection();

    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TeatimeInvul(void)
{
    NATIVE_ARGS(u8 battler, const u8 *jumpInstr);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    if (GetItemPocket(gBattleMons[battler].item) == POCKET_BERRIES && !(gStatuses3[gBattlerTarget] & (STATUS3_SEMI_INVULNERABLE)))
        gBattlescriptCurrInstr = cmd->nextInstr;
    else
        gBattlescriptCurrInstr = cmd->jumpInstr;
}

void BS_TeatimeTargets(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    u32 count = 0, i;

    for (i = 0; i < gBattlersCount; i++)
    {
        if (IsTeatimeAffected(i))
            count++;
    }
    if (count == 0)
        gBattlescriptCurrInstr = cmd->failInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryWindRiderPower(void)
{
    NATIVE_ARGS(u8 battler, const u8 *failInstr);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    u16 ability = GetBattlerAbility(battler);
    if (IsBattlerAlly(battler, gBattlerAttacker)
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
}

void BS_ActivateWeatherChangeAbilities(void)
{
    NATIVE_ARGS(u8 battler);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    gBattlescriptCurrInstr = cmd->nextInstr;
    AbilityBattleEffects(ABILITYEFFECT_ON_WEATHER, battler, 0, 0, 0);
}

void BS_ActivateTerrainChangeAbilities(void)
{
    NATIVE_ARGS(u8 battler);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    gBattlescriptCurrInstr = cmd->nextInstr;
    AbilityBattleEffects(ABILITYEFFECT_ON_TERRAIN, battler, 0, 0, 0);
}

void BS_StoreHealingWish(void)
{
    NATIVE_ARGS(u8 battler);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    if (gCurrentMove == MOVE_LUNAR_DANCE)
        gBattleStruct->battlerState[battler].storedLunarDance = TRUE;
    else
        gBattleStruct->battlerState[battler].storedHealingWish = TRUE;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryRevivalBlessing(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    u8 index = GetFirstFaintedPartyIndex(gBattlerAttacker);

    // Move fails if there are no battlers to revive.
    if (index == PARTY_SIZE)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
        return;
    }

    // Battler selected! Revive and go to next instruction.
    if (gSelectedMonPartyId != PARTY_SIZE)
    {
        struct Pokemon *party = GetBattlerParty(gBattlerAttacker);

        u16 hp = GetMonData(&party[gSelectedMonPartyId], MON_DATA_MAX_HP) / 2;
        BtlController_EmitSetMonData(gBattlerAttacker, B_COMM_TO_CONTROLLER, REQUEST_HP_BATTLE, 1u << gSelectedMonPartyId, sizeof(hp), &hp);
        MarkBattlerForControllerExec(gBattlerAttacker);
        PREPARE_SPECIES_BUFFER(gBattleTextBuff1, GetMonData(&party[gSelectedMonPartyId], MON_DATA_SPECIES));

        // If an on-field battler is revived, it needs to be sent out again.
        if (IsDoubleBattle() &&
            gBattlerPartyIndexes[BATTLE_PARTNER(gBattlerAttacker)] == gSelectedMonPartyId)
        {
            u32 i = BATTLE_PARTNER(gBattlerAttacker);
            gAbsentBattlerFlags &= ~(1u << i);
            gBattleStruct->monToSwitchIntoId[i] = gSelectedMonPartyId;
            gBattleScripting.battler = i;
            gBattleCommunication[MULTIUSE_STATE] = TRUE;
        }

        gSelectedMonPartyId = PARTY_SIZE;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        // Open party menu, wait to go to next instruction.
        BtlController_EmitChoosePokemon(gBattlerAttacker, B_COMM_TO_CONTROLLER, PARTY_ACTION_CHOOSE_FAINTED_MON, PARTY_SIZE, ABILITY_NONE, gBattleStruct->battlerPartyOrders[gBattlerAttacker]);
        MarkBattlerForControllerExec(gBattlerAttacker);
    }
}

void BS_JumpIfCommanderActive(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);

    if (gBattleStruct->commanderActive[gBattlerTarget] != SPECIES_NONE)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else if (gStatuses3[gBattlerTarget] & STATUS3_COMMANDER)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void UpdatePokeFlutePartyStatus(struct Pokemon* party, u8 position)
{
    s32 i;
    u8 battler;
    u32 monToCheck, status;
    u16 species, abilityNum;
    monToCheck = 0;
    for (i = 0; i < PARTY_SIZE; i++)
    {
        species = GetMonData(&party[i], MON_DATA_SPECIES_OR_EGG);
        abilityNum = GetMonData(&party[i], MON_DATA_ABILITY_NUM);
        status = GetMonData(&party[i], MON_DATA_STATUS);
        if (species != SPECIES_NONE
            && species != SPECIES_EGG
            && status & AILMENT_FNT
            && GetAbilityBySpecies(species, abilityNum) != ABILITY_SOUNDPROOF)
            monToCheck |= (1 << i);
    }
    if (monToCheck)
    {
        battler = GetBattlerAtPosition(position);
        status = 0;
        BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, monToCheck, 4, &status);
        MarkBattlerForControllerExec(battler);
        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
    }
}

void BS_CheckPokeFlute(void)
{
    NATIVE_ARGS();
    gBattleCommunication[MULTISTRING_CHOOSER] = 0;

    s32 i;
    for (i = 0; i < gBattlersCount; i++)
    {
        if (GetBattlerAbility(i) != ABILITY_SOUNDPROOF)
        {
            gBattleMons[i].status1 &= ~STATUS1_SLEEP;
            gBattleMons[i].status2 &= ~STATUS2_NIGHTMARE;
        }
    }

    UpdatePokeFlutePartyStatus(gPlayerParty, B_POSITION_PLAYER_LEFT);
    UpdatePokeFlutePartyStatus(gEnemyParty, B_POSITION_OPPONENT_LEFT);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_WaitFanfare(void)
{
    NATIVE_ARGS();

    if (!IsFanfareTaskInactive())
        return;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SetBeakBlast(void)
{
    NATIVE_ARGS();
    gProtectStructs[gBattlerAttacker].beakBlastCharge = TRUE;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_RemoveTerrain(void)
{
    NATIVE_ARGS();
    RemoveAllTerrains();
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TrySpectralThiefSteal(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);

    if (gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }

    bool32 contrary = GetBattlerAbility(gBattlerAttacker) == ABILITY_CONTRARY;
    gBattleStruct->stolenStats[0] = 0; // Stats to steal.
    gBattleScripting.animArg1 = 0;
    for (u32 stat = STAT_ATK; stat < NUM_BATTLE_STATS; stat++)
    {
        if (gBattleMons[gBattlerTarget].statStages[stat] > DEFAULT_STAT_STAGE && gBattleMons[gBattlerAttacker].statStages[stat] != MAX_STAT_STAGE)
        {
            bool32 byTwo = FALSE;

            gBattleStruct->stolenStats[0] |= (1 << (stat));
            // Store by how many stages to raise the stat.
            gBattleStruct->stolenStats[stat] = gBattleMons[gBattlerTarget].statStages[stat] - DEFAULT_STAT_STAGE;

            while (gBattleMons[gBattlerAttacker].statStages[stat] + gBattleStruct->stolenStats[stat] > MAX_STAT_STAGE)
                gBattleStruct->stolenStats[stat]--;

            gBattleMons[gBattlerTarget].statStages[stat] = DEFAULT_STAT_STAGE;

            if (gBattleStruct->stolenStats[stat] >= 2)
                byTwo++;

            if (gBattleScripting.animArg1 == 0)
            {
                if (byTwo)
                    gBattleScripting.animArg1 = (contrary ? STAT_ANIM_MINUS2 : STAT_ANIM_PLUS2) + stat;
                else
                    gBattleScripting.animArg1 = (contrary ? STAT_ANIM_MINUS1 : STAT_ANIM_PLUS1) + stat;
            }
            else
            {
                if (byTwo)
                    gBattleScripting.animArg1 = (contrary ? STAT_ANIM_MULTIPLE_MINUS2 : STAT_ANIM_MULTIPLE_PLUS2);
                else
                    gBattleScripting.animArg1 = (contrary ? STAT_ANIM_MULTIPLE_MINUS1 : STAT_ANIM_MULTIPLE_PLUS1);
            }
        }
    }

    if (gBattleStruct->stolenStats[0] != 0)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SpectralThiefPrintStats(void)
{
    NATIVE_ARGS();

    for (u32 stat = STAT_ATK; stat < NUM_BATTLE_STATS; stat++)
    {
        if (gBattleStruct->stolenStats[0] & (1u << stat))
        {
            gBattleStruct->stolenStats[0] &= ~(1u << stat);
            SET_STATCHANGER(stat, gBattleStruct->stolenStats[stat], FALSE);
            if (ChangeStatBuffs(GET_STAT_BUFF_VALUE_WITH_SIGN(gBattleScripting.statChanger),
                                stat,
                                MOVE_EFFECT_CERTAIN | MOVE_EFFECT_AFFECTS_USER, NULL) == STAT_CHANGE_WORKED)
            {
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_StatUpMsg;
                return;
            }
        }
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SetMoveResultFlags(void)
{
    NATIVE_ARGS(u16 value);
    gBattleStruct->moveResultFlags[gBattlerTarget] |= cmd->value;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_ClearMoveResultFlags(void)
{
    NATIVE_ARGS(u16 value);
    gBattleStruct->moveResultFlags[gBattlerTarget] &= ~(cmd->value);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfMoveResultFlags(void)
{
    NATIVE_ARGS(u16 value, const u8 *jumpInstr);

    if (gBattleStruct->moveResultFlags[gBattlerTarget] & cmd->value)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfCriticalHit(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);

    if (gSpecialStatuses[gBattlerTarget].criticalHit)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SwapStats(void)
{
    NATIVE_ARGS(u8 stat);

    u32 stat = cmd->stat;
    u32 temp;

    switch (stat)
    {
    case STAT_HP:
        SWAP(gBattleMons[gBattlerAttacker].hp, gBattleMons[gBattlerTarget].hp, temp);
        break;
    case STAT_ATK:
        SWAP(gBattleMons[gBattlerAttacker].attack, gBattleMons[gBattlerTarget].attack, temp);
        break;
    case STAT_DEF:
        SWAP(gBattleMons[gBattlerAttacker].defense, gBattleMons[gBattlerTarget].defense, temp);
        break;
    case STAT_SPEED:
        SWAP(gBattleMons[gBattlerAttacker].speed, gBattleMons[gBattlerTarget].speed, temp);
        break;
    case STAT_SPATK:
        SWAP(gBattleMons[gBattlerAttacker].spAttack, gBattleMons[gBattlerTarget].spAttack, temp);
        break;
    case STAT_SPDEF:
        SWAP(gBattleMons[gBattlerAttacker].spDefense, gBattleMons[gBattlerTarget].spDefense, temp);
        break;
    }
    PREPARE_STAT_BUFFER(gBattleTextBuff1, stat);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void TrySetParalysis(const u8 *nextInstr, const u8 *failInstr)
{
    if (CanBeParalyzed(gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerTarget)))
    {
        gBattleMons[gBattlerTarget].status1 |= STATUS1_PARALYSIS;
        gBattleCommunication[MULTISTRING_CHOOSER] = 3;
        gEffectBattler = gBattlerTarget;
        BtlController_EmitSetMonData(gBattlerTarget, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[gBattlerTarget].status1), &gBattleMons[gBattlerTarget].status1);
        MarkBattlerForControllerExec(gBattlerTarget);
        gBattlescriptCurrInstr = nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = failInstr;
    }
}

static void TrySetPoison(const u8 *nextInstr, const u8 *failInstr)
{
    if (CanBePoisoned(gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerAttacker), GetBattlerAbility(gBattlerTarget)))
    {
        gBattleMons[gBattlerTarget].status1 |= STATUS1_POISON;
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
        gEffectBattler = gBattlerTarget;
        BtlController_EmitSetMonData(gBattlerTarget, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[gBattlerTarget].status1), &gBattleMons[gBattlerTarget].status1);
        MarkBattlerForControllerExec(gBattlerTarget);
        gBattlescriptCurrInstr = nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = failInstr;
    }
}

static void TrySetSleep(const u8 *nextInstr, const u8 *failInstr)
{
    if (CanBeSlept(gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerTarget), BLOCKED_BY_SLEEP_CLAUSE))
    {
        if (B_SLEEP_TURNS >= GEN_5)
            gBattleMons[gBattlerTarget].status1 |=  STATUS1_SLEEP_TURN((Random() % 3) + 2);
        else
            gBattleMons[gBattlerTarget].status1 |=  STATUS1_SLEEP_TURN((Random() % 4) + 3);

        TryActivateSleepClause(gBattlerTarget, gBattlerPartyIndexes[gBattlerTarget]);
        gBattleCommunication[MULTISTRING_CHOOSER] = 4;
        gEffectBattler = gBattlerTarget;
        BtlController_EmitSetMonData(gBattlerTarget, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[gBattlerTarget].status1), &gBattleMons[gBattlerTarget].status1);
        MarkBattlerForControllerExec(gBattlerTarget);
        gBattlescriptCurrInstr = nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = failInstr;
    }
}

void BS_TrySetParalysis(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    TrySetParalysis(cmd->nextInstr, cmd->failInstr);
}

void BS_TrySetPoison(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    TrySetPoison(cmd->nextInstr, cmd->failInstr);
}

void BS_TrySetPoisonParalyzis(void)
{
    NATIVE_ARGS(const u8 *failInstr);

    static const u32 sStunShockEffects[] = {STATUS1_PARALYSIS, STATUS1_POISON};
    u32 status = RandomElement(RNG_G_MAX_STUN_SHOCK, sStunShockEffects);

    if (status == STATUS1_PARALYSIS)
        TrySetParalysis(cmd->nextInstr, cmd->failInstr);
    else
        TrySetPoison(cmd->nextInstr, cmd->failInstr);
}

void BS_TrySetEffectSpore(void)
{
    NATIVE_ARGS(const u8 *failInstr);

    static const u32 sBefuddleEffects[] = {STATUS1_PARALYSIS, STATUS1_POISON, STATUS1_SLEEP};
    u32 status = RandomElement(RNG_G_MAX_BEFUDDLE, sBefuddleEffects);

    if (status == STATUS1_PARALYSIS)
        TrySetParalysis(cmd->nextInstr, cmd->failInstr);
    else if (status == STATUS1_POISON)
        TrySetPoison(cmd->nextInstr, cmd->failInstr);
    else
        TrySetSleep(cmd->nextInstr, cmd->failInstr);
}

void BS_TrySetConfusion(void)
{
    NATIVE_ARGS(const u8 *failInstr);

    if (CanBeConfused(gBattlerTarget))
    {
        gBattleMons[gBattlerTarget].status2 |= STATUS2_CONFUSION_TURN(((Random()) % 4) + 2);
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
        gBattleCommunication[MULTIUSE_STATE] = 1;
        gEffectBattler = gBattlerTarget;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

void BS_TrySetInfatuation(void)
{
    NATIVE_ARGS(const u8 *failInstr);

    if (!(gBattleMons[gBattlerTarget].status2 & STATUS2_INFATUATION)
        && gBattleMons[gBattlerTarget].ability != ABILITY_OBLIVIOUS
        && !IsAbilityOnSide(gBattlerTarget, ABILITY_AROMA_VEIL)
        && AreBattlersOfOppositeGender(gBattlerAttacker, gBattlerTarget))
    {
        gBattleMons[gBattlerTarget].status2 |= STATUS2_INFATUATED_WITH(gBattlerAttacker);
        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
        gBattleCommunication[MULTIUSE_STATE] = 2;
        gEffectBattler = gBattlerTarget;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

void BS_TrySetEscapePrevention(void)
{
    NATIVE_ARGS(const u8 *failInstr);

    if (!(gBattleMons[gBattlerTarget].status2 & STATUS2_ESCAPE_PREVENTION))
    {
        gBattleMons[gBattlerTarget].status2 |= STATUS2_ESCAPE_PREVENTION;
        gDisableStructs[gBattlerTarget].battlerPreventingEscape = gBattlerAttacker;
        gBattleCommunication[MULTISTRING_CHOOSER] = 2;
        gEffectBattler = gBattlerTarget;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

void BS_TrySetTorment(void)
{
    NATIVE_ARGS(const u8 *failInstr);

    if (!(gBattleMons[gBattlerTarget].status2 & STATUS2_TORMENT)
     && !IsAbilityOnSide(gBattlerTarget, ABILITY_AROMA_VEIL))
    {
        gBattleMons[gBattlerTarget].status2 |= STATUS2_TORMENT;
        gDisableStructs[gBattlerTarget].tormentTimer = gBattleTurnCounter + 3; // 3 turns excluding current turn
        gBattleCommunication[MULTISTRING_CHOOSER] = 3;
        gEffectBattler = gBattlerTarget;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

// Heals one-sixth of the target's HP, including for Dynamaxed targets.
void BS_HealOneSixth(void)
{
    NATIVE_ARGS(const u8* failInstr);
    gBattleStruct->moveDamage[gBattlerTarget] = gBattleMons[gBattlerTarget].maxHP / 6;
    if (gBattleStruct->moveDamage[gBattlerTarget] == 0)
        gBattleStruct->moveDamage[gBattlerTarget] = 1;
    gBattleStruct->moveDamage[gBattlerTarget] *= -1;

    if (gBattleMons[gBattlerTarget].hp == gBattleMons[gBattlerTarget].maxHP)
        gBattlescriptCurrInstr = cmd->failInstr;    // fail
    else
        gBattlescriptCurrInstr = cmd->nextInstr;    // can heal
}

// Recycles the target's item if it is specifically holding a berry.
void BS_TryRecycleBerry(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    u16* usedHeldItem = &gBattleStruct->usedHeldItems[gBattlerPartyIndexes[gBattlerTarget]][GetBattlerSide(gBattlerTarget)];
    if (gBattleMons[gBattlerTarget].item == ITEM_NONE
        && gBattleStruct->changedItems[gBattlerTarget] == ITEM_NONE   // Will not inherit an item
        && GetItemPocket(*usedHeldItem) == POCKET_BERRIES)
    {
        gLastUsedItem = *usedHeldItem;
        *usedHeldItem = ITEM_NONE;
        gBattleMons[gBattlerTarget].item = gLastUsedItem;

        BtlController_EmitSetMonData(gBattlerTarget, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[gBattlerTarget].item), &gBattleMons[gBattlerTarget].item);
        MarkBattlerForControllerExec(gBattlerTarget);

        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

// Sets up sharp steel on the target's side.
void BS_SetSteelsurge(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    u8 targetSide = GetBattlerSide(gBattlerTarget);
    if (gSideStatuses[targetSide] & SIDE_STATUS_STEELSURGE)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gSideStatuses[targetSide] |= SIDE_STATUS_STEELSURGE;
        gSideTimers[targetSide].steelsurgeAmount = 1;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_JumpIfIntimidateAbilityPrevented(void)
{
    NATIVE_ARGS();

    u32 hasAbility = FALSE;
    u32 ability = GetBattlerAbility(gBattlerTarget);

    switch (ability)
    {
    case ABILITY_INNER_FOCUS:
    case ABILITY_SCRAPPY:
    case ABILITY_OWN_TEMPO:
    case ABILITY_OBLIVIOUS:
        if (B_UPDATED_INTIMIDATE >= GEN_8)
        {
            hasAbility = TRUE;
            gBattlescriptCurrInstr = BattleScript_IntimidatePrevented;
        }
        else
        {
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        break;
    case ABILITY_GUARD_DOG:
        hasAbility = TRUE;
        gBattlescriptCurrInstr = BattleScript_IntimidateInReverse;
        break;
    default:
        gBattlescriptCurrInstr = cmd->nextInstr;
        break;
    }

    if (hasAbility)
    {
        gLastUsedAbility = ability;
        gBattlerAbility = gBattlerTarget;
        RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
    }
}

void BS_TryIntimidatEjectpack(void)
{
    NATIVE_ARGS();

    u32 affectedBattler = 0xFF;
    u32 battler = BATTLE_OPPOSITE(gBattlerAttacker);
    u32 partnerBattler = BATTLE_PARTNER(battler);

    bool32 ejectPackBattler = CanEjectPackTrigger(gBattlerAttacker, battler, MOVE_NONE);
    bool32 ejectPackPartnerBattler = CanEjectPackTrigger(gBattlerAttacker, partnerBattler, MOVE_NONE);

    if (ejectPackBattler && ejectPackPartnerBattler)
    {
        u32 battlerSpeed = GetBattlerTotalSpeedStat(battler);
        u32 partnerbattlerSpeed = GetBattlerTotalSpeedStat(partnerBattler);

        if (battlerSpeed >= partnerbattlerSpeed)
            affectedBattler = battler;
        else
            affectedBattler = partnerBattler;
    }
    else if (ejectPackBattler)
    {
        affectedBattler = battler;
    }
    else if (ejectPackPartnerBattler)
    {
        affectedBattler = partnerBattler;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
    if (affectedBattler != 0xFF)
    {
        gProtectStructs[battler].statFell = FALSE;
        gProtectStructs[partnerBattler].statFell = FALSE;
        gAiLogicData->ejectPackSwitch = TRUE;
        gBattleScripting.battler = affectedBattler;
        gLastUsedItem = gBattleMons[affectedBattler].item;
        RecordItemEffectBattle(affectedBattler, HOLD_EFFECT_EJECT_PACK);
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_EjectPackActivate_Ret;
    }
}

void BS_JumpIfCanGigantamax(void)
{
    NATIVE_ARGS(u8 battler, const u8 *jumpInstr);
    u32 battler = GetBattlerForBattleScript(cmd->battler);

    if (GetMonData(GetBattlerMon(battler), MON_DATA_GIGANTAMAX_FACTOR)
      && GetGMaxTargetSpecies(gBattleMons[battler].species) != SPECIES_NONE)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfLastUsedItemHoldEffect(void)
{
    NATIVE_ARGS(u8 holdEffect, u16 secondaryId, const u8 *jumpInstr);
    if (GetItemHoldEffect(gLastUsedItem) == cmd->holdEffect
        && (cmd->secondaryId == 0 || GetItemSecondaryId(gLastUsedItem) == cmd->secondaryId))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfNoWhiteOut(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);

    if (FlagGet(B_FLAG_NO_WHITEOUT))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}
