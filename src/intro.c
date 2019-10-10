#include "global.h"
#include "m4a.h"
#include "malloc.h"
#include "bg.h"
#include "palette.h"
#include "main.h"
#include "gpu_regs.h"
#include "task.h"
#include "scanline_effect.h"
#include "libgcnmultiboot.h"
#include "new_menu_helpers.h"
#include "link.h"
#include "menu.h"
#include "save.h"
#include "sound.h"
#include "new_game.h"
#include "title_screen.h"
#include "decompress.h"
#include "util.h"
#include "trig.h"
#include "constants/songs.h"
#include "constants/species.h"

struct IntroSequenceData
{
    void (*field_0000)(struct IntroSequenceData *);
    u8 field_0004;
    u8 field_0005;
    u8 field_0006;
    u16 field_0008;
    u16 field_000A;
    u8 filler_000C[6];
    u16 field_0012;
    struct Sprite * field_0014;
    struct Sprite * field_0018;
    struct Sprite * field_001C;
    struct Sprite * field_0020;
    struct Sprite * field_0024;
    struct Sprite * field_0028[4];
    u8 filler_0038[0x4];
    u8 field_003C[0x400];
    u8 field_043C[0x400];
    u8 filler_083C[0x2080];
}; // size: 0x28BC

static EWRAM_DATA struct GcmbStruct gUnknown_203AAD4 = {0};
static EWRAM_DATA u16 gUnknown_203AB00 = 0;
static EWRAM_DATA u16 gUnknown_203AB02 = 0;
static EWRAM_DATA u16 gUnknown_203AB04 = 0;
static EWRAM_DATA u16 gUnknown_203AB06 = 0;
static EWRAM_DATA u16 gUnknown_203AB08 = 0;
static EWRAM_DATA u16 gUnknown_203AB0A = 0;
static EWRAM_DATA u16 gUnknown_203AB0C = 0;
static EWRAM_DATA u16 gUnknown_203AB0E = 0;
static EWRAM_DATA u16 gUnknown_203AB10 = 0;
static EWRAM_DATA u16 gUnknown_203AB12 = 0;
static EWRAM_DATA u16 gUnknown_203AB14 = 0;
static EWRAM_DATA u16 gUnknown_203AB16 = 0;
static EWRAM_DATA u16 gUnknown_203AB18 = 0;
static EWRAM_DATA u16 gUnknown_203AB1A = 0;
static EWRAM_DATA u16 gUnknown_203AB1C = 0;
static EWRAM_DATA u16 gUnknown_203AB1E = 0;
static EWRAM_DATA u16 gUnknown_203AB20 = 0;
static EWRAM_DATA u16 gUnknown_203AB22 = 0;
static EWRAM_DATA u16 gUnknown_203AB24 = 0;
static EWRAM_DATA u16 gUnknown_203AB26 = 0;
static EWRAM_DATA u32 gUnknown_203AB28 = 0;
static EWRAM_DATA s16 gUnknown_203AB2C = 0;
static EWRAM_DATA u16 gUnknown_203AB2E = 0;
static EWRAM_DATA u32 gUnknown_203AB30 = 0;

static void sub_80EC870(void);
static void sub_80EC9D4(void);
static void sub_80EC9EC(void);
static void sub_80ECA00(void);
static void sub_80ECA70(void);
static void sub_80ECAB0(u8 taskId);
static void sub_80ECAA8(struct IntroSequenceData * ptr, void (*cb)(struct IntroSequenceData *));
static void sub_80ECAF0(struct IntroSequenceData * ptr);
static void sub_80ECB98(struct IntroSequenceData * ptr);
static void sub_80ECC3C(struct IntroSequenceData * ptr);
static void sub_80ECCA8(struct IntroSequenceData * ptr);
static void sub_80ECD60(struct IntroSequenceData * ptr);
static void sub_80ECEA4(struct IntroSequenceData * ptr);
static void sub_80ED0AC(u8 taskId);
static void sub_80ED118(void);
static void sub_80ED140(u8 taskId);
static void sub_80ED188(struct IntroSequenceData * ptr);
static void sub_80ED40C(u8 taskId);
static void sub_80ED428(u8 taskId);
static void sub_80ED444(struct IntroSequenceData * ptr);
static void sub_80ED4A0(struct IntroSequenceData * ptr);
static void sub_80ED4C0(struct IntroSequenceData * ptr);
static void sub_80ED6D8(void);
static void sub_80ED714(u8 taskId);
static void sub_80ED7D4(struct IntroSequenceData * ptr);
static void sub_80ED818(struct Sprite * sprite);
static void sub_80ED898(struct IntroSequenceData * ptr);
static void sub_80EDAF0(struct IntroSequenceData * ptr);
static void sub_80EDB70(struct IntroSequenceData * ptr);
static void sub_80EDBAC(struct IntroSequenceData * ptr);
static void sub_80EDBE8(struct IntroSequenceData * ptr);
static void sub_80EDC40(void);
static void sub_80EDDF0(void);
static void sub_80EDE04(u8 taskId);
static void sub_80EDED8(void);
static void sub_80EDEEC(u8 taskId);
static struct Sprite * sub_80EDF68(void);
static void sub_80EDF94(struct IntroSequenceData * ptr);
static void sub_80EE024(u8 taskId);
static void sub_80EE160(void);
static void sub_80EE1C4(struct Sprite * sprite);
static void sub_80EE200(u8 taskId);
static void sub_80EE29C(struct Sprite * sprite);
static void sub_80EE350(struct Sprite * sprite);
static void sub_80EE40C(struct Sprite * sprite);
static void sub_80EE4DC(struct Sprite * sprite);
static void sub_80EE4F8(struct IntroSequenceData * ptr);
static void sub_80EE528(struct Sprite * sprite, s16 a1, s16 a2, u16 a3);
static void sub_80EE580(struct Sprite * sprite);
static bool32 sub_80EE5C8(struct IntroSequenceData * ptr);
static void sub_80EE5E4(struct IntroSequenceData * ptr);
static void sub_80EE610(struct Sprite * sprite);
static void sub_80EE6A4(struct IntroSequenceData * ptr);
static void sub_80EE704(struct Sprite * sprite);
static bool8 sub_80EE850(struct IntroSequenceData * ptr);
static void sub_80EE864(s16 a1, s16 a2, s16 a3);
static void sub_80EE8E4(struct Sprite * sprite);
static void sub_80EE970(struct Sprite * sprite, u16 a1, s16 a2, u8 a3);
static void sub_80EE9D4(struct Sprite * sprite);
static void sub_80EEA94(struct IntroSequenceData * ptr);
static void sub_80EEB08(struct Sprite * sprite);
static void sub_80EEBE4(void);

extern const u32 gMultiBootProgram_PokemonColosseum_Start[];

