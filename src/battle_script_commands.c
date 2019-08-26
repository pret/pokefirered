#include "global.h"
#include "item.h"
#include "util.h"
#include "pokemon.h"
#include "random.h"
#include "data.h"
#include "text.h"
#include "sound.h"
#include "pokedex.h"
#include "window.h"
#include "main.h"
#include "palette.h"
#include "money.h"
#include "bg.h"
#include "string_util.h"
#include "pokemon_icon.h"
#include "m4a.h"
#include "mail.h"
#include "event_data.h"
#include "strings.h"
#include "pokemon_storage_system.h"
#include "pokemon_summary_screen.h"
#include "task.h"
#include "naming_screen.h"
#include "overworld.h"
#include "party_menu.h"
#include "field_specials.h"
#include "battle.h"
#include "battle_message.h"
#include "battle_anim.h"
#include "battle_setup.h"
#include "battle_ai_script_commands.h"
#include "battle_scripts.h"
#include "battle_string_ids.h"
#include "reshow_battle_screen.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "constants/battle_anim.h"
#include "constants/battle_move_effects.h"
#include "constants/battle_script_commands.h"
#include "constants/items.h"
#include "constants/hold_effects.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "constants/moves.h"
#include "constants/abilities.h"
#include "constants/pokemon.h"
#include "constants/trainers.h"

#define DEFENDER_IS_PROTECTED ((gProtectStructs[gBattlerTarget].protected) && (gBattleMoves[gCurrentMove].flags & FLAG_PROTECT_AFFECTED))

struct StatFractions
{
    u8 dividend;
    u8 divisor;
};

extern const u8 *const gBattleScriptsForMoveEffects[];

bool8 IsTwoTurnsMove(u16 move);
void TrySetDestinyBondToHappen(void);
u8 AttacksThisTurn(u8 battlerId, u16 move); // Note: returns 1 if it's a charging turn, otherwise 2.
void CheckWonderGuardAndLevitate(void);
u8 ChangeStatBuffs(s8 statValue, u8 statId, u8, const u8 *BS_ptr);
bool32 IsMonGettingExpSentOut(void);
void sub_8026480(void);
bool8 sub_80264D0(void);
void DrawLevelUpWindow1(void);
void DrawLevelUpWindow2(void);
bool8 sub_8026648(void);
void PutMonIconOnLvlUpBox(void);
void PutLevelAndGenderOnLvlUpBox(void);

void SpriteCB_MonIconOnLvlUpBox(struct Sprite* sprite);

void atk00_attackcanceler(void);
void atk01_accuracycheck(void);
void atk02_attackstring(void);
void atk03_ppreduce(void);
void atk04_critcalc(void);
void atk05_damagecalc(void);
void atk06_typecalc(void);
void atk07_adjustnormaldamage(void);
void atk08_adjustnormaldamage2(void);
void atk09_attackanimation(void);
void atk0A_waitanimation(void);
void atk0B_healthbarupdate(void);
void atk0C_datahpupdate(void);
void atk0D_critmessage(void);
void atk0E_effectivenesssound(void);
void atk0F_resultmessage(void);
void atk10_printstring(void);
void atk11_printselectionstring(void);
void atk12_waitmessage(void);
void atk13_printfromtable(void);
void atk14_printselectionstringfromtable(void);
void atk15_seteffectwithchance(void);
void atk16_seteffectprimary(void);
void atk17_seteffectsecondary(void);
void atk18_clearstatusfromeffect(void);
void atk19_tryfaintmon(void);
void atk1A_dofaintanimation(void);
void atk1B_cleareffectsonfaint(void);
void atk1C_jumpifstatus(void);
void atk1D_jumpifstatus2(void);
void atk1E_jumpifability(void);
void atk1F_jumpifsideaffecting(void);
void atk20_jumpifstat(void);
void atk21_jumpifstatus3condition(void);
void atk22_jumpiftype(void);
void atk23_getexp(void);
void atk24(void);
void atk25_movevaluescleanup(void);
void atk26_setmultihit(void);
void atk27_decrementmultihit(void);
void atk28_goto(void);
void atk29_jumpifbyte(void);
void atk2A_jumpifhalfword(void);
void atk2B_jumpifword(void);
void atk2C_jumpifarrayequal(void);
void atk2D_jumpifarraynotequal(void);
void atk2E_setbyte(void);
void atk2F_addbyte(void);
void atk30_subbyte(void);
void atk31_copyarray(void);
void atk32_copyarraywithindex(void);
void atk33_orbyte(void);
void atk34_orhalfword(void);
void atk35_orword(void);
void atk36_bicbyte(void);
void atk37_bichalfword(void);
void atk38_bicword(void);
void atk39_pause(void);
void atk3A_waitstate(void);
void atk3B_healthbar_update(void);
void atk3C_return(void);
void atk3D_end(void);
void atk3E_end2(void);
void atk3F_end3(void);
void atk40_jumpifaffectedbyprotect(void);
void atk41_call(void);
void atk42_jumpiftype2(void);
void atk43_jumpifabilitypresent(void);
void atk44_endselectionscript(void);
void atk45_playanimation(void);
void atk46_playanimation2(void);
void atk47_setgraphicalstatchangevalues(void);
void atk48_playstatchangeanimation(void);
void atk49_moveend(void);
void atk4A_typecalc2(void);
void atk4B_returnatktoball(void);
void atk4C_getswitchedmondata(void);
void atk4D_switchindataupdate(void);
void atk4E_switchinanim(void);
void atk4F_jumpifcantswitch(void);
void atk50_openpartyscreen(void);
void atk51_switchhandleorder(void);
void atk52_switchineffects(void);
void atk53_trainerslidein(void);
void atk54_playse(void);
void atk55_fanfare(void);
void atk56_playfaintcry(void);
void atk57(void);
void atk58_returntoball(void);
void atk59_handlelearnnewmove(void);
void atk5A_yesnoboxlearnmove(void);
void atk5B_yesnoboxstoplearningmove(void);
void atk5C_hitanimation(void);
void atk5D_getmoneyreward(void);
void atk5E(void);
void atk5F_swapattackerwithtarget(void);
void atk60_incrementgamestat(void);
void atk61_drawpartystatussummary(void);
void atk62_hidepartystatussummary(void);
void atk63_jumptocalledmove(void);
void atk64_statusanimation(void);
void atk65_status2animation(void);
void atk66_chosenstatusanimation(void);
void atk67_yesnobox(void);
void atk68_cancelallactions(void);
void atk69_adjustsetdamage(void);
void atk6A_removeitem(void);
void atk6B_atknameinbuff1(void);
void atk6C_drawlvlupbox(void);
void atk6D_resetsentmonsvalue(void);
void atk6E_setatktoplayer0(void);
void atk6F_makevisible(void);
void atk70_recordlastability(void);
void atk71_buffermovetolearn(void);
void atk72_jumpifplayerran(void);
void atk73_hpthresholds(void);
void atk74_hpthresholds2(void);
void atk75_useitemonopponent(void);
void atk76_various(void);
void atk77_setprotectlike(void);
void atk78_faintifabilitynotdamp(void);
void atk79_setatkhptozero(void);
void atk7A_jumpifnexttargetvalid(void);
void atk7B_tryhealhalfhealth(void);
void atk7C_trymirrormove(void);
void atk7D_setrain(void);
void atk7E_setreflect(void);
void atk7F_setseeded(void);
void atk80_manipulatedamage(void);
void atk81_trysetrest(void);
void atk82_jumpifnotfirstturn(void);
void atk83_nop(void);
void atk84_jumpifcantmakeasleep(void);
void atk85_stockpile(void);
void atk86_stockpiletobasedamage(void);
void atk87_stockpiletohpheal(void);
void atk88_negativedamage(void);
void atk89_statbuffchange(void);
void atk8A_normalisebuffs(void);
void atk8B_setbide(void);
void atk8C_confuseifrepeatingattackends(void);
void atk8D_setmultihitcounter(void);
void atk8E_initmultihitstring(void);
void atk8F_forcerandomswitch(void);
void atk90_tryconversiontypechange(void);
void atk91_givepaydaymoney(void);
void atk92_setlightscreen(void);
void atk93_tryKO(void);
void atk94_damagetohalftargethp(void);
void atk95_setsandstorm(void);
void atk96_weatherdamage(void);
void atk97_tryinfatuating(void);
void atk98_updatestatusicon(void);
void atk99_setmist(void);
void atk9A_setfocusenergy(void);
void atk9B_transformdataexecution(void);
void atk9C_setsubstitute(void);
void atk9D_mimicattackcopy(void);
void atk9E_metronome(void);
void atk9F_dmgtolevel(void);
void atkA0_psywavedamageeffect(void);
void atkA1_counterdamagecalculator(void);
void atkA2_mirrorcoatdamagecalculator(void);
void atkA3_disablelastusedattack(void);
void atkA4_trysetencore(void);
void atkA5_painsplitdmgcalc(void);
void atkA6_settypetorandomresistance(void);
void atkA7_setalwayshitflag(void);
void atkA8_copymovepermanently(void);
void atkA9_trychoosesleeptalkmove(void);
void atkAA_setdestinybond(void);
void atkAB_trysetdestinybondtohappen(void);
void atkAC_remaininghptopower(void);
void atkAD_tryspiteppreduce(void);
void atkAE_healpartystatus(void);
void atkAF_cursetarget(void);
void atkB0_trysetspikes(void);
void atkB1_setforesight(void);
void atkB2_trysetperishsong(void);
void atkB3_rolloutdamagecalculation(void);
void atkB4_jumpifconfusedandstatmaxed(void);
void atkB5_furycuttercalc(void);
void atkB6_happinesstodamagecalculation(void);
void atkB7_presentdamagecalculation(void);
void atkB8_setsafeguard(void);
void atkB9_magnitudedamagecalculation(void);
void atkBA_jumpifnopursuitswitchdmg(void);
void atkBB_setsunny(void);
void atkBC_maxattackhalvehp(void);
void atkBD_copyfoestats(void);
void atkBE_rapidspinfree(void);
void atkBF_setdefensecurlbit(void);
void atkC0_recoverbasedonsunlight(void);
void atkC1_hiddenpowercalc(void);
void atkC2_selectfirstvalidtarget(void);
void atkC3_trysetfutureattack(void);
void atkC4_trydobeatup(void);
void atkC5_setsemiinvulnerablebit(void);
void atkC6_clearsemiinvulnerablebit(void);
void atkC7_setminimize(void);
void atkC8_sethail(void);
void atkC9_jumpifattackandspecialattackcannotfall(void);
void atkCA_setforcedtarget(void);
void atkCB_setcharge(void);
void atkCC_callterrainattack(void);
void atkCD_cureifburnedparalysedorpoisoned(void);
void atkCE_settorment(void);
void atkCF_jumpifnodamage(void);
void atkD0_settaunt(void);
void atkD1_trysethelpinghand(void);
void atkD2_tryswapitems(void);
void atkD3_trycopyability(void);
void atkD4_trywish(void);
void atkD5_trysetroots(void);
void atkD6_doubledamagedealtifdamaged(void);
void atkD7_setyawn(void);
void atkD8_setdamagetohealthdifference(void);
void atkD9_scaledamagebyhealthratio(void);
void atkDA_tryswapabilities(void);
void atkDB_tryimprison(void);
void atkDC_trysetgrudge(void);
void atkDD_weightdamagecalculation(void);
void atkDE_assistattackselect(void);
void atkDF_trysetmagiccoat(void);
void atkE0_trysetsnatch(void);
void atkE1_trygetintimidatetarget(void);
void atkE2_switchoutabilities(void);
void atkE3_jumpifhasnohp(void);
void atkE4_getsecretpowereffect(void);
void atkE5_pickup(void);
void atkE6_docastformchangeanimation(void);
void atkE7_trycastformdatachange(void);
void atkE8_settypebasedhalvers(void);
void atkE9_setweatherballtype(void);
void atkEA_tryrecycleitem(void);
void atkEB_settypetoterrain(void);
void atkEC_pursuitrelated(void);
void atkED_snatchsetbattlers(void);
void atkEE_removelightscreenreflect(void);
void atkEF_handleballthrow(void);
void atkF0_givecaughtmon(void);
void atkF1_trysetcaughtmondexflags(void);
void atkF2_displaydexinfo(void);
void atkF3_trygivecaughtmonnick(void);
void atkF4_subattackerhpbydmg(void);
void atkF5_removeattackerstatus1(void);
void atkF6_finishaction(void);
void atkF7_finishturn(void);

void (* const gBattleScriptingCommandsTable[])(void) =
{
    atk00_attackcanceler,
    atk01_accuracycheck,
    atk02_attackstring,
    atk03_ppreduce,
    atk04_critcalc,
    atk05_damagecalc,
    atk06_typecalc,
    atk07_adjustnormaldamage,
    atk08_adjustnormaldamage2,
    atk09_attackanimation,
    atk0A_waitanimation,
    atk0B_healthbarupdate,
    atk0C_datahpupdate,
    atk0D_critmessage,
    atk0E_effectivenesssound,
    atk0F_resultmessage,
    atk10_printstring,
    atk11_printselectionstring,
    atk12_waitmessage,
    atk13_printfromtable,
    atk14_printselectionstringfromtable,
    atk15_seteffectwithchance,
    atk16_seteffectprimary,
    atk17_seteffectsecondary,
    atk18_clearstatusfromeffect,
    atk19_tryfaintmon,
    atk1A_dofaintanimation,
    atk1B_cleareffectsonfaint,
    atk1C_jumpifstatus,
    atk1D_jumpifstatus2,
    atk1E_jumpifability,
    atk1F_jumpifsideaffecting,
    atk20_jumpifstat,
    atk21_jumpifstatus3condition,
    atk22_jumpiftype,
    atk23_getexp,
    atk24,
    atk25_movevaluescleanup,
    atk26_setmultihit,
    atk27_decrementmultihit,
    atk28_goto,
    atk29_jumpifbyte,
    atk2A_jumpifhalfword,
    atk2B_jumpifword,
    atk2C_jumpifarrayequal,
    atk2D_jumpifarraynotequal,
    atk2E_setbyte,
    atk2F_addbyte,
    atk30_subbyte,
    atk31_copyarray,
    atk32_copyarraywithindex,
    atk33_orbyte,
    atk34_orhalfword,
    atk35_orword,
    atk36_bicbyte,
    atk37_bichalfword,
    atk38_bicword,
    atk39_pause,
    atk3A_waitstate,
    atk3B_healthbar_update,
    atk3C_return,
    atk3D_end,
    atk3E_end2,
    atk3F_end3,
    atk40_jumpifaffectedbyprotect,
    atk41_call,
    atk42_jumpiftype2,
    atk43_jumpifabilitypresent,
    atk44_endselectionscript,
    atk45_playanimation,
    atk46_playanimation2,
    atk47_setgraphicalstatchangevalues,
    atk48_playstatchangeanimation,
    atk49_moveend,
    atk4A_typecalc2,
    atk4B_returnatktoball,
    atk4C_getswitchedmondata,
    atk4D_switchindataupdate,
    atk4E_switchinanim,
    atk4F_jumpifcantswitch,
    atk50_openpartyscreen,
    atk51_switchhandleorder,
    atk52_switchineffects,
    atk53_trainerslidein,
    atk54_playse,
    atk55_fanfare,
    atk56_playfaintcry,
    atk57,
    atk58_returntoball,
    atk59_handlelearnnewmove,
    atk5A_yesnoboxlearnmove,
    atk5B_yesnoboxstoplearningmove,
    atk5C_hitanimation,
    atk5D_getmoneyreward,
    atk5E,
    atk5F_swapattackerwithtarget,
    atk60_incrementgamestat,
    atk61_drawpartystatussummary,
    atk62_hidepartystatussummary,
    atk63_jumptocalledmove,
    atk64_statusanimation,
    atk65_status2animation,
    atk66_chosenstatusanimation,
    atk67_yesnobox,
    atk68_cancelallactions,
    atk69_adjustsetdamage,
    atk6A_removeitem,
    atk6B_atknameinbuff1,
    atk6C_drawlvlupbox,
    atk6D_resetsentmonsvalue,
    atk6E_setatktoplayer0,
    atk6F_makevisible,
    atk70_recordlastability,
    atk71_buffermovetolearn,
    atk72_jumpifplayerran,
    atk73_hpthresholds,
    atk74_hpthresholds2,
    atk75_useitemonopponent,
    atk76_various,
    atk77_setprotectlike,
    atk78_faintifabilitynotdamp,
    atk79_setatkhptozero,
    atk7A_jumpifnexttargetvalid,
    atk7B_tryhealhalfhealth,
    atk7C_trymirrormove,
    atk7D_setrain,
    atk7E_setreflect,
    atk7F_setseeded,
    atk80_manipulatedamage,
    atk81_trysetrest,
    atk82_jumpifnotfirstturn,
    atk83_nop,
    atk84_jumpifcantmakeasleep,
    atk85_stockpile,
    atk86_stockpiletobasedamage,
    atk87_stockpiletohpheal,
    atk88_negativedamage,
    atk89_statbuffchange,
    atk8A_normalisebuffs,
    atk8B_setbide,
    atk8C_confuseifrepeatingattackends,
    atk8D_setmultihitcounter,
    atk8E_initmultihitstring,
    atk8F_forcerandomswitch,
    atk90_tryconversiontypechange,
    atk91_givepaydaymoney,
    atk92_setlightscreen,
    atk93_tryKO,
    atk94_damagetohalftargethp,
    atk95_setsandstorm,
    atk96_weatherdamage,
    atk97_tryinfatuating,
    atk98_updatestatusicon,
    atk99_setmist,
    atk9A_setfocusenergy,
    atk9B_transformdataexecution,
    atk9C_setsubstitute,
    atk9D_mimicattackcopy,
    atk9E_metronome,
    atk9F_dmgtolevel,
    atkA0_psywavedamageeffect,
    atkA1_counterdamagecalculator,
    atkA2_mirrorcoatdamagecalculator,
    atkA3_disablelastusedattack,
    atkA4_trysetencore,
    atkA5_painsplitdmgcalc,
    atkA6_settypetorandomresistance,
    atkA7_setalwayshitflag,
    atkA8_copymovepermanently,
    atkA9_trychoosesleeptalkmove,
    atkAA_setdestinybond,
    atkAB_trysetdestinybondtohappen,
    atkAC_remaininghptopower,
    atkAD_tryspiteppreduce,
    atkAE_healpartystatus,
    atkAF_cursetarget,
    atkB0_trysetspikes,
    atkB1_setforesight,
    atkB2_trysetperishsong,
    atkB3_rolloutdamagecalculation,
    atkB4_jumpifconfusedandstatmaxed,
    atkB5_furycuttercalc,
    atkB6_happinesstodamagecalculation,
    atkB7_presentdamagecalculation,
    atkB8_setsafeguard,
    atkB9_magnitudedamagecalculation,
    atkBA_jumpifnopursuitswitchdmg,
    atkBB_setsunny,
    atkBC_maxattackhalvehp,
    atkBD_copyfoestats,
    atkBE_rapidspinfree,
    atkBF_setdefensecurlbit,
    atkC0_recoverbasedonsunlight,
    atkC1_hiddenpowercalc,
    atkC2_selectfirstvalidtarget,
    atkC3_trysetfutureattack,
    atkC4_trydobeatup,
    atkC5_setsemiinvulnerablebit,
    atkC6_clearsemiinvulnerablebit,
    atkC7_setminimize,
    atkC8_sethail,
    atkC9_jumpifattackandspecialattackcannotfall,
    atkCA_setforcedtarget,
    atkCB_setcharge,
    atkCC_callterrainattack,
    atkCD_cureifburnedparalysedorpoisoned,
    atkCE_settorment,
    atkCF_jumpifnodamage,
    atkD0_settaunt,
    atkD1_trysethelpinghand,
    atkD2_tryswapitems,
    atkD3_trycopyability,
    atkD4_trywish,
    atkD5_trysetroots,
    atkD6_doubledamagedealtifdamaged,
    atkD7_setyawn,
    atkD8_setdamagetohealthdifference,
    atkD9_scaledamagebyhealthratio,
    atkDA_tryswapabilities,
    atkDB_tryimprison,
    atkDC_trysetgrudge,
    atkDD_weightdamagecalculation,
    atkDE_assistattackselect,
    atkDF_trysetmagiccoat,
    atkE0_trysetsnatch,
    atkE1_trygetintimidatetarget,
    atkE2_switchoutabilities,
    atkE3_jumpifhasnohp,
    atkE4_getsecretpowereffect,
    atkE5_pickup,
    atkE6_docastformchangeanimation,
    atkE7_trycastformdatachange,
    atkE8_settypebasedhalvers,
    atkE9_setweatherballtype,
    atkEA_tryrecycleitem,
    atkEB_settypetoterrain,
    atkEC_pursuitrelated,
    atkED_snatchsetbattlers,
    atkEE_removelightscreenreflect,
    atkEF_handleballthrow,
    atkF0_givecaughtmon,
    atkF1_trysetcaughtmondexflags,
    atkF2_displaydexinfo,
    atkF3_trygivecaughtmonnick,
    atkF4_subattackerhpbydmg,
    atkF5_removeattackerstatus1,
    atkF6_finishaction,
    atkF7_finishturn,
};

const struct StatFractions sAccuracyStageRatios[] =
{
    {  33, 100 }, // -6
    {  36, 100 }, // -5
    {  43, 100 }, // -4
    {  50, 100 }, // -3
    {  60, 100 }, // -2
    {  75, 100 }, // -1
    {   1,   1 }, //  0
    { 133, 100 }, // +1
    { 166, 100 }, // +2
    {   2,   1 }, // +3
    { 233, 100 }, // +4
    { 133,  50 }, // +5
    {   3,   1 }, // +6
};

// The chance is 1/N for each stage.
const u16 sCriticalHitChance[] = { 16, 8, 4, 3, 2 };

const u32 sStatusFlagsForMoveEffects[] =
{
    0x00000000,
    STATUS1_SLEEP,
    STATUS1_POISON,
    STATUS1_BURN,
    STATUS1_FREEZE,
    STATUS1_PARALYSIS,
    STATUS1_TOXIC_POISON,
    STATUS2_CONFUSION,
    STATUS2_FLINCHED,
    0x00000000,
    STATUS2_UPROAR,
    0x00000000,
    STATUS2_MULTIPLETURNS,
    STATUS2_WRAPPED,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    STATUS2_RECHARGE,
    0x00000000,
    0x00000000,
    STATUS2_ESCAPE_PREVENTION,
    STATUS2_NIGHTMARE,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    STATUS2_LOCK_CONFUSE,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000
};

const u8 *const sMoveEffectBS_Ptrs[] =
{
    [0] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_SLEEP] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_POISON] = BattleScript_MoveEffectPoison,
    [MOVE_EFFECT_BURN] = BattleScript_MoveEffectBurn,
    [MOVE_EFFECT_FREEZE] = BattleScript_MoveEffectFreeze,
    [MOVE_EFFECT_PARALYSIS] = BattleScript_MoveEffectParalysis,
    [MOVE_EFFECT_TOXIC] = BattleScript_MoveEffectToxic,
    [MOVE_EFFECT_CONFUSION] = BattleScript_MoveEffectConfusion,
    [MOVE_EFFECT_FLINCH] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_TRI_ATTACK] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_UPROAR] = BattleScript_MoveEffectUproar,
    [MOVE_EFFECT_PAYDAY] = BattleScript_MoveEffectPayDay,
    [MOVE_EFFECT_CHARGING] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_WRAP] = BattleScript_MoveEffectWrap,
    [MOVE_EFFECT_RECOIL_25] = BattleScript_MoveEffectRecoil,
    [MOVE_EFFECT_ATK_PLUS_1] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_DEF_PLUS_1] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_SPD_PLUS_1] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_SP_ATK_PLUS_1] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_SP_DEF_PLUS_1] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_ACC_PLUS_1] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_EVS_PLUS_1] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_ATK_MINUS_1] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_DEF_MINUS_1] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_SPD_MINUS_1] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_SP_ATK_MINUS_1] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_SP_DEF_MINUS_1] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_ACC_MINUS_1] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_EVS_MINUS_1] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_RECHARGE] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_RAGE] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_STEAL_ITEM] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_PREVENT_ESCAPE] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_NIGHTMARE] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_ALL_STATS_UP] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_RAPIDSPIN] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_REMOVE_PARALYSIS] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_ATK_DEF_DOWN] = BattleScript_MoveEffectSleep,
    [MOVE_EFFECT_RECOIL_33] = BattleScript_MoveEffectRecoil,
};

