#include "global.h"
#include "constants/species.h"
#include "constants/items.h"
#include "data2.h"
#include "malloc.h"
#include "main.h"
#include "task.h"
#include "palette.h"
#include "menu.h"
#include "random.h"
#include "menu_helpers.h"
#include "window.h"
#include "text_window.h"
#include "unk_text_util.h"
#include "event_data.h"
#include "event_scripts.h"
#include "string_util.h"
#include "script.h"
#include "overworld.h"
#include "field_fadetransition.h"
#include "field_weather.h"
#include "field_map_obj.h"
#include "map_obj_80688E4.h"
#include "map_obj_lock.h"
#include "field_player_avatar.h"
#include "field_control_avatar.h"
#include "battle.h"
#include "item.h"
#include "region_map.h"
#include "map_name_popup.h"
#include "wild_encounter.h"
#include "help_system.h"
#include "party_menu.h"
#include "unk_8159F40.h"
#include "pokemon_storage_system.h"
#include "save.h"
#include "link.h"
#include "quest_log_8150454.h"
#include "quest_log.h"

u8 gUnknown_3005E88;

struct Var4038Struct
{
    u8 unk_0_0:7;
    u8 unk_0_7:1;
    u8 unk_1;
};

#define VAR_0x4038_STRUCT ((struct Var4038Struct *)GetVarPointer(VAR_0x4038))

struct UnkStruct_203AE94
{
    u8 unk_0_0:4;
    u8 unk_0_4:2;
    u8 unk_0_6:2;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
};

struct UnkStruct_203AE98
{
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
    u16 unk_4;
    u8 unk_6;
};

struct UnkStruct_300201C
{
    u16 unk_0_0:15;
    u16 unk_0_f:1;
    u16 unk_2;
};

struct UnkStruct_203B044
{
    u8 unk_0;
    u8 unk_1;
    u16 unk_2;
};

u8 gUnknown_3005E88;
u16 gUnknown_3005E8C;
struct UnkStruct_3005E90 gUnknown_3005E90;
struct UnkStruct_203AE98 * gUnknown_3005E94;

IWRAM_DATA struct UnkStruct_300201C * gUnknown_300201C;
IWRAM_DATA u16 gUnknown_3002020;

EWRAM_DATA u8 gUnknown_203ADF8 = 0;
EWRAM_DATA u8 gUnknown_203ADF9 = 0;
EWRAM_DATA u8 gUnknown_203ADFA = 0;
EWRAM_DATA u16 gUnknown_203ADFC = 0;
EWRAM_DATA u8 gUnknown_203ADFE[3] = {0};
EWRAM_DATA u16 * gUnknown_203AE04 = NULL;
EWRAM_DATA u16 * gUnknown_203AE08 = NULL;
EWRAM_DATA u16 * gUnknown_203AE0C[32] = {NULL};
EWRAM_DATA void (* gUnknown_203AE8C)(void) = NULL;
EWRAM_DATA u16 *gUnknown_203AE90 = NULL;
EWRAM_DATA struct UnkStruct_203AE94 gUnknown_203AE94 = {0};
EWRAM_DATA struct UnkStruct_203AE98 gUnknown_203AE98[32] = {0};
EWRAM_DATA u16 gUnknown_203AF98 = 0;
EWRAM_DATA u8 gUnknown_203AF9A[64][2] = {{0}};
EWRAM_DATA u16 gUnknown_203B01A = 0;
EWRAM_DATA u16 gUnknown_203B01C = 0;
EWRAM_DATA u16 gUnknown_203B01E = 0;
EWRAM_DATA u8 gUnknown_203B020 = 0;
EWRAM_DATA struct UnkStruct_203B024 gUnknown_203B024 = {0};
EWRAM_DATA struct UnkStruct_203B044 gUnknown_203B044 = {0};
EWRAM_DATA u8 gUnknown_203B048 = 0;
EWRAM_DATA u8 gUnknown_203B049 = 0;
EWRAM_DATA u8 gUnknown_203B04A = 0;
EWRAM_DATA u8 gUnknown_203B04B = 0;

void sub_8110A00(void);
void sub_8110A3C(void);
void sub_8110BB0(u8);
void sub_8110BE8(u8);
void sub_8110E3C(void);
void sub_8110D94(void);
void sub_8110E20(void);
void sub_8110D48(u8);
u8 sub_8110E68(struct UnkStruct_203AE98 *);
void sub_8110F90(u8);
void sub_8111150(u8);
void sub_8111368(void);
void sub_81115E8(void);
u16 sub_8111618(void);
u16 sub_811164C(void);
void sub_8111688(void);
void sub_811175C(u8, struct UnkStruct_203AE98 *);
void sub_81118F4(s8);
void sub_8111914(void);
void sub_8111984(void);
void sub_8111A34(u8);
void sub_8111AD8(void);
void sub_8111B80(void);
u8 sub_8111BD4(void);
void sub_8111D10(void);
void sub_8111D90(u8);
void sub_8111E20(void);
void sub_8111E64(s8);
void sub_8111E84(void);
bool8 sub_8111F60(void);
void sub_8111F8C(u8);
void sub_8111FCC(u8);
void sub_8112044(u8);
void sub_81120AC(u8);
bool8 sub_81121D8(u8);
void sub_811229C(void);
void sub_8112364(void);
void sub_8112888(u8);
void sub_8112940(u8, struct UnkStruct_203AE98 *, u16);
u8 sub_8112CAC(void);
bool8 sub_8112CEC(void);
bool8 sub_8112D1C(void);
void sub_8113078(struct Var4038Struct *);
void sub_81130BC(struct Var4038Struct *);
u8 sub_8113194(struct Var4038Struct *);
u16 sub_81132A0(struct Var4038Struct *);
void sub_81132E0(struct Var4038Struct *);
bool16 sub_811337C(struct Var4038Struct *);
void sub_8113390(struct Var4038Struct *);
void sub_8113414(u8 (*)[16], u8, u8);
void sub_81134CC(struct Var4038Struct *);
bool8 sub_8113508(struct Var4038Struct * );
void sub_8113524(struct Var4038Struct *);
bool8 sub_81136D4(void);
bool8 sub_8113778(u16, u16 *);
bool8 sub_81137E4(u16, u16 *);
u16 * sub_8113828(u16, u16 *);
bool8 sub_81138A0(u16, u16 *);
bool8 sub_8113954(u16, u16 *);
void sub_8113A1C(u16);
void sub_811381C(void);
void sub_81138F8(void);
bool8 sub_8113A44(u16, u16 *);
u16 * sub_8113A78(u16 *, u16 **);
void sub_8113ABC(u16 *);
bool8 sub_8113AE8(u16 *);
bool8 sub_8113B44(u16 *);
void sub_8113B88(void);
void sub_8113B94(u16);
void sub_8113BD8(void);
u16 * sub_8113BF4(u16 *);
u16 * sub_8113C20(u16 *, struct UnkStruct_203AE98 *);
u16 * sub_8113C5C(u16 *, u16);
u16 * sub_8113C8C(u16 *, struct UnkStruct_203AE98 *);
u16 * sub_8113CC8(u16 *, struct UnkStruct_203AE98 *);
u16 * sub_8113D08(u16 *, struct UnkStruct_203AE98 *);
u16 * sub_8113D48(u16 *, struct UnkStruct_203AE98 *);
u16 * sub_8113D94(u16 *, struct UnkStruct_203AE98 *);
u16 *sub_8113F14(u16 *, u16 *);
u16 *sub_8113F3C(u16 *);
u16 *sub_8113F80(u16 *, u16 *);
u16 *sub_8113FBC(u16 *);
u16 *sub_8114174(u16 *, u16 *);
u16 *sub_8114188(u16 *);
u16 *sub_81141D0(u16 *, u16 *);
u16 *sub_81141E4(u16 *);
u16 *sub_811422C(u16 *, u16 *);
u16 *sub_8114240(u16 *);
u16 *sub_8114288(u16 *, u16 *);
u16 *sub_811429C(u16 *);
u16 *sub_8114310(u16 *, u16 *);
u16 *sub_8114324(u16 *);
u16 *sub_8114380(u16 *, u16 *);
u16 *sub_8114394(u16 *);
u16 *sub_81143F0(u16 *, u16 *);
u16 *sub_811443C(u16 *);
u16 *sub_811445C(u16 *, u16 *);
u16 *sub_811448C(u16 *);
u16 *sub_81144EC(u16 *, u16 *);
u16 *sub_8114518(u16 *);
u16 *sub_8114578(u16 *, u16 *);
u16 *sub_81145A4(u16 *);
u16 *sub_8114604(u16 *, u16 *);
u16 *sub_811464C(u16 *);
u16 *sub_8114710(u16 *, u16 *);
u16 *sub_8114724(u16 *);
u16 *sub_8114744(u16 *, u16 *);
u16 *sub_8114758(u16 *);
u16 *sub_8114778(u16 *, u16 *);
u16 *sub_81147A8(u16 *);
u16 *sub_8114808(u16 *, u16 *);
u16 *sub_8114834(u16 *);
u16 *sub_811488C(u16 *, u16 *);
u16 *sub_81148BC(u16 *);
u16 *sub_8114918(u16 *, u16 *);
u16 *sub_8114944(u16 *);
u16 *sub_8114990(u16 *, u16 *);
u16 *sub_81149D0(u16 *);
u16 *sub_8114A1C(u16 *, u16 *);
u16 *sub_8114A4C(u16 *);
u16 *sub_8114AA0(u16 *, u16 *);
u16 *sub_8114AC8(u16 *);
u16 *sub_8114B0C(u16 *, u16 *);
u16 *sub_8114B34(u16 *);
u16 *sub_8114B78(u16 *, u16 *);
u16 *sub_8114BA0(u16 *);
u16 *sub_8114BE4(u16 *, u16 *);
u16 *sub_8114C0C(u16 *);
u16 *sub_8114C68(u16 *, u16 *);
u16 *sub_8114C8C(u16 *);
u16 *sub_8114CC0(u16 *, u16 *);
u16 *sub_8114CE4(u16 *);
u16 *sub_8114D4C(u16 *, u16 *);
u16 *sub_8114D68(u16 *);
u16 *sub_8114DE8(u16 *, u16 *);
u16 *sub_8114E68(u16 *);
bool8 sub_8114FBC(u16);
u16 *sub_8114FF0(u16 *, u16 *);
u16 *sub_811500C(u16 *);
u16 *sub_8115078(u16 *, u16 *);
u16 *sub_81150CC(u16 *);
u16 *sub_81151C0(u16 *, u16 *);
u16 *sub_81151DC(u16 *);
u16 *sub_8115280(u16 *, u16 *);
u16 *sub_81152BC(u16 *);
u16 *sub_8115410(u16 *, u16 *);
u16 *sub_8115460(u16 *);
u16 *sub_81154DC(u16 *, u16 *);
u16 *sub_8115518(u16 *);
u16 *sub_81155A4(u16 *, u16 *);
u16 *sub_81155E0(u16 *);
u16 *sub_81156D8(u16 *, u16 *);
u16 *sub_8115700(u16 *);
u16 *sub_81157DC(u16 *, u16 *);
u16 *sub_8115800(u16 *);
bool8 sub_81153A8(u16, void*);
bool8 sub_81153E4(u16, void*);

extern const u8 gUnknown_841A155[];
extern const u8 gUnknown_841A16F[];
extern const u8 gUnknown_841B073[];
extern const u8 gUnknown_841AFA6[];
extern const u8 gUnknown_841A1E7[];
extern const u8 gUnknown_841A210[];
extern const u8 gUnknown_841A220[];
extern const u8 gUnknown_841A965[];
extern const u8 gUnknown_841A277[];
extern const u8 gUnknown_841A938[];
extern const u8 gUnknown_841A255[];

const struct WindowTemplate gUnknown_845661C[3] = {
    { 0, 0,  0, 30, 2, 15, 0x0e9 },
    { 0, 0, 18, 30, 2, 15, 0x0ad },
    { 0, 0, 14, 30, 6, 15, 0x14c }
};

const struct TextColor gUnknown_8456634 = {15, 1, 12};

const u16 gUnknown_8456638[] = INCBIN_U16("data/graphics/unknown_8456638.bin");

const u8 gUnknown_8456698[] = {17, 10, 3};

void sub_8110840(void * oldPointer)
{
    ptrdiff_t offset = (void *)gSaveBlock1Ptr - oldPointer;
    if (gUnknown_203AE04)
        gUnknown_203AE04 = (void *)gUnknown_203AE04 + offset;
    if (gUnknown_203ADFA != 0)
    {
        if (gUnknown_203AE08)
            gUnknown_203AE08 = (void *)gUnknown_203AE08 + offset;
        if (gUnknown_203ADFA == 2)
        {
            int r3;
            for (r3 = 0; r3 < 0x20; r3++)
                if (gUnknown_203AE0C[r3])
                    gUnknown_203AE0C[r3] = (void *)gUnknown_203AE0C[r3] + offset;
        }
    }
}

