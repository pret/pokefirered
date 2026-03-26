#include "global.h"
#include "gflib.h"
#include "task.h"
#include "menu.h"
#include "menu_helpers.h"
#include "text_window.h"
#include "event_data.h"
#include "script.h"
#include "overworld.h"
#include "field_fadetransition.h"
#include "field_weather.h"
#include "event_object_movement.h"
#include "event_object_lock.h"
#include "field_player_avatar.h"
#include "item.h"
#include "region_map.h"
#include "map_name_popup.h"
#include "wild_encounter.h"
#include "help_system.h"
#include "pokemon_storage_system.h"
#include "save.h"
#include "quest_log_objects.h"
#include "quest_log_player.h"
#include "quest_log.h"
#include "new_menu_helpers.h"
#include "strings.h"
#include "constants/event_objects.h"
#include "constants/maps.h"
#include "constants/quest_log.h"
#include "constants/field_weather.h"
#include "constants/event_object_movement.h"

enum {
    WIN_TOP_BAR,      // Contains the "Previously on..." text
    WIN_BOTTOM_BAR,   // Empty, only briefly visible at the end or when the description window isn't covering it.
    WIN_DESCRIPTION,
    WIN_COUNT
};

#define DESC_WIN_WIDTH (DISPLAY_WIDTH / 8)
#define DESC_WIN_HEIGHT 6
#define DESC_WIN_SIZE (DESC_WIN_WIDTH * DESC_WIN_HEIGHT * TILE_SIZE_4BPP)

// sQuestLogActionRecordBuffer should be large enough to fill a scene's script with the maximum number of actions
#define SCRIPT_BUFFER_SIZE (sizeof(gSaveBlock1Ptr->questLog[0].script) / sizeof(struct QuestLogAction))

enum {
    END_MODE_NONE,
    END_MODE_FINISH,
    END_MODE_SCENE,
};

struct PlaybackControl
{
    u8 state:4;
    u8 playingEvent:2;
    u8 endMode:2;
    u8 cursor;
    u8 timer;
    u8 overlapTimer;
};

struct FlagOrVarRecord
{
    u16 idx:15;
    u16 isFlag:1;
    u16 value;
};

COMMON_DATA u8 gQuestLogPlaybackState = 0;
COMMON_DATA u16 sMaxActionsInScene = 0;
COMMON_DATA struct FieldInput gQuestLogFieldInput = {0};
COMMON_DATA struct QuestLogAction * sCurSceneActions = NULL;

static struct FlagOrVarRecord * sFlagOrVarRecords;
static u16 sNumFlagsOrVars;

static EWRAM_DATA u8 sCurrentSceneNum = 0;
static EWRAM_DATA u8 sNumScenes = 0;
EWRAM_DATA u8 gQuestLogState = 0;
static EWRAM_DATA u16 sRecordSequenceStartIdx = 0;
static EWRAM_DATA u8 sWindowIds[WIN_COUNT] = {0};
EWRAM_DATA u16 *gQuestLogDefeatedWildMonRecord = NULL;
EWRAM_DATA u16 *gQuestLogRecordingPointer = NULL;
static EWRAM_DATA u16 *sEventData[32] = {NULL};
static EWRAM_DATA void (* sQuestLogCB)(void) = NULL;
static EWRAM_DATA u16 *sPalettesBackup = NULL;
static EWRAM_DATA struct PlaybackControl sPlaybackControl = {0};
static EWRAM_DATA struct QuestLogAction sQuestLogActionRecordBuffer[SCRIPT_BUFFER_SIZE] = {0};
EWRAM_DATA u16 gQuestLogCurActionIdx = 0;
static EWRAM_DATA u8 sMovementScripts[OBJECT_EVENT_TEMPLATES_COUNT][2] = {{0}};
static EWRAM_DATA u16 sNextActionDelay = 0;
static EWRAM_DATA u16 sLastQuestLogCursor = 0;
static EWRAM_DATA u16 sFlagOrVarPlayhead = 0;

static void QLogCB_Recording(void);
static void QLogCB_Playback(void);
static void SetPlayerInitialCoordsAtScene(u8);
static void SetNPCInitialCoordsAtScene(u8);
static void RecordSceneEnd(void);
static void BackUpTrainerRematches(void);
static void BackUpMapLayout(void);
static void SetGameStateAtScene(u8);
static u8 TryRecordActionSequence(struct QuestLogAction *);
static void Task_BeginQuestLogPlayback(u8);
static void QL_LoadObjectsAndTemplates(u8);
static void QLPlayback_InitOverworldState(void);
static void SetPokemonCounts(void);
static u16 QuestLog_GetPartyCount(void);
static u16 QuestLog_GetBoxMonCount(void);
static void RestoreTrainerRematches(void);
static void ReadQuestLogScriptFromSav1(u8, struct QuestLogAction *);
static void DoSceneEndTransition(s8 delay);
static void DoSkipToEndTransition(s8 delay);
static void QuestLog_AdvancePlayhead(void);
static void QuestLog_StartFinalScene(void);
static void Task_AvoidDisplay(u8);
static void QuestLog_PlayCurrentEvent(void);
static void HandleShowQuestLogMessage(void);
static u8 GetQuestLogTextDisplayDuration(void);
static void DrawSceneDescription(void);
static void CopyDescriptionWindowTiles(u8);
static void QuestLog_CloseTextWindow(void);
static void QuestLog_WaitFadeAndCancelPlayback(void);
static bool8 FieldCB2_FinalScene(void);
static void Task_FinalScene_WaitFade(u8);
static void Task_QuestLogScene_SavedGame(u8);
static void Task_WaitAtEndOfQuestLog(u8);
static void Task_EndQuestLog(u8);
static bool8 RestoreScreenAfterPlayback(u8);
static void QL_SlightlyDarkenSomePals(void);
static void TogglePlaybackStateForOverworldLock(u8);
static void ResetActions(u8, struct QuestLogAction *, u16);
static bool8 RecordHeadAtEndOfEntryOrScriptContext2Enabled(void);
static bool8 RecordHeadAtEndOfEntry(void);
static bool8 InQuestLogDisabledLocation(void);
static bool8 TrySetLinkQuestLogEvent(u16, const u16 *);
static bool8 TrySetTrainerBattleQuestLogEvent(u16, const u16 *);

static const struct WindowTemplate sWindowTemplates[WIN_COUNT] = {
    [WIN_TOP_BAR] = {
        .bg = 0,
        .tilemapLeft = 0, 
        .tilemapTop = 0,
        .width = 30,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 0x0e9
    },
    [WIN_BOTTOM_BAR] = {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 18,
        .width = 30,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 0x0ad
    },
    [WIN_DESCRIPTION] = {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 14,
        .width = DESC_WIN_WIDTH,
        .height = DESC_WIN_HEIGHT,
        .paletteNum = 15,
        .baseBlock = 0x14c
    }
};

static const u8 sTextColors[3] = {TEXT_DYNAMIC_COLOR_6, TEXT_COLOR_WHITE, TEXT_DYNAMIC_COLOR_3};

static const u16 sDescriptionWindow_Gfx[] = INCBIN_U16("graphics/quest_log/description_window.4bpp");

static const u8 sQuestLogTextLineYCoords[] = {17, 10, 3};

void QL_AddASLROffset(void *oldSaveBlockPtr)
{
    // For some reason the caller passes the original pointer and the
    // amount the save moved is recalculated, instead of just passing
    // the offset to begin with.
    ptrdiff_t offset = (void *)gSaveBlock1Ptr - oldSaveBlockPtr;
    if (gQuestLogDefeatedWildMonRecord)
        gQuestLogDefeatedWildMonRecord = (void *)gQuestLogDefeatedWildMonRecord + offset;

    if (gQuestLogState == 0)
        return;

    if (gQuestLogRecordingPointer)
        gQuestLogRecordingPointer = (void *)gQuestLogRecordingPointer + offset;

    if (gQuestLogState == QL_STATE_PLAYBACK)
    {
        int i;
        for (i = 0; i < (int)ARRAY_COUNT(sEventData); i++)
            if (sEventData[i])
                sEventData[i] = (void *)sEventData[i] + offset;
    }
}

void ResetQuestLog(void)
{
    memset(gSaveBlock1Ptr->questLog, 0, sizeof(gSaveBlock1Ptr->questLog));
    sCurrentSceneNum = 0;
    gQuestLogState = 0;
    sQuestLogCB = NULL;
    gQuestLogRecordingPointer = NULL;
    gQuestLogDefeatedWildMonRecord = NULL;
    QL_ResetEventStates();
    ResetDeferredLinkEvent();
}

