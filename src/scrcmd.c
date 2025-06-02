#include "global.h"
#include "gflib.h"
#include "clock.h"
#include "rtc.h"
#include "script.h"
#include "berry.h"
#include "decompress.h"
#include "mystery_event_script.h"
#include "event_data.h"
#include "event_scripts.h"
#include "random.h"
#include "item.h"
#include "overworld.h"
#include "field_screen_effect.h"
#include "quest_log.h"
#include "map_preview_screen.h"
#include "fieldmap.h"
#include "field_move.h"
#include "field_weather.h"
#include "field_tasks.h"
#include "field_fadetransition.h"
#include "field_player_avatar.h"
#include "script_movement.h"
#include "event_object_movement.h"
#include "event_object_lock.h"
#include "field_message_box.h"
#include "move.h"
#include "script_menu.h"
#include "trainer_see.h"
#include "data.h"
#include "field_specials.h"
#include "list_menu.h"
#include "constants/items.h"
#include "script_pokemon_util.h"
#include "pokemon_storage_system.h"
#include "party_menu.h"
#include "money.h"
#include "coins.h"
#include "battle_setup.h"
#include "shop.h"
#include "slot_machine.h"
#include "field_effect.h"
#include "fieldmap.h"
#include "field_door.h"
#include "constants/event_objects.h"
#include "constants/event_object_movement.h"
#include "constants/field_move.h"
#include "constants/maps.h"
#include "constants/sound.h"

typedef void (*NativeFunc)(struct ScriptContext *ctx);

extern u16 (*const gSpecials[])(void);
extern u16 (*const gSpecialsEnd[])(void);
extern const u8 *gStdScripts[];
extern const u8 *gStdScriptsEnd[];

static bool8 ScriptContext_NextCommandEndsScript(struct ScriptContext * ctx);
static u8 ScriptContext_GetQuestLogInput(struct ScriptContext * ctx);

static EWRAM_DATA ptrdiff_t sAddressOffset = 0; // For relative addressing in vgoto etc., used by saved scripts (e.g. Mystery Event)
static EWRAM_DATA u8 sQuestLogWaitButtonPressTimer = 0;
static EWRAM_DATA u16 sPauseCounter = 0;
static EWRAM_DATA u16 sMovingNpcId = 0;
static EWRAM_DATA u16 sMovingNpcMapGroup = 0;
static EWRAM_DATA u16 sMovingNpcMapNum = 0;
static EWRAM_DATA u16 sFieldEffectScriptId = 0;

static bool8 sIsScriptedWildDouble;

COMMON_DATA struct ScriptContext * sQuestLogScriptContextPtr = NULL;
COMMON_DATA u8 gSelectedObjectEvent = 0;

// This is defined in here so the optimizer can't see its value when compiling
// script.c.
void *const gNullScriptPtr = NULL;

static const u8 sScriptConditionTable[6][3] =
{
//   <  =  >
    {1, 0, 0}, // <
    {0, 1, 0}, // =
    {0, 0, 1}, // >
    {1, 1, 0}, // <=
    {0, 1, 1}, // >=
    {1, 0, 1}, // !=
};

bool8 ScrCmd_nop(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1);

    return FALSE;
}

bool8 ScrCmd_nop1(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1);

    return FALSE;
}

bool8 ScrCmd_end(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1);

    FlagClear(FLAG_SAFE_FOLLOWER_MOVEMENT);
    StopScript(ctx);
    return FALSE;
}

bool8 ScrCmd_gotonative(struct ScriptContext * ctx)
{
    bool8 (*addr)(void) = (bool8 (*)(void))ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1);
    Script_CheckEffectInstrumentedGotoNative(addr);

    SetupNativeScript(ctx, addr);
    return TRUE;
}

bool8 ScrCmd_special(struct ScriptContext * ctx)
{
    u16 index = ScriptReadHalfword(ctx);

    Script_RequestEffects(SCREFF_V1);
    Script_CheckEffectInstrumentedSpecial(index);

    gSpecials[index]();
    return FALSE;
}

bool8 ScrCmd_specialvar(struct ScriptContext * ctx)
{
    u32 varId = ScriptReadHalfword(ctx);
    u16 index = ScriptReadHalfword(ctx);
    u16 *ptr = GetVarPointer(varId);

    Script_RequestEffects(SCREFF_V1);
    Script_RequestWriteVar(varId);
    Script_CheckEffectInstrumentedSpecial(index);

    *ptr = gSpecials[index]();
    return FALSE;
}

bool8 ScrCmd_callnative(struct ScriptContext * ctx)
{
    NativeFunc func = (NativeFunc)ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1);
    Script_CheckEffectInstrumentedCallNative(func);

    func(ctx);
    return FALSE;
}

bool8 ScrCmd_waitstate(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    ScriptContext_Stop();
    return TRUE;
}

bool8 ScrCmd_goto(struct ScriptContext * ctx)
{
    const u8 *ptr = (const u8 *)ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1);

    ScriptJump(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_return(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1);

    ScriptReturn(ctx);
    return FALSE;
}

bool8 ScrCmd_call(struct ScriptContext * ctx)
{
    const u8 *ptr = (const u8 *)ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1);

    ScriptCall(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_goto_if(struct ScriptContext * ctx)
{
    u8 condition = ScriptReadByte(ctx);
    const u8 *ptr = (const u8 *)ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1);

    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
        ScriptJump(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_call_if(struct ScriptContext * ctx)
{
    u8 condition = ScriptReadByte(ctx);
    const u8 *ptr = (const u8 *)ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1);

    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
        ScriptCall(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_setvaddress(struct ScriptContext * ctx)
{
    u32 addr1 = (u32)ctx->scriptPtr - 1;
    u32 addr2 = ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1);

    sAddressOffset = addr2 - addr1;
    return FALSE;
}

bool8 ScrCmd_vgoto(struct ScriptContext * ctx)
{
    u32 addr = ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1);

    ScriptJump(ctx, (u8 *)(addr - sAddressOffset));
    return FALSE;
}

bool8 ScrCmd_vcall(struct ScriptContext * ctx)
{
    u32 addr = ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1);

    ScriptCall(ctx, (u8 *)(addr - sAddressOffset));
    return FALSE;
}

bool8 ScrCmd_vgoto_if(struct ScriptContext * ctx)
{
    u8 condition = ScriptReadByte(ctx);
    const u8 *ptr = (const u8 *)(ScriptReadWord(ctx) - sAddressOffset);

    Script_RequestEffects(SCREFF_V1);

    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
        ScriptJump(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_vcall_if(struct ScriptContext * ctx)
{
    u8 condition = ScriptReadByte(ctx);
    const u8 *ptr = (const u8 *)(ScriptReadWord(ctx) - sAddressOffset);

    Script_RequestEffects(SCREFF_V1);

    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
        ScriptCall(ctx, ptr);
    return FALSE;
}

bool8 ScrCmd_gotostd(struct ScriptContext * ctx)
{
    u8 index = ScriptReadByte(ctx);
    const u8 **ptr = &gStdScripts[index];

    Script_RequestEffects(SCREFF_V1);

    if (ptr < gStdScriptsEnd)
        ScriptJump(ctx, *ptr);
    return FALSE;
}

bool8 ScrCmd_callstd(struct ScriptContext * ctx)
{
    u8 index = ScriptReadByte(ctx);
    const u8 **ptr = &gStdScripts[index];

    Script_RequestEffects(SCREFF_V1);

    if (ptr < gStdScriptsEnd)
        ScriptCall(ctx, *ptr);
    return FALSE;
}

bool8 ScrCmd_gotostd_if(struct ScriptContext * ctx)
{
    u8 condition = ScriptReadByte(ctx);
    u8 index = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1);

    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
    {
        const u8 **ptr = &gStdScripts[index];
        if (ptr < gStdScriptsEnd)
            ScriptJump(ctx, *ptr);
    }
    return FALSE;
}

bool8 ScrCmd_callstd_if(struct ScriptContext * ctx)
{
    u8 condition = ScriptReadByte(ctx);
    u8 index = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1);

    if (sScriptConditionTable[condition][ctx->comparisonResult] == 1)
    {
        const u8 **ptr = &gStdScripts[index];
        if (ptr < gStdScriptsEnd)
            ScriptCall(ctx, *ptr);
    }
    return FALSE;
}

bool8 ScrCmd_returnram(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1);

    ScriptJump(ctx, gRamScriptRetAddr);
    return FALSE;
}

bool8 ScrCmd_endram(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    FlagClear(FLAG_SAFE_FOLLOWER_MOVEMENT);
    ClearRamScript();
    StopScript(ctx);
    return TRUE;
}

bool8 ScrCmd_setmysteryeventstatus(struct ScriptContext * ctx)
{
    u8 status = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1);

    SetMysteryEventScriptStatus(status);
    return FALSE;
}

bool8 ScrCmd_loadword(struct ScriptContext * ctx)
{
    u8 index = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1);

    ctx->data[index] = ScriptReadWord(ctx);
    return FALSE;
}

bool8 ScrCmd_loadbytefromptr(struct ScriptContext * ctx)
{
    u8 index = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1);

    ctx->data[index] = *(const u8 *)ScriptReadWord(ctx);
    return FALSE;
}

