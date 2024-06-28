#ifndef GUARD_BATTLE_ANIM_H
#define GUARD_BATTLE_ANIM_H

#include "battle.h"
#include "data.h"
#include "task.h"
#include "constants/battle_anim.h"

enum
{
    ANIM_TYPE_GENERAL,
    ANIM_TYPE_MOVE,
    ANIM_TYPE_STATUS,
    ANIM_TYPE_SPECIAL,
};

enum
{
    BG_ANIM_SCREEN_SIZE,
    BG_ANIM_AREA_OVERFLOW_MODE,
    BG_ANIM_MOSAIC,
    BG_ANIM_CHAR_BASE_BLOCK,
    BG_ANIM_PRIORITY,
    BG_ANIM_PALETTES_MODE,
    BG_ANIM_SCREEN_BASE_BLOCK
};

enum
{
    BATTLER_COORD_X,
    BATTLER_COORD_Y,
    BATTLER_COORD_X_2,
    BATTLER_COORD_Y_PIC_OFFSET,
    BATTLER_COORD_Y_PIC_OFFSET_DEFAULT,
};

enum
{
    BATTLER_COORD_ATTR_HEIGHT,
    BATTLER_COORD_ATTR_WIDTH,
    BATTLER_COORD_ATTR_TOP,
    BATTLER_COORD_ATTR_BOTTOM,
    BATTLER_COORD_ATTR_LEFT,
    BATTLER_COORD_ATTR_RIGHT,
    BATTLER_COORD_ATTR_RAW_BOTTOM,
};

// battle_anim_status_effects.s
#define STAT_ANIM_PLUS1  15
#define STAT_ANIM_PLUS2  39
#define STAT_ANIM_MINUS1 22
#define STAT_ANIM_MINUS2 46
#define STAT_ANIM_MULTIPLE_PLUS1 55
#define STAT_ANIM_MULTIPLE_PLUS2 56
#define STAT_ANIM_MULTIPLE_MINUS1 57
#define STAT_ANIM_MULTIPLE_MINUS2 58

struct BattleAnimBgData
{
    u8 *bgTiles;
    u16 *bgTilemap;
    u8 paletteId;
    u8 bgId;
    u16 tilesOffset;
    u16 unused;
};

struct BattleAnimBackground
{
    const u32 *image;
    const u32 *palette;
    const u32 *tilemap;
};

#define ANIM_ARGS_COUNT 8

// Linear Translation
#define sTransl_Speed    data[0]
#define sTransl_Duration data[0] // for Fast
#define sTransl_InitX    data[1]
#define sTransl_DestX    data[2]
#define sTransl_InitY    data[3]
#define sTransl_DestY    data[4]
#define sTransl_ArcAmpl  data[5]

extern void (*gAnimScriptCallback)(void);
extern bool8 gAnimScriptActive;
extern u8 gAnimVisualTaskCount;
extern u8 gAnimSoundTaskCount;
extern struct DisableStruct *gAnimDisableStructPtr;
extern u16 gAnimMovePower;
extern u8 gAnimFriendship;
extern u16 gWeatherMoveAnim;
extern s16 gBattleAnimArgs[ANIM_ARGS_COUNT];
extern u8 gAnimMoveTurn;
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;
extern u8 gBattlerSpriteIds[MAX_BATTLERS_COUNT];
extern s32 gAnimMoveDmg;
extern u16 gAnimBattlerSpecies[MAX_BATTLERS_COUNT];
extern u8 gAnimCustomPanning;
extern u16 gAnimMoveIndex;


extern const union AnimCmd *const gAnims_SpinningSparkle[];

// battle_anim_ground.c
void AnimTask_HorizontalShake(u8 taskId);
void AnimMudSportDirt(struct Sprite *sprite);
void AnimDirtScatter(struct Sprite *sprite);
void AnimMudSportDirtRising(struct Sprite *sprite);
void AnimDirtPlumeParticle(struct Sprite *);
extern const union AffineAnimCmd *const gAffineAnims_SpinningBone[];

// battle_anim_throw.c
bool32 IsCriticalCapture(void);

