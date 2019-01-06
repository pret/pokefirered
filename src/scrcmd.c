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
#include "new_menu_helpers.h"
#include "window.h"
#include "start_menu.h"

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



#define SCRCMD_DEF(name) bool8 ScrCmd_##name(struct ScriptContext *ctx)

SCRCMD_DEF(nop)
{
    return FALSE;
}

SCRCMD_DEF(nop1)
{
    return FALSE;
}

SCRCMD_DEF(end)
{
    StopScript(ctx);
    return FALSE;
}

SCRCMD_DEF(gotonative)
{
    bool8 (*func)(void) = (bool8 (*)(void))ScriptReadWord(ctx);
    SetupNativeScript(ctx, func);
    return TRUE;
}

SCRCMD_DEF(special)
{
    u16 (*const *specialPtr)(void) = gSpecials + ScriptReadHalfword(ctx);
    if (specialPtr < gSpecialsEnd)
        (*specialPtr)();
    else
         AGB_ASSERT_EX(0, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/scrcmd.c", 241);
    return FALSE;
}

SCRCMD_DEF(specialvar)
{
    u16 * varPtr = GetVarPointer(ScriptReadHalfword(ctx));
    u16 (*const *specialPtr)(void) = gSpecials + ScriptReadHalfword(ctx);
    if (specialPtr < gSpecialsEnd)
        *varPtr = (*specialPtr)();
    else
         AGB_ASSERT_EX(0, "C:/WORK/POKeFRLG/src/pm_lgfr_ose/source/scrcmd.c", 263);
    return FALSE;
}

SCRCMD_DEF(callnative)
{
    void (*func )(void) = ((void (*)(void))ScriptReadWord(ctx));
    func();
    return FALSE;
}

SCRCMD_DEF(waitstate)
{
    ScriptContext1_Stop();
    return TRUE;
}

SCRCMD_DEF(goto)
{
    const u8 * scrptr = (const u8 *)ScriptReadWord(ctx);
    ScriptJump(ctx, scrptr);
    return FALSE;
}

SCRCMD_DEF(return)
{
    ScriptReturn(ctx);
    return FALSE;
}

SCRCMD_DEF(call)
{
    const u8 * scrptr = (const u8 *)ScriptReadWord(ctx);
    ScriptCall(ctx, scrptr);
    return FALSE;
}

SCRCMD_DEF(goto_if)
{
    u8 condition = ScriptReadByte(ctx);
    const u8 * scrptr = (const u8 *)ScriptReadWord(ctx);
    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
        ScriptJump(ctx, scrptr);
    return FALSE;
}

SCRCMD_DEF(call_if)
{
    u8 condition = ScriptReadByte(ctx);
    const u8 * scrptr = (const u8 *)ScriptReadWord(ctx);
    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
        ScriptCall(ctx, scrptr);
    return FALSE;
}

SCRCMD_DEF(setvaddress)
{
    u32 addr1 = (u32)ctx->scriptPtr - 1;
    u32 addr2 = ScriptReadWord(ctx);

    gVScriptOffset = addr2 - addr1;
    return FALSE;
}

SCRCMD_DEF(vgoto)
{
    const u8 * scrptr = (const u8 *)ScriptReadWord(ctx);
    ScriptJump(ctx, scrptr - gVScriptOffset);
    return FALSE;
}

SCRCMD_DEF(vcall)
{
    const u8 * scrptr = (const u8 *)ScriptReadWord(ctx);
    ScriptCall(ctx, scrptr - gVScriptOffset);
    return FALSE;
}

SCRCMD_DEF(vgoto_if)
{
    u8 condition = ScriptReadByte(ctx);
    const u8 * scrptr = (const u8 *)ScriptReadWord(ctx) - gVScriptOffset;
    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
        ScriptJump(ctx, scrptr);
    return FALSE;
}

SCRCMD_DEF(vcall_if)
{
    u8 condition = ScriptReadByte(ctx);
    const u8 * scrptr = (const u8 *)ScriptReadWord(ctx) - gVScriptOffset;
    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
        ScriptCall(ctx, scrptr);
    return FALSE;
}

SCRCMD_DEF(gotostd)
{
    u8 stdIdx = ScriptReadByte(ctx);
    const u8 *const * script = gStdScripts + stdIdx;
    if (script < gStdScriptsEnd)
        ScriptJump(ctx, *script);
    return FALSE;
}

SCRCMD_DEF(callstd)
{
    u8 stdIdx = ScriptReadByte(ctx);
    const u8 *const * script = gStdScripts + stdIdx;
    if (script < gStdScriptsEnd)
        ScriptCall(ctx, *script);
    return FALSE;
}

SCRCMD_DEF(gotostd_if)
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

SCRCMD_DEF(callstd_if)
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

SCRCMD_DEF(gotoram)
{
    ScriptJump(ctx, gRAMScriptPtr);
    return FALSE;
}

SCRCMD_DEF(killscript)
{
    ClearRamScript();
    StopScript(ctx);
    return TRUE;
}

SCRCMD_DEF(setmysteryeventstatus)
{
    SetMysteryEventScriptStatus(ScriptReadByte(ctx));
    return FALSE;
}

SCRCMD_DEF(cmdCF)
{
    const u8 * script = sub_8069E48();
    if (script != NULL)
    {
        gRAMScriptPtr = ctx->scriptPtr;
        ScriptJump(ctx, script);
    }
    return FALSE;
}

SCRCMD_DEF(loadword)
{
    u8 which = ScriptReadByte(ctx);
    ctx->data[which] = ScriptReadWord(ctx);
    return FALSE;
}

SCRCMD_DEF(loadbytefromaddr)
{
    u8 which = ScriptReadByte(ctx);
    ctx->data[which] = *(const u8 *)ScriptReadWord(ctx);
    return FALSE;
}

SCRCMD_DEF(writebytetoaddr)
{
    u8 value = ScriptReadByte(ctx);
    *(u8 *)ScriptReadWord(ctx) = value;
    return FALSE;
}

SCRCMD_DEF(loadbyte)
{
    u8 which = ScriptReadByte(ctx);
    ctx->data[which] = ScriptReadByte(ctx);
    return FALSE;
}

SCRCMD_DEF(setptrbyte)
{
    u8 which = ScriptReadByte(ctx);
    *(u8 *)ScriptReadWord(ctx) = ctx->data[which];
    return FALSE;
}

SCRCMD_DEF(copylocal)
{
    u8 whichDst = ScriptReadByte(ctx);
    u8 whichSrc = ScriptReadByte(ctx);
    ctx->data[whichDst] = ctx->data[whichSrc];
    return FALSE;
}

SCRCMD_DEF(copybyte)
{
    u8 * dest = (u8 *)ScriptReadWord(ctx);
    *dest = *(const u8 *)ScriptReadWord(ctx);
    return FALSE;
}

SCRCMD_DEF(setvar)
{
    u16 * varPtr = GetVarPointer(ScriptReadHalfword(ctx));
    *varPtr = ScriptReadHalfword(ctx);
    return FALSE;
}

SCRCMD_DEF(copyvar)
{
    u16 * destPtr = GetVarPointer(ScriptReadHalfword(ctx));
    u16 * srcPtr = GetVarPointer(ScriptReadHalfword(ctx));
    *destPtr = *srcPtr;
    return FALSE;
}

SCRCMD_DEF(setorcopyvar)
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
SCRCMD_DEF(compare_local_to_local)
{
    const u8 value1 = ctx->data[ScriptReadByte(ctx)];
    const u8 value2 = ctx->data[ScriptReadByte(ctx)];

    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

// comparelocaltoimm
SCRCMD_DEF(compare_local_to_value)
{
    const u8 value1 = ctx->data[ScriptReadByte(ctx)];
    const u8 value2 = ScriptReadByte(ctx);

    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

SCRCMD_DEF(compare_local_to_addr)
{
    const u8 value1 = ctx->data[ScriptReadByte(ctx)];
    const u8 value2 = *(const u8 *)ScriptReadWord(ctx);

    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

SCRCMD_DEF(compare_addr_to_local)
{
    const u8 value1 = *(const u8 *)ScriptReadWord(ctx);
    const u8 value2 = ctx->data[ScriptReadByte(ctx)];

    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

SCRCMD_DEF(compare_addr_to_value)
{
    const u8 value1 = *(const u8 *)ScriptReadWord(ctx);
    const u8 value2 = ScriptReadByte(ctx);

    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

SCRCMD_DEF(compare_addr_to_addr)
{
    const u8 value1 = *(const u8 *)ScriptReadWord(ctx);
    const u8 value2 = *(const u8 *)ScriptReadWord(ctx);

    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

SCRCMD_DEF(compare_var_to_value)
{
    const u16 value1 = *GetVarPointer(ScriptReadHalfword(ctx));
    const u16 value2 = ScriptReadHalfword(ctx);

    ctx->comparisonResult = compare_012(value1, value2);
    return FALSE;
}

SCRCMD_DEF(compare_var_to_var)
{
    const u16 *ptr1 = GetVarPointer(ScriptReadHalfword(ctx));
    const u16 *ptr2 = GetVarPointer(ScriptReadHalfword(ctx));

    ctx->comparisonResult = compare_012(*ptr1, *ptr2);
    return FALSE;
}

SCRCMD_DEF(addvar)
{
    u16 *ptr = GetVarPointer(ScriptReadHalfword(ctx));
    *ptr += ScriptReadHalfword(ctx);
    return FALSE;
}

SCRCMD_DEF(subvar)
{
    u16 *ptr = GetVarPointer(ScriptReadHalfword(ctx));
    *ptr -= VarGet(ScriptReadHalfword(ctx));
    return FALSE;
}

SCRCMD_DEF(random)
{
    u16 max = VarGet(ScriptReadHalfword(ctx));

    gSpecialVar_Result = Random() % max;
    return FALSE;
}

SCRCMD_DEF(giveitem)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u32 quantity = VarGet(ScriptReadHalfword(ctx));

    gSpecialVar_Result = AddBagItem(itemId, (u8)quantity);
    sub_809A824(itemId);
    return FALSE;
}

SCRCMD_DEF(takeitem)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u32 quantity = VarGet(ScriptReadHalfword(ctx));

    gSpecialVar_Result = RemoveBagItem(itemId, (u8)quantity);
    return FALSE;
}

SCRCMD_DEF(checkitemspace)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u32 quantity = VarGet(ScriptReadHalfword(ctx));

    gSpecialVar_Result = CheckBagHasSpace(itemId, (u8)quantity);
    return FALSE;
}

SCRCMD_DEF(checkitem)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u32 quantity = VarGet(ScriptReadHalfword(ctx));

    gSpecialVar_Result = CheckBagHasItem(itemId, (u8)quantity);
    return FALSE;
}

SCRCMD_DEF(checkitemtype)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));

    gSpecialVar_Result = GetPocketByItemId(itemId);
    return FALSE;
}

