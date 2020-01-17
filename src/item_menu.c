#include "global.h"
#include "bag.h"
#include "battle_controllers.h"
#include "bg.h"
#include "help_system.h"
#include "item_menu.h"
#include "item_menu_icons.h"
#include "list_menu.h"
#include "malloc.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "palette.h"
#include "scanline_effect.h"
#include "text.h"
#include "constants/items.h"

struct BagMenuAlloc
{
    u32 field_00;
    u8 field_04;
    u8 field_05_0:4;
    u8 field_05_4:2;
    u8 field_05_6:2;
    u16 field_06;
    u8 field_08;
    u8 field_09;
    u8 filler_0A[6];
    u8 field_10[4];
};

EWRAM_DATA struct BagStruct gUnknown_203ACFC = {};
EWRAM_DATA struct BagMenuAlloc * gUnknown_203AD10 = NULL;
EWRAM_DATA void * gUnknown_203AD14 = NULL;
EWRAM_DATA struct ListMenuItem * gUnknown_203AD18 = NULL;
EWRAM_DATA u8 (*gUnknown_203AD1C)[20] = NULL;

void sub_8107F10(void);
bool8 sub_8107F3C(void);
void sub_810813C(void);
void sub_8108178(u8 taskId);
void sub_81081AC(void);
bool8 sub_81081D0(void);
bool8 sub_8108240(void);
u8 sub_8108388(u8 location);
bool8 sub_81083F4(void);
void sub_810842C(u8 a0);
void sub_81087EC(void);
void sub_8108888(void);
void sub_81088D8(void);
void sub_8108A68(void);
void sub_8108A84(void);
void sub_8108B04(void);
void sub_8108C10(void);
void sub_8108E54(void);

void GoToBagMenu(u8 location, u8 a1, MainCallback a2)
{
    u8 i;

    sub_81081AC();
    gUnknown_203AD10 = Alloc(sizeof(struct BagMenuAlloc));
    if (gUnknown_203AD10 == NULL)
        SetMainCallback2(a2);
    else
    {
        if (location != 11)
            gUnknown_203ACFC.location = location;
        if (a2 != NULL)
            gUnknown_203ACFC.bagCallback = a2;
        gUnknown_203AD10->field_00 = 0;
        gUnknown_203AD10->field_04 = 0xFF;
        gUnknown_203AD10->field_05_4 = 0;
        gUnknown_203AD10->field_05_6 = 0;
        gUnknown_203AD10->field_08 = 0xFF;
        gUnknown_203AD10->field_09 = 0xFF;
        if (location == 3)
            gUnknown_203AD10->field_05_0 = 1;
        else if (location == 6)
            gUnknown_203AD10->field_05_0 = 2;
        else
            gUnknown_203AD10->field_05_0 = 0;
        for (i = 0; i < 4; i++)
        {
            gUnknown_203AD10->field_10[i] = 0;
        }
        if (a1 == 0 || a1 == 1 || a1 == 2)
            gUnknown_203ACFC.unk6 = a1;
        gTextFlags.autoScroll = FALSE;
        gSpecialVar_ItemId = ITEM_NONE;
        SetMainCallback2(sub_8107F10);
    }
}

void CB2_BagMenuFromStartMenu(void)
{
    GoToBagMenu(0, 3, CB2_ReturnToFieldWithOpenMenu);
}

void sub_8107ECC(void)
{
    GoToBagMenu(5, 3, SetCB2ToReshowScreenAfterMenu2);
}

void sub_8107EE0(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    DoScheduledBgTilemapCopiesToVram();
    UpdatePaletteFade();
}

void sub_8107EFC(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_8107F10(void)
{
    while (1)
    {
        if ((u8)sub_80BF72C() == TRUE)
            break;
        if (sub_8107F3C() == TRUE)
            break;
        if (MenuHelpers_LinkSomething() == TRUE)
            break;
    }
}

bool8 sub_8107F3C(void)
{
    u8 taskId;

    switch (gMain.state)
    {
    case 0:
        SetVBlankHBlankCallbacksToNull();
        ClearScheduledBgCopiesToVram();
        gMain.state++;
        break;
    case 1:
        ScanlineEffect_Stop();
        gMain.state++;
        break;
    case 2:
        FreeAllSpritePalettes();
        gMain.state++;
        break;
    case 3:
        ResetPaletteFade();
        gPaletteFade.bufferTransferDisabled = TRUE;
        gMain.state++;
        break;
    case 4:
        ResetSpriteData();
        gMain.state++;
        break;
    case 5:
        ResetItemMenuIconState();
        gMain.state++;
        break;
    case 6:
        if (!MenuHelpers_LinkSomething())
        {
            ResetTasks();
        }
        gMain.state++;
        break;
    case 7:
        if (sub_81081D0())
        {
            gUnknown_203AD10->field_10[0] = 0;
            gMain.state++;
        }
        else
        {
            sub_810813C();
            return TRUE;
        }
        break;
    case 8:
        if (sub_8108240() == TRUE)
            gMain.state++;
        break;
    case 9:
        sub_810B858();
        gMain.state++;
        break;
    case 10:
        sub_8108E54();
        sub_8108A68();
        sub_8108A84();
        gMain.state++;
        break;
    case 11:
        if (!sub_81083F4())
        {
            sub_810813C();
            return TRUE;
        }
        gMain.state++;
        break;
    case 12:
        sub_810842C(gUnknown_203ACFC.unk6);
        gMain.state++;
        break;
    case 13:
        if (gUnknown_203ACFC.location != 3)
            sub_81087EC();
        else
            sub_810B994();
        gMain.state++;
        break;
    case 14:
        taskId = sub_8108388(gUnknown_203ACFC.location);
        gTasks[taskId].data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gUnknown_203ACFC.cursorPos[gUnknown_203ACFC.unk6], gUnknown_203ACFC.itemsAbove[gUnknown_203ACFC.unk6]);
        gTasks[taskId].data[3] = 0;
        gTasks[taskId].data[8] = 0;
        gMain.state++;
        break;
    case 15:
        sub_80984FC(gUnknown_203ACFC.unk6);
        gMain.state++;
        break;
    case 16:
        sub_8108888();
        sub_81088D8();
        gMain.state++;
        break;
    case 17:
        sub_80985E4();
        gMain.state++;
        break;
    case 18:
        sub_8108C10();
        gMain.state++;
        break;
    case 19:
        if (gUnknown_203ACFC.location == 3)
            HelpSystem_SetSomeVariable2(29);
        else
            HelpSystem_SetSomeVariable2(9);
        gPaletteFade.bufferTransferDisabled = FALSE;
        gMain.state++;
        break;
    default:
        SetVBlankCallback(sub_8107EFC);
        SetMainCallback2(sub_8107EE0);
        return TRUE;
    }
    return FALSE;
}

void sub_810813C(void)
{
    BeginNormalPaletteFade(0xFFFFFFFF, -2, 0, 16, RGB_BLACK);
    CreateTask(sub_8108178, 0);
    SetVBlankCallback(sub_8107EFC);
    SetMainCallback2(sub_8107EE0);
}

void sub_8108178(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(gUnknown_203ACFC.bagCallback);
        sub_8108B04();
        DestroyTask(taskId);
    }
}

void sub_81081AC(void)
{
    gUnknown_203AD10 = NULL;
    gUnknown_203AD14 = NULL;
    gUnknown_203AD18 = NULL;
    gUnknown_203AD1C = NULL;
}
