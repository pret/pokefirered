# Trainer Type-Based Obedience System

## Overview

This document describes the implemented trainer type-based obedience system for Pokemon Fire Red. The system replaces vanilla badge-only obedience with trainer levels and applies in player and NPC trainer battle contexts.

## Implemented Behavior

### 1. Obedience scope

- Link and Pokedude battles skip this system.
- Wild opponent Pokemon are not checked.
- Trainer battles check both sides:
    - Player side uses player trainer levels.
    - NPC side uses computed NPC trainer levels.

This NPC behavior is intentional and includes Rocket flavor where many Rocket Pokemon carry Frustration to reflect poor trainer relationships.

### 2. Trainer level used for obedience

The obedience level is built from three slots and averaged:

- Species type 1.
- Species type 2 (or type 1 again for pure types).
- Current move type (if valid).

For player battlers, this base value is then adjusted by:

- Party synergy multiplier.
- Badge bonus: +5 per badge.
- Friendship obedience modifier.

For NPC battlers, badge bonus is not applied.

### 3. Friendship modifier

- Modifier formula is based on friendship relative to 70.
- Positive friendship improves obedience for most moves.
- For Frustration, the friendship modifier is inverted, so lower friendship helps obedience with Frustration.

### 4. Thresholds

- Own player Pokemon: obey if trainer level >= ceil(level / 3). Implemented as (level + 2) / 3.
- Non-owned player Pokemon (traded): obey if trainer level >= ceil(level / 2). Implemented as (level + 1) / 2.
- NPC battlers are evaluated with the same non-owned threshold path.

If the threshold is met, the Pokemon obeys immediately.

### 5. Disobedience resolution and Frustration behavior

If threshold is not met, the system computes a scaled obedience value and performs disobedience rolls.

When disobedience would happen:

- If Frustration has PP, it can be forced as the acting move and the turn proceeds.
- If a random move is chosen from legal moves, Frustration is preferred if legal.
- Otherwise normal disobedience outcomes apply: loafing, random move usage, self-hit/confusion style outcomes, or sleep behavior depending on branch and state.

## Implementation Details

### Key implementation files

- src/battle_util.c: IsMonDisobedient() and Frustration disobedience helpers.
- src/trainer_xp_system.c: trainer obedience-level composition and friendship obedience modifier.

## Current Feature Status

✅ **Persistent per-type levels:** Trainer type levels are stored in `SaveBlock2` and persist across saves.

✅ **Catch XP:** Catching a Pokémon awards **+15 XP** to that Pokémon's type(s); XP is converted to a type level using predefined thresholds.

✅ **Catch rate bonus:** Wild Pokémon catch rate is increased based on the player's matching type levels:
- +3% per level for the wild Pokémon's primary type
- +1.5% per level for the secondary type (if different)
- Capped at +60%

✅ **In-game UI:** A new "Trainer Type Levels" entry appears in the Start Menu to view all type levels.

---

## Testing

To validate this system, test the following:

1. ✅ New game initializes all type levels to 1 and XP to 0.
2. ✅ Catching a Pokémon increases the corresponding type XP/level.
3. ✅ Catch rate bonus increases when matching type levels increase (up to 60%).
4. ✅ Dual-type catches award XP to both types.
5. ✅ The Start Menu option opens a screen showing current levels for all types.
6. ✅ Obedience checks apply in trainer battles for player and NPC battlers, with thresholds and friendship/Frustration behavior as described above.
