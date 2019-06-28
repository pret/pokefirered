#ifndef GUARD_FLDEFF_H
#define GUARD_FLDEFF_H

bool8 CheckObjectGraphicsInFrontOfPlayer(u8 graphicsId);
u8 oei_task_add(void);

// rock smash

// berrytree
void nullsub_56(void);

// poison
void FldEffPoison_Start(void);
bool32 FldEffPoison_IsActive(void);

// strength
bool8 SetUpFieldMove_Strength(void);
bool8 sub_80D0860(void);

// teleport
bool8 SetUpFieldMove_Teleport(void);
bool8 FldEff_UseTeleport(void);

// softboiled
bool8 hm_prepare_dive_probably(void);
void sub_80E56DC(u8 taskId);
void sub_80E5724(u8 taskId);

// sweetscent
bool8 SetUpFieldMove_SweetScent(void);
bool8 FldEff_SweetScent(void);

#endif // GUARD_FLDEFF_H
