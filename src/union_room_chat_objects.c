#include "global.h"
#include "gflib.h"
#include "decompress.h"
#include "graphics.h"
#include "union_room_chat.h"

struct UnionRoomChat3
{
    struct Sprite *unk0;
    struct Sprite *unk4;
    struct Sprite *unk8;
    struct Sprite *unkC;
    struct Sprite *unk10;
    u16 unk14;
};

EWRAM_DATA struct UnionRoomChat3 *gUnknown_203B0E8 = NULL;

void sub_812B09C(struct Sprite * sprite);
void sub_812B0D4(struct Sprite * sprite);

const u16 gUnknown_845AC14[] = INCBIN_U16("graphics/union_room_chat/unk_845AC14.gbapal");
const u32 gUnknown_845AC34[] = INCBIN_U32("graphics/union_room_chat/unk_845AC34.4bpp.lz");
const u32 gUnknown_845AEB8[] = INCBIN_U32("graphics/union_room_chat/unk_845AEB8.4bpp.lz");
const u32 gUnknown_845AED8[] = INCBIN_U32("graphics/union_room_chat/unk_845AED8.4bpp.lz");
const u32 gUnknown_845AF04[] = INCBIN_U32("graphics/union_room_chat/unk_845AF04.4bpp.lz");

const struct CompressedSpriteSheet gUnknown_845AF58[] = {
    {gUnknown_845AC34, 0x1000, 0},
    {gUnknown_845AED8, 0x0040, 1},
    {gUnknown_845AEB8, 0x0040, 2},
    {gUnknown_845AF04, 0x0080, 3},
    {gUnknown_8EA1A50, 0x0400, 4}
};

const struct SpritePalette gUnknown_845AF80 = {
    gUnknown_845AC14, 0
};

const struct OamData gOamData_845AF88 = {
    .shape = SPRITE_SHAPE(64x32),
    .size = SPRITE_SIZE(64x32),
    .priority = 1
};

