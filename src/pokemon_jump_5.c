#include "global.h"
#include "gflib.h"
#include "decompress.h"
#include "minigame_countdown.h"
#include "pokemon_jump.h"
#include "data.h"
#include "trig.h"
#include "constants/songs.h"

static void sub_814AF74(struct Sprite *sprite);
static void sub_814B038(struct Sprite *sprite);
static void sub_814B100(struct Sprite *sprite);
static void sub_814B1CC(struct Sprite *sprite);

static const u16 gPkmnJumpPal1[] = INCBIN_U16("graphics/link_games/pkmnjump_pal1.gbapal");
static const u16 gPkmnJumpPal2[] = INCBIN_U16("graphics/link_games/pkmnjump_pal2.gbapal");

static const u32 gPkmnJumpRopeGfx1[] = INCBIN_U32("graphics/link_games/pkmnjump_rope1.4bpp.lz");
static const u32 gPkmnJumpRopeGfx2[] = INCBIN_U32("graphics/link_games/pkmnjump_rope2.4bpp.lz");
static const u32 gPkmnJumpRopeGfx3[] = INCBIN_U32("graphics/link_games/pkmnjump_rope3.4bpp.lz");
static const u32 gPkmnJumpRopeGfx4[] = INCBIN_U32("graphics/link_games/pkmnjump_rope4.4bpp.lz");

static const u32 gPkmnJumpStarGfx[] = INCBIN_U32("graphics/link_games/pkmnjump_star.4bpp.lz");

static const struct CompressedSpriteSheet gUnknown_846E0B0[] =
{
    {gPkmnJumpRopeGfx1, 0x600, 5},
    {gPkmnJumpRopeGfx2, 0x0c00, 6},
    {gPkmnJumpRopeGfx3, 0x0600, 7},
    {gPkmnJumpRopeGfx4, 0x0600, 8},
    {gPkmnJumpStarGfx, 0x0200, 10},
};

static const struct SpritePalette gUnknown_846E0D8[] =
{
    {gPkmnJumpPal1, 5},
    {gPkmnJumpPal2, 6},
};

// Forward declarations.
static const struct OamData gUnknown_846E170;
static const struct SpriteTemplate gUnknown_846E220;
static const struct SpriteTemplate gUnknown_846E238;
static const struct SpriteTemplate gUnknown_846E250;
static const struct SpriteTemplate gUnknown_846E268;

static const struct SpriteTemplate gUnknown_846E0E8 =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gUnknown_846E170,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const s16 gUnknown_846E100[][10] =
{
    {0x60, 0x60, 0x60, 0x72, 0x78, 0x78, 0x78, 0x72, 0x60, 0x60},
    {0x46, 0x50, 0x60, 0x72, 0x78, 0x80, 0x78, 0x72, 0x60, 0x50},
    {0x32, 0x48, 0x60, 0x72, 0x80, 0x88, 0x80, 0x72, 0x60, 0x48},
    {0x2a, 0x48, 0x60, 0x72, 0x80, 0x88, 0x80, 0x72, 0x60, 0x48},
};

static const s16 gUnknown_846E150[] = {0x10, 0x28, 0x48, 0x68, 0x88, 0xa8, 0xc8, 0xe0};

static const struct SpriteTemplate *const gUnknown_846E160[] =
{
    &gUnknown_846E220,
    &gUnknown_846E238,
    &gUnknown_846E250,
    &gUnknown_846E268,
};

static const struct OamData gUnknown_846E170 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
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

static const struct OamData gUnknown_846E178 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x32),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0
};

static const struct OamData gUnknown_846E180 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x32),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0
};

static const struct OamData gUnknown_846E188 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x16),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0
};

