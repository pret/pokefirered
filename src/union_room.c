#include "global.h"
#include "gflib.h"
#include "battle.h"
#include "berry_crush.h"
#include "cable_club.h"
#include "dodrio_berry_picking.h"
#include "event_data.h"
#include "field_control_avatar.h"
#include "field_weather.h"
#include "link.h"
#include "link_rfu.h"
#include "list_menu.h"
#include "load_save.h"
#include "mevent.h"
#include "mystery_gift_menu.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "party_menu.h"
#include "pokemon_jump.h"
#include "save_location.h"
#include "script.h"
#include "script_pokemon_util.h"
#include "task.h"
#include "trade.h"
#include "trade_scene.h"
#include "trainer_card.h"
#include "union_room.h"
#include "union_room_chat.h"
#include "union_room_player_avatar.h"
#include "constants/songs.h"
#include "constants/maps.h"
#include "constants/cable_club.h"
#include "constants/field_weather.h"

EWRAM_DATA union UnkUnion_Main gUnknown_203B05C = {};
EWRAM_DATA u8 gUnknown_203B058 = 0;
EWRAM_DATA u8 gUnknown_203B059 = 0;
EWRAM_DATA struct UnionRoomTrade gUnknown_203B06C = {};

IWRAM_DATA struct UnkStruct_Leader *gUnknown_3002024;
IWRAM_DATA struct UnkStruct_Group *gUnknown_3002028;

void sub_8115A68(u8 taskId);
void sub_81161E4(struct UnkStruct_Leader * leader);
bool8 sub_8116444(struct UnkStruct_Leader * leader, u32 a1, u32 a2);
u8 sub_8116524(struct UnkStruct_Main0 * a0);
u8 sub_81165E8(struct UnkStruct_Main0 * a0);
void sub_8116738(u8 taskId);
u32 sub_8116D10(struct UnkStruct_Group * group, s32 id);
void sub_8116D60(struct UnkStruct_Group * group, s32 id);
void sub_8116E1C(u8 taskId);
u8 sub_8116FE4(void);
void sub_8117990(void);
void sub_81179A4(void);
void sub_8117A0C(u8 taskId);
u16 sub_8118658(const u8 *data);
u8 sub_811A054(struct UnkStruct_Main4 *arg0, u32 arg1);
bool8 sub_811A0F8(u8 *textState, const u8 *str);
s8 sub_811A14C(u8 *dest, bool32 arg1);
void sub_811A41C(void);
void sub_811A444(u8 windowId, u8 fontId, const u8 *str, u8 x, u8 y, u8 colorIdx);
void sub_811A5E4(struct UnkStruct_x20 *arg0, u8 count);
void sub_811A650(struct UnkStruct_Main4 *arg0, u8 count);
bool32 sub_811A6DC(struct UnkStruct_Shared *arg0, struct UnkStruct_Shared *arg1);
u32 sub_811A748(struct UnkStruct_x20 *arg0, struct UnkStruct_x1C *arg1);
u8 sub_811A798(struct UnkStruct_x20 *arg0, struct UnkStruct_x1C *arg1, u8 arg2);
void sub_811A81C(u8 arg0, u8 arg1, u8 arg2, struct UnkStruct_x20 *arg3, u8 arg4, u8 id);
void sub_811A910(u8 arg0, u8 arg1, u8 arg2, struct UnkStruct_x20 *arg3, u8 arg4, u8 id);
void sub_811B148(struct UnionRoomTrade *trade);
u32 sub_811B1EC(struct UnionRoomTrade *trade, u8 mpId);

extern const u8 *const gUnknown_8456C74[];
extern const struct WindowTemplate gUnknown_8456CD0;
extern const u32 gUnknown_8456CD8[];
extern const struct WindowTemplate gUnknown_8456CFC;
extern const struct WindowTemplate gUnknown_8456D04;
extern const struct ListMenuTemplate gUnknown_8456D34;
extern const struct WindowTemplate gUnknown_8456D4C;
extern const struct WindowTemplate gUnknown_8456D54;
extern const struct ListMenuTemplate gUnknown_8456DDC;
extern const struct UnkStruct_Shared gUnknown_8457034;
extern const u8 *const gUnknown_8457094[13];
extern const u8 gUnknown_84570C8[];
extern const u8 gUnknown_84571B4[];
extern const u8 gUnknown_84571B8[];
extern const u8 gUnknown_8457234[];
extern const u8 gUnknown_8457264[];
extern const u8 *const gUnknown_845742C[][5];
extern const u8 gUnknown_845747C[];
extern const u8 gUnknown_84574A0[];
extern const u8 gUnknown_84574C4[];
extern const u8 gUnknown_84574EC[];
extern const u8 gUnknown_8457514[];
extern const u8 gUnknown_8457530[];
extern const u8 gUnknown_8457554[];
extern const u8 *const gUnknown_8457608[];
extern const u8 gUnknown_8457610[];
extern const u8 *const gUnknown_845767C[];
extern const u8 gUnknown_84576AC[];
extern const u8 gUnknown_84576C4[];
extern const u8 gUnknown_8457700[];
extern const u8 gUnknown_845771C[];
extern const u8 *const gUnknown_8457754[];
extern const u8 gUnknown_84577F8[];
extern const u8 gUnknown_8457E28[];
extern const u8 gUnknown_8457E44[];
extern const u8 gUnknown_8458FC8[];
extern const u8 *const gUnknown_84591B8[];
extern const u8 gUnknown_8459238[];
extern const u8 gUnknown_8459250[];

// These are functions in Emmerald but inlined in FireRed

#define sub_8018404(dest, arg1) ({                                       \
    StringCopy7(dest, (arg1).unk.playerName);                                   \
    ConvertInternationalString(dest, (arg1).unk.field_0.unk_00.unk_00_0); \
})

#define CopyTrainerCardData(dest, src, _version) ({ \
    (dest) = *((struct TrainerCard *)(src));        \
    (dest).version = _version;                      \
})

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