bool8 ScrCmd_setptr(struct ScriptContext * ctx)
{
    u8 value = ScriptReadByte(ctx);

    // TODO: Check if 'ptr' is within a save block?
    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    *(u8 *)ScriptReadWord(ctx) = value;
    return FALSE;
}

bool8 ScrCmd_loadbyte(struct ScriptContext * ctx)
{
    u8 index = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1);

    ctx->data[index] = ScriptReadByte(ctx);
    return FALSE;
}

bool8 ScrCmd_setptrbyte(struct ScriptContext * ctx)
{
    u8 index = ScriptReadByte(ctx);

    // TODO: Check if 'ptr' is within a save block?
    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    *(u8 *)ScriptReadWord(ctx) = ctx->data[index];
    return FALSE;
}

bool8 ScrCmd_copylocal(struct ScriptContext * ctx)
{
    u8 destIndex = ScriptReadByte(ctx);
    u8 srcIndex = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1);

    ctx->data[destIndex] = ctx->data[srcIndex];
    return FALSE;
}

bool8 ScrCmd_copybyte(struct ScriptContext * ctx)
{
    u8 *ptr = (u8 *)ScriptReadWord(ctx);

    // TODO: Check if 'ptr' is within a save block?
    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    *ptr = *(const u8 *)ScriptReadWord(ctx);
    return FALSE;
}

bool8 ScrCmd_setvar(struct ScriptContext * ctx)
{
    u32 varId = ScriptReadHalfword(ctx);
    u16 *ptr = GetVarPointer(varId);

    Script_RequestEffects(SCREFF_V1);
    Script_RequestWriteVar(varId);

    *ptr = ScriptReadHalfword(ctx);
    return FALSE;
}

bool8 ScrCmd_copyvar(struct ScriptContext * ctx)
{
    u32 varId = ScriptReadHalfword(ctx);
    u16 *ptr = GetVarPointer(varId);

    Script_RequestEffects(SCREFF_V1);
    Script_RequestWriteVar(varId);

    *ptr = *GetVarPointer(ScriptReadHalfword(ctx));
    return FALSE;
}

bool8 ScrCmd_setorcopyvar(struct ScriptContext * ctx)
{
    u32 varId = ScriptReadHalfword(ctx);
    u16 *ptr = GetVarPointer(varId);

    Script_RequestEffects(SCREFF_V1);
    Script_RequestWriteVar(varId);

    *ptr = VarGet(ScriptReadHalfword(ctx));
    return FALSE;
}

static u8 Compare(u16 a, u16 b)
{
    if (a < b)
        return 0;
    else if (a == b)
        return 1;
    else
        return 2;
}

bool8 ScrCmd_compare_local_to_local(struct ScriptContext * ctx)
{
    const u8 value1 = ctx->data[ScriptReadByte(ctx)];
    const u8 value2 = ctx->data[ScriptReadByte(ctx)];

    Script_RequestEffects(SCREFF_V1);

    ctx->comparisonResult = Compare(value1, value2);
    return FALSE;
}

bool8 ScrCmd_compare_local_to_value(struct ScriptContext * ctx)
{
    const u8 value1 = ctx->data[ScriptReadByte(ctx)];
    const u8 value2 = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1);

    ctx->comparisonResult = Compare(value1, value2);
    return FALSE;
}

bool8 ScrCmd_compare_local_to_ptr(struct ScriptContext * ctx)
{
    const u8 value1 = ctx->data[ScriptReadByte(ctx)];
    const u8 value2 = *(const u8 *)ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1);

    ctx->comparisonResult = Compare(value1, value2);
    return FALSE;
}

bool8 ScrCmd_compare_ptr_to_local(struct ScriptContext * ctx)
{
    const u8 value1 = *(const u8 *)ScriptReadWord(ctx);
    const u8 value2 = ctx->data[ScriptReadByte(ctx)];

    Script_RequestEffects(SCREFF_V1);

    ctx->comparisonResult = Compare(value1, value2);
    return FALSE;
}

bool8 ScrCmd_compare_ptr_to_value(struct ScriptContext * ctx)
{
    const u8 value1 = *(const u8 *)ScriptReadWord(ctx);
    const u8 value2 = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1);

    ctx->comparisonResult = Compare(value1, value2);
    return FALSE;
}

bool8 ScrCmd_compare_ptr_to_ptr(struct ScriptContext * ctx)
{
    const u8 value1 = *(const u8 *)ScriptReadWord(ctx);
    const u8 value2 = *(const u8 *)ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1);

    ctx->comparisonResult = Compare(value1, value2);
    return FALSE;
}

bool8 ScrCmd_compare_var_to_value(struct ScriptContext * ctx)
{
    const u16 value1 = *GetVarPointer(ScriptReadHalfword(ctx));
    const u16 value2 = ScriptReadHalfword(ctx);

    Script_RequestEffects(SCREFF_V1);

    ctx->comparisonResult = Compare(value1, value2);
    return FALSE;
}

bool8 ScrCmd_compare_var_to_var(struct ScriptContext * ctx)
{
    const u16 *ptr1 = GetVarPointer(ScriptReadHalfword(ctx));
    const u16 *ptr2 = GetVarPointer(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    ctx->comparisonResult = Compare(*ptr1, *ptr2);
    return FALSE;
}

// Note: addvar doesn't support adding from a variable in vanilla.
bool8 ScrCmd_addvar(struct ScriptContext * ctx)
{
    u32 varId = ScriptReadHalfword(ctx);
    u16 *ptr = GetVarPointer(varId);

    Script_RequestEffects(SCREFF_V1);
    Script_RequestWriteVar(varId);

    *ptr += ScriptReadHalfword(ctx);
    return FALSE;
}

bool8 ScrCmd_subvar(struct ScriptContext * ctx)
{
    u32 varId = ScriptReadHalfword(ctx);
    u16 *ptr = GetVarPointer(varId);

    Script_RequestEffects(SCREFF_V1);
    Script_RequestWriteVar(varId);

    *ptr -= VarGet(ScriptReadHalfword(ctx));
    return FALSE;
}

bool8 ScrCmd_random(struct ScriptContext * ctx)
{
    u16 max = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    gSpecialVar_Result = Random() % max;
    return FALSE;
}

bool8 ScrCmd_additem(struct ScriptContext * ctx)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u32 quantity = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    gSpecialVar_Result = AddBagItem(itemId, quantity);
    TrySetObtainedItemQuestLogEvent(itemId);
    return FALSE;
}

bool8 ScrCmd_removeitem(struct ScriptContext * ctx)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u32 quantity = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    gSpecialVar_Result = RemoveBagItem(itemId, quantity);
    return FALSE;
}

bool8 ScrCmd_checkitemspace(struct ScriptContext * ctx)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u32 quantity = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    gSpecialVar_Result = CheckBagHasSpace(itemId, quantity);
    return FALSE;
}

bool8 ScrCmd_checkitem(struct ScriptContext * ctx)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u32 quantity = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    gSpecialVar_Result = CheckBagHasItem(itemId, quantity);
    return FALSE;
}

bool8 ScrCmd_checkitemtype(struct ScriptContext * ctx)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    gSpecialVar_Result = GetPocketByItemId(itemId);
    return FALSE;
}

bool8 ScrCmd_addpcitem(struct ScriptContext * ctx)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u16 quantity = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    gSpecialVar_Result = AddPCItem(itemId, quantity);
    return FALSE;
}

bool8 ScrCmd_checkpcitem(struct ScriptContext * ctx)
{
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u16 quantity = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    gSpecialVar_Result = CheckPCHasItem(itemId, quantity);
    return FALSE;
}

bool8 ScrCmd_adddecoration(struct ScriptContext * ctx)
{
    u32 UNUSED decorId = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    return FALSE;
}

bool8 ScrCmd_removedecoration(struct ScriptContext * ctx)
{
    u32 UNUSED decorId = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    return FALSE;
}

bool8 ScrCmd_checkdecorspace(struct ScriptContext * ctx)
{
    u32 UNUSED decorId = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    return FALSE;
}

bool8 ScrCmd_checkdecor(struct ScriptContext * ctx)
{
    u32 UNUSED decorId = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    return FALSE;
}

bool8 ScrCmd_setflag(struct ScriptContext * ctx)
{
    u32 flagId = ScriptReadHalfword(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    FlagSet(flagId);
    return FALSE;
}

bool8 ScrCmd_clearflag(struct ScriptContext * ctx)
{
    u32 flagId = ScriptReadHalfword(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    FlagClear(flagId);
    return FALSE;
}

bool8 ScrCmd_checkflag(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1);

    ctx->comparisonResult = FlagGet(ScriptReadHalfword(ctx));
    return FALSE;
}

bool8 ScrCmd_incrementgamestat(struct ScriptContext * ctx)
{
    u32 statId = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    IncrementGameStat(statId);
    return FALSE;
}

bool8 ScrCmd_setworldmapflag(struct ScriptContext * ctx)
{
    u16 value = ScriptReadHalfword(ctx);
    
    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);
    QuestLog_RecordEnteredMap(value);
    MapPreview_SetFlag(value);
    return FALSE;
}

bool8 ScrCmd_animateflash(struct ScriptContext * ctx)
{
    u32 level = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    AnimateFlash(level);
    ScriptContext_Stop();
    return TRUE;
}

