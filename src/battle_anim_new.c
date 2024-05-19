#include "global.h"
#include "battle_anim.h"
#include "item_menu_icons.h"
#include "sprite.h"
#include "random.h"
#include "gpu_regs.h"
#include "item.h"
#include "rtc.h"
// #include "item_icon.h"
#include "sound.h"
#include "menu.h"
#include "malloc.h"
#include "util.h"
#include "trig.h"
#include "graphics.h"
#include "battle_scripts.h"
#include "battle_controllers.h"
#include "constants/moves.h"
#include "constants/hold_effects.h"
#include "constants/items.h"
#include "constants/pokemon.h"
#include "battle_util.h"
#include "constants/songs.h"


// function declarations
static void AnimTask_DynamaxGrowthStep(u8 taskId);
static void SpriteCB_PhotonGeyserBeam(struct Sprite *sprite);
static void SpriteCB_BeamUpStep(struct Sprite *sprite);
static void AnimBlastBurnTargetPlume_Step1(struct Sprite *sprite);
static void AnimBlastBurnTargetPlume(struct Sprite *sprite);


// expanding force
static const struct OamData sGeyserOam = {
	.affineMode = ST_OAM_AFFINE_OFF,
	.objMode = ST_OAM_OBJ_NORMAL,
	.shape = SPRITE_SHAPE(32x32),
	.size = SPRITE_SIZE(32x32),
	.priority = 1, //Above sprites
};
//photon geyser
static const union AnimCmd sAnimCmdPhotonGeyserBeam1[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};
static const union AnimCmd sAnimCmdSmiteBeam[] =
{
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END
};
static const union AnimCmd sAnimCmdPhotonGeyserBeam2[] =
{
    ANIMCMD_FRAME(8, 1),
    ANIMCMD_END
};
static const union AnimCmd *const sAnimCmdTable_PhotonGeyserBeam[] =
{
    sAnimCmdPhotonGeyserBeam1,
    sAnimCmdSmiteBeam,
    sAnimCmdPhotonGeyserBeam2,
};
static const union AffineAnimCmd sSpriteAffineAnim_DoNothing[] =
{
    AFFINEANIMCMD_FRAME(0, 0, 0, 1), //Do nothing
    AFFINEANIMCMD_END
};
static const union AffineAnimCmd sSpriteAffineAnim_PhotonGeyserBeam[] =
{
    AFFINEANIMCMD_FRAME(0, 0, 0, 16), //Delay
    AFFINEANIMCMD_FRAME(64, 64, 0, 4), //Double in size
    //Pulsate
    AFFINEANIMCMD_FRAME(-128, -128, 0, 1),
    AFFINEANIMCMD_FRAME(128, 128, 0, 1),
    AFFINEANIMCMD_JUMP(2),
};
static const union AffineAnimCmd* const sSpriteAffineAnimTable_PhotonGeyserBeam[] =
{
    sSpriteAffineAnim_DoNothing,
    sSpriteAffineAnim_PhotonGeyserBeam,
};

const struct SpriteTemplate gPhotonGeyserSparkTemplate =
{
    .tileTag = ANIM_TAG_SPARK_2,
    .paletteTag = ANIM_TAG_SMALL_RED_EYE,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSparkElectricity
};

const struct SpriteTemplate gPhotonGeyserZapCannonSparkTemplate =
{
    .tileTag = ANIM_TAG_SPARK_2,
    .paletteTag = ANIM_TAG_SMALL_RED_EYE,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gAffineAnims_FlashingSpark,
    .callback = AnimZapCannonSpark
};

const struct SpriteTemplate gPhotonGeyserWhiteRingTemplate =
{
    .tileTag = ANIM_TAG_THIN_RING,
    .paletteTag = ANIM_TAG_AIR_WAVE_2,
    .oam = &gOamData_AffineDouble_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gThinRingExpandingAffineAnimTable,
    .callback = AnimUproarRing
};

const struct SpriteTemplate gPhotonGeyserYellowRingTemplate =
{
    .tileTag = ANIM_TAG_THIN_RING,
    .paletteTag = ANIM_TAG_SMALL_EMBER,
    .oam = &gOamData_AffineDouble_ObjBlend_64x64,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gThinRingExpandingAffineAnimTable,
    .callback = AnimUproarRing
};

