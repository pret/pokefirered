#include "global.h"
#include "script.h"
#include "event_data.h"
#include "quest_log.h"
#include "constants/maps.h"

#define RAM_SCRIPT_MAGIC 51
#define SCRIPT_STACK_SIZE 20


extern void ResetContextNpcTextColor(void); // field_specials
extern u16 CalcCRC16WithTable(u8 *data, int length); // util
extern bool32 ValidateReceivedWonderCard(void); // mevent

enum
{
    SCRIPT_MODE_STOPPED,
    SCRIPT_MODE_BYTECODE,
    SCRIPT_MODE_NATIVE,
};

EWRAM_DATA u8 gWalkAwayFromSignInhibitTimer = 0;
EWRAM_DATA const u8 *gRAMScriptPtr = NULL;

// iwram bss
static u8 sScriptContext1Status;
static u32 sUnusedVariable1;
static struct ScriptContext sScriptContext1;
static u32 sUnusedVariable2;
static struct ScriptContext sScriptContext2;
static bool8 sScriptContext2Enabled;
static u8 sMsgBoxWalkawayDisabled;
static u8 sMsgBoxIsCancelable;
static u8 sQuestLogInput;
static u8 sQuestLogInputIsDpad;
static u8 sMsgIsSignPost;

extern ScrCmdFunc gScriptCmdTable[];
extern ScrCmdFunc gScriptCmdTableEnd[];
extern void *gNullScriptPtr;

void InitScriptContext(struct ScriptContext *ctx, void *cmdTable, void *cmdTableEnd)
{
    s32 i;

    ctx->mode = SCRIPT_MODE_STOPPED;
    ctx->scriptPtr = NULL;
    ctx->stackDepth = 0;
    ctx->nativePtr = NULL;
    ctx->cmdTable = cmdTable;
    ctx->cmdTableEnd = cmdTableEnd;

    for (i = 0; i < 4; i++)
        ctx->data[i] = 0;

    for (i = 0; i < SCRIPT_STACK_SIZE; i++)
        ctx->stack[i] = 0;
}

u8 SetupBytecodeScript(struct ScriptContext *ctx, const u8 *ptr)
{
    ctx->scriptPtr = ptr;
    ctx->mode = SCRIPT_MODE_BYTECODE;
    return 1;
}

void SetupNativeScript(struct ScriptContext *ctx, bool8 (*ptr)(void))
{
    ctx->mode = SCRIPT_MODE_NATIVE;
    ctx->nativePtr = ptr;
}

void StopScript(struct ScriptContext *ctx)
{
    ctx->mode = SCRIPT_MODE_STOPPED;
    ctx->scriptPtr = NULL;
}

bool8 RunScriptCommand(struct ScriptContext *ctx)
{
    // FRLG disabled this check, where-as it is present
    // in Ruby/Sapphire and Emerald. Why did the programmers
    // bother to remove a redundant check when it still
    // exists in Emerald?
    //if (ctx->mode == SCRIPT_MODE_STOPPED)
    //    return FALSE;

    switch (ctx->mode)
    {
    case SCRIPT_MODE_STOPPED:
        return FALSE;
    case SCRIPT_MODE_NATIVE:
        if (ctx->nativePtr)
        {
            if (ctx->nativePtr() == TRUE)
                ctx->mode = SCRIPT_MODE_BYTECODE;
            return TRUE;
        }
        ctx->mode = SCRIPT_MODE_BYTECODE;
    case SCRIPT_MODE_BYTECODE:
        while (1)
        {
            u8 cmdCode;
            ScrCmdFunc *cmdFunc;

            if (ctx->scriptPtr == NULL)
            {
                ctx->mode = SCRIPT_MODE_STOPPED;
                return FALSE;
            }

            if (ctx->scriptPtr == gNullScriptPtr)
            {
                while (1)
                    asm("svc 2"); // HALT
            }

            cmdCode = *(ctx->scriptPtr);
            ctx->scriptPtr++;
            cmdFunc = &ctx->cmdTable[cmdCode];

            if (cmdFunc >= ctx->cmdTableEnd)
            {
                ctx->mode = SCRIPT_MODE_STOPPED;
                return FALSE;
            }

            if ((*cmdFunc)(ctx) == TRUE)
                return TRUE;
        }
    }

    return TRUE;
}