static const u16 gUnknown_8402260[] = INCBIN_U16("graphics/intro/unk_8402260.gbapal");
static const u8 gUnknown_8402280[] = INCBIN_U8("graphics/intro/unk_8402280.4bpp.lz");
static const u8 gUnknown_84024E4[] = INCBIN_U8("graphics/intro/unk_84024E4.bin.lz");
static const u16 gUnknown_8402630[] = INCBIN_U16("graphics/intro/unk_8402630.gbapal");
static const u8 gUnknown_8402650[] = INCBIN_U8("graphics/intro/unk_8402650.4bpp.lz");
static const u8 gUnknown_8402668[] = INCBIN_U8("graphics/intro/unk_8402668.bin.lz");
static const u16 gUnknown_840270C[] = INCBIN_U16("graphics/intro/unk_840270C.gbapal");
static const u8 gUnknown_840272C[] = INCBIN_U8("graphics/intro/unk_840272C.4bpp.lz");
static const u32 gUnknown_84028F8[] = INCBIN_U32("graphics/intro/unk_84028F8.bin.lz");
static const u16 gUnknown_8402A44[] = INCBIN_U16("graphics/intro/unk_8402A64.gbapal");
static const u32 gUnknown_8402A64[] = INCBIN_U32("graphics/intro/unk_8402A64.4bpp.lz");
static const u16 gUnknown_8402ABC[] = INCBIN_U16("graphics/intro/unk_8402ADC.gbapal");
static const u32 gUnknown_8402ADC[] = INCBIN_U32("graphics/intro/unk_8402ADC.4bpp.lz");
static const u32 gUnknown_8402B2C[] = INCBIN_U32("graphics/intro/unk_8402B2C.4bpp.lz");
static const u32 gUnknown_8402CD4[] = INCBIN_U32("graphics/intro/unk_8402CD4.4bpp.lz");
static const u16 gUnknown_8402D34[] = INCBIN_U16("graphics/intro/unk_8402D34.gbapal");
static const u8 gUnknown_8402D54[] = INCBIN_U8("graphics/intro/unk_8402D54.4bpp.lz");
static const u8 gUnknown_8403FE8[] = INCBIN_U8("graphics/intro/unk_8403FE8.bin.lz");
static const u16 gUnknown_84048CC[] = INCBIN_U16("graphics/intro/unk_84048CC.gbapal");
static const u8 gUnknown_84048EC[] = INCBIN_U8("graphics/intro/unk_84048EC.4bpp.lz");
static const u8 gUnknown_8404F7C[] = INCBIN_U8("graphics/intro/unk_8404F7C.bin.lz");
static const u16 gUnknown_84053B4[] = INCBIN_U16("graphics/intro/unk_84053B4.gbapal");
static const u8 gUnknown_8405414[] = INCBIN_U8("graphics/intro/unk_8405414.4bpp.lz");
static const u8 gUnknown_8405890[] = INCBIN_U8("graphics/intro/unk_8405890.bin.lz");
static const u16 gUnknown_8405B08[] = INCBIN_U16("graphics/intro/unk_8405B08.gbapal");
static const u8 gUnknown_8405B28[] = INCBIN_U8("graphics/intro/unk_8405B28.4bpp.lz");
static const u8 gUnknown_8405CDC[] = INCBIN_U8("graphics/intro/unk_8405CDC.bin.lz");
static const u16 gUnknown_8405DA4[] = INCBIN_U16("graphics/intro/unk_8405DA4.gbapal");
static const u8 gUnknown_8405DC4[] = INCBIN_U8("graphics/intro/unk_8405DC4.4bpp.lz");
static const u8 gUnknown_840644C[] = INCBIN_U8("graphics/intro/unk_840644C.bin.lz");
static const u16 gUnknown_8406634[] = INCBIN_U16("graphics/intro/unk_8406634.gbapal");
static const u8 gUnknown_8406654[] = INCBIN_U8("graphics/intro/unk_8406654.4bpp.lz");
static const u8 gUnknown_84071D0[] = INCBIN_U8("graphics/intro/unk_84071D0.bin.lz");
static const u16 gUnknown_8407430[] = INCBIN_U16("graphics/intro/unk_8407430.gbapal");
static const u8 gUnknown_8407470[] = INCBIN_U8("graphics/intro/unk_8407470.4bpp.lz");
static const u8 gUnknown_8407A50[] = INCBIN_U8("graphics/intro/unk_8407A50.bin.lz");
static const u8 gUnknown_8407B9C[] = INCBIN_U8("graphics/intro/unk_8407B9C.4bpp.lz");
static const u8 gUnknown_8408D98[] = INCBIN_U8("graphics/intro/unk_8408D98.bin.lz");
static const u32 gUnknown_840926C[] = INCBIN_U32("graphics/intro/unk_840926C.4bpp.lz");
static const u16 gUnknown_84096AC[] = INCBIN_U16("graphics/intro/unk_84096AC.gbapal");
static const u32 gUnknown_84096CC[] = INCBIN_U32("graphics/intro/unk_84096CC.4bpp.lz");
static const u16 gUnknown_8409A1C[] = INCBIN_U16("graphics/intro/unk_8409A1C.gbapal");
static const u32 gUnknown_8409A3C[] = INCBIN_U32("graphics/intro/unk_8409A3C.4bpp.lz");
static const u32 gUnknown_8409D20[] = INCBIN_U32("graphics/intro/unk_8409D20.4bpp.lz");
static const u32 gUnknown_840A3E4[] = INCBIN_U32("graphics/intro/unk_840A3E4.4bpp.lz");
static const u16 gUnknown_840B834[] = INCBIN_U16("graphics/intro/unk_840B834.gbapal");
static const u16 gUnknown_840B854[] = INCBIN_U16("graphics/intro/unk_840B854.gbapal");
static const u32 gUnknown_840B874[] = INCBIN_U32("graphics/intro/unk_840B874.4bpp.lz");
static const u32 gUnknown_840BAE0[] = INCBIN_U32("graphics/intro/unk_840BAE0.4bpp.lz");

static const struct BgTemplate gUnknown_840BB80[] = {
	{ 3, 3, 31, 0, 0, 3, 0x000 },
	{ 2, 3, 30, 0, 0, 2, 0x010 }
};

static const struct BgTemplate gUnknown_840BB88[] = {
	{ 0, 0, 28, 2, 0, 0, 0x000 },
	{ 1, 1, 30, 2, 0, 0, 0x000 }
};

static const struct BgTemplate gUnknown_840BB90[] = {
	{ 3, 1, 30, 2, 0, 3, 0x000 },
	{ 0, 0, 29, 0, 0, 0, 0x000 },
	{ 2, 3, 27, 0, 0, 2, 0x000 },
	{ 1, 2, 28, 0, 0, 1, 0x000 }
};

static const struct BgTemplate gUnknown_840BBA0[] = {
	{ 1, 0, 29, 0, 0, 1, 0x000 },
	{ 0, 1, 30, 2, 0, 0, 0x000 }
};

static const struct WindowTemplate gUnknown_840BBA8[] = {
	{ 2, 6, 4, 18, 9, 0xD, 0x000 },
	DUMMY_WIN_TEMPLATE
};

static const u8 gUnknown_840BBB8[][2] = {
	{0x3f, 0x3f},
	{0x00, 0x3f},
	{0x3f, 0x00},
	{0x00, 0x00}
};

static const struct CompressedSpriteSheet gUnknown_840BBC0[] = {
	{gUnknown_8402A64, 0x0080, 0},
	{gUnknown_8402ADC, 0x0080, 1},
	{gUnknown_8402B2C, 0x0800, 2},
	{gUnknown_84028F8, 0x0400, 3},
	{gUnknown_8402CD4, 0x0100, 4}
};

static const struct SpritePalette gUnknown_840BBE8[] = {
	{gUnknown_8402A44, 0},
	{gUnknown_8402ABC, 1},
	{gUnknown_840270C, 3},
	{0}
};

static const struct Coords16 gUnknown_840BC08[] = {
	{0x0048, 0x0050},
	{0x0088, 0x004a},
	{0x00a8, 0x0050},
	{0x0078, 0x0050},
	{0x0068, 0x0056},
	{0x0058, 0x004a},
	{0x00b8, 0x004a},
	{0x0038, 0x0056},
	{0x0098, 0x0056}
};

static const struct OamData gOamData_840BC2C = { .affineMode = ST_OAM_AFFINE_OFF, .objMode = ST_OAM_OBJ_NORMAL, .mosaic = FALSE, .bpp = ST_OAM_4BPP, .shape = ST_OAM_SQUARE, .matrixNum = 0, .size = ST_OAM_SIZE_1, .tileNum = 0x000, .priority = 2, .paletteNum = 0 };

static const struct OamData gOamData_840BC34 = { .affineMode = ST_OAM_AFFINE_OFF, .objMode = ST_OAM_OBJ_NORMAL, .mosaic = FALSE, .bpp = ST_OAM_4BPP, .shape = ST_OAM_SQUARE, .matrixNum = 0, .size = ST_OAM_SIZE_0, .tileNum = 0x000, .priority = 2, .paletteNum = 0 };

static const union AnimCmd gAnimCmd_840BC3C[] = {
	ANIMCMD_FRAME(0, 4),
	ANIMCMD_FRAME(1, 4),
	ANIMCMD_FRAME(2, 4),
	ANIMCMD_FRAME(3, 4),
	ANIMCMD_JUMP(0)
};

static const union AnimCmd gAnimCmd_840BC50[] = {
	ANIMCMD_FRAME(0, 4),
	ANIMCMD_FRAME(1, 4),
	ANIMCMD_FRAME(2, 4),
	ANIMCMD_FRAME(3, 4),
	ANIMCMD_END
};

static const union AnimCmd *const gAnimCmdTable_840BC64[] = {
	gAnimCmd_840BC3C,
	gAnimCmd_840BC50
};

static const struct SpriteTemplate gUnknown_840BC6C = {0, 0, &gOamData_840BC2C, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80EE29C};

static const struct SpriteTemplate gUnknown_840BC84 = {1, 1, &gOamData_840BC34, gAnimCmdTable_840BC64, NULL, gDummySpriteAffineAnimTable, sub_80EE350};

static const struct OamData gOamData_840BC9C = { .affineMode = ST_OAM_AFFINE_OFF, .objMode = ST_OAM_OBJ_NORMAL, .mosaic = FALSE, .bpp = ST_OAM_4BPP, .shape = ST_OAM_SQUARE, .matrixNum = 0, .size = ST_OAM_SIZE_2, .tileNum = 0x000, .priority = 2, .paletteNum = 0 };

static const union AnimCmd gAnimCmd_840BCA4[] = {
	ANIMCMD_FRAME(0, 8),
	ANIMCMD_FRAME(16, 8),
	ANIMCMD_FRAME(32, 8),
	ANIMCMD_FRAME(48, 8),
	ANIMCMD_END
};

static const union AnimCmd *const gAnimCmdTable_840BCB8[] = {
	gAnimCmd_840BCA4
};

static const struct SpriteTemplate gUnknown_840BCBC = {2, 1, &gOamData_840BC9C, gAnimCmdTable_840BCB8, NULL, gDummySpriteAffineAnimTable, sub_80EE4DC};

static const struct OamData gOamData_840BCD4 = { .affineMode = ST_OAM_AFFINE_OFF, .objMode = ST_OAM_OBJ_BLEND, .mosaic = FALSE, .bpp = ST_OAM_4BPP, .shape = ST_OAM_V_RECTANGLE, .matrixNum = 0, .size = ST_OAM_SIZE_3, .tileNum = 0x000, .priority = 3, .paletteNum = 0 };

static const struct SpriteTemplate gUnknown_840BCDC = {3, 3, &gOamData_840BCD4, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy};

static const struct OamData gOamData_840BCF4 = { .affineMode = ST_OAM_AFFINE_OFF, .objMode = ST_OAM_OBJ_BLEND, .mosaic = FALSE, .bpp = ST_OAM_4BPP, .shape = ST_OAM_H_RECTANGLE, .matrixNum = 0, .size = ST_OAM_SIZE_1, .tileNum = 0x000, .priority = 3, .paletteNum = 0 };

static const struct SpriteTemplate gUnknown_840BCFC = {4, 3, &gOamData_840BCF4, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy};

