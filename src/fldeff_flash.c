#include "global.h"
#include "gflib.h"
#include "event_data.h"
#include "event_scripts.h"
#include "fldeff.h"
#include "field_effect.h"
#include "map_preview_screen.h"
#include "overworld.h"
#include "party_menu.h"
#include "script.h"
#include "constants/songs.h"

struct FlashStruct
{
    u8 fromType;
    u8 toType;
    bool8 isEnter;
    bool8 isExit;
    void (*func1)(void);
    void (*func2)(u8 mapSecId);
};

static void sub_80C9B74(void);
static void sub_80C9BB0(void);
static bool8 sub_80C9CE8(void);
static void sub_80C9E1C(void);
static void sub_80C9E30(u8 taskId);
static void sub_80C9E4C(u8 taskId);
static void sub_80C9EF0(u8 taskId);
static void sub_80C9F38(u8 taskId);
static void sub_80C9FA0(u8 taskId);
static void sub_80C9FD4(void);
static void sub_80C9FE8(u8 taskId);
static void sub_80CA004(u8 taskId);
static void sub_80CA0A4(u8 taskId);
static void sub_80CA108(u8 taskId);
static void sub_80CA160(u8 mapsecId);
static void sub_80CA190(u8 taskId);

static const struct FlashStruct gUnknown_83F5738[] = {
    {
        .fromType = 1,
        .toType = 4,
        .isEnter = TRUE,
        .isExit = FALSE,
        .func1 = sub_80C9FD4,
        .func2 = sub_80CA160
    }, {
        .fromType = 2,
        .toType = 4,
        .isEnter = TRUE,
        .isExit = FALSE,
        .func1 = sub_80C9FD4,
        .func2 = sub_80CA160
    }, {
        .fromType = 3,
        .toType = 4,
        .isEnter = TRUE,
        .isExit = FALSE,
        .func1 = sub_80C9FD4,
        .func2 = sub_80CA160
    }, {
        .fromType = 5,
        .toType = 4,
        .isEnter = TRUE,
        .isExit = FALSE,
        .func1 = sub_80C9FD4,
        .func2 = sub_80CA160
    }, {
        .fromType = 6,
        .toType = 4,
        .isEnter = TRUE,
        .isExit = FALSE,
        .func1 = sub_80C9FD4,
        .func2 = sub_80CA160
    }, {
        .fromType = 7,
        .toType = 4,
        .isEnter = TRUE,
        .isExit = FALSE,
        .func1 = sub_80C9FD4,
        .func2 = sub_80CA160
    }, {
        .fromType = 8,
        .toType = 4,
        .isEnter = TRUE,
        .isExit = FALSE,
        .func1 = sub_80C9FD4,
        .func2 = sub_80CA160
    }, {
        .fromType = 9,
        .toType = 4,
        .isEnter = TRUE,
        .isExit = FALSE,
        .func1 = sub_80C9FD4,
        .func2 = sub_80CA160
    }, {
        .fromType = 4,
        .toType = 1,
        .isEnter = FALSE,
        .isExit = TRUE,
        .func1 = sub_80C9E1C,
        .func2 = sub_80CA160
    }, {
        .fromType = 4,
        .toType = 2,
        .isEnter = FALSE,
        .isExit = TRUE,
        .func1 = sub_80C9E1C,
        .func2 = sub_80CA160
    }, {
        .fromType = 4,
        .toType = 3,
        .isEnter = FALSE,
        .isExit = TRUE,
        .func1 = sub_80C9E1C,
        .func2 = sub_80CA160
    }, {
        .fromType = 4,
        .toType = 5,
        .isEnter = FALSE,
        .isExit = TRUE,
        .func1 = sub_80C9E1C,
        .func2 = sub_80CA160
    }, {
        .fromType = 4,
        .toType = 6,
        .isEnter = FALSE,
        .isExit = TRUE,
        .func1 = sub_80C9E1C,
        .func2 = sub_80CA160
    }, {
        .fromType = 4,
        .toType = 7,
        .isEnter = FALSE,
        .isExit = TRUE,
        .func1 = sub_80C9E1C,
        .func2 = sub_80CA160
    }, {
        .fromType = 4,
        .toType = 8,
        .isEnter = FALSE,
        .isExit = TRUE,
        .func1 = sub_80C9E1C,
        .func2 = sub_80CA160
    }, {
        .fromType = 4,
        .toType = 9,
        .isEnter = FALSE,
        .isExit = TRUE,
        .func1 = sub_80C9E1C,
        .func2 = sub_80CA160
    }, {0}
};

static const u16 gUnknown_83F5804[] = INCBIN_U16("graphics/field_effects/flash_white.gbapal");
static const u16 gUnknown_83F5824[] = INCBIN_U16("graphics/field_effects/flash_black.gbapal");
static const u16 gUnknown_83F5844[] = INCBIN_U16("graphics/field_effects/flash_gradient.gbapal");
static const u32 gUnknown_83F5864[] = INCBIN_U32("graphics/field_effects/flash_effect_map.bin.lz");
static const u32 gUnknown_83F5A44[] = INCBIN_U32("graphics/field_effects/flash_effect_tiles.4bpp.lz");