void sub_811089C(void)
{
    memset(gSaveBlock1Ptr->questLog, 0, sizeof(gSaveBlock1Ptr->questLog));
    gUnknown_203ADF8 = 0;
    gUnknown_203ADFA = 0;
    gUnknown_203AE8C = 0;
    gUnknown_203AE08 = NULL;
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

bool8 sub_8110944(void * a0, size_t a1)
{
    void * r2 = gSaveBlock1Ptr->questLog[gUnknown_203ADF8].unk_568;
    void * r0 = gSaveBlock1Ptr->questLog[gUnknown_203ADF8].end;
    r0 -= a1;
    if ((void *)a0 < r2 || (void *)a0 > r0)
        return FALSE;
    return TRUE;
}

bool8 sub_8110988(u16 * a0, size_t a1)
{
    void * r2 = gSaveBlock1Ptr->questLog[gUnknown_203ADF8].unk_568;
    void * r0 = gSaveBlock1Ptr->questLog[gUnknown_203ADF8].end;
    r0 -= a1;
    if ((void *)a0 < r2 || (void *)a0 > r0)
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
    gUnknown_203AE08 = (u16 *)gSaveBlock1Ptr->questLog[gUnknown_203ADF8].unk_568;
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

    CpuCopy16(gSaveBlock1Ptr->flags, questLog->unk_148, FLAGS_COUNT * sizeof(u8));
    CpuCopy16(gSaveBlock1Ptr->vars, questLog->unk_268, VARS_COUNT * sizeof(u16));
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

void sub_8110E3C(void)
{
    sub_8113BF4(gUnknown_203AE08);
    if (++gUnknown_203ADF8 > 3)
        gUnknown_203ADF8 = 0;
}

bool8 sub_8110E68(struct UnkStruct_203AE98 * a0)
{
    u16 i;

    for (i = gUnknown_203ADFC; i < gUnknown_203AF98; i++)
    {
        if (gUnknown_203AE08 == NULL)
            return FALSE;
        switch (a0[i].unk_6)
        {
            case 0:
            case 1:
                gUnknown_203AE08 = sub_8113D48(gUnknown_203AE08, &a0[i]);
                break;
            default:
                gUnknown_203AE08 = sub_8113CC8(gUnknown_203AE08, &a0[i]);
                break;
        }
        if (gUnknown_203AE08 == NULL)
        {
            gUnknown_3005E88 = 0;
            return FALSE;
        }
    }

    if (gUnknown_3005E88 == 0)
    {
        gUnknown_203AE08 = sub_8113BF4(gUnknown_203AE08);
        return FALSE;
    }
    gUnknown_203ADFC = gUnknown_203AF98;
    return TRUE;
}

void sub_8110F14(u8 taskId)
{
    u8 i;

    sub_811381C();
    gUnknown_203ADF9 = 0;
    for (i = 0; i < 4; i++)
    {
        if (gSaveBlock1Ptr->questLog[i].unk_000)
            gUnknown_203ADF9++;
    }

    if (gUnknown_203ADF9 != 0)
    {
        gUnknown_3005ECC = FALSE;
        sub_8110F90(taskId);
        DestroyTask(taskId);
    }
    else
    {
        SetMainCallback2(sub_8056938);
        DestroyTask(taskId);
    }
}

void sub_8110F90(u8 unused)
{
    gSaveBlock1Ptr->location.mapGroup = 3;
    gSaveBlock1Ptr->location.mapNum = 19;
    gSaveBlock1Ptr->location.warpId = -1;
    gUnknown_203ADF8 = 0;
    gUnknown_2031DD8 = 1;
    sub_8082740(1);
    sub_8111368();
}

void sub_8110FCC(void)
{
    sub_811175C(gUnknown_203ADF8, gUnknown_203AE98);
    sub_8113B88();
    sub_8112940(1, gUnknown_203AE98, 0x100);
    sub_8111150(gUnknown_203ADF8);
}

bool8 sub_8111000(void)
{
    LoadPalette(stdpal_get(4), 0xF0, 0x20);
    sub_81109CC(2);
    sub_807DF64();
    gUnknown_203AE94 = (struct UnkStruct_203AE94){};
    gUnknown_203AE94.unk_0_0 = 2;
    return 1;
}

bool8 sub_8111038(void)
{
    LoadPalette(stdpal_get(4), 0xF0, 0x20);
    sub_81109CC(2);
    sub_807DF7C();
    gUnknown_203AE94 = (struct UnkStruct_203AE94){};
    gUnknown_203AE94.unk_0_0 = 2;
    return 1;
}

void sub_8111070(u8 a0)
{
    u8 i;

    for (i = 0; i < 3; i++)
    {
        gUnknown_203ADFE[i] = AddWindow(&gUnknown_845661C[i]);
        FillWindowPixelRect(gUnknown_203ADFE[i], 15, 0, 0, gUnknown_845661C[i].width * 8, gUnknown_845661C[i].height * 8);
    }

    // _("Previously on your quest…$")
    StringExpandPlaceholders(gStringVar4, gUnknown_841A155);

    if (a0)
    {
        ConvertIntToDecimalStringN(gStringVar1, a0, STR_CONV_MODE_LEFT_ALIGN, 1);
        StringAppend(gStringVar4, gStringVar1);
    }

    AddTextPrinterParametrized2(gUnknown_203ADFE[0], 2, 2, 2, 1, 2, &gUnknown_8456634, 0, gStringVar4);
    PutWindowTilemap(gUnknown_203ADFE[0]);
    PutWindowTilemap(gUnknown_203ADFE[1]);
    CopyWindowToVram(gUnknown_203ADFE[0], 2);
    CopyWindowToVram(gUnknown_203ADFE[2], 2);
    CopyWindowToVram(gUnknown_203ADFE[1], 3);
}

void sub_8111134(void)
{
    PutWindowTilemap(gUnknown_203ADFE[1]);
    CopyWindowToVram(gUnknown_203ADFE[1], 1);
}

void sub_8111150(u8 a0)
{
    struct QuestLog *questLog = &gSaveBlock1Ptr->questLog[a0];
    u16 i;
    
    for (i = 0; i < 64; i++)
    {
        if (questLog->npcData[i].negx)
            gSaveBlock1Ptr->mapObjectTemplates[i].x = -questLog->npcData[i].x;
        else
            gSaveBlock1Ptr->mapObjectTemplates[i].x = questLog->npcData[i].x;
        if (questLog->npcData[i].negy)
            gSaveBlock1Ptr->mapObjectTemplates[i].y = -(u8)questLog->npcData[i].y;
        else
            gSaveBlock1Ptr->mapObjectTemplates[i].y = questLog->npcData[i].y;
        gSaveBlock1Ptr->mapObjectTemplates[i].elevation = questLog->npcData[i].elevation;
        gSaveBlock1Ptr->mapObjectTemplates[i].movementType = questLog->npcData[i].movementType;
    }

    sub_815A1F8(questLog, gSaveBlock1Ptr->mapObjectTemplates);
}

void sub_8111274(u8 a0, u8 a1)
{
    struct WarpData sp0;
    
    if (!a1)
    {
        gSaveBlock1Ptr->location.mapGroup = gSaveBlock1Ptr->questLog[a0].unk_001;
        gSaveBlock1Ptr->location.mapNum = gSaveBlock1Ptr->questLog[a0].unk_002;
        gSaveBlock1Ptr->location.warpId = gSaveBlock1Ptr->questLog[a0].unk_003;
        gSaveBlock1Ptr->pos.x = gSaveBlock1Ptr->questLog[a0].unk_004;
        gSaveBlock1Ptr->pos.y = gSaveBlock1Ptr->questLog[a0].unk_006;
    }
    else
    {
        sp0.mapGroup = gSaveBlock1Ptr->questLog[a0].unk_001;
        sp0.mapNum = gSaveBlock1Ptr->questLog[a0].unk_002;
        sp0.warpId = gSaveBlock1Ptr->questLog[a0].unk_003;
        sp0.x = gSaveBlock1Ptr->questLog[a0].unk_004;
        sp0.y = gSaveBlock1Ptr->questLog[a0].unk_006;
        sub_8055D5C(&sp0);
    }
}

void sub_8111368(void)
{
    gUnknown_203ADFA = 2;
    sub_806E6FC();
    sub_809A2DC();
    sub_809A2A4();
    if (sub_8110AC8() == 1)
    {
        sub_8111274(gUnknown_203ADF8, 0);
        gUnknown_3005024 = sub_8111038;
        SetMainCallback2(sub_80572A8);
    }
    else
    {
        sub_8111274(gUnknown_203ADF8, 1);
        warp_in();
        gUnknown_3005024 = sub_8111000;
        SetMainCallback2(sub_805726C);
    }
}

void sub_81113E4(void)
{
    struct QuestLog * questLog = &gSaveBlock1Ptr->questLog[gUnknown_203ADF8];

    CpuCopy16(questLog->unk_148, gSaveBlock1Ptr->flags, FLAGS_COUNT * sizeof(u8));
    CpuCopy16(questLog->unk_268, gSaveBlock1Ptr->vars, VARS_COUNT * sizeof(u16));
    sub_8111688();
}

struct PokemonAndSomethingElse
{
    struct Pokemon mon;
    u16 unk_64;
    u16 unk_66;
};

void sub_8111438(void)
{
    struct PokemonAndSomethingElse *r9 = AllocZeroed(sizeof(struct PokemonAndSomethingElse));
    u16 r0, r3, r5, r6;

    CreateMon(&r9->mon, SPECIES_RATTATA, 1, 0x20, FALSE, 0, 0, 0);
    r0 = VarGet(VAR_0x4027);
    r9->unk_64 = r0 >> 12;
    r9->unk_66 = r0 % 0x1000;

    r5 = sub_8111618();
    if (r5 > r9->unk_64)
    {
        for (r3 = 0; r3 < r5 - r9->unk_64; r3++)
        {
            ZeroMonData(&gPlayerParty[5 - r3]);
        }
    }
    else if (r5 < r9->unk_64)
    {
        for (r3 = 0; r3 < 5; r3++)
        {
            sub_808BCB4(0, r3);
        }
        for (r3 = r5; r3 < r9->unk_64; r3++)
        {
            CopyMon(&gPlayerParty[r3], &r9->mon, sizeof(struct Pokemon));
        }
    }

    r5 = sub_811164C();
    if (r5 > r9->unk_66)
    {
        for (r3 = 0; r3 < 14; r3++)
        {
            for (r6 = 0; r6 < 30; r6++)
            {
                if (GetBoxMonDataFromAnyBox(r3, r6, MON_DATA_SANITY_BIT2))
                {
                    sub_808BCB4(r3, r6);
                    r5--;
                    if (r5 == r9->unk_66)
                        break;
                }
            }
            if (r5 == r9->unk_66)
                break;
        }
    }
    else if (r5 < r9->unk_66)
    {
        for (r3 = 0; r3 < TOTAL_BOXES_COUNT; r3++)
        {
            for (r6 = 0; r6 < IN_BOX_COUNT; r6++)
            {
                struct BoxPokemon * boxMon = GetBoxedMonPtr(r3, r6);
                if (!GetBoxMonData(boxMon, MON_DATA_SANITY_BIT2))
                {
                    CopyMon(boxMon, &r9->mon.box, sizeof(struct BoxPokemon));
                    r5++;
                    if (r5 == r9->unk_66)
                        break;
                }
            }
            if (r5 == r9->unk_66)
                break;
        }
    }

    Free(r9);
}

void sub_81115E8(void)
{
    u16 r4 = sub_8111618();
    u16 r1 = sub_811164C();
    VarSet(VAR_0x4027, (r4 << 12) + r1);
}

u16 sub_8111618(void)
{
    u16 count = 0;
    u16 i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SANITY_BIT2))
            count++;
    }

    return count;
}

u16 sub_811164C(void)
{
    u16 count = 0;
    u16 i, j;

    for (i = 0; i < TOTAL_BOXES_COUNT; i++)
    {
        for (j = 0; j < IN_BOX_COUNT; j++)
        {
            if (GetBoxMonDataFromAnyBox(i, j, MON_DATA_SANITY_BIT2))
                count++;
        }
    }

    return count;
}

void sub_8111688(void)
{
    u16 i, j;
    u16 sp0[4];

    for (i = 0; i < 4; i++)
    {
        sp0[i] = VarGet(VAR_0x40AA + i);

        for (j = 0; j < 16; j++)
        {
            if (sp0[i] & 1)
                gSaveBlock1Ptr->trainerRematches[16 * i + j] = 30;
            else
                gSaveBlock1Ptr->trainerRematches[16 * i + j] = 0;
            sp0[i] >>= 1;
        }
    }
}

void sub_8111708(void)
{
    struct MapHeader sp0;

    gSaveBlock1Ptr->mapDataId = VarGet(VAR_0x40AE);
    if (gSaveBlock1Ptr->mapDataId == 0)
    {
        sp0 = *get_mapheader_by_bank_and_number(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum);
        gSaveBlock1Ptr->mapDataId = sp0.mapDataId;
    }
}

void sub_811175C(u8 a0, struct UnkStruct_203AE98 * a1)
{
    u16 i;
    u16 *r4;
    u16 r6 = 0;
    u16 r9 = 0;

    memset(a1, 0, 32 * sizeof(struct UnkStruct_203AE98));
    for (i = 0; i < 32; i++)
    {
        gUnknown_203AE0C[i] = NULL;
    }

    r4 = (u16 *)gSaveBlock1Ptr->questLog[a0].unk_568;
    for (i = 0; i < 32; i++)
    {
        switch (r4[0] & 0xFFF)
        {
            case 0:
                r4 = sub_8113D08(r4, &a1[r6]);
                r6++;
                break;
            case 1:
            case 2:
                r4 = sub_8113D94(r4, &a1[r6]);
                r6++;
                break;
            case 39:
                r4 = sub_8113C20(r4, &a1[r6]);
                r6++;
                break;
            case 41:
                r4 = sub_8113C8C(r4, &a1[r6]);
                r6++;
                break;
            default:
                r4 = sub_8113A78(r4, &gUnknown_203AE0C[r9]);
                if (r9 == 0)
                    sub_8113ABC(gUnknown_203AE0C[0]);
                r9++;
                break;
        }
        if (r4 == NULL)
            break;
    }
}