static void ClearSavedScene(u8 sceneNum)
{
    memset(&gSaveBlock1Ptr->questLog[sceneNum], 0, sizeof(gSaveBlock1Ptr->questLog[sceneNum]));
    gQuestLogDefeatedWildMonRecord = NULL;
}

void QL_ResetDefeatedWildMonRecord(void)
{
    gQuestLogDefeatedWildMonRecord = NULL;
}

void RunQuestLogCB(void)
{
    if (sQuestLogCB != NULL)
        sQuestLogCB();
}

bool8 QL_IsRoomToSaveEvent(const void * cursor, size_t size)
{
    const void *start = gSaveBlock1Ptr->questLog[sCurrentSceneNum].script;
    const void *end = gSaveBlock1Ptr->questLog[sCurrentSceneNum].end;
    end -= size;
    if (cursor < start || cursor > end)
        return FALSE;
    return TRUE;
}

// Identical to QL_IsRoomToSaveEvent
bool8 QL_IsRoomToSaveAction(const void * cursor, size_t size)
{
    const void *start = gSaveBlock1Ptr->questLog[sCurrentSceneNum].script;
    const void *end = gSaveBlock1Ptr->questLog[sCurrentSceneNum].end;
    end -= size;
    if (cursor < start || cursor > end)
        return FALSE;
    return TRUE;
}

static void SetQuestLogState(u8 state)
{
    gQuestLogState = state;
    if (state == QL_STATE_RECORDING)
        sQuestLogCB = QLogCB_Recording;
    else
        sQuestLogCB = QLogCB_Playback;
}

static void QLogCB_Recording(void)
{
    if (TryRecordActionSequence(sQuestLogActionRecordBuffer) != 1)
    {
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_STOPPED;
        RecordSceneEnd();
        gQuestLogState = 0;
        sQuestLogCB = NULL;
    }
}

static void QLogCB_Playback(void)
{
    if (sPlaybackControl.state == 2)
        sPlaybackControl.state = 0;

    if (sPlaybackControl.endMode == END_MODE_NONE)
    {
        if (gQuestLogPlaybackState != QL_PLAYBACK_STATE_STOPPED 
         || sPlaybackControl.state == 1 
         || (sPlaybackControl.cursor < ARRAY_COUNT(sEventData) 
          && sEventData[sPlaybackControl.cursor] != NULL))
            QuestLog_PlayCurrentEvent();
        else
        {
            sPlaybackControl.endMode = END_MODE_SCENE;
            LockPlayerFieldControls();
            DoSceneEndTransition(0);
        }
    }
}

void GetQuestLogState(void)
{
    gSpecialVar_Result = gQuestLogState;
}

u8 GetQuestLogStartType(void)
{
    return gSaveBlock1Ptr->questLog[sCurrentSceneNum].startType;
}

void QL_StartRecordingAction(u16 eventId)
{
    if (sCurrentSceneNum >= QUEST_LOG_SCENE_COUNT)
        sCurrentSceneNum = 0;

    ClearSavedScene(sCurrentSceneNum);
    QL_ResetRepeatEventTracker();
    gQuestLogRecordingPointer = gSaveBlock1Ptr->questLog[sCurrentSceneNum].script;
    if (IS_LINK_QL_EVENT(eventId) || eventId == QL_EVENT_DEPARTED)
        gSaveBlock1Ptr->questLog[sCurrentSceneNum].startType = QL_START_WARP;
    else
        gSaveBlock1Ptr->questLog[sCurrentSceneNum].startType = QL_START_NORMAL;
    SetPokemonCounts();
    SetPlayerInitialCoordsAtScene(sCurrentSceneNum);
    SetNPCInitialCoordsAtScene(sCurrentSceneNum);
    BackUpTrainerRematches();
    BackUpMapLayout();
    SetGameStateAtScene(sCurrentSceneNum);
    sRecordSequenceStartIdx = 0;
    ResetActions(QL_PLAYBACK_STATE_RECORDING, sQuestLogActionRecordBuffer, sizeof(sQuestLogActionRecordBuffer));
    TryRecordActionSequence(sQuestLogActionRecordBuffer);
    SetQuestLogState(QL_STATE_RECORDING);
}

static void SetPlayerInitialCoordsAtScene(u8 sceneNum)
{
    struct QuestLogScene * questLog = &gSaveBlock1Ptr->questLog[sceneNum];
    questLog->mapGroup = gSaveBlock1Ptr->location.mapGroup;
    questLog->mapNum = gSaveBlock1Ptr->location.mapNum;
    questLog->warpId = gSaveBlock1Ptr->location.warpId;
    questLog->x = gSaveBlock1Ptr->pos.x;
    questLog->y = gSaveBlock1Ptr->pos.y;
}

static void SetNPCInitialCoordsAtScene(u8 sceneNum)
{
    struct QuestLogScene * questLog = &gSaveBlock1Ptr->questLog[sceneNum];
    u16 i;

    QL_RecordObjects(questLog);

    for (i = 0; i < OBJECT_EVENT_TEMPLATES_COUNT; i++)
    {
        if (gSaveBlock1Ptr->objectEventTemplates[i].x < 0)
        {
            questLog->objectEventTemplates[i].x = -1 * gSaveBlock1Ptr->objectEventTemplates[i].x;
            questLog->objectEventTemplates[i].negx = TRUE;
        }
        else
        {
            questLog->objectEventTemplates[i].x = (u8)gSaveBlock1Ptr->objectEventTemplates[i].x;
            questLog->objectEventTemplates[i].negx = FALSE;
        }
        if (gSaveBlock1Ptr->objectEventTemplates[i].y < 0)
        {
            questLog->objectEventTemplates[i].y = (-gSaveBlock1Ptr->objectEventTemplates[i].y << 24) >> 24;
            questLog->objectEventTemplates[i].negy = TRUE;
        }
        else
        {
            questLog->objectEventTemplates[i].y = (u8)gSaveBlock1Ptr->objectEventTemplates[i].y;
            questLog->objectEventTemplates[i].negy = FALSE;
        }
        questLog->objectEventTemplates[i].elevation = gSaveBlock1Ptr->objectEventTemplates[i].objUnion.normal.elevation;
        questLog->objectEventTemplates[i].movementType = gSaveBlock1Ptr->objectEventTemplates[i].objUnion.normal.movementType;
    }
}

static void SetGameStateAtScene(u8 sceneNum)
{
    struct QuestLogScene * questLog = &gSaveBlock1Ptr->questLog[sceneNum];

    CpuCopy16(gSaveBlock1Ptr->flags, questLog->flags, sizeof(gSaveBlock1Ptr->flags));
    CpuCopy16(gSaveBlock1Ptr->vars, questLog->vars, sizeof(gSaveBlock1Ptr->vars));
}

static void BackUpTrainerRematches(void)
{
    u16 i, j;
    u16 vars[4];

    // Save the contents of gSaveBlock1Ptr->trainerRematches to the 4 saveblock
    // vars starting at VAR_QLBAK_TRAINER_REMATCHES. The rematch array is 100 bytes
    // long, but each byte is only ever 0 or 1 to indicate that a rematch is available.
    // They're compressed into single bits across 4 u16 save vars, which is only enough
    // to save 64 elements of gSaveBlock1Ptr->trainerRematches. 64 however is the maximum
    // that could ever be used, as its the maximum number of NPCs per map (OBJECT_EVENT_TEMPLATES_COUNT).
    for (i = 0; i < ARRAY_COUNT(vars); i++)
    {
        vars[i] = 0;

        // 16 bits per var
        for (j = 0; j < 16; j++)
        {
            if (gSaveBlock1Ptr->trainerRematches[16 * i + j])
                vars[i] += (1 << j);
        }
        VarSet(VAR_QLBAK_TRAINER_REMATCHES + i, vars[i]);
    }
}

static void BackUpMapLayout(void)
{
    VarSet(VAR_QLBAK_MAP_LAYOUT, gSaveBlock1Ptr->mapLayoutId);
}

static void RecordSceneEnd(void)
{
    QL_RecordAction_SceneEnd(gQuestLogRecordingPointer);
    if (++sCurrentSceneNum >= QUEST_LOG_SCENE_COUNT)
        sCurrentSceneNum = 0;
}

