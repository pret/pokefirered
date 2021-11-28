#include "global.h"
#include "gflib.h"
#include "item.h"
#include "util.h"
#include "random.h"
#include "pokedex.h"
#include "money.h"
#include "pokemon_icon.h"
#include "mail.h"
#include "event_data.h"
#include "strings.h"
#include "pokemon_special_anim.h"
#include "pokemon_storage_system.h"
#include "pokemon_summary_screen.h"
#include "task.h"
#include "naming_screen.h"
#include "overworld.h"
#include "party_menu.h"
#include "trainer_pokemon_sprites.h"
#include "field_specials.h"
#include "battle.h"
#include "battle_message.h"
#include "battle_anim.h"
#include "battle_ai_script_commands.h"
#include "battle_scripts.h"
#include "battle_string_ids.h"
#include "reshow_battle_screen.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "constants/battle_anim.h"
#include "constants/battle_move_effects.h"
#include "constants/battle_script_commands.h"
#include "constants/items.h"
#include "constants/hold_effects.h"
#include "constants/songs.h"
#include "constants/moves.h"
#include "constants/abilities.h"
#include "constants/pokemon.h"
#include "constants/maps.h"
#include "constants/inserts.h"
#include "constants/sound_moves_table.h"
#include "constants/callasmfunctions.h"

void DoAftermathDamage(void)
{
  if (gBattleMoves[gCurrentMove].flags & FLAG_MAKES_CONTACT) 
  {
    gBattleMoveDamage = gBattleMons[gBattlerAttacker].maxHP / 4;
    if (gBattleMoveDamage == 0)
      gBattleMoveDamage = 1;
  }
  else
  gBattlescriptCurrInstr = BattleScript_FaintTargetReturn - 5;
}