void sub_81118F4(s8 a0)
{
    fade_screen(1, a0);
    gUnknown_203AE8C = sub_8111914;
}

void sub_8111914(void)
{
    if (!gPaletteFade.active)
    {
        ScriptContext2_Enable();
        if (++gUnknown_203ADF8 < 4 && gSaveBlock1Ptr->questLog[gUnknown_203ADF8].unk_000)
        {
            gUnknown_203ADF9--;
            sub_8111368();
        }
        else
        {
            gUnknown_3005E88 = 0;
            sub_8111984();
        }
    }
}

void sub_8111984(void)
{
    sub_806E6FC();
    Save_ResetSaveCounters();
    Save_LoadGameData(0);
    SetMainCallback2(sub_8057430);
    gUnknown_3005024 = sub_8111F60;
    FreeAllWindowBuffers();
    gUnknown_203ADFA = 3;
    gUnknown_203AE8C = NULL;
}

void sub_81119C8(void)
{
    sub_8111914();
}

bool8 sub_81119D4(void (*a0)(void))
{
    u8 taskId;

    switch (gUnknown_203ADFA)
    {
        case 1:
            sub_8112364();
            break;
        case 2:
            gUnknown_3005E88 = 3;
            taskId = CreateTask(sub_8111A34, 80);
            gTasks[taskId].data[0] = 0;
            gTasks[taskId].data[1] = 0;
            SetWordTaskArg(taskId, 14, (u32)a0);
            return TRUE;
    }
    return FALSE;
}

void sub_8111A34(u8 taskId)
{
    void (*routine)(void);
    s16 * data = gTasks[taskId].data;

    switch (data[1])
    {
        case 0:
            if (++data[0] == 0x7F)
            {
                BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
                gUnknown_203AE94.unk_0_6 = 2;
                data[1]++;
            }
            break;
        case 1:
            if (!gPaletteFade.active)
            {
                gUnknown_3005E88 = 0;
                routine = (void (*)(void)) GetWordTaskArg(taskId, 14);
                if (routine != NULL)
                    routine();
                DestroyTask(taskId);
                gUnknown_203AE8C = sub_8111914;
            }
            break;
    }
}

void sub_8111AD8(void)
{
    if (gUnknown_203AE94.unk_0_0 == 1)
    {
        if (--gUnknown_203AE94.unk_2 != 0)
            return;
        gUnknown_203AE94.unk_0_0 = 0;
        gUnknown_203AE94.unk_0_4 = 1;
        sub_8112888(2);
    }

    if (gUnknown_203AE94.unk_0_4 == 1)
    {
        if (++gUnknown_203AE94.unk_3 > 15)
        {
            sub_8111E20();
            gUnknown_203AE94.unk_0_4 = 0;
            gUnknown_203AE94.unk_3 = 0;
        }
    }
    if (gUnknown_203AE94.unk_1 < 32)
    {
        if (sub_8113B44(gUnknown_203AE0C[gUnknown_203AE94.unk_1]) == 1)
            sub_8111B80();
        else if (sub_8113AE8(gUnknown_203AE0C[gUnknown_203AE94.unk_1]) == 1)
            sub_8111B80();
    }
}

void sub_8111B80(void)
{
    if (gUnknown_203AE94.unk_0_0 == 0)
    {
        gUnknown_203AE94.unk_0_0 = 1;
        gUnknown_203AE94.unk_0_4 = 0;
        gUnknown_203AE94.unk_3 = 0;
        gUnknown_203AE94.unk_2 = sub_8111BD4();
        if (gUnknown_203B044.unk_2 == 0)
            gUnknown_203AE94.unk_1++;
        if (gUnknown_203AE94.unk_1 > 32)
            return;
        sub_8111D10();
    }
    sub_8112888(1);
}

u8 sub_8111BD4(void)
{
    u16 i;
    u16 count = 0;

    for (i = 0; i < 0x400 && gStringVar4[i] != EOS; i++)
    {
        if (gStringVar4[i] != CHAR_NEWLINE)
            count++;
    }

    if (count < 20)
        return 0x5F;
    if (count < 36)
        return 0x7F;
    if (count < 46)
        return 0xBF;
    return 0xFF;
}

bool8 sub_8111C2C(void)
{
    if (gUnknown_203ADFA != 2)
        return FALSE;
    if (gUnknown_3005E88 == 0 || gUnknown_203AE94.unk_0_0 == 1 || gUnknown_203AE94.unk_0_0 == 2)
        return TRUE;
    return FALSE;
}

void sub_8111C68(void)
{
    if (gUnknown_203AE94.unk_0_6 == 0)
    {
        if (gMain.newKeys & A_BUTTON)
        {
            gUnknown_203AE94.unk_0_6 = 2;
            gUnknown_3005E88 = 0;
            sub_81118F4(-3);
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            gUnknown_203AE94.unk_0_6 = 1;
            gUnknown_3005E88 = 0;
            sub_8111E64(-3);
        }
    }
}

bool8 sub_8111CD0(void)
{
    if (gUnknown_203AE94.unk_0_6 != 0)
        return TRUE;
    return FALSE;
}

void sub_8111CF0(void)
{
    if (gUnknown_203ADFA == 2)
        sub_8111070(gUnknown_203ADF9);
}

void sub_8111D10(void)
{
    u16 i;
    u8 count = 0;

    for (i = 0; i < 0x100 && gStringVar4[i] != EOS; i++)
    {
        if (gStringVar4[i] == CHAR_NEWLINE)
            count++;
    }

    PutWindowTilemap(gUnknown_203ADFE[2]);
    sub_8111D90(gUnknown_203ADFE[2]);
    AddTextPrinterParametrized2(gUnknown_203ADFE[2], 2, 2, gUnknown_8456698[count], 1, 0, &gUnknown_8456634, 0, gStringVar4);
    schedule_bg_copy_tilemap_to_vram(0);
}

void sub_8111D90(u8 a0)
{
    const u16 * src = gUnknown_8456638;
    u16 * buffer = Alloc(0x1680);
    u8 i, j, y;

    if (buffer)
    {
        for (i = 0; i < 6; i++)
        {
            switch (i)
            {
                default:
                    y = 1;
                    break;
                case 0:
                    y = 0;
                    break;
                case 5:
                    y = 2;
                    break;
            }

            // r6 = y * 32
            // r5 = 2 * (i % 16)
            // r4 = j
            for (j = 0; j < 30; j++)
            {
                CpuCopy32(src + 16 * y, buffer + 16 * (2 * (15 * i) + j), 32);
            }
        }

        CopyToWindowPixelBuffer(a0, (const u8 *)buffer, 0x1680, 0);
        Free(buffer);
    }
}

void sub_8111E20(void)
{
    ClearWindowTilemap(gUnknown_203ADFE[2]);
    FillWindowPixelRect(gUnknown_203ADFE[2], 15, 0, 0, 0xf0, 0x30);
    CopyWindowToVram(gUnknown_203ADFE[2], 2);
    PutWindowTilemap(gUnknown_203ADFE[1]);
    CopyWindowToVram(gUnknown_203ADFE[1], 1);
}

void sub_8111E64(s8 a0)
{
    fade_screen(1, a0);
    gUnknown_203AE8C = sub_8111E84;
}

void sub_8111E84(void)
{
    if (!gPaletteFade.active)
    {
        ScriptContext2_Enable();
        for (gUnknown_203ADF8 = gUnknown_203ADF8; gUnknown_203ADF8 < 4; gUnknown_203ADF8++)
        {
            if (gSaveBlock1Ptr->questLog[gUnknown_203ADF8].unk_000 == 0)
                break;
            sub_811175C(gUnknown_203ADF8, gUnknown_203AE98);
        }
        gUnknown_3005E88 = 0;
        sub_8111984();
    }
}

void sub_8111F14(void)
{
    if (gUnknown_203ADFA == 3)
        gUnknown_203AE90 = AllocZeroed(0x200 * sizeof(u16));
}

void sub_8111F38(u16 a0, u16 a1)
{
    CpuSet(gPlttBufferUnfaded + a0, gUnknown_203AE90 + a0, a1);
}

bool8 sub_8111F60(void)
{
    LoadPalette(stdpal_get(4), 0xF0, 0x20);
    sub_8111070(0);
    sub_807DF7C();
    CreateTask(sub_8111F8C, 0xFF);
    return TRUE;
}

void sub_8111F8C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (ScriptContext2_IsEnabled() != TRUE)
    {
        player_bitmagic();
        sub_805C270();
        sub_805C780();
        ScriptContext2_Enable();
        task->func = sub_8111FCC;
    }
}

void sub_8111FCC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (!gPaletteFade.active)
    {
        if (gUnknown_203AE94.unk_0_6 != 1)
        {
            sub_80C4DF8(gStringVar1, gMapHeader.regionMapSectionId);
            StringExpandPlaceholders(gStringVar4, gUnknown_841B073);
            sub_8111D10();
        }
        task->data[0] = 0;
        task->data[1] = 0;
        task->func = sub_8112044;
        player_bitmagic();
        ScriptContext2_Enable();
    }
}

void sub_8112044(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (gMain.newKeys & (A_BUTTON | B_BUTTON) || task->data[0] >= 0x7f || gUnknown_203AE94.unk_0_6 == 1)
    {
        sub_8111E20();
        task->data[0] = 0;
        task->func = sub_81120AC;
        gUnknown_203ADFA = 0;
    }
    else
        task->data[0]++;
}

void sub_81120AC(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u8 i;

    switch (data[0])
    {
        case 0:
            gUnknown_2031DD8 = 0;
            sub_8055DC4();
            sub_811229C();
            FillWindowPixelRect(gUnknown_203ADFE[0], 0xF, 0, 0, gUnknown_845661C[0].width * 8, gUnknown_845661C[0].height * 8);
            data[0]++;
            break;
        case 1:
            if (sub_81121D8(taskId))
            {
                for (i = 0; i < 3; i++)
                {
                    ClearWindowTilemap(gUnknown_203ADFE[i]);
                    CopyWindowToVram(gUnknown_203ADFE[i], 1);
                    RemoveWindow(gUnknown_203ADFE[i]);
                }
                data[1] = 0;
                data[0]++;
            }
            break;
        case 2:
            if (data[1] < 32)
                data[1]++;
            else
                data[0]++;
            break;
        default:
            if (gUnknown_203AE94.unk_0_6 == 1)
                sub_8098110(1);
            CpuCopy16(gUnknown_203AE90, gPlttBufferUnfaded, 0x400);
            Free(gUnknown_203AE90);
            gUnknown_203AE94 = (struct UnkStruct_203AE94){};
            sub_80696C0();
            ScriptContext2_Disable();
            gTextFlags.flag_2 = FALSE;
            gUnknown_2036E28 = 0;
            sub_8082740(0);
            gUnknown_3005ECC = 1;
            DestroyTask(taskId);
            break;
    }
}

bool8 sub_81121D8(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (data[1] > 15)
        return TRUE;

    sub_80716F8(gPlttBufferUnfaded + 0x01, gPlttBufferFaded + 0x01, 0xDF, 0x0F - data[1]);
    sub_80716F8(gPlttBufferUnfaded + 0x100, gPlttBufferFaded + 0x100, 0x100, 0x0F - data[1]);
    FillWindowPixelRect(gUnknown_203ADFE[0], 0x00, 0, gUnknown_845661C[0].height * 8 - 1 - data[1], gUnknown_845661C[0].width * 8, 1);
    FillWindowPixelRect(gUnknown_203ADFE[1], 0x00, 0, data[1], gUnknown_845661C[1].width * 8, 1);
    CopyWindowToVram(gUnknown_203ADFE[0], 2);
    CopyWindowToVram(gUnknown_203ADFE[1], 2);
    data[1]++;
    return FALSE;
}

void sub_811229C(void)
{
    u16 * buffer = Alloc(0x400);
    CpuCopy16(gUnknown_203AE90, buffer, 0x400);
    sub_807B0C4(gUnknown_203AE90, gUnknown_203AE90, 0xd0);
    sub_807B0C4(gUnknown_203AE90 + 0x110, gUnknown_203AE90 + 0x110, 0x10);
    sub_807B0C4(gUnknown_203AE90 + 0x160, gUnknown_203AE90 + 0x160, 0x40);
    sub_807B0C4(gUnknown_203AE90 + 0x1b0, gUnknown_203AE90 + 0x1b0, 0x50);
    CpuCopy16(gUnknown_203AE90, gPlttBufferUnfaded, 0x400);
    CpuCopy16(buffer, gUnknown_203AE90, 0x400);
    Free(buffer);
}

void sub_811231C(void)
{
    if (gUnknown_203ADFA == 1)
    {
        sub_8110E68(gUnknown_203AE98);
        sub_8110E3C();
        gUnknown_203ADFA = 0;
        gUnknown_203AE8C = NULL;
        gUnknown_203AE04 = NULL;
        gUnknown_203AE08 = NULL;
        gUnknown_3005E88 = 0;
    }
}