const struct SpriteTemplate gPhotonGeyserZapBallTemplate =
{
    .tileTag = ANIM_TAG_YELLOW_BALL,
    .paletteTag = ANIM_TAG_YELLOW_BALL,
    .oam = &gOamData_AffineDouble_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = TranslateAnimSpriteToTargetMonLocation
};

//ultra burst
const struct SpriteTemplate gUltraBurstSymbolSpriteTemplate =
{
    .tileTag = ANIM_TAG_ULTRA_BURST_SYMBOL,
    .paletteTag = ANIM_TAG_ULTRA_BURST_SYMBOL,
    .oam = &gOamData_AffineDouble_ObjBlend_32x32,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gAffineAnims_LusterPurgeCircle,
    .callback = AnimSpriteOnMonPos
};
const struct SpriteTemplate gPhotonGeyserBeam =
{
    .tileTag = ANIM_TAG_STRAIGHT_BEAM,
    .paletteTag = ANIM_TAG_STRAIGHT_BEAM,
    .oam = &gOamData_AffineDouble_ObjNormal_16x16,
    .anims = sAnimCmdTable_PhotonGeyserBeam,
    .images = NULL,
    .affineAnims = sSpriteAffineAnimTable_PhotonGeyserBeam,
    .callback = SpriteCB_PhotonGeyserBeam
};

const struct SpriteTemplate gPhotonGeyserChargeTemplate =
{
    .tileTag = ANIM_TAG_SHOCK_3,
    .paletteTag = ANIM_TAG_SMALL_RED_EYE,
    .oam = &gOamData_AffineNormal_ObjNormal_32x32,
    .anims = gAnims_ThunderboltOrb,
    .images = NULL,
    .affineAnims = gAffineAnims_GrowingElectricOrb,
    .callback = AnimGrowingChargeOrb
};

// light that burns the sky
const struct SpriteTemplate gLightThatBurnsTheSkyGreenSparkSpriteTemplate =
{
    .tileTag = ANIM_TAG_SPARK_2,
    .paletteTag = ANIM_TAG_LEAF,
    .oam = &gOamData_AffineNormal_ObjNormal_16x16,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gAffineAnims_FlashingSpark,
    .callback = AnimSparkElectricityFlashing
};
const struct SpriteTemplate gLightThatBurnsTheSkyBlastBurnSpriteTemplate =
{
    .tileTag = ANIM_TAG_FIRE_PLUME,
    .paletteTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .oam = &gOamData_AffineOff_ObjNormal_32x32,
    .anims = gAnims_FirePlume,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimBlastBurnTargetPlume
};
const struct SpriteTemplate gLightThatBurnsTheSkyExplosionSpriteTemplate =
{
    .tileTag = ANIM_TAG_EXPLOSION_2,
    .paletteTag = ANIM_TAG_EXPLOSION_2,
    .oam = &sGeyserOam,
    .anims = gExplosionAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSpriteOnMonPos
};


static void InitSpritePosToGivenTarget(struct Sprite *sprite, u8 target)
{
    sprite->x = GetBattlerSpriteCoord2(target, BATTLER_COORD_X);
    sprite->y = GetBattlerSpriteCoord2(target, BATTLER_COORD_Y);

    SetAnimSpriteInitialXOffset(sprite, gBattleAnimArgs[0]);
    sprite->y2 = gBattleAnimArgs[1];
}

static u8 LoadBattleAnimTarget(u8 arg)
{
    u8 battler;

    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
    {
        switch (gBattleAnimArgs[arg])
        {
        case 0:
            battler = gBattleAnimAttacker;
            break;
        default:
            battler = gBattleAnimTarget;
            break;
        case 2:
            battler = BATTLE_PARTNER(gBattleAnimAttacker);
            break;
        case 3:
            battler = BATTLE_PARTNER(gBattleAnimTarget);
            break;
        }
    }
    else
    {
        if (gBattleAnimArgs[arg] == 0)
            battler = gBattleAnimAttacker;
        else
            battler = gBattleAnimTarget;
    }

    return battler;
}

