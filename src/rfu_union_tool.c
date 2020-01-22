#include "global.h"
#include "event_data.h"
#include "rfu_union_tool.h"
#include "constants/flags.h"

const u8 gUnknown_84570D8[][10] = {
    {0x29, 0x36, 0x27, 0x12, 0x13, 0x14, 0x19, 0x1A},
    {0x2A, 0x3A, 0x28, 0x16, 0x17, 0x18, 0x1C, 0x1D}
};

const s16 gUnknown_84570EC[][2] = {
    {0x4, 0x6},
    {0xd, 0x8},
    {0xa, 0x6},
    {0x1, 0x8},
    {0xd, 0x4},
    {0x7, 0x4},
    {0x1, 0x4},
    {0x7, 0x8}
};

const s8 gUnknown_845710C[][2] = {
    { 0,  0},
    { 1,  0},
    { 0, -1},
    {-1,  0},
    { 0,  1}
};

const u8 gUnknown_8457116[] = {
    0x00, 0x02, 0x01, 0x04, 0x03
};

const u8 gUnknown_845711B[] = {
    0x01, 0x03, 0x01, 0x04, 0x02
};

bool32 is_walking_or_running(void)
{
    if (gPlayerAvatar.tileTransitionState == 2 || gPlayerAvatar.tileTransitionState == 0)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

u8 sub_811B524(u32 a0, u32 a1)
{
    return gUnknown_84570D8[a0][a1 % 8];
}

void sub_811B53C(u32 a0, u32 a1, s32 * a2, s32 * a3)
{
    *a2 = gUnknown_84570EC[a0][0] + gUnknown_845710C[a1][0] + 7;
    *a3 = gUnknown_84570EC[a0][1] + gUnknown_845710C[a1][1] + 7;
}

bool32 sub_811B58C(u32 a0, u32 a1, s32 a2, s32 a3)
{
    if (gUnknown_84570EC[a0][0] + gUnknown_845710C[a1][0] + 7 != a2)
    {
        return FALSE;
    }
    else if (gUnknown_84570EC[a0][1] + gUnknown_845710C[a1][1] + 7 != a3)
    {
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}
//
//bool32 IsUnionRoomPlayerHidden(u32 player_idx)
//{
//    return FlagGet(FLAG_HIDE_UNION_ROOM_PLAYER_1 + player_idx);
//}
