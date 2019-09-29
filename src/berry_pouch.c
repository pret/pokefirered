#include "global.h"
#include "malloc.h"
#include "bg.h"
#include "decompress.h"
#include "gpu_regs.h"
#include "palette.h"
#include "text.h"
#include "berry_pouch.h"
#include "item_menu.h"
#include "menu_helpers.h"
#include "new_menu_helpers.h"
#include "scanline_effect.h"
#include "item_menu_icons.h"
#include "list_menu.h"
#include "graphics.h"
#include "berry.h"
#include "item.h"
#include "strings.h"
#include "string_util.h"
#include "sound.h"
#include "link.h"
#include "menu.h"
#include "menu_indicators.h"
#include "constants/items.h"
#include "constants/songs.h"

struct BerryPouchStruct_203F36C
{
    void (*unk_000)(void);
    u16 unk_004;
    u8 unk_006;
    u8 unk_007;
    u8 unk_008;
    u8 unk_009;
    u8 filler_00a[2];
    u8 unk_00C[BG_SCREEN_SIZE];
    s16 unk_80C[4];
};

struct BerryPouchStruct_203F370
{
    void (*savedCallback)(void);
    u8 unk_04;
    u8 unk_05;
    u8 filler_06[2];
    u16 unk_08;
    u16 unk_0A;
};

EWRAM_DATA struct BerryPouchStruct_203F36C *gUnknown_203F36C = NULL;
EWRAM_DATA struct BerryPouchStruct_203F370 gUnknown_203F370 = {};
EWRAM_DATA struct ListMenuItem *gUnknown_203F37C = NULL;
EWRAM_DATA u8 *gUnknown_203F380 = NULL;
EWRAM_DATA const u8 *gUnknown_203F384 = NULL;
EWRAM_DATA u8 gUnknown_203F388 = 0;
ALIGNED(4) EWRAM_DATA u8 gUnknown_203F38C[14] = {};
ALIGNED(4) EWRAM_DATA u8 gUnknown_203F39C = 0;

void sub_813CE30(void);
bool8 sub_813CE5C(void);
void sub_813D00C(void);
void sub_813D048(u8 taskId);
void sub_813D07C(void);
bool8 sub_813D0E4(void);
bool8 sub_813D1C0(void);
void sub_813D204(void);
void sub_813D31C(u8 * dest, u16 itemId);
void sub_813D3C0(s32 itemIndex, bool8 onInit, struct ListMenu *list);
void sub_813D430(u8 windowId, s32 itemId, u8 y);
void sub_813D4D0(u8 y, u8 colorIdx);
void sub_813D538(s32 itemIndex);
void sub_813D5BC(void);
void sub_813D6A4(void);
void sub_813D6F4(void);
void sub_813D754(void);
void sub_813D7CC(void);
void sub_813D844(u8 taskId);
void sub_813D8AC(void);
void sub_813DA68(u8 taskId);
void sub_813DD74(u8 taskId);
void sub_813DDA0(u8 taskId);
void sub_813DE0C(u8 taskId);
void sub_813DEBC(u8 taskId);
void sub_813E200(u8 taskId);
void sub_813E320(u8 taskId);
void sub_813E37C(u8 taskId);
void sub_813E3FC(u8 taskId);
void sub_813E428(u8 taskId);
void sub_813EC28(void);
void sub_813E910(void);
void sub_813E9A0(u8 windowId, u8 fontId, const u8 * str, u8 x, u8 y, u8 letterSpacing, u8 lineSpacing, u8 speed, u8 colorIdx);
u8 sub_813EA08(u8);
u8 sub_813EB10(u8);
void sub_813EC08(void);

static const struct BgTemplate gUnknown_846434C[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 3,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x000
    }, {
        .bg = 2,
        .charBaseIndex = 0,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }
};

const TaskFunc gUnknown_8464358[] = {
    sub_813DD74,
    sub_813E37C,
    sub_813E428,
    sub_813E3FC,
    sub_813DD74
};

extern const struct MenuAction gUnknown_846437C[];
extern const u8 gUnknown_84643A4[];
extern const u8 gUnknown_84643A8[];
extern const u8 gUnknown_84643AC[];
extern const u8 gUnknown_84643B0[];
extern const u8 gUnknown_84643B4[];
extern const struct CompressedSpriteSheet gUnknown_84644A8;
extern const struct CompressedSpritePalette gUnknown_84644B0;

