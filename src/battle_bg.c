#include "global.h"
#include "gflib.h"
#include "battle.h"
#include "battle_bg.h"
#include "battle_message.h"
#include "decompress.h"
#include "graphics.h"
#include "link.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "text_window.h"
#include "trig.h"
#include "constants/maps.h"
#include "constants/songs.h"
#include "constants/trainer_classes.h"

#define TAG_VS_LETTERS 10000

static void sub_800F228(void);
static u8 sub_800FC2C(void);

static const u8 gUnknown_824829C[] = {1, 2};

static const struct OamData gOamData_82482A0 = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_DOUBLE,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0x000,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0
};

static const struct OamData gOamData_82482A8 = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_DOUBLE,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0x040,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0
};

static const union AffineAnimCmd gUnknown_82482B0[] = {
    AFFINEANIMCMD_FRAME(0x80, 0x80, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd gUnknown_82482C0[] = {
    AFFINEANIMCMD_FRAME(0x80, 0x80, 0, 0),
    AFFINEANIMCMD_FRAME(0x18, 0x18, 0x0, 0x80),
    AFFINEANIMCMD_FRAME(0x18, 0x18, 0x0, 0x80),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const gAffineAnimTable_82482E0[] = {
    gUnknown_82482B0,
    gUnknown_82482C0
};

static const struct SpriteTemplate sVsLetter_V_SpriteTemplate = {
    .tileTag = TAG_VS_LETTERS,
    .paletteTag = TAG_VS_LETTERS,
    .oam = &gOamData_82482A0,
    .anims = gDummySpriteAnimTable,
    .affineAnims = gAffineAnimTable_82482E0,
    .callback = nullsub_9
};

static const struct SpriteTemplate sVsLetter_S_SpriteTemplate = {
    .tileTag = TAG_VS_LETTERS,
    .paletteTag = TAG_VS_LETTERS,
    .oam = &gOamData_82482A8,
    .anims = gDummySpriteAnimTable,
    .affineAnims = gAffineAnimTable_82482E0,
    .callback = nullsub_9
};

static const struct CompressedSpriteSheet sVsLettersSpriteSheet = {
    gFile_graphics_battle_transitions_vs_sheet,
    0x1000,
    TAG_VS_LETTERS
};

const struct BgTemplate gBattleBgTemplates[4] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 24,
        .screenSize = 2,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 1,
        .mapBaseIndex = 28,
        .screenSize = 2,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 2,
        .charBaseIndex = 1,
        .mapBaseIndex = 30,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x000
    }, {
        .bg = 3,
        .charBaseIndex = 2,
        .mapBaseIndex = 26,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }
};

static const struct WindowTemplate gUnknown_8248330[] = {
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 15,
        .width = 28,
        .height = 4,
        .paletteNum = 0,
        .baseBlock = 0x090
    }, {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 35,
        .width = 14,
        .height = 4,
        .paletteNum = 0,
        .baseBlock = 0x1c0
    }, {
        .bg = 0,
        .tilemapLeft = 17,
        .tilemapTop = 35,
        .width = 12,
        .height = 4,
        .paletteNum = 5,
        .baseBlock = 0x190
    }, {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 55,
        .width = 8,
        .height = 2,
        .paletteNum = 5,
        .baseBlock = 0x300
    }, {
        .bg = 0,
        .tilemapLeft = 11,
        .tilemapTop = 55,
        .width = 8,
        .height = 2,
        .paletteNum = 5,
        .baseBlock = 0x310
    }, {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 57,
        .width = 8,
        .height = 2,
        .paletteNum = 5,
        .baseBlock = 0x320
    }, {
        .bg = 0,
        .tilemapLeft = 11,
        .tilemapTop = 57,
        .width = 8,
        .height = 2,
        .paletteNum = 5,
        .baseBlock = 0x330
    }, {
        .bg = 0,
        .tilemapLeft = 21,
        .tilemapTop = 55,
        .width = 3,
        .height = 2,
        .paletteNum = 5,
        .baseBlock = 0x290
    }, {
        .bg = 0,
        .tilemapLeft = 21,
        .tilemapTop = 57,
        .width = 8,
        .height = 2,
        .paletteNum = 5,
        .baseBlock = 0x296
    }, {
        .bg = 0,
        .tilemapLeft = 24,
        .tilemapTop = 55,
        .width = 5,
        .height = 2,
        .paletteNum = 5,
        .baseBlock = 0x2a6
    }, {
        .bg = 0,
        .tilemapLeft = 25,
        .tilemapTop = 57,
        .width = 0,
        .height = 0,
        .paletteNum = 5,
        .baseBlock = 0x2b0
    }, {
        .bg = 0,
        .tilemapLeft = 21,
        .tilemapTop = 55,
        .width = 8,
        .height = 4,
        .paletteNum = 5,
        .baseBlock = 0x2b0
    }, {
        .bg = 1,
        .tilemapLeft = 19,
        .tilemapTop = 8,
        .width = 10,
        .height = 11,
        .paletteNum = 5,
        .baseBlock = 0x100
    }, {
        .bg = 2,
        .tilemapLeft = 18,
        .tilemapTop = 0,
        .width = 12,
        .height = 3,
        .paletteNum = 6,
        .baseBlock = 0x16e
    }, {
        .bg = 0,
        .tilemapLeft = 25,
        .tilemapTop = 9,
        .width = 4,
        .height = 4,
        .paletteNum = 5,
        .baseBlock = 0x100
    }, {
        .bg = 1,
        .tilemapLeft = 2,
        .tilemapTop = 3,
        .width = 7,
        .height = 2,
        .paletteNum = 5,
        .baseBlock = 0x020
    }, {
        .bg = 2,
        .tilemapLeft = 2,
        .tilemapTop = 3,
        .width = 7,
        .height = 2,
        .paletteNum = 5,
        .baseBlock = 0x040
    }, {
        .bg = 1,
        .tilemapLeft = 2,
        .tilemapTop = 2,
        .width = 7,
        .height = 2,
        .paletteNum = 5,
        .baseBlock = 0x020
    }, {
        .bg = 2,
        .tilemapLeft = 2,
        .tilemapTop = 2,
        .width = 7,
        .height = 2,
        .paletteNum = 5,
        .baseBlock = 0x040
    }, {
        .bg = 1,
        .tilemapLeft = 2,
        .tilemapTop = 6,
        .width = 7,
        .height = 2,
        .paletteNum = 5,
        .baseBlock = 0x060
    }, {
        .bg = 2,
        .tilemapLeft = 2,
        .tilemapTop = 6,
        .width = 7,
        .height = 2,
        .paletteNum = 5,
        .baseBlock = 0x080
    }, {
        .bg = 0,
        .tilemapLeft = 11,
        .tilemapTop = 2,
        .width = 8,
        .height = 2,
        .paletteNum = 0,
        .baseBlock = 0x0a0
    }, {
        .bg = 0,
        .tilemapLeft = 4,
        .tilemapTop = 2,
        .width = 8,
        .height = 2,
        .paletteNum = 0,
        .baseBlock = 0x0a0
    }, {
        .bg = 0,
        .tilemapLeft = 19,
        .tilemapTop = 2,
        .width = 8,
        .height = 2,
        .paletteNum = 0,
        .baseBlock = 0x0b0
    }, {
        .bg = 0,
        .tilemapLeft = 2,
        .tilemapTop = 15,
        .width = 26,
        .height = 4,
        .paletteNum = 7,
        .baseBlock = 0x090
    }, DUMMY_WIN_TEMPLATE
};