void sub_8115A68(u8 taskId)
{
    u32 id, val;
    struct UnkStruct_Leader *data = gUnknown_203B05C.leader;

    switch (data->state)
    {
    case 0:
        gUnknown_203B058 = gUnknown_8456CD8[gSpecialVar_0x8004];
        gUnknown_203B059 = gUnknown_8456CD8[gSpecialVar_0x8004] >> 8;
        sub_80FAF58(gUnknown_203B058, 0, 0);
        sub_800B1F4();
        OpenLink();
        sub_80FBB8C(gUnknown_203B059 & 0xF);
        data->state = 3;
        break;
    case 3:
        data->field_4 = AllocZeroed(0x70);
        data->field_0 = AllocZeroed(0xA0);
        data->field_8 = AllocZeroed(0xA0);
        sub_811A650(data->field_4, 4);
        sub_811A5E4(data->field_0->arr, 5);
        LinkRfu3_SetGnameUnameFromStaticBuffers(&data->field_0->arr[0].unk.field_0, data->field_0->arr[0].unk.playerName);
        data->field_0->arr[0].field_18 = 0;
        data->field_0->arr[0].field_1A_0 = 1;
        data->field_0->arr[0].field_1A_1 = 0;
        data->field_0->arr[0].field_1B = 0;
        data->field_17 = sub_811A054(data->field_4, 0xFF);
        data->field_10 = AddWindow(&gUnknown_8456CD0);
        data->listWindowId = AddWindow(&gUnknown_8456CFC);
        data->field_11 = AddWindow(&gUnknown_8456D04);

        FillWindowPixelBuffer(data->field_10, PIXEL_FILL(2));
        sub_811A444(data->field_10, 0, gUnknown_845747C, 8, 2, 4);
        PutWindowTilemap(data->field_10);
        CopyWindowToVram(data->field_10, 2);

        DrawStdWindowFrame(data->listWindowId, FALSE);
        gMultiuseListMenuTemplate = gUnknown_8456D34;
        gMultiuseListMenuTemplate.windowId = data->listWindowId;
        data->listTaskId = ListMenuInit(&gMultiuseListMenuTemplate, 0, 0);

        DrawStdWindowFrame(data->field_11, FALSE);
        PutWindowTilemap(data->field_11);
        CopyWindowToVram(data->field_11, 2);

        CopyBgTilemapBufferToVram(0);
        data->field_13 = 1;
        data->state = 4;
        break;
    case 4:
        StringCopy(gStringVar1, gUnknown_8456C74[gUnknown_203B058]);
        if ((gUnknown_203B059 >> 4) != 0)
        {
            if (data->field_13 > (gUnknown_203B059 >> 4) - 1 && (gUnknown_203B059 & 0xF) != 0)
                StringExpandPlaceholders(gStringVar4, gUnknown_8457264);
            else
                StringExpandPlaceholders(gStringVar4, gUnknown_8457234);
        }
        else
        {
            sub_811599C(gStringVar4, gUnknown_203B058);
        }

        sub_811586C(data->field_11, gUnknown_203B059, data->field_13);
        data->state = 5;
        break;
    case 5:
        if (sub_811A0F8(&data->textState, gStringVar4))
            data->state = 6;
        break;
    case 6:
        sub_8116444(data, 7, 10);
        if (gMain.newKeys & B_BUTTON)
        {
            if (data->field_13 == 1)
                data->state = 23;
            else if ((gUnknown_203B059 & 0xF0) != 0)
                data->state = 30;
            else
                data->state = 19;
        }
        if ((gUnknown_203B059 >> 4) != 0
            && data->field_13 > (gUnknown_203B059 >> 4) - 1
            && (gUnknown_203B059 & 0xF) != 0
            && sub_80FC1CC()
            && gMain.newKeys & START_BUTTON)
        {
            data->state = 15;
            sub_80F8F5C();
        }
        if (data->state == 6 && sub_80FA5D4())
        {
            data->state = 9;
        }
        break;
    case 9:
        if (!sub_80FA5D4())
        {
            data->state = 6;
            data->field_13 = sub_81165E8(data->field_0);
        }
        break;
    case 10:
        id = ((gUnknown_203B058 & 0xF) == 2) ? 1 : 0;
        if (sub_811A0F8(&data->textState, gUnknown_845767C[id]))
        {
            data->field_13 = sub_81165E8(data->field_0);
            RedrawListMenu(data->listTaskId);
            data->state = 4;
        }
        break;
    case 29:
        id = ((gUnknown_203B059 & 0xF) == 2) ? 0 : 1;
        if (sub_811A0F8(&data->textState, gUnknown_845767C[id]))
        {
            data->state = 21;
        }
        break;
    case 7:
        if (sub_811A0F8(&data->textState, gStringVar4))
        {
            data->state = 11;
        }
        break;
    case 11:
        switch (sub_811A14C(&data->textState, sub_80FA634(sub_8118658(data->field_0->arr[data->field_13].unk.field_0.unk_00.playerTrainerId), data->field_0->arr[data->field_13].unk.playerName)))
        {
        case 0:
            LoadWirelessStatusIndicatorSpriteGfx();
            CreateWirelessStatusIndicatorSprite(0, 0);
            data->field_19 = 5;
            sub_80FA670(5, sub_8118658(data->field_0->arr[data->field_13].unk.field_0.unk_00.playerTrainerId), data->field_0->arr[data->field_13].unk.playerName);
            data->state = 12;
            break;
        case 1:
        case -1:
            data->field_19 = 6;
            sub_80FA670(6, sub_8118658(data->field_0->arr[data->field_13].unk.field_0.unk_00.playerTrainerId), data->field_0->arr[data->field_13].unk.playerName);
            data->state = 12;
            break;
        case -3:
            data->state = 9;
            break;
        }
        break;
    case 12:
        val = sub_80FA6FC(sub_8118658(data->field_0->arr[data->field_13].unk.field_0.unk_00.playerTrainerId), data->field_0->arr[data->field_13].unk.playerName);
        if (val == 1)
        {
            if (data->field_19 == 5)
            {
                data->field_0->arr[data->field_13].field_1B = 0;
                RedrawListMenu(data->listTaskId);
                data->field_13++;
                if (data->field_13 == (gUnknown_203B059 & 0xF))
                {
                    if ((gUnknown_203B059 & 0xF0) != 0 || data->field_13 == 4)
                    {
                        data->state = 15;
                    }
                    else
                    {
                        sub_8018404(gStringVar1, data->field_0->arr[data->field_13 - 1]);
                        StringExpandPlaceholders(gStringVar4, gUnknown_8457554);
                        data->state = 13;
                    }

                    sub_80F8F5C();
                    sub_811586C(data->field_11, gUnknown_203B059, data->field_13);
                }
                else
                {
                    data->state = 4;
                }
            }
            else
            {
                sub_80FBD4C(data->field_0->arr[data->field_13].unk.playerName, sub_8118658(data->field_0->arr[data->field_13].unk.field_0.unk_00.playerTrainerId));
                data->field_0->arr[data->field_13].field_1A_0 = 0;
                sub_81165E8(data->field_0);
                RedrawListMenu(data->listTaskId);
                data->state = 4;
            }

            data->field_19 = 0;
        }
        else if (val == 2)
        {
            sub_80FB9E4(0, 0);
            data->state = 4;
        }
        break;
    case 13:
        if (sub_811A0F8(&data->textState, gStringVar4))
            data->state = 14;
        break;
    case 14:
        if (++data->field_E > 120)
            data->state = 17;
        break;
    case 15:
        if (sub_811A0F8(&data->textState, gUnknown_8457514))
            data->state = 16;
        break;
    case 16:
        switch (sub_811A14C(&data->textState, FALSE))
        {
        case 0:
            data->state = 17;
            break;
        case 1:
        case -1:
            if ((gUnknown_203B059 & 0xF0) != 0)
                data->state = 30;
            else
                data->state = 19;
            break;
        }
        break;
    case 19:
        if (sub_811A0F8(&data->textState, gUnknown_8457530))
            data->state = 20;
        break;
    case 20:
        switch (sub_811A14C(&data->textState, FALSE))
        {
        case 0:
            data->state = 23;
            break;
        case 1:
        case -1:
            if ((gUnknown_203B059 & 0xF0) != 0)
                data->state = 15;
            else if (data->field_13 == (gUnknown_203B059 & 0xF))
                data->state = 15;
            else
                data->state = 4;
            break;
        }
        break;
    case 17:
        if (!sub_8116444(data, 7, 23))
            data->state = 18;
        break;
    case 18:
        if (sub_80F8F40())
        {
            if (sub_80F8F7C(FALSE))
            {
                data->state = 26;
            }
        }
        else
        {
            data->state = 29;
            data->textState = 0;
        }
        break;
    case 30:
        if (sub_811A0F8(&data->textState, gUnknown_8457610))
            data->state = 23;
        break;
    case 21:
    case 23:
        DestroyWirelessStatusIndicatorSprite();
        sub_80F8DC0();
        sub_81161E4(data);
        data->state++;
        break;
    case 24:
        EnableBothScriptContexts();
        DestroyTask(taskId);
        gSpecialVar_Result = 5;
        break;
    case 22:
        EnableBothScriptContexts();
        DestroyTask(taskId);
        gSpecialVar_Result = 8;
        break;
    case 26:
        if (sub_80FBA00())
        {
            data->state = 29;
        }
        else
        {
            if (gReceivedRemoteLinkPlayers != 0)
            {
                sub_80FAFE0(1);
                sub_8117990();
                sub_81161E4(data);
                DestroyTask(taskId);
            }
        }
        break;
    }
}

