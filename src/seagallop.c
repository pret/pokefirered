#include "global.h"
#include "gpu_regs.h"
#include "bg.h"
#include "palette.h"
#include "malloc.h"
#include "scanline_effect.h"
#include "battle_dome_cards.h"
#include "window.h"
#include "text_window.h"
#include "sound.h"
#include "task.h"
#include "help_system.h"
#include "overworld.h"
#include "event_data.h"
#include "field_fadetransition.h"
#include "field_weather.h"
#include "constants/songs.h"
#include "constants/maps.h"
#include "seagallop.h"

EWRAM_DATA void * gUnknown_203F3D0 = NULL;

void sub_8146E94(void);
void sub_8147058(void);
void sub_814706C(void);
void sub_8147084(u8 taskId);
void sub_81470CC(u8 taskId);
void sub_8147108(u8 taskId);
void sub_8147140(void);
void sub_81471C4(void);
void sub_81472FC(void);
void sub_814731C(void);
void sub_814732C(void);
void sub_8147384(void);
void sub_81473A0(void);
void sub_81473C4(void);
void sub_8147418(struct Sprite * sprite);
void sub_814746C(s16 x);
void sub_81474B0(struct Sprite * sprite);
bool8 sub_81474CC(void);

const u16 gUnknown_8468C98[] = INCBIN_U16("data/seagallop/unk_8468C98.4bpp");
const u16 gUnknown_84691B8[] = INCBIN_U16("data/seagallop/unk_84691B8.gbapal");
const u16 gUnknown_84691D8[] = INCBIN_U16("data/seagallop/unk_84691D8.bin");
const u16 gUnknown_84699D8[] = INCBIN_U16("data/seagallop/unk_84699D8.bin");
const u16 gUnknown_846A1D8[] = INCBIN_U16("data/seagallop/unk_846A1D8.4bpp");
const u16 gUnknown_846A6D8[] = INCBIN_U16("data/seagallop/unk_846A6D8.gbapal");
const u16 gUnknown_846A6F8[] = INCBIN_U16("data/seagallop/unk_846A6F8.4bpp");

const struct BgTemplate gUnknown_846AEF8[] = {
    {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }
};

const s8 gUnknown_846AEFC[][4] = {
    {MAP(VERMILIONCITY), 0x17, 0x20},
    {MAP(ONEISLAND_HARBOR), 0x08, 0x05},
    {MAP(TWOISLAND_HARBOR), 0x08, 0x05},
    {MAP(THREEISLAND_HARBOR), 0x08, 0x05},
    {MAP(FOURISLAND_HARBOR), 0x08, 0x05},
    {MAP(FIVEISLAND_HARBOR), 0x08, 0x05},
    {MAP(SIXISLAND_HARBOR), 0x08, 0x05},
    {MAP(SEVENISLAND_HARBOR), 0x08, 0x05},
    {MAP(CINNABARISLAND), 0x15, 0x07},
    {MAP(NAVELROCK_HARBOR), 0x08, 0x05},
    {MAP(BIRTHISLAND_HARBOR), 0x08, 0x05}
};

const u16 gUnknown_846AF28[] = {
    0x06fe,
    0x06fc,
    0x06f8,
    0x06f0,
    0x06e0,
    0x04c0,
    0x0400,
    0x0440,
    0x07ff,
    0x06e0,
    0x0000
};

const union AnimCmd gUnknown_846AF40[] = {
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_END
};

const union AnimCmd gUnknown_846AF48[] = {
    ANIMCMD_FRAME(0, 10, .hFlip = TRUE),
    ANIMCMD_END
};

const union AnimCmd *const gUnknown_846AF50[] = {
    gUnknown_846AF40,
    gUnknown_846AF48
};

const struct OamData gOamData_846AF58 = {
    .size = 3
};

const struct SpriteTemplate gUnknown_846AF60 = {
    3000,
    3000,
    &gOamData_846AF58,
    gUnknown_846AF50,
    NULL,
    gDummySpriteAffineAnimTable,
    sub_8147418
};

const struct SpriteSheet gUnknown_846AF78[] = {
    {(void *)gUnknown_846A6F8, 0x0800, 4000},
    {(void *)gUnknown_846A1D8, 0x0500, 3000},
    {}
};

const struct SpritePalette gUnknown_846AF90[] = {
    {gUnknown_846A6D8, 3000},
    {}
};