static const u32 gUnknown_8248400[] = INCBIN_U32("graphics/battle/unk_8248400.gbapal.lz");
static const u32 gUnknown_824844C[] = INCBIN_U32("graphics/battle/unk_824844C.4bpp.lz");
static const u32 gUnknown_82489A8[] = INCBIN_U32("graphics/battle/unk_82489A8.bin.lz");
static const u32 gUnknown_8248C68[] = INCBIN_U32("graphics/battle/unk_8248C68.4bpp.lz");
static const u32 gUnknown_8248F58[] = INCBIN_U32("graphics/battle/unk_8248F58.bin.lz");
static const u32 gUnknown_8249074[] = INCBIN_U32("graphics/battle/unk_8249074.gbapal.lz");
static const u32 gUnknown_82490C4[] = INCBIN_U32("graphics/battle/unk_82490C4.4bpp.lz");
static const u32 gUnknown_8249620[] = INCBIN_U32("graphics/battle/unk_8249620.bin.lz");
static const u32 gUnknown_82498DC[] = INCBIN_U32("graphics/battle/unk_82498DC.4bpp.lz");
static const u32 gUnknown_8249E10[] = INCBIN_U32("graphics/battle/unk_8249E10.bin.lz");
static const u32 gUnknown_8249F98[] = INCBIN_U32("graphics/battle/unk_8249F98.gbapal.lz");
static const u32 gUnknown_8249FE4[] = INCBIN_U32("graphics/battle/unk_8249FE4.4bpp.lz");
static const u32 gUnknown_824A37C[] = INCBIN_U32("graphics/battle/unk_824A37C.bin.lz");
static const u32 gUnknown_824A618[] = INCBIN_U32("graphics/battle/unk_824A618.4bpp.lz");
static const u32 gUnknown_824A844[] = INCBIN_U32("graphics/battle/unk_824A844.bin.lz");
static const u32 gUnknown_824A940[] = INCBIN_U32("graphics/battle/unk_824A940.gbapal.lz");
static const u32 gUnknown_824A990[] = INCBIN_U32("graphics/battle/unk_824A990.4bpp.lz");
static const u32 gUnknown_824ACD0[] = INCBIN_U32("graphics/battle/unk_824ACD0.bin.lz");
static const u32 gUnknown_824AF70[] = INCBIN_U32("graphics/battle/unk_824AF70.4bpp.lz");
static const u32 gUnknown_824B0DC[] = INCBIN_U32("graphics/battle/unk_824B0DC.bin.lz");
static const u32 gUnknown_824B19C[] = INCBIN_U32("graphics/battle/unk_824B19C.gbapal.lz");
static const u32 gUnknown_824B1EC[] = INCBIN_U32("graphics/battle/unk_824B1EC.4bpp.lz");
static const u32 gUnknown_824B608[] = INCBIN_U32("graphics/battle/unk_824B608.bin.lz");
static const u32 gUnknown_824B8A8[] = INCBIN_U32("graphics/battle/unk_824B8A8.4bpp.lz");
static const u32 gUnknown_824BBE0[] = INCBIN_U32("graphics/battle/unk_824BBE0.bin.lz");
static const u32 gUnknown_824BCE0[] = INCBIN_U32("graphics/battle/unk_824BCE0.gbapal.lz");
static const u32 gUnknown_824BD38[] = INCBIN_U32("graphics/battle/unk_824BD38.4bpp.lz");
static const u32 gUnknown_824C07C[] = INCBIN_U32("graphics/battle/unk_824C07C.bin.lz");
static const u32 gUnknown_824C314[] = INCBIN_U32("graphics/battle/unk_824C314.4bpp.lz");
static const u32 gUnknown_824C520[] = INCBIN_U32("graphics/battle/unk_824C520.bin.lz");
static const u32 gUnknown_824C5D8[] = INCBIN_U32("graphics/battle/unk_824C5D8.gbapal.lz");
static const u32 gUnknown_824C624[] = INCBIN_U32("graphics/battle/unk_824C624.4bpp.lz");
static const u32 gUnknown_824C958[] = INCBIN_U32("graphics/battle/unk_824C958.bin.lz");
static const u32 gUnknown_824CBF8[] = INCBIN_U32("graphics/battle/unk_824CBF8.4bpp.lz");
static const u32 gUnknown_824CEC8[] = INCBIN_U32("graphics/battle/unk_824CEC8.bin.lz");
static const u32 gUnknown_824CF98[] = INCBIN_U32("graphics/battle/unk_824CF98.gbapal.lz");
static const u32 gUnknown_824CFEC[] = INCBIN_U32("graphics/battle/unk_824CFEC.4bpp.lz");
static const u32 gUnknown_824D418[] = INCBIN_U32("graphics/battle/unk_824D418.bin.lz");
static const u32 gUnknown_824D6B8[] = INCBIN_U32("graphics/battle/unk_824D6B8.4bpp.lz");
static const u32 gUnknown_824DC98[] = INCBIN_U32("graphics/battle/unk_824DC98.bin.lz");
static const u32 gUnknown_824DDF0[] = INCBIN_U32("graphics/battle/unk_824DDF0.gbapal.lz");
static const u32 gUnknown_824DE34[] = INCBIN_U32("graphics/battle/unk_824DE34.4bpp.lz");
static const u32 gUnknown_824E16C[] = INCBIN_U32("graphics/battle/unk_824E16C.bin.lz");
static const u32 gUnknown_824E410[] = INCBIN_U32("graphics/battle/unk_824E410.4bpp.lz");
static const u32 gUnknown_824E490[] = INCBIN_U32("graphics/battle/unk_824E490.bin.lz");
static const u32 gUnknown_824E528[] = INCBIN_U32("graphics/battle/unk_824E528.gbapal.lz");
static const u32 gUnknown_824E56C[] = INCBIN_U32("graphics/battle/unk_824E56C.gbapal.lz");
static const u32 gUnknown_824E5B8[] = INCBIN_U32("graphics/battle/unk_824E5B8.gbapal.lz");
static const u32 gUnknown_824E604[] = INCBIN_U32("graphics/battle/unk_824E604.gbapal.lz");
static const u32 gUnknown_824E650[] = INCBIN_U32("graphics/battle/unk_824E650.gbapal.lz");
static const u32 gUnknown_824E6A4[] = INCBIN_U32("graphics/battle/unk_824E6A4.gbapal.lz");
static const u32 gUnknown_824E6F0[] = INCBIN_U32("graphics/battle/unk_824E6F0.gbapal.lz");
static const u32 gUnknown_824E740[] = INCBIN_U32("graphics/battle/unk_824E740.gbapal.lz");
static const u32 gUnknown_824E78C[] = INCBIN_U32("graphics/battle/unk_824E78C.gbapal.lz");
static const u32 gUnknown_824E7DC[] = INCBIN_U32("graphics/battle/unk_824E7DC.gbapal.lz");
static const u32 gUnknown_824E81C[] = INCBIN_U32("graphics/battle/unk_824E81C.gbapal.lz");
static const u32 gUnknown_824E858[] = INCBIN_U32("graphics/battle/unk_824E858.4bpp.lz");
static const u32 gUnknown_824EB90[] = INCBIN_U32("graphics/battle/unk_824EB90.bin.lz");