// battle_anim_effects_1.c
void AnimFalseSwipeSlice_Step3(struct Sprite *);
void SetSpriteNextToMonHead(u8 battler, struct Sprite *sprite);
void AnimMoveTwisterParticle(struct Sprite *sprite);
void AnimParticleBurst(struct Sprite *);
void AnimPowerAbsorptionOrb(struct Sprite *sprite);
void AnimNeedleArmSpike(struct Sprite *);
void AnimTask_CompressTargetHorizontally(u8 taskId);
void AnimSporeParticle(struct Sprite *sprite);
void AnimAbsorptionOrb(struct Sprite *sprite);
void AnimPetalDanceSmallFlower(struct Sprite *sprite);
void AnimPetalDanceBigFlower(struct Sprite *sprite);
void AnimEndureEnergy(struct Sprite *sprite);
void AnimMimicOrb(struct Sprite *sprite);
void AnimSolarBeamBigOrb(struct Sprite *sprite);
void AnimHyperBeamOrb(struct Sprite *sprite);
void AnimNeedleArmSpike_Step(struct Sprite *sprite);
void AnimMovePowderParticle(struct Sprite *sprite);
void AnimMetronomeFinger(struct Sprite *sprite);
void AnimConversion(struct Sprite *sprite);
void AnimCuttingSlice(struct Sprite *sprite);
void AnimThoughtBubble(struct Sprite *sprite);
void AnimTranslateLinearSingleSineWave(struct Sprite *sprite);
void AnimGrantingStars(struct Sprite *sprite);
void AnimFollowMeFinger(struct Sprite *sprite);
extern const union AnimCmd *const gRazorLeafParticleAnimTable[];
extern const union AnimCmd *const gPowerAbsorptionOrbAnimTable[];
extern const union AffineAnimCmd *const gPowerAbsorptionOrbAffineAnimTable[];
extern const union AnimCmd *const gMusicNotesAnimTable[];
extern const union AffineAnimCmd *const gMimicOrbAffineAnimTable[];
extern const union AnimCmd *const gSolarBeamBigOrbAnimTable[];
extern const union AnimCmd *const gPowderParticlesAnimTable[];
extern const union AffineAnimCmd *const gMetronomeFingerAffineAnimTable[];
extern const union AnimCmd *const gPetalDanceBigFlowerAnimTable[];
extern const union AnimCmd *const gOctazookaAnimTable[];
extern const union AffineAnimCmd *const gAbsorptionOrbAffineAnimTable[];
extern const union AnimCmd *const gGrantingStarsAnimTable[];
extern const union AnimCmd *const gSporeParticleAnimTable[];
extern const union AnimCmd *const gHealingBlueStarAnimTable[];
extern const union AnimCmd *const gMoonlightSparkleAnimTable[];
extern const union AnimCmd *const gEndureEnergyAnimTable[];
extern const union AnimCmd *const gPetalDanceSmallFlowerAnimTable[];
extern const union AnimCmd *const gConversionAnimTable[];
extern const union AffineAnimCmd *const gConversionAffineAnimTable[];
extern const union AnimCmd *const gCuttingSliceAnimTable[];
extern const union AnimCmd *const gScratchAnimTable[];
extern const union AnimCmd *const gIngrainRootAnimTable[];
extern const union AffineAnimCmd *const gSwiftStarAffineAnimTable[];
extern const union AnimCmd *const gMetronomeThroughtBubbleAnimTable[];
extern const union AffineAnimCmd *const gStockpileAbsorptionOrbAffineAnimTable[];
extern const union AnimCmd *const gSlashSliceAnimTable[];
extern const union AffineAnimCmd* const sSpriteAffineAnimTable_HydroCannonBall[];
extern const union AffineAnimCmd sSpriteAffineAnim_HydroCannonBall[];

// battle_anim_effects_2.c
void AnimUproarRing(struct Sprite *sprite);
void AnimSonicBoomProjectile(struct Sprite *sprite);
void AnimOrbitFast(struct Sprite *sprite);
void AnimOrbitScatter(struct Sprite *sprite);
void AnimAngerMark(struct Sprite *sprite);
void AnimHyperVoiceRing(struct Sprite *sprite);
void AnimMagentaHeart(struct Sprite *);
void AnimFlyUpTarget(struct Sprite *sprite);
extern const union AffineAnimCmd *const gThinRingShrinkingAffineAnimTable[];
extern const union AffineAnimCmd *const gThinRingExpandingAffineAnimTable[];
extern const union AnimCmd *const gExplosionAnimTable[];
extern const union AffineAnimCmd *const gGuardRingAffineAnimTable[];
extern const union AffineAnimCmd *const gAngerMarkAffineAnimTable[];
extern const union AffineAnimCmd *const gWaterPulseRingAffineAnimTable[];
extern const union AffineAnimCmd *const gHyperVoiceRingAffineAnimTable[];
extern const union AnimCmd *const gCoinAnimTable[];
extern const union AffineAnimCmd *const gHiddenPowerOrbAffineAnimTable[];
extern const union AffineAnimCmd *const gBulletSeedAffineAnimTable[];

