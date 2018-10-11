#include "global.h"
#include "script.h"
#include "event_data.h"
#include "quest_log.h"

u8 gUnknown_3005E88;

struct UnkStruct_203AE94
{
    u8 unk_0_0:4;
    u8 unk_0_4:2;
    u8 unk_0_6:2;
    u8 unk_1;
};

EWRAM_DATA u8 gUnknown_203ADF8 = 0;
EWRAM_DATA u8 gUnknown_203ADFA = 0;
EWRAM_DATA u16 gUnknown_203ADFC = 0;
EWRAM_DATA void * gUnknown_203AE04 = NULL;
EWRAM_DATA void * gUnknown_203AE08 = NULL;
EWRAM_DATA void * gUnknown_203AE0C[32] = {NULL};
EWRAM_DATA void (* gUnknown_203AE8C)(void) = 0;
EWRAM_DATA struct UnkStruct_203AE94 gUnknown_203AE94 = {0};
EWRAM_DATA u8 gUnknown_203AE98[0x100] = {0};

void sub_8110A00(void);
void sub_8110A3C(void);
void sub_8110BB0(u8);
void sub_8110BE8(u8);
void sub_815A008(struct QuestLog *);
void sub_8110E3C(void);
u8 sub_8110E68(void *);
void sub_81118F4(s8);
void sub_8111AD8(void);
void sub_8113B88(void);
void sub_8113BD8(void);
void sub_81138F8(void);
void sub_81115E8(void);
void sub_8110D94(void);
void sub_8110E20(void);
void sub_8110D48(u8);
void sub_8112940(u8, u8 *, u16);


void sub_8110840(void * a0)
{
    size_t r1 = (void *)gSaveBlock1Ptr - a0;
    if (gUnknown_203AE04)
        gUnknown_203AE04 += r1;
    if (gUnknown_203ADFA != 0)
    {
        if (gUnknown_203AE08)
            gUnknown_203AE08 += r1;
        if (gUnknown_203ADFA == 2)
        {
            int r3;
            for (r3 = 0; r3 < 0x20; r3++)
                if (gUnknown_203AE0C[r3])
                    gUnknown_203AE0C[r3] += r1;
        }
    }
}

void sub_811089C(void)
{
    memset(gSaveBlock1Ptr->questLog, 0, sizeof(gSaveBlock1Ptr->questLog));
    gUnknown_203ADF8 = 0;
    gUnknown_203ADFA = 0;
    gUnknown_203AE8C = 0;
    gUnknown_203AE08 = 0;
    gUnknown_203AE04 = 0;
    sub_8113BD8();
    sub_81138F8();
}

void sub_81108F0(u8 a0)
{
    memset(gSaveBlock1Ptr->questLog + a0, 0, sizeof(struct QuestLog));
    gUnknown_203AE04 = NULL;
}

void sub_8110920(void)
{
    gUnknown_203AE04 = NULL;
}

void sub_811092C(void)
{
    if (gUnknown_203AE8C)
        gUnknown_203AE8C();
}

bool8 sub_8110944(u8 * a0, size_t a1)
{
    u8 * r2 = gSaveBlock1Ptr->questLog[gUnknown_203ADF8].filler_568;
    u8 * r0 = gSaveBlock1Ptr->questLog[gUnknown_203ADF8].end;
    r0 -= a1;
    if (a0 < r2 || a0 > r0)
        return FALSE;
    return TRUE;
}

bool8 sub_8110988(u8 * a0, size_t a1)
{
    u8 * r2 = gSaveBlock1Ptr->questLog[gUnknown_203ADF8].filler_568;
    u8 * r0 = gSaveBlock1Ptr->questLog[gUnknown_203ADF8].end;
    r0 -= a1;
    if (a0 < r2 || a0 > r0)
        return FALSE;
    return TRUE;
}

void sub_81109CC(u8 a0)
{
    gUnknown_203ADFA = a0;
    if (a0 == 1)
        gUnknown_203AE8C = sub_8110A00;
    else
        gUnknown_203AE8C = sub_8110A3C;
}

void sub_8110A00(void)
{
    if (sub_8110E68(gUnknown_203AE98) != 1)
    {
        gUnknown_3005E88 = 0;
        sub_8110E3C();
        gUnknown_203ADFA = 0;
        gUnknown_203AE8C = NULL;
    }
}

void sub_8110A3C(void)
{
    if (gUnknown_203AE94.unk_0_0 == 2)
        gUnknown_203AE94.unk_0_0 = 0;

    if (gUnknown_203AE94.unk_0_6 == 0)
    {
        if (gUnknown_3005E88 || gUnknown_203AE94.unk_0_0 == 1 || (gUnknown_203AE94.unk_1 < 32 && gUnknown_203AE0C[gUnknown_203AE94.unk_1]))
            sub_8111AD8();
        else
        {
            gUnknown_203AE94.unk_0_6 = 2;
            ScriptContext2_Enable();
            sub_81118F4(0);
        }
    }
}

void sub_8110AB4(void)
{
    gUnknown_20370D0 = gUnknown_203ADFA;
}

