#include "global.h"
#include "bg.h"
#include "data2.h"
#include "decompress.h"
#include "gpu_regs.h"
#include "graphics.h"
#include "help_system.h"
#include "item.h"
#include "item_menu.h"
#include "item_menu_icons.h"
#include "list_menu.h"
#include "main.h"
#include "malloc.h"
#include "menu.h"
#include "menu_helpers.h"
#include "menu_indicators.h"
#include "new_menu_helpers.h"
#include "palette.h"
#include "party_menu.h"
#include "pc_screen_effect.h"
#include "scanline_effect.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "constants/items.h"
#include "constants/songs.h"

struct ItemPcResources
{
    MainCallback field_00;
    u8 field_04;
    u8 field_05;
    u8 field_06;
    u8 field_07;
    u8 field_08;
    u16 field_0A;
    s16 field_0C[3];
};

struct ItemPcStaticResources
{
    MainCallback field_0;
    u16 field_4;
    u16 field_6;
    u8 field_8;
};

EWRAM_DATA struct ItemPcResources * gUnknown_203ADBC = NULL;
EWRAM_DATA u8 * gUnknown_203ADC0 = NULL;
EWRAM_DATA struct ListMenuItem * gUnknown_203ADC4 = NULL;
EWRAM_DATA void * gUnknown_203ADC8 = NULL;
EWRAM_DATA struct ItemPcStaticResources gUnknown_203ADCC = {};

extern const struct CompressedSpriteSheet gUnknown_83D4240;
extern const struct CompressedSpritePalette gUnknown_83D4248;

void sub_810D4A0(void);
bool8 sub_810D4C0(void);
void sub_810D6AC(void);
void sub_810D6E8(u8 taskId);
bool8 sub_810D71C(void);
bool8 sub_810D78C(void);
bool8 sub_810D83C(void);
void sub_810D878(void);
void sub_810D954(s32 itemIndex, bool8 onInit, struct ListMenu * list);
void sub_810DA20(u8 windowId, s32 itemId, u8 y);
void sub_810DAD4(u8 y, u8 state);
void sub_810DB34(void);
void sub_810DB5C(void);
void sub_810DBF0(void);
void sub_810DC40(void);
void sub_810DCE4(u8 taskId);
u16 ItemPc_GetItemIdBySlotId(u16 itemIndex);
u16 ItemPc_GetItemQuantityBySlotId(u16 itemIndex);
void sub_810DDA4(void);
void sub_810DE08(void);
void sub_810DE94(u8);
void sub_810DEA0(u8 taskId);
void sub_810DFE0(u8 taskId, s16 pos);
void sub_810E0B4(u8 taskId);
void sub_810E160(u8 taskId, u32 pos);
void sub_810E200(u8 taskId, u32 pos);
void sub_810E274(u8 taskId);
void sub_810E8F0(void);
void sub_810EA34(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx);

const struct BgTemplate gUnknown_8453F6C[2] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .priority = 0
    }, {
        .bg = 1,
        .charBaseIndex = 3,
        .mapBaseIndex = 30,
        .priority = 1
    }
};

void sub_810D3F4(u8 a0, MainCallback callback)
{
    u8 i;

    if (a0 >= 2)
    {
        SetMainCallback2(callback);
        return;
    }
    if ((gUnknown_203ADBC = Alloc(sizeof(struct ItemPcResources))) == NULL)
    {
        SetMainCallback2(callback);
        return;
    }
    if (a0 != 1)
    {
        gUnknown_203ADCC.field_0 = callback;
        gUnknown_203ADCC.field_4 = gUnknown_203ADCC.field_6 = 0;
    }
    gUnknown_203ADBC->field_04 = 0xFF;
    gUnknown_203ADBC->field_05 = 0;
    gUnknown_203ADBC->field_08 = 0xFF;
    gUnknown_203ADBC->field_00 = 0;
    for (i = 0; i < 3; i++)
    {
        gUnknown_203ADBC->field_0C[i] = 0;
    }
    SetMainCallback2(sub_810D4A0);
}

void sub_810D470(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    do_scheduled_bg_tilemap_copies_to_vram();
    UpdatePaletteFade();
}