void sub_8112364(void)
{
    if (gUnknown_3005E88 && gUnknown_203ADFA == 1)
    {
        sub_8110E68(gUnknown_203AE98);
        sub_8113A1C(1);
        sub_8110E3C();
        gUnknown_3005E88 = 0;
        gUnknown_203ADFA = 0;
        gUnknown_203AE8C = NULL;
    }
    gUnknown_203AE04 = NULL;
    gUnknown_203AE08 = NULL;
}

void sub_81123BC(void)
{
    struct QuestLog * buffer = AllocZeroed(4 * sizeof(struct QuestLog));
    u8 i;
    u8 r4 = gUnknown_203ADF8;
    u8 count = 0;
    for (i = 0; i < 4; i++)
    {
        if (r4 > 3)
            r4 = 0;
        if (gSaveBlock1Ptr->questLog[r4].unk_000)
        {
            buffer[count] = gSaveBlock1Ptr->questLog[r4];
            count++;
        }
        r4++;
    }
    gUnknown_203ADF8 = count % 4;
    CpuCopy16(buffer, gSaveBlock1Ptr->questLog, 4 * sizeof(struct QuestLog));
    Free(buffer);
}

void sub_8112450(void)
{
    if (sub_80BF708() != 1)
    {
        sub_8112364();
        sub_81123BC();
    }
}

void sub_811246C(struct Sprite *sprite)
{
    struct MapObject *mapObject = &gMapObjects[sprite->data[0]];
    if (mapObject->localId == 0xFF)
    {
        if (gUnknown_203AF9A[0][0] != 0xFF)
        {
            sub_8063CA4(mapObject, gUnknown_203AF9A[0][0]);
            gUnknown_203AF9A[0][0] = 0xFF;
        }
        if (gUnknown_203AF9A[0][1] != 0xFF)
        {
            sub_8150454();
            gUnknown_203AF9A[0][1] = 0xFF;
        }
        sub_8063E28(mapObject, sprite);
    }
    else
    {
        if (gUnknown_203AF9A[mapObject->localId][0] != 0xFF)
        {
            sub_8063CA4(mapObject, gUnknown_203AF9A[mapObject->localId][0]);
            gUnknown_203AF9A[mapObject->localId][0] = 0xFF;
        }
        sub_8063E28(mapObject, sprite);
    }
}

void sub_81124EC(u8 a0, u8 a1, u8 a2, u8 a3)
{
    if (!sub_8112CEC())
    {
        gUnknown_3005E94[gUnknown_203AF98].unk_4 = gUnknown_203B01A;
        gUnknown_3005E94[gUnknown_203AF98].unk_6 = 0;
        gUnknown_3005E94[gUnknown_203AF98].unk_0 = a0;
        gUnknown_3005E94[gUnknown_203AF98].unk_1 = a1;
        gUnknown_3005E94[gUnknown_203AF98].unk_2 = a2;
        gUnknown_3005E94[gUnknown_203AF98].unk_3 = a3;
        gUnknown_203AF98++;
        gUnknown_203B01A = 0;
    }
}

void sub_8112588(u8 a0, u8 a1, u8 a2, u8 a3, u8 a4)
{
    if (!sub_8112D1C())
    {
        gUnknown_3005E94[gUnknown_203AF98].unk_4 = gUnknown_203B01A;
        gUnknown_3005E94[gUnknown_203AF98].unk_6 = 0;
        gUnknown_3005E94[gUnknown_203AF98].unk_0 = a0;
        gUnknown_3005E94[gUnknown_203AF98].unk_1 = a1;
        gUnknown_3005E94[gUnknown_203AF98].unk_2 = a2;
        gUnknown_3005E94[gUnknown_203AF98].unk_3 = a3;
        gUnknown_203AF98++;
        gUnknown_203B01A = a4;
    }
}

void sub_8112628(u8 a0)
{
    if (!sub_8112CEC())
    {
        if (a0 != gUnknown_3005E94[gUnknown_203B01C].unk_3 || a0 > 3)
        {
            gUnknown_3005E94[gUnknown_203AF98].unk_4 = gUnknown_203B01A;
            gUnknown_3005E94[gUnknown_203AF98].unk_6 = 0;
            gUnknown_3005E94[gUnknown_203AF98].unk_0 = 0;
            gUnknown_3005E94[gUnknown_203AF98].unk_3 = a0;
            gUnknown_203B01C = gUnknown_203AF98;
            gUnknown_203AF98++;
            gUnknown_203B01A = 0;
        }
    }
}

void sub_81126AC(u8 a0, u8 a1)
{
    if (!sub_8112D1C())
    {
        gUnknown_3005E94[gUnknown_203AF98].unk_4 = gUnknown_203B01A;
        gUnknown_3005E94[gUnknown_203AF98].unk_6 = 0;
        gUnknown_3005E94[gUnknown_203AF98].unk_0 = 0;
        gUnknown_3005E94[gUnknown_203AF98].unk_3 = a0;
        gUnknown_203B01C = gUnknown_203AF98;
        gUnknown_203AF98++;
        gUnknown_203B01A = a1;
    }
}

void sub_8112720(u8 a0)
{
    if (!sub_8112D1C())
    {
        gUnknown_3005E94[gUnknown_203AF98].unk_4 = gUnknown_203B01A;
        gUnknown_3005E94[gUnknown_203AF98].unk_6 = 1;
        gUnknown_3005E94[gUnknown_203AF98].unk_0 = 0;
        gUnknown_3005E94[gUnknown_203AF98].unk_3 = a0;
        gUnknown_203AF98++;
        gUnknown_203B01A = 0;
    }
}

void sub_811278C(u8 a0, u8 a1)
{
    if (!sub_8112D1C())
    {
        gUnknown_3005E94[gUnknown_203AF98].unk_4 = gUnknown_203B01A;
        gUnknown_3005E94[gUnknown_203AF98].unk_6 = 1;
        gUnknown_3005E94[gUnknown_203AF98].unk_0 = 0;
        gUnknown_3005E94[gUnknown_203AF98].unk_3 = a0;
        gUnknown_203AF98++;
        gUnknown_203B01A = a1;
    }
}

void sub_81127F8(struct UnkStruct_3005E90 * a0)
{
    if (gUnknown_203AF98 < gUnknown_3005E8C)
    {
        u32 r2 = *(u32 *)a0 & 0x00FF00F3;
        gUnknown_3005E94[gUnknown_203AF98].unk_4 = gUnknown_203B01A;
        gUnknown_3005E94[gUnknown_203AF98].unk_6 = 2;
        gUnknown_3005E94[gUnknown_203AF98].unk_0 = r2;
        gUnknown_3005E94[gUnknown_203AF98].unk_1 = r2 >> 8;
        gUnknown_3005E94[gUnknown_203AF98].unk_2 = r2 >> 16;
        gUnknown_3005E94[gUnknown_203AF98].unk_3 = r2 >> 24;
        gUnknown_203AF98++;
        if (ScriptContext2_IsEnabled())
            gUnknown_203B01A = TRUE;
        else
            gUnknown_203B01A = FALSE;
    }
}

void sub_8112888(u8 a0)
{
    switch (a0)
    {
        case 1:
            if (gUnknown_3005E88 == 1)
                gUnknown_3005E88 = 3;
            break;
        case 2:
            if (gUnknown_3005E88 == 3)
                gUnknown_3005E88 = 1;
            break;
    }
}

void sub_81128BC(u8 a0)
{
    u8 r1 = sub_8112CAC();

    switch (a0)
    {
        case 1:
            if (r1 == 1)
                gUnknown_3005E88 = 3;
            else if (r1 == 2)
            {
                gUnknown_3005E94[gUnknown_203AF98].unk_4 = gUnknown_203B01A;
                gUnknown_3005E94[gUnknown_203AF98].unk_6 = 3;
                gUnknown_203AF98++;
                gUnknown_203B01A = 0;
                gUnknown_3005E88 = 4;
            }
            break;
        case 2:
            if (r1 == 1)
                gUnknown_3005E88 = 1;
            else if (r1 == 2)
                gUnknown_3005E88 = 2;
            break;
    }
}

void sub_8112940(u8 a0, struct UnkStruct_203AE98 *a1, u16 a2)
{
    s32 i;

    switch (a0)
    {
        default:
            gUnknown_3005E88 = 0;
            break;
        case 1:
            gUnknown_3005E94 = a1;
            gUnknown_3005E8C = a2 / 8;
            for (i = 0; i < 0x40; i++)
            {
                gUnknown_203AF9A[i][0] |= 0xFF;
                gUnknown_203AF9A[i][1] |= 0xFF;
            }
            gUnknown_203AF98 = 0;
            gUnknown_203B01C = 0;
            gUnknown_3005E90 = (struct UnkStruct_3005E90){};
            gUnknown_203B01A = gUnknown_3005E94[gUnknown_203AF98].unk_4;
            gUnknown_203AF9A[0][0] = gUnknown_3005E94[gUnknown_203AF98].unk_3;
            gUnknown_203AF9A[0][1] = 0xFF;
            gUnknown_3005E88 = 1;
            break;
        case 2:
            gUnknown_3005E94 = a1;
            gUnknown_3005E8C = a2 / 8;
            for (i = 0; i < gUnknown_3005E8C; i++)
            {
                gUnknown_3005E94[i] = (struct UnkStruct_203AE98){ 0, 0, 0, 0, 0xFFFF, 0xFF };
            }
            gUnknown_203AF98 = 0;
            gUnknown_203B01A = 0;
            gUnknown_3005E94[gUnknown_203AF98].unk_4 = 0;
            gUnknown_3005E94[gUnknown_203AF98].unk_6 = 0;
            gUnknown_3005E94[gUnknown_203AF98].unk_0 = 0;
            switch (player_get_direction_lower_nybble())
            {
                case 0:
                case 1:
                    gUnknown_3005E94[gUnknown_203AF98].unk_3 = 0;
                    break;
                case 4:
                    gUnknown_3005E94[gUnknown_203AF98].unk_3 = 3;
                    break;
                case 2:
                    gUnknown_3005E94[gUnknown_203AF98].unk_3 = 1;
                    break;
                case 3:
                    gUnknown_3005E94[gUnknown_203AF98].unk_3 = 2;
                    break;
            }
            gUnknown_203B01C = 0;
            gUnknown_203AF98++;
            gUnknown_3005E94[gUnknown_203AF98].unk_4 = 0;
            gUnknown_3005E94[gUnknown_203AF98].unk_6 = 2;
            gUnknown_3005E94[gUnknown_203AF98].unk_0 = 0;
            gUnknown_3005E94[gUnknown_203AF98].unk_1 = 0;
            gUnknown_3005E94[gUnknown_203AF98].unk_2 = 0;
            gUnknown_3005E94[gUnknown_203AF98].unk_3 = 0;
            gUnknown_203AF98++;
            gUnknown_3005E88 = 2;
            break;
    }
}

