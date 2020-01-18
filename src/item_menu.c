#include "global.h"
#include "gflib.h"
#include "bag.h"
#include "battle_controllers.h"
#include "decompress.h"
#include "graphics.h"
#include "help_system.h"
#include "item.h"
#include "item_menu.h"
#include "item_menu_icons.h"
#include "list_menu.h"
#include "menu.h"
#include "menu_indicators.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "scanline_effect.h"
#include "strings.h"
#include "constants/items.h"
#include "constants/songs.h"

#define FREE_IF_SET(ptr) ({ if (ptr) Free(ptr); })

struct BagMenuAlloc
{
    MainCallback field_00;
    u8 field_04;
    u8 field_05_0:4;
    u8 itemMenuIcon:2;
    u8 field_05_6:2;
    u16 contextMenuSelectedItem;
    u8 pocketScrollArrowsTask;
    u8 pocketSwitchArrowsTask;
    u8 nItems[3];
    u8 maxShowed[3];
    u8 data[4];
};

EWRAM_DATA struct BagStruct gUnknown_203ACFC = {};
EWRAM_DATA struct BagMenuAlloc * gUnknown_203AD10 = NULL;
EWRAM_DATA void * gUnknown_203AD14 = NULL;
EWRAM_DATA struct ListMenuItem * gUnknown_203AD18 = NULL;
EWRAM_DATA u8 (*gUnknown_203AD1C)[19] = NULL;

void sub_8107F10(void);
bool8 sub_8107F3C(void);
void sub_810813C(void);
void sub_8108178(u8 taskId);
void sub_81081AC(void);
bool8 sub_81081D0(void);
bool8 sub_8108240(void);
u8 sub_8108388(u8 location);
bool8 sub_81083F4(void);
void sub_810842C(u8 pocket);
void sub_8108560(u8 *dest, u16 itemId);
void sub_81085A4(s32 itemIndex, bool8 onInit, struct ListMenu *list);
void sub_8108654(u8 windowId, s32 itemId, u8 y);
void bag_menu_print_cursor(u8 y, u8 colorIdx);
void sub_81087EC(void);
void sub_8108818(s32 itemIndex);
void sub_8108888(void);
void sub_81088D8(void);
void sub_810899C(void);
void sub_8108A68(void);
void sub_8108A84(void);
void sub_8108B04(void);
void sub_8108B8C(u8 taskId);
void sub_8108CFC(u8 taskId);
void sub_8108C10(void);
void sub_8108E54(void);
void sub_8108F0C(u8 taskId);
void Task_ItemMenuAction_Use(u8 taskId);
void Task_ItemMenuAction_Toss(u8 taskId);
void Task_ItemMenuAction_ToggleSelect(u8 taskId);
void Task_ItemMenuAction_Give(u8 taskId);
void Task_ItemMenuAction_Cancel(u8 taskId);
void sub_810A324(u8 taskId);
bool8 sub_810ADAC(void);
void sub_810AF9C(u8 taskId);
void sub_810B1D4(u8 taskId);
void sub_810B378(u8 taskId);
void sub_810B4BC(u8 taskId);
void sub_810B5D4(u8 taskId);

const struct BgTemplate gUnknown_8452CF4[2] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 3,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x000
    }
};

const u8 *const sPocketNames[] = {
    gText_Items2,
    gText_KeyItems2,
    gText_PokeBalls2
};

const u16 gUnknown_8452D08[][18] = {
    [ITEMMENUACTION_USE] = INCBIN_U16("graphics/item_menu/bagmap_0.bin"),
    [ITEMMENUACTION_TOSS] = INCBIN_U16("graphics/item_menu/bagmap_1.bin"),
    [ITEMMENUACTION_REGISTER] = INCBIN_U16("graphics/item_menu/bagmap_2.bin"),
    [ITEMMENUACTION_GIVE] = INCBIN_U16("graphics/item_menu/bagmap_3.bin"),
    [ITEMMENUACTION_CANCEL] = INCBIN_U16("graphics/item_menu/bagmap_4.bin"),
    [ITEMMENUACTION_BATTLE_USE] = INCBIN_U16("graphics/item_menu/bagmap_5.bin"),
    [ITEMMENUACTION_CHECK] = INCBIN_U16("graphics/item_menu/bagmap_6.bin"),
    [ITEMMENUACTION_OPEN] = INCBIN_U16("graphics/item_menu/bagmap_7.bin"),
    [ITEMMENUACTION_OPEN_BERRIES] = INCBIN_U16("graphics/item_menu/bagmap_8.bin"),
    [ITEMMENUACTION_WALK] = INCBIN_U16("graphics/item_menu/bagmap_9.bin"),
    [ITEMMENUACTION_DESELECT] = INCBIN_U16("graphics/item_menu/bagmap_A.bin"),
    [ITEMMENUACTION_DUMMY] = INCBIN_U16("graphics/item_menu/bagmap_B.bin")
};

