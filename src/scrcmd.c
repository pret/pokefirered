#include "global.h"
#include "gba/isagbprint.h"
#include "palette.h"
#include "script.h"
#include "mystery_event_script.h"
#include "event_data.h"
#include "random.h"
#include "item.h"
#include "overworld.h"
#include "field_screen_effect.h"
#include "quest_log.h"
#include "map_preview_screen.h"
#include "field_weather.h"
#include "field_tasks.h"
#include "field_fadetransition.h"
#include "field_player_avatar.h"
#include "sound.h"
#include "script_movement.h"
#include "field_map_obj.h"
#include "field_map_obj_helpers.h"
#include "map_obj_lock.h"
#include "field_message_box.h"

extern u16 (*const gSpecials[])(void);
extern u16 (*const gSpecialsEnd[])(void);
extern const u8 *const gStdScripts[];
extern const u8 *const gStdScriptsEnd[];

EWRAM_DATA ptrdiff_t gVScriptOffset = 0;
EWRAM_DATA u8 gUnknown_20370AC = 0;
EWRAM_DATA u16 sPauseCounter = 0;
EWRAM_DATA u16 sMovingNpcId = 0;
EWRAM_DATA u16 sMovingNpcMapBank = 0;
EWRAM_DATA u16 sMovingNpcMapId = 0;
EWRAM_DATA u16 gUnknown_20370B6 = 0;

extern u8 gSelectedEventObject;

// This is defined in here so the optimizer can't see its value when compiling
// script.c.
void * const gNullScriptPtr = NULL;

const u8 sScriptConditionTable[6][3] =
    {
//  <  =  >
        1, 0, 0, // <
        0, 1, 0, // =
        0, 0, 1, // >
        1, 1, 0, // <=
        0, 1, 1, // >=
        1, 0, 1, // !=
    };



#define SCRCMD_DEF(name) bool8 name(struct ScriptContext *ctx)

SCRCMD_DEF(ScrCmd_nop)
{
    return FALSE;
}

SCRCMD_DEF(ScrCmd_nop1)
{
    return FALSE;
}

SCRCMD_DEF(ScrCmd_end)
{
    StopScript(ctx);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_gotonative)
{
    bool8 (*func)(void) = (bool8 (*)(void))ScriptReadWord(ctx);
    SetupNativeScript(ctx, func);
    return TRUE;
}