#ifdef NONMATCHING
void sub_8112B3C(void)
{
    switch (gUnknown_3005E88)
    {
        case 0:
            break;
        case 1:
            if (sub_8112CEC())
            {
                if (gUnknown_203B01A != 0)
                    gUnknown_203B01A--;
                else
                {
                    while (1)
                    {
                        switch (gUnknown_3005E94[gUnknown_203AF98].unk_6)
                        {
                            case 0:
                                gUnknown_203AF9A[gUnknown_3005E94[gUnknown_203AF98].unk_0][0] = gUnknown_3005E94[gUnknown_203AF98].unk_3;
                                break;
                            case 1:
                                gUnknown_203AF9A[gUnknown_3005E94[gUnknown_203AF98].unk_0][1] = gUnknown_3005E94[gUnknown_203AF98].unk_3;
                                break;
                            case 2:
                                *(u32 *)&gUnknown_3005E90 = ((gUnknown_3005E94[gUnknown_203AF98].unk_3 << 24) | (gUnknown_3005E94[gUnknown_203AF98].unk_2 << 16) | (gUnknown_3005E94[gUnknown_203AF98].unk_1 << 8) | (gUnknown_3005E94[gUnknown_203AF98].unk_0 << 0));
                                break;
                            case 3:
                                gUnknown_3005E88 = 3;
                                break;
                            case 0xFE:
                                break;
                            case 0xFF:
                                gUnknown_3005E88 = 0;
                                break;
                        }
                        if (gUnknown_3005E88 == 0)
                            break;
                        if (++gUnknown_203AF98 >= gUnknown_3005E8C)
                        {
                            gUnknown_3005E88 = 0;
                            break;
                        }
                        gUnknown_203B01A = gUnknown_3005E94[gUnknown_203AF98].unk_4;
                        if (gUnknown_3005E88 == 3)
                            break;
                        if (gUnknown_203B01A == 0)
                            continue;
                        if (gUnknown_203B01A == 0xFFFF)
                            break;
                    }
                }
            }
            else if (gUnknown_203AF98 >= gUnknown_3005E8C)
                gUnknown_3005E88 = 0;
            break;
        case 2:
            if (ScriptContext2_IsEnabled() != 1)
                gUnknown_203B01A++;
            if (gUnknown_203AF98 >= gUnknown_3005E8C)
                gUnknown_3005E88 = 0;
            break;
        case 3:
            break;
        case 4:
            break;
    }
}
#else
NAKED
void sub_8112B3C(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tldr r0, _08112B54 @ =gUnknown_3005E88\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r0, 0x4\n"
                "\tbls _08112B48\n"
                "\tb _08112C84\n"
                "_08112B48:\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _08112B58 @ =_08112B5C\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_08112B54: .4byte gUnknown_3005E88\n"
                "_08112B58: .4byte _08112B5C\n"
                "\t.align 2, 0\n"
                "_08112B5C:\n"
                "\t.4byte _08112C84\n"
                "\t.4byte _08112B70\n"
                "\t.4byte _08112C5E\n"
                "\t.4byte _08112C84\n"
                "\t.4byte _08112C84\n"
                "_08112B70:\n"
                "\tbl sub_8112CEC\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbeq _08112B7C\n"
                "\tb _08112C72\n"
                "_08112B7C:\n"
                "\tldr r0, _08112B8C @ =gUnknown_203B01A\n"
                "\tldrh r1, [r0]\n"
                "\tadds r7, r0, 0\n"
                "\tcmp r1, 0\n"
                "\tbeq _08112B90\n"
                "\tsubs r0, r1, 0x1\n"
                "\tstrh r0, [r7]\n"
                "\tb _08112C84\n"
                "\t.align 2, 0\n"
                "_08112B8C: .4byte gUnknown_203B01A\n"
                "_08112B90:\n"
                "\tldr r5, _08112B98 @ =gUnknown_3005E88\n"
                "\tldr r4, _08112B9C @ =gUnknown_203AF98\n"
                "\tldr r6, _08112BA0 @ =gUnknown_3005E94\n"
                "\tb _08112BD4\n"
                "\t.align 2, 0\n"
                "_08112B98: .4byte gUnknown_3005E88\n"
                "_08112B9C: .4byte gUnknown_203AF98\n"
                "_08112BA0: .4byte gUnknown_3005E94\n"
                "_08112BA4:\n"
                "\tldrh r0, [r4]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r4]\n"
                "\tldr r1, _08112BF0 @ =gUnknown_3005E8C\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tldrh r1, [r1]\n"
                "\tcmp r0, r1\n"
                "\tbcs _08112C58\n"
                "\tldrh r0, [r4]\n"
                "\tldr r1, [r6]\n"
                "\tlsls r0, 3\n"
                "\tadds r0, r1\n"
                "\tldrh r0, [r0, 0x4]\n"
                "\tstrh r0, [r7]\n"
                "\tcmp r2, 0x3\n"
                "\tbeq _08112C84\n"
                "\tlsls r0, 16\n"
                "\tlsrs r1, r0, 16\n"
                "\tcmp r1, 0\n"
                "\tbeq _08112BD4\n"
                "\tldr r0, _08112BF4 @ =0x0000ffff\n"
                "\tcmp r1, r0\n"
                "\tbne _08112C84\n"
                "_08112BD4:\n"
                "\tldrh r0, [r4]\n"
                "\tldr r1, [r6]\n"
                "\tlsls r0, 3\n"
                "\tadds r3, r0, r1\n"
                "\tldrb r0, [r3, 0x6]\n"
                "\tcmp r0, 0x2\n"
                "\tbeq _08112C2C\n"
                "\tcmp r0, 0x2\n"
                "\tbgt _08112BF8\n"
                "\tcmp r0, 0\n"
                "\tbeq _08112C0C\n"
                "\tcmp r0, 0x1\n"
                "\tbeq _08112C18\n"
                "\tb _08112C50\n"
                "\t.align 2, 0\n"
                "_08112BF0: .4byte gUnknown_3005E8C\n"
                "_08112BF4: .4byte 0x0000ffff\n"
                "_08112BF8:\n"
                "\tcmp r0, 0xFE\n"
                "\tbeq _08112C50\n"
                "\tcmp r0, 0xFE\n"
                "\tbgt _08112C06\n"
                "\tcmp r0, 0x3\n"
                "\tbeq _08112C4E\n"
                "\tb _08112C50\n"
                "_08112C06:\n"
                "\tcmp r0, 0xFF\n"
                "\tbeq _08112C4C\n"
                "\tb _08112C50\n"
                "_08112C0C:\n"
                "\tldr r0, _08112C14 @ =gUnknown_203AF9A\n"
                "\tldrb r1, [r3]\n"
                "\tlsls r1, 1\n"
                "\tb _08112C20\n"
                "\t.align 2, 0\n"
                "_08112C14: .4byte gUnknown_203AF9A\n"
                "_08112C18:\n"
                "\tldr r0, _08112C28 @ =gUnknown_203AF9A\n"
                "\tldrb r1, [r3]\n"
                "\tlsls r1, 1\n"
                "\tadds r0, 0x1\n"
                "_08112C20:\n"
                "\tadds r1, r0\n"
                "\tldrb r0, [r3, 0x3]\n"
                "\tstrb r0, [r1]\n"
                "\tb _08112C50\n"
                "\t.align 2, 0\n"
                "_08112C28: .4byte gUnknown_203AF9A\n"
                "_08112C2C:\n"
                "\tldr r2, _08112C48 @ =gUnknown_3005E90\n"
                "\tldrb r1, [r3, 0x3]\n"
                "\tlsls r1, 24\n"
                "\tldrb r0, [r3, 0x2]\n"
                "\tlsls r0, 16\n"
                "\torrs r1, r0\n"
                "\tldrb r0, [r3, 0x1]\n"
                "\tlsls r0, 8\n"
                "\torrs r1, r0\n"
                "\tldrb r0, [r3]\n"
                "\torrs r1, r0\n"
                "\tstr r1, [r2]\n"
                "\tb _08112C50\n"
                "\t.align 2, 0\n"
                "_08112C48: .4byte gUnknown_3005E90\n"
                "_08112C4C:\n"
                "\tmovs r0, 0\n"
                "_08112C4E:\n"
                "\tstrb r0, [r5]\n"
                "_08112C50:\n"
                "\tldrb r2, [r5]\n"
                "\tcmp r2, 0\n"
                "\tbne _08112BA4\n"
                "\tb _08112C84\n"
                "_08112C58:\n"
                "\tmovs r0, 0\n"
                "\tstrb r0, [r5]\n"
                "\tb _08112C84\n"
                "_08112C5E:\n"
                "\tbl ScriptContext2_IsEnabled\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tcmp r0, 0x1\n"
                "\tbeq _08112C84\n"
                "\tldr r1, _08112C8C @ =gUnknown_203B01A\n"
                "\tldrh r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r1]\n"
                "_08112C72:\n"
                "\tldr r0, _08112C90 @ =gUnknown_203AF98\n"
                "\tldr r1, _08112C94 @ =gUnknown_3005E8C\n"
                "\tldrh r0, [r0]\n"
                "\tldrh r1, [r1]\n"
                "\tcmp r0, r1\n"
                "\tbcc _08112C84\n"
                "\tldr r1, _08112C98 @ =gUnknown_3005E88\n"
                "\tmovs r0, 0\n"
                "\tstrb r0, [r1]\n"
                "_08112C84:\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_08112C8C: .4byte gUnknown_203B01A\n"
                "_08112C90: .4byte gUnknown_203AF98\n"
                "_08112C94: .4byte gUnknown_3005E8C\n"
                "_08112C98: .4byte gUnknown_3005E88");
}
#endif

void sub_8112C9C(void)
{
    gUnknown_203B01A++;
}

u8 sub_8112CAC(void)
{
    switch (gUnknown_3005E88)
    {
        case 0:
        default:
            return 0;
        case 1:
        case 3:
            return 1;
        case 2:
        case 4:
            return 2;
    }
}

bool8 sub_8112CEC(void)
{
    if (gUnknown_203AF98 >= gUnknown_3005E8C || ScriptContext2_IsEnabled() == TRUE)
        return TRUE;
    return FALSE;
}

bool8 sub_8112D1C(void)
{
    if (gUnknown_203AF98 >= gUnknown_3005E8C)
        return TRUE;
    return FALSE;
}

const struct UnkStruct_300201C gUnknown_84566A4 = {
    0,
    FALSE,
    0x7FFF
};

u16 * sub_8112D40(u8 a0, u16 a1)
{
    u16 * response;
    if (gUnknown_203AF98 == 0)
        return NULL;
    if (gUnknown_203AF98 >= gUnknown_3005E8C)
        return NULL;
    if (gUnknown_203B01E >= gUnknown_3002020)
        return NULL;
    if (gUnknown_300201C[gUnknown_203B01E].unk_0_0 == a1 && gUnknown_300201C[gUnknown_203B01E].unk_0_f == a0)
    {
        response = &gUnknown_300201C[gUnknown_203B01E].unk_2;
        gUnknown_203B01E++;
    }
    else
        response = NULL;
    return response;
}

void sub_8112DB0(u8 a0, u16 a1, u16 a2)
{
    if (gUnknown_203AF98 == 0)
        return;
    if (gUnknown_203AF98 >= gUnknown_3005E8C)
        return;
    if (gUnknown_203B01E >= gUnknown_3002020)
        return;
    gUnknown_300201C[gUnknown_203B01E].unk_0_0 = a1;
    gUnknown_300201C[gUnknown_203B01E].unk_0_f = a0;
    gUnknown_300201C[gUnknown_203B01E].unk_2 = a2;
    gUnknown_203B01E++;
}

void sub_8112E3C(u8 a0, struct UnkStruct_300201C * a1, u16 a2)
{
    s32 i;

    if (a0 == 0 || a0 > 2)
        gUnknown_3005E88 = 0;
    else
    {
        gUnknown_300201C = a1;
        gUnknown_3002020 = a2 >> 2;
        gUnknown_203B01E = 0;
        if (a0 == 2)
        {
            for (i = 0; i < gUnknown_3005E8C; i++)
            {
                gUnknown_300201C[i] = gUnknown_84566A4;
            }
        }
    }
}

const u16 gUnknown_84566A8[][16] = INCBIN_U16("data/graphics/unknown_84566a8.bin");

const struct WindowTemplate gUnknown_8456928 = {
    0x00, 0, 15, 30, 5, 15, 0x008F
};

void sub_8112EA8(void)
{
    gUnknown_203B020 = 0xFF;
}

u8 sub_8112EB4(void)
{
    if (gUnknown_203B020 == 0xFF)
    {
        gUnknown_203B020 = AddWindow(&gUnknown_8456928);
        PutWindowTilemap(gUnknown_203B020);
    }
    return gUnknown_203B020;
}

void sub_8112EDC(u8 a0)
{
    if (gUnknown_203B020 != 0xFF)
    {
        FillWindowPixelBuffer(gUnknown_203B020, 0x00);
        ClearWindowTilemap(gUnknown_203B020);

        if (a0)
            CopyWindowToVram(gUnknown_203B020, a0);

        RemoveWindow(gUnknown_203B020);
        gUnknown_203B020 = 0xFF;
    }
}

#ifdef NONMATCHING
void sub_8112F18(u8 a0)
{
    u8 width = GetWindowAttribute(a0, WINDOW_WIDTH);
    u8 height = GetWindowAttribute(a0, WINDOW_HEIGHT);
    u8 * buffer = Alloc(32 * width * height);
    u8 i, j;
    u8 k;

    if (buffer)
    {
        for (i = 0; i < height; i++)
        {
            for (j = 0; j < width; j++)
            {
                if (i == 0)
                    k = 0;
                else if (i == height - 1)
                    k = 14;
                else
                    k = 5;
                CpuCopy32(
                    gUnknown_84566A8[k], // operand swap on "add" instruction
                    buffer + 32 * (i * width + j),
                    32
                );
            }
        }
        CopyToWindowPixelBuffer(a0, buffer, width * height * 32, 0);
        Free(buffer);
    }
}
#else
NAKED
void sub_8112F18(u8 a0)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x8\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tmov r10, r0\n"
                "\tmovs r1, 0x3\n"
                "\tbl GetWindowAttribute\n"
                "\tlsls r0, 24\n"
                "\tlsrs r6, r0, 24\n"
                "\tmov r0, r10\n"
                "\tmovs r1, 0x4\n"
                "\tbl GetWindowAttribute\n"
                "\tlsls r0, 24\n"
                "\tlsrs r7, r0, 24\n"
                "\tlsls r0, r7, 5\n"
                "\tmuls r0, r6\n"
                "\tbl Alloc\n"
                "\tmov r8, r0\n"
                "\tcmp r0, 0\n"
                "\tbeq _08112FB8\n"
                "\tmovs r5, 0\n"
                "\tadds r0, r6, 0\n"
                "\tmuls r0, r7\n"
                "\tstr r0, [sp]\n"
                "\tcmp r5, r7\n"
                "\tbcs _08112FA2\n"
                "_08112F5A:\n"
                "\tmovs r4, 0\n"
                "\tadds r1, r5, 0x1\n"
                "\tmov r9, r1\n"
                "\tcmp r4, r6\n"
                "\tbcs _08112F98\n"
                "\tsubs r3, r7, 0x1\n"
                "_08112F66:\n"
                "\tmovs r0, 0\n"
                "\tcmp r5, 0\n"
                "\tbeq _08112F74\n"
                "\tmovs r0, 0x5\n"
                "\tcmp r5, r3\n"
                "\tbne _08112F74\n"
                "\tmovs r0, 0xE\n"
                "_08112F74:\n"
                "\tlsls r0, 5\n"
                "\tldr r1, _08112FC8 @ =gUnknown_84566A8\n"
                "\tadds r0, r1, r0\n"
                "\tadds r1, r5, 0\n"
                "\tmuls r1, r6\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 5\n"
                "\tadd r1, r8\n"
                "\tldr r2, _08112FCC @ =0x04000008\n"
                "\tstr r3, [sp, 0x4]\n"
                "\tbl CpuSet\n"
                "\tadds r0, r4, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tldr r3, [sp, 0x4]\n"
                "\tcmp r4, r6\n"
                "\tbcc _08112F66\n"
                "_08112F98:\n"
                "\tmov r1, r9\n"
                "\tlsls r0, r1, 24\n"
                "\tlsrs r5, r0, 24\n"
                "\tcmp r5, r7\n"
                "\tbcc _08112F5A\n"
                "_08112FA2:\n"
                "\tldr r0, [sp]\n"
                "\tlsls r2, r0, 21\n"
                "\tlsrs r2, 16\n"
                "\tmov r0, r10\n"
                "\tmov r1, r8\n"
                "\tmovs r3, 0\n"
                "\tbl CopyToWindowPixelBuffer\n"
                "\tmov r0, r8\n"
                "\tbl Free\n"
                "_08112FB8:\n"
                "\tadd sp, 0x8\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_08112FC8: .4byte gUnknown_84566A8\n"
                "_08112FCC: .4byte 0x04000008");
}
#endif

