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

const u32 gUnknown_8250898 = 0xFF7EAE60;

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
void ModulateDmgByType2(u8 multiplier, u16 move, u8* flags)
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

