#include "global.h"
#include "gflib.h"
#include "task.h"
#include "decompress.h"
#include "trig.h"
#include "list_menu.h"
#include "menu_indicators.h"

struct ScrollIndicatorPair
{
    u8 field_0;
    u16 *scrollOffset;
    u16 fullyUpThreshold;
    u16 fullyDownThreshold;
    u8 topSpriteId;
    u8 bottomSpriteId;
    u16 tileTag;
    u16 palTag;
};

struct RedOutlineCursor
{
    struct SubspriteTable subspriteTable;
    struct Subsprite *subspritesPtr;
    u8 spriteId;
    u16 tileTag;
    u16 palTag;
};

struct RedArrowCursor
{
    u8 spriteId;
    u16 tileTag;
    u16 palTag;
};

struct ScrollIndicatorTemplate
{
    u8 animNum:4;
    u8 bounceDir:4;
    u8 multiplier;
    s16 frequency;
};

static EWRAM_DATA struct ScrollArrowsTemplate sTempScrollArrowTemplate = {0};

static void SpriteCallback_ScrollIndicatorArrow(struct Sprite *sprite);
static void SpriteCallback_RedArrowCursor(struct Sprite *sprite);
static void Task_ScrollIndicatorArrowPair(u8 taskId);
static u8 ListMenuAddRedArrowCursorObject(const struct CursorStruct *cursor);
static void ListMenuUpdateRedArrowCursorObject(u8 taskId, u16 x, u16 y);
static void ListMenuRemoveRedArrowCursorObject(u8 taskId);

static const struct ScrollIndicatorTemplate sScrollIndicatorTemplates[] =
{
    {
        .animNum = 0,
        .bounceDir = 0,
        .multiplier = 2,
        .frequency = 8,
    },
    {
        .animNum = 1,
        .bounceDir = 0,
        .multiplier = 2,
        .frequency = -8,
    },
    {
        .animNum = 2,
        .bounceDir = 1,
        .multiplier = 2,
        .frequency = 8,
    },
    {
        .animNum = 3,
        .bounceDir = 1,
        .multiplier = 2,
        .frequency = -8,
    },
};

static const struct OamData sOamData_ScrollArrowIndicator =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = 0,
    .mosaic = FALSE,
    .bpp = 0,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_ScrollArrowIndicator0[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_END,
};

static const union AnimCmd sSpriteAnim_ScrollArrowIndicator1[] =
{
    ANIMCMD_FRAME(0, 30, 1, 0),
    ANIMCMD_END,
};

static const union AnimCmd sSpriteAnim_ScrollArrowIndicator2[] =
{
    ANIMCMD_FRAME(4, 30),
    ANIMCMD_END,
};

static const union AnimCmd sSpriteAnim_ScrollArrowIndicator3[] =
{
    ANIMCMD_FRAME(4, 30, 0, 1),
    ANIMCMD_END,
};

static const union AnimCmd *const sSpriteAnimTable_ScrollArrowIndicator[] =
{
    sSpriteAnim_ScrollArrowIndicator0,
    sSpriteAnim_ScrollArrowIndicator1,
    sSpriteAnim_ScrollArrowIndicator2,
    sSpriteAnim_ScrollArrowIndicator3,
};

static const struct SpriteTemplate sSpriteTemplate_ScrollArrowIndicator =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &sOamData_ScrollArrowIndicator,
    .anims = sSpriteAnimTable_ScrollArrowIndicator,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallback_ScrollIndicatorArrow,
};

static const struct Subsprite sSubsprite_RedOutline1 =
{
    .x = 0,
    .y = 0,
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .tileOffset = 0,
    .priority = 0,
};

static const struct Subsprite sSubsprite_RedOutline2 =
{
    .x = 0,
    .y = 0,
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .tileOffset = 1,
    .priority = 0,
};

static const struct Subsprite sSubsprite_RedOutline3 =
{
    .x = 0,
    .y = 0,
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .tileOffset = 2,
    .priority = 0,
};

static const struct Subsprite sSubsprite_RedOutline4 =
{
    .x = 0,
    .y = 0,
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .tileOffset = 3,
    .priority = 0,
};

static const struct Subsprite sSubsprite_RedOutline5 =
{
    .x = 0,
    .y = 0,
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .tileOffset = 4,
    .priority = 0,
};

static const struct Subsprite sSubsprite_RedOutline6 =
{
    .x = 0,
    .y = 0,
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .tileOffset = 5,
    .priority = 0,
};

