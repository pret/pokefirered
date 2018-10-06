#include "global.h"
#include "songs.h"
#include "sound.h"
#include "task.h"
#include "malloc.h"
#include "field_map_obj.h"
#include "new_menu_helpers.h"
#include "item_use.h"
#include "event_scripts.h"
#include "script.h"
#include "map_obj_lock.h"
#include "field_specials.h"
#include "item_menu.h"
#include "field_effect.h"
#include "script_movement.h"
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
u16 sub_810D074(const u8 *);
u8 sub_810D1CC(void);

// rodata
extern const struct UnkStruct_845318C gUnknown_845318C[];
extern const u8 gUnknown_8453F5C[];

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