SCRCMD_DEF(ScrCmd_special)
{
    u16 (*const *specialPtr)(void) = gSpecials + ScriptReadHalfword(ctx);
    if (specialPtr < gSpecialsEnd)
        (*specialPtr)();
    else
         AGB_ASSERT_EX(0, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/scrcmd.c", 241);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_specialvar)
{
    u16 * varPtr = GetVarPointer(ScriptReadHalfword(ctx));
    u16 (*const *specialPtr)(void) = gSpecials + ScriptReadHalfword(ctx);
    if (specialPtr < gSpecialsEnd)
        *varPtr = (*specialPtr)();
    else
         AGB_ASSERT_EX(0, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/scrcmd.c", 263);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_callnative)
{
    void (*func )(void) = ((void (*)(void))ScriptReadWord(ctx));
    func();
    return FALSE;
}

SCRCMD_DEF(ScrCmd_waitstate)
{
    ScriptContext1_Stop();
    return TRUE;
}

SCRCMD_DEF(ScrCmd_goto)
{
    const u8 * scrptr = (const u8 *)ScriptReadWord(ctx);
    ScriptJump(ctx, scrptr);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_return)
{
    ScriptReturn(ctx);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_call)
{
    const u8 * scrptr = (const u8 *)ScriptReadWord(ctx);
    ScriptCall(ctx, scrptr);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_goto_if)
{
    u8 condition = ScriptReadByte(ctx);
    const u8 * scrptr = (const u8 *)ScriptReadWord(ctx);
    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
        ScriptJump(ctx, scrptr);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_call_if)
{
    u8 condition = ScriptReadByte(ctx);
    const u8 * scrptr = (const u8 *)ScriptReadWord(ctx);
    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
        ScriptCall(ctx, scrptr);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_setvaddress)
{
    u32 addr1 = (u32)ctx->scriptPtr - 1;
    u32 addr2 = ScriptReadWord(ctx);

    gVScriptOffset = addr2 - addr1;
    return FALSE;
}

SCRCMD_DEF(ScrCmd_vgoto)
{
    const u8 * scrptr = (const u8 *)ScriptReadWord(ctx);
    ScriptJump(ctx, scrptr - gVScriptOffset);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_vcall)
{
    const u8 * scrptr = (const u8 *)ScriptReadWord(ctx);
    ScriptCall(ctx, scrptr - gVScriptOffset);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_vgoto_if)
{
    u8 condition = ScriptReadByte(ctx);
    const u8 * scrptr = (const u8 *)ScriptReadWord(ctx) - gVScriptOffset;
    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
        ScriptJump(ctx, scrptr);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_vcall_if)
{
    u8 condition = ScriptReadByte(ctx);
    const u8 * scrptr = (const u8 *)ScriptReadWord(ctx) - gVScriptOffset;
    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
        ScriptCall(ctx, scrptr);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_gotostd)
{
    u8 stdIdx = ScriptReadByte(ctx);
    const u8 *const * script = gStdScripts + stdIdx;
    if (script < gStdScriptsEnd)
        ScriptJump(ctx, *script);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_callstd)
{
    u8 stdIdx = ScriptReadByte(ctx);
    const u8 *const * script = gStdScripts + stdIdx;
    if (script < gStdScriptsEnd)
        ScriptCall(ctx, *script);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_gotostd_if)
{
    u8 condition = ScriptReadByte(ctx);
    u8 stdIdx = ScriptReadByte(ctx);
    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
    {
        const u8 *const * script = gStdScripts + stdIdx;
        if (script < gStdScriptsEnd)
            ScriptJump(ctx, *script);
    }
    return FALSE;
}

SCRCMD_DEF(ScrCmd_callstd_if)
{
    u8 condition = ScriptReadByte(ctx);
    u8 stdIdx = ScriptReadByte(ctx);
    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
    {
        const u8 *const * script = gStdScripts + stdIdx;
        if (script < gStdScriptsEnd)
            ScriptCall(ctx, *script);
    }
    return FALSE;
}

SCRCMD_DEF(ScrCmd_gotoram)
{
    ScriptJump(ctx, gRAMScriptPtr);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_killscript)
{
    ClearRamScript();
    StopScript(ctx);
    return TRUE;
}

SCRCMD_DEF(ScrCmd_setmysteryeventstatus)
{
    SetMysteryEventScriptStatus(ScriptReadByte(ctx));
    return FALSE;
}

SCRCMD_DEF(ScrCmd_cmdCF)
{
    const u8 * script = sub_8069E48();
    if (script != NULL)
    {
        gRAMScriptPtr = ctx->scriptPtr;
        ScriptJump(ctx, script);
    }
    return FALSE;
}

SCRCMD_DEF(ScrCmd_loadword)
{
    u8 which = ScriptReadByte(ctx);
    ctx->data[which] = ScriptReadWord(ctx);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_loadbytefromaddr)
{
    u8 which = ScriptReadByte(ctx);
    ctx->data[which] = *(const u8 *)ScriptReadWord(ctx);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_writebytetoaddr)
{
    u8 value = ScriptReadByte(ctx);
    *(u8 *)ScriptReadWord(ctx) = value;
    return FALSE;
}

SCRCMD_DEF(ScrCmd_loadbyte)
{
    u8 which = ScriptReadByte(ctx);
    ctx->data[which] = ScriptReadByte(ctx);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_setptrbyte)
{
    u8 which = ScriptReadByte(ctx);
    *(u8 *)ScriptReadWord(ctx) = ctx->data[which];
    return FALSE;
}

SCRCMD_DEF(ScrCmd_copylocal)
{
    u8 whichDst = ScriptReadByte(ctx);
    u8 whichSrc = ScriptReadByte(ctx);
    ctx->data[whichDst] = ctx->data[whichSrc];
    return FALSE;
}

SCRCMD_DEF(ScrCmd_copybyte)
{
    u8 * dest = (u8 *)ScriptReadWord(ctx);
    *dest = *(const u8 *)ScriptReadWord(ctx);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_setvar)
{
    u16 * varPtr = GetVarPointer(ScriptReadHalfword(ctx));
    *varPtr = ScriptReadHalfword(ctx);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_copyvar)
{
    u16 * destPtr = GetVarPointer(ScriptReadHalfword(ctx));
    u16 * srcPtr = GetVarPointer(ScriptReadHalfword(ctx));
    *destPtr = *srcPtr;
    return FALSE;
}

SCRCMD_DEF(ScrCmd_setorcopyvar)
{
    u16 * destPtr = GetVarPointer(ScriptReadHalfword(ctx));
    *destPtr = VarGet(ScriptReadHalfword(ctx));
    return FALSE;
}

u8 * const sScriptStringVars[] =
{
    gStringVar1,
    gStringVar2,
    gStringVar3,
};

u8 compare_012(u16 left, u16 right)
{
    if (left < right)
        return 0;
    else if (left == right)
        return 1;
    else
        return 2;
}

// comparelocaltolocal
SCRCMD_DEF(ScrCmd_compare_local_to_local)
{
    const u8 value1 = ctx->data[ScriptReadByte(ctx)];
    const u8 value2 = ctx->data[ScriptReadByte(ctx)];

    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

// comparelocaltoimm
SCRCMD_DEF(ScrCmd_compare_local_to_value)
{
    const u8 value1 = ctx->data[ScriptReadByte(ctx)];
    const u8 value2 = ScriptReadByte(ctx);

    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_compare_local_to_addr)
{
    const u8 value1 = ctx->data[ScriptReadByte(ctx)];
    const u8 value2 = *(const u8 *)ScriptReadWord(ctx);

    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_compare_addr_to_local)
{
    const u8 value1 = *(const u8 *)ScriptReadWord(ctx);
    const u8 value2 = ctx->data[ScriptReadByte(ctx)];

    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_compare_addr_to_value)
{
    const u8 value1 = *(const u8 *)ScriptReadWord(ctx);
    const u8 value2 = ScriptReadByte(ctx);

    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_compare_addr_to_addr)
{
    const u8 value1 = *(const u8 *)ScriptReadWord(ctx);
    const u8 value2 = *(const u8 *)ScriptReadWord(ctx);

    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_compare_var_to_value)
{
    const u16 value1 = *GetVarPointer(ScriptReadHalfword(ctx));
    const u16 value2 = ScriptReadHalfword(ctx);

    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_compare_var_to_var)
{
    const u16 *ptr1 = GetVarPointer(ScriptReadHalfword(ctx));
    const u16 *ptr2 = GetVarPointer(ScriptReadHalfword(ctx));

    ctx->comparisonResult = compare_012(*ptr1, *ptr2);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_addvar)
{
    u16 *ptr = GetVarPointer(ScriptReadHalfword(ctx));
    *ptr += ScriptReadHalfword(ctx);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_subvar)
{
    u16 *ptr = GetVarPointer(ScriptReadHalfword(ctx));
    *ptr -= VarGet(ScriptReadHalfword(ctx));
    return FALSE;
}

SCRCMD_DEF(ScrCmd_random)
{
    u16 max = VarGet(ScriptReadHalfword(ctx));

    gSpecialVar_Result = Random() % max;
    return FALSE;
}

SCRCMD_DEF(ScrCmd_giveitem)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u32 quantity = VarGet(ScriptReadHalfword(ctx));

    gSpecialVar_Result = AddBagItem(itemId, (u8)quantity);
    sub_809A824(itemId);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_takeitem)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u32 quantity = VarGet(ScriptReadHalfword(ctx));

    gSpecialVar_Result = RemoveBagItem(itemId, (u8)quantity);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_checkitemspace)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u32 quantity = VarGet(ScriptReadHalfword(ctx));

    gSpecialVar_Result = CheckBagHasSpace(itemId, (u8)quantity);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_checkitem)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u32 quantity = VarGet(ScriptReadHalfword(ctx));

    gSpecialVar_Result = CheckBagHasItem(itemId, (u8)quantity);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_checkitemtype)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));

    gSpecialVar_Result = GetPocketByItemId(itemId);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_givepcitem)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u16 quantity = VarGet(ScriptReadHalfword(ctx));

    gSpecialVar_Result = AddPCItem(itemId, quantity);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_checkpcitem)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u16 quantity = VarGet(ScriptReadHalfword(ctx));

    gSpecialVar_Result = CheckPCHasItem(itemId, quantity);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_givedecoration)
{
    u32 decorId = VarGet(ScriptReadHalfword(ctx));

//    gSpecialVar_Result = DecorationAdd(decorId);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_takedecoration)
{
    u32 decorId = VarGet(ScriptReadHalfword(ctx));

//    gSpecialVar_Result = DecorationRemove(decorId);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_checkdecorspace)
{
    u32 decorId = VarGet(ScriptReadHalfword(ctx));

//    gSpecialVar_Result = DecorationCheckSpace(decorId);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_checkdecor)
{
    u32 decorId = VarGet(ScriptReadHalfword(ctx));

//    gSpecialVar_Result = CheckHasDecoration(decorId);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_setflag)
{
    FlagSet(ScriptReadHalfword(ctx));
    return FALSE;
}

SCRCMD_DEF(ScrCmd_clearflag)
{
    FlagClear(ScriptReadHalfword(ctx));
    return FALSE;
}

SCRCMD_DEF(ScrCmd_checkflag)
{
    ctx->comparisonResult = FlagGet(ScriptReadHalfword(ctx));
    return FALSE;
}

SCRCMD_DEF(ScrCmd_incrementgamestat)
{
    IncrementGameStat(ScriptReadByte(ctx));
    return FALSE;
}

SCRCMD_DEF(ScrCmd_comparestattoword)
{
    u8 statIdx = ScriptReadByte(ctx);
    u32 value = ScriptReadWord(ctx);
    u32 statValue = GetGameStat(statIdx);

    if (statValue < value)
        ctx ->comparisonResult = 0;
    else if (statValue == value)
        ctx->comparisonResult = 1;
    else
        ctx->comparisonResult = 2;
    return FALSE;
}

SCRCMD_DEF(ScrCmd_cmdD0)
{
    u16 value = ScriptReadHalfword(ctx);
    sub_8115748(value);
    sub_80F85BC(value);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_animateflash)
{
    sub_807F028(ScriptReadByte(ctx));
    ScriptContext1_Stop();
    return TRUE;
}

SCRCMD_DEF(ScrCmd_setflashradius)
{
    u16 flashLevel = VarGet(ScriptReadHalfword(ctx));

    Overworld_SetFlashLevel(flashLevel);
    return FALSE;
}

static bool8 IsPaletteNotActive(void)
{
    if (!gPaletteFade.active)
        return TRUE;
    else
        return FALSE;
}

SCRCMD_DEF(ScrCmd_fadescreen)
{
    fade_screen(ScriptReadByte(ctx), 0);
    SetupNativeScript(ctx, IsPaletteNotActive);
    return TRUE;
}

SCRCMD_DEF(ScrCmd_fadescreenspeed)
{
    u8 mode = ScriptReadByte(ctx);
    u8 speed = ScriptReadByte(ctx);

    fade_screen(mode, speed);
    SetupNativeScript(ctx, IsPaletteNotActive);
    return TRUE;
}

static bool8 RunPauseTimer(void)
{
    sPauseCounter--;

    if (sPauseCounter == 0)
        return TRUE;
    else
        return FALSE;
}

SCRCMD_DEF(ScrCmd_delay)
{
    sPauseCounter = ScriptReadHalfword(ctx);
    SetupNativeScript(ctx, RunPauseTimer);
    return TRUE;
}

SCRCMD_DEF(ScrCmd_initclock)
{
//    u8 hour = VarGet(ScriptReadHalfword(ctx));
//    u8 minute = VarGet(ScriptReadHalfword(ctx));
//
//    RtcInitLocalTimeOffset(hour, minute);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_dodailyevents)
{
//    DoTimeBasedEvents();
    return FALSE;
}

SCRCMD_DEF(ScrCmd_gettime)
{
//    RtcCalcLocalTime();
//    gSpecialVar_0x8000 = gLocalTime.hours;
//    gSpecialVar_0x8001 = gLocalTime.minutes;
//    gSpecialVar_0x8002 = gLocalTime.seconds;
    gSpecialVar_0x8000 = 0;
    gSpecialVar_0x8001 = 0;
    gSpecialVar_0x8002 = 0;
    return FALSE;
}

SCRCMD_DEF(ScrCmd_setweather)
{
    u16 weather = VarGet(ScriptReadHalfword(ctx));

    SetSav1Weather(weather);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_resetweather)
{
    SetSav1WeatherFromCurrMapHeader();
    return FALSE;
}

SCRCMD_DEF(ScrCmd_doweather)
{
    DoCurrentWeather();
    return FALSE;
}

SCRCMD_DEF(ScrCmd_setstepcallback)
{
    ActivatePerStepCallback(ScriptReadByte(ctx));
    return FALSE;
}

SCRCMD_DEF(ScrCmd_setmaplayoutindex)
{
    u16 value = VarGet(ScriptReadHalfword(ctx));

    SetCurrentMapLayout(value);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_warp)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Overworld_SetWarpDestination(mapGroup, mapNum, warpId, x, y);
    DoWarp();
    ResetInitialPlayerAvatarState();
    return TRUE;
}

SCRCMD_DEF(ScrCmd_warpsilent)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Overworld_SetWarpDestination(mapGroup, mapNum, warpId, x, y);
    DoDiveWarp();
    ResetInitialPlayerAvatarState();
    return TRUE;
}

SCRCMD_DEF(ScrCmd_warpdoor)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Overworld_SetWarpDestination(mapGroup, mapNum, warpId, x, y);
    DoDoorWarp();
    ResetInitialPlayerAvatarState();
    return TRUE;
}

SCRCMD_DEF(ScrCmd_warphole)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u16 x;
    u16 y;

    PlayerGetDestCoords(&x, &y);
    if (mapGroup == 0xFF && mapNum == 0xFF)
        SetWarpDestinationToFixedHoleWarp(x - 7, y - 7);
    else
        Overworld_SetWarpDestination(mapGroup, mapNum, -1, x - 7, y - 7);
    DoFallWarp();
    ResetInitialPlayerAvatarState();
    return TRUE;
}

SCRCMD_DEF(ScrCmd_warpteleport)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Overworld_SetWarpDestination(mapGroup, mapNum, warpId, x, y);
    sub_807E59C();
    ResetInitialPlayerAvatarState();
    return TRUE;
}

