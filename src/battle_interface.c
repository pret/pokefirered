#include "global.h"
#include "gflib.h"
#include "battle_anim.h"
#include "battle_interface.h"
#include "battle_message.h"
#include "decompress.h"
#include "graphics.h"
#include "menu.h"
#include "pokedex.h"
#include "pokemon_summary_screen.h"
#include "safari_zone.h"
#include "constants/songs.h"

#undef abs
#define abs(a) ((a) < 0 ? -(a) : (a))

struct TestingBar
{
    s32 maxValue;
    s32 oldValue;
    s32 receivedValue;
    u32 pal:5;
    u32 tileOffset;
};

// These are used as indexes for each "section of tiles" in gBattleInterface_Gfx
#define B_INTERFACE_GFX_TRANSPARENT             0
#define B_INTERFACE_GFX_HP_BAR_HP_TEXT          1
#define B_INTERFACE_GFX_HP_BAR_GREEN            3
#define B_INTERFACE_GFX_EXP_BAR                 12
#define B_INTERFACE_GFX_STATUS_PSN_BATTLER0     21 // BATTLER0: B_POSITION_PLAYER_LEFT
#define B_INTERFACE_GFX_STATUS_PAR_BATTLER0     24
#define B_INTERFACE_GFX_STATUS_SLP_BATTLER0     27
#define B_INTERFACE_GFX_STATUS_FRZ_BATTLER0     30
#define B_INTERFACE_GFX_STATUS_BRN_BATTLER0     33
// tiles 36 through 38 are unused
#define B_INTERFACE_GFX_STATUS_NONE             39
// tiles 40 through 42 are unused
#define B_INTERFACE_GFX_SAFARI_HEALTHBOX_0      43
#define B_INTERFACE_GFX_SAFARI_HEALTHBOX_1      44
#define B_INTERFACE_GFX_SAFARI_HEALTHBOX_2      45
// tile 46 is unused
#define B_INTERFACE_GFX_HP_BAR_YELLOW           47
#define B_INTERFACE_GFX_HP_BAR_RED              56
#define B_INTERFACE_GFX_HP_BAR_LEFT_BORDER      65 // Used in place of the HP text graphic if the pokemon is statused
#define B_INTERFACE_GFX_BALL_PARTY_SUMMARY      66
#define B_INTERFACE_GFX_BALL_CAUGHT             70
#define B_INTERFACE_GFX_STATUS_PSN_BATTLER1     71 // BATTLER1: B_POSITION_OPPONENT_LEFT
#define B_INTERFACE_GFX_STATUS_PAR_BATTLER1     74
#define B_INTERFACE_GFX_STATUS_SLP_BATTLER1     77
#define B_INTERFACE_GFX_STATUS_FRZ_BATTLER1     80
#define B_INTERFACE_GFX_STATUS_BRN_BATTLER1     83
#define B_INTERFACE_GFX_STATUS_PSN_BATTLER2     86 // BATTLER2: B_POSITION_PLAYER_RIGHT
#define B_INTERFACE_GFX_STATUS_PAR_BATTLER2     89
#define B_INTERFACE_GFX_STATUS_SLP_BATTLER2     92
#define B_INTERFACE_GFX_STATUS_FRZ_BATTLER2     95
#define B_INTERFACE_GFX_STATUS_BRN_BATTLER2     98
#define B_INTERFACE_GFX_STATUS_PSN_BATTLER3     101 // BATTLER3: B_POSITION_OPPONENT_RIGHT
#define B_INTERFACE_GFX_STATUS_PAR_BATTLER3     104
#define B_INTERFACE_GFX_STATUS_SLP_BATTLER3     107
#define B_INTERFACE_GFX_STATUS_FRZ_BATTLER3     110
#define B_INTERFACE_GFX_STATUS_BRN_BATTLER3     113
#define B_INTERFACE_GFX_BOTTOM_RIGHT_CORNER_HP_AS_TEXT 116 // Used in the player's
#define B_INTERFACE_GFX_BOTTOM_RIGHT_CORNER_HP_AS_BAR  117 // healthbox in double battles


static void SpriteCB_HealthBoxOther(struct Sprite *sprite);
static void SpriteCB_HealthBar(struct Sprite *sprite);
static const u8 *GetBattleInterfaceGfxPtr(u8 which);
static void UpdateHpTextInHealthboxInDoubles(u8 healthboxSpriteId, s16 value, u8 maxOrCurrent);
static void Task_HidePartyStatusSummary_BattleStart_1(u8 taskId);
static void Task_HidePartyStatusSummary_BattleStart_2(u8 taskId);
static void SpriteCB_PartySummaryBar_Exit(struct Sprite *sprite);
static void SpriteCB_PartySummaryBall_Exit(struct Sprite *sprite);
static void Task_HidePartyStatusSummary_DuringBattle(u8 taskId);
static void SpriteCB_PartySummaryBall_OnSwitchout(struct Sprite *sprite);
static void UpdateStatusIconInHealthbox(u8 spriteId);
static void SpriteCB_PartySummaryBar(struct Sprite *sprite);
static void SpriteCB_PartySummaryBall_OnBattleStart(struct Sprite *sprite);
static u8 GetStatusIconForBattlerId(u8 statusElementId, u8 battlerId);
static void MoveBattleBarGraphically(u8 battlerId, u8 whichBar);
static u8 GetReceivedValueInPixels(s32 oldValue, s32 receivedValue, s32 maxValue, u8 scale);
static u8 CalcBarFilledPixels(s32 maxValue, s32 oldValue, s32 receivedValue, s32 *currValue, u8 *arg4, u8 scale);
static s32 CalcNewBarValue(s32 maxValue, s32 currValue, s32 receivedValue, s32 *arg3, u8 arg4, u16 arg5);
static void DrawHealthbarOntoScreen(struct TestingBar *barInfo, s32 *currValue, u8 bg, u8 x, u8 y);
static void SafariTextIntoHealthboxObject(void *dest, u8 *windowTileData, u32 windowWidth);
static u8 *AddTextPrinterAndCreateWindowOnHealthbox(const u8 *str, u32 x, u32 y, u32 *windowId);
static void RemoveWindowOnHealthbox(u32 windowId);
static void TextIntoHealthboxObject(void *dest, u8 *windowTileData, s32 windowWidth);

static const struct OamData sOamData_Healthbox = {
    .shape = SPRITE_SHAPE(64x32),
    .size = SPRITE_SIZE(64x32),
    .priority = 1
};

static const struct SpriteTemplate sHealthboxPlayerSpriteTemplates[] = {
    [B_POSITION_PLAYER_LEFT / 2] = {
        .tileTag = TAG_HEALTHBOX_PLAYER1_TILE,
        .paletteTag = TAG_HEALTHBOX_PAL,
        .oam = &sOamData_Healthbox,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy
    },
    [B_POSITION_PLAYER_RIGHT / 2] = {
        .tileTag = TAG_HEALTHBOX_PLAYER2_TILE,
        .paletteTag = TAG_HEALTHBOX_PAL,
        .oam = &sOamData_Healthbox,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy
    }
};

static const struct SpriteTemplate sHealthboxOpponentSpriteTemplates[] = {
    [B_POSITION_OPPONENT_LEFT / 2] = {
        .tileTag = TAG_HEALTHBOX_OPPONENT1_TILE,
        .paletteTag = TAG_HEALTHBOX_PAL,
        .oam = &sOamData_Healthbox,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy
    },
    [B_POSITION_OPPONENT_RIGHT / 2] = {
        .tileTag = TAG_HEALTHBOX_OPPONENT2_TILE,
        .paletteTag = TAG_HEALTHBOX_PAL,
        .oam = &sOamData_Healthbox,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy
    }
};