void sub_8112FD0(void)
{
    sub_8112F18(gUnknown_203B020);
}

const struct TextColor gUnknown_8456930 = {
    0, 10, 2
};

void sub_8112FE4(const u8 * a0)
{
    AddTextPrinterParametrized2(gUnknown_203B020, 0x02, 2, 5, 1, 1, &gUnknown_8456930, -1, a0);
}

void sub_8113018(const u8 * a0, u8 a1)
{
    sub_8112FD0();
    sub_8112FE4(a0);
    if (a1)
        CopyWindowToVram(gUnknown_203B020, a1);
}

void sub_8113044(void)
{
    VarSet(VAR_0x4038, 0);
    VarSet(VAR_0x4039, 0);
}

void sub_8113064(void)
{
    sub_8113078(VAR_0x4038_STRUCT);
}

void sub_8113078(struct Var4038Struct * varPtr)
{
    if (sub_8113508(varPtr))
    {
        sub_81132E0(varPtr);
        VarSet(VAR_0x4039, gSaveBlock2Ptr->playTimeHours);
    }
}

void sub_81130A8(void)
{
    sub_81130BC(VAR_0x4038_STRUCT);
}

void sub_81130BC(struct Var4038Struct * varPtr)
{
    if (!varPtr->unk_0_7)
    {
        sub_8113524(varPtr);
        sub_8113390(varPtr);
        VarSet(VAR_0x4039, gSaveBlock2Ptr->playTimeHours);
        FlagClear(FLAG_0x06C);
        FlagClear(FLAG_0x06D);
        FlagClear(FLAG_0x06E);
        FlagClear(FLAG_0x06F);
        VarSet(VAR_0x4073, 1);
    }
}

ALIGNED(4) const u8 gUnknown_8456934[] = {2, 1, 2, 1};

u8 sub_8113114(struct Var4038Struct * a0, u8 a1)
{
    if (VarGet(VAR_0x4073) == 2)
    {
        if (a0->unk_0_0 + gUnknown_8456934[a1] >= 20)
        {
            if (sub_81132A0(a0) < 3)
            {
                sub_8113194(a0);
                a0->unk_0_0 = 0;
            }
            else
                a0->unk_0_0 = 20;
        }
        else
            a0->unk_0_0 += gUnknown_8456934[a1];
    }

    return a0->unk_0_0;
}

const u8 gUnknown_8456938[] = {
    1, 3, 5, 0, 7, 6, 4, 2
};

u8 sub_8113194(struct Var4038Struct * a0)
{
    u8 i;
    u8 retval = 0;

    for (i = 0; i < 8; i++)
    {
        if (!((a0->unk_1 >> gUnknown_8456938[i]) & 1))
        {
            retval = i;
            if (Random() % 2)
            {
                a0->unk_1 |= 1 << gUnknown_8456938[i];
                return gUnknown_8456938[i];
            }
        }
    }
    a0->unk_1 |= 1 << gUnknown_8456938[retval];
    return gUnknown_8456938[retval];
}

const u8 gUnknown_8456940[] = {
    5, 6, 3, 7, 4, 1, 0, 2
};

u8 sub_81131FC(struct Var4038Struct * a0)
{
    u8 i;
    u8 retval = 0;

    if (sub_81132A0(a0) == 1)
        return 0;

    for (i = 0; i < 8; i++)
    {
        if ((a0->unk_1 >> gUnknown_8456940[i]) & 1)
        {
            retval = i;
            if (Random() % 2)
            {
                a0->unk_1 ^= 1 << gUnknown_8456940[i];
                return gUnknown_8456940[i];
            }
        }
    }
    if ((a0->unk_1 >> gUnknown_8456940[retval]) & 1)
        a0->unk_1 ^= 1 << gUnknown_8456940[retval];
    return gUnknown_8456940[retval];
}

u16 sub_8113288(void)
{
    return sub_81132A0(VAR_0x4038_STRUCT);
}

u16 sub_81132A0(struct Var4038Struct * a0)
{
    u8 count = 0;
    u8 i;

    for (i = 0; i < 8; i++)
    {
        if ((a0->unk_1 >> i) & 1)
            count++;
    }

    return count;
}

void sub_81132CC(void)
{
    sub_81132E0(VAR_0x4038_STRUCT);
}

void sub_81132E0(struct Var4038Struct * a0)
{
    u8 i = 0;
    u16 var_4039;

    if (gSaveBlock2Ptr->playTimeHours < 999)
    {
        while (1)
        {
            if (sub_81132A0(a0) < 5)
            {
                VarSet(VAR_0x4039, gSaveBlock2Ptr->playTimeHours);
                break;
            }
            if (i == 8)
                break;
            var_4039 = VarGet(VAR_0x4039);
            if (gSaveBlock2Ptr->playTimeHours - var_4039 < 12)
                break;
            sub_81131FC(a0);
            var_4039 = VarGet(VAR_0x4039);
            VarSet(VAR_0x4039, var_4039 + 12);
            i++;
        }
    }
}

bool16 sub_8113364(void)
{
    return sub_811337C(VAR_0x4038_STRUCT);
}

bool16 sub_811337C(struct Var4038Struct * a0)
{
    return (a0->unk_1 >> gUnknown_20370C0) & 1;
}

void sub_8113390(struct Var4038Struct * a0)
{
    a0->unk_1 |= 1;
    a0->unk_1 |= 2;
    a0->unk_1 |= 4;
}

void sub_81133A4(void)
{
    u8 r3 = 0;
    u8 r2 = 0;

    switch (gUnknown_20370C0)
    {
        case 0:
            r2 = 0;
            r3 = 0;
            break;
        case 1:
        case 2:
        case 3:
        case 7:
            break;
        case 4:
            r2 = 1;
            r3 = 0;
            break;
        case 5:
            r2 = 0;
            r3 = 1;
            break;
        case 6:
            r2 = 2;
            r3 = 1;
            break;
    }
    sub_8113414(gSaveBlock2Ptr->unk_A98, r3, r2);
}

void sub_8113414(u8 (* a0)[16], u8 a1, u8 a2)
{
    u8 * str;
    const u8 * src = a0[a1];
    if (src[0] == EOS)
    {
        switch (a2)
        {
            case 0:
                StringCopy(gStringVar1, gSaveBlock1Ptr->rivalName);
                break;
            case 1:
                StringCopy(gStringVar1, gUnknown_84178D0);
                break;
            case 2:
                StringCopy(gStringVar1, gUnknown_84178DA);
                break;
            default:
                StringCopy(gStringVar1, gSaveBlock1Ptr->rivalName);
                break;
        }
    }
    else
    {
        str = gStringVar1;
        StringCopyN(str, src, 7);
        str[7] = EOS;
        if (   str[0] == EXT_CTRL_CODE_BEGIN
            && str[1] == EXT_CTRL_CODE_JPN)
        {
            str += 2;
            while (*str != EOS)
                str++;
            *str++ = EXT_CTRL_CODE_BEGIN;
            *str++ = EXT_CTRL_CODE_ENG;
            *str++ = EOS;
        }
    }
}

void sub_81134B8(void)
{
    sub_81134CC(VAR_0x4038_STRUCT);
}

void sub_81134CC(struct Var4038Struct * a0)
{
    if (VarGet(VAR_0x4073) == 2)
    {
        sub_8113078(a0);
        if (gUnknown_2023E8A == 1)
            sub_8113194(a0);
        else
            sub_81131FC(a0);
    }
}

bool8 sub_8113508(struct Var4038Struct * a0)
{
    return a0->unk_0_7;
}

void sub_8113510(void)
{
    sub_8113524(VAR_0x4038_STRUCT);
}

void sub_8113524(struct Var4038Struct * a0)
{
    a0->unk_0_7 = TRUE;
}

u8 sub_8113530(void)
{
    return sub_8113114(VAR_0x4038_STRUCT, gUnknown_20370C0);
}

static u16 * (*const sQuestLogStorageCBs[])(u16 *, u16 *) = {
    NULL,
    NULL,
    NULL,
    sub_8113F14,
    sub_8113F80,
    sub_8114174,
    sub_81141D0,
    sub_811422C,
    sub_8114288,
    sub_8114310,
    sub_8114380,
    sub_81143F0,
    sub_811445C,
    sub_81144EC,
    sub_8114578,
    sub_8114604,
    sub_8114710,
    sub_8114744,
    sub_8114778,
    sub_8114808,
    sub_811488C,
    sub_8114918,
    sub_8114990,
    sub_8114A1C,
    sub_8114AA0,
    sub_8114B0C,
    sub_8114B78,
    sub_8114BE4,
    sub_8114C68,
    sub_8114CC0,
    sub_8114D4C,
    sub_8114DE8,
    sub_8114FF0,
    sub_8115078,
    sub_81151C0,
    sub_8115280,
    sub_8115410,
    sub_81154DC,
    sub_81155A4,
    NULL,
    sub_81156D8,
    NULL,
    sub_81157DC
};

