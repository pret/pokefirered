#include "global.h"
#include "palette.h"
#include "dma3.h"
#include "gpu_regs.h"
#include "bg.h"
#include "task.h"
#include "scanline_effect.h"
#include "malloc.h"
#include "text.h"
#include "window.h"
#include "text_window.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "sound.h"
#include "mystery_gift_menu.h"
#include "title_screen.h"
#include "list_menu.h"
#include "link_rfu.h"
#include "string_util.h"
#include "constants/songs.h"

extern const struct WindowTemplate sWindowTemplate_ThreeOptions;
extern const struct ListMenuItem sListMenuItems_CardsOrNews[];
extern const struct ListMenuItem sListMenuItems_WirelessOrFriend[];
extern const struct ListMenuTemplate sListMenuTemplate_ThreeOptions;
extern const struct TextColor sMG_Ereader_TextColor_1;
extern const struct TextColor sMG_Ereader_TextColor_2;

EWRAM_DATA u8 sDownArrowCounterAndYCoordIdx[8] = {};
EWRAM_DATA bool8 gGiftIsFromEReader = FALSE;

void task_add_00_mystery_gift(void);
void task_add_00_ereader(void);

static const u16 gUnkTextboxBorderPal[] = INCBIN_U16("graphics/interface/unk_textbox_border.gbapal");
static const u32 gUnkTextboxBorderGfx[] = INCBIN_U32("graphics/interface/unk_textbox_border.4bpp.lz");

struct MysteryGiftTaskData
{
    u16 curPromptWindowId;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u8 state;
    u8 textState;
    u8 unkA;
    u8 unkB;
    u8 IsCardOrNews;
    u8 source;
    u8 prevPromptWindowId;
    u8 * buffer;
};

static const struct BgTemplate sBGTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 2,
        .mapBaseIndex = 15,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 0,
        .mapBaseIndex = 14,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x000
    }, {
        .bg = 2,
        .charBaseIndex = 0,
        .mapBaseIndex = 13,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x000
    }, {
        .bg = 3,
        .charBaseIndex = 0,
        .mapBaseIndex = 12,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }
};

static const struct WindowTemplate sMainWindows[] = {
    {
        .priority = 0x00,
        .tilemapLeft = 0x00,
        .tilemapTop = 0x00,
        .width = 0x1e,
        .height = 0x02,
        .paletteNum = 0x0f,
        .baseBlock = 0x0013
    }, {
        .priority = 0x00,
        .tilemapLeft = 0x01,
        .tilemapTop = 0x0f,
        .width = 0x1c,
        .height = 0x04,
        .paletteNum = 0x0f,
        .baseBlock = 0x004f
    }, {
        .priority = 0x00,
        .tilemapLeft = 0x00,
        .tilemapTop = 0x0f,
        .width = 0x1e,
        .height = 0x05,
        .paletteNum = 0x0d,
        .baseBlock = 0x004f
    }, {
        0xFF
    }
};

void vblankcb_mystery_gift_e_reader_run(void)
{
    ProcessSpriteCopyRequests();
    LoadOam();
    TransferPlttBuffer();
}

void c2_mystery_gift_e_reader_run(void)
{
    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
}

