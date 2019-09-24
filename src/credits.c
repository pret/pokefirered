#include "global.h"
#include "malloc.h"
#include "bg.h"
#include "palette.h"
#include "gpu_regs.h"
#include "task.h"
#include "overworld.h"
#include "event_data.h"
#include "window.h"
#include "new_menu_helpers.h"
#include "decompress.h"
#include "graphics.h"
#include "strings.h"
#include "trainer_pokemon_sprites.h"
#include "sound.h"
#include "constants/species.h"
#include "constants/maps.h"

struct CreditsResources
{
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
    u16 unk_04;
    u16 unk_06;
    u8 unk_08;
    u8 unk_09;
    u8 unk_0A;
    bool8 unk_0B;
    u16 unk_0C;
    u16 unk_0E;
    u8 filler_10[12];
    u8 unk_1C;
    u8 unk_1D;
};

struct UnkStruct_8410CF4
{
    u8 unk0;
    u8 unk1;
    u16 unk2;
};

struct UnkStruct_84145BC
{
    const u8 * unk_0;
    const u8 * unk_4;
    u8 unk_8;
};

struct CompressedGraphicsHeader
{
    const u8 * tiles;
    const u8 * map;
    const u16 * palette;
};

struct CreditsTaskData
{
    u8 field_00;
    u8 field_01;
    u16 field_02;
    u16 field_04;
    u8 field_06;
    u16 field_08;
    u16 field_0A;
};

EWRAM_DATA struct CreditsResources * gUnknown_203AB40 = NULL;

void sub_80F39E8(void);
s32 sub_80F3BD0(void);
bool32 sub_80F4328(void);
bool32 sub_80F4674(void);
void sub_80F48D0(void);
void sub_80F4930(u8 a0);

const struct BgTemplate gUnknown_840C5A4[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 15,
        .screenSize = 0,
        .paletteMode = FALSE,
        .priority = 0,
        .baseTile = 0x0
    }, {
        .bg = 1,
        .charBaseIndex = 2,
        .mapBaseIndex = 23,
        .screenSize = 0,
        .paletteMode = FALSE,
        .priority = 1,
        .baseTile = 0x0
    }, {
        .bg = 2,
        .charBaseIndex = 3,
        .mapBaseIndex = 31,
        .screenSize = 1,
        .paletteMode = TRUE,
        .priority = 2,
        .baseTile = 0x0
    }
};

const struct WindowTemplate gUnknown_840C5B0[] = {
    {
        .bg = 0x00,
        .tilemapLeft = 0x0b,
        .tilemapTop = 0x06,
        .width = 0x08,
        .height = 0x08,
        .paletteNum = 0x0a,
        .baseBlock = 0x0008
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x0a,
        .tilemapTop = 0x05,
        .width = 0x0a,
        .height = 0x0a,
        .paletteNum = 0x0a,
        .baseBlock = 0x0048
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x09,
        .tilemapTop = 0x03,
        .width = 0x0c,
        .height = 0x0d,
        .paletteNum = 0x0a,
        .baseBlock = 0x00ac
    }, DUMMY_WIN_TEMPLATE
};

const struct WindowTemplate gUnknown_840C5D0[] = {
    {
        .bg = 0x00,
        .tilemapLeft = 0x0b,
        .tilemapTop = 0x06,
        .width = 0x08,
        .height = 0x08,
        .paletteNum = 0x0a,
        .baseBlock = 0x0008
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x0a,
        .tilemapTop = 0x05,
        .width = 0x0a,
        .height = 0x0a,
        .paletteNum = 0x0a,
        .baseBlock = 0x0048
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x09,
        .tilemapTop = 0x05,
        .width = 0x0c,
        .height = 0x0a,
        .paletteNum = 0x0a,
        .baseBlock = 0x00ac
    }, DUMMY_WIN_TEMPLATE
};

const struct WindowTemplate gUnknown_840C5F0[] = {
    {
        .bg = 0x00,
        .tilemapLeft = 0x0b,
        .tilemapTop = 0x06,
        .width = 0x08,
        .height = 0x08,
        .paletteNum = 0x0a,
        .baseBlock = 0x0008
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x0a,
        .tilemapTop = 0x05,
        .width = 0x0a,
        .height = 0x0a,
        .paletteNum = 0x0a,
        .baseBlock = 0x0048
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x0a,
        .tilemapTop = 0x04,
        .width = 0x0a,
        .height = 0x0c,
        .paletteNum = 0x0a,
        .baseBlock = 0x00ac
    }, DUMMY_WIN_TEMPLATE
};

const struct WindowTemplate gUnknown_840C610[] = {
    {
        .bg = 0x00,
        .tilemapLeft = 0x0b,
        .tilemapTop = 0x06,
        .width = 0x08,
        .height = 0x08,
        .paletteNum = 0x0a,
        .baseBlock = 0x0008
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x0a,
        .tilemapTop = 0x05,
        .width = 0x0a,
        .height = 0x0a,
        .paletteNum = 0x0a,
        .baseBlock = 0x0048
    }, {
        .bg = 0x00,
        .tilemapLeft = 0x09,
        .tilemapTop = 0x04,
        .width = 0x0c,
        .height = 0x0c,
        .paletteNum = 0x0a,
        .baseBlock = 0x00ac
    }, DUMMY_WIN_TEMPLATE
};

const u16 gUnknown_840C630[] = INCBIN_U16("data/credits/unk_840C630.gbapal");
const u32 gUnknown_840C650[] = INCBIN_U32("data/credits/unk_840C650.8bpp.lz");
const u32 gUnknown_840CA54[] = INCBIN_U32("data/credits/unk_840CA54.bin.lz");
const u32 gUnknown_840CB8C[] = INCBIN_U32("data/credits/unk_840CB8C.bin.lz");
const u32 gUnknown_840D228[] = INCBIN_U32("data/credits/unk_840D228.bin.lz");
const u32 gUnknown_840E158[] = INCBIN_U32("data/credits/unk_840E158.bin.lz");
const u32 gUnknown_840E904[] = INCBIN_U32("data/credits/unk_840E904.bin.lz");
const u32 gUnknown_840F240[] = INCBIN_U32("data/credits/unk_840F240.bin.lz");
const u32 gUnknown_840F944[] = INCBIN_U32("data/credits/unk_840F944.bin.lz");
const u32 gUnknown_8410198[] = INCBIN_U32("data/credits/unk_8410198.bin.lz");
const u32 gUnknown_84105B4[] = INCBIN_U32("data/credits/unk_84105B4.bin.lz");

const u32 filler_8410AFC = 0xF0;

const u16 gUnknown_8410B00[] = INCBIN_U16("data/credits/unk_8410B20.gbapal");
const u8 gUnknown_8410B20[] = INCBIN_U8("data/credits/unk_8410B20.4bpp.lz");
const u8 gUnknown_8410B94[] = INCBIN_U8("data/credits/unk_8410B20.bin.lz");

const struct CompressedGraphicsHeader gUnknown_8410CDC[] = {
    {
        .tiles = gUnknown_8EAE548,
        .map = gUnknown_8EAE900,
        .palette = gUnknown_8EAE528
    }, {
        .tiles = gUnknown_8410B20,
        .map = gUnknown_8410B94,
        .palette = gUnknown_8410B00
    }
};

const struct UnkStruct_8410CF4 gUnknown_8410CF4[] = {
    { 1, 0, 16 },
    { 0, 0, 300 },
    { 0, 1, 300 },
    { 0, 2, 300 },
    { 0, 42, 60 },
    { 1, 1, 0 },
    { 0, 3, 211 },
    { 0, 4, 211 },
    { 0, 5, 211 },
    { 1, 2, 0 },
    { 0, 6, 211 },
    { 0, 7, 210 },
    { 0, 8, 210 },
    { 3, 0, 0 },
    { 2, 3, 16 },
    { 0, 9, 211 },
    { 0, 10, 210 },
    { 0, 11, 210 },
    { 1, 4, 16 },
    { 0, 12, 211 },
    { 0, 13, 210 },
    { 0, 14, 210 },
    { 1, 5, 16 },
    { 0, 15, 211 },
    { 0, 16, 210 },
    { 0, 17, 210 },
    { 3, 1, 0 },
    { 2, 6, 16 },
    { 0, 18, 211 },
    { 0, 19, 210 },
    { 0, 20, 210 },
    { 1, 7, 16 },
    { 0, 21, 221 },
    { 0, 22, 221 },
    { 0, 23, 221 },
    { 0, 24, 221 },
    { 0, 42, 51 },
    { 1, 8, 16 },
    { 0, 25, 211 },
    { 0, 26, 210 },
    { 0, 27, 210 },
    { 3, 2, 0 },
    { 2, 9, 16 },
    { 0, 28, 331 },
    { 0, 29, 331 },
    { 0, 30, 331 },
    { 1, 10, 16 },
    { 0, 31, 221 },
    { 0, 32, 221 },
    { 0, 33, 221 },
    { 0, 34, 221 },
    { 0, 42, 52 },
    { 1, 11, 16 },
    { 0, 41, 210 },
    { 0, 35, 210 },
    { 0, 36, 211 },
    { 3, 3, 0 },
    { 2, 12, 16 },
    { 0, 37, 221 },
    { 0, 40, 221 },
    { 0, 38, 221 },
    { 0, 39, 221 },
    { 0, 42, 52 },
    { 4, 0, 224 },
    { 4, 1, 240 },
    { 5, 0, 600 }
};

