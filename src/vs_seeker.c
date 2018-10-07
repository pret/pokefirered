#include "global.h"
#include "songs.h"
#include "sound.h"
#include "task.h"
#include "malloc.h"
#include "field_map_obj.h"
#include "new_menu_helpers.h"
#include "item_use.h"
#include "event_scripts.h"
#include "event_data.h"
#include "script.h"
#include "map_obj_lock.h"
#include "field_specials.h"
#include "item_menu.h"
#include "field_effect.h"
#include "script_movement.h"
#include "battle_setup.h"
#include "random.h"
#include "field_map_obj.h"
#include "vs_seeker.h"

// static types
struct UnkStruct_845318C
{
    // TODO: populate
};

extern struct MapObject gUnknown_2036E38[MAP_OBJECTS_COUNT];

// static declarations
EWRAM_DATA struct VsSeekerStruct *gUnknown_203ADB8;
void sub_810C730(u8 taskId);
void sub_810C760(u8 taskId);
void sub_810C808(void);
void sub_810C8EC(u8 taskId);
void sub_810D304(void);
bool8 sub_810C96C(void);
void sub_810C604(void);
u8 sub_810C9A8(const void *);
bool8 sub_810D0FC(struct VsSeekerSubstruct *);
u16 sub_810D074(const u8 *);
u8 sub_810D1CC(void);
void sub_810D24C(struct VsSeekerSubstruct *, const u8 *);
bool8 sub_810D164(const void *, u16, u8 *);
u8 sub_810D280(int, u16);
u8 sub_810CF90(u8);
void sub_810C640(void);

// rodata
extern const struct UnkStruct_845318C gUnknown_845318C[];
extern const u8 gUnknown_8453F5C[];
extern const u8 gUnknown_8453F60[];
extern const u8 gUnknown_8453F62[];
extern const u8 gUnknown_8453F64[];

// text
void sub_810C670(u8 taskId)
{
    u8 i;
    u8 respval;

    for (i = 0; i < 16; i++)
        gTasks[taskId].data[i] = 0;

    gUnknown_203ADB8 = AllocZeroed(sizeof(struct VsSeekerStruct));
    sub_810C808();
    respval = sub_810C96C();
    if (respval == 0)
    {
        Free(gUnknown_203ADB8);
        DisplayItemMessageOnField(taskId, 2, gUnknown_81C137C, sub_80A1E0C);
    }
    else if (respval == 1)
    {
        Free(gUnknown_203ADB8);
        DisplayItemMessageOnField(taskId, 2, gUnknown_81C13D6, sub_80A1E0C);
    }
    else if (respval == 2)
    {
        sub_80A2294(4, 0, gUnknown_203AD30, 0xffff);
        FieldEffectStart(FLDEFF_UNK_41); // TODO: name this enum
        gTasks[taskId].func = sub_810C730;
        gTasks[taskId].data[0] = 15;
    }
}

void sub_810C730(u8 taskId)
{
    if (--gTasks[taskId].data[0] == 0)
    {
        gTasks[taskId].func = sub_810C760;
        gTasks[taskId].data[1] = 16;
    }
}

void sub_810C760(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (data[2] != 2 && --data[1] == 0)
    {
        PlaySE(SE_BASABASA);
        data[1] = 11;
        data[2]++;
    }

    if (!FieldEffectActiveListContains(FLDEFF_UNK_41))
    {
        data[1] = 0;
        data[2] = 0;
        sub_810C604();
        gUnknown_203ADB8->unk_431_3 = sub_810C9A8(gUnknown_845318C);
        ScriptMovement_StartObjectMovementScript(0xFF, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, gUnknown_8453F5C);
        gTasks[taskId].func = sub_810C8EC;
    }
}

