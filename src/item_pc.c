#include "global.h"
#include "bg.h"
#include "decompress.h"
#include "gpu_regs.h"
#include "graphics.h"
#include "help_system.h"
#include "item.h"
#include "item_menu_icons.h"
#include "list_menu.h"
#include "main.h"
#include "malloc.h"
#include "menu.h"
#include "menu_helpers.h"
#include "palette.h"
#include "pc_screen_effect.h"
#include "scanline_effect.h"
#include "sound.h"
#include "strings.h"
#include "task.h"
#include "constants/songs.h"

struct ItemPcResources
{
    u32 field_00;
    u8 field_04;
    u8 field_05;
    u8 field_06;
    u8 field_07;
    u8 field_08;
    u8 filler_09[3];
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
void sub_810E8F0(void);
void sub_810DB34(void);
void sub_810DB5C(void);
void sub_810DBF0(void);
void sub_810DC40(void);
void sub_810DDA4(void);
void sub_810DE08(void);
void sub_810DE94(u8);
void sub_810DEA0(u8 taskId);

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
    sub_810D83C_sub(gUnknown_203ADC4, 0x0F8);
    sub_810D83C_sub(gUnknown_203ADC8, 0x1B2);
    return TRUE;
}

void sub_810D878(void)
{
    u16 i;

    for (i = 0; i < gUnknown_203ADBC->field_07; i++)
    {
        gUnknown_203ADC4[i].label = ItemId_GetItem(gSaveBlock1Ptr->pcItems[i].itemId)->name;
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
