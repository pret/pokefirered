#include "global.h"
#include "gflib.h"
#include "task.h"
#include "new_menu_helpers.h"
#include "strings.h"
#include "event_scripts.h"
#include "event_object_lock.h"
#include "script.h"
#include "event_data.h"
#include "field_player_avatar.h"
#include "field_specials.h"
#include "fieldmap.h"
#include "constants/songs.h"

static void Task_NoResponse_CleanUp(u8 taskId);
static void Task_ItemfinderResponseSoundsAndAnims(u8 taskId);
static void Task_ItemfinderUnderfootSoundsAndAnims(u8 taskId);
static bool8 HiddenItemIsWithinRangeOfPlayer(const struct MapEvents * events, u8 taskId);
static void SetUnderfootHiddenItem(u8 taskId, u32 hiddenItem);
static void SetNormalHiddenItem(u8 taskId);
static void FindHiddenItemsInConnectedMaps(u8 taskId);
static void RegisterHiddenItemRelativeCoordsIfCloser(u8 taskId, s16 dx, s16 dy);
static u8 GetPlayerDirectionTowardsHiddenItem(s16 itemX, s16 itemY);
static void Task_ItemfinderResponsePrintMessage(u8 taskId);
static void Task_ItemfinderResponseCleanUp(u8 taskId);
static void Task_ItemfinderUnderfootPrintMessage(u8 taskId);
static void Task_ItemfinderUnderfootDigUpItem(u8 taskId);
static void DestroyArrowAndStarTiles(void);
static void LoadArrowAndStarTiles(void);
static void CreateArrowSprite(u8 animNum, u8 direction);
static void SpriteCallback_Arrow(struct Sprite *sprite);
static void SpriteCallback_DestroyArrow(struct Sprite *sprite);
static u8 CreateStarSprite(void);
static void SpriteCallback_Star(struct Sprite *sprite);
static void SpriteCallback_DestroyStar(struct Sprite *sprite);

#define ARROW_TILE_TAG 2000

static const u16 sArrowAndStarSpriteTiles[] = INCBIN_U16("graphics/itemfinder/spr_tiles.4bpp");

static const union AnimCmd sArrowAnim0[] = {
    ANIMCMD_FRAME( 0, 10),
    ANIMCMD_END
};

static const union AnimCmd sArrowAnim1[] = {
    ANIMCMD_FRAME( 4, 10),
    ANIMCMD_END
};

static const union AnimCmd sArrowAnim2[] = {
    ANIMCMD_FRAME( 8, 10),
    ANIMCMD_END
};

static const union AnimCmd sArrowAnim3[] = {
    ANIMCMD_FRAME(12, 10),
    ANIMCMD_END
};

static const union AnimCmd sStarAnim[] = {
    ANIMCMD_FRAME(16, 10),
    ANIMCMD_END
};

static const union AnimCmd *const sArrowAndStarSpriteAnimTable[] = {
    sArrowAnim0,
    sArrowAnim1,
    sArrowAnim2,
    sArrowAnim3,
    sStarAnim
};

static const struct OamData sArrowAndStarSpriteOamData = {
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .shape = ST_OAM_SQUARE,
    .size = ST_OAM_SIZE_1
};

