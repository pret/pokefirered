#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_main.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "decompress.h"
#include "dma3.h"
#include "gpu_regs.h"
#include "graphics.h"
#include "m4a.h"
#include "main.h"
#include "palette.h"
#include "pokeball.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "util.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/pokemon.h"

// Defines
#define TAG_PARTICLES_POKEBALL    55020
#define TAG_PARTICLES_GREATBALL   55021
#define TAG_PARTICLES_SAFARIBALL  55022
#define TAG_PARTICLES_ULTRABALL   55023
#define TAG_PARTICLES_MASTERBALL  55024
#define TAG_PARTICLES_NETBALL     55025
#define TAG_PARTICLES_DIVEBALL    55026
#define TAG_PARTICLES_NESTBALL    55027
#define TAG_PARTICLES_REPEATBALL  55028
#define TAG_PARTICLES_TIMERBALL   55029
#define TAG_PARTICLES_LUXURYBALL  55030
#define TAG_PARTICLES_PREMIERBALL 55031

#define HIHALF(n) (((n) & 0xFFFF0000) >> 16)
#define LOHALF(n) ((n) & 0xFFFF)

// RAM
int gUnknown_3005424;
u16 gUnknown_3005428;
u16 gUnknown_300542C;

// Function Declarations
static void sub_80EEDF4(u8);
static void sub_80EF1CC(u8);
static void sub_80EF698(u8);
static void sub_80EF8C0(struct Sprite *);
static void sub_80EF7EC(u8);
static void sub_80EF864(u8);
static void sub_80EF8F0(struct Sprite *);
static void sub_80F0478(struct Sprite *);
static void sub_80EF9B4(struct Sprite *);
static void sub_80EFA0C(struct Sprite *);
static void sub_80EFB58(struct Sprite *);
static void sub_80EFB9C(struct Sprite *);
static void sub_80EFF80(struct Sprite *);
static void sub_80EFCA0(struct Sprite *);
static void sub_80EFCEC(struct Sprite *);
static void sub_80EFFA4(struct Sprite *);
static void sub_80F02B0(struct Sprite *);
static void sub_80EFFC4(struct Sprite *);
static void sub_80F01B8(struct Sprite *);
static void sub_80F00A4(struct Sprite *);
static void sub_80F018C(struct Sprite *);
static void sub_80F05B4(u8);
static void sub_80F0278(struct Sprite *);
static void sub_80F0378(struct Sprite *);
static void sub_80F04B4(struct Sprite *);
static void GhostBallDodge(struct Sprite *sprite);
static void sub_80F0574(struct Sprite *sprite);
static void PokeBallOpenParticleAnimation_Step1(struct Sprite *);
static void PokeBallOpenParticleAnimation_Step2(struct Sprite *);
static void DestroyBallOpenAnimationParticle(struct Sprite *);
static void FanOutBallOpenParticles_Step1(struct Sprite *);
static void RepeatBallOpenParticleAnimation_Step1(struct Sprite *);
static void PremierBallOpenParticleAnimation_Step1(struct Sprite *);
static void sub_80F12E0(u8);
static void sub_80F1370(u8);
static void sub_80F13C0(u8);
static void sub_80F181C(u8);
static void sub_80F1A2C(struct Sprite *);
static void sub_80F1A80(struct Sprite *);
static void sub_80F19E0(u8);
static void sub_80F1BCC(struct Sprite *);
static void sub_80F1C04(struct Sprite *);
static void sub_80F1C30(struct Sprite *);
static void PokeBallOpenParticleAnimation(u8);
static void GreatBallOpenParticleAnimation(u8);
static void SafariBallOpenParticleAnimation(u8);
static void UltraBallOpenParticleAnimation(u8);
static void MasterBallOpenParticleAnimation(u8);
static void DiveBallOpenParticleAnimation(u8);
static void RepeatBallOpenParticleAnimation(u8);
static void TimerBallOpenParticleAnimation(u8);
static void PremierBallOpenParticleAnimation(u8);
static void sub_80F1B3C(struct Sprite *);

// Data
struct BallCaptureSuccessStarData
{
    s8 xOffset;
    s8 yOffset;
    s8 unk2;
};

static const struct BallCaptureSuccessStarData sBallCaptureSuccessStarData[] =
{
    {
        .xOffset = 10,
        .yOffset = 2,
        .unk2 = -3,
    },
    {
        .xOffset = 15,
        .yOffset = 0,
        .unk2 = -4,
    },
    {
        .xOffset = -10,
        .yOffset = 2,
        .unk2 = -4,
    },
};

const struct CompressedSpriteSheet gBallParticleSpritesheets[] =
{
    {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_POKEBALL},
    {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_GREATBALL},
    {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_SAFARIBALL},
    {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_ULTRABALL},
    {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_MASTERBALL},
    {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_NETBALL},
    {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_DIVEBALL},
    {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_NESTBALL},
    {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_REPEATBALL},
    {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_TIMERBALL},
    {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_LUXURYBALL},
    {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_PREMIERBALL},
};

const struct CompressedSpritePalette gBallParticlePalettes[] =
{
    {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_POKEBALL},
    {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_GREATBALL},
    {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_SAFARIBALL},
    {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_ULTRABALL},
    {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_MASTERBALL},
    {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_NETBALL},
    {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_DIVEBALL},
    {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_NESTBALL},
    {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_REPEATBALL},
    {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_TIMERBALL},
    {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_LUXURYBALL},
    {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_PREMIERBALL},
};