void sub_81161E4(struct UnkStruct_Leader *data)
{
    ClearWindowTilemap(data->field_11);
    ClearStdWindowAndFrame(data->field_11, FALSE);
    DestroyListMenuTask(data->listTaskId, 0, 0);
    ClearWindowTilemap(data->field_10);
    ClearStdWindowAndFrame(data->listWindowId, FALSE);
    CopyBgTilemapBufferToVram(0);
    RemoveWindow(data->field_11);
    RemoveWindow(data->listWindowId);
    RemoveWindow(data->field_10);
    DestroyTask(data->field_17);

    Free(data->field_8);
    Free(data->field_0);
    Free(data->field_4);
}

void sub_8116244(u8 *dst, u8 caseId)
{
    switch (caseId)
    {
    case 1:
    case 2:
    case 4:
        StringExpandPlaceholders(dst, gUnknown_84574A0);
        break;
    case 21:
    case 22:
        StringExpandPlaceholders(dst, gUnknown_84574C4);
        break;
    case 3:
    case 9:
    case 10:
    case 11:
        StringExpandPlaceholders(dst, gUnknown_84574EC);
        break;
    }
}

void sub_81162E0(u8 *dst, u8 caseId)
{
    switch (caseId)
    {
    case 65:
    case 68:
        StringExpandPlaceholders(dst, gUnknown_8457E28);
        break;
    case 69:
    case 72:
        StringExpandPlaceholders(dst, gUnknown_8457E44);
        break;
    }
}

void sub_811631C(u8 *dst, u8 caseId)
{
    switch (caseId)
    {
    case 1:
    case 2:
    case 4:
    case 21:
    case 22:
        StringExpandPlaceholders(dst, gUnknown_8459238);
        break;
    case 3:
    case 9:
    case 10:
    case 11:
        StringExpandPlaceholders(dst, gUnknown_8459250);
        break;
    }
}

void sub_81163B0(u8 *dst, u8 caseId)
{
    switch (caseId)
    {
    case 1:
    case 2:
    case 4:
    case 21:
    case 22:
        StringExpandPlaceholders(dst, gUnknown_84576AC);
        break;
    case 3:
    case 9:
    case 10:
    case 11:
        StringExpandPlaceholders(dst, gUnknown_84576C4);
        break;
    }
}

bool8 sub_8116444(struct UnkStruct_Leader *data, u32 arg1, u32 arg2)
{
    switch (sub_8116524(data->field_0))
    {
    case 1:
        PlaySE(SE_PC_LOGIN);
        RedrawListMenu(data->listTaskId);
        sub_8018404(gStringVar2, data->field_0->arr[data->field_13]);
        sub_8116244(gStringVar4, gUnknown_203B058);
        data->state = arg1;
        break;
    case 2:
        sub_80FB9E4(0, 0);
        RedrawListMenu(data->listTaskId);
        data->state = arg2;
        return TRUE;
    }

    return FALSE;
}

void sub_81164C8(u8 arg0, s32 id, u8 arg2)
{
    struct UnkStruct_Leader *data = gUnknown_203B05C.leader;
    u8 var = 0;

    switch (data->field_0->arr[id].field_1A_0)
    {
    case 1:
        if (data->field_0->arr[id].field_1B != 0)
            var = 2;
        break;
    case 2:
        var = 1;
        break;
    }

    sub_811A910(arg0, 0, arg2, &data->field_0->arr[id], var, id);
}