// not used
static const struct WindowTemplate sUnusedWinTemplate =
{
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 3,
    .width = 7,
    .height = 15,
    .paletteNum = 31,
    .baseBlock = 0x3F,
};

const u16 gUnknown_82506D0[] = INCBIN_U16("graphics/battle_interface/unk_battlebox.gbapal");
const u32 gUnknown_82506F0[] = INCBIN_U32("graphics/battle_interface/unk_battlebox.4bpp.lz");

// not used
static const u8 sRubyLevelUpStatBoxStats[] =
{
    MON_DATA_MAX_HP, MON_DATA_SPATK, MON_DATA_ATK,
    MON_DATA_SPDEF, MON_DATA_DEF, MON_DATA_SPEED
};

const struct OamData sOamData_MonIconOnLvlUpBox =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
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

#define MON_ICON_LVLUP_BOX_TAG 0xD75A

const struct SpriteTemplate sSpriteTemplate_MonIconOnLvlUpBox =
{
    .tileTag = MON_ICON_LVLUP_BOX_TAG,
    .paletteTag = MON_ICON_LVLUP_BOX_TAG,
    .oam = &sOamData_MonIconOnLvlUpBox,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_MonIconOnLvlUpBox
};

const u16 sProtectSuccessRates[] =
{ 
    USHRT_MAX,
    USHRT_MAX / 2, 
    USHRT_MAX / 4, 
    USHRT_MAX / 8
};

#define MIMIC_FORBIDDEN_END             0xFFFE
#define METRONOME_FORBIDDEN_END         0xFFFF
#define ASSIST_FORBIDDEN_END            0xFFFF

const u16 sMovesForbiddenToCopy[] =
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

const u8 sFlailHpScaleToPowerTable[] =
{
    1, 200,
    4, 150,
    9, 100,
    16, 80,
    32, 40,
    48, 20
};

const u16 sNaturePowerMoves[] =
{
    MOVE_STUN_SPORE,
    MOVE_RAZOR_LEAF,
    MOVE_EARTHQUAKE,
    MOVE_HYDRO_PUMP,
    MOVE_SURF,
    MOVE_BUBBLE_BEAM,
    MOVE_ROCK_SLIDE,
    MOVE_SHADOW_BALL,
    MOVE_SWIFT,
    MOVE_SWIFT
};

const u16 sWeightToDamageTable[] =
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

const struct PickupItem sPickupItems[] =
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

const u8 sTerrainToType[] =
{
    TYPE_GRASS,  // tall grass
    TYPE_GRASS,  // long grass
    TYPE_GROUND, // sand
    TYPE_WATER,  // underwater
    TYPE_WATER,  // water
    TYPE_WATER,  // pond water
    TYPE_ROCK,   // rock
    TYPE_ROCK,   // cave
    TYPE_NORMAL, // building
    TYPE_NORMAL, // plain
};

const u8 sBallCatchBonuses[] =
{
    20, 15, 10, 15 // Ultra, Great, Poke, Safari
};

// not used
static const u32 gUnknown_8250898 = 0xFF7EAE60;

void atk00_attackcanceler(void)
{
    s32 i;

    if (gBattleOutcome)
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
    if (AtkCanceller_UnableToUseMove())
        return;
    if (AbilityBattleEffects(ABILITYEFFECT_MOVES_BLOCK, gBattlerTarget, 0, 0, 0))
        return;
    if (!gBattleMons[gBattlerAttacker].pp[gCurrMovePos] && gCurrentMove != MOVE_STRUGGLE && !(gHitMarker & (HITMARKER_x800000 | HITMARKER_NO_ATTACKSTRING))
     && !(gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS))
    {
        gBattlescriptCurrInstr = BattleScript_NoPPForMove;
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        return;
    }
    gHitMarker &= ~(HITMARKER_x800000);
    if (!(gHitMarker & HITMARKER_OBEYS) 
     && !(gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS))
    {
        i = IsMonDisobedient();
        switch (i)
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
    if (gProtectStructs[gBattlerTarget].bounceMove && gBattleMoves[gCurrentMove].flags & FLAG_MAGICCOAT_AFFECTED)
    {
        PressurePPLose(gBattlerAttacker, gBattlerTarget, MOVE_MAGIC_COAT);
        gProtectStructs[gBattlerTarget].bounceMove = FALSE;
        BattleScriptPushCursor();
        gBattlescriptCurrInstr = BattleScript_MagicCoatBounce;
        return;
    }
    for (i = 0; i < gBattlersCount; ++i)
    {
        if ((gProtectStructs[gBattlerByTurnOrder[i]].stealMove) && gBattleMoves[gCurrentMove].flags & FLAG_SNATCH_AFFECTED)
        {
            PressurePPLose(gBattlerAttacker, gBattlerByTurnOrder[i], MOVE_SNATCH);
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
    else if (DEFENDER_IS_PROTECTED
          && (gCurrentMove != MOVE_CURSE || IS_BATTLER_OF_TYPE(gBattlerAttacker, TYPE_GHOST))
          && ((!IsTwoTurnsMove(gCurrentMove) || (gBattleMons[gBattlerAttacker].status2 & STATUS2_MULTIPLETURNS))))
    {
        CancelMultiTurnMoves(gBattlerAttacker);
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gLastLandedMoves[gBattlerTarget] = 0;
        gLastHitByType[gBattlerTarget] = 0;
        gBattleCommunication[6] = 1;
        ++gBattlescriptCurrInstr;
    }
    else
    {
        ++gBattlescriptCurrInstr;
    }
}

void JumpIfMoveFailed(u8 adder, u16 move)
{
    const u8 *BS_ptr = gBattlescriptCurrInstr + adder;

    if (gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
    {
        gLastLandedMoves[gBattlerTarget] = 0;
        gLastHitByType[gBattlerTarget] = 0;
        BS_ptr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    }
    else
    {
        TrySetDestinyBondToHappen();
        if (AbilityBattleEffects(ABILITYEFFECT_ABSORBING, gBattlerTarget, 0, 0, move))
            return;
    }
    gBattlescriptCurrInstr = BS_ptr;
}

void atk40_jumpifaffectedbyprotect(void)
{
    if (DEFENDER_IS_PROTECTED)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        JumpIfMoveFailed(5, 0);
        gBattleCommunication[6] = 1;
    }
    else
    {
        gBattlescriptCurrInstr += 5;
    }
}

bool8 JumpIfMoveAffectedByProtect(u16 move)
{
    bool8 affected = FALSE;

    if (DEFENDER_IS_PROTECTED)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        JumpIfMoveFailed(7, move);
        gBattleCommunication[6] = 1;
        affected = TRUE;
    }
    return affected;
}

bool8 AccuracyCalcHelper(u16 move)
{
    if (gStatuses3[gBattlerTarget] & STATUS3_ALWAYS_HITS && gDisableStructs[gBattlerTarget].battlerWithSureHit == gBattlerAttacker)
    {
        JumpIfMoveFailed(7, move);
        return TRUE;
    }
    if (!(gHitMarker & HITMARKER_IGNORE_ON_AIR) && gStatuses3[gBattlerTarget] & STATUS3_ON_AIR)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        JumpIfMoveFailed(7, move);
        return TRUE;
    }
    gHitMarker &= ~HITMARKER_IGNORE_ON_AIR;
    if (!(gHitMarker & HITMARKER_IGNORE_UNDERGROUND) && gStatuses3[gBattlerTarget] & STATUS3_UNDERGROUND)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        JumpIfMoveFailed(7, move);
        return TRUE;
    }
    gHitMarker &= ~HITMARKER_IGNORE_UNDERGROUND;
    if (!(gHitMarker & HITMARKER_IGNORE_UNDERWATER) && gStatuses3[gBattlerTarget] & STATUS3_UNDERWATER)
    {
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        JumpIfMoveFailed(7, move);
        return TRUE;
    }
    gHitMarker &= ~HITMARKER_IGNORE_UNDERWATER;
    if ((WEATHER_HAS_EFFECT && (gBattleWeather & WEATHER_RAIN_ANY) && gBattleMoves[move].effect == EFFECT_THUNDER)
     || (gBattleMoves[move].effect == EFFECT_ALWAYS_HIT || gBattleMoves[move].effect == EFFECT_VITAL_THROW))
    {
        JumpIfMoveFailed(7, move);
        return TRUE;
    }
    return FALSE;
}

void atk01_accuracycheck(void)
{
    u16 move = T2_READ_16(gBattlescriptCurrInstr + 5);

    if ((gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE
        && !sub_80EB2E0(1)
        && gBattleMoves[move].power != 0
        && GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
     || (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE
        && !sub_80EB2E0(2)
        && gBattleMoves[move].power == 0
        && GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
     || (gBattleTypeFlags & BATTLE_TYPE_POKEDUDE))
    {
        JumpIfMoveFailed(7, move);
        return;
    }
    if (move == NO_ACC_CALC || move == NO_ACC_CALC_CHECK_LOCK_ON)
    {
        if (gStatuses3[gBattlerTarget] & STATUS3_ALWAYS_HITS && move == NO_ACC_CALC_CHECK_LOCK_ON && gDisableStructs[gBattlerTarget].battlerWithSureHit == gBattlerAttacker)
            gBattlescriptCurrInstr += 7;
        else if (gStatuses3[gBattlerTarget] & (STATUS3_ON_AIR | STATUS3_UNDERGROUND | STATUS3_UNDERWATER))
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
        else if (!JumpIfMoveAffectedByProtect(0))
            gBattlescriptCurrInstr += 7;
    }
    else
    {
        u8 type, moveAcc, holdEffect, param;
        s8 buff;
        u16 calc;

        if (move == 0)
            move = gCurrentMove;
        GET_MOVE_TYPE(move, type);
        if (JumpIfMoveAffectedByProtect(move) || AccuracyCalcHelper(move))
            return;
        if (gBattleMons[gBattlerTarget].status2 & STATUS2_FORESIGHT)
        {
            u8 acc = gBattleMons[gBattlerAttacker].statStages[STAT_ACC];

            buff = acc;
        }
        else
        {
            u8 acc = gBattleMons[gBattlerAttacker].statStages[STAT_ACC];

            buff = acc + 6 - gBattleMons[gBattlerTarget].statStages[STAT_EVASION];
        }
        if (buff < 0)
            buff = 0;
        if (buff > 0xC)
            buff = 0xC;
        moveAcc = gBattleMoves[move].accuracy;
        // check Thunder on sunny weather
        if (WEATHER_HAS_EFFECT && gBattleWeather & WEATHER_SUN_ANY && gBattleMoves[move].effect == EFFECT_THUNDER)
            moveAcc = 50;
        calc = sAccuracyStageRatios[buff].dividend * moveAcc;
        calc /= sAccuracyStageRatios[buff].divisor;
        if (gBattleMons[gBattlerAttacker].ability == ABILITY_COMPOUND_EYES)
            calc = (calc * 130) / 100; // 1.3 compound eyes boost
        if (WEATHER_HAS_EFFECT && gBattleMons[gBattlerTarget].ability == ABILITY_SAND_VEIL && gBattleWeather & WEATHER_SANDSTORM_ANY)
            calc = (calc * 80) / 100; // 1.2 sand veil loss
        if (gBattleMons[gBattlerAttacker].ability == ABILITY_HUSTLE && IS_TYPE_PHYSICAL(type))
            calc = (calc * 80) / 100; // 1.2 hustle loss
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

        if (holdEffect == HOLD_EFFECT_EVASION_UP)
            calc = (calc * (100 - param)) / 100;
        // final calculation
        if ((Random() % 100 + 1) > calc)
        {
            gMoveResultFlags |= MOVE_RESULT_MISSED;
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE 
             && (gBattleMoves[move].target == MOVE_TARGET_BOTH || gBattleMoves[move].target == MOVE_TARGET_FOES_AND_ALLY))
                gBattleCommunication[6] = 2;
            else
                gBattleCommunication[6] = 0;
            CheckWonderGuardAndLevitate();
        }
        JumpIfMoveFailed(7, move);
    }
}

void atk02_attackstring(void)
{
    if (!gBattleControllerExecFlags)
    {
        if (!(gHitMarker & (HITMARKER_NO_ATTACKSTRING | HITMARKER_ATTACKSTRING_PRINTED)))
        {
            PrepareStringBattle(STRINGID_USEDMOVE, gBattlerAttacker);
            gHitMarker |= HITMARKER_ATTACKSTRING_PRINTED;
        }
        ++gBattlescriptCurrInstr;
        gBattleCommunication[MSG_DISPLAY] = 0;
    }
}

 void atk03_ppreduce(void)
{
    s32 ppToDeduct = 1;

    if (!gBattleControllerExecFlags)
    {
        if (!gSpecialStatuses[gBattlerAttacker].ppNotAffectedByPressure)
        {
            switch (gBattleMoves[gCurrentMove].target)
            {
            case MOVE_TARGET_FOES_AND_ALLY:
                ppToDeduct += AbilityBattleEffects(ABILITYEFFECT_COUNT_ON_FIELD, gBattlerAttacker, ABILITY_PRESSURE, 0, 0);
                break;
            case MOVE_TARGET_BOTH:
            case MOVE_TARGET_OPPONENTS_FIELD:
                ppToDeduct += AbilityBattleEffects(ABILITYEFFECT_COUNT_OTHER_SIDE, gBattlerAttacker, ABILITY_PRESSURE, 0, 0);
                break;
            default:
                if (gBattlerAttacker != gBattlerTarget && gBattleMons[gBattlerTarget].ability == ABILITY_PRESSURE)
                    ++ppToDeduct;
                break;
            }
        }
        if (!(gHitMarker & (HITMARKER_NO_PPDEDUCT | HITMARKER_NO_ATTACKSTRING)) && gBattleMons[gBattlerAttacker].pp[gCurrMovePos])
        {
            gProtectStructs[gBattlerAttacker].notFirstStrike = 1;

            if (gBattleMons[gBattlerAttacker].pp[gCurrMovePos] > ppToDeduct)
                gBattleMons[gBattlerAttacker].pp[gCurrMovePos] -= ppToDeduct;
            else
                gBattleMons[gBattlerAttacker].pp[gCurrMovePos] = 0;

            if (!(gBattleMons[gBattlerAttacker].status2 & STATUS2_TRANSFORMED)
                && !((gDisableStructs[gBattlerAttacker].mimickedMoves) & gBitTable[gCurrMovePos]))
            {
                gActiveBattler = gBattlerAttacker;
                BtlController_EmitSetMonData(0, REQUEST_PPMOVE1_BATTLE + gCurrMovePos, 0, 1, &gBattleMons[gBattlerAttacker].pp[gCurrMovePos]);
                MarkBattlerForControllerExec(gBattlerAttacker);
            }
        }
        gHitMarker &= ~(HITMARKER_NO_PPDEDUCT);
        ++gBattlescriptCurrInstr;
    }
}

void atk04_critcalc(void)
{
    u8 holdEffect;
    u16 item, critChance;

    item = gBattleMons[gBattlerAttacker].item;
    if (item == ITEM_ENIGMA_BERRY)
        holdEffect = gEnigmaBerries[gBattlerAttacker].holdEffect;
    else
        holdEffect = ItemId_GetHoldEffect(item);
    gPotentialItemEffectBattler = gBattlerAttacker;
    critChance  = 2 * ((gBattleMons[gBattlerAttacker].status2 & STATUS2_FOCUS_ENERGY) != 0)
                + (gBattleMoves[gCurrentMove].effect == EFFECT_HIGH_CRITICAL)
                + (gBattleMoves[gCurrentMove].effect == EFFECT_SKY_ATTACK)
                + (gBattleMoves[gCurrentMove].effect == EFFECT_BLAZE_KICK)
                + (gBattleMoves[gCurrentMove].effect == EFFECT_POISON_TAIL)
                + (holdEffect == HOLD_EFFECT_SCOPE_LENS)
                + 2 * (holdEffect == HOLD_EFFECT_LUCKY_PUNCH && gBattleMons[gBattlerAttacker].species == SPECIES_CHANSEY)
                + 2 * (holdEffect == HOLD_EFFECT_STICK && gBattleMons[gBattlerAttacker].species == SPECIES_FARFETCHD);
    if (critChance >= NELEMS(sCriticalHitChance))
        critChance = NELEMS(sCriticalHitChance) - 1;
    if ((gBattleMons[gBattlerTarget].ability != ABILITY_BATTLE_ARMOR && gBattleMons[gBattlerTarget].ability != ABILITY_SHELL_ARMOR)
     && !(gStatuses3[gBattlerAttacker] & STATUS3_CANT_SCORE_A_CRIT)
     && !(gBattleTypeFlags & BATTLE_TYPE_OLDMAN_TUTORIAL)
     && !(Random() % sCriticalHitChance[critChance])
     && (!(gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE) || sub_80EB2E0(1))
     && !(gBattleTypeFlags & BATTLE_TYPE_POKEDUDE))
        gCritMultiplier = 2;
    else
        gCritMultiplier = 1;
    ++gBattlescriptCurrInstr;
}

void atk05_damagecalc(void)
{
    u16 sideStatus = gSideStatuses[GET_BATTLER_SIDE(gBattlerTarget)];

    gBattleMoveDamage = CalculateBaseDamage(&gBattleMons[gBattlerAttacker],
                                            &gBattleMons[gBattlerTarget],
                                            gCurrentMove,
                                            sideStatus,
                                            gDynamicBasePower,
                                            gBattleStruct->dynamicMoveType,
                                            gBattlerAttacker,
                                            gBattlerTarget);
    gBattleMoveDamage = gBattleMoveDamage * gCritMultiplier * gBattleScripting.dmgMultiplier;
    if (gStatuses3[gBattlerAttacker] & STATUS3_CHARGED_UP && gBattleMoves[gCurrentMove].type == TYPE_ELECTRIC)
        gBattleMoveDamage *= 2;
    if (gProtectStructs[gBattlerAttacker].helpingHand)
        gBattleMoveDamage = gBattleMoveDamage * 15 / 10;
    ++gBattlescriptCurrInstr;
}

void AI_CalcDmg(u8 attacker, u8 defender)
{
    u16 sideStatus = gSideStatuses[GET_BATTLER_SIDE(defender)];

    gBattleMoveDamage = CalculateBaseDamage(&gBattleMons[attacker],
                                            &gBattleMons[defender],
                                            gCurrentMove,
                                            sideStatus,
                                            gDynamicBasePower,
                                            gBattleStruct->dynamicMoveType,
                                            attacker,
                                            defender);
    gDynamicBasePower = 0;
    gBattleMoveDamage = gBattleMoveDamage * gCritMultiplier * gBattleScripting.dmgMultiplier;
    if (gStatuses3[attacker] & STATUS3_CHARGED_UP && gBattleMoves[gCurrentMove].type == TYPE_ELECTRIC)
        gBattleMoveDamage *= 2;
    if (gProtectStructs[attacker].helpingHand)
        gBattleMoveDamage = gBattleMoveDamage * 15 / 10;
}

void ModulateDmgByType(u8 multiplier)
{
    gBattleMoveDamage = gBattleMoveDamage * multiplier / 10;
    if (gBattleMoveDamage == 0 && multiplier)
        gBattleMoveDamage = 1;
    switch (multiplier)
    {
    case TYPE_MUL_NO_EFFECT:
        gMoveResultFlags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
        gMoveResultFlags &= ~MOVE_RESULT_NOT_VERY_EFFECTIVE;
        gMoveResultFlags &= ~MOVE_RESULT_SUPER_EFFECTIVE;
        break;
    case TYPE_MUL_NOT_EFFECTIVE:
        if (gBattleMoves[gCurrentMove].power && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
        {
            if (gMoveResultFlags & MOVE_RESULT_SUPER_EFFECTIVE)
                gMoveResultFlags &= ~MOVE_RESULT_SUPER_EFFECTIVE;
            else
                gMoveResultFlags |= MOVE_RESULT_NOT_VERY_EFFECTIVE;
        }
        break;
    case TYPE_MUL_SUPER_EFFECTIVE:
        if (gBattleMoves[gCurrentMove].power && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
        {
            if (gMoveResultFlags & MOVE_RESULT_NOT_VERY_EFFECTIVE)
                gMoveResultFlags &= ~MOVE_RESULT_NOT_VERY_EFFECTIVE;
            else
                gMoveResultFlags |= MOVE_RESULT_SUPER_EFFECTIVE;
        }
        break;
    }
}

void atk06_typecalc(void)
{
    s32 i = 0;
    u8 moveType;

    if (gCurrentMove == MOVE_STRUGGLE)
    {
        ++gBattlescriptCurrInstr;
        return;
    }
    GET_MOVE_TYPE(gCurrentMove, moveType);
    // check stab
    if (IS_BATTLER_OF_TYPE(gBattlerAttacker, moveType))
    {
        gBattleMoveDamage = gBattleMoveDamage * 15;
        gBattleMoveDamage = gBattleMoveDamage / 10;
    }

    if (gBattleMons[gBattlerTarget].ability == ABILITY_LEVITATE && moveType == TYPE_GROUND)
    {
        gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
        gMoveResultFlags |= (MOVE_RESULT_MISSED | MOVE_RESULT_DOESNT_AFFECT_FOE);
        gLastLandedMoves[gBattlerTarget] = 0;
        gLastHitByType[gBattlerTarget] = 0;
        gBattleCommunication[6] = moveType;
        RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
    }
    else
    {
        while (TYPE_EFFECT_ATK_TYPE(i) != TYPE_ENDTABLE)
        {
            if (TYPE_EFFECT_ATK_TYPE(i) == TYPE_FORESIGHT)
            {
                if (gBattleMons[gBattlerTarget].status2 & STATUS2_FORESIGHT)
                    break;
                i += 3;
                continue;
            }
            else if (TYPE_EFFECT_ATK_TYPE(i) == moveType)
            {
                // check type1
                if (TYPE_EFFECT_DEF_TYPE(i) == gBattleMons[gBattlerTarget].type1)
                    ModulateDmgByType(TYPE_EFFECT_MULTIPLIER(i));
                // check type2
                if (TYPE_EFFECT_DEF_TYPE(i) == gBattleMons[gBattlerTarget].type2 &&
                    gBattleMons[gBattlerTarget].type1 != gBattleMons[gBattlerTarget].type2)
                    ModulateDmgByType(TYPE_EFFECT_MULTIPLIER(i));
            }
            i += 3;
        }
    }
    if (gBattleMons[gBattlerTarget].ability == ABILITY_WONDER_GUARD && AttacksThisTurn(gBattlerAttacker, gCurrentMove) == 2
     && (!(gMoveResultFlags & MOVE_RESULT_SUPER_EFFECTIVE) || ((gMoveResultFlags & (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE)) == (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE)))
     && gBattleMoves[gCurrentMove].power)
    {
        gLastUsedAbility = ABILITY_WONDER_GUARD;
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gLastLandedMoves[gBattlerTarget] = 0;
        gLastHitByType[gBattlerTarget] = 0;
        gBattleCommunication[6] = 3;
        RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
    }
    if (gMoveResultFlags & MOVE_RESULT_DOESNT_AFFECT_FOE)
        gProtectStructs[gBattlerAttacker].targetNotAffected = 1;
    ++gBattlescriptCurrInstr;
}

void CheckWonderGuardAndLevitate(void)
{
    u8 flags = 0;
    s32 i = 0;
    u8 moveType;

    if (gCurrentMove == MOVE_STRUGGLE || !gBattleMoves[gCurrentMove].power)
        return;
    GET_MOVE_TYPE(gCurrentMove, moveType);
    if (gBattleMons[gBattlerTarget].ability == ABILITY_LEVITATE && moveType == TYPE_GROUND)
    {
        gLastUsedAbility = ABILITY_LEVITATE;
        gBattleCommunication[6] = moveType;
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
        if (((flags & 2) || !(flags & 1)) && gBattleMoves[gCurrentMove].power)
        {
            gLastUsedAbility = ABILITY_WONDER_GUARD;
            gBattleCommunication[6] = 3;
            RecordAbilityBattle(gBattlerTarget, ABILITY_WONDER_GUARD);
        }
    }
}

// same as ModulateDmgByType except different arguments
void ModulateDmgByType2(u8 multiplier, u16 move, u8 *flags)
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
        if (gBattleMoves[move].power && !(*flags & MOVE_RESULT_NO_EFFECT))
        {
            if (*flags & MOVE_RESULT_SUPER_EFFECTIVE)
                *flags &= ~MOVE_RESULT_SUPER_EFFECTIVE;
            else
                *flags |= MOVE_RESULT_NOT_VERY_EFFECTIVE;
        }
        break;
    case TYPE_MUL_SUPER_EFFECTIVE:
        if (gBattleMoves[move].power && !(*flags & MOVE_RESULT_NO_EFFECT))
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
    moveType = gBattleMoves[move].type;
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
    if (gBattleMons[defender].ability == ABILITY_WONDER_GUARD
     && !(flags & MOVE_RESULT_MISSED)
     && AttacksThisTurn(attacker, move) == 2
     && (!(flags & MOVE_RESULT_SUPER_EFFECTIVE) || ((flags & (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE)) == (MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE)))
     && gBattleMoves[move].power)
        flags |= MOVE_RESULT_MISSED;
    return flags;
}

u8 AI_TypeCalc(u16 move, u16 targetSpecies, u8 targetAbility)
{
    s32 i = 0;
    u8 flags = 0;
    u8 type1 = gBaseStats[targetSpecies].type1, type2 = gBaseStats[targetSpecies].type2;
    u8 moveType;

    if (move == MOVE_STRUGGLE)
        return 0;
    moveType = gBattleMoves[move].type;
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
     && gBattleMoves[move].power)
        flags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
    return flags;
}

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

void Unused_ApplyRandomDmgMultiplier(void)
{
    ApplyRandomDmgMultiplier();
}

void atk07_adjustnormaldamage(void)
{
    u8 holdEffect, param;

    ApplyRandomDmgMultiplier();
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
     && (gBattleMoves[gCurrentMove].effect == EFFECT_FALSE_SWIPE || gProtectStructs[gBattlerTarget].endured || gSpecialStatuses[gBattlerTarget].focusBanded)
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
    ++gBattlescriptCurrInstr;
}

// The same as 0x7 except it doesn't check for false swipe move effect.
void atk08_adjustnormaldamage2(void)
{
    u8 holdEffect, param;

    ApplyRandomDmgMultiplier();
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
     && (gProtectStructs[gBattlerTarget].endured || gSpecialStatuses[gBattlerTarget].focusBanded)
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
    ++gBattlescriptCurrInstr;
}

void atk09_attackanimation(void)
{
    if (!gBattleControllerExecFlags)
    {
        if ((gHitMarker & HITMARKER_NO_ANIMATIONS) && (gCurrentMove != MOVE_TRANSFORM && gCurrentMove != MOVE_SUBSTITUTE))
        {
            BattleScriptPush(gBattlescriptCurrInstr + 1);
            gBattlescriptCurrInstr = BattleScript_Pausex20;
            ++gBattleScripting.animTurn;
            ++gBattleScripting.animTargetsHit;
        }
        else
        {
            if ((gBattleMoves[gCurrentMove].target & MOVE_TARGET_BOTH
                || gBattleMoves[gCurrentMove].target & MOVE_TARGET_FOES_AND_ALLY
                || gBattleMoves[gCurrentMove].target & MOVE_TARGET_DEPENDS)
             && gBattleScripting.animTargetsHit)
            {
                ++gBattlescriptCurrInstr;
                return;
            }
            if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
            {
                gActiveBattler = gBattlerAttacker;
                BtlController_EmitMoveAnimation(0, gCurrentMove, gBattleScripting.animTurn, gBattleMovePower, gBattleMoveDamage, gBattleMons[gBattlerAttacker].friendship, &gDisableStructs[gBattlerAttacker]);
                ++gBattleScripting.animTurn;
                ++gBattleScripting.animTargetsHit;
                MarkBattlerForControllerExec(gBattlerAttacker);
                ++gBattlescriptCurrInstr;
            }
            else
            {
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_Pausex20;
            }
        }
    }
}

void atk0A_waitanimation(void)
{
    if (!gBattleControllerExecFlags)
        ++gBattlescriptCurrInstr;
}

void atk0B_healthbarupdate(void)
{
    if (!gBattleControllerExecFlags)
    {
        if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
        {
            gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);

            if (gBattleMons[gActiveBattler].status2 & STATUS2_SUBSTITUTE && gDisableStructs[gActiveBattler].substituteHP && !(gHitMarker & HITMARKER_IGNORE_SUBSTITUTE))
            {
                PrepareStringBattle(STRINGID_SUBSTITUTEDAMAGED, gActiveBattler);
            }
            else
            {
                s16 healthValue;
                s32 currDmg = gBattleMoveDamage;
                s32 maxPossibleDmgValue = 10000; // not present in R/S, ensures that huge damage values don't change sign
                
                if (currDmg <= maxPossibleDmgValue)
                    healthValue = currDmg;
                else
                    healthValue = maxPossibleDmgValue;
                BtlController_EmitHealthBarUpdate(0, healthValue);
                MarkBattlerForControllerExec(gActiveBattler);
                if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER && gBattleMoveDamage > 0)
                    gBattleResults.playerMonWasDamaged = TRUE;
            }
        }
        gBattlescriptCurrInstr += 2;
    }
}