const union AnimCmd gAnim_RegularBall[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_FRAME(0, 1, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gAnim_MasterBall[] =
{
    ANIMCMD_FRAME(3, 1),
    ANIMCMD_END,
};

const union AnimCmd gAnim_NetDiveBall[] =
{
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END,
};

const union AnimCmd gAnim_NestBall[] =
{
    ANIMCMD_FRAME(5, 1),
    ANIMCMD_END,
};

const union AnimCmd gAnim_LuxuryPremierBall[] =
{
    ANIMCMD_FRAME(6, 4),
    ANIMCMD_FRAME(7, 4),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gAnim_UltraRepeatTimerBall[] =    
{
    ANIMCMD_FRAME(7, 4),
    ANIMCMD_END,
};

const union AnimCmd *const gAnims_BallParticles[] =    
{
    gAnim_RegularBall,
    gAnim_MasterBall,
    gAnim_NetDiveBall,
    gAnim_NestBall,
    gAnim_LuxuryPremierBall,
    gAnim_UltraRepeatTimerBall,
};

const u8 gBallParticleAnimNums[] =
{
    [BALL_POKE] = 0,
    [BALL_GREAT] = 0,
    [BALL_SAFARI] = 0,
    [BALL_ULTRA] = 5,
    [BALL_MASTER] = 1,
    [BALL_NET] = 2,
    [BALL_DIVE] = 2,
    [BALL_NEST] = 3,
    [BALL_REPEAT] = 5,
    [BALL_TIMER] = 5,
    [BALL_LUXURY] = 4,
    [BALL_PREMIER] = 4,
};

const TaskFunc gBallParticleAnimationFuncs[] =
{
    PokeBallOpenParticleAnimation,
    GreatBallOpenParticleAnimation,
    SafariBallOpenParticleAnimation,
    UltraBallOpenParticleAnimation,
    MasterBallOpenParticleAnimation,
    SafariBallOpenParticleAnimation,
    DiveBallOpenParticleAnimation,
    UltraBallOpenParticleAnimation,
    RepeatBallOpenParticleAnimation,
    TimerBallOpenParticleAnimation,
    GreatBallOpenParticleAnimation,
    PremierBallOpenParticleAnimation,
};

const struct SpriteTemplate gBallParticlesSpriteTemplates[] =
{
    {
        .tileTag = TAG_PARTICLES_POKEBALL,
        .paletteTag = TAG_PARTICLES_POKEBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = gAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = TAG_PARTICLES_GREATBALL,
        .paletteTag = TAG_PARTICLES_GREATBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = gAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = TAG_PARTICLES_SAFARIBALL,
        .paletteTag = TAG_PARTICLES_SAFARIBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = gAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = TAG_PARTICLES_ULTRABALL,
        .paletteTag = TAG_PARTICLES_ULTRABALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = gAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = TAG_PARTICLES_MASTERBALL,
        .paletteTag = TAG_PARTICLES_MASTERBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = gAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = TAG_PARTICLES_NETBALL,
        .paletteTag = TAG_PARTICLES_NETBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = gAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = TAG_PARTICLES_DIVEBALL,
        .paletteTag = TAG_PARTICLES_DIVEBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = gAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = TAG_PARTICLES_NESTBALL,
        .paletteTag = TAG_PARTICLES_NESTBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = gAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = TAG_PARTICLES_REPEATBALL,
        .paletteTag = TAG_PARTICLES_REPEATBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = gAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = TAG_PARTICLES_TIMERBALL,
        .paletteTag = TAG_PARTICLES_TIMERBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = gAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = TAG_PARTICLES_LUXURYBALL,
        .paletteTag = TAG_PARTICLES_LUXURYBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = gAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = TAG_PARTICLES_PREMIERBALL,
        .paletteTag = TAG_PARTICLES_PREMIERBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = gAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
};

const u16 gBallOpenFadeColors[] =
{
    [BALL_POKE] = RGB(31, 22, 30),
    [BALL_GREAT] = RGB(16, 23, 30),
    [BALL_SAFARI] = RGB(23, 30, 20),
    [BALL_ULTRA] = RGB(31, 31, 15),
    [BALL_MASTER] = RGB(23, 20, 28),
    [BALL_NET] = RGB(21, 31, 25),
    [BALL_DIVE] = RGB(12, 25, 30),
    [BALL_NEST] = RGB(30, 27, 10),
    [BALL_REPEAT] = RGB(31, 24, 16),
    [BALL_TIMER] = RGB(29, 30, 30),
    [BALL_LUXURY] = RGB(31, 17, 10),
    [BALL_PREMIER] = RGB(31, 9, 10),

    // Unused
    RGB_BLACK,
    RGB(1, 16, 0),
    RGB(3, 0, 1),
    RGB(1, 8, 0),
    RGB(0, 8, 0),
    RGB(3, 8, 1),
    RGB(6, 8, 1),
    RGB(4, 0, 0),
};

const struct SpriteTemplate gPokeblockSpriteTemplate =
{
    .tileTag = ANIM_TAG_POKEBLOCK,
    .paletteTag = ANIM_TAG_POKEBLOCK,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80F1B3C,
};

const union AnimCmd gUnknown_840C204[] =
{
    ANIMCMD_FRAME(64, 1),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_840C20C[] =
{
    gUnknown_840C204,
};

const struct SpriteTemplate gUnknown_840C210 =
{
    .tileTag = ANIM_TAG_ROCKS,
    .paletteTag = ANIM_TAG_ROCKS,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gSpriteAnimTable_840C20C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80F1B3C,
};

// Functions
void sub_80EEC0C(u8 taskId)
{
    struct BattleAnimBgData unknownStruct;
    u8 healthBoxSpriteId;
    u8 battler;
    u8 spriteId1, spriteId2, spriteId3, spriteId4;

    battler = gBattleAnimAttacker;
    gBattle_WIN0H = 0;
    gBattle_WIN0V = 0;
    SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR | WININ_WIN1_BG_ALL | WININ_WIN1_OBJ | WININ_WIN1_CLR);
    SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_BG0 | WINOUT_WIN01_BG2 | WINOUT_WIN01_BG3 | WINOUT_WIN01_OBJ | WINOUT_WIN01_CLR | WINOUT_WINOBJ_BG_ALL | WINOUT_WINOBJ_OBJ | WINOUT_WINOBJ_CLR);
    SetGpuRegBits(REG_OFFSET_DISPCNT, DISPCNT_OBJWIN_ON);
    SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_ALL);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(0, 16));
    SetAnimBgAttribute(1, BG_ANIM_PRIORITY, 0);
    SetAnimBgAttribute(1, BG_ANIM_SCREEN_SIZE, 0);
    SetAnimBgAttribute(1, BG_ANIM_AREA_OVERFLOW_MODE, 1);
    SetAnimBgAttribute(1, BG_ANIM_CHAR_BASE_BLOCK, 1);
    healthBoxSpriteId = gHealthboxSpriteIds[battler];
    spriteId1 = gSprites[healthBoxSpriteId].oam.affineParam;
    spriteId2 = gSprites[healthBoxSpriteId].data[5];
    spriteId3 = CreateInvisibleSpriteWithCallback(SpriteCallbackDummy);
    spriteId4 = CreateInvisibleSpriteWithCallback(SpriteCallbackDummy);
    gSprites[healthBoxSpriteId].oam.priority = 1;
    gSprites[spriteId1].oam.priority = 1;
    gSprites[spriteId2].oam.priority = 1;
    gSprites[spriteId3] = gSprites[healthBoxSpriteId];
    gSprites[spriteId4] = gSprites[spriteId1];
    gSprites[spriteId3].oam.objMode = ST_OAM_OBJ_WINDOW;
    gSprites[spriteId4].oam.objMode = ST_OAM_OBJ_WINDOW;
    gSprites[spriteId3].callback = SpriteCallbackDummy;
    gSprites[spriteId4].callback = SpriteCallbackDummy;
    sub_80752A0(&unknownStruct);
    AnimLoadCompressedBgTilemap(unknownStruct.bgId, gUnknown_D2EC24_Tilemap);
    AnimLoadCompressedBgGfx(unknownStruct.bgId, gUnknown_D2EC24_Gfx, unknownStruct.tilesOffset);
    LoadCompressedPalette(gCureBubblesPal, unknownStruct.paletteId << 4, 32);
    gBattle_BG1_X = -gSprites[spriteId3].pos1.x + 32;
    gBattle_BG1_Y = -gSprites[spriteId3].pos1.y - 32;
    gTasks[taskId].data[1] = 640;
    gTasks[taskId].data[0] = spriteId3;
    gTasks[taskId].data[2] = spriteId4;
    gTasks[taskId].func = sub_80EEDF4;
}

static void sub_80EEDF4(u8 taskId)
{
    u8 spriteId1, spriteId2;
    u8 battler;

    battler = gBattleAnimAttacker;
    gTasks[taskId].data[13] += gTasks[taskId].data[1];
    gBattle_BG1_Y += (u16)gTasks[taskId].data[13] >> 8;
    gTasks[taskId].data[13] &= 0xFF;

    switch (gTasks[taskId].data[15])
    {
    case 0:
        if (gTasks[taskId].data[11]++ > 1)
        {
            gTasks[taskId].data[11] = 0;
            gTasks[taskId].data[12]++;
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(gTasks[taskId].data[12], 16 - gTasks[taskId].data[12]));
            if (gTasks[taskId].data[12] == 8)
                gTasks[taskId].data[15]++;
        }
        break;
    case 1:
        if (++gTasks[taskId].data[10] == 30)
            gTasks[taskId].data[15]++;
        break;
    case 2:
        if (gTasks[taskId].data[11]++ > 1)
        {
            gTasks[taskId].data[11] = 0;
            gTasks[taskId].data[12]--;
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(gTasks[taskId].data[12], 16 - gTasks[taskId].data[12]));
            if (gTasks[taskId].data[12] == 0)
            {
                sub_8073128(0);
                gBattle_WIN0H = 0;
                gBattle_WIN0V = 0;
                SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR | WININ_WIN1_BG_ALL | WININ_WIN1_OBJ | WININ_WIN1_CLR);
                SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ | WINOUT_WIN01_CLR | WINOUT_WINOBJ_BG_ALL | WINOUT_WINOBJ_OBJ | WINOUT_WINOBJ_CLR);
                if (!IsContest())
                    SetAnimBgAttribute(1, BG_ANIM_CHAR_BASE_BLOCK, 0);

                SetGpuReg(REG_OFFSET_DISPCNT, GetGpuReg(REG_OFFSET_DISPCNT) ^ DISPCNT_OBJWIN_ON);
                SetGpuReg(REG_OFFSET_BLDCNT, 0);
                SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(0, 0));
                DestroySprite(&gSprites[gTasks[taskId].data[0]]);
                DestroySprite(&gSprites[gTasks[taskId].data[2]]);
                SetAnimBgAttribute(1, BG_ANIM_AREA_OVERFLOW_MODE, 0);
                spriteId1 = gSprites[gHealthboxSpriteIds[battler]].oam.affineParam;
                spriteId2 = gSprites[gHealthboxSpriteIds[battler]].data[5];
                gSprites[gHealthboxSpriteIds[battler]].oam.priority = 1;
                gSprites[spriteId1].oam.priority = 1;
                gSprites[spriteId2].oam.priority = 1;
                DestroyAnimVisualTask(taskId);
            }
        }
        break;
    }
}

void sub_80EEFC8(u8 *paletteId1, u8 *paletteId2, u8 battler)
{
    u8 healthBoxSpriteId;
    u8 spriteId1, spriteId2;
    u16 offset1, offset2;

    healthBoxSpriteId = gHealthboxSpriteIds[battler];
    spriteId1 = gSprites[healthBoxSpriteId].oam.affineParam;
    spriteId2 = gSprites[healthBoxSpriteId].data[5];
    *paletteId1 = AllocSpritePalette(0xD709);
    *paletteId2 = AllocSpritePalette(0xD70A);
    offset1 = (gSprites[healthBoxSpriteId].oam.paletteNum * 16) + 0x100;
    offset2 = (gSprites[spriteId2].oam.paletteNum * 16) + 0x100;
    LoadPalette(&gPlttBufferUnfaded[offset1], *paletteId1 * 16 + 0x100, 0x20);
    LoadPalette(&gPlttBufferUnfaded[offset2], *paletteId2 * 16 + 0x100, 0x20);
    gSprites[healthBoxSpriteId].oam.paletteNum = *paletteId1;
    gSprites[spriteId1].oam.paletteNum = *paletteId1;
    gSprites[spriteId2].oam.paletteNum = *paletteId2;
}

void sub_80EF0B4(u8 taskId)
{
    u8 paletteId1, paletteId2;
    
    sub_80EEFC8(&paletteId1, &paletteId2, gBattleAnimAttacker);
    DestroyAnimVisualTask(taskId);
}

void sub_80EF0E0(u8 battler)
{
    u8 healthBoxSpriteId;
    u8 spriteId1, spriteId2;
    u8 paletteId1, paletteId2;

    healthBoxSpriteId = gHealthboxSpriteIds[battler];
    spriteId1 = gSprites[healthBoxSpriteId].oam.affineParam;
    spriteId2 = gSprites[healthBoxSpriteId].data[5];
    FreeSpritePaletteByTag(0xD709);
    FreeSpritePaletteByTag(0xD70A);
    paletteId1 = IndexOfSpritePaletteTag(0xD6FF);
    paletteId2 = IndexOfSpritePaletteTag(0xD704);
    gSprites[healthBoxSpriteId].oam.paletteNum = paletteId1;
    gSprites[spriteId1].oam.paletteNum = paletteId1;
    gSprites[spriteId2].oam.paletteNum = paletteId2;
}

