# Agent Lessons Learned

## Index
- [ROOT path depth](#root-path-depth) — Script in `.github/agents-meta/` needs `.parent.parent.parent` not `.parent.parent`
- [Species audit false negatives](#species-audit-false-negatives) — Many acquisition methods exist beyond `givemon`; must parse all of them
- [Semi-reachable grouping](#semi-reachable-grouping) — Transitive dependencies need BFS walk to trace back to exclusion source
- [Fossil lab multichoice complexity](#fossil-lab-multichoice-complexity) — Adding new fossils to the Cinnabar Lab fossil system requires multichoice menus, flags, and cascading check scripts
- [Pokédex check in scripts](#pokédex-check-in-scripts) — No built-in script command to check Pokédex caught flag; must create a special function wrapper
- [Conditional NPC visibility](#conditional-npc-visibility) — Use a shared hide flag + OnTransition script to show/hide NPCs based on a game event flag
- [Incense breeding removal](#incense-breeding-removal) — Make `AlterEggSpeciesWithIncenseItem()` a no-op; baby species already come from `DetermineEggSpeciesAndParentSlots()`

---

## ROOT path depth
Scripts in `.github/agents-meta/` are two directories deep under `.github`. `Path(__file__).parent.parent` resolves to `.github/`, not the project root. Use `.parent.parent.parent` for the project root.

## Species audit false negatives
The original audit only checked `givemon` in scripts and missed: `giveegg` (Togepi), `seteventmon` (legendary encounters), `setwildbattle` (scripted wilds), indirect `setvar VAR_TEMP_1` + `givemon VAR_TEMP_1` (Dojo, starters), daycare breeding (baby Pokemon), and fossil revival chains. Always check ALL acquisition methods.

## Semi-reachable grouping
When grouping semi-reachable species by their mutual-exclusion source, a simple string-match on reasons fails for transitive dependents (e.g., Venusaur → Ivysaur → Bulbasaur → starter group). Use a BFS walk through `SPECIES_X` references in reason strings to trace back to an exclusion-group member.

## Fossil lab multichoice complexity
The Cinnabar Lab fossil scientist uses multichoice menus with pre-defined combinations (Helix, Dome, Amber, Helix+Amber, Dome+Amber). Adding new fossils requires: (1) new flag pairs (`FLAG_GOT_*` + `FLAG_REVIVED_*`), (2) new multichoice list definitions in `src/script_menu.c` with text strings in `src/strings.c`, (3) new MULTICHOICE_* IDs in `include/constants/menu.h`, (4) check/choose/show/give script entries in the lab, and (5) updating the "all revived" cascading check. To avoid combinatorial explosion of combo menus, new fossils can use simple single-fossil menus and appear after existing fossils in the check chain.

## Pokédex check in scripts
No built-in script macro exists to check if a species has been caught. To check, create a C special function (`ScriptCheckSpeciesCaught`) that calls `GetSetPokedexFlag(SpeciesToNationalPokedexNum(gSpecialVar_0x8004), 0)` — mode 0 = check caught. Register in `data/specials.inc`. Use from scripts via `setvar VAR_0x8004, SPECIES_X` + `specialvar VAR_RESULT, ScriptCheckSpeciesCaught`.

## Conditional NPC visibility
To show NPCs only after a game event: (1) assign all NPCs a shared `flag` in map.json (e.g., `FLAG_HIDE_MEWTWO_TRADE_SCIENTISTS`), (2) in the map's `MAP_SCRIPT_ON_TRANSITION`, check the event flag and `clearflag`/`setflag` the hide flag accordingly. Object events are hidden when their flag is SET, visible when CLEAR. OnTransition runs before objects render, so the flag state is correct on map load.

## Incense breeding removal
To remove the incense requirement for baby Pokémon (Azurill/Wynaut): make `AlterEggSpeciesWithIncenseItem()` in `src/daycare.c` a no-op (just `return`). The function was reverting baby species back to their evolved forms when no incense was held; the correct baby species is already determined by `DetermineEggSpeciesAndParentSlots()`.