void InitBerryPouch(u8 a0, void (*savedCallback)(void), u8 a2)
{
    u8 i;

    gUnknown_203F36C = Alloc(sizeof(struct BerryPouchStruct_203F36C));
    if (gUnknown_203F36C == NULL)
    {
        SetMainCallback2(savedCallback);
    }
    else
    {
        if (a0 != 6)
            gUnknown_203F370.unk_04 = a0;
        if (a2 != 0xFF)
            gUnknown_203F370.unk_05 = a2;
        if (savedCallback != NULL)
            gUnknown_203F370.savedCallback = savedCallback;
        gUnknown_203F36C->unk_000 = NULL;
        gUnknown_203F36C->unk_009 = 0;
        gUnknown_203F36C->unk_006 = 0xFF;
        for (i = 0; i < 4; i++)
            gUnknown_203F36C->unk_80C[i] = 0;
        gTextFlags.autoScroll = FALSE;
        gSpecialVar_ItemId = ITEM_NONE;
        SetMainCallback2(sub_813CE30);
    }
}

void sub_813CE00(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    DoScheduledBgTilemapCopiesToVram();
    UpdatePaletteFade();
}

void sub_813CE1C(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_813CE30(void)
{
    while (1)
    {
        if (sub_80BF72C() == TRUE)
            break;
        if (sub_813CE5C() == TRUE)
            break;
        if (MenuHelpers_LinkSomething() == TRUE)
            break;
    }
}

bool8 sub_813CE5C(void)
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
            ResetTasks();
        gMain.state++;
        break;
    case 7:
        sub_813D07C();
        gUnknown_203F36C->unk_80C[0] = 0;
        gMain.state++;
        break;
    case 8:
        if (sub_813D0E4())
            gMain.state++;
        break;
    case 9:
        sub_813E910();
        gMain.state++;
        break;
    case 10:
        sub_813D8AC();
        sub_813D6F4();
        sub_813D754();
        gMain.state++;
        break;
    case 11:
        if (!sub_813D1C0())
        {
            sub_813D00C();
            return TRUE;
        }
        gMain.state++;
        break;
    case 12:
        sub_813D204();
        gMain.state++;
        break;
    case 13:
        sub_813D6A4();
        gMain.state++;
        break;
    case 14:
        taskId = CreateTask(sub_813DA68, 0);
        gTasks[taskId].data[0] = ListMenuInit(&gMultiuseListMenuTemplate, gUnknown_203F370.unk_0A, gUnknown_203F370.unk_08);
        gTasks[taskId].data[8] = 0;
        gMain.state++;
        break;
    case 15:
        sub_813EC08();
        gMain.state++;
        break;
    case 16:
        sub_813D5BC();
        gMain.state++;
        break;
    case 17:
        BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
        gMain.state++;
        break;
    case 18:
        BeginNormalPaletteFade(0xFFFFFFFF, -2, 16, 0, RGB_BLACK);
        gMain.state++;
        break;
    default:
        SetVBlankCallback(sub_813CE1C);
        SetMainCallback2(sub_813CE00);
        return TRUE;
    }

    return FALSE;
}

void sub_813D00C(void)
{
    BeginNormalPaletteFade(0xFFFFFFFF, -2, 0, 16, RGB_BLACK);
    CreateTask(sub_813D048, 0);
    SetVBlankCallback(sub_813CE1C);
    SetMainCallback2(sub_813CE00);
}

void sub_813D048(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(gUnknown_203F370.savedCallback);
        sub_813D7CC();
        DestroyTask(taskId);
    }
}

void sub_813D07C(void)
{
    ResetAllBgsCoordinatesAndBgCntRegs();
    memset(gUnknown_203F36C->unk_00C, 0, BG_SCREEN_SIZE);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, gUnknown_846434C, NELEMS(gUnknown_846434C));
    SetBgTilemapBuffer(1, gUnknown_203F36C->unk_00C);
    ScheduleBgCopyTilemapToVram(1);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
}