void sub_80EF180(u8 taskId)
{
    sub_80EF0E0(gBattleAnimAttacker);
    DestroyAnimVisualTask(taskId);
}

void sub_80EF1A0(u8 taskId)
{
    gTasks[taskId].data[10] = gBattleAnimArgs[0];
    gTasks[taskId].data[11] = gBattleAnimArgs[1];
    gTasks[taskId].func = sub_80EF1CC;
}

static void sub_80EF1CC(u8 taskId)
{
    u8 paletteNum;
    int paletteOffset, colorOffset;

    gTasks[taskId].data[0]++;
    if (gTasks[taskId].data[0]++ >= gTasks[taskId].data[11])
    {
        gTasks[taskId].data[0] = 0;
        paletteNum = IndexOfSpritePaletteTag(0xD709);
        colorOffset = gTasks[taskId].data[10] == 0 ? 6 : 2;
        switch (gTasks[taskId].data[1])
        {
        case 0:
            gTasks[taskId].data[2] += 2;
            if (gTasks[taskId].data[2] > 16)
                gTasks[taskId].data[2] = 16;

            paletteOffset = paletteNum * 16 + 0x100;
            BlendPalette(paletteOffset + colorOffset, 1, gTasks[taskId].data[2], RGB(20, 27, 31));
            if (gTasks[taskId].data[2] == 16)
                gTasks[taskId].data[1]++;
            break;
        case 1:
            gTasks[taskId].data[2] -= 2;
            if (gTasks[taskId].data[2] < 0)
                gTasks[taskId].data[2] = 0;

            paletteOffset = paletteNum * 16 + 0x100;
            BlendPalette(paletteOffset + colorOffset, 1, gTasks[taskId].data[2], RGB(20, 27, 31));
            if (gTasks[taskId].data[2] == 0)
                DestroyAnimVisualTask(taskId);
            break;
        }
    }
}

void sub_80EF298(u8 taskId)
{
    u8 spriteId;

    spriteId = gBattlerSpriteIds[gBattleAnimAttacker];
    switch (gTasks[taskId].data[0])
    {
    case 0:
        PrepareBattlerSpriteForRotScale(spriteId, ST_OAM_OBJ_NORMAL);
        gTasks[taskId].data[10] = 0x100;
        gTasks[taskId].data[0]++;
        break;
    case 1:
        gTasks[taskId].data[10] += 0x30;
        SetSpriteRotScale(spriteId, gTasks[taskId].data[10], gTasks[taskId].data[10], 0);
        SetBattlerSpriteYOffsetFromYScale(spriteId);
        if (gTasks[taskId].data[10] >= 0x2D0)
            gTasks[taskId].data[0]++;
        break;
    case 2:
        ResetSpriteRotScale(spriteId);
        gSprites[spriteId].invisible = TRUE;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80EF344(u8 taskId)
{
    u8 spriteId;
    u16 ball;
    u8 ballId;
    u8 x, y;
    u8 priority, subpriority;
    u32 selectedPalettes;

    spriteId = gBattlerSpriteIds[gBattleAnimAttacker];
    if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
        ball = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gBattleAnimAttacker]], MON_DATA_POKEBALL);
    else
        ball = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gBattleAnimAttacker]], MON_DATA_POKEBALL);

    ballId = ItemIdToBallId(ball);
    switch (gTasks[taskId].data[0])
    {
    case 0:
        x = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_X);
        y = GetBattlerSpriteCoord(gBattleAnimAttacker, BATTLER_COORD_Y);
        priority = gSprites[spriteId].oam.priority;
        subpriority = gSprites[spriteId].subpriority;
        gTasks[taskId].data[10] = LaunchBallStarsTask(x, y + 32, priority, subpriority, ballId);
        selectedPalettes = sub_8075BE8(1, 0, 0, 0, 0, 0, 0);
        gTasks[taskId].data[11] = LaunchBallFadeMonTask(0, gBattleAnimAttacker, selectedPalettes, ballId);
        gTasks[taskId].data[0]++;
        break;
    case 1:
        if (!gTasks[gTasks[taskId].data[10]].isActive && !gTasks[gTasks[taskId].data[11]].isActive)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80EF490(u8 taskId)
{
    u8 ballId = ItemIdToBallId(gLastUsedItem);
    
    LoadBallGfx(ballId);
    DestroyAnimVisualTask(taskId);
}

void sub_80EF4B8(u8 taskId)
{
    u8 ballId = ItemIdToBallId(gLastUsedItem);
    
    FreeBallGfx(ballId);
    DestroyAnimVisualTask(taskId);
}

void AnimTask_IsBallBlockedByTrainerOrDodged(u8 taskId)
{
    switch (gBattleSpritesDataPtr->animationData->ballThrowCaseId)
    {
    case BALL_TRAINER_BLOCK:
        gBattleAnimArgs[ARG_RET_ID] = -1;
        break;
    case BALL_GHOST_DODGE:
        gBattleAnimArgs[ARG_RET_ID] = -2;
        break;
    default:
        gBattleAnimArgs[ARG_RET_ID] = 0;
        break;
    }

    DestroyAnimVisualTask(taskId);
}

u8 ItemIdToBallId(u16 ballItem)
{
    switch (ballItem)
    {
    case ITEM_MASTER_BALL:
        return BALL_MASTER;
    case ITEM_ULTRA_BALL:
        return BALL_ULTRA;
    case ITEM_GREAT_BALL:
        return BALL_GREAT;
    case ITEM_SAFARI_BALL:
        return BALL_SAFARI;
    case ITEM_NET_BALL:
        return BALL_NET;
    case ITEM_DIVE_BALL:
        return BALL_DIVE;
    case ITEM_NEST_BALL:
        return BALL_NEST;
    case ITEM_REPEAT_BALL:
        return BALL_REPEAT;
    case ITEM_TIMER_BALL:
        return BALL_TIMER;
    case ITEM_LUXURY_BALL:
        return BALL_LUXURY;
    case ITEM_PREMIER_BALL:
        return BALL_PREMIER;
    case ITEM_POKE_BALL:
    default:
        return BALL_POKE;
    }
}

void sub_80EF5AC(u8 taskId)
{
    u8 ballId;
    u8 spriteId;

    ballId = ItemIdToBallId(gLastUsedItem);
    spriteId = CreateSprite(&gBallSpriteTemplates[ballId], 32, 80, 29);
    gSprites[spriteId].data[0] = 34;
    gSprites[spriteId].data[1] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X);
    gSprites[spriteId].data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y) - 16;
    gSprites[spriteId].callback = sub_80EF8C0;
    gBattleSpritesDataPtr->animationData->field_9_x2 = gSprites[gBattlerSpriteIds[gBattleAnimTarget]].invisible;
    gTasks[taskId].data[0] = spriteId;
    gTasks[taskId].func = sub_80EF698;
}

static void sub_80EF698(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[0];
    
    if ((u16)gSprites[spriteId].data[0] == 0xFFFF)
        DestroyAnimVisualTask(taskId);
}

void sub_80EF6D4(u8 taskId)
{
    int x, y;
    u8 ballId;
    u8 subpriority;
    u8 spriteId;

    if (gBattleTypeFlags & BATTLE_TYPE_OLD_MAN_TUTORIAL)
    {
        x = 28;
        y = 11;
    }
    else
    {
        x = 23;
        y = 11;
        if (gSaveBlock2Ptr->playerGender == FEMALE)
            y = 13;
    }

    ballId = ItemIdToBallId(gLastUsedItem);
    subpriority = GetBattlerSpriteSubpriority(GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT)) + 1;
    spriteId = CreateSprite(&gBallSpriteTemplates[ballId], x | 32, y | 80, subpriority);
    gSprites[spriteId].data[0] = 34;
    gSprites[spriteId].data[1] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X);
    gSprites[spriteId].data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y) - 16;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    gSprites[gBattlerSpriteIds[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)]].callback = sub_8012354;
    gTasks[taskId].data[0] = spriteId;
    gTasks[taskId].func = sub_80EF7EC;
}

static void sub_80EF7EC(u8 taskId)
{
    if (gSprites[gBattlerSpriteIds[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)]].animCmdIndex == 1)
    {
        PlaySE12WithPanning(SE_NAGERU, 0);
        gSprites[gTasks[taskId].data[0]].callback = sub_80EF8C0;
        CreateTask(sub_80EF864, 10);
        gTasks[taskId].func = sub_80EF698;
    }
}

static void sub_80EF864(u8 taskId)
{
    if (gSprites[gBattlerSpriteIds[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)]].animEnded)
    {
        StartSpriteAnim(&gSprites[gBattlerSpriteIds[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)]], 0);
        DestroyTask(taskId);
    }
}

static void sub_80EF8C0(struct Sprite *sprite)
{
    u16 temp = sprite->data[1];
    u16 temp2 = sprite->data[2];
    
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = temp;
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = temp2;
    sprite->data[5] = -40;
    InitAnimArcTranslation(sprite);
    sprite->callback = sub_80EF8F0;
}

