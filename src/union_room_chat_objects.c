#include "global.h"
#include "gflib.h"
#include "decompress.h"
#include "graphics.h"
#include "union_room_chat.h"

struct UnionRoomChat3
{
    struct Sprite *selectorCursorSprite;
    struct Sprite *characterSelectCursorSprite;
    struct Sprite *textEntryCursorSprite;
    struct Sprite *rButtonSprite;
    struct Sprite *chatIconsSprite;
    u16 cursorBlinkTimer;
};

static EWRAM_DATA struct UnionRoomChat3 *sWork = NULL;

static void SpriteCB_TextEntryCursor(struct Sprite *sprite);
static void SpriteCB_CharacterSelectCursor(struct Sprite *sprite);

static const u16 sUnionRoomChatInterfacePal[] = INCBIN_U16("graphics/union_room_chat/unk_845AC14.gbapal");
static const u32 sSelectorCursorGfxTiles[] = INCBIN_U32("graphics/union_room_chat/unk_845AC34.4bpp.lz");
static const u32 sHorizontalBarGfxTiles[] = INCBIN_U32("graphics/union_room_chat/unk_845AEB8.4bpp.lz");
static const u32 sMenuCursorGfxTiles[] = INCBIN_U32("graphics/union_room_chat/unk_845AED8.4bpp.lz");
static const u32 sRButtonGfxTiles[] = INCBIN_U32("graphics/union_room_chat/unk_845AF04.4bpp.lz");

static const struct CompressedSpriteSheet sSpriteSheets[] = {
    {sSelectorCursorGfxTiles, 0x1000, 0},
    {sMenuCursorGfxTiles, 0x0040, 1},
    {sHorizontalBarGfxTiles, 0x0040, 2},
    {sRButtonGfxTiles, 0x0080, 3},
    {gUnionRoomChatIcons, 0x0400, 4}
};

static const struct SpritePalette sSpritePalette = {
    sUnionRoomChatInterfacePal, 0
};

static const struct OamData sOamData_64x32_1 = {
    .shape = SPRITE_SHAPE(64x32),
    .size = SPRITE_SIZE(64x32),
    .priority = 1
};

static const union AnimCmd sAnim_CursorSmallOpen[] = {
    ANIMCMD_FRAME(0x00, 30),
    ANIMCMD_END
};

static const union AnimCmd sAnim_CursorSmallClosed[] = {
    ANIMCMD_FRAME(0x20, 30),
    ANIMCMD_END
};

static const union AnimCmd sAnim_CursorLargeOpen[] = {
    ANIMCMD_FRAME(0x40, 30),
    ANIMCMD_END
};

