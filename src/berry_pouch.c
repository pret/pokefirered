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
#include "constants/items.h"

struct BerryPouchStruct_203F36C
{
    u32 unk_000;
    u8 filler_004[2];
    u8 unk_006;
    u8 filler_007[2];
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

void sub_813CE30(void);
bool8 sub_813CE5C(void);
void sub_813D00C(void);
void sub_813D048(u8 taskId);
void sub_813D07C(void);
bool8 sub_813D0E4(void);
bool8 sub_813D1C0(void);
void sub_813D204(void);
void sub_813D5BC(void);
void sub_813D6A4(void);
void sub_813D6F4(void);
void sub_813D754(void);
void sub_813D7CC(void);
void sub_813D8AC(void);
void sub_813DA68(u8 taskId);
void sub_813E910(void);
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
        gUnknown_203F36C->unk_000 = 0;
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