static void sub_80EF8F0(struct Sprite *sprite)
{
    int i;
    u8 ballId;

    if (TranslateAnimHorizontalArc(sprite))
    {
        if (gBattleSpritesDataPtr->animationData->ballThrowCaseId == BALL_TRAINER_BLOCK)
        {
            sprite->callback = sub_80F0478;
        }
        else if (gBattleSpritesDataPtr->animationData->ballThrowCaseId == BALL_GHOST_DODGE)
        {
            sprite->callback = GhostBallDodge;
        }
        else
        {
            StartSpriteAnim(sprite, 1);
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;

            for (i = 0; i < 8; i++)
                sprite->data[i] = 0;

            sprite->data[5] = 0;
            sprite->callback = sub_80EF9B4;

            ballId = ItemIdToBallId(gLastUsedItem);
            switch (ballId)
            {
            case 0 ... POKEBALL_COUNT - 1:
                LaunchBallStarsTask(sprite->pos1.x, sprite->pos1.y - 5, 1, 28, ballId);
                LaunchBallFadeMonTask(0, gBattleAnimTarget, 14, ballId);
                break;
            }
        }
    }
}

static void sub_80EF9B4(struct Sprite *sprite)
{
    if (++sprite->data[5] == 10)
    {
        sprite->data[5] = CreateTask(TaskDummy, 50);
        sprite->callback = sub_80EFA0C;
        gSprites[gBattlerSpriteIds[gBattleAnimTarget]].data[1] = 0;
    }
}

static void sub_80EFA0C(struct Sprite *sprite)
{
    u8 spriteId;
    u8 taskId;

    spriteId = gBattlerSpriteIds[gBattleAnimTarget];
    taskId = sprite->data[5];
    if (++gTasks[taskId].data[1] == 11)
        PlaySE(SE_SUIKOMU);

    switch (gTasks[taskId].data[0])
    {
    case 0:
        PrepareBattlerSpriteForRotScale(spriteId, ST_OAM_OBJ_NORMAL);
        gTasks[taskId].data[10] = 256;
        gUnknown_3005424 = 28;
        gUnknown_300542C = (gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y) - (sprite->pos1.y + sprite->pos2.y);
        gUnknown_3005428 = (u32)(gUnknown_300542C * 256) / 28;
        gTasks[taskId].data[2] = gUnknown_3005428;
        gTasks[taskId].data[0]++;
        break;
    case 1:
        gTasks[taskId].data[10] += 0x20;
        SetSpriteRotScale(spriteId, gTasks[taskId].data[10], gTasks[taskId].data[10], 0);
        gTasks[taskId].data[3] += gTasks[taskId].data[2];
        gSprites[spriteId].pos2.y = -gTasks[taskId].data[3] >> 8;
        if (gTasks[taskId].data[10] >= 0x480)
            gTasks[taskId].data[0]++;
        break;
    case 2:
        ResetSpriteRotScale(spriteId);
        gSprites[spriteId].invisible = TRUE;
        gTasks[taskId].data[0]++;
        break;
    default:
        if (gTasks[taskId].data[1] > 10)
        {
            DestroyTask(taskId);
            StartSpriteAnim(sprite, 2);
            sprite->data[5] = 0;
            sprite->callback = sub_80EFB58;
        }
        break;
    }
}

static void sub_80EFB58(struct Sprite *sprite)
{
    int angle;

    if (sprite->animEnded)
    {
        sprite->data[3] = 0;
        sprite->data[4] = 40;
        sprite->data[5] = 0;
        angle = 0;
        sprite->pos1.y += Cos(angle, 40);
        sprite->pos2.y = -Cos(angle, sprite->data[4]);
        sprite->callback = sub_80EFB9C;
    }
}

static void sub_80EFB9C(struct Sprite *sprite)
{
    bool8 lastBounce;
    int bounceCount;

    lastBounce = FALSE;
    switch (sprite->data[3] & 0xFF)
    {
    case 0:
        sprite->pos2.y = -Cos(sprite->data[5], sprite->data[4]);
        sprite->data[5] += (sprite->data[3] >> 8) + 4;
        if (sprite->data[5] >= 64)
        {
            sprite->data[4] -= 10;
            sprite->data[3] += 257;

            bounceCount = sprite->data[3] >> 8;
            if (bounceCount == 4)
                lastBounce = TRUE;

            // Play a different sound effect for each pokeball bounce.
            switch (bounceCount)
            {
            case 1:
                PlaySE(SE_KON);
                break;
            case 2:
                PlaySE(SE_KON2);
                break;
            case 3:
                PlaySE(SE_KON3);
                break;
            default:
                PlaySE(SE_KON4);
                break;
            }
        }
        break;
    case 1:
        sprite->pos2.y = -Cos(sprite->data[5], sprite->data[4]);
        sprite->data[5] -= (sprite->data[3] >> 8) + 4;
        if (sprite->data[5] <= 0)
        {
            sprite->data[5] = 0;
            sprite->data[3] &= -0x100;
        }
        break;
    }

    if (lastBounce)
    {
        sprite->data[3] = 0;
        sprite->pos1.y += Cos(64, 40);
        sprite->pos2.y = 0;
        if (gBattleSpritesDataPtr->animationData->ballThrowCaseId == BALL_NO_SHAKES)
        {
            sprite->data[5] = 0;
            sprite->callback = sub_80EFF80;
        }
        else
        {
            sprite->callback = sub_80EFCA0;
            sprite->data[4] = 1;
            sprite->data[5] = 0;
        }
    }
}

static void sub_80EFCA0(struct Sprite *sprite)
{
    if (++sprite->data[3] == 31)
    {
        sprite->data[3] = 0;
        sprite->affineAnimPaused = TRUE;
        StartSpriteAffineAnim(sprite, 1);
        gBattleSpritesDataPtr->animationData->field_C = 0;
        sprite->callback = sub_80EFCEC;
        PlaySE(SE_BOWA);
    }
}

static void sub_80EFCEC(struct Sprite *sprite)
{
    s8 state;
    u16 var0;

    switch (sprite->data[3] & 0xFF)
    {
    case 0:
        if (gBattleSpritesDataPtr->animationData->field_C > 0xFF)
        {
            sprite->pos2.x += sprite->data[4];
            gBattleSpritesDataPtr->animationData->field_C &= 0xFF;
        }
        else
        {
            gBattleSpritesDataPtr->animationData->field_C += 0xB0;
        }

        sprite->data[5]++;
        sprite->affineAnimPaused = FALSE;
        var0 = sprite->data[5] + 7;
        if (var0 > 14)
        {
            gBattleSpritesDataPtr->animationData->field_C = 0;
            sprite->data[3]++;
            sprite->data[5] = 0;
        }
        break;
    case 1:
        if (++sprite->data[5] == 1)
        {
            sprite->data[5] = 0;
            sprite->data[4] = -sprite->data[4];
            sprite->data[3]++;
            sprite->affineAnimPaused = FALSE;
            if (sprite->data[4] < 0)
                ChangeSpriteAffineAnim(sprite, 2);
            else
                ChangeSpriteAffineAnim(sprite, 1);
        }
        else
        {
            sprite->affineAnimPaused = TRUE;
        }
        break;
    case 2:
        if (gBattleSpritesDataPtr->animationData->field_C > 0xFF)
        {
            sprite->pos2.x += sprite->data[4];
            gBattleSpritesDataPtr->animationData->field_C &= 0xFF;
        }
        else
        {
            gBattleSpritesDataPtr->animationData->field_C += 0xB0;
        }

        sprite->data[5]++;
        sprite->affineAnimPaused = FALSE;
        var0 = sprite->data[5] + 12;
        if (var0 > 24)
        {
            gBattleSpritesDataPtr->animationData->field_C = 0;
            sprite->data[3]++;
            sprite->data[5] = 0;
        }
        break;
    case 3:
        if (sprite->data[5]++ < 0)
        {
            sprite->affineAnimPaused = TRUE;
            break;
        }

        sprite->data[5] = 0;
        sprite->data[4] = -sprite->data[4];
        sprite->data[3]++;
        sprite->affineAnimPaused = FALSE;
        if (sprite->data[4] < 0)
            ChangeSpriteAffineAnim(sprite, 2);
        else
            ChangeSpriteAffineAnim(sprite, 1);
        // fall through
    case 4:
        if (gBattleSpritesDataPtr->animationData->field_C > 0xFF)
        {
            sprite->pos2.x += sprite->data[4];
            gBattleSpritesDataPtr->animationData->field_C &= 0xFF;
        }
        else
        {
            gBattleSpritesDataPtr->animationData->field_C += 0xB0;
        }

        sprite->data[5]++;
        sprite->affineAnimPaused = FALSE;
        var0 = sprite->data[5] + 4;
        if (var0 > 8)
        {
            gBattleSpritesDataPtr->animationData->field_C = 0;
            sprite->data[3]++;
            sprite->data[5] = 0;
            sprite->data[4] = -sprite->data[4];
        }
        break;
    case 5:
        sprite->data[3] += 0x100;
        state = sprite->data[3] >> 8;
        if (state == gBattleSpritesDataPtr->animationData->ballThrowCaseId)
        {
            sprite->affineAnimPaused = TRUE;
            sprite->callback = sub_80EFF80;
        }
        else
        {
            if (gBattleSpritesDataPtr->animationData->ballThrowCaseId == BALL_3_SHAKES_SUCCESS && state == 3)
            {
                sprite->callback = sub_80EFFA4;
                sprite->affineAnimPaused = TRUE;
            }
            else
            {
                sprite->data[3]++;
                sprite->affineAnimPaused = TRUE;
            }
        }
        break;
    case 6:
    default:
        if (++sprite->data[5] == 31)
        {
            sprite->data[5] = 0;
            sprite->data[3] &= -0x100;
            StartSpriteAffineAnim(sprite, 3);
            if (sprite->data[4] < 0)
                StartSpriteAffineAnim(sprite, 2);
            else
                StartSpriteAffineAnim(sprite, 1);

            PlaySE(SE_BOWA);
        }
        break;
    }
}