void atk0C_datahpupdate(void)
{
    u32 moveType;

    if (!gBattleControllerExecFlags)
    {
        if (gBattleStruct->dynamicMoveType == 0)
            moveType = gBattleMoves[gCurrentMove].type;
        else if (!(gBattleStruct->dynamicMoveType & 0x40))
            moveType = gBattleStruct->dynamicMoveType & 0x3F;
        else
            moveType = gBattleMoves[gCurrentMove].type;
        if (!(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
        {
            gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
            if (gBattleMons[gActiveBattler].status2 & STATUS2_SUBSTITUTE && gDisableStructs[gActiveBattler].substituteHP && !(gHitMarker & HITMARKER_IGNORE_SUBSTITUTE))
            {
                if (gDisableStructs[gActiveBattler].substituteHP >= gBattleMoveDamage)
                {
                    if (gSpecialStatuses[gActiveBattler].dmg == 0)
                        gSpecialStatuses[gActiveBattler].dmg = gBattleMoveDamage;
                    gDisableStructs[gActiveBattler].substituteHP -= gBattleMoveDamage;
                    gHpDealt = gBattleMoveDamage;
                }
                else
                {
                    if (gSpecialStatuses[gActiveBattler].dmg == 0)
                        gSpecialStatuses[gActiveBattler].dmg = gDisableStructs[gActiveBattler].substituteHP;
                    gHpDealt = gDisableStructs[gActiveBattler].substituteHP;
                    gDisableStructs[gActiveBattler].substituteHP = 0;
                }
                // check substitute fading
                if (gDisableStructs[gActiveBattler].substituteHP == 0)
                {
                    gBattlescriptCurrInstr += 2;
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_SubstituteFade;
                    return;
                }
            }
            else
            {
                gHitMarker &= ~(HITMARKER_IGNORE_SUBSTITUTE);
                if (gBattleMoveDamage < 0) // hp goes up
                {
                    gBattleMons[gActiveBattler].hp -= gBattleMoveDamage;
                    if (gBattleMons[gActiveBattler].hp > gBattleMons[gActiveBattler].maxHP)
                        gBattleMons[gActiveBattler].hp = gBattleMons[gActiveBattler].maxHP;

                }
                else // hp goes down
                {
                    if (gHitMarker & HITMARKER_x20)
                    {
                        gHitMarker &= ~(HITMARKER_x20);
                    }
                    else
                    {
                        gTakenDmg[gActiveBattler] += gBattleMoveDamage;
                        if (gBattlescriptCurrInstr[1] == BS_TARGET)
                            gTakenDmgByBattler[gActiveBattler] = gBattlerAttacker;
                        else
                            gTakenDmgByBattler[gActiveBattler] = gBattlerTarget;
                    }

                    if (gBattleMons[gActiveBattler].hp > gBattleMoveDamage)
                    {
                        gBattleMons[gActiveBattler].hp -= gBattleMoveDamage;
                        gHpDealt = gBattleMoveDamage;
                    }
                    else
                    {
                        gHpDealt = gBattleMons[gActiveBattler].hp;
                        gBattleMons[gActiveBattler].hp = 0;
                    }
                    if (!gSpecialStatuses[gActiveBattler].dmg && !(gHitMarker & HITMARKER_x100000))
                        gSpecialStatuses[gActiveBattler].dmg = gHpDealt;
                    if (IS_TYPE_PHYSICAL(moveType) && !(gHitMarker & HITMARKER_x100000) && gCurrentMove != MOVE_PAIN_SPLIT)
                    {
                        gProtectStructs[gActiveBattler].physicalDmg = gHpDealt;
                        gSpecialStatuses[gActiveBattler].physicalDmg = gHpDealt;
                        if (gBattlescriptCurrInstr[1] == BS_TARGET)
                        {
                            gProtectStructs[gActiveBattler].physicalBattlerId = gBattlerAttacker;
                            gSpecialStatuses[gActiveBattler].physicalBattlerId = gBattlerAttacker;
                        }
                        else
                        {
                            gProtectStructs[gActiveBattler].physicalBattlerId = gBattlerTarget;
                            gSpecialStatuses[gActiveBattler].physicalBattlerId = gBattlerTarget;
                        }
                    }
                    else if (!IS_TYPE_PHYSICAL(moveType) && !(gHitMarker & HITMARKER_x100000))
                    {
                        gProtectStructs[gActiveBattler].specialDmg = gHpDealt;
                        gSpecialStatuses[gActiveBattler].specialDmg = gHpDealt;
                        if (gBattlescriptCurrInstr[1] == BS_TARGET)
                        {
                            gProtectStructs[gActiveBattler].specialBattlerId = gBattlerAttacker;
                            gSpecialStatuses[gActiveBattler].specialBattlerId = gBattlerAttacker;
                        }
                        else
                        {
                            gProtectStructs[gActiveBattler].specialBattlerId = gBattlerTarget;
                            gSpecialStatuses[gActiveBattler].specialBattlerId = gBattlerTarget;
                        }
                    }
                }
                gHitMarker &= ~(HITMARKER_x100000);
                BtlController_EmitSetMonData(0, REQUEST_HP_BATTLE, 0, 2, &gBattleMons[gActiveBattler].hp);
                MarkBattlerForControllerExec(gActiveBattler);
            }
        }
        else
        {
            gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
            if (gSpecialStatuses[gActiveBattler].dmg == 0)
                gSpecialStatuses[gActiveBattler].dmg = 0xFFFF;
        }
        gBattlescriptCurrInstr += 2;
    }
}

void atk0D_critmessage(void)
{
    if (!gBattleControllerExecFlags)
    {
        if (gCritMultiplier == 2 && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
        {
            PrepareStringBattle(STRINGID_CRITICALHIT, gBattlerAttacker);
            gBattleCommunication[MSG_DISPLAY] = 1;
        }
        ++gBattlescriptCurrInstr;
    }
}

void atk0E_effectivenesssound(void)
{
    if (!gBattleControllerExecFlags)
    {
        gActiveBattler = gBattlerTarget;
        if (!(gMoveResultFlags & MOVE_RESULT_MISSED))
        {
            switch (gMoveResultFlags & (u8)(~(MOVE_RESULT_MISSED)))
            {
            case MOVE_RESULT_SUPER_EFFECTIVE:
                BtlController_EmitPlaySE(0, SE_KOUKA_H);
                MarkBattlerForControllerExec(gActiveBattler);
                break;
            case MOVE_RESULT_NOT_VERY_EFFECTIVE:
                BtlController_EmitPlaySE(0, SE_KOUKA_L);
                MarkBattlerForControllerExec(gActiveBattler);
                break;
            case MOVE_RESULT_DOESNT_AFFECT_FOE:
            case MOVE_RESULT_FAILED:
                // no sound
                break;
            case MOVE_RESULT_FOE_ENDURED:
            case MOVE_RESULT_ONE_HIT_KO:
            case MOVE_RESULT_FOE_HUNG_ON:
            default:
                if (gMoveResultFlags & MOVE_RESULT_SUPER_EFFECTIVE)
                {
                    BtlController_EmitPlaySE(0, SE_KOUKA_H);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
                else if (gMoveResultFlags & MOVE_RESULT_NOT_VERY_EFFECTIVE)
                {
                    BtlController_EmitPlaySE(0, SE_KOUKA_L);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
                else if (!(gMoveResultFlags & (MOVE_RESULT_DOESNT_AFFECT_FOE | MOVE_RESULT_FAILED)))
                {
                    BtlController_EmitPlaySE(0, SE_KOUKA_M);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
                break;
            }
        }
        ++gBattlescriptCurrInstr;
    }
}

void atk0F_resultmessage(void)
{
    u32 stringId = 0;

    if (!gBattleControllerExecFlags)
    {
        if (gMoveResultFlags & MOVE_RESULT_MISSED && (!(gMoveResultFlags & MOVE_RESULT_DOESNT_AFFECT_FOE) || gBattleCommunication[6] > 2))
        {
            stringId = gMissStringIds[gBattleCommunication[6]];
            gBattleCommunication[MSG_DISPLAY] = 1;
        }
        else
        {
            gBattleCommunication[MSG_DISPLAY] = 1;
            switch (gMoveResultFlags & (u8)(~(MOVE_RESULT_MISSED)))
            {
            case MOVE_RESULT_SUPER_EFFECTIVE:
                stringId = STRINGID_SUPEREFFECTIVE;
                break;
            case MOVE_RESULT_NOT_VERY_EFFECTIVE:
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
                    gMoveResultFlags &= ~(MOVE_RESULT_ONE_HIT_KO);
                    gMoveResultFlags &= ~(MOVE_RESULT_SUPER_EFFECTIVE);
                    gMoveResultFlags &= ~(MOVE_RESULT_NOT_VERY_EFFECTIVE);
                    BattleScriptPushCursor();
                    gBattlescriptCurrInstr = BattleScript_OneHitKOMsg;
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
                else
                {
                    gBattleCommunication[MSG_DISPLAY] = 0;
                }
            }
        }
        if (stringId)
            PrepareStringBattle(stringId, gBattlerAttacker);
        ++gBattlescriptCurrInstr;
    }
}

void atk10_printstring(void)
{
    if (!gBattleControllerExecFlags)
    {
        u16 var = T2_READ_16(gBattlescriptCurrInstr + 1);
        PrepareStringBattle(var, gBattlerAttacker);
        gBattlescriptCurrInstr += 3;
        gBattleCommunication[MSG_DISPLAY] = 1;
    }
}

void atk11_printselectionstring(void)
{
    gActiveBattler = gBattlerAttacker;
    BtlController_EmitPrintSelectionString(0, T2_READ_16(gBattlescriptCurrInstr + 1));
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 3;
    gBattleCommunication[MSG_DISPLAY] = 1;
}

void atk12_waitmessage(void)
{
    if (!gBattleControllerExecFlags)
    {
        if (!gBattleCommunication[MSG_DISPLAY])
        {
            gBattlescriptCurrInstr += 3;
        }
        else
        {
            u16 toWait = T2_READ_16(gBattlescriptCurrInstr + 1);
            if (++gPauseCounterBattle >= toWait)
            {
                gPauseCounterBattle = 0;
                gBattlescriptCurrInstr += 3;
                gBattleCommunication[MSG_DISPLAY] = 0;
            }
        }
    }
}

void atk13_printfromtable(void)
{
    if (!gBattleControllerExecFlags)
    {
        const u16 *ptr = (const u16 *) T1_READ_PTR(gBattlescriptCurrInstr + 1);

        ptr += gBattleCommunication[MULTISTRING_CHOOSER];
        PrepareStringBattle(*ptr, gBattlerAttacker);
        gBattlescriptCurrInstr += 5;
        gBattleCommunication[MSG_DISPLAY] = 1;
    }
}

void atk14_printselectionstringfromtable(void)
{
    if (!gBattleControllerExecFlags)
    {
        const u16 *ptr = (const u16 *) T1_READ_PTR(gBattlescriptCurrInstr + 1);

        ptr += gBattleCommunication[MULTISTRING_CHOOSER];
        gActiveBattler = gBattlerAttacker;
        BtlController_EmitPrintSelectionString(0, *ptr);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 5;
        gBattleCommunication[MSG_DISPLAY] = 1;
    }
}

u8 GetBattlerTurnOrderNum(u8 battlerId)
{
    s32 i;
    
    for (i = 0; i < gBattlersCount && gBattlerByTurnOrder[i] != battlerId; ++i);
    return i;
}

void SetMoveEffect(bool8 primary, u8 certain)
{
    bool32 statusChanged = FALSE;
    u8 affectsUser = 0; // 0x40 otherwise
    bool32 noSunCanFreeze = TRUE;

    if (gBattleCommunication[MOVE_EFFECT_BYTE] & MOVE_EFFECT_AFFECTS_USER)
    {
        gEffectBattler = gBattlerAttacker; // battlerId that effects get applied on
        gBattleCommunication[MOVE_EFFECT_BYTE] &= ~(MOVE_EFFECT_AFFECTS_USER);
        affectsUser = MOVE_EFFECT_AFFECTS_USER;
        gBattleScripting.battler = gBattlerTarget; // theoretically the attacker
    }
    else
    {
        gEffectBattler = gBattlerTarget;
        gBattleScripting.battler = gBattlerAttacker;
    }
    if (gBattleTypeFlags & BATTLE_TYPE_POKEDUDE
     && gBattleCommunication[MOVE_EFFECT_BYTE] != 1
     && GetBattlerSide(gEffectBattler) == B_SIDE_OPPONENT)
    {
        ++gBattlescriptCurrInstr;
        return;
    }
    if (gBattleMons[gEffectBattler].ability == ABILITY_SHIELD_DUST 
     && !(gHitMarker & HITMARKER_IGNORE_SAFEGUARD)
     && !primary
     && gBattleCommunication[MOVE_EFFECT_BYTE] <= 9)
    {
        ++gBattlescriptCurrInstr;
        return;
    }
    if (gSideStatuses[GET_BATTLER_SIDE(gEffectBattler)] & SIDE_STATUS_SAFEGUARD
     && !(gHitMarker & HITMARKER_IGNORE_SAFEGUARD)
     && !primary
     && gBattleCommunication[MOVE_EFFECT_BYTE] <= 7)
    {
        ++gBattlescriptCurrInstr;
        return;
    }
    if (gBattleMons[gEffectBattler].hp == 0
     && gBattleCommunication[MOVE_EFFECT_BYTE] != MOVE_EFFECT_PAYDAY
     && gBattleCommunication[MOVE_EFFECT_BYTE] != MOVE_EFFECT_STEAL_ITEM)
    {
        ++gBattlescriptCurrInstr;
        return;
    }
    if (gBattleMons[gEffectBattler].status2 & STATUS2_SUBSTITUTE
     && affectsUser != MOVE_EFFECT_AFFECTS_USER)
    {
        ++gBattlescriptCurrInstr;
        return;
    }
    if (gBattleCommunication[MOVE_EFFECT_BYTE] <= 6) // status change
    {
        switch (sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]])
        {
        case STATUS1_SLEEP:
            // check active uproar
            if (gBattleMons[gEffectBattler].ability != ABILITY_SOUNDPROOF)
                for (gActiveBattler = 0;
                    gActiveBattler < gBattlersCount && !(gBattleMons[gActiveBattler].status2 & STATUS2_UPROAR);
                    ++gActiveBattler);
            else
                gActiveBattler = gBattlersCount;
            if (gBattleMons[gEffectBattler].status1)
                break;
            if (gActiveBattler != gBattlersCount)
                break;
            if (gBattleMons[gEffectBattler].ability == ABILITY_VITAL_SPIRIT)
                break;
            if (gBattleMons[gEffectBattler].ability == ABILITY_INSOMNIA)
                break;
            CancelMultiTurnMoves(gEffectBattler);
            statusChanged = TRUE;
            break;
        case STATUS1_POISON:
            if (gBattleMons[gEffectBattler].ability == ABILITY_IMMUNITY
             && (primary == TRUE || certain == MOVE_EFFECT_CERTAIN))
            {
                gLastUsedAbility = ABILITY_IMMUNITY;
                RecordAbilityBattle(gEffectBattler, ABILITY_IMMUNITY);
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_PSNPrevention;
                if (gHitMarker & HITMARKER_IGNORE_SAFEGUARD)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                    gHitMarker &= ~(HITMARKER_IGNORE_SAFEGUARD);
                }
                else
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                }
                return;
            }
            if ((IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_POISON) || IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_STEEL))
             && (gHitMarker & HITMARKER_IGNORE_SAFEGUARD)
             && (primary == TRUE || certain == MOVE_EFFECT_CERTAIN))
            {
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_PSNPrevention;
                gBattleCommunication[MULTISTRING_CHOOSER] = 2;
                return;
            }
            if (IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_POISON))
                break;
            if (IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_STEEL))
                break;
            if (gBattleMons[gEffectBattler].status1)
                break;
            if (gBattleMons[gEffectBattler].ability == ABILITY_IMMUNITY)
                break;
            statusChanged = TRUE;
            break;
        case STATUS1_BURN:
            if (gBattleMons[gEffectBattler].ability == ABILITY_WATER_VEIL
             && (primary == TRUE || certain == MOVE_EFFECT_CERTAIN))
            {
                gLastUsedAbility = ABILITY_WATER_VEIL;
                RecordAbilityBattle(gEffectBattler, ABILITY_WATER_VEIL);
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_BRNPrevention;
                if (gHitMarker & HITMARKER_IGNORE_SAFEGUARD)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                    gHitMarker &= ~(HITMARKER_IGNORE_SAFEGUARD);
                }
                else
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                }
                return;
            }
            if (IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_FIRE)
             && (gHitMarker & HITMARKER_IGNORE_SAFEGUARD)
             && (primary == TRUE || certain == MOVE_EFFECT_CERTAIN))
            {
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_BRNPrevention;
                gBattleCommunication[MULTISTRING_CHOOSER] = 2;
                return;
            }
            if (IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_FIRE))
                break;
            if (gBattleMons[gEffectBattler].ability == ABILITY_WATER_VEIL)
                break;
            if (gBattleMons[gEffectBattler].status1)
                break;
            statusChanged = TRUE;
            break;
        case STATUS1_FREEZE:
            if (WEATHER_HAS_EFFECT && gBattleWeather & WEATHER_SUN_ANY)
                noSunCanFreeze = FALSE;
            if (IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_ICE))
                break;
            if (gBattleMons[gEffectBattler].status1)
                break;
            if (noSunCanFreeze == 0)
                break;
            if (gBattleMons[gEffectBattler].ability == ABILITY_MAGMA_ARMOR)
                break;
            CancelMultiTurnMoves(gEffectBattler);
            statusChanged = TRUE;
            break;
        case STATUS1_PARALYSIS:
            if (gBattleMons[gEffectBattler].ability == ABILITY_LIMBER)
            {
                if (primary == TRUE || certain == MOVE_EFFECT_CERTAIN)
                {
                    gLastUsedAbility = ABILITY_LIMBER;
                    RecordAbilityBattle(gEffectBattler, ABILITY_LIMBER);
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_PRLZPrevention;
                    if (gHitMarker & HITMARKER_IGNORE_SAFEGUARD)
                    {
                        gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                        gHitMarker &= ~(HITMARKER_IGNORE_SAFEGUARD);
                    }
                    else
                    {
                        gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                    }
                    return;
                }
                else
                    break;
            }
            if (gBattleMons[gEffectBattler].status1)
                break;
            statusChanged = TRUE;
            break;
        case STATUS1_TOXIC_POISON:
            if (gBattleMons[gEffectBattler].ability == ABILITY_IMMUNITY && (primary == TRUE || certain == MOVE_EFFECT_CERTAIN))
            {
                gLastUsedAbility = ABILITY_IMMUNITY;
                RecordAbilityBattle(gEffectBattler, ABILITY_IMMUNITY);
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_PSNPrevention;
                if (gHitMarker & HITMARKER_IGNORE_SAFEGUARD)
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                    gHitMarker &= ~(HITMARKER_IGNORE_SAFEGUARD);
                }
                else
                {
                    gBattleCommunication[MULTISTRING_CHOOSER] = 0;
                }
                return;
            }
            if ((IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_POISON) || IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_STEEL))
             && (gHitMarker & HITMARKER_IGNORE_SAFEGUARD)
             && (primary == TRUE || certain == MOVE_EFFECT_CERTAIN))
            {
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_PSNPrevention;
                gBattleCommunication[MULTISTRING_CHOOSER] = 2;
                return;
            }
            if (gBattleMons[gEffectBattler].status1)
                break;
            if (!IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_POISON) && !IS_BATTLER_OF_TYPE(gEffectBattler, TYPE_STEEL))
            {
                if (gBattleMons[gEffectBattler].ability == ABILITY_IMMUNITY)
                    break;
                // It's redundant, because at this point we know the status1 value is 0.
                gBattleMons[gEffectBattler].status1 &= ~(STATUS1_TOXIC_POISON);
                gBattleMons[gEffectBattler].status1 &= ~(STATUS1_POISON);
                statusChanged = TRUE;
                break;
            }
            else
            {
                gMoveResultFlags |= MOVE_RESULT_DOESNT_AFFECT_FOE;
            }
            break;
        }
        if (statusChanged == TRUE)
        {
            BattleScriptPush(gBattlescriptCurrInstr + 1);
            if (sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]] == STATUS1_SLEEP)
                gBattleMons[gEffectBattler].status1 |= ((Random() & 3) + 2);
            else
                gBattleMons[gEffectBattler].status1 |= sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]];
            gBattlescriptCurrInstr = sMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
            gActiveBattler = gEffectBattler;
            BtlController_EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gEffectBattler].status1);
            MarkBattlerForControllerExec(gActiveBattler);
            if (gHitMarker & HITMARKER_IGNORE_SAFEGUARD)
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = 1;
                gHitMarker &= ~(HITMARKER_IGNORE_SAFEGUARD);
            }
            else
            {
                gBattleCommunication[MULTISTRING_CHOOSER] = 0;
            }
            // for synchronize
            if (gBattleCommunication[MOVE_EFFECT_BYTE] == MOVE_EFFECT_POISON
             || gBattleCommunication[MOVE_EFFECT_BYTE] == MOVE_EFFECT_TOXIC
             || gBattleCommunication[MOVE_EFFECT_BYTE] == MOVE_EFFECT_PARALYSIS
             || gBattleCommunication[MOVE_EFFECT_BYTE] == MOVE_EFFECT_BURN)
             {
                u8 *synchronizeEffect = &gBattleStruct->synchronizeMoveEffect;
                *synchronizeEffect = gBattleCommunication[MOVE_EFFECT_BYTE];
                gHitMarker |= HITMARKER_SYNCHRONISE_EFFECT;
             }
            return;
        }
        else if (statusChanged == FALSE)
        {
            ++gBattlescriptCurrInstr;
            return;
        }
        return;
    }
    else
    {
        if (gBattleMons[gEffectBattler].status2 & sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]])
        {
            ++gBattlescriptCurrInstr;
        }
        else
        {
            u8 side;
            switch (gBattleCommunication[MOVE_EFFECT_BYTE])
            {
            case MOVE_EFFECT_CONFUSION:
                if (gBattleMons[gEffectBattler].ability == ABILITY_OWN_TEMPO
                 || gBattleMons[gEffectBattler].status2 & STATUS2_CONFUSION)
                {
                    ++gBattlescriptCurrInstr;
                }
                else
                {
                    gBattleMons[gEffectBattler].status2 |= (((Random()) % 0x4)) + 2;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = sMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
                }
                break;
            case MOVE_EFFECT_FLINCH:
                if (gBattleMons[gEffectBattler].ability == ABILITY_INNER_FOCUS)
                {
                    if (primary == TRUE || certain == MOVE_EFFECT_CERTAIN)
                    {
                        gLastUsedAbility = ABILITY_INNER_FOCUS;
                        RecordAbilityBattle(gEffectBattler, ABILITY_INNER_FOCUS);
                        gBattlescriptCurrInstr = BattleScript_FlinchPrevention;
                    }
                    else
                    {
                        ++gBattlescriptCurrInstr;
                    }
                }
                else
                {
                    if (GetBattlerTurnOrderNum(gEffectBattler) > gCurrentTurnActionNumber)
                        gBattleMons[gEffectBattler].status2 |= sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]];
                    ++gBattlescriptCurrInstr;
                }
                break;
            case MOVE_EFFECT_UPROAR:
                if (!(gBattleMons[gEffectBattler].status2 & STATUS2_UPROAR))
                {
                    gBattleMons[gEffectBattler].status2 |= STATUS2_MULTIPLETURNS;
                    gLockedMoves[gEffectBattler] = gCurrentMove;
                    gBattleMons[gEffectBattler].status2 |= ((Random() & 3) + 2) << 4;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = sMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
                }
                else
                {
                    ++gBattlescriptCurrInstr;
                }
                break;
            case MOVE_EFFECT_PAYDAY:
                if (GET_BATTLER_SIDE(gBattlerAttacker) == B_SIDE_PLAYER)
                {
                    u16 PayDay = gPaydayMoney;
                    gPaydayMoney += (gBattleMons[gBattlerAttacker].level * 5);
                    if (PayDay > gPaydayMoney)
                        gPaydayMoney = 0xFFFF;
                }
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = sMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
                break;
            case MOVE_EFFECT_TRI_ATTACK:
                if (gBattleMons[gEffectBattler].status1)
                {
                    ++gBattlescriptCurrInstr;
                }
                else
                {
                    gBattleCommunication[MOVE_EFFECT_BYTE] = Random() % 3 + 3;
                    SetMoveEffect(FALSE, 0);
                }
                break;
            case MOVE_EFFECT_CHARGING:
                gBattleMons[gEffectBattler].status2 |= STATUS2_MULTIPLETURNS;
                gLockedMoves[gEffectBattler] = gCurrentMove;
                gProtectStructs[gEffectBattler].chargingTurn = 1;
                ++gBattlescriptCurrInstr;
                break;
            case MOVE_EFFECT_WRAP:
                if (gBattleMons[gEffectBattler].status2 & STATUS2_WRAPPED)
                {
                    ++gBattlescriptCurrInstr;
                }
                else
                {
                    gBattleMons[gEffectBattler].status2 |= ((Random() & 3) + 3) << 0xD;
                    *(gBattleStruct->wrappedMove + gEffectBattler * 2 + 0) = gCurrentMove;
                    *(gBattleStruct->wrappedMove + gEffectBattler * 2 + 1) = gCurrentMove >> 8;
                    *(gBattleStruct->wrappedBy + gEffectBattler) = gBattlerAttacker;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = sMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
                    for (gBattleCommunication[MULTISTRING_CHOOSER] = 0; ; ++gBattleCommunication[MULTISTRING_CHOOSER])
                    {
                        if (gBattleCommunication[MULTISTRING_CHOOSER] > 4)
                            break;
                        if (gTrappingMoves[gBattleCommunication[MULTISTRING_CHOOSER]] == gCurrentMove)
                            break;
                    }
                }
                break;
            case MOVE_EFFECT_RECOIL_25: // 25% recoil
                gBattleMoveDamage = (gHpDealt) / 4;
                if (gBattleMoveDamage == 0)
                    gBattleMoveDamage = 1;
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = sMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
                break;
            case MOVE_EFFECT_ATK_PLUS_1:
            case MOVE_EFFECT_DEF_PLUS_1:
            case MOVE_EFFECT_SPD_PLUS_1:
            case MOVE_EFFECT_SP_ATK_PLUS_1:
            case MOVE_EFFECT_SP_DEF_PLUS_1:
            case MOVE_EFFECT_ACC_PLUS_1:
            case MOVE_EFFECT_EVS_PLUS_1:
                if (ChangeStatBuffs(SET_STAT_BUFF_VALUE(1),
                                    gBattleCommunication[MOVE_EFFECT_BYTE] - MOVE_EFFECT_ATK_PLUS_1 + 1,
                                    affectsUser,
                                    NULL))
                {
                    ++gBattlescriptCurrInstr;
                }
                else
                {
                    gBattleScripting.animArg1 = gBattleCommunication[MOVE_EFFECT_BYTE] & ~(MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN);
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
                if (ChangeStatBuffs(SET_STAT_BUFF_VALUE(1) | STAT_BUFF_NEGATIVE,
                                    gBattleCommunication[MOVE_EFFECT_BYTE] - MOVE_EFFECT_ATK_MINUS_1 + 1,
                                    affectsUser,
                                    NULL))
                {
                    ++gBattlescriptCurrInstr;
                }
                else
                {
                    gBattleScripting.animArg1 = gBattleCommunication[MOVE_EFFECT_BYTE] & ~(MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN);
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
                if (ChangeStatBuffs(SET_STAT_BUFF_VALUE(2),
                                    gBattleCommunication[MOVE_EFFECT_BYTE] - MOVE_EFFECT_ATK_PLUS_2 + 1,
                                    affectsUser,
                                    NULL))
                {
                    ++gBattlescriptCurrInstr;
                }
                else
                {
                    gBattleScripting.animArg1 = gBattleCommunication[MOVE_EFFECT_BYTE] & ~(MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN);
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
                if (ChangeStatBuffs(SET_STAT_BUFF_VALUE(2) | STAT_BUFF_NEGATIVE,
                                    gBattleCommunication[MOVE_EFFECT_BYTE] - MOVE_EFFECT_ATK_MINUS_2 + 1,
                                    affectsUser,
                                    NULL))
                {
                    ++gBattlescriptCurrInstr;
                }
                else
                {
                    gBattleScripting.animArg1 = gBattleCommunication[MOVE_EFFECT_BYTE] & ~(MOVE_EFFECT_AFFECTS_USER | MOVE_EFFECT_CERTAIN);
                    gBattleScripting.animArg2 = 0;
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_StatDown;
                }
                break;
            case MOVE_EFFECT_RECHARGE:
                gBattleMons[gEffectBattler].status2 |= STATUS2_RECHARGE;
                gDisableStructs[gEffectBattler].rechargeTimer = 2;
                gLockedMoves[gEffectBattler] = gCurrentMove;
                ++gBattlescriptCurrInstr;
                break;
            case MOVE_EFFECT_RAGE:
                gBattleMons[gBattlerAttacker].status2 |= STATUS2_RAGE;
                ++gBattlescriptCurrInstr;
                break;
            case MOVE_EFFECT_STEAL_ITEM:
                {
                    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER_TOWER)
                    {
                        ++gBattlescriptCurrInstr;
                        break;
                    }
                    side = GetBattlerSide(gBattlerAttacker);
                    if (GetBattlerSide(gBattlerAttacker) == B_SIDE_OPPONENT
                     && !(gBattleTypeFlags &
                          (BATTLE_TYPE_EREADER_TRAINER
                          | BATTLE_TYPE_BATTLE_TOWER
                          | BATTLE_TYPE_LINK))
                     && gTrainerBattleOpponent_A != 0x400)
                    {
                        ++gBattlescriptCurrInstr;
                    }
                    else if (!(gBattleTypeFlags &
                             (BATTLE_TYPE_EREADER_TRAINER
                             | BATTLE_TYPE_BATTLE_TOWER
                             | BATTLE_TYPE_LINK))
                         && gTrainerBattleOpponent_A != 0x400
                         && (gWishFutureKnock.knockedOffMons[side] & gBitTable[gBattlerPartyIndexes[gBattlerAttacker]]))
                    {
                        ++gBattlescriptCurrInstr;
                    }
                    else if (gBattleMons[gBattlerTarget].item
                        && gBattleMons[gBattlerTarget].ability == ABILITY_STICKY_HOLD)
                    {
                        gBattlescriptCurrInstr = BattleScript_StickyHoldActivates;
                        gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
                        RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
                    }
                    else if (gBattleMons[gBattlerAttacker].item != ITEM_NONE
                          || gBattleMons[gBattlerTarget].item == ITEM_ENIGMA_BERRY
                          || IS_ITEM_MAIL(gBattleMons[gBattlerTarget].item)
                          || gBattleMons[gBattlerTarget].item == ITEM_NONE)
                    {
                        ++gBattlescriptCurrInstr;
                    }
                    else
                    {
                        u16 *changedItem = &gBattleStruct->changedItems[gBattlerAttacker];
                        gLastUsedItem = *changedItem = gBattleMons[gBattlerTarget].item;
                        gBattleMons[gBattlerTarget].item = ITEM_NONE;
                        gActiveBattler = gBattlerAttacker;
                        BtlController_EmitSetMonData(0, REQUEST_HELDITEM_BATTLE, 0, 2, &gLastUsedItem);
                        MarkBattlerForControllerExec(gBattlerAttacker);
                        gActiveBattler = gBattlerTarget;
                        BtlController_EmitSetMonData(0, REQUEST_HELDITEM_BATTLE, 0, 2, &gBattleMons[gBattlerTarget].item);
                        MarkBattlerForControllerExec(gBattlerTarget);
                        BattleScriptPush(gBattlescriptCurrInstr + 1);
                        gBattlescriptCurrInstr = BattleScript_ItemSteal;
                        *(u8 *)((u8 *)(&gBattleStruct->choicedMove[gBattlerTarget]) + 0) = 0;
                        *(u8 *)((u8 *)(&gBattleStruct->choicedMove[gBattlerTarget]) + 1) = 0;
                    }
                }
                break;
            case MOVE_EFFECT_PREVENT_ESCAPE:
                gBattleMons[gBattlerTarget].status2 |= STATUS2_ESCAPE_PREVENTION;
                gDisableStructs[gBattlerTarget].battlerPreventingEscape = gBattlerAttacker;
                ++gBattlescriptCurrInstr;
                break;
            case MOVE_EFFECT_NIGHTMARE:
                gBattleMons[gBattlerTarget].status2 |= STATUS2_NIGHTMARE;
                ++gBattlescriptCurrInstr;
                break;
            case MOVE_EFFECT_ALL_STATS_UP:
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_AllStatsUp;
                break;
            case MOVE_EFFECT_RAPIDSPIN:
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_RapidSpinAway;
                break;
            case MOVE_EFFECT_REMOVE_PARALYSIS: // Smelling salts
                if (!(gBattleMons[gBattlerTarget].status1 & STATUS1_PARALYSIS))
                {
                    ++gBattlescriptCurrInstr;
                }
                else
                {
                    gBattleMons[gBattlerTarget].status1 &= ~(STATUS1_PARALYSIS);
                    gActiveBattler = gBattlerTarget;
                    BtlController_EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gActiveBattler].status1);
                    MarkBattlerForControllerExec(gActiveBattler);
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_TargetPRLZHeal;
                }
                break;
            case MOVE_EFFECT_ATK_DEF_DOWN: // SuperPower
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_AtkDefDown;
                break;
            case MOVE_EFFECT_RECOIL_33: // Double Edge
                gBattleMoveDamage = gHpDealt / 3;
                if (gBattleMoveDamage == 0)
                    gBattleMoveDamage = 1;
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = sMoveEffectBS_Ptrs[gBattleCommunication[MOVE_EFFECT_BYTE]];
                break;
            case MOVE_EFFECT_THRASH:
                if (gBattleMons[gEffectBattler].status2 & STATUS2_LOCK_CONFUSE)
                {
                    ++gBattlescriptCurrInstr;
                }
                else
                {
                    gBattleMons[gEffectBattler].status2 |= STATUS2_MULTIPLETURNS;
                    gLockedMoves[gEffectBattler] = gCurrentMove;
                    gBattleMons[gEffectBattler].status2 |= (((Random() & 1) + 2) << 0xA);
                }
                break;
            case MOVE_EFFECT_KNOCK_OFF:
                if (gBattleMons[gEffectBattler].ability == ABILITY_STICKY_HOLD)
                {
                    if (gBattleMons[gEffectBattler].item == ITEM_NONE)
                    {
                        ++gBattlescriptCurrInstr;
                    }
                    else
                    {
                        gLastUsedAbility = ABILITY_STICKY_HOLD;
                        gBattlescriptCurrInstr = BattleScript_StickyHoldActivates;
                        RecordAbilityBattle(gEffectBattler, ABILITY_STICKY_HOLD);
                    }
                    break;
                }
                if (gBattleMons[gEffectBattler].item)
                {
                    side = GetBattlerSide(gEffectBattler);
                    gLastUsedItem = gBattleMons[gEffectBattler].item;
                    gBattleMons[gEffectBattler].item = ITEM_NONE;
                    gWishFutureKnock.knockedOffMons[side] |= gBitTable[gBattlerPartyIndexes[gEffectBattler]];
                    BattleScriptPush(gBattlescriptCurrInstr + 1);
                    gBattlescriptCurrInstr = BattleScript_KnockedOff;
                    *(u8 *)((u8 *)(&gBattleStruct->choicedMove[gEffectBattler]) + 0) = 0;
                    *(u8 *)((u8 *)(&gBattleStruct->choicedMove[gEffectBattler]) + 1) = 0;
                }
                else
                {
                    ++gBattlescriptCurrInstr;
                }
                break;
            case MOVE_EFFECT_SP_ATK_TWO_DOWN: // Overheat
                BattleScriptPush(gBattlescriptCurrInstr + 1);
                gBattlescriptCurrInstr = BattleScript_SAtkDown2;
                break;
            }
        }
    }
}

