#ifndef GUARD_QUEST_LOG_H
#define GUARD_QUEST_LOG_H

#include "global.h"
#include "quest_log_battle.h"
#include "constants/quest_log.h"
#include "field_control_avatar.h"

extern u8 gQuestLogState;
extern u8 gUnknown_3005E88;
extern const u16 gUnknown_84566A8[];
extern struct FieldInput gUnknown_3005E90;

void sub_8112720(u8);
void SetQuestLogEvent(u16, const u16 *);
void sub_811539C(void);
void QuestLog_RecordEnteredMap(u16);
u8 sub_8112CAC(void);
bool8 QuestLog_SchedulePlaybackCB(void (*func)(void));
void sub_8111F38(u16 offset, u16 idx);
void CommitQuestLogWindow1(void);
void DestroyHelpMessageWindow(u8 a0);
u8 CreateHelpMessageWindow(void);
void PrintTextOnHelpMessageWindow(const u8 * text, u8 mode);
void MapNamePopupWindowIdSetDummy(void);
void sub_8111CF0(void);
void ResetQuestLog(void);
void ResetTrainerFanClub(void);
void TrySetUpQuestLogScenes_ElseContinueFromSave(u8 taskId);
void sub_8112450(void);
void sub_8112364(void);
u8 sub_8112CAC(void);
void sub_81138F8(void);
void sub_811231C(void);
void sub_81139BC(void);
void *QuestLogGetFlagOrVarPtr(bool8 isFlag, u16 idx);
void QuestLogSetFlagOrVar(bool8 isFlag, u16 idx, u16 value);
void sub_8110840(void *oldSave);
void sub_8112F18(u8 windowId);
void sub_811246C(struct Sprite *sprite);
void sub_81124EC(u8 a0, u8 a1, u8 a2, u8 a3);
bool8 sub_8111C2C(void);
void sub_81128BC(u8 a0);
void sub_811278C(u8 movementActionId, u8 duration);
void Special_UpdateTrainerFansAfterLinkBattle(void);
void sub_8112628(u8 movementActionId);
void sub_81126AC(u8 movementActionId, u8 duration);
void sub_8112588(u8 localId, u8 mapNum, u8 mapGroup, u8 movementActionId, u8 duration);
void sub_8112C9C(void);
void sub_8110920(void);
void sub_8111708(void);
void sub_81127F8(struct FieldInput * a0);
void sub_8112B3C(void);
void RunQuestLogCB(void);
void sub_8111C68(void);
bool8 sub_8111CD0(void);
void sub_8115798(void);
bool8 sub_8113748(void);
void sub_81119C8(void);
void sub_8111F14(void);
void sub_8110FCC(void);
u8 sub_8110AC8(void);
void sub_81113E4(void);
void sub_8111438(void);

#endif //GUARD_QUEST_LOG_H