static const struct OamData gOamData_840BD14 = { .affineMode = ST_OAM_AFFINE_DOUBLE, .objMode = ST_OAM_OBJ_NORMAL, .mosaic = FALSE, .bpp = ST_OAM_4BPP, .shape = ST_OAM_SQUARE, .matrixNum = 0, .size = ST_OAM_SIZE_3, .tileNum = 0x000, .priority = 1, .paletteNum = 0 };

static const union AnimCmd gAnimCmd_840BD1C[] = {
	ANIMCMD_FRAME(0, 1),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmd_840BD24[] = {
	ANIMCMD_FRAME(64, 1),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmd_840BD2C[] = {
	ANIMCMD_FRAME(128, 1),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmd_840BD34[] = {
	ANIMCMD_FRAME(192, 1),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmd_840BD3C[] = {
	ANIMCMD_FRAME(256, 1),
	ANIMCMD_END
};

static const union AnimCmd *const gAnimCmdTable_840BD44[] = {
	gAnimCmd_840BD1C,
	gAnimCmd_840BD24,
	gAnimCmd_840BD2C,
	gAnimCmd_840BD34,
	gAnimCmd_840BD3C
};

static const union AffineAnimCmd gAffineAnimCmd_840BD58[] = {
	AFFINEANIMCMD_FRAME(256, 256, 0, 0),
	AFFINEANIMCMD_END
};

static const union AffineAnimCmd gAffineAnimCmd_840BD68[] = {
	AFFINEANIMCMD_FRAME(256, 256, 0, 0),
	AFFINEANIMCMD_FRAME(32, 32, 0, 8),
	AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const gAffineAnimCmdTable_840BD80[] = {
	gAffineAnimCmd_840BD58,
	gAffineAnimCmd_840BD68
};

static const struct SpriteTemplate gUnknown_840BD88 = {5, 7, &gOamData_840BD14, gAnimCmdTable_840BD44, NULL, gAffineAnimCmdTable_840BD80, SpriteCallbackDummy};

static const struct OamData gOamData_840BDA0 = { .affineMode = ST_OAM_AFFINE_OFF, .objMode = ST_OAM_OBJ_NORMAL, .mosaic = FALSE, .bpp = ST_OAM_4BPP, .shape = ST_OAM_SQUARE, .matrixNum = 0, .size = ST_OAM_SIZE_3, .tileNum = 0x000, .priority = 1, .paletteNum = 0 };

static const struct SpriteTemplate gUnknown_840BDA8 = {7, 7, &gOamData_840BDA0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy};

static const struct SpriteTemplate gUnknown_840BDC0 = {6, 6, &gOamData_840BDA0, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy};

static const struct OamData gOamData_840BDD8 = { .affineMode = ST_OAM_AFFINE_OFF, .objMode = ST_OAM_OBJ_NORMAL, .mosaic = FALSE, .bpp = ST_OAM_4BPP, .shape = ST_OAM_H_RECTANGLE, .matrixNum = 0, .size = ST_OAM_SIZE_3, .tileNum = 0x000, .priority = 0, .paletteNum = 0 };

static const union AnimCmd gAnimCmds_840BDE0[] = {
	ANIMCMD_FRAME(0, 0),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmds_840BDE8[] = {
	ANIMCMD_FRAME(32, 4),
	ANIMCMD_FRAME(0, 4),
	ANIMCMD_END
};

static const union AnimCmd *const gAnimCmdTable_840BDF4[] = {
	gAnimCmds_840BDE0,
	gAnimCmds_840BDE8
};

static const struct SpriteTemplate gUnknown_840BDFC = {8, 8, &gOamData_840BDD8, gAnimCmdTable_840BDF4, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy};

static const struct OamData gOamData_840BE14 = { .affineMode = ST_OAM_AFFINE_DOUBLE, .objMode = ST_OAM_OBJ_NORMAL, .mosaic = FALSE, .bpp = ST_OAM_4BPP, .shape = ST_OAM_SQUARE, .matrixNum = 0, .size = ST_OAM_SIZE_3, .tileNum = 0x000, .priority = 1, .paletteNum = 0 };

static const union AnimCmd gAnimCmd_840BE1C[] = {
	ANIMCMD_FRAME(0, 0),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmd_840BE24[] = {
	ANIMCMD_FRAME(64, 0),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmd_840BE2C[] = {
	ANIMCMD_FRAME(96, 0),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmd_840BE34[] = {
	ANIMCMD_FRAME(160, 0),
	ANIMCMD_END
};

static const union AnimCmd *const gAnimCmdTable_840BE3C[] = {
	gAnimCmd_840BE1C,
	gAnimCmd_840BE24,
	gAnimCmd_840BE2C,
	gAnimCmd_840BE34
};

static const struct SpriteTemplate gUnknown_840BE4C = {9, 6, &gOamData_840BE14, gAnimCmdTable_840BE3C, NULL, gAffineAnimCmdTable_840BD80, SpriteCallbackDummy};

static const struct OamData gOamData_840BE64 = { .affineMode = ST_OAM_AFFINE_OFF, .objMode = ST_OAM_OBJ_NORMAL, .mosaic = FALSE, .bpp = ST_OAM_4BPP, .shape = ST_OAM_V_RECTANGLE, .matrixNum = 0, .size = ST_OAM_SIZE_3, .tileNum = 0x000, .priority = 1, .paletteNum = 0 };

static const union AnimCmd gAnimCmd_840BE6C[] = {
	ANIMCMD_FRAME(0, 8),
	ANIMCMD_FRAME(32, 4),
	ANIMCMD_END
};

static const union AnimCmd gAnimCmd_840BE78[] = {
	ANIMCMD_FRAME(64, 8),
	ANIMCMD_FRAME(72, 4),
	ANIMCMD_END
};

static const union AnimCmd *const gAnimCmdTable_840BE84[] = {
	gAnimCmd_840BE6C,
	gAnimCmd_840BE78
};

static const struct SpriteTemplate gUnknown_840BE8C = {10, 10, &gOamData_840BE64, gAnimCmdTable_840BE84, NULL, gDummySpriteAffineAnimTable, sub_80EE1C4};

static const struct OamData gOamData_840BEA4 = { .affineMode = ST_OAM_AFFINE_OFF, .objMode = ST_OAM_OBJ_NORMAL, .mosaic = FALSE, .bpp = ST_OAM_4BPP, .shape = ST_OAM_SQUARE, .matrixNum = 0, .size = ST_OAM_SIZE_1, .tileNum = 0x000, .priority = 1, .paletteNum = 0 };

static const union AnimCmd gAnimCmd_840BEAC[] = {
	ANIMCMD_FRAME(0, 10),
	ANIMCMD_FRAME(4, 10),
	ANIMCMD_FRAME(8, 10),
	ANIMCMD_FRAME(12, 8),
	ANIMCMD_END
};

static const union AnimCmd *const gAnimCmdTable_840BEC0[] = {
	gAnimCmd_840BEAC
};

static const struct SpriteTemplate gUnknown_840BEC4 = {11, 11, &gOamData_840BEA4, gAnimCmdTable_840BEC0, NULL, gDummySpriteAffineAnimTable, sub_80EE8E4};

static const struct CompressedSpriteSheet gUnknown_840BEDC[] = {
	{gUnknown_840926C, 0x0800, 6},
	{gUnknown_84096CC, 0x0800, 7},
	{gUnknown_840A3E4, 0x2800, 5},
	{gUnknown_8409A3C, 0x0800, 8},
	{gUnknown_8409D20, 0x1800, 9},
	{gUnknown_840B874, 0x0a00, 10},
	{gUnknown_840BAE0, 0x0200, 11}
};

// POTENTIAL UB
// This array is passed to LoadSpritePalettes in sub_80EEBE4.
// LoadSpritePalettes uses a {0} entry to signal end of array.
// Because such an entry is absent in this case, the function
// continues reading into the next .rodata section.
static const struct SpritePalette gUnknown_840BF14[] = {
	{gUnknown_8405DA4, 6},
	{gUnknown_84096AC, 7},
	{gUnknown_8409A1C, 8},
	{gUnknown_840B834, 10},
	{gUnknown_840B854, 11},
    // {0}
};

static void sub_80EC5A4(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void sub_80EC5B8(void)
{
    if (!UpdatePaletteFade())
        SetMainCallback2(sub_80EC870);
}

static void load_copyright_graphics(u16 a, u16 b, u16 c)
{
    LZ77UnCompVram(gUnknown_8402280, (void *)BG_VRAM + a);
    LZ77UnCompVram(gUnknown_84024E4, (void *)BG_VRAM + b);
    LoadPalette(gUnknown_8402260, c, 0x20);
}

static void SerialCb_CopyrightScreen(void)
{
    GameCubeMultiBoot_HandleSerialInterrupt(&gUnknown_203AAD4);
}

static bool8 sub_80EC62C(void)
{
    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        SetGpuReg(REG_OFFSET_BLDY, 0);
        ((vu16*)PLTT)[0] = RGB_WHITE;
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        SetGpuReg(REG_OFFSET_BG0HOFS, 0);
        SetGpuReg(REG_OFFSET_BG0VOFS, 0);
        DmaFill16(3, 0, VRAM, VRAM_SIZE);
        DmaFill32(3, 0, OAM, OAM_SIZE);
        DmaFill16(3, 0, PLTT + sizeof(vu16), PLTT_SIZE - sizeof(vu16));
        ResetPaletteFade();
        load_copyright_graphics(0, 0x3800, 0);
        ScanlineEffect_Stop();
        ResetTasks();
        ResetSpriteData();
        FreeAllSpritePalettes();BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0xFFFF);
        SetGpuReg(REG_OFFSET_BG0CNT, 0x700);
        EnableInterrupts(INTR_FLAG_VBLANK);
        SetVBlankCallback(sub_80EC5A4);
        SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON);
        SetSerialCallback(SerialCb_CopyrightScreen);
        GameCubeMultiBoot_Init(&gUnknown_203AAD4);
        // fallthrough
    default:
        UpdatePaletteFade();
        gMain.state++;
        GameCubeMultiBoot_Main(&gUnknown_203AAD4);
        break;
    case 140:
        GameCubeMultiBoot_Main(&gUnknown_203AAD4);
        if (gUnknown_203AAD4.gcmb_field_2 != 1)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
            gMain.state++;
        }
        break;
    case 141:
        if (!UpdatePaletteFade())
        {
            gMain.state++;
            if (gUnknown_203AAD4.gcmb_field_2 != 0)
            {
                if (gUnknown_203AAD4.gcmb_field_2 == 2)
                {
                    if (*((u32 *)0x020000AC) == 0x65366347)
                    {
                        CpuCopy16(gMultiBootProgram_PokemonColosseum_Start, (void *)EWRAM_START, 0x28000);
                        *((u32 *)0x020000AC) = 0x65366347;
                    }
                    GameCubeMultiBoot_ExecuteProgram(&gUnknown_203AAD4);
                }
            }
            else
            {
                GameCubeMultiBoot_Quit();
                SetSerialCallback(SerialCB);
            }
            return FALSE;
        }
        break;
    case 142:
        ResetSerial();
        SetMainCallback2(sub_80EC5B8);
        break;
    }
    return TRUE;
}

void c2_copyright_1(void)
{
    if (!sub_80EC62C())
    {
        ResetMenuAndMonGlobals();
        Save_ResetSaveCounters();
        Save_LoadGameData(0);
        if (gSaveFileStatus == SAVE_STATUS_EMPTY || gSaveFileStatus == SAVE_STATUS_INVALID)
            Sav2_ClearSetDefault();
        SetPokemonCryStereo(gSaveBlock2Ptr->optionsSound);
    }
}

void sub_80EC864(void)
{
    sub_80EC62C();
}

static void sub_80EC870(void)
{
    switch (gMain.state)
    {
    default:
        gMain.state = 0;
        // fallthrough
    case 0:
        SetVBlankCallback(NULL);
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        InitHeap(gHeap, HEAP_SIZE);
        ResetTasks();
        ResetSpriteData();
        ResetPaletteFade();
        ResetTempTileDataBuffers();
        sub_80ECA00();
        DmaFill16(3, 0, VRAM, VRAM_SIZE);
        DmaFill32(3, 0, OAM, OAM_SIZE);
        DmaFill16(3, 0, PLTT, PLTT_SIZE);
        FillPalette(0, 0, 0x400);
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(0, gUnknown_840BB80, NELEMS(gUnknown_840BB80));
        break;
    case 1:
        LoadPalette(gUnknown_8402630, 0x00, 0x20);
        DecompressAndCopyTileDataToVram(3, gUnknown_8402650, 0, 0, 0);
        DecompressAndCopyTileDataToVram(3, gUnknown_8402668, 0, 0, 1);
        LoadPalette(gUnknown_840270C, 0xD0, 0x20);
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            sub_80ECA70();
            BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
            SetMainCallback2(sub_80EC9D4);
            SetVBlankCallback(sub_80EC9EC);
        }
        return;
    }
    gMain.state++;
}

static void sub_80EC9D4(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_80EC9EC(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void sub_80ECA00(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    SetGpuReg(REG_OFFSET_BLDCNT, 0);
    SetGpuReg(REG_OFFSET_BLDALPHA, 0);
    SetGpuReg(REG_OFFSET_BLDY, 0);
    SetGpuReg(REG_OFFSET_BG0HOFS, 0);
    SetGpuReg(REG_OFFSET_BG0VOFS, 0);
    SetGpuReg(REG_OFFSET_BG1HOFS, 0);
    SetGpuReg(REG_OFFSET_BG1VOFS, 0);
    SetGpuReg(REG_OFFSET_BG2HOFS, 0);
    SetGpuReg(REG_OFFSET_BG2VOFS, 0);
    SetGpuReg(REG_OFFSET_BG3HOFS, 0);
    SetGpuReg(REG_OFFSET_BG3VOFS, 0);
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
}

static void sub_80ECA70(void)
{
    struct IntroSequenceData * ptr = Alloc(sizeof(struct IntroSequenceData));
    sub_80ECAA8(ptr, sub_80ECAF0);
    ptr->field_0005 = CreateTask(sub_80ECAB0, 3);
    SetWordTaskArg(ptr->field_0005, 0, (uintptr_t)ptr);
}

static void sub_80ECAA8(struct IntroSequenceData * ptr, void (*cb)(struct IntroSequenceData *))
{
    ptr->field_0000 = cb;
    ptr->field_0004 = 0;
}

static void sub_80ECAB0(u8 taskId)
{
    struct IntroSequenceData * ptr = (void *)GetWordTaskArg(taskId, 0);
    if (JOY_NEW(A_BUTTON | START_BUTTON | SELECT_BUTTON) && ptr->field_0000 != sub_80EDBE8)
        sub_80ECAA8(ptr, sub_80EDBE8);
    ptr->field_0000(ptr);
}

static void sub_80ECAF0(struct IntroSequenceData * this)
{
    switch (this->field_0004)
    {
    case 0:
        InitWindows(gUnknown_840BBA8);
        LZ77UnCompWram(gUnknown_840272C, this->field_043C);
        LZ77UnCompWram(gUnknown_84028F8, this->field_003C);
        FillBgTilemapBufferRect(2, 0x000, 0, 0, 32, 32, 0x11);
        FillWindowPixelBuffer(0, 0x00);
        BlitBitmapToWindow(0, this->field_043C, 0, 40, 144, 16);
        PutWindowTilemap(0);
        CopyWindowToVram(0, 3);
        this->field_0004++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            sub_80ECAA8(this, sub_80ECB98);
        break;
    }
}

static void sub_80ECB98(struct IntroSequenceData * this)
{
    switch (this->field_0004)
    {
    case 0:
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN1_ON);
        SetGpuReg(REG_OFFSET_WININ, 0x3F00);
        SetGpuReg(REG_OFFSET_WINOUT, 0x0000);
        SetGpuReg(REG_OFFSET_WIN1H, 0x00F0);
        SetGpuReg(REG_OFFSET_WIN1V, 0x0000);
        this->field_0012 = 0;
        this->field_0004++;
        break;
    case 1:
        ShowBg(3);
        BlendPalettes(0xFFFFFFFF, 0x00, RGB_BLACK);
        this->field_0004++;
        break;
    case 2:
        this->field_0012 += 8;
        if (this->field_0012 >= 0x30)
            this->field_0012 = 0x30;
        SetGpuReg(REG_OFFSET_WIN1V, ((0x50 - this->field_0012) << 8) | (0x50 + this->field_0012));
        if (this->field_0012 == 0x30)
            sub_80ECAA8(this, sub_80ECC3C);
        break;
    }
}

static void sub_80ECC3C(struct IntroSequenceData * this)
{
    switch (this->field_0004)
    {
    case 0:
        PlaySE(MUS_TITLEROG);
        sub_80EDC40();
        this->field_0012 = 0;
        this->field_0004++;
        break;
    case 1:
        this->field_0012++;
        if (this->field_0012 == 30)
        {
            sub_80EDDF0();
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 2:
        this->field_0012++;
        if (this->field_0012 == 90)
            sub_80ECAA8(this, sub_80ECCA8);
        break;
    }
}

static void sub_80ECCA8(struct IntroSequenceData * this)
{
    switch (this->field_0004)
    {
    case 0:
        sub_80EDED8();
        this->field_0012 = 0;
        this->field_0004++;
        break;
    case 1:
        this->field_0012++;
        if (this->field_0012 >= 40)
            this->field_0004++;
        break;
    case 2:
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG2 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD);
        StartBlendTask(0, 16, 16, 0, 48, 0);
        this->field_0004++;
        break;
    case 3:
        ShowBg(2);
        this->field_0004++;
        break;
    case 4:
        if (!IsBlendTaskActive())
        {
            SetGpuReg(REG_OFFSET_BLDCNT, 0);
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 5:
        this->field_0012++;
        if (this->field_0012 > 50)
            sub_80ECAA8(this, sub_80ECD60);
        break;
    }
}

static void sub_80ECD60(struct IntroSequenceData * this)
{
    switch (this->field_0004)
    {
    case 0:
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_OBJ | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BD);
        StartBlendTask(0, 16, 16, 0, 16, 0);
        this->field_0008 = 0;
        this->field_000A = 16;
        this->field_0012 = 0;
        this->field_0004++;
        break;
    case 1:
        this->field_0014 = sub_80EDF68();
        this->field_0004++;
        break;
    case 2:
        if (!IsBlendTaskActive())
        {
            BlitBitmapToWindow(0, this->field_003C, 0x38, 0x06, 0x20, 0x40);
            BlitBitmapToWindow(0, this->field_043C, 0x00, 0x28, 0x90, 0x10);
            CopyWindowToVram(0, 2);
            this->field_0004++;
        }
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            DestroySprite(this->field_0014);
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 4:
        this->field_0012++;
        if (this->field_0012 > 90)
        {
            SetGpuRegBits(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG2);
            StartBlendTask(16, 0, 0, 16, 20, 0);
            this->field_0004++;
        }
        break;
    case 5:
        if (!IsBlendTaskActive())
        {
            HideBg(2);
            this->field_0004++;
        }
        break;
    case 6:
        ResetSpriteData();
        FreeAllSpritePalettes();
        this->field_0012 = 0;
        this->field_0004++;
        break;
    case 7:
        this->field_0012++;
        if (this->field_0012 > 20)
        {
            SetGpuReg(REG_OFFSET_BLDCNT, 0);
            sub_80ECAA8(this, sub_80ECEA4);
        }
        break;
    }
}

static void sub_80ECEA4(struct IntroSequenceData * this)
{
    switch (this->field_0004)
    {
    case 0:
        SetVBlankCallback(NULL);
        LoadPalette(gUnknown_8402D34, 0x10, 0x20);
        LoadPalette(gUnknown_84048CC, 0x20, 0x20);
        BlendPalettes(0x06, 0x10, RGB_WHITE);
        InitBgsFromTemplates(0, gUnknown_840BB88, NELEMS(gUnknown_840BB88));
        DecompressAndCopyTileDataToVram(1, gUnknown_84048EC, 0, 0, 0);
        DecompressAndCopyTileDataToVram(1, gUnknown_8404F7C, 0, 0, 1);
        ShowBg(1);
        HideBg(0);
        HideBg(2);
        HideBg(3);
        sub_80EEBE4();
        SetVBlankCallback(sub_80EC9EC);
        this->field_0004++;
        break;
    case 1:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            DecompressAndCopyTileDataToVram(0, gUnknown_8402D54, 0, 0, 0);
            DecompressAndCopyTileDataToVram(0, gUnknown_8403FE8, 0, 0, 1);
            ResetBgPositions();
            ShowBg(1);
            this->field_0004++;
        }
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            ShowBg(0);
            CreateTask(sub_80ED0AC, 0);
            BeginNormalPaletteFade(0x00000006, -2, 16, 0, RGB_WHITE);
            this->field_0004++;
        }
        break;
    case 3:
        if (!gPaletteFade.active)
        {
            m4aSongNumStart(MUS_DEMO);
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 4:
        this->field_0012++;
        if (this->field_0012 == 20)
        {
            CreateTask(sub_80ED140, 0);
            sub_80ED118();
        }
        if (this->field_0012 >= 30)
        {
            BlendPalettes(-2, 16, RGB_WHITE);
            DestroyTask(FindTaskIdByFunc(sub_80ED0AC));
            DestroyTask(FindTaskIdByFunc(sub_80ED140));
            sub_80ECAA8(this, sub_80ED188);
        }
        break;
    case 5:
        if (!gPaletteFade.active)
        {
            DestroyTask(FindTaskIdByFunc(sub_80ED0AC));
            DestroyTask(FindTaskIdByFunc(sub_80ED140));
            sub_80ECAA8(this, sub_80ED188);
        }
        break;
    }
}

static void sub_80ED0AC(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    data[0]++;
    if (data[0] > 5)
    {
        data[0] = 0;
        data[1]++;
        if (data[1] > 2)
            data[1] = 0;
        ChangeBgY(0, data[1] << 15, 0);
    }
    if (data[2])
    {
        data[3] += 0x120;
        ChangeBgY(0, data[3], 2);
    }
}

static void sub_80ED118(void)
{
    u8 taskId = FindTaskIdByFunc(sub_80ED0AC);
    gTasks[taskId].data[2] = TRUE;
}

static void sub_80ED140(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    data[0]++;
    if (data[0] > 3)
    {
        data[0] = 0;
        if (data[1] < 2)
            data[1]++;
        ChangeBgY(1, data[1] << 15, 0);
    }
}

static void sub_80ED188(struct IntroSequenceData * this)
{
    switch (this->field_0004)
    {
    case 0:
        BlendPalettes(0xFFFFFFFE, 16, RGB_WHITE);
        InitBgsFromTemplates(0, gUnknown_840BB90, NELEMS(gUnknown_840BB90));
        DecompressAndCopyTileDataToVram(3, gUnknown_8405414, 0, 0, 0);
        DecompressAndCopyTileDataToVram(3, gUnknown_8405890, 0, 0, 1);
        ShowBg(3);
        this->field_0004++;
        break;
    case 1:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            SetVBlankCallback(NULL);
            LoadPalette(gUnknown_84053B4, 0x10, 0x60);
            LoadPalette(gUnknown_8405DA4, 0x50, 0x20);
            LoadPalette(gUnknown_8406634, 0x60, 0x20);
            BlendPalettes(0xFFFFFFFE, 16, RGB_WHITE);
            DecompressAndCopyTileDataToVram(0, gUnknown_8405B28, 0, 0, 0);
            DecompressAndCopyTileDataToVram(0, gUnknown_8405CDC, 0, 0, 1);
            DecompressAndCopyTileDataToVram(1, gUnknown_8406654, 0, 0, 0);
            DecompressAndCopyTileDataToVram(1, gUnknown_84071D0, 0, 0, 1);
            DecompressAndCopyTileDataToVram(2, gUnknown_8405DC4, 0, 0, 0);
            DecompressAndCopyTileDataToVram(2, gUnknown_840644C, 0, 0, 1);
            ResetBgPositions();
            ShowBg(0);
            HideBg(1);
            HideBg(2);
            ChangeBgY(2, 0x0001CE00, 0);
            ChangeBgY(1, 0x00002800, 0);
            CreateTask(sub_80ED40C, 0);
            sub_80ED444(this);
            BlendPalettes(0xFFFFFFFE, 16, RGB_WHITE);
            SetVBlankCallback(sub_80EC9EC);
            this->field_0004++;
        }
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            BeginNormalPaletteFade(0xFFFFFFFE, -2, 16, 0, RGB_WHITE);
            this->field_0004++;
        }
        break;
    case 3:
        if (!gPaletteFade.active)
        {
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 4:
        this->field_0012++;
        if (this->field_0012 >= 60)
        {
            this->field_0012 = 0;
            DestroyTask(FindTaskIdByFunc(sub_80ED40C));
            sub_80ED4A0(this);
            CreateTask(sub_80ED428, 0);
            ChangeBgY(3, 0x00010000, 0);
            HideBg(0);
            ShowBg(3);
            ShowBg(1);
            ShowBg(2);
            this->field_0004++;
        }
        break;
    case 5:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 6:
        this->field_0012++;
        if (this->field_0012 >= 60)
        {
            DestroyTask(FindTaskIdByFunc(sub_80ED428));
            sub_80ECAA8(this, sub_80ED4C0);
        }
        break;
    }
}

static void sub_80ED40C(u8 taskId)
{
    ChangeBgX(3, 0x0E0, 2);
    ChangeBgX(0, 0x110, 1);
}

static void sub_80ED428(u8 taskId)
{
    ChangeBgY(2, 0x020, 1);
    ChangeBgY(1, 0x024, 2);
}

static void sub_80ED444(struct IntroSequenceData * this)
{
    u8 spriteId;

    this->field_001C = NULL;
    this->field_0020 = NULL;

    spriteId = CreateSprite(&gUnknown_840BDA8, 168, 80, 11);
    if (spriteId != MAX_SPRITES)
        this->field_0020 = &gSprites[spriteId];

    spriteId = CreateSprite(&gUnknown_840BDC0, 72, 80, 12);
    if (spriteId != MAX_SPRITES)
        this->field_001C = &gSprites[spriteId];
}

static void sub_80ED4A0(struct IntroSequenceData * this)
{
    if (this->field_001C != NULL)
        DestroySprite(this->field_001C);
    if (this->field_0020 != NULL)
        DestroySprite(this->field_0020);
}

static void sub_80ED4C0(struct IntroSequenceData * this)
{
    switch (this->field_0004)
    {
    case 0:
        LoadPalette(gUnknown_8407430, 0x10, 0x40);
        LoadPalette(gUnknown_8405DA4, 0x50, 0x20);
        BlendPalettes(0xFFFFFFFE, 16, RGB_WHITE);
        InitBgsFromTemplates(0, gUnknown_840BBA0, NELEMS(gUnknown_840BBA0));
        DecompressAndCopyTileDataToVram(1, gUnknown_8407470, 0, 0, 0);
        DecompressAndCopyTileDataToVram(1, gUnknown_8407A50, 0, 0, 1);
        ShowBg(1);
        HideBg(0);
        HideBg(2);
        HideBg(3);
        ResetBgPositions();
        this->field_0004++;
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        SetGpuRegBits(REG_OFFSET_WININ, 0x12);
        ClearGpuRegBits(REG_OFFSET_WININ, 0x01);
        SetGpuRegBits(REG_OFFSET_WINOUT, 0x00);
        SetGpuReg(REG_OFFSET_WIN0V, 0x2080);
        SetGpuReg(REG_OFFSET_WIN0H, 0x0078);
        break;
    case 1:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            DecompressAndCopyTileDataToVram(0, gUnknown_8407B9C, 0, 0, 0);
            DecompressAndCopyTileDataToVram(0, gUnknown_8408D98, 0, 0, 1);
            gUnknown_203AB00 = 4;
            gUnknown_203AB02 = 52;
            ChangeBgX(0, 0x00001800, 0);
            ChangeBgY(0, 0x0001F000, 0);
            this->field_0004++;
        }
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            BlendPalettes(0xFFFFFFFE, 0, RGB_WHITE);
            ShowBg(0);
            CreateTask(sub_80ED714, 0);
            sub_80EE4F8(this);
            sub_80EE528(this->field_0018, 0, 0xB4, 0x34);
            CreateTask(sub_80EE200, 0);
            sub_80ED6D8();
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 3:
        this->field_0012++;
        if (this->field_0012 == 16)
            sub_80ED7D4(this);
        if (!sub_80EE5C8(this) && !FuncIsActiveTask(sub_80EE200))
            sub_80ECAA8(this, sub_80ED898);
        break;
    }
}

static void sub_80ED69C(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
        ChangeBgX(1, 0x400, 2);
    else
        ChangeBgX(1, 0x020, 2);
}

static void sub_80ED6D8(void)
{
    CreateTask(sub_80ED69C, 0);
}

static void sub_80ED6EC(void)
{
    u8 taskId = FindTaskIdByFunc(sub_80ED69C);
    gTasks[taskId].data[0] = 1;
}

static void sub_80ED714(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    if (data[0] == 0)
    {
        data[1]++;
        if (data[1] >= 30)
        {
            data[1] = 0;
            data[2] ^= 1;
            ChangeBgY(0, (data[2] << 15) + 0x1F000, 0);
        }
    }
}

static void sub_80ED760(void)
{
    u8 taskId = FindTaskIdByFunc(sub_80ED714);
    gTasks[taskId].data[0] = 1;
}

static void sub_80ED788(void)
{
    u8 taskId = FindTaskIdByFunc(sub_80ED714);
    gTasks[taskId].data[0] = 0;
}

static u8 sub_80ED7B0(void)
{
    u8 taskId = FindTaskIdByFunc(sub_80ED714);
    return gTasks[taskId].data[2];
}

static void sub_80ED7D4(struct IntroSequenceData * this)
{
    u8 spriteId = CreateSprite(&gUnknown_840BDFC, 296, 112, 7);
    if (spriteId != MAX_SPRITES)
    {
        this->field_0024 = &gSprites[spriteId];
        this->field_0024->callback = sub_80ED818;
    }
    else
        this->field_0024 = NULL;
}

static void sub_80ED818(struct Sprite * sprite)
{
    s16 * data = sprite->data;

    switch (data[0])
    {
    case 0:
        data[1] = sprite->pos1.x << 5;
        data[2] = 160;
        data[0]++;
        // fallthrough
    case 1:
        data[1] -= data[2];
        sprite->pos1.x = data[1] >> 5;
        if (sprite->pos1.x <= 52)
        {
            sub_80ED6EC();
            data[0]++;
        }
        break;
    case 2:
        data[1] -= 32;
        sprite->pos1.x = data[1] >> 5;
        if (sprite->pos1.x <= -32)
        {
            sprite->invisible = TRUE;
            sprite->data[0]++;
            DestroySprite(sprite);
        }
        break;
    }
}

static void sub_80ED898(struct IntroSequenceData * this)
{
    switch (this->field_0004)
    {
    case 0:
        this->field_0012 = 0;
        this->field_0004++;
        break;
    case 1:
        this->field_0012++;
        if (this->field_0012 > 30)
        {
            sub_80EE5E4(this);
            this->field_0004++;
        }
        break;
    case 2:
        if (!sub_80EE850(this))
        {
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 3:
        this->field_0012++;
        if (this->field_0012 > 30)
        {
            sub_80ED760();
            sub_80EDF94(this);
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 4:
        if (this->field_0006)
        {
            sub_80EE6A4(this);
            this->field_0004++;
        }
        break;
    case 5:
        if (!sub_80EE850(this))
        {
            sub_80ED788();
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 6:
        this->field_0012++;
        if (this->field_0012 > 16)
        {
            sub_80EE970(this->field_0018, 8, 12, 5);
            this->field_0004++;
        }
        break;
    case 7:
        if (!sub_80EE850(this))
        {
            sub_80EE970(this->field_0018, 8, 12, 5);
            this->field_0004++;
        }
        break;
    case 8:
        if (!sub_80EE850(this))
        {
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 9:
        this->field_0012++;
        if (this->field_0012 > 20)
        {
            sub_80EEA94(this);
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 10:
        if (!sub_80ED7B0())
        {
            sub_80ED760();
            sub_80EDAF0(this);
            this->field_0004++;
        }
        break;
    case 11:
        HideBg(0);
        this->field_0012 = 0;
        this->field_0004++;
        break;
    case 12:
        this->field_0012++;
        if (this->field_0012 == 48)
            BeginNormalPaletteFade(0x00000006, 2, 0, 16, RGB_WHITE);
        if (this->field_0012 > 120)
        {
            sub_80EDB70(this);
            sub_80EDBAC(this);
            this->field_0004++;
            this->field_0012 = 0;
        }
        break;
    case 13:
        this->field_0012++;
        if (this->field_0012 > 8)
        {
            CpuFill16(RGB_WHITE, gPlttBufferUnfaded + 16, 64);
            BeginNormalPaletteFade(0xFFFFFFFE, -2, 0, 16, RGB_BLACK);
            this->field_0004++;
        }
        break;
    case 14:
        if (!gPaletteFade.active)
        {
            this->field_0012 = 0;
            this->field_0004++;
        }
        break;
    case 15:
        this->field_0012++;
        if (this->field_0012 > 60)
            sub_80ECAA8(this, sub_80EDBE8);
        break;
    default:
        if (JOY_NEW(R_BUTTON))
        {
            BlendPalettes(0xFFFF0064, 0, RGB_WHITE);
            this->field_0018->pos2.x = 0;
            this->field_0018->pos1.x = 0xB4;
            this->field_0004 = 1;
            this->field_0012 = 30;
        }
        break;
    }
}

static void sub_80EDAD8(struct Sprite * sprite)
{
    CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, sprite->oam.affineMode);
}

static void sub_80EDAF0(struct IntroSequenceData * this)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        int x = (i & 1) * 48 + 49;
        int y = (i / 2) * 64 + 72;
        u8 spriteId = CreateSprite(&gUnknown_840BE4C, x, y, 8);
        if (spriteId != MAX_SPRITES)
        {
            StartSpriteAnim(&gSprites[spriteId], i);
            this->field_0028[i] = &gSprites[spriteId];
            if (i & 1)
                this->field_0028[i]->oam.shape = ST_OAM_V_RECTANGLE;
            sub_80EDAD8(this->field_0028[i]);
        }
    }
}

static void sub_80EDB70(struct IntroSequenceData * this)
{
    this->field_0018->pos1.x += this->field_0018->pos2.x;
    this->field_0018->pos1.y += this->field_0018->pos2.y;
    sub_8007FFC(this->field_0018, 0, 0x2A);
    this->field_0018->callback = SpriteCallbackDummy;
    StartSpriteAffineAnim(this->field_0018, 1);
}

static void nullsub_83(struct Sprite * sprite)
{
}

static void sub_80EDBAC(struct IntroSequenceData * this)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        StartSpriteAffineAnim(this->field_0028[i], 1);
        this->field_0028[i]->callback = nullsub_83;
        sub_8007FFC(this->field_0028[i], gUnknown_840BBB8[i][0], gUnknown_840BBB8[i][1]);
    }
}

static void sub_80EDBE8(struct IntroSequenceData * this)
{
    switch (this->field_0004)
    {
    case 0:
        FillPalette(RGB_BLACK, 0, 0x400);
        this->field_0004++;
        break;
    case 1:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            DestroyTask(this->field_0005);
            Free(this);
            DisableInterrupts(INTR_FLAG_HBLANK);
            SetHBlankCallback(NULL);
            SetMainCallback2(CB2_InitTitleScreen);
        }
        break;
    }
}

static void sub_80EDC40(void)
{
    int i;
    u8 spriteId;

    for (i = 0; i < NELEMS(gUnknown_840BBC0); i++)
    {
        LoadCompressedSpriteSheet(&gUnknown_840BBC0[i]);
    }
    LoadSpritePalettes(gUnknown_840BBE8);
    gUnknown_203AB0E = 0x60;
    gUnknown_203AB10 = 0x10;
    gUnknown_203AB12 = 0x07;
    gUnknown_203AB14 = 0x05;
    gUnknown_203AB16 = 0x08;
    gUnknown_203AB18 = 0x5A;
    gUnknown_203AB1A = 0x78;
    gUnknown_203AB1E = 0x01;
    gUnknown_203AB20 = 0x01;
    gUnknown_203AB22 = 0x05;
    gUnknown_203AB24 = 0x05;
    if (gUnknown_203AB28 == 0)
        gUnknown_203AB28 = 354128453;
    spriteId = CreateSprite(&gUnknown_840BC6C, 0xF8, 0x37, 0);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].data[0] = 0xF80;
        gSprites[spriteId].data[1] = 0x370;
        gSprites[spriteId].data[2] = gUnknown_203AB0E;
        gSprites[spriteId].data[3] = gUnknown_203AB10;
        StoreWordInTwoHalfwords(&gSprites[spriteId].data[6], gUnknown_203AB28);
    }
}