void atk15_seteffectwithchance(void)
{
    u32 percentChance;

    if (gBattleMons[gBattlerAttacker].ability == ABILITY_SERENE_GRACE)
        percentChance = gBattleMoves[gCurrentMove].secondaryEffectChance * 2;
    else
        percentChance = gBattleMoves[gCurrentMove].secondaryEffectChance;
    if (gBattleCommunication[MOVE_EFFECT_BYTE] & MOVE_EFFECT_CERTAIN
     && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
    {
        gBattleCommunication[MOVE_EFFECT_BYTE] &= ~(MOVE_EFFECT_CERTAIN);
        SetMoveEffect(0, MOVE_EFFECT_CERTAIN);
    }
    else if (Random() % 100 <= percentChance
          && gBattleCommunication[MOVE_EFFECT_BYTE]
          && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
    {
        if (percentChance >= 100)
            SetMoveEffect(0, MOVE_EFFECT_CERTAIN);
        else
            SetMoveEffect(0, 0);
    }
    else
    {
        ++gBattlescriptCurrInstr;
    }
    gBattleCommunication[MOVE_EFFECT_BYTE] = 0;
    gBattleScripting.multihitMoveEffect = 0;
}

void atk16_seteffectprimary(void)
{
    SetMoveEffect(TRUE, 0);
}

void atk17_seteffectsecondary(void)
{
    SetMoveEffect(FALSE, 0);
}

void atk18_clearstatusfromeffect(void)
{
    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);

    if (gBattleCommunication[MOVE_EFFECT_BYTE] <= MOVE_EFFECT_TOXIC)
        gBattleMons[gActiveBattler].status1 &= (~sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]]);
    else
        gBattleMons[gActiveBattler].status2 &= (~sStatusFlagsForMoveEffects[gBattleCommunication[MOVE_EFFECT_BYTE]]);
    gBattleCommunication[MOVE_EFFECT_BYTE] = 0;
    gBattlescriptCurrInstr += 2;
    gBattleScripting.multihitMoveEffect = 0;
}

void atk19_tryfaintmon(void)
{
    const u8 *BS_ptr;

    if (gBattlescriptCurrInstr[2] != 0)
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        if (gHitMarker & HITMARKER_FAINTED(gActiveBattler))
        {
            BS_ptr = T1_READ_PTR(gBattlescriptCurrInstr + 3);
            BattleScriptPop();
            gBattlescriptCurrInstr = BS_ptr;
            gSideStatuses[GetBattlerSide(gActiveBattler)] &= ~(SIDE_STATUS_SPIKES_DAMAGED);
        }
        else
        {
            gBattlescriptCurrInstr += 7;
        }
    }
    else
    {
        u8 battlerId;

        if (gBattlescriptCurrInstr[1] == BS_ATTACKER)
        {
            gActiveBattler = gBattlerAttacker;
            battlerId = gBattlerTarget;
            BS_ptr = BattleScript_FaintAttacker;
        }
        else
        {
            gActiveBattler = gBattlerTarget;
            battlerId = gBattlerAttacker;
            BS_ptr = BattleScript_FaintTarget;
        }
        if (!(gAbsentBattlerFlags & gBitTable[gActiveBattler])
         && gBattleMons[gActiveBattler].hp == 0)
        {
            gHitMarker |= HITMARKER_FAINTED(gActiveBattler);
            BattleScriptPush(gBattlescriptCurrInstr + 7);
            gBattlescriptCurrInstr = BS_ptr;
            if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
            {
                gHitMarker |= HITMARKER_x400000;
                if (gBattleResults.playerFaintCounter < 0xFF)
                    ++gBattleResults.playerFaintCounter;
                AdjustFriendshipOnBattleFaint(gActiveBattler);
            }
            else
            {
                if (gBattleResults.opponentFaintCounter < 0xFF)
                    ++gBattleResults.opponentFaintCounter;
                gBattleResults.lastOpponentSpecies = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_SPECIES);
                *(u8 *)(&gBattleStruct->field_182) = gBattlerAttacker;
            }
            if ((gHitMarker & HITMARKER_DESTINYBOND) && gBattleMons[gBattlerAttacker].hp != 0)
            {
                gHitMarker &= ~(HITMARKER_DESTINYBOND);
                BattleScriptPush(gBattlescriptCurrInstr);
                gBattleMoveDamage = gBattleMons[battlerId].hp;
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
                BtlController_EmitSetMonData(0, moveIndex + REQUEST_PPMOVE1_BATTLE, 0, 1, &gBattleMons[gActiveBattler].pp[moveIndex]);
                MarkBattlerForControllerExec(gActiveBattler);
                PREPARE_MOVE_BUFFER(gBattleTextBuff1, gBattleMons[gBattlerAttacker].moves[moveIndex])
            }
        }
        else
        {
            gBattlescriptCurrInstr += 7;
        }
    }
}