bool8 ScrCmd_setflashlevel(struct ScriptContext * ctx)
{
    u32 level = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    SetFlashLevel(level);
    return FALSE;
}

static bool8 IsPaletteNotActive(void)
{
    if (!gPaletteFade.active)
        return TRUE;
    else
        return FALSE;
}

bool8 ScrCmd_fadescreen(struct ScriptContext * ctx)
{
    u32 mode = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    FadeScreen(mode, 0);
    SetupNativeScript(ctx, IsPaletteNotActive);
    return TRUE;
}

bool8 ScrCmd_fadescreenspeed(struct ScriptContext * ctx)
{
    u8 mode = ScriptReadByte(ctx);
    u8 speed = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    FadeScreen(mode, speed);
    SetupNativeScript(ctx, IsPaletteNotActive);
    return TRUE;
}

bool8 ScrCmd_fadescreenswapbuffers(struct ScriptContext *ctx)
{
    u8 mode = ScriptReadByte(ctx);
    u8 nowait = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    switch (mode)
    {
    case FADE_FROM_BLACK:
    case FADE_FROM_WHITE:
        // Restore last weather blend before fading in,
        // since BLDALPHA was modified by fade-out
        SetGpuReg(
            REG_OFFSET_BLDALPHA,
            BLDALPHA_BLEND(gWeatherPtr->currBlendEVA, gWeatherPtr->currBlendEVB)
        );
        break;
    }

    FadeScreenHardware(mode, 0);

    if (nowait)
        return FALSE;
    SetupNativeScript(ctx, IsPaletteNotActive);
    return TRUE;
}

static bool8 RunPauseTimer(void)
{
    if (--sPauseCounter == 0)
        return TRUE;
    else
        return FALSE;
}

bool8 ScrCmd_delay(struct ScriptContext * ctx)
{
    u32 frames = ScriptReadHalfword(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    sPauseCounter = frames;
    SetupNativeScript(ctx, RunPauseTimer);
    return TRUE;
}

bool8 ScrCmd_initclock(struct ScriptContext * ctx)
{
    u8 hour = VarGet(ScriptReadHalfword(ctx));
    u8 minute = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    RtcInitLocalTimeOffset(hour, minute);
    return FALSE;
}

bool8 ScrCmd_dotimebasedevents(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    DoTimeBasedEvents();
    return FALSE;
}

bool8 ScrCmd_gettime(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    RtcCalcLocalTime();
    gSpecialVar_0x8000 = gLocalTime.hours;
    gSpecialVar_0x8001 = gLocalTime.minutes;
    gSpecialVar_0x8002 = gLocalTime.seconds;
    return FALSE;
}

bool8 ScrCmd_setweather(struct ScriptContext * ctx)
{
    u16 weather = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    SetSavedWeather(weather);
    return FALSE;
}

bool8 ScrCmd_resetweather(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    SetSavedWeatherFromCurrMapHeader();
    return FALSE;
}

bool8 ScrCmd_doweather(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    DoCurrentWeather();
    return FALSE;
}

bool8 ScrCmd_setstepcallback(struct ScriptContext * ctx)
{
    u32 callbackId = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1);

    ActivatePerStepCallback(callbackId);
    return FALSE;
}

bool8 ScrCmd_setmaplayoutindex(struct ScriptContext * ctx)
{
    u16 value = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    SetCurrentMapLayout(value);
    return FALSE;
}

bool8 ScrCmd_warp(struct ScriptContext * ctx)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    SetWarpDestination(mapGroup, mapNum, warpId, x, y);
    DoWarp();
    ResetInitialPlayerAvatarState();
    return TRUE;
}

bool8 ScrCmd_warpsilent(struct ScriptContext * ctx)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    SetWarpDestination(mapGroup, mapNum, warpId, x, y);
    DoDiveWarp();
    ResetInitialPlayerAvatarState();
    return TRUE;
}

bool8 ScrCmd_warpdoor(struct ScriptContext * ctx)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    SetWarpDestination(mapGroup, mapNum, warpId, x, y);
    DoDoorWarp();
    ResetInitialPlayerAvatarState();
    return TRUE;
}

bool8 ScrCmd_warphole(struct ScriptContext * ctx)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    s16 x;
    s16 y;

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    PlayerGetDestCoords(&x, &y);
    if (mapGroup == MAP_GROUP(MAP_UNDEFINED) && mapNum == MAP_NUM(MAP_UNDEFINED))
        SetWarpDestinationToFixedHoleWarp(x - MAP_OFFSET, y - MAP_OFFSET);
    else
        SetWarpDestination(mapGroup, mapNum, WARP_ID_NONE, x - MAP_OFFSET, y - MAP_OFFSET);
    DoFallWarp();
    ResetInitialPlayerAvatarState();
    return TRUE;
}

bool8 ScrCmd_warpteleport(struct ScriptContext * ctx)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    SetWarpDestination(mapGroup, mapNum, warpId, x, y);
    DoTeleportWarp();
    ResetInitialPlayerAvatarState();
    return TRUE;
}

bool8 ScrCmd_warpspinenter(struct ScriptContext * ctx)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    SetWarpDestination(mapGroup, mapNum, warpId, x, y);
    SavePlayerFacingDirectionForTeleport(GetPlayerFacingDirection());
    DoTeleport2Warp();
    ResetInitialPlayerAvatarState();
    return TRUE;
}

bool8 ScrCmd_setwarp(struct ScriptContext * ctx)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    SetWarpDestination(mapGroup, mapNum, warpId, x, y);
    return FALSE;
}

bool8 ScrCmd_setdynamicwarp(struct ScriptContext * ctx)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    SetDynamicWarpWithCoords(0, mapGroup, mapNum, warpId, x, y);
    return FALSE;
}

bool8 ScrCmd_setdivewarp(struct ScriptContext * ctx)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    SetFixedDiveWarp(mapGroup, mapNum, warpId, x, y);
    return FALSE;
}

bool8 ScrCmd_setholewarp(struct ScriptContext * ctx)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    SetFixedHoleWarp(mapGroup, mapNum, warpId, x, y);
    return FALSE;
}

bool8 ScrCmd_setescapewarp(struct ScriptContext * ctx)
{
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 warpId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    SetEscapeWarp(mapGroup, mapNum, warpId, x, y);
    return FALSE;
}

bool8 ScrCmd_getplayerxy(struct ScriptContext * ctx)
{
    u32 varIdX = ScriptReadHalfword(ctx);
    u32 varIdY = ScriptReadHalfword(ctx);
    u16 *pX = GetVarPointer(varIdX);
    u16 *pY = GetVarPointer(varIdY);

    Script_RequestEffects(SCREFF_V1);
    Script_RequestWriteVar(varIdX);
    Script_RequestWriteVar(varIdY);

    *pX = gSaveBlock1Ptr->pos.x;
    *pY = gSaveBlock1Ptr->pos.y;
    return FALSE;
}

bool8 ScrCmd_getpartysize(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1);

    gSpecialVar_Result = CalculatePlayerPartyCount();
    return FALSE;
}

