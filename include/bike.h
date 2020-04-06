#ifndef GUARD_BIKE_H
#define GUARD_BIKE_H

// TODO: Do the constants make sense in FRLG? 

// Player speeds
enum
{
    SPEED_STANDING,
    SPEED_NORMAL,
    SPEED_FAST,
    SPEED_FASTER,
    SPEED_FASTEST,
};

// Acro bike states
enum
{
    ACRO_STATE_NORMAL,
    ACRO_STATE_TURNING,
    ACRO_STATE_WHEELIE_STANDING,
    ACRO_STATE_BUNNY_HOP,
    ACRO_STATE_WHEELIE_MOVING,
    ACRO_STATE_SIDE_JUMP,
    ACRO_STATE_TURN_JUMP,
};

void InitPlayerAvatarBikeState(u32 directionHistory, u32 abStartSelectHistory);
bool8 MetatileAtPlayerPositionForbidsBiking(void);
void StartTransitionToFlipBikeState(u8 flags);
s16 GetPlayerSpeed(void);
bool8 sub_80BD460(u8);
void MovePlayerOnBike(u8 direction, u16 newKeys, u16 heldKeys);
bool32 IsRunningDisallowed(u8 metatileBehavior);
void Bike_HandleBumpySlopeJump(void);
void Bike_UpdateBikeCounterSpeed(u8 counter);
bool8 player_should_look_direction_be_enforced_upon_movement(void);

#endif //GUARD_BIKE_H