static const struct SpriteTemplate sHealthboxSafariSpriteTemplate =
{
    .tileTag = TAG_HEALTHBOX_SAFARI_TILE,
    .paletteTag = TAG_HEALTHBOX_PAL,
    .oam = &sOamData_Healthbox,
    .anims = gDummySpriteAnimTable,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOamData_Healthbar = {
    .shape = SPRITE_SHAPE(32x8),
    .size = SPRITE_SIZE(32x8),
    .priority = 1
};

static const struct SpriteTemplate sHealthbarSpriteTemplates[] = {
    [B_POSITION_PLAYER_LEFT] = {
        .tileTag = TAG_HEALTHBAR_PLAYER1_TILE,
        .paletteTag = TAG_HEALTHBAR_PAL,
        .oam = &sOamData_Healthbar,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_HealthBar
    },
    [B_POSITION_OPPONENT_LEFT] = {
        .tileTag = TAG_HEALTHBAR_OPPONENT1_TILE,
        .paletteTag = TAG_HEALTHBAR_PAL,
        .oam = &sOamData_Healthbar,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_HealthBar
    },
    [B_POSITION_PLAYER_RIGHT] = {
        .tileTag = TAG_HEALTHBAR_PLAYER2_TILE,
        .paletteTag = TAG_HEALTHBAR_PAL,
        .oam = &sOamData_Healthbar,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_HealthBar
    },
    [B_POSITION_OPPONENT_RIGHT] = {
        .tileTag = TAG_HEALTHBAR_OPPONENT2_TILE,
        .paletteTag = TAG_HEALTHBAR_PAL,
        .oam = &sOamData_Healthbar,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_HealthBar
    }
};

static const struct Subsprite sUnused_Subsprites_0[] = {
    { -16, 0, SPRITE_SHAPE(64x32), SPRITE_SIZE(64x32), 0, 1 },
    { 48, 0, SPRITE_SHAPE(32x32), SPRITE_SIZE(32x32), 32, 1 },
    { -16, 32, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 48, 1 },
    { 16, 32, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 52, 1 },
    { 48, 32, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 56, 1 }
};

static const struct Subsprite sUnused_Subsprites_2[] = {
    { -16, 0, SPRITE_SHAPE(64x32), SPRITE_SIZE(64x32), 64, 1 },
    { 48, 0, SPRITE_SHAPE(32x32), SPRITE_SIZE(32x32), 96, 1 },
    { -16, 32, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 112, 1 },
    { 16, 32, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 116, 1 },
    { 48, 32, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 120, 1 }
};

static const struct Subsprite sUnused_Subsprites_1[] = {
    { -16, 0, SPRITE_SHAPE(64x32), SPRITE_SIZE(64x32), 0, 1 },
    { 48, 0, SPRITE_SHAPE(32x32), SPRITE_SIZE(32x32), 32, 1 }
};

static const struct Subsprite sUnused_Subsprites_3[] = {
    { -16, 0, SPRITE_SHAPE(64x32), SPRITE_SIZE(64x32), 0, 1 },
    { 48, 0, SPRITE_SHAPE(32x32), SPRITE_SIZE(32x32), 32, 1 }
};

static const struct Subsprite sHealthBar_Subsprites_Player[] = {
    {
        .x = -16,
        .y = 0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 0,
        .priority = 1
    },
    {
        .x = 16,
        .y = 0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 4,
        .priority = 1
    }
};

static const struct Subsprite sHealthBar_Subsprites_Opponent[] = {
    {
        .x = -16,
        .y = 0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 0,
        .priority = 1
    },
    {
        .x = 16,
        .y = 0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 4,
        .priority = 1
    },
    {
        .x = -32,
        .y = 0,
        .shape = SPRITE_SHAPE(8x8),
        .size = SPRITE_SIZE(8x8),
        .tileOffset = 8,
        .priority = 1
    },
};

// Unused
static const struct SubspriteTable sUnused_SubspriteTable[] = {
    {ARRAY_COUNT(sUnused_Subsprites_0), sUnused_Subsprites_0},
    {ARRAY_COUNT(sUnused_Subsprites_1), sUnused_Subsprites_1},
    {ARRAY_COUNT(sUnused_Subsprites_2), sUnused_Subsprites_2},
    {ARRAY_COUNT(sUnused_Subsprites_3), sUnused_Subsprites_3}
};

static const struct SubspriteTable sHealthBar_SubspriteTable[] = {
    [B_SIDE_PLAYER]   = {ARRAY_COUNT(sHealthBar_Subsprites_Player), sHealthBar_Subsprites_Player},
    [B_SIDE_OPPONENT] = {ARRAY_COUNT(sHealthBar_Subsprites_Opponent), sHealthBar_Subsprites_Opponent},
};

static const struct Subsprite sStatusSummaryBar_Subsprites_Enter[] = {
    {
        .x = -96,
        .y = 0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 0,
        .priority = 1
    },
    {
        .x = -64,
        .y = 0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 4,
        .priority = 1
    },
    {
        .x = -32,
        .y = 0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 8,
        .priority = 1
    },
    {
        .x = 0,
        .y = 0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 12,
        .priority = 1
    }
};

static const struct Subsprite sStatusSummaryBar_Subsprites_Exit[] = {
    {
        .x = -96,
        .y = 0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 0,
        .priority = 1
    },
    {
        .x = -64,
        .y = 0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 4,
        .priority = 1
    },
    {
        .x = -32,
        .y = 0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 8,
        .priority = 1
    },
    {
        .x = 0,
        .y = 0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 8,
        .priority = 1
    },
    {
        .x = 32,
        .y = 0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 8,
        .priority = 1
    },
    {
        .x = 64,
        .y = 0,
        .shape = SPRITE_SHAPE(32x8),
        .size = SPRITE_SIZE(32x8),
        .tileOffset = 12,
        .priority = 1
    }
};

static const struct SubspriteTable sStatusSummaryBar_SubspriteTable_Enter[] = {
    {ARRAY_COUNT(sStatusSummaryBar_Subsprites_Enter), sStatusSummaryBar_Subsprites_Enter}
};

static const struct SubspriteTable sStatusSummaryBar_SubspriteTable_Exit[] = {
    {ARRAY_COUNT(sStatusSummaryBar_Subsprites_Exit), sStatusSummaryBar_Subsprites_Exit}
};

static const u16 sBattleInterface_Unused[] = INCBIN_U16("graphics/battle_interface/unused.4bpp");

static const struct CompressedSpriteSheet sPartySummaryBarSpriteSheets[] = {
    {gBattleInterface_PartySummaryBar_Gfx, 16 * TILE_SIZE_4BPP, TAG_PARTY_SUMMARY_BAR_PLAYER_TILE},
    {gBattleInterface_PartySummaryBar_Gfx, 16 * TILE_SIZE_4BPP, TAG_PARTY_SUMMARY_BAR_OPPONENT_TILE}
};

static const struct SpritePalette sPartySummaryBarSpritePals[] = {
    {gBattleInterface_Healthbox_Pal, TAG_PARTY_SUMMARY_BAR_PLAYER_PAL},
    {gBattleInterface_Healthbox_Pal, TAG_PARTY_SUMMARY_BAR_OPPONENT_PAL}
};

static const struct SpritePalette sPartySummaryBallSpritePals[] = {
    {gBattleInterface_Healthbar_Pal, TAG_PARTY_SUMMARY_BALL_PLAYER_PAL},
    {gBattleInterface_Healthbar_Pal, TAG_PARTY_SUMMARY_BALL_OPPONENT_PAL}
};

static const struct SpriteSheet sPartySummaryBallSpriteSheets[] = {
    {gBattleInterface_Gfx + B_INTERFACE_GFX_BALL_PARTY_SUMMARY, 4 * TILE_SIZE_4BPP, TAG_PARTY_SUMMARY_BALL_PLAYER_TILE},
    {gBattleInterface_Gfx + B_INTERFACE_GFX_BALL_PARTY_SUMMARY, 4 * TILE_SIZE_4BPP, TAG_PARTY_SUMMARY_BALL_OPPONENT_TILE}
};

// Unused
static const struct OamData sOamData_Healthbox2 = {
    .shape = SPRITE_SHAPE(64x32),
    .size = SPRITE_SIZE(64x32),
    .priority = 1
};

static const struct OamData sOamData_PartySummaryBall = {
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .priority = 1
};

static const struct SpriteTemplate sPartySummaryBarSpriteTemplates[] = {
    {
        .tileTag = TAG_PARTY_SUMMARY_BAR_PLAYER_TILE,
        .paletteTag = TAG_PARTY_SUMMARY_BAR_PLAYER_PAL,
        .oam = &sOamData_Healthbox,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_PartySummaryBar
    }, {
        .tileTag = TAG_PARTY_SUMMARY_BAR_OPPONENT_TILE,
        .paletteTag = TAG_PARTY_SUMMARY_BAR_OPPONENT_PAL,
        .oam = &sOamData_Healthbox,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_PartySummaryBar
    }
};

static const struct SpriteTemplate sPartySummaryBallSpriteTemplates[] = {
    {
        .tileTag = TAG_PARTY_SUMMARY_BALL_PLAYER_TILE,
        .paletteTag = TAG_PARTY_SUMMARY_BALL_PLAYER_PAL,
        .oam = &sOamData_PartySummaryBall,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_PartySummaryBall_OnBattleStart
    }, {
        .tileTag = TAG_PARTY_SUMMARY_BALL_OPPONENT_TILE,
        .paletteTag = TAG_PARTY_SUMMARY_BALL_OPPONENT_PAL,
        .oam = &sOamData_PartySummaryBall,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_PartySummaryBall_OnBattleStart
    }
};

static void Debug_DrawNumber(s16 number, u16 *dest, bool8 singleRow)
{
    s8 i, j;
    u8 buff[4];

    for (i = 0; i < 4; i++)
        buff[i] = 0;

    for (i = 3; ; i--)
    {
        if (number > 0)
        {
            buff[i] = number % 10;
            number /= 10;
        }
        else
        {
            while (i > -1)
            {
                buff[i] = 0xFF;
                i--;
            }

            if (buff[3] == 0xFF)
                buff[3] = 0;
            break;
        }
    }

    if (!singleRow)
    {
        for (i = 0, j = 0; i < 4; i++)
        {
            if (buff[j] == 0xFF)
            {
                dest[j + 0x00] &= 0xFC00;
                dest[j + 0x00] |= 30;
                dest[i + 0x20] &= 0xFC00;
                dest[i + 0x20] |= 30;
            }
            else
            {
                dest[j + 0x00] &= 0xFC00;
                dest[j + 0x00] |= 20 + buff[j];
                dest[i + 0x20] &= 0xFC00;
                dest[i + 0x20] |= 20 + buff[i] + 1 * TILE_SIZE_4BPP;
            }
            j++;
        }
    }
    else
    {
        for (i = 0; i < 4; i++)
        {
            if (buff[i] == 0xFF)
            {
                dest[i + 0x00] &= 0xFC00;
                dest[i + 0x00] |= 30;
                dest[i + 0x20] &= 0xFC00;
                dest[i + 0x20] |= 30;
            }
            else
            {
                dest[i + 0x00] &= 0xFC00;
                dest[i + 0x00] |= 20 + buff[i];
                dest[i + 0x20] &= 0xFC00;
                dest[i + 0x20] |= 20 + buff[i] + 1 * TILE_SIZE_4BPP;
            }
        }
    }
}

// Unused
static void Debug_DrawNumberPair(s16 num1, s16 num2, u16 *dest)
{
    dest[4] = 30;
    Debug_DrawNumber(num2, &dest[0], FALSE);
    Debug_DrawNumber(num1, &dest[5], TRUE);
}

// Because the healthbox is too large to fit into one sprite, it is divided
// into two sprites. The left sprite is used as the 'main' healthbox sprite,
// while the right sprite is the 'other' healthbox sprite.
// There is also a third sprite for the healthbar, visible on the healthbox.

// sprite data for main (left) healthbox sprite
#define sHealthboxOtherSpriteId oam.affineParam
#define sHealthBarSpriteId      data[5]
#define sBattlerId              data[6]

// sprite data for other (right) healthbox sprite
#define sHealthboxSpriteId      data[5]

// sprite data for healthbar sprite
#define sHealthboxSpriteId      data[5]
#define sHealthbarType          data[6]

enum
{
    HEALTHBAR_TYPE_PLAYER_SINGLE,
    HEALTHBAR_TYPE_PLAYER_DOUBLE,
    HEALTHBAR_TYPE_OPPONENT,
};

u8 CreateBattlerHealthboxSprites(u8 battlerId)
{
    s16 healthbarType = HEALTHBAR_TYPE_PLAYER_SINGLE;
    u8 healthboxSpriteId;
    u8 healthboxOtherSpriteId;
    u8 healthbarSpriteId;
    struct Sprite *healthbarSprite;

    if (!IsDoubleBattle())
    {
        if (GetBattlerSide(battlerId) == B_SIDE_PLAYER)
        {
            healthboxSpriteId = CreateSprite(&sHealthboxPlayerSpriteTemplates[B_POSITION_PLAYER_LEFT / 2], 240, 160, 1);
            healthboxOtherSpriteId = CreateSpriteAtEnd(&sHealthboxPlayerSpriteTemplates[B_POSITION_PLAYER_LEFT / 2], 240, 160, 1);

            gSprites[healthboxSpriteId].oam.shape = SPRITE_SHAPE(64x64);
            gSprites[healthboxOtherSpriteId].oam.shape = SPRITE_SHAPE(64x64);
            gSprites[healthboxOtherSpriteId].oam.tileNum += 2 * TILE_SIZE_4BPP;
        }
        else
        {
            healthboxSpriteId = CreateSprite(&sHealthboxOpponentSpriteTemplates[B_POSITION_OPPONENT_LEFT / 2], 240, 160, 1);
            healthboxOtherSpriteId = CreateSpriteAtEnd(&sHealthboxOpponentSpriteTemplates[B_POSITION_OPPONENT_LEFT / 2], 240, 160, 1);

            gSprites[healthboxOtherSpriteId].oam.tileNum += 1 * TILE_SIZE_4BPP;
            healthbarType = HEALTHBAR_TYPE_OPPONENT;
        }

        gSprites[healthboxSpriteId].sHealthboxOtherSpriteId = healthboxOtherSpriteId;
        gSprites[healthboxOtherSpriteId].sHealthboxSpriteId = healthboxSpriteId;
        gSprites[healthboxOtherSpriteId].callback = SpriteCB_HealthBoxOther;
    }
    else
    {
        if (GetBattlerSide(battlerId) == B_SIDE_PLAYER)
        {
            healthboxSpriteId = CreateSprite(&sHealthboxPlayerSpriteTemplates[GetBattlerPosition(battlerId) / 2], 240, 160, 1);
            healthboxOtherSpriteId = CreateSpriteAtEnd(&sHealthboxPlayerSpriteTemplates[GetBattlerPosition(battlerId) / 2], 240, 160, 1);

            gSprites[healthboxSpriteId].sHealthboxOtherSpriteId = healthboxOtherSpriteId;
            gSprites[healthboxOtherSpriteId].sHealthboxSpriteId = healthboxSpriteId;
            gSprites[healthboxOtherSpriteId].oam.tileNum += 1 * TILE_SIZE_4BPP;
            gSprites[healthboxOtherSpriteId].callback = SpriteCB_HealthBoxOther;
            healthbarType = HEALTHBAR_TYPE_PLAYER_DOUBLE;
        }
        else
        {
            healthboxSpriteId = CreateSprite(&sHealthboxOpponentSpriteTemplates[GetBattlerPosition(battlerId) / 2], 240, 160, 1);
            healthboxOtherSpriteId = CreateSpriteAtEnd(&sHealthboxOpponentSpriteTemplates[GetBattlerPosition(battlerId) / 2], 240, 160, 1);

            gSprites[healthboxSpriteId].sHealthboxOtherSpriteId = healthboxOtherSpriteId;
            gSprites[healthboxOtherSpriteId].sHealthboxSpriteId = healthboxSpriteId;
            gSprites[healthboxOtherSpriteId].oam.tileNum += 1 * TILE_SIZE_4BPP;
            gSprites[healthboxOtherSpriteId].callback = SpriteCB_HealthBoxOther;
            healthbarType = HEALTHBAR_TYPE_OPPONENT;
        }
    }
    healthbarSpriteId = CreateSpriteAtEnd(&sHealthbarSpriteTemplates[gBattlerPositions[battlerId]], 140, 60, 0);
    healthbarSprite = &gSprites[healthbarSpriteId];
    SetSubspriteTables(healthbarSprite, &sHealthBar_SubspriteTable[GetBattlerSide(battlerId)]);
    healthbarSprite->subspriteMode = SUBSPRITES_IGNORE_PRIORITY;
    healthbarSprite->oam.priority = 1;
    CpuCopy32(GetBattleInterfaceGfxPtr(B_INTERFACE_GFX_HP_BAR_HP_TEXT), OBJ_VRAM0 + healthbarSprite->oam.tileNum * TILE_SIZE_4BPP, 2 * TILE_SIZE_4BPP);

    gSprites[healthboxSpriteId].sHealthBarSpriteId = healthbarSpriteId;
    gSprites[healthboxSpriteId].sBattlerId = battlerId;
    gSprites[healthboxSpriteId].invisible = TRUE;
    gSprites[healthboxOtherSpriteId].invisible = TRUE;
    healthbarSprite->sHealthboxSpriteId = healthboxSpriteId;
    healthbarSprite->sHealthbarType = healthbarType;
    healthbarSprite->invisible = TRUE;

    return healthboxSpriteId;
}

u8 CreateSafariPlayerHealthboxSprites(void)
{
    u8 healthboxSpriteId = CreateSprite(&sHealthboxSafariSpriteTemplate, 240, 160, 1);
    u8 healthboxOtherSpriteId = CreateSpriteAtEnd(&sHealthboxSafariSpriteTemplate, 240, 160, 1);

    gSprites[healthboxSpriteId].oam.shape = SPRITE_SHAPE(64x64);
    gSprites[healthboxOtherSpriteId].oam.shape = SPRITE_SHAPE(64x64);
    gSprites[healthboxOtherSpriteId].oam.tileNum += 2 * TILE_SIZE_4BPP;
    gSprites[healthboxSpriteId].sHealthboxOtherSpriteId = healthboxOtherSpriteId;
    gSprites[healthboxOtherSpriteId].sHealthboxSpriteId = healthboxSpriteId;
    gSprites[healthboxOtherSpriteId].callback = SpriteCB_HealthBoxOther;
    return healthboxSpriteId;
}

static const u8 *GetBattleInterfaceGfxPtr(u8 elementId)
{
    return gBattleInterface_Gfx[elementId];
}

// Syncs the position of healthbar accordingly with the healthbox.
static void SpriteCB_HealthBar(struct Sprite *sprite)
{
    u8 healthboxSpriteId = sprite->sHealthboxSpriteId;

    switch (sprite->sHealthbarType)
    {
    case HEALTHBAR_TYPE_PLAYER_SINGLE:
        sprite->x = gSprites[healthboxSpriteId].x + 16;
        sprite->y = gSprites[healthboxSpriteId].y;
        break;
    case HEALTHBAR_TYPE_PLAYER_DOUBLE:
        sprite->x = gSprites[healthboxSpriteId].x + 16;
        sprite->y = gSprites[healthboxSpriteId].y;
        break;
    default:
    case HEALTHBAR_TYPE_OPPONENT:
        sprite->x = gSprites[healthboxSpriteId].x + 8;
        sprite->y = gSprites[healthboxSpriteId].y;
        break;
    }
    sprite->x2 = gSprites[healthboxSpriteId].x2;
    sprite->y2 = gSprites[healthboxSpriteId].y2;
}

static void SpriteCB_HealthBoxOther(struct Sprite *sprite)
{
    u8 healthboxSpriteId = sprite->sHealthboxSpriteId;

    sprite->x = gSprites[healthboxSpriteId].x + 64;
    sprite->y = gSprites[healthboxSpriteId].y;

    sprite->x2 = gSprites[healthboxSpriteId].x2;
    sprite->y2 = gSprites[healthboxSpriteId].y2;
}

void SetBattleBarStruct(u8 battlerId, u8 healthboxSpriteId, s32 maxVal, s32 oldVal, s32 receivedValue)
{
    gBattleSpritesDataPtr->battleBars[battlerId].healthboxSpriteId = healthboxSpriteId;
    gBattleSpritesDataPtr->battleBars[battlerId].maxValue = maxVal;
    gBattleSpritesDataPtr->battleBars[battlerId].oldValue = oldVal;
    gBattleSpritesDataPtr->battleBars[battlerId].receivedValue = receivedValue;
    gBattleSpritesDataPtr->battleBars[battlerId].currValue = -32768;
}

void SetHealthboxSpriteInvisible(u8 healthboxSpriteId)
{
    gSprites[healthboxSpriteId].invisible = TRUE;
    gSprites[gSprites[healthboxSpriteId].sHealthBarSpriteId].invisible = TRUE;
    gSprites[gSprites[healthboxSpriteId].sHealthboxOtherSpriteId].invisible = TRUE;
}

void SetHealthboxSpriteVisible(u8 healthboxSpriteId)
{
    gSprites[healthboxSpriteId].invisible = FALSE;
    gSprites[gSprites[healthboxSpriteId].sHealthBarSpriteId].invisible = FALSE;
    gSprites[gSprites[healthboxSpriteId].sHealthboxOtherSpriteId].invisible = FALSE;
}

static void UpdateSpritePos(u8 spriteId, s16 x, s16 y)
{
    gSprites[spriteId].x = x;
    gSprites[spriteId].y = y;
}

void DestoryHealthboxSprite(u8 healthboxSpriteId)
{
    DestroySprite(&gSprites[gSprites[healthboxSpriteId].sHealthboxOtherSpriteId]);
    DestroySprite(&gSprites[gSprites[healthboxSpriteId].sHealthBarSpriteId]);
    DestroySprite(&gSprites[healthboxSpriteId]);
}

void DummyBattleInterfaceFunc(u8 healthboxSpriteId, bool8 isDoubleBattleBattlerOnly)
{
}

void UpdateOamPriorityInAllHealthboxes(u8 priority)
{
    s32 i;

    for (i = 0; i < gBattlersCount; i++)
    {
        u8 healthboxSpriteId = gHealthboxSpriteIds[i];
        u8 healthboxOtherSpriteId = gSprites[gHealthboxSpriteIds[i]].sHealthboxOtherSpriteId;
        u8 healthbarSpriteId = gSprites[gHealthboxSpriteIds[i]].sHealthBarSpriteId;

        gSprites[healthboxSpriteId].oam.priority = priority;
        gSprites[healthboxOtherSpriteId].oam.priority = priority;
        gSprites[healthbarSpriteId].oam.priority = priority;
    }
}

void InitBattlerHealthboxCoords(u8 battler)
{
    s16 x = 0, y = 0;

    if (!IsDoubleBattle())
    {
        if (GetBattlerSide(battler) != B_SIDE_PLAYER)
            x = 44, y = 30;
        else
            x = 158, y = 88;
    }
    else
    {
        switch (GetBattlerPosition(battler))
        {
        case B_POSITION_PLAYER_LEFT:
            x = 159, y = 75;
            break;
        case B_POSITION_PLAYER_RIGHT:
            x = 171, y = 100;
            break;
        case B_POSITION_OPPONENT_LEFT:
            x = 44, y = 19;
            break;
        case B_POSITION_OPPONENT_RIGHT:
            x = 32, y = 44;
            break;
        }
    }

    UpdateSpritePos(gHealthboxSpriteIds[battler], x, y);
}

static void UpdateLvlInHealthbox(u8 healthboxSpriteId, u8 lvl)
{
    u32 windowId, spriteTileNum;
    u8 *windowTileData;
    u8 text[16] = _("{LV_2}");
    u32 xPos;
    u8 *objVram;

    objVram = ConvertIntToDecimalStringN(text + 2, lvl, STR_CONV_MODE_LEFT_ALIGN, 3);
    xPos = 5 * (3 - (objVram - (text + 2)));

    windowTileData = AddTextPrinterAndCreateWindowOnHealthbox(text, xPos, 3, &windowId);
    spriteTileNum = gSprites[healthboxSpriteId].oam.tileNum * TILE_SIZE_4BPP;

    if (GetBattlerSide(gSprites[healthboxSpriteId].sBattlerId) == B_SIDE_PLAYER)
    {
        objVram = (void *)(OBJ_VRAM0);
        if (!IsDoubleBattle())
            objVram += spriteTileNum + 0x820;
        else
            objVram += spriteTileNum + 0x420;
    }
    else
    {
        objVram = (void *)(OBJ_VRAM0);
        objVram += spriteTileNum + 0x400;
    }
    TextIntoHealthboxObject(objVram, windowTileData, 3);
    RemoveWindowOnHealthbox(windowId);
}

void UpdateHpTextInHealthbox(u8 healthboxSpriteId, s16 value, u8 maxOrCurrent)
{
    u32 windowId, spriteTileNum;
    u8 *windowTileData;

    if (GetBattlerSide(gSprites[healthboxSpriteId].sBattlerId) == B_SIDE_PLAYER && !IsDoubleBattle())
    {
        // Only in the Japanese release can HP be displayed as text outside of double battles
        u8 text[8];
        if (maxOrCurrent != HP_CURRENT) // singles, max
        {
            ConvertIntToDecimalStringN(text, value, STR_CONV_MODE_RIGHT_ALIGN, 3);
            windowTileData = AddTextPrinterAndCreateWindowOnHealthbox(text, 0, 5, &windowId);
            spriteTileNum = gSprites[healthboxSpriteId].oam.tileNum;
            TextIntoHealthboxObject((void *)(OBJ_VRAM0) + spriteTileNum * TILE_SIZE_4BPP + 0xA40, windowTileData, 2);
            RemoveWindowOnHealthbox(windowId);
        }
        else // singles, current
        {
            u8 *strptr;
            strptr = ConvertIntToDecimalStringN(text, value, STR_CONV_MODE_RIGHT_ALIGN, 3);
            *strptr++ = CHAR_SLASH;
            *strptr++ = EOS;
            windowTileData = AddTextPrinterAndCreateWindowOnHealthbox(text, 4, 5, &windowId);
            spriteTileNum = gSprites[healthboxSpriteId].oam.tileNum;
            TextIntoHealthboxObject((void *)(OBJ_VRAM0) + spriteTileNum * TILE_SIZE_4BPP + 0x2E0, windowTileData, 1);
            TextIntoHealthboxObject((void *)(OBJ_VRAM0) + spriteTileNum * TILE_SIZE_4BPP + 0xA00, windowTileData + 0x20, 2);
            RemoveWindowOnHealthbox(windowId);
        }
    }
    else
    {
        u8 battler;

        u8 text[20] = __("{COLOR 01}{HIGHLIGHT 02}");
        battler = gSprites[healthboxSpriteId].sBattlerId;
        if (IsDoubleBattle() == TRUE || GetBattlerSide(battler) == B_SIDE_OPPONENT)
            UpdateHpTextInHealthboxInDoubles(healthboxSpriteId, value, maxOrCurrent);
        else
        {
            // Only in the Japanese release can HP be displayed as text outside of double battles
            u32 var;
            u8 i;

            if (GetBattlerSide(gSprites[healthboxSpriteId].sBattlerId) == B_SIDE_PLAYER)
            {
                if (maxOrCurrent == HP_CURRENT)
                    var = 29;
                else
                    var = 89;
            }
            else
            {
                if (maxOrCurrent == HP_CURRENT)
                    var = 20;
                else
                    var = 48;
            }

            ConvertIntToDecimalStringN(text + 6, value, STR_CONV_MODE_RIGHT_ALIGN, 3);
            RenderTextHandleBold(gMonSpritesGfxPtr->barFontGfx, 0, text, 0, 0, 0, 0, 0);

            for (i = 0; i < 3; i++)
            {
                CpuCopy32(&gMonSpritesGfxPtr->barFontGfx[i * 64 + 32],
                          (void *)((OBJ_VRAM0) + TILE_SIZE_4BPP * (gSprites[healthboxSpriteId].oam.tileNum + var + i)),
                          1 * TILE_SIZE_4BPP);
            }
        }
    }
}

static const u8 sText_Slash[] = _("/");

static void UpdateHpTextInHealthboxInDoubles(u8 healthboxSpriteId, s16 value, u8 maxOrCurrent)
{
    u32 windowId, spriteTileNum;
    u8 *windowTileData;

    u8 battlerId;

    u8 text[20] = __("{COLOR 01}{HIGHLIGHT 00}");
    battlerId = gSprites[healthboxSpriteId].sBattlerId;

    if (gBattleSpritesDataPtr->battlerData[battlerId].hpNumbersNoBars)
    {
        u8 var = 4;
        u8 healthBarSpriteId;
        u8 *txtPtr;
        u8 i;

        if (maxOrCurrent == HP_CURRENT)
            var = 0;

        healthBarSpriteId = gSprites[healthboxSpriteId].sHealthBarSpriteId;
        txtPtr = ConvertIntToDecimalStringN(text + 6, value, STR_CONV_MODE_RIGHT_ALIGN, 3);
        if (maxOrCurrent == HP_CURRENT)
            StringCopy(txtPtr, sText_Slash);

        RenderTextHandleBold(gMonSpritesGfxPtr->barFontGfx, 0, text, 0, 0, 0, 0, 0);

        for (i = var; i < var + 3; i++)
        {
            if (i < 3)
            {
                CpuCopy32(&gMonSpritesGfxPtr->barFontGfx[((i - var) * 64) + 32],
                          (void *)((OBJ_VRAM0) + (1 + gSprites[healthBarSpriteId].oam.tileNum + i) * TILE_SIZE_4BPP),
                          1 * TILE_SIZE_4BPP);
            }
            else
            {
                CpuCopy32(&gMonSpritesGfxPtr->barFontGfx[((i - var) * 64) + 32],
                          (void *)((OBJ_VRAM0 + 0x20) + (i + gSprites[healthBarSpriteId].oam.tileNum) * TILE_SIZE_4BPP),
                          1 * TILE_SIZE_4BPP);
            }
        }

        if (maxOrCurrent == HP_CURRENT)
        {
            CpuCopy32(&gMonSpritesGfxPtr->barFontGfx[224],
                      (void *)((OBJ_VRAM0) + ((gSprites[healthBarSpriteId].oam.tileNum + 4) * TILE_SIZE_4BPP)),
                      1 * TILE_SIZE_4BPP);
            CpuFill32(0,
                      (void *)((OBJ_VRAM0) + (gSprites[healthBarSpriteId].oam.tileNum * TILE_SIZE_4BPP)),
                      1 * TILE_SIZE_4BPP);
        }
        else
        {
            if (GetBattlerSide(battlerId) == B_SIDE_PLAYER)
            {
                CpuCopy32(GetBattleInterfaceGfxPtr(B_INTERFACE_GFX_BOTTOM_RIGHT_CORNER_HP_AS_TEXT),
                          (void *)(OBJ_VRAM0) + ((gSprites[healthboxSpriteId].oam.tileNum + 52) * TILE_SIZE_4BPP),
                          1 * TILE_SIZE_4BPP);
            }
        }
    }
}

// Prints mon's nature, catch and flee rate. Probably used to test pokeblock-related features.
static void PrintSafariMonInfo(u8 healthboxSpriteId, struct Pokemon *mon)
{
    u8 text[20] = __("{COLOR 01}{HIGHLIGHT 02}");
    s32 j, spriteTileNum;
    u8 *barFontGfx;
    u8 i, var, nature, healthBarSpriteId;

    barFontGfx = &gMonSpritesGfxPtr->barFontGfx[0x520 + (GetBattlerPosition(gSprites[healthboxSpriteId].sBattlerId) * 384)];
    var = 5;
    nature = GetNature(mon);
    StringCopy(text + 6, gNatureNamePointers[nature]);
    RenderTextHandleBold(barFontGfx, 0, text, 0, 0, 0, 0, 0);

    for (j = 6, i = 0; i < var; i++, j++)
    {
        u8 elementId;

        if ((text[j] >= 55 && text[j] <= 74) || (text[j] >= 135 && text[j] <= 154))
            elementId = B_INTERFACE_GFX_SAFARI_HEALTHBOX_1;
        else if ((text[j] >= 75 && text[j] <= 79) || (text[j] >= 155 && text[j] <= 159))
            elementId = B_INTERFACE_GFX_SAFARI_HEALTHBOX_2;
        else
            elementId = B_INTERFACE_GFX_SAFARI_HEALTHBOX_0;

        CpuCopy32(GetBattleInterfaceGfxPtr(elementId), barFontGfx + (i * 64), 0x20);
    }

    for (j = 1; j < var + 1; j++)
    {
        spriteTileNum = (gSprites[healthboxSpriteId].oam.tileNum + (j - (j / 8 * 8)) + (j / 8 * 64)) * TILE_SIZE_4BPP;
        CpuCopy32(barFontGfx, (void *)(OBJ_VRAM0) + (spriteTileNum), 0x20);
        barFontGfx += 0x20;

        spriteTileNum = (8 + gSprites[healthboxSpriteId].oam.tileNum + (j - (j / 8 * 8)) + (j / 8 * 64)) * TILE_SIZE_4BPP;
        CpuCopy32(barFontGfx, (void *)(OBJ_VRAM0) + (spriteTileNum), 0x20);
        barFontGfx += 0x20;
    }

    healthBarSpriteId = gSprites[healthboxSpriteId].sHealthBarSpriteId;
    ConvertIntToDecimalStringN(text + 6, gBattleStruct->safariCatchFactor, STR_CONV_MODE_RIGHT_ALIGN, 2);
    ConvertIntToDecimalStringN(text + 9, gBattleStruct->safariEscapeFactor, STR_CONV_MODE_RIGHT_ALIGN, 2);
    text[5] = CHAR_SPACE;
    text[8] = CHAR_SLASH;
    RenderTextHandleBold(gMonSpritesGfxPtr->barFontGfx, 0, text, 0, 0, 0, 0, 0);

    j = healthBarSpriteId; // Needed to match for some reason.
    for (j = 0; j < 5; j++)
    {
        if (j <= 1)
        {
            CpuCopy32(&gMonSpritesGfxPtr->barFontGfx[0x40 * j + 0x20],
                      (void *)(OBJ_VRAM0) + (gSprites[healthBarSpriteId].oam.tileNum + 2 + j) * TILE_SIZE_4BPP,
                      32);
        }
        else
        {
            CpuCopy32(&gMonSpritesGfxPtr->barFontGfx[0x40 * j + 0x20],
                      (void *)(OBJ_VRAM0 + 0xC0) + (j + gSprites[healthBarSpriteId].oam.tileNum) * TILE_SIZE_4BPP,
                      32);
        }
    }
}

void SwapHpBarsWithHpText(void)
{
    s32 i;
    u8 healthBarSpriteId;

    for (i = 0; i < gBattlersCount; i++)
    {
        if (gSprites[gHealthboxSpriteIds[i]].callback == SpriteCallbackDummy
            && GetBattlerSide(i) != B_SIDE_OPPONENT
            && (IsDoubleBattle() || GetBattlerSide(i) != B_SIDE_PLAYER))
        {
            bool8 noBars;

            gBattleSpritesDataPtr->battlerData[i].hpNumbersNoBars ^= 1;
            noBars = gBattleSpritesDataPtr->battlerData[i].hpNumbersNoBars;
            if (GetBattlerSide(i) == B_SIDE_PLAYER)
            {
                if (!IsDoubleBattle())
                    continue;
                if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
                    continue;

                if (noBars == TRUE) // bars to text
                {
                    healthBarSpriteId = gSprites[gHealthboxSpriteIds[i]].sHealthBarSpriteId;

                    CpuFill32(0, (void *)(OBJ_VRAM0 + gSprites[healthBarSpriteId].oam.tileNum * TILE_SIZE_4BPP), 8 * TILE_SIZE_4BPP);
                    UpdateHpTextInHealthboxInDoubles(gHealthboxSpriteIds[i], GetMonData(&gPlayerParty[gBattlerPartyIndexes[i]], MON_DATA_HP), HP_CURRENT);
                    UpdateHpTextInHealthboxInDoubles(gHealthboxSpriteIds[i], GetMonData(&gPlayerParty[gBattlerPartyIndexes[i]], MON_DATA_MAX_HP), HP_MAX);
                }
                else // text to bars
                {
                    UpdateStatusIconInHealthbox(gHealthboxSpriteIds[i]);
                    UpdateHealthboxAttribute(gHealthboxSpriteIds[i], &gPlayerParty[gBattlerPartyIndexes[i]], HEALTHBOX_HEALTH_BAR);
                    CpuCopy32(GetBattleInterfaceGfxPtr(B_INTERFACE_GFX_BOTTOM_RIGHT_CORNER_HP_AS_BAR),
                             (void *)(OBJ_VRAM0 + 0x680 + gSprites[gHealthboxSpriteIds[i]].oam.tileNum * TILE_SIZE_4BPP),
                             1 * TILE_SIZE_4BPP);
                }
            }
            else
            {
                if (noBars == TRUE) // bars to text
                {
                    if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
                    {
                        // Most likely a debug function.
                        PrintSafariMonInfo(gHealthboxSpriteIds[i], &gEnemyParty[gBattlerPartyIndexes[i]]);
                    }
                    else
                    {
                        healthBarSpriteId = gSprites[gHealthboxSpriteIds[i]].sHealthBarSpriteId;

                        CpuFill32(0, (void *)(OBJ_VRAM0 + gSprites[healthBarSpriteId].oam.tileNum * 32), 8 * TILE_SIZE_4BPP);
                        UpdateHpTextInHealthboxInDoubles(gHealthboxSpriteIds[i], GetMonData(&gEnemyParty[gBattlerPartyIndexes[i]], MON_DATA_HP), HP_CURRENT);
                        UpdateHpTextInHealthboxInDoubles(gHealthboxSpriteIds[i], GetMonData(&gEnemyParty[gBattlerPartyIndexes[i]], MON_DATA_MAX_HP), HP_MAX);
                    }
                }
                else // text to bars
                {
                    UpdateStatusIconInHealthbox(gHealthboxSpriteIds[i]);
                    UpdateHealthboxAttribute(gHealthboxSpriteIds[i], &gEnemyParty[gBattlerPartyIndexes[i]], HEALTHBOX_HEALTH_BAR);
                    if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
                        UpdateHealthboxAttribute(gHealthboxSpriteIds[i], &gEnemyParty[gBattlerPartyIndexes[i]], HEALTHBOX_NICK);
                }
            }
            gSprites[gHealthboxSpriteIds[i]].data[7] ^= 1;
        }
    }
}

#define tBattler                data[0]
#define tSummaryBarSpriteId     data[1]
#define tBallIconSpriteId(n)    data[3 + n]
#define tIsBattleStart          data[10]
#define tTimer                  data[11]
#define tBlendWeight            data[15]

// sprite data for party summary bar
#define sEnterSpeed             data[0]
#define sExitSpeed              data[1]

// sprite data for party summary ball icon
#define sSummaryBarSpriteId     data[0]
#define sTimer                  data[1]
#define sIsOpponent             data[2]
#define sSpeed                  data[3]
#define sIsEmptyBall            data[7]

u8 CreatePartyStatusSummarySprites(u8 battlerId, struct HpAndStatus *partyInfo, bool8 isSwitchingMons, bool8 isBattleStart)
{
    bool8 isOpponent;
    s8 nValidMons;
    s16 x, y, x2, speed;
    s32 i;
    u8 summaryBarSpriteId;
    u8 ballIconSpritesIds[PARTY_SIZE];
    u8 taskId;

    if (!isSwitchingMons || GetBattlerPosition(battlerId) != B_POSITION_OPPONENT_RIGHT)
    {
        if (GetBattlerSide(battlerId) == B_SIDE_PLAYER)
        {
            isOpponent = FALSE;
            x = 136, y = 96;
            x2 = 100;
            speed = -5;
        }
        else
        {
            isOpponent = TRUE;

            if (!isSwitchingMons || !IsDoubleBattle())
                x = 104, y = 40;
            else
                x = 104, y = 16;

            x2 = -100;
            speed = 5;
        }
    }
    else
    {
        isOpponent = TRUE;
        x = 104, y = 40;
        x2 = -100;
        speed = 5;
    }

    for (i = 0, nValidMons = 0; i < PARTY_SIZE; i++)
    {
        if (partyInfo[i].hp != HP_EMPTY_SLOT)
            nValidMons++;
    }

    LoadCompressedSpriteSheetUsingHeap(&sPartySummaryBarSpriteSheets[isOpponent]);
    LoadSpriteSheet(&sPartySummaryBallSpriteSheets[isOpponent]);
    LoadSpritePalette(&sPartySummaryBarSpritePals[isOpponent]);
    LoadSpritePalette(&sPartySummaryBallSpritePals[isOpponent]);

    summaryBarSpriteId = CreateSprite(&sPartySummaryBarSpriteTemplates[isOpponent], x, y, 10);
    SetSubspriteTables(&gSprites[summaryBarSpriteId], sStatusSummaryBar_SubspriteTable_Enter);
    gSprites[summaryBarSpriteId].x2 = x2;
    gSprites[summaryBarSpriteId].sEnterSpeed = speed;

    if (isOpponent)
    {
        gSprites[summaryBarSpriteId].x -= 96;
        gSprites[summaryBarSpriteId].oam.matrixNum = ST_OAM_HFLIP;
    }
    else
        gSprites[summaryBarSpriteId].x += 96;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        ballIconSpritesIds[i] = CreateSpriteAtEnd(&sPartySummaryBallSpriteTemplates[isOpponent], x, y - 4, 9);

        if (!isBattleStart)
            gSprites[ballIconSpritesIds[i]].callback = SpriteCB_PartySummaryBall_OnSwitchout;

        if (!isOpponent)
        {
            gSprites[ballIconSpritesIds[i]].x2 = 0;
            gSprites[ballIconSpritesIds[i]].y2 = 0;
        }

        gSprites[ballIconSpritesIds[i]].sSummaryBarSpriteId = summaryBarSpriteId;

        if (!isOpponent)
        {
            gSprites[ballIconSpritesIds[i]].x += 10 * i + 24;
            gSprites[ballIconSpritesIds[i]].sTimer = i * 7 + 10;
            gSprites[ballIconSpritesIds[i]].x2 = 120;
        }
        else
        {
            gSprites[ballIconSpritesIds[i]].x -= 10 * (5 - i) + 24;
            gSprites[ballIconSpritesIds[i]].sTimer = (6 - i) * 7 + 10;
            gSprites[ballIconSpritesIds[i]].x2 = -120;
        }

        gSprites[ballIconSpritesIds[i]].sIsOpponent = isOpponent;
    }

    if (GetBattlerSide(battlerId) == B_SIDE_PLAYER)
    {
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                if (partyInfo[i].hp == HP_EMPTY_SLOT) 
                {
                    gSprites[ballIconSpritesIds[i]].oam.tileNum += 1;
                    gSprites[ballIconSpritesIds[i]].sIsEmptyBall = TRUE;
                }
                else if (partyInfo[i].hp == 0)
                    gSprites[ballIconSpritesIds[i]].oam.tileNum += 3;
                else if (partyInfo[i].status != STATUS1_NONE)
                    gSprites[ballIconSpritesIds[i]].oam.tileNum += 2;
            }
            else
            {
                if (i >= nValidMons) 
                {
                    gSprites[ballIconSpritesIds[i]].oam.tileNum += 1;
                    gSprites[ballIconSpritesIds[i]].sIsEmptyBall = TRUE;
                }
                else if (partyInfo[i].hp == 0)
                    gSprites[ballIconSpritesIds[i]].oam.tileNum += 3;
                else if (partyInfo[i].status != STATUS1_NONE)
                    gSprites[ballIconSpritesIds[i]].oam.tileNum += 2;
            }
        }
    }
    else
    {
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                if (partyInfo[i].hp == HP_EMPTY_SLOT)
                {
                    gSprites[ballIconSpritesIds[5 - i]].oam.tileNum += 1;
                    gSprites[ballIconSpritesIds[5 - i]].sIsEmptyBall = TRUE;
                }
                else if (partyInfo[i].hp == 0)
                    gSprites[ballIconSpritesIds[5 - i]].oam.tileNum += 3;
                else if (partyInfo[i].status != STATUS1_NONE)
                    gSprites[ballIconSpritesIds[5 - i]].oam.tileNum += 2;
            }
            else
            {
                ballIconSpritesIds[5 - i] += 0;
                if (i >= nValidMons)
                {
                    gSprites[ballIconSpritesIds[5 - i]].oam.tileNum += 1;
                    gSprites[ballIconSpritesIds[5 - i]].sIsEmptyBall = TRUE;
                }
                else if (partyInfo[i].hp == 0)
                    gSprites[ballIconSpritesIds[5 - i]].oam.tileNum += 3;
                else if (partyInfo[i].status != STATUS1_NONE)
                {
                    do
                    {
                        gSprites[ballIconSpritesIds[5 - i]].oam.tileNum += 2;
                    } while (0);
                }
            }
            ballIconSpritesIds[5 - ++i] += 0; i--;
        }
    }

    taskId = CreateTask(TaskDummy, 5);
    gTasks[taskId].tBattler = battlerId;
    gTasks[taskId].tSummaryBarSpriteId = summaryBarSpriteId;

    for (i = 0; i < PARTY_SIZE; i++)
        gTasks[taskId].tBallIconSpriteId(i) = ballIconSpritesIds[i];

    gTasks[taskId].tIsBattleStart = isBattleStart;
    PlaySE12WithPanning(SE_BALL_TRAY_ENTER, 0);
    return taskId;
}