bool8 ScrCmd_playse(struct ScriptContext * ctx)
{
    u32 songId = ScriptReadHalfword(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    PlaySE(songId);
    return FALSE;
}

static bool8 WaitForSoundEffectFinish(void)
{
    if (!IsSEPlaying())
        return TRUE;
    else
        return FALSE;
}

bool8 ScrCmd_waitse(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    SetupNativeScript(ctx, WaitForSoundEffectFinish);
    return TRUE;
}

bool8 ScrCmd_playfanfare(struct ScriptContext * ctx)
{
    u32 songId = ScriptReadHalfword(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    PlayFanfare(songId);
    return FALSE;
}

static bool8 WaitForFanfareFinish(void)
{
    return IsFanfareTaskInactive();
}

bool8 ScrCmd_waitfanfare(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    SetupNativeScript(ctx, WaitForFanfareFinish);
    return TRUE;
}

bool8 ScrCmd_playbgm(struct ScriptContext * ctx)
{
    u16 songId = ScriptReadHalfword(ctx);
    bool8 save = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    if (QL_IS_PLAYBACK_STATE)
        return FALSE;
    if (save == TRUE)
        Overworld_SetSavedMusic(songId);
    PlayNewMapMusic(songId);
    return FALSE;
}

bool8 ScrCmd_savebgm(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    Overworld_SetSavedMusic(ScriptReadHalfword(ctx));
    return FALSE;
}

bool8 ScrCmd_fadedefaultbgm(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (QL_IS_PLAYBACK_STATE)
        return FALSE;
    Overworld_ChangeMusicToDefault();
    return FALSE;
}

bool8 ScrCmd_fadenewbgm(struct ScriptContext * ctx)
{
    u16 music = ScriptReadHalfword(ctx);
    
    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    if (QL_IS_PLAYBACK_STATE)
        return FALSE;
    Overworld_ChangeMusicTo(music);
    return FALSE;
}

bool8 ScrCmd_fadeoutbgm(struct ScriptContext * ctx)
{
    u8 speed = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    if (QL_IS_PLAYBACK_STATE)
        return FALSE;
    if (speed != 0)
        FadeOutBGMTemporarily(4 * speed);
    else
        FadeOutBGMTemporarily(4);
    SetupNativeScript(ctx, IsBGMPausedOrStopped);
    return TRUE;
}

bool8 ScrCmd_fadeinbgm(struct ScriptContext * ctx)
{
    u8 speed = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    if (QL_IS_PLAYBACK_STATE)
        return FALSE;
    if (speed != 0)
        FadeInBGM(4 * speed);
    else
        FadeInBGM(4);
    return FALSE;
}

struct ObjectEvent *ScriptHideFollower(void)
{
    struct ObjectEvent *obj = GetFollowerObject();

    if (obj == NULL || obj->invisible)
        return NULL;

    ClearObjectEventMovement(obj, &gSprites[obj->spriteId]);
    gSprites[obj->spriteId].animCmdIndex = 0; // Reset start frame of animation
    // Note: ScriptMovement_ returns TRUE on error
    if (ScriptMovement_StartObjectMovementScript(obj->localId, obj->mapGroup, obj->mapNum, EnterPokeballMovement))
        return NULL;
    return obj;
}

bool8 ScrCmd_applymovement(struct ScriptContext * ctx)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    const u8 *movementScript = (const u8 *)ScriptReadWord(ctx);
    struct ObjectEvent *objEvent;

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    // When applying script movements to follower, it may have frozen animation that must be cleared
    if ((localId == OBJ_EVENT_ID_FOLLOWER && (objEvent = GetFollowerObject()) && objEvent->frozen) 
            || ((objEvent = &gObjectEvents[GetObjectEventIdByLocalId(localId)]) && IS_OW_MON_OBJ(objEvent)))
    {
        ClearObjectEventMovement(objEvent, &gSprites[objEvent->spriteId]);
        gSprites[objEvent->spriteId].animCmdIndex = 0; // Reset start frame of animation
    }

    gObjectEvents[GetObjectEventIdByLocalId(localId)].directionOverwrite = DIR_NONE;
    ScriptMovement_StartObjectMovementScript(localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, movementScript);
    sMovingNpcId = localId;
    if (localId != OBJ_EVENT_ID_FOLLOWER
     && !FlagGet(FLAG_SAFE_FOLLOWER_MOVEMENT)
     && (movementScript < Common_Movement_FollowerSafeStart || movementScript > Common_Movement_FollowerSafeEnd))
    {
        ScriptHideFollower();
    }
    return FALSE;
}

bool8 ScrCmd_applymovementat(struct ScriptContext * ctx)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    const void *movementScript = (const void *)ScriptReadWord(ctx);
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    gObjectEvents[GetObjectEventIdByLocalId(localId)].directionOverwrite = DIR_NONE;
    ScriptMovement_StartObjectMovementScript(localId, mapNum, mapGroup, movementScript);
    sMovingNpcId = localId;
    return FALSE;
}

static bool8 WaitForMovementFinish(void)
{
    if (ScriptMovement_IsObjectMovementFinished(sMovingNpcId, sMovingNpcMapNum, sMovingNpcMapGroup))
    {
        struct ObjectEvent *objEvent = GetFollowerObject();
        // If the follower is still entering the pokeball, wait for it to finish too
        // This prevents a `release` after this script command from getting the follower stuck in an intermediate state
        if (sMovingNpcId != OBJ_EVENT_ID_FOLLOWER && objEvent && ObjectEventGetHeldMovementActionId(objEvent) == MOVEMENT_ACTION_ENTER_POKEBALL)
            return ScriptMovement_IsObjectMovementFinished(objEvent->localId, objEvent->mapNum, objEvent->mapGroup);
        return TRUE;
    }
    return FALSE;
}

bool8 ScrCmd_waitmovement(struct ScriptContext * ctx)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (localId != LOCALID_NONE)
        sMovingNpcId = localId;
    sMovingNpcMapGroup = gSaveBlock1Ptr->location.mapGroup;
    sMovingNpcMapNum = gSaveBlock1Ptr->location.mapNum;
    SetupNativeScript(ctx, WaitForMovementFinish);
    return TRUE;
}

bool8 ScrCmd_waitmovementat(struct ScriptContext * ctx)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 mapBank;
    u8 mapId;

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (localId != LOCALID_NONE)
        sMovingNpcId = localId;
    mapBank = ScriptReadByte(ctx);
    mapId = ScriptReadByte(ctx);
    sMovingNpcMapGroup = mapBank;
    sMovingNpcMapNum = mapId;
    SetupNativeScript(ctx, WaitForMovementFinish);
    return TRUE;
}

bool8 ScrCmd_removeobject(struct ScriptContext * ctx)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    RemoveObjectEventByLocalIdAndMap(localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
    return FALSE;
}

bool8 ScrCmd_removeobjectat(struct ScriptContext * ctx)
{
    u16 objectId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    RemoveObjectEventByLocalIdAndMap(objectId, mapNum, mapGroup);
    return FALSE;
}

bool8 ScrCmd_addobject(struct ScriptContext * ctx)
{
    u16 objectId = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    TrySpawnObjectEvent(objectId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
    return FALSE;
}

bool8 ScrCmd_addobjectat(struct ScriptContext * ctx)
{
    u16 objectId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    TrySpawnObjectEvent(objectId, mapNum, mapGroup);
    return FALSE;
}

bool8 ScrCmd_setobjectxy(struct ScriptContext * ctx)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    TryMoveObjectEventToMapCoords(localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, x, y);
    return FALSE;
}

bool8 ScrCmd_setobjectxyperm(struct ScriptContext * ctx)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    SetObjEventTemplateCoords(localId, x, y);
    return FALSE;
}

bool8 ScrCmd_copyobjectxytoperm(struct ScriptContext * ctx)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    TryOverrideObjectEventTemplateCoords(localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
    return FALSE;
}

bool8 ScrCmd_showobjectat(struct ScriptContext * ctx)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    SetObjectInvisibility(localId, mapNum, mapGroup, FALSE);
    return FALSE;
}

bool8 ScrCmd_hideobjectat(struct ScriptContext * ctx)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    SetObjectInvisibility(localId, mapNum, mapGroup, TRUE);
    return FALSE;
}

bool8 ScrCmd_setobjectsubpriority(struct ScriptContext * ctx)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);
    u8 priority = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    SetObjectSubpriority(localId, mapNum, mapGroup, priority + 83);
    return FALSE;
}

bool8 ScrCmd_resetobjectsubpriority(struct ScriptContext * ctx)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 mapGroup = ScriptReadByte(ctx);
    u8 mapNum = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    ResetObjectSubpriority(localId, mapNum, mapGroup);
    return FALSE;
}

bool8 ScrCmd_faceplayer(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (gObjectEvents[gSelectedObjectEvent].active)
    {
        ObjectEventFaceOppositeDirection(&gObjectEvents[gSelectedObjectEvent],
                                         GetPlayerFacingDirection());
    }
    return FALSE;
}

bool8 ScrCmd_turnobject(struct ScriptContext * ctx)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 direction = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    ObjectEventTurnByLocalIdAndMap(localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, direction);
    return FALSE;
}

bool8 ScrCmd_setobjectmovementtype(struct ScriptContext * ctx)
{
    u16 localId = VarGet(ScriptReadHalfword(ctx));
    u8 movementType = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    SetObjEventTemplateMovementType(localId, movementType);
    return FALSE;
}

bool8 ScrCmd_createvobject(struct ScriptContext * ctx)
{
    u16 graphicsId = ScriptReadHalfword(ctx);
    u8 virtualObjId = ScriptReadByte(ctx);
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u32 y = VarGet(ScriptReadHalfword(ctx));
    u8 elevation = ScriptReadByte(ctx);
    u8 direction = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    CreateVirtualObject(graphicsId, virtualObjId, x, y, elevation, direction);
    return FALSE;
}

bool8 ScrCmd_turnvobject(struct ScriptContext * ctx)
{
    u8 virtualObjId = ScriptReadByte(ctx);
    u8 direction = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    TurnVirtualObject(virtualObjId, direction);
    return FALSE;
}

// lockall freezes all object events except the player immediately.
// The player is frozen after waiting for their current movement to finish.
bool8 ScrCmd_lockall(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (IsUpdateLinkStateCBActive())
    {
        return FALSE;
    }
    else
    {
        FreezeObjects_WaitForPlayer();
        SetupNativeScript(ctx, IsFreezePlayerFinished);
        return TRUE;
    }
}

bool8 ScrCmd_lock(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (IsUpdateLinkStateCBActive())
    {
        return FALSE;
    }
    else
    {
        struct ObjectEvent *followerObj = GetFollowerObject();
        if (gObjectEvents[gSelectedObjectEvent].active)
        {
            FreezeObjects_WaitForPlayerAndSelected();
            SetupNativeScript(ctx, IsFreezeSelectedObjectAndPlayerFinished);
            // follower is being talked to; keep it frozen
            if (gObjectEvents[gSelectedObjectEvent].localId == OBJ_EVENT_ID_FOLLOWER)
                followerObj = NULL;
        }
        else
        {
            FreezeObjects_WaitForPlayer();
            SetupNativeScript(ctx, IsFreezePlayerFinished);
        }
        if (followerObj) // Unfreeze follower object
            UnfreezeObjectEvent(followerObj);
        return TRUE;
    }
}

