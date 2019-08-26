#include "global.h"
#include "main.h"
#include "task.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/species.h"
#include "malloc.h"
#include "save.h"
#include "util.h"
#include "string_util.h"
#include "event_data.h"
#include "random.h"
#include "cereader_tool.h"
#include "easy_chat.h"
#include "text.h"
#include "battle_setup.h"
#include "battle_transition.h"
#include "battle.h"
#include "battle_2.h"
#include "overworld.h"
#include "item.h"
#include "window.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "sound.h"

struct UnkStruct_8479D34
{
    s8 mapGroup;
    s8 mapNum;
    u8 filler[2];
    u8 flags1[8];
    u8 flags2[8];
    u8 flags3[8];
};

struct UnkStruct_203F458
{
    /* 0x0000 */ u8 unk_0000;
    /* 0x0004 */ struct TrainerTowerData unk_0004;
};

struct UnkStruct_203F45C
{
    /* 0x00 */ u8 unk_00[11];
    /* 0x0C */ u16 unk_0C[6];
    /* 0x18 */ u16 unk_18[6];
    /* 0x24 */ u16 unk_24[6];
    /* 0x30 */ u16 unk_30[6];
    /* 0x3C */ u8 unk_3C;
    /* 0x3D */ u8 unk_3D;
    /* 0x3E */ u8 unk_3E;
};

struct UnkStruct_8479ED8
{
    u8 unk0;
    u8 unk1;
    bool8 unk2;
};

struct UnkStruct_847A024
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    bool8 unk3;
    bool8 unk4;
};

struct UnkStruct_847A074
{
    u8 unk0;
    u8 unk1;
};

EWRAM_DATA struct UnkStruct_203F458 * gUnknown_203F458 = NULL;
EWRAM_DATA struct UnkStruct_203F45C * gUnknown_203F45C = NULL;
EWRAM_DATA u8 unused_variable = 0;

void sub_815D96C(void);
void sub_815DC8C(void);  // setup
void sub_815DD2C(void);  // teardown
void sub_815DD44(void);
void sub_815DDB0(void);
void sub_815DEFC(u16 * ecWords, u8 * dest);
void sub_815DF54(void);
void sub_815E068(u8 battleType, u8 facilityClass);
void sub_815E160(void);
void sub_815E1C0(void);
void sub_815E1F0(void);
void sub_815E218(void);
void sub_815E28C(void);
void sub_815E394(void);
void sub_815E408(void);
void sub_815E4B0(void);
void sub_815E56C(void);
void sub_815E5C4(void);
void sub_815E5F0(void);
void sub_815E658(void);
void sub_815E720(void);
void sub_815E88C(void);
void sub_815E8B4(void);
void sub_815E8CC(void);
void sub_815E908(void);
void sub_815E948(void);
void sub_815E9C8(void);
void sub_815E9FC(void);
static s32 GetPartyMaxLevel(void);
void sub_815EC0C(void);
u32 sub_815EDDC(u32 *);
void sub_815EDF4(u32 *, u32);

extern const u8 gUnknown_83FE982[];
extern const u8 gUnknown_83FE998[];
extern const u8 *const gUnknown_83FE9C4[];