void Task_HidePartyStatusSummary(u8 taskId)
{
    u8 ballIconSpriteIds[PARTY_SIZE];
    bool8 isBattleStart;
    u8 summaryBarSpriteId;
    u8 battlerId;
    s32 i;

    isBattleStart = gTasks[taskId].tIsBattleStart;
    summaryBarSpriteId = gTasks[taskId].tSummaryBarSpriteId;
    battlerId = gTasks[taskId].tBattler;

    for (i = 0; i < PARTY_SIZE; i++)
        ballIconSpriteIds[i] = gTasks[taskId].tBallIconSpriteId(i);

    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT2_ALL | BLDCNT_EFFECT_BLEND);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(16, 0));

    gTasks[taskId].tBlendWeight = 16;

    for (i = 0; i < PARTY_SIZE; i++)
        gSprites[ballIconSpriteIds[i]].oam.objMode = ST_OAM_OBJ_BLEND;

    gSprites[summaryBarSpriteId].oam.objMode = ST_OAM_OBJ_BLEND;

    if (isBattleStart)
    {
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (GetBattlerSide(battlerId) != B_SIDE_PLAYER)
            {
                gSprites[ballIconSpriteIds[5 - i]].sTimer = 7 * i;
                gSprites[ballIconSpriteIds[5 - i]].sSpeed = 0;
                gSprites[ballIconSpriteIds[5 - i]].data[4] = 0;
                gSprites[ballIconSpriteIds[5 - i]].callback = SpriteCB_PartySummaryBall_Exit;
            }
            else
            {
                gSprites[ballIconSpriteIds[i]].sTimer = 7 * i;
                gSprites[ballIconSpriteIds[i]].sSpeed = 0;
                gSprites[ballIconSpriteIds[i]].data[4] = 0;
                gSprites[ballIconSpriteIds[i]].callback = SpriteCB_PartySummaryBall_Exit;
            }
        }
        gSprites[summaryBarSpriteId].sEnterSpeed /= 2;
        gSprites[summaryBarSpriteId].sExitSpeed = 0;
        gSprites[summaryBarSpriteId].callback = SpriteCB_PartySummaryBar_Exit;
        SetSubspriteTables(&gSprites[summaryBarSpriteId], sStatusSummaryBar_SubspriteTable_Exit);
        gTasks[taskId].func = Task_HidePartyStatusSummary_BattleStart_1;
    }
    else
        gTasks[taskId].func = Task_HidePartyStatusSummary_DuringBattle;

}