SCRCMD_DEF(ScrCmd_warpD1)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Overworld_SetWarpDestination(mapGroup, mapNum, warpId, x, y);
    sub_805DAE4(player_get_direction_lower_nybble());
    sub_807E500();
    ResetInitialPlayerAvatarState();
    return TRUE;
}

SCRCMD_DEF(ScrCmd_setwarp)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Overworld_SetWarpDestination(mapGroup, mapNum, warpId, x, y);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_setdynamicwarp)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    SetDynamicWarpWithCoords(0, mapGroup, mapNum, warpId, x, y);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_setdivewarp)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    SetFixedDiveWarp(mapGroup, mapNum, warpId, x, y);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_setholewarp)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    SetFixedHoleWarp(mapGroup, mapNum, warpId, x, y);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_setescapewarp)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    SetEscapeWarp(mapGroup, mapNum, warpId, x, y);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_getplayerxy)
{
    u16 *pX = GetVarPointer(ScriptReadHalfword(ctx));
    u16 *pY = GetVarPointer(ScriptReadHalfword(ctx));

    *pX = gSaveBlock1Ptr->pos.x;
    *pY = gSaveBlock1Ptr->pos.y;
    return FALSE;
}

SCRCMD_DEF(ScrCmd_getpartysize)
{
    gSpecialVar_Result = CalculatePlayerPartyCount();
    return FALSE;
}

