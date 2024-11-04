#ifndef GUARD_FIELD_EFFECTS_H
#define GUARD_FIELD_EFFECTS_H

#include "global.h"
#include "constants/field_effects.h"

extern u32 gFieldEffectArguments[8];
extern void (*gPostMenuFieldCallback)(void);
extern bool8 (*gFieldCallback2)(void);

u32 FieldEffectStart(u8);
bool8 FieldEffectActiveListContains(u8 id);
void CreateTeleportFieldEffectTask(void);
void FieldEffectActiveListRemove(u8 id);
void StartEscapeRopeFieldEffect(void);
void FieldEffectStop(struct Sprite *sprite, u8 id);
u8 CreateTrainerSprite(u8 trainerSpriteID, s16 x, s16 y, u8 subpriority, u8 *buffer);
void FieldCB_FallWarpExit(void);
void StartEscalatorWarp(u8 metatileBehavior, u8 priority);
void StartLavaridgeGymB1FWarp(u8 a0);
void StartLavaridgeGym1FWarp(u8 a0);
void ApplyGlobalFieldPaletteTint(u8 paletteIdx);
void FreeResourcesAndDestroySprite(struct Sprite *sprite, u8 spriteId);
u8 CreateMonSprite_PicBox(u16 species, s16 x, s16 y, bool8 unused);
void ReturnToFieldFromFlyMapSelect(void);
void MultiplyInvertedPaletteRGBComponents(u16 i, u8 r, u8 g, u8 b);
void SpriteCB_PopOutOfAsh(struct Sprite *sprite);
void SpriteCB_AshLaunch(struct Sprite *sprite);
void FieldEffectActiveListClear(void);
void FieldEffectFreePaletteIfUnused(u8 paletteNum);
void FieldCallback_UseFly(void);

void FieldEffectScript_LoadFadedPal(const struct SpritePalette * spritePalette);
void FieldEffectScript_LoadPal(const struct SpritePalette * spritePalette);

u32 FldEff_ExclamationMarkIcon(void);
u32 FldEff_UseCutOnGrass(void);
u32 FldEff_UseCutOnTree(void);
u32 FldEff_Shadow(void);
u32 FldEff_TallGrass(void);
u32 FldEff_Ripple(void);
u32 FldEff_FieldMoveShowMon(void);
u32 FldEff_Ash(void);
u32 FldEff_SurfBlob(void);
u32 FldEff_UseSurf(void);
u32 FldEff_Dust(void);
u32 FldEff_JumpTallGrass(void);
u32 FldEff_SandFootprints(void);
u32 FldEff_JumpBigSplash(void);
u32 FldEff_Splash(void);
u32 FldEff_JumpSmallSplash(void);
u32 FldEff_LongGrass(void);
u32 FldEff_JumpLongGrass(void);
u32 FldEff_UnusedGrass(void);
u32 FldEff_UnusedGrass2(void);
u32 FldEff_UnusedSand(void);
u32 FldEff_UnusedWaterSurfacing(void);
u32 FldEff_BerryTreeGrowthSparkle(void);
u32 FldEff_DeepSandFootprints(void);
u32 FldEff_PokecenterHeal(void);
u32 FldEff_TreeDisguise(void);
u32 FldEff_MountainDisguise(void);
u32 FldEff_NpcFlyOut(void);
u32 FldEff_FlyOut(void);
u32 FldEff_FlyIn(void);
u32 FldEff_QuestionMarkIcon(void);
u32 FldEff_FeetInFlowingWater(void);
u32 FldEff_BikeTireTracks(void);
u32 FldEff_SandDisguise(void);
u32 FldEff_UseRockSmash(void);
u32 FldEff_UseDig(void);
u32 FldEff_SandPile(void);
u32 FldEff_UseStrength(void);
u32 FldEff_ShortGrass(void);
u32 FldEff_HotSpringsWater(void);
u32 FldEff_UseWaterfall(void);
u32 FldEff_UseDive(void);
u32 FldEff_Pokeball(void);
u32 FldEff_XIcon(void);
u32 FldEff_PopOutOfAsh(void);
u32 FldEff_LavaridgeGymWarp(void);
u32 FldEff_SweetScent(void);
u32 FldEff_Bubbles(void);
u32 FldEff_Sparkle(void);
u32 FldEff_CutGrass(void);
u32 FldEff_FieldMoveShowMonInit(void);
u32 FldEff_HallOfFameRecord(void);
u32 FldEff_UseTeleport(void);
u32 FldEff_SmileyFaceIcon(void);
u32 FldEff_UseVsSeeker(void);
u32 FldEff_DoubleExclMarkIcon(void);
u32 FldEff_MoveDeoxysRock(void);
u32 FldEff_DestroyDeoxysRock(void);
u32 FldEff_PhotoFlash(void);
u32 FldEff_TracksSlither(void);
u32 FldEff_TracksBug(void);
u32 FldEff_TracksSpot(void);
u32 FldEff_SnowFootprints(void);

#endif //GUARD_FIELD_EFFECTS_H
