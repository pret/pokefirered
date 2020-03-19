#ifndef GUARD_FIELD_CONTROL_AVATAR_H
#define GUARD_FIELD_CONTROL_AVATAR_H

#include "global.h"

struct FieldInput
{
    bool8 pressedAButton:1;
    bool8 checkStandardWildEncounter:1;
    bool8 pressedStartButton:1;
    bool8 pressedSelectButton:1;
    bool8 heldDirection:1;
    bool8 heldDirection2:1;
    bool8 tookStep:1;
    bool8 pressedBButton:1;
    bool8 pressedRButton:1;
    bool8 input_field_1_0:1;
    bool8 input_field_1_1:1;
    bool8 input_field_1_2:1;
    bool8 input_field_1_3:1;
    u8 dpadDirection;
};

extern struct FieldInput gUnknown_3005078;

void RestartWildEncounterImmunitySteps(void);
void ClearPoisonStepCounter(void);
int SetCableClubWarp(void);
void sub_806DE28(struct ObjectEvent *);
bool8 dive_warp(struct MapPosition * pos, u16 behavior);

#endif //GUARD_FIELD_CONTROL_AVATAR_H