u8 sub_8116524(struct UnkStruct_Main0 *arg0)
{
    struct UnkStruct_Leader *data = gUnknown_203B05C.leader;
    u8 ret = 0;
    u8 i;
    s32 id;

    for (i = 1; i < 5; i++)
    {
        u16 var = data->field_0->arr[i].field_1A_0;
        if (var == 1)
        {
            id = sub_811A748(&data->field_0->arr[i], data->field_4->arr);
            if (id != 0xFF)
            {
                data->field_0->arr[i].unk = data->field_4->arr[id].unk0;
                data->field_0->arr[i].field_18 = var;
            }
            else
            {
                data->field_0->arr[i].field_1A_0 = 2;
                ret = 2;
            }
        }
    }

    for (id = 0; id < 4; id++)
        sub_811A798(data->field_0->arr, &data->field_4->arr[id], 5);

    if (ret != 2)
    {
        for (id = 0; id < 5; id++)
        {
            if (data->field_0->arr[id].field_1B != 0)
                ret = 1;
        }
    }

    return ret;
}

u8 sub_81165E8(struct UnkStruct_Main0 *arg0)
{
    struct UnkStruct_Leader *data = gUnknown_203B05C.leader;
    u8 copiedCount;
    s32 i;
    u8 ret;

    for (i = 0; i < 5; i++)
        data->field_8->arr[i] = data->field_0->arr[i];

    copiedCount = 0;
    for (i = 0; i < 5; i++)
    {
        if (data->field_8->arr[i].field_1A_0 == 1)
        {
            data->field_0->arr[copiedCount] = data->field_8->arr[i];
            copiedCount++;
        }
    }

    ret = copiedCount;
    for (; copiedCount < 5; copiedCount++)
    {
        data->field_0->arr[copiedCount].unk = gUnknown_8457034;
        data->field_0->arr[copiedCount].field_18 = 0;
        data->field_0->arr[copiedCount].field_1A_0 = 0;
        data->field_0->arr[copiedCount].field_1A_1 = 0;
        data->field_0->arr[copiedCount].field_1B = 0;
    }

    for (i = 0; i < 5; i++)
    {
        if (data->field_0->arr[i].field_1A_0 != 1)
            continue;
        if (data->field_0->arr[i].field_1B != 0x40)
            continue;

        ret = i;
        break;
    }

    return ret;
}

void TryJoinLinkGroup(void)
{
    u8 taskId;
    struct UnkStruct_Group *dataPtr;

    taskId = CreateTask(sub_8116738, 0);
    gUnknown_203B05C.group = dataPtr = (void*)(gTasks[taskId].data);
    gUnknown_3002028 = dataPtr;

    dataPtr->state = 0;
    dataPtr->textState = 0;
    gSpecialVar_Result = 0;
}

void sub_8116738(u8 taskId)
{
    s32 id;
    struct UnkStruct_Group *data = gUnknown_203B05C.group;

    switch (data->state)
    {
    case 0:
        sub_80FAF58(gUnknown_84570C8[gSpecialVar_0x8004], 0, 0);
        gUnknown_203B058 = gUnknown_84570C8[gSpecialVar_0x8004];
        sub_800B1F4();
        OpenLink();
        sub_80FBBD8();
        data->field_4 = AllocZeroed(0x70);
        data->field_0 = AllocZeroed(0x200);
        data->state = 1;
        break;
    case 1:
        if (sub_811A0F8(&data->textState, gUnknown_84591B8[gSpecialVar_0x8004]))
            data->state = 2;
        break;
    case 2:
        sub_811A650(data->field_4, 4);
        sub_811A5E4(data->field_0->arr, 16);
        data->field_11 = sub_811A054(data->field_4, gSpecialVar_0x8004);
        data->field_C = AddWindow(&gUnknown_8456CD0);
        data->listWindowId = AddWindow(&gUnknown_8456D4C);
        data->field_D = AddWindow(&gUnknown_8456D54);

        FillWindowPixelBuffer(data->field_C, PIXEL_FILL(2));
        sub_811A444(data->field_C, 0, gUnknown_8458FC8, 8, 2, 4);
        PutWindowTilemap(data->field_C);
        CopyWindowToVram(data->field_C, 2);

        DrawStdWindowFrame(data->listWindowId, FALSE);
        gMultiuseListMenuTemplate = gUnknown_8456DDC;
        gMultiuseListMenuTemplate.windowId = data->listWindowId;
        data->listTaskId = ListMenuInit(&gMultiuseListMenuTemplate, 0, 0);

        DrawStdWindowFrame(data->field_D, FALSE);
        PutWindowTilemap(data->field_D);
        sub_8115924(data->field_D);
        CopyWindowToVram(data->field_D, 2);

        CopyBgTilemapBufferToVram(0);
        data->field_F = 0;
        data->state = 3;
        break;
    case 3:
        id = sub_8116FE4();
        switch (id)
        {
        case 1:
            PlaySE(SE_PC_LOGIN);
            RedrawListMenu(data->listTaskId);
            break;
        case 0:
            id = ListMenu_ProcessInput(data->listTaskId);
            if (gMain.newKeys & A_BUTTON && id != -1)
            {
                // this unused variable along with the assignment is needed to match
                u32 unusedVar;
                unusedVar  = data->field_0->arr[id].unk.field_0.unk_0a_0;

                if (data->field_0->arr[id].field_1A_0 == 1 && !data->field_0->arr[id].unk.field_0.unk_0a_7)
                {
                    u32 var = sub_8116D10(data, id);
                    if (var == 0)
                    {
                        sub_8116D60(data, id);
                        data->state = 5;
                        PlaySE(SE_PN_ON);
                    }
                    else
                    {
                        StringCopy(gStringVar4, gUnknown_8457608[var - 1]);
                        data->state = 18;
                        PlaySE(SE_PN_ON);
                    }
                }
                else
                {
                    PlaySE(SE_WALL_HIT);
                }
            }
            else if (gMain.newKeys & B_BUTTON)
            {
                data->state = 10;
            }
            break;
        default:
            RedrawListMenu(data->listTaskId);
            break;
        }
        break;
    case 5:
        sub_811631C(gStringVar4, gUnknown_203B058);
        if (sub_811A0F8(&data->textState, gStringVar4))
        {
            sub_8018404(gStringVar1, data->field_0->arr[data->field_F]);
            data->state = 6;
        }
        break;
    case 6:
        if (gReceivedRemoteLinkPlayers != 0)
        {
            gUnknown_203B058 = data->field_0->arr[data->field_F].unk.field_0.unk_0a_0;
            sub_80FB9E4(0, 0);
            switch (gUnknown_203B058)
            {
            case 1 ... 5:
            case 9 ... 11:
            case 13 ... 14:
            case 21 ... 22:
                data->state = 20;
                break;
            }
        }

        switch (sub_80FB9F4())
        {
        case 1:
            data->state = 12;
            break;
        case 2:
        case 6:
        case 9:
            data->state = 14;
            break;
        case 5:
            sub_81163B0(gStringVar4, gUnknown_203B058);
            if (sub_811A0F8(&data->textState, gStringVar4))
            {
                sub_80FB9E4(7, 0);
                StringCopy(gStringVar1, gUnknown_8456C74[gUnknown_203B058]);
                StringExpandPlaceholders(gStringVar4, gUnknown_8457700);
            }
            break;
        case 7:
            if (data->field_15 > 0xF0)
            {
                if (sub_811A0F8(&data->textState, gStringVar4))
                {
                    sub_80FB9E4(12, 0);
                    data->field_15 = 0;
                }
            }
            else
            {
                data->field_15++;
            }
            break;
        }

        if (!sub_80FB9F4() && gMain.newKeys & B_BUTTON)
            data->state = 7;
        break;
    case 7:
        if (sub_811A0F8(&data->textState, gUnknown_845771C))
            data->state = 8;
        break;
    case 8:
        switch (sub_811A14C(&data->textState, sub_80FB9F4()))
        {
        case 0:
            sub_80FA6BC();
            data->state = 9;
            RedrawListMenu(data->listTaskId);
            break;
        case 1:
        case -1:
            data->state = 5;
            RedrawListMenu(data->listTaskId);
            break;
        case -3:
            data->state = 6;
            RedrawListMenu(data->listTaskId);
            break;
        }
        break;
    case 9:
        if (sub_80FB9F4())
            data->state = 6;
        break;
    case 10:
    case 12:
    case 14:
    case 18:
    case 20:
        ClearWindowTilemap(data->field_D);
        ClearStdWindowAndFrame(data->field_D, FALSE);
        DestroyListMenuTask(data->listTaskId, 0, 0);
        ClearWindowTilemap(data->field_C);
        ClearStdWindowAndFrame(data->listWindowId, FALSE);
        CopyBgTilemapBufferToVram(0);
        RemoveWindow(data->field_D);
        RemoveWindow(data->listWindowId);
        RemoveWindow(data->field_C);
        DestroyTask(data->field_11);
        Free(data->field_0);
        Free(data->field_4);
        data->state++;
        break;
    case 13:
        DestroyWirelessStatusIndicatorSprite();
        if (sub_811A0F8(&data->textState, gUnknown_8457754[sub_80FB9F4()]))
        {
            gSpecialVar_Result = 6;
            data->state = 23;
        }
        break;
    case 11:
        DestroyWirelessStatusIndicatorSprite();
        gSpecialVar_Result = 5;
        data->state = 23;
        break;
    case 15:
        DestroyWirelessStatusIndicatorSprite();
        if (sub_811A0F8(&data->textState, gUnknown_8457754[sub_80FB9F4()]))
        {
            gSpecialVar_Result = 8;
            data->state = 23;
        }
        break;
    case 19:
        if (sub_811A0F8(&data->textState, gStringVar4))
        {
            gSpecialVar_Result = 8;
            data->state = 23;
        }
        break;
    case 23:
        DestroyTask(taskId);
        sub_811A41C();
        sub_80F8DC0();
        break;
    case 21:
        sub_8117990();
        DestroyTask(taskId);
        break;
    }
}

