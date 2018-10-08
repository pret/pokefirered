#include "global.h"
#include "mevent.h"
#include "random.h"
#include "event_data.h"

#ifdef NONMATCHING
void sub_8146C30(u32 a0)
{
    struct MysteryEventStruct *r5 = sub_8143D94();

    r5->unk_0_0 = a0;
    asm_comment("The switch logic does not match.  Specifically, the \"bhi\" is replaced with a \"bls\" and the comparisons with 1 and 3 are swapped chronologically.");
    switch (a0)
    {
        case 0:
            r5->unk_1 = (Random() % 15) + 16;
            break;
        case 1:
            break;
        case 2:
            break;
        case 3:
            r5->unk_1 = (Random() % 15) + 1;
            break;
    }
}
#else
NAKED
void sub_8146C30(u32 a0)
{
    asm_unified("\tpush {r4,r5,lr}\n"
                "\tadds r4, r0, 0\n"
                "\tbl sub_8143D94\n"
                "\tadds r5, r0, 0\n"
                "\tmovs r0, 0x3\n"
                "\tadds r1, r4, 0\n"
                "\tands r1, r0\n"
                "\tldrb r2, [r5]\n"
                "\tmovs r0, 0x4\n"
                "\tnegs r0, r0\n"
                "\tands r0, r2\n"
                "\torrs r0, r1\n"
                "\tstrb r0, [r5]\n"
                "\tcmp r4, 0x2\n"
                "\tbhi _08146C56\n"
                "\tcmp r4, 0x1\n"
                "\tbcs _08146C5C\n"
                "\tb _08146C80\n"
                "_08146C56:\n"
                "\tcmp r4, 0x3\n"
                "\tbeq _08146C6E\n"
                "\tb _08146C80\n"
                "_08146C5C:\n"
                "\tbl Random\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tmovs r1, 0xF\n"
                "\tbl __umodsi3\n"
                "\tadds r0, 0x10\n"
                "\tb _08146C7E\n"
                "_08146C6E:\n"
                "\tbl Random\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tmovs r1, 0xF\n"
                "\tbl __umodsi3\n"
                "\tadds r0, 0x1\n"
                "_08146C7E:\n"
                "\tstrb r0, [r5, 0x1]\n"
                "_08146C80:\n"
                "\tpop {r4,r5}\n"
                "\tpop {r0}\n"
                "\tbx r0");
}
#endif

void sub_8146C88(void)
{
    struct MysteryEventStruct *r5 = sub_8143D94();

    r5->unk_0_0 = 0;
    r5->unk_0_2 = 0;
    r5->unk_0_5 = 0;
    r5->unk_1 = 0;
    VarSet(0x4028, 0);
}

void sub_8146CA4(void)
{
    u16 *r4 = sub_806E454(0x4028);
    struct MysteryEventStruct *r5 = sub_8143D94();
    struct MysteryEventStruct r0 = *r5;

    if ((u8)r0.unk_0_5 > 4 && ++(*r4) > 0x1f3)
    {
        r5->unk_0_5 = 0;
        *r4 = 0;
    }
}
