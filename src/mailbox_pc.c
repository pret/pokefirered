#include "global.h"
#include "malloc.h"
#include "window.h"
#include "menu.h"
#include "string_util.h"
#include "new_menu_helpers.h"
#include "list_menu.h"
#include "player_pc.h"
#include "strings.h"
#include "menu_indicators.h"
#include "sound.h"
#include "constants/songs.h"

EWRAM_DATA u8 gUnknown_203ADDC[3] = {};
EWRAM_DATA struct ListMenuItem * gUnknown_203ADE0 = NULL;

void sub_810ED6C(s32 itemIndex, bool8 onInit, struct ListMenu * list);

static const struct WindowTemplate gUnknown_8453FE8[] = {
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 10,
        .height = 2,
        .paletteNum = 15,
        .baseBlock = 0x008
    }, {
        .bg = 0,
        .tilemapLeft = 19,
        .tilemapTop = 1,
        .width = 10,
        .height = 18,
        .paletteNum = 15,
        .baseBlock = 0x01c
    }, {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 15,
        .height = 8,
        .paletteNum = 15,
        .baseBlock = 0x01c
    }
};

static const u8 gUnknown_8454000[3] = {1, 2, 3};
static const u8 gUnknown_8454003[] = _("");

bool8 sub_810EB6C(u8 num)
{
    u8 i;

    gUnknown_203ADE0 = Alloc(sizeof(struct ListMenuItem) * (num + 1));
    if (gUnknown_203ADE0 == NULL)
        return FALSE;
    for (i = 0; i < NELEMS(gUnknown_203ADDC); i++)
        gUnknown_203ADDC[i] = 0xFF;
    return TRUE;
}

u8 sub_810EBAC(u8 winIdx)
{
    if (gUnknown_203ADDC[winIdx] == 0xFF)
    {
        gUnknown_203ADDC[winIdx] = AddWindow(&gUnknown_8453FE8[winIdx]);
        SetStdWindowBorderStyle(gUnknown_203ADDC[winIdx], 0);
    }
    return gUnknown_203ADDC[winIdx];
}

void sub_810EBE0(u8 winIdx)
{
    ClearStdWindowAndFrameToTransparent(gUnknown_203ADDC[winIdx], FALSE);
    ClearWindowTilemap(gUnknown_203ADDC[winIdx]);
    RemoveWindow(gUnknown_203ADDC[winIdx]);
    gUnknown_203ADDC[winIdx] = 0xFF;
}

u8 sub_810EC10(u8 winIdx)
{
    return gUnknown_203ADDC[winIdx];
}

void sub_810EC20(u8 windowId, s32 itemId, u8 y)
{
    u8 strbuf[30];
    if (itemId != -2)
    {
        StringCopy(strbuf, gSaveBlock1Ptr->mail[itemId + PARTY_SIZE].playerName);
        if (StringLength(strbuf) <= 5)
            ConvertInternationalString(strbuf, LANGUAGE_JAPANESE);
        AddTextPrinterParameterized4(windowId, 2, 8, y, 0, 0, gUnknown_8454000, -1, strbuf);
    }
}

u8 sub_810EC98(struct PlayerPC_Unk_203AAC4 * playerPcStruct)
{
    u16 i;
    for (i = 0; i < playerPcStruct->unk_5; i++)
    {
        gUnknown_203ADE0[i].label = gUnknown_8454003;
        gUnknown_203ADE0[i].index = i;
    }
    gUnknown_203ADE0[i].label = gFameCheckerText_Cancel;
    gUnknown_203ADE0[i].index = -2;

    gMultiuseListMenuTemplate.items = gUnknown_203ADE0;
    gMultiuseListMenuTemplate.totalItems = playerPcStruct->unk_5 + 1;
    gMultiuseListMenuTemplate.windowId = gUnknown_203ADDC[1];
    gMultiuseListMenuTemplate.header_X = 0;
    gMultiuseListMenuTemplate.item_X = GetMenuCursorDimensionByFont(2, 0);
    gMultiuseListMenuTemplate.cursor_X = 0;
    gMultiuseListMenuTemplate.lettersSpacing = 0;
    gMultiuseListMenuTemplate.itemVerticalPadding = 2;
    gMultiuseListMenuTemplate.maxShowed = 8;
    gMultiuseListMenuTemplate.fontId = 2;
    gMultiuseListMenuTemplate.upText_Y = 10;
    gMultiuseListMenuTemplate.cursorPal = 2;
    gMultiuseListMenuTemplate.fillValue = 1;
    gMultiuseListMenuTemplate.cursorShadowPal = 3;
    gMultiuseListMenuTemplate.moveCursorFunc = sub_810ED6C;
    gMultiuseListMenuTemplate.itemPrintFunc = sub_810EC20;
    gMultiuseListMenuTemplate.cursorKind = 0;
    gMultiuseListMenuTemplate.scrollMultiple = 0;
    return ListMenuInit(&gMultiuseListMenuTemplate, playerPcStruct->scrollOffset, playerPcStruct->selectedRow);
}

void sub_810ED6C(s32 itemIndex, bool8 onInit, struct ListMenu * list)
{
    if (onInit != TRUE)
        PlaySE(SE_SELECT);
}

void sub_810ED80(struct PlayerPC_Unk_203AAC4 * playerPcStruct)
{
    playerPcStruct->unk_A = AddScrollIndicatorArrowPairParameterized(2, 0xC2, 0xC, 0x94, playerPcStruct->unk_5 - playerPcStruct->unk_4 + 1, 110, 110, &playerPcStruct->scrollOffset);
}

void sub_810EDB0(void)
{
    Free(gUnknown_203ADE0);
}