SCRCMD_DEF(givepcitem)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u16 quantity = VarGet(ScriptReadHalfword(ctx));

    gSpecialVar_Result = AddPCItem(itemId, quantity);
    return FALSE;
}

SCRCMD_DEF(checkpcitem)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u16 quantity = VarGet(ScriptReadHalfword(ctx));

    gSpecialVar_Result = CheckPCHasItem(itemId, quantity);
    return FALSE;
}

SCRCMD_DEF(givedecoration)
{
    u32 decorId = VarGet(ScriptReadHalfword(ctx));

//    gSpecialVar_Result = DecorationAdd(decorId);
    return FALSE;
}

SCRCMD_DEF(takedecoration)
{
    u32 decorId = VarGet(ScriptReadHalfword(ctx));

//    gSpecialVar_Result = DecorationRemove(decorId);
    return FALSE;
}

SCRCMD_DEF(checkdecorspace)
{
    u32 decorId = VarGet(ScriptReadHalfword(ctx));

//    gSpecialVar_Result = DecorationCheckSpace(decorId);
    return FALSE;
}

SCRCMD_DEF(checkdecor)
{
    u32 decorId = VarGet(ScriptReadHalfword(ctx));

//    gSpecialVar_Result = CheckHasDecoration(decorId);
    return FALSE;
}