#ifdef NONMATCHING
void sub_8113550(u16 a0, u16 * a1)
{
    u16 * r1;

    if (a0 == 35 && gUnknown_203B048 == 2)
    {
        sub_811381C();
        return;
    }
    sub_811381C();
    if (gUnknown_203ADFA == 2)
        return;

    if (a0 < 3 || a0 > 26)
        return;

    if (sub_81136D4() == TRUE)
        return;

    if (sub_81138A0(a0, a1) == TRUE)
        return;

    if (sub_80BF708() == TRUE)
        return;

    // NONMATCHING: branch logic here
    if (InUnionRoom() == TRUE)
        return;

    if (sub_8113954(a0, a1) == TRUE)
        return;

    if (sub_8113A44(a0, a1) == TRUE)
        return;

    if (sub_81153E4(a0, a1) == FALSE)
        return;

    if (gUnknown_3005E88 == 0)
    {
        if (sub_8113778(a0, a1) == TRUE)
            return;

        if (a0 != 31 || gUnknown_203AE04 == NULL)
        {
            if (sub_81153A8(a0, a1) == FALSE)
                return;
            sub_8110AEC(a0);
        }
    }
    else if (a0 == 40)
        return;

    sub_8113B94(a0);
    if (a0 == 31)
    {
        if (gUnknown_203AE04 == NULL)
        {
            gUnknown_203AE04 = gUnknown_203AE08;
            r1 = sQuestLogStorageCBs[a0](gUnknown_203AE04, a1);
        }
        else
        {
            sQuestLogStorageCBs[a0](gUnknown_203AE04, a1);
            return;
        }
    }
    else
    {
        gUnknown_203AE04 = NULL;
        r1 = sQuestLogStorageCBs[a0](gUnknown_203AE08, a1);
    }

    if (r1 == NULL)
    {
        r1 = sub_8113828(a0, a1);
        if (r1 == NULL)
            return;
    }

    gUnknown_203AE08 = r1;
    if (gUnknown_203B048 == 0)
        return;
    sub_811231C();
}
#else
NAKED
void sub_8113550(u16 a0, u16 * a1)
{
    asm_unified("\tpush {r4,r5,lr}\n"
                "\tadds r5, r1, 0\n"
                "\tlsls r0, 16\n"
                "\tlsrs r4, r0, 16\n"
                "\tcmp r4, 0x23\n"
                "\tbne _08113570\n"
                "\tldr r0, _0811356C @ =gUnknown_203B048\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r0, 0x2\n"
                "\tbne _08113570\n"
                "\tbl sub_811381C\n"
                "\tb ._return\n"
                "\t.align 2, 0\n"
                "_0811356C: .4byte gUnknown_203B048\n"
                "_08113570:\n"
                "\tbl sub_811381C\n"
                "\tldr r0, _0811362C @ =gUnknown_203ADFA\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r0, 0x2\n"
                "\tbne _0811357E\n"
                "\tb ._return\n"
                "_0811357E:\n"
                "\tsubs r0, r4, 0x3\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tcmp r0, 0x27\n"
                "\tbls _0811358A\n"
                "\tb ._return\n"
                "_0811358A:\n"
                "\tbl sub_81136D4\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tcmp r0, 0x1\n"
                "\tbne _08113598\n"
                "\tb ._return\n"
                "_08113598:\n"
                "\tadds r0, r4, 0\n"
                "\tadds r1, r5, 0\n"
                "\tbl sub_81138A0\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tcmp r0, 0x1\n"
                "\tbne _081135AA\n"
                "\tb ._return\n"
                "_081135AA:\n"
                "\tbl sub_80BF708\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tcmp r0, 0x1\n"
                "\tbne _081135B8\n"
                "\tb ._return\n"
                "_081135B8:\n"
                "\tbl InUnionRoom\n"
                "\tcmp r0, 0x1\n"
                "\tbne _081135C2\n"
                "\tb ._return\n"
                "_081135C2:\n"
                "\tadds r0, r4, 0\n"
                "\tadds r1, r5, 0\n"
                "\tbl sub_8113954\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tcmp r0, 0x1\n"
                "\tbeq ._return\n"
                "\tadds r0, r4, 0\n"
                "\tadds r1, r5, 0\n"
                "\tbl sub_8113A44\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tcmp r0, 0x1\n"
                "\tbeq ._return\n"
                "\tadds r0, r4, 0\n"
                "\tadds r1, r5, 0\n"
                "\tbl sub_81153E4\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbeq ._return\n"
                "\tldr r0, _08113630 @ =gUnknown_3005E88\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r0, 0\n"
                "\tbne _08113638\n"
                "\tadds r0, r4, 0\n"
                "\tadds r1, r5, 0\n"
                "\tbl sub_8113778\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tcmp r0, 0x1\n"
                "\tbeq ._return\n"
                "\tcmp r4, 0x1F\n"
                "\tbne _08113614\n"
                "\tldr r0, _08113634 @ =gUnknown_203AE04\n"
                "\tldr r0, [r0]\n"
                "\tcmp r0, 0\n"
                "\tbne _0811363C\n"
                "_08113614:\n"
                "\tadds r0, r4, 0\n"
                "\tadds r1, r5, 0\n"
                "\tbl sub_81153A8\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbeq ._return\n"
                "\tadds r0, r4, 0\n"
                "\tbl sub_8110AEC\n"
                "\tb _0811363C\n"
                "\t.align 2, 0\n"
                "_0811362C: .4byte gUnknown_203ADFA\n"
                "_08113630: .4byte gUnknown_3005E88\n"
                "_08113634: .4byte gUnknown_203AE04\n"
                "_08113638:\n"
                "\tcmp r4, 0x28\n"
                "\tbeq ._return\n"
                "_0811363C:\n"
                "\tadds r0, r4, 0\n"
                "\tbl sub_8113B94\n"
                "\tcmp r4, 0x1F\n"
                "\tbne _0811367C\n"
                "\tldr r2, _0811365C @ =gUnknown_203AE04\n"
                "\tldr r1, [r2]\n"
                "\tcmp r1, 0\n"
                "\tbne _08113668\n"
                "\tldr r0, _08113660 @ =gUnknown_203AE08\n"
                "\tldr r0, [r0]\n"
                "\tstr r0, [r2]\n"
                "\tldr r1, _08113664 @ =sQuestLogStorageCBs\n"
                "\tldr r2, [r1, 0x7C]\n"
                "\tb _0811368E\n"
                "\t.align 2, 0\n"
                "_0811365C: .4byte gUnknown_203AE04\n"
                "_08113660: .4byte gUnknown_203AE08\n"
                "_08113664: .4byte sQuestLogStorageCBs\n"
                "_08113668:\n"
                "\tldr r0, _08113678 @ =sQuestLogStorageCBs\n"
                "\tldr r2, [r0, 0x7C]\n"
                "\tadds r0, r1, 0\n"
                "\tadds r1, r5, 0\n"
                "\tbl _call_via_r2\n"
                "\tb ._return\n"
                "\t.align 2, 0\n"
                "_08113678: .4byte sQuestLogStorageCBs\n"
                "_0811367C:\n"
                "\tldr r1, _081136C4 @ =gUnknown_203AE04\n"
                "\tmovs r0, 0\n"
                "\tstr r0, [r1]\n"
                "\tldr r0, _081136C8 @ =sQuestLogStorageCBs\n"
                "\tlsls r1, r4, 2\n"
                "\tadds r1, r0\n"
                "\tldr r0, _081136CC @ =gUnknown_203AE08\n"
                "\tldr r0, [r0]\n"
                "\tldr r2, [r1]\n"
                "_0811368E:\n"
                "\tadds r1, r5, 0\n"
                "\tbl _call_via_r2\n"
                "\tadds r1, r0, 0\n"
                "\tcmp r1, 0\n"
                "\tbne _081136AC\n"
                "\tbl sub_811231C\n"
                "\tadds r0, r4, 0\n"
                "\tadds r1, r5, 0\n"
                "\tbl sub_8113828\n"
                "\tadds r1, r0, 0\n"
                "\tcmp r1, 0\n"
                "\tbeq ._return\n"
                "_081136AC:\n"
                "\tldr r0, _081136CC @ =gUnknown_203AE08\n"
                "\tstr r1, [r0]\n"
                "\tldr r0, _081136D0 @ =gUnknown_203B048\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r0, 0\n"
                "\tbeq ._return\n"
                "\tbl sub_811231C\n"
                "._return:\n"
                "\tpop {r4,r5}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_081136C4: .4byte gUnknown_203AE04\n"
                "_081136C8: .4byte sQuestLogStorageCBs\n"
                "_081136CC: .4byte gUnknown_203AE08\n"
                "_081136D0: .4byte gUnknown_203B048");
}
#endif // NONMATCHING

bool8 sub_81136D4(void)
{
    if (gSaveBlock1Ptr->location.mapGroup == 2 && (gSaveBlock1Ptr->location.mapNum == 1 || gSaveBlock1Ptr->location.mapNum == 2 || gSaveBlock1Ptr->location.mapNum == 3 || gSaveBlock1Ptr->location.mapNum == 4 || gSaveBlock1Ptr->location.mapNum == 5 || gSaveBlock1Ptr->location.mapNum == 6 || gSaveBlock1Ptr->location.mapNum == 7 || gSaveBlock1Ptr->location.mapNum == 8 || gSaveBlock1Ptr->location.mapNum == 9 || gSaveBlock1Ptr->location.mapNum == 10 || gSaveBlock1Ptr->location.mapNum == 11))
        return TRUE;

    if (gSaveBlock1Ptr->location.mapGroup == 14 && gSaveBlock1Ptr->location.mapNum == 9)
        return TRUE;

    if (gSaveBlock1Ptr->location.mapGroup == 31 && (gSaveBlock1Ptr->location.mapNum == 0 || gSaveBlock1Ptr->location.mapNum == 1))
        return TRUE;

    if ((gSaveBlock1Ptr->location.mapGroup == 1 && gSaveBlock1Ptr->location.mapNum == 46) || (gSaveBlock1Ptr->location.mapGroup == 1 && gSaveBlock1Ptr->location.mapNum == 58) || (gSaveBlock1Ptr->location.mapGroup == 2 && gSaveBlock1Ptr->location.mapNum == 11) || (gSaveBlock1Ptr->location.mapGroup == 10 && gSaveBlock1Ptr->location.mapNum == 6))
        return TRUE;

    return FALSE;
}

bool8 sub_8113748(void)
{
    if (sub_81136D4() != TRUE)
        return FALSE;

    if (gUnknown_203ADFA == 2)
        return TRUE;

    if (gUnknown_203ADFA == 1)
        sub_8112364();

    return FALSE;
}

bool8 sub_8113778(u16 a0, u16 * a1)
{
    if (a0 == 36 || a0 == 11)
        return TRUE;

    if (!FlagGet(0x82C))
    {
        if (a0 == 3 || a0 == 31 || sub_81137E4(a0, a1) == TRUE)
            return TRUE;
    }

    if (!FlagGet(0x844))
    {
        if (a0 == 4 || a0 == 5 || a0 == 6 || a0 == 7 || a0 == 8 || a0 == 9 || a0 == 10 || a0 == 22 || a0 == 25 || a0 == 26)
            return TRUE;
    }

    return FALSE;
}

bool8 sub_81137E4(u16 a0, u16 * a1)
{
    if (a0 == 34)
    {
        u8 trainerClass = gTrainers[*a1].trainerClass;
        if (   trainerClass == 0x51
            || trainerClass == 0x59
            || trainerClass == 0x5A
            || trainerClass == 0x53)
            return FALSE;
        return TRUE;
    }
    return FALSE;
}

void sub_811381C(void)
{
    gUnknown_203B048 = 0;
}

u16 * sub_8113828(u16 a0, u16 * a1)
{
    if (sub_8113778(a0, a1) == TRUE)
        return NULL;

    if (sub_81153A8(a0, a1) == FALSE)
        return NULL;

    sub_8110AEC(a0);
    sub_8113B94(a0);

    if (a0 == 31)
        gUnknown_203AE04 = gUnknown_203AE08;
    else
        gUnknown_203AE04 = NULL;

    return sQuestLogStorageCBs[a0](gUnknown_203AE08, a1);
}

bool8 sub_81138A0(u16 a0, u16 * a1)
{
    if (a0 < 12 || a0 > 19)
        return FALSE;

    sub_81138F8();
    gUnknown_203B024.unk_00 = a0;

    if (a0 < 16 || a0 > 17)
    {
        if (a0 == 12 || a0 == 18)
            memcpy(&gUnknown_203B024.unk_04, a1, 12);
        else
            memcpy(&gUnknown_203B024.unk_04, a1, 24);
    }
    return TRUE;
}

void sub_81138F8(void)
{
    gUnknown_203B024 = (struct UnkStruct_203B024){};
}

void sub_811390C(void)
{
    if (gUnknown_203B024.unk_00 != 0)
    {
        u16 * resp;
        gUnknown_203B04A = 0;
        sub_8110AEC(gUnknown_203B024.unk_00);
        resp = sQuestLogStorageCBs[gUnknown_203B024.unk_00](gUnknown_203AE08, (u16 *)&gUnknown_203B024.unk_04);
        gUnknown_203AE08 = resp;
        sub_81138F8();
    }
}

bool8 sub_8113954(u16 a0, u16 * a1)
{
    if (a0 != 34 && a0 != 30 && a0 != 32 && a0 != 33)
        return FALSE;
    sub_81138F8();
    if (gUnknown_3005E88 || FlagGet(0x82C) || sub_81137E4(a0, a1) != TRUE)
    {
        gUnknown_203B024.unk_00 = a0;
        memcpy(&gUnknown_203B024.unk_04, a1, 8);
    }
    return TRUE;
}

void sub_81139BC(void)
{
    if (gUnknown_203B024.unk_00 != 0)
    {
        u16 * resp;
        if (gUnknown_3005E88 == 0)
        {
            gUnknown_203B04A = 0;
            sub_8110AEC(gUnknown_203B024.unk_00);
        }
        sub_8113B94(gUnknown_203B024.unk_00);
        resp = sQuestLogStorageCBs[gUnknown_203B024.unk_00](gUnknown_203AE08, (u16 *)&gUnknown_203B024.unk_04);
        gUnknown_203AE08 = resp;
        sub_8113A1C(1);
        sub_81138F8();
        sub_811231C();
    }
}

void sub_8113A1C(u16 a0)
{
    gUnknown_203AE08 = sub_8113C5C(gUnknown_203AE08, a0);
    gUnknown_203AF98++;
}

bool8 sub_8113A44(u16 a0, u16 *a1)
{
    if (a0 != 31)
        return FALSE;

    if (sub_8114FBC(a1[0]) == TRUE)
        return TRUE;

    if (sub_8114FBC(a1[1]) == TRUE)
        return TRUE;

    return FALSE;
}

static u16 * (*const sQuestLogScriptParsingCBs[])(u16 *) = {
    NULL,
    NULL,
    NULL,
    sub_8113F3C,
    sub_8113FBC,
    sub_8114188,
    sub_81141E4,
    sub_8114240,
    sub_811429C,
    sub_8114324,
    sub_8114394,
    sub_811443C,
    sub_811448C,
    sub_8114518,
    sub_81145A4,
    sub_811464C,
    sub_8114724,
    sub_8114758,
    sub_81147A8,
    sub_8114834,
    sub_81148BC,
    sub_8114944,
    sub_81149D0,
    sub_8114A4C,
    sub_8114AC8,
    sub_8114B34,
    sub_8114BA0,
    sub_8114C0C,
    sub_8114C8C,
    sub_8114CE4,
    sub_8114D68,
    sub_8114E68,
    sub_811500C,
    sub_81150CC,
    sub_81151DC,
    sub_81152BC,
    sub_8115460,
    sub_8115518,
    sub_81155E0,
    NULL,
    sub_8115700,
    NULL,
    sub_8115800
};

const u8 gUnknown_8456AA0[] = {
    0x08,
    0x08,
    0x08,
    0x08,
    0x0a,
    0x08,
    0x08,
    0x08,
    0x08,
    0x0a,
    0x0a,
    0x04,
    0x10,
    0x0c,
    0x0c,
    0x1a,
    0x04,
    0x04,
    0x10,
    0x0c,
    0x0a,
    0x0a,
    0x0a,
    0x08,
    0x08,
    0x08,
    0x08,
    0x06,
    0x06,
    0x06,
    0x0c,
    0x0c,
    0x0c,
    0x0a,
    0x0c,
    0x06,
    0x08,
    0x0e,
    0x0e,
    0x02,
    0x08,
    0x04,
    0x06
};