bool8 ScrCmd_releaseall(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    u8 playerObjectId;
    struct ObjectEvent *followerObject = GetFollowerObject();
    // Release follower from movement iff it exists and is in the shadowing state
    if (followerObject && gSprites[followerObject->spriteId].data[1] == 0)
        ClearObjectEventMovement(followerObject, &gSprites[followerObject->spriteId]);

    HideFieldMessageBox();
    playerObjectId = GetObjectEventIdByLocalIdAndMap(LOCALID_PLAYER, 0, 0);
    ObjectEventClearHeldMovementIfFinished(&gObjectEvents[playerObjectId]);
    ScriptMovement_UnfreezeObjectEvents();
    UnfreezeObjectEvents();
    return FALSE;
}

bool8 ScrCmd_release(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    u8 playerObjectId;
    struct ObjectEvent *followerObject = GetFollowerObject();
    // Release follower from movement iff it exists and is in the shadowing state
    if (followerObject && gSprites[followerObject->spriteId].data[1] == 0)
        ClearObjectEventMovement(followerObject, &gSprites[followerObject->spriteId]);

    HideFieldMessageBox();
    if (gObjectEvents[gSelectedObjectEvent].active)
        ObjectEventClearHeldMovementIfFinished(&gObjectEvents[gSelectedObjectEvent]);
    playerObjectId = GetObjectEventIdByLocalIdAndMap(LOCALID_PLAYER, 0, 0);
    ObjectEventClearHeldMovementIfFinished(&gObjectEvents[playerObjectId]);
    ScriptMovement_UnfreezeObjectEvents();
    UnfreezeObjectEvents();
    return FALSE;
}

bool8 ScrCmd_textcolor(struct ScriptContext * ctx)
{
    gSpecialVar_PrevTextColor = gSpecialVar_TextColor;
    gSpecialVar_TextColor = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    return FALSE;
}

bool8 ScrCmd_message(struct ScriptContext * ctx)
{
    const u8 *msg = (const u8 *)ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (msg == NULL)
        msg = (const u8 *)ctx->data[0];
    ShowFieldMessage(msg);
    return FALSE;
}

bool8 ScrCmd_loadhelp(struct ScriptContext * ctx)
{
    const u8 *msg = (const u8 *)ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (msg == NULL)
        msg = (const u8 *)ctx->data[0];
    DrawHelpMessageWindowWithText(msg);
    CopyWindowToVram(GetStartMenuWindowId(), COPYWIN_MAP);
    return FALSE;
}

bool8 ScrCmd_unloadhelp(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);
    DestroyHelpMessageWindow_();
    return FALSE;
}

bool8 ScrCmd_messageautoscroll(struct ScriptContext * ctx)
{
    const u8 *msg = (const u8 *)ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (msg == NULL)
        msg = (const u8 *)ctx->data[0];
    ShowFieldAutoScrollMessage(msg);
    return FALSE;
}

bool8 ScrCmd_waitmessage(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    SetupNativeScript(ctx, IsFieldMessageBoxHidden);
    return TRUE;
}

bool8 ScrCmd_closemessage(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    HideFieldMessageBox();
    return FALSE;
}

static bool8 WaitForAorBPress(void)
{
    if (JOY_NEW(A_BUTTON))
        return TRUE;
    if (JOY_NEW(B_BUTTON))
        return TRUE;

    if (ScriptContext_NextCommandEndsScript(sQuestLogScriptContextPtr) == TRUE)
    {
        u8 qlogInput = ScriptContext_GetQuestLogInput(sQuestLogScriptContextPtr);
        RegisterQuestLogInput(qlogInput);
        if (qlogInput != QL_INPUT_OFF)
        {
            if (gQuestLogState != QL_STATE_PLAYBACK)
            {
                ClearMsgBoxCancelableState();
                if (qlogInput != QL_INPUT_A && qlogInput != QL_INPUT_B)
                    SetQuestLogInputIsDpadFlag();
                else
                {
                    ClearQuestLogInput();
                    ClearQuestLogInputIsDpadFlag();
                }
                return TRUE;
            }
        }
    }
    if (QL_GetPlaybackState() == QL_PLAYBACK_STATE_RUNNING || gQuestLogState == QL_STATE_PLAYBACK)
    {
        if (sQuestLogWaitButtonPressTimer == 120)
            return TRUE;
        else
            sQuestLogWaitButtonPressTimer++;
    }

    return FALSE;
}

static bool8 ScriptContext_NextCommandEndsScript(struct ScriptContext * ctx)
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

static u8 ScriptContext_GetQuestLogInput(struct ScriptContext * ctx)
{
    if (JOY_HELD(DPAD_UP) && gSpecialVar_Facing != DIR_NORTH)
        return QL_INPUT_UP;

    if (JOY_HELD(DPAD_DOWN) && gSpecialVar_Facing != DIR_SOUTH)
        return QL_INPUT_DOWN;

    if (JOY_HELD(DPAD_LEFT) && gSpecialVar_Facing != DIR_WEST)
        return QL_INPUT_LEFT;

    if (JOY_HELD(DPAD_RIGHT) && gSpecialVar_Facing != DIR_EAST)
        return QL_INPUT_RIGHT;

    if (JOY_NEW(L_BUTTON))
        return QL_INPUT_L;

    if (JOY_HELD(R_BUTTON))
        return QL_INPUT_R;

    if (JOY_HELD(START_BUTTON))
        return QL_INPUT_START;

    if (JOY_HELD(SELECT_BUTTON))
        return QL_INPUT_SELECT;

    if (JOY_NEW(A_BUTTON))
        return QL_INPUT_A;

    if (JOY_NEW(B_BUTTON))
        return QL_INPUT_B;

    return QL_INPUT_OFF;
}

bool8 ScrCmd_waitbuttonpress(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    sQuestLogScriptContextPtr = ctx;

    if (QL_GetPlaybackState() == QL_PLAYBACK_STATE_RUNNING || gQuestLogState == QL_STATE_PLAYBACK)
        sQuestLogWaitButtonPressTimer = 0;
    SetupNativeScript(ctx, WaitForAorBPress);
    return TRUE;
}

