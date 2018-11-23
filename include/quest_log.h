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

void sub_8112720(u8);

#endif //GUARD_QUEST_LOG_H
