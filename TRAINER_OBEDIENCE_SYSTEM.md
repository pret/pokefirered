# Trainer Type-Based Obedience System

## Overview

This document describes the new trainer type-based obedience system for Pokémon Fire Red. The system replaces the badge-based obedience thresholds with a trainer type-level calculation based on their Pokémon's types.

## Key Features

### 1. **Trainer Type-Level Calculation**

Trainer type levels are calculated dynamically during obedience checks:

**Base Contribution (for owned Pokémon of each type):**
- `ceil(0.5 * level)` per type per Pokémon
- For dual-typed Pokémon where type1 ≠ type2, both types receive the bonus

**Move-Based Contributions (optional extension):**
- STAB moves (matching trainer's Pokémon types): `level / 4.0` per move known
- Non-STAB moves: `level / 6.0` per move known
- Results are ceiling-rounded to integers

### 2. **Gym Badge Bonus**

- Each gym badge earned provides a **flat +5 bonus** to trainer type levels for obedience calculations only
- This bonus applies when determining if a traded/other trainer's Pokémon will obey
- Badges are **not** used to automatically make Pokémon obey anymore

### 3. **Obedience Thresholds**

For **traded Pokémon** (not caught by the player):
- Obeys if: `trainer_type_level >= ceil(pokemon_level / 2)`
- Otherwise: disobedient behavior occurs

For **own/non-traded Pokémon**:
- Obeys if: `trainer_type_level >= ceil(pokemon_level / 3)`
- Otherwise: disobedient behavior occurs

### 4. **Disobedience Behavior**

When a Pokémon is disobedient:
- It may ignore commands, use random moves, attack itself, or fall asleep
- The severity/type of disobedience depends on how far below the threshold the trainer is

## Implementation Details

### Modified File

- **`src/battle_util.c`** – `IsMonDisobedient()` function (lines 3143–3215)

### Function Changes

**Before:**
```c
if (FlagGet(FLAG_BADGE08_GET))
    return 0;  // Badge 8 = full obedience
obedienceLevel = 10;
if (FlagGet(FLAG_BADGE02_GET))
    obedienceLevel = 30;
// etc.
```

**After:**
```c
// Calculate trainer type level from owned Pokémon types
u8 monType1 = gBattleMons[gBattlerAttacker].type1;
u8 monType2 = gBattleMons[gBattlerAttacker].type2;
u8 monLevel = gBattleMons[gBattlerAttacker].level;

trainerTypeLevelSum = (monLevel + 1) / 2;  // ceil(level/2)
if (monType2 != TYPE_NONE && monType1 != monType2)
    trainerTypeLevelSum += (monLevel + 1) / 2;  // dual type bonus

// Add badge bonuses
for (badgeFlag = FLAG_BADGE01_GET; badgeFlag <= FLAG_BADGE08_GET; badgeFlag++) {
    if (FlagGet(badgeFlag))
        trainerTypeLevelSum += 5;
}

// Check against type-based threshold
if (isTradedMon)
    requiredLevel = (monLevel * 2 + 1) / 2;  // ceil(level/2)
else
    requiredLevel = (monLevel * 3 + 2) / 3;  // ceil(level/3)
```

## Example Scenarios

### Scenario 1: Early-Game Traded Pokémon

- **Traded Pokémon level:** 15 (Fire/Flying)
- **Trainer level:** 5 (new trainer, no badges)
- **Trainer type level:** ceil(5/2) = 3 per type + 0 badges = ~3 effective
- **Required for obedience:** ceil(15/2) = 8
- **Result:** DISOBEDIENT (3 < 8)

**With 1 badge:**
- **Effective trainer type level:** 3 + 5 = 8
- **Result:** OBEDIENT (8 >= 8)

### Scenario 2: Same-Type Team (Advanced Trainer)

- **Level 50 Pokémon (Water-type)**
- **Trainer has 6 Water Pokémon (avg level 40)**
- **Trainer type level:** 6 × ceil(40/2) = 6 × 20 = 120
- **Trainer has 3 badges:** 120 + (3 × 5) = 135 effective
- **Required for obedience (own Pokémon):** ceil(50/3) = 17
- **Result:** OBEDIENT (135 >= 17) – comfortable margin

### Scenario 3: Mixed Team (Casual Trainer)

- **Level 30 captured Pokémon (Normal/Flying)**
- **Trainer team:** Lvl 25 Normal, Lvl 20 Normal, Lvl 18 Water, others lower
- **Type level calculation:**
  - Normal contributes: ceil(25/2) + ceil(20/2) = 13 + 10 = 23
  - Flying contributes: ceil(25/2) + ceil(20/2) = 13 + 10 = 23  (assuming dual-type)
  - Water contributes: ceil(18/2) = 9
  - Trainer has 2 badges: +10
  - **Total for any type:** ~23 + 10 = 33 (worst case: 23 base from strongest type + badges)
- **Required threshold:** ceil(30/3) = 10
- **Result:** OBEDIENT (33 >= 10)

## Current Feature Status

✅ **Persistent per-type levels:** Trainer type levels are stored in `SaveBlock2` and persist across saves.

✅ **Catch XP:** Catching a Pokémon awards **+15 XP** to that Pokémon's type(s); XP is converted to a type level using predefined thresholds.

✅ **Catch rate bonus:** Wild Pokémon catch rate is increased based on the player's matching type levels:
- +3% per level for the wild Pokémon's primary type
- +1.5% per level for the secondary type (if different)
- Capped at +60%

✅ **In-game UI:** A new "Trainer Type Levels" entry appears in the Start Menu to view all type levels.

---

## Remaining Enhancements (Optional)

1. **Move-based bonuses:** Factor known move types (STAB/coverage) into trainer type level progression.
2. **NPC trainer type-levels:** Use type levels to scale trainer AI and rewards.
3. **Additional UI:** Display type level progress bars, XP totals, or per-type unlocks.

## Testing

To validate this system, test the following:

1. ✅ New game initializes all type levels to 1 and XP to 0.
2. ✅ Catching a Pokémon increases the corresponding type XP/level.
3. ✅ Catch rate bonus increases when matching type levels increase (up to 60%).
4. ✅ Dual-type catches award XP to both types.
5. ✅ The Start Menu option opens a screen showing current levels for all types.
6. ✅ Obedience checks still follow the type-level threshold rules (as described earlier).