static const union AffineAnimCmd sAffineAnim_Left[] = {
    AFFINEANIMCMD_FRAME(0, 0, 0x00, 1),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_Down[] = {
    AFFINEANIMCMD_FRAME(0, 0, 0x40, 1),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_Right[] = {
    AFFINEANIMCMD_FRAME(0, 0, 0x80, 1),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_Up[] = {
    AFFINEANIMCMD_FRAME(0, 0, 0xc0, 1),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sArrowAndStarSpriteAffineAnimTable[] = {
    sAffineAnim_Left,
    sAffineAnim_Down,
    sAffineAnim_Right,
    sAffineAnim_Up
};

static const struct SpriteTemplate sSpriteTemplate_ArrowAndStar = {
    .tileTag = ARROW_TILE_TAG,
    .paletteTag = 0xFFFF,
    .oam = &sArrowAndStarSpriteOamData,
    .anims = sArrowAndStarSpriteAnimTable,
    .affineAnims = sArrowAndStarSpriteAffineAnimTable,
    .callback = SpriteCallback_Arrow
};

static const struct SpriteSheet sArrowAndStarSpriteSheet = {
    .data = sArrowAndStarSpriteTiles,
    .size = sizeof(sArrowAndStarSpriteTiles),
    .tag = ARROW_TILE_TAG
};

#define tItemX data[0]
#define tItemY data[1]
#define tHiddenItemFound data[2]
#define tDingTimer data[3]
#define tNumDingsRemaining data[4]
#define tDingNum data[5]
#define tUnderfoot data[6]
#define tStartSpriteId data[7]

void ItemUseOnFieldCB_Itemfinder(u8 taskId)
{
    u8 i;
    for (i = 0; i < 16; i++)
        gTasks[taskId].data[i] = 0;
    if (HiddenItemIsWithinRangeOfPlayer(gMapHeader.events, taskId) == TRUE)
    {
        LoadArrowAndStarTiles();
        if (gTasks[taskId].tUnderfoot == TRUE)
            gTasks[taskId].func = Task_ItemfinderUnderfootSoundsAndAnims;
        else
            gTasks[taskId].func = Task_ItemfinderResponseSoundsAndAnims;
    }
    else
    {
        DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_NopeTheresNoResponse, Task_NoResponse_CleanUp);
    }
}

static void Task_NoResponse_CleanUp(u8 taskId)
{
    ClearDialogWindowAndFrame(0, TRUE);
    ClearPlayerHeldMovementAndUnfreezeObjectEvents();
    UnlockPlayerFieldControls();
    DestroyTask(taskId);
}

static void Task_ItemfinderResponseSoundsAndAnims(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u8 direction;
    if (tDingTimer % 25 == 0)
    {
        direction = GetPlayerDirectionTowardsHiddenItem(tItemX, tItemY);
        if (tNumDingsRemaining == 0)
        {
            gTasks[taskId].func = Task_ItemfinderResponsePrintMessage;
            return;
        }
        else
        {
            PlaySE(SE_ITEMFINDER);
            CreateArrowSprite(tDingNum, direction);
            tDingNum++;
            tNumDingsRemaining--;
        }
    }
    tDingTimer++;
}

static void Task_ItemfinderUnderfootSoundsAndAnims(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (tDingTimer % 25 == 0)
    {
        if (tNumDingsRemaining == 0)
        {
            gTasks[taskId].func = Task_ItemfinderUnderfootPrintMessage;
            return;
        }
        else
        {
            PlaySE(SE_ITEMFINDER);
            tStartSpriteId = CreateStarSprite();
            tDingNum++;
            tNumDingsRemaining--;
        }
    }
    tDingTimer++;
}

static bool8 HiddenItemIsWithinRangeOfPlayer(const struct MapEvents * events, u8 taskId)
{
    s16 x, y, i, dx, dy;
    PlayerGetDestCoords(&x, &y);
    gTasks[taskId].tHiddenItemFound = FALSE;
    for (i = 0; i < events->bgEventCount; i++)
    {
        if (events->bgEvents[i].kind == 7 && !FlagGet(GetHiddenItemAttr(events->bgEvents[i].bgUnion.hiddenItem, HIDDEN_ITEM_FLAG)))
        {
            dx = events->bgEvents[i].x + 7 - x;
            dy = events->bgEvents[i].y + 7 - y;
            if (GetHiddenItemAttr(events->bgEvents[i].bgUnion.hiddenItem, HIDDEN_ITEM_UNDERFOOT) == TRUE)
            {
                if (dx == 0 && dy == 0)
                {
                    SetUnderfootHiddenItem(taskId, events->bgEvents[i].bgUnion.hiddenItem);
                    return TRUE;
                }
            }
            else if (
                dx >= -7
             && dx <=  7
             && dy >= -5
             && dy <=  5
            )
            {
                RegisterHiddenItemRelativeCoordsIfCloser(taskId, dx, dy);
            }
        }
    }
    FindHiddenItemsInConnectedMaps(taskId);
    if (gTasks[taskId].tHiddenItemFound == TRUE)
    {
        SetNormalHiddenItem(taskId);
        return TRUE;
    }
    return FALSE;
}

static void SetUnderfootHiddenItem(u8 taskId, u32 hiddenItem)
{
    s16 *data = gTasks[taskId].data;
    gSpecialVar_0x8004 = GetHiddenItemAttr(hiddenItem, HIDDEN_ITEM_FLAG);
    gSpecialVar_0x8005 = GetHiddenItemAttr(hiddenItem, HIDDEN_ITEM_ITEM);
    gSpecialVar_0x8006 = 1; // Quantity. The 'HIDDEN_ITEM_QUANTITY' data is ignored for underfoot items
    TV_PrintIntToStringVar(0, gSpecialVar_0x8005);
    tHiddenItemFound = TRUE;
    tItemX = 0;
    tItemY = 0;
    tNumDingsRemaining = 3;
    tUnderfoot = TRUE;
}

static void SetNormalHiddenItem(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s16 absY = tItemY;
    s16 absX = tItemX;
    
    // The strength of the response increases inversely with distance to the item.
    if (tItemX == 0 && tItemY == 0)
        tNumDingsRemaining = 4;
    else
    {
        if (tItemX < 0)
            absX = tItemX * -1;
        if (tItemY < 0)
            absY = tItemY * -1;
        if (absX > absY)
        {
            if (absX > 3)
                tNumDingsRemaining = 2;
            else
                tNumDingsRemaining = 4;
        }
        else
        {
            if (absY > 3)
                tNumDingsRemaining = 2;
            else
                tNumDingsRemaining = 4;
        }
    }
}

static bool8 HiddenItemAtPos(const struct MapEvents * events, s16 x, s16 y)
{
    u8 bgEventCount = events->bgEventCount;
    const struct BgEvent * bgEvents = events->bgEvents;
    u16 eventFlag;
    int i;

    for (i = 0; i < bgEventCount; i++)
    {
        if (
            bgEvents[i].kind == 7
         && x == bgEvents[i].x
         && y == bgEvents[i].y
        )
        {
            eventFlag = GetHiddenItemAttr(bgEvents[i].bgUnion.hiddenItem, HIDDEN_ITEM_FLAG);
            if (GetHiddenItemAttr(bgEvents[i].bgUnion.hiddenItem, HIDDEN_ITEM_UNDERFOOT) != TRUE && !FlagGet(eventFlag))
                return TRUE;
            else
                return FALSE;
        }
    }
    return FALSE;
}

static bool8 HiddenItemInConnectedMapAtPos(const struct MapConnection * connection, s32 x, s32 y)
{
    const struct MapHeader * mapHeader;
    u16 localX, localY;
    u32 localOffset;
    s32 localLength;

    mapHeader = GetMapHeaderFromConnection(connection);

    switch (connection->direction)
    {
    // same weird temp variable behavior seen in HiddenItemAtPos
    case CONNECTION_NORTH:
        localOffset = connection->offset + 7;
        localX = x - localOffset;
        localLength = mapHeader->mapLayout->height - 7;
        localY = localLength + y; // additions are reversed for some reason
        break;
    case CONNECTION_SOUTH:
        localOffset = connection->offset + 7;
        localX = x - localOffset;
        localLength = gMapHeader.mapLayout->height + 7;
        localY = y - localLength;
        break;
    case CONNECTION_WEST:
        localLength = mapHeader->mapLayout->width - 7;
        localX = localLength + x; // additions are reversed for some reason
        localOffset = connection->offset + 7;
        localY = y - localOffset;
        break;
    case CONNECTION_EAST:
        localLength = gMapHeader.mapLayout->width + 7;
        localX = x - localLength;
        localOffset = connection->offset + 7;
        localY = y - localOffset;
        break;
    default:
        return FALSE;
    }
    return HiddenItemAtPos(mapHeader->events, localX, localY);
}

static void FindHiddenItemsInConnectedMaps(u8 taskId)
{
    s16 x, y;
    s16 curX, curY;
    s16 width = gMapHeader.mapLayout->width + 7;
    s16 height = gMapHeader.mapLayout->height + 7;

    s16 var1 = 7;
    s16 var2 = 7;

    PlayerGetDestCoords(&x, &y);

    for (curX = x - 7; curX <= x + 7; curX++)
    {
        for (curY = y - 5; curY <= y + 5; curY++)
        {
            if (var1 > curX
                || curX >= width
                || var2 > curY
                || curY >= height)
            {
                const struct MapConnection * conn = GetMapConnectionAtPos(curX, curY);
                if (conn != NULL && HiddenItemInConnectedMapAtPos(conn, curX, curY) == TRUE)
                    RegisterHiddenItemRelativeCoordsIfCloser(taskId, curX - x, curY - y);
            }
        }
    }
}

static void RegisterHiddenItemRelativeCoordsIfCloser(u8 taskId, s16 dx, s16 dy)
{
    s16 *data = gTasks[taskId].data;
    s16 dx2, dy2, dx3, dy3;

    if (tHiddenItemFound == FALSE)
    {
        tItemX = dx;
        tItemY = dy;
        tHiddenItemFound = TRUE;
    }
    else
    {
        // tItemX and tItemY contain the player's coordinates.
        // dx and dy contain the item's coordinates.
        if (tItemX < 0)
            dx2 = tItemX * -1; // item is to the left
        else
            dx2 = tItemX; // item is to the right

        if (tItemY < 0)
            dy2 = tItemY * -1; // item is to the north
        else
            dy2 = tItemY; // item is to the south

        if (dx < 0)
            dx3 = dx * -1;
        else
            dx3 = dx;

        if (dy < 0)
            dy3 = dy * -1;
        else
            dy3 = dy;

        if (dx2 + dy2 > dx3 + dy3)
        {
            tItemX = dx;
            tItemY = dy;
        }
        else
        {
            if (dx2 + dy2 == dx3 + dy3 && (dy2 > dy3 || (dy2 == dy3 && tItemY < dy)))
            {
                tItemX = dx;
                tItemY = dy;
            }
        }
    }
}

static u8 GetPlayerDirectionTowardsHiddenItem(s16 itemX, s16 itemY)
{
    s16 abX, abY;

    if (itemX == 0 && itemY == 0)
        return DIR_NONE; // player is standing on the item.

    // get absolute X distance.
    if (itemX < 0)
        abX = itemX * -1;
    else
        abX = itemX;

    // get absolute Y distance.
    if (itemY < 0)
        abY = itemY * -1;
    else
        abY = itemY;

    if (abX > abY)
    {
        if (itemX < 0)
            return DIR_EAST;
        else
            return DIR_NORTH;
    }
    else
    {
        if (abX < abY)
        {
            if (itemY < 0)
                return DIR_SOUTH;
            else
                return DIR_WEST;
        }
        if (abX == abY)
        {
            if (itemY < 0)
                return DIR_SOUTH;
            else
                return DIR_WEST;
        }
        return DIR_NONE; // should never get here. return something so it doesnt crash.
    }
}

static void Task_ItemfinderResponsePrintMessage(u8 taskId)
{
    DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_ItemfinderResponding, Task_ItemfinderResponseCleanUp);
}

static void Task_ItemfinderResponseCleanUp(u8 taskId)
{
    DestroyArrowAndStarTiles();
    ClearDialogWindowAndFrame(0, TRUE);
    ClearPlayerHeldMovementAndUnfreezeObjectEvents();
    UnlockPlayerFieldControls();
    DestroyTask(taskId);
}

static void Task_ItemfinderUnderfootPrintMessage(u8 taskId)
{
    DisplayItemMessageOnField(taskId, FONT_NORMAL, gText_ItemfinderShakingWildly, Task_ItemfinderUnderfootDigUpItem);
}

static void Task_ItemfinderUnderfootDigUpItem(u8 taskId)
{
    DestroyArrowAndStarTiles();
    DestroyTask(taskId);
    ScriptContext_SetupScript(EventScript_ItemfinderDigUpUnderfootItem);
    LockPlayerFieldControls();
}

#undef tStartSpriteId
#undef tUnderfoot
#undef tDingNum
#undef tNumDingsRemaining
#undef tDingTimer
#undef tHiddenItemFound
#undef tItemY
#undef tItemX

#define spData0 data[0]
#define spDeltaX data[1]
#define spDeltaY data[2]
#define spCurX data[3]
#define spCurY data[4]
#define spCenterX data[5]
#define spCenterY data[6]
#define spAnimNum data[7]

static void LoadArrowAndStarTiles(void)
{
    LoadSpriteSheet(&sArrowAndStarSpriteSheet);
}

static void DestroyArrowAndStarTiles(void)
{
    FreeSpriteTilesByTag(ARROW_TILE_TAG);
}

static void CreateArrowSprite(u8 animNum, u8 direction)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_ArrowAndStar, 120, 76, 0);
    gSprites[spriteId].oam.paletteNum = 0;
    StartSpriteAnim(&gSprites[spriteId], animNum);
    gSprites[spriteId].spAnimNum = animNum;
    gSprites[spriteId].spData0 = 0;
    gSprites[spriteId].spCurX = 0;
    gSprites[spriteId].spCurY = 0;
    gSprites[spriteId].spCenterX = 120;
    gSprites[spriteId].spCenterY = 76;
    switch (direction)
    {
    case DIR_NONE:
        switch (GetPlayerFacingDirection())
        {
        case DIR_WEST:
            gSprites[spriteId].spDeltaX = -100;
            gSprites[spriteId].spDeltaY = 0;
            StartSpriteAffineAnim(&gSprites[spriteId], 0);
            break;
        case DIR_NORTH:
            gSprites[spriteId].spDeltaX = 0;
            gSprites[spriteId].spDeltaY = -100;
            StartSpriteAffineAnim(&gSprites[spriteId], 3);
            break;
        case DIR_EAST:
            gSprites[spriteId].spDeltaX = 100;
            gSprites[spriteId].spDeltaY = 0;
            StartSpriteAffineAnim(&gSprites[spriteId], 2);
            break;
        case DIR_SOUTH:
            gSprites[spriteId].spDeltaX = 0;
            gSprites[spriteId].spDeltaY = 100;
            StartSpriteAffineAnim(&gSprites[spriteId], 1);
            break;
        }
        break;
    case DIR_SOUTH:
        gSprites[spriteId].spDeltaX = 0;
        gSprites[spriteId].spDeltaY = -100;
        StartSpriteAffineAnim(&gSprites[spriteId], 3);
        break;
    case DIR_NORTH:
        gSprites[spriteId].spDeltaX = 100;
        gSprites[spriteId].spDeltaY = 0;
        StartSpriteAffineAnim(&gSprites[spriteId], 2);
        break;
    case DIR_WEST:
        gSprites[spriteId].spDeltaX = 0;
        gSprites[spriteId].spDeltaY = 100;
        StartSpriteAffineAnim(&gSprites[spriteId], 1);
        break;
    case DIR_EAST:
        gSprites[spriteId].spDeltaX = -100;
        gSprites[spriteId].spDeltaY = 0;
        break;
    }
}