bool8 ScrCmd_yesnobox(struct ScriptContext * ctx)
{
    u8 left = ScriptReadByte(ctx);
    u8 top = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (ScriptMenu_YesNo(left, top) == TRUE)
    {
        ScriptContext_Stop();
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

static void DynamicMultichoiceSortList(struct ListMenuItem *items, u32 count)
{
    u32 i,j;
    struct ListMenuItem tmp;
    for (i = 0; i < count - 1; ++i)
    {
        for (j = 0; j < count - i - 1; ++j)
        {
            if (items[j].id > items[j+1].id)
            {
                tmp = items[j];
                items[j] = items[j+1];
                items[j+1] = tmp;
            }
        }
    }
}

#define DYN_MULTICHOICE_DEFAULT_MAX_BEFORE_SCROLL 6

bool8 ScrCmd_dynmultichoice(struct ScriptContext *ctx)
{
    u32 i;
    u32 left = VarGet(ScriptReadHalfword(ctx));
    u32 top = VarGet(ScriptReadHalfword(ctx));
    bool32 ignoreBPress = ScriptReadByte(ctx);
    u32 maxBeforeScroll = ScriptReadByte(ctx);
    bool32 shouldSort = ScriptReadByte(ctx);
    u32 initialSelected = VarGet(ScriptReadHalfword(ctx));
    u32 callbackSet = ScriptReadByte(ctx);
    u32 initialRow = 0;
    // Read vararg
    u32 argc = ScriptReadByte(ctx);
    struct ListMenuItem *items;

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (argc == 0)
        return FALSE;

    if (maxBeforeScroll == 0xFF)
        maxBeforeScroll = DYN_MULTICHOICE_DEFAULT_MAX_BEFORE_SCROLL;

    if ((const u8*) ScriptPeekWord(ctx) != NULL)
    {
        items = AllocZeroed(sizeof(struct ListMenuItem) * argc);
        for (i = 0; i < argc; ++i)
        {
            u8 *nameBuffer = Alloc(100);
            const u8 *arg = (const u8 *) ScriptReadWord(ctx);
            StringExpandPlaceholders(nameBuffer, arg);
            items[i].name = nameBuffer;
            items[i].id = i;
            if (i == initialSelected)
                initialRow = i;
        }
    }
    else
    {
        argc = MultichoiceDynamic_StackSize();
        items = AllocZeroed(sizeof(struct ListMenuItem) * argc);
        for (i = 0; i < argc; ++i)
        {
            struct ListMenuItem *currentItem = MultichoiceDynamic_PeekElementAt(i);
            items[i] = *currentItem;
            if (currentItem->id == initialSelected)
                initialRow = i;
        }
        if (shouldSort)
            DynamicMultichoiceSortList(items, argc);
        MultichoiceDynamic_DestroyStack();
    }

    if (ScriptMenu_MultichoiceDynamic(left, top, argc, items, ignoreBPress, maxBeforeScroll, initialRow, callbackSet))
    {
        ScriptContext_Stop();
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

bool8 ScrCmd_dynmultipush(struct ScriptContext *ctx)
{
    const u8 *name = (const u8*) ScriptReadWord(ctx);
    u32 id = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    u8 *nameBuffer = Alloc(100);
    struct ListMenuItem item;
    StringExpandPlaceholders(nameBuffer, name);
    item.name = nameBuffer;
    item.id = id;
    MultichoiceDynamic_PushElement(item);
    return FALSE;
}

bool8 ScrCmd_multichoice(struct ScriptContext * ctx)
{
    u8 left = ScriptReadByte(ctx);
    u8 top = ScriptReadByte(ctx);
    u8 multichoiceId = ScriptReadByte(ctx);
    bool8 ignoreBPress = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (ScriptMenu_Multichoice(left, top, multichoiceId, ignoreBPress) == TRUE)
    {
        ScriptContext_Stop();
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

bool8 ScrCmd_multichoicedefault(struct ScriptContext * ctx)
{
    u8 left = ScriptReadByte(ctx);
    u8 top = ScriptReadByte(ctx);
    u8 multichoiceId = ScriptReadByte(ctx);
    u8 defaultChoice = ScriptReadByte(ctx);
    bool8 ignoreBPress = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (ScriptMenu_MultichoiceWithDefault(left, top, multichoiceId, ignoreBPress, defaultChoice) == TRUE)
    {
        ScriptContext_Stop();
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

bool8 ScrCmd_drawbox(struct ScriptContext * ctx)
{
    return FALSE;
}

bool8 ScrCmd_multichoicegrid(struct ScriptContext * ctx)
{
    u8 left = ScriptReadByte(ctx);
    u8 top = ScriptReadByte(ctx);
    u8 multichoiceId = ScriptReadByte(ctx);
    u8 numColumns = ScriptReadByte(ctx);
    bool8 ignoreBPress = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (ScriptMenu_MultichoiceGrid(left, top, multichoiceId, ignoreBPress, numColumns) == TRUE)
    {
        ScriptContext_Stop();
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

bool8 ScrCmd_erasebox(struct ScriptContext * ctx)
{
    u8 UNUSED left = ScriptReadByte(ctx);
    u8 UNUSED top = ScriptReadByte(ctx);
    u8 UNUSED right = ScriptReadByte(ctx);
    u8 UNUSED bottom = ScriptReadByte(ctx);

    return FALSE;
}

bool8 ScrCmd_drawboxtext(struct ScriptContext * ctx)
{
    return FALSE;
}

bool8 ScrCmd_showmonpic(struct ScriptContext * ctx)
{
    u16 species = VarGet(ScriptReadHalfword(ctx));
    u8 x = ScriptReadByte(ctx);
    u8 y = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    ScriptMenu_ShowPokemonPic(species, x, y);
    PlayCry_Script(species, CRY_MODE_NORMAL);
    return FALSE;
}

bool8 ScrCmd_hidemonpic(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    // The hide function returns a pointer to a function
    // that returns true once the pic is hidden
    bool8 (*func)(void) = ScriptMenu_HidePokemonPic();

    if (func == NULL)
        return FALSE;
    SetupNativeScript(ctx, func);
    return TRUE;
}

bool8 ScrCmd_showcontestpainting(struct ScriptContext * ctx)
{
    u8 UNUSED contestWinnerId = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    return FALSE;
}

bool8 ScrCmd_braillemessage(struct ScriptContext * ctx)
{
    u8 *msg = (u8 *)ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (msg == NULL)
        msg = (u8 *)ctx->data[0];

    LoadMessageBoxAndBorderGfx();
    DrawDialogueFrame(0, 1);
    AddTextPrinterParameterized(0, FONT_BRAILLE, msg, 0, 1, 0, NULL);
    return FALSE;
}

bool8 ScrCmd_getbraillestringwidth(struct ScriptContext * ctx)
{
    u8 *msg = (u8 *)ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (msg == NULL)
        msg = (u8 *)ctx->data[0];

    gSpecialVar_0x8004 = GetStringWidth(FONT_BRAILLE, msg, -1);
    return FALSE;
}

bool8 ScrCmd_vmessage(struct ScriptContext * ctx)
{
    u32 msg = ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    ShowFieldMessage((u8 *)(msg - sAddressOffset));
    return FALSE;
}

u8 *const sScriptStringVars[] =
{
    gStringVar1,
    gStringVar2,
    gStringVar3,
};

bool8 ScrCmd_bufferspeciesname(struct ScriptContext * ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u16 species = VarGet(ScriptReadHalfword(ctx));
    
    Script_RequestEffects(SCREFF_V1);

    StringCopy(sScriptStringVars[stringVarIndex], gSpeciesInfo[species].speciesName);
    return FALSE;
}

bool8 ScrCmd_bufferleadmonspeciesname(struct ScriptContext * ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1);

    u8 *dest = sScriptStringVars[stringVarIndex];
    u8 partyIndex = GetLeadMonIndex();
    u32 species = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPECIES, NULL);
    StringCopy(dest, gSpeciesInfo[species].speciesName);
    return FALSE;
}

void BufferFirstLiveMonNickname(struct ScriptContext *ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1);

    GetMonData(GetFirstLiveMon(), MON_DATA_NICKNAME, sScriptStringVars[stringVarIndex]);
    StringGet_Nickname(sScriptStringVars[stringVarIndex]);
}

bool8 ScrCmd_bufferpartymonnick(struct ScriptContext * ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u16 partyIndex = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    GetMonData(&gPlayerParty[partyIndex], MON_DATA_NICKNAME, sScriptStringVars[stringVarIndex]);
    StringGet_Nickname(sScriptStringVars[stringVarIndex]);
    return FALSE;
}

bool8 ScrCmd_bufferitemname(struct ScriptContext * ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u16 itemId = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    CopyItemName(itemId, sScriptStringVars[stringVarIndex]);
    return FALSE;
}

static const u8 sText_S[] = _("S");
static const u8 sText_IES[] = _("IES");

bool8 ScrCmd_bufferitemnameplural(struct ScriptContext * ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u16 itemId = VarGet(ScriptReadHalfword(ctx));
    u16 quantity = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    CopyItemName(itemId, sScriptStringVars[stringVarIndex]);
    if (itemId == ITEM_POKE_BALL && quantity >= 2)
        StringAppend(sScriptStringVars[stringVarIndex], sText_S);
    else if (itemId >= FIRST_BERRY_INDEX && itemId < LAST_BERRY_INDEX && quantity >= 2)
    {
        u16 strlength = StringLength(sScriptStringVars[stringVarIndex]);
        if (strlength != 0)
        {
            u8 * endptr = sScriptStringVars[stringVarIndex] + strlength;
            endptr[-1] = EOS;
            StringAppend(sScriptStringVars[stringVarIndex], sText_IES);
        }
    }

    return FALSE;
}

bool8 ScrCmd_bufferdecorationname(struct ScriptContext * ctx)
{
    u8 UNUSED stringVarIndex = ScriptReadByte(ctx);
    u16 UNUSED decorId = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    return FALSE;
}

bool8 ScrCmd_buffermovename(struct ScriptContext * ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u16 moveId = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    StringCopy(sScriptStringVars[stringVarIndex], gMovesInfo[moveId].name);
    return FALSE;
}

bool8 ScrCmd_buffernumberstring(struct ScriptContext * ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u16 num = VarGet(ScriptReadHalfword(ctx));
    u8 numDigits = CountDigits(num);

    Script_RequestEffects(SCREFF_V1);

    ConvertIntToDecimalStringN(sScriptStringVars[stringVarIndex], num, STR_CONV_MODE_LEFT_ALIGN, numDigits);
    return FALSE;
}

bool8 ScrCmd_bufferstdstring(struct ScriptContext * ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u16 index = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    StringCopy(sScriptStringVars[stringVarIndex], gStdStringPtrs[index]);
    return FALSE;
}

bool8 ScrCmd_bufferstring(struct ScriptContext * ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    const u8 *text = (u8 *)ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1);

    StringCopy(sScriptStringVars[stringVarIndex], text);
    return FALSE;
}

bool8 ScrCmd_vbuffermessage(struct ScriptContext * ctx)
{
    const u8 *ptr = (u8 *)(ScriptReadWord(ctx) - sAddressOffset);

    Script_RequestEffects(SCREFF_V1);

    StringExpandPlaceholders(gStringVar4, ptr);
    return FALSE;
}

bool8 ScrCmd_vbufferstring(struct ScriptContext * ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u32 addr = ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1);

    const u8 *src = (u8 *)(addr - sAddressOffset);
    u8 *dest = sScriptStringVars[stringVarIndex];
    StringCopy(dest, src);
    return FALSE;
}

bool8 ScrCmd_bufferboxname(struct ScriptContext * ctx)
{
    u8 stringVarIndex = ScriptReadByte(ctx);
    u16 boxId = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    StringCopy(sScriptStringVars[stringVarIndex], GetBoxNamePtr(boxId));
    return FALSE;
}

bool8 ScrCmd_giveegg(struct ScriptContext * ctx)
{
    u16 species = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    gSpecialVar_Result = ScriptGiveEgg(species);
    return FALSE;
}

bool8 ScrCmd_setmonmove(struct ScriptContext * ctx)
{
    u8 partyIndex = ScriptReadByte(ctx);
    u8 slot = ScriptReadByte(ctx);
    u16 move = ScriptReadHalfword(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    ScriptSetMonMoveSlot(partyIndex, move, slot);
    return FALSE;
}

bool8 ScrCmd_checkpartymove(struct ScriptContext *ctx)
{
    u8 i;
    u16 moveId = ScriptReadHalfword(ctx);

    Script_RequestEffects(SCREFF_V1);

    gSpecialVar_Result = PARTY_SIZE;
    for (i = 0; i < PARTY_SIZE; i++)
    {
        u16 species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES, NULL);
        if (!species)
            break;
        if (!GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG) && MonKnowsMove(&gPlayerParty[i], moveId) == TRUE)
        {
            gSpecialVar_Result = i;
            gSpecialVar_0x8004 = species;
            break;
        }
    }
    return FALSE;
}

bool8 ScrCmd_checkfieldmoveusable(struct ScriptContext* ctx)
{
    u32 partyIndex;
    enum FieldMove fieldMove = ScriptReadHalfword(ctx);
    u16 moveId = gFieldMovesInfo[fieldMove].moveId;
    gSpecialVar_Result = FALSE;

    Script_RequestEffects(SCREFF_V1);

    if (!FieldMove_IsUnlocked(fieldMove))
        return FALSE;

    partyIndex = Party_FirstMonWithMove(moveId);
    if (partyIndex != PARTY_SIZE)
    {
        gFieldEffectArguments[0] = partyIndex;
        gSpecialVar_0x8004 = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPECIES, NULL);
        gSpecialVar_Result = TRUE;
        GetMonData(&gPlayerParty[partyIndex], MON_DATA_NICKNAME, gStringVar1);
        StringGet_Nickname(gStringVar1);
        StringCopy(gStringVar2, gMovesInfo[moveId].name);
    }
    else if (OW_FIELD_MOVES_WITHOUT_HMS)
    {
        u16 species = FieldMove_GetDefaultSpecies(fieldMove);
        gFieldEffectArguments[0] = species | NOT_IN_PARTY_MASK;
        gSpecialVar_0x8004 = species;
        gSpecialVar_Result = TRUE;
        StringCopy(gStringVar1, COMPOUND_STRING("PROF. OAK's "));
        StringAppend(gStringVar1, gSpeciesInfo[species].speciesName);
        StringCopy(gStringVar2, gMovesInfo[moveId].name);
    }

    return FALSE;
}

bool8 ScrCmd_addmoney(struct ScriptContext * ctx)
{
    u32 amount = ScriptReadWord(ctx);
    u8 ignore = ScriptReadByte(ctx);

    if (!ignore)
    {
        Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

        AddMoney(&gSaveBlock1Ptr->money, amount);
    }
    return FALSE;
}

bool8 ScrCmd_removemoney(struct ScriptContext * ctx)
{
    u32 amount = ScriptReadWord(ctx);
    u8 ignore = ScriptReadByte(ctx);

    if (!ignore)
    {
        Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

        RemoveMoney(&gSaveBlock1Ptr->money, amount);
    }
    return FALSE;
}

bool8 ScrCmd_checkmoney(struct ScriptContext * ctx)
{
    u32 amount = ScriptReadWord(ctx);
    u8 ignore = ScriptReadByte(ctx);

    if (!ignore)
    {
        Script_RequestEffects(SCREFF_V1);

        gSpecialVar_Result = IsEnoughMoney(&gSaveBlock1Ptr->money, amount);
    }
    return FALSE;
}

bool8 ScrCmd_showmoneybox(struct ScriptContext * ctx)
{
    u8 x = ScriptReadByte(ctx);
    u8 y = ScriptReadByte(ctx);
    u8 ignore = ScriptReadByte(ctx);

    if (!ignore && QL_AvoidDisplay(QL_DestroyAbortedDisplay) != TRUE)
    {
        Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

        DrawMoneyBox(GetMoney(&gSaveBlock1Ptr->money), x, y);
    }
    return FALSE;
}

bool8 ScrCmd_hidemoneybox(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    HideMoneyBox();
    return FALSE;
}

bool8 ScrCmd_updatemoneybox(struct ScriptContext * ctx)
{
    u8 UNUSED x = ScriptReadByte(ctx);
    u8 UNUSED y = ScriptReadByte(ctx);
    u8 ignore = ScriptReadByte(ctx);

    if (!ignore)
    {
        Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

        ChangeAmountInMoneyBox(GetMoney(&gSaveBlock1Ptr->money));
    }
    return FALSE;
}

bool8 ScrCmd_showcoinsbox(struct ScriptContext * ctx)
{
    u8 x = ScriptReadByte(ctx);
    u8 y = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (QL_AvoidDisplay(QL_DestroyAbortedDisplay) != TRUE)
        ShowCoinsWindow(GetCoins(), x, y);
    return FALSE;
}

bool8 ScrCmd_hidecoinsbox(struct ScriptContext * ctx)
{
    u8 UNUSED x = ScriptReadByte(ctx);
    u8 UNUSED y = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    HideCoinsWindow();
    return FALSE;
}

bool8 ScrCmd_updatecoinsbox(struct ScriptContext * ctx)
{
    u8 UNUSED x = ScriptReadByte(ctx);
    u8 UNUSED y = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    PrintCoinsString(GetCoins());
    return FALSE;
}

bool8 ScrCmd_trainerbattle(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_TRAINERBATTLE);
    
    TrainerBattleLoadArgs(ctx->scriptPtr);
    ctx->scriptPtr = BattleSetup_ConfigureTrainerBattle(ctx->scriptPtr);
    return FALSE;
}

bool8 ScrCmd_dotrainerbattle(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    BattleSetup_StartTrainerBattle();
    return TRUE;
}

bool8 ScrCmd_gotopostbattlescript(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1);

    ctx->scriptPtr = BattleSetup_GetScriptAddrAfterBattle();
    return FALSE;
}

bool8 ScrCmd_gotobeatenscript(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1);

    ctx->scriptPtr = BattleSetup_GetTrainerPostBattleScript();
    return FALSE;
}

