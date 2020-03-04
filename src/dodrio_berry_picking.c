#include "global.h"
#include "gflib.h"
#include "link.h"
#include "minigame_countdown.h"
#include "strings.h"
#include "task.h"
#include "constants/songs.h"

struct DodrioSubstruct_0160
{
    /*0x0000 : 0x3000*/ u16 ALIGNED(4) tilemapBuffers[3][BG_SCREEN_SIZE];
    /*0x3000 : 0x3160*/ bool32 finished;
    /*0x3004 : 0x3164*/ u8 ALIGNED(4) unk3004;
    /*0x3008 : 0x3168*/ u8 ALIGNED(4) unk3008[10];
    /*0x3014 : 0x3174*/ u8 ALIGNED(4) state;
    /*0x3018 : 0x3178*/ u8 ALIGNED(4) unk3018;
    /*0x301C : 0x317C*/ u16 ALIGNED(4) unk301C;
    /*0x3020 : 0x3180*/ u8 ALIGNED(4) unk3020;
    /*0x3024 : 0x3184*/ u8 ALIGNED(4) unk3024;
    /*0x3024 : 0x3184*/ void (*unk3028)(void);
}; // size = 0x302C

struct DodrioStruct_2022CF4
{
    u8 filler_00[0xc];
    u8 unkC[10];
    s16 unk16[10];
    u16 unk2A[10];
    u16 unk3E;
}; // size = 0x40

struct DodrioSubstruct_31A0_14
{
    u8 unk0[11];
    u8 unkB[11];
};

struct DodrioSubstruct_31A0_2C
{
    u8 unk0;
    u8 ALIGNED(4) unk4;
    u8 ALIGNED(4) unk8;
};

struct DodrioSubstruct_31A0
{
    u8 name[0x10];
    u32 unk10;
    struct DodrioSubstruct_31A0_14 unk14;
    struct DodrioSubstruct_31A0_2C unk2C;
    u8 filler_35[4];
}; // size = 0x3C

struct DodrioSubstruct_318C
{
    bool8 isShiny;
};

struct DodrioSubstruct_3308
{
    u8 unk0;
    u32 unk4;
};

struct DodrioStruct
{
    /*0x0000*/ void (*savedCallback)(void);
    /*0x0004*/ u8 ALIGNED(4) unk04;
    /*0x0008*/ u8 ALIGNED(4) unk08;
    /*0x000C*/ u8 ALIGNED(4) unk0C;
    /*0x0010*/ u8 ALIGNED(4) unk10;
    /*0x0014*/ u8 ALIGNED(4) unk14;
    /*0x0018*/ u8 ALIGNED(4) unk18;
    /*0x001C*/ u8 ALIGNED(4) unk1C;
    /*0x0020*/ u8 ALIGNED(4) unk20;
    /*0x0024*/ u8 ALIGNED(4) unk24;
    /*0x0028*/ u8 ALIGNED(4) multiplayerId;
    /*0x0029*/ u8 filler_0029[7];
    /*0x0030*/ u8 ALIGNED(4) unk30;
    /*0x0034*/ u8 ALIGNED(4) unk34[5];
    /*0x003C*/ u8 ALIGNED(4) unk3C;
    /*0x0040*/ u8 ALIGNED(4) unk40;
    /*0x0044*/ u8 ALIGNED(4) unk44;
    /*0x0048*/ u8 ALIGNED(4) unk48;
    /*0x004A*/ u16 unk4A[5][6];
    /*0x0086*/ u16 unk86[5];
    /*0x0090*/ u8 ALIGNED(4) unk90[5];
    /*0x0098*/ u8 ALIGNED(4) unk98[4];
    /*0x009C*/ u8 ALIGNED(4) unk9C[11];
    /*0x00A8*/ u8 ALIGNED(4) unkA8[5];
    /*0x00B0*/ u8 ALIGNED(4) unkB0[5];
    /*0x00B8*/ u8 ALIGNED(4) unkB8[11];
    /*0x00C4*/ u8 ALIGNED(4) unkC4[11];
    /*0x00D0*/ u8 ALIGNED(4) unkD0[11];
    /*0x00DC*/ u8 ALIGNED(4) unkDC[11];
    /*0x00E8*/ u8 ALIGNED(4) unkE8[11];
    /*0x00F4*/ u8 ALIGNED(4) unkF4[11][2];
    /*0x010C*/ u8 ALIGNED(4) unk10C[5];
    /*0x0112*/ u16 unk112;
    /*0x0114*/ u16 unk114;
    /*0x0118*/ u32 unk118;
    /*0x011C*/ u32 unk11C;
    /*0x0120*/ u32 unk120;
    /*0x0124*/ u8 ALIGNED(4) unk124;
    /*0x0128*/ u8 ALIGNED(4) unk128;
    /*0x012C*/ u32 unk12C;
    /*0x0130*/ u32 unk130[5];
    /*0x0144*/ u8 ALIGNED(4) unk144;
    /*0x0148*/ u8 ALIGNED(4) unk148[11];
    /*0x0154*/ u8 ALIGNED(4) unk154;
    /*0x0158*/ u8 ALIGNED(4) unk158[5];
    /*0x0160*/ struct DodrioSubstruct_0160 unk160;
    /*0x318C*/ struct DodrioSubstruct_318C unk318C[5];
    /*0x31A0*/ struct DodrioSubstruct_31A0 unk31A0[5];
    /*0x32CC*/ struct DodrioSubstruct_31A0 unk32CC;
    /*0x3308*/ struct DodrioSubstruct_3308 unk3308[5];
}; // size = 0x3330