u32 sub_8116D10(struct UnkStruct_Group *arg0, s32 id)
{
    struct UnkStruct_x20 *structPtr = &arg0->field_0->arr[id];

    if (gUnknown_203B058 == 4 && structPtr->unk.field_0.unk_00.unk_01_2 != VERSION_FIRE_RED && structPtr->unk.field_0.unk_00.unk_01_2 != VERSION_LEAF_GREEN)
    {
        if (!(gSaveBlock2Ptr->specialSaveWarpFlags & CHAMPION_SAVEWARP))
            return 1;
        else if (structPtr->unk.field_0.unk_00.isChampion)
            return 0;
    }
    else
    {
        return 0;
    }

    return 2;
}

void sub_8116D60(struct UnkStruct_Group *data, s32 id)
{
    data->field_F = id;
    LoadWirelessStatusIndicatorSpriteGfx();
    CreateWirelessStatusIndicatorSprite(0, 0);
    RedrawListMenu(data->listTaskId);
    sub_8018404(gStringVar1, data->field_0->arr[data->field_F]);
    sub_80FB008(gUnknown_84570C8[gSpecialVar_0x8004], 0, 1);
    sub_80FBF54(data->field_0->arr[data->field_F].unk.playerName, sub_8118658(data->field_0->arr[data->field_F].unk.field_0.unk_00.playerTrainerId));
}

u8 sub_8116DE0(void)
{
    u8 taskId;
    struct UnkStruct_Group *dataPtr;

    taskId = CreateTask(sub_8116E1C, 0);
    gUnknown_203B05C.group = dataPtr = (void*)(gTasks[taskId].data);

    dataPtr->state = 0;
    dataPtr->textState = 0;

    gUnknown_3002028 = dataPtr;

    return taskId;
}

void sub_8116E1C(u8 taskId)
{
    struct UnkStruct_Group *data = gUnknown_203B05C.group;

    switch (data->state)
    {
    case 0:
        sub_80FAF58(0, 0, 0);
        sub_800B1F4();
        OpenLink();
        sub_80FBBD8();
        sub_80FB128(TRUE);
        data->field_4 = AllocZeroed(0x70);
        data->field_0 = AllocZeroed(0x200);
        data->state = 2;
        break;
    case 2:
        sub_811A650(data->field_4, 4);
        sub_811A5E4(data->field_0->arr, 16);
        data->field_11 = sub_811A054(data->field_4, 0xFF);
        data->field_F = 0;
        data->state = 3;
        break;
    case 3:
        if (sub_8116FE4() == 1)
            PlaySE(SE_PC_LOGIN);
        if (gTasks[taskId].data[15] == 0xFF)
            data->state = 10;
        break;
    case 10:
        DestroyTask(data->field_11);
        Free(data->field_0);
        Free(data->field_4);
        sub_80F8DC0();
        data->state++;
        break;
    case 11:
        sub_80F8DC0();
        DestroyTask(taskId);
        break;
    }
}

bool32 sub_8116F28(u32 arg0, u32 id)
{
    if (id == 0xFF)
        return TRUE;

    if (id <= NELEMS(gUnknown_8457094)) // UB: <= may access data outside the array
    {
        const u8 *bytes = gUnknown_8457094[id];

        while ((*(bytes) != 0xFF))
        {
            if ((*bytes) == arg0)
                return TRUE;
            bytes++;
        }
    }

    return FALSE;
}