static const struct Subsprite sSubsprite_RedOutline7 =
{
    .x = 0,
    .y = 0,
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .tileOffset = 6,
    .priority = 0,
};

static const struct Subsprite sSubsprite_RedOutline8 =
{
    .x = 0,
    .y = 0,
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .tileOffset = 7,
    .priority = 0,
};

static const struct OamData sOamData_RedArrowCursor =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = 0,
    .mosaic = FALSE,
    .bpp = 0,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_RedArrowCursor[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_END,
};

static const union AnimCmd *const sSpriteAnimTable_RedArrowCursor[] = { sSpriteAnim_RedArrowCursor };

static const struct SpriteTemplate sSpriteTemplate_RedArrowCursor =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &sOamData_RedArrowCursor,
    .anims = sSpriteAnimTable_RedArrowCursor,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallback_RedArrowCursor,
};

static const u16 sRedArrowPal[] = INCBIN_U16("graphics/interface/red_arrow.gbapal");
static const u32 sRedArrowOtherGfx[] = INCBIN_U32("graphics/interface/red_arrow_other.4bpp.lz");
static const u32 sSelectorOutlineGfx[] = INCBIN_U32("graphics/interface/selector_outline.4bpp.lz");
static const u32 sRedArrowGfx[] = INCBIN_U32("graphics/interface/red_arrow.4bpp.lz");

#define tState data[0]
#define tAnimNum data[1]
#define tBounceDir data[2]
#define tMultiplier data[3]
#define tFrequency data[4]
#define tSinePos data[5]

static void SpriteCallback_ScrollIndicatorArrow(struct Sprite *sprite)
{
    s32 multiplier;

    switch (sprite->tState)
    {
    case 0:
        StartSpriteAnim(sprite, sprite->tAnimNum);
        sprite->tState++;
        break;
    case 1:
        switch (sprite->tBounceDir)
        {
        case 0:
            multiplier = sprite->tMultiplier;
            sprite->x2 = (gSineTable[(u8)(sprite->tSinePos)] * multiplier) / 256;
            break;
        case 1:
            multiplier = sprite->tMultiplier;
            sprite->y2 = (gSineTable[(u8)(sprite->tSinePos)] * multiplier) / 256;
            break;
        }
        sprite->tSinePos += sprite->tFrequency;
        break;
    }
}

static u8 AddScrollIndicatorArrowObject(u8 arrowDir, u8 x, u8 y, u16 tileTag, u16 palTag)
{
    u8 spriteId;
    struct SpriteTemplate spriteTemplate;

    spriteTemplate = sSpriteTemplate_ScrollArrowIndicator;
    spriteTemplate.tileTag = tileTag;
    spriteTemplate.paletteTag = palTag;
    spriteId = CreateSprite(&spriteTemplate, x, y, 0);
    gSprites[spriteId].invisible = TRUE;
    gSprites[spriteId].tState = 0;
    gSprites[spriteId].tAnimNum = sScrollIndicatorTemplates[arrowDir].animNum;
    gSprites[spriteId].tBounceDir = sScrollIndicatorTemplates[arrowDir].bounceDir;
    gSprites[spriteId].tMultiplier = sScrollIndicatorTemplates[arrowDir].multiplier;
    gSprites[spriteId].tFrequency = sScrollIndicatorTemplates[arrowDir].frequency;
    gSprites[spriteId].tSinePos = 0;
    return spriteId;
}

#undef tState
#undef tAnimNum
#undef tBounceDir
#undef tMultiplier
#undef tFrequency
#undef tSinePos

