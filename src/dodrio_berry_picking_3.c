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

void sub_815A61C(struct DodrioSubstruct_31A0 * arg0, struct DodrioSubstruct_31A0_2C * arg1, struct DodrioSubstruct_31A0_2C * arg2, struct DodrioSubstruct_31A0_2C * arg3, struct DodrioSubstruct_31A0_2C * arg4, struct DodrioSubstruct_31A0_2C * arg5, u8 arg6, u32 arg7, u32 arg8)
{
    struct UnkPacket2 packet;
    struct DodrioSubstruct_31A0_14 * ptr = &arg0->unk14;

    packet.id = 2;
    packet.unk1_0 = ptr->unkB[0];
    packet.unk1_1 = ptr->unkB[1];
    packet.unk2_0 = ptr->unkB[2];
    packet.unk2_1 = ptr->unkB[3];
    packet.unk3_0 = ptr->unkB[4];
    packet.unk3_1 = ptr->unkB[5];
    packet.unk4_0 = ptr->unkB[6];
    packet.unk4_1 = ptr->unkB[7];
    packet.unk5_0 = ptr->unkB[8];
    packet.unk5_1 = ptr->unkB[9];

    packet.unk6_0 = ptr->unk0[0];
    packet.unk6_1 = ptr->unk0[1];
    packet.unk6_2 = ptr->unk0[2];
    packet.unk6_3 = ptr->unk0[3];
    packet.unk7_0 = ptr->unk0[4];
    packet.unk7_1 = ptr->unk0[5];
    packet.unk7_2 = ptr->unk0[6];
    packet.unk7_3 = ptr->unk0[7];
    packet.unk8_0 = ptr->unk0[8];
    packet.unk8_1 = ptr->unk0[9];

    packet.unk8_2 = arg1->unk0;
    packet.unk8_3 = arg2->unk0;
    packet.unk9_0 = arg3->unk0;
    packet.unk9_1 = arg4->unk0;
    packet.unk9_2 = arg5->unk0;

    packet.unk9_3 = arg1->unk4;
    packet.unk9_4 = arg2->unk4;
    packet.unkA_0 = arg3->unk4;
    packet.unkA_1 = arg4->unk4;
    packet.unkA_2 = arg5->unk4;

    packet.unkB_2 = arg1->unk8;
    packet.unkB_3 = arg2->unk8;
    packet.unkB_4 = arg3->unk8;
    packet.unkB_5 = arg4->unk8;
    packet.unkB_6 = arg5->unk8;

    packet.unkA_3 = arg6;
    packet.unkB_1 = arg7;
    packet.unkB_0 = arg8;
    Rfu_SendPacket(&packet);
}

u32 sub_815A950(u32 unused, struct DodrioSubstruct_31A0 * arg0, struct DodrioSubstruct_31A0_2C * arg1, struct DodrioSubstruct_31A0_2C * arg2, struct DodrioSubstruct_31A0_2C * arg3, struct DodrioSubstruct_31A0_2C * arg4, struct DodrioSubstruct_31A0_2C * arg5, u8 *arg6, u32 *arg7, u32 *arg8)
{
    struct UnkPacket2 * packet;
    struct DodrioSubstruct_31A0_14 * ptr = &arg0->unk14;

    if ((gRecvCmds[0][0] & 0xFF00) != 0x2F00)
        return 0;

    packet = (void *)&gRecvCmds[0][1];
    if (packet->id == 2)
    {
        ptr->unkB[0] = packet->unk1_0;
        ptr->unkB[1] = packet->unk1_1;
        ptr->unkB[2] = packet->unk2_0;
        ptr->unkB[3] = packet->unk2_1;
        ptr->unkB[4] = packet->unk3_0;
        ptr->unkB[5] = packet->unk3_1;
        ptr->unkB[6] = packet->unk4_0;
        ptr->unkB[7] = packet->unk4_1;
        ptr->unkB[8] = packet->unk5_0;
        ptr->unkB[9] = packet->unk5_1;
        ptr->unkB[10] = packet->unk1_0;

        ptr->unk0[0] = packet->unk6_0;
        ptr->unk0[1] = packet->unk6_1;
        ptr->unk0[2] = packet->unk6_2;
        ptr->unk0[3] = packet->unk6_3;
        ptr->unk0[4] = packet->unk7_0;
        ptr->unk0[5] = packet->unk7_1;
        ptr->unk0[6] = packet->unk7_2;
        ptr->unk0[7] = packet->unk7_3;
        ptr->unk0[8] = packet->unk8_0;
        ptr->unk0[9] = packet->unk8_1;
        ptr->unk0[10] = packet->unk6_0;

        arg1->unk0 = packet->unk8_2;
        arg1->unk4 = packet->unk9_3;
        arg1->unk8 = packet->unkB_2;

        arg2->unk0 = packet->unk8_3;
        arg2->unk4 = packet->unk9_4;
        arg2->unk8 = packet->unkB_3;

        arg3->unk0 = packet->unk9_0;
        arg3->unk4 = packet->unkA_0;
        arg3->unk8 = packet->unkB_4;

        arg4->unk0 = packet->unk9_1;
        arg4->unk4 = packet->unkA_1;
        arg4->unk8 = packet->unkB_5;

        arg5->unk0 = packet->unk9_2;
        arg5->unk4 = packet->unkA_2;
        arg5->unk8 = packet->unkB_6;

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