SCRCMD_DEF(ScrCmd_playse)
{
    PlaySE(ScriptReadHalfword(ctx));
    return FALSE;
}

static bool8 WaitForSoundEffectFinish(void)
{
    if (!IsSEPlaying())
        return TRUE;
    else
        return FALSE;
}

SCRCMD_DEF(ScrCmd_waitse)
{
    SetupNativeScript(ctx, WaitForSoundEffectFinish);
    return TRUE;
}

SCRCMD_DEF(ScrCmd_playfanfare)
{
    PlayFanfare(ScriptReadHalfword(ctx));
    return FALSE;
}

static bool8 WaitForFanfareFinish(void)
{
    return IsFanfareTaskInactive();
}

SCRCMD_DEF(ScrCmd_waitfanfare)
{
    SetupNativeScript(ctx, WaitForFanfareFinish);
    return TRUE;
}

SCRCMD_DEF(ScrCmd_playbgm)
{
    u16 songId = ScriptReadHalfword(ctx);
    bool8 val = ScriptReadByte(ctx);

    if (gUnknown_203ADFA == 2 || gUnknown_203ADFA == 3)
        return FALSE;
    if (val == TRUE)
        Overworld_SetSavedMusic(songId);
    PlayNewMapMusic(songId);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_savebgm)
{
    Overworld_SetSavedMusic(ScriptReadHalfword(ctx));
    return FALSE;
}