u8 sub_8116F5C(struct UnkStruct_Group *data, u32 id)
{
    if (data->field_0->arr[id].field_1A_0 == 1)
    {
        if (data->field_0->arr[id].unk.field_0.unk_0a_7)
            return 3;
        else if (data->field_0->arr[id].field_1A_1 != 0)
            return 1;
        else if (data->field_0->arr[id].field_1B != 0)
            return 2;
    }

    return 0;
}

void sub_8116F94(u8 arg0, s32 id, u8 arg2)
{
    struct UnkStruct_Group *data = gUnknown_203B05C.group;
    u8 var = sub_8116F5C(data, id);

    sub_811A81C(arg0, 8, arg2, &data->field_0->arr[id], var, id);
}

u8 sub_8116FE4(void)
{
    struct UnkStruct_Group *data = gUnknown_203B05C.group;
    u8 ret = 0;
    u8 i;
    s32 id;

    for (i = 0; i < 16; i++)
    {
        if (data->field_0->arr[i].field_1A_0 != 0)
        {
            id = sub_811A748(&data->field_0->arr[i], data->field_4->arr);
            if (id != 0xFF)
            {
                if (data->field_0->arr[i].field_1A_0 == 1)
                {
                    if (sub_811A6DC(&data->field_0->arr[i].unk, &data->field_4->arr[id].unk0))
                    {
                        data->field_0->arr[i].unk = data->field_4->arr[id].unk0;
                        data->field_0->arr[i].field_1B = 0x40;
                        ret = 1;
                    }
                    else
                    {
                        if (data->field_0->arr[i].field_1B != 0)
                        {
                            data->field_0->arr[i].field_1B--;
                            if (data->field_0->arr[i].field_1B == 0)
                                ret = 2;
                        }
                    }
                }
                else
                {
                    data->field_0->arr[i].field_1A_0 = 1;
                    data->field_0->arr[i].field_1B = 0x40;
                    ret = 1;
                }

                data->field_0->arr[i].field_18 = 0;
            }
            else
            {
                if (data->field_0->arr[i].field_1A_0 != 2)
                {
                    data->field_0->arr[i].field_18++;
                    if (data->field_0->arr[i].field_18 >= 300)
                    {
                        data->field_0->arr[i].field_1A_0 = 2;
                        ret = 2;
                    }
                }
            }
        }
    }

    for (id = 0; id < 4; id++)
    {
        if (sub_811A798(data->field_0->arr, &data->field_4->arr[id], 16) != 0xFF)
            ret = 1;
    }

    return ret;
}

void sub_8117100(u8 taskId)
{
    CB2_ReturnFromLinkTrade();
    DestroyTask(taskId);
}

u8 sub_8117118(void)
{
    u8 taskId = CreateTask(sub_8117100, 0);

    return taskId;
}

void sub_8117130(u8 taskId)
{
    u32 monId = sub_811B1EC(&gUnknown_203B06C, GetMultiplayerId());

    switch (gTasks[taskId].data[0])
    {
    case 0:
        gTasks[taskId].data[0]++;
        SendBlock(0, &gPlayerParty[monId], sizeof(struct Pokemon));
        break;
    case 1:
        if (GetBlockReceivedStatus() == 3)
        {
            gEnemyParty[0] = *(struct Pokemon*)(gBlockRecvBuffer[GetMultiplayerId() ^ 1]);
            IncrementGameStat(GAME_STAT_NUM_UNION_ROOM_BATTLES);
            ResetBlockReceivedFlags();
            gTasks[taskId].data[0]++;
        }
        break;
    case 2:
        memcpy(gBlockSendBuffer, gSaveBlock1Ptr->mail, sizeof(struct MailStruct) * PARTY_SIZE + 4);
        if (SendBlock(0, gBlockSendBuffer, sizeof(struct MailStruct) * PARTY_SIZE + 4))
            gTasks[taskId].data[0]++;
        break;
    case 3:
        if (GetBlockReceivedStatus() == 3)
        {
            memcpy(gLinkPartnerMail, gBlockRecvBuffer[GetMultiplayerId() ^ 1], sizeof(struct MailStruct) * PARTY_SIZE);
            ResetBlockReceivedFlags();
            gSelectedTradeMonPositions[TRADE_PLAYER] = monId;
            gSelectedTradeMonPositions[TRADE_PARTNER] = PARTY_SIZE;
            gMain.savedCallback = CB2_ReturnToField;
            SetMainCallback2(CB2_InitTradeAnim_LinkTrade);
            sub_811B148(&gUnknown_203B06C);
            DestroyTask(taskId);
        }
        break;
    }
}

void sub_8117280(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (GetMultiplayerId() == 0)
            sub_800A474(2);
        gTasks[taskId].data[0]++;
        break;
    case 1:
        if (GetBlockReceivedStatus() == sub_800A8D4())
        {
            s32 i;
            u16 *recvBuff;

            for (i = 0; i < GetLinkPlayerCount(); i++)
            {
                recvBuff = gBlockRecvBuffer[i];
                CopyTrainerCardData(gTrainerCards[i], recvBuff, gLinkPlayers[i].version);
            }

            if (GetLinkPlayerCount() == 2)
            {
                recvBuff = gBlockRecvBuffer[GetMultiplayerId() ^ 1];
                sub_81446D0(recvBuff[48]);
            }
            else
            {
                sub_81446C4();
            }

            ResetBlockReceivedFlags();
            DestroyTask(taskId);
        }
        break;
    }
}

void sub_8117354(void)
{
    switch (gMain.state)
    {
    case 0:
        CreateTask(sub_8117280, 5);
        gMain.state++;
        break;
    case 1:
        if (!FuncIsActiveTask(sub_8117280))
            ShowTrainerCardInLink(GetMultiplayerId() ^ 1, CB2_ReturnToField);
        break;
    }

    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
}

void sub_81173C0(u16 battleFlags)
{
    HealPlayerParty();
    SavePlayerParty();
    LoadPlayerBag();
    gLinkPlayers[0].linkType = LINKTYPE_BATTLE;
    gLinkPlayers[GetMultiplayerId()].id = GetMultiplayerId();
    gLinkPlayers[GetMultiplayerId() ^ 1].id = GetMultiplayerId() ^ 1;
    gMain.savedCallback = sub_8081668;
    gBattleTypeFlags = battleFlags;
    PlayBattleBGM();
}