static bool8 TryRecordActionSequence(struct QuestLogAction * actions)
{
    u16 i;

    for (i = sRecordSequenceStartIdx; i < gQuestLogCurActionIdx; i++)
    {
        if (gQuestLogRecordingPointer == NULL)
            return FALSE;
        switch (actions[i].type)
        {
        case QL_ACTION_MOVEMENT:
        case QL_ACTION_GFX_CHANGE:
            gQuestLogRecordingPointer = QL_RecordAction_MovementOrGfxChange(gQuestLogRecordingPointer, &actions[i]);
            break;
        default:
            gQuestLogRecordingPointer = QL_RecordAction_Input(gQuestLogRecordingPointer, &actions[i]);
            break;
        }
        if (gQuestLogRecordingPointer == NULL)
        {
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_STOPPED;
            return FALSE;
        }
    }

    if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_STOPPED)
    {
        gQuestLogRecordingPointer = QL_RecordAction_SceneEnd(gQuestLogRecordingPointer);
        return FALSE;
    }
    sRecordSequenceStartIdx = gQuestLogCurActionIdx;
    return TRUE;
}

void TryStartQuestLogPlayback(u8 taskId)
{
    u8 i;

    QL_EnableRecordingSteps();
    sNumScenes = 0;
    for (i = 0; i < QUEST_LOG_SCENE_COUNT; i++)
    {
        if (gSaveBlock1Ptr->questLog[i].startType != 0)
            sNumScenes++;
    }

    if (sNumScenes != 0)
    {
        gHelpSystemEnabled = FALSE;
        Task_BeginQuestLogPlayback(taskId);
        DestroyTask(taskId);
    }
    else
    {
        SetMainCallback2(CB2_ContinueSavedGame);
        DestroyTask(taskId);
    }
}

static void Task_BeginQuestLogPlayback(u8 taskId)
{
    gSaveBlock1Ptr->location.mapGroup = MAP_GROUP(ROUTE1);
    gSaveBlock1Ptr->location.mapNum =  MAP_NUM(ROUTE1);
    gSaveBlock1Ptr->location.warpId = WARP_ID_NONE;
    sCurrentSceneNum = 0;
    gDisableMapMusicChangeOnMapLoad = 1;
    DisableWildEncounters(TRUE);
    QLPlayback_InitOverworldState();
}

void QL_InitSceneObjectsAndActions(void)
{
    ReadQuestLogScriptFromSav1(sCurrentSceneNum, sQuestLogActionRecordBuffer);
    QL_ResetRepeatEventTracker();
    ResetActions(QL_PLAYBACK_STATE_RUNNING, sQuestLogActionRecordBuffer, sizeof(sQuestLogActionRecordBuffer));
    QL_LoadObjectsAndTemplates(sCurrentSceneNum);
}

static bool8 FieldCB2_QuestLogStartPlaybackWithWarpExit(void)
{
    LoadPalette(GetTextWindowPalette(4), BG_PLTT_ID(15), PLTT_SIZE_4BPP);
    SetQuestLogState(QL_STATE_PLAYBACK);
    FieldCB_DefaultWarpExit();
    sPlaybackControl = (struct PlaybackControl){};
    sPlaybackControl.state = 2;
    return 1;
}

static bool8 FieldCB2_QuestLogStartPlaybackStandingInPlace(void)
{
    LoadPalette(GetTextWindowPalette(4), BG_PLTT_ID(15), PLTT_SIZE_4BPP);
    SetQuestLogState(QL_STATE_PLAYBACK);
    FieldCB_WarpExitFadeFromBlack();
    sPlaybackControl = (struct PlaybackControl){};
    sPlaybackControl.state = 2;
    return 1;
}

void DrawPreviouslyOnQuestHeader(u8 sceneNum)
{
    u8 i;

    for (i = 0; i < WIN_COUNT; i++)
    {
        sWindowIds[i] = AddWindow(&sWindowTemplates[i]);
        FillWindowPixelRect(sWindowIds[i], 15, 0, 0, sWindowTemplates[i].width * 8, sWindowTemplates[i].height * 8);
    }

    StringExpandPlaceholders(gStringVar4, gText_QuestLog_PreviouslyOnYourQuest);

    // Scene numbers count from 4 to 0, 0 being where the player saved
    if (sceneNum != 0)
    {
        ConvertIntToDecimalStringN(gStringVar1, sceneNum, STR_CONV_MODE_LEFT_ALIGN, 1);
        StringAppend(gStringVar4, gStringVar1);
    }

    AddTextPrinterParameterized4(sWindowIds[WIN_TOP_BAR], FONT_NORMAL, 2, 2, 1, 2, sTextColors, 0, gStringVar4);
    PutWindowTilemap(sWindowIds[WIN_TOP_BAR]);
    PutWindowTilemap(sWindowIds[WIN_BOTTOM_BAR]);
    CopyWindowToVram(sWindowIds[WIN_TOP_BAR], COPYWIN_GFX);
    CopyWindowToVram(sWindowIds[WIN_DESCRIPTION], COPYWIN_GFX);
    CopyWindowToVram(sWindowIds[WIN_BOTTOM_BAR], COPYWIN_FULL);
}

void CommitQuestLogWindow1(void)
{
    PutWindowTilemap(sWindowIds[WIN_BOTTOM_BAR]);
    CopyWindowToVram(sWindowIds[WIN_BOTTOM_BAR], COPYWIN_MAP);
}

static void QL_LoadObjectsAndTemplates(u8 sceneNum)
{
    struct QuestLogScene *questLog = &gSaveBlock1Ptr->questLog[sceneNum];
    u16 i;
    
    for (i = 0; i < OBJECT_EVENT_TEMPLATES_COUNT; i++)
    {
        if (questLog->objectEventTemplates[i].negx)
            gSaveBlock1Ptr->objectEventTemplates[i].x = -questLog->objectEventTemplates[i].x;
        else
            gSaveBlock1Ptr->objectEventTemplates[i].x = questLog->objectEventTemplates[i].x;
        if (questLog->objectEventTemplates[i].negy)
            gSaveBlock1Ptr->objectEventTemplates[i].y = -(u8)questLog->objectEventTemplates[i].y;
        else
            gSaveBlock1Ptr->objectEventTemplates[i].y = questLog->objectEventTemplates[i].y;
        gSaveBlock1Ptr->objectEventTemplates[i].objUnion.normal.elevation = questLog->objectEventTemplates[i].elevation;
        gSaveBlock1Ptr->objectEventTemplates[i].objUnion.normal.movementType = questLog->objectEventTemplates[i].movementType;
    }

    QL_LoadObjects(questLog, gSaveBlock1Ptr->objectEventTemplates);
}

static void QLPlayback_SetInitialPlayerPosition(u8 sceneNum, bool8 isWarp)
{
    if (!isWarp)
    {
        gSaveBlock1Ptr->location.mapGroup = gSaveBlock1Ptr->questLog[sceneNum].mapGroup;
        gSaveBlock1Ptr->location.mapNum = gSaveBlock1Ptr->questLog[sceneNum].mapNum;
        gSaveBlock1Ptr->location.warpId = gSaveBlock1Ptr->questLog[sceneNum].warpId;
        gSaveBlock1Ptr->pos.x = gSaveBlock1Ptr->questLog[sceneNum].x;
        gSaveBlock1Ptr->pos.y = gSaveBlock1Ptr->questLog[sceneNum].y;
    }
    else
    {
        struct WarpData warp;
        warp.mapGroup = gSaveBlock1Ptr->questLog[sceneNum].mapGroup;
        warp.mapNum = gSaveBlock1Ptr->questLog[sceneNum].mapNum;
        warp.warpId = gSaveBlock1Ptr->questLog[sceneNum].warpId;
        warp.x = gSaveBlock1Ptr->questLog[sceneNum].x;
        warp.y = gSaveBlock1Ptr->questLog[sceneNum].y;
        Overworld_SetWarpDestinationFromWarp(&warp);
    }
}

static void QLPlayback_InitOverworldState(void)
{
    gQuestLogState = QL_STATE_PLAYBACK;
    ResetSpecialVars();
    ClearBag();
    ClearPCItemSlots();
    if (GetQuestLogStartType() == QL_START_NORMAL)
    {
        QLPlayback_SetInitialPlayerPosition(sCurrentSceneNum, FALSE);
        gFieldCallback2 = FieldCB2_QuestLogStartPlaybackStandingInPlace;
        SetMainCallback2(CB2_SetUpOverworldForQLPlayback);
    }
    else
    {
        QLPlayback_SetInitialPlayerPosition(sCurrentSceneNum, TRUE);
        WarpIntoMap();
        gFieldCallback2 = FieldCB2_QuestLogStartPlaybackWithWarpExit;
        SetMainCallback2(CB2_SetUpOverworldForQLPlaybackWithWarpExit);
    }
}