EWRAM_DATA struct DodrioStruct * gUnknown_203F3E0 = NULL;
EWRAM_DATA u16 *gUnknown_203F3E4[5] = {NULL};
EWRAM_DATA u16 *gUnknown_203F3F8[2] = {NULL};
EWRAM_DATA u16 *gUnknown_203F400[11] = {NULL};
EWRAM_DATA u16 *gUnknown_203F42C[4] = {NULL};
EWRAM_DATA struct DodrioStruct_2022CF4 *gUnknown_203F43C = NULL;
EWRAM_DATA struct DodrioSubstruct_0160 *gUnknown_203F440 = NULL;

IWRAM_DATA bool32 gUnknown_3002044;

bool32 sub_8155E68(void);
void sub_81508D8(void);
void sub_81508EC(struct DodrioStruct * dodrio);
void sub_8150A84(u8 taskId);
void sub_8150C78(void);
void sub_8150CBC(void);
void sub_8150CF4(void);
void sub_8150D7C(void);
void sub_8150DA4(void);
void sub_8150E68(void);
void sub_8150F40(void);
void sub_8150FC4(void);
void sub_8150FDC(void);
void sub_815109C(void);
void sub_8151198(void);
void sub_81512B4(void);
void sub_8151488(void);
void sub_81514F0(void);
void sub_815159C(void);
void sub_81516DC(u8 taskId);
void sub_8151750(u8 taskId);
void sub_8151B54(void);
void sub_8151BA0(void);
void sub_8151C5C(void);
void sub_8151D28(void);
void sub_8151D98(void);
void sub_8151E94(void);
void sub_815201C(void);
void sub_8152034(void);
void sub_8152048(struct DodrioSubstruct_318C * dodrioMon, struct Pokemon * partyMon);
void sub_815205C(TaskFunc func, u8 priority);
void sub_815206C(TaskFunc func);
void sub_8152090(u8 a0);
void sub_8152110(void);
void sub_815256C(void);
void sub_815293C(void);
void sub_8152970(void);
void sub_81529A4(u8 a0, u8 *a1, u8 *a2);
bool32 sub_8152A98(void);
bool32 sub_8152AD8(void);
void sub_8153004(void);
void sub_8153150(void);
u8 sub_815327C(u8);
void sub_8153A9C(void);
void sub_8153AFC(struct DodrioSubstruct_318C * unk318C, u8 a1, u8 a2, u8 a3);
void sub_8153BF8(u8 a0);
void sub_8153D80(bool8 a0, u8 a1);
void nullsub_97(struct Sprite *sprite);
void sub_8153E28(void);
void sub_8154128(void);
void sub_815417C(void);
void sub_81543E8(struct Sprite *sprite);
void sub_8154438(void);
void sub_8154968(struct DodrioSubstruct_0160 * unk0160);
void sub_81549D4(u8 a0);
void sub_8154A2C(void);
void sub_8154B34(void);
void sub_8154F80(void);
void sub_81556E0(void);
void sub_8155A78(void);
void sub_8155B4C(void);
void sub_8155C2C(void);
void sub_8155C80(void);
void unused_0(void);
void nullsub_98(void);

// const rom data

// Large chunk of data
const struct BgTemplate sUnknown_847565C_Unref_Dupe[] =
{
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0
    },
    {
        .bg = 1,
        .charBaseIndex = 2,
        .mapBaseIndex = 12,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0
    },
    {
        .bg = 2,
        .charBaseIndex = 2,
        .mapBaseIndex = 14,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0
    },
    {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0
    },
};

// Unknown unreferenced data, feel free to remove.
const u32 sUnused_Unref_Dupe[] = {255, 0};

const struct WindowTemplate sUnknown_8475674_Unref_Dupe[] =
{
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 28,
        .height = 3,
        .paletteNum = 13,
        .baseBlock = 0x13,
    },
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 6,
        .width = 28,
        .height = 13,
        .paletteNum = 13,
        .baseBlock = 0x67,
    }
};

const struct WindowTemplate sUnknown_8475684_Unref_Dupe =
{
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 6,
    .width = 28,
    .height = 7,
    .paletteNum = 13,
    .baseBlock = 0x67,
};

const struct WindowTemplate sUnknown_847568C_Unref_Dupe[] =
{
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 8,
        .width = 19,
        .height = 3,
        .paletteNum = 13,
        .baseBlock = 0x13,
    },
    {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 7,
        .width = 6,
        .height = 4,
        .paletteNum = 13,
        .baseBlock = 0x4C,
    }
};

const struct WindowTemplate sUnknown_847569C_Unref_Dupe =
{
    .bg = 0,
    .tilemapLeft = 4,
    .tilemapTop = 6,
    .width = 22,
    .height = 5,
    .paletteNum = 13,
    .baseBlock = 0x13,
};

const struct WindowTemplate sUnknown_84756A4_Unref_Dupe =
{
    .bg = 0,
    .tilemapLeft = 5,
    .tilemapTop = 8,
    .width = 19,
    .height = 3,
    .paletteNum = 13,
    .baseBlock = 0x13,
};