SCRCMD_DEF(ScrCmd_fadedefaultbgm)
{
    if (gUnknown_203ADFA == 2 || gUnknown_203ADFA == 3)
        return FALSE;
    Overworld_ChangeMusicToDefault();
    return FALSE;
}

SCRCMD_DEF(ScrCmd_fadenewbgm)
{
    u16 music = ScriptReadHalfword(ctx);
    if (gUnknown_203ADFA == 2 || gUnknown_203ADFA == 3)
        return FALSE;
    Overworld_ChangeMusicTo(music);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_fadeoutbgm)
{
    u8 speed = ScriptReadByte(ctx);

    if (gUnknown_203ADFA == 2 || gUnknown_203ADFA == 3)
        return FALSE;
    if (speed != 0)
        FadeOutBGMTemporarily(4 * speed);
    else
        FadeOutBGMTemporarily(4);
    SetupNativeScript(ctx, IsBGMPausedOrStopped);
    return TRUE;
}

SCRCMD_DEF(ScrCmd_fadeinbgm)
{
    u8 speed = ScriptReadByte(ctx);

    if (gUnknown_203ADFA == 2 || gUnknown_203ADFA == 3)
        return FALSE;
    if (speed != 0)
        FadeInBGM(4 * speed);
    else
        FadeInBGM(4);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_applymovement)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    const void *movementScript = (const void *)ScriptReadWord(ctx);

    ScriptMovement_StartObjectMovementScript(localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, movementScript);
    sMovingNpcId = localId;
    return FALSE;
}