const ALIGNED(4) u8 gUnknown_8410FFC[3] = {0, 1, 2};
const ALIGNED(4) u8 gUnknown_8410E00[3] = {0, 5, 2};
const ALIGNED(4) u8 gUnknown_8410E04[3] = {0, 1, 2};

const struct WindowTemplate gUnknown_8410E08 = {
    .bg = 0,
    .tilemapLeft = 0,
    .tilemapTop = 4,
    .width = 30,
    .height = 12,
    .paletteNum = 15,
    .baseBlock = 0x008
};

const u16 gUnknown_8410E10[] = INCBIN_U16("data/credits/unk_8410E10.gbapal");
const u32 gUnknown_8410E30[] = INCBIN_U32("data/credits/unk_8410E30.4bpp.lz");
const u16 gUnknown_8411BF8[] = INCBIN_U16("data/credits/unk_8411BF8.gbapal");
const u32 gUnknown_8411C18[] = INCBIN_U32("data/credits/unk_8411C18.4bpp.lz");
const u16 gUnknown_84129A0[] = INCBIN_U16("data/credits/unk_84129A0.gbapal");
const u32 gUnknown_84129C0[] = INCBIN_U32("data/credits/unk_84129C0.4bpp.lz");
const u16 gUnknown_8413318[] = INCBIN_U16("data/credits/unk_8413318.gbapal");
const u32 gUnknown_8413338[] = INCBIN_U32("data/credits/unk_8413338.4bpp.lz");
const u16 gUnknown_8413854[] = INCBIN_U16("data/credits/unk_8413854.gbapal");
const u32 gUnknown_8413874[] = INCBIN_U32("data/credits/unk_8413874.4bpp.lz");
const u16 gUnknown_8413D98[] = INCBIN_U16("data/credits/unk_8413D98.gbapal");
const u32 gUnknown_8413DB8[] = INCBIN_U32("data/credits/unk_8413DB8.4bpp.lz");

const u16 gUnknown_841431C[][3] = {
    { 0, 3, 1 },
    { 0, 2, 0 },
    { 0, 3, 0 },
    { 1, 1, 2 },
    { 0, 0, 3 }
};

const struct OamData gOamData_841433C = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .mosaic = FALSE,
    .objMode = ST_OAM_OBJ_NORMAL,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .size = ST_OAM_SIZE_3,
    .tileNum = 0x000,
    .priority = 0,
    .paletteNum = 15
};