static void sub_80EDD28(s16 x, s16 y, u16 a2)
{
    u8 spriteId;
    s16 r4 = (a2 & gUnknown_203AB12) + 2;
    s16 r2 = gUnknown_203AB2C;
    gUnknown_203AB2C++;
    if (gUnknown_203AB2C > 3)
        gUnknown_203AB2C = -3;
    x += r4;
    y += r2;
    if (x >= 1 && x <= 0xEF)
    {
        spriteId = CreateSprite(&gUnknown_840BC84, x, y, 1);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].data[0] = x << gUnknown_203AB22;
            gSprites[spriteId].data[1] = y << gUnknown_203AB24;
            gSprites[spriteId].data[2] = gUnknown_203AB1E * r4;
            gSprites[spriteId].data[3] = gUnknown_203AB20 * r2;
        }
    }
}

static void sub_80EDDF0(void)
{
    CreateTask(sub_80EDE04, 1);
}

static void sub_80EDE04(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u8 r6;
    u8 spriteId;

    data[2]++, data[3]++;
    if (data[2] > 6)
    {
        data[2] = 0;
        r6 = data[0];
        spriteId = CreateSprite(&gUnknown_840BC84, gUnknown_840BC08[r6].x, gUnknown_840BC08[r6].y, 2);
        StartSpriteAnim(&gSprites[spriteId], 1);
        gSprites[spriteId].callback = sub_80EE40C;
        gSprites[spriteId].data[1] = gUnknown_840BC08[r6].y << 4;
        gSprites[spriteId].data[2] = 120;
        gSprites[spriteId].data[3] = data[1];
        if (gSprites[spriteId].data[3] < 0)
            gSprites[spriteId].data[3] = 1;
        data[0]++;
        if (data[0] < 0 || data[0] > 8)
        {
            data[1]++;
            if (data[1] > 1)
                DestroyTask(taskId);
            else
                data[0] = 0;
        }
    }
}

