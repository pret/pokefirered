#include "global.h"
#include "dodrio_berry_picking.h"
#include "link.h"
#include "link_rfu.h"

void sub_815A5BC(s32 a0)
{
    struct Padded_U8 data[2];
    data[0].value = 1;
    data[1].value = a0;
    Rfu_SendPacket(data);
}

u8 sub_815A5E8(s32 a0)
{
    u8 * r1;
    if ((gRecvCmds[0][0] & 0xFF00) != 0x2F00)
        return 0;
    r1 = (u8 *)&gRecvCmds[a0][1];
    if (r1[0] == 1)
        return r1[4];
    return 0;
}

struct UnkPacket2
{
    u8 id;
    u8 unk1_0:4;
    u8 unk1_1:4;
    u16 unk2_0:4;
    u16 unk2_1:4;
    u16 unk3_0:4;
    u16 unk3_1:4;
    u16 unk4_0:4;
    u16 unk4_1:4;
    u16 unk5_0:4;
    u16 unk5_1:4;
    u16 unk6_0:2;
    u16 unk6_1:2;
    u16 unk6_2:2;
    u16 unk6_3:2;
    u16 unk7_0:2;
    u16 unk7_1:2;
    u16 unk7_2:2;
    u16 unk7_3:2;
    u8 unk8_0:2;
    u8 unk8_1:2;
    u8 unk8_2:2;
    u8 unk8_3:2;
    u8 unk9_0:2;
    u8 unk9_1:2;
    u8 unk9_2:2;
    u8 unk9_3:1;
    u8 unk9_4:1;
    u8 unkA_0:1;
    u8 unkA_1:1;
    u8 unkA_2:1;
    u8 unkA_3:5;
    u8 unkB_0:1;
    u8 unkB_1:1;
    u8 unkB_2:1;
    u8 unkB_3:1;
    u8 unkB_4:1;
    u8 unkB_5:1;
    u8 unkB_6:1;
};

void sub_815A61C(struct DodrioGame_Player * arg0, struct DodrioGame_PlayerCommData * arg1, struct DodrioGame_PlayerCommData * arg2, struct DodrioGame_PlayerCommData * arg3, struct DodrioGame_PlayerCommData * arg4, struct DodrioGame_PlayerCommData * arg5, u8 arg6, u32 arg7, u32 arg8)
{
    struct UnkPacket2 packet;
    struct DodrioGame_Berries * ptr = &arg0->berries;

    packet.id = 2;
    packet.unk1_0 = ptr->fallDist[0];
    packet.unk1_1 = ptr->fallDist[1];
    packet.unk2_0 = ptr->fallDist[2];
    packet.unk2_1 = ptr->fallDist[3];
    packet.unk3_0 = ptr->fallDist[4];
    packet.unk3_1 = ptr->fallDist[5];
    packet.unk4_0 = ptr->fallDist[6];
    packet.unk4_1 = ptr->fallDist[7];
    packet.unk5_0 = ptr->fallDist[8];
    packet.unk5_1 = ptr->fallDist[9];

    packet.unk6_0 = ptr->ids[0];
    packet.unk6_1 = ptr->ids[1];
    packet.unk6_2 = ptr->ids[2];
    packet.unk6_3 = ptr->ids[3];
    packet.unk7_0 = ptr->ids[4];
    packet.unk7_1 = ptr->ids[5];
    packet.unk7_2 = ptr->ids[6];
    packet.unk7_3 = ptr->ids[7];
    packet.unk8_0 = ptr->ids[8];
    packet.unk8_1 = ptr->ids[9];

    packet.unk8_2 = arg1->pickState;
    packet.unk8_3 = arg2->pickState;
    packet.unk9_0 = arg3->pickState;
    packet.unk9_1 = arg4->pickState;
    packet.unk9_2 = arg5->pickState;

    packet.unk9_3 = arg1->ateBerry;
    packet.unk9_4 = arg2->ateBerry;
    packet.unkA_0 = arg3->ateBerry;
    packet.unkA_1 = arg4->ateBerry;
    packet.unkA_2 = arg5->ateBerry;

    packet.unkB_2 = arg1->missedBerry;
    packet.unkB_3 = arg2->missedBerry;
    packet.unkB_4 = arg3->missedBerry;
    packet.unkB_5 = arg4->missedBerry;
    packet.unkB_6 = arg5->missedBerry;

    packet.unkA_3 = arg6;
    packet.unkB_1 = arg7;
    packet.unkB_0 = arg8;
    Rfu_SendPacket(&packet);
}