//Imitates launching a beam of light towards the sky
//arg 0: initial x pixel offset
//arg 1: initial y pixel offset
//arg 2: battler
//arg 3: duration
//arg 4: Anim num
//arg 5: affine anim start delay
static void SpriteCB_PhotonGeyserBeam(struct Sprite *sprite)
{
    u8 target = LoadBattleAnimTarget(2);

    if (!IsBattlerSpriteVisible(target))
        DestroyAnimSprite(sprite);
    else
    {
        InitSpritePosToGivenTarget(sprite, target);
        StartSpriteAnim(sprite, gBattleAnimArgs[4]);
        sprite->data[0] = gBattleAnimArgs[3];
        sprite->data[1] = gBattleAnimArgs[5];
        sprite->callback = SpriteCB_BeamUpStep;
    }
}
//Animates the beam of light
static void SpriteCB_BeamUpStep(struct Sprite *sprite)
{
    if (sprite->data[1]-- == 0)
        StartSpriteAffineAnim(sprite, 1);

    if (sprite->data[0]-- <= 0)
        DestroySpriteAndMatrix(sprite);
}

static void SetSpriteCoordsToAnimTargetCoords(struct Sprite *sprite)
{
    sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_X_2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, BATTLER_COORD_Y_PIC_OFFSET);
}

static void AnimBlastBurnTargetPlume(struct Sprite *sprite)
{
    SetSpriteCoordsToAnimTargetCoords(sprite);
    if (GetBattlerSide(gBattleAnimTarget))
    {
        sprite->x -= gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];
        sprite->data[2] = -gBattleAnimArgs[4];
    }
    else
    {
        sprite->x += gBattleAnimArgs[0];
        sprite->y += gBattleAnimArgs[1];
        sprite->data[2] = gBattleAnimArgs[4];
    }

    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->data[3] = gBattleAnimArgs[5];

    sprite->callback = AnimBlastBurnTargetPlume_Step1;
}
static void AnimBlastBurnTargetPlume_Step1(struct Sprite *sprite)
{
    if (++sprite->data[0] < sprite->data[4])
    {
        sprite->x2 += sprite->data[2];
        sprite->y2 += sprite->data[3];
    }

    if (sprite->data[0] == sprite->data[1])
        DestroySpriteAndMatrix(sprite);
}

// DYNAMAX
static const union AffineAnimCmd sDynamaxGrowthAffineAnimCmds[] = // from CFRU
{
	AFFINEANIMCMD_FRAME(-2, -2, 0, 64), //Double in size over 1 second
	AFFINEANIMCMD_FRAME(0, 0, 0, 64), //Pause for 1 seconds
	AFFINEANIMCMD_FRAME(16, 16, 0, 8), //Shrink back down in 1/8 of a second
	AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sDynamaxGrowthAttackAnimationAffineAnimCmds[] =
{
	AFFINEANIMCMD_FRAME(-4, -4, 0, 32), //Double in size quicker
	AFFINEANIMCMD_FRAME(0, 0, 0, 32), //Pause for less
	AFFINEANIMCMD_FRAME(16, 16, 0, 8),
	AFFINEANIMCMD_END,
};

//Arg 0: Animation for attack
void AnimTask_DynamaxGrowth(u8 taskId) // from CFRU
{
	struct Task* task = &gTasks[taskId];
	u8 spriteId = GetAnimBattlerSpriteId(ANIM_ATTACKER);

	if (gBattleAnimArgs[0] == 0)
		PrepareAffineAnimInTaskData(task, spriteId, sDynamaxGrowthAffineAnimCmds);
	else
		PrepareAffineAnimInTaskData(task, spriteId, sDynamaxGrowthAttackAnimationAffineAnimCmds);
	task->func = AnimTask_DynamaxGrowthStep;
}

static void AnimTask_DynamaxGrowthStep(u8 taskId) // from CFRU
{
	struct Task* task = &gTasks[taskId];
	if (!RunAffineAnimFromTaskData(task))
		DestroyAnimVisualTask(taskId);
}