static void sub_80EDED8(void)
{
    CreateTask(sub_80EDEEC, 2);
}

static void sub_80EDEEC(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    u8 r2;

    if (data[0] == 0)
    {
        r2 = data[1];
        data[1] += 4;
        if (data[1] < 0 || data[1] > 8)
            data[1] -= 9;
        CreateSprite(&gUnknown_840BCBC, gUnknown_840BC08[r2].x, gUnknown_840BC08[r2].y, 3);
        data[2]++;
        if (data[2] > 8)
            DestroyTask(taskId);
    }
    data[0]++;
    if (data[0] > 9)
        data[0] = 0;
}

static struct Sprite * sub_80EDF68(void)
{
    u8 spriteId = CreateSprite(&gUnknown_840BCDC, 120, 70, 4);
    return &gSprites[spriteId];
}

static void sub_80EDF94(struct IntroSequenceData * this)
{
    u8 taskId;
    this->field_0006 = 0;
    taskId = CreateTask(sub_80EE024, 4);
    SetWordTaskArg(taskId, 5, (uintptr_t)this);
    gTasks[taskId].data[3] = 64;
    gTasks[taskId].data[4] = GetBgX(0);
}

static void sub_80EDFD8(int a, int b, int c, int d)
{
    ChangeBgY(0, (a << 15) + 0x1F000, 0);
    ChangeBgX(0, d, 0);
    ChangeBgX(0, b << 8, 2);
    ChangeBgY(0, c << 8, 2);
}