static void sub_80EFF80(struct Sprite *sprite)
{
    if (++sprite->data[5] == 31)
    {
        sprite->data[5] = 0;
        sprite->callback = sub_80F02B0;
    }
}

static void sub_80EFFA4(struct Sprite *sprite)
{
    sprite->animPaused = TRUE;
    sprite->callback = sub_80EFFC4;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    sprite->data[5] = 0;
}

static void sub_80EFFC4(struct Sprite *sprite)
{
    u8 *battler = &gBattleAnimTarget;

    sprite->data[4]++;
    if (sprite->data[4] == 40)
    {
        PlaySE(SE_GETTING);
        BlendPalettes(0x10000 << sprite->oam.paletteNum, 6, RGB_BLACK);
        sub_80F01B8(sprite);
    }
    else if (sprite->data[4] == 60)
    {
        BeginNormalPaletteFade(0x10000 << sprite->oam.paletteNum, 2, 6, 0, RGB_BLACK);
    }
    else if (sprite->data[4] == 95)
    {
        gDoingBattleAnim = FALSE;
        UpdateOamPriorityInAllHealthboxes(1);
        m4aMPlayAllStop();
        PlaySE(MUS_FAN6);
    }
    else if (sprite->data[4] == 315)
    {
        FreeOamMatrix(gSprites[gBattlerSpriteIds[*battler]].oam.matrixNum);
        DestroySprite(&gSprites[gBattlerSpriteIds[*battler]]);
        sprite->data[0] = 0;
        sprite->callback = sub_80F00A4;
    }
}

static void sub_80F00A4(struct Sprite *sprite)
{
    u8 paletteIndex;

    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1] = 0;
        sprite->data[2] = 0;
        sprite->oam.objMode = ST_OAM_OBJ_BLEND;
        SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_ALL);
        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(16, 0));
        paletteIndex = IndexOfSpritePaletteTag(sprite->template->paletteTag);
        BeginNormalPaletteFade(1 << (paletteIndex + 0x10), 0, 0, 16, RGB_WHITE);
        sprite->data[0]++;
        break;
    case 1:
        if (sprite->data[1]++ > 0)
        {
            sprite->data[1] = 0;
            sprite->data[2]++;
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(16 - sprite->data[2], sprite->data[2]));
            if (sprite->data[2] == 16)
                sprite->data[0]++;
        }
        break;
    case 2:
        sprite->invisible = TRUE;
        sprite->data[0]++;
        break;
    default:
        if (!gPaletteFade.active)
        {
            SetGpuReg(REG_OFFSET_BLDCNT, 0);
            SetGpuReg(REG_OFFSET_BLDALPHA, 0);
            sprite->data[0] = 0;
            sprite->callback = sub_80F018C;
        }
        break;
    }
}

static void sub_80F018C(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[0] = -1;
    }
    else
    {
        FreeSpriteOamMatrix(sprite);
        DestroySprite(sprite);
    }
}

static void sub_80F01B8(struct Sprite *sprite)
{
    u32 i;
    u8 subpriority;

    if (sprite->subpriority)
    {
        subpriority = sprite->subpriority - 1;
    }
    else
    {
        subpriority = 0;
        sprite->subpriority = 1;
    }

    sub_80F05B4(4);
    for (i = 0; i < 3; i++)
    {
        u8 spriteId = CreateSprite(&gBallParticlesSpriteTemplates[4], sprite->pos1.x, sprite->pos1.y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].data[0] = 24;
            gSprites[spriteId].data[2] = sprite->pos1.x + sBallCaptureSuccessStarData[i].xOffset;
            gSprites[spriteId].data[4] = sprite->pos1.y + sBallCaptureSuccessStarData[i].yOffset;
            gSprites[spriteId].data[5] = sBallCaptureSuccessStarData[i].unk2;
            InitAnimArcTranslation(&gSprites[spriteId]);
            gSprites[spriteId].callback = sub_80F0278;
            StartSpriteAnim(&gSprites[spriteId], gBallParticleAnimNums[4]);
        }
    }
}

static void sub_80F0278(struct Sprite *sprite)
{
    sprite->invisible = !sprite->invisible;
    if (TranslateAnimHorizontalArc(sprite))
        DestroySprite(sprite);
}

static void sub_80F02B0(struct Sprite *sprite)
{
    u8 ballId;

    StartSpriteAnim(sprite, 1);
    StartSpriteAffineAnim(sprite, 0);
    sprite->callback = sub_80F0378;
    ballId = ItemIdToBallId(gLastUsedItem);
    switch (ballId)
    {
    case 0 ... POKEBALL_COUNT - 1:
        LaunchBallStarsTask(sprite->pos1.x, sprite->pos1.y - 5, 1, 28, ballId);
        LaunchBallFadeMonTask(1, gBattleAnimTarget, 14, ballId);
        break;
    }

    gSprites[gBattlerSpriteIds[gBattleAnimTarget]].invisible = FALSE;
    StartSpriteAffineAnim(&gSprites[gBattlerSpriteIds[gBattleAnimTarget]], 1);
    AnimateSprite(&gSprites[gBattlerSpriteIds[gBattleAnimTarget]]);
    gSprites[gBattlerSpriteIds[gBattleAnimTarget]].data[1] = 0x1000;
}

static void sub_80F0378(struct Sprite *sprite)
{
    bool32 next = FALSE;

    if (sprite->animEnded)
        sprite->invisible = TRUE;

    if (gSprites[gBattlerSpriteIds[gBattleAnimTarget]].affineAnimEnded)
    {
        StartSpriteAffineAnim(&gSprites[gBattlerSpriteIds[gBattleAnimTarget]], 0);
        next = TRUE;
    }
    else
    {
        gSprites[gBattlerSpriteIds[gBattleAnimTarget]].data[1] -= 288;
        gSprites[gBattlerSpriteIds[gBattleAnimTarget]].pos2.y = gSprites[gBattlerSpriteIds[gBattleAnimTarget]].data[1] >> 8;
    }

    if (sprite->animEnded && next)
    {
        gSprites[gBattlerSpriteIds[gBattleAnimTarget]].pos2.y = 0;
        gSprites[gBattlerSpriteIds[gBattleAnimTarget]].invisible = gBattleSpritesDataPtr->animationData->field_9_x2;
        sprite->data[0] = 0;
        sprite->callback = sub_80F018C;
        gDoingBattleAnim = FALSE;
        UpdateOamPriorityInAllHealthboxes(1);
    }
}

static void sub_80F0478(struct Sprite *sprite)
{
    int i;

    sprite->pos1.x += sprite->pos2.x;
    sprite->pos1.y += sprite->pos2.y;
    sprite->pos2.x = sprite->pos2.y = 0;
    for (i = 0; i < 6; i++)
        sprite->data[i] = 0;

    sprite->callback = sub_80F04B4;
}

static void sub_80F04B4(struct Sprite *sprite)
{
    s16 var0 = sprite->data[0] + 0x800;
    s16 var1 = sprite->data[1] + 0x680;
    
    sprite->pos2.x -= var1 >> 8;
    sprite->pos2.y += var0 >> 8;
    sprite->data[0] = (sprite->data[0] + 0x800) & 0xFF;
    sprite->data[1] = (sprite->data[1] + 0x680) & 0xFF;
    if (sprite->pos1.y + sprite->pos2.y > 160
     || sprite->pos1.x + sprite->pos2.x < -8)
    {
        sprite->data[0] = 0;
        sprite->callback = sub_80F018C;
        gDoingBattleAnim = FALSE;
        UpdateOamPriorityInAllHealthboxes(1);
    }
}

static void GhostBallDodge(struct Sprite *sprite)
{
    sprite->pos1.x += sprite->pos2.x;
    sprite->pos1.y += sprite->pos2.y;
    sprite->pos2.x = sprite->pos2.y = 0;
    sprite->data[0] = 0x22;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sprite->pos1.x - 8;
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = 0x90;
    sprite->data[5] = 0x20;
    InitAnimArcTranslation(sprite);
    TranslateAnimVerticalArc(sprite);
    sprite->callback = sub_80F0574;
}

static void sub_80F0574(struct Sprite *sprite)
{
    if (!TranslateAnimVerticalArc(sprite))
    {
        if ((sprite->pos1.y + sprite->pos2.y) < 65)
            return;
    }
    
    sprite->data[0] = 0;
    sprite->callback = sub_80F018C;
    gDoingBattleAnim = FALSE;
    UpdateOamPriorityInAllHealthboxes(1);
}

static void sub_80F05B4(u8 ballId)
{
    u8 taskId;

    if (GetSpriteTileStartByTag(gBallParticleSpritesheets[ballId].tag) == 0xFFFF)
    {
        LoadCompressedSpriteSheetUsingHeap(&gBallParticleSpritesheets[ballId]);
        LoadCompressedSpritePaletteUsingHeap(&gBallParticlePalettes[ballId]);
    }
}

u8 LaunchBallStarsTask(u8 x, u8 y, u8 priority, u8 subpriority, u8 ballId)
{
    u8 taskId;

    sub_80F05B4(ballId);
    taskId = CreateTask(gBallParticleAnimationFuncs[ballId], 5);
    gTasks[taskId].data[1] = x;
    gTasks[taskId].data[2] = y;
    gTasks[taskId].data[3] = priority;
    gTasks[taskId].data[4] = subpriority;
    gTasks[taskId].data[15] = ballId;
    PlaySE(SE_BOWA2);
    return taskId;
}

void sub_80F0674(void)
{
    if (gMain.inBattle)
        gBattleSpritesDataPtr->animationData->field_A++;
}