static void Task_HidePartyStatusSummary_BattleStart_1(u8 taskId)
{
    if ((gTasks[taskId].tTimer++ % 2) == 0)
    {
        if (--gTasks[taskId].tBlendWeight < 0)
            return;

        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(gTasks[taskId].tBlendWeight, 16 - gTasks[taskId].tBlendWeight));
    }
    if (gTasks[taskId].tBlendWeight == 0)
        gTasks[taskId].func = Task_HidePartyStatusSummary_BattleStart_2;
}

static void Task_HidePartyStatusSummary_BattleStart_2(u8 taskId)
{
    u8 ballIconSpriteIds[PARTY_SIZE];
    s32 i;

    u8 battlerId = gTasks[taskId].tBattler;
    if (--gTasks[taskId].tBlendWeight == -1)
    {
        u8 summaryBarSpriteId = gTasks[taskId].tSummaryBarSpriteId;

        for (i = 0; i < PARTY_SIZE; i++)
            ballIconSpriteIds[i] = gTasks[taskId].tBallIconSpriteId(i);

        DestroySpriteAndFreeResources(&gSprites[summaryBarSpriteId]);
        DestroySpriteAndFreeResources(&gSprites[ballIconSpriteIds[0]]);

        for (i = 1; i < PARTY_SIZE; i++)
            DestroySprite(&gSprites[ballIconSpriteIds[i]]);
    }
    else if (gTasks[taskId].tBlendWeight == -3)
    {
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        DestroyTask(taskId);
    }
}