SCRCMD_DEF(ScrCmd_applymovement_at)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    const void *movementScript = (const void *)ScriptReadWord(ctx);
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);

    ScriptMovement_StartObjectMovementScript(localId, mapNum, mapGroup, movementScript);
    sMovingNpcId = localId;
    return FALSE;
}

static bool8 WaitForMovementFinish(void)
{
    return ScriptMovement_IsObjectMovementFinished(sMovingNpcId, sMovingNpcMapId, sMovingNpcMapBank);
}

SCRCMD_DEF(ScrCmd_waitmovement)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));

    if (localId != 0)
        sMovingNpcId = localId;
    sMovingNpcMapBank = gSaveBlock1Ptr->location.mapGroup;
    sMovingNpcMapId = gSaveBlock1Ptr->location.mapNum;
    SetupNativeScript(ctx, WaitForMovementFinish);
    return TRUE;
}

SCRCMD_DEF(ScrCmd_waitmovement_at)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 mapBank;
    u8 mapId;

    if (localId != 0)
        sMovingNpcId = localId;
    mapBank = ScriptReadByte(ctx);
    mapId = ScriptReadByte(ctx);
    sMovingNpcMapBank = mapBank;
    sMovingNpcMapId = mapId;
    SetupNativeScript(ctx, WaitForMovementFinish);
    return TRUE;
}