static void sub_80EE024(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    int b, c;
    int angle;
    switch (data[0])
    {
    case 0:
        data[7] = 2;
        data[1] = 0;
        data[8] = 6;
        data[9] = 32;
        data[0]++;
        break;
    case 1:
        data[3] -= 2;
        data[1]++;
        if (data[1] > 15)
        {
            data[1] = 0;
            data[0]++;
        }
        break;
    case 2:
        data[1]++;
        if (data[1] == 14)
            ((struct IntroSequenceData *)GetWordTaskArg(taskId, 5))->field_0006 = 1;
        if (data[1] > 15)
        {
            data[1] = 0;
            data[0]++;
        }
        break;
    case 3:
        data[3] += 8;
        data[1]++;
        if (data[1] == 4)
        {
            sub_80EE160();
            data[8] = 32;
            data[9] = 48;
            data[7] = 3;
        }
        if (data[1] > 7)
        {
            data[1] = 0;
            data[0]++;
        }
        break;
    case 4:
        data[3] -= 8;
        data[1]++;
        if (data[1] > 3)
        {
            data[7] = 0;
            data[3] = 64;
            data[1] = 0;
            data[0]++;
        }
        break;
    case 5:
        DestroyTask(taskId);
        return;
    }
    angle = data[3];
    b = -((gSineTable[angle + 0x40] * data[9]) >> 8);
    c = data[8] - ((gSineTable[angle] * data[8]) >> 8);
    sub_80EDFD8(data[7], b, c, data[4]);
}

