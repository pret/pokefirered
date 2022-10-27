#ifndef GUARD_QUEST_LOG_H
#define GUARD_QUEST_LOG_H

#include "global.h"
#include "quest_log_battle.h"
#include "constants/quest_log.h"
#include "field_control_avatar.h"

// Parameter to QuestLog_OnEscalatorWarp
#define QL_ESCALATOR_OUT 1
#define QL_ESCALATOR_IN  2

struct QuestLogEntry
{
    // When command == 2, these fields have different meanings
    u8 localId;  // cmd == 2: Pressed A/B, checked wild, held direction, took step
    u8 mapNum;   // cmd == 2: Always set to 0
    u8 mapGroup; // cmd == 2: Dpad direction
    u8 animId;   // cmd == 2: Always set to 0
    u16 duration;
    u8 command;
};

struct UnkStruct_203B044
{
    u8 id;
    u8 unk_1;
    u16 unk_2;
};

extern u8 gQuestLogState;
extern u8 gQuestLogPlaybackState;
extern struct FieldInput gQuestLogFieldInput;
extern struct UnkStruct_203B044 gUnknown_203B044;
extern u16 *gUnknown_203AE04;
extern u16 *sEventRecordingPointer;
extern u16 sQuestLogCursor;

void QuestLogRecordPlayerAvatarGfxTransition(u8);
void SetQuestLogEvent(u16, const u16 *);
void SetQLPlayedTheSlots(void);
void QuestLog_RecordEnteredMap(u16);
u8 sub_8112CAC(void);
bool8 QuestLog_SchedulePlaybackCB(void (*func)(void));
void QuestLog_BackUpPalette(u16 offset, u16 size);
void CommitQuestLogWindow1(void);
void QuestLog_DrawPreviouslyOnQuestHeaderIfInPlaybackMode(void);
void ResetQuestLog(void);
void ResetTrainerFanClub(void);
void TrySetUpQuestLogScenes_ElseContinueFromSave(u8 taskId);
void SaveQuestLogData(void);
void QuestLog_CutRecording(void);
u8 sub_8112CAC(void);
void ResetDeferredLinkEvent(void);
void FinishRecordingQuestLogScene(void);
void QuestLogEvents_HandleEndTrainerBattle(void);
void *QuestLogGetFlagOrVarPtr(bool8 isFlag, u16 idx);
void QuestLogSetFlagOrVar(bool8 isFlag, u16 idx, u16 value);
void SetQuestLogRecordAndPlaybackPointers(void *oldSave);
void sub_811246C(struct Sprite *sprite);
void QuestLogRecordNPCStep(u8 a0, u8 a1, u8 a2, u8 a3);
bool8 sub_8111C2C(void);
void QuestLog_OnEscalatorWarp(u8 direction);
void QuestLogRecordPlayerAvatarGfxTransitionWithDuration(u8 movementActionId, u8 duration);
void Special_UpdateTrainerFansAfterLinkBattle(void);
void QuestLogRecordPlayerStep(u8 movementActionId);
void QuestLogRecordPlayerStepWithDuration(u8 movementActionId, u8 duration);
void QuestLogRecordNPCStepWithDuration(u8 localId, u8 mapNum, u8 mapGroup, u8 movementActionId, u8 duration);
void QL_AfterRecordFishActionSuccessful(void);
void sub_8110920(void);
void sub_8111708(void);
void sub_81127F8(struct FieldInput * a0);
void sub_8112B3C(void);
void RunQuestLogCB(void);
void sub_8111C68(void);
bool8 QuestLogScenePlaybackIsEnding(void);
void sub_8115798(void);
bool8 QuestLog_ShouldEndSceneOnMapChange(void);
void QuestLog_AdvancePlayhead_(void);
void QuestLog_InitPalettesBackup(void);
void sub_8110FCC(void);
u8 GetQuestLogStartType(void);
void sub_81113E4(void);
void sub_8111438(void);
void StartRecordingQuestLogEntry(u16 eventId);
bool8 WillCommandOfSizeFitInSav1Record(u16 *cursor, size_t size);
bool8 sub_8110944(const void *a0, size_t cmdSize);

void sub_8113BD8(void);
void ResetUnk203B044(void);
u16 *TryRecordEvent39_NoParams(u16 *);
u16 *sub_8113C8C(u16 *, struct QuestLogEntry *);
u16 *sub_8113CC8(u16 *, struct QuestLogEntry *);
u16 *sub_8113D08(u16 *, struct QuestLogEntry *);
u16 *sub_8113D48(u16 *, struct QuestLogEntry *);
u16 *sub_8113D94(u16 *, struct QuestLogEntry *);
void QL_EnableRecordingSteps(void);
u16 *QuestLog_SkipCommand(u16 *, u16 **);
void sub_8113ABC(const u16 *);
u16 *sub_8113C20(u16 *, struct QuestLogEntry *);
bool8 sub_8113AE8(const u16 *);
bool8 sub_8113B44(const u16 *);
void TryRecordEvent41_IncCursor(u16);

#endif //GUARD_QUEST_LOG_H
