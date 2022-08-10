//
// Created by scott on 9/7/2017.
//

#ifndef GUARD_FIELD_EFFECT_HELPERS_H
#define GUARD_FIELD_EFFECT_HELPERS_H

#include "global.h"

enum {
    BOB_NONE,
    BOB_PLAYER_AND_MON,
    BOB_MON_ONLY, // when player has jumped / flown off
};

u8 CreateWarpArrowSprite(void);
void SetSurfBlob_BobState(u8 spriteId, u8 bobState);
void SetSurfBlob_DontSyncAnim(u8 spriteId, bool8 value);
void StartAshFieldEffect(s16, s16, u16, s16);
void StartRevealDisguise(struct ObjectEvent *);
bool8 UpdateRevealDisguise(struct ObjectEvent *);
void SetUpReflection(struct ObjectEvent *, struct Sprite *, u8);
u32 StartFieldEffectForObjectEvent(u8, struct ObjectEvent *);
u8 FindTallGrassFieldEffectSpriteId(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y);
void ShowWarpArrowSprite(u8 spriteId, u8 direction, s16 x, s16 y);
void SetSpriteInvisible(u8 spriteId);
void SetSurfBlob_PlayerOffset(u8 spriteId, bool8 hasOffset, s16 offset);
void UpdateJumpImpactEffect(struct Sprite *sprite);
void UpdateShadowFieldEffect(struct Sprite *sprite);
void UpdateBubblesFieldEffect(struct Sprite *sprite);
void UpdateSparkleFieldEffect(struct Sprite *sprite);
void UpdateTallGrassFieldEffect(struct Sprite *sprite);
void WaitFieldEffectSpriteAnim(struct Sprite *sprite);
void UpdateAshFieldEffect(struct Sprite *sprite);
void UpdateSurfBlobFieldEffect(struct Sprite *sprite);
void UpdateFootprintsTireTracksFieldEffect(struct Sprite *sprite);
void UpdateSplashFieldEffect(struct Sprite *sprite);
void UpdateShortGrassFieldEffect(struct Sprite *sprite);
void UpdateLongGrassFieldEffect(struct Sprite *sprite);
void UpdateSandPileFieldEffect(struct Sprite *sprite);
void UpdateDisguiseFieldEffect(struct Sprite *sprite);
void UpdateHotSpringsWaterFieldEffect(struct Sprite *sprite);

#endif //GUARD_FIELD_EFFECT_HELPERS_H