bool8 ScrCmd_checktrainerflag(struct ScriptContext * ctx)
{
    u16 index = VarGet(ScriptReadHalfword(ctx));

    ctx->comparisonResult = HasTrainerBeenFought(index);
    return FALSE;
}

bool8 ScrCmd_settrainerflag(struct ScriptContext * ctx)
{
    u16 index = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    SetTrainerFlag(index);
    return FALSE;
}

bool8 ScrCmd_cleartrainerflag(struct ScriptContext * ctx)
{
    u16 index = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    ClearTrainerFlag(index);
    return FALSE;
}

bool8 ScrCmd_setwildbattle(struct ScriptContext *ctx)
{
    u16 species = ScriptReadHalfword(ctx);
    u8 level = ScriptReadByte(ctx);
    u16 item = ScriptReadHalfword(ctx);
    u16 species2 = ScriptReadHalfword(ctx);
    u8 level2 = ScriptReadByte(ctx);
    u16 item2 = ScriptReadHalfword(ctx);

    Script_RequestEffects(SCREFF_V1);

    if(species2 == SPECIES_NONE)
    {
        CreateScriptedWildMon(species, level, item);
        sIsScriptedWildDouble = FALSE;
    }
    else
    {
        CreateScriptedDoubleWildMon(species, level, item, species2, level2, item2);
        sIsScriptedWildDouble = TRUE;
    }

    return FALSE;
}

bool8 ScrCmd_dowildbattle(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (sIsScriptedWildDouble == FALSE)
        BattleSetup_StartScriptedWildBattle();
    else
        BattleSetup_StartScriptedDoubleWildBattle();

    ScriptContext_Stop();

    return TRUE;
}

bool8 ScrCmd_pokemart(struct ScriptContext * ctx)
{
    const void *ptr = (void *)ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    CreatePokemartMenu(ptr);
    ScriptContext_Stop();
    return TRUE;
}

bool8 ScrCmd_pokemartdecoration(struct ScriptContext * ctx)
{
    const void *ptr = (void *)ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    CreateDecorationShop1Menu(ptr);
    ScriptContext_Stop();
    return TRUE;
}

// Changes clerk dialogue slightly from above. See MART_TYPE_DECOR2
bool8 ScrCmd_pokemartdecoration2(struct ScriptContext * ctx)
{
    const void *ptr = (void *)ScriptReadWord(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    CreateDecorationShop2Menu(ptr);
    ScriptContext_Stop();
    return TRUE;
}

bool8 ScrCmd_playslotmachine(struct ScriptContext * ctx)
{
    u8 slotMachineIndex = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    PlaySlotMachine(slotMachineIndex, CB2_ReturnToFieldContinueScriptPlayMapMusic);
    ScriptContext_Stop();
    return TRUE;
}

bool8 ScrCmd_setberrytree(struct ScriptContext * ctx)
{
    u8 treeId = ScriptReadByte(ctx);
    u8 berry = ScriptReadByte(ctx);
    u8 growthStage = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    if (berry == 0)
        PlantBerryTree(treeId, berry, growthStage, FALSE);
    else
        PlantBerryTree(treeId, berry, growthStage, FALSE);
    return FALSE;
}

bool8 ScrCmd_getpokenewsactive(struct ScriptContext * ctx)
{
//    u16 value = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);
//
//    gSpecialVar_Result = GetPriceReduction(value);
    return FALSE;
}

bool8 ScrCmd_choosecontestmon(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

//    ChooseContestMon();
    ScriptContext_Stop();
    return TRUE;
}


bool8 ScrCmd_startcontest(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

//    StartContest();
//    ScriptContext_Stop();
//    return TRUE;
    return FALSE;
}

bool8 ScrCmd_showcontestresults(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

//    ShowContestResults();
//    ScriptContext_Stop();
//    return TRUE;
    return FALSE;
}

bool8 ScrCmd_contestlinktransfer(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

//    ContestLinkTransfer(gSpecialVar_ContestCategory);
//    ScriptContext_Stop();
//    return TRUE;
    return FALSE;
}

bool8 ScrCmd_dofieldeffect(struct ScriptContext * ctx)
{
    u16 effectId = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    sFieldEffectScriptId = effectId;
    FieldEffectStart(sFieldEffectScriptId);
    return FALSE;
}

bool8 ScrCmd_setfieldeffectargument(struct ScriptContext * ctx)
{
    u8 argNum = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1);

    gFieldEffectArguments[argNum] = (s16)VarGet(ScriptReadHalfword(ctx));
    return FALSE;
}