const struct MenuAction gUnknown_8452EB8[] = {
    [ITEMMENUACTION_USE] = {gOtherText_Use, {.void_u8 = Task_ItemMenuAction_Use}},
    [ITEMMENUACTION_TOSS] = {gOtherText_Toss, {.void_u8 = Task_ItemMenuAction_Toss}},
    [ITEMMENUACTION_REGISTER] = {gOtherText_Register, {.void_u8 = Task_ItemMenuAction_ToggleSelect}},
    [ITEMMENUACTION_GIVE] = {gOtherText_Give, {.void_u8 = Task_ItemMenuAction_Give}},
    [ITEMMENUACTION_CANCEL] = {gFameCheckerText_Cancel, {.void_u8 = Task_ItemMenuAction_Cancel}},
    [ITEMMENUACTION_BATTLE_USE] = {gOtherText_Use, {.void_u8 = sub_810A324}},
    [ITEMMENUACTION_CHECK] = {gOtherText_Check, {.void_u8 = Task_ItemMenuAction_Use}},
    [ITEMMENUACTION_OPEN] = {gOtherText_Open, {.void_u8 = Task_ItemMenuAction_Use}},
    [ITEMMENUACTION_OPEN_BERRIES] = {gOtherText_Open, {.void_u8 = sub_810A324}},
    [ITEMMENUACTION_WALK] = {gOtherText_Walk, {.void_u8 = Task_ItemMenuAction_Use}},
    [ITEMMENUACTION_DESELECT] = {gOtherText_Deselect, {.void_u8 = Task_ItemMenuAction_ToggleSelect}},
    [ITEMMENUACTION_DUMMY] = {gString_Dummy, {.void_u8 = NULL}}
};

extern const u8 gUnknown_8452F60[];
extern const u8 gUnknown_8452F66[];
extern const struct ScrollArrowsTemplate gUnknown_8452F6C;
extern const u8 gUnknown_8452F7C[];

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
        gUnknown_203AD10->field_00 = NULL;
        gUnknown_203AD10->field_04 = 0xFF;
        gUnknown_203AD10->itemMenuIcon = 0;
        gUnknown_203AD10->field_05_6 = 0;
        gUnknown_203AD10->pocketScrollArrowsTask = 0xFF;
        gUnknown_203AD10->pocketSwitchArrowsTask = 0xFF;
        if (location == 3)
            gUnknown_203AD10->field_05_0 = 1;
        else if (location == 6)
            gUnknown_203AD10->field_05_0 = 2;
        else
            gUnknown_203AD10->field_05_0 = 0;
        for (i = 0; i < 4; i++)
        {
            gUnknown_203AD10->data[i] = 0;
        }
        if (a1 == 0 || a1 == 1 || a1 == 2)
            gUnknown_203ACFC.pocket = a1;
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
            gUnknown_203AD10->data[0] = 0;
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
        sub_810842C(gUnknown_203ACFC.pocket);
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
        gTasks[taskId].data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gUnknown_203ACFC.cursorPos[gUnknown_203ACFC.pocket], gUnknown_203ACFC.itemsAbove[gUnknown_203ACFC.pocket]);
        gTasks[taskId].data[3] = 0;
        gTasks[taskId].data[8] = 0;
        gMain.state++;
        break;
    case 15:
        sub_80984FC(gUnknown_203ACFC.pocket);
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

