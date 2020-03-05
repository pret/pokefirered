#include "global.h"
#include "dodrio_berry_picking.h"
#include "link.h"
#include "link_rfu.h"

void sub_815A5BC(s32 a0)
{
    struct Padded_U8 data[2];
    data[0].value = 1;
    data[1].value = a0;
    RfuPrepareSend0x2f00(data);
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
    u8 unk2_0:4;
    u8 unk2_1:4;
    u8 unk3_0:4;
    u8 unk3_1:4;
    u8 unk4_0:4;
    u8 unk4_1:4;
    u8 unk5_0:4;
    u8 unk5_1:4;
    u8 unk6_0:2;
    u8 unk6_1:2;
    u8 unk6_2:2;
    u8 unk6_3:2;
    u8 unk7_0:2;
    u8 unk7_1:2;
    u8 unk7_2:2;
    u8 unk7_3:2;
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

#ifdef NONMATCHING
static void sub_815A61C(struct DodrioSubstruct_31A0 *arg0, struct DodrioSubstruct_31A0_2C *arg1, struct DodrioSubstruct_31A0_2C *arg2, struct DodrioSubstruct_31A0_2C *arg3, struct DodrioSubstruct_31A0_2C *arg4, struct DodrioSubstruct_31A0_2C *arg5, u8 arg6, u32 arg7, u32 arg8)
{
    struct UnkPacket2 packet;
    struct DodrioSubstruct_31A0_14 *ptr = &arg0->unk14;

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
    RfuPrepareSend0x2f00(&packet);
}
#else
NAKED
void sub_815A61C(struct DodrioSubstruct_31A0 *arg0, struct DodrioSubstruct_31A0_2C *arg1, struct DodrioSubstruct_31A0_2C *arg2, struct DodrioSubstruct_31A0_2C *arg3, struct DodrioSubstruct_31A0_2C *arg4, struct DodrioSubstruct_31A0_2C *arg5, u8 arg6, u32 arg7, u32 arg8)
{
    asm_unified("   push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x20\n\
    ldr r4, [sp, 0x48]\n\
    lsls r4, 24\n\
    str r4, [sp, 0x1C]\n\
    movs r4, 0x14\n\
    adds r4, r0\n\
    mov r9, r4\n\
    mov r5, sp\n\
    movs r4, 0x2\n\
    strb r4, [r5]\n\
    mov r10, sp\n\
    mov r5, r9\n\
    ldrb r4, [r5, 0xB]\n\
    movs r7, 0xF\n\
    adds r5, r7, 0\n\
    ands r5, r4\n\
    mov r6, r10\n\
    ldrb r6, [r6, 0x1]\n\
    mov r8, r6\n\
    movs r4, 0x10\n\
    negs r4, r4\n\
    mov r6, r8\n\
    ands r4, r6\n\
    orrs r4, r5\n\
    mov r5, r10\n\
    strb r4, [r5, 0x1]\n\
    mov r8, sp\n\
    mov r6, r9\n\
    ldrb r5, [r6, 0xC]\n\
    lsls r5, 4\n\
    ands r4, r7\n\
    orrs r4, r5\n\
    mov r5, r8\n\
    strb r4, [r5, 0x1]\n\
    ldrb r5, [r6, 0xD]\n\
    movs r6, 0xF\n\
    ands r5, r6\n\
    mov r4, r10\n\
    ldrb r4, [r4, 0x2]\n\
    mov r8, r4\n\
    movs r4, 0x10\n\
    negs r4, r4\n\
    mov r6, r8\n\
    ands r4, r6\n\
    orrs r4, r5\n\
    mov r5, r10\n\
    strb r4, [r5, 0x2]\n\
    mov r8, sp\n\
    mov r6, r9\n\
    ldrb r5, [r6, 0xE]\n\
    lsls r5, 4\n\
    ands r4, r7\n\
    orrs r4, r5\n\
    mov r5, r8\n\
    strb r4, [r5, 0x2]\n\
    ldrb r5, [r6, 0xF]\n\
    movs r6, 0xF\n\
    ands r5, r6\n\
    mov r4, r10\n\
    ldrb r4, [r4, 0x3]\n\
    mov r8, r4\n\
    movs r4, 0x10\n\
    negs r4, r4\n\
    mov r6, r8\n\
    ands r4, r6\n\
    orrs r4, r5\n\
    mov r5, r10\n\
    strb r4, [r5, 0x3]\n\
    mov r8, sp\n\
    mov r6, r9\n\
    ldrb r5, [r6, 0x10]\n\
    lsls r5, 4\n\
    ands r4, r7\n\
    orrs r4, r5\n\
    mov r5, r8\n\
    strb r4, [r5, 0x3]\n\
    ldrb r5, [r6, 0x11]\n\
    movs r6, 0xF\n\
    ands r5, r6\n\
    mov r4, r10\n\
    ldrb r4, [r4, 0x4]\n\
    mov r8, r4\n\
    movs r4, 0x10\n\
    negs r4, r4\n\
    mov r6, r8\n\
    ands r4, r6\n\
    orrs r4, r5\n\
    mov r5, r10\n\
    strb r4, [r5, 0x4]\n\
    mov r8, sp\n\
    mov r6, r9\n\
    ldrb r5, [r6, 0x12]\n\
    lsls r5, 4\n\
    ands r4, r7\n\
    orrs r4, r5\n\
    mov r5, r8\n\
    strb r4, [r5, 0x4]\n\
    ldrb r4, [r6, 0x13]\n\
    movs r6, 0xF\n\
    ands r4, r6\n\
    mov r6, r8\n\
    ldrb r5, [r6, 0x5]\n\
    movs r6, 0x10\n\
    negs r6, r6\n\
    ands r6, r5\n\
    orrs r6, r4\n\
    str r6, [sp, 0xC]\n\
    mov r4, r8\n\
    strb r6, [r4, 0x5]\n\
    mov r5, sp\n\
    mov r6, r9\n\
    ldrb r4, [r6, 0x14]\n\
    lsls r4, 4\n\
    ldr r6, [sp, 0xC]\n\
    ands r6, r7\n\
    orrs r6, r4\n\
    strb r6, [r5, 0x5]\n\
    mov r7, sp\n\
    movs r4, 0x3\n\
    mov r8, r4\n\
    ldrb r0, [r0, 0x14]\n\
    mov r5, r8\n\
    ands r0, r5\n\
    ldrb r5, [r7, 0x6]\n\
    movs r6, 0x4\n\
    negs r6, r6\n\
    mov r10, r6\n\
    mov r4, r10\n\
    ands r4, r5\n\
    orrs r4, r0\n\
    strb r4, [r7, 0x6]\n\
    mov r5, r9\n\
    ldrb r0, [r5, 0x1]\n\
    mov r6, r8\n\
    ands r0, r6\n\
    lsls r0, 2\n\
    movs r5, 0xD\n\
    negs r5, r5\n\
    ands r5, r4\n\
    orrs r5, r0\n\
    strb r5, [r7, 0x6]\n\
    mov r0, r9\n\
    ldrb r4, [r0, 0x2]\n\
    ands r4, r6\n\
    lsls r4, 4\n\
    movs r0, 0x31\n\
    negs r0, r0\n\
    ands r0, r5\n\
    orrs r0, r4\n\
    strb r0, [r7, 0x6]\n\
    mov r5, sp\n\
    mov r6, r9\n\
    ldrb r4, [r6, 0x3]\n\
    lsls r4, 6\n\
    movs r6, 0x3F\n\
    ands r0, r6\n\
    orrs r0, r4\n\
    strb r0, [r5, 0x6]\n\
    mov r4, r9\n\
    ldrb r0, [r4, 0x4]\n\
    mov r5, r8\n\
    ands r0, r5\n\
    ldrb r5, [r7, 0x7]\n\
    mov r4, r10\n\
    ands r4, r5\n\
    orrs r4, r0\n\
    strb r4, [r7, 0x7]\n\
    mov r6, r9\n\
    ldrb r0, [r6, 0x5]\n\
    mov r5, r8\n\
    ands r0, r5\n\
    lsls r0, 2\n\
    movs r5, 0xD\n\
    negs r5, r5\n\
    ands r5, r4\n\
    orrs r5, r0\n\
    strb r5, [r7, 0x7]\n\
    ldrb r4, [r6, 0x6]\n\
    mov r6, r8\n\
    ands r4, r6\n\
    lsls r4, 4\n\
    movs r0, 0x31\n\
    negs r0, r0\n\
    ands r0, r5\n\
    orrs r0, r4\n\
    strb r0, [r7, 0x7]\n\
    mov r5, sp\n\
    mov r6, r9\n\
    ldrb r4, [r6, 0x7]\n\
    lsls r4, 6\n\
    movs r6, 0x3F\n\
    ands r0, r6\n\
    orrs r0, r4\n\
    strb r0, [r5, 0x7]\n\
    mov r8, sp\n\
    mov r0, r9\n\
    ldrb r4, [r0, 0x8]\n\
    movs r7, 0x3\n\
    adds r0, r7, 0\n\
    ands r0, r4\n\
    mov r4, r8\n\
    ldrb r5, [r4, 0x8]\n\
    mov r4, r10\n\
    ands r4, r5\n\
    orrs r4, r0\n\
    mov r5, r8\n\
    strb r4, [r5, 0x8]\n\
    mov r6, r9\n\
    ldrb r5, [r6, 0x9]\n\
    adds r0, r7, 0\n\
    ands r0, r5\n\
    lsls r0, 2\n\
    movs r5, 0xD\n\
    negs r5, r5\n\
    ands r5, r4\n\
    orrs r5, r0\n\
    mov r0, r8\n\
    strb r5, [r0, 0x8]\n\
    ldrb r0, [r1]\n\
    adds r4, r7, 0\n\
    ands r4, r0\n\
    lsls r4, 4\n\
    movs r0, 0x31\n\
    negs r0, r0\n\
    ands r0, r5\n\
    orrs r0, r4\n\
    mov r4, r8\n\
    strb r0, [r4, 0x8]\n\
    mov r5, sp\n\
    ldrb r4, [r2]\n\
    lsls r4, 6\n\
    movs r6, 0x3F\n\
    ands r0, r6\n\
    orrs r0, r4\n\
    strb r0, [r5, 0x8]\n\
    ldrb r4, [r3]\n\
    adds r0, r7, 0\n\
    ands r0, r4\n\
    ldrb r4, [r5, 0x9]\n\
    mov r6, r10\n\
    ands r6, r4\n\
    orrs r6, r0\n\
    mov r10, r6\n\
    strb r6, [r5, 0x9]\n\
    ldr r0, [sp, 0x40]\n\
    ldrb r4, [r0]\n\
    adds r0, r7, 0\n\
    ands r0, r4\n\
    lsls r0, 2\n\
    movs r4, 0xD\n\
    negs r4, r4\n\
    ands r6, r4\n\
    orrs r6, r0\n\
    str r6, [sp, 0x10]\n\
    strb r6, [r5, 0x9]\n\
    mov r4, sp\n\
    ldr r5, [sp, 0x44]\n\
    ldrb r0, [r5]\n\
    adds r6, r7, 0\n\
    ands r6, r0\n\
    lsls r0, r6, 4\n\
    subs r7, 0x34\n\
    ldr r5, [sp, 0x10]\n\
    ands r7, r5\n\
    orrs r7, r0\n\
    strb r7, [r4, 0x9]\n\
    mov r5, sp\n\
    ldrb r0, [r1, 0x4]\n\
    movs r6, 0x1\n\
    mov r12, r6\n\
    mov r4, r12\n\
    ands r4, r0\n\
    lsls r4, 6\n\
    movs r0, 0x41\n\
    negs r0, r0\n\
    mov r10, r0\n\
    ands r0, r7\n\
    orrs r0, r4\n\
    strb r0, [r5, 0x9]\n\
    ldrb r4, [r2, 0x4]\n\
    lsls r4, 7\n\
    movs r5, 0x7F\n\
    ands r0, r5\n\
    orrs r0, r4\n\
    mov r4, r8\n\
    strb r0, [r4, 0x9]\n\
    ldrb r4, [r3, 0x4]\n\
    mov r0, r12\n\
    ands r0, r4\n\
    mov r5, r8\n\
    ldrb r4, [r5, 0xA]\n\
    movs r7, 0x2\n\
    negs r7, r7\n\
    adds r5, r7, 0\n\
    ands r5, r4\n\
    orrs r5, r0\n\
    mov r6, r8\n\
    strb r5, [r6, 0xA]\n\
    mov r9, sp\n\
    ldr r4, [sp, 0x40]\n\
    ldrb r0, [r4, 0x4]\n\
    mov r4, r12\n\
    ands r4, r0\n\
    lsls r4, 1\n\
    movs r6, 0x3\n\
    negs r6, r6\n\
    mov r8, r6\n\
    mov r0, r8\n\
    ands r0, r5\n\
    orrs r0, r4\n\
    mov r4, r9\n\
    strb r0, [r4, 0xA]\n\
    ldr r6, [sp, 0x44]\n\
    ldrb r5, [r6, 0x4]\n\
    mov r4, r12\n\
    ands r4, r5\n\
    lsls r4, 2\n\
    movs r5, 0x5\n\
    negs r5, r5\n\
    ands r0, r5\n\
    orrs r0, r4\n\
    mov r4, r9\n\
    strb r0, [r4, 0xA]\n\
    mov r4, sp\n\
    ldrb r1, [r1, 0x8]\n\
    mov r0, r12\n\
    ands r0, r1\n\
    lsls r0, 2\n\
    ldrb r1, [r4, 0xB]\n\
    ands r5, r1\n\
    orrs r5, r0\n\
    strb r5, [r4, 0xB]\n\
    ldrb r1, [r2, 0x8]\n\
    mov r0, r12\n\
    ands r0, r1\n\
    lsls r0, 3\n\
    movs r1, 0x9\n\
    negs r1, r1\n\
    ands r1, r5\n\
    orrs r1, r0\n\
    strb r1, [r4, 0xB]\n\
    ldrb r2, [r3, 0x8]\n\
    mov r0, r12\n\
    ands r0, r2\n\
    lsls r0, 4\n\
    movs r2, 0x11\n\
    negs r2, r2\n\
    ands r2, r1\n\
    orrs r2, r0\n\
    strb r2, [r4, 0xB]\n\
    mov r3, sp\n\
    ldr r5, [sp, 0x40]\n\
    ldrb r0, [r5, 0x8]\n\
    mov r1, r12\n\
    ands r1, r0\n\
    lsls r1, 5\n\
    movs r0, 0x21\n\
    negs r0, r0\n\
    ands r0, r2\n\
    orrs r0, r1\n\
    strb r0, [r3, 0xB]\n\
    mov r2, sp\n\
    ldrb r1, [r6, 0x8]\n\
    mov r6, r12\n\
    ands r6, r1\n\
    lsls r1, r6, 6\n\
    mov r3, r10\n\
    ands r0, r3\n\
    orrs r0, r1\n\
    strb r0, [r2, 0xB]\n\
    ldr r4, [sp, 0x1C]\n\
    lsrs r3, r4, 21\n\
    ldrb r1, [r2, 0xA]\n\
    movs r0, 0x7\n\
    ands r0, r1\n\
    orrs r0, r3\n\
    strb r0, [r2, 0xA]\n\
    mov r1, sp\n\
    ldr r5, [sp, 0x4C]\n\
    movs r6, 0x1\n\
    ands r5, r6\n\
    lsls r2, r5, 1\n\
    ldrb r0, [r1, 0xB]\n\
    mov r3, r8\n\
    ands r3, r0\n\
    orrs r3, r2\n\
    mov r8, r3\n\
    strb r3, [r1, 0xB]\n\
    mov r0, sp\n\
    ldr r4, [sp, 0x50]\n\
    ands r4, r6\n\
    mov r5, r8\n\
    ands r5, r7\n\
    orrs r5, r4\n\
    strb r5, [r0, 0xB]\n\
    bl RfuPrepareSend0x2f00\n\
    add sp, 0x20\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
");
}
#endif

u32 sub_815A950(u32 unused, struct DodrioSubstruct_31A0 *arg0, struct DodrioSubstruct_31A0_2C *arg1, struct DodrioSubstruct_31A0_2C *arg2, struct DodrioSubstruct_31A0_2C *arg3, struct DodrioSubstruct_31A0_2C *arg4, struct DodrioSubstruct_31A0_2C *arg5, u8 *arg6, u32 *arg7, u32 *arg8)
{
    struct UnkPacket2 *packet;
    struct DodrioSubstruct_31A0_14 *ptr = &arg0->unk14;

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
    RfuPrepareSend0x2f00(&packet);
}

u32 sub_815AB04(u32 arg0, u8 *arg1)
{
    struct UnkPacket3 *packet;

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
    RfuPrepareSend0x2f00(&packet);
}

u32 sub_815AB60(u32 arg0)
{
    struct UnkPacket4 *packet;

    if ((gRecvCmds[0][0] & 0xFF00) != 0x2F00)
        return 0;

    packet = (void *)&gRecvCmds[arg0][1];
    if (packet->id == 4)
        return packet->unk4;

    return 0;
}