u8 ScriptPush(struct ScriptContext *ctx, const u8 *ptr)
{
    if (ctx->stackDepth + 1 >= SCRIPT_STACK_SIZE)
    {
        return 1;
    }
    else
    {
        ctx->stack[ctx->stackDepth] = ptr;
        ctx->stackDepth++;
        return 0;
    }
}

const u8 *ScriptPop(struct ScriptContext *ctx)
{
    if (ctx->stackDepth == 0)
        return NULL;

    ctx->stackDepth--;
    return ctx->stack[ctx->stackDepth];
}

void ScriptJump(struct ScriptContext *ctx, const u8 *ptr)
{
    ctx->scriptPtr = ptr;
}

void ScriptCall(struct ScriptContext *ctx, const u8 *ptr)
{
    ScriptPush(ctx, ctx->scriptPtr);
    ctx->scriptPtr = ptr;
}

void ScriptReturn(struct ScriptContext *ctx)
{
    ctx->scriptPtr = ScriptPop(ctx);
}

u16 ScriptReadHalfword(struct ScriptContext *ctx)
{
    u16 value = *(ctx->scriptPtr++);
    value |= *(ctx->scriptPtr++) << 8;
    return value;
}

u32 ScriptReadWord(struct ScriptContext *ctx)
{
    u32 value0 = *(ctx->scriptPtr++);
    u32 value1 = *(ctx->scriptPtr++);
    u32 value2 = *(ctx->scriptPtr++);
    u32 value3 = *(ctx->scriptPtr++);
    return (((((value3 << 8) + value2) << 8) + value1) << 8) + value0;
}

void ScriptContext2_Enable(void)
{
    sScriptContext2Enabled = TRUE;
}

void ScriptContext2_Disable(void)
{
    sScriptContext2Enabled = FALSE;
}

bool8 ScriptContext2_IsEnabled(void)
{
    return sScriptContext2Enabled;
}

void SetQuestLogInputIsDpadFlag(void)
{
    sQuestLogInputIsDpad = TRUE;
}

void ClearQuestLogInputIsDpadFlag(void)
{
    sQuestLogInputIsDpad = FALSE;
}

bool8 IsQuestLogInputDpad(void)
{
    if(sQuestLogInputIsDpad == TRUE)
        return TRUE;
    else
        return FALSE;
}

void RegisterQuestLogInput(u8 var)
{
    sQuestLogInput = var;
}

void ClearQuestLogInput(void)
{
    sQuestLogInput = 0;
}

u8 GetRegisteredQuestLogInput(void)
{
    return sQuestLogInput;
}

void DisableMsgBoxWalkaway(void)
{
    sMsgBoxWalkawayDisabled = TRUE;
}

void EnableMsgBoxWalkaway(void)
{
    sMsgBoxWalkawayDisabled = FALSE;
}

bool8 IsMsgBoxWalkawayDisabled(void)
{
    return sMsgBoxWalkawayDisabled;
}

void SetWalkingIntoSignVars(void)
{
    gWalkAwayFromSignInhibitTimer = 6;
    sMsgBoxIsCancelable = TRUE;
}

void ClearMsgBoxCancelableState(void)
{
    sMsgBoxIsCancelable = FALSE;
}

bool8 CanWalkAwayToCancelMsgBox(void)
{
    if(sMsgBoxIsCancelable == TRUE)
        return TRUE;
    else
        return FALSE;
}

void MsgSetSignPost(void)
{
    sMsgIsSignPost = TRUE;
}

void MsgSetNotSignPost(void)
{
    sMsgIsSignPost = FALSE;
}

bool8 IsMsgSignPost(void)
{
    if(sMsgIsSignPost == TRUE)
        return TRUE;
    else
        return FALSE;
}