SCRCMD_DEF(setflag)
{
    FlagSet(ScriptReadHalfword(ctx));
    return FALSE;
}

SCRCMD_DEF(clearflag)
{
    FlagClear(ScriptReadHalfword(ctx));
    return FALSE;
}

SCRCMD_DEF(checkflag)
{
    ctx->comparisonResult = FlagGet(ScriptReadHalfword(ctx));
    return FALSE;
}

SCRCMD_DEF(incrementgamestat)
{
    IncrementGameStat(ScriptReadByte(ctx));
    return FALSE;
}

SCRCMD_DEF(comparestattoword)
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

SCRCMD_DEF(cmdD0)
{
    u16 value = ScriptReadHalfword(ctx);
    sub_8115748(value);
    sub_80F85BC(value);
    return FALSE;
}

SCRCMD_DEF(animateflash)
{
    sub_807F028(ScriptReadByte(ctx));
    ScriptContext1_Stop();
    return TRUE;
}

SCRCMD_DEF(setflashradius)
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

SCRCMD_DEF(fadescreen)
{
    fade_screen(ScriptReadByte(ctx), 0);
    SetupNativeScript(ctx, IsPaletteNotActive);
    return TRUE;
}

SCRCMD_DEF(fadescreenspeed)
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

SCRCMD_DEF(delay)
{
    sPauseCounter = ScriptReadHalfword(ctx);
    SetupNativeScript(ctx, RunPauseTimer);
    return TRUE;
}