void sub_8117440(u16 linkService, u16 x, u16 y)
{
    VarSet(VAR_CABLE_CLUB_STATE, linkService);
    SetWarpDestination(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum, -1, x, y);
    SetDynamicWarpWithCoords(0, gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum, -1, x, y);
    WarpIntoMap();
}

void sub_81174B4(s8 mapGroup, s8 mapNum, s32 x, s32 y, u16 linkService)
{
    gSpecialVar_0x8004 = linkService;
    VarSet(VAR_CABLE_CLUB_STATE, linkService);
    gFieldLinkPlayerCount = GetLinkPlayerCount();
    gLocalLinkPlayerId = GetMultiplayerId();
    SetCableClubWarp();
    SetWarpDestination(mapGroup, mapNum, -1, x, y);
    WarpIntoMap();
}

void sub_8117534(void)
{
    switch (gMain.state)
    {
    case 0:
        CreateTask(sub_8117280, 5);
        gMain.state++;
        break;
    case 1:
        if (!FuncIsActiveTask(sub_8117280))
            SetMainCallback2(sub_8056788);
        break;
    }

    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
}

void sub_8117594(void *arg0, bool32 arg1)
{
    TrainerCard_GenerateCardForLinkPlayer((struct TrainerCard *)arg0);
    if (arg1)
        *((u16 *)(arg0 + sizeof(struct TrainerCard))) = GetWonderCardFlagID();
    else
        *((u16 *)(arg0 + sizeof(struct TrainerCard))) = 0;
}

void sub_81175BC(u8 taskId)
{
    sub_81446C4();
    switch (gUnknown_203B058)
    {
    case 1 ... 4:
    case 9 ... 11:
    case 13:
    case 14:
        RecordMixTrainerNames();
        break;
    }

    switch (gUnknown_203B058)
    {
    case 65:
    case 81:
        CleanupOverworldWindowsAndTilemaps();
        gMain.savedCallback = sub_811C1C8;
        InitChooseHalfPartyForBattle(2);
        break;
    case 1:
        CleanupOverworldWindowsAndTilemaps();
        sub_8117594(gBlockSendBuffer, TRUE);
        HealPlayerParty();
        SavePlayerParty();
        LoadPlayerBag();
        sub_81174B4(MAP_GROUP(BATTLE_COLOSSEUM_2P), MAP_NUM(BATTLE_COLOSSEUM_2P), 6, 8, USING_SINGLE_BATTLE);
        SetMainCallback2(sub_8117534);
        break;
    case 2:
        CleanupOverworldWindowsAndTilemaps();
        HealPlayerParty();
        SavePlayerParty();
        LoadPlayerBag();
        sub_8117594(gBlockSendBuffer, TRUE);
        sub_81174B4(MAP_GROUP(BATTLE_COLOSSEUM_2P), MAP_NUM(BATTLE_COLOSSEUM_2P), 6, 8, USING_DOUBLE_BATTLE);
        SetMainCallback2(sub_8117534);
        break;
    case 3:
        CleanupOverworldWindowsAndTilemaps();
        HealPlayerParty();
        SavePlayerParty();
        LoadPlayerBag();
        sub_8117594(gBlockSendBuffer, TRUE);
        sub_81174B4(MAP_GROUP(BATTLE_COLOSSEUM_4P), MAP_NUM(BATTLE_COLOSSEUM_4P), 5, 8, USING_MULTI_BATTLE);
        SetMainCallback2(sub_8117534);
        break;
    case 4:
        sub_8117594(gBlockSendBuffer, TRUE);
        CleanupOverworldWindowsAndTilemaps();
        sub_81174B4(MAP_GROUP(TRADE_CENTER), MAP_NUM(TRADE_CENTER), 5, 8, USING_TRADE_CENTER);
        SetMainCallback2(sub_8117534);
        break;
    case 68:
        CreateTask(sub_8117130, 0);
        break;
    case 5:
    case 69:
        if (GetMultiplayerId() == 0)
        {
            sub_80F8CFC();
        }
        else
        {
            sub_80F8D14();
            sub_80FAF58(69, 0, 1);
        }
        sub_8128420();
        break;
    case 8:
    case 72:
        sub_8117594(gBlockSendBuffer, FALSE);
        SetMainCallback2(sub_8117354);
        break;
    case 9:
        sub_8117440(USING_MINIGAME, 5, 1);
        sub_8147AA8(GetCursorSelectionMonId(), CB2_LoadMap);
        break;
    case 10:
        sub_8117440(USING_BERRY_CRUSH, 9, 1);
        sub_814B754(CB2_LoadMap);
        break;
    case 11:
        sub_8117440(USING_MINIGAME, 5, 1);
        sub_81507FC(GetCursorSelectionMonId(), CB2_LoadMap);
        break;
    }

    DestroyTask(taskId);
    gSpecialVar_Result = 1;
    ScriptContext2_Disable();
}

void sub_8117900(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 *sendBuff = (u16*)(gBlockSendBuffer);

    switch (data[0])
    {
    case 0:
        gSpecialVar_Result = 1;
        EnableBothScriptContexts();
        data[0]++;
        break;
    case 1:
        if (!ScriptContext1_IsScriptSetUp())
        {
            FadeScreen(FADE_TO_BLACK, 0);
            data[0]++;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            sub_800AB9C();
            data[0]++;
        }
        break;
    case 3:
        if (IsLinkTaskFinished())
        {
            DestroyTask(taskId);
            sub_81179A4();
        }
        break;
    }
}

void sub_8117990(void)
{
    CreateTask(sub_8117900, 0);
}

void sub_81179A4(void)
{
    u8 taskId = CreateTask(sub_81175BC, 0);
    gTasks[taskId].data[0] = 0;
}

void MEvent_CreateTask_Leader(u32 arg0)
{
    u8 taskId;
    struct UnkStruct_Leader *dataPtr;

    taskId = CreateTask(sub_8117A0C, 0);
    gUnknown_203B05C.leader = dataPtr = (void*)(gTasks[taskId].data);

    dataPtr->state = 0;
    dataPtr->textState = 0;
    dataPtr->field_18 = arg0;
    gSpecialVar_Result = 0;
}