static const union AnimCmd sSpriteAnim_82FBEE8[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_82FBEF0[] =
{
    ANIMCMD_FRAME(8, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_82FBEF8[] =
{
    ANIMCMD_FRAME(16, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_82FBF00[] =
{
    ANIMCMD_FRAME(24, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_82FBF08[] =
{
    ANIMCMD_FRAME(32, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_82FBF10[] =
{
    ANIMCMD_FRAME(40, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_82FBF18[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_82FBF20[] =
{
    ANIMCMD_FRAME(16, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_82FBF28[] =
{
    ANIMCMD_FRAME(32, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_82FBF30[] =
{
    ANIMCMD_FRAME(48, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_82FBF38[] =
{
    ANIMCMD_FRAME(64, 1),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_82FBF40[] =
{
    ANIMCMD_FRAME(80, 1),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_82FBF48[] =
{
    sSpriteAnim_82FBEE8,
    sSpriteAnim_82FBEF0,
    sSpriteAnim_82FBEF8,
    sSpriteAnim_82FBF00,
    sSpriteAnim_82FBF08,
    sSpriteAnim_82FBF10
};

static const union AnimCmd *const sSpriteAnimTable_82FBF60[] =
{
    sSpriteAnim_82FBF18,
    sSpriteAnim_82FBF20,
    sSpriteAnim_82FBF28,
    sSpriteAnim_82FBF30,
    sSpriteAnim_82FBF38,
    sSpriteAnim_82FBF40
};

static const struct SpriteTemplate gUnknown_846E220 =
{
    .tileTag = 5,
    .paletteTag = 5,
    .oam = &gUnknown_846E178,
    .anims = sSpriteAnimTable_82FBF48,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate gUnknown_846E238 =
{
    .tileTag = 6,
    .paletteTag = 5,
    .oam = &gUnknown_846E180,
    .anims = sSpriteAnimTable_82FBF60,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate gUnknown_846E250 =
{
    .tileTag = 7,
    .paletteTag = 5,
    .oam = &gUnknown_846E188,
    .anims = sSpriteAnimTable_82FBF48,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct SpriteTemplate gUnknown_846E268 =
{
    .tileTag = 8,
    .paletteTag = 5,
    .oam = &gUnknown_846E188,
    .anims = sSpriteAnimTable_82FBF48,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct OamData sOamData_82FBFD8 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0
};

static const union AnimCmd sSpriteAnim_82FBFE0[] =
{
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_82FBFE8[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_FRAME(12, 4),
    ANIMCMD_LOOP(1),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_82FC004[] =
{
    sSpriteAnim_82FBFE0,
    sSpriteAnim_82FBFE8
};

static const struct SpriteTemplate gUnknown_846E2B4 =
{
    .tileTag = 10,
    .paletteTag = 5,
    .oam = &sOamData_82FBFD8,
    .anims = sSpriteAnimTable_82FC004,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

void sub_814AD6C(struct PokemonJump2 *arg0)
{
    int i;

    for (i = 0; i < NELEMS(gUnknown_846E0B0); i++)
        LoadCompressedSpriteSheet(&gUnknown_846E0B0[i]);

    for (i = 0; i < NELEMS(gUnknown_846E0D8); i++)
        LoadSpritePalette(&gUnknown_846E0D8[i]);

    arg0->unkE = IndexOfSpritePaletteTag(5);
    arg0->unkF = IndexOfSpritePaletteTag(6);
}

static void sub_814ADB4(struct Sprite *sprite)
{
    int i;
    for (i = 0; i < 8; i++)
        sprite->data[i] = 0;
}

void sub_814ADCC(struct PokemonJump2 *arg0, struct PokemonJump1_MonInfo *jumpMon, s16 x, s16 y, u8 multiplayerId)
{
    struct SpriteTemplate spriteTemplate;
    struct SpriteSheet spriteSheet;
    struct CompressedSpritePalette spritePalette;
    u8 *buffer;
    u8 *unusedBuffer;
    u8 subpriority;
    u8 spriteId;

    spriteTemplate = gUnknown_846E0E8;
    buffer = Alloc(0x2000);
    unusedBuffer = Alloc(0x800);
    if (multiplayerId == sub_81499B4())
        subpriority = 3;
    else
        subpriority = multiplayerId + 4;

    if (buffer && unusedBuffer)
    {
        HandleLoadSpecialPokePic(
            &gMonFrontPicTable[jumpMon->species],
            buffer,
            jumpMon->species,
            jumpMon->personality);

        spriteSheet.data = buffer;
        spriteSheet.tag = multiplayerId;
        spriteSheet.size = 0x800;
        LoadSpriteSheet(&spriteSheet);

        spritePalette.data = GetMonSpritePalFromSpeciesAndPersonality(jumpMon->species, jumpMon->otId, jumpMon->personality);
        spritePalette.tag = multiplayerId;
        LoadCompressedSpritePalette(&spritePalette);

        Free(buffer);
        Free(unusedBuffer);

        spriteTemplate.tileTag += multiplayerId;
        spriteTemplate.paletteTag += multiplayerId;
        spriteId = CreateSprite(&spriteTemplate, x, y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            arg0->unk81A8[multiplayerId] = &gSprites[spriteId];
            arg0->unk81FC[multiplayerId] = subpriority;
            return;
        }
    }

    arg0->unk81A8[multiplayerId] = NULL;
}

void sub_814AF0C(struct PokemonJump2 *arg0, int multiplayerId)
{
    sub_814ADB4(arg0->unk81BC[multiplayerId]);
    arg0->unk81BC[multiplayerId]->data[7] = arg0->unk81A8[multiplayerId] - gSprites;
    arg0->unk81BC[multiplayerId]->invisible = 0;
    arg0->unk81BC[multiplayerId]->pos1.y = 96;
    arg0->unk81BC[multiplayerId]->callback = sub_814AF74;
    StartSpriteAnim(arg0->unk81BC[multiplayerId], 1);
}

static void sub_814AF74(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (sprite->animEnded)
        {
            sprite->invisible = 1;
            sprite->callback = SpriteCallbackDummy;
        }
        break;
    case 1:
        sprite->pos1.y--;
        sprite->data[1]++;
        if (sprite->pos1.y <= 72)
        {
            sprite->pos1.y = 72;
            sprite->data[0]++;
        }
        break;
    case 2:
        if (++sprite->data[1] >= 48)
        {
            sprite->invisible = 1;
            sprite->callback = SpriteCallbackDummy;
        }
        break;
    }
}

void sub_814AFE8(struct PokemonJump2 *arg0, int multiplayerId)
{
    arg0->unk81A8[multiplayerId]->callback = sub_814B038;
    arg0->unk81A8[multiplayerId]->pos2.y = 0;
    sub_814ADB4(arg0->unk81A8[multiplayerId]);
}

bool32 sub_814B010(struct PokemonJump2 *arg0, int multiplayerId)
{
    return arg0->unk81A8[multiplayerId]->callback == sub_814B038;
}

static void sub_814B038(struct Sprite *sprite)
{
    if (++sprite->data[1] > 1)
    {
        if (++sprite->data[2] & 1)
            sprite->pos2.y = 2;
        else
            sprite->pos2.y = -2;

        sprite->data[1] = 0;
    }

    if (sprite->data[2] > 12)
    {
        sprite->pos2.y = 0;
        sprite->callback = SpriteCallbackDummy;
    }
}

void sub_814B080(struct PokemonJump2 *arg0, int multiplayerId)
{
    sub_814ADB4(arg0->unk81A8[multiplayerId]);
    arg0->unk81A8[multiplayerId]->callback = sub_814B100;
}

void sub_814B0A8(struct PokemonJump2 *arg0)
{
    int i;
    u16 numPlayers = sub_81499A4();
    for (i = 0; i < numPlayers; i++)
    {
        if (arg0->unk81A8[i]->callback == sub_814B100)
        {
            arg0->unk81A8[i]->invisible = 0;
            arg0->unk81A8[i]->callback = SpriteCallbackDummy;
            arg0->unk81A8[i]->subpriority = 10;
        }
    }
}

static void sub_814B100(struct Sprite *sprite)
{
    if (++sprite->data[0] > 3)
    {
        sprite->data[0] = 0;
        sprite->invisible ^= 1;
    }
}

void sub_814B134(struct PokemonJump2 *arg0)
{
    int i;
    u16 numPlayers = sub_81499A4();
    for (i = 0; i < numPlayers; i++)
        arg0->unk81A8[i]->subpriority = arg0->unk81FC[i];
}

void sub_814B168(struct PokemonJump2 *arg0, int multiplayerId)
{
    sub_814ADB4(arg0->unk81A8[multiplayerId]);
    arg0->unk81A8[multiplayerId]->callback = sub_814B1CC;
}

bool32 sub_814B190(struct PokemonJump2 *arg0)
{
    int i;
    u16 numPlayers = sub_81499A4();
    for (i = 0; i < numPlayers; i++)
    {
        if (arg0->unk81A8[i]->callback == sub_814B1CC)
            return TRUE;
    }

    return FALSE;
}

static void sub_814B1CC(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        PlaySE(SE_JITE_PYOKO);
        sprite->data[1] = 0;
        sprite->data[0]++;
        // fall through
    case 1:
        sprite->data[1] += 4;
        if (sprite->data[1] > 0x7F)
            sprite->data[1] = 0;

        sprite->pos2.y = -(gSineTable[sprite->data[1]] >> 3);
        if (sprite->data[1] == 0)
        {
            if (++sprite->data[2] < 2)
                sprite->data[0] = 0;
            else
                sprite->callback = SpriteCallbackDummy;
        }
        break;
    }
}

void sub_814B240(struct PokemonJump2 *arg0, s16 x, s16 y, u8 multiplayerId)
{
    u8 spriteId = CreateSprite(&gUnknown_846E2B4, x, y, 1);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].invisible = 1;
        arg0->unk81BC[multiplayerId] = &gSprites[spriteId];
    }
}

void sub_814B294(struct PokemonJump2 *arg0)
{
    int i;
    int count;
    u8 spriteId;

    count = 0;
    for (i = 0; i < 4; i++)
    {
        spriteId = CreateSprite(gUnknown_846E160[i], gUnknown_846E150[count], gUnknown_846E100[i][0], 2);
        arg0->unk81D0[count] = &gSprites[spriteId];
        count++;
    }

    for (i = 3; i >= 0; i--)
    {
        spriteId = CreateSprite(gUnknown_846E160[i], gUnknown_846E150[count], gUnknown_846E100[i][0], 2);
        arg0->unk81D0[count] = &gSprites[spriteId];
        arg0->unk81D0[count]->hFlip = 1;
        count++;
    }
}

void sub_814B348(struct PokemonJump2 *arg0, int arg1)
{
    int i, count, palNum;
    int priority;

    if (arg1 > 5)
    {
        arg1 = 10 - arg1;
        priority = 3;
        palNum = arg0->unkF;
    }
    else
    {
        priority = 2;
        palNum = arg0->unkE;
    }

    count = 0;
    for (i = 0; i < 4; i++)
    {
        arg0->unk81D0[count]->pos1.y = gUnknown_846E100[i][arg1];
        arg0->unk81D0[count]->oam.priority = priority;
        arg0->unk81D0[count]->oam.paletteNum = palNum;
        StartSpriteAnim(arg0->unk81D0[count], arg1);
        count++;
    }

    for (i = 3; i >= 0; i--)
    {
        arg0->unk81D0[count]->pos1.y = gUnknown_846E100[i][arg1];
        arg0->unk81D0[count]->oam.priority = priority;
        arg0->unk81D0[count]->oam.paletteNum = palNum;
        StartSpriteAnim(arg0->unk81D0[count], arg1);
        count++;
    }
}

void sub_814B43C(struct PokemonJump2 *arg0)
{
    StartMinigameCountdown(9, 7, 120, 80, 0);
    sub_814B134(arg0);
}

bool32 sub_814B460(void)
{
    return IsMinigameCountdownRunning();
}