static const u32 *const gUnknown_824EE34[][5] = {
    {gUnknown_824844C, gUnknown_82489A8, gUnknown_8248C68, gUnknown_8248F58, gUnknown_8248400},
    {gUnknown_82490C4, gUnknown_8249620, gUnknown_82498DC, gUnknown_8249E10, gUnknown_8249074},
    {gUnknown_8249FE4, gUnknown_824A37C, gUnknown_824A618, gUnknown_824A844, gUnknown_8249F98},
    {gUnknown_824A990, gUnknown_824ACD0, gUnknown_824AF70, gUnknown_824B0DC, gUnknown_824A940},
    {gUnknown_824B1EC, gUnknown_824B608, gUnknown_824B8A8, gUnknown_824BBE0, gUnknown_824B19C},
    {gUnknown_824BD38, gUnknown_824C07C, gUnknown_824C314, gUnknown_824C520, gUnknown_824BCE0},
    {gUnknown_824C624, gUnknown_824C958, gUnknown_824CBF8, gUnknown_824CEC8, gUnknown_824C5D8},
    {gUnknown_824CFEC, gUnknown_824D418, gUnknown_824D6B8, gUnknown_824DC98, gUnknown_824CF98},
    {gUnknown_824DE34, gUnknown_824E16C, gUnknown_824E410, gUnknown_824E490, gUnknown_824DDF0},
    {gUnknown_824DE34, gUnknown_824E16C, gUnknown_824E410, gUnknown_824E490, gUnknown_824E81C},
    {gUnknown_824DE34, gUnknown_824E16C, gUnknown_824E410, gUnknown_824E490, gUnknown_824E528},
    {gUnknown_824DE34, gUnknown_824E16C, gUnknown_824E410, gUnknown_824E490, gUnknown_824E56C},
    {gUnknown_824DE34, gUnknown_824E16C, gUnknown_824E410, gUnknown_824E490, gUnknown_824E5B8},
    {gUnknown_824E858, gUnknown_824EB90, gUnknown_824E410, gUnknown_824E490, gUnknown_824E604},
    {gUnknown_824E858, gUnknown_824EB90, gUnknown_824E410, gUnknown_824E490, gUnknown_824E650},
    {gUnknown_824E858, gUnknown_824EB90, gUnknown_824E410, gUnknown_824E490, gUnknown_824E6A4},
    {gUnknown_824E858, gUnknown_824EB90, gUnknown_824E410, gUnknown_824E490, gUnknown_824E6F0},
    {gUnknown_824E858, gUnknown_824EB90, gUnknown_824E410, gUnknown_824E490, gUnknown_824E740},
    {gUnknown_824E858, gUnknown_824EB90, gUnknown_824E410, gUnknown_824E490, gUnknown_824E78C},
    {gUnknown_824E858, gUnknown_824EB90, gUnknown_824E410, gUnknown_824E490, gUnknown_824E7DC}
};

