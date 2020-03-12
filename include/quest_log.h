#ifndef GUARD_QUEST_LOG_H
#define GUARD_QUEST_LOG_H

#include "global.h"
#include "quest_log_battle.h"
#include "constants/quest_log.h"

struct UnkStruct_3005E90
{
    u8 unk_0;
    u8 unk_1_0:1;
    u8 unk_1_1:1;
    u8 unk_1_2:1;
    u8 unk_1_3:1;
    u8 unk_1_4:1;
    u8 unk_2;
};

extern u8 gQuestLogState;
extern u8 gUnknown_3005E88;
extern u16 sNumQuestLogs;
extern struct UnkStruct_3005E90 gUnknown_3005E90;
extern struct UnkStruct_203AE98 * gUnknown_3005E94;
extern const u16 gUnknown_84566A8[];

void sub_8112720(u8);
void SetQuestLogEvent(u16, const u16 *);
void sub_811539C(void);
void sub_8115748(u16);
u8 sub_8112CAC(void);
bool8 QuestLog_SchedulePlaybackCB(void (*func)(void));
void sub_8111F38(u16, u16);
void sub_8111134(void);
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

#endif //GUARD_QUEST_LOG_H