// battle_anim_effects_3.c
void AnimKnockOffStrike_Step(struct Sprite *sprite);
void AnimBlackSmoke(struct Sprite *sprite);
void AnimSweetScentPetal(struct Sprite *sprite);
void AnimTealAlert(struct Sprite *sprite);
void AnimBlockX(struct Sprite *sprite);
void AnimFlatterSpotlight_Step(struct Sprite *sprite);
void AnimAssistPawprint(struct Sprite *);
void AnimReversalOrb(struct Sprite *);
void AnimSmokeBallEscapeCloud(struct Sprite *sprite);
extern const union AnimCmd *const gOpeningEyeAnimTable[];
extern const union AnimCmd *const gEclipsingOrbAnimTable[];
extern const union AffineAnimCmd *const gSpotlightAffineAnimTable[];
extern const union AffineAnimCmd *const gSmokeBallEscapeCloudAffineAnimTable[];
extern const union AffineAnimCmd *const gKnockOffStrikeAffineAnimTable[];
extern const union AnimCmd *const gKnockOffStrikeAnimTable[];

// battle_anim_water.c
void AnimWaterPulseRing(struct Sprite *sprite);
void AnimSmallBubblePair(struct Sprite *sprite);
void AnimWaterPulseBubble(struct Sprite *sprite);
extern const union AnimCmd *const gAnims_WaterBubbleProjectile[];
extern const union AnimCmd *const gAnims_FlamethrowerFlame[];
extern const union AnimCmd *const gAnims_WaterPulseBubble[];

// battle_anim_flying.c
void DestroyAnimSpriteAfterTimer(struct Sprite *sprite);
void AnimAirWaveCrescent(struct Sprite *sprite);
void AnimFlyBallUp(struct Sprite *sprite);
void AnimFlyBallAttack(struct Sprite *sprite);
void AnimFlyBallAttack_Step(struct Sprite *sprite);
void AnimFlyBallUp_Step(struct Sprite *sprite);
void AnimBounceBallLand(struct Sprite *);
void AnimEllipticalGust(struct Sprite *);
extern const union AnimCmd *const gAffineAnims_AirWaveCrescent[];
extern const union AffineAnimCmd *const gAffineAnims_FlyBallUp[];
extern const union AffineAnimCmd *const gAffineAnims_FlyBallAttack[];
extern const union AffineAnimCmd *const gAffineAnims_BounceBallLand[];
extern const union AnimCmd *const gAnims_FallingFeather[];

// battle_anim_poison.c
void AnimSludgeBombHitParticle(struct Sprite *);
void AnimAcidPoisonBubble_Step(struct Sprite *sprite);
void AnimBubbleEffect(struct Sprite *);
extern const union AffineAnimCmd *const gAffineAnims_PoisonProjectile[];
extern const union AnimCmd *const gAnims_PoisonProjectile[];
extern const union AnimCmd *const gAnims_AcidPoisonDroplet[];
extern const union AffineAnimCmd *const gAffineAnims_Bubble[];

// battle_anim_ghost.c
void AnimGhostStatusSprite(struct Sprite *sprite);
void AnimShadowBall(struct Sprite *sprite);
void AnimTask_GrudgeFlames_Step(u8 taskId);
extern const union AffineAnimCmd *const gAffineAnims_ShadowBall[];
extern const union AnimCmd *const gAnims_GrudgeFlame[];

// battle_anim_psychic.c
extern const union AffineAnimCmd *const gAffineAnims_PsychoBoostOrb[];
extern const union AffineAnimCmd *const gAffineAnims_LusterPurgeCircle[];
void AnimPsychoBoost(struct Sprite *sprite);

// battle_anim_smokescreen.c
u8 SmokescreenImpact(s16 x, s16 y, bool8 persist);

