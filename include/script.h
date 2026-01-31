#ifndef GUARD_SCRIPT_H
#define GUARD_SCRIPT_H

struct ScriptContext;

typedef bool8 (*ScrCmdFunc)(struct ScriptContext *);
typedef u8 Script[];

struct ScriptContext
{
    u8 stackDepth;
    u8 mode;
    u8 comparisonResult;
    bool8 breakOnTrainerBattle;
    u8 (*nativePtr)(void);
    const u8 *scriptPtr;
    const u8 *stack[20];
    ScrCmdFunc *cmdTable;
    ScrCmdFunc *cmdTableEnd;
    u32 data[4];
};

#define ScriptReadByte(ctx) (*(ctx->scriptPtr++))

void InitScriptContext(struct ScriptContext *ctx, void *cmdTable, void *cmdTableEnd);
u8 SetupBytecodeScript(struct ScriptContext *ctx, const u8 *ptr);
void SetupNativeScript(struct ScriptContext *ctx, bool8 (*ptr)(void));
void StopScript(struct ScriptContext *ctx);
bool8 RunScriptCommand(struct ScriptContext *ctx);
void ScriptJump(struct ScriptContext *ctx, const u8 *ptr);
void ScriptCall(struct ScriptContext *ctx, const u8 *ptr);
void ScriptReturn(struct ScriptContext *ctx);
u16 ScriptReadHalfword(struct ScriptContext *ctx);
u32 ScriptReadWord(struct ScriptContext *ctx);
u16 ScriptPeekHalfword(struct ScriptContext *ctx);
u32 ScriptPeekWord(struct ScriptContext *ctx);
void LockPlayerFieldControls(void);
void UnlockPlayerFieldControls(void);
bool8 ArePlayerFieldControlsLocked(void);
void ScriptContext_Init(void);
bool8 ScriptContext_IsEnabled(void);
bool8 ScriptContext_RunScript(void);
void ScriptContext_SetupScript(const u8 *ptr);
void ScriptContext_ContinueScript(struct ScriptContext *ctx);
void ScriptContext_Stop(void);
void ScriptContext_Enable(void);
void RunScriptImmediately(const u8 *ptr);
void RunOnLoadMapScript(void);
void RunOnTransitionMapScript(void);
void RunOnResumeMapScript(void);
void RunOnReturnToFieldMapScript(void);
void RunOnDiveWarpMapScript(void);
bool8 TryRunOnFrameMapScript(void);
void TryRunOnWarpIntoMapScript(void);
u32 CalculateRamScriptChecksum(void);
void ClearRamScript(void);
bool8 InitRamScript(u8 *script, u16 scriptSize, u8 mapGroup, u8 mapNum, u8 objectId);
const u8 *GetRamScript(u8 objectId, const u8 *script);
bool32 ValidateSavedRamScript(void);
u8 *GetSavedRamScriptIfValid(void);
void InitRamScript_NoObjectEvent(u8 *script, u16 scriptSize);
bool32 ValidateRamScript(void);
void InitRamScript_NoObjectEvent(u8 * script, u16 scriptSize);
u8 * GetSavedRamScriptIfValid(void);
void RegisterQuestLogInput(u8 var);
void ClearMsgBoxCancelableState(void);
void SetQuestLogInputIsDpadFlag(void);
void ClearQuestLogInput(void);
void ClearQuestLogInputIsDpadFlag(void);
void MsgSetSignpost(void);
void MsgSetNotSignpost(void);
bool8 IsMsgSignpost(void);
bool8 IsQuestLogInputDpad(void);
u8 GetRegisteredQuestLogInput(void);
void ResetFacingNpcOrSignpostVars(void);
bool8 CanWalkAwayToCancelMsgBox(void);
void SetWalkingIntoSignVars(void);
bool8 IsMsgBoxWalkawayDisabled(void);

bool32 Script_MatchesCallNative(const u8 *script, void *funcPtr, bool32 requestEffects);
bool32 Script_MatchesSpecial(const u8 *script, void *funcPtr);

// srccmd.h
void SetMovingNpcId(u16 npcId);

extern const u8 *gRamScriptRetAddr;
extern u8 gWalkAwayFromSignInhibitTimer;