u8 sub_8110AC8(void)
{
    return gSaveBlock1Ptr->questLog[gUnknown_203ADF8].unk_000;
}

void sub_8110AEC(u16 a0)
{
    if (gUnknown_203ADF8 > 3)
        gUnknown_203ADF8 = 0;

    sub_81108F0(gUnknown_203ADF8);
    sub_8113B88();
    gUnknown_203AE08 = gSaveBlock1Ptr->questLog[gUnknown_203ADF8].filler_568;
    if ((a0 >= 12 && a0 < 20) || a0 == 35)
        gSaveBlock1Ptr->questLog[gUnknown_203ADF8].unk_000 = 2;
    else
        gSaveBlock1Ptr->questLog[gUnknown_203ADF8].unk_000 = 1;
    sub_81115E8();
    sub_8110BB0(gUnknown_203ADF8);
    sub_8110BE8(gUnknown_203ADF8);
    sub_8110D94();
    sub_8110E20();
    sub_8110D48(gUnknown_203ADF8);
    gUnknown_203ADFC = 0;
    sub_8112940(2, gUnknown_203AE98, 0x100);
    sub_8110E68(gUnknown_203AE98);
    sub_81109CC(1);
}

void sub_8110BB0(u8 a0)
{
    struct QuestLog * questLog = &gSaveBlock1Ptr->questLog[a0];
    questLog->unk_001 = gSaveBlock1Ptr->location.mapGroup;
    questLog->unk_002 = gSaveBlock1Ptr->location.mapNum;
    questLog->unk_003 = gSaveBlock1Ptr->location.warpId;
    questLog->unk_004 = gSaveBlock1Ptr->pos.x;
    questLog->unk_006 = gSaveBlock1Ptr->pos.y;
}