const u8 sUnknown_8471F50[5][5][11] =
{
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 3, 8, 9, 0},
        {0, 1, 2, 5, 6, 3, 4, 5, 8, 9, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 2, 9, 0},
        {0, 1, 4, 5, 6, 7, 2, 3, 4, 9, 0},
        {0, 1, 6, 7, 2, 3, 4, 5, 6, 9, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 1, 0},
        {0, 3, 4, 5, 6, 7, 8, 1, 2, 3, 0},
        {0, 5, 6, 7, 8, 1, 2, 3, 4, 5, 0},
        {0, 7, 8, 1, 2, 3, 4, 5, 6, 7, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0},
        {2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2},
        {4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4},
        {6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6},
        {8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8},
    },
};

const u8 sUnknown_8472063[5][5][3] =
{
    {
        {4, 5, 6},
    },
    {
        {3, 4, 5},
        {5, 6, 3},
    },
    {
        {4, 5, 6},
        {6, 7, 2},
        {2, 3, 4},
    },
    {
        {3, 4, 5},
        {5, 6, 7},
        {7, 8, 1},
        {1, 2, 3},
    },
    {
        {4, 5, 6},
        {6, 7, 8},
        {8, 9, 0},
        {0, 1, 2},
        {2, 3, 4},
    },
};

const u8 sUnknown_84720AE[5][5][3] =
{
    {
        {1, 0, 1},
    },
    {
        {1, 0, 1},
        {0, 1, 0},
    },
    {
        {2, 0, 1},
        {0, 1, 2},
        {1, 2, 0},
    },
    {
        {3, 0, 1},
        {0, 1, 2},
        {1, 2, 3},
        {2, 3, 0},
    },
    {
        {4, 0, 1},
        {0, 1, 2},
        {1, 2, 3},
        {2, 3, 4},
        {3, 4, 0},
    },
};

ALIGNED(4)
const u8 sUnknown_84720FC[5][11] =
{
    {9, 9, 9, 9, 1, 1, 1, 9, 9, 9, 9},
    {9, 9, 9, 0, 0, 1, 1, 0, 9, 9, 9},
    {9, 9, 2, 2, 0, 0, 1, 1, 1, 9, 9},
    {9, 3, 3, 0, 0, 1, 1, 2, 2, 3, 9},
    {3, 3, 4, 4, 0, 0, 1, 1, 2, 2, 3},
};

const u8 sUnknown_8472133[5][5] =
{
    {5},
    {4, 6},
    {3, 5, 7},
    {2, 4, 6, 8},
    {1, 3, 5, 6, 9},
};

// Duplicate and unused gfx. Feel free to remove.
const u32 sDuplicateGfx[] = INCBIN_U32("graphics/link_games/dodrioberry_bg1.gbapal",
                                     "graphics/link_games/dodrioberry_bg2.gbapal",
                                     "graphics/link_games/dodrioberry_pkmn.gbapal",
                                     "graphics/link_games/dodrioberry_shiny.gbapal",
                                     "graphics/link_games/dodrioberry_status.gbapal",
                                     "graphics/link_games/dodrioberry_berrysprites.gbapal",
                                     "graphics/link_games/dodrioberry_berrysprites.4bpp.lz",
                                     "graphics/link_games/dodrioberry_platform.gbapal",
                                     "graphics/link_games/dodrioberry_bg1.4bpp.lz",
                                     "graphics/link_games/dodrioberry_bg2.4bpp.lz",
                                     "graphics/link_games/dodrioberry_status.4bpp.lz",
                                     "graphics/link_games/dodrioberry_platform.4bpp.lz",
                                     "graphics/link_games/dodrioberry_pkmn.4bpp.lz",
                                     "graphics/link_games/dodrioberry_bg1.bin.lz",
                                     "graphics/link_games/dodrioberry_bg2right.bin.lz",
                                     "graphics/link_games/dodrioberry_bg2left.bin.lz");

const u8 sUnknown_847553C[][3] =
{
    {40, 24, 13},
    {32, 19, 10},
    {22, 13, 7},
};

ALIGNED(4)
const u8 sUnknown_8475548[] = {8, 5, 8, 11, 15};

ALIGNED(4)
const u8 sUnknown_8475550[] = {5, 10, 20, 30, 50, 70, 100};

ALIGNED(4)
const u8 sUnknown_8475558[][10] =
{
    {15, 16, 17, 18, 19, 19, 18, 17, 16, 15},
    {20, 21, 22, 23, 24, 25, 26, 27, 28, 29},
    {30, 31, 32, 33, 34, 34, 33, 32, 31, 30},
};

void (*const sUnknown_8475578[])(void) =
{
    sub_8150C78,
    sub_8150CBC,
    sub_8150CF4,
    sub_8150D7C,
    sub_8150DA4,
    sub_8150FDC,
    sub_8151198,
    sub_81512B4,
    sub_8151488,
    sub_81514F0,
    sub_815159C,
    sub_8150F40
};

void (*const sUnknown_84755A8[])(void) =
{
    sub_8150C78,
    sub_8150CBC,
    sub_8150CF4,
    sub_8150D7C,
    sub_8150E68,
    sub_815109C,
    sub_8151198,
    sub_81512B4,
    sub_8151488,
    sub_81514F0,
    sub_815159C,
    sub_8150FC4
};