SCRCMD_DEF(initclock)
{
//    u8 hour = VarGet(ScriptReadHalfword(ctx));
//    u8 minute = VarGet(ScriptReadHalfword(ctx));
//
//    RtcInitLocalTimeOffset(hour, minute);
    return FALSE;
}

SCRCMD_DEF(dodailyevents)
{
//    DoTimeBasedEvents();
    return FALSE;
}

SCRCMD_DEF(gettime)
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

SCRCMD_DEF(setweather)
{
    u16 weather = VarGet(ScriptReadHalfword(ctx));

    SetSav1Weather(weather);
    return FALSE;
}

SCRCMD_DEF(resetweather)
{
    SetSav1WeatherFromCurrMapHeader();
    return FALSE;
}

SCRCMD_DEF(doweather)
{
    DoCurrentWeather();
    return FALSE;
}

SCRCMD_DEF(setstepcallback)
{
    ActivatePerStepCallback(ScriptReadByte(ctx));
    return FALSE;
}

SCRCMD_DEF(setmaplayoutindex)
{
    u16 value = VarGet(ScriptReadHalfword(ctx));

    SetCurrentMapLayout(value);
    return FALSE;
}

SCRCMD_DEF(warp)
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

SCRCMD_DEF(warpsilent)
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

SCRCMD_DEF(warpdoor)
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

SCRCMD_DEF(warphole)
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

SCRCMD_DEF(warpteleport)
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

SCRCMD_DEF(warpD1)
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

SCRCMD_DEF(setwarp)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Overworld_SetWarpDestination(mapGroup, mapNum, warpId, x, y);
    return FALSE;
}

SCRCMD_DEF(setdynamicwarp)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    SetDynamicWarpWithCoords(0, mapGroup, mapNum, warpId, x, y);
    return FALSE;
}

SCRCMD_DEF(setdivewarp)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    SetFixedDiveWarp(mapGroup, mapNum, warpId, x, y);
    return FALSE;
}

SCRCMD_DEF(setholewarp)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    SetFixedHoleWarp(mapGroup, mapNum, warpId, x, y);
    return FALSE;
}

SCRCMD_DEF(setescapewarp)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    SetEscapeWarp(mapGroup, mapNum, warpId, x, y);
    return FALSE;
}

SCRCMD_DEF(getplayerxy)
{
    u16 *pX = GetVarPointer(ScriptReadHalfword(ctx));
    u16 *pY = GetVarPointer(ScriptReadHalfword(ctx));

    *pX = gSaveBlock1Ptr->pos.x;
    *pY = gSaveBlock1Ptr->pos.y;
    return FALSE;
}

SCRCMD_DEF(getpartysize)
{
    gSpecialVar_Result = CalculatePlayerPartyCount();
    return FALSE;
}

SCRCMD_DEF(playse)
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

SCRCMD_DEF(waitse)
{
    SetupNativeScript(ctx, WaitForSoundEffectFinish);
    return TRUE;
}

SCRCMD_DEF(playfanfare)
{
    PlayFanfare(ScriptReadHalfword(ctx));
    return FALSE;
}

static bool8 WaitForFanfareFinish(void)
{
    return IsFanfareTaskInactive();
}

SCRCMD_DEF(waitfanfare)
{
    SetupNativeScript(ctx, WaitForFanfareFinish);
    return TRUE;
}

SCRCMD_DEF(playbgm)
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

SCRCMD_DEF(savebgm)
{
    Overworld_SetSavedMusic(ScriptReadHalfword(ctx));
    return FALSE;
}

