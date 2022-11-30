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

/*
    QUEST LOG

## What is the Quest Log?

    When the player resumes playing a saved game a black-and-white sequence will play recounting some
    significant events that happened leading up to the last time the player saved.
    The name comes from the text displayed at the top of these scenes: "Previously on your quest..."

## Quest Log Terminology

    - "Scene": This is the name for each sequence that plays during the quest log. There are QUEST_LOG_SCENE_COUNT (4)
               of these scenes that play, after which a final screen shows where the game was saved before the game resumes.
               All the data stored for each scene is in 'struct QuestLogScene', defined in include/global.h.
               The entirety of the Quest Log's save data is represented by an array of these scenes in SaveBlock1.

    - "Action": TODO: Copy from quest_log.h

    - "Event":

    - "Command":

    - "Script":

*/

enum {
    WIN_TOP_BAR,      // Contains the "Previously on..." text
    WIN_BOTTOM_BAR,   // Empty, only briefly visible at the end or when the description window isn't covering it.
    WIN_DESCRIPTION,
    WIN_COUNT
};

#define DESC_WIN_WIDTH (DISPLAY_WIDTH / 8)
#define DESC_WIN_HEIGHT 6

// sQuestLogActionRecordBuffer should be large enough to fill a scene's script with the maximum number of actions
#define SCRIPT_BUFFER_SIZE (sizeof(gSaveBlock1Ptr->questLog[0].script) / sizeof(struct QuestLogAction))

struct PlaybackControl
{
    u8 state:4;
    u8 playingEvent:2;
    u8 sceneEndMode:2;
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


u8 gQuestLogPlaybackState;
u16 sMaxActionsInScene;
struct FieldInput gQuestLogFieldInput;
struct QuestLogAction * sCurSceneActions;

static struct FlagOrVarRecord * sFlagOrVarRecords;
static u16 sNumFlagsOrVars;

static EWRAM_DATA u8 sCurrentSceneNum = 0;
static EWRAM_DATA u8 sNumScenes = 0;
EWRAM_DATA u8 gQuestLogState = 0;
static EWRAM_DATA u16 gUnknown_203ADFC = 0;
static EWRAM_DATA u8 sWindowIds[WIN_COUNT] = {0};
EWRAM_DATA u16 *gUnknown_203AE04 = NULL;
EWRAM_DATA u16 *gQuestLogRecordingPointer = NULL;
static EWRAM_DATA u16 *gUnknown_203AE0C[32] = {NULL};
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
static void BackUpTrainerRematchesToVars(void);
static void BackUpMapLayoutToVar(void);
static void SetGameStateAtScene(u8);
static u8 TryRecordActionSequence(struct QuestLogAction *);
static void Task_BeginQuestLogPlayback(u8);
static void QuestLogPlaybackSetObjectEventTemplates(u8);
static void QLPlayback_InitOverworldState(void);
static void SetPokemonCounts(void);
static u16 QuestLog_GetPartyCount(void);
static u16 QuestLog_GetBoxMonCount(void);
static void sub_8111688(void);
static void ReadQuestLogScriptFromSav1(u8, struct QuestLogAction *);
static void QuestLog_BeginFadeAtEndOfScene(s8 delay);
static void QuestLog_AdvancePlayhead(void);
static void QuestLog_StartFinalScene(void);
static void Task_RunPlaybackCB(u8);
static void QuestLog_PlayCurrentEvent(void);
static void HandleShowQuestLogMessage(void);
static u8 GetQuestLogTextDisplayDuration(void);
static void DrawSceneDescription(void);
static void CopyDescriptionWindowTiles(u8);
static void QuestLog_CloseTextWindow(void);
static void QuestLog_SkipToEndOfPlayback(s8 delay);
static void QuestLog_WaitFadeAndCancelPlayback(void);
static bool8 FieldCB2_FinalScene(void);
static void Task_FinalScene_WaitFade(u8);
static void Task_QuestLogScene_SavedGame(u8);
static void Task_WaitAtEndOfQuestLog(u8);
static void Task_EndQuestLog(u8);
static bool8 sub_81121D8(u8);
static void QL_SlightlyDarkenSomePals(void);
static void TogglePlaybackStateForOverworldLock(u8);
static void SetUpQuestLogAction(u8, struct QuestLogAction *, u16);
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

void SetQuestLogRecordAndPlaybackPointers(void *oldPointer)
{
    ptrdiff_t offset = (void *)gSaveBlock1Ptr - oldPointer;
    if (gUnknown_203AE04)
        gUnknown_203AE04 = (void *)gUnknown_203AE04 + offset;
    if (gQuestLogState != 0)
    {
        if (gQuestLogRecordingPointer)
            gQuestLogRecordingPointer = (void *)gQuestLogRecordingPointer + offset;
        if (gQuestLogState == QL_STATE_PLAYBACK)
        {
            int r3;
            for (r3 = 0; r3 < (int)NELEMS(gUnknown_203AE0C); r3++)
                if (gUnknown_203AE0C[r3])
                    gUnknown_203AE0C[r3] = (void *)gUnknown_203AE0C[r3] + offset;
        }
    }
}

void ResetQuestLog(void)
{
    memset(gSaveBlock1Ptr->questLog, 0, sizeof(gSaveBlock1Ptr->questLog));
    sCurrentSceneNum = 0;
    gQuestLogState = 0;
    sQuestLogCB = NULL;
    gQuestLogRecordingPointer = NULL;
    gUnknown_203AE04 = NULL;
    sub_8113BD8();
    ResetDeferredLinkEvent();
}

static void ClearSavedScene(u8 sceneNum)
{
    memset(&gSaveBlock1Ptr->questLog[sceneNum], 0, sizeof(gSaveBlock1Ptr->questLog[sceneNum]));
    gUnknown_203AE04 = NULL;
}

void sub_8110920(void)
{
    gUnknown_203AE04 = NULL;
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
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_0;
        RecordSceneEnd();
        gQuestLogState = 0;
        sQuestLogCB = NULL;
    }
}