static const struct {
    u8 unk0;
    u8 unk1;
} gUnknown_824EFC4[] = {
    {1, 11},
    {2, 14},
    {3, 13},
    {4, 15},
    {5, 16},
    {6, 17},
    {7, 18},
    {8, 10}
};

UNUSED void sub_800F1E8(void)
{
    u8 spriteId;

    ResetSpriteData();
    spriteId = CreateSprite(&gUnknown_824EFF0, 0, 0, 0);
    gSprites[spriteId].invisible = TRUE;
    SetMainCallback2(sub_800F228);
}

static void sub_800F228(void)
{
    AnimateSprites();
    BuildOamBuffer();
}

static u8 sub_800F238(u8 a0)
{
    int i;
    for (i = 0; i < NELEMS(gUnknown_824EFC4); i++)
    {
        if (a0 == gUnknown_824EFC4[i].unk0)
            return gUnknown_824EFC4[i].unk1;
    }
    return 9;
}

static void sub_800F260(u16 envId)
{
    if (envId >= NELEMS(gUnknown_824EE34))
        envId = 9;
    LZDecompressVram(gUnknown_824EE34[envId][0], (void *)BG_CHAR_ADDR(2));
    LZDecompressVram(gUnknown_824EE34[envId][1], (void *)BG_SCREEN_ADDR(26));
    LoadCompressedPalette(gUnknown_824EE34[envId][4], 0x20, 0x60);
}

