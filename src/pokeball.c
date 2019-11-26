#include "global.h"
#include "pokeball.h"
#include "battle.h"


u8 DoPokeballSendOutAnimation(u16 a0, u8 a1)
{
	gDoingBattleAnim = 1;
	gBattleSpritesDataPtr->healthBoxesData[gActiveBattler].ballAnimActive = TRUE;
	CreateTask(sub_804A9A0, 5);

	return 0;
}
