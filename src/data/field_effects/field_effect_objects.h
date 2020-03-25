const struct SpritePalette gUnknown_83A5340 = { .data = gUnknown_8398FA8, .tag = 0x1004 };
const struct SpritePalette gUnknown_83A5348 = { .data = gUnknown_8398FC8, .tag = 0x1005 };

const union AnimCmd gUnknown_83A5350[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A5358[] = 
{
    gUnknown_83A5350,
};

const struct SpriteFrameImage gUnknown_83A535C[] = { obj_frame_tiles(gUnknown_8398048) };
const struct SpriteFrameImage gUnknown_83A5364[] = { obj_frame_tiles(gUnknown_8398068) };
const struct SpriteFrameImage gUnknown_83A536C[] = { obj_frame_tiles(gUnknown_83980A8) };
const struct SpriteFrameImage gUnknown_83A5374[] = { obj_frame_tiles(gUnknown_8398128) };

const struct SpriteTemplate gUnknown_83A537C =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = SPRITE_INVALID_TAG,
    .oam = &gObjectEventBaseOam_8x8,
    .anims = gUnknown_83A5358,
    .images = gUnknown_83A535C,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateShadowFieldEffect,
};

const struct SpriteTemplate gUnknown_83A5394 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = SPRITE_INVALID_TAG,
    .oam = &gObjectEventBaseOam_16x8,
    .anims = gUnknown_83A5358,
    .images = gUnknown_83A5364,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateShadowFieldEffect,
};

const struct SpriteTemplate gUnknown_83A53AC =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = SPRITE_INVALID_TAG,
    .oam = &gObjectEventBaseOam_32x8,
    .anims = gUnknown_83A5358,
    .images = gUnknown_83A536C,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateShadowFieldEffect,
};

const struct SpriteTemplate gUnknown_83A53C4 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = SPRITE_INVALID_TAG,
    .oam = &gObjectEventBaseOam_64x32,
    .anims = gUnknown_83A5358,
    .images = gUnknown_83A5374,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateShadowFieldEffect,
};

const struct SpriteFrameImage gUnknown_83A53DC[] =
{
    overworld_frame(gUnknown_839A008, 2, 2, 0),
    overworld_frame(gUnknown_839A008, 2, 2, 1),
    overworld_frame(gUnknown_839A008, 2, 2, 2),
    overworld_frame(gUnknown_839A008, 2, 2, 3),
    overworld_frame(gUnknown_839A008, 2, 2, 4),
};

const union AnimCmd gUnknown_83A5404[] =
{
    ANIMCMD_FRAME(1, 10),
    ANIMCMD_FRAME(2, 10),
    ANIMCMD_FRAME(3, 10),
    ANIMCMD_FRAME(4, 10),
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A541C[] = 
{
    gUnknown_83A5404,
};

const struct SpriteTemplate gUnknown_83A5420 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1005,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A541C,
    .images = gUnknown_83A53DC,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateTallGrassFieldEffect,
};

const struct SpriteFrameImage gUnknown_83A5438[] =
{
    overworld_frame(gUnknown_83986A8, 2, 2, 0),
    overworld_frame(gUnknown_83986A8, 2, 2, 1),
    overworld_frame(gUnknown_83986A8, 2, 2, 2),
    overworld_frame(gUnknown_83986A8, 2, 2, 3),
    overworld_frame(gUnknown_83986A8, 2, 2, 4),
};

const union AnimCmd gUnknown_83A5460[] =
{
    ANIMCMD_FRAME(0, 12),
    ANIMCMD_FRAME(1, 9),
    ANIMCMD_FRAME(2, 9),
    ANIMCMD_FRAME(3, 9),
    ANIMCMD_FRAME(0, 9),
    ANIMCMD_FRAME(1, 9),
    ANIMCMD_FRAME(2, 11),
    ANIMCMD_FRAME(4, 11),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A5484[] = 
{
    gUnknown_83A5460,
};

const struct SpriteTemplate gUnknown_83A5488 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1005,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A5484,
    .images = gUnknown_83A5438,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = WaitFieldEffectSpriteAnim,
};