bool8 sub_81081D0(void)
{
    void **buff;
    ResetAllBgsCoordinatesAndBgCntRegs();
    buff = &gUnknown_203AD14;
    *buff = Alloc(0x800);
    if (*buff == NULL)
        return FALSE;
    memset(*buff, 0, 0x800);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, gUnknown_8452CF4, NELEMS(gUnknown_8452CF4));
    SetBgTilemapBuffer(1, *buff);
    ScheduleBgCopyTilemapToVram(1);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON);
    ShowBg(0);
    ShowBg(1);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    return TRUE;
}

bool8 sub_8108240(void)
{
    switch (gUnknown_203AD10->data[0])
    {
    case 0:
        ResetTempTileDataBuffers();
        DecompressAndCopyTileDataToVram(1, gUnknown_8E830CC, 0, 0, 0);
        gUnknown_203AD10->data[0]++;
        break;
    case 1:
        if (FreeTempTileDataBuffersIfPossible() != TRUE)
        {
            if (gUnknown_203ACFC.location != 3)
                LZDecompressWram(gUnknown_8E832C0, gUnknown_203AD14);
            else
                LZDecompressWram(gUnknown_8E83444, gUnknown_203AD14);
            gUnknown_203AD10->data[0]++;
        }
        break;
    case 2:
        LoadCompressedPalette(gUnknown_8E835B4, 0x00, 0x60);
        if (!sub_810ADAC() && gSaveBlock2Ptr->playerGender != MALE)
            LoadCompressedPalette(gUnknown_8E83604, 0x00, 0x20);
        gUnknown_203AD10->data[0]++;
        break;
    case 3:
        if (sub_810ADAC() == TRUE || gSaveBlock2Ptr->playerGender == MALE)
            LoadCompressedSpriteSheet(&gUnknown_83D41E4);
        else
            LoadCompressedSpriteSheet(&gUnknown_83D41EC);
        gUnknown_203AD10->data[0]++;
        break;
    case 4:
        LoadCompressedSpritePalette(&gUnknown_83D41F4);
        gUnknown_203AD10->data[0]++;
        break;
    case 5:
        LoadCompressedSpriteSheet(&gBagSwapSpriteSheet);
        gUnknown_203AD10->data[0]++;
        break;
    default:
        LoadCompressedSpritePalette(&gBagSwapSpritePalette);
        gUnknown_203AD10->data[0] = 0;
        return TRUE;
    }

    return FALSE;
}

u8 sub_8108388(u8 location)
{
    switch (location)
    {
    case 6:
        return CreateTask(sub_810AF9C, 0);
    case 9:
        return CreateTask(sub_810B1D4, 0);
    case 10:
        return CreateTask(sub_810B5D4, 0);
    case 7:
        return CreateTask(sub_810B4BC, 0);
    case 8:
        return CreateTask(sub_810B378, 0);
    default:
        return CreateTask(sub_8108F0C, 0);
    }
}

bool8 sub_81083F4(void)
{
    gUnknown_203AD18 = Alloc(43 * sizeof(struct ListMenuItem));
    if (gUnknown_203AD18 == NULL)
        return FALSE;
    gUnknown_203AD1C = Alloc(43 * 19);
    if (gUnknown_203AD1C == NULL)
        return FALSE;
    return TRUE;
}

void sub_810842C(u8 pocket)
{
    u16 i;
    struct BagPocket * bagPocket = &gBagPockets[pocket];
    for (i = 0; i < gUnknown_203AD10->nItems[pocket]; i++)
    {
        sub_8108560(gUnknown_203AD1C[i], bagPocket->itemSlots[i].itemId);
        gUnknown_203AD18[i].label = gUnknown_203AD1C[i];
        gUnknown_203AD18[i].index = i;
    }
    StringCopy(gUnknown_203AD1C[i], gUnknown_8452F60);
    StringAppend(gUnknown_203AD1C[i], gFameCheckerText_Cancel);
    gUnknown_203AD18[i].label = gUnknown_203AD1C[i];
    gUnknown_203AD18[i].index = i;
    gMultiuseListMenuTemplate.items = gUnknown_203AD18;
    gMultiuseListMenuTemplate.totalItems = gUnknown_203AD10->nItems[pocket] + 1;
    gMultiuseListMenuTemplate.windowId = 0;
    gMultiuseListMenuTemplate.header_X = 0;
    gMultiuseListMenuTemplate.item_X = 9;
    gMultiuseListMenuTemplate.cursor_X = 1;
    gMultiuseListMenuTemplate.lettersSpacing = 0;
    gMultiuseListMenuTemplate.itemVerticalPadding = 2;
    gMultiuseListMenuTemplate.upText_Y = 2;
    gMultiuseListMenuTemplate.maxShowed = gUnknown_203AD10->maxShowed[pocket];
    gMultiuseListMenuTemplate.fontId = 2;
    gMultiuseListMenuTemplate.cursorPal = 2;
    gMultiuseListMenuTemplate.fillValue = 0;
    gMultiuseListMenuTemplate.cursorShadowPal = 3;
    gMultiuseListMenuTemplate.moveCursorFunc = sub_81085A4;
    gMultiuseListMenuTemplate.itemPrintFunc = sub_8108654;
    gMultiuseListMenuTemplate.cursorKind = 0;
    gMultiuseListMenuTemplate.scrollMultiple = 0;
}

