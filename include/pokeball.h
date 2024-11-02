#ifndef GUARD_POKEBALL_H
#define GUARD_POKEBALL_H

enum PokeBall
{
    BALL_STRANGE = 0,
    BALL_POKE = 1,
    BALL_GREAT = 2,
    BALL_ULTRA = 3,
    BALL_MASTER = 4,
    BALL_PREMIER = 5,
    BALL_HEAL = 6,
    BALL_NET = 7,
    BALL_NEST = 8,
    BALL_DIVE = 9,
    BALL_DUSK = 10,
    BALL_TIMER = 11,
    BALL_QUICK = 12,
    BALL_REPEAT = 13,
    BALL_LUXURY = 14,
    BALL_LEVEL = 15,
    BALL_LURE = 16,
    BALL_MOON = 17,
    BALL_FRIEND = 18,
    BALL_LOVE = 19,
    BALL_FAST = 20,
    BALL_HEAVY = 21,
    BALL_DREAM = 22,
    BALL_SAFARI = 23,
    BALL_SPORT = 24,
    BALL_PARK = 25,
    BALL_BEAST = 26,
    BALL_CHERISH = 27,
    POKEBALL_COUNT
};

enum {
    BALL_AFFINE_ANIM_0,
    BALL_ROTATE_RIGHT,
    BALL_ROTATE_LEFT,
    BALL_AFFINE_ANIM_3,
    BALL_AFFINE_ANIM_4
};

extern const struct CompressedSpriteSheet gBallSpriteSheets[POKEBALL_COUNT];
extern const struct CompressedSpritePalette gBallSpritePalettes[POKEBALL_COUNT];
extern const struct SpriteTemplate gBallSpriteTemplates[];

#define POKEBALL_PLAYER_SENDOUT     0xFF
#define POKEBALL_OPPONENT_SENDOUT   0xFE
#define POKEBALL_PLAYER_SLIDEIN     0xFD

u8 DoPokeballSendOutAnimation(u32 battler, s16 pan, u8 kindOfThrow);
void CreatePokeballSpriteToReleaseMon(u8 monSpriteId, u8 monPalNum, u8 x, u8 y, u8 oamPriority, u8 subpriortiy, u8 delay, u32 fadePalettes);
u8 CreateTradePokeballSprite(u8 monSpriteId, u8 monPalNum, u8 x, u8 y, u8 oamPriority, u8 subPriority, u8 delay, u32 fadePalettes);
void DoHitAnimHealthboxEffect(u8 bank);
void LoadBallGfx(u8 ballId);
void FreeBallGfx(u8 ballId);
void StartHealthboxSlideIn(u8 battler);
void DestroySpriteAndFreeResources_Ball(struct Sprite *sprite);
enum PokeBall ItemIdToBallId(u32 ballItem);

#endif // GUARD_POKEBALL_H