static bool8 WaitForFieldEffectFinish(void)
{
    if (!FieldEffectActiveListContains(sFieldEffectScriptId))
        return TRUE;
    else
        return FALSE;
}

bool8 ScrCmd_waitfieldeffect(struct ScriptContext * ctx)
{
    u32 scriptId = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    sFieldEffectScriptId = scriptId;
    SetupNativeScript(ctx, WaitForFieldEffectFinish);
    return TRUE;
}

bool8 ScrCmd_setrespawn(struct ScriptContext * ctx)
{
    u16 healLocationId = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    SetLastHealLocationWarp(healLocationId);
    return FALSE;
}

bool8 ScrCmd_checkplayergender(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1);

    gSpecialVar_Result = gSaveBlock2Ptr->playerGender;
    return FALSE;
}

bool8 ScrCmd_playmoncry(struct ScriptContext * ctx)
{
    u16 species = VarGet(ScriptReadHalfword(ctx));
    u16 mode = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    PlayCry_Script(species, mode);
    return FALSE;
}

void PlayFirstMonCry(struct ScriptContext *ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    PlayCry_Script(GetMonData(GetFirstLiveMon(), MON_DATA_SPECIES), CRY_MODE_NORMAL);
}

bool8 ScrCmd_waitmoncry(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    SetupNativeScript(ctx, IsCryFinished);
    return TRUE;
}

bool8 ScrCmd_setmetatile(struct ScriptContext * ctx)
{
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));
    u16 metatileId = VarGet(ScriptReadHalfword(ctx));
    bool16 isImpassable = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    x += MAP_OFFSET;
    y += MAP_OFFSET;
    if (!isImpassable)
        MapGridSetMetatileIdAt(x, y, metatileId);
    else
        MapGridSetMetatileIdAt(x, y, metatileId | MAPGRID_COLLISION_MASK);
    return FALSE;
}

bool8 ScrCmd_opendoor(struct ScriptContext * ctx)
{
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    x += MAP_OFFSET;
    y += MAP_OFFSET;
    PlaySE(GetDoorSoundEffect(x, y));
    FieldAnimateDoorOpen(x, y);
    return FALSE;
}

bool8 ScrCmd_closedoor(struct ScriptContext * ctx)
{
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    x += MAP_OFFSET;
    y += MAP_OFFSET;
    FieldAnimateDoorClose(x, y);
    return FALSE;
}

static bool8 IsDoorAnimationStopped(void)
{
    if (!FieldIsDoorAnimationRunning())
        return TRUE;
    else
        return FALSE;
}

bool8 ScrCmd_waitdooranim(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    SetupNativeScript(ctx, IsDoorAnimationStopped);
    return TRUE;
}

bool8 ScrCmd_setdooropen(struct ScriptContext * ctx)
{
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    x += MAP_OFFSET;
    y += MAP_OFFSET;
    FieldSetDoorOpened(x, y);
    return FALSE;
}

bool8 ScrCmd_setdoorclosed(struct ScriptContext * ctx)
{
    u16 x = VarGet(ScriptReadHalfword(ctx));
    u16 y = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE | SCREFF_HARDWARE);

    x += MAP_OFFSET;
    y += MAP_OFFSET;
    FieldSetDoorClosed(x, y);
    return FALSE;
}

bool8 ScrCmd_addelevmenuitem(struct ScriptContext * ctx)
{
//    u8 v3 = ScriptReadByte(ctx);
//    u16 v5 = VarGet(ScriptReadHalfword(ctx));
//    u16 v7 = VarGet(ScriptReadHalfword(ctx));
//    u16 v9 = VarGet(ScriptReadHalfword(ctx));

    //ScriptAddElevatorMenuItem(v3, v5, v7, v9);
    return FALSE;
}

bool8 ScrCmd_showelevmenu(struct ScriptContext * ctx)
{
    /*ScriptShowElevatorMenu();
    ScriptContext_Stop();
    return TRUE;*/
    return FALSE;
}

bool8 ScrCmd_checkcoins(struct ScriptContext * ctx)
{
    u32 varId = ScriptReadHalfword(ctx);
    u16 *ptr = GetVarPointer(varId);

    Script_RequestEffects(SCREFF_V1);
    Script_RequestWriteVar(varId);

    *ptr = GetCoins();
    return FALSE;
}

bool8 ScrCmd_addcoins(struct ScriptContext * ctx)
{
    u16 coins = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    if (AddCoins(coins) == TRUE)
        gSpecialVar_Result = FALSE;
    else
        gSpecialVar_Result = TRUE;
    return FALSE;
}

bool8 ScrCmd_removecoins(struct ScriptContext * ctx)
{
    u16 coins = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    if (RemoveCoins(coins) == TRUE)
        gSpecialVar_Result = FALSE;
    else
        gSpecialVar_Result = TRUE;
    return FALSE;
}

bool8 ScrCmd_signmsg(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    MsgSetSignpost();
    return FALSE;
}

bool8 ScrCmd_normalmsg(struct ScriptContext * ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    MsgSetNotSignpost();
    return FALSE;
}

bool8 ScrCmd_selectapproachingtrainer(struct ScriptContext *ctx)
{
    Script_RequestEffects(SCREFF_V1);

    gSelectedObjectEvent = GetCurrentApproachingTrainerObjectEventId();
    return FALSE;
}

bool8 ScrCmd_lockfortrainer(struct ScriptContext *ctx)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_HARDWARE);

    if (IsUpdateLinkStateCBActive())
    {
        return FALSE;
    }
    else
    {
        if (gObjectEvents[gSelectedObjectEvent].active)
        {
            FreezeForApproachingTrainers();
            SetupNativeScript(ctx, IsFreezePlayerFinished);
        }
        return TRUE;
    }
}

// This command will set a Pokémon's modernFatefulEncounter bit; there is no similar command to clear it.
bool8 ScrCmd_setmodernfatefulencounter(struct ScriptContext * ctx)
{
    bool8 isModernFatefulEncounter = TRUE;
    u16 partyIndex = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    SetMonData(&gPlayerParty[partyIndex], MON_DATA_MODERN_FATEFUL_ENCOUNTER, &isModernFatefulEncounter);
    return FALSE;
}

bool8 ScrCmd_checkmodernfatefulencounter(struct ScriptContext * ctx)
{
    u16 partyIndex = VarGet(ScriptReadHalfword(ctx));

    Script_RequestEffects(SCREFF_V1);

    gSpecialVar_Result = GetMonData(&gPlayerParty[partyIndex], MON_DATA_MODERN_FATEFUL_ENCOUNTER, NULL);
    return FALSE;
}

bool8 ScrCmd_trywondercardscript(struct ScriptContext * ctx)
{
    const u8 * script = GetSavedRamScriptIfValid();
    if (script != NULL)
    {
        Script_RequestEffects(SCREFF_V1);

        gRamScriptRetAddr = ctx->scriptPtr;
        ScriptJump(ctx, script);
    }
    return FALSE;
}

bool8 ScrCmd_setmonmetlocation(struct ScriptContext * ctx)
{
    u16 partyIndex = VarGet(ScriptReadHalfword(ctx));
    u8 location = ScriptReadByte(ctx);

    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    if (partyIndex < PARTY_SIZE)
        SetMonData(&gPlayerParty[partyIndex], MON_DATA_MET_LOCATION, &location);
    return FALSE;
}

void SetMovingNpcId(u16 npcId)
{
    sMovingNpcId = npcId;
}

bool8 ScrFunc_hidefollower(struct ScriptContext *ctx)
{
    bool16 wait = VarGet(ScriptReadHalfword(ctx));
    struct ObjectEvent *obj;

    if ((obj = ScriptHideFollower()) != NULL && wait)
    {
        sMovingNpcId = obj->localId;
        sMovingNpcMapGroup = obj->mapGroup;
        sMovingNpcMapNum = obj->mapNum;
        SetupNativeScript(ctx, WaitForMovementFinish);
    }

    // Just in case, prevent `applymovement`
    // from hiding the follower again
    if (obj)
        FlagSet(FLAG_SAFE_FOLLOWER_MOVEMENT);

    // execute next script command with no delay
    return TRUE;
}
