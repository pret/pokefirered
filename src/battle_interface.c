#include "global.h"
#include "battle_anim.h"
#include "battle_interface.h"
#include "decompress.h"
#include "graphics.h"
#include "pokemon_summary_screen.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "text.h"
#include "window.h"
#include "constants/songs.h"

void SpriteCB_HealthBoxOther(struct Sprite * sprite);
void SpriteCB_HealthBar(struct Sprite * sprite);
const u8 *GetHealthboxElementGfxPtr(u8 which);
void UpdateHpTextInHealthboxInDoubles(u8 healthboxSpriteId, s16 value, u8 maxOrCurrent);
void SpriteCB_StatusSummaryBallsOnSwitchout(struct Sprite * sprite);
void UpdateStatusIconInHealthbox(u8 spriteId);
void SpriteCB_StatusSummaryBar(struct Sprite * sprite);
void SpriteCB_StatusSummaryBallsOnBattleStart(struct Sprite * sprite);
u8 *AddTextPrinterAndCreateWindowOnHealthbox(const u8 *str, u32 x, u32 y, u32 *windowId);
void RemoveWindowOnHealthbox(u32 windowId);
void TextIntoHealthboxObject(void *dest, u8 *windowTileData, s32 windowWidth);

const struct OamData gOamData_8260270 = {
    .shape = SPRITE_SHAPE(64x32),
    .size = SPRITE_SIZE(64x32),
    .priority = 1
};

const struct SpriteTemplate sHealthboxPlayerSpriteTemplates[] = {
    {
        .tileTag = 55039,
        .paletteTag = 55039,
        .oam = &gOamData_8260270,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy
    }, {
        .tileTag = 55040,
        .paletteTag = 55039,
        .oam = &gOamData_8260270,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy
    }
};

const struct SpriteTemplate sHealthboxOpponentSpriteTemplates[] = {
    {
        .tileTag = 55041,
        .paletteTag = 55039,
        .oam = &gOamData_8260270,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy
    }, {
        .tileTag = 55042,
        .paletteTag = 55039,
        .oam = &gOamData_8260270,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy
    }
};