extern const struct OamData gOamData_AffineOff_ObjNormal_8x8;
extern const struct OamData gOamData_AffineOff_ObjNormal_16x16;
extern const struct OamData gOamData_AffineOff_ObjNormal_32x32;
extern const struct OamData gOamData_AffineOff_ObjNormal_64x64;
extern const struct OamData gOamData_AffineOff_ObjNormal_16x8;
extern const struct OamData gOamData_AffineOff_ObjNormal_32x8;
extern const struct OamData gOamData_AffineOff_ObjNormal_32x16;
extern const struct OamData gOamData_AffineOff_ObjNormal_64x32;
extern const struct OamData gOamData_AffineOff_ObjNormal_8x16;
extern const struct OamData gOamData_AffineOff_ObjNormal_8x32;
extern const struct OamData gOamData_AffineOff_ObjNormal_16x32;
extern const struct OamData gOamData_AffineOff_ObjNormal_32x64;
extern const struct OamData gOamData_AffineNormal_ObjNormal_8x8;
extern const struct OamData gOamData_AffineNormal_ObjNormal_16x16;
extern const struct OamData gOamData_AffineNormal_ObjNormal_32x32;
extern const struct OamData gOamData_AffineNormal_ObjNormal_64x64;
extern const struct OamData gOamData_AffineNormal_ObjNormal_16x8;
extern const struct OamData gOamData_AffineNormal_ObjNormal_32x8;
extern const struct OamData gOamData_AffineNormal_ObjNormal_32x16;
extern const struct OamData gOamData_AffineNormal_ObjNormal_64x32;
extern const struct OamData gOamData_AffineNormal_ObjNormal_8x16;
extern const struct OamData gOamData_AffineNormal_ObjNormal_8x32;
extern const struct OamData gOamData_AffineNormal_ObjNormal_16x32;
extern const struct OamData gOamData_AffineNormal_ObjNormal_32x64;
extern const struct OamData gOamData_AffineDouble_ObjNormal_8x8;
extern const struct OamData gOamData_AffineDouble_ObjNormal_16x16;
extern const struct OamData gOamData_AffineDouble_ObjNormal_32x32;
extern const struct OamData gOamData_AffineDouble_ObjNormal_64x64;
extern const struct OamData gOamData_AffineDouble_ObjNormal_16x8;
extern const struct OamData gOamData_AffineDouble_ObjNormal_32x8;
extern const struct OamData gOamData_AffineDouble_ObjNormal_32x16;
extern const struct OamData gOamData_AffineDouble_ObjNormal_64x32;
extern const struct OamData gOamData_AffineDouble_ObjNormal_8x16;
extern const struct OamData gOamData_AffineDouble_ObjNormal_8x32;
extern const struct OamData gOamData_AffineDouble_ObjNormal_16x32;
extern const struct OamData gOamData_AffineDouble_ObjNormal_32x64;
extern const struct OamData gOamData_AffineOff_ObjBlend_8x8;
extern const struct OamData gOamData_AffineOff_ObjBlend_16x16;
extern const struct OamData gOamData_AffineOff_ObjBlend_32x32;
extern const struct OamData gOamData_AffineOff_ObjBlend_64x64;
extern const struct OamData gOamData_AffineOff_ObjBlend_16x8;
extern const struct OamData gOamData_AffineOff_ObjBlend_32x8;
extern const struct OamData gOamData_AffineOff_ObjBlend_32x16;
extern const struct OamData gOamData_AffineOff_ObjBlend_64x32;
extern const struct OamData gOamData_AffineOff_ObjBlend_8x16;
extern const struct OamData gOamData_AffineOff_ObjBlend_8x32;
extern const struct OamData gOamData_AffineOff_ObjBlend_16x32;
extern const struct OamData gOamData_AffineOff_ObjBlend_32x64;
extern const struct OamData gOamData_AffineNormal_ObjBlend_8x8;
extern const struct OamData gOamData_AffineNormal_ObjBlend_16x16;
extern const struct OamData gOamData_AffineNormal_ObjBlend_32x32;
extern const struct OamData gOamData_AffineNormal_ObjBlend_64x64;
extern const struct OamData gOamData_AffineNormal_ObjBlend_16x8;
extern const struct OamData gOamData_AffineNormal_ObjBlend_32x8;
extern const struct OamData gOamData_AffineNormal_ObjBlend_32x16;
extern const struct OamData gOamData_AffineNormal_ObjBlend_64x32;
extern const struct OamData gOamData_AffineNormal_ObjBlend_8x16;
extern const struct OamData gOamData_AffineNormal_ObjBlend_8x32;
extern const struct OamData gOamData_AffineNormal_ObjBlend_16x32;
extern const struct OamData gOamData_AffineNormal_ObjBlend_32x64;
extern const struct OamData gOamData_AffineDouble_ObjBlend_8x8;
extern const struct OamData gOamData_AffineDouble_ObjBlend_16x16;
extern const struct OamData gOamData_AffineDouble_ObjBlend_32x32;
extern const struct OamData gOamData_AffineDouble_ObjBlend_64x64;
extern const struct OamData gOamData_AffineDouble_ObjBlend_16x8;
extern const struct OamData gOamData_AffineDouble_ObjBlend_32x8;
extern const struct OamData gOamData_AffineDouble_ObjBlend_32x16;
extern const struct OamData gOamData_AffineDouble_ObjBlend_64x32;
extern const struct OamData gOamData_AffineDouble_ObjBlend_8x16;
extern const struct OamData gOamData_AffineDouble_ObjBlend_8x32;
extern const struct OamData gOamData_AffineDouble_ObjBlend_16x32;
extern const struct OamData gOamData_AffineDouble_ObjBlend_32x64;

