#include "global.h"
#include "malloc.h"
#include "palette.h"
#include "gpu_regs.h"
#include "bg.h"
#include "task.h"
#include "main.h"
#include "new_menu_helpers.h"
#include "m4a.h"
#include "scanline_effect.h"
#include "graphics.h"
#include "help_system.h"
#include "intro.h"
#include "load_save.h"
#include "sound.h"
#include "new_game.h"
#include "save.h"
#include "main_menu.h"
#include "constants/songs.h"
#include "constants/species.h"

enum TitleScreenScene
{
    TITLESCREENSCENE_INIT = 0,
    TITLESCREENSCENE_FLASHSPRITE,
    TITLESCREENSCENE_FADEIN,
    TITLESCREENSCENE_RUN,
    TITLESCREENSCEEN_RESTART,
    TITLESCREENSCENE_CRY
};

#if   defined(FIRERED)
#define TITLE_SPECIES SPECIES_CHARIZARD
#elif defined(LEAFGREEN)
#define TITLE_SPECIES SPECIES_VENUSAUR
#endif

EWRAM_DATA u8 gUnknown_2037F30 = 0;

void sub_8078B34(void);
void sub_8078B9C(void);
void sub_8078BB4(void);
void sub_8078BEC(u8 taskId);
void sub_8078C24(u8 taskId);
void sub_8078C90(s16 * data, u8 a1);
void sub_8078C9C(s16 * data);
void sub_8078D24(s16 * data);
void sub_8078DA4(s16 * data);
void sub_8078FC4(s16 * data);
void sub_80790A0(void);
void sub_80790CC(s16 * data);
void sub_80791C0(s16 * data);
void sub_80792C8(u8 taskId);
void sub_807941C(u8 taskId);
void sub_8079528(void);
void sub_8079550(s16 a0);
void sub_8079620(void);
void sub_8079648(void);
void sub_80796CC(void);
void sub_80796E8(void);
void sub_8079708(void);
void sub_8079840(u8 taskId);
u32 sub_80799F0(void);
void sub_8079A10(s16 a0);
u8 sub_8079A40(void);
void sub_8079A88(u8 spriteId);
bool32 sub_8079AA8(u8 spriteId);

// bg3
const u8 gUnknown_83BF58C[] = INCBIN_U8("data/graphics/title_screen/unk_83BF58C.4bpp.lz");
const u8 gUnknown_83BF5A8[] = INCBIN_U8("data/graphics/title_screen/unk_83BF5A8.bin.lz");

//sprites
const u8 gUnknown_83BF64C[] = INCBIN_U8("data/graphics/title_screen/unk_83bf64c.4bpp.lz");
const u16 gUnknown_83BF77C[] = INCBIN_U16("data/graphics/title_screen/unk_83bf77c.gbapal");
const u8 gUnknown_83BF79C[] = INCBIN_U8("data/graphics/title_screen/unk_83bf79c.4bpp.lz");
const u8 gUnknown_83BFA14[] = INCBIN_U8("data/graphics/title_screen/unk_83bfa14.4bpp.lz");

const struct OamData gOamData_83BFAB4 = {
    .objMode = ST_OAM_OBJ_NORMAL,
    .shape = ST_OAM_SQUARE,
    .size = ST_OAM_SIZE_1,
    .tileNum = 0,
    .priority = 3,
    .paletteNum = 0
};