void StartDodrioBerryPicking(u16 a0, MainCallback callback)
{
    gUnknown_3002044 = FALSE;

    if (gReceivedRemoteLinkPlayers != 0 && (gUnknown_203F3E0 = AllocZeroed(sizeof(*gUnknown_203F3E0))) != NULL)
    {
        sub_81508D8();
        sub_81508EC(gUnknown_203F3E0);
        gUnknown_203F3E0->savedCallback = callback;
        gUnknown_203F3E0->multiplayerId = GetMultiplayerId();
        gUnknown_203F3E0->unk32CC = gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId];
        sub_8152048(&gUnknown_203F3E0->unk318C[gUnknown_203F3E0->multiplayerId], &gPlayerParty[a0]);
        CreateTask(sub_8150A84, 1);
        SetMainCallback2(sub_815201C);
        sub_8153150();
        sub_81529A4(gUnknown_203F3E0->unk24, &gUnknown_203F3E0->unk44, &gUnknown_203F3E0->unk48);
        StopMapMusic();
        PlayNewMapMusic(MUS_KINOMIKUI);
    }
    else
    {
        SetMainCallback2(callback);
        return;
    }
}

void sub_81508D8(void)
{
    ResetTasks();
    ResetSpriteData();
    FreeAllSpritePalettes();
}

void sub_81508EC(struct DodrioStruct * data)
{
    u8 i;

    data->unk0C = 0;
    data->unk10 = 0;
    data->unk14 = 0;
    data->unk18 = 0;
    data->unk1C = 0;
    data->unk11C = 0;
    data->unk120 = 0;
    data->unk30 = 0;
    data->unk40 = 0;
    data->unk3C = 0;
    data->unk12C = 0;

    for (i = 0; i < 4; i++)
    {
        data->unk98[i] = 0;
    }

    for (i = 0; i < 5; i++)
    {
        data->unkA8[i] = 0;
        data->unkB0[i] = 0;
        data->unk4A[i][0] = 0;
        data->unk4A[i][1] = 0;
        data->unk4A[i][2] = 0;
        data->unk4A[i][3] = 0;
        data->unk4A[i][5] = 0;
        data->unk10C[i] = 0;
        data->unk130[i] = 0;
    }

    for (i = 0; i < 11; i++)
    {
        data->unkD0[i] = 0;
        data->unkDC[i] = 0;
        data->unkC4[i] = 0;
        data->unkF4[i][0] = 0xFF;
        data->unkF4[i][1] = 0xFF;
    }

    data->unk20 = GetMultiplayerId() == 0 ? 1 : 0;
    data->unk24 = GetLinkPlayerCount();
    data->unk34[0] = GetMultiplayerId();
    for (i = 1; i < data->unk24; i++)
    {
        data->unk34[i] = data->unk34[i - 1] + 1;
        if (data->unk34[i] > data->unk24 - 1)
            data->unk34[i] %= data->unk24;
    }
}

void sub_8150A84(u8 taskId)
{
    u8 r4, r5;

    switch (gUnknown_203F3E0->unk0C)
    {
    case 0:
        SetVBlankCallback(NULL);
        sub_815205C(sub_8151750, 4);
        gUnknown_203F3E0->unk0C++;
        break;
    case 1:
        if (!FuncIsActiveTask(sub_8151750))
        {
            sub_8154968(&gUnknown_203F3E0->unk160);
            gUnknown_203F3E0->unk0C++;
        }
        break;
    case 2:
        if (!sub_8155E68())
        {
            LinkRfu_SetRfuFuncToSend6600();
            gUnknown_203F3E0->unk0C++;
        }
        break;
    case 3:
        if (IsLinkTaskFinished())
        {
            if (gReceivedRemoteLinkPlayers != 0)
            {
                LoadWirelessStatusIndicatorSpriteGfx();
                CreateWirelessStatusIndicatorSprite(0, 0);
            }
            gUnknown_203F3E0->unk0C++;
        }
        break;
    case 4:
        r5 = gUnknown_203F3E0->unk24;
        sub_8153A9C();
        for (r4 = 0; r4 < r5; r4++)
        {
            sub_8153AFC(&gUnknown_203F3E0->unk318C[gUnknown_203F3E0->unk34[r4]], r4, gUnknown_203F3E0->unk34[r4], gUnknown_203F3E0->unk24);
        }
        sub_8153D80(FALSE, gUnknown_203F3E0->unk24);
        gUnknown_203F3E0->unk0C++;
        break;
    case 5:
        sub_8154128();
        sub_815417C();
        sub_8154438();
        sub_8153E28();
        gUnknown_203F3E0->unk0C++;
        break;
    case 6:
        BlendPalettes(0xFFFFFFFF, 0x10, 0x00);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
        SetVBlankCallback(sub_8152034);
        gUnknown_203F3E0->unk0C++;
        break;
    case 7:
        UpdatePaletteFade();
        if (!gPaletteFade.active)
        {
            gUnknown_203F3E0->unk0C++;
        }
        break;
    default:
        DestroyTask(taskId);
        sub_815206C(sub_81516DC);
        break;
    }
}

void sub_8150C08(u8 taskId)
{
    sub_8151B54();
    sUnknown_8475578[gUnknown_203F3E0->unk18]();
    if (!gUnknown_3002044)
    {
        sub_815293C();
    }
    sub_8151BA0();
}

void sub_8150C40(u8 taskId)
{
    sub_8151C5C();
    sUnknown_84755A8[gUnknown_203F3E0->unk18]();
    if (!gUnknown_3002044)
    {
        sub_8152970();
    }
    sub_8151D28();
}