bool8 sub_813D0E4(void)
{
    switch (gUnknown_203F36C->unk_80C[0])
    {
    case 0:
        ResetTempTileDataBuffers();
        DecompressAndCopyTileDataToVram(1, gUnknown_8E859D0, 0, 0, 0);
        gUnknown_203F36C->unk_80C[0]++;
        break;
    case 1:
        if (FreeTempTileDataBuffersIfPossible() != TRUE)
        {
            LZDecompressWram(gUnknown_8E85C44, gUnknown_203F36C->unk_00C);
            gUnknown_203F36C->unk_80C[0]++;
        }
        break;
    case 2:
        LoadCompressedPalette(gUnknown_8E85BA4, 0, 0x60);
        if (gSaveBlock2Ptr->playerGender != MALE)
            LoadCompressedPalette(gUnknown_8E85BF4, 0, 0x20);
        gUnknown_203F36C->unk_80C[0]++;
        break;
    case 3:
        LoadCompressedSpriteSheet(&gUnknown_84644A8);
        gUnknown_203F36C->unk_80C[0]++;
        break;
    default:
        LoadCompressedSpritePalette(&gUnknown_84644B0);
        gUnknown_203F36C->unk_80C[0] = 0;
        return TRUE;
    }

    return FALSE;
}

bool8 sub_813D1C0(void)
{
    gUnknown_203F37C = Alloc(NUM_BERRIES * sizeof(struct ListMenuItem));
    if (gUnknown_203F37C == NULL)
        return FALSE;
    gUnknown_203F380 = Alloc(gUnknown_203F36C->unk_007 * 27);
    if (gUnknown_203F380 == NULL)
        return FALSE;
    return TRUE;
}

void sub_813D204(void)
{
    u16 i;
    struct BagPocket *pocket = &gBagPockets[POCKET_BERRY_POUCH - 1];
    for (i = 0; i < gUnknown_203F36C->unk_007; i++)
    {
        sub_813D31C(&gUnknown_203F380[i * 27], pocket->itemSlots[i].itemId);
        gUnknown_203F37C[i].label = &gUnknown_203F380[i * 27];
        gUnknown_203F37C[i].index = i;
    }
    gUnknown_203F37C[i].label = gText_Close;
    gUnknown_203F37C[i].index = i;
    gMultiuseListMenuTemplate.items = gUnknown_203F37C;
    if (gUnknown_203F370.unk_04 != 5)
        gMultiuseListMenuTemplate.totalItems = gUnknown_203F36C->unk_007 + 1;
    else
        gMultiuseListMenuTemplate.totalItems = gUnknown_203F36C->unk_007;
    gMultiuseListMenuTemplate.windowId = 0;
    gMultiuseListMenuTemplate.header_X = 0;
    gMultiuseListMenuTemplate.item_X = 9;
    gMultiuseListMenuTemplate.cursor_X = 1;
    gMultiuseListMenuTemplate.lettersSpacing = 0;
    gMultiuseListMenuTemplate.itemVerticalPadding = 2;
    gMultiuseListMenuTemplate.upText_Y = 2;
    gMultiuseListMenuTemplate.maxShowed = gUnknown_203F36C->unk_008;
    gMultiuseListMenuTemplate.fontId = 2;
    gMultiuseListMenuTemplate.cursorPal = 2;
    gMultiuseListMenuTemplate.fillValue = 0;
    gMultiuseListMenuTemplate.cursorShadowPal = 3;
    gMultiuseListMenuTemplate.moveCursorFunc = sub_813D3C0;
    gMultiuseListMenuTemplate.itemPrintFunc = sub_813D430;
    gMultiuseListMenuTemplate.cursorKind = 0;
    gMultiuseListMenuTemplate.scrollMultiple = 0;
}

