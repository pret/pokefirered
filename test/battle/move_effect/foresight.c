#include "global.h"
#include "test/battle.h"

TO_DO_BATTLE_TEST("Foresight removes Ghost's type immunity to Normal and Fighting types")
TO_DO_BATTLE_TEST("Foresight causes accuracy/evasion stat changes only between the user/target when the user's accuracy stage is less than the target's evasion stage (Gen 2)")
TO_DO_BATTLE_TEST("Foresight causes all moves against the target to ignore evasion stat changes (Gen 3)")
TO_DO_BATTLE_TEST("Foresight causes all moves against the target to ignore only positive evasion stat changes (Gen 4+)") // Eg. Doesn't ignore Sweet Scent
TO_DO_BATTLE_TEST("Foresight doesn't cause moves used against the target to always hit (Gen 2-3)")
TO_DO_BATTLE_TEST("Foresight causes moves used against the target to always hit (Gen 4+)")
TO_DO_BATTLE_TEST("Foresight does not make moves hit semi-invulnerable targets")
TO_DO_BATTLE_TEST("Foresight fails if the target is already under its effect (Gen 2 and Gen5+)")
TO_DO_BATTLE_TEST("Foresight doesn't fail if the target is already under its effect (Gen 3-4)")
TO_DO_BATTLE_TEST("Baton Pass passes Foresight's effect (Gen 2)");
TO_DO_BATTLE_TEST("Baton Pass doesn't pass Foresight's effect (Gen 3+)");