void sub_8150C78(void)
{
    switch (gUnknown_203F3E0->unk10)
    {
    case 0:
        sub_8153BF8(1);
        sub_81549D4(1);
        gUnknown_203F3E0->unk10++;
        break;
    case 1:
        if (!sub_8155E68())
            sub_8152090(1);
        break;
    }
}

void sub_8150CBC(void)
{
    if (gUnknown_203F3E0->unk10 == 0)
    {
        sub_8152110();
        gUnknown_203F3E0->unk10++;
    }
    else
    {
        gUnknown_203F3E0->unk118 = 1;
        sub_8152090(2);
    }
}

void sub_8150CF4(void)
{
    switch (gUnknown_203F3E0->unk10)
    {
    case 0:
        StartMinigameCountdown(7, 8, 120, 80, 0);
        gUnknown_203F3E0->unk10++;
        break;
    case 1:
        LinkRfu_SetRfuFuncToSend6600();
        gUnknown_203F3E0->unk10++;
        break;
    case 2:
        if (IsLinkTaskFinished())
        {
            gUnknown_203F3E0->unk10++;
        }
        break;
    case 3:
        if (!IsMinigameCountdownRunning())
        {
            LinkRfu_SetRfuFuncToSend6600();
            gUnknown_203F3E0->unk10++;
        }
        break;
    case 4:
        if (IsLinkTaskFinished())
        {
            sub_8152090(3);
        }
        break;
    }
}

void sub_8150D7C(void)
{
    if (gUnknown_203F3E0->unk10 == 0)
    {
        if (gUnknown_203F3E0->unk11C != 0)
        {
            sub_8152090(4);
        }
    }
}

void sub_8150DA4(void)
{
    if (gUnknown_203F3E0->unk10 == 0)
    {
        if (gUnknown_203F3E0->unk40 < 10)
        {
            if (gUnknown_203F3E0->unkA8[0] == 0)
            {
                if (JOY_NEW(DPAD_UP))
                {
                    if (gUnknown_203F3E0->unk31A0[0].unk2C.unk0 == 0)
                    {
                        gUnknown_203F3E0->unk31A0[0].unk2C.unk4 = 0;
                        gUnknown_203F3E0->unk31A0[0].unk2C.unk0 = sub_815327C(2);
                    }
                }
                else if (JOY_NEW(DPAD_RIGHT))
                {
                    if (gUnknown_203F3E0->unk31A0[0].unk2C.unk0 == 0)
                    {
                        gUnknown_203F3E0->unk31A0[0].unk2C.unk4 = 0;
                        gUnknown_203F3E0->unk31A0[0].unk2C.unk0 = sub_815327C(1);
                    }
                }
                else if (JOY_NEW(DPAD_LEFT))
                {
                    if (gUnknown_203F3E0->unk31A0[0].unk2C.unk0 == 0)
                    {
                        gUnknown_203F3E0->unk31A0[0].unk2C.unk4 = 0;
                        gUnknown_203F3E0->unk31A0[0].unk2C.unk0 = sub_815327C(3);
                    }
                }
                else
                {
                    gUnknown_203F3E0->unk31A0[0].unk2C.unk0 = sub_815327C(0);
                }
            }
        }
        else
        {
            sub_8152090(11);
        }
        sub_815256C();
        sub_8151D98();
    }
}
void sub_8150E68(void)
{
    if (gUnknown_203F3E0->unk40 < 10)
    {
        if (JOY_NEW(DPAD_UP))
        {
            if (gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk0 == 0)
            {
                gUnknown_203F3E0->unk32CC.unk2C.unk0 = 2;
            }
        }
        else if (JOY_NEW(DPAD_RIGHT))
        {
            if (gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk0 == 0)
            {
                gUnknown_203F3E0->unk32CC.unk2C.unk0 = 1;
            }
        }
        else if (JOY_NEW(DPAD_LEFT))
        {
            if (gUnknown_203F3E0->unk31A0[gUnknown_203F3E0->multiplayerId].unk2C.unk0 == 0)
            {
                gUnknown_203F3E0->unk32CC.unk2C.unk0 = 3;
            }
        }
        else
        {
            gUnknown_203F3E0->unk32CC.unk2C.unk0 = 0;
        }
    }
    else
    {
        sub_8152090(11);
    }
    sub_8151E94();
}

void sub_8150F40(void)
{
    u8 i;

    sub_815256C();
    sub_8151D98();
    if (sub_8152A98() == 1)
    {
        sub_8153004();
        sub_8152090(5);
    }
    else
    {
        gUnknown_203F3E0->unk12C = 1;
        for (i = 1; i < gUnknown_203F3E0->unk24; i++)
        {
            if (gUnknown_203F3E0->unk130[i] != 1)
            {
                gUnknown_203F3E0->unk12C = 0;
                break;
            }
        }
    }
}

void sub_8150FC4(void)
{
    sub_8151E94();
    if (sub_8152AD8() == 1)
        sub_8152090(5);
}