/* Script effects analysis.
 *
 * 'RunScriptImmediatelyUntilEffect' executes a script until it reaches
 * the first command which calls 'Script_RequestEffects' with an
 * effect in 'effects' in which case it returns 'TRUE' and stores the
 * current state in 'ctx'; or until it reaches an 'end'/'return' in
 * which case it returns 'FALSE'.
 *
 * 'Script_HasNoEffect' wraps 'RunScriptImmediatelyUntilEffect' and
 * returns 'TRUE' if the script exits without an effect on the save or
 * the hardware, or 'FALSE' if it would have an effect (the effect is
 * not performed).
 *
 * Commands, natives, and specials which call 'Script_RequestEffects'
 * must be explicitly tagged with 'requests_effects=1', and must call
 * the function before any of those effects occur. An untagged function
 * could cause any effect, so execution is stopped to be safe. If the
 * code has no effects it must call 'Script_RequestEffects(SCREFF_V1)'
 * to note that explicitly.
 *
 * Regular variables are in the save (so should use 'SCREFF_SAVE'), but
 * special variables are not in the save, so 'Script_RequestWriteVar' is
 * provided to only request the 'SCREFF_SAVE' effect for a non-special
 * variable.
 *
 * The 'effects' parameter to 'RunScriptImmediatelyUntilEffect' and
 * 'Script_RequestEffects' must be the bitwise or of an effects version
 * (currently 'SCREFF_V1') and any number of effects. For example
 * 'Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE)'. */

enum // effects
{
    SCREFF_SAVE = 1 << 0,          // writes to the save.
    SCREFF_HARDWARE = 1 << 1,      // writes to a hardware register.
    SCREFF_TRAINERBATTLE = 1 << 2, // 'trainerbattle' command.
};

#define SCREFF_ANY (SCREFF_SAVE | SCREFF_HARDWARE | SCREFF_TRAINERBATTLE)

enum // effects versions
{
    SCREFF_V1 = 0xFFFFFFF8,
};

extern struct ScriptEffectContext *gScriptEffectContext;

bool32 RunScriptImmediatelyUntilEffect_Internal(u32 effects, const u8 *ptr, struct ScriptContext *ctx);
bool32 Script_HasNoEffect(const u8 *ptr);
void Script_GotoBreak_Internal(void);
void Script_RequestEffects_Internal(u32 effects);
void Script_RequestWriteVar_Internal(u32 varId);

static inline bool32 Script_IsAnalyzingEffects(void)
{
    return gScriptEffectContext != NULL;
}

#define RunScriptImmediatelyUntilEffect(effects, ptr, ctx) \
    ({ \
        _Static_assert((effects) & 0x80000000, "RunScriptImmediatelyUntilEffect requires an effects version"); \
        RunScriptImmediatelyUntilEffect_Internal(effects, ptr, ctx); \
    })

/* Optimize 'Script_RequestEffects' to a no-op if it would have no
 * effect. 'Script_RequestEffects' must be called in all commands and
 * natives/specials with 'request_effects=TRUE' even if it would have
 * no effect to future-proof against new effects. */
#define Script_RequestEffects(effects) \
    ({ \
        _Static_assert((effects) & 0x80000000, "Script_RequestEffects requires an effects version"); \
        if ((effects) != SCREFF_V1) \
            if (Script_IsAnalyzingEffects()) \
                Script_RequestEffects_Internal((effects) & SCREFF_ANY); \
    })

/* Optimize 'Script_RequestWriteVar' to a no-op if it would have no
 * effect. */
#define Script_RequestWriteVar(varId) \
    ({ \
        if (Script_IsAnalyzingEffects()) \
            Script_RequestWriteVar_Internal(varId); \
    })

static inline void Script_CheckEffectInstrumentedSpecial(u32 specialId)
{
    typedef u16 (*SpecialFunc)(void);
    extern const SpecialFunc gSpecials[];
    // In ROM mirror 1.
    if (Script_IsAnalyzingEffects() && (((uintptr_t)gSpecials[specialId]) & 0xE000000) != 0xA000000)
        Script_GotoBreak_Internal();
}

static inline void Script_CheckEffectInstrumentedGotoNative(bool8 (*func)(void))
{
    // In ROM mirror 1.
    if (Script_IsAnalyzingEffects() && (((uintptr_t)func) & 0xE000000) != 0xA000000)
        Script_GotoBreak_Internal();
}

static inline void Script_CheckEffectInstrumentedCallNative(void (*func)(struct ScriptContext *))
{
    // In ROM mirror 1.
    if (Script_IsAnalyzingEffects() && (((uintptr_t)func) & 0xE000000) != 0xA000000)
        Script_GotoBreak_Internal();
}

#endif // GUARD_SCRIPT_H