void atk1A_dofaintanimation(void)
{
    if (!gBattleControllerExecFlags)
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        BtlController_EmitFaintAnimation(0);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 2;
    }
}

void atk1B_cleareffectsonfaint(void)
{
    if (!gBattleControllerExecFlags)
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        gBattleMons[gActiveBattler].status1 = 0;
        BtlController_EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 0x4, &gBattleMons[gActiveBattler].status1);
        MarkBattlerForControllerExec(gActiveBattler);
        FaintClearSetData(); // Effects like attractions, trapping, etc.
        gBattlescriptCurrInstr += 2;
    }
}

void atk1C_jumpifstatus(void)
{
    u8 battlerId = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    u32 flags = T2_READ_32(gBattlescriptCurrInstr + 2);
    const u8 *jumpPtr = T2_READ_PTR(gBattlescriptCurrInstr + 6);

    if (gBattleMons[battlerId].status1 & flags && gBattleMons[battlerId].hp != 0)
        gBattlescriptCurrInstr = jumpPtr;
    else
        gBattlescriptCurrInstr += 10;
}

void atk1D_jumpifstatus2(void)
{
    u8 battlerId = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    u32 flags = T2_READ_32(gBattlescriptCurrInstr + 2);
    const u8 *jumpPtr = T2_READ_PTR(gBattlescriptCurrInstr + 6);

    if (gBattleMons[battlerId].status2 & flags && gBattleMons[battlerId].hp != 0)
        gBattlescriptCurrInstr = jumpPtr;
    else
        gBattlescriptCurrInstr += 10;
}

void atk1E_jumpifability(void)
{
    u8 battlerId;
    u8 ability = gBattlescriptCurrInstr[2];
    const u8 *jumpPtr = T2_READ_PTR(gBattlescriptCurrInstr + 3);

    if (gBattlescriptCurrInstr[1] == BS_ATTACKER_SIDE)
    {
        battlerId = AbilityBattleEffects(ABILITYEFFECT_CHECK_BATTLER_SIDE, gBattlerAttacker, ability, 0, 0);
        if (battlerId)
        {
            gLastUsedAbility = ability;
            gBattlescriptCurrInstr = jumpPtr;
            RecordAbilityBattle(battlerId - 1, gLastUsedAbility);
            gBattleScripting.battlerWithAbility = battlerId - 1;
        }
        else
            gBattlescriptCurrInstr += 7;
    }
    else if (gBattlescriptCurrInstr[1] == BS_NOT_ATTACKER_SIDE)
    {
        battlerId = AbilityBattleEffects(ABILITYEFFECT_CHECK_OTHER_SIDE, gBattlerAttacker, ability, 0, 0);
        if (battlerId)
        {
            gLastUsedAbility = ability;
            gBattlescriptCurrInstr = jumpPtr;
            RecordAbilityBattle(battlerId - 1, gLastUsedAbility);
            gBattleScripting.battlerWithAbility = battlerId - 1;
        }
        else
            gBattlescriptCurrInstr += 7;
    }
    else
    {
        battlerId = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        if (gBattleMons[battlerId].ability == ability)
        {
            gLastUsedAbility = ability;
            gBattlescriptCurrInstr = jumpPtr;
            RecordAbilityBattle(battlerId, gLastUsedAbility);
            gBattleScripting.battlerWithAbility = battlerId;
        }
        else
            gBattlescriptCurrInstr += 7;
    }
}

void atk1F_jumpifsideaffecting(void)
{
    u8 side;
    u16 flags;
    const u8 *jumpPtr;

    if (gBattlescriptCurrInstr[1] == BS_ATTACKER)
        side = GET_BATTLER_SIDE(gBattlerAttacker);
    else
        side = GET_BATTLER_SIDE(gBattlerTarget);

    flags = T2_READ_16(gBattlescriptCurrInstr + 2);
    jumpPtr = T2_READ_PTR(gBattlescriptCurrInstr + 4);

    if (gSideStatuses[side] & flags)
        gBattlescriptCurrInstr = jumpPtr;
    else
        gBattlescriptCurrInstr += 8;
}

void atk20_jumpifstat(void)
{
    u8 ret = 0;
    u8 battlerId = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    u8 value = gBattleMons[battlerId].statStages[gBattlescriptCurrInstr[3]];

    switch (gBattlescriptCurrInstr[2])
    {
    case CMP_EQUAL:
        if (value == gBattlescriptCurrInstr[4])
            ++ret;
        break;
    case CMP_NOT_EQUAL:
        if (value != gBattlescriptCurrInstr[4])
            ++ret;
        break;
    case CMP_GREATER_THAN:
        if (value > gBattlescriptCurrInstr[4])
            ++ret;
        break;
    case CMP_LESS_THAN:
        if (value < gBattlescriptCurrInstr[4])
            ++ret;
        break;
    case CMP_COMMON_BITS:
        if (value & gBattlescriptCurrInstr[4])
            ++ret;
        break;
    case CMP_NO_COMMON_BITS:
        if (!(value & gBattlescriptCurrInstr[4]))
            ++ret;
        break;
    }
    if (ret)
        gBattlescriptCurrInstr = T2_READ_PTR(gBattlescriptCurrInstr + 5);
    else
        gBattlescriptCurrInstr += 9;
}

void atk21_jumpifstatus3condition(void)
{
    u32 flags;
    const u8 *jumpPtr;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    flags = T2_READ_32(gBattlescriptCurrInstr + 2);
    jumpPtr = T2_READ_PTR(gBattlescriptCurrInstr + 7);
    if (gBattlescriptCurrInstr[6])
    {
        if (gStatuses3[gActiveBattler] & flags)
            gBattlescriptCurrInstr += 11;
        else
            gBattlescriptCurrInstr = jumpPtr;
    }
    else
    {
        if (gStatuses3[gActiveBattler] & flags)
            gBattlescriptCurrInstr = jumpPtr;
        else
            gBattlescriptCurrInstr += 11;
    }
}

void atk22_jumpiftype(void)
{
    u8 battlerId = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    u8 type = gBattlescriptCurrInstr[2];
    const u8 *jumpPtr = T2_READ_PTR(gBattlescriptCurrInstr + 3);

    if (IS_BATTLER_OF_TYPE(battlerId, type))
        gBattlescriptCurrInstr = jumpPtr;
    else
        gBattlescriptCurrInstr += 7;
}

void atk23_getexp(void)
{
    u16 item;
    s32 i; // also used as stringId
    u8 holdEffect;
    s32 sentIn;
    s32 viaExpShare = 0;
    u16 *exp = &gBattleStruct->expValue;

    gBattlerFainted = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    sentIn = gSentPokesToOpponent[(gBattlerFainted & 2) >> 1];
    switch (gBattleScripting.atk23_state)
    {
    case 0: // check if should receive exp at all
        if (GetBattlerSide(gBattlerFainted) != B_SIDE_OPPONENT
         || (gBattleTypeFlags &
            (BATTLE_TYPE_LINK
            | BATTLE_TYPE_TRAINER_TOWER
            | BATTLE_TYPE_BATTLE_TOWER
            | BATTLE_TYPE_SAFARI
            | BATTLE_TYPE_EREADER_TRAINER)))
        {
            gBattleScripting.atk23_state = 6; // goto last case
        }
        else
        {
            ++gBattleScripting.atk23_state;
            gBattleStruct->givenExpMons |= gBitTable[gBattlerPartyIndexes[gBattlerFainted]];
        }
        break;
    case 1: // calculate experience points to redistribute
        {
            u16 calculatedExp;
            s32 viaSentIn;

            for (viaSentIn = 0, i = 0; i < PARTY_SIZE; ++i)
            {
                if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) == SPECIES_NONE || GetMonData(&gPlayerParty[i], MON_DATA_HP) == 0)
                    continue;
                if (gBitTable[i] & sentIn)
                    ++viaSentIn;
                item = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
                if (item == ITEM_ENIGMA_BERRY)
                    holdEffect = gSaveBlock1Ptr->enigmaBerry.holdEffect;
                else
                    holdEffect = ItemId_GetHoldEffect(item);
                if (holdEffect == HOLD_EFFECT_EXP_SHARE)
                    ++viaExpShare;
            }
            calculatedExp = gBaseStats[gBattleMons[gBattlerFainted].species].expYield * gBattleMons[gBattlerFainted].level / 7;
            if (viaExpShare) // at least one mon is getting exp via exp share
            {
                *exp = calculatedExp / 2 / viaSentIn;
                if (*exp == 0)
                    *exp = 1;
                gExpShareExp = calculatedExp / 2 / viaExpShare;
                if (gExpShareExp == 0)
                    gExpShareExp = 1;
            }
            else
            {
                *exp = calculatedExp / viaSentIn;
                if (*exp == 0)
                    *exp = 1;
                gExpShareExp = 0;
            }
            ++gBattleScripting.atk23_state;
            gBattleStruct->expGetterMonId = 0;
            gBattleStruct->sentInPokes = sentIn;
        }
        // fall through
    case 2: // set exp value to the poke in expgetter_id and print message
        if (!gBattleControllerExecFlags)
        {
            item = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_HELD_ITEM);
            if (item == ITEM_ENIGMA_BERRY)
                holdEffect = gSaveBlock1Ptr->enigmaBerry.holdEffect;
            else
                holdEffect = ItemId_GetHoldEffect(item);
            if (holdEffect != HOLD_EFFECT_EXP_SHARE && !(gBattleStruct->sentInPokes & 1))
            {
                *(&gBattleStruct->sentInPokes) >>= 1;
                gBattleScripting.atk23_state = 5;
                gBattleMoveDamage = 0; // used for exp
            }
            else if (GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_LEVEL) == MAX_LEVEL)
            {
                *(&gBattleStruct->sentInPokes) >>= 1;
                gBattleScripting.atk23_state = 5;
                gBattleMoveDamage = 0; // used for exp
            }
            else
            {
                // music change in wild battle after fainting a poke
                if (!(gBattleTypeFlags & (BATTLE_TYPE_TRAINER | BATTLE_TYPE_POKEDUDE))
                 && gBattleMons[0].hp
                 && !gBattleStruct->wildVictorySong)
                {
                    BattleStopLowHpSound();
                    PlayBGM(BGM_FRLG_KACHI_WILD_POKEMON);
                    ++gBattleStruct->wildVictorySong;
                }
                if (GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_HP))
                {
                    if (gBattleStruct->sentInPokes & 1)
                        gBattleMoveDamage = *exp;
                    else
                        gBattleMoveDamage = 0;
                    if (holdEffect == HOLD_EFFECT_EXP_SHARE)
                        gBattleMoveDamage += gExpShareExp;
                    if (holdEffect == HOLD_EFFECT_LUCKY_EGG)
                        gBattleMoveDamage = (gBattleMoveDamage * 150) / 100;
                    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
                        gBattleMoveDamage = (gBattleMoveDamage * 150) / 100;
                    if (IsTradedMon(&gPlayerParty[gBattleStruct->expGetterMonId])
                     && !(gBattleTypeFlags & BATTLE_TYPE_POKEDUDE))
                    {
                        gBattleMoveDamage = (gBattleMoveDamage * 150) / 100;
                        i = STRINGID_ABOOSTED;
                    }
                    else
                    {
                        i = STRINGID_EMPTYSTRING4;
                    }
                    // get exp getter battlerId
                    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                    {
                        if (!(gBattlerPartyIndexes[2] != gBattleStruct->expGetterMonId) && !(gAbsentBattlerFlags & gBitTable[2]))
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
                    PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, gBattleStruct->expGetterBattlerId, gBattleStruct->expGetterMonId);
                    // buffer 'gained' or 'gained a boosted'
                    PREPARE_STRING_BUFFER(gBattleTextBuff2, i);
                    PREPARE_WORD_NUMBER_BUFFER(gBattleTextBuff3, 5, gBattleMoveDamage);
                    PrepareStringBattle(STRINGID_PKMNGAINEDEXP, gBattleStruct->expGetterBattlerId);
                    MonGainEVs(&gPlayerParty[gBattleStruct->expGetterMonId], gBattleMons[gBattlerFainted].species);
                }
                gBattleStruct->sentInPokes >>= 1;
                ++gBattleScripting.atk23_state;
            }
        }
        break;
    case 3: // Set stats and give exp
        if (!gBattleControllerExecFlags)
        {
            gBattleBufferB[gBattleStruct->expGetterBattlerId][0] = 0;
            if (GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_HP) && GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_LEVEL) != MAX_LEVEL)
            {
                gBattleResources->beforeLvlUp->stats[STAT_HP]    = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_MAX_HP);
                gBattleResources->beforeLvlUp->stats[STAT_ATK]   = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_ATK);
                gBattleResources->beforeLvlUp->stats[STAT_DEF]   = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_DEF);
                gBattleResources->beforeLvlUp->stats[STAT_SPEED] = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPEED);
                gBattleResources->beforeLvlUp->stats[STAT_SPATK] = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPATK);
                gBattleResources->beforeLvlUp->stats[STAT_SPDEF] = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPDEF);
                gActiveBattler = gBattleStruct->expGetterBattlerId;
                BtlController_EmitExpUpdate(0, gBattleStruct->expGetterMonId, gBattleMoveDamage);
                MarkBattlerForControllerExec(gActiveBattler);
            }
            ++gBattleScripting.atk23_state;
        }
        break;
    case 4: // lvl up if necessary
        if (!gBattleControllerExecFlags)
        {
            gActiveBattler = gBattleStruct->expGetterBattlerId;
            if (gBattleBufferB[gActiveBattler][0] == CONTROLLER_TWORETURNVALUES && gBattleBufferB[gActiveBattler][1] == RET_VALUE_LEVELED_UP)
            {
                if (gBattleTypeFlags & BATTLE_TYPE_TRAINER && gBattlerPartyIndexes[gActiveBattler] == gBattleStruct->expGetterMonId)
                    HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
                PREPARE_MON_NICK_WITH_PREFIX_BUFFER(gBattleTextBuff1, gActiveBattler, gBattleStruct->expGetterMonId);
                PREPARE_BYTE_NUMBER_BUFFER(gBattleTextBuff2, 3, GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_LEVEL));
                BattleScriptPushCursor();
                gLeveledUpInBattle |= gBitTable[gBattleStruct->expGetterMonId];
                gBattlescriptCurrInstr = BattleScript_LevelUp;
                gBattleMoveDamage = (gBattleBufferB[gActiveBattler][2] | (gBattleBufferB[gActiveBattler][3] << 8));
                AdjustFriendship(&gPlayerParty[gBattleStruct->expGetterMonId], 0);
                // update battle mon structure after level up
                if (gBattlerPartyIndexes[0] == gBattleStruct->expGetterMonId && gBattleMons[0].hp)
                {
                    gBattleMons[0].level = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_LEVEL);
                    gBattleMons[0].hp = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_HP);
                    gBattleMons[0].maxHP = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_MAX_HP);
                    gBattleMons[0].attack = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_ATK);
                    gBattleMons[0].defense = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_DEF);
                    // Why is this duplicated?
                    gBattleMons[0].speed = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPEED);
                    gBattleMons[0].speed = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPEED);
                    gBattleMons[0].spAttack = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPATK);
                    gBattleMons[0].spDefense = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPDEF);
                }
                // What is else if?
                if (gBattlerPartyIndexes[2] == gBattleStruct->expGetterMonId && gBattleMons[2].hp && (gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
                {
                    gBattleMons[2].level = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_LEVEL);
                    gBattleMons[2].hp = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_HP);
                    gBattleMons[2].maxHP = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_MAX_HP);
                    gBattleMons[2].attack = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_ATK);
                    gBattleMons[2].defense = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_DEF);
                    // Duplicated again, but this time there's no Sp Defense
                    gBattleMons[2].speed = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPEED);
                    gBattleMons[2].speed = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPEED);
                    gBattleMons[2].spAttack = GetMonData(&gPlayerParty[gBattleStruct->expGetterMonId], MON_DATA_SPATK);
                }
                gBattleScripting.atk23_state = 5;
            }
            else
            {
                gBattleMoveDamage = 0;
                gBattleScripting.atk23_state = 5;
            }
        }
        break;
    case 5: // looper increment
        if (gBattleMoveDamage) // there is exp to give, goto case 3 that gives exp
        {
            gBattleScripting.atk23_state = 3;
        }
        else
        {
            ++gBattleStruct->expGetterMonId;
            if (gBattleStruct->expGetterMonId <= 5)
                gBattleScripting.atk23_state = 2; // loop again
            else
                gBattleScripting.atk23_state = 6; // we're done
        }
        break;
    case 6: // increment instruction
        if (!gBattleControllerExecFlags)
        {
            // not sure why gf clears the item and ability here
            gBattleMons[gBattlerFainted].item = ITEM_NONE;
            gBattleMons[gBattlerFainted].ability = ABILITY_NONE;
            gBattlescriptCurrInstr += 2;
        }
        break;
    }
}

void atk24(void)
{
    u16 HP_count = 0;
    s32 i;

    if (!gBattleControllerExecFlags)
    {
        for (i = 0; i < PARTY_SIZE; ++i)
            if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) && !GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
                HP_count += GetMonData(&gPlayerParty[i], MON_DATA_HP);
        if (HP_count == 0)
            gBattleOutcome |= B_OUTCOME_LOST;
        for (HP_count = 0, i = 0; i < PARTY_SIZE; ++i)
            if (GetMonData(&gEnemyParty[i], MON_DATA_SPECIES) && !GetMonData(&gEnemyParty[i], MON_DATA_IS_EGG))
                HP_count += GetMonData(&gEnemyParty[i], MON_DATA_HP);
        if (HP_count == 0)
            gBattleOutcome |= B_OUTCOME_WON;
        if (gBattleOutcome == 0 && (gBattleTypeFlags & BATTLE_TYPE_LINK))
        {
            s32 foundPlayer;
            s32 foundOpponent;

            for (foundPlayer = 0, i = 0; i < gBattlersCount; i += 2)
            {
                u32 *ptr = &gHitMarker;
                u32 hitMarkerUnk = 0x10000000;
                
                ++i;
                --i;
                if ((hitMarkerUnk << i) & *ptr && !gSpecialStatuses[i].flag40)
                    ++foundPlayer;
            }
            for (foundOpponent = 0, i = 1; i < gBattlersCount; i += 2)
            {
                u32 *ptr = &gHitMarker;
                u32 hitMarkerUnk = 0x10000000;
                
                {
                    u8 match;

                    ++match;
                    --match;
                }
                if ((hitMarkerUnk << i) & *ptr && !gSpecialStatuses[i].flag40)
                    ++foundOpponent;
            }
            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                if (foundOpponent + foundPlayer > 1)
                    gBattlescriptCurrInstr = T2_READ_PTR(gBattlescriptCurrInstr + 1);
                else
                    gBattlescriptCurrInstr += 5;
            }
            else
            {
                if (foundOpponent != 0 && foundPlayer != 0)
                    gBattlescriptCurrInstr = T2_READ_PTR(gBattlescriptCurrInstr + 1);
                else
                    gBattlescriptCurrInstr += 5;
            }
        }
        else
        {
            gBattlescriptCurrInstr += 5;
        }
    }
}

void MoveValuesCleanUp(void)
{
    gMoveResultFlags = 0;
    gBattleScripting.dmgMultiplier = 1;
    gCritMultiplier = 1;
    gBattleCommunication[MOVE_EFFECT_BYTE] = 0;
    gBattleCommunication[6] = 0;
    gHitMarker &= ~(HITMARKER_DESTINYBOND);
    gHitMarker &= ~(HITMARKER_SYNCHRONISE_EFFECT);
}

void atk25_movevaluescleanup(void)
{
    MoveValuesCleanUp();
    gBattlescriptCurrInstr += 1;
}

void atk26_setmultihit(void)
{
    gMultiHitCounter = gBattlescriptCurrInstr[1];
    gBattlescriptCurrInstr += 2;
}

void atk27_decrementmultihit(void)
{
    if (--gMultiHitCounter == 0)
        gBattlescriptCurrInstr += 5;
    else
        gBattlescriptCurrInstr = T2_READ_PTR(gBattlescriptCurrInstr + 1);
}

void atk28_goto(void)
{
    gBattlescriptCurrInstr = T2_READ_PTR(gBattlescriptCurrInstr + 1);
}

void atk29_jumpifbyte(void)
{
    u8 caseID = gBattlescriptCurrInstr[1];
    const u8 *memByte = T2_READ_PTR(gBattlescriptCurrInstr + 2);
    u8 value = gBattlescriptCurrInstr[6];
    const u8 *jumpPtr = T2_READ_PTR(gBattlescriptCurrInstr + 7);

    gBattlescriptCurrInstr += 11;

    switch (caseID)
    {
    case CMP_EQUAL:
        if (*memByte == value)
            gBattlescriptCurrInstr = jumpPtr;
        break;
    case CMP_NOT_EQUAL:
        if (*memByte != value)
            gBattlescriptCurrInstr = jumpPtr;
        break;
    case CMP_GREATER_THAN:
        if (*memByte > value)
            gBattlescriptCurrInstr = jumpPtr;
        break;
    case CMP_LESS_THAN:
        if (*memByte < value)
            gBattlescriptCurrInstr = jumpPtr;
        break;
    case CMP_COMMON_BITS:
        if (*memByte & value)
            gBattlescriptCurrInstr = jumpPtr;
        break;
    case CMP_NO_COMMON_BITS:
        if (!(*memByte & value))
            gBattlescriptCurrInstr = jumpPtr;
        break;
    }
}

void atk2A_jumpifhalfword(void)
{
    u8 caseID = gBattlescriptCurrInstr[1];
    const u16 *memHword = T2_READ_PTR(gBattlescriptCurrInstr + 2);
    u16 value = T2_READ_16(gBattlescriptCurrInstr + 6);
    const u8 *jumpPtr = T2_READ_PTR(gBattlescriptCurrInstr + 8);

    gBattlescriptCurrInstr += 12;
    switch (caseID)
    {
    case CMP_EQUAL:
        if (*memHword == value)
            gBattlescriptCurrInstr = jumpPtr;
        break;
    case CMP_NOT_EQUAL:
        if (*memHword != value)
            gBattlescriptCurrInstr = jumpPtr;
        break;
    case CMP_GREATER_THAN:
        if (*memHword > value)
            gBattlescriptCurrInstr = jumpPtr;
        break;
    case CMP_LESS_THAN:
        if (*memHword < value)
            gBattlescriptCurrInstr = jumpPtr;
        break;
    case CMP_COMMON_BITS:
        if (*memHword & value)
            gBattlescriptCurrInstr = jumpPtr;
        break;
    case CMP_NO_COMMON_BITS:
        if (!(*memHword & value))
            gBattlescriptCurrInstr = jumpPtr;
        break;
    }
}

void atk2B_jumpifword(void)
{
    u8 caseID = gBattlescriptCurrInstr[1];
    const u32* memWord = T2_READ_PTR(gBattlescriptCurrInstr + 2);
    u32 value = T1_READ_32(gBattlescriptCurrInstr + 6);
    const u8 *jumpPtr = T2_READ_PTR(gBattlescriptCurrInstr + 10);

    gBattlescriptCurrInstr += 14;
    switch (caseID)
    {
    case CMP_EQUAL:
        if (*memWord == value)
            gBattlescriptCurrInstr = jumpPtr;
        break;
    case CMP_NOT_EQUAL:
        if (*memWord != value)
            gBattlescriptCurrInstr = jumpPtr;
        break;
    case CMP_GREATER_THAN:
        if (*memWord > value)
            gBattlescriptCurrInstr = jumpPtr;
        break;
    case CMP_LESS_THAN:
        if (*memWord < value)
            gBattlescriptCurrInstr = jumpPtr;
        break;
    case CMP_COMMON_BITS:
        if (*memWord & value)
            gBattlescriptCurrInstr = jumpPtr;
        break;
    case CMP_NO_COMMON_BITS:
        if (!(*memWord & value))
            gBattlescriptCurrInstr = jumpPtr;
        break;
    }
}