void sub_8117A0C(u8 taskId)
{
    struct UnkStruct_Leader *data = gUnknown_203B05C.leader;
    struct WindowTemplate winTemplate;
    s32 val;

    switch (data->state)
    {
    case 0:
        gUnknown_203B058 = data->field_18;
        gUnknown_203B059 = 2;
        sub_80FAF58(data->field_18, 0, 0);
        sub_80FAF74(FALSE, FALSE);
        sub_800B1F4();
        OpenLink();
        sub_80FBB8C(2);
        data->state = 1;
        break;
    case 1:
        data->field_4 = AllocZeroed(0x70);
        data->field_0 = AllocZeroed(0xA0);
        data->field_8 = AllocZeroed(0xA0);
        sub_811A650(data->field_4, 4);
        sub_811A5E4(data->field_0->arr, 5);
        LinkRfu3_SetGnameUnameFromStaticBuffers(&data->field_0->arr[0].unk.field_0, data->field_0->arr[0].unk.playerName);
        data->field_0->arr[0].field_18 = 0;
        data->field_0->arr[0].field_1A_0 = 1;
        data->field_0->arr[0].field_1A_1 = 0;
        data->field_0->arr[0].field_1B = 0;
        data->field_17 = sub_811A054(data->field_4, 0xFF);

        winTemplate = gUnknown_8456CFC;
        winTemplate.baseBlock = GetMysteryGiftBaseBlock();
        data->listWindowId = AddWindow(&winTemplate);
        MG_DrawTextBorder(data->listWindowId);
        gMultiuseListMenuTemplate = gUnknown_8456D34;
        gMultiuseListMenuTemplate.windowId = data->listWindowId;
        data->listTaskId = ListMenuInit(&gMultiuseListMenuTemplate, 0, 0);

        CopyBgTilemapBufferToVram(0);
        data->field_13 = 1;
        data->state = 2;
        break;
    case 2:
        StringCopy(gStringVar1, gUnknown_8456C74[gUnknown_203B058]);
        sub_811599C(gStringVar4, gUnknown_203B058);
        data->state = 3;
        break;
    case 3:
        AddTextPrinterToWindow1(gStringVar4);
        data->state = 4;
        break;
    case 4:
        sub_8116444(data, 5, 6);
        if (gMain.newKeys & B_BUTTON)
        {
            data->state = 13;
            DestroyWirelessStatusIndicatorSprite();
        }
        break;
    case 6:
        if (MG_PrintTextOnWindow1AndWaitButton(&data->textState, gUnknown_84577F8))
        {
            data->field_13 = sub_81165E8(data->field_0);
            RedrawListMenu(data->listTaskId);
            data->state = 2;
        }
        break;
    case 5:
        data->state = 7;
        break;
    case 7:
        switch (mevent_message_print_and_prompt_yes_no(&data->textState, (u16 *)&data->field_14, FALSE, gStringVar4))
        {
        case 0:
            LoadWirelessStatusIndicatorSpriteGfx();
            CreateWirelessStatusIndicatorSprite(0, 0);
            data->field_0->arr[data->field_13].field_1B = 0;
            RedrawListMenu(data->listTaskId);
            data->field_19 = 5;
            sub_80FA670(5, sub_8118658(data->field_0->arr[data->field_13].unk.field_0.unk_00.playerTrainerId), data->field_0->arr[data->field_13].unk.playerName);
            data->state = 8;
            break;
        case 1:
        case -1:
            data->field_19 = 6;
            sub_80FA670(6, sub_8118658(data->field_0->arr[data->field_13].unk.field_0.unk_00.playerTrainerId), data->field_0->arr[data->field_13].unk.playerName);
            data->state = 8;
            break;
        }
        break;
    case 8:
        val = sub_80FA6FC(sub_8118658(data->field_0->arr[data->field_13].unk.field_0.unk_00.playerTrainerId), data->field_0->arr[data->field_13].unk.playerName);
        if (val == 1)
        {
            if (data->field_19 == 5)
            {
                data->field_0->arr[data->field_13].field_1B = 0;
                RedrawListMenu(data->listTaskId);
                data->field_13++;
                sub_8018404(gStringVar1, data->field_0->arr[data->field_13 - 1]);
                StringExpandPlaceholders(gStringVar4, gUnknown_8457554);
                data->state = 9;
                sub_80F8F5C();
            }
            else
            {
                sub_80FBD4C(data->field_0->arr[data->field_13].unk.playerName, sub_8118658(data->field_0->arr[data->field_13].unk.field_0.unk_00.playerTrainerId));
                data->field_0->arr[data->field_13].field_1A_0 = 0;
                sub_81165E8(data->field_0);
                RedrawListMenu(data->listTaskId);
                data->state = 2;
            }

            data->field_19 = 0;
        }
        else if (val == 2)
        {
            sub_80FB9E4(0, 0);
            data->state = 2;
        }
        break;
    case 9:
        AddTextPrinterToWindow1(gStringVar4);
        data->state = 10;
        break;
    case 10:
        if (++data->field_E > 120)
            data->state = 11;
        break;
    case 11:
        if (!sub_8116444(data, 5, 6))
            data->state = 12;
        break;
    case 12:
        if (sub_80F8F40())
        {
            sub_80F8F7C(FALSE);
            data->state = 15;
        }
        else
        {
            data->state = 6;
        }
        break;
    case 13:
        DestroyWirelessStatusIndicatorSprite();
        sub_80F8DC0();
        DestroyListMenuTask(data->listTaskId, 0, 0);
        CopyBgTilemapBufferToVram(0);
        RemoveWindow(data->listWindowId);
        DestroyTask(data->field_17);
        Free(data->field_8);
        Free(data->field_0);
        Free(data->field_4);
        data->state++;
        break;
    case 14:
        if (MG_PrintTextOnWindow1AndWaitButton(&data->textState, gUnknown_84571B8))
        {
            DestroyTask(taskId);
            gSpecialVar_Result = 5;
        }
        break;
    case 15:
        if (sub_80FB9F4() == 1 || sub_80FB9F4() == 2)
        {
            data->state = 13;
        }
        else if (gReceivedRemoteLinkPlayers != 0)
        {
            sub_80FAFE0(1);
            data->state++;
        }
        break;
    case 16:
        DestroyListMenuTask(data->listTaskId, 0, 0);
        CopyBgTilemapBufferToVram(0);
        RemoveWindow(data->listWindowId);
        DestroyTask(data->field_17);
        Free(data->field_8);
        Free(data->field_0);
        Free(data->field_4);
        sub_800AB9C();
        data->state++;
        break;
    case 17:
        if (IsLinkTaskFinished())
            DestroyTask(taskId);
        break;
    }
}
