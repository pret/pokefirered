#include "global.h"
#include "battle.h"
#include "battle_hold_effects.h"
#include "battle_message.h"
#include "battle_anim.h"
#include "battle_anim_scripts.h"
#include "battle_ai_main.h"
#include "battle_ai_util.h"
#include "battle_scripts.h"
#include "battle_switch_in.h"
#include "battle_environment.h"
#include "battle_z_move.h"
#include "battle_move_resolution.h"
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
#include "constants/items.h"
#include "constants/item_effects.h"
#include "constants/moves.h"
#include "constants/party_menu.h"
#include "constants/rgb.h"
#include "constants/songs.h"
#include "constants/trainer_slide.h"
#include "constants/trainers.h"
#include "test/battle.h"
#include "battle_util.h"
#include "constants/pokemon.h"
#include "config/battle.h"
#include "data/battle_move_effects.h"
#include "test/battle.h"
#include "follower_npc.h"
#include "load_save.h"
#include "test/test_runner_battle.h"

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

static u32 ChangeStatBuffs(u32 battler, s8 statValue, enum Stat statId, union StatChangeFlags flags, u32 stats, const u8 *BS_ptr);
static void InitLevelUpBanner(void);
static bool8 SlideInLevelUpBanner(void);
static bool8 SlideOutLevelUpBanner(void);
static void DrawLevelUpWindow1(void);
static void DrawLevelUpWindow2(void);
static void PutMonIconOnLvlUpBanner(void);
static void DrawLevelUpBannerText(void);
static void SpriteCB_MonIconOnLvlUpBanner(struct Sprite *sprite);
static bool32 IsFinalStrikeEffect(enum MoveEffect moveEffect);
static void TryUpdateRoundTurnOrder(void);
void ApplyExperienceMultipliers(s32 *expAmount, u8 expGetterMonId, u8 faintedBattler);
static void RemoveAllWeather(void);
static void RemoveAllTerrains(void);
static bool32 CanAbilityPreventStatLoss(enum Ability abilityDef);
static void AccuracyCheck(bool32 recalcDragonDarts, const u8 *nextInstr, const u8 *failInstr);
static void ResetValuesForCalledMove(void);
static bool32 CanAbilityShieldActivateForBattler(u32 battler);

static void Cmd_attackcanceler(void);
static void Cmd_accuracycheck(void);
static void Cmd_printattackstring(void);
static void Cmd_printselectionstringfromtable(void);
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
static void Cmd_setpreattackadditionaleffect(void);
static void Cmd_setadditionaleffects(void);
static void Cmd_seteffectprimary(void);
static void Cmd_seteffectsecondary(void);
static void Cmd_clearvolatile(void);
static void Cmd_tryfaintmon(void);
static void Cmd_dofaintanimation(void);
static void Cmd_cleareffectsonfaint(void);
static void Cmd_jumpifstatus(void);
static void Cmd_jumpifvolatile(void);
static void Cmd_jumpifability(void);
static void Cmd_jumpifsideaffecting(void);
static void Cmd_jumpifstat(void);
static void Cmd_jumpifstatignorecontrary(void);
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
static void Cmd_isdmgblockedbydisguise(void);
static void Cmd_return(void);
static void Cmd_end(void);
static void Cmd_end2(void);
static void Cmd_end3(void);
static void Cmd_setchargingturn(void);
static void Cmd_call(void);
static void Cmd_setroost(void);
static void Cmd_jumpifabilitypresent(void);
static void Cmd_endselectionscript(void);
static void Cmd_playanimation(void);
static void Cmd_playanimation_var(void);
static void Cmd_jumpfifsemiinvulnerable(void);
static void Cmd_trainerslidein(void);
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
static void Cmd_switchinevents(void);
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
static void Cmd_futuresighttargetfailure(void);
static void Cmd_getpossiblenexttarget(void);
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
static void Cmd_unused_0x78(void);
static void Cmd_setprotectlike(void);
static void Cmd_tryexplosion(void);
static void Cmd_setatkhptozero(void);
static void Cmd_jumpifnexttargetvalid(void);
static void Cmd_tryhealhalfhealth(void);
static void Cmd_unused_0x7e(void);
static void Cmd_setfieldweather(void);
static void Cmd_setreflect(void);
static void Cmd_setseeded(void);
static void Cmd_manipulatedamage(void);
static void Cmd_trysetrest(void);
static void Cmd_unused_0x82(void);
static void Cmd_unused_0x83(void);
static void Cmd_jumpifuproarwakes(void);
static void Cmd_stockpile(void);
static void Cmd_stockpiletobasedamage(void);
static void Cmd_stockpiletohpheal(void);
static void Cmd_unused_0x88(void);
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
static void Cmd_checknonvolatiletrigger(void);
static void Cmd_copybidedmg(void);
static void Cmd_animatewildpokemonafterfailedpokeball(void);
static void Cmd_tryinfatuating(void);
static void Cmd_updatestatusicon(void);
static void Cmd_setmist(void);
static void Cmd_setfocusenergy(void);
static void Cmd_transformdataexecution(void);
static void Cmd_setsubstitute(void);
static void Cmd_mimicattackcopy(void);
static void Cmd_setcalledmove(void);
static void Cmd_unused_0x9f(void);
static void Cmd_unused_0xA0(void);
static void Cmd_unused_0xA1(void);
static void Cmd_unused_0xA2(void);
static void Cmd_disablelastusedattack(void);
static void Cmd_trysetencore(void);
static void Cmd_painsplitdmgcalc(void);
static void Cmd_settypetorandomresistance(void);
static void Cmd_setalwayshitflag(void);
static void Cmd_copymovepermanently(void);
static void Cmd_unused_0xA9(void);
static void Cmd_unused_AA(void);
static void Cmd_unused_0xab(void);
static void Cmd_settailwind(void);
static void Cmd_tryspiteppreduce(void);
static void Cmd_healpartystatus(void);
static void Cmd_cursetarget(void);
static void Cmd_trysetspikes(void);
static void Cmd_setvolatile(void);
static void Cmd_trysetperishsong(void);
static void Cmd_unused_0xb3(void);
static void Cmd_jumpifconfusedandstatmaxed(void);
static void Cmd_unused_0xb5(void);
static void Cmd_setembargo(void);
static void Cmd_presentdamagecalculation(void);
static void Cmd_setsafeguard(void);
static void Cmd_magnitudedamagecalculation(void);
static void Cmd_jumpifnopursuitswitchdmg(void);
static void Cmd_tryactivateitem(void);
static void Cmd_halvehp(void);
static void Cmd_copyfoestats(void);
static void Cmd_rapidspinfree(void);
static void Cmd_unused_0xBF(void);
static void Cmd_recoverbasedonsunlight(void);
static void Cmd_setstickyweb(void);
static void Cmd_selectfirstvalidtarget(void);
static void Cmd_setfutureattack(void);
static void Cmd_trydobeatup(void);
static void Cmd_setsemiinvulnerablebit(void);
static void Cmd_unused_0xC6(void);
static void Cmd_unused_0xC7(void);
static void Cmd_unused_c8(void);
static void Cmd_trymemento(void);
static void Cmd_setforcedtarget(void);
static void Cmd_unused_0xcb(void);
static void Cmd_unused_0xCC(void);
static void Cmd_curestatuswithmove(void);
static void Cmd_settorment(void);
static void Cmd_unused_0xCF(void);
static void Cmd_settaunt(void);
static void Cmd_trysethelpinghand(void);
static void Cmd_tryswapitems(void);
static void Cmd_trycopyability(void);
static void Cmd_trywish(void);
static void Cmd_settoxicspikes(void);
static void Cmd_setgastroacid(void);
static void Cmd_setyawn(void);
static void Cmd_unused0xd8(void);
static void Cmd_setroom(void);
static void Cmd_tryswapabilities(void);
static void Cmd_tryimprison(void);
static void Cmd_setstealthrock(void);
static void Cmd_trysetvolatile(void);
static void Cmd_unused_0xde(void);
static void Cmd_trysetmagiccoat(void);
static void Cmd_trysetsnatch(void);
static void Cmd_unused2(void);
static void Cmd_switchoutabilities(void);
static void Cmd_jumpifhasnohp(void);
static void Cmd_unused_0xE4(void);
static void Cmd_pickup(void);
static void Cmd_unused_0xE6(void);
static void Cmd_unused_0xE7(void);
static void Cmd_settypebasedhalvers(void);
static void Cmd_jumpifsubstituteblocks(void);
static void Cmd_tryrecycleitem(void);
static void Cmd_settypetoenvironment(void);
static void Cmd_pursuitdoubles(void);
static void Cmd_snatchsetbattlers(void);
static void Cmd_unused_0xee(void);
static void Cmd_handleballthrow(void);
static void Cmd_givecaughtmon(void);
static void Cmd_trysetcaughtmondexflags(void);
static void Cmd_displaydexinfo(void);
static void Cmd_trygivecaughtmonnick(void);
static void Cmd_sortbattlers(void);
static void Cmd_removeattackerstatus1(void);
static void Cmd_finishaction(void);
static void Cmd_finishturn(void);
static void Cmd_trainerslideout(void);
static void Cmd_settelekinesis(void);
static void Cmd_swapstatstages(void);
static void Cmd_averagestats(void);
static void Cmd_jumpifcaptivateaffected(void);
static void Cmd_setnonvolatilestatus(void);
static void Cmd_tryoverwriteability(void);
static void Cmd_callnative(void);

void (*const gBattleScriptingCommandsTable[])(void) =
{
    [B_SCR_OP_ATTACKCANCELER]                        = Cmd_attackcanceler,
    [B_SCR_OP_ACCURACYCHECK]                         = Cmd_accuracycheck,
    [B_SCR_OP_PRINTATTACKSTRING]                     = Cmd_printattackstring,
    [B_SCR_OP_PRINTSELECTIONSTRINGFROMTABLE]         = Cmd_printselectionstringfromtable,
    [B_SCR_OP_CRITCALC]                              = Cmd_critcalc,
    [B_SCR_OP_DAMAGECALC]                            = Cmd_damagecalc,
    [B_SCR_OP_TYPECALC]                              = Cmd_typecalc,
    [B_SCR_OP_ADJUSTDAMAGE]                          = Cmd_adjustdamage,
    [B_SCR_OP_MULTIHITRESULTMESSAGE]                 = Cmd_multihitresultmessage,
    [B_SCR_OP_ATTACKANIMATION]                       = Cmd_attackanimation,
    [B_SCR_OP_WAITANIMATION]                         = Cmd_waitanimation,
    [B_SCR_OP_HEALTHBARUPDATE]                       = Cmd_healthbarupdate,
    [B_SCR_OP_DATAHPUPDATE]                          = Cmd_datahpupdate,
    [B_SCR_OP_CRITMESSAGE]                           = Cmd_critmessage,
    [B_SCR_OP_EFFECTIVENESSSOUND]                    = Cmd_effectivenesssound,
    [B_SCR_OP_RESULTMESSAGE]                         = Cmd_resultmessage,
    [B_SCR_OP_PRINTSTRING]                           = Cmd_printstring,
    [B_SCR_OP_PRINTSELECTIONSTRING]                  = Cmd_printselectionstring,
    [B_SCR_OP_WAITMESSAGE]                           = Cmd_waitmessage,
    [B_SCR_OP_PRINTFROMTABLE]                        = Cmd_printfromtable,
    [B_SCR_OP_SETPREATTACKADDITIONALEFFECT]          = Cmd_setpreattackadditionaleffect,
    [B_SCR_OP_SETADDITIONALEFFECTS]                  = Cmd_setadditionaleffects,
    [B_SCR_OP_SETEFFECTPRIMARY]                      = Cmd_seteffectprimary,
    [B_SCR_OP_SETEFFECTSECONDARY]                    = Cmd_seteffectsecondary,
    [B_SCR_OP_CLEARVOLATILE]                         = Cmd_clearvolatile,
    [B_SCR_OP_TRYFAINTMON]                           = Cmd_tryfaintmon,
    [B_SCR_OP_DOFAINTANIMATION]                      = Cmd_dofaintanimation,
    [B_SCR_OP_CLEAREFFECTSONFAINT]                   = Cmd_cleareffectsonfaint,
    [B_SCR_OP_JUMPIFSTATUS]                          = Cmd_jumpifstatus,
    [B_SCR_OP_JUMPIFVOLATILE]                        = Cmd_jumpifvolatile,
    [B_SCR_OP_JUMPIFABILITY]                         = Cmd_jumpifability,
    [B_SCR_OP_JUMPIFSIDEAFFECTING]                   = Cmd_jumpifsideaffecting,
    [B_SCR_OP_JUMPIFSTAT]                            = Cmd_jumpifstat,
    [B_SCR_OP_JUMPIFSTATIGNORECONTRARY]              = Cmd_jumpifstatignorecontrary,
    [B_SCR_OP_JUMPBASEDONTYPE]                       = Cmd_jumpbasedontype,
    [B_SCR_OP_GETEXP]                                = Cmd_getexp,
    [B_SCR_OP_CHECKTEAMSLOST]                        = Cmd_checkteamslost,
    [B_SCR_OP_MOVEVALUESCLEANUP]                     = Cmd_movevaluescleanup,
    [B_SCR_OP_SETMULTIHIT]                           = Cmd_setmultihit,
    [B_SCR_OP_DECREMENTMULTIHIT]                     = Cmd_decrementmultihit,
    [B_SCR_OP_GOTO]                                  = Cmd_goto,
    [B_SCR_OP_JUMPIFBYTE]                            = Cmd_jumpifbyte,
    [B_SCR_OP_JUMPIFHALFWORD]                        = Cmd_jumpifhalfword,
    [B_SCR_OP_JUMPIFWORD]                            = Cmd_jumpifword,
    [B_SCR_OP_JUMPIFARRAYEQUAL]                      = Cmd_jumpifarrayequal,
    [B_SCR_OP_JUMPIFARRAYNOTEQUAL]                   = Cmd_jumpifarraynotequal,
    [B_SCR_OP_SETBYTE]                               = Cmd_setbyte,
    [B_SCR_OP_ADDBYTE]                               = Cmd_addbyte,
    [B_SCR_OP_SUBBYTE]                               = Cmd_subbyte,
    [B_SCR_OP_COPYARRAY]                             = Cmd_copyarray,
    [B_SCR_OP_COPYARRAYWITHINDEX]                    = Cmd_copyarraywithindex,
    [B_SCR_OP_ORBYTE]                                = Cmd_orbyte,
    [B_SCR_OP_ORHALFWORD]                            = Cmd_orhalfword,
    [B_SCR_OP_ORWORD]                                = Cmd_orword,
    [B_SCR_OP_BICBYTE]                               = Cmd_bicbyte,
    [B_SCR_OP_BICHALFWORD]                           = Cmd_bichalfword,
    [B_SCR_OP_BICWORD]                               = Cmd_bicword,
    [B_SCR_OP_PAUSE]                                 = Cmd_pause,
    [B_SCR_OP_WAITSTATE]                             = Cmd_waitstate,
    [B_SCR_OP_ISDMGBLOCKEDBYDISGUISE]                = Cmd_isdmgblockedbydisguise,
    [B_SCR_OP_RETURN]                                = Cmd_return,
    [B_SCR_OP_END]                                   = Cmd_end,
    [B_SCR_OP_END2]                                  = Cmd_end2,
    [B_SCR_OP_END3]                                  = Cmd_end3,
    [B_SCR_OP_SETCHARGINGTURN]                       = Cmd_setchargingturn,
    [B_SCR_OP_CALL]                                  = Cmd_call,
    [B_SCR_OP_SETROOST]                              = Cmd_setroost,
    [B_SCR_OP_JUMPIFABILITYPRESENT]                  = Cmd_jumpifabilitypresent,
    [B_SCR_OP_ENDSELECTIONSCRIPT]                    = Cmd_endselectionscript,
    [B_SCR_OP_PLAYANIMATION]                         = Cmd_playanimation,
    [B_SCR_OP_PLAYANIMATION_VAR]                     = Cmd_playanimation_var,
    [B_SCR_OP_JUMPFIFSEMIINVULNERABLE]               = Cmd_jumpfifsemiinvulnerable,
    [B_SCR_OP_TRAINERSLIDEIN]                        = Cmd_trainerslidein,
    [B_SCR_OP_MOVEEND]                               = Cmd_moveend,
    [B_SCR_OP_SETHEALBLOCK]                          = Cmd_sethealblock,
    [B_SCR_OP_RETURNATKTOBALL]                       = Cmd_returnatktoball,
    [B_SCR_OP_GETSWITCHEDMONDATA]                    = Cmd_getswitchedmondata,
    [B_SCR_OP_SWITCHINDATAUPDATE]                    = Cmd_switchindataupdate,
    [B_SCR_OP_SWITCHINANIM]                          = Cmd_switchinanim,
    [B_SCR_OP_JUMPIFCANTSWITCH]                      = Cmd_jumpifcantswitch,
    [B_SCR_OP_OPENPARTYSCREEN]                       = Cmd_openpartyscreen,
    [B_SCR_OP_SWITCHHANDLEORDER]                     = Cmd_switchhandleorder,
    [B_SCR_OP_SWITCHINEFFECTS]                       = Cmd_switchineffects,
    [B_SCR_OP_SWITCHINEVENTS]                        = Cmd_switchinevents,
    [B_SCR_OP_PLAYSE]                                = Cmd_playse,
    [B_SCR_OP_FANFARE]                               = Cmd_fanfare,
    [B_SCR_OP_PLAYFAINTCRY]                          = Cmd_playfaintcry,
    [B_SCR_OP_ENDLINKBATTLE]                         = Cmd_endlinkbattle,
    [B_SCR_OP_RETURNTOBALL]                          = Cmd_returntoball,
    [B_SCR_OP_HANDLELEARNNEWMOVE]                    = Cmd_handlelearnnewmove,
    [B_SCR_OP_YESNOBOXLEARNMOVE]                     = Cmd_yesnoboxlearnmove,
    [B_SCR_OP_YESNOBOXSTOPLEARNINGMOVE]              = Cmd_yesnoboxstoplearningmove,
    [B_SCR_OP_HITANIMATION]                          = Cmd_hitanimation,
    [B_SCR_OP_GETMONEYREWARD]                        = Cmd_getmoneyreward,
    [B_SCR_OP_UPDATEBATTLERMOVES]                    = Cmd_updatebattlermoves,
    [B_SCR_OP_SWAPATTACKERWITHTARGET]                = Cmd_swapattackerwithtarget,
    [B_SCR_OP_INCREMENTGAMESTAT]                     = Cmd_incrementgamestat,
    [B_SCR_OP_DRAWPARTYSTATUSSUMMARY]                = Cmd_drawpartystatussummary,
    [B_SCR_OP_HIDEPARTYSTATUSSUMMARY]                = Cmd_hidepartystatussummary,
    [B_SCR_OP_JUMPTOCALLEDMOVE]                      = Cmd_jumptocalledmove,
    [B_SCR_OP_STATUSANIMATION]                       = Cmd_statusanimation,
    [B_SCR_OP_FUTURESIGHTTARGETFAILURE]              = Cmd_futuresighttargetfailure,
    [B_SCR_OP_GETPOSSIBLENEXTTARGET]                 = Cmd_getpossiblenexttarget,
    [B_SCR_OP_YESNOBOX]                              = Cmd_yesnobox,
    [B_SCR_OP_CANCELALLACTIONS]                      = Cmd_cancelallactions,
    [B_SCR_OP_SETGRAVITY]                            = Cmd_setgravity,
    [B_SCR_OP_REMOVEITEM]                            = Cmd_removeitem,
    [B_SCR_OP_ATKNAMEINBUFF1]                        = Cmd_atknameinbuff1,
    [B_SCR_OP_DRAWLVLUPBOX]                          = Cmd_drawlvlupbox,
    [B_SCR_OP_RESETSENTMONSVALUE]                    = Cmd_resetsentmonsvalue,
    [B_SCR_OP_SETATKTOPLAYER0]                       = Cmd_setatktoplayer0,
    [B_SCR_OP_MAKEVISIBLE]                           = Cmd_makevisible,
    [B_SCR_OP_RECORDABILITY]                         = Cmd_recordability,
    [B_SCR_OP_BUFFERMOVETOLEARN]                     = Cmd_buffermovetolearn,
    [B_SCR_OP_JUMPIFPLAYERRAN]                       = Cmd_jumpifplayerran,
    [B_SCR_OP_HPTHRESHOLDS]                          = Cmd_hpthresholds,
    [B_SCR_OP_HPTHRESHOLDS2]                         = Cmd_hpthresholds2,
    [B_SCR_OP_USEITEMONOPPONENT]                     = Cmd_useitemonopponent,
    [B_SCR_OP_UNUSED_0X78]                           = Cmd_unused_0x78,
    [B_SCR_OP_SETPROTECTLIKE]                        = Cmd_setprotectlike,
    [B_SCR_OP_TRYEXPLOSION]                          = Cmd_tryexplosion,
    [B_SCR_OP_SETATKHPTOZERO]                        = Cmd_setatkhptozero,
    [B_SCR_OP_JUMPIFNEXTTARGETVALID]                 = Cmd_jumpifnexttargetvalid,
    [B_SCR_OP_TRYHEALHALFHEALTH]                     = Cmd_tryhealhalfhealth,
    [B_SCR_OP_UNUSED_0X7E]                           = Cmd_unused_0x7e,
    [B_SCR_OP_SETFIELDWEATHER]                       = Cmd_setfieldweather,
    [B_SCR_OP_SETREFLECT]                            = Cmd_setreflect,
    [B_SCR_OP_SETSEEDED]                             = Cmd_setseeded,
    [B_SCR_OP_MANIPULATEDAMAGE]                      = Cmd_manipulatedamage,
    [B_SCR_OP_TRYSETREST]                            = Cmd_trysetrest,
    [B_SCR_OP_UNUSED_0X82]                           = Cmd_unused_0x82,
    [B_SCR_OP_UNUSED_0X83]                           = Cmd_unused_0x83,
    [B_SCR_OP_JUMPIFUPROARWAKES]                     = Cmd_jumpifuproarwakes,
    [B_SCR_OP_STOCKPILE]                             = Cmd_stockpile,
    [B_SCR_OP_STOCKPILETOBASEDAMAGE]                 = Cmd_stockpiletobasedamage,
    [B_SCR_OP_STOCKPILETOHPHEAL]                     = Cmd_stockpiletohpheal,
    [B_SCR_OP_UNUSED_0X88]                           = Cmd_unused_0x88,
    [B_SCR_OP_STATBUFFCHANGE]                        = Cmd_statbuffchange,
    [B_SCR_OP_NORMALISEBUFFS]                        = Cmd_normalisebuffs,
    [B_SCR_OP_SETBIDE]                               = Cmd_setbide,
    [B_SCR_OP_TWOTURNMOVESCHARGESTRINGANDANIMATION]  = Cmd_twoturnmoveschargestringandanimation,
    [B_SCR_OP_TRYNONVOLATILESTATUS]                  = Cmd_trynonvolatilestatus,
    [B_SCR_OP_INITMULTIHITSTRING]                    = Cmd_initmultihitstring,
    [B_SCR_OP_FORCERANDOMSWITCH]                     = Cmd_forcerandomswitch,
    [B_SCR_OP_TRYCONVERSIONTYPECHANGE]               = Cmd_tryconversiontypechange,
    [B_SCR_OP_GIVEPAYDAYMONEY]                       = Cmd_givepaydaymoney,
    [B_SCR_OP_SETLIGHTSCREEN]                        = Cmd_setlightscreen,
    [B_SCR_OP_TRYKO]                                 = Cmd_tryKO,
    [B_SCR_OP_CHECKNONVOLATILETRIGGER]               = Cmd_checknonvolatiletrigger,
    [B_SCR_OP_COPYBIDEDMG]                           = Cmd_copybidedmg,
    [B_SCR_OP_ANIMATEWILDPOKEMONAFTERFAILEDPOKEBALL] = Cmd_animatewildpokemonafterfailedpokeball,
    [B_SCR_OP_TRYINFATUATING]                        = Cmd_tryinfatuating,
    [B_SCR_OP_UPDATESTATUSICON]                      = Cmd_updatestatusicon,
    [B_SCR_OP_SETMIST]                               = Cmd_setmist,
    [B_SCR_OP_SETFOCUSENERGY]                        = Cmd_setfocusenergy,
    [B_SCR_OP_TRANSFORMDATAEXECUTION]                = Cmd_transformdataexecution,
    [B_SCR_OP_SETSUBSTITUTE]                         = Cmd_setsubstitute,
    [B_SCR_OP_MIMICATTACKCOPY]                       = Cmd_mimicattackcopy,
    [B_SCR_OP_SETCALLEDMOVE]                         = Cmd_setcalledmove,
    [B_SCR_OP_UNUSED_0X9F]                           = Cmd_unused_0x9f,
    [B_SCR_OP_UNUSED_0XA0]                           = Cmd_unused_0xA0,
    [B_SCR_OP_UNUSED_0XA1]                           = Cmd_unused_0xA1,
    [B_SCR_OP_UNUSED_0XA2]                           = Cmd_unused_0xA2,
    [B_SCR_OP_DISABLELASTUSEDATTACK]                 = Cmd_disablelastusedattack,
    [B_SCR_OP_TRYSETENCORE]                          = Cmd_trysetencore,
    [B_SCR_OP_PAINSPLITDMGCALC]                      = Cmd_painsplitdmgcalc,
    [B_SCR_OP_SETTYPETORANDOMRESISTANCE]             = Cmd_settypetorandomresistance,
    [B_SCR_OP_SETALWAYSHITFLAG]                      = Cmd_setalwayshitflag,
    [B_SCR_OP_COPYMOVEPERMANENTLY]                   = Cmd_copymovepermanently,
    [B_SCR_OP_UNUSED_0XA9]                           = Cmd_unused_0xA9,
    [B_SCR_OP_UNUSED_AA]                             = Cmd_unused_AA,
    [B_SCR_OP_UNUSED_0XAB]                           = Cmd_unused_0xab,
    [B_SCR_OP_SETTAILWIND]                           = Cmd_settailwind,
    [B_SCR_OP_TRYSPITEPPREDUCE]                      = Cmd_tryspiteppreduce,
    [B_SCR_OP_HEALPARTYSTATUS]                       = Cmd_healpartystatus,
    [B_SCR_OP_CURSETARGET]                           = Cmd_cursetarget,
    [B_SCR_OP_TRYSETSPIKES]                          = Cmd_trysetspikes,
    [B_SCR_OP_SETVOLATILE]                           = Cmd_setvolatile,
    [B_SCR_OP_TRYSETPERISHSONG]                      = Cmd_trysetperishsong,
    [B_SCR_OP_UNUSED_0XB3]                           = Cmd_unused_0xb3,
    [B_SCR_OP_JUMPIFCONFUSEDANDSTATMAXED]            = Cmd_jumpifconfusedandstatmaxed,
    [B_SCR_OP_UNUSED_0XB5]                           = Cmd_unused_0xb5,
    [B_SCR_OP_SETEMBARGO]                            = Cmd_setembargo,
    [B_SCR_OP_PRESENTDAMAGECALCULATION]              = Cmd_presentdamagecalculation,
    [B_SCR_OP_SETSAFEGUARD]                          = Cmd_setsafeguard,
    [B_SCR_OP_MAGNITUDEDAMAGECALCULATION]            = Cmd_magnitudedamagecalculation,
    [B_SCR_OP_JUMPIFNOPURSUITSWITCHDMG]              = Cmd_jumpifnopursuitswitchdmg,
    [B_SCR_OP_TRYACTIVATEITEM]                       = Cmd_tryactivateitem,
    [B_SCR_OP_HALVEHP]                               = Cmd_halvehp,
    [B_SCR_OP_COPYFOESTATS]                          = Cmd_copyfoestats,
    [B_SCR_OP_RAPIDSPINFREE]                         = Cmd_rapidspinfree,
    [B_SCR_OP_UNUSED_0XBF]                           = Cmd_unused_0xBF,
    [B_SCR_OP_RECOVERBASEDONSUNLIGHT]                = Cmd_recoverbasedonsunlight,
    [B_SCR_OP_SETSTICKYWEB]                          = Cmd_setstickyweb,
    [B_SCR_OP_SELECTFIRSTVALIDTARGET]                = Cmd_selectfirstvalidtarget,
    [B_SCR_OP_SETFUTUREATTACK]                       = Cmd_setfutureattack,
    [B_SCR_OP_TRYDOBEATUP]                           = Cmd_trydobeatup,
    [B_SCR_OP_SETSEMIINVULNERABLEBIT]                = Cmd_setsemiinvulnerablebit,
    [B_SCR_OP_UNUSED_0XC6]                           = Cmd_unused_0xC6,
    [B_SCR_OP_UNUSED_0XC7]                           = Cmd_unused_0xC7,
    [B_SCR_OP_UNUSED_C8]                             = Cmd_unused_c8,
    [B_SCR_OP_TRYMEMENTO]                            = Cmd_trymemento,
    [B_SCR_OP_SETFORCEDTARGET]                       = Cmd_setforcedtarget,
    [B_SCR_OP_UNUSED_0XCB]                           = Cmd_unused_0xcb,
    [B_SCR_OP_UNUSED_0XCC]                           = Cmd_unused_0xCC,
    [B_SCR_OP_CURESTATUSWITHMOVE]                    = Cmd_curestatuswithmove,
    [B_SCR_OP_SETTORMENT]                            = Cmd_settorment,
    [B_SCR_OP_UNUSED_0XCF]                           = Cmd_unused_0xCF,
    [B_SCR_OP_SETTAUNT]                              = Cmd_settaunt,
    [B_SCR_OP_TRYSETHELPINGHAND]                     = Cmd_trysethelpinghand,
    [B_SCR_OP_TRYSWAPITEMS]                          = Cmd_tryswapitems,
    [B_SCR_OP_TRYCOPYABILITY]                        = Cmd_trycopyability,
    [B_SCR_OP_TRYWISH]                               = Cmd_trywish,
    [B_SCR_OP_SETTOXICSPIKES]                        = Cmd_settoxicspikes,
    [B_SCR_OP_SETGASTROACID]                         = Cmd_setgastroacid,
    [B_SCR_OP_SETYAWN]                               = Cmd_setyawn,
    [B_SCR_OP_UNUSED0XD8]                            = Cmd_unused0xd8,
    [B_SCR_OP_SETROOM]                               = Cmd_setroom,
    [B_SCR_OP_TRYSWAPABILITIES]                      = Cmd_tryswapabilities,
    [B_SCR_OP_TRYIMPRISON]                           = Cmd_tryimprison,
    [B_SCR_OP_SETSTEALTHROCK]                        = Cmd_setstealthrock,
    [B_SCR_OP_TRYSETVOLATILE]                        = Cmd_trysetvolatile,
    [B_SCR_OP_UNUSED_0XDE]                           = Cmd_unused_0xde,
    [B_SCR_OP_TRYSETMAGICCOAT]                       = Cmd_trysetmagiccoat,
    [B_SCR_OP_TRYSETSNATCH]                          = Cmd_trysetsnatch,
    [B_SCR_OP_UNUSED2]                               = Cmd_unused2,
    [B_SCR_OP_SWITCHOUTABILITIES]                    = Cmd_switchoutabilities,
    [B_SCR_OP_JUMPIFHASNOHP]                         = Cmd_jumpifhasnohp,
    [B_SCR_OP_UNUSED_0XE4]                           = Cmd_unused_0xE4,
    [B_SCR_OP_PICKUP]                                = Cmd_pickup,
    [B_SCR_OP_UNUSED_0XE6]                           = Cmd_unused_0xE6,
    [B_SCR_OP_UNUSED_0XE7]                           = Cmd_unused_0xE7,
    [B_SCR_OP_SETTYPEBASEDHALVERS]                   = Cmd_settypebasedhalvers,
    [B_SCR_OP_JUMPIFSUBSTITUTEBLOCKS]                = Cmd_jumpifsubstituteblocks,
    [B_SCR_OP_TRYRECYCLEITEM]                        = Cmd_tryrecycleitem,
    [B_SCR_OP_SETTYPETOENVIRONMENT]                  = Cmd_settypetoenvironment,
    [B_SCR_OP_PURSUITDOUBLES]                        = Cmd_pursuitdoubles,
    [B_SCR_OP_SNATCHSETBATTLERS]                     = Cmd_snatchsetbattlers,
    [B_SCR_OP_UNUSED_0XEE]                           = Cmd_unused_0xee,
    [B_SCR_OP_HANDLEBALLTHROW]                       = Cmd_handleballthrow,
    [B_SCR_OP_GIVECAUGHTMON]                         = Cmd_givecaughtmon,
    [B_SCR_OP_TRYSETCAUGHTMONDEXFLAGS]               = Cmd_trysetcaughtmondexflags,
    [B_SCR_OP_DISPLAYDEXINFO]                        = Cmd_displaydexinfo,
    [B_SCR_OP_TRYGIVECAUGHTMONNICK]                  = Cmd_trygivecaughtmonnick,
    [B_SCR_OP_SORTBATTLERS]                          = Cmd_sortbattlers,
    [B_SCR_OP_REMOVEATTACKERSTATUS1]                 = Cmd_removeattackerstatus1,
    [B_SCR_OP_FINISHACTION]                          = Cmd_finishaction,
    [B_SCR_OP_FINISHTURN]                            = Cmd_finishturn,
    [B_SCR_OP_TRAINERSLIDEOUT]                       = Cmd_trainerslideout,
    [B_SCR_OP_SETTELEKINESIS]                        = Cmd_settelekinesis,
    [B_SCR_OP_SWAPSTATSTAGES]                        = Cmd_swapstatstages,
    [B_SCR_OP_AVERAGESTATS]                          = Cmd_averagestats,
    [B_SCR_OP_JUMPIFCAPTIVATEAFFECTED]               = Cmd_jumpifcaptivateaffected,
    [B_SCR_OP_SETNONVOLATILESTATUS]                  = Cmd_setnonvolatilestatus,
    [B_SCR_OP_TRYOVERWRITEABILITY]                   = Cmd_tryoverwriteability,
    [B_SCR_OP_CALLNATIVE]                            = Cmd_callnative,
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
static const u32 sLevelUpBanner_Gfx[] = INCBIN_U32("graphics/battle_interface/level_up_banner.4bpp.smol");

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

bool32 ProteanTryChangeType(u32 battler, enum Ability ability, enum Move move, enum Type moveType)
{
      if ((ability == ABILITY_PROTEAN || ability == ABILITY_LIBERO)
         && !gBattleMons[gBattlerAttacker].volatiles.usedProteanLibero
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

u32 NumAffectedSpreadMoveTargets(void)
{
    u32 targetCount = 0;

    if (!IsDoubleSpreadMove())
        return targetCount;

    for (u32 battler = 0; battler < gBattlersCount; battler++)
    {
        if (battler == gBattlerAttacker)
            continue;

        if (!IsBattlerUnaffectedByMove(battler))
            targetCount++;
    }

    return targetCount;
}

static inline bool32 IsBattlerUsingBeakBlast(u32 battler)
{
    if (gChosenActionByBattler[battler] != B_ACTION_USE_MOVE)
        return FALSE;
    if (GetMoveEffect(gChosenMoveByBattler[battler]) != EFFECT_BEAK_BLAST)
        return FALSE;
    return !HasBattlerActedThisTurn(battler);
}

static bool32 ShouldSkipToMoveEnd(void)
{
    enum MoveTarget moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);

    switch (moveTarget)
    {
    case TARGET_NONE:
    case TARGET_FIELD:
    case TARGET_OPPONENTS_FIELD:
    case TARGET_USER:
    case TARGET_ALL_BATTLERS:
        return FALSE;
    case TARGET_DEPENDS:
    case TARGET_OPPONENT:
    case TARGET_RANDOM:
    case TARGET_SELECTED:
    case TARGET_SMART:
    case TARGET_ALLY:
    case TARGET_USER_AND_ALLY:
    case TARGET_USER_OR_ALLY:
    case TARGET_FOES_AND_ALLY:
    case TARGET_BOTH:
        return gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_AVOIDED_ATTACK;
    }

    return FALSE;
}

static void Cmd_attackcanceler(void)
{
    CMD_ARGS();
    assertf(gBattlerAttacker < gBattlersCount, "invalid gBattlerAttacker: %d\nmove: %S", gBattlerAttacker, GetMoveName(gCurrentMove));
    assertf(gBattlerTarget < gBattlersCount, "invalid gBattlerTarget: %d\nmove: %S", gBattlerTarget, GetMoveName(gCurrentMove));

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

    if (AtkCanceler_MoveSuccessOrder() != MOVE_STEP_SUCCESS)
        return;

    if (gBattleStruct->magicBounceActive && !gBattleStruct->bouncedMoveIsUsed)
    {
        gBattleStruct->bouncedMoveIsUsed = TRUE;
        gBattleStruct->magicBounceActive = FALSE;
        gBattlerAbility = gBattlerTarget = gBattleStruct->moveBouncer;
        BattleScriptCall(BattleScript_MagicBounce);
        return;
    }
    else if (gBattleStruct->magicCoatActive && !gBattleStruct->bouncedMoveIsUsed)
    {
        gBattleStruct->bouncedMoveIsUsed = TRUE;
        gBattleStruct->magicCoatActive = FALSE;
        gEffectBattler = gBattlerTarget = gBattleStruct->moveBouncer;
        BattleScriptCall(BattleScript_MagicCoat);
        return;
    }

    // Hack: Prevents messages being printed multiply times
    // This is potentially bad. Bad if there are damage scripts that check further stuff
    // E.g. it didn't work well with the old Synchronoise implementation
    // I don't have better ideas right now though that would make sure nothing else breaks
    if (ShouldSkipToMoveEnd())
    {
        gBattlescriptCurrInstr = BattleScript_MoveEnd;
        return;
    }

    for (u32 i = 0; i < gCurrentTurnActionNumber; i++)
    {
        if (!gProtectStructs[gBattlerByTurnOrder[i]].stealMove
         || !MoveCanBeSnatched(gCurrentMove))
            continue;

        if (B_SNATCH < GEN_5 || !gBattleStruct->snatchedMoveIsUsed)
        {
            gProtectStructs[gBattlerByTurnOrder[i]].stealMove = FALSE;
            gBattleStruct->snatchedMoveIsUsed = TRUE;
            gBattleScripting.battler = gBattlerByTurnOrder[i];
            BattleScriptCall(BattleScript_SnatchedMove);
            return;
        }
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_setchargingturn(void)
{
    CMD_ARGS();

    if (!gBattleMons[gBattlerAttacker].volatiles.multipleTurns)
    {
        gBattleMons[gBattlerAttacker].volatiles.multipleTurns = TRUE;
        gLockedMoves[gBattlerAttacker] = gCurrentMove;
        gProtectStructs[gBattlerAttacker].chargingTurn = TRUE;
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static bool32 ShouldSkipAccuracyCalcPastFirstHit(u32 battlerAtk, enum Ability abilityAtk, enum HoldEffect holdEffectAtk, u32 moveEffect)
{
    if (gSpecialStatuses[battlerAtk].parentalBondState == PARENTAL_BOND_2ND_HIT)
        return TRUE;

    if (!gSpecialStatuses[battlerAtk].multiHitOn)
        return FALSE;

    if (moveEffect == EFFECT_TRIPLE_KICK || moveEffect == EFFECT_POPULATION_BOMB)
        return FALSE;

    if (abilityAtk == ABILITY_SKILL_LINK || holdEffectAtk == HOLD_EFFECT_LOADED_DICE)
        return TRUE;

    return FALSE;
}

static void AccuracyCheck(bool32 recalcDragonDarts, const u8 *nextInstr, const u8 *failInstr)
{
    enum Ability abilityAtk = GetBattlerAbility(gBattlerAttacker);
    enum HoldEffect holdEffectAtk = GetBattlerHoldEffect(gBattlerAttacker);
    enum BattleMoveEffects effect = GetMoveEffect(gCurrentMove);

    if (IS_FRLG &&
        ((gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE && (!BtlCtrl_OakOldMan_TestState2Flag(1) || !BtlCtrl_OakOldMan_TestState2Flag(2))
        && gMovesInfo[gCurrentMove].power != 0 && GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
        || (gBattleTypeFlags & BATTLE_TYPE_POKEDUDE)))
    {    if (gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_MISSED)
        {
            gBattleStruct->moveResultFlags[gBattlerTarget] = MOVE_RESULT_MISSED;
            gLastLandedMoves[gBattlerTarget] = 0;
            gLastHitByType[gBattlerTarget] = 0;
            gBattlescriptCurrInstr = failInstr;
        }
        else
        {
            gBattlescriptCurrInstr = nextInstr;
        }
    }

    if (ShouldSkipAccuracyCalcPastFirstHit(gBattlerAttacker, abilityAtk, holdEffectAtk, effect)
     || IsMaxMove(gCurrentMove)
     || IsZMove(gCurrentMove))
    {
        gBattlescriptCurrInstr = nextInstr;
        return;
    }

    u32 numTargets = 0, numMisses = 0;
    enum MoveTarget moveTarget = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);
    bool32 calcSpreadMove = IsSpreadMove(moveTarget);

    for (u32 battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
    {
        if (gBattleStruct->calculatedSpreadMoveAccuracy)
            break;

        if (!calcSpreadMove && battlerDef != gBattlerTarget)
            continue;

        if (IsBattlerInvalidForSpreadMove(gBattlerAttacker, battlerDef))
            continue;

        numTargets++;
        enum Ability abilityDef = GetBattlerAbility(battlerDef);

        if (CanMoveSkipAccuracyCalc(gBattlerAttacker, battlerDef, abilityAtk, abilityDef, gCurrentMove, RUN_SCRIPT))
            continue;

        u32 holdEffectDef = GetBattlerHoldEffect(battlerDef);
        u32 accuracy = GetTotalAccuracy(gBattlerAttacker,
                                        battlerDef,
                                        gCurrentMove,
                                        abilityAtk,
                                        abilityDef,
                                        holdEffectAtk,
                                        holdEffectDef);

        if (!RandomPercentage(RNG_ACCURACY, accuracy))
        {
            gBattleStruct->moveResultFlags[battlerDef] = MOVE_RESULT_MISSED;
            gBattleCommunication[MISS_TYPE] = B_MSG_MISSED;
            numMisses++;

            if (holdEffectAtk == HOLD_EFFECT_BLUNDER_POLICY)
                gBattleStruct->blunderPolicy = TRUE;    // Only activates from missing through acc/evasion checks

            if (moveTarget == TARGET_SMART
                && !IsAffectedByFollowMe(gBattlerAttacker, GetBattlerSide(battlerDef), gCurrentMove)
                && !recalcDragonDarts // So we don't jump back and forth between targets
                && CanTargetPartner(gBattlerAttacker, battlerDef)
                && !IsBattlerUnaffectedByMove(BATTLE_PARTNER(battlerDef)))
            {
                // Smart target to partner if miss
                numMisses = 0; // Other dart might hit
                gBattlerTarget = BATTLE_PARTNER(battlerDef);
                AccuracyCheck(TRUE, nextInstr, failInstr);
                return;
            }
        }
    }

    if (numTargets == numMisses)
    {
        SetOrClearRageVolatile();
        gBattleStruct->battlerState[gBattlerAttacker].stompingTantrumTimer = 2;
    }

    if (calcSpreadMove)
        gBattleStruct->calculatedSpreadMoveAccuracy = TRUE;

    if (gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_MISSED)
    {
        gBattleStruct->moveResultFlags[gBattlerTarget] = MOVE_RESULT_MISSED;
        gLastLandedMoves[gBattlerTarget] = 0;
        gLastHitByType[gBattlerTarget] = 0;
        gBattlescriptCurrInstr = failInstr;
    }
    else
    {
        gBattlescriptCurrInstr = nextInstr;
    }
}

static void Cmd_accuracycheck(void)
{
    CMD_ARGS(const u8 *failInstr);

    // The main body of this function has been moved to AccuracyCheck() to accomodate
    // Dragon Darts' multiple accuracy checks on a single attack;
    // each dart can try to re-target once after missing.
    AccuracyCheck(FALSE, cmd->nextInstr, cmd->failInstr);
}

static void Cmd_printattackstring(void)
{
    CMD_ARGS();

    if (gBattleControllerExecFlags)
        return;

    PrepareStringBattle(STRINGID_USEDMOVE, gBattlerAttacker);
    gBattleCommunication[MSG_DISPLAY] = 0;
    gBattlescriptCurrInstr = cmd->nextInstr;
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

// Calculations have been moved to cmd_damagecalc. Please remove the macro from scripts
// Will be set to unused next cycle
static void Cmd_critcalc(void)
{
    CMD_ARGS();
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static inline void CalculateAndSetMoveDamage(struct BattleContext *ctx)
{
    SetDynamicMoveCategory(gBattlerAttacker, ctx->battlerDef, gCurrentMove);
    ctx->isCrit = gSpecialStatuses[ctx->battlerDef].criticalHit;
    ctx->fixedBasePower = 0;
    gBattleStruct->moveDamage[ctx->battlerDef] = CalculateMoveDamage(ctx);

    // Slighly hacky but we need to check move result flags for distortion match-up as well but it can only be done after damage calcs
    if (gSpecialStatuses[ctx->battlerDef].distortedTypeMatchups && IsBattlerUnaffectedByMove(ctx->battlerDef))
    {
        gSpecialStatuses[ctx->battlerDef].distortedTypeMatchups = FALSE;
        gSpecialStatuses[ctx->battlerDef].teraShellAbilityDone = FALSE;
    }
}

static u32 GetWeather(void)
{
    if (gBattleWeather == B_WEATHER_NONE || !HasWeatherEffect())
        return B_WEATHER_NONE;
    else
        return gBattleWeather;
}

static void Cmd_damagecalc(void)
{
    CMD_ARGS();

    if (gBattleStruct->calculatedDamageDone)
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }

    struct BattleContext ctx = {0};
    ctx.battlerAtk = gBattlerAttacker;
    ctx.move = gCurrentMove;
    ctx.chosenMove = gChosenMove;
    ctx.moveType = GetBattleMoveType(gCurrentMove);
    ctx.weather = GetWeather();
    ctx.fieldStatuses = gFieldStatuses;
    ctx.randomFactor = TRUE;
    ctx.updateFlags = TRUE;

    if (IsSpreadMove(GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove)))
    {
        u32 battlerDef;
        for (battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
        {
            if (IsBattlerInvalidForSpreadMove(gBattlerAttacker, battlerDef))
                continue;

            ctx.battlerDef = battlerDef;
            CalculateAndSetMoveDamage(&ctx);
        }
    }
    else
    {
        ctx.battlerDef = gBattlerTarget;
        CalculateAndSetMoveDamage(&ctx);
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_typecalc(void)
{
    CMD_ARGS();

    struct BattleContext ctx = {0};
    ctx.battlerAtk = gBattlerAttacker;
    ctx.battlerDef = gBattlerTarget;
    ctx.move = gCurrentMove;
    ctx.chosenMove = gChosenMove;
    ctx.moveType = GetBattleMoveType(gCurrentMove);
    ctx.updateFlags = TRUE;
    ctx.abilityAtk = GetBattlerAbility(gBattlerAttacker);
    ctx.abilityDef = GetBattlerAbility(gBattlerTarget);
    ctx.holdEffectAtk = GetBattlerHoldEffect(gBattlerAttacker);
    ctx.holdEffectDef = GetBattlerHoldEffect(gBattlerTarget);
    CalcTypeEffectivenessMultiplier(&ctx);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_adjustdamage(void)
{
    CMD_ARGS();

    enum HoldEffect holdEffect;
    u8 param;
    u32 battlerDef;
    u32 rand = Random() % 100;
    u32 affectionScore;
    enum BattleMoveEffects moveEffect = GetMoveEffect(gCurrentMove);
    bool32 calcSpreadMoveDamage = IsSpreadMove(GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove));
    u32 enduredHit = 0;

    for (battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
    {
        if (gBattleStruct->calculatedDamageDone)
            break;

        if (!calcSpreadMoveDamage && battlerDef != gBattlerTarget)
            continue;

        if (IsBattlerInvalidForSpreadMove(gBattlerAttacker, battlerDef))
            continue;

        if (DoesSubstituteBlockMove(gBattlerAttacker, battlerDef, gCurrentMove))
            continue;

        if (DoesDisguiseBlockMove(battlerDef, gCurrentMove))
            continue;

        if (GetBattlerAbility(battlerDef) == ABILITY_ICE_FACE && IsBattleMovePhysical(gCurrentMove) && gBattleMons[battlerDef].species == SPECIES_EISCUE)
        {
            // Damage deals typeless 0 HP.
            gBattleStruct->moveResultFlags[battlerDef] &= ~(MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE);
            gBattleStruct->moveDamage[battlerDef] = 0;
            RecordAbilityBattle(battlerDef, ABILITY_ICE_FACE);
            gBattleMons[battlerDef].volatiles.triggerIceFace = TRUE;
            // Form change will be done after attack animation in Cmd_resultmessage.
            continue;
        }

        if (gBattleMons[battlerDef].hp > gBattleStruct->moveDamage[battlerDef])
            continue;

        holdEffect = GetBattlerHoldEffect(battlerDef);
        param = GetBattlerHoldEffectParam(battlerDef);
        affectionScore = GetBattlerAffectionHearts(battlerDef);

        gPotentialItemEffectBattler = battlerDef;

        if (moveEffect == EFFECT_FALSE_SWIPE)
        {
            enduredHit |= 1u << battlerDef;
        }
        else if (gBattleMons[battlerDef].volatiles.endured)
        {
            enduredHit |= 1u << battlerDef;
            gBattleStruct->moveResultFlags[battlerDef] |= MOVE_RESULT_FOE_ENDURED;
        }
        else if (holdEffect == HOLD_EFFECT_FOCUS_BAND && rand < param)
        {
            enduredHit |= 1u << battlerDef;
            RecordItemEffectBattle(battlerDef, holdEffect);
            gLastUsedItem = gBattleMons[battlerDef].item;
            gBattleStruct->moveResultFlags[battlerDef] |= MOVE_RESULT_FOE_HUNG_ON;
        }
        else if (GetConfig(CONFIG_STURDY) >= GEN_5 && GetBattlerAbility(battlerDef) == ABILITY_STURDY && IsBattlerAtMaxHp(battlerDef))
        {
            enduredHit |= 1u << battlerDef;
            RecordAbilityBattle(battlerDef, ABILITY_STURDY);
            gLastUsedAbility = ABILITY_STURDY;
            gBattleStruct->moveResultFlags[battlerDef] |= MOVE_RESULT_STURDIED;
        }
        else if (holdEffect == HOLD_EFFECT_FOCUS_SASH && IsBattlerAtMaxHp(battlerDef))
        {
            enduredHit |= 1u << battlerDef;
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
                enduredHit |= 1u << battlerDef;
                gBattleStruct->moveResultFlags[battlerDef] |= MOVE_RESULT_FOE_ENDURED_AFFECTION;
            }
        }

        // Handle reducing the dmg to 1 hp.
        if (enduredHit & 1u << battlerDef)
        {
            gBattleStruct->moveDamage[battlerDef] = gBattleMons[battlerDef].hp - 1;
            gProtectStructs[battlerDef].assuranceDoubled = TRUE;
        }
    }

    if (calcSpreadMoveDamage)
        gBattleStruct->calculatedDamageDone = TRUE;

    gBattlescriptCurrInstr = cmd->nextInstr;

    if (gSpecialStatuses[gBattlerAttacker].gemBoost
        && !IsBattlerUnaffectedByMove(gBattlerTarget)
        && !gBattleStruct->unableToUseMove
        && gBattleMons[gBattlerAttacker].item)
    {
        BattleScriptCall(BattleScript_GemActivates);
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
            BattleScriptCall(BattleScript_SturdiedMsg);
            return;
        }
        else if (gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_FOE_HUNG_ON)
        {
            gLastUsedItem = gBattleMons[gBattlerTarget].item;
            gPotentialItemEffectBattler = gBattlerTarget;
            gBattleStruct->moveResultFlags[gBattlerTarget] &= ~(MOVE_RESULT_STURDIED | MOVE_RESULT_FOE_HUNG_ON);
            BattleScriptCall(BattleScript_HangedOnMsg);
            return;
        }
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static inline bool32 DoesBattlerNegateDamage(u32 battler)
{
    u32 species = gBattleMons[battler].species;
    enum Ability ability = GetBattlerAbility(battler);

    if (gBattleMons[battler].volatiles.transformed)
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
            if (IsBattlerInvalidForSpreadMove(gBattlerAttacker, battlerDef))
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

static inline bool32 TryStrongWindsWeakenAttack(u32 battlerDef, enum Type moveType)
{
    if (gBattleWeather & B_WEATHER_STRONG_WINDS && HasWeatherEffect())
    {
        if (GetMoveCategory(gCurrentMove) != DAMAGE_CATEGORY_STATUS
         && IS_BATTLER_OF_TYPE(battlerDef, TYPE_FLYING)
         && gTypeEffectivenessTable[moveType][TYPE_FLYING] >= UQ_4_12(2.0)
         && !gBattleStruct->printedStrongWindsWeakenedAttack)
        {
            gBattleStruct->printedStrongWindsWeakenedAttack = TRUE;
            BattleScriptCall(BattleScript_AttackWeakenedByStrongWinds);
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
        BattleScriptCall(BattleScript_TeraShellDistortingTypeMatchups);
        return TRUE;
    }
    return FALSE;
}

// According to Gen5 Weakness berry activation happens after the attackanimation.
// It doesn't have any impact on gameplay and is only a visual thing which can be adjusted later.
static inline bool32 TryActivateWeaknessBerry(u32 battlerDef)
{
    if (DoesDisguiseBlockMove(battlerDef, gCurrentMove))
    {
        gSpecialStatuses[battlerDef].berryReduced = FALSE;
        return FALSE;
    }
    if (gSpecialStatuses[battlerDef].berryReduced && gBattleMons[battlerDef].item != ITEM_NONE)
    {
        gBattleScripting.battler = battlerDef;
        gLastUsedItem = gBattleMons[battlerDef].item;
        GetBattlerPartyState(battlerDef)->ateBerry = TRUE;
        BattleScriptCall(BattleScript_BerryReduceDmg);
        return TRUE;
    }

    return FALSE;
}

static bool32 ProcessPreAttackAnimationFuncs(void)
{
    u32 moveType = GetBattleMoveType(gCurrentMove);
    if (IsDoubleSpreadMove())
    {
        if (!gBattleStruct->printedStrongWindsWeakenedAttack)
        {
            for (u32 battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
            {
                if (IsBattlerInvalidForSpreadMove(gBattlerAttacker, battlerDef))
                    continue;
                if (TryStrongWindsWeakenAttack(battlerDef, moveType))
                    return TRUE;
            }
        }

        for (u32 battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
        {
            if (IsBattlerInvalidForSpreadMove(gBattlerAttacker, battlerDef))
                continue;
            if (TryTeraShellDistortTypeMatchups(battlerDef))
                return TRUE;
            if (TryActivateWeaknessBerry(battlerDef))
                return TRUE;
        }
    }
    else
    {
        if (TryStrongWindsWeakenAttack(gBattlerTarget, moveType))
            return TRUE;
        if (TryTeraShellDistortTypeMatchups(gBattlerTarget))
            return TRUE;
        if (TryActivateWeaknessBerry(gBattlerTarget))
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
    enum BattleMoveEffects effect = GetMoveEffect(gCurrentMove);

    if (IsDoubleSpreadMove())
        moveResultFlags = UpdateEffectivenessResultFlagsForDoubleSpreadMoves(gBattleStruct->moveResultFlags[gBattlerTarget]);

    bool32 isAnimDisabled = (gHitMarker & (HITMARKER_NO_ANIMATIONS | HITMARKER_DISABLE_ANIMATION)
                          || gBattleStruct->preAttackAnimPlayed);
    if (isAnimDisabled
        && effect != EFFECT_TRANSFORM
        && effect != EFFECT_SUBSTITUTE
        && effect != EFFECT_ALLY_SWITCH
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

        if (gBattleScripting.animTargetsHit)
        {
            if (moveTarget == TARGET_BOTH
             || moveTarget == TARGET_ALL_BATTLERS
             || moveTarget == TARGET_FOES_AND_ALLY
             || moveTarget == TARGET_DEPENDS)
            {
                gBattlescriptCurrInstr = cmd->nextInstr;
                return;
            }
        }

        // handle special move animations.
        if (GetMoveAnimationScript(gCurrentMove) == gBattleAnimMove_ExpandingForce && moveTarget == TARGET_BOTH && CountAliveMonsInBattle(BATTLE_ALIVE_SIDE, BATTLE_OPPOSITE(gBattlerAttacker) > 1))
            gBattleScripting.animTurn = 1;

        if (!(moveResultFlags & MOVE_RESULT_NO_EFFECT) || moveTarget == TARGET_ALL_BATTLERS)
        {
            u32 multihit;
            if (gBattleMons[gBattlerTarget].volatiles.substitute)
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
                                            multihit);
#if T_SHOULD_RUN_MOVE_ANIM
            gCountAllocs = TRUE;
            gSpriteAllocs = 0;
#endif
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

    if (gBattleControllerExecFlags == 0 && gBattleStruct->battlerKOAnimsRunning == 0)
    {
#if T_SHOULD_RUN_MOVE_ANIM
        gCountAllocs = FALSE;
#endif
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void DoublesHPBarReduction(void)
{
    if (gBattleStruct->doneDoublesSpreadHit)
        return;

    for (u32 battlerDef = 0; battlerDef < gBattlersCount; battlerDef++)
    {
        if (IsBattlerUnaffectedByMove(battlerDef)
         || gBattleStruct->moveDamage[battlerDef] == 0
         || DoesSubstituteBlockMove(gBattlerAttacker, battlerDef, gCurrentMove)
         || DoesDisguiseBlockMove(battlerDef, gCurrentMove))
            continue;

        s32 dmgUpdate = min(gBattleStruct->moveDamage[battlerDef], 10000);
        BtlController_EmitHealthBarUpdate(battlerDef, B_COMM_TO_CONTROLLER, dmgUpdate);
        MarkBattlerForControllerExec(battlerDef);
        if (IsOnPlayerSide(battlerDef) && dmgUpdate > 0)
            gBattleResults.playerMonWasDamaged = TRUE;
    }

    gBattleStruct->doneDoublesSpreadHit = TRUE;
}

static void Cmd_healthbarupdate(void)
{
    CMD_ARGS(u8 battler, u8 updateState);
    u32 battler = GetBattlerForBattleScript(cmd->battler);

    if (gBattleControllerExecFlags)
        return;

    switch (cmd->updateState)
    {
    case PASSIVE_HP_UPDATE:
        BtlController_EmitHealthBarUpdate(battler, B_COMM_TO_CONTROLLER, min(gBattleStruct->passiveHpUpdate[battler], 10000));
        MarkBattlerForControllerExec(battler);
        break;
    case MOVE_DAMAGE_HP_UPDATE:
        if (IsDoubleSpreadMove())
        {
            DoublesHPBarReduction();
            if (DoesSubstituteBlockMove(gBattlerAttacker, battler, gCurrentMove))
                PrepareStringBattle(STRINGID_SUBSTITUTEDAMAGED, battler);
        }
        else if (DoesSubstituteBlockMove(gBattlerAttacker, battler, gCurrentMove))
        {
            PrepareStringBattle(STRINGID_SUBSTITUTEDAMAGED, battler);
        }
        else if (!IsBattlerUnaffectedByMove(gBattlerTarget)
              && !DoesDisguiseBlockMove(battler, gCurrentMove))
        {
            s32 damage = min(gBattleStruct->moveDamage[battler], 10000);
            BtlController_EmitHealthBarUpdate(battler, B_COMM_TO_CONTROLLER, damage);
            MarkBattlerForControllerExec(battler);
            if (IsOnPlayerSide(battler) && damage > 0)
                gBattleResults.playerMonWasDamaged = TRUE;
        }
        break;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void PassiveDataHpUpdate(u32 battler, const u8 *nextInstr)
{
    if (gBattleStruct->passiveHpUpdate[battler] < 0)
    {
        // Negative damage is HP gain
        gBattleMons[battler].hp += -gBattleStruct->passiveHpUpdate[battler];
        if (gBattleMons[battler].hp > gBattleMons[battler].maxHP)
            gBattleMons[battler].hp = gBattleMons[battler].maxHP;
    }
    else
    {
        if (gBattleMons[battler].hp > gBattleStruct->passiveHpUpdate[battler])
            gBattleMons[battler].hp -= gBattleStruct->passiveHpUpdate[battler];
        else
            gBattleMons[battler].hp = 0;
        // Since this is reset for the next turn, it should be fine to set it here.
        gProtectStructs[battler].assuranceDoubled = TRUE;
    }

    // Send updated HP
    BtlController_EmitSetMonData(
        battler,
        B_COMM_TO_CONTROLLER,
        REQUEST_HP_BATTLE,
        0,
        sizeof(gBattleMons[battler].hp), &gBattleMons[battler].hp);
    MarkBattlerForControllerExec(battler);

    gBattleStruct->passiveHpUpdate[battler] = 0;
    gBattlescriptCurrInstr = nextInstr;
}

static void MoveDamageDataHpUpdate(u32 battler, u32 scriptBattler, const u8 *nextInstr)
{
    if (IsBattlerUnaffectedByMove(gBattlerTarget))
    {
        gBattlescriptCurrInstr = nextInstr;
        return;
    }
    else if (DoesSubstituteBlockMove(gBattlerAttacker, battler, gCurrentMove) && gBattleMons[battler].volatiles.substituteHP)
    {
        if (gBattleMons[battler].volatiles.substituteHP >= gBattleStruct->moveDamage[battler])
        {
            TestRunner_Battle_RecordSubHit(battler, gBattleStruct->moveDamage[battler], FALSE);
            gBattleMons[battler].volatiles.substituteHP -= gBattleStruct->moveDamage[battler];
        }
        else
        {
            TestRunner_Battle_RecordSubHit(battler, gBattleMons[battler].volatiles.substituteHP, TRUE);
            gBattleStruct->moveDamage[battler] = gBattleMons[battler].volatiles.substituteHP;
            gBattleMons[battler].volatiles.substituteHP = 0;
        }
        // check substitute fading
        if (gBattleMons[battler].volatiles.substituteHP == 0)
        {
            gBattlescriptCurrInstr = nextInstr;
            BattleScriptCall(BattleScript_SubstituteFade);
        }
        else
        {
            gBattlescriptCurrInstr = nextInstr;
        }
        return;
    }
    else if (DoesDisguiseBlockMove(battler, gCurrentMove))
    {
        // TODO: Convert this to a proper FORM_CHANGE type.
        gBattleScripting.battler = battler;
        gBattleStruct->moveDamage[battler] = 0;
        gBattleStruct->moveResultFlags[battler] &= ~(MOVE_RESULT_NOT_VERY_EFFECTIVE | MOVE_RESULT_SUPER_EFFECTIVE);
        if (GetMoveEffect(gCurrentMove) == EFFECT_OHKO)
            gProtectStructs[battler].survivedOHKO = TRUE;
        if (GetBattlerPartyState(battler)->changedSpecies == SPECIES_NONE)
            GetBattlerPartyState(battler)->changedSpecies = gBattleMons[battler].species;
        if (gBattleMons[battler].species == SPECIES_MIMIKYU_TOTEM_DISGUISED)
            gBattleMons[battler].species = SPECIES_MIMIKYU_BUSTED_TOTEM;
        else
            gBattleMons[battler].species = SPECIES_MIMIKYU_BUSTED;
        if (GetConfig(CONFIG_DISGUISE_HP_LOSS) >= GEN_8)
            SetPassiveDamageAmount(battler, GetNonDynamaxMaxHP(battler) / 8);
        BattleScriptPush(nextInstr);
        gBattlescriptCurrInstr = BattleScript_TargetFormChange;
    }
    else
    {
        if (gBattleStruct->moveDamage[battler] < 0)
        {
            // Negative damage is HP gain
            gBattleMons[battler].hp += -gBattleStruct->moveDamage[battler];
            if (gBattleMons[battler].hp > gBattleMons[battler].maxHP)
                gBattleMons[battler].hp = gBattleMons[battler].maxHP;
        }
        else
        {
            gBideDmg[battler] += gBattleStruct->moveDamage[battler];
            gBideTarget[battler] = gBattlerAttacker;

            // Deal damage to the battler
            if (gBattleMons[battler].hp > gBattleStruct->moveDamage[battler])
            {
                if (GetMoveEffect(gCurrentMove) == EFFECT_OHKO && gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_FOE_HUNG_ON)
                {
                    gProtectStructs[battler].survivedOHKO = TRUE;
                }
                gBattleMons[battler].hp -= gBattleStruct->moveDamage[battler];
            }
            else
            {
                gBattleStruct->moveDamage[battler] = gBattleMons[battler].hp;
                gBattleMons[battler].hp = 0;
            }
            gProtectStructs[battler].assuranceDoubled = TRUE;
            gProtectStructs[battler].revengeDoubled |= 1u << gBattlerAttacker;

        }
        // Send updated HP
        BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_HP_BATTLE, 0, sizeof(gBattleMons[battler].hp), &gBattleMons[battler].hp);
        MarkBattlerForControllerExec(battler);
        gBattlescriptCurrInstr = nextInstr;
    }

    // Note: While physicalDmg/specialDmg below are only distinguished between for Counter/Mirror Coat,
    //       they are used in combination as general damage trackers for other purposes.
    if (GetConfig(CONFIG_COUNTER_MIRROR_COAT_ALLY) <= GEN_4 || !IsBattlerAlly(battler, gBattlerAttacker))
    {
        if (IsBattleMovePhysical(gCurrentMove) || ((GetConfig(CONFIG_HIDDEN_POWER_COUNTER) < GEN_4) && GetMoveEffect(gCurrentMove) == EFFECT_HIDDEN_POWER))
        {
            gProtectStructs[battler].physicalDmg = gBattleStruct->moveDamage[battler] + 1;
            gProtectStructs[battler].physicalBattlerId = gBattlerAttacker;
            gProtectStructs[battler].lastHitBySpecialMove = FALSE;
        }
        else // Special move
        {
            gProtectStructs[battler].specialDmg = gBattleStruct->moveDamage[battler] + 1;
            gProtectStructs[battler].specialBattlerId = gBattlerAttacker;
            gProtectStructs[battler].lastHitBySpecialMove = TRUE;
        }
    }

    GetBattlerPartyState(battler)->timesGotHit++;
    gSpecialStatuses[battler].damagedByAttack = TRUE;
}

static void Cmd_datahpupdate(void)
{
    CMD_ARGS(u8 battler, u8 updateState);
    u32 battler = GetBattlerForBattleScript(cmd->battler);

    if (gBattleControllerExecFlags)
        return;


    switch (cmd->updateState)
    {
    case PASSIVE_HP_UPDATE:
        PassiveDataHpUpdate(battler, cmd->nextInstr);
        break;
    case MOVE_DAMAGE_HP_UPDATE:
        MoveDamageDataHpUpdate(battler, cmd->battler, cmd->nextInstr);
        break;
    }
    if (gBattleMons[battler].hp > gBattleMons[battler].maxHP / 2)
        gBattleStruct->battlerState[battler].wasAboveHalfHp = TRUE;

}

static void Cmd_critmessage(void)
{
    CMD_ARGS();

    if (gBattleControllerExecFlags == 0)
    {
        if (gSpecialStatuses[gBattlerTarget].criticalHit && !IsBattlerUnaffectedByMove(gBattlerTarget))
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
    else if (!IsBattlerUnaffectedByMove(gBattlerTarget) && DoesBattlerNegateDamage(gBattlerTarget))
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
        && !(gBattleStruct->moveResultFlags[BATTLE_PARTNER(gBattlerTarget)] & MOVE_RESULT_AVOIDED_ATTACK);
}

static inline bool32 ShouldRelyOnTwoFoesMessage(u32 moveResult)
{
    u32 oppositeTarget = BATTLE_OPPOSITE(gBattlerAttacker);
    return gBattlerTarget == BATTLE_PARTNER(oppositeTarget)
        && gBattleStruct->moveResultFlags[oppositeTarget] & moveResult
        && !(gBattleStruct->moveResultFlags[oppositeTarget] & MOVE_RESULT_AVOIDED_ATTACK);
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
    if (gBattleMons[gBattlerTarget].volatiles.triggerIceFace)
    {
        gBattleMons[gBattlerTarget].volatiles.triggerIceFace = FALSE;
        if (GetBattlerPartyState(gBattlerTarget)->changedSpecies == SPECIES_NONE)
            GetBattlerPartyState(gBattlerTarget)->changedSpecies = gBattleMons[gBattlerTarget].species;
        gBattleMons[gBattlerTarget].species = SPECIES_EISCUE_NOICE;
        gBattleScripting.battler = gBattlerTarget; // For STRINGID_PKMNTRANSFORMED
        BattleScriptCall(BattleScript_IceFaceNullsDamage);
        return;
    }

    if (*moveResultFlags & MOVE_RESULT_MISSED && !(*moveResultFlags & MOVE_RESULT_DOESNT_AFFECT_FOE))
    {
        if (gMultiHitCounter && gMultiHitCounter < GetMoveStrikeCount(gCurrentMove))
        {
            gMultiHitCounter = 0;
            *moveResultFlags &= ~MOVE_RESULT_MISSED;
            BattleScriptCall(BattleScript_MultiHitPrintStrings);
            return;
        }
        else
        {
            gBattleCommunication[MSG_DISPLAY] = 1;
            stringId = STRINGID_ATTACKMISSED;
        }
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
            if (stringId == STRINGID_SUPEREFFECTIVETWOFOES)
                TryInitializeTrainerSlidePlayerLandsFirstSuperEffectiveHit(BATTLE_PARTNER(gBattlerTarget));
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
                    TryInitializeTrainerSlideEnemyMonUnaffected(gBattlerTarget);
                    TryInitializeTrainerSlideEnemyMonUnaffected(BATTLE_PARTNER(gBattlerTarget));
                    stringId = STRINGID_ITDOESNTAFFECTTWOFOES;
                }
                else if (ShouldRelyOnTwoFoesMessage(MOVE_RESULT_DOESNT_AFFECT_FOE))
                {
                    stringId = 0; // Was handled or will be handled as a double string
                }
                else
                {
                    TryInitializeTrainerSlideEnemyMonUnaffected(gBattlerTarget);
                    stringId = STRINGID_ITDOESNTAFFECT;
                }
            }
            else
            {
                TryInitializeTrainerSlideEnemyMonUnaffected(gBattlerTarget);
                stringId = STRINGID_ITDOESNTAFFECT;
            }
            break;
        case MOVE_RESULT_FOE_HUNG_ON:
            gLastUsedItem = gBattleMons[gBattlerTarget].item;
            gPotentialItemEffectBattler = gBattlerTarget;
            *moveResultFlags &= ~(MOVE_RESULT_FOE_ENDURED | MOVE_RESULT_FOE_HUNG_ON);
            BattleScriptCall(BattleScript_HangedOnMsg);
            return;
        default:
            if (*moveResultFlags & MOVE_RESULT_ONE_HIT_KO)
            {
                *moveResultFlags &= ~MOVE_RESULT_ONE_HIT_KO;
                *moveResultFlags &= ~MOVE_RESULT_SUPER_EFFECTIVE;
                *moveResultFlags &= ~MOVE_RESULT_NOT_VERY_EFFECTIVE;
                BattleScriptCall(BattleScript_OneHitKOMsg);
                return;
            }
            else if (*moveResultFlags & MOVE_RESULT_STURDIED)
            {
                *moveResultFlags &= ~(MOVE_RESULT_STURDIED | MOVE_RESULT_FOE_ENDURED | MOVE_RESULT_FOE_HUNG_ON);
                BattleScriptCall(BattleScript_SturdiedMsg);
                return;
            }
            else if (*moveResultFlags & MOVE_RESULT_FOE_ENDURED)
            {
                *moveResultFlags &= ~(MOVE_RESULT_FOE_ENDURED | MOVE_RESULT_FOE_HUNG_ON);
                BattleScriptCall(BattleScript_EnduredMsg);
                return;
            }
            else if (*moveResultFlags & MOVE_RESULT_FOE_HUNG_ON)
            {
                gLastUsedItem = gBattleMons[gBattlerTarget].item;
                gPotentialItemEffectBattler = gBattlerTarget;
                *moveResultFlags &= ~(MOVE_RESULT_FOE_ENDURED | MOVE_RESULT_FOE_HUNG_ON);
                BattleScriptCall(BattleScript_HangedOnMsg);
                return;
            }
            else if (*moveResultFlags & MOVE_RESULT_FAILED)
            {
                stringId = STRINGID_BUTITFAILED;
            }
            else if (B_AFFECTION_MECHANICS == TRUE && (*moveResultFlags & MOVE_RESULT_FOE_ENDURED_AFFECTION))
            {
                *moveResultFlags &= ~MOVE_RESULT_FOE_ENDURED_AFFECTION;
                BattleScriptCall(BattleScript_AffectionBasedEndurance);
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

bool32 HasBattlerActedThisTurn(u32 battler)
{
    u32 i;
    for (i = 0; i < gCurrentTurnActionNumber; i++)
    {
        if (gBattlerByTurnOrder[i] == battler)
            return TRUE;
    }
    return FALSE;
}

u32 GetBattlerTurnOrderNum(u32 battler)
{
    u32 i;
    for (i = 0; i < gBattlersCount; i++)
    {
        if (gBattlerByTurnOrder[i] == battler)
            break;
    }
    return i;
}

// battlerStealer steals the item of itemBattler
void StealTargetItem(u8 battlerStealer, u8 itemBattler)
{
    gLastUsedItem = gBattleMons[itemBattler].item;
    gBattleMons[itemBattler].item = ITEM_NONE;

    if (GetConfig(CONFIG_STEAL_WILD_ITEMS) >= GEN_9
     && !(gBattleTypeFlags & (BATTLE_TYPE_TRAINER | BATTLE_TYPE_PALACE))
     && GetMoveEffect(gCurrentMove) == EFFECT_STEAL_ITEM
     && battlerStealer == gBattlerAttacker) // ensure that Pickpocket isn't activating this
    {
        AddBagItem(gLastUsedItem, 1);
    }
    else
    {
        RecordItemEffectBattle(battlerStealer, GetItemHoldEffect(gLastUsedItem));
        gBattleMons[battlerStealer].item = gLastUsedItem;

        gBattleMons[battlerStealer].volatiles.unburdenActive = FALSE;
        BtlController_EmitSetMonData(battlerStealer, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gLastUsedItem), &gLastUsedItem); // set attacker item
        MarkBattlerForControllerExec(battlerStealer);
    }

    RecordItemEffectBattle(itemBattler, HOLD_EFFECT_NONE);
    CheckSetUnburden(itemBattler);

    BtlController_EmitSetMonData(itemBattler, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[itemBattler].item), &gBattleMons[itemBattler].item);  // remove target item
    MarkBattlerForControllerExec(itemBattler);

    if (GetBattlerAbility(itemBattler) != ABILITY_GORILLA_TACTICS)
        gBattleStruct->choicedMove[itemBattler] = MOVE_NONE;

    TrySaveExchangedItem(itemBattler, gLastUsedItem);
}

static inline bool32 TrySetReflect(u32 battler)
{
    enum BattleSide side = GetBattlerSide(battler);
    if (!(gSideStatuses[side] & SIDE_STATUS_REFLECT))
    {
        gSideStatuses[side] |= SIDE_STATUS_REFLECT;
        if (GetBattlerHoldEffect(battler) == HOLD_EFFECT_LIGHT_CLAY)
            gSideTimers[side].reflectTimer = 8;
        else
            gSideTimers[side].reflectTimer = 5;

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
    enum BattleSide side = GetBattlerSide(battler);
    if (!(gSideStatuses[side] & SIDE_STATUS_LIGHTSCREEN))
    {
        gSideStatuses[side] |= SIDE_STATUS_LIGHTSCREEN;
        if (GetBattlerHoldEffect(battler) == HOLD_EFFECT_LIGHT_CLAY)
            gSideTimers[side].lightscreenTimer = 8;
        else
            gSideTimers[side].lightscreenTimer = 5;

        if (IsDoubleBattle() && CountAliveMonsInBattle(BATTLE_ALIVE_SIDE, battler) == 2)
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_LIGHTSCREEN_DOUBLE;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_LIGHTSCREEN_SINGLE;

        return TRUE;
    }
    return FALSE;
}

static void SetNonVolatileStatus(u32 effectBattler, enum MoveEffect effect, const u8 *battleScript, enum StatusTrigger trigger)
{
    gEffectBattler = effectBattler;

    if (effect == MOVE_EFFECT_SLEEP
     || effect == MOVE_EFFECT_FREEZE)
    {
        const u8 *cancelMultiTurnMovesResult = NULL;
        cancelMultiTurnMovesResult = CancelMultiTurnMoves(effectBattler, SKY_DROP_STATUS_FREEZE_SLEEP);
        if (cancelMultiTurnMovesResult)
            gBattlescriptCurrInstr = cancelMultiTurnMovesResult;
    }

    BattleScriptPush(battleScript);

    switch (effect)
    {
    case MOVE_EFFECT_SLEEP:
        if (B_SLEEP_TURNS >= GEN_5)
            gBattleMons[effectBattler].status1 |= STATUS1_SLEEP_TURN(RandomUniform(RNG_SLEEP_TURNS, 2, 4));
        else if (B_SLEEP_TURNS >= GEN_3)
            gBattleMons[effectBattler].status1 |= STATUS1_SLEEP_TURN(RandomUniform(RNG_SLEEP_TURNS, 2, 5));
        else
            gBattleMons[effectBattler].status1 |= STATUS1_SLEEP_TURN(RandomUniform(RNG_SLEEP_TURNS, 2, 8));
        TryActivateSleepClause(effectBattler, gBattlerPartyIndexes[effectBattler]);
        gBattlescriptCurrInstr = BattleScript_MoveEffectSleep;
        break;
    case MOVE_EFFECT_POISON:
        gBattleMons[effectBattler].status1 |= STATUS1_POISON;
        gBattlescriptCurrInstr = BattleScript_MoveEffectPoison;
        break;
    case MOVE_EFFECT_BURN:
        gBattleMons[effectBattler].status1 |= STATUS1_BURN;
        gBattlescriptCurrInstr = BattleScript_MoveEffectBurn;
        break;
    case MOVE_EFFECT_FREEZE:
        gBattleMons[effectBattler].status1 |= STATUS1_FREEZE;
        gBattlescriptCurrInstr = BattleScript_MoveEffectFreeze;
        break;
    case MOVE_EFFECT_PARALYSIS:
        gBattleMons[effectBattler].status1 |= STATUS1_PARALYSIS;
        gBattlescriptCurrInstr = BattleScript_MoveEffectParalysis;
        break;
    case MOVE_EFFECT_TOXIC:
        gBattleMons[effectBattler].status1 |= STATUS1_TOXIC_POISON;
        gBattlescriptCurrInstr = BattleScript_MoveEffectToxic;
        break;
    case MOVE_EFFECT_FROSTBITE:
        gBattleMons[effectBattler].status1 |= STATUS1_FROSTBITE;
        gBattlescriptCurrInstr = BattleScript_MoveEffectFrostbite;
        break;
    default:
        break;
    }

    BtlController_EmitSetMonData(effectBattler, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[effectBattler].status1), &gBattleMons[effectBattler].status1);
    MarkBattlerForControllerExec(effectBattler);

    if (trigger == TRIGGER_ON_ABILITY)
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STATUSED_BY_ABILITY;
    else
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STATUSED;

    gBattleScripting.moveEffect = MOVE_EFFECT_NONE;

    // for synchronize
    if (effect == MOVE_EFFECT_POISON
     || effect == MOVE_EFFECT_TOXIC
     || effect == MOVE_EFFECT_PARALYSIS
     || effect == MOVE_EFFECT_BURN)
        gBattleStruct->synchronizeMoveEffect = effect;

    if (effect == MOVE_EFFECT_POISON || effect == MOVE_EFFECT_TOXIC)
        gBattleStruct->poisonPuppeteerConfusion = TRUE;
}

// To avoid confusion the arguments are naned battler/effectBattler since they can be different from gBattlerAttacker/gBattlerTarget
void SetMoveEffect(u32 battlerAtk, u32 effectBattler, enum MoveEffect moveEffect, const u8 *battleScript, enum SetMoveEffectFlags effectFlags)
{
    enum Ability abilities[MAX_BATTLERS_COUNT] = {ABILITY_NONE};
    abilities[battlerAtk] = GetBattlerAbility(battlerAtk);
    abilities[effectBattler] = GetBattlerAbility(effectBattler);

    s32 i;
    bool32 primary = effectFlags & EFFECT_PRIMARY;
    bool32 certain = effectFlags & EFFECT_CERTAIN;
    bool32 affectsUser = (battlerAtk == effectBattler);
    bool32 mirrorArmorReflected = (abilities[gBattlerTarget] == ABILITY_MIRROR_ARMOR);
    union StatChangeFlags flags = {0};
    bool32 activateAfterFaint = FALSE;

    if (gSpecialStatuses[gBattlerAttacker].parentalBondState == PARENTAL_BOND_1ST_HIT
        && IsBattlerAlive(gBattlerTarget)
        && IsFinalStrikeEffect(moveEffect))
    {
        gBattlescriptCurrInstr = battleScript;
        return;
    }

    switch (moveEffect) // Set move effects which happen later on
    {
    case MOVE_EFFECT_STEALTH_ROCK:
    case MOVE_EFFECT_PAYDAY:
    case MOVE_EFFECT_BUG_BITE:
    case MOVE_EFFECT_FLAME_BURST:
        activateAfterFaint = TRUE;
        break;
    default:
        break;
    }

    gBattleScripting.battler = battlerAtk;
    gEffectBattler = effectBattler;

    if (!primary && !affectsUser && IsMoveEffectBlockedByTarget(abilities[effectBattler]))
        moveEffect = MOVE_EFFECT_NONE;
    else if (!primary
          && IsSheerForceAffected(gCurrentMove, abilities[battlerAtk])
          && !(moveEffect == MOVE_EFFECT_ORDER_UP && gBattleStruct->battlerState[gBattlerAttacker].commanderSpecies != SPECIES_NONE))
        moveEffect = MOVE_EFFECT_NONE;
    else if (!IsBattlerAlive(gEffectBattler) && !activateAfterFaint)
        moveEffect = MOVE_EFFECT_NONE;
    else if (DoesSubstituteBlockMove(gBattlerAttacker, gEffectBattler, gCurrentMove) && !affectsUser)
        moveEffect = MOVE_EFFECT_NONE;

    gBattleScripting.moveEffect = moveEffect; // ChangeStatBuffs still needs the global moveEffect

    switch (moveEffect)
    {
    case MOVE_EFFECT_NONE:
        gBattlescriptCurrInstr = battleScript;
        break;
    case MOVE_EFFECT_SLEEP:
    case MOVE_EFFECT_POISON:
    case MOVE_EFFECT_BURN:
    case MOVE_EFFECT_FREEZE:
    case MOVE_EFFECT_PARALYSIS:
    case MOVE_EFFECT_TOXIC:
    case MOVE_EFFECT_FROSTBITE:
        if (gSideStatuses[GetBattlerSide(gEffectBattler)] & SIDE_STATUS_SAFEGUARD && !primary)
            gBattlescriptCurrInstr = battleScript;
        else if (CanSetNonVolatileStatus(
                    gBattlerAttacker,
                    gEffectBattler,
                    abilities[gBattlerAttacker],
                    abilities[gBattlerTarget],
                    moveEffect,
                    CHECK_TRIGGER))
            SetNonVolatileStatus(gEffectBattler, moveEffect, battleScript, TRIGGER_ON_MOVE);
        break;
    case MOVE_EFFECT_CONFUSION:
        if (!CanBeConfused(gEffectBattler)
         || gBattleMons[gEffectBattler].volatiles.confusionTurns
         || (gSideStatuses[GetBattlerSide(gEffectBattler)] & SIDE_STATUS_SAFEGUARD && !primary))
        {
            gBattlescriptCurrInstr = battleScript;
        }
        else
        {
            gBattleMons[gEffectBattler].volatiles.confusionTurns = RandomUniform(RNG_CONFUSION_TURNS, 2, B_CONFUSION_TURNS); // 2-5 turns

            // If the confusion is activating due to being released from Sky Drop, go to "confused due to fatigue" script.
            // Otherwise, do normal confusion script.
            if (GetMoveEffect(gCurrentMove) == EFFECT_SKY_DROP)
            {
                gBattleMons[gEffectBattler].volatiles.rampageTurns = 0;
                gBattlerAttacker = gEffectBattler;
                gBattlescriptCurrInstr = BattleScript_ThrashConfuses;
            }
            else
            {
                BattleScriptPush(battleScript);
                gBattlescriptCurrInstr = BattleScript_MoveEffectConfusion;
            }
        }
        break;
    case MOVE_EFFECT_FLINCH:
        if (abilities[effectBattler] == ABILITY_INNER_FOCUS)
        {
            // Inner Focus ALWAYS prevents flinching but only activates
            // on a move that's supposed to flinch, like Fake Out
            if (primary || certain)
            {
                gLastUsedAbility = ABILITY_INNER_FOCUS;
                gBattlerAbility = gEffectBattler;
                RecordAbilityBattle(gEffectBattler, ABILITY_INNER_FOCUS);
                BattleScriptPush(battleScript);
                gBattlescriptCurrInstr = BattleScript_FlinchPrevention;
            }
            else
            {
                gBattlescriptCurrInstr = battleScript;
            }
        }
        else if (gBattleMons[gEffectBattler].volatiles.flinched)
        {
            gBattlescriptCurrInstr = battleScript;
        }
        else if (!HasBattlerActedThisTurn(gEffectBattler)
              && GetActiveGimmick(gEffectBattler) != GIMMICK_DYNAMAX)
        {
            gBattleMons[gEffectBattler].volatiles.flinched = TRUE;
            gBattlescriptCurrInstr = battleScript;
        }
        else
        {
            gBattlescriptCurrInstr = battleScript;
        }
        break;
    case MOVE_EFFECT_UPROAR:
        if (!gBattleMons[gEffectBattler].volatiles.uproarTurns)
        {
            gBattleMons[gEffectBattler].volatiles.multipleTurns = TRUE;
            gLockedMoves[gEffectBattler] = gCurrentMove;
            gBattleMons[gEffectBattler].volatiles.uproarTurns = B_UPROAR_TURNS >= GEN_5
                                                                ? B_UPROAR_TURN_COUNT - 2
                                                                : RandomUniform(RNG_CONFUSION_TURNS, 2, B_UPROAR_TURN_COUNT);

            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_MoveEffectUproar;
        }
        else
        {
            gBattlescriptCurrInstr = battleScript;
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
                BattleScriptPush(battleScript);
                gBattlescriptCurrInstr = BattleScript_MoveEffectPayDay;
            }
            else
                gBattlescriptCurrInstr = battleScript;
        }
        else
        {
            gBattlescriptCurrInstr = battleScript;
        }
        break;
    case MOVE_EFFECT_HAPPY_HOUR:
        if (IsOnPlayerSide(gBattlerAttacker) && !gBattleStruct->moneyMultiplierMove)
        {
            gBattleStruct->moneyMultiplier *= 2;
            gBattleStruct->moneyMultiplierMove = 1;
        }
        gBattlescriptCurrInstr = battleScript;
        break;
    case MOVE_EFFECT_TRI_ATTACK:
        if (gBattleMons[gEffectBattler].status1)
        {
            gBattlescriptCurrInstr = battleScript;
        }
        else
        {
            static const u8 sTriAttackEffects[] =
            {
                MOVE_EFFECT_BURN,
                MOVE_EFFECT_FREEZE_OR_FROSTBITE,
                MOVE_EFFECT_PARALYSIS
            };
            SetMoveEffect(battlerAtk, effectBattler, RandomElement(RNG_TRI_ATTACK, sTriAttackEffects), battleScript, effectFlags);
        }
        break;
    case MOVE_EFFECT_WRAP:
        if (gBattleMons[gEffectBattler].volatiles.wrapped)
        {
            gBattlescriptCurrInstr = battleScript;
        }
        else
        {
            SetWrapTurns(gEffectBattler, GetBattlerHoldEffect(gBattlerAttacker));
            gBattleMons[gEffectBattler].volatiles.wrapped = TRUE;
            gBattleMons[gEffectBattler].volatiles.wrappedMove = gCurrentMove;
            gBattleMons[gEffectBattler].volatiles.wrappedBy = gBattlerAttacker;
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_MoveEffectWrap;
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
          || ChangeStatBuffs(
                effectBattler,
                SET_STAT_BUFF_VALUE(1),
                moveEffect - MOVE_EFFECT_ATK_PLUS_1 + 1,
                STAT_CHANGE_UPDATE_MOVE_EFFECT,
                0, 0) == STAT_CHANGE_DIDNT_WORK)
        {
            gBattlescriptCurrInstr = battleScript;
        }
        else
        {
            gBattleScripting.animArg1 = moveEffect;
            gBattleScripting.animArg2 = 0;
            BattleScriptPush(battleScript);
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
        flags.certain = affectsUser;
        if (mirrorArmorReflected && !affectsUser)
            flags.allowPtr = TRUE;
        else
            flags.updateMoveEffect = TRUE;

        if (ChangeStatBuffs(
                effectBattler,
                SET_STAT_BUFF_VALUE(1) | STAT_BUFF_NEGATIVE,
                moveEffect - MOVE_EFFECT_ATK_MINUS_1 + 1,
                flags,
                0, battleScript) == STAT_CHANGE_DIDNT_WORK)
        {
            if (!mirrorArmorReflected)
                gBattlescriptCurrInstr = battleScript;
        }
        else
        {
            gBattleScripting.animArg1 = moveEffect;
            gBattleScripting.animArg2 = 0;
            BattleScriptPush(battleScript);
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
          || ChangeStatBuffs(
                effectBattler,
                SET_STAT_BUFF_VALUE(2),
                moveEffect - MOVE_EFFECT_ATK_PLUS_2 + 1,
                STAT_CHANGE_UPDATE_MOVE_EFFECT,
                0, 0) == STAT_CHANGE_DIDNT_WORK)
        {
            gBattlescriptCurrInstr = battleScript;
        }
        else
        {
            gBattleScripting.animArg1 = moveEffect;
            gBattleScripting.animArg2 = 0;
            BattleScriptPush(battleScript);
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
        flags.certain = affectsUser;
        if (mirrorArmorReflected && !affectsUser)
            flags.allowPtr = TRUE;
        else
            flags.updateMoveEffect = TRUE;

        if (ChangeStatBuffs(
                effectBattler,
                SET_STAT_BUFF_VALUE(2) | STAT_BUFF_NEGATIVE,
                moveEffect - MOVE_EFFECT_ATK_MINUS_2 + 1,
                flags,
                0, battleScript) == STAT_CHANGE_DIDNT_WORK)
        {
            if (!mirrorArmorReflected)
                gBattlescriptCurrInstr = battleScript;
        }
        else
        {
            gBattleScripting.animArg1 = moveEffect;
            gBattleScripting.animArg2 = 0;
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_StatDown;
        }
        break;
    case MOVE_EFFECT_RECHARGE:
        if (B_SKIP_RECHARGE == GEN_1 && !IsBattlerAlive(gBattlerTarget))  // Skip recharge if gen 1 and foe is KO'd
            break;

        gBattleMons[gEffectBattler].volatiles.rechargeTimer = 2;
        gLockedMoves[gEffectBattler] = gCurrentMove;
        gBattlescriptCurrInstr = battleScript;
        break;
    case MOVE_EFFECT_RAGE:
        gBattleMons[gBattlerAttacker].volatiles.rage = TRUE;
        gBattlescriptCurrInstr = battleScript;
        break;
    case MOVE_EFFECT_PREVENT_ESCAPE:
        if (!gBattleMons[gBattlerTarget].volatiles.escapePrevention) // Do we need to check if the status is already set?
        {
            gBattleMons[gBattlerTarget].volatiles.escapePrevention = TRUE;
            gBattleMons[gBattlerTarget].volatiles.battlerPreventingEscape = gBattlerAttacker;
        }
        gBattlescriptCurrInstr = battleScript;
        break;
    case MOVE_EFFECT_NIGHTMARE:
        gBattleMons[gBattlerTarget].volatiles.nightmare = TRUE;
        gBattlescriptCurrInstr = battleScript;
        break;
    case MOVE_EFFECT_GLAIVE_RUSH:
        gBattleMons[gBattlerAttacker].volatiles.glaiveRush = TRUE;
        gBattlescriptCurrInstr = battleScript;
        break;
    case MOVE_EFFECT_ALL_STATS_UP:
        if (!NoAliveMonsForEitherParty())
        {
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_AllStatsUp;
        }
        break;
    case MOVE_EFFECT_ATK_DEF_DOWN: // SuperPower
        if (!NoAliveMonsForEitherParty())
        {
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_AtkDefDown;
        }
        break;
    case MOVE_EFFECT_DEF_SPDEF_DOWN: // Close Combat
        if (!NoAliveMonsForEitherParty())
        {
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_DefSpDefDown;
        }
        break;
    case MOVE_EFFECT_RECOIL_HP_25: // Struggle
    {
        s32 recoil = (gBattleMons[gEffectBattler].maxHP) / 4;
        if (recoil == 0)
            recoil = 1;
        if (abilities[gEffectBattler] == ABILITY_PARENTAL_BOND)
            recoil *= 2;
        SetPassiveDamageAmount(gEffectBattler, recoil);
        TryUpdateEvolutionTracker(IF_RECOIL_DAMAGE_GE, gBattleStruct->passiveHpUpdate[gBattlerAttacker], MOVE_NONE);
        BattleScriptPush(battleScript);
        gBattlescriptCurrInstr = BattleScript_MoveEffectRecoil;
        break;
    }
    case MOVE_EFFECT_THRASH:
        // Petal Dance doesn't lock mons that copy the move with Dancer
        if (gSpecialStatuses[gEffectBattler].dancerUsedMove || gBattleMons[gEffectBattler].volatiles.rampageTurns)
        {
            gBattlescriptCurrInstr = battleScript;
        }
        else
        {
            gBattleMons[gEffectBattler].volatiles.multipleTurns = TRUE;
            gLockedMoves[gEffectBattler] = gCurrentMove;
            gBattleMons[gEffectBattler].volatiles.rampageTurns = RandomUniform(RNG_RAMPAGE_TURNS, 2, B_RAMPAGE_TURNS);
        }
        break;
    case MOVE_EFFECT_CLEAR_SMOG:
        for (i = 0; i < NUM_BATTLE_STATS; i++)
        {
            if (gBattleMons[gEffectBattler].statStages[i] != DEFAULT_STAT_STAGE)
                break;
        }
        if (IsBattlerTurnDamaged(gEffectBattler) && i != NUM_BATTLE_STATS)
        {
            for (i = 0; i < NUM_BATTLE_STATS; i++)
                gBattleMons[gEffectBattler].statStages[i] = DEFAULT_STAT_STAGE;
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_MoveEffectClearSmog;
        }
        break;
    case MOVE_EFFECT_FLAME_BURST:
        if (IsBattlerAlive(BATTLE_PARTNER(gBattlerTarget))
         && !IsSemiInvulnerable(BATTLE_PARTNER(gBattlerTarget), CHECK_ALL)
         && GetBattlerAbility(BATTLE_PARTNER(gBattlerTarget)) != ABILITY_MAGIC_GUARD)
        {
            u32 partnerTarget = BATTLE_PARTNER(gBattlerTarget);
            gBattleScripting.battler = partnerTarget;
            SetPassiveDamageAmount(partnerTarget, gBattleMons[partnerTarget].maxHP / 16);
            BattleScriptPush(battleScript);
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
            BattleScriptPush(battleScript);
            if (gCurrentMove == MOVE_HYPERSPACE_FURY)
                gBattlescriptCurrInstr = BattleScript_HyperspaceFuryRemoveProtect;
            else
                gBattlescriptCurrInstr = BattleScript_MoveEffectFeint;
        }
        break;
    case MOVE_EFFECT_V_CREATE:
        if (!NoAliveMonsForEitherParty())
        {
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_VCreateStatLoss;
        }
        break;
    case MOVE_EFFECT_CORE_ENFORCER:
        if (HasBattlerActedThisTurn(gBattlerTarget)
         && !NoAliveMonsForEitherParty())
        {
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_MoveEffectCoreEnforcer;
        }
        break;
    case MOVE_EFFECT_THROAT_CHOP:
        gBattleMons[gEffectBattler].volatiles.throatChopTimer = B_THROAT_CHOP_TIMER;
        gBattlescriptCurrInstr = battleScript;
        break;
    case MOVE_EFFECT_INCINERATE:
        if ((gBattleMons[gEffectBattler].item >= FIRST_BERRY_INDEX && gBattleMons[gEffectBattler].item <= LAST_BERRY_INDEX)
         || (B_INCINERATE_GEMS >= GEN_6 && GetBattlerHoldEffect(gEffectBattler) == HOLD_EFFECT_GEMS))
        {
            gLastUsedItem = gBattleMons[gEffectBattler].item;
            gBattleMons[gEffectBattler].item = 0;
            CheckSetUnburden(gEffectBattler);

            BtlController_EmitSetMonData(gEffectBattler, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[gEffectBattler].item), &gBattleMons[gEffectBattler].item);
            MarkBattlerForControllerExec(gEffectBattler);
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_MoveEffectIncinerate;
        }
        break;
    case MOVE_EFFECT_BUG_BITE:
        if (GetBattlerHoldEffect(gEffectBattler) == HOLD_EFFECT_JABOCA_BERRY)
        {
            // jaboca berry triggers instead of being stolen
            gBattlescriptCurrInstr = battleScript;
        }
        else if (GetItemPocket(gBattleMons[gEffectBattler].item) == POCKET_BERRIES
            && abilities[effectBattler] != ABILITY_STICKY_HOLD)
        {
            // target loses their berry
            gLastUsedItem = gBattleMons[gEffectBattler].item;
            gBattleMons[gEffectBattler].item = 0;
            CheckSetUnburden(gEffectBattler);

            BtlController_EmitSetMonData(gEffectBattler, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[gEffectBattler].item), &gBattleMons[gEffectBattler].item);
            MarkBattlerForControllerExec(gEffectBattler);
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_MoveEffectBugBite;
        }
        break;
    case MOVE_EFFECT_TRAP_BOTH:
        if (!(gBattleMons[gBattlerTarget].volatiles.escapePrevention || gBattleMons[gBattlerAttacker].volatiles.escapePrevention))
        {
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_BothCanNoLongerEscape;
        }
        if (!gBattleMons[gBattlerTarget].volatiles.escapePrevention)
            gBattleMons[gBattlerTarget].volatiles.battlerPreventingEscape = gBattlerAttacker;

        if (!gBattleMons[gBattlerAttacker].volatiles.escapePrevention)
            gBattleMons[gBattlerAttacker].volatiles.battlerPreventingEscape = gBattlerTarget;

        gBattleMons[gBattlerTarget].volatiles.escapePrevention = TRUE;
        gBattleMons[gBattlerAttacker].volatiles.escapePrevention = TRUE;
        break;
    case MOVE_EFFECT_REMOVE_ARG_TYPE:
    {
        u32 type = GetMoveArgType(gCurrentMove);
        // This seems unnecessary but is done to make it work properly with Parental Bond
        BattleScriptPush(battleScript);
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
        gBattlescriptCurrInstr = battleScript;
        break;
    case MOVE_EFFECT_DIRE_CLAW:
        if (!gBattleMons[gEffectBattler].status1)
        {
            static const u8 sDireClawEffects[] = { MOVE_EFFECT_POISON, MOVE_EFFECT_PARALYSIS, MOVE_EFFECT_SLEEP };
            SetMoveEffect(battlerAtk, effectBattler, RandomElement(RNG_DIRE_CLAW, sDireClawEffects), battleScript, effectFlags);
        }
        break;
    case MOVE_EFFECT_STEALTH_ROCK:
        if (!IsHazardOnSide(GetBattlerSide(gEffectBattler), HAZARDS_STEALTH_ROCK))
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_POINTEDSTONESFLOAT;
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_StealthRockActivates;
        }
        break;
    case MOVE_EFFECT_SYRUP_BOMB:
        if (!gBattleMons[gEffectBattler].volatiles.syrupBomb)
        {
            struct Pokemon *mon = GetBattlerMon(gBattlerAttacker);

            gBattleMons[gEffectBattler].volatiles.syrupBomb = TRUE;
            gBattleMons[gEffectBattler].volatiles.stickySyrupedBy = gBattlerAttacker;
            gBattleMons[gEffectBattler].volatiles.syrupBombTimer = B_SYRUP_BOMB_TIMER;
            gBattleMons[gEffectBattler].volatiles.syrupBombIsShiny = IsMonShiny(mon);
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_SyrupBombActivates;
        }
        break;
    case MOVE_EFFECT_SECRET_POWER:
        if (gFieldStatuses & STATUS_FIELD_TERRAIN_ANY)
        {
            switch (gFieldStatuses & STATUS_FIELD_TERRAIN_ANY)
            {
            case STATUS_FIELD_MISTY_TERRAIN:
                moveEffect = MOVE_EFFECT_SP_ATK_MINUS_1;
                break;
            case STATUS_FIELD_GRASSY_TERRAIN:
                moveEffect = MOVE_EFFECT_SLEEP;
                break;
            case STATUS_FIELD_ELECTRIC_TERRAIN:
                moveEffect = MOVE_EFFECT_PARALYSIS;
                break;
            case STATUS_FIELD_PSYCHIC_TERRAIN:
                moveEffect = MOVE_EFFECT_SPD_MINUS_1;
                break;
            default:
                moveEffect = MOVE_EFFECT_PARALYSIS;
                break;
            }
        }
        else
        {
            SetMoveEffect(battlerAtk, effectBattler, gBattleEnvironmentInfo[gBattleEnvironment].secretPowerEffect, battleScript, effectFlags);
        }
        break;
    case MOVE_EFFECT_PSYCHIC_NOISE:
    {
        u32 battler = IsAbilityOnSide(gEffectBattler, ABILITY_AROMA_VEIL);

        if (battler)
        {
            gBattlerAbility = battler - 1;
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_AromaVeilProtectsRet;
        }
        else if (!gBattleMons[gEffectBattler].volatiles.healBlock)
        {
            gBattleMons[gEffectBattler].volatiles.healBlock = TRUE;
            gBattleMons[gEffectBattler].volatiles.healBlockTimer = 2;
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_EffectPsychicNoise;
        }
        break;
    }
    case MOVE_EFFECT_TERA_BLAST:
        if (GetActiveGimmick(gEffectBattler) == GIMMICK_TERA
            && GetBattlerTeraType(gEffectBattler) == TYPE_STELLAR
            && !NoAliveMonsForEitherParty())
        {
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_LowerAtkSpAtk;
        }
        break;
    case MOVE_EFFECT_ORDER_UP:
        {
            enum Stat stat = 0;
            bool32 commanderAffected = TRUE;
            switch (gBattleStruct->battlerState[gEffectBattler].commanderSpecies)
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
             || ChangeStatBuffs(
                    effectBattler,
                    SET_STAT_BUFF_VALUE(1),
                    stat,
                    STAT_CHANGE_UPDATE_MOVE_EFFECT,
                    0,
                    0) == STAT_CHANGE_DIDNT_WORK)
            {
                gBattlescriptCurrInstr = battleScript;
            }
            else
            {
                gBattleScripting.animArg1 = moveEffect;
                gBattleScripting.animArg2 = 0;
                BattleScriptPush(battleScript);
                gBattlescriptCurrInstr = BattleScript_StatUp;
            }
        }
        break;
    case MOVE_EFFECT_ION_DELUGE:
        if (!(gFieldStatuses & STATUS_FIELD_ION_DELUGE))
        {
            gFieldStatuses |= STATUS_FIELD_ION_DELUGE;
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_MoveEffectIonDeluge;
        }
        break;
    case MOVE_EFFECT_HAZE:
        for (i = 0; i < gBattlersCount; i++)
            TryResetBattlerStatChanges(i);
        BattleScriptPush(battleScript);
        gBattlescriptCurrInstr = BattleScript_MoveEffectHaze;
        break;
    case MOVE_EFFECT_LEECH_SEED:
        if (!IS_BATTLER_OF_TYPE(gBattlerTarget, TYPE_GRASS) && !gBattleMons[gBattlerTarget].volatiles.leechSeed)
        {
            gBattleMons[gBattlerTarget].volatiles.leechSeed = LEECHSEEDED_BY(gBattlerAttacker);
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_MoveEffectLeechSeed;
        }
        break;
    case MOVE_EFFECT_REFLECT:
        if (TrySetReflect(gBattlerAttacker))
        {
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_MoveEffectReflect;
        }
        break;
    case MOVE_EFFECT_LIGHT_SCREEN:
        if (TrySetLightScreen(gBattlerAttacker))
        {
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_MoveEffectLightScreen;
        }
        break;
    case MOVE_EFFECT_SALT_CURE:
        if (!gBattleMons[gBattlerTarget].volatiles.saltCure)
        {
            gBattleMons[gBattlerTarget].volatiles.saltCure = TRUE;
            BattleScriptPush(battleScript);
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
                if (!(gBattleMons[gBattlerTarget].volatiles.mimickedMoves & (1u << i))
                    && !(gBattleMons[gBattlerTarget].volatiles.transformed))
                {
                    BtlController_EmitSetMonData(gBattlerTarget, B_COMM_TO_CONTROLLER, REQUEST_PPMOVE1_BATTLE + i, 0, sizeof(gBattleMons[gBattlerTarget].pp[i]), &gBattleMons[gBattlerTarget].pp[i]);
                    MarkBattlerForControllerExec(gBattlerTarget);
                }

                if (gBattleMons[gBattlerTarget].pp[i] == 0 && gBattleStruct->skyDropTargets[gBattlerTarget] == SKY_DROP_NO_TARGET)
                    CancelMultiTurnMoves(gBattlerTarget, SKY_DROP_IGNORE);

                BattleScriptPush(battleScript);
                gBattlescriptCurrInstr = BattleScript_MoveEffectEerieSpell;
            }
        }
        break;
    case MOVE_EFFECT_RAISE_TEAM_ATTACK:
        if (!NoAliveMonsForEitherParty())
        {
            // Max Effects are ordered by stat ID.
            SET_STATCHANGER(STAT_ATK, 1, FALSE);
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_EffectRaiseStatAllies;
        }
        break;
    case MOVE_EFFECT_RAISE_TEAM_DEFENSE:
        if (!NoAliveMonsForEitherParty())
        {
            // Max Effects are ordered by stat ID.
            SET_STATCHANGER(STAT_DEF, 1, FALSE);
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_EffectRaiseStatAllies;
        }
        break;
    case MOVE_EFFECT_RAISE_TEAM_SPEED:
        if (!NoAliveMonsForEitherParty())
        {
            // Max Effects are ordered by stat ID.
            SET_STATCHANGER(STAT_SPEED, 1, FALSE);
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_EffectRaiseStatAllies;
        }
        break;
    case MOVE_EFFECT_RAISE_TEAM_SP_ATK:
        if (!NoAliveMonsForEitherParty())
        {
            // Max Effects are ordered by stat ID.
            SET_STATCHANGER(STAT_SPATK, 1, FALSE);
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_EffectRaiseStatAllies;
        }
        break;
    case MOVE_EFFECT_RAISE_TEAM_SP_DEF:
        if (!NoAliveMonsForEitherParty())
        {
            // Max Effects are ordered by stat ID.
            SET_STATCHANGER(STAT_SPDEF, 1, FALSE);
            BattleScriptPush(battleScript);
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
            enum Stat statId = 0;
            u32 stage = 1;
            switch (moveEffect)
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
                    statId = moveEffect - MOVE_EFFECT_LOWER_ATTACK_SIDE + 1;
                    break;
            }
            SET_STATCHANGER(statId, stage, TRUE);
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_EffectLowerStatFoes;
        }
        break;
    case MOVE_EFFECT_SUN:
    case MOVE_EFFECT_RAIN:
    case MOVE_EFFECT_SANDSTORM:
    case MOVE_EFFECT_HAIL:
    {
        u8 weather = 0, msg = 0;
        switch (moveEffect)
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
            default:
                break;
        }
        if (TryChangeBattleWeather(gBattlerAttacker, weather, ABILITY_NONE))
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = msg;
            BattleScriptPush(battleScript);
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
        switch (moveEffect)
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
            default:
                break;
        }
        if (TryChangeBattleTerrain(gBattlerAttacker, statusFlag))
        {
            BattleScriptPush(battleScript);
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
            gSideTimers[side].damageNonTypesTimer = 5;
            gSideTimers[side].damageNonTypesType = moveType;
            BattleScriptPush(battleScript);
            ChooseDamageNonTypesString(moveType);
            gBattlescriptCurrInstr = BattleScript_DamageNonTypesStarts;
        }
        break;
    }
    case MOVE_EFFECT_STEELSURGE:
        if (!IsHazardOnSide(GetBattlerSide(gBattlerTarget), HAZARDS_STEELSURGE))
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SHARPSTEELFLOATS;
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_EffectSteelsurge;
        }
        break;
    case MOVE_EFFECT_DEFOG:
        if (gSideStatuses[GetBattlerSide(gBattlerTarget)] & SIDE_STATUS_SCREEN_ANY
            || AreAnyHazardsOnSide(GetBattlerSide(gBattlerTarget))
            || AreAnyHazardsOnSide(GetBattlerSide(gBattlerAttacker))
            || gFieldStatuses & STATUS_FIELD_TERRAIN_ANY)
        {
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_MoveEffectDefog;
        }
        break;
    case MOVE_EFFECT_AURORA_VEIL:
        if (!(gSideStatuses[GetBattlerSide(gBattlerAttacker)] & SIDE_STATUS_AURORA_VEIL))
        {
            gSideStatuses[GetBattlerSide(gBattlerAttacker)] |= SIDE_STATUS_AURORA_VEIL;
            if (GetBattlerHoldEffect(gBattlerAttacker) == HOLD_EFFECT_LIGHT_CLAY)
                gSideTimers[GetBattlerSide(gBattlerAttacker)].auroraVeilTimer = 8;
            else
                gSideTimers[GetBattlerSide(gBattlerAttacker)].auroraVeilTimer = 5;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_SAFEGUARD;
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_MoveEffectAuroraVeil;
        }
        break;
    case MOVE_EFFECT_GRAVITY:
        if (!(gFieldStatuses & STATUS_FIELD_GRAVITY))
        {
            gFieldStatuses |= STATUS_FIELD_GRAVITY;
            gFieldTimers.gravityTimer = 5;
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_EffectGravitySuccess;
        }
        break;
    case MOVE_EFFECT_SANDBLAST_SIDE:
    case MOVE_EFFECT_FIRE_SPIN_SIDE:
        // Affects both opponents, but doesn't print strings so we can handle it here.
        for (u32 battler = 0; battler < MAX_BATTLERS_COUNT; ++battler)
        {
            if (!IsBattlerAlly(battler, gBattlerTarget))
                continue;
            if (!gBattleMons[battler].volatiles.wrapped)
            {
                gBattleMons[battler].volatiles.wrapped = TRUE;
                SetWrapTurns(battler, GetBattlerHoldEffect(gBattlerAttacker));
                // The Wrap effect does not expire when the user switches, so here's some cheese.
                gBattleMons[battler].volatiles.wrappedBy = gBattlerTarget;
                if (moveEffect == MOVE_EFFECT_SANDBLAST_SIDE)
                    gBattleMons[battler].volatiles.wrappedMove = MOVE_SAND_TOMB;
                else
                    gBattleMons[battler].volatiles.wrappedMove = MOVE_FIRE_SPIN;
            }
        }
        break;
    case MOVE_EFFECT_YAWN_FOE:
        if (gBattleMons[gBattlerTarget].volatiles.yawn == 0
            && CanBeSlept(gBattlerTarget, gBattlerTarget, abilities[gBattlerTarget], BLOCKED_BY_SLEEP_CLAUSE)
            && RandomPercentage(RNG_G_MAX_SNOOZE, 50))
        {
            gBattleMons[gBattlerTarget].volatiles.yawn = 2;
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_MoveEffectYawnSide;
        }
        break;
    case MOVE_EFFECT_SPITE:
        if (gLastMoves[gBattlerTarget] != MOVE_NONE
            && gLastMoves[gBattlerTarget] != MOVE_UNAVAILABLE)
        {
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_EffectTryReducePP;
        }
        break;
    case MOVE_EFFECT_PARALYZE_SIDE:
        BattleScriptPush(battleScript);
        gBattlescriptCurrInstr = BattleScript_EffectParalyzeSide;
        break;
    case MOVE_EFFECT_POISON_SIDE:
        BattleScriptPush(battleScript);
        gBattlescriptCurrInstr = BattleScript_EffectPoisonSide;
        break;
    case MOVE_EFFECT_POISON_PARALYZE_SIDE:
        BattleScriptPush(battleScript);
        gBattlescriptCurrInstr = BattleScript_EffectPoisonParalyzeSide;
        break;
    case MOVE_EFFECT_EFFECT_SPORE_SIDE:
        BattleScriptPush(battleScript);
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
        BattleScriptPush(battleScript);
        gBattlescriptCurrInstr = BattleScript_EffectConfuseSide;
        break;
    case MOVE_EFFECT_INFATUATE_SIDE:
        BattleScriptPush(battleScript);
        gBattlescriptCurrInstr = BattleScript_EffectInfatuateSide;
        break;
    case MOVE_EFFECT_TORMENT_SIDE:
        BattleScriptPush(battleScript);
        gBattlescriptCurrInstr = BattleScript_EffectTormentSide;
        break;
    case MOVE_EFFECT_PREVENT_ESCAPE_SIDE:
        BattleScriptPush(battleScript);
        gBattlescriptCurrInstr = BattleScript_EffectMeanLookSide;
        break;
    case MOVE_EFFECT_CRIT_PLUS_SIDE:
        if (gBattleMons[gBattlerAttacker].volatiles.bonusCritStages < 3)
            gBattleMons[gBattlerAttacker].volatiles.bonusCritStages++;
        if (gBattleMons[BATTLE_PARTNER(gBattlerAttacker)].volatiles.bonusCritStages < 3)
            gBattleMons[BATTLE_PARTNER(gBattlerAttacker)].volatiles.bonusCritStages++;
        BattleScriptPush(battleScript);
        gBattlescriptCurrInstr = BattleScript_EffectRaiseCritAlliesAnim;
        break;
    case MOVE_EFFECT_HEAL_TEAM:
        BattleScriptPush(battleScript);
        gBattlescriptCurrInstr = BattleScript_EffectHealOneSixthAllies;
        break;
    case MOVE_EFFECT_AROMATHERAPY:
        BattleScriptPush(battleScript);
        gBattlescriptCurrInstr = BattleScript_MoveEffectAromatherapy;
        break;
    case MOVE_EFFECT_RECYCLE_BERRIES:
        if (RandomPercentage(RNG_G_MAX_REPLENISH, 50))
        {
            BattleScriptPush(battleScript);
            gBattlescriptCurrInstr = BattleScript_EffectRecycleBerriesAllies;
        }
        break;
    case MOVE_EFFECT_REMOVE_STATUS:
    {
        u32 argStatus = GetMoveEffectArg_Status(gCurrentMove);
        if ((gBattleMons[gEffectBattler].status1 & argStatus)
         && (NumAffectedSpreadMoveTargets() > 1 || !IsMoveEffectBlockedByTarget(abilities[gEffectBattler])))
        {
            gBattleMons[gEffectBattler].status1 &= ~(argStatus);
            BtlController_EmitSetMonData(gEffectBattler, 0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gEffectBattler].status1);
            MarkBattlerForControllerExec(gEffectBattler);
            BattleScriptPush(battleScript);

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
    case MOVE_EFFECT_BREAK_SCREEN:
        if (B_BRICK_BREAK >= GEN_4)
        	i = GetBattlerSide(gBattlerTarget); // From Gen 4 onwards, Brick Break can remove screens on the user's side if used on an ally
        else
        	i = GetBattlerSide(gBattlerAttacker) ^ BIT_SIDE;

        if (gSideStatuses[i] & SIDE_STATUS_SCREEN_ANY)
        {
            bool32 failed;

            if (B_BRICK_BREAK >= GEN_5)
            	failed = gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT;
            else
            	failed = FALSE;

        	if (!failed)
        	{
            	gSideStatuses[i] &= ~SIDE_STATUS_SCREEN_ANY;
            	gBattleScripting.animTurn = 1;
            	gBattleScripting.animTargetsHit = 1;
            	gBattleStruct->preAttackAnimPlayed = TRUE; // The whole brick break animation is covered by the move so don't play twice
            	BattleScriptPush(battleScript);
            	gBattlescriptCurrInstr = BattleScript_BreakScreens;
        	}
        	else
        	{
        		gBattleScripting.animTurn = 0;
        		gBattleScripting.animTargetsHit = 0;
        	}
        }
        break;
    case MOVE_EFFECT_STEAL_STATS:
        if (gBattleStruct->moveResultFlags[gBattlerTarget] & MOVE_RESULT_NO_EFFECT)
        {
            break;
        }
        else
        {
            bool32 contrary = abilities[gBattlerAttacker] == ABILITY_CONTRARY;
            gBattleStruct->stolenStats[0] = 0; // Stats to steal.
            gBattleScripting.animArg1 = 0;
            for (enum Stat stat = STAT_ATK; stat < NUM_BATTLE_STATS; stat++)
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
            {
                gBattleStruct->preAttackAnimPlayed = FALSE; // if set by the previous move effect, reset it for final Spectral Thief anim
                BattleScriptPush(battleScript);
                gBattlescriptCurrInstr = BattleScript_StealStats;
            }
        }
        break;
    default:
        break;
    }

    gBattleScripting.moveEffect = MOVE_EFFECT_NONE;
}

static void Cmd_setpreattackadditionaleffect(void)
{
    CMD_ARGS();

    u32 numAdditionalEffects = GetMoveAdditionalEffectCount(gCurrentMove);
    if (numAdditionalEffects > gBattleStruct->additionalEffectsCounter)
    {
        const struct AdditionalEffect *additionalEffect = GetMoveAdditionalEffectById(gCurrentMove, gBattleStruct->additionalEffectsCounter);
        gBattleStruct->additionalEffectsCounter++;

        if (!additionalEffect->preAttackEffect)
            return;

        SetMoveEffect(
        	gBattlerAttacker,
        	additionalEffect->self ? gBattlerAttacker : gBattlerTarget,
        	additionalEffect->moveEffect,
        	gBattlescriptCurrInstr,
        	EFFECT_PRIMARY
        );

        return;
    }

    gBattleStruct->additionalEffectsCounter = 0;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static bool32 CanApplyAdditionalEffect(const struct AdditionalEffect *additionalEffect)
{
    if (additionalEffect->preAttackEffect)
        return FALSE;

    // If Toxic Chain will activate it blocks all other non volatile effects
    if (gBattleStruct->toxicChainPriority && additionalEffect->moveEffect <= MOVE_EFFECT_FROSTBITE)
        return FALSE;

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

static void SetToxicChainPriority(void)
{
    if (gBattleStruct->toxicChainPriority)
        return;

    enum Ability abilityAtk = GetBattlerAbility(gBattlerAttacker);
    if (abilityAtk == ABILITY_TOXIC_CHAIN
     && IsBattlerAlive(gBattlerTarget)
     && CanBePoisoned(gBattlerAttacker, gBattlerTarget, abilityAtk, GetBattlerAbility(gBattlerTarget))
     && IsBattlerTurnDamaged(gBattlerTarget)
     && RandomWeighted(RNG_TOXIC_CHAIN, 7, 3))
        gBattleStruct->toxicChainPriority = TRUE;
}

static void Cmd_setadditionaleffects(void)
{
    CMD_ARGS();

    if (!IsBattlerUnaffectedByMove(gBattlerTarget))
    {
        u32 numAdditionalEffects = GetMoveAdditionalEffectCount(gCurrentMove);
        SetToxicChainPriority();
        if (numAdditionalEffects > gBattleStruct->additionalEffectsCounter)
        {
            u32 percentChance;
            const struct AdditionalEffect *additionalEffect = GetMoveAdditionalEffectById(gCurrentMove, gBattleStruct->additionalEffectsCounter);

            // Various checks for if this move effect can be applied this turn
            if (CanApplyAdditionalEffect(additionalEffect))
            {
                percentChance = CalcSecondaryEffectChance(gBattlerAttacker, GetBattlerAbility(gBattlerAttacker), additionalEffect);

                // Activate effect if it's primary (chance == 0) or if RNGesus says so
                if ((percentChance == 0) || RandomPercentage(RNG_SECONDARY_EFFECT + gBattleStruct->additionalEffectsCounter, percentChance))
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = *((u8 *) &additionalEffect->multistring);

                    enum SetMoveEffectFlags flags = NO_FLAGS;
                    if (percentChance == 0) flags |= EFFECT_PRIMARY;
                    if (percentChance >= 100) flags |= EFFECT_CERTAIN;

                    SetMoveEffect(
                        gBattlerAttacker,
                        additionalEffect->self ? gBattlerAttacker : gBattlerTarget,
                        additionalEffect->moveEffect,
                        gBattlescriptCurrInstr,
                        flags
                    );

                    gBattleStruct->additionalEffectsCounter++;
				    return;
                }
            }

            gBattleStruct->additionalEffectsCounter++;
        }
    }

    gBattleStruct->additionalEffectsCounter = 0;
    gBattleScripting.moveEffect = 0;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_seteffectprimary(void)
{
    CMD_ARGS(u8 battler, u8 effectBattler);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    u32 effectBattler = GetBattlerForBattleScript(cmd->effectBattler);
    SetMoveEffect(battler, effectBattler, gBattleScripting.moveEffect, cmd->nextInstr, EFFECT_PRIMARY);
}

static void Cmd_seteffectsecondary(void)
{
    CMD_ARGS(u8 battler, u8 effectBattler);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    u32 effectBattler = GetBattlerForBattleScript(cmd->effectBattler);
    SetMoveEffect(battler, effectBattler, gBattleScripting.moveEffect, cmd->nextInstr, EFFECT_PRIMARY);
}

static void Cmd_clearvolatile(void)
{
    CMD_ARGS(u8 battler, u8 _volatile);

    u32 battler = GetBattlerForBattleScript(cmd->battler);

    SetMonVolatile(battler, cmd->_volatile, 0);
    if (cmd->_volatile == VOLATILE_MULTIPLETURNS)
        gProtectStructs[battler].chargingTurn = FALSE;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_tryfaintmon(void)
{
    CMD_ARGS(u8 battler, bool8 isSpikes, const u8 *instr);
    u32 battler;

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
        if (!IsBattlerAlive(battler)
         && !(gBattleStruct->battlerState[battler].fainted))
        {
            if (gBattleMons[battler].volatiles.neutralizingGas)
            {
                gBattleMons[battler].volatiles.neutralizingGas = FALSE;
                if (!IsNeutralizingGasOnField())
                {
                    BattleScriptPush(gBattlescriptCurrInstr);
                    gBattlescriptCurrInstr = BattleScript_NeutralizingGasExits;
                    return;
                }
            }

            gHitMarker |= HITMARKER_FAINTED(battler);
            gBattleStruct->eventState.faintedAction = 0;
            gBattlerFainted = battler;
            BattleScriptPush(cmd->nextInstr);
            gBattlescriptCurrInstr = BattleScript_FaintBattler;
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
                gBattleResults.lastOpponentSpecies = GetMonData(GetBattlerMon(battler), MON_DATA_SPECIES);
                gSideTimers[B_SIDE_OPPONENT].retaliateTimer = 2;
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
        UndoDynamax(battler);
        gBattleScripting.battler = battler;
        BattleScriptCall(BattleScript_DynamaxEnds_Ret);
        return;
    }

    gBattleStruct->battlerState[battler].fainted = TRUE;

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

static void Cmd_jumpifvolatile(void)
{
    CMD_ARGS(u8 battler, u8 _volatile, const u8 *jumpInstr);

    u8 battler = GetBattlerForBattleScript(cmd->battler);
    const u8 *jumpInstr = cmd->jumpInstr;

    if (GetBattlerVolatile(battler, cmd->_volatile) != 0 && IsBattlerAlive(battler))
        gBattlescriptCurrInstr = jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_jumpifability(void)
{
    CMD_ARGS(u8 battler, enum Ability ability, const u8 *jumpInstr);

    u32 battler;
    bool32 hasAbility = FALSE;
    enum Ability ability = cmd->ability;

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

    enum BattleSide side = GetBattlerSide(GetBattlerForBattleScript(cmd->battler));

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

    ret = CompareStat(battler, stat, value, comparison, GetBattlerAbility(battler));

    if (ret)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_jumpifstatignorecontrary(void)
{
    CMD_ARGS(u8 battler, u8 comparison, u8 stat, u8 value, const u8 *jumpInstr);

    bool32 ret = 0;
    u8 battler = GetBattlerForBattleScript(cmd->battler);
    u8 stat = cmd->stat;
    u8 value = cmd->value;
    u8 comparison = cmd->comparison;

    ret = CompareStat(battler, stat, value, comparison, ABILITY_NONE);

    if (ret)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
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
    enum HoldEffect holdEffect;
    enum Item item = GetMonData(mon, MON_DATA_HELD_ITEM);

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

    enum HoldEffect holdEffect;
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
                    && (!IsDoubleBattle() || !IsBattlerAlive(GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT)))
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
                        gBattleStruct->battlerExpReward += GetSoftLevelCapExpValue(gPlayerParty[*expMonId].level, gBattleStruct->expShareExpValue);
                    }

                    ApplyExperienceMultipliers(&gBattleStruct->battlerExpReward, *expMonId, gBattlerFainted);

                    if (B_EXP_CAP_TYPE == EXP_CAP_HARD && gBattleStruct->battlerExpReward != 0)
                    {
                        enum GrowthRate growthRate = gSpeciesInfo[GetMonData(&gPlayerParty[*expMonId], MON_DATA_SPECIES)].growthRate;
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

                gLeveledUpInBattle |= 1 << *expMonId;
                BattleScriptCall(BattleScript_LevelUp);
                gBattleStruct->battlerExpReward = T1_READ_32(&gBattleResources->bufferB[expBattler][2]);
                AdjustFriendship(&gPlayerParty[*expMonId], FRIENDSHIP_EVENT_GROW_LEVEL);

                // update battle mon structure after level up
                if (gBattlerPartyIndexes[0] == *expMonId && gBattleMons[0].hp)
                    battler = 0;
                else if (gBattlerPartyIndexes[2] == *expMonId && gBattleMons[2].hp && (IsDoubleBattle()))
                    battler = 2;

                if (battler != 0xFF)
                {
                    if (gBattleMons[battler].volatiles.transformed)
                    {
                        gBattleMons[battler].level = GetMonData(&gPlayerParty[*expMonId], MON_DATA_LEVEL);
                        gBattleMons[battler].hp = GetMonData(&gPlayerParty[*expMonId], MON_DATA_HP);
                    }
                    else
                    {
                        CopyMonLevelAndBaseStatsToBattleMon(battler, &gPlayerParty[*expMonId]);
                    }
                    if (gBattleMons[battler].volatiles.powerTrick)
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

    if (B_MULTI_BATTLE_WHITEOUT > GEN_3 && gBattleTypeFlags & (BATTLE_TYPE_MULTI | BATTLE_TYPE_INGAME_PARTNER)
     && !(gBattleTypeFlags & BATTLE_TYPE_ARENA) && !(IsMultibattleTest())) // Multibattle tests appear to not save the player party data for the check below.
    {
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (!GetMonData(GetSavedPlayerPartyMon(i), MON_DATA_SPECIES)
             || !GetMonData(GetSavedPlayerPartyMon(i), MON_DATA_HP)
             || GetMonData(GetSavedPlayerPartyMon(i), MON_DATA_IS_EGG))
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
            if ((gHitMarker & HITMARKER_FAINTED(i)) && (!gSpecialStatuses[i].faintedHasReplacement))
                emptyPlayerSpots++;
        }

        emptyOpponentSpots = 0;
        for (i = 1; i < gBattlersCount; i += 2)
        {
            if ((gHitMarker & HITMARKER_FAINTED(i)) && (!gSpecialStatuses[i].faintedHasReplacement))
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
            u32 emptySlotsTotal = emptyPlayerSpots + emptyOpponentSpots;
            u32 alivePartyMonsTotal = alivePlayerPartyMons + aliveOpponentPartyMons;

            if (emptySlotsTotal >= 2 && alivePartyMonsTotal >= 2)
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

static void Cmd_isdmgblockedbydisguise(void)
{
    CMD_ARGS();

    if (!IsMimikyuDisguised(gBattlerAttacker)
     || gBattleMons[gBattlerAttacker].volatiles.transformed
     || !IsAbilityAndRecord(gBattlerAttacker, GetBattlerAbility(gBattlerAttacker), ABILITY_DISGUISE))
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }

    gBattleScripting.battler = gBattlerAttacker;
    if (GetBattlerPartyState(gBattlerAttacker)->changedSpecies == SPECIES_NONE)
        GetBattlerPartyState(gBattlerAttacker)->changedSpecies = gBattleMons[gBattlerAttacker].species;
    if (gBattleMons[gBattlerAttacker].species == SPECIES_MIMIKYU_TOTEM_DISGUISED)
        gBattleMons[gBattlerAttacker].species = SPECIES_MIMIKYU_BUSTED_TOTEM;
    else
        gBattleMons[gBattlerAttacker].species = SPECIES_MIMIKYU_BUSTED;
    if (GetConfig(CONFIG_DISGUISE_HP_LOSS) >= GEN_8)
        SetPassiveDamageAmount(gBattlerAttacker, GetNonDynamaxMaxHP(gBattlerAttacker) / 8);
    BattleScriptPush(BattleScript_MoveEnd);
    gBattlescriptCurrInstr = BattleScript_TargetFormChange;
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

    gBattleMons[gBattlerAttacker].volatiles.roostActive = TRUE;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_jumpifabilitypresent(void)
{
    CMD_ARGS(enum Ability ability, const u8 *jumpInstr);

    enum Ability ability = cmd->ability;
    enum Ability abilityBattler = IsAbilityOnField(ability);
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
    gBattleStruct->battlerState[gBattlerAttacker].selectionScriptFinished = TRUE;
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
        BtlController_EmitBattleAnimation(battler, B_COMM_TO_CONTROLLER, animId, *argPtr);
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
        BtlController_EmitBattleAnimation(battler, B_COMM_TO_CONTROLLER, animId, *argPtr);
        MarkBattlerForControllerExec(battler);
        gBattlescriptCurrInstr = nextInstr;
    }
    else if (IsSemiInvulnerable(battler, CHECK_ALL))
    {
        gBattlescriptCurrInstr = nextInstr;
    }
    else
    {
        BtlController_EmitBattleAnimation(battler, B_COMM_TO_CONTROLLER, animId, *argPtr);
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

static void Cmd_jumpfifsemiinvulnerable(void)
{
    CMD_ARGS(u8 battler, u8 state, const u8 *jumpInstr);
    u32 battler = GetBattlerForBattleScript(cmd->battler);

    if (gBattleMons[battler].volatiles.semiInvulnerable == cmd->state)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_trainerslidein(void)
{
    CMD_ARGS(u8 position);

    u32 battler = GetBattlerForBattleScript(cmd->position);
    BtlController_EmitTrainerSlide(battler, B_COMM_TO_CONTROLLER);
    MarkBattlerForControllerExec(battler);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static inline bool32 IsProtectivePadsProtected(u32 battler, enum HoldEffect holdEffect)
{
    if (holdEffect != HOLD_EFFECT_PROTECTIVE_PADS)
        return FALSE;

    RecordItemEffectBattle(battler, holdEffect);
    return TRUE;
}

static void Cmd_moveend(void)
{
    CMD_ARGS(u8 endMode, u8 endState);
    assertf(gBattlerAttacker < gBattlersCount, "invalid gBattlerAttacker: %d\nmove: %S", gBattlerAttacker, GetMoveName(gCurrentMove));
    assertf(gBattlerTarget < gBattlersCount, "invalid gBattlerTarget: %d\nmove: %S", gBattlerTarget, GetMoveName(gCurrentMove));

    enum MoveEndResult result = DoMoveEnd(cmd->endMode, cmd->endState);

    if (result == MOVEEND_STEP_BREAK)
        return;

    if (gBattleScripting.moveendState == MOVEEND_COUNT && result == MOVEEND_STEP_CONTINUE)
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_sethealblock(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gBattleMons[gBattlerTarget].volatiles.healBlock)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gBattleMons[gBattlerTarget].volatiles.healBlock = TRUE;
        gBattleMons[gBattlerTarget].volatiles.healBlockTimer = B_HEAL_BLOCK_TIMER;
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

static bool32 IsValidSwitchIn(enum BattleSide side, u32 index)
{
    if (index >= PARTY_SIZE)
        return FALSE;

    struct Pokemon *party = GetSideParty(side);
    if (!IsValidForBattle(&party[index]))
        return FALSE;

    for (u32 i = 0; i < gBattlersCount; i++)
    {
        if (GetBattlerSide(i) == side && gBattlerPartyIndexes[i] == index && IsBattlerAlive(i))
            return FALSE;
    }

    return TRUE;
}

static u32 GetArbitraryValidSwitchIn(enum BattleSide side)
{
    for (u32 i = 0; i < PARTY_SIZE; i++)
    {
        if (IsValidSwitchIn(side, i))
            return i;
    }

    errorf("no valid switch ins for side: %d", side);
    return 0;
}

static void Cmd_getswitchedmondata(void)
{
    CMD_ARGS(u8 battler);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    if (gBattleControllerExecFlags)
        return;

    enum BattleSide side = GetBattlerSide(battler);
    assertf(IsValidSwitchIn(side, gBattleStruct->monToSwitchIntoId[battler]))
    {
        gBattleStruct->monToSwitchIntoId[battler] = GetArbitraryValidSwitchIn(side);
    }

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

    enum BattleSide side = GetBattlerSide(battler);
    assertf(IsBattlerAlive(battler))
    {
        gBattlerPartyIndexes[battler] = gBattleStruct->monToSwitchIntoId[battler] = GetArbitraryValidSwitchIn(side);
        BtlController_EmitGetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_ALL_BATTLE, 1u << gBattlerPartyIndexes[battler]);
        MarkBattlerForControllerExec(battler);
        return;
    }

    gBattleMons[battler].types[0] = GetSpeciesType(gBattleMons[battler].species, 0);
    gBattleMons[battler].types[1] = GetSpeciesType(gBattleMons[battler].species, 1);
    gBattleMons[battler].types[2] = TYPE_MYSTERY;
    gBattleMons[battler].ability = GetAbilityBySpecies(gBattleMons[battler].species, gBattleMons[battler].abilityNum);
    #if TESTING
    if (gTestRunnerEnabled)
    {
        enum BattleTrainer trainer = GetBattlerTrainer(battler);
        u32 partyIndex = gBattlerPartyIndexes[battler];
        if (TestRunner_Battle_GetForcedAbility(trainer, partyIndex))
            gBattleMons[battler].ability = TestRunner_Battle_GetForcedAbility(trainer, partyIndex);
    }
    #endif

    if (GetBattlerPartyState(battler)->isKnockedOff)
    {
        gBattleMons[battler].item = ITEM_NONE;
    }

    if (GetMoveEffect(gCurrentMove) == EFFECT_BATON_PASS)
    {
        for (i = 0; i < NUM_BATTLE_STATS; i++)
        {
            gBattleMons[battler].statStages[i] = oldData.statStages[i];
        }
    }

    SwitchInClearSetData(battler, &oldData.volatiles);

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

    GetBattlerPartyState(battler)->sentOut = TRUE;

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
    if (!cmd->ignoreEscapePrevention && !CanBattlerEscape(battler) && GetBattlerHoldEffect(battler) != HOLD_EFFECT_SHED_SHELL)
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

    BtlController_EmitChoosePokemon(battler, B_COMM_TO_CONTROLLER, PARTY_ACTION_SEND_OUT, slotId, ABILITY_NONE, 0, gBattleStruct->battlerPartyOrders[battler]);
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
                    bool32 skipPartnerCheck = FALSE;
                    if (gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS
                     && GetBattlerSide(i) == B_SIDE_OPPONENT
                     && TRAINER_BATTLE_PARAM.opponentB != TRAINER_NONE)
                        skipPartnerCheck = TRUE;

                    // In a 1v2 Double Battle if trainer A didn't have any more mons left
                    // the battler for trainer B wasn't being registered to be send out.
                    // Likely reason is because hitmarkerFaintBits was not set for battler 1 due to it being missing for a turn or cleared somewhere
                    if (!skipPartnerCheck && i > 1 && ((1u << BATTLE_PARTNER(i)) & hitmarkerFaintBits))
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

            BtlController_EmitChoosePokemon(battler, B_COMM_TO_CONTROLLER, hitmarkerFaintBits, gBattleStruct->monToSwitchIntoId[BATTLE_PARTNER(battler)], ABILITY_NONE, 0, gBattleStruct->battlerPartyOrders[battler]);
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

static void UpdateSentMonFlags(u32 battler)
{
    UpdateSentPokesToOpponentValue(battler);
    gHitMarker &= ~HITMARKER_FAINTED(battler);
    gSpecialStatuses[battler].faintedHasReplacement = FALSE;
    gBattleStruct->battlerState[battler].switchIn = TRUE;
    gProtectStructs[battler].forcedSwitch = FALSE;

    // There is a hack here to ensure the truant counter will be 0 when the battler's next turn starts.
    // The truant counter is not updated in the case where a mon switches in after a lost judgment in the battle arena.
    if (GetBattlerAbility(battler) == ABILITY_TRUANT
     && gCurrentActionFuncId != B_ACTION_USE_MOVE
     && !gBattleMons[battler].volatiles.truantSwitchInHack)
        gBattleMons[battler].volatiles.truantCounter = 1;
    gBattleMons[battler].volatiles.truantSwitchInHack = 0;

    for (u32 i = 0; i < gBattlersCount; i++)
    {
        if (gBattlerByTurnOrder[i] == battler)
            gActionsByTurnOrder[i] = B_ACTION_CANCEL_PARTNER;
    }
}

static void Cmd_switchineffects(void)
{
    CMD_ARGS(u8 battler);
    u32 battler = GetBattlerForBattleScript(cmd->battler);

    UpdateSentMonFlags(battler);

    if (cmd->battler == BS_FAINTED_MULTIPLE_1)
    {
        do // Increment fainted battler
        {
            gBattlerFainted++;
            if (gBattlerFainted >= gBattlersCount)
                break;
            if (gHitMarker & HITMARKER_FAINTED(gBattlerFainted) && !(gAbsentBattlerFlags & (1u << gBattlerFainted)))
                break;
        } while (1);
    }

    gBattleStruct->eventState.switchIn = 0;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_switchinevents(void)
{
    CMD_ARGS();
    while (gBattleStruct->eventState.switchIn < SWITCH_IN_EVENTS_COUNT)
    {
        if (DoSwitchInEvents())
            return;
    }
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
    if (!cmd->changingForm)
        TryBattleFormChange(battler, FORM_CHANGE_BATTLE_SWITCH);

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_handlelearnnewmove(void)
{
    CMD_ARGS(const u8 *learnedMovePtr, const u8 *nothingToLearnPtr, bool8 isFirstMove);

    enum Move learnMove = MOVE_NONE;
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
            && !(gBattleMons[battler].volatiles.transformed))
        {
            GiveMoveToBattleMon(&gBattleMons[battler], learnMove);
        }
        if (IsDoubleBattle())
        {
            battler = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
            if (gBattlerPartyIndexes[battler] == monId
                && !(gBattleMons[battler].volatiles.transformed))
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
                enum Move move = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_MOVE1 + movePosition);
                if (CannotForgetMove(move))
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

// TODO: passive damage hit anim for sub
static void Cmd_hitanimation(void)
{
    CMD_ARGS(u8 battler);

    if (!IsDoubleSpreadMove())
    {
        u32 battler = GetBattlerForBattleScript(cmd->battler);

        if (!IsBattlerUnaffectedByMove(battler))
        {
            if (gBattleStruct->passiveHpUpdate[battler] > 0
             || !(DoesSubstituteBlockMove(gBattlerAttacker, battler, gCurrentMove))
             || gBattleMons[battler].volatiles.substituteHP == 0)
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
            if (IsBattlerInvalidForSpreadMove(gBattlerAttacker, battlerDef))
                continue;

            if (!(DoesSubstituteBlockMove(gBattlerAttacker, battlerDef, gCurrentMove))
             || gBattleMons[battlerDef].volatiles.substituteHP == 0)
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
        gBattleStruct->eventState.atkCanceler = 0;
    else
        gBattleStruct->eventState.atkCanceler = CANCELER_VOLATILE_BLOCKED;
    gBattleScripting.animTurn = 0;
    gBattleScripting.animTargetsHit = 0;
    SetTypeBeforeUsingMove(gCurrentMove, gBattlerAttacker);
    DetermineTarget(GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove), FALSE);
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
    CMD_ARGS(u8 battler, u32 status, bool8 isVolatile);

    if (gBattleControllerExecFlags == 0)
    {
        u32 battler = GetBattlerForBattleScript(cmd->battler),
            statusFlag = (cmd->isVolatile || cmd->status) ? cmd->status : gBattleMons[battler].status1;
        if (!IsSemiInvulnerable(battler, CHECK_ALL)
            && gBattleMons[battler].volatiles.substituteHP == 0
            && !(gHitMarker & (HITMARKER_NO_ANIMATIONS | HITMARKER_DISABLE_ANIMATION)))
        {
            BtlController_EmitStatusAnimation(battler, B_COMM_TO_CONTROLLER, cmd->isVolatile, statusFlag);
            MarkBattlerForControllerExec(battler);
        }
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

#define DONE_TARGET_FAILURE (gBattleStruct->eventState.atkCanceler == CANCELER_TARGET_FAILURE + 1)
static void Cmd_futuresighttargetfailure(void)
{
    CMD_ARGS(const u8 *failInstr);

    // Just do CancelerTargetFailure
    if (!DONE_TARGET_FAILURE && AtkCanceler_MoveSuccessOrder() != MOVE_STEP_SUCCESS)
        return;

    if (IsBattlerUnaffectedByMove(gBattlerTarget))
        gBattlescriptCurrInstr = cmd->failInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static u32 GetPossibleNextTarget(void)
{
    const u8 targetOrder[MAX_BATTLERS_COUNT] = {
        gBattlerAttacker,
        BATTLE_PARTNER(gBattlerAttacker),
        LEFT_FOE(gBattlerAttacker),
        RIGHT_FOE(gBattlerAttacker),
    };

    for (u32 i = 0; i < MAX_BATTLERS_COUNT; i++)
    {
        u32 battler = targetOrder[i];

        if (!IsBattlerAlive(battler))
            continue;

        if (!gBattleStruct->battlerState[gBattlerAttacker].targetsDone[battler]
         && !IsBattlerUnaffectedByMove(battler))
            return battler;
    }

    return MAX_BATTLERS_COUNT;
}

static void Cmd_getpossiblenexttarget(void)
{
    CMD_ARGS(const u8 *jumpInstr);

    u32 nextTarget = GetPossibleNextTarget();
    if (nextTarget != MAX_BATTLERS_COUNT)
    {
        gBattleStruct->moveTarget[gBattlerAttacker] = gBattlerTarget = nextTarget;
        gBattleStruct->battlerState[gBattlerAttacker].targetsDone[gBattlerTarget] = TRUE;
        gBattlescriptCurrInstr = cmd->jumpInstr;
    }
    else
    {
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
        gFieldTimers.gravityTimer = 5;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static bool32 TryCheekPouch(u32 battler, enum Item itemId, const u8 *nextInstr)
{
    if (GetItemPocket(itemId) == POCKET_BERRIES
        && GetBattlerAbility(battler) == ABILITY_CHEEK_POUCH
        && !gBattleMons[battler].volatiles.healBlock
        && GetBattlerPartyState(battler)->ateBerry
        && !IsBattlerAtMaxHp(battler))
    {
        gBattlerAbility = battler;
        SetHealAmount(battler, GetNonDynamaxMaxHP(battler) / 3);
        BattleScriptPush(nextInstr);
        gBattlescriptCurrInstr = BattleScript_CheekPouchActivates;
        return TRUE;
    }
    return FALSE;
}

static void Cmd_removeitem(void)
{
    CMD_ARGS(u8 battler);

    u32 battler;
    enum Item itemId = 0;

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
    if (GetBattlerHoldEffect(battler) != HOLD_EFFECT_AIR_BALLOON
     && GetMoveEffect(gCurrentMove) != EFFECT_CORROSIVE_GAS)
        GetBattlerPartyState(battler)->usedHeldItem = itemId; // Remember if switched out

    gBattleMons[battler].item = ITEM_NONE;
    gBattleStruct->battlerState[battler].canPickupItem = TRUE;
    CheckSetUnburden(battler);

    BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[battler].item), &gBattleMons[battler].item);
    MarkBattlerForControllerExec(battler);

    ClearBattlerItemEffectHistory(battler);
    if (!TryCheekPouch(battler, itemId, cmd->nextInstr) && !TrySymbiosis(battler, itemId, FALSE))
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
    printerTemplate.type = WINDOW_TEXT_PRINTER;
    printerTemplate.windowId = B_WIN_LEVEL_UP_BANNER;
    printerTemplate.fontId = FONT_SMALL;
    printerTemplate.x = 32;
    printerTemplate.y = 0;
    printerTemplate.currentX = 32;
    printerTemplate.currentY = 0;
    printerTemplate.letterSpacing = 0;
    printerTemplate.lineSpacing = 0;
    printerTemplate.color.background = TEXT_COLOR_TRANSPARENT;
    printerTemplate.color.foreground = TEXT_COLOR_WHITE;
    printerTemplate.color.shadow = TEXT_COLOR_DARK_GRAY;
    printerTemplate.color.accent = TEXT_COLOR_TRANSPARENT;

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
        u32 hpSwitchout = gBattleStruct->battlerState[opposingBattler].hpOnSwitchout;
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
    u32 moveIndex;
    for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        enum Move move = gBattleMons[battler].moves[moveIndex];
        // Assumes that an empty slot cannot have a non-empty slot after it
        if (move == MOVE_NONE)
            break;
        // If not Last Resort and has not been used, can't use Last Resort
        if (GetMoveEffect(move) != EFFECT_LAST_RESORT && !(gBattleMons[battler].volatiles.usedMoves & (1u << moveIndex)))
            return FALSE;
    }
    return moveIndex >= 2; // At least two usable moves that are either Last Resort or have been used
}

static void RemoveAllWeather(void)
{
    gBattleStruct->weatherDuration = 0;

    if (gBattleWeather & B_WEATHER_RAIN)
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_END_RAIN;
    else if (gBattleWeather & B_WEATHER_SANDSTORM)
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_END_SANDSTORM;
    else if (gBattleWeather & B_WEATHER_SUN)
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_END_SUN;
    else if (gBattleWeather & B_WEATHER_HAIL)
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_END_HAIL;
    else if (gBattleWeather & B_WEATHER_STRONG_WINDS)
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_END_STRONG_WINDS;
    else if (gBattleWeather & B_WEATHER_SNOW)
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_END_SNOW;
    else if (gBattleWeather & B_WEATHER_FOG)
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
            BattleScriptCall(battlescript);                 \
        }                                                   \
        else                                                \
        {                                                   \
            gBattlerAttacker = saveBattler;                 \
        }                                                   \
        return TRUE;                                        \
    }                                                       \
}

static bool32 DefogClearHazards(u32 saveBattler, enum BattleSide side, bool32 clear)
{
    if (!AreAnyHazardsOnSide(side))
        return FALSE;

    for (u32 hazardType = HAZARDS_NONE + 1; hazardType < HAZARDS_MAX_COUNT; hazardType++)
    {
        bool32 checkOrClear = clear ? IsHazardOnSideAndClear(side, hazardType) : IsHazardOnSide(side, hazardType);
        if (checkOrClear)
        {
            if (clear)
            {
                gBattleStruct->numHazards[side]--;
                gBattleCommunication[MULTISTRING_CHOOSER] = hazardType;
                BattleScriptCall(BattleScript_DefogClearHazards);
            }
            else
            {
                gBattlerAttacker = saveBattler;
            }
            return TRUE;
        }
    }
    return FALSE;
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
        if (GetConfig(CONFIG_DEFOG_EFFECT_CLEARING) >= GEN_6)
        {
            gBattlerAttacker = i; // For correct battle string. Ally's / Foe's
            if (DefogClearHazards(saveBattler, i, clear))
                return TRUE;
        }
        if (gBattleWeather & B_WEATHER_FOG)
        {
            if (clear)
            {
                gBattleWeather &= ~B_WEATHER_FOG;
                BattleScriptCall(BattleScript_FogEnded_Ret);
            }
            return TRUE;
        }
        if (GetConfig(CONFIG_DEFOG_EFFECT_CLEARING) >= GEN_8 && (gFieldStatuses & STATUS_FIELD_TERRAIN_ANY))
        {
            if (clear)
            {
                RemoveAllTerrains();
                BattleScriptCall(BattleScript_TerrainEnds_Ret);
            }
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
        gBattlerAttacker = i; // For correct battle string. Ally's / Foe's
        if (DefogClearHazards(saveBattler, i, clear))
            return TRUE;
    }

    for (i = 0; i < MAX_BATTLERS_COUNT; i++)
    {
        if (gBattleMons[i].volatiles.substitute)
        {
            if (clear)
            {
                gBattlerTarget = i;
                gBattleMons[i].volatiles.substituteHP = 0;
                gBattleMons[i].volatiles.substitute = FALSE;
                BattleScriptCall(BattleScript_SubstituteFade);
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

u32 IsLeafGuardProtected(u32 battler, enum Ability ability)
{
    if (IsBattlerWeatherAffected(battler, B_WEATHER_SUN))
        return ability == ABILITY_LEAF_GUARD;
    else
        return 0;
}

bool32 IsShieldsDownProtected(u32 battler, enum Ability ability)
{
    return (ability == ABILITY_SHIELDS_DOWN
            && GetFormIdFromFormSpeciesId(gBattleMons[battler].species) < GetFormIdFromFormSpeciesId(SPECIES_MINIOR_CORE_RED)); // Minior is not in core form
}

u32 IsAbilityStatusProtected(u32 battler, enum Ability ability)
{
    return IsLeafGuardProtected(battler, ability)
        || IsShieldsDownProtected(battler, ability)
        || IsFlowerVeilProtected(battler);
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
    COURTCHANGE_SWAP(SIDE_STATUS_DAMAGE_NON_TYPES, damageNonTypesTimer, temp);
    // Track Pledge effect side
    COURTCHANGE_SWAP(SIDE_STATUS_RAINBOW, rainbowTimer, temp);
    COURTCHANGE_SWAP(SIDE_STATUS_SEA_OF_FIRE, seaOfFireTimer, temp);
    COURTCHANGE_SWAP(SIDE_STATUS_SWAMP, swampTimer, temp);

    // Hazards
    u32 tempQueue[HAZARDS_MAX_COUNT] = {HAZARDS_NONE};
    for (u32 i = 0; i < HAZARDS_MAX_COUNT; i++)
        tempQueue[i] = gBattleStruct->hazardsQueue[B_SIDE_PLAYER][i];
    for (u32 i = 0; i < HAZARDS_MAX_COUNT; i++)
        gBattleStruct->hazardsQueue[B_SIDE_PLAYER][i] = gBattleStruct->hazardsQueue[B_SIDE_OPPONENT][i];
    for (u32 i = 0; i < HAZARDS_MAX_COUNT; i++)
        gBattleStruct->hazardsQueue[B_SIDE_OPPONENT][i] = tempQueue[i];
    SWAP(sideTimerPlayer->spikesAmount, sideTimerOpp->spikesAmount, temp);
    SWAP(sideTimerPlayer->toxicSpikesAmount, sideTimerOpp->toxicSpikesAmount, temp);

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

static void Cmd_unused_0x78(void)
{
}

static void Cmd_setprotectlike(void)
{
    CMD_ARGS();
    u32 protectMethod = GetMoveProtectMethod(gCurrentMove);

    if (GetMoveEffect(gCurrentMove) == EFFECT_ENDURE)
    {
        gBattleMons[gBattlerAttacker].volatiles.endured = TRUE;
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

    gBattleMons[gBattlerAttacker].volatiles.consecutiveMoveUses++;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_tryexplosion(void)
{
    CMD_ARGS();

    if (gBattleControllerExecFlags)
        return;

    gBattleStruct->passiveHpUpdate[gBattlerAttacker] = gBattleMons[gBattlerAttacker].hp;
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
        if (gBattlerTarget == gBattlerAttacker)
        {
            enum MoveTarget target = GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove);
            if (target != TARGET_USER && target != TARGET_ALL_BATTLERS)
                continue;
        }

        if (IsBattlerAlive(gBattlerTarget))
            break;
    }

    if (gBattlerTarget >= gBattlersCount)
    {
        gBattlerTarget = gBattlersCount - 1;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = jumpInstr;
    }
}

static void Cmd_tryhealhalfhealth(void)
{
    CMD_ARGS(u8 battler, const u8 *failInstr);

    const u8 *failInstr = cmd->failInstr;

    if (cmd->battler == BS_ATTACKER)
        gBattlerTarget = gBattlerAttacker;

    SetHealAmount(gBattlerTarget, GetNonDynamaxMaxHP(gBattlerTarget) / 2);
    if (gBattleMons[gBattlerTarget].hp == gBattleMons[gBattlerTarget].maxHP)
        gBattlescriptCurrInstr = failInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_unused_0x7e(void)
{
}

static void Cmd_setfieldweather(void)
{
    CMD_ARGS();

    if (TryChangeBattleWeather(gBattlerAttacker, GetMoveWeatherType(gCurrentMove), ABILITY_NONE))
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }

    gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEATHER_FAILED;
    gBattlescriptCurrInstr = cmd->nextInstr;

    if (gBattleWeather & B_WEATHER_PRIMAL_ANY)
        BattleScriptCall(BattleScript_FailOnPrimalWeather);
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

    if (IsBattlerUnaffectedByMove(gBattlerTarget) || gBattleMons[gBattlerTarget].volatiles.leechSeed)
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
        gBattleMons[gBattlerTarget].volatiles.leechSeed = LEECHSEEDED_BY(gBattlerAttacker);
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_LEECH_SEED_SET;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_manipulatedamage(void)
{
    CMD_ARGS(u8 mode);

    switch (cmd->mode)
    {
    case DMG_CHANGE_SIGN:
        gBattleStruct->passiveHpUpdate[gBattlerAttacker] *= -1;
        break;
    case DMG_1_8_TARGET_HP:
        SetPassiveDamageAmount(gBattlerTarget, GetNonDynamaxMaxHP(gBattlerTarget) / 8);
        break;
    case DMG_BIG_ROOT:
        gBattleStruct->passiveHpUpdate[gBattlerAttacker] = -1 * GetDrainedBigRootHp(gBattlerAttacker, gBattleStruct->passiveHpUpdate[gBattlerAttacker]);
        break;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_trysetrest(void)
{
    CMD_ARGS();

    gBattlerTarget = gBattlerAttacker;
    SetHealAmount(gBattlerTarget, gBattleMons[gBattlerTarget].maxHP);
    enum Ability ability = GetBattlerAbility(gBattlerTarget);
    enum HoldEffect holdEffect = GetBattlerHoldEffect(gBattlerTarget);

    if (IsElectricTerrainAffected(gBattlerTarget, ability, holdEffect, gFieldStatuses))
    {
        gBattlescriptCurrInstr = BattleScript_ElectricTerrainPrevents;
    }
    else if (IsMistyTerrainAffected(gBattlerTarget, ability, holdEffect, gFieldStatuses))
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

static void Cmd_unused_0x82(void)
{
}

static void Cmd_unused_0x83(void)
{
}

bool8 UproarWakeUpCheck(u8 battler)
{
    s32 i;
    bool32 hasSoundproof = (B_UPROAR_IGNORE_SOUNDPROOF < GEN_5 && GetBattlerAbility(battler) == ABILITY_SOUNDPROOF);

    for (i = 0; i < gBattlersCount; i++)
    {
        if (!(gBattleMons[i].volatiles.uproarTurns) || hasSoundproof)
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
    CMD_ARGS();

    gBattleMons[gBattlerAttacker].volatiles.stockpileCounter++;

    if (B_STOCKPILE_RAISES_DEFS >= GEN_4)
    {
        if (ChangeStatBuffs(
                gBattlerAttacker,
                SET_STAT_BUFF_VALUE(1),
                STAT_DEF,
                STAT_CHANGE_ONLY_CHECKING,
                0, 0) != STAT_CHANGE_DIDNT_WORK)
            gBattleMons[gBattlerAttacker].volatiles.stockpileDef++;

        if (ChangeStatBuffs(
                gBattlerAttacker,
                SET_STAT_BUFF_VALUE(1),
                STAT_SPDEF,
                STAT_CHANGE_ONLY_CHECKING,
                0, 0) != STAT_CHANGE_DIDNT_WORK)
            gBattleMons[gBattlerAttacker].volatiles.stockpileSpDef++;

    }

    PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff1, 1, gBattleMons[gBattlerAttacker].volatiles.stockpileCounter);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_stockpiletobasedamage(void)
{
    CMD_ARGS();

    if (gBattleCommunication[MISS_TYPE] != B_MSG_PROTECTED)
        gBattleScripting.animTurn = gBattleMons[gBattlerAttacker].volatiles.stockpileCounter;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_stockpiletohpheal(void)
{
    CMD_ARGS(const u8 *failInstr);

    const u8 *failInstr = cmd->failInstr;

    if (gBattleMons[gBattlerAttacker].maxHP == gBattleMons[gBattlerAttacker].hp)
    {
        gBattleMons[gBattlerAttacker].volatiles.stockpileCounter = 0;
        gBattlescriptCurrInstr = failInstr;
        gBattlerTarget = gBattlerAttacker;
    }
    else
    {
        if (gBattleMons[gBattlerAttacker].volatiles.stockpileCounter > 0)
        {
            SetHealAmount(gBattlerAttacker, GetNonDynamaxMaxHP(gBattlerAttacker) / (1 << (3 - gBattleMons[gBattlerAttacker].volatiles.stockpileCounter)));
            gBattleScripting.animTurn = gBattleMons[gBattlerAttacker].volatiles.stockpileCounter;
        }
        else // Snatched move
        {
            SetHealAmount(gBattlerAttacker, GetNonDynamaxMaxHP(gBattlerAttacker) / 4);
            gBattleScripting.animTurn = 1;
        }

        gBattlescriptCurrInstr = cmd->nextInstr;
        gBattlerTarget = gBattlerAttacker;
    }
}

void BS_RemoveStockpileCounters(void)
{
    NATIVE_ARGS();

    if (GetMoveEffect(gCurrentMove) == EFFECT_SPIT_UP
     && gSpecialStatuses[gBattlerAttacker].parentalBondState == PARENTAL_BOND_1ST_HIT
     && IsBattlerAlive(gBattlerTarget))
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattleMons[gBattlerAttacker].volatiles.stockpileCounter = 0;
        BattleScriptPush(cmd->nextInstr);
        gBattlescriptCurrInstr = BattleScript_MoveEffectStockpileWoreOff;
    }
}

static void Cmd_unused_0x88(void)
{
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

static void TryPlayStatChangeAnimation(u32 battler, enum Ability ability, u32 stats, s32 statValue, u32 statId, bool32 certain)
{
    enum Stat currStat = 0;
    u32 changeableStatsCount = 1; // current stat is counted automatically
    u32 statAnimId = statId;
    bool32 statChangeByTwo = statValue > 1 || statValue < -1;

    if (statValue <= -1) // goes down
    {
        if (statChangeByTwo)
            statAnimId += STAT_ANIM_MINUS2;
        else
            statAnimId += STAT_ANIM_MINUS1;

        while (stats != 0)
        {
            if (stats & 1)
            {
                if (certain)
                {
                    if (gBattleMons[battler].statStages[currStat] > MIN_STAT_STAGE)
                    {
                        changeableStatsCount++;
                        break;
                    }
                }
                else if (!((ability == ABILITY_KEEN_EYE || ability == ABILITY_MINDS_EYE) && currStat == STAT_ACC)
                        && !(GetConfig(CONFIG_ILLUMINATE_EFFECT) >= GEN_9 && ability == ABILITY_ILLUMINATE && currStat == STAT_ACC)
                        && !(ability == ABILITY_HYPER_CUTTER && currStat == STAT_ATK)
                        && !(ability == ABILITY_BIG_PECKS && currStat == STAT_DEF))
                {
                    if (gBattleMons[battler].statStages[currStat] > MIN_STAT_STAGE)
                    {
                        changeableStatsCount++;
                        break;
                    }
                }
            }
            stats >>= 1, currStat++;
        }

        if (changeableStatsCount > 1) // more than one stat, so the color is gray
        {
            if (statChangeByTwo)
                statAnimId = STAT_ANIM_MULTIPLE_MINUS2;
            else
                statAnimId = STAT_ANIM_MULTIPLE_MINUS1;
        }
    }
    else // goes up
    {
        if (statChangeByTwo)
            statAnimId += STAT_ANIM_PLUS2;
        else
            statAnimId += STAT_ANIM_PLUS1;

        while (stats != 0)
        {
            if (stats & 1 && gBattleMons[battler].statStages[currStat] < MAX_STAT_STAGE)
            {
                changeableStatsCount++;
                break;
            }
            stats >>= 1, currStat++;
        }

        if (changeableStatsCount > 1) // more than one stat, so the color is gray
        {
            if (statChangeByTwo)
                statAnimId = STAT_ANIM_MULTIPLE_PLUS2;
            else
                statAnimId = STAT_ANIM_MULTIPLE_PLUS1;
        }
    }

    if (!gBattleScripting.statAnimPlayed)
    {
        BtlController_EmitBattleAnimation(battler, B_COMM_TO_CONTROLLER, B_ANIM_STATS_CHANGE, statAnimId);
        MarkBattlerForControllerExec(battler);
        if (changeableStatsCount > 1)
            gBattleScripting.statAnimPlayed = TRUE;
    }
    else if (changeableStatsCount == 1) // final stat that can be changed
    {
        gBattleScripting.statAnimPlayed = FALSE;
    }
}

static u32 ChangeStatBuffs(u32 battler, s8 statValue, enum Stat statId, union StatChangeFlags flags, u32 stats, const u8 *BS_ptr)
{
    u32 index, battlerAbility;
    enum HoldEffect battlerHoldEffect;
    battlerAbility = GetBattlerAbility(battler);
    battlerHoldEffect = GetBattlerHoldEffect(battler);
    gSpecialStatuses[battler].changedStatsBattlerId = gBattlerAttacker;

    if (battlerAbility == ABILITY_CONTRARY)
    {
        statValue ^= STAT_BUFF_NEGATIVE;
        if (!flags.onlyChecking)
        {
            gBattleScripting.statChanger ^= STAT_BUFF_NEGATIVE;
            RecordAbilityBattle(battler, battlerAbility);
            if (flags.updateMoveEffect)
                gBattleScripting.moveEffect = ReverseStatChangeMoveEffect(gBattleScripting.moveEffect);
        }
    }
    else if (battlerAbility == ABILITY_SIMPLE && !flags.onlyChecking)
    {
        statValue = (SET_STAT_BUFF_VALUE(GET_STAT_BUFF_VALUE(statValue) * 2)) | ((statValue <= -1) ? STAT_BUFF_NEGATIVE : 0);
        RecordAbilityBattle(battler, battlerAbility);
    }

    PREPARE_STAT_BUFFER(gBattleTextBuff1, statId);

    if (statValue <= -1) // Stat decrease.
    {
        enum BattleMoveEffects effect = GetMoveEffect(gCurrentMove);
        if (gSideTimers[GetBattlerSide(battler)].mistTimer
            && !flags.certain && effect != EFFECT_CURSE
            && !(battler == gBattlerTarget && GetBattlerAbility(gBattlerAttacker) == ABILITY_INFILTRATOR))
        {
            if (flags.allowPtr)
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
        else if ((battlerHoldEffect == HOLD_EFFECT_CLEAR_AMULET || CanAbilityPreventStatLoss(battlerAbility))
              && (flags.statDropPrevention || gBattlerAttacker != gBattlerTarget || flags.mirrorArmored) && !flags.certain && effect != EFFECT_CURSE)
        {
            if (flags.allowPtr)
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
        else if ((index = IsFlowerVeilProtected(battler)) && !flags.certain)
        {
            if (flags.allowPtr)
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
        else if (!flags.certain
                && (((battlerAbility == ABILITY_KEEN_EYE || battlerAbility == ABILITY_MINDS_EYE) && statId == STAT_ACC)
                || (GetConfig(CONFIG_ILLUMINATE_EFFECT) >= GEN_9 && battlerAbility == ABILITY_ILLUMINATE && statId == STAT_ACC)
                || (battlerAbility == ABILITY_HYPER_CUTTER && statId == STAT_ATK)
                || (battlerAbility == ABILITY_BIG_PECKS && statId == STAT_DEF)))
        {
            if (flags.allowPtr)
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
        else if (battlerAbility == ABILITY_MIRROR_ARMOR && !flags.mirrorArmored && gBattlerAttacker != gBattlerTarget && battler == gBattlerTarget)
        {
            if (flags.allowPtr)
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
            if (gBattleMons[battler].statStages[statId] == (MIN_STAT_STAGE + 1))
                statValue = -1;
            else if (gBattleMons[battler].statStages[statId] == 2 && statValue < -2)
                statValue = -2;

            if (statValue == -2)
            {
                PREPARE_STRING_BUFFER(gBattleTextBuff2, STRINGID_STATHARSHLY);
            }
            else if (statValue <= -3)
            {
                PREPARE_STRING_BUFFER(gBattleTextBuff2, STRINGID_SEVERELY);
            }
            else
            {
                PREPARE_STRING_BUFFER(gBattleTextBuff2, STRINGID_EMPTYSTRING3);
            }

            gBattleCommunication[MULTISTRING_CHOOSER] = (gBattlerTarget == battler); // B_MSG_ATTACKER_STAT_CHANGED or B_MSG_DEFENDER_STAT_CHANGED

            if (gBattleMons[battler].statStages[statId] == MIN_STAT_STAGE)
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STAT_WONT_CHANGE;
                gBattleScripting.statChanger |= STAT_BUFF_NEGATIVE;
            }
            else if (!flags.onlyChecking)
            {
                gBattleMons[battler].volatiles.tryEjectPack = TRUE;
                gProtectStructs[battler].lashOutAffected = TRUE;
                gBattleScripting.statChanger |= STAT_BUFF_NEGATIVE;
            }
        }
    }
    else // stat increase
    {
        statValue = GET_STAT_BUFF_VALUE(statValue);
        if (gBattleMons[battler].statStages[statId] == MAX_STAT_STAGE - 1)
            statValue = 1;
        else if (gBattleMons[battler].statStages[statId] == MAX_STAT_STAGE - 2  && statValue > 2)
            statValue = 2;

        if (statValue == 2)
        {
            PREPARE_STRING_BUFFER(gBattleTextBuff2, STRINGID_STATSHARPLY);
        }
        else if (statValue >= 3)
        {
            PREPARE_STRING_BUFFER(gBattleTextBuff2, STRINGID_DRASTICALLY);
        }
        else
        {
            PREPARE_STRING_BUFFER(gBattleTextBuff2, STRINGID_EMPTYSTRING3);
        }

        gBattleCommunication[MULTISTRING_CHOOSER] = (gBattlerTarget == battler); // B_MSG_ATTACKER_STAT_CHANGED or B_MSG_DEFENDER_STAT_CHANGED

        if (gBattleMons[battler].statStages[statId] == MAX_STAT_STAGE)
        {
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_STAT_WONT_CHANGE;
            gBattleScripting.statChanger &= ~STAT_BUFF_NEGATIVE;
        }
        else if (!flags.onlyChecking)
        {
            u32 statIncrease;
            if ((statValue + gBattleMons[battler].statStages[statId]) > MAX_STAT_STAGE)
                statIncrease = MAX_STAT_STAGE - gBattleMons[battler].statStages[statId];
            else
                statIncrease = statValue;

            gProtectStructs[battler].statRaised = TRUE;
            gBattleScripting.statChanger &= ~STAT_BUFF_NEGATIVE;

            if (statIncrease)
            {
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
                    if (GetBattlerHoldEffect(index) == HOLD_EFFECT_MIRROR_HERB)
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
    }

    if (gBattleCommunication[MULTISTRING_CHOOSER] == B_MSG_STAT_WONT_CHANGE) // at max or min
    {
        if (!flags.allowPtr)
            return STAT_CHANGE_DIDNT_WORK;
        return STAT_CHANGE_WORKED;
    }

    if (flags.onlyChecking)
        return STAT_CHANGE_WORKED;

    gBattleMons[battler].statStages[statId] += statValue;
    if (gBattleMons[battler].statStages[statId] < MIN_STAT_STAGE)
        gBattleMons[battler].statStages[statId] = MIN_STAT_STAGE;
    if (gBattleMons[battler].statStages[statId] > MAX_STAT_STAGE)
        gBattleMons[battler].statStages[statId] = MAX_STAT_STAGE;

    if (ShouldDefiantCompetitiveActivate(battler, battlerAbility))
        stats = 0; // use single stat animations when Defiant/Competitive activate
    else
        stats &= ~(1u << statId);

    TryPlayStatChangeAnimation(battler, battlerAbility, stats, statValue, statId, flags.certain);

    return STAT_CHANGE_WORKED;
}

static void Cmd_statbuffchange(void)
{
    CMD_ARGS(u8 battler, u16 flags, const u8 *failInstr, u8 stats);

    u16 flags = cmd->flags;
    u32 stats = cmd->stats;
    const u8 *ptrBefore = gBattlescriptCurrInstr;
    const u8 *failInstr = cmd->failInstr;

    if (ChangeStatBuffs(
            GetBattlerForBattleScript(cmd->battler),
            GET_STAT_BUFF_VALUE_WITH_SIGN(gBattleScripting.statChanger),
            GET_STAT_BUFF_ID(gBattleScripting.statChanger),
            flags,
            stats,
            failInstr) == STAT_CHANGE_WORKED)
        gBattlescriptCurrInstr = cmd->nextInstr;
    else if (gBattlescriptCurrInstr == ptrBefore) // Prevent infinite looping.
        gBattlescriptCurrInstr = failInstr;
}

bool32 TryResetBattlerStatChanges(u8 battler)
{
    u32 j;
    bool32 ret = FALSE;

    gBattleMons[battler].volatiles.stockpileDef = 0;
    gBattleMons[battler].volatiles.stockpileSpDef = 0;
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

    gBattleMons[gBattlerAttacker].volatiles.multipleTurns = TRUE;
    gLockedMoves[gBattlerAttacker] = gCurrentMove;
    gBideDmg[gBattlerAttacker] = 0;
    gBattleMons[gBattlerAttacker].volatiles.bideTurns = 2;

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

    if (!CanSetNonVolatileStatus(
            gBattlerAttacker,
            gBattlerTarget,
            GetBattlerAbility(gBattlerAttacker),
            GetBattlerAbility(gBattlerTarget),
            GetMoveNonVolatileStatus(gCurrentMove),
            RUN_SCRIPT))
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
            gProtectStructs[gBattlerTarget].forcedSwitch = TRUE;
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

// for var lands
#define NO_HIT 0
#define CALC_ACC 1
#define SURE_HIT 2
// for var endured
#define NOT_ENDURED       0
#define FOCUS_SASHED      1
#define FOCUS_BANDED      2
#define AFFECTION_ENDURED 3
static void Cmd_tryKO(void)
{
    CMD_ARGS(const u8 *failInstr);

    enum BattleMoveEffects effect = GetMoveEffect(gCurrentMove);
    enum HoldEffect holdEffect = GetBattlerHoldEffect(gBattlerTarget);
    enum Ability targetAbility = GetBattlerAbility(gBattlerTarget);
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
        u32 lands = NO_HIT;
        if (gBattleMons[gBattlerTarget].level > gBattleMons[gBattlerAttacker].level)
            lands = NO_HIT;
        else if ((gBattleMons[gBattlerTarget].volatiles.lockOn && gBattleMons[gBattlerTarget].volatiles.battlerWithSureHit == gBattlerAttacker)
              || IsAbilityAndRecord(gBattlerAttacker, GetBattlerAbility(gBattlerAttacker), ABILITY_NO_GUARD)
              || IsAbilityAndRecord(gBattlerTarget, targetAbility, ABILITY_NO_GUARD))
            lands = SURE_HIT;
        else
            lands = CALC_ACC;

        if (lands == CALC_ACC)
        {
            u16 odds = GetMoveAccuracy(gCurrentMove) + (gBattleMons[gBattlerAttacker].level - gBattleMons[gBattlerTarget].level);
            if (B_SHEER_COLD_ACC >= GEN_7 && effect == EFFECT_SHEER_COLD && !IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_ICE))
                odds -= 10;
            if (RandomPercentage(RNG_ACCURACY, odds) && gBattleMons[gBattlerAttacker].level >= gBattleMons[gBattlerTarget].level)
                lands = SURE_HIT;
        }

        if (lands == SURE_HIT)
        {
            if (gBattleMons[gBattlerTarget].volatiles.endured)
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
#undef NO_HIT
#undef CALC_ACC
#undef SURE_HIT
#undef NOT_ENDURED
#undef FOCUS_SASHED
#undef FOCUS_BANDED
#undef AFFECTION_ENDURED

static void Cmd_checknonvolatiletrigger(void)
{
    CMD_ARGS(u16 nonVolatile, const u8 *failInstr);

    if (!CanSetNonVolatileStatus(
            gBattlerAttacker,
            gBattlerTarget,
            GetBattlerAbility(gBattlerAttacker),
            GetBattlerAbility(gBattlerTarget),
            cmd->nonVolatile,
            CHECK_TRIGGER))
        gBattlescriptCurrInstr = cmd->failInstr;
    else if (DoesSubstituteBlockMove(gBattlerAttacker, gBattlerTarget, gCurrentMove))
        gBattlescriptCurrInstr = cmd->failInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_copybidedmg(void)
{
    CMD_ARGS();
    gBattleStruct->moveDamage[gBattlerTarget] = gBideDmg[gBattlerAttacker] * 2;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_animatewildpokemonafterfailedpokeball(void)
{
    CMD_ARGS(u8 battler);
    u8 battler = GetBattlerForBattleScript(cmd->battler);
    AnimateMonAfterPokeBallFail(battler);
    gBattlescriptCurrInstr = cmd->nextInstr;
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
        if (gBattleMons[gBattlerTarget].volatiles.infatuation
            || !AreBattlersOfOppositeGender(gBattlerAttacker, gBattlerTarget))
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            gBattleMons[gBattlerTarget].volatiles.infatuation = INFATUATED_WITH(gBattlerAttacker);
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
                BtlController_EmitStatusIconUpdate(battler, B_COMM_TO_CONTROLLER, gBattleMons[battler].status1);
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
            BtlController_EmitStatusIconUpdate(battler, B_COMM_TO_CONTROLLER, gBattleMons[battler].status1);
            MarkBattlerForControllerExec(battler);
        }
        if ((IsDoubleBattle()))
        {
            battler = GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerPosition(gBattlerAttacker)));
            if (!(gAbsentBattlerFlags & (1u << battler)))
            {
                BtlController_EmitStatusIconUpdate(battler, B_COMM_TO_CONTROLLER, gBattleMons[battler].status1);
                MarkBattlerForControllerExec(battler);
            }
        }
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        battler = GetBattlerForBattleScript(cmd->battler);
        BtlController_EmitStatusIconUpdate(battler, B_COMM_TO_CONTROLLER, gBattleMons[battler].status1);
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
        gSideTimers[GetBattlerSide(gBattlerAttacker)].mistTimer = 5;
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
         || gBattleMons[battler].volatiles.dragonCheer || gBattleMons[battler].volatiles.focusEnergy)
    {
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_FAILED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_FOCUS_ENERGY_FAILED;
    }
    else if (effect == EFFECT_DRAGON_CHEER && !IS_BATTLER_OF_TYPE(battler, TYPE_DRAGON))
    {
        gBattleMons[battler].volatiles.dragonCheer = TRUE;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_GETTING_PUMPED;
    }
    else
    {
        if (GetConfig(CONFIG_FOCUS_ENERGY_CRIT_RATIO) >= GEN_3
         || GetConfig(CONFIG_CRIT_CHANCE) == GEN_1)
            gBattleMons[battler].volatiles.focusEnergy = TRUE;
        else
            gBattleMons[battler].volatiles.dragonCheer = TRUE;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_GETTING_PUMPED;
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_transformdataexecution(void)
{
    CMD_ARGS();

    gChosenMove = MOVE_UNAVAILABLE;
    gBattlescriptCurrInstr = cmd->nextInstr;
    if (gBattleMons[gBattlerTarget].volatiles.transformed
        || gBattleStruct->illusion[gBattlerTarget].state == ILLUSION_ON
        || IsSemiInvulnerable(gBattlerTarget, EXCLUDE_COMMANDER))
    {
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_FAILED;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TRANSFORM_FAILED;
    }
    else
    {
        s32 i;
        u8 *battleMonAttacker, *battleMonTarget;
        u8 timesGotHit;

        gBattleMons[gBattlerAttacker].volatiles.transformed = TRUE;
        gBattleMons[gBattlerAttacker].volatiles.disabledMove = MOVE_NONE;
        gBattleMons[gBattlerAttacker].volatiles.disableTimer = 0;
        gBattleMons[gBattlerAttacker].volatiles.transformedMonPID = gBattleMons[gBattlerTarget].personality;

        if (B_TRANSFORM_SHINY >= GEN_4)
            gBattleMons[gBattlerAttacker].volatiles.isTransformedMonShiny = gBattleMons[gBattlerTarget].isShiny;
        else
            gBattleMons[gBattlerAttacker].volatiles.isTransformedMonShiny = gBattleMons[gBattlerAttacker].isShiny;
        gBattleMons[gBattlerAttacker].volatiles.mimickedMoves = 0;
        gBattleMons[gBattlerAttacker].volatiles.usedMoves = 0;

        timesGotHit = GetBattlerPartyState(gBattlerTarget)->timesGotHit;
        GetBattlerPartyState(gBattlerAttacker)->timesGotHit = timesGotHit;

        PREPARE_SPECIES_BUFFER(gBattleTextBuff1, gBattleMons[gBattlerTarget].species)

        battleMonAttacker = (u8 *)(&gBattleMons[gBattlerAttacker]);
        battleMonTarget = (u8 *)(&gBattleMons[gBattlerTarget]);

        for (i = 0; i < offsetof(struct BattlePokemon, pp); i++)
            battleMonAttacker[i] = battleMonTarget[i];

        gBattleMons[gBattlerAttacker].volatiles.overwrittenAbility = GetBattlerAbility(gBattlerTarget);
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
    s32 hp = 0;

    if (factor == 2)
        hp = (GetNonDynamaxMaxHP(gBattlerAttacker)+1) / factor; // shed tail rounds up
    else
        hp = GetNonDynamaxMaxHP(gBattlerAttacker) / factor; // one bit value will only work for Pokémon which max hp can go to 1020(which is more than possible in games)

    if (hp == 0)
        hp = 1;

    if (gBattleMons[gBattlerAttacker].hp <= hp)
    {
        hp = 0;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SUBSTITUTE_FAILED;
    }
    else
    {
        gBattleMons[gBattlerAttacker].volatiles.substitute = TRUE;
        gBattleMons[gBattlerAttacker].volatiles.wrapped = FALSE;
        if (factor == 2)
            gBattleMons[gBattlerAttacker].volatiles.substituteHP = hp / 2;
        else
            gBattleMons[gBattlerAttacker].volatiles.substituteHP = hp;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_SUBSTITUTE;
    }

    gBattleStruct->passiveHpUpdate[gBattlerAttacker] = hp;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_mimicattackcopy(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gLastMoves[gBattlerTarget] == MOVE_UNAVAILABLE
     || gLastMoves[gBattlerTarget] == MOVE_NONE
     || gBattleMons[gBattlerAttacker].volatiles.transformed
     || IsMoveMimicBanned(gLastMoves[gBattlerTarget]))
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

            gBattleMons[gBattlerAttacker].volatiles.mimickedMoves |= 1u << gCurrMovePos;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        else
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
    }
}

static void Cmd_setcalledmove(void)
{
    CMD_ARGS();
    gCurrentMove = gCalledMove;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_unused_0x9f(void)
{
}

static void Cmd_unused_0xA0(void)
{
}

static void Cmd_unused_0xA1(void)
{
}

static void Cmd_unused_0xA2(void)
{
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
    if (gBattleMons[gBattlerTarget].volatiles.disabledMove == MOVE_NONE
        && i != MAX_MON_MOVES && gBattleMons[gBattlerTarget].pp[i] != 0)
    {
        PREPARE_MOVE_BUFFER(gBattleTextBuff1, gBattleMons[gBattlerTarget].moves[i])

        gBattleMons[gBattlerTarget].volatiles.disabledMove = gBattleMons[gBattlerTarget].moves[i];
        if (B_DISABLE_TURNS >= GEN_5)
            gBattleMons[gBattlerTarget].volatiles.disableTimer = B_DISABLE_TIMER;
        else if (B_DISABLE_TURNS >= GEN_4)
            gBattleMons[gBattlerTarget].volatiles.disableTimer = (Random() & 3) + B_DISABLE_TIMER; // 4-7 turns
        else
            gBattleMons[gBattlerTarget].volatiles.disableTimer = (Random() & 3) + 2; // 2-5 turns
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
     || i == MAX_MON_MOVES
     || gLastMoves[gBattlerTarget] == MOVE_NONE
     || gLastMoves[gBattlerTarget] == MOVE_UNAVAILABLE
     || gBattleMons[gBattlerTarget].pp[i] == 0
     || gBattleMons[gBattlerTarget].volatiles.encoredMove != MOVE_NONE
     || GetMoveEffect(gChosenMoveByBattler[gBattlerTarget]) == EFFECT_SHELL_TRAP)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gBattleMons[gBattlerTarget].volatiles.encoredMove = gBattleMons[gBattlerTarget].moves[i];
        gBattleMons[gBattlerTarget].volatiles.encoredMovePos = i;

        // If the target's selected move is not the same as the move being Encored into,
        // the target will select a random opposing target
        // Redirection such as Follow Me is already covered in HandleAction_UseMove of battle_util.c
        if (gBattleMons[gBattlerTarget].volatiles.encoredMove != GetChosenMoveFromPosition(gBattlerTarget))
            gBattleStruct->moveTarget[gBattlerTarget] = SetRandomTarget(gBattlerTarget);

        // Encore always lasts 3 turns, but we need to account for a scenario where Encore changes the move during the same turn.
        if (HasBattlerActedThisTurn(gBattlerTarget))
            gBattleMons[gBattlerTarget].volatiles.encoreTimer = B_ENCORE_TIMER;
        else
            gBattleMons[gBattlerTarget].volatiles.encoreTimer = B_ENCORE_TIMER - 1;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_painsplitdmgcalc(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (!(DoesSubstituteBlockMove(gBattlerAttacker, gBattlerTarget, gCurrentMove)))
    {
        s32 hpDiff = (gBattleMons[gBattlerAttacker].hp + GetNonDynamaxHP(gBattlerTarget)) / 2;

        gBattleStruct->passiveHpUpdate[gBattlerTarget] = GetNonDynamaxHP(gBattlerTarget) - hpDiff;
        gBattleStruct->passiveHpUpdate[gBattlerAttacker] = gBattleMons[gBattlerAttacker].hp - hpDiff;

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
    enum Move moveToCheck;
    enum Type typeToCheck;

    if (GetConfig(CONFIG_UPDATED_CONVERSION_2) < GEN_5)
    {
        moveToCheck = gLastLandedMoves[gBattlerAttacker];
        if (GetMoveEffect(moveToCheck) == EFFECT_STRUGGLE)
            typeToCheck = TYPE_NORMAL;
        else
            typeToCheck = gLastHitByType[gBattlerAttacker];
    }
    else
    {
        moveToCheck = gLastResultingMoves[gBattlerTarget];
        typeToCheck = gLastUsedMoveType[gBattlerTarget];
    }

    if (moveToCheck == MOVE_NONE
        || moveToCheck == MOVE_UNAVAILABLE)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (GetActiveGimmick(gBattlerAttacker) == GIMMICK_TERA)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (typeToCheck == TYPE_NONE || typeToCheck == TYPE_STELLAR || typeToCheck == TYPE_MYSTERY)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        u32 i, resistTypes = 0;

        for (i = 0; i < NUMBER_OF_MON_TYPES; i++) // Find all types that resist.
        {
            switch (GetTypeModifier(typeToCheck, i))
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


static void Cmd_setalwayshitflag(void)
{
    CMD_ARGS();
    gBattleMons[gBattlerTarget].volatiles.lockOn = 2;
    gBattleMons[gBattlerTarget].volatiles.battlerWithSureHit = gBattlerAttacker;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

// Sketch
static void Cmd_copymovepermanently(void)
{
    CMD_ARGS(const u8 *failInstr);

    gChosenMove = MOVE_UNAVAILABLE;

    if (!(gBattleMons[gBattlerAttacker].volatiles.transformed)
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

static void Cmd_unused_0xA9(void)
{
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

static void Cmd_unused_AA(void)
{
}

static void Cmd_unused_0xab(void)
{
}

static void Cmd_settailwind(void)
{
    CMD_ARGS(const u8 *failInstr);

    u8 side = GetBattlerSide(gBattlerAttacker);

    if (!(gSideStatuses[side] & SIDE_STATUS_TAILWIND))
    {
        gSideStatuses[side] |= SIDE_STATUS_TAILWIND;
        gSideTimers[side].tailwindTimer = (GetConfig(CONFIG_TAILWIND_TURNS) >= GEN_5 ? 4 : 3);
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
            if (!(gBattleMons[gBattlerTarget].volatiles.mimickedMoves & (1u << i))
                && !(gBattleMons[gBattlerTarget].volatiles.transformed))
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

    if (GetConfig(CONFIG_HEAL_BELL_SOUNDPROOF) == GEN_5
     || GetConfig(CONFIG_HEAL_BELL_SOUNDPROOF) >= GEN_8
     || !(isSoundMove && GetBattlerAbility(gBattlerAttacker) == ABILITY_SOUNDPROOF))
    {
        if (isSoundMove)
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_BELL;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SOOTHING_AROMA;
        gBattleMons[gBattlerAttacker].status1 = 0;
        gBattleMons[gBattlerAttacker].volatiles.nightmare = FALSE;
    }
    else
    {
        RecordAbilityBattle(gBattlerAttacker, gBattleMons[gBattlerAttacker].ability);
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_BELL_SOUNDPROOF_ATTACKER;
    }

    gBattleScripting.battler = partner;

    if (IsBattlerAlive(partner))
    {
        if (GetConfig(CONFIG_HEAL_BELL_SOUNDPROOF) == GEN_5
         || !(isSoundMove && GetBattlerAbility(partner) == ABILITY_SOUNDPROOF))
        {
            gBattleMons[partner].status1 = 0;
            gBattleMons[partner].volatiles.nightmare = FALSE;
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
            enum Ability ability;
            bool32 isAttacker = gBattlerPartyIndexes[gBattlerAttacker] == i;
            bool32 isDoublesPartner = gBattlerPartyIndexes[partner] == i && IsBattlerAlive(partner);

            if (GetConfig(CONFIG_HEAL_BELL_SOUNDPROOF) == GEN_5
             || (GetConfig(CONFIG_HEAL_BELL_SOUNDPROOF) >= GEN_8 && isAttacker))
                ability = ABILITY_NONE;
            else if (GetConfig(CONFIG_HEAL_BELL_SOUNDPROOF) > GEN_5 && !isAttacker && !isDoublesPartner)
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
                    enum BattleTrainer trainer = GetBattlerTrainer(gBattlerAttacker);
                    if (TestRunner_Battle_GetForcedAbility(trainer, i))
                        ability = TestRunner_Battle_GetForcedAbility(trainer, i);
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

    if (gBattleMons[gBattlerTarget].volatiles.cursed)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gBattleMons[gBattlerTarget].volatiles.cursed = TRUE;
        SetPassiveDamageAmount(gBattlerAttacker, GetNonDynamaxMaxHP(gBattlerAttacker) / 2);
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
        if (gSideTimers[targetSide].spikesAmount == 0) // Add only once to the queue
            PushHazardTypeToQueue(targetSide, HAZARDS_SPIKES);
        gSideTimers[targetSide].spikesAmount++;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_setvolatile(void)
{
    CMD_ARGS(u8 battler, u8 _volatile, u8 value);

    SetMonVolatile(GetBattlerForBattleScript(cmd->battler), cmd->_volatile, cmd->value);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_trysetperishsong(void)
{
    CMD_ARGS(const u8 *failInstr);

    s32 i = 0;
    s32 notAffectedCount = 0;

    for (i = 0; i < gBattlersCount; i++)
    {
        if (gBattleMons[i].volatiles.perishSong
            || IsBattlerUnaffectedByMove(i)
            || BlocksPrankster(gCurrentMove, gBattlerAttacker, i, TRUE)
            || gBattleMons[i].volatiles.semiInvulnerable == STATE_COMMANDER)
        {
            notAffectedCount++;
        }
        else
        {
            gBattleMons[i].volatiles.perishSong = TRUE;
            gBattleMons[i].volatiles.perishSongTimer = 3;
        }
    }

    if (notAffectedCount == gBattlersCount)
        gBattlescriptCurrInstr = cmd->failInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_unused_0xb3(void)
{
}

static void Cmd_jumpifconfusedandstatmaxed(void)
{
    CMD_ARGS(u8 stat, const u8 *jumpInstr);

    if (gBattleMons[gBattlerTarget].volatiles.confusionTurns > 0
      && !CompareStat(gBattlerTarget, cmd->stat, MAX_STAT_STAGE, CMP_LESS_THAN, GetBattlerAbility(gBattlerTarget)))
        gBattlescriptCurrInstr = cmd->jumpInstr; // Fails if we're confused AND stat cannot be raised
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_unused_0xb5(void)
{
}

static void Cmd_setembargo(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gBattleMons[gBattlerTarget].volatiles.embargo)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gBattleMons[gBattlerTarget].volatiles.embargo = TRUE;
        gBattleMons[gBattlerTarget].volatiles.embargoTimer = B_EMBARGO_TIMER;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_presentdamagecalculation(void)
{
    CMD_ARGS();

    u32 rand = RandomUniform(RNG_PRESENT, 0, 0xFF);

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
            gSpecialStatuses[gBattlerAttacker].parentalBondState = PARENTAL_BOND_OFF;
            gSpecialStatuses[gBattlerAttacker].multiHitOn = 0;
            gMultiHitCounter = 0;
            SetHealAmount(gBattlerTarget, GetNonDynamaxMaxHP(gBattlerTarget) / 4);
            gBattleStruct->presentBasePower = 0;
        }
    }

    if (gBattleStruct->presentBasePower)
    {
        gBattlescriptCurrInstr = BattleScript_HitFromDamageCalc;
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
        gSideTimers[GetBattlerSide(gBattlerAttacker)].safeguardTimer = 5;
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SET_SAFEGUARD;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_magnitudedamagecalculation(void)
{
    CMD_ARGS();

    u32 magnitude = RandomUniform(RNG_MAGNITUDE, 0, 99);

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
    gBattlescriptCurrInstr = cmd->nextInstr;
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

static void Cmd_tryactivateitem(void)
{
    CMD_ARGS(u8 battler, u8 flag);
    u32 battler = GetBattlerForBattleScript(cmd->battler);

    gBattlescriptCurrInstr = cmd->nextInstr;

    switch ((enum ItemActivationState)cmd->flag)
    {
    case ACTIVATION_ON_USABLE_AGAIN:
    case ACTIVATION_ON_PICK_UP:
        if (ItemBattleEffects(battler, 0, GetBattlerHoldEffect(battler), IsForceTriggerItemActivation))
            return;
        break;
    case ACTIVATION_ON_HARVEST:
        gLastUsedItem = gBattleMons[battler].item;
        if (ItemBattleEffects(battler, 0, GetBattlerHoldEffect(battler), IsOnBerryActivation))
            return;
        break;
    case ACTIVATION_ON_HP_THRESHOLD:
        if (ItemBattleEffects(battler, 0, GetBattlerHoldEffect(battler), IsOnHpThresholdActivation))
            return;
        break;
    case ACTIVATION_ON_STATUS_CHANGE:
        if (ItemBattleEffects(battler, 0, GetBattlerHoldEffect(battler), IsOnStatusChangeActivation))
            return;
        break;
    }
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
        SetPassiveDamageAmount(gBattlerAttacker, GetNonDynamaxMaxHP(gBattlerAttacker) / 2);
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
    CMD_ARGS();

    s32 i;

    for (i = 0; i < NUM_BATTLE_STATS; i++)
    {
        gBattleMons[gBattlerAttacker].statStages[i] = gBattleMons[gBattlerTarget].statStages[i];
    }
    gBattleScripting.battler = gBattlerTarget;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_rapidspinfree(void)
{
    CMD_ARGS();

    u8 atkSide = GetBattlerSide(gBattlerAttacker);

    if (gBattleMons[gBattlerAttacker].volatiles.wrapped)
    {
        gBattleScripting.battler = gBattlerTarget;
        gBattleMons[gBattlerAttacker].volatiles.wrapped = FALSE;
        gBattlerTarget = gBattleMons[gBattlerAttacker].volatiles.wrappedBy;
        PREPARE_MOVE_BUFFER(gBattleTextBuff1, gBattleMons[gBattlerAttacker].volatiles.wrappedMove);
        BattleScriptCall(BattleScript_WrapFree);
    }
    else if (gBattleMons[gBattlerAttacker].volatiles.leechSeed)
    {
        gBattleMons[gBattlerAttacker].volatiles.leechSeed = 0;
        BattleScriptCall(BattleScript_LeechSeedFree);
    }
    else if (AreAnyHazardsOnSide(atkSide))
    {
        for (u32 hazardType = HAZARDS_NONE + 1; hazardType < HAZARDS_MAX_COUNT; hazardType++)
        {
            if (IsHazardOnSideAndClear(atkSide, hazardType))
            {
                gBattleStruct->numHazards[atkSide]--;
                gBattleCommunication[MULTISTRING_CHOOSER] = hazardType;
                BattleScriptCall(BattleScript_SpinHazardsAway);
                return;
            }
        }
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_unused_0xBF(void)
{
}

static void Cmd_recoverbasedonsunlight(void)
{
    CMD_ARGS(const u8 *failInstr);

    gBattlerTarget = gBattlerAttacker;
    if (gBattleMons[gBattlerAttacker].hp != gBattleMons[gBattlerAttacker].maxHP)
    {
        s32 recoverAmount = 0;
        if (GetMoveEffect(gCurrentMove) == EFFECT_SHORE_UP)
        {
            if (HasWeatherEffect() && gBattleWeather & B_WEATHER_SANDSTORM)
                recoverAmount = 20 * GetNonDynamaxMaxHP(gBattlerAttacker) / 30;
            else
                recoverAmount = GetNonDynamaxMaxHP(gBattlerAttacker) / 2;
        }
        else if (GetConfig(CONFIG_TIME_OF_DAY_HEALING_MOVES) != GEN_2)
        {
            if (!(gBattleWeather & B_WEATHER_ANY) || !HasWeatherEffect() || GetBattlerHoldEffect(gBattlerAttacker) == HOLD_EFFECT_UTILITY_UMBRELLA)
                recoverAmount = GetNonDynamaxMaxHP(gBattlerAttacker) / 2;
            else if (gBattleWeather & B_WEATHER_SUN)
                recoverAmount = 20 * GetNonDynamaxMaxHP(gBattlerAttacker) / 30;
            else // not sunny weather
                recoverAmount = GetNonDynamaxMaxHP(gBattlerAttacker) / 4;
        }
        else // B_TIME_OF_DAY_HEALING_MOVES == GEN_2
        {
            u32 healingModifier = 1;
            u32 time = GetTimeOfDay();

            switch (GetMoveEffect(gCurrentMove))
            {
            case EFFECT_MOONLIGHT:
                if (time == TIME_NIGHT || time == TIME_EVENING)
                    healingModifier = 2;
                break;
            case EFFECT_MORNING_SUN:
                if ((OW_TIMES_OF_DAY == GEN_3 && time == TIME_DAY) // Gen 3 doesn't have morning
                  || (OW_TIMES_OF_DAY != GEN_3 && time == TIME_MORNING))
                    healingModifier = 2;
                break;
            case EFFECT_SYNTHESIS:
                if (time == TIME_DAY)
                    healingModifier = 2;
                break;
            default:
                healingModifier = 1;
                break;
            }

            if (!(gBattleWeather & B_WEATHER_ANY) || !HasWeatherEffect() || GetBattlerHoldEffect(gBattlerAttacker) == HOLD_EFFECT_UTILITY_UMBRELLA)
                recoverAmount = healingModifier * GetNonDynamaxMaxHP(gBattlerAttacker) / 4;
            else if (gBattleWeather & B_WEATHER_SUN)
                recoverAmount = healingModifier * GetNonDynamaxMaxHP(gBattlerAttacker) / 2;
            else // not sunny weather
                recoverAmount = healingModifier * GetNonDynamaxMaxHP(gBattlerAttacker) / 8;

        }

        SetHealAmount(gBattlerAttacker, recoverAmount);
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

    if (IsHazardOnSide(targetSide, HAZARDS_STICKY_WEB))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        PushHazardTypeToQueue(targetSide, HAZARDS_STICKY_WEB);
        gSideTimers[targetSide].stickyWebBattlerId = gBattlerAttacker; // For Mirror Armor
        gSideTimers[targetSide].stickyWebBattlerSide = GetBattlerSide(gBattlerAttacker); // For Court Change/Defiant - set this to the user's side
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_selectfirstvalidtarget(void)
{
    CMD_ARGS();

    for (gBattlerTarget = 0; gBattlerTarget < gBattlersCount; gBattlerTarget++)
    {
        if (gBattlerTarget == gBattlerAttacker && GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove) != TARGET_ALL_BATTLERS)
            continue;
        if (IsBattlerAlive(gBattlerTarget))
            break;
    }
    if (gBattlerTarget >= gBattlersCount)
        gBattlerTarget = 0;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_setfutureattack(void)
{
    CMD_ARGS();

    gBattleStruct->futureSight[gBattlerTarget].move = gCurrentMove;
    gBattleStruct->futureSight[gBattlerTarget].battlerIndex = gBattlerAttacker;
    gBattleStruct->futureSight[gBattlerTarget].partyIndex = gBattlerPartyIndexes[gBattlerAttacker];
    gBattleStruct->futureSight[gBattlerTarget].counter = 3;

    if (gCurrentMove == MOVE_DOOM_DESIRE)
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_DOOM_DESIRE;
    else
        gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_FUTURE_SIGHT;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_trydobeatup(void)
{
    CMD_ARGS(const u8 *endInstr, const u8 *failInstr);

    if (!IsBattlerAlive(gBattlerTarget))
    {
        gMultiHitCounter = 0;
        gBattlescriptCurrInstr = cmd->endInstr;
    }
    else if (gBattleStruct->beatUpSlot == 0 && gMultiHitCounter == 0)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, gBattlerAttacker, gBattleStruct->beatUpSpecies[gBattleStruct->beatUpSlot])
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_setsemiinvulnerablebit(void)
{
    CMD_ARGS(bool8 clear);

    if (gBattleMoveEffects[GetMoveEffect(gCurrentMove)].semiInvulnerableEffect == TRUE)
    {
        u32 semiInvulnerableEffect = GetMoveTwoTurnAttackStatus(gCurrentMove);
        if (cmd->clear)
            gBattleMons[gBattlerAttacker].volatiles.semiInvulnerable = STATE_NONE;
        else
            gBattleMons[gBattlerAttacker].volatiles.semiInvulnerable = semiInvulnerableEffect;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void Cmd_unused_0xC6(void)
{
}

static void Cmd_unused_0xC7(void)
{
}

static void Cmd_unused_c8(void)
{
}

static void Cmd_trymemento(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (B_MEMENTO_FAIL >= GEN_5 && DoesSubstituteBlockMove(gBattlerAttacker, gBattlerTarget, gCurrentMove))
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
        gBattleStruct->passiveHpUpdate[gBattlerAttacker] = gBattleMons[gBattlerAttacker].hp;
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

static void Cmd_unused_0xcb(void)
{
}

static void Cmd_unused_0xCC(void)
{
}

static void Cmd_curestatuswithmove(void)
{
    CMD_ARGS(const u8 *failInstr);
    u32 shouldHeal;

    if (GetMoveEffect(gCurrentMove) == EFFECT_REFRESH)
        shouldHeal = gBattleMons[gBattlerAttacker].status1 & STATUS1_CAN_MOVE;
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

    if (gBattleMons[gBattlerTarget].volatiles.torment == TRUE
        || (GetActiveGimmick(gBattlerTarget) == GIMMICK_DYNAMAX))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gBattleMons[gBattlerTarget].volatiles.torment = TRUE;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_unused_0xCF(void)
{
}

static void Cmd_settaunt(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (GetConfig(CONFIG_OBLIVIOUS_TAUNT) >= GEN_6 && GetBattlerAbility(gBattlerTarget) == ABILITY_OBLIVIOUS)
    {
        gBattlescriptCurrInstr = BattleScript_NotAffectedAbilityPopUp;
        gLastUsedAbility = ABILITY_OBLIVIOUS;
        RecordAbilityBattle(gBattlerTarget, ABILITY_OBLIVIOUS);
    }
    else if (gBattleMons[gBattlerTarget].volatiles.tauntTimer == 0)
    {
        u8 turns;
        if (B_TAUNT_TURNS >= GEN_5)
        {
            turns = B_TAUNT_TIMER - 1; // 4 turns
            if (!HasBattlerActedThisTurn(gBattlerTarget))
                turns--; // If the target hasn't yet moved this turn, Taunt lasts for only three turns (source: Bulbapedia)
        }
        else if (B_TAUNT_TURNS >= GEN_4)
        {
            turns = RandomUniform(RNG_TAUNT, 3, B_TAUNT_TIMER);
        }
        else
        {
            turns = 2;
        }

        gBattleMons[gBattlerTarget].volatiles.tauntTimer = turns;
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

    if (!IsDoubleBattle())
    {
        gBattlescriptCurrInstr = cmd->failInstr;
        return;
    }

    gBattlerTarget = GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerPosition(gBattlerAttacker)));

    if (!(gAbsentBattlerFlags & (1u << gBattlerTarget))
     && !HasBattlerActedThisTurn(gBattlerTarget))
    {
        gProtectStructs[gBattlerTarget].helpingHand++;
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
        // You can't swap items if they were knocked off in regular battles
        if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK
                             | BATTLE_TYPE_EREADER_TRAINER
                             | BATTLE_TYPE_FRONTIER
                             | BATTLE_TYPE_SECRET_BASE
                             | BATTLE_TYPE_RECORDED_LINK))
            && (GetBattlerPartyState(gBattlerAttacker)->isKnockedOff || GetBattlerPartyState(gBattlerTarget)->isKnockedOff))
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        // can't swap if two Pokémon don't have an item
        // or if either of them is an enigma berry or a mail
        else if ((gBattleMons[gBattlerAttacker].item == ITEM_NONE && gBattleMons[gBattlerTarget].item == ITEM_NONE)
                 || !CanBattlerGetOrLoseItem(gBattlerAttacker, gBattlerTarget, gBattleMons[gBattlerAttacker].item)
                 || !CanBattlerGetOrLoseItem(gBattlerAttacker, gBattlerTarget, gBattleMons[gBattlerTarget].item)
                 || !CanBattlerGetOrLoseItem(gBattlerTarget, gBattlerAttacker, gBattleMons[gBattlerTarget].item)
                 || !CanBattlerGetOrLoseItem(gBattlerTarget, gBattlerAttacker, gBattleMons[gBattlerAttacker].item))
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        // check if ability prevents swapping
        else if (GetBattlerAbility(gBattlerTarget) == ABILITY_STICKY_HOLD)
        {
            gBattlescriptCurrInstr = BattleScript_StickyHoldActivates;
            gBattlerAbility = gBattlerTarget;
            gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
            RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
        }
        // took a while, but all checks passed and items can be safely swapped
        else
        {
            u16 oldItemAtk, oldItemDef;

            oldItemAtk = gBattleMons[gBattlerAttacker].item;
            oldItemDef = gBattleMons[gBattlerTarget].item;

            gBattleMons[gBattlerAttacker].item = oldItemDef;
            gBattleMons[gBattlerTarget].item = oldItemAtk;

            RecordItemEffectBattle(gBattlerAttacker, GetItemHoldEffect(oldItemDef));
            RecordItemEffectBattle(gBattlerTarget, GetItemHoldEffect(oldItemAtk));

            BtlController_EmitSetMonData(gBattlerAttacker, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[gBattlerAttacker].item), &gBattleMons[gBattlerAttacker].item);
            MarkBattlerForControllerExec(gBattlerAttacker);

            BtlController_EmitSetMonData(gBattlerTarget, B_COMM_TO_CONTROLLER, REQUEST_HELDITEM_BATTLE, 0, sizeof(gBattleMons[gBattlerTarget].item), &gBattleMons[gBattlerTarget].item);
            MarkBattlerForControllerExec(gBattlerTarget);

            if (GetBattlerAbility(gBattlerTarget) != ABILITY_GORILLA_TACTICS)
                gBattleStruct->choicedMove[gBattlerTarget] = MOVE_NONE;

            if (GetBattlerAbility(gBattlerAttacker) != ABILITY_GORILLA_TACTICS
             && (!IsHoldEffectChoice(GetItemHoldEffect(oldItemDef))
             || (GetConfig(CONFIG_MODERN_TRICK_CHOICE_LOCK) >= GEN_5)))
            {
                gBattleStruct->choicedMove[gBattlerAttacker] = MOVE_NONE;
            }

            gBattlescriptCurrInstr = cmd->nextInstr;

            PREPARE_ITEM_BUFFER(gBattleTextBuff1, oldItemDef)
            PREPARE_ITEM_BUFFER(gBattleTextBuff2, oldItemAtk)

            if (!(IsBattlerAlly(gBattlerAttacker, gBattlerTarget) && IsPartnerMonFromSameTrainer(gBattlerAttacker)))
            {
                // if targeting your own side and you aren't in a multi battle, don't save items as stolen
                if (IsOnPlayerSide(gBattlerAttacker))
                    TrySaveExchangedItem(gBattlerAttacker, oldItemAtk);
                if (IsOnPlayerSide(gBattlerTarget))
                    TrySaveExchangedItem(gBattlerTarget, oldItemDef);
            }

            if (oldItemAtk != ITEM_NONE && oldItemDef != ITEM_NONE)
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ITEM_SWAP_BOTH;  // attacker's item -> <- target's item
            }
            else if (oldItemAtk == ITEM_NONE && oldItemDef != ITEM_NONE)
            {
                CheckSetUnburden(gBattlerTarget);
                gBattleMons[gBattlerAttacker].volatiles.unburdenActive = FALSE;
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ITEM_SWAP_TAKEN; // nothing -> <- target's item
            }
            else
            {
                CheckSetUnburden(gBattlerAttacker);
                gBattleMons[gBattlerTarget].volatiles.unburdenActive = FALSE;
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_ITEM_SWAP_GIVEN; // attacker's item -> <- nothing
            }
        }
    }
}

static bool32 CanAbilityShieldActivateForBattler(u32 battler)
{
    if (GetBattlerHoldEffectIgnoreAbility(battler) != HOLD_EFFECT_ABILITY_SHIELD)
        return FALSE;

    RecordItemEffectBattle(battler, HOLD_EFFECT_ABILITY_SHIELD);
    gBattlerAbility = battler;
    gLastUsedItem = gBattleMons[battler].item;
    return TRUE;
}

// Role Play, Doodle
static void Cmd_trycopyability(void)
{
    CMD_ARGS(u8 battler, const u8 *failInstr);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    u32 partner = BATTLE_PARTNER(battler);
    enum Ability defAbility = gBattleMons[gBattlerTarget].ability;
    bool32 shouldConsiderPartner = IsBattlerAlive(partner) && GetMoveEffect(gCurrentMove) == EFFECT_DOODLE;

    if (gBattleMons[battler].ability == defAbility
      || defAbility == ABILITY_NONE
      || gAbilitiesInfo[gBattleMons[battler].ability].cantBeSuppressed
      || (shouldConsiderPartner && gAbilitiesInfo[gBattleMons[partner].ability].cantBeSuppressed)
      || gAbilitiesInfo[defAbility].cantBeCopied)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (CanAbilityShieldActivateForBattler(battler) || (shouldConsiderPartner && CanAbilityShieldActivateForBattler(partner)))
    {
        gBattlescriptCurrInstr = BattleScript_MoveEnd;
        BattleScriptCall(BattleScript_AbilityShieldProtects);
    }
    else
    {
        RemoveAbilityFlags(battler);
        gBattleScripting.abilityPopupOverwrite = gBattleMons[battler].ability;
        gBattleMons[battler].ability = gBattleMons[battler].volatiles.overwrittenAbility = defAbility;
        gLastUsedAbility = defAbility;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_trywish(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gBattleMons[gBattlerTarget].volatiles.healBlock)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (gBattleStruct->wish[gBattlerAttacker].counter == 0)
    {
        gBattleStruct->wish[gBattlerAttacker].counter = 2;
        gBattleStruct->wish[gBattlerAttacker].partyId = gBattlerPartyIndexes[gBattlerAttacker];
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
        if (gSideTimers[targetSide].toxicSpikesAmount == 0)
            PushHazardTypeToQueue(targetSide, HAZARDS_TOXIC_SPIKES);
        gSideTimers[targetSide].toxicSpikesAmount++;
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
    else if (GetBattlerHoldEffectIgnoreAbility(gBattlerTarget) == HOLD_EFFECT_ABILITY_SHIELD)
    {
        RecordItemEffectBattle(gBattlerTarget, HOLD_EFFECT_ABILITY_SHIELD);
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        if (gBattleMons[gBattlerTarget].volatiles.neutralizingGas)
            gSpecialStatuses[gBattlerTarget].neutralizingGasRemoved = TRUE;

        gBattleMons[gBattlerTarget].volatiles.gastroAcid = TRUE;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_setyawn(void)
{
    CMD_ARGS(const u8 *failInstr);
    enum Ability ability = GetBattlerAbility(gBattlerTarget);
    enum HoldEffect holdEffect = GetBattlerHoldEffect(gBattlerTarget);

    if (gBattleMons[gBattlerTarget].volatiles.yawn
        || gBattleMons[gBattlerTarget].status1 & STATUS1_ANY)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (IsElectricTerrainAffected(gBattlerTarget, ability, holdEffect, gFieldStatuses))
    {
        // When Yawn is used while Electric Terrain is set and drowsiness is set from Yawn being used against target in the previous turn:
        // "But it failed" will display first.
        gBattlescriptCurrInstr = BattleScript_ElectricTerrainPrevents;
    }
    else if (IsMistyTerrainAffected(gBattlerTarget, ability, holdEffect, gFieldStatuses))
    {
        // When Yawn is used while Misty Terrain is set and drowsiness is set from Yawn being used against target in the previous turn:
        // "But it failed" will display first.
        gBattlescriptCurrInstr = BattleScript_MistyTerrainPrevents;
    }
    else
    {
        gBattleMons[gBattlerTarget].volatiles.yawn = 2;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_unused0xd8(void)
{
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
        *timer = 5;
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
    else if (CanAbilityShieldActivateForBattler(gBattlerAttacker) || CanAbilityShieldActivateForBattler(gBattlerTarget))
    {
        gBattlescriptCurrInstr = BattleScript_MoveEnd;
        BattleScriptCall(BattleScript_AbilityShieldProtects);
    }
    else
    {
        if (IsBattlerUnaffectedByMove(gBattlerTarget) || (GetActiveGimmick(gBattlerTarget) == GIMMICK_DYNAMAX))
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            if (!IsBattlerAlly(gBattlerAttacker, gBattlerTarget))
                gBattleScripting.abilityPopupOverwrite = gBattleMons[gBattlerAttacker].ability;
            gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
            RemoveAbilityFlags(gBattlerTarget);
            RemoveAbilityFlags(gBattlerAttacker);
            gBattleMons[gBattlerTarget].ability = gBattleMons[gBattlerTarget].volatiles.overwrittenAbility = gBattleMons[gBattlerAttacker].ability;
            gBattleMons[gBattlerAttacker].ability = gBattleMons[gBattlerAttacker].volatiles.overwrittenAbility = gLastUsedAbility;

            gBattlescriptCurrInstr = cmd->nextInstr;
        }
    }
}

static void Cmd_tryimprison(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gBattleMons[gBattlerAttacker].volatiles.imprison)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (B_IMPRISON >= GEN_5)
    {
        gBattleMons[gBattlerAttacker].volatiles.imprison = TRUE;
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
                    gBattleMons[gBattlerAttacker].volatiles.imprison = TRUE;
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
    if (IsHazardOnSide(targetSide, HAZARDS_STEALTH_ROCK))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        PushHazardTypeToQueue(targetSide, HAZARDS_STEALTH_ROCK);
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_trysetvolatile(void)
{
    CMD_ARGS(u8 battler, u8 _volatile, const u8 *failInstr);

    u32 battler = GetBattlerForBattleScript(cmd->battler);

    if (GetBattlerVolatile(battler, cmd->_volatile) != 0)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        SetMonVolatile(battler, cmd->_volatile, TRUE);
        switch (cmd->_volatile)
        {
        case VOLATILE_MAGNET_RISE:
            gBattleMons[battler].volatiles.magnetRiseTimer = B_MAGNET_RISE_TIMER;
            break;
        case VOLATILE_LASER_FOCUS:
            gBattleMons[battler].volatiles.laserFocusTimer = B_LASER_FOCUS_TIMER;
            break;
        default:
            break;
        }
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static void Cmd_unused_0xde(void)
{
}

static void Cmd_trysetmagiccoat(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (IsLastMonToMove(gBattlerAttacker)) // fails if moving last
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

    if (IsLastMonToMove(gBattlerAttacker)) // fails if moving last
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
    if (gBattleMons[battler].volatiles.neutralizingGas)
    {
        gBattleMons[battler].volatiles.neutralizingGas = FALSE;
        if (!IsNeutralizingGasOnField())
        {
            BattleScriptPush(gBattlescriptCurrInstr);
            gBattlescriptCurrInstr = BattleScript_NeutralizingGasExits;
            return;
        }
    }

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
    default:
        break;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
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

static void Cmd_unused_0xE4(void)
{
}

static void Cmd_pickup(void)
{
    CMD_ARGS();

    u32 i, j;
    u16 species, heldItem;
    u8 lvlDivBy10;
    enum Ability ability;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES_OR_EGG);
        heldItem = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
        lvlDivBy10 = (GetMonData(&gPlayerParty[i], MON_DATA_LEVEL)-1) / 10; //Moving this here makes it easier to add in abilities like Honey Gather.
        if (lvlDivBy10 > 9)
            lvlDivBy10 = 9;

        ability = GetSpeciesAbility(species, GetMonData(&gPlayerParty[i], MON_DATA_ABILITY_NUM));

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

    if (!gBattleStruct->isSkyBattle)
    {
        if (GetMoveEffect(gCurrentMove) == EFFECT_MUD_SPORT)
        {
            if (B_SPORT_TURNS >= GEN_6)
            {
                if (!(gFieldStatuses & STATUS_FIELD_MUDSPORT))
                {
                    gFieldStatuses |= STATUS_FIELD_MUDSPORT;
                    gFieldTimers.mudSportTimer = 5;
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEAKEN_ELECTRIC;
                    worked = TRUE;
                }
            }
            else
            {
                if (!gBattleMons[gBattlerAttacker].volatiles.mudSport)
                {
                    gBattleMons[gBattlerAttacker].volatiles.mudSport = TRUE;
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
                    gFieldTimers.waterSportTimer = 5;
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEAKEN_FIRE;
                    worked = TRUE;
                }
            }
            else
            {
                if (!gBattleMons[gBattlerAttacker].volatiles.waterSport)
                {
                    gBattleMons[gBattlerAttacker].volatiles.waterSport = TRUE;
                    gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_WEAKEN_FIRE;
                    worked = TRUE;
                }
            }
        }
    }

    if (worked)
        gBattlescriptCurrInstr = cmd->nextInstr;
    else
        gBattlescriptCurrInstr = cmd->failInstr;
}

bool32 DoesSubstituteBlockMove(u32 battlerAtk, u32 battlerDef, enum Move move)
{
    if (!gBattleMons[battlerDef].volatiles.substitute)
        return FALSE;
    else if (MoveIgnoresSubstitute(move))
        return FALSE;
    else if (IsAbilityAndRecord(battlerAtk, GetBattlerAbility(battlerAtk), ABILITY_INFILTRATOR))
        return FALSE;
    else
        return TRUE;
}

bool32 DoesDisguiseBlockMove(u32 battler, enum Move move)
{
    if (!IsMimikyuDisguised(battler)
     || gBattleMons[battler].volatiles.transformed
     || IsBattleMoveStatus(move)
     || !IsAbilityAndRecord(battler, GetBattlerAbility(battler), ABILITY_DISGUISE))
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
        usedHeldItem = &GetBattlerPartyState(gBattlerTarget)->usedHeldItem;
    else
        usedHeldItem = &GetBattlerPartyState(gBattlerAttacker)->usedHeldItem;
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

static void Cmd_unused_0xee(void)
{
}

u8 GetCatchingBattler(void)
{
    if (IsBattlerAlive(GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT)))
        return GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
    else
        return GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
}

static void FinalizeCapture(void)
{
    u32 ballId = ItemIdToBallId(gLastThrownBall);
    enum NationalDexOrder natDexNo = SpeciesToNationalPokedexNum(gBattleMons[gBattlerTarget].species);
    if (GetConfig(CONFIG_CRITICAL_CAPTURE_IF_OWNED) >= GEN_9 && GetSetPokedexFlag(natDexNo, FLAG_GET_CAUGHT))
    {
        gBattleSpritesDataPtr->animationData->isCriticalCapture = TRUE;
        gBattleSpritesDataPtr->animationData->criticalCaptureSuccess = TRUE;
    }
    BtlController_EmitBallThrowAnim(gBattlerAttacker, B_COMM_TO_CONTROLLER, BALL_3_SHAKES_SUCCESS);
    MarkBattlerForControllerExec(gBattlerAttacker);
    TryBattleFormChange(gBattlerTarget, FORM_CHANGE_END_BATTLE);
    gBattlescriptCurrInstr = BattleScript_SuccessBallThrow;
    struct Pokemon *caughtMon = GetBattlerMon(gBattlerTarget);
    SetMonData(caughtMon, MON_DATA_POKEBALL, &ballId);

    if (CalculatePlayerPartyCount() == PARTY_SIZE)
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
    else
        gBattleCommunication[MULTISTRING_CHOOSER] = 1;

    if (ballId == BALL_HEAL)
    {
        MonRestorePP(caughtMon);
        HealStatusConditions(caughtMon, STATUS1_ANY, gBattlerTarget);
        gBattleMons[gBattlerTarget].hp = gBattleMons[gBattlerTarget].maxHP;
        SetMonData(caughtMon, MON_DATA_HP, &gBattleMons[gBattlerTarget].hp);
    }
    else if (ballId == BALL_FRIEND)
    {
        u32 friendship = (B_FRIEND_BALL_MODIFIER >= GEN_8 ? 150 : 200);
        SetMonData(caughtMon, MON_DATA_FRIENDSHIP, &friendship);
    }
}

struct BallData
{
    u16 multiplier;
    u16 divider;
    bool8 guaranteedCapture;
    s8 flatBonus;
};

#define CAPTURE_GUARANTEED -1

static void ComputeBallData(u32 wildMonBattler, u32 playerBattler, struct BallData *ball)
{
    u32 i;
    u32 ballId = ItemIdToBallId(gLastUsedItem);
    struct BattlePokemon *battleMon = &gBattleMons[wildMonBattler];

    ball->multiplier = 100;
    ball->divider = 100;
    ball->flatBonus = 0;
    ball->guaranteedCapture = FALSE;

    if (gSpeciesInfo[battleMon->species].isUltraBeast)
    {
        if (ballId == BALL_BEAST)
            ball->multiplier = 500;
        else
        {
            ball->multiplier = 410;
            ball->divider = 4096;
        }
        return;
    }
    switch (ballId)
    {
    case BALL_GREAT:
        ball->multiplier = 150;
        break;
    case BALL_ULTRA:
        ball->multiplier = 200;
        break;
    case BALL_MASTER:
        ball->guaranteedCapture = TRUE;
        break;
    case BALL_NET:
        if (IS_BATTLER_ANY_TYPE(wildMonBattler, TYPE_WATER, TYPE_BUG))
            ball->multiplier = B_NET_BALL_MODIFIER >= GEN_7 ? 350 : 300;
        break;
    case BALL_NEST:
        ball->multiplier = 100;
        if ((B_NEST_BALL_MODIFIER == GEN_5 && battleMon->level < 31)
            || (B_NEST_BALL_MODIFIER >= GEN_6 && battleMon->level < 30))
        {
            ball->multiplier = (41 - battleMon->level) * 4096 / 10;
            ball->divider = 4096;
        }
        else if (battleMon->level < 30)
        {
            ball->multiplier = 400 - (battleMon->level * 10);
        }
        break;
    case BALL_DIVE:
        if (GetCurrentMapType() == MAP_TYPE_UNDERWATER
            || (B_DIVE_BALL_MODIFIER >= GEN_4 && (gIsFishingEncounter || gIsSurfingEncounter)))
        {
            ball->multiplier = 350;
        }
        break;
    case BALL_DUSK:
        i = GetTimeOfDay();
        if (i == TIME_EVENING || i == TIME_NIGHT || gMapHeader.cave || gMapHeader.mapType == MAP_TYPE_UNDERGROUND)
            ball->multiplier = (B_DUSK_BALL_MODIFIER >= GEN_7 ? 300 : 350);
        break;
    case BALL_TIMER:
        if (B_TIMER_BALL_MODIFIER >= GEN_5)
        {
            ball->multiplier = 4096 + gBattleResults.battleTurnCounter * 1229;
            ball->divider = 4096;
        }
        else
        {
            ball->multiplier = 100 + gBattleResults.battleTurnCounter * 10;
        }
        if (ball->multiplier > (4 * ball->divider))
            ball->multiplier = 4 * ball->divider;
        break;
    case BALL_QUICK:
        if (gBattleResults.battleTurnCounter == 0)
            ball->multiplier = (B_QUICK_BALL_MODIFIER >= GEN_5 ? 500 : 400);
        break;
    case BALL_REPEAT:
        if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(battleMon->species), FLAG_GET_CAUGHT))
            ball->multiplier = (B_REPEAT_BALL_MODIFIER >= GEN_7 ? 350 : 300);
        break;
    case BALL_LEVEL:
        if (gBattleMons[playerBattler].level >= 4 * battleMon->level)
            ball->multiplier = 800;
        else if (gBattleMons[playerBattler].level > 2 * battleMon->level)
            ball->multiplier = 400;
        else if (gBattleMons[playerBattler].level > battleMon->level)
            ball->multiplier = 200;
        break;
    case BALL_LURE:
        if (gIsFishingEncounter)
        {
            if (B_LURE_BALL_MODIFIER >= GEN_8)
                ball->multiplier = 400;
            else if (B_LURE_BALL_MODIFIER >= GEN_7)
                ball->multiplier = 500;
            else
                ball->multiplier = 300;
        }
        break;
    case BALL_MOON:
    {
        const struct Evolution *evolutions = GetSpeciesEvolutions(battleMon->species);
        if (evolutions == NULL)
            break;
        for (i = 0; evolutions[i].method != EVOLUTIONS_END; i++)
        {
            if (evolutions[i].method == EVO_ITEM
                && evolutions[i].param == ITEM_MOON_STONE)
                ball->multiplier = 400;
        }
        break;
    }
    case BALL_LOVE:
        if (battleMon->species == gBattleMons[playerBattler].species)
        {
            u8 gender1 = GetMonGender(GetBattlerMon(wildMonBattler));
            u8 gender2 = GetMonGender(GetBattlerMon(playerBattler));

            if (gender1 != gender2 && gender1 != MON_GENDERLESS && gender2 != MON_GENDERLESS)
                ball->multiplier = 800;
        }
        break;
    case BALL_FAST:
        if (GetSpeciesBaseSpeed(battleMon->species) >= 100)
            ball->multiplier = 400;
        break;
    case BALL_HEAVY:
        i = GetSpeciesWeight(battleMon->species);
        if (B_HEAVY_BALL_MODIFIER >= GEN_7)
        {
            if (i < 1000)
                ball->flatBonus = -20;
            else if (i < 2000)
                ball->flatBonus = 0;
            else if (i < 3000)
                ball->flatBonus = 20;
            else
                ball->flatBonus = 30;
        }
        else if (B_HEAVY_BALL_MODIFIER >= GEN_4)
        {
            if (i < 2048)
                ball->flatBonus = -20;
            else if (i < 3072)
                ball->flatBonus = 20;
            else if (i < 4096)
                ball->flatBonus = 30;
            else
                ball->flatBonus = 40;
        }
        else
        {
            if (i < 1024)
                ball->flatBonus = -20;
            else if (i < 2048)
                ball->flatBonus = 0;
            else if (i < 3072)
                ball->flatBonus = 20;
            else if (i < 4096)
                ball->flatBonus = 30;
            else
                ball->flatBonus = 40;
        }
        break;
    case BALL_DREAM:
        if (B_DREAM_BALL_MODIFIER >= GEN_8 && (battleMon->status1 & STATUS1_SLEEP || (GetBattlerAbilityIgnoreMoldBreaker(wildMonBattler) == ABILITY_COMATOSE)))
            ball->multiplier = 400;
        break;
    case BALL_SAFARI:
        if (B_SAFARI_BALL_MODIFIER == GEN_1)
            ball->multiplier = 200;
        else if (B_SAFARI_BALL_MODIFIER <= GEN_7)
            ball->multiplier = 150;
        break;
    case BALL_SPORT:
        if (B_SPORT_BALL_MODIFIER <= GEN_7)
            ball->multiplier = 150;
        break;
    case BALL_BEAST:
        ball->multiplier = 410;
        ball->divider = 4096;
        break;
    }

}

static const u8 sBadgeLevel[] = {
    25,
    30,
    35,
    40,
    45,
    50,
    55,
    60,
    100,
};

static u32 ComputeCaptureOdds(u32 wildMonBattler, u32 playerBattler)
{
    struct BallData ball;
    ComputeBallData(wildMonBattler, playerBattler, &ball);

    if (ball.guaranteedCapture)
        return CAPTURE_GUARANTEED;
    struct BattlePokemon *battleMon = &gBattleMons[wildMonBattler];
    u32 odds = (battleMon->maxHP * 3 -  battleMon->hp * 2);
    s32 catchRate;

    if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
        catchRate = gBattleStruct->safariCatchFactor * 1275 / 100;
    else
        catchRate = gSpeciesInfo[battleMon->species].catchRate;

    catchRate += ball.flatBonus;
    if (catchRate <= 0)
        catchRate = catchRate + ball.flatBonus;

    odds = odds * catchRate / (battleMon->maxHP * 3);
    odds = odds * ball.multiplier / ball.divider;

    u8 badgeCount = 0;
    for (u32 i = FLAG_BADGE01_GET; i < FLAG_BADGE01_GET + NUM_BADGES; i++)
    {
        if (FlagGet(i))
            badgeCount++;
    }
    if (GetConfig(CONFIG_MISSING_BADGE_CATCH_MALUS) == GEN_8 && badgeCount < NUM_BADGES && gBattleMons[playerBattler].level < battleMon->level)
        odds = odds * 410 / 4096;
    if (GetConfig(CONFIG_MISSING_BADGE_CATCH_MALUS) == GEN_9 && badgeCount < NUM_BADGES)
    {
        for (u32 i = badgeCount; i < NUM_BADGES && battleMon->level > sBadgeLevel[i]; i++)
            odds = odds * 4 / 5;
    }

    if (GetConfig(CONFIG_LOW_LEVEL_CATCH_BONUS) == GEN_8 && battleMon->level <= 20)
         odds = odds * (30 - battleMon->level) / 10;
    else if (GetConfig(CONFIG_LOW_LEVEL_CATCH_BONUS) >= GEN_9 && battleMon->level <= 13)
        odds = odds * (36 - (battleMon->level * 2)) / 10;

    if (battleMon->status1 & STATUS1_INCAPACITATED)
    {
        if (GetConfig(CONFIG_INCAPACITATED_CATCH_BONUS) >= GEN_5)
            odds = (odds * 25) / 10;
        else
            odds *= 2;
    }
    if (battleMon->status1 & STATUS1_CAN_MOVE)
        odds = odds * 15 / 10;

    return odds;
}

static bool32 CriticalCapture(u32 odds)
{
    u32 numCaught;
    u32 totalDexCount;
    u32 charmBoost = 1;

    if (B_CRITICAL_CAPTURE == FALSE)
        return FALSE;

    if (B_CRITICAL_CAPTURE_LOCAL_DEX == TRUE)
        totalDexCount = KANTO_DEX_COUNT;
    else
        totalDexCount = NATIONAL_DEX_COUNT;

    if (CheckBagHasItem(ITEM_CATCHING_CHARM, 1))
        charmBoost = (100 + B_CATCHING_CHARM_BOOST) / 100;

    numCaught = GetNationalPokedexCount(FLAG_GET_CAUGHT);
    if (numCaught > (totalDexCount * 600) / 650)
        odds = (odds * (250 * charmBoost)) / 100;
    else if (numCaught > (totalDexCount * 450) / 650)
        odds = (odds * (200 * charmBoost)) / 100;
    else if (numCaught > (totalDexCount * 300) / 650)
        odds = (odds * (150 * charmBoost)) / 100;
    else if (numCaught > (totalDexCount * 150) / 650)
        odds = (odds * (100 * charmBoost)) / 100;
    else if (numCaught > (totalDexCount * 30) / 650)
        odds = (odds * (50 * charmBoost)) / 100;
    else
        return FALSE;

    if (odds > 255)
        odds = 255;

    odds /= 6;
    if (RandomUniform(RNG_BALLTHROW_CRITICAL, 0, MAX_u8) < odds)
        return TRUE;

    return FALSE;
}

static u32 ComputeBallShakeOdds(u32 odds)
{
    odds = Sqrt(Sqrt(16711680 / odds));
    odds = 1048560 / odds;
    return odds;
}

static void Cmd_handleballthrow(void)
{
    CMD_ARGS();

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
    else if (gBattleTypeFlags & BATTLE_TYPE_CATCH_TUTORIAL)
    {
        BtlController_EmitBallThrowAnim(gBattlerAttacker, B_COMM_TO_CONTROLLER, BALL_3_SHAKES_SUCCESS);
        MarkBattlerForControllerExec(gBattlerAttacker);
        gBattlescriptCurrInstr = BattleScript_WallyBallThrow;
    }
    else
    {
        gBallToDisplay = gLastThrownBall = gLastUsedItem;
        u32 odds = ComputeCaptureOdds(gBattlerTarget, gBattlerAttacker);
        if (gTestRunnerEnabled)
            TestRunner_Battle_RecordCatchChance(odds);

        u32 ballId = ItemIdToBallId(gLastUsedItem);
        if (gBattleResults.catchAttempts[ballId] < 255)
            gBattleResults.catchAttempts[ballId]++;

        //Master Ball check occurs before critical capture check
        if (odds == CAPTURE_GUARANTEED)
        {
            FinalizeCapture();
            return;
        }

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

        if (odds > 254)
        {
            FinalizeCapture();
            return;
        }
        odds = ComputeBallShakeOdds(odds);
        for (shakes = 0; shakes < maxShakes; shakes++)
        {
            if (RandomUniform(RNG_BALLTHROW_SHAKE, 0, MAX_u16) >= odds)
                break;
        }

        if (shakes == maxShakes) // mon caught, copy of the code above
        {
            if (IsCriticalCapture())
                gBattleSpritesDataPtr->animationData->criticalCaptureSuccess = TRUE;
            FinalizeCapture();
            return;
        }

        if (!gHasFetchedBall)
            gLastUsedBall = gLastUsedItem;

        if (IsCriticalCapture())
            gBattleCommunication[MULTISTRING_CHOOSER] = BALL_3_SHAKES_FAIL;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = shakes;

        BtlController_EmitBallThrowAnim(gBattlerAttacker, B_COMM_TO_CONTROLLER, shakes);
        MarkBattlerForControllerExec(gBattlerAttacker);
        gBattlescriptCurrInstr = BattleScript_ShakeBallThrow;
    }
}

static void Cmd_givecaughtmon(void)
{
    CMD_ARGS(const u8 *passInstr);
    enum GiveCaughtMonStates state = gBattleCommunication[MULTIUSE_STATE];
    // Restore players party in order to handle properly the case when a wild mon is caught.
    if (IsNPCFollowerWildBattle())
        LoadPlayerParty();

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
            BtlController_EmitChoosePokemon(gBattlerAttacker, B_COMM_TO_CONTROLLER, PARTY_ACTION_SEND_MON_TO_BOX, PARTY_SIZE, ABILITY_NONE, 0, gBattleStruct->battlerPartyOrders[gBattlerAttacker]);
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
                //Before sending to PC, we revert battle form
                TryRevertPartyMonFormChange(gSelectedMonPartyId);
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
    {
        struct Pokemon *caughtMon = GetBattlerMon(GetCatchingBattler());
        if (B_RESTORE_HELD_BATTLE_ITEMS >= GEN_9)
        {
            u16 lostItem = gBattleStruct->itemLost[B_SIDE_OPPONENT][gBattlerPartyIndexes[GetCatchingBattler()]].originalItem;
            if (lostItem != ITEM_NONE && GetItemPocket(lostItem) != POCKET_BERRIES)
                SetMonData(caughtMon, MON_DATA_HELD_ITEM, &lostItem);  // Restore non-berry items
        }

        if (GiveCapturedMonToPlayer(caughtMon) != MON_GIVEN_TO_PARTY
         && gBattleCommunication[MULTISTRING_CHOOSER] != B_MSG_SWAPPED_INTO_PARTY)
        {
            if (!ShouldShowBoxWasFullMessage())
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SENT_SOMEONES_PC;
                StringCopy(gStringVar1, GetBoxNamePtr(VarGet(VAR_PC_BOX_TO_SEND_MON)));
                GetMonData(caughtMon, MON_DATA_NICKNAME, gStringVar2);
            }
            else
            {
                StringCopy(gStringVar1, GetBoxNamePtr(VarGet(VAR_PC_BOX_TO_SEND_MON))); // box the mon was sent to
                GetMonData(caughtMon, MON_DATA_NICKNAME, gStringVar2);
                StringCopy(gStringVar3, GetBoxNamePtr(GetPCBoxToSendMon())); //box the mon was going to be sent to
                gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_SOMEONES_BOX_FULL;
            }

            // Change to B_MSG_SENT_LANETTES_PC or B_MSG_LANETTES_BOX_FULL
            if (FlagGet(FLAG_SYS_NOT_SOMEONES_PC))
                gBattleCommunication[MULTISTRING_CHOOSER]++;
        }

        gBattleResults.caughtMonSpecies = GetMonData(caughtMon, MON_DATA_SPECIES);
        GetMonData(caughtMon, MON_DATA_NICKNAME, gBattleResults.caughtMonNick);
        gBattleResults.caughtMonBall = GetMonData(caughtMon, MON_DATA_POKEBALL);

        gSelectedMonPartyId = PARTY_SIZE;
        gBattleCommunication[MULTIUSE_STATE] = 0;

        if (gBattleCommunication[MULTISTRING_CHOOSER] == B_MSG_NO_MESSSAGE_SKIP)
            gBattlescriptCurrInstr = cmd->passInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
        break;
    }
    }
    // Save the player's party again to not interferes with RestorePartyAfterFollowerNPCBattle() called after battle.
    if (IsNPCFollowerWildBattle())
        SavePlayerParty();
}

static void Cmd_trysetcaughtmondexflags(void)
{
    CMD_ARGS(const u8 *failInstr);

    struct Pokemon *caughtMon = GetBattlerMon(GetCatchingBattler());
    u32 species = GetMonData(caughtMon, MON_DATA_SPECIES);
    u32 personality = GetMonData(caughtMon, MON_DATA_PERSONALITY);

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

    u32 caughtBattler = GetCatchingBattler();
    struct Pokemon *mon = GetBattlerMon(caughtBattler);
    u16 species = GetMonData(mon, MON_DATA_SPECIES);

    switch (gBattleCommunication[0])
    {
    case 0:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        ClearTemporarySpeciesSpriteData(caughtBattler, FALSE, FALSE);
        BattleLoadMonSpriteGfx(mon, caughtBattler);
        gBattleCommunication[0]++;
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            FreeAllWindowBuffers();
            gBattleCommunication[TASK_ID] = DisplayCaughtMonDexPage(species,
                                                                    GetMonData(mon, MON_DATA_IS_SHINY),
                                                                    GetMonData(mon, MON_DATA_PERSONALITY));
            gBattleCommunication[0]++;
        }
        break;
    case 2:
        if (!gPaletteFade.active
            && gMain.callback2 == BattleMainCB2
            && !gTasks[gBattleCommunication[TASK_ID]].isActive)
        {
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
            BeginNormalPaletteFade(PALETTES_BG, 0, 16, 0, RGB_BLACK);
            ShowBg(0);
            ShowBg(3);
            gBattleCommunication[0]++;
        }
        break;
    case 5:
        if (!gPaletteFade.active)
        {
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
            struct Pokemon *caughtMon = GetBattlerMon(gBattlerTarget);
            GetMonData(caughtMon, MON_DATA_NICKNAME, gBattleStruct->caughtMonNick);
            FreeAllWindowBuffers();
            MainCallback callback = CalculatePlayerPartyCount() == PARTY_SIZE ? ReshowBlankBattleScreenAfterMenu : BattleMainCB2;

            DoNamingScreen(NAMING_SCREEN_CAUGHT_MON, gBattleStruct->caughtMonNick,
                           GetMonData(caughtMon, MON_DATA_SPECIES),
                           GetMonGender(caughtMon),
                           GetMonData(caughtMon, MON_DATA_PERSONALITY),
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

static void Cmd_sortbattlers(void)
{
    CMD_ARGS();
    if (!gBattleStruct->battlersSorted)
    {
        for (u32 i = 0; i < gBattlersCount; i++)
            gBattlersBySpeed[i] = i;

        SortBattlersBySpeed(gBattlersBySpeed, FALSE);
    }
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

    if (gBattleMons[gBattlerTarget].volatiles.telekinesis
        || gBattleMons[gBattlerTarget].volatiles.root
        || gBattleMons[gBattlerTarget].volatiles.smackDown
        || gFieldStatuses & STATUS_FIELD_GRAVITY
        || IsTelekinesisBannedSpecies(gBattleMons[gBattlerTarget].species))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gBattleMons[gBattlerTarget].volatiles.telekinesis = TRUE;
        gBattleMons[gBattlerTarget].volatiles.telekinesisTimer = B_TELEKINESIS_TIMER;
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

static u16 *GetBattlerStat(struct BattlePokemon *battler, enum Stat stat)
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
    CMD_ARGS(u8 trigger);

    switch (cmd->trigger)
    {
    case TRIGGER_ON_ABILITY:
        if (gBattleScripting.moveEffect >= MOVE_EFFECT_CONFUSION)
            SetMoveEffect(gBattleScripting.battler, gEffectBattler, gBattleScripting.moveEffect, cmd->nextInstr, EFFECT_PRIMARY);
        else
            SetNonVolatileStatus(gEffectBattler, gBattleScripting.moveEffect, cmd->nextInstr, TRIGGER_ON_ABILITY);
        break;
    case TRIGGER_ON_MOVE:
        SetNonVolatileStatus(gBattlerTarget, GetMoveNonVolatileStatus(gCurrentMove), cmd->nextInstr, TRIGGER_ON_MOVE);
        break;
    case TRIGGER_ON_PROTECT:
        SetNonVolatileStatus(gBattlerAttacker, gBattleScripting.moveEffect, cmd->nextInstr, TRIGGER_ON_PROTECT);
        break;
    }
}

static void Cmd_tryoverwriteability(void)
{
    CMD_ARGS(const u8 *failInstr);

    if (gAbilitiesInfo[gBattleMons[gBattlerTarget].ability].cantBeOverwritten
     || gBattleMons[gBattlerTarget].ability == GetMoveOverwriteAbility(gCurrentMove))
    {
        RecordAbilityBattle(gBattlerTarget, gBattleMons[gBattlerTarget].ability);
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (CanAbilityShieldActivateForBattler(gBattlerTarget))
    {
        gBattlescriptCurrInstr = BattleScript_MoveEnd;
        BattleScriptCall(BattleScript_AbilityShieldProtects);
    }
    else
    {
        if (gBattleMons[gBattlerTarget].volatiles.neutralizingGas)
            gSpecialStatuses[gBattlerTarget].neutralizingGasRemoved = TRUE;

        RemoveAbilityFlags(gBattlerTarget);
        gBattleScripting.abilityPopupOverwrite = gBattleMons[gBattlerTarget].ability;
        gBattleMons[gBattlerTarget].ability = gBattleMons[gBattlerTarget].volatiles.overwrittenAbility = GetMoveOverwriteAbility(gCurrentMove);
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
    assertf(gBattleStruct->savedTargetCount < ARRAY_COUNT(gBattleStruct->savedBattlerTarget), "Too many savedBattlerTargets")
    {
        return;
    }

    gBattleStruct->savedBattlerTarget[gBattleStruct->savedTargetCount++] = battler;
}

void SaveBattlerAttacker(u32 battler)
{
    assertf(gBattleStruct->savedAttackerCount < ARRAY_COUNT(gBattleStruct->savedBattlerAttacker), "Too many savedBattlerAttackers")
    {
        return;
    }

    gBattleStruct->savedBattlerAttacker[gBattleStruct->savedAttackerCount++] = battler;
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
    assertf(gBattleStruct->savedTargetCount > 0, "No savedBattlerTargets")
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }

    gBattleStruct->savedTargetCount--;
    gBattlerTarget = gBattleStruct->savedBattlerTarget[gBattleStruct->savedTargetCount];

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
    assertf(gBattleStruct->savedAttackerCount > 0, "No savedBattlerAttackers")
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }

    gBattleStruct->savedAttackerCount--;
    gBattlerAttacker = gBattleStruct->savedBattlerAttacker[gBattleStruct->savedAttackerCount];
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
    if (gBattleMons[battler].volatiles.stockpileDef != 0)
    {
        SET_STATCHANGER(STAT_DEF, abs(gBattleMons[battler].volatiles.stockpileDef), TRUE);
        gBattleMons[battler].volatiles.stockpileDef = 0;
        BattleScriptCall(cmd->statChangeInstr);
    }
    else if (gBattleMons[battler].volatiles.stockpileSpDef)
    {
        SET_STATCHANGER(STAT_SPDEF, abs(gBattleMons[battler].volatiles.stockpileSpDef), TRUE);
        gBattleMons[battler].volatiles.stockpileSpDef = 0;
        BattleScriptCall(cmd->statChangeInstr);
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

static bool32 IsFinalStrikeEffect(enum MoveEffect moveEffect)
{
    switch (moveEffect)
    {
    case MOVE_EFFECT_REMOVE_ARG_TYPE:
    case MOVE_EFFECT_REMOVE_STATUS:
    case MOVE_EFFECT_RECOIL_HP_25:
    case MOVE_EFFECT_PREVENT_ESCAPE:
    case MOVE_EFFECT_WRAP:
        return TRUE;
    default:
        return FALSE;
    }
}

static bool32 CanAbilityPreventStatLoss(enum Ability abilityDef)
{
    switch (abilityDef)
    {
    case ABILITY_CLEAR_BODY:
    case ABILITY_FULL_METAL_BODY:
    case ABILITY_WHITE_SMOKE:
        return TRUE;
    default:
        break;
    }
    return FALSE;
}

bool32 CanBurnHitThaw(enum Move move)
{
    u8 i;

    if (GetConfig(CONFIG_BURN_HIT_THAW) >= GEN_6)
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
    NATIVE_ARGS(const u8 *jumpInstr);
    enum Item item = gBattleMons[gBattlerTarget].item;

    if (item == ITEM_NONE || !CanBattlerGetOrLoseItem(gBattlerTarget, gBattlerAttacker, item))
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
        BattleScriptCall(BattleScript_SymbiosisActivates);
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

        // Get battlers after attacker using round
        for (i = currRounder; i < gBattlersCount; i++)
        {
            if (gChosenMoveByBattler[gBattlerByTurnOrder[i]] == MOVE_ROUND)
                roundUsers[j++] = gBattlerByTurnOrder[i];
            else
                nonRoundUsers[k++] = gBattlerByTurnOrder[i];
        }

        // update turn order for round users
        for (i = 0; i < 3 && roundUsers[i] != 0xFF; i++)
        {
            gBattlerByTurnOrder[currRounder] = roundUsers[i];
            gProtectStructs[roundUsers[i]].quash = TRUE; // Make it so their turn order can't be changed again
            currRounder++;
        }

        // Update turn order for non-round users
        for (i = 0; i < 3 && nonRoundUsers[i] != 0xFF; i++)
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
    enum HoldEffect holdEffect = GetMonHoldEffect(&gPlayerParty[expGetterMonId]);

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
            gBattleStruct->passiveHpUpdate[battler] = -healAmount;
            gBattlescriptCurrInstr = cmd->restoreBattlerInstr;
        }
        else
        {
            hp += healAmount;
            SetMonData(&party[gBattleStruct->itemPartyIndex[gBattlerAttacker]], MON_DATA_HP, &hp);

            u32 partner = BATTLE_PARTNER(gBattlerAttacker);
            // Absent battlers on the field need to be replaced
            if (IsDoubleBattle() && (gAbsentBattlerFlags & (1u << partner)))
            {
                gAbsentBattlerFlags &= ~(1u << partner);
                gBattleCommunication[MULTIUSE_STATE] = TRUE;
                gBattleScripting.battler = partner;
                BtlController_EmitChosenMonReturnValue(partner, B_COMM_TO_ENGINE, gBattleStruct->itemPartyIndex[gBattlerAttacker], NULL);
            }
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
    }
}

void BS_ItemCureStatus(void)
{
    NATIVE_ARGS(const u8 *noStatusInstr, const u8 *restoreBattlerInstr);
    u32 targetBattler = MAX_BATTLERS_COUNT;
    bool32 statusChanged = FALSE;
    struct Pokemon *party = GetBattlerParty(gBattlerAttacker);

    // Heal volatile conditions if battler is active.
    if (gBattleStruct->itemPartyIndex[gBattlerAttacker] == gBattlerPartyIndexes[gBattlerAttacker])
    {
        statusChanged = ItemHealMonVolatile(gBattlerAttacker, gLastUsedItem);
        targetBattler = gBattlerAttacker;
    }
    else if (IsDoubleBattle()
     && gBattleStruct->itemPartyIndex[gBattlerAttacker] == gBattlerPartyIndexes[BATTLE_PARTNER(gBattlerAttacker)])
    {
        statusChanged = ItemHealMonVolatile(BATTLE_PARTNER(gBattlerAttacker), gLastUsedItem);
        targetBattler = BATTLE_PARTNER(gBattlerAttacker);
    }

    // Heal Status1 conditions.
    if (!HealStatusConditions(&party[gBattleStruct->itemPartyIndex[gBattlerAttacker]], GetItemStatus1Mask(gLastUsedItem), targetBattler))
    {
        statusChanged = TRUE;
        if (GetItemStatus1Mask(gLastUsedItem) & STATUS1_SLEEP)
            gBattleMons[targetBattler].volatiles.nightmare = FALSE;
    }

    if (!statusChanged)
    {
        gBattlescriptCurrInstr = cmd->noStatusInstr;
        return;
    }

    PREPARE_SPECIES_BUFFER(gBattleTextBuff1, GetMonData(&party[gBattleStruct->itemPartyIndex[gBattlerAttacker]], MON_DATA_SPECIES));
    if (targetBattler == MAX_BATTLERS_COUNT)
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattleScripting.battler = targetBattler;
        gBattlescriptCurrInstr = cmd->restoreBattlerInstr;
    }
}

void BS_ItemIncreaseStat(void)
{
    NATIVE_ARGS();

    if (GetItemBattleUsage(gLastUsedItem) == EFFECT_ITEM_INCREASE_STAT)
    {
        u16 statId = GetItemEffect(gLastUsedItem)[1];
        u16 stages = GetItemHoldEffectParam(gLastUsedItem);
        SET_STATCHANGER(statId, stages, FALSE);
    } // else EFFECT_ITEM_INCREASE_ALL_STATS or EFFECT_ITEM_SET_FOCUS_ENERGY

    if (gBattlerPartyIndexes[gBattlerAttacker] != gBattleStruct->itemPartyIndex[gBattlerAttacker])
        gBattlerAttacker = BATTLE_PARTNER(gBattlerAttacker);

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
        pp = GetMonData(mon, MON_DATA_PP1 + i);
        moveId = GetMonData(mon, MON_DATA_MOVE1 + i);
        maxPP = CalculatePPWithBonus(moveId, GetMonData(mon, MON_DATA_PP_BONUSES), i);
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
    if (IsBattlerAlive(gBattlerTarget) && TryBattleFormChange(gBattlerTarget, FORM_CHANGE_BATTLE_WEATHER))
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

void BS_SetTerrain(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);
    u32 statusFlag = 0;

    switch (GetMoveEffect(gCurrentMove))
    {
    case EFFECT_MISTY_TERRAIN:
        if (!(gFieldStatuses & STATUS_FIELD_MISTY_TERRAIN))
        {
            statusFlag = STATUS_FIELD_MISTY_TERRAIN;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_SET_MISTY;
        }
        break;
    case EFFECT_GRASSY_TERRAIN:
        if (!(gFieldStatuses & STATUS_FIELD_GRASSY_TERRAIN))
        {
            statusFlag = STATUS_FIELD_GRASSY_TERRAIN;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_SET_GRASSY;
        }
        break;
    case EFFECT_ELECTRIC_TERRAIN:
        if (!(gFieldStatuses & STATUS_FIELD_ELECTRIC_TERRAIN))
        {
            statusFlag = STATUS_FIELD_ELECTRIC_TERRAIN;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_SET_ELECTRIC;
        }
        break;
    case EFFECT_PSYCHIC_TERRAIN:
        if (!(gFieldStatuses & STATUS_FIELD_PSYCHIC_TERRAIN))
        {
            statusFlag = STATUS_FIELD_PSYCHIC_TERRAIN;
            gBattleCommunication[MULTISTRING_CHOOSER] = B_MSG_TERRAIN_SET_PSYCHIC;
        }
        break;
    default:
        break;
    }
    if (gBattleStruct->isSkyBattle)
    {
        gBattlescriptCurrInstr = cmd->jumpInstr;
    }
    else if (statusFlag)
    {
        TryChangeBattleTerrain(gBattlerAttacker, statusFlag);
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->jumpInstr;
    }
}

void BS_JumpIfTerrainAffected(void)
{
    NATIVE_ARGS(u8 battler, u32 flags, const u8 *jumpInstr);
    u32 battler = GetBattlerForBattleScript(cmd->battler);

    if (IsBattlerTerrainAffected(battler, GetBattlerAbility(battler), GetBattlerHoldEffect(battler), gFieldStatuses, cmd->flags))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryReflectType(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    u16 targetBaseSpecies = GET_BASE_SPECIES_ID(gBattleMons[gBattlerTarget].species);
    enum Type targetTypes[3];
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
    NATIVE_ARGS(const u8 *failInstr);

    if (gBattleMons[gBattlerTarget].volatiles.octolock)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gBattleMons[gBattlerTarget].volatiles.octolock = TRUE;
        gBattleMons[gBattlerTarget].volatiles.octolockedBy = gBattlerAttacker;
        gBattleMons[gBattlerTarget].volatiles.escapePrevention = TRUE;
        gBattleMons[gBattlerTarget].volatiles.battlerPreventingEscape = gBattlerAttacker;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_SetPledge(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);

    u32 partner = BATTLE_PARTNER(gBattlerAttacker);
    u32 partnerMove = GetChosenMoveFromPosition(partner);
    u32 i = 0;
    u32 k = 0;

    if (gBattleStruct->pledgeMove && !gBattleStruct->unableToUseMove)
    {
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
          && !HasBattlerActedThisTurn(partner)
          && !gBattleStruct->unableToUseMove
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
    enum BattleSide side = GetBattlerSide(battler);

    gBattleStruct->pledgeMove = FALSE;
    if (!(gSideStatuses[side] & cmd->sideStatus))
    {
        gSideStatuses[side] |= cmd->sideStatus;

        switch (cmd->sideStatus)
        {
        case SIDE_STATUS_RAINBOW:
            gSideTimers[side].rainbowTimer = 4;
            break;
        case SIDE_STATUS_SEA_OF_FIRE:
            gSideTimers[side].seaOfFireTimer = 4;
            break;
        case SIDE_STATUS_SWAMP:
            gSideTimers[side].swampTimer = 4;
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

        switch(gBattlerAttacker)
        {
        case B_POSITION_OPPONENT_LEFT:
            gBattlescriptCurrInstr = BattleScript_TrainerASlideMsgRet;
            break;
        case B_POSITION_PLAYER_RIGHT:
            gBattlescriptCurrInstr = BattleScript_TrainerPartnerSlideMsgRet;
            break;
        case B_POSITION_OPPONENT_RIGHT:
            gBattlescriptCurrInstr = BattleScript_TrainerBSlideMsgRet;
            break;
        default:
            break;
        }
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

        switch(gBattlerAttacker)
        {
        case B_POSITION_OPPONENT_LEFT:
            gBattlescriptCurrInstr = BattleScript_TrainerASlideMsgRet;
            break;
        case B_POSITION_PLAYER_RIGHT:
            gBattlescriptCurrInstr = BattleScript_TrainerPartnerSlideMsgRet;
            break;
        case B_POSITION_OPPONENT_RIGHT:
            gBattlescriptCurrInstr = BattleScript_TrainerBSlideMsgRet;
            break;
        default:
            break;
        }
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

        switch(gBattleScripting.battler)
        {
        case B_POSITION_OPPONENT_LEFT:
            gBattlescriptCurrInstr = BattleScript_TrainerASlideMsgRet;
            break;
        case B_POSITION_PLAYER_RIGHT:
            gBattlescriptCurrInstr = BattleScript_TrainerPartnerSlideMsgRet;
            break;
        case B_POSITION_OPPONENT_RIGHT:
            gBattlescriptCurrInstr = BattleScript_TrainerBSlideMsgRet;
            break;
        default:
            break;
        }
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
        s32 healAmount = 0;
        if (GetBattlerAbility(gBattlerAttacker) == ABILITY_MEGA_LAUNCHER && IsPulseMove(gCurrentMove))
            healAmount = GetNonDynamaxMaxHP(gBattlerTarget) * 75 / 100;
        else if (gFieldStatuses & STATUS_FIELD_GRASSY_TERRAIN && GetMoveEffectArg_MoveProperty(gCurrentMove) == MOVE_EFFECT_FLORAL_HEALING)
            healAmount = GetNonDynamaxMaxHP(gBattlerTarget) * 2 / 3;
        else
            healAmount = GetNonDynamaxMaxHP(gBattlerTarget) / 2;

        SetHealAmount(gBattlerTarget, healAmount);
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

void BS_TryAllySwitch(void)
{
    NATIVE_ARGS(const u8 *failInstr);

    if (!IsBattlerAlive(BATTLE_PARTNER(gBattlerAttacker)) || HasPartnerTrainer(gBattlerAttacker))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (GetConfig(CONFIG_ALLY_SWITCH_FAIL_CHANCE) >= GEN_9)
    {
        TryResetConsecutiveUseCounter(gBattlerAttacker);

        if (CanUseMoveConsecutively(gBattlerAttacker))
        {
            gBattleMons[gBattlerAttacker].volatiles.consecutiveMoveUses++;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
        else
        {
            gBattleMons[gBattlerAttacker].volatiles.consecutiveMoveUses = 0;
            gBattlescriptCurrInstr = cmd->failInstr;
        }
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
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
     && GetBattlerAbility(gBattlerAttacker) == ABILITY_GULP_MISSILE
     && TryBattleFormChange(gBattlerAttacker, FORM_CHANGE_BATTLE_HP_PERCENT))
    {
        gBattleScripting.battler = gBattlerAttacker;
        gBattlescriptCurrInstr = BattleScript_GulpMissileFormChange;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_TryActivateGulpMissile(void)
{
    NATIVE_ARGS();

    if (!gBattleStruct->unableToUseMove
        && IsBattlerAlive(gBattlerAttacker)
        && IsBattlerTurnDamaged(gBattlerTarget)
        && gBattleMons[gBattlerTarget].species != SPECIES_CRAMORANT
        && GetBattlerAbility(gBattlerTarget) == ABILITY_GULP_MISSILE)
    {
        if (!IsAbilityAndRecord(gBattlerAttacker, GetBattlerAbility(gBattlerAttacker), ABILITY_MAGIC_GUARD))
            SetPassiveDamageAmount(gBattlerTarget, GetNonDynamaxMaxHP(gBattlerAttacker) / 4);

        switch(gBattleMons[gBattlerTarget].species)
        {
            case SPECIES_CRAMORANT_GORGING:
                TryBattleFormChange(gBattlerTarget, FORM_CHANGE_HIT_BY_MOVE);
                BattleScriptCall(BattleScript_GulpMissileGorging);
                return;
            case SPECIES_CRAMORANT_GULPING:
                TryBattleFormChange(gBattlerTarget, FORM_CHANGE_HIT_BY_MOVE);
                BattleScriptCall(BattleScript_GulpMissileGulping);
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
    if (HasBattlerActedThisTurn(gBattlerTarget))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
        return;
    }

    // If the above condition is not true, it means we are faster than the foe, so we can set the quash bit
    gProtectStructs[gBattlerTarget].quash = TRUE;

    struct BattleCalcValues calcValues = {0};
    for (i = 0; i < gBattlersCount; i++)
    {
        calcValues.abilities[i] = GetBattlerAbility(i);
        calcValues.holdEffects[i] = GetBattlerHoldEffect(i);
    }
    // this implementation assumes turn order is correct when using Quash
    i = GetBattlerTurnOrderNum(gBattlerTarget);
    for (j = i + 1; j < gBattlersCount; j++)
    {
        calcValues.battlerAtk = gBattlerByTurnOrder[i];
        calcValues.battlerDef = gBattlerByTurnOrder[j];

        // Gen 7- config makes target go last so that the order of quash targets is kept for the correct turn order
        // Gen 8+ config alters Turn Order of the target according to speed, dynamic speed should handle the rest
        if (B_QUASH_TURN_ORDER < GEN_8 || GetWhichBattlerFaster(&calcValues, FALSE) == -1)
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
    if (gBattleMons[gBattlerTarget].volatiles.tarShot || GetActiveGimmick(gBattlerTarget) == GIMMICK_TERA)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gBattleMons[gBattlerTarget].volatiles.tarShot = TRUE;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_CanTarShotWork(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    // Tar Shot fails if the target can't be made weaker to fire and it's speed can't be lowered further
    if (!(gBattleMons[gBattlerTarget].volatiles.tarShot || GetActiveGimmick(gBattlerTarget) == GIMMICK_TERA)
     || CompareStat(gBattlerTarget, STAT_SPEED, MAX_STAT_STAGE, CMP_LESS_THAN, GetBattlerAbility(gBattlerTarget)))
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
    DetermineTarget(GetBattlerMoveTargetType(gBattlerAttacker, gCurrentMove), FALSE);
    ClearDamageCalcResults();
    gBattleStruct->eventState.atkCanceler = CANCELER_TARGET_FAILURE;
    gBattleStruct->eventState.atkCancelerBattler = 0;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfNoBerry(void)
{
    NATIVE_ARGS(u8 battler, const u8 *jumpInstr);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    if (GetItemPocket(gBattleMons[battler].item) == POCKET_BERRIES)
        gBattlescriptCurrInstr = cmd->nextInstr;
    else
        gBattlescriptCurrInstr = cmd->jumpInstr;
}

static bool32 IsTeatimeAffected(u32 battler)
{
    if (GetItemPocket(gBattleMons[battler].item) != POCKET_BERRIES)
        return FALSE;   // Only berries
    if (IsSemiInvulnerable(battler, CHECK_ALL))
        return FALSE;   // Teatime doesn't affected semi-invulnerable battlers
    return TRUE;
}

void BS_CheckTeaTimeTargets(void)
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
    enum Ability ability = GetBattlerAbility(battler);
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
    AbilityBattleEffects(ABILITYEFFECT_ON_WEATHER, battler, GetBattlerAbility(battler), MOVE_NONE, TRUE);
}

void BS_ActivateTerrainChangeAbilities(void)
{
    NATIVE_ARGS(u8 battler);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    gBattlescriptCurrInstr = cmd->nextInstr;
    AbilityBattleEffects(ABILITYEFFECT_ON_TERRAIN, battler, GetBattlerAbility(battler), MOVE_NONE, TRUE);
}

void BS_ResetTerrainAbilityFlags(void)
{
    NATIVE_ARGS();
    // reset terrain ability checks
    for (u32 i = 0; i < gBattlersCount; i++)
        gBattleMons[i].volatiles.terrainAbilityDone = 0;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_StoreHealingWish(void)
{
    NATIVE_ARGS(u8 battler);

    u32 battler = GetBattlerForBattleScript(cmd->battler);
    if (GetMoveEffect(gCurrentMove) == EFFECT_LUNAR_DANCE)
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
        BtlController_EmitChoosePokemon(gBattlerAttacker, B_COMM_TO_CONTROLLER, PARTY_ACTION_CHOOSE_FAINTED_MON, PARTY_SIZE, ABILITY_NONE, 0, gBattleStruct->battlerPartyOrders[gBattlerAttacker]);
        MarkBattlerForControllerExec(gBattlerAttacker);
    }
}

void BS_JumpIfCommanderActive(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);

    if (gBattleStruct->battlerState[gBattlerTarget].commanderSpecies != SPECIES_NONE)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else if (gBattleMons[gBattlerTarget].volatiles.semiInvulnerable == STATE_COMMANDER)
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
            gBattleMons[i].volatiles.nightmare = FALSE;
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

void BS_RemoveTerrain(void)
{
    NATIVE_ARGS();
    RemoveAllTerrains();
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SpectralThiefPrintStats(void)
{
    NATIVE_ARGS();

    for (enum Stat stat = STAT_ATK; stat < NUM_BATTLE_STATS; stat++)
    {
        if (gBattleStruct->stolenStats[0] & (1u << stat))
        {
            gBattleStruct->stolenStats[0] &= ~(1u << stat);
            SET_STATCHANGER(stat, gBattleStruct->stolenStats[stat], FALSE);
            if (ChangeStatBuffs(
                    gBattlerAttacker,
                    GET_STAT_BUFF_VALUE_WITH_SIGN(gBattleScripting.statChanger),
                    stat,
                    STAT_CHANGE_CERTAIN,
                    0, NULL) == STAT_CHANGE_WORKED)
            {
                BattleScriptCall(BattleScript_StatUp);
                return;
            }
        }
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SetMoveResultFlags(void)
{
    NATIVE_ARGS(u16 value);
    gBattleStruct->moveResultFlags[gBattlerTarget] = cmd->value;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_ClearMoveResultFlags(void)
{
    NATIVE_ARGS(u16 value);
    gBattleStruct->moveResultFlags[gBattlerTarget] &= ~(cmd->value);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_ClearSpecialStatuses(void)
{
    NATIVE_ARGS();
    memset(&gSpecialStatuses, 0, sizeof(gSpecialStatuses));
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

void BS_JumpIfNotCriticalHit(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);

    if (!gSpecialStatuses[gBattlerTarget].criticalHit)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SwapStats(void)
{
    NATIVE_ARGS(u8 stat);

    enum Stat stat = cmd->stat;
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
    default:
        break;
    }
    PREPARE_STAT_BUFFER(gBattleTextBuff1, stat);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void TrySetParalysis(const u8 *nextInstr, const u8 *failInstr)
{
    if (CanBeParalyzed(gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerTarget)))
        SetNonVolatileStatus(gBattlerTarget, MOVE_EFFECT_PARALYSIS, nextInstr, TRIGGER_ON_MOVE);
    else
        gBattlescriptCurrInstr = failInstr;
}

static void TrySetPoison(const u8 *nextInstr, const u8 *failInstr)
{
    if (CanBePoisoned(gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerAttacker), GetBattlerAbility(gBattlerTarget)))
        SetNonVolatileStatus(gBattlerTarget, MOVE_EFFECT_POISON, nextInstr, TRIGGER_ON_MOVE);
    else
        gBattlescriptCurrInstr = failInstr;
}

static void TrySetSleep(const u8 *nextInstr, const u8 *failInstr)
{
    if (CanBeSlept(gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerTarget), BLOCKED_BY_SLEEP_CLAUSE))
        SetNonVolatileStatus(gBattlerTarget, MOVE_EFFECT_SLEEP, nextInstr, TRIGGER_ON_MOVE);
    else
        gBattlescriptCurrInstr = failInstr;
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
        gBattleMons[gBattlerTarget].volatiles.confusionTurns = RandomUniform(RNG_CONFUSION_TURNS, 2, B_CONFUSION_TURNS); // 2-5 turns
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

    if (!gBattleMons[gBattlerTarget].volatiles.infatuation
        && gBattleMons[gBattlerTarget].ability != ABILITY_OBLIVIOUS
        && !IsAbilityOnSide(gBattlerTarget, ABILITY_AROMA_VEIL)
        && AreBattlersOfOppositeGender(gBattlerAttacker, gBattlerTarget))
    {
        gBattleMons[gBattlerTarget].volatiles.infatuation = INFATUATED_WITH(gBattlerAttacker);
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

    if (!gBattleMons[gBattlerTarget].volatiles.escapePrevention)
    {
        gBattleMons[gBattlerTarget].volatiles.escapePrevention = TRUE;
        gBattleMons[gBattlerTarget].volatiles.battlerPreventingEscape = gBattlerAttacker;
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

    if (!(gBattleMons[gBattlerTarget].volatiles.torment == TRUE)
     && !IsAbilityOnSide(gBattlerTarget, ABILITY_AROMA_VEIL))
    {
        gBattleMons[gBattlerTarget].volatiles.torment = TRUE;
        gBattleMons[gBattlerTarget].volatiles.tormentTimer = B_TORMENT_TIMER;
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
    SetHealAmount(gBattlerTarget, gBattleMons[gBattlerTarget].maxHP / 6);
    if (gBattleMons[gBattlerTarget].hp == gBattleMons[gBattlerTarget].maxHP)
        gBattlescriptCurrInstr = cmd->failInstr;    // fail
    else
        gBattlescriptCurrInstr = cmd->nextInstr;    // can heal
}

// Recycles the target's item if it is specifically holding a berry.
void BS_TryRecycleBerry(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    u16 *usedHeldItem = &GetBattlerPartyState(gBattlerTarget)->usedHeldItem;
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
    if (IsHazardOnSide(targetSide, HAZARDS_STEELSURGE))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        PushHazardTypeToQueue(targetSide, HAZARDS_STEELSURGE);
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_JumpIfIntimidateAbilityPrevented(void)
{
    NATIVE_ARGS();

    bool32 hasAbility = FALSE;
    enum Ability ability = GetBattlerAbility(gBattlerTarget);

    switch (ability)
    {
    case ABILITY_INNER_FOCUS:
    case ABILITY_SCRAPPY:
    case ABILITY_OWN_TEMPO:
    case ABILITY_OBLIVIOUS:
        if (GetConfig(CONFIG_UPDATED_INTIMIDATE) >= GEN_8)
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

void BS_TryFlingHoldEffect(void)
{
    NATIVE_ARGS();
    enum HoldEffect holdEffect = GetItemHoldEffect(gBattleStruct->flingItem);

    if (GetItemPocket(gBattleStruct->flingItem) == POCKET_BERRIES)
    {
        gBattlescriptCurrInstr = BattleScript_EffectFlingConsumeBerry;
        return;
    }

    if (IsMoveEffectBlockedByTarget(GetBattlerAbility(gBattlerTarget)))
    {
        gBattlescriptCurrInstr = BattleScript_FlingBlockedByShieldDust;
        return;
    }

    switch (holdEffect)
    {
    case HOLD_EFFECT_FLAME_ORB:
        SetMoveEffect(gBattlerAttacker, gBattlerTarget, MOVE_EFFECT_BURN, cmd->nextInstr, NO_FLAGS);
        break;
    case HOLD_EFFECT_TOXIC_ORB:
        SetMoveEffect(gBattlerAttacker, gBattlerTarget, MOVE_EFFECT_TOXIC, cmd->nextInstr, NO_FLAGS);
        break;
    case HOLD_EFFECT_LIGHT_BALL:
        SetMoveEffect(gBattlerAttacker, gBattlerTarget, MOVE_EFFECT_PARALYSIS, cmd->nextInstr, NO_FLAGS);
        break;
    case HOLD_EFFECT_TYPE_POWER:
        if (GetItemSecondaryId(gBattleStruct->flingItem) != TYPE_POISON)
            gBattlescriptCurrInstr = cmd->nextInstr;
        else
            SetMoveEffect(gBattlerAttacker, gBattlerTarget, MOVE_EFFECT_POISON, cmd->nextInstr, NO_FLAGS);
        break;
    case HOLD_EFFECT_FLINCH:
        SetMoveEffect(gBattlerAttacker, gBattlerTarget, MOVE_EFFECT_FLINCH, cmd->nextInstr, NO_FLAGS);
        break;
    case HOLD_EFFECT_MENTAL_HERB:
        if (ItemBattleEffects(gBattlerTarget, 0, holdEffect, IsOnFlingActivation))
            return;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
        break;
    case HOLD_EFFECT_WHITE_HERB:
        if (ItemBattleEffects(gBattlerTarget, 0, holdEffect, IsOnFlingActivation))
            return;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
        break;
    default:
        gBattlescriptCurrInstr = cmd->nextInstr;
        break;
    }
}

void BS_JumpIfNoWhiteOut(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);

    if (FlagGet(B_FLAG_NO_WHITEOUT))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryBoosterEnergy(void)
{
    NATIVE_ARGS(u8 onFieldStatus);

    for (u32 orderNum = 0; orderNum < gBattlersCount; orderNum++)
    {
        u32 battler = gBattlerByTurnOrder[orderNum];
        enum HoldEffect holdEffect = GetBattlerHoldEffect(battler);
        if (holdEffect != HOLD_EFFECT_BOOSTER_ENERGY)
            continue;

        enum Ability ability = GetBattlerAbility(battler);
        if (!(ability == ABILITY_PROTOSYNTHESIS && cmd->onFieldStatus != ON_TERRAIN)
         && !(ability == ABILITY_QUARK_DRIVE && cmd->onFieldStatus != ON_WEATHER))
            continue;

        if (ItemBattleEffects(battler, 0, holdEffect, IsOnEffectActivation))
            return;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfAbilityCantBeReactivated(void)
{
    NATIVE_ARGS(u8 battler, const u8 *jumpInstr);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    u32 ability = gBattleMons[battler].ability;

    switch (ability)
    {
    case ABILITY_IMPOSTER:
    case ABILITY_NEUTRALIZING_GAS:
    case ABILITY_AIR_LOCK:
    case ABILITY_CLOUD_NINE:
        gBattlescriptCurrInstr = cmd->jumpInstr;
        break;
    default:
        if (gAbilitiesInfo[ability].cantBeSuppressed)
            gBattlescriptCurrInstr = cmd->jumpInstr;
        else
            gBattlescriptCurrInstr = cmd->nextInstr;
        break;
    }
}

void BS_TryActivateAbilityShield(void)
{
    NATIVE_ARGS(u8 battler);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    enum Ability ability = GetBattlerAbility(battler);

    gBattlescriptCurrInstr = cmd->nextInstr;

    if (ability != ABILITY_NONE // if ability would be negated by breaking effects Ability Shield doesn't print message
     && ability == GetBattlerAbilityInternal(battler, TRUE, TRUE))
        return;

    if (GetBattlerAbilityNoAbilityShield(battler) != ability)
    {
        gLastUsedItem = gBattleMons[battler].item;
        RecordItemEffectBattle(battler, GetItemHoldEffect(gLastUsedItem));
        BattleScriptCall(BattleScript_AbilityShieldProtects);
    }
}

void BS_JumpIfRoarFails(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);

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
}

void BS_JumpIfAbsent(void)
{
    NATIVE_ARGS(u8 battler, const u8 *jumpInstr);
    if (!IsBattlerAlive(GetBattlerForBattleScript(cmd->battler)))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfHoldEffect(void)
{
    NATIVE_ARGS(u8 battler, u8 holdEffect, const u8 *jumpInstr, u8 equal);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    if ((GetBattlerHoldEffect(battler) == cmd->holdEffect) == cmd->equal)
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
}

void BS_JumpIfNoAlly(void)
{
    NATIVE_ARGS(u8 battler, const u8 *jumpInstr);
    u32 partner = BATTLE_PARTNER(GetBattlerForBattleScript(cmd->battler));
    if (!IsBattlerAlive(partner))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SetLastUsedItem(void)
{
    NATIVE_ARGS(u8 battler);
    gLastUsedItem = gBattleMons[GetBattlerForBattleScript(cmd->battler)].item;
    gBattleStruct->flingItem = gLastUsedItem;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TrySetFairyLock(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    if (gFieldStatuses & STATUS_FIELD_FAIRY_LOCK)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gFieldStatuses |= STATUS_FIELD_FAIRY_LOCK;
        gFieldTimers.fairyLockTimer = 2;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_GetStatValue(void)
{
    NATIVE_ARGS(u8 stat);
    u32 stat = cmd->stat;
    switch (stat)
    {
    case STAT_ATK:
        gBattleStruct->passiveHpUpdate[gBattlerAttacker] = gBattleMons[gBattlerTarget].attack;
        break;
    case STAT_DEF:
        gBattleStruct->passiveHpUpdate[gBattlerAttacker] = gBattleMons[gBattlerTarget].defense;
        break;
    case STAT_SPATK:
        gBattleStruct->passiveHpUpdate[gBattlerAttacker] = gBattleMons[gBattlerTarget].spAttack;
        break;
    case STAT_SPDEF:
        gBattleStruct->passiveHpUpdate[gBattlerAttacker] = gBattleMons[gBattlerTarget].spDefense;
        break;
    case STAT_SPEED:
        gBattleStruct->passiveHpUpdate[gBattlerAttacker] = gBattleMons[gBattlerTarget].speed;
        break;
    default:
        errorf("Illegal stat requested");
        return;
    }
    gBattleStruct->passiveHpUpdate[gBattlerAttacker] *= gStatStageRatios[gBattleMons[gBattlerTarget].statStages[stat]][0];
    gBattleStruct->passiveHpUpdate[gBattlerAttacker] /= gStatStageRatios[gBattleMons[gBattlerTarget].statStages[stat]][1];
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfFullHp(void)
{
    NATIVE_ARGS(u8 battler, const u8 *jumpInstr);
    if (IsBattlerAtMaxHp(GetBattlerForBattleScript(cmd->battler)))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryFriskMessage(void)
{
    NATIVE_ARGS();
    while (gBattleStruct->friskedBattler < gBattlersCount)
    {
        gBattlerTarget = gBattleStruct->friskedBattler++;
        if (!IsBattlerAlly(gBattlerAttacker, gBattlerTarget)
            && IsBattlerAlive(gBattlerTarget)
            && gBattleMons[gBattlerTarget].item != ITEM_NONE)
        {
            gLastUsedItem = gBattleMons[gBattlerTarget].item;
            RecordItemEffectBattle(gBattlerTarget, GetBattlerHoldEffectIgnoreNegation(gBattlerTarget));
            // If Frisk identifies two mons' items, show the pop-up only once.
            if (gBattleStruct->friskedAbility)
            {
                BattleScriptCall(BattleScript_FriskMsg);
            }
            else
            {
                gBattleStruct->friskedAbility = TRUE;
                BattleScriptCall(BattleScript_FriskMsgWithPopup);
            }
            return;
        }
    }
    gBattleStruct->friskedBattler = 0;
    gBattleStruct->friskedAbility = FALSE;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SetTracedAbility(void)
{
    NATIVE_ARGS(u8 battler);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    gBattleMons[battler].ability = gBattleMons[battler].volatiles.overwrittenAbility = gBattleStruct->tracedAbility[battler];
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryIllusionOff(void)
{
    NATIVE_ARGS(u8 battler);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    if (TryClearIllusion(battler, GetBattlerAbility(battler)))
        return;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_UpdateNick(void)
{
    NATIVE_ARGS();
    u32 battler = gBattleScripting.battler;
    UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], GetBattlerMon(battler), HEALTHBOX_NICK);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfNotBerry(void)
{
    NATIVE_ARGS(u8 battler, const u8 *jumpInstr);
    if (GetItemPocket(gBattleMons[GetBattlerForBattleScript(cmd->battler)].item) == POCKET_BERRIES)
        gBattlescriptCurrInstr = cmd->nextInstr;
    else
        gBattlescriptCurrInstr = cmd->jumpInstr;
}

void BS_GravityOnAirborneMons(void)
{
    NATIVE_ARGS();
    // Cancel all multiturn moves of IN_AIR Pokemon except those being targeted by Sky Drop.
    if (gBattleMons[gBattlerTarget].volatiles.semiInvulnerable == STATE_ON_AIR)
        CancelMultiTurnMoves(gBattlerTarget, SKY_DROP_GRAVITY_ON_AIRBORNE);

    gBattleMons[gBattlerTarget].volatiles.semiInvulnerable = STATE_NONE;
    gBattleMons[gBattlerTarget].volatiles.magnetRise = FALSE;
    gBattleMons[gBattlerTarget].volatiles.telekinesis = FALSE;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryAcupressure(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    u32 bits = 0;
    for (enum Stat stat = STAT_ATK; stat < NUM_BATTLE_STATS; stat++)
    {
        if (CompareStat(gBattlerTarget, stat, MAX_STAT_STAGE, CMP_LESS_THAN, GetBattlerAbility(gBattlerTarget)))
            bits |= 1u << stat;
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
}

void BS_CancelMultiTurnMoves(void)
{
    NATIVE_ARGS();
    const u8 *result = CancelMultiTurnMoves(gBattlerAttacker, SKY_DROP_CANCEL_MULTI_TURN_MOVES);
    if (result)
        gBattlescriptCurrInstr = result;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_IsRunningImpossible(void)
{
    NATIVE_ARGS();
    gBattleCommunication[0] = IsRunningFromBattleImpossible(gBattlerAttacker);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_GetMoveTarget(void)
{
    NATIVE_ARGS();
    gBattlerTarget = GetBattleMoveTarget(gCurrentMove, TARGET_NONE);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_GetBattlerFainted(void)
{
    NATIVE_ARGS(u8 battler);
    if (gHitMarker & HITMARKER_FAINTED(GetBattlerForBattleScript(cmd->battler)))
        gBattleCommunication[0] = TRUE;
    else
        gBattleCommunication[0] = FALSE;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

// TODO: What is this fixing???
void BS_ResetSwitchInAbilityBits(void)
{
    NATIVE_ARGS();
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_UpdateChoiceMoveOnLvlUp(void)
{
    NATIVE_ARGS();
    if (gBattlerPartyIndexes[0] == gBattleStruct->expGetterMonId || gBattlerPartyIndexes[2] == gBattleStruct->expGetterMonId)
    {
        u32 battler;
        if (gBattlerPartyIndexes[0] == gBattleStruct->expGetterMonId)
            battler = 0;
        else
            battler = 2;

        u32 moveIndex;
        for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
        {
            if (gBattleMons[battler].moves[moveIndex] == gBattleStruct->choicedMove[battler])
                break;
        }
        if (moveIndex == MAX_MON_MOVES)
            gBattleStruct->choicedMove[battler] = MOVE_NONE;
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_ResetPlayerFainted(void)
{
    NATIVE_ARGS();
    if (!(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_DOUBLE))
        && gBattleTypeFlags & BATTLE_TYPE_TRAINER
        && IsBattlerAlive(B_POSITION_PLAYER_LEFT)
        && IsBattlerAlive(B_POSITION_OPPONENT_LEFT))
    {
        gHitMarker &= ~HITMARKER_PLAYER_FAINTED;
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_PalaceFlavorText(void)
{
    NATIVE_ARGS();
    // Try and print end-of-turn Battle Palace flavor text (e.g. "A glint appears in mon's eyes")
    // u32 battler;
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
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_ArenaJudgmentWindow(void)
{
    NATIVE_ARGS();
    // u32 judgmentWindow = BattleArena_ShowJudgmentWindow(&gBattleCommunication[0]);

    // // BattleArena_ShowJudgmentWindow's last state was an intermediate step.
    // // Return without advancing the current instruction so that it will be called again.
    // if (judgmentWindow == ARENA_RESULT_RUNNING)
    //     return;

    // gBattleCommunication[1] = judgmentWindow;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

static void SetArenMonLostValues(u32 battler, enum BattleSide side)
{
    // gBattleMons[battler].hp = 0;
    // gHitMarker |= HITMARKER_FAINTED(battler);
    // if (side == B_SIDE_PLAYER)
    //     gBattleStruct->arenaLostPlayerMons |= 1u << gBattlerPartyIndexes[battler];
    // else
    //     gBattleStruct->arenaLostOpponentMons |= 1u << gBattlerPartyIndexes[battler];
    // gBattleMons[battler].volatiles.truantSwitchInHack = TRUE;
}

#define playerMon 0
#define opponentMon 1
void BS_ArenaOpponentMonLost(void)
{
    NATIVE_ARGS();
    SetArenMonLostValues(opponentMon, B_SIDE_OPPONENT);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_ArenaPlayerMonLost(void)
{
    NATIVE_ARGS();
    SetArenMonLostValues(playerMon, B_SIDE_PLAYER);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_ArenaBothMonsLost(void)
{
    NATIVE_ARGS();
    SetArenMonLostValues(playerMon, B_SIDE_PLAYER);
    SetArenMonLostValues(opponentMon, B_SIDE_OPPONENT);
    gBattlescriptCurrInstr = cmd->nextInstr;
}
#undef playerMon
#undef opponentMon

void BS_ForfeitYesNoBox(void)
{
    NATIVE_ARGS();
    BtlController_EmitYesNoBox(gBattlerAttacker, B_COMM_TO_CONTROLLER);
    MarkBattlerForControllerExec(gBattlerAttacker);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_DrawArenaRefTextBox(void)
{
    NATIVE_ARGS();
    // DrawArenaRefereeTextBox();
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_EraseArenaRefTextBox(void)
{
    NATIVE_ARGS();
    // EraseArenaRefereeTextBox();
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_ArenaJudgmentString(void)
{
    NATIVE_ARGS(u8 id);
    // BattleStringExpandPlaceholdersToDisplayedString(gRefereeStringsTable[cmd->id]);
    // BattlePutTextOnWindow(gDisplayedStringBattle, ARENA_WIN_JUDGMENT_TEXT);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_ArenaWaitMessage(void)
{
    NATIVE_ARGS();
    // if (IsTextPrinterActiveOnWindow(ARENA_WIN_JUDGMENT_TEXT))
    //     return;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_WaitCry(void)
{
    NATIVE_ARGS();
    if (!IsCryFinished())
        return;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

#define opponentFirstBattler 1
#define opponentSecondBattler 3
void BS_ReturnOpponentMon1ToBall(void)
{
    NATIVE_ARGS();
    if (IsBattlerAlive(opponentFirstBattler))
    {
        BtlController_EmitReturnMonToBall(opponentFirstBattler, B_COMM_TO_CONTROLLER, FALSE);
        MarkBattlerForControllerExec(opponentFirstBattler);
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_ReturnOpponentMon2ToBall(void)
{
    NATIVE_ARGS();
    if (gBattlersCount > opponentSecondBattler)
    {
        if (IsBattlerAlive(opponentSecondBattler))
        {
            BtlController_EmitReturnMonToBall(opponentSecondBattler, B_COMM_TO_CONTROLLER, FALSE);
            MarkBattlerForControllerExec(opponentSecondBattler);
        }
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}
#undef opponentFirstBattler
#undef opponentSecondBattler

void BS_VolumeDown(void)
{
    NATIVE_ARGS();
    m4aMPlayVolumeControl(&gMPlayInfo_BGM, TRACKS_ALL, 0x55);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_VolumeUp(void)
{
    NATIVE_ARGS();
    m4aMPlayVolumeControl(&gMPlayInfo_BGM, TRACKS_ALL, 0x100);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SetAlreadyStatusedMoveAttempt(void)
{
    NATIVE_ARGS();
    gBattleStruct->battlerState[gBattlerAttacker].alreadyStatusedMoveAttempt = TRUE;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_PalaceTryEscapeStatus(void)
{
    NATIVE_ARGS();
    // if (BattlePalace_TryEscapeStatus(gBattlerAttacker))
    //     return;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SetTeleportOutcome(void)
{
    NATIVE_ARGS(u8 battler);
    u32 battler = GetBattlerForBattleScript(cmd->battler);

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
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_PlayTrainerDefeatedMusic(void)
{
    NATIVE_ARGS();
    BtlController_EmitPlayFanfareOrBGM(gBattlerAttacker, B_COMM_TO_CONTROLLER, MUS_VICTORY_TRAINER, TRUE);
    MarkBattlerForControllerExec(gBattlerAttacker);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_StatTextBuffer(void)
{
    NATIVE_ARGS();
    PREPARE_STAT_BUFFER(gBattleTextBuff1, gBattleCommunication[0]);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SwitchinAbilities(void)
{
    NATIVE_ARGS(u8 battler);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    u32 ability = GetBattlerAbility(battler);
    gBattlescriptCurrInstr = cmd->nextInstr;
    AbilityBattleEffects(ABILITYEFFECT_TERA_SHIFT, battler, ability, MOVE_NONE, TRUE);
    AbilityBattleEffects(ABILITYEFFECT_NEUTRALIZINGGAS, battler, ability, MOVE_NONE, TRUE);
    AbilityBattleEffects(ABILITYEFFECT_UNNERVE, battler, ability, MOVE_NONE, TRUE);
    AbilityBattleEffects(ABILITYEFFECT_ON_SWITCHIN, battler, ability, MOVE_NONE, TRUE);
    AbilityBattleEffects(ABILITYEFFECT_IMMUNITY, battler, ability, MOVE_NONE, TRUE);
    AbilityBattleEffects(ABILITYEFFECT_COMMANDER, battler, ability, MOVE_NONE, TRUE);
    AbilityBattleEffects(ABILITYEFFECT_ON_WEATHER, battler, ability, MOVE_NONE, TRUE);
    AbilityBattleEffects(ABILITYEFFECT_ON_TERRAIN, battler, ability, MOVE_NONE, TRUE);
    AbilityBattleEffects(ABILITYEFFECT_OPPORTUNIST, battler, ability, MOVE_NONE, TRUE);
}

void BS_InstantHpDrop(void)
{
    NATIVE_ARGS();
    BtlController_EmitHealthBarUpdate(gBattlerAttacker, B_COMM_TO_CONTROLLER, INSTANT_HP_BAR_DROP);
    MarkBattlerForControllerExec(gBattlerAttacker);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_ClearStatus(void)
{
    NATIVE_ARGS(u8 battler);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    gBattleMons[battler].status1 = 0;
    BtlController_EmitSetMonData(
        battler,
        B_COMM_TO_CONTROLLER,
        REQUEST_STATUS_BATTLE,
        0,
        sizeof(gBattleMons[battler].status1),
        &gBattleMons[battler].status1);
    MarkBattlerForControllerExec(battler);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_RestoreMovePp(void)
{
    NATIVE_ARGS(u8 battler);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    u32 moveIndex;
    u32 data[MAX_MON_MOVES + 1];
    for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
    {
        gBattleMons[battler].pp[moveIndex] = CalculatePPWithBonus(gBattleMons[battler].moves[moveIndex], gBattleMons[battler].ppBonuses, moveIndex);
        data[moveIndex] = gBattleMons[battler].pp[moveIndex];
    }
    data[moveIndex] = gBattleMons[battler].ppBonuses;
    BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_PP_DATA_BATTLE, 0, 5, data);
    MarkBattlerForControllerExec(battler);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryActivateReceiver(void)
{
    NATIVE_ARGS(u8 battler);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    gBattlerAbility = BATTLE_PARTNER(battler);
    u32 partnerAbility = GetBattlerAbility(gBattlerAbility);
    if (IsBattlerAlive(gBattlerAbility)
        && (partnerAbility == ABILITY_RECEIVER || partnerAbility == ABILITY_POWER_OF_ALCHEMY)
        && GetBattlerHoldEffectIgnoreAbility(battler) != HOLD_EFFECT_ABILITY_SHIELD
        && !gAbilitiesInfo[gBattleMons[battler].ability].cantBeCopied)
    {
        gBattleStruct->tracedAbility[gBattlerAbility] = gBattleMons[battler].ability; // re-using the variable for trace
        gBattleScripting.battler = battler;
        BattleScriptPush(cmd->nextInstr);
        gBattlescriptCurrInstr = BattleScript_ReceiverActivates;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_TryActivateSoulheart(void)
{
    NATIVE_ARGS();
    while (gBattleStruct->soulheartBattlerId < gBattlersCount)
    {
        gBattleScripting.battler = gBattleStruct->soulheartBattlerId++;
        u32 ability = GetBattlerAbility(gBattleScripting.battler);
        if (ability == ABILITY_SOUL_HEART
            && IsBattlerAlive(gBattleScripting.battler)
            && !NoAliveMonsForEitherParty()
            && CompareStat(gBattleScripting.battler, STAT_SPATK, MAX_STAT_STAGE, CMP_LESS_THAN, ability))
        {
            SET_STATCHANGER(STAT_SPATK, 1, FALSE);
            PREPARE_STAT_BUFFER(gBattleTextBuff1, STAT_SPATK);
            BattleScriptCall(BattleScript_ScriptingAbilityStatRaise);
            return;
        }
    }
    gBattleStruct->soulheartBattlerId = 0;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_PlayMoveAnimation(void)
{
    NATIVE_ARGS(u16 move);

    u32 move = cmd->move;
    if (move == MOVE_NONE)
    	move = gCurrentMove;

    BtlController_EmitMoveAnimation(
        gBattlerAttacker,
        B_COMM_TO_CONTROLLER,
        move,
        gBattleScripting.animTurn,
        0,
        0,
        gBattleMons[gBattlerAttacker].friendship,
        gMultiHitCounter);
    MarkBattlerForControllerExec(gBattlerAttacker);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SetLuckyChant(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    enum BattleSide side = GetBattlerSide(gBattlerAttacker);
    if (!(gSideStatuses[side] & SIDE_STATUS_LUCKY_CHANT))
    {
        gSideStatuses[side] |= SIDE_STATUS_LUCKY_CHANT;
        gSideTimers[side].luckyChantTimer = 5;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

void BS_TryEntrainment(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    if (gAbilitiesInfo[gBattleMons[gBattlerAttacker].ability].cantBeCopied
        || gAbilitiesInfo[gBattleMons[gBattlerTarget].ability].cantBeOverwritten)
    {
        RecordAbilityBattle(gBattlerTarget, gBattleMons[gBattlerTarget].ability);
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else if (CanAbilityShieldActivateForBattler(gBattlerTarget))
    {
        gBattlescriptCurrInstr = BattleScript_MoveEnd;
        BattleScriptCall(BattleScript_AbilityShieldProtects);
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
            RemoveAbilityFlags(gBattlerTarget);
            gBattleMons[gBattlerTarget].ability = gBattleMons[gBattlerTarget].volatiles.overwrittenAbility = gBattleMons[gBattlerAttacker].ability;
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
    }
}

void BS_SetLastUsedAbility(void)
{
    NATIVE_ARGS();
    gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_InvertStatStages(void)
{
    NATIVE_ARGS();
    for (u32 i = 0; i < NUM_BATTLE_STATS; i++)
    {
        if (gBattleMons[gBattlerTarget].statStages[i] < DEFAULT_STAT_STAGE) // Negative becomes positive.
            gBattleMons[gBattlerTarget].statStages[i] = DEFAULT_STAT_STAGE + (DEFAULT_STAT_STAGE - gBattleMons[gBattlerTarget].statStages[i]);
        else if (gBattleMons[gBattlerTarget].statStages[i] > DEFAULT_STAT_STAGE) // Positive becomes negative.
            gBattleMons[gBattlerTarget].statStages[i] = DEFAULT_STAT_STAGE - (gBattleMons[gBattlerTarget].statStages[i] - DEFAULT_STAT_STAGE);
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryElectrify(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    if (HasBattlerActedThisTurn(gBattlerTarget))
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gBattleMons[gBattlerTarget].volatiles.electrified = TRUE;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_TrySoak(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    enum Type types[3];
    GetBattlerTypes(gBattlerTarget, FALSE, types);
    enum Type typeToSet = GetMoveArgType(gCurrentMove);
    if ((types[0] == typeToSet && types[1] == typeToSet)
     || GetActiveGimmick(gBattlerTarget) == GIMMICK_TERA)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        SET_BATTLER_TYPE(gBattlerTarget, typeToSet);
        PREPARE_TYPE_BUFFER(gBattleTextBuff1, typeToSet);
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_HandleFormChange(void)
{
    NATIVE_ARGS(u8 battler, u8 case_);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    struct Pokemon *mon = GetBattlerMon(battler);

    if (cmd->case_ == 0) // Change species.
    {
        BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_SPECIES_BATTLE, 1u << gBattlerPartyIndexes[battler], sizeof(gBattleMons[battler].species), &gBattleMons[battler].species);
        MarkBattlerForControllerExec(battler);
    }
    else if (cmd->case_ == 1) // Change stats.
    {
        RecalcBattlerStats(battler, mon, FALSE);
    }
    else // Update healthbox.
    {
        UpdateHealthboxAttribute(gHealthboxSpriteIds[battler], mon, HEALTHBOX_ALL);
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryAutotomize(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    if (GetBattlerWeight(gBattlerAttacker) > 1)
    {
        gBattleMons[gBattlerAttacker].volatiles.autotomizeCount++;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

void BS_TryInstruct(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    enum Move move = gLastPrintedMoves[gBattlerTarget];
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
        u32 moveIndex;
        for (moveIndex = 0; moveIndex < MAX_MON_MOVES; moveIndex++)
        {
            if (gBattleMons[gBattlerTarget].moves[moveIndex] == gCalledMove)
            {
                gCurrMovePos = moveIndex;
                moveIndex = MAX_MON_MOVES;
                break;
            }
        }
        if (moveIndex != MAX_MON_MOVES || gBattleMons[gBattlerTarget].pp[gCurrMovePos] == 0)
        {
            gBattlescriptCurrInstr = cmd->failInstr;
        }
        else
        {
            gEffectBattler = gBattleStruct->battlerState[gBattlerTarget].lastMoveTarget;
            PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, gBattlerTarget, gBattlerPartyIndexes[gBattlerTarget]);
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
    }
}

void BS_ShowAbilityPopup(void)
{
    NATIVE_ARGS();
    CreateAbilityPopUp(gBattlerAbility, gBattleMons[gBattlerAbility].ability, (IsDoubleBattle()) != 0);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_UpdateAbilityPopup(void)
{
    NATIVE_ARGS();
    UpdateAbilityPopup(gBattlerAbility);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfTargetAlly(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);
    if (!IsBattlerAlly(gBattlerAttacker, gBattlerTarget))
        gBattlescriptCurrInstr = cmd->nextInstr;
    else
        gBattlescriptCurrInstr = cmd->jumpInstr;
}

void BS_TryPsychoShift(void)
{
    NATIVE_ARGS(const u8 *failInstr, const u8 *sleepClauseFailInstr);
    u32 targetAbility = GetBattlerAbility(gBattlerTarget);
    // Psycho shift works
    if ((gBattleMons[gBattlerAttacker].status1 & STATUS1_POISON) && CanBePoisoned(gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerAttacker), targetAbility))
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
    }
    else if ((gBattleMons[gBattlerAttacker].status1 & STATUS1_TOXIC_POISON) && CanBePoisoned(gBattlerAttacker, gBattlerTarget, GetBattlerAbility(gBattlerAttacker), targetAbility))
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
    }
    else if ((gBattleMons[gBattlerAttacker].status1 & STATUS1_BURN) && CanBeBurned(gBattlerAttacker, gBattlerTarget, targetAbility))
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = 2;
    }
    else if ((gBattleMons[gBattlerAttacker].status1 & STATUS1_PARALYSIS) && CanBeParalyzed(gBattlerAttacker, gBattlerTarget, targetAbility))
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = 3;
    }
    else if ((gBattleMons[gBattlerAttacker].status1 & STATUS1_SLEEP) && CanBeSlept(gBattlerAttacker, gBattlerTarget, targetAbility, BLOCKED_BY_SLEEP_CLAUSE))
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = 4;
    }
    else if ((gBattleMons[gBattlerAttacker].status1 & STATUS1_FROSTBITE) && CanBeFrozen(gBattlerAttacker, gBattlerTarget, targetAbility))
    {
        gBattleCommunication[MULTISTRING_CHOOSER] = 5;
    }
    else if (IsSleepClauseActiveForSide(GetBattlerSide(gBattlerTarget)))
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
    BtlController_EmitSetMonData(
        gBattlerTarget,
        B_COMM_TO_CONTROLLER,
        REQUEST_STATUS_BATTLE,
        0,
        sizeof(gBattleMons[gBattlerTarget].status1),
        &gBattleMons[gBattlerTarget].status1);
    MarkBattlerForControllerExec(gBattlerTarget);
    TryActivateSleepClause(gBattlerTarget, gBattlerPartyIndexes[gBattlerTarget]);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_CureStatus(void)
{
    NATIVE_ARGS(u8 battler);
    u32 battler = GetBattlerForBattleScript(cmd->battler);

    if (gBattleMons[battler].status1 & STATUS1_SLEEP)
        TryDeactivateSleepClause(GetBattlerSide(battler), gBattlerPartyIndexes[battler]);

    gBattleMons[battler].status1 = 0;
    BtlController_EmitSetMonData(battler, B_COMM_TO_CONTROLLER, REQUEST_STATUS_BATTLE, 0, sizeof(gBattleMons[battler].status1), &gBattleMons[battler].status1);
    MarkBattlerForControllerExec(battler);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_PowerTrick(void)
{
    NATIVE_ARGS();
    u32 temp;
    gBattleMons[gBattlerAttacker].volatiles.powerTrick = !gBattleMons[gBattlerAttacker].volatiles.powerTrick;
    SWAP(gBattleMons[gBattlerAttacker].attack, gBattleMons[gBattlerAttacker].defense, temp);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryAfterYou(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    if (ChangeOrderTargetAfterAttacker())
    {
        gSpecialStatuses[gBattlerTarget].afterYou = 1;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

void BS_TryBestow(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    if (gBattleMons[gBattlerAttacker].item == ITEM_NONE
        || gBattleMons[gBattlerTarget].item != ITEM_NONE
        || !CanBattlerGetOrLoseItem(gBattlerAttacker, gBattlerTarget, gBattleMons[gBattlerAttacker].item)
        || !CanBattlerGetOrLoseItem(gBattlerTarget, gBattlerAttacker, gBattleMons[gBattlerAttacker].item)
        || GetBattlerPartyState(gBattlerTarget)->isKnockedOff)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        BestowItem(gBattlerAttacker, gBattlerTarget);
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_HandleTrainerSlideMsg(void)
{
    NATIVE_ARGS(u8 battler, u8 case_);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
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
        u32 partner = BATTLE_PARTNER(battler);
        if (IsBattlerAlive(partner))
        {
            SetBattlerShadowSpriteCallback(partner, gBattleMons[partner].species);
            BattleLoadMonSpriteGfx(GetBattlerMon(partner), partner);
        }
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryTrainerSlideMsgFirstOff(void)
{
    NATIVE_ARGS(u8 battler);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    u32 shouldDoTrainerSlide = 0;
    if ((shouldDoTrainerSlide = ShouldDoTrainerSlide(battler, TRAINER_SLIDE_PLAYER_LANDS_FIRST_DOWN)))
    {
        gBattleScripting.battler = battler;
        BattleScriptPush(cmd->nextInstr);
        switch(battler)
        {
        case B_POSITION_OPPONENT_LEFT:
            gBattlescriptCurrInstr = BattleScript_TrainerASlideMsgRet;
            break;
        case B_POSITION_PLAYER_RIGHT:
            gBattlescriptCurrInstr = BattleScript_TrainerPartnerSlideMsgRet;
            break;
        case B_POSITION_OPPONENT_RIGHT:
            gBattlescriptCurrInstr = BattleScript_TrainerBSlideMsgRet;
            break;
        default:
            break;
        }
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_TryTrainerSlideMsgLastOn(void)
{
    NATIVE_ARGS(u8 battler);
    u32 shouldDoTrainerSlide = 0;
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    if ((shouldDoTrainerSlide = ShouldDoTrainerSlide(battler, TRAINER_SLIDE_LAST_SWITCHIN)))
    {
        gBattleScripting.battler = battler;
        BattleScriptPush(cmd->nextInstr);
        switch(battler)
        {
        case B_POSITION_OPPONENT_LEFT:
            gBattlescriptCurrInstr = BattleScript_TrainerASlideMsgRet;
            break;
        case B_POSITION_PLAYER_RIGHT:
            gBattlescriptCurrInstr = BattleScript_TrainerPartnerSlideMsgRet;
            break;
        case B_POSITION_OPPONENT_RIGHT:
            gBattlescriptCurrInstr = BattleScript_TrainerBSlideMsgRet;
            break;
        default:
            break;
        }
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

// Potential bug with failing message and missed result on wrong battler
void BS_SetAuroraVeil(void)
{
    NATIVE_ARGS();
    enum BattleSide side = GetBattlerSide(gBattlerAttacker);
    if (gSideStatuses[side] & SIDE_STATUS_AURORA_VEIL)
    {
        gBattleStruct->moveResultFlags[gBattlerTarget] |= MOVE_RESULT_MISSED;
        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
    }
    else
    {
        gSideStatuses[side] |= SIDE_STATUS_AURORA_VEIL;
        if (GetBattlerHoldEffect(gBattlerAttacker) == HOLD_EFFECT_LIGHT_CLAY)
            gSideTimers[GetBattlerSide(gBattlerAttacker)].auroraVeilTimer = 8;
        else
            gSideTimers[GetBattlerSide(gBattlerAttacker)].auroraVeilTimer = 5;

        if (IsDoubleBattle() && CountAliveMonsInBattle(BATTLE_ALIVE_SIDE, gBattlerAttacker) == 2)
            gBattleCommunication[MULTISTRING_CHOOSER] = 5;
        else
            gBattleCommunication[MULTISTRING_CHOOSER] = 5;
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryThirdType(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    u32 type = GetMoveArgType(gCurrentMove);
    if (IS_BATTLER_OF_TYPE(gBattlerTarget, type) || GetActiveGimmick(gBattlerTarget) == GIMMICK_TERA)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gBattleMons[gBattlerTarget].types[2] = type;
        PREPARE_TYPE_BUFFER(gBattleTextBuff1, type);
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_DestroyAbilityPopup(void)
{
    NATIVE_ARGS();
    for (u32 battler = 0; battler < gBattlersCount; battler++)
        DestroyAbilityPopUp(battler);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_GetTotemBoost(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);
    u32 battler = gBattlerAttacker;
    if (gQueuedStatBoosts[battler].stats == 0)
    {
        gBattlescriptCurrInstr = cmd->nextInstr;    // stats done, exit
    }
    else
    {
        for (u32 i = 0; i < (NUM_BATTLE_STATS - 1); i++)
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
}

void BS_ActivateItemEffects(void)
{
    NATIVE_ARGS();
    for (u32 battler = 0; battler < gBattlersCount; battler++)
    {
        if (!IsBattlerAlive(battler))
            continue;

        if (ItemBattleEffects(battler, 0, GetBattlerHoldEffect(battler), IsForceTriggerItemActivation))
            return;
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryRoomService(void)
{
    NATIVE_ARGS(u8 battler, const u8 *failInstr);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    enum HoldEffect holdEffect = GetBattlerHoldEffect(battler);
    if (holdEffect == HOLD_EFFECT_ROOM_SERVICE && ItemBattleEffects(battler, 0, holdEffect, IsOnEffectActivation))
        return;
    gBattlescriptCurrInstr = cmd->failInstr;
}

void BS_TryTerrainSeed(void)
{
    NATIVE_ARGS(u8 battler, const u8 *failInstr);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    enum HoldEffect holdEffect = GetBattlerHoldEffect(battler);
    if (holdEffect == HOLD_EFFECT_TERRAIN_SEED && ItemBattleEffects(battler, 0, holdEffect, IsOnEffectActivation))
        return;
    gBattlescriptCurrInstr = cmd->failInstr;
}

void BS_MakeInvisible(void)
{
    NATIVE_ARGS(u8 battler);
    u32 battler = GetBattlerForBattleScript(cmd->battler);

    if (gBattleControllerExecFlags)
        return;

    BtlController_EmitSpriteInvisibility(battler, B_COMM_TO_CONTROLLER, TRUE);
    MarkBattlerForControllerExec(battler);
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfTeamHealthy(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);
    u32 battler = gBattlerAttacker;
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
}

void BS_TryHealQuarterHealth(void)
{
    NATIVE_ARGS(u8 battler, const u8 *failInstr);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    SetHealAmount(battler, GetNonDynamaxMaxHP(battler) / 4);
    if (gBattleMons[battler].hp == gBattleMons[battler].maxHP)
        gBattlescriptCurrInstr = cmd->failInstr;    // fail
    else
        gBattlescriptCurrInstr = cmd->nextInstr;   // can heal
}

void BS_JumpIfUnder200(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);
    // If the Pokemon is less than 200 kg, or weighing less than 441 lbs, then Sky Drop will work. Otherwise, it will fail.
    if (GetBattlerWeight(gBattlerTarget) < 2000)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SetSkyDrop(void)
{
    NATIVE_ARGS();
    gBattleMons[gBattlerTarget].volatiles.semiInvulnerable = STATE_SKY_DROP;
    /* skyDropTargets holds the information of who is in a particular instance of Sky Drop.
       This is needed in the case that multiple Pokemon use Sky Drop in the same turn or if
       the target of a Sky Drop faints while in the air.*/
    gBattleStruct->skyDropTargets[gBattlerAttacker] = gBattlerTarget;
    gBattleStruct->skyDropTargets[gBattlerTarget] = gBattlerAttacker;

    // End any multiturn effects caused by the target except VOLATILE_RAMPAGE_TURNS
    gBattleMons[gBattlerTarget].volatiles.multipleTurns = 0;
    gBattleMons[gBattlerTarget].volatiles.uproarTurns = 0;
    gBattleMons[gBattlerTarget].volatiles.bideTurns = 0;
    gBattleMons[gBattlerTarget].volatiles.rolloutTimer = 0;
    gBattleMons[gBattlerTarget].volatiles.furyCutterCounter = 0;

    // End any Follow Me/Rage Powder effects caused by the target
    if (gSideTimers[GetBattlerSide(gBattlerTarget)].followmeTimer != 0 && gSideTimers[GetBattlerSide(gBattlerTarget)].followmeTarget == gBattlerTarget)
        gSideTimers[GetBattlerSide(gBattlerTarget)].followmeTimer = 0;

    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_ClearSkyDrop(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    // Check to see if the initial target of this Sky Drop fainted before the 2nd turn of Sky Drop.
    // If so, make the move fail. If not, clear all of the statuses and continue the move.
    if (gBattleStruct->skyDropTargets[gBattlerAttacker] == SKY_DROP_NO_TARGET)
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
    else
    {
        gBattleStruct->skyDropTargets[gBattlerAttacker] = SKY_DROP_NO_TARGET;
        gBattleStruct->skyDropTargets[gBattlerTarget] = SKY_DROP_NO_TARGET;
        gBattleMons[gBattlerTarget].volatiles.semiInvulnerable = STATE_NONE;
        gBattlescriptCurrInstr = cmd->nextInstr;
    }

    // Confuse target if they were in the middle of Petal Dance/Outrage/Thrash when targeted.
    if (gBattleMons[gBattlerTarget].volatiles.rampageTurns)
        gBattleScripting.moveEffect = MOVE_EFFECT_CONFUSION;
}

void BS_SkyDropYawn(void)
{
    NATIVE_ARGS();
    if (gBattleStruct->skyDropTargets[gEffectBattler] != SKY_DROP_NO_TARGET && gBattleMons[gEffectBattler].volatiles.semiInvulnerable != STATE_SKY_DROP)
    {
        // Set the target of Sky Drop as gEffectBattler
        gEffectBattler = gBattleStruct->skyDropTargets[gEffectBattler];

        // Clear skyDropTargets data
        gBattleStruct->skyDropTargets[gBattleStruct->skyDropTargets[gEffectBattler]] = SKY_DROP_NO_TARGET;
        gBattleStruct->skyDropTargets[gEffectBattler] = SKY_DROP_NO_TARGET;

        // If the target was in the middle of Outrage/Thrash/etc. when targeted by Sky Drop, confuse them on release and do proper animation
        if (gBattleMons[gEffectBattler].volatiles.rampageTurns && CanBeConfused(gEffectBattler))
        {
            gBattleMons[gEffectBattler].volatiles.rampageTurns = 0;
            gBattlerAttacker = gEffectBattler;
            gBattleMons[gBattlerTarget].volatiles.confusionTurns = RandomUniform(RNG_CONFUSION_TURNS, 2, B_CONFUSION_TURNS); // 2-5 turns
            gBattlescriptCurrInstr = BattleScript_ThrashConfuses;
        }
        else
        {
            gBattlescriptCurrInstr = cmd->nextInstr;
        }
    }
    else
    {
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
}

void BS_JumpIfPranksterBlocked(void)
{
    NATIVE_ARGS(const u8 *jumpInstr);
    if (BlocksPrankster(gCurrentMove, gBattlerAttacker, gBattlerTarget, TRUE))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryToClearPrimalWeather(void)
{
    NATIVE_ARGS();
    bool32 shouldNotClear = FALSE;

    for (u32 i = 0; i < gBattlersCount; i++)
    {
        enum Ability ability = GetBattlerAbility(i);
        if (((ability == ABILITY_DESOLATE_LAND && gBattleWeather & B_WEATHER_SUN_PRIMAL)
             || (ability == ABILITY_PRIMORDIAL_SEA && gBattleWeather & B_WEATHER_RAIN_PRIMAL)
             || (ability == ABILITY_DELTA_STREAM && gBattleWeather & B_WEATHER_STRONG_WINDS))
            && IsBattlerAlive(i))
            shouldNotClear = TRUE;
    }
    if (gBattleWeather & B_WEATHER_SUN_PRIMAL && !shouldNotClear)
    {
        gBattleWeather &= ~B_WEATHER_SUN_PRIMAL;
        PrepareStringBattle(STRINGID_EXTREMESUNLIGHTFADED, gBattlerAttacker);
        gBattleCommunication[MSG_DISPLAY] = 1;
    }
    else if (gBattleWeather & B_WEATHER_RAIN_PRIMAL && !shouldNotClear)
    {
        gBattleWeather &= ~B_WEATHER_RAIN_PRIMAL;
        PrepareStringBattle(STRINGID_HEAVYRAINLIFTED, gBattlerAttacker);
        gBattleCommunication[MSG_DISPLAY] = 1;
    }
    else if (gBattleWeather & B_WEATHER_STRONG_WINDS && !shouldNotClear)
    {
        gBattleWeather &= ~B_WEATHER_STRONG_WINDS;
        PrepareStringBattle(STRINGID_STRONGWINDSDISSIPATED, gBattlerAttacker);
        gBattleCommunication[MSG_DISPLAY] = 1;
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryEndNeutralizingGas(void)
{
    NATIVE_ARGS();
    if (gSpecialStatuses[gBattlerTarget].neutralizingGasRemoved)
    {
        gSpecialStatuses[gBattlerTarget].neutralizingGasRemoved = FALSE;
        gBattleMons[gBattlerTarget].volatiles.neutralizingGas = FALSE;
        if (!IsNeutralizingGasOnField())
        {
            BattleScriptPush(cmd->nextInstr);
            gBattlescriptCurrInstr = BattleScript_NeutralizingGasExits;
            return;
        }
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}

static bool32 IsRototillerAffected(u32 battler, u32 move)
{
    if (IsBattlerUnaffectedByMove(battler))
        return FALSE;
    if (!IsBattlerGrounded(battler, GetBattlerAbility(battler), GetBattlerHoldEffect(battler)))
        return FALSE;   // Only grounded battlers affected
    if (!IS_BATTLER_OF_TYPE(battler, TYPE_GRASS))
        return FALSE;   // Only grass types affected
    return TRUE;
}

void BS_GetRototillerTargets(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    u32 count = 0;

    for (u32 battler = 0; battler < gBattlersCount; battler++)
    {
        if (IsRototillerAffected(battler, gCurrentMove))
            count++;
        else
            gBattleStruct->moveResultFlags[battler] = MOVE_RESULT_NO_EFFECT;
    }

    if (count == 0)
        gBattlescriptCurrInstr = cmd->failInstr;   // Rototiller fails
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

// TODO: There might be a way to do it without a flag
void BS_ConsumeBerry(void)
{
    NATIVE_ARGS(u8 battler, bool8 fromBattler);
    u32 battler = GetBattlerForBattleScript(cmd->battler);

    if (cmd->fromBattler)
        gLastUsedItem = gBattleMons[battler].item;

    if (gBattleScripting.overrideBerryRequirements == 2)
    {
        gBattleScripting.overrideBerryRequirements = 0;
        if (!cmd->fromBattler && TryCheekPouch(battler, gLastUsedItem, cmd->nextInstr))
            return;
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }
    if (GetItemPocket(gLastUsedItem) != POCKET_BERRIES)
    {
        gBattleScripting.overrideBerryRequirements = 0;
        gBattlescriptCurrInstr = cmd->nextInstr;
        return;
    }

    gBattleScripting.overrideBerryRequirements = 1;
    GetBattlerPartyState(battler)->ateBerry = TRUE;
    if (ItemBattleEffects(battler, 0, GetItemHoldEffect(gLastUsedItem), IsOnBerryActivation))
    {
        gBattleScripting.overrideBerryRequirements = 2;
        return;
    }
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfWeatherAffected(void)
{
    NATIVE_ARGS(u16 flags, const u8 *jumpInstr);
    u32 weather = cmd->flags;
    if (IsBattlerWeatherAffected(gBattlerAttacker, weather))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfSpecies(void)
{
    NATIVE_ARGS(u16 species, const u8 *jumpInstr);
    if (gBattleMons[gBattlerAttacker].species == cmd->species)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfAbilityPreventsRest(void)
{
    NATIVE_ARGS(u8 battler, const u8 *jumpInstr);
    u32 battler = GetBattlerForBattleScript(cmd->battler);
    u32 ability = GetBattlerAbility(battler);
    if (GetConfig(CONFIG_LEAF_GUARD_PREVENTS_REST) >= GEN_5 && IsLeafGuardProtected(battler, ability))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else if (IsShieldsDownProtected(battler, ability))
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SetAttackerToStickyWebUser(void)
{
    NATIVE_ARGS();
    // For Mirror Armor: "If the Pokémon with this Ability is affected by Sticky Web, the effect is reflected back to the Pokémon which set it up.
    //  If Pokémon which set up Sticky Web is not on the field, no Pokémon have their Speed lowered."
    gBattlerAttacker = gBattlerTarget;  // Initialize 'fail' condition
    SET_STATCHANGER(STAT_SPEED, 1, TRUE);
    if (gSideTimers[GetBattlerSide(gBattlerTarget)].stickyWebBattlerId != 0xFF)
        gBattlerAttacker = gSideTimers[GetBattlerSide(gBattlerTarget)].stickyWebBattlerId;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_CutOneThirdHpAndRaiseStats(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    bool32 atLeastOneStatBoosted = FALSE;
    u32 ability = GetBattlerAbility(gBattlerAttacker);

    for (u32 stat = 1; stat < NUM_STATS; stat++)
    {
        if (CompareStat(gBattlerAttacker, stat, MAX_STAT_STAGE, CMP_LESS_THAN, ability))
        {
            atLeastOneStatBoosted = TRUE;
            break;
        }
    }
    if (atLeastOneStatBoosted)
    {
        SetPassiveDamageAmount(gBattlerAttacker, GetNonDynamaxMaxHP(gBattlerAttacker) / 3);
        gBattlescriptCurrInstr = cmd->nextInstr;
    }
    else
    {
        gBattlescriptCurrInstr = cmd->failInstr;
    }
}

void BS_SetPoltergeistMessage(void)
{
    NATIVE_ARGS(const u8 *failInstr);
    PREPARE_ITEM_BUFFER(gBattleTextBuff1, gBattleMons[gBattlerTarget].item);
    gLastUsedItem = gBattleMons[gBattlerTarget].item;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryResetNegativeStatStages(void)
{
    NATIVE_ARGS();
    for (u32 stat = 0; stat < NUM_BATTLE_STATS; stat++)
        if (gBattleMons[gBattlerTarget].statStages[stat] < DEFAULT_STAT_STAGE)
            gBattleMons[gBattlerTarget].statStages[stat] = DEFAULT_STAT_STAGE;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_SaveBattlerItem(void)
{
    NATIVE_ARGS();
    gBattleHistory->heldItems[gBattlerTarget] = gBattleMons[gBattlerTarget].item;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_RestoreBattlerItem(void)
{
    NATIVE_ARGS();
    gBattleMons[gBattlerTarget].item = gBattleHistory->heldItems[gBattlerTarget];
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_BattlerItemToLastUsedItem(void)
{
    NATIVE_ARGS();
    gBattleMons[gBattlerTarget].item = gLastUsedItem;
    gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_JumpIfGenConfigLowerThan(void)
{
    NATIVE_ARGS(u16 tag, u8 gen, const u8 *jumpInstr);
    if (GetConfig(cmd->tag) < cmd->gen)
        gBattlescriptCurrInstr = cmd->jumpInstr;
    else
        gBattlescriptCurrInstr = cmd->nextInstr;
}

void BS_TryActivateAbilityWithAbilityShield(void)
{
    NATIVE_ARGS(u8 battler, bool8 switchedItems);

    u32 battler = GetBattlerForBattleScript(cmd->battler);

    gBattlescriptCurrInstr = cmd->nextInstr;

    if (cmd->switchedItems)
    {
        bool32 attackerHasAbilityShield = GetBattlerHoldEffectIgnoreAbility(gBattlerAttacker) == HOLD_EFFECT_ABILITY_SHIELD;
        bool32 targetHasAbilityShield = GetBattlerHoldEffectIgnoreAbility(gBattlerTarget) == HOLD_EFFECT_ABILITY_SHIELD;

        if (attackerHasAbilityShield == targetHasAbilityShield) // both or neither has Ability Shield
            return;

        if (attackerHasAbilityShield)
            battler = gBattlerAttacker;
        else
            battler = gBattlerTarget;
    }
    else
    {
        if (GetBattlerHoldEffectIgnoreAbility(battler) != HOLD_EFFECT_ABILITY_SHIELD)
            return;
    }

    // check if Ability Shield is protecting battler's ability from being suppressed (no breaking effects)
    if (GetBattlerAbilityInternal(battler, TRUE, TRUE) == ABILITY_NONE
     && GetBattlerAbility(battler) != ABILITY_NONE)
    {
        gBattleScripting.battler = battler;
        BattleScriptCall(BattleScript_ActivateSwitchInAbility);
    }
}

// firered
void BS_GetBattlersForRecall(void)
{
    NATIVE_ARGS();
    u32 battler = 1;
    gBattleCommunication[MULTISTRING_CHOOSER] = 0;
    for (u32 i = 0; battler < MAX_BATTLERS_COUNT; battler += 2)
    {
        if (battler < gBattlersCount && gBattleMons[battler].hp != 0)
            gBattleCommunication[MULTISTRING_CHOOSER] |= gBitTable[i];
        i++;
    }

    gBattlescriptCurrInstr = cmd->nextInstr;
}
