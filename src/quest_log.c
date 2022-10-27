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

struct TrainerFanClub
{
    u8 timer:7;
    u8 gotInitialFans:1;
    u8 fanFlags;
};

#define TRAINER_FAN_CLUB ((struct TrainerFanClub *)GetVarPointer(VAR_FANCLUB_FAN_COUNTER))

#define GET_TRAINER_FAN_CLUB_FLAG(flag) (fanClub->fanFlags >> (flag) & 1)
#define SET_TRAINER_FAN_CLUB_FLAG(flag) (fanClub->fanFlags |= 1 << (flag))
#define FLIP_TRAINER_FAN_CLUB_FLAG(flag)(fanClub->fanFlags ^= 1 << (flag))

struct UnkStruct_203AE94
{
    u8 playbackSubstate:4;
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
u16 sNumEventsInLogEntry;
struct FieldInput gQuestLogFieldInput;
struct QuestLogEntry * sCurQuestLogEntry;

static struct FlagOrVarRecord * sFlagOrVarRecords;
static u16 sNumFlagsOrVars;

static EWRAM_DATA u8 sCurrentSceneNum = 0;
static EWRAM_DATA u8 sNumScenes = 0;
EWRAM_DATA u8 gQuestLogState = 0;
static EWRAM_DATA u16 gUnknown_203ADFC = 0;
static EWRAM_DATA u8 sQuestLogHeaderWindowIds[3] = {0};
EWRAM_DATA u16 *gUnknown_203AE04 = NULL;
EWRAM_DATA u16 *sEventRecordingPointer = NULL;
static EWRAM_DATA u16 *gUnknown_203AE0C[32] = {NULL};
static EWRAM_DATA void (* sQuestLogCB)(void) = NULL;
static EWRAM_DATA u16 *sPalettesBackup = NULL;
static EWRAM_DATA struct UnkStruct_203AE94 sQuestLogCurrentScene = {0};
static EWRAM_DATA struct QuestLogEntry sQuestLogSceneRecordBuffer[32] = {0};
EWRAM_DATA u16 sQuestLogCursor = 0;
static EWRAM_DATA u8 sMovementScripts[64][2] = {{0}};
static EWRAM_DATA u16 sNextStepDelay = 0;
static EWRAM_DATA u16 sLastQuestLogCursor = 0;
static EWRAM_DATA u16 sFlagOrVarPlayhead = 0;

static void QLogCB_Recording(void);
static void QLogCB_Playback(void);
static void SetPlayerInitialCoordsAtScene(u8);
static void SetNPCInitialCoordsAtScene(u8);
static void TryRecordEvent39_GoToNextScene(void);
static void BackUpTrainerRematchesToVars(void);
static void BackUpMapLayoutToVar(void);
static void SetGameStateAtScene(u8);
static u8 TryRecordQuestLogEntrySequence(struct QuestLogEntry *);
static void Task_BeginQuestLogPlayback(u8);
static void QuestLogPlaybackSetObjectEventTemplates(u8);
static void QLPlayback_InitOverworldState(void);
static void QuestLog_GetSaneMonCounts(void);
static u16 QuestLog_GetSanePartyCount(void);
static u16 QuestLog_GetSaneBoxCount(void);
static void sub_8111688(void);
static void ReadQuestLogScriptFromSav1(u8, struct QuestLogEntry *);
static void QuestLog_BeginFadeAtEndOfScene(s8 delay);
static void QuestLog_AdvancePlayhead(void);
static void QuestLog_StartFinalScene(void);
static void Task_RunPlaybackCB(u8);
static void QuestLog_PlayCurrentEvent(void);
static void HandleShowQuestLogMessage(void);
static u8 GetQuestLogTextDisplayDuration(void);
static void DrawQuestLogSceneDescription(void);
static void sub_8111D90(u8);
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
static void SetUpQuestLogEntry(u8, struct QuestLogEntry *, u16);
static bool8 RecordHeadAtEndOfEntryOrScriptContext2Enabled(void);
static bool8 RecordHeadAtEndOfEntry(void);
static void TryLoseFansFromPlayTimeAfterLinkBattle(struct TrainerFanClub *);
static void UpdateTrainerFanClubGameClear(struct TrainerFanClub *);
static u8 PlayerGainRandomTrainerFan(struct TrainerFanClub *);
static u16 GetNumFansOfPlayerInTrainerFanClub(struct TrainerFanClub *);
static void TryLoseFansFromPlayTime(struct TrainerFanClub *);
static bool16 IsFanClubMemberFanOfPlayer(struct TrainerFanClub *);
static void SetInitialFansOfPlayer(struct TrainerFanClub *);
static void BufferFanClubTrainerName(struct LinkBattleRecords *, u8, u8);
static void UpdateTrainerFansAfterLinkBattle(struct TrainerFanClub *);
static bool8 DidPlayerGetFirstFans(struct TrainerFanClub * );
static void SetPlayerGotFirstFans(struct TrainerFanClub *);
static bool8 InQuestLogDisabledLocation(void);
static bool8 TrySetLinkQuestLogEvent(u16, const u16 *);
static bool8 TrySetTrainerBattleQuestLogEvent(u16, const u16 *);

static const struct WindowTemplate sQuestLogHeaderWindowTemplates[3] = {
    { 0, 0,  0, 30, 2, 15, 0x0e9 },
    { 0, 0, 18, 30, 2, 15, 0x0ad },
    { 0, 0, 14, 30, 6, 15, 0x14c }
};

static const u8 sTextColors[3] = {TEXT_DYNAMIC_COLOR_6, TEXT_COLOR_WHITE, TEXT_DYNAMIC_COLOR_3};

static const u16 sUnknown_8456638[] = INCBIN_U16("graphics/unknown/unknown_8456638.bin");

static const u8 sQuestLogTextLineYCoords[] = {17, 10, 3};

void SetQuestLogRecordAndPlaybackPointers(void *oldPointer)
{
    ptrdiff_t offset = (void *)gSaveBlock1Ptr - oldPointer;
    if (gUnknown_203AE04)
        gUnknown_203AE04 = (void *)gUnknown_203AE04 + offset;
    if (gQuestLogState != 0)
    {
        if (sEventRecordingPointer)
            sEventRecordingPointer = (void *)sEventRecordingPointer + offset;
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
    sEventRecordingPointer = NULL;
    gUnknown_203AE04 = NULL;
    sub_8113BD8();
    ResetDeferredLinkEvent();
}

static void DestroySav1QuestLogEntry(u8 a0)
{
    memset(gSaveBlock1Ptr->questLog + a0, 0, sizeof(struct QuestLog));
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

bool8 sub_8110944(const void *a0, size_t cmdSize)
{
    void *r2 = gSaveBlock1Ptr->questLog[sCurrentSceneNum].script;
    void *r0 = gSaveBlock1Ptr->questLog[sCurrentSceneNum].end;
    r0 -= cmdSize;
    if ((const void *)a0 < r2 || (const void *)a0 > r0)
        return FALSE;
    return TRUE;
}

bool8 WillCommandOfSizeFitInSav1Record(u16 *cursor, size_t size)
{
    void *start = gSaveBlock1Ptr->questLog[sCurrentSceneNum].script;
    void *end = gSaveBlock1Ptr->questLog[sCurrentSceneNum].end;
    end -= size;
    if ((void *)cursor < start || (void *)cursor > end)
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
    if (TryRecordQuestLogEntrySequence(sQuestLogSceneRecordBuffer) != 1)
    {
        gQuestLogPlaybackState = 0;
        TryRecordEvent39_GoToNextScene();
        gQuestLogState = 0;
        sQuestLogCB = NULL;
    }
}

static void QLogCB_Playback(void)
{
    if (sQuestLogCurrentScene.playbackSubstate == 2)
        sQuestLogCurrentScene.playbackSubstate = 0;

    if (sQuestLogCurrentScene.sceneEndMode == 0)
    {
        if (gQuestLogPlaybackState != 0 
         || sQuestLogCurrentScene.playbackSubstate == 1 
         || (sQuestLogCurrentScene.cursor < NELEMS(gUnknown_203AE0C) 
          && gUnknown_203AE0C[sQuestLogCurrentScene.cursor] != NULL))
            QuestLog_PlayCurrentEvent();
        else
        {
            sQuestLogCurrentScene.sceneEndMode = 2;
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

void StartRecordingQuestLogEntry(u16 eventId)
{
    if (sCurrentSceneNum >= QUEST_LOG_SCENE_COUNT)
        sCurrentSceneNum = 0;

    DestroySav1QuestLogEntry(sCurrentSceneNum);
    ResetUnk203B044();
    sEventRecordingPointer = gSaveBlock1Ptr->questLog[sCurrentSceneNum].script;
    if (IS_LINK_QL_EVENT(eventId) || eventId == QL_EVENT_DEPARTED)
        gSaveBlock1Ptr->questLog[sCurrentSceneNum].startType = QL_START_WARP;
    else
        gSaveBlock1Ptr->questLog[sCurrentSceneNum].startType = QL_START_NORMAL;
    QuestLog_GetSaneMonCounts();
    SetPlayerInitialCoordsAtScene(sCurrentSceneNum);
    SetNPCInitialCoordsAtScene(sCurrentSceneNum);
    BackUpTrainerRematchesToVars();
    BackUpMapLayoutToVar();
    SetGameStateAtScene(sCurrentSceneNum);
    gUnknown_203ADFC = 0;
    SetUpQuestLogEntry(2, sQuestLogSceneRecordBuffer, 0x100);
    TryRecordQuestLogEntrySequence(sQuestLogSceneRecordBuffer);
    SetQuestLogState(QL_STATE_RECORDING);
}

static void SetPlayerInitialCoordsAtScene(u8 sceneNum)
{
    struct QuestLog * questLog = &gSaveBlock1Ptr->questLog[sceneNum];
    questLog->mapGroup = gSaveBlock1Ptr->location.mapGroup;
    questLog->mapNum = gSaveBlock1Ptr->location.mapNum;
    questLog->warpId = gSaveBlock1Ptr->location.warpId;
    questLog->x = gSaveBlock1Ptr->pos.x;
    questLog->y = gSaveBlock1Ptr->pos.y;
}

static void SetNPCInitialCoordsAtScene(u8 sceneNum)
{
    struct QuestLog * questLog = &gSaveBlock1Ptr->questLog[sceneNum];
    u16 i;

    SetQuestLogObjectEventsData(questLog);

    for (i = 0; i < NELEMS(gSaveBlock1Ptr->objectEventTemplates); i++)
    {
        if (gSaveBlock1Ptr->objectEventTemplates[i].x < 0)
        {
            questLog->npcData[i].x = -1 * gSaveBlock1Ptr->objectEventTemplates[i].x;
            questLog->npcData[i].negx = TRUE;
        }
        else
        {
            questLog->npcData[i].x = (u8)gSaveBlock1Ptr->objectEventTemplates[i].x;
            questLog->npcData[i].negx = FALSE;
        }
        if (gSaveBlock1Ptr->objectEventTemplates[i].y < 0)
        {
            questLog->npcData[i].y = (-gSaveBlock1Ptr->objectEventTemplates[i].y << 24) >> 24;
            questLog->npcData[i].negy = TRUE;
        }
        else
        {
            questLog->npcData[i].y = (u8)gSaveBlock1Ptr->objectEventTemplates[i].y;
            questLog->npcData[i].negy = FALSE;
        }
        questLog->npcData[i].elevation = gSaveBlock1Ptr->objectEventTemplates[i].elevation;
        questLog->npcData[i].movementType = gSaveBlock1Ptr->objectEventTemplates[i].movementType;
    }
}

static void SetGameStateAtScene(u8 sceneNum)
{
    struct QuestLog * questLog = &gSaveBlock1Ptr->questLog[sceneNum];

    CpuCopy16(gSaveBlock1Ptr->flags, questLog->flags, NUM_FLAG_BYTES * sizeof(u8));
    CpuCopy16(gSaveBlock1Ptr->vars, questLog->vars, VARS_COUNT * sizeof(u16));
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

static void TryRecordEvent39_GoToNextScene(void)
{
    TryRecordEvent39_NoParams(sEventRecordingPointer);
    if (++sCurrentSceneNum >= QUEST_LOG_SCENE_COUNT)
        sCurrentSceneNum = 0;
}

static bool8 TryRecordQuestLogEntrySequence(struct QuestLogEntry * entry)
{
    u16 i;

    for (i = gUnknown_203ADFC; i < sQuestLogCursor; i++)
    {
        if (sEventRecordingPointer == NULL)
            return FALSE;
        switch (entry[i].command)
        {
        case 0:
        case 1:
            sEventRecordingPointer = sub_8113D48(sEventRecordingPointer, &entry[i]);
            break;
        default:
            sEventRecordingPointer = sub_8113CC8(sEventRecordingPointer, &entry[i]);
            break;
        }
        if (sEventRecordingPointer == NULL)
        {
            gQuestLogPlaybackState = 0;
            return FALSE;
        }
    }

    if (gQuestLogPlaybackState == 0)
    {
        sEventRecordingPointer = TryRecordEvent39_NoParams(sEventRecordingPointer);
        return FALSE;
    }
    gUnknown_203ADFC = sQuestLogCursor;
    return TRUE;
}

void TrySetUpQuestLogScenes_ElseContinueFromSave(u8 taskId)
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
    gSaveBlock1Ptr->location.warpId = -1;
    sCurrentSceneNum = 0;
    gDisableMapMusicChangeOnMapLoad = 1;
    DisableWildEncounters(TRUE);
    QLPlayback_InitOverworldState();
}

void sub_8110FCC(void)
{
    ReadQuestLogScriptFromSav1(sCurrentSceneNum, sQuestLogSceneRecordBuffer);
    ResetUnk203B044();
    SetUpQuestLogEntry(1, sQuestLogSceneRecordBuffer, 0x100);
    QuestLogPlaybackSetObjectEventTemplates(sCurrentSceneNum);
}

static bool8 FieldCB2_QuestLogStartPlaybackWithWarpExit(void)
{
    LoadPalette(GetTextWindowPalette(4), 0xF0, 0x20);
    SetQuestLogState(QL_STATE_PLAYBACK);
    FieldCB_DefaultWarpExit();
    sQuestLogCurrentScene = (struct UnkStruct_203AE94){};
    sQuestLogCurrentScene.playbackSubstate = 2;
    return 1;
}

static bool8 FieldCB2_QuestLogStartPlaybackStandingInPlace(void)
{
    LoadPalette(GetTextWindowPalette(4), 0xF0, 0x20);
    SetQuestLogState(QL_STATE_PLAYBACK);
    FieldCB_WarpExitFadeFromBlack();
    sQuestLogCurrentScene = (struct UnkStruct_203AE94){};
    sQuestLogCurrentScene.playbackSubstate = 2;
    return 1;
}

void DrawPreviouslyOnQuestHeader(u8 sceneNum)
{
    u8 i;

    for (i = 0; i < NELEMS(sQuestLogHeaderWindowTemplates); i++)
    {
        sQuestLogHeaderWindowIds[i] = AddWindow(&sQuestLogHeaderWindowTemplates[i]);
        FillWindowPixelRect(sQuestLogHeaderWindowIds[i], 15, 0, 0, sQuestLogHeaderWindowTemplates[i].width * 8, sQuestLogHeaderWindowTemplates[i].height * 8);
    }

    StringExpandPlaceholders(gStringVar4, gText_QuestLog_PreviouslyOnYourQuest);

    // Scene numbers count from 4 to 0, 0 being where the player saved
    if (sceneNum != 0)
    {
        ConvertIntToDecimalStringN(gStringVar1, sceneNum, STR_CONV_MODE_LEFT_ALIGN, 1);
        StringAppend(gStringVar4, gStringVar1);
    }

    AddTextPrinterParameterized4(sQuestLogHeaderWindowIds[0], FONT_2, 2, 2, 1, 2, sTextColors, 0, gStringVar4);
    PutWindowTilemap(sQuestLogHeaderWindowIds[0]);
    PutWindowTilemap(sQuestLogHeaderWindowIds[1]);
    CopyWindowToVram(sQuestLogHeaderWindowIds[0], COPYWIN_GFX);
    CopyWindowToVram(sQuestLogHeaderWindowIds[2], COPYWIN_GFX);
    CopyWindowToVram(sQuestLogHeaderWindowIds[1], COPYWIN_FULL);
}

void CommitQuestLogWindow1(void)
{
    PutWindowTilemap(sQuestLogHeaderWindowIds[1]);
    CopyWindowToVram(sQuestLogHeaderWindowIds[1], COPYWIN_MAP);
}

static void QuestLogPlaybackSetObjectEventTemplates(u8 sceneNum)
{
    struct QuestLog *questLog = &gSaveBlock1Ptr->questLog[sceneNum];
    u16 i;
    
    for (i = 0; i < 64; i++)
    {
        if (questLog->npcData[i].negx)
            gSaveBlock1Ptr->objectEventTemplates[i].x = -questLog->npcData[i].x;
        else
            gSaveBlock1Ptr->objectEventTemplates[i].x = questLog->npcData[i].x;
        if (questLog->npcData[i].negy)
            gSaveBlock1Ptr->objectEventTemplates[i].y = -(u8)questLog->npcData[i].y;
        else
            gSaveBlock1Ptr->objectEventTemplates[i].y = questLog->npcData[i].y;
        gSaveBlock1Ptr->objectEventTemplates[i].elevation = questLog->npcData[i].elevation;
        gSaveBlock1Ptr->objectEventTemplates[i].movementType = questLog->npcData[i].movementType;
    }

    SetSav1ObjectEventsFromQuestLog(questLog, gSaveBlock1Ptr->objectEventTemplates);
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
    struct QuestLog * questLog = &gSaveBlock1Ptr->questLog[sCurrentSceneNum];

    CpuCopy16(questLog->flags, gSaveBlock1Ptr->flags, NUM_FLAG_BYTES * sizeof(u8));
    CpuCopy16(questLog->vars, gSaveBlock1Ptr->vars, VARS_COUNT * sizeof(u16));
    sub_8111688();
}

struct PokemonAndSomethingElse
{
    struct Pokemon mon;
    u16 sanePartyCount;
    u16 saneBoxesCount;
};

void sub_8111438(void)
{
    struct PokemonAndSomethingElse *r9 = AllocZeroed(sizeof(struct PokemonAndSomethingElse));
    u16 r0, r3, r5, r6;

    CreateMon(&r9->mon, SPECIES_RATTATA, 1, 0x20, FALSE, 0, 0, 0);
    r0 = VarGet(VAR_QUEST_LOG_MON_COUNTS);
    r9->sanePartyCount = r0 >> 12;
    r9->saneBoxesCount = r0 % 0x1000;

    r5 = QuestLog_GetSanePartyCount();
    if (r5 > r9->sanePartyCount)
    {
        for (r3 = 0; r3 < r5 - r9->sanePartyCount; r3++)
        {
            ZeroMonData(&gPlayerParty[5 - r3]);
        }
    }
    else if (r5 < r9->sanePartyCount)
    {
        for (r3 = 0; r3 < 5; r3++)
        {
            ZeroBoxMonAt(0, r3);
        }
        for (r3 = r5; r3 < r9->sanePartyCount; r3++)
        {
            CopyMon(&gPlayerParty[r3], &r9->mon, sizeof(struct Pokemon));
        }
    }

    r5 = QuestLog_GetSaneBoxCount();
    if (r5 > r9->saneBoxesCount)
    {
        for (r3 = 0; r3 < 14; r3++)
        {
            for (r6 = 0; r6 < 30; r6++)
            {
                if (GetBoxMonDataAt(r3, r6, MON_DATA_SANITY_HAS_SPECIES))
                {
                    ZeroBoxMonAt(r3, r6);
                    r5--;
                    if (r5 == r9->saneBoxesCount)
                        break;
                }
            }
            if (r5 == r9->saneBoxesCount)
                break;
        }
    }
    else if (r5 < r9->saneBoxesCount)
    {
        for (r3 = 0; r3 < TOTAL_BOXES_COUNT; r3++)
        {
            for (r6 = 0; r6 < IN_BOX_COUNT; r6++)
            {
                struct BoxPokemon * boxMon = GetBoxedMonPtr(r3, r6);
                if (!GetBoxMonData(boxMon, MON_DATA_SANITY_HAS_SPECIES))
                {
                    CopyMon(boxMon, &r9->mon.box, sizeof(struct BoxPokemon));
                    r5++;
                    if (r5 == r9->saneBoxesCount)
                        break;
                }
            }
            if (r5 == r9->saneBoxesCount)
                break;
        }
    }

    Free(r9);
}

static void QuestLog_GetSaneMonCounts(void)
{
    u16 partyCount = QuestLog_GetSanePartyCount();
    u16 boxesCount = QuestLog_GetSaneBoxCount();
    VarSet(VAR_QUEST_LOG_MON_COUNTS, (partyCount << 12) + boxesCount);
}

static u16 QuestLog_GetSanePartyCount(void)
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

static u16 QuestLog_GetSaneBoxCount(void)
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

static void ReadQuestLogScriptFromSav1(u8 sceneNum, struct QuestLogEntry * a1)
{
    u16 i;
    u16 *r4;
    u16 r6 = 0;
    u16 r9 = 0;

    memset(a1, 0, 32 * sizeof(struct QuestLogEntry));
    for (i = 0; i < NELEMS(gUnknown_203AE0C); i++)
    {
        gUnknown_203AE0C[i] = NULL;
    }

    r4 = gSaveBlock1Ptr->questLog[sceneNum].script;
    for (i = 0; i < 32; i++)
    {
        switch (r4[0] & 0xFFF)
        {
        case QL_EVENT_0:
            r4 = sub_8113D08(r4, &a1[r6]);
            r6++;
            break;
        case QL_EVENT_1:
        case QL_EVENT_2:
            r4 = sub_8113D94(r4, &a1[r6]);
            r6++;
            break;
        case QL_EVENT_39:
            r4 = sub_8113C20(r4, &a1[r6]);
            r6++;
            break;
        case QL_EVENT_41:
            r4 = sub_8113C8C(r4, &a1[r6]);
            r6++;
            break;
        default:
            r4 = QuestLog_SkipCommand(r4, &gUnknown_203AE0C[r9]);
            if (r9 == 0)
                sub_8113ABC(gUnknown_203AE0C[0]);
            r9++;
            break;
        }
        if (r4 == NULL)
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
            gQuestLogPlaybackState = 0;
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
            gQuestLogPlaybackState = 3;
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
            sQuestLogCurrentScene.sceneEndMode = 2;
            data[1]++;
        }
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            gQuestLogPlaybackState = 0;
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
    if (sQuestLogCurrentScene.playbackSubstate == 1)
    {
        if (--sQuestLogCurrentScene.timer != 0)
            return;
        sQuestLogCurrentScene.playbackSubstate = 0;
        sQuestLogCurrentScene.playingEvent = 1;
        TogglePlaybackStateForOverworldLock(2);
    }

    if (sQuestLogCurrentScene.playingEvent == 1)
    {
        if (++sQuestLogCurrentScene.overlapTimer > 15)
        {
            QuestLog_CloseTextWindow();
            sQuestLogCurrentScene.playingEvent = 0;
            sQuestLogCurrentScene.overlapTimer = 0;
        }
    }
    if (sQuestLogCurrentScene.cursor < NELEMS(gUnknown_203AE0C))
    {
        if (sub_8113B44(gUnknown_203AE0C[sQuestLogCurrentScene.cursor]) == 1)
            HandleShowQuestLogMessage();
        else if (sub_8113AE8(gUnknown_203AE0C[sQuestLogCurrentScene.cursor]) == 1)
            HandleShowQuestLogMessage();
    }
}

static void HandleShowQuestLogMessage(void)
{
    if (sQuestLogCurrentScene.playbackSubstate == 0)
    {
        sQuestLogCurrentScene.playbackSubstate = 1;
        sQuestLogCurrentScene.playingEvent = 0;
        sQuestLogCurrentScene.overlapTimer = 0;
        sQuestLogCurrentScene.timer = GetQuestLogTextDisplayDuration();
        if (gUnknown_203B044.unk_2 == 0)
            sQuestLogCurrentScene.cursor++;
        if (sQuestLogCurrentScene.cursor > 32)
            return;
        DrawQuestLogSceneDescription();
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
    if (gQuestLogPlaybackState == 0 || sQuestLogCurrentScene.playbackSubstate == 1 || sQuestLogCurrentScene.playbackSubstate == 2)
        return TRUE;
    return FALSE;
}

void sub_8111C68(void)
{
    if (sQuestLogCurrentScene.sceneEndMode == 0)
    {
        if (JOY_NEW(A_BUTTON))
        {
            sQuestLogCurrentScene.sceneEndMode = 2;
            gQuestLogPlaybackState = 0;
            QuestLog_BeginFadeAtEndOfScene(-3);
        }
        else if (JOY_NEW(B_BUTTON))
        {
            sQuestLogCurrentScene.sceneEndMode = 1;
            gQuestLogPlaybackState = 0;
            QuestLog_SkipToEndOfPlayback(-3);
        }
    }
}

bool8 QuestLogScenePlaybackIsEnding(void)
{
    if (sQuestLogCurrentScene.sceneEndMode != 0)
        return TRUE;
    return FALSE;
}

void QuestLog_DrawPreviouslyOnQuestHeaderIfInPlaybackMode(void)
{
    if (gQuestLogState == QL_STATE_PLAYBACK)
        DrawPreviouslyOnQuestHeader(sNumScenes);
}

static void DrawQuestLogSceneDescription(void)
{
    u16 i;
    u8 numLines = 0;

    for (i = 0; i < 0x100 && gStringVar4[i] != EOS; i++)
    {
        if (gStringVar4[i] == CHAR_NEWLINE)
            numLines++;
    }

    PutWindowTilemap(sQuestLogHeaderWindowIds[2]);
    sub_8111D90(sQuestLogHeaderWindowIds[2]);
    AddTextPrinterParameterized4(sQuestLogHeaderWindowIds[2], FONT_2, 2, sQuestLogTextLineYCoords[numLines], 1, 0, sTextColors, 0, gStringVar4);
    ScheduleBgCopyTilemapToVram(0);
}

static void sub_8111D90(u8 a0)
{
    const u16 *src = sUnknown_8456638;
    u16 *buffer = Alloc(0x1680);
    u8 i, j, y;

    if (buffer)
    {
        for (i = 0; i < 6; i++)
        {
            switch (i)
            {
            default:
                y = 1;
                break;
            case 0:
                y = 0;
                break;
            case 5:
                y = 2;
                break;
            }

            // r6 = y * 32
            // r5 = 2 * (i % 16)
            // r4 = j
            for (j = 0; j < 30; j++)
            {
                CpuCopy32(src + 16 * y, buffer + 16 * (2 * (15 * i) + j), 32);
            }
        }

        CopyToWindowPixelBuffer(a0, (const u8 *)buffer, 0x1680, 0);
        Free(buffer);
    }
}

static void QuestLog_CloseTextWindow(void)
{
    ClearWindowTilemap(sQuestLogHeaderWindowIds[2]);
    FillWindowPixelRect(sQuestLogHeaderWindowIds[2], 15, 0, 0, 0xf0, 0x30);
    CopyWindowToVram(sQuestLogHeaderWindowIds[2], COPYWIN_GFX);
    PutWindowTilemap(sQuestLogHeaderWindowIds[1]);
    CopyWindowToVram(sQuestLogHeaderWindowIds[1], COPYWIN_MAP);
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
            ReadQuestLogScriptFromSav1(sCurrentSceneNum, sQuestLogSceneRecordBuffer);
        }
        gQuestLogPlaybackState = 0;
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
        if (sQuestLogCurrentScene.sceneEndMode != 1)
        {
            GetMapNameGeneric(gStringVar1, gMapHeader.regionMapSectionId);
            StringExpandPlaceholders(gStringVar4, gText_QuestLog_SavedGameAtLocation);
            DrawQuestLogSceneDescription();
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

    if (JOY_NEW(A_BUTTON | B_BUTTON) || task->tTimer >= 127 || sQuestLogCurrentScene.sceneEndMode == 1)
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
        FillWindowPixelRect(sQuestLogHeaderWindowIds[0], 0xF, 0, 0, sQuestLogHeaderWindowTemplates[0].width * 8, sQuestLogHeaderWindowTemplates[0].height * 8);
        tState++;
        break;
    case 1:
        if (sub_81121D8(taskId))
        {
            for (i = 0; i < 3; i++)
            {
                ClearWindowTilemap(sQuestLogHeaderWindowIds[i]);
                CopyWindowToVram(sQuestLogHeaderWindowIds[i], COPYWIN_MAP);
                RemoveWindow(sQuestLogHeaderWindowIds[i]);
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
        if (sQuestLogCurrentScene.sceneEndMode == 1)
            ShowMapNamePopup(TRUE);
        CpuCopy16(sPalettesBackup, gPlttBufferUnfaded, PLTT_SIZE);
        Free(sPalettesBackup);
        sQuestLogCurrentScene = (struct UnkStruct_203AE94){};
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
    FillWindowPixelRect(sQuestLogHeaderWindowIds[0], 0x00, 0, sQuestLogHeaderWindowTemplates[0].height * 8 - 1 - data[1], sQuestLogHeaderWindowTemplates[0].width * 8, 1);
    FillWindowPixelRect(sQuestLogHeaderWindowIds[1], 0x00, 0, data[1], sQuestLogHeaderWindowTemplates[1].width * 8, 1);
    CopyWindowToVram(sQuestLogHeaderWindowIds[0], COPYWIN_GFX);
    CopyWindowToVram(sQuestLogHeaderWindowIds[1], COPYWIN_GFX);
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

void FinishRecordingQuestLogScene(void)
{
    if (gQuestLogState == QL_STATE_RECORDING)
    {
        TryRecordQuestLogEntrySequence(sQuestLogSceneRecordBuffer);
        TryRecordEvent39_GoToNextScene();
        gQuestLogState = 0;
        sQuestLogCB = NULL;
        gUnknown_203AE04 = NULL;
        sEventRecordingPointer = NULL;
        gQuestLogPlaybackState = 0;
    }
}

void QuestLog_CutRecording(void)
{
    if (gQuestLogPlaybackState != 0 && gQuestLogState == QL_STATE_RECORDING)
    {
        TryRecordQuestLogEntrySequence(sQuestLogSceneRecordBuffer);
        TryRecordEvent41_IncCursor(1);
        TryRecordEvent39_GoToNextScene();
        gQuestLogPlaybackState = 0;
        gQuestLogState = 0;
        sQuestLogCB = NULL;
    }
    gUnknown_203AE04 = NULL;
    sEventRecordingPointer = NULL;
}

static void SortQuestLogInSav1(void)
{
    struct QuestLog * buffer = AllocZeroed(QUEST_LOG_SCENE_COUNT * sizeof(struct QuestLog));
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
    CpuCopy16(buffer, gSaveBlock1Ptr->questLog, QUEST_LOG_SCENE_COUNT * sizeof(struct QuestLog));
    Free(buffer);
}

void SaveQuestLogData(void)
{
    if (MenuHelpers_LinkSomething() != TRUE)
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
        if (sMovementScripts[0][0] != 0xFF)
        {
            ObjectEventSetHeldMovement(objectEvent, sMovementScripts[0][0]);
            sMovementScripts[0][0] = 0xFF;
        }
        if (sMovementScripts[0][1] != 0xFF)
        {
            QuestLogUpdatePlayerSprite(sMovementScripts[0][1]);
            sMovementScripts[0][1] = 0xFF;
        }
        sub_8063E28(objectEvent, sprite);
    }
    else
    {
        if (sMovementScripts[objectEvent->localId][0] != 0xFF)
        {
            ObjectEventSetHeldMovement(objectEvent, sMovementScripts[objectEvent->localId][0]);
            sMovementScripts[objectEvent->localId][0] = 0xFF;
        }
        sub_8063E28(objectEvent, sprite);
    }
}

void QuestLogRecordNPCStep(u8 localId, u8 mapNum, u8 mapGroup, u8 movementActionId)
{
    if (!RecordHeadAtEndOfEntryOrScriptContext2Enabled())
    {
        sCurQuestLogEntry[sQuestLogCursor].duration = sNextStepDelay;
        sCurQuestLogEntry[sQuestLogCursor].command = 0;
        sCurQuestLogEntry[sQuestLogCursor].localId = localId;
        sCurQuestLogEntry[sQuestLogCursor].mapNum = mapNum;
        sCurQuestLogEntry[sQuestLogCursor].mapGroup = mapGroup;
        sCurQuestLogEntry[sQuestLogCursor].animId = movementActionId;
        sQuestLogCursor++;
        sNextStepDelay = 0;
    }
}

void QuestLogRecordNPCStepWithDuration(u8 localId, u8 mapNum, u8 mapGroup, u8 movementActionId, u8 duration)
{
    if (!RecordHeadAtEndOfEntry())
    {
        sCurQuestLogEntry[sQuestLogCursor].duration = sNextStepDelay;
        sCurQuestLogEntry[sQuestLogCursor].command = 0;
        sCurQuestLogEntry[sQuestLogCursor].localId = localId;
        sCurQuestLogEntry[sQuestLogCursor].mapNum = mapNum;
        sCurQuestLogEntry[sQuestLogCursor].mapGroup = mapGroup;
        sCurQuestLogEntry[sQuestLogCursor].animId = movementActionId;
        sQuestLogCursor++;
        sNextStepDelay = duration;
    }
}

void QuestLogRecordPlayerStep(u8 movementActionId)
{
    if (!RecordHeadAtEndOfEntryOrScriptContext2Enabled())
    {
        if (movementActionId != sCurQuestLogEntry[sLastQuestLogCursor].animId || movementActionId > MOVEMENT_ACTION_FACE_RIGHT)
        {
            sCurQuestLogEntry[sQuestLogCursor].duration = sNextStepDelay;
            sCurQuestLogEntry[sQuestLogCursor].command = 0;
            sCurQuestLogEntry[sQuestLogCursor].localId = 0;
            sCurQuestLogEntry[sQuestLogCursor].animId = movementActionId;
            sLastQuestLogCursor = sQuestLogCursor;
            sQuestLogCursor++;
            sNextStepDelay = 0;
        }
    }
}

void QuestLogRecordPlayerStepWithDuration(u8 movementActionId, u8 duration)
{
    if (!RecordHeadAtEndOfEntry())
    {
        sCurQuestLogEntry[sQuestLogCursor].duration = sNextStepDelay;
        sCurQuestLogEntry[sQuestLogCursor].command = 0;
        sCurQuestLogEntry[sQuestLogCursor].localId = 0;
        sCurQuestLogEntry[sQuestLogCursor].animId = movementActionId;
        sLastQuestLogCursor = sQuestLogCursor;
        sQuestLogCursor++;
        sNextStepDelay = duration;
    }
}

void QuestLogRecordPlayerAvatarGfxTransition(u8 movementActionId)
{
    if (!RecordHeadAtEndOfEntry())
    {
        sCurQuestLogEntry[sQuestLogCursor].duration = sNextStepDelay;
        sCurQuestLogEntry[sQuestLogCursor].command = 1;
        sCurQuestLogEntry[sQuestLogCursor].localId = 0;
        sCurQuestLogEntry[sQuestLogCursor].animId = movementActionId;
        sQuestLogCursor++;
        sNextStepDelay = 0;
    }
}

void QuestLogRecordPlayerAvatarGfxTransitionWithDuration(u8 movementActionId, u8 duration)
{
    if (!RecordHeadAtEndOfEntry())
    {
        sCurQuestLogEntry[sQuestLogCursor].duration = sNextStepDelay;
        sCurQuestLogEntry[sQuestLogCursor].command = 1;
        sCurQuestLogEntry[sQuestLogCursor].localId = 0;
        sCurQuestLogEntry[sQuestLogCursor].animId = movementActionId;
        sQuestLogCursor++;
        sNextStepDelay = duration;
    }
}

void sub_81127F8(struct FieldInput * a0)
{
    if (sQuestLogCursor < sNumEventsInLogEntry)
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
        sCurQuestLogEntry[sQuestLogCursor].duration = sNextStepDelay;
        sCurQuestLogEntry[sQuestLogCursor].command = 2;
        sCurQuestLogEntry[sQuestLogCursor].localId = r2;
        sCurQuestLogEntry[sQuestLogCursor].mapNum = r2 >> 8; // always 0
        sCurQuestLogEntry[sQuestLogCursor].mapGroup = r2 >> 16;
        sCurQuestLogEntry[sQuestLogCursor].animId = r2 >> 24; // always 0
        sQuestLogCursor++;
        if (ArePlayerFieldControlsLocked())
            sNextStepDelay = TRUE;
        else
            sNextStepDelay = FALSE;
    }
}

static void TogglePlaybackStateForOverworldLock(u8 a0)
{
    switch (a0)
    {
    case 1:
        if (gQuestLogPlaybackState == 1)
            gQuestLogPlaybackState = 3; // Message visible, overworld locked
        break;
    case 2:
        if (gQuestLogPlaybackState == 3)
            gQuestLogPlaybackState = 1; // Overworld unlocked
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
            gQuestLogPlaybackState = 3;
        else if (r1 == 2)
        {
            sCurQuestLogEntry[sQuestLogCursor].duration = sNextStepDelay;
            sCurQuestLogEntry[sQuestLogCursor].command = 3;
            sQuestLogCursor++;
            sNextStepDelay = 0;
            gQuestLogPlaybackState = 4;
        }
        break;
    case QL_ESCALATOR_IN: // warp in
        if (r1 == 1)
            gQuestLogPlaybackState = 1;
        else if (r1 == 2)
            gQuestLogPlaybackState = 2;
        break;
    }
}

static void SetUpQuestLogEntry(u8 kind, struct QuestLogEntry *entry, u16 size)
{
    int i;

    switch (kind)
    {
    default:
        gQuestLogPlaybackState = 0;
        break;
    case 1:
        sCurQuestLogEntry = entry;
        sNumEventsInLogEntry = size / sizeof(*sCurQuestLogEntry);
        for (i = 0; i < (s32)NELEMS(sMovementScripts); i++)
        {
            sMovementScripts[i][0] |= 0xFF;
            sMovementScripts[i][1] |= 0xFF;
        }
        sQuestLogCursor = 0;
        sLastQuestLogCursor = 0;
        gQuestLogFieldInput = (struct FieldInput){};
        sNextStepDelay = sCurQuestLogEntry[sQuestLogCursor].duration;
        sMovementScripts[0][0] = sCurQuestLogEntry[sQuestLogCursor].animId;
        sMovementScripts[0][1] = 0xFF;
        gQuestLogPlaybackState = 1;
        break;
    case 2:
        sCurQuestLogEntry = entry;
        sNumEventsInLogEntry = size / sizeof(*sCurQuestLogEntry);
        for (i = 0; i < sNumEventsInLogEntry; i++)
        {
            sCurQuestLogEntry[i] = (struct QuestLogEntry){ 0, 0, 0, 0, 0xFFFF, 0xFF };
        }
        sQuestLogCursor = 0;
        sNextStepDelay = 0;
        sCurQuestLogEntry[sQuestLogCursor].duration = 0;
        sCurQuestLogEntry[sQuestLogCursor].command = 0;
        sCurQuestLogEntry[sQuestLogCursor].localId = 0;
        switch (GetPlayerFacingDirection())
        {
        case DIR_NONE:
        case DIR_SOUTH:
            sCurQuestLogEntry[sQuestLogCursor].animId = MOVEMENT_ACTION_FACE_DOWN;
            break;
        case DIR_EAST:
            sCurQuestLogEntry[sQuestLogCursor].animId = MOVEMENT_ACTION_FACE_RIGHT;
            break;
        case DIR_NORTH:
            sCurQuestLogEntry[sQuestLogCursor].animId = MOVEMENT_ACTION_FACE_UP;
            break;
        case DIR_WEST:
            sCurQuestLogEntry[sQuestLogCursor].animId = MOVEMENT_ACTION_FACE_LEFT;
            break;
        }
        sLastQuestLogCursor = 0;
        sQuestLogCursor++;
        sCurQuestLogEntry[sQuestLogCursor].duration = 0;
        sCurQuestLogEntry[sQuestLogCursor].command = 2;
        sCurQuestLogEntry[sQuestLogCursor].localId = 0;
        sCurQuestLogEntry[sQuestLogCursor].mapNum = 0;
        sCurQuestLogEntry[sQuestLogCursor].mapGroup = 0;
        sCurQuestLogEntry[sQuestLogCursor].animId = 0;
        sQuestLogCursor++;
        gQuestLogPlaybackState = 2;
        break;
    }
}

void sub_8112B3C(void)
{
    switch (gQuestLogPlaybackState)
    {
    case 0:
        break;
    case 1:
        if (!RecordHeadAtEndOfEntryOrScriptContext2Enabled())
        {
            if (sNextStepDelay != 0)
                sNextStepDelay--;
            else
            {
                do
                {
                    switch (sCurQuestLogEntry[sQuestLogCursor].command)
                    {
                    case 0:
                        // NPC movement action
                        sMovementScripts[sCurQuestLogEntry[sQuestLogCursor].localId][0] = sCurQuestLogEntry[sQuestLogCursor].animId;
                        break;
                    case 1:
                        // State transition
                        sMovementScripts[sCurQuestLogEntry[sQuestLogCursor].localId][1] = sCurQuestLogEntry[sQuestLogCursor].animId;
                        break;
                    case 2:
                        // Player input command
                        *(u32 *)&gQuestLogFieldInput = ((sCurQuestLogEntry[sQuestLogCursor].animId << 24) | (sCurQuestLogEntry[sQuestLogCursor].mapGroup << 16) | (sCurQuestLogEntry[sQuestLogCursor].mapNum << 8) | (sCurQuestLogEntry[sQuestLogCursor].localId << 0));
                        break;
                    case 3:
                        // End
                        gQuestLogPlaybackState = 3;
                        break;
                    case 0xFE:
                        break;
                    case 0xFF:
                        gQuestLogPlaybackState = 0;
                        break;
                    }
                    if (gQuestLogPlaybackState == 0)
                        break;
                    if (++sQuestLogCursor >= sNumEventsInLogEntry)
                    {
                        gQuestLogPlaybackState = 0;
                        break;
                    }
                    sNextStepDelay = sCurQuestLogEntry[sQuestLogCursor].duration;
                } while (gQuestLogPlaybackState != 3
                      && (sNextStepDelay == 0 || sNextStepDelay == 0xFFFF));
            }
        }
        else if (sQuestLogCursor >= sNumEventsInLogEntry)
        {
            gQuestLogPlaybackState = 0;
        }
        break;
    case 2:
        if (ArePlayerFieldControlsLocked() != TRUE)
        {
            sNextStepDelay++;
            if (sQuestLogCursor >= sNumEventsInLogEntry)
                gQuestLogPlaybackState = 0;
        }
        break;
    case 3:
        break;
    case 4:
        break;
    }
}

void QL_AfterRecordFishActionSuccessful(void)
{
    sNextStepDelay++;
}

u8 sub_8112CAC(void)
{
    switch (gQuestLogPlaybackState)
    {
    case 0:
    default:
        return 0;
    case 1:
    case 3:
        return 1;
    case 2:
    case 4:
        return 2;
    }
}

static bool8 RecordHeadAtEndOfEntryOrScriptContext2Enabled(void)
{
    if (sQuestLogCursor >= sNumEventsInLogEntry || ArePlayerFieldControlsLocked() == TRUE)
        return TRUE;
    return FALSE;
}

static bool8 RecordHeadAtEndOfEntry(void)
{
    if (sQuestLogCursor >= sNumEventsInLogEntry)
        return TRUE;
    return FALSE;
}

static const struct FlagOrVarRecord sDummyFlagOrVarRecord = {
    0,
    FALSE,
    0x7FFF
};

void *QuestLogGetFlagOrVarPtr(bool8 isFlag, u16 idx)
{
    void *response;
    if (sQuestLogCursor == 0)
        return NULL;
    if (sQuestLogCursor >= sNumEventsInLogEntry)
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
    if (sQuestLogCursor == 0)
        return;
    if (sQuestLogCursor >= sNumEventsInLogEntry)
        return;
    if (sFlagOrVarPlayhead >= sNumFlagsOrVars)
        return;
    sFlagOrVarRecords[sFlagOrVarPlayhead].idx = idx;
    sFlagOrVarRecords[sFlagOrVarPlayhead].isFlag = isFlag;
    sFlagOrVarRecords[sFlagOrVarPlayhead].value = value;
    sFlagOrVarPlayhead++;
}

void sub_8112E3C(u8 state, struct FlagOrVarRecord * records, u16 size)
{
    s32 i;

    if (state == 0 || state > QL_STATE_PLAYBACK)
        gQuestLogPlaybackState = 0;
    else
    {
        sFlagOrVarRecords = records;
        sNumFlagsOrVars = size >> 2;
        sFlagOrVarPlayhead = 0;
        if (state == QL_STATE_PLAYBACK)
        {
            for (i = 0; i < sNumEventsInLogEntry; i++)
            {
                sFlagOrVarRecords[i] = sDummyFlagOrVarRecord;
            }
        }
    }
}