extern const struct CompressedSpriteSheet gBattleAnimPicTable[];
extern const struct CompressedSpritePalette gBattleAnimPaletteTable[];

extern const struct SpriteTemplate gFlashingHitSplatSpriteTemplate;
extern const struct SpriteTemplate gBasicHitSplatSpriteTemplate;
extern const struct SpriteTemplate gWaterHitSplatSpriteTemplate;
extern const struct SpriteTemplate gWishStarSpriteTemplate;
extern const struct SpriteTemplate gMiniTwinklingStarSpriteTemplate;
extern const struct SpriteTemplate gThoughtBubbleSpriteTemplate;

extern const union AffineAnimCmd *const gAffineAnims_Bite[];
extern const union AffineAnimCmd *const gAffineAnims_Droplet[];
extern const union AffineAnimCmd *const gGrowingRingAffineAnimTable[];
extern const union AnimCmd *const gAnims_SmallBubblePair[];
extern const union AnimCmd *const gAnims_BasicFire[];
extern const union AnimCmd *const gAnims_WaterMudOrb[];
extern const union AnimCmd *const gAnims_WaterBubble[];

// battle_anim_normal.c
extern const union AffineAnimCmd *const gAffineAnims_HitSplat[];
void AnimHitSplatBasic(struct Sprite *sprite);
void AnimFlashingHitSplat(struct Sprite *sprite);
void AnimFlashingHitSplat_Step(struct Sprite *sprite);
void AnimHitSplatRandom(struct Sprite *sprite);
void AnimCrossImpact(struct Sprite *sprite);
void AnimHitSplatOnMonEdge(struct Sprite *sprite);

// battle_anim_electric.c
void AnimThunderWave(struct Sprite *sprite);
void AnimGrowingChargeOrb(struct Sprite *sprite);
void AnimZapCannonSpark(struct Sprite *sprite);
void AnimSparkElectricity(struct Sprite *sprite);
void AnimElectricPuff(struct Sprite *sprite);
void AnimSparkElectricityFlashing(struct Sprite *sprite);
void AnimGrowingShockWaveOrb(struct Sprite *sprite);
void AnimElectricity(struct Sprite *);
extern const union AffineAnimCmd *const gAffineAnims_GrowingElectricOrb[];
extern const union AffineAnimCmd *const gAffineAnims_FlashingSpark[];
extern const union AnimCmd *const gAnims_ThunderboltOrb[];
extern const union AnimCmd *const gAnims_ElectricPuff[];
extern const union AnimCmd *const gAnims_ElectricChargingParticles[];

// battle_anim_fight.c
void AnimStompFoot(struct Sprite *sprite);
void AnimSpinningKickOrPunch(struct Sprite *sprite);
void AnimBrickBreakWall_Step(struct Sprite *sprite);
void AnimJumpKick(struct Sprite *sprite);
void AnimBasicFistOrFoot(struct Sprite *sprite);
void AnimSpinningKickOrPunchFinish(struct Sprite *sprite);
void AnimRevengeScratch(struct Sprite *sprite);
void AnimDizzyPunchDuck(struct Sprite *sprite);
void AnimSuperpowerFireball(struct Sprite *);
extern const union AnimCmd *const gAnims_HandsAndFeet[];
extern const union AffineAnimCmd *const gAffineAnims_MegaPunchKick[];
extern const union AffineAnimCmd *const gAffineAnims_SpinningHandOrFoot[];
extern const union AnimCmd *const gAnims_RevengeBigScratch[];

// battle_anim_rock.c
extern const union AnimCmd *const gAnims_FlyingRock[];
extern const union AffineAnimCmd *const gAffineAnims_Whirlpool[];
extern const union AffineAnimCmd *const gAffineAnims_BasicRock[];
void AnimParticleInVortex(struct Sprite *sprite);
void AnimFallingRock(struct Sprite *sprite);
void AnimRaiseSprite(struct Sprite *sprite);
void AnimFallingRock_Step(struct Sprite *sprite);
void AnimFlyingSandCrescent(struct Sprite *sprite);
void AnimRockFragment(struct Sprite *);
void AnimRockBlastRock(struct Sprite *sprite);