const struct SpriteFrameImage gUnknown_83A54A0[] =
{
    overworld_frame(gUnknown_8398928, 2, 2, 0),
    overworld_frame(gUnknown_8398928, 2, 2, 1),
    overworld_frame(gUnknown_8398928, 2, 2, 2),
    overworld_frame(gUnknown_8398928, 2, 2, 3),
    overworld_frame(gUnknown_8398928, 2, 2, 4),
};

const union AnimCmd gUnknown_83A54C8[] =
{
    ANIMCMD_FRAME(0, 12),
    ANIMCMD_FRAME(1, 12),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(3, 12),
    ANIMCMD_FRAME(4, 12),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A54E0[] = 
{
    gUnknown_83A54C8,
};

const struct SpriteTemplate gUnknown_83A54E4 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1005,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A54E0,
    .images = gUnknown_83A54A0,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateAshFieldEffect,
};

const struct SpriteFrameImage gUnknown_83A54FC[] =
{
    overworld_frame(gUnknown_8396B08, 2, 8, 0),
    overworld_frame(gUnknown_8396B08, 2, 8, 1),
    overworld_frame(gUnknown_8396B08, 2, 8, 2),
    overworld_frame(gUnknown_8396B08, 2, 8, 3),
    overworld_frame(gUnknown_8396B08, 2, 8, 4),
    overworld_frame(gUnknown_8396B08, 2, 8, 5),
};