static void QLogCB_Playback(void)
{
    if (sPlaybackControl.state == 2)
        sPlaybackControl.state = 0;

    if (sPlaybackControl.sceneEndMode == 0)
    {
        if (gQuestLogPlaybackState != QL_PLAYBACK_STATE_0 
         || sPlaybackControl.state == 1 
         || (sPlaybackControl.cursor < NELEMS(gUnknown_203AE0C) 
          && gUnknown_203AE0C[sPlaybackControl.cursor] != NULL))
            QuestLog_PlayCurrentEvent();
        else
        {
            sPlaybackControl.sceneEndMode = 2;
            LockPlayerFieldControls();
            QuestLog_BeginFadeAtEndOfScene(0);
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

void StartRecordingQuestLogAction(u16 eventId)
{
    if (sCurrentSceneNum >= QUEST_LOG_SCENE_COUNT)
        sCurrentSceneNum = 0;

    ClearSavedScene(sCurrentSceneNum);
    ResetUnk203B044();
    gQuestLogRecordingPointer = gSaveBlock1Ptr->questLog[sCurrentSceneNum].script;
    if (IS_LINK_QL_EVENT(eventId) || eventId == QL_EVENT_DEPARTED)
        gSaveBlock1Ptr->questLog[sCurrentSceneNum].startType = QL_START_WARP;
    else
        gSaveBlock1Ptr->questLog[sCurrentSceneNum].startType = QL_START_NORMAL;
    SetPokemonCounts();
    SetPlayerInitialCoordsAtScene(sCurrentSceneNum);
    SetNPCInitialCoordsAtScene(sCurrentSceneNum);
    BackUpTrainerRematchesToVars();
    BackUpMapLayoutToVar();
    SetGameStateAtScene(sCurrentSceneNum);
    gUnknown_203ADFC = 0;
    SetUpQuestLogAction(2, sQuestLogActionRecordBuffer, sizeof(sQuestLogActionRecordBuffer));
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

static void BackUpTrainerRematchesToVars(void)
{
    u16 i, j;
    u16 sp0[4];

    for (i = 0; i < 4; i++)
    {
        sp0[i] = 0;
        for (j = 0; j < 16; j++)
        {
            if (gSaveBlock1Ptr->trainerRematches[16 * i + j])
            {
                sp0[i] += (1 << j);
            }
        }
        VarSet(VAR_QLBAK_TRAINER_REMATCHES + i, sp0[i]);
    }
}

static void BackUpMapLayoutToVar(void)
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

    for (i = gUnknown_203ADFC; i < gQuestLogCurActionIdx; i++)
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
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_0;
            return FALSE;
        }
    }

    if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_0)
    {
        gQuestLogRecordingPointer = QL_RecordAction_SceneEnd(gQuestLogRecordingPointer);
        return FALSE;
    }
    gUnknown_203ADFC = gQuestLogCurActionIdx;
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

void sub_8110FCC(void)
{
    ReadQuestLogScriptFromSav1(sCurrentSceneNum, sQuestLogActionRecordBuffer);
    ResetUnk203B044();
    SetUpQuestLogAction(1, sQuestLogActionRecordBuffer, sizeof(sQuestLogActionRecordBuffer));
    QuestLogPlaybackSetObjectEventTemplates(sCurrentSceneNum);
}

static bool8 FieldCB2_QuestLogStartPlaybackWithWarpExit(void)
{
    LoadPalette(GetTextWindowPalette(4), 0xF0, 0x20);
    SetQuestLogState(QL_STATE_PLAYBACK);
    FieldCB_DefaultWarpExit();
    sPlaybackControl = (struct PlaybackControl){};
    sPlaybackControl.state = 2;
    return 1;
}

static bool8 FieldCB2_QuestLogStartPlaybackStandingInPlace(void)
{
    LoadPalette(GetTextWindowPalette(4), 0xF0, 0x20);
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

static void QuestLogPlaybackSetObjectEventTemplates(u8 sceneNum)
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
    struct WarpData sp0;
    
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
        sp0.mapGroup = gSaveBlock1Ptr->questLog[sceneNum].mapGroup;
        sp0.mapNum = gSaveBlock1Ptr->questLog[sceneNum].mapNum;
        sp0.warpId = gSaveBlock1Ptr->questLog[sceneNum].warpId;
        sp0.x = gSaveBlock1Ptr->questLog[sceneNum].x;
        sp0.y = gSaveBlock1Ptr->questLog[sceneNum].y;
        Overworld_SetWarpDestinationFromWarp(&sp0);
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

void sub_81113E4(void)
{
    struct QuestLogScene * questLog = &gSaveBlock1Ptr->questLog[sCurrentSceneNum];

    CpuCopy16(questLog->flags, gSaveBlock1Ptr->flags, sizeof(gSaveBlock1Ptr->flags));
    CpuCopy16(questLog->vars, gSaveBlock1Ptr->vars, sizeof(gSaveBlock1Ptr->vars));
    sub_8111688();
}

struct PokemonAndSomethingElse
{
    struct Pokemon mon;
    u16 partyCount;
    u16 boxMonCount;
};

void sub_8111438(void)
{
    struct PokemonAndSomethingElse *prev = AllocZeroed(sizeof(struct PokemonAndSomethingElse));
    u16 packedCounts, i, count, j;

    CreateMon(&prev->mon, SPECIES_RATTATA, 1, USE_RANDOM_IVS, FALSE, 0, OT_ID_PLAYER_ID, 0);
    packedCounts = VarGet(VAR_QUEST_LOG_MON_COUNTS);
    prev->partyCount = packedCounts >> 12;
    prev->boxMonCount = packedCounts % 0x1000;

    count = QuestLog_GetPartyCount();
    if (count > prev->partyCount)
    {
        for (i = 0; i < count - prev->partyCount; i++)
            ZeroMonData(&gPlayerParty[PARTY_SIZE - 1 - i]);
    }
    else if (count < prev->partyCount)
    {
        for (i = 0; i < PARTY_SIZE - 1; i++)
            ZeroBoxMonAt(0, i);

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
    VarSet(VAR_QUEST_LOG_MON_COUNTS, (partyCount << 12) + boxesCount);
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

static void sub_8111688(void)
{
    u16 i, j;
    u16 sp0[4];

    for (i = 0; i < 4; i++)
    {
        sp0[i] = VarGet(VAR_QLBAK_TRAINER_REMATCHES + i);

        for (j = 0; j < 16; j++)
        {
            if (sp0[i] & 1)
                gSaveBlock1Ptr->trainerRematches[16 * i + j] = 30;
            else
                gSaveBlock1Ptr->trainerRematches[16 * i + j] = 0;
            sp0[i] >>= 1;
        }
    }
}

void sub_8111708(void)
{
    struct MapHeader sp0;

    gSaveBlock1Ptr->mapLayoutId = VarGet(VAR_QLBAK_MAP_LAYOUT);
    if (gSaveBlock1Ptr->mapLayoutId == 0)
    {
        sp0 = *Overworld_GetMapHeaderByGroupAndId(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum);
        gSaveBlock1Ptr->mapLayoutId = sp0.mapLayoutId;
    }
}

static void ReadQuestLogScriptFromSav1(u8 sceneNum, struct QuestLogAction * a1)
{
    u16 i;
    u16 *script;
    u16 r6 = 0;
    u16 r9 = 0;

    memset(a1, 0, 32 * sizeof(struct QuestLogAction));
    for (i = 0; i < NELEMS(gUnknown_203AE0C); i++)
    {
        gUnknown_203AE0C[i] = NULL;
    }

    script = gSaveBlock1Ptr->questLog[sceneNum].script;
    for (i = 0; i < 32; i++)
    {
        switch (script[0] & QL_CMD_EVENT_MASK)
        {
        case QL_EVENT_INPUT:
            script = QL_LoadAction_Input(script, &a1[r6]);
            r6++;
            break;
        case QL_EVENT_GFX_CHANGE:
        case QL_EVENT_MOVEMENT:
            script = QL_LoadAction_MovementOrGfxChange(script, &a1[r6]);
            r6++;
            break;
        case QL_EVENT_SCENE_END:
            script = QL_LoadAction_SceneEnd(script, &a1[r6]);
            r6++;
            break;
        case QL_EVENT_WAIT:
            script = QL_LoadAction_Wait(script, &a1[r6]);
            r6++;
            break;
        default: // Normal event
            script = QuestLog_SkipCommand(script, &gUnknown_203AE0C[r9]);
            if (r9 == 0)
                sub_8113ABC(gUnknown_203AE0C[0]);
            r9++;
            break;
        }
        if (script == NULL)
            break;
    }
}

static void QuestLog_BeginFadeAtEndOfScene(s8 delay)
{
    FadeScreen(FADE_TO_BLACK, delay);
    sQuestLogCB = QuestLog_AdvancePlayhead;
}

static void QuestLog_AdvancePlayhead(void)
{
    if (!gPaletteFade.active)
    {
        LockPlayerFieldControls();
        if (++sCurrentSceneNum < QUEST_LOG_SCENE_COUNT && gSaveBlock1Ptr->questLog[sCurrentSceneNum].startType != 0)
        {
            sNumScenes--;
            QLPlayback_InitOverworldState();
        }
        else
        {
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_0;
            QuestLog_StartFinalScene();
        }
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

bool8 QuestLog_SchedulePlaybackCB(void (*callback)(void))
{
    u8 taskId;

    switch (gQuestLogState)
    {
        case QL_STATE_RECORDING:
            QuestLog_CutRecording();
            break;
        case QL_STATE_PLAYBACK:
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_3;
            taskId = CreateTask(Task_RunPlaybackCB, 80);
            gTasks[taskId].data[0] = 0;
            gTasks[taskId].data[1] = 0;
            SetWordTaskArg(taskId, 14, (uintptr_t)callback);
            return TRUE;
    }
    return FALSE;
}

static void Task_RunPlaybackCB(u8 taskId)
{
    void (*routine)(void);
    s16 *data = gTasks[taskId].data;

    switch (data[1])
    {
    case 0:
        if (++data[0] == 0x7F)
        {
            BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, 0);
            sPlaybackControl.sceneEndMode = 2;
            data[1]++;
        }
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_0;
            routine = (void (*)(void)) GetWordTaskArg(taskId, 14);
            if (routine != NULL)
                routine();
            DestroyTask(taskId);
            sQuestLogCB = QuestLog_AdvancePlayhead;
        }
        break;
    }
}

static void QuestLog_PlayCurrentEvent(void)
{
    if (sPlaybackControl.state == 1)
    {
        if (--sPlaybackControl.timer != 0)
            return;
        sPlaybackControl.state = 0;
        sPlaybackControl.playingEvent = 1;
        TogglePlaybackStateForOverworldLock(2);
    }

    if (sPlaybackControl.playingEvent == 1)
    {
        if (++sPlaybackControl.overlapTimer > 15)
        {
            QuestLog_CloseTextWindow();
            sPlaybackControl.playingEvent = 0;
            sPlaybackControl.overlapTimer = 0;
        }
    }
    if (sPlaybackControl.cursor < NELEMS(gUnknown_203AE0C))
    {
        if (sub_8113B44(gUnknown_203AE0C[sPlaybackControl.cursor]) == 1)
            HandleShowQuestLogMessage();
        else if (sub_8113AE8(gUnknown_203AE0C[sPlaybackControl.cursor]) == 1)
            HandleShowQuestLogMessage();
    }
}

static void HandleShowQuestLogMessage(void)
{
    if (sPlaybackControl.state == 0)
    {
        sPlaybackControl.state = 1;
        sPlaybackControl.playingEvent = 0;
        sPlaybackControl.overlapTimer = 0;
        sPlaybackControl.timer = GetQuestLogTextDisplayDuration();
        if (gUnknown_203B044.unk_2 == 0)
            sPlaybackControl.cursor++;
        if (sPlaybackControl.cursor > 32)
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

bool8 sub_8111C2C(void)
{
    if (gQuestLogState != QL_STATE_PLAYBACK)
        return FALSE;
    if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_0 || sPlaybackControl.state == 1 || sPlaybackControl.state == 2)
        return TRUE;
    return FALSE;
}

void HandleQuestLogInput(void)
{
    if (sPlaybackControl.sceneEndMode != 0)
        return;

    if (JOY_NEW(A_BUTTON))
    {
        sPlaybackControl.sceneEndMode = 2;
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_0;
        QuestLog_BeginFadeAtEndOfScene(-3);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        sPlaybackControl.sceneEndMode = 1;
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_0;
        QuestLog_SkipToEndOfPlayback(-3);
    }
}

bool8 QuestLogScenePlaybackIsEnding(void)
{
    if (sPlaybackControl.sceneEndMode != 0)
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
    u16 *buffer = Alloc(DESC_WIN_WIDTH * DESC_WIN_HEIGHT * 32);
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
                CpuCopy32(src + 16 * y, buffer + 16 * (2 * (15 * i) + j), 32);
        }

        CopyToWindowPixelBuffer(windowId, (const u8 *)buffer, DESC_WIN_WIDTH * DESC_WIN_HEIGHT * 32, 0);
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

static void QuestLog_SkipToEndOfPlayback(s8 delay)
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
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_0;
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
    CpuCopy16(gPlttBufferUnfaded + offset, sPalettesBackup + offset, size * 2);
}

static bool8 FieldCB2_FinalScene(void)
{
    LoadPalette(GetTextWindowPalette(4), 0xF0, 0x20);
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
        if (sPlaybackControl.sceneEndMode != 1)
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

    if (JOY_NEW(A_BUTTON | B_BUTTON) || task->tTimer >= 127 || sPlaybackControl.sceneEndMode == 1)
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
        if (sub_81121D8(taskId))
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
        if (sPlaybackControl.sceneEndMode == 1)
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

static bool8 sub_81121D8(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (data[1] > 15)
        return TRUE;

    CopyPaletteInvertedTint(gPlttBufferUnfaded + 0x01, gPlttBufferFaded + 0x01, 0xDF, 0x0F - data[1]);
    CopyPaletteInvertedTint(gPlttBufferUnfaded + 0x100, gPlttBufferFaded + 0x100, 0x100, 0x0F - data[1]);
    FillWindowPixelRect(sWindowIds[WIN_TOP_BAR],
                        0x00, 0,
                        sWindowTemplates[WIN_TOP_BAR].height * 8 - 1 - data[1],
                        sWindowTemplates[WIN_TOP_BAR].width * 8,
                        1);
    FillWindowPixelRect(sWindowIds[WIN_BOTTOM_BAR],
                        0x00, 0,
                        data[1],
                        sWindowTemplates[WIN_BOTTOM_BAR].width * 8, 1);
    CopyWindowToVram(sWindowIds[WIN_TOP_BAR], COPYWIN_GFX);
    CopyWindowToVram(sWindowIds[WIN_BOTTOM_BAR], COPYWIN_GFX);
    data[1]++;
    return FALSE;
}

static void QL_SlightlyDarkenSomePals(void)
{
    u16 *buffer = Alloc(PLTT_SIZE);
    CpuCopy16(sPalettesBackup, buffer, PLTT_SIZE);
    SlightlyDarkenPalsInWeather(sPalettesBackup, sPalettesBackup, 13 * 16);
    SlightlyDarkenPalsInWeather(sPalettesBackup + 17 * 16, sPalettesBackup + 17 * 16, 1 * 16);
    SlightlyDarkenPalsInWeather(sPalettesBackup + 22 * 16, sPalettesBackup + 22 * 16, 4 * 16);
    SlightlyDarkenPalsInWeather(sPalettesBackup + 27 * 16, sPalettesBackup + 27 * 16, 5 * 16);
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
        gUnknown_203AE04 = NULL;
        gQuestLogRecordingPointer = NULL;
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_0;
    }
}

void QuestLog_CutRecording(void)
{
    if (gQuestLogPlaybackState != QL_PLAYBACK_STATE_0 && gQuestLogState == QL_STATE_RECORDING)
    {
        TryRecordActionSequence(sQuestLogActionRecordBuffer);
        QL_RecordWait(1);
        RecordSceneEnd();
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_0;
        gQuestLogState = 0;
        sQuestLogCB = NULL;
    }
    gUnknown_203AE04 = NULL;
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

void sub_811246C(struct Sprite *sprite)
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
        UpdateQuestLogObjectEventCurrentMovement(objectEvent, sprite);
    }
    else
    {
        if (sMovementScripts[objectEvent->localId][0] != MOVEMENT_ACTION_NONE)
        {
            ObjectEventSetHeldMovement(objectEvent, sMovementScripts[objectEvent->localId][0]);
            sMovementScripts[objectEvent->localId][0] = MOVEMENT_ACTION_NONE;
        }
        UpdateQuestLogObjectEventCurrentMovement(objectEvent, sprite);
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

void sub_81127F8(struct FieldInput * a0)
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
        u32 r2 = *(u32 *)a0 & 0x00FF00F3;
        sCurSceneActions[gQuestLogCurActionIdx].duration = sNextActionDelay;
        sCurSceneActions[gQuestLogCurActionIdx].type = QL_ACTION_INPUT;
        sCurSceneActions[gQuestLogCurActionIdx].data.fieldInput[0] = r2;
        sCurSceneActions[gQuestLogCurActionIdx].data.fieldInput[1] = r2 >> 8; // always 0
        sCurSceneActions[gQuestLogCurActionIdx].data.fieldInput[2] = r2 >> 16;
        sCurSceneActions[gQuestLogCurActionIdx].data.fieldInput[3] = r2 >> 24; // always 0
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
        if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_1)
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_3; // Message visible, overworld locked
        break;
    case 2:
        if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_3)
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_1; // Overworld unlocked
        break;
    }
}

void QuestLog_OnEscalatorWarp(u8 direction)
{
    u8 r1 = sub_8112CAC();

    switch (direction)
    {
    case QL_ESCALATOR_OUT: // warp out
        if (r1 == 1)
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_3;
        else if (r1 == 2)
        {
            sCurSceneActions[gQuestLogCurActionIdx].duration = sNextActionDelay;
            sCurSceneActions[gQuestLogCurActionIdx].type = QL_ACTION_3;
            gQuestLogCurActionIdx++;
            sNextActionDelay = 0;
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_4;
        }
        break;
    case QL_ESCALATOR_IN: // warp in
        if (r1 == 1)
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_1;
        else if (r1 == 2)
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_2;
        break;
    }
}

static void SetUpQuestLogAction(u8 kind, struct QuestLogAction *actions, u16 size)
{
    int i;

    switch (kind)
    {
    default:
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_0;
        break;
    case 1:
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
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_1;
        break;
    case 2:
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
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_2;
        break;
    }
}

void sub_8112B3C(void)
{
    switch (gQuestLogPlaybackState)
    {
    case QL_PLAYBACK_STATE_0:
    case QL_PLAYBACK_STATE_3:
    case QL_PLAYBACK_STATE_4:
        break;
    case QL_PLAYBACK_STATE_1:
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
                    case QL_ACTION_3:
                        // End
                        gQuestLogPlaybackState = QL_PLAYBACK_STATE_3;
                        break;
                    case QL_ACTION_WAIT:
                        break;
                    case QL_ACTION_SCENE_END:
                        gQuestLogPlaybackState = QL_PLAYBACK_STATE_0;
                        break;
                    }

                    if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_0)
                        break;
                    if (++gQuestLogCurActionIdx >= sMaxActionsInScene)
                    {
                        gQuestLogPlaybackState = QL_PLAYBACK_STATE_0;
                        break;
                    }
                    sNextActionDelay = sCurSceneActions[gQuestLogCurActionIdx].duration;

                } while (gQuestLogPlaybackState != QL_PLAYBACK_STATE_3 && (sNextActionDelay == 0 || sNextActionDelay == 0xFFFF));
            }
        }
        else if (gQuestLogCurActionIdx >= sMaxActionsInScene)
        {
            gQuestLogPlaybackState = QL_PLAYBACK_STATE_0;
        }
        break;
    case QL_PLAYBACK_STATE_2:
        if (ArePlayerFieldControlsLocked() != TRUE)
        {
            sNextActionDelay++;
            if (gQuestLogCurActionIdx >= sMaxActionsInScene)
                gQuestLogPlaybackState = QL_PLAYBACK_STATE_0;
        }
        break;
    }
}

void QL_AfterRecordFishActionSuccessful(void)
{
    sNextActionDelay++;
}

u8 sub_8112CAC(void)
{
    switch (gQuestLogPlaybackState)
    {
    case QL_PLAYBACK_STATE_0:
    default:
        return 0;
    case QL_PLAYBACK_STATE_1:
    case QL_PLAYBACK_STATE_3:
        return 1;
    case QL_PLAYBACK_STATE_2:
    case QL_PLAYBACK_STATE_4:
        return 2;
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
        gQuestLogPlaybackState = QL_PLAYBACK_STATE_0;
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