void sub_810D48C(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_810D4A0(void)
{
    while (1)
    {
        if (sub_810D4C0() == TRUE)
            break;
        if (sub_80BF708() == TRUE)
            break;
    }
}

bool8 sub_810D4C0(void)
{
    u8 taskId;
    switch (gMain.state)
    {
    case 0:
        VblankHblankHandlerSetZero();
        clear_scheduled_bg_copies_to_vram();
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
        gMain.state++;
        break;
    case 4:
        ResetSpriteData();
        gMain.state++;
        break;
    case 5:
        sub_80984D8();
        gMain.state++;
        break;
    case 6:
        ResetTasks();
        gMain.state++;
        break;
    case 7:
        if (sub_810D71C())
        {
            gUnknown_203ADBC->field_0C[0] = 0;
            gMain.state++;
        }
        else
        {
            sub_810D6AC();
            return TRUE;
        }
        break;
    case 8:
        if (sub_810D78C() == TRUE)
            gMain.state++;
        break;
    case 9:
        sub_810E8F0();
        gMain.state++;
        break;
    case 10:
        sub_810DDA4();
        sub_810DBF0();
        sub_810DE08();
        gMain.state++;
        break;
    case 11:
        if (sub_810D83C())
            gMain.state++;
        else
        {
            sub_810D6AC();
            return TRUE;
        }
        break;
    case 12:
        sub_810D878();
        gMain.state++;
        break;
    case 13:
        sub_810DB34();
        gMain.state++;
        break;
    case 14:
        sub_80985E4();
        gMain.state++;
        break;
    case 15:
        taskId = CreateTask(sub_810DEA0, 0);
        gTasks[taskId].data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gUnknown_203ADCC.field_4, gUnknown_203ADCC.field_6);
        gMain.state++;
        break;
    case 16:
        sub_810DB5C();
        gMain.state++;
        break;
    case 17:
        HelpSystem_SetSomeVariable2(29);
        gMain.state++;
        break;
    case 18:
        if (gUnknown_203ADCC.field_8 == 1)
        {
            BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
        }
        gMain.state++;
        break;
    case 19:
        if (gUnknown_203ADCC.field_8 == 1)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        }
        else
        {
            sub_80A0A48(0, 0, 0);
            sub_810DE94(1);
            PlaySE(SE_PC_LOGON);
        }
        gMain.state++;
        break;
    case 20:
        if (sub_80BF72C() != TRUE)
            gMain.state++;
        break;
    default:
        SetVBlankCallback(sub_810D48C);
        SetMainCallback2(sub_810D470);
        return TRUE;
    }
    return FALSE;
}

void sub_810D6AC(void)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
    CreateTask(sub_810D6E8, 0);
    SetVBlankCallback(sub_810D48C);
    SetMainCallback2(sub_810D470);
}

void sub_810D6E8(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(gUnknown_203ADCC.field_0);
        sub_810DC40();
        DestroyTask(taskId);
    }
}

bool8 sub_810D71C(void)
{
    InitBgReg();
    gUnknown_203ADC0 = Alloc(0x800);
    if (gUnknown_203ADC0 == NULL)
        return FALSE;
    memset(gUnknown_203ADC0, 0, 0x800);
    ResetBgsAndClearDma3BusyFlags(0);
    InitBgsFromTemplates(0, gUnknown_8453F6C, NELEMS(gUnknown_8453F6C));
    SetBgTilemapBuffer(1, gUnknown_203ADC0);
    schedule_bg_copy_tilemap_to_vram(1);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
    SetGpuReg(REG_OFFSET_BLDCNT , 0);
    ShowBg(0);
    ShowBg(1);
    return TRUE;
}

bool8 sub_810D78C(void)
{
    switch (gUnknown_203ADBC->field_0C[0])
    {
    case 0:
        reset_temp_tile_data_buffers();
        decompress_and_copy_tile_data_to_vram(1, gUnknown_8E85090, 0, 0, 0);
        gUnknown_203ADBC->field_0C[0]++;
        break;
    case 1:
        if (free_temp_tile_data_buffers_if_possible() != TRUE)
        {
            LZDecompressWram(gUnknown_8E85458, gUnknown_203ADC0);
            gUnknown_203ADBC->field_0C[0]++;
        }
        break;
    case 2:
        LoadCompressedPalette(gUnknown_8E85408, 0x00, 0x60);
        gUnknown_203ADBC->field_0C[0]++;
        break;
    case 3:
        LoadCompressedObjectPic(&gUnknown_83D4240);
        gUnknown_203ADBC->field_0C[0]++;
        break;
    default:
        LoadCompressedObjectPalette(&gUnknown_83D4248);
        gUnknown_203ADBC->field_0C[0] = 0;
        return TRUE;
    }
    return FALSE;
}

#define sub_810D83C_sub(ptr__, size) ({ \
    void ** ptr = (void **)&(ptr__);             \
    *ptr = Alloc(size);                 \
    if (*ptr == NULL)                   \
    {                                   \
        sub_810DC40();                  \
        sub_810D6AC();                  \
        return FALSE;                   \
    }                                   \
})