static void SpriteCallback_Arrow(struct Sprite *sprite)
{
    s16 x, y;
    sprite->spCurX += sprite->spDeltaX;
    sprite->spCurY += sprite->spDeltaY;
    sprite->x = sprite->spCenterX + (sprite->spCurX >> 8);
    sprite->y = sprite->spCenterY + (sprite->spCurY >> 8);
    if (sprite->x <= 104
     || sprite->x > 132
     || sprite->y <= 60
     || sprite->y > 88)
        sprite->callback = SpriteCallback_DestroyArrow;
}

static void SpriteCallback_DestroyArrow(struct Sprite *sprite)
{
    FreeSpriteOamMatrix(sprite);
    DestroySprite(sprite);
}

static u8 CreateStarSprite(void)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_ArrowAndStar, 120, 76, 0);
    gSprites[spriteId].oam.paletteNum = 0;
    gSprites[spriteId].callback = SpriteCallback_Star;
    StartSpriteAnim(&gSprites[spriteId], 4);
    gSprites[spriteId].spAnimNum = 0;
    gSprites[spriteId].spData0 = 0;
    gSprites[spriteId].spCurX = 0;
    gSprites[spriteId].spCurY = 0;
    gSprites[spriteId].spCenterX = 120;
    gSprites[spriteId].spCenterY = 76;
    gSprites[spriteId].spDeltaX = 0;
    gSprites[spriteId].spDeltaY = -100;
    return spriteId;
}

static void SpriteCallback_Star(struct Sprite *sprite)
{
    s16 x, y;
    sprite->spCurX += sprite->spDeltaX;
    sprite->spCurY += sprite->spDeltaY;
    sprite->x = sprite->spCenterX + (sprite->spCurX >> 8);
    sprite->y = sprite->spCenterY + (sprite->spCurY >> 8);
    if (sprite->x <= 104
        || sprite->x > 132
        || sprite->y <= 60
        || sprite->y > 88)
        sprite->callback = SpriteCallback_DestroyStar;
}

static void SpriteCallback_DestroyStar(struct Sprite *sprite)
{
    DestroySprite(sprite);
}

#undef spAnimNum
#undef spCenterY
#undef spCenterX
#undef spCurY
#undef spCurX
#undef spDeltaY
#undef spDeltaX
#undef spData0