static void sub_800F2AC(u16 envId)
{
    if (envId >= NELEMS(gUnknown_824EE34))
        envId = 9;
    LZDecompressVram(gUnknown_824EE34[envId][2], (void *)BG_CHAR_ADDR(1));
    LZDecompressVram(gUnknown_824EE34[envId][3], (void *)BG_SCREEN_ADDR(28));
}

UNUSED void sub_800F2EC(u8 envId, const u32 **tilesPtr, const u32 **mapPtr, const u32 **palPtr)
{
    if (envId > 9)
        envId = 9;
    *tilesPtr = gUnknown_824EE34[envId][0];
    *mapPtr = gUnknown_824EE34[envId][1];
    *palPtr = gUnknown_824EE34[envId][4];
}

void sub_800F324(void)
{
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, gBattleBgTemplates, NELEMS(gBattleBgTemplates));
    InitWindows(gUnknown_8248330);
    DeactivateAllTextPrinters();
}

void InitBattleBgsVideo(void)
{
    EnableInterrupts(INTR_FLAG_VBLANK | INTR_FLAG_VCOUNT | INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL);
    sub_800F324();
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_OBJWIN_ON);
}

void LoadBattleMenuWindowGfx(void)
{
    TextWindow_SetUserSelectedFrame(2, 0x012, 0x10);
    TextWindow_SetUserSelectedFrame(2, 0x022, 0x10);
    gPlttBufferUnfaded[0x5C] = RGB( 9,  9,  9);
    gPlttBufferUnfaded[0x5D] = RGB( 9,  9,  9);
    gPlttBufferUnfaded[0x5E] = RGB(31, 31, 31);
    gPlttBufferUnfaded[0x5F] = RGB( 26,  26,  25);
    CpuCopy16(&gPlttBufferUnfaded[0x5C], &gPlttBufferFaded[0x5C], 8);
    if (gBattleTypeFlags & (BATTLE_TYPE_FIRST_BATTLE | BATTLE_TYPE_POKEDUDE))
    {
        Menu_LoadStdPalAt(0x70);
        TextWindow_LoadResourcesStdFrame0(0, 0x030, 0x70);
        gPlttBufferUnfaded[0x76] = RGB( 0,  0,  0);
        CpuCopy16(&gPlttBufferUnfaded[0x76], &gPlttBufferFaded[0x76], 2);
    }
}

void DrawMainBattleBackground(void)
{
    sub_800F260(sub_800FC2C());
}

void LoadBattleTextboxAndBackground(void)
{
    LZDecompressVram(gBattleTextboxTiles, (void *)BG_CHAR_ADDR(0));
    CopyToBgTilemapBuffer(0, gBattleTextboxTilemap, 0, 0x000);
    CopyBgTilemapBufferToVram(0);
    LoadCompressedPalette(gBattleTextboxPalette, 0x00, 0x40);
    LoadBattleMenuWindowGfx();
    DrawMainBattleBackground();
}

