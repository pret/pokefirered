# Species Reachability Audit

## Method

Reachability is determined by scanning six data sources and computing
the transitive closure over evolution chains, in-game trades, and breeding:

1. **Wild encounters** — `src/data/wild_encounters.json`
2. **In-game trades** — `src/data/ingame_trades.h`
3. **Gift / static-encounter scripts** — `data/maps/**/scripts.inc` (`givemon`, `giveegg`, `seteventmon`, `setwildbattle`, starter `setvar`)
4. **Fossil revival** — `CinnabarIsland_PokemonLab_ExperimentRoom/scripts.inc`
5. **Evolution chains** — `src/data/pokemon/evolution.h` (iterated to closure)
6. **Daycare breeding** — `src/daycare.c` (if any evolved family member is
   reachable, the base baby form is breedable; Wynaut/Azurill no longer require incense)

A species is **semi-reachable** if it can only be obtained when the
player makes a specific mutually-exclusive choice. The remaining
mutual-exclusion group consists of 12 in-game trades that all
request Mewtwo (11 scientists at Oak's Lab + Ho-Oh at Indigo
Plateau). Since only one Mewtwo exists per save, the player can
complete at most one of these trades per playthrough.

- Total species scanned: 386
- Fully reachable: 374
- Semi-reachable (choice-gated): 12
- Unreachable: 0

## Semi-Reachable Species (choice-gated)

These species are obtainable but require the player to make a
specific mutually-exclusive choice. In a single playthrough the
player cannot obtain all members of each choice group.

### Mutual-exclusion choice

| Species | Acquisition path |
|---------|------------------|
| SPECIES_MEW | In-game trade: trade SPECIES_MEWTWO for SPECIES_MEW |
| SPECIES_HO_OH | Gift/static: seteventmon in NavelRock_Summit; In-game trade: trade SPECIES_MEWTWO for SPECIES_HO_OH |
| SPECIES_CELEBI | In-game trade: trade SPECIES_MEWTWO for SPECIES_CELEBI |
| SPECIES_REGIROCK | In-game trade: trade SPECIES_MEWTWO for SPECIES_REGIROCK |
| SPECIES_REGICE | In-game trade: trade SPECIES_MEWTWO for SPECIES_REGICE |
| SPECIES_REGISTEEL | In-game trade: trade SPECIES_MEWTWO for SPECIES_REGISTEEL |
| SPECIES_KYOGRE | In-game trade: trade SPECIES_MEWTWO for SPECIES_KYOGRE |
| SPECIES_GROUDON | In-game trade: trade SPECIES_MEWTWO for SPECIES_GROUDON |
| SPECIES_RAYQUAZA | In-game trade: trade SPECIES_MEWTWO for SPECIES_RAYQUAZA |
| SPECIES_LATIAS | In-game trade: trade SPECIES_MEWTWO for SPECIES_LATIAS |
| SPECIES_LATIOS | In-game trade: trade SPECIES_MEWTWO for SPECIES_LATIOS |
| SPECIES_JIRACHI | In-game trade: trade SPECIES_MEWTWO for SPECIES_JIRACHI |

## Event-Gated Species (reachable only via event items)

These species have encounter scripts in the ROM but require
event-distributed items (Mystic Ticket, Aurora Ticket) to access.
They are counted as **reachable** since the encounter data exists.

- **SPECIES_DEOXYS**: Gift/static: seteventmon in BirthIsland_Exterior
- **SPECIES_LUGIA**: Gift/static: seteventmon in NavelRock_Base

## Unreachable Species

Each entry includes a verified explanation of why the species
cannot be obtained through any in-game source.

## Summary

| Category | Count |
|----------|-------|
| Total species | 386 |
| Fully reachable | 374 |
| Semi-reachable (choice-gated) | 12 |
| Unreachable (base forms) | 0 |
| Unreachable (blocked evolutions) | 0 |
| Total unreachable | 0 |
