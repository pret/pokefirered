#include "global.h"
#include "gba/isagbprint.h"
#include "script.h"
#include "event_data.h"

extern u16 (*const gSpecials[])(void);
extern u16 (*const gSpecialsEnd[])(void);
extern const u8 *const gStdScripts[];
extern const u8 *const gStdScriptsEnd[];

EWRAM_DATA ptrdiff_t gVScriptOffset = 0;
EWRAM_DATA u8 gUnknown_20370AC = 0;
EWRAM_DATA u16 gUnknown_20370AE = 0;
EWRAM_DATA u16 gUnknown_20370B0 = 0;
EWRAM_DATA u16 gUnknown_20370B2 = 0;
EWRAM_DATA u16 gUnknown_20370B4 = 0;
EWRAM_DATA u16 gUnknown_20370B6 = 0;

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

u8 * const sScriptStringVars[] =
{
    gStringVar1,
    gStringVar2,
    gStringVar3,
};