static void sub_80EE160(void)
{
    u8 spriteId;
    
    spriteId = CreateSprite(&gUnknown_840BE8C, 132,  78, 6);
    spriteId = CreateSprite(&gUnknown_840BE8C, 132, 118, 6);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].oam.shape = ST_OAM_H_RECTANGLE;
        gSprites[spriteId].oam.size = ST_OAM_SIZE_2;
        sub_80EDAD8(&gSprites[spriteId]);
        StartSpriteAnim(&gSprites[spriteId], 1);
    }
}

static void sub_80EE1C4(struct Sprite * sprite)
{
    sprite->invisible ^= TRUE;
    if (sprite->animEnded)
        DestroySprite(sprite);
}

static void sub_80EE200(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        data[1] = 0x400;
        data[0]++;
        // fallthrough
    case 1:
        data[2]++;
        if (data[2] > 39 && data[1] > 16)
            data[1] -= 16;
        gUnknown_203AB30 = ChangeBgX(0, data[1], 1);
        if (gUnknown_203AB30 >= 0x8000)
            ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        if (gUnknown_203AB30 >= 0xEF00)
        {
            ChangeBgX(0, 0xEF00, 0);
            DestroyTask(taskId);
        }
        break;
    }
}

static void sub_80EE29C(struct Sprite * sprite)
{
    u32 v;
    sprite->data[0] -= sprite->data[2];
    sprite->data[1] += sprite->data[3];
    sprite->data[4] += 48;
    sprite->pos1.x = sprite->data[0] >> 4;
    sprite->pos1.y = sprite->data[1] >> 4;
    sprite->pos2.y = gSineTable[(sprite->data[4] >> 4) + 0x40] >> 5;
    sprite->data[5]++;
    if (sprite->data[5] % gUnknown_203AB16)
    {
        LoadWordFromTwoHalfwords(&sprite->data[6], &v);
        v = v * 1103515245 + 24691;
        StoreWordInTwoHalfwords(&sprite->data[6], v);
        v >>= 16;
        sub_80EDD28(sprite->pos1.x, sprite->pos1.y + sprite->pos2.y, v);
    }
    if (sprite->pos1.x < -8)
        DestroySprite(sprite);
}

static void sub_80EE350(struct Sprite * sprite)
{
    u32 v;

    sprite->data[0] += sprite->data[2];
    sprite->data[1] += sprite->data[3];
    sprite->data[4]++;
    sprite->data[5] += sprite->data[4];
    sprite->data[7]++;
    sprite->pos1.x = (u16)sprite->data[0] >> gUnknown_203AB22;
    sprite->pos1.y = sprite->data[1] >> gUnknown_203AB24;
    if (gUnknown_203AB1C && sprite->data[3] < 0)
        sprite->pos2.y = sprite->data[5] >> gUnknown_203AB1C;
    if (sprite->data[7] > gUnknown_203AB18)
    {
        sprite->invisible = !sprite->invisible;
        if (sprite->data[7] > gUnknown_203AB1A)
            DestroySprite(sprite);
    }
    if (sprite->pos1.y + sprite->pos2.y < 0 || sprite->pos1.y + sprite->pos2.y > 160)
        DestroySprite(sprite);
}

static void sub_80EE40C(struct Sprite * sprite)
{
    if (sprite->data[2])
    {
        sprite->data[2]--;
        sprite->data[1]++;
        sprite->pos1.y = sprite->data[1] >> 4;
        if (sprite->pos1.y > 0x56)
        {
            sprite->pos1.y = 0x4A;
            sprite->data[1] = 0x4A0;
        }
        if (sprite->animEnded)
        {
            if (sprite->data[0] == 0)
            {
                sprite->pos1.x += 26;
                if (sprite->pos1.x > 188)
                {
                    sprite->pos1.x = 376 - sprite->pos1.x;
                    sprite->data[0] = 1;
                }
            }
            else
            {
                sprite->pos1.x -= 26;
                if (sprite->pos1.x < 52)
                {
                    sprite->pos1.x = 104 - sprite->pos1.x;
                    sprite->data[0] = 0;
                }
            }
            StartSpriteAnim(sprite, 1);
        }
    }
    else
    {
        if (sprite->data[3])
            DestroySprite(sprite);
        if (sprite->animEnded)
            StartSpriteAnim(sprite, 0);
        sprite->data[1] += 4;
        sprite->pos1.y = sprite->data[1] >> 4;
        sprite->data[4]++;
        if (sprite->data[4] > 50)
            DestroySprite(sprite);
    }
}

static void sub_80EE4DC(struct Sprite * sprite)
{
    if (sprite->animEnded)
        DestroySprite(sprite);
}

static void sub_80EE4F8(struct IntroSequenceData * this)
{
    u8 spriteId = CreateSprite(&gUnknown_840BD88, 0, 0, 9);
    this->field_0018 = &gSprites[spriteId];
}

static void sub_80EE528(struct Sprite * sprite, s16 a1, s16 a2, u16 a3)
{
    sprite->data[0] = a1 << 4;
    sprite->data[1] = ((a2 - a1) << 4) / a3;
    sprite->data[2] = a3;
    sprite->data[3] = a2;
    sprite->data[4] = 0;
    sprite->pos1.x = a1;
    sprite->pos1.y = 100;
    sprite->callback = sub_80EE580;
}