u8 AddScrollIndicatorArrowPair(const struct ScrollArrowsTemplate *arrowInfo, u16 *scrollOffset)
{
    struct CompressedSpriteSheet spriteSheet;
    struct SpritePalette spritePal;
    struct ScrollIndicatorPair *data;
    u8 taskId;

    spriteSheet.data = sRedArrowOtherGfx;
    spriteSheet.size = 0x100;
    spriteSheet.tag = arrowInfo->tileTag;
    LoadCompressedSpriteSheet(&spriteSheet);
    if (arrowInfo->palTag == TAG_NONE)
    {
        LoadPalette(sRedArrowPal, OBJ_PLTT_ID(arrowInfo->palNum), sizeof(sRedArrowPal));
    }
    else
    {
        spritePal.data = sRedArrowPal;
        spritePal.tag = arrowInfo->palTag;
        LoadSpritePalette(&spritePal);
    }
    taskId = CreateTask(Task_ScrollIndicatorArrowPair, 0);
    data = (struct ScrollIndicatorPair *)gTasks[taskId].data;

    data->field_0 = 0;
    data->scrollOffset = scrollOffset;
    data->fullyUpThreshold = arrowInfo->fullyUpThreshold;
    data->fullyDownThreshold = arrowInfo->fullyDownThreshold;
    data->tileTag = arrowInfo->tileTag;
    data->palTag = arrowInfo->palTag;
    data->topSpriteId = AddScrollIndicatorArrowObject(arrowInfo->firstArrowType, arrowInfo->firstX, arrowInfo->firstY, arrowInfo->tileTag, arrowInfo->palTag);
    data->bottomSpriteId = AddScrollIndicatorArrowObject(arrowInfo->secondArrowType, arrowInfo->secondX, arrowInfo->secondY, arrowInfo->tileTag, arrowInfo->palTag);

    if (arrowInfo->palTag == TAG_NONE)
    {
        gSprites[data->topSpriteId].oam.paletteNum = arrowInfo->palNum;
        gSprites[data->bottomSpriteId].oam.paletteNum = arrowInfo->palNum;
    }
    return taskId;
}

u8 AddScrollIndicatorArrowPairParameterized(u32 arrowType, s32 commonPos, s32 firstPos, s32 secondPos, s32 fullyDownThreshold, s32 tileTag, s32 palTag, u16 *scrollOffset)
{
    if (arrowType == SCROLL_ARROW_UP || arrowType == SCROLL_ARROW_DOWN)
    {
        sTempScrollArrowTemplate.firstArrowType = SCROLL_ARROW_UP;
        sTempScrollArrowTemplate.firstX = commonPos;
        sTempScrollArrowTemplate.firstY = firstPos;
        sTempScrollArrowTemplate.secondArrowType = SCROLL_ARROW_DOWN;
        sTempScrollArrowTemplate.secondX = commonPos;
        sTempScrollArrowTemplate.secondY = secondPos;
    }
    else
    {
        sTempScrollArrowTemplate.firstArrowType = SCROLL_ARROW_LEFT;
        sTempScrollArrowTemplate.firstX = firstPos;
        sTempScrollArrowTemplate.firstY = commonPos;
        sTempScrollArrowTemplate.secondArrowType = SCROLL_ARROW_RIGHT;
        sTempScrollArrowTemplate.secondX = secondPos;
        sTempScrollArrowTemplate.secondY = commonPos;
    }
    sTempScrollArrowTemplate.fullyUpThreshold = 0;
    sTempScrollArrowTemplate.fullyDownThreshold = fullyDownThreshold;
    sTempScrollArrowTemplate.tileTag = tileTag;
    sTempScrollArrowTemplate.palTag = palTag;
    sTempScrollArrowTemplate.palNum = 0;

    return AddScrollIndicatorArrowPair(&sTempScrollArrowTemplate, scrollOffset);
}

static void Task_ScrollIndicatorArrowPair(u8 taskId)
{
    struct ScrollIndicatorPair *data = (struct ScrollIndicatorPair *)gTasks[taskId].data;
    u16 currItem = (*data->scrollOffset);

    if (currItem == data->fullyUpThreshold)
        gSprites[data->topSpriteId].invisible = TRUE;
    else
        gSprites[data->topSpriteId].invisible = FALSE;

    if (currItem == data->fullyDownThreshold)
        gSprites[data->bottomSpriteId].invisible = TRUE;
    else
        gSprites[data->bottomSpriteId].invisible = FALSE;
}

void RemoveScrollIndicatorArrowPair(u8 taskId)
{
    struct ScrollIndicatorPair *data = (struct ScrollIndicatorPair *)gTasks[taskId].data;

    if (data->tileTag != TAG_NONE)
        FreeSpriteTilesByTag(data->tileTag);
    if (data->palTag != TAG_NONE)
        FreeSpritePaletteByTag(data->palTag);
    DestroySprite(&gSprites[data->topSpriteId]);
    DestroySprite(&gSprites[data->bottomSpriteId]);
    DestroyTask(taskId);
}

