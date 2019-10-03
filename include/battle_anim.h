#ifndef GUARD_BATTLE_ANIM_H
#define GUARD_BATTLE_ANIM_H

#include "global.h"

#ifndef BATTLE_BANKS_COUNT
#define BATTLE_BANKS_COUNT 4
#endif // BATTLE_BANKS_COUNT

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

#define PAN_SIDE_PLAYER     -64
#define PAN_SIDE_OPPONENT   63

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
extern u16 gAnimSpeciesByBanks[BATTLE_BANKS_COUNT];
extern u8 gUnknown_02038440;
extern u8 gBattlerSpriteIds[MAX_BATTLERS_COUNT];
extern u16 gAnimMovePower;
extern s32 gAnimMoveDmg;
extern u16 gAnimBattlerSpecies[MAX_BATTLERS_COUNT];
extern u8 gUnknown_2037F24;

void ClearBattleAnimationVars(void);
void DoMoveAnim(u16 move);
void LaunchBattleAnimation(const u8 *const animsTable[], u16 tableId, bool8 isMoveAnim);
void DestroyAnimSprite(struct Sprite *sprite);
void DestroyAnimVisualTask(u8 taskId);
void DestroyAnimSoundTask(u8 taskId);
bool8 IsAnimBankSpriteVisible(u8 bank);
void sub_80A438C(u8 bank, bool8 toBG_2, bool8 setSpriteInvisible);
bool8 IsContest(void);
s8 BattleAnimAdjustPanning(s8 pan);
s8 BattleAnimAdjustPanning2(s8 pan);
s16 sub_80A52EC(s16 a);
s16 CalculatePanIncrement(s16 sourcePan, s16 targetPan, s16 incrementPan);
bool8 IsBattlerSpriteVisible(u8 battlerId);
s16 KeepPanInRange(s16 a, s32 oldPan);
void sub_80730C0(u16, const u16 *, u16 *, u8);

// battle_intro.c
void SetAnimBgAttribute(u8 bgId, u8 attributeId, u8 value);
s32 GetAnimBgAttribute(u8 bgId, u8 attributeId);
void HandleIntroSlide(u8 terrain);
void sub_80BC41C(u8 taskId);
void sub_80BCEF4(s32 bgId, u8 arg1, u8 arg2, u8 battlerPosition, u8 arg4, u8 *arg5, u16 *arg6, u16 tilesOffset);

// battle_anim_special.s
void sub_80F1720(u8 battler, struct Pokemon *mon);

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

u8 GetBattlerSpriteCoord(u8 battlerId, u8 attributeId);

bool8 IsBankSpritePresent(u8 battlerId);
void sub_80A6C68(u8 arg0);
u8 GetAnimBattlerSpriteId(u8 wantedBank);
bool8 IsDoubleBattle(void);
u8 sub_80A6D94(void);
u8 sub_80A8364(u8);
void StoreSpriteCallbackInData6(struct Sprite *sprite, void (*spriteCallback)(struct Sprite *));
void SetSpritePrimaryCoordsFromSecondaryCoords(struct Sprite *sprite);
u8 GetBattlerSpriteDefault_Y(u8 battlerId);
u8 sub_80A82E4(u8 battlerId);
u8 GetSubstituteSpriteDefault_Y(u8 battlerId);
u8 GetGhostSpriteDefault_Y(u8 battlerId);
void sub_8072E48(u8 battlerId, u8);
void sub_8073128(u8);

// battle_anim_status_effects.s
#define STAT_ANIM_PLUS1  15
#define STAT_ANIM_PLUS2  39
#define STAT_ANIM_MINUS1 22
#define STAT_ANIM_MINUS2 46
#define STAT_ANIM_MULTIPLE_PLUS1 55
#define STAT_ANIM_MULTIPLE_PLUS2 56
#define STAT_ANIM_MULTIPLE_MINUS1 57
#define STAT_ANIM_MULTIPLE_MINUS2 58
void LaunchStatusAnimation(u8 bank, u8 statusAnimId);

// battle_anim_special.s
u8 ItemIdToBallId(u16 itemId);
u8 LaunchBallStarsTask(u8 x, u8 y, u8 kindOfStars, u8 arg3, u8 ballId);
u8 LaunchBallFadeMonTask(bool8 unFadeLater, u8 battlerId, u32 arg2, u8 ballId);

// battle_anim_mons.s
void TranslateMonSpriteLinear(struct Sprite * sprite);
void TranslateMonSpriteLinearFixedPoint(struct Sprite * sprite);
void InitSpriteDataForLinearTranslation(struct Sprite * sprite);
void PrepareBattlerSpriteForRotScale(u8 spriteId, u8 b);
void ResetSpriteRotScale(u8 spriteId);
void SetSpriteRotScale(u8 spriteId, s16 xScale, s16 yScale, u16 rotation);
bool8 IsContest(void);
void sub_80759DC(u8 spriteId);
bool8 IsBattlerSpritePresent(u8 battlerId);
u8 GetBattlerSpriteSubpriority(u8 battlerId);
void StartAnimLinearTranslation(struct Sprite *sprite);
void sub_80755B8(struct Sprite *sprite);
u8 sub_80768B0(u8 battlerId);
u32 sub_8075CB8(u8 a1, u8 a2, u8 a3, u8 a4);
u8 sub_8075D80(u8 battlerId);
s16 CloneBattlerSpriteWithBlend(u8 animBattler);
void obj_delete_but_dont_free_vram(struct Sprite *sprite);
void sub_807543C(u8 bgId, const u32 *);
void AnimLoadCompressedBgGfx(u32, const u32 *, u32);
void sub_80752A0(struct BattleAnimBgData *);
u8 sub_8076E34(s32, u8, s32);
void sub_8075358(u8 bgId);
u32 sub_8075BE8(u8, u8, u8, u8, u8, u8, u8);
void sub_8075458(bool8);
bool8 AnimateBallThrow(struct Sprite *sprite);

// battle_anim_mon_movement.c
void AnimTask_ShakeMon(u8 taskId);
void AnimTask_ShakeMon2(u8 taskId);
void AnimTask_ShakeMonInPlace(u8 taskId);
void AnimTask_ShakeAndSinkMon(u8 taskId);
void AnimTask_TranslateMonElliptical(u8 taskId);
void AnimTask_TranslateMonEllipticalRespectSide(u8 taskId);
void AnimTask_WindUpLunge(u8 taskId);
void sub_80995FC(u8 taskId);
void AnimTask_SwayMon(u8 taskId);
void AnimTask_ScaleMonAndRestore(u8 taskId);
void sub_8099980(u8 taskId);
void sub_8099A78(u8 taskId);
void sub_8099BD4(u8 taskId);

// normal.s
u32 UnpackSelectedBattleAnimPalettes(s16 selector);

// battle_anim_utility_funcs.c
void sub_80BB088(u8 taskId);
void sub_80BBA20(u8 taskId, s32 unused, u16 arg2, u8 battler1, u8 arg4, u8 arg5, u8 arg6, u8 arg7, const u32 *gfx, const u32 *tilemap, const u32 *palette);

#endif // GUARD_BATTLE_ANIM_H