void sub_8108560(u8 *dest, u16 itemId)
{
    if (itemId == ITEM_TM_CASE || itemId == ITEM_BERRY_POUCH)
        StringCopy(dest, gUnknown_8452F66);
    else
        StringCopy(dest, gUnknown_8452F60);
    StringAppend(dest, ItemId_GetName(itemId));
}

void sub_81085A4(s32 itemIndex, bool8 onInit, struct ListMenu *list)
{
    if (onInit != TRUE)
    {
        PlaySE(SE_BAG1);
        sub_8098580();
    }
    if (gUnknown_203AD10->field_04 == 0xFF)
    {
        DestroyItemMenuIcon(gUnknown_203AD10->itemMenuIcon ^ 1);
        if (gUnknown_203AD10->nItems[gUnknown_203ACFC.pocket] != itemIndex)
            CreateItemMenuIcon(BagGetItemIdByPocketPosition(gUnknown_203ACFC.pocket + 1, itemIndex), gUnknown_203AD10->itemMenuIcon);
        else
            CreateItemMenuIcon(ITEM_N_A, gUnknown_203AD10->itemMenuIcon);
        gUnknown_203AD10->itemMenuIcon ^= 1;
        if (gUnknown_203AD10->field_05_6 == 0)
            sub_8108818(itemIndex);
    }
}

void sub_8108654(u8 windowId, s32 itemId, u8 y)
{
    u16 bagItemId;
    u16 bagItemQuantity;
    if (gUnknown_203AD10->field_04 != 0xFF)
    {
        if (gUnknown_203AD10->field_04 == (u8)itemId)
            bag_menu_print_cursor(y, 2);
        else
            bag_menu_print_cursor(y, 0xFF);
    }
    if (itemId != -2 && gUnknown_203AD10->nItems[gUnknown_203ACFC.pocket] != itemId)
    {
        bagItemId = BagGetItemIdByPocketPosition(gUnknown_203ACFC.pocket + 1, itemId);
        bagItemQuantity = BagGetQuantityByPocketPosition(gUnknown_203ACFC.pocket + 1, itemId);
        if (gUnknown_203ACFC.pocket != POCKET_KEY_ITEMS - 1 && !itemid_is_unique(bagItemId))
        {
            ConvertIntToDecimalStringN(gStringVar1, bagItemQuantity, STR_CONV_MODE_RIGHT_ALIGN, 3);
            StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
            sub_810B8F0(windowId, 0, gStringVar4, 0x6e, y, 0, 0, 0xFF, 1);
        }
        else if (gSaveBlock1Ptr->registeredItem != ITEM_NONE && gSaveBlock1Ptr->registeredItem == bagItemId)
        {
            BlitBitmapToWindow(windowId, gUnknown_8452F7C, 0x70, y, 0x18, 0x10);
        }
    }
}

void bag_menu_print_cursor_(u8 taskId, u8 colorIdx)
{
    bag_menu_print_cursor(ListMenuGetYCoordForPrintingArrowCursor(taskId), colorIdx);
}

void bag_menu_print_cursor(u8 y, u8 colorIdx)
{
    if (colorIdx == 0xFF)
    {
        FillWindowPixelRect(0, PIXEL_FILL(0), 1, y, GetMenuCursorDimensionByFont(2, 0), GetMenuCursorDimensionByFont(2, 1));
    }
    else
    {
        sub_810B8F0(0, 2, gFameCheckerText_ListMenuCursor, 1, y, 0, 0, 0, colorIdx);
    }
}

