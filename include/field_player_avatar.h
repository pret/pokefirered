#ifndef GUARD_FIELD_PLAYER_AVATAR_H
#define GUARD_FIELD_PLAYER_AVATAR_H

#include "global.h"

void ClearPlayerAvatarInfo(void);
void SetPlayerAvatarExtraStateTransition(u8, u8);
u8 GetPlayerAvatarGenderByGraphicsId(u8);
bool8 TestPlayerAvatarFlags(u8);
void PlayerGetDestCoords(s16 *, s16 *);
u8 player_get_direction_lower_nybble(void);
u8 player_get_direction_upper_nybble(void);
u8 player_get_x22(void);

void sub_808D074(u8);
void sub_805C270();
void sub_805C780();
void GetXYCoordsOneStepInFrontOfPlayer(s16 *xPtr, s16 *yPtr);
u8 sub_805C808(u8);
void SetPlayerAvatarStateMask(u8 mask);
void sub_805D9C4(struct Sprite *sprite);
void sub_805D154(u8 direction);
void sub_805DAE4(u8 direction);

#endif //GUARD_FIELD_PLAYER_AVATAR_H