static void Task_HidePartyStatusSummary_DuringBattle(u8 taskId)
{
    u8 ballIconSpriteIds[PARTY_SIZE];
    s32 i;
    u8 battlerId = gTasks[taskId].tBattler;

    if (--gTasks[taskId].tBlendWeight >= 0)
        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(gTasks[taskId].tBlendWeight, 16 - gTasks[taskId].tBlendWeight));
    else if (gTasks[taskId].tBlendWeight == -1)
    {
        u8 summaryBarSpriteId = gTasks[taskId].tSummaryBarSpriteId;

        for (i = 0; i < PARTY_SIZE; i++)
            ballIconSpriteIds[i] = gTasks[taskId].tBallIconSpriteId(i);

        DestroySpriteAndFreeResources(&gSprites[summaryBarSpriteId]);
        DestroySpriteAndFreeResources(&gSprites[ballIconSpriteIds[0]]);

        for (i = 1; i < PARTY_SIZE; i++)
            DestroySprite(&gSprites[ballIconSpriteIds[i]]);
    }
    else if (gTasks[taskId].tBlendWeight == -3)
    {
        SetGpuReg(REG_OFFSET_BLDCNT, 0);
        SetGpuReg(REG_OFFSET_BLDALPHA, 0);
        DestroyTask(taskId);
    }
}

#undef tBattler
#undef tSummaryBarSpriteId
#undef tBallIconSpriteId
#undef tIsBattleStart
#undef tBlendWeight

static void SpriteCB_PartySummaryBar(struct Sprite *sprite)
{
    if (sprite->x2 != 0)
        sprite->x2 += sprite->sEnterSpeed;
}

static void SpriteCB_PartySummaryBar_Exit(struct Sprite *sprite)
{
    sprite->sExitSpeed += 32;
    if (sprite->sEnterSpeed > 0)
        sprite->x2 += sprite->sExitSpeed >> 4;
    else
        sprite->x2 -= sprite->sExitSpeed >> 4;
    sprite->sExitSpeed &= 0xF;
}

static void SpriteCB_PartySummaryBall_OnBattleStart(struct Sprite *sprite)
{
    bool8 isOpponent;
    u16 speed;

    if (sprite->sTimer > 0)
    {
        sprite->sTimer--;
        return;
    }

    isOpponent = sprite->sIsOpponent;
    speed = sprite->sSpeed;
    speed += 56;
    sprite->sSpeed = speed & 0xFFF0;

    if (isOpponent != FALSE)
    {
        sprite->x2 += speed / 16;
        if (sprite->x2 > 0)
            sprite->x2 = 0;
    }
    else
    {
        sprite->x2 -= speed / 16;
        if (sprite->x2 < 0)
            sprite->x2 = 0;
    }

    if (sprite->x2 == 0)
    {
        s8 pan = isOpponent ? SOUND_PAN_ATTACKER : SOUND_PAN_TARGET;
        if (sprite->sIsEmptyBall != FALSE)
            PlaySE2WithPanning(SE_BALL_TRAY_EXIT, pan);
        else
            PlaySE1WithPanning(SE_BALL_TRAY_BALL, pan);

        sprite->callback = SpriteCallbackDummy;
    }
}