u8 ListMenuAddCursorObjectInternal(const struct CursorStruct *cursor, u32 cursorKind)
{
    switch (cursorKind)
    {
    case 0:
    default:
        return ListMenuAddRedOutlineCursorObject(cursor);
    case 1:
        return ListMenuAddRedArrowCursorObject(cursor);
    }
}

void ListMenuUpdateCursorObject(u8 taskId, u16 x, u16 y, u32 cursorKind)
{
    switch (cursorKind)
    {
    case 0:
        ListMenuUpdateRedOutlineCursorObject(taskId, x, y);
        break;
    case 1:
        ListMenuUpdateRedArrowCursorObject(taskId, x, y);
        break;
    }
}

void ListMenuRemoveCursorObject(u8 taskId, u32 cursorKind)
{
    switch (cursorKind)
    {
    case 0:
        ListMenuRemoveRedOutlineCursorObject(taskId);
        break;
    case 1:
        ListMenuRemoveRedArrowCursorObject(taskId);
        break;
    }
}

void Task_RedOutlineCursor(u8 taskId)
{
}

u8 ListMenuGetRedOutlineCursorSpriteCount(u16 rowWidth, u16 rowHeight)
{
    s32 i, count = 4;

    if (rowWidth > 16)
        for (i = 8; i < (rowWidth - 8); i += 8)
            count += 2;
    if (rowHeight > 16)
        for (i = 8; i < (rowHeight - 8); i += 8)
            count += 2;
    return count;
}

void ListMenuSetUpRedOutlineCursorSpriteOamTable(u16 rowWidth, u16 rowHeight, struct Subsprite *subsprites)
{
    s32 i, j, id = 0;

    subsprites[id] = sSubsprite_RedOutline1;
    subsprites[id].x = 136;
    subsprites[id].y = 136;
    id++;
    subsprites[id] = sSubsprite_RedOutline2;
    subsprites[id].x = rowWidth + 128;
    subsprites[id].y = 136;
    id++;
    subsprites[id] = sSubsprite_RedOutline7;
    subsprites[id].x = 136;
    subsprites[id].y = rowHeight + 128;
    id++;
    subsprites[id] = sSubsprite_RedOutline8;
    subsprites[id].x = rowWidth + 128;
    subsprites[id].y = rowHeight + 128;
    id++;
    if (rowWidth > 16)
    {
        for (i = 8; i < rowWidth - 8; i += 8)
        {
            subsprites[id] = sSubsprite_RedOutline3;
            subsprites[id].x = i - 120;
            subsprites[id].y = 136;
            id++;

            subsprites[id] = sSubsprite_RedOutline6;
            subsprites[id].x = i - 120;
            subsprites[id].y = rowHeight + 128;
            id++;
        }
    }
    if (rowHeight > 16)
    {
        for (j = 8; j < rowHeight - 8; j += 8)
        {
            subsprites[id] = sSubsprite_RedOutline4;
            subsprites[id].x = 136;
            subsprites[id].y = j - 120;
            id++;
            subsprites[id] = sSubsprite_RedOutline5;
            subsprites[id].x = rowWidth + 128;
            subsprites[id].y = j - 120;
            id++;
        }
    }
}

u8 ListMenuAddRedOutlineCursorObject(const struct CursorStruct *cursor)
{
    struct CompressedSpriteSheet spriteSheet;
    struct SpritePalette spritePal;
    struct RedOutlineCursor *data;
    struct SpriteTemplate spriteTemplate;
    u8 taskId;

    spriteSheet.data = sSelectorOutlineGfx;
    spriteSheet.size = 0x100;
    spriteSheet.tag = cursor->tileTag;
    LoadCompressedSpriteSheet(&spriteSheet);
    if (cursor->palTag == TAG_NONE)
    {
        LoadPalette(sRedArrowPal, OBJ_PLTT_ID(cursor->palNum), sizeof(sRedArrowPal));
    }
    else
    {
        spritePal.data = sRedArrowPal;
        spritePal.tag = cursor->palTag;
        LoadSpritePalette(&spritePal);
    }
    taskId = CreateTask(Task_RedOutlineCursor, 0);
    data = (struct RedOutlineCursor *)gTasks[taskId].data;
    data->tileTag = cursor->tileTag;
    data->palTag = cursor->palTag;
    data->subspriteTable.subspriteCount = ListMenuGetRedOutlineCursorSpriteCount(cursor->rowWidth, cursor->rowHeight);
    data->subspriteTable.subsprites = data->subspritesPtr = Alloc(data->subspriteTable.subspriteCount * 4);
    ListMenuSetUpRedOutlineCursorSpriteOamTable(cursor->rowWidth, cursor->rowHeight, data->subspritesPtr);
    spriteTemplate = gDummySpriteTemplate;
    spriteTemplate.tileTag = cursor->tileTag;
    spriteTemplate.paletteTag = cursor->palTag;
    data->spriteId = CreateSprite(&spriteTemplate, cursor->left + 120, cursor->top + 120, 0);
    SetSubspriteTables(&gSprites[data->spriteId], &data->subspriteTable);
    gSprites[data->spriteId].oam.priority = 0;
    gSprites[data->spriteId].subpriority = 0;
    gSprites[data->spriteId].subspriteTableNum = 0;
    if (cursor->palTag == TAG_NONE)
        gSprites[data->spriteId].oam.paletteNum = cursor->palNum;
    return taskId;
}