const union AnimCmd gSpriteAnims_83BFABC[] = {
    ANIMCMD_FRAME(0x00, 3),
    ANIMCMD_FRAME(0x04, 6),
    ANIMCMD_FRAME(0x08, 6),
    ANIMCMD_FRAME(0x0c, 6),
    ANIMCMD_FRAME(0x10, 6),
    ANIMCMD_FRAME(0x14, 6),
    ANIMCMD_FRAME(0x18, 6),
    ANIMCMD_FRAME(0x1c, 6),
    ANIMCMD_FRAME(0x20, 6),
    ANIMCMD_FRAME(0x24, 6),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnims_83BFAE8[] = {
    ANIMCMD_FRAME(0x18, 6),
    ANIMCMD_FRAME(0x1c, 6),
    ANIMCMD_FRAME(0x20, 6),
    ANIMCMD_FRAME(0x24, 6),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83BFAFC[] = {
    gSpriteAnims_83BFABC,
    gSpriteAnims_83BFAE8
};

const struct SpriteTemplate gUnknown_83BFB04 = {
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gOamData_83BFAB4,
    .anims = gSpriteAnimTable_83BFAFC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct SpriteTemplate gUnknown_83BFB1C = {
    .tileTag = 1,
    .paletteTag = 0,
    .oam = &gOamData_83BFAB4,
    .anims = gSpriteAnimTable_83BFAFC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct OamData gOamData_83BFB34 = {
    .objMode = ST_OAM_OBJ_NORMAL,
    .shape = ST_OAM_V_RECTANGLE,
    .size = ST_OAM_SIZE_3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0
};

const struct SpriteTemplate gUnknown_83BFB3C = {
    .tileTag = 2,
    .paletteTag = 2,
    .oam = &gOamData_83BFB34,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct OamData gOamData_83BFB54 = {
    .objMode = ST_OAM_OBJ_WINDOW,
    .shape = ST_OAM_SQUARE,
    .size = ST_OAM_SIZE_3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0
};

const struct SpriteTemplate gUnknown_83BFB5C = {
    .tileTag = 3,
    .paletteTag = 2,
    .oam = &gOamData_83BFB54,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct BgTemplate gUnknown_83BFB74[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 1, // 8bpp
        .priority = 0,
        .baseTile = 0
    }, {
        .bg = 1,
        .charBaseIndex = 1,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0, // 4bpp
        .priority = 1,
        .baseTile = 0
    }, {
        .bg = 2,
        .charBaseIndex = 2,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0, // 4bpp
        .priority = 2,
        .baseTile = 0
    }, {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 28,
        .screenSize = 0,
        .paletteMode = 0, // 4bpp
        .priority = 3,
        .baseTile = 0
    }
};

void (*const gUnknown_83BFB84[])(s16 * data) = {
    sub_8078C9C,
    sub_8078D24,
    sub_8078DA4,
    sub_8078FC4,
    sub_80790CC,
    sub_80791C0
};

const struct CompressedSpriteSheet gUnknown_83BFB9C[] = {
    {(const void *)gUnknown_83BF79C, 0x500, 0},
    {(const void *)gUnknown_83BFA14, 0x500, 1},
    {(const void *)gUnknown_8EAE4A8, 0x400, 2},
    {(const void *)gUnknown_83BF64C, 0x800, 3}
};

const struct SpritePalette gUnknown_83BFBBC[] = {
    {gUnknown_83BF77C, 0},
    {gUnknown_8EAE488, 2},
    {}
};

const u8 gUnknown_83BFBD4[] = {
    0x04, 0x10, 0x1a, 0x20, 0x30, 0xc8, 0xd8, 0xe0, 0xe8, 0x3c, 0x4c, 0x5c, 0x6c, 0x80, 0x90
};

void CB2_InitTitleScreen(void)
{
    switch (gMain.state)
    {
    default:
        gMain.state = 0;
        // fallthrough
    case 0:
        SetVBlankCallback(NULL);
        StartTimer1();
        InitHeap(gHeap, HEAP_SIZE);
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();
        ResetPaletteFade();
        sub_8078B34();
        DmaFill16(3, 0, (void *)VRAM, VRAM_SIZE);
        DmaFill32(3, 0, (void *)OAM, OAM_SIZE);
        DmaFill16(3, 0, (void *)PLTT, PLTT_SIZE);
        ResetBgsAndClearDma3BusyFlags(FALSE);
        InitBgsFromTemplates(0, gUnknown_83BFB74, NELEMS(gUnknown_83BFB74));
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
        gUnknown_2037F30 = 0xFF;
        break;
    case 1:
        LoadPalette(gUnknown_8EAB6C4, 0, 0x1A0);
        DecompressAndCopyTileDataToVram(0, gUnknown_8EAB8C4, 0, 0, 0);
        DecompressAndCopyTileDataToVram(0, gUnknown_8EAD390, 0, 0, 1);
        LoadPalette(gUnknown_8EAD5E8, 0xD0, 0x20);
        DecompressAndCopyTileDataToVram(1, gUnknown_8EAD608, 0, 0, 0);
        DecompressAndCopyTileDataToVram(1, gUnknown_8EADEE4, 0, 0, 1);
        LoadPalette(gUnknown_8EAE094, 0xF0, 0x20);
        DecompressAndCopyTileDataToVram(2, gUnknown_8EAE0B4, 0, 0, 0);
        DecompressAndCopyTileDataToVram(2, gUnknown_8EAE374, 0, 0, 1);
        LoadPalette(gUnknown_8EAE094, 0xE0, 0x20);
        DecompressAndCopyTileDataToVram(3, gUnknown_83BF58C, 0, 0, 0);
        DecompressAndCopyTileDataToVram(3, gUnknown_83BF5A8, 0, 0, 1);
        sub_8079708();
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            BlendPalettes(0x0000FFFF, 0x10, RGB_BLACK);
            CreateTask(sub_8078C24, 4);
            gUnknown_2037F30 = CreateTask(sub_8078BEC, 2);
            SetVBlankCallback(sub_8078BB4);
            SetMainCallback2(sub_8078B9C);
            m4aSongNumStart(BGM_FRLG_TITLE);
        }
        return;
    }
    gMain.state++;
}

void sub_8078B34(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT,  0);
    SetGpuReg(REG_OFFSET_BLDCNT,   0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY,     0);
    SetGpuReg(REG_OFFSET_BG0HOFS,  0);
    SetGpuReg(REG_OFFSET_BG0VOFS,  0);
    SetGpuReg(REG_OFFSET_BG1HOFS,  0);
    SetGpuReg(REG_OFFSET_BG1VOFS,  0);
    SetGpuReg(REG_OFFSET_BG2HOFS,  0);
    SetGpuReg(REG_OFFSET_BG2VOFS,  0);
    SetGpuReg(REG_OFFSET_BG3HOFS,  0);
    SetGpuReg(REG_OFFSET_BG3VOFS,  0);
}

void sub_8078B9C(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_8078BB4(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    ScanlineEffect_InitHBlankDmaTransfer();

    if (gUnknown_2037F30 != 0xFF)
        gTasks[gUnknown_2037F30].data[0]++;
}

void sub_8078BEC(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (data[0] >= 2700)
    {
        gUnknown_2037F30 = 0xFF;
        DestroyTask(taskId);
    }
}

void sub_8078C24(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    if (JOY_NEW(A_BUTTON | B_BUTTON | START_BUTTON)
    && data[0] != 3 && data[0] != 4 && data[0] != 5)
    {
        sub_8079620();
        sub_8079648();
        sub_8079A10(data[5]);
        sub_8078C90(data, TITLESCREENSCENE_RUN);
    }
    else
    {
        gUnknown_83BFB84[data[0]](data);
    }
}

void sub_8078C90(s16 * data, u8 a1)
{
    data[1] = 0;
    data[0] = a1;
}

void sub_8078C9C(s16 * data)
{
    struct ScanlineEffectParams params;

    HideBg(0);
    ShowBg(1);
    ShowBg(2);
    ShowBg(3);

    params.dmaDest = (volatile void *)REG_ADDR_BLDY;
    params.dmaControl = SCANLINE_EFFECT_DMACNT_16BIT;
    params.initState = 1;
    params.unused9 = 0;

    CpuFill16(0, gScanlineEffectRegBuffers[0], 0x140);
    CpuFill16(0, gScanlineEffectRegBuffers[1], 0x140);

    ScanlineEffect_SetParams(params);

    sub_8078C90(data, TITLESCREENSCENE_FLASHSPRITE);
}

void sub_8078D24(s16 * data)
{
    switch (data[1])
    {
    case 0:
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_LIGHTEN);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        data[2] = 0x80;
        sub_8079550(0x80);
        data[1]++;
        break;
    case 1:
        data[2] -= 4;
        sub_8079550(data[2]);
        if (data[2] < 0)
        {
            gScanlineEffect.state = 3;
            data[1]++;
        }
        break;
    case 2:
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        sub_8078C90(data, TITLESCREENSCENE_FADEIN);
    }
}

void sub_8078DA4(s16 * data)
{
    u32 r4;
    switch (data[1])
    {
    case 0:
        data[2] = 0;
        data[1]++;
        break;
    case 1:
        data[2]++;
        if (data[2] > 10)
        {
            TintPalette_GrayScale2(gPlttBufferUnfaded + 0xD0, 0x10);
            BeginNormalPaletteFade(0x00002000, 9, 0x10, 0, RGB_BLACK);
            data[1]++;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            data[2] = 0;
            data[1]++;
        }
        break;
    case 3:
        data[2]++;
        if (data[2] > 36)
        {
            CreateTask(sub_80792C8, 3);
            sub_80717A8(0x2000, -4, 0x01, 0x10, RGB(30, 30, 31), 0, 0);
            data[2] = 0;
            data[1]++;
        }
        break;
    case 4:
        if (!sub_807185C(0))
        {
            sub_80717A8(0x2000, -4, 0x0F, 0x00, RGB(30, 30, 31), 0, 0);
            data[1]++;
        }
        break;
    case 5:
        data[2]++;
        if (data[2] > 20)
        {
            data[2] = 0;
            sub_80717A8(0x2000, -4, 0x01, 0x10, RGB(30, 30, 31), 0, 0);
            data[1]++;
        }
        break;
    case 6:
        if (!sub_807185C(0))
        {
            sub_80717A8(0x2000, -4, 0x0F, 0x00, RGB(30, 30, 31), 0, 0);
            data[1]++;
        }
        break;
    case 7:
        data[2]++;
        if (data[2] > 20)
        {
            data[2] = 0;
            sub_80717A8(0x2000, -3, 0x00, 0x10, RGB(30, 30, 31), 0, 0);
            data[1]++;
        }
        break;
    case 8:
        if (!sub_807185C(0))
        {
            data[5] = 1;
            r4 = (0x10000 << sub_80799F0()) | 0x00001FFF;
            BlendPalettes(r4, 0x10, RGB(30, 30, 31));
            BeginNormalPaletteFade(r4, 1, 0x10, 0x00, RGB(30, 30, 31));
            ShowBg(0);
            CpuCopy16(gUnknown_8EAD5E8, gPlttBufferUnfaded + 0xD0, 0x20);
            sub_80717A8(0x2000, 1, 0x0F, 0x00, RGB(30, 30, 31), 0, 0);
            data[1]++;
        }
        break;
    case 9:
        if (!sub_807185C(0) && !gPaletteFade.active)
        {
            sub_8078C90(data, TITLESCREENSCENE_RUN);
        }
        break;
    }
}

#define KEYSTROKE_DELSAVE (B_BUTTON | SELECT_BUTTON | DPAD_UP)
#define KEYSTROKE_BERRY_FIX (B_BUTTON | SELECT_BUTTON)

void sub_8078FC4(s16 * data)
{
    switch (data[1])
    {
    case 0:
        HelpSystem_SetSomeVariable2(1);
        CreateTask(sub_807941C, 0);
        CreateTask(sub_8079840, 5);
        sub_80790A0();
        data[6] = sub_8079A40();
        sub_812B484();
        data[1]++;
        // fallthrough
    case 1:
        if (JOY_HELD(KEYSTROKE_DELSAVE) == KEYSTROKE_DELSAVE)
        {
            sub_8079A88(data[6]);
            DestroyTask(FindTaskIdByFunc(sub_8078C24));
            SetMainCallback2(sub_80796CC);
        }
        else if (JOY_HELD(KEYSTROKE_BERRY_FIX) == KEYSTROKE_BERRY_FIX)
        {
            sub_8079A88(data[6]);
            DestroyTask(FindTaskIdByFunc(sub_8078C24));
            SetMainCallback2(sub_80796E8);
        }
        else if (JOY_NEW(A_BUTTON | START_BUTTON))
        {
            sub_8078C90(data, TITLESCREENSCENE_CRY);
        }
        else if (!FuncIsActiveTask(sub_8078BEC))
        {
            sub_8078C90(data, TITLESCREENSCEEN_RESTART);
        }
        break;
    }
}

void sub_80790A0(void)
{
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJWIN_ON);
    SetGpuReg(REG_OFFSET_WINOUT, WIN_RANGE(0x3F, 0x1F));
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_LIGHTEN);
    SetGpuReg(REG_OFFSET_BLDY, 13);
}

void sub_80790CC(s16 * data)
{
    switch (data[1])
    {
    case 0:
        sub_8079A88(data[6]);
        data[1]++;
        break;
    case 1:
        if (!gPaletteFade.active && !sub_8079AA8(data[6]))
        {
            FadeOutMapMusic(10);
            BeginNormalPaletteFade(0xFFFFFFFF, 3, 0, 0x10, RGB_BLACK);
            sub_8079528();
            data[1]++;
        }
        break;
    case 2:
        if (IsNotWaitingForBGMStop() && !gPaletteFade.active)
        {
            DestroyTask(FindTaskIdByFunc(sub_807941C));
            data[2] = 0;
            data[1]++;
        }
        break;
    case 3:
        data[2]++;
        if (data[2] >= 20)
        {
            DestroyTask(FindTaskIdByFunc(sub_807941C));
            data[1]++;
        }
        break;
    case 4:
        sub_812B478();
        DestroyTask(FindTaskIdByFunc(sub_8078C24));
        SetMainCallback2(sub_80EC864);
        break;
    }
}

void sub_80791C0(s16 * data)
{
    switch (data[1])
    {
    case 0:
        if (!gPaletteFade.active)
        {
            PlayCry1(TITLE_SPECIES, 0);
            sub_8079A88(data[6]);
            data[2] = 0;
            data[1]++;
        }
        break;
    case 1:
        if (data[2] < 90)
            data[2]++;
        else if (!sub_8079AA8(data[6]))
        {
            BeginNormalPaletteFade(0x0FFFFFFF, 0, 0, 0x10, RGB_WHITE);
            sub_8079528();
            FadeOutBGM(4);
            data[1]++;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            SeedRngAndSetTrainerId();
            SetSaveBlocksPointers();
            ResetMenuAndMonGlobals();
            Save_ResetSaveCounters();
            Save_LoadGameData(0);
            if (gSaveFileStatus == SAVE_STATUS_EMPTY || gSaveFileStatus == SAVE_STATUS_INVALID)
                Sav2_ClearSetDefault();
            SetPokemonCryStereo(gSaveBlock2Ptr->optionsSound);
            InitHeap(gHeap, HEAP_SIZE);
            SetMainCallback2(sub_800C300);
            DestroyTask(FindTaskIdByFunc(sub_8078C24));
        }
        break;
    }
}