// battle_anim_dark.c
void AnimClawSlash(struct Sprite *sprite);
void AnimTearDrop(struct Sprite *sprite);
void AnimBite(struct Sprite *sprite);
extern const union AnimCmd *const gAnims_ClawSlash[];
extern const union AffineAnimCmd *const gAffineAnims_TearDrop[];

// battle_anim_bug.c
void AnimStringWrap_Step(struct Sprite *sprite);
void AnimMissileArc(struct Sprite *sprite);
void AnimSpiderWeb(struct Sprite *sprite);
void AnimMissileArc_Step(struct Sprite *sprite);

// battle_anim_ice.c
void AnimThrowMistBall(struct Sprite *sprite);
void AnimMoveParticleBeyondTarget(struct Sprite *sprite);
void AnimIceEffectParticle(struct Sprite *sprite);
void AnimSwirlingSnowball_Step1(struct Sprite *sprite);
extern const union AnimCmd *const gAnims_Snowball[];
extern const union AffineAnimCmd *const gAffineAnims_IceCrystalHit[];
extern const union AnimCmd *const gAnims_IceCrystalLarge[];
extern const union AnimCmd *const gAnims_IceCrystalSmall[];
extern const union AnimCmd *const gAnims_IceBallChunk[];
extern const union AnimCmd *const gAnims_BlizzardIceCrystal[];

// battle_anim_fire.c
void AnimFireSpread(struct Sprite *sprite);
void AnimFireSpiralOutward(struct Sprite *sprite);
void AnimWillOWispOrb(struct Sprite *);
void AnimEruptionFallingRock(struct Sprite *);
void AnimFireCross(struct Sprite *);
void AnimFirePlume(struct Sprite *);
extern const union AnimCmd *const gAnims_FireBlastCross[];
extern const union AnimCmd *const gAnims_WillOWispOrb[];
extern const union AnimCmd *const gAnims_FirePlume[];

// battle_anim_dragon.c
extern const union AnimCmd *const gAnims_DreepyMissilePlayer[];
extern const union AnimCmd *const gAnims_DreepyMissileOpponent[];
extern const union AnimCmd *const gAnims_DreepyMissileOpponentNotDrag[];
extern const union AnimCmd *const gAnims_DragonBreathFire[];
extern const union AnimCmd *const gAnims_DragonRageFirePlume[];
extern const union AffineAnimCmd *const gAffineAnims_DragonRageFire[];
extern const union AnimCmd *const gAnims_DragonRageFire[];
extern const union AffineAnimCmd *const gAffineAnims_DragonBreathFire[];
void AnimDragonRageFirePlume(struct Sprite *sprite);
void AnimDragonFireToTarget(struct Sprite *sprite);
void AnimDragonDanceOrb(struct Sprite *sprite);
void AnimOverheatFlame(struct Sprite *sprite);
void AnimOutrageFlame(struct Sprite *sprite);
void AnimDracoMeteorRock(struct Sprite *sprite);

// battle_anim_new.c
void CoreEnforcerLoadBeamTarget(struct Sprite *sprite);
void SpriteCB_RandomCentredHits(struct Sprite *sprite);
void InitSpritePosToAnimTargetsCentre(struct Sprite *sprite, bool32 respectMonPicOffsets);

