#ifndef GUARD_TRAINER_SEE_H
#define GUARD_TRAINER_SEE_H

struct ApproachingTrainer
{
    u8 objectEventId;
    u8 radius; // plus 1
    const u8 *trainerScriptPtr;
    u8 taskId;
};

extern u16 gWhichTrainerToFaceAfterBattle;
extern struct ApproachingTrainer gApproachingTrainers[2];
extern u8 gNoOfApproachingTrainers;
extern bool8 gTrainerApproachedPlayer;
extern u8 gApproachingTrainerId;

bool8 CheckForTrainersWantingBattle(void);
void MovementAction_RevealTrainer_RunTrainerSeeFuncList(struct ObjectEvent *var);
u8 FldEff_ExclamationMarkIcon1(void);
u8 FldEff_DoubleExclMarkIcon(void);
u8 FldEff_XIcon(void);
u8 FldEff_SmileyFaceIcon(void);
u8 FldEff_QuestionMarkIcon(void);
u8 GetCurrentApproachingTrainerObjectEventId(void);
u8 GetChosenApproachingTrainerObjectEventId(u8 arrayId);
void TryPrepareSecondApproachingTrainer(void);

#endif //GUARD_TRAINER_SEE_H