static void SpriteCB_PartySummaryBall_Exit(struct Sprite *sprite)
{
    bool8 isOpponent;
    u16 speed;

    if (sprite->sTimer > 0)
    {
        sprite->sTimer--;
        return;
    }
    isOpponent = sprite->sIsOpponent;
    speed = sprite->sSpeed;
    speed += 56;
    sprite->sSpeed = speed & 0xFFF0;
    if (isOpponent != FALSE)
        sprite->x2 += speed / 16;
    else
        sprite->x2 -= speed / 16;

    if (sprite->x2 + sprite->x > DISPLAY_WIDTH + 8 || sprite->x2 + sprite->x < -8)
    {
        sprite->invisible = TRUE;
        sprite->callback = SpriteCallbackDummy;
    }
}

static void SpriteCB_PartySummaryBall_OnSwitchout(struct Sprite *sprite)
{
    u8 summaryBarSpriteId = sprite->sSummaryBarSpriteId;

    sprite->x2 = gSprites[summaryBarSpriteId].x2;
    sprite->y2 = gSprites[summaryBarSpriteId].y2;
}


#undef sSummaryBarSpriteId
#undef sTimer
#undef sIsOpponent
#undef sSpeed
#undef sIsEmptyBall

#undef sEnterSpeed
#undef sExitSpeed

static const u8 sText_HealthboxNickname[] = _("{HIGHLIGHT 02}");

void UpdateNickInHealthbox(u8 healthboxSpriteId, struct Pokemon *mon)
{
    u8 nickname[POKEMON_NAME_LENGTH + 1];
    u8 *ptr;
    u32 windowId, spriteTileNum;
    u8 *windowTileData;
    u16 species;
    u8 gender;

    ptr = StringCopy(gDisplayedStringBattle, sText_HealthboxNickname);
    GetMonData(mon, MON_DATA_NICKNAME, nickname);
    StringGet_Nickname(nickname);
    ptr = StringCopy(ptr, nickname);
    *ptr++ = EXT_CTRL_CODE_BEGIN;
    *ptr++ = EXT_CTRL_CODE_COLOR;

    gender = GetMonGender(mon);
    species = GetMonData(mon, MON_DATA_SPECIES);

    if ((species == SPECIES_NIDORAN_F || species == SPECIES_NIDORAN_M) && StringCompare(nickname, gSpeciesNames[species]) == 0)
        gender = 100;

    if (CheckBattleTypeGhost(mon, gSprites[healthboxSpriteId].sBattlerId))
        gender = 100;

    // AddTextPrinterAndCreateWindowOnHealthbox's arguments are the same in all 3 cases.
    // It's possible they may have been different in early development phases.
    switch (gender)
    {
    default:
        *ptr++ = TEXT_DYNAMIC_COLOR_2;
        *ptr++ = EOS;
        windowTileData = AddTextPrinterAndCreateWindowOnHealthbox(gDisplayedStringBattle, 0, 3, &windowId);
        break;
    case MON_MALE:
        *ptr++ = TEXT_DYNAMIC_COLOR_2;
        *ptr++ = CHAR_MALE;
        *ptr++ = EOS;
        windowTileData = AddTextPrinterAndCreateWindowOnHealthbox(gDisplayedStringBattle, 0, 3, &windowId);
        break;
    case MON_FEMALE:
        *ptr++ = TEXT_DYNAMIC_COLOR_1;
        *ptr++ = CHAR_FEMALE;
        *ptr++ = EOS;
        windowTileData = AddTextPrinterAndCreateWindowOnHealthbox(gDisplayedStringBattle, 0, 3, &windowId);
        break;
    }

    spriteTileNum = gSprites[healthboxSpriteId].oam.tileNum * TILE_SIZE_4BPP;

    if (GetBattlerSide(gSprites[healthboxSpriteId].sBattlerId) == B_SIDE_PLAYER)
    {
        TextIntoHealthboxObject((void *)(OBJ_VRAM0 + 0x40 + spriteTileNum), windowTileData, 6);
        ptr = (void *)(OBJ_VRAM0);
        if (!IsDoubleBattle())
            ptr += spriteTileNum + 0x800;
        else
            ptr += spriteTileNum + 0x400;

        TextIntoHealthboxObject(ptr, windowTileData + 0xC0, 1);
    }
    else
        TextIntoHealthboxObject((void *)(OBJ_VRAM0 + 0x20 + spriteTileNum), windowTileData, 7);

    RemoveWindowOnHealthbox(windowId);
}

void TryAddPokeballIconToHealthbox(u8 healthboxSpriteId, bool8 noStatus)
{
    u8 battlerId, healthBarSpriteId;

    if (gBattleTypeFlags & (BATTLE_TYPE_FIRST_BATTLE | BATTLE_TYPE_OLD_MAN_TUTORIAL | BATTLE_TYPE_POKEDUDE))
        return;

    if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
        return;

    battlerId = gSprites[healthboxSpriteId].sBattlerId;
    if (GetBattlerSide(battlerId) == B_SIDE_PLAYER)
        return;
    if (CheckBattleTypeGhost(&gEnemyParty[gBattlerPartyIndexes[battlerId]], battlerId))
        return;
    if (!GetSetPokedexFlag(SpeciesToNationalPokedexNum(GetMonData(&gEnemyParty[gBattlerPartyIndexes[battlerId]], MON_DATA_SPECIES)), FLAG_GET_CAUGHT))
        return;

    healthBarSpriteId = gSprites[healthboxSpriteId].sHealthBarSpriteId;

    if (noStatus)
        CpuCopy32(GetBattleInterfaceGfxPtr(B_INTERFACE_GFX_BALL_CAUGHT), (void *)(OBJ_VRAM0 + (gSprites[healthBarSpriteId].oam.tileNum + 8) * TILE_SIZE_4BPP), 1 * TILE_SIZE_4BPP);
    else
        CpuFill32(0, (void *)(OBJ_VRAM0 + (gSprites[healthBarSpriteId].oam.tileNum + 8) * TILE_SIZE_4BPP), 1 * TILE_SIZE_4BPP);
}

enum
{
    PAL_STATUS_PSN,
    PAL_STATUS_PAR,
    PAL_STATUS_SLP,
    PAL_STATUS_FRZ,
    PAL_STATUS_BRN
};

static const u16 sStatusIconColors[] = {
    [PAL_STATUS_PSN] = RGB(24, 12, 24),
    [PAL_STATUS_PAR] = RGB(23, 23, 3),
    [PAL_STATUS_SLP] = RGB(20, 20, 17),
    [PAL_STATUS_FRZ] = RGB(17, 22, 28),
    [PAL_STATUS_BRN] = RGB(28, 14, 10)
};

static void UpdateStatusIconInHealthbox(u8 healthboxSpriteId)
{
    s32 i;
    u8 battlerId, healthBarSpriteId;
    u32 status, pltAdder;
    const u8 *statusGfxPtr;
    s16 tileNumAdder;
    u8 statusPalId;

    battlerId = gSprites[healthboxSpriteId].sBattlerId;
    healthBarSpriteId = gSprites[healthboxSpriteId].sHealthBarSpriteId;
    if (GetBattlerSide(battlerId) == B_SIDE_PLAYER)
    {
        status = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battlerId]], MON_DATA_STATUS);
        if (!IsDoubleBattle())
            tileNumAdder = 0x1A;
        else
            tileNumAdder = 0x12;
    }
    else
    {
        status = GetMonData(&gEnemyParty[gBattlerPartyIndexes[battlerId]], MON_DATA_STATUS);
        tileNumAdder = 0x11;
    }

    if (status & STATUS1_SLEEP)
    {
        statusGfxPtr = GetBattleInterfaceGfxPtr(GetStatusIconForBattlerId(B_INTERFACE_GFX_STATUS_SLP_BATTLER0, battlerId));
        statusPalId = PAL_STATUS_SLP;
    }
    else if (status & STATUS1_PSN_ANY)
    {
        statusGfxPtr = GetBattleInterfaceGfxPtr(GetStatusIconForBattlerId(B_INTERFACE_GFX_STATUS_PSN_BATTLER0, battlerId));
        statusPalId = PAL_STATUS_PSN;
    }
    else if (status & STATUS1_BURN)
    {
        statusGfxPtr = GetBattleInterfaceGfxPtr(GetStatusIconForBattlerId(B_INTERFACE_GFX_STATUS_BRN_BATTLER0, battlerId));
        statusPalId = PAL_STATUS_BRN;
    }
    else if (status & STATUS1_FREEZE)
    {
        statusGfxPtr = GetBattleInterfaceGfxPtr(GetStatusIconForBattlerId(B_INTERFACE_GFX_STATUS_FRZ_BATTLER0, battlerId));
        statusPalId = PAL_STATUS_FRZ;
    }
    else if (status & STATUS1_PARALYSIS)
    {
        statusGfxPtr = GetBattleInterfaceGfxPtr(GetStatusIconForBattlerId(B_INTERFACE_GFX_STATUS_PAR_BATTLER0, battlerId));
        statusPalId = PAL_STATUS_PAR;
    }
    else
    {
        statusGfxPtr = GetBattleInterfaceGfxPtr(B_INTERFACE_GFX_STATUS_NONE);

        for (i = 0; i < 3; i++)
            CpuCopy32(statusGfxPtr,
                      (void *)(OBJ_VRAM0 + (gSprites[healthboxSpriteId].oam.tileNum + tileNumAdder + i) * TILE_SIZE_4BPP),
                      1 * TILE_SIZE_4BPP);

        if (!gBattleSpritesDataPtr->battlerData[battlerId].hpNumbersNoBars)
            CpuCopy32(GetBattleInterfaceGfxPtr(B_INTERFACE_GFX_HP_BAR_HP_TEXT),
                      (void *)(OBJ_VRAM0 + gSprites[healthBarSpriteId].oam.tileNum * TILE_SIZE_4BPP),
                      2 * TILE_SIZE_4BPP);

        TryAddPokeballIconToHealthbox(healthboxSpriteId, TRUE);
        return;
    }

    pltAdder = PLTT_ID(gSprites[healthboxSpriteId].oam.paletteNum);
    pltAdder += battlerId + 12;

    FillPalette(sStatusIconColors[statusPalId], pltAdder + OBJ_PLTT_OFFSET, PLTT_SIZEOF(1));
    CpuCopy16(&gPlttBufferUnfaded[OBJ_PLTT_OFFSET + pltAdder], (u16 *)OBJ_PLTT + pltAdder, PLTT_SIZEOF(1));
    CpuCopy32(statusGfxPtr, (void *)(OBJ_VRAM0 + (gSprites[healthboxSpriteId].oam.tileNum + tileNumAdder) * TILE_SIZE_4BPP), 3 * TILE_SIZE_4BPP);
    if (IsDoubleBattle() == TRUE || GetBattlerSide(battlerId) == B_SIDE_OPPONENT)
    {
        if (!gBattleSpritesDataPtr->battlerData[battlerId].hpNumbersNoBars)
        {
            CpuCopy32(GetBattleInterfaceGfxPtr(B_INTERFACE_GFX_TRANSPARENT),
                     (void *)(OBJ_VRAM0 + gSprites[healthBarSpriteId].oam.tileNum * TILE_SIZE_4BPP),
                     1 * TILE_SIZE_4BPP);
            CpuCopy32(GetBattleInterfaceGfxPtr(B_INTERFACE_GFX_HP_BAR_LEFT_BORDER),
                     (void *)(OBJ_VRAM0 + (gSprites[healthBarSpriteId].oam.tileNum + 1) * TILE_SIZE_4BPP),
                     1 * TILE_SIZE_4BPP);
        }
    }
    TryAddPokeballIconToHealthbox(healthboxSpriteId, FALSE);
}