const struct SpriteTemplate sHealthboxSafariSpriteTemplate =
{
    .tileTag = 55051,
    .paletteTag = 55039,
    .oam = &gOamData_8260270,
    .anims = gDummySpriteAnimTable,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct OamData gUnknown_82602F0 = {
    .shape = SPRITE_SHAPE(32x8),
    .size = SPRITE_SIZE(32x8),
    .priority = 1
};

const struct SpriteTemplate gUnknown_82602F8[] = {
    {
        .tileTag = 55044,
        .paletteTag = 55044,
        .oam = &gUnknown_82602F0,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_HealthBar
    }, {
        .tileTag = 55045,
        .paletteTag = 55044,
        .oam = &gUnknown_82602F0,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_HealthBar
    }, {
        .tileTag = 55046,
        .paletteTag = 55044,
        .oam = &gUnknown_82602F0,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_HealthBar
    }, {
        .tileTag = 55047,
        .paletteTag = 55044,
        .oam = &gUnknown_82602F0,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_HealthBar
    }
};

const struct Subsprite gUnknown_8260358[] = {
    { 240, 0, SPRITE_SHAPE(64x32), SPRITE_SIZE(64x32), 0x0000, 1 },
    { 48, 0, SPRITE_SHAPE(32x32), SPRITE_SIZE(32x32), 0x0020, 1 },
    { 240, 32, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0030, 1 },
    { 16, 32, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0034, 1 },
    { 48, 32, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0038, 1 }
};

const struct Subsprite gUnknown_826036C[] = {
    { 240, 0, SPRITE_SHAPE(64x32), SPRITE_SIZE(64x32), 0x0040, 1 },
    { 48, 0, SPRITE_SHAPE(32x32), SPRITE_SIZE(32x32), 0x0060, 1 },
    { 240, 32, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0070, 1 },
    { 16, 32, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0074, 1 },
    { 48, 32, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0078, 1 }
};

const struct Subsprite gUnknown_8260380[] = {
    { 240, 0, SPRITE_SHAPE(64x32), SPRITE_SIZE(64x32), 0x0000, 1 },
    { 48, 0, SPRITE_SHAPE(32x32), SPRITE_SIZE(32x32), 0x0020, 1 }
};

const struct Subsprite gUnknown_8260388[] = {
    { 240, 0, SPRITE_SHAPE(64x32), SPRITE_SIZE(64x32), 0x0000, 1 },
    { 48, 0, SPRITE_SHAPE(32x32), SPRITE_SIZE(32x32), 0x0020, 1 }
};

const struct Subsprite gUnknown_8260390[] = {
    { 240, 0, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0000, 1 },
    { 16, 0, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0004, 1 }
};

const struct Subsprite gUnknown_8260398[] = {
    { 240, 0, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0000, 1 },
    { 16, 0, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0004, 1 },
    { 224, 0, SPRITE_SHAPE(8x8), SPRITE_SIZE(8x8), 0x0008, 1 }
};

const struct SubspriteTable gUnknown_82603A4[] = {
    {NELEMS(gUnknown_8260358), gUnknown_8260358},
    {NELEMS(gUnknown_8260380), gUnknown_8260380},
    {NELEMS(gUnknown_826036C), gUnknown_826036C},
    {NELEMS(gUnknown_8260388), gUnknown_8260388}
};

const struct SubspriteTable gUnknown_82603C4[] = {
    {NELEMS(gUnknown_8260390), gUnknown_8260390},
    {NELEMS(gUnknown_8260398), gUnknown_8260398}
};

const struct Subsprite gUnknown_82603D4[] = {
    { 160, 0, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0000, 1 },
    { 192, 0, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0004, 1 },
    { 224, 0, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0008, 1 },
    { 0, 0, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x000c, 1 }
};

const struct Subsprite gUnknown_82603E4[] = {
    { 160, 0, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0000, 1 },
    { 192, 0, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0004, 1 },
    { 224, 0, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0008, 1 },
    { 0, 0, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0008, 1 },
    { 32, 0, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x0008, 1 },
    { 64, 0, SPRITE_SHAPE(32x8), SPRITE_SIZE(32x8), 0x000c, 1 }
};

const struct SubspriteTable sStatusSummaryBar_SubspriteTable[] =
{
    {NELEMS(gUnknown_82603D4), gUnknown_82603D4}
};

const struct SubspriteTable gUnknown_8260404 =
{NELEMS(gUnknown_82603E4), gUnknown_82603E4};

const u16 gUnknown_26040C[] = INCBIN_U16("graphics/battle_interface/unk_826404C.4bpp");

const struct CompressedSpriteSheet sStatusSummaryBarSpriteSheets[] = {
    {gFile_graphics_battle_interface_ball_status_bar_sheet, 0x0200, 55052},
    {gFile_graphics_battle_interface_ball_status_bar_sheet, 0x0200, 55053}
};

const struct SpritePalette sStatusSummaryBarSpritePals[] = {
    {gBattleInterface_BallStatusBarPal, 55056},
    {gBattleInterface_BallStatusBarPal, 55057}
};

const struct SpritePalette sStatusSummaryBallsSpritePals[] = {
    {gBattleInterface_BallDisplayPal, 55058},
    {gBattleInterface_BallDisplayPal, 55059}
};

const struct SpriteSheet sStatusSummaryBallsSpriteSheets[] = {
    {gUnknown_8D12404, 0x0080, 55060},
    {gUnknown_8D12404, 0x0080, 55061}
};

const struct OamData gUnknown_82604AC = {
    .shape = SPRITE_SHAPE(64x32),
    .size = SPRITE_SIZE(64x32),
    .priority = 1
};

const struct OamData gUnknown_82604B4 = {
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .priority = 1
};

const struct SpriteTemplate sStatusSummaryBarSpriteTemplates[] = {
    {
        .tileTag = 55052,
        .paletteTag = 55056,
        .oam = &gOamData_8260270,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_StatusSummaryBar
    }, {
        .tileTag = 55053,
        .paletteTag = 55057,
        .oam = &gOamData_8260270,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_StatusSummaryBar
    }
};

const struct SpriteTemplate sStatusSummaryBallsSpriteTemplates[] = {
    {
        .tileTag = 55060,
        .paletteTag = 55058,
        .oam = &gUnknown_82604B4,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_StatusSummaryBallsOnBattleStart
    }, {
        .tileTag = 55061,
        .paletteTag = 55059,
        .oam = &gUnknown_82604B4,
        .anims = gDummySpriteAnimTable,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_StatusSummaryBallsOnBattleStart
    }
};

void sub_8047B0C(s16 number, u16 *dest, bool8 unk)
{
    s8 i, j;
    u8 buff[4];

    for (i = 0; i < 4; i++)
    {
        buff[i] = 0;
    }

    for (i = 3; ; i--)
    {
        if (number > 0)
        {
            buff[i] = number % 10;
            number /= 10;
        }
        else
        {
            for (; i > -1; i--)
            {
                buff[i] = 0xFF;
            }
            if (buff[3] == 0xFF)
                buff[3] = 0;
            break;
        }
    }



    if (!unk)
    {
        for (i = 0, j = 0; i < 4; i++)
        {
            if (buff[j] == 0xFF)
            {
                dest[j + 0x00] &= 0xFC00;
                dest[j + 0x00] |= 0x1E;
                dest[i + 0x20] &= 0xFC00;
                dest[i + 0x20] |= 0x1E;
            }
            else
            {
                dest[j + 0x00] &= 0xFC00;
                dest[j + 0x00] |= 0x14 + buff[j];
                dest[i + 0x20] &= 0xFC00;
                dest[i + 0x20] |= 0x34 + buff[i];
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
                dest[i + 0x00] |= 0x1E;
                dest[i + 0x20] &= 0xFC00;
                dest[i + 0x20] |= 0x1E;
            }
            else
            {
                dest[i + 0x00] &= 0xFC00;
                dest[i + 0x00] |= 0x14 + buff[i];
                dest[i + 0x20] &= 0xFC00;
                dest[i + 0x20] |= 0x34 + buff[i];
            }
        }
    }
}

void sub_8047CAC(s16 num1, s16 num2, u16 *dest)
{
    dest[4] = 0x1E;
    sub_8047B0C(num2, &dest[0], FALSE);
    sub_8047B0C(num1, &dest[5], TRUE);
}

// Because the healthbox is too large to fit into one sprite, it is divided into two sprites.
// healthboxLeft  or healthboxMain  is the left part that is used as the 'main' sprite.
// healthboxRight or healthboxOther is the right part of the healthbox.
// There's also the third sprite under name of healthbarSprite that refers to the healthbar visible on the healtbox.

// data fields for healthboxMain
// oam.affineParam holds healthboxRight spriteId
#define hMain_HealthBarSpriteId     data[5]
#define hMain_Battler               data[6]
#define hMain_Data7                 data[7]

// data fields for healthboxRight
#define hOther_HealthBoxSpriteId    data[5]

// data fields for healthbar
#define hBar_HealthBoxSpriteId      data[5]
#define hBar_Data6                  data[6]

u8 CreateBattlerHealthboxSprites(u8 a)
{
    s16 data6 = 0;
    u8 healthboxLeftSpriteId;
    u8 healthboxRightSpriteId;
    u8 healthbarSpriteId;
    struct Sprite *sprite;

    if (!IsDoubleBattle())
    {
        if (GetBattlerSide(a) == 0)
        {
            healthboxLeftSpriteId = CreateSprite(&sHealthboxPlayerSpriteTemplates[0], 240, 160, 1);
            healthboxRightSpriteId = CreateSpriteAtEnd(&sHealthboxPlayerSpriteTemplates[0], 240, 160, 1);

            gSprites[healthboxLeftSpriteId].oam.shape = 0;
            gSprites[healthboxRightSpriteId].oam.shape = 0;
            gSprites[healthboxRightSpriteId].oam.tileNum += 64;
        }
        else
        {
            healthboxLeftSpriteId = CreateSprite(&sHealthboxOpponentSpriteTemplates[0], 240, 160, 1);
            healthboxRightSpriteId = CreateSpriteAtEnd(&sHealthboxOpponentSpriteTemplates[0], 240, 160, 1);

            gSprites[healthboxRightSpriteId].oam.tileNum += 32;
            data6 = 2;
        }

        gSprites[healthboxLeftSpriteId].oam.affineParam = healthboxRightSpriteId;
        gSprites[healthboxRightSpriteId].hBar_HealthBoxSpriteId = healthboxLeftSpriteId;
        gSprites[healthboxRightSpriteId].callback = SpriteCB_HealthBoxOther;
    }
    else
    {
        if (GetBattlerSide(a) == 0)
        {
            healthboxLeftSpriteId = CreateSprite(&sHealthboxPlayerSpriteTemplates[GetBattlerPosition(a) / 2], 240, 160, 1);
            healthboxRightSpriteId = CreateSpriteAtEnd(&sHealthboxPlayerSpriteTemplates[GetBattlerPosition(a) / 2], 240, 160, 1);

            gSprites[healthboxLeftSpriteId].oam.affineParam = healthboxRightSpriteId;
            gSprites[healthboxRightSpriteId].hBar_HealthBoxSpriteId = healthboxLeftSpriteId;
            gSprites[healthboxRightSpriteId].oam.tileNum += 32;
            gSprites[healthboxRightSpriteId].callback = SpriteCB_HealthBoxOther;
            data6 = 1;
        }
        else
        {
            healthboxLeftSpriteId = CreateSprite(&sHealthboxOpponentSpriteTemplates[GetBattlerPosition(a) / 2], 240, 160, 1);
            healthboxRightSpriteId = CreateSpriteAtEnd(&sHealthboxOpponentSpriteTemplates[GetBattlerPosition(a) / 2], 240, 160, 1);

            gSprites[healthboxLeftSpriteId].oam.affineParam = healthboxRightSpriteId;
            gSprites[healthboxRightSpriteId].hBar_HealthBoxSpriteId = healthboxLeftSpriteId;
            gSprites[healthboxRightSpriteId].oam.tileNum += 32;
            gSprites[healthboxRightSpriteId].callback = SpriteCB_HealthBoxOther;
            data6 = 2;
        }
    }
    healthbarSpriteId = CreateSpriteAtEnd(&gUnknown_82602F8[gBattlerPositions[a]], 140, 60, 0);
    sprite = &gSprites[healthbarSpriteId];
    SetSubspriteTables(sprite, &gUnknown_82603C4[GetBattlerSide(a)]);
    sprite->subspriteMode = 2;
    sprite->oam.priority = 1;
    CpuCopy32(GetHealthboxElementGfxPtr(1), OBJ_VRAM0 + sprite->oam.tileNum * 32, 64);

    gSprites[healthboxLeftSpriteId].hBar_HealthBoxSpriteId = healthbarSpriteId;
    gSprites[healthboxLeftSpriteId].hBar_Data6 = a;
    gSprites[healthboxLeftSpriteId].invisible = TRUE;
    gSprites[healthboxRightSpriteId].invisible = TRUE;
    sprite->data[5] = healthboxLeftSpriteId;
    sprite->data[6] = data6;
    sprite->invisible = TRUE;

    return healthboxLeftSpriteId;
}

u8 CreateSafariPlayerHealthboxSprites(void)
{
    u8 healthboxLeftSpriteId = CreateSprite(&sHealthboxSafariSpriteTemplate, 240, 160, 1);
    u8 healthboxRightSpriteId = CreateSpriteAtEnd(&sHealthboxSafariSpriteTemplate, 240, 160, 1);

    gSprites[healthboxLeftSpriteId].oam.shape = ST_OAM_SQUARE;
    gSprites[healthboxRightSpriteId].oam.shape = ST_OAM_SQUARE;
    gSprites[healthboxRightSpriteId].oam.tileNum += 0x40;
    gSprites[healthboxLeftSpriteId].oam.affineParam = healthboxRightSpriteId;
    gSprites[healthboxRightSpriteId].hBar_HealthBoxSpriteId = healthboxLeftSpriteId;
    gSprites[healthboxRightSpriteId].callback = SpriteCB_HealthBoxOther;
    return healthboxLeftSpriteId;
}

const u8 *GetHealthboxElementGfxPtr(u8 elementId)
{
    return gHealthboxElementsGfxTable[elementId];
}

// Syncs the position of healthbar accordingly with the healthbox.
void SpriteCB_HealthBar(struct Sprite *sprite)
{
    u8 r5 = sprite->data[5];

    switch (sprite->data[6])
    {
    case 0:
        sprite->pos1.x = gSprites[r5].pos1.x + 16;
        sprite->pos1.y = gSprites[r5].pos1.y;
        break;
    case 1:
        sprite->pos1.x = gSprites[r5].pos1.x + 16;
        sprite->pos1.y = gSprites[r5].pos1.y;
        break;
    default:
    case 2:
        sprite->pos1.x = gSprites[r5].pos1.x + 8;
        sprite->pos1.y = gSprites[r5].pos1.y;
        break;
    }
    sprite->pos2.x = gSprites[r5].pos2.x;
    sprite->pos2.y = gSprites[r5].pos2.y;
}

void SpriteCB_HealthBoxOther(struct Sprite *sprite)
{
    u8 healthboxMainSpriteId = sprite->hOther_HealthBoxSpriteId;

    sprite->pos1.x = gSprites[healthboxMainSpriteId].pos1.x + 64;
    sprite->pos1.y = gSprites[healthboxMainSpriteId].pos1.y;

    sprite->pos2.x = gSprites[healthboxMainSpriteId].pos2.x;
    sprite->pos2.y = gSprites[healthboxMainSpriteId].pos2.y;
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
    gSprites[gSprites[healthboxSpriteId].hMain_HealthBarSpriteId].invisible = TRUE;
    gSprites[gSprites[healthboxSpriteId].oam.affineParam].invisible = TRUE;
}

void SetHealthboxSpriteVisible(u8 healthboxSpriteId)
{
    gSprites[healthboxSpriteId].invisible = FALSE;
    gSprites[gSprites[healthboxSpriteId].hMain_HealthBarSpriteId].invisible = FALSE;
    gSprites[gSprites[healthboxSpriteId].oam.affineParam].invisible = FALSE;
}

void UpdateSpritePos(u8 spriteId, s16 x, s16 y)
{
    gSprites[spriteId].pos1.x = x;
    gSprites[spriteId].pos1.y = y;
}

void DestoryHealthboxSprite(u8 healthboxSpriteId)
{
    DestroySprite(&gSprites[gSprites[healthboxSpriteId].oam.affineParam]);
    DestroySprite(&gSprites[gSprites[healthboxSpriteId].hMain_HealthBarSpriteId]);
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
        u8 healthboxLeftSpriteId = gHealthboxSpriteIds[i];
        u8 healthboxRightSpriteId = gSprites[gHealthboxSpriteIds[i]].oam.affineParam;
        u8 healthbarSpriteId = gSprites[gHealthboxSpriteIds[i]].hMain_HealthBarSpriteId;

        gSprites[healthboxLeftSpriteId].oam.priority = priority;
        gSprites[healthboxRightSpriteId].oam.priority = priority;
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

void UpdateLvlInHealthbox(u8 healthboxSpriteId, u8 lvl)
{
    u32 windowId, spriteTileNum;
    u8 *windowTileData;
    u8 text[16] = _("{LV_2}");
    u32 xPos, var1;
    void *objVram;

    xPos = (u32) ConvertIntToDecimalStringN(text + 2, lvl, STR_CONV_MODE_LEFT_ALIGN, 3);
    // Alright, that part was unmatchable. It's basically doing:
    // xPos = 5 * (3 - (u32)(&text[2]));
    xPos--;
    xPos--;
    xPos -= ((u32)(text));
    var1 = (3 - xPos);
    xPos = 4 * var1;
    xPos += var1;

    windowTileData = AddTextPrinterAndCreateWindowOnHealthbox(text, xPos, 3, &windowId);
    spriteTileNum = gSprites[healthboxSpriteId].oam.tileNum * TILE_SIZE_4BPP;

    if (GetBattlerSide(gSprites[healthboxSpriteId].hMain_Battler) == B_SIDE_PLAYER)
    {
        objVram = (void*)(OBJ_VRAM0);
        if (!IsDoubleBattle())
            objVram += spriteTileNum + 0x820;
        else
            objVram += spriteTileNum + 0x420;
    }
    else
    {
        objVram = (void*)(OBJ_VRAM0);
        objVram += spriteTileNum + 0x400;
    }
    TextIntoHealthboxObject(objVram, windowTileData, 3);
    RemoveWindowOnHealthbox(windowId);
}

const u8 gUnknown_826052C[20] = __("{COLOR 01}{HIGHLIGHT 02}");

void UpdateHpTextInHealthbox(u8 healthboxSpriteId, s16 value, u8 maxOrCurrent)
{
    u32 windowId, spriteTileNum;
    u8 *windowTileData;
    u8 *strptr;
    register void *objVram;

    if (GetBattlerSide(gSprites[healthboxSpriteId].hMain_Battler) == B_SIDE_PLAYER && !IsDoubleBattle())
    {
        u8 text[8];
        if (maxOrCurrent != HP_CURRENT) // singles, max
        {
            ConvertIntToDecimalStringN(text, value, STR_CONV_MODE_RIGHT_ALIGN, 3);
            windowTileData = AddTextPrinterAndCreateWindowOnHealthbox(text, 0, 5, &windowId);
            spriteTileNum = gSprites[healthboxSpriteId].oam.tileNum;
            TextIntoHealthboxObject( (void*)(OBJ_VRAM0) + spriteTileNum * TILE_SIZE_4BPP + 0xA40, windowTileData, 2);
            RemoveWindowOnHealthbox(windowId);
        }
        else // singles, current
        {
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

        u8 text[20]; memcpy(text, gUnknown_826052C, sizeof(gUnknown_826052C));
        battler = gSprites[healthboxSpriteId].hMain_Battler;
        if (IsDoubleBattle() == TRUE || GetBattlerSide(battler) == B_SIDE_OPPONENT)
        {
            UpdateHpTextInHealthboxInDoubles(healthboxSpriteId, value, maxOrCurrent);
        }
        else
        {
            u32 var;
            u8 i;

            if (GetBattlerSide(gSprites[healthboxSpriteId].data[6]) == B_SIDE_PLAYER)
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
            RenderTextFont9(gMonSpritesGfxPtr->barFontGfx, 0, text, 0, 0, 0, 0, 0);

            for (i = 0; i < 3; i++)
            {
                CpuCopy32(&gMonSpritesGfxPtr->barFontGfx[i * 64 + 32],
                          (void*)((OBJ_VRAM0) + TILE_SIZE_4BPP * (gSprites[healthboxSpriteId].oam.tileNum + var + i)),
                          0x20);
            }
        }
    }
}

const u8 gUnknown_8260540[] = _("/");

void UpdateHpTextInHealthboxInDoubles(u8 healthboxSpriteId, s16 value, u8 maxOrCurrent)
{
    u32 windowId, spriteTileNum;
    u8 *windowTileData;
    void *objVram;

    u8 battlerId;

    u8 text[20] = __("{COLOR 01}{HIGHLIGHT 00}");
    battlerId = gSprites[healthboxSpriteId].hMain_Battler;

    if (gBattleSpritesDataPtr->battlerData[battlerId].hpNumbersNoBars) // don't print text if only bars are visible
    {
        u8 var = 4;
        u8 r7;
        u8 *txtPtr;
        u8 i;

        if (maxOrCurrent == HP_CURRENT)
            var = 0;

        r7 = gSprites[healthboxSpriteId].data[5];
        txtPtr = ConvertIntToDecimalStringN(text + 6, value, STR_CONV_MODE_RIGHT_ALIGN, 3);
        if (!maxOrCurrent)
            StringCopy(txtPtr, gUnknown_8260540);
        RenderTextFont9(gMonSpritesGfxPtr->barFontGfx, 0, text, 0, 0, 0, 0, 0);

        for (i = var; i < var + 3; i++)
        {
            if (i < 3)
            {
                CpuCopy32(&gMonSpritesGfxPtr->barFontGfx[((i - var) * 64) + 32],
                          (void*)((OBJ_VRAM0) + 32 * (1 + gSprites[r7].oam.tileNum + i)),
                          0x20);
            }
            else
            {
                CpuCopy32(&gMonSpritesGfxPtr->barFontGfx[((i - var) * 64) + 32],
                          (void*)((OBJ_VRAM0 + 0x20) + 32 * (i + gSprites[r7].oam.tileNum)),
                          0x20);
            }
        }

        if (maxOrCurrent == HP_CURRENT)
        {
            CpuCopy32(&gMonSpritesGfxPtr->barFontGfx[224],
                      (void*)((OBJ_VRAM0) + ((gSprites[r7].oam.tileNum + 4) * TILE_SIZE_4BPP)),
                      0x20);
            CpuFill32(0, (void*)((OBJ_VRAM0) + (gSprites[r7].oam.tileNum * TILE_SIZE_4BPP)), 0x20);
        }
        else
        {
            if (GetBattlerSide(battlerId) == B_SIDE_PLAYER) // Impossible to reach part, because the battlerId is from the opponent's side.
            {
                CpuCopy32(GetHealthboxElementGfxPtr(116),
                          (void*)(OBJ_VRAM0) + ((gSprites[healthboxSpriteId].oam.tileNum + 52) * TILE_SIZE_4BPP),
                          0x20);
            }
        }
    }
}

// Prints mon's nature, catch and flee rate. Probably used to test pokeblock-related features.
void PrintSafariMonInfo(u8 healthboxSpriteId, struct Pokemon *mon)
{
    u8 text[20];
    s32 j, spriteTileNum;
    u8 *barFontGfx;
    u8 i, var, nature, healthBarSpriteId;

    memcpy(text, gUnknown_826052C, sizeof(gUnknown_826052C));
    barFontGfx = &gMonSpritesGfxPtr->barFontGfx[0x520 + (GetBattlerPosition(gSprites[healthboxSpriteId].hMain_Battler) * 384)];
    var = 5;
    nature = GetNature(mon);
    StringCopy(text + 6, gNatureNamePointers[nature]);
    RenderTextFont9(barFontGfx, 0, text, 0, 0, 0, 0, 0);

    for (j = 6, i = 0; i < var; i++, j++)
    {
        u8 elementId;

        if ((text[j] >= 55 && text[j] <= 74) || (text[j] >= 135 && text[j] <= 154))
            elementId = 44;
        else if ((text[j] >= 75 && text[j] <= 79) || (text[j] >= 155 && text[j] <= 159))
            elementId = 45;
        else
            elementId = 43;

        CpuCopy32(GetHealthboxElementGfxPtr(elementId), barFontGfx + (i * 64), 0x20);
    }

    for (j = 1; j < var + 1; j++)
    {
        spriteTileNum = (gSprites[healthboxSpriteId].oam.tileNum + (j - (j / 8 * 8)) + (j / 8 * 64)) * TILE_SIZE_4BPP;
        CpuCopy32(barFontGfx, (void*)(OBJ_VRAM0) + (spriteTileNum), 0x20);
        barFontGfx += 0x20;

        spriteTileNum = (8 + gSprites[healthboxSpriteId].oam.tileNum + (j - (j / 8 * 8)) + (j / 8 * 64)) * TILE_SIZE_4BPP;
        CpuCopy32(barFontGfx, (void*)(OBJ_VRAM0) + (spriteTileNum), 0x20);
        barFontGfx += 0x20;
    }

    healthBarSpriteId = gSprites[healthboxSpriteId].hMain_HealthBarSpriteId;
    ConvertIntToDecimalStringN(text + 6, gBattleStruct->safariCatchFactor, STR_CONV_MODE_RIGHT_ALIGN, 2);
    ConvertIntToDecimalStringN(text + 9, gBattleStruct->safariEscapeFactor, STR_CONV_MODE_RIGHT_ALIGN, 2);
    text[5] = CHAR_SPACE;
    text[8] = CHAR_SLASH;
    RenderTextFont9(gMonSpritesGfxPtr->barFontGfx, 0, text, 0, 0, 0, 0, 0);

    j = healthBarSpriteId; // Needed to match for some reason.
    for (j = 0; j < 5; j++)
    {
        if (j <= 1)
        {
            CpuCopy32(&gMonSpritesGfxPtr->barFontGfx[0x40 * j + 0x20],
                      (void*)(OBJ_VRAM0) + (gSprites[healthBarSpriteId].oam.tileNum + 2 + j) * TILE_SIZE_4BPP,
                      32);
        }
        else
        {
            CpuCopy32(&gMonSpritesGfxPtr->barFontGfx[0x40 * j + 0x20],
                      (void*)(OBJ_VRAM0 + 0xC0) + (j + gSprites[healthBarSpriteId].oam.tileNum) * TILE_SIZE_4BPP,
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
                    healthBarSpriteId = gSprites[gHealthboxSpriteIds[i]].hMain_HealthBarSpriteId;

                    CpuFill32(0, (void*)(OBJ_VRAM0 + gSprites[healthBarSpriteId].oam.tileNum * TILE_SIZE_4BPP), 0x100);
                    UpdateHpTextInHealthboxInDoubles(gHealthboxSpriteIds[i], GetMonData(&gPlayerParty[gBattlerPartyIndexes[i]], MON_DATA_HP), HP_CURRENT);
                    UpdateHpTextInHealthboxInDoubles(gHealthboxSpriteIds[i], GetMonData(&gPlayerParty[gBattlerPartyIndexes[i]], MON_DATA_MAX_HP), HP_MAX);
                }
                else // text to bars
                {
                    UpdateStatusIconInHealthbox(gHealthboxSpriteIds[i]);
                    UpdateHealthboxAttribute(gHealthboxSpriteIds[i], &gPlayerParty[gBattlerPartyIndexes[i]], HEALTHBOX_HEALTH_BAR);
                    CpuCopy32(GetHealthboxElementGfxPtr(117), (void*)(OBJ_VRAM0 + 0x680 + gSprites[gHealthboxSpriteIds[i]].oam.tileNum * TILE_SIZE_4BPP), 32);
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
                        healthBarSpriteId = gSprites[gHealthboxSpriteIds[i]].hMain_HealthBarSpriteId;

                        CpuFill32(0, (void *)(OBJ_VRAM0 + gSprites[healthBarSpriteId].oam.tileNum * 32), 0x100);
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
            gSprites[gHealthboxSpriteIds[i]].hMain_Data7 ^= 1;
        }
    }
}

const u8 gUnknown_8260556[] = _("{HIGHLIGHT 02}");

const u16 gUnknown_826055A[] = {
    RGB(24, 12, 24),
    RGB(23, 23, 3),
    RGB(20, 20, 17),
    RGB(17, 22, 28),
    RGB(28, 14, 10)
};

const struct WindowTemplate gUnknown_8260564 = {
    .bg = 0,
    .tilemapLeft = 0,
    .tilemapTop = 0,
    .width = 8,
    .height = 2,
    .paletteNum = 0,
    .baseBlock = 0x000
};