static void DrawLinkBattleParticipantPokeballs(u8 taskId, u8 multiplayerId, u8 bgId, u8 destX, u8 destY)
{
    s32 i;
    u16 pokeballStatuses = 0;
    u16 tiles[6];

    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        if (gTasks[taskId].data[5] != 0)
        {
            switch (multiplayerId)
            {
            case 0:
                pokeballStatuses = 0x3F & gTasks[taskId].data[3];
                break;
            case 1:
                pokeballStatuses = (0xFC0 & gTasks[taskId].data[4]) >> 6;
                break;
            case 2:
                pokeballStatuses = (0xFC0 & gTasks[taskId].data[3]) >> 6;
                break;
            case 3:
                pokeballStatuses = 0x3F & gTasks[taskId].data[4];
                break;
            }
        }
        else
        {
            switch (multiplayerId)
            {
            case 0:
                pokeballStatuses = 0x3F & gTasks[taskId].data[3];
                break;
            case 1:
                pokeballStatuses = 0x3F & gTasks[taskId].data[4];
                break;
            case 2:
                pokeballStatuses = (0xFC0 & gTasks[taskId].data[3]) >> 6;
                break;
            case 3:
                pokeballStatuses = (0xFC0 & gTasks[taskId].data[4]) >> 6;
                break;
            }
        }

        for (i = 0; i < 3; i++)
            tiles[i] = ((pokeballStatuses & (3 << (i * 2))) >> (i * 2)) + 0x6001;

        CopyToBgTilemapBufferRect_ChangePalette(bgId, tiles, destX, destY, 3, 1, 0x11);
        CopyBgTilemapBufferToVram(bgId);
    }
    else
    {
        if (multiplayerId == gBattleStruct->multiplayerId)
            pokeballStatuses = gTasks[taskId].data[3];
        else
            pokeballStatuses = gTasks[taskId].data[4];

        for (i = 0; i < 6; i++)
            tiles[i] = ((pokeballStatuses & (3 << (i * 2))) >> (i * 2)) + 0x6001;

        CopyToBgTilemapBufferRect_ChangePalette(bgId, tiles, destX, destY, 6, 1, 0x11);
        CopyBgTilemapBufferToVram(bgId);
    }
}

static void DrawLinkBattleVsScreenOutcomeText(void)
{
    if (gBattleOutcome == B_OUTCOME_DREW)
    {
        BattlePutTextOnWindow(gText_Draw, 0x15);
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        if (gBattleOutcome == B_OUTCOME_WON)
        {
            switch (gLinkPlayers[gBattleStruct->multiplayerId].id)
            {
            case 0:
                BattlePutTextOnWindow(gText_Win, 0x16);
                BattlePutTextOnWindow(gText_Loss, 0x17);
                break;
            case 1:
                BattlePutTextOnWindow(gText_Win, 0x17);
                BattlePutTextOnWindow(gText_Loss, 0x16);
                break;
            case 2:
                BattlePutTextOnWindow(gText_Win, 0x16);
                BattlePutTextOnWindow(gText_Loss, 0x17);
                break;
            case 3:
                BattlePutTextOnWindow(gText_Win, 0x17);
                BattlePutTextOnWindow(gText_Loss, 0x16);
                break;
            }
        }
        else
        {
            switch (gLinkPlayers[gBattleStruct->multiplayerId].id)
            {
            case 0:
                BattlePutTextOnWindow(gText_Win, 0x17);
                BattlePutTextOnWindow(gText_Loss, 0x16);
                break;
            case 1:
                BattlePutTextOnWindow(gText_Win, 0x16);
                BattlePutTextOnWindow(gText_Loss, 0x17);
                break;
            case 2:
                BattlePutTextOnWindow(gText_Win, 0x17);
                BattlePutTextOnWindow(gText_Loss, 0x16);
                break;
            case 3:
                BattlePutTextOnWindow(gText_Win, 0x16);
                BattlePutTextOnWindow(gText_Loss, 0x17);
                break;
            }
        }
    }
    else if (gBattleOutcome == B_OUTCOME_WON)
    {
        if (gLinkPlayers[gBattleStruct->multiplayerId].id != 0)
        {
            BattlePutTextOnWindow(gText_Win, 0x17);
            BattlePutTextOnWindow(gText_Loss, 0x16);
        }
        else
        {
            BattlePutTextOnWindow(gText_Win, 0x16);
            BattlePutTextOnWindow(gText_Loss, 0x17);
        }
    }
    else
    {
        if (gLinkPlayers[gBattleStruct->multiplayerId].id != 0)
        {
            BattlePutTextOnWindow(gText_Win, 0x16);
            BattlePutTextOnWindow(gText_Loss, 0x17);
        }
        else
        {
            BattlePutTextOnWindow(gText_Win, 0x17);
            BattlePutTextOnWindow(gText_Loss, 0x16);
        }
    }
}