u32 sub_815A950(u32 unused, struct DodrioGame_Player * arg0, struct DodrioGame_PlayerCommData * arg1, struct DodrioGame_PlayerCommData * arg2, struct DodrioGame_PlayerCommData * arg3, struct DodrioGame_PlayerCommData * arg4, struct DodrioGame_PlayerCommData * arg5, u8 *arg6, u32 *arg7, u32 *arg8)
{
    struct UnkPacket2 * packet;
    struct DodrioGame_Berries * ptr = &arg0->berries;

    if ((gRecvCmds[0][0] & 0xFF00) != 0x2F00)
        return 0;

    packet = (void *)&gRecvCmds[0][1];
    if (packet->id == 2)
    {
        ptr->fallDist[0] = packet->unk1_0;
        ptr->fallDist[1] = packet->unk1_1;
        ptr->fallDist[2] = packet->unk2_0;
        ptr->fallDist[3] = packet->unk2_1;
        ptr->fallDist[4] = packet->unk3_0;
        ptr->fallDist[5] = packet->unk3_1;
        ptr->fallDist[6] = packet->unk4_0;
        ptr->fallDist[7] = packet->unk4_1;
        ptr->fallDist[8] = packet->unk5_0;
        ptr->fallDist[9] = packet->unk5_1;
        ptr->fallDist[10] = packet->unk1_0;

        ptr->ids[0] = packet->unk6_0;
        ptr->ids[1] = packet->unk6_1;
        ptr->ids[2] = packet->unk6_2;
        ptr->ids[3] = packet->unk6_3;
        ptr->ids[4] = packet->unk7_0;
        ptr->ids[5] = packet->unk7_1;
        ptr->ids[6] = packet->unk7_2;
        ptr->ids[7] = packet->unk7_3;
        ptr->ids[8] = packet->unk8_0;
        ptr->ids[9] = packet->unk8_1;
        ptr->ids[10] = packet->unk6_0;

        arg1->pickState = packet->unk8_2;
        arg1->ateBerry = packet->unk9_3;
        arg1->missedBerry = packet->unkB_2;

        arg2->pickState = packet->unk8_3;
        arg2->ateBerry = packet->unk9_4;
        arg2->missedBerry = packet->unkB_3;

        arg3->pickState = packet->unk9_0;
        arg3->ateBerry = packet->unkA_0;
        arg3->missedBerry = packet->unkB_4;

        arg4->pickState = packet->unk9_1;
        arg4->ateBerry = packet->unkA_1;
        arg4->missedBerry = packet->unkB_5;

        arg5->pickState = packet->unk9_2;
        arg5->ateBerry = packet->unkA_2;
        arg5->missedBerry = packet->unkB_6;

        *arg6 = packet->unkA_3;
        *arg7 = packet->unkB_1;
        *arg8 = packet->unkB_0;
        return 1;
    }

    return 0;
}

struct UnkPacket3
{
    u8 id;
    u8 ALIGNED(4) unk4;
};

void sub_815AAD8(u8 arg0)
{
    struct UnkPacket3 packet;
    packet.id = 3;
    packet.unk4 = arg0;
    Rfu_SendPacket(&packet);
}

u32 sub_815AB04(u32 arg0, u8 *arg1)
{
    struct UnkPacket3 * packet;

    if ((gRecvCmds[0][0] & 0xFF00) != 0x2F00)
        return 0;

    packet = (void *)&gRecvCmds[arg0][1];
    if (packet->id == 3)
    {
        *arg1 = packet->unk4;
        return 1;
    }

    return 0;
}

struct UnkPacket4
{
    u8 id;
    u32 unk4;
};

void sub_815AB3C(u32 arg0)
{
    struct UnkPacket4 packet;
    packet.id = 4;
    packet.unk4 = arg0;
    Rfu_SendPacket(&packet);
}

u32 sub_815AB60(u32 arg0)
{
    struct UnkPacket4 * packet;

    if ((gRecvCmds[0][0] & 0xFF00) != 0x2F00)
        return 0;

    packet = (void *)&gRecvCmds[arg0][1];
    if (packet->id == 4)
        return packet->unk4;

    return 0;
}