SCRCMD_DEF(fadedefaultbgm)
{
    if (gUnknown_203ADFA == 2 || gUnknown_203ADFA == 3)
        return FALSE;
    Overworld_ChangeMusicToDefault();
    return FALSE;
}

SCRCMD_DEF(fadenewbgm)
{
    u16 music = ScriptReadHalfword(ctx);
    if (gUnknown_203ADFA == 2 || gUnknown_203ADFA == 3)
        return FALSE;
    Overworld_ChangeMusicTo(music);
    return FALSE;
}

SCRCMD_DEF(fadeoutbgm)
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

SCRCMD_DEF(fadeinbgm)
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

SCRCMD_DEF(applymovement)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    const void *movementScript = (const void *)ScriptReadWord(ctx);

    ScriptMovement_StartObjectMovementScript(localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, movementScript);
    sMovingNpcId = localId;
    return FALSE;
}

SCRCMD_DEF(applymovement_at)
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

SCRCMD_DEF(waitmovement)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));

    if (localId != 0)
        sMovingNpcId = localId;
    sMovingNpcMapBank = gSaveBlock1Ptr->location.mapGroup;
    sMovingNpcMapId = gSaveBlock1Ptr->location.mapNum;
    SetupNativeScript(ctx, WaitForMovementFinish);
    return TRUE;
}

SCRCMD_DEF(waitmovement_at)
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

SCRCMD_DEF(removeobject)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));

    RemoveFieldObjectByLocalIdAndMap(localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
    return FALSE;
}

SCRCMD_DEF(removeobject_at)
{
    u16 objectId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);

    RemoveFieldObjectByLocalIdAndMap(objectId, mapNum, mapGroup);
    return FALSE;
}

SCRCMD_DEF(addobject)
{
    u16 objectId = VarGet(ScriptReadHalfword(ctx));

    show_sprite(objectId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
    return FALSE;
}

SCRCMD_DEF(addobject_at)
{
    u16 objectId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);

    show_sprite(objectId, mapNum, mapGroup);
    return FALSE;
}

SCRCMD_DEF(setobjectxy)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    sub_805F7C4(localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, x, y);
    return FALSE;
}

SCRCMD_DEF(setobjectxyperm)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Overworld_SetMapObjTemplateCoords(localId, x, y);
    return FALSE;
}

SCRCMD_DEF(moveobjectoffscreen)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));

    sub_805FE94(localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
    return FALSE;
}

SCRCMD_DEF(showobject_at)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);

    npc_by_local_id_and_map_set_field_1_bit_x20(localId, mapNum, mapGroup, 0);
    return FALSE;
}

SCRCMD_DEF(hideobject_at)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);

    npc_by_local_id_and_map_set_field_1_bit_x20(localId, mapNum, mapGroup, 1);
    return FALSE;
}

SCRCMD_DEF(setobjectpriority)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 priority = ScriptReadByte(ctx);

    sub_805F3A8(localId, mapNum, mapGroup, priority + 83);
    return FALSE;
}

SCRCMD_DEF(resetobjectpriority)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);

    sub_805F400(localId, mapNum, mapGroup);
    return FALSE;
}

SCRCMD_DEF(faceplayer)
{
    if (gMapObjects[gSelectedEventObject].active)
    {
        FieldObjectFaceOppositeDirection(&gMapObjects[gSelectedEventObject],
                                         player_get_direction_lower_nybble());
    }
    return FALSE;
}

SCRCMD_DEF(turnobject)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 direction = ScriptReadByte(ctx);

    FieldObjectTurnByLocalIdAndMap(localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, direction);
    return FALSE;
}

SCRCMD_DEF(setobjectmovementtype)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 movementType = ScriptReadByte(ctx);

    Overworld_SetMapObjTemplateMovementType(localId, movementType);
    return FALSE;
}

SCRCMD_DEF(createvobject)
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

SCRCMD_DEF(turnvobject)
{
    u8 v1 = ScriptReadByte(ctx);
    u8 direction = ScriptReadByte(ctx);

    sub_8069058(v1, direction);
    return FALSE;
}

SCRCMD_DEF(lockall)
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

SCRCMD_DEF(lock)
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

SCRCMD_DEF(releaseall)
{
    u8 playerObjectId;

    HideFieldMessageBox();
    playerObjectId = GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0);
    FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[playerObjectId]);
    sub_80974D8();
    UnfreezeMapObjects();
    return FALSE;
}

