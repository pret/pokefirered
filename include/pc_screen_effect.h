#ifndef GUARD_PC_SCREEN_EFFECT_H
#define GUARD_PC_SCREEN_EFFECT_H

void BeginPCScreenEffect_TurnOn(u16 xspeed, u16 yspeed, u8 priority);
void BeginPCScreenEffect_TurnOff(u16 xspeed, u16 yspeed, u8 priority);
bool8 IsPCScreenEffectRunning_TurnOff(void);
bool8 IsPCScreenEffectRunning_TurnOn(void);

#endif //GUARD_PC_SCREEN_EFFECT_H
