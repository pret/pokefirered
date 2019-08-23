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
#include "pokemon_storage_system.h"
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
u8 ChangeStatBuffs(s8 statValue, u8 statId, u8, const u8* BS_ptr);
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
void atkF8_trainerslideout(void);

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
const u8 sRubyLevelUpStatBoxStats[] =
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

const u16 sPickupItems[] =
{
    ITEM_ORAN_BERRY,
    ITEM_BURN_HEAL,
    ITEM_CHERI_BERRY,
    ITEM_MAX_REVIVE,
    ITEM_CHESTO_BERRY,
    ITEM_MAX_ETHER,
    ITEM_PECHA_BERRY,
    ITEM_SACRED_ASH,
    ITEM_RAWST_BERRY,
    ITEM_037,
    ITEM_ASPEAR_BERRY,
    ITEM_IRON,
    ITEM_PERSIM_BERRY,
    ITEM_X_ATTACK,
    ITEM_TM10,
    ITEM_POKE_DOLL,
    ITEM_PP_UP,
    ITEM_ESCAPE_ROPE,
    ITEM_RARE_CANDY,
    ITEM_05A,
    ITEM_NUGGET,
    ITEM_FIRE_STONE,
    ITEM_SPELON_BERRY,
    ITEM_THUNDER_STONE,
    ITEM_PAMTRE_BERRY,
    ITEM_WATER_STONE,
    ITEM_WATMEL_BERRY,
    ITEM_LEAF_STONE,
    ITEM_DURIN_BERRY,
    ITEM_063,
    ITEM_BELUE_BERRY,
    ITEM_MASTER_BALL
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

const u32 gUnknown_8250898 = 0xFF7EAE60;