void QL_CopySaveState(void)
{
    struct QuestLogScene * questLog = &gSaveBlock1Ptr->questLog[sCurrentSceneNum];

    CpuCopy16(questLog->flags, gSaveBlock1Ptr->flags, sizeof(gSaveBlock1Ptr->flags));
    CpuCopy16(questLog->vars, gSaveBlock1Ptr->vars, sizeof(gSaveBlock1Ptr->vars));
    RestoreTrainerRematches();
}

// The number of bits allocated to store the number of pokemon in the PC
#define NUM_PC_COUNT_BITS  12

void QL_ResetPartyAndPC(void)
{
    struct {
        struct Pokemon mon;
        u16 partyCount;
        u16 boxMonCount;
    } *prev = AllocZeroed(sizeof(*prev));
    u16 packedCounts, i, count, j;

    CreateMon(&prev->mon, SPECIES_RATTATA, 1, USE_RANDOM_IVS, FALSE, 0, OT_ID_PLAYER_ID, 0);
    packedCounts = VarGet(VAR_QUEST_LOG_MON_COUNTS);
    prev->partyCount = packedCounts >> NUM_PC_COUNT_BITS;
    prev->boxMonCount = packedCounts % (1 << NUM_PC_COUNT_BITS);

    count = QuestLog_GetPartyCount();
    if (count > prev->partyCount)
    {
        for (i = 0; i < count - prev->partyCount; i++)
            ZeroMonData(&gPlayerParty[PARTY_SIZE - 1 - i]);
    }
    else if (count < prev->partyCount)
    {
        // Clear 5 slots in the PC?
        for (i = 0; i < PARTY_SIZE - 1; i++)
            ZeroBoxMonAt(0, i);

        // Replace the additional slots with placeholder Pokémon.
        for (i = count; i < prev->partyCount; i++)
            CopyMon(&gPlayerParty[i], &prev->mon, sizeof(struct Pokemon));
    }

    count = QuestLog_GetBoxMonCount();
    if (count > prev->boxMonCount)
    {
        for (i = 0; i < TOTAL_BOXES_COUNT; i++)
        {
            for (j = 0; j < IN_BOX_COUNT; j++)
            {
                if (GetBoxMonDataAt(i, j, MON_DATA_SANITY_HAS_SPECIES))
                {
                    ZeroBoxMonAt(i, j);
                    if (--count == prev->boxMonCount)
                        break;
                }
            }
            if (count == prev->boxMonCount)
                break;
        }
    }
    else if (count < prev->boxMonCount)
    {
        for (i = 0; i < TOTAL_BOXES_COUNT; i++)
        {
            for (j = 0; j < IN_BOX_COUNT; j++)
            {
                struct BoxPokemon * boxMon = GetBoxedMonPtr(i, j);
                if (!GetBoxMonData(boxMon, MON_DATA_SANITY_HAS_SPECIES))
                {
                    // Replace the additional slots with placeholder Pokémon.
                    CopyMon(boxMon, &prev->mon.box, sizeof(struct BoxPokemon));
                    if (++count == prev->boxMonCount)
                        break;
                }
            }
            if (count == prev->boxMonCount)
                break;
        }
    }
    Free(prev);
}

static void SetPokemonCounts(void)
{
    u16 partyCount = QuestLog_GetPartyCount();
    u16 boxesCount = QuestLog_GetBoxMonCount();
    VarSet(VAR_QUEST_LOG_MON_COUNTS, (partyCount << NUM_PC_COUNT_BITS) + boxesCount);
}

static u16 QuestLog_GetPartyCount(void)
{
    u16 count = 0;
    u16 i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SANITY_HAS_SPECIES))
            count++;
    }

    return count;
}

static u16 QuestLog_GetBoxMonCount(void)
{
    u16 count = 0;
    u16 i, j;

    for (i = 0; i < TOTAL_BOXES_COUNT; i++)
    {
        for (j = 0; j < IN_BOX_COUNT; j++)
        {
            if (GetBoxMonDataAt(i, j, MON_DATA_SANITY_HAS_SPECIES))
                count++;
        }
    }

    return count;
}

// Inverse of BackUpTrainerRematches
static void RestoreTrainerRematches(void)
{
    u16 i, j;
    u16 vars[4];

    for (i = 0; i < ARRAY_COUNT(vars); i++)
    {
        vars[i] = VarGet(VAR_QLBAK_TRAINER_REMATCHES + i);

        // 16 bits per var
        for (j = 0; j < 16; j++)
        {
            if (vars[i] & 1)
                gSaveBlock1Ptr->trainerRematches[16 * i + j] = 30;
            else
                gSaveBlock1Ptr->trainerRematches[16 * i + j] = 0;
            vars[i] >>= 1;
        }
    }
}

// Inverse of BackUpMapLayout
void QL_RestoreMapLayoutId(void)
{
    gSaveBlock1Ptr->mapLayoutId = VarGet(VAR_QLBAK_MAP_LAYOUT);
    if (gSaveBlock1Ptr->mapLayoutId == 0)
    {
        struct MapHeader header = *Overworld_GetMapHeaderByGroupAndId(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum);
        gSaveBlock1Ptr->mapLayoutId = header.mapLayoutId;
    }
}

static void ReadQuestLogScriptFromSav1(u8 sceneNum, struct QuestLogAction * actions)
{
    u16 i;
    u16 *script;
    u16 actionNum = 0;
    u16 eventNum = 0;

    memset(actions, 0, ARRAY_COUNT(sEventData) * sizeof(struct QuestLogAction));
    for (i = 0; i < ARRAY_COUNT(sEventData); i++)
        sEventData[i] = NULL;

    script = gSaveBlock1Ptr->questLog[sceneNum].script;
    for (i = 0; i < ARRAY_COUNT(sEventData); i++)
    {
        switch (script[0] & QL_CMD_EVENT_MASK)
        {
        case QL_EVENT_INPUT:
            script = QL_LoadAction_Input(script, &actions[actionNum]);
            actionNum++;
            break;
        case QL_EVENT_GFX_CHANGE:
        case QL_EVENT_MOVEMENT:
            script = QL_LoadAction_MovementOrGfxChange(script, &actions[actionNum]);
            actionNum++;
            break;
        case QL_EVENT_SCENE_END:
            script = QL_LoadAction_SceneEnd(script, &actions[actionNum]);
            actionNum++;
            break;
        case QL_EVENT_WAIT:
            script = QL_LoadAction_Wait(script, &actions[actionNum]);
            actionNum++;
            break;
        default: // Normal event
            script = QL_SkipCommand(script, &sEventData[eventNum]);
            if (eventNum == 0)
                QL_UpdateLastDepartedLocation(sEventData[0]);
            eventNum++;
            break;
        }
        if (script == NULL)
            break;
    }
}

static void DoSceneEndTransition(s8 delay)
{
    FadeScreen(FADE_TO_BLACK, delay);
    sQuestLogCB = QuestLog_AdvancePlayhead;
}

static void QuestLog_AdvancePlayhead(void)
{
    if (gPaletteFade.active)
        return;

    LockPlayerFieldControls();
    if (++sCurrentSceneNum < QUEST_LOG_SCENE_COUNT && gSaveBlock1Ptr->questLog[sCurrentSceneNum].startType != 0)
    {
        sNumScenes--;
        QLPlayback_InitOverworldState();
    }
    else
    {
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_STOPPED;
        QuestLog_StartFinalScene();
    }
}

static void QuestLog_StartFinalScene(void)
{
    ResetSpecialVars();
    Save_ResetSaveCounters();
    LoadGameSave(SAVE_NORMAL);
    SetMainCallback2(CB2_EnterFieldFromQuestLog);
    gFieldCallback2 = FieldCB2_FinalScene;
    FreeAllWindowBuffers();
    gQuestLogState = QL_STATE_PLAYBACK_LAST;
    sQuestLogCB = NULL;
}

void QuestLog_AdvancePlayhead_(void)
{
    QuestLog_AdvancePlayhead();
}

#define tTimer data[0]
#define tState data[1]
#define DATA_IDX_CALLBACK 14 // data[14] and data[15]

// This is used to avoid recording or displaying certain windows or images, like a shop menu.
// During playback it returns TRUE (meaning the action should be avoided) and calls the
// provided callback, which would be used to e.g. destroy any resources that were set up to do
// whatever is being avoided. In all cases the provided callback will be QL_DestroyAbortedDisplay.
// If we are not currently in playback return FALSE (meaning allow the action to occur) and
// stop recording (if we are currently).
bool8 QL_AvoidDisplay(void (*callback)(void))
{
    u8 taskId;

    switch (gQuestLogState)
    {
    case QL_STATE_RECORDING:
        QuestLog_CutRecording();
        break;
    case QL_STATE_PLAYBACK:
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_ACTION_END;
        taskId = CreateTask(Task_AvoidDisplay, 80);
        gTasks[taskId].tTimer = 0;
        gTasks[taskId].tState = 0;
        SetWordTaskArg(taskId, DATA_IDX_CALLBACK, (uintptr_t)callback);
        return TRUE;
    }
    return FALSE;
}