void sub_813D31C(u8 * dest, u16 itemId)
{
    StringCopy(gStringVar4, gText_FontSize0);
    StringAppend(gStringVar4, gOtherText_UnkF9_08_Clear_01);
    ConvertIntToDecimalStringN(gStringVar1, itemId - FIRST_BERRY_INDEX + 1, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringAppend(gStringVar4, gStringVar1);
    CopyItemName(itemId, gStringVar1);
    StringAppend(gStringVar4, gUnknown_84643B4);
    StringAppend(gStringVar4, gText_FontSize2);
    StringAppend(gStringVar4, gStringVar1);
    StringCopy(dest, gStringVar4);
}

void sub_813D39C(s16 a0, u8 *dest)
{
    StringCopy(dest, &gUnknown_203F380[a0 * 27]);
}

void sub_813D3C0(s32 itemIndex, bool8 onInit, struct ListMenu *list)
{
    if (onInit != TRUE)
    {
        PlaySE(SE_W287B);
        sub_813EC28();
    }
    DestroyItemMenuIcon(gUnknown_203F36C->unk_009 ^ 1);
    if (gUnknown_203F36C->unk_007 != itemIndex)
        sub_80989A0(BagGetItemIdByPocketPosition(POCKET_BERRY_POUCH, itemIndex), gUnknown_203F36C->unk_009);
    else
        sub_80989A0(ITEM_N_A, gUnknown_203F36C->unk_009);
    gUnknown_203F36C->unk_009 ^= 1;
    sub_813D538(itemIndex);
}

void sub_813D430(u8 windowId, s32 itemId, u8 y)
{
    u16 unused;
    u16 itemQuantity;
    if (itemId != -2 && gUnknown_203F36C->unk_007 != itemId)
    {
        unused = BagGetItemIdByPocketPosition(POCKET_BERRY_POUCH, itemId);
        itemQuantity = BagGetQuantityByPocketPosition(POCKET_BERRY_POUCH, itemId);
        ConvertIntToDecimalStringN(gStringVar1, itemQuantity, STR_CONV_MODE_RIGHT_ALIGN, 3);
        StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
        sub_813E9A0(windowId, 0, gStringVar4, 110, y, 0, 0, 0xFF, 1);
    }
}

void sub_813D4B0(u8 taskId, u8 colorIdx)
{
    sub_813D4D0(ListMenuGetYCoordForPrintingArrowCursor(taskId), colorIdx);
}

void sub_813D4D0(u8 y, u8 colorIdx)
{
    u8 width;
    u8 height;
    if (colorIdx == 0xFF)
    {
        width = GetMenuCursorDimensionByFont(2, 0);
        height = GetMenuCursorDimensionByFont(2, 1);
        FillWindowPixelRect(0, 0, 1, y, width, height);
        CopyWindowToVram(0, 2);
    }
    else
    {
        sub_813E9A0(0, 2, gFameCheckerText_ListMenuCursor, 1, y, 0, 0, 0, colorIdx);
    }
}

void sub_813D538(s32 itemIdx)
{
    const u8 *str;
    if (itemIdx != gUnknown_203F36C->unk_007)
        str = ItemId_GetDescription(BagGetItemIdByPocketPosition(POCKET_BERRY_POUCH, itemIdx));
    else
        str = gUnknown_8416716;
    FillWindowPixelBuffer(1, PIXEL_FILL(0));
    sub_813E9A0(1, 2, str, 0, 2, 2, 0, 0, 0);
}

void sub_813D594(s32 pal)
{
    SetBgRectPal(1, 0, 16, 30, 4, pal + 1);
    ScheduleBgCopyTilemapToVram(1);
}

void sub_813D5BC(void)
{
    if (gUnknown_203F370.unk_04 != 5)
        gUnknown_203F36C->unk_006 = AddScrollIndicatorArrowPairParameterized(2, 160, 8, 120, gUnknown_203F36C->unk_007 - gUnknown_203F36C->unk_008 + 1, 110, 110, &gUnknown_203F370.unk_0A);
    else
        gUnknown_203F36C->unk_006 = AddScrollIndicatorArrowPairParameterized(2, 160, 8, 120, gUnknown_203F36C->unk_007 - gUnknown_203F36C->unk_008, 110, 110, &gUnknown_203F370.unk_0A);
}

void sub_813D614(void)
{
    gUnknown_203F36C->unk_004 = 1;
    gUnknown_203F36C->unk_006 = AddScrollIndicatorArrowPairParameterized(2, 212, 120, 152, 2, 110, 110, &gUnknown_203F36C->unk_004);
}

void sub_813D64C(void)
{
    gUnknown_203F36C->unk_004 = 1;
    gUnknown_203F36C->unk_006 = AddScrollIndicatorArrowPairParameterized(2, 152, 72, 104, 2, 110, 110, &gUnknown_203F36C->unk_004);
}

void sub_813D684(void)
{
    if (gUnknown_203F36C->unk_006 != 0xFF)
    {
        RemoveScrollIndicatorArrowPair(gUnknown_203F36C->unk_006);
        gUnknown_203F36C->unk_006 = 0xFF;
    }
}

void sub_813D6A4(void)
{
    u32 slack = 72 - GetStringWidth(1, gUnknown_841670A, 0);
    sub_813E9A0(2, 1, gUnknown_841670A, slack / 2, 1, 0, 0, 0, 0);
}

void sub_813D6E4(void)
{
    gUnknown_203F370.unk_08 = 0;
    gUnknown_203F370.unk_0A = 0;
}

void sub_813D6F4(void)
{
    s32 r2;
    if (gUnknown_203F370.unk_04 != 5)
        r2 = gUnknown_203F36C->unk_007 + 1;
    else
        r2 = gUnknown_203F36C->unk_007;
    if (gUnknown_203F370.unk_0A != 0 && gUnknown_203F370.unk_0A + gUnknown_203F36C->unk_008 > r2)
        gUnknown_203F370.unk_0A = r2 - gUnknown_203F36C->unk_008;
    if (gUnknown_203F370.unk_0A + gUnknown_203F370.unk_08 >= r2)
    {
        if (r2 == 0 || r2 == 1)
            gUnknown_203F370.unk_08 = 0;
        else
            gUnknown_203F370.unk_08 = r2 - 1;
    }
}

void sub_813D754(void)
{
    u8 lim;
    u8 i;
    if (gUnknown_203F370.unk_04 != 5)
        lim = gUnknown_203F36C->unk_007 + 1;
    else
        lim = gUnknown_203F36C->unk_007;
    if (gUnknown_203F370.unk_08 > 4)
    {
        for (i = 0; i <= gUnknown_203F370.unk_08 - 4; gUnknown_203F370.unk_08--, gUnknown_203F370.unk_0A++, i++)
        {
            if (gUnknown_203F370.unk_0A + gUnknown_203F36C->unk_008 == lim)
                break;
        }
    }
}

void sub_813D7CC(void)
{
    if (gUnknown_203F36C != NULL)
        Free(gUnknown_203F36C);
    if (gUnknown_203F37C != NULL)
        Free(gUnknown_203F37C);
    if (gUnknown_203F380 != NULL)
        Free(gUnknown_203F380);
    FreeAllWindowBuffers();
}

void BerryPouch_StartFadeToExitCallback(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, -2, 0, 16, RGB_BLACK);
    gTasks[taskId].func = sub_813D844;
}