bool32 HandleMysteryGiftOrEReaderSetup(s32 mg_or_ereader)
{
    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        ResetPaletteFade();
        ResetSpriteData();
        FreeAllSpritePalettes();
        ResetTasks();
        ScanlineEffect_Stop();
        ResetBgsAndClearDma3BusyFlags(1);

        InitBgsFromTemplates(0, sBGTemplates, ARRAY_COUNT(sBGTemplates));
        ChangeBgX(0, 0, 0);
        ChangeBgY(0, 0, 0);
        ChangeBgX(1, 0, 0);
        ChangeBgY(1, 0, 0);
        ChangeBgX(2, 0, 0);
        ChangeBgY(2, 0, 0);
        ChangeBgX(3, 0, 0);
        ChangeBgY(3, 0, 0);

        SetBgTilemapBuffer(3, Alloc(0x800));
        SetBgTilemapBuffer(2, Alloc(0x800));
        SetBgTilemapBuffer(1, Alloc(0x800));
        SetBgTilemapBuffer(0, Alloc(0x800));

        sub_814FE40(0, 10, 0xE0);
        sub_814FDA0(0,  1, 0xF0);
        sub_80F696C(3, gUnkTextboxBorderGfx, 0x100, 0, 0);
        InitWindows(sMainWindows);
        DeactivateAllTextPrinters();
        ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        gMain.state++;
        break;
    case 1:
        LoadPalette(gUnkTextboxBorderPal, 0, 0x20);
        LoadPalette(stdpal_get(2), 0xd0, 0x20);
        FillBgTilemapBufferRect(0, 0x000, 0, 0, 32, 32, 0x11);
        FillBgTilemapBufferRect(1, 0x000, 0, 0, 32, 32, 0x11);
        FillBgTilemapBufferRect(2, 0x000, 0, 0, 32, 32, 0x11);
        MG_DrawCheckerboardPattern();
        PrintMysteryGiftOrEReaderTopMenu(mg_or_ereader, 0);
        gMain.state++;
        break;
    case 2:
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        gMain.state++;
        break;
    case 3:
        ShowBg(0);
        ShowBg(3);
        PlayBGM(BGM_FRLG_MYSTERY_GIFT);
        SetVBlankCallback(vblankcb_mystery_gift_e_reader_run);
        EnableInterrupts(INTR_FLAG_VBLANK | INTR_FLAG_VCOUNT | INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL);
        return TRUE;
    }

    return FALSE;
}

void c2_mystery_gift(void)
{
    if (HandleMysteryGiftOrEReaderSetup(0))
    {
        SetMainCallback2(c2_mystery_gift_e_reader_run);
        gGiftIsFromEReader = FALSE;
        task_add_00_mystery_gift();
    }
}

void c2_ereader(void)
{
    if (HandleMysteryGiftOrEReaderSetup(1))
    {
        SetMainCallback2(c2_mystery_gift_e_reader_run);
        gGiftIsFromEReader = TRUE;
        task_add_00_ereader();
    }
}

void MainCB_FreeAllBuffersAndReturnToInitTitleScreen(void)
{
    gGiftIsFromEReader = FALSE;
    FreeAllWindowBuffers();
    Free(GetBgTilemapBuffer(0));
    Free(GetBgTilemapBuffer(1));
    Free(GetBgTilemapBuffer(2));
    Free(GetBgTilemapBuffer(3));
    SetMainCallback2(CB2_InitTitleScreen);
}

extern const u8 gUnknown_8415F51[];
extern const u8 gUnknown_841EDCA[];
extern const u8 gUnknown_841EDBD[];
extern const u8 gUnknown_841DE50[];
extern const u8 gUnknown_841DE51[];

void PrintMysteryGiftOrEReaderTopMenu(bool8 mg_or_ereader, bool32 usePickOkCancel)
{
    const u8 * src;
    s32 width;
    FillWindowPixelBuffer(0, 0x00);
    if (!mg_or_ereader)
    {
        src = usePickOkCancel == TRUE ? gUnknown_8415F51 : gUnknown_841EDCA;
        AddTextPrinterParametrized2(0, 2, 2, 2, 0, 0, &sMG_Ereader_TextColor_1, 0, gUnknown_841EDBD);
        width = 222 - GetStringWidth(0, src, 0);
        AddTextPrinterParametrized2(0, 0, width, 2, 0, 0, &sMG_Ereader_TextColor_1, 0, src);
    }
    else
    {
        AddTextPrinterParametrized2(0, 2, 2, 2, 0, 0, &sMG_Ereader_TextColor_1, 0, gUnknown_841DE50);
        AddTextPrinterParametrized2(0, 0, 0x78, 2, 0, 0, &sMG_Ereader_TextColor_1, 0, gUnknown_841DE51);
    }
    CopyWindowToVram(0, 2);
    PutWindowTilemap(0);
}

void MG_DrawTextBorder(u8 windowId)
{
    DrawTextBorderOuter(windowId, 0x01, 0xF);
}

void MG_DrawCheckerboardPattern(void)
{
    s32 i = 0, j;

    FillBgTilemapBufferRect(3, 0x003, 0, 0, 32, 2, 0x11);

    for (i = 0; i < 18; i++)
    {
        for (j = 0; j < 32; j++)
        {
            if ((i & 1) != (j & 1))
            {
                FillBgTilemapBufferRect(3, 1, j, i + 2, 1, 1, 0x11);
            }
            else
            {
                FillBgTilemapBufferRect(3, 2, j, i + 2, 1, 1, 0x11);
            }
        }
    }
}