const union AnimCmd gUnknown_846AFA0[] = {
    ANIMCMD_FRAME(0x00, 0x14),
    ANIMCMD_FRAME(0x10, 0x14),
    ANIMCMD_FRAME(0x20, 0x0f),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_846AFB0[] = {
    ANIMCMD_FRAME(0x00, 0x14, .hFlip = TRUE),
    ANIMCMD_FRAME(0x10, 0x14, .hFlip = TRUE),
    ANIMCMD_FRAME(0x20, 0x0f, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_846AFC0[] = {
    gUnknown_846AFA0,
    gUnknown_846AFB0
};

const struct OamData gOamData_846AFC8 = {
    .size = 2
};

const struct SpriteTemplate gUnknown_846AFD0 = {
    4000,
    3000,
    &gOamData_846AFC8,
    gUnknown_846AFC0,
    NULL,
    gDummySpriteAffineAnimTable,
    sub_81474B0
};

void sub_8146E78(void)
{
    SetVBlankCallback(NULL);
    sub_812B478();
    SetMainCallback2(sub_8146E94);
}

void sub_8146E94(void)
{
    void ** ptr;
    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL); // redundant since the setup routine already did this
        sub_81471C4();
        gMain.state++;
        break;
    case 1:
        sub_81472FC();
        gMain.state++;
        break;
    case 2:
        ptr = &gUnknown_203F3D0;
        *ptr = AllocZeroed(0x800);
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(0, gUnknown_846AEF8, NELEMS(gUnknown_846AEF8));
        SetBgTilemapBuffer(3, *ptr);
        sub_814732C();
        gMain.state++;
        break;
    case 3:
        LoadBgTiles(3, gUnknown_8468C98, sizeof(gUnknown_8468C98), 0);
        if (sub_81474CC() == TRUE)
        {
            CopyToBgTilemapBufferRect(3, gUnknown_84699D8, 0, 0, 32, 32);
        }
        else
        {
            CopyToBgTilemapBufferRect(3, gUnknown_84691D8, 0, 0, 32, 32);
        }
        LoadPalette(gUnknown_84691B8, 0x40, 0x20);
        LoadPalette(stdpal_get(2), 0xF0, 0x20);
        gMain.state++;
        break;
    case 4:
        if (IsDma3ManagerBusyWithBgCopy() != TRUE)
        {
            ShowBg(0);
            ShowBg(3);
            CopyBgTilemapBufferToVram(3);
            gMain.state++;
        }
        break;
    case 5:
        sub_8147384();
        BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
        gMain.state++;
        break;
    case 6:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        gMain.state++;
        break;
    case 7:
        sub_814731C();
        SetVBlankCallback(sub_8147058);
        PlaySE(SE_NAMINORI);
        sub_81473C4();
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        SetGpuReg(REG_OFFSET_WININ, 0x3F);
        SetGpuReg(REG_OFFSET_WINOUT, 0x00);
        SetGpuReg(REG_OFFSET_WIN0H, 0x00F0);
        SetGpuReg(REG_OFFSET_WIN0V, 0x1888);
        CreateTask(sub_8147084, 8);
        SetMainCallback2(sub_814706C);
        gMain.state = 0;
        break;
    }
}

void sub_8147058(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_814706C(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_8147084(u8 taskId)
{
    gTasks[taskId].func = sub_81470CC;
}

void sub_81470A0(void)
{
    if (sub_81474CC() == TRUE)
    {
        ChangeBgX(3, 0x600, 1);
    }
    else
    {
        ChangeBgX(3, 0x600, 2);
    }
}

void sub_81470CC(u8 taskId)
{
    struct Task * task = &gTasks[taskId];

    sub_81470A0();
    if (++task->data[1] == 140)
    {
        Overworld_FadeOutMapMusic();
        sub_807DC18();
        task->func = sub_8147108;
    }
}

void sub_8147108(u8 taskId)
{
    sub_81470A0();
    if (sub_8055FC4() && !gPaletteFade.active)
    {
        sub_8147140();
        sub_812B484();
        DestroyTask(taskId);
    }
}

void sub_8147140(void)
{
    const s8 * warpInfo;

    if (gSpecialVar_0x8006 >= NELEMS(gUnknown_846AEFC))
        gSpecialVar_0x8006 = 0;

    warpInfo = gUnknown_846AEFC[gSpecialVar_0x8006];
    Overworld_SetWarpDestination(warpInfo[0], warpInfo[1], -1, warpInfo[2], warpInfo[3]);
    play_some_sound();
    PlaySE(SE_KAIDAN);
    gUnknown_3005020 = sub_807DF64;
    warp_in();
    SetMainCallback2(sub_805671C);
    ResetInitialPlayerAvatarState();
    sub_81473A0();
    Free(gUnknown_203F3D0);
    FreeAllWindowBuffers();
}

void sub_81471C4(void)
{
    void * dest = (void *) VRAM;
    DmaClearLarge16(3, dest, VRAM_SIZE, 0x1000);

    DmaClear32(3, (void *)OAM, OAM_SIZE);
    DmaClear16(3, (void *)PLTT, PLTT_SIZE);
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    SetGpuReg(REG_OFFSET_BG0CNT, 0);
    SetGpuReg(REG_OFFSET_BG0HOFS, 0);
    SetGpuReg(REG_OFFSET_BG0VOFS, 0);
    SetGpuReg(REG_OFFSET_BG1CNT, 0);
    SetGpuReg(REG_OFFSET_BG1HOFS, 0);
    SetGpuReg(REG_OFFSET_BG1VOFS, 0);
    SetGpuReg(REG_OFFSET_BG2CNT, 0);
    SetGpuReg(REG_OFFSET_BG2HOFS, 0);
    SetGpuReg(REG_OFFSET_BG2VOFS, 0);
    SetGpuReg(REG_OFFSET_BG3CNT, 0);
    SetGpuReg(REG_OFFSET_BG3HOFS, 0);
    SetGpuReg(REG_OFFSET_BG3VOFS, 0);
    SetGpuReg(REG_OFFSET_WIN0H, 0);
    SetGpuReg(REG_OFFSET_WIN0V, 0);
    SetGpuReg(REG_OFFSET_WININ, 0);
    SetGpuReg(REG_OFFSET_WINOUT, 0);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
}

void sub_81472FC(void)
{
    ScanlineEffect_Stop();
    ResetTasks();
    ResetSpriteData();
    dp13_810BB8C();
    ResetPaletteFade();
    FreeAllSpritePalettes();
}

void sub_814731C(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON);
}

void sub_814732C(void)
{
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
}

void sub_8147384(void)
{
    LoadSpriteSheets(gUnknown_846AF78);
    LoadSpritePalettes(gUnknown_846AF90);
}

void sub_81473A0(void)
{
    FreeSpriteTilesByTag(3000);
    FreeSpriteTilesByTag(4000);
    FreeSpritePaletteByTag(3000);
}

void sub_81473C4(void)
{
    u8 spriteId = CreateSprite(&gUnknown_846AF60, 0, 92, 0);
    gSprites[spriteId].data[0] = 48;
    if (sub_81474CC() == TRUE)
    {
        StartSpriteAnim(&gSprites[spriteId], 1);
    }
    else
    {
        gSprites[spriteId].pos1.x = 240;
        gSprites[spriteId].data[0] *= -1;
    }
}

void sub_8147418(struct Sprite * sprite)
{
    sprite->data[1] += sprite->data[0];
    sprite->pos2.x = sprite->data[1] >> 4;
    if (sprite->data[2] % 5 == 0)
    {
        sub_814746C(sprite->pos1.x + sprite->pos2.x);
    }
    sprite->data[2]++;
    if ((u16)(300 + sprite->pos2.x) > 600)
    {
        DestroySprite(sprite);
    }
}

void sub_814746C(s16 x)
{
    u8 spriteId = CreateSprite(&gUnknown_846AFD0, x, 92, 8);
    if (spriteId != MAX_SPRITES)
    {
        if (sub_81474CC() == TRUE)
        {
            StartSpriteAnim(&gSprites[spriteId], 1);
        }
    }
}

void sub_81474B0(struct Sprite * sprite)
{
    if (sprite->animEnded)
    {
        DestroySprite(sprite);
    }
}

bool8 sub_81474CC(void)
{
    if (gSpecialVar_0x8004 >= NELEMS(gUnknown_846AF28))
    {
        return TRUE;
    }
    return (gUnknown_846AF28[gSpecialVar_0x8004] >> gSpecialVar_0x8006) & 1;
}
