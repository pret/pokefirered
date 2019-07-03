#ifndef GUARD_MENU_INDICATORS_H
#define GUARD_MENU_INDICATORS_H

#include "global.h"

// Exported type declarations

// Exported RAM declarations

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

struct ScrollArrowsTemplate
{
    u8 firstArrowType;
    u8 firstX;
    u8 firstY;
    u8 secondArrowType;
    u8 secondX;
    u8 secondY;
    u16 fullyUpThreshold;
    u16 fullyDownThreshold;
    u16 tileTag;
    u16 palTag;
    u8 palNum;
};

struct ScrollIndicatorTemplate
{
    u8 animNum:4;
    u8 bounceDir:4;
    u8 multiplier;
    s16 frequency;
};

struct CursorStruct
{
    u8 left;
    u8 top;
    u16 rowWidth;
    u16 rowHeight;
    u16 tileTag;
    u16 palTag;
    u8 palNum;
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

// Exported ROM declarations
u8 AddScrollIndicatorArrowPairParameterized(u32 arrowType, s32 commonPos, s32 firstPos, s32 secondPos, s32 fullyDownThreshold, s32 tileTag, s32 palTag, u16 *scrollOffset);
u8 AddScrollIndicatorArrowPair(const struct ScrollArrowsTemplate * template, u16 * a1);
void RemoveScrollIndicatorArrowPair(u8);
u8 ListMenuAddCursorObjectInternal(struct CursorStruct *cursor, u32 cursorKind);
u8 ListMenuAddRedOutlineCursorObject(struct CursorStruct *cursor);
void ListMenuUpdateRedOutlineCursorObject(u8 taskId, u16 x, u16 y);
void ListMenuRemoveRedOutlineCursorObject(u8 taskId);

#endif //GUARD_MENU_INDICATORS_H
