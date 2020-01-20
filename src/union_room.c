#include "global.h"
#include "gflib.h"
#include "event_data.h"
#include "link_rfu.h"
#include "task.h"
#include "union_room.h"

EWRAM_DATA union UnkUnion_Main gUnknown_203B05C = {};

IWRAM_DATA struct UnkStruct_Leader *gUnknown_3002024;

void sub_8115A68(u8 taskId);
u16 sub_8118658(const u8 *data);
void sub_811A444(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 colorIdx);

extern const u8 *const gUnknown_845742C[][5];
extern const u8 gUnknown_84571B4[];
extern const u8 gUnknown_8457234[];

void sub_811586C(u8 windowId, u8 arg1, u8 stringId)
{
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    switch (arg1 << 8)
    {
    case 0x200:
        sub_811A444(windowId, 2, gUnknown_845742C[0][stringId - 1], 0, 2, 0);
        break;
    case 0x400:
        sub_811A444(windowId, 2, gUnknown_845742C[1][stringId - 1], 0, 2, 0);
        break;
    case 0x2500:
        sub_811A444(windowId, 2, gUnknown_845742C[2][stringId - 1], 0, 2, 0);
        break;
    case 0x3500:
        sub_811A444(windowId, 2, gUnknown_845742C[3][stringId - 1], 0, 2, 0);
        break;
    }

    CopyWindowToVram(windowId, 2);
}

void sub_8115924(u8 windowId)
{
    u8 text[12];
    u8 text2[12];

    sub_811A444(windowId, 2, gSaveBlock2Ptr->playerName, 0, 2, 0);
    StringCopy(text2, gUnknown_84571B4);
    ConvertIntToDecimalStringN(text, sub_8118658(gSaveBlock2Ptr->playerTrainerId), STR_CONV_MODE_LEADING_ZEROS, 5);
    StringAppend(text2, text);
    sub_811A444(windowId, 0, text2, 0, 0x10, 0);
}

void sub_811599C(u8 *dst, u8 caseId)
{
    switch (caseId)
    {
    case 1 ... 4:
    case 9 ... 11:
    case 21 ... 22:
        // UB: argument *dst isn't used, instead it always prints to gStringVar4
        StringExpandPlaceholders(gStringVar4, gUnknown_8457234);
        break;
    }
}

void TryBecomeLinkLeader(void)
{
    u8 taskId;
    struct UnkStruct_Leader *dataPtr;

    taskId = CreateTask(sub_8115A68, 0);
    gUnknown_203B05C.leader = dataPtr = (void*)(gTasks[taskId].data);
    gUnknown_3002024 = dataPtr;

    dataPtr->state = 0;
    dataPtr->textState = 0;
    gSpecialVar_Result = 0;
}
