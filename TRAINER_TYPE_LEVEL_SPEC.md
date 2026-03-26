# Trainer Type-Level System Specification

This document describes the currently implemented trainer levels system in this repo.

## 1. Data Model

Trainer levels are persistent and saved in SaveBlock2:

- `trainerTypeExp[type]`: accumulated XP per type.
- `trainerTypeLevels[type]`: derived type level (1-100).

The system uses all 18 battle types except `TYPE_MYSTERY` for player-facing progression screens.

## 2. XP Curves and Type Tiers

Type tiers are implemented in `src/trainer_xp_system.c` and scaled by `TRAINER_TYPE_XP_SCALE = 3`.

- Fast (Bug): 7,500 XP to level 100
- Medium (Normal, Fighting, Flying, Poison, Ground, Rock, Ghost, Steel, Dark): 15,000 XP to level 100
- Medium-Slow (Fire, Water, Grass, Electric, Ice): 24,000 XP to level 100
- Slow (Psychic, Dragon): 36,000 XP to level 100

## 3. XP Sources

Verified source hooks:

- First-time seen species: +5 XP per species type slot (`FLAG_SET_SEEN` path).
- First-time caught species: +15 XP per species type slot (`FLAG_SET_CAUGHT` path).
- Move usage in battle (player side):
  - +0.5 XP to each attacker species type slot.
  - +0.5 XP to move type on successful hit.
  - +0.25 XP to move type on miss.
- Critical hit or true OHKO resolution: +1 XP to each attacker species type slot and +1 XP to move type.
- Defeating trainer Pokemon: +2 XP per fainted species type slot.
- Shiny encounter: +15 XP per encountered species type slot.

XP is slot-based. Pure types occupy both type slots and receive double credit for their one type.

## 4. Core Battle Effects Using Trainer Levels

Current gameplay hooks include:

- Accuracy bonus from trainer level in move type.
- Critical chance bonus from trainer level in move type.
- Catch rate bonus based on trainer levels in target mon types.
- Obedience checks based on trainer levels rather than vanilla badge-only thresholds.
- Type-effectiveness modulation using trainer-level composites.

## 5. Obedience Rule

`IsMonDisobedient()` uses trainer levels with badge and friendship modifiers:

1. Compute trainer obedience level from the mon's type1/type2 and current move type.
2. Add `+5` per badge earned.
3. Add friendship obedience modifier.
4. Compare against level-based threshold:
   - Own Pokemon: `ceil(level / 3)`
   - Traded Pokemon: `ceil(level / 2)`

If requirement is met, the Pokemon obeys.

## 6. NPC Trainer Levels

NPC trainer levels are computed from trainer data with support for precomputed tables and class-based adjustments. Rival progression safeguards are included.

## 7. UI

The Type Levels screen displays all non-Mystery types, their current level, and progress bar toward the next level.

## 8. Notes

- This spec reflects implemented behavior, not planned extensions.
- If code behavior changes, update this file in the same PR to avoid documentation drift.