static void Task_AvoidDisplay(u8 taskId)
{
    void (*routine)(void);
    s16 *data = gTasks[taskId].data;

    switch (tState)
    {
    case 0:
        // Instead of displaying anything, wait and then end the scene.
        if (++tTimer == 127)
        {
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, 0);
            sPlaybackControl.endMode = END_MODE_SCENE;
            tState++;
        }
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_STOPPED;
            
            // Call the provided function (if any). In practice this is always QL_DestroyAbortedDisplay
            routine = (void (*)(void)) GetWordTaskArg(taskId, DATA_IDX_CALLBACK);
            if (routine != NULL)
                routine();

            DestroyTask(taskId);
            sQuestLogCB = QuestLog_AdvancePlayhead;
        }
        break;
    }
}

#undef tTimer
#undef tState

static void QuestLog_PlayCurrentEvent(void)
{
    if (sPlaybackControl.state == 1)
    {
        if (--sPlaybackControl.timer != 0)
            return;
        sPlaybackControl.state = 0;
        sPlaybackControl.playingEvent = TRUE;
        TogglePlaybackStateForOverworldLock(2);
    }

    if (sPlaybackControl.playingEvent == TRUE)
    {
        if (++sPlaybackControl.overlapTimer > 15)
        {
            QuestLog_CloseTextWindow();
            sPlaybackControl.playingEvent = FALSE;
            sPlaybackControl.overlapTimer = 0;
        }
    }
    if (sPlaybackControl.cursor < ARRAY_COUNT(sEventData))
    {
        if (QL_TryRepeatEvent(sEventData[sPlaybackControl.cursor]) == TRUE)
            HandleShowQuestLogMessage();
        else if (QL_LoadEvent(sEventData[sPlaybackControl.cursor]) == TRUE)
            HandleShowQuestLogMessage();
    }
}

static void HandleShowQuestLogMessage(void)
{
    if (sPlaybackControl.state == 0)
    {
        sPlaybackControl.state = 1;
        sPlaybackControl.playingEvent = FALSE;
        sPlaybackControl.overlapTimer = 0;
        sPlaybackControl.timer = GetQuestLogTextDisplayDuration();
        if (gQuestLogRepeatEventTracker.counter == 0)
            sPlaybackControl.cursor++;
        if (sPlaybackControl.cursor > ARRAY_COUNT(sEventData))
            return;
        DrawSceneDescription();
    }
    TogglePlaybackStateForOverworldLock(1); // lock
}

static u8 GetQuestLogTextDisplayDuration(void)
{
    u16 i;
    u16 count = 0;

    for (i = 0; i < 0x400 && gStringVar4[i] != EOS; i++)
    {
        if (gStringVar4[i] != CHAR_NEWLINE)
            count++;
    }

    if (count < 20)
        return 0x5F;
    if (count < 36)
        return 0x7F;
    if (count < 46)
        return 0xBF;
    return 0xFF;
}

bool8 QL_IsTrainerSightDisabled(void)
{
    if (gQuestLogState != QL_STATE_PLAYBACK)
        return FALSE;
    if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_STOPPED || sPlaybackControl.state == 1 || sPlaybackControl.state == 2)
        return TRUE;
    return FALSE;
}

void QL_HandleInput(void)
{
    // Ignore input if we're currently ending a scene/playback
    if (sPlaybackControl.endMode != END_MODE_NONE)
        return;

    if (JOY_NEW(A_BUTTON))
    {
        // Pressed A, skip to next scene
        sPlaybackControl.endMode = END_MODE_SCENE;
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_STOPPED;
        DoSceneEndTransition(-3);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        // Pressed B, end playback
        sPlaybackControl.endMode = END_MODE_FINISH;
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_STOPPED;
        DoSkipToEndTransition(-3);
    }
}

bool8 QuestLogScenePlaybackIsEnding(void)
{
    if (sPlaybackControl.endMode != END_MODE_NONE)
        return TRUE;
    return FALSE;
}

void QuestLog_DrawPreviouslyOnQuestHeaderIfInPlaybackMode(void)
{
    if (gQuestLogState == QL_STATE_PLAYBACK)
        DrawPreviouslyOnQuestHeader(sNumScenes);
}

static void DrawSceneDescription(void)
{
    u16 i;
    u8 numLines = 0;

    for (i = 0; i < 0x100 && gStringVar4[i] != EOS; i++)
    {
        if (gStringVar4[i] == CHAR_NEWLINE)
            numLines++;
    }

    PutWindowTilemap(sWindowIds[WIN_DESCRIPTION]);
    CopyDescriptionWindowTiles(sWindowIds[WIN_DESCRIPTION]);
    AddTextPrinterParameterized4(sWindowIds[WIN_DESCRIPTION], FONT_NORMAL, 2, sQuestLogTextLineYCoords[numLines], 1, 0, sTextColors, 0, gStringVar4);
    ScheduleBgCopyTilemapToVram(0);
}

static void CopyDescriptionWindowTiles(u8 windowId)
{
    const u16 *src = sDescriptionWindow_Gfx;
    u16 *buffer = Alloc(DESC_WIN_SIZE);
    u8 i, j, y;

    if (buffer)
    {
        for (i = 0; i < DESC_WIN_HEIGHT; i++)
        {
            switch (i)
            {
            default:
                // Middle tile
                y = 1;
                break;
            case 0:
                // Top edge tile
                y = 0;
                break;
            case DESC_WIN_HEIGHT - 1:
                // Bottom edge tile
                y = 2;
                break;
            }

            for (j = 0; j < DESC_WIN_WIDTH; j++)
                CpuCopy32(src + 16 * y, buffer + 16 * (2 * (15 * i) + j), TILE_SIZE_4BPP);
        }

        CopyToWindowPixelBuffer(windowId, (const u8 *)buffer, DESC_WIN_SIZE, 0);
        Free(buffer);
    }
}

static void QuestLog_CloseTextWindow(void)
{
    ClearWindowTilemap(sWindowIds[WIN_DESCRIPTION]);
    FillWindowPixelRect(sWindowIds[WIN_DESCRIPTION], 15, 0, 0, 0xf0, 0x30);
    CopyWindowToVram(sWindowIds[WIN_DESCRIPTION], COPYWIN_GFX);
    PutWindowTilemap(sWindowIds[WIN_BOTTOM_BAR]);
    CopyWindowToVram(sWindowIds[WIN_BOTTOM_BAR], COPYWIN_MAP);
}

static void DoSkipToEndTransition(s8 delay)
{
    FadeScreen(FADE_TO_BLACK, delay);
    sQuestLogCB = QuestLog_WaitFadeAndCancelPlayback;
}

static void QuestLog_WaitFadeAndCancelPlayback(void)
{
    if (!gPaletteFade.active)
    {
        LockPlayerFieldControls();
        for (sCurrentSceneNum = sCurrentSceneNum; sCurrentSceneNum < QUEST_LOG_SCENE_COUNT; sCurrentSceneNum++)
        {
            if (gSaveBlock1Ptr->questLog[sCurrentSceneNum].startType == 0)
                break;
            ReadQuestLogScriptFromSav1(sCurrentSceneNum, sQuestLogActionRecordBuffer);
        }
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_STOPPED;
        QuestLog_StartFinalScene();
    }
}

void QuestLog_InitPalettesBackup(void)
{
    if (gQuestLogState == QL_STATE_PLAYBACK_LAST)
        sPalettesBackup = AllocZeroed(PLTT_SIZE);
}

void QuestLog_BackUpPalette(u16 offset, u16 size)
{
    CpuCopy16(&gPlttBufferUnfaded[offset], &sPalettesBackup[offset], PLTT_SIZEOF(size));
}

static bool8 FieldCB2_FinalScene(void)
{
    LoadPalette(GetTextWindowPalette(4), BG_PLTT_ID(15), PLTT_SIZE_4BPP);
    DrawPreviouslyOnQuestHeader(0);
    FieldCB_WarpExitFadeFromBlack();
    CreateTask(Task_FinalScene_WaitFade, 0xFF);
    return TRUE;
}

static void Task_FinalScene_WaitFade(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (ArePlayerFieldControlsLocked() != TRUE)
    {
        FreezeObjectEvents();
        HandleEnforcedLookDirectionOnPlayerStopMoving();
        StopPlayerAvatar();
        LockPlayerFieldControls();
        task->func = Task_QuestLogScene_SavedGame;
    }
}