static void PokeBallOpenParticleAnimation(u8 taskId)
{
    u8 spriteId;
    u8 x, y;
    u8 priority, subpriority;
    u8 ballId;
    u8 var0;

    ballId = gTasks[taskId].data[15];
    if (gTasks[taskId].data[0] < 16)
    {
        x = gTasks[taskId].data[1];
        y = gTasks[taskId].data[2];
        priority = gTasks[taskId].data[3];
        subpriority = gTasks[taskId].data[4];

        spriteId = CreateSprite(&gBallParticlesSpriteTemplates[ballId], x, y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            sub_80F0674();
            StartSpriteAnim(&gSprites[spriteId], gBallParticleAnimNums[ballId]);
            gSprites[spriteId].callback = PokeBallOpenParticleAnimation_Step1;
            gSprites[spriteId].oam.priority = priority;

            var0 = (u8)gTasks[taskId].data[0];
            if (var0 >= 8)
                var0 -= 8;

            gSprites[spriteId].data[0] = var0 * 32;
        }

        if (gTasks[taskId].data[0] == 15)
        {
            if (!gMain.inBattle)
                gSprites[spriteId].data[7] = 1;

            DestroyTask(taskId);
            return;
        }
    }

    gTasks[taskId].data[0]++;
}

static void PokeBallOpenParticleAnimation_Step1(struct Sprite *sprite)
{
    if (sprite->data[1] == 0)
        sprite->callback = PokeBallOpenParticleAnimation_Step2;
    else
        sprite->data[1]--;
}

static void PokeBallOpenParticleAnimation_Step2(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[0], sprite->data[1]);
    sprite->pos2.y = Cos(sprite->data[0], sprite->data[1]);
    sprite->data[1] += 2;
    if (sprite->data[1] == 50)
        DestroyBallOpenAnimationParticle(sprite);
}

static void TimerBallOpenParticleAnimation(u8 taskId)
{
    u8 i;
    u8 x, y, priority, subpriority, ballId;
    u8 spriteId;

    ballId = gTasks[taskId].data[15];
    x = gTasks[taskId].data[1];
    y = gTasks[taskId].data[2];
    priority = gTasks[taskId].data[3];
    subpriority = gTasks[taskId].data[4];

    for (i = 0; i < 8; i++)
    {
        spriteId = CreateSprite(&gBallParticlesSpriteTemplates[ballId], x, y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            sub_80F0674();
            StartSpriteAnim(&gSprites[spriteId], gBallParticleAnimNums[ballId]);
            gSprites[spriteId].callback = FanOutBallOpenParticles_Step1;
            gSprites[spriteId].oam.priority = priority;
            gSprites[spriteId].data[0] = i * 32;
            gSprites[spriteId].data[4] = 10;
            gSprites[spriteId].data[5] = 2;
            gSprites[spriteId].data[6] = 1;
        }
    }

    if (!gMain.inBattle)
        gSprites[spriteId].data[7] = 1;

    DestroyTask(taskId);
}

static void DiveBallOpenParticleAnimation(u8 taskId)
{
    u8 i;
    u8 x, y, priority, subpriority, ballId;
    u8 spriteId;

    ballId = gTasks[taskId].data[15];
    x = gTasks[taskId].data[1];
    y = gTasks[taskId].data[2];
    priority = gTasks[taskId].data[3];
    subpriority = gTasks[taskId].data[4];

    for (i = 0; i < 8; i++)
    {
        spriteId = CreateSprite(&gBallParticlesSpriteTemplates[ballId], x, y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            sub_80F0674();
            StartSpriteAnim(&gSprites[spriteId], gBallParticleAnimNums[ballId]);
            gSprites[spriteId].callback = FanOutBallOpenParticles_Step1;
            gSprites[spriteId].oam.priority = priority;
            gSprites[spriteId].data[0] = i * 32;
            gSprites[spriteId].data[4] = 10;
            gSprites[spriteId].data[5] = 1;
            gSprites[spriteId].data[6] = 2;
        }
    }

    if (!gMain.inBattle)
        gSprites[spriteId].data[7] = 1;

    DestroyTask(taskId);
}

// Also used for Net Ball
static void SafariBallOpenParticleAnimation(u8 taskId)
{
    u8 i;
    u8 x, y, priority, subpriority, ballId;
    u8 spriteId;

    ballId = gTasks[taskId].data[15];
    x = gTasks[taskId].data[1];
    y = gTasks[taskId].data[2];
    priority = gTasks[taskId].data[3];
    subpriority = gTasks[taskId].data[4];

    for (i = 0; i < 8; i++)
    {
        spriteId = CreateSprite(&gBallParticlesSpriteTemplates[ballId], x, y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            sub_80F0674();
            StartSpriteAnim(&gSprites[spriteId], gBallParticleAnimNums[ballId]);
            gSprites[spriteId].callback = FanOutBallOpenParticles_Step1;
            gSprites[spriteId].oam.priority = priority;
            gSprites[spriteId].data[0] = i * 32;
            gSprites[spriteId].data[4] = 4;
            gSprites[spriteId].data[5] = 1;
            gSprites[spriteId].data[6] = 1;
        }
    }

    if (!gMain.inBattle)
        gSprites[spriteId].data[7] = 1;

    DestroyTask(taskId);
}

// Also used for Nest Ball
static void UltraBallOpenParticleAnimation(u8 taskId)
{
    u8 i;
    u8 x, y, priority, subpriority, ballId;
    u8 spriteId;

    ballId = gTasks[taskId].data[15];
    x = gTasks[taskId].data[1];
    y = gTasks[taskId].data[2];
    priority = gTasks[taskId].data[3];
    subpriority = gTasks[taskId].data[4];

    for (i = 0; i < 10; i++)
    {
        spriteId = CreateSprite(&gBallParticlesSpriteTemplates[ballId], x, y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            sub_80F0674();
            StartSpriteAnim(&gSprites[spriteId], gBallParticleAnimNums[ballId]);
            gSprites[spriteId].callback = FanOutBallOpenParticles_Step1;
            gSprites[spriteId].oam.priority = priority;
            gSprites[spriteId].data[0] = i * 25;
            gSprites[spriteId].data[4] = 5;
            gSprites[spriteId].data[5] = 1;
            gSprites[spriteId].data[6] = 1;
        }
    }

    if (!gMain.inBattle)
        gSprites[spriteId].data[7] = 1;

    DestroyTask(taskId);
}

// Also used for Luxury Ball
static void GreatBallOpenParticleAnimation(u8 taskId)
{
    u8 i;
    u8 x, y, priority, subpriority, ballId;
    u8 spriteId;

    if (gTasks[taskId].data[7])
    {
        gTasks[taskId].data[7]--;
    }
    else
    {
        ballId = gTasks[taskId].data[15];
        x = gTasks[taskId].data[1];
        y = gTasks[taskId].data[2];
        priority = gTasks[taskId].data[3];
        subpriority = gTasks[taskId].data[4];

        for (i = 0; i < 8; i++)
        {
            spriteId = CreateSprite(&gBallParticlesSpriteTemplates[ballId], x, y, subpriority);
            if (spriteId != MAX_SPRITES)
            {
                sub_80F0674();
                StartSpriteAnim(&gSprites[spriteId], gBallParticleAnimNums[ballId]);
                gSprites[spriteId].callback = FanOutBallOpenParticles_Step1;
                gSprites[spriteId].oam.priority = priority;
                gSprites[spriteId].data[0] = i * 32;
                gSprites[spriteId].data[4] = 8;
                gSprites[spriteId].data[5] = 2;
                gSprites[spriteId].data[6] = 2;
            }
        }

        gTasks[taskId].data[7] = 8;
        if (++gTasks[taskId].data[0] == 2)
        {
            if (!gMain.inBattle)
                gSprites[spriteId].data[7] = 1;

            DestroyTask(taskId);
        }
    }
}

static void FanOutBallOpenParticles_Step1(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[0], sprite->data[1]);
    sprite->pos2.y = Cos(sprite->data[0], sprite->data[2]);
    sprite->data[0] = (sprite->data[0] + sprite->data[4]) & 0xFF;
    sprite->data[1] += sprite->data[5];
    sprite->data[2] += sprite->data[6];
    if (++sprite->data[3] == 51)
        DestroyBallOpenAnimationParticle(sprite);
}

static void RepeatBallOpenParticleAnimation(u8 taskId)
{
    u8 i;
    u8 x, y, priority, subpriority, ballId;
    u8 spriteId;

    ballId = gTasks[taskId].data[15];
    x = gTasks[taskId].data[1];
    y = gTasks[taskId].data[2];
    priority = gTasks[taskId].data[3];
    subpriority = gTasks[taskId].data[4];

    for (i = 0; i < POKEBALL_COUNT; i++)
    {
        spriteId = CreateSprite(&gBallParticlesSpriteTemplates[ballId], x, y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            sub_80F0674();
            StartSpriteAnim(&gSprites[spriteId], gBallParticleAnimNums[ballId]);
            gSprites[spriteId].callback = RepeatBallOpenParticleAnimation_Step1;
            gSprites[spriteId].oam.priority = priority;
            gSprites[spriteId].data[0] = i * 21;
        }
    }

    if (!gMain.inBattle)
        gSprites[spriteId].data[7] = 1;

    DestroyTask(taskId);
}

static void RepeatBallOpenParticleAnimation_Step1(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[0], sprite->data[1]);
    sprite->pos2.y = Cos(sprite->data[0], Sin(sprite->data[0], sprite->data[2]));
    sprite->data[0] = (sprite->data[0] + 6) & 0xFF;
    sprite->data[1]++;
    sprite->data[2]++;
    if (++sprite->data[3] == 51)
        DestroyBallOpenAnimationParticle(sprite);
}

