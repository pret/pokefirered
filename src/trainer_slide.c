#include "global.h"
#include "battle.h"
#include "pokemon.h"
#include "battle_anim.h"
#include "trainer_slide.h"
#include "constants/pokemon.h"
#include "constants/species.h"

static u8 GetEnemyTeamCount(bool8 onlyAlive);
static bool8 TrainerSlideCheckMonHPLow(u8 bank);

bool8 ShouldDoTrainerSlide(u8 bank, u16 trainerId, u8 caseId)
{
  if (gBattleTypeFlags & BATTLE_TYPE_TRAINER && GetBattlerSide(bank) == B_SIDE_OPPONENT)
  {
    gBattleScripting.battler = bank;
    
    switch (caseId)
    {
      case TRAINER_SLIDE_FIRST_MON_DOWN:
          if (GetEnemyTeamCount(TRUE) == GetEnemyTeamCount(FALSE) - 1 && gTrainers[trainerId].firstMonDownMsg != NULL)
          {
            gSetWordLoc = gTrainers[trainerId].firstMonDownMsg;
            return TRUE;
          }
          break;
      case TRAINER_SLIDE_LAST_MON:
          if (GetEnemyTeamCount(TRUE) == 1 && gTrainers[trainerId].lastMonMsg != NULL)
          {
            gSetWordLoc = gTrainers[trainerId].lastMonMsg;
            return TRUE;
          }
          break;
      case TRAINER_SLIDE_LAST_MON_LOW_HP:
          if (GetEnemyTeamCount(TRUE) == 1 && TrainerSlideCheckMonHPLow(bank) && gTrainers[trainerId].lastMonLowHPMsg != NULL)
          {
            gSetWordLoc = gTrainers[trainerId].lastMonLowHPMsg;
            return TRUE;
          }
          break;
    }
  }
  return FALSE;
}

static u8 GetEnemyTeamCount(bool8 onlyAlive)
{
  u8 i, count;
  u16 species;
  
  for (i = 0, count = 0; i < PARTY_SIZE; i++)
  {
    species = GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2, NULL);
    
    if (species != SPECIES_NONE && species != SPECIES_EGG && (!onlyAlive || GetMonData(&gEnemyParty[i], MON_DATA_HP, NULL)))
      ++count;
  }
  return count;
}

static bool8 TrainerSlideCheckMonHPLow(u8 bank)
{
  return gBattleMons[bank].hp <= gBattleMons[bank].maxHP / 4; // 25% or below
}