static void Task_QuestLogScene_SavedGame(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (!gPaletteFade.active)
    {
        if (sPlaybackControl.endMode != END_MODE_FINISH)
        {
            GetMapNameGeneric(gStringVar1, gMapHeader.regionMapSectionId);
            StringExpandPlaceholders(gStringVar4, gText_QuestLog_SavedGameAtLocation);
            DrawSceneDescription();
        }
        task->data[0] = 0;
        task->data[1] = 0;
        task->func = Task_WaitAtEndOfQuestLog;
        FreezeObjectEvents();
        LockPlayerFieldControls();
    }
}

#define tTimer data[0]

static void Task_WaitAtEndOfQuestLog(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (JOY_NEW(A_BUTTON | B_BUTTON) || task->tTimer >= 127 || sPlaybackControl.endMode == END_MODE_FINISH)
    {
        QuestLog_CloseTextWindow();
        task->tTimer = 0;
        task->func = Task_EndQuestLog;
        gQuestLogState = 0;
    }
    else
        task->tTimer++;
}

#undef tTimer

#define tState data[0]
#define tTimer data[1]

static void Task_EndQuestLog(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u8 i;

    switch (tState)
    {
    case 0:
        gDisableMapMusicChangeOnMapLoad = 0;
        Overworld_PlaySpecialMapMusic();
        QL_SlightlyDarkenSomePals();
        FillWindowPixelRect(sWindowIds[WIN_TOP_BAR],
                            0xF, 0, 0,
                            sWindowTemplates[WIN_TOP_BAR].width * 8,
                            sWindowTemplates[WIN_TOP_BAR].height * 8);
        tState++;
        break;
    case 1:
        if (RestoreScreenAfterPlayback(taskId))
        {
            for (i = 0; i < WIN_COUNT; i++)
            {
                ClearWindowTilemap(sWindowIds[i]);
                CopyWindowToVram(sWindowIds[i], COPYWIN_MAP);
                RemoveWindow(sWindowIds[i]);
            }
            tTimer = 0;
            tState++;
        }
        break;
    case 2:
        if (tTimer < 32)
            tTimer++;
        else
            tState++;
        break;
    default:
        if (sPlaybackControl.endMode == END_MODE_FINISH)
            ShowMapNamePopup(TRUE);
        CpuCopy16(sPalettesBackup, gPlttBufferUnfaded, PLTT_SIZE);
        Free(sPalettesBackup);
        sPlaybackControl = (struct PlaybackControl){};
        ClearPlayerHeldMovementAndUnfreezeObjectEvents();
        UnlockPlayerFieldControls();
        gTextFlags.autoScroll = FALSE;
        gGlobalFieldTintMode = QL_TINT_NONE;
        DisableWildEncounters(FALSE);
        gHelpSystemEnabled = TRUE;
        DestroyTask(taskId);
        break;
    }
}

#undef tState
#undef tTimer

#define tTimer data[1]

// Scroll the top and bottom windows offscreen and restore the screen tint to the original color.
static bool8 RestoreScreenAfterPlayback(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (tTimer > 15)
        return TRUE;

    CopyPaletteInvertedTint(&gPlttBufferUnfaded[BG_PLTT_ID(0) + 1], &gPlttBufferFaded[BG_PLTT_ID(0) + 1], 0xDF, 15 - tTimer);
    CopyPaletteInvertedTint(&gPlttBufferUnfaded[OBJ_PLTT_ID(0)], &gPlttBufferFaded[OBJ_PLTT_ID(0)], 0x100, 15 - tTimer);
    FillWindowPixelRect(sWindowIds[WIN_TOP_BAR],
                        0x00, 0,
                        sWindowTemplates[WIN_TOP_BAR].height * 8 - 1 - tTimer,
                        sWindowTemplates[WIN_TOP_BAR].width * 8, 1);
    FillWindowPixelRect(sWindowIds[WIN_BOTTOM_BAR],
                        0x00, 0,
                        data[1],
                        sWindowTemplates[WIN_BOTTOM_BAR].width * 8, 1);
    CopyWindowToVram(sWindowIds[WIN_TOP_BAR], COPYWIN_GFX);
    CopyWindowToVram(sWindowIds[WIN_BOTTOM_BAR], COPYWIN_GFX);
    tTimer++;
    return FALSE;
}

static void QL_SlightlyDarkenSomePals(void)
{
    u16 *buffer = Alloc(PLTT_SIZE);
    CpuCopy16(sPalettesBackup, buffer, PLTT_SIZE);
    SlightlyDarkenPalsInWeather(sPalettesBackup, sPalettesBackup, 13 * 16);
    SlightlyDarkenPalsInWeather(&sPalettesBackup[OBJ_PLTT_ID(1)], &sPalettesBackup[OBJ_PLTT_ID(1)], 1 * 16);
    SlightlyDarkenPalsInWeather(&sPalettesBackup[OBJ_PLTT_ID(6)], &sPalettesBackup[OBJ_PLTT_ID(6)], 4 * 16);
    SlightlyDarkenPalsInWeather(&sPalettesBackup[OBJ_PLTT_ID(11)], &sPalettesBackup[OBJ_PLTT_ID(11)], 5 * 16);
    CpuCopy16(sPalettesBackup, gPlttBufferUnfaded, PLTT_SIZE);
    CpuCopy16(buffer, sPalettesBackup, PLTT_SIZE);
    Free(buffer);
}

void QL_FinishRecordingScene(void)
{
    if (gQuestLogState == QL_STATE_RECORDING)
    {
        TryRecordActionSequence(sQuestLogActionRecordBuffer);
        RecordSceneEnd();
        gQuestLogState = 0;
        sQuestLogCB = NULL;
        gQuestLogDefeatedWildMonRecord = NULL;
        gQuestLogRecordingPointer = NULL;
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_STOPPED;
    }
}

void QuestLog_CutRecording(void)
{
    if (gQuestLogPlaybackState != QL_PLAYBACK_STATE_STOPPED && gQuestLogState == QL_STATE_RECORDING)
    {
        TryRecordActionSequence(sQuestLogActionRecordBuffer);
        QL_RecordWait(1);
        RecordSceneEnd();
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_STOPPED;
        gQuestLogState = 0;
        sQuestLogCB = NULL;
    }
    gQuestLogDefeatedWildMonRecord = NULL;
    gQuestLogRecordingPointer = NULL;
}

static void SortQuestLogInSav1(void)
{
    struct QuestLogScene * buffer = AllocZeroed(sizeof(gSaveBlock1Ptr->questLog));
    u8 i;
    u8 sceneNum = sCurrentSceneNum;
    u8 count = 0;
    for (i = 0; i < QUEST_LOG_SCENE_COUNT; i++)
    {
        if (sceneNum >= QUEST_LOG_SCENE_COUNT)
            sceneNum = 0;
        if (gSaveBlock1Ptr->questLog[sceneNum].startType != 0)
        {
            buffer[count] = gSaveBlock1Ptr->questLog[sceneNum];
            count++;
        }
        sceneNum++;
    }
    sCurrentSceneNum = count % QUEST_LOG_SCENE_COUNT;
    CpuCopy16(buffer, gSaveBlock1Ptr->questLog, sizeof(gSaveBlock1Ptr->questLog));
    Free(buffer);
}

void SaveQuestLogData(void)
{
    if (MenuHelpers_IsLinkActive() != TRUE)
    {
        QuestLog_CutRecording();
        SortQuestLogInSav1();
    }
}

void QL_UpdateObject(struct Sprite *sprite)
{
    struct ObjectEvent *objectEvent = &gObjectEvents[sprite->data[0]];
    if (objectEvent->localId == OBJ_EVENT_ID_PLAYER)
    {
        if (sMovementScripts[0][0] != MOVEMENT_ACTION_NONE)
        {
            ObjectEventSetHeldMovement(objectEvent, sMovementScripts[0][0]);
            sMovementScripts[0][0] = MOVEMENT_ACTION_NONE;
        }
        if (sMovementScripts[0][1] != QL_PLAYER_GFX_NONE)
        {
            QuestLogUpdatePlayerSprite(sMovementScripts[0][1]);
            sMovementScripts[0][1] = QL_PLAYER_GFX_NONE;
        }
        QL_UpdateObjectEventCurrentMovement(objectEvent, sprite);
    }
    else
    {
        if (sMovementScripts[objectEvent->localId][0] != MOVEMENT_ACTION_NONE)
        {
            ObjectEventSetHeldMovement(objectEvent, sMovementScripts[objectEvent->localId][0]);
            sMovementScripts[objectEvent->localId][0] = MOVEMENT_ACTION_NONE;
        }
        QL_UpdateObjectEventCurrentMovement(objectEvent, sprite);
    }
}