//
void MoveBattlerSpriteToBG(u8 battlerId, u8);
void ResetBattleAnimBg(u8);
void ClearBattleAnimationVars(void);
void DoMoveAnim(u16 move);
void LaunchBattleAnimation(u32 animType, u16 animId);
void DestroyAnimSprite(struct Sprite *sprite);
void DestroyAnimVisualTask(u8 taskId);
void DestroyAnimSoundTask(u8 taskId);
u8 GetAnimBattlerId(u8 wantedBattler);
bool8 IsContest(void);
s8 BattleAnimAdjustPanning(s8 pan);
s8 BattleAnimAdjustPanning2(s8 pan);
s16 CalculatePanIncrement(s16 sourcePan, s16 targetPan, s16 incrementPan);
bool8 IsBattlerSpriteVisible(u8 battlerId);
s16 KeepPanInRange(s16 a, s32 oldPan);
void RelocateBattleBgPal(u16 paletteNum, u16 *dest, s32 offset, u8 largeScreen);
void SetAnimBgAttribute(u8 bgId, u8 attributeId, u8 value);
s32 GetAnimBgAttribute(u8 bgId, u8 attributeId);
void HandleIntroSlide(u8 terrain);
void BattleIntroSlideEnd(u8 taskId);
void CopyBattlerSpriteToBg(s32 bgId, u8 x, u8 y, u8 battlerPosition, u8 palno, u8 *tilesDest, u16 *tilemapDest, u16 tilesOffset);
void TryShinyAnimation(u8 battler, struct Pokemon *mon);
u8 ItemIdToBallId(u16 itemId);
u8 AnimateBallOpenParticles(u8 x, u8 y, u8 priority, u8 subpriority, u8 ballId);
u8 LaunchBallFadeMonTask(bool8 unFadeLater, u8 battlerId, u32 arg2, u8 ballId);
void DoLoadHealthboxPalsForLevelUp(u8 *, u8 *, u8 battlerId);
void DoFreeHealthboxPalsForLevelUp(u8 batterId);
void LaunchStatusAnimation(u8 battlerId, u8 statusAnimId);
u8 GetBattlerSpriteCoord(u8 battlerId, u8 coordType);
u8 GetBattlerSpriteCoord2(u8 battlerId, u8 coordType);
u8 GetBattlerSpriteDefault_Y(u8 battlerId);
u8 GetSubstituteSpriteDefault_Y(u8 battlerId);
u8 GetGhostSpriteDefault_Y(u8 battlerId);
u8 GetBattlerYCoordWithElevation(u8 battlerId);
u8 GetAnimBattlerSpriteId(u8 animBattler);
void StoreSpriteCallbackInData6(struct Sprite *sprite, SpriteCallback callback);
void TranslateSpriteInCircle(struct Sprite *sprite);
void TranslateSpriteInGrowingCircle(struct Sprite *sprite);
void TranslateSpriteInEllipse(struct Sprite *sprite);
void WaitAnimForDuration(struct Sprite *sprite);
void ConvertPosDataToTranslateLinearData(struct Sprite *sprite);
void TranslateSpriteLinear(struct Sprite *sprite);
void TranslateSpriteLinearFixedPoint(struct Sprite *sprite);
void TranslateSpriteLinearById(struct Sprite *sprite);
void TranslateSpriteLinearByIdFixedPoint(struct Sprite *sprite);
void TranslateSpriteLinearAndFlicker(struct Sprite *sprite);
void DestroySpriteAndMatrix(struct Sprite *sprite);
void RunStoredCallbackWhenAffineAnimEnds(struct Sprite *sprite);
void RunStoredCallbackWhenAnimEnds(struct Sprite *sprite);
void DestroyAnimSpriteAndDisableBlend(struct Sprite *sprite);
void DestroyAnimVisualTaskAndDisableBlend(u8 taskId);
void SetSpriteCoordsToAnimAttackerCoords(struct Sprite *sprite);
void SetAnimSpriteInitialXOffset(struct Sprite *sprite, s16 xOffset);
void InitAnimArcTranslation(struct Sprite *sprite);
bool8 TranslateAnimHorizontalArc(struct Sprite *sprite);
bool8 TranslateAnimVerticalArc(struct Sprite *sprite);
void SetSpritePrimaryCoordsFromSecondaryCoords(struct Sprite *sprite);
void InitSpritePosToAnimTarget(struct Sprite *sprite, bool8 respectMonPicOffsets);
void InitSpritePosToAnimAttacker(struct Sprite *sprite, bool8 respectMonPicOffsets);
u8 GetBattlerAtPosition(u8 position);
bool8 IsBattlerSpritePresent(u8 battlerId);
bool8 IsDoubleBattle(void);
void GetBattleAnimBg1Data(struct BattleAnimBgData *animBgData);
void GetBattleAnimBgData(struct BattleAnimBgData *animBgData, u32 bgId);
void GetBattleAnimBgDataByPriorityRank(struct BattleAnimBgData *animBgData, u8 unused);
void InitBattleAnimBg(u32 bgId);
void AnimLoadCompressedBgGfx(u32 bgId, const u32 *src, u32 tilesOffset);
void InitAnimBgTilemapBuffer(u32 bgId, const void *src);
void AnimLoadCompressedBgTilemap(u32 bgId, const u32 *src);
u8 GetBattleBgPaletteNum(void);
void ToggleBg3Mode(bool8 arg0);
void Trade_MoveSelectedMonToTarget(struct Sprite *sprite);
void InitSpriteDataForLinearTranslation(struct Sprite *sprite);
void InitAnimLinearTranslation(struct Sprite *sprite);
void StartAnimLinearTranslation(struct Sprite *sprite);
void PlayerThrowBall_StartAnimLinearTranslation(struct Sprite *sprite);
bool8 AnimTranslateLinear(struct Sprite *sprite);
void AnimTranslateLinear_WithFollowup(struct Sprite *sprite);
void InitAnimLinearTranslationWithSpeed(struct Sprite *sprite);
void InitAnimLinearTranslationWithSpeedAndPos(struct Sprite *sprite);
void InitAndRunAnimFastLinearTranslation(struct Sprite *sprite);
bool8 AnimFastTranslateLinear(struct Sprite *sprite);
void InitAnimFastLinearTranslationWithSpeed(struct Sprite *sprite);
void InitAnimFastLinearTranslationWithSpeedAndPos(struct Sprite *sprite);
void SetSpriteRotScale(u8 spriteId, s16 xScale, s16 yScale, u16 rotation);
void PrepareBattlerSpriteForRotScale(u8 spriteId, u8 objMode);
void ResetSpriteRotScale(u8 spriteId);
void SetBattlerSpriteYOffsetFromRotation(u8 spriteId);
void TrySetSpriteRotScale(struct Sprite *sprite, bool8 recalcCenterVector, s16 xScale, s16 yScale, u16 rotation);
void TryResetSpriteAffineState(struct Sprite *sprite);
u16 ArcTan2Neg(s16 a, s16 b);
void SetGreyscaleOrOriginalPalette(u16 paletteNum, bool8 restoreOriginalColor);
u32 GetBattlePalettesMask(bool8 battleBackground, bool8 attacker, bool8 target, bool8 attackerPartner, bool8 targetPartner, bool8 a6, bool8 a7);
u32 GetBattleMonSpritePalettesMask(bool8 playerLeft, bool8 playerRight, bool8 foeLeft, bool8 foeRight);
u8 GetSpritePalIdxByBattler(u8 a1);
void AnimSpriteOnMonPos(struct Sprite *sprite);
void TranslateAnimSpriteToTargetMonLocation(struct Sprite *sprite);
void AnimThrowProjectile(struct Sprite *sprite);
void AnimTravelDiagonally(struct Sprite *sprite);
s16 CloneBattlerSpriteWithBlend(u8 animBattler);
void DestroySpriteWithActiveSheet(struct Sprite *sprite);
void PrepareAffineAnimInTaskData(struct Task *task, u8 spriteId, const union AffineAnimCmd *affineAnimCmds);
bool8 RunAffineAnimFromTaskData(struct Task *task);
void SetBattlerSpriteYOffsetFromYScale(u8 spriteId);
void SetBattlerSpriteYOffsetFromOtherYScale(u8 spriteId, u8 otherSpriteId);
void StorePointerInVars(s16 *lo, s16 *hi, const void *ptr);
void *LoadPointerFromVars(s16 lo, s16 hi);
void BattleAnimHelper_SetSpriteSquashParams(struct Task *task, u8 spriteId, s16 xScale0, s16 yScale0, s16 xScale1, s16 yScale1, u16 duration);
u8 BattleAnimHelper_RunSpriteSquash(struct Task *task);
void InitPrioritiesForVisibleBattlers(void);
u8 GetBattlerSpriteSubpriority(u8 battlerId);
u8 GetBattlerSpriteBGPriority(u8 battlerId);
u8 GetBattlerSpriteBGPriorityRank(u8 battlerId);
u8 CreateAdditionalMonSpriteForMoveAnim(u16 species, bool8 isBackpic, u8 templateId, s16 x, s16 y, u8 subpriority, u32 personality, bool32 isShiny, u32 battlerId);
void DestroySpriteAndFreeResources_(struct Sprite *sprite);
s16 GetBattlerSpriteCoordAttr(u8 battlerId, u8 attr);
void SetAverageBattlerPositions(u8 battlerId, bool8 respectMonPicOffsets, s16 *x, s16 *y);
u8 CreateInvisibleSpriteCopy(s32 battlerId, u8 spriteId, s32 species);
void AnimTranslateLinearAndFlicker_Flipped(struct Sprite *sprite);
void AnimTranslateLinearAndFlicker(struct Sprite *sprite);
void AnimSpinningSparkle(struct Sprite *sprite);
void AnimWeatherBallUp(struct Sprite *sprite);
void AnimWeatherBallDown(struct Sprite *sprite);
u32 UnpackSelectedBattlePalettes(s16 selector);
void InitStatsChangeAnimation(u8 taskId);
void StartMonScrollingBgMask(u8 taskId, s32 unused, u16 arg2, u8 battler1, u8 arg4, u8 arg5, u8 arg6, u8 arg7, const u32 *gfx, const u32 *tilemap, const u32 *palette);
void ClearBattleAnimBg(u32 bgId);
void AnimLoadCompressedBgTilemapHandleContest(struct BattleAnimBgData *, const void *, bool32);

#endif // GUARD_BATTLE_ANIM_H