static const union AnimCmd sAnim_CursorLargeClosed[] = {
    ANIMCMD_FRAME(0x60, 30),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnims_SelectorCursor[] = {
    sAnim_CursorSmallOpen,
    sAnim_CursorSmallClosed,
    sAnim_CursorLargeOpen,
    sAnim_CursorLargeClosed
};

static const struct SpriteTemplate sSpriteTemplate_SelectorCursor = {
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &sOamData_64x32_1,
    .anims = sSpriteAnims_SelectorCursor,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData sOamData_8x16_2 = {
    .shape = SPRITE_SHAPE(8x16),
    .size = SPRITE_SIZE(8x16),
    .priority = 2
};

static const struct SpriteTemplate sSpriteTemplate_TextEntryCursor = {
    .tileTag = 2,
    .paletteTag = 0,
    .oam = &sOamData_8x16_2,
    .anims = gDummySpriteAnimTable,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_TextEntryCursor
};

static const struct SpriteTemplate sSpriteTemplate_CharacterSelectCursor = {
    .tileTag = 1,
    .paletteTag = 0,
    .oam = &sOamData_8x16_2,
    .anims = gDummySpriteAnimTable,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_CharacterSelectCursor
};

static const struct OamData sOamData_16x16_2 = {
    .shape = SPRITE_SHAPE(16x16),
    .size = SPRITE_SIZE(16x16),
    .priority = 2
};

static const struct OamData sOamData_32x16_2 = {
    .shape = SPRITE_SHAPE(32x16),
    .size = SPRITE_SIZE(32x16),
    .priority = 2
};

static const union AnimCmd sAnim_UnionRoomChatIcons_ToggleCase[] = {
    ANIMCMD_FRAME(0x00, 2),
    ANIMCMD_END
};

static const union AnimCmd sAnim_UnionRoomChatIcons_Dummy1[] = {
    ANIMCMD_FRAME(0x08, 2),
    ANIMCMD_END
};

static const union AnimCmd sAnim_UnionRoomChatIcons_Dummy2[] = {
    ANIMCMD_FRAME(0x10, 2),
    ANIMCMD_END
};

static const union AnimCmd sAnim_UnionRoomChatIcons_Register[] = {
    ANIMCMD_FRAME(0x18, 2),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_UnionRoomChatIcons[] = {
    sAnim_UnionRoomChatIcons_ToggleCase,
    sAnim_UnionRoomChatIcons_Dummy1,
    sAnim_UnionRoomChatIcons_Dummy2,
    sAnim_UnionRoomChatIcons_Register
};

static const struct SpriteTemplate sSpriteTemplate_RButton = {
    .tileTag = 3,
    .paletteTag = 0,
    .oam = &sOamData_16x16_2,
    .anims = gDummySpriteAnimTable,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct SpriteTemplate sSpriteTemplate_UnionRoomChatIcons = {
    .tileTag = 4,
    .paletteTag = 0,
    .oam = &sOamData_32x16_2,
    .anims = sSpriteAnimTable_UnionRoomChatIcons,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

bool32 UnionRoomChat_TryAllocSpriteWork(void)
{
    int i;
    for (i = 0; i < NELEMS(sSpriteSheets); i++)
        LoadCompressedSpriteSheet(&sSpriteSheets[i]);

    LoadSpritePalette(&sSpritePalette);
    sWork = Alloc(sizeof(struct UnionRoomChat3));
    if (sWork == NULL)
        return FALSE;

    return TRUE;
}

void UnionRoomChat_FreeSpriteWork(void)
{
    if (sWork != NULL)
        Free(sWork);
}

void UnionRoomChat_CreateSelectorCursorObj(void)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_SelectorCursor, 10, 24, 0);
    sWork->selectorCursorSprite = &gSprites[spriteId];
}

void UnionRoomChat_ToggleSelectorCursorObjVisibility(bool32 invisible)
{
    sWork->selectorCursorSprite->invisible = invisible;
}

void UnionRoomChat_MoveSelectorCursorObj(void)
{
    u8 x, y;
    u8 page = GetCurrentKeyboardPage();
    UnionRoomChat_GetCursorColAndRow(&x, &y);
    if (page != UNION_ROOM_KB_PAGE_COUNT)
    {
        StartSpriteAnim(sWork->selectorCursorSprite, 0);
        sWork->selectorCursorSprite->x = x * 8 + 10;
        sWork->selectorCursorSprite->y = y * 12 + 24;
    }
    else
    {
        StartSpriteAnim(sWork->selectorCursorSprite, 2);
        sWork->selectorCursorSprite->x = 24;
        sWork->selectorCursorSprite->y = y * 12 + 24;
    }
}

void UnionRoomChat_UpdateObjPalCycle(int arg0)
{
    const u16 *palette = &sUnionRoomChatInterfacePal[arg0 * 2 + 1];
    u8 index = IndexOfSpritePaletteTag(0);
    LoadPalette(palette, index * 16 + 0x101, 4);
}

void UnionRoomChat_SetSelectorCursorClosedImage(void)
{
    if (GetCurrentKeyboardPage() != UNION_ROOM_KB_PAGE_COUNT)
        StartSpriteAnim(sWork->selectorCursorSprite, 1);
    else
        StartSpriteAnim(sWork->selectorCursorSprite, 3);

    sWork->cursorBlinkTimer = 0;
}

bool32 UnionRoomChat_AnimateSelectorCursorReopen(void)
{
    if (sWork->cursorBlinkTimer > 3)
        return FALSE;

    if (++sWork->cursorBlinkTimer > 3)
    {
        if (GetCurrentKeyboardPage() != UNION_ROOM_KB_PAGE_COUNT)
            StartSpriteAnim(sWork->selectorCursorSprite, 0);
        else
            StartSpriteAnim(sWork->selectorCursorSprite, 2);

        return FALSE;
    }

    return TRUE;
}

void UnionRoomChat_SpawnTextEntryPointerSprites(void)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_TextEntryCursor, 76, 152, 2);
    sWork->textEntryCursorSprite = &gSprites[spriteId];
    spriteId = CreateSprite(&sSpriteTemplate_CharacterSelectCursor, 64, 152, 1);
    sWork->characterSelectCursorSprite = &gSprites[spriteId];
}

static void SpriteCB_TextEntryCursor(struct Sprite *sprite)
{
    int var0 = UnionRoomChat_GetMessageEntryCursorPosition();
    if (var0 == 15)
    {
        sprite->invisible = TRUE;
    }
    else
    {
        sprite->invisible = FALSE;
        sprite->x = var0 * 8 + 76;
    }
}

static void SpriteCB_CharacterSelectCursor(struct Sprite *sprite)
{
    if (++sprite->data[0] > 4)
    {
        sprite->data[0] = 0;
        if (++sprite->x2 > 4)
            sprite->x2 = 0;
    }
}

void CreatePageSwitchUISprites(void)
{
    u8 spriteId = CreateSprite(&sSpriteTemplate_RButton, 8, 152, 3);
    sWork->rButtonSprite = &gSprites[spriteId];
    spriteId = CreateSprite(&sSpriteTemplate_UnionRoomChatIcons, 32, 152, 4);
    sWork->chatIconsSprite = &gSprites[spriteId];
    sWork->chatIconsSprite->invisible = TRUE;
}

void UpdateVisibleUnionRoomChatIcon(void)
{
    if (GetCurrentKeyboardPage() == UNION_ROOM_KB_PAGE_COUNT)
    {
        if (UnionRoomChat_LenMessageEntryBuffer() != 0)
        {
            // REGISTER
            sWork->chatIconsSprite->invisible = FALSE;
            StartSpriteAnim(sWork->chatIconsSprite, 3);
        }
        else
        {
            sWork->chatIconsSprite->invisible = TRUE;
        }
    }
    else
    {
        int anim = UnionRoomChat_GetWhetherShouldShowCaseToggleIcon();
        if (anim == 3)
        {
            sWork->chatIconsSprite->invisible = TRUE;
        }
        else
        {
            // A <--> a
            sWork->chatIconsSprite->invisible = FALSE;
            StartSpriteAnim(sWork->chatIconsSprite, anim);
        }
    }
}