void atk2C_jumpifarrayequal(void)
{
    const u8 *mem1 = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    const u8 *mem2 = T2_READ_PTR(gBattlescriptCurrInstr + 5);
    u32 size = gBattlescriptCurrInstr[9];
    const u8 *jumpPtr = T2_READ_PTR(gBattlescriptCurrInstr + 10);
    u8 i;

    for (i = 0; i < size; ++i)
    {
        if (*mem1 != *mem2)
        {
            gBattlescriptCurrInstr += 14;
            break;
        }
        ++mem1, ++mem2;
    }
    if (i == size)
        gBattlescriptCurrInstr = jumpPtr;
}

void atk2D_jumpifarraynotequal(void)
{
    u8 equalBytes = 0;
    const u8 *mem1 = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    const u8 *mem2 = T2_READ_PTR(gBattlescriptCurrInstr + 5);
    u32 size = gBattlescriptCurrInstr[9];
    const u8 *jumpPtr = T2_READ_PTR(gBattlescriptCurrInstr + 10);
    u8 i;

    for (i = 0; i < size; ++i)
    {
        if (*mem1 == *mem2)
            ++equalBytes;
        ++mem1, ++mem2;
    }
    if (equalBytes != size)
        gBattlescriptCurrInstr = jumpPtr;
    else
        gBattlescriptCurrInstr += 14;
}

void atk2E_setbyte(void)
{
    u8 *memByte = T2_READ_PTR(gBattlescriptCurrInstr + 1);

    *memByte = gBattlescriptCurrInstr[5];
    gBattlescriptCurrInstr += 6;
}

void atk2F_addbyte(void)
{
    u8 *memByte = T2_READ_PTR(gBattlescriptCurrInstr + 1);

    *memByte += gBattlescriptCurrInstr[5];
    gBattlescriptCurrInstr += 6;
}

void atk30_subbyte(void)
{
    u8 *memByte = T2_READ_PTR(gBattlescriptCurrInstr + 1);

    *memByte -= gBattlescriptCurrInstr[5];
    gBattlescriptCurrInstr += 6;
}

void atk31_copyarray(void)
{
    u8 *dest = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    const u8 *src = T2_READ_PTR(gBattlescriptCurrInstr + 5);
    s32 size = gBattlescriptCurrInstr[9];
    s32 i;

    for (i = 0; i < size; ++i)
    {
        dest[i] = src[i];
    }
    gBattlescriptCurrInstr += 10;
}

void atk32_copyarraywithindex(void)
{
    u8 *dest = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    const u8 *src = T2_READ_PTR(gBattlescriptCurrInstr + 5);
    const u8 *index = T2_READ_PTR(gBattlescriptCurrInstr + 9);
    s32 size = gBattlescriptCurrInstr[13];
    s32 i;

    for (i = 0; i < size; ++i)
    {
        dest[i] = src[i + *index];
    }
    gBattlescriptCurrInstr += 14;
}

void atk33_orbyte(void)
{
    u8 *memByte = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    *memByte |= gBattlescriptCurrInstr[5];
    gBattlescriptCurrInstr += 6;
}

void atk34_orhalfword(void)
{
    u16 *memHword = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    u16 val = T2_READ_16(gBattlescriptCurrInstr + 5);

    *memHword |= val;
    gBattlescriptCurrInstr += 7;
}

void atk35_orword(void)
{
    u32 *memWord = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    u32 val = T2_READ_32(gBattlescriptCurrInstr + 5);

    *memWord |= val;
    gBattlescriptCurrInstr += 9;
}

void atk36_bicbyte(void)
{
    u8 *memByte = T2_READ_PTR(gBattlescriptCurrInstr + 1);

    *memByte &= ~(gBattlescriptCurrInstr[5]);
    gBattlescriptCurrInstr += 6;
}

void atk37_bichalfword(void)
{
    u16 *memHword = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    u16 val = T2_READ_16(gBattlescriptCurrInstr + 5);

    *memHword &= ~val;
    gBattlescriptCurrInstr += 7;
}

void atk38_bicword(void)
{
    u32 *memWord = T2_READ_PTR(gBattlescriptCurrInstr + 1);
    u32 val = T2_READ_32(gBattlescriptCurrInstr + 5);

    *memWord &= ~val;
    gBattlescriptCurrInstr += 9;
}

void atk39_pause(void)
{
    if (!gBattleControllerExecFlags)
    {
        u16 value = T2_READ_16(gBattlescriptCurrInstr + 1);

        if (++gPauseCounterBattle >= value)
        {
            gPauseCounterBattle = 0;
            gBattlescriptCurrInstr += 3;
        }
    }
}

void atk3A_waitstate(void)
{
    if (!gBattleControllerExecFlags)
        ++gBattlescriptCurrInstr;
}

void atk3B_healthbar_update(void)
{
    if (gBattlescriptCurrInstr[1] == BS_TARGET)
        gActiveBattler = gBattlerTarget;
    else
        gActiveBattler = gBattlerAttacker;
    BtlController_EmitHealthBarUpdate(0, gBattleMoveDamage);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 2;
}

void atk3C_return(void)
{
    BattleScriptPop();
}

void atk3D_end(void)
{
    gMoveResultFlags = 0;
    gActiveBattler = 0;
    gCurrentActionFuncId = B_ACTION_TRY_FINISH;
}

void atk3E_end2(void)
{
    gActiveBattler = 0;
    gCurrentActionFuncId = B_ACTION_TRY_FINISH;
}

void atk3F_end3(void) // pops the main function stack
{
    BattleScriptPop();
    if (gBattleResources->battleCallbackStack->size != 0)
        gBattleResources->battleCallbackStack->size--;
    gBattleMainFunc = gBattleResources->battleCallbackStack->function[gBattleResources->battleCallbackStack->size];
}

void atk41_call(void)
{
    BattleScriptPush(gBattlescriptCurrInstr + 5);
    gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}

void atk42_jumpiftype2(void)
{
    u8 battlerId = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);

    if (gBattlescriptCurrInstr[2] == gBattleMons[battlerId].type1 || gBattlescriptCurrInstr[2] == gBattleMons[battlerId].type2)
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 3);
    else
        gBattlescriptCurrInstr += 7;
}

void atk43_jumpifabilitypresent(void)
{
    if (AbilityBattleEffects(ABILITYEFFECT_CHECK_ON_FIELD, 0, gBattlescriptCurrInstr[1], 0, 0))
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
    else
        gBattlescriptCurrInstr += 6;
}

void atk44_endselectionscript(void)
{
    *(gBattlerAttacker + gBattleStruct->selectionScriptFinished) = TRUE;
}

void atk45_playanimation(void)
{
    const u16 *argumentPtr;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    argumentPtr = T2_READ_PTR(gBattlescriptCurrInstr + 3);
    if (gBattlescriptCurrInstr[2] == B_ANIM_STATS_CHANGE
     || gBattlescriptCurrInstr[2] == B_ANIM_SNATCH_MOVE
     || gBattlescriptCurrInstr[2] == B_ANIM_SUBSTITUTE_FADE
     || gBattlescriptCurrInstr[2] == B_ANIM_x19)
    {
        BtlController_EmitBattleAnimation(0, gBattlescriptCurrInstr[2], *argumentPtr);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 7;
    }
    else if (gHitMarker & HITMARKER_NO_ANIMATIONS)
    {
        BattleScriptPush(gBattlescriptCurrInstr + 7);
        gBattlescriptCurrInstr = BattleScript_Pausex20;
    }
    else if (gBattlescriptCurrInstr[2] == B_ANIM_RAIN_CONTINUES
          || gBattlescriptCurrInstr[2] == B_ANIM_SUN_CONTINUES
          || gBattlescriptCurrInstr[2] == B_ANIM_SANDSTORM_CONTINUES
          || gBattlescriptCurrInstr[2] == B_ANIM_HAIL_CONTINUES)
    {
        BtlController_EmitBattleAnimation(0, gBattlescriptCurrInstr[2], *argumentPtr);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 7;
    }
    else if (gStatuses3[gActiveBattler] & STATUS3_SEMI_INVULNERABLE)
    {
        gBattlescriptCurrInstr += 7;
    }
    else
    {
        BtlController_EmitBattleAnimation(0, gBattlescriptCurrInstr[2], *argumentPtr);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 7;
    }
}

void atk46_playanimation2(void) // animation Id is stored in the first pointer
{
    const u16 *argumentPtr;
    const u8 *animationIdPtr;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    animationIdPtr = T2_READ_PTR(gBattlescriptCurrInstr + 2);
    argumentPtr = T2_READ_PTR(gBattlescriptCurrInstr + 6);
    if (*animationIdPtr == B_ANIM_STATS_CHANGE
     || *animationIdPtr == B_ANIM_SNATCH_MOVE
     || *animationIdPtr == B_ANIM_SUBSTITUTE_FADE)
    {
        BtlController_EmitBattleAnimation(0, *animationIdPtr, *argumentPtr);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 10;
    }
    else if (gHitMarker & HITMARKER_NO_ANIMATIONS)
    {
        gBattlescriptCurrInstr += 10;
    }
    else if (*animationIdPtr == B_ANIM_RAIN_CONTINUES
          || *animationIdPtr == B_ANIM_SUN_CONTINUES
          || *animationIdPtr == B_ANIM_SANDSTORM_CONTINUES
          || *animationIdPtr == B_ANIM_HAIL_CONTINUES)
    {
        BtlController_EmitBattleAnimation(0, *animationIdPtr, *argumentPtr);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 10;
    }
    else if (gStatuses3[gActiveBattler] & STATUS3_SEMI_INVULNERABLE)
    {
        gBattlescriptCurrInstr += 10;
    }
    else
    {
        BtlController_EmitBattleAnimation(0, *animationIdPtr, *argumentPtr);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 10;
    }
}

void atk47_setgraphicalstatchangevalues(void)
{
    u8 value = 0;

    switch (GET_STAT_BUFF_VALUE2(gBattleScripting.statChanger))
    {
    case SET_STAT_BUFF_VALUE(1): // +1
        value = STAT_ANIM_PLUS1;
        break;
    case SET_STAT_BUFF_VALUE(2): // +2
        value = STAT_ANIM_PLUS2;
        break;
    case SET_STAT_BUFF_VALUE(1) | STAT_BUFF_NEGATIVE: // -1
        value = STAT_ANIM_MINUS1;
        break;
    case SET_STAT_BUFF_VALUE(2) | STAT_BUFF_NEGATIVE: // -2
        value = STAT_ANIM_MINUS2;
        break;
    }
    gBattleScripting.animArg1 = GET_STAT_BUFF_ID(gBattleScripting.statChanger) + value - 1;
    gBattleScripting.animArg2 = 0;
    ++gBattlescriptCurrInstr;
}

void atk48_playstatchangeanimation(void)
{
    u32 currStat = 0;
    u16 statAnimId = 0;
    s32 changeableStatsCount = 0;
    u8 statsToCheck = 0;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    statsToCheck = gBattlescriptCurrInstr[2];
    if (gBattlescriptCurrInstr[3] & ATK48_STAT_NEGATIVE) // goes down
    {
        s16 startingStatAnimId;
        if (gBattlescriptCurrInstr[3] & ATK48_STAT_BY_TWO)
            startingStatAnimId = STAT_ANIM_MINUS2 - 1;
        else
            startingStatAnimId = STAT_ANIM_MINUS1 - 1;

        while (statsToCheck != 0)
        {
            if (statsToCheck & 1)
            {
                if (gBattlescriptCurrInstr[3] & ATK48_DONT_CHECK_LOWER)
                {
                    if (gBattleMons[gActiveBattler].statStages[currStat] > 0)
                    {
                        statAnimId = startingStatAnimId + currStat;
                        ++changeableStatsCount;
                    }
                }
                else if (!gSideTimers[GET_BATTLER_SIDE(gActiveBattler)].mistTimer
                        && gBattleMons[gActiveBattler].ability != ABILITY_CLEAR_BODY
                        && gBattleMons[gActiveBattler].ability != ABILITY_WHITE_SMOKE
                        && !(gBattleMons[gActiveBattler].ability == ABILITY_KEEN_EYE && currStat == STAT_ACC)
                        && !(gBattleMons[gActiveBattler].ability == ABILITY_HYPER_CUTTER && currStat == STAT_ATK))
                {
                    if (gBattleMons[gActiveBattler].statStages[currStat] > 0)
                    {
                        statAnimId = startingStatAnimId + currStat;
                        ++changeableStatsCount;
                    }
                }
            }
            statsToCheck >>= 1;
            ++currStat;
        }

        if (changeableStatsCount > 1) // more than one stat, so the color is gray
        {
            if (gBattlescriptCurrInstr[3] & ATK48_STAT_BY_TWO)
                statAnimId = STAT_ANIM_MULTIPLE_MINUS2;
            else
                statAnimId = STAT_ANIM_MULTIPLE_MINUS1;
        }
    }
    else // goes up
    {
        s16 startingStatAnimId;
        if (gBattlescriptCurrInstr[3] & ATK48_STAT_BY_TWO)
            startingStatAnimId = STAT_ANIM_PLUS2 - 1;
        else
            startingStatAnimId = STAT_ANIM_PLUS1 - 1;

        while (statsToCheck != 0)
        {
            if (statsToCheck & 1 && gBattleMons[gActiveBattler].statStages[currStat] < 0xC)
            {
                statAnimId = startingStatAnimId + currStat;
                ++changeableStatsCount;
            }
            statsToCheck >>= 1;
            ++currStat;
        }
        if (changeableStatsCount > 1) // more than one stat, so the color is gray
        {
            if (gBattlescriptCurrInstr[3] & ATK48_STAT_BY_TWO)
                statAnimId = STAT_ANIM_MULTIPLE_PLUS2;
            else
                statAnimId = STAT_ANIM_MULTIPLE_PLUS1;
        }
    }
    if (gBattlescriptCurrInstr[3] & ATK48_ONLY_MULTIPLE && changeableStatsCount < 2)
    {
        gBattlescriptCurrInstr += 4;
    }
    else if (changeableStatsCount != 0 && !gBattleScripting.statAnimPlayed)
    {
        BtlController_EmitBattleAnimation(0, B_ANIM_STATS_CHANGE, statAnimId);
        MarkBattlerForControllerExec(gActiveBattler);
        if (gBattlescriptCurrInstr[3] & ATK48_ONLY_MULTIPLE && changeableStatsCount > 1)
            gBattleScripting.statAnimPlayed = TRUE;
        gBattlescriptCurrInstr += 4;
    }
    else
    {
        gBattlescriptCurrInstr += 4;
    }
}

void atk49_moveend(void)
{
    s32 i;
    bool32 effect = FALSE;
    u8 moveType = 0;
    u8 holdEffectAtk = 0;
    u16 *choicedMoveAtk = NULL;
    u8 arg1, arg2;
    u16 originallyUsedMove;

    if (gChosenMove == 0xFFFF)
        originallyUsedMove = 0;
    else
        originallyUsedMove = gChosenMove;
    arg1 = gBattlescriptCurrInstr[1];
    arg2 = gBattlescriptCurrInstr[2];
    if (gBattleMons[gBattlerAttacker].item == ITEM_ENIGMA_BERRY)
        holdEffectAtk = gEnigmaBerries[gBattlerAttacker].holdEffect;
    else
        holdEffectAtk = ItemId_GetHoldEffect(gBattleMons[gBattlerAttacker].item);
    choicedMoveAtk = &gBattleStruct->choicedMove[gBattlerAttacker];
    GET_MOVE_TYPE(gCurrentMove, moveType);
    do
    {
        switch (gBattleScripting.atk49_state)
        {
        case ATK49_RAGE: // rage check
            if (gBattleMons[gBattlerTarget].status2 & STATUS2_RAGE
             && gBattleMons[gBattlerTarget].hp != 0
             && gBattlerAttacker != gBattlerTarget
             && GetBattlerSide(gBattlerAttacker) != GetBattlerSide(gBattlerTarget)
             && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
             && TARGET_TURN_DAMAGED
             && gBattleMoves[gCurrentMove].power
             && gBattleMons[gBattlerTarget].statStages[STAT_ATK] <= 0xB)
            {
                ++gBattleMons[gBattlerTarget].statStages[STAT_ATK];
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_RageIsBuilding;
                effect = TRUE;
            }
            ++gBattleScripting.atk49_state;
            break;
        case ATK49_DEFROST: // defrosting check
            if (gBattleMons[gBattlerTarget].status1 & STATUS1_FREEZE
             && gBattleMons[gBattlerTarget].hp != 0
             && gBattlerAttacker != gBattlerTarget
             && gSpecialStatuses[gBattlerTarget].specialDmg
             && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
             && moveType == TYPE_FIRE)
            {
                gBattleMons[gBattlerTarget].status1 &= ~(STATUS1_FREEZE);
                gActiveBattler = gBattlerTarget;
                BtlController_EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[gBattlerTarget].status1);
                MarkBattlerForControllerExec(gActiveBattler);
                BattleScriptPushCursor();
                gBattlescriptCurrInstr = BattleScript_DefrostedViaFireMove;
                effect = TRUE;
            }
            ++gBattleScripting.atk49_state;
            break;
        case ATK49_SYNCHRONIZE_TARGET: // target synchronize
            if (AbilityBattleEffects(ABILITYEFFECT_SYNCHRONIZE, gBattlerTarget, 0, 0, 0))
                effect = TRUE;
            ++gBattleScripting.atk49_state;
            break;
        case ATK49_MOVE_END_ABILITIES: // Such as abilities activating on contact(Poison Spore, Rough Skin, etc.).
            if (AbilityBattleEffects(ABILITYEFFECT_MOVE_END, gBattlerTarget, 0, 0, 0))
                effect = TRUE;
            ++gBattleScripting.atk49_state;
            break;
        case ATK49_STATUS_IMMUNITY_ABILITIES: // status immunities
            if (AbilityBattleEffects(ABILITYEFFECT_IMMUNITY, 0, 0, 0, 0))
                effect = TRUE; // it loops through all battlers, so we increment after its done with all battlers
            else
                ++gBattleScripting.atk49_state;
            break;
        case ATK49_SYNCHRONIZE_ATTACKER: // attacker synchronize
            if (AbilityBattleEffects(ABILITYEFFECT_ATK_SYNCHRONIZE, gBattlerAttacker, 0, 0, 0))
                effect = TRUE;
            ++gBattleScripting.atk49_state;
            break;
        case ATK49_CHOICE_MOVE: // update choice band move
            if (gHitMarker & HITMARKER_OBEYS
             && holdEffectAtk == HOLD_EFFECT_CHOICE_BAND
             && gChosenMove != MOVE_STRUGGLE 
             && (*choicedMoveAtk == 0 || *choicedMoveAtk == 0xFFFF))
            {
                if (gChosenMove == MOVE_BATON_PASS && !(gMoveResultFlags & MOVE_RESULT_FAILED))
                {
                    ++gBattleScripting.atk49_state;
                    break;
                }
                *choicedMoveAtk = gChosenMove;
            }
            for (i = 0; i < MAX_MON_MOVES; ++i)
            {
                if (gBattleMons[gBattlerAttacker].moves[i] == *choicedMoveAtk)
                    break;
            }
            if (i == MAX_MON_MOVES)
                *choicedMoveAtk = 0;
            ++gBattleScripting.atk49_state;
            break;
        case ATK49_CHANGED_ITEMS: // changed held items
            for (i = 0; i < gBattlersCount; ++i)
            {
                u16 *changedItem = &gBattleStruct->changedItems[i];
                
                if (*changedItem != 0)
                {
                    gBattleMons[i].item = *changedItem;
                    *changedItem = 0;
                }
            }
            ++gBattleScripting.atk49_state;
            break;
        case ATK49_ITEM_EFFECTS_ALL: // item effects for all battlers
            if (ItemBattleEffects(ITEMEFFECT_MOVE_END, 0, FALSE))
                effect = TRUE;
            else
                ++gBattleScripting.atk49_state;
            break;
        case ATK49_KINGSROCK_SHELLBELL: // king's rock and shell bell
            if (ItemBattleEffects(ITEMEFFECT_KINGSROCK_SHELLBELL, 0, FALSE))
                effect = TRUE;
            ++gBattleScripting.atk49_state;
            break;
        case ATK49_ATTACKER_INVISIBLE: // make attacker sprite invisible
            if (gStatuses3[gBattlerAttacker] & (STATUS3_SEMI_INVULNERABLE)
             && gHitMarker & HITMARKER_NO_ANIMATIONS)
            {
                gActiveBattler = gBattlerAttacker;
                BtlController_EmitSpriteInvisibility(0, TRUE);
                MarkBattlerForControllerExec(gActiveBattler);
                ++gBattleScripting.atk49_state;
                return;
            }
            ++gBattleScripting.atk49_state;
            break;
        case ATK49_ATTACKER_VISIBLE: // make attacker sprite visible
            if (gMoveResultFlags & MOVE_RESULT_NO_EFFECT
             || !(gStatuses3[gBattlerAttacker] & (STATUS3_SEMI_INVULNERABLE))
             || WasUnableToUseMove(gBattlerAttacker))
            {
                gActiveBattler = gBattlerAttacker;
                BtlController_EmitSpriteInvisibility(0, FALSE);
                MarkBattlerForControllerExec(gActiveBattler);
                gStatuses3[gBattlerAttacker] &= ~(STATUS3_SEMI_INVULNERABLE);
                gSpecialStatuses[gBattlerAttacker].restoredBattlerSprite = 1;
                ++gBattleScripting.atk49_state;
                return;
            }
            ++gBattleScripting.atk49_state;
            break;
        case ATK49_TARGET_VISIBLE: // make target sprite visible
            if (!gSpecialStatuses[gBattlerTarget].restoredBattlerSprite
             && gBattlerTarget < gBattlersCount
             && !(gStatuses3[gBattlerTarget] & STATUS3_SEMI_INVULNERABLE))
            {
                gActiveBattler = gBattlerTarget;
                BtlController_EmitSpriteInvisibility(0, FALSE);
                MarkBattlerForControllerExec(gActiveBattler);
                gStatuses3[gBattlerTarget] &= ~(STATUS3_SEMI_INVULNERABLE);
                ++gBattleScripting.atk49_state;
                return;
            }
            ++gBattleScripting.atk49_state;
            break;
        case ATK49_SUBSTITUTE: // update substitute
            for (i = 0; i < gBattlersCount; ++i)
            {
                if (gDisableStructs[i].substituteHP == 0)
                    gBattleMons[i].status2 &= ~(STATUS2_SUBSTITUTE);
            }
            ++gBattleScripting.atk49_state;
            break;
        case ATK49_UPDATE_LAST_MOVES:
            if (gHitMarker & HITMARKER_SWAP_ATTACKER_TARGET)
            {
                gActiveBattler = gBattlerAttacker;
                gBattlerAttacker = gBattlerTarget;
                gBattlerTarget = gActiveBattler;
                gHitMarker &= ~(HITMARKER_SWAP_ATTACKER_TARGET);
            }
            if (gHitMarker & HITMARKER_ATTACKSTRING_PRINTED)
            {
                gLastPrintedMoves[gBattlerAttacker] = gChosenMove;
            }
            if (!(gAbsentBattlerFlags & gBitTable[gBattlerAttacker])
             && !(gBattleStruct->field_91 & gBitTable[gBattlerAttacker])
             && gBattleMoves[originallyUsedMove].effect != EFFECT_BATON_PASS)
            {
                if (gHitMarker & HITMARKER_OBEYS)
                {
                    gLastMoves[gBattlerAttacker] = gChosenMove;
                    gLastResultingMoves[gBattlerAttacker] = gCurrentMove;
                }
                else
                {
                    gLastMoves[gBattlerAttacker] = 0xFFFF;
                    gLastResultingMoves[gBattlerAttacker] = 0xFFFF;
                }

                if (!(gHitMarker & HITMARKER_FAINTED(gBattlerTarget)))
                    gLastHitBy[gBattlerTarget] = gBattlerAttacker;

                if (gHitMarker & HITMARKER_OBEYS && !(gMoveResultFlags & MOVE_RESULT_NO_EFFECT))
                {
                    if (gChosenMove == 0xFFFF)
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
                    gLastLandedMoves[gBattlerTarget] = 0xFFFF;
                }
            }
            ++gBattleScripting.atk49_state;
            break;
        case ATK49_MIRROR_MOVE: // mirror move
            if (!(gAbsentBattlerFlags & gBitTable[gBattlerAttacker])
             && !(gBattleStruct->field_91 & gBitTable[gBattlerAttacker])
             && gBattleMoves[originallyUsedMove].flags & FLAG_MIRROR_MOVE_AFFECTED
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
            ++gBattleScripting.atk49_state;
            break;
        case ATK49_NEXT_TARGET: // For moves hitting two opposing Pokemon.
            if (!(gHitMarker & HITMARKER_UNABLE_TO_USE_MOVE)
             && gBattleTypeFlags & BATTLE_TYPE_DOUBLE
             && !gProtectStructs[gBattlerAttacker].chargingTurn
             && gBattleMoves[gCurrentMove].target == MOVE_TARGET_BOTH
             && !(gHitMarker & HITMARKER_NO_ATTACKSTRING))
            {
                u8 battlerId = GetBattlerAtPosition(BATTLE_PARTNER(GetBattlerPosition(gBattlerTarget)));
                if (gBattleMons[battlerId].hp != 0)
                {
                    gBattlerTarget = battlerId;
                    gHitMarker |= HITMARKER_NO_ATTACKSTRING;
                    gBattleScripting.atk49_state = 0;
                    MoveValuesCleanUp();
                    BattleScriptPush(gBattleScriptsForMoveEffects[gBattleMoves[gCurrentMove].effect]);
                    gBattlescriptCurrInstr = BattleScript_FlushMessageBox;
                    return;
                }
                else
                {
                    gHitMarker |= HITMARKER_NO_ATTACKSTRING;
                }
            }
            ++gBattleScripting.atk49_state;
            break;
        case ATK49_COUNT:
            break;
        }
        if (arg1 == 1 && effect == FALSE)
            gBattleScripting.atk49_state = ATK49_COUNT;
        if (arg1 == 2 && arg2 == gBattleScripting.atk49_state)
            gBattleScripting.atk49_state = ATK49_COUNT;
    }
    while (gBattleScripting.atk49_state != ATK49_COUNT && effect == FALSE);
    if (gBattleScripting.atk49_state == ATK49_COUNT && effect == FALSE)
        gBattlescriptCurrInstr += 3;
}

