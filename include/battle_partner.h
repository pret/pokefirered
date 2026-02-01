#ifndef BATTLE_PARTNER_H
#define BATTLE_PARTNER_H

#include "difficulty.h"
#include "constants/battle_partner.h"

extern const struct Trainer gBattlePartners[DIFFICULTY_COUNT][PARTNER_COUNT];

void FillPartnerParty(u16 trainerId);

#endif // BATTLE_PARTNER_H
