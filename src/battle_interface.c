#include "global.h"
#include "battle_anim.h"
#include "battle_interface.h"
#include "graphics.h"
#include "pokemon_summary_screen.h"
#include "string_util.h"
#include "strings.h"
#include "text.h"

void SpriteCB_HealthBoxOther(struct Sprite * sprite);
const u8 *GetHealthboxElementGfxPtr(u8 which);
u8 *AddTextPrinterAndCreateWindowOnHealthbox(const u8 *str, u32 x, u32 y, u32 *windowId);
void RemoveWindowOnHealthbox(u32 windowId);
void TextIntoHealthboxObject(void *dest, u8 *windowTileData, s32 windowWidth);
void UpdateHpTextInHealthboxInDoubles(u8 healthboxSpriteId, s16 value, u8 maxOrCurrent);

extern const struct SpriteTemplate sHealthboxPlayerSpriteTemplates[];
extern const struct SpriteTemplate sHealthboxOpponentSpriteTemplates[];
extern const struct SpriteTemplate sHealthboxSafariSpriteTemplate;
extern const struct SpriteTemplate gUnknown_82602F8[];
extern const struct SubspriteTable gUnknown_82603C4[];
extern const u8 gUnknown_826051C[16];
extern const u8 gUnknown_826052C[20];
extern const u8 gUnknown_8260542[20];

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
    u8 text[16];
    u32 xPos, var1;
    void *objVram;

    memcpy(text, gUnknown_826051C, 16);

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