static void MasterBallOpenParticleAnimation(u8 taskId)
{
    u8 i, j;
    u8 x, y, priority, subpriority, ballId;
    u8 spriteId;

    ballId = gTasks[taskId].data[15];
    x = gTasks[taskId].data[1];
    y = gTasks[taskId].data[2];
    priority = gTasks[taskId].data[3];
    subpriority = gTasks[taskId].data[4];

    for (j = 0; j < 2; j++)
    {
        for (i = 0; i < 8; i++)
        {
            spriteId = CreateSprite(&gBallParticlesSpriteTemplates[ballId], x, y, subpriority);
            if (spriteId != MAX_SPRITES)
            {
                sub_80F0674();
                StartSpriteAnim(&gSprites[spriteId], gBallParticleAnimNums[ballId]);
                gSprites[spriteId].callback = FanOutBallOpenParticles_Step1;
                gSprites[spriteId].oam.priority = priority;
                gSprites[spriteId].data[0] = i * 32;
                gSprites[spriteId].data[4] = 8;

                if (j == 0)
                {
                    gSprites[spriteId].data[5] = 2;
                    gSprites[spriteId].data[6] = 1;
                }
                else
                {
                    gSprites[spriteId].data[5] = 1;
                    gSprites[spriteId].data[6] = 2;
                }
            }
        }
    }

    if (!gMain.inBattle)
        gSprites[spriteId].data[7] = 1;

    DestroyTask(taskId);
}

static void PremierBallOpenParticleAnimation(u8 taskId)
{
    u8 i;
    u8 x, y, priority, subpriority, ballId;
    u8 spriteId;

    ballId = gTasks[taskId].data[15];
    x = gTasks[taskId].data[1];
    y = gTasks[taskId].data[2];
    priority = gTasks[taskId].data[3];
    subpriority = gTasks[taskId].data[4];

    for (i = 0; i < 8; i++)
    {
        spriteId = CreateSprite(&gBallParticlesSpriteTemplates[ballId], x, y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            sub_80F0674();
            StartSpriteAnim(&gSprites[spriteId], gBallParticleAnimNums[ballId]);
            gSprites[spriteId].callback = PremierBallOpenParticleAnimation_Step1;
            gSprites[spriteId].oam.priority = priority;
            gSprites[spriteId].data[0] = i * 32;
        }
    }

    if (!gMain.inBattle)
        gSprites[spriteId].data[7] = 1;

    DestroyTask(taskId);
}

static void PremierBallOpenParticleAnimation_Step1(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[0], sprite->data[1]);
    sprite->pos2.y = Cos(sprite->data[0], Sin(sprite->data[0] & 0x3F, sprite->data[2]));
    sprite->data[0] = (sprite->data[0] + 10) & 0xFF;
    sprite->data[1]++;
    sprite->data[2]++;
    if (++sprite->data[3] == 51)
        DestroyBallOpenAnimationParticle(sprite);
}

static void DestroyBallOpenAnimationParticle(struct Sprite *sprite)
{
    int i, j;

    if (!gMain.inBattle)
    {
        if (sprite->data[7] == 1)
            DestroySpriteAndFreeResources(sprite);
        else
            DestroySprite(sprite);
    }
    else
    {
        gBattleSpritesDataPtr->animationData->field_A--;
        if (gBattleSpritesDataPtr->animationData->field_A == 0)
        {
            for (j = 0; j < POKEBALL_COUNT; j++)
            {
                FreeSpriteTilesByTag(gBallParticleSpritesheets[j].tag);
                FreeSpritePaletteByTag(gBallParticlePalettes[j].tag);
            }

            DestroySprite(sprite);
        }
        else
        {
            DestroySprite(sprite);
        }
    }
}

u8 LaunchBallFadeMonTask(bool8 unfadeLater, u8 battler, u32 selectedPalettes, u8 ballId)
{
    u8 taskId;

    taskId = CreateTask(sub_80F12E0, 5);
    gTasks[taskId].data[15] = ballId;
    gTasks[taskId].data[3] = battler;
    gTasks[taskId].data[10] = selectedPalettes;
    gTasks[taskId].data[11] = selectedPalettes >> 16;

    if (!unfadeLater)
    {
        BlendPalette(battler * 16 + 0x100, 16, 0, gBallOpenFadeColors[ballId]);
        gTasks[taskId].data[1] = 1;
    }
    else
    {
        BlendPalette(battler * 16 + 0x100, 16, 16, gBallOpenFadeColors[ballId]);
        gTasks[taskId].data[0] = 16;
        gTasks[taskId].data[1] = -1;
        gTasks[taskId].func = sub_80F1370;
    }

    BeginNormalPaletteFade(selectedPalettes, 0, 0, 16, RGB_WHITE);
    return taskId;
}

static void sub_80F12E0(u8 taskId)
{
    u8 ballId = gTasks[taskId].data[15];

    if (gTasks[taskId].data[2] <= 16)
    {
        BlendPalette(gTasks[taskId].data[3] * 16 + 0x100, 16, gTasks[taskId].data[0], gBallOpenFadeColors[ballId]);
        gTasks[taskId].data[0] += gTasks[taskId].data[1];
        gTasks[taskId].data[2]++;
    }
    else if (!gPaletteFade.active)
    {
        u32 selectedPalettes = (u16)gTasks[taskId].data[10] | ((u16)gTasks[taskId].data[11] << 16);
        BeginNormalPaletteFade(selectedPalettes, 0, 16, 0, RGB_WHITE);
        DestroyTask(taskId);
    }
}

static void sub_80F1370(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        u32 selectedPalettes = (u16)gTasks[taskId].data[10] | ((u16)gTasks[taskId].data[11] << 16);
        BeginNormalPaletteFade(selectedPalettes, 0, 16, 0, RGB_WHITE);
        gTasks[taskId].func = sub_80F13C0;
    }
}

static void sub_80F13C0(u8 taskId)
{
    u8 ballId = gTasks[taskId].data[15];

    if (gTasks[taskId].data[2] <= 16)
    {
        BlendPalette(gTasks[taskId].data[3] * 16 + 0x100, 16, gTasks[taskId].data[0], gBallOpenFadeColors[ballId]);
        gTasks[taskId].data[0] += gTasks[taskId].data[1];
        gTasks[taskId].data[2]++;
    }
    else
    {
        DestroyTask(taskId);
    }
}

void sub_80F1420(u8 taskId)
{
    u8 spriteId;
    u32 x;
    bool32 done = FALSE;

    spriteId = gBattlerSpriteIds[gBattleAnimAttacker];
    switch (gTasks[taskId].data[10])
    {
    case 0:
        gTasks[taskId].data[11] = gBattleAnimArgs[0];
        gTasks[taskId].data[0] += 0x500;
        if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
            gSprites[spriteId].pos2.x += gTasks[taskId].data[0] >> 8;
        else
            gSprites[spriteId].pos2.x -= gTasks[taskId].data[0] >> 8;

        gTasks[taskId].data[0] &= 0xFF;
        x = gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x + 32;
        if (x > 304)
            gTasks[taskId].data[10]++;
        break;
    case 1:
        LoadBattleMonGfxAndAnimate(gBattleAnimAttacker, gTasks[taskId].data[11], spriteId);
        gTasks[taskId].data[10]++;
        break;
    case 2:
        gTasks[taskId].data[0] += 0x500;
        if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
            gSprites[spriteId].pos2.x -= gTasks[taskId].data[0] >> 8;
        else
            gSprites[spriteId].pos2.x += gTasks[taskId].data[0] >> 8;

        gTasks[taskId].data[0] &= 0xFF;
        if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        {
            if (gSprites[spriteId].pos2.x <= 0)
            {
                gSprites[spriteId].pos2.x = 0;
                done = TRUE;
            }
        }
        else
        {
            if (gSprites[spriteId].pos2.x >= 0)
            {
                gSprites[spriteId].pos2.x = 0;
                done = TRUE;
            }
        }

        if (done)
            DestroyAnimVisualTask(taskId);

        break;
    }
}

void sub_80F15C8(u8 taskId)
{
    u8 spriteId;

    switch (gTasks[taskId].data[15])
    {
    case 0:
        if (GetBattlerSpriteBGPriorityRank(gBattleAnimAttacker) == B_POSITION_OPPONENT_LEFT)
            SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG1 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_ALL);
        else
            SetGpuReg(REG_OFFSET_BLDCNT, BLDCNT_TGT1_BG2 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_ALL);

        SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(16, 0));
        gTasks[taskId].data[15]++;
        break;
    case 1:
        if (gTasks[taskId].data[1]++ > 1)
        {
            gTasks[taskId].data[1] = 0;
            gTasks[taskId].data[0]++;
            SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(16 - gTasks[taskId].data[0], gTasks[taskId].data[0]));
            if (gTasks[taskId].data[0] == 16)
                gTasks[taskId].data[15]++;
        }
        break;
    case 2:
        spriteId = gBattlerSpriteIds[gBattleAnimAttacker];
        RequestDma3Fill(0, (void *)OBJ_VRAM0 + gSprites[spriteId].oam.tileNum * TILE_SIZE_4BPP, 0x800, 1);
        ClearBehindSubstituteBit(gBattleAnimAttacker);
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void AnimTask_IsAttackerBehindSubstitute(u8 taskId)
{
    gBattleAnimArgs[ARG_RET_ID] = gBattleSpritesDataPtr->battlerData[gBattleAnimAttacker].behindSubstitute;
    DestroyAnimVisualTask(taskId);
}

