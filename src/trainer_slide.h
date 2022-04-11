#ifndef GUARD_TRAINER_SLIDE_H
#define GUARD_TRAINER_SLIDE_H

enum
{
	TRAINER_SLIDE_FIRST_DOWN,
	TRAINER_SLIDE_LAST_MON,
	TRAINER_SLIDE_LAST_MON_LOW_HP,
};

bool8 ShouldDoTrainerSlide(u8 bank, u16 trainerId, u8 caseiD);

#endif // GUARD_TRAINER_SLIDE_H