void sub_81087EC(void)
{
    FillWindowPixelBuffer(2, PIXEL_FILL(0));
    sub_810B958(sPocketNames[gUnknown_203ACFC.pocket], gUnknown_203ACFC.pocket);
}

void sub_8108818(s32 itemIndex)
{
    const u8 *description;
    if (itemIndex != gUnknown_203AD10->nItems[gUnknown_203ACFC.pocket])
        description = ItemId_GetDescription(BagGetItemIdByPocketPosition(gUnknown_203ACFC.pocket + 1, itemIndex));
    else
        description = gUnknown_84162F5;
    FillWindowPixelBuffer(1, PIXEL_FILL(0));
    sub_810B8F0(1, 2, description, 0, 3, 2, 0, 0, 0);
}

void sub_8108888(void)
{
    gUnknown_203AD10->pocketScrollArrowsTask = AddScrollIndicatorArrowPairParameterized(
        SCROLL_ARROW_UP,
        160,
        8,
        104,
        gUnknown_203AD10->nItems[gUnknown_203ACFC.pocket] - gUnknown_203AD10->maxShowed[gUnknown_203ACFC.pocket] + 1,
        110,
        110,
        &gUnknown_203ACFC.cursorPos[gUnknown_203ACFC.pocket]
    );
}

void sub_81088D8(void)
{
    if (gUnknown_203AD10->field_05_0 != 1)
    {
        gUnknown_203AD10->pocketSwitchArrowsTask = AddScrollIndicatorArrowPair(&gUnknown_8452F6C, &gUnknown_203ACFC.pocket);
    }
}

void sub_8108908(void)
{
    gUnknown_203AD10->contextMenuSelectedItem = 1;
    gUnknown_203AD10->pocketScrollArrowsTask = AddScrollIndicatorArrowPairParameterized(
        SCROLL_ARROW_UP,
        152,
        72,
        104,
        2,
        110,
        110,
        &gUnknown_203AD10->contextMenuSelectedItem
    );
}

void sub_8108940(void)
{
    gUnknown_203AD10->contextMenuSelectedItem = 1;
    gUnknown_203AD10->pocketScrollArrowsTask = AddScrollIndicatorArrowPairParameterized(
        SCROLL_ARROW_UP,
        212,
        120,
        152,
        2,
        110,
        110,
        &gUnknown_203AD10->contextMenuSelectedItem
    );
}

void sub_8108978(void)
{
    if (gUnknown_203AD10->pocketScrollArrowsTask != 0xFF)
    {
        RemoveScrollIndicatorArrowPair(gUnknown_203AD10->pocketScrollArrowsTask);
        gUnknown_203AD10->pocketScrollArrowsTask = 0xFF;
    }
    sub_810899C();
}

void sub_810899C(void)
{
    if (gUnknown_203AD10->pocketSwitchArrowsTask != 0xFF)
    {
        RemoveScrollIndicatorArrowPair(gUnknown_203AD10->pocketSwitchArrowsTask);
        gUnknown_203AD10->pocketSwitchArrowsTask = 0xFF;
    }
}

void sub_81089BC(void)
{
    u8 i;
    gUnknown_203ACFC.pocket = POCKET_ITEMS - 1;
    gUnknown_203ACFC.unk5 = 0;
    for (i = 0; i < 3; i++)
    {
        gUnknown_203ACFC.itemsAbove[i] = 0;
        gUnknown_203ACFC.cursorPos[i] = 0;
    }
}

void sub_81089F4(u8 pocketId)
{
    if (gUnknown_203ACFC.cursorPos[pocketId] != 0 && gUnknown_203ACFC.cursorPos[pocketId] + gUnknown_203AD10->maxShowed[pocketId] > gUnknown_203AD10->nItems[pocketId] + 1)
    {
        gUnknown_203ACFC.cursorPos[pocketId] = (gUnknown_203AD10->nItems[pocketId] + 1) - gUnknown_203AD10->maxShowed[pocketId];
    }
    if (gUnknown_203ACFC.cursorPos[pocketId] + gUnknown_203ACFC.itemsAbove[pocketId] >= gUnknown_203AD10->nItems[pocketId] + 1)
    {
        if (gUnknown_203AD10->nItems[pocketId] + 1 < 2)
            gUnknown_203ACFC.itemsAbove[pocketId] = 0;
        else
            gUnknown_203ACFC.itemsAbove[pocketId] = gUnknown_203AD10->nItems[pocketId];
    }
}

