#include "global.h"
#include "gflib.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_main.h"
#include "battle_message.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "decompress.h"
#include "graphics.h"
#include "m4a.h"
#include "pokeball.h"
#include "task.h"
#include "trig.h"
#include "util.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/songs.h"

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

COMMON_DATA u32 gMonShrinkDuration = 0;
COMMON_DATA u16 gMonShrinkDelta = 0;
COMMON_DATA u16 gMonShrinkDistance = 0;

static void AnimTask_UnusedLevelUpHealthBox_Step(u8);
static void AnimTask_FlashHealthboxOnLevelUp_Step(u8);
static void AnimTask_ThrowBall_WaitAnimObjComplete(u8);
static void SpriteCB_ThrowBall_Init(struct Sprite *);
static void AnimTask_ThrowBallSpecial_PlaySfx(u8);
static void AnimTask_ThrowBallSpecial_ResetPlayerSprite(u8);
static void SpriteCB_ThrowBall_ArcFlight(struct Sprite *);
static void TrainerBallBlock(struct Sprite *);
static void SpriteCB_ThrowBall_TenFrameDelay(struct Sprite *);
static void SpriteCB_ThrowBall_ShrinkMon(struct Sprite *);
static void SpriteCB_ThrowBall_InitialFall(struct Sprite *);
static void SpriteCB_ThrowBall_Bounce(struct Sprite *);
static void SpriteCB_ThrowBall_DelayThenBreakOut(struct Sprite *);
static void SpriteCB_ThrowBall_InitShake(struct Sprite *);
static void SpriteCB_ThrowBall_DoShake(struct Sprite *);
static void SpriteCB_ThrowBall_InitClick(struct Sprite *);
static void SpriteCB_ThrowBall_BeginBreakOut(struct Sprite *);
static void SpriteCB_ThrowBall_DoClick(struct Sprite *);
static void CreateStarsWhenBallClicks(struct Sprite *);
static void SpriteCB_ThrowBall_FinishClick(struct Sprite *);
static void BattleAnimObj_SignalEnd(struct Sprite *);
static void LoadBallParticleGfx(u8);
static void SpriteCB_BallCaptureSuccessStar(struct Sprite *);
static void SpriteCB_ThrowBall_RunBreakOut(struct Sprite *);
static void TrainerBallBlock2(struct Sprite *);
static void GhostBallDodge(struct Sprite *sprite);
static void GhostBallDodge2(struct Sprite *sprite);
static void PokeBallOpenParticleAnimation_Step1(struct Sprite *);
static void PokeBallOpenParticleAnimation_Step2(struct Sprite *);
static void DestroyBallOpenAnimationParticle(struct Sprite *);
static void FanOutBallOpenParticles_Step1(struct Sprite *);
static void RepeatBallOpenParticleAnimation_Step1(struct Sprite *);
static void PremierBallOpenParticleAnimation_Step1(struct Sprite *);
static void Task_FadeMon_ToBallColor(u8);
static void Task_FadeMon_ToNormal(u8);
static void Task_FadeMon_ToNormal_Step(u8);
static void AnimTask_ShinySparkles(u8);
static void SpriteCB_ShinySparkles_1(struct Sprite *);
static void SpriteCB_ShinySparkles_2(struct Sprite *);
static void AnimTask_ShinySparkles_WaitSparkles(u8);
static void SpriteCB_SafariBaitOrRock_WaitPlayerThrow(struct Sprite *);
static void SpriteCB_SafariBaitOrRock_ArcFlight(struct Sprite *);
static void SpriteCB_SafariBaitOrRock_Finish(struct Sprite *);
static void PokeBallOpenParticleAnimation(u8);
static void GreatBallOpenParticleAnimation(u8);
static void SafariBallOpenParticleAnimation(u8);
static void UltraBallOpenParticleAnimation(u8);
static void MasterBallOpenParticleAnimation(u8);
static void DiveBallOpenParticleAnimation(u8);
static void RepeatBallOpenParticleAnimation(u8);
static void TimerBallOpenParticleAnimation(u8);
static void PremierBallOpenParticleAnimation(u8);
static void SpriteCB_SafariBaitOrRock_Init(struct Sprite *);

struct CaptureStar
{
    s8 xOffset;
    s8 yOffset;
    s8 amplitude;
};

static const struct CaptureStar sCaptureStar[] =
{
    {
        .xOffset = 10,
        .yOffset = 2,
        .amplitude = -3,
    },
    {
        .xOffset = 15,
        .yOffset = 0,
        .amplitude = -4,
    },
    {
        .xOffset = -10,
        .yOffset = 2,
        .amplitude = -4,
    },
};

const struct CompressedSpriteSheet gBallParticleSpritesheets[] =
{
    [BALL_POKE]    = {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_POKEBALL},
    [BALL_GREAT]   = {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_GREATBALL},
    [BALL_SAFARI]  = {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_SAFARIBALL},
    [BALL_ULTRA]   = {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_ULTRABALL},
    [BALL_MASTER]  = {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_MASTERBALL},
    [BALL_NET]     = {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_NETBALL},
    [BALL_DIVE]    = {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_DIVEBALL},
    [BALL_NEST]    = {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_NESTBALL},
    [BALL_REPEAT]  = {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_REPEATBALL},
    [BALL_TIMER]   = {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_TIMERBALL},
    [BALL_LUXURY]  = {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_LUXURYBALL},
    [BALL_PREMIER] = {gBattleAnimSpriteGfx_Particles, 0x100, TAG_PARTICLES_PREMIERBALL},
};

const struct CompressedSpritePalette gBallParticlePalettes[] =
{
    [BALL_POKE]    = {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_POKEBALL},
    [BALL_GREAT]   = {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_GREATBALL},
    [BALL_SAFARI]  = {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_SAFARIBALL},
    [BALL_ULTRA]   = {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_ULTRABALL},
    [BALL_MASTER]  = {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_MASTERBALL},
    [BALL_NET]     = {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_NETBALL},
    [BALL_DIVE]    = {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_DIVEBALL},
    [BALL_NEST]    = {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_NESTBALL},
    [BALL_REPEAT]  = {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_REPEATBALL},
    [BALL_TIMER]   = {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_TIMERBALL},
    [BALL_LUXURY]  = {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_LUXURYBALL},
    [BALL_PREMIER] = {gBattleAnimSpritePal_CircleImpact, TAG_PARTICLES_PREMIERBALL},
};