bool8 sub_810D83C(void)
{
    sub_810D83C_sub(gUnknown_203ADC4, sizeof(struct ListMenuItem) * (PC_ITEMS_COUNT + 1));
    sub_810D83C_sub(gUnknown_203ADC8, 0x1B2);
    return TRUE;
}

void sub_810D878(void)
{
    u16 i;

    for (i = 0; i < gUnknown_203ADBC->field_07; i++)
    {
        gUnknown_203ADC4[i].label = ItemId_GetName(gSaveBlock1Ptr->pcItems[i].itemId);
        gUnknown_203ADC4[i].index = i;
    }
    gUnknown_203ADC4[i].label = gFameCheckerText_Cancel;
    gUnknown_203ADC4[i].index = -2;

    gMultiuseListMenuTemplate.items = gUnknown_203ADC4;
    gMultiuseListMenuTemplate.totalItems = gUnknown_203ADBC->field_07 + 1;
    gMultiuseListMenuTemplate.windowId = 0;
    gMultiuseListMenuTemplate.header_X = 0;
    gMultiuseListMenuTemplate.item_X = 9;
    gMultiuseListMenuTemplate.cursor_X = 1;
    gMultiuseListMenuTemplate.lettersSpacing = 1;
    gMultiuseListMenuTemplate.itemVerticalPadding = 2;
    gMultiuseListMenuTemplate.upText_Y = 2;
    gMultiuseListMenuTemplate.maxShowed = gUnknown_203ADBC->field_06;
    gMultiuseListMenuTemplate.fontId = 2;
    gMultiuseListMenuTemplate.cursorPal = 2;
    gMultiuseListMenuTemplate.fillValue = 0;
    gMultiuseListMenuTemplate.cursorShadowPal = 3;
    gMultiuseListMenuTemplate.moveCursorFunc = sub_810D954;
    gMultiuseListMenuTemplate.itemPrintFunc = sub_810DA20;
    gMultiuseListMenuTemplate.scrollMultiple = 0;
    gMultiuseListMenuTemplate.cursorKind = 0;
}

void sub_810D954(s32 itemIndex, bool8 onInit, struct ListMenu * list)
{
    u16 itemId;
    const u8 * desc;
    if (onInit != TRUE)
        PlaySE(SE_SELECT);

    if (gUnknown_203ADBC->field_04 == 0xFF)
    {
        sub_8098940(gUnknown_203ADBC->field_05 ^ 1);
        if (itemIndex != -2)
        {
            itemId = ItemPc_GetItemIdBySlotId(itemIndex);
            sub_80988E8(itemId, gUnknown_203ADBC->field_05);
            if (ItemId_GetPocket(itemId) == POCKET_TM_CASE)
                desc = gMoveNames[ItemIdToBattleMoveId(itemId)];
            else
                desc = ItemId_GetDescription(itemId);
        }
        else
        {
            sub_80988E8(ITEM_N_A, gUnknown_203ADBC->field_05);
            desc = gUnknown_84178BE;
        }
        gUnknown_203ADBC->field_05 ^= 1;
        FillWindowPixelBuffer(1, 0);
        sub_810EA34(1, 2, desc, 0, 3, 2, 0, 0, 3);
    }
}

void sub_810DA20(u8 windowId, s32 itemId, u8 y)
{
    if (gUnknown_203ADBC->field_04 != 0xFF)
    {
        if (gUnknown_203ADBC->field_04 == (u8)itemId)
            sub_810DAD4(y, 2);
        else
            sub_810DAD4(y, 0xFF);
    }
    if (itemId != -2)
    {
        u16 quantity = ItemPc_GetItemQuantityBySlotId(itemId);
        ConvertIntToDecimalStringN(gStringVar1, quantity, STR_CONV_MODE_RIGHT_ALIGN, 3);
        StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
        sub_810EA34(windowId, 0, gStringVar4, 110, y, 0, 0, 0xFF, 1);
    }
}

void sub_810DAB4(u8 listMenuId, u8 colorIdx)
{
    sub_810DAD4(ListMenuGetYCoordForPrintingArrowCursor(listMenuId), colorIdx);
}

void sub_810DAD4(u8 y, u8 colorIdx)
{
    if (colorIdx == 0xFF)
    {
        u8 maxWidth = GetFontAttribute(2, FONTATTR_MAX_LETTER_WIDTH);
        u8 maxHeight = GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT);
        FillWindowPixelRect(0, 0, 0, y, maxWidth, maxHeight);
    }
    else
    {
        sub_810EA34(0, 2, gFameCheckerText_ListMenuCursor, 0, y, 0, 0, 0, colorIdx);
    }
}