static u8 GetStatusIconForBattlerId(u8 statusElementId, u8 battlerId)
{
    u8 ret = statusElementId;

    switch (statusElementId)
    {
    case B_INTERFACE_GFX_STATUS_PSN_BATTLER0:
        if (battlerId == 0)
            ret = B_INTERFACE_GFX_STATUS_PSN_BATTLER0;
        else if (battlerId == 1)
            ret = B_INTERFACE_GFX_STATUS_PSN_BATTLER1;
        else if (battlerId == 2)
            ret = B_INTERFACE_GFX_STATUS_PSN_BATTLER2;
        else
            ret = B_INTERFACE_GFX_STATUS_PSN_BATTLER3;
        break;
    case B_INTERFACE_GFX_STATUS_PAR_BATTLER0:
        if (battlerId == 0)
            ret = B_INTERFACE_GFX_STATUS_PAR_BATTLER0;
        else if (battlerId == 1)
            ret = B_INTERFACE_GFX_STATUS_PAR_BATTLER1;
        else if (battlerId == 2)
            ret = B_INTERFACE_GFX_STATUS_PAR_BATTLER2;
        else
            ret = B_INTERFACE_GFX_STATUS_PAR_BATTLER3;
        break;
    case B_INTERFACE_GFX_STATUS_SLP_BATTLER0:
        if (battlerId == 0)
            ret = B_INTERFACE_GFX_STATUS_SLP_BATTLER0;
        else if (battlerId == 1)
            ret = B_INTERFACE_GFX_STATUS_SLP_BATTLER1;
        else if (battlerId == 2)
            ret = B_INTERFACE_GFX_STATUS_SLP_BATTLER2;
        else
            ret = B_INTERFACE_GFX_STATUS_SLP_BATTLER3;
        break;
    case B_INTERFACE_GFX_STATUS_FRZ_BATTLER0:
        if (battlerId == 0)
            ret = B_INTERFACE_GFX_STATUS_FRZ_BATTLER0;
        else if (battlerId == 1)
            ret = B_INTERFACE_GFX_STATUS_FRZ_BATTLER1;
        else if (battlerId == 2)
            ret = B_INTERFACE_GFX_STATUS_FRZ_BATTLER2;
        else
            ret = B_INTERFACE_GFX_STATUS_FRZ_BATTLER3;
        break;
    case B_INTERFACE_GFX_STATUS_BRN_BATTLER0:
        if (battlerId == 0)
            ret = B_INTERFACE_GFX_STATUS_BRN_BATTLER0;
        else if (battlerId == 1)
            ret = B_INTERFACE_GFX_STATUS_BRN_BATTLER1;
        else if (battlerId == 2)
            ret = B_INTERFACE_GFX_STATUS_BRN_BATTLER2;
        else
            ret = B_INTERFACE_GFX_STATUS_BRN_BATTLER3;
        break;
    }
    return ret;
}

static void UpdateSafariBallsTextOnHealthbox(u8 healthboxSpriteId)
{
    u32 windowId, spriteTileNum;
    u8 *windowTileData;

    windowTileData = AddTextPrinterAndCreateWindowOnHealthbox(gText_SafariBalls, 0, 3, &windowId);
    spriteTileNum = gSprites[healthboxSpriteId].oam.tileNum * TILE_SIZE_4BPP;
    TextIntoHealthboxObject((void *)(OBJ_VRAM0 + 0x40) + spriteTileNum, windowTileData, 6);
    TextIntoHealthboxObject((void *)(OBJ_VRAM0 + 0x800) + spriteTileNum, windowTileData + 0xC0, 2);
    RemoveWindowOnHealthbox(windowId);
}

static void UpdateLeftNoOfBallsTextOnHealthbox(u8 healthboxSpriteId)
{
    u8 text[16];
    u8 *txtPtr;
    u32 windowId, spriteTileNum;
    u8 *windowTileData;

    txtPtr = StringCopy(text, gText_HighlightRed_Left);
    ConvertIntToDecimalStringN(txtPtr, gNumSafariBalls, STR_CONV_MODE_LEFT_ALIGN, 2);

    windowTileData = AddTextPrinterAndCreateWindowOnHealthbox(text, 47 - GetStringWidth(FONT_SMALL, text, 0), 3, &windowId);
    spriteTileNum = gSprites[healthboxSpriteId].oam.tileNum * TILE_SIZE_4BPP;
    SafariTextIntoHealthboxObject((void *)(OBJ_VRAM0 + 0x2C0) + spriteTileNum, windowTileData, 2);
    SafariTextIntoHealthboxObject((void *)(OBJ_VRAM0 + 0xA00) + spriteTileNum, windowTileData + 0x40, 4);
    RemoveWindowOnHealthbox(windowId);
}

void UpdateHealthboxAttribute(u8 healthboxSpriteId, struct Pokemon *mon, u8 elementId)
{
    s32 maxHp, currHp;
    u8 battlerId = gSprites[healthboxSpriteId].sBattlerId;

    if (elementId == HEALTHBOX_ALL && !IsDoubleBattle())
        GetBattlerSide(battlerId); // Pointless function call.

    if (GetBattlerSide(gSprites[healthboxSpriteId].sBattlerId) == B_SIDE_PLAYER)
    {
        u8 isDoubles;

        if (elementId == HEALTHBOX_LEVEL || elementId == HEALTHBOX_ALL)
            UpdateLvlInHealthbox(healthboxSpriteId, GetMonData(mon, MON_DATA_LEVEL));
        if (elementId == HEALTHBOX_CURRENT_HP || elementId == HEALTHBOX_ALL)
            UpdateHpTextInHealthbox(healthboxSpriteId, GetMonData(mon, MON_DATA_HP), HP_CURRENT);
        if (elementId == HEALTHBOX_MAX_HP || elementId == HEALTHBOX_ALL)
            UpdateHpTextInHealthbox(healthboxSpriteId, GetMonData(mon, MON_DATA_MAX_HP), HP_MAX);
        if (elementId == HEALTHBOX_HEALTH_BAR || elementId == HEALTHBOX_ALL)
        {
            LoadBattleBarGfx(0);
            maxHp = GetMonData(mon, MON_DATA_MAX_HP);
            currHp = GetMonData(mon, MON_DATA_HP);
            SetBattleBarStruct(battlerId, healthboxSpriteId, maxHp, currHp, 0);
            MoveBattleBar(battlerId, healthboxSpriteId, HEALTH_BAR, 0);
        }
        isDoubles = IsDoubleBattle();
        if (!isDoubles && (elementId == HEALTHBOX_EXP_BAR || elementId == HEALTHBOX_ALL))
        {
            u16 species;
            u32 exp, currLevelExp;
            s32 currExpBarValue, maxExpBarValue;
            u8 level;

            LoadBattleBarGfx(3);
            species = GetMonData(mon, MON_DATA_SPECIES);
            level = GetMonData(mon, MON_DATA_LEVEL);
            exp = GetMonData(mon, MON_DATA_EXP);
            currLevelExp = gExperienceTables[gSpeciesInfo[species].growthRate][level];
            currExpBarValue = exp - currLevelExp;
            maxExpBarValue = gExperienceTables[gSpeciesInfo[species].growthRate][level + 1] - currLevelExp;
            SetBattleBarStruct(battlerId, healthboxSpriteId, maxExpBarValue, currExpBarValue, isDoubles);
            MoveBattleBar(battlerId, healthboxSpriteId, EXP_BAR, 0);
        }
        if (elementId == HEALTHBOX_NICK || elementId == HEALTHBOX_ALL)
            UpdateNickInHealthbox(healthboxSpriteId, mon);
        if (elementId == HEALTHBOX_STATUS_ICON || elementId == HEALTHBOX_ALL)
            UpdateStatusIconInHealthbox(healthboxSpriteId);
        if (elementId == HEALTHBOX_SAFARI_ALL_TEXT)
            UpdateSafariBallsTextOnHealthbox(healthboxSpriteId);
        if (elementId == HEALTHBOX_SAFARI_ALL_TEXT || elementId == HEALTHBOX_SAFARI_BALLS_TEXT)
            UpdateLeftNoOfBallsTextOnHealthbox(healthboxSpriteId);
    }
    else
    {
        if (elementId == HEALTHBOX_LEVEL || elementId == HEALTHBOX_ALL)
            UpdateLvlInHealthbox(healthboxSpriteId, GetMonData(mon, MON_DATA_LEVEL));
        if (elementId == HEALTHBOX_HEALTH_BAR || elementId == HEALTHBOX_ALL)
        {
            LoadBattleBarGfx(0);
            maxHp = GetMonData(mon, MON_DATA_MAX_HP);
            currHp = GetMonData(mon, MON_DATA_HP);
            SetBattleBarStruct(battlerId, healthboxSpriteId, maxHp, currHp, 0);
            MoveBattleBar(battlerId, healthboxSpriteId, HEALTH_BAR, 0);
        }
        if (elementId == HEALTHBOX_NICK || elementId == HEALTHBOX_ALL)
            UpdateNickInHealthbox(healthboxSpriteId, mon);
        if (elementId == HEALTHBOX_STATUS_ICON || elementId == HEALTHBOX_ALL)
            UpdateStatusIconInHealthbox(healthboxSpriteId);
    }
}

#define B_HEALTHBAR_NUM_PIXELS 48
#define B_HEALTHBAR_NUM_TILES  (B_HEALTHBAR_NUM_PIXELS / 8)
#define B_EXPBAR_NUM_PIXELS    64
#define B_EXPBAR_NUM_TILES     (B_EXPBAR_NUM_PIXELS / 8)

s32 MoveBattleBar(u8 battlerId, u8 healthboxSpriteId, u8 whichBar, u8 unused)
{
    s32 currentBarValue;

    if (whichBar == HEALTH_BAR)
    {
        currentBarValue = CalcNewBarValue(gBattleSpritesDataPtr->battleBars[battlerId].maxValue,
                                          gBattleSpritesDataPtr->battleBars[battlerId].oldValue,
                                          gBattleSpritesDataPtr->battleBars[battlerId].receivedValue,
                                          &gBattleSpritesDataPtr->battleBars[battlerId].currValue,
                                          B_HEALTHBAR_NUM_TILES,
                                          1);
    }
    else // exp bar
    {
        u16 increment = GetReceivedValueInPixels(gBattleSpritesDataPtr->battleBars[battlerId].oldValue,
                                                   gBattleSpritesDataPtr->battleBars[battlerId].receivedValue,
                                                   gBattleSpritesDataPtr->battleBars[battlerId].maxValue,
                                                   B_EXPBAR_NUM_TILES);

        if (increment == 0)
            increment = 1;
        increment = abs(gBattleSpritesDataPtr->battleBars[battlerId].receivedValue / increment);

        currentBarValue = CalcNewBarValue(gBattleSpritesDataPtr->battleBars[battlerId].maxValue,
                                          gBattleSpritesDataPtr->battleBars[battlerId].oldValue,
                                          gBattleSpritesDataPtr->battleBars[battlerId].receivedValue,
                                          &gBattleSpritesDataPtr->battleBars[battlerId].currValue,
                                          B_EXPBAR_NUM_TILES,
                                          increment);
    }

    if (whichBar == EXP_BAR || (whichBar == HEALTH_BAR && !gBattleSpritesDataPtr->battlerData[battlerId].hpNumbersNoBars))
        MoveBattleBarGraphically(battlerId, whichBar);

    if (currentBarValue == -1)
        gBattleSpritesDataPtr->battleBars[battlerId].currValue = 0;

    return currentBarValue;
}