static const union AnimCmd sAnim_RegularBall[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_FRAME(0, 1, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnim_MasterBall[] =
{
    ANIMCMD_FRAME(3, 1),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_NetDiveBall[] =
{
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_NestBall[] =
{
    ANIMCMD_FRAME(5, 1),
    ANIMCMD_END,
};

static const union AnimCmd sAnim_LuxuryPremierBall[] =
{
    ANIMCMD_FRAME(6, 4),
    ANIMCMD_FRAME(7, 4),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnim_UltraRepeatTimerBall[] =    
{
    ANIMCMD_FRAME(7, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const sAnims_BallParticles[] =    
{
    sAnim_RegularBall,
    sAnim_MasterBall,
    sAnim_NetDiveBall,
    sAnim_NestBall,
    sAnim_LuxuryPremierBall,
    sAnim_UltraRepeatTimerBall,
};

static const u8 sBallParticleAnimNums[] =
{
    [BALL_POKE]    = 0,
    [BALL_GREAT]   = 0,
    [BALL_SAFARI]  = 0,
    [BALL_ULTRA]   = 5,
    [BALL_MASTER]  = 1,
    [BALL_NET]     = 2,
    [BALL_DIVE]    = 2,
    [BALL_NEST]    = 3,
    [BALL_REPEAT]  = 5,
    [BALL_TIMER]   = 5,
    [BALL_LUXURY]  = 4,
    [BALL_PREMIER] = 4,
};

static const TaskFunc sBallParticleAnimationFuncs[] =
{
    [BALL_POKE]    = PokeBallOpenParticleAnimation,
    [BALL_GREAT]   = GreatBallOpenParticleAnimation,
    [BALL_SAFARI]  = SafariBallOpenParticleAnimation,
    [BALL_ULTRA]   = UltraBallOpenParticleAnimation,
    [BALL_MASTER]  = MasterBallOpenParticleAnimation,
    [BALL_NET]     = SafariBallOpenParticleAnimation,
    [BALL_DIVE]    = DiveBallOpenParticleAnimation,
    [BALL_NEST]    = UltraBallOpenParticleAnimation,
    [BALL_REPEAT]  = RepeatBallOpenParticleAnimation,
    [BALL_TIMER]   = TimerBallOpenParticleAnimation,
    [BALL_LUXURY]  = GreatBallOpenParticleAnimation,
    [BALL_PREMIER] = PremierBallOpenParticleAnimation,
};

static const struct SpriteTemplate sBallParticlesSpriteTemplates[] =
{
    [BALL_POKE] = {
        .tileTag = TAG_PARTICLES_POKEBALL,
        .paletteTag = TAG_PARTICLES_POKEBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = sAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    [BALL_GREAT] = {
        .tileTag = TAG_PARTICLES_GREATBALL,
        .paletteTag = TAG_PARTICLES_GREATBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = sAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    [BALL_SAFARI] = {
        .tileTag = TAG_PARTICLES_SAFARIBALL,
        .paletteTag = TAG_PARTICLES_SAFARIBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = sAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    [BALL_ULTRA] = {
        .tileTag = TAG_PARTICLES_ULTRABALL,
        .paletteTag = TAG_PARTICLES_ULTRABALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = sAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    [BALL_MASTER] = {
        .tileTag = TAG_PARTICLES_MASTERBALL,
        .paletteTag = TAG_PARTICLES_MASTERBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = sAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    [BALL_NET] = {
        .tileTag = TAG_PARTICLES_NETBALL,
        .paletteTag = TAG_PARTICLES_NETBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = sAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    [BALL_DIVE] = {
        .tileTag = TAG_PARTICLES_DIVEBALL,
        .paletteTag = TAG_PARTICLES_DIVEBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = sAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    [BALL_NEST] = {
        .tileTag = TAG_PARTICLES_NESTBALL,
        .paletteTag = TAG_PARTICLES_NESTBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = sAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    [BALL_REPEAT] = {
        .tileTag = TAG_PARTICLES_REPEATBALL,
        .paletteTag = TAG_PARTICLES_REPEATBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = sAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    [BALL_TIMER] = {
        .tileTag = TAG_PARTICLES_TIMERBALL,
        .paletteTag = TAG_PARTICLES_TIMERBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = sAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    [BALL_LUXURY] = {
        .tileTag = TAG_PARTICLES_LUXURYBALL,
        .paletteTag = TAG_PARTICLES_LUXURYBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = sAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    [BALL_PREMIER] = {
        .tileTag = TAG_PARTICLES_PREMIERBALL,
        .paletteTag = TAG_PARTICLES_PREMIERBALL,
        .oam = &gOamData_AffineOff_ObjNormal_8x8,
        .anims = sAnims_BallParticles,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
};

static const u16 sBallOpenFadeColors[] =
{
    [BALL_POKE]    = RGB(31, 22, 30),
    [BALL_GREAT]   = RGB(16, 23, 30),
    [BALL_SAFARI]  = RGB(23, 30, 20),
    [BALL_ULTRA]   = RGB(31, 31, 15),
    [BALL_MASTER]  = RGB(23, 20, 28),
    [BALL_NET]     = RGB(21, 31, 25),
    [BALL_DIVE]    = RGB(12, 25, 30),
    [BALL_NEST]    = RGB(30, 27, 10),
    [BALL_REPEAT]  = RGB(31, 24, 16),
    [BALL_TIMER]   = RGB(29, 30, 30),
    [BALL_LUXURY]  = RGB(31, 17, 10),
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

const struct SpriteTemplate gSafariBaitSpriteTemplate =
{
    .tileTag = ANIM_TAG_SAFARI_BAIT,
    .paletteTag = ANIM_TAG_SAFARI_BAIT,
    .oam = &gOamData_AffineOff_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_SafariBaitOrRock_Init,
};

static const union AnimCmd sSpriteAnim_SafariRock_0[] =
{
    ANIMCMD_FRAME(64, 1),
    ANIMCMD_END,
};

static const union AnimCmd *const sSpriteAnimTable_SafariRock[] =
{
    sSpriteAnim_SafariRock_0,
};

const struct SpriteTemplate gSafariRockTemplate =
{
    .tileTag = ANIM_TAG_ROCKS,
    .paletteTag = ANIM_TAG_ROCKS,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = sSpriteAnimTable_SafariRock,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_SafariBaitOrRock_Init,
};

// Unused
void AnimTask_LevelUpHealthBox(u8 taskId)
{
    struct BattleAnimBgData animBgData;
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
    GetBattleAnimBg1Data(&animBgData);
    AnimLoadCompressedBgTilemap(animBgData.bgId, gUnusedLevelupAnimationTilemap);
    AnimLoadCompressedBgGfx(animBgData.bgId, gUnusedLevelupAnimationGfx, animBgData.tilesOffset);
    LoadCompressedPalette(gCureBubblesPal, BG_PLTT_ID(animBgData.paletteId), PLTT_SIZE_4BPP);
    gBattle_BG1_X = -gSprites[spriteId3].x + 32;
    gBattle_BG1_Y = -gSprites[spriteId3].y - 32;
    gTasks[taskId].data[1] = 640;
    gTasks[taskId].data[0] = spriteId3;
    gTasks[taskId].data[2] = spriteId4;
    gTasks[taskId].func = AnimTask_UnusedLevelUpHealthBox_Step;
}

static void AnimTask_UnusedLevelUpHealthBox_Step(u8 taskId)
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
                ResetBattleAnimBg(0);
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

void DoLoadHealthboxPalsForLevelUp(u8 *paletteId1, u8 *paletteId2, u8 battler)
{
    u8 healthBoxSpriteId;
    u8 spriteId1, spriteId2;
    u16 offset1, offset2;

    healthBoxSpriteId = gHealthboxSpriteIds[battler];
    spriteId1 = gSprites[healthBoxSpriteId].oam.affineParam;
    spriteId2 = gSprites[healthBoxSpriteId].data[5];
    *paletteId1 = AllocSpritePalette(TAG_HEALTHBOX_PALS_1);
    *paletteId2 = AllocSpritePalette(TAG_HEALTHBOX_PALS_2);
    offset1 = OBJ_PLTT_ID(gSprites[healthBoxSpriteId].oam.paletteNum);
    offset2 = OBJ_PLTT_ID(gSprites[spriteId2].oam.paletteNum);
    LoadPalette(&gPlttBufferUnfaded[offset1], OBJ_PLTT_ID(*paletteId1), PLTT_SIZE_4BPP);
    LoadPalette(&gPlttBufferUnfaded[offset2], OBJ_PLTT_ID(*paletteId2), PLTT_SIZE_4BPP);
    gSprites[healthBoxSpriteId].oam.paletteNum = *paletteId1;
    gSprites[spriteId1].oam.paletteNum = *paletteId1;
    gSprites[spriteId2].oam.paletteNum = *paletteId2;
}

void AnimTask_LoadHealthboxPalsForLevelUp(u8 taskId)
{
    u8 paletteId1, paletteId2;
    
    DoLoadHealthboxPalsForLevelUp(&paletteId1, &paletteId2, gBattleAnimAttacker);
    DestroyAnimVisualTask(taskId);
}

void DoFreeHealthboxPalsForLevelUp(u8 battler)
{
    u8 healthBoxSpriteId;
    u8 spriteId1, spriteId2;
    u8 paletteId1, paletteId2;

    healthBoxSpriteId = gHealthboxSpriteIds[battler];
    spriteId1 = gSprites[healthBoxSpriteId].oam.affineParam;
    spriteId2 = gSprites[healthBoxSpriteId].data[5];
    FreeSpritePaletteByTag(TAG_HEALTHBOX_PALS_1);
    FreeSpritePaletteByTag(TAG_HEALTHBOX_PALS_2);
    paletteId1 = IndexOfSpritePaletteTag(TAG_HEALTHBOX_PAL);
    paletteId2 = IndexOfSpritePaletteTag(TAG_HEALTHBAR_PAL);
    gSprites[healthBoxSpriteId].oam.paletteNum = paletteId1;
    gSprites[spriteId1].oam.paletteNum = paletteId1;
    gSprites[spriteId2].oam.paletteNum = paletteId2;
}

void AnimTask_FreeHealthboxPalsForLevelUp(u8 taskId)
{
    DoFreeHealthboxPalsForLevelUp(gBattleAnimAttacker);
    DestroyAnimVisualTask(taskId);
}

void AnimTask_FlashHealthboxOnLevelUp(u8 taskId)
{
    gTasks[taskId].data[10] = gBattleAnimArgs[0];
    gTasks[taskId].data[11] = gBattleAnimArgs[1];
    gTasks[taskId].func = AnimTask_FlashHealthboxOnLevelUp_Step;
}

static void AnimTask_FlashHealthboxOnLevelUp_Step(u8 taskId)
{
    u8 paletteNum;
    int paletteOffset, colorOffset;

    gTasks[taskId].data[0]++;
    if (gTasks[taskId].data[0]++ >= gTasks[taskId].data[11])
    {
        gTasks[taskId].data[0] = 0;
        paletteNum = IndexOfSpritePaletteTag(TAG_HEALTHBOX_PALS_1);
        colorOffset = gTasks[taskId].data[10] == 0 ? 6 : 2;
        switch (gTasks[taskId].data[1])
        {
        case 0:
            gTasks[taskId].data[2] += 2;
            if (gTasks[taskId].data[2] > 16)
                gTasks[taskId].data[2] = 16;

            paletteOffset = OBJ_PLTT_ID(paletteNum);
            BlendPalette(paletteOffset + colorOffset, 1, gTasks[taskId].data[2], RGB(20, 27, 31));
            if (gTasks[taskId].data[2] == 16)
                gTasks[taskId].data[1]++;
            break;
        case 1:
            gTasks[taskId].data[2] -= 2;
            if (gTasks[taskId].data[2] < 0)
                gTasks[taskId].data[2] = 0;

            paletteOffset = OBJ_PLTT_ID(paletteNum);
            BlendPalette(paletteOffset + colorOffset, 1, gTasks[taskId].data[2], RGB(20, 27, 31));
            if (gTasks[taskId].data[2] == 0)
                DestroyAnimVisualTask(taskId);
            break;
        }
    }
}

void AnimTask_SwitchOutShrinkMon(u8 taskId)
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

void AnimTask_SwitchOutBallEffect(u8 taskId)
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
        gTasks[taskId].data[10] = AnimateBallOpenParticles(x, y + 32, priority, subpriority, ballId);
        selectedPalettes = GetBattlePalettesMask(1, 0, 0, 0, 0, 0, 0);
        gTasks[taskId].data[11] = LaunchBallFadeMonTask(0, gBattleAnimAttacker, selectedPalettes, ballId);
        gTasks[taskId].data[0]++;
        break;
    case 1:
        if (!gTasks[gTasks[taskId].data[10]].isActive && !gTasks[gTasks[taskId].data[11]].isActive)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

void AnimTask_LoadBallGfx(u8 taskId)
{
    u8 ballId = ItemIdToBallId(gLastUsedItem);
    
    LoadBallGfx(ballId);
    DestroyAnimVisualTask(taskId);
}

void AnimTask_FreeBallGfx(u8 taskId)
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

void AnimTask_ThrowBall(u8 taskId)
{
    u8 ballId;
    u8 spriteId;

    ballId = ItemIdToBallId(gLastUsedItem);
    spriteId = CreateSprite(&gBallSpriteTemplates[ballId], 32, 80, 29);
    gSprites[spriteId].data[0] = 34;
    gSprites[spriteId].data[1] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X);
    gSprites[spriteId].data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y) - 16;
    gSprites[spriteId].callback = SpriteCB_ThrowBall_Init;
    gBattleSpritesDataPtr->animationData->wildMonInvisible = gSprites[gBattlerSpriteIds[gBattleAnimTarget]].invisible;
    gTasks[taskId].data[0] = spriteId;
    gTasks[taskId].func = AnimTask_ThrowBall_WaitAnimObjComplete;
}

static void AnimTask_ThrowBall_WaitAnimObjComplete(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[0];
    
    if ((u16)gSprites[spriteId].data[0] == 0xFFFF)
        DestroyAnimVisualTask(taskId);
}

void AnimTask_ThrowBallSpecial(u8 taskId)
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
    gSprites[gBattlerSpriteIds[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)]].callback = SpriteCB_PlayerThrowInit;
    gTasks[taskId].data[0] = spriteId;
    gTasks[taskId].func = AnimTask_ThrowBallSpecial_PlaySfx;
}

static void AnimTask_ThrowBallSpecial_PlaySfx(u8 taskId)
{
    if (gSprites[gBattlerSpriteIds[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)]].animCmdIndex == 1)
    {
        PlaySE12WithPanning(SE_BALL_THROW, 0);
        gSprites[gTasks[taskId].data[0]].callback = SpriteCB_ThrowBall_Init;
        CreateTask(AnimTask_ThrowBallSpecial_ResetPlayerSprite, 10);
        gTasks[taskId].func = AnimTask_ThrowBall_WaitAnimObjComplete;
    }
}

static void AnimTask_ThrowBallSpecial_ResetPlayerSprite(u8 taskId)
{
    if (gSprites[gBattlerSpriteIds[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)]].animEnded)
    {
        StartSpriteAnim(&gSprites[gBattlerSpriteIds[GetBattlerAtPosition(B_POSITION_PLAYER_LEFT)]], 0);
        DestroyTask(taskId);
    }
}

static void SpriteCB_ThrowBall_Init(struct Sprite *sprite)
{
    u16 destX = sprite->data[1];
    u16 destY = sprite->data[2];
    
    sprite->sTransl_InitX = sprite->x;
    sprite->sTransl_DestX = destX;
    sprite->sTransl_InitY = sprite->y;
    sprite->sTransl_DestY = destY;
    sprite->sTransl_ArcAmpl = -40;
    InitAnimArcTranslation(sprite);
    sprite->callback = SpriteCB_ThrowBall_ArcFlight;
}

static void SpriteCB_ThrowBall_ArcFlight(struct Sprite *sprite)
{
    int i;
    u8 ballId;

    if (TranslateAnimHorizontalArc(sprite))
    {
        if (gBattleSpritesDataPtr->animationData->ballThrowCaseId == BALL_TRAINER_BLOCK)
        {
            sprite->callback = TrainerBallBlock;
        }
        else if (gBattleSpritesDataPtr->animationData->ballThrowCaseId == BALL_GHOST_DODGE)
        {
            sprite->callback = GhostBallDodge;
        }
        else
        {
            StartSpriteAnim(sprite, 1);
            sprite->x += sprite->x2;
            sprite->y += sprite->y2;
            sprite->x2 = 0;
            sprite->y2 = 0;

            for (i = 0; i < 8; i++)
                sprite->data[i] = 0;

            sprite->data[5] = 0;
            sprite->callback = SpriteCB_ThrowBall_TenFrameDelay;

            ballId = ItemIdToBallId(gLastUsedItem);
            switch (ballId)
            {
            case 0 ... POKEBALL_COUNT - 1:
                AnimateBallOpenParticles(sprite->x, sprite->y - 5, 1, 28, ballId);
                LaunchBallFadeMonTask(0, gBattleAnimTarget, 14, ballId);
                break;
            }
        }
    }
}

static void SpriteCB_ThrowBall_TenFrameDelay(struct Sprite *sprite)
{
    if (++sprite->data[5] == 10)
    {
        sprite->data[5] = CreateTask(TaskDummy, 50);
        sprite->callback = SpriteCB_ThrowBall_ShrinkMon;
        gSprites[gBattlerSpriteIds[gBattleAnimTarget]].data[1] = 0;
    }
}

static void SpriteCB_ThrowBall_ShrinkMon(struct Sprite *sprite)
{
    u8 spriteId;
    u8 taskId;

    spriteId = gBattlerSpriteIds[gBattleAnimTarget];
    taskId = sprite->data[5];
    if (++gTasks[taskId].data[1] == 11)
        PlaySE(SE_BALL_TRADE);

    switch (gTasks[taskId].data[0])
    {
    case 0:
        PrepareBattlerSpriteForRotScale(spriteId, ST_OAM_OBJ_NORMAL);
        gTasks[taskId].data[10] = 256;
        gMonShrinkDuration = 28;
        gMonShrinkDistance = (gSprites[spriteId].y + gSprites[spriteId].y2) - (sprite->y + sprite->y2);
        gMonShrinkDelta = (gMonShrinkDistance * 256) / gMonShrinkDuration;
        gTasks[taskId].data[2] = gMonShrinkDelta;
        gTasks[taskId].data[0]++;
        break;
    case 1:
        gTasks[taskId].data[10] += 0x20;
        SetSpriteRotScale(spriteId, gTasks[taskId].data[10], gTasks[taskId].data[10], 0);
        gTasks[taskId].data[3] += gTasks[taskId].data[2];
        gSprites[spriteId].y2 = -gTasks[taskId].data[3] >> 8;
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
            sprite->callback = SpriteCB_ThrowBall_InitialFall;
        }
        break;
    }
}

static void SpriteCB_ThrowBall_InitialFall(struct Sprite *sprite)
{
    int angle;

    if (sprite->animEnded)
    {
        sprite->data[3] = 0;
        sprite->data[4] = 40;
        sprite->data[5] = 0;
        angle = 0;
        sprite->y += Cos(angle, 40);
        sprite->y2 = -Cos(angle, sprite->data[4]);
        sprite->callback = SpriteCB_ThrowBall_Bounce;
    }
}

static void SpriteCB_ThrowBall_Bounce(struct Sprite *sprite)
{
    bool8 lastBounce;
    int bounceCount;

    lastBounce = FALSE;
    switch (sprite->data[3] & 0xFF)
    {
    case 0:
        sprite->y2 = -Cos(sprite->data[5], sprite->data[4]);
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
                PlaySE(SE_BALL_BOUNCE_1);
                break;
            case 2:
                PlaySE(SE_BALL_BOUNCE_2);
                break;
            case 3:
                PlaySE(SE_BALL_BOUNCE_3);
                break;
            default:
                PlaySE(SE_BALL_BOUNCE_4);
                break;
            }
        }
        break;
    case 1:
        sprite->y2 = -Cos(sprite->data[5], sprite->data[4]);
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
        sprite->y += Cos(64, 40);
        sprite->y2 = 0;
        if (gBattleSpritesDataPtr->animationData->ballThrowCaseId == BALL_NO_SHAKES)
        {
            sprite->data[5] = 0;
            sprite->callback = SpriteCB_ThrowBall_DelayThenBreakOut;
        }
        else
        {
            sprite->callback = SpriteCB_ThrowBall_InitShake;
            sprite->data[4] = 1;
            sprite->data[5] = 0;
        }
    }
}

static void SpriteCB_ThrowBall_InitShake(struct Sprite *sprite)
{
    if (++sprite->data[3] == 31)
    {
        sprite->data[3] = 0;
        sprite->affineAnimPaused = TRUE;
        StartSpriteAffineAnim(sprite, 1);
        gBattleSpritesDataPtr->animationData->ballSubpx = 0;
        sprite->callback = SpriteCB_ThrowBall_DoShake;
        PlaySE(SE_BALL);
    }
}

static void SpriteCB_ThrowBall_DoShake(struct Sprite *sprite)
{
    s8 state;
    u16 var0;

    switch (sprite->data[3] & 0xFF)
    {
    case 0:
        if (gBattleSpritesDataPtr->animationData->ballSubpx > 0xFF)
        {
            sprite->x2 += sprite->data[4];
            gBattleSpritesDataPtr->animationData->ballSubpx &= 0xFF;
        }
        else
        {
            gBattleSpritesDataPtr->animationData->ballSubpx += 0xB0;
        }

        sprite->data[5]++;
        sprite->affineAnimPaused = FALSE;
        var0 = sprite->data[5] + 7;
        if (var0 > 14)
        {
            gBattleSpritesDataPtr->animationData->ballSubpx = 0;
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
        if (gBattleSpritesDataPtr->animationData->ballSubpx > 0xFF)
        {
            sprite->x2 += sprite->data[4];
            gBattleSpritesDataPtr->animationData->ballSubpx &= 0xFF;
        }
        else
        {
            gBattleSpritesDataPtr->animationData->ballSubpx += 0xB0;
        }

        sprite->data[5]++;
        sprite->affineAnimPaused = FALSE;
        var0 = sprite->data[5] + 12;
        if (var0 > 24)
        {
            gBattleSpritesDataPtr->animationData->ballSubpx = 0;
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
        if (gBattleSpritesDataPtr->animationData->ballSubpx > 0xFF)
        {
            sprite->x2 += sprite->data[4];
            gBattleSpritesDataPtr->animationData->ballSubpx &= 0xFF;
        }
        else
        {
            gBattleSpritesDataPtr->animationData->ballSubpx += 0xB0;
        }

        sprite->data[5]++;
        sprite->affineAnimPaused = FALSE;
        var0 = sprite->data[5] + 4;
        if (var0 > 8)
        {
            gBattleSpritesDataPtr->animationData->ballSubpx = 0;
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
            sprite->callback = SpriteCB_ThrowBall_DelayThenBreakOut;
        }
        else
        {
            if (gBattleSpritesDataPtr->animationData->ballThrowCaseId == BALL_3_SHAKES_SUCCESS && state == 3)
            {
                sprite->callback = SpriteCB_ThrowBall_InitClick;
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

            PlaySE(SE_BALL);
        }
        break;
    }
}

static void SpriteCB_ThrowBall_DelayThenBreakOut(struct Sprite *sprite)
{
    if (++sprite->data[5] == 31)
    {
        sprite->data[5] = 0;
        sprite->callback = SpriteCB_ThrowBall_BeginBreakOut;
    }
}

static void SpriteCB_ThrowBall_InitClick(struct Sprite *sprite)
{
    sprite->animPaused = TRUE;
    sprite->callback = SpriteCB_ThrowBall_DoClick;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    sprite->data[5] = 0;
}

static void SpriteCB_ThrowBall_DoClick(struct Sprite *sprite)
{
    u8 *battler = &gBattleAnimTarget;

    sprite->data[4]++;
    if (sprite->data[4] == 40)
    {
        PlaySE(SE_BALL_CLICK);
        BlendPalettes(0x10000 << sprite->oam.paletteNum, 6, RGB_BLACK);
        CreateStarsWhenBallClicks(sprite);
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
        PlaySE(MUS_CAUGHT_INTRO);
    }
    else if (sprite->data[4] == 315)
    {
        FreeOamMatrix(gSprites[gBattlerSpriteIds[*battler]].oam.matrixNum);
        DestroySprite(&gSprites[gBattlerSpriteIds[*battler]]);
        sprite->data[0] = 0;
        sprite->callback = SpriteCB_ThrowBall_FinishClick;
    }
}

static void SpriteCB_ThrowBall_FinishClick(struct Sprite *sprite)
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
            sprite->callback = BattleAnimObj_SignalEnd;
        }
        break;
    }
}

static void BattleAnimObj_SignalEnd(struct Sprite *sprite)
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

static void CreateStarsWhenBallClicks(struct Sprite *sprite)
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

    LoadBallParticleGfx(BALL_MASTER);
    for (i = 0; i < 3; i++)
    {
        u8 spriteId = CreateSprite(&sBallParticlesSpriteTemplates[BALL_MASTER], sprite->x, sprite->y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].sTransl_Speed = 24;
            gSprites[spriteId].sTransl_DestX = sprite->x + sCaptureStar[i].xOffset;
            gSprites[spriteId].sTransl_DestY = sprite->y + sCaptureStar[i].yOffset;
            gSprites[spriteId].sTransl_ArcAmpl = sCaptureStar[i].amplitude;
            InitAnimArcTranslation(&gSprites[spriteId]);
            gSprites[spriteId].callback = SpriteCB_BallCaptureSuccessStar;
            StartSpriteAnim(&gSprites[spriteId], sBallParticleAnimNums[BALL_MASTER]);
        }
    }
}

static void SpriteCB_BallCaptureSuccessStar(struct Sprite *sprite)
{
    sprite->invisible = !sprite->invisible;
    if (TranslateAnimHorizontalArc(sprite))
        DestroySprite(sprite);
}

static void SpriteCB_ThrowBall_BeginBreakOut(struct Sprite *sprite)
{
    u8 ballId;

    StartSpriteAnim(sprite, 1);
    StartSpriteAffineAnim(sprite, 0);
    sprite->callback = SpriteCB_ThrowBall_RunBreakOut;
    ballId = ItemIdToBallId(gLastUsedItem);
    switch (ballId)
    {
    case 0 ... POKEBALL_COUNT - 1:
        AnimateBallOpenParticles(sprite->x, sprite->y - 5, 1, 28, ballId);
        LaunchBallFadeMonTask(1, gBattleAnimTarget, 14, ballId);
        break;
    }

    gSprites[gBattlerSpriteIds[gBattleAnimTarget]].invisible = FALSE;
    StartSpriteAffineAnim(&gSprites[gBattlerSpriteIds[gBattleAnimTarget]], 1);
    AnimateSprite(&gSprites[gBattlerSpriteIds[gBattleAnimTarget]]);
    gSprites[gBattlerSpriteIds[gBattleAnimTarget]].data[1] = 0x1000;
}

static void SpriteCB_ThrowBall_RunBreakOut(struct Sprite *sprite)
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
        gSprites[gBattlerSpriteIds[gBattleAnimTarget]].y2 = gSprites[gBattlerSpriteIds[gBattleAnimTarget]].data[1] >> 8;
    }

    if (sprite->animEnded && next)
    {
        gSprites[gBattlerSpriteIds[gBattleAnimTarget]].y2 = 0;
        gSprites[gBattlerSpriteIds[gBattleAnimTarget]].invisible = gBattleSpritesDataPtr->animationData->wildMonInvisible;
        sprite->data[0] = 0;
        sprite->callback = BattleAnimObj_SignalEnd;
        gDoingBattleAnim = FALSE;
        UpdateOamPriorityInAllHealthboxes(1);
    }
}

static void TrainerBallBlock(struct Sprite *sprite)
{
    int i;

    sprite->x += sprite->x2;
    sprite->y += sprite->y2;
    sprite->x2 = sprite->y2 = 0;
    for (i = 0; i < 6; i++)
        sprite->data[i] = 0;

    sprite->callback = TrainerBallBlock2;
}

static void TrainerBallBlock2(struct Sprite *sprite)
{
    s16 var0 = sprite->data[0] + 0x800;
    s16 var1 = sprite->data[1] + 0x680;
    
    sprite->x2 -= var1 >> 8;
    sprite->y2 += var0 >> 8;
    sprite->data[0] = (sprite->data[0] + 0x800) & 0xFF;
    sprite->data[1] = (sprite->data[1] + 0x680) & 0xFF;
    if (sprite->y + sprite->y2 > 160
     || sprite->x + sprite->x2 < -8)
    {
        sprite->data[0] = 0;
        sprite->callback = BattleAnimObj_SignalEnd;
        gDoingBattleAnim = FALSE;
        UpdateOamPriorityInAllHealthboxes(1);
    }
}

static void GhostBallDodge(struct Sprite *sprite)
{
    sprite->x += sprite->x2;
    sprite->y += sprite->y2;
    sprite->x2 = sprite->y2 = 0;
    sprite->data[0] = 0x22;
    sprite->data[1] = sprite->x;
    sprite->data[2] = sprite->x - 8;
    sprite->data[3] = sprite->y;
    sprite->data[4] = 0x90;
    sprite->data[5] = 0x20;
    InitAnimArcTranslation(sprite);
    TranslateAnimVerticalArc(sprite);
    sprite->callback = GhostBallDodge2;
}

static void GhostBallDodge2(struct Sprite *sprite)
{
    if (!TranslateAnimVerticalArc(sprite))
    {
        if ((sprite->y + sprite->y2) < 65)
            return;
    }
    
    sprite->data[0] = 0;
    sprite->callback = BattleAnimObj_SignalEnd;
    gDoingBattleAnim = FALSE;
    UpdateOamPriorityInAllHealthboxes(1);
}

static void LoadBallParticleGfx(u8 ballId)
{
    if (GetSpriteTileStartByTag(gBallParticleSpritesheets[ballId].tag) == 0xFFFF)
    {
        LoadCompressedSpriteSheetUsingHeap(&gBallParticleSpritesheets[ballId]);
        LoadCompressedSpritePaletteUsingHeap(&gBallParticlePalettes[ballId]);
    }
}

u8 AnimateBallOpenParticles(u8 x, u8 y, u8 priority, u8 subpriority, u8 ballId)
{
    u8 taskId;

    LoadBallParticleGfx(ballId);
    taskId = CreateTask(sBallParticleAnimationFuncs[ballId], 5);
    gTasks[taskId].data[1] = x;
    gTasks[taskId].data[2] = y;
    gTasks[taskId].data[3] = priority;
    gTasks[taskId].data[4] = subpriority;
    gTasks[taskId].data[15] = ballId;
    PlaySE(SE_BALL_OPEN);
    return taskId;
}

static void IncrementBattleParticleCounter(void)
{
    if (gMain.inBattle)
        gBattleSpritesDataPtr->animationData->numBallParticles++;
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

        spriteId = CreateSprite(&sBallParticlesSpriteTemplates[ballId], x, y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            IncrementBattleParticleCounter();
            StartSpriteAnim(&gSprites[spriteId], sBallParticleAnimNums[ballId]);
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
    sprite->x2 = Sin(sprite->data[0], sprite->data[1]);
    sprite->y2 = Cos(sprite->data[0], sprite->data[1]);
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
        spriteId = CreateSprite(&sBallParticlesSpriteTemplates[ballId], x, y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            IncrementBattleParticleCounter();
            StartSpriteAnim(&gSprites[spriteId], sBallParticleAnimNums[ballId]);
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
        spriteId = CreateSprite(&sBallParticlesSpriteTemplates[ballId], x, y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            IncrementBattleParticleCounter();
            StartSpriteAnim(&gSprites[spriteId], sBallParticleAnimNums[ballId]);
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
        spriteId = CreateSprite(&sBallParticlesSpriteTemplates[ballId], x, y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            IncrementBattleParticleCounter();
            StartSpriteAnim(&gSprites[spriteId], sBallParticleAnimNums[ballId]);
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
        spriteId = CreateSprite(&sBallParticlesSpriteTemplates[ballId], x, y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            IncrementBattleParticleCounter();
            StartSpriteAnim(&gSprites[spriteId], sBallParticleAnimNums[ballId]);
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
            spriteId = CreateSprite(&sBallParticlesSpriteTemplates[ballId], x, y, subpriority);
            if (spriteId != MAX_SPRITES)
            {
                IncrementBattleParticleCounter();
                StartSpriteAnim(&gSprites[spriteId], sBallParticleAnimNums[ballId]);
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
    sprite->x2 = Sin(sprite->data[0], sprite->data[1]);
    sprite->y2 = Cos(sprite->data[0], sprite->data[2]);
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
        spriteId = CreateSprite(&sBallParticlesSpriteTemplates[ballId], x, y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            IncrementBattleParticleCounter();
            StartSpriteAnim(&gSprites[spriteId], sBallParticleAnimNums[ballId]);
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
    sprite->x2 = Sin(sprite->data[0], sprite->data[1]);
    sprite->y2 = Cos(sprite->data[0], Sin(sprite->data[0], sprite->data[2]));
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
            spriteId = CreateSprite(&sBallParticlesSpriteTemplates[ballId], x, y, subpriority);
            if (spriteId != MAX_SPRITES)
            {
                IncrementBattleParticleCounter();
                StartSpriteAnim(&gSprites[spriteId], sBallParticleAnimNums[ballId]);
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
        spriteId = CreateSprite(&sBallParticlesSpriteTemplates[ballId], x, y, subpriority);
        if (spriteId != MAX_SPRITES)
        {
            IncrementBattleParticleCounter();
            StartSpriteAnim(&gSprites[spriteId], sBallParticleAnimNums[ballId]);
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
    sprite->x2 = Sin(sprite->data[0], sprite->data[1]);
    sprite->y2 = Cos(sprite->data[0], Sin(sprite->data[0] & 0x3F, sprite->data[2]));
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
        gBattleSpritesDataPtr->animationData->numBallParticles--;
        if (gBattleSpritesDataPtr->animationData->numBallParticles == 0)
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

    taskId = CreateTask(Task_FadeMon_ToBallColor, 5);
    gTasks[taskId].data[15] = ballId;
    gTasks[taskId].data[3] = battler;
    gTasks[taskId].data[10] = selectedPalettes;
    gTasks[taskId].data[11] = selectedPalettes >> 16;

    if (!unfadeLater)
    {
        BlendPalette(OBJ_PLTT_ID(battler), 16, 0, sBallOpenFadeColors[ballId]);
        gTasks[taskId].data[1] = 1;
    }
    else
    {
        BlendPalette(OBJ_PLTT_ID(battler), 16, 16, sBallOpenFadeColors[ballId]);
        gTasks[taskId].data[0] = 16;
        gTasks[taskId].data[1] = -1;
        gTasks[taskId].func = Task_FadeMon_ToNormal;
    }

    BeginNormalPaletteFade(selectedPalettes, 0, 0, 16, RGB_WHITE);
    return taskId;
}

static void Task_FadeMon_ToBallColor(u8 taskId)
{
    u8 ballId = gTasks[taskId].data[15];

    if (gTasks[taskId].data[2] <= 16)
    {
        BlendPalette(OBJ_PLTT_ID(gTasks[taskId].data[3]), 16, gTasks[taskId].data[0], sBallOpenFadeColors[ballId]);
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

static void Task_FadeMon_ToNormal(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        u32 selectedPalettes = (u16)gTasks[taskId].data[10] | ((u16)gTasks[taskId].data[11] << 16);
        BeginNormalPaletteFade(selectedPalettes, 0, 16, 0, RGB_WHITE);
        gTasks[taskId].func = Task_FadeMon_ToNormal_Step;
    }
}

static void Task_FadeMon_ToNormal_Step(u8 taskId)
{
    u8 ballId = gTasks[taskId].data[15];

    if (gTasks[taskId].data[2] <= 16)
    {
        BlendPalette(OBJ_PLTT_ID(gTasks[taskId].data[3]), 16, gTasks[taskId].data[0], sBallOpenFadeColors[ballId]);
        gTasks[taskId].data[0] += gTasks[taskId].data[1];
        gTasks[taskId].data[2]++;
    }
    else
    {
        DestroyTask(taskId);
    }
}

void AnimTask_SwapMonSpriteToFromSubstitute(u8 taskId)
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
            gSprites[spriteId].x2 += gTasks[taskId].data[0] >> 8;
        else
            gSprites[spriteId].x2 -= gTasks[taskId].data[0] >> 8;

        gTasks[taskId].data[0] &= 0xFF;
        x = gSprites[spriteId].x + gSprites[spriteId].x2 + 32;
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
            gSprites[spriteId].x2 -= gTasks[taskId].data[0] >> 8;
        else
            gSprites[spriteId].x2 += gTasks[taskId].data[0] >> 8;

        gTasks[taskId].data[0] &= 0xFF;
        if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        {
            if (gSprites[spriteId].x2 <= 0)
            {
                gSprites[spriteId].x2 = 0;
                done = TRUE;
            }
        }
        else
        {
            if (gSprites[spriteId].x2 >= 0)
            {
                gSprites[spriteId].x2 = 0;
                done = TRUE;
            }
        }

        if (done)
            DestroyAnimVisualTask(taskId);

        break;
    }
}

void AnimTask_SubstituteFadeToInvisible(u8 taskId)
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
        RequestDma3Fill(0, (void *)OBJ_VRAM0 + gSprites[spriteId].oam.tileNum * TILE_SIZE_4BPP, 0x800, DMA3_32BIT);
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

void AnimTask_SetTargetToEffectBattler(u8 taskId)
{
    gBattleAnimTarget = gEffectBattler;
    DestroyAnimVisualTask(taskId);
}

void TryShinyAnimation(u8 battler, struct Pokemon *mon)
{
    bool32 isShiny;
    u32 otId, personality;
    u32 shinyValue;
    u8 taskId1, taskId2;

    isShiny = FALSE;
    gBattleSpritesDataPtr->healthBoxesData[battler].triedShinyMonAnim = TRUE;
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

            taskId1 = CreateTask(AnimTask_ShinySparkles, 10);
            taskId2 = CreateTask(AnimTask_ShinySparkles, 10);
            gTasks[taskId1].data[0] = battler;
            gTasks[taskId2].data[0] = battler;
            gTasks[taskId1].data[1] = 0;
            gTasks[taskId2].data[1] = 1;
            return;
        }
    }

    gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim = TRUE;
}

static void AnimTask_ShinySparkles(u8 taskId)
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

    if (gBattleSpritesDataPtr->animationData->numBallParticles)
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
        gSprites[spriteId].callback = SpriteCB_ShinySparkles_1;
    }
    else
    {
        gSprites[spriteId].callback = SpriteCB_ShinySparkles_2;
        gSprites[spriteId].x2 = -32;
        gSprites[spriteId].y2 = 32;
        gSprites[spriteId].invisible = TRUE;
        if (gTasks[taskId].data[11] == FALSE)
        {
            if (GetBattlerSide(battler) == B_SIDE_PLAYER)
                pan = SOUND_PAN_ATTACKER;
            else
                pan = SOUND_PAN_TARGET;

            PlaySE12WithPanning(SE_SHINY, pan);
        }
    }

    gSprites[spriteId].data[0] = taskId;
    gTasks[taskId].data[11]++;
    if (spriteId != MAX_SPRITES)
        gTasks[taskId].data[12]++;

    if (gTasks[taskId].data[11] == 5)
        gTasks[taskId].func = AnimTask_ShinySparkles_WaitSparkles;
}

static void AnimTask_ShinySparkles_WaitSparkles(u8 taskId)
{
    u8 battler;

    if (gTasks[taskId].data[12] == FALSE)
    {
        if (gTasks[taskId].data[1] == TRUE)
        {
            battler = gTasks[taskId].data[0];
            gBattleSpritesDataPtr->healthBoxesData[battler].finishedShinyMonAnim = TRUE;
        }

        DestroyTask(taskId);
    }
}

static void SpriteCB_ShinySparkles_1(struct Sprite *sprite)
{
    sprite->x2 = Sin(sprite->data[1], 24);
    sprite->y2 = Cos(sprite->data[1], 24);
    sprite->data[1] += 12;
    if (sprite->data[1] > 0xFF)
    {
        gTasks[sprite->data[0]].data[12]--;
        FreeSpriteOamMatrix(sprite);
        DestroySprite(sprite);
    }
}

static void SpriteCB_ShinySparkles_2(struct Sprite *sprite)
{
    if (sprite->data[1] < 4)
    {
        sprite->data[1]++;
    }
    else
    {
        sprite->invisible = FALSE;
        sprite->x2 += 5;
        sprite->y2 -= 5;
        if (sprite->x2 > 32)
        {
            gTasks[sprite->data[0]].data[12]--;
            FreeSpriteOamMatrix(sprite);
            DestroySprite(sprite);
        }
    }
}

void AnimTask_LoadBaitGfx(u8 taskId)
{
    u8 paletteIndex;

    LoadCompressedSpriteSheetUsingHeap(&gBattleAnimPicTable[ANIM_TAG_SAFARI_BAIT - ANIM_SPRITES_START]);
    LoadCompressedSpritePaletteUsingHeap(&gBattleAnimPaletteTable[ANIM_TAG_SAFARI_BAIT - ANIM_SPRITES_START]);
    paletteIndex = IndexOfSpritePaletteTag(ANIM_TAG_SAFARI_BAIT);
    DestroyAnimVisualTask(taskId);
}

void AnimTask_FreeBaitGfx(u8 taskId)
{
    FreeSpriteTilesByTag(ANIM_TAG_SAFARI_BAIT);
    FreeSpritePaletteByTag(ANIM_TAG_SAFARI_BAIT);
    DestroyAnimVisualTask(taskId);
}

static void SpriteCB_SafariBaitOrRock_Init(struct Sprite *sprite)
{
    InitSpritePosToAnimAttacker(sprite, 0);
    sprite->sTransl_Speed = 30;
    sprite->sTransl_DestX = GetBattlerSpriteCoord(GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), BATTLER_COORD_X) + gBattleAnimArgs[2];
    sprite->sTransl_DestY = GetBattlerSpriteCoord(GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT), BATTLER_COORD_Y) + gBattleAnimArgs[3];
    sprite->sTransl_ArcAmpl = -32;
    InitAnimArcTranslation(sprite);
    gSprites[gBattlerSpriteIds[gBattleAnimAttacker]].callback = SpriteCB_PlayerThrowInit;
    sprite->callback = SpriteCB_SafariBaitOrRock_WaitPlayerThrow;
}

static void SpriteCB_SafariBaitOrRock_WaitPlayerThrow(struct Sprite *sprite)
{
    if (gSprites[gBattlerSpriteIds[gBattleAnimAttacker]].animCmdIndex == 1)
        sprite->callback = SpriteCB_SafariBaitOrRock_ArcFlight;
}

static void SpriteCB_SafariBaitOrRock_ArcFlight(struct Sprite *sprite)
{
    if (TranslateAnimHorizontalArc(sprite))
    {
        sprite->data[0] = 0;
        sprite->invisible = TRUE;
        sprite->callback = SpriteCB_SafariBaitOrRock_Finish;
    }
}

static void SpriteCB_SafariBaitOrRock_Finish(struct Sprite *sprite)
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

void AnimTask_SafariOrGhost_DecideAnimSides(u8 taskId)
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

void AnimTask_SafariGetReaction(u8 taskId)
{
    if (gBattleCommunication[MULTISTRING_CHOOSER] >= NUM_SAFARI_REACTIONS)
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