SCRCMD_DEF(release)
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

SCRCMD_DEF(cmdC7)
{
    gUnknown_20370DC = gUnknown_20370DA;
    gUnknown_20370DA = ScriptReadByte(ctx);
    return FALSE;
}

SCRCMD_DEF(message)
{
    const u8 *msg = (const u8 *)ScriptReadWord(ctx);

    if (msg == NULL)
        msg = (const u8 *)ctx->data[0];
    ShowFieldMessage(msg);
    return FALSE;
}

SCRCMD_DEF(cmdC8)
{
    const u8 *msg = (const u8 *)ScriptReadWord(ctx);

    if (msg == NULL)
        msg = (const u8 *)ctx->data[0];
    sub_80F7974(msg);
    CopyWindowToVram(GetStartMenuWindowId(), 1);
    return FALSE;
}

SCRCMD_DEF(cmdC9)
{
    sub_80F7998();
    return FALSE;
}

SCRCMD_DEF(messageautoscroll)
{
    const u8 *msg = (const u8 *)ScriptReadWord(ctx);

    if (msg == NULL)
        msg = (const u8 *)ctx->data[0];
    ShowFieldAutoScrollMessage(msg);
    return FALSE;
}

SCRCMD_DEF(waitmessage)
{
    SetupNativeScript(ctx, IsFieldMessageBoxHidden);
    return TRUE;
}

SCRCMD_DEF(closemessage)
{
    HideFieldMessageBox();
    return FALSE;
}

extern IWRAM_DATA struct ScriptContext * gUnknown_3005070;

bool8 sub_806B93C(struct ScriptContext * ctx);
u8 sub_806B96C(struct ScriptContext * ctx);

bool8 WaitForAorBPress(void)
{
    if (gMain.newKeys & A_BUTTON)
        return TRUE;
    if (gMain.newKeys & B_BUTTON)
        return TRUE;

    if (sub_806B93C(gUnknown_3005070) == TRUE)
    {
        u8 r4 = sub_806B96C(gUnknown_3005070);
        sub_8069998(r4);
        if (r4)
        {
            if (gUnknown_203ADFA != 2)
            {
                sub_80699F8();
                if (r4 < 9 || r4 > 10)
                    sub_8069964();
                else
                {
                    sub_80699A4();
                    sub_8069970();
                }
                return TRUE;
            }
        }
    }
    if (sub_8112CAC() == 1 || gUnknown_203ADFA == 2)
    {
        if (gUnknown_20370AC == 120)
            return TRUE;
        else
            gUnknown_20370AC++;
    }

    return FALSE;
}

bool8 sub_806B93C(struct ScriptContext * ctx)
{
    const u8 * script = ctx->scriptPtr;
    u8 nextCmd = *script;
    if (nextCmd == 3) // return
    {
        script = ctx->stack[ctx->stackDepth - 1];
        nextCmd = *script;
    }
    if (nextCmd < 0x6B || nextCmd > 0x6C) // releaseall or release
        return FALSE;
    else
        return TRUE;
}

u8 sub_806B96C(struct ScriptContext * ctx)
{
    if (gMain.heldKeys & DPAD_UP && gSpecialVar_Facing != 2)
        return 1;

    if (gMain.heldKeys & DPAD_DOWN && gSpecialVar_Facing != 1)
        return 2;

    if (gMain.heldKeys & DPAD_LEFT && gSpecialVar_Facing != 3)
        return 3;

    if (gMain.heldKeys & DPAD_RIGHT && gSpecialVar_Facing != 4)
        return 4;

    if (gMain.newKeys & L_BUTTON)
        return 5;

    if (gMain.heldKeys & R_BUTTON)
        return 6;

    if (gMain.heldKeys & START_BUTTON)
        return 7;

    if (gMain.heldKeys & SELECT_BUTTON)
        return 8;

    if (gMain.newKeys & A_BUTTON)
        return 9;

    if (gMain.newKeys & B_BUTTON)
        return 10;

    return 0;
}

SCRCMD_DEF(waitbuttonpress)
{
    gUnknown_3005070 = ctx;

    if (sub_8112CAC() == 1 || gUnknown_203ADFA == 2)
        gUnknown_20370AC = 0;
    SetupNativeScript(ctx, WaitForAorBPress);
    return TRUE;
}