void ClearScreenInBg0(bool32 ignoreTopTwoRows)
{
    switch (ignoreTopTwoRows)
    {
    case 0:
        FillBgTilemapBufferRect(0, 0, 0, 0, 32, 32, 0x11);
        break;
    case 1:
        FillBgTilemapBufferRect(0, 0, 0, 2, 32, 30, 0x11);
        break;
    }
    CopyBgTilemapBufferToVram(0);
}

void AddTextPrinterToWindow1(const u8 *str)
{
    StringExpandPlaceholders(gStringVar4, str);
    FillWindowPixelBuffer(1, 0x11);
    AddTextPrinterParametrized2(1, 2, 0, 2, 0, 2, &sMG_Ereader_TextColor_2, 0, gStringVar4);
    DrawTextBorderOuter(1, 0x001, 0xF);
    PutWindowTilemap(1);
    CopyWindowToVram(1, 3);
}

void ClearTextWindow(void)
{
    rbox_fill_rectangle(1);
    ClearWindowTilemap(1);
    CopyWindowToVram(1, 1);
}

bool32 MG_PrintTextOnWindow1AndWaitButton(u8 *textState, const u8 *str)
{
    switch (*textState)
    {
    case 0:
        AddTextPrinterToWindow1(str);
        goto inc;
    case 1:
        DrawDownArrow(1, 0xD0, 0x14, 1, FALSE, &sDownArrowCounterAndYCoordIdx[0], &sDownArrowCounterAndYCoordIdx[1]);
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            inc:
            (*textState)++;
        }
        break;
    case 2:
        DrawDownArrow(1, 0xD0, 0x14, 1, TRUE, &sDownArrowCounterAndYCoordIdx[0], &sDownArrowCounterAndYCoordIdx[1]);
        *textState = 0;
        ClearTextWindow();
        return TRUE;
    case 0xFF:
        *textState = 2;
        break;
    }
    return FALSE;
}

void HideDownArrow(void)
{
    DrawDownArrow(1, 0xD0, 0x14, 1, FALSE, &sDownArrowCounterAndYCoordIdx[0], &sDownArrowCounterAndYCoordIdx[1]);
}

void ShowDownArrow(void)
{
    DrawDownArrow(1, 0xD0, 0x14, 1, TRUE, &sDownArrowCounterAndYCoordIdx[0], &sDownArrowCounterAndYCoordIdx[1]);
}

bool32 unref_HideDownArrowAndWaitButton(u8 * textState)
{
    switch (*textState)
    {
    case 0:
        HideDownArrow();
        if (JOY_NEW(A_BUTTON | B_BUTTON))
        {
            (*textState)++;
        }
        break;
    case 1:
        ShowDownArrow();
        *textState = 0;
        return TRUE;
    }
    return FALSE;
}

bool32 PrintStringAndWait2Seconds(u8 * counter, const u8 * str)
{
    if (*counter == 0)
    {
        AddTextPrinterToWindow1(str);
    }
    if (++(*counter) > 120)
    {
        *counter = 0;
        ClearTextWindow();
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

u32 MysteryGift_HandleThreeOptionMenu(u8 * unused0, u16 * unused1, u8 whichMenu)
{
    struct ListMenuTemplate listMenuTemplate = sListMenuTemplate_ThreeOptions;
    struct WindowTemplate windowTemplate = sWindowTemplate_ThreeOptions;
    u32 width;
    s32 finalWidth;
    s32 response;
    u32 i;

    if (whichMenu == 0)
    {
        listMenuTemplate.items = sListMenuItems_CardsOrNews;
    }
    else
    {
        listMenuTemplate.items = sListMenuItems_WirelessOrFriend;
    }
    width = 0;
    for (i = 0; i < listMenuTemplate.totalItems; i++)
    {
        u32 curWidth = GetStringWidth(2, listMenuTemplate.items[i].unk_00, listMenuTemplate.lettersSpacing);
        if (curWidth > width)
            width = curWidth;
    }
    finalWidth = (((width + 9) / 8) + 2) & ~1;
    windowTemplate.width = finalWidth;
    windowTemplate.tilemapLeft = (30 - finalWidth) / 2;
    response = DoMysteryGiftListMenu(&windowTemplate, &listMenuTemplate, 1, 0x00A, 0xE0);
    if (response != -1)
    {
        ClearWindowTilemap(2);
        CopyWindowToVram(2, 1);
    }
    return response;
}