void ListMenuUpdateRedOutlineCursorObject(u8 taskId, u16 x, u16 y)
{
    struct RedOutlineCursor *data = (struct RedOutlineCursor *)gTasks[taskId].data;

    gSprites[data->spriteId].x = x + 120;
    gSprites[data->spriteId].y = y + 120;
}

void ListMenuRemoveRedOutlineCursorObject(u8 taskId)
{
    struct RedOutlineCursor *data = (struct RedOutlineCursor *)gTasks[taskId].data;

    Free(data->subspritesPtr);
    if (data->tileTag != TAG_NONE)
        FreeSpriteTilesByTag(data->tileTag);
    if (data->palTag != TAG_NONE)
        FreeSpritePaletteByTag(data->palTag);
    DestroySprite(&gSprites[data->spriteId]);
    DestroyTask(taskId);
}

static void SpriteCallback_RedArrowCursor(struct Sprite *sprite)
{
    sprite->x2 = gSineTable[(u8)(sprite->data[0])] / 64;
    sprite->data[0] += 8;
}

static void Task_RedArrowCursor(u8 taskId)
{
}

static u8 ListMenuAddRedArrowCursorObject(const struct CursorStruct *cursor)
{
    struct CompressedSpriteSheet spriteSheet;
    struct SpritePalette spritePal;
    struct RedArrowCursor *data;
    struct SpriteTemplate spriteTemplate;
    u8 taskId;

    spriteSheet.data = sRedArrowGfx;
    spriteSheet.size = 0x80;
    spriteSheet.tag = cursor->tileTag;
    LoadCompressedSpriteSheet(&spriteSheet);
    if (cursor->palTag == TAG_NONE)
    {
        LoadPalette(sRedArrowPal, OBJ_PLTT_ID(cursor->palNum), sizeof(sRedArrowPal));
    }
    else
    {
        spritePal.data = sRedArrowPal;
        spritePal.tag = cursor->palTag;
        LoadSpritePalette(&spritePal);
    }
    taskId = CreateTask(Task_RedArrowCursor, 0);
    data = (struct RedArrowCursor *)gTasks[taskId].data;
    data->tileTag = cursor->tileTag;
    data->palTag = cursor->palTag;
    spriteTemplate = sSpriteTemplate_RedArrowCursor;
    spriteTemplate.tileTag = cursor->tileTag;
    spriteTemplate.paletteTag = cursor->palTag;
    data->spriteId = CreateSprite(&spriteTemplate, cursor->left, cursor->top, 0);
    gSprites[data->spriteId].x2 = 8;
    gSprites[data->spriteId].y2 = 8;
    if (cursor->palTag == TAG_NONE)
        gSprites[data->spriteId].oam.paletteNum = cursor->palNum;
    return taskId;
}

static void ListMenuUpdateRedArrowCursorObject(u8 taskId, u16 x, u16 y)
{
    struct RedArrowCursor *data = (struct RedArrowCursor *)gTasks[taskId].data;

    gSprites[data->spriteId].x = x;
    gSprites[data->spriteId].y = y;
}

static void ListMenuRemoveRedArrowCursorObject(u8 taskId)
{
    struct RedArrowCursor *data = (struct RedArrowCursor *)gTasks[taskId].data;

    if (data->tileTag != TAG_NONE)
        FreeSpriteTilesByTag(data->tileTag);
    if (data->palTag != TAG_NONE)
        FreeSpritePaletteByTag(data->palTag);
    DestroySprite(&gSprites[data->spriteId]);
    DestroyTask(taskId);
}