bool8 SetUpFieldMove_Flash(void)
{
    if (gMapHeader.cave != TRUE)
        return FALSE;

    if (FlagGet(FLAG_SYS_FLASH_ACTIVE))
        return FALSE;

    gFieldCallback2 = FieldCallback_PrepareFadeInFromMenu;
    gPostMenuFieldCallback = sub_80C9B74;
    return TRUE;
}

static void sub_80C9B74(void)
{
    u8 taskId = CreateFieldEffectShowMon();
    gFieldEffectArguments[0] = GetCursorSelectionMonId();
    gTasks[taskId].data[8] = ((uintptr_t)sub_80C9BB0) >> 16;
    gTasks[taskId].data[9] = ((uintptr_t)sub_80C9BB0);
}

static void sub_80C9BB0(void)
{
    PlaySE(SE_W115);
    FlagSet(FLAG_SYS_FLASH_ACTIVE);
    ScriptContext1_SetupScript(EventScript_FldEffFlash);
}

static void sub_80C9BD0(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_80C9BE8(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_80C9BFC(void)
{
    SetVBlankCallback(NULL);

    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    SetGpuReg(REG_OFFSET_BG2CNT, 0);
    SetGpuReg(REG_OFFSET_BG1CNT, 0);
    SetGpuReg(REG_OFFSET_BG0CNT, 0);
    SetGpuReg(REG_OFFSET_BG2HOFS, 0);
    SetGpuReg(REG_OFFSET_BG2VOFS, 0);
    SetGpuReg(REG_OFFSET_BG1HOFS, 0);
    SetGpuReg(REG_OFFSET_BG1VOFS, 0);
    SetGpuReg(REG_OFFSET_BG0HOFS, 0);
    SetGpuReg(REG_OFFSET_BG0VOFS, 0);

    DmaFill16(3, 0, (void *)VRAM, VRAM_SIZE);
    DmaFill32(3, 0, (void *)OAM, OAM_SIZE);
    DmaFill16(3, 0, (void *)(PLTT + 2), PLTT_SIZE - 2);
    ResetPaletteFade();
    ResetTasks();
    ResetSpriteData();
    EnableInterrupts(INTR_FLAG_VBLANK);
    SetVBlankCallback(sub_80C9BE8);
    SetMainCallback2(sub_80C9BD0);
    if (!sub_80C9CE8())
        SetMainCallback2(gMain.savedCallback);
}

static bool8 sub_80C9CE8(void)
{
    u8 fromType = get_map_light_from_warp0();
    u8 toType = GetCurrentMapType();
    u8 i = 0;
    if (sub_80561B4() != gMapHeader.regionMapSectionId && sub_80F8154(gMapHeader.regionMapSectionId, FALSE) == TRUE)
    {
        sub_80CA160(gMapHeader.regionMapSectionId);
        return TRUE;
    }
    for (; gUnknown_83F5738[i].fromType != 0; i++)
    {
        if (gUnknown_83F5738[i].fromType == fromType && gUnknown_83F5738[i].toType == toType)
        {
            gUnknown_83F5738[i].func1();
            return TRUE;
        }
    }
    return FALSE;
}

bool8 sub_80C9D7C(u8 _fromType, u8 _toType)
{
    u8 fromType = _fromType;
    u8 toType = _toType;
    u8 i = 0;
    for (; gUnknown_83F5738[i].fromType != 0; i++)
    {
        if (gUnknown_83F5738[i].fromType == fromType && gUnknown_83F5738[i].toType == toType)
        {
            return gUnknown_83F5738[i].isEnter;
        }
    }
    return FALSE;
}

bool8 sub_80C9DCC(u8 _fromType, u8 _toType)
{
    u8 fromType = _fromType;
    u8 toType = _toType;
    u8 i = 0;
    for (; gUnknown_83F5738[i].fromType != 0; i++)
    {
        if (gUnknown_83F5738[i].fromType == fromType && gUnknown_83F5738[i].toType == toType)
        {
            return gUnknown_83F5738[i].isExit;
        }
    }
    return FALSE;
}

static void sub_80C9E1C(void)
{
    CreateTask(sub_80C9E30, 0);
}

static void sub_80C9E30(u8 taskId)
{
    gTasks[taskId].func = sub_80C9E4C;
}

static void sub_80C9E4C(u8 taskId)
{
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    LZ77UnCompVram(gUnknown_83F5A44, (void *)BG_CHAR_ADDR(3));
    LZ77UnCompVram(gUnknown_83F5864, (void *)BG_SCREEN_ADDR(31));
    LoadPalette(gUnknown_83F5804, 0xE0, 0x20);
    LoadPalette(gUnknown_83F5844 + 8, 0xE0, 0x10);
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
    SetGpuReg(REG_OFFSET_BG0CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(3) | BGCNT_SCREENBASE(31));
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_OBJ_ON);
    gTasks[taskId].func = sub_80C9EF0;
    gTasks[taskId].data[0] = 16;
    gTasks[taskId].data[1] = 0;
}

static void sub_80C9EF0(u8 taskId)
{
    u16 r4 = gTasks[taskId].data[1];
    SetGpuReg(REG_OFFSET_BLDALPHA, (16 << 8) + r4);
    if (r4 <= 16)
    {
        gTasks[taskId].data[1]++;
    }
    else
    {
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].func = sub_80C9F38;
    }
}