const struct UnkStruct_8479D34 gUnknown_8479D34[] = {
    {
        0x03, 0x26,
        .flags1 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags2 = {0x99, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags3 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
    },
    {
        0x03, 0x27,
        .flags1 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags2 = {0x9a, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags3 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
    },
    {
        0x01, 0x1f,
        .flags1 = {0x4c, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags2 = {0x46, 0x47, 0x48, 0x49, 0x4a, 0x4b, 0xff, 0xff},
        .flags3 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
    },
    {
        0x01, 0x22,
        .flags1 = {0x53, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags2 = {0x4d, 0x4e, 0x4f, 0x50, 0x51, 0x52, 0xff, 0xff},
        .flags3 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
    },
    {
        0x03, 0x41,
        .flags1 = {0x40, 0x41, 0x42, 0x43, 0xff, 0xff, 0xff, 0xff},
        .flags2 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags3 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
    },
    {
        0x01, 0x02,
        .flags1 = {0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0xff, 0xff},
        .flags2 = {0x54, 0x55, 0x56, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags3 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
    },
    {
        0x01, 0x6d,
        .flags1 = {0x5b, 0x5d, 0x5e, 0x5f, 0x63, 0x64, 0x65, 0x66},
        .flags2 = {0x5b, 0x5d, 0x5e, 0x5f, 0x63, 0x64, 0x65, 0xff},
        .flags3 = {0x5a, 0x5c, 0x60, 0x61, 0x62, 0xff, 0xff, 0xff}
    },
    {
        0x03, 0x2e,
        .flags1 = {0x6b, 0x6c, 0x6d, 0x6e, 0xff, 0xff, 0xff, 0xff},
        .flags2 = {0x67, 0x68, 0x69, 0x6a, 0x6b, 0x6c, 0xff, 0xff},
        .flags3 = {0x6b, 0x6c, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
    },
    {
        0x03, 0x30,
        .flags1 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags2 = {0xa6, 0xa7, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags3 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
    },
    {
        0x03, 0x0f,
        .flags1 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags2 = {0xa8, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags3 = {0xa9, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
    },
    {
        0x03, 0x39,
        .flags1 = {0xaa, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags2 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags3 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
    },
    {
        0x03, 0x36,
        .flags1 = {0xae, 0xb0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags2 = {0xaf, 0xb1, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags3 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
    },
    {
        0x03, 0x3a,
        .flags1 = {0xb2, 0xb3, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags2 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags3 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
    },
    {
        0x03, 0x3b,
        .flags1 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags2 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags3 = {0xb4, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
    },
    {
        0x03, 0x3e,
        .flags1 = {0xb9, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags2 = {0xba, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
        .flags3 = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
    },
};

const struct UnkStruct_8479ED8 gUnknown_8479ED8[] = {
    {0x1c, 0x03, 0x01},
    {0x38, 0x04, 0x00},
    {0x25, 0x06, 0x01},
    {0x26, 0x07, 0x00},
    {0x29, 0x08, 0x00},
    {0x2a, 0x09, 0x01},
    {0x34, 0x0a, 0x00},
    {0x1c, 0x0b, 0x01},
    {0x1d, 0x0c, 0x01},
    {0x13, 0x0d, 0x00},
    {0x34, 0x0e, 0x00},
    {0x2d, 0x0f, 0x00},
    {0x36, 0x10, 0x00},
    {0x1a, 0x11, 0x00},
    {0x1a, 0x12, 0x00},
    {0x27, 0x13, 0x00},
    {0x34, 0x14, 0x00},
    {0x13, 0x15, 0x00},
    {0x17, 0x16, 0x01},
    {0x3d, 0x17, 0x00},
    {0x13, 0x1d, 0x00},
    {0x17, 0x1e, 0x01},
    {0x1e, 0x20, 0x00},
    {0x1f, 0x21, 0x01},
    {0x20, 0x22, 0x00},
    {0x23, 0x23, 0x01},
    {0x12, 0x24, 0x00},
    {0x39, 0x26, 0x00},
    {0x29, 0x2d, 0x00},
    {0x1a, 0x2e, 0x00},
    {0x10, 0x2f, 0x00},
    {0x18, 0x30, 0x01},
    {0x1d, 0x31, 0x01},
    {0x2e, 0x32, 0x01},
    {0x28, 0x33, 0x01},
    {0x3e, 0x35, 0x00},
    {0x1b, 0x38, 0x00},
    {0x19, 0x40, 0x00},
    {0x1c, 0x41, 0x01},
    {0x27, 0x42, 0x00},
    {0x28, 0x43, 0x01},
    {0x16, 0x47, 0x01},
    {0x14, 0x48, 0x00},
    {0x38, 0x49, 0x00},
    {0x12, 0x58, 0x00},
    {0x14, 0x59, 0x00},
    {0x16, 0x5a, 0x01},
    {0x3e, 0x5b, 0x00},
    {0x27, 0x5c, 0x00},
    {0x28, 0x5d, 0x01},
    {0x34, 0x5e, 0x00},
    {0x34, 0x5f, 0x00},
    {0x38, 0x60, 0x00},
    {0x35, 0x61, 0x00},
    {0x34, 0x62, 0x00},
    {0x1e, 0x63, 0x00},
    {0x39, 0x64, 0x00},
    {0x2d, 0x65, 0x00},
    {0x35, 0x66, 0x00},
    {0x20, 0x67, 0x00},
    {0x1d, 0x68, 0x01},
    {0x2e, 0x69, 0x01},
    {0x13, 0x6a, 0x00},
    {0x1a, 0x6b, 0x00},
    {0x1a, 0x6c, 0x00},
    {0x19, 0x6d, 0x00},
    {0x1a, 0x6e, 0x00},
    {0x36, 0x6f, 0x00},
    {0x37, 0x71, 0x00},
    {0x29, 0x74, 0x00},
    {0x2a, 0x75, 0x01},
    {0x3d, 0x7a, 0x00},
    {0x3a, 0x7d, 0x01},
    {0x17, 0x89, 0x01},
    {0x18, 0x8a, 0x01},
    {0x25, 0x8b, 0x01},
    {0x1c, 0x8c, 0x01},
    {0x27, 0x8d, 0x00},
    {0x28, 0x8e, 0x01},
    {0x1c, 0x8f, 0x01},
    {0x38, 0x90, 0x00},
    {0x1c, 0x91, 0x01},
    {0x16, 0x92, 0x01}
};

const struct UnkStruct_847A024 gUnknown_847A024[] = {
    {0x1d, 0x17, 0x1f, 0x01, 0x01},
    {0x11, 0x11, 0x34, 0x01, 0x01},
    {0x1d, 0x19, 0x4a, 0x01, 0x00},
    {0x20, 0x23, 0x4b, 0x00, 0x01},
    {0x26, 0x2e, 0x4c, 0x00, 0x01},
    {0x11, 0x11, 0x7e, 0x01, 0x01},
    {0x29, 0x2a, 0x7f, 0x00, 0x01},
    {0x1d, 0x19, 0x80, 0x01, 0x00},
    {0x18, 0x36, 0x81, 0x01, 0x00},
    {0x2e, 0x26, 0x82, 0x01, 0x00}
};

const struct UnkStruct_847A074 gUnknown_847A074[105] = {
    {0x03, 0x06},
    {0x37, 0x06},
    {0x02, 0x06},
    {0x67, 0x01},
    {0x04, 0x01},
    {0x24, 0x04},
    {0x4a, 0x01},
    {0x26, 0x01},
    {0x2a, 0x00},
    {0x42, 0x03},
    {0x1b, 0x09},
    {0x4c, 0x03},
    {0x44, 0x03},
    {0x21, 0x04},
    {0x43, 0x03},
    {0x6a, 0x01},
    {0x5d, 0x05},
    {0x56, 0x05},
    {0x09, 0x05},
    {0x11, 0x04},
    {0x48, 0x03},
    {0x3c, 0x00},
    {0x29, 0x00},
    {0x5c, 0x09},
    {0x28, 0x09},
    {0x06, 0x0c},
    {0x68, 0x0b},
    {0x05, 0x0b},
    {0x58, 0x0d},
    {0x16, 0x0d},
    {0x46, 0x08},
    {0x0f, 0x01},
    {0x3f, 0x03},
    {0x0e, 0x03},
    {0x5f, 0x04},
    {0x63, 0x04},
    {0x50, 0x04},
    {0x10, 0x04},
    {0x52, 0x03},
    {0x35, 0x04},
    {0x5b, 0x03},
    {0x14, 0x03},
    {0x3d, 0x00},
    {0x13, 0x00},
    {0x12, 0x0b},
    {0x30, 0x07},
    {0x38, 0x07},
    {0x2f, 0x07},
    {0x3b, 0x01},
    {0x31, 0x01},
    {0x4e, 0x0b},
    {0x3a, 0x00},
    {0x32, 0x00},
    {0x23, 0x03},
    {0x0d, 0x0d},
    {0x0a, 0x03},
    {0x49, 0x01},
    {0x0c, 0x01},
    {0x69, 0x01},
    {0x0b, 0x01},
    {0x25, 0x01},
    {0x3e, 0x02},
    {0x27, 0x02},
    {0x65, 0x01},
    {0x2d, 0x01},
    {0x61, 0x01},
    {0x2b, 0x03},
    {0x66, 0x05},
    {0x2e, 0x05},
    {0x2c, 0x00},
    {0x5e, 0x02},
    {0x34, 0x02},
    {0x51, 0x00},
    {0x59, 0x00},
    {0x40, 0x03},
    {0x55, 0x06},
    {0x53, 0x06},
    {0x4b, 0x04},
    {0x15, 0x04},
    {0x1a, 0x09},
    {0x57, 0x0a},
    {0x17, 0x01},
    {0x47, 0x03},
    {0x62, 0x01},
    {0x39, 0x00},
    {0x1d, 0x00},
    {0x1c, 0x04},
    {0x20, 0x00},
    {0x4f, 0x05},
    {0x22, 0x05},
    {0x45, 0x0b},
    {0x1f, 0x0b},
    {0x5a, 0x00},
    {0x1e, 0x00},
    {0x08, 0x00},
    {0x64, 0x02},
    {0x07, 0x02},
    {0x60, 0x08},
    {0x36, 0x08},
    {0x41, 0x0b},
    {0x33, 0x0b},
    {0x54, 0x00},
    {0x18, 0x01},
    {0x4d, 0x0b},
    {0x19, 0x00}
};

const struct WindowTemplate gUnknown_847A218[] = {
    {0, 3, 1, 27, 18, 15, 0x001},
    DUMMY_WIN_TEMPLATE
};

const u32 gUnknown_847A228 = 0x70;  // unused

const u8 gUnknown_847A22C[3] = {0, 2, 3};

void (*const gUnknown_847A230[])(void) = {
    sub_815DD44,
    sub_815DF54,
    sub_815E160,
    sub_815E1C0,
    sub_815E1F0,
    sub_815E218,
    sub_815E28C,
    sub_815E394,
    sub_815E408,
    sub_815E4B0,
    sub_815E56C,
    sub_815E5C4,
    sub_815E5F0,
    sub_815E658,
    sub_815E720,
    sub_815E88C,
    sub_815E8B4,
    sub_815E8CC,
    sub_815E908,
    sub_815E948,
    sub_815E9C8
};

const u16 gUnknown_847A284[8][3] = {
    {0x012a, 0x016e, 0x0176},
    {0x012b, 0x016f, 0x0177},
    {0x012c, 0x0170, 0x0178},
    {0x012d, 0x0171, 0x0179},
    {0x012e, 0x0172, 0x017a},
    {0x012f, 0x0173, 0x017b},
    {0x0130, 0x0174, 0x017c},
    {0x0131, 0x0175, 0x017d}
};

const u16 gUnknown_847A2B4[] = {
    ITEM_HP_UP,
    ITEM_PROTEIN,
    ITEM_IRON,
    ITEM_CARBOS,
    ITEM_CALCIUM,
    ITEM_ZINC,
    ITEM_BRIGHT_POWDER,
    ITEM_WHITE_HERB,
    ITEM_MENTAL_HERB,
    ITEM_CHOICE_BAND,
    ITEM_KINGS_ROCK,
    ITEM_SCOPE_LENS,
    ITEM_METAL_COAT,
    ITEM_DRAGON_SCALE,
    ITEM_UP_GRADE
};

const u16 gUnknown_847A2D2[] = {
    0x011d,
    0x011c,
    0x011c,
    0x011b,
    0x011d,
    0x011d,
    0x011b,
    0x011b,
    0x011d,
    0x011c,
    0x011d,
    0x011d,
    0x011d,
    0x011d
};

const u8 gUnknown_847A2EE[][2] = {
    {0x00, 0x02},
    {0x01, 0x03},
    {0x02, 0x04},
    {0x03, 0x05},
    {0x04, 0x01},
    {0x05, 0x02},
    {0x00, 0x03},
    {0x01, 0x04}
};

const u8 gUnknown_847A2FE[][2] = {
    {0x00, 0x01},
    {0x01, 0x03},
    {0x02, 0x00},
    {0x03, 0x04},
    {0x04, 0x02},
    {0x05, 0x02},
    {0x00, 0x03},
    {0x01, 0x05}
};

const u8 gUnknown_847A30E[][3] = {
    {0x00, 0x02, 0x04},
    {0x01, 0x03, 0x05},
    {0x02, 0x03, 0x01},
    {0x03, 0x04, 0x00},
    {0x04, 0x01, 0x02},
    {0x05, 0x00, 0x03},
    {0x00, 0x05, 0x02},
    {0x01, 0x04, 0x05}
};

extern const struct Unk_203F458_Header gUnknown_84827AC;
extern const struct TrainerTowerTrainer *const gUnknown_84827B4[][8];

bool32 sub_815D834(void)
{
    // Stubbed out?
    return FALSE;
}

void sub_815D838(void)
{
    u8 i, j;

    for (i = 0; i < 15; i++)
    {
        const u8 * flags1 = gUnknown_8479D34[i].flags1;
        const u8 * flags2 = gUnknown_8479D34[i].flags2;
        const u8 * flags3 = gUnknown_8479D34[i].flags3;
        for (j = 0; j < 8; j++)
        {
            if (flags1[j] != 0xFF)
                FlagSet(FLAG_TRAINER_TOWER_START + flags1[j]);
            if (flags2[j] != 0xFF)
                FlagSet(FLAG_TRAINER_TOWER_START + flags2[j]);
            if (flags3[j] != 0xFF)
                FlagSet(FLAG_TRAINER_TOWER_START + flags3[j]);
        }
    }
}

void sub_815D8C8(void)
{
    u16 var = VarGet(VAR_0x4023);
    if (var < 1500) {
        VarSet(VAR_0x4023, var + 1);
    }
}

void sub_815D8F8(void)
{
    u8 i;
    u8 found_map = 0xFF;
    for (i = 0; i < 15; i++)
    {
        if (gUnknown_8479D34[i].mapGroup == gSaveBlock1Ptr->location.mapGroup && gUnknown_8479D34[i].mapNum == gSaveBlock1Ptr->location.mapNum)
            found_map = i;
    }

    if (found_map == 0xFF)
        return;
    if (VarGet(VAR_0x4023) >= 1500)
    {
        VarSet(VAR_0x4023, 0);
        sub_815D838();
        sub_815D96C();
    }
}

void sub_815D96C(void)
{
    u8 i, j;
    const u8 * flags;
    u16 rval;

    for (i = 0; i < 15; i++)
    {
        rval = Random() % 100;
        if (rval >= 90)
            flags = gUnknown_8479D34[i].flags1;
        else if (rval >= 60)
            flags = gUnknown_8479D34[i].flags2;
        else
            flags = gUnknown_8479D34[i].flags3;
        for (j = 0; j < 8; j++)
        {
            if (flags[j] != 0xFF)
                FlagClear(FLAG_TRAINER_TOWER_START + flags[j]);
        }
    }
}

void sub_815D9E8(void)
{
    sub_815DC8C();
    gUnknown_847A230[gSpecialVar_0x8004]();
    sub_815DD2C();
}

u8 sub_815DA10(void)
{
    return gFacilityClassToTrainerClass[gUnknown_203F45C->unk_3D];
}

void sub_815DA28(u8 * dest)
{
    StringCopyN(dest, gUnknown_203F45C->unk_00, 11);
}

u8 sub_815DA3C(void)
{
    return gFacilityClassToPicIndex[gUnknown_203F45C->unk_3D];
}

void sub_815DA54(void)
{
    u16 r10;
    s32 r9;

    sub_815DC8C();
    gUnknown_203F45C = AllocZeroed(sizeof(*gUnknown_203F45C));
    r10 = VarGet(VAR_0x4001);
    StringCopyN(gUnknown_203F45C->unk_00, gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[r10].unk_000, 11);

    for (r9 = 0; r9 < 6; r9++)
    {
        gUnknown_203F45C->unk_0C[r9] = gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[r10].unk_01A[r9];
        gUnknown_203F45C->unk_18[r9] = gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[r10].unk_026[r9];

        if (gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_002 == 1)
        {
            gUnknown_203F45C->unk_24[r9] = gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[r10 + 1].unk_01A[r9];
            gUnknown_203F45C->unk_30[r9] = gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[r10 + 1].unk_026[r9];
        }
    }

    gUnknown_203F45C->unk_3C = gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_002;
    gUnknown_203F45C->unk_3D = gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[r10].unk_00B;
    gUnknown_203F45C->unk_3E = gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[r10].unk_00C;
    SetVBlankCounter1Ptr(&gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0);
    sub_815DD2C();
}

void sub_815DBDC(void)
{
    Free(gUnknown_203F45C);
    gUnknown_203F45C = NULL;
}

void sub_815DBF4(u8 * dest, u8 opponentIdx)
// TTower_GetBeforeBattleMessage?
{
    VarSet(VAR_0x4003, opponentIdx);
    sub_815E068(gUnknown_203F45C->unk_3C, gUnknown_203F45C->unk_3D);
    if (opponentIdx == 0)
        sub_815DEFC(gUnknown_203F45C->unk_0C, dest);
    else
        sub_815DEFC(gUnknown_203F45C->unk_24, dest);
}

void sub_815DC40(u8 * dest, u8 opponentIdx)
// TTower_GetAfterBattleMessage?
{
    VarSet(VAR_0x4003, opponentIdx);
    sub_815E068(gUnknown_203F45C->unk_3C, gUnknown_203F45C->unk_3D);
    if (opponentIdx == 0)
        sub_815DEFC(gUnknown_203F45C->unk_18, dest);
    else
        sub_815DEFC(gUnknown_203F45C->unk_30, dest);
}

#ifdef NONMATCHING
void sub_815DC8C(void) // fakematching
{
    u32 whichTimer = gSaveBlock1Ptr->unkArrayIdx;
    s32 r4;
    const struct TrainerTowerTrainer *const * r7;

    gUnknown_203F458 = AllocZeroed(sizeof(*gUnknown_203F458));
    gUnknown_203F458->unk_0000 = gMapHeader.mapDataId - 0x2A;
    if (sub_815D834() == TRUE)
        CEReaderTool_LoadTrainerTower(&gUnknown_203F458->unk_0004);
    else
    {
        struct UnkStruct_203F458 * r0_ = gUnknown_203F458;
        const struct Unk_203F458_Header * r1 = &gUnknown_84827AC;
//        *r0_ = *r1;
        memcpy(&r0_->unk_0004.unk_0000, r1, sizeof(struct Unk_203F458_Header));
//        gUnknown_203F458->unk_0004.unk_0000 = gUnknown_84827AC;
        r7 = gUnknown_84827B4[whichTimer];
        for (r4 = 0; r4 < 8; r4++)
        {
            void * r0 = gUnknown_203F458;
            r0 = r4 * sizeof(struct TrainerTowerTrainer) + r0;
            r0 += offsetof(struct UnkStruct_203F458, unk_0004.trainers);
            memcpy(r0, r7[r4], sizeof(struct TrainerTowerTrainer));
//            r0[r4] = *r7[r4];
        }
        gUnknown_203F458->unk_0004.unk4 = CalcByteArraySum((void *)gUnknown_203F458->unk_0004.trainers, sizeof(gUnknown_203F458->unk_0004.trainers));
        sub_815EC0C();
    }
}
#else
NAKED
void sub_815DC8C(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tldr r0, _0815DCBC @ =gSaveBlock1Ptr\n"
                "\tldr r0, [r0]\n"
                "\tldr r1, _0815DCC0 @ =0x00003d34\n"
                "\tadds r0, r1\n"
                "\tldr r5, [r0]\n"
                "\tldr r4, _0815DCC4 @ =gUnknown_203F458\n"
                "\tldr r0, _0815DCC8 @ =0x00001f0c\n"
                "\tbl AllocZeroed\n"
                "\tstr r0, [r4]\n"
                "\tldr r1, _0815DCCC @ =gMapHeader\n"
                "\tldrb r1, [r1, 0x12]\n"
                "\tsubs r1, 0x2A\n"
                "\tstrb r1, [r0]\n"
                "\tbl sub_815D834\n"
                "\tcmp r0, 0x1\n"
                "\tbne _0815DCD0\n"
                "\tldr r0, [r4]\n"
                "\tadds r0, 0x4\n"
                "\tbl CEReaderTool_LoadTrainerTower\n"
                "\tb _0815DD18\n"
                "\t.align 2, 0\n"
                "_0815DCBC: .4byte gSaveBlock1Ptr\n"
                "_0815DCC0: .4byte 0x00003d34\n"
                "_0815DCC4: .4byte gUnknown_203F458\n"
                "_0815DCC8: .4byte 0x00001f0c\n"
                "_0815DCCC: .4byte gMapHeader\n"
                "_0815DCD0:\n"
                "\tldr r0, [r4]\n"
                "\tldr r1, _0815DD20 @ =gUnknown_84827AC\n"
                "\tadds r0, 0x4\n"
                "\tmovs r2, 0x8\n"
                "\tbl memcpy\n"
                "\tlsls r1, r5, 5\n"
                "\tldr r0, _0815DD24 @ =gUnknown_84827B4\n"
                "\tadds r7, r1, r0\n"
                "\tmovs r5, 0\n"
                "\tmovs r4, 0x7\n"
                "_0815DCE6:\n"
                "\tldr r6, _0815DD28 @ =gUnknown_203F458\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, r5, r0\n"
                "\tadds r0, 0xC\n"
                "\tldm r7!, {r1}\n"
                "\tmovs r2, 0xF8\n"
                "\tlsls r2, 2\n"
                "\tbl memcpy\n"
                "\tmovs r0, 0xF8\n"
                "\tlsls r0, 2\n"
                "\tadds r5, r0\n"
                "\tsubs r4, 0x1\n"
                "\tcmp r4, 0\n"
                "\tbge _0815DCE6\n"
                "\tldr r0, [r6]\n"
                "\tadds r0, 0xC\n"
                "\tmovs r1, 0xF8\n"
                "\tlsls r1, 5\n"
                "\tbl CalcByteArraySum\n"
                "\tldr r1, [r6]\n"
                "\tstr r0, [r1, 0x8]\n"
                "\tbl sub_815EC0C\n"
                "_0815DD18:\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_0815DD20: .4byte gUnknown_84827AC\n"
                "_0815DD24: .4byte gUnknown_84827B4\n"
                "_0815DD28: .4byte gUnknown_203F458");
}
#endif // NONMATCHING

void sub_815DD2C(void)
{
    Free(gUnknown_203F458);
    gUnknown_203F458 = NULL;
}

void sub_815DD44(void)
{
    if (gMapHeader.mapDataId - 0x129 > gUnknown_203F458->unk_0004.count)
    {
        gSpecialVar_Result = 3;
        SetCurrentMapLayout(0x132);
    }
    else
    {
        gSpecialVar_Result = gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_002;
        SetCurrentMapLayout(gUnknown_847A284[gUnknown_203F458->unk_0000][gSpecialVar_Result]);
        sub_815DDB0();
    }
}

void sub_815DDB0(void)
{
    s32 r3, r4;
    u8 r1, r2, r4_;
    switch (gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_002)
    {
        case 0:
            r2 = gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[0].unk_00B;
            for (r3 = 0; r3 < NELEMS(gUnknown_8479ED8); r3++)
            {
                if (gUnknown_8479ED8[r3].unk1 == r2)
                    break;
            }
            if (r3 != NELEMS(gUnknown_8479ED8))
                r1 = gUnknown_8479ED8[r3].unk0;
            else
                r1 = 18;
            VarSet(VAR_0x4011, r1);
            break;
        case 1:
            r2 = gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[0].unk_00B;
            for (r3 = 0; r3 < NELEMS(gUnknown_847A024); r3++)
            {
                if (gUnknown_847A024[r3].unk2 == r2)
                    break;
            }
            if (r3 != NELEMS(gUnknown_847A024))
            {
                r1  = gUnknown_847A024[r3].unk0;
                r4_ = gUnknown_847A024[r3].unk1;
            }
            else
            {
                r1  = 18;
                r4_ = 18;
            }
            VarSet(VAR_0x4010, r1);
            VarSet(VAR_0x4013, r4_);
            break;
        case 2:
            for (r4 = 0; r4 < 3; r4++)
            {
                r2 = gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[r4].unk_00B;
                for (r3 = 0; r3 < NELEMS(gUnknown_8479ED8); r3++)
                {
                    if (gUnknown_8479ED8[r3].unk1 == r2)
                        break;
                }
                if (r3 != NELEMS(gUnknown_8479ED8))
                    r1 = gUnknown_8479ED8[r3].unk0;
                else
                    r1 = 18;
                switch (r4)
                {
                    case 0:
                        VarSet(VAR_0x4012, r1);
                        break;
                    case 1:
                        VarSet(VAR_0x4010, r1);
                        break;
                    case 2:
                        VarSet(VAR_0x4011, r1);
                        break;
                }
            }
    }
}

void sub_815DEFC(u16 * ecWords, u8 * dest)
{
    s32 r1;
    ConvertEasyChatWordsToString(dest, ecWords, 3, 2);
    if ((unsigned)GetStringWidth(2, dest, -1) > 196)
    {
        ConvertEasyChatWordsToString(dest, ecWords, 2, 3);
        r1 = 0;
        while (dest[r1++] != CHAR_NEWLINE)
            ;
        while (dest[r1] != CHAR_NEWLINE)
            r1++;
        dest[r1] = CHAR_PROMPT_SCROLL;
    }
}

#ifdef NONMATCHING
void sub_815DF54(void)
{
    u16 r4 = gSpecialVar_0x8006;
    u8 r1;
    u8 r5 = gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_002;
    // HOW DO I MATCH THIS CONTROL FLOW?!?!
    r1 = gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[r5 == 1 ? 0 : r4].unk_00B;
    switch (gSpecialVar_0x8005)
    {
        case 2:
            sub_815E068(r5, r1);
            sub_815DEFC(gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[r4].unk_00E, gStringVar4);
            break;
        case 3:
            sub_815E068(r5, r1);
            sub_815DEFC(gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[r4].unk_01A, gStringVar4);
            break;
        case 4:
            sub_815E068(r5, r1);
            sub_815DEFC(gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[r4].unk_026, gStringVar4);
            break;
        case 5:
            sub_815DEFC(gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[r4].unk_032, gStringVar4);
            break;
    }
}
#else
NAKED
void sub_815DF54(void)
{
    asm_unified("\tpush {r4,r5,lr}\n"
                "\tldr r0, _0815DF90 @ =gSpecialVar_0x8006\n"
                "\tldrh r4, [r0]\n"
                "\tldr r2, _0815DF94 @ =gUnknown_203F458\n"
                "\tldr r3, [r2]\n"
                "\tldrb r1, [r3]\n"
                "\tlsls r0, r1, 5\n"
                "\tsubs r0, r1\n"
                "\tlsls r1, r0, 5\n"
                "\tadds r0, r3, r1\n"
                "\tldrb r5, [r0, 0xE]\n"
                "\tcmp r5, 0x1\n"
                "\tbeq _0815DF7C\n"
                "\tlsls r0, r4, 2\n"
                "\tadds r0, r4\n"
                "\tlsls r0, 3\n"
                "\tadds r0, r4\n"
                "\tlsls r0, 3\n"
                "\tadds r0, r1\n"
                "\tadds r0, r3, r0\n"
                "_0815DF7C:\n"
                "\tldrb r1, [r0, 0x1B]\n"
                "\tldr r0, _0815DF98 @ =gSpecialVar_0x8005\n"
                "\tldrh r0, [r0]\n"
                "\tcmp r0, 0x3\n"
                "\tbeq _0815DFD4\n"
                "\tcmp r0, 0x3\n"
                "\tbgt _0815DF9C\n"
                "\tcmp r0, 0x2\n"
                "\tbeq _0815DFA6\n"
                "\tb _0815E05C\n"
                "\t.align 2, 0\n"
                "_0815DF90: .4byte gSpecialVar_0x8006\n"
                "_0815DF94: .4byte gUnknown_203F458\n"
                "_0815DF98: .4byte gSpecialVar_0x8005\n"
                "_0815DF9C:\n"
                "\tcmp r0, 0x4\n"
                "\tbeq _0815E000\n"
                "\tcmp r0, 0x5\n"
                "\tbeq _0815E038\n"
                "\tb _0815E05C\n"
                "_0815DFA6:\n"
                "\tadds r0, r5, 0\n"
                "\tbl sub_815E068\n"
                "\tldr r0, _0815DFD0 @ =gUnknown_203F458\n"
                "\tldr r0, [r0]\n"
                "\tldrb r2, [r0]\n"
                "\tlsls r1, r2, 5\n"
                "\tsubs r1, r2\n"
                "\tlsls r1, 5\n"
                "\tadds r1, 0xC\n"
                "\tadds r0, r1\n"
                "\tlsls r1, r4, 2\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, 0x4\n"
                "\tadds r0, r1\n"
                "\tadds r0, 0xE\n"
                "\tb _0815E026\n"
                "\t.align 2, 0\n"
                "_0815DFD0: .4byte gUnknown_203F458\n"
                "_0815DFD4:\n"
                "\tadds r0, r5, 0\n"
                "\tbl sub_815E068\n"
                "\tldr r0, _0815DFFC @ =gUnknown_203F458\n"
                "\tldr r0, [r0]\n"
                "\tldrb r2, [r0]\n"
                "\tlsls r1, r2, 5\n"
                "\tsubs r1, r2\n"
                "\tlsls r1, 5\n"
                "\tadds r1, 0xC\n"
                "\tadds r0, r1\n"
                "\tlsls r1, r4, 2\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, 0x4\n"
                "\tadds r0, r1\n"
                "\tadds r0, 0x1A\n"
                "\tb _0815E026\n"
                "\t.align 2, 0\n"
                "_0815DFFC: .4byte gUnknown_203F458\n"
                "_0815E000:\n"
                "\tadds r0, r5, 0\n"
                "\tbl sub_815E068\n"
                "\tldr r0, _0815E030 @ =gUnknown_203F458\n"
                "\tldr r0, [r0]\n"
                "\tldrb r2, [r0]\n"
                "\tlsls r1, r2, 5\n"
                "\tsubs r1, r2\n"
                "\tlsls r1, 5\n"
                "\tadds r1, 0xC\n"
                "\tadds r0, r1\n"
                "\tlsls r1, r4, 2\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, 0x4\n"
                "\tadds r0, r1\n"
                "\tadds r0, 0x26\n"
                "_0815E026:\n"
                "\tldr r1, _0815E034 @ =gStringVar4\n"
                "\tbl sub_815DEFC\n"
                "\tb _0815E05C\n"
                "\t.align 2, 0\n"
                "_0815E030: .4byte gUnknown_203F458\n"
                "_0815E034: .4byte gStringVar4\n"
                "_0815E038:\n"
                "\tldr r0, [r2]\n"
                "\tldrb r2, [r0]\n"
                "\tlsls r1, r2, 5\n"
                "\tsubs r1, r2\n"
                "\tlsls r1, 5\n"
                "\tadds r1, 0xC\n"
                "\tadds r0, r1\n"
                "\tlsls r1, r4, 2\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, r4\n"
                "\tlsls r1, 3\n"
                "\tadds r1, 0x4\n"
                "\tadds r0, r1\n"
                "\tadds r0, 0x32\n"
                "\tldr r1, _0815E064 @ =gStringVar4\n"
                "\tbl sub_815DEFC\n"
                "_0815E05C:\n"
                "\tpop {r4,r5}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_0815E064: .4byte gStringVar4");
}
#endif // NONMATCHING

void sub_815E068(u8 battleType, u8 facilityClass)
{
    u16 r5 = FALSE;
    s32 r4;
    switch (battleType)
    {
        case 0:
        case 2:
            for (r4 = 0; r4 < NELEMS(gUnknown_8479ED8); r4++)
            {
                if (gUnknown_8479ED8[r4].unk1 == facilityClass)
                    break;
            }
            if (r4 != NELEMS(gUnknown_8479ED8))
                r5 = gUnknown_8479ED8[r4].unk2;
            break;
        case 1:
            for (r4 = 0; r4 < NELEMS(gUnknown_847A024); r4++)
            {
                if (gUnknown_847A024[r4].unk2 == facilityClass)
                    break;
            }
            if (r4 != NELEMS(gUnknown_847A024))
            {
                if (VarGet(VAR_0x4003))
                    r5 = gUnknown_847A024[r4].unk4;
                else
                    r5 = gUnknown_847A024[r4].unk3;
            }
            break;
    }
    gUnknown_20370DC = gUnknown_20370DA;
    gUnknown_20370DA = r5;
}

void sub_815E114(void)
{
    SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
}

void sub_815E124(u8 taskId)
{
    if (BT_IsDone() == TRUE)
    {
        gMain.savedCallback = sub_815E114;
        CleanupOverworldWindowsAndTilemaps();
        SetMainCallback2(sub_800FD9C);
        DestroyTask(taskId);
    }
}

void sub_815E160(void)
{
    gBattleTypeFlags = BATTLE_TYPE_TRAINER | BATTLE_TYPE_FACTORY;
    if (gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_002 == 1)
        gBattleTypeFlags |= BATTLE_TYPE_DOUBLE;
    gTrainerBattleOpponent_A = 0;
    sub_815E9FC();
    CreateTask(sub_815E124, 1);
    PlayMapChosenOrBattleBGM(0);
    BT_StartOnField(sub_8080060());
}

void sub_815E1C0(void)
{
    if (!gSpecialVar_0x8005)
        gSpecialVar_Result = gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_002;
}

void sub_815E1F0(void)
{
    gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk8++;
}

void sub_815E218(void)
{
    u16 mapDataId = gMapHeader.mapDataId;
    if (mapDataId - 0x12A == gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk8 && mapDataId - 0x129 <= gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_001)
        gSpecialVar_Result = FALSE;
    else
        gSpecialVar_Result = TRUE;
}

void sub_815E28C(void)
{
    gSaveBlock1Ptr->unkArrayIdx = gSpecialVar_0x8005;
    if (gSaveBlock1Ptr->unkArrayIdx >= NELEMS(gSaveBlock1Ptr->unkArray))
        gSaveBlock1Ptr->unkArrayIdx = 0;
    sub_815EC0C();
    if (!sub_815D834())
        gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_5 = TRUE;
    else
        gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_5 = FALSE;
    gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk8 = 0;
    SetVBlankCounter1Ptr(&gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0);
    gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0 = 0;
    gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_2 = FALSE;
    gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_1 = FALSE;
}

void sub_815E394(void)
{
    DisableVBlankCounter1();
    gSpecialVar_Result = 0;
    if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_2)
        gSpecialVar_Result++;
    if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_0 && gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_1)
        gSpecialVar_Result++;
    gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_2 = TRUE;
}

void sub_815E408(void)
{
    u16 itemId = gUnknown_847A2B4[gUnknown_203F458->unk_0004.trainers->unk_003];
    if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_0)
        gSpecialVar_Result = 2;
    else if (AddBagItem(itemId, 1) == 1)
    {
        CopyItemName(itemId, gStringVar2);
        gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_0 = TRUE;
        gSpecialVar_Result = 0;
    }
    else
        gSpecialVar_Result = 1;
}

void sub_815E4B0(void)
{
    if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_1)
        gSpecialVar_Result = 2;
    else if (sub_815EDDC(&gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk4) > gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0)
    {
        sub_815EDF4(&gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk4, gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0);
        gSpecialVar_Result = 0;
    }
    else
        gSpecialVar_Result = 1;
    gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_1 = TRUE;
}

void sub_815E56C(void)
{
    if (!gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_2)
    {
        if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0 >= 215999)
            gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0 = 215999;
        else
            SetVBlankCounter1Ptr(&gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0);
    }
}

void sub_815E5C4(void)
{
    gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_3 = 1;
}

void sub_815E5F0(void)
{
    if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_3)
    {
        gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_3 = FALSE;
        gSpecialVar_Result = 0;
    }
    else if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_4)
    {
        gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_4 = FALSE;
        gSpecialVar_Result = 1;
    }
    else
    {
        gSpecialVar_Result = 2;
    }
}

#define PRINT_TOWER_TIME(src) ({                                                           \
    s32 minutes, seconds, centiseconds, frames;                                            \
                                                                                           \
    frames = (src);                                                                        \
                                                                                           \
    minutes = frames / 3600;                                                               \
    frames %= 3600;                                                                        \
    seconds = frames / 60;                                                                 \
    frames %= 60;                                                                          \
    centiseconds = frames * 168 / 100;                                                     \
                                                                                           \
    ConvertIntToDecimalStringN(gStringVar1, minutes, STR_CONV_MODE_RIGHT_ALIGN, 2);        \
    ConvertIntToDecimalStringN(gStringVar2, seconds, STR_CONV_MODE_RIGHT_ALIGN, 2);        \
    ConvertIntToDecimalStringN(gStringVar3, centiseconds, STR_CONV_MODE_LEADING_ZEROS, 2); \
})

void sub_815E658(void)
{
    if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0 >= 215999)
    {
        DisableVBlankCounter1();
        gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0 = 215999;
    }

    PRINT_TOWER_TIME(gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk0);
}

void sub_815E720(void)
{
    u8 windowId;
    s32 i;
    s32 minutes, seconds, centiseconds;

    sub_815EC0C();
    windowId = AddWindow(gUnknown_847A218);
    sub_80F6E9C();
    DrawStdWindowFrame(windowId, FALSE);
    AddTextPrinterParameterized(windowId, 2, gUnknown_83FE982, 0x4A, 0, 0xFF, NULL);

    for (i = 0; i < 4; i++)
    {
        PRINT_TOWER_TIME(sub_815EDDC(&gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk4));

        StringExpandPlaceholders(gStringVar4, gUnknown_83FE998);
        AddTextPrinterParameterized(windowId, 2, gUnknown_83FE9C4[i - 1], 0x18, 0x24 + 0x14 * i, 0xFF, NULL);
        AddTextPrinterParameterized(windowId, 2, gStringVar4, 0x60, 0x2E + 0x14 * i, 0xFF, NULL);
    }

    PutWindowTilemap(windowId);
    CopyWindowToVram(windowId, 3);
    VarSet(VAR_0x4001, windowId);
}

void sub_815E88C(void)
{
    u8 windowId = VarGet(VAR_0x4001);
    ClearStdWindowAndFrameToTransparent(windowId, TRUE);
    RemoveWindow(windowId);
}

void sub_815E8B4(void)
{
    gSpecialVar_Result = GetMonsStateToDoubles();
}

void sub_815E8CC(void)
{
    if (gUnknown_203F458->unk_0004.count != gUnknown_203F458->unk_0004.trainers[0].unk_001)
    {
        ConvertIntToDecimalStringN(gStringVar1, gUnknown_203F458->unk_0004.count, STR_CONV_MODE_LEFT_ALIGN, 1);
        gSpecialVar_Result = TRUE;
    }
    else
    {
        gSpecialVar_Result = FALSE;
    }
}

void sub_815E908(void)
{
    if (gMapHeader.mapDataId == 0x0129 && VarGet(VAR_0x4082) == 0)
    {
        gSpecialVar_Result = FALSE;
    }
    else
    {
        gSpecialVar_Result = FALSE;
    }
}

void sub_815E948(void)
{
    s32 i;
    u16 var_4001 = VarGet(VAR_0x4001);
    u8 r1 = gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[var_4001].unk_00B;

    for (i = 0; i < NELEMS(gUnknown_847A074); i++)
    {
        if (gUnknown_847A074[i].unk0 == gFacilityClassToTrainerClass[r1])
            break;
    }
    if (i != NELEMS(gUnknown_847A074))
    {
        var_4001 = gUnknown_847A074[i].unk1;
    }
    else
    {
        var_4001 = 0;
    }
    PlayNewMapMusic(gUnknown_847A2D2[var_4001]);
}

void sub_815E9C8(void)
{
    gSpecialVar_Result = gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_2;
}

void sub_815E9FC(void)
{
    u16 r4 = VarGet(VAR_0x4001);
    s32 r9 = GetPartyMaxLevel();
    u8 r5 = gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk8;
    s32 r6;
    u8 r2;

    ZeroEnemyPartyMons();

    switch (gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_002)
    {
        case 0:
        default:
            for (r6 = 0; r6 < 2; r6++)
            {
                r2 = gUnknown_847A2EE[r5][r6];
                gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[r4].unk_040[r2].level = r9;
                CreateBattleTowerMon(&gEnemyParty[r6], &gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[r4].unk_040[r2]);
            }
            break;
        case 1:
            r2 = gUnknown_847A2FE[r5][0];
            gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[0].unk_040[r2].level = r9;
            CreateBattleTowerMon(&gEnemyParty[0], &gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[0].unk_040[r2]);
            r2 = gUnknown_847A2FE[r5][1];
            gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[1].unk_040[r2].level = r9;
            CreateBattleTowerMon(&gEnemyParty[1], &gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[1].unk_040[r2]);
            break;
        case 2:
            r2 = gUnknown_847A30E[r5][r4];
            gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[r4].unk_040[r2].level = r9;
            CreateBattleTowerMon(&gEnemyParty[0], &gUnknown_203F458->unk_0004.trainers[gUnknown_203F458->unk_0000].unk_004[r4].unk_040[r2]);
            break;
    }
}

static s32 GetPartyMaxLevel(void)
{
    s32 topLevel = 0;
    s32 i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES, NULL) != 0 && GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL) != SPECIES_EGG)
        {
            s32 currLevel = GetMonData(&gPlayerParty[i], MON_DATA_LEVEL, NULL);
            if (currLevel > topLevel)
                topLevel = currLevel;
        }
    }

    return topLevel;
}

void sub_815EC0C(void)
{
    if (gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk9 != gUnknown_203F458->unk_0004.id)
    {
        gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk9 = gUnknown_203F458->unk_0004.id;
        sub_815EDF4(&gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unk4, 215999);
        gSaveBlock1Ptr->unkArray[gSaveBlock1Ptr->unkArrayIdx].unkA_0 = FALSE;
    }
}

void PrintTrainerTowerRecords(void)
{
    s32 i;
    u8 windowId = 0;

    sub_815DC8C();
    FillWindowPixelRect(0, 0, 0, 0, 0xd8, 0x90);
    sub_815EC0C();
    AddTextPrinterParameterized3(0, 2, 0x4a, 0, gUnknown_847A22C, 0, gUnknown_83FE982);

    for (i = 0; i < 4; i++)
    {
        PRINT_TOWER_TIME(sub_815EDDC(&gSaveBlock1Ptr->unkArray[i].unk4));
        StringExpandPlaceholders(gStringVar4, gUnknown_83FE998);
        AddTextPrinterParameterized3(windowId, 2, 0x18, 0x24 + 0x14 * i, gUnknown_847A22C, 0, gUnknown_83FE9C4[i]);
        AddTextPrinterParameterized3(windowId, 2, 0x60, 0x24 + 0x14 * i, gUnknown_847A22C, 0, gStringVar4);
    }

    PutWindowTilemap(windowId);
    CopyWindowToVram(windowId, 3);
    sub_815DD2C();
}

u32 sub_815EDDC(u32 * counter)
{
    return *counter ^ gSaveBlock2Ptr->encryptionKey;
}

void sub_815EDF4(u32 * counter, u32 value)
{
    *counter = value ^ gSaveBlock2Ptr->encryptionKey;
}

void sub_815EE0C(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        sub_815EDF4(&gSaveBlock1Ptr->unkArray[i].unk4, 215999);
    }
}