static void MoveBattleBarGraphically(u8 battlerId, u8 whichBar)
{
    u8 filledPixels[B_HEALTHBAR_NUM_TILES > B_EXPBAR_NUM_TILES ? B_HEALTHBAR_NUM_TILES : B_EXPBAR_NUM_TILES];
    u8 totalFilledPixels, level;
    u8 barElementId;
    u8 i;

    switch (whichBar)
    {
    case HEALTH_BAR:
        totalFilledPixels = CalcBarFilledPixels(gBattleSpritesDataPtr->battleBars[battlerId].maxValue,
                                                gBattleSpritesDataPtr->battleBars[battlerId].oldValue,
                                                gBattleSpritesDataPtr->battleBars[battlerId].receivedValue,
                                                &gBattleSpritesDataPtr->battleBars[battlerId].currValue,
                                                filledPixels,
                                                B_HEALTHBAR_NUM_TILES);

        if (totalFilledPixels > (B_HEALTHBAR_NUM_PIXELS * 50 / 100)) // more than 50 % hp
            barElementId = B_INTERFACE_GFX_HP_BAR_GREEN;
        else if (totalFilledPixels > (B_HEALTHBAR_NUM_PIXELS * 20 / 100)) // more than 20% hp
            barElementId = B_INTERFACE_GFX_HP_BAR_YELLOW;
        else
            barElementId = B_INTERFACE_GFX_HP_BAR_RED; // 20 % or less

        for (i = 0; i < B_HEALTHBAR_NUM_TILES; i++)
        {
            u8 healthbarSpriteId = gSprites[gBattleSpritesDataPtr->battleBars[battlerId].healthboxSpriteId].sHealthBarSpriteId;
            if (i < 2) // first 2 tiles are on left healthbar sprite
                CpuCopy32(GetBattleInterfaceGfxPtr(barElementId) + filledPixels[i] * TILE_SIZE_4BPP,
                          (void *)(OBJ_VRAM0 + (gSprites[healthbarSpriteId].oam.tileNum + 2 + i) * TILE_SIZE_4BPP), // + 2 here is due to B_INTERFACE_GFX_HP_BAR_HP_TEXT
                          1 * TILE_SIZE_4BPP);
            else // remaining 4 tiles are on right healthbar sprite
                CpuCopy32(GetBattleInterfaceGfxPtr(barElementId) + filledPixels[i] * TILE_SIZE_4BPP,
                          (void *)(OBJ_VRAM0 + 64 + (i + gSprites[healthbarSpriteId].oam.tileNum) * TILE_SIZE_4BPP),
                          1 * TILE_SIZE_4BPP);
        }
        break;
    case EXP_BAR:
        CalcBarFilledPixels(gBattleSpritesDataPtr->battleBars[battlerId].maxValue,
                            gBattleSpritesDataPtr->battleBars[battlerId].oldValue,
                            gBattleSpritesDataPtr->battleBars[battlerId].receivedValue,
                            &gBattleSpritesDataPtr->battleBars[battlerId].currValue,
                            filledPixels,
                            B_EXPBAR_NUM_TILES);
        level = GetMonData(&gPlayerParty[gBattlerPartyIndexes[battlerId]], MON_DATA_LEVEL);
        if (level == MAX_LEVEL)
        {
            for (i = 0; i < B_EXPBAR_NUM_TILES; i++)
                filledPixels[i] = 0;
        }
        for (i = 0; i < B_EXPBAR_NUM_TILES; i++)
        {
            if (i < 4) // first 4 tiles are on left healthbox sprite
                CpuCopy32(GetBattleInterfaceGfxPtr(B_INTERFACE_GFX_EXP_BAR) + filledPixels[i] * TILE_SIZE_4BPP,
                          (void *)(OBJ_VRAM0 + (gSprites[gBattleSpritesDataPtr->battleBars[battlerId].healthboxSpriteId].oam.tileNum + 36 + i) * TILE_SIZE_4BPP),
                          1 * TILE_SIZE_4BPP);
            else // remaining 4 tiles are on right healthbox sprite
                CpuCopy32(GetBattleInterfaceGfxPtr(B_INTERFACE_GFX_EXP_BAR) + filledPixels[i] * TILE_SIZE_4BPP,
                          (void *)(OBJ_VRAM0 + 0xB80 + (i + gSprites[gBattleSpritesDataPtr->battleBars[battlerId].healthboxSpriteId].oam.tileNum) * TILE_SIZE_4BPP),
                          1 * TILE_SIZE_4BPP);
        }
        break;
    }
}

static s32 CalcNewBarValue(s32 maxValue, s32 oldValue, s32 receivedValue, s32 *currValue, u8 totalPixels, u16 increment)
{
    s32 ret, newValue;
    totalPixels *= 8;

    if (*currValue == -32768) // first function call
    {
        if (maxValue < totalPixels)
            *currValue = Q_24_8(oldValue);
        else
            *currValue = oldValue;
    }

    newValue = oldValue - receivedValue;
    if (newValue < 0)
        newValue = 0;
    else if (newValue > maxValue)
        newValue = maxValue;

    if (maxValue < totalPixels)
    {
        if (newValue == Q_24_8_TO_INT(*currValue) && (*currValue & 0xFF) == 0)
            return -1;
    }
    else
    {
        if (newValue == *currValue) // we're done, the bar's value has been updated
            return -1;
    }

    if (maxValue < totalPixels) // handle cases of max var having less pixels than the whole bar
    {
        s32 incrementInQ = Q_24_8(maxValue) / totalPixels;

        if (receivedValue < 0) // fill bar right
        {
            *currValue += incrementInQ;
            ret = Q_24_8_TO_INT(*currValue);
            if (ret >= newValue)
            {
                *currValue = Q_24_8(newValue);
                ret = newValue;
            }
        }
        else // move bar left
        {
            *currValue -= incrementInQ;
            ret = Q_24_8_TO_INT(*currValue);
            // try round up
            if ((*currValue & 0xFF) > 0)
                ret++;
            if (ret <= newValue)
            {
                *currValue = Q_24_8(newValue);
                ret = newValue;
            }
        }
    }
    else
    {
        if (receivedValue < 0) // fill bar right
        {
            *currValue += increment;
            if (*currValue > newValue)
                *currValue = newValue;
            ret = *currValue;
        }
        else // move bar left
        {
            *currValue -= increment;
            if (*currValue < newValue)
                *currValue = newValue;
            ret = *currValue;
        }
    }

    return ret;
}

static u8 CalcBarFilledPixels(s32 maxValue, s32 oldValue, s32 receivedValue, s32 *currValue, u8 *filledPixels, u8 numTiles)
{
    u8 numPixelsToFill, totalFilledPixels, totalPixels;
    u8 i;

    s32 newValue = oldValue - receivedValue;
    if (newValue < 0)
        newValue = 0;
    else if (newValue > maxValue)
        newValue = maxValue;

    totalPixels = numTiles * 8;

    for (i = 0; i < numTiles; i++)
        filledPixels[i] = 0;

    if (maxValue < totalPixels)
        numPixelsToFill = Q_24_8_TO_INT(*currValue * totalPixels / maxValue);
    else
        numPixelsToFill = *currValue * totalPixels / maxValue;

    totalFilledPixels = numPixelsToFill;

    if (numPixelsToFill == 0 && newValue > 0)
    {
        filledPixels[0] = 1;
        totalFilledPixels = 1;
    }
    else
    {
        for (i = 0; i < numTiles; i++)
        {
            if (numPixelsToFill >= 8) // too many to fill into a single tile
                filledPixels[i] = 8;
            else
            {
                filledPixels[i] = numPixelsToFill;
                break;
            }
            numPixelsToFill -= 8;
        }
    }

    return totalFilledPixels;
}

// Unused
// These functions seem as if they were made for testing the health bar.
static s16 UpdateAndDrawHealthbarOntoScreen(struct TestingBar *barInfo, s32 *currValue, u8 bg, u8 x, u8 y)
{
    s16 hpVal;

    hpVal = CalcNewBarValue(barInfo->maxValue,
                          barInfo->oldValue,
                          barInfo->receivedValue,
                          currValue,
                          B_HEALTHBAR_NUM_TILES,
                          1);

    DrawHealthbarOntoScreen(barInfo, currValue, bg, x, y);

    return hpVal;
}

// Unused
static s16 CalcNewHealthbarValue(struct TestingBar *barInfo, s32 *currValue)
{
    return CalcNewBarValue(barInfo->maxValue,
                          barInfo->oldValue,
                          barInfo->receivedValue,
                          currValue,
                          B_HEALTHBAR_NUM_TILES,
                          1);
}

// Unused
static void DoDrawHealthbarOntoScreen(struct TestingBar *barInfo, s32 *currValue, u8 bg, u8 x, u8 y)
{
    DrawHealthbarOntoScreen(barInfo, currValue, bg, x, y);
}

// Unused
static void DrawHealthbarOntoScreen(struct TestingBar *barInfo, s32 *currValue, u8 bg, u8 x, u8 y)
{
    u8 filledPixels[B_HEALTHBAR_NUM_TILES];
    u16 tiles[B_HEALTHBAR_NUM_TILES];
    u8 i;

    CalcBarFilledPixels(barInfo->maxValue,
                        barInfo->oldValue,
                        barInfo->receivedValue,
                        currValue,
                        filledPixels,
                        B_HEALTHBAR_NUM_TILES);

    for (i = 0; i < ARRAY_COUNT(tiles); i++)
        tiles[i] = (barInfo->pal << 12) | (barInfo->tileOffset + filledPixels[i]);

    CopyToBgTilemapBufferRect_ChangePalette(bg, tiles, x, y, 6, 1, 17);
}

static u8 GetReceivedValueInPixels(s32 oldValue, s32 receivedValue, s32 maxValue, u8 totalPixels)
{
    s32 newVal, result;
    s8 oldToMax, newToMax;

    totalPixels *= 8;
    newVal = oldValue - receivedValue;

    if (newVal < 0)
        newVal = 0;
    else if (newVal > maxValue)
        newVal = maxValue;

    oldToMax = oldValue * totalPixels / maxValue;
    newToMax = newVal * totalPixels / maxValue;
    result = oldToMax - newToMax;

    return abs(result);
}

u8 GetScaledHPFraction(s16 hp, s16 maxhp, u8 scale)
{
    u8 result = hp * scale / maxhp;

    if (result == 0 && hp > 0)
        return 1;

    return result;
}

u8 GetHPBarLevel(s16 hp, s16 maxhp)
{
    u8 result;

    if (hp == maxhp)
        result = HP_BAR_FULL;
    else
    {
        u8 fraction = GetScaledHPFraction(hp, maxhp, B_HEALTHBAR_NUM_PIXELS);
        if (fraction > (B_HEALTHBAR_NUM_PIXELS * 50 / 100))
            result = HP_BAR_GREEN;
        else if (fraction > (B_HEALTHBAR_NUM_PIXELS * 20 / 100))
            result = HP_BAR_YELLOW;
        else if (fraction > 0)
            result = HP_BAR_RED;
        else
            result = HP_BAR_EMPTY;
    }

    return result;
}

static const struct WindowTemplate sHealthboxWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 0,
    .tilemapTop = 0,
    .width = 8,
    .height = 2,
    .paletteNum = 0,
    .baseBlock = 0
};

static u8 *AddTextPrinterAndCreateWindowOnHealthbox(const u8 *str, u32 x, u32 y, u32 *windowId)
{
    u16 winId;
    u8 color[3];
    struct WindowTemplate winTemplate = sHealthboxWindowTemplate;

    winId = AddWindow(&winTemplate);
    FillWindowPixelBuffer(winId, PIXEL_FILL(2));

    color[0] = 2;
    color[1] = 1;
    color[2] = 3;

    AddTextPrinterParameterized4(winId, FONT_SMALL, x, y, 0, 0, color, -1, str);

    *windowId = winId;
    return (u8 *)(GetWindowAttribute(winId, WINDOW_TILE_DATA));
}

static void RemoveWindowOnHealthbox(u32 windowId)
{
    RemoveWindow(windowId);
}

static void TextIntoHealthboxObject(void *dest, u8 *windowTileData, s32 windowWidth)
{
    CpuCopy32(windowTileData + 256, dest + 256, windowWidth * TILE_SIZE_4BPP);
// + 256 as that prevents the top 4 blank rows of sHealthboxWindowTemplate from being copied
    if (windowWidth > 0)
    {
        do
        {
            CpuCopy32(windowTileData + 20, dest + 20, 12);
            dest += 32, windowTileData += 32;
            windowWidth--;
        } while (windowWidth != 0);
    }
}

static void SafariTextIntoHealthboxObject(void *dest, u8 *windowTileData, u32 windowWidth)
{
    CpuCopy32(windowTileData, dest, windowWidth * TILE_SIZE_4BPP);
    CpuCopy32(windowTileData + 256, dest + 256, windowWidth * TILE_SIZE_4BPP);
}