void sub_810C808(void)
{
    struct MapObjectTemplate *templates = gSaveBlock1Ptr->mapObjectTemplates;
    u8 fieldObjectId = 0;
    u8 vsSeekerObjectIdx = 0;
    s32 mapObjectIdx;

    for (mapObjectIdx = 0; mapObjectIdx < gMapHeader.events->mapObjectCount; mapObjectIdx++)
    {
        if (templates[mapObjectIdx].unkC == 1 || templates[mapObjectIdx].unkC == 3)
        {
            gUnknown_203ADB8->unk_000[vsSeekerObjectIdx].unk_0 = templates[mapObjectIdx].script;
            gUnknown_203ADB8->unk_000[vsSeekerObjectIdx].unk_4 = sub_810D074(templates[mapObjectIdx].script);
            gUnknown_203ADB8->unk_000[vsSeekerObjectIdx].unk_6 = templates[mapObjectIdx].localId;
            TryGetFieldObjectIdByLocalIdAndMap(templates[mapObjectIdx].localId, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &fieldObjectId);
            gUnknown_203ADB8->unk_000[vsSeekerObjectIdx].unk_7 = fieldObjectId;
            gUnknown_203ADB8->unk_000[vsSeekerObjectIdx].unk_8 = gUnknown_2036E38[fieldObjectId].coords2.x - 7;
            gUnknown_203ADB8->unk_000[vsSeekerObjectIdx].unk_a = gUnknown_2036E38[fieldObjectId].coords2.y - 7;
            gUnknown_203ADB8->unk_000[vsSeekerObjectIdx].unk_c = templates[mapObjectIdx].graphicsId;
            vsSeekerObjectIdx++;
        }
    }
    gUnknown_203ADB8->unk_000[vsSeekerObjectIdx].unk_6 = 0xFF;
}

void sub_810C8EC(u8 taskId)
{
    if (ScriptMovement_IsObjectMovementFinished(0xFF, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup))
    {
        if (gUnknown_203ADB8->unk_431_3 == 0)
        {
            DisplayItemMessageOnField(taskId, 2, gUnknown_81C1429, sub_80A1E0C);
        }
        else
        {
            if (gUnknown_203ADB8->unk_431_3 == 2)
                sub_810D304();
            sub_80F6F54(0, 1);
            sub_80696C0();
            ScriptContext2_Disable();
            DestroyTask(taskId);
        }
        Free(gUnknown_203ADB8);
    }
}

u8 sub_810C96C(void)
{
    u8 vsSeekerChargeSteps = gSaveBlock1Ptr->trainerRematchStepCounter;
    if (vsSeekerChargeSteps == 100)
    {
        if (sub_810D1CC() == 0xFF)
            return 1;
        else
            return 2;
    }
    else
    {
        TV_PrintIntToStringVar(0, 100 - vsSeekerChargeSteps);
        return 0;
    }
}

