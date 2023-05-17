#ifndef GUARD_BIKE_H
#define GUARD_BIKE_H

// TODO: Do the constants make sense in FRLG? 

// Player speeds
enum
{
    PLAYER_SPEED_STANDING,
    PLAYER_SPEED_NORMAL,
    PLAYER_SPEED_FAST,
    PLAYER_SPEED_FASTER,
    PLAYER_SPEED_FASTEST,
};

enum {
    BIKE_TRANS_FACE_DIRECTION,
    BIKE_TRANS_TURNING,
    BIKE_TRANS_MOVE,
    BIKE_TRANS_DOWNHILL,
    BIKE_TRANS_UPHILL
};

enum {
    BIKE_STATE_NORMAL,
    BIKE_STATE_TURNING,
    BIKE_STATE_SLOPE
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

void BikeClearState(u32 directionHistory, u32 abStartSelectHistory);
bool8 IsBikingDisallowedByPlayer(void);
void GetOnOffBike(u8 flags);
s16 GetPlayerSpeed(void);
bool8 RS_IsRunningDisallowed(u8 r0);
void MovePlayerOnBike(u8 direction, u16 newKeys, u16 heldKeys);
bool32 IsRunningDisallowed(u8 metatileBehavior);
void Bike_HandleBumpySlopeJump(void);
void Bike_UpdateBikeCounterSpeed(u8 counter);
bool8 IsPlayerNotUsingAcroBikeOnBumpySlope(void);

#endif //GUARD_BIKE_H