void InitLinkBattleVsScreen(u8 taskId)
{
    struct LinkPlayer *linkPlayer;
    u8 *name;
    s32 i, palId;

    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
        {
            for (i = 0; i < MAX_BATTLERS_COUNT; i++)
            {
                name = gLinkPlayers[i].name;
                linkPlayer = &gLinkPlayers[i];

                switch (linkPlayer->id)
                {
                case 0:
                    BattlePutTextOnWindow(name, 0x11);
                    DrawLinkBattleParticipantPokeballs(taskId, linkPlayer->id, 1, 2, 4);
                    break;
                case 1:
                    BattlePutTextOnWindow(name, 0x12);
                    DrawLinkBattleParticipantPokeballs(taskId, linkPlayer->id, 2, 2, 4);
                    break;
                case 2:
                    BattlePutTextOnWindow(name, 0x13);
                    DrawLinkBattleParticipantPokeballs(taskId, linkPlayer->id, 1, 2, 8);
                    break;
                case 3:
                    BattlePutTextOnWindow(name, 0x14);
                    DrawLinkBattleParticipantPokeballs(taskId, linkPlayer->id, 2, 2, 8);
                    break;
                }
            }
        }
        else
        {
            u8 playerId = gBattleStruct->multiplayerId;
            u8 opponentId = playerId ^ BIT_SIDE;
            u8 opponentId_copy = opponentId;

            if (gLinkPlayers[playerId].id != 0)
                opponentId = playerId, playerId = opponentId_copy;

            name = gLinkPlayers[playerId].name;
            BattlePutTextOnWindow(name, 0xF);

            name = gLinkPlayers[opponentId].name;
            BattlePutTextOnWindow(name, 0x10);

            DrawLinkBattleParticipantPokeballs(taskId, playerId, 1, 2, 7);
            DrawLinkBattleParticipantPokeballs(taskId, opponentId, 2, 2, 7);
        }
        gTasks[taskId].data[0]++;
        break;
    case 1:
        palId = AllocSpritePalette(TAG_VS_LETTERS);
        gPlttBufferUnfaded[palId * 16 + 0x10F] = gPlttBufferFaded[palId * 16 + 0x10F] = 0x7FFF;
        gBattleStruct->linkBattleVsSpriteId_V = CreateSprite(&sVsLetter_V_SpriteTemplate, 108, 80, 0);
        gBattleStruct->linkBattleVsSpriteId_S = CreateSprite(&sVsLetter_S_SpriteTemplate, 132, 80, 0);
        gSprites[gBattleStruct->linkBattleVsSpriteId_V].invisible = TRUE;
        gSprites[gBattleStruct->linkBattleVsSpriteId_S].invisible = TRUE;
        gTasks[taskId].data[0]++;
        break;
    case 2:
        if (gTasks[taskId].data[5] != 0)
        {
            gBattle_BG1_X = -(20) - (Sin2(gTasks[taskId].data[1]) / 32);
            gBattle_BG2_X = -(140) - (Sin2(gTasks[taskId].data[2]) / 32);
            gBattle_BG1_Y = -36;
            gBattle_BG2_Y = -36;
        }
        else
        {
            gBattle_BG1_X = -(20) - (Sin2(gTasks[taskId].data[1]) / 32);
            gBattle_BG1_Y = (Cos2(gTasks[taskId].data[1]) / 32) - 164;
            gBattle_BG2_X = -(140) - (Sin2(gTasks[taskId].data[2]) / 32);
            gBattle_BG2_Y = (Cos2(gTasks[taskId].data[2]) / 32) - 164;
        }

        if (gTasks[taskId].data[2] != 0)
        {
            gTasks[taskId].data[2] -= 2;
            gTasks[taskId].data[1] += 2;
        }
        else
        {
            if (gTasks[taskId].data[5] != 0)
                DrawLinkBattleVsScreenOutcomeText();

            PlaySE(SE_W231);
            DestroyTask(taskId);
            gSprites[gBattleStruct->linkBattleVsSpriteId_V].invisible = FALSE;
            gSprites[gBattleStruct->linkBattleVsSpriteId_S].invisible = FALSE;
            gSprites[gBattleStruct->linkBattleVsSpriteId_S].oam.tileNum += 0x40;
            gSprites[gBattleStruct->linkBattleVsSpriteId_V].data[0] = 0;
            gSprites[gBattleStruct->linkBattleVsSpriteId_S].data[0] = 1;
            gSprites[gBattleStruct->linkBattleVsSpriteId_V].data[1] = gSprites[gBattleStruct->linkBattleVsSpriteId_V].pos1.x;
            gSprites[gBattleStruct->linkBattleVsSpriteId_S].data[1] = gSprites[gBattleStruct->linkBattleVsSpriteId_S].pos1.x;
            gSprites[gBattleStruct->linkBattleVsSpriteId_V].data[2] = 0;
            gSprites[gBattleStruct->linkBattleVsSpriteId_S].data[2] = 0;
        }
        break;
    }
}