void ResetFacingNpcOrSignPostVars(void)
{
    ResetContextNpcTextColor();
    MsgSetNotSignPost();
}

bool8 ScriptContext1_IsScriptSetUp(void)
{
    if (sScriptContext1Status == 0)
        return TRUE;
    else
        return FALSE;
}

void ScriptContext1_Init(void)
{
    InitScriptContext(&sScriptContext1, gScriptCmdTable, gScriptCmdTableEnd);
    sScriptContext1Status = 2;
}

bool8 ScriptContext2_RunScript(void)
{
    if (sScriptContext1Status == 2)
        return 0;

    if (sScriptContext1Status == 1)
        return 0;

    ScriptContext2_Enable();

    if (!RunScriptCommand(&sScriptContext1))
    {
        sScriptContext1Status = 2;
        ScriptContext2_Disable();
        return 0;
    }

    return 1;
}

void ScriptContext1_SetupScript(const u8 *ptr)
{
    ClearMsgBoxCancelableState();
    EnableMsgBoxWalkaway();
    ClearQuestLogInputIsDpadFlag();
    InitScriptContext(&sScriptContext1, gScriptCmdTable, gScriptCmdTableEnd);
    SetupBytecodeScript(&sScriptContext1, ptr);
    ScriptContext2_Enable();
    sScriptContext1Status = 0;
}

void ScriptContext1_Stop(void)
{
    sScriptContext1Status = 1;
}

void EnableBothScriptContexts(void)
{
    sScriptContext1Status = 0;
    ScriptContext2_Enable();
}

void ScriptContext2_RunNewScript(const u8 *ptr)
{
    InitScriptContext(&sScriptContext2, &gScriptCmdTable, &gScriptCmdTableEnd);
    SetupBytecodeScript(&sScriptContext2, ptr);
    while (RunScriptCommand(&sScriptContext2) == TRUE);
}

u8 *mapheader_get_tagged_pointer(u8 tag)
{
    const u8 *mapScripts = gMapHeader.mapScripts;

    if (mapScripts == NULL)
        return NULL;

    while (1)
    {
        if (*mapScripts == 0)
            return NULL;
        if (*mapScripts == tag)
        {
            mapScripts++;
            return T2_READ_PTR(mapScripts);
        }
        mapScripts += 5;
    }
}

void mapheader_run_script_by_tag(u8 tag)
{
    u8 *ptr = mapheader_get_tagged_pointer(tag);
    if (ptr != NULL)
        ScriptContext2_RunNewScript(ptr);
}

u8 *mapheader_get_first_match_from_tagged_ptr_list(u8 tag)
{
    u8 *ptr = mapheader_get_tagged_pointer(tag);

    if (ptr == NULL)
        return NULL;

    while (1)
    {
        u16 varIndex1;
        u16 varIndex2;
        varIndex1 = ptr[0] | (ptr[1] << 8);
        if (!varIndex1)
            return NULL;
        ptr += 2;
        varIndex2 = ptr[0] | (ptr[1] << 8);
        ptr += 2;
        if (VarGet(varIndex1) == VarGet(varIndex2))
            return (u8 *)(ptr[0] + (ptr[1] << 8) + (ptr[2] << 16) + (ptr[3] << 24));
        ptr += 4;
    }
}

void RunOnLoadMapScript(void)
{
    mapheader_run_script_by_tag(1);
}

void RunOnTransitionMapScript(void)
{
    mapheader_run_script_by_tag(3);
}

void RunOnResumeMapScript(void)
{
    mapheader_run_script_by_tag(5);
}

void RunOnReturnToFieldMapScript(void)
{
    mapheader_run_script_by_tag(7);
}

void RunOnDiveWarpMapScript(void)
{
    mapheader_run_script_by_tag(6);
}

bool8 TryRunOnFrameMapScript(void)
{
    u8 *ptr;

    if(gQuestLogState == QL_STATE_PLAYBACK_LAST)
        return 0;

    ptr = mapheader_get_first_match_from_tagged_ptr_list(2);

    if (!ptr)
        return 0;

    ScriptContext1_SetupScript(ptr);
    return 1;
}

