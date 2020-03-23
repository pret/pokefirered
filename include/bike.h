#ifndef GUARD_BIKE_H
#define GUARD_BIKE_H

void sub_80BD620(u32 unkC, u32 unk10);
bool8 sub_80BD540(void);
void StartTransitionToFlipBikeState(u8 flags);
s16 GetPlayerSpeed(void);

void MovePlayerOnBike(u8 direction, u16 newKeys, u16 heldKeys);
void MovePlayerNotOnBike(u8 direction, u16 heldKeys);

#endif //GUARD_BIKE_H
