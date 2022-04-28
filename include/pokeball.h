#ifndef GUARD_POKEBALL_H
#define GUARD_POKEBALL_H

#include "global.h"

enum
{
    BALL_POKE,
    BALL_GREAT,
    BALL_SAFARI,
    BALL_ULTRA,
    BALL_MASTER,
    BALL_NET,
    BALL_DIVE,
    BALL_NEST,
    BALL_REPEAT,
    BALL_TIMER,
    BALL_LUXURY,
    BALL_PREMIER,
    POKEBALL_COUNT
};

extern const struct SpriteTemplate gBallSpriteTemplates[];
extern const struct CompressedSpriteSheet gBallSpriteSheets[];
extern const struct CompressedSpritePalette gBallSpritePalettes[];

#define POKEBALL_PLAYER_SENDOUT     0xFF
#define POKEBALL_OPPONENT_SENDOUT   0xFE

u8 DoPokeballSendOutAnimation(s16 pan, u8 kindOfThrow);
void CreatePokeballSpriteToReleaseMon(u8 monSpriteId, u8 bank, u8 x, u8 y, u8 oamPriority, u8 subpriortiy, u8 g, u32 h);
u8 CreateTradePokeballSprite(u8 monSpriteId, u8 bank, u8 x, u8 y, u8 oamPriority, u8 subpriortiy, u8 g, u32 h);
void DoHitAnimHealthboxEffect(u8 bank);
void LoadBallGfx(u8 ballId);
void FreeBallGfx(u8 ballId);
void StartHealthboxSlideIn(u8 battler);
void DestroySpriteAndFreeResources2(struct Sprite *sprite);

#endif // GUARD_POKEBALL_H