SCRCMD_DEF(ScrCmd_removeobject)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));

    RemoveFieldObjectByLocalIdAndMap(localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_removeobject_at)
{
    u16 objectId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);

    RemoveFieldObjectByLocalIdAndMap(objectId, mapNum, mapGroup);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_addobject)
{
    u16 objectId = VarGet(ScriptReadHalfword(ctx));

    show_sprite(objectId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_addobject_at)
{
    u16 objectId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);

    show_sprite(objectId, mapNum, mapGroup);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_setobjectxy)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    sub_805F7C4(localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, x, y);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_setobjectxyperm)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Overworld_SetMapObjTemplateCoords(localId, x, y);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_moveobjectoffscreen)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));

    sub_805FE94(localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_showobject_at)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);

    npc_by_local_id_and_map_set_field_1_bit_x20(localId, mapNum, mapGroup, 0);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_hideobject_at)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);

    npc_by_local_id_and_map_set_field_1_bit_x20(localId, mapNum, mapGroup, 1);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_setobjectpriority)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 priority = ScriptReadByte(ctx);

    sub_805F3A8(localId, mapNum, mapGroup, priority + 83);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_resetobjectpriority)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);

    sub_805F400(localId, mapNum, mapGroup);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_faceplayer)
{
    if (gMapObjects[gSelectedEventObject].active)
    {
        FieldObjectFaceOppositeDirection(&gMapObjects[gSelectedEventObject],
                                         player_get_direction_lower_nybble());
    }
    return FALSE;
}

SCRCMD_DEF(ScrCmd_turnobject)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 direction = ScriptReadByte(ctx);

    FieldObjectTurnByLocalIdAndMap(localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, direction);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_setobjectmovementtype)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 movementType = ScriptReadByte(ctx);

    Overworld_SetMapObjTemplateMovementType(localId, movementType);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_createvobject)
{
    u8 graphicsId = ScriptReadByte(ctx);
    u8 v2 = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u32 y = VarGet(ScriptReadHalfword(ctx));
    u8 elevation = ScriptReadByte(ctx);
    u8 direction = ScriptReadByte(ctx);

    sprite_new(graphicsId, v2, x, y, elevation, direction);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_turnvobject)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 direction = ScriptReadByte(ctx);

    sub_8069058(v1, direction);
    return FALSE;
}

SCRCMD_DEF(ScrCmd_lockall)
{
    if (is_c1_link_related_active())
    {
        return FALSE;
    }
    else
    {
        ScriptFreezeMapObjects();
        SetupNativeScript(ctx, sub_8069590);
        return TRUE;
    }
}

SCRCMD_DEF(ScrCmd_lock)
{
    if (is_c1_link_related_active())
    {
        return FALSE;
    }
    else
    {
        if (gMapObjects[gSelectedEventObject].active)
        {
            LockSelectedMapObject();
            SetupNativeScript(ctx, sub_8069648);
        }
        else
        {
            ScriptFreezeMapObjects();
            SetupNativeScript(ctx, sub_8069590);
        }
        return TRUE;
    }
}

SCRCMD_DEF(ScrCmd_releaseall)
{
    u8 playerObjectId;

    HideFieldMessageBox();
    playerObjectId = GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0);
    FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[playerObjectId]);
    sub_80974D8();
    UnfreezeMapObjects();
    return FALSE;
}

SCRCMD_DEF(ScrCmd_release)
{
    u8 playerObjectId;

    HideFieldMessageBox();
    if (gMapObjects[gSelectedEventObject].active)
        FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[gSelectedEventObject]);
    playerObjectId = GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0);
    FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[playerObjectId]);
    sub_80974D8();
    UnfreezeMapObjects();
    return FALSE;
}