#ifdef NONMATCHING
void sub_8110BE8(u8 a0)
{
    struct QuestLog * questLog = &gSaveBlock1Ptr->questLog[a0];
    u16 i; // r6

    sub_815A008(questLog);

    for (i = 0; i < ARRAY_COUNT(gSaveBlock1Ptr->mapObjectTemplates); i++)
    {
        if (gSaveBlock1Ptr->mapObjectTemplates[i].x < 0)
        {
            questLog->npcData[i].x = (u8)-gSaveBlock1Ptr->mapObjectTemplates[i].x;
            questLog->npcData[i].negx = TRUE;
        }
        else
        {
            questLog->npcData[i].x = (u8)gSaveBlock1Ptr->mapObjectTemplates[i].x;
            questLog->npcData[i].negx = FALSE;
        }
        if (gSaveBlock1Ptr->mapObjectTemplates[i].y < 0)
        {
            questLog->npcData[i].y = (u8)-gSaveBlock1Ptr->mapObjectTemplates[i].y;
            questLog->npcData[i].negy = TRUE;
        }
        else
        {
            questLog->npcData[i].y = (u8)gSaveBlock1Ptr->mapObjectTemplates[i].y;
            questLog->npcData[i].negy = FALSE;
        }
        questLog->npcData[i].elevation = gSaveBlock1Ptr->mapObjectTemplates[i].elevation;
        questLog->npcData[i].movementType = gSaveBlock1Ptr->mapObjectTemplates[i].movementType;
    }
}
#else
NAKED
void sub_8110BE8(u8 a0)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tldr r4, =gSaveBlock1Ptr\n"
                "\tmovs r1, 0xCD\n"
                "\tlsls r1, 3\n"
                "\tmuls r0, r1\n"
                "\tmovs r1, 0x98\n"
                "\tlsls r1, 5\n"
                "\tadds r0, r1\n"
                "\tldr r1, [r4]\n"
                "\tadds r7, r1, r0\n"
                "\tadds r0, r7, 0\n"
                "\tbl sub_815A008\n"
                "\tmovs r6, 0\n"
                "\tmov r9, r4\n"
                "\tmovs r2, 0x8D\n"
                "\tlsls r2, 3\n"
                "\tmov r8, r2\n"
                "\tldr r3, =0x0000046a\n"
                "\tmov r10, r3\n"
                "_08110C1C:\n"
                "\tmov r4, r9\n"
                "\tldr r1, [r4]\n"
                "\tlsls r2, r6, 1\n"
                "\tadds r0, r2, r6\n"
                "\tlsls r0, 3\n"
                "\tadds r1, r0\n"
                "\tldr r0, =0x000008e4\n"
                "\tadds r1, r0\n"
                "\tldrh r4, [r1]\n"
                "\tmovs r3, 0\n"
                "\tldrsh r0, [r1, r3]\n"
                "\tmov r12, r2\n"
                "\tcmp r0, 0\n"
                "\tbge _08110C64\n"
                "\tlsls r3, r6, 2\n"
                "\tadds r2, r7, r3\n"
                "\tnegs r0, r0\n"
                "\tmov r4, r8\n"
                "\tadds r1, r2, r4\n"
                "\tstrb r0, [r1]\n"
                "\tldr r0, =0x00000469\n"
                "\tadds r2, r0\n"
                "\tldrb r0, [r2]\n"
                "\tmovs r1, 0x1\n"
                "\torrs r0, r1\n"
                "\tstrb r0, [r2]\n"
                "\tb _08110C7C\n"
                "\t.pool\n"
                "_08110C64:\n"
                "\tlsls r3, r6, 2\n"
                "\tadds r1, r7, r3\n"
                "\tmov r2, r8\n"
                "\tadds r0, r1, r2\n"
                "\tstrb r4, [r0]\n"
                "\tldr r4, =0x00000469\n"
                "\tadds r1, r4\n"
                "\tldrb r2, [r1]\n"
                "\tmovs r0, 0x2\n"
                "\tnegs r0, r0\n"
                "\tands r0, r2\n"
                "\tstrb r0, [r1]\n"
                "_08110C7C:\n"
                "\tadds r5, r3, 0\n"
                "\tmov r1, r9\n"
                "\tldr r0, [r1]\n"
                "\tmov r2, r12\n"
                "\tadds r1, r2, r6\n"
                "\tlsls r1, 3\n"
                "\tadds r0, r1\n"
                "\tldr r3, =0x000008e6\n"
                "\tadds r1, r0, r3\n"
                "\tldrh r2, [r1]\n"
                "\tmovs r4, 0\n"
                "\tldrsh r0, [r1, r4]\n"
                "\tcmp r0, 0\n"
                "\tbge _08110CC8\n"
                "\tadds r3, r7, r5\n"
                "\tadds r1, r0, 0\n"
                "\tnegs r1, r1\n"
                "\tlsls r1, 24\n"
                "\tmov r2, r8\n"
                "\tadds r4, r3, r2\n"
                "\tlsrs r1, 15\n"
                "\tldr r0, [r4]\n"
                "\tldr r2, =0xfffe01ff\n"
                "\tands r0, r2\n"
                "\torrs r0, r1\n"
                "\tstr r0, [r4]\n"
                "\tadd r3, r10\n"
                "\tldrb r0, [r3]\n"
                "\tmovs r1, 0x2\n"
                "\torrs r0, r1\n"
                "\tb _08110CE6\n"
                "\t.pool\n"
                "_08110CC8:\n"
                "\tadds r3, r7, r5\n"
                "\tlsls r2, 24\n"
                "\tmov r0, r8\n"
                "\tadds r4, r3, r0\n"
                "\tlsrs r2, 15\n"
                "\tldr r0, [r4]\n"
                "\tldr r1, =0xfffe01ff\n"
                "\tands r0, r1\n"
                "\torrs r0, r2\n"
                "\tstr r0, [r4]\n"
                "\tadd r3, r10\n"
                "\tldrb r1, [r3]\n"
                "\tmovs r0, 0x3\n"
                "\tnegs r0, r0\n"
                "\tands r0, r1\n"
                "_08110CE6:\n"
                "\tstrb r0, [r3]\n"
                "\tadds r5, r7, r5\n"
                "\tmov r1, r9\n"
                "\tldr r0, [r1]\n"
                "\tmov r2, r12\n"
                "\tadds r3, r2, r6\n"
                "\tlsls r3, 3\n"
                "\tadds r0, r3\n"
                "\tldr r4, =0x000008e8\n"
                "\tadds r0, r4\n"
                "\tldrb r1, [r0]\n"
                "\tmov r0, r10\n"
                "\tadds r4, r5, r0\n"
                "\tlsls r1, 2\n"
                "\tldrb r2, [r4]\n"
                "\tmovs r0, 0x3\n"
                "\tands r0, r2\n"
                "\torrs r0, r1\n"
                "\tstrb r0, [r4]\n"
                "\tmov r1, r9\n"
                "\tldr r0, [r1]\n"
                "\tadds r0, r3\n"
                "\tldr r2, =0x000008e9\n"
                "\tadds r0, r2\n"
                "\tldrb r0, [r0]\n"
                "\tldr r3, =0x0000046b\n"
                "\tadds r5, r3\n"
                "\tstrb r0, [r5]\n"
                "\tadds r0, r6, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r6, r0, 16\n"
                "\tcmp r6, 0x3F\n"
                "\tbhi _08110D2A\n"
                "\tb _08110C1C\n"
                "_08110D2A:\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.pool");
}
#endif // NONMATCHING

void sub_8110D48(u8 a0)
{
    struct QuestLog * questLog = &gSaveBlock1Ptr->questLog[a0];

    CpuCopy16(gSaveBlock1Ptr->flags, questLog->unk_148, 0x120);
    CpuCopy16(gSaveBlock1Ptr->vars, questLog->unk_268, 0x200);
}

void sub_8110D94(void)
{
    u16 i, j;
    u16 sp0[4];

    for (i = 0; i < 4; i++)
    {
        sp0[i] = 0;
        for (j = 0; j < 16; j++)
        {
            if (gSaveBlock1Ptr->trainerRematches[16 * i + j])
            {
                sp0[i] += (1 << j);
            }
        }
        VarSet(VAR_0x40AA + i, sp0[i]);
    }
}

void sub_8110E20(void)
{
    VarSet(VAR_0x40AE, gSaveBlock1Ptr->mapDataId);
}