const union AnimCmd gUnknown_83A552C[] =
{
    ANIMCMD_FRAME(0, 48),
    ANIMCMD_FRAME(1, 48),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gUnknown_83A5538[] =
{
    ANIMCMD_FRAME(2, 48),
    ANIMCMD_FRAME(3, 48),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gUnknown_83A5544[] =
{
    ANIMCMD_FRAME(4, 48),
    ANIMCMD_FRAME(5, 48),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gUnknown_83A5550[] =
{
    ANIMCMD_FRAME(4, 48, .hFlip = TRUE),
    ANIMCMD_FRAME(5, 48, .hFlip = TRUE),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gUnknown_83A555C[] = 
{
    gUnknown_83A552C,
    gUnknown_83A5538,
    gUnknown_83A5544,
    gUnknown_83A5550,
};

const struct SpriteTemplate gUnknown_83A556C =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = SPRITE_INVALID_TAG,
    .oam = &gObjectEventBaseOam_32x32,
    .anims = gUnknown_83A555C,
    .images = gUnknown_83A54FC,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateSurfBlobFieldEffect,
};

const struct SpriteFrameImage gUnknown_83A5584[] =
{
    overworld_frame(gUnknown_8398BA8, 2, 2, 0),
    overworld_frame(gUnknown_8398BA8, 2, 2, 1),
    overworld_frame(gUnknown_8398BA8, 2, 2, 2),
    overworld_frame(gUnknown_8398BA8, 2, 2, 3),
    overworld_frame(gUnknown_8398BA8, 2, 2, 4),
    overworld_frame(gUnknown_8398BA8, 2, 2, 5),
    overworld_frame(gUnknown_8398BA8, 2, 2, 6),
    overworld_frame(gUnknown_8398BA8, 2, 2, 7),
};

const union AnimCmd gUnknown_83A55C4[] =
{
    ANIMCMD_FRAME(2, 32),
    ANIMCMD_FRAME(3, 32),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gUnknown_83A55D0[] =
{
    ANIMCMD_FRAME(0, 32),
    ANIMCMD_FRAME(1, 32),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gUnknown_83A55DC[] =
{
    ANIMCMD_FRAME(4, 32),
    ANIMCMD_FRAME(5, 32),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gUnknown_83A55E8[] =
{
    ANIMCMD_FRAME(6, 32),
    ANIMCMD_FRAME(7, 32),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gUnknown_83A55F4[] = 
{
    gUnknown_83A55C4,
    gUnknown_83A55D0,
    gUnknown_83A55DC,
    gUnknown_83A55E8,
};

const struct SpriteTemplate gUnknown_83A5604 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = SPRITE_INVALID_TAG,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A55F4,
    .images = gUnknown_83A5584,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

const struct SpriteFrameImage gUnknown_83A561C[] =
{
    overworld_frame(gUnknown_8399008, 2, 1, 0),
    overworld_frame(gUnknown_8399008, 2, 1, 1),
    overworld_frame(gUnknown_8399008, 2, 1, 2),
};

const union AnimCmd gUnknown_83A5634[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A5644[] = 
{
    gUnknown_83A5634,
};

const struct SpriteTemplate gUnknown_83A5648 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1004,
    .oam = &gObjectEventBaseOam_16x8,
    .anims = gUnknown_83A5644,
    .images = gUnknown_83A561C,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DCCE0,
};

const struct SpriteFrameImage gUnknown_83A5660[] =
{
    overworld_frame(gUnknown_8399188, 2, 1, 0),
    overworld_frame(gUnknown_8399188, 2, 1, 1),
    overworld_frame(gUnknown_8399188, 2, 1, 2),
    overworld_frame(gUnknown_8399188, 2, 1, 3),
};

const union AnimCmd gUnknown_83A5680[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(3, 8),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A5694[] = 
{
    gUnknown_83A5680,
};

const struct SpriteTemplate gUnknown_83A5698 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1005,
    .oam = &gObjectEventBaseOam_16x8,
    .anims = gUnknown_83A5694,
    .images = gUnknown_83A5660,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DCCE0,
};

const struct SpriteFrameImage gUnknown_83A56B0[] =
{
    overworld_frame(gUnknown_839A388, 2, 2, 0),
    overworld_frame(gUnknown_839A388, 2, 2, 1),
};

const union AnimCmd gUnknown_83A56C0[] =
{
    ANIMCMD_FRAME(0, 1, .vFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A56C8[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A56D0[] =
{
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A56D8[] =
{
    ANIMCMD_FRAME(1, 1, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A56E0[] = 
{
    gUnknown_83A56C0,
    gUnknown_83A56C0,
    gUnknown_83A56C8,
    gUnknown_83A56D0,
    gUnknown_83A56D8,
};

const struct SpriteTemplate gUnknown_83A56F4 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1004,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A56E0,
    .images = gUnknown_83A56B0,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateFootprintsTireTracksFieldEffect,
};

const struct SpriteFrameImage gUnknown_83A570C[] =
{
    overworld_frame(gUnknown_839A488, 2, 2, 0),
    overworld_frame(gUnknown_839A488, 2, 2, 1),
};

const union AnimCmd gUnknown_83A571C[] =
{
    ANIMCMD_FRAME(0, 1, .vFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A5724[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A572C[] =
{
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A5734[] =
{
    ANIMCMD_FRAME(1, 1, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A573C[] = 
{
    gUnknown_83A571C,
    gUnknown_83A571C,
    gUnknown_83A5724,
    gUnknown_83A572C,
    gUnknown_83A5734,
};

const struct SpriteTemplate gUnknown_83A5750 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1004,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A573C,
    .images = gUnknown_83A570C,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateFootprintsTireTracksFieldEffect,
};

const struct SpriteFrameImage gUnknown_83A5768[] =
{
    overworld_frame(gUnknown_839A588, 2, 2, 0),
    overworld_frame(gUnknown_839A588, 2, 2, 1),
    overworld_frame(gUnknown_839A588, 2, 2, 2),
    overworld_frame(gUnknown_839A588, 2, 2, 3),
};

const union AnimCmd gUnknown_83A5788[] =
{
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A5790[] =
{
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A5798[] =
{
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A57A0[] =
{
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A57A8[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A57B0[] =
{
    ANIMCMD_FRAME(0, 1, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A57B8[] =
{
    ANIMCMD_FRAME(3, 1, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A57C0[] =
{
    ANIMCMD_FRAME(3, 1),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A57C8[] = 
{
    gUnknown_83A5788,
    gUnknown_83A5788,
    gUnknown_83A5790,
    gUnknown_83A5798,
    gUnknown_83A57A0,
    gUnknown_83A57A8,
    gUnknown_83A57B0,
    gUnknown_83A57B8,
    gUnknown_83A57C0,
};

const struct SpriteTemplate gUnknown_83A57EC =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1004,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A57C8,
    .images = gUnknown_83A5768,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateFootprintsTireTracksFieldEffect,
};

const struct SpriteFrameImage gUnknown_83A5804[] =
{
    overworld_frame(gUnknown_839AA48, 2, 2, 0),
    overworld_frame(gUnknown_839AA48, 2, 2, 1),
    overworld_frame(gUnknown_839AA48, 2, 2, 2),
    overworld_frame(gUnknown_839AA48, 2, 2, 3),
};

const union AnimCmd gUnknown_83A5824[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(3, 8),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A5838[] = 
{
    gUnknown_83A5824,
};

const struct SpriteTemplate gUnknown_83A583C =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1004,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A5838,
    .images = gUnknown_83A5804,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DCCE0,
};

const struct SpriteFrameImage gUnknown_83A5854[] =
{
    overworld_frame(gUnknown_839AC48, 2, 1, 0),
    overworld_frame(gUnknown_839AC48, 2, 1, 1),
};

const union AnimCmd gUnknown_83A5864[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A5870[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(1, 6),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(1, 6),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gUnknown_83A5894[] = 
{
    gUnknown_83A5864,
    gUnknown_83A5870,
};

const struct SpriteTemplate gUnknown_83A589C =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1004,
    .oam = &gObjectEventBaseOam_16x8,
    .anims = gUnknown_83A5894,
    .images = gUnknown_83A5854,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateSplashFieldEffect,
};

const struct SpriteFrameImage gUnknown_83A58B4[] =
{
    overworld_frame(gUnknown_839ACC8, 2, 1, 0),
    overworld_frame(gUnknown_839ACC8, 2, 1, 1),
    overworld_frame(gUnknown_839ACC8, 2, 1, 2),
};

const union AnimCmd gUnknown_83A58CC[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A58DC[] = 
{
    gUnknown_83A58CC,
};

const struct SpriteTemplate gUnknown_83A58E0 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1004,
    .oam = &gObjectEventBaseOam_16x8,
    .anims = gUnknown_83A58DC,
    .images = gUnknown_83A58B4,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DCCE0,
};

const struct SpriteFrameImage gUnknown_83A58F8[] =
{
    overworld_frame(gUnknown_8399E08, 2, 2, 0),
    overworld_frame(gUnknown_8399E08, 2, 2, 1),
    overworld_frame(gUnknown_8399E08, 2, 2, 2),
    overworld_frame(gUnknown_8399E08, 2, 2, 3),
};

const union AnimCmd gUnknown_83A5918[] =
{
    ANIMCMD_FRAME(1, 3),
    ANIMCMD_FRAME(2, 3),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A5938[] = 
{
    gUnknown_83A5918,
};

const struct SpriteTemplate gUnknown_83A593C =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1005,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A5938,
    .images = gUnknown_83A58F8,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateLongGrassFieldEffect,
};

const struct SpriteFrameImage gUnknown_83A5954[] =
{
    overworld_frame(gUnknown_8399488, 2, 2, 0),
    overworld_frame(gUnknown_8399488, 2, 2, 1),
    overworld_frame(gUnknown_8399488, 2, 2, 2),
    overworld_frame(gUnknown_8399488, 2, 2, 3),
    overworld_frame(gUnknown_8399488, 2, 2, 4),
    overworld_frame(gUnknown_8399488, 2, 2, 6),
};

const union AnimCmd gUnknown_83A5984[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(3, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(5, 8),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A59A0[] = 
{
    gUnknown_83A5984,
};

const struct SpriteTemplate gUnknown_83A59A4 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1005,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A59A0,
    .images = gUnknown_83A5954,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DCCE0,
};

const struct SpriteFrameImage gUnknown_83A59BC[] =
{
    overworld_frame(gUnknown_8399788, 2, 2, 0),
    overworld_frame(gUnknown_8399788, 2, 2, 1),
    overworld_frame(gUnknown_8399788, 2, 2, 2),
    overworld_frame(gUnknown_8399788, 2, 2, 3),
    overworld_frame(gUnknown_8399788, 2, 2, 4),
    overworld_frame(gUnknown_8399788, 2, 2, 5),
    overworld_frame(gUnknown_8399788, 2, 2, 6),
    overworld_frame(gUnknown_8399788, 2, 2, 7),
    overworld_frame(gUnknown_8399788, 2, 2, 8),
};

const union AnimCmd gUnknown_83A5A04[] =
{
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(5, 4),
    ANIMCMD_FRAME(6, 4),
    ANIMCMD_FRAME(7, 4),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_JUMP(7),
};

const union AnimCmd *const gUnknown_83A5A2C[] = 
{
    gUnknown_83A5A04,
};

const struct SpriteTemplate gUnknown_83A5A30 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1005,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A5A2C,
    .images = gUnknown_83A59BC,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = WaitFieldEffectSpriteAnim,
};

const struct SpriteFrameImage gUnknown_83A5A48[] =
{
    overworld_frame(gUnknown_8399C08, 2, 2, 0),
    overworld_frame(gUnknown_8399C08, 2, 2, 1),
    overworld_frame(gUnknown_8399C08, 2, 2, 2),
    overworld_frame(gUnknown_8399C08, 2, 2, 3),
};

const union AnimCmd gUnknown_83A5A68[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gUnknown_83A5A84[] = 
{
    gUnknown_83A5A68,
};

const struct SpriteTemplate gUnknown_83A5A88 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1005,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A5A84,
    .images = gUnknown_83A5A48,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = WaitFieldEffectSpriteAnim,
};

const struct SpriteFrameImage gUnknown_83A5AA0[] =
{
    overworld_frame(gUnknown_839A788, 2, 2, 0),
    overworld_frame(gUnknown_839A788, 2, 2, 1),
    overworld_frame(gUnknown_839A788, 2, 2, 2),
    overworld_frame(gUnknown_839A788, 2, 2, 3),
};

const union AnimCmd gUnknown_83A5AC0[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gUnknown_83A5AD4[] = 
{
    gUnknown_83A5AC0,
};

const struct SpriteTemplate gUnknown_83A5AD8 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1004,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A5AD4,
    .images = gUnknown_83A5AA0,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = WaitFieldEffectSpriteAnim,
};

const struct SpriteFrameImage gUnknown_83A5AF0[] =
{
    overworld_frame(gUnknown_839A988, 2, 1, 0),
    overworld_frame(gUnknown_839A988, 2, 1, 1),
    overworld_frame(gUnknown_839A988, 2, 1, 2),
};

const union AnimCmd gUnknown_83A5B08[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A5B18[] = 
{
    gUnknown_83A5B08,
};

const struct SpriteTemplate gUnknown_83A5B1C =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1004,
    .oam = &gObjectEventBaseOam_16x8,
    .anims = gUnknown_83A5B18,
    .images = gUnknown_83A5AF0,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateSandPileFieldEffect,
};

const struct SpriteFrameImage gUnknown_83A5B34[] =
{
    overworld_frame(gUnknown_839AD88, 2, 2, 0),
    overworld_frame(gUnknown_839AD88, 2, 2, 1),
    overworld_frame(gUnknown_839AD88, 2, 2, 2),
    overworld_frame(gUnknown_839AD88, 2, 2, 3),
};

const union AnimCmd gUnknown_83A5B54[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gUnknown_83A5B70[] = 
{
    gUnknown_83A5B54,
};

const struct SpriteTemplate gUnknown_83A5B74 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1004,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A5B70,
    .images = gUnknown_83A5B34,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = WaitFieldEffectSpriteAnim,
};

const union AffineAnimCmd gUnknown_83A5B8C[] =
{
    AFFINEANIMCMD_FRAME(-256, 256, 128, 0),
    AFFINEANIMCMD_FRAME(1, 0, 0, 4),
    AFFINEANIMCMD_FRAME(0, 0, 0, 8),
    AFFINEANIMCMD_FRAME(-1, 0, 0, 4),
    AFFINEANIMCMD_FRAME(0, 0, 0, 8),
    AFFINEANIMCMD_FRAME(-1, 0, 0, 4),
    AFFINEANIMCMD_FRAME(0, 0, 0, 8),
    AFFINEANIMCMD_FRAME(1, 0, 0, 4),
    AFFINEANIMCMD_FRAME(0, 0, 0, 8),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd gUnknown_83A5BDC[] =
{
    AFFINEANIMCMD_FRAME(256, 256, 128, 0),
    AFFINEANIMCMD_FRAME(-1, 0, 0, 4),
    AFFINEANIMCMD_FRAME(0, 0, 0, 8),
    AFFINEANIMCMD_FRAME(1, 0, 0, 4),
    AFFINEANIMCMD_FRAME(0, 0, 0, 8),
    AFFINEANIMCMD_FRAME(1, 0, 0, 4),
    AFFINEANIMCMD_FRAME(0, 0, 0, 8),
    AFFINEANIMCMD_FRAME(-1, 0, 0, 4),
    AFFINEANIMCMD_FRAME(0, 0, 0, 8),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd *const gUnknown_83A5C2C[] =
{
    gUnknown_83A5B8C,
    gUnknown_83A5BDC,
};

const struct SpriteTemplate gUnknown_83A5C34 =
{
    .tileTag = 0x0,
    .paletteTag = SPRITE_INVALID_TAG,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gUnknown_83A5C2C,
    .callback = SpriteCallbackDummy,
};

const struct SpriteFrameImage gUnknown_83A5C4C[] =
{
    overworld_frame(gUnknown_839B008, 2, 4, 0),
    overworld_frame(gUnknown_839B008, 2, 4, 1),
    overworld_frame(gUnknown_839B008, 2, 4, 2),
    overworld_frame(gUnknown_839B008, 2, 4, 3),
    overworld_frame(gUnknown_839B008, 2, 4, 4),
    overworld_frame(gUnknown_839B008, 2, 4, 5),
    overworld_frame(gUnknown_839B008, 2, 4, 6),
};

const union AnimCmd gUnknown_83A5C84[] =
{
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A5C8C[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(5, 4),
    ANIMCMD_FRAME(6, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A5CAC[] = 
{
    gUnknown_83A5C84,
    gUnknown_83A5C8C,
};

const struct SpriteTemplate gUnknown_83A5CB4 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = SPRITE_INVALID_TAG,
    .oam = &gObjectEventBaseOam_16x32,
    .anims = gUnknown_83A5CAC,
    .images = gUnknown_83A5C4C,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateDisguiseFieldEffect,
};

const struct SpriteFrameImage gUnknown_83A5CCC[] =
{
    overworld_frame(gUnknown_839B708, 2, 4, 0),
    overworld_frame(gUnknown_839B708, 2, 4, 1),
    overworld_frame(gUnknown_839B708, 2, 4, 2),
    overworld_frame(gUnknown_839B708, 2, 4, 3),
    overworld_frame(gUnknown_839B708, 2, 4, 4),
    overworld_frame(gUnknown_839B708, 2, 4, 5),
    overworld_frame(gUnknown_839B708, 2, 4, 6),
};

const union AnimCmd gUnknown_83A5D04[] =
{
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A5D0C[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(5, 4),
    ANIMCMD_FRAME(6, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A5D2C[] = 
{
    gUnknown_83A5D04,
    gUnknown_83A5D0C,
};

const struct SpriteTemplate gUnknown_83A5D34 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = SPRITE_INVALID_TAG,
    .oam = &gObjectEventBaseOam_16x32,
    .anims = gUnknown_83A5D2C,
    .images = gUnknown_83A5CCC,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateDisguiseFieldEffect,
};

const struct SpriteFrameImage gUnknown_83A5D4C[] =
{
    overworld_frame(gUnknown_839BE08, 2, 4, 0),
    overworld_frame(gUnknown_839BE08, 2, 4, 1),
    overworld_frame(gUnknown_839BE08, 2, 4, 2),
    overworld_frame(gUnknown_839BE08, 2, 4, 3),
    overworld_frame(gUnknown_839BE08, 2, 4, 4),
    overworld_frame(gUnknown_839BE08, 2, 4, 5),
    overworld_frame(gUnknown_839BE08, 2, 4, 6),
};

const struct SpriteTemplate gUnknown_83A5D84 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = SPRITE_INVALID_TAG,
    .oam = &gObjectEventBaseOam_16x32,
    .anims = gUnknown_83A5CAC,
    .images = gUnknown_83A5D4C,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateDisguiseFieldEffect,
};

const struct SpriteFrameImage gUnknown_83A5D9C[] =
{
    overworld_frame(gUnknown_839D3C8, 8, 8, 0),
    overworld_frame(gUnknown_839D3C8, 8, 8, 1),
    overworld_frame(gUnknown_839D3C8, 8, 8, 2),
    overworld_frame(gUnknown_839D3C8, 8, 8, 3),
    overworld_frame(gUnknown_839D3C8, 8, 8, 4),
};

const union AnimCmd gUnknown_83A5DC4[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A5DCC[] =
{
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A5DD4[] =
{
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A5DDC[] =
{
    ANIMCMD_FRAME(3, 1),
    ANIMCMD_END,
};

const union AnimCmd gUnknown_83A5DE4[] =
{
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A5DEC[] = 
{
    gUnknown_83A5DC4,
    gUnknown_83A5DCC,
    gUnknown_83A5DD4,
    gUnknown_83A5DDC,
    gUnknown_83A5DE4,
};

const struct SpriteTemplate gUnknown_83A5E00 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = SPRITE_INVALID_TAG,
    .oam = &gObjectEventBaseOam_64x64,
    .anims = gUnknown_83A5DEC,
    .images = gUnknown_83A5D9C,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

const struct SpriteFrameImage gUnknown_83A5E18[] =
{
    overworld_frame(gUnknown_839A288, 2, 2, 0),
    overworld_frame(gUnknown_839A288, 2, 2, 1),
};

const union AnimCmd gUnknown_83A5E28[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A5E34[] = 
{
    gUnknown_83A5E28,
};

const struct SpriteTemplate gUnknown_83A5E38 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1005,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A5E34,
    .images = gUnknown_83A5E18,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateShortGrassFieldEffect,
};

const struct SpriteFrameImage gUnknown_83A5E50[] =
{
    overworld_frame(gUnknown_839C508, 2, 2, 0),
};

const union AnimCmd gUnknown_83A5E58[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A5E60[] = 
{
    gUnknown_83A5E58,
};

const struct SpriteTemplate gUnknown_83A5E64 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1005,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A5E60,
    .images = gUnknown_83A5E50,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateHotSpringsWaterFieldEffect,
};

const struct SpriteFrameImage gUnknown_83A5E7C[] =
{
    overworld_frame(gUnknown_839C5A8, 2, 2, 0),
    overworld_frame(gUnknown_839C5A8, 2, 2, 1),
    overworld_frame(gUnknown_839C5A8, 2, 2, 2),
    overworld_frame(gUnknown_839C5A8, 2, 2, 3),
    overworld_frame(gUnknown_839C5A8, 2, 2, 4),
};

const union AnimCmd gUnknown_83A5EA4[] =
{
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(1, 6),
    ANIMCMD_FRAME(2, 6),
    ANIMCMD_FRAME(3, 6),
    ANIMCMD_FRAME(4, 6),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A5EBC[] = 
{
    gUnknown_83A5EA4,
};

const struct SpriteTemplate gUnknown_83A5EC0 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x100D,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A5EBC,
    .images = gUnknown_83A5E7C,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_PopOutOfAsh,
};

const struct SpritePalette gUnknown_83A5ED8 = { .data = gUnknown_839C588, .tag = 0x100D };

const struct SpriteFrameImage gUnknown_83A5EE0[] =
{
    overworld_frame(gUnknown_839C828, 2, 2, 0),
    overworld_frame(gUnknown_839C828, 2, 2, 1),
    overworld_frame(gUnknown_839C828, 2, 2, 2),
    overworld_frame(gUnknown_839C828, 2, 2, 3),
    overworld_frame(gUnknown_839C828, 2, 2, 4),
};

const union AnimCmd gUnknown_83A5F08[] =
{
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(1, 6),
    ANIMCMD_FRAME(2, 6),
    ANIMCMD_FRAME(3, 6),
    ANIMCMD_FRAME(4, 6),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A5F20[] = 
{
    gUnknown_83A5F08,
};

const struct SpriteTemplate gUnknown_83A5F24 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x100D,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A5F20,
    .images = gUnknown_83A5EE0,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_LavaridgeGymWarp,
};

const struct SpriteFrameImage gUnknown_83A5F3C[] =
{
    overworld_frame(gUnknown_839CAA8, 2, 4, 0),
    overworld_frame(gUnknown_839CAA8, 2, 4, 1),
    overworld_frame(gUnknown_839CAA8, 2, 4, 2),
    overworld_frame(gUnknown_839CAA8, 2, 4, 3),
    overworld_frame(gUnknown_839CAA8, 2, 4, 4),
    overworld_frame(gUnknown_839CAA8, 2, 4, 5),
    overworld_frame(gUnknown_839CAA8, 2, 4, 6),
    overworld_frame(gUnknown_839CAA8, 2, 4, 7),
};

const union AnimCmd gUnknown_83A5F7C[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 6),
    ANIMCMD_FRAME(4, 6),
    ANIMCMD_FRAME(5, 4),
    ANIMCMD_FRAME(6, 4),
    ANIMCMD_FRAME(7, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A5FA0[] = 
{
    gUnknown_83A5F7C,
};

const struct SpriteTemplate gUnknown_83A5FA4 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x1004,
    .oam = &gObjectEventBaseOam_16x32,
    .anims = gUnknown_83A5FA0,
    .images = gUnknown_83A5F3C,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateBubblesFieldEffect,
};

const struct SpriteFrameImage gUnknown_83A5FBC[] =
{
    overworld_frame(gUnknown_839D2A8, 2, 2, 0),
    overworld_frame(gUnknown_839D2A8, 2, 2, 1),
};

const union AnimCmd gUnknown_83A5FCC[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gUnknown_83A5FDC[] = 
{
    gUnknown_83A5FCC,
};

const struct SpriteTemplate gUnknown_83A5FE0 =
{
    .tileTag = SPRITE_INVALID_TAG,
    .paletteTag = 0x100F,
    .oam = &gObjectEventBaseOam_16x16,
    .anims = gUnknown_83A5FDC,
    .images = gUnknown_83A5FBC,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = UpdateSparkleFieldEffect,
};

const struct SpritePalette gUnknown_83A5FF8 = { .data = gUnknown_839D3A8, .tag = 0x100F };