void sub_8150FDC(void)
{
    u8 blockReceivedStatus;
    u8 i;
    switch (gUnknown_203F3E0->unk10)
    {
    case 0:
        SendBlock(0, gUnknown_203F3E0->unk4A, sizeof(gUnknown_203F3E0->unk4A));
        gUnknown_203F3E0->unk08 = 0;
        gUnknown_203F3E0->unk10++;
        break;
    case 1:
        if (IsLinkTaskFinished())
        {
            gUnknown_203F3E0->unk10++;
        }
        break;
    case 2:
        blockReceivedStatus = GetBlockReceivedStatus();
        for (i = 0; i < gUnknown_203F3E0->unk24; blockReceivedStatus >>= 1, i++)
        {
            if (blockReceivedStatus & 1)
            {
                ResetBlockReceivedFlag(i);
                gUnknown_203F3E0->unk08++;
            }
        }
        if (gUnknown_203F3E0->unk08 >= gUnknown_203F3E0->unk24)
        {
            gUnknown_203F3E0->unk14++;
            gUnknown_203F3E0->unk10++;
        }
        break;
    default:
        if (WaitFanfare(TRUE))
        {
            sub_8152090(6);
            FadeOutAndPlayNewMapMusic(MUS_WIN_YASEI, 4);
        }
        break;
    }
}

const s16 sUnknown_84755D8[] = {10, 30, 50, 50};

// Data related to printing saved results.
const struct WindowTemplate sUnknown_84755E0 =
{
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 1,
    .width = 28,
    .height = 11,
    .paletteNum = 15,
    .baseBlock = 1,
};

const u8 *const sUnknown_84755E8[] = {gText_BerryPickingRecords, gText_BerriesPicked, gText_BestScore, gText_BerriesInRowFivePlayers};
const u8 sUnknown_84755F8[] = {4, 7, 4};

ALIGNED(4)
const u8 sUnknown_84755FC[][2] = {{24}, {40}, {56}};
const u8 sUnknown_8475602[][2] = {{24}, {40}, {70}};

// Debug functions?
const u16 sUnknown_8475608[][4] =
{
    {9999, 0, 90, 9999},
    {9999, 9999, 70, 9999},
    {9999, 0, 9999, 0},
    {9999, 9999, 60, 0},
    {9999, 9999, 9999, 0},
};

const u8 sUnknown_8475630[] = _("あいうえおかき");
const u8 sUnknown_8475638[] = _("ABCDEFG");
const u8 sUnknown_8475640[] = _("0123456");

const u8 *const sUnknown_8475648[] =
{
    sUnknown_8475630,
    sUnknown_8475630,
    sUnknown_8475630,
    sUnknown_8475638,
    sUnknown_8475640
};

// Large chunk of data
const struct BgTemplate sUnknown_847565C[] =
{
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0
    },
    {
        .bg = 1,
        .charBaseIndex = 2,
        .mapBaseIndex = 12,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0
    },
    {
        .bg = 2,
        .charBaseIndex = 2,
        .mapBaseIndex = 14,
        .screenSize = 1,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0
    },
    {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0
    },
};

// Unknown unreferenced data, feel free to remove.
const u32 sUnused[] = {255, 0};

const struct WindowTemplate sUnknown_8475674[] =
{
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 1,
        .width = 28,
        .height = 3,
        .paletteNum = 13,
        .baseBlock = 0x13,
    },
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 6,
        .width = 28,
        .height = 13,
        .paletteNum = 13,
        .baseBlock = 0x67,
    }
};

const struct WindowTemplate sUnknown_8475684 =
{
    .bg = 0,
    .tilemapLeft = 1,
    .tilemapTop = 6,
    .width = 28,
    .height = 7,
    .paletteNum = 13,
    .baseBlock = 0x67,
};

const struct WindowTemplate sUnknown_847568C[] =
{
    {
        .bg = 0,
        .tilemapLeft = 1,
        .tilemapTop = 8,
        .width = 19,
        .height = 3,
        .paletteNum = 13,
        .baseBlock = 0x13,
    },
    {
        .bg = 0,
        .tilemapLeft = 22,
        .tilemapTop = 7,
        .width = 6,
        .height = 4,
        .paletteNum = 13,
        .baseBlock = 0x4C,
    }
};

const struct WindowTemplate sUnknown_847569C =
{
    .bg = 0,
    .tilemapLeft = 4,
    .tilemapTop = 6,
    .width = 22,
    .height = 5,
    .paletteNum = 13,
    .baseBlock = 0x13,
};

const struct WindowTemplate sUnknown_84756A4 =
{
    .bg = 0,
    .tilemapLeft = 5,
    .tilemapTop = 8,
    .width = 19,
    .height = 3,
    .paletteNum = 13,
    .baseBlock = 0x13,
};

// This is an unused copy of the tables from the top of the file. Feel free to remove.
const u8 sUnknown_8471F50_UnrefDup[5][5][11] =
{
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 3, 8, 9, 0},
        {0, 1, 2, 5, 6, 3, 4, 5, 8, 9, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 2, 9, 0},
        {0, 1, 4, 5, 6, 7, 2, 3, 4, 9, 0},
        {0, 1, 6, 7, 2, 3, 4, 5, 6, 9, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 1, 0},
        {0, 3, 4, 5, 6, 7, 8, 1, 2, 3, 0},
        {0, 5, 6, 7, 8, 1, 2, 3, 4, 5, 0},
        {0, 7, 8, 1, 2, 3, 4, 5, 6, 7, 0},
    },
    {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0},
        {2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2},
        {4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4},
        {6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6},
        {8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8},
    },
};