void sub_813D844(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    if (!gPaletteFade.active)
    {
        DestroyListMenuTask(data[0], &gUnknown_203F370.unk_0A, &gUnknown_203F370.unk_08);
        if (gUnknown_203F36C->unk_000 != NULL)
            SetMainCallback2(gUnknown_203F36C->unk_000);
        else
            SetMainCallback2(gUnknown_203F370.savedCallback);
        sub_813D684();
        sub_813D7CC();
        DestroyTask(taskId);
    }
}

void sub_813D8AC(void)
{
    u16 i;
    u32 r2;
    struct BagPocket *pocket = &gBagPockets[POCKET_BERRY_POUCH - 1];
    SortAndCompactBagPocket(pocket);
    gUnknown_203F36C->unk_007 = 0;
    for (i = 0; i < pocket->capacity; i++)
    {
        if (pocket->itemSlots[i].itemId == ITEM_NONE)
            break;
        gUnknown_203F36C->unk_007++;
    }
    if (gUnknown_203F370.unk_04 != 5)
        r2 = gUnknown_203F36C->unk_007 + 1;
    else
        r2 = gUnknown_203F36C->unk_007;
    if (r2 > 7)
        gUnknown_203F36C->unk_008 = 7;
    else
        gUnknown_203F36C->unk_008 = r2;
}

void BerryPouch_SetExitCallback(void (*callback)(void))
{
    gUnknown_203F36C->unk_000 = callback;
}

void sub_813D940(u8 taskId, const u8 * str)
{
    s16 * data = gTasks[taskId].data;
    u8 windowId = sub_813EA08(8);
    u8 windowId2;
    sub_813D39C(data[1], gStringVar1);
    StringExpandPlaceholders(gStringVar4, str);
    sub_813E9A0(windowId, 2, gStringVar4, 0, 2, 1, 2, 0, 1);
    windowId2 = sub_813EA08(0);
    ConvertIntToDecimalStringN(gStringVar1, 1, STR_CONV_MODE_LEADING_ZEROS, 3);
    StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
    sub_813E9A0(windowId2, 0, gStringVar4, 4, 10, 1, 0, 0, 1);
}