void AnimTask_TargetToEffectBattler(u8 taskId)
{
    gBattleAnimTarget = gEffectBattler;
    DestroyAnimVisualTask(taskId);
}

void sub_80F1720(u8 battler, struct Pokemon *mon)
{
    bool32 isShiny;
    u32 otId, personality;
    u32 shinyValue;
    u8 taskId1, taskId2;

    isShiny = FALSE;
    gBattleSpritesDataPtr->healthBoxesData[battler].flag_x80 = 1;
    otId = GetMonData(mon, MON_DATA_OT_ID);
    personality = GetMonData(mon, MON_DATA_PERSONALITY);

    if (IsBattlerSpriteVisible(battler))
    {
        shinyValue = HIHALF(otId) ^ LOHALF(otId) ^ HIHALF(personality) ^ LOHALF(personality);
        if (shinyValue < SHINY_ODDS)
            isShiny = TRUE;

        if (isShiny)
        {
            if (GetSpriteTileStartByTag(ANIM_TAG_GOLD_STARS) == 0xFFFF)
            {
                LoadCompressedSpriteSheetUsingHeap(&gBattleAnimPicTable[ANIM_TAG_GOLD_STARS - ANIM_SPRITES_START]);
                LoadCompressedSpritePaletteUsingHeap(&gBattleAnimPaletteTable[ANIM_TAG_GOLD_STARS - ANIM_SPRITES_START]);
            }

            taskId1 = CreateTask(sub_80F181C, 10);
            taskId2 = CreateTask(sub_80F181C, 10);
            gTasks[taskId1].data[0] = battler;
            gTasks[taskId2].data[0] = battler;
            gTasks[taskId1].data[1] = 0;
            gTasks[taskId2].data[1] = 1;
            return;
        }
    }

    gBattleSpritesDataPtr->healthBoxesData[battler].field_1_x1 = 1;
}

static void sub_80F181C(u8 taskId)
{
    u8 battler;
    u8 x, y;
    u8 spriteId;
    u16 counter;
    s16 state;
    u8 pan;

    if (gTasks[taskId].data[13] < 60)
    {
        gTasks[taskId].data[13]++;
        return;
    }

    if (gBattleSpritesDataPtr->animationData->field_A)
        return;

    counter = gTasks[taskId].data[10]++;
    if (counter & 3)
        return;

    battler = gTasks[taskId].data[0];
    x = GetBattlerSpriteCoord(battler, BATTLER_COORD_X);
    y = GetBattlerSpriteCoord(battler, BATTLER_COORD_Y);
    state = gTasks[taskId].data[11];
    if (state == 0)
    {
        spriteId = CreateSprite(&gWishStarSpriteTemplate, x, y, 5);
    }
    else if (state >= 0 && gTasks[taskId].data[11] < 4)
    {
        spriteId = CreateSprite(&gMiniTwinklingStarSpriteTemplate, x, y, 5);
        gSprites[spriteId].oam.tileNum += 4;
    }
    else
    {
        spriteId = CreateSprite(&gMiniTwinklingStarSpriteTemplate, x, y, 5);
        gSprites[spriteId].oam.tileNum += 5;
    }

    if (gTasks[taskId].data[1] == FALSE)
    {
        gSprites[spriteId].callback = sub_80F1A2C;
    }
    else
    {
        gSprites[spriteId].callback = sub_80F1A80;
        gSprites[spriteId].pos2.x = -32;
        gSprites[spriteId].pos2.y = 32;
        gSprites[spriteId].invisible = TRUE;
        if (gTasks[taskId].data[11] == FALSE)
        {
            if (GetBattlerSide(battler) == B_SIDE_PLAYER)
                pan = SOUND_PAN_ATTACKER;
            else
                pan = SOUND_PAN_TARGET;

            PlaySE12WithPanning(SE_REAPOKE, pan);
        }
    }

    gSprites[spriteId].data[0] = taskId;
    gTasks[taskId].data[11]++;
    if (spriteId != MAX_SPRITES)
        gTasks[taskId].data[12]++;

    if (gTasks[taskId].data[11] == 5)
        gTasks[taskId].func = sub_80F19E0;
}

static void sub_80F19E0(u8 taskId)
{
    u8 battler;

    if (gTasks[taskId].data[12] == FALSE)
    {
        if (gTasks[taskId].data[1] == TRUE)
        {
            battler = gTasks[taskId].data[0];
            gBattleSpritesDataPtr->healthBoxesData[battler].field_1_x1 = 1;
        }

        DestroyTask(taskId);
    }
}

static void sub_80F1A2C(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[1], 24);
    sprite->pos2.y = Cos(sprite->data[1], 24);
    sprite->data[1] += 12;
    if (sprite->data[1] > 0xFF)
    {
        gTasks[sprite->data[0]].data[12]--;
        FreeSpriteOamMatrix(sprite);
        DestroySprite(sprite);
    }
}

static void sub_80F1A80(struct Sprite *sprite)
{
    if (sprite->data[1] < 4)
    {
        sprite->data[1]++;
    }
    else
    {
        sprite->invisible = FALSE;
        sprite->pos2.x += 5;
        sprite->pos2.y -= 5;
        if (sprite->pos2.x > 32)
        {
            gTasks[sprite->data[0]].data[12]--;
            FreeSpriteOamMatrix(sprite);
            DestroySprite(sprite);
        }
    }
}

void AnimTask_LoadPokeblockGfx(u8 taskId)
{
    u8 paletteIndex;

    LoadCompressedSpriteSheetUsingHeap(&gBattleAnimPicTable[ANIM_TAG_POKEBLOCK - ANIM_SPRITES_START]);
    LoadCompressedSpritePaletteUsingHeap(&gBattleAnimPaletteTable[ANIM_TAG_POKEBLOCK - ANIM_SPRITES_START]);
    paletteIndex = IndexOfSpritePaletteTag(ANIM_TAG_POKEBLOCK); // unused
    DestroyAnimVisualTask(taskId);
}

void AnimTask_FreePokeblockGfx(u8 taskId)
{
    FreeSpriteTilesByTag(ANIM_TAG_POKEBLOCK);
    FreeSpritePaletteByTag(ANIM_TAG_POKEBLOCK);
    DestroyAnimVisualTask(taskId);
}

static void sub_80F1B3C(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, 0);
    sprite->data[0] = 30;
    sprite->data[2] = GetBattlerSpriteCoord(GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), BATTLER_COORD_X) + gBattleAnimArgs[2];
    sprite->data[4] = GetBattlerSpriteCoord(GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), BATTLER_COORD_Y) + gBattleAnimArgs[3];
    sprite->data[5] = -32;
    InitAnimArcTranslation(sprite);
    gSprites[gBattlerSpriteIds[gBattleAnimAttacker]].callback = sub_8012354;
    sprite->callback = sub_80F1BCC;
}

static void sub_80F1BCC(struct Sprite *sprite)
{
    if (gSprites[gBattlerSpriteIds[gBattleAnimAttacker]].animCmdIndex == 1)
        sprite->callback = sub_80F1C04;
}

static void sub_80F1C04(struct Sprite *sprite)
{
    if (TranslateAnimHorizontalArc(sprite))
    {
        sprite->data[0] = 0;
        sprite->invisible = TRUE;
        sprite->callback = sub_80F1C30;
    }
}

static void sub_80F1C30(struct Sprite *sprite)
{
    if (gSprites[gBattlerSpriteIds[gBattleAnimAttacker]].animEnded)
    {
        if (++sprite->data[0] > 0)
        {
            StartSpriteAnim(&gSprites[gBattlerSpriteIds[gBattleAnimAttacker]], 0);
            DestroyAnimSprite(sprite);
        }
    }
}

void sub_80F1C8C(u8 taskId)
{
    switch (gBattleAnimArgs[0])
    {
    case 0:
        gBattleAnimAttacker = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
        gBattleAnimTarget = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
        break;
    case 1:
        gBattleAnimAttacker = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
        gBattleAnimTarget = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
        break;
    }

    DestroyAnimVisualTask(taskId);
}

void sub_80F1CE4(u8 taskId)
{
    if (gBattleCommunication[MULTISTRING_CHOOSER] > 2)
        gBattleAnimArgs[7] = 0;
    else
        gBattleAnimArgs[7] = gBattleCommunication[MULTISTRING_CHOOSER];
    
    DestroyAnimVisualTask(taskId);
}

void AnimTask_GetTrappedMoveAnimId(u8 taskId)
{
    if (gBattleSpritesDataPtr->animationData->animArg == MOVE_FIRE_SPIN)
        gBattleAnimArgs[0] = TRAP_ANIM_FIRE_SPIN;
    else if (gBattleSpritesDataPtr->animationData->animArg == MOVE_WHIRLPOOL)
        gBattleAnimArgs[0] = TRAP_ANIM_WHIRLPOOL;
    else if (gBattleSpritesDataPtr->animationData->animArg == MOVE_CLAMP)
        gBattleAnimArgs[0] = TRAP_ANIM_CLAMP;
    else if (gBattleSpritesDataPtr->animationData->animArg == MOVE_SAND_TOMB)
        gBattleAnimArgs[0] = TRAP_ANIM_SAND_TOMB;
    else
        gBattleAnimArgs[0] = TRAP_ANIM_BIND;

    DestroyAnimVisualTask(taskId);
}

void AnimTask_GetBattlersFromArg(u8 taskId)
{
    gBattleAnimAttacker = gBattleSpritesDataPtr->animationData->animArg;
    gBattleAnimTarget = gBattleSpritesDataPtr->animationData->animArg >> 8;
    DestroyAnimVisualTask(taskId);
}
