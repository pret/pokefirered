# pokefirered — Codebase Navigation Index

Fork of [pret/pokefirered](https://github.com/pret/pokefirered) (Pokémon FireRed/LeafGreen decompilation).
This fork adds a **Trainer Type Level** system — see design docs below.

## Build

```
make                  # Build with agbcc (default, matching decomp)
make modern           # Build with arm-none-eabi-gcc (MODERN=1)
make generated        # Regenerate auto-generated headers from JSON
```

Toolchain: `agbcc` (C89 compiler) or `arm-none-eabi-gcc` with `-std=gnu99`.
Build output: `pokefirered.gba` / `pokefirered_modern.gba`.

## Fork-Specific Changes

Design docs:
- [TRAINER_TYPE_LEVEL_SPEC.md](TRAINER_TYPE_LEVEL_SPEC.md) — Full system spec
- [TRAINER_OBEDIENCE_SYSTEM.md](TRAINER_OBEDIENCE_SYSTEM.md) — Obedience rework details
- [docs/new_player_guide.md](docs/new_player_guide.md) — Player-facing gameplay guide
- [docs/pokemon_locations.md](docs/pokemon_locations.md) — Where to find every Pokémon

Changed files (vs upstream pokefirered):
- `include/global.h` — Added `trainerTypeExp[18]`, `trainerTypeLevels[18]` to SaveBlock2
- `include/strings.h` / `src/strings.c` — Added trainer type name strings, UI text
- `include/constants/flags.h` — Added trade flags (`FLAG_DID_DUSKULL_TRADE`, etc.)
- `include/constants/trade.h` — Added trade constants for new NPCs
- `include/constants/battle_string_ids.h` — Added trainer level feedback string IDs
- `src/new_game.c` — Calls `InitializeTrainerTypeLevels()` on new game
- `src/start_menu.c` — Added "TYPE LEVELS" entry to start menu
- `src/battle_script_commands.c` — Awards type XP on moves/catches/defeats; accuracy and crit bonuses; in-battle trainer level feedback messages
- `src/battle_message.c` — Trainer level feedback battle strings
- `src/battle_setup.c` — Non-ghost Pokémon Tower encounters work without Silph Scope
- `src/battle_util.c` — Obedience now uses trainer type levels instead of badges alone
- `src/trainer_card.c` — Displays top 3 trainer type levels on Trainer Card
- `src/data/wild_encounters.json` — Added Swinub, Sableye, rearranged Dark-type encounters
- `src/data/ingame_trades.h` — Added Duskull, Murkrow, and Bagon trade NPCs

New files:
- `include/trainer_xp_system.h` / `src/trainer_xp_system.c` — XP tracking, level thresholds, catch rate bonus
- `include/trainer_type_levels.h` / `src/trainer_type_levels.c` — Type levels UI screen
- `src/trainer_type_npc_levels.c` — Precomputed NPC trainer type level data

## Directory Structure

### `src/` — C source (284 files)

The game logic. Key subsystems by file prefix:

| Prefix / File | Purpose |
|---|---|
| `battle_main.c` | Battle flow: turn order, switching, fleeing |
| `battle_script_commands.c` | Implements battle script opcodes (damage calc, status, items, catching) |
| `battle_util.c` | Battle helpers: type effectiveness, stat stages, **obedience checks** |
| `battle_ai_*.c` | AI decision-making for opponent trainers |
| `battle_anim_*.c` | Move animation rendering (~25 files, one per type + effects) |
| `battle_controller_*.c` | Input/output dispatch per battler type (player, opponent, link, safari) |
| `pokemon.c` | Core Pokémon data: `GetMonData`, `SetMonData`, stat calc, evolution |
| `pokemon_storage_system.c` | PC box system |
| `wild_encounter.c` | Wild encounter tables and generation |
| `event_data.c` | Save flags/vars: `FlagGet`, `FlagSet`, `VarGet`, `VarSet` |
| `field_control_avatar.c` | Overworld player movement and tile interactions |
| `event_object_movement.c` | NPC movement patterns |
| `script.c` / `scrcmd.c` | Event script interpreter and commands |
| `new_game.c` | New-game initialization (save block zeroing, defaults) |
| `start_menu.c` | Start menu: Pokédex, Pokémon, Bag, Save, Option, **Type Levels** |
| `strings.c` | All in-game text string definitions |
| `item.c` / `item_use.c` | Item data and use-item effects |
| `overworld.c` | Main overworld state machine and map loading |
| `trainer_type_levels.c` | **[FORK]** Type levels UI screen |
| `trainer_xp_system.c` | **[FORK]** XP/level tracking, catch rate bonus |

### `include/` — Headers (216 files)

Key headers:
- `global.h` — Fundamental types, `SaveBlock1`/`SaveBlock2` structs (game save state)
- `pokemon.h` — `struct Pokemon`, `struct BoxPokemon`, species info, `GetMonData`/`SetMonData`
- `battle.h` — `struct BattleStruct`, battle state, move data
- `constants/pokemon.h` — Type IDs (`TYPE_NORMAL`=0 .. `TYPE_DARK`=17), `NUMBER_OF_MON_TYPES`
- `constants/species.h` — Species IDs, `NUM_SPECIES`
- `constants/items.h` — Item IDs
- `constants/flags.h` — Story/event flags including `FLAG_BADGE01_GET`..`FLAG_BADGE08_GET`
- `event_data.h` — `FlagGet()`, `FlagSet()`, `VarGet()`, `VarSet()`
- `strings.h` — `extern` declarations for all text strings
- `trainer_xp_system.h` — **[FORK]** `AwardTrainerTypeExp`, `GetCatchRateBonus`, etc.

### `data/` — Game data assets

- `maps/` — Per-map JSON: connections, events, headers, groups
- `layouts/` — Map tile layouts (binary `.bin` files, plus generated `.inc`)
- `scripts/` — Per-map event scripts (`.inc` assembly)
- `text/` — Per-map dialogue text (`.inc` assembly)
- `tilesets/` — Tileset graphics and palettes organized by primary/secondary
- Top-level `.s` files — Battle scripts, AI scripts, animation scripts, event scripts

### `graphics/` — Sprite/tile/UI art

Organized by feature: `pokemon/`, `trainers/`, `battle_anims/`, `items/`, `interface/`, etc.
All PNGs are converted to GBA formats (`.4bpp`, `.gbapal`, `.bin`) by the build system via `gbagfx`.

### `sound/` — Music and sound effects

- `songs/midi/` — MIDI source files
- `direct_sound_samples/` — Instrument samples and cry data
- `cry_tables.inc` — Maps species to cry sound data

### `tools/` — Build tools

| Tool | Purpose |
|---|---|
| `agbcc/` | Legacy GBA C compiler (C89, used for matching decomp builds) |
| `gbagfx` | PNG ↔ GBA tile format converter |
| `mapjson` | JSON ↔ assembly map data converter |
| `jsonproc` | JSON template processor (generates `items.h`, `wild_encounters.h`, etc.) |
| `preproc` | C preprocessor wrapper for assembly files |
| `scaninc` | Scans source files for `#include`/`.include` to generate Make dependencies |
| `ramscrgen` | Generates linker script fragments from symbol files |
| `mid2agb` | MIDI → GBA music format converter |

### Other top-level files

- `Makefile` — Main build orchestration
- `ld_script.ld` / `ld_script_modern.ld` — Linker scripts
- `charmap.txt` — Character encoding table (game uses custom character set, not ASCII)
- `sym_bss.txt`, `sym_common.txt`, `sym_ewram.txt` — Symbol address maps for RAM sections

## Conventions

- **agbcc compatibility**: All `.c` files must be valid C89 — no mid-block declarations, no `for(int i=...)`, no `//` comments in some contexts. Declare all variables at the top of each block.
- **String encoding**: Game text uses `_("...")` macro which maps through `charmap.txt`, not standard C strings.
- **Generated headers**: `src/data/items.h`, `src/data/wild_encounters.h`, `src/data/region_map/region_map_entries.h`, `include/constants/map_groups.h`, `include/constants/layouts.h` are generated from JSON via `jsonproc`/`mapjson`. Don't edit them directly — edit the `.json` source and run `make generated`.
- **SaveBlock2 layout**: Struct must remain exactly `0xF24` bytes. New fields replace filler bytes at fixed offsets.
