#ifndef GUARD_TRAINER_SLIDE_H
#define GUARD_TRAINER_SLIDE_H

#include "global.h"

enum
{
	TRAINER_SLIDE_FIRST_MON_DOWN,
	TRAINER_SLIDE_LAST_MON,
	TRAINER_SLIDE_LAST_MON_LOW_HP,
};

bool8 ShouldDoTrainerSlide(u8 bank, u16 trainerId, u8 caseId);

#endif // GUARD_TRAINER_SLIDE_H
