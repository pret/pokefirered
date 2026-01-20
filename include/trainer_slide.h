#ifndef GUARD_TRAINER_SLIDE_H
#define GUARD_TRAINER_SLIDE_H

#include "constants/trainer_slide.h"


struct MessageStatus
{
    u8 messageInitalized[MAX_BATTLERS_COUNT][TRAINER_SLIDE_ARRAY_SIZE];
    u8 messagePlayed[MAX_BATTLERS_COUNT][TRAINER_SLIDE_ARRAY_SIZE];
};

void SetTrainerSlideMessage(enum DifficultyLevel difficulty, u32 trainerId, u32 slideId);
enum TrainerSlideTargets ShouldDoTrainerSlide(u32 battler, enum TrainerSlideType slideId);
void TryInitializeFirstSTABMoveTrainerSlide(u32 battlerDef, u32 battlerAtk, enum Type moveType);
void TryInitializeTrainerSlidePlayerLandsFirstCriticalHit(u32 target);
void TryInitializeTrainerSlideEnemyLandsFirstCriticalHit(u32 target);
void TryInitializeTrainerSlidePlayerLandsFirstSuperEffectiveHit(u32 target);
void TryInitializeTrainerSlideEnemyMonUnaffected(u32 target);
bool32 IsTrainerSlideInitialized(u32 battler, enum TrainerSlideType slideId);
bool32 IsTrainerSlidePlayed(u32 battler, enum TrainerSlideType slideId);
void InitalizeTrainerSlide(u32 battler, enum TrainerSlideType slideId);
void MarkTrainerSlideAsPlayed(u32 battler, enum TrainerSlideType slideId);
void MarkInitializedTrainerSlidesAsPlayed(u32 battler, enum TrainerSlideType slideId);

#endif // GUARD_TRAINER_SLIDE_H
