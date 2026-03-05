# Corpse-run defeat flow coverage

This document tracks every known whiteout/defeat entry point in this codebase and how it reaches the canonical corpse-run initializer.

## Canonical entry

- `CorpseRunInitialization` (`src/overworld.c`): single whiteout initialization entry called by the whiteout state callback.
  - When `FEATURE_FLAG_CORPSE_RUN` is `FALSE`, preserves vanilla behavior: money loss (`RemoveMoney`), party heal (`HealPlayerParty`), and center/home respawn (`Overworld_SetWhiteoutRespawnPoint`).
  - When `FEATURE_FLAG_CORPSE_RUN` is `TRUE`, skips the vanilla money/heal/respawn calls.

## Feature flag and guards

- `FEATURE_FLAG_CORPSE_RUN` (`include/config.h`): compile-time feature flag controlling corpse-run mode.
- `IsCorpseRunFeatureEnabled` (`src/overworld.c`): helper used by whiteout handlers.
- `OverworldWhiteOutGetMoneyLoss` (`src/overworld.c`): returns `0` while corpse-run mode is enabled so whiteout text/scripts cannot use vanilla loss values.
- `CB2_WhiteOut` (`src/overworld.c`): uses `FieldCB_WarpExitFadeFromBlack` in corpse-run mode, preventing post-whiteout nurse/home scripts (`FieldCB_RushInjuredPokemonToCenter`).

## Defeat entry points intercepted

All of the following now route to `CorpseRunInitialization` through `CB2_WhiteOut -> DoWhiteOut -> CorpseRunInitialization`:

### Battle-loss callbacks (`src/battle_setup.c`)

- `CB2_EndWildBattle`
- `CB2_EndScriptedWildBattle`
- `CB2_EndMarowakBattle`
- `CB2_EndTrainerBattle` (normal trainer and early rival loss path)
- `CB2_EndRematchBattle`

### Field special (`src/post_battle_event_funcs.c`)

- `SetCB2WhiteOut` (script special used by field scripts such as field poison whiteout)

### Field scripts (`data/scripts/white_out.inc`)

- `EventScript_FieldPoison` / `EventScript_FieldWhiteOut*` call `SetCB2WhiteOut`
- same script uses `special OverworldWhiteOutGetMoneyLoss` for whiteout money text, now guarded during corpse-run mode

## Coverage checklist for future changes

When adding a new defeat/whiteout route, ensure it either:

1. Calls `SetMainCallback2(CB2_WhiteOut)`, or
2. Calls `CorpseRunInitialization` directly from the whiteout pipeline.

Also ensure no corpse-run-enabled path directly calls:

- `RemoveMoney(..., ComputeWhiteOutMoneyLoss())`
- `HealPlayerParty()` for whiteout recovery
- `Overworld_SetWhiteoutRespawnPoint()`
- `FieldCB_RushInjuredPokemonToCenter`

## Last-heal fallback behavior

- `CorpseRun_InitSalvageRespawnCheckpoint` and `CorpseRun_WarpToLastCenter` validate `gSaveBlock1Ptr->lastHealLocation` before use.
- Validation uses `GetHealLocationIndexFromMapGroupAndNum(...)`; when no matching heal location exists (for example, a run where the player has never rested), corpse-run deterministically rewrites `lastHealLocation` to Pallet Town (`MAP_PALLET_TOWN`, `x=6`, `y=8`) and then proceeds.
- This makes “never rested” behavior explicit and stable: corpse-run fallback respawn is always Pallet/home-equivalent via the Pallet heal location checkpoint.