u16 * sub_8113A78(u16 * a0, u16 **a1)
{
    u16 r2 = a0[0] & 0xfff;
    u16 r4 = a0[0] >> 12;
    if (r2 == 33)
        r4 = 0;
    if (r2 < 3 || r2 > 42)
        return NULL;
    *a1 = a0;
    return gUnknown_8456AA0[r2] + (gUnknown_8456AA0[r2] - 4) * r4 + (void *)a0;
}

void sub_8113ABC(u16 * a0)
{
    u8 * r2 = (u8 *)(a0 + 2);
    if ((a0[0] & 0xFFF) != 35)
        gUnknown_203B04A = 0;
    else
        gUnknown_203B04A = r2[1] + 1;
}

#ifdef NONMATCHING
bool8 sub_8113AE8(u16 * a0)
{
    if (a0 == NULL || a0[1] > gUnknown_203AF98)
        return FALSE;

    sQuestLogScriptParsingCBs[a0[0] & 0xFFF](a0);
    gUnknown_203B044.unk_0 = a0[0];
    gUnknown_203B044.unk_1 = (a0[0] & 0xF000) >> 12;
    if (gUnknown_203B044.unk_1 != 0)
        gUnknown_203B044.unk_2 = 1;
    return TRUE;
}
#else
NAKED
bool8 sub_8113AE8(u16 * a0)
{
    asm_unified("\tpush {r4,lr}\n"
                "\tadds r4, r0, 0\n"
                "\tcmp r0, 0\n"
                "\tbeq _08113AFA\n"
                "\tldr r1, _08113B00 @ =gUnknown_203AF98\n"
                "\tldrh r0, [r0, 0x2]\n"
                "\tldrh r1, [r1]\n"
                "\tcmp r0, r1\n"
                "\tbls _08113B04\n"
                "_08113AFA:\n"
                "\tmovs r0, 0\n"
                "\tb _08113B32\n"
                "\t.align 2, 0\n"
                "_08113B00: .4byte gUnknown_203AF98\n"
                "_08113B04:\n"
                "\tldr r2, _08113B38 @ =sQuestLogScriptParsingCBs\n"
                "\tldrh r1, [r4]\n"
                "\tldr r0, _08113B3C @ =0x00000fff\n"
                "\tands r0, r1\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r2\n"
                "\tldr r1, [r0]\n"
                "\tadds r0, r4, 0\n"
                "\tbl _call_via_r1\n"
                "\tldr r2, _08113B40 @ =gUnknown_203B044\n"
                "\tldrh r1, [r4]\n"
                "\tstrb r1, [r2]\n"
                "\tmovs r0, 0xF0\n"
                "\tlsls r0, 8\n"
                "\tands r0, r1\n"
                "\tlsrs r0, 12\n"
                "\tstrb r0, [r2, 0x1]\n"
                "\tcmp r0, 0\n"
                "\tbeq _08113B30\n"
                "\tmovs r0, 0x1\n"
                "\tstrh r0, [r2, 0x2]\n"
                "_08113B30:\n"
                "\tmovs r0, 0x1\n"
                "_08113B32:\n"
                "\tpop {r4}\n"
                "\tpop {r1}\n"
                "\tbx r1\n"
                "\t.align 2, 0\n"
                "_08113B38: .4byte sQuestLogScriptParsingCBs\n"
                "_08113B3C: .4byte 0x00000fff\n"
                "_08113B40: .4byte gUnknown_203B044");
}
#endif

bool8 sub_8113B44(u16 * a0)
{
    if (gUnknown_203B044.unk_2 == 0)
        return FALSE;

    sQuestLogScriptParsingCBs[gUnknown_203B044.unk_0](a0);
    gUnknown_203B044.unk_2++;
    if (gUnknown_203B044.unk_2 > gUnknown_203B044.unk_1)
        sub_8113B88();
    return TRUE;
}

void sub_8113B88(void)
{
    gUnknown_203B044 = (struct UnkStruct_203B044){};
}

void sub_8113B94(u16 a0)
{
    if (gUnknown_203B044.unk_0 != (u8)a0 || gUnknown_203B044.unk_2 != gUnknown_203AF98)
    {
        gUnknown_203B044.unk_0 = a0;
        gUnknown_203B044.unk_1 = 0;
        gUnknown_203B044.unk_2 = gUnknown_203AF98;
    }
    else if (gUnknown_203B044.unk_1 < 5)
        gUnknown_203B044.unk_1++;
}

void sub_8113BD8(void)
{
    gUnknown_203B049 = 0;
    gUnknown_203B04A = 0;
    gUnknown_203B04B = 0;
}

u16 * sub_8113BF4(u16 * a0)
{
    if (!sub_8110988(a0, gUnknown_8456AA0[39]))
        return NULL;
    a0[0] = 39;
    return a0 + 1;
}

u16 * sub_8113C20(u16 * a0, struct UnkStruct_203AE98 * a1)
{
    if (!sub_8110988(a0, gUnknown_8456AA0[39]))
        return NULL;
    a1->unk_6 = 0xFF;
    a1->unk_4 = 0;
    a1->unk_0 = 0;
    a1->unk_1 = 0;
    a1->unk_2 = 0;
    a1->unk_3 = 0;
    return a0 + 1;
}

u16 * sub_8113C5C(u16 * a0, u16 a1)
{
    if (!sub_8110988(a0, gUnknown_8456AA0[41]))
        return NULL;
    a0[0] = 41;
    a0[1] = a1;
    return a0 + 2;
}

u16 * sub_8113C8C(u16 * a0, struct UnkStruct_203AE98 * a1)
{
    if (!sub_8110988(a0, gUnknown_8456AA0[41]))
        return NULL;
    a1->unk_6 = 0xFE;
    a1->unk_4 = a0[1];
    a1->unk_0 = 0;
    a1->unk_1 = 0;
    a1->unk_2 = 0;
    a1->unk_3 = 0;
    return a0 + 2;
}

u16 * sub_8113CC8(u16 * a0, struct UnkStruct_203AE98 * a1)
{
    u8 * r6 = (u8 *)a0 + 4;

    if (!sub_8110988(a0, gUnknown_8456AA0[0]))
        return NULL;
    a0[0] = 0;
    a0[1] = a1->unk_4;
    r6[0] = a1->unk_0;
    r6[1] = a1->unk_1;
    r6[2] = a1->unk_2;
    r6[3] = a1->unk_3;
    return (u16 *)(r6 + 4);
}

u16 * sub_8113D08(u16 * a0, struct UnkStruct_203AE98 * a1)
{
    u8 * r6 = (u8 *)a0 + 4;

    if (!sub_8110988(a0, gUnknown_8456AA0[0]))
        return NULL;
    a1->unk_6 = 2;
    a1->unk_4 = a0[1];
    a1->unk_0 = r6[0];
    a1->unk_1 = r6[1];
    a1->unk_2 = r6[2];
    a1->unk_3 = r6[3];
    return (u16 *)(r6 + 4);
}

u16 * sub_8113D48(u16 * a0, struct UnkStruct_203AE98 * a1)
{
    u16 * r4 = a0;
    u8 * r6 = (u8 *)a0 + 4;

    if (!sub_8110988(r4, gUnknown_8456AA0[2]))
        return NULL;
    if (a1->unk_6 == 0)
        r4[0] = 2;
    else
        r4[0] = 1;
    r4[1] = a1->unk_4;
    r6[0] = a1->unk_0;
    r6[1] = a1->unk_1;
    r6[2] = a1->unk_2;
    r6[3] = a1->unk_3;
    return (u16 *)(r6 + 4);
}

u16 * sub_8113D94(u16 * a0, struct UnkStruct_203AE98 * a1)
{
    u16 * r5 = a0;
    u8 * r6 = (u8 *)a0 + 4;

    if (!sub_8110988(r5, gUnknown_8456AA0[2]))
        return NULL;
    if (r5[0] == 2)
        a1->unk_6 = 0;
    else
        a1->unk_6 = 1;
    a1->unk_4 = r5[1];
    a1->unk_0 = r6[0];
    a1->unk_1 = r6[1];
    a1->unk_2 = r6[2];
    a1->unk_3 = r6[3];
    return (u16 *)(r6 + 4);
}

u16 * sub_8113DE0(u16 a0, u16 * a1)
{
    u8 r6;
    u16 * r5;
    u8 r4;
    u8 r1;

    if (gUnknown_203B044.unk_1 == 0)
        r6 = gUnknown_8456AA0[a0];
    else
        r6 = gUnknown_8456AA0[a0] - 4;
    if (!sub_8110944(a1, r6))
        return NULL;

    r5 = (void *)a1;

    if (gUnknown_203B044.unk_1 != 0)
        r5 = (void *)r5 - (gUnknown_203B044.unk_1 * r6 + 4);

    if (gUnknown_203B044.unk_1 == 5)
    {
        for (r4 = 0; r4 < 4; r4++)
        {
            memcpy(
                (void *)r5 + (r4 * r6 + 4),
                (void *)r5 + ((r4 + 1) * r6 + 4),
                r6
            );
        }
        r1 = 4;
    }
    else
        r1 = gUnknown_203B044.unk_1;

    r5[0] = a0 + (r1 << 12);
    r5[1] = gUnknown_203AF98;
    r5 = (void *)r5 + (r1 * r6 + 4);
    return r5;
}

u16 * sub_8113E88(u16 a0, u16 * a1)
{
    a1 = (void *)a1 + (gUnknown_203B044.unk_2 * (gUnknown_8456AA0[a0] - 4) + 4);
    return a1;
}

// TODO: delete this declaration once data_83FECCC.s is decompiled
extern const u8 gText_EggNickname[];

void QuestLog_AutoGetSpeciesName(u16 a0, u8 * a1, u8 a2)
{
    if (a1 != NULL)
    {
        if (a0 != SPECIES_EGG)
            GetSpeciesName(a1, a0);
        else
            StringCopy(a1, gText_EggNickname);
    }
    else
    {
        if (a0 != SPECIES_EGG)
            UnkTextUtil_SetPtrI(a2, gSpeciesNames[a0]);
        else
            UnkTextUtil_SetPtrI(a2, gText_EggNickname);
    }
}

u16 * sub_8113F14(u16 * a0, u16 * a1)
{
    u16 * r2 = sub_8113DE0(3, a0);
    if (r2 == NULL)
        return NULL;
    
    r2[0] = a1[0];
    r2[1] = a1[1];
    return r2 + 2;
}

u16 * sub_8113F3C(u16 * a0)
{
    u16 * r4 = sub_8113E88(3, a0);
    QuestLog_AutoGetSpeciesName(r4[0], gStringVar1, 0);
    QuestLog_AutoGetSpeciesName(r4[1], gStringVar2, 0);
    StringExpandPlaceholders(gStringVar4, gUnknown_841A16F);
    r4 += 2;
    return r4;
}

u16 * sub_8113F80(u16 * a0, u16 * a1)
{
    u16 * r2 = sub_8113DE0(4, a0);
    if (r2 == NULL)
        return NULL;

    r2[0] = a1[0];
    r2[1] = a1[2];
    r2[2] = a1[3];

    if (a1[0] == ITEM_ESCAPE_ROPE)
        gUnknown_203B048 = 2;

    return r2 + 3;
}

u16 * sub_8113FBC(u16 * a0)
{
    u16 * r5 = sub_8113E88(4, a0);

    switch (ItemId_GetPocket(r5[0]))
    {
        case POCKET_ITEMS:
        case POCKET_POKE_BALLS:
        case POCKET_BERRY_POUCH:
            StringCopy(gStringVar1, ItemId_GetItem(r5[0])->name);
            if (r5[0] == ITEM_ESCAPE_ROPE)
            {
                sub_80C4DF8(gStringVar2, r5[2]);
                StringExpandPlaceholders(gStringVar4, gUnknown_841AFA6);
            }
            else if (r5[1] != 0xFFFF)
            {
                QuestLog_AutoGetSpeciesName(r5[1], gStringVar2, 0);
                StringExpandPlaceholders(gStringVar4, gUnknown_841A1E7);
            }
            else
            {
                StringExpandPlaceholders(gStringVar4, gUnknown_841A210);
            }
            break;
        case POCKET_KEY_ITEMS:
            StringCopy(gStringVar1, ItemId_GetItem(r5[0])->name);
            StringExpandPlaceholders(gStringVar4, gUnknown_841A220);
            break;
        case POCKET_TM_CASE:
            QuestLog_AutoGetSpeciesName(r5[1], gStringVar1, 0);
            StringCopy(gStringVar2, gMoveNames[ItemIdToBattleMoveId(r5[0])]);
            if (r5[2] != 0xFFFF)
            {
                StringCopy(gStringVar3, gMoveNames[r5[2]]);
                if (r5[0] > ITEM_TM50)
                    StringExpandPlaceholders(gStringVar4, gUnknown_841A965);
                else
                    StringExpandPlaceholders(gStringVar4, gUnknown_841A277);
            }
            else
            {
                if (r5[0] > ITEM_TM50)
                    StringExpandPlaceholders(gStringVar4, gUnknown_841A938);
                else
                    StringExpandPlaceholders(gStringVar4, gUnknown_841A255);
            }
            break;
    }
    return r5 + 3;
}
