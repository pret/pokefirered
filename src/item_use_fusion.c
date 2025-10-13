#include "global.h"
#include "task.h"
static const u8 sFusionStoneDesc[] = _(
    "A mysterious stone that\n"
    "fuses two Pokémon.");
// This name must match the one you referenced in src/data/items.h:
//   .fieldUseFunc = ItemUseOutOfBattle_FusionStone,
void ItemUseOutOfBattle_FusionStone(u8 taskId)
{
    // Minimal, safe behavior:
    // Close the item-use task so you return to the overworld without hanging.
    DestroyTask(taskId);
}