void QuestLogRecordNPCStep(u8 localId, u8 mapNum, u8 mapGroup, u8 movementActionId)
{
    if (!RecordHeadAtEndOfEntryOrScriptContext2Enabled())
    {
        sCurSceneActions[gQuestLogCurActionIdx].duration = sNextActionDelay;
        sCurSceneActions[gQuestLogCurActionIdx].type = QL_ACTION_MOVEMENT;
        sCurSceneActions[gQuestLogCurActionIdx].data.a.localId = localId;
        sCurSceneActions[gQuestLogCurActionIdx].data.a.mapNum = mapNum;
        sCurSceneActions[gQuestLogCurActionIdx].data.a.mapGroup = mapGroup;
        sCurSceneActions[gQuestLogCurActionIdx].data.a.movementActionId = movementActionId;
        gQuestLogCurActionIdx++;
        sNextActionDelay = 0;
    }
}

void QuestLogRecordNPCStepWithDuration(u8 localId, u8 mapNum, u8 mapGroup, u8 movementActionId, u8 duration)
{
    if (!RecordHeadAtEndOfEntry())
    {
        sCurSceneActions[gQuestLogCurActionIdx].duration = sNextActionDelay;
        sCurSceneActions[gQuestLogCurActionIdx].type = QL_ACTION_MOVEMENT;
        sCurSceneActions[gQuestLogCurActionIdx].data.a.localId = localId;
        sCurSceneActions[gQuestLogCurActionIdx].data.a.mapNum = mapNum;
        sCurSceneActions[gQuestLogCurActionIdx].data.a.mapGroup = mapGroup;
        sCurSceneActions[gQuestLogCurActionIdx].data.a.movementActionId = movementActionId;
        gQuestLogCurActionIdx++;
        sNextActionDelay = duration;
    }
}

void QuestLogRecordPlayerStep(u8 movementActionId)
{
    if (!RecordHeadAtEndOfEntryOrScriptContext2Enabled())
    {
        if (movementActionId != sCurSceneActions[sLastQuestLogCursor].data.a.movementActionId || movementActionId > MOVEMENT_ACTION_FACE_RIGHT)
        {
            sCurSceneActions[gQuestLogCurActionIdx].duration = sNextActionDelay;
            sCurSceneActions[gQuestLogCurActionIdx].type = QL_ACTION_MOVEMENT;
            sCurSceneActions[gQuestLogCurActionIdx].data.a.localId = 0;
            sCurSceneActions[gQuestLogCurActionIdx].data.a.movementActionId = movementActionId;
            sLastQuestLogCursor = gQuestLogCurActionIdx;
            gQuestLogCurActionIdx++;
            sNextActionDelay = 0;
        }
    }
}

void QuestLogRecordPlayerStepWithDuration(u8 movementActionId, u8 duration)
{
    if (!RecordHeadAtEndOfEntry())
    {
        sCurSceneActions[gQuestLogCurActionIdx].duration = sNextActionDelay;
        sCurSceneActions[gQuestLogCurActionIdx].type = QL_ACTION_MOVEMENT;
        sCurSceneActions[gQuestLogCurActionIdx].data.a.localId = 0;
        sCurSceneActions[gQuestLogCurActionIdx].data.a.movementActionId = movementActionId;
        sLastQuestLogCursor = gQuestLogCurActionIdx;
        gQuestLogCurActionIdx++;
        sNextActionDelay = duration;
    }
}

void QuestLogRecordPlayerAvatarGfxTransition(u8 gfxState)
{
    if (!RecordHeadAtEndOfEntry())
    {
        sCurSceneActions[gQuestLogCurActionIdx].duration = sNextActionDelay;
        sCurSceneActions[gQuestLogCurActionIdx].type = QL_ACTION_GFX_CHANGE;
        sCurSceneActions[gQuestLogCurActionIdx].data.b.localId = 0;
        sCurSceneActions[gQuestLogCurActionIdx].data.b.gfxState = gfxState;
        gQuestLogCurActionIdx++;
        sNextActionDelay = 0;
    }
}

void QuestLogRecordPlayerAvatarGfxTransitionWithDuration(u8 gfxState, u8 duration)
{
    if (!RecordHeadAtEndOfEntry())
    {
        sCurSceneActions[gQuestLogCurActionIdx].duration = sNextActionDelay;
        sCurSceneActions[gQuestLogCurActionIdx].type = QL_ACTION_GFX_CHANGE;
        sCurSceneActions[gQuestLogCurActionIdx].data.b.localId = 0;
        sCurSceneActions[gQuestLogCurActionIdx].data.b.gfxState = gfxState;
        gQuestLogCurActionIdx++;
        sNextActionDelay = duration;
    }
}

void QL_RecordFieldInput(struct FieldInput * fieldInput)
{
    if (gQuestLogCurActionIdx < sMaxActionsInScene)
    {
        // Retain only the following fields:
        // - pressedAButton
        // - checkStandardWildEncounter
        // - heldDirection
        // - heldDirection2
        // - tookStep
        // - pressedBButton
        // - dpadDirection
        u32 data = *(u32 *)fieldInput & 0x00FF00F3;
        sCurSceneActions[gQuestLogCurActionIdx].duration = sNextActionDelay;
        sCurSceneActions[gQuestLogCurActionIdx].type = QL_ACTION_INPUT;
        sCurSceneActions[gQuestLogCurActionIdx].data.fieldInput[0] = data;
        sCurSceneActions[gQuestLogCurActionIdx].data.fieldInput[1] = data >> 8; // always 0
        sCurSceneActions[gQuestLogCurActionIdx].data.fieldInput[2] = data >> 16;
        sCurSceneActions[gQuestLogCurActionIdx].data.fieldInput[3] = data >> 24; // always 0
        gQuestLogCurActionIdx++;
        if (ArePlayerFieldControlsLocked())
            sNextActionDelay = 1;
        else
            sNextActionDelay = 0;
    }
}

static void TogglePlaybackStateForOverworldLock(u8 a0)
{
    switch (a0)
    {
    case 1:
        if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_RUNNING)
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_ACTION_END; // Message visible, overworld locked
        break;
    case 2:
        if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_ACTION_END)
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_RUNNING; // Overworld unlocked
        break;
    }
}

void QuestLog_OnEscalatorWarp(u8 direction)
{
    u8 state = QL_GetPlaybackState();

    switch (direction)
    {
    case QL_ESCALATOR_OUT: // warp out
        if (state == QL_PLAYBACK_STATE_RUNNING)
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_ACTION_END;
        else if (state == QL_PLAYBACK_STATE_RECORDING)
        {
            sCurSceneActions[gQuestLogCurActionIdx].duration = sNextActionDelay;
            sCurSceneActions[gQuestLogCurActionIdx].type = QL_ACTION_EMPTY;
            gQuestLogCurActionIdx++;
            sNextActionDelay = 0;
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_RECORDING_NO_DELAY;
        }
        break;
    case QL_ESCALATOR_IN: // warp in
        if (state == QL_PLAYBACK_STATE_RUNNING)
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_RUNNING;
        else if (state == QL_PLAYBACK_STATE_RECORDING)
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_RECORDING;
        break;
    }
}