const union AnimCmd gAnimCmd_845AF90[] = {
    ANIMCMD_FRAME(0x00, 30),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_845AF98[] = {
    ANIMCMD_FRAME(0x20, 30),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_845AFA0[] = {
    ANIMCMD_FRAME(0x40, 30),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_845AFA8[] = {
    ANIMCMD_FRAME(0x60, 30),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_845AFB0[] = {
    gAnimCmd_845AF90,
    gAnimCmd_845AF98,
    gAnimCmd_845AFA0,
    gAnimCmd_845AFA8
};

const struct SpriteTemplate gUnknown_845AFC0 = {
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gOamData_845AF88,
    .anims = gSpriteAnimTable_845AFB0,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct OamData gOamData_845AFD8 = {
    .shape = SPRITE_SHAPE(8x16),
    .size = SPRITE_SIZE(8x16),
    .priority = 2
};

const struct SpriteTemplate gUnknown_845AFE0 = {
    .tileTag = 2,
    .paletteTag = 0,
    .oam = &gOamData_845AFD8,
    .anims = gDummySpriteAnimTable,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812B09C
};

const struct SpriteTemplate gUnknown_845AFF8 = {
    .tileTag = 1,
    .paletteTag = 0,
    .oam = &gOamData_845AFD8,
    .anims = gDummySpriteAnimTable,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_812B0D4
};

const struct OamData gOamData_845B010 = {
    .shape = SPRITE_SHAPE(16x16),
    .size = SPRITE_SIZE(16x16),
    .priority = 2
};

const struct OamData gOamData_845B018 = {
    .shape = SPRITE_SHAPE(32x16),
    .size = SPRITE_SIZE(32x16),
    .priority = 2
};

const union AnimCmd gAnimCmd_845B020[] = {
    ANIMCMD_FRAME(0x00, 2),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_845B028[] = {
    ANIMCMD_FRAME(0x08, 2),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_845B030[] = {
    ANIMCMD_FRAME(0x10, 2),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_845B038[] = {
    ANIMCMD_FRAME(0x18, 2),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_845B040[] = {
    gAnimCmd_845B020,
    gAnimCmd_845B028,
    gAnimCmd_845B030,
    gAnimCmd_845B038
};

const struct SpriteTemplate gUnknown_845B050 = {
    .tileTag = 3,
    .paletteTag = 0,
    .oam = &gOamData_845B010,
    .anims = gDummySpriteAnimTable,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct SpriteTemplate gUnknown_845B068 = {
    .tileTag = 4,
    .paletteTag = 0,
    .oam = &gOamData_845B018,
    .anims = gSpriteAnimTable_845B040,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

bool32 sub_812AE70(void)
{
    u32 i;
    for (i = 0; i < 5; i++)
        LoadCompressedSpriteSheet(&gUnknown_845AF58[i]);

    LoadSpritePalette(&gUnknown_845AF80);
    gUnknown_203B0E8 = Alloc(0x18);
    if (!gUnknown_203B0E8)
        return FALSE;

    return TRUE;
}

void sub_812AEB0(void)
{
    if (gUnknown_203B0E8)
        Free(gUnknown_203B0E8);
}

void sub_812AEC8(void)
{
    u8 spriteId = CreateSprite(&gUnknown_845AFC0, 10, 24, 0);
    gUnknown_203B0E8->unk0 = &gSprites[spriteId];
}

void sub_812AEFC(bool32 invisible)
{
    gUnknown_203B0E8->unk0->invisible = invisible;
}

void sub_812AF1C(void)
{
    u8 x, y;
    u8 page = GetCurrentKeyboardPage();
    sub_8129700(&x, &y);
    if (page != UNION_ROOM_KB_PAGE_COUNT)
    {
        StartSpriteAnim(gUnknown_203B0E8->unk0, 0);
        gUnknown_203B0E8->unk0->pos1.x = x * 8 + 10;
        gUnknown_203B0E8->unk0->pos1.y = y * 12 + 24;
    }
    else
    {
        StartSpriteAnim(gUnknown_203B0E8->unk0, 2);
        gUnknown_203B0E8->unk0->pos1.x = 24;
        gUnknown_203B0E8->unk0->pos1.y = y * 12 + 24;
    }
}

void sub_812AF8C(int arg0)
{
    const u16 *palette = &gUnknown_845AC14[arg0 * 2 + 1];
    u8 index = IndexOfSpritePaletteTag(0);
    LoadPalette(palette, index * 16 + 0x101, 4);
}

void sub_812AFC0(void)
{
    if (GetCurrentKeyboardPage() != UNION_ROOM_KB_PAGE_COUNT)
        StartSpriteAnim(gUnknown_203B0E8->unk0, 1);
    else
        StartSpriteAnim(gUnknown_203B0E8->unk0, 3);

    gUnknown_203B0E8->unk14 = 0;
}

bool32 sub_812AFFC(void)
{
    if (gUnknown_203B0E8->unk14 > 3)
        return FALSE;

    if (++gUnknown_203B0E8->unk14 > 3)
    {
        if (GetCurrentKeyboardPage() != UNION_ROOM_KB_PAGE_COUNT)
            StartSpriteAnim(gUnknown_203B0E8->unk0, 0);
        else
            StartSpriteAnim(gUnknown_203B0E8->unk0, 2);

        return FALSE;
    }

    return TRUE;
}

void sub_812B048(void)
{
    u8 spriteId = CreateSprite(&gUnknown_845AFE0, 76, 152, 2);
    gUnknown_203B0E8->unk8 = &gSprites[spriteId];
    spriteId = CreateSprite(&gUnknown_845AFF8, 64, 152, 1);
    gUnknown_203B0E8->unk4 = &gSprites[spriteId];
}

void sub_812B09C(struct Sprite *sprite)
{
    int var0 = sub_81297DC();
    if (var0 == 15)
    {
        sprite->invisible = TRUE;
    }
    else
    {
        sprite->invisible = FALSE;
        sprite->pos1.x = var0 * 8 + 76;
    }
}

void sub_812B0D4(struct Sprite *sprite)
{
    if (++sprite->data[0] > 4)
    {
        sprite->data[0] = 0;
        if (++sprite->pos2.x > 4)
            sprite->pos2.x = 0;
    }
}

void sub_812B100(void)
{
    u8 spriteId = CreateSprite(&gUnknown_845B050, 8, 152, 3);
    gUnknown_203B0E8->unkC = &gSprites[spriteId];
    spriteId = CreateSprite(&gUnknown_845B068, 32, 152, 4);
    gUnknown_203B0E8->unk10 = &gSprites[spriteId];
    gUnknown_203B0E8->unk10->invisible = 1;
}

void sub_812B160(void)
{
    if (GetCurrentKeyboardPage() == UNION_ROOM_KB_PAGE_COUNT)
    {
        if (sub_8129720() != 0)
        {
            gUnknown_203B0E8->unk10->invisible = 0;
            StartSpriteAnim(gUnknown_203B0E8->unk10, 3);
        }
        else
        {
            gUnknown_203B0E8->unk10->invisible = 1;
        }
    }
    else
    {
        int anim = sub_81297E8();
        if (anim == 3)
        {
            gUnknown_203B0E8->unk10->invisible = 1;
        }
        else
        {
            gUnknown_203B0E8->unk10->invisible = 0;
            StartSpriteAnim(gUnknown_203B0E8->unk10, anim);
        }
    }
}
