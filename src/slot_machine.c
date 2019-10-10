#include "global.h"
#include "gpu_regs.h"
#include "dma3.h"
#include "bg.h"
#include "palette.h"
#include "decompress.h"
#include "task.h"
#include "main.h"
#include "malloc.h"
#include "sound.h"
#include "coins.h"
#include "quest_log.h"
#include "overworld.h"
#include "slot_machine.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "text_window.h"
#include "random.h"
#include "trig.h"
#include "strings.h"
#include "constants/songs.h"

struct SlotMachineState
{
    MainCallback savedCallback;
    u16 machineidx;
    u16 field_06;
    u16 field_08;
    u16 slotRewardClass;
    u16 field_0C;
    u16 bet;
    u8 field_10;
    u8 field_11;
    bool32 field_14[3];
    s16 field_20[3];
    s16 field_26[3];
    s16 field_2C[3];
    s16 field_32[3];
    u32 field_38;
    u32 field_3C[5];
    u16 payout;
};

struct SlotMachineGfxManager
{
    u32 field_00[3];
    struct Sprite * field_0C[3][5];
    struct Sprite * field_48[4];
    struct Sprite * field_58[4];
    struct Sprite * field_68[2];
    vu16 * field_70;
};

struct SlotMachineSetupTaskDataSub_0000
{
    u16 unk0;
    u8 unk2;
    u8 unk3;
};

struct SlotMachineSetupTaskData
{
    struct SlotMachineSetupTaskDataSub_0000 field_0000[8];
    u8 field_0020;
    // align 2
    s32 field_0024;
    u32 field_0028;
    u16 field_002C[3][4];
    u16 field_0044[3][4];
    u8 field_005C[0x800];
    u8 field_085C[0x800];
    u8 field_105C[0x800];
    u8 field_185C[0x800];
    u8 field_205C[0x800];
}; // size: 285C

struct UnkStruct_8466C0C
{
    const u16 * tiles;
    u32 count;
};

static EWRAM_DATA struct SlotMachineState * sSlotMachineState = NULL;
static EWRAM_DATA struct SlotMachineGfxManager * sSlotMachineGfxManager = NULL;

static void sub_813F84C(struct SlotMachineState * ptr);
static void sub_813F898(void);
static void sub_813F92C(void);
static void sub_813F94C(void);
static void MainTask_SlotsGameLoop(u8 taskId);
static void MainTask_NoCoinsGameOver(u8 taskId);
static void MainTask_ShowHelp(u8 taskId);
static void MainTask_ConfirmExitGame(u8 taskId);
static void MainTask_DarnNoPayout(u8 taskId);
static void MainTask_WinHandlePayout(u8 taskId);
static void MainTask_ExitSlots(u8 taskId);
static void SetMainTask(TaskFunc taskFunc);
static void sub_8140060(u8 taskId);
static void sub_8140148(void);
static void sub_814016C(u16 whichReel, u16 whichReel2);
static bool32 sub_81401A0(u16);
static void sub_81401F0(u16 whichReel);
static void sub_81403BC(u16 whichReel);
static void sub_81404B8(u16 whichReel);
static bool32 sub_814054C(s32, s32, s32, s32, s32);
static bool32 sub_81406E8(s32, s32, s32);
static bool32 sub_81408F4(s32, s32);
static void sub_81409B4(void);
static void sub_8140A70(void);
static u16 sub_8140A80(void);
static void sub_8140C6C(struct SlotMachineGfxManager * manager);
static void sub_8140D7C(const s16 *, const s16 *);
static bool32 sub_814104C(void);
static void sub_8141094(void);
static struct SlotMachineSetupTaskData * sub_814112C(void);
static void sub_81410CC(u8 taskId);
static void sub_8141148(u16 a0, u8 a1);
static bool32 sub_8141180(u8 a0);
static bool8 sub_8141198(u8 *, struct SlotMachineSetupTaskData *);
static bool8 sub_8141460(u8 *, struct SlotMachineSetupTaskData *);
static bool8 sub_81414AC(u8 *, struct SlotMachineSetupTaskData *);
static bool8 sub_81414EC(u8 *, struct SlotMachineSetupTaskData *);
static bool8 sub_81414FC(u8 *, struct SlotMachineSetupTaskData *);
static bool8 sub_8141518(u8 *, struct SlotMachineSetupTaskData *);
static bool8 sub_8141558(u8 *, struct SlotMachineSetupTaskData *);
static bool8 sub_8141568(u8 *, struct SlotMachineSetupTaskData *);
static bool8 sub_8141578(u8 *, struct SlotMachineSetupTaskData *);
static bool8 sub_8141584(u8 *, struct SlotMachineSetupTaskData *);
static bool8 sub_81415C8(u8 *, struct SlotMachineSetupTaskData *);
static bool8 sub_8141610(u8 *, struct SlotMachineSetupTaskData *);
static bool8 sub_8141650(u8 *, struct SlotMachineSetupTaskData *);
static bool8 sub_8141690(u8 *, struct SlotMachineSetupTaskData *);
static bool8 sub_81416C8(u8 *, struct SlotMachineSetupTaskData *);
static bool8 sub_8141764(u8 *, struct SlotMachineSetupTaskData *);
static void sub_81417E4(const u8 * str);
static void sub_8141828(void);
static void sub_8141834(u16 * bgTilemapBuffer);
static void sub_81418C4(u16 * bgTilemapBuffer, u16 a0, u16 a1);
static void sub_814191C(u8 taskId);
static void sub_8141AB0(void);
static void sub_8141AD8(u8 a0);
static void sub_8141B18(void);
static void sub_8141B34(void);
static void sub_8141BA0(u8 a0);
static void sub_8141BE4(void);
static void sub_8141C30(u8, u8);

static const u8 gUnknown_8464890[][2] = {
    {0x00, 0x03},
    {0x00, 0x06},
    {0x03, 0x06},

    {0x01, 0x04},
    {0x01, 0x07},
    {0x04, 0x07},

    {0x02, 0x05},
    {0x02, 0x08},
    {0x05, 0x08},

    {0x00, 0x04},
    {0x00, 0x08},
    {0x04, 0x08},

    {0x02, 0x04},
    {0x02, 0x06},
    {0x04, 0x06}
};

static const u8 gUnknown_84648AE[][3] = {
    {0x00, 0x03, 0x06}, // top row
    {0x01, 0x04, 0x07}, // middle row
    {0x02, 0x05, 0x08}, // bottom row
    {0x00, 0x04, 0x08}, // tl-br
    {0x02, 0x04, 0x06}  // bl-tr
};

static const u8 gUnknown_84648BD[][4] = {
    {0x00, 0x04, 0x08, 0x03}, // tl-br
    {0x00, 0x03, 0x06, 0x02}, // top row
    {0x01, 0x04, 0x07, 0x01}, // middle row
    {0x02, 0x05, 0x08, 0x02}, // bottom row
    {0x02, 0x04, 0x06, 0x03}  // bl-tr
};

static const u16 gUnknown_84648D2[][7] = {
    {0x1fa1, 0x2eab, 0x3630, 0x39f3, 0x3bd4, 0x3bfc, 0x0049},
    {0x1f97, 0x2ea2, 0x3627, 0x39e9, 0x3bca, 0x3bf8, 0x0049},
    {0x1f91, 0x2e9b, 0x3620, 0x39e3, 0x3bc4, 0x3bf4, 0x0049},
    {0x1f87, 0x2e92, 0x3617, 0x39d9, 0x3bba, 0x3bef, 0x0050},
    {0x1f7f, 0x2e89, 0x360e, 0x39d1, 0x3bb2, 0x3bea, 0x0050},
    {0x1fc9, 0x2efc, 0x3696, 0x3a63, 0x3c49, 0x3c8b, 0x0073},
};

static const u8 gUnknown_8464926[][21] = {
    {0x00, 0x03, 0x04, 0x01, 0x02, 0x06, 0x02, 0x05, 0x00, 0x06, 0x03, 0x01, 0x04, 0x02, 0x06, 0x00, 0x05, 0x02, 0x01, 0x06, 0x02},
    {0x00, 0x05, 0x04, 0x03, 0x01, 0x05, 0x04, 0x03, 0x02, 0x05, 0x04, 0x03, 0x00, 0x05, 0x04, 0x01, 0x03, 0x06, 0x05, 0x03, 0x04},
    {0x00, 0x03, 0x06, 0x05, 0x02, 0x03, 0x06, 0x05, 0x02, 0x03, 0x05, 0x06, 0x02, 0x03, 0x05, 0x06, 0x02, 0x03, 0x05, 0x06, 0x01},
};

static const u16 gUnknown_8464966[] = {
      0,
      2,
      6,
      8,
     15,
    100,
    300
};

static const u16 gUnknown_8464974[] = INCBIN_U16("graphics/slot_machine/unk_8464974.gbapal");
static const u16 gUnknown_8464994[] = INCBIN_U16("graphics/slot_machine/unk_8464994.gbapal");
static const u16 gUnknown_84649B4[] = INCBIN_U16("graphics/slot_machine/unk_84649b4.gbapal");
static const u16 gUnknown_84649D4[] = INCBIN_U16("graphics/slot_machine/unk_84649d4.gbapal");
static const u16 gUnknown_84649F4[] = INCBIN_U16("graphics/slot_machine/unk_84649f4.gbapal");
static const u32 gUnknown_8464A14[] = INCBIN_U32("graphics/slot_machine/unk_8464a14.4bpp.lz");
static const u16 gUnknown_846504C[] = INCBIN_U16("graphics/slot_machine/unk_846504c.gbapal");
static const u32 gUnknown_846506C[] = INCBIN_U32("graphics/slot_machine/unk_846506c.4bpp.lz");
static const u16 gUnknown_8465524[] = INCBIN_U16("graphics/slot_machine/unk_8465524.gbapal");
static const u32 gUnknown_8465544[] = INCBIN_U32("graphics/slot_machine/unk_8465544.4bpp.lz");

static const struct CompressedSpriteSheet gUnknown_84655B0[] = {
    {(const void *)gUnknown_8464A14, 0xe00, 0},
    {(const void *)gUnknown_846506C, 0xc00, 1},
    {(const void *)gUnknown_8465544, 0x280, 2},
};

static const struct SpritePalette gUnknown_84655C8[] = {
    {gUnknown_8464974, 0},
    {gUnknown_8464994, 1},
    {gUnknown_84649B4, 2},
    {gUnknown_84649D4, 3},
    {gUnknown_84649F4, 4},
    {gUnknown_846504C, 5},
    {gUnknown_8465524, 6},
    {NULL}
};

static const u16 gUnknown_8465608[] = {
    2,
    2,
    0,
    0,
    2,
    4,
    3
};

static const u16 gUnknown_8465616[] = {
    0x0120, 0x011f, 0x011e, 0x011d, 0x011c, 0x011b, 0x011a, 0x0119, 0x0118, 0x0117, 0x0116, 0x0115, 0x0114, 0x0113, 0x0112, 0x0111,
    0x0110, 0x010f, 0x010e, 0x010d, 0x010c, 0x010b, 0x010a, 0x0109, 0x0108, 0x0107, 0x0106, 0x0105, 0x0104, 0x0103, 0x0102, 0x0101,
    0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100,
    0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100, 0x0100,
    0x0101, 0x0102, 0x0103, 0x0104, 0x0105, 0x0106, 0x0107, 0x0108, 0x0109, 0x010a, 0x010b, 0x010c, 0x010d, 0x010e, 0x010f, 0x0110,
    0x0111, 0x0112, 0x0113, 0x0114, 0x0115, 0x0116, 0x0117, 0x0118, 0x0119, 0x011a, 0x011b, 0x011c, 0x011d, 0x011e, 0x011f, 0x0120
};