static void sub_80EE580(struct Sprite * sprite)
{
    sprite->data[4]++;
    if (sprite->data[4] >= 40)
    {
        if (sprite->data[1] > 1)
            sprite->data[1]--;
    }
    sprite->data[0] += sprite->data[1];
    sprite->pos1.x = sprite->data[0] >> 4;
    if (sprite->pos1.x >= sprite->data[3])
    {
        sprite->pos1.x = sprite->data[3];
        sprite->callback = SpriteCallbackDummy;
    }
}

static bool32 sub_80EE5C8(struct IntroSequenceData * ptr)
{
    return ptr->field_0018->callback == sub_80EE580 ? TRUE : FALSE;
}

static void sub_80EE5E4(struct IntroSequenceData * ptr)
{
    StartSpriteAnim(ptr->field_0018, 2);
    ptr->field_0018->data[0] = 0;
    ptr->field_0018->data[1] = 0;
    ptr->field_0018->pos2.y = 3;
    ptr->field_0018->callback = sub_80EE610;
}

static void sub_80EE610(struct Sprite * sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1]++;
        if (sprite->data[1] > 8)
        {
            StartSpriteAnim(sprite, 1);
            sprite->pos2.y = 0;
            sprite->data[0]++;
        }
        break;
    case 1:
        PlayCry3(SPECIES_NIDORINO, 0x3F, 1);
        sprite->data[1] = 0;
        sprite->data[0]++;
        break;
    case 2:
        sprite->data[2]++;
        if (sprite->data[2] > 1)
        {
            sprite->data[2] = 0;
            sprite->pos2.y = sprite->pos2.y == 0 ? 1 : 0;
        }
        sprite->data[1]++;
        if (sprite->data[1] > 48)
        {
            StartSpriteAnim(sprite, 0);
            sprite->pos2.y = 0;
            sprite->callback = SpriteCallbackDummy;
        }
        break;
    }
}

static void sub_80EE6A4(struct IntroSequenceData * ptr)
{
    gUnknown_203AB0A = 16;
    gUnknown_203AB04 = 3;
    gUnknown_203AB08 = 5;
    gUnknown_203AB06 = 0;
    StartSpriteAnim(ptr->field_0018, 2);
    ptr->field_0018->data[0] = 0;
    ptr->field_0018->data[1] = 0;
    ptr->field_0018->data[2] = 0;
    ptr->field_0018->data[3] = 0;
    ptr->field_0018->data[4] = 0;
    ptr->field_0018->data[7] = 40;
    ptr->field_0018->callback = sub_80EE704;
}

static void sub_80EE704(struct Sprite * sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1]++;
        if (sprite->data[1] > 4)
        {
            StartSpriteAnim(sprite, 3);
            sprite->data[0]++;
        }
        break;
    case 1:
        sprite->data[2] += sprite->data[7];
        sprite->data[3] += 8;
        sprite->pos2.x = sprite->data[2] >> 4;
        sprite->pos2.y = -((gSineTable[sprite->data[3]] * gUnknown_203AB04) >> gUnknown_203AB08);
        sprite->data[5]++;
        if (sprite->data[5] > gUnknown_203AB06)
        {
            sprite->data[5] = 0;
            sprite->data[7]--;
        }
        sprite->data[4]++;
        if (sprite->data[4] > 15)
        {
            StartSpriteAnim(sprite, 2);
            sprite->data[1] = 0;
            sprite->data[6] = 0x4757;
            sprite->data[7] = 28;
            sprite->data[0]++;
        }
        break;
    case 2:
        sprite->data[2] += sprite->data[7];
        sprite->pos2.x = sprite->data[2] >> 4;
        sprite->data[1]++;
        if (sprite->data[1] > 6)
        {
            sub_80EE864(sprite->pos1.x + sprite->pos2.x, sprite->pos1.y + sprite->pos2.y, sprite->data[6]);
            sprite->data[6] *= 1103515245;
        }
        if (sprite->data[1] > 12)
        {
            StartSpriteAnim(sprite, 0);
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 3:
        sprite->data[1]++;
        if (sprite->data[1] > 16)
        {
            sub_80EE970(sprite, gUnknown_203AB0A, -sprite->pos2.x, 4);
        }
        break;
    }
}

static bool8 sub_80EE850(struct IntroSequenceData * ptr)
{
    return ptr->field_0018->callback == SpriteCallbackDummy ? FALSE : TRUE;
}

static void sub_80EE864(s16 a1, s16 a2, s16 a3)
{
    int i;
    u8 spriteId;

    for (i = 0; i < 2; i++)
    {
        spriteId = CreateSprite(&gUnknown_840BEC4, a1 - 22, a2 + 24, 10);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].data[3] = (a3 % 13) + 8;
            gSprites[spriteId].data[4] = a3 % 3;
            gSprites[spriteId].data[7] = i;
            a3 *= 1103515245;
        }
    }
}

static void sub_80EE8E4(struct Sprite * sprite)
{
    s16 * data = sprite->data;

    switch (sprite->data[0])
    {
    case 0:
        data[1] = sprite->pos1.x << 4;
        data[2] = sprite->pos1.y << 4;
        sprite->data[0]++;
        // fallthrough
    case 1:
        data[1] -= data[3];
        data[2] += data[4];
        sprite->pos1.x = data[1] >> 4;
        sprite->pos1.y = data[2] >> 4;
        if (sprite->animEnded)
            DestroySprite(sprite);
        break;
    }
    data[7]++;
    if (data[7] > 1)
    {
        data[7] = 0;
        sprite->invisible ^= TRUE;
    }
}

static void sub_80EE970(struct Sprite * sprite, u16 a1, s16 a2, u8 a3)
{
    sprite->data[0] = 0;
    sprite->data[1] = a1;
    sprite->data[2] = sprite->pos2.x << 4;
    sprite->data[3] = (a2 << 4) / a1;
    sprite->data[4] = 0;
    sprite->data[5] = 0x800 / a1;
    sprite->data[6] = 0;
    sprite->data[7] = a3;
    StartSpriteAnim(sprite, 2);
    sprite->callback = sub_80EE9D4;
}

static void sub_80EE9D4(struct Sprite * sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[6]++;
        if (sprite->data[6] > 4)
        {
            StartSpriteAnim(sprite, 3);
            sprite->data[6] = 0;
            sprite->data[0]++;
        }
        break;
    case 1:
        sprite->data[1]--;
        if (sprite->data[1])
        {
            sprite->data[2] += sprite->data[3];
            sprite->data[4] += sprite->data[5];
            sprite->pos2.x = sprite->data[2] >> 4;
            sprite->pos2.y = -(gSineTable[sprite->data[4] >> 4] >> sprite->data[7]);
        }
        else
        {
            sprite->pos2.x = (u16)sprite->data[2] >> 4;
            sprite->pos2.y = 0;
            StartSpriteAnim(sprite, 2);
            if (sprite->data[7] == 5)
                sprite->callback = SpriteCallbackDummy;
            else
            {
                sprite->data[6] = 0;
                sprite->data[0]++;
            }
        }
        break;
    case 2:
        sprite->data[6]++;
        if (sprite->data[6] > 4)
        {
            StartSpriteAnim(sprite, 0);
            sprite->callback = SpriteCallbackDummy;
        }
        break;
    }
}

static void sub_80EEA94(struct IntroSequenceData * ptr)
{
    ptr->field_0018->data[0] = 0;
    ptr->field_0018->data[1] = 0;
    ptr->field_0018->data[2] = 0;
    ptr->field_0018->data[3] = 0;
    ptr->field_0018->data[4] = 0;
    ptr->field_0018->data[5] = 0;
    ptr->field_0018->pos1.x += ptr->field_0018->pos2.x;
    ptr->field_0018->pos2.x = 0;
    gUnknown_203AB0C = 0x24;
    gUnknown_203AB06 = 0x28;
    gUnknown_203AB04 = 0x03;
    gUnknown_203AB08 = 0x04;
    ptr->field_0018->data[7] = 36;
    StartSpriteAnim(ptr->field_0018, 2);
    ptr->field_0018->callback = sub_80EEB08;
}

static void sub_80EEB08(struct Sprite * sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1]++;
        if (sprite->data[1] & 1)
        {
            sprite->data[2]++;
            if (sprite->data[2] & 1)
                sprite->pos2.x++;
            else
                sprite->pos2.x--;
        }
        if (sprite->data[1] > 17)
        {
            sprite->data[1] = 0;
            sprite->data[0]++;
        }
        break;
    case 1:
        if (++sprite->data[1] >= gUnknown_203AB06)
        {
            StartSpriteAnim(sprite, 4);
            sprite->data[1] = 0;
            sprite->data[2] = 0;
            sprite->data[0]++;
        }
        break;
    case 2:
        sprite->data[1] += sprite->data[7];
        sprite->pos2.x = -(sprite->data[1] >> 4);
        sprite->pos2.y = -((gSineTable[sprite->data[1] >> 4] * gUnknown_203AB04) >> gUnknown_203AB08);
        sprite->data[2]++;
        if (sprite->data[7] > 12)
            sprite->data[7]--;
        if ((sprite->data[1] >> 4) > 0x3F)
            sprite->callback = SpriteCallbackDummy;
        break;
    }
}

static void sub_80EEBE4(void)
{
    int i;
    
    for (i = 0; i < NELEMS(gUnknown_840BEDC); i++)
    {
        LoadCompressedSpriteSheet(&gUnknown_840BEDC[i]);
    }
    // gUnknown_840BF14 is not properly terminated, so this
    // call exhibits undefined behavior.
    LoadSpritePalettes(gUnknown_840BF14);
}