void sub_810DB34(void)
{
    sub_810EA34(2, 0, gUnknown_84178A7, 0, 1, 0, 1, 0, 0);
}

void sub_810DB5C(void)
{
    gUnknown_203ADBC->field_08 = AddScrollIndicatorArrowPairParameterized(2, 128, 8, 104, gUnknown_203ADBC->field_07 - gUnknown_203ADBC->field_06 + 1, 110, 110, &gUnknown_203ADCC.field_4);
}

void sub_810DB98(void)
{
    gUnknown_203ADBC->field_0A = 1;
    gUnknown_203ADBC->field_08 = AddScrollIndicatorArrowPairParameterized(2, 212, 120, 152, 2, 110, 110, &gUnknown_203ADBC->field_0A);
}

void sub_810DBD0(void)
{
    if (gUnknown_203ADBC->field_08 != 0xFF)
    {
        RemoveScrollIndicatorArrowPair(gUnknown_203ADBC->field_08);
        gUnknown_203ADBC->field_08 = 0xFF;
    }
}

void sub_810DBF0(void)
{
    if (gUnknown_203ADCC.field_4 != 0 && gUnknown_203ADCC.field_4 + gUnknown_203ADBC->field_06 > gUnknown_203ADBC->field_07 + 1)
        gUnknown_203ADCC.field_4 = (gUnknown_203ADBC->field_07 + 1) - gUnknown_203ADBC->field_06;
    if (gUnknown_203ADCC.field_4 + gUnknown_203ADCC.field_6 >= gUnknown_203ADBC->field_07 + 1)
    {
        if (gUnknown_203ADBC->field_07 + 1 < 2)
            gUnknown_203ADCC.field_6 = 0;
        else
            gUnknown_203ADCC.field_6 = gUnknown_203ADBC->field_07;
    }
}

#define sub_810DC40_sub(ptr) ({        \
    void ** ptr__ = (void **)&(ptr);   \
    if (*ptr__ != NULL)                \
        Free(*ptr__);                  \
})

void sub_810DC40(void)
{
    sub_810DC40_sub(gUnknown_203ADBC);
    sub_810DC40_sub(gUnknown_203ADC0);
    sub_810DC40_sub(gUnknown_203ADC4);
    sub_810DC40_sub(gUnknown_203ADC8);
    FreeAllWindowBuffers();
}

void sub_810DC8C(u8 taskId)
{
    if (gUnknown_203ADCC.field_8 == 1)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
    }
    else
    {
        sub_80A0A70(0, 0, 0);
        PlaySE(SE_PC_OFF);
    }
    gTasks[taskId].func = sub_810DCE4;
}

void sub_810DCE4(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (!gPaletteFade.active && !sub_80A0AAC())
    {
        DestroyListMenu(data[0], &gUnknown_203ADCC.field_4, &gUnknown_203ADCC.field_6);
        if (gUnknown_203ADBC->field_00 != NULL)
            SetMainCallback2(gUnknown_203ADBC->field_00);
        else
            SetMainCallback2(gUnknown_203ADCC.field_0);
        sub_810DBD0();
        sub_810DC40();
        DestroyTask(taskId);
    }
}

u8 sub_810DD54(void)
{
    return gUnknown_203ADCC.field_4 + gUnknown_203ADCC.field_6;
}

u16 ItemPc_GetItemIdBySlotId(u16 idx)
{
    return gSaveBlock1Ptr->pcItems[idx].itemId;
}

u16 ItemPc_GetItemQuantityBySlotId(u16 idx)
{
    return GetBagItemId(&gSaveBlock1Ptr->pcItems[idx].quantity);
}

void sub_810DDA4(void)
{
    u16 i;

    sub_809A4E8();
    gUnknown_203ADBC->field_07 = 0;
    for (i = 0; i < PC_ITEMS_COUNT; gUnknown_203ADBC->field_07++, i++)
    {
        if (gSaveBlock1Ptr->pcItems[i].itemId == ITEM_NONE)
            break;
    }
    gUnknown_203ADBC->field_06 = gUnknown_203ADBC->field_07 + 1 <= 6 ? gUnknown_203ADBC->field_07 + 1 : 6;
}

void sub_810DE08(void)
{
    u8 i;

    if (gUnknown_203ADCC.field_6 > 3)
    {
        for (i = 0; i <= gUnknown_203ADCC.field_6 - 3; gUnknown_203ADCC.field_6--, gUnknown_203ADCC.field_4++, i++)
        {
            if (gUnknown_203ADCC.field_4 + gUnknown_203ADBC->field_06 == gUnknown_203ADBC->field_07 + 1)
                break;
        }
    }
}