void atk4A_typecalc2(void)
{
    u8 flags = 0;
    s32 i = 0;
    u8 moveType = gBattleMoves[gCurrentMove].type;

    if (gBattleMons[gBattlerTarget].ability == ABILITY_LEVITATE && moveType == TYPE_GROUND)
    {
        gLastUsedAbility = gBattleMons[gBattlerTarget].ability;
        gMoveResultFlags |= (MOVE_RESULT_MISSED | MOVE_RESULT_DOESNT_AFFECT_FOE);
        gLastLandedMoves[gBattlerTarget] = 0;
        gBattleCommunication[6] = moveType;
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
     && gBattleMoves[gCurrentMove].power)
    {
        gLastUsedAbility = ABILITY_WONDER_GUARD;
        gMoveResultFlags |= MOVE_RESULT_MISSED;
        gLastLandedMoves[gBattlerTarget] = 0;
        gBattleCommunication[6] = 3;
        RecordAbilityBattle(gBattlerTarget, gLastUsedAbility);
    }
    if (gMoveResultFlags & MOVE_RESULT_DOESNT_AFFECT_FOE)
        gProtectStructs[gBattlerAttacker].targetNotAffected = 1;
    ++gBattlescriptCurrInstr;
}

void atk4B_returnatktoball(void)
{
    gActiveBattler = gBattlerAttacker;
    if (!(gHitMarker & HITMARKER_FAINTED(gActiveBattler)))
    {
        BtlController_EmitReturnMonToBall(0, 0);
        MarkBattlerForControllerExec(gActiveBattler);
    }
    ++gBattlescriptCurrInstr;
}

void atk4C_getswitchedmondata(void)
{
    if (!gBattleControllerExecFlags)
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        gBattlerPartyIndexes[gActiveBattler] = *(gBattleStruct->monToSwitchIntoId + gActiveBattler);
        BtlController_EmitGetMonData(0, REQUEST_ALL_BATTLE, gBitTable[gBattlerPartyIndexes[gActiveBattler]]);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 2;
    }
}

void atk4D_switchindataupdate(void)
{
    struct BattlePokemon oldData;
    s32 i;
    u8 *monData;

    if (!gBattleControllerExecFlags)
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        oldData = gBattleMons[gActiveBattler];
        monData = (u8 *)(&gBattleMons[gActiveBattler]);
        for (i = 0; i < sizeof(struct BattlePokemon); ++i)
        {
            monData[i] = gBattleBufferB[gActiveBattler][4 + i];
        }
        gBattleMons[gActiveBattler].type1 = gBaseStats[gBattleMons[gActiveBattler].species].type1;
        gBattleMons[gActiveBattler].type2 = gBaseStats[gBattleMons[gActiveBattler].species].type2;
        gBattleMons[gActiveBattler].ability = GetAbilityBySpecies(gBattleMons[gActiveBattler].species, gBattleMons[gActiveBattler].abilityNum);
        // check knocked off item
        i = GetBattlerSide(gActiveBattler);
        if (gWishFutureKnock.knockedOffMons[i] & gBitTable[gBattlerPartyIndexes[gActiveBattler]])
            gBattleMons[gActiveBattler].item = 0;
        if (gBattleMoves[gCurrentMove].effect == EFFECT_BATON_PASS)
        {
            for (i = 0; i < NUM_BATTLE_STATS; ++i)
            {
                gBattleMons[gActiveBattler].statStages[i] = oldData.statStages[i];
            }
            gBattleMons[gActiveBattler].status2 = oldData.status2;
        }
        SwitchInClearSetData();
        gBattleScripting.battler = gActiveBattler;
        PREPARE_MON_NICK_BUFFER(gBattleTextBuff1, gActiveBattler, gBattlerPartyIndexes[gActiveBattler]);
        gBattlescriptCurrInstr += 2;
    }
}

void atk4E_switchinanim(void)
{
    if (!gBattleControllerExecFlags)
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        if (GetBattlerSide(gActiveBattler) == B_SIDE_OPPONENT
         && !(gBattleTypeFlags & 
              (BATTLE_TYPE_LINK
            | BATTLE_TYPE_LEGENDARY
            | BATTLE_TYPE_OLDMAN_TUTORIAL
            | BATTLE_TYPE_POKEDUDE
            | BATTLE_TYPE_EREADER_TRAINER
            | BATTLE_TYPE_GHOST)))
            HandleSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleMons[gActiveBattler].species), FLAG_SET_SEEN, gBattleMons[gActiveBattler].personality);
        gAbsentBattlerFlags &= ~(gBitTable[gActiveBattler]);
        BtlController_EmitSwitchInAnim(0, gBattlerPartyIndexes[gActiveBattler], gBattlescriptCurrInstr[2]);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 3;
    }
}

void atk4F_jumpifcantswitch(void)
{
    s32 i;
    s32 lastMonId;
    struct Pokemon *party;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1] & ~(ATK4F_DONT_CHECK_STATUSES));
    if (!(gBattlescriptCurrInstr[1] & ATK4F_DONT_CHECK_STATUSES)
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
        for (lastMonId = i + 3; i < lastMonId; ++i)
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
        for (i = 0; i < PARTY_SIZE; ++i)
        {
            if (GetMonData(&party[i], MON_DATA_HP) != 0
             && GetMonData(&party[i], MON_DATA_SPECIES) != SPECIES_NONE
             && !GetMonData(&party[i], MON_DATA_IS_EGG)
             && i != gBattlerPartyIndexes[battlerIn1]
             && i != gBattlerPartyIndexes[battlerIn2])
                break;
        }
        if (i == 6)
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
        else
            gBattlescriptCurrInstr += 6;
    }
}

void sub_8024398(u8 arg0)
{
    *(gBattleStruct->field_58 + gActiveBattler) = gBattlerPartyIndexes[gActiveBattler];
    BtlController_EmitChoosePokemon(0, PARTY_MUST_CHOOSE_MON, arg0, 0, gBattleStruct->field_60[gActiveBattler]);
    MarkBattlerForControllerExec(gActiveBattler);
}

void atk50_openpartyscreen(void)
{
    u32 flags;
    u8 hitmarkerFaintBits;
    u8 battlerId;
    const u8 *jumpPtr;

    battlerId = 0;
    flags = 0;
    jumpPtr = T1_READ_PTR(gBattlescriptCurrInstr + 2);
    if (gBattlescriptCurrInstr[1] == 5)
    {
        if ((gBattleTypeFlags & (BATTLE_TYPE_DOUBLE | BATTLE_TYPE_MULTI)) != BATTLE_TYPE_DOUBLE)
        {
            for (gActiveBattler = 0; gActiveBattler < gBattlersCount; ++gActiveBattler)
            {
                if (gHitMarker & HITMARKER_FAINTED(gActiveBattler))
                {
                    if (HasNoMonsToSwitch(gActiveBattler, 6, 6))
                    {
                        gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                        gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
                        BtlController_EmitLinkStandbyMsg(0, 2);
                        MarkBattlerForControllerExec(gActiveBattler);
                    }
                    else if (!gSpecialStatuses[gActiveBattler].flag40)
                    {
                        sub_8024398(6);
                        gSpecialStatuses[gActiveBattler].flag40 = 1;
                    }
                }
                else
                {
                    BtlController_EmitLinkStandbyMsg(0, 2);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
            }
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
        {
            u8 flag40_0, flag40_1, flag40_2, flag40_3;

            hitmarkerFaintBits = gHitMarker >> 0x1C;
            if (gBitTable[0] & hitmarkerFaintBits)
            {
                gActiveBattler = 0;
                if (HasNoMonsToSwitch(0, 6, 6))
                {
                    gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                    gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
                    BtlController_EmitCmd42(0);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
                else if (!gSpecialStatuses[gActiveBattler].flag40)
                {
                    sub_8024398(gBattleStruct->monToSwitchIntoId[2]);
                    gSpecialStatuses[gActiveBattler].flag40 = 1;
                }
                else
                {
                    BtlController_EmitLinkStandbyMsg(0, 2);
                    MarkBattlerForControllerExec(gActiveBattler);
                    flags |= 1;
                }
            }
            if (gBitTable[2] & hitmarkerFaintBits && !(gBitTable[0] & hitmarkerFaintBits))
            {
                gActiveBattler = 2;
                if (HasNoMonsToSwitch(2, 6, 6))
                {
                    gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                    gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
                    BtlController_EmitCmd42(0);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
                else if (!gSpecialStatuses[gActiveBattler].flag40)
                {
                    sub_8024398(gBattleStruct->monToSwitchIntoId[0]);
                    gSpecialStatuses[gActiveBattler].flag40 = 1;
                }
                else if (!(flags & 1))
                {
                    BtlController_EmitLinkStandbyMsg(0, 2);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
            }
            if (gBitTable[1] & hitmarkerFaintBits)
            {
                gActiveBattler = 1;
                if (HasNoMonsToSwitch(1, 6, 6))
                {
                    gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                    gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
                    BtlController_EmitCmd42(0);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
                else if (!gSpecialStatuses[gActiveBattler].flag40)
                {
                    sub_8024398(gBattleStruct->monToSwitchIntoId[3]);
                    gSpecialStatuses[gActiveBattler].flag40 = 1;
                }
                else
                {
                    BtlController_EmitLinkStandbyMsg(0, 2);
                    MarkBattlerForControllerExec(gActiveBattler);
                    flags |= 2;
                }
            }
            if (gBitTable[3] & hitmarkerFaintBits && !(gBitTable[1] & hitmarkerFaintBits))
            {
                gActiveBattler = 3;
                if (HasNoMonsToSwitch(3, 6, 6))
                {
                    gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                    gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
                    BtlController_EmitCmd42(0);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
                else if (!gSpecialStatuses[gActiveBattler].flag40)
                {
                    sub_8024398(gBattleStruct->monToSwitchIntoId[1]);
                    gSpecialStatuses[gActiveBattler].flag40 = 1;
                }
                else if (!(flags & 2))
                {
                    BtlController_EmitLinkStandbyMsg(0, 2);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
            }
            flag40_0 = gSpecialStatuses[0].flag40;
            if (!flag40_0)
            {
                flag40_2 = gSpecialStatuses[2].flag40;
                if (!flag40_2 && hitmarkerFaintBits != 0)
                {
                    if (gAbsentBattlerFlags & gBitTable[0])
                        gActiveBattler = 2;
                    else
                        gActiveBattler = 0;

                    BtlController_EmitLinkStandbyMsg(0, 2);
                    MarkBattlerForControllerExec(gActiveBattler);
                }

            }
            flag40_1 = gSpecialStatuses[1].flag40;
            if (!flag40_1)
            {
                flag40_3 = gSpecialStatuses[3].flag40;
                if (!flag40_3 && hitmarkerFaintBits != 0)
                {
                    if (gAbsentBattlerFlags & gBitTable[1])
                        gActiveBattler = 3;
                    else
                        gActiveBattler = 1;
                    BtlController_EmitLinkStandbyMsg(0, 2);
                    MarkBattlerForControllerExec(gActiveBattler);
                }
            }
        }
        gBattlescriptCurrInstr += 6;
    }
    else if (gBattlescriptCurrInstr[1] == 6)
    {
        if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
            {
                hitmarkerFaintBits = gHitMarker >> 0x1C;
                if (gBitTable[2] & hitmarkerFaintBits && gBitTable[0] & hitmarkerFaintBits)
                {
                    gActiveBattler = 2;
                    if (HasNoMonsToSwitch(2, gBattleBufferB[0][1], 6))
                    {
                        gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                        gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
                        BtlController_EmitCmd42(0);
                        MarkBattlerForControllerExec(gActiveBattler);
                    }
                    else if (!gSpecialStatuses[gActiveBattler].flag40)
                    {
                        sub_8024398(gBattleStruct->monToSwitchIntoId[0]);
                        gSpecialStatuses[gActiveBattler].flag40 = 1;
                    }
                }
                if (gBitTable[3] & hitmarkerFaintBits && hitmarkerFaintBits & gBitTable[1])
                {
                    gActiveBattler = 3;
                    if (HasNoMonsToSwitch(3, gBattleBufferB[1][1], 6))
                    {
                        gAbsentBattlerFlags |= gBitTable[gActiveBattler];
                        gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
                        BtlController_EmitCmd42(0);
                        MarkBattlerForControllerExec(gActiveBattler);
                    }
                    else if (!gSpecialStatuses[gActiveBattler].flag40)
                    {
                        sub_8024398(gBattleStruct->monToSwitchIntoId[1]);
                        gSpecialStatuses[gActiveBattler].flag40 = 1;
                    }
                }
                gBattlescriptCurrInstr += 6;
            }
            else
            {
                gBattlescriptCurrInstr += 6;
            }
        }
        else
        {
            gBattlescriptCurrInstr += 6;
        }

        hitmarkerFaintBits = gHitMarker >> 0x1C;

        gBattlerFainted = 0;
        while (1)
        {
            if (gBitTable[gBattlerFainted] & hitmarkerFaintBits)
                break;
            if (gBattlerFainted >= gBattlersCount)
                break;
            ++gBattlerFainted;
        }

        if (gBattlerFainted == gBattlersCount)
            gBattlescriptCurrInstr = jumpPtr;
    }
    else
    {
        if (gBattlescriptCurrInstr[1] & 0x80)
            hitmarkerFaintBits = PARTY_CHOOSE_MON; // Used here as the caseId for the EmitChoose function.
        else
            hitmarkerFaintBits = PARTY_MUST_CHOOSE_MON;
        battlerId = GetBattlerForBattleScript(gBattlescriptCurrInstr[1] & ~(0x80));
        if (gSpecialStatuses[battlerId].flag40)
        {
            gBattlescriptCurrInstr += 6;
        }
        else if (HasNoMonsToSwitch(battlerId, 6, 6))
        {
            gActiveBattler = battlerId;
            gAbsentBattlerFlags |= gBitTable[gActiveBattler];
            gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
            gBattlescriptCurrInstr = jumpPtr;
        }
        else
        {
            gActiveBattler = battlerId;
            *(gBattleStruct->field_58 + gActiveBattler) = gBattlerPartyIndexes[gActiveBattler];
            BtlController_EmitChoosePokemon(0, hitmarkerFaintBits, *(gBattleStruct->monToSwitchIntoId + (gActiveBattler ^ 2)), 0, gBattleStruct->field_60[gActiveBattler]);
            MarkBattlerForControllerExec(gActiveBattler);
            gBattlescriptCurrInstr += 6;
            if (GetBattlerPosition(gActiveBattler) == B_POSITION_PLAYER_LEFT && gBattleResults.playerSwitchesCounter < 0xFF)
                ++gBattleResults.playerSwitchesCounter;

            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                for (gActiveBattler = 0; gActiveBattler < gBattlersCount; ++gActiveBattler)
                {
                    if (gActiveBattler != battlerId)
                    {
                        BtlController_EmitLinkStandbyMsg(0, 2);
                        MarkBattlerForControllerExec(gActiveBattler);
                    }
                }
            }
            else
            {
                gActiveBattler = GetBattlerAtPosition(GetBattlerPosition(battlerId) ^ BIT_SIDE);
                if (gAbsentBattlerFlags & gBitTable[gActiveBattler])
                    gActiveBattler ^= BIT_FLANK;
                BtlController_EmitLinkStandbyMsg(0, 2);
                MarkBattlerForControllerExec(gActiveBattler);
            }
        }
    }
}

void atk51_switchhandleorder(void)
{
    s32 i;

    if (!gBattleControllerExecFlags)
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        switch (gBattlescriptCurrInstr[2])
        {
        case 0:
            for (i = 0; i < gBattlersCount; ++i)
                if (gBattleBufferB[i][0] == 0x22)
                    *(gBattleStruct->monToSwitchIntoId + i) = gBattleBufferB[i][1];
            break;
        case 1:
            if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI))
                sub_8013F6C(gActiveBattler);
            break;
        case 2:
            gBattleCommunication[0] = gBattleBufferB[gActiveBattler][1];
            *(gBattleStruct->monToSwitchIntoId + gActiveBattler) = gBattleBufferB[gActiveBattler][1];

            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                *(gActiveBattler * 3 + (u8 *)(gBattleStruct->field_60) + 0) &= 0xF;
                *(gActiveBattler * 3 + (u8 *)(gBattleStruct->field_60) + 0) |= (gBattleBufferB[gActiveBattler][2] & 0xF0);
                *(gActiveBattler * 3 + (u8 *)(gBattleStruct->field_60) + 1) = gBattleBufferB[gActiveBattler][3];
                *((gActiveBattler ^ BIT_FLANK) * 3 + (u8 *)(gBattleStruct->field_60) + 0) &= (0xF0);
                *((gActiveBattler ^ BIT_FLANK) * 3 + (u8 *)(gBattleStruct->field_60) + 0) |= (gBattleBufferB[gActiveBattler][2] & 0xF0) >> 4;
                *((gActiveBattler ^ BIT_FLANK) * 3 + (u8 *)(gBattleStruct->field_60) + 2) = gBattleBufferB[gActiveBattler][3];
            }
            else
            {
                sub_8013F6C(gActiveBattler);
            }
            PREPARE_SPECIES_BUFFER(gBattleTextBuff1, gBattleMons[gBattlerAttacker].species)
            PREPARE_MON_NICK_BUFFER(gBattleTextBuff2, gActiveBattler, gBattleBufferB[gActiveBattler][1])
            break;
        }
        gBattlescriptCurrInstr += 3;
    }
}

void atk52_switchineffects(void)
{
    s32 i;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    sub_80174B8(gActiveBattler);
    gHitMarker &= ~(HITMARKER_FAINTED(gActiveBattler));
    gSpecialStatuses[gActiveBattler].flag40 = 0;
    if (!(gSideStatuses[GetBattlerSide(gActiveBattler)] & SIDE_STATUS_SPIKES_DAMAGED)
     && (gSideStatuses[GetBattlerSide(gActiveBattler)] & SIDE_STATUS_SPIKES)
     && !IS_BATTLER_OF_TYPE(gActiveBattler, TYPE_FLYING)
     && gBattleMons[gActiveBattler].ability != ABILITY_LEVITATE)
    {
        u8 spikesDmg;

        gSideStatuses[GetBattlerSide(gActiveBattler)] |= SIDE_STATUS_SPIKES_DAMAGED;
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
        if (gBattleMons[gActiveBattler].ability == ABILITY_TRUANT)
            gDisableStructs[gActiveBattler].truantCounter = 1;
        if (!AbilityBattleEffects(ABILITYEFFECT_ON_SWITCHIN, gActiveBattler, 0, 0, 0)
         && !ItemBattleEffects(ITEMEFFECT_ON_SWITCH_IN, gActiveBattler, FALSE))
        {
            gSideStatuses[GetBattlerSide(gActiveBattler)] &= ~(SIDE_STATUS_SPIKES_DAMAGED);

            for (i = 0; i < gBattlersCount; ++i)
            {
                if (gBattlerByTurnOrder[i] == gActiveBattler)
                    gActionsByTurnOrder[i] = B_ACTION_CANCEL_PARTNER;
            }
            for (i = 0; i < gBattlersCount; ++i)
            {
                u16 *hpOnSwitchout = &gBattleStruct->hpOnSwitchout[GetBattlerSide(i)];
                *hpOnSwitchout = gBattleMons[i].hp;
            }

            if (gBattlescriptCurrInstr[1] == 5)
            {
                u32 hitmarkerFaintBits = gHitMarker >> 0x1C;

                ++gBattlerFainted;
                while (TRUE)
                {
                    if (hitmarkerFaintBits & gBitTable[gBattlerFainted] && !(gAbsentBattlerFlags & gBitTable[gBattlerFainted]))
                        break;
                    if (gBattlerFainted >= gBattlersCount)
                        break;
                    ++gBattlerFainted;
                }
            }
            gBattlescriptCurrInstr += 2;
        }
    }
}

void atk53_trainerslidein(void)
{
    if (!gBattlescriptCurrInstr[1])
        gActiveBattler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
    else
        gActiveBattler = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
    BtlController_EmitTrainerSlide(0);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 2;
}

void atk54_playse(void)
{
    gActiveBattler = gBattlerAttacker;
    BtlController_EmitPlaySE(0, T2_READ_16(gBattlescriptCurrInstr + 1));
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 3;
}

void atk55_fanfare(void)
{
    gActiveBattler = gBattlerAttacker;
    BtlController_EmitPlayFanfare(0, T2_READ_16(gBattlescriptCurrInstr + 1));
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 3;
}

void atk56_playfaintcry(void)
{
    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    BtlController_EmitFaintingCry(0);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 2;
}

void atk57(void)
{
    gActiveBattler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
    BtlController_EmitCmd55(0, gBattleOutcome);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 1;
}

void atk58_returntoball(void)
{
    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    BtlController_EmitReturnMonToBall(0, 1);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 2;
}

void atk59_handlelearnnewmove(void)
{
    const u8 *jumpPtr1 = T1_READ_PTR(gBattlescriptCurrInstr + 1);
    const u8 *jumpPtr2 = T1_READ_PTR(gBattlescriptCurrInstr + 5);
    u16 ret = MonTryLearningNewMove(&gPlayerParty[gBattleStruct->expGetterMonId], gBattlescriptCurrInstr[9]);
    
    while (ret == 0xFFFE)
        ret = MonTryLearningNewMove(&gPlayerParty[gBattleStruct->expGetterMonId], 0);
    if (ret == 0)
    {
        gBattlescriptCurrInstr = jumpPtr2;
    }
    else if (ret == 0xFFFF)
    {
        gBattlescriptCurrInstr += 10;
    }
    else
    {
        gActiveBattler = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
        if (gBattlerPartyIndexes[gActiveBattler] == gBattleStruct->expGetterMonId
         && !(gBattleMons[gActiveBattler].status2 & STATUS2_TRANSFORMED))
        {
            GiveMoveToBattleMon(&gBattleMons[gActiveBattler], ret);
        }
        if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
        {
            gActiveBattler = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
            if (gBattlerPartyIndexes[gActiveBattler] == gBattleStruct->expGetterMonId
             && !(gBattleMons[gActiveBattler].status2 & STATUS2_TRANSFORMED))
            {
                GiveMoveToBattleMon(&gBattleMons[gActiveBattler], ret);
            }
        }
        gBattlescriptCurrInstr = jumpPtr1;
    }
}

void atk5A_yesnoboxlearnmove(void)
{
    gActiveBattler = 0;

    switch (gBattleScripting.learnMoveState)
    {
    case 0:
        HandleBattleWindow(0x17, 8, 0x1D, 0xD, 0);
        BattlePutTextOnWindow(gText_BattleYesNoChoice, 0xE);
        ++gBattleScripting.learnMoveState;
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
                HandleBattleWindow(0x17, 0x8, 0x1D, 0xD, WINDOW_CLEAR);
                BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, RGB_BLACK);
                ++gBattleScripting.learnMoveState;
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
            ++gBattleScripting.learnMoveState;
        }
        break;
    case 3:
        if (!gPaletteFade.active && gMain.callback2 == BattleMainCB2)
        {
            u8 movePosition = sub_8138B2C();

            if (movePosition == 4)
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
                    if (gBattlerPartyIndexes[0] == gBattleStruct->expGetterMonId
                     && !(gBattleMons[0].status2 & STATUS2_TRANSFORMED)
                     && !(gDisableStructs[0].mimickedMoves & gBitTable[movePosition]))
                    {
                        RemoveBattleMonPPBonus(&gBattleMons[0], movePosition);
                        SetBattleMonMoveSlot(&gBattleMons[0], gMoveToLearn, movePosition);
                    }
                    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE
                     && gBattlerPartyIndexes[2] == gBattleStruct->expGetterMonId
                     && !(gBattleMons[2].status2 & STATUS2_TRANSFORMED)
                     && !(gDisableStructs[2].mimickedMoves & gBitTable[movePosition]))
                    {
                        RemoveBattleMonPPBonus(&gBattleMons[2], movePosition);
                        SetBattleMonMoveSlot(&gBattleMons[2], gMoveToLearn, movePosition);
                    }
                }
            }
        }
        break;
    case 4:
        HandleBattleWindow(0x17, 8, 0x1D, 0xD, WINDOW_CLEAR);
        gBattlescriptCurrInstr += 5;
        break;
    case 5:
        if (!gBattleControllerExecFlags)
        {
            gBattleScripting.learnMoveState = 2;
        }
        break;
    }
}

