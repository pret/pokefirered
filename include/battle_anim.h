#ifndef GUARD_BATTLE_ANIM_H
#define GUARD_BATTLE_ANIM_H

#include "global.h"

#ifndef BATTLE_BANKS_COUNT
#define BATTLE_BANKS_COUNT 4
#endif // BATTLE_BANKS_COUNT

enum
{
    ANIM_BANK_ATTACKER,
    ANIM_BANK_TARGET,
    ANIM_BANK_ATK_PARTNER,
    ANIM_BANK_DEF_PARTNER,
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

// battle_anim_80FE840.s
void SetAnimBgAttribute(u8 bgId, u8 attributeId, u8 value);
void sub_8118FBC(u8 arg0, u8 arg1, u8 arg2, u8 bankIdentity, u8 arg4, void *arg5, u16 *arg6, u16 arg7);
void HandleIntroSlide(u8 terrainId);

// battle_anim_80A5C6C.s
void sub_80A6EEC(struct Sprite *sprite);
void sub_80A68D4(struct Sprite *sprite);
void sub_80A6F3C(struct Sprite *sprite);
void sub_80A8278(void);
void sub_80A6B30(struct BattleAnimBgData *);
void sub_80A6B90(struct BattleAnimBgData *, u32 arg1);
u8 sub_80A82E4(u8 bank);
bool8 AnimateBallThrow(struct Sprite *sprite);

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

u8 GetBattlerSpriteCoord(u8 bank, u8 attributeId);

bool8 IsBankSpritePresent(u8 bank);
void sub_80A6C68(u8 arg0);
u8 GetAnimBankSpriteId(u8 wantedBank);
bool8 IsDoubleBattle(void);
u8 sub_80A6D94(void);
u8 sub_80A8364(u8);
void StoreSpriteCallbackInData6(struct Sprite *sprite, void (*spriteCallback)(struct Sprite*));
void oamt_add_pos2_onto_pos1(struct Sprite *sprite);
u8 GetBankSpriteDefault_Y(u8 bank);
u8 sub_80A82E4(u8 bank);
u8 GetSubstituteSpriteDefault_Y(u8 bank);

// battle_anim_80A9C70.s
void LaunchStatusAnimation(u8 bank, u8 statusAnimId);

// battle_anim_8170478.s
u8 ItemIdToBallId(u16 itemId);
u8 LaunchBallStarsTask(u8 x, u8 y, u8 kindOfStars, u8 arg3, u8 ballId);
u8 LaunchBallFadeMonTask(bool8 unFadeLater, u8 bank, u32 arg2, u8 ballId);

// battle_anim_mons.s
void TranslateMonSpriteLinear(struct Sprite * sprite);
void TranslateMonSpriteLinearFixedPoint(struct Sprite * sprite);
void InitSpriteDataForLinearTranslation(struct Sprite * sprite);
void PrepareBattlerSpriteForRotScale(u8 spriteId, u8 b);
void ResetSpriteRotScale(u8 spriteId);
void SetSpriteRotScale(u8 spriteId, s16 xScale, s16 yScale, u16 rotation);
bool8 IsContest(void);
void sub_80759DC(u8 spriteId);

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

#endif // GUARD_BATTLE_ANIM_H