// Nonmatching due to register roulette
#ifdef NONMATCHING
u8 sub_810C9A8(const void * a0)
{
    u16 r8 = 0;
    u8 sp0 = 0;
    int vsSeekerIdx;

    for (vsSeekerIdx = 0; gUnknown_203ADB8->unk_000[vsSeekerIdx].unk_6 != 0xFF; vsSeekerIdx++)
    {
        if (sub_810D0FC(&gUnknown_203ADB8->unk_000[vsSeekerIdx]) == 1)
        {
            r8 = gUnknown_203ADB8->unk_000[vsSeekerIdx].unk_4;
            if (!HasTrainerAlreadyBeenFought(r8))
            {
                sub_810D24C(&gUnknown_203ADB8->unk_000[vsSeekerIdx], gUnknown_8453F60);
                gUnknown_203ADB8->unk_431_0 = 1;
            }
            else
            {
                u8 r7 = sub_810D164(a0, r8, &sp0);
                if (r7 == 0)
                {
                    sub_810D24C(&gUnknown_203ADB8->unk_000[vsSeekerIdx], gUnknown_8453F62);
                    gUnknown_203ADB8->unk_431_1 = 1;
                }
                else
                {
                    u16 rval = Random() % 100;
                    u8 r0 = sub_810D280(vsSeekerIdx, r8);
                    if (r0 == 2)
                        rval = 100;
                    else if (r0 == 1)
                        rval = 0;
                    if (rval < 30)
                    {
                        sub_810D24C(&gUnknown_203ADB8->unk_000[vsSeekerIdx], gUnknown_8453F62);
                        gUnknown_203ADB8->unk_431_1 = 1;
                    }
                    else
                    {
                        gSaveBlock1Ptr->trainerRematches[gUnknown_203ADB8->unk_000[vsSeekerIdx].unk_6] = r7;
                        npc_coords_shift_still(&gUnknown_2036E38[gUnknown_203ADB8->unk_000[vsSeekerIdx].unk_7]);
                        sub_810D24C(&gUnknown_203ADB8->unk_000[vsSeekerIdx], gUnknown_8453F64);
                        gUnknown_203ADB8->unk_400[gUnknown_203ADB8->unk_430] = r8;
                        gUnknown_203ADB8->unk_420[gUnknown_203ADB8->unk_430] = sub_810CF90(gUnknown_203ADB8->unk_000[vsSeekerIdx].unk_c);
                        gUnknown_203ADB8->unk_430++;
                        gUnknown_203ADB8->unk_431_2 = 1;
                    }
                }
            }
        }
    }

    if (gUnknown_203ADB8->unk_431_2)
    {
        PlaySE(SE_PIN);
        FlagSet(0x801); // TODO: make this an enum
        sub_810C640();
        return 2;
    }
    if (gUnknown_203ADB8->unk_431_0)
        return 1;
    return 0;
}
#else
NAKED
u8 sub_810C9A8(const void * a0)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x8\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tmovs r0, 0\n"
                "\tmov r8, r0\n"
                "\tmov r0, sp\n"
                "\tmov r1, r8\n"
                "\tstrb r1, [r0]\n"
                "\tmovs r2, 0\n"
                "\tmov r9, r2\n"
                "\tldr r4, _0810CA14 @ =gUnknown_203ADB8\n"
                "\tldr r0, [r4]\n"
                "\tldrb r0, [r0, 0x6]\n"
                "\tcmp r0, 0xFF\n"
                "\tbne _0810C9D0\n"
                "\tb _0810CB2C\n"
                "_0810C9D0:\n"
                "\tadds r6, r4, 0\n"
                "\tmovs r3, 0x86\n"
                "\tlsls r3, 3\n"
                "\tmov r10, r3\n"
                "\tmovs r5, 0\n"
                "_0810C9DA:\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, r5\n"
                "\tbl sub_810D0FC\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tcmp r0, 0x1\n"
                "\tbeq _0810C9EC\n"
                "\tb _0810CB18\n"
                "_0810C9EC:\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, r5\n"
                "\tldrh r0, [r0, 0x4]\n"
                "\tmov r8, r0\n"
                "\tbl HasTrainerAlreadyBeenFought\n"
                "\tlsls r0, 24\n"
                "\tcmp r0, 0\n"
                "\tbne _0810CA20\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, r5\n"
                "\tldr r1, _0810CA18 @ =gUnknown_8453F60\n"
                "\tbl sub_810D24C\n"
                "\tldr r2, [r6]\n"
                "\tldr r0, _0810CA1C @ =0x00000431\n"
                "\tadds r2, r0\n"
                "\tldrb r0, [r2]\n"
                "\tmovs r1, 0x1\n"
                "\tb _0810CB14\n"
                "\t.align 2, 0\n"
                "_0810CA14: .4byte gUnknown_203ADB8\n"
                "_0810CA18: .4byte gUnknown_8453F60\n"
                "_0810CA1C: .4byte 0x00000431\n"
                "_0810CA20:\n"
                "\tldr r0, [sp, 0x4]\n"
                "\tmov r1, r8\n"
                "\tmov r2, sp\n"
                "\tbl sub_810D164\n"
                "\tlsls r0, 24\n"
                "\tlsrs r7, r0, 24\n"
                "\tcmp r7, 0\n"
                "\tbne _0810CA50\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, r5\n"
                "\tldr r1, _0810CA48 @ =gUnknown_8453F62\n"
                "\tbl sub_810D24C\n"
                "\tldr r2, [r6]\n"
                "\tldr r3, _0810CA4C @ =0x00000431\n"
                "\tadds r2, r3\n"
                "\tldrb r0, [r2]\n"
                "\tmovs r1, 0x2\n"
                "\tb _0810CB14\n"
                "\t.align 2, 0\n"
                "_0810CA48: .4byte gUnknown_8453F62\n"
                "_0810CA4C: .4byte 0x00000431\n"
                "_0810CA50:\n"
                "\tbl Random\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tmovs r1, 0x64\n"
                "\tbl __umodsi3\n"
                "\tlsls r0, 16\n"
                "\tlsrs r4, r0, 16\n"
                "\tmov r0, r9\n"
                "\tmov r1, r8\n"
                "\tbl sub_810D280\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tcmp r0, 0x2\n"
                "\tbne _0810CA76\n"
                "\tmovs r4, 0x64\n"
                "\tb _0810CA7C\n"
                "_0810CA76:\n"
                "\tcmp r0, 0x1\n"
                "\tbne _0810CA7C\n"
                "\tmovs r4, 0\n"
                "_0810CA7C:\n"
                "\tcmp r4, 0x1D\n"
                "\tbhi _0810CAA0\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, r5\n"
                "\tldr r1, _0810CA98 @ =gUnknown_8453F62\n"
                "\tbl sub_810D24C\n"
                "\tldr r2, [r6]\n"
                "\tldr r0, _0810CA9C @ =0x00000431\n"
                "\tadds r2, r0\n"
                "\tldrb r0, [r2]\n"
                "\tmovs r1, 0x2\n"
                "\tb _0810CB14\n"
                "\t.align 2, 0\n"
                "_0810CA98: .4byte gUnknown_8453F62\n"
                "_0810CA9C: .4byte 0x00000431\n"
                "_0810CAA0:\n"
                "\tldr r0, _0810CB54 @ =gSaveBlock1Ptr\n"
                "\tldr r1, [r0]\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, r5\n"
                "\tldr r2, _0810CB58 @ =0x0000063a\n"
                "\tadds r1, r2\n"
                "\tldrb r0, [r0, 0x6]\n"
                "\tadds r1, r0\n"
                "\tstrb r7, [r1]\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, r5\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tlsls r0, r1, 3\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _0810CB5C @ =gUnknown_2036E38\n"
                "\tadds r0, r1\n"
                "\tbl npc_coords_shift_still\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, r5\n"
                "\tldr r1, _0810CB60 @ =gUnknown_8453F64\n"
                "\tbl sub_810D24C\n"
                "\tldr r2, [r6]\n"
                "\tmov r3, r10\n"
                "\tadds r0, r2, r3\n"
                "\tldrb r1, [r0]\n"
                "\tlsls r1, 1\n"
                "\tmovs r3, 0x80\n"
                "\tlsls r3, 3\n"
                "\tadds r0, r2, r3\n"
                "\tadds r0, r1\n"
                "\tmov r1, r8\n"
                "\tstrh r1, [r0]\n"
                "\tadds r2, r5\n"
                "\tldrb r0, [r2, 0xC]\n"
                "\tbl sub_810CF90\n"
                "\tldr r1, [r6]\n"
                "\tmov r3, r10\n"
                "\tadds r2, r1, r3\n"
                "\tmovs r3, 0x84\n"
                "\tlsls r3, 3\n"
                "\tadds r1, r3\n"
                "\tldrb r2, [r2]\n"
                "\tadds r1, r2\n"
                "\tstrb r0, [r1]\n"
                "\tldr r1, [r6]\n"
                "\tadd r1, r10\n"
                "\tldrb r0, [r1]\n"
                "\tadds r0, 0x1\n"
                "\tstrb r0, [r1]\n"
                "\tldr r2, [r6]\n"
                "\tldr r0, _0810CB64 @ =0x00000431\n"
                "\tadds r2, r0\n"
                "\tldrb r0, [r2]\n"
                "\tmovs r1, 0x4\n"
                "_0810CB14:\n"
                "\torrs r0, r1\n"
                "\tstrb r0, [r2]\n"
                "_0810CB18:\n"
                "\tadds r5, 0x10\n"
                "\tmovs r1, 0x1\n"
                "\tadd r9, r1\n"
                "\tldr r4, _0810CB68 @ =gUnknown_203ADB8\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, r5\n"
                "\tldrb r0, [r0, 0x6]\n"
                "\tcmp r0, 0xFF\n"
                "\tbeq _0810CB2C\n"
                "\tb _0810C9DA\n"
                "_0810CB2C:\n"
                "\tldr r2, _0810CB68 @ =gUnknown_203ADB8\n"
                "\tldr r0, [r2]\n"
                "\tldr r3, _0810CB64 @ =0x00000431\n"
                "\tadds r0, r3\n"
                "\tldrb r1, [r0]\n"
                "\tmovs r0, 0x4\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _0810CB70\n"
                "\tmovs r0, 0x15\n"
                "\tbl PlaySE\n"
                "\tldr r0, _0810CB6C @ =0x00000801\n"
                "\tbl FlagSet\n"
                "\tbl sub_810C640\n"
                "\tmovs r0, 0x2\n"
                "\tb _0810CB7E\n"
                "\t.align 2, 0\n"
                "_0810CB54: .4byte gSaveBlock1Ptr\n"
                "_0810CB58: .4byte 0x0000063a\n"
                "_0810CB5C: .4byte gUnknown_2036E38\n"
                "_0810CB60: .4byte gUnknown_8453F64\n"
                "_0810CB64: .4byte 0x00000431\n"
                "_0810CB68: .4byte gUnknown_203ADB8\n"
                "_0810CB6C: .4byte 0x00000801\n"
                "_0810CB70:\n"
                "\tmovs r0, 0x1\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbne _0810CB7C\n"
                "\tmovs r0, 0\n"
                "\tb _0810CB7E\n"
                "_0810CB7C:\n"
                "\tmovs r0, 0x1\n"
                "_0810CB7E:\n"
                "\tadd sp, 0x8\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r1}\n"
                "\tbx r1");
}
#endif
