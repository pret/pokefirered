#ifndef GUARD_QUEST_LOG_H
#define GUARD_QUEST_LOG_H

#include "global.h"

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

extern u8 gUnknown_3005E88;
extern u16 gUnknown_3005E8C;
extern struct UnkStruct_3005E90 gUnknown_3005E90;
extern struct UnkStruct_203AE98 * gUnknown_3005E94;
extern const u16 gUnknown_84566A8[];

void sub_8112720(u8);
void sub_8113550(u16, const u16 *);
void sub_811539C(void);
void sub_8115748(u16);
u8 sub_8112CAC(void);
bool8 sub_81119D4(void (*func)(void));
void sub_8111F38(u16, u16);
void sub_8111134(void);
void DestroyHelpMessageWindow(u8 a0);
u8 CreateHelpMessageWindow(void);
void PrintTextOnHelpMessageWindow(const u8 * text, u8 mode);
void MapNamePopupWindowIdSetDummy(void);
void sub_8111CF0(void);
void sub_811089C(void);
void sub_8113044(void);
void TrySetUpQuestLogScenes_ElseContinueFromSave(u8 taskId);
void sub_8112450(void);
void sub_8112364(void);
u8 sub_8112CAC(void);
void sub_81138F8(void);
void sub_812C224(void);

extern u8 gUnknown_203ADFA;

#endif //GUARD_QUEST_LOG_H