void DrawBattleEntryBackground(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        LZDecompressVram(gFile_graphics_battle_transitions_vs_frame_sheet, (void*)(BG_CHAR_ADDR(1)));
        LZDecompressVram(gFile_graphics_battle_transitions_vs_sheet, (void*)(VRAM + 0x10000));
        LoadCompressedPalette(gFile_graphics_battle_transitions_vs_frame_palette, 0x60, 0x20);
        SetBgAttribute(1, BG_ATTR_SCREENSIZE, 1);
        SetGpuReg(REG_OFFSET_BG1CNT, 0x5C04);
        CopyToBgTilemapBuffer(1, gFile_graphics_battle_transitions_vs_frame_tilemap, 0, 0);
        CopyToBgTilemapBuffer(2, gFile_graphics_battle_transitions_vs_frame_tilemap, 0, 0);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(2);
        SetGpuReg(REG_OFFSET_WININ, 0x36);
        SetGpuReg(REG_OFFSET_WINOUT, 0x36);
        gBattle_BG1_Y = 0xFF5C;
        gBattle_BG2_Y = 0xFF5C;
        LoadCompressedSpriteSheetUsingHeap(&sVsLettersSpriteSheet);
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_POKEDUDE)
    {
        sub_800F2AC(0);
    }
    else if (gBattleTypeFlags & (BATTLE_TYPE_TRAINER_TOWER | BATTLE_TYPE_LINK | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_EREADER_TRAINER))
    {
        sub_800F2AC(8);
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_KYOGRE_GROUDON)
    {
        if (gGameVersion == VERSION_FIRE_RED)
        {
            sub_800F2AC(7);
        }
        else
        {
            sub_800F2AC(4);
        }
    }
    else
    {
        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
        {
            u8 trainerClass = gTrainers[gTrainerBattleOpponent_A].trainerClass;
            if (trainerClass == CLASS_LEADER_2)
            {
                sub_800F2AC(8);
                return;
            }
            else if (trainerClass == CLASS_CHAMPION_2)
            {
                sub_800F2AC(8);
                return;
            }
        }

        if (GetCurrentMapBattleScene() == MAP_BATTLE_SCENE_NORMAL)
        {
            sub_800F2AC(gBattleTerrain);
        }
        else
        {
            sub_800F2AC(8);
        }
    }
}

static u8 sub_800FC2C(void)
{
    u8 battleScene;
    if (gBattleTypeFlags & (BATTLE_TYPE_TRAINER_TOWER | BATTLE_TYPE_LINK | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_EREADER_TRAINER))
    {
        return 10;
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_POKEDUDE)
    {
        gBattleTerrain = 0;
        return 0;
    }
    else if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
    {
        if (gTrainers[gTrainerBattleOpponent_A].trainerClass == CLASS_LEADER_2)
        {
            return 12;
        }
        else if (gTrainers[gTrainerBattleOpponent_A].trainerClass == CLASS_CHAMPION_2)
        {
            return 19;
        }
    }
    battleScene = GetCurrentMapBattleScene();
    if (battleScene == 0)
    {
        return gBattleTerrain;
    }
    return sub_800F238(battleScene);
}

bool8 LoadChosenBattleElement(u8 caseId)
{
    bool8 ret = FALSE;
    u8 battleScene;
    switch (caseId)
    {
    case 0:
        LZDecompressVram(gBattleTextboxTiles, (void *)BG_CHAR_ADDR(0));
        break;
    case 1:
        CopyToBgTilemapBuffer(0, gBattleTextboxTilemap, 0, 0x000);
        CopyBgTilemapBufferToVram(0);
        break;
    case 2:
        LoadCompressedPalette(gBattleTextboxPalette, 0x00, 0x40);
        break;
    case 3:
        battleScene = sub_800FC2C();
        LZDecompressVram(gUnknown_824EE34[battleScene][0], (void *)BG_CHAR_ADDR(2));
        // fallthrough
    case 4:
        battleScene = sub_800FC2C();
        LZDecompressVram(gUnknown_824EE34[battleScene][1], (void *)BG_SCREEN_ADDR(26));
        break;
    case 5:
        battleScene = sub_800FC2C();
        LoadCompressedPalette(gUnknown_824EE34[battleScene][4], 0x20, 0x60);
        break;
    case 6:
        LoadBattleMenuWindowGfx();
        break;
    default:
        ret = TRUE;
        break;
    }
    return ret;
}