static void sub_80C9F38(u8 taskId)
{
    u16 r4;
    SetGpuReg(REG_OFFSET_BLDALPHA, (16 << 8) + 16);
    r4 = gTasks[taskId].data[2];
    if (r4 < 8)
    {
        gTasks[taskId].data[2]++;
        LoadPalette(gUnknown_83F5844 + 8 + r4, 0xE0, 0x10 - 2 * r4);
    }
    else
    {
        LoadPalette(gUnknown_83F5804, 0x00, 0x20);
        gTasks[taskId].func = sub_80C9FA0;
        gTasks[taskId].data[2] = 8;
    }
}

static void sub_80C9FA0(u8 taskId)
{
    if (gTasks[taskId].data[2] != 0)
        gTasks[taskId].data[2]--;
    else
        SetMainCallback2(gMain.savedCallback);
}

static void sub_80C9FD4(void)
{
    CreateTask(sub_80C9FE8, 0);
}

static void sub_80C9FE8(u8 taskId)
{
    gTasks[taskId].func = sub_80CA004;
}

static void sub_80CA004(u8 taskId)
{
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    LZ77UnCompVram(gUnknown_83F5A44, (void *)BG_CHAR_ADDR(3));
    LZ77UnCompVram(gUnknown_83F5864, (void *)BG_SCREEN_ADDR(31));
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
    SetGpuReg(REG_OFFSET_BG0CNT, BGCNT_PRIORITY(0) | BGCNT_CHARBASE(3) | BGCNT_SCREENBASE(31));
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_OBJ_ON);
    LoadPalette(gUnknown_83F5804, 0xE0, 0x20);
    LoadPalette(gUnknown_83F5824, 0, 0x20);
    gTasks[taskId].func = sub_80CA0A4;
    gTasks[taskId].data[0] = 16;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].data[2] = 0;
}

static void sub_80CA0A4(u8 taskId)
{
    u16 r4;
    r4 = gTasks[taskId].data[2];
    if (r4 < 16)
    {
        gTasks[taskId].data[2]++;
        gTasks[taskId].data[2]++;
        LoadPalette(&gUnknown_83F5844[16 - (r4 + 1)], 0xE0, 2 * (r4 + 1));
    }
    else
    {
        SetGpuReg(REG_OFFSET_BLDALPHA, (16 << 8) + 16);
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD);
        gTasks[taskId].func = sub_80CA108;
    }
}

static void sub_80CA108(u8 taskId)
{
    u16 r4 = 16 - gTasks[taskId].data[1];
    SetGpuReg(REG_OFFSET_BLDALPHA, (16 << 8) + r4);
    if (r4 != 0)
    {
        gTasks[taskId].data[1]++;
    }
    else
    {
        LoadPalette(gUnknown_83F5824, 0x00, 0x20);
        SetMainCallback2(gMain.savedCallback);
    }
}

static void sub_80CA160(u8 mapSecId)
{
    u8 taskId = CreateTask(sub_80CA190, 0);
    gTasks[taskId].data[3] = mapSecId;
}

static void sub_80CA190(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    switch (data[0])
    {
    case 0:
        SetWordTaskArg(taskId, 5, (uintptr_t)gMain.vblankCallback);
        SetVBlankCallback(NULL);
        sub_80F8180();
        sub_80F819C(data[3]);
        BlendPalettes(0xFFFFFFFF, 0x10, RGB_BLACK);
        data[0]++;
        break;
    case 1:
        if (!sub_80F8258())
        {
            data[4] = sub_80F8318(data[3]);
            CopyWindowToVram(data[4], 3);
            data[0]++;
        }
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
            SetVBlankCallback((IntrCallback)GetWordTaskArg(taskId, 5));
            data[0]++;
        }
        break;
    case 3:
        if (!UpdatePaletteFade())
        {
            data[2] = sub_80F856C(data[3]);
            data[0]++;
        }
        break;
    case 4:
        data[1]++;
        if (data[1] > data[2] || JOY_HELD(B_BUTTON))
        {
            BeginNormalPaletteFade(0xFFFFFFFF, -2, 0, 16, RGB_WHITE);
            data[0]++;
        }
        break;
    case 5:
        if (!UpdatePaletteFade())
        {
            int i;
            for (i = 0; i < 16; i++)
            {
                data[i] = 0;
            }
            sub_80F8234(data[4]);
            gTasks[taskId].func = sub_80CA004;
        }
        break;
    }
}