void sub_813D9F8(u8 whichWindow, s16 quantity, u8 ndigits)
{
    u8 windowId = sub_813EB10(whichWindow);
    FillWindowPixelBuffer(windowId, PIXEL_FILL(1));
    ConvertIntToDecimalStringN(gStringVar1, quantity, STR_CONV_MODE_LEADING_ZEROS, ndigits);
    StringExpandPlaceholders(gStringVar4, gText_TimesStrVar1);
    sub_813E9A0(windowId, 0, gStringVar4, 4, 10, 1, 0, 0, 1);
}

void sub_813DA68(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    s32 menuInput;
    if (!gPaletteFade.active && sub_80BF72C() != TRUE)
    {
        menuInput = ListMenu_ProcessInput(data[0]);
        ListMenuGetScrollAndRow(data[0], &gUnknown_203F370.unk_0A, &gUnknown_203F370.unk_08);
        if (JOY_NEW(SELECT_BUTTON) && gUnknown_203F370.unk_05 == 1)
        {
            PlaySE(SE_SELECT);
            gSpecialVar_ItemId = 0;
            BerryPouch_StartFadeToExitCallback(taskId);
        }
        else
        {
            switch (menuInput)
            {
            case -1:
                return;
            case -2:
                if (gUnknown_203F370.unk_04 != 5)
                {
                    PlaySE(SE_SELECT);
                    gSpecialVar_ItemId = 0;
                    BerryPouch_StartFadeToExitCallback(taskId);
                }
                break;
            default:
                PlaySE(SE_SELECT);
                if (gUnknown_203F370.unk_04 == 5)
                {
                    gSpecialVar_ItemId = BagGetItemIdByPocketPosition(POCKET_BERRY_POUCH, menuInput);
                    BerryPouch_StartFadeToExitCallback(taskId);
                }
                else if (menuInput == gUnknown_203F36C->unk_007)
                {
                    gSpecialVar_ItemId = 0;
                    BerryPouch_StartFadeToExitCallback(taskId);
                }
                else
                {
                    sub_813D684();
                    sub_813D594(1);
                    sub_813D4B0(data[0], 2);
                    data[1] = menuInput;
                    data[2] = BagGetQuantityByPocketPosition(POCKET_BERRY_POUCH, menuInput);
                    gSpecialVar_ItemId = BagGetItemIdByPocketPosition(POCKET_BERRY_POUCH, menuInput);
                    gTasks[taskId].func = gUnknown_8464358[gUnknown_203F370.unk_04];
                }
                break;
            }
        }
    }
}

void sub_813DBB4(u8 taskId)
{
    sub_813D594(0);
    sub_813D5BC();
    gTasks[taskId].func = sub_813DA68;
}

void sub_813DBE4(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u8 windowId;
    u8 windowId2;

    if (gUnknown_203F370.unk_04 == 4)
    {
        gUnknown_203F384 = gUnknown_84643B0;
        gUnknown_203F388 = 3;
    }
    else if (MenuHelpers_LinkSomething() == TRUE || InUnionRoom() == TRUE)
    {
        if (!sub_80BF6A8(gSpecialVar_ItemId))
        {
            gUnknown_203F384 = gUnknown_84643AC;
            gUnknown_203F388 = 1;
        }
        else
        {
            gUnknown_203F384 = gUnknown_84643A8;
            gUnknown_203F388 = 2;
        }
    }
    else
    {
        gUnknown_203F384 = gUnknown_84643A4;
        gUnknown_203F388 = 4;
    }
    windowId = sub_813EA08(gUnknown_203F388 + 9);
    AddItemMenuActionTextPrinters(windowId, 2, GetMenuCursorDimensionByFont(2, 0), 2, GetFontAttribute(2, FONTATTR_LETTER_SPACING), GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT) + 2, gUnknown_203F388, gUnknown_846437C, gUnknown_203F384);
    Menu_InitCursor(windowId, 2, 0, 2, GetFontAttribute(2, FONTATTR_MAX_LETTER_HEIGHT) + 2, gUnknown_203F388, 0);
    windowId2 = sub_813EA08(6);
    sub_813D39C(data[1], gStringVar1);
    StringExpandPlaceholders(gStringVar4, gOtherText_StrVar1);
    sub_813E9A0(windowId2, 2, gStringVar4, 0, 2, 1, 2, 0, 1);
}

void sub_813DD74(u8 taskId)
{
    sub_813DBE4(taskId);
    gTasks[taskId].func = sub_813DDA0;
}