void TryRunOnWarpIntoMapScript(void)
{
    u8 *ptr = mapheader_get_first_match_from_tagged_ptr_list(4);
    if (ptr)
        ScriptContext2_RunNewScript(ptr);
}

u32 CalculateRamScriptChecksum(void)
{
    return CalcCRC16WithTable((u8 *)(&gSaveBlock1Ptr->ramScript.data), sizeof(gSaveBlock1Ptr->ramScript.data));
}

void ClearRamScript(void)
{
    CpuFill32(0, &gSaveBlock1Ptr->ramScript, sizeof(struct RamScript));
}

bool8 InitRamScript(u8 *script, u16 scriptSize, u8 mapGroup, u8 mapNum, u8 objectId)
{
    struct RamScriptData *scriptData = &gSaveBlock1Ptr->ramScript.data;

    ClearRamScript();

    if (scriptSize > sizeof(scriptData->script))
        return FALSE;

    scriptData->magic = RAM_SCRIPT_MAGIC;
    scriptData->mapGroup = mapGroup;
    scriptData->mapNum = mapNum;
    scriptData->objectId = objectId;
    memcpy(scriptData->script, script, scriptSize);
    gSaveBlock1Ptr->ramScript.checksum = CalculateRamScriptChecksum();
    return TRUE;
}

const u8 *GetRamScript(u8 objectId, const u8 *script)
{
    struct RamScriptData *scriptData = &gSaveBlock1Ptr->ramScript.data;
    gRAMScriptPtr = NULL;
    if (scriptData->magic != RAM_SCRIPT_MAGIC)
        return script;
    if (scriptData->mapGroup != gSaveBlock1Ptr->location.mapGroup)
        return script;
    if (scriptData->mapNum != gSaveBlock1Ptr->location.mapNum)
        return script;
    if (scriptData->objectId != objectId)
        return script;
    if (CalculateRamScriptChecksum() != gSaveBlock1Ptr->ramScript.checksum)
    {
        ClearRamScript();
        return script;
    }
    else
    {
        gRAMScriptPtr = script;
        return scriptData->script;
    }
}

bool32 ValidateRamScript(void)
{
    struct RamScriptData *scriptData = &gSaveBlock1Ptr->ramScript.data;
    if (scriptData->magic != RAM_SCRIPT_MAGIC)
        return FALSE;
    if (scriptData->mapGroup != MAP_GROUP(UNDEFINED))
        return FALSE;
    if (scriptData->mapNum != MAP_NUM(UNDEFINED))
        return FALSE;
    if (scriptData->objectId != 0xFF)
        return FALSE;
    if (CalculateRamScriptChecksum() != gSaveBlock1Ptr->ramScript.checksum)
        return FALSE;
    return TRUE;
}

u8 *sub_8069E48(void)
{
    struct RamScriptData *scriptData = &gSaveBlock1Ptr->ramScript.data;
    if (!ValidateReceivedWonderCard())
        return NULL;
    if (scriptData->magic != RAM_SCRIPT_MAGIC)
        return NULL;
    if (scriptData->mapGroup != MAP_GROUP(UNDEFINED))
        return NULL;
    if (scriptData->mapNum != MAP_NUM(UNDEFINED))
        return NULL;
    if (scriptData->objectId != 0xFF)
        return NULL;
    if (CalculateRamScriptChecksum() != gSaveBlock1Ptr->ramScript.checksum)
    {
        ClearRamScript();
        return NULL;
    }
    else
    {
        return scriptData->script;
    }
}

void MEventSetRamScript(u8 *script, u16 scriptSize)
{
    if (scriptSize > sizeof(gSaveBlock1Ptr->ramScript.data.script))
        scriptSize = sizeof(gSaveBlock1Ptr->ramScript.data.script);
    InitRamScript(script, scriptSize, 0xFF, 0xFF, 0xFF);
}