static const u8 gUnknown_84656D6[] = {
    0x10, 0x10, 0x10, 0x10, 0x0f, 0x0e, 0x0d, 0x0d, 0x0c, 0x0b, 0x0a, 0x0a, 0x09, 0x08, 0x07, 0x07, 0x06, 0x05, 0x04, 0x04, 0x03, 0x02, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x03, 0x03, 0x04, 0x05, 0x06, 0x06, 0x07, 0x08, 0x09, 0x09, 0x0a, 0x0b, 0x0c, 0x0c, 0x0d, 0x0e, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f
};

static const struct OamData gUnknown_8465738 = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_SIZE_2,
    .tileNum = 0,
    .priority = 3,
    .paletteNum = 0,
    .affineParam = 0
};

static const union AnimCmd gUnknown_8465740[] = {
    ANIMCMD_FRAME(0x00, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_8465748[] = {
    ANIMCMD_FRAME(0x10, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_8465750[] = {
    ANIMCMD_FRAME(0x20, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_8465758[] = {
    ANIMCMD_FRAME(0x30, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_8465760[] = {
    ANIMCMD_FRAME(0x40, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_8465768[] = {
    ANIMCMD_FRAME(0x50, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_8465770[] = {
    ANIMCMD_FRAME(0x60, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_8465778[] = {
    ANIMCMD_FRAME(0x20, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_8465780[] = {
    ANIMCMD_FRAME(0x30, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_8465788[] = {
    ANIMCMD_FRAME(0x40, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_8465790[] = {
    ANIMCMD_FRAME(0x50, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_8465798[] = {
    ANIMCMD_FRAME(0x60, 4),
    ANIMCMD_END
};

static const union AnimCmd *const gUnknown_84657A0[] = {
    gUnknown_8465740,
    gUnknown_8465748,
    gUnknown_8465750,
    gUnknown_8465758,
    gUnknown_8465760,
    gUnknown_8465768,
    gUnknown_8465770,
    gUnknown_8465778,
    gUnknown_8465780,
    gUnknown_8465788,
    gUnknown_8465790,
    gUnknown_8465798
};

static const union AffineAnimCmd gUnknown_84657D0[] = {
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 1),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const gUnknown_84657E0[] = {
    gUnknown_84657D0
};

static const struct SpriteTemplate gUnknown_84657E4 = {
    0, 0, &gUnknown_8465738, gUnknown_84657A0, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

static const struct OamData gUnknown_84657FC = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_V_RECTANGLE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_SIZE_0,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0
};

static const union AnimCmd gUnknown_8465804[] = {
    ANIMCMD_FRAME(0x00, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846580C[] = {
    ANIMCMD_FRAME(0x02, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_8465814[] = {
    ANIMCMD_FRAME(0x04, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846581C[] = {
    ANIMCMD_FRAME(0x06, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_8465824[] = {
    ANIMCMD_FRAME(0x08, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846582C[] = {
    ANIMCMD_FRAME(0x0a, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_8465834[] = {
    ANIMCMD_FRAME(0x0c, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846583C[] = {
    ANIMCMD_FRAME(0x0e, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_8465844[] = {
    ANIMCMD_FRAME(0x10, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846584C[] = {
    ANIMCMD_FRAME(0x12, 4),
    ANIMCMD_END
};

static const union AnimCmd *const gUnknown_8465854[] = {
    gUnknown_8465804,
    gUnknown_846580C,
    gUnknown_8465814,
    gUnknown_846581C,
    gUnknown_8465824,
    gUnknown_846582C,
    gUnknown_8465834,
    gUnknown_846583C,
    gUnknown_8465844,
    gUnknown_846584C
};

static const struct SpriteTemplate gUnknown_846587C = {
    2, 6, &gUnknown_84657FC, gUnknown_8465854, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

static const struct OamData gUnknown_8465894 = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_SIZE_2,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0
};

static const union AnimCmd gUnknown_846589C[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_84658A4[] = {
    ANIMCMD_FRAME( 0, 24),
    ANIMCMD_FRAME(16, 24),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd gUnknown_84658B0[] = {
    ANIMCMD_FRAME(32, 28),
    ANIMCMD_FRAME(48, 28),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd gUnknown_84658BC[] = {
    ANIMCMD_FRAME(64, 12),
    ANIMCMD_FRAME(80, 12),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const gUnknown_84658C8[] = {
    gUnknown_846589C,
    gUnknown_84658A4,
    gUnknown_84658B0,
    gUnknown_84658BC
};

static const struct SpriteTemplate gUnknown_84658D8 = {
    1, 5, &gUnknown_8465894, gUnknown_84658C8, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

bool8 (*const gUnknown_84658F0[])(u8 *, struct SlotMachineSetupTaskData *) = {
    sub_8141198,
    sub_8141460,
    sub_81414AC,
    sub_81414EC,
    sub_81414FC,
    sub_8141518,
    sub_8141558,
    sub_8141568,
    sub_8141578,
    sub_8141584,
    sub_81415C8,
    sub_8141610,
    sub_8141650,
    sub_8141690,
    sub_81416C8,
    sub_8141764
};

static const u16 gUnknown_8465930[] = INCBIN_U16("graphics/slot_machine/unk_8465930.gbapal");
static const u16 gUnknown_8465950[] = INCBIN_U16("graphics/slot_machine/unk_8465950.gbapal");
static const u16 gUnknown_8465970[] = INCBIN_U16("graphics/slot_machine/unk_8465970.gbapal");
static const u16 gUnknown_8465990[] = INCBIN_U16("graphics/slot_machine/unk_8465990.gbapal");
static const u16 gUnknown_84659B0[] = INCBIN_U16("graphics/slot_machine/unk_84659b0.gbapal");
static const u32 gUnknown_84659D0[] = INCBIN_U32("graphics/slot_machine/unk_84659d0.4bpp.lz");
static const u32 gUnknown_84661D4[] = INCBIN_U32("graphics/slot_machine/unk_84661d4.bin.lz");
static const u16 gUnknown_84664BC[] = INCBIN_U16("graphics/slot_machine/unk_84664bc.gbapal");
static const u16 gUnknown_84664DC[] = INCBIN_U16("graphics/slot_machine/unk_84664dc.gbapal","graphics/slot_machine/unk_84664fc.gbapal", "graphics/slot_machine/unk_846651c.gbapal");
static const u32 gUnknown_846653C[] = INCBIN_U32("graphics/slot_machine/unk_846653c.4bpp.lz");
static const u16 gUnknown_84665C0[] = INCBIN_U16("graphics/slot_machine/unk_84665c0.gbapal");
static const u16 gUnknown_84665E0[] = INCBIN_U16("graphics/slot_machine/unk_84665e0.gbapal");
static const u16 gUnknown_8466600[] = INCBIN_U16("graphics/slot_machine/unk_8466600.gbapal");
static const u32 gUnknown_8466620[] = INCBIN_U32("graphics/slot_machine/unk_8466620.4bpp.lz");
static const u32 gUnknown_8466998[] = INCBIN_U32("graphics/slot_machine/unk_8466998.bin.lz");

static const struct BgTemplate gUnknown_8466B10[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }, {
        .bg = 2,
        .charBaseIndex = 2,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 1,
        .mapBaseIndex = 28,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }
};

static const struct WindowTemplate gUnknown_8466B20[] = {
    {
        .bg = 0,
        .tilemapLeft = 5,
        .tilemapTop = 15,
        .width = 20,
        .height = 4,
        .paletteNum = 0x0f,
        .baseBlock = 0x04f
    }, {
        .bg = 0,
        .tilemapLeft = 0,
        .tilemapTop = 0,
        .width = 30,
        .height = 2,
        .paletteNum = 0x0e,
        .baseBlock = 0x013
    },
    DUMMY_WIN_TEMPLATE
};

static const u16 gUnknown_8466B38[] = {
    0x00a4, 0x00a5, 0x00a6, 0x00c4, 0x00c5, 0x00c6, 0x00c7, 0x00e7, 0x012c, 0x014c, 0x0191, 0x01b1, 0x01f6, 0x0216, 0x0217, 0x0218, 0x0219, 0x0237, 0x0238, 0x0239
};

static const u16 gUnknown_8466B60[] = {
    0x00e4, 0x00e5, 0x00e6, 0x00f7, 0x00f8, 0x00f9, 0x0104, 0x0105, 0x0106, 0x0107, 0x010c, 0x0111, 0x0116, 0x0117, 0x0118, 0x0119, 0x0124, 0x0125, 0x0126, 0x0137, 0x0138, 0x0139
};

static const u16 gUnknown_8466B8C[] = {
    0x0144, 0x0145, 0x0146, 0x0157, 0x0158, 0x0159, 0x0164, 0x0165, 0x0166, 0x0167, 0x016c, 0x0171, 0x0176, 0x0177, 0x0178, 0x0179, 0x0184, 0x0185, 0x0186, 0x0197, 0x0198, 0x0199
};

static const u16 gUnknown_8466BB8[] = {
    0x01a4, 0x01a5, 0x01a6, 0x01b7, 0x01b8, 0x01b9, 0x01c4, 0x01c5, 0x01c6, 0x01c7, 0x01cc, 0x01d1, 0x01d6, 0x01d7, 0x01d8, 0x01d9, 0x01e4, 0x01e5, 0x01e6, 0x01f7, 0x01f8, 0x01f9
};

static const u16 gUnknown_8466BE4[] = {
    0x0204, 0x0205, 0x0206, 0x0224, 0x0225, 0x0226, 0x01e7, 0x0207, 0x018c, 0x01ac, 0x0131, 0x0151, 0x00d6, 0x00f6, 0x00b7, 0x00b8, 0x00b9, 0x00d7, 0x00d8, 0x00d9
};

static const struct UnkStruct_8466C0C gUnknown_8466C0C[] = {
    { gUnknown_8466B38, NELEMS(gUnknown_8466B38) },
    { gUnknown_8466B60, NELEMS(gUnknown_8466B60) },
    { gUnknown_8466B8C, NELEMS(gUnknown_8466B8C) },
    { gUnknown_8466BB8, NELEMS(gUnknown_8466BB8) },
    { gUnknown_8466BE4, NELEMS(gUnknown_8466BE4) }
};

static const u8 gUnknown_8466C34[2] = {2, 4};

static const struct WindowTemplate gUnknown_8466C38 = {
    .bg = 0,
    .tilemapLeft = 19,
    .tilemapTop = 9,
    .width = 6,
    .height = 4,
    .paletteNum = 15,
    .baseBlock = 0x9F
};

static const u16 gUnknown_8466C40[][4] = {
    {0x0229, 0x022a, 0x0249, 0x024a},
    {0x022e, 0x022f, 0x024e, 0x024f},
    {0x0233, 0x0234, 0x0253, 0x0254}
};

void PlaySlotMachine(u16 machineIdx, MainCallback savedCallback)
{
    ResetTasks();
    sSlotMachineState = Alloc(sizeof(*sSlotMachineState));
    if (sSlotMachineState == NULL)
        SetMainCallback2(savedCallback);
    else
    {
        if (machineIdx > 5)
            machineIdx = 0;
        sSlotMachineState->machineidx = machineIdx;
        sSlotMachineState->savedCallback = savedCallback;
        sub_813F84C(sSlotMachineState);
        SetMainCallback2(sub_813F898);
    }
}

static void sub_813F84C(struct SlotMachineState * ptr)
{
    s32 i;

    ptr->field_06 = 0;
    ptr->bet = 0;
    ptr->payout = 0;
    // for whatever reason, the loop does not use the ptr param
    for (i = 0; i < 3; i++)
    {
        sSlotMachineState->field_14[i] = FALSE;
        sSlotMachineState->field_20[i] =     0;
        sSlotMachineState->field_26[i] =     0;
        sSlotMachineState->field_2C[i] =    21;
    }
}

static void sub_813F898(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();

    switch (gMain.state)
    {
    case 0:
        if (sub_814104C())
        {
            SetMainCallback2(sSlotMachineState->savedCallback);
            sub_813F92C();
        }
        else
        {
            sub_8141148(0, 0);
            gMain.state++;
        }
        break;
    case 1:
        if (!sub_8141180(0))
        {
            sSlotMachineState->field_10 = CreateTask(MainTask_SlotsGameLoop, 0);
            sSlotMachineState->field_11 = CreateTask(sub_8140060, 1);
            SetMainCallback2(sub_813F94C);
        }
        break;
    }
}

static void sub_813F92C(void)
{
    sub_8141094();
    if (sSlotMachineState != NULL)
    {
        Free(sSlotMachineState);
        sSlotMachineState = NULL;
    }
}

static void sub_813F94C(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void MainTask_SlotsGameLoop(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        if (GetCoins() == 0)
        {
            SetMainTask(MainTask_NoCoinsGameOver);
        }
        else if (JOY_NEW(DPAD_DOWN))
        {
            sSlotMachineState->bet++;
            TakeCoins(1);
            PlaySE(SE_REGI);
            sub_8141148(8, 0);
            sub_8141148(2, 1);
            data[0] = 1;
        }
        else if (JOY_NEW(R_BUTTON))
        {
            s32 toAdd = 3 - sSlotMachineState->bet;
            if (GetCoins() >= toAdd)
            {
                sSlotMachineState->bet = 3;
                TakeCoins(toAdd);
            }
            else
            {
                sSlotMachineState->bet += GetCoins();
                SetCoins(0);
            }
            PlaySE(SE_REGI);
            sub_8141148(8, 0);
            sub_8141148(2, 1);
            data[0] = 1;
        }
        else if (JOY_NEW(A_BUTTON) && sSlotMachineState->bet != 0)
        {
            data[0] = 2;
        }
        else if (JOY_NEW(B_BUTTON))
        {
            SetMainTask(MainTask_ConfirmExitGame);
        }
        else if (JOY_NEW(DPAD_RIGHT))
        {
            SetMainTask(MainTask_ShowHelp);
        }
        break;
    case 1:
        if (!sub_8141180(0) && !sub_8141180(1))
        {
            if (sSlotMachineState->bet == 3 || GetCoins() == 0)
                data[0] = 2;
            else
                data[0] = 0;
        }
        break;
    case 2:
        sub_811539C();
        sub_81409B4();
        sub_8140148();
        sSlotMachineState->field_06 = 0;
        sub_8141148(3, 0);
        data[0] = 3;
        break;
    case 3:
        if (!sub_8141180(0))
        {
            if (JOY_NEW(A_BUTTON))
            {
                PlaySE(SE_JYUNI);
                sub_814016C(sSlotMachineState->field_06, sSlotMachineState->field_06);
                sub_8141C30(sSlotMachineState->field_06, 0);
                data[0] = 4;
            }
        }
        break;
    case 4:
        if (sub_81401A0(sSlotMachineState->field_06) == 0 && !sub_8141180(0))
        {
            sSlotMachineState->field_06++;
            if (sSlotMachineState->field_06 >= 3)
            {
                sSlotMachineState->slotRewardClass = sub_8140A80();
                sSlotMachineState->bet = 0;
                sSlotMachineState->field_06 = 0;
                if (sSlotMachineState->slotRewardClass == 0)
                    SetMainTask(MainTask_DarnNoPayout);
                else
                {
                    if (sSlotMachineState->slotRewardClass == 6)
                        IncrementGameStat(GAME_STAT_SLOT_JACKPOTS);
                    sub_8140A70();
                    SetMainTask(MainTask_WinHandlePayout);
                }
            }
            else
                data[0] = 3;
        }
        break;
    }
}

static void MainTask_NoCoinsGameOver(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        sub_8141148(9, 0);
        data[0]++;
        break;
    case 1:
        if (!sub_8141180(0))
            data[0]++;
        break;
    case 2:
        if (JOY_NEW(A_BUTTON | B_BUTTON | DPAD_ANY))
            SetMainTask(MainTask_ExitSlots);
        break;
    }
}

static void MainTask_ShowHelp(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        sub_8141148(14, 0);
        data[0]++;
        break;
    case 1:
        if (!sub_8141180(0))
            data[0]++;
        break;
    case 2:
        if (JOY_NEW(DPAD_LEFT))
        {
            sub_8141148(15, 0);
            data[0]++;
        }
        break;
    case 3:
        if (!sub_8141180(0))
            SetMainTask(MainTask_SlotsGameLoop);
        break;
    }
}

static void MainTask_ConfirmExitGame(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        sub_8141148(10, 0);
        data[0]++;
        break;
    case 1:
        if (!sub_8141180(0))
            data[0]++;
        break;
    case 2:
        switch (Menu_ProcessInputNoWrapClearOnChoose())
        {
        case 0:
            GiveCoins(sSlotMachineState->bet);
            sub_8141148(8, 0);
            data[0] = 3;
            break;
        case 1:
        case -1:
            sub_8141148(11, 0);
            data[0] = 4;
            break;
        }
        break;
    case 3:
        if (!sub_8141180(0))
            SetMainTask(MainTask_ExitSlots);
        break;
    case 4:
        if (!sub_8141180(0))
            SetMainTask(MainTask_SlotsGameLoop);
        break;
    }
}

static void MainTask_DarnNoPayout(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        sub_8141148(6, 0);
        data[1] = 0;
        data[0]++;
        break;
    case 1:
        data[1]++;
        if (data[1] > 60)
        {
            sub_8141148(7, 0);
            sub_8141148(2, 1);
            sub_8141148(13, 2);
            data[0]++;
        }
        break;
    case 2:
        if (!sub_8141180(0) && !sub_8141180(1) && !sub_8141180(2))
            SetMainTask(MainTask_SlotsGameLoop);
        break;
    }
}

static void MainTask_WinHandlePayout(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        if (sSlotMachineState->slotRewardClass == 5 || sSlotMachineState->slotRewardClass == 6)
            PlayFanfare(MUS_ME_B_BIG);
        else
            PlayFanfare(MUS_ME_B_SMALL);
        sub_8141148(8, 0);
        sub_8141148(4, 1);
        data[1] = 8;
        data[0]++;
        break;
    case 1:
        data[1]++;
        if (data[1] > 120)
        {
            data[1] = 8;
            if (JOY_HELD(A_BUTTON))
                data[1] = 2;
            data[0]++;
        }
        break;
    case 2:
        if (!sub_8141180(0))
        {
            if (IsFanfareTaskInactive() && JOY_NEW(START_BUTTON))
            {
                GiveCoins(sSlotMachineState->payout);
                sSlotMachineState->payout = 0;
            }
            else
            {
                data[1]--;
                if (data[1] == 0)
                {
                    if (IsFanfareTaskInactive())
                        PlaySE(SE_PIN);
                    if (sSlotMachineState->payout != 0)
                    {
                        GiveCoins(1);
                        sSlotMachineState->payout--;
                    }
                    data[1] = 8;
                    if (JOY_HELD(A_BUTTON))
                        data[1] = 2;
                }
            }
            sub_8141148(8, 0);
            if (sSlotMachineState->payout == 0)
                data[0]++;
        }
        break;
    case 3:
        if (IsFanfareTaskInactive() && !sub_8141180(0))
        {
            sub_8141148(5, 0);
            data[0]++;
        }
        break;
    case 4:
        if (!sub_8141180(0))
        {
            sub_8141148(2, 0);
            sub_8141148(13, 1);
            data[0]++;
        }
        break;
    case 5:
        if (!sub_8141180(0) && !sub_8141180(1))
            SetMainTask(MainTask_SlotsGameLoop);
        break;
    }
}

static void MainTask_ExitSlots(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        sub_8141148(1, 0);
        data[0]++;
        break;
    case 1:
        if (!sub_8141180(0))
        {
            SetMainCallback2(sSlotMachineState->savedCallback);
            sub_813F92C();
        }
        break;
    }
}

static void SetMainTask(TaskFunc taskFunc)
{
    gTasks[sSlotMachineState->field_10].func = taskFunc;
    gTasks[sSlotMachineState->field_10].data[0] = 0;
}

static void sub_8140060(u8 taskId)
{
    // taskId is never used

    s32 i;

    for (i = 0; i < 3; i++)
    {
        if (sSlotMachineState->field_14[i] || sSlotMachineState->field_26[i] != 0)
        {
            if (sSlotMachineState->field_26[i] != 0 || sSlotMachineState->field_20[i] != sSlotMachineState->field_2C[i])
            {
                sSlotMachineState->field_26[i]++;
                if (sSlotMachineState->field_26[i] > 2)
                {
                    sSlotMachineState->field_26[i] = 0;
                    sSlotMachineState->field_20[i]--;
                    if (sSlotMachineState->field_20[i] < 0)
                        sSlotMachineState->field_20[i] = 20;
                }
                if (sSlotMachineState->field_20[i] != sSlotMachineState->field_2C[i])
                    continue;
            }
            sSlotMachineState->field_2C[i] = 21;
            sSlotMachineState->field_14[i] = FALSE;
        }
    }
    sub_8140D7C(sSlotMachineState->field_20, sSlotMachineState->field_26);
}

static void sub_8140148(void)
{
    s32 i;

    for (i = 0; i < 3; i++)
    {
        sSlotMachineState->field_14[i] = TRUE;
    }
}

static void sub_814016C(u16 whichReel, u16 whichReel2)
{
    switch (whichReel2)
    {
    case 0:
        sub_81401F0(whichReel);
        break;
    case 1:
        sub_81403BC(whichReel);
        break;
    case 2:
        sub_81404B8(whichReel);
        break;
    }
}

static bool32 sub_81401A0(u16 whichReel)
{
    return sSlotMachineState->field_14[whichReel];
}

static s16 sub_81401B4(u16 whichReel)
{
    s16 position = sSlotMachineState->field_20[whichReel];
    if (sSlotMachineState->field_26[whichReel] != 0)
    {
        position--;
        if (position < 0)
            position = 20;
    }
    return position;
}

static void sub_81401F0(u16 whichReel)
{
    s32 i, j;
    s16 r2;
    u8 sp0[5];
    s16 sp0C = sub_81401B4(whichReel);
    s32 r8 = 0;

    if (sSlotMachineState->field_08 == 0 && whichReel == 0)
    {
        for (i = 0; i < 5; i++)
        {
            for (j = 0, r2 = sp0C - i + 1; j < 3; j++, r2++)
            {
                if (r2 >= 21)
                    r2 = 0;
                if (sub_81408F4(1, gUnknown_8464926[whichReel][r2]))
                    break;
            }
            if (j == 3)
            {
                sp0[r8] = i;
                r8++;
            }
        }
    }
    else if (sSlotMachineState->field_08 != 1 || whichReel == 0)
    {
        for (i = 0, r2 = sp0C + 1; i < 3; i++, r2++)
        {
            if (r2 >= 21)
                r2 = 0;
            if (sub_81408F4(sSlotMachineState->field_08, gUnknown_8464926[whichReel][r2]))
            {
                sp0[0] = 0;
                r8 = 1;
                break;
            }
        }
        for (i = 0, r2 = sp0C; i < 4; i++, r2--)
        {
            if (r2 < 0)
                r2 = 20;
            if (sub_81408F4(sSlotMachineState->field_08, gUnknown_8464926[whichReel][r2]))
            {
                sp0[r8] = i + 1;
                r8++;
            }
        }
    }
    if (r8 == 0)
    {
        r2 = Random() % 5;
    }
    else
    {
        r2 = sp0[Random() % r8];
    }
    r2 = sp0C - r2;
    if (r2 < 0)
        r2 += 21;
    sSlotMachineState->field_32[0] = whichReel;
    sSlotMachineState->field_2C[whichReel] = r2;
}

static void sub_81403BC(u16 whichReel)
{
    s16 r2, r4, r7, sp10;
    s32 i;
    s32 r6;
    u8 sp4[5];

    r7 = sSlotMachineState->field_32[0];
    r4 = sSlotMachineState->field_20[r7] + 1;
    if (r4 >= 21)
        r4 = 0;
    sp10 = sub_81401B4(whichReel);
    r2 = sp10 + 1;
    if (r2 >= 21)
        r2 = 0;
    r6 = 0;
    for (i = 0; i < 5; i++)
    {
        if (sub_814054C(r7, r4, whichReel, r2, sSlotMachineState->field_08))
        {
            sp4[r6] = i;
            r6++;
        }
        r2--;
        if (r2 < 0)
            r2 = 20;
    }
    if (r6 == 0)
    {
        sSlotMachineState->field_38 = 0;
        if (sSlotMachineState->field_08 == 5 || sSlotMachineState->field_08 == 6)
            r2 = 4;
        else
            r2 = 0;
    }
    else
    {
        sSlotMachineState->field_38 = 1;
        r2 = sp4[0];
    }
    r2 = sp10 - r2;
    if (r2 < 0)
        r2 += 21;
    sSlotMachineState->field_32[1] = whichReel;
    sSlotMachineState->field_2C[whichReel] = r2;
}

static void sub_81404B8(u16 whichReel)
{
    s32 i;
    s32 r6;
    s32 r9;
    s32 r4;
    s32 r2;
    u8 sp0[5];

    r9 = sub_81401B4(whichReel);
    r4 = r9;
    r6 = 0;
    for (i = 0; i < 5; i++)
    {
        if (sub_81406E8(whichReel, r4, sSlotMachineState->field_08))
        {
            sp0[r6] = i;
            r6++;
        }
        r4--;
        if (r4 < 0)
            r4 = 20;
    }
    if (r6 == 0)
    {
        if (sSlotMachineState->field_08 == 5 || sSlotMachineState->field_08 == 6)
            r2 = 4;
        else
            r2 = 0;
    }
    else
        r2 = sp0[0];
    r2 = r9 - r2;
    if (r2 < 0)
        r2 += 21;
    sSlotMachineState->field_2C[whichReel] = r2;
}

static bool32 sub_814054C(s32 a0, s32 a1, s32 a2, s32 a3, s32 a4)
{
    s32 i;
    s32 r5;
    u8 sp0[9] = {};

    for (i = 0; i < 9; i++)
        sp0[i] = 7;

    for (i = 0; i < 3; i++)
    {
        sp0[3 * a0 + i] = gUnknown_8464926[a0][a1];
        sp0[3 * a2 + i] = gUnknown_8464926[a2][a3];
        a1++;
        if (a1 >= 21)
            a1 = 0;
        a3++;
        if (a3 >= 21)
            a3 = 0;
    }

    switch (a4)
    {
    case 0:
        for (i = 0; i < 3; i++)
        {
            if (sub_81408F4(1, sp0[i]))
                return FALSE;
        }
        for (i = 0; i < 15; i++)
        {
            if (sp0[gUnknown_8464890[i][0]] == sp0[gUnknown_8464890[i][1]])
                return TRUE;
        }
        return FALSE;
    case 1:
        if (a0 == 0 || a2 == 0)
        {
            if (a0 == 1 || a2 == 1)
            {
                for (i = 0; i < 15; i += 3)
                {
                    if (sp0[gUnknown_8464890[i][0]] == sp0[gUnknown_8464890[i][1]])
                        return FALSE;
                }
            }
            for (i = 0; i < 3; i++)
            {
                if (sub_81408F4(a4, sp0[i]))
                    return TRUE;
            }
            return FALSE;
        }
        else
            return TRUE;
    case 2:
        if (a0 == 2 || a2 == 2)
        {
            for (i = 0; i < 9; i++)
            {
                if (sub_81408F4(a4, sp0[i]))
                    return TRUE;
            }
            return FALSE; // wrong level
        }
    }
    for (i = 0; i < 15; i++)
    {
        if (sp0[gUnknown_8464890[i][0]] == sp0[gUnknown_8464890[i][1]] && sub_81408F4(a4, sp0[gUnknown_8464890[i][0]]))
            return TRUE;
    }
    return FALSE;
}

#ifdef NONMATCHING
static bool32 sub_81406E8(s32 a0, s32 a1, s32 a2)
{
    u8 sp0[9];
    s32 r3, r6;
    s32 i;

    r6 = sSlotMachineState->field_20[sSlotMachineState->field_32[0]] + 1;
    r3 = sSlotMachineState->field_20[sSlotMachineState->field_32[1]] + 1;
    a1++;
    if (r6 >= 21)
        r6 = 0;
    if (r3 >= 21)
        r3 = 0;
    if (a1 >= 21)
        a1 = 0;
    for (i = 0; i < 3; i++)
    {
        sp0[sSlotMachineState->field_32[0] * 3 + i] = gUnknown_8464926[sSlotMachineState->field_32[0]][r6];
        sp0[sSlotMachineState->field_32[1] * 3 + i] = gUnknown_8464926[sSlotMachineState->field_32[1]][r3];
        sp0[a0 * 3 + i] = gUnknown_8464926[a0][a1];
        r6++;
        if (r6 >= 21)
            r6 = 0;
        r3++;
        if (r3 >= 21)
            r3 = 0;
        a1++;
        if (a1 >= 21)
            a1++;
    }
    switch (a2)
    {
    case 0:
        for (i = 0; i < 3; i++)
        {
            if (sub_81408F4(1, sp0[i]))
                return FALSE;
        }
        for (i = 0; i < 5; i++)
        {
            if (sp0[gUnknown_84648AE[i][0]] == sp0[gUnknown_84648AE[i][1]] && sp0[gUnknown_84648AE[i][0]] == sp0[gUnknown_84648AE[i][2]])
                return FALSE;
        }
        return TRUE;
    case 1:
        for (i = 0; i < 5; i++)
        {
            if (sp0[gUnknown_84648AE[i][0]] == sp0[gUnknown_84648AE[i][1]] && sub_81408F4(a2, sp0[gUnknown_84648AE[i][0]]))
                return FALSE;
        }
        for (i = 0; i < 3; i++)
        {
            if (sub_81408F4(a2, sp0[i]))
                return TRUE;
        }
        return FALSE;
    case 2:
        for (i = 0; i < 5; i++)
        {
            if (sp0[gUnknown_84648AE[i][0]] == sp0[gUnknown_84648AE[i][1]] && sub_81408F4(a2, sp0[gUnknown_84648AE[i][0]]))
                return TRUE;
        }
        return FALSE;
    }
    for (i = 0; i < 5; i++)
    {
        if (sp0[gUnknown_84648AE[i][0]] == sp0[gUnknown_84648AE[i][1]] && sp0[gUnknown_84648AE[i][0]] == sp0[gUnknown_84648AE[i][2]] && sub_81408F4(a2, sp0[gUnknown_84648AE[i][0]]))
            return TRUE;
    }
    return FALSE;
}
#else
NAKED
static bool32 sub_81406E8(s32 a0, s32 a1, s32 a2)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x10\n"
                "\tadds r7, r0, 0\n"
                "\tadds r5, r1, 0\n"
                "\tmov r8, r2\n"
                "\tldr r0, _081407C8 @ =sSlotMachineState\n"
                "\tldr r2, [r0]\n"
                "\tmovs r1, 0x32\n"
                "\tldrsh r0, [r2, r1]\n"
                "\tlsls r0, 1\n"
                "\tadds r1, r2, 0\n"
                "\tadds r1, 0x20\n"
                "\tadds r0, r1, r0\n"
                "\tmovs r3, 0\n"
                "\tldrsh r0, [r0, r3]\n"
                "\tadds r6, r0, 0x1\n"
                "\tmovs r3, 0x34\n"
                "\tldrsh r0, [r2, r3]\n"
                "\tlsls r0, 1\n"
                "\tadds r1, r0\n"
                "\tmovs r3, 0\n"
                "\tldrsh r0, [r1, r3]\n"
                "\tadds r3, r0, 0x1\n"
                "\tadds r5, 0x1\n"
                "\tcmp r6, 0x14\n"
                "\tble _08140726\n"
                "\tmovs r6, 0\n"
                "_08140726:\n"
                "\tcmp r3, 0x14\n"
                "\tble _0814072C\n"
                "\tmovs r3, 0\n"
                "_0814072C:\n"
                "\tcmp r5, 0x14\n"
                "\tble _08140732\n"
                "\tmovs r5, 0\n"
                "_08140732:\n"
                "\tmovs r4, 0\n"
                "\tlsls r1, r7, 1\n"
                "\tlsls r0, r7, 2\n"
                "\tmov r9, r2\n"
                "\tldr r2, _081407CC @ =gUnknown_8464926\n"
                "\tmov r10, r2\n"
                "\tadds r1, r7\n"
                "\tadd r1, sp\n"
                "\tmov r12, r1\n"
                "\tadds r0, r7\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r7\n"
                "\tstr r0, [sp, 0xC]\n"
                "_0814074C:\n"
                "\tmov r7, r9\n"
                "\tmovs r0, 0x32\n"
                "\tldrsh r1, [r7, r0]\n"
                "\tlsls r0, r1, 1\n"
                "\tadds r0, r1\n"
                "\tadds r0, r4\n"
                "\tmov r7, sp\n"
                "\tadds r2, r7, r0\n"
                "\tlsls r0, r1, 2\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tadds r0, r6, r0\n"
                "\tadd r0, r10\n"
                "\tldrb r0, [r0]\n"
                "\tstrb r0, [r2]\n"
                "\tmov r0, r9\n"
                "\tmovs r2, 0x34\n"
                "\tldrsh r1, [r0, r2]\n"
                "\tlsls r0, r1, 1\n"
                "\tadds r0, r1\n"
                "\tadds r0, r4\n"
                "\tadds r2, r7, r0\n"
                "\tlsls r0, r1, 2\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r1\n"
                "\tadds r0, r3, r0\n"
                "\tadd r0, r10\n"
                "\tldrb r0, [r0]\n"
                "\tstrb r0, [r2]\n"
                "\tldr r7, [sp, 0xC]\n"
                "\tadds r0, r5, r7\n"
                "\tadd r0, r10\n"
                "\tldrb r0, [r0]\n"
                "\tmov r1, r12\n"
                "\tstrb r0, [r1]\n"
                "\tadds r6, 0x1\n"
                "\tcmp r6, 0x14\n"
                "\tble _0814079E\n"
                "\tmovs r6, 0\n"
                "_0814079E:\n"
                "\tadds r3, 0x1\n"
                "\tcmp r3, 0x14\n"
                "\tble _081407A6\n"
                "\tmovs r3, 0\n"
                "_081407A6:\n"
                "\tadds r5, 0x1\n"
                "\tcmp r5, 0x14\n"
                "\tble _081407AE\n"
                "\tmovs r5, 0\n"
                "_081407AE:\n"
                "\tmovs r2, 0x1\n"
                "\tadd r12, r2\n"
                "\tadds r4, 0x1\n"
                "\tcmp r4, 0x2\n"
                "\tble _0814074C\n"
                "\tmov r3, r8\n"
                "\tcmp r3, 0x1\n"
                "\tbeq _08140828\n"
                "\tcmp r3, 0x1\n"
                "\tbgt _081407D0\n"
                "\tcmp r3, 0\n"
                "\tbeq _081407D8\n"
                "\tb _081408A0\n"
                "\t.align 2, 0\n"
                "_081407C8: .4byte sSlotMachineState\n"
                "_081407CC: .4byte gUnknown_8464926\n"
                "_081407D0:\n"
                "\tmov r6, r8\n"
                "\tcmp r6, 0x2\n"
                "\tbeq _08140870\n"
                "\tb _081408A0\n"
                "_081407D8:\n"
                "\tmovs r4, 0\n"
                "_081407DA:\n"
                "\tmov r7, sp\n"
                "\tadds r0, r7, r4\n"
                "\tldrb r1, [r0]\n"
                "\tmovs r0, 0x1\n"
                "\tbl sub_81408F4\n"
                "\tcmp r0, 0\n"
                "\tbne _081408DC_return_false\n"
                "\tadds r4, 0x1\n"
                "\tcmp r4, 0x2\n"
                "\tble _081407DA\n"
                "\tmovs r4, 0\n"
                "\tldr r2, _08140824 @ =gUnknown_84648AE\n"
                "\tmovs r3, 0\n"
                "\tadds r5, r2, 0x2\n"
                "_081407F8:\n"
                "\tldrb r0, [r2]\n"
                "\tmov r6, sp\n"
                "\tadds r1, r6, r0\n"
                "\tldrb r0, [r2, 0x1]\n"
                "\tadd r0, sp\n"
                "\tldrb r1, [r1]\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r1, r0\n"
                "\tbne _08140816\n"
                "\tadds r0, r3, r5\n"
                "\tldrb r0, [r0]\n"
                "\tadd r0, sp\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r1, r0\n"
                "\tbeq _081408DC_return_false\n"
                "_08140816:\n"
                "\tadds r2, 0x3\n"
                "\tadds r3, 0x3\n"
                "\tadds r4, 0x1\n"
                "\tcmp r4, 0x4\n"
                "\tble _081407F8\n"
                "_08140820_return_true:\n"
                "\tmovs r0, 0x1\n"
                "\tb _081408DE\n"
                "\t.align 2, 0\n"
                "_08140824: .4byte gUnknown_84648AE\n"
                "_08140828:\n"
                "\tmovs r4, 0\n"
                "\tldr r5, _0814086C @ =gUnknown_84648AE\n"
                "_0814082C:\n"
                "\tldrb r0, [r5]\n"
                "\tmov r7, sp\n"
                "\tadds r2, r7, r0\n"
                "\tldrb r0, [r5, 0x1]\n"
                "\tadds r1, r7, r0\n"
                "\tldrb r0, [r2]\n"
                "\tldrb r1, [r1]\n"
                "\tcmp r0, r1\n"
                "\tbne _0814084A\n"
                "\tadds r1, r0, 0\n"
                "\tmov r0, r8\n"
                "\tbl sub_81408F4\n"
                "\tcmp r0, 0\n"
                "\tbne _081408DC_return_false\n"
                "_0814084A:\n"
                "\tadds r5, 0x3\n"
                "\tadds r4, 0x1\n"
                "\tcmp r4, 0x4\n"
                "\tble _0814082C\n"
                "\tmovs r4, 0\n"
                "_08140854:\n"
                "\tmov r1, sp\n"
                "\tadds r0, r1, r4\n"
                "\tldrb r1, [r0]\n"
                "\tmov r0, r8\n"
                "\tbl sub_81408F4\n"
                "\tcmp r0, 0\n"
                "\tbne _08140820_return_true\n"
                "\tadds r4, 0x1\n"
                "\tcmp r4, 0x2\n"
                "\tble _08140854\n"
                "\tb _081408DC_return_false\n"
                "\t.align 2, 0\n"
                "_0814086C: .4byte gUnknown_84648AE\n"
                "_08140870:\n"
                "\tmovs r4, 0\n"
                "\tldr r5, _0814089C @ =gUnknown_84648AE\n"
                "_08140874:\n"
                "\tldrb r0, [r5]\n"
                "\tmov r3, sp\n"
                "\tadds r2, r3, r0\n"
                "\tldrb r0, [r5, 0x1]\n"
                "\tadds r1, r3, r0\n"
                "\tldrb r0, [r2]\n"
                "\tldrb r1, [r1]\n"
                "\tcmp r0, r1\n"
                "\tbne _08140892\n"
                "\tadds r1, r0, 0\n"
                "\tmov r0, r8\n"
                "\tbl sub_81408F4\n"
                "\tcmp r0, 0\n"
                "\tbne _08140820_return_true\n"
                "_08140892:\n"
                "\tadds r5, 0x3\n"
                "\tadds r4, 0x1\n"
                "\tcmp r4, 0x4\n"
                "\tble _08140874\n"
                "\tb _081408DC_return_false\n"
                "\t.align 2, 0\n"
                "_0814089C: .4byte gUnknown_84648AE\n"
                "_081408A0:\n"
                "\tmovs r4, 0\n"
                "\tldr r5, _081408F0 @ =gUnknown_84648AE\n"
                "\tadds r7, r5, 0\n"
                "\tmovs r6, 0\n"
                "_081408A8:\n"
                "\tldrb r0, [r5]\n"
                "\tmov r1, sp\n"
                "\tadds r2, r1, r0\n"
                "\tadds r0, r7, 0x1\n"
                "\tadds r0, r6, r0\n"
                "\tldrb r0, [r0]\n"
                "\tadd r0, sp\n"
                "\tldrb r1, [r2]\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r1, r0\n"
                "\tbne _081408D2\n"
                "\tldrb r0, [r5, 0x2]\n"
                "\tadd r0, sp\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r1, r0\n"
                "\tbne _081408D2\n"
                "\tmov r0, r8\n"
                "\tbl sub_81408F4\n"
                "\tcmp r0, 0\n"
                "\tbne _08140820_return_true\n"
                "_081408D2:\n"
                "\tadds r5, 0x3\n"
                "\tadds r6, 0x3\n"
                "\tadds r4, 0x1\n"
                "\tcmp r4, 0x4\n"
                "\tble _081408A8\n"
                "_081408DC_return_false:\n"
                "\tmovs r0, 0\n"
                "_081408DE:\n"
                "\tadd sp, 0x10\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r1}\n"
                "\tbx r1\n"
                "\t.align 2, 0\n"
                "_081408F0: .4byte gUnknown_84648AE");
}
#endif //NONMATCHING

static bool32 sub_81408F4(s32 a0, s32 a1)
{
    switch (a0)
    {
    case 0:
        return a1 ^ 4 ? TRUE : FALSE;
    case 1:
    case 2:
        return a1 == 4 ? TRUE : FALSE;
    case 3:
        return a1 == 5 || a1 == 6 ? TRUE : FALSE;
    case 4:
        return a1 == 2 || a1 == 3 ? TRUE : FALSE;
    case 5:
        return a1 == 1 ? TRUE : FALSE;
    case 6:
        return a1 == 0 ? TRUE : FALSE;
    default:
        return FALSE;
    }
}

static u8 sub_814096C(s32 a0)
{
    switch (a0)
    {
    default:
    case 4:
        return 1;
    case 5:
    case 6:
        return 3;
    case 2:
    case 3:
        return 4;
    case 1:
        return 5;
    case 0:
        return 6;
    }
}

static void sub_81409B4(void)
{
    u16 r2 = Random() / 4;
    s32 i;
    const u16 * r4 = gUnknown_84648D2[sSlotMachineState->machineidx];
    for (i = 0; i < 6; i++)
    {
        if (r2 < r4[i])
            break;
    }
    if (sSlotMachineState->field_08 < 5)
    {
        if (sSlotMachineState->field_0C == 0)
        {
            if ((Random() & 0x3FFF) < r4[6])
                sSlotMachineState->field_0C = (Random() & 1) ? 5 : 60;
        }
        if (sSlotMachineState->field_0C != 0)
        {
            if (i == 0 && (Random() & 0x3FFF) < 0x2CCC)
                sSlotMachineState->field_0C = (Random() & 1) ? 5 : 60;
            sSlotMachineState->field_0C--;
        }
        sSlotMachineState->field_08 = i;
    }
}

static void sub_8140A70(void)
{
    sSlotMachineState->field_08 = 0;
}

static u16 sub_8140A80(void)
{
    u8 sp0[9] = {};
    s32 i;
    s32 r4, r3, r2;
    s32 r9;

    for (i = 0; i < 5; i++)
        sSlotMachineState->field_3C[i] = 0;

    r9 = 0;
    r4 = sSlotMachineState->field_20[0];
    r3 = sSlotMachineState->field_20[1];
    r2 = sSlotMachineState->field_20[2];

    for (i = 0; i < 3; i++)
    {
        r4++;
        if (r4 >= 21)
            r4 = 0;
        r3++;
        if (r3 >= 21)
            r3 = 0;
        r2++;
        if (r2 >= 21)
            r2 = 0;
        sp0[0 * 3 + i] = gUnknown_8464926[0][r4];
        sp0[1 * 3 + i] = gUnknown_8464926[1][r3];
        sp0[2 * 3 + i] = gUnknown_8464926[2][r2];
    }
    sSlotMachineState->payout = 0;
    for (i = 0; i < 5; i++)
    {
        if (sSlotMachineState->bet >= gUnknown_84648BD[i][3])
        {
            if (sub_81408F4(1, sp0[gUnknown_84648BD[i][0]]))
                r3 = sub_81408F4(2, sp0[gUnknown_84648BD[i][1]]) ? 2 : 1;
            else if (sp0[gUnknown_84648BD[i][0]] == sp0[gUnknown_84648BD[i][1]] && sp0[gUnknown_84648BD[i][0]] == sp0[gUnknown_84648BD[i][2]])
                r3 = sub_814096C(sp0[gUnknown_84648BD[i][0]]);
            else
                r3 = 0;
            if (r3 != 0)
            {
                sSlotMachineState->field_3C[i] = 1;
                sSlotMachineState->payout += gUnknown_8464966[r3];
            }
            if (r3 > r9)
                r9 = r3;
        }
    }
    return r9;
}

static u16 sub_8140BDC(void)
{
    return sSlotMachineState->payout;
}

static u8 sub_8140BEC(void)
{
    return sSlotMachineState->bet;
}

static bool32 sub_8140BF8(s32 a0)
{
    return sSlotMachineState->field_3C[a0];
}

static bool32 sub_8140C0C(void)
{
    s32 i;

    for (i = 0; i < NELEMS(gUnknown_84655B0); i++)
        LoadCompressedSpriteSheet(&gUnknown_84655B0[i]);
    LoadSpritePalettes(gUnknown_84655C8);
    sSlotMachineGfxManager = Alloc(sizeof(*sSlotMachineGfxManager));
    if (sSlotMachineGfxManager == NULL)
        return FALSE;
    sub_8140C6C(sSlotMachineGfxManager);
    return TRUE;
}

static void sub_8140C50(void)
{
    if (sSlotMachineGfxManager != NULL)
    {
        Free(sSlotMachineGfxManager);
        sSlotMachineGfxManager = NULL;
    }
}

static void sub_8140C6C(struct SlotMachineGfxManager * manager)
{
    s32 i, j;

    for (i = 0; i < 3; i++)
    {
        manager->field_00[i] = 0;
        for (j = 0; j < 5; j++)
        {
            manager->field_0C[i][j] = NULL;
        }
    }
}

static void sub_8140CA0(void)
{
    struct Sprite * sprite;
    s32 i, j;
    s32 spriteId;
    s32 animId;
    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 5; j++)
        {
            spriteId = CreateSprite(&gUnknown_84657E4, 80 + 40 * i, 44 + 24 * j, 2);
            animId =  gUnknown_8464926[i][j];
            sprite = &gSprites[spriteId];
            StartSpriteAnim(sprite, animId);
            sprite->oam.paletteNum = IndexOfSpritePaletteTag(gUnknown_8465608[animId]);
            sprite->data[0] = i;
            sprite->data[1] = j;
            sprite->data[2] = j;
            sprite->data[3] = 0;
            sprite->oam.matrixNum = 0;
            sSlotMachineGfxManager->field_0C[i][j] = sprite;
            sSlotMachineGfxManager->field_70 = (vu16 *)(OAM + 0 * sizeof(struct OamData) + offsetof(struct OamData, affineParam));
        }
    }
}

static void sub_8140D7C(const s16 * a0, const s16 * a1)
{
    s32 i, j;
    s32 r6, r10;

    for (i = 0; i < 3; i++)
    {
        r6 = *a0;
        r10 = *a1 * 8;
        for (j = 0; j < 5; j++)
        {
            sSlotMachineGfxManager->field_0C[i][j]->pos2.y = r10;
            {
                s32 r4 = gUnknown_8464926[i][r6];
                struct Sprite * sprite = sSlotMachineGfxManager->field_0C[i][j];
                StartSpriteAnim(sprite, r4);
            }
            {
                s32 r4 = gUnknown_8464926[i][r6];
                struct Sprite * sprite = sSlotMachineGfxManager->field_0C[i][j];
                StartSpriteAnim(sprite, r4);
            }
            sSlotMachineGfxManager->field_0C[i][j]->oam.paletteNum = IndexOfSpritePaletteTag(gUnknown_8465608[gUnknown_8464926[i][r6]]);
            r6++;
            if (r6 >= 21)
                r6 = 0;
        }
        a0++;
        a1++;
    }
}

static void sub_8140E40(void)
{
    s32 vcount = REG_VCOUNT - 0x2B;
    if (vcount >= 0 && vcount < 0x54)
    {
        *sSlotMachineGfxManager->field_70 = gUnknown_8465616[vcount];
        REG_BLDY = gUnknown_84656D6[vcount];
    }
    else
    {
        *sSlotMachineGfxManager->field_70 = 0x100;
        REG_BLDY = 0;
    }
}

static void sub_8140E9C(void)
{
    s32 i;
    s32 spriteId;

    for (i = 0; i < 4; i++)
    {
        spriteId = CreateSprite(&gUnknown_846587C, 0x55 + 7 * i, 30, 0);
        sSlotMachineGfxManager->field_48[i] = &gSprites[spriteId];
        spriteId = CreateSprite(&gUnknown_846587C, 0x85 + 7 * i, 30, 0);
        sSlotMachineGfxManager->field_58[i] = &gSprites[spriteId];
    }
}

static void sub_8140F2C(void)
{
    s32 coins = GetCoins();
    s32 payout = sub_8140BDC();
    s32 i;
    s32 divisor = 1000;
    s32 quotient;

    for (i = 0; i < 4; i++)
    {
        quotient = coins / divisor;
        StartSpriteAnim(sSlotMachineGfxManager->field_48[i], quotient);
        coins -= quotient * divisor;
        quotient = payout / divisor;
        StartSpriteAnim(sSlotMachineGfxManager->field_58[i], quotient);
        payout -= quotient * divisor;
        divisor /= 10;
    }
}

static void sub_8140FC4(void)
{
    s32 spriteId;

    spriteId = CreateSprite(&gUnknown_84658D8, 0x10, 0x88, 1);
    sSlotMachineGfxManager->field_68[0] = &gSprites[spriteId];
    spriteId = CreateSprite(&gUnknown_84658D8, 0xE0, 0x88, 1);
    sSlotMachineGfxManager->field_68[1] = &gSprites[spriteId];
    sSlotMachineGfxManager->field_68[1]->hFlip = TRUE;
}

static void sub_8141020(u8 a0)
{
    s32 i;
    for (i = 0; i < 2; i++)
    {
        StartSpriteAnim(sSlotMachineGfxManager->field_68[i], a0);
    }
}

static bool32 sub_814104C(void)
{
    s32 i;

    struct SlotMachineSetupTaskData * ptr = Alloc(sizeof(struct SlotMachineSetupTaskData));
    if (ptr == NULL)
        return FALSE;
    for (i = 0; i < 8; i++)
        ptr->field_0000[i].unk3 = 0;
    ptr->field_0028 = 0;
    SetWordTaskArg(CreateTask(sub_81410CC, 2), 0, (uintptr_t)ptr);
    return FALSE;
}

static void sub_8141094(void)
{
    if (FuncIsActiveTask(sub_81410CC))
    {
        Free(sub_814112C());
        DestroyTask(FindTaskIdByFunc(sub_81410CC));
    }
    sub_8140C50();
    FreeAllWindowBuffers();
}

static void sub_81410CC(u8 taskId)
{
    struct SlotMachineSetupTaskData * ptr = (void *)GetWordTaskArg(taskId, 0);
    s32 i;

    for (i = 0; i < 8; i++)
    {
        if (ptr->field_0000[i].unk3)
            ptr->field_0000[i].unk3 = gUnknown_84658F0[ptr->field_0000[i].unk0](&ptr->field_0000[i].unk2, ptr);
    }
}

static void sub_8141118(void)
{
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
}

static struct SlotMachineSetupTaskData * sub_814112C(void)
{
    return (void *)GetWordTaskArg(FindTaskIdByFunc(sub_81410CC), 0);
}

static void sub_8141148(u16 a0, u8 a1)
{
    struct SlotMachineSetupTaskData * ptr = sub_814112C();
    ptr->field_0000[a1].unk0 = a0;
    ptr->field_0000[a1].unk2 = 0;
    ptr->field_0000[a1].unk3 = gUnknown_84658F0[a0](&ptr->field_0000[a1].unk2, ptr);
}

static bool32 sub_8141180(u8 a0)
{
    return sub_814112C()->field_0000[a0].unk3;
}

#ifdef NONMATCHING
static bool8 sub_8141198(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    u16 pal;
    u8 textColor[3];
    u32 x;

    switch (*state)
    {
    case 0:
        BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
        (*state)++;
        break;
    case 1:
        SetVBlankCallback(NULL);
        ResetSpriteData();
        FreeAllSpritePalettes();
        RequestDma3Fill(0, (void *)OAM, OAM_SIZE, 1);
        RequestDma3Fill(0, (void *)VRAM, 0x20, 1);
        RequestDma3Fill(0, (void *)(VRAM + 0xC000), 0x20, 1);
        SetGpuReg(REG_OFFSET_DISPCNT, 0);
        ResetBgPositions();
        ResetBgsAndClearDma3BusyFlags(0);
        InitBgsFromTemplates(0, gUnknown_8466B10, NELEMS(gUnknown_8466B10));
        InitWindows(gUnknown_8466B20);

        SetBgTilemapBuffer(3, ptr->field_205C);
        FillBgTilemapBufferRect_Palette0(3, 0, 0, 0, 32, 32);
        CopyBgTilemapBufferToVram(3);

        ResetTempTileDataBuffers();
        DecompressAndCopyTileDataToVram(2, gUnknown_84659D0, 0, 0x00, 0);
        DecompressAndCopyTileDataToVram(2, gUnknown_846653C, 0, 0xC0, 0);
        SetBgTilemapBuffer(2, ptr->field_185C);
        CopyToBgTilemapBuffer(2, gUnknown_84661D4, 0, 0x00);
        CopyBgTilemapBufferToVram(2);
        LoadPalette(gUnknown_8465930, 0x00, 0xA0);
        LoadPalette(gUnknown_84664BC, 0x50, 0x20);
        LoadPalette(gUnknown_84665C0, 0x70, 0x60);
        pal = RGB(30, 30, 31);
        LoadPalette(&pal, 0x00, 0x02);
        LoadUserWindowBorderGfx(0, 0x00A, 0xD0);
        sub_814FDA0(0, 0x001, 0xF0);

        SetBgTilemapBuffer(0, ptr->field_085C);
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 2, 32, 30);
        DecompressAndCopyTileDataToVram(1, gUnknown_8466620, 0, 0, 0);
        DecompressAndCopyTileDataToVram(1, gUnknown_8466998, 0, 0, 1);
        CopyBgTilemapBufferToVram(1);

        LoadPalette(stdpal_get(2), 0xE0, 0x20);
        FillWindowPixelBuffer(1, 0xFF);
        PutWindowTilemap(1);

        x = 0xEC - GetStringWidth(0, gString_SlotMachineControls, 0);
        textColor[0] = 15;
        textColor[1] = 1;
        textColor[2] = 2;
        AddTextPrinterParameterized3(1, 0, x, 0, textColor, 0, gString_SlotMachineControls);
        CopyBgTilemapBufferToVram(0);

        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | 0x20 | DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON);
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG3 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN);
        sub_8140C0C();
        sub_8140CA0();
        sub_8140E9C();
        sub_8140FC4();
        sub_8140F2C();
        BlendPalettes(0xFFFFFFFF, 0x10, RGB_BLACK);
        SetVBlankCallback(sub_8141118);
        SetHBlankCallback(sub_8140E40);
        (*state)++;
        break;
    case 2:
        if (!FreeTempTileDataBuffersIfPossible())
        {
            ShowBg(0);
            ShowBg(3);
            ShowBg(2);
            HideBg(1);
            sub_8141B34();
            BlendPalettes(0xFFFFFFFF, 0x10, RGB_BLACK);
            BeginNormalPaletteFade(0xFFFFFFFF, -1, 16, 0, RGB_BLACK);
            EnableInterrupts(INTR_FLAG_VBLANK | INTR_FLAG_HBLANK);
            (*state)++;
        }
        break;
    case 3:
        UpdatePaletteFade();
        if (!gPaletteFade.active)
            return FALSE;
        break;
    }
    return TRUE;
}
#else
NAKED
static bool8 sub_8141198(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r8\n"
                "\tpush {r7}\n"
                "\tsub sp, 0x14\n"
                "\tadds r7, r0, 0\n"
                "\tmov r8, r1\n"
                "\tldrb r6, [r7]\n"
                "\tcmp r6, 0x1\n"
                "\tbeq _081411D0\n"
                "\tcmp r6, 0x1\n"
                "\tbgt _081411B4\n"
                "\tcmp r6, 0\n"
                "\tbeq _081411C2\n"
                "\tb _08141450\n"
                "_081411B4:\n"
                "\tcmp r6, 0x2\n"
                "\tbne _081411BA\n"
                "\tb _081413E4\n"
                "_081411BA:\n"
                "\tcmp r6, 0x3\n"
                "\tbne _081411C0\n"
                "\tb _08141436\n"
                "_081411C0:\n"
                "\tb _08141450\n"
                "_081411C2:\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tmovs r1, 0x10\n"
                "\tmovs r2, 0\n"
                "\tbl BlendPalettes\n"
                "\tb _0814142E\n"
                "_081411D0:\n"
                "\tmovs r0, 0\n"
                "\tbl SetVBlankCallback\n"
                "\tbl ResetSpriteData\n"
                "\tbl FreeAllSpritePalettes\n"
                "\tmovs r1, 0xE0\n"
                "\tlsls r1, 19\n"
                "\tmovs r2, 0x80\n"
                "\tlsls r2, 3\n"
                "\tmovs r0, 0\n"
                "\tmovs r3, 0x1\n"
                "\tbl RequestDma3Fill\n"
                "\tmovs r1, 0xC0\n"
                "\tlsls r1, 19\n"
                "\tmovs r0, 0\n"
                "\tmovs r2, 0x20\n"
                "\tmovs r3, 0x1\n"
                "\tbl RequestDma3Fill\n"
                "\tldr r1, _0814139C @ =0x0600c000\n"
                "\tmovs r0, 0\n"
                "\tmovs r2, 0x20\n"
                "\tmovs r3, 0x1\n"
                "\tbl RequestDma3Fill\n"
                "\tmovs r0, 0\n"
                "\tmovs r1, 0\n"
                "\tbl SetGpuReg\n"
                "\tbl ResetBgPositions\n"
                "\tmovs r0, 0\n"
                "\tbl ResetBgsAndClearDma3BusyFlags\n"
                "\tldr r1, _081413A0 @ =gUnknown_8466B10\n"
                "\tmovs r0, 0\n"
                "\tmovs r2, 0x4\n"
                "\tbl InitBgsFromTemplates\n"
                "\tldr r0, _081413A4 @ =gUnknown_8466B20\n"
                "\tbl InitWindows\n"
                "\tldr r1, _081413A8 @ =0x0000205c\n"
                "\tadd r1, r8\n"
                "\tmovs r0, 0x3\n"
                "\tbl SetBgTilemapBuffer\n"
                "\tmovs r4, 0x20\n"
                "\tstr r4, [sp]\n"
                "\tstr r4, [sp, 0x4]\n"
                "\tmovs r0, 0x3\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0\n"
                "\tbl FillBgTilemapBufferRect_Palette0\n"
                "\tmovs r0, 0x3\n"
                "\tbl CopyBgTilemapBufferToVram\n"
                "\tbl ResetTempTileDataBuffers\n"
                "\tldr r1, _081413AC @ =gUnknown_84659D0\n"
                "\tmovs r5, 0\n"
                "\tstr r5, [sp]\n"
                "\tmovs r0, 0x2\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0\n"
                "\tbl DecompressAndCopyTileDataToVram\n"
                "\tldr r1, _081413B0 @ =gUnknown_846653C\n"
                "\tstr r5, [sp]\n"
                "\tmovs r0, 0x2\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0xC0\n"
                "\tbl DecompressAndCopyTileDataToVram\n"
                "\tldr r1, _081413B4 @ =0x0000185c\n"
                "\tadd r1, r8\n"
                "\tmovs r0, 0x2\n"
                "\tbl SetBgTilemapBuffer\n"
                "\tldr r1, _081413B8 @ =gUnknown_84661D4\n"
                "\tmovs r0, 0x2\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0\n"
                "\tbl CopyToBgTilemapBuffer\n"
                "\tmovs r0, 0x2\n"
                "\tbl CopyBgTilemapBufferToVram\n"
                "\tldr r0, _081413BC @ =gUnknown_8465930\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0xA0\n"
                "\tbl LoadPalette\n"
                "\tldr r0, _081413C0 @ =gUnknown_84664BC\n"
                "\tmovs r1, 0x50\n"
                "\tmovs r2, 0x20\n"
                "\tbl LoadPalette\n"
                "\tldr r0, _081413C4 @ =gUnknown_84665C0\n"
                "\tmovs r1, 0x70\n"
                "\tmovs r2, 0x60\n"
                "\tbl LoadPalette\n"
                "\tldr r1, _081413C8 @ =0x00007fde\n"
                "\tadd r0, sp, 0xC\n"
                "\tstrh r1, [r0]\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0x2\n"
                "\tbl LoadPalette\n"
                "\tmovs r0, 0\n"
                "\tmovs r1, 0xA\n"
                "\tmovs r2, 0xD0\n"
                "\tbl LoadUserWindowBorderGfx\n"
                "\tmovs r0, 0\n"
                "\tmovs r1, 0x1\n"
                "\tmovs r2, 0xF0\n"
                "\tbl sub_814FDA0\n"
                "\tldr r1, _081413CC @ =0x0000085c\n"
                "\tadd r1, r8\n"
                "\tmovs r0, 0\n"
                "\tbl SetBgTilemapBuffer\n"
                "\tstr r4, [sp]\n"
                "\tmovs r0, 0x1E\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tmovs r0, 0\n"
                "\tmovs r1, 0\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0x2\n"
                "\tbl FillBgTilemapBufferRect_Palette0\n"
                "\tldr r1, _081413D0 @ =gUnknown_8466620\n"
                "\tstr r5, [sp]\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0\n"
                "\tbl DecompressAndCopyTileDataToVram\n"
                "\tldr r1, _081413D4 @ =gUnknown_8466998\n"
                "\tstr r6, [sp]\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r2, 0\n"
                "\tmovs r3, 0\n"
                "\tbl DecompressAndCopyTileDataToVram\n"
                "\tmovs r0, 0x1\n"
                "\tbl CopyBgTilemapBufferToVram\n"
                "\tmovs r0, 0x2\n"
                "\tbl stdpal_get\n"
                "\tmovs r1, 0xE0\n"
                "\tmovs r2, 0x20\n"
                "\tbl LoadPalette\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r1, 0xFF\n"
                "\tbl FillWindowPixelBuffer\n"
                "\tmovs r0, 0x1\n"
                "\tbl PutWindowTilemap\n"
                "\tldr r4, _081413D8 @ =gString_SlotMachineControls\n"
                "\tmovs r0, 0\n"
                "\tadds r1, r4, 0\n"
                "\tmovs r2, 0\n"
                "\tbl GetStringWidth\n"
                "\tmovs r2, 0xEC\n"
                "\tsubs r2, r0\n"
                "\tadd r1, sp, 0x10\n"
                "\tmovs r0, 0xF\n"
                "\tstrb r0, [r1]\n"
                "\tstrb r6, [r1, 0x1]\n"
                "\tmovs r0, 0x2\n"
                "\tstrb r0, [r1, 0x2]\n"
                "\tlsls r2, 24\n"
                "\tlsrs r2, 24\n"
                "\tstr r1, [sp]\n"
                "\tstr r5, [sp, 0x4]\n"
                "\tstr r4, [sp, 0x8]\n"
                "\tmovs r0, 0x1\n"
                "\tmovs r1, 0\n"
                "\tmovs r3, 0\n"
                "\tbl AddTextPrinterParameterized3\n"
                "\tmovs r0, 0\n"
                "\tbl CopyBgTilemapBufferToVram\n"
                "\tmovs r1, 0x83\n"
                "\tlsls r1, 5\n"
                "\tmovs r0, 0\n"
                "\tbl SetGpuRegBits\n"
                "\tmovs r0, 0x50\n"
                "\tmovs r1, 0xF8\n"
                "\tbl SetGpuReg\n"
                "\tbl sub_8140C0C\n"
                "\tbl sub_8140CA0\n"
                "\tbl sub_8140E9C\n"
                "\tbl sub_8140FC4\n"
                "\tbl sub_8140F2C\n"
                "\tmovs r0, 0x1\n"
                "\tnegs r0, r0\n"
                "\tmovs r1, 0x10\n"
                "\tmovs r2, 0\n"
                "\tbl BlendPalettes\n"
                "\tldr r0, _081413DC @ =sub_8141118\n"
                "\tbl SetVBlankCallback\n"
                "\tldr r0, _081413E0 @ =sub_8140E40\n"
                "\tbl SetHBlankCallback\n"
                "\tb _0814142E\n"
                "\t.align 2, 0\n"
                "_0814139C: .4byte 0x0600c000\n"
                "_081413A0: .4byte gUnknown_8466B10\n"
                "_081413A4: .4byte gUnknown_8466B20\n"
                "_081413A8: .4byte 0x0000205c\n"
                "_081413AC: .4byte gUnknown_84659D0\n"
                "_081413B0: .4byte gUnknown_846653C\n"
                "_081413B4: .4byte 0x0000185c\n"
                "_081413B8: .4byte gUnknown_84661D4\n"
                "_081413BC: .4byte gUnknown_8465930\n"
                "_081413C0: .4byte gUnknown_84664BC\n"
                "_081413C4: .4byte gUnknown_84665C0\n"
                "_081413C8: .4byte 0x00007fde\n"
                "_081413CC: .4byte 0x0000085c\n"
                "_081413D0: .4byte gUnknown_8466620\n"
                "_081413D4: .4byte gUnknown_8466998\n"
                "_081413D8: .4byte gString_SlotMachineControls\n"
                "_081413DC: .4byte sub_8141118\n"
                "_081413E0: .4byte sub_8140E40\n"
                "_081413E4:\n"
                "\tbl FreeTempTileDataBuffersIfPossible\n"
                "\tlsls r0, 24\n"
                "\tlsrs r5, r0, 24\n"
                "\tcmp r5, 0\n"
                "\tbne _08141450\n"
                "\tmovs r0, 0\n"
                "\tbl ShowBg\n"
                "\tmovs r0, 0x3\n"
                "\tbl ShowBg\n"
                "\tmovs r0, 0x2\n"
                "\tbl ShowBg\n"
                "\tmovs r0, 0x1\n"
                "\tbl HideBg\n"
                "\tbl sub_8141B34\n"
                "\tmovs r4, 0x1\n"
                "\tnegs r4, r4\n"
                "\tadds r0, r4, 0\n"
                "\tmovs r1, 0x10\n"
                "\tmovs r2, 0\n"
                "\tbl BlendPalettes\n"
                "\tstr r5, [sp]\n"
                "\tadds r0, r4, 0\n"
                "\tadds r1, r4, 0\n"
                "\tmovs r2, 0x10\n"
                "\tmovs r3, 0\n"
                "\tbl BeginNormalPaletteFade\n"
                "\tmovs r0, 0x3\n"
                "\tbl EnableInterrupts\n"
                "_0814142E:\n"
                "\tldrb r0, [r7]\n"
                "\tadds r0, 0x1\n"
                "\tstrb r0, [r7]\n"
                "\tb _08141450\n"
                "_08141436:\n"
                "\tbl UpdatePaletteFade\n"
                "\tldr r0, _0814144C @ =gPaletteFade\n"
                "\tldrb r1, [r0, 0x7]\n"
                "\tmovs r0, 0x80\n"
                "\tands r0, r1\n"
                "\tcmp r0, 0\n"
                "\tbne _08141450\n"
                "\tmovs r0, 0\n"
                "\tb _08141452\n"
                "\t.align 2, 0\n"
                "_0814144C: .4byte gPaletteFade\n"
                "_08141450:\n"
                "\tmovs r0, 0x1\n"
                "_08141452:\n"
                "\tadd sp, 0x14\n"
                "\tpop {r3}\n"
                "\tmov r8, r3\n"
                "\tpop {r4-r7}\n"
                "\tpop {r1}\n"
                "\tbx r1");
}
#endif //NONMATCHING

static bool8 sub_8141460(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, -1, 0, 16, 0);
        (*state)++;
        break;
    case 1:
        if (!gPaletteFade.active)
            return FALSE;
        break;
    }
    return TRUE;
}

static bool8 sub_81414AC(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        sub_8141834(GetBgTilemapBuffer(2));
        CopyBgTilemapBufferToVram(2);
        (*state)++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            return FALSE;
        break;
    }
    return TRUE;
}

static bool8 sub_81414EC(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    sub_8141020(1);
    return FALSE;
}

static bool8 sub_81414FC(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    sub_8141020(2);
    CreateTask(sub_814191C, 3);
    return FALSE;
}

static bool8 sub_8141518(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        sub_8141AB0();
        (*state)++;
        break;
    case 1:
        if (!FuncIsActiveTask(sub_814191C))
        {
            sub_8141020(0);
            return FALSE;
        }
        break;
    }
    return TRUE;
}

static bool8 sub_8141558(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    sub_8141020(3);
    return FALSE;
}

static bool8 sub_8141568(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    sub_8141020(FALSE);
    return FALSE;
}

static bool8 sub_8141578(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    sub_8140F2C();
    return FALSE;
}

static bool8 sub_8141584(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        sub_81417E4(gString_OutOfCoins);
        CopyWindowToVram(0, 3);
        (*state)++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            return FALSE;
        break;
    }
    return TRUE;
}

static bool8 sub_81415C8(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        sub_81417E4(gString_QuitPlaying);
        sub_8141AD8(0);
        CopyWindowToVram(0, 3);
        (*state)++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            return FALSE;
        break;
    }
    return TRUE;
}

static bool8 sub_8141610(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        sub_8141828();
        sub_8141B18();
        CopyWindowToVram(0, 3);
        (*state)++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            return FALSE;
        break;
    }
    return TRUE;
}

static bool8 sub_8141650(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        sub_8141BA0(ptr->field_0020);
        CopyBgTilemapBufferToVram(2);
        (*state)++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            return FALSE;
        break;
    }
    return TRUE;
}

static bool8 sub_8141690(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        sub_8141BE4();
        CopyBgTilemapBufferToVram(2);
        (*state)++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
            return FALSE;
        break;
    }
    return TRUE;
}

static bool8 sub_81416C8(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        SetGpuReg(REG_OFFSET_WININ, 0x3F);
        SetGpuReg(REG_OFFSET_WINOUT, 0x3D);
        SetGpuReg(REG_OFFSET_WIN0H, 0x00);
        SetGpuReg(REG_OFFSET_WIN1H, 0xA0);
        ShowBg(1);
        PlaySE(SE_WIN_OPEN);
        ptr->field_0024 = 0;
        (*state)++;
        break;
    case 1:
        ptr->field_0024 += 16;
        if (ptr->field_0024 >= 256)
        {
            ptr->field_0024 = 256;
            (*state)++;
        }
        ChangeBgX(1, 256 * (256 - ptr->field_0024), 0);
        SetGpuReg(REG_OFFSET_WIN0H, ptr->field_0024);
        break;
    case 2:
        return FALSE;
    }
    return TRUE;
}

static bool8 sub_8141764(u8 * state, struct SlotMachineSetupTaskData * ptr)
{
    switch (*state)
    {
    case 0:
        PlaySE(SE_WIN_OPEN);
        (*state)++;
        // fallthrough
    case 1:
        ptr->field_0024 -= 16;
        if (ptr->field_0024 <= 0)
        {
            ptr->field_0024 = 0;
            (*state)++;
        }
        ChangeBgX(1, 256 * (256 - ptr->field_0024), 0);
        SetGpuReg(REG_OFFSET_WIN0H, ptr->field_0024);
        break;
    case 2:
        HideBg(1);
        ClearGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_WIN0_ON);
        (*state)++;
        break;
    case 3:
        return FALSE;
    }
    return TRUE;
}

static void sub_81417E4(const u8 * str)
{
    FillWindowPixelBuffer(0, 0x11);
    PutWindowTilemap(0);
    DrawTextBorderOuter(0, 0x001, 15);
    AddTextPrinterParameterized5(0, 2, str, 1, 2, -1, NULL, 1, 2);
}

static void sub_8141828(void)
{
    rbox_fill_rectangle(0);
}

static void sub_8141834(u16 * bgTilemapBuffer)
{
    switch (sub_8140BEC())
    {
    case 0:
        sub_81418C4(bgTilemapBuffer, 0, 4);
        sub_81418C4(bgTilemapBuffer, 1, 4);
        sub_81418C4(bgTilemapBuffer, 2, 4);
        sub_81418C4(bgTilemapBuffer, 3, 4);
        sub_81418C4(bgTilemapBuffer, 4, 4);
        break;
    case 3:
        sub_81418C4(bgTilemapBuffer, 0, 5);
        sub_81418C4(bgTilemapBuffer, 4, 5);
    case 2:
        sub_81418C4(bgTilemapBuffer, 1, 5);
        sub_81418C4(bgTilemapBuffer, 3, 5);
    case 1:
        sub_81418C4(bgTilemapBuffer, 2, 5);
        break;
    }
}

static void sub_81418C4(u16 * bgTilemapBuffer, u16 whichLine, u16 paletteNum)
{
    s32 i;
    const u16 * tileIdxs = gUnknown_8466C0C[whichLine].tiles;
    u16 palMask = (paletteNum & 0xF) << 12;

    for (i = 0; i < gUnknown_8466C0C[whichLine].count; i++)
    {
        bgTilemapBuffer[*tileIdxs] &= 0x0FFF;
        bgTilemapBuffer[*tileIdxs] |= palMask;
        tileIdxs++;
    }
}

static void sub_814191C(u8 taskId)
{
    s16 * data = gTasks[taskId].data;
    s32 i;

    switch (data[0])
    {
    case 0:
        LoadPalette(gUnknown_84664BC, 0x60, 0x20);
        for (i = 0; i < 5; i++)
        {
            if (sub_8140BF8(i))
                sub_81418C4(GetBgTilemapBuffer(2), i, 6);
        }
        CopyBgTilemapBufferToVram(2);
        data[0]++;
        break;
    case 1:
        if (data[1] == 0)
        {
            u16 y = gSineTable[data[2]] >> 7;
            LoadPalette(&gUnknown_84664DC[16 * y], 0x10, 0x20);
            data[2] += 32;
            data[2] &= 0x7F;
            data[1] = 8;
        }
        else
            data[1]--;

        if (data[3] == 0)
        {
            data[4] += 8;
            data[4] &= 0x7F;
            data[5] = gSineTable[data[4]] >> 5;
            BlendPalettes(0x00000040, data[5], RGB_BLACK);
        }
        else
        {
            data[4]++;
            if (data[4] > 1)
            {
                data[4] = 0;
                data[5]++;
                data[5] &= 1;
                BlendPalettes(0x00000040, data[5] * 8, RGB_BLACK);
            }
        }

        for (i = 0; i < NELEMS(gUnknown_8466C34); i++)
        {
            gPlttBufferFaded[gUnknown_8466C34[i] + 0x60] = gPlttBufferUnfaded[gUnknown_8466C34[i] + 0x60];
        }
        break;
    case 2:
        for (i = 0; i < 5; i++)
        {
            if (sub_8140BF8(i))
                sub_81418C4(GetBgTilemapBuffer(2), i, 4);
        }
        LoadPalette(gUnknown_8465950, 0x10, 0x20);
        CopyBgTilemapBufferToVram(2);
        data[0]++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
            DestroyTask(taskId);
        break;
    }
}

static void sub_8141AB0(void)
{
    gTasks[FindTaskIdByFunc(sub_814191C)].data[0] = 2;
}

static void sub_8141AD8(u8 cursorPos)
{
    CreateYesNoMenu(&gUnknown_8466C38, 2, 0, 2, 10, 13, cursorPos);
    Menu_MoveCursorNoWrapAround(cursorPos);
    sub_814112C()->field_0028 = TRUE;
}

static void sub_8141B18(void)
{
    struct SlotMachineSetupTaskData * data = sub_814112C();
    if (data->field_0028)
    {
        DestroyYesNoMenu();
        data->field_0028 = FALSE;
    }
}

static void sub_8141B34(void)
{
    s32 i, j;
    struct SlotMachineSetupTaskData * data = sub_814112C();
    u16 * buffer = GetBgTilemapBuffer(2);

    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 4; j++)
        {
            u16 idx = gUnknown_8466C40[i][j];
            data->field_0044[i][j] = buffer[idx];
            data->field_002C[i][j] = j + 0xC0;
        }
    }
}

static void sub_8141BA0(u8 reel)
{
    if (reel < 3)
    {
        s32 i;
        struct SlotMachineSetupTaskData * data = sub_814112C();
        u16 * buffer = GetBgTilemapBuffer(2);
        for (i = 0; i < 4; i++)
        {
            u16 idx = gUnknown_8466C40[reel][i];
            buffer[idx] = data->field_002C[reel][i];
        }
    }
}

static void sub_8141BE4(void)
{
    s32 i, j;
    struct SlotMachineSetupTaskData * data = sub_814112C();
    u16 * buffer = GetBgTilemapBuffer(2);

    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 4; j++)
        {
            u16 idx = gUnknown_8466C40[i][j];
            buffer[idx] = data->field_0044[i][j];
        }
    }
}

static void sub_8141C30(u8 a0, u8 a1)
{
    sub_814112C()->field_0020 = a0;
    sub_8141148(12, a1);
}