const union AnimCmd gAnimCmds_8414344[] = {
    ANIMCMD_FRAME(0x000, 8),
    ANIMCMD_FRAME(0x040, 8),
    ANIMCMD_FRAME(0x080, 8),
    ANIMCMD_FRAME(0x0C0, 8),
    ANIMCMD_FRAME(0x100, 8),
    ANIMCMD_FRAME(0x140, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const gAnimCmdTable_8414360[] = {
    gAnimCmds_8414344
};

const struct SpriteTemplate gUnknown_8414364 = {
    .oam = &gOamData_841433C,
    .anims = gAnimCmdTable_8414360,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct OamData gOamData_841437C = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .mosaic = FALSE,
    .objMode = ST_OAM_OBJ_NORMAL,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_H_RECTANGLE,
    .size = ST_OAM_SIZE_3,
    .tileNum = 0x000,
    .priority = 0,
    .paletteNum = 14
};

const union AnimCmd gAnimCmds_8414384[] = {
    ANIMCMD_FRAME(0x00, 8),
    ANIMCMD_FRAME(0x20, 8),
    ANIMCMD_FRAME(0x40, 8),
    ANIMCMD_FRAME(0x60, 8),
    ANIMCMD_FRAME(0x80, 8),
    ANIMCMD_FRAME(0xA0, 8),
    ANIMCMD_FRAME(0xC0, 8),
    ANIMCMD_FRAME(0xE0, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gAnimCmds_84143A8[] = {
    ANIMCMD_FRAME(0x00, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const gAnimCmdTable_84143B0[] = {
    gAnimCmds_8414384
};

const union AnimCmd *const gAnimCmdTable_84143B4[] = {
    gAnimCmds_84143A8
};

const struct SpriteTemplate gUnknown_84143B8 = {
    .oam = &gOamData_841437C,
    .anims = gAnimCmdTable_84143B0,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct SpriteTemplate gUnknown_84143D0 = {
    .oam = &gOamData_841437C,
    .anims = gAnimCmdTable_84143B4,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct CreditsOverworldCmd gUnknown_84143E8[] = {
    { 0x00fe, MAP_GROUP(ROUTE23), MAP_NUM(ROUTE23) },
    { 0x000b, 0x006b, 0x0001 },
    { 0x0000, 0x0001, 0x0500 }, // Scroll down
    { 0x00fd, 0x00fd, 0x00fd }
};

const struct CreditsOverworldCmd gUnknown_8414408[] = {
    { 0x00fe, MAP_GROUP(VIRIDIAN_CITY), MAP_NUM(VIRIDIAN_CITY) },
    { 0x001e, 0x0022, 0x0001 },
    { 0x0000, 0xffff, 0x0500 }, // Scroll up
    { 0x00fd, 0x00fd, 0x00fd }
};

const struct CreditsOverworldCmd gUnknown_8414428[] = {
    { 0x00fe, MAP_GROUP(PEWTER_CITY), MAP_NUM(PEWTER_CITY) },
    { 0x0014, 0x001a, 0x0001 },
    { 0x0000, 0xffff, 0x0500 }, // Scroll up
    { 0x00fd, 0x00fd, 0x00fd }
};

// Charizard

const struct CreditsOverworldCmd gUnknown_8414448[] = {
    { 0x00fe, MAP_GROUP(CERULEAN_CITY), MAP_NUM(CERULEAN_CITY) },
    { 0x0008, 0x0006, 0x0001 },
    { 0x0001, 0x0001, 0x0500 }, // Scroll right and down
    { 0x00fd, 0x00fd, 0x00fd }
};

const struct CreditsOverworldCmd gUnknown_8414468[] = {
    { 0x00fe, MAP_GROUP(ROUTE25), MAP_NUM(ROUTE25) },
    { 0x0019, 0x0006, 0x0001 },
    { 0x0001, 0x0000, 0x0500 }, // Scroll right
    { 0x00fd, 0x00fd, 0x00fd }
};

const struct CreditsOverworldCmd gUnknown_8414488[] = {
    { 0x00fe, MAP_GROUP(VERMILION_CITY), MAP_NUM(VERMILION_CITY) },
    { 0x0009, 0x0007, 0x0001 },
    { 0x0001, 0x0001, 0x0500 }, // Scroll right and down
    { 0x00fd, 0x00fd, 0x00fd }
};

// Venusaur

const struct CreditsOverworldCmd gUnknown_84144A8[] = {
    { 0x00fe, MAP_GROUP(ROUTE10), MAP_NUM(ROUTE10) },
    { 0x000b, 0x0044, 0x0001 },
    { 0x0000, 0x0001, 0x0500 }, // Scroll down
    { 0x00fd, 0x00fd, 0x00fd }
};

const struct CreditsOverworldCmd gUnknown_84144C8[] = {
    { 0x00fe, MAP_GROUP(CELADON_CITY), MAP_NUM(CELADON_CITY) },
    { 0x0030, 0x0010, 0x0001 },
    { 0xffff, 0x0000, 0x0500 }, // Scroll left
    { 0x00fd, 0x00fd, 0x00fd }
};

const struct CreditsOverworldCmd gUnknown_84144E8[] = {
    { 0x00fe, MAP_GROUP(SAFFRON_CITY_DUPLICATE), MAP_NUM(SAFFRON_CITY_DUPLICATE) },
    { 0x0027, 0x0005, 0x0001 },
    { 0x0000, 0x0001, 0x0500 }, // Scroll down
    { 0x00fd, 0x00fd, 0x00fd }
};

// Blastoise

const struct CreditsOverworldCmd gUnknown_8414508[] = {
    { 0x00fe, MAP_GROUP(ROUTE17), MAP_NUM(ROUTE17) },
    { 0x0007, 0x002b, 0x0001 },
    { 0x0000, 0x0001, 0x0500 }, // Scroll down
    { 0x00fd, 0x00fd, 0x00fd }
};

const struct CreditsOverworldCmd gUnknown_8414528[] = {
    { 0x00fe, MAP_GROUP(FUCHSIA_CITY), MAP_NUM(FUCHSIA_CITY) },
    { 0x001c, 0x0005, 0x0001 },
    { 0x0000, 0x0001, 0x0500 }, // Scroll down
    { 0x00fd, 0x00fd, 0x00fd }
};

const struct CreditsOverworldCmd gUnknown_8414548[] = {
    { 0x00fe, MAP_GROUP(CINNABAR_ISLAND), MAP_NUM(CINNABAR_ISLAND) },
    { 0x000d, 0x0011, 0x0001 },
    { 0x0000, 0xffff, 0x0500 }, // Scroll up
    { 0x00fd, 0x00fd, 0x00fd }
};

// Pikachu

const struct CreditsOverworldCmd gUnknown_8414568[] = {
    { 0x00fe, MAP_GROUP(ROUTE21_NORTH), MAP_NUM(ROUTE21_NORTH) },
    { 0x0008, 0x0014, 0x0001 },
    { 0x0000, 0xffff, 0x0500 }, // Scroll up
    { 0x00fd, 0x00fd, 0x00fd },
};

const struct CreditsOverworldCmd *const gUnknown_8414588[] = {
    gUnknown_84143E8,
    gUnknown_8414408,
    gUnknown_8414428,
    gUnknown_8414448,
    gUnknown_8414468,
    gUnknown_8414488,
    gUnknown_84144A8,
    gUnknown_84144C8,
    gUnknown_84144E8,
    gUnknown_8414508,
    gUnknown_8414528,
    gUnknown_8414548,
    gUnknown_8414568
};

const struct UnkStruct_84145BC gUnknown_84145BC[] = {
    { gUnknown_841D1D8, gUnknown_841D1E8, 0 },
    { gUnknown_841D200, gUnknown_841D224, 0 },
    { gUnknown_841D248, gUnknown_841D284, 0 },
    { gUnknown_841D2B4, gUnknown_841D2C8, 0 },
    { gUnknown_841D314, gUnknown_841D330, 1 },
    { gUnknown_841D370, gUnknown_841D388, 1 },
    { gUnknown_841D3C0, gUnknown_841D3D8, 1 },
    { gUnknown_841D3FC, gUnknown_841D414, 1 },
    { gUnknown_841D434, gUnknown_841D448, 0 },
    { gUnknown_841D45C, gUnknown_841D474, 0 },
    { gUnknown_841D4A4, gUnknown_841D4BC, 0 },
    { gUnknown_841D4F0, gUnknown_841D504, 1 },
    { gUnknown_841D524, gUnknown_841D548, 0 },
    { gUnknown_841D56C, gUnknown_841D588, 0 },
    { gUnknown_841D5B8, gUnknown_841D5CC, 0 },
    { gUnknown_841D5E4, gUnknown_841D5FC, 1 },
    { gUnknown_841D640, gUnknown_841D658, 0 },
    { gUnknown_841D698, gUnknown_841D6B0, 1 },
    { gUnknown_841D6EC, gUnknown_841D708, 0 },
    { gUnknown_841D74C, gUnknown_841D768, 0 },
    { gUnknown_841D784, gUnknown_841D79C, 0 },
    { gUnknown_841D7DC, gUnknown_841D7F4, 0 },
    { gUnknown_841D834, gUnknown_841D84C, 0 },
    { gUnknown_841D894, gUnknown_841D8B0, 0 },
    { gUnknown_841D8CC, gUnknown_841D8EC, 0 },
    { gUnknown_841D938, gUnknown_841D94C, 0 },
    { gUnknown_841D98C, gUnknown_841D9A0, 1 },
    { gUnknown_841D9C4, gUnknown_841D9D4, 0 },
    { gUnknown_841DA08, gUnknown_841DA24, 0 },
    { gUnknown_841DA3C, gUnknown_841DA58, 0 },
    { gUnknown_841DA6C, gUnknown_841DA88, 0 },
    { gUnknown_841DAA0, gUnknown_841DAC4, 0 },
    { gUnknown_841DAE8, gUnknown_841DB04, 0 },
    { gUnknown_841DB28, gUnknown_841DB3C, 0 },
    { gUnknown_841DB7C, gUnknown_841DBA4, 1 },
    { gUnknown_841DBDC, gUnknown_841DBF8, 1 },
    { gUnknown_841DC2C, gUnknown_841DC48, 1 },
    { gUnknown_841DCAC, gUnknown_841DCC8, 1 },
    { gUnknown_841DD08, gUnknown_841DD20, 0 },
    { gUnknown_841DD64, gUnknown_841DD7C, 0 },
    { gUnknown_841DDC8, gUnknown_841DDE4, 0 },
    { gUnknown_841DE24, gUnknown_841DE3C, 0 },
    { gUnknown_84161CD, gUnknown_84161CD, 0 }
};

void Special_Credits(void)
{
    gUnknown_203AB40 = AllocZeroed(sizeof(*gUnknown_203AB40));
    ResetTasks();
    gUnknown_203AB40->unk_02 = 0xFF;
    gUnknown_203AB40->unk_1D = 0;
    ResetSpriteData();
    SetMainCallback2(sub_80F39E8);
}

void sub_80F39E8(void)
{
    switch (sub_80F3BD0())
    {
    case 0:
        RunTasks();
        AnimateSprites();
        BuildOamBuffer();
        UpdatePaletteFade();
        break;
    case 1:
        if (gUnknown_203AB40->unk_1D & 1)
        {
            sub_80574A4();
        }
        else
        {
            RunTasks();
            AnimateSprites();
            BuildOamBuffer();
            UpdatePaletteFade();
        }
        gUnknown_203AB40->unk_1D++;
        break;
    case 2:
        FlagClear(0x4000);
        gUnknown_2031DD8 = 0;
        Free(gUnknown_203AB40);
        SoftReset(RESET_ALL);
        // noreturn
    }
}

void sub_80F3A74(void)
{
    ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN1_ON);
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
    SetGpuReg(REG_OFFSET_WININ, 0x1F3F);
    SetGpuReg(REG_OFFSET_WINOUT, 0x000E);
}

void sub_80F3AA4(void)
{
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_EFFECT_DARKEN);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(16, 4));
    SetGpuReg(REG_OFFSET_BLDY, 10);
}

void sub_80F3AC4(void)
{
    gUnknown_203AB40->unk_0A = AddWindow(&gUnknown_8410E08);
    FillWindowPixelBuffer(gUnknown_203AB40->unk_0A, PIXEL_FILL(0));
    PutWindowTilemap(gUnknown_203AB40->unk_0A);
    CopyWindowToVram(gUnknown_203AB40->unk_0A, 3);
    gUnknown_203AB40->unk_0B = TRUE;
}

void sub_80F3B04(void)
{
    if (gUnknown_203AB40->unk_0B)
    {
        RemoveWindow(gUnknown_203AB40->unk_0A);
        CleanupOverworldWindowsAndTilemaps();
        gUnknown_203AB40->unk_0B = FALSE;
    }
}

bool32 sub_80F3B2C(UNUSED u8 unused)
{
    switch (gUnknown_203AB40->unk_01)
    {
    case 0:
        FlagSet(0x4000);
        gUnknown_2031DD8 = 2;
        gUnknown_203AB40->unk_1C = 0;
        gUnknown_203AB40->unk_01++;
        // fallthrough
    case 1:
        if (!sub_805750C(&gUnknown_203AB40->unk_1C, gUnknown_8414588[gUnknown_203AB40->unk_09], 0))
            return FALSE;
        sub_80F3AC4();
        SetGpuReg(REG_OFFSET_WIN0H, 0xF0);
        SetGpuReg(REG_OFFSET_WIN0V, 0x247C);
        sub_80F3A74();
        sub_80F3AA4();
        Menu_LoadStdPalAt(0xF0);
        gPlttBufferUnfaded[0xFF] = RGB_BLACK;
        gPlttBufferFaded[0xFF] = RGB_BLACK;
        return TRUE;
    default:
        return FALSE;
    }
}

#ifdef NONMATCHING
s32 sub_80F3BD0(void)
{
    u16 win0v[2];

    switch (gUnknown_203AB40->unk_00)
    {
    case 0:
        sub_80F3A74();
        SetGpuReg(REG_OFFSET_WIN0H, 0x40);
        SetGpuReg(REG_OFFSET_WIN0V, 0x4F51);
        gUnknown_203AB40->unk_00 = 1;
        return 0;
    case 1:
        sub_80F3AA4();
        sub_80F3AC4();
        Menu_LoadStdPalAt(0xF0);
        gPlttBufferUnfaded[0xFF] = RGB_BLACK;
        gPlttBufferFaded[0xFF] = RGB_BLACK;
        gUnknown_203AB40->unk_00 = 2;
        return 0;
    case 2:
        win0v[0] = GetGpuReg(REG_OFFSET_WIN0V) >> 8;
        win0v[1] = GetGpuReg(REG_OFFSET_WIN0V) & 0xFF;
        if (win0v[0] == 0x24)
        {
            gUnknown_203AB40->unk_04 = 0;
            gUnknown_203AB40->unk_00 = 3;
        }
        else
        {
            win0v[0]--;
            win0v[1]++;
            SetGpuReg(REG_OFFSET_WIN0V, win0v[1] + (win0v[0] << 8));
        }
        return 0;
    case 3:
        if (gUnknown_203AB40->unk_04 == 0)
        {
            sub_80F4930(0);
            gUnknown_203AB40->unk_04 = 100;
            gUnknown_203AB40->unk_00 = 4;
        }
        else
        {
            gUnknown_203AB40->unk_04--;
        }
        return 0;
    case 4:
        if (gUnknown_203AB40->unk_04 == 0)
        {
            gUnknown_203AB40->unk_04 = 360;
            AddTextPrinterParameterized4(gUnknown_203AB40->unk_0A, 1, 0x08, 0x29, 1, 2, gUnknown_8410E00, 0, gUnknown_841D198);
            gUnknown_203AB40->unk_00 = 5;
        }
        else
        {
            gUnknown_203AB40->unk_04--;
        }
        return 0;
    case 5:
        if (gUnknown_203AB40->unk_04 == 0)
        {
            sub_80F3B04();
            gUnknown_203AB40->unk_00 = 6;
            gUnknown_203AB40->unk_04 = 0;
            gUnknown_203AB40->unk_06 = 0;
        }
        else
        {
            gUnknown_203AB40->unk_04--;
        }
        return 0;
    case 6:
        if (gUnknown_203AB40->unk_04 != 0)
        {
            gUnknown_203AB40->unk_04--;
            return gUnknown_203AB40->unk_08;
        }
        else
        {
            switch (gUnknown_203AB40->unk_06)
            {
            case 0:
                BeginNormalPaletteFade(0x00008000, 0, 0, 16, RGB_BLACK);
                gUnknown_203AB40->unk_00 = 7;
                FillWindowPixelBuffer(gUnknown_203AB40->unk_0A, PIXEL_FILL(0));
                return gUnknown_203AB40->unk_08;
            case 1:
                gUnknown_203AB40->unk_00 = 10;
                gUnknown_203AB40->unk_09 = gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk1;
                sub_807A944(1, 0, 0x3FFFFFFF);
                break;
            case 2:
                gUnknown_203AB40->unk_00 = 12;
                gUnknown_203AB40->unk_09 = gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk1;
                break;
            case 3:
                gUnknown_203AB40->unk_00 = 13;
                gUnknown_203AB40->unk_09 = gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk1;
                fade_screen(1, 0);
                break;
            case 4:
                gUnknown_203AB40->unk_00 = 15;
                gUnknown_203AB40->unk_09 = gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk1;
                BeginNormalPaletteFade(0xFFFFFFFF, 4, 0, 16, RGB_BLACK);
                break;
            case 5:
                gUnknown_203AB40->unk_00 = 17;
                break;
            }
            gUnknown_203AB40->unk_04 = gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk2;
            gUnknown_203AB40->unk_06++;
        }
        return 0;
    case 7:
        if (!gPaletteFade.active)
        {
            win0v[0] = gUnknown_84145BC[gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk1].unk_8; // unused
            AddTextPrinterParameterized4(gUnknown_203AB40->unk_0A, 1, 2, 6, 0, 0, gUnknown_8410E00, -1, gUnknown_84145BC[gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk1].unk_0);
            gUnknown_203AB40->unk_00 = 8;
        }
        return gUnknown_203AB40->unk_08;
    case 8:
        win0v[0] = gUnknown_84145BC[gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk1].unk_8;
        AddTextPrinterParameterized4(gUnknown_203AB40->unk_0A, 1, 2, 6, 0, 0, gUnknown_8410E00, -1, gUnknown_84145BC[gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk1].unk_4);
        gUnknown_203AB40->unk_00 = 9;
        return gUnknown_203AB40->unk_08;
    case 9:
        CopyWindowToVram(gUnknown_203AB40->unk_0A, 2);
        gUnknown_203AB40->unk_04 = gUnknown_8410CF4[gUnknown_203AB40->unk_06].unk2;
        gUnknown_203AB40->unk_06++;
        BeginNormalPaletteFade(0x00008000, 0, 16, 0, RGB_BLACK);
        gUnknown_203AB40->unk_00 = 6;
        return gUnknown_203AB40->unk_08;
    case 10:
        if (!gPaletteFade.active)
        {
            sub_80F3B04();
            gUnknown_203AB40->unk_01 = 0;
            gUnknown_203AB40->unk_00 = 11;
        }
        return 0;
    case 11:
        if (sub_80F3B2C(gUnknown_203AB40->unk_09))
        {
            gUnknown_203AB40->unk_08 = 1;
            gUnknown_203AB40->unk_00 = 6;
        }
        return 0;
    case 12:
        if (!gPaletteFade.active)
        {
            sub_80F3B04();
            gUnknown_203AB40->unk_01 = 0;
            while (sub_80F3B2C(gUnknown_203AB40->unk_09))
            {}
            switch (gUnknown_203AB40->unk_09)
            {
            default:
                win0v[0] = 1;
                break;
            case 6:
                win0v[0] = 2;
                break;
            case 9:
                win0v[0] = 3;
                break;
            case 12:
                win0v[0] = 4;
                break;
            }
            sub_80F4930(win0v[0]);
            gUnknown_203AB40->unk_08 = 1;
            gUnknown_203AB40->unk_00 = 6;
        }
        return 0;
    case 13:
        if (!gPaletteFade.active)
        {
            sub_80F48D0();
            sub_80F3B04();
            gUnknown_203AB40->unk_01 = 0;
            gUnknown_203AB40->unk_08 = 0;
            gUnknown_203AB40->unk_00 = 14;
        }
        return 0;
    case 14:
        if (sub_80F4328())
        {
            gUnknown_203AB40->unk_00 = 6;
        }
        return 0;
    case 15:
        if (!gPaletteFade.active)
        {
            sub_80F3B04();
            gUnknown_203AB40->unk_01 = 0;
            gUnknown_203AB40->unk_08 = 0;
            gUnknown_203AB40->unk_00 = 16;
        }
        return 0;
    case 16:
        if (sub_80F4674())
        {
            gUnknown_203AB40->unk_00 = 6;
        }
        return 0;
    case 17:
        if (JOY_NEW(A_BUTTON))
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_WHITE);
            gUnknown_203AB40->unk_00 = 18;
        }
        else if (gUnknown_203AB40->unk_04 == 0)
        {
            gUnknown_203AB40->unk_00 = 18;
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_WHITE);
        }
        else
            gUnknown_203AB40->unk_04--;
        return 0;
    case 18:
        if (!gPaletteFade.active)
            sub_80F3B04();
    default:
        return 2;
    }
}
#else
NAKED
s32 sub_80F3BD0(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tsub sp, 0x24\n"
                "\tldr r1, _080F3BEC @ =gUnknown_203AB40\n"
                "\tldr r0, [r1]\n"
                "\tldrb r0, [r0]\n"
                "\tadds r7, r1, 0\n"
                "\tcmp r0, 0x12\n"
                "\tbls _080F3BE2\n"
                "\tb _080F4180_default_return2\n"
                "_080F3BE2:\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _080F3BF0 @ =_080F3BF4\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_080F3BEC: .4byte gUnknown_203AB40\n"
                "_080F3BF0: .4byte _080F3BF4\n"
                "\t.align 2, 0\n"
                "_080F3BF4:\n"
                "\t.4byte _080F3C40_case00\n"
                "\t.4byte _080F3C64_case01\n"
                "\t.4byte _080F3C98_case02\n"
                "\t.4byte _080F3CEE_case03\n"
                "\t.4byte _080F3D0A_case04\n"
                "\t.4byte _080F3D48_case05\n"
                "\t.4byte _080F3D6A_case06\n"
                "\t.4byte _080F3EB4_case07\n"
                "\t.4byte _080F3F24_case08\n"
                "\t.4byte _080F3F84_case09\n"
                "\t.4byte _080F3FC4_case0A\n"
                "\t.4byte _080F3FF0_case0B\n"
                "\t.4byte _080F400A_case0C\n"
                "\t.4byte _080F4084_case0D\n"
                "\t.4byte _080F40B8_case0E\n"
                "\t.4byte _080F40D0_case0F\n"
                "\t.4byte _080F4100_case10\n"
                "\t.4byte _080F4118_case11\n"
                "\t.4byte _080F4170_case12\n"
                "_080F3C40_case00:\n"
                "\tbl sub_80F3A74\n"
                "\tmovs r0, 0x40\n"
                "\tmovs r1, 0xF0\n"
                "\tbl SetGpuReg\n"
                "\tldr r1, _080F3C5C @ =0x00004f51\n"
                "\tmovs r0, 0x44\n"
                "\tbl SetGpuReg\n"
                "\tldr r0, _080F3C60 @ =gUnknown_203AB40\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x1\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F3C5C: .4byte 0x00004f51\n"
                "_080F3C60: .4byte gUnknown_203AB40\n"
                "_080F3C64_case01:\n"
                "\tbl sub_80F3AA4\n"
                "\tbl sub_80F3AC4\n"
                "\tmovs r0, 0xF0\n"
                "\tbl Menu_LoadStdPalAt\n"
                "\tldr r0, _080F3C8C @ =gPlttBufferUnfaded\n"
                "\tmovs r2, 0xFF\n"
                "\tlsls r2, 1\n"
                "\tadds r0, r2\n"
                "\tmovs r1, 0\n"
                "\tstrh r1, [r0]\n"
                "\tldr r0, _080F3C90 @ =gPlttBufferFaded\n"
                "\tadds r0, r2\n"
                "\tstrh r1, [r0]\n"
                "\tldr r0, _080F3C94 @ =gUnknown_203AB40\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x2\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F3C8C: .4byte gPlttBufferUnfaded\n"
                "_080F3C90: .4byte gPlttBufferFaded\n"
                "_080F3C94: .4byte gUnknown_203AB40\n"
                "_080F3C98_case02:\n"
                "\tmovs r0, 0x44\n"
                "\tbl GetGpuReg\n"
                "\tadd r1, sp, 0x14\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 24\n"
                "\tstrh r0, [r1]\n"
                "\tmovs r0, 0x44\n"
                "\tbl GetGpuReg\n"
                "\tadd r2, sp, 0x14\n"
                "\tmovs r1, 0xFF\n"
                "\tands r1, r0\n"
                "\tstrh r1, [r2, 0x2]\n"
                "\tadds r0, r2, 0\n"
                "\tldrh r0, [r0]\n"
                "\tcmp r0, 0x24\n"
                "\tbne _080F3CCC\n"
                "\tldr r0, _080F3CC8 @ =gUnknown_203AB40\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0\n"
                "\tstrh r0, [r1, 0x4]\n"
                "\tmovs r0, 0x3\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F3CC8: .4byte gUnknown_203AB40\n"
                "_080F3CCC:\n"
                "\tadd r1, sp, 0x14\n"
                "\tsubs r0, 0x1\n"
                "\tstrh r0, [r1]\n"
                "\tadds r2, r1, 0\n"
                "\tadds r0, r1, 0\n"
                "\tldrh r1, [r0, 0x2]\n"
                "\tadds r1, 0x1\n"
                "\tstrh r1, [r2, 0x2]\n"
                "\tldrh r0, [r0]\n"
                "\tlsls r0, 8\n"
                "\tadds r1, r0\n"
                "\tlsls r1, 16\n"
                "\tlsrs r1, 16\n"
                "\tmovs r0, 0x44\n"
                "\tbl SetGpuReg\n"
                "\tb _080F3D06_return0\n"
                "_080F3CEE_case03:\n"
                "\tldr r1, [r7]\n"
                "\tldrh r0, [r1, 0x4]\n"
                "\tcmp r0, 0\n"
                "\tbne _080F3D52_decfield4_return0\n"
                "\tmovs r0, 0\n"
                "\tbl sub_80F4930\n"
                "\tldr r0, [r7]\n"
                "\tmovs r1, 0x64\n"
                "\tstrh r1, [r0, 0x4]\n"
                "\tmovs r1, 0x4\n"
                "\tstrb r1, [r0]\n"
                "_080F3D06_return0:\n"
                "\tmovs r0, 0\n"
                "\tb _080F4182_return\n"
                "_080F3D0A_case04:\n"
                "\tldr r1, [r7]\n"
                "\tldrh r0, [r1, 0x4]\n"
                "\tadds r2, r0, 0\n"
                "\tcmp r2, 0\n"
                "\tbne _080F3D52_decfield4_return0\n"
                "\tmovs r0, 0xB4\n"
                "\tlsls r0, 1\n"
                "\tstrh r0, [r1, 0x4]\n"
                "\tldrb r0, [r1, 0xA]\n"
                "\tmovs r1, 0x1\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0x2\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tldr r1, _080F3D40 @ =gUnknown_8410E00\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tstr r2, [sp, 0xC]\n"
                "\tldr r1, _080F3D44 @ =gUnknown_841D198\n"
                "\tstr r1, [sp, 0x10]\n"
                "\tmovs r1, 0x1\n"
                "\tmovs r2, 0x8\n"
                "\tmovs r3, 0x29\n"
                "\tbl AddTextPrinterParameterized4\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x5\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F3D40: .4byte gUnknown_8410E00\n"
                "_080F3D44: .4byte gUnknown_841D198\n"
                "_080F3D48_case05:\n"
                "\tldr r1, [r7]\n"
                "\tldrh r0, [r1, 0x4]\n"
                "\tadds r4, r0, 0\n"
                "\tcmp r4, 0\n"
                "\tbeq _080F3D58\n"
                "_080F3D52_decfield4_return0:\n"
                "\tsubs r0, 0x1\n"
                "\tstrh r0, [r1, 0x4]\n"
                "\tb _080F3D06_return0\n"
                "_080F3D58:\n"
                "\tbl sub_80F3B04\n"
                "\tldr r0, [r7]\n"
                "\tmovs r1, 0x6\n"
                "\tstrb r1, [r0]\n"
                "\tldr r0, [r7]\n"
                "\tstrh r4, [r0, 0x4]\n"
                "\tstrh r4, [r0, 0x6]\n"
                "\tb _080F3D06_return0\n"
                "_080F3D6A_case06:\n"
                "\tldr r2, [r7]\n"
                "\tldrh r0, [r2, 0x4]\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F3D7A\n"
                "\tsubs r0, 0x1\n"
                "\tstrh r0, [r2, 0x4]\n"
                "\tldrb r0, [r2, 0x8]\n"
                "\tb _080F4182_return\n"
                "_080F3D7A:\n"
                "\tldr r1, _080F3D94 @ =gUnknown_8410CF4\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r0, 0x5\n"
                "\tbls _080F3D8A\n"
                "\tb _080F3E94\n"
                "_080F3D8A:\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _080F3D98 @ =_080F3D9C\n"
                "\tadds r0, r1\n"
                "\tldr r0, [r0]\n"
                "\tmov pc, r0\n"
                "\t.align 2, 0\n"
                "_080F3D94: .4byte gUnknown_8410CF4\n"
                "_080F3D98: .4byte _080F3D9C\n"
                "\t.align 2, 0\n"
                "_080F3D9C:\n"
                "\t.4byte _080F3DB4\n"
                "\t.4byte _080F3DE0\n"
                "\t.4byte _080F3E10\n"
                "\t.4byte _080F3E30\n"
                "\t.4byte _080F3E58\n"
                "\t.4byte _080F3E8C\n"
                "_080F3DB4:\n"
                "\tmovs r0, 0x80\n"
                "\tlsls r0, 8\n"
                "\tmovs r1, 0\n"
                "\tstr r1, [sp]\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x10\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tldr r4, _080F3DDC @ =gUnknown_203AB40\n"
                "\tldr r1, [r4]\n"
                "\tmovs r0, 0x7\n"
                "\tstrb r0, [r1]\n"
                "\tldr r0, [r4]\n"
                "\tldrb r0, [r0, 0xA]\n"
                "\tmovs r1, 0\n"
                "\tbl FillWindowPixelBuffer\n"
                "\tldr r0, [r4]\n"
                "\tldrb r0, [r0, 0x8]\n"
                "\tb _080F4182_return\n"
                "\t.align 2, 0\n"
                "_080F3DDC: .4byte gUnknown_203AB40\n"
                "_080F3DE0:\n"
                "\tldr r2, _080F3E04 @ =gUnknown_203AB40\n"
                "\tldr r1, [r2]\n"
                "\tmovs r0, 0xA\n"
                "\tstrb r0, [r1]\n"
                "\tldr r2, [r2]\n"
                "\tldr r1, _080F3E08 @ =gUnknown_8410CF4\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0, 0x1]\n"
                "\tstrb r0, [r2, 0x9]\n"
                "\tldr r2, _080F3E0C @ =0x3fffffff\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r1, 0\n"
                "\tbl sub_807A944\n"
                "\tb _080F3E94\n"
                "\t.align 2, 0\n"
                "_080F3E04: .4byte gUnknown_203AB40\n"
                "_080F3E08: .4byte gUnknown_8410CF4\n"
                "_080F3E0C: .4byte 0x3fffffff\n"
                "_080F3E10:\n"
                "\tldr r2, _080F3E28 @ =gUnknown_203AB40\n"
                "\tldr r1, [r2]\n"
                "\tmovs r0, 0xC\n"
                "\tstrb r0, [r1]\n"
                "\tldr r2, [r2]\n"
                "\tldr r1, _080F3E2C @ =gUnknown_8410CF4\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0, 0x1]\n"
                "\tstrb r0, [r2, 0x9]\n"
                "\tb _080F3E94\n"
                "\t.align 2, 0\n"
                "_080F3E28: .4byte gUnknown_203AB40\n"
                "_080F3E2C: .4byte gUnknown_8410CF4\n"
                "_080F3E30:\n"
                "\tldr r2, _080F3E50 @ =gUnknown_203AB40\n"
                "\tldr r1, [r2]\n"
                "\tmovs r0, 0xD\n"
                "\tstrb r0, [r1]\n"
                "\tldr r2, [r2]\n"
                "\tldr r1, _080F3E54 @ =gUnknown_8410CF4\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0, 0x1]\n"
                "\tstrb r0, [r2, 0x9]\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r1, 0\n"
                "\tbl fade_screen\n"
                "\tb _080F3E94\n"
                "\t.align 2, 0\n"
                "_080F3E50: .4byte gUnknown_203AB40\n"
                "_080F3E54: .4byte gUnknown_8410CF4\n"
                "_080F3E58:\n"
                "\tldr r2, _080F3E84 @ =gUnknown_203AB40\n"
                "\tldr r1, [r2]\n"
                "\tmovs r3, 0\n"
                "\tmovs r0, 0xF\n"
                "\tstrb r0, [r1]\n"
                "\tldr r2, [r2]\n"
                "\tldr r1, _080F3E88 @ =gUnknown_8410CF4\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tldrb r0, [r0, 0x1]\n"
                "\tstrb r0, [r2, 0x9]\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tstr r3, [sp]\n"
                "\tmovs r1, 0x4\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x10\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tb _080F3E94\n"
                "\t.align 2, 0\n"
                "_080F3E84: .4byte gUnknown_203AB40\n"
                "_080F3E88: .4byte gUnknown_8410CF4\n"
                "_080F3E8C:\n"
                "\tldr r0, _080F3EAC @ =gUnknown_203AB40\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x11\n"
                "\tstrb r0, [r1]\n"
                "_080F3E94:\n"
                "\tldr r0, _080F3EAC @ =gUnknown_203AB40\n"
                "\tldr r1, [r0]\n"
                "\tldr r2, _080F3EB0 @ =gUnknown_8410CF4\n"
                "\tldrh r0, [r1, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r2\n"
                "\tldrh r0, [r0, 0x2]\n"
                "\tstrh r0, [r1, 0x4]\n"
                "\tldrh r0, [r1, 0x6]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r1, 0x6]\n"
                "\tb _080F3D06_return0\n"
                "\t.align 2, 0\n"
                "_080F3EAC: .4byte gUnknown_203AB40\n"
                "_080F3EB0: .4byte gUnknown_8410CF4\n"
                "_080F3EB4_case07:\n"
                "\tldr r0, _080F3F14 @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r6, r0, 24\n"
                "\tcmp r6, 0\n"
                "\tbne _080F3FBA_returnfield8\n"
                "\tadd r3, sp, 0x14\n"
                "\tldr r5, _080F3F18 @ =gUnknown_84145BC\n"
                "\tldr r4, _080F3F1C @ =gUnknown_8410CF4\n"
                "\tldr r2, [r7]\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r4\n"
                "\tldrb r1, [r0, 0x1]\n"
                "\tlsls r0, r1, 1\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r5\n"
                "\tldrb r0, [r0, 0x8]\n"
                "\tstrh r0, [r3]\n"
                "\tldrb r0, [r2, 0xA]\n"
                "\tstr r6, [sp]\n"
                "\tstr r6, [sp, 0x4]\n"
                "\tldr r1, _080F3F20 @ =gUnknown_8410E00\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tmovs r1, 0x1\n"
                "\tnegs r1, r1\n"
                "\tstr r1, [sp, 0xC]\n"
                "\tldrh r1, [r2, 0x6]\n"
                "\tlsls r1, 2\n"
                "\tadds r1, r4\n"
                "\tldrb r2, [r1, 0x1]\n"
                "\tlsls r1, r2, 1\n"
                "\tadds r1, r2\n"
                "\tlsls r1, 2\n"
                "\tadds r1, r5\n"
                "\tldr r1, [r1]\n"
                "\tstr r1, [sp, 0x10]\n"
                "\tmovs r1, 0x1\n"
                "\tmovs r2, 0x2\n"
                "\tmovs r3, 0x6\n"
                "\tbl AddTextPrinterParameterized4\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x8\n"
                "\tb _080F3FB8_setfield0_returnfield8\n"
                "\t.align 2, 0\n"
                "_080F3F14: .4byte gPaletteFade\n"
                "_080F3F18: .4byte gUnknown_84145BC\n"
                "_080F3F1C: .4byte gUnknown_8410CF4\n"
                "_080F3F20: .4byte gUnknown_8410E00\n"
                "_080F3F24_case08:\n"
                "\tadd r4, sp, 0x14\n"
                "\tldr r3, _080F3F78 @ =gUnknown_84145BC\n"
                "\tldr r5, _080F3F7C @ =gUnknown_8410CF4\n"
                "\tldr r2, [r7]\n"
                "\tldrh r0, [r2, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r5\n"
                "\tldrb r1, [r0, 0x1]\n"
                "\tlsls r0, r1, 1\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r3\n"
                "\tldrb r0, [r0, 0x8]\n"
                "\tmovs r1, 0\n"
                "\tstrh r0, [r4]\n"
                "\tldrb r0, [r2, 0xA]\n"
                "\tstr r1, [sp]\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tldr r1, _080F3F80 @ =gUnknown_8410E04\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tmovs r1, 0x1\n"
                "\tnegs r1, r1\n"
                "\tstr r1, [sp, 0xC]\n"
                "\tldrh r1, [r2, 0x6]\n"
                "\tlsls r1, 2\n"
                "\tadds r1, r5\n"
                "\tldrb r2, [r1, 0x1]\n"
                "\tlsls r1, r2, 1\n"
                "\tadds r1, r2\n"
                "\tlsls r1, 2\n"
                "\tadds r3, 0x4\n"
                "\tadds r1, r3\n"
                "\tldr r1, [r1]\n"
                "\tstr r1, [sp, 0x10]\n"
                "\tmovs r1, 0x2\n"
                "\tmovs r2, 0x8\n"
                "\tmovs r3, 0x6\n"
                "\tbl AddTextPrinterParameterized4\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x9\n"
                "\tb _080F3FB8_setfield0_returnfield8\n"
                "\t.align 2, 0\n"
                "_080F3F78: .4byte gUnknown_84145BC\n"
                "_080F3F7C: .4byte gUnknown_8410CF4\n"
                "_080F3F80: .4byte gUnknown_8410E04\n"
                "_080F3F84_case09:\n"
                "\tldr r0, [r7]\n"
                "\tldrb r0, [r0, 0xA]\n"
                "\tmovs r1, 0x2\n"
                "\tbl CopyWindowToVram\n"
                "\tldr r1, [r7]\n"
                "\tldr r2, _080F3FC0 @ =gUnknown_8410CF4\n"
                "\tldrh r0, [r1, 0x6]\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r2\n"
                "\tldrh r0, [r0, 0x2]\n"
                "\tmovs r2, 0\n"
                "\tstrh r0, [r1, 0x4]\n"
                "\tldrh r0, [r1, 0x6]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r1, 0x6]\n"
                "\tmovs r0, 0x80\n"
                "\tlsls r0, 8\n"
                "\tstr r2, [sp]\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0x10\n"
                "\tmovs r3, 0\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x6\n"
                "_080F3FB8_setfield0_returnfield8:\n"
                "\tstrb r0, [r1]\n"
                "_080F3FBA_returnfield8:\n"
                "\tldr r0, [r7]\n"
                "\tldrb r0, [r0, 0x8]\n"
                "\tb _080F4182_return\n"
                "\t.align 2, 0\n"
                "_080F3FC0: .4byte gUnknown_8410CF4\n"
                "_080F3FC4_case0A:\n"
                "\tldr r0, _080F3FE8 @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tcmp r4, 0\n"
                "\tbeq _080F3FD6\n"
                "\tb _080F3D06_return0\n"
                "_080F3FD6:\n"
                "\tbl sub_80F3B04\n"
                "\tldr r1, _080F3FEC @ =gUnknown_203AB40\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x1]\n"
                "\tldr r1, [r1]\n"
                "\tmovs r0, 0xB\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F3FE8: .4byte gPaletteFade\n"
                "_080F3FEC: .4byte gUnknown_203AB40\n"
                "_080F3FF0_case0B:\n"
                "\tldr r0, [r7]\n"
                "\tldrb r0, [r0, 0x9]\n"
                "\tbl sub_80F3B2C\n"
                "\tcmp r0, 0\n"
                "\tbne _080F3FFE\n"
                "\tb _080F3D06_return0\n"
                "_080F3FFE:\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x1\n"
                "\tstrb r0, [r1, 0x8]\n"
                "\tldr r1, [r7]\n"
                "\tmovs r0, 0x6\n"
                "\tb _080F413C_setfield0_return0\n"
                "_080F400A_case0C:\n"
                "\tldr r0, _080F4050 @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tcmp r4, 0\n"
                "\tbeq _080F401C\n"
                "\tb _080F3D06_return0\n"
                "_080F401C:\n"
                "\tbl sub_80F3B04\n"
                "\tldr r1, _080F4054 @ =gUnknown_203AB40\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x1]\n"
                "\tadds r4, r1, 0\n"
                "_080F4028:\n"
                "\tldr r0, [r4]\n"
                "\tldrb r0, [r0, 0x9]\n"
                "\tbl sub_80F3B2C\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F4028\n"
                "\tldr r0, _080F4054 @ =gUnknown_203AB40\n"
                "\tldr r0, [r0]\n"
                "\tldrb r0, [r0, 0x9]\n"
                "\tcmp r0, 0x6\n"
                "\tbeq _080F4058\n"
                "\tcmp r0, 0x6\n"
                "\tble _080F404A\n"
                "\tcmp r0, 0x9\n"
                "\tbeq _080F405E\n"
                "\tcmp r0, 0xC\n"
                "\tbeq _080F4064\n"
                "_080F404A:\n"
                "\tadd r1, sp, 0x14\n"
                "\tmovs r0, 0x1\n"
                "\tb _080F4068\n"
                "\t.align 2, 0\n"
                "_080F4050: .4byte gPaletteFade\n"
                "_080F4054: .4byte gUnknown_203AB40\n"
                "_080F4058:\n"
                "\tadd r1, sp, 0x14\n"
                "\tmovs r0, 0x2\n"
                "\tb _080F4068\n"
                "_080F405E:\n"
                "\tadd r1, sp, 0x14\n"
                "\tmovs r0, 0x3\n"
                "\tb _080F4068\n"
                "_080F4064:\n"
                "\tadd r1, sp, 0x14\n"
                "\tmovs r0, 0x4\n"
                "_080F4068:\n"
                "\tstrh r0, [r1]\n"
                "\tadd r0, sp, 0x14\n"
                "\tldrb r0, [r0]\n"
                "\tbl sub_80F4930\n"
                "\tldr r2, _080F4080 @ =gUnknown_203AB40\n"
                "\tldr r1, [r2]\n"
                "\tmovs r0, 0x1\n"
                "\tstrb r0, [r1, 0x8]\n"
                "\tldr r1, [r2]\n"
                "\tmovs r0, 0x6\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F4080: .4byte gUnknown_203AB40\n"
                "_080F4084_case0D:\n"
                "\tldr r0, _080F40B0 @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tcmp r4, 0\n"
                "\tbeq _080F4096\n"
                "\tb _080F3D06_return0\n"
                "_080F4096:\n"
                "\tbl sub_80F48D0\n"
                "\tbl sub_80F3B04\n"
                "\tldr r1, _080F40B4 @ =gUnknown_203AB40\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x1]\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x8]\n"
                "\tldr r1, [r1]\n"
                "\tmovs r0, 0xE\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F40B0: .4byte gPaletteFade\n"
                "_080F40B4: .4byte gUnknown_203AB40\n"
                "_080F40B8_case0E:\n"
                "\tbl sub_80F4328\n"
                "\tcmp r0, 0\n"
                "\tbne _080F40C2\n"
                "\tb _080F3D06_return0\n"
                "_080F40C2:\n"
                "\tldr r0, _080F40CC @ =gUnknown_203AB40\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x6\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F40CC: .4byte gUnknown_203AB40\n"
                "_080F40D0_case0F:\n"
                "\tldr r0, _080F40F8 @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r4, r0, 24\n"
                "\tcmp r4, 0\n"
                "\tbeq _080F40E2\n"
                "\tb _080F3D06_return0\n"
                "_080F40E2:\n"
                "\tbl sub_80F3B04\n"
                "\tldr r1, _080F40FC @ =gUnknown_203AB40\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x1]\n"
                "\tldr r0, [r1]\n"
                "\tstrb r4, [r0, 0x8]\n"
                "\tldr r1, [r1]\n"
                "\tmovs r0, 0x10\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F40F8: .4byte gPaletteFade\n"
                "_080F40FC: .4byte gUnknown_203AB40\n"
                "_080F4100_case10:\n"
                "\tbl sub_80F4674\n"
                "\tcmp r0, 0\n"
                "\tbne _080F410A\n"
                "\tb _080F3D06_return0\n"
                "_080F410A:\n"
                "\tldr r0, _080F4114 @ =gUnknown_203AB40\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x6\n"
                "\tb _080F413C_setfield0_return0\n"
                "\t.align 2, 0\n"
                "_080F4114: .4byte gUnknown_203AB40\n"
                "_080F4118_case11:\n"
                "\tldr r0, _080F4140 @ =gMain\n"
                "\tldrh r1, [r0, 0x2E]\n"
                "\tmovs r0, 0x1\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F414C\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tldr r1, _080F4144 @ =0x00007fff\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x10\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tldr r0, _080F4148 @ =gUnknown_203AB40\n"
                "\tldr r1, [r0]\n"
                "\tmovs r0, 0x12\n"
                "_080F413C_setfield0_return0:\n"
                "\tstrb r0, [r1]\n"
                "\tb _080F3D06_return0\n"
                "\t.align 2, 0\n"
                "_080F4140: .4byte gMain\n"
                "_080F4144: .4byte 0x00007fff\n"
                "_080F4148: .4byte gUnknown_203AB40\n"
                "_080F414C:\n"
                "\tldr r1, [r7]\n"
                "\tldrh r0, [r1, 0x4]\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F4156\n"
                "\tb _080F3D52_decfield4_return0\n"
                "_080F4156:\n"
                "\tmovs r0, 0x12\n"
                "\tstrb r0, [r1]\n"
                "\tsubs r0, 0x13\n"
                "\tldr r1, _080F416C @ =0x00007fff\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x10\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tb _080F3D06_return0\n"
                "\t.align 2, 0\n"
                "_080F416C: .4byte 0x00007fff\n"
                "_080F4170_case12:\n"
                "\tldr r0, _080F418C @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbne _080F4180_default_return2\n"
                "\tbl sub_80F3B04\n"
                "_080F4180_default_return2:\n"
                "\tmovs r0, 0x2\n"
                "_080F4182_return:\n"
                "\tadd sp, 0x24\n"
                "\tpop {r4-r7}\n"
                "\tpop {r1}\n"
                "\tbx r1\n"
                "\t.align 2, 0\n"
                "_080F418C: .4byte gPaletteFade");
}
#endif //NONMATCHING

void sub_80F4190(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_80F41A4(u8 a0)
{
    switch (a0)
    {
    case 0:
        InitWindows(gUnknown_840C5B0);
        FillWindowPixelBuffer(0, PIXEL_FILL(0));
        sub_810C228(SPECIES_CHARIZARD, 8, 0, TRUE, 10, 0);
        CopyToWindowPixelBuffer(1, (const void *)gUnknown_840CB8C, 0, 0);
        CopyToWindowPixelBuffer(2, (const void *)gUnknown_840D228, 0, 0);
        break;
    case 1:
        InitWindows(gUnknown_840C5D0);
        FillWindowPixelBuffer(0, PIXEL_FILL(0));
        sub_810C228(SPECIES_VENUSAUR, 8, 0, TRUE, 10, 0);
        CopyToWindowPixelBuffer(1, (const void *)gUnknown_840E158, 0, 0);
        CopyToWindowPixelBuffer(2, (const void *)gUnknown_840E904, 0, 0);
        break;
    case 2:
        InitWindows(gUnknown_840C5F0);
        FillWindowPixelBuffer(0, PIXEL_FILL(0));
        sub_810C228(SPECIES_BLASTOISE, 8, 0, TRUE, 10, 0);
        CopyToWindowPixelBuffer(1, (const void *)gUnknown_840F240, 0, 0);
        CopyToWindowPixelBuffer(2, (const void *)gUnknown_840F944, 0, 0);
        break;
    case 3:
        InitWindows(gUnknown_840C610);
        FillWindowPixelBuffer(0, PIXEL_FILL(0));
        sub_810C228(SPECIES_PIKACHU, 8, 0, TRUE, 10, 0);
        CopyToWindowPixelBuffer(1, (const void *)gUnknown_8410198, 0, 0);
        CopyToWindowPixelBuffer(2, (const void *)gUnknown_84105B4, 0, 0);
        break;
    }
    CopyWindowToVram(0, 2);
    CopyWindowToVram(1, 2);
    CopyWindowToVram(2, 2);
}

u16 sub_80F42F0(u8 a0)
{
    switch (a0)
    {
    case 0:
        return SPECIES_CHARIZARD;
    case 1:
        return SPECIES_VENUSAUR;
    case 2:
        return SPECIES_BLASTOISE;
    case 3:
        return SPECIES_PIKACHU;
    default:
        return SPECIES_NONE;
    }
}

bool32 sub_80F4328(void)
{
    switch (gUnknown_203AB40->unk_01)
    {
    case 0:
        SetVBlankCallback(NULL);
        SetHBlankCallback(NULL);
        ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
        SetGpuReg(REG_OFFSET_WININ, 0);
        SetGpuReg(REG_OFFSET_WINOUT, 0);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        ResetPaletteFade();
        ResetSpriteData();
        ResetTasks();
        ResetBgsAndClearDma3BusyFlags(1);
        InitBgsFromTemplates(1, gUnknown_840C5A4, NELEMS(gUnknown_840C5A4));
        SetBgTilemapBuffer(0, Alloc(BG_SCREEN_SIZE));
        ChangeBgX(0, 0, 0);
        ChangeBgY(0, 0, 0);
        ChangeBgX(1, 0, 0);
        ChangeBgY(1, 0, 0);
        gUnknown_203AB40->unk_0C = 0;
        gUnknown_203AB40->unk_0E = 0;
        SetBgAffine(2, 0x8000, 0x8000, 0x78, 0x50, gUnknown_203AB40->unk_0C, gUnknown_203AB40->unk_0C, 0);
        DecompressAndLoadBgGfxUsingHeap(1, gUnknown_8EAAB98, 0x2000, 0, 0);
        DecompressAndLoadBgGfxUsingHeap(2, gUnknown_840C650, 0x2000, 0, 0);
        DecompressAndLoadBgGfxUsingHeap(1, gUnknown_8EAB30C, 0x500, 0, 1);
        DecompressAndLoadBgGfxUsingHeap(2, gUnknown_840CA54, 0x400, 0, 1);
        LoadPalette(gUnknown_8EAAB18[gUnknown_203AB40->unk_09], 0, 0x20);
        LoadPalette(gUnknown_840C630, 0xF0, 0x20);
        sub_80F41A4(gUnknown_203AB40->unk_09);
        SetVBlankCallback(sub_80F4190);
        EnableInterrupts(INTR_FLAG_VBLANK);
        gUnknown_203AB40->unk_01++;
        break;
    case 1:
        FillBgTilemapBufferRect(0, 0, 0, 0, 32, 32, PIXEL_FILL(1));
        PutWindowTilemap(0);
        CopyBgTilemapBufferToVram(2);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203AB40->unk_01++;
        break;
    case 2:
        ShowBg(2);
        ShowBg(0);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        gUnknown_203AB40->unk_0C = 0x28;
        gUnknown_203AB40->unk_01++;
        break;
    case 3:
        if (gUnknown_203AB40->unk_0C != 0)
            gUnknown_203AB40->unk_0C--;
        else
            gUnknown_203AB40->unk_01++;
        break;
    case 4:
        if (!gPaletteFade.active)
        {
            gUnknown_203AB40->unk_0C = 8;
            gUnknown_203AB40->unk_0E = 1;
            gUnknown_203AB40->unk_01++;
        }
        break;
    case 5:
        if (gUnknown_203AB40->unk_0C != 0)
            gUnknown_203AB40->unk_0C--;
        else
        {
            if (gUnknown_203AB40->unk_0E < 3)
            {
                PutWindowTilemap(gUnknown_203AB40->unk_0E);
                CopyBgTilemapBufferToVram(0);
                gUnknown_203AB40->unk_0C = 4;
                gUnknown_203AB40->unk_0E++;
            }
            else
                gUnknown_203AB40->unk_01++;
        }
        break;
    case 6:
        if (gUnknown_203AB40->unk_0C < 256)
        {
            gUnknown_203AB40->unk_0C += 16;
            SetBgAffine(2, 0x8000, 0x8000, 0x78, 0x50, gUnknown_203AB40->unk_0C, gUnknown_203AB40->unk_0C, 0);
        }
        else
        {
            SetBgAffine(2, 0x8000, 0x8000, 0x78, 0x50, 0x100, 0x100, 0);
            gUnknown_203AB40->unk_0C = 32;
            gUnknown_203AB40->unk_01++;
        }
        break;
    case 7:
        if (gUnknown_203AB40->unk_0C != 0)
            gUnknown_203AB40->unk_0C--;
        else
        {
            HideBg(2);
            ShowBg(1);
            PlayCry2(sub_80F42F0(gUnknown_203AB40->unk_09), 0, 125, 10);
            gUnknown_203AB40->unk_0C = 128;
            gUnknown_203AB40->unk_01++;
        }
        break;
    case 8:
        if (gUnknown_203AB40->unk_0C != 0)
            gUnknown_203AB40->unk_0C--;
        else
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
            gUnknown_203AB40->unk_01++;
        }
        break;
    case 9:
        if (!gPaletteFade.active)
        {
            FreeAllWindowBuffers();
            Free(GetBgTilemapBuffer(0));
            gUnknown_203AB40->unk_01 = 0;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

bool32 sub_80F4674(void)
{
    switch (gUnknown_203AB40->unk_01)
    {
    case 0:
        SetVBlankCallback(NULL);
        SetHBlankCallback(NULL);
        ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
        SetGpuReg(REG_OFFSET_WININ, 0);
        SetGpuReg(REG_OFFSET_WINOUT, 0);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        ResetPaletteFade();
        ResetSpriteData();
        ResetTasks();
        ResetBgsAndClearDma3BusyFlags(1);
        InitBgsFromTemplates(0, gUnknown_840C5A4, 1);
        ChangeBgX(0, 0, 0);
        ChangeBgY(0, 0, 0);
        DecompressAndLoadBgGfxUsingHeap(0, gUnknown_8410CDC[gUnknown_203AB40->unk_09].tiles, 0x2000, 0, 0);
        DecompressAndLoadBgGfxUsingHeap(0, gUnknown_8410CDC[gUnknown_203AB40->unk_09].map, 0x800, 0, 1);
        LoadPalette(gUnknown_8410CDC[gUnknown_203AB40->unk_09].palette, 0x00, 0x200);
        SetVBlankCallback(sub_80F4190);
        EnableInterrupts(INTR_FLAG_VBLANK);
        gUnknown_203AB40->unk_01++;
        break;
    case 1:
        CopyBgTilemapBufferToVram(0);
        gUnknown_203AB40->unk_01++;
        break;
    case 2:
        ShowBg(0);
        if (gUnknown_203AB40->unk_09 != 0)
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0, RGB_BLACK);
        else
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        gUnknown_203AB40->unk_01++;
        break;
    case 3:
        if (!gPaletteFade.active)
        {
            gUnknown_203AB40->unk_01 = 0;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

void sub_80F47F8(u8 taskId)
{
    struct CreditsTaskData * data = (void *)gTasks[taskId].data;
    switch (data->field_00)
    {
    case 0:
        break;
    case 1:
        if (gSprites[data->field_01].pos1.x != 0xD0)
        {
            gSprites[data->field_01].pos1.x--;
            gSprites[data->field_06].pos1.x--;
        }
        else
        {
            data->field_00 = 0;
        }
        break;
    case 2:
        if (gUnknown_203AB40->unk_1D & 1)
        {
            if (gSprites[data->field_01].pos1.y != 0x50)
            {
                gSprites[data->field_01].pos1.y--;
                gSprites[data->field_06].pos1.y--;
            }
            else
            {
                data->field_00 = 0;
            }
        }
        break;
    case 3:
        if (gUnknown_203AB40->unk_00 == 15)
        {
            gSprites[data->field_01].pos1.x--;
            gSprites[data->field_06].pos1.x--;
        }
        break;
    }
}

void sub_80F48D0(void)
{
    if (gUnknown_203AB40->unk_02 != 0xFF)
    {
        struct CreditsTaskData * data = (void *)gTasks[gUnknown_203AB40->unk_02].data;
        FreeSpriteTilesByTag(data->field_02);
        DestroySprite(&gSprites[data->field_01]);
        FreeSpriteTilesByTag(data->field_08);
        DestroySprite(&gSprites[data->field_06]);
        DestroyTask(gUnknown_203AB40->unk_02);
        gUnknown_203AB40->unk_02 = 0xFF;
    }
}

void sub_80F4930(u8 a0)
{
    u8 taskId;
    struct CreditsTaskData * data;
    s32 r4, r9;
    struct SpriteTemplate sp00;
    struct CompressedSpriteSheet sp18;

    if (gUnknown_203AB40->unk_02 == 0xFF)
    {
        taskId = CreateTask(sub_80F47F8, 0);
        data = (void *)gTasks[taskId].data;
        gUnknown_203AB40->unk_02 = taskId;
        switch (gUnknown_841431C[a0][2])
        {
        default:
        case 0:
            r4 = 0xd0;
            r9 = 0x50;
            break;
        case 1:
            r4 = 0x110;
            r9 = 0x50;
            break;
        case 2:
            r4 = 0xd0;
            r9 = 0xa0;
            break;
        }
        data->field_00 = gUnknown_841431C[a0][2];
        data->field_02 = 0x2000;
        data->field_04 = 0xFFFF;
        switch (gUnknown_841431C[a0][0])
        {
        case 0:
            // Player
            if (gSaveBlock2Ptr->playerGender == MALE)
            {
                sp18.data = gUnknown_8410E30;
                sp18.size = 0x3000;
                sp18.tag = data->field_02;
                LoadCompressedSpriteSheet(&sp18);
                LoadPalette(gUnknown_8410E10, 0x1F0, 0x20);
            }
            else
            {
                sp18.data = gUnknown_8411C18;
                sp18.size = 0x3000;
                sp18.tag = data->field_02;
                LoadCompressedSpriteSheet(&sp18);
                LoadPalette(gUnknown_8411BF8, 0x1F0, 0x20);
            }
            break;
        case 1:
            // Rival
            sp18.data = gUnknown_84129C0;
            sp18.size = 0x3000;
            sp18.tag = data->field_02;
            LoadCompressedSpriteSheet(&sp18);
            LoadPalette(gUnknown_84129A0, 0x1F0, 0x20);
            break;
        }
        sp00 = gUnknown_8414364;
        sp00.tileTag = data->field_02;
        data->field_01 = CreateSprite(&sp00, r4, r9, 0);
        gSprites[data->field_01].oam.paletteNum = 0xF;
        gSprites[data->field_01].subpriority = 0;

        data->field_08 = 0x2001;
        data->field_0A = 0xFFFF;
        switch (gUnknown_841431C[a0][1])
        {
        case 0:
            sp18.data = gUnknown_8413338;
            sp18.size = 0x3000;
            sp18.tag = data->field_08;
            LoadCompressedSpriteSheet(&sp18);
            LoadPalette(gUnknown_8413318, 0x1E0, 0x20);
            sp00 = gUnknown_84143B8;
            break;
        case 1:
            sp18.data = gUnknown_8413338;
            sp18.size = 0x3000;
            sp18.tag = data->field_08;
            LoadCompressedSpriteSheet(&sp18);
            LoadPalette(gUnknown_8413318, 0x1E0, 0x20);
            sp00 = gUnknown_84143D0;
            break;
        case 2:
            sp18.data = gUnknown_8413874;
            sp18.size = 0x3000;
            sp18.tag = data->field_08;
            LoadCompressedSpriteSheet(&sp18);
            LoadPalette(gUnknown_8413854, 0x1E0, 0x20);
            sp00 = gUnknown_84143B8;
            break;
        case 3:
            sp18.data = gUnknown_8413DB8;
            sp18.size = 0x3000;
            sp18.tag = data->field_08;
            LoadCompressedSpriteSheet(&sp18);
            LoadPalette(gUnknown_8413D98, 0x1E0, 0x20);
            sp00 = gUnknown_84143B8;
            break;
        }
        sp00.tileTag = data->field_08;
        data->field_06 = CreateSprite(&sp00, r4, r9 + 0x26, 0);
        gSprites[data->field_06].oam.paletteNum = 0xE;
        gSprites[data->field_06].subpriority = 1;
    }
}