const u8 sUnknown_8472063_UnrefDup[5][5][3] =
{
    {
        {4, 5, 6},
    },
    {
        {3, 4, 5},
        {5, 6, 3},
    },
    {
        {4, 5, 6},
        {6, 7, 2},
        {2, 3, 4},
    },
    {
        {3, 4, 5},
        {5, 6, 7},
        {7, 8, 1},
        {1, 2, 3},
    },
    {
        {4, 5, 6},
        {6, 7, 8},
        {8, 9, 0},
        {0, 1, 2},
        {2, 3, 4},
    },
};

const u8 sUnknown_84720AE_UnrefDup[5][5][3] =
{
    {
        {1, 0, 1},
    },
    {
        {1, 0, 1},
        {0, 1, 0},
    },
    {
        {2, 0, 1},
        {0, 1, 2},
        {1, 2, 0},
    },
    {
        {3, 0, 1},
        {0, 1, 2},
        {1, 2, 3},
        {2, 3, 0},
    },
    {
        {4, 0, 1},
        {0, 1, 2},
        {1, 2, 3},
        {2, 3, 4},
        {3, 4, 0},
    },
};

ALIGNED(4)
const u8 sUnknown_84720FC_UnrefDup[5][11] =
{
    {9, 9, 9, 9, 1, 1, 1, 9, 9, 9, 9},
    {9, 9, 9, 0, 0, 1, 1, 0, 9, 9, 9},
    {9, 9, 2, 2, 0, 0, 1, 1, 1, 9, 9},
    {9, 3, 3, 0, 0, 1, 1, 2, 2, 3, 9},
    {3, 3, 4, 4, 0, 0, 1, 1, 2, 2, 3},
};

const u8 sUnknown_8472133_UnrefDup[5][5] =
{
    {5},
    {4, 6},
    {3, 5, 7},
    {2, 4, 6, 8},
    {1, 3, 5, 6, 9},
};

const u16 sDodrioBerryBgPal1[] = INCBIN_U16("graphics/link_games/dodrioberry_bg1.gbapal",
                                            "graphics/link_games/dodrioberry_bg2.gbapal");
const u16 sDodrioBerryPkmnPal[] = INCBIN_U16("graphics/link_games/dodrioberry_pkmn.gbapal");
const u16 sDodrioBerryShinyPal[] = INCBIN_U16("graphics/link_games/dodrioberry_shiny.gbapal");
const u16 sDodrioBerryStatusPal[] = INCBIN_U16("graphics/link_games/dodrioberry_status.gbapal");
const u16 sDodrioBerrySpritesPal[] = INCBIN_U16("graphics/link_games/dodrioberry_berrysprites.gbapal");
const u32 sDodrioBerrySpritesGfx[] = INCBIN_U32("graphics/link_games/dodrioberry_berrysprites.4bpp.lz");
const u16 sDodrioBerryPlatformPal[] = INCBIN_U16("graphics/link_games/dodrioberry_platform.gbapal");
const u32 sDodrioBerryBgGfx1[] = INCBIN_U32("graphics/link_games/dodrioberry_bg1.4bpp.lz");
const u32 sDodrioBerryBgGfx2[] = INCBIN_U32("graphics/link_games/dodrioberry_bg2.4bpp.lz");
const u32 sDodrioBerryStatusGfx[] = INCBIN_U32("graphics/link_games/dodrioberry_status.4bpp.lz");
const u32 sDodrioBerryPlatformGfx[] = INCBIN_U32("graphics/link_games/dodrioberry_platform.4bpp.lz");
const u32 sDodrioBerryPkmnGfx[] = INCBIN_U32("graphics/link_games/dodrioberry_pkmn.4bpp.lz");
const u32 sDodrioBerryBgTilemap1[] = INCBIN_U32("graphics/link_games/dodrioberry_bg1.bin.lz");
const u32 sDodrioBerryBgTilemap2Right[] = INCBIN_U32("graphics/link_games/dodrioberry_bg2right.bin.lz");
const u32 sDodrioBerryBgTilemap2Left[] = INCBIN_U32("graphics/link_games/dodrioberry_bg2left.bin.lz");

const struct OamData sOamData_8478C98 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0
};

const struct OamData sOamData_8478CA0 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0
};

const struct OamData sOamData_8478CA8 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0
};

const struct OamData sOamData_8478CB0 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x32),
    .tileNum = 0,
    .priority = 3,
    .paletteNum = 0,
    .affineParam = 0
};