static void ResetActions(u8 kind, struct QuestLogAction *actions, u16 size)
{
    int i;

    switch (kind)
    {
    default:
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_STOPPED;
        break;
    case QL_PLAYBACK_STATE_RUNNING:
        sCurSceneActions = actions;
        sMaxActionsInScene = size / sizeof(*sCurSceneActions);
        for (i = 0; i < (s32)ARRAY_COUNT(sMovementScripts); i++)
        {
            sMovementScripts[i][0] |= MOVEMENT_ACTION_NONE;
            sMovementScripts[i][1] |= QL_PLAYER_GFX_NONE;
        }
        gQuestLogCurActionIdx = 0;
        sLastQuestLogCursor = 0;
        gQuestLogFieldInput = (struct FieldInput){};
        sNextActionDelay = sCurSceneActions[gQuestLogCurActionIdx].duration;
        sMovementScripts[0][0] = sCurSceneActions[gQuestLogCurActionIdx].data.a.movementActionId;
        sMovementScripts[0][1] = QL_PLAYER_GFX_NONE;
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_RUNNING;
        break;
    case QL_PLAYBACK_STATE_RECORDING:
        sCurSceneActions = actions;
        sMaxActionsInScene = size / sizeof(*sCurSceneActions);
        for (i = 0; i < sMaxActionsInScene; i++)
        {
            sCurSceneActions[i] = (struct QuestLogAction){
                .duration = 0xFFFF,
                .type = QL_ACTION_SCENE_END
            };
        }
        gQuestLogCurActionIdx = 0;
        sNextActionDelay = 0;
        sCurSceneActions[gQuestLogCurActionIdx].duration = 0;
        sCurSceneActions[gQuestLogCurActionIdx].type = QL_ACTION_MOVEMENT;
        sCurSceneActions[gQuestLogCurActionIdx].data.a.localId = 0;
        switch (GetPlayerFacingDirection())
        {
        case DIR_NONE:
        case DIR_SOUTH:
            sCurSceneActions[gQuestLogCurActionIdx].data.a.movementActionId = MOVEMENT_ACTION_FACE_DOWN;
            break;
        case DIR_EAST:
            sCurSceneActions[gQuestLogCurActionIdx].data.a.movementActionId = MOVEMENT_ACTION_FACE_RIGHT;
            break;
        case DIR_NORTH:
            sCurSceneActions[gQuestLogCurActionIdx].data.a.movementActionId = MOVEMENT_ACTION_FACE_UP;
            break;
        case DIR_WEST:
            sCurSceneActions[gQuestLogCurActionIdx].data.a.movementActionId = MOVEMENT_ACTION_FACE_LEFT;
            break;
        }
        sLastQuestLogCursor = 0;
        gQuestLogCurActionIdx++;
        sCurSceneActions[gQuestLogCurActionIdx].duration = 0;
        sCurSceneActions[gQuestLogCurActionIdx].type = QL_ACTION_INPUT;
        sCurSceneActions[gQuestLogCurActionIdx].data.fieldInput[0] = 0;
        sCurSceneActions[gQuestLogCurActionIdx].data.fieldInput[1] = 0;
        sCurSceneActions[gQuestLogCurActionIdx].data.fieldInput[2] = 0;
        sCurSceneActions[gQuestLogCurActionIdx].data.fieldInput[3] = 0;
        gQuestLogCurActionIdx++;
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_RECORDING;
        break;
    }
}

void QL_TryRunActions(void)
{
    switch (gQuestLogPlaybackState)
    {
    case QL_PLAYBACK_STATE_STOPPED:
    case QL_PLAYBACK_STATE_ACTION_END:
    case QL_PLAYBACK_STATE_RECORDING_NO_DELAY:
        break;
    case QL_PLAYBACK_STATE_RUNNING:
        if (!RecordHeadAtEndOfEntryOrScriptContext2Enabled())
        {
            if (sNextActionDelay != 0)
            {
                sNextActionDelay--;
            }
            else
            {
                do
                {
                    switch (sCurSceneActions[gQuestLogCurActionIdx].type)
                    {
                    case QL_ACTION_MOVEMENT:
                        // NPC movement action
                        sMovementScripts[sCurSceneActions[gQuestLogCurActionIdx].data.a.localId][0] = sCurSceneActions[gQuestLogCurActionIdx].data.a.movementActionId;
                        break;
                    case QL_ACTION_GFX_CHANGE:
                        // State transition
                        sMovementScripts[sCurSceneActions[gQuestLogCurActionIdx].data.b.localId][1] = sCurSceneActions[gQuestLogCurActionIdx].data.b.gfxState;
                        break;
                    case QL_ACTION_INPUT:
                        // Player input
                        *(u32 *)&gQuestLogFieldInput = ((sCurSceneActions[gQuestLogCurActionIdx].data.fieldInput[3] << 24)
                                                      | (sCurSceneActions[gQuestLogCurActionIdx].data.fieldInput[2] << 16)
                                                      | (sCurSceneActions[gQuestLogCurActionIdx].data.fieldInput[1] << 8)
                                                      | (sCurSceneActions[gQuestLogCurActionIdx].data.fieldInput[0] << 0));
                        break;
                    case QL_ACTION_EMPTY:
                        // End
                        gQuestLogPlaybackState = QL_PLAYBACK_STATE_ACTION_END;
                        break;
                    case QL_ACTION_WAIT:
                        // Nothing. The wait action uses sNextActionDelay to add a pause to playback.
                        // When the counter is finished and this is reached there's nothing else that needs to be done.
                        break;
                    case QL_ACTION_SCENE_END:
                        gQuestLogPlaybackState = QL_PLAYBACK_STATE_STOPPED;
                        break;
                    }

                    if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_STOPPED)
                        break;
                    if (++gQuestLogCurActionIdx >= sMaxActionsInScene)
                    {
                        gQuestLogPlaybackState = QL_PLAYBACK_STATE_STOPPED;
                        break;
                    }
                    sNextActionDelay = sCurSceneActions[gQuestLogCurActionIdx].duration;

                } while (gQuestLogPlaybackState != QL_PLAYBACK_STATE_ACTION_END && (sNextActionDelay == 0 || sNextActionDelay == 0xFFFF));
            }
        }
        else if (gQuestLogCurActionIdx >= sMaxActionsInScene)
        {
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_STOPPED;
        }
        break;
    case QL_PLAYBACK_STATE_RECORDING:
        if (ArePlayerFieldControlsLocked() != TRUE)
        {
            sNextActionDelay++;
            if (gQuestLogCurActionIdx >= sMaxActionsInScene)
                gQuestLogPlaybackState = QL_PLAYBACK_STATE_STOPPED;
        }
        break;
    }
}

void QL_AfterRecordFishActionSuccessful(void)
{
    sNextActionDelay++;
}

u8 QL_GetPlaybackState(void)
{
    switch (gQuestLogPlaybackState)
    {
    case QL_PLAYBACK_STATE_STOPPED:
    default:
        return QL_PLAYBACK_STATE_STOPPED;

    case QL_PLAYBACK_STATE_RUNNING:
    case QL_PLAYBACK_STATE_ACTION_END:
        return QL_PLAYBACK_STATE_RUNNING;

    case QL_PLAYBACK_STATE_RECORDING:
    case QL_PLAYBACK_STATE_RECORDING_NO_DELAY:
        return QL_PLAYBACK_STATE_RECORDING;
    }
}

static bool8 RecordHeadAtEndOfEntryOrScriptContext2Enabled(void)
{
    if (gQuestLogCurActionIdx >= sMaxActionsInScene || ArePlayerFieldControlsLocked() == TRUE)
        return TRUE;
    return FALSE;
}

static bool8 RecordHeadAtEndOfEntry(void)
{
    if (gQuestLogCurActionIdx >= sMaxActionsInScene)
        return TRUE;
    return FALSE;
}

static const struct FlagOrVarRecord sDummyFlagOrVarRecord = {
    .idx = 0,
    .isFlag = FALSE,
    .value = 0x7FFF
};

void *QuestLogGetFlagOrVarPtr(bool8 isFlag, u16 idx)
{
    void *response;
    if (gQuestLogCurActionIdx == 0)
        return NULL;
    if (gQuestLogCurActionIdx >= sMaxActionsInScene)
        return NULL;
    if (sFlagOrVarPlayhead >= sNumFlagsOrVars)
        return NULL;
    if (sFlagOrVarRecords[sFlagOrVarPlayhead].idx == idx && sFlagOrVarRecords[sFlagOrVarPlayhead].isFlag == isFlag)
    {
        response = &sFlagOrVarRecords[sFlagOrVarPlayhead].value;
        sFlagOrVarPlayhead++;
    }
    else
        response = NULL;
    return response;
}

void QuestLogSetFlagOrVar(bool8 isFlag, u16 idx, u16 value)
{
    if (gQuestLogCurActionIdx == 0)
        return;
    if (gQuestLogCurActionIdx >= sMaxActionsInScene)
        return;
    if (sFlagOrVarPlayhead >= sNumFlagsOrVars)
        return;
    sFlagOrVarRecords[sFlagOrVarPlayhead].idx = idx;
    sFlagOrVarRecords[sFlagOrVarPlayhead].isFlag = isFlag;
    sFlagOrVarRecords[sFlagOrVarPlayhead].value = value;
    sFlagOrVarPlayhead++;
}

// Unused
static void QuestLogResetFlagsOrVars(u8 state, struct FlagOrVarRecord * records, u16 size)
{
    s32 i;

    if (state == 0 || state > QL_STATE_PLAYBACK)
    {
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_STOPPED;
    }
    else
    {
        sFlagOrVarRecords = records;
        sNumFlagsOrVars = size / 4;
        sFlagOrVarPlayhead = 0;
        if (state == QL_STATE_PLAYBACK)
        {
            for (i = 0; i < sMaxActionsInScene; i++)
                sFlagOrVarRecords[i] = sDummyFlagOrVarRecord;
        }
    }
}