void atk5B_yesnoboxstoplearningmove(void)
{
    switch (gBattleScripting.learnMoveState)
    {
    case 0:
        HandleBattleWindow(0x17, 8, 0x1D, 0xD, 0);
        BattlePutTextOnWindow(gText_BattleYesNoChoice, 0xE);
        ++gBattleScripting.learnMoveState;
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
            HandleBattleWindow(0x17, 0x8, 0x1D, 0xD, WINDOW_CLEAR);
        }
        else if (JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
            HandleBattleWindow(0x17, 0x8, 0x1D, 0xD, WINDOW_CLEAR);
        }
        break;
    }
}

void atk5C_hitanimation(void)
{
    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    if (gMoveResultFlags & MOVE_RESULT_NO_EFFECT)
    {
        gBattlescriptCurrInstr += 2;
    }
    else if (!(gHitMarker & HITMARKER_IGNORE_SUBSTITUTE)
          || !(gBattleMons[gActiveBattler].status2 & STATUS2_SUBSTITUTE)
          || gDisableStructs[gActiveBattler].substituteHP == 0)
    {
        BtlController_EmitHitAnimation(0);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 2;
    }
    else
    {
        gBattlescriptCurrInstr += 2;
    }
}

#ifdef NONMATCHING
void atk5D_getmoneyreward(void)
{
    u32 i = 0;
    u32 lastMonLevel = 0;
    u32 moneyReward = 0;
    u32 value;

    // The whole function is using wrong registers. 
    if (gBattleOutcome == B_OUTCOME_WON)
    {
        if (gTrainerBattleOpponent_A == 0x400)
        {
            moneyReward = 20 * gBattleResources->secretBase->party.levels[0] * gBattleStruct->moneyMultiplier;
        }
        else
        {
            switch (gTrainers[gTrainerBattleOpponent_A].partyFlags)
            {
            case 0:
                {
                    const struct TrainerMonNoItemDefaultMoves *party = gTrainers[gTrainerBattleOpponent_A].party.NoItemDefaultMoves;
                    
                    lastMonLevel = party[gTrainers[gTrainerBattleOpponent_A].partySize - 1].lvl;
                }
                break;
            case F_TRAINER_PARTY_CUSTOM_MOVESET:
                {
                    const struct TrainerMonNoItemCustomMoves *party = gTrainers[gTrainerBattleOpponent_A].party.NoItemCustomMoves;
                    
                    lastMonLevel = party[gTrainers[gTrainerBattleOpponent_A].partySize - 1].lvl;
                }
                break;
            case F_TRAINER_PARTY_HELD_ITEM:
                {
                    const struct TrainerMonItemDefaultMoves *party = gTrainers[gTrainerBattleOpponent_A].party.ItemDefaultMoves;
                    
                    lastMonLevel = party[gTrainers[gTrainerBattleOpponent_A].partySize - 1].lvl;
                }
                break;
            case F_TRAINER_PARTY_CUSTOM_MOVESET | F_TRAINER_PARTY_HELD_ITEM:
                {
                    const struct TrainerMonItemCustomMoves *party = gTrainers[gTrainerBattleOpponent_A].party.ItemCustomMoves;
                    
                    lastMonLevel = party[gTrainers[gTrainerBattleOpponent_A].partySize - 1].lvl;
                }
                break;
            }
            for (; gTrainerMoneyTable[i].classId != 0xFF; ++i)
            {
                if (gTrainerMoneyTable[i].classId == gTrainers[gTrainerBattleOpponent_A].trainerClass)
                    break;
            }
            moneyReward = 4 * lastMonLevel;
            moneyReward *= gBattleStruct->moneyMultiplier;
            value = gTrainerMoneyTable[i].value;
            if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
                moneyReward *= (value << 1);
            else
                moneyReward *= value;
        }
        AddMoney(&gSaveBlock1Ptr->money, moneyReward);
    }
    else
    {
        moneyReward = sub_8054C04();
    }
    PREPARE_WORD_NUMBER_BUFFER(gBattleTextBuff1, 5, moneyReward);
    if (moneyReward)
        gBattlescriptCurrInstr += 5;
    else
        gBattlescriptCurrInstr = T1_READ_PTR(gBattlescriptCurrInstr + 1);
}
#else
NAKED
void atk5D_getmoneyreward(void)
{
    asm_unified("\n\
        push {r4-r7,lr}\n\
        mov r7, r8\n\
        push {r7}\n\
        movs r6, 0\n\
        movs r5, 0\n\
        ldr r0, _080258F0 @ =gBattleOutcome\n\
        ldrb r0, [r0]\n\
        cmp r0, 0x1\n\
        beq _080258C0\n\
        b _080259FA\n\
    _080258C0:\n\
        ldr r0, _080258F4 @ =gTrainerBattleOpponent_A\n\
        ldrh r2, [r0]\n\
        movs r1, 0x80\n\
        lsls r1, 3\n\
        cmp r2, r1\n\
        bne _08025904\n\
        ldr r0, _080258F8 @ =gBattleResources\n\
        ldr r0, [r0]\n\
        ldr r0, [r0]\n\
        adds r0, 0x94\n\
        ldrb r2, [r0]\n\
        ldr r0, _080258FC @ =gBattleStruct\n\
        ldr r0, [r0]\n\
        adds r0, 0x4A\n\
        ldrb r1, [r0]\n\
        lsls r0, r1, 2\n\
        adds r0, r1\n\
        lsls r0, 2\n\
        adds r4, r2, 0\n\
        muls r4, r0\n\
        ldr r0, _08025900 @ =gSaveBlock1Ptr\n\
        mov r8, r0\n\
        b _080259E8\n\
        .align 2, 0\n\
    _080258F0: .4byte gBattleOutcome\n\
    _080258F4: .4byte gTrainerBattleOpponent_A\n\
    _080258F8: .4byte gBattleResources\n\
    _080258FC: .4byte gBattleStruct\n\
    _08025900: .4byte gSaveBlock1Ptr\n\
    _08025904:\n\
        ldr r2, _08025920 @ =gTrainers\n\
        ldrh r1, [r0]\n\
        lsls r0, r1, 2\n\
        adds r0, r1\n\
        lsls r3, r0, 3\n\
        adds r4, r3, r2\n\
        ldrb r1, [r4]\n\
        cmp r1, 0x1\n\
        beq _0802595A\n\
        cmp r1, 0x1\n\
        bgt _08025924\n\
        cmp r1, 0\n\
        beq _0802592E\n\
        b _08025970\n\
        .align 2, 0\n\
    _08025920: .4byte gTrainers\n\
    _08025924:\n\
        cmp r1, 0x2\n\
        beq _08025944\n\
        cmp r1, 0x3\n\
        beq _0802595A\n\
        b _08025970\n\
    _0802592E:\n\
        adds r0, r2, 0\n\
        adds r0, 0x24\n\
        adds r0, r3, r0\n\
        ldr r1, [r0]\n\
        adds r0, r4, 0\n\
        adds r0, 0x20\n\
        ldrb r0, [r0]\n\
        lsls r0, 3\n\
        adds r0, r1\n\
        subs r0, 0x8\n\
        b _0802596E\n\
    _08025944:\n\
        adds r0, r2, 0\n\
        adds r0, 0x24\n\
        adds r0, r3, r0\n\
        ldr r1, [r0]\n\
        adds r0, r4, 0\n\
        adds r0, 0x20\n\
        ldrb r0, [r0]\n\
        lsls r0, 3\n\
        adds r0, r1\n\
        subs r0, 0x8\n\
        b _0802596E\n\
    _0802595A:\n\
        adds r0, r2, 0\n\
        adds r0, 0x24\n\
        adds r0, r3, r0\n\
        ldr r1, [r0]\n\
        adds r0, r4, 0\n\
        adds r0, 0x20\n\
        ldrb r0, [r0]\n\
        lsls r0, 4\n\
        adds r0, r1\n\
        subs r0, 0x10\n\
    _0802596E:\n\
        ldrb r5, [r0, 0x2]\n\
    _08025970:\n\
        ldr r0, _080259CC @ =gTrainerMoneyTable\n\
        lsls r1, r6, 2\n\
        adds r3, r1, r0\n\
        ldrb r1, [r3]\n\
        ldr r7, _080259D0 @ =gBattleStruct\n\
        mov r12, r0\n\
        lsls r4, r5, 2\n\
        ldr r5, _080259D4 @ =gBattleTypeFlags\n\
        ldr r0, _080259D8 @ =gSaveBlock1Ptr\n\
        mov r8, r0\n\
        cmp r1, 0xFF\n\
        beq _080259AA\n\
        ldr r2, _080259DC @ =gTrainers\n\
        ldr r0, _080259E0 @ =gTrainerBattleOpponent_A\n\
        ldrh r1, [r0]\n\
        lsls r0, r1, 2\n\
        adds r0, r1\n\
        lsls r0, 3\n\
        adds r0, r2\n\
        ldrb r2, [r0, 0x1]\n\
        adds r1, r3, 0\n\
    _0802599A:\n\
        ldrb r0, [r1]\n\
        cmp r0, r2\n\
        beq _080259AA\n\
        adds r1, 0x4\n\
        adds r6, 0x1\n\
        ldrb r0, [r1]\n\
        cmp r0, 0xFF\n\
        bne _0802599A\n\
    _080259AA:\n\
        ldr r0, [r7]\n\
        adds r0, 0x4A\n\
        ldrb r0, [r0]\n\
        adds r3, r4, 0\n\
        muls r3, r0\n\
        lsls r0, r6, 2\n\
        add r0, r12\n\
        ldrb r2, [r0, 0x1]\n\
        ldr r0, [r5]\n\
        movs r1, 0x1\n\
        ands r0, r1\n\
        cmp r0, 0\n\
        beq _080259E4\n\
        lsls r0, r2, 1\n\
        adds r4, r3, 0\n\
        muls r4, r0\n\
        b _080259E8\n\
        .align 2, 0\n\
    _080259CC: .4byte gTrainerMoneyTable\n\
    _080259D0: .4byte gBattleStruct\n\
    _080259D4: .4byte gBattleTypeFlags\n\
    _080259D8: .4byte gSaveBlock1Ptr\n\
    _080259DC: .4byte gTrainers\n\
    _080259E0: .4byte gTrainerBattleOpponent_A\n\
    _080259E4:\n\
        adds r4, r3, 0\n\
        muls r4, r2\n\
    _080259E8:\n\
        mov r1, r8\n\
        ldr r0, [r1]\n\
        movs r1, 0xA4\n\
        lsls r1, 2\n\
        adds r0, r1\n\
        adds r1, r4, 0\n\
        bl AddMoney\n\
        b _08025A00\n\
    _080259FA:\n\
        bl sub_8054C04\n\
        adds r4, r0, 0\n\
    _08025A00:\n\
        ldr r1, _08025A40 @ =gBattleTextBuff1\n\
        movs r0, 0xFD\n\
        strb r0, [r1]\n\
        movs r0, 0x1\n\
        strb r0, [r1, 0x1]\n\
        movs r0, 0x4\n\
        strb r0, [r1, 0x2]\n\
        movs r0, 0x5\n\
        strb r0, [r1, 0x3]\n\
        strb r4, [r1, 0x4]\n\
        movs r0, 0xFF\n\
        lsls r0, 8\n\
        ands r0, r4\n\
        lsrs r0, 8\n\
        strb r0, [r1, 0x5]\n\
        movs r0, 0xFF\n\
        lsls r0, 16\n\
        ands r0, r4\n\
        lsrs r0, 16\n\
        strb r0, [r1, 0x6]\n\
        lsrs r0, r4, 24\n\
        strb r0, [r1, 0x7]\n\
        movs r0, 0xFF\n\
        strb r0, [r1, 0x8]\n\
        cmp r4, 0\n\
        beq _08025A48\n\
        ldr r1, _08025A44 @ =gBattlescriptCurrInstr\n\
        ldr r0, [r1]\n\
        adds r0, 0x5\n\
        str r0, [r1]\n\
        b _08025A62\n\
        .align 2, 0\n\
    _08025A40: .4byte gBattleTextBuff1\n\
    _08025A44: .4byte gBattlescriptCurrInstr\n\
    _08025A48:\n\
        ldr r3, _08025A6C @ =gBattlescriptCurrInstr\n\
        ldr r2, [r3]\n\
        ldrb r1, [r2, 0x1]\n\
        ldrb r0, [r2, 0x2]\n\
        lsls r0, 8\n\
        orrs r1, r0\n\
        ldrb r0, [r2, 0x3]\n\
        lsls r0, 16\n\
        orrs r1, r0\n\
        ldrb r0, [r2, 0x4]\n\
        lsls r0, 24\n\
        orrs r1, r0\n\
        str r1, [r3]\n\
    _08025A62:\n\
        pop {r3}\n\
        mov r8, r3\n\
        pop {r4-r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08025A6C: .4byte gBattlescriptCurrInstr\n\
    ");
}
#endif

void atk5E(void)
{
    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);

    switch (gBattleCommunication[0])
    {
    case 0:
        BtlController_EmitGetMonData(0, REQUEST_ALL_BATTLE, 0);
        MarkBattlerForControllerExec(gActiveBattler);
        ++gBattleCommunication[0];
        break;
    case 1:
         if (!gBattleControllerExecFlags)
         {
            s32 i;
            struct BattlePokemon *bufferPoke = (struct BattlePokemon *) &gBattleBufferB[gActiveBattler][4];
            
            for (i = 0; i < MAX_MON_MOVES; ++i)
            {
                gBattleMons[gActiveBattler].moves[i] = bufferPoke->moves[i];
                gBattleMons[gActiveBattler].pp[i] = bufferPoke->pp[i];
            }
            gBattlescriptCurrInstr += 2;
         }
         break;
    }
}

void atk5F_swapattackerwithtarget(void)
{
    gActiveBattler = gBattlerAttacker;
    gBattlerAttacker = gBattlerTarget;
    gBattlerTarget = gActiveBattler;
    if (gHitMarker & HITMARKER_SWAP_ATTACKER_TARGET)
        gHitMarker &= ~(HITMARKER_SWAP_ATTACKER_TARGET);
    else
        gHitMarker |= HITMARKER_SWAP_ATTACKER_TARGET;
    ++gBattlescriptCurrInstr;
}

void atk60_incrementgamestat(void)
{
    if (GetBattlerSide(gBattlerAttacker) == B_SIDE_PLAYER)
        IncrementGameStat(gBattlescriptCurrInstr[1]);
    gBattlescriptCurrInstr += 2;
}

void atk61_drawpartystatussummary(void)
{
    s32 i;
    struct Pokemon *party;
    struct HpAndStatus hpStatuses[PARTY_SIZE];

    if (!gBattleControllerExecFlags)
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);

        if (GetBattlerSide(gActiveBattler) == B_SIDE_PLAYER)
            party = gPlayerParty;
        else
            party = gEnemyParty;

        for (i = 0; i < PARTY_SIZE; ++i)
        {
            if (GetMonData(&party[i], MON_DATA_SPECIES2) == SPECIES_NONE
                || GetMonData(&party[i], MON_DATA_SPECIES2) == SPECIES_EGG)
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
        BtlController_EmitDrawPartyStatusSummary(0, hpStatuses, 1);
        MarkBattlerForControllerExec(gActiveBattler);
        gBattlescriptCurrInstr += 2;
    }
}

void atk62_hidepartystatussummary(void)
{
    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    BtlController_EmitHidePartyStatusSummary(0);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 2;
}

void atk63_jumptocalledmove(void)
{
    if (gBattlescriptCurrInstr[1])
        gCurrentMove = gCalledMove;
    else
        gChosenMove = gCurrentMove = gCalledMove;
    gBattlescriptCurrInstr = gBattleScriptsForMoveEffects[gBattleMoves[gCurrentMove].effect];
}

void atk64_statusanimation(void)
{
    if (!gBattleControllerExecFlags)
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        if (!(gStatuses3[gActiveBattler] & STATUS3_SEMI_INVULNERABLE)
            && gDisableStructs[gActiveBattler].substituteHP == 0
            && !(gHitMarker & HITMARKER_NO_ANIMATIONS))
        {
            BtlController_EmitStatusAnimation(0, FALSE, gBattleMons[gActiveBattler].status1);
            MarkBattlerForControllerExec(gActiveBattler);
        }
        gBattlescriptCurrInstr += 2;
    }
}

void atk65_status2animation(void)
{
    u32 wantedToAnimate;

    if (!gBattleControllerExecFlags)
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        wantedToAnimate = T1_READ_32(gBattlescriptCurrInstr + 2);
        if (!(gStatuses3[gActiveBattler] & STATUS3_SEMI_INVULNERABLE)
            && gDisableStructs[gActiveBattler].substituteHP == 0
            && !(gHitMarker & HITMARKER_NO_ANIMATIONS))
        {
            BtlController_EmitStatusAnimation(0, TRUE, gBattleMons[gActiveBattler].status2 & wantedToAnimate);
            MarkBattlerForControllerExec(gActiveBattler);
        }
        gBattlescriptCurrInstr += 6;
    }
}

void atk66_chosenstatusanimation(void)
{
    u32 wantedStatus;

    if (!gBattleControllerExecFlags)
    {
        gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
        wantedStatus = T1_READ_32(gBattlescriptCurrInstr + 3);
        if (!(gStatuses3[gActiveBattler] & STATUS3_SEMI_INVULNERABLE)
         && gDisableStructs[gActiveBattler].substituteHP == 0
         && !(gHitMarker & HITMARKER_NO_ANIMATIONS))
        {
            BtlController_EmitStatusAnimation(0, gBattlescriptCurrInstr[2], wantedStatus);
            MarkBattlerForControllerExec(gActiveBattler);
        }
        gBattlescriptCurrInstr += 7;
    }
}

void atk67_yesnobox(void)
{
    switch (gBattleCommunication[0])
    {
    case 0:
        HandleBattleWindow(0x17, 8, 0x1D, 0xD, 0);
        BattlePutTextOnWindow(gText_BattleYesNoChoice, 0xE);
        ++gBattleCommunication[0];
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
            HandleBattleWindow(0x17, 8, 0x1D, 0xD, WINDOW_CLEAR);
            ++gBattlescriptCurrInstr;
        }
        else if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            HandleBattleWindow(0x17, 8, 0x1D, 0xD, WINDOW_CLEAR);
            ++gBattlescriptCurrInstr;
        }
        break;
    }
}

void atk68_cancelallactions(void)
{
    s32 i;

    for (i = 0; i < gBattlersCount; ++i)
        gActionsByTurnOrder[i] = B_ACTION_CANCEL_PARTNER;
    ++gBattlescriptCurrInstr;
}

// The same as 0x7, except there's no random damage multiplier.
void atk69_adjustsetdamage(void)
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
     && (gBattleMoves[gCurrentMove].effect == EFFECT_FALSE_SWIPE || gProtectStructs[gBattlerTarget].endured || gSpecialStatuses[gBattlerTarget].focusBanded)
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
    ++gBattlescriptCurrInstr;
}

void atk6A_removeitem(void)
{
    u16 *usedHeldItem;

    gActiveBattler = GetBattlerForBattleScript(gBattlescriptCurrInstr[1]);
    usedHeldItem = &gBattleStruct->usedHeldItems[gActiveBattler];
    *usedHeldItem = gBattleMons[gActiveBattler].item;
    gBattleMons[gActiveBattler].item = ITEM_NONE;
    BtlController_EmitSetMonData(0, REQUEST_HELDITEM_BATTLE, 0, 2, &gBattleMons[gActiveBattler].item);
    MarkBattlerForControllerExec(gActiveBattler);
    gBattlescriptCurrInstr += 2;
}

void atk6B_atknameinbuff1(void)
{
    PREPARE_MON_NICK_BUFFER(gBattleTextBuff1, gBattlerAttacker, gBattlerPartyIndexes[gBattlerAttacker])
    ++gBattlescriptCurrInstr;
}