void sub_8108A68(void)
{
    u8 i;
    for (i = 0; i < 3; i++)
    {
        sub_81089F4(i);
    }
}

void sub_8108A84(void)
{
    u8 i;
    u8 j;

    for (i = 0; i < 3; i++)
    {
        if (gUnknown_203ACFC.itemsAbove[i] > 3)
        {
            for (j = 0; j <= gUnknown_203ACFC.itemsAbove[i] - 3; gUnknown_203ACFC.itemsAbove[i]--, gUnknown_203ACFC.cursorPos[i]++, j++)
            {
                if (gUnknown_203ACFC.cursorPos[i] + gUnknown_203AD10->maxShowed[i] == gUnknown_203AD10->nItems[i] + 1)
                    break;
            }
        }
    }
}

void sub_8108B04(void)
{
    FREE_IF_SET(gUnknown_203AD10);
    FREE_IF_SET(gUnknown_203AD14);
    FREE_IF_SET(gUnknown_203AD18);
    FREE_IF_SET(gUnknown_203AD1C);
    FreeAllWindowBuffers();
}

void ItemMenu_StartFadeToExitCallback(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, -2, 0, 16, RGB_BLACK);
    gTasks[taskId].func = sub_8108B8C;
}

void sub_8108B8C(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!gPaletteFade.active && FuncIsActiveTask(sub_8108CFC) != TRUE)
    {
        DestroyListMenuTask(data[0], &gUnknown_203ACFC.cursorPos[gUnknown_203ACFC.pocket], &gUnknown_203ACFC.itemsAbove[gUnknown_203ACFC.pocket]);
        if (gUnknown_203AD10->field_00 != NULL)
            SetMainCallback2(gUnknown_203AD10->field_00);
        else
            SetMainCallback2(gUnknown_203ACFC.bagCallback);
        sub_8108978();
        sub_8108B04();
        DestroyTask(taskId);
    }
}

void sub_8108C10(void)
{
    u16 paldata = RGB_BLACK;
    u8 taskId;

    LoadPalette(&paldata, 0x00, 0x02);
    SetGpuReg(REG_OFFSET_WININ, 0);
    SetGpuReg(REG_OFFSET_WINOUT, 0x3F);
    BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
    if (gUnknown_203ACFC.unk5 == 1)
    {
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(0, 240));
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(0, 0));
    }
    else
    {
        SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(0, 240));
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(0, 160));
        taskId = CreateTask(sub_8108CFC, 0);
        gTasks[taskId].data[0] = 192;
        gTasks[taskId].data[1] = -16;
        gUnknown_203ACFC.unk5 = 1;
    }
}

void sub_8108CB4(void)
{

    u8 taskId = CreateTask(sub_8108CFC, 0);
    gTasks[taskId].data[0] = -16;
    gTasks[taskId].data[1] =  16;
    gUnknown_203ACFC.unk5 = 0;
}

void CB2_SetUpReshowBattleScreenAfterMenu(void)
{
    gUnknown_203ACFC.unk5 = 0;
}

void sub_8108CFC(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    data[0] += data[1];
    if (data[0] > 160)
        SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(0, 160));
    else
        SetGpuReg(REG_OFFSET_WIN0V, data[0]);
    if ((data[1] == 16 && data[0] == 160) || (data[1] == -16 && data[0] == 0))
        DestroyTask(taskId);
}

void MoveItemSlotInList(struct ItemSlot * itemSlots_, u32 from, u32 to_)
{
    // dumb assignments needed to match
    struct ItemSlot *itemSlots = itemSlots_;
    u32 to = to_;

    if (from != to)
    {
        s16 i, count;
        struct ItemSlot firstSlot = itemSlots[from];

        if (to > from)
        {
            to--;
            for (i = from, count = to; i < count; i++)
                itemSlots[i] = itemSlots[i + 1];
        }
        else
        {
            for (i = from, count = to; i > count; i--)
                itemSlots[i] = itemSlots[i - 1];
        }
        itemSlots[to] = firstSlot;
    }
}