const union AnimCmd sSpriteAnim_8478CB8[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478CC0[] =
{
    ANIMCMD_FRAME(64, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478CC8[] =
{
    ANIMCMD_FRAME(128, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478CD0[] =
{
    ANIMCMD_FRAME(192, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478CD8[] =
{
    ANIMCMD_FRAME(256, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const sSpriteAnimTable_8478CE0[] =
{
    sSpriteAnim_8478CB8,
    sSpriteAnim_8478CC0,
    sSpriteAnim_8478CC8,
    sSpriteAnim_8478CD0,
    sSpriteAnim_8478CD8
};

const union AnimCmd sSpriteAnim_8478CF4[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478CFC[] =
{
    ANIMCMD_FRAME(4, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D04[] =
{
    ANIMCMD_FRAME(8, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const sSpriteAnimTable_8478D0C[] =
{
    sSpriteAnim_8478CF4,
    sSpriteAnim_8478CFC,
    sSpriteAnim_8478D04
};

const union AnimCmd sSpriteAnim_8478D18[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D20[] =
{
    ANIMCMD_FRAME(4, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D28[] =
{
    ANIMCMD_FRAME(8, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D30[] =
{
    ANIMCMD_FRAME(12, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D38[] =
{
    ANIMCMD_FRAME(16, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D40[] =
{
    ANIMCMD_FRAME(20, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D48[] =
{
    ANIMCMD_FRAME(24, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D50[] =
{
    ANIMCMD_FRAME(28, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D58[] =
{
    ANIMCMD_FRAME(32, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const sSpriteAnimTable_8478D60[] =
{
    sSpriteAnim_8478D18,
    sSpriteAnim_8478D20,
    sSpriteAnim_8478D28,
    sSpriteAnim_8478D30,
    sSpriteAnim_8478D38,
    sSpriteAnim_8478D40,
    sSpriteAnim_8478D48,
    sSpriteAnim_8478D50,
    sSpriteAnim_8478D58
};

const union AnimCmd sSpriteAnim_8478D84[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const sSpriteAnimTable_8478D8C[] =
{
    sSpriteAnim_8478D84
};

// These are declared inside pokeemerald's sub_8153A9C
const struct SpritePalette gUnknown_8478D90 = {sDodrioBerryPkmnPal, 0};
const struct SpritePalette gUnknown_8478D98 = {sDodrioBerryShinyPal, 1};

// These are declared inside pokeemerald's sub_8153E28
const struct SpritePalette gUnknown_8478DA0 = {sDodrioBerryStatusPal, 2};
const struct SpriteTemplate gUnknown_8478DA8 =
        {
            .tileTag = 1,
            .paletteTag = 2,
            .oam = &sOamData_8478CA0,
            .anims = sSpriteAnimTable_8478D0C,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = nullsub_97,
        };

// Unknown unused data, feel free to remove.
const u8 sUnused2[] = {0xCD, 0x37, 0x38, 0x39, 0x3A, 0x3B, 0x3C, 0x3D, 0x3E, 0xF4, 0x0, 0x0};

// This is declared inside pokeemerald's sub_8154128
const struct SpritePalette gUnknown_8478DCC = {sDodrioBerrySpritesPal, 3};

const s16 sUnknown_8478DD4[] = {88, 128, 168, 208};

// These are declared inside pokeemerald's sub_815417C
const struct SpriteTemplate gUnknown_8478DDC =
    {
        .tileTag = 2,
        .paletteTag = 3,
        .oam = &sOamData_8478CA8,
        .anims = sSpriteAnimTable_8478D60,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    };
const struct SpriteTemplate gUnknown_8478DF4 =
    {
        .tileTag = 2,
        .paletteTag = 3,
        .oam = &sOamData_8478CA0,
        .anims = sSpriteAnimTable_8478D60,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    };

// This is declared inside pokeemerald's sub_8028CF4
const u8 gUnknown_8478E0C[] = {30, 20};

const s16 gUnknown_8478E0E[][2] = {{230, 55}, {30, 74}};

// These are declared inside pokeemerald's sub_8154438
const struct SpritePalette gUnknown_8478E18 = {sDodrioBerryPlatformPal, 6};
const struct SpriteTemplate gUnknown_8478E20 =
    {
        .tileTag = 5,
        .paletteTag = 6,
        .oam = &sOamData_8478CB0,
        .anims = sSpriteAnimTable_8478D8C,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_81543E8,
    };

struct WinCoords
{
    u8 left;
    u8 top;
};

const u8 sUnknown_8478E38[][3] =
{
    {1, 2, 3},
    {1, 4, 5},
    {1, 8, 9},
    {1, 6, 7},
};

const struct WinCoords sUnknown_8478E44[] = {{12, 6}};
const struct WinCoords sUnknown_8478E48[] = {{9, 10}, {15, 6}};
const struct WinCoords sUnknown_8478E50[] = {{12, 6}, {18, 10}, {6, 10}};
const struct WinCoords sUnknown_8478E5C[] = {{9, 10}, {15, 6}, {21, 10}, {3, 6}};
const struct WinCoords sUnknown_8478E6C[] = {{12, 6}, {18, 10}, {23, 6}, {1, 6}, {6, 10}};

const struct WinCoords *const sUnknown_8478E80[] =
{
    sUnknown_8478E44,
    sUnknown_8478E48,
    sUnknown_8478E50,
    sUnknown_8478E5C,
    sUnknown_8478E6C,
};

const u8 *const sUnknown_8478E94[] =
{
    gText_1Colon,
    gText_2Colon,
    gText_3Colon,
    gText_4Colon,
    gText_5Colon,
};

const u16 sUnknown_8478EA8[] = {92, 132, 172, 212};
const u16 sUnknown_8478EB0[] = {30, 45, 60, 75, 90};
const u16 sUnknown_8478EBA[] = {12, 28, 44, 60, 76};

struct
{
    u8 id;
    void (*func)(void);
} const gUnknown_8478EC4[] =
{
    {0, sub_8154A2C},
    {1, sub_8154B34},
    {2, sub_8154F80},
    {3, sub_81556E0},
    {4, sub_8155A78},
    {5, sub_8155B4C},
    {6, sub_8155C2C},
    {7, sub_8155C80},
    {8, unused_0},
    {9, nullsub_98},
};

// This is declared inside pokeemerald's sub_80296A8
const u8 gUnknown_8478F14[5] = {0, 1, 2, 3, 4};