void sub_810DE6C(int a0)
{
    sub_80F6B08(1, 0, 14, 30, 6, a0 + 1);
    schedule_bg_copy_tilemap_to_vram(1);
}

void sub_810DE94(u8 a0)
{
    gUnknown_203ADCC.field_8 = a0;
}

void sub_810DEA0(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u16 scroll;
    u16 row;
    s32 input;

    if (!gPaletteFade.active && !sub_80A0A98())
    {
        if (JOY_NEW(SELECT_BUTTON))
        {
            ListMenuGetScrollAndRow(data[0], &scroll, &row);
            if (scroll + row != gUnknown_203ADBC->field_07)
            {
                PlaySE(SE_SELECT);
                sub_810DFE0(taskId, scroll + row);
                return;
            }
        }
        input = ListMenuHandleInput(data[0]);
        ListMenuGetScrollAndRow(data[0], &gUnknown_203ADCC.field_4, &gUnknown_203ADCC.field_6);
        switch (input)
        {
        case -1:
            break;
        case -2:
            PlaySE(SE_SELECT);
            sub_810DE94(0);
            gTasks[taskId].func = sub_810DC8C;
            break;
        default:
            PlaySE(SE_SELECT);
            sub_810DE6C(1);
            sub_810DBD0();
            data[1] = input;
            data[2] = ItemPc_GetItemQuantityBySlotId(input);
            sub_810DAB4(data[0], 2);
            gTasks[taskId].func = sub_810E274;
            break;
        }
    }
}

void sub_810DFB0(u8 taskId)
{
    sub_810DE6C(0);
    sub_810DB5C();
    gTasks[taskId].func = sub_810DEA0;
}

void sub_810DFE0(u8 taskId, s16 pos)
{
    s16 * data = gTasks[taskId].data;

    sub_8107BD0(data[0], 16, 1);
    data[1] = pos;
    gUnknown_203ADBC->field_04 = pos;
    StringCopy(gStringVar1, ItemId_GetName(ItemPc_GetItemIdBySlotId(data[1])));
    StringExpandPlaceholders(gStringVar4, gUnknown_841633F);
    FillWindowPixelBuffer(1, 0x00);
    sub_810EA34(1, 2, gStringVar4, 0, 3, 2, 3, 0, 0);
    sub_80986A8(-32, ListMenuGetYCoordForPrintingArrowCursor(data[0]));
    sub_8098660(0);
    sub_810DAB4(data[0], 2);
    gTasks[taskId].func = sub_810E0B4;
}

void sub_810E0B4(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    ListMenuHandleInput(data[0]);
    ListMenuGetScrollAndRow(data[0], &gUnknown_203ADCC.field_4, &gUnknown_203ADCC.field_6);
    sub_80986A8(-32, ListMenuGetYCoordForPrintingArrowCursor(data[0]));
    if (JOY_NEW(A_BUTTON | SELECT_BUTTON))
    {
        PlaySE(SE_SELECT);
        gUnknown_203ADBC->field_04 = 0xFF;
        sub_810E160(taskId, gUnknown_203ADCC.field_4 + gUnknown_203ADCC.field_6);
    }
    else if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        gUnknown_203ADBC->field_04 = 0xFF;
        sub_810E200(taskId, gUnknown_203ADCC.field_4 + gUnknown_203ADCC.field_6);
    }
}

void sub_810E160(u8 taskId, u32 pos)
{
    s16 * data = gTasks[taskId].data;
    if (data[1] == pos || data[1] == pos - 1)
        sub_810E200(taskId, pos);
    else
    {
        sub_8108D60(gSaveBlock1Ptr->pcItems, data[1], pos);
        DestroyListMenu(data[0], &gUnknown_203ADCC.field_4, &gUnknown_203ADCC.field_6);
        if (data[1] < pos)
            gUnknown_203ADCC.field_6--;
        sub_810D878();
        data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gUnknown_203ADCC.field_4, gUnknown_203ADCC.field_6);
        sub_8098660(1);
        gTasks[taskId].func = sub_810DEA0;
    }
}

void sub_810E200(u8 taskId, u32 pos)
{
    s16 * data = gTasks[taskId].data;

    DestroyListMenu(data[0], &gUnknown_203ADCC.field_4, &gUnknown_203ADCC.field_6);
    if (data[1] < pos)
        gUnknown_203ADCC.field_6--;
    sub_810D878();
    data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gUnknown_203ADCC.field_4, gUnknown_203ADCC.field_6);
    sub_8098660(1);
    gTasks[taskId].func = sub_810DEA0;
